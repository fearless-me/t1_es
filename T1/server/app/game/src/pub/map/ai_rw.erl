%%-------------------------------------------------------------------
%%% This File Is AUTO GENERATED, Don't Modify it MANUALLY!!!
%%% This File Is AUTO GENERATED, Don't Modify it MANUALLY!!!
%%% This File Is AUTO GENERATED, Don't Modify it MANUALLY!!!
%%-------------------------------------------------------------------
-module(ai_rw).

%%-------------------------------------------------------------------
-include("logger.hrl").
-include("gs_ai_inc.hrl").
-include("rec_rw.hrl").
%%-------------------------------------------------------------------

-export([
	get_ai_state/1, get_ai_state_def/2, set_ai_state/2, % #m_map_unit_ai_rw.ai_state
	get_pre_ai_state/1, get_pre_ai_state_def/2, set_pre_ai_state/2, % #m_map_unit_ai_rw.pre_ai_state
	get_ai_transition/1, get_ai_transition_def/2, set_ai_transition/2, % #m_map_unit_ai_rw.ai_transition
	get_triggers/1, get_triggers_def/2, set_triggers/2, % #m_map_unit_ai_rw.triggers
	get_pause/1, get_pause_def/2, set_pause/2, % #m_map_unit_ai_rw.pause
	get_ai_id/1, get_ai_id_def/2, set_ai_id/2, % #m_map_unit_ai_rw.ai_id
	get_wp_list/1, get_wp_list_def/2, set_wp_list/2, % #m_map_unit_ai_rw.wp_list
	get_wp_num/1, get_wp_num_def/2, set_wp_num/2, % #m_map_unit_ai_rw.wp_num
	get_wp_idx/1, get_wp_idx_def/2, set_wp_idx/2, % #m_map_unit_ai_rw.wp_idx
	get_is_reverse_patrol/1, get_is_reverse_patrol_def/2, set_is_reverse_patrol/2, % #m_map_unit_ai_rw.is_reverse_patrol
	get_is_patrol/1, get_is_patrol_def/2, set_is_patrol/2, % #m_map_unit_ai_rw.is_patrol
	get_patrol_rest_tick/1, get_patrol_rest_tick_def/2, set_patrol_rest_tick/2, % #m_map_unit_ai_rw.patrol_rest_tick
	get_look_for_target_tick/1, get_look_for_target_tick_def/2, set_look_for_target_tick/2, % #m_map_unit_ai_rw.look_for_target_tick
	get_pursue_tar_pos/1, get_pursue_tar_pos_def/2, set_pursue_tar_pos/2, % #m_map_unit_ai_rw.pursue_tar_pos
	get_pursue_failed/1, get_pursue_failed_def/2, set_pursue_failed/2, % #m_map_unit_ai_rw.pursue_failed
	get_cant_pursue/1, get_cant_pursue_def/2, set_cant_pursue/2, % #m_map_unit_ai_rw.cant_pursue
	get_check_pursue_tick/1, get_check_pursue_tick_def/2, set_check_pursue_tick/2, % #m_map_unit_ai_rw.check_pursue_tick
	get_target_uid/1, get_target_uid_def/2, set_target_uid/2, % #m_map_unit_ai_rw.target_uid
	get_enter_combat_time/1, get_enter_combat_time_def/2, set_enter_combat_time/2, % #m_map_unit_ai_rw.enter_combat_time
	get_enter_combat_pos/1, get_enter_combat_pos_def/2, set_enter_combat_pos/2, % #m_map_unit_ai_rw.enter_combat_pos
	get_use_skill_id/1, get_use_skill_id_def/2, set_use_skill_id/2, % #m_map_unit_ai_rw.use_skill_id
	get_attack_wait_tick/1, get_attack_wait_tick_def/2, set_attack_wait_tick/2, % #m_map_unit_ai_rw.attack_wait_tick
	get_skill_serial/1, get_skill_serial_def/2, set_skill_serial/2, % #m_map_unit_ai_rw.skill_serial
	get_flee_dst/1, get_flee_dst_def/2, set_flee_dst/2, % #m_map_unit_ai_rw.flee_dst
	get_flee_dir/1, get_flee_dir_def/2, set_flee_dir/2, % #m_map_unit_ai_rw.flee_dir
	get_flee_tick/1, get_flee_tick_def/2, set_flee_tick/2, % #m_map_unit_ai_rw.flee_tick
	get_is_arrived_flee_pos/1, get_is_arrived_flee_pos_def/2, set_is_arrived_flee_pos/2, % #m_map_unit_ai_rw.is_arrived_flee_pos
	get_enmity_list/1, get_enmity_list_def/2, set_enmity_list/2, % #m_map_unit_ai_rw.enmity_list
	get_max_enmity_uid/1, get_max_enmity_uid_def/2, set_max_enmity_uid/2, % #m_map_unit_ai_rw.max_enmity_uid
	get_lock_target_tick/1, get_lock_target_tick_def/2, set_lock_target_tick/2, % #m_map_unit_ai_rw.lock_target_tick
	get_no_inc_enmity_tick/1, get_no_inc_enmity_tick_def/2, set_no_inc_enmity_tick/2, % #m_map_unit_ai_rw.no_inc_enmity_tick
	% common function 
	del/1 ,to_record/1 ,init_from/2 ,init_default/1
]).
%%-------------------------------------------------------------------
%%-------------------------------------------------------------------
%%-------------------------------------------------------------------
%% #m_map_unit_ai_rw.ai_state
get_ai_state(Uid)-> get({ai_state,Uid}).

get_ai_state_def(Uid, Def)->
	case get({ai_state,Uid}) of
		undefined -> Def;
		V -> V
	end.

set_ai_state(Uid, V)-> put({ai_state,Uid}, V).

%%-------------------------------------------------------------------
%% #m_map_unit_ai_rw.pre_ai_state
get_pre_ai_state(Uid)-> get({pre_ai_state,Uid}).

get_pre_ai_state_def(Uid, Def)->
	case get({pre_ai_state,Uid}) of
		undefined -> Def;
		V -> V
	end.

set_pre_ai_state(Uid, V)-> put({pre_ai_state,Uid}, V).

%%-------------------------------------------------------------------
%% #m_map_unit_ai_rw.ai_transition
get_ai_transition(Uid)-> get({ai_transition,Uid}).

get_ai_transition_def(Uid, Def)->
	case get({ai_transition,Uid}) of
		undefined -> Def;
		V -> V
	end.

set_ai_transition(Uid, V)-> put({ai_transition,Uid}, V).

%%-------------------------------------------------------------------
%% #m_map_unit_ai_rw.triggers
get_triggers(Uid)-> get({triggers,Uid}).

get_triggers_def(Uid, Def)->
	case get({triggers,Uid}) of
		undefined -> Def;
		V -> V
	end.

set_triggers(Uid, V)-> put({triggers,Uid}, V).

%%-------------------------------------------------------------------
%% #m_map_unit_ai_rw.pause
get_pause(Uid)-> get({pause,Uid}).

get_pause_def(Uid, Def)->
	case get({pause,Uid}) of
		undefined -> Def;
		V -> V
	end.

set_pause(Uid, V)-> put({pause,Uid}, V).

%%-------------------------------------------------------------------
%% #m_map_unit_ai_rw.ai_id
get_ai_id(Uid)-> get({ai_id,Uid}).

get_ai_id_def(Uid, Def)->
	case get({ai_id,Uid}) of
		undefined -> Def;
		V -> V
	end.

set_ai_id(Uid, V)-> put({ai_id,Uid}, V).

%%-------------------------------------------------------------------
%% #m_map_unit_ai_rw.wp_list
get_wp_list(Uid)-> get({wp_list,Uid}).

get_wp_list_def(Uid, Def)->
	case get({wp_list,Uid}) of
		undefined -> Def;
		V -> V
	end.

set_wp_list(Uid, V)-> put({wp_list,Uid}, V).

%%-------------------------------------------------------------------
%% #m_map_unit_ai_rw.wp_num
get_wp_num(Uid)-> get({wp_num,Uid}).

get_wp_num_def(Uid, Def)->
	case get({wp_num,Uid}) of
		undefined -> Def;
		V -> V
	end.

set_wp_num(Uid, V)-> put({wp_num,Uid}, V).

%%-------------------------------------------------------------------
%% #m_map_unit_ai_rw.wp_idx
get_wp_idx(Uid)-> get({wp_idx,Uid}).

get_wp_idx_def(Uid, Def)->
	case get({wp_idx,Uid}) of
		undefined -> Def;
		V -> V
	end.

set_wp_idx(Uid, V)-> put({wp_idx,Uid}, V).

%%-------------------------------------------------------------------
%% #m_map_unit_ai_rw.is_reverse_patrol
get_is_reverse_patrol(Uid)-> get({is_reverse_patrol,Uid}).

get_is_reverse_patrol_def(Uid, Def)->
	case get({is_reverse_patrol,Uid}) of
		undefined -> Def;
		V -> V
	end.

set_is_reverse_patrol(Uid, V)-> put({is_reverse_patrol,Uid}, V).

%%-------------------------------------------------------------------
%% #m_map_unit_ai_rw.is_patrol
get_is_patrol(Uid)-> get({is_patrol,Uid}).

get_is_patrol_def(Uid, Def)->
	case get({is_patrol,Uid}) of
		undefined -> Def;
		V -> V
	end.

set_is_patrol(Uid, V)-> put({is_patrol,Uid}, V).

%%-------------------------------------------------------------------
%% #m_map_unit_ai_rw.patrol_rest_tick
get_patrol_rest_tick(Uid)-> get({patrol_rest_tick,Uid}).

get_patrol_rest_tick_def(Uid, Def)->
	case get({patrol_rest_tick,Uid}) of
		undefined -> Def;
		V -> V
	end.

set_patrol_rest_tick(Uid, V)-> put({patrol_rest_tick,Uid}, V).

%%-------------------------------------------------------------------
%% #m_map_unit_ai_rw.look_for_target_tick
get_look_for_target_tick(Uid)-> get({look_for_target_tick,Uid}).

get_look_for_target_tick_def(Uid, Def)->
	case get({look_for_target_tick,Uid}) of
		undefined -> Def;
		V -> V
	end.

set_look_for_target_tick(Uid, V)-> put({look_for_target_tick,Uid}, V).

%%-------------------------------------------------------------------
%% #m_map_unit_ai_rw.pursue_tar_pos
get_pursue_tar_pos(Uid)-> get({pursue_tar_pos,Uid}).

get_pursue_tar_pos_def(Uid, Def)->
	case get({pursue_tar_pos,Uid}) of
		undefined -> Def;
		V -> V
	end.

set_pursue_tar_pos(Uid, V)-> put({pursue_tar_pos,Uid}, V).

%%-------------------------------------------------------------------
%% #m_map_unit_ai_rw.pursue_failed
get_pursue_failed(Uid)-> get({pursue_failed,Uid}).

get_pursue_failed_def(Uid, Def)->
	case get({pursue_failed,Uid}) of
		undefined -> Def;
		V -> V
	end.

set_pursue_failed(Uid, V)-> put({pursue_failed,Uid}, V).

%%-------------------------------------------------------------------
%% #m_map_unit_ai_rw.cant_pursue
get_cant_pursue(Uid)-> get({cant_pursue,Uid}).

get_cant_pursue_def(Uid, Def)->
	case get({cant_pursue,Uid}) of
		undefined -> Def;
		V -> V
	end.

set_cant_pursue(Uid, V)-> put({cant_pursue,Uid}, V).

%%-------------------------------------------------------------------
%% #m_map_unit_ai_rw.check_pursue_tick
get_check_pursue_tick(Uid)-> get({check_pursue_tick,Uid}).

get_check_pursue_tick_def(Uid, Def)->
	case get({check_pursue_tick,Uid}) of
		undefined -> Def;
		V -> V
	end.

set_check_pursue_tick(Uid, V)-> put({check_pursue_tick,Uid}, V).

%%-------------------------------------------------------------------
%% #m_map_unit_ai_rw.target_uid
get_target_uid(Uid)-> get({target_uid,Uid}).

get_target_uid_def(Uid, Def)->
	case get({target_uid,Uid}) of
		undefined -> Def;
		V -> V
	end.

set_target_uid(Uid, V)-> put({target_uid,Uid}, V).

%%-------------------------------------------------------------------
%% #m_map_unit_ai_rw.enter_combat_time
get_enter_combat_time(Uid)-> get({enter_combat_time,Uid}).

get_enter_combat_time_def(Uid, Def)->
	case get({enter_combat_time,Uid}) of
		undefined -> Def;
		V -> V
	end.

set_enter_combat_time(Uid, V)-> put({enter_combat_time,Uid}, V).

%%-------------------------------------------------------------------
%% #m_map_unit_ai_rw.enter_combat_pos
get_enter_combat_pos(Uid)-> get({enter_combat_pos,Uid}).

get_enter_combat_pos_def(Uid, Def)->
	case get({enter_combat_pos,Uid}) of
		undefined -> Def;
		V -> V
	end.

set_enter_combat_pos(Uid, V)-> put({enter_combat_pos,Uid}, V).

%%-------------------------------------------------------------------
%% #m_map_unit_ai_rw.use_skill_id
get_use_skill_id(Uid)-> get({use_skill_id,Uid}).

get_use_skill_id_def(Uid, Def)->
	case get({use_skill_id,Uid}) of
		undefined -> Def;
		V -> V
	end.

set_use_skill_id(Uid, V)-> put({use_skill_id,Uid}, V).

%%-------------------------------------------------------------------
%% #m_map_unit_ai_rw.attack_wait_tick
get_attack_wait_tick(Uid)-> get({attack_wait_tick,Uid}).

get_attack_wait_tick_def(Uid, Def)->
	case get({attack_wait_tick,Uid}) of
		undefined -> Def;
		V -> V
	end.

set_attack_wait_tick(Uid, V)-> put({attack_wait_tick,Uid}, V).

%%-------------------------------------------------------------------
%% #m_map_unit_ai_rw.skill_serial
get_skill_serial(Uid)-> get({skill_serial,Uid}).

get_skill_serial_def(Uid, Def)->
	case get({skill_serial,Uid}) of
		undefined -> Def;
		V -> V
	end.

set_skill_serial(Uid, V)-> put({skill_serial,Uid}, V).

%%-------------------------------------------------------------------
%% #m_map_unit_ai_rw.flee_dst
get_flee_dst(Uid)-> get({flee_dst,Uid}).

get_flee_dst_def(Uid, Def)->
	case get({flee_dst,Uid}) of
		undefined -> Def;
		V -> V
	end.

set_flee_dst(Uid, V)-> put({flee_dst,Uid}, V).

%%-------------------------------------------------------------------
%% #m_map_unit_ai_rw.flee_dir
get_flee_dir(Uid)-> get({flee_dir,Uid}).

get_flee_dir_def(Uid, Def)->
	case get({flee_dir,Uid}) of
		undefined -> Def;
		V -> V
	end.

set_flee_dir(Uid, V)-> put({flee_dir,Uid}, V).

%%-------------------------------------------------------------------
%% #m_map_unit_ai_rw.flee_tick
get_flee_tick(Uid)-> get({flee_tick,Uid}).

get_flee_tick_def(Uid, Def)->
	case get({flee_tick,Uid}) of
		undefined -> Def;
		V -> V
	end.

set_flee_tick(Uid, V)-> put({flee_tick,Uid}, V).

%%-------------------------------------------------------------------
%% #m_map_unit_ai_rw.is_arrived_flee_pos
get_is_arrived_flee_pos(Uid)-> get({is_arrived_flee_pos,Uid}).

get_is_arrived_flee_pos_def(Uid, Def)->
	case get({is_arrived_flee_pos,Uid}) of
		undefined -> Def;
		V -> V
	end.

set_is_arrived_flee_pos(Uid, V)-> put({is_arrived_flee_pos,Uid}, V).

%%-------------------------------------------------------------------
%% #m_map_unit_ai_rw.enmity_list
get_enmity_list(Uid)-> get({enmity_list,Uid}).

get_enmity_list_def(Uid, Def)->
	case get({enmity_list,Uid}) of
		undefined -> Def;
		V -> V
	end.

set_enmity_list(Uid, V)-> put({enmity_list,Uid}, V).

%%-------------------------------------------------------------------
%% #m_map_unit_ai_rw.max_enmity_uid
get_max_enmity_uid(Uid)-> get({max_enmity_uid,Uid}).

get_max_enmity_uid_def(Uid, Def)->
	case get({max_enmity_uid,Uid}) of
		undefined -> Def;
		V -> V
	end.

set_max_enmity_uid(Uid, V)-> put({max_enmity_uid,Uid}, V).

%%-------------------------------------------------------------------
%% #m_map_unit_ai_rw.lock_target_tick
get_lock_target_tick(Uid)-> get({lock_target_tick,Uid}).

get_lock_target_tick_def(Uid, Def)->
	case get({lock_target_tick,Uid}) of
		undefined -> Def;
		V -> V
	end.

set_lock_target_tick(Uid, V)-> put({lock_target_tick,Uid}, V).

%%-------------------------------------------------------------------
%% #m_map_unit_ai_rw.no_inc_enmity_tick
get_no_inc_enmity_tick(Uid)-> get({no_inc_enmity_tick,Uid}).

get_no_inc_enmity_tick_def(Uid, Def)->
	case get({no_inc_enmity_tick,Uid}) of
		undefined -> Def;
		V -> V
	end.

set_no_inc_enmity_tick(Uid, V)-> put({no_inc_enmity_tick,Uid}, V).

%%-------------------------------------------------------------------
del(Uid)->
	erase({ai_state, Uid}),
	erase({pre_ai_state, Uid}),
	erase({ai_transition, Uid}),
	erase({triggers, Uid}),
	erase({pause, Uid}),
	erase({ai_id, Uid}),
	erase({wp_list, Uid}),
	erase({wp_num, Uid}),
	erase({wp_idx, Uid}),
	erase({is_reverse_patrol, Uid}),
	erase({is_patrol, Uid}),
	erase({patrol_rest_tick, Uid}),
	erase({look_for_target_tick, Uid}),
	erase({pursue_tar_pos, Uid}),
	erase({pursue_failed, Uid}),
	erase({cant_pursue, Uid}),
	erase({check_pursue_tick, Uid}),
	erase({target_uid, Uid}),
	erase({enter_combat_time, Uid}),
	erase({enter_combat_pos, Uid}),
	erase({use_skill_id, Uid}),
	erase({attack_wait_tick, Uid}),
	erase({skill_serial, Uid}),
	erase({flee_dst, Uid}),
	erase({flee_dir, Uid}),
	erase({flee_tick, Uid}),
	erase({is_arrived_flee_pos, Uid}),
	erase({enmity_list, Uid}),
	erase({max_enmity_uid, Uid}),
	erase({lock_target_tick, Uid}),
	erase({no_inc_enmity_tick, Uid}),
	ok.
%%-------------------------------------------------------------------
to_record(Uid)->
	#m_map_unit_ai_rw{
		ai_state = get_ai_state(Uid),
		pre_ai_state = get_pre_ai_state(Uid),
		ai_transition = get_ai_transition(Uid),
		triggers = get_triggers(Uid),
		pause = get_pause(Uid),
		ai_id = get_ai_id(Uid),
		wp_list = get_wp_list(Uid),
		wp_num = get_wp_num(Uid),
		wp_idx = get_wp_idx(Uid),
		is_reverse_patrol = get_is_reverse_patrol(Uid),
		is_patrol = get_is_patrol(Uid),
		patrol_rest_tick = get_patrol_rest_tick(Uid),
		look_for_target_tick = get_look_for_target_tick(Uid),
		pursue_tar_pos = get_pursue_tar_pos(Uid),
		pursue_failed = get_pursue_failed(Uid),
		cant_pursue = get_cant_pursue(Uid),
		check_pursue_tick = get_check_pursue_tick(Uid),
		target_uid = get_target_uid(Uid),
		enter_combat_time = get_enter_combat_time(Uid),
		enter_combat_pos = get_enter_combat_pos(Uid),
		use_skill_id = get_use_skill_id(Uid),
		attack_wait_tick = get_attack_wait_tick(Uid),
		skill_serial = get_skill_serial(Uid),
		flee_dst = get_flee_dst(Uid),
		flee_dir = get_flee_dir(Uid),
		flee_tick = get_flee_tick(Uid),
		is_arrived_flee_pos = get_is_arrived_flee_pos(Uid),
		enmity_list = get_enmity_list(Uid),
		max_enmity_uid = get_max_enmity_uid(Uid),
		lock_target_tick = get_lock_target_tick(Uid),
		no_inc_enmity_tick = get_no_inc_enmity_tick(Uid)
	}.
%%-------------------------------------------------------------------
init_from(Uid, Rec)->
	set_ai_state(Uid, Rec#m_map_unit_ai_rw.ai_state),
	set_pre_ai_state(Uid, Rec#m_map_unit_ai_rw.pre_ai_state),
	set_ai_transition(Uid, Rec#m_map_unit_ai_rw.ai_transition),
	set_triggers(Uid, Rec#m_map_unit_ai_rw.triggers),
	set_pause(Uid, Rec#m_map_unit_ai_rw.pause),
	set_ai_id(Uid, Rec#m_map_unit_ai_rw.ai_id),
	set_wp_list(Uid, Rec#m_map_unit_ai_rw.wp_list),
	set_wp_num(Uid, Rec#m_map_unit_ai_rw.wp_num),
	set_wp_idx(Uid, Rec#m_map_unit_ai_rw.wp_idx),
	set_is_reverse_patrol(Uid, Rec#m_map_unit_ai_rw.is_reverse_patrol),
	set_is_patrol(Uid, Rec#m_map_unit_ai_rw.is_patrol),
	set_patrol_rest_tick(Uid, Rec#m_map_unit_ai_rw.patrol_rest_tick),
	set_look_for_target_tick(Uid, Rec#m_map_unit_ai_rw.look_for_target_tick),
	set_pursue_tar_pos(Uid, Rec#m_map_unit_ai_rw.pursue_tar_pos),
	set_pursue_failed(Uid, Rec#m_map_unit_ai_rw.pursue_failed),
	set_cant_pursue(Uid, Rec#m_map_unit_ai_rw.cant_pursue),
	set_check_pursue_tick(Uid, Rec#m_map_unit_ai_rw.check_pursue_tick),
	set_target_uid(Uid, Rec#m_map_unit_ai_rw.target_uid),
	set_enter_combat_time(Uid, Rec#m_map_unit_ai_rw.enter_combat_time),
	set_enter_combat_pos(Uid, Rec#m_map_unit_ai_rw.enter_combat_pos),
	set_use_skill_id(Uid, Rec#m_map_unit_ai_rw.use_skill_id),
	set_attack_wait_tick(Uid, Rec#m_map_unit_ai_rw.attack_wait_tick),
	set_skill_serial(Uid, Rec#m_map_unit_ai_rw.skill_serial),
	set_flee_dst(Uid, Rec#m_map_unit_ai_rw.flee_dst),
	set_flee_dir(Uid, Rec#m_map_unit_ai_rw.flee_dir),
	set_flee_tick(Uid, Rec#m_map_unit_ai_rw.flee_tick),
	set_is_arrived_flee_pos(Uid, Rec#m_map_unit_ai_rw.is_arrived_flee_pos),
	set_enmity_list(Uid, Rec#m_map_unit_ai_rw.enmity_list),
	set_max_enmity_uid(Uid, Rec#m_map_unit_ai_rw.max_enmity_uid),
	set_lock_target_tick(Uid, Rec#m_map_unit_ai_rw.lock_target_tick),
	set_no_inc_enmity_tick(Uid, Rec#m_map_unit_ai_rw.no_inc_enmity_tick),
	ok.
%%-------------------------------------------------------------------
init_default(Uid)->
	Rec = #m_map_unit_ai_rw{},
	set_ai_state(Uid, Rec#m_map_unit_ai_rw.ai_state),
	set_pre_ai_state(Uid, Rec#m_map_unit_ai_rw.pre_ai_state),
	set_ai_transition(Uid, Rec#m_map_unit_ai_rw.ai_transition),
	set_triggers(Uid, Rec#m_map_unit_ai_rw.triggers),
	set_pause(Uid, Rec#m_map_unit_ai_rw.pause),
	set_ai_id(Uid, Rec#m_map_unit_ai_rw.ai_id),
	set_wp_list(Uid, Rec#m_map_unit_ai_rw.wp_list),
	set_wp_num(Uid, Rec#m_map_unit_ai_rw.wp_num),
	set_wp_idx(Uid, Rec#m_map_unit_ai_rw.wp_idx),
	set_is_reverse_patrol(Uid, Rec#m_map_unit_ai_rw.is_reverse_patrol),
	set_is_patrol(Uid, Rec#m_map_unit_ai_rw.is_patrol),
	set_patrol_rest_tick(Uid, Rec#m_map_unit_ai_rw.patrol_rest_tick),
	set_look_for_target_tick(Uid, Rec#m_map_unit_ai_rw.look_for_target_tick),
	set_pursue_tar_pos(Uid, Rec#m_map_unit_ai_rw.pursue_tar_pos),
	set_pursue_failed(Uid, Rec#m_map_unit_ai_rw.pursue_failed),
	set_cant_pursue(Uid, Rec#m_map_unit_ai_rw.cant_pursue),
	set_check_pursue_tick(Uid, Rec#m_map_unit_ai_rw.check_pursue_tick),
	set_target_uid(Uid, Rec#m_map_unit_ai_rw.target_uid),
	set_enter_combat_time(Uid, Rec#m_map_unit_ai_rw.enter_combat_time),
	set_enter_combat_pos(Uid, Rec#m_map_unit_ai_rw.enter_combat_pos),
	set_use_skill_id(Uid, Rec#m_map_unit_ai_rw.use_skill_id),
	set_attack_wait_tick(Uid, Rec#m_map_unit_ai_rw.attack_wait_tick),
	set_skill_serial(Uid, Rec#m_map_unit_ai_rw.skill_serial),
	set_flee_dst(Uid, Rec#m_map_unit_ai_rw.flee_dst),
	set_flee_dir(Uid, Rec#m_map_unit_ai_rw.flee_dir),
	set_flee_tick(Uid, Rec#m_map_unit_ai_rw.flee_tick),
	set_is_arrived_flee_pos(Uid, Rec#m_map_unit_ai_rw.is_arrived_flee_pos),
	set_enmity_list(Uid, Rec#m_map_unit_ai_rw.enmity_list),
	set_max_enmity_uid(Uid, Rec#m_map_unit_ai_rw.max_enmity_uid),
	set_lock_target_tick(Uid, Rec#m_map_unit_ai_rw.lock_target_tick),
	set_no_inc_enmity_tick(Uid, Rec#m_map_unit_ai_rw.no_inc_enmity_tick),
	ok.
%%-------------------------------------------------------------------
