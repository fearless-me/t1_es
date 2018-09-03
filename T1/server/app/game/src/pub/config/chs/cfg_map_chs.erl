%% coding: latin-1
%% This File Is AUTO GENERATED, Don't Modify it MANUALLY!!!

-module(cfg_map_chs).
-compile(export_all).

-include("cfg_map.hrl").
-include("logger.hrl").

%% 地图配置表
getRow(1) ->
	#mapCfg{
		desc__ = "新手村",
		id = 1,
		type = 0,
		subtype = 0,
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
getRow(_) -> {}.

getKeyList() -> [
	{1},
	{2}
].

get1KeyList() -> [
	1,
	2
].

