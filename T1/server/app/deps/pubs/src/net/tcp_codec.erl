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
        hdr_size_bytes = HeaderSize
    } = get_conf(),
    MsgDataList = netmsg:encode(Msg),
    add_header(MsgDataList, HeaderSize).

%%%-------------------------------------------------------------------
decode(Handler, Socket, Bin) ->
    {NewMsg, _NewMsgSize} = merge_binary(Bin),
    set_buffer(<<>>),
    decode1(Handler, Socket, NewMsg),
    ok.

%%%-------------------------------------------------------------------
%%%-------------------------------------------------------------------
%%解析网络消息
decode1(_Handler, _Socket, <<>>) ->
    ok;
decode1(Handler, Socket, Bin) ->
    Ret = parse_msg(get_conf(), Bin),
    case Ret of
        {ok, Cmd, Pk, RemainBin} ->
            catch Handler({Cmd, Pk}),
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
            {Len, RemainBin} = read_msg_size(HeaderSizeBytes, MsgBuff),
            case (Len >= MinMsgByteSize) andalso (Len =< MaxMsgBytes) of
                true when Len > MsgByteSize -> %半包
                    {halfMsg, MsgBuff};
                true -> %%多于一个包 | 正常的单个包
                    {Cmd, Msg, LeftBin} = read_one_msg(CmdIDBytes, RemainBin),
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
-spec add_header(List, _HeadSize) -> {Len, list()} when Len :: uint(), List :: list().
add_header(List, 2) ->
    Len = erlang:iolist_size(List) + 2,
    {Len, [<<Len:?U16>> | List]};
add_header(List, 4) ->
    Len = erlang:iolist_size(List) + 4,
    {Len, [<<Len:?U32>> | List]}.

%%%-------------------------------------------------------------------
get_buffer() -> get(?NetBuff).
set_buffer(Buffer) -> put(?NetBuff, Buffer).

get_conf() -> get(?NetConf).
set_conf(Conf) -> put(?NetConf, Conf).