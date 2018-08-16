-module(game_sup).

-behaviour(supervisor).
-include("logger.hrl").

%% API
-export([start/0]).
-export([start_link/0]).

%% Supervisor callbacks
-export([init/1]).

%% Helper macro for declaring children of supervisor
-define(Wrap(X), fun() -> X end).


%% ===================================================================
%% API functions
%% ===================================================================

start_link() ->
    supervisor:start_link({local, ?MODULE}, ?MODULE, []).

%% ===================================================================
%% Supervisor callbacks
%% ===================================================================

init([]) ->
    {ok, {{one_for_one, 5, 10}, []}}.


start() ->
    {ok, SupPid} = game_sup:start_link(),

    try
        wrapper({"logger", stdio,           ?Wrap(start_fn:start_logs(SupPid))}),
        wrapper({"error Logger",            ?Wrap(start_fn:start_errlog(SupPid))}),
        wrapper({"watchdog",                ?Wrap(start_fn:start_watchdog(SupPid))}),
        wrapper({"config init",             ?Wrap(start_fn:start_conf(SupPid, "game.ini"))}),
        wrapper({"monitor/gc/vms",          ?Wrap(start_fn:start_gc_vm(SupPid, 0.5))}),
        wrapper({"system monitor",          ?Wrap(start_fn:start_system_monitor(SupPid))}),
        wrapper({"map root supervisor",     ?Wrap(start_fn:start_map_root_supervisor(SupPid))}),
        wrapper({"login window",            ?Wrap(start_fn:start_login(SupPid))}),
        wrapper({"serv_cache",              ?Wrap(start_fn:start_serv_cache(SupPid))}),
        wrapper({"db window",               ?Wrap(start_fn:start_db_worker(SupPid))}),
        wrapper({"broadcast mod",           ?Wrap(start_fn:start_broadcast(SupPid))}),
        wrapper({"serv data loader",        ?Wrap(start_fn:start_serv_loader(SupPid))}),
        wrapper({"all logic process",       ?Wrap(start_fn:start_logic_sup(SupPid))}),

        wrapper({"auto compile and load",   ?Wrap(start_fn:start_auto_reload(SupPid))}),
        wrapper({"connect center",          ?Wrap(start_fn:start_center(SupPid))}),
        watchdog:wait(),

        wrapper({"test network 15555",      ?Wrap(start_fn:start_listener_15555(SupPid))}),
        wrapper({"test network 25555",      ?Wrap(start_fn:start_listener_25555(SupPid))}),
        ok
    catch _ : Err : ST ->
        misc:halt("start app error ~p, stacktrace ~p", [Err, ST])
    end,

    {ok, SupPid}.



wrapper({Msg, stdio, Thunk}) ->
    io:format("~s ~n", [Msg]),
    Thunk(),
    ok;
wrapper({Msg, Thunk}) ->
    ?INFO("~s ...", [Msg]),
    try Thunk()
    catch _ : Err : ST ->
        misc:halt("~n## run \'~ts\' failed ##~n ~p ~n ~p", [Msg, Err, ST])
    end,
    ?INFO("~s done #", [Msg]),
    ok.
