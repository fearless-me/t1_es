%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 21. 六月 2018 16:02
%%%-------------------------------------------------------------------
-author("mawenhong").

-ifndef(AI_DEF_HRL).
-define(AI_DEF_HRL, true).
-compile(nowarn_deprecated_type).

%%-------------------------------------------------------------------
%% AI状态
-define(AIST_Null,	    0).	%% 没有
-define(AIST_Idle,	    1).	%% 空闲状态
-define(AIST_Pursue,	1).	%% 追击状态
-define(AIST_Attack,	2).	%% 攻击状态
-define(AIST_Flee,	    3).	%% 逃跑状态
-type ai_state_type() :: ?AIST_Null .. ?AIST_Flee.

%%-------------------------------------------------------------------
%% AI类型
-define(AIAT_Null,	    0). %% 没有
-define(AIAT_Passive,	1). %% 被动型
-define(AIAT_Active,	2). %% 主动型
-define(AIAT_Barbett,	3). %% 炮塔型
-define(AIAT_Lamster,	4). %% 逃跑型
-type ai_action_type() :: ?AIAT_Null .. ?AIAT_Lamster.

%%-------------------------------------------------------------------
%% AI数据
-define(EACT_NoAI		, 0). %%无AI数据
-define(EACT_Indicate	, 1). %%指定
-define(EACT_Random		, 2). %%完全随机
-define(EACT_GroupRandom, 3). %%在组ID范围内随机
-type ai_create_type() :: ?EACT_NoAI..?EACT_GroupRandom.

%%-------------------------------------------------------------------
%% 巡逻类型
-define(ECPT_Wood  , 0).% 站立
-define(ECPT_Range , 1).% 自由
-define(ECPT_Path  , 2).% 路径
-type ai_patrol_type() :: ?ECPT_Wood..?ECPT_Path.

-define(TICK_TIME, 200).
-define(TICK_PER_SECOND, 1000 div ?TICK_TIME).
-define(AI_PATROL_REST_TICK_MIN,      5 *  ?TICK_PER_SECOND).		%% 生物巡逻过程中休息的最小时间——5秒
-define(AI_PATROL_REST_TICK_INTERVAL, 10 * ?TICK_PER_SECOND).		%% 生物巡逻过程中休息的最大差——10秒
-define(AI_LOOK_FOR_ENEMY_TICK_MIN,		1 * ?TICK_PER_SECOND).		%% 生物锁敌的间隔的最小时间——1秒
-define(AI_LOOK_FOR_ENEMY_TICK_INTERVAL,	2 * ?TICK_PER_SECOND).		%%		 生物索敌的间隔的最大时间差——2秒
-define(AI_LOCK_TARGET_MIN_TICK,	    6 * ?TICK_PER_SECOND).		%%  生物攻击时锁定目标的最小时间——6秒
-define(AI_LOCK_TARGET_TICK_INTERVAL,	4 * ?TICK_PER_SECOND).		%%  生物攻击时锁定目标的最大时间——4秒

-define(AI_MIN_FLEE_RADIUS, 100).    %% 逃跑最小半径
-define(AI_MAX_FLEE_RADIUS, 200).    %% 逃跑最大半径
-define(AI_RANGE_FLEE_RADIUS, ?AI_MAX_FLEE_RADIUS - ?AI_MIN_FLEE_RADIUS).

-define(AI_RETURN_TICK, 10 * ?TICK_PER_SECOND).		%%  生物在多少秒仇恨没有改变的情况下返回——10秒
-define(AI_PURSUE_XZ_MAX, 50.0).


-define(AI_PATROL_RADIUS, 50).    %% 生物巡逻半径 todo 怪物配置表

-endif.
