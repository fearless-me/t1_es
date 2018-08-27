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
        misc:fn_wrapper({"logger", stdio,           ?Wrap(loggerS:start())}),
        misc:fn_wrapper({"error Logger",            ?Wrap(common_error_logger:start(center_sup, center))}),
        misc:fn_wrapper({"watchdog",                ?Wrap(cs_start_fn:start_otp(SupPid, watchdog, worker, [fun cs_watchdog_hook:task_list/0]))}),
        misc:fn_wrapper({"gen rpc app",             ?Wrap(misc:start_all_app(gen_rpc))}),
        misc:fn_wrapper({"center dist otp",         ?Wrap(cs_start_fn:start_otp(SupPid, cs_dist_otp, worker))}),
        misc:fn_wrapper({"config init",             ?Wrap(cs_conf:start("center.ini"))}),
        misc:fn_wrapper({"monitor/gc/vms",          ?Wrap(cs_start_fn:start_gc_vm(SupPid, 0.5))}),
        misc:fn_wrapper({"system monitor",          ?Wrap(cs_start_fn:start_otp(SupPid, system_monitor, worker))}),
        misc:fn_wrapper({"serv_cache",              ?Wrap(cs_start_fn:start_otp(SupPid, cs_cache_otp, worker))}),
        misc:fn_wrapper({"db window",               ?Wrap(cs_start_fn:start_db_worker(SupPid))}),
        misc:fn_wrapper({"serv data loader",        ?Wrap(cs_start_fn:start_otp(SupPid, cs_loader_otp, worker))}),
        misc:fn_wrapper({"all logic process",       ?Wrap(cs_start_fn:start_otp(SupPid, cs_logic_sup, supervisor))}),
        misc:fn_wrapper({"auto compile and load",   ?Wrap(fly:start())}),
        misc:fn_wrapper({"distritbution",           ?Wrap(cs_start_fn:start_dist(SupPid))}),
            
        watchdog:wait(),

        misc:fn_wrapper({"server mgr",              ?Wrap(cs_start_fn:start_otp(SupPid, svr_root_sup, supervisor))}),
        ok
    catch _ : Err : ST ->
        misc:halt("start app error ~p, stacktrace ~p", [Err, ST])
    end,

    {ok, SupPid}.

