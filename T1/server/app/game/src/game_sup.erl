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
        misc:fn_wrapper({"logger", stdio,           ?Wrap(loggerS:start())}),
        misc:fn_wrapper({"error Logger",            ?Wrap(common_error_logger:start(game_sup, game))}),
        misc:fn_wrapper({"watchdog",                ?Wrap(start_fn:start_otp(SupPid, watchdog, worker, [fun gs_watchdog_hook:task_list/0]))}),
        misc:fn_wrapper({"gen rpc app",             ?Wrap(misc:start_all_app(gen_rpc))}),
        misc:fn_wrapper({"config init",             ?Wrap(gs_conf:start("game.ini"))}),
        misc:fn_wrapper({"monitor/gc/vms",          ?Wrap(start_fn:start_gc_vm(SupPid, 0.5))}),
        misc:fn_wrapper({"system monitor",          ?Wrap(start_fn:start_otp(SupPid, system_monitor, worker))}),
        misc:fn_wrapper({"map root supervisor",     ?Wrap(start_fn:start_otp(SupPid, gs_map_root_sup, supervisor))}),
        misc:fn_wrapper({"login window",            ?Wrap(start_fn:start_otp(SupPid, login_otp, worker))}),
        misc:fn_wrapper({"serv_cache",              ?Wrap(start_fn:start_otp(SupPid, gs_cache_otp, worker))}),
        misc:fn_wrapper({"db window",               ?Wrap(start_fn:start_db_worker(SupPid))}),
        misc:fn_wrapper({"broadcast mod",           ?Wrap(start_fn:start_otp(SupPid, gs_broadcast_otp, worker))}),
        misc:fn_wrapper({"serv data loader",        ?Wrap(start_fn:start_otp(SupPid, gs_loader_otp, worker))}),
        misc:fn_wrapper({"all logic process",       ?Wrap(start_fn:start_otp(SupPid, gs_logic_sup, supervisor))}),

        misc:fn_wrapper({"auto compile and load",   ?Wrap(fly:start())}),
        misc:fn_wrapper({"center window process",   ?Wrap(start_fn:start_otp(SupPid, gs_cs_otp, worker))}),
        watchdog:wait(),

        misc:fn_wrapper({"test network 15555",      ?Wrap(start_fn:start_listener_15555(SupPid))}),
        ok
    catch _ : Err : ST ->
        misc:halt("start app error ~p, stacktrace ~p", [Err, ST])
    end,

    {ok, SupPid}.

