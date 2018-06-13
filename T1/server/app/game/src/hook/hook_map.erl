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
on_rw_update(Uid, hp, Hp) ->
    Type = lib_obj_rw:get_type(Uid),
    on_rw_update_action(Type, Uid, {#m_player_pub.hp, Hp}),
    ok;
on_rw_update(Uid, attr, Attrs) ->
    Type = lib_obj_rw:get_type(Uid),
    on_rw_update_action(Type, Uid, {#m_player_pub.priv_attrs, Attrs}),
    ok;
on_rw_update(Uid, buff_list, BuffList) ->
    Type = lib_obj_rw:get_type(Uid),
    on_rw_update_action(Type, Uid, {#m_player_pub.priv_buffs, BuffList}),
    ok;
on_rw_update(_Uid, _Key, _Value) ->
    ok.

on_rw_update_action(?OBJ_USR, Uid, Element) ->
    lib_cache:update_player_pub(Uid, Element),
    ok;
on_rw_update_action(_ObjType, _Uid, _Element) ->
    ok.
