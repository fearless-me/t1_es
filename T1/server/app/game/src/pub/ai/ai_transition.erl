%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 21. 六月 2018 16:20
%%%-------------------------------------------------------------------
-module(ai_transition).
-author("mawenhong").
-include("logger.hrl").
-include("ai.hrl").

%% API
-export([transition/2]).


%%
transition(Uid, ?AI_PASSIVE) ->
    ai_transition_passive:transition(Uid);
%%
transition(Uid, ?AI_ACTIVE) ->
    ai_transition_active:transition(Uid);
%%
transition(Uid, ?AI_BARBETT) ->
    ai_transition_barbett:transition(Uid);
%%
transition(Uid, ?AI_LAMSTER) ->
    ai_transition_lamster:transition(Uid);
%%
transition(_Uid, _Type) -> ?AI_NULL.
