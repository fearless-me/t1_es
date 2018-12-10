%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 21. 六月 2018 16:19
%%%-------------------------------------------------------------------
-module(ai_state).
-author("mawenhong").
-include("logger.hrl").
-include("ai.hrl").

%% API
-export([
    on_enter/2, on_exit/2, update/2, on_event/3
]).

%%-------------------------------------------------------------------
-spec on_enter(Uid :: integer(), AiState :: ai_state_type()) -> ok.
on_enter(Uid, ?AI_STATE_IDLE) ->
    ai_state_idle:on_enter(Uid);
on_enter(Uid, ?AI_STATE_PURSUE) ->
    ai_state_pursue:on_enter(Uid);
on_enter(Uid, ?AI_STATE_ATTACK) ->
    ai_state_attack:on_enter(Uid);
on_enter(Uid, ?AI_STATE_FLEE) ->
    ai_state_flee:on_enter(Uid);
on_enter(Uid, ?AI_STATE_RETURN) ->
    ai_state_return:on_enter(Uid);
on_enter(_Uid, _AiState) ->
    ok.

%%-------------------------------------------------------------------
-spec on_exit(Uid :: integer(), AiState :: ai_state_type()) -> ok.
on_exit(Uid, ?AI_STATE_IDLE) ->
    ai_state_idle:on_exit(Uid);
on_exit(Uid, ?AI_STATE_PURSUE) ->
    ai_state_pursue:on_exit(Uid);
on_exit(Uid, ?AI_STATE_ATTACK) ->
    ai_state_attack:on_exit(Uid);
on_exit(Uid, ?AI_STATE_FLEE) ->
    ai_state_flee:on_exit(Uid);
on_exit(Uid, ?AI_STATE_RETURN) ->
    ai_state_return:on_exit(Uid);
on_exit(_Uid, _AiState) ->
    ok.


%%-------------------------------------------------------------------
-spec update(Uid :: integer(), AiState :: ai_state_type()) -> ok.
update(Uid, ?AI_STATE_IDLE) ->
    ai_state_idle:update(Uid);
update(Uid, ?AI_STATE_PURSUE) ->
    ai_state_pursue:update(Uid);
update(Uid, ?AI_STATE_ATTACK) ->
    ai_state_attack:update(Uid);
update(Uid, ?AI_STATE_FLEE) ->
    ai_state_flee:update(Uid);
update(Uid, ?AI_STATE_RETURN) ->
    ai_state_return:update(Uid);
update(_Uid, _AiState) ->
    ok.

%%-------------------------------------------------------------------
-spec on_event(Uid :: integer(), AiState :: ai_state_type(), Event :: integer()) -> ok.
on_event(Uid, ?AI_STATE_IDLE, Event) ->
    ai_state_idle:on_event(Uid, Event);
on_event(Uid, ?AI_STATE_PURSUE, Event) ->
    ai_state_pursue:on_event(Uid, Event);
on_event(Uid, ?AI_STATE_ATTACK, Event) ->
    ai_state_attack:on_event(Uid, Event);
on_event(Uid, ?AI_STATE_FLEE, Event) ->
    ai_state_flee:on_event(Uid, Event);
on_event(Uid, ?AI_STATE_RETURN, Event) ->
    ai_state_return:on_event(Uid, Event);
on_event(_Uid, _AiState, _Event) ->
    ok.

