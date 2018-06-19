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
-include("mem_record.hrl").
-include("map_obj.hrl").

-export([on_rw_update/3]).

%% API
%%-------------------------------------------------------------------
%%不要在调用lib_obj_rw:set_xxx
%%-------------------------------------------------------------------
-define(lock(X), lock_transcation(X)).
-define(unlock(), unlock_transcation()).

on_rw_update(Uid, hp, Hp) ->
    ?lock({Uid, hp}),
    Type = lib_obj_rw:get_type(Uid),
    on_rw_update_pub_action(Type, Uid, {#m_player_pub.hp, Hp}),
    ?unlock(),
    ok;
on_rw_update(Uid, attr, Attrs) ->
    ?lock({Uid, attr}),
    Type = lib_obj_rw:get_type(Uid),
    on_rw_update_priv_action(Type, Uid, {#m_player_private.priv_attrs, Attrs}),
    ?unlock(),
    ok;
on_rw_update(Uid, buff_list, BuffList) ->
    ?lock({Uid, buff_list}),
    Type = lib_obj_rw:get_type(Uid),
    on_rw_update_priv_action(Type, Uid, {#m_player_private.priv_buffs, BuffList}),
    ?unlock(),
    ok;
on_rw_update(_Uid, _Key, _Value) ->
    ok.


%%-------------------------------------------------------------------
on_rw_update_pub_action(?OBJ_USR, Uid, Element) ->
    lib_cache:update_player_pub(Uid, Element),
    ok;
on_rw_update_pub_action(_ObjType, _Uid, _Element) ->
    ok.

%%-------------------------------------------------------------------
on_rw_update_priv_action(?OBJ_USR, Uid, Element) ->
    lib_cache:update_player_priv(Uid, Element),
    ok;
on_rw_update_priv_action(_ObjType, _Uid, _Element) ->
    ok.


%%-------------------------------------------------------------------
lock_transcation(Key)->
    case get(map_obj_lock_transcation) of
        Key -> throw("recursive call");
        _ -> skip
    end,
    ok.

unlock_transcation()->
    erase(map_obj_lock_transcation).

