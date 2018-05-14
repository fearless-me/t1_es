%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 14. 五月 2018 14:10
%%%-------------------------------------------------------------------
-module(lib_map_obj).
-author("mawenhong").

-include("logger.hrl").
-include("map.hrl").
-include("obj.hrl").

%% API

-export([obj_type/1]).
-export([is_player/1, is_Monster/1, is_pet/1, is_Npc/1]).


obj_type(Obj) -> Obj#obj.type.

is_player(Obj) -> Obj#obj.type =:= ?OBJ_USR.
is_Monster(Obj) -> Obj#obj.type =:= ?OBJ_MON.
is_Npc(Obj) -> Obj#obj.type =:= ?OBJ_NPC.
is_pet(Obj) -> Obj#obj.type =:= ?OBJ_PET.
