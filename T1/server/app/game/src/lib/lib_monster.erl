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

    Pos =  vector3:new(X, 0.0, Y),

    Obj1 = #r_map_obj{
        uid = uid_gen:mon_uid(),
        did = Mid,
        name = Name,
        group = Group,
        type = ?OBJ_MON,
        map_id = lib_map_rw:get_map_id(),
        line_id = lib_map_rw:get_line_id(),
        pid = self(),
        map_pid = self()
    },
    lib_move:init(Obj1, Pos, vector3:new(0.1, 0, 0.5)).
