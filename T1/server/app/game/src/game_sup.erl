-module(game_sup).

-behaviour(supervisor).
-include("logger.hrl").

%% API
-export([start/0]).
-export([start_link/0]).

%% Supervisor callbacks
-export([init/1]).

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
    {ok, SupPid} = game_sup:start_link(),

    wrapper({"logger", stdio,               ?Wrap(start_logs(SupPid))}),
    wrapper({"error Logger",                ?Wrap(start_errlog(SupPid))}),
    wrapper({"sentinel",                    ?Wrap(start_sentinel(SupPid))}),
    wrapper({"config init",                 ?Wrap(start_conf(SupPid))}),
    wrapper({"monitor/gc/vms",              ?Wrap(start_gc_vm(SupPid, 0.5))}),
    wrapper({"test network 15555",          ?Wrap(start_listener_15555(SupPid))}),
    wrapper({"test network 25555",          ?Wrap(start_listener_25555(SupPid))}),
    wrapper({"start map root supervisor",   ?Wrap(start_map_root_supervisor(SupPid))}),
    wrapper({"start login window",          ?Wrap(start_login(SupPid))}),
    wrapper({"start _foundation",          ?Wrap(start_foundation(SupPid))}),
    wrapper({"start auto compile and load", ?Wrap(start_auto_reload(SupPid))}),

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
    common_error_logger:start(game_sup, game).

start_sentinel(SupPid) ->
    {ok, _} = ?CHILD(SupPid, sentinel_server, worker),
    ok.

start_conf(_SupPid) ->
%%    mod_ini_conf:init_conf("dbs.ini"),
    ok.


start_gc_vm(SupPid, MemFraction) ->
    {ok, _} = ?CHILD(SupPid, background_gc, worker),
    {ok, _} = ?CHILD(SupPid, vm_memory_monitor, worker, [MemFraction]),
    ok.

start_listener_25555(_SupPid) ->
    tcp_listener:start_listener(
        test_tcp_25555,
        10,
        [{port, 25555}, {max_connections, 1000}],
        behaviour_example
    ).

start_listener_15555(_SupPid) ->
    tcp_listener:start_listener(
        test_tcp_15555,
        10,
        [{port, 15555}, {max_connections, 1000}],
        mod_player
    ).

start_auto_reload(_SupPid) ->
    ok = fly:start().

start_foundation(SupPid)->
    {ok, _} = ?CHILD(SupPid, foundation_server, worker),
    ok.

start_login(SupPid) ->
    {ok, _} = ?CHILD(SupPid, mod_login, worker),
    ok.


start_map_root_supervisor(SupPid)->
    {ok, _} = ?CHILD(SupPid, map_root_supervisor, supervisor),
    ok.
