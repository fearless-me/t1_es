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
-include("gs_ai_inc.hrl").

%% API
-export([
    on_enter/2, on_exit/2, update/2, on_event/3
]).

%%-------------------------------------------------------------------
-spec on_enter(Uid :: integer(), AiState :: ai_state_type()) -> ok.
on_enter(Uid, ?AIST_Idle) ->
    ai_state_idle:on_enter(Uid);
on_enter(Uid, ?AIST_Pursue) ->
    ai_state_pursue:on_enter(Uid);
on_enter(Uid, ?AIST_Attack) ->
    ai_state_attack:on_enter(Uid);
on_enter(Uid, ?AIST_Flee) ->
    ai_state_flee:on_enter(Uid);
on_enter(_Uid, _AiState) ->
    ok.

%%-------------------------------------------------------------------
-spec on_exit(Uid :: integer(), AiState :: ai_state_type()) -> ok.
on_exit(Uid, ?AIST_Idle) ->
    ai_state_idle:on_exit(Uid);
on_exit(Uid, ?AIST_Pursue) ->
    ai_state_pursue:on_exit(Uid);
on_exit(Uid, ?AIST_Attack) ->
    ai_state_attack:on_exit(Uid);
on_exit(Uid, ?AIST_Flee) ->
    ai_state_flee:on_exit(Uid);
on_exit(_Uid, _AiState) ->
    ok.


%%-------------------------------------------------------------------
-spec update(Uid :: integer(), AiState :: ai_state_type()) -> ok.
update(Uid, ?AIST_Idle) ->
    ai_state_idle:update(Uid);
update(Uid, ?AIST_Pursue) ->
    ai_state_pursue:update(Uid);
update(Uid, ?AIST_Attack) ->
    ai_state_attack:update(Uid);
update(Uid, ?AIST_Flee) ->
    ai_state_flee:update(Uid);
update(_Uid, _AiState) ->
    ok.

%%-------------------------------------------------------------------
-spec on_event(Uid :: integer(), AiState :: ai_state_type(), Event::integer()) -> ok.
on_event(Uid, ?AIST_Idle, Event) ->
    ai_state_idle:on_event(Uid, Event);
on_event(Uid, ?AIST_Pursue, Event) ->
    ai_state_pursue:on_event(Uid, Event);
on_event(Uid, ?AIST_Attack, Event) ->
    ai_state_attack:on_event(Uid, Event);
on_event(Uid, ?AIST_Flee, Event) ->
    ai_state_flee:on_event(Uid, Event);
on_event(_Uid, _AiState, _Event) ->
    ok.

