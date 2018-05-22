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
-include("obj.hrl").
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

    Pos =  #vector3{x = X, y = 0.0, z = Y},

    Obj1 = #r_obj{
        uid = uid_gen:mon_uid(),
        did = Mid,
        name = Name,
        group = Group,
        type = ?OBJ_MON,
        map_id = lib_map:get_map_id(),
        line_id = lib_map:get_line_id(),
        pid = self(),
        map_pid = self()
    },
    lib_move:init(Obj1, Pos, #vector3{x= 0.1, z = 0.5}).
