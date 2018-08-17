%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 30. 五月 2018 10:45
%%%-------------------------------------------------------------------
-module(db_proxy_otp).
-author("mawenhong").

-behaviour(gen_serverw).
-include("logger.hrl").
-include("pub_def.hrl").

-define(ETS_DB_POOL, db_pool_ets).
-record(r_db_pool, {pool, mgr, conf, pg}).

%%
-export([checkout_pool/1, pool_pg/1]).
-export([add_pool/2, add_pool/3]).
%%
-export([start_link/0]).
-export([mod_init/1, do_handle_call/3, do_handle_info/2, do_handle_cast/2]).

%%
add_pool(PoolRef, Conf) ->
    gen_server:call(?MODULE, {add_pool, PoolRef, Conf}, inifinity).

add_pool(PoolRef, Conf, Timeout) ->
    gen_server:call(?MODULE, {add_pool, PoolRef, Conf}, Timeout).

checkout_pool(PoolRef) ->
    case ets:lookup(?ETS_DB_POOL, PoolRef) of
        [#r_db_pool{mgr = Mgr}] -> Mgr;
        _ -> undefined
    end.

pool_pg(PoolRef) ->
    case ets:lookup(?ETS_DB_POOL, PoolRef) of
        [#r_db_pool{pg = PG}] -> PG;
        _ -> undefined
    end.


%%%===================================================================
%%% public functions
%%%===================================================================
start_link() ->
    gen_serverw:start_link({local, ?MODULE}, ?MODULE, [], []).

%%%===================================================================
%%% Internal functions
%%%===================================================================

mod_init(_Args) ->
    erlang:process_flag(trap_exit, true),
    erlang:process_flag(priority, high),
    ets:new(?ETS_DB_POOL, [named_table, public, {keypos, #r_db_pool.pool},  ?ETS_RC]),
    {ok, none}.

%%-------------------------------------------------------------------
do_handle_call({add_pool, PoolRef, Conf}, _From, State) ->
    {reply, start_db_pool(PoolRef, Conf), State};
do_handle_call(Request, From, State) ->
    ?ERROR("undeal call ~w from ~w", [Request, From]),
    {reply, ok, State}.

%%--------------------------------------------------------------------
do_handle_info({'EXIT', _Pid, normal}, State) ->
    {noreply, State};
do_handle_info(Info, State) ->
    ?ERROR("undeal info ~w", [Info]),
    {noreply, State}.

%%--------------------------------------------------------------------
do_handle_cast(Request, State) ->
    ?ERROR("undeal cast ~w", [Request]),
    {noreply, State}.


%%-------------------------------------------------------------------
start_db_pool(PoolRef, Conf) ->
    ?INFO("create mysql pool ~p ...",[PoolRef]),
    #{
        func := Func,
        host := Host, port := Port,
        user := User, password := Password, database := Database,
        conn := Connections, max_conn := MaxConnections, worker := WorkerNo
    } = Conf,
    ?INFO("\t~p", [PoolRef]),
    db_pool:add_pool(PoolRef, Host, Port, User, Password, Database, Connections, MaxConnections),

    {ok, Pid} = db_mgr_sup:start_child([WorkerNo, PoolRef, Func]),
    ?INFO("\t~p", [misc:registered_name(Pid)]),

    pg_local:join(PoolRef, Pid),
    db_mgr:start_worker(Pid),

    ets:insert(?ETS_DB_POOL, #r_db_pool{pool = PoolRef, mgr = Pid, conf = Conf, pg = PoolRef}),
    ?INFO("create mysql pool ~p done #",[PoolRef]),
    ok.

