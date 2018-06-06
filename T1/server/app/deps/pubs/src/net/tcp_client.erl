-module(tcp_client).
-author("Administrator").
-include("netmsg.hrl").
-include("netconf.hrl").
-include("logger.hrl").

%% API
-export([c/1]).
-export([c/2]).
-export([nc/3]).
-export([connect/2]).
-export([handle/1]).


c(Port) ->
    spawn(fun() -> tcp_client:connect(Port, 3) end).
c(Port, MapID) ->
    spawn(fun() -> tcp_client:connect(Port, MapID) end).

nc(N, Port, MapId) ->
    lists:foreach(fun(_) -> tcp_client:c(Port, MapId), timer:sleep(1) end, lists:seq(1, N)).

connect(Port, MapID) ->
    tcp_codec:init(#net_conf{}),

    {ok, Socket} = ranch_tcp:connect({127, 0, 0, 1}, Port, [{active, false}]),
    socket(Socket),
    Msg1 = #pk_U2GS_Login_Normal{
        platformAccount = "test_net" ++ integer_to_list(time:milli_seconds()),
        platformName = "test",
        platformNickName = "",
        time = time:utc_seconds(),
        sign = "owner"
    },

    send_msg(Socket, Msg1),
    recv_msg(Socket),

    recv_msg(Socket),

    timer:sleep(15000),

    send_msg(Socket, #pk_GS2U_GotoNewMap{map_id = misc:rand(1, 4), x = misc:rand(500, 5000) / 10, y = misc:rand(500, 3000) / 10}),

    timer:sleep(50),
    Pid = self(),
    erlang:send_after(10 * 60 * 1000, self(), exit),
    loop_recv(),
%%    send_msg(Socket, #pk_GS2U_GoNewMap{tarMapID = MapID, fX = misc:rand(500, 5000) / 10, fY = misc:rand(500, 3000) / 10}),

    ok.

loop_recv() ->
    receive
        exit ->
            gen_tcp:close(socket()),
            ok
    after 0 ->
        recv_msg(socket()),
        timer:sleep(50),
        loop_recv()
    end.

send_msg(Socket, Msg) ->
    {_Bytes1, IoList1} = tcp_codec:encode(Msg),
    io:format("~p~n", [iolist_to_binary(IoList1)]),
    ranch_tcp:send(Socket, IoList1).

recv_msg(Socket) ->
    case ranch_tcp:recv(Socket, 6, 15000) of
        {ok, Any} ->
            {Size, Left} = binary_lib:read_uint32(Any),
            {Cmd, _} = binary_lib:read_uint16(Left),
            {ok, MsgBin} = ranch_tcp:recv(Socket, Size - 6, 15000),
            {Msg, _LeftBin} = netmsg:decode(Cmd, MsgBin),
            tcp_client:handle(Msg),
            ok;
        _ ->
            skip
    end.


handle(#pk_GS2U_LoginResult{result = Ret, aid = Aid, msg = Msg}) ->
    io:format("LoginResult ~p acc ~p msg ~ts~n", [Ret, Aid, Msg]),
    ok;
handle(#pk_GS2U_CreatePlayerResult{errorCode = ErrCode, uid = Uid}) ->
    case ErrCode of
        0 -> send_msg(socket(), #pk_U2GS_SelPlayerEnterGame{uid = Uid});
        _ -> io:format("create role failed ~p~n", [ErrCode])
    end,
    ok;
handle(#pk_GS2U_UserPlayerList{info = Info}) ->
    io:format("PlayerList ~w~n", [Info]),
    case Info of
        [] ->
            send_msg(socket(), #pk_U2GS_RequestCreatePlayer{
                name = "player" ++ integer_to_list(time:milli_seconds()),
                race = 1, career = 1,
                sex = 1, head = 1
            }),
            recv_msg(socket());
        [#pk_UserPlayerData{uid = RoleID} | _] ->
            send_msg(socket(), #pk_U2GS_SelPlayerEnterGame{uid = RoleID}),
            recv_msg(socket())
    end,
    ok;
handle(Msg) ->
    io:format("recv:~p~n", [Msg]).

-define(SocketKey, socketRef___).
socket(Socket) -> put(?SocketKey, Socket).
socket() -> get(?SocketKey).