%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 14. 五月 2018 14:10
%%%-------------------------------------------------------------------
-module(unit).
-author("mawenhong").

-include("logger.hrl").
-include("map_core.hrl").
-include("gs_cache.hrl").
-include("cfg_monster.hrl").
-include("ai.hrl").

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
    unit_rw:get_hp(Uid) =< 0.


%%-------------------------------------------------------------------
new_player(Pid, Uid, Group, Pos, Face) ->
    init_rw_default(Uid),
    new(?UNIT_PLAYER, Pid, Uid, 0, 0, Group, Pos, Face).

del_player(Uid) ->
    del_all_rw(Uid),
    ok.

%%-------------------------------------------------------------------
new_static(Group, Pos, Face) ->
    Pid = self(),
    Uid = uid_gen:mon_uid(),
    init_rw_default(Uid),
    new(?UNIT_STATIC, Pid, Uid, 0, 0, Group, Pos, Face).

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
    ai_mod:init(Uid, ?AIAT_Active),
    new(?UNIT_MON, Pid, Uid, Mid, 0, Group, Pos, vector3:new(0.1, 0, 0.5)).


del_monster(Uid) ->
    del_all_rw(Uid),
    ok.
%%-------------------------------------------------------------------
new(Type, Pid, Uid, Did, Owner, Group, Pos, Face) ->
    move_mod:init(Uid, Pos, Face),
    unit_rw:set_data_id(Uid, Did),
    unit_rw:set_group(Uid, Group),
    unit_rw:set_pid(Uid, Pid),
    unit_rw:set_type(Uid, Type),

    #m_cache_map_unit{
        map_id  = map_rw:get_map_id(),
        line_id = map_rw:get_line_id(),
        uid = Uid, pid = Pid, data_id = Did,
        owner = Owner, type = Type
    }.


%%-------------------------------------------------------------------
%%-------------------------------------------------------------------
init_rw_default(Uid)->
    ?WARN("init_rw_default(~p)",[Uid]),
    ai_rw:init_default(Uid),
    move_rw:init_default(Uid),
    unit_rw:init_default(Uid),
    combat_rw:init_default(Uid),
    ok.

del_all_rw(Uid) ->
    ?WARN("del_all_rw(~p)",[Uid]),
    ai_rw:del(Uid),
    move_rw:del(Uid),
    unit_rw:del(Uid),
    combat_rw:del(Uid),
    ok.

%%-------------------------------------------------------------------
%%-------------------------------------------------------------------


%%-------------------------------------------------------------------
get_uid(Unit) -> Unit#m_cache_map_unit.uid.
get_pid(Unit) -> Unit#m_cache_map_unit.pid.
get_data_id(Unit) -> Unit#m_cache_map_unit.data_id.
get_owner(Unit) -> Unit#m_cache_map_unit.owner.
get_type(Unit) -> Unit#m_cache_map_unit.type.
%%-------------------------------------------------------------------
