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
    unit_mod:del_player(Uid),
    ok.
%%-------------------------------------------------------------------
on_monster_create(_Uid) ->
    ok.

on_monster_dead(Uid) ->
    unit_mod:del_monster(Uid),
    ok.

on_start_move(_Uid) ->
    ok.

%%-------------------------------------------------------------------
%% 不要在调用lib_obj_rw:set_xxx
%% 逻辑代码必须要喊在 ?lock() 与 ?unlock 之间
%%-------------------------------------------------------------------
-define(lock(X), lock_transaction(X)).
-define(unlock(), unlock_transaction()).

on_rw_update(Uid, hp, Hp) ->
    ?lock({Uid, hp}),
    Type = unit_rw:get_type(Uid),
    do_on_rw_update_pub(Type, Uid, {#m_cache_player_pub.hp, Hp}),
    ?unlock(),
    ok;
on_rw_update(Uid, attr, Attrs) ->
    ?lock({Uid, attr}),
    Type = unit_rw:get_type(Uid),
    do_on_rw_update_priv(Type, Uid, {#m_cache_player_private.priv_attrs, Attrs}),
    ?unlock(),
    ok;
on_rw_update(Uid, buff_list, BuffList) ->
    ?lock({Uid, buff_list}),
    Type = unit_rw:get_type(Uid),
    do_on_rw_update_priv(Type, Uid, {#m_cache_player_private.priv_buffs, BuffList}),
    ?unlock(),
    ok;
on_rw_update(_Uid, _Key, _Value) ->
    ok.


%%-------------------------------------------------------------------
do_on_rw_update_pub(?OBJ_USR, Uid, Element) ->
    gs_cache:update_player_pub(Uid, Element),
    ok;
do_on_rw_update_pub(_ObjType, _Uid, _Element) ->
    ok.

%%-------------------------------------------------------------------
do_on_rw_update_priv(?OBJ_USR, Uid, Element) ->
    gs_cache:update_player_priv(Uid, Element),
    ok;
do_on_rw_update_priv(_ObjType, _Uid, _Element) ->
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

