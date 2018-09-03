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
        %%          
        misc:fn_wrapper({"logger", stdio,           ?Wrap(loggerS:start())}),
        misc:fn_wrapper({"error Logger",            ?Wrap(common_error_logger:start(game_sup, game))}),
        misc:fn_wrapper({"gen rpc app",             ?Wrap(misc:start_all_app(gen_rpc))}),
        misc:fn_wrapper({"config init",             ?Wrap(gs_conf:start("game.ini"))}),
        misc:fn_wrapper({"db share",                ?Wrap(gs_share:start())}),
        misc:fn_wrapper({"db window",               ?Wrap(gs_db_starter:start())}),
        misc:fn_wrapper({"auto compile and load",   ?Wrap(fly:start())}),

        %%
        misc:fn_wrapper({"watchdog",                ?Wrap(misc:start_otp(SupPid, watchdog, worker, [gs_watchdog]))}),
        misc:fn_wrapper({"monitor/gc/vms",          ?Wrap(misc:start_otp(SupPid, background_gc, worker))}),
        misc:fn_wrapper({"monitor/gc/vms",          ?Wrap(misc:start_otp(SupPid, vm_memory_monitor, worker, [0.5]))}),
        misc:fn_wrapper({"system monitor",          ?Wrap(misc:start_otp(SupPid, system_monitor, worker))}),
        misc:fn_wrapper({"map root supervisor",     ?Wrap(misc:start_otp(SupPid, gs_map_root_sup, supervisor))}),
        misc:fn_wrapper({"login window",            ?Wrap(misc:start_otp(SupPid, login_otp, worker))}),
        misc:fn_wrapper({"serv_cache",              ?Wrap(misc:start_otp(SupPid, gs_cache_otp, worker))}),
        misc:fn_wrapper({"broadcast mod",           ?Wrap(misc:start_otp(SupPid, gs_broadcast_otp, worker))}),
        misc:fn_wrapper({"serv data loader",        ?Wrap(misc:start_otp(SupPid, data_loader, worker, [gs_data_loader]))}),
        misc:fn_wrapper({"all logic process",       ?Wrap(misc:start_otp(SupPid, gs_logic_sup, supervisor))}),
        misc:fn_wrapper({"center window process",   ?Wrap(misc:start_otp(SupPid, gs_cs_otp, worker))}),
            
        watchdog:wait_all(), watchdog:ready(true),

        misc:fn_wrapper({"server tcp listener",     ?Wrap(start_tcp_listener(SupPid))}),
        ok
    catch _ : Err : ST ->
        misc:halt("start app error ~p, stacktrace ~p", [Err, ST])
    end,

    {ok, SupPid}.

start_tcp_listener(_SupPid) ->
    case gs_conf:is_cross() of
        true -> ok;
        _ ->
            Port = gs_conf:get_server_port(),
            MaxConnection = gs_conf:get_max_connection(),
            tcp_listener:start_listener(
                gs_player_listen_server,
                10,
                [{port, Port}, {max_connections, MaxConnection}, {linger, {false, 0}}],
                gs_player_handler
            )
    end.


