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
%%-include("cfg_conditional_event.hrl").

%% 条件事件集合表
-record(conditional_eventCfg, {
    %% 行描述
    desc__,
    
    %% ID
    id,
    
    %% 作用模块
    %% 0：通用
    %% 1：技能
    %% 2：副本
    module,
    
    %% 主类型
    type,
    
    %% 子类型
    subtype,
    
    %% 条件
    conditional,
    
    %% 事件真
    event_true,
    
    %% 事件假
    event_false,
    
    %% 参数列表
    param
}).

%% API
-export([action_all/2, action/2]).


action_all(EventList, Params) when is_list(EventList) ->
    lists:foreach(
        fun(EventID) ->
            condition_event:action(EventID, Params)
        end, EventList),
    ok;
action_all(_EventList, _Params) ->
    skip.


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
%%    [[逻辑关系，主分类，分类的ID，参数1，参数2，参数3]]
condition_loop(Result, [], _Params) ->
    Result;
condition_loop(
    _Result,
    [[?CONDITION_OR | _] = Condition | Conditions],
    Params
) ->
    case condition_check:check(Condition, Params) of
        true -> true;
        _Any -> condition_loop(false, Conditions, Params)
    end;
condition_loop(
    _Result,
    [[?CONDITION_AND | _] = Condition | Conditions],
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

