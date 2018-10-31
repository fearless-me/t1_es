-module(tcp_client).
-author("Administrator").
-include("logger.hrl").
-include("pub_def.hrl").
-include("netmsg.hrl").
-include("netconf.hrl").
-define(HeartBeat, 15000).

%% API
-export([ensure/0]).
-export([c/1]).
-export([c/2]).
-export([nc/2]).
-export([connect/2]).
-export([handle/1, handle/2]).
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


c(Port) -> c(Port, 0).

c(Port, AccountIdx) ->
    spawn(fun() -> tcp_client:connect(Port, AccountIdx) end).


nc(N, Port) ->
    catch ets:new(tcpc, [named_table, public, {keypos, 1}, ?ETS_RC, ?ETS_WC]),
    lists:foreach(fun(_) -> tcp_client:c(Port, 0), timer:sleep(2) end, lists:seq(1, N)).

nc(N, Port, Interval) ->
    catch ets:new(tcpc, [named_table, public, {keypos, 1}, ?ETS_RC, ?ETS_WC]),
    lists:foreach(fun(_) -> tcp_client:c(Port, 0), timer:sleep(Interval) end, lists:seq(1, N)).

ensure() ->
    true = misc:start_all_app(kernel),
    true = misc:start_all_app(ssl),
    true = misc:start_all_app(stdlib),
    true = misc:start_all_app(ranch),
    true = loggerS:start("tcp_client"),
    true = misc:start_all_app(fly),
    ok.


connect(Port, AccountIdx) ->
    try
        tcp_codec:init(#net_conf{}),
        
        {ok, Socket} = ranch_tcp:connect({127, 0, 0, 1}, Port, [{active, false}]),
        socket(Socket),
        Idx = case AccountIdx of
                  0 -> misc_time:milli_seconds();
                  _ -> AccountIdx
              end,
        Msg1 = #pk_U2GS_Login_Normal{
            platformAccount = "test_net" ++ integer_to_list(Idx),
            platformName = "test",
            platformNickName = "",
            time = misc_time:utc_seconds(),
            sign = "owner"
        },
        
        send_msg(Socket, Msg1),
        recv_msg(Socket),
        
        recv_msg(Socket),
        
        timer:sleep(15000),
        
        timer:sleep(50),
        erlang:send_after(1000 * 60 * 1000, self(), exit),
        loop_recv(),
        ?WARN("socket ~p, pid ~p bye~~!", [socket(), self()]),
        ok
    catch
        _ : Err: _ ->
            ?ERROR("socket ~p, pid ~p err ~p bye~~!", [socket(), self(), Err])
    end,
    
    ok.

loop_recv() ->
    receive
        exit ->
            gen_tcp:close(socket()),
            ok
    after ?HeartBeat ->
        heartbeat(),
        recv_msg(socket()),
        timer:sleep(50),
        loop_recv()
    end.

send_msg(Socket, Msg) ->
    {_Bytes1, IoList1} = tcp_codec:encode(Msg),
    ?DEBUG("send: ~w", [Msg]),
    ranch_tcp:send(Socket, IoList1).


recv_msg(Socket) ->
    case ranch_tcp:recv(Socket, 0, 5000) of
        {ok, Any0} ->
            tcp_codec:decode(fun tcp_client:handle/2, Socket, Any0),
            ok;
        {error, Reason} when Reason =/= timeout ->
            throw(Reason);
        _ ->
            skip
    end.

handle(_Cmd, Msg) -> handle(Msg).

handle(Msg) ->
    handle_1(Msg),
    ok.


handle_1(#pk_GS2U_LoginResult{}) ->
%%    set_aid(Aid),
    ok;
handle_1(#pk_GS2U_CreatePlayerResult{errorCode = ErrCode, uid = Uid}) ->
    case ErrCode of
        0 -> send_msg(socket(), #pk_U2GS_SelPlayerEnterGame{uid = Uid});
        _ -> ?ERROR("create role failed ~p~n", [ErrCode])
    end,
    ok;
handle_1(#pk_GS2U_UserPlayerList{info = Info}) ->
    case Info of
        [] ->
            send_msg(socket(), #pk_U2GS_RequestCreatePlayer{
                name = "player" ++ integer_to_list(misc_time:milli_seconds()),
                race = 1, career = 1,
                sex = 1, head = 1
            }),
            recv_msg(socket());
        [#pk_UserPlayerData{uid = RoleID} | _] ->
            send_msg(socket(), #pk_U2GS_SelPlayerEnterGame{uid = RoleID}),
            recv_msg(socket())
    end,
    ok;
handle_1(#pk_GS2U_GotoNewMap{map_id = MapId}) ->
    set_mid(MapId),
    ?INFO("~p GS2U_GotoNewMap ~p", [self(), MapId]),
    case get_aid() of
        undefined ->
            send_msg(socket(), #pk_U2GS_GetPlayerInitData{});
        _ -> rand_walk()
    end,
    ok;
handle_1(#pk_GS2U_PlayerInitBase{uid = Uid}) ->
    set_aid(Uid),
    ets:insert(tcpc, {Uid, socket()}),
    ok;
handle_1(#pk_GS2U_GetPlayerInitDataEnd{}) ->
    rand_walk(),
    ok;
handle_1(Msg) ->
    ?WARN("recv: ~w", [Msg]).

-define(SocketKey, socketRef___).
socket(Socket) -> put(?SocketKey, Socket).
socket() -> get(?SocketKey).

set_aid(Aid) -> put('AID', Aid).
get_aid() -> get('AID').

set_mid(Mid) -> put('MID', Mid).
get_mid() -> get('MID').

heartbeat() ->
    Msg = #pk_U2GS_HearBeat{},
    send_msg(socket(), Msg),
    ChangeMap = heartbeatcount(),
    MapId = get_mid(),
    case get_aid() of
        undefined -> skip;
        _ when ChangeMap, MapId =/= 2 ->
            ?INFO("##### ~p change map ~p -> 2", [self(), MapId]),
            Msg2 = #pk_U2GS_ChangeMap{map_id = 2, x = 324.1, y = 233.5},
            send_msg(socket(), Msg2);
        _ when ChangeMap, MapId =/= 1 ->
            ?INFO("##### ~p change map ~p -> 1", [self(), MapId]),
            Msg2 = #pk_U2GS_ChangeMap{map_id = 1, x = 324.1, y = 233.5},
            send_msg(socket(), Msg2);
        _ ->
            rand_walk()
    end,
    ok.

heartbeatcount() ->
    case get(heartbeatcount) of
        undefined -> put(heartbeatcount, 1);
        V -> put(heartbeatcount, V + 1), V rem (60 * 1000 div ?HeartBeat) == 0
    end.

rand_walk() ->
    Delta =
        case rand_tool:rand(1, 10) rem 2 == 0 of
            true -> misc:rand(-5, 20) / 1.0;
            _Any -> misc:rand(-20, 20) / 1.0
        end,
    
    send_msg(socket(), #pk_U2GS_PlayerWalk{dst_x = 324.1 + Delta, dst_y = 233.1 + Delta}),
    ok.