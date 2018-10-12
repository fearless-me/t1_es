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
-export([start_link/0]).
-export([mod_init/1, do_handle_call/3, do_handle_info/2, do_handle_cast/2]).

%%%===================================================================
%%% public functions
%%%===================================================================
start_link() ->
    gen_serverw:start_link({local, ?MODULE}, ?MODULE, [],
        [{spawn_opt, [{min_heap_size, 1024 * 1024}]}]).

%%%===================================================================
%%% Internal functions
%%%===================================================================	
mod_init(_Args) ->
    erlang:process_flag(trap_exit, true),
    %% erlang:process_flag(priority, high),
    
    tick_msg(),
    init_data(?MAX_OBJ),
    {ok, ok}.


init_data(0) ->
    skip;
init_data(N) ->
    init_data_one(N),
    init_data(N - 1).

init_data_one(X) ->
    L = lists:seq(1, 150),
    put({p, X}, lists:zip(L, L)).

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
    tick_rand_change(),
    tc(Old, erlang:process_info(self(), memory), ?FUNCTION_NAME),
    {noreply, State};
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
    ?DEBUG("~p: ~p - ~p = ~s ", [FuncName, New, Old, misc:format_memory_readable(New - Old)]),
    ok.
    


tick_msg() ->
    erlang:send_after(500, self(), tick).

tick_rand_change() -> do_tick_rand_change(300).

do_tick_rand_change(0) ->
    ok;
do_tick_rand_change(N) ->
    tick_rand_change_1(),
    do_tick_rand_change(N - 1).

tick_rand_change_1() ->
    X1 = rand_tool:rand(1, ?MAX_OBJ),
    K1 = rand_tool:rand(1, 150),
    L1 = get({p, X1}),
    L2 = lists:map(fun({K, V}) -> {K, V + V} end, L1),
    L3 = lists:keyreplace(K1, 1, L2, {K1, K1 * X1}),
    L4 = lists:map(fun({K, V}) -> {K, V * rand:uniform()} end, L3),
    put({p, X1}, L4),
    ok.