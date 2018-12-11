%% coding: latin-1
%% This File Is AUTO GENERATED, Don't Modify it MANUALLY!!!
-module(cfg_skill_chs).
-author("tiancheng").

-compile(export_all).

-include("cfg_skill.hrl").
-include("logger.hrl").
-include("battle_prop.hrl").

%% 技能表

%%-----------------------------------Fields Note-----------------------------------
	%% desc__:
	%% 行描述

	%% id:
	%% 职业ID(3位) + 技能类型(1位) + ID(4位) 

	%% name:
	%% 名字就字符串，要考虑加入翻译标记

	%% type:
	%% 规划分类为:
	%% 1.职业技能
	%% 2.通用技能
	%% 3.怪物技能

	%% subType:
	%% 技能子类型:
	%% 1.主动
	%% 2.被动

	%% it_type:
	%% 主动技能分类
	%% 1.瞬发
	%% 2.吟唱
	%% 3.普攻

	%% pt_type:
	%% 被动分类
	%% 1.被动效果
	%% 2.被触发类

	%% it_take_type:
	%% 主动生效分类
	%% 1.正常生效
	%% 2.立刻生效
	%% 3.持续施法

	%% career:
	%% 按照现在的计数方案吧，第一位为主职业，第二位为转职次数，第三位为该转职下第几个职业，非职业技能填0

	%% movable:
	%% 技能释放中是否可移动
	%% 1.不可移动
	%% 2.可移动

	%% continue_param:
	%% 持续施法参数：[lifetime,tickrate]

	%% sing_param:
	%% 吟唱施法参数：[lifetime,tickrate]

	%% purpose:
	%% 意图：
	%% 1.负面
	%% 2.增益，主要用于第一步甄别目标有效性

	%% target:
	%% 有效目标:
	%% 1.player
	%% 2.monster
	%% 3.pet

	%% casttarget:
	%% 施法目标：
	%% 1.单体目标
	%% 2.方向
	%% 3.指定地点
	%% 4.自身面向

	%% areatype:
	%% 范围类型：
	%% 1.单体目标
	%% 2.线型
	%% 3.圆形

	%% radius:
	%% 半径，仅对线型和圆形生效

	%% arc:
	%% 弧度，仅对圆形生效

	%% distance:
	%% 射程，int_array，[min,max]

	%% cost:
	%% 消耗，int_array，[type,subtype,value]

	%% cooldown:
	%% CD

	%% flying:
	%% 飞行时间，如果是直接命中的（比如奥冲）就是0

	%% iconid:
	%% icon ID

	%% castanim:
	%% 动作主类型 _ 子类型 _ id，实际上只用填写文件名，不用写路径

	%% skilleffect:
	%% 同上

	%% hiteffect:
	%% 同上

	%% hp_steal:
	%% 吸血比例（万分比）

	%% special_options:
	%% 特殊选项（填和值）[正常逻辑，无视防御，必定命中，必定暴击]

	%% hurt_times:
	%% 技能伤害时间点

	%% beforecast:
	%% 技能释放前事件，我们先不说条件

	%% castingtick:
	%% 技能释放中每一casttick事件

	%% beforehit:
	%% 技能命中前（命中瀑布流已经命中了）

	%% ishit:
	%% 技能命中效果

	%% action_before_cast:
	%% 技能释放前表现组

	%% action_casting_tick:
	%% 持续施法每一跳条件事件组

	%% action_ishit:
	%% 命中表现组

	%% action_bullet:
	%% 子弹表现组
%%---------------------------------------------------------------------------------

getRow(10110000) ->
	#skillCfg{
		desc__ = "小红帽普攻1，造成50%AP伤害",
		id = 10110000,
		name = "@@>1000010<",
		type = 1,
		subType = 1,
		it_type = 3,
		pt_type = 1,
		it_take_type = 1,
		career = 101,
		movable = 2,
		continue_param = [0,0],
		sing_param = [0,0],
		purpose = 1,
		target = 1,
		casttarget = 1,
		areatype = 1,
		radius = 0,
		arc = 0,
		distance = [0,3],
		cost = [1,1,5],
		cooldown = 1200,
		flying = 0,
		iconid = "99",
		castanim = "1_1_1",
		skilleffect = "1_1_1",
		hiteffect = "1_1_1",
		hp_steal = 0,
		special_options = 0,
		hurt_times = 200,
		beforecast = [],
		castingtick = [],
		beforehit = [],
		ishit = [[[],[],[]],[[0,0,0,1004,5000,0,0],[],[],[]],[[],[],[],[]]],
		action_before_cast = "",
		action_casting_tick = "",
		action_ishit = "",
		action_bullet = ""
	};
getRow(10110001) ->
	#skillCfg{
		desc__ = "小红帽普攻2，造成50%AP伤害",
		id = 10110001,
		name = "@@>1000011<",
		type = 1,
		subType = 1,
		it_type = 3,
		pt_type = 1,
		it_take_type = 1,
		career = 101,
		movable = 2,
		continue_param = [0,0],
		sing_param = [0,0],
		purpose = 1,
		target = 1,
		casttarget = 1,
		areatype = 1,
		radius = 0,
		arc = 0,
		distance = [0,3],
		cost = [1,1,5],
		cooldown = 0,
		flying = 0,
		iconid = "98",
		castanim = "1_1_2",
		skilleffect = "1_1_2",
		hiteffect = "1_1_2",
		hp_steal = 0,
		special_options = 2,
		hurt_times = 200,
		beforecast = [],
		castingtick = [],
		beforehit = [],
		ishit = [[[],[],[]],[[0,0,0,1004,5000,0,0],[],[],[]],[[],[],[],[]]],
		action_before_cast = "",
		action_casting_tick = "",
		action_ishit = "",
		action_bullet = ""
	};
getRow(10100000) ->
	#skillCfg{
		desc__ = "快速地打击目标多次，造成60%AP*3伤害",
		id = 10100000,
		name = "@@>1000012<",
		type = 1,
		subType = 1,
		it_type = 1,
		pt_type = 1,
		it_take_type = 1,
		career = 101,
		movable = 2,
		continue_param = [],
		sing_param = [],
		purpose = 1,
		target = 1,
		casttarget = 1,
		areatype = 1,
		radius = 0,
		arc = 0,
		distance = [0,3],
		cost = [1,1,-5],
		cooldown = 2000,
		flying = 0,
		iconid = "97",
		castanim = "1_1_3",
		skilleffect = "1_1_3",
		hiteffect = "1_1_3",
		hp_steal = 0,
		special_options = 0,
		hurt_times = 200,
		beforecast = [],
		castingtick = [],
		beforehit = [],
		ishit = [[[],[],[]],[[0,0,0,1004,6000,0,0],[0,0,0,1004,6000,0,0],[0,0,0,1004,6000,0,0],[]],[[],[],[],[]]],
		action_before_cast = "",
		action_casting_tick = "",
		action_ishit = "",
		action_bullet = ""
	};
getRow(10100001) ->
	#skillCfg{
		desc__ = "巨力一拳打出，造成120%AP范围伤害",
		id = 10100001,
		name = "@@>1000013<",
		type = 1,
		subType = 1,
		it_type = 1,
		pt_type = 1,
		it_take_type = 1,
		career = 101,
		movable = 2,
		continue_param = [],
		sing_param = [],
		purpose = 1,
		target = 1,
		casttarget = 1,
		areatype = 3,
		radius = 3,
		arc = 90,
		distance = [0,3],
		cost = [1,1,-10],
		cooldown = 5000,
		flying = 0,
		iconid = "96",
		castanim = "1_1_4",
		skilleffect = "1_1_4",
		hiteffect = "1_1_4",
		hp_steal = 0,
		special_options = 0,
		hurt_times = 200,
		beforecast = [],
		castingtick = [],
		beforehit = [],
		ishit = [[[],[],[]],[[0,0,0,1004,12000,0,0],[],[],[]],[[],[],[],[]]],
		action_before_cast = "",
		action_casting_tick = "",
		action_ishit = "",
		action_bullet = ""
	};
getRow(11100001) ->
	#skillCfg{
		desc__ = "凝聚力量，一剑斩出，造成140%AP伤害，最多5个目标",
		id = 11100001,
		name = "@@>1000017<",
		type = 1,
		subType = 1,
		it_type = 2,
		pt_type = 1,
		it_take_type = 1,
		career = 111,
		movable = 1,
		continue_param = [],
		sing_param = [2000,0],
		purpose = 1,
		target = 1,
		casttarget = 4,
		areatype = 2,
		radius = 3,
		arc = 0,
		distance = [0,5],
		cost = [1,1,-3],
		cooldown = 5000,
		flying = 500,
		iconid = "66",
		castanim = "1_2_1",
		skilleffect = "1_2_1",
		hiteffect = "1_2_1",
		hp_steal = 0,
		special_options = 0,
		hurt_times = 200,
		beforecast = [],
		castingtick = [],
		beforehit = [],
		ishit = [[[],[],[]],[[0,0,0,1004,14000,0,0],[],[],[]],[[],[],[],[]]],
		action_before_cast = "",
		action_casting_tick = "",
		action_ishit = "",
		action_bullet = ""
	};
getRow(_) -> {}.

getKeyList() -> [
	{10110000},
	{10110001},
	{10100000},
	{10100001},
	{11100001}
].

get1KeyList() -> [
	10110000,
	10110001,
	10100000,
	10100001,
	11100001
].

