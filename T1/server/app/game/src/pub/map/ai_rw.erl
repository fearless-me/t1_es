%%-------------------------------------------------------------------
%%% This File Is AUTO GENERATED, Don't Modify it MANUALLY!!!
%%% This File Is AUTO GENERATED, Don't Modify it MANUALLY!!!
%%% This File Is AUTO GENERATED, Don't Modify it MANUALLY!!!
%%-------------------------------------------------------------------
-module(ai_rw).

%%-------------------------------------------------------------------
-include("logger.hrl").
-include("pub_def.hrl").
-include("ai.hrl").
-include("rec_rw.hrl").
%%-------------------------------------------------------------------

-export([
	get_ai_state/1,get_ai_state_def/2,set_ai_state/2, % #m_map_unit_ai_rw.ai_state
	get_pre_ai_state/1,get_pre_ai_state_def/2,set_pre_ai_state/2, % #m_map_unit_ai_rw.pre_ai_state
	get_ai_transition/1,get_ai_transition_def/2,set_ai_transition/2, % #m_map_unit_ai_rw.ai_transition
	get_triggers/1,get_triggers_def/2,set_triggers/2, % #m_map_unit_ai_rw.triggers
	get_pause/1,get_pause_def/2,set_pause/2, % #m_map_unit_ai_rw.pause
	get_ai_id/1,get_ai_id_def/2,set_ai_id/2, % #m_map_unit_ai_rw.ai_id
	get_wp_list/1,get_wp_list_def/2,set_wp_list/2, % #m_map_unit_ai_rw.wp_list
	get_wp_num/1,get_wp_num_def/2,set_wp_num/2, % #m_map_unit_ai_rw.wp_num
	get_wp_idx/1,get_wp_idx_def/2,set_wp_idx/2, % #m_map_unit_ai_rw.wp_idx
	get_is_reverse_patrol/1,get_is_reverse_patrol_def/2,set_is_reverse_patrol/2, % #m_map_unit_ai_rw.is_reverse_patrol
	get_is_patrol/1,get_is_patrol_def/2,set_is_patrol/2, % #m_map_unit_ai_rw.is_patrol
	get_patrol_rest_tick/1,get_patrol_rest_tick_def/2,set_patrol_rest_tick/2, % #m_map_unit_ai_rw.patrol_rest_tick
	get_look_for_target_tick/1,get_look_for_target_tick_def/2,set_look_for_target_tick/2, % #m_map_unit_ai_rw.look_for_target_tick
	get_pursue_tar_pos/1,get_pursue_tar_pos_def/2,set_pursue_tar_pos/2, % #m_map_unit_ai_rw.pursue_tar_pos
	get_pursue_failed/1,get_pursue_failed_def/2,set_pursue_failed/2, % #m_map_unit_ai_rw.pursue_failed
	get_cant_pursue/1,get_cant_pursue_def/2,set_cant_pursue/2, % #m_map_unit_ai_rw.cant_pursue
	get_check_pursue_tick/1,get_check_pursue_tick_def/2,set_check_pursue_tick/2, % #m_map_unit_ai_rw.check_pursue_tick
	get_target_uid/1,get_target_uid_def/2,set_target_uid/2, % #m_map_unit_ai_rw.target_uid
	get_enter_combat_time/1,get_enter_combat_time_def/2,set_enter_combat_time/2, % #m_map_unit_ai_rw.enter_combat_time
	get_enter_combat_pos/1,get_enter_combat_pos_def/2,set_enter_combat_pos/2, % #m_map_unit_ai_rw.enter_combat_pos
	get_use_skill_id/1,get_use_skill_id_def/2,set_use_skill_id/2, % #m_map_unit_ai_rw.use_skill_id
	get_attack_wait_tick/1,get_attack_wait_tick_def/2,set_attack_wait_tick/2, % #m_map_unit_ai_rw.attack_wait_tick
	get_skill_serial/1,get_skill_serial_def/2,set_skill_serial/2, % #m_map_unit_ai_rw.skill_serial
	get_flee_dst/1,get_flee_dst_def/2,set_flee_dst/2, % #m_map_unit_ai_rw.flee_dst
	get_flee_dir/1,get_flee_dir_def/2,set_flee_dir/2, % #m_map_unit_ai_rw.flee_dir
	get_flee_tick/1,get_flee_tick_def/2,set_flee_tick/2, % #m_map_unit_ai_rw.flee_tick
	get_is_arrived_flee_pos/1,get_is_arrived_flee_pos_def/2,set_is_arrived_flee_pos/2, % #m_map_unit_ai_rw.is_arrived_flee_pos
	get_enmity_list/1,get_enmity_list_def/2,set_enmity_list/2, % #m_map_unit_ai_rw.enmity_list
	get_max_enmity_uid/1,get_max_enmity_uid_def/2,set_max_enmity_uid/2, % #m_map_unit_ai_rw.max_enmity_uid
	get_lock_target_tick/1,get_lock_target_tick_def/2,set_lock_target_tick/2, % #m_map_unit_ai_rw.lock_target_tick
	get_no_inc_enmity_tick/1,get_no_inc_enmity_tick_def/2,set_no_inc_enmity_tick/2, % #m_map_unit_ai_rw.no_inc_enmity_tick
	% common function 
	del/1,to_record/1,set/2,set_fields/2,init_default/1,init_default/2
]).
%%-------------------------------------------------------------------
%%-------------------------------------------------------------------
%%-------------------------------------------------------------------
%% #m_map_unit_ai_rw.ai_state
get_ai_state(Uid)-> get_ai_state_def(Uid,undefined).

get_ai_state_def(Uid,Def)->
	case erlang:get({Uid,m_map_unit_ai_rw}) of
	undefined -> Def; 
	V -> V#m_map_unit_ai_rw.ai_state 
	end.

set_ai_state(Uid,V)->
	R = erlang:get({Uid,m_map_unit_ai_rw}),
	erlang:put({Uid,m_map_unit_ai_rw}, R#m_map_unit_ai_rw{ai_state = V}).

%%-------------------------------------------------------------------
%% #m_map_unit_ai_rw.pre_ai_state
get_pre_ai_state(Uid)-> get_pre_ai_state_def(Uid,undefined).

get_pre_ai_state_def(Uid,Def)->
	case erlang:get({Uid,m_map_unit_ai_rw}) of
	undefined -> Def; 
	V -> V#m_map_unit_ai_rw.pre_ai_state 
	end.

set_pre_ai_state(Uid,V)->
	R = erlang:get({Uid,m_map_unit_ai_rw}),
	erlang:put({Uid,m_map_unit_ai_rw}, R#m_map_unit_ai_rw{pre_ai_state = V}).

%%-------------------------------------------------------------------
%% #m_map_unit_ai_rw.ai_transition
get_ai_transition(Uid)-> get_ai_transition_def(Uid,undefined).

get_ai_transition_def(Uid,Def)->
	case erlang:get({Uid,m_map_unit_ai_rw}) of
	undefined -> Def; 
	V -> V#m_map_unit_ai_rw.ai_transition 
	end.

set_ai_transition(Uid,V)->
	R = erlang:get({Uid,m_map_unit_ai_rw}),
	erlang:put({Uid,m_map_unit_ai_rw}, R#m_map_unit_ai_rw{ai_transition = V}).

%%-------------------------------------------------------------------
%% #m_map_unit_ai_rw.triggers
get_triggers(Uid)-> get_triggers_def(Uid,undefined).

get_triggers_def(Uid,Def)->
	case erlang:get({Uid,m_map_unit_ai_rw}) of
	undefined -> Def; 
	V -> V#m_map_unit_ai_rw.triggers 
	end.

set_triggers(Uid,V)->
	R = erlang:get({Uid,m_map_unit_ai_rw}),
	erlang:put({Uid,m_map_unit_ai_rw}, R#m_map_unit_ai_rw{triggers = V}).

%%-------------------------------------------------------------------
%% #m_map_unit_ai_rw.pause
get_pause(Uid)-> get_pause_def(Uid,undefined).

get_pause_def(Uid,Def)->
	case erlang:get({Uid,m_map_unit_ai_rw}) of
	undefined -> Def; 
	V -> V#m_map_unit_ai_rw.pause 
	end.

set_pause(Uid,V)->
	R = erlang:get({Uid,m_map_unit_ai_rw}),
	erlang:put({Uid,m_map_unit_ai_rw}, R#m_map_unit_ai_rw{pause = V}).

%%-------------------------------------------------------------------
%% #m_map_unit_ai_rw.ai_id
get_ai_id(Uid)-> get_ai_id_def(Uid,undefined).

get_ai_id_def(Uid,Def)->
	case erlang:get({Uid,m_map_unit_ai_rw}) of
	undefined -> Def; 
	V -> V#m_map_unit_ai_rw.ai_id 
	end.

set_ai_id(Uid,V)->
	R = erlang:get({Uid,m_map_unit_ai_rw}),
	erlang:put({Uid,m_map_unit_ai_rw}, R#m_map_unit_ai_rw{ai_id = V}).

%%-------------------------------------------------------------------
%% #m_map_unit_ai_rw.wp_list
get_wp_list(Uid)-> get_wp_list_def(Uid,undefined).

get_wp_list_def(Uid,Def)->
	case erlang:get({Uid,m_map_unit_ai_rw}) of
	undefined -> Def; 
	V -> V#m_map_unit_ai_rw.wp_list 
	end.

set_wp_list(Uid,V)->
	R = erlang:get({Uid,m_map_unit_ai_rw}),
	erlang:put({Uid,m_map_unit_ai_rw}, R#m_map_unit_ai_rw{wp_list = V}).

%%-------------------------------------------------------------------
%% #m_map_unit_ai_rw.wp_num
get_wp_num(Uid)-> get_wp_num_def(Uid,undefined).

get_wp_num_def(Uid,Def)->
	case erlang:get({Uid,m_map_unit_ai_rw}) of
	undefined -> Def; 
	V -> V#m_map_unit_ai_rw.wp_num 
	end.

set_wp_num(Uid,V)->
	R = erlang:get({Uid,m_map_unit_ai_rw}),
	erlang:put({Uid,m_map_unit_ai_rw}, R#m_map_unit_ai_rw{wp_num = V}).

%%-------------------------------------------------------------------
%% #m_map_unit_ai_rw.wp_idx
get_wp_idx(Uid)-> get_wp_idx_def(Uid,undefined).

get_wp_idx_def(Uid,Def)->
	case erlang:get({Uid,m_map_unit_ai_rw}) of
	undefined -> Def; 
	V -> V#m_map_unit_ai_rw.wp_idx 
	end.

set_wp_idx(Uid,V)->
	R = erlang:get({Uid,m_map_unit_ai_rw}),
	erlang:put({Uid,m_map_unit_ai_rw}, R#m_map_unit_ai_rw{wp_idx = V}).

%%-------------------------------------------------------------------
%% #m_map_unit_ai_rw.is_reverse_patrol
get_is_reverse_patrol(Uid)-> get_is_reverse_patrol_def(Uid,undefined).

get_is_reverse_patrol_def(Uid,Def)->
	case erlang:get({Uid,m_map_unit_ai_rw}) of
	undefined -> Def; 
	V -> V#m_map_unit_ai_rw.is_reverse_patrol 
	end.

set_is_reverse_patrol(Uid,V)->
	R = erlang:get({Uid,m_map_unit_ai_rw}),
	erlang:put({Uid,m_map_unit_ai_rw}, R#m_map_unit_ai_rw{is_reverse_patrol = V}).

%%-------------------------------------------------------------------
%% #m_map_unit_ai_rw.is_patrol
get_is_patrol(Uid)-> get_is_patrol_def(Uid,undefined).

get_is_patrol_def(Uid,Def)->
	case erlang:get({Uid,m_map_unit_ai_rw}) of
	undefined -> Def; 
	V -> V#m_map_unit_ai_rw.is_patrol 
	end.

set_is_patrol(Uid,V)->
	R = erlang:get({Uid,m_map_unit_ai_rw}),
	erlang:put({Uid,m_map_unit_ai_rw}, R#m_map_unit_ai_rw{is_patrol = V}).

%%-------------------------------------------------------------------
%% #m_map_unit_ai_rw.patrol_rest_tick
get_patrol_rest_tick(Uid)-> get_patrol_rest_tick_def(Uid,undefined).

get_patrol_rest_tick_def(Uid,Def)->
	case erlang:get({Uid,m_map_unit_ai_rw}) of
	undefined -> Def; 
	V -> V#m_map_unit_ai_rw.patrol_rest_tick 
	end.

set_patrol_rest_tick(Uid,V)->
	R = erlang:get({Uid,m_map_unit_ai_rw}),
	erlang:put({Uid,m_map_unit_ai_rw}, R#m_map_unit_ai_rw{patrol_rest_tick = V}).

%%-------------------------------------------------------------------
%% #m_map_unit_ai_rw.look_for_target_tick
get_look_for_target_tick(Uid)-> get_look_for_target_tick_def(Uid,undefined).

get_look_for_target_tick_def(Uid,Def)->
	case erlang:get({Uid,m_map_unit_ai_rw}) of
	undefined -> Def; 
	V -> V#m_map_unit_ai_rw.look_for_target_tick 
	end.

set_look_for_target_tick(Uid,V)->
	R = erlang:get({Uid,m_map_unit_ai_rw}),
	erlang:put({Uid,m_map_unit_ai_rw}, R#m_map_unit_ai_rw{look_for_target_tick = V}).

%%-------------------------------------------------------------------
%% #m_map_unit_ai_rw.pursue_tar_pos
get_pursue_tar_pos(Uid)-> get_pursue_tar_pos_def(Uid,undefined).

get_pursue_tar_pos_def(Uid,Def)->
	case erlang:get({Uid,m_map_unit_ai_rw}) of
	undefined -> Def; 
	V -> V#m_map_unit_ai_rw.pursue_tar_pos 
	end.

set_pursue_tar_pos(Uid,V)->
	R = erlang:get({Uid,m_map_unit_ai_rw}),
	erlang:put({Uid,m_map_unit_ai_rw}, R#m_map_unit_ai_rw{pursue_tar_pos = V}).

%%-------------------------------------------------------------------
%% #m_map_unit_ai_rw.pursue_failed
get_pursue_failed(Uid)-> get_pursue_failed_def(Uid,undefined).

get_pursue_failed_def(Uid,Def)->
	case erlang:get({Uid,m_map_unit_ai_rw}) of
	undefined -> Def; 
	V -> V#m_map_unit_ai_rw.pursue_failed 
	end.

set_pursue_failed(Uid,V)->
	R = erlang:get({Uid,m_map_unit_ai_rw}),
	erlang:put({Uid,m_map_unit_ai_rw}, R#m_map_unit_ai_rw{pursue_failed = V}).

%%-------------------------------------------------------------------
%% #m_map_unit_ai_rw.cant_pursue
get_cant_pursue(Uid)-> get_cant_pursue_def(Uid,undefined).

get_cant_pursue_def(Uid,Def)->
	case erlang:get({Uid,m_map_unit_ai_rw}) of
	undefined -> Def; 
	V -> V#m_map_unit_ai_rw.cant_pursue 
	end.

set_cant_pursue(Uid,V)->
	R = erlang:get({Uid,m_map_unit_ai_rw}),
	erlang:put({Uid,m_map_unit_ai_rw}, R#m_map_unit_ai_rw{cant_pursue = V}).

%%-------------------------------------------------------------------
%% #m_map_unit_ai_rw.check_pursue_tick
get_check_pursue_tick(Uid)-> get_check_pursue_tick_def(Uid,undefined).

get_check_pursue_tick_def(Uid,Def)->
	case erlang:get({Uid,m_map_unit_ai_rw}) of
	undefined -> Def; 
	V -> V#m_map_unit_ai_rw.check_pursue_tick 
	end.

set_check_pursue_tick(Uid,V)->
	R = erlang:get({Uid,m_map_unit_ai_rw}),
	erlang:put({Uid,m_map_unit_ai_rw}, R#m_map_unit_ai_rw{check_pursue_tick = V}).

%%-------------------------------------------------------------------
%% #m_map_unit_ai_rw.target_uid
get_target_uid(Uid)-> get_target_uid_def(Uid,undefined).

get_target_uid_def(Uid,Def)->
	case erlang:get({Uid,m_map_unit_ai_rw}) of
	undefined -> Def; 
	V -> V#m_map_unit_ai_rw.target_uid 
	end.

set_target_uid(Uid,V)->
	R = erlang:get({Uid,m_map_unit_ai_rw}),
	erlang:put({Uid,m_map_unit_ai_rw}, R#m_map_unit_ai_rw{target_uid = V}).

%%-------------------------------------------------------------------
%% #m_map_unit_ai_rw.enter_combat_time
get_enter_combat_time(Uid)-> get_enter_combat_time_def(Uid,undefined).

get_enter_combat_time_def(Uid,Def)->
	case erlang:get({Uid,m_map_unit_ai_rw}) of
	undefined -> Def; 
	V -> V#m_map_unit_ai_rw.enter_combat_time 
	end.

set_enter_combat_time(Uid,V)->
	R = erlang:get({Uid,m_map_unit_ai_rw}),
	erlang:put({Uid,m_map_unit_ai_rw}, R#m_map_unit_ai_rw{enter_combat_time = V}).

%%-------------------------------------------------------------------
%% #m_map_unit_ai_rw.enter_combat_pos
get_enter_combat_pos(Uid)-> get_enter_combat_pos_def(Uid,undefined).

get_enter_combat_pos_def(Uid,Def)->
	case erlang:get({Uid,m_map_unit_ai_rw}) of
	undefined -> Def; 
	V -> V#m_map_unit_ai_rw.enter_combat_pos 
	end.

set_enter_combat_pos(Uid,V)->
	R = erlang:get({Uid,m_map_unit_ai_rw}),
	erlang:put({Uid,m_map_unit_ai_rw}, R#m_map_unit_ai_rw{enter_combat_pos = V}).

%%-------------------------------------------------------------------
%% #m_map_unit_ai_rw.use_skill_id
get_use_skill_id(Uid)-> get_use_skill_id_def(Uid,undefined).

get_use_skill_id_def(Uid,Def)->
	case erlang:get({Uid,m_map_unit_ai_rw}) of
	undefined -> Def; 
	V -> V#m_map_unit_ai_rw.use_skill_id 
	end.

set_use_skill_id(Uid,V)->
	R = erlang:get({Uid,m_map_unit_ai_rw}),
	erlang:put({Uid,m_map_unit_ai_rw}, R#m_map_unit_ai_rw{use_skill_id = V}).

%%-------------------------------------------------------------------
%% #m_map_unit_ai_rw.attack_wait_tick
get_attack_wait_tick(Uid)-> get_attack_wait_tick_def(Uid,undefined).

get_attack_wait_tick_def(Uid,Def)->
	case erlang:get({Uid,m_map_unit_ai_rw}) of
	undefined -> Def; 
	V -> V#m_map_unit_ai_rw.attack_wait_tick 
	end.

set_attack_wait_tick(Uid,V)->
	R = erlang:get({Uid,m_map_unit_ai_rw}),
	erlang:put({Uid,m_map_unit_ai_rw}, R#m_map_unit_ai_rw{attack_wait_tick = V}).

%%-------------------------------------------------------------------
%% #m_map_unit_ai_rw.skill_serial
get_skill_serial(Uid)-> get_skill_serial_def(Uid,undefined).

get_skill_serial_def(Uid,Def)->
	case erlang:get({Uid,m_map_unit_ai_rw}) of
	undefined -> Def; 
	V -> V#m_map_unit_ai_rw.skill_serial 
	end.

set_skill_serial(Uid,V)->
	R = erlang:get({Uid,m_map_unit_ai_rw}),
	erlang:put({Uid,m_map_unit_ai_rw}, R#m_map_unit_ai_rw{skill_serial = V}).

%%-------------------------------------------------------------------
%% #m_map_unit_ai_rw.flee_dst
get_flee_dst(Uid)-> get_flee_dst_def(Uid,undefined).

get_flee_dst_def(Uid,Def)->
	case erlang:get({Uid,m_map_unit_ai_rw}) of
	undefined -> Def; 
	V -> V#m_map_unit_ai_rw.flee_dst 
	end.

set_flee_dst(Uid,V)->
	R = erlang:get({Uid,m_map_unit_ai_rw}),
	erlang:put({Uid,m_map_unit_ai_rw}, R#m_map_unit_ai_rw{flee_dst = V}).

%%-------------------------------------------------------------------
%% #m_map_unit_ai_rw.flee_dir
get_flee_dir(Uid)-> get_flee_dir_def(Uid,undefined).

get_flee_dir_def(Uid,Def)->
	case erlang:get({Uid,m_map_unit_ai_rw}) of
	undefined -> Def; 
	V -> V#m_map_unit_ai_rw.flee_dir 
	end.

set_flee_dir(Uid,V)->
	R = erlang:get({Uid,m_map_unit_ai_rw}),
	erlang:put({Uid,m_map_unit_ai_rw}, R#m_map_unit_ai_rw{flee_dir = V}).

%%-------------------------------------------------------------------
%% #m_map_unit_ai_rw.flee_tick
get_flee_tick(Uid)-> get_flee_tick_def(Uid,undefined).

get_flee_tick_def(Uid,Def)->
	case erlang:get({Uid,m_map_unit_ai_rw}) of
	undefined -> Def; 
	V -> V#m_map_unit_ai_rw.flee_tick 
	end.

set_flee_tick(Uid,V)->
	R = erlang:get({Uid,m_map_unit_ai_rw}),
	erlang:put({Uid,m_map_unit_ai_rw}, R#m_map_unit_ai_rw{flee_tick = V}).

%%-------------------------------------------------------------------
%% #m_map_unit_ai_rw.is_arrived_flee_pos
get_is_arrived_flee_pos(Uid)-> get_is_arrived_flee_pos_def(Uid,undefined).

get_is_arrived_flee_pos_def(Uid,Def)->
	case erlang:get({Uid,m_map_unit_ai_rw}) of
	undefined -> Def; 
	V -> V#m_map_unit_ai_rw.is_arrived_flee_pos 
	end.

set_is_arrived_flee_pos(Uid,V)->
	R = erlang:get({Uid,m_map_unit_ai_rw}),
	erlang:put({Uid,m_map_unit_ai_rw}, R#m_map_unit_ai_rw{is_arrived_flee_pos = V}).

%%-------------------------------------------------------------------
%% #m_map_unit_ai_rw.enmity_list
get_enmity_list(Uid)-> get_enmity_list_def(Uid,undefined).

get_enmity_list_def(Uid,Def)->
	case erlang:get({Uid,m_map_unit_ai_rw}) of
	undefined -> Def; 
	V -> V#m_map_unit_ai_rw.enmity_list 
	end.

set_enmity_list(Uid,V)->
	R = erlang:get({Uid,m_map_unit_ai_rw}),
	erlang:put({Uid,m_map_unit_ai_rw}, R#m_map_unit_ai_rw{enmity_list = V}).

%%-------------------------------------------------------------------
%% #m_map_unit_ai_rw.max_enmity_uid
get_max_enmity_uid(Uid)-> get_max_enmity_uid_def(Uid,undefined).

get_max_enmity_uid_def(Uid,Def)->
	case erlang:get({Uid,m_map_unit_ai_rw}) of
	undefined -> Def; 
	V -> V#m_map_unit_ai_rw.max_enmity_uid 
	end.

set_max_enmity_uid(Uid,V)->
	R = erlang:get({Uid,m_map_unit_ai_rw}),
	erlang:put({Uid,m_map_unit_ai_rw}, R#m_map_unit_ai_rw{max_enmity_uid = V}).

%%-------------------------------------------------------------------
%% #m_map_unit_ai_rw.lock_target_tick
get_lock_target_tick(Uid)-> get_lock_target_tick_def(Uid,undefined).

get_lock_target_tick_def(Uid,Def)->
	case erlang:get({Uid,m_map_unit_ai_rw}) of
	undefined -> Def; 
	V -> V#m_map_unit_ai_rw.lock_target_tick 
	end.

set_lock_target_tick(Uid,V)->
	R = erlang:get({Uid,m_map_unit_ai_rw}),
	erlang:put({Uid,m_map_unit_ai_rw}, R#m_map_unit_ai_rw{lock_target_tick = V}).

%%-------------------------------------------------------------------
%% #m_map_unit_ai_rw.no_inc_enmity_tick
get_no_inc_enmity_tick(Uid)-> get_no_inc_enmity_tick_def(Uid,undefined).

get_no_inc_enmity_tick_def(Uid,Def)->
	case erlang:get({Uid,m_map_unit_ai_rw}) of
	undefined -> Def; 
	V -> V#m_map_unit_ai_rw.no_inc_enmity_tick 
	end.

set_no_inc_enmity_tick(Uid,V)->
	R = erlang:get({Uid,m_map_unit_ai_rw}),
	erlang:put({Uid,m_map_unit_ai_rw}, R#m_map_unit_ai_rw{no_inc_enmity_tick = V}).

%%-------------------------------------------------------------------
del(Uid)-> erlang:erase({Uid,m_map_unit_ai_rw}).

%%-------------------------------------------------------------------
to_record(Uid)-> erlang:get({Uid,m_map_unit_ai_rw}).

%%-------------------------------------------------------------------
set(Uid,#m_map_unit_ai_rw{}=V)->
	erlang:put({Uid,m_map_unit_ai_rw}, V).

%%-------------------------------------------------------------------
init_default(Uid)-> erlang:put({Uid,m_map_unit_ai_rw}, #m_map_unit_ai_rw{}).
init_default(Uid,#m_map_unit_ai_rw{}=V) -> erlang:put({Uid,m_map_unit_ai_rw}, V).

%%-------------------------------------------------------------------
set_fields(_Uid,[]) ->ok;
set_fields(Uid,FieldList) ->
	R1 = erlang:get({Uid,m_map_unit_ai_rw}),
	R2 = i_set_fields(Uid,FieldList,R1),
	erlang:put({Uid,m_map_unit_ai_rw}, R2),
	ok.

%%-------------------------------------------------------------------
i_set_fields(_Uid,R, []) ->
	R;
i_set_fields(Uid,R, [H | FieldList]) ->
	i_set_fields(Uid,i_set_field(Uid,R,H), FieldList).

%%#m_map_unit_ai_rw.ai_state
i_set_field(_Uid,{ai_state, Val}, R) ->
	R#m_map_unit_ai_rw{ai_state = Val};
i_set_field(_Uid,{ai_state, Val, add}, R) ->
	R#m_map_unit_ai_rw{ai_state = R#m_map_unit_ai_rw.ai_state + Val};
i_set_field(_Uid,{ai_state, Val, sub}, R) ->
	R#m_map_unit_ai_rw{ai_state = R#m_map_unit_ai_rw.ai_state - Val};
i_set_field(_Uid,{#m_map_unit_ai_rw.ai_state, Val}, R) ->
	R#m_map_unit_ai_rw{ai_state = Val};
i_set_field(_Uid,{#m_map_unit_ai_rw.ai_state, Val, add}, R) ->
	R#m_map_unit_ai_rw{ai_state = R#m_map_unit_ai_rw.ai_state + Val};
i_set_field(_Uid,{#m_map_unit_ai_rw.ai_state, Val, sub}, R) ->
	R#m_map_unit_ai_rw{ai_state = R#m_map_unit_ai_rw.ai_state - Val};
%%#m_map_unit_ai_rw.pre_ai_state
i_set_field(_Uid,{pre_ai_state, Val}, R) ->
	R#m_map_unit_ai_rw{pre_ai_state = Val};
i_set_field(_Uid,{pre_ai_state, Val, add}, R) ->
	R#m_map_unit_ai_rw{pre_ai_state = R#m_map_unit_ai_rw.pre_ai_state + Val};
i_set_field(_Uid,{pre_ai_state, Val, sub}, R) ->
	R#m_map_unit_ai_rw{pre_ai_state = R#m_map_unit_ai_rw.pre_ai_state - Val};
i_set_field(_Uid,{#m_map_unit_ai_rw.pre_ai_state, Val}, R) ->
	R#m_map_unit_ai_rw{pre_ai_state = Val};
i_set_field(_Uid,{#m_map_unit_ai_rw.pre_ai_state, Val, add}, R) ->
	R#m_map_unit_ai_rw{pre_ai_state = R#m_map_unit_ai_rw.pre_ai_state + Val};
i_set_field(_Uid,{#m_map_unit_ai_rw.pre_ai_state, Val, sub}, R) ->
	R#m_map_unit_ai_rw{pre_ai_state = R#m_map_unit_ai_rw.pre_ai_state - Val};
%%#m_map_unit_ai_rw.ai_transition
i_set_field(_Uid,{ai_transition, Val}, R) ->
	R#m_map_unit_ai_rw{ai_transition = Val};
i_set_field(_Uid,{ai_transition, Val, add}, R) ->
	R#m_map_unit_ai_rw{ai_transition = R#m_map_unit_ai_rw.ai_transition + Val};
i_set_field(_Uid,{ai_transition, Val, sub}, R) ->
	R#m_map_unit_ai_rw{ai_transition = R#m_map_unit_ai_rw.ai_transition - Val};
i_set_field(_Uid,{#m_map_unit_ai_rw.ai_transition, Val}, R) ->
	R#m_map_unit_ai_rw{ai_transition = Val};
i_set_field(_Uid,{#m_map_unit_ai_rw.ai_transition, Val, add}, R) ->
	R#m_map_unit_ai_rw{ai_transition = R#m_map_unit_ai_rw.ai_transition + Val};
i_set_field(_Uid,{#m_map_unit_ai_rw.ai_transition, Val, sub}, R) ->
	R#m_map_unit_ai_rw{ai_transition = R#m_map_unit_ai_rw.ai_transition - Val};
%%#m_map_unit_ai_rw.triggers
i_set_field(_Uid,{triggers, Val}, R) ->
	R#m_map_unit_ai_rw{triggers = Val};
i_set_field(_Uid,{triggers, Val, add}, R) ->
	R#m_map_unit_ai_rw{triggers = R#m_map_unit_ai_rw.triggers + Val};
i_set_field(_Uid,{triggers, Val, sub}, R) ->
	R#m_map_unit_ai_rw{triggers = R#m_map_unit_ai_rw.triggers - Val};
i_set_field(_Uid,{#m_map_unit_ai_rw.triggers, Val}, R) ->
	R#m_map_unit_ai_rw{triggers = Val};
i_set_field(_Uid,{#m_map_unit_ai_rw.triggers, Val, add}, R) ->
	R#m_map_unit_ai_rw{triggers = R#m_map_unit_ai_rw.triggers + Val};
i_set_field(_Uid,{#m_map_unit_ai_rw.triggers, Val, sub}, R) ->
	R#m_map_unit_ai_rw{triggers = R#m_map_unit_ai_rw.triggers - Val};
%%#m_map_unit_ai_rw.pause
i_set_field(_Uid,{pause, Val}, R) ->
	R#m_map_unit_ai_rw{pause = Val};
i_set_field(_Uid,{pause, Val, add}, R) ->
	R#m_map_unit_ai_rw{pause = R#m_map_unit_ai_rw.pause + Val};
i_set_field(_Uid,{pause, Val, sub}, R) ->
	R#m_map_unit_ai_rw{pause = R#m_map_unit_ai_rw.pause - Val};
i_set_field(_Uid,{#m_map_unit_ai_rw.pause, Val}, R) ->
	R#m_map_unit_ai_rw{pause = Val};
i_set_field(_Uid,{#m_map_unit_ai_rw.pause, Val, add}, R) ->
	R#m_map_unit_ai_rw{pause = R#m_map_unit_ai_rw.pause + Val};
i_set_field(_Uid,{#m_map_unit_ai_rw.pause, Val, sub}, R) ->
	R#m_map_unit_ai_rw{pause = R#m_map_unit_ai_rw.pause - Val};
%%#m_map_unit_ai_rw.ai_id
i_set_field(_Uid,{ai_id, Val}, R) ->
	R#m_map_unit_ai_rw{ai_id = Val};
i_set_field(_Uid,{ai_id, Val, add}, R) ->
	R#m_map_unit_ai_rw{ai_id = R#m_map_unit_ai_rw.ai_id + Val};
i_set_field(_Uid,{ai_id, Val, sub}, R) ->
	R#m_map_unit_ai_rw{ai_id = R#m_map_unit_ai_rw.ai_id - Val};
i_set_field(_Uid,{#m_map_unit_ai_rw.ai_id, Val}, R) ->
	R#m_map_unit_ai_rw{ai_id = Val};
i_set_field(_Uid,{#m_map_unit_ai_rw.ai_id, Val, add}, R) ->
	R#m_map_unit_ai_rw{ai_id = R#m_map_unit_ai_rw.ai_id + Val};
i_set_field(_Uid,{#m_map_unit_ai_rw.ai_id, Val, sub}, R) ->
	R#m_map_unit_ai_rw{ai_id = R#m_map_unit_ai_rw.ai_id - Val};
%%#m_map_unit_ai_rw.wp_list
i_set_field(_Uid,{wp_list, Val}, R) ->
	R#m_map_unit_ai_rw{wp_list = Val};
i_set_field(_Uid,{wp_list, Val, add}, R) ->
	R#m_map_unit_ai_rw{wp_list = R#m_map_unit_ai_rw.wp_list + Val};
i_set_field(_Uid,{wp_list, Val, sub}, R) ->
	R#m_map_unit_ai_rw{wp_list = R#m_map_unit_ai_rw.wp_list - Val};
i_set_field(_Uid,{#m_map_unit_ai_rw.wp_list, Val}, R) ->
	R#m_map_unit_ai_rw{wp_list = Val};
i_set_field(_Uid,{#m_map_unit_ai_rw.wp_list, Val, add}, R) ->
	R#m_map_unit_ai_rw{wp_list = R#m_map_unit_ai_rw.wp_list + Val};
i_set_field(_Uid,{#m_map_unit_ai_rw.wp_list, Val, sub}, R) ->
	R#m_map_unit_ai_rw{wp_list = R#m_map_unit_ai_rw.wp_list - Val};
%%#m_map_unit_ai_rw.wp_num
i_set_field(_Uid,{wp_num, Val}, R) ->
	R#m_map_unit_ai_rw{wp_num = Val};
i_set_field(_Uid,{wp_num, Val, add}, R) ->
	R#m_map_unit_ai_rw{wp_num = R#m_map_unit_ai_rw.wp_num + Val};
i_set_field(_Uid,{wp_num, Val, sub}, R) ->
	R#m_map_unit_ai_rw{wp_num = R#m_map_unit_ai_rw.wp_num - Val};
i_set_field(_Uid,{#m_map_unit_ai_rw.wp_num, Val}, R) ->
	R#m_map_unit_ai_rw{wp_num = Val};
i_set_field(_Uid,{#m_map_unit_ai_rw.wp_num, Val, add}, R) ->
	R#m_map_unit_ai_rw{wp_num = R#m_map_unit_ai_rw.wp_num + Val};
i_set_field(_Uid,{#m_map_unit_ai_rw.wp_num, Val, sub}, R) ->
	R#m_map_unit_ai_rw{wp_num = R#m_map_unit_ai_rw.wp_num - Val};
%%#m_map_unit_ai_rw.wp_idx
i_set_field(_Uid,{wp_idx, Val}, R) ->
	R#m_map_unit_ai_rw{wp_idx = Val};
i_set_field(_Uid,{wp_idx, Val, add}, R) ->
	R#m_map_unit_ai_rw{wp_idx = R#m_map_unit_ai_rw.wp_idx + Val};
i_set_field(_Uid,{wp_idx, Val, sub}, R) ->
	R#m_map_unit_ai_rw{wp_idx = R#m_map_unit_ai_rw.wp_idx - Val};
i_set_field(_Uid,{#m_map_unit_ai_rw.wp_idx, Val}, R) ->
	R#m_map_unit_ai_rw{wp_idx = Val};
i_set_field(_Uid,{#m_map_unit_ai_rw.wp_idx, Val, add}, R) ->
	R#m_map_unit_ai_rw{wp_idx = R#m_map_unit_ai_rw.wp_idx + Val};
i_set_field(_Uid,{#m_map_unit_ai_rw.wp_idx, Val, sub}, R) ->
	R#m_map_unit_ai_rw{wp_idx = R#m_map_unit_ai_rw.wp_idx - Val};
%%#m_map_unit_ai_rw.is_reverse_patrol
i_set_field(_Uid,{is_reverse_patrol, Val}, R) ->
	R#m_map_unit_ai_rw{is_reverse_patrol = Val};
i_set_field(_Uid,{is_reverse_patrol, Val, add}, R) ->
	R#m_map_unit_ai_rw{is_reverse_patrol = R#m_map_unit_ai_rw.is_reverse_patrol + Val};
i_set_field(_Uid,{is_reverse_patrol, Val, sub}, R) ->
	R#m_map_unit_ai_rw{is_reverse_patrol = R#m_map_unit_ai_rw.is_reverse_patrol - Val};
i_set_field(_Uid,{#m_map_unit_ai_rw.is_reverse_patrol, Val}, R) ->
	R#m_map_unit_ai_rw{is_reverse_patrol = Val};
i_set_field(_Uid,{#m_map_unit_ai_rw.is_reverse_patrol, Val, add}, R) ->
	R#m_map_unit_ai_rw{is_reverse_patrol = R#m_map_unit_ai_rw.is_reverse_patrol + Val};
i_set_field(_Uid,{#m_map_unit_ai_rw.is_reverse_patrol, Val, sub}, R) ->
	R#m_map_unit_ai_rw{is_reverse_patrol = R#m_map_unit_ai_rw.is_reverse_patrol - Val};
%%#m_map_unit_ai_rw.is_patrol
i_set_field(_Uid,{is_patrol, Val}, R) ->
	R#m_map_unit_ai_rw{is_patrol = Val};
i_set_field(_Uid,{is_patrol, Val, add}, R) ->
	R#m_map_unit_ai_rw{is_patrol = R#m_map_unit_ai_rw.is_patrol + Val};
i_set_field(_Uid,{is_patrol, Val, sub}, R) ->
	R#m_map_unit_ai_rw{is_patrol = R#m_map_unit_ai_rw.is_patrol - Val};
i_set_field(_Uid,{#m_map_unit_ai_rw.is_patrol, Val}, R) ->
	R#m_map_unit_ai_rw{is_patrol = Val};
i_set_field(_Uid,{#m_map_unit_ai_rw.is_patrol, Val, add}, R) ->
	R#m_map_unit_ai_rw{is_patrol = R#m_map_unit_ai_rw.is_patrol + Val};
i_set_field(_Uid,{#m_map_unit_ai_rw.is_patrol, Val, sub}, R) ->
	R#m_map_unit_ai_rw{is_patrol = R#m_map_unit_ai_rw.is_patrol - Val};
%%#m_map_unit_ai_rw.patrol_rest_tick
i_set_field(_Uid,{patrol_rest_tick, Val}, R) ->
	R#m_map_unit_ai_rw{patrol_rest_tick = Val};
i_set_field(_Uid,{patrol_rest_tick, Val, add}, R) ->
	R#m_map_unit_ai_rw{patrol_rest_tick = R#m_map_unit_ai_rw.patrol_rest_tick + Val};
i_set_field(_Uid,{patrol_rest_tick, Val, sub}, R) ->
	R#m_map_unit_ai_rw{patrol_rest_tick = R#m_map_unit_ai_rw.patrol_rest_tick - Val};
i_set_field(_Uid,{#m_map_unit_ai_rw.patrol_rest_tick, Val}, R) ->
	R#m_map_unit_ai_rw{patrol_rest_tick = Val};
i_set_field(_Uid,{#m_map_unit_ai_rw.patrol_rest_tick, Val, add}, R) ->
	R#m_map_unit_ai_rw{patrol_rest_tick = R#m_map_unit_ai_rw.patrol_rest_tick + Val};
i_set_field(_Uid,{#m_map_unit_ai_rw.patrol_rest_tick, Val, sub}, R) ->
	R#m_map_unit_ai_rw{patrol_rest_tick = R#m_map_unit_ai_rw.patrol_rest_tick - Val};
%%#m_map_unit_ai_rw.look_for_target_tick
i_set_field(_Uid,{look_for_target_tick, Val}, R) ->
	R#m_map_unit_ai_rw{look_for_target_tick = Val};
i_set_field(_Uid,{look_for_target_tick, Val, add}, R) ->
	R#m_map_unit_ai_rw{look_for_target_tick = R#m_map_unit_ai_rw.look_for_target_tick + Val};
i_set_field(_Uid,{look_for_target_tick, Val, sub}, R) ->
	R#m_map_unit_ai_rw{look_for_target_tick = R#m_map_unit_ai_rw.look_for_target_tick - Val};
i_set_field(_Uid,{#m_map_unit_ai_rw.look_for_target_tick, Val}, R) ->
	R#m_map_unit_ai_rw{look_for_target_tick = Val};
i_set_field(_Uid,{#m_map_unit_ai_rw.look_for_target_tick, Val, add}, R) ->
	R#m_map_unit_ai_rw{look_for_target_tick = R#m_map_unit_ai_rw.look_for_target_tick + Val};
i_set_field(_Uid,{#m_map_unit_ai_rw.look_for_target_tick, Val, sub}, R) ->
	R#m_map_unit_ai_rw{look_for_target_tick = R#m_map_unit_ai_rw.look_for_target_tick - Val};
%%#m_map_unit_ai_rw.pursue_tar_pos
i_set_field(_Uid,{pursue_tar_pos, Val}, R) ->
	R#m_map_unit_ai_rw{pursue_tar_pos = Val};
i_set_field(_Uid,{pursue_tar_pos, Val, add}, R) ->
	R#m_map_unit_ai_rw{pursue_tar_pos = R#m_map_unit_ai_rw.pursue_tar_pos + Val};
i_set_field(_Uid,{pursue_tar_pos, Val, sub}, R) ->
	R#m_map_unit_ai_rw{pursue_tar_pos = R#m_map_unit_ai_rw.pursue_tar_pos - Val};
i_set_field(_Uid,{#m_map_unit_ai_rw.pursue_tar_pos, Val}, R) ->
	R#m_map_unit_ai_rw{pursue_tar_pos = Val};
i_set_field(_Uid,{#m_map_unit_ai_rw.pursue_tar_pos, Val, add}, R) ->
	R#m_map_unit_ai_rw{pursue_tar_pos = R#m_map_unit_ai_rw.pursue_tar_pos + Val};
i_set_field(_Uid,{#m_map_unit_ai_rw.pursue_tar_pos, Val, sub}, R) ->
	R#m_map_unit_ai_rw{pursue_tar_pos = R#m_map_unit_ai_rw.pursue_tar_pos - Val};
%%#m_map_unit_ai_rw.pursue_failed
i_set_field(_Uid,{pursue_failed, Val}, R) ->
	R#m_map_unit_ai_rw{pursue_failed = Val};
i_set_field(_Uid,{pursue_failed, Val, add}, R) ->
	R#m_map_unit_ai_rw{pursue_failed = R#m_map_unit_ai_rw.pursue_failed + Val};
i_set_field(_Uid,{pursue_failed, Val, sub}, R) ->
	R#m_map_unit_ai_rw{pursue_failed = R#m_map_unit_ai_rw.pursue_failed - Val};
i_set_field(_Uid,{#m_map_unit_ai_rw.pursue_failed, Val}, R) ->
	R#m_map_unit_ai_rw{pursue_failed = Val};
i_set_field(_Uid,{#m_map_unit_ai_rw.pursue_failed, Val, add}, R) ->
	R#m_map_unit_ai_rw{pursue_failed = R#m_map_unit_ai_rw.pursue_failed + Val};
i_set_field(_Uid,{#m_map_unit_ai_rw.pursue_failed, Val, sub}, R) ->
	R#m_map_unit_ai_rw{pursue_failed = R#m_map_unit_ai_rw.pursue_failed - Val};
%%#m_map_unit_ai_rw.cant_pursue
i_set_field(_Uid,{cant_pursue, Val}, R) ->
	R#m_map_unit_ai_rw{cant_pursue = Val};
i_set_field(_Uid,{cant_pursue, Val, add}, R) ->
	R#m_map_unit_ai_rw{cant_pursue = R#m_map_unit_ai_rw.cant_pursue + Val};
i_set_field(_Uid,{cant_pursue, Val, sub}, R) ->
	R#m_map_unit_ai_rw{cant_pursue = R#m_map_unit_ai_rw.cant_pursue - Val};
i_set_field(_Uid,{#m_map_unit_ai_rw.cant_pursue, Val}, R) ->
	R#m_map_unit_ai_rw{cant_pursue = Val};
i_set_field(_Uid,{#m_map_unit_ai_rw.cant_pursue, Val, add}, R) ->
	R#m_map_unit_ai_rw{cant_pursue = R#m_map_unit_ai_rw.cant_pursue + Val};
i_set_field(_Uid,{#m_map_unit_ai_rw.cant_pursue, Val, sub}, R) ->
	R#m_map_unit_ai_rw{cant_pursue = R#m_map_unit_ai_rw.cant_pursue - Val};
%%#m_map_unit_ai_rw.check_pursue_tick
i_set_field(_Uid,{check_pursue_tick, Val}, R) ->
	R#m_map_unit_ai_rw{check_pursue_tick = Val};
i_set_field(_Uid,{check_pursue_tick, Val, add}, R) ->
	R#m_map_unit_ai_rw{check_pursue_tick = R#m_map_unit_ai_rw.check_pursue_tick + Val};
i_set_field(_Uid,{check_pursue_tick, Val, sub}, R) ->
	R#m_map_unit_ai_rw{check_pursue_tick = R#m_map_unit_ai_rw.check_pursue_tick - Val};
i_set_field(_Uid,{#m_map_unit_ai_rw.check_pursue_tick, Val}, R) ->
	R#m_map_unit_ai_rw{check_pursue_tick = Val};
i_set_field(_Uid,{#m_map_unit_ai_rw.check_pursue_tick, Val, add}, R) ->
	R#m_map_unit_ai_rw{check_pursue_tick = R#m_map_unit_ai_rw.check_pursue_tick + Val};
i_set_field(_Uid,{#m_map_unit_ai_rw.check_pursue_tick, Val, sub}, R) ->
	R#m_map_unit_ai_rw{check_pursue_tick = R#m_map_unit_ai_rw.check_pursue_tick - Val};
%%#m_map_unit_ai_rw.target_uid
i_set_field(_Uid,{target_uid, Val}, R) ->
	R#m_map_unit_ai_rw{target_uid = Val};
i_set_field(_Uid,{target_uid, Val, add}, R) ->
	R#m_map_unit_ai_rw{target_uid = R#m_map_unit_ai_rw.target_uid + Val};
i_set_field(_Uid,{target_uid, Val, sub}, R) ->
	R#m_map_unit_ai_rw{target_uid = R#m_map_unit_ai_rw.target_uid - Val};
i_set_field(_Uid,{#m_map_unit_ai_rw.target_uid, Val}, R) ->
	R#m_map_unit_ai_rw{target_uid = Val};
i_set_field(_Uid,{#m_map_unit_ai_rw.target_uid, Val, add}, R) ->
	R#m_map_unit_ai_rw{target_uid = R#m_map_unit_ai_rw.target_uid + Val};
i_set_field(_Uid,{#m_map_unit_ai_rw.target_uid, Val, sub}, R) ->
	R#m_map_unit_ai_rw{target_uid = R#m_map_unit_ai_rw.target_uid - Val};
%%#m_map_unit_ai_rw.enter_combat_time
i_set_field(_Uid,{enter_combat_time, Val}, R) ->
	R#m_map_unit_ai_rw{enter_combat_time = Val};
i_set_field(_Uid,{enter_combat_time, Val, add}, R) ->
	R#m_map_unit_ai_rw{enter_combat_time = R#m_map_unit_ai_rw.enter_combat_time + Val};
i_set_field(_Uid,{enter_combat_time, Val, sub}, R) ->
	R#m_map_unit_ai_rw{enter_combat_time = R#m_map_unit_ai_rw.enter_combat_time - Val};
i_set_field(_Uid,{#m_map_unit_ai_rw.enter_combat_time, Val}, R) ->
	R#m_map_unit_ai_rw{enter_combat_time = Val};
i_set_field(_Uid,{#m_map_unit_ai_rw.enter_combat_time, Val, add}, R) ->
	R#m_map_unit_ai_rw{enter_combat_time = R#m_map_unit_ai_rw.enter_combat_time + Val};
i_set_field(_Uid,{#m_map_unit_ai_rw.enter_combat_time, Val, sub}, R) ->
	R#m_map_unit_ai_rw{enter_combat_time = R#m_map_unit_ai_rw.enter_combat_time - Val};
%%#m_map_unit_ai_rw.enter_combat_pos
i_set_field(_Uid,{enter_combat_pos, Val}, R) ->
	R#m_map_unit_ai_rw{enter_combat_pos = Val};
i_set_field(_Uid,{enter_combat_pos, Val, add}, R) ->
	R#m_map_unit_ai_rw{enter_combat_pos = R#m_map_unit_ai_rw.enter_combat_pos + Val};
i_set_field(_Uid,{enter_combat_pos, Val, sub}, R) ->
	R#m_map_unit_ai_rw{enter_combat_pos = R#m_map_unit_ai_rw.enter_combat_pos - Val};
i_set_field(_Uid,{#m_map_unit_ai_rw.enter_combat_pos, Val}, R) ->
	R#m_map_unit_ai_rw{enter_combat_pos = Val};
i_set_field(_Uid,{#m_map_unit_ai_rw.enter_combat_pos, Val, add}, R) ->
	R#m_map_unit_ai_rw{enter_combat_pos = R#m_map_unit_ai_rw.enter_combat_pos + Val};
i_set_field(_Uid,{#m_map_unit_ai_rw.enter_combat_pos, Val, sub}, R) ->
	R#m_map_unit_ai_rw{enter_combat_pos = R#m_map_unit_ai_rw.enter_combat_pos - Val};
%%#m_map_unit_ai_rw.use_skill_id
i_set_field(_Uid,{use_skill_id, Val}, R) ->
	R#m_map_unit_ai_rw{use_skill_id = Val};
i_set_field(_Uid,{use_skill_id, Val, add}, R) ->
	R#m_map_unit_ai_rw{use_skill_id = R#m_map_unit_ai_rw.use_skill_id + Val};
i_set_field(_Uid,{use_skill_id, Val, sub}, R) ->
	R#m_map_unit_ai_rw{use_skill_id = R#m_map_unit_ai_rw.use_skill_id - Val};
i_set_field(_Uid,{#m_map_unit_ai_rw.use_skill_id, Val}, R) ->
	R#m_map_unit_ai_rw{use_skill_id = Val};
i_set_field(_Uid,{#m_map_unit_ai_rw.use_skill_id, Val, add}, R) ->
	R#m_map_unit_ai_rw{use_skill_id = R#m_map_unit_ai_rw.use_skill_id + Val};
i_set_field(_Uid,{#m_map_unit_ai_rw.use_skill_id, Val, sub}, R) ->
	R#m_map_unit_ai_rw{use_skill_id = R#m_map_unit_ai_rw.use_skill_id - Val};
%%#m_map_unit_ai_rw.attack_wait_tick
i_set_field(_Uid,{attack_wait_tick, Val}, R) ->
	R#m_map_unit_ai_rw{attack_wait_tick = Val};
i_set_field(_Uid,{attack_wait_tick, Val, add}, R) ->
	R#m_map_unit_ai_rw{attack_wait_tick = R#m_map_unit_ai_rw.attack_wait_tick + Val};
i_set_field(_Uid,{attack_wait_tick, Val, sub}, R) ->
	R#m_map_unit_ai_rw{attack_wait_tick = R#m_map_unit_ai_rw.attack_wait_tick - Val};
i_set_field(_Uid,{#m_map_unit_ai_rw.attack_wait_tick, Val}, R) ->
	R#m_map_unit_ai_rw{attack_wait_tick = Val};
i_set_field(_Uid,{#m_map_unit_ai_rw.attack_wait_tick, Val, add}, R) ->
	R#m_map_unit_ai_rw{attack_wait_tick = R#m_map_unit_ai_rw.attack_wait_tick + Val};
i_set_field(_Uid,{#m_map_unit_ai_rw.attack_wait_tick, Val, sub}, R) ->
	R#m_map_unit_ai_rw{attack_wait_tick = R#m_map_unit_ai_rw.attack_wait_tick - Val};
%%#m_map_unit_ai_rw.skill_serial
i_set_field(_Uid,{skill_serial, Val}, R) ->
	R#m_map_unit_ai_rw{skill_serial = Val};
i_set_field(_Uid,{skill_serial, Val, add}, R) ->
	R#m_map_unit_ai_rw{skill_serial = R#m_map_unit_ai_rw.skill_serial + Val};
i_set_field(_Uid,{skill_serial, Val, sub}, R) ->
	R#m_map_unit_ai_rw{skill_serial = R#m_map_unit_ai_rw.skill_serial - Val};
i_set_field(_Uid,{#m_map_unit_ai_rw.skill_serial, Val}, R) ->
	R#m_map_unit_ai_rw{skill_serial = Val};
i_set_field(_Uid,{#m_map_unit_ai_rw.skill_serial, Val, add}, R) ->
	R#m_map_unit_ai_rw{skill_serial = R#m_map_unit_ai_rw.skill_serial + Val};
i_set_field(_Uid,{#m_map_unit_ai_rw.skill_serial, Val, sub}, R) ->
	R#m_map_unit_ai_rw{skill_serial = R#m_map_unit_ai_rw.skill_serial - Val};
%%#m_map_unit_ai_rw.flee_dst
i_set_field(_Uid,{flee_dst, Val}, R) ->
	R#m_map_unit_ai_rw{flee_dst = Val};
i_set_field(_Uid,{flee_dst, Val, add}, R) ->
	R#m_map_unit_ai_rw{flee_dst = R#m_map_unit_ai_rw.flee_dst + Val};
i_set_field(_Uid,{flee_dst, Val, sub}, R) ->
	R#m_map_unit_ai_rw{flee_dst = R#m_map_unit_ai_rw.flee_dst - Val};
i_set_field(_Uid,{#m_map_unit_ai_rw.flee_dst, Val}, R) ->
	R#m_map_unit_ai_rw{flee_dst = Val};
i_set_field(_Uid,{#m_map_unit_ai_rw.flee_dst, Val, add}, R) ->
	R#m_map_unit_ai_rw{flee_dst = R#m_map_unit_ai_rw.flee_dst + Val};
i_set_field(_Uid,{#m_map_unit_ai_rw.flee_dst, Val, sub}, R) ->
	R#m_map_unit_ai_rw{flee_dst = R#m_map_unit_ai_rw.flee_dst - Val};
%%#m_map_unit_ai_rw.flee_dir
i_set_field(_Uid,{flee_dir, Val}, R) ->
	R#m_map_unit_ai_rw{flee_dir = Val};
i_set_field(_Uid,{flee_dir, Val, add}, R) ->
	R#m_map_unit_ai_rw{flee_dir = R#m_map_unit_ai_rw.flee_dir + Val};
i_set_field(_Uid,{flee_dir, Val, sub}, R) ->
	R#m_map_unit_ai_rw{flee_dir = R#m_map_unit_ai_rw.flee_dir - Val};
i_set_field(_Uid,{#m_map_unit_ai_rw.flee_dir, Val}, R) ->
	R#m_map_unit_ai_rw{flee_dir = Val};
i_set_field(_Uid,{#m_map_unit_ai_rw.flee_dir, Val, add}, R) ->
	R#m_map_unit_ai_rw{flee_dir = R#m_map_unit_ai_rw.flee_dir + Val};
i_set_field(_Uid,{#m_map_unit_ai_rw.flee_dir, Val, sub}, R) ->
	R#m_map_unit_ai_rw{flee_dir = R#m_map_unit_ai_rw.flee_dir - Val};
%%#m_map_unit_ai_rw.flee_tick
i_set_field(_Uid,{flee_tick, Val}, R) ->
	R#m_map_unit_ai_rw{flee_tick = Val};
i_set_field(_Uid,{flee_tick, Val, add}, R) ->
	R#m_map_unit_ai_rw{flee_tick = R#m_map_unit_ai_rw.flee_tick + Val};
i_set_field(_Uid,{flee_tick, Val, sub}, R) ->
	R#m_map_unit_ai_rw{flee_tick = R#m_map_unit_ai_rw.flee_tick - Val};
i_set_field(_Uid,{#m_map_unit_ai_rw.flee_tick, Val}, R) ->
	R#m_map_unit_ai_rw{flee_tick = Val};
i_set_field(_Uid,{#m_map_unit_ai_rw.flee_tick, Val, add}, R) ->
	R#m_map_unit_ai_rw{flee_tick = R#m_map_unit_ai_rw.flee_tick + Val};
i_set_field(_Uid,{#m_map_unit_ai_rw.flee_tick, Val, sub}, R) ->
	R#m_map_unit_ai_rw{flee_tick = R#m_map_unit_ai_rw.flee_tick - Val};
%%#m_map_unit_ai_rw.is_arrived_flee_pos
i_set_field(_Uid,{is_arrived_flee_pos, Val}, R) ->
	R#m_map_unit_ai_rw{is_arrived_flee_pos = Val};
i_set_field(_Uid,{is_arrived_flee_pos, Val, add}, R) ->
	R#m_map_unit_ai_rw{is_arrived_flee_pos = R#m_map_unit_ai_rw.is_arrived_flee_pos + Val};
i_set_field(_Uid,{is_arrived_flee_pos, Val, sub}, R) ->
	R#m_map_unit_ai_rw{is_arrived_flee_pos = R#m_map_unit_ai_rw.is_arrived_flee_pos - Val};
i_set_field(_Uid,{#m_map_unit_ai_rw.is_arrived_flee_pos, Val}, R) ->
	R#m_map_unit_ai_rw{is_arrived_flee_pos = Val};
i_set_field(_Uid,{#m_map_unit_ai_rw.is_arrived_flee_pos, Val, add}, R) ->
	R#m_map_unit_ai_rw{is_arrived_flee_pos = R#m_map_unit_ai_rw.is_arrived_flee_pos + Val};
i_set_field(_Uid,{#m_map_unit_ai_rw.is_arrived_flee_pos, Val, sub}, R) ->
	R#m_map_unit_ai_rw{is_arrived_flee_pos = R#m_map_unit_ai_rw.is_arrived_flee_pos - Val};
%%#m_map_unit_ai_rw.enmity_list
i_set_field(_Uid,{enmity_list, Val}, R) ->
	R#m_map_unit_ai_rw{enmity_list = Val};
i_set_field(_Uid,{enmity_list, Val, add}, R) ->
	R#m_map_unit_ai_rw{enmity_list = R#m_map_unit_ai_rw.enmity_list + Val};
i_set_field(_Uid,{enmity_list, Val, sub}, R) ->
	R#m_map_unit_ai_rw{enmity_list = R#m_map_unit_ai_rw.enmity_list - Val};
i_set_field(_Uid,{#m_map_unit_ai_rw.enmity_list, Val}, R) ->
	R#m_map_unit_ai_rw{enmity_list = Val};
i_set_field(_Uid,{#m_map_unit_ai_rw.enmity_list, Val, add}, R) ->
	R#m_map_unit_ai_rw{enmity_list = R#m_map_unit_ai_rw.enmity_list + Val};
i_set_field(_Uid,{#m_map_unit_ai_rw.enmity_list, Val, sub}, R) ->
	R#m_map_unit_ai_rw{enmity_list = R#m_map_unit_ai_rw.enmity_list - Val};
%%#m_map_unit_ai_rw.max_enmity_uid
i_set_field(_Uid,{max_enmity_uid, Val}, R) ->
	R#m_map_unit_ai_rw{max_enmity_uid = Val};
i_set_field(_Uid,{max_enmity_uid, Val, add}, R) ->
	R#m_map_unit_ai_rw{max_enmity_uid = R#m_map_unit_ai_rw.max_enmity_uid + Val};
i_set_field(_Uid,{max_enmity_uid, Val, sub}, R) ->
	R#m_map_unit_ai_rw{max_enmity_uid = R#m_map_unit_ai_rw.max_enmity_uid - Val};
i_set_field(_Uid,{#m_map_unit_ai_rw.max_enmity_uid, Val}, R) ->
	R#m_map_unit_ai_rw{max_enmity_uid = Val};
i_set_field(_Uid,{#m_map_unit_ai_rw.max_enmity_uid, Val, add}, R) ->
	R#m_map_unit_ai_rw{max_enmity_uid = R#m_map_unit_ai_rw.max_enmity_uid + Val};
i_set_field(_Uid,{#m_map_unit_ai_rw.max_enmity_uid, Val, sub}, R) ->
	R#m_map_unit_ai_rw{max_enmity_uid = R#m_map_unit_ai_rw.max_enmity_uid - Val};
%%#m_map_unit_ai_rw.lock_target_tick
i_set_field(_Uid,{lock_target_tick, Val}, R) ->
	R#m_map_unit_ai_rw{lock_target_tick = Val};
i_set_field(_Uid,{lock_target_tick, Val, add}, R) ->
	R#m_map_unit_ai_rw{lock_target_tick = R#m_map_unit_ai_rw.lock_target_tick + Val};
i_set_field(_Uid,{lock_target_tick, Val, sub}, R) ->
	R#m_map_unit_ai_rw{lock_target_tick = R#m_map_unit_ai_rw.lock_target_tick - Val};
i_set_field(_Uid,{#m_map_unit_ai_rw.lock_target_tick, Val}, R) ->
	R#m_map_unit_ai_rw{lock_target_tick = Val};
i_set_field(_Uid,{#m_map_unit_ai_rw.lock_target_tick, Val, add}, R) ->
	R#m_map_unit_ai_rw{lock_target_tick = R#m_map_unit_ai_rw.lock_target_tick + Val};
i_set_field(_Uid,{#m_map_unit_ai_rw.lock_target_tick, Val, sub}, R) ->
	R#m_map_unit_ai_rw{lock_target_tick = R#m_map_unit_ai_rw.lock_target_tick - Val};
%%#m_map_unit_ai_rw.no_inc_enmity_tick
i_set_field(_Uid,{no_inc_enmity_tick, Val}, R) ->
	R#m_map_unit_ai_rw{no_inc_enmity_tick = Val};
i_set_field(_Uid,{no_inc_enmity_tick, Val, add}, R) ->
	R#m_map_unit_ai_rw{no_inc_enmity_tick = R#m_map_unit_ai_rw.no_inc_enmity_tick + Val};
i_set_field(_Uid,{no_inc_enmity_tick, Val, sub}, R) ->
	R#m_map_unit_ai_rw{no_inc_enmity_tick = R#m_map_unit_ai_rw.no_inc_enmity_tick - Val};
i_set_field(_Uid,{#m_map_unit_ai_rw.no_inc_enmity_tick, Val}, R) ->
	R#m_map_unit_ai_rw{no_inc_enmity_tick = Val};
i_set_field(_Uid,{#m_map_unit_ai_rw.no_inc_enmity_tick, Val, add}, R) ->
	R#m_map_unit_ai_rw{no_inc_enmity_tick = R#m_map_unit_ai_rw.no_inc_enmity_tick + Val};
i_set_field(_Uid,{#m_map_unit_ai_rw.no_inc_enmity_tick, Val, sub}, R) ->
	R#m_map_unit_ai_rw{no_inc_enmity_tick = R#m_map_unit_ai_rw.no_inc_enmity_tick - Val};
i_set_field(_Uid,_Elem,R)-> R.

%%-------------------------------------------------------------------
