%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 15. 六月 2018 14:49
%%%-------------------------------------------------------------------
-module(mod_copy).
-author("mawenhong").

-include("logger.hrl").
-include("map_core.hrl").

-define(START_TIME, copy_start_time).
-define(STATE_TIME, copy_state_time).
-define(STATE_KEY, copy_state).
-define(EVENT_LIST, copy_event_list).
%%
-define(COPY_STATE_INIT, init).
-define(COPY_STATE_WAIT, wating).
-define(COPY_STATE_READY, ready).
-define(COPY_STATE_RUNNING, running).
-define(COPY_STATE_FINISH, finish).
-define(COPY_STATE_DESTROY, destroy).



%% API
-export([init/1, tick/0]).
-export([player_enter_event/1, player_leave_event/1, set_finish_flag/0]).


%%-------------------------------------------------------------------
tick() ->
    do_tick(get_state()).

do_tick(?COPY_STATE_WAIT) ->
    wait();
do_tick(?COPY_STATE_READY) ->
    ready();
do_tick(?COPY_STATE_RUNNING) ->
    running();
do_tick(?COPY_STATE_FINISH) ->
    finish();
do_tick(?COPY_STATE_DESTROY) ->
    destroy();
do_tick(_) ->
    ok.

%%-------------------------------------------------------------------
init(_OwnerList) ->
    set_start_time(),
    ?DEBUG("copymap map_~p_~p|~p init",
        [map_rw:map_id(), map_rw:line_id(), self()]),
    ok.

%%-------------------------------------------------------------------
wait()->
    case map_rw:is_all_enterd() of
        true -> set_state(?COPY_STATE_READY);
        _Any -> skip
    end.

%%-------------------------------------------------------------------
ready() ->
    set_event_list([]),
    ?DEBUG("copymap map_~p_~p|~p ready",
        [map_rw:map_id(), map_rw:line_id(), self()]),
    ok.

%%-------------------------------------------------------------------
running() ->
    List = parallel_event(get_event_list()),
    set_event_list(List).

parallel_event([]) ->
    [];
parallel_event(List) ->
    [single_seq_event(Events) || Events <- List, Events =/= []].

single_seq_event([]) ->
    [];
single_seq_event([EventCondition | Left] = List) ->
    case condition_action:check(EventCondition, [map,self()], #{}) of
        true ->
            condition_event:action(EventCondition, [map,self()], #{}),
            Left;
        _Any ->
            List
    end.

%%-------------------------------------------------------------------
finish() ->
    ?DEBUG("copymap map_~p_~p|~p finish",
        [map_rw:map_id(), map_rw:line_id(), self()]),
    ok.

%%-------------------------------------------------------------------
destroy() ->
    ?DEBUG("copymap map_~p_~p|~p destroy",
        [map_rw:map_id(), map_rw:line_id(), self()]),
    ok.

%%-------------------------------------------------------------------
player_enter_event(_Uid) ->
    ok.

player_leave_event(_Uid) ->
    ok.

%%-------------------------------------------------------------------
set_finish_flag() ->
    ?WARN("copymap map_~p_~p|~p set_finish_flag",
        [map_rw:map_id(), map_rw:line_id(), self()]),
    ok.

%%-------------------------------------------------------------------
%%-------------------------------------------------------------------
set_state(State) ->
    erlang:put(?STATE_TIME, misc_time:milli_seconds()),
    erlang:put(?STATE_KEY, State).

get_state() ->
    erlang:get(?STATE_KEY).


set_start_time() ->
    erlang:put(?START_TIME, misc_time:milli_seconds()).

get_start_time() ->
    erlang:get(?START_TIME).

set_event_list(List) ->
    erlang:put(?EVENT_LIST, List).

get_event_list() ->
    erlang:get(?EVENT_LIST).