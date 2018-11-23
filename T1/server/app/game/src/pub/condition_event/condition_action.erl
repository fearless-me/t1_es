%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 17. 九月 2018 10:25
%%%-------------------------------------------------------------------
-module(condition_action).
-author("mawenhong").

-include("logger.hrl").
-include("pub_def.hrl").
-include("condition_event.hrl").
-include("rec_rw.hrl").
-include("battle_prop.hrl").

%% API
-export([check/2]).


-spec check(Condition::list(), OriginalParams::term()) -> boolean().
check([], _OriginalParams) ->
    true;
check(Condition, OriginalParams) ->
    RealParams = filter_params(Condition, OriginalParams),
    check_action(Condition, RealParams).


%%-------------------------------------------------------------------
%% [逻辑关系，主分类，分类的ID，参数1，参数2，参数3]
%%-------------------------------------------------------------------
%% [逻辑关系，角色属性类型，属性ID，对象，条件，值]
check_action([_, ?CONDITION_PLAYER_PROP, PropID, ?TARGET_SELF, Logic, Value],
    [#m_object_rw{uid = Uid}, _]) ->
    condition_action_logic:condition_player_prop(Uid, PropID, Logic, Value);
check_action([_, ?CONDITION_PLAYER_PROP, PropID, ?TARGET_OTHER, Logic, Value],
    [_, #m_object_rw{uid = Uid}]) ->
    condition_action_logic:condition_player_prop(Uid, PropID, Logic, Value);

%% [逻辑关系，BUFF是否存在类型，BUFF区分类型效果，类型参数，是否存在，对象]
check_action([_, ?CONDITION_BUFF_HAS, Cbh, BuffID, ExistOr, ?TARGET_SELF],
    [#m_object_rw{uid = Uid}, _]) ->
    condition_action_logic:condition_buff_has(Uid, Cbh, BuffID, ExistOr);
check_action([_, ?CONDITION_BUFF_HAS, Cbh, BuffID, ExistOr, ?TARGET_OTHER],
    [_, #m_object_rw{uid = Uid}]) ->
    condition_action_logic:condition_buff_has(Uid, Cbh, BuffID, ExistOr);

%%-------------------------------------------------------------------
check_action(_Condition, _Params) -> false.

%%-------------------------------------------------------------------
%%-------------------------------------------------------------------
%% 返回真实参数
filter_params(_Event, OriginalParams) ->
    OriginalParams.



