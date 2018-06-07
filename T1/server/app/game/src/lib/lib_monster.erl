%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 14. 五月 2018 14:10
%%%-------------------------------------------------------------------
-module(lib_monster).
-author("mawenhong").
-include("logger.hrl").
-include("map.hrl").
-include("map_obj.hrl").
-include("vector3.hrl").
-include("cfg_monster.hrl").

%% API
-export([create/1]).

create(#recMapObjData{
   id = Mid,
    mapX = X,
    mapY = Y,
    name = Name,
    groupID = Group
}) ->
    
    #monsterCfg{
        
    } = getCfg:getCfgByArgs(cfg_monster, Mid),

    Pid = self(),
    Uid = uid_gen:mon_uid(),
    Pos = vector3:new(X, 0.0, Y),

    lib_obj_rw:set_uid(Uid, Uid),
    lib_obj_rw:set_did(Uid, Mid),
    lib_obj_rw:set_name(Uid, Name),
    lib_obj_rw:set_group(Uid, Group),
    lib_obj_rw:set_type(Uid, ?OBJ_MON),
    lib_obj_rw:set_pid(Uid, Pid),
    lib_obj_rw:set_move_speed(Uid, 20),

    lib_move:init(Uid, Pos, vector3:new(0.1, 0, 0.5)),
    Uid.
