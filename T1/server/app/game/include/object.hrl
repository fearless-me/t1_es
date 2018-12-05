%%%-------------------------------------------------------------------
%%% @author tiancheng
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 29. 十一月 2018 15:02
%%%-------------------------------------------------------------------
-author("tiancheng").

-ifndef(OBJECT_HRL__).
-define(OBJECT_HRL__, true).

-include("battle_prop.hrl").

%% todo 此处应该根据配置计算，临时用写死的宏计算
%% 第一位为主职业，第二位为转职次数，第三位为该转职下第几个职业，非职业技能填0
-define(CAREER_START,   0).
-define(CAREER_1,       1). %% 小红帽
-define(CAREER_2,       2). %% 双马尾
-define(CAREER_END,     3).
-type careerType() :: ?CAREER_START .. ?CAREER_END.

%% 主职业
-define(CAREER_MAIN(Career), erlang:trunc(Career div 100)).

%% 详细职业
-define(CAREER_DETAIL(MainCareer, TransferTimes, SubCareerIndex),
    MainCareer * 100 + TransferTimes * 10 + SubCareerIndex).

-define(Career_1_2, [
    {?BP_1_STR, [{?BP_2_HP_MAX, 2.0}, {?BP_2_MP_MAX, 1.0}, {?BP_2_ATK, 3.0}, {?BP_2_DEF, 1.0}]},
    {?BP_1_AGI, [{?BP_2_HP_MAX, 0.0}, {?BP_2_MP_MAX, 0.0}, {?BP_2_ATK, 1.0}, {?BP_2_DEF, 0.0}]},
    {?BP_1_INT, [{?BP_2_HP_MAX, 0.0}, {?BP_2_MP_MAX, 2.0}, {?BP_2_ATK, 0.0}, {?BP_2_DEF, 0.0}]},
    {?BP_1_STA, [{?BP_2_HP_MAX, 3.0}, {?BP_2_MP_MAX, 1.0}, {?BP_2_ATK, 0.0}, {?BP_2_DEF, 2.0}]}
]).
-define(Career_1_3, [
    {?BP_1_STR, [{?BP_3_HIT, 1.0}, {?BP_3_FLEE, 0.0}, {?BP_3_CRI, 1.0}, {?BP_3_FAST, 0.0}]},
    {?BP_1_AGI, [{?BP_3_HIT, 2.0}, {?BP_3_FLEE, 2.0}, {?BP_3_CRI, 2.0}, {?BP_3_FAST, 2.0}]},
    {?BP_1_INT, [{?BP_3_HIT, 1.0}, {?BP_3_FLEE, 0.0}, {?BP_3_CRI, 0.0}, {?BP_3_FAST, 0.0}]},
    {?BP_1_STA, [{?BP_3_HIT, 0.0}, {?BP_3_FLEE, 0.0}, {?BP_3_CRI, 0.0}, {?BP_3_FAST, 0.0}]}
]).
-define(Career_2_2, [
    {?BP_1_STR, [{?BP_2_HP_MAX, 1.0}, {?BP_2_MP_MAX, 0.0}, {?BP_2_ATK, 1.0}, {?BP_2_DEF, 1.0}]},
    {?BP_1_AGI, [{?BP_2_HP_MAX, 0.0}, {?BP_2_MP_MAX, 0.0}, {?BP_2_ATK, 1.0}, {?BP_2_DEF, 0.0}]},
    {?BP_1_INT, [{?BP_2_HP_MAX, 0.0}, {?BP_2_MP_MAX, 3.0}, {?BP_2_ATK, 3.0}, {?BP_2_DEF, 0.0}]},
    {?BP_1_STA, [{?BP_2_HP_MAX, 3.0}, {?BP_2_MP_MAX, 0.0}, {?BP_2_ATK, 0.0}, {?BP_2_DEF, 2.0}]}
]).
-define(Career_2_3, [
    {?BP_1_STR, [{?BP_3_HIT, 1.0}, {?BP_3_FLEE, 0.0}, {?BP_3_CRI, 0.0}, {?BP_3_FAST, 0.0}]},
    {?BP_1_AGI, [{?BP_3_HIT, 1.0}, {?BP_3_FLEE, 2.0}, {?BP_3_CRI, 1.0}, {?BP_3_FAST, 1.0}]},
    {?BP_1_INT, [{?BP_3_HIT, 2.0}, {?BP_3_FLEE, 0.0}, {?BP_3_CRI, 3.0}, {?BP_3_FAST, 2.0}]},
    {?BP_1_STA, [{?BP_3_HIT, 0.0}, {?BP_3_FLEE, 0.0}, {?BP_3_CRI, 0.0}, {?BP_3_FAST, 0.0}]}
]).

-define(Career2List, [
    {?CAREER_1, ?Career_1_2, ?Career_1_3},
    {?CAREER_2, ?Career_2_2, ?Career_2_3}
]).


-endif.