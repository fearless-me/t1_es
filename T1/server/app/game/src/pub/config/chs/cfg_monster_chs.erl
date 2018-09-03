%% coding: latin-1
%% This File Is AUTO GENERATED, Don't Modify it MANUALLY!!!

-module(cfg_monster_chs).
-compile(export_all).

-include("cfg_monster.hrl").
-include("logger.hrl").

%% 怪物配置表
getRow(110) ->
	#monsterCfg{
		desc__ = "第一个怪物",
		id = 110,
		name = "主宰"
	};
getRow(_) -> {}.

getKeyList() -> [
	{110}
].

get1KeyList() -> [
	110
].

