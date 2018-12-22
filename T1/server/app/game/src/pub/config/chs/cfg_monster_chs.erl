%% coding: latin-1
%% This File Is AUTO GENERATED, Don't Modify it MANUALLY!!!
-module(cfg_monster_chs).
-author("tiancheng").

-compile(export_all).

-include("cfg_monster.hrl").
-include("logger.hrl").
-include("battle_prop.hrl").

%% 怪物配置表

%%-----------------------------------Fields Note-----------------------------------
	%% desc__:
	%% 行描述

	%% id:
	%% 怪物备份ID

	%% name:
	%% 显示使用名称

	%% title:
	%% 显示使用称号

	%% describe:
	%% 怪物的基础描述

	%% icon:
	%% 头像

	%% level:
	%% 怪物等级

	%% type:
	%% 怪物品质类型
	%% 1.普通
	%% 2.头目
	%% 3.精英
	%% 4.BOSS

	%% sub_type:
	%% 怪物子类型
	%% 1.普通野怪
	%% 2.副本普通怪
	%% 3.精英
	%% 4.BOSS

	%% camp:
	%% 阵营
	%% 1.敌对
	%% 2.中立
	%% 3.友好

	%% buff_born:
	%% 出生BUFF组，怪物创建时附带

	%% ai:
	%% 特殊AI（AI脚本，填0为默认AI）

	%% attack_type:
	%% AI攻击类型
	%% 1.被动攻击
	%% 2.主动攻击
	%% 3.炮塔

	%% move_type:
	%% 移动类型
	%% 1.站立不动
	%% 2.自由巡逻
	%% 3.指定路径巡逻

	%% alerting_area:
	%% 警戒范围，主动怪生效，进入该范围将进入战斗

	%% guarding_area:
	%% 巡逻范围，进入范围加入仇恨列表

	%% guarding_speed:
	%% 巡逻时的移动速度

	%% pursuing_area:
	%% 追击范围，超过范围脱战不追击

	%% pursuing_speed:
	%% 追击速度，进入战斗后的移动速度

	%% recover_takeoff:
	%% 是否脱战回血
	%% 1.脱战不回血
	%% 2.脱战缓慢回血

	%% dropId:
	%% 掉落组ID

	%% model:
	%% 模型资源

	%% animation_born:
	%% 出生动画

	%% animation_death:
	%% 死亡动画

	%% sound_death:
	%% 死亡音效

	%% strength_id:
	%% 标准强度ID

	%% coefficient_hp:
	%% 血量系数

	%% coefficient_defense:
	%% 防御系数

	%% coefficient_attack:
	%% 攻击系数

	%% coefficient_critical:
	%% 暴击系数

	%% coefficient_hit:
	%% 命中系数

	%% coefficient_dodge:
	%% 闪避系数

	%% coefficient_quickness:
	%% 急速系数

	%% skill_attack1:
	%% 普通攻击1

	%% skill_attack2:
	%% 普通攻击2

	%% skill_id1:
	%% 技能1技能ID

	%% skill_condition1:
	%% 技能1释放条件类型

	%% skill_condition_param1:
	%% 技能1释放条件参数

	%% skill_target_type1:
	%% 技能1释放选择目标类型
	%% 1.仇恨最高
	%% 2.距离最近
	%% 3.抽取列表中随机一个
	%% 4.自己
	%% 5.随机友方

	%% skill_id2:
	%% 技能2技能ID

	%% skill_condition2:
	%% 技能2释放条件类型

	%% skill_condition_param2:
	%% 技能2释放条件参数

	%% skill_target_type2:
	%% 技能2释放选择目标类型
	%% 1.仇恨最高
	%% 2.距离最近
	%% 3.抽取列表中随机一个
	%% 4.自己
	%% 5.随机友方

	%% skill_id3:
	%% 技能3技能ID

	%% skill_condition3:
	%% 技能3释放条件类型

	%% skill_condition_param3:
	%% 技能3释放条件参数

	%% skill_target_type3:
	%% 技能3释放选择目标类型
	%% 1.仇恨最高
	%% 2.距离最近
	%% 3.抽取列表中随机一个
	%% 4.自己
	%% 5.随机友方

	%% skill_id4:
	%% 技能4技能ID

	%% skill_condition4:
	%% 技能4释放条件类型

	%% skill_condition_param4:
	%% 技能4释放条件参数

	%% skill_target_type4:
	%% 技能4释放选择目标类型
	%% 1.仇恨最高
	%% 2.距离最近
	%% 3.抽取列表中随机一个
	%% 4.自己
	%% 5.随机友方

	%% skill_id5:
	%% 技能5技能ID

	%% skill_condition5:
	%% 技能5释放条件类型

	%% skill_condition_param5:
	%% 技能5释放条件参数

	%% skill_target_type5:
	%% 技能5释放选择目标类型
	%% 1.仇恨最高
	%% 2.距离最近
	%% 3.抽取列表中随机一个
	%% 4.自己
	%% 5.随机友方

	%% born_event:
	%% 出生事件

	%% death_event:
	%% 死亡事件
%%---------------------------------------------------------------------------------

getRow(_) -> {}.

getKeyList() -> [

].

get1KeyList() -> [

].

