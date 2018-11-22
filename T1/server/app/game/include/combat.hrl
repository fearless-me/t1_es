%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 12. 七月 2018 9:46
%%%-------------------------------------------------------------------
-author("mawenhong").

-ifndef(GS_COMBAT_INC_HRL).
-define(GS_COMBAT_INC_HRL, true).

-include("battle_prop.hrl").    %% 属性定义

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
-define(HP_CHANGE_OTHER, 2). %% 其它原因



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


 -define(BUFF_FOREVER_LOGIC, 2147483647).
-record(m_buff, {buff_id = 0, lifetime = 0, level = 1, layer = 1, source = 0, latest=0}).

%%-------------------------------------------------------------------
%% buff类型
%%-------------------------------------------------------------------

%% 增益buff
-define(BUFF_ENBUFF, 0).
%% 减益buff
-define(BUFF_DEBUFF, 1).
-define(BUFF_UNKNOWN,2).

-define(BUFF_SOURCE_COEXIST, 0).
-define(BUFF_SOURCE_REPLACE, 1).


-define(BUFF_REMOVE_DEATH, death).
-define(BUFF_REMOVE_LEAVE_MAP, leave).


%%-------------------------------------------------------------------
-define(STATE_DEAD, 1).      %% 死亡
-define(STATE_DIZZY, 2).     %% 眩晕
-define(STATE_TIE, 3).       %% 定身
-define(STATE_SPOR, 4).      %% 昏睡
-define(STATE_INVINCIBLE, 5).%% 无敌
-define(STATE_LURK, 6).      %% 隐身




-endif.
