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

-export([get_ai_state/1, get_ai_state_def/2, set_ai_state/2]).
-export([get_pre_ai_state/1, get_pre_ai_state_def/2, set_pre_ai_state/2]).
-export([get_ai_transition/1, get_ai_transition_def/2, set_ai_transition/2]).
-export([get_triggers/1, get_triggers_def/2, set_triggers/2]).
-export([get_pause/1, get_pause_def/2, set_pause/2]).
-export([del/1]).
-export([to_record/1]).
-export([init_from/2]).
%%-------------------------------------------------------------------
%%-------------------------------------------------------------------
%%-------------------------------------------------------------------
%% #m_map_obj_ai.ai_state
get_ai_state(Uid)-> get({ai_state,Uid}).

get_ai_state_def(Uid, Def)->
	case get({ai_state,Uid}) of
		undefined -> Def;
		V -> V
	end.

set_ai_state(Uid, V)-> put({ai_state,Uid}, V).

%%-------------------------------------------------------------------
%% #m_map_obj_ai.pre_ai_state
get_pre_ai_state(Uid)-> get({pre_ai_state,Uid}).

get_pre_ai_state_def(Uid, Def)->
	case get({pre_ai_state,Uid}) of
		undefined -> Def;
		V -> V
	end.

set_pre_ai_state(Uid, V)-> put({pre_ai_state,Uid}, V).

%%-------------------------------------------------------------------
%% #m_map_obj_ai.ai_transition
get_ai_transition(Uid)-> get({ai_transition,Uid}).

get_ai_transition_def(Uid, Def)->
	case get({ai_transition,Uid}) of
		undefined -> Def;
		V -> V
	end.

set_ai_transition(Uid, V)-> put({ai_transition,Uid}, V).

%%-------------------------------------------------------------------
%% #m_map_obj_ai.triggers
get_triggers(Uid)-> get({triggers,Uid}).

get_triggers_def(Uid, Def)->
	case get({triggers,Uid}) of
		undefined -> Def;
		V -> V
	end.

set_triggers(Uid, V)-> put({triggers,Uid}, V).

%%-------------------------------------------------------------------
%% #m_map_obj_ai.pause
get_pause(Uid)-> get({pause,Uid}).

get_pause_def(Uid, Def)->
	case get({pause,Uid}) of
		undefined -> Def;
		V -> V
	end.

set_pause(Uid, V)-> put({pause,Uid}, V).

%%-------------------------------------------------------------------
del(Uid)->
	erase({ai_state, Uid}),
	erase({pre_ai_state, Uid}),
	erase({ai_transition, Uid}),
	erase({triggers, Uid}),
	erase({pause, Uid}),
	ok.
%%-------------------------------------------------------------------
to_record(Uid)->
	#m_map_obj_ai{
		ai_state = get_ai_state(Uid),
		pre_ai_state = get_pre_ai_state(Uid),
		ai_transition = get_ai_transition(Uid),
		triggers = get_triggers(Uid),
		pause = get_pause(Uid)
	}.
%%-------------------------------------------------------------------
init_from(Uid, Rec)->
	set_ai_state(Uid, Rec#m_map_obj_ai.ai_state),
	set_pre_ai_state(Uid, Rec#m_map_obj_ai.pre_ai_state),
	set_ai_transition(Uid, Rec#m_map_obj_ai.ai_transition),
	set_triggers(Uid, Rec#m_map_obj_ai.triggers),
	set_pause(Uid, Rec#m_map_obj_ai.pause),
	ok.
%%-------------------------------------------------------------------
