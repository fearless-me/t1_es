%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 30. 五月 2018 14:12
%%%-------------------------------------------------------------------
-module(db_mgr).
-author("mawenhong").

-behaviour(gen_serverw).
-include("logger.hrl").

-export([scheduler_/3]).
-export([start_worker/1]).
%% API
-export([start_link/1]).
-export([mod_init/1, do_handle_call/3, do_handle_info/2, do_handle_cast/2]).

%%-------------------------------------------------------------------
start_worker(Mgr) ->
    gen_server:call(Mgr, start_worker).

scheduler_(Mgr, HashKey, Msg) -> ps:send(Mgr, scheduler, {HashKey, Msg}).

%%-------------------------------------------------------------------
-define(WORKER_KEY, db_mgr_worker_key_).
-record(db_mgr_state,{pool, worker_no, func}).
%%%===================================================================
%%% public functions
%%%===================================================================
start_link(Args) ->
    gen_serverw:start_link(?MODULE, Args, []).

%%%===================================================================
%%% Internal functions
%%%===================================================================	
mod_init([WorkerNo, PoolRef, Func]) ->
    erlang:process_flag(trap_exit, true),
    erlang:process_flag(priority, high),
    misc:register_process(self(), PoolRef, [mgr]),
    {ok, #db_mgr_state{pool = PoolRef, worker_no = WorkerNo, func = Func}}.

%%--------------------------------------------------------------------
do_handle_call(start_worker, _From, State) ->
    #db_mgr_state{pool = PoolRef, worker_no = WorkerNo, func = Func} = State,
    {reply, init_worker(WorkerNo, PoolRef, Func), State};
do_handle_call(Request, From, State) ->
    ?ERROR("undeal call ~w from ~w", [Request, From]),
    {reply, error, State}.

%%--------------------------------------------------------------------
do_handle_info({scheduler, {HashKey, Msg}}, State) ->
    Worker = hash_to_worker(HashKey, State),
    db_son:scheduler_(Worker, Msg),
    {noreply, State};
do_handle_info(Info, State) ->
    ?ERROR("undeal info ~w", [Info]),
    {noreply, State}.

%%--------------------------------------------------------------------
do_handle_cast(Request, State) ->
    ?ERROR("undeal cast ~w", [Request]),
    {noreply, State}.

%%--------------------------------------------------------------------
init_worker(N, _PoolId, _Func) when N < 1 ->
    ?ERROR("~p worker num <1", [misc:registered_name()]),
    error;
init_worker(N, PoolId, Func) ->
    F = fun(X) -> init_worker_1(PoolId, X, Func) end,
    lists:foreach(F, lists:seq(1, N)),
    sucess.

init_worker_1(PoolId, X, Func) ->
    MgrName = misc:registered_name(),
    {ok, Pid} = db_sup:start_child([PoolId, MgrName, X, Func]),
    put({?WORKER_KEY, X}, Pid),
    Pid.
%%--------------------------------------------------------------------

%%--------------------------------------------------------------------
hash_to_worker(Key, State) ->
    #db_mgr_state{pool = PoolRef, worker_no = WorkerNo, func = Func} = State,
    X = Key rem WorkerNo + 1,
    P = get({?WORKER_KEY, X}),
    try misc:is_alive(P) of
        true -> P
    catch _:_:_ ->
        ?ERROR("~p's worker ~p of ~p for pool ~p restart",
            [misc:registered_name(), X, WorkerNo, PoolRef]),
        init_worker_1(PoolRef, X, Func)
    end.

