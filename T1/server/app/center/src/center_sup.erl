-module(center_sup).

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
    {ok, SupPid} = center_sup:start_link(),

    try
        wrapper({"logger", stdio,           ?Wrap(cs_start_fn:start_logs(SupPid))}),
        wrapper({"error Logger",            ?Wrap(cs_start_fn:start_errlog(SupPid))}),
        wrapper({"watchdog",                ?Wrap(cs_start_fn:start_watchdog(SupPid))}),
        wrapper({"config init",             ?Wrap(cs_start_fn:start_conf(SupPid, "center.ini"))}),
        wrapper({"monitor/gc/vms",          ?Wrap(cs_start_fn:start_gc_vm(SupPid, 0.5))}),
        wrapper({"system monitor",          ?Wrap(cs_start_fn:start_system_monitor(SupPid))}),
        wrapper({"serv_cache",              ?Wrap(cs_start_fn:start_serv_cache(SupPid))}),
        wrapper({"db window",               ?Wrap(cs_start_fn:start_db_worker(SupPid))}),
        wrapper({"serv data loader",        ?Wrap(cs_start_fn:start_serv_loader(SupPid))}),
        wrapper({"all logic process",       ?Wrap(cs_start_fn:start_logic_sup(SupPid))}),
        wrapper({"mnesia",                  ?Wrap(cs_start_fn:start_mnesia(SupPid))}),
        wrapper({"auto compile and load",   ?Wrap(cs_start_fn:start_auto_reload(SupPid))}),

        cs_watchdog:wait(),

        wrapper({"server mgr",              ?Wrap(cs_start_fn:start_svr_mgr(SupPid))}),
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
