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

%% 技能操作类型
-define(SKILL_OP_INSTANT, 1).  %% 瞬发
-define(SKILL_OP_CHANNEL, 2).  %% 引导
-define(SKILL_OP_SPELL, 3).    %% 吟唱


%% 技能施法目标
-define(SKILL_CAST_TARGET_SINGLE, 1).
-define(SKILL_CAST_TARGET_DIRECTION, 2).
-define(SKILL_CAST_TARGET_POSITION, 3).
-define(SKILL_CAST_TARGET_FACE_DIR, 4).

%% 技能目标范围类型
-define(SKILL_AREA_TYPE_SINGLE, 1).
-define(SKILL_AREA_TYPE_LINE,   2).
-define(SKILL_AREA_TYPE_CIRCLE, 3).

%%  技能作用目标类型
-define(SKILL_TARGET_PLAYER,  1).
-define(SKILL_TARGET_MONSTER, 2).
-define(SKILL_TARGET_PET,     4).



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
-define(ESR_DODGE, 0).    %% 闪避
-define(ESR_CRITICAL, 1).    %% 暴击
-define(ESR_BLOCKED, 2).    %% 格挡


 -define(BUFF_FOREVER_LOGIC, 2147483647).
-record(m_buff, {buff_id = 0, lifetime = 0, level = 1, wrap = 1, source = 0, latest=0}).
%% fixme 临时定义一个 buff的配置表结构，具体什么样子未知
-record(buffCfg, {
 id=1, group_id=1, effect=0, debuff=1, del_trigger=[],
 del_flag=0, life_time=10, tick_time=10, save_type=1,
 max_layer=99, prop_list=[],
 add_cond_event=[], tick_cond_event=[],
 stop_cond_event=[], break_cond_event=[]
}).



-endif.
