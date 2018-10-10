%% coding: latin-1
%% This File Is AUTO GENERATED, Don't Modify it MANUALLY!!!
-module(cfg_map_chs).
-author("tiancheng").

-compile(export_all).

-include("cfg_map.hrl").
-include("logger.hrl").
-include("battle_prop.hrl").

%% 地图配置表
getRow(1) ->
	#mapCfg{
		desc__ = "新手村",
		id = 1,
		type = 0,
		subtype = 3,
		is_cross = 0,
		name = "新手村",
		res1 = "maps/map330_PathGrid.bytes",
		res2 = "maps/map330_MapInfo.bytes"
	};
getRow(2) ->
	#mapCfg{
		desc__ = "主城",
		id = 2,
		type = 0,
		subtype = 0,
		is_cross = 1,
		name = "天空之城",
		res1 = "maps/map333_PathGrid.bytes",
		res2 = "maps/map333_MapInfo.bytes"
	};
getRow(103) ->
	#mapCfg{
		desc__ = "暴风城(本地)",
		id = 103,
		type = 0,
		subtype = 3,
		is_cross = 0,
		name = "暴风城",
		res1 = "",
		res2 = ""
	};
getRow(_) -> {}.

getKeyList() -> [
	{1},
	{2},
	{103}
].

get1KeyList() -> [
	1,
	2,
	103
].

