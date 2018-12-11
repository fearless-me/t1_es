%%%-------------------------------------------------------------------
%%% @author tiancheng
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 29. 十一月 2018 15:31
%%%-------------------------------------------------------------------
-author("tiancheng").

-ifndef(COMBAT_HRL__).
-define(COMBAT_HRL__, true).

-include("battle_prop.hrl").    %% 属性定义

%% 战斗状态持续时间，5秒
-define(BATTLE_STATE_CONTINUE_TIME, 5000).

%% 伤害打击返回结果
-record(m_hit_damage_result, {
    attackBps::#m_battleProps{},    %% 计算后的攻击者属性
    defenseBps::#m_battleProps{},   %% 计算后的防御者属性

    isHit = false,     %% 是否命中
    isCri = false,     %% 是否暴击
    damage = 0,    %% 理论造成的伤害
    deltaHp = 0,   %% 实际的血量变化（会因为血量上下线、取整等原因与理论伤害不同）
    isDead = false     %% 目标是否死亡（可能与当前伤害无关）
}).

%% 技能规划分类
-define(SKILL_MAIN_TYPE_CAREER,      1). %% 职业技能
-define(SKILL_MAIN_TYPE_COMMON,      2). %% 通用技能
-define(SKILL_MAIN_TYPE_MONSTER,     3). %% 怪物技能

%% 技能子类型
-define(SKILL_SUB_TYPE_IT,           1). %% 主动
-define(SKILL_SUB_TYPE_PT,           2). %% 被动

%% 主动技能分类
-define(SKILL_SUB_TYPE_IT_INSTANT,   1). %% 瞬发
-define(SKILL_SUB_TYPE_IT_SPELL,     2). %% 吟唱
-define(SKILL_SUB_TYPE_IT_NORMAL,    3). %% 普攻，普攻也是瞬发

%% 被动技能分类
-define(SKILL_SUB_TYPE_PT_EFFECT,    1). %% 被动效果
-define(SKILL_SUB_TYPE_PT_TRIGGER,   2). %% 被触发类

%% 主动生效分类
-define(SKILL_SUB_TYPE_IT_TAKE_TYPE_NORMAL,      1). %% 正常生效
-define(SKILL_SUB_TYPE_IT_TAKE_TYPE_IMMEDIATELY, 2). %% 立刻生效
-define(SKILL_SUB_TYPE_IT_TAKE_TYPE_CONTINUE,    3). %% 持续施法

%% 技能意图
-define(SKILL_PURPOSE_DEC, 1).  %% 负面
-define(SKILL_PURPOSE_ADD, 2).  %% 增益

%% 技能作用对象类型
-define(SKILL_TARGET_PLAYER,  1). %% 玩家
-define(SKILL_TARGET_MONSTER, 2). %% 怪物
-define(SKILL_TARGET_PET,     3). %% 宠物

%% 技能施法目标
-define(SKILL_CAST_TARGET_SINGLE,    1). %% 单体目标
-define(SKILL_CAST_TARGET_DIRECTION, 2). %% 方向
-define(SKILL_CAST_TARGET_POSITION,  3). %% 指定地点
-define(SKILL_CAST_TARGET_FACE_DIR,  4). %% 自身面向

%% 技能目标范围类型
-define(SKILL_AREA_TYPE_SINGLE, 1). %% 单体目标
-define(SKILL_AREA_TYPE_LINE,   2). %% 线型
-define(SKILL_AREA_TYPE_CIRCLE, 3). %% 圆形





%% 角色HP变化原因
-define(HP_CHANGE_SKILL, 0). %% 技能伤害引起
-define(HP_CHANGE_BUFF, 1). %% Buff伤害引起
-define(HP_CHANGE_EVENT, 2). %% 事件原因



%% 角色死亡原因
-define(DEATH_REASON_SKILL, 0). %% 技能伤害引起
-define(DEATH_REASON_BUFF, 1). %% Buff伤害引起
-define(DEATH_REASON_OTHER, 2). %% 其它原因


%% 命中目标原因
-define(HIT_REASON_SKILL, 0).    %% 使用技能
-define(HIT_REASON_ITEM, 1).    %% 使用物品

%% 技能结果
-define(ESR_NORMAL, 0).    %% 普通
-define(ESR_DODGE, 1).    %% 闪避
-define(ESR_CRITICAL, 2).    %% 暴击
-define(ESR_BLOCKED, 3).    %% 格挡



-endif. % COMBAT_HRL__