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

    Code = code_gen:gen(?OBJ_MON),
    #obj{
        code = Code,
        id = Mid,
        name = Name,
        group = Group,
        type = ?OBJ_MON,
        map_id = lib_map:get_map_id(),
        line_id = lib_map:get_line_id(),
        pid = self(),
        map_pid = self(),
        pos = #vector3{x = X, y = 0.0, z = Y},
        com = undefined
    }.
