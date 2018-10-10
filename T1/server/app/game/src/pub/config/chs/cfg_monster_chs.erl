%% coding: latin-1
%% This File Is AUTO GENERATED, Don't Modify it MANUALLY!!!
-module(cfg_monster_chs).
-author("tiancheng").

-compile(export_all).

-include("cfg_monster.hrl").
-include("logger.hrl").
-include("battle_prop.hrl").

%% 怪物配置表
getRow(111) ->
	#monsterCfg{
		desc__ = "初生怪物",
		id = 111,
		name = "@@>2<",
		type = 1,
		sub_type = 1,
		ai = 0,
		ai_param = [],
		model = "hhhhaaaa",
		born_event = 0,
		death_event = 0,
		proplist = [[?MAX_HP,?IGNORE,100000000],[?HP,?ADD,100000]]
	};
getRow(_) -> {}.

getKeyList() -> [
	{111}
].

get1KeyList() -> [
	111
].

