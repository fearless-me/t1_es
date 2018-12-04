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

%% API
-export([action_all/3, action/3]).

action_all(EventList, Params,
    #{?CONDITION_EVENT_PARAMS_SP := _SP, ?CONDITION_EVENT_PARAMS_MPT := _MPT} = CEParams)
    when is_list(EventList), is_map(CEParams) ->
    action(EventList, Params, CEParams);
action_all(EventList, Params, CEParams) ->
    ?ERROR("action_all EventList:~p, Params:~p, CEParams:~p, stace:~p",
        [EventList, Params, CEParams, misc:callstack()]),
    skip.

action([Conditions, EventTrue, EventFalse], Params,
    #{?CONDITION_EVENT_PARAMS_SP := _SP, ?CONDITION_EVENT_PARAMS_MPT := _MPT} = CEParams) ->
    case condition_loop(true, Conditions, Params, CEParams) of
        true -> event_loop(EventTrue, Params, CEParams);
        _Any -> event_loop(EventFalse, Params, CEParams)
    end;
action(_Any, _Params, _CEParams) ->
    skip.

%%-------------------------------------------------------------------
%% [[逻辑关系，主分类，分类的ID，参数1，参数2，参数3]]
condition_loop(
    Result,
    [[?CONDITION_OR | _] = Condition | Conditions],
    Params, CEParams
) ->
    Bool = condition_action:check(Condition, Params, CEParams) orelse Result,
    condition_loop(Bool, Conditions, Params, CEParams);
condition_loop(
    Result,
    [[?CONDITION_AND | _] = Condition | Conditions],
    Params, CEParams
) ->
    Bool = condition_action:check(Condition, Params, CEParams) andalso Result,
    condition_loop(Bool, Conditions, Params, CEParams);
condition_loop(Result, [_Condition | Conditions], Params, CEParams) ->
    condition_loop(Result, Conditions, Params, CEParams);
condition_loop(Result, _AnyOther, _Params, _CEParams) ->
    Result.

%%-------------------------------------------------------------------
event_loop([], _Params, _CEParams) -> skip;
event_loop([[]], _Params, _CEParams) -> skip;
event_loop(Events, Params, CEParams) ->
    lists:foreach(
        fun
            ([]) ->
                skip;
            (Event) ->
                event_action:action(Event, Params, CEParams)
        end, Events).

