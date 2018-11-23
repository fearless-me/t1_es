%% coding: latin-1
%% This File Is AUTO GENERATED, Don't Modify it MANUALLY!!!
-module(cfg_buff_chs).
-author("tiancheng").

-compile(export_all).

-include("cfg_buff.hrl").
-include("logger.hrl").
-include("battle_prop.hrl").

%% BUFF表

%%-----------------------------------Fields Note-----------------------------------
	%% desc__:

	%% id:
	%% BuffID,唯一Key

	%% name:
	%% Buff名字

	%% tips:
	%% 显示的描述内容

	%% icon:
	%% IconID

	%% useType:
	%% Buff作用域分类

	%% purpose:
	%% 正负性：
	%% 1.正面
	%% 2.负面
	%% 3.无目的性

	%% effectType:
	%% 效果TYPE：
	%% 1.无特别效果
	%% 2.昏迷
	%% 3.迷惑
	%% 4.减速
	%% 5.变形

	%% groupId:
	%% 用于区别同类BUFF冲突用，比如“烹饪增加的BUFF都是一个GroupID”

	%% immune:
	%% 免疫类型：
	%% 1.无
	%% 2.免疫昏迷
	%% 3.免疫迷惑
	%% 4.免疫减速
	%% 5.免疫变形

	%% lifeTime:
	%% 总时长（毫秒）

	%% tickTime:
	%% 每跳间隔（毫秒）

	%% canRemove:
	%% 是否可以被移除事件移除：
	%% 1.可以
	%% 2.无法被移除

	%% deathRemove:
	%% 死亡是否移除：
	%% 1.可以
	%% 2.死亡不移除

	%% mapRemove:
	%% 跨图是否移除：
	%% 1.可以
	%% 2.跨图不移除

	%% saveType:
	%% 保存方式：
	%% 1.下线不保存
	%% 2.下线保存停止计时
	%% 3.下线保存依然计时

	%% maxLayer:
	%% 最大叠加层数

	%% sourceConflict:
	%% 来源冲突方式：
	%% 1.不同来源同ID共存
	%% 2.不同来源仅最后一个生效

	%% displayType:
	%% 显示方式：
	%% 1.全部可见
	%% 2.自己可见
	%% 3全不可见

	%% propList:
	%% 属性列表

	%% onAdd:
	%% 添加条件事件组

	%% onTick:
	%% Tick条件事件组

	%% onStop:
	%% 中断条件事件组

	%% onEnd:
	%% 结束条件事件组
%%---------------------------------------------------------------------------------

getRow(10000) ->
	#buffCfg{
		desc__ = "测试回血BUFF",
		id = 10000,
		name = "@@>测试回血BUFF<",
		tips = "@@>1000000<",
		icon = 99,
		useType = 99,
		purpose = 0,
		effectType = 0,
		groupId = 1,
		immune = 0,
		lifeTime = 10000,
		tickTime = 1000,
		canRemove = 1,
		deathRemove = 1,
		mapRemove = 1,
		saveType = 0,
		maxLayer = 1,
		sourceConflict = 1,
		displayType = 0,
		propList = [{?BP_3_FAST,?BPUseType_MUL,545436},{?BP_1_STR,?BPUseType_ADD,12},{?BP_1_STA,?BPUseType_MUL,312321},{?BP_1_STR,?BPUseType_ADD,133}],
		onAdd = [[[],[],[]],[[0,2,0,2,500,5,1,0],[],[],[]],[[],[],[],[]]],
		onTick = [[[],[],[]],[[0,2,0,2,100,5,1,0],[],[],[]],[[],[],[],[]]],
		onStop = [],
		onEnd = []
	};
getRow(10100) ->
	#buffCfg{
		desc__ = "防御降低10%",
		id = 10100,
		name = "@@>防御降低10%<",
		tips = "@@>1000004<",
		icon = 99,
		useType = 0,
		purpose = 2,
		effectType = 1,
		groupId = 1,
		immune = 1,
		lifeTime = 7500,
		tickTime = 0,
		canRemove = 1,
		deathRemove = 1,
		mapRemove = 2,
		saveType = 1,
		maxLayer = 3,
		sourceConflict = 2,
		displayType = 1,
		propList = [{?BP_2_DEF,?BPUseType_MUL,-100}],
		onAdd = [],
		onTick = [],
		onStop = [],
		onEnd = []
	};
getRow(10101) ->
	#buffCfg{
		desc__ = "破魔之道零式增加20%AP，持续10秒",
		id = 10101,
		name = "@@>破魔之道零式增加20%AP，持续10秒<",
		tips = "@@>1000006<",
		icon = 5455,
		useType = 0,
		purpose = 1,
		effectType = 1,
		groupId = 2,
		immune = 1,
		lifeTime = 10000,
		tickTime = 0,
		canRemove = 1,
		deathRemove = 1,
		mapRemove = 1,
		saveType = 1,
		maxLayer = 1,
		sourceConflict = 2,
		displayType = 1,
		propList = [{?BP_2_ATK,?BPUseType_MUL,200}],
		onAdd = [],
		onTick = [],
		onStop = [],
		onEnd = []
	};
getRow(10102) ->
	#buffCfg{
		desc__ = "被破魔臂击中导致流血不止",
		id = 10102,
		name = "@@>被破魔臂击中导致流血不止<",
		tips = "@@>1000007<",
		icon = 555,
		useType = 2,
		purpose = 2,
		effectType = 1,
		groupId = 3,
		immune = 1,
		lifeTime = 10000,
		tickTime = 3000,
		canRemove = 1,
		deathRemove = 1,
		mapRemove = 2,
		saveType = 1,
		maxLayer = 3,
		sourceConflict = 1,
		displayType = 1,
		propList = [],
		onAdd = [],
		onTick = [[[],[],[]],[[0,2,0,1004,300,0,0,0],[],[],[]],[[],[],[],[]]],
		onStop = [],
		onEnd = []
	};
getRow(_) -> {}.

getKeyList() -> [
	{10000},
	{10100},
	{10101},
	{10102}
].

get1KeyList() -> [
	10000,
	10100,
	10101,
	10102
].

