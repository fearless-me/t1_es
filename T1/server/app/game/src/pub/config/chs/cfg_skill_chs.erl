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
	%% 要个十万位ID吧，便于职业技能的分类

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

	%% hurt_times:
	%% 技能伤害时间点
%%---------------------------------------------------------------------------------

getRow(10100) ->
	#skillCfg{
		desc__ = "小红帽初始普攻，100%AP",
		id = 10100,
		name = "@@>4<",
		type = 1,
		subType = 1,
		it_type = 3,
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
		cost = [0,0,0],
		cooldown = 1200,
		flying = 0,
		iconid = "1",
		castanim = "1_1_1",
		skilleffect = "1_1_1",
		hiteffect = "2_1_1",
		beforecast = [[[],[],[]],[[],[],[],[]],[[],[],[],[]]],
		castingtick = [],
		beforehit = [],
		ishit = [[[],[],[]],[[0,2,0,1004,1000,0,0,0],[],[],[]],[[],[],[],[]]],
		action_before_cast = "",
		action_casting_tick = "",
		action_ishit = "[0,[[2,1_1_1,0,0,0,0,slot_1,1,1,1,0,0,0,0,0,0]]]",
		action_bullet = "",
		hurt_times = []
	};
getRow(10101) ->
	#skillCfg{
		desc__ = "小红帽初始普攻，100%AP",
		id = 10101,
		name = "@@>5<",
		type = 1,
		subType = 1,
		it_type = 3,
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
		cost = [0,0,0],
		cooldown = 1200,
		flying = 0,
		iconid = "1",
		castanim = "1_1_1",
		skilleffect = "1_1_1",
		hiteffect = "1_1_1",
		beforecast = [],
		castingtick = [],
		beforehit = [],
		ishit = [[[],[],[]],[[0,2,0,1004,1000,0,0,0],[],[],[]],[[],[],[],[]]],
		action_before_cast = "",
		action_casting_tick = "",
		action_ishit = "",
		action_bullet = "",
		hurt_times = []
	};
getRow(10102) ->
	#skillCfg{
		desc__ = "快速冲拳，造成70%AP*3伤害",
		id = 10102,
		name = "@@>6<",
		type = 1,
		subType = 1,
		it_type = 1,
		pt_type = 1,
		it_take_type = 1,
		career = 101,
		movable = 1,
		continue_param = [],
		sing_param = [],
		purpose = 1,
		target = 1,
		casttarget = 1,
		areatype = 3,
		radius = 0,
		arc = 0,
		distance = [0,3],
		cost = [1,1,-5],
		cooldown = 1000,
		flying = 0,
		iconid = "11",
		castanim = "1_1_3",
		skilleffect = "",
		hiteffect = "",
		beforecast = [],
		castingtick = [],
		beforehit = [],
		ishit = [[[],[],[]],[[0,2,0,1004,700,0,0,0],[0,2,0,1004,700,0,0,0],[0,2,0,1004,700,0,0,0],[]],[[],[],[],[]]],
		action_before_cast = "[0,[[1,0,0,0,0,0,0]]]",
		action_casting_tick = "",
		action_ishit = "[0,[[2,1_1_3,0,0,0,2,0,1,1,1,0,0,0,0,0,0]]]",
		action_bullet = "",
		hurt_times = [100]
	};
getRow(10103) ->
	#skillCfg{
		desc__ = "对目标及其身后的目标造成130%AP伤害",
		id = 10103,
		name = "@@>7<",
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
		arc = 120,
		distance = [0,3],
		cost = [1,1,-5],
		cooldown = 5000,
		flying = 0,
		iconid = "5",
		castanim = "1_2_1",
		skilleffect = "",
		hiteffect = "",
		beforecast = [],
		castingtick = [[[],[],[]],[[],[],[],[]],[[],[],[],[]]],
		beforehit = [],
		ishit = [[[],[],[]],[[0,2,0,1004,1300,0,0,0],[],[],[]],[[],[],[],[]]],
		action_before_cast = "",
		action_casting_tick = "",
		action_ishit = "",
		action_bullet = "",
		hurt_times = [200]
	};
getRow(10104) ->
	#skillCfg{
		desc__ = "造成80%AP，附加破甲效果",
		id = 10104,
		name = "@@>8<",
		type = 1,
		subType = 1,
		it_type = 1,
		pt_type = 1,
		it_take_type = 1,
		career = 101,
		movable = 1,
		continue_param = [],
		sing_param = [],
		purpose = 1,
		target = 1,
		casttarget = 1,
		areatype = 1,
		radius = 0,
		arc = 0,
		distance = [0,3],
		cost = [1,1,5],
		cooldown = 5000,
		flying = 0,
		iconid = "5",
		castanim = "1_2_3",
		skilleffect = "1_2_3",
		hiteffect = "1_2_3",
		beforecast = [],
		castingtick = [],
		beforehit = [[[],[],[]],[[1,1,10100,0,1,0],[],[],[]],[[],[],[],[]]],
		ishit = [[[],[],[]],[[0,2,0,1004,800,0,0,0],[],[],[]],[[],[],[],[]]],
		action_before_cast = "",
		action_casting_tick = "",
		action_ishit = "[0,[[2,1_2_3,0,0,0,0,p_m_origin,1,1,1,0,0,0,0,0,0]]]",
		action_bullet = "",
		hurt_times = [200]
	};
getRow(10006) ->
	#skillCfg{
		desc__ = "测试添加BUFF",
		id = 10006,
		name = "@@>1000001<",
		type = 1,
		subType = 1,
		it_type = 1,
		pt_type = 1,
		it_take_type = 1,
		career = 100,
		movable = 1,
		continue_param = [10000,2],
		sing_param = [10000,2],
		purpose = 1,
		target = 1,
		casttarget = 4,
		areatype = 1,
		radius = 0,
		arc = 0,
		distance = [0,5],
		cost = [0,0,0],
		cooldown = 5000,
		flying = 0,
		iconid = "",
		castanim = "",
		skilleffect = "",
		hiteffect = "",
		beforecast = [],
		castingtick = [],
		beforehit = [],
		ishit = [[[],[],[]],[[1,0,10000,0,1,0],[],[],[]],[[],[],[],[]]],
		action_before_cast = "",
		action_casting_tick = "",
		action_ishit = "",
		action_bullet = "",
		hurt_times = []
	};
getRow(10105) ->
	#skillCfg{
		desc__ = "使用后增加20%AP，持续10秒",
		id = 10105,
		name = "@@>1000005<",
		type = 1,
		subType = 1,
		it_type = 1,
		pt_type = 1,
		it_take_type = 2,
		career = 101,
		movable = 1,
		continue_param = [],
		sing_param = [],
		purpose = 2,
		target = 1,
		casttarget = 1,
		areatype = 1,
		radius = 0,
		arc = 0,
		distance = [0,99],
		cost = [1,1,1],
		cooldown = 30000,
		flying = 0,
		iconid = "5455",
		castanim = "",
		skilleffect = "",
		hiteffect = "",
		beforecast = [],
		castingtick = [],
		beforehit = [],
		ishit = [[[],[],[]],[[1,0,10101,0,1,0],[],[],[]],[[],[],[],[]]],
		action_before_cast = "",
		action_casting_tick = "",
		action_ishit = "",
		action_bullet = "",
		hurt_times = []
	};
getRow(234324) ->
	#skillCfg{
		desc__ = "",
		id = 234324,
		name = "@@>1000011<",
		type = 1,
		subType = 1,
		it_type = 1,
		pt_type = 1,
		it_take_type = 1,
		career = 0,
		movable = 1,
		continue_param = [],
		sing_param = [],
		purpose = 1,
		target = 1,
		casttarget = 1,
		areatype = 1,
		radius = 0,
		arc = 0,
		distance = [],
		cost = [],
		cooldown = 0,
		flying = 0,
		iconid = "",
		castanim = "",
		skilleffect = "",
		hiteffect = "",
		beforecast = [],
		castingtick = [],
		beforehit = [],
		ishit = [],
		action_before_cast = "",
		action_casting_tick = "",
		action_ishit = "",
		action_bullet = "",
		hurt_times = []
	};
getRow(_) -> {}.

getKeyList() -> [
	{10100},
	{10101},
	{10102},
	{10103},
	{10104},
	{10006},
	{10105},
	{234324}
].

get1KeyList() -> [
	10100,
	10101,
	10102,
	10103,
	10104,
	10006,
	10105,
	234324
].

