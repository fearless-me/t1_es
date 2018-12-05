%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 21. 六月 2018 16:02
%%%-------------------------------------------------------------------
-author("mawenhong").

-ifndef(GS_AI_INC_HRL).
-define(GS_AI_INC_HRL, true).
-compile(nowarn_deprecated_type).

-include("map_core.hrl").

%%-------------------------------------------------------------------
%% AI状态
-define(AI_STATE_NULL,   0).  %% 没有
-define(AI_STATE_IDLE,   1).  %% 空闲状态
-define(AI_STATE_PURSUE, 1).  %% 追击状态
-define(AI_STATE_ATTACK, 2).  %% 攻击状态
-define(AI_STATE_FLEE,   3).  %% 逃跑状态
-define(AI_STATE_RETURN, 4).  %% 返回状态
-define(AI_STATE_MAX, 4).

-type ai_state_type() :: ?AI_STATE_NULL .. ?AI_STATE_MAX.
-export_type([ai_state_type/0]).

%%-------------------------------------------------------------------
%% AI类型
-define(AI_NULL, 0). %% 没有
-define(AI_PASSIVE, 1). %% 被动型
-define(AI_ACTIVE, 2). %% 主动型
-define(AI_BARBETT, 3). %% 炮塔型
-define(AI_LAMSTER, 4). %% 逃跑型
-type ai_type() :: ?AI_NULL .. ?AI_LAMSTER.
-export_type([ai_type/0]).


%%-------------------------------------------------------------------
%% AI数据
-define(AI_INIT_NULL, 0). %%无AI数据
-define(AI_INIT_INDICATE, 1). %%指定
-define(AI_INIT_RANDOM, 2). %%完全随机
-define(AI_INIT_GROUP_RANDOM, 3). %%在组ID范围内随机
-type ai_init_type() :: ?AI_INIT_NULL..?AI_INIT_GROUP_RANDOM.
-export_type([ai_init_type/0]).

%%-------------------------------------------------------------------
%% 巡逻类型
-define(AI_PATROL_WOOD, 0).% 站立
-define(AI_PATROL_RANGE, 1).% 自由
-define(AI_PATROL_PATH, 2).% 路径
-type ai_patrol_type() :: ?AI_PATROL_WOOD..?AI_PATROL_PATH.
-export_type([ai_patrol_type/0]).

-define(TICK_TIME, ?MAP_TICK).
-define(TICK_PER_SECOND, (1000 div ?TICK_TIME)).
-define(AI_PATROL_REST_TICK_MIN, 5 * ?TICK_PER_SECOND).        %% 生物巡逻过程中休息的最小时间——5秒
-define(AI_PATROL_REST_TICK_INTERVAL, 10 * ?TICK_PER_SECOND).        %% 生物巡逻过程中休息的最大差——10秒
-define(AI_LOOK_FOR_ENEMY_TICK_MIN, 1 * ?TICK_PER_SECOND).        %% 生物锁敌的间隔的最小时间——1秒
-define(AI_LOOK_FOR_ENEMY_TICK_INTERVAL, 2 * ?TICK_PER_SECOND).        %%		 生物索敌的间隔的最大时间差——2秒
-define(AI_LOCK_TARGET_MIN_TICK, 6 * ?TICK_PER_SECOND).        %%  生物攻击时锁定目标的最小时间——6秒
-define(AI_LOCK_TARGET_TICK_INTERVAL, 4 * ?TICK_PER_SECOND).        %%  生物攻击时锁定目标的最大时间——4秒

-define(AI_MIN_FLEE_RADIUS, 100).    %% 逃跑最小半径
-define(AI_MAX_FLEE_RADIUS, 200).    %% 逃跑最大半径
-define(AI_RANGE_FLEE_RADIUS, ?AI_MAX_FLEE_RADIUS - ?AI_MIN_FLEE_RADIUS).

-define(AI_RETURN_TICK, 10 * ?TICK_PER_SECOND).        %%  生物在多少秒仇恨没有改变的情况下返回——10秒
-define(AI_PURSUE_XZ_MAX, 50.0).


%% 仇恨数据：仇恨目标UID， 仇恨值， 是否激活
-record(m_unit_enmity, {uid = 0, enmity = 0, active = true}).


%% 触发器事件类型

-define(ETEE_Null, 0).%%
-define(ETEE_Use, 1).%% 使用：物品使用，主动技能使用
-define(ETEE_Equip, 2).%% 装备：装备装备时
-define(ETEE_BeAttacked, 3).%% 被攻击：某些被动技能触发，装备buff触发，AI触发
-define(ETEE_Hit, 4).%% 命中：主动技能命中目标时触发，被动技能和装备触发
-define(ETEE_Hited, 5).%% 被命中：被动技能和装备触发，AI触发
-define(ETEE_Dodged, 6).%% 被闪避：主动技能被目标闪避时触发，被动技能或装备被闪避时触发
-define(ETEE_Dodge, 7).%% 闪避：闪避了攻击时触发
-define(ETEE_Blocked, 8).%% 被格挡：主动技能被目标闪避时触发，被动技能或装备被闪避时触发
-define(ETEE_Block, 9).%% 格挡：格挡了攻击时触发
-define(ETEE_Crit, 10).%% 致命：主动技能产生暴击时触发，被动技能和装备触发
-define(ETEE_Crited, 11).%% 被致命：被暴击时触发
-define(ETEE_Die, 12).%% 死亡：死亡时触发，某些被动技能和装备会触发，AI触发
-define(ETEE_Random, 13).%% 随机：被动技能或者装备触发，AI触发
-define(ETEE_InterCombat, 20).%% 进入备战状态：这个是AI的
-define(ETEE_DetectTarget, 21).%% 发现目标：AI的
-define(ETEE_InterCombatTime, 22).%% 进入战斗：AI的
-define(ETEE_InterCombatInterTime, 23).%% 进入战斗每隔一定时间：AI的  ?????
-define(ETEE_TeammateDie, 24).%% 队友死亡：AI的
-define(ETEE_Attack, 25).%% 攻击：某些被动技能触发，装备buff触发
-define(ETEE_Kill, 26).%% 击杀：某些被动技能触发，装备buff触发
-type trigger_event() :: ?ETEE_Null ..  ?ETEE_Kill.

%% 触发器状态条件
-define(ETST_Null, 0). %%
-define(ETST_HPLower, 1). %% 体力低于
-define(ETST_HPHigher, 2). %% 体力高于
-define(ETST_MPLower, 3). %% 真气低于
-define(ETST_MPHigher, 4). %% 真气高于
-define(ETST_RageLower, 5). %% 怒气低于
-define(ETST_RageHigher, 6). %% 怒气高于
-define(ETST_SelfHaveBuff, 7). %% 自身拥有某状态
-define(ETST_TargetHaveBuff, 8). %%目标拥有某状态
-define(ETST_EnduranceLower, 9). %%持久力低于
-define(ETST_EnduranceHigher, 10). %%持久力高于
-define(ETST_Distance, 11). %%和攻击目标的距离是否在某一范围之内
-type trigger_state() :: ?ETST_Null ..   ?ETST_Distance.


-define(CFE_NULL, 0). %% 没有目标
-define(CFE_Self, 1). %% 自己
-define(CFE_CurPlayer, 2). %% 怪物的当前目标玩家
-define(CFE_RandPlayer, 3). %% 怪物仇恨列表内随机一个玩家
-define(CFE_MinEnimty, 4). %% 怪物仇恨列表内仇恨最小的玩家
-type trigger_target() :: ?CFE_NULL .. ?CFE_MinEnimty.

-record(ai_cfg,{
    id = 0, ai_type, group_id,
    buff_list, trigger_list
}).

-record(ai_trigger_cfg, {
    id, event :: trigger_event(), event_misc1, event_misc2, %% misc 会触发频率， 触发最大次数
    prob, state :: trigger_state(), state_misc1, state_misc2}).
-record(m_ai_trigger, {
    is_active = false, active_tick = 0, trigger_times = 0, skill_id, target_type :: trigger_target(), cfg_id = 0
}).


-record(monster_cfg,{
    id=0,
    patrol_type = ?AI_PATROL_RANGE :: ai_patrol_type(),
    patrol_radius = 10,
    ai_init_type = ?AI_INIT_INDICATE :: ai_init_type(),
    ai_id = 1,
    ai_type = ?AI_PASSIVE :: ai_type()
}).

-define(get_monster_cfg(Id), #monster_cfg{id = Id}).
-define(get_ai_cfg(Id), #ai_cfg{id = id}).

-endif.
