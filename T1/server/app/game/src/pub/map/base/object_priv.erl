%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 14. 五月 2018 14:10
%%%-------------------------------------------------------------------
-module(object_priv).
-author("mawenhong").

-include("logger.hrl").
-include("map_core.hrl").
-include("gs_cache.hrl").
-include("cfg_monster.hrl").
-include("cfg_npc.hrl").
-include("ai.hrl").
-include("object.hrl").
-include("rec_rw.hrl").
-include("gs_common_rec.hrl").

%% API
-export([
    new/1,
    new_player/5, del_player/1,
    new_monster/1, del_monster/1,
    new_static/3, del_static/1,
    new_npc/1,
    
    get_uid/1, get_pid/1,
    get_data_id/1, get_owner/1, get_type/1,

    
    is_unit_cant_move_state/1, is_dead/1
]).

-export([
    %%
    find_object_priv/1, find_object_priv/2, object_priv_exist/2
]).


is_unit_cant_move_state(_Uid) ->
    %% todo 检查目标是否处于死亡，定身，眩晕等等或者在释放技能等等
    ok.


is_dead(Uid) ->
    object_rw:get_hp(Uid) =< 0.


%%-------------------------------------------------------------------
new_player(Pid, Uid, Group, Pos, Face) ->
    init_rw_default(Uid),

    #m_cache_online_player{
        level = Lvl, name = Name, sex = Sex, race = Race, career = Career,
        battle_props = BattleProps, buff_list = BuffList
    } = gs_cache_interface:get_online_player(Uid),

    Req = #r_create_map_object_req{
        type = ?UID_TYPE_PLAYER,
        pid = Pid, uid = Uid, data_id = 0,
        owner = 0, group = Group,
        pos = Pos, face = Face,
        level = Lvl, name = Name, sex = Sex, race = Race, career = Career,
        battle_props = BattleProps, buff_list =  BuffList
    },

    new(Req).

del_player(Uid) ->
    del_all_rw(Uid),
    ok.

%%-------------------------------------------------------------------
new_static(Group, Pos, Face) ->
    Uid = uid_gen:mon_uid(),
    init_rw_default(Uid),
    Req = #r_create_map_object_req{
        type = ?UID_TYPE_STATIC,
        pid = self(), uid = Uid, data_id = 0,
        owner = 0, group = Group,
        pos = Pos, face = Face,
        level = 1, name = "", sex = 0, race = 1, career = 1
    },
    new(Req).

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

    Uid = uid_gen:mon_uid(),
    Pos = vector3:new(X, 0.0, Y),
    init_rw_default(Uid),
    BattleProps = #m_battleProps{
        career = 1, %% fixme prop_interface:?Career_1
        listBP1 = ?LIST_BP1,
        listBP2 = ?LIST_BP2,
        listBP3 = ?LIST_BP3
    },

    BattlePropsNew = prop_interface:calc(
        BattleProps, [{?BP_4_HIT, ?BPUseType_ADD, 0.0}], []),
    %% todo 怪物AI配置
    mod_ai:init(Uid, ?AI_ACTIVE),
    Req = #r_create_map_object_req{
        type = ?UID_TYPE_MON,
        pid = self(), uid = Uid, data_id = Mid,
        owner = 0, group = Group,
        pos = Pos, face = vector3:new(0.1, 0, 0.5),
        level = 1, name = "", sex = 0, race = 1, career = 1,
        battle_props = BattlePropsNew, buff_list = []
    },
    new(Req).


del_monster(Uid) ->
    del_all_rw(Uid),
    ok.

%%-------------------------------------------------------------------
new_npc(#recMapObjData{
    id = Mid,
    mapX = X,
    mapY = Y,
    name = Name,
    groupID = Group
}) ->

    Uid = uid_gen:npc_uid(),
    Pos = vector3:new(X, 0.0, Y),
    init_rw_default(Uid),

    #npcCfg{} = getCfg:getCfgByArgs(cfg_npc, Mid),

    Req = #r_create_map_object_req{
        type = ?UID_TYPE_NPC,
        pid = self(), uid = Uid, data_id = Mid,
        owner = 0, group = Group,
        pos = Pos, face = vector3:new(0.1, 0, 0.5),
        level = 1, name = erlang:binary_to_list(Name), sex = 0, race = 1, career = 1
    },
    new(Req).
%%-------------------------------------------------------------------
new(
    #r_create_map_object_req{
        type = Type,
        pid = Pid, uid = Uid, data_id = Did,
        owner = Owner, group = Group,
        pos = Pos, face = Face,
        level = Level, name = Name, sex = Sex,
        race = Race, career = Career,
        battle_props = BattleProps,
        buff_list = BuffList
    }
) ->
    mod_move:init(Uid, Pos, Face),
    
    object_rw:set_fields_direct(
        Uid,
        [
            {#m_object_rw.born_pos, Pos},
            {#m_object_rw.level, Level},
            {#m_object_rw.name, Name},
            {#m_object_rw.sex, Sex},
            {#m_object_rw.race, Race},
            {#m_object_rw.career, Career},
            {#m_object_rw.data_id, Did},
            {#m_object_rw.group, Group},
            {#m_object_rw.pid, Pid},
            {#m_object_rw.type, Type},
            {#m_object_rw.battle_props, BattleProps},
            {#m_object_rw.buff_list, BuffList}
        ]
    ),
    
    #m_cache_map_object_priv{
        map_id = map_rw:map_id(),
        line_id = map_rw:line_id(),
        map_pid = self(),
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
get_uid(ObjPriv) -> ObjPriv#m_cache_map_object_priv.uid.
get_pid(ObjPriv) -> ObjPriv#m_cache_map_object_priv.pid.
get_data_id(ObjPriv) -> ObjPriv#m_cache_map_object_priv.data_id.
get_owner(ObjPriv) -> ObjPriv#m_cache_map_object_priv.owner.
get_type(ObjPriv) -> ObjPriv#m_cache_map_object_priv.type.
%%-------------------------------------------------------------------



%%-------------------------------------------------------------------
find_object_priv(Uid) ->
    Type = object_rw:get_type(Uid),
    object_priv:find_object_priv(Type, Uid).

find_object_priv(?UID_TYPE_PLAYER, Uid) ->
    case misc_ets:read(?ETS_CACHE_MAP_PLAYER_PRIV, Uid) of
        [#m_cache_map_object_priv{} = ObjPriv | _] -> ObjPriv;
        _ -> undefined
    end;
find_object_priv(?UID_TYPE_MON, Uid) ->
    case misc_ets:read(?ETS_CACHE_MAP_MONSTER_PRIV, Uid) of
        [#m_cache_map_object_priv{} = ObjPriv | _] -> ObjPriv;
        _ -> undefined
    end;
find_object_priv(?UID_TYPE_PET, Uid) ->
    case misc_ets:read(?ETS_CACHE_MAP_PET_PRIV, Uid) of
        [#m_cache_map_object_priv{} = ObjPriv | _] -> ObjPriv;
        _ -> undefined
    end;
find_object_priv(?UID_TYPE_NPC, Uid) ->
    case misc_ets:read(?ETS_CACHE_MAP_NPC_PRIV, Uid) of
        [#m_cache_map_object_priv{} = ObjPriv | _] -> ObjPriv;
        _ -> undefined
    end;
find_object_priv(_Type, _Uid) -> undefined.

object_priv_exist(?UID_TYPE_PLAYER, Uid) ->
    misc_ets:member(?ETS_CACHE_MAP_PLAYER_PRIV, Uid);
object_priv_exist(?UID_TYPE_MON, Uid) ->
    misc_ets:member(?ETS_CACHE_MAP_MONSTER_PRIV, Uid);
object_priv_exist(?UID_TYPE_PET, Uid) ->
    misc_ets:member(?ETS_CACHE_MAP_PET_PRIV, Uid);
object_priv_exist(?UID_TYPE_NPC, Uid) ->
    misc_ets:member(?ETS_CACHE_MAP_NPC_PRIV, Uid).
