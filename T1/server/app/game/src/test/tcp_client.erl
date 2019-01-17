-module(tcp_client).
-author("Administrator").
-include("logger.hrl").
-include("pub_def.hrl").
-include("netmsg.hrl").
-include("netconf.hrl").
-include("battle_prop.hrl").
-define(HeartBeat, 1000).
%%
%%%% API
%%-export([ensure/0]).
%%-export([c/1]).
%%-export([c/2]).
%%-export([nc/2, nc/3]).
%%-export([connect/2]).
%%-export([handle/1, handle/2]).
%%-export([move/2]).
%%-export([close/1]).
%%
%%move(X, Y) ->
%%    tcp_codec:init(#net_conf{}),
%%    case ets:first(tcpc) of
%%        '$end_of_table' -> skip;
%%        Uid ->
%%            case ets:lookup(tcpc, Uid) of
%%                [{_, Socket}] ->
%%                    send_msg(Socket, #pk_U2GS_PlayerWalk{dst_x = X, dst_y = Y});
%%                _ -> skip
%%            end
%%    end,
%%    ok.
%%
%%close(0) ->
%%    ets:foldl
%%    (
%%        fun({_, Socket}, _)->
%%            gen_tcp:close(Socket)
%%        end,
%%        0,
%%        tcpc
%%    );
%%close(N) ->
%%    ets:foldl
%%    (
%%        fun
%%            ({_, Socket}, X1) when X1 < N ->
%%                gen_tcp:close(Socket), X1+1;
%%            (_, X2) -> X2+1
%%        end,
%%        0,
%%        tcpc
%%    ),
%%    ok.
%%
%%
%%c(Port) ->
%%    c(Port, misc_time:milli_seconds()).
%%
%%c(Port, AccountIdx) ->
%%    spawn(fun() -> tcp_client:connect(Port, AccountIdx) end).
%%
%%
%%nc(N, Port) -> nc(N, Port, 10).
%%
%%nc(N, Port, Interval) ->
%%    catch ets:new(tcpc, [named_table, public, {keypos, 1}, ?ETS_RC, ?ETS_WC]),
%%    erlang:spawn
%%    (
%%        fun() ->
%%            lists:foreach
%%            (
%%                fun(_) ->
%%                    tcp_client:c(Port, misc_time:micro_seconds()),
%%                    timer:sleep(Interval)
%%                end,
%%                lists:seq(1, N)
%%            )
%%        end
%%    ).
%%
%%ensure() ->
%%    true = misc:start_all_app(kernel),
%%    true = misc:start_all_app(ssl),
%%    true = misc:start_all_app(stdlib),
%%    true = misc:start_all_app(ranch),
%%    true = fastlog:start("tcp_client"),
%%    true = misc:start_all_app(fly),
%%    ok.
%%
%%
%%connect(Port, AccountIdx) ->
%%    try
%%        tcp_codec:init(#net_conf{}),
%%
%%        {ok, Socket} = ranch_tcp:connect({127, 0, 0, 1}, Port, [{active, false}]),
%%        socket(Socket),
%%        Msg1 = #pk_U2GS_Login_Normal{
%%            platformAccount = "c" ++ integer_to_list(AccountIdx),
%%            platformName = "test",
%%            platformNickName = "",
%%            time = misc_time:utc_seconds(),
%%            sign = "owner"
%%        },
%%
%%        send_msg(Socket, Msg1),
%%        recv_msg(Socket),
%%
%%        recv_msg(Socket),
%%
%%        timer:sleep(15000),
%%
%%        timer:sleep(50),
%%        erlang:send_after(1000 * 60 * 1000, self(), exit),
%%        loop_recv(),
%%        ?WARN("socket ~p, pid ~p bye~~!", [socket(), self()]),
%%        ok
%%    catch _ : Err: _ ->
%%            catch misc_ets:delete(tcpc, get_uid()),
%%            ?ERROR
%%            (
%%                "player ~p of account ~p socket ~p, pid ~p err ~p bye~~!",
%%                [get_uid(), get_aid(), socket(), self(), Err]
%%            )
%%    end,
%%
%%    ok.
%%
%%loop_recv() ->
%%    receive
%%        exit ->
%%            gen_tcp:close(socket()),
%%            ok
%%    after ?HeartBeat ->
%%        heartbeat(),
%%        recv_msg(socket()),
%%        timer:sleep(50),
%%        loop_recv()
%%    end.
%%
%%send_msg(Socket, Msg) ->
%%    {_Bytes1, IoList1} = tcp_codec:encode(Msg),
%%    ?DEBUG("send: ~w", [Msg]),
%%    ranch_tcp:send(Socket, IoList1).
%%
%%
%%recv_msg(Socket) ->
%%    case ranch_tcp:recv(Socket, 0, 5000) of
%%        {ok, Any0} ->
%%            tcp_codec:decode(fun tcp_client:handle/2, Socket, Any0),
%%            ok;
%%        {error, Reason} when Reason =/= timeout ->
%%            throw(Reason);
%%        _ ->
%%            skip
%%    end.
%%
%%handle(_Cmd, Msg) -> handle(Msg).
%%
%%handle(Msg) ->
%%    handle_1(Msg),
%%    ok.
%%
%%
%%handle_1(#pk_GS2U_LoginResult{aid = Aid}) ->
%%    set_aid(Aid),
%%    ok;
%%handle_1(#pk_GS2U_CreatePlayerResult{errorCode = ErrCode, uid = Uid}) ->
%%    case ErrCode of
%%        0 -> send_msg(socket(), #pk_U2GS_SelPlayerEnterGame{uid = Uid});
%%        _ -> ?ERROR("create role failed ~p~n", [ErrCode])
%%    end,
%%    ok;
%%handle_1(#pk_GS2U_UserPlayerList{info = Info}) ->
%%    case Info of
%%        [] ->
%%            send_msg(socket(), #pk_U2GS_RequestCreatePlayer{
%%                name = "player" ++ integer_to_list(misc_time:milli_seconds()),
%%                race = 1, career = 1,
%%                sex = 1, head = 1
%%            }),
%%            recv_msg(socket());
%%        [#pk_UserPlayerData{uid = RoleID} | _] ->
%%            send_msg(socket(), #pk_U2GS_SelPlayerEnterGame{uid = RoleID}),
%%            recv_msg(socket())
%%    end,
%%    ok;
%%handle_1(#pk_GS2U_GotoNewMap{map_id = MapId}) ->
%%    set_mid(MapId),
%%    ?INFO("~p GS2U_GotoNewMap ~p", [self(), MapId]),
%%    case get_uid() of
%%        undefined ->
%%            send_msg(socket(), #pk_U2GS_GetPlayerInitData{});
%%        _ -> rand_walk()
%%    end,
%%    ok;
%%handle_1(#pk_GS2U_PlayerInitBase{uid = Uid}) ->
%%    set_uid(Uid),
%%    ets:insert(tcpc, {Uid, socket()}),
%%    ok;
%%handle_1(#pk_GS2U_GetPlayerInitDataEnd{}) ->
%%    rand_walk(),
%%    ok;
%%handle_1(_Msg) -> ok.
%%%%    ?WARN("recv: ~w", [Msg]).
%%
%%-define(SocketKey, socketRef___).
%%socket(Socket) -> put(?SocketKey, Socket).
%%socket() -> get(?SocketKey).
%%
%%set_aid(Aid) -> put('AID', Aid).
%%get_aid() -> get('AID').
%%
%%set_uid(Uid) -> put('UID', Uid).
%%get_uid() -> get('UID').
%%
%%set_mid(Mid) -> put('MID', Mid).
%%get_mid() -> get('MID').
%%
%%heartbeat() ->
%%    Msg1 = #pk_U2GS_HearBeat{},
%%    send_msg(socket(), Msg1),
%%    HeartbeatCount = heartbeatcount(),
%%    MapId = get_mid(),
%%    CanChangeMap = (HeartbeatCount rem 60) == 0,
%%    case get_uid() of
%%        undefined -> skip;
%%        _ when CanChangeMap, MapId =/= 2 ->
%%            case getCfg:getCfgByArgs(cfg_map, 2) of
%%                [] -> skip;
%%                {} -> skip;
%%                _ ->
%%                    ?INFO("##### ~p change map ~p -> 2", [self(), MapId]),
%%                    Msg2 = #pk_U2GS_ChangeMap{map_id = 2, x = 324.1, y = 233.5},
%%                    send_msg(socket(), Msg2)
%%            end;
%%        _ when CanChangeMap, MapId =/= 3 ->
%%            ?INFO("##### ~p change map ~p -> 1", [self(), MapId]),
%%            Msg3 = #pk_U2GS_ChangeMap{map_id = 3, x = 324.1, y = 233.5},
%%            send_msg(socket(), Msg3);
%%        _ when HeartbeatCount rem 2 == 0 ->
%%            Msg4 = #pk_U2GS_Chat{content = io_lib:format("&add_bp ~p ~p ~p",
%%                [rand_tool:rand(0, 1), ?BPUseType_ADD, rand_tool:rand(-10, 10) * 1.1])},
%%            send_msg(socket(), Msg4),
%%            ok;
%%%%            ?INFO("~ts",[Msg4#pk_U2GS_Chat.content]);
%%        _ ->
%%            rand_walk()
%%    end,
%%    ok.
%%
%%
%%heartbeatcount() ->
%%    V = misc:get_dict_def(heartbeatcount, 0) + 1,
%%    put(heartbeatcount, V),
%%    V.
%%
%%rand_walk() ->
%%    PosList = [{243.2, 209.1}, {324.01, 138.49}, {324.1, 225.1}],
%%    N = rand_tool:rand(1, erlang:length(PosList)),
%%    {PosX, PosY} = lists:nth(N, PosList),
%%
%%    Delta = rand_tool:rand(-10, 15),
%%
%%    send_msg(socket(), #pk_U2GS_PlayerWalk{dst_x = PosX + Delta, dst_y = PosY + Delta}),
%%    ok.