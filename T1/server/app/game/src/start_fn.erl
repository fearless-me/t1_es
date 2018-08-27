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
    start_gc_vm/2, start_db_worker/1, start_listener_15555/1,
    start_otp/3, start_otp/4, start_otp/5
]).

%% Helper macro for declaring children of supervisor
-define(CHILD(SupPid, I, Type), supervisor:start_child(SupPid, {I, {I, start_link, []}, permanent, 5000, Type, [I]})).
-define(CHILD(SupPid, I, Type, Params), supervisor:start_child(SupPid, {I, {I, start_link, Params}, permanent, 5000, Type, [I]})).
-define(CHILD(SupPid, Name, I, Type, Params), supervisor:start_child(SupPid, {Name, {I, start_link, Params}, permanent, 5000, Type, [Name]})).


start_gc_vm(SupPid, MemFraction) ->
    {ok, _} = ?CHILD(SupPid, background_gc, worker),
    {ok, _} = ?CHILD(SupPid, vm_memory_monitor, worker, [MemFraction]),
    ok.

start_listener_15555(_SupPid) ->
    tcp_listener:start_listener(
        test_tcp_15555,
        10,
        [{port, 15555}, {max_connections, 1000}, {linger, {false, 0}}],
        gs_player_handler
    ).


start_db_worker(_SupPid) ->
    gs_share:start(),
    gs_db_starter:init_pool(),
    ok.


start_otp(SupPid, Module, Type) ->
    {ok, _} = ?CHILD(SupPid, Module, Type),
    ok.

start_otp(SupPid, Module, Type, Params) ->
    {ok, _} = ?CHILD(SupPid, Module, Type, Params),
    ok.

start_otp(SupPid, Name, Module, Type, Params) ->
    {ok, _} = ?CHILD(SupPid, Name, Module, Type, Params),
    ok.

