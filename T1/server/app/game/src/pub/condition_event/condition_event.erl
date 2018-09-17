%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 17. 九月 2018 16:41
%%%-------------------------------------------------------------------
-module(condition_event).
-author("mawenhong").

-include("logger.hrl").
-include("gs_cache.hrl").
-include("condition_event.hrl").
-include("cfg_conditional_event.hrl").

%% API
-export([action/2]).


action(EventID, Params) ->
    Cfg = getCfg:getCfgByArgs(cfg_conditional_event, EventID),
    do_action(Cfg, Params).

%%-------------------------------------------------------------------
do_action([], _Params) ->
    error;
do_action(
    #conditional_eventCfg{
        conditional = Conditions,
        event_true = EventTrue,
        event_false = EventFalse
    }, Params
) ->
    case condition_loop(true, Conditions, Params) of
        true -> event_loop(EventTrue, Params);
        _Any -> event_loop(EventFalse, Params)
    end,
    ok.


%%-------------------------------------------------------------------
%%    [{逻辑关系，主分类，分类的ID，参数1，参数2，参数3}]
condition_loop(Result, [], _Params) ->
    Result;
condition_loop(
    _Result,
    [{?CONDITION_OR, _1, _2, _3, _4, _5} = Condition | Conditions],
    Params
) ->
    case condition_check:check(Condition, Params) of
        true -> true;
        _Any -> condition_loop(false, Conditions, Params)
    end;
condition_loop(
    _Result,
    [{?CONDITION_AND, _1, _2, _3, _4, _5} = Condition | Conditions],
    Params
) ->
    case condition_check:check(Condition, Params) of
        false -> false;
        _Any -> condition_loop(true, Conditions, Params)
    end.

%%-------------------------------------------------------------------
event_loop([], _Params) ->
    skip;
event_loop(Events, Params) ->
    lists:foreach(
        fun(Event) ->
            event_action:action(Event, Params)
        end, Events).

