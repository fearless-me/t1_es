%%-------------------------------------------------------------------
%%% This File Is AUTO GENERATED, Don't Modify it MANUALLY!!!
%%% This File Is AUTO GENERATED, Don't Modify it MANUALLY!!!
%%% This File Is AUTO GENERATED, Don't Modify it MANUALLY!!!
%%-------------------------------------------------------------------
-module(lib_obj_rw).

%%-------------------------------------------------------------------
-include("logger.hrl").
-include("map_obj.hrl").
-include("db_record.hrl").
%%-------------------------------------------------------------------

-export([get_uid/1,set_uid/2]).
-export([get_pid/1,set_pid/2]).
-export([get_did/1,set_did/2]).
-export([get_sock/1,set_sock/2]).
-export([get_owner/1,set_owner/2]).
-export([get_name/1,set_name/2]).
-export([get_group/1,set_group/2]).
-export([get_type/1,set_type/2]).
-export([get_move_speed/1,set_move_speed/2]).
-export([get_cur_move/1,set_cur_move/2]).
-export([get_next_move/1,set_next_move/2]).
-export([get_vis_tile_idx/1,set_vis_tile_idx/2]).
-export([get_cur_pos/1,set_cur_pos/2]).
-export([get_start_pos/1,set_start_pos/2]).
-export([get_dest_pos/1,set_dest_pos/2]).
-export([get_face/1,set_face/2]).
-export([get_dir/1,set_dir/2]).
-export([get_start_time/1,set_start_time/2]).
-export([get_seg_move_time/1,set_seg_move_time/2]).
-export([get_stopped/1,set_stopped/2]).
-export([get_path_list/1,set_path_list/2]).
-export([get_hp/1,set_hp/2]).
-export([get_max_hp/1,set_max_hp/2]).
-export([get_attr/1,set_attr/2]).
-export([get_buff_list/1,set_buff_list/2]).
-export([del/1]).
-export([to_record/1]).
%%-------------------------------------------------------------------
%%-------------------------------------------------------------------
get_uid(Uid)-> get({uid,Uid}).
set_uid(Uid, V)-> put({uid,Uid}, V).

get_pid(Uid)-> get({pid,Uid}).
set_pid(Uid, V)-> put({pid,Uid}, V).

get_did(Uid)-> get({did,Uid}).
set_did(Uid, V)-> put({did,Uid}, V).

get_sock(Uid)-> get({sock,Uid}).
set_sock(Uid, V)-> put({sock,Uid}, V).

get_owner(Uid)-> get({owner,Uid}).
set_owner(Uid, V)-> put({owner,Uid}, V).

get_name(Uid)-> get({name,Uid}).
set_name(Uid, V)-> put({name,Uid}, V).

get_group(Uid)-> get({group,Uid}).
set_group(Uid, V)-> put({group,Uid}, V).

get_type(Uid)-> get({type,Uid}).
set_type(Uid, V)-> put({type,Uid}, V).

get_move_speed(Uid)-> get({move_speed,Uid}).
set_move_speed(Uid, V)-> put({move_speed,Uid}, V).

get_cur_move(Uid)-> get({cur_move,Uid}).
set_cur_move(Uid, V)-> put({cur_move,Uid}, V).

get_next_move(Uid)-> get({next_move,Uid}).
set_next_move(Uid, V)-> put({next_move,Uid}, V).

get_vis_tile_idx(Uid)-> get({vis_tile_idx,Uid}).
set_vis_tile_idx(Uid, V)-> put({vis_tile_idx,Uid}, V).

get_cur_pos(Uid)-> get({cur_pos,Uid}).
set_cur_pos(Uid, V)-> put({cur_pos,Uid}, V).

get_start_pos(Uid)-> get({start_pos,Uid}).
set_start_pos(Uid, V)-> put({start_pos,Uid}, V).

get_dest_pos(Uid)-> get({dest_pos,Uid}).
set_dest_pos(Uid, V)-> put({dest_pos,Uid}, V).

get_face(Uid)-> get({face,Uid}).
set_face(Uid, V)-> put({face,Uid}, V).

get_dir(Uid)-> get({dir,Uid}).
set_dir(Uid, V)-> put({dir,Uid}, V).

get_start_time(Uid)-> get({start_time,Uid}).
set_start_time(Uid, V)-> put({start_time,Uid}, V).

get_seg_move_time(Uid)-> get({seg_move_time,Uid}).
set_seg_move_time(Uid, V)-> put({seg_move_time,Uid}, V).

get_stopped(Uid)-> get({stopped,Uid}).
set_stopped(Uid, V)-> put({stopped,Uid}, V).

get_path_list(Uid)-> get({path_list,Uid}).
set_path_list(Uid, V)-> put({path_list,Uid}, V).

get_hp(Uid)-> get({hp,Uid}).
set_hp(Uid, V)-> put({hp,Uid}, V).

get_max_hp(Uid)-> get({max_hp,Uid}).
set_max_hp(Uid, V)-> put({max_hp,Uid}, V).

get_attr(Uid)-> get({attr,Uid}).
set_attr(Uid, V)-> put({attr,Uid}, V).

get_buff_list(Uid)-> get({buff_list,Uid}).
set_buff_list(Uid, V)-> put({buff_list,Uid}, V).

del(Uid)->
	erase({uid, Uid}),
	erase({pid, Uid}),
	erase({did, Uid}),
	erase({sock, Uid}),
	erase({owner, Uid}),
	erase({name, Uid}),
	erase({group, Uid}),
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
to_record(Uid)->
	#m_map_obj{
		uid = get_uid(Uid),
		pid = get_pid(Uid),
		did = get_did(Uid),
		sock = get_sock(Uid),
		owner = get_owner(Uid),
		name = get_name(Uid),
		group = get_group(Uid),
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