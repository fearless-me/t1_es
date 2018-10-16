%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 27. 七月 2018 17:05
%%%-------------------------------------------------------------------
-module(hello).
-author("mawenhong").

-behaviour(gen_serverw).
-include("logger.hrl").

-define(MAX_OBJ, 350).



%% API
-export([start/0, stop/0, restart/0, run/1]).
-export([mod_init/1, do_handle_call/3, do_handle_info/2, do_handle_cast/2]).

%%%===================================================================
%%% public functions
%%%===================================================================
start() ->
    gen_serverw:start_link({local, ?MODULE}, ?MODULE, [],
        [{spawn_opt, [{min_heap_size, 1 * 1024 * 1024}]}]).

stop()->
    gen_server:stop(?MODULE).

restart() ->
    catch hello:stop(),
    hello:start().

run(Cmd) ->
    ps:send(?MODULE, Cmd).

%%%===================================================================
%%% Internal functions
%%%===================================================================	
mod_init(_Args) ->
    erlang:process_flag(trap_exit, true),
    %% erlang:process_flag(priority, high),
    
    tick_msg(),
    Map = init_data(?MAX_OBJ, #{}),
    gen_serverw:continue_effective_monitor(self(), 500000),
    {ok, Map}.


init_data(0, Map) ->
    Map;
init_data(N, Map) ->
    init_data(N - 1, init_data_one(N, Map)).

init_data_one(X, Map) ->
    L = lists:seq(1, 150),
    Map#{ X => lists:zip(L, L)}.

%%--------------------------------------------------------------------	
do_handle_call(Request, From, State) ->
    ?ERROR("undeal call ~w from ~w", [Request, From]),
    {reply, ok, State}.

loop_rand(0) -> skip;
loop_rand(N) ->
    rand_tool:rand(),
    loop_rand(N - 1).


%%--------------------------------------------------------------------
do_handle_info(tick, State) ->
    tick_msg(),
    Old = erlang:process_info(self(), memory),
    State1 = tick_rand_change(300, State),
    tc(Old, erlang:process_info(self(), memory), ?FUNCTION_NAME),
    {noreply, State1};
do_handle_info(rand, State) ->
    Old = erlang:process_info(self(), memory),
    loop_rand(100000),
    tc(Old, erlang:process_info(self(), memory), ?FUNCTION_NAME),
    {noreply, State};
do_handle_info(loop_map, State) ->
    Old = erlang:process_info(self(), memory),
    List1 =
        case get(m) of
            undefined ->
                L = lists:seq(1, 100000),
                maps:from_list(lists:zip(L, L));
            Map ->
                D = rand_tool:rand(1, 100000),
                ?DEBUG("delete key ~p", [D]),
                maps:remove(D, Map)
        end,
    put(m, List1),
    tc(Old, erlang:process_info(self(), memory), ?FUNCTION_NAME),
    
    {noreply, State};
do_handle_info(loop, State) ->
    Old = erlang:process_info(self(), memory),
    List1 =
        case get(x) of
            undefined ->
                lists:seq(1, 100000);
            L ->
                D = rand_tool:rand(1, 100000),
                ?DEBUG("delete key ~p", [D]),
                lists:keydelete(D, 1, L)
        end,
    put(x, List1),
    tc(Old, erlang:process_info(self(), memory), ?FUNCTION_NAME),
    {noreply, State};
do_handle_info(new, State) ->
    Old = erlang:process_info(self(), memory),
    Ref = erlang:make_ref(),
    List1 = lists:seq(1, 100000),
    put(Ref, List1),
    tc(Old, erlang:process_info(self(), memory), ?FUNCTION_NAME),
    {noreply, State};
do_handle_info(Info, State) ->
    ?ERROR("undeal info ~w", [Info]),
    {noreply, State}.

%%--------------------------------------------------------------------
do_handle_cast(Request, State) ->
    ?ERROR("undeal cast ~w", [Request]),
    {noreply, State}.

tc({_, Old}, {_, New}, _FuncName) when Old =:= New->
    skip;
tc({_, Old}, {_, New}, FuncName) ->
    {_, InfoList1} = erlang:process_info(self(), garbage_collection_info),
    {_, InfoList2} = erlang:process_info(self(), garbage_collection),
    ?DEBUG("~n~p~n~s - ~s = ~s ~n~n~s~n~w~n", [
        FuncName,
        misc:format_memory_readable(New),
        misc:format_memory_readable(Old),
        misc:format_memory_readable(New - Old),
        format_gc_info(InfoList1, ""),
        InfoList2
    ]),
    ok.

format_gc_info([], Acc) ->
    Acc;
format_gc_info([{K, V} | Info], Acc) ->
    format_gc_info(Info, [atom_to_list(K), ":", misc:format_memory_readable(V), "\n"] ++ Acc).
    


tick_msg() ->
    erlang:send_after(500, self(), tick).

tick_rand_change(Count, Map) -> do_tick_rand_change(Count, Map).

do_tick_rand_change(0, Map) ->
    Map;
do_tick_rand_change(N, Map) ->
    do_tick_rand_change(N - 1, tick_rand_change_1(Map)).

tick_rand_change_1(Map) ->
    X1 = rand_tool:rand(1, ?MAX_OBJ),
    K1 = rand_tool:rand(1, 150),
    L1 = maps:get(X1, Map, []),
    L2 = lists:map(fun({K, V}) -> {K, V + V} end, L1),
    L3 = lists:keyreplace(K1, 1, L2, {K1, K1 * X1}),
    L4 = lists:map(fun({K, V}) -> {K, V * rand:uniform()} end, L3),
    Map#{X1 => L4}.
