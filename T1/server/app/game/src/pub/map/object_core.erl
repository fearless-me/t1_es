%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 14. 五月 2018 14:10
%%%-------------------------------------------------------------------
-module(object_core).
-author("mawenhong").

-include("logger.hrl").
-include("map_core.hrl").
-include("gs_cache.hrl").
-include("cfg_monster.hrl").
-include("ai.hrl").
-include("rec_rw.hrl").

%% API
-export([
    new_player/5, del_player/1,
    new_monster/1, del_monster/1,
    new_static/3, del_static/1,
    
    get_uid/1, get_pid/1,
    get_data_id/1, get_owner/1, get_type/1,
    
    is_unit_cant_move_state/1, is_dead/1
]).


is_unit_cant_move_state(_Uid) ->
    %% todo 检查目标是否处于死亡，定身，眩晕等等或者在释放技能等等
    ok.


is_dead(Uid) ->
    object_rw:get_hp(Uid) =< 0.


%%-------------------------------------------------------------------
new_player(Pid, Uid, Group, Pos, Face) ->
    init_rw_default(Uid),
    AttrList = gs_cache_interface:read_online_player_element(Uid, #m_cache_online_player.attr),
    BuffList = gs_cache_interface:read_online_player_element(Uid, #m_cache_online_player.buff_list),
    object_rw:set_fields_direct(
        Uid,
        [
            {#m_object_rw.attr, AttrList},
            {#m_object_rw.buff_list, BuffList}
        ]
    ),

    new(?OBJ_PLAYER, Pid, Uid, 0, 0, Group, Pos, Face).

del_player(Uid) ->
    del_all_rw(Uid),
    ok.

%%-------------------------------------------------------------------
new_static(Group, Pos, Face) ->
    Pid = self(),
    Uid = uid_gen:mon_uid(),
    init_rw_default(Uid),
    new(?OBJ_STATIC, Pid, Uid, 0, 0, Group, Pos, Face).

del_static(Uid) ->
    del_all_rw(Uid),
    ok.

%%-------------------------------------------------------------------
new_monster(#recMapObjData{
    id = Mid,
    mapX = X,
    mapY = Y,
    groupID = Group
}) ->
    
    #monsterCfg{
    
    } = getCfg:getCfgByArgs(cfg_monster, Mid),
    
    Pid = self(),
    Uid = uid_gen:mon_uid(),
    Pos = vector3:new(X, 0.0, Y),
    init_rw_default(Uid),
    
    %% todo 怪物AI配置
    mod_ai:init(Uid, ?AIAT_Active),
    new(?OBJ_MON, Pid, Uid, Mid, 0, Group, Pos, vector3:new(0.1, 0, 0.5)).


del_monster(Uid) ->
    del_all_rw(Uid),
    ok.
%%-------------------------------------------------------------------
new(Type, Pid, Uid, Did, Owner, Group, Pos, Face) ->
    mod_move:init(Uid, Pos, Face),
    
    object_rw:set_fields(
        Uid,
        [
            {#m_object_rw.data_id, Did},
            {#m_object_rw.group, Group},
            {#m_object_rw.pid, Pid},
            {#m_object_rw.type, Type}
        ]
    ),
    
    #m_cache_map_object{
        map_id = map_rw:get_map_id(),
        line_id = map_rw:get_line_id(),
        uid = Uid, pid = Pid, data_id = Did,
        owner = Owner, type = Type
    }.


%%-------------------------------------------------------------------
%%-------------------------------------------------------------------
init_rw_default(Uid) ->
    object_rw:init(Uid),
    ?WARN("init_rw_default(~p)", [Uid]),
    ok.

del_all_rw(Uid) ->
    object_rw:del(Uid),
    ?WARN("del_all_rw(~p)", [Uid]),
    ok.

%%-------------------------------------------------------------------
%%-------------------------------------------------------------------


%%-------------------------------------------------------------------
get_uid(Obj) -> Obj#m_cache_map_object.uid.
get_pid(Obj) -> Obj#m_cache_map_object.pid.
get_data_id(Obj) -> Obj#m_cache_map_object.data_id.
get_owner(Obj) -> Obj#m_cache_map_object.owner.
get_type(Obj) -> Obj#m_cache_map_object.type.
%%-------------------------------------------------------------------
