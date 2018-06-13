%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 14. 五月 2018 14:10
%%%-------------------------------------------------------------------
-module(lib_obj).
-author("mawenhong").

-include("logger.hrl").
-include("map.hrl").
-include("map_obj.hrl").
-include("vector3.hrl").
-include("cfg_monster.hrl").

%% API
-export([new_player/5]).
-export([new_monster/1]).
%%
-export([get_uid/1]).
-export([get_pid/1]).
-export([get_did/1]).
-export([get_owner/1]).
-export([get_type/1]).

%%-------------------------------------------------------------------
new_player(Pid, Uid, Group, Pos, Face) ->
    new(?OBJ_USR, Pid, Uid, 0, 0, Group, Pos, Face).

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
    new(?OBJ_MON, Pid, Uid, Mid, 0, Group, Pos, vector3:new(0.1, 0, 0.5)).



%%-------------------------------------------------------------------
new(Type, Pid, Uid, Did, Owner, Group, Pos, Face) ->
    lib_move:init(Uid, Pos, Face),
    lib_obj_rw:set_did(Uid, Did),
    lib_obj_rw:set_group(Uid, Group),
    lib_obj_rw:set_pid(Uid, Pid),
    lib_obj_rw:set_type(Uid, Type),
    #m_map_obj{uid = Uid, pid = Pid, did = Did, owner = Owner, type = Type}.



%%-------------------------------------------------------------------
get_uid(Obj) -> Obj#m_map_obj.uid.
get_pid(Obj) -> Obj#m_map_obj.pid.
get_did(Obj) -> Obj#m_map_obj.did.
get_owner(Obj) -> Obj#m_map_obj.owner.
get_type(Obj) -> Obj#m_map_obj.type.
%%-------------------------------------------------------------------
