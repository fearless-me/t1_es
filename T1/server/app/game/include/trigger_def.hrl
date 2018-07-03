%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 03. 七月 2018 14:14
%%%-------------------------------------------------------------------
-author("mawenhong").

-ifndef(TRIGGER_DEF_HRL).
-define(TRIGGER_DEF_HRL, true).

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


-record(m_ai_trigger_cfg, {
    id, event :: trigger_event(), event_misc1, event_misc2, %% misc 会触发频率， 触发最大次数
    prob, state :: trigger_state(), state_misc1, state_misc2}).
-record(m_ai_trigger, {
    is_active = false, active_tick = 0, trigger_times = 0, skill_id, target_type :: trigger_target(), cfg_id = 0
}).


-endif.
