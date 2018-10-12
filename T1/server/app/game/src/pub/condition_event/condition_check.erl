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
%%-include("cfg_conditional_event.hrl").

%% API
-export([check/2]).


check(Condition, OriginalParams) ->
    RealParams = filter_params(Condition, OriginalParams),
    check_action(Condition, RealParams).



%%    [{逻辑关系，主分类，分类的ID，参数1，参数2，参数3}]
%%-------------------------------------------------------------------
%% 参数1：	对象	1.自身 2.目标
%% 参数2：	百分比（float）
%% 参数3：	逻辑	1.等于 2.大于 3.小于
check_action([_1, ?CONDITION_PLAYER, ?CONDITION_PLAYER_SUB_HP_PERCENT, P1, P2, P3], [Aer, Der]) ->
    Tar = ?if_else(P1 == ?TARGET_SELF, Aer, Der),
    Percent = player_interface:get_hp_percent(Tar),
    condition_op:op(P2, Percent, P3);

%%-------------------------------------------------------------------
%% 参数1：	对象	1.自身 2.目标
%% 参数2：	值（int）
%% 参数3：	逻辑	1.等于 2.大于 3.小于
check_action([_1, ?CONDITION_PLAYER, ?CONDITION_PLAYER_SUB_HP, P1, P2, P3], [Aer, Der]) ->
    Tar = ?if_else(P1 == ?TARGET_SELF, Aer, Der),
    Hp = player_interface:get_hp(Tar),
    condition_op:op(P2, Hp, P3);

%%-------------------------------------------------------------------
check_action(_Condition, _Params) ->
    false.

%%-------------------------------------------------------------------
%%-------------------------------------------------------------------
%% 返回真实参数
filter_params(_Event, OriginalParams) ->
    OriginalParams.



