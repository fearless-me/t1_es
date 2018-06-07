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

-export([get_obj_uid/1,set_obj_uid/2]).
-export([get_obj_pid/1,set_obj_pid/2]).
-export([get_obj_did/1,set_obj_did/2]).
-export([get_obj_sock/1,set_obj_sock/2]).
-export([get_obj_owner/1,set_obj_owner/2]).
-export([get_obj_name/1,set_obj_name/2]).
-export([get_obj_group/1,set_obj_group/2]).
-export([get_obj_type/1,set_obj_type/2]).
-export([get_obj_move_speed/1,set_obj_move_speed/2]).
-export([get_obj_cur_move/1,set_obj_cur_move/2]).
-export([get_obj_next_move/1,set_obj_next_move/2]).
-export([get_obj_vis_tile_idx/1,set_obj_vis_tile_idx/2]).
-export([get_obj_cur_pos/1,set_obj_cur_pos/2]).
-export([get_obj_start_pos/1,set_obj_start_pos/2]).
-export([get_obj_dest_pos/1,set_obj_dest_pos/2]).
-export([get_obj_face/1,set_obj_face/2]).
-export([get_obj_dir/1,set_obj_dir/2]).
-export([get_obj_start_time/1,set_obj_start_time/2]).
-export([get_obj_seg_move_time/1,set_obj_seg_move_time/2]).
-export([get_obj_stopped/1,set_obj_stopped/2]).
-export([get_obj_path_list/1,set_obj_path_list/2]).
-export([get_obj_hp/1,set_obj_hp/2]).
-export([get_obj_max_hp/1,set_obj_max_hp/2]).
-export([get_obj_attr/1,set_obj_attr/2]).
-export([get_obj_buff_list/1,set_obj_buff_list/2]).
-export([del_obj/1]).
-export([to_obj_record/1]).
%%-------------------------------------------------------------------
-export([get_aid/0,set_aid/1]).
-export([get_uid/0,set_uid/1]).
-export([get_sid/0,set_sid/1]).
-export([get_name/0,set_name/1]).
-export([get_level/0,set_level/1]).
-export([get_wing_level/0,set_wing_level/1]).
-export([get_sex/0,set_sex/1]).
-export([get_camp/0,set_camp/1]).
-export([get_race/0,set_race/1]).
-export([get_career/0,set_career/1]).
-export([get_head/0,set_head/1]).
-export([get_map_id/0,set_map_id/1]).
-export([get_line/0,set_line/1]).
-export([get_x/0,set_x/1]).
-export([get_y/0,set_y/1]).
-export([get_old_map_id/0,set_old_map_id/1]).
-export([get_old_line/0,set_old_line/1]).
-export([get_old_x/0,set_old_x/1]).
-export([get_old_y/0,set_old_y/1]).
-export([get_data/0,set_data/1]).
-export([get_version/0,set_version/1]).
-export([del/0]).
-export([to_record/0]).
%%-------------------------------------------------------------------
%%-------------------------------------------------------------------
get_obj_uid(Uid)-> get({uid,Uid}).
set_obj_uid(Uid, V)-> put({uid,Uid}, V).

get_obj_pid(Uid)-> get({pid,Uid}).
set_obj_pid(Uid, V)-> put({pid,Uid}, V).

get_obj_did(Uid)-> get({did,Uid}).
set_obj_did(Uid, V)-> put({did,Uid}, V).

get_obj_sock(Uid)-> get({sock,Uid}).
set_obj_sock(Uid, V)-> put({sock,Uid}, V).

get_obj_owner(Uid)-> get({owner,Uid}).
set_obj_owner(Uid, V)-> put({owner,Uid}, V).

get_obj_name(Uid)-> get({name,Uid}).
set_obj_name(Uid, V)-> put({name,Uid}, V).

get_obj_group(Uid)-> get({group,Uid}).
set_obj_group(Uid, V)-> put({group,Uid}, V).

get_obj_type(Uid)-> get({type,Uid}).
set_obj_type(Uid, V)-> put({type,Uid}, V).

get_obj_move_speed(Uid)-> get({move_speed,Uid}).
set_obj_move_speed(Uid, V)-> put({move_speed,Uid}, V).

get_obj_cur_move(Uid)-> get({cur_move,Uid}).
set_obj_cur_move(Uid, V)-> put({cur_move,Uid}, V).

get_obj_next_move(Uid)-> get({next_move,Uid}).
set_obj_next_move(Uid, V)-> put({next_move,Uid}, V).

get_obj_vis_tile_idx(Uid)-> get({vis_tile_idx,Uid}).
set_obj_vis_tile_idx(Uid, V)-> put({vis_tile_idx,Uid}, V).

get_obj_cur_pos(Uid)-> get({cur_pos,Uid}).
set_obj_cur_pos(Uid, V)-> put({cur_pos,Uid}, V).

get_obj_start_pos(Uid)-> get({start_pos,Uid}).
set_obj_start_pos(Uid, V)-> put({start_pos,Uid}, V).

get_obj_dest_pos(Uid)-> get({dest_pos,Uid}).
set_obj_dest_pos(Uid, V)-> put({dest_pos,Uid}, V).

get_obj_face(Uid)-> get({face,Uid}).
set_obj_face(Uid, V)-> put({face,Uid}, V).

get_obj_dir(Uid)-> get({dir,Uid}).
set_obj_dir(Uid, V)-> put({dir,Uid}, V).

get_obj_start_time(Uid)-> get({start_time,Uid}).
set_obj_start_time(Uid, V)-> put({start_time,Uid}, V).

get_obj_seg_move_time(Uid)-> get({seg_move_time,Uid}).
set_obj_seg_move_time(Uid, V)-> put({seg_move_time,Uid}, V).

get_obj_stopped(Uid)-> get({stopped,Uid}).
set_obj_stopped(Uid, V)-> put({stopped,Uid}, V).

get_obj_path_list(Uid)-> get({path_list,Uid}).
set_obj_path_list(Uid, V)-> put({path_list,Uid}, V).

get_obj_hp(Uid)-> get({hp,Uid}).
set_obj_hp(Uid, V)-> put({hp,Uid}, V).

get_obj_max_hp(Uid)-> get({max_hp,Uid}).
set_obj_max_hp(Uid, V)-> put({max_hp,Uid}, V).

get_obj_attr(Uid)-> get({attr,Uid}).
set_obj_attr(Uid, V)-> put({attr,Uid}, V).

get_obj_buff_list(Uid)-> get({buff_list,Uid}).
set_obj_buff_list(Uid, V)-> put({buff_list,Uid}, V).

del_obj(Uid)->
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
to_obj_record(Uid)->
	#m_map_obj{
		uid = get_obj_uid(Uid),
		pid = get_obj_pid(Uid),
		did = get_obj_did(Uid),
		sock = get_obj_sock(Uid),
		owner = get_obj_owner(Uid),
		name = get_obj_name(Uid),
		group = get_obj_group(Uid),
		type = get_obj_type(Uid),
		move_speed = get_obj_move_speed(Uid),
		cur_move = get_obj_cur_move(Uid),
		next_move = get_obj_next_move(Uid),
		vis_tile_idx = get_obj_vis_tile_idx(Uid),
		cur_pos = get_obj_cur_pos(Uid),
		start_pos = get_obj_start_pos(Uid),
		dest_pos = get_obj_dest_pos(Uid),
		face = get_obj_face(Uid),
		dir = get_obj_dir(Uid),
		start_time = get_obj_start_time(Uid),
		seg_move_time = get_obj_seg_move_time(Uid),
		stopped = get_obj_stopped(Uid),
		path_list = get_obj_path_list(Uid),
		hp = get_obj_hp(Uid),
		max_hp = get_obj_max_hp(Uid),
		attr = get_obj_attr(Uid),
		buff_list = get_obj_buff_list(Uid)
	}.
%%-------------------------------------------------------------------
get_aid()-> get(aid).
set_aid(V)-> put(aid, V).

get_uid()-> get(uid).
set_uid(V)-> put(uid, V).

get_sid()-> get(sid).
set_sid(V)-> put(sid, V).

get_name()-> get(name).
set_name(V)-> put(name, V).

get_level()-> get(level).
set_level(V)-> put(level, V).

get_wing_level()-> get(wing_level).
set_wing_level(V)-> put(wing_level, V).

get_sex()-> get(sex).
set_sex(V)-> put(sex, V).

get_camp()-> get(camp).
set_camp(V)-> put(camp, V).

get_race()-> get(race).
set_race(V)-> put(race, V).

get_career()-> get(career).
set_career(V)-> put(career, V).

get_head()-> get(head).
set_head(V)-> put(head, V).

get_map_id()-> get(map_id).
set_map_id(V)-> put(map_id, V).

get_line()-> get(line).
set_line(V)-> put(line, V).

get_x()-> get(x).
set_x(V)-> put(x, V).

get_y()-> get(y).
set_y(V)-> put(y, V).

get_old_map_id()-> get(old_map_id).
set_old_map_id(V)-> put(old_map_id, V).

get_old_line()-> get(old_line).
set_old_line(V)-> put(old_line, V).

get_old_x()-> get(old_x).
set_old_x(V)-> put(old_x, V).

get_old_y()-> get(old_y).
set_old_y(V)-> put(old_y, V).

get_data()-> get(data).
set_data(V)-> put(data, V).

get_version()-> get(version).
set_version(V)-> put(version, V).

del()->
	erase(aid),
	erase(uid),
	erase(sid),
	erase(name),
	erase(level),
	erase(wing_level),
	erase(sex),
	erase(camp),
	erase(race),
	erase(career),
	erase(head),
	erase(map_id),
	erase(line),
	erase(x),
	erase(y),
	erase(old_map_id),
	erase(old_line),
	erase(old_x),
	erase(old_y),
	erase(data),
	erase(version),
	ok.
to_record()->
	#p_player{
		aid = get_aid(),
		uid = get_uid(),
		sid = get_sid(),
		name = get_name(),
		level = get_level(),
		wing_level = get_wing_level(),
		sex = get_sex(),
		camp = get_camp(),
		race = get_race(),
		career = get_career(),
		head = get_head(),
		map_id = get_map_id(),
		line = get_line(),
		x = get_x(),
		y = get_y(),
		old_map_id = get_old_map_id(),
		old_line = get_old_line(),
		old_x = get_old_x(),
		old_y = get_old_y(),
		data = get_data(),
		version = get_version()
	}.
%%-------------------------------------------------------------------
