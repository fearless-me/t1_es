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
-include("inc_ai.hrl").

%% API
-export([transition/2]).


%%
transition(Uid, ?AIAT_Passive) ->
    ai_transition_passive:transition(Uid);
%%
transition(Uid, ?AIAT_Active) ->
    ai_transition_active:transition(Uid);
%%
transition(Uid, ?AIAT_Barbett) ->
    ai_transition_barbett:transition(Uid);
%%
transition(Uid, ?AIAT_Lamster) ->
    ai_transition_lamster:transition(Uid);
%%
transition(_Uid, _Type) ->
    ?AIST_Null.
