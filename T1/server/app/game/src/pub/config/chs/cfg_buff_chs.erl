%% coding: latin-1
%% This File Is AUTO GENERATED, Don't Modify it MANUALLY!!!
-module(cfg_buff_chs).
-author("tiancheng").

-compile(export_all).

-include("cfg_buff.hrl").
-include("logger.hrl").
-include("battle_prop.hrl").

%% BUFF表
getRow(10000) ->
	#buffCfg{
		desc__ = "测试回血BUFF",
		id = 10000,
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
getRow(_) -> {}.

getKeyList() -> [
	{10000}
].

get1KeyList() -> [
	10000
].

