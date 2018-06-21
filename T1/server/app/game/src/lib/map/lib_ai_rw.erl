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

-export([get_ai_state/0, get_ai_state_def/1, set_ai_state/1, set_ai_state_direct/1]).
-export([get_pre_ai_state/0, get_pre_ai_state_def/1, set_pre_ai_state/1, set_pre_ai_state_direct/1]).
-export([get_ai_transcation/0, get_ai_transcation_def/1, set_ai_transcation/1, set_ai_transcation_direct/1]).
-export([get_triggers/0, get_triggers_def/1, set_triggers/1, set_triggers_direct/1]).
-export([get_pause/0, get_pause_def/1, set_pause/1, set_pause_direct/1]).
-export([del/0]).
-export([to_record/0]).
-export([init_from/1]).
%%-------------------------------------------------------------------
%%-------------------------------------------------------------------
%%-------------------------------------------------------------------
%% #m_map_obj_ai.ai_state
get_ai_state()-> get(ai_state).

get_ai_state_def(Def)->
	case get(ai_state) of
		undefined -> Def;
		V -> V
	end.

set_ai_state(V)-> put(ai_state, V).

set_ai_state_direct(V)-> put(ai_state, V).

%%-------------------------------------------------------------------
%% #m_map_obj_ai.pre_ai_state
get_pre_ai_state()-> get(pre_ai_state).

get_pre_ai_state_def(Def)->
	case get(pre_ai_state) of
		undefined -> Def;
		V -> V
	end.

set_pre_ai_state(V)-> put(pre_ai_state, V).

set_pre_ai_state_direct(V)-> put(pre_ai_state, V).

%%-------------------------------------------------------------------
%% #m_map_obj_ai.ai_transcation
get_ai_transcation()-> get(ai_transcation).

get_ai_transcation_def(Def)->
	case get(ai_transcation) of
		undefined -> Def;
		V -> V
	end.

set_ai_transcation(V)-> put(ai_transcation, V).

set_ai_transcation_direct(V)-> put(ai_transcation, V).

%%-------------------------------------------------------------------
%% #m_map_obj_ai.triggers
get_triggers()-> get(triggers).

get_triggers_def(Def)->
	case get(triggers) of
		undefined -> Def;
		V -> V
	end.

set_triggers(V)-> put(triggers, V).

set_triggers_direct(V)-> put(triggers, V).

%%-------------------------------------------------------------------
%% #m_map_obj_ai.pause
get_pause()-> get(pause).

get_pause_def(Def)->
	case get(pause) of
		undefined -> Def;
		V -> V
	end.

set_pause(V)-> put(pause, V).

set_pause_direct(V)-> put(pause, V).

%%-------------------------------------------------------------------
del()->
	erase(ai_state),
	erase(pre_ai_state),
	erase(ai_transcation),
	erase(triggers),
	erase(pause),
	ok.
%%-------------------------------------------------------------------
to_record()->
	#m_map_obj_ai{
		ai_state = get_ai_state(),
		pre_ai_state = get_pre_ai_state(),
		ai_transcation = get_ai_transcation(),
		triggers = get_triggers(),
		pause = get_pause()
	}.
%%-------------------------------------------------------------------
init_from(Rec)->
	set_ai_state_direct(Rec#m_map_obj_ai.ai_state),
	set_pre_ai_state_direct(Rec#m_map_obj_ai.pre_ai_state),
	set_ai_transcation_direct(Rec#m_map_obj_ai.ai_transcation),
	set_triggers_direct(Rec#m_map_obj_ai.triggers),
	set_pause_direct(Rec#m_map_obj_ai.pause),
	ok.
%%-------------------------------------------------------------------
