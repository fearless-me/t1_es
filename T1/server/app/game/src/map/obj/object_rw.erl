%%-------------------------------------------------------------------
%%% This File Is AUTO GENERATED, Don't Modify it MANUALLY!!!
%%% This File Is AUTO GENERATED, Don't Modify it MANUALLY!!!
%%% This File Is AUTO GENERATED, Don't Modify it MANUALLY!!!
%%-------------------------------------------------------------------
-module(object_rw).
-author("Hello World").

%%-------------------------------------------------------------------
-include("logger.hrl").
-include("pub_def.hrl").
-include("rec_rw.hrl").
-include("map_core.hrl").
%%-------------------------------------------------------------------

-export([
	get_uid/1,get_uid_def/2,set_uid/2,set_uid_direct/2, % #m_object_rw.uid
	get_pid/1,get_pid_def/2,set_pid/2,set_pid_direct/2, % #m_object_rw.pid
	get_data_id/1,get_data_id_def/2,set_data_id/2,set_data_id_direct/2, % #m_object_rw.data_id
	get_group/1,get_group_def/2,set_group/2,set_group_direct/2, % #m_object_rw.group
	get_owner/1,get_owner_def/2,set_owner/2,set_owner_direct/2, % #m_object_rw.owner
	get_type/1,get_type_def/2,set_type/2,set_type_direct/2, % #m_object_rw.type
	get_level/1,get_level_def/2,set_level/2,set_level_direct/2, % #m_object_rw.level
	get_name/1,get_name_def/2,set_name/2,set_name_direct/2, % #m_object_rw.name
	get_sex/1,get_sex_def/2,set_sex/2,set_sex_direct/2, % #m_object_rw.sex
	get_career/1,get_career_def/2,set_career/2,set_career_direct/2, % #m_object_rw.career
	get_race/1,get_race_def/2,set_race/2,set_race_direct/2, % #m_object_rw.race
	get_camp/1,get_camp_def/2,set_camp/2,set_camp_direct/2, % #m_object_rw.camp
	get_state/1,get_state_def/2,set_state/2,set_state_direct/2, % #m_object_rw.state
	get_move_speed/1,get_move_speed_def/2,set_move_speed/2,set_move_speed_direct/2, % #m_object_rw.move_speed
	get_cur_move/1,get_cur_move_def/2,set_cur_move/2,set_cur_move_direct/2, % #m_object_rw.cur_move
	get_next_move/1,get_next_move_def/2,set_next_move/2,set_next_move_direct/2, % #m_object_rw.next_move
	get_vis_tile_idx/1,get_vis_tile_idx_def/2,set_vis_tile_idx/2,set_vis_tile_idx_direct/2, % #m_object_rw.vis_tile_idx
	get_cur_pos/1,get_cur_pos_def/2,set_cur_pos/2,set_cur_pos_direct/2, % #m_object_rw.cur_pos
	get_start_pos/1,get_start_pos_def/2,set_start_pos/2,set_start_pos_direct/2, % #m_object_rw.start_pos
	get_dest_pos/1,get_dest_pos_def/2,set_dest_pos/2,set_dest_pos_direct/2, % #m_object_rw.dest_pos
	get_face/1,get_face_def/2,set_face/2,set_face_direct/2, % #m_object_rw.face
	get_dir/1,get_dir_def/2,set_dir/2,set_dir_direct/2, % #m_object_rw.dir
	get_move_start_time/1,get_move_start_time_def/2,set_move_start_time/2,set_move_start_time_direct/2, % #m_object_rw.move_start_time
	get_seg_move_time/1,get_seg_move_time_def/2,set_seg_move_time/2,set_seg_move_time_direct/2, % #m_object_rw.seg_move_time
	get_force_stopped/1,get_force_stopped_def/2,set_force_stopped/2,set_force_stopped_direct/2, % #m_object_rw.force_stopped
	get_move_path_list/1,get_move_path_list_def/2,set_move_path_list/2,set_move_path_list_direct/2, % #m_object_rw.move_path_list
	get_born_pos/1,get_born_pos_def/2,set_born_pos/2,set_born_pos_direct/2, % #m_object_rw.born_pos
	get_battle_in_time/1,get_battle_in_time_def/2,set_battle_in_time/2,set_battle_in_time_direct/2, % #m_object_rw.battle_in_time
	get_hp/1,get_hp_def/2,set_hp/2,set_hp_direct/2, % #m_object_rw.hp
	get_max_hp/1,get_max_hp_def/2,set_max_hp/2,set_max_hp_direct/2, % #m_object_rw.max_hp
	get_battle_props/1,get_battle_props_def/2,set_battle_props/2,set_battle_props_direct/2, % #m_object_rw.battle_props
	get_buff_list/1,get_buff_list_def/2,set_buff_list/2,set_buff_list_direct/2, % #m_object_rw.buff_list
	get_ai_state/1,get_ai_state_def/2,set_ai_state/2,set_ai_state_direct/2, % #m_object_rw.ai_state
	get_pre_ai_state/1,get_pre_ai_state_def/2,set_pre_ai_state/2,set_pre_ai_state_direct/2, % #m_object_rw.pre_ai_state
	get_ai_transition/1,get_ai_transition_def/2,set_ai_transition/2,set_ai_transition_direct/2, % #m_object_rw.ai_transition
	get_ai_triggers/1,get_ai_triggers_def/2,set_ai_triggers/2,set_ai_triggers_direct/2, % #m_object_rw.ai_triggers
	get_ai_pause/1,get_ai_pause_def/2,set_ai_pause/2,set_ai_pause_direct/2, % #m_object_rw.ai_pause
	get_ai_id/1,get_ai_id_def/2,set_ai_id/2,set_ai_id_direct/2, % #m_object_rw.ai_id
	get_ai_wp_list/1,get_ai_wp_list_def/2,set_ai_wp_list/2,set_ai_wp_list_direct/2, % #m_object_rw.ai_wp_list
	get_ai_wp_num/1,get_ai_wp_num_def/2,set_ai_wp_num/2,set_ai_wp_num_direct/2, % #m_object_rw.ai_wp_num
	get_ai_wp_idx/1,get_ai_wp_idx_def/2,set_ai_wp_idx/2,set_ai_wp_idx_direct/2, % #m_object_rw.ai_wp_idx
	get_ai_is_reverse_patrol/1,get_ai_is_reverse_patrol_def/2,set_ai_is_reverse_patrol/2,set_ai_is_reverse_patrol_direct/2, % #m_object_rw.ai_is_reverse_patrol
	get_ai_is_patrol/1,get_ai_is_patrol_def/2,set_ai_is_patrol/2,set_ai_is_patrol_direct/2, % #m_object_rw.ai_is_patrol
	get_ai_patrol_rest_tick/1,get_ai_patrol_rest_tick_def/2,set_ai_patrol_rest_tick/2,set_ai_patrol_rest_tick_direct/2, % #m_object_rw.ai_patrol_rest_tick
	get_ai_look_for_target_tick/1,get_ai_look_for_target_tick_def/2,set_ai_look_for_target_tick/2,set_ai_look_for_target_tick_direct/2, % #m_object_rw.ai_look_for_target_tick
	get_ai_pursue_tar_pos/1,get_ai_pursue_tar_pos_def/2,set_ai_pursue_tar_pos/2,set_ai_pursue_tar_pos_direct/2, % #m_object_rw.ai_pursue_tar_pos
	get_ai_pursue_failed/1,get_ai_pursue_failed_def/2,set_ai_pursue_failed/2,set_ai_pursue_failed_direct/2, % #m_object_rw.ai_pursue_failed
	get_ai_cant_pursue/1,get_ai_cant_pursue_def/2,set_ai_cant_pursue/2,set_ai_cant_pursue_direct/2, % #m_object_rw.ai_cant_pursue
	get_ai_check_pursue_tick/1,get_ai_check_pursue_tick_def/2,set_ai_check_pursue_tick/2,set_ai_check_pursue_tick_direct/2, % #m_object_rw.ai_check_pursue_tick
	get_ai_target_uid/1,get_ai_target_uid_def/2,set_ai_target_uid/2,set_ai_target_uid_direct/2, % #m_object_rw.ai_target_uid
	get_ai_enter_combat_time/1,get_ai_enter_combat_time_def/2,set_ai_enter_combat_time/2,set_ai_enter_combat_time_direct/2, % #m_object_rw.ai_enter_combat_time
	get_ai_enter_combat_pos/1,get_ai_enter_combat_pos_def/2,set_ai_enter_combat_pos/2,set_ai_enter_combat_pos_direct/2, % #m_object_rw.ai_enter_combat_pos
	get_ai_use_skill_id/1,get_ai_use_skill_id_def/2,set_ai_use_skill_id/2,set_ai_use_skill_id_direct/2, % #m_object_rw.ai_use_skill_id
	get_ai_attack_wait_tick/1,get_ai_attack_wait_tick_def/2,set_ai_attack_wait_tick/2,set_ai_attack_wait_tick_direct/2, % #m_object_rw.ai_attack_wait_tick
	get_ai_skill_serial/1,get_ai_skill_serial_def/2,set_ai_skill_serial/2,set_ai_skill_serial_direct/2, % #m_object_rw.ai_skill_serial
	get_ai_flee_dst/1,get_ai_flee_dst_def/2,set_ai_flee_dst/2,set_ai_flee_dst_direct/2, % #m_object_rw.ai_flee_dst
	get_ai_flee_dir/1,get_ai_flee_dir_def/2,set_ai_flee_dir/2,set_ai_flee_dir_direct/2, % #m_object_rw.ai_flee_dir
	get_ai_flee_tick/1,get_ai_flee_tick_def/2,set_ai_flee_tick/2,set_ai_flee_tick_direct/2, % #m_object_rw.ai_flee_tick
	get_ai_is_arrived_flee_pos/1,get_ai_is_arrived_flee_pos_def/2,set_ai_is_arrived_flee_pos/2,set_ai_is_arrived_flee_pos_direct/2, % #m_object_rw.ai_is_arrived_flee_pos
	get_ai_arrived_return_pos/1,get_ai_arrived_return_pos_def/2,set_ai_arrived_return_pos/2,set_ai_arrived_return_pos_direct/2, % #m_object_rw.ai_arrived_return_pos
	get_enmity_list/1,get_enmity_list_def/2,set_enmity_list/2,set_enmity_list_direct/2, % #m_object_rw.enmity_list
	get_max_enmity_uid/1,get_max_enmity_uid_def/2,set_max_enmity_uid/2,set_max_enmity_uid_direct/2, % #m_object_rw.max_enmity_uid
	get_ai_lock_target_tick/1,get_ai_lock_target_tick_def/2,set_ai_lock_target_tick/2,set_ai_lock_target_tick_direct/2, % #m_object_rw.ai_lock_target_tick
	get_no_inc_enmity_tick/1,get_no_inc_enmity_tick_def/2,set_no_inc_enmity_tick/2,set_no_inc_enmity_tick_direct/2, % #m_object_rw.no_inc_enmity_tick
	% common function 
	del/1,get/1,set/2,set_fields/2,set_fields_direct/2,init/1,init/2
]).
%%-------------------------------------------------------------------
%%-------------------------------------------------------------------
%%-------------------------------------------------------------------
%% #m_object_rw.uid
get_uid(Uid)-> get_uid_def(Uid,undefined).

get_uid_def(Uid,Def)->
	case erlang:get({Uid,m_object_rw}) of
	undefined -> Def; 
	V -> V#m_object_rw.uid 
	end.

set_uid(Uid,V)->
	R = erlang:get({Uid,m_object_rw}),
	erlang:put({Uid,m_object_rw}, R#m_object_rw{uid = V}),
	?TRY_CATCH(hook_map:on_rw_update(Uid,#m_object_rw.uid,V)).

set_uid_direct(Uid,V)->
	R = erlang:get({Uid,m_object_rw}),
	erlang:put({Uid,m_object_rw}, R#m_object_rw{uid = V}).

%%-------------------------------------------------------------------
%% #m_object_rw.pid
get_pid(Uid)-> get_pid_def(Uid,undefined).

get_pid_def(Uid,Def)->
	case erlang:get({Uid,m_object_rw}) of
	undefined -> Def; 
	V -> V#m_object_rw.pid 
	end.

set_pid(Uid,V)->
	R = erlang:get({Uid,m_object_rw}),
	erlang:put({Uid,m_object_rw}, R#m_object_rw{pid = V}),
	?TRY_CATCH(hook_map:on_rw_update(Uid,#m_object_rw.pid,V)).

set_pid_direct(Uid,V)->
	R = erlang:get({Uid,m_object_rw}),
	erlang:put({Uid,m_object_rw}, R#m_object_rw{pid = V}).

%%-------------------------------------------------------------------
%% #m_object_rw.data_id
get_data_id(Uid)-> get_data_id_def(Uid,undefined).

get_data_id_def(Uid,Def)->
	case erlang:get({Uid,m_object_rw}) of
	undefined -> Def; 
	V -> V#m_object_rw.data_id 
	end.

set_data_id(Uid,V)->
	R = erlang:get({Uid,m_object_rw}),
	erlang:put({Uid,m_object_rw}, R#m_object_rw{data_id = V}),
	?TRY_CATCH(hook_map:on_rw_update(Uid,#m_object_rw.data_id,V)).

set_data_id_direct(Uid,V)->
	R = erlang:get({Uid,m_object_rw}),
	erlang:put({Uid,m_object_rw}, R#m_object_rw{data_id = V}).

%%-------------------------------------------------------------------
%% #m_object_rw.group
get_group(Uid)-> get_group_def(Uid,undefined).

get_group_def(Uid,Def)->
	case erlang:get({Uid,m_object_rw}) of
	undefined -> Def; 
	V -> V#m_object_rw.group 
	end.

set_group(Uid,V)->
	R = erlang:get({Uid,m_object_rw}),
	erlang:put({Uid,m_object_rw}, R#m_object_rw{group = V}),
	?TRY_CATCH(hook_map:on_rw_update(Uid,#m_object_rw.group,V)).

set_group_direct(Uid,V)->
	R = erlang:get({Uid,m_object_rw}),
	erlang:put({Uid,m_object_rw}, R#m_object_rw{group = V}).

%%-------------------------------------------------------------------
%% #m_object_rw.owner
get_owner(Uid)-> get_owner_def(Uid,undefined).

get_owner_def(Uid,Def)->
	case erlang:get({Uid,m_object_rw}) of
	undefined -> Def; 
	V -> V#m_object_rw.owner 
	end.

set_owner(Uid,V)->
	R = erlang:get({Uid,m_object_rw}),
	erlang:put({Uid,m_object_rw}, R#m_object_rw{owner = V}),
	?TRY_CATCH(hook_map:on_rw_update(Uid,#m_object_rw.owner,V)).

set_owner_direct(Uid,V)->
	R = erlang:get({Uid,m_object_rw}),
	erlang:put({Uid,m_object_rw}, R#m_object_rw{owner = V}).

%%-------------------------------------------------------------------
%% #m_object_rw.type
get_type(Uid)-> get_type_def(Uid,undefined).

get_type_def(Uid,Def)->
	case erlang:get({Uid,m_object_rw}) of
	undefined -> Def; 
	V -> V#m_object_rw.type 
	end.

set_type(Uid,V)->
	R = erlang:get({Uid,m_object_rw}),
	erlang:put({Uid,m_object_rw}, R#m_object_rw{type = V}),
	?TRY_CATCH(hook_map:on_rw_update(Uid,#m_object_rw.type,V)).

set_type_direct(Uid,V)->
	R = erlang:get({Uid,m_object_rw}),
	erlang:put({Uid,m_object_rw}, R#m_object_rw{type = V}).

%%-------------------------------------------------------------------
%% #m_object_rw.level
get_level(Uid)-> get_level_def(Uid,undefined).

get_level_def(Uid,Def)->
	case erlang:get({Uid,m_object_rw}) of
	undefined -> Def; 
	V -> V#m_object_rw.level 
	end.

set_level(Uid,V)->
	R = erlang:get({Uid,m_object_rw}),
	erlang:put({Uid,m_object_rw}, R#m_object_rw{level = V}),
	?TRY_CATCH(hook_map:on_rw_update(Uid,#m_object_rw.level,V)).

set_level_direct(Uid,V)->
	R = erlang:get({Uid,m_object_rw}),
	erlang:put({Uid,m_object_rw}, R#m_object_rw{level = V}).

%%-------------------------------------------------------------------
%% #m_object_rw.name
get_name(Uid)-> get_name_def(Uid,undefined).

get_name_def(Uid,Def)->
	case erlang:get({Uid,m_object_rw}) of
	undefined -> Def; 
	V -> V#m_object_rw.name 
	end.

set_name(Uid,V)->
	R = erlang:get({Uid,m_object_rw}),
	erlang:put({Uid,m_object_rw}, R#m_object_rw{name = V}),
	?TRY_CATCH(hook_map:on_rw_update(Uid,#m_object_rw.name,V)).

set_name_direct(Uid,V)->
	R = erlang:get({Uid,m_object_rw}),
	erlang:put({Uid,m_object_rw}, R#m_object_rw{name = V}).

%%-------------------------------------------------------------------
%% #m_object_rw.sex
get_sex(Uid)-> get_sex_def(Uid,undefined).

get_sex_def(Uid,Def)->
	case erlang:get({Uid,m_object_rw}) of
	undefined -> Def; 
	V -> V#m_object_rw.sex 
	end.

set_sex(Uid,V)->
	R = erlang:get({Uid,m_object_rw}),
	erlang:put({Uid,m_object_rw}, R#m_object_rw{sex = V}),
	?TRY_CATCH(hook_map:on_rw_update(Uid,#m_object_rw.sex,V)).

set_sex_direct(Uid,V)->
	R = erlang:get({Uid,m_object_rw}),
	erlang:put({Uid,m_object_rw}, R#m_object_rw{sex = V}).

%%-------------------------------------------------------------------
%% #m_object_rw.career
get_career(Uid)-> get_career_def(Uid,undefined).

get_career_def(Uid,Def)->
	case erlang:get({Uid,m_object_rw}) of
	undefined -> Def; 
	V -> V#m_object_rw.career 
	end.

set_career(Uid,V)->
	R = erlang:get({Uid,m_object_rw}),
	erlang:put({Uid,m_object_rw}, R#m_object_rw{career = V}),
	?TRY_CATCH(hook_map:on_rw_update(Uid,#m_object_rw.career,V)).

set_career_direct(Uid,V)->
	R = erlang:get({Uid,m_object_rw}),
	erlang:put({Uid,m_object_rw}, R#m_object_rw{career = V}).

%%-------------------------------------------------------------------
%% #m_object_rw.race
get_race(Uid)-> get_race_def(Uid,undefined).

get_race_def(Uid,Def)->
	case erlang:get({Uid,m_object_rw}) of
	undefined -> Def; 
	V -> V#m_object_rw.race 
	end.

set_race(Uid,V)->
	R = erlang:get({Uid,m_object_rw}),
	erlang:put({Uid,m_object_rw}, R#m_object_rw{race = V}),
	?TRY_CATCH(hook_map:on_rw_update(Uid,#m_object_rw.race,V)).

set_race_direct(Uid,V)->
	R = erlang:get({Uid,m_object_rw}),
	erlang:put({Uid,m_object_rw}, R#m_object_rw{race = V}).

%%-------------------------------------------------------------------
%% #m_object_rw.camp
get_camp(Uid)-> get_camp_def(Uid,undefined).

get_camp_def(Uid,Def)->
	case erlang:get({Uid,m_object_rw}) of
	undefined -> Def; 
	V -> V#m_object_rw.camp 
	end.

set_camp(Uid,V)->
	R = erlang:get({Uid,m_object_rw}),
	erlang:put({Uid,m_object_rw}, R#m_object_rw{camp = V}),
	?TRY_CATCH(hook_map:on_rw_update(Uid,#m_object_rw.camp,V)).

set_camp_direct(Uid,V)->
	R = erlang:get({Uid,m_object_rw}),
	erlang:put({Uid,m_object_rw}, R#m_object_rw{camp = V}).

%%-------------------------------------------------------------------
%% #m_object_rw.state
get_state(Uid)-> get_state_def(Uid,undefined).

get_state_def(Uid,Def)->
	case erlang:get({Uid,m_object_rw}) of
	undefined -> Def; 
	V -> V#m_object_rw.state 
	end.

set_state(Uid,V)->
	R = erlang:get({Uid,m_object_rw}),
	erlang:put({Uid,m_object_rw}, R#m_object_rw{state = V}),
	?TRY_CATCH(hook_map:on_rw_update(Uid,#m_object_rw.state,V)).

set_state_direct(Uid,V)->
	R = erlang:get({Uid,m_object_rw}),
	erlang:put({Uid,m_object_rw}, R#m_object_rw{state = V}).

%%-------------------------------------------------------------------
%% #m_object_rw.move_speed
get_move_speed(Uid)-> get_move_speed_def(Uid,undefined).

get_move_speed_def(Uid,Def)->
	case erlang:get({Uid,m_object_rw}) of
	undefined -> Def; 
	V -> V#m_object_rw.move_speed 
	end.

set_move_speed(Uid,V)->
	R = erlang:get({Uid,m_object_rw}),
	erlang:put({Uid,m_object_rw}, R#m_object_rw{move_speed = V}),
	?TRY_CATCH(hook_map:on_rw_update(Uid,#m_object_rw.move_speed,V)).

set_move_speed_direct(Uid,V)->
	R = erlang:get({Uid,m_object_rw}),
	erlang:put({Uid,m_object_rw}, R#m_object_rw{move_speed = V}).

%%-------------------------------------------------------------------
%% #m_object_rw.cur_move
get_cur_move(Uid)-> get_cur_move_def(Uid,undefined).

get_cur_move_def(Uid,Def)->
	case erlang:get({Uid,m_object_rw}) of
	undefined -> Def; 
	V -> V#m_object_rw.cur_move 
	end.

set_cur_move(Uid,V)->
	R = erlang:get({Uid,m_object_rw}),
	erlang:put({Uid,m_object_rw}, R#m_object_rw{cur_move = V}),
	?TRY_CATCH(hook_map:on_rw_update(Uid,#m_object_rw.cur_move,V)).

set_cur_move_direct(Uid,V)->
	R = erlang:get({Uid,m_object_rw}),
	erlang:put({Uid,m_object_rw}, R#m_object_rw{cur_move = V}).

%%-------------------------------------------------------------------
%% #m_object_rw.next_move
get_next_move(Uid)-> get_next_move_def(Uid,undefined).

get_next_move_def(Uid,Def)->
	case erlang:get({Uid,m_object_rw}) of
	undefined -> Def; 
	V -> V#m_object_rw.next_move 
	end.

set_next_move(Uid,V)->
	R = erlang:get({Uid,m_object_rw}),
	erlang:put({Uid,m_object_rw}, R#m_object_rw{next_move = V}),
	?TRY_CATCH(hook_map:on_rw_update(Uid,#m_object_rw.next_move,V)).

set_next_move_direct(Uid,V)->
	R = erlang:get({Uid,m_object_rw}),
	erlang:put({Uid,m_object_rw}, R#m_object_rw{next_move = V}).

%%-------------------------------------------------------------------
%% #m_object_rw.vis_tile_idx
get_vis_tile_idx(Uid)-> get_vis_tile_idx_def(Uid,undefined).

get_vis_tile_idx_def(Uid,Def)->
	case erlang:get({Uid,m_object_rw}) of
	undefined -> Def; 
	V -> V#m_object_rw.vis_tile_idx 
	end.

set_vis_tile_idx(Uid,V)->
	R = erlang:get({Uid,m_object_rw}),
	erlang:put({Uid,m_object_rw}, R#m_object_rw{vis_tile_idx = V}),
	?TRY_CATCH(hook_map:on_rw_update(Uid,#m_object_rw.vis_tile_idx,V)).

set_vis_tile_idx_direct(Uid,V)->
	R = erlang:get({Uid,m_object_rw}),
	erlang:put({Uid,m_object_rw}, R#m_object_rw{vis_tile_idx = V}).

%%-------------------------------------------------------------------
%% #m_object_rw.cur_pos
get_cur_pos(Uid)-> get_cur_pos_def(Uid,undefined).

get_cur_pos_def(Uid,Def)->
	case erlang:get({Uid,m_object_rw}) of
	undefined -> Def; 
	V -> V#m_object_rw.cur_pos 
	end.

set_cur_pos(Uid,V)->
	R = erlang:get({Uid,m_object_rw}),
	erlang:put({Uid,m_object_rw}, R#m_object_rw{cur_pos = V}),
	?TRY_CATCH(hook_map:on_rw_update(Uid,#m_object_rw.cur_pos,V)).

set_cur_pos_direct(Uid,V)->
	R = erlang:get({Uid,m_object_rw}),
	erlang:put({Uid,m_object_rw}, R#m_object_rw{cur_pos = V}).

%%-------------------------------------------------------------------
%% #m_object_rw.start_pos
get_start_pos(Uid)-> get_start_pos_def(Uid,undefined).

get_start_pos_def(Uid,Def)->
	case erlang:get({Uid,m_object_rw}) of
	undefined -> Def; 
	V -> V#m_object_rw.start_pos 
	end.

set_start_pos(Uid,V)->
	R = erlang:get({Uid,m_object_rw}),
	erlang:put({Uid,m_object_rw}, R#m_object_rw{start_pos = V}),
	?TRY_CATCH(hook_map:on_rw_update(Uid,#m_object_rw.start_pos,V)).

set_start_pos_direct(Uid,V)->
	R = erlang:get({Uid,m_object_rw}),
	erlang:put({Uid,m_object_rw}, R#m_object_rw{start_pos = V}).

%%-------------------------------------------------------------------
%% #m_object_rw.dest_pos
get_dest_pos(Uid)-> get_dest_pos_def(Uid,undefined).

get_dest_pos_def(Uid,Def)->
	case erlang:get({Uid,m_object_rw}) of
	undefined -> Def; 
	V -> V#m_object_rw.dest_pos 
	end.

set_dest_pos(Uid,V)->
	R = erlang:get({Uid,m_object_rw}),
	erlang:put({Uid,m_object_rw}, R#m_object_rw{dest_pos = V}),
	?TRY_CATCH(hook_map:on_rw_update(Uid,#m_object_rw.dest_pos,V)).

set_dest_pos_direct(Uid,V)->
	R = erlang:get({Uid,m_object_rw}),
	erlang:put({Uid,m_object_rw}, R#m_object_rw{dest_pos = V}).

%%-------------------------------------------------------------------
%% #m_object_rw.face
get_face(Uid)-> get_face_def(Uid,undefined).

get_face_def(Uid,Def)->
	case erlang:get({Uid,m_object_rw}) of
	undefined -> Def; 
	V -> V#m_object_rw.face 
	end.

set_face(Uid,V)->
	R = erlang:get({Uid,m_object_rw}),
	erlang:put({Uid,m_object_rw}, R#m_object_rw{face = V}),
	?TRY_CATCH(hook_map:on_rw_update(Uid,#m_object_rw.face,V)).

set_face_direct(Uid,V)->
	R = erlang:get({Uid,m_object_rw}),
	erlang:put({Uid,m_object_rw}, R#m_object_rw{face = V}).

%%-------------------------------------------------------------------
%% #m_object_rw.dir
get_dir(Uid)-> get_dir_def(Uid,undefined).

get_dir_def(Uid,Def)->
	case erlang:get({Uid,m_object_rw}) of
	undefined -> Def; 
	V -> V#m_object_rw.dir 
	end.

set_dir(Uid,V)->
	R = erlang:get({Uid,m_object_rw}),
	erlang:put({Uid,m_object_rw}, R#m_object_rw{dir = V}),
	?TRY_CATCH(hook_map:on_rw_update(Uid,#m_object_rw.dir,V)).

set_dir_direct(Uid,V)->
	R = erlang:get({Uid,m_object_rw}),
	erlang:put({Uid,m_object_rw}, R#m_object_rw{dir = V}).

%%-------------------------------------------------------------------
%% #m_object_rw.move_start_time
get_move_start_time(Uid)-> get_move_start_time_def(Uid,undefined).

get_move_start_time_def(Uid,Def)->
	case erlang:get({Uid,m_object_rw}) of
	undefined -> Def; 
	V -> V#m_object_rw.move_start_time 
	end.

set_move_start_time(Uid,V)->
	R = erlang:get({Uid,m_object_rw}),
	erlang:put({Uid,m_object_rw}, R#m_object_rw{move_start_time = V}),
	?TRY_CATCH(hook_map:on_rw_update(Uid,#m_object_rw.move_start_time,V)).

set_move_start_time_direct(Uid,V)->
	R = erlang:get({Uid,m_object_rw}),
	erlang:put({Uid,m_object_rw}, R#m_object_rw{move_start_time = V}).

%%-------------------------------------------------------------------
%% #m_object_rw.seg_move_time
get_seg_move_time(Uid)-> get_seg_move_time_def(Uid,undefined).

get_seg_move_time_def(Uid,Def)->
	case erlang:get({Uid,m_object_rw}) of
	undefined -> Def; 
	V -> V#m_object_rw.seg_move_time 
	end.

set_seg_move_time(Uid,V)->
	R = erlang:get({Uid,m_object_rw}),
	erlang:put({Uid,m_object_rw}, R#m_object_rw{seg_move_time = V}),
	?TRY_CATCH(hook_map:on_rw_update(Uid,#m_object_rw.seg_move_time,V)).

set_seg_move_time_direct(Uid,V)->
	R = erlang:get({Uid,m_object_rw}),
	erlang:put({Uid,m_object_rw}, R#m_object_rw{seg_move_time = V}).

%%-------------------------------------------------------------------
%% #m_object_rw.force_stopped
get_force_stopped(Uid)-> get_force_stopped_def(Uid,undefined).

get_force_stopped_def(Uid,Def)->
	case erlang:get({Uid,m_object_rw}) of
	undefined -> Def; 
	V -> V#m_object_rw.force_stopped 
	end.

set_force_stopped(Uid,V)->
	R = erlang:get({Uid,m_object_rw}),
	erlang:put({Uid,m_object_rw}, R#m_object_rw{force_stopped = V}),
	?TRY_CATCH(hook_map:on_rw_update(Uid,#m_object_rw.force_stopped,V)).

set_force_stopped_direct(Uid,V)->
	R = erlang:get({Uid,m_object_rw}),
	erlang:put({Uid,m_object_rw}, R#m_object_rw{force_stopped = V}).

%%-------------------------------------------------------------------
%% #m_object_rw.move_path_list
get_move_path_list(Uid)-> get_move_path_list_def(Uid,undefined).

get_move_path_list_def(Uid,Def)->
	case erlang:get({Uid,m_object_rw}) of
	undefined -> Def; 
	V -> V#m_object_rw.move_path_list 
	end.

set_move_path_list(Uid,V)->
	R = erlang:get({Uid,m_object_rw}),
	erlang:put({Uid,m_object_rw}, R#m_object_rw{move_path_list = V}),
	?TRY_CATCH(hook_map:on_rw_update(Uid,#m_object_rw.move_path_list,V)).

set_move_path_list_direct(Uid,V)->
	R = erlang:get({Uid,m_object_rw}),
	erlang:put({Uid,m_object_rw}, R#m_object_rw{move_path_list = V}).

%%-------------------------------------------------------------------
%% #m_object_rw.born_pos
get_born_pos(Uid)-> get_born_pos_def(Uid,undefined).

get_born_pos_def(Uid,Def)->
	case erlang:get({Uid,m_object_rw}) of
	undefined -> Def; 
	V -> V#m_object_rw.born_pos 
	end.

set_born_pos(Uid,V)->
	R = erlang:get({Uid,m_object_rw}),
	erlang:put({Uid,m_object_rw}, R#m_object_rw{born_pos = V}),
	?TRY_CATCH(hook_map:on_rw_update(Uid,#m_object_rw.born_pos,V)).

set_born_pos_direct(Uid,V)->
	R = erlang:get({Uid,m_object_rw}),
	erlang:put({Uid,m_object_rw}, R#m_object_rw{born_pos = V}).

%%-------------------------------------------------------------------
%% #m_object_rw.battle_in_time
get_battle_in_time(Uid)-> get_battle_in_time_def(Uid,undefined).

get_battle_in_time_def(Uid,Def)->
	case erlang:get({Uid,m_object_rw}) of
	undefined -> Def; 
	V -> V#m_object_rw.battle_in_time 
	end.

set_battle_in_time(Uid,V)->
	R = erlang:get({Uid,m_object_rw}),
	erlang:put({Uid,m_object_rw}, R#m_object_rw{battle_in_time = V}),
	?TRY_CATCH(hook_map:on_rw_update(Uid,#m_object_rw.battle_in_time,V)).

set_battle_in_time_direct(Uid,V)->
	R = erlang:get({Uid,m_object_rw}),
	erlang:put({Uid,m_object_rw}, R#m_object_rw{battle_in_time = V}).

%%-------------------------------------------------------------------
%% #m_object_rw.hp
get_hp(Uid)-> get_hp_def(Uid,undefined).

get_hp_def(Uid,Def)->
	case erlang:get({Uid,m_object_rw}) of
	undefined -> Def; 
	V -> V#m_object_rw.hp 
	end.

set_hp(Uid,V)->
	R = erlang:get({Uid,m_object_rw}),
	erlang:put({Uid,m_object_rw}, R#m_object_rw{hp = V}),
	?TRY_CATCH(hook_map:on_rw_update(Uid,#m_object_rw.hp,V)).

set_hp_direct(Uid,V)->
	R = erlang:get({Uid,m_object_rw}),
	erlang:put({Uid,m_object_rw}, R#m_object_rw{hp = V}).

%%-------------------------------------------------------------------
%% #m_object_rw.max_hp
get_max_hp(Uid)-> get_max_hp_def(Uid,undefined).

get_max_hp_def(Uid,Def)->
	case erlang:get({Uid,m_object_rw}) of
	undefined -> Def; 
	V -> V#m_object_rw.max_hp 
	end.

set_max_hp(Uid,V)->
	R = erlang:get({Uid,m_object_rw}),
	erlang:put({Uid,m_object_rw}, R#m_object_rw{max_hp = V}),
	?TRY_CATCH(hook_map:on_rw_update(Uid,#m_object_rw.max_hp,V)).

set_max_hp_direct(Uid,V)->
	R = erlang:get({Uid,m_object_rw}),
	erlang:put({Uid,m_object_rw}, R#m_object_rw{max_hp = V}).

%%-------------------------------------------------------------------
%% #m_object_rw.battle_props
get_battle_props(Uid)-> get_battle_props_def(Uid,undefined).

get_battle_props_def(Uid,Def)->
	case erlang:get({Uid,m_object_rw}) of
	undefined -> Def; 
	V -> V#m_object_rw.battle_props 
	end.

set_battle_props(Uid,V)->
	R = erlang:get({Uid,m_object_rw}),
	erlang:put({Uid,m_object_rw}, R#m_object_rw{battle_props = V}),
	?TRY_CATCH(hook_map:on_rw_update(Uid,#m_object_rw.battle_props,V)).

set_battle_props_direct(Uid,V)->
	R = erlang:get({Uid,m_object_rw}),
	erlang:put({Uid,m_object_rw}, R#m_object_rw{battle_props = V}).

%%-------------------------------------------------------------------
%% #m_object_rw.buff_list
get_buff_list(Uid)-> get_buff_list_def(Uid,undefined).

get_buff_list_def(Uid,Def)->
	case erlang:get({Uid,m_object_rw}) of
	undefined -> Def; 
	V -> V#m_object_rw.buff_list 
	end.

set_buff_list(Uid,V)->
	R = erlang:get({Uid,m_object_rw}),
	erlang:put({Uid,m_object_rw}, R#m_object_rw{buff_list = V}),
	?TRY_CATCH(hook_map:on_rw_update(Uid,#m_object_rw.buff_list,V)).

set_buff_list_direct(Uid,V)->
	R = erlang:get({Uid,m_object_rw}),
	erlang:put({Uid,m_object_rw}, R#m_object_rw{buff_list = V}).

%%-------------------------------------------------------------------
%% #m_object_rw.ai_state
get_ai_state(Uid)-> get_ai_state_def(Uid,undefined).

get_ai_state_def(Uid,Def)->
	case erlang:get({Uid,m_object_rw}) of
	undefined -> Def; 
	V -> V#m_object_rw.ai_state 
	end.

set_ai_state(Uid,V)->
	R = erlang:get({Uid,m_object_rw}),
	erlang:put({Uid,m_object_rw}, R#m_object_rw{ai_state = V}),
	?TRY_CATCH(hook_map:on_rw_update(Uid,#m_object_rw.ai_state,V)).

set_ai_state_direct(Uid,V)->
	R = erlang:get({Uid,m_object_rw}),
	erlang:put({Uid,m_object_rw}, R#m_object_rw{ai_state = V}).

%%-------------------------------------------------------------------
%% #m_object_rw.pre_ai_state
get_pre_ai_state(Uid)-> get_pre_ai_state_def(Uid,undefined).

get_pre_ai_state_def(Uid,Def)->
	case erlang:get({Uid,m_object_rw}) of
	undefined -> Def; 
	V -> V#m_object_rw.pre_ai_state 
	end.

set_pre_ai_state(Uid,V)->
	R = erlang:get({Uid,m_object_rw}),
	erlang:put({Uid,m_object_rw}, R#m_object_rw{pre_ai_state = V}),
	?TRY_CATCH(hook_map:on_rw_update(Uid,#m_object_rw.pre_ai_state,V)).

set_pre_ai_state_direct(Uid,V)->
	R = erlang:get({Uid,m_object_rw}),
	erlang:put({Uid,m_object_rw}, R#m_object_rw{pre_ai_state = V}).

%%-------------------------------------------------------------------
%% #m_object_rw.ai_transition
get_ai_transition(Uid)-> get_ai_transition_def(Uid,undefined).

get_ai_transition_def(Uid,Def)->
	case erlang:get({Uid,m_object_rw}) of
	undefined -> Def; 
	V -> V#m_object_rw.ai_transition 
	end.

set_ai_transition(Uid,V)->
	R = erlang:get({Uid,m_object_rw}),
	erlang:put({Uid,m_object_rw}, R#m_object_rw{ai_transition = V}),
	?TRY_CATCH(hook_map:on_rw_update(Uid,#m_object_rw.ai_transition,V)).

set_ai_transition_direct(Uid,V)->
	R = erlang:get({Uid,m_object_rw}),
	erlang:put({Uid,m_object_rw}, R#m_object_rw{ai_transition = V}).

%%-------------------------------------------------------------------
%% #m_object_rw.ai_triggers
get_ai_triggers(Uid)-> get_ai_triggers_def(Uid,undefined).

get_ai_triggers_def(Uid,Def)->
	case erlang:get({Uid,m_object_rw}) of
	undefined -> Def; 
	V -> V#m_object_rw.ai_triggers 
	end.

set_ai_triggers(Uid,V)->
	R = erlang:get({Uid,m_object_rw}),
	erlang:put({Uid,m_object_rw}, R#m_object_rw{ai_triggers = V}),
	?TRY_CATCH(hook_map:on_rw_update(Uid,#m_object_rw.ai_triggers,V)).

set_ai_triggers_direct(Uid,V)->
	R = erlang:get({Uid,m_object_rw}),
	erlang:put({Uid,m_object_rw}, R#m_object_rw{ai_triggers = V}).

%%-------------------------------------------------------------------
%% #m_object_rw.ai_pause
get_ai_pause(Uid)-> get_ai_pause_def(Uid,undefined).

get_ai_pause_def(Uid,Def)->
	case erlang:get({Uid,m_object_rw}) of
	undefined -> Def; 
	V -> V#m_object_rw.ai_pause 
	end.

set_ai_pause(Uid,V)->
	R = erlang:get({Uid,m_object_rw}),
	erlang:put({Uid,m_object_rw}, R#m_object_rw{ai_pause = V}),
	?TRY_CATCH(hook_map:on_rw_update(Uid,#m_object_rw.ai_pause,V)).

set_ai_pause_direct(Uid,V)->
	R = erlang:get({Uid,m_object_rw}),
	erlang:put({Uid,m_object_rw}, R#m_object_rw{ai_pause = V}).

%%-------------------------------------------------------------------
%% #m_object_rw.ai_id
get_ai_id(Uid)-> get_ai_id_def(Uid,undefined).

get_ai_id_def(Uid,Def)->
	case erlang:get({Uid,m_object_rw}) of
	undefined -> Def; 
	V -> V#m_object_rw.ai_id 
	end.

set_ai_id(Uid,V)->
	R = erlang:get({Uid,m_object_rw}),
	erlang:put({Uid,m_object_rw}, R#m_object_rw{ai_id = V}),
	?TRY_CATCH(hook_map:on_rw_update(Uid,#m_object_rw.ai_id,V)).

set_ai_id_direct(Uid,V)->
	R = erlang:get({Uid,m_object_rw}),
	erlang:put({Uid,m_object_rw}, R#m_object_rw{ai_id = V}).

%%-------------------------------------------------------------------
%% #m_object_rw.ai_wp_list
get_ai_wp_list(Uid)-> get_ai_wp_list_def(Uid,undefined).

get_ai_wp_list_def(Uid,Def)->
	case erlang:get({Uid,m_object_rw}) of
	undefined -> Def; 
	V -> V#m_object_rw.ai_wp_list 
	end.

set_ai_wp_list(Uid,V)->
	R = erlang:get({Uid,m_object_rw}),
	erlang:put({Uid,m_object_rw}, R#m_object_rw{ai_wp_list = V}),
	?TRY_CATCH(hook_map:on_rw_update(Uid,#m_object_rw.ai_wp_list,V)).

set_ai_wp_list_direct(Uid,V)->
	R = erlang:get({Uid,m_object_rw}),
	erlang:put({Uid,m_object_rw}, R#m_object_rw{ai_wp_list = V}).

%%-------------------------------------------------------------------
%% #m_object_rw.ai_wp_num
get_ai_wp_num(Uid)-> get_ai_wp_num_def(Uid,undefined).

get_ai_wp_num_def(Uid,Def)->
	case erlang:get({Uid,m_object_rw}) of
	undefined -> Def; 
	V -> V#m_object_rw.ai_wp_num 
	end.

set_ai_wp_num(Uid,V)->
	R = erlang:get({Uid,m_object_rw}),
	erlang:put({Uid,m_object_rw}, R#m_object_rw{ai_wp_num = V}),
	?TRY_CATCH(hook_map:on_rw_update(Uid,#m_object_rw.ai_wp_num,V)).

set_ai_wp_num_direct(Uid,V)->
	R = erlang:get({Uid,m_object_rw}),
	erlang:put({Uid,m_object_rw}, R#m_object_rw{ai_wp_num = V}).

%%-------------------------------------------------------------------
%% #m_object_rw.ai_wp_idx
get_ai_wp_idx(Uid)-> get_ai_wp_idx_def(Uid,undefined).

get_ai_wp_idx_def(Uid,Def)->
	case erlang:get({Uid,m_object_rw}) of
	undefined -> Def; 
	V -> V#m_object_rw.ai_wp_idx 
	end.

set_ai_wp_idx(Uid,V)->
	R = erlang:get({Uid,m_object_rw}),
	erlang:put({Uid,m_object_rw}, R#m_object_rw{ai_wp_idx = V}),
	?TRY_CATCH(hook_map:on_rw_update(Uid,#m_object_rw.ai_wp_idx,V)).

set_ai_wp_idx_direct(Uid,V)->
	R = erlang:get({Uid,m_object_rw}),
	erlang:put({Uid,m_object_rw}, R#m_object_rw{ai_wp_idx = V}).

%%-------------------------------------------------------------------
%% #m_object_rw.ai_is_reverse_patrol
get_ai_is_reverse_patrol(Uid)-> get_ai_is_reverse_patrol_def(Uid,undefined).

get_ai_is_reverse_patrol_def(Uid,Def)->
	case erlang:get({Uid,m_object_rw}) of
	undefined -> Def; 
	V -> V#m_object_rw.ai_is_reverse_patrol 
	end.

set_ai_is_reverse_patrol(Uid,V)->
	R = erlang:get({Uid,m_object_rw}),
	erlang:put({Uid,m_object_rw}, R#m_object_rw{ai_is_reverse_patrol = V}),
	?TRY_CATCH(hook_map:on_rw_update(Uid,#m_object_rw.ai_is_reverse_patrol,V)).

set_ai_is_reverse_patrol_direct(Uid,V)->
	R = erlang:get({Uid,m_object_rw}),
	erlang:put({Uid,m_object_rw}, R#m_object_rw{ai_is_reverse_patrol = V}).

%%-------------------------------------------------------------------
%% #m_object_rw.ai_is_patrol
get_ai_is_patrol(Uid)-> get_ai_is_patrol_def(Uid,undefined).

get_ai_is_patrol_def(Uid,Def)->
	case erlang:get({Uid,m_object_rw}) of
	undefined -> Def; 
	V -> V#m_object_rw.ai_is_patrol 
	end.

set_ai_is_patrol(Uid,V)->
	R = erlang:get({Uid,m_object_rw}),
	erlang:put({Uid,m_object_rw}, R#m_object_rw{ai_is_patrol = V}),
	?TRY_CATCH(hook_map:on_rw_update(Uid,#m_object_rw.ai_is_patrol,V)).

set_ai_is_patrol_direct(Uid,V)->
	R = erlang:get({Uid,m_object_rw}),
	erlang:put({Uid,m_object_rw}, R#m_object_rw{ai_is_patrol = V}).

%%-------------------------------------------------------------------
%% #m_object_rw.ai_patrol_rest_tick
get_ai_patrol_rest_tick(Uid)-> get_ai_patrol_rest_tick_def(Uid,undefined).

get_ai_patrol_rest_tick_def(Uid,Def)->
	case erlang:get({Uid,m_object_rw}) of
	undefined -> Def; 
	V -> V#m_object_rw.ai_patrol_rest_tick 
	end.

set_ai_patrol_rest_tick(Uid,V)->
	R = erlang:get({Uid,m_object_rw}),
	erlang:put({Uid,m_object_rw}, R#m_object_rw{ai_patrol_rest_tick = V}),
	?TRY_CATCH(hook_map:on_rw_update(Uid,#m_object_rw.ai_patrol_rest_tick,V)).

set_ai_patrol_rest_tick_direct(Uid,V)->
	R = erlang:get({Uid,m_object_rw}),
	erlang:put({Uid,m_object_rw}, R#m_object_rw{ai_patrol_rest_tick = V}).

%%-------------------------------------------------------------------
%% #m_object_rw.ai_look_for_target_tick
get_ai_look_for_target_tick(Uid)-> get_ai_look_for_target_tick_def(Uid,undefined).

get_ai_look_for_target_tick_def(Uid,Def)->
	case erlang:get({Uid,m_object_rw}) of
	undefined -> Def; 
	V -> V#m_object_rw.ai_look_for_target_tick 
	end.

set_ai_look_for_target_tick(Uid,V)->
	R = erlang:get({Uid,m_object_rw}),
	erlang:put({Uid,m_object_rw}, R#m_object_rw{ai_look_for_target_tick = V}),
	?TRY_CATCH(hook_map:on_rw_update(Uid,#m_object_rw.ai_look_for_target_tick,V)).

set_ai_look_for_target_tick_direct(Uid,V)->
	R = erlang:get({Uid,m_object_rw}),
	erlang:put({Uid,m_object_rw}, R#m_object_rw{ai_look_for_target_tick = V}).

%%-------------------------------------------------------------------
%% #m_object_rw.ai_pursue_tar_pos
get_ai_pursue_tar_pos(Uid)-> get_ai_pursue_tar_pos_def(Uid,undefined).

get_ai_pursue_tar_pos_def(Uid,Def)->
	case erlang:get({Uid,m_object_rw}) of
	undefined -> Def; 
	V -> V#m_object_rw.ai_pursue_tar_pos 
	end.

set_ai_pursue_tar_pos(Uid,V)->
	R = erlang:get({Uid,m_object_rw}),
	erlang:put({Uid,m_object_rw}, R#m_object_rw{ai_pursue_tar_pos = V}),
	?TRY_CATCH(hook_map:on_rw_update(Uid,#m_object_rw.ai_pursue_tar_pos,V)).

set_ai_pursue_tar_pos_direct(Uid,V)->
	R = erlang:get({Uid,m_object_rw}),
	erlang:put({Uid,m_object_rw}, R#m_object_rw{ai_pursue_tar_pos = V}).

%%-------------------------------------------------------------------
%% #m_object_rw.ai_pursue_failed
get_ai_pursue_failed(Uid)-> get_ai_pursue_failed_def(Uid,undefined).

get_ai_pursue_failed_def(Uid,Def)->
	case erlang:get({Uid,m_object_rw}) of
	undefined -> Def; 
	V -> V#m_object_rw.ai_pursue_failed 
	end.

set_ai_pursue_failed(Uid,V)->
	R = erlang:get({Uid,m_object_rw}),
	erlang:put({Uid,m_object_rw}, R#m_object_rw{ai_pursue_failed = V}),
	?TRY_CATCH(hook_map:on_rw_update(Uid,#m_object_rw.ai_pursue_failed,V)).

set_ai_pursue_failed_direct(Uid,V)->
	R = erlang:get({Uid,m_object_rw}),
	erlang:put({Uid,m_object_rw}, R#m_object_rw{ai_pursue_failed = V}).

%%-------------------------------------------------------------------
%% #m_object_rw.ai_cant_pursue
get_ai_cant_pursue(Uid)-> get_ai_cant_pursue_def(Uid,undefined).

get_ai_cant_pursue_def(Uid,Def)->
	case erlang:get({Uid,m_object_rw}) of
	undefined -> Def; 
	V -> V#m_object_rw.ai_cant_pursue 
	end.

set_ai_cant_pursue(Uid,V)->
	R = erlang:get({Uid,m_object_rw}),
	erlang:put({Uid,m_object_rw}, R#m_object_rw{ai_cant_pursue = V}),
	?TRY_CATCH(hook_map:on_rw_update(Uid,#m_object_rw.ai_cant_pursue,V)).

set_ai_cant_pursue_direct(Uid,V)->
	R = erlang:get({Uid,m_object_rw}),
	erlang:put({Uid,m_object_rw}, R#m_object_rw{ai_cant_pursue = V}).

%%-------------------------------------------------------------------
%% #m_object_rw.ai_check_pursue_tick
get_ai_check_pursue_tick(Uid)-> get_ai_check_pursue_tick_def(Uid,undefined).

get_ai_check_pursue_tick_def(Uid,Def)->
	case erlang:get({Uid,m_object_rw}) of
	undefined -> Def; 
	V -> V#m_object_rw.ai_check_pursue_tick 
	end.

set_ai_check_pursue_tick(Uid,V)->
	R = erlang:get({Uid,m_object_rw}),
	erlang:put({Uid,m_object_rw}, R#m_object_rw{ai_check_pursue_tick = V}),
	?TRY_CATCH(hook_map:on_rw_update(Uid,#m_object_rw.ai_check_pursue_tick,V)).

set_ai_check_pursue_tick_direct(Uid,V)->
	R = erlang:get({Uid,m_object_rw}),
	erlang:put({Uid,m_object_rw}, R#m_object_rw{ai_check_pursue_tick = V}).

%%-------------------------------------------------------------------
%% #m_object_rw.ai_target_uid
get_ai_target_uid(Uid)-> get_ai_target_uid_def(Uid,undefined).

get_ai_target_uid_def(Uid,Def)->
	case erlang:get({Uid,m_object_rw}) of
	undefined -> Def; 
	V -> V#m_object_rw.ai_target_uid 
	end.

set_ai_target_uid(Uid,V)->
	R = erlang:get({Uid,m_object_rw}),
	erlang:put({Uid,m_object_rw}, R#m_object_rw{ai_target_uid = V}),
	?TRY_CATCH(hook_map:on_rw_update(Uid,#m_object_rw.ai_target_uid,V)).

set_ai_target_uid_direct(Uid,V)->
	R = erlang:get({Uid,m_object_rw}),
	erlang:put({Uid,m_object_rw}, R#m_object_rw{ai_target_uid = V}).

%%-------------------------------------------------------------------
%% #m_object_rw.ai_enter_combat_time
get_ai_enter_combat_time(Uid)-> get_ai_enter_combat_time_def(Uid,undefined).

get_ai_enter_combat_time_def(Uid,Def)->
	case erlang:get({Uid,m_object_rw}) of
	undefined -> Def; 
	V -> V#m_object_rw.ai_enter_combat_time 
	end.

set_ai_enter_combat_time(Uid,V)->
	R = erlang:get({Uid,m_object_rw}),
	erlang:put({Uid,m_object_rw}, R#m_object_rw{ai_enter_combat_time = V}),
	?TRY_CATCH(hook_map:on_rw_update(Uid,#m_object_rw.ai_enter_combat_time,V)).

set_ai_enter_combat_time_direct(Uid,V)->
	R = erlang:get({Uid,m_object_rw}),
	erlang:put({Uid,m_object_rw}, R#m_object_rw{ai_enter_combat_time = V}).

%%-------------------------------------------------------------------
%% #m_object_rw.ai_enter_combat_pos
get_ai_enter_combat_pos(Uid)-> get_ai_enter_combat_pos_def(Uid,undefined).

get_ai_enter_combat_pos_def(Uid,Def)->
	case erlang:get({Uid,m_object_rw}) of
	undefined -> Def; 
	V -> V#m_object_rw.ai_enter_combat_pos 
	end.

set_ai_enter_combat_pos(Uid,V)->
	R = erlang:get({Uid,m_object_rw}),
	erlang:put({Uid,m_object_rw}, R#m_object_rw{ai_enter_combat_pos = V}),
	?TRY_CATCH(hook_map:on_rw_update(Uid,#m_object_rw.ai_enter_combat_pos,V)).

set_ai_enter_combat_pos_direct(Uid,V)->
	R = erlang:get({Uid,m_object_rw}),
	erlang:put({Uid,m_object_rw}, R#m_object_rw{ai_enter_combat_pos = V}).

%%-------------------------------------------------------------------
%% #m_object_rw.ai_use_skill_id
get_ai_use_skill_id(Uid)-> get_ai_use_skill_id_def(Uid,undefined).

get_ai_use_skill_id_def(Uid,Def)->
	case erlang:get({Uid,m_object_rw}) of
	undefined -> Def; 
	V -> V#m_object_rw.ai_use_skill_id 
	end.

set_ai_use_skill_id(Uid,V)->
	R = erlang:get({Uid,m_object_rw}),
	erlang:put({Uid,m_object_rw}, R#m_object_rw{ai_use_skill_id = V}),
	?TRY_CATCH(hook_map:on_rw_update(Uid,#m_object_rw.ai_use_skill_id,V)).

set_ai_use_skill_id_direct(Uid,V)->
	R = erlang:get({Uid,m_object_rw}),
	erlang:put({Uid,m_object_rw}, R#m_object_rw{ai_use_skill_id = V}).

%%-------------------------------------------------------------------
%% #m_object_rw.ai_attack_wait_tick
get_ai_attack_wait_tick(Uid)-> get_ai_attack_wait_tick_def(Uid,undefined).

get_ai_attack_wait_tick_def(Uid,Def)->
	case erlang:get({Uid,m_object_rw}) of
	undefined -> Def; 
	V -> V#m_object_rw.ai_attack_wait_tick 
	end.

set_ai_attack_wait_tick(Uid,V)->
	R = erlang:get({Uid,m_object_rw}),
	erlang:put({Uid,m_object_rw}, R#m_object_rw{ai_attack_wait_tick = V}),
	?TRY_CATCH(hook_map:on_rw_update(Uid,#m_object_rw.ai_attack_wait_tick,V)).

set_ai_attack_wait_tick_direct(Uid,V)->
	R = erlang:get({Uid,m_object_rw}),
	erlang:put({Uid,m_object_rw}, R#m_object_rw{ai_attack_wait_tick = V}).

%%-------------------------------------------------------------------
%% #m_object_rw.ai_skill_serial
get_ai_skill_serial(Uid)-> get_ai_skill_serial_def(Uid,undefined).

get_ai_skill_serial_def(Uid,Def)->
	case erlang:get({Uid,m_object_rw}) of
	undefined -> Def; 
	V -> V#m_object_rw.ai_skill_serial 
	end.

set_ai_skill_serial(Uid,V)->
	R = erlang:get({Uid,m_object_rw}),
	erlang:put({Uid,m_object_rw}, R#m_object_rw{ai_skill_serial = V}),
	?TRY_CATCH(hook_map:on_rw_update(Uid,#m_object_rw.ai_skill_serial,V)).

set_ai_skill_serial_direct(Uid,V)->
	R = erlang:get({Uid,m_object_rw}),
	erlang:put({Uid,m_object_rw}, R#m_object_rw{ai_skill_serial = V}).

%%-------------------------------------------------------------------
%% #m_object_rw.ai_flee_dst
get_ai_flee_dst(Uid)-> get_ai_flee_dst_def(Uid,undefined).

get_ai_flee_dst_def(Uid,Def)->
	case erlang:get({Uid,m_object_rw}) of
	undefined -> Def; 
	V -> V#m_object_rw.ai_flee_dst 
	end.

set_ai_flee_dst(Uid,V)->
	R = erlang:get({Uid,m_object_rw}),
	erlang:put({Uid,m_object_rw}, R#m_object_rw{ai_flee_dst = V}),
	?TRY_CATCH(hook_map:on_rw_update(Uid,#m_object_rw.ai_flee_dst,V)).

set_ai_flee_dst_direct(Uid,V)->
	R = erlang:get({Uid,m_object_rw}),
	erlang:put({Uid,m_object_rw}, R#m_object_rw{ai_flee_dst = V}).

%%-------------------------------------------------------------------
%% #m_object_rw.ai_flee_dir
get_ai_flee_dir(Uid)-> get_ai_flee_dir_def(Uid,undefined).

get_ai_flee_dir_def(Uid,Def)->
	case erlang:get({Uid,m_object_rw}) of
	undefined -> Def; 
	V -> V#m_object_rw.ai_flee_dir 
	end.

set_ai_flee_dir(Uid,V)->
	R = erlang:get({Uid,m_object_rw}),
	erlang:put({Uid,m_object_rw}, R#m_object_rw{ai_flee_dir = V}),
	?TRY_CATCH(hook_map:on_rw_update(Uid,#m_object_rw.ai_flee_dir,V)).

set_ai_flee_dir_direct(Uid,V)->
	R = erlang:get({Uid,m_object_rw}),
	erlang:put({Uid,m_object_rw}, R#m_object_rw{ai_flee_dir = V}).

%%-------------------------------------------------------------------
%% #m_object_rw.ai_flee_tick
get_ai_flee_tick(Uid)-> get_ai_flee_tick_def(Uid,undefined).

get_ai_flee_tick_def(Uid,Def)->
	case erlang:get({Uid,m_object_rw}) of
	undefined -> Def; 
	V -> V#m_object_rw.ai_flee_tick 
	end.

set_ai_flee_tick(Uid,V)->
	R = erlang:get({Uid,m_object_rw}),
	erlang:put({Uid,m_object_rw}, R#m_object_rw{ai_flee_tick = V}),
	?TRY_CATCH(hook_map:on_rw_update(Uid,#m_object_rw.ai_flee_tick,V)).

set_ai_flee_tick_direct(Uid,V)->
	R = erlang:get({Uid,m_object_rw}),
	erlang:put({Uid,m_object_rw}, R#m_object_rw{ai_flee_tick = V}).

%%-------------------------------------------------------------------
%% #m_object_rw.ai_is_arrived_flee_pos
get_ai_is_arrived_flee_pos(Uid)-> get_ai_is_arrived_flee_pos_def(Uid,undefined).

get_ai_is_arrived_flee_pos_def(Uid,Def)->
	case erlang:get({Uid,m_object_rw}) of
	undefined -> Def; 
	V -> V#m_object_rw.ai_is_arrived_flee_pos 
	end.

set_ai_is_arrived_flee_pos(Uid,V)->
	R = erlang:get({Uid,m_object_rw}),
	erlang:put({Uid,m_object_rw}, R#m_object_rw{ai_is_arrived_flee_pos = V}),
	?TRY_CATCH(hook_map:on_rw_update(Uid,#m_object_rw.ai_is_arrived_flee_pos,V)).

set_ai_is_arrived_flee_pos_direct(Uid,V)->
	R = erlang:get({Uid,m_object_rw}),
	erlang:put({Uid,m_object_rw}, R#m_object_rw{ai_is_arrived_flee_pos = V}).

%%-------------------------------------------------------------------
%% #m_object_rw.ai_arrived_return_pos
get_ai_arrived_return_pos(Uid)-> get_ai_arrived_return_pos_def(Uid,undefined).

get_ai_arrived_return_pos_def(Uid,Def)->
	case erlang:get({Uid,m_object_rw}) of
	undefined -> Def; 
	V -> V#m_object_rw.ai_arrived_return_pos 
	end.

set_ai_arrived_return_pos(Uid,V)->
	R = erlang:get({Uid,m_object_rw}),
	erlang:put({Uid,m_object_rw}, R#m_object_rw{ai_arrived_return_pos = V}),
	?TRY_CATCH(hook_map:on_rw_update(Uid,#m_object_rw.ai_arrived_return_pos,V)).

set_ai_arrived_return_pos_direct(Uid,V)->
	R = erlang:get({Uid,m_object_rw}),
	erlang:put({Uid,m_object_rw}, R#m_object_rw{ai_arrived_return_pos = V}).

%%-------------------------------------------------------------------
%% #m_object_rw.enmity_list
get_enmity_list(Uid)-> get_enmity_list_def(Uid,undefined).

get_enmity_list_def(Uid,Def)->
	case erlang:get({Uid,m_object_rw}) of
	undefined -> Def; 
	V -> V#m_object_rw.enmity_list 
	end.

set_enmity_list(Uid,V)->
	R = erlang:get({Uid,m_object_rw}),
	erlang:put({Uid,m_object_rw}, R#m_object_rw{enmity_list = V}),
	?TRY_CATCH(hook_map:on_rw_update(Uid,#m_object_rw.enmity_list,V)).

set_enmity_list_direct(Uid,V)->
	R = erlang:get({Uid,m_object_rw}),
	erlang:put({Uid,m_object_rw}, R#m_object_rw{enmity_list = V}).

%%-------------------------------------------------------------------
%% #m_object_rw.max_enmity_uid
get_max_enmity_uid(Uid)-> get_max_enmity_uid_def(Uid,undefined).

get_max_enmity_uid_def(Uid,Def)->
	case erlang:get({Uid,m_object_rw}) of
	undefined -> Def; 
	V -> V#m_object_rw.max_enmity_uid 
	end.

set_max_enmity_uid(Uid,V)->
	R = erlang:get({Uid,m_object_rw}),
	erlang:put({Uid,m_object_rw}, R#m_object_rw{max_enmity_uid = V}),
	?TRY_CATCH(hook_map:on_rw_update(Uid,#m_object_rw.max_enmity_uid,V)).

set_max_enmity_uid_direct(Uid,V)->
	R = erlang:get({Uid,m_object_rw}),
	erlang:put({Uid,m_object_rw}, R#m_object_rw{max_enmity_uid = V}).

%%-------------------------------------------------------------------
%% #m_object_rw.ai_lock_target_tick
get_ai_lock_target_tick(Uid)-> get_ai_lock_target_tick_def(Uid,undefined).

get_ai_lock_target_tick_def(Uid,Def)->
	case erlang:get({Uid,m_object_rw}) of
	undefined -> Def; 
	V -> V#m_object_rw.ai_lock_target_tick 
	end.

set_ai_lock_target_tick(Uid,V)->
	R = erlang:get({Uid,m_object_rw}),
	erlang:put({Uid,m_object_rw}, R#m_object_rw{ai_lock_target_tick = V}),
	?TRY_CATCH(hook_map:on_rw_update(Uid,#m_object_rw.ai_lock_target_tick,V)).

set_ai_lock_target_tick_direct(Uid,V)->
	R = erlang:get({Uid,m_object_rw}),
	erlang:put({Uid,m_object_rw}, R#m_object_rw{ai_lock_target_tick = V}).

%%-------------------------------------------------------------------
%% #m_object_rw.no_inc_enmity_tick
get_no_inc_enmity_tick(Uid)-> get_no_inc_enmity_tick_def(Uid,undefined).

get_no_inc_enmity_tick_def(Uid,Def)->
	case erlang:get({Uid,m_object_rw}) of
	undefined -> Def; 
	V -> V#m_object_rw.no_inc_enmity_tick 
	end.

set_no_inc_enmity_tick(Uid,V)->
	R = erlang:get({Uid,m_object_rw}),
	erlang:put({Uid,m_object_rw}, R#m_object_rw{no_inc_enmity_tick = V}),
	?TRY_CATCH(hook_map:on_rw_update(Uid,#m_object_rw.no_inc_enmity_tick,V)).

set_no_inc_enmity_tick_direct(Uid,V)->
	R = erlang:get({Uid,m_object_rw}),
	erlang:put({Uid,m_object_rw}, R#m_object_rw{no_inc_enmity_tick = V}).

%%-------------------------------------------------------------------
del(Uid)-> erlang:erase({Uid,m_object_rw}).

%%-------------------------------------------------------------------
get(Uid)-> erlang:get({Uid,m_object_rw}).

%%-------------------------------------------------------------------
set(Uid,#m_object_rw{}=V)->
	erlang:put({Uid,m_object_rw}, V).

%%-------------------------------------------------------------------
init(Uid)-> erlang:put({Uid,m_object_rw}, #m_object_rw{}).
init(Uid,#m_object_rw{}=V) -> erlang:put({Uid,m_object_rw}, V).

%%-------------------------------------------------------------------
set_fields_direct(_Uid,[]) ->ok;
set_fields_direct(Uid,FieldList) ->
	R1 = erlang:get({Uid,m_object_rw}),
	R2 = i_set_fields(Uid,R1, FieldList, true),
	erlang:put({Uid,m_object_rw}, R2),
	ok.

%%-------------------------------------------------------------------
set_fields(_Uid,[]) ->ok;
set_fields(Uid,FieldList) ->
	R1 = erlang:get({Uid,m_object_rw}),
	R2 = i_set_fields(Uid,R1, FieldList, false),
	erlang:put({Uid,m_object_rw}, R2),
	ok.

%%-------------------------------------------------------------------
i_set_fields(_Uid,R, [], _) ->
	R;
i_set_fields(Uid,R, [H | FieldList], IsDirect) ->
	i_set_fields(Uid,i_set_field(Uid,H, R, IsDirect), FieldList, IsDirect).

%%#m_object_rw.uid
i_set_field(Uid,{#m_object_rw.uid, Val}, R, IsDirect) ->
	R1 = R#m_object_rw{uid = Val},
	case IsDirect of 
		true -> ?TRY_CATCH(hook_map:on_rw_update(Uid,#m_object_rw.uid,Val));
		 _ -> skip 
	end,
	R1;
%%#m_object_rw.pid
i_set_field(Uid,{#m_object_rw.pid, Val}, R, IsDirect) ->
	R1 = R#m_object_rw{pid = Val},
	case IsDirect of 
		true -> ?TRY_CATCH(hook_map:on_rw_update(Uid,#m_object_rw.pid,Val));
		 _ -> skip 
	end,
	R1;
%%#m_object_rw.data_id
i_set_field(Uid,{#m_object_rw.data_id, Val}, R, IsDirect) ->
	R1 = R#m_object_rw{data_id = Val},
	case IsDirect of 
		true -> ?TRY_CATCH(hook_map:on_rw_update(Uid,#m_object_rw.data_id,Val));
		 _ -> skip 
	end,
	R1;
%%#m_object_rw.group
i_set_field(Uid,{#m_object_rw.group, Val}, R, IsDirect) ->
	R1 = R#m_object_rw{group = Val},
	case IsDirect of 
		true -> ?TRY_CATCH(hook_map:on_rw_update(Uid,#m_object_rw.group,Val));
		 _ -> skip 
	end,
	R1;
%%#m_object_rw.owner
i_set_field(Uid,{#m_object_rw.owner, Val}, R, IsDirect) ->
	R1 = R#m_object_rw{owner = Val},
	case IsDirect of 
		true -> ?TRY_CATCH(hook_map:on_rw_update(Uid,#m_object_rw.owner,Val));
		 _ -> skip 
	end,
	R1;
%%#m_object_rw.type
i_set_field(Uid,{#m_object_rw.type, Val}, R, IsDirect) ->
	R1 = R#m_object_rw{type = Val},
	case IsDirect of 
		true -> ?TRY_CATCH(hook_map:on_rw_update(Uid,#m_object_rw.type,Val));
		 _ -> skip 
	end,
	R1;
%%#m_object_rw.level
i_set_field(Uid,{#m_object_rw.level, Val}, R, IsDirect) ->
	R1 = R#m_object_rw{level = Val},
	case IsDirect of 
		true -> ?TRY_CATCH(hook_map:on_rw_update(Uid,#m_object_rw.level,Val));
		 _ -> skip 
	end,
	R1;
%%#m_object_rw.name
i_set_field(Uid,{#m_object_rw.name, Val}, R, IsDirect) ->
	R1 = R#m_object_rw{name = Val},
	case IsDirect of 
		true -> ?TRY_CATCH(hook_map:on_rw_update(Uid,#m_object_rw.name,Val));
		 _ -> skip 
	end,
	R1;
%%#m_object_rw.sex
i_set_field(Uid,{#m_object_rw.sex, Val}, R, IsDirect) ->
	R1 = R#m_object_rw{sex = Val},
	case IsDirect of 
		true -> ?TRY_CATCH(hook_map:on_rw_update(Uid,#m_object_rw.sex,Val));
		 _ -> skip 
	end,
	R1;
%%#m_object_rw.career
i_set_field(Uid,{#m_object_rw.career, Val}, R, IsDirect) ->
	R1 = R#m_object_rw{career = Val},
	case IsDirect of 
		true -> ?TRY_CATCH(hook_map:on_rw_update(Uid,#m_object_rw.career,Val));
		 _ -> skip 
	end,
	R1;
%%#m_object_rw.race
i_set_field(Uid,{#m_object_rw.race, Val}, R, IsDirect) ->
	R1 = R#m_object_rw{race = Val},
	case IsDirect of 
		true -> ?TRY_CATCH(hook_map:on_rw_update(Uid,#m_object_rw.race,Val));
		 _ -> skip 
	end,
	R1;
%%#m_object_rw.camp
i_set_field(Uid,{#m_object_rw.camp, Val}, R, IsDirect) ->
	R1 = R#m_object_rw{camp = Val},
	case IsDirect of 
		true -> ?TRY_CATCH(hook_map:on_rw_update(Uid,#m_object_rw.camp,Val));
		 _ -> skip 
	end,
	R1;
%%#m_object_rw.state
i_set_field(Uid,{#m_object_rw.state, Val}, R, IsDirect) ->
	R1 = R#m_object_rw{state = Val},
	case IsDirect of 
		true -> ?TRY_CATCH(hook_map:on_rw_update(Uid,#m_object_rw.state,Val));
		 _ -> skip 
	end,
	R1;
%%#m_object_rw.move_speed
i_set_field(Uid,{#m_object_rw.move_speed, Val}, R, IsDirect) ->
	R1 = R#m_object_rw{move_speed = Val},
	case IsDirect of 
		true -> ?TRY_CATCH(hook_map:on_rw_update(Uid,#m_object_rw.move_speed,Val));
		 _ -> skip 
	end,
	R1;
%%#m_object_rw.cur_move
i_set_field(Uid,{#m_object_rw.cur_move, Val}, R, IsDirect) ->
	R1 = R#m_object_rw{cur_move = Val},
	case IsDirect of 
		true -> ?TRY_CATCH(hook_map:on_rw_update(Uid,#m_object_rw.cur_move,Val));
		 _ -> skip 
	end,
	R1;
%%#m_object_rw.next_move
i_set_field(Uid,{#m_object_rw.next_move, Val}, R, IsDirect) ->
	R1 = R#m_object_rw{next_move = Val},
	case IsDirect of 
		true -> ?TRY_CATCH(hook_map:on_rw_update(Uid,#m_object_rw.next_move,Val));
		 _ -> skip 
	end,
	R1;
%%#m_object_rw.vis_tile_idx
i_set_field(Uid,{#m_object_rw.vis_tile_idx, Val}, R, IsDirect) ->
	R1 = R#m_object_rw{vis_tile_idx = Val},
	case IsDirect of 
		true -> ?TRY_CATCH(hook_map:on_rw_update(Uid,#m_object_rw.vis_tile_idx,Val));
		 _ -> skip 
	end,
	R1;
%%#m_object_rw.cur_pos
i_set_field(Uid,{#m_object_rw.cur_pos, Val}, R, IsDirect) ->
	R1 = R#m_object_rw{cur_pos = Val},
	case IsDirect of 
		true -> ?TRY_CATCH(hook_map:on_rw_update(Uid,#m_object_rw.cur_pos,Val));
		 _ -> skip 
	end,
	R1;
%%#m_object_rw.start_pos
i_set_field(Uid,{#m_object_rw.start_pos, Val}, R, IsDirect) ->
	R1 = R#m_object_rw{start_pos = Val},
	case IsDirect of 
		true -> ?TRY_CATCH(hook_map:on_rw_update(Uid,#m_object_rw.start_pos,Val));
		 _ -> skip 
	end,
	R1;
%%#m_object_rw.dest_pos
i_set_field(Uid,{#m_object_rw.dest_pos, Val}, R, IsDirect) ->
	R1 = R#m_object_rw{dest_pos = Val},
	case IsDirect of 
		true -> ?TRY_CATCH(hook_map:on_rw_update(Uid,#m_object_rw.dest_pos,Val));
		 _ -> skip 
	end,
	R1;
%%#m_object_rw.face
i_set_field(Uid,{#m_object_rw.face, Val}, R, IsDirect) ->
	R1 = R#m_object_rw{face = Val},
	case IsDirect of 
		true -> ?TRY_CATCH(hook_map:on_rw_update(Uid,#m_object_rw.face,Val));
		 _ -> skip 
	end,
	R1;
%%#m_object_rw.dir
i_set_field(Uid,{#m_object_rw.dir, Val}, R, IsDirect) ->
	R1 = R#m_object_rw{dir = Val},
	case IsDirect of 
		true -> ?TRY_CATCH(hook_map:on_rw_update(Uid,#m_object_rw.dir,Val));
		 _ -> skip 
	end,
	R1;
%%#m_object_rw.move_start_time
i_set_field(Uid,{#m_object_rw.move_start_time, Val}, R, IsDirect) ->
	R1 = R#m_object_rw{move_start_time = Val},
	case IsDirect of 
		true -> ?TRY_CATCH(hook_map:on_rw_update(Uid,#m_object_rw.move_start_time,Val));
		 _ -> skip 
	end,
	R1;
%%#m_object_rw.seg_move_time
i_set_field(Uid,{#m_object_rw.seg_move_time, Val}, R, IsDirect) ->
	R1 = R#m_object_rw{seg_move_time = Val},
	case IsDirect of 
		true -> ?TRY_CATCH(hook_map:on_rw_update(Uid,#m_object_rw.seg_move_time,Val));
		 _ -> skip 
	end,
	R1;
%%#m_object_rw.force_stopped
i_set_field(Uid,{#m_object_rw.force_stopped, Val}, R, IsDirect) ->
	R1 = R#m_object_rw{force_stopped = Val},
	case IsDirect of 
		true -> ?TRY_CATCH(hook_map:on_rw_update(Uid,#m_object_rw.force_stopped,Val));
		 _ -> skip 
	end,
	R1;
%%#m_object_rw.move_path_list
i_set_field(Uid,{#m_object_rw.move_path_list, Val}, R, IsDirect) ->
	R1 = R#m_object_rw{move_path_list = Val},
	case IsDirect of 
		true -> ?TRY_CATCH(hook_map:on_rw_update(Uid,#m_object_rw.move_path_list,Val));
		 _ -> skip 
	end,
	R1;
%%#m_object_rw.born_pos
i_set_field(Uid,{#m_object_rw.born_pos, Val}, R, IsDirect) ->
	R1 = R#m_object_rw{born_pos = Val},
	case IsDirect of 
		true -> ?TRY_CATCH(hook_map:on_rw_update(Uid,#m_object_rw.born_pos,Val));
		 _ -> skip 
	end,
	R1;
%%#m_object_rw.battle_in_time
i_set_field(Uid,{#m_object_rw.battle_in_time, Val}, R, IsDirect) ->
	R1 = R#m_object_rw{battle_in_time = Val},
	case IsDirect of 
		true -> ?TRY_CATCH(hook_map:on_rw_update(Uid,#m_object_rw.battle_in_time,Val));
		 _ -> skip 
	end,
	R1;
%%#m_object_rw.hp
i_set_field(Uid,{#m_object_rw.hp, Val}, R, IsDirect) ->
	R1 = R#m_object_rw{hp = Val},
	case IsDirect of 
		true -> ?TRY_CATCH(hook_map:on_rw_update(Uid,#m_object_rw.hp,Val));
		 _ -> skip 
	end,
	R1;
%%#m_object_rw.max_hp
i_set_field(Uid,{#m_object_rw.max_hp, Val}, R, IsDirect) ->
	R1 = R#m_object_rw{max_hp = Val},
	case IsDirect of 
		true -> ?TRY_CATCH(hook_map:on_rw_update(Uid,#m_object_rw.max_hp,Val));
		 _ -> skip 
	end,
	R1;
%%#m_object_rw.battle_props
i_set_field(Uid,{#m_object_rw.battle_props, Val}, R, IsDirect) ->
	R1 = R#m_object_rw{battle_props = Val},
	case IsDirect of 
		true -> ?TRY_CATCH(hook_map:on_rw_update(Uid,#m_object_rw.battle_props,Val));
		 _ -> skip 
	end,
	R1;
%%#m_object_rw.buff_list
i_set_field(Uid,{#m_object_rw.buff_list, Val}, R, IsDirect) ->
	R1 = R#m_object_rw{buff_list = Val},
	case IsDirect of 
		true -> ?TRY_CATCH(hook_map:on_rw_update(Uid,#m_object_rw.buff_list,Val));
		 _ -> skip 
	end,
	R1;
%%#m_object_rw.ai_state
i_set_field(Uid,{#m_object_rw.ai_state, Val}, R, IsDirect) ->
	R1 = R#m_object_rw{ai_state = Val},
	case IsDirect of 
		true -> ?TRY_CATCH(hook_map:on_rw_update(Uid,#m_object_rw.ai_state,Val));
		 _ -> skip 
	end,
	R1;
%%#m_object_rw.pre_ai_state
i_set_field(Uid,{#m_object_rw.pre_ai_state, Val}, R, IsDirect) ->
	R1 = R#m_object_rw{pre_ai_state = Val},
	case IsDirect of 
		true -> ?TRY_CATCH(hook_map:on_rw_update(Uid,#m_object_rw.pre_ai_state,Val));
		 _ -> skip 
	end,
	R1;
%%#m_object_rw.ai_transition
i_set_field(Uid,{#m_object_rw.ai_transition, Val}, R, IsDirect) ->
	R1 = R#m_object_rw{ai_transition = Val},
	case IsDirect of 
		true -> ?TRY_CATCH(hook_map:on_rw_update(Uid,#m_object_rw.ai_transition,Val));
		 _ -> skip 
	end,
	R1;
%%#m_object_rw.ai_triggers
i_set_field(Uid,{#m_object_rw.ai_triggers, Val}, R, IsDirect) ->
	R1 = R#m_object_rw{ai_triggers = Val},
	case IsDirect of 
		true -> ?TRY_CATCH(hook_map:on_rw_update(Uid,#m_object_rw.ai_triggers,Val));
		 _ -> skip 
	end,
	R1;
%%#m_object_rw.ai_pause
i_set_field(Uid,{#m_object_rw.ai_pause, Val}, R, IsDirect) ->
	R1 = R#m_object_rw{ai_pause = Val},
	case IsDirect of 
		true -> ?TRY_CATCH(hook_map:on_rw_update(Uid,#m_object_rw.ai_pause,Val));
		 _ -> skip 
	end,
	R1;
%%#m_object_rw.ai_id
i_set_field(Uid,{#m_object_rw.ai_id, Val}, R, IsDirect) ->
	R1 = R#m_object_rw{ai_id = Val},
	case IsDirect of 
		true -> ?TRY_CATCH(hook_map:on_rw_update(Uid,#m_object_rw.ai_id,Val));
		 _ -> skip 
	end,
	R1;
%%#m_object_rw.ai_wp_list
i_set_field(Uid,{#m_object_rw.ai_wp_list, Val}, R, IsDirect) ->
	R1 = R#m_object_rw{ai_wp_list = Val},
	case IsDirect of 
		true -> ?TRY_CATCH(hook_map:on_rw_update(Uid,#m_object_rw.ai_wp_list,Val));
		 _ -> skip 
	end,
	R1;
%%#m_object_rw.ai_wp_num
i_set_field(Uid,{#m_object_rw.ai_wp_num, Val}, R, IsDirect) ->
	R1 = R#m_object_rw{ai_wp_num = Val},
	case IsDirect of 
		true -> ?TRY_CATCH(hook_map:on_rw_update(Uid,#m_object_rw.ai_wp_num,Val));
		 _ -> skip 
	end,
	R1;
%%#m_object_rw.ai_wp_idx
i_set_field(Uid,{#m_object_rw.ai_wp_idx, Val}, R, IsDirect) ->
	R1 = R#m_object_rw{ai_wp_idx = Val},
	case IsDirect of 
		true -> ?TRY_CATCH(hook_map:on_rw_update(Uid,#m_object_rw.ai_wp_idx,Val));
		 _ -> skip 
	end,
	R1;
%%#m_object_rw.ai_is_reverse_patrol
i_set_field(Uid,{#m_object_rw.ai_is_reverse_patrol, Val}, R, IsDirect) ->
	R1 = R#m_object_rw{ai_is_reverse_patrol = Val},
	case IsDirect of 
		true -> ?TRY_CATCH(hook_map:on_rw_update(Uid,#m_object_rw.ai_is_reverse_patrol,Val));
		 _ -> skip 
	end,
	R1;
%%#m_object_rw.ai_is_patrol
i_set_field(Uid,{#m_object_rw.ai_is_patrol, Val}, R, IsDirect) ->
	R1 = R#m_object_rw{ai_is_patrol = Val},
	case IsDirect of 
		true -> ?TRY_CATCH(hook_map:on_rw_update(Uid,#m_object_rw.ai_is_patrol,Val));
		 _ -> skip 
	end,
	R1;
%%#m_object_rw.ai_patrol_rest_tick
i_set_field(Uid,{#m_object_rw.ai_patrol_rest_tick, Val}, R, IsDirect) ->
	R1 = R#m_object_rw{ai_patrol_rest_tick = Val},
	case IsDirect of 
		true -> ?TRY_CATCH(hook_map:on_rw_update(Uid,#m_object_rw.ai_patrol_rest_tick,Val));
		 _ -> skip 
	end,
	R1;
%%#m_object_rw.ai_look_for_target_tick
i_set_field(Uid,{#m_object_rw.ai_look_for_target_tick, Val}, R, IsDirect) ->
	R1 = R#m_object_rw{ai_look_for_target_tick = Val},
	case IsDirect of 
		true -> ?TRY_CATCH(hook_map:on_rw_update(Uid,#m_object_rw.ai_look_for_target_tick,Val));
		 _ -> skip 
	end,
	R1;
%%#m_object_rw.ai_pursue_tar_pos
i_set_field(Uid,{#m_object_rw.ai_pursue_tar_pos, Val}, R, IsDirect) ->
	R1 = R#m_object_rw{ai_pursue_tar_pos = Val},
	case IsDirect of 
		true -> ?TRY_CATCH(hook_map:on_rw_update(Uid,#m_object_rw.ai_pursue_tar_pos,Val));
		 _ -> skip 
	end,
	R1;
%%#m_object_rw.ai_pursue_failed
i_set_field(Uid,{#m_object_rw.ai_pursue_failed, Val}, R, IsDirect) ->
	R1 = R#m_object_rw{ai_pursue_failed = Val},
	case IsDirect of 
		true -> ?TRY_CATCH(hook_map:on_rw_update(Uid,#m_object_rw.ai_pursue_failed,Val));
		 _ -> skip 
	end,
	R1;
%%#m_object_rw.ai_cant_pursue
i_set_field(Uid,{#m_object_rw.ai_cant_pursue, Val}, R, IsDirect) ->
	R1 = R#m_object_rw{ai_cant_pursue = Val},
	case IsDirect of 
		true -> ?TRY_CATCH(hook_map:on_rw_update(Uid,#m_object_rw.ai_cant_pursue,Val));
		 _ -> skip 
	end,
	R1;
%%#m_object_rw.ai_check_pursue_tick
i_set_field(Uid,{#m_object_rw.ai_check_pursue_tick, Val}, R, IsDirect) ->
	R1 = R#m_object_rw{ai_check_pursue_tick = Val},
	case IsDirect of 
		true -> ?TRY_CATCH(hook_map:on_rw_update(Uid,#m_object_rw.ai_check_pursue_tick,Val));
		 _ -> skip 
	end,
	R1;
%%#m_object_rw.ai_target_uid
i_set_field(Uid,{#m_object_rw.ai_target_uid, Val}, R, IsDirect) ->
	R1 = R#m_object_rw{ai_target_uid = Val},
	case IsDirect of 
		true -> ?TRY_CATCH(hook_map:on_rw_update(Uid,#m_object_rw.ai_target_uid,Val));
		 _ -> skip 
	end,
	R1;
%%#m_object_rw.ai_enter_combat_time
i_set_field(Uid,{#m_object_rw.ai_enter_combat_time, Val}, R, IsDirect) ->
	R1 = R#m_object_rw{ai_enter_combat_time = Val},
	case IsDirect of 
		true -> ?TRY_CATCH(hook_map:on_rw_update(Uid,#m_object_rw.ai_enter_combat_time,Val));
		 _ -> skip 
	end,
	R1;
%%#m_object_rw.ai_enter_combat_pos
i_set_field(Uid,{#m_object_rw.ai_enter_combat_pos, Val}, R, IsDirect) ->
	R1 = R#m_object_rw{ai_enter_combat_pos = Val},
	case IsDirect of 
		true -> ?TRY_CATCH(hook_map:on_rw_update(Uid,#m_object_rw.ai_enter_combat_pos,Val));
		 _ -> skip 
	end,
	R1;
%%#m_object_rw.ai_use_skill_id
i_set_field(Uid,{#m_object_rw.ai_use_skill_id, Val}, R, IsDirect) ->
	R1 = R#m_object_rw{ai_use_skill_id = Val},
	case IsDirect of 
		true -> ?TRY_CATCH(hook_map:on_rw_update(Uid,#m_object_rw.ai_use_skill_id,Val));
		 _ -> skip 
	end,
	R1;
%%#m_object_rw.ai_attack_wait_tick
i_set_field(Uid,{#m_object_rw.ai_attack_wait_tick, Val}, R, IsDirect) ->
	R1 = R#m_object_rw{ai_attack_wait_tick = Val},
	case IsDirect of 
		true -> ?TRY_CATCH(hook_map:on_rw_update(Uid,#m_object_rw.ai_attack_wait_tick,Val));
		 _ -> skip 
	end,
	R1;
%%#m_object_rw.ai_skill_serial
i_set_field(Uid,{#m_object_rw.ai_skill_serial, Val}, R, IsDirect) ->
	R1 = R#m_object_rw{ai_skill_serial = Val},
	case IsDirect of 
		true -> ?TRY_CATCH(hook_map:on_rw_update(Uid,#m_object_rw.ai_skill_serial,Val));
		 _ -> skip 
	end,
	R1;
%%#m_object_rw.ai_flee_dst
i_set_field(Uid,{#m_object_rw.ai_flee_dst, Val}, R, IsDirect) ->
	R1 = R#m_object_rw{ai_flee_dst = Val},
	case IsDirect of 
		true -> ?TRY_CATCH(hook_map:on_rw_update(Uid,#m_object_rw.ai_flee_dst,Val));
		 _ -> skip 
	end,
	R1;
%%#m_object_rw.ai_flee_dir
i_set_field(Uid,{#m_object_rw.ai_flee_dir, Val}, R, IsDirect) ->
	R1 = R#m_object_rw{ai_flee_dir = Val},
	case IsDirect of 
		true -> ?TRY_CATCH(hook_map:on_rw_update(Uid,#m_object_rw.ai_flee_dir,Val));
		 _ -> skip 
	end,
	R1;
%%#m_object_rw.ai_flee_tick
i_set_field(Uid,{#m_object_rw.ai_flee_tick, Val}, R, IsDirect) ->
	R1 = R#m_object_rw{ai_flee_tick = Val},
	case IsDirect of 
		true -> ?TRY_CATCH(hook_map:on_rw_update(Uid,#m_object_rw.ai_flee_tick,Val));
		 _ -> skip 
	end,
	R1;
%%#m_object_rw.ai_is_arrived_flee_pos
i_set_field(Uid,{#m_object_rw.ai_is_arrived_flee_pos, Val}, R, IsDirect) ->
	R1 = R#m_object_rw{ai_is_arrived_flee_pos = Val},
	case IsDirect of 
		true -> ?TRY_CATCH(hook_map:on_rw_update(Uid,#m_object_rw.ai_is_arrived_flee_pos,Val));
		 _ -> skip 
	end,
	R1;
%%#m_object_rw.ai_arrived_return_pos
i_set_field(Uid,{#m_object_rw.ai_arrived_return_pos, Val}, R, IsDirect) ->
	R1 = R#m_object_rw{ai_arrived_return_pos = Val},
	case IsDirect of 
		true -> ?TRY_CATCH(hook_map:on_rw_update(Uid,#m_object_rw.ai_arrived_return_pos,Val));
		 _ -> skip 
	end,
	R1;
%%#m_object_rw.enmity_list
i_set_field(Uid,{#m_object_rw.enmity_list, Val}, R, IsDirect) ->
	R1 = R#m_object_rw{enmity_list = Val},
	case IsDirect of 
		true -> ?TRY_CATCH(hook_map:on_rw_update(Uid,#m_object_rw.enmity_list,Val));
		 _ -> skip 
	end,
	R1;
%%#m_object_rw.max_enmity_uid
i_set_field(Uid,{#m_object_rw.max_enmity_uid, Val}, R, IsDirect) ->
	R1 = R#m_object_rw{max_enmity_uid = Val},
	case IsDirect of 
		true -> ?TRY_CATCH(hook_map:on_rw_update(Uid,#m_object_rw.max_enmity_uid,Val));
		 _ -> skip 
	end,
	R1;
%%#m_object_rw.ai_lock_target_tick
i_set_field(Uid,{#m_object_rw.ai_lock_target_tick, Val}, R, IsDirect) ->
	R1 = R#m_object_rw{ai_lock_target_tick = Val},
	case IsDirect of 
		true -> ?TRY_CATCH(hook_map:on_rw_update(Uid,#m_object_rw.ai_lock_target_tick,Val));
		 _ -> skip 
	end,
	R1;
%%#m_object_rw.no_inc_enmity_tick
i_set_field(Uid,{#m_object_rw.no_inc_enmity_tick, Val}, R, IsDirect) ->
	R1 = R#m_object_rw{no_inc_enmity_tick = Val},
	case IsDirect of 
		true -> ?TRY_CATCH(hook_map:on_rw_update(Uid,#m_object_rw.no_inc_enmity_tick,Val));
		 _ -> skip 
	end,
	R1;
i_set_field(_Uid,_Elem,R, _)-> R.

%%-------------------------------------------------------------------
