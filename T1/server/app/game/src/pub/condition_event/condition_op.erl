%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 17. 九月 2018 17:36
%%%-------------------------------------------------------------------
-module(condition_op).
-author("mawenhong").
-include("condition_event.hrl").

%% API
-export([op/3]).

op(?LOGIC_EQ, P1, P2) ->
    P1 == P2;
op(?LOGIC_GT, P1, P2) ->
    P1 > P2;
op(?LOGIC_LT, P1, P2) ->
    P1 < P2;
op(?LOGIC_GE, P1, P2) ->
    P1 >= P2;
op(?LOGIC_LE, P1, P2) ->
    P1 =< P2;
op(?LOGIC_NE, P1, P2) ->
    not (P1 == P2).

