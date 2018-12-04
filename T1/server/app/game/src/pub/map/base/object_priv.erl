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
-include("ai.hrl").
-include("rec_rw.hrl").
-include("gs_common_rec.hrl").

%% API
-export([
    new/1,
    new_player/5, del_player/1,
    new_monster/1, del_monster/1,
    new_static/3, del_static/1,
    
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
    BattleProps = gs_cache_interface:read_online_player_element(Uid, #m_cache_online_player.battle_props),
    BuffList = gs_cache_interface:read_online_player_element(Uid, #m_cache_online_player.buff_list),
    object_rw:set_fields_direct(
        Uid,
        [
            {#m_object_rw.battle_props, BattleProps},
            {#m_object_rw.buff_list, BuffList}
        ]
    ),

    Req = #r_create_map_object_req{
        type = ?OBJ_PLAYER,
        pid = Pid, uid = Uid, data_id = 0,
        owner = 0, group = Group,
        pos = Pos, face = Face,
        level = 1, name = "", sex = 0, race = 1, career = 1
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
        type = ?OBJ_STATIC,
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
    
    %% todo 怪物AI配置
    mod_ai:init(Uid, ?AI_ACTIVE),
    Req = #r_create_map_object_req{
        type = ?OBJ_MON,
        pid = self(), uid = Uid, data_id = Mid,
        owner = 0, group = Group,
        pos = Pos, face = vector3:new(0.1, 0, 0.5),
        level = 1, name = "", sex = 0, race = 1, career = 1
    },
    new(Req).


del_monster(Uid) ->
    del_all_rw(Uid),
    ok.
%%-------------------------------------------------------------------
new(
    #r_create_map_object_req{
        type = Type,
        pid = Pid, uid = Uid, data_id = Did,
        owner = Owner, group = Group,
        pos = Pos, face = Face,
        level = Level, name = Name, sex = Sex,
        race = Race, career = Career
    }
) ->
    mod_move:init(Uid, Pos, Face),
    
    object_rw:set_fields_direct(
        Uid,
        [
            {#m_object_rw.level, Level},
            {#m_object_rw.name, Name},
            {#m_object_rw.sex, Sex},
            {#m_object_rw.race, Race},
            {#m_object_rw.career, Career},
            {#m_object_rw.data_id, Did},
            {#m_object_rw.group, Group},
            {#m_object_rw.pid, Pid},
            {#m_object_rw.type, Type}
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
get_uid(Obj) -> Obj#m_cache_map_object_priv.uid.
get_pid(Obj) -> Obj#m_cache_map_object_priv.pid.
get_data_id(Obj) -> Obj#m_cache_map_object_priv.data_id.
get_owner(Obj) -> Obj#m_cache_map_object_priv.owner.
get_type(Obj) -> Obj#m_cache_map_object_priv.type.
%%-------------------------------------------------------------------



%%-------------------------------------------------------------------
find_object_priv(Uid) ->
    Type = object_rw:get_type(Uid),
    object_priv:find_object_priv(Type, Uid).

find_object_priv(?OBJ_PLAYER, Uid) ->
    case misc_ets:read(?ETS_CACHE_MAP_PLAYER_PRIV, Uid) of
        [#m_cache_map_object_priv{} = Obj | _] -> Obj;
        _ -> undefined
    end;
find_object_priv(?OBJ_MON, Uid) ->
    case misc_ets:read(?ETS_CACHE_MAP_MONSTER_PRIV, Uid) of
        [#m_cache_map_object_priv{} = Obj | _] -> Obj;
        _ -> undefined
    end;
find_object_priv(?OBJ_PET, Uid) ->
    case misc_ets:read(?ETS_CACHE_MAP_PET_PRIV, Uid) of
        [#m_cache_map_object_priv{} = Obj | _] -> Obj;
        _ -> undefined
    end;
find_object_priv(?OBJ_NPC, Uid) ->
    case misc_ets:read(?ETS_CACHE_MAP_NPC_PRIV, Uid) of
        [#m_cache_map_object_priv{} = Obj | _] -> Obj;
        _ -> undefined
    end;
find_object_priv(_Type, _Uid) -> undefined.

object_priv_exist(?OBJ_PLAYER, Uid) ->
    misc_ets:member(?ETS_CACHE_MAP_PLAYER_PRIV, Uid);
object_priv_exist(?OBJ_MON, Uid) ->
    misc_ets:member(?ETS_CACHE_MAP_MONSTER_PRIV, Uid);
object_priv_exist(?OBJ_PET, Uid) ->
    misc_ets:member(?ETS_CACHE_MAP_PET_PRIV, Uid);
object_priv_exist(?OBJ_NPC, Uid) ->
    misc_ets:member(?ETS_CACHE_MAP_NPC_PRIV, Uid).
