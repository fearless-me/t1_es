%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 17. 九月 2018 10:25
%%%-------------------------------------------------------------------
-module(condition_check).
-author("mawenhong").
-include("logger.hrl").
-include("pub_def.hrl").
-include("condition_event.hrl").
-include("cfg_conditional_event.hrl").

%% API
-export([check/2]).


%%    [{逻辑关系，主分类，分类的ID，参数1，参数2，参数3}]
check(Condition, Params) ->
    dispatch(Condition, Params).

%%-------------------------------------------------------------------
%% 参数1：	对象	1.自身 2.目标
%% 参数2：	百分比（float）
%% 参数3：	逻辑	1.等于 2.大于 3.小于
dispatch({_1, ?CONDITION_PLAYER, ?CONDITION_PLAYER_SUB_HP_PERCENT, _P1, P2, P3},[Uid]) ->
    Percent = player_interface:get_hp_percent(Uid),
    condition_op:op(P3, Percent, P2);

%%-------------------------------------------------------------------
%% 参数1：	对象	1.自身 2.目标
%% 参数2：	值（int）
%% 参数3：	逻辑	1.等于 2.大于 3.小于
dispatch({_1, ?CONDITION_PLAYER, ?CONDITION_PLAYER_SUB_HP_PERCENT, _P1, P2, P3},[Uid]) ->
    Hp = player_interface:get_hp(Uid),
    condition_op:op(P3, Hp, P2);

%%-------------------------------------------------------------------
dispatch(_Condition, _Params) ->
    false.

