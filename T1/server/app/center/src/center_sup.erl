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
        %% 基础设施
        misc:fn_wrapper("config init", ?Wrap(cs_conf:start("center.ini")), stdio),
        misc:fn_wrapper("logger", ?Wrap(fastlog:start("center")), stdio),
        misc:fn_wrapper("error Logger", ?Wrap(common_error_logger:start(center_sup, center))),
        misc:fn_wrapper("gen rpc app", ?Wrap(misc:start_all_app(gen_rpc))),
        misc:fn_wrapper("db share", ?Wrap(cs_share:start())),
        misc:fn_wrapper("db window", ?Wrap(cs_db_starter:start())),
        misc:fn_wrapper("auto compile and load", ?Wrap(fly:start())),
        misc:fn_wrapper("observer_cli", ?Wrap(misc:start_app(observer_cli))),

        %% 逻辑基础
        misc:fn_wrapper("db checker", ?Wrap(misc:start_otp(SupPid, db_checker, worker, [cs_db_checker]))),
        misc:fn_wrapper("dist monitor otp", ?Wrap(misc:start_otp(SupPid, cs_dist_monitor, worker))),
        misc:fn_wrapper("serv data loader", ?Wrap(misc:start_otp(SupPid, data_loader, worker, [cs_data_loader]))),
        misc:fn_wrapper("gc", ?Wrap(misc:start_otp(SupPid, background_gc, worker))),
        misc:fn_wrapper("monitor/vms/system monitor", ?Wrap(misc:start_otp(SupPid, vms_monitor, worker, [0.5]))),
        misc:fn_wrapper("serv_cache", ?Wrap(misc:start_otp(SupPid, cs_cache_srv, worker))),
        misc:fn_wrapper("all logic process", ?Wrap(misc:start_otp(SupPid, cs_logic_sup, supervisor))),
        misc:fn_wrapper("server mgr", ?Wrap(misc:start_otp(SupPid, server_root_sup, supervisor))),

        %% 等待所有数据加载完毕
        misc:fn_wrapper("watchdog", ?Wrap(misc:start_otp(SupPid, watchdog, worker, [cs_watchdog]))),
        watchdog:wait_group(1),

        %% 等待检查日志分表、开启其他
        watchdog:continue_group(2),
        misc:fn_wrapper("distritbution", ?Wrap(start_dist(SupPid))),

        watchdog:wait_all(), watchdog:ready(true),

        %%
        background_gc:run(),

        ok
    catch _ : Err : ST ->
        misc:halt("start app error ~p, stacktrace ~p", [Err, ST])
    end,
    
    {ok, SupPid}.

start_dist(SupPid) ->
    case application:get_env(center, mode, allin) of
        dist -> cs_dist:start_master(SupPid);
        _ -> cs_dist:start_independence(SupPid)
    end,
    ok.

