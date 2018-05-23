%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 19. 五月 2018 17:09
%%%-------------------------------------------------------------------
-module(lib_map_rw).
-author("mawenhong").
-include("map_obj.hrl").
-include("map.hrl").
%%
-export([init_ets/1]).

%% API
-export([player_update/2]).
-export([player_update_pos/2]).
-export([add_obj_to_ets/1]).
-export([get_player/1]).
-export([get_obj_pos/1]).
-export([get_obj_dest_pos/1]).
-export([get_obj_start_pos/1]).
-export([get_obj_face_to/1]).
-export([get_obj_move_dir/1]).
-export([get_obj_move_state/1]).
-export([get_obj_move_time/1]).
-export([get_obj_vis_tile_index/1, set_obj_vis_tile_index/2]).

-export([get_npc_ets/0, get_monster_ets/0]).
-export([get_pet_ets/0, get_player_ets/0]).
-export([get_map_id/0, get_line_id/0]).
-export([get_map_hook/0]).


-define(MAP_MON_ETS, map_monster_ets__).
-define(MAP_USR_ETS, map_player_ets__).
-define(MAP_NPC_ETS, map_npc_ets__).
-define(MAP_PET_ETS, map_pet_ets__).
-define(MAP_ID, map_id__).
-define(LINE_ID, line_id__).
-define(MAP_HOOK, map_hook__).

init_ets(State) ->
    put(?MAP_ID,        State#r_map_state.map_id),
    put(?LINE_ID,       State#r_map_state.line_id),
    put(?MAP_NPC_ETS,   State#r_map_state.npc),
    put(?MAP_PET_ETS,   State#r_map_state.pet),
    put(?MAP_USR_ETS,   State#r_map_state.player),
    put(?MAP_MON_ETS,   State#r_map_state.monster),
    put(?MAP_HOOK,      State#r_map_state.hook_mod),
    ok.
%%%-------------------------------------------------------------------
get_map_id()        -> get(?MAP_ID).
get_line_id()       -> get(?LINE_ID).
get_map_hook()      -> get(?MAP_HOOK).
get_npc_ets()       -> get(?MAP_NPC_ETS).
get_pet_ets()       -> get(?MAP_PET_ETS).
get_player_ets()    -> get(?MAP_USR_ETS).
get_monster_ets()   -> get(?MAP_MON_ETS).

%%%-------------------------------------------------------------------
get_player(PlayerId) ->
    case ets:lookup(lib_map_rw:get_player_ets(), PlayerId) of
        [#r_map_obj{} = Obj | _] -> Obj;
        _ -> undefined
    end.


%%%-------------------------------------------------------------------
player_update(PlayerId, Elements)->
    ets:update_element(
        lib_map_rw:get_player_ets(),
        PlayerId, Elements),
    ok.

player_update_pos(PlayerId, Pos)->
    ets:update_element(
        lib_map_rw:get_player_ets(),
        PlayerId, {#r_map_obj.pos, Pos}),
    ok.

%%%-------------------------------------------------------------------
add_obj_to_ets(#r_map_obj{type = ?OBJ_MON} = Obj) ->
    ets:insert(lib_map_rw:get_monster_ets(), Obj);
add_obj_to_ets(#r_map_obj{type = ?OBJ_USR} = Obj) ->
    ets:insert(lib_map_rw:get_player_ets(), Obj);
add_obj_to_ets(_) ->
    ok.

%%%-------------------------------------------------------------------
get_obj_pos(Obj) -> Obj#r_map_obj.pos.
get_obj_move_state(Obj) -> Obj#r_map_obj.cur_move.
get_obj_start_pos(Obj) -> Obj#r_map_obj.start.
get_obj_dest_pos(Obj) -> Obj#r_map_obj.dest.
get_obj_move_dir(Obj) -> Obj#r_map_obj.dir.
get_obj_face_to(Obj) -> Obj#r_map_obj.face.
get_obj_move_time(Obj) -> Obj#r_map_obj.last_up_time - Obj#r_map_obj.start_time.
get_obj_vis_tile_index(Obj) -> Obj#r_map_obj.vis_tile_idx.
set_obj_vis_tile_index(Obj, Index) -> Obj#r_map_obj{vis_tile_idx = Index}.




