%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 23. 五月 2018 10:36
%%%-------------------------------------------------------------------
-module(test).
-author("mawenhong").

-include("pub_def.hrl").
-include("pub_rec.hrl").
-include("gameMap.hrl").

%% API
-export([tv3/0, a/0, rand/1]).
-export([test_apply/1, test_apply/2, apply_fun/0, loop_call/1, loop_mfa_call/2, loop_apply_call/2]).
-export([test_bin/2, test_bin/3]).

%% test:test_apply({test,apply_fun,[]}).
test_apply(Mod) ->
    io:format("call times           local call                      MFA         apply(microseconds)~n"),
    test_apply(Mod, 10),
    test_apply(Mod, 100),
    test_apply(Mod, 1000),
    test_apply(Mod, 10000),
    test_apply(Mod, 100000),
    test_apply(Mod, 1000000),
    test_apply(Mod, 10000000),
    ok.

test_apply({Mod, _, _} = MFA, N) ->
    {Local, _} = timer:tc(fun() -> test:loop_call(N) end),
    {MfaEx, _} = timer:tc(fun() -> test:loop_mfa_call(Mod, N) end),
    {Apply, _} = timer:tc(fun() -> test:loop_apply_call(MFA, N) end),
    io:format("~.10w\t~.15w\t\t~.15w\t\t~.15w~n", [N, Local, MfaEx, Apply]),
    ok.

loop_call(0) ->
    ok;
loop_call(N) ->
    test:apply_fun(),
    loop_call(N - 1).

loop_mfa_call(_, 0) ->
    ok;
loop_mfa_call(M, N) ->
    M:apply_fun(),
    loop_mfa_call(M, N - 1).


loop_apply_call(_, 0) ->
    ok;
loop_apply_call({M, F, A} = MFA, N) ->
    erlang:apply(M, F, A),
    loop_apply_call(MFA, N - 1).

apply_fun() ->
    L = lists:seq(1, 100),
    lists:keydelete(99, 1, L),
    ok.


rand(N) ->
    rand_tool:new(999),
    lists:foreach(
        fun(_) ->
            R = rand_tool:rand(),
            S = rand_tool:seed(),
            io:format("seed: ~p, ret: ~p~n", [S, R])
        end, lists:seq(1, N)),
    ok.

a() ->
    V1 = vector3:new(10, 0, 0),
    V2 = vector3:new(10, 0, 10),
    V3 = vector3:new(-10, 0, 10),
    V4 = vector3:new(-10, 0, -10),
    Angle1 = vector3:angle(V1, V2), % 45
    Angle2 = vector3:angle(V1, V3), % 135
    Angle3 = vector3:angle(V1, V4), % 225
    io:format("~p, ~p, ~p~n", [Angle1, Angle2, Angle3]),
    ok.

tv3() ->

    V = vector3:new(10, 0, 0),
    S = vector3:new(),
    E = vector3:new(1, 0, 1),
    D = vector3:dist_to_line(V, S, E),

    io:format("dist = ~p~n", [D]),

    Dir1 = vector3:new(10, 0, 0),
    Dir2 = vector3:rotate_around_origin_2d(Dir1, 90),
    io:format("~w rotate 90 ~w~n", [Dir1, Dir2]),

    Pos0 = vector3:new(100, 0, 100),
    Pos1 = vector3:add(Pos0, Dir2),
    io:format("~w rotate 45 ~w~n", [Pos0, Pos1]),


    V1 = vector3:new(150.1, 0, 100.1),
    V2 = vector3:new(100.1, 0, 50.1),
    P3 = vector3:new(100.1, 0, 150.1),
    io:format("normalized ~w -> ~w~n", [V1, vector3:normalized(V1)]),

    vector3:divi(V1, 0),
    vector3:divi(V1, 0.0),

    tv3_1(V1, V2),
    tv3_1(V1, P3),
    tv3_1(V2, V1),
    tv3_1(V2, P3),
    tv3_1(P3, V1),
    tv3_1(P3, V2),
    ok.

tv3_1(Src, Dst) ->
    io:format("~n"),
    io:format("src:~w~n", [Src]),
    io:format("dst:~w~n", [Dst]),
    io:format("\tbehind     ~w -> ~w~n", [Src, vector3:behind(Src, Dst, 10)]),
    io:format("\tbefore     ~w -> ~w~n", [Src, vector3:front(Src, Dst, 10)]),
    io:format("\tSrc is_front Dst -> ~w dir (Dst - Src) ~n", [vector3:is_front(Dst, vector3:subtract(Src, Dst), Src)]),
    io:format("\tSrc is_front Dst -> ~w dir (Src - Dst) ~n", [vector3:is_front(Dst, vector3:subtract(Dst, Src), Src)]),
    ok.


%%-------------------------------------------------------------------
test_bin(Type, N) ->
    ensure_test_bin(Type),
    background_gc:run(),
    loop_proc_fun(Type, N),
    ok.

test_bin(Type, N, S) ->
    ensure_test_bin(Type),
    background_gc:run(),
    Me = self(),
    T1 = os:system_time(milli_seconds),
    M1 = erlang:memory(total),
    _ = [erlang:spawn(fun() -> loop_proc_fun(Type, S), Me ! done end) || _ <- lists:seq(1, N)],
    _ = loop_wait(N),
    M2 = erlang:memory(total),
    M3 = M2 - M1,

    T2 = os:system_time(milli_seconds),
    io:format("test_bin(~p, ~p, ~p) ~ts - ~ts = ~ts, ~p(ms) ~n",
        [
            Type, N, S,
            misc:format_memory_readable(M2),
            misc:format_memory_readable(M1),
            misc:format_memory_readable(M3),
            T2 - T1
        ]),
    ok.

%%-------------------------------------------------------------------
loop_wait(N) when N =< 0 -> skip;
loop_wait(N) -> receive _ -> loop_wait(N - 1) end.

loop_proc_fun(Type, N) ->
    T1 = os:system_time(milli_seconds),
    {_, M1} = erlang:process_info(self(), memory),
    loop_proc_fun_1(Type, N),
    {_, M2} = erlang:process_info(self(), memory),
    M3 = M2 - M1,

    T2 = os:system_time(milli_seconds),
    io:format("~p|~p ~ts - ~ts = ~ts, ~p(ms) ~n",
        [
            self(), Type,
            misc:format_memory_readable(M2),
            misc:format_memory_readable(M1),
            misc:format_memory_readable(M3),
            T2 - T1
        ]),
    ok.

loop_proc_fun_1(_Type, N) when N =< 0 -> skip;
loop_proc_fun_1(Type, N) ->
    proc_fun(Type),
    loop_proc_fun_1(Type, N - 1).


proc_fun(Type) ->
    read_block(Type),
    ok.

%%-------------------------------------------------------------------
%%-------------------------------------------------------------------

read_block(bits) ->
    [{_, Maps}] = ets:lookup(block, block),
    bits_map:test_bit(Maps, rand_tool:rand(1, 100));
read_block(ets) ->
%%    Z = rand_tool:rand(1, 100),
    ets:member(block, (1 bsl 32) bor 77);
read_block(_) ->
    #recGameMapCfg{block = Block} = cfg_gamemapcfg1:getRow(1),
    binary:at(Block, 77),
    ok.


%%-------------------------------------------------------------------
perf_bin(bits) ->
    #recGameMapCfg{block = Block} = cfg_gamemapcfg1:getRow(1),
    ByteSize = erlang:byte_size(Block),
    Map1 = bits_map:new(),
    Map2 = do_perf_bits(Block, Map1, 0, ByteSize),
    ets:insert(block, {block, Map2});
perf_bin(ets) ->
    #recGameMapCfg{block = Block} = cfg_gamemapcfg1:getRow(1),
    ByteSize = erlang:byte_size(Block),
    do_perf_ets(Block, 1, 0, ByteSize);
perf_bin(_) -> skip.

%%-------------------------------------------------------------------
do_perf_bits(_Bin, Map, X, Limit) when X >= Limit ->
    Map;
do_perf_bits(Bin, Map, X, Limit) when X < Limit ->
    case binary:at(Bin, X) of
        1 -> do_perf_bits(Bin, Map, X + 1, Limit);
        _ -> do_perf_bits(Bin, bits_map:set(Map, X + 1), X + 1, Limit)
    end.
do_perf_ets(_Bin, _MapID, X, Limit) when X >= Limit ->
    ok;
do_perf_ets(Bin, MapID, X, Limit) when X < Limit ->
    case binary:at(Bin, X) of
        1 -> ets:insert(block, {(MapID bsl 32) bor X, 1});
        _ -> skip
    end,
    do_perf_ets(Bin, MapID, X + 1, Limit).

%%-------------------------------------------------------------------
ensure_test_bin(Type) ->
    case ets:info(block) of
        undefined ->
            ets:new(block, [named_table, ?ETS_RC,?ETS_WC]),
            perf_bin(Type),
            ok;
        _ -> skip
    end,
%%    ets:delete_all_objects(block),
    ok.