%%-------------------------------------------------------------------
%%% This File Is AUTO GENERATED, Don't Modify it MANUALLY!!!
%%% This File Is AUTO GENERATED, Don't Modify it MANUALLY!!!
%%% This File Is AUTO GENERATED, Don't Modify it MANUALLY!!!
%%-------------------------------------------------------------------
-module(lib_ai_rw).

%%-------------------------------------------------------------------
-include("logger.hrl").
-include("ai_def.hrl").
-include("rw_record.hrl").
-include("vector3.hrl").
%%-------------------------------------------------------------------

-export([
	get_ai_state/1, get_ai_state_def/2, set_ai_state/2, % #m_map_obj_ai_rw.ai_state
	get_pre_ai_state/1, get_pre_ai_state_def/2, set_pre_ai_state/2, % #m_map_obj_ai_rw.pre_ai_state
	get_ai_transition/1, get_ai_transition_def/2, set_ai_transition/2, % #m_map_obj_ai_rw.ai_transition
	get_triggers/1, get_triggers_def/2, set_triggers/2, % #m_map_obj_ai_rw.triggers
	get_pause/1, get_pause_def/2, set_pause/2, % #m_map_obj_ai_rw.pause
	get_ai_id/1, get_ai_id_def/2, set_ai_id/2, % #m_map_obj_ai_rw.ai_id
	get_wp_list/1, get_wp_list_def/2, set_wp_list/2, % #m_map_obj_ai_rw.wp_list
	get_wp_num/1, get_wp_num_def/2, set_wp_num/2, % #m_map_obj_ai_rw.wp_num
	get_wp_idx/1, get_wp_idx_def/2, set_wp_idx/2, % #m_map_obj_ai_rw.wp_idx
	get_is_reverse_patrol/1, get_is_reverse_patrol_def/2, set_is_reverse_patrol/2, % #m_map_obj_ai_rw.is_reverse_patrol
	get_is_patrol/1, get_is_patrol_def/2, set_is_patrol/2, % #m_map_obj_ai_rw.is_patrol
	get_patrol_rest_tick/1, get_patrol_rest_tick_def/2, set_patrol_rest_tick/2, % #m_map_obj_ai_rw.patrol_rest_tick
	get_look_for_target_tick/1, get_look_for_target_tick_def/2, set_look_for_target_tick/2, % #m_map_obj_ai_rw.look_for_target_tick
	% common function 
	del/1 ,to_record/1 ,init_from/2 ,init_default/1
]).
%%-------------------------------------------------------------------
%%-------------------------------------------------------------------
%%-------------------------------------------------------------------
%% #m_map_obj_ai_rw.ai_state
get_ai_state(Uid)-> get({ai_state,Uid}).

get_ai_state_def(Uid, Def)->
	case get({ai_state,Uid}) of
		undefined -> Def;
		V -> V
	end.

set_ai_state(Uid, V)-> put({ai_state,Uid}, V).

%%-------------------------------------------------------------------
%% #m_map_obj_ai_rw.pre_ai_state
get_pre_ai_state(Uid)-> get({pre_ai_state,Uid}).

get_pre_ai_state_def(Uid, Def)->
	case get({pre_ai_state,Uid}) of
		undefined -> Def;
		V -> V
	end.

set_pre_ai_state(Uid, V)-> put({pre_ai_state,Uid}, V).

%%-------------------------------------------------------------------
%% #m_map_obj_ai_rw.ai_transition
get_ai_transition(Uid)-> get({ai_transition,Uid}).

get_ai_transition_def(Uid, Def)->
	case get({ai_transition,Uid}) of
		undefined -> Def;
		V -> V
	end.

set_ai_transition(Uid, V)-> put({ai_transition,Uid}, V).

%%-------------------------------------------------------------------
%% #m_map_obj_ai_rw.triggers
get_triggers(Uid)-> get({triggers,Uid}).

get_triggers_def(Uid, Def)->
	case get({triggers,Uid}) of
		undefined -> Def;
		V -> V
	end.

set_triggers(Uid, V)-> put({triggers,Uid}, V).

%%-------------------------------------------------------------------
%% #m_map_obj_ai_rw.pause
get_pause(Uid)-> get({pause,Uid}).

get_pause_def(Uid, Def)->
	case get({pause,Uid}) of
		undefined -> Def;
		V -> V
	end.

set_pause(Uid, V)-> put({pause,Uid}, V).

%%-------------------------------------------------------------------
%% #m_map_obj_ai_rw.ai_id
get_ai_id(Uid)-> get({ai_id,Uid}).

get_ai_id_def(Uid, Def)->
	case get({ai_id,Uid}) of
		undefined -> Def;
		V -> V
	end.

set_ai_id(Uid, V)-> put({ai_id,Uid}, V).

%%-------------------------------------------------------------------
%% #m_map_obj_ai_rw.wp_list
get_wp_list(Uid)-> get({wp_list,Uid}).

get_wp_list_def(Uid, Def)->
	case get({wp_list,Uid}) of
		undefined -> Def;
		V -> V
	end.

set_wp_list(Uid, V)-> put({wp_list,Uid}, V).

%%-------------------------------------------------------------------
%% #m_map_obj_ai_rw.wp_num
get_wp_num(Uid)-> get({wp_num,Uid}).

get_wp_num_def(Uid, Def)->
	case get({wp_num,Uid}) of
		undefined -> Def;
		V -> V
	end.

set_wp_num(Uid, V)-> put({wp_num,Uid}, V).

%%-------------------------------------------------------------------
%% #m_map_obj_ai_rw.wp_idx
get_wp_idx(Uid)-> get({wp_idx,Uid}).

get_wp_idx_def(Uid, Def)->
	case get({wp_idx,Uid}) of
		undefined -> Def;
		V -> V
	end.

set_wp_idx(Uid, V)-> put({wp_idx,Uid}, V).

%%-------------------------------------------------------------------
%% #m_map_obj_ai_rw.is_reverse_patrol
get_is_reverse_patrol(Uid)-> get({is_reverse_patrol,Uid}).

get_is_reverse_patrol_def(Uid, Def)->
	case get({is_reverse_patrol,Uid}) of
		undefined -> Def;
		V -> V
	end.

set_is_reverse_patrol(Uid, V)-> put({is_reverse_patrol,Uid}, V).

%%-------------------------------------------------------------------
%% #m_map_obj_ai_rw.is_patrol
get_is_patrol(Uid)-> get({is_patrol,Uid}).

get_is_patrol_def(Uid, Def)->
	case get({is_patrol,Uid}) of
		undefined -> Def;
		V -> V
	end.

set_is_patrol(Uid, V)-> put({is_patrol,Uid}, V).

%%-------------------------------------------------------------------
%% #m_map_obj_ai_rw.patrol_rest_tick
get_patrol_rest_tick(Uid)-> get({patrol_rest_tick,Uid}).

get_patrol_rest_tick_def(Uid, Def)->
	case get({patrol_rest_tick,Uid}) of
		undefined -> Def;
		V -> V
	end.

set_patrol_rest_tick(Uid, V)-> put({patrol_rest_tick,Uid}, V).

%%-------------------------------------------------------------------
%% #m_map_obj_ai_rw.look_for_target_tick
get_look_for_target_tick(Uid)-> get({look_for_target_tick,Uid}).

get_look_for_target_tick_def(Uid, Def)->
	case get({look_for_target_tick,Uid}) of
		undefined -> Def;
		V -> V
	end.

set_look_for_target_tick(Uid, V)-> put({look_for_target_tick,Uid}, V).

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
	ok.
%%-------------------------------------------------------------------
to_record(Uid)->
	#m_map_obj_ai_rw{
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
		look_for_target_tick = get_look_for_target_tick(Uid)
	}.
%%-------------------------------------------------------------------
init_from(Uid, Rec)->
	set_ai_state(Uid, Rec#m_map_obj_ai_rw.ai_state),
	set_pre_ai_state(Uid, Rec#m_map_obj_ai_rw.pre_ai_state),
	set_ai_transition(Uid, Rec#m_map_obj_ai_rw.ai_transition),
	set_triggers(Uid, Rec#m_map_obj_ai_rw.triggers),
	set_pause(Uid, Rec#m_map_obj_ai_rw.pause),
	set_ai_id(Uid, Rec#m_map_obj_ai_rw.ai_id),
	set_wp_list(Uid, Rec#m_map_obj_ai_rw.wp_list),
	set_wp_num(Uid, Rec#m_map_obj_ai_rw.wp_num),
	set_wp_idx(Uid, Rec#m_map_obj_ai_rw.wp_idx),
	set_is_reverse_patrol(Uid, Rec#m_map_obj_ai_rw.is_reverse_patrol),
	set_is_patrol(Uid, Rec#m_map_obj_ai_rw.is_patrol),
	set_patrol_rest_tick(Uid, Rec#m_map_obj_ai_rw.patrol_rest_tick),
	set_look_for_target_tick(Uid, Rec#m_map_obj_ai_rw.look_for_target_tick),
	ok.
%%-------------------------------------------------------------------
init_default(Uid)->
	Rec = #m_map_obj_ai_rw{},
	set_ai_state(Uid, Rec#m_map_obj_ai_rw.ai_state),
	set_pre_ai_state(Uid, Rec#m_map_obj_ai_rw.pre_ai_state),
	set_ai_transition(Uid, Rec#m_map_obj_ai_rw.ai_transition),
	set_triggers(Uid, Rec#m_map_obj_ai_rw.triggers),
	set_pause(Uid, Rec#m_map_obj_ai_rw.pause),
	set_ai_id(Uid, Rec#m_map_obj_ai_rw.ai_id),
	set_wp_list(Uid, Rec#m_map_obj_ai_rw.wp_list),
	set_wp_num(Uid, Rec#m_map_obj_ai_rw.wp_num),
	set_wp_idx(Uid, Rec#m_map_obj_ai_rw.wp_idx),
	set_is_reverse_patrol(Uid, Rec#m_map_obj_ai_rw.is_reverse_patrol),
	set_is_patrol(Uid, Rec#m_map_obj_ai_rw.is_patrol),
	set_patrol_rest_tick(Uid, Rec#m_map_obj_ai_rw.patrol_rest_tick),
	set_look_for_target_tick(Uid, Rec#m_map_obj_ai_rw.look_for_target_tick),
	ok.
%%-------------------------------------------------------------------
