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
%% todo 职业定义，临时，可能用三位自然数表示
-define(Career_1,   1). %% 临时定义职业_战士
-define(Career_2,   2). %% 临时定义职业_法师
-define(Career_3,   3). %% 临时定义职业_刺客
-define(Career_4,   4). %% 临时定义职业_骑士


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
-define(Career_3_2, [
    {?BP_1_STR, [{?BP_2_HP_MAX, 0.0}, {?BP_2_MP_MAX, 0.0}, {?BP_2_ATK, 2.0}, {?BP_2_DEF, 1.0}]},
    {?BP_1_AGI, [{?BP_2_HP_MAX, 0.0}, {?BP_2_MP_MAX, 2.0}, {?BP_2_ATK, 3.0}, {?BP_2_DEF, 0.0}]},
    {?BP_1_INT, [{?BP_2_HP_MAX, 0.0}, {?BP_2_MP_MAX, 2.0}, {?BP_2_ATK, 0.0}, {?BP_2_DEF, 0.0}]},
    {?BP_1_STA, [{?BP_2_HP_MAX, 3.0}, {?BP_2_MP_MAX, 0.0}, {?BP_2_ATK, 0.0}, {?BP_2_DEF, 2.0}]}
]).
-define(Career_3_3, [
    {?BP_1_STR, [{?BP_3_HIT, 0.0}, {?BP_3_FLEE, 0.0}, {?BP_3_CRI, 0.0}, {?BP_3_FAST, 0.0}]},
    {?BP_1_AGI, [{?BP_3_HIT, 3.0}, {?BP_3_FLEE, 3.0}, {?BP_3_CRI, 3.0}, {?BP_3_FAST, 2.0}]},
    {?BP_1_INT, [{?BP_3_HIT, 0.0}, {?BP_3_FLEE, 0.0}, {?BP_3_CRI, 2.0}, {?BP_3_FAST, 0.0}]},
    {?BP_1_STA, [{?BP_3_HIT, 0.0}, {?BP_3_FLEE, 0.0}, {?BP_3_CRI, 0.0}, {?BP_3_FAST, 0.0}]}
]).
-define(Career_4_2, [
    {?BP_1_STR, [{?BP_2_HP_MAX, 2.0}, {?BP_2_MP_MAX, 0.0}, {?BP_2_ATK, 2.0}, {?BP_2_DEF, 3.0}]},
    {?BP_1_AGI, [{?BP_2_HP_MAX, 0.0}, {?BP_2_MP_MAX, 2.0}, {?BP_2_ATK, 1.0}, {?BP_2_DEF, 0.0}]},
    {?BP_1_INT, [{?BP_2_HP_MAX, 0.0}, {?BP_2_MP_MAX, 2.0}, {?BP_2_ATK, 0.0}, {?BP_2_DEF, 0.0}]},
    {?BP_1_STA, [{?BP_2_HP_MAX, 3.0}, {?BP_2_MP_MAX, 0.0}, {?BP_2_ATK, 1.0}, {?BP_2_DEF, 3.0}]}
]).
-define(Career_4_3, [
    {?BP_1_STR, [{?BP_3_HIT, 1.0}, {?BP_3_FLEE, 0.0}, {?BP_3_CRI, 0.0}, {?BP_3_FAST, 0.0}]},
    {?BP_1_AGI, [{?BP_3_HIT, 2.0}, {?BP_3_FLEE, 2.0}, {?BP_3_CRI, 2.0}, {?BP_3_FAST, 1.0}]},
    {?BP_1_INT, [{?BP_3_HIT, 0.0}, {?BP_3_FLEE, 0.0}, {?BP_3_CRI, 0.0}, {?BP_3_FAST, 0.0}]},
    {?BP_1_STA, [{?BP_3_HIT, 0.0}, {?BP_3_FLEE, 0.0}, {?BP_3_CRI, 0.0}, {?BP_3_FAST, 0.0}]}
]).

-define(Career2List, [
    {?Career_1, ?Career_1_2, ?Career_1_3},
    {?Career_2, ?Career_2_2, ?Career_2_3},
    {?Career_3, ?Career_3_2, ?Career_3_3},
    {?Career_4, ?Career_4_2, ?Career_4_3}
]).


-endif.