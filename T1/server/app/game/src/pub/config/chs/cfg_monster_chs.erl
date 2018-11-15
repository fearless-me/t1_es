%% coding: latin-1
%% This File Is AUTO GENERATED, Don't Modify it MANUALLY!!!
-module(cfg_monster_chs).
-author("tiancheng").

-compile(export_all).

-include("cfg_monster.hrl").
-include("logger.hrl").
-include("battle_prop.hrl").

%% 怪物配置表
getRow(0) ->
	#monsterCfg{
		desc__ = "测试怪剑圣",
		id = 0,
		name = "@@>1000000<",
		type = 1,
		sub_type = 1,
		ai = 0,
		ai_param = [],
		model = "",
		born_event = 0,
		death_event = 0,
		proplist = [[?BP_2_HP_CUR,?BPUseType_ADD,10000008]]
	};
getRow(_) -> {}.

getKeyList() -> [
	{0}
].

get1KeyList() -> [
	0
].

