%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 07. 五月 2018 15:29
%%%-------------------------------------------------------------------
-module(tcp_codec).
-author("mawenhong").

-include("type.hrl").
-include("netconf.hrl").
-include("logger.hrl").

%% API
-export([init/1, encode/1, decode/3]).
-export([get_conf/0]).
-export([get_buffer/0]).
-define(COMPRESS_FLAG, 30).


-define(NetBuff, netBuff___).
-define(NetConf, netConf___).

%%%-------------------------------------------------------------------
init(#net_conf{} = Conf) ->
    set_buffer(<<>>),
    set_conf(Conf),
    ok.

%%%-------------------------------------------------------------------
-spec encode(Msg :: any()) -> {Len, IoList}
    when Len :: integer(), IoList :: iolist().
encode(Msg) ->
    #net_conf{
        compress_bytes = ComBytes,
        hdr_size_bytes = HeaderSize
    } = get_conf(),
    try
        MsgDataList = netmsg:encode(Msg),
        IoListBytes = erlang:iolist_size(MsgDataList),
        compress(ComBytes, IoListBytes, MsgDataList, HeaderSize)
    catch _ : Err ->
        ?ERROR("encode msg ~p, error ~p stack ~p",[Msg, Err, misc:stacktrace()])
    end.

compress(ComBytes, IoListBytes, IoList, HeaderSize) when ComBytes =< 0; ComBytes > IoListBytes->
    add_header(IoList, IoListBytes, HeaderSize);
compress(_ComBytes, IoListBytes, IoList, HeaderSize) ->
    Bin0 = iolist_to_binary(IoList),
    Bin1 = zlib:compress(Bin0),
    Bytes = erlang:byte_size(Bin1),
    ?WARN("msg compressed ~p -> ~p = ~p%",
        [IoListBytes, Bytes, trunc(Bytes / IoListBytes * 10000)/100]),
    add_header(Bin1, marshal_msg_len(Bytes), HeaderSize).


%%%-------------------------------------------------------------------
decode(Handler, Socket, Bin) ->
    {NewMsg, _NewMsgSize} = merge_binary(Bin),
    set_buffer(<<>>),
    decode1(Handler, Socket, NewMsg),
    ok.

uncompress(0, Bin) -> Bin;
uncompress(_, Bin) -> zlib:uncompress(Bin).

real_msg_len(Len) ->  Len band (bnot (1 bsl ?COMPRESS_FLAG)).
marshal_msg_len(Len) -> (Len bsr ?COMPRESS_FLAG) bor 0.
is_compressed(Len) -> Len band (1 bsl ?COMPRESS_FLAG ).


%%%-------------------------------------------------------------------
%%%-------------------------------------------------------------------
%%解析网络消息
decode1(_Handler, _Socket, <<>>) ->
    ok;
decode1(Handler, Socket, Bin) ->
    Ret = parse_msg(get_conf(), Bin),
    case Ret of
        {ok, Cmd, Pk, RemainBin} ->
            catch Handler(Cmd, Pk),
            decode1(Handler, Socket, RemainBin);
        {halfMsg, HalfMsg} ->
            set_buffer(HalfMsg);
        {error, DataSize, Why} ->
            {IP, Port} = misc:peername(Socket),
            ?ERROR("recv socket[~p] IP:~ts Port:~p, DataSize[~p] error[~s]", [Socket, IP, Port, DataSize, Why]),
            %%收到异常消息，断开连接
            %%直接close，由throw后，exception去处理
            throw(Ret)
    end.

parse_msg(#net_conf{
    max_msg_bytes = MaxMsgBytes,
    cmd_id_bytes = CmdIDBytes,
    hdr_size_bytes = HeaderSizeBytes}, MsgBuff
) when erlang:is_binary(MsgBuff) ->
%%    
    MsgByteSize = erlang:byte_size(MsgBuff),

    %%一个逻辑包的最小长度
    MinMsgByteSize = HeaderSizeBytes + CmdIDBytes,
    case MsgByteSize >= MinMsgByteSize of
        true ->
            {Len0, RemainBin} = read_msg_size(HeaderSizeBytes, MsgBuff),
            Len = real_msg_len(Len0),
            case (Len >= MinMsgByteSize) andalso (Len =< MaxMsgBytes) of
                true when Len > MsgByteSize -> %半包
                    {halfMsg, MsgBuff};
                true -> %%多于一个包 | 正常的单个包
                    MsgBytes = Len - HeaderSizeBytes,
                    <<MsgBin:MsgBytes/binary, LeftBin/binary>> = RemainBin,
                    {Cmd, Msg, _} = read_one_msg(CmdIDBytes, uncompress(is_compressed(Len0),MsgBin)),
                    {ok, Cmd, Msg, LeftBin};
                false -> %错误
                    try
                        {Cmd, _} = read_msg_id(CmdIDBytes, RemainBin),
                        ErrorMsg = io_lib:format("Error Msg[~p][~ts] Len:~p",
                            [Cmd, netmsgCmdStr:getNetMsgCmdStr(Cmd), Len]),
                        {error, MsgByteSize, ErrorMsg}
                    catch
                        _:_ ->
                            ErrorMsg1 = io_lib:format("Error Msg Len:~p", [Len]),
                            {error, MsgByteSize, ErrorMsg1}
                    end
            end;
        false -> %包头大小不满足，半包
            {halfMsg, MsgBuff}
    end.

%%拼接之前收到的半包
-spec merge_binary(DataBin) -> {NewMsg, NewMsgSize} when
    DataBin :: binary(), NewMsg :: binary(), NewMsgSize :: uint().
merge_binary(DataBin) ->
    HalfMsg = get_buffer(),
    MsgSize = erlang:byte_size(DataBin),
    HalfMsgSize = erlang:byte_size(HalfMsg),
    case HalfMsgSize > 0 of
        true ->
            %%有半包未处理，拼接起来，size加上
            {<<HalfMsg/binary, DataBin/binary>>, HalfMsgSize + MsgSize};
        false ->
            %%没有半包
            {DataBin, MsgSize}
    end.


read_one_msg(2, Bin) ->
    {Cmd, LeftBin} = binary_lib:read_uint16(Bin),
    {Msg, Remain} = netmsg:decode(Cmd, LeftBin),
    {Cmd, Msg, Remain};
read_one_msg(4, Bin) ->
    {Cmd, LeftBin} = binary_lib:read_uint32(Bin),
    {Msg, Remain} = netmsg:decode(Cmd, LeftBin),
    {Cmd, Msg, Remain}.

%%解析网络包的长度
-spec read_msg_size(PacketLen, NewMsg) -> {IsEncode, Len, RemainBin} when
    PacketLen :: uint(), NewMsg :: binary(), IsEncode :: boolean(), Len :: uint(), RemainBin :: binary().
read_msg_size(2, NewMsg) ->
    binary_lib:read_uint16(NewMsg);
read_msg_size(4, NewMsg) ->
    binary_lib:read_uint32(NewMsg).


read_msg_id(2, Bin) ->
    binary_lib:read_uint16(Bin);
read_msg_id(4, Bin) ->
    binary_lib:read_uint32(Bin).

%%网络消息发送前，添加包头
-spec add_header(Data :: iodata(), IoListSize :: non_neg_integer(), HeadSize :: non_neg_integer()) ->
    {Len :: non_neg_integer(), list()}.
add_header(Data, IoListSize, 2) ->
    Len = IoListSize + 2,
    {Len, [<<Len:?U16>> | Data]};
add_header(Data, IoListSize, 4) ->
    Len = IoListSize + 4,
    {Len, [<<Len:?U32>> | Data]}.

%%%-------------------------------------------------------------------
get_buffer() -> get(?NetBuff).
set_buffer(Buffer) -> put(?NetBuff, Buffer).

get_conf() -> get(?NetConf).
set_conf(Conf) -> put(?NetConf, Conf).