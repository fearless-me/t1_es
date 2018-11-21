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
		desc__ = "迷雾之森中建立的喵村。",
		id = 1,
		name = "@@>1000002<",
		level = 1,
		is_cross = 0,
		peopleLimit = 100,
		lifetime = 0,
		type = 1,
		subtype = 1,
		type_pk = 1,
		type_revive = 1,
		res_art = 100,
		res_barrier = 100,
		res_mapinfo = 100,
		res_smallMap = 100,
		res_bgm = 100,
		event_in = [],
		event_copy = [],
		event_out = []
	};
getRow(2) ->
	#mapCfg{
		desc__ = "迷雾之森中建立的喵村。",
		id = 2,
		name = "@@>1000002<",
		level = 1,
		is_cross = 1,
		peopleLimit = 100,
		lifetime = 0,
		type = 1,
		subtype = 1,
		type_pk = 1,
		type_revive = 1,
		res_art = 100,
		res_barrier = 100,
		res_mapinfo = 100,
		res_smallMap = 100,
		res_bgm = 100,
		event_in = [],
		event_copy = [],
		event_out = []
	};
getRow(_) -> {}.

getKeyList() -> [
	{1},{2}
].

get1KeyList() -> [
	1,2
].

