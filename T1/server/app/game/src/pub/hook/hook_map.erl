%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 31. 五月 2018 10:38
%%%-------------------------------------------------------------------
-module(hook_map).
-author("mawenhong").
-include("logger.hrl").
-include("gs_cache.hrl").
-include("map_core.hrl").


-export([
    on_map_create/0, on_map_destroy/0,
    on_player_join/1, on_player_exit/1,
    on_monster_create/1, on_monster_dead/1,
    on_rw_update/3, on_start_move/1
]).

%% 要注意在
%% on_map_create 、  on_player_join  、on_player_exit
%% 这三个接口不要处理过于复杂的逻辑，因为这个是 call调用,如果要处理的逻辑比较耗时
%% 发个消息给相应的进程来异步处理
%%
%%-------------------------------------------------------------------
on_map_create() ->
    ok.

on_map_destroy() ->
    ok.
%%-------------------------------------------------------------------
on_player_join(_Uid) ->
    ok.

on_player_exit(Uid) ->
    unit:del_player(Uid),
    ok.
%%-------------------------------------------------------------------
on_monster_create(_Uid) ->
    ok.

on_monster_dead(Uid) ->
    unit:del_monster(Uid),
    ok.

on_start_move(_Uid) ->
    ok.

%%-------------------------------------------------------------------
%% 不要在调用unit_rw:set_xxx
%% 逻辑代码必须要喊在 ?lock() 与 ?unlock 之间
%%-------------------------------------------------------------------
-define(lock(X), lock_transaction(X)).
-define(unlock(), unlock_transaction()).

on_rw_update(_Uid, _Key, _Value) ->
    ok.

%%-------------------------------------------------------------------
lock_transaction(Key)->
    case get(map_obj_lock_transaction) of
        Key -> throw("recursive call");
        _ -> put(map_obj_lock_transaction, Key)
    end,
    ok.

unlock_transaction()->
    erase(map_obj_lock_transaction).

