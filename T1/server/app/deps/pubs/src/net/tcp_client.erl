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


c(Port) ->
    spawn(fun() -> tcp_client:connect(Port, 3) end).
c(Port, MapID) ->
    spawn(fun() -> tcp_client:connect(Port, MapID) end).

nc(N, Port, MapId) ->
    lists:foreach(fun(_) -> tcp_client:c(Port, MapId), timer:sleep(1) end, lists:seq(1, N)).

connect(Port, MapID) ->
    tcp_codec:init(#net_conf{}),
    {ok, Socket} = ranch_tcp:connect({127, 0, 0, 1}, Port, [{active, false}]),
    
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

    timer:sleep(5000),

    send_msg(Socket, #pk_GS2U_GoNewMap{tarMapID = misc:rand(1,3), fX = misc:rand(500, 5000) / 10, fY = misc:rand(500, 3000) / 10}),

    timer:sleep(50),
    recv_msg(Socket),
%%    send_msg(Socket, #pk_GS2U_GoNewMap{tarMapID = MapID, fX = misc:rand(500, 5000) / 10, fY = misc:rand(500, 3000) / 10}),
    timer:sleep(300 * 60 * 1000),
    ok.

send_msg(Socket, Msg) ->
    {_Bytes1, IoList1} = tcp_codec:encode(Msg),
    ranch_tcp:send(Socket, IoList1).

recv_msg(Socket) ->
    case ranch_tcp:recv(Socket, 6, 15000) of
        {ok, Any} ->
            {Size, Left} = binary_lib:read_uint32(Any),
            {Cmd, _} = binary_lib:read_uint16(Left),
            {ok, MsgBin} = ranch_tcp:recv(Socket, Size - 6, 15000),
            {Msg, _LeftBin} = netmsg:decode(Cmd, MsgBin),
            handle(Socket, Msg),
            ok;
        _ ->
            skip
    end.


handle(_Socket, #pk_GS2U_LoginResult{result = Ret, accountID = Aid, msg = Msg}) ->
    io:format("LoginResult ~p acc ~p msg ~ts~n", [Ret, Aid, Msg]),
    ok;
handle(Socket, #pk_GS2U_CreatePlayerResult{errorCode = ErrCode, roleID = Uid}) ->
    case ErrCode of
       0 -> send_msg(Socket, #pk_U2GS_SelPlayerEnterGame{roleID = Uid});
        _-> io:format("create role failed ~p~n",[ErrCode])
    end,
    ok;
handle(Socket, #pk_GS2U_UserPlayerList{info = Info}) ->
    io:format("PlayerList ~w~n", [Info]),
    case Info of
        [] ->
            send_msg(Socket, #pk_U2GS_RequestCreatePlayer{
                name = "player" ++ integer_to_list(time:milli_seconds()),
                race = 1, career = 1,
                sex = 1, head = 1
            }),
            recv_msg(Socket);
        [#pk_UserPlayerData{roleID = RoleID} | _] ->
            send_msg(Socket, #pk_U2GS_SelPlayerEnterGame{roleID = RoleID})
    end,
    ok;
handle(_Socket, Msg) ->
    io:format("recv:~p~n", [Msg]).