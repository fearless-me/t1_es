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
	%% 1.敌对怪物
	%% 2.中立怪物
	%% 3.友好怪物

	%% buff_born:
	%% 出生BUFF组，怪物创建时附带

	%% ai:
	%% AI脚本
	%% 1.攻击仇恨最高目标
	%% 2.随机攻击目标
	%% 3.攻击血量最高目标

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

	%% skill_id2:
	%% 技能2技能ID

	%% skill_condition2:
	%% 技能2释放条件类型

	%% skill_condition_param2:
	%% 技能2释放条件参数

	%% skill_id3:
	%% 技能3技能ID

	%% skill_condition3:
	%% 技能3释放条件类型

	%% skill_condition_param3:
	%% 技能3释放条件参数

	%% skill_id4:
	%% 技能4技能ID

	%% skill_condition4:
	%% 技能4释放条件类型

	%% skill_condition_param4:
	%% 技能4释放条件参数

	%% skill_id5:
	%% 技能5技能ID

	%% skill_condition5:
	%% 技能5释放条件类型

	%% skill_condition_param5:
	%% 技能5释放条件参数

	%% born_event:
	%% 出生事件

	%% death_event:
	%% 死亡事件
%%---------------------------------------------------------------------------------

getRow(1) ->
	#monsterCfg{
		desc__ = "",
		id = 1,
		name = "@@>1000018<",
		title = "@@>1000019<",
		describe = "@@>1000020<",
		icon = "1",
		level = 10,
		type = 3,
		sub_type = 1,
		camp = 1,
		buff_born = [],
		ai = 1,
		guarding_area = 30,
		guarding_speed = 10,
		pursuing_area = 100,
		pursuing_speed = 20,
		recover_takeoff = 2,
		dropId = 0,
		model = "1",
		animation_born = "1",
		animation_death = "1",
		sound_death = "1",
		strength_id = 1,
		coefficient_hp = 0.0,
		coefficient_defense = 0.0,
		coefficient_attack = 0.0,
		coefficient_critical = 0.0,
		coefficient_hit = 0.0,
		coefficient_dodge = 0.0,
		coefficient_quickness = 0.0,
		skill_attack1 = 0,
		skill_attack2 = 0,
		skill_id1 = 0,
		skill_condition1 = 0,
		skill_condition_param1 = [],
		skill_id2 = 0,
		skill_condition2 = 0,
		skill_condition_param2 = [],
		skill_id3 = 0,
		skill_condition3 = 0,
		skill_condition_param3 = [],
		skill_id4 = 0,
		skill_condition4 = 0,
		skill_condition_param4 = [],
		skill_id5 = 0,
		skill_condition5 = 0,
		skill_condition_param5 = [],
		born_event = [],
		death_event = []
	};
getRow(_) -> {}.

getKeyList() -> [
	{1}
].

get1KeyList() -> [
	1
].

