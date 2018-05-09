-module(dbs_sup).

-behaviour(supervisor).

%% API
-export([start/0]).
-export([start_link/0]).

%% Supervisor callbacks
-export([init/1]).

%% Helper macro for declaring children of supervisor
%% Helper macro for declaring children of supervisor
-define(CHILD(SupPid, I, Type), supervisor:start_child(SupPid, {I, {I, start_link, []}, permanent, 5000, Type, [I]})).
-define(CHILD(SupPid, I, Type, Params), supervisor:start_child(SupPid, {I, {I, start_link, Params}, permanent, 5000, Type, [I]})).
-define(CHILD(SupPid, Name, I, Type, Params), supervisor:start_child(SupPid, {Name, {I, start_link, Params}, permanent, 5000, Type, [Name]})).
-define(Wrap(X),fun()-> X end).

%% ===================================================================
%% API functions
%% ===================================================================

start_link() ->
    supervisor:start_link({local, ?MODULE}, ?MODULE, []).

%% ===================================================================
%% Supervisor callbacks
%% ===================================================================

init([]) ->
    {ok, { {one_for_one, 5, 10}, []} }.

start() ->
    {ok, SupPid} = dbs_sup:start_link(),

    wrapper({"logger", stdio, ?Wrap(start_logs(SupPid))}),
    wrapper({"error Logger",  ?Wrap(start_errlog(SupPid))}),
    wrapper({"sentinel",  ?Wrap(start_sentinel(SupPid))}),
    wrapper({"config init",  ?Wrap(start_conf(SupPid))}),
    wrapper({"mem cache",  ?Wrap(start_cache(SupPid))}),
    wrapper({"mysql pool manager",  ?Wrap(start_mysql_pool(SupPid))}),
    wrapper({"check dbpool",  ?Wrap(start_check_db_pool(SupPid))}),
    wrapper({"db worker supervisor",  ?Wrap(start_db_worker_supervisor(SupPid))}),
    wrapper({"db worker pool",  ?Wrap(start_db_worker_manager(SupPid))}),
    wrapper({"monitor/gc/vms",  ?Wrap(start_gc_vm(SupPid, 0.5))}),
    wrapper({"server window supervisor",  ?Wrap(start_svr_supervisor(SupPid))}),
    wrapper({"server window manager",  ?Wrap(start_svr_worker_manager(SupPid))}),
    wrapper({"start auto compile and load",  ?Wrap(start_auto_reload(SupPid))}),

    sentinel_server:status(),
    sentinel_server:ready(true),
    {ok, SupPid}.



wrapper({Msg, stdio, Thunk})->
    io:format("starting ~s ~n", [Msg]),
    Thunk(),
    ok;
wrapper({Msg, Thunk}) ->
    ?INFO("starting ~s ...", [Msg]),
    try
        Thunk()
    catch
        _ : Err  ->
            ?ERROR("run ~p,error ~p, app crash!!! ",[Thunk, Err]),
            timer:sleep(50000),
            erlang:halt()
    end,
    ?INFO("starting ~s done", [Msg]),
    ok.

start_logs(_SupPid) ->
    loggerS:start().

start_errlog(_SupPid) ->
    common_error_logger:start(dbs_sup, dbs), ok.

start_sentinel(SupPid) ->
    {ok, _} = ?CHILD(SupPid, sentinel_server, worker),
    ok.

start_conf(_SupPid) ->
    mod_ini_conf:init_conf("dbs.ini"),
    ok.

start_cache(_SupPid) ->
    mod_player_cache_manager:start_player_cache().

start_mysql_pool(SupPid) ->
    {ok, _} = ?CHILD(SupPid, mysql_pool_manager, worker),
    ok = mysql_instance_loader:load_db_conf(),
    ok = mysql_pool_manager:start_player_mysql_pool(),
    ok.

start_check_db_pool(_SupPid)->
    case mysql_pool_manager:check_player_db() of
        [] -> skip;
        _ ->
            ?FATAL("please check player db"),
            timer:sleep(10000),
            erlang:halt()
    end.

start_db_worker_supervisor(SupPid) ->
    {ok, _} = ?CHILD(SupPid, dbs_worker_supervisor, supervisor).

start_db_worker_manager(SupPid) ->
    {ok, _} =  ?CHILD(SupPid, dbs_worker_manager, worker).

start_gc_vm(SupPid, MemFraction) ->
    {ok, _} = ?CHILD(SupPid, background_gc, worker),
    {ok, _} = ?CHILD(SupPid, vm_memory_monitor, worker, [MemFraction]),
    ok.

start_svr_supervisor(SupPid) ->
    {ok, _} = ?CHILD(SupPid,  svr_supervisor, supervisor).

start_svr_worker_manager(SupPid) ->
    {ok, _} = ?CHILD(SupPid,  svr_worker_manager, worker).

start_auto_reload(_SupPid) ->
    ok = fly:start().


