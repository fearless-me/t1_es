%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 31. 七月 2018 15:39
%%%-------------------------------------------------------------------
-module(cs_start_fn).
-author("mawenhong").

%% API
-export([
    start_auto_reload/1,start_gc_vm/2, start_conf/2, start_errlog/1,
    start_logs/1, start_db_worker/1, start_logic_sup/1,
    start_watchdog/1, start_serv_cache/1,
    start_serv_loader/1, start_system_monitor/1

]).

%% Helper macro for declaring children of supervisor
-define(CHILD(SupPid, I, Type), supervisor:start_child(SupPid, {I, {I, start_link, []}, permanent, 5000, Type, [I]})).
-define(CHILD(SupPid, I, Type, Params), supervisor:start_child(SupPid, {I, {I, start_link, Params}, permanent, 5000, Type, [I]})).
-define(CHILD(SupPid, Name, I, Type, Params), supervisor:start_child(SupPid, {Name, {I, start_link, Params}, permanent, 5000, Type, [Name]})).


start_logs(_SupPid) ->
    loggerS:start().

start_errlog(_SupPid) ->
    common_error_logger:start(center_sup, center).

start_watchdog(SupPid) ->
    {ok, _} = ?CHILD(SupPid, cs_watchdog, worker),
    ok.

start_conf(_SupPid, FileName) ->
    cs_conf:start(FileName),
    ok.


start_gc_vm(SupPid, MemFraction) ->
    {ok, _} = ?CHILD(SupPid, background_gc, worker),
    {ok, _} = ?CHILD(SupPid, vm_memory_monitor, worker, [MemFraction]),
    ok.

start_auto_reload(_SupPid) ->
    ok = fly:start().

start_serv_cache(SupPid) ->
    {ok, _} = ?CHILD(SupPid, cs_cache, worker),
    ok.


start_db_worker(_SupPid) ->
    ok.

start_serv_loader(SupPid) ->
    {ok, _} = ?CHILD(SupPid, cs_loader, worker),
    ok.

start_logic_sup(SupPid) ->
    {ok, _} = ?CHILD(SupPid, cs_logic_sup, supervisor),
    ok.


start_system_monitor(SupPid) ->
    {ok, _} = ?CHILD(SupPid, system_monitor, worker),
    ok.