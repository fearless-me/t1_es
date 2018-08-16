%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 31. 七月 2018 15:39
%%%-------------------------------------------------------------------
-module(start_fn).
-author("mawenhong").

%% API
-export([
    start_auto_reload/1,start_gc_vm/2, start_conf/2, start_errlog/1,
    start_logs/1, start_broadcast/1, start_db_worker/1,
    start_listener_15555/1, start_listener_25555/1,
    start_logic_sup/1, start_login/1,
    start_watchdog/1, start_serv_cache/1, start_map_root_supervisor/1,
    start_serv_loader/1, start_system_monitor/1, start_center/1

]).

%% Helper macro for declaring children of supervisor
-define(CHILD(SupPid, I, Type), supervisor:start_child(SupPid, {I, {I, start_link, []}, permanent, 5000, Type, [I]})).
-define(CHILD(SupPid, I, Type, Params), supervisor:start_child(SupPid, {I, {I, start_link, Params}, permanent, 5000, Type, [I]})).
-define(CHILD(SupPid, Name, I, Type, Params), supervisor:start_child(SupPid, {Name, {I, start_link, Params}, permanent, 5000, Type, [Name]})).


start_logs(_SupPid) ->
    loggerS:start().

start_errlog(_SupPid) ->
    common_error_logger:start(game_sup, game).

start_watchdog(SupPid) ->
    {ok, _} = ?CHILD(SupPid, gs_watchdog, worker),
    ok.

start_conf(_SupPid, FileName) ->
    gs_conf:start(FileName),
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
        [{port, 15555}, {max_connections, 1000}, {linger, {false, 0}}],
        mod_player
    ).

start_auto_reload(_SupPid) ->
    ok = fly:start().

start_serv_cache(SupPid) ->
    {ok, _} = ?CHILD(SupPid, gs_cache_otp, worker),
    ok.

start_login(SupPid) ->
    {ok, _} = ?CHILD(SupPid, gen_login, worker),
    ok.

start_map_root_supervisor(SupPid) ->
    {ok, _} = ?CHILD(SupPid, gs_map_root_sup, supervisor),
    ok.

start_db_worker(_SupPid) ->
    gs_share:start(),
    gs_db_starter:init_pool(),
    ok.

start_serv_loader(SupPid) ->
    {ok, _} = ?CHILD(SupPid, gs_loader_otp, worker),
    ok.

start_broadcast(SupPid) ->
    {ok, _} = ?CHILD(SupPid, gs_broadcast_otp, worker),
    ok.

start_logic_sup(SupPid) ->
    {ok, _} = ?CHILD(SupPid, gs_logic_sup, supervisor),
    ok.


start_system_monitor(SupPid) ->
    {ok, _} = ?CHILD(SupPid, system_monitor, worker),
    ok.

start_center(SupPid) ->
    {ok, _} = ?CHILD(SupPid, gs_cs_otp, worker),
    ok.