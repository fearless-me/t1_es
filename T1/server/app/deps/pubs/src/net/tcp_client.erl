-module(tcp_client).
-author("Administrator").
-include("netmsg.hrl").
-include("netconf.hrl").
-include("logger.hrl").
-include("pub_common.hrl").

%% API
-export([c/1]).
-export([c/2]).
-export([nc/2]).
-export([connect/2]).
-export([handle/1,handle/2]).
-export([move/2]).

move(X, Y) ->
    tcp_codec:init(#net_conf{}),
    case ets:first(tcpc) of
        '$end_of_table' -> skip;
        Uid ->
            case ets:lookup(tcpc, Uid) of
                [{_, Socket}] ->
                    send_msg(Socket, #pk_U2GS_PlayerWalk{dst_x = X, dst_y = Y});
                _ -> skip
            end
    end,
    ok.


c(Port) -> c(Port, 1).

c(Port, MapID) -> spawn(fun() -> tcp_client:connect(Port, MapID) end).

nc(N, Port) ->
    catch ets:new(tcpc, [named_table, public, {keypos, 1},  ?ETS_RC, ?ETS_WC]),
    lists:foreach(fun(_) -> tcp_client:c(Port, 1), timer:sleep(1) end, lists:seq(1, N)).


connect(Port, _MapID) ->
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

    timer:sleep(50),
    erlang:send_after(100 * 60 * 1000, self(), exit),
    loop_recv(),

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
    case ranch_tcp:recv(Socket, 0, 15000) of
        {ok, Any0} ->
            tcp_codec:decode(fun tcp_client:handle/2, Socket, Any0),
            ok;
        _ ->
            skip
    end.

handle(_Cmd, Msg)-> handle(Msg).

handle(Msg) ->
    handle_1(Msg),
    ok.


handle_1(#pk_GS2U_LoginResult{}) ->
%%    set_aid(Aid),
    ok;
handle_1(#pk_GS2U_CreatePlayerResult{errorCode = ErrCode, uid = Uid}) ->
    case ErrCode of
        0 -> send_msg(socket(), #pk_U2GS_SelPlayerEnterGame{uid = Uid});
        _ -> io:format("create role failed ~p~n", [ErrCode])
    end,
    ok;
handle_1(#pk_GS2U_UserPlayerList{info = Info}) ->
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
handle_1(#pk_GS2U_GotoNewMap{}) ->
    case get_aid() of
        undefined ->
            send_msg(socket(), #pk_U2GS_GetPlayerInitData{});
        _ -> skip
    end,
    ok;
handle_1(#pk_GS2U_PlayerInitBase{uid = Uid}) ->
    set_aid(Uid),
    ets:insert(tcpc, {Uid, socket()}),
    ok;
handle_1(#pk_GS2U_GetPlayerInitDataEnd{}) ->
    Delta = misc:rand(5, 15)/1.0,
    send_msg(socket(), #pk_U2GS_PlayerWalk{dst_x = 234.1 + Delta, dst_y = 250.1 + Delta}),
    ok;
handle_1(Msg) ->
    io:format("~p~n", [Msg]).

-define(SocketKey, socketRef___).
socket(Socket) -> put(?SocketKey, Socket).
socket() -> get(?SocketKey).

set_aid(Aid) -> put('AID', Aid).
get_aid() -> get('AID').