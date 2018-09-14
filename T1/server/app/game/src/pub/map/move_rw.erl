%%-------------------------------------------------------------------
%%% This File Is AUTO GENERATED, Don't Modify it MANUALLY!!!
%%% This File Is AUTO GENERATED, Don't Modify it MANUALLY!!!
%%% This File Is AUTO GENERATED, Don't Modify it MANUALLY!!!
%%-------------------------------------------------------------------
-module(move_rw).

%%-------------------------------------------------------------------
-include("logger.hrl").
-include("pub_def.hrl").
-include("rec_rw.hrl").
%%-------------------------------------------------------------------

-export([
	get_move_speed/1,get_move_speed_def/2,set_move_speed/2,set_move_speed_direct/2, % #m_move_rw.move_speed
	get_cur_move/1,get_cur_move_def/2,set_cur_move/2,set_cur_move_direct/2, % #m_move_rw.cur_move
	get_next_move/1,get_next_move_def/2,set_next_move/2,set_next_move_direct/2, % #m_move_rw.next_move
	get_vis_tile_idx/1,get_vis_tile_idx_def/2,set_vis_tile_idx/2,set_vis_tile_idx_direct/2, % #m_move_rw.vis_tile_idx
	get_cur_pos/1,get_cur_pos_def/2,set_cur_pos/2,set_cur_pos_direct/2, % #m_move_rw.cur_pos
	get_start_pos/1,get_start_pos_def/2,set_start_pos/2,set_start_pos_direct/2, % #m_move_rw.start_pos
	get_dest_pos/1,get_dest_pos_def/2,set_dest_pos/2,set_dest_pos_direct/2, % #m_move_rw.dest_pos
	get_face/1,get_face_def/2,set_face/2,set_face_direct/2, % #m_move_rw.face
	get_dir/1,get_dir_def/2,set_dir/2,set_dir_direct/2, % #m_move_rw.dir
	get_start_time/1,get_start_time_def/2,set_start_time/2,set_start_time_direct/2, % #m_move_rw.start_time
	get_seg_move_time/1,get_seg_move_time_def/2,set_seg_move_time/2,set_seg_move_time_direct/2, % #m_move_rw.seg_move_time
	get_force_stopped/1,get_force_stopped_def/2,set_force_stopped/2,set_force_stopped_direct/2, % #m_move_rw.force_stopped
	get_path_list/1,get_path_list_def/2,set_path_list/2,set_path_list_direct/2, % #m_move_rw.path_list
	% common function 
	del/1,to_record/1,set/2,set_fields/2,init_default/1,init_default/2
]).
%%-------------------------------------------------------------------
%%-------------------------------------------------------------------
%%-------------------------------------------------------------------
%% #m_move_rw.move_speed
get_move_speed(Uid)-> get_move_speed_def(Uid,undefined).

get_move_speed_def(Uid,Def)->
	case erlang:get({Uid,m_move_rw}) of
	undefined -> Def; 
	V -> V#m_move_rw.move_speed 
	end.

set_move_speed(Uid,V)->
	R = erlang:get({Uid,m_move_rw}),
	erlang:put({Uid,m_move_rw}, R#m_move_rw{move_speed = V}),
	?TRY_CATCH(hook_map:on_rw_update(Uid,move_speed,R)).

set_move_speed_direct(Uid,V)->
	R = erlang:get({Uid,m_move_rw}),
	erlang:put({Uid,m_move_rw}, R#m_move_rw{move_speed = V}).

%%-------------------------------------------------------------------
%% #m_move_rw.cur_move
get_cur_move(Uid)-> get_cur_move_def(Uid,undefined).

get_cur_move_def(Uid,Def)->
	case erlang:get({Uid,m_move_rw}) of
	undefined -> Def; 
	V -> V#m_move_rw.cur_move 
	end.

set_cur_move(Uid,V)->
	R = erlang:get({Uid,m_move_rw}),
	erlang:put({Uid,m_move_rw}, R#m_move_rw{cur_move = V}),
	?TRY_CATCH(hook_map:on_rw_update(Uid,cur_move,R)).

set_cur_move_direct(Uid,V)->
	R = erlang:get({Uid,m_move_rw}),
	erlang:put({Uid,m_move_rw}, R#m_move_rw{cur_move = V}).

%%-------------------------------------------------------------------
%% #m_move_rw.next_move
get_next_move(Uid)-> get_next_move_def(Uid,undefined).

get_next_move_def(Uid,Def)->
	case erlang:get({Uid,m_move_rw}) of
	undefined -> Def; 
	V -> V#m_move_rw.next_move 
	end.

set_next_move(Uid,V)->
	R = erlang:get({Uid,m_move_rw}),
	erlang:put({Uid,m_move_rw}, R#m_move_rw{next_move = V}),
	?TRY_CATCH(hook_map:on_rw_update(Uid,next_move,R)).

set_next_move_direct(Uid,V)->
	R = erlang:get({Uid,m_move_rw}),
	erlang:put({Uid,m_move_rw}, R#m_move_rw{next_move = V}).

%%-------------------------------------------------------------------
%% #m_move_rw.vis_tile_idx
get_vis_tile_idx(Uid)-> get_vis_tile_idx_def(Uid,undefined).

get_vis_tile_idx_def(Uid,Def)->
	case erlang:get({Uid,m_move_rw}) of
	undefined -> Def; 
	V -> V#m_move_rw.vis_tile_idx 
	end.

set_vis_tile_idx(Uid,V)->
	R = erlang:get({Uid,m_move_rw}),
	erlang:put({Uid,m_move_rw}, R#m_move_rw{vis_tile_idx = V}),
	?TRY_CATCH(hook_map:on_rw_update(Uid,vis_tile_idx,R)).

set_vis_tile_idx_direct(Uid,V)->
	R = erlang:get({Uid,m_move_rw}),
	erlang:put({Uid,m_move_rw}, R#m_move_rw{vis_tile_idx = V}).

%%-------------------------------------------------------------------
%% #m_move_rw.cur_pos
get_cur_pos(Uid)-> get_cur_pos_def(Uid,undefined).

get_cur_pos_def(Uid,Def)->
	case erlang:get({Uid,m_move_rw}) of
	undefined -> Def; 
	V -> V#m_move_rw.cur_pos 
	end.

set_cur_pos(Uid,V)->
	R = erlang:get({Uid,m_move_rw}),
	erlang:put({Uid,m_move_rw}, R#m_move_rw{cur_pos = V}),
	?TRY_CATCH(hook_map:on_rw_update(Uid,cur_pos,R)).

set_cur_pos_direct(Uid,V)->
	R = erlang:get({Uid,m_move_rw}),
	erlang:put({Uid,m_move_rw}, R#m_move_rw{cur_pos = V}).

%%-------------------------------------------------------------------
%% #m_move_rw.start_pos
get_start_pos(Uid)-> get_start_pos_def(Uid,undefined).

get_start_pos_def(Uid,Def)->
	case erlang:get({Uid,m_move_rw}) of
	undefined -> Def; 
	V -> V#m_move_rw.start_pos 
	end.

set_start_pos(Uid,V)->
	R = erlang:get({Uid,m_move_rw}),
	erlang:put({Uid,m_move_rw}, R#m_move_rw{start_pos = V}),
	?TRY_CATCH(hook_map:on_rw_update(Uid,start_pos,R)).

set_start_pos_direct(Uid,V)->
	R = erlang:get({Uid,m_move_rw}),
	erlang:put({Uid,m_move_rw}, R#m_move_rw{start_pos = V}).

%%-------------------------------------------------------------------
%% #m_move_rw.dest_pos
get_dest_pos(Uid)-> get_dest_pos_def(Uid,undefined).

get_dest_pos_def(Uid,Def)->
	case erlang:get({Uid,m_move_rw}) of
	undefined -> Def; 
	V -> V#m_move_rw.dest_pos 
	end.

set_dest_pos(Uid,V)->
	R = erlang:get({Uid,m_move_rw}),
	erlang:put({Uid,m_move_rw}, R#m_move_rw{dest_pos = V}),
	?TRY_CATCH(hook_map:on_rw_update(Uid,dest_pos,R)).

set_dest_pos_direct(Uid,V)->
	R = erlang:get({Uid,m_move_rw}),
	erlang:put({Uid,m_move_rw}, R#m_move_rw{dest_pos = V}).

%%-------------------------------------------------------------------
%% #m_move_rw.face
get_face(Uid)-> get_face_def(Uid,undefined).

get_face_def(Uid,Def)->
	case erlang:get({Uid,m_move_rw}) of
	undefined -> Def; 
	V -> V#m_move_rw.face 
	end.

set_face(Uid,V)->
	R = erlang:get({Uid,m_move_rw}),
	erlang:put({Uid,m_move_rw}, R#m_move_rw{face = V}),
	?TRY_CATCH(hook_map:on_rw_update(Uid,face,R)).

set_face_direct(Uid,V)->
	R = erlang:get({Uid,m_move_rw}),
	erlang:put({Uid,m_move_rw}, R#m_move_rw{face = V}).

%%-------------------------------------------------------------------
%% #m_move_rw.dir
get_dir(Uid)-> get_dir_def(Uid,undefined).

get_dir_def(Uid,Def)->
	case erlang:get({Uid,m_move_rw}) of
	undefined -> Def; 
	V -> V#m_move_rw.dir 
	end.

set_dir(Uid,V)->
	R = erlang:get({Uid,m_move_rw}),
	erlang:put({Uid,m_move_rw}, R#m_move_rw{dir = V}),
	?TRY_CATCH(hook_map:on_rw_update(Uid,dir,R)).

set_dir_direct(Uid,V)->
	R = erlang:get({Uid,m_move_rw}),
	erlang:put({Uid,m_move_rw}, R#m_move_rw{dir = V}).

%%-------------------------------------------------------------------
%% #m_move_rw.start_time
get_start_time(Uid)-> get_start_time_def(Uid,undefined).

get_start_time_def(Uid,Def)->
	case erlang:get({Uid,m_move_rw}) of
	undefined -> Def; 
	V -> V#m_move_rw.start_time 
	end.

set_start_time(Uid,V)->
	R = erlang:get({Uid,m_move_rw}),
	erlang:put({Uid,m_move_rw}, R#m_move_rw{start_time = V}),
	?TRY_CATCH(hook_map:on_rw_update(Uid,start_time,R)).

set_start_time_direct(Uid,V)->
	R = erlang:get({Uid,m_move_rw}),
	erlang:put({Uid,m_move_rw}, R#m_move_rw{start_time = V}).

%%-------------------------------------------------------------------
%% #m_move_rw.seg_move_time
get_seg_move_time(Uid)-> get_seg_move_time_def(Uid,undefined).

get_seg_move_time_def(Uid,Def)->
	case erlang:get({Uid,m_move_rw}) of
	undefined -> Def; 
	V -> V#m_move_rw.seg_move_time 
	end.

set_seg_move_time(Uid,V)->
	R = erlang:get({Uid,m_move_rw}),
	erlang:put({Uid,m_move_rw}, R#m_move_rw{seg_move_time = V}),
	?TRY_CATCH(hook_map:on_rw_update(Uid,seg_move_time,R)).

set_seg_move_time_direct(Uid,V)->
	R = erlang:get({Uid,m_move_rw}),
	erlang:put({Uid,m_move_rw}, R#m_move_rw{seg_move_time = V}).

%%-------------------------------------------------------------------
%% #m_move_rw.force_stopped
get_force_stopped(Uid)-> get_force_stopped_def(Uid,undefined).

get_force_stopped_def(Uid,Def)->
	case erlang:get({Uid,m_move_rw}) of
	undefined -> Def; 
	V -> V#m_move_rw.force_stopped 
	end.

set_force_stopped(Uid,V)->
	R = erlang:get({Uid,m_move_rw}),
	erlang:put({Uid,m_move_rw}, R#m_move_rw{force_stopped = V}),
	?TRY_CATCH(hook_map:on_rw_update(Uid,force_stopped,R)).

set_force_stopped_direct(Uid,V)->
	R = erlang:get({Uid,m_move_rw}),
	erlang:put({Uid,m_move_rw}, R#m_move_rw{force_stopped = V}).

%%-------------------------------------------------------------------
%% #m_move_rw.path_list
get_path_list(Uid)-> get_path_list_def(Uid,undefined).

get_path_list_def(Uid,Def)->
	case erlang:get({Uid,m_move_rw}) of
	undefined -> Def; 
	V -> V#m_move_rw.path_list 
	end.

set_path_list(Uid,V)->
	R = erlang:get({Uid,m_move_rw}),
	erlang:put({Uid,m_move_rw}, R#m_move_rw{path_list = V}),
	?TRY_CATCH(hook_map:on_rw_update(Uid,path_list,R)).

set_path_list_direct(Uid,V)->
	R = erlang:get({Uid,m_move_rw}),
	erlang:put({Uid,m_move_rw}, R#m_move_rw{path_list = V}).

%%-------------------------------------------------------------------
del(Uid)-> erlang:erase({Uid,m_move_rw}).

%%-------------------------------------------------------------------
to_record(Uid)-> erlang:get({Uid,m_move_rw}).

%%-------------------------------------------------------------------
set(Uid,#m_move_rw{}=V)->
	erlang:put({Uid,m_move_rw}, V).

%%-------------------------------------------------------------------
init_default(Uid)-> erlang:put({Uid,m_move_rw}, #m_move_rw{}).
init_default(Uid,#m_move_rw{}=V) -> erlang:put({Uid,m_move_rw}, V).

%%-------------------------------------------------------------------
set_fields(_Uid,[]) ->ok;
set_fields(Uid,FieldList) ->
	R1 = erlang:get({Uid,m_move_rw}),
	R2 = i_set_fields(Uid,FieldList,R1),
	erlang:put({Uid,m_move_rw}, R2),
	ok.

%%-------------------------------------------------------------------
i_set_fields(_Uid,R, []) ->
	R;
i_set_fields(Uid,R, [H | FieldList]) ->
	i_set_fields(Uid,i_set_field(Uid,R,H), FieldList).

%%#m_move_rw.move_speed
i_set_field(Uid,{move_speed, Val}, R) ->
	R1 = R#m_move_rw{move_speed = Val},
	?TRY_CATCH(hook_map:on_rw_update(Uid,move_speed,R)),
	R1;
i_set_field(Uid,{move_speed, Val, add}, R) ->
	R1 = R#m_move_rw{move_speed = R#m_move_rw.move_speed + Val},
	?TRY_CATCH(hook_map:on_rw_update(Uid,move_speed,R)),
	R1;
i_set_field(Uid,{move_speed, Val, sub}, R) ->
	R1 = R#m_move_rw{move_speed = R#m_move_rw.move_speed - Val},
	?TRY_CATCH(hook_map:on_rw_update(Uid,move_speed,R)),
	R1;
i_set_field(Uid,{#m_move_rw.move_speed, Val}, R) ->
	R1 = R#m_move_rw{move_speed = Val},
	?TRY_CATCH(hook_map:on_rw_update(Uid,move_speed,R)),
	R1;
i_set_field(Uid,{#m_move_rw.move_speed, Val, add}, R) ->
	R1 = R#m_move_rw{move_speed = R#m_move_rw.move_speed + Val},
	?TRY_CATCH(hook_map:on_rw_update(Uid,move_speed,R)),
	R1;
i_set_field(Uid,{#m_move_rw.move_speed, Val, sub}, R) ->
	R1 = R#m_move_rw{move_speed = R#m_move_rw.move_speed - Val},
	?TRY_CATCH(hook_map:on_rw_update(Uid,move_speed,R)),
	R1;
%%#m_move_rw.cur_move
i_set_field(Uid,{cur_move, Val}, R) ->
	R1 = R#m_move_rw{cur_move = Val},
	?TRY_CATCH(hook_map:on_rw_update(Uid,cur_move,R)),
	R1;
i_set_field(Uid,{cur_move, Val, add}, R) ->
	R1 = R#m_move_rw{cur_move = R#m_move_rw.cur_move + Val},
	?TRY_CATCH(hook_map:on_rw_update(Uid,cur_move,R)),
	R1;
i_set_field(Uid,{cur_move, Val, sub}, R) ->
	R1 = R#m_move_rw{cur_move = R#m_move_rw.cur_move - Val},
	?TRY_CATCH(hook_map:on_rw_update(Uid,cur_move,R)),
	R1;
i_set_field(Uid,{#m_move_rw.cur_move, Val}, R) ->
	R1 = R#m_move_rw{cur_move = Val},
	?TRY_CATCH(hook_map:on_rw_update(Uid,cur_move,R)),
	R1;
i_set_field(Uid,{#m_move_rw.cur_move, Val, add}, R) ->
	R1 = R#m_move_rw{cur_move = R#m_move_rw.cur_move + Val},
	?TRY_CATCH(hook_map:on_rw_update(Uid,cur_move,R)),
	R1;
i_set_field(Uid,{#m_move_rw.cur_move, Val, sub}, R) ->
	R1 = R#m_move_rw{cur_move = R#m_move_rw.cur_move - Val},
	?TRY_CATCH(hook_map:on_rw_update(Uid,cur_move,R)),
	R1;
%%#m_move_rw.next_move
i_set_field(Uid,{next_move, Val}, R) ->
	R1 = R#m_move_rw{next_move = Val},
	?TRY_CATCH(hook_map:on_rw_update(Uid,next_move,R)),
	R1;
i_set_field(Uid,{next_move, Val, add}, R) ->
	R1 = R#m_move_rw{next_move = R#m_move_rw.next_move + Val},
	?TRY_CATCH(hook_map:on_rw_update(Uid,next_move,R)),
	R1;
i_set_field(Uid,{next_move, Val, sub}, R) ->
	R1 = R#m_move_rw{next_move = R#m_move_rw.next_move - Val},
	?TRY_CATCH(hook_map:on_rw_update(Uid,next_move,R)),
	R1;
i_set_field(Uid,{#m_move_rw.next_move, Val}, R) ->
	R1 = R#m_move_rw{next_move = Val},
	?TRY_CATCH(hook_map:on_rw_update(Uid,next_move,R)),
	R1;
i_set_field(Uid,{#m_move_rw.next_move, Val, add}, R) ->
	R1 = R#m_move_rw{next_move = R#m_move_rw.next_move + Val},
	?TRY_CATCH(hook_map:on_rw_update(Uid,next_move,R)),
	R1;
i_set_field(Uid,{#m_move_rw.next_move, Val, sub}, R) ->
	R1 = R#m_move_rw{next_move = R#m_move_rw.next_move - Val},
	?TRY_CATCH(hook_map:on_rw_update(Uid,next_move,R)),
	R1;
%%#m_move_rw.vis_tile_idx
i_set_field(Uid,{vis_tile_idx, Val}, R) ->
	R1 = R#m_move_rw{vis_tile_idx = Val},
	?TRY_CATCH(hook_map:on_rw_update(Uid,vis_tile_idx,R)),
	R1;
i_set_field(Uid,{vis_tile_idx, Val, add}, R) ->
	R1 = R#m_move_rw{vis_tile_idx = R#m_move_rw.vis_tile_idx + Val},
	?TRY_CATCH(hook_map:on_rw_update(Uid,vis_tile_idx,R)),
	R1;
i_set_field(Uid,{vis_tile_idx, Val, sub}, R) ->
	R1 = R#m_move_rw{vis_tile_idx = R#m_move_rw.vis_tile_idx - Val},
	?TRY_CATCH(hook_map:on_rw_update(Uid,vis_tile_idx,R)),
	R1;
i_set_field(Uid,{#m_move_rw.vis_tile_idx, Val}, R) ->
	R1 = R#m_move_rw{vis_tile_idx = Val},
	?TRY_CATCH(hook_map:on_rw_update(Uid,vis_tile_idx,R)),
	R1;
i_set_field(Uid,{#m_move_rw.vis_tile_idx, Val, add}, R) ->
	R1 = R#m_move_rw{vis_tile_idx = R#m_move_rw.vis_tile_idx + Val},
	?TRY_CATCH(hook_map:on_rw_update(Uid,vis_tile_idx,R)),
	R1;
i_set_field(Uid,{#m_move_rw.vis_tile_idx, Val, sub}, R) ->
	R1 = R#m_move_rw{vis_tile_idx = R#m_move_rw.vis_tile_idx - Val},
	?TRY_CATCH(hook_map:on_rw_update(Uid,vis_tile_idx,R)),
	R1;
%%#m_move_rw.cur_pos
i_set_field(Uid,{cur_pos, Val}, R) ->
	R1 = R#m_move_rw{cur_pos = Val},
	?TRY_CATCH(hook_map:on_rw_update(Uid,cur_pos,R)),
	R1;
i_set_field(Uid,{cur_pos, Val, add}, R) ->
	R1 = R#m_move_rw{cur_pos = R#m_move_rw.cur_pos + Val},
	?TRY_CATCH(hook_map:on_rw_update(Uid,cur_pos,R)),
	R1;
i_set_field(Uid,{cur_pos, Val, sub}, R) ->
	R1 = R#m_move_rw{cur_pos = R#m_move_rw.cur_pos - Val},
	?TRY_CATCH(hook_map:on_rw_update(Uid,cur_pos,R)),
	R1;
i_set_field(Uid,{#m_move_rw.cur_pos, Val}, R) ->
	R1 = R#m_move_rw{cur_pos = Val},
	?TRY_CATCH(hook_map:on_rw_update(Uid,cur_pos,R)),
	R1;
i_set_field(Uid,{#m_move_rw.cur_pos, Val, add}, R) ->
	R1 = R#m_move_rw{cur_pos = R#m_move_rw.cur_pos + Val},
	?TRY_CATCH(hook_map:on_rw_update(Uid,cur_pos,R)),
	R1;
i_set_field(Uid,{#m_move_rw.cur_pos, Val, sub}, R) ->
	R1 = R#m_move_rw{cur_pos = R#m_move_rw.cur_pos - Val},
	?TRY_CATCH(hook_map:on_rw_update(Uid,cur_pos,R)),
	R1;
%%#m_move_rw.start_pos
i_set_field(Uid,{start_pos, Val}, R) ->
	R1 = R#m_move_rw{start_pos = Val},
	?TRY_CATCH(hook_map:on_rw_update(Uid,start_pos,R)),
	R1;
i_set_field(Uid,{start_pos, Val, add}, R) ->
	R1 = R#m_move_rw{start_pos = R#m_move_rw.start_pos + Val},
	?TRY_CATCH(hook_map:on_rw_update(Uid,start_pos,R)),
	R1;
i_set_field(Uid,{start_pos, Val, sub}, R) ->
	R1 = R#m_move_rw{start_pos = R#m_move_rw.start_pos - Val},
	?TRY_CATCH(hook_map:on_rw_update(Uid,start_pos,R)),
	R1;
i_set_field(Uid,{#m_move_rw.start_pos, Val}, R) ->
	R1 = R#m_move_rw{start_pos = Val},
	?TRY_CATCH(hook_map:on_rw_update(Uid,start_pos,R)),
	R1;
i_set_field(Uid,{#m_move_rw.start_pos, Val, add}, R) ->
	R1 = R#m_move_rw{start_pos = R#m_move_rw.start_pos + Val},
	?TRY_CATCH(hook_map:on_rw_update(Uid,start_pos,R)),
	R1;
i_set_field(Uid,{#m_move_rw.start_pos, Val, sub}, R) ->
	R1 = R#m_move_rw{start_pos = R#m_move_rw.start_pos - Val},
	?TRY_CATCH(hook_map:on_rw_update(Uid,start_pos,R)),
	R1;
%%#m_move_rw.dest_pos
i_set_field(Uid,{dest_pos, Val}, R) ->
	R1 = R#m_move_rw{dest_pos = Val},
	?TRY_CATCH(hook_map:on_rw_update(Uid,dest_pos,R)),
	R1;
i_set_field(Uid,{dest_pos, Val, add}, R) ->
	R1 = R#m_move_rw{dest_pos = R#m_move_rw.dest_pos + Val},
	?TRY_CATCH(hook_map:on_rw_update(Uid,dest_pos,R)),
	R1;
i_set_field(Uid,{dest_pos, Val, sub}, R) ->
	R1 = R#m_move_rw{dest_pos = R#m_move_rw.dest_pos - Val},
	?TRY_CATCH(hook_map:on_rw_update(Uid,dest_pos,R)),
	R1;
i_set_field(Uid,{#m_move_rw.dest_pos, Val}, R) ->
	R1 = R#m_move_rw{dest_pos = Val},
	?TRY_CATCH(hook_map:on_rw_update(Uid,dest_pos,R)),
	R1;
i_set_field(Uid,{#m_move_rw.dest_pos, Val, add}, R) ->
	R1 = R#m_move_rw{dest_pos = R#m_move_rw.dest_pos + Val},
	?TRY_CATCH(hook_map:on_rw_update(Uid,dest_pos,R)),
	R1;
i_set_field(Uid,{#m_move_rw.dest_pos, Val, sub}, R) ->
	R1 = R#m_move_rw{dest_pos = R#m_move_rw.dest_pos - Val},
	?TRY_CATCH(hook_map:on_rw_update(Uid,dest_pos,R)),
	R1;
%%#m_move_rw.face
i_set_field(Uid,{face, Val}, R) ->
	R1 = R#m_move_rw{face = Val},
	?TRY_CATCH(hook_map:on_rw_update(Uid,face,R)),
	R1;
i_set_field(Uid,{face, Val, add}, R) ->
	R1 = R#m_move_rw{face = R#m_move_rw.face + Val},
	?TRY_CATCH(hook_map:on_rw_update(Uid,face,R)),
	R1;
i_set_field(Uid,{face, Val, sub}, R) ->
	R1 = R#m_move_rw{face = R#m_move_rw.face - Val},
	?TRY_CATCH(hook_map:on_rw_update(Uid,face,R)),
	R1;
i_set_field(Uid,{#m_move_rw.face, Val}, R) ->
	R1 = R#m_move_rw{face = Val},
	?TRY_CATCH(hook_map:on_rw_update(Uid,face,R)),
	R1;
i_set_field(Uid,{#m_move_rw.face, Val, add}, R) ->
	R1 = R#m_move_rw{face = R#m_move_rw.face + Val},
	?TRY_CATCH(hook_map:on_rw_update(Uid,face,R)),
	R1;
i_set_field(Uid,{#m_move_rw.face, Val, sub}, R) ->
	R1 = R#m_move_rw{face = R#m_move_rw.face - Val},
	?TRY_CATCH(hook_map:on_rw_update(Uid,face,R)),
	R1;
%%#m_move_rw.dir
i_set_field(Uid,{dir, Val}, R) ->
	R1 = R#m_move_rw{dir = Val},
	?TRY_CATCH(hook_map:on_rw_update(Uid,dir,R)),
	R1;
i_set_field(Uid,{dir, Val, add}, R) ->
	R1 = R#m_move_rw{dir = R#m_move_rw.dir + Val},
	?TRY_CATCH(hook_map:on_rw_update(Uid,dir,R)),
	R1;
i_set_field(Uid,{dir, Val, sub}, R) ->
	R1 = R#m_move_rw{dir = R#m_move_rw.dir - Val},
	?TRY_CATCH(hook_map:on_rw_update(Uid,dir,R)),
	R1;
i_set_field(Uid,{#m_move_rw.dir, Val}, R) ->
	R1 = R#m_move_rw{dir = Val},
	?TRY_CATCH(hook_map:on_rw_update(Uid,dir,R)),
	R1;
i_set_field(Uid,{#m_move_rw.dir, Val, add}, R) ->
	R1 = R#m_move_rw{dir = R#m_move_rw.dir + Val},
	?TRY_CATCH(hook_map:on_rw_update(Uid,dir,R)),
	R1;
i_set_field(Uid,{#m_move_rw.dir, Val, sub}, R) ->
	R1 = R#m_move_rw{dir = R#m_move_rw.dir - Val},
	?TRY_CATCH(hook_map:on_rw_update(Uid,dir,R)),
	R1;
%%#m_move_rw.start_time
i_set_field(Uid,{start_time, Val}, R) ->
	R1 = R#m_move_rw{start_time = Val},
	?TRY_CATCH(hook_map:on_rw_update(Uid,start_time,R)),
	R1;
i_set_field(Uid,{start_time, Val, add}, R) ->
	R1 = R#m_move_rw{start_time = R#m_move_rw.start_time + Val},
	?TRY_CATCH(hook_map:on_rw_update(Uid,start_time,R)),
	R1;
i_set_field(Uid,{start_time, Val, sub}, R) ->
	R1 = R#m_move_rw{start_time = R#m_move_rw.start_time - Val},
	?TRY_CATCH(hook_map:on_rw_update(Uid,start_time,R)),
	R1;
i_set_field(Uid,{#m_move_rw.start_time, Val}, R) ->
	R1 = R#m_move_rw{start_time = Val},
	?TRY_CATCH(hook_map:on_rw_update(Uid,start_time,R)),
	R1;
i_set_field(Uid,{#m_move_rw.start_time, Val, add}, R) ->
	R1 = R#m_move_rw{start_time = R#m_move_rw.start_time + Val},
	?TRY_CATCH(hook_map:on_rw_update(Uid,start_time,R)),
	R1;
i_set_field(Uid,{#m_move_rw.start_time, Val, sub}, R) ->
	R1 = R#m_move_rw{start_time = R#m_move_rw.start_time - Val},
	?TRY_CATCH(hook_map:on_rw_update(Uid,start_time,R)),
	R1;
%%#m_move_rw.seg_move_time
i_set_field(Uid,{seg_move_time, Val}, R) ->
	R1 = R#m_move_rw{seg_move_time = Val},
	?TRY_CATCH(hook_map:on_rw_update(Uid,seg_move_time,R)),
	R1;
i_set_field(Uid,{seg_move_time, Val, add}, R) ->
	R1 = R#m_move_rw{seg_move_time = R#m_move_rw.seg_move_time + Val},
	?TRY_CATCH(hook_map:on_rw_update(Uid,seg_move_time,R)),
	R1;
i_set_field(Uid,{seg_move_time, Val, sub}, R) ->
	R1 = R#m_move_rw{seg_move_time = R#m_move_rw.seg_move_time - Val},
	?TRY_CATCH(hook_map:on_rw_update(Uid,seg_move_time,R)),
	R1;
i_set_field(Uid,{#m_move_rw.seg_move_time, Val}, R) ->
	R1 = R#m_move_rw{seg_move_time = Val},
	?TRY_CATCH(hook_map:on_rw_update(Uid,seg_move_time,R)),
	R1;
i_set_field(Uid,{#m_move_rw.seg_move_time, Val, add}, R) ->
	R1 = R#m_move_rw{seg_move_time = R#m_move_rw.seg_move_time + Val},
	?TRY_CATCH(hook_map:on_rw_update(Uid,seg_move_time,R)),
	R1;
i_set_field(Uid,{#m_move_rw.seg_move_time, Val, sub}, R) ->
	R1 = R#m_move_rw{seg_move_time = R#m_move_rw.seg_move_time - Val},
	?TRY_CATCH(hook_map:on_rw_update(Uid,seg_move_time,R)),
	R1;
%%#m_move_rw.force_stopped
i_set_field(Uid,{force_stopped, Val}, R) ->
	R1 = R#m_move_rw{force_stopped = Val},
	?TRY_CATCH(hook_map:on_rw_update(Uid,force_stopped,R)),
	R1;
i_set_field(Uid,{force_stopped, Val, add}, R) ->
	R1 = R#m_move_rw{force_stopped = R#m_move_rw.force_stopped + Val},
	?TRY_CATCH(hook_map:on_rw_update(Uid,force_stopped,R)),
	R1;
i_set_field(Uid,{force_stopped, Val, sub}, R) ->
	R1 = R#m_move_rw{force_stopped = R#m_move_rw.force_stopped - Val},
	?TRY_CATCH(hook_map:on_rw_update(Uid,force_stopped,R)),
	R1;
i_set_field(Uid,{#m_move_rw.force_stopped, Val}, R) ->
	R1 = R#m_move_rw{force_stopped = Val},
	?TRY_CATCH(hook_map:on_rw_update(Uid,force_stopped,R)),
	R1;
i_set_field(Uid,{#m_move_rw.force_stopped, Val, add}, R) ->
	R1 = R#m_move_rw{force_stopped = R#m_move_rw.force_stopped + Val},
	?TRY_CATCH(hook_map:on_rw_update(Uid,force_stopped,R)),
	R1;
i_set_field(Uid,{#m_move_rw.force_stopped, Val, sub}, R) ->
	R1 = R#m_move_rw{force_stopped = R#m_move_rw.force_stopped - Val},
	?TRY_CATCH(hook_map:on_rw_update(Uid,force_stopped,R)),
	R1;
%%#m_move_rw.path_list
i_set_field(Uid,{path_list, Val}, R) ->
	R1 = R#m_move_rw{path_list = Val},
	?TRY_CATCH(hook_map:on_rw_update(Uid,path_list,R)),
	R1;
i_set_field(Uid,{path_list, Val, add}, R) ->
	R1 = R#m_move_rw{path_list = R#m_move_rw.path_list + Val},
	?TRY_CATCH(hook_map:on_rw_update(Uid,path_list,R)),
	R1;
i_set_field(Uid,{path_list, Val, sub}, R) ->
	R1 = R#m_move_rw{path_list = R#m_move_rw.path_list - Val},
	?TRY_CATCH(hook_map:on_rw_update(Uid,path_list,R)),
	R1;
i_set_field(Uid,{#m_move_rw.path_list, Val}, R) ->
	R1 = R#m_move_rw{path_list = Val},
	?TRY_CATCH(hook_map:on_rw_update(Uid,path_list,R)),
	R1;
i_set_field(Uid,{#m_move_rw.path_list, Val, add}, R) ->
	R1 = R#m_move_rw{path_list = R#m_move_rw.path_list + Val},
	?TRY_CATCH(hook_map:on_rw_update(Uid,path_list,R)),
	R1;
i_set_field(Uid,{#m_move_rw.path_list, Val, sub}, R) ->
	R1 = R#m_move_rw{path_list = R#m_move_rw.path_list - Val},
	?TRY_CATCH(hook_map:on_rw_update(Uid,path_list,R)),
	R1;
i_set_field(_Uid,_Elem,R)-> R.

%%-------------------------------------------------------------------
