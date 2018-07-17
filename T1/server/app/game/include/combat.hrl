%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 12. 七月 2018 9:46
%%%-------------------------------------------------------------------
-author("mawenhong").

-ifndef(COMBAT_HRL).
-define(COMBAT_HRL, true).


%% 角色HP变化原因

-define(RHPCC_SkillDamage, 0). %% 技能伤害引起
-define(RHPCC_BuffDamage,  1). %% Buff伤害引起
-define(RHPCC_Other,	   2). %% 其它原因
-type hp_change_cause() ::   ?RHPCC_SkillDamage ..  ?RHPCC_Other.


%% 角色死亡原因
-define(ERDC_Skill,	0). %% 技能伤害引起
-define(ERDC_Buff,	1). %% Buff伤害引起
-define(ERDC_Other,	2). %% 其它原因
-type dead_cause() :: ?ERDC_Skill .. ?ERDC_Other.


%% 命中目标原因
-define(EHTC_Skill,	0).	%% 使用技能
-define(EHTC_Item,	1).	%% 使用物品
-type hit_cause() :: ?EHTC_Skill .. ?EHTC_Item.

%% 技能结果
-define(ESR_Dodge,	    0).	%% 闪避
-define(ESR_Critical,	1).	%% 暴击
-define(ESR_Blocked,	2).	%% 格挡
-type skill_result() :: ?ESR_Dodge .. ?ESR_Blocked.


-define(ESOT_Instant, 1).  %% 瞬发
-define(ESOT_Channel, 2).  %% 引导
-define(ESOT_Spell, 3).    %% 吟唱
-type skill_optype() :: ?ESOT_Instant ..  ?ESOT_Spell.


-endif.
