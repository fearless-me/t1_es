%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 04. 一月 2018 20:09
%%%-------------------------------------------------------------------
-module(mysql_load).
-author("mawenhong").
-include("dbs_private.hrl").
-include("logger.hrl").
%% API
-export([
    init_db/2,load_and_save/1, player_init/1,
    fls/2, fl/2, r/0,
    worker_dispatcher/0,init_default/0
]).

worker_dispatcher()->
    erlang:spawn(fun()-> dispatcher() end).
    
dispatcher()->
    CN = [10, 50, 100, 200],
    OP = [10, 50, 100, 1000, 10000,100000,500000],
    ?WARN("start dispatcher~-40s....",[""]),
    lists:foreach(fun(C)-> call_dispatcher(C, OP) end, CN),
    ?WARN("dispatcher done"),
    ok.
call_dispatcher(_C, [])-> skip;
call_dispatcher(C, [Op| Ops])->
    call_dispatcher_1(C, Op),
    call_dispatcher(C, Ops).

call_dispatcher_1(C, WR)->
    NowMs = os:system_time(milli_seconds),
    L0 = lists:seq(1, C),
    L1 = [task:async(fun() -> do_call_1(WR) end) || _C <- L0],
    [task:await(Task, infinity) || Task <- L1],
    DiffMs = erlang:max(os:system_time(milli_seconds) - NowMs, 1),
    ?WARN("call_dispatcher.c:~.8w, wr:~.10w, diff:~.8w, qps:~.2p",
        [C, C * WR, DiffMs, C * WR / DiffMs * 1000]),
    ok.

do_call_1(0 )-> ok;
do_call_1(Count)->
    Pid = dbs_worker_manager:get_worker_pid(rand:uniform(100000)),
    dbs_worker:status(Pid),
    do_call_1(Count - 1).

%%--

r()->

    erlang:spawn(fun()-> r_1() end).

r_1() ->
    CN = [10, 50, 100, 200],
    OP = [10, 50, 100, 1000, 10000],
    init_default(),
    lists:foreach(fun(C)-> rfl(C, OP) end, CN),
    lists:foreach(fun(C)-> rfls(C, OP) end, CN),
    ok.


rfl(_C, [])-> ok;
rfl(C, [Op | Ops])-> fl(C, Op), rfl(C, Ops).

rfls(_C, [])-> ok;
rfls(C, [Op | Ops])-> fls(C, Op), rfls(C, Ops).



fl(C, WR) ->
    NowMs = os:system_time(milli_seconds),
    L0 = lists:seq(1, C),
    L1 = [task:async(fun() -> loop_load_save(WR, false) end) || _C <- L0],
    [task:await(Task, infinity) || Task <- L1],
    DiffMs = erlang:max(os:system_time(milli_seconds) - NowMs, 1),
    Total = C * WR,
    ?WARN("l.c:~.8w, r/w:~.10w, diff:~.8w, qps:~p",
        [C, Total, DiffMs, Total / DiffMs * 1000]),
    ok.

fls(C, WR) ->
    NowMs = os:system_time(milli_seconds),
    L0 = lists:seq(1, C),
    L1 = [task:async(fun() -> loop_load_save(WR, true) end) || _C <- L0],
    [task:await(Task, infinity) || Task <- L1],
    DiffMs = erlang:max(os:system_time(milli_seconds) - NowMs, 1),
    Total = C * WR * 2,
    ?WARN("ls.c:~.8w, rw:~.10w, diff:~.8w, qps:~p",
        [C, Total, DiffMs, Total / DiffMs * 1000]),
    ok.

loop_load_save(0, _NeedSave) -> skip;
loop_load_save(C, NeedSave) ->
    load_and_save(NeedSave),
    timer:sleep(10),
    loop_load_save(C - 1, NeedSave).

load_and_save(NeedSave) ->
    PlayerID = rand:uniform(10000000),
    PlayerData = mod_player_load_save:load_player(PlayerID),
    %  io:format("load[~p]=~w~n",[PlayerID, PlayerData]),
    case PlayerData of
        #player_data{} when NeedSave ->
            try
                mod_player_load_save:save_player(
                    PlayerData#player_data{data_version = nowNano()}
                )
            catch
               _ : Reason : _ST ->  ?ERROR("save player error ~p",[Reason])
            end ;
        #player_data{} ->
            skip;
        _ ->
            player_init(PlayerID)
    end,
    ok.


init_db(X, N) ->
    N1 = (N div X)* X,
    erlang:spawn(fun()-> init_db_1(X, N1)end).

init_db_1(X, N) ->
    init_default(),
    NowMs = os:system_time(milli_seconds),
    L0 = lists:seq(1, X),
    L1 =  [task:async(fun() -> do_init((C-1) * (N), N div X) end) || C <- L0],
    [task:await(Task, infinity) || Task <- L1],
    DiffMs = erlang:max(os:system_time(milli_seconds) - NowMs, 1),
    ?WARN("insert ~w, diff:~w,qps:~w",[N, DiffMs, erlang:trunc(N / DiffMs * 1000)]),
    ok.

init_default()->
    case ets:info(default_bin, type) of
       undefined ->
           {ok, Data} = file:read_file("data.bin"),
           ets:new(default_bin,
               [protected, set, named_table, {keypos, 1}, {read_concurrency, true}]),

           ets:insert(default_bin, {1, Data});
        _ -> skip
    end.


do_init(_Start, 0) -> skip;
do_init(Start, N) ->
    PlayerID = rand:uniform(10000000),
    player_init(PlayerID),
    do_init(Start, N - 1).


player_init(PlayerID) ->
    [{_,Data}] = ets:lookup(default_bin, 1),
    Player = #player_data{
        player_id = PlayerID,
        name = "player_" ++ integer_to_list(PlayerID),
       data = Data,
        data_version = nowNano()
    },
    mod_player_load_save:save_player(Player),
    ok.


nowNano() -> os:system_time(nano_seconds).