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

%% API

%% obj
-export([get_obj_pos/1]).
-export([get_obj_dest_pos/1]).
-export([get_obj_start_pos/1]).
-export([get_obj_face_to/1]).
-export([get_obj_move_dir/1]).
-export([get_obj_move_state/1]).
-export([get_obj_moved_time/1]).
-export([get_obj_move_diff_time/2]).
-export([get_obj_speed/1]).
-export([get_obj_vis_tile_index/1, set_obj_vis_tile_index/2]).

-export([obj_type/1]).
-export([is_player/1, is_monster/1, is_pet/1, is_npc/1]).

%%-------------------------------------------------------------------
obj_type(Obj) -> Obj#r_map_obj.type.

%%-------------------------------------------------------------------
is_npc(Obj)     -> Obj#r_map_obj.type =:= ?OBJ_NPC.
is_pet(Obj)     -> Obj#r_map_obj.type =:= ?OBJ_PET.
is_player(Obj)  -> Obj#r_map_obj.type =:= ?OBJ_USR.
is_monster(Obj) -> Obj#r_map_obj.type =:= ?OBJ_MON.

%%-------------------------------------------------------------------
get_obj_pos(Obj)                    -> Obj#r_map_obj.cur_pos.
get_obj_move_state(Obj)             -> Obj#r_map_obj.cur_move.
get_obj_start_pos(Obj)              -> Obj#r_map_obj.start_pos.
get_obj_dest_pos(Obj)               -> Obj#r_map_obj.dest_pos.
get_obj_move_dir(Obj)               -> Obj#r_map_obj.dir.
get_obj_face_to(Obj)                -> Obj#r_map_obj.face.
get_obj_moved_time(Obj)             -> Obj#r_map_obj.moved_time.
get_obj_move_diff_time(Obj, Now)    -> Now - Obj#r_map_obj.last_up_time.
get_obj_speed(Obj)                  -> Obj#r_map_obj.move_speed.
get_obj_vis_tile_index(Obj)         -> Obj#r_map_obj.vis_tile_idx.
set_obj_vis_tile_index(Obj, Index)  -> Obj#r_map_obj{vis_tile_idx = Index}.

