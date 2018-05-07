%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 05. 一月 2018 9:39
%%%-------------------------------------------------------------------
-module(mod_player_cache_manager).
-author("mawenhong").

%% API
-export([
    start_player_cache/0, info/0,
    load/1, save/1
]).

start_player_cache()->
    application:ensure_all_started(cache),
    TTL = mod_ini_conf:get_player_cache_ttl(),
    CacheNum = mod_ini_conf:get_player_cache_num(),
    {ok, _} = cache:start_link(player_cache, [{n, CacheNum}, {ttl, TTL}]),
    ok.

info()->
    cache:i(player_cache).

load(RoleID) -> mod_player_cache_impl_ets:load(RoleID).
save(Data) -> mod_player_cache_impl_ets:save(Data).