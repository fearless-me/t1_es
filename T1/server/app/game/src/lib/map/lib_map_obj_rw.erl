%%-------------------------------------------------------------------
%%% This File Is AUTO GENERATED, Don't Modify it MANUALLY!!!
%%% This File Is AUTO GENERATED, Don't Modify it MANUALLY!!!
%%% This File Is AUTO GENERATED, Don't Modify it MANUALLY!!!
%%-------------------------------------------------------------------
-module(lib_map_obj_rw).

%%-------------------------------------------------------------------
-include("logger.hrl").
-include("rw_record.hrl").
%%-------------------------------------------------------------------

-export([get_pid/1, get_pid_def/2, set_pid/2, set_pid_direct/2]).
-export([get_did/1, get_did_def/2, set_did/2, set_did_direct/2]).
-export([get_group/1, get_group_def/2, set_group/2, set_group_direct/2]).
-export([get_owner/1, get_owner_def/2, set_owner/2, set_owner_direct/2]).
-export([get_type/1, get_type_def/2, set_type/2, set_type_direct/2]).
-export([get_move_speed/1, get_move_speed_def/2, set_move_speed/2, set_move_speed_direct/2]).
-export([get_cur_move/1, get_cur_move_def/2, set_cur_move/2, set_cur_move_direct/2]).
-export([get_next_move/1, get_next_move_def/2, set_next_move/2, set_next_move_direct/2]).
-export([get_vis_tile_idx/1, get_vis_tile_idx_def/2, set_vis_tile_idx/2, set_vis_tile_idx_direct/2]).
-export([get_cur_pos/1, get_cur_pos_def/2, set_cur_pos/2, set_cur_pos_direct/2]).
-export([get_start_pos/1, get_start_pos_def/2, set_start_pos/2, set_start_pos_direct/2]).
-export([get_dest_pos/1, get_dest_pos_def/2, set_dest_pos/2, set_dest_pos_direct/2]).
-export([get_face/1, get_face_def/2, set_face/2, set_face_direct/2]).
-export([get_dir/1, get_dir_def/2, set_dir/2, set_dir_direct/2]).
-export([get_start_time/1, get_start_time_def/2, set_start_time/2, set_start_time_direct/2]).
-export([get_seg_move_time/1, get_seg_move_time_def/2, set_seg_move_time/2, set_seg_move_time_direct/2]).
-export([get_stopped/1, get_stopped_def/2, set_stopped/2, set_stopped_direct/2]).
-export([get_path_list/1, get_path_list_def/2, set_path_list/2, set_path_list_direct/2]).
-export([get_hp/1, get_hp_def/2, set_hp/2, set_hp_direct/2]).
-export([get_max_hp/1, get_max_hp_def/2, set_max_hp/2, set_max_hp_direct/2]).
-export([get_attr/1, get_attr_def/2, set_attr/2, set_attr_direct/2]).
-export([get_buff_list/1, get_buff_list_def/2, set_buff_list/2, set_buff_list_direct/2]).
-export([del/1]).
-export([to_record/1]).
-export([init_from/2]).
%%-------------------------------------------------------------------
%%-------------------------------------------------------------------
%%-------------------------------------------------------------------
%% #m_map_obj_rw.pid
get_pid(Uid)-> get({pid,Uid}).

get_pid_def(Uid, Def)->
	case get({pid,Uid}) of
		undefined -> Def;
		V -> V
	end.

set_pid(Uid, V)->
	put({pid,Uid}, V),
	hook_map:on_rw_update(Uid, pid, V).

set_pid_direct(Uid, V)-> put({pid,Uid}, V).

%%-------------------------------------------------------------------
%% #m_map_obj_rw.did
get_did(Uid)-> get({did,Uid}).

get_did_def(Uid, Def)->
	case get({did,Uid}) of
		undefined -> Def;
		V -> V
	end.

set_did(Uid, V)->
	put({did,Uid}, V),
	hook_map:on_rw_update(Uid, did, V).

set_did_direct(Uid, V)-> put({did,Uid}, V).

%%-------------------------------------------------------------------
%% #m_map_obj_rw.group
get_group(Uid)-> get({group,Uid}).

get_group_def(Uid, Def)->
	case get({group,Uid}) of
		undefined -> Def;
		V -> V
	end.

set_group(Uid, V)->
	put({group,Uid}, V),
	hook_map:on_rw_update(Uid, group, V).

set_group_direct(Uid, V)-> put({group,Uid}, V).

%%-------------------------------------------------------------------
%% #m_map_obj_rw.owner
get_owner(Uid)-> get({owner,Uid}).

get_owner_def(Uid, Def)->
	case get({owner,Uid}) of
		undefined -> Def;
		V -> V
	end.

set_owner(Uid, V)->
	put({owner,Uid}, V),
	hook_map:on_rw_update(Uid, owner, V).

set_owner_direct(Uid, V)-> put({owner,Uid}, V).

%%-------------------------------------------------------------------
%% #m_map_obj_rw.type
get_type(Uid)-> get({type,Uid}).

get_type_def(Uid, Def)->
	case get({type,Uid}) of
		undefined -> Def;
		V -> V
	end.

set_type(Uid, V)->
	put({type,Uid}, V),
	hook_map:on_rw_update(Uid, type, V).

set_type_direct(Uid, V)-> put({type,Uid}, V).

%%-------------------------------------------------------------------
%% #m_map_obj_rw.move_speed
get_move_speed(Uid)-> get({move_speed,Uid}).

get_move_speed_def(Uid, Def)->
	case get({move_speed,Uid}) of
		undefined -> Def;
		V -> V
	end.

set_move_speed(Uid, V)->
	put({move_speed,Uid}, V),
	hook_map:on_rw_update(Uid, move_speed, V).

set_move_speed_direct(Uid, V)-> put({move_speed,Uid}, V).

%%-------------------------------------------------------------------
%% #m_map_obj_rw.cur_move
get_cur_move(Uid)-> get({cur_move,Uid}).

get_cur_move_def(Uid, Def)->
	case get({cur_move,Uid}) of
		undefined -> Def;
		V -> V
	end.

set_cur_move(Uid, V)->
	put({cur_move,Uid}, V),
	hook_map:on_rw_update(Uid, cur_move, V).

set_cur_move_direct(Uid, V)-> put({cur_move,Uid}, V).

%%-------------------------------------------------------------------
%% #m_map_obj_rw.next_move
get_next_move(Uid)-> get({next_move,Uid}).

get_next_move_def(Uid, Def)->
	case get({next_move,Uid}) of
		undefined -> Def;
		V -> V
	end.

set_next_move(Uid, V)->
	put({next_move,Uid}, V),
	hook_map:on_rw_update(Uid, next_move, V).

set_next_move_direct(Uid, V)-> put({next_move,Uid}, V).

%%-------------------------------------------------------------------
%% #m_map_obj_rw.vis_tile_idx
get_vis_tile_idx(Uid)-> get({vis_tile_idx,Uid}).

get_vis_tile_idx_def(Uid, Def)->
	case get({vis_tile_idx,Uid}) of
		undefined -> Def;
		V -> V
	end.

set_vis_tile_idx(Uid, V)->
	put({vis_tile_idx,Uid}, V),
	hook_map:on_rw_update(Uid, vis_tile_idx, V).

set_vis_tile_idx_direct(Uid, V)-> put({vis_tile_idx,Uid}, V).

%%-------------------------------------------------------------------
%% #m_map_obj_rw.cur_pos
get_cur_pos(Uid)-> get({cur_pos,Uid}).

get_cur_pos_def(Uid, Def)->
	case get({cur_pos,Uid}) of
		undefined -> Def;
		V -> V
	end.

set_cur_pos(Uid, V)->
	put({cur_pos,Uid}, V),
	hook_map:on_rw_update(Uid, cur_pos, V).

set_cur_pos_direct(Uid, V)-> put({cur_pos,Uid}, V).

%%-------------------------------------------------------------------
%% #m_map_obj_rw.start_pos
get_start_pos(Uid)-> get({start_pos,Uid}).

get_start_pos_def(Uid, Def)->
	case get({start_pos,Uid}) of
		undefined -> Def;
		V -> V
	end.

set_start_pos(Uid, V)->
	put({start_pos,Uid}, V),
	hook_map:on_rw_update(Uid, start_pos, V).

set_start_pos_direct(Uid, V)-> put({start_pos,Uid}, V).

%%-------------------------------------------------------------------
%% #m_map_obj_rw.dest_pos
get_dest_pos(Uid)-> get({dest_pos,Uid}).

get_dest_pos_def(Uid, Def)->
	case get({dest_pos,Uid}) of
		undefined -> Def;
		V -> V
	end.

set_dest_pos(Uid, V)->
	put({dest_pos,Uid}, V),
	hook_map:on_rw_update(Uid, dest_pos, V).

set_dest_pos_direct(Uid, V)-> put({dest_pos,Uid}, V).

%%-------------------------------------------------------------------
%% #m_map_obj_rw.face
get_face(Uid)-> get({face,Uid}).

get_face_def(Uid, Def)->
	case get({face,Uid}) of
		undefined -> Def;
		V -> V
	end.

set_face(Uid, V)->
	put({face,Uid}, V),
	hook_map:on_rw_update(Uid, face, V).

set_face_direct(Uid, V)-> put({face,Uid}, V).

%%-------------------------------------------------------------------
%% #m_map_obj_rw.dir
get_dir(Uid)-> get({dir,Uid}).

get_dir_def(Uid, Def)->
	case get({dir,Uid}) of
		undefined -> Def;
		V -> V
	end.

set_dir(Uid, V)->
	put({dir,Uid}, V),
	hook_map:on_rw_update(Uid, dir, V).

set_dir_direct(Uid, V)-> put({dir,Uid}, V).

%%-------------------------------------------------------------------
%% #m_map_obj_rw.start_time
get_start_time(Uid)-> get({start_time,Uid}).

get_start_time_def(Uid, Def)->
	case get({start_time,Uid}) of
		undefined -> Def;
		V -> V
	end.

set_start_time(Uid, V)->
	put({start_time,Uid}, V),
	hook_map:on_rw_update(Uid, start_time, V).

set_start_time_direct(Uid, V)-> put({start_time,Uid}, V).

%%-------------------------------------------------------------------
%% #m_map_obj_rw.seg_move_time
get_seg_move_time(Uid)-> get({seg_move_time,Uid}).

get_seg_move_time_def(Uid, Def)->
	case get({seg_move_time,Uid}) of
		undefined -> Def;
		V -> V
	end.

set_seg_move_time(Uid, V)->
	put({seg_move_time,Uid}, V),
	hook_map:on_rw_update(Uid, seg_move_time, V).

set_seg_move_time_direct(Uid, V)-> put({seg_move_time,Uid}, V).

%%-------------------------------------------------------------------
%% #m_map_obj_rw.stopped
get_stopped(Uid)-> get({stopped,Uid}).

get_stopped_def(Uid, Def)->
	case get({stopped,Uid}) of
		undefined -> Def;
		V -> V
	end.

set_stopped(Uid, V)->
	put({stopped,Uid}, V),
	hook_map:on_rw_update(Uid, stopped, V).

set_stopped_direct(Uid, V)-> put({stopped,Uid}, V).

%%-------------------------------------------------------------------
%% #m_map_obj_rw.path_list
get_path_list(Uid)-> get({path_list,Uid}).

get_path_list_def(Uid, Def)->
	case get({path_list,Uid}) of
		undefined -> Def;
		V -> V
	end.

set_path_list(Uid, V)->
	put({path_list,Uid}, V),
	hook_map:on_rw_update(Uid, path_list, V).

set_path_list_direct(Uid, V)-> put({path_list,Uid}, V).

%%-------------------------------------------------------------------
%% #m_map_obj_rw.hp
get_hp(Uid)-> get({hp,Uid}).

get_hp_def(Uid, Def)->
	case get({hp,Uid}) of
		undefined -> Def;
		V -> V
	end.

set_hp(Uid, V)->
	put({hp,Uid}, V),
	hook_map:on_rw_update(Uid, hp, V).

set_hp_direct(Uid, V)-> put({hp,Uid}, V).

%%-------------------------------------------------------------------
%% #m_map_obj_rw.max_hp
get_max_hp(Uid)-> get({max_hp,Uid}).

get_max_hp_def(Uid, Def)->
	case get({max_hp,Uid}) of
		undefined -> Def;
		V -> V
	end.

set_max_hp(Uid, V)->
	put({max_hp,Uid}, V),
	hook_map:on_rw_update(Uid, max_hp, V).

set_max_hp_direct(Uid, V)-> put({max_hp,Uid}, V).

%%-------------------------------------------------------------------
%% #m_map_obj_rw.attr
get_attr(Uid)-> get({attr,Uid}).

get_attr_def(Uid, Def)->
	case get({attr,Uid}) of
		undefined -> Def;
		V -> V
	end.

set_attr(Uid, V)->
	put({attr,Uid}, V),
	hook_map:on_rw_update(Uid, attr, V).

set_attr_direct(Uid, V)-> put({attr,Uid}, V).

%%-------------------------------------------------------------------
%% #m_map_obj_rw.buff_list
get_buff_list(Uid)-> get({buff_list,Uid}).

get_buff_list_def(Uid, Def)->
	case get({buff_list,Uid}) of
		undefined -> Def;
		V -> V
	end.

set_buff_list(Uid, V)->
	put({buff_list,Uid}, V),
	hook_map:on_rw_update(Uid, buff_list, V).

set_buff_list_direct(Uid, V)-> put({buff_list,Uid}, V).

%%-------------------------------------------------------------------
del(Uid)->
	erase({pid, Uid}),
	erase({did, Uid}),
	erase({group, Uid}),
	erase({owner, Uid}),
	erase({type, Uid}),
	erase({move_speed, Uid}),
	erase({cur_move, Uid}),
	erase({next_move, Uid}),
	erase({vis_tile_idx, Uid}),
	erase({cur_pos, Uid}),
	erase({start_pos, Uid}),
	erase({dest_pos, Uid}),
	erase({face, Uid}),
	erase({dir, Uid}),
	erase({start_time, Uid}),
	erase({seg_move_time, Uid}),
	erase({stopped, Uid}),
	erase({path_list, Uid}),
	erase({hp, Uid}),
	erase({max_hp, Uid}),
	erase({attr, Uid}),
	erase({buff_list, Uid}),
	ok.
%%-------------------------------------------------------------------
to_record(Uid)->
	#m_map_obj_rw{
		pid = get_pid(Uid),
		did = get_did(Uid),
		group = get_group(Uid),
		owner = get_owner(Uid),
		type = get_type(Uid),
		move_speed = get_move_speed(Uid),
		cur_move = get_cur_move(Uid),
		next_move = get_next_move(Uid),
		vis_tile_idx = get_vis_tile_idx(Uid),
		cur_pos = get_cur_pos(Uid),
		start_pos = get_start_pos(Uid),
		dest_pos = get_dest_pos(Uid),
		face = get_face(Uid),
		dir = get_dir(Uid),
		start_time = get_start_time(Uid),
		seg_move_time = get_seg_move_time(Uid),
		stopped = get_stopped(Uid),
		path_list = get_path_list(Uid),
		hp = get_hp(Uid),
		max_hp = get_max_hp(Uid),
		attr = get_attr(Uid),
		buff_list = get_buff_list(Uid)
	}.
%%-------------------------------------------------------------------
init_from(Uid, Rec)->
	set_pid_direct(Uid, Rec#m_map_obj_rw.pid),
	set_did_direct(Uid, Rec#m_map_obj_rw.did),
	set_group_direct(Uid, Rec#m_map_obj_rw.group),
	set_owner_direct(Uid, Rec#m_map_obj_rw.owner),
	set_type_direct(Uid, Rec#m_map_obj_rw.type),
	set_move_speed_direct(Uid, Rec#m_map_obj_rw.move_speed),
	set_cur_move_direct(Uid, Rec#m_map_obj_rw.cur_move),
	set_next_move_direct(Uid, Rec#m_map_obj_rw.next_move),
	set_vis_tile_idx_direct(Uid, Rec#m_map_obj_rw.vis_tile_idx),
	set_cur_pos_direct(Uid, Rec#m_map_obj_rw.cur_pos),
	set_start_pos_direct(Uid, Rec#m_map_obj_rw.start_pos),
	set_dest_pos_direct(Uid, Rec#m_map_obj_rw.dest_pos),
	set_face_direct(Uid, Rec#m_map_obj_rw.face),
	set_dir_direct(Uid, Rec#m_map_obj_rw.dir),
	set_start_time_direct(Uid, Rec#m_map_obj_rw.start_time),
	set_seg_move_time_direct(Uid, Rec#m_map_obj_rw.seg_move_time),
	set_stopped_direct(Uid, Rec#m_map_obj_rw.stopped),
	set_path_list_direct(Uid, Rec#m_map_obj_rw.path_list),
	set_hp_direct(Uid, Rec#m_map_obj_rw.hp),
	set_max_hp_direct(Uid, Rec#m_map_obj_rw.max_hp),
	set_attr_direct(Uid, Rec#m_map_obj_rw.attr),
	set_buff_list_direct(Uid, Rec#m_map_obj_rw.buff_list),
	ok.
%%-------------------------------------------------------------------
