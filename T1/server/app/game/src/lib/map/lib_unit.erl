%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 14. 五月 2018 14:10
%%%-------------------------------------------------------------------
-module(lib_unit).
-author("mawenhong").

-include("logger.hrl").
-include("map.hrl").
-include("map_unit.hrl").
-include("vector3.hrl").
-include("cfg_monster.hrl").
-include("ai_def.hrl").

%% API
-export([new_player/5, del_player/1,new_monster/1, del_monster/1]).
-export([get_uid/1, get_pid/1, get_did/1, get_owner/1, get_type/1]).
-export([
    is_unit_cant_move_state/1, is_dead/1
]).


is_unit_cant_move_state(_Uid) ->
    %% todo 检查目标是否处于死亡，定身，眩晕等等或者在释放技能等等
    ok.


is_dead(Uid) ->
    lib_unit_rw:get_hp(Uid) =< 0.


%%-------------------------------------------------------------------
new_player(Pid, Uid, Group, Pos, Face) ->
    lib_ai_rw:init_default(Uid),
    lib_move_rw:init_default(Uid),
    lib_unit_rw:init_default(Uid),
    new(?OBJ_USR, Pid, Uid, 0, 0, Group, Pos, Face).

del_player(Uid) ->
    lib_ai_rw:del(Uid),
    lib_move_rw:del(Uid),
    lib_unit_rw:del(Uid),
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
    lib_ai_rw:init_default(Uid),
    lib_move_rw:init_default(Uid),
    lib_unit_rw:init_default(Uid),
    lib_ai:init(Uid, ?AIAT_Active),
    new(?OBJ_MON, Pid, Uid, Mid, 0, Group, Pos, vector3:new(0.1, 0, 0.5)).


del_monster(Uid) ->
    lib_ai_rw:del(Uid),
    lib_move_rw:del(Uid),
    lib_unit_rw:del(Uid),
    ok.


%%-------------------------------------------------------------------
new(Type, Pid, Uid, Did, Owner, Group, Pos, Face) ->
    lib_move:init(Uid, Pos, Face),
    lib_unit_rw:set_did(Uid, Did),
    lib_unit_rw:set_group(Uid, Group),
    lib_unit_rw:set_pid(Uid, Pid),
    lib_unit_rw:set_type(Uid, Type),
    #m_map_unit{uid = Uid, pid = Pid, did = Did, owner = Owner, type = Type}.



%%-------------------------------------------------------------------
get_uid(Unit) -> Unit#m_map_unit.uid.
get_pid(Unit) -> Unit#m_map_unit.pid.
get_did(Unit) -> Unit#m_map_unit.did.
get_owner(Unit) -> Unit#m_map_unit.owner.
get_type(Unit) -> Unit#m_map_unit.type.
%%-------------------------------------------------------------------
