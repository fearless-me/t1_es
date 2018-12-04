%% coding: latin-1
%% This File Is AUTO GENERATED, Don't Modify it MANUALLY!!!
-module(cfg_map_chs).
-author("tiancheng").

-compile(export_all).

-include("cfg_map.hrl").
-include("logger.hrl").
-include("battle_prop.hrl").

%% 地图配置表

%%-----------------------------------Fields Note-----------------------------------
	%% desc__:
	%% 对应的地图文本描述

	%% id:
	%% mapID ，双端直接进行使用

	%% name:
	%% 地图的名称

	%% level:
	%% 地图的等级，同时也是进入的限制等级

	%% is_cross:
	%% 是否跨服地图
	%% 1:本服
	%% 2:跨服

	%% peopleLimit:
	%% 地图人数上限

	%% lifetime:
	%% 地图创建到销毁的时间(秒),0为永久

	%% type:
	%% 地图主类型
	%% 1.主城
	%% 2.玩法

	%% subtype:
	%% 地图子类型
	%% 1.主城
	%% 2.玩法
	%% 2.玩法

	%% type_pk:
	%% PK类型
	%% 1.非战斗地图
	%% 2.PVE战斗地图
	%% 3.PVP战斗地图

	%% type_revive:
	%% 死亡复活模式
	%% 1.不可复活
	%% 2.营地复活
	%% 4.原地复活
	%% 8.原地复活

	%% res_art:
	%% map美术资源

	%% res_barrier:
	%% 阻挡路点配置

	%% res_mapinfo:
	%% map_info配置

	%% res_smallMap:
	%% 小地图

	%% res_bgm:
	%% 背景音乐

	%% event_in:
	%% 进入事件组

	%% event_copy:
	%% 副本逻辑组

	%% event_out:
	%% 离开事件组
%%---------------------------------------------------------------------------------

getRow(1) ->
	#mapCfg{
		desc__ = "迷雾之森中建立的喵村。",
		id = 1,
		name = "@@>1000002<",
		level = 1,
		is_cross = 1,
		peopleLimit = 50,
		lifetime = 0,
		type = 1,
		subtype = 1,
		type_pk = 1,
		type_revive = 1,
		res_art = "map100",
		res_barrier = "map100_wayPoint",
		res_mapinfo = "map100_MapInfo",
		res_smallMap = "100",
		res_bgm = "100",
		event_in = [],
		event_copy = [],
		event_out = []
	};
getRow(2) ->
	#mapCfg{
		desc__ = "机械城，死亡后的巨大机器人",
		id = 2,
		name = "@@>1000008<",
		level = 1,
		is_cross = 2,
		peopleLimit = 100,
		lifetime = 0,
		type = 1,
		subtype = 1,
		type_pk = 1,
		type_revive = 2,
		res_art = "map110",
		res_barrier = "110",
		res_mapinfo = "110",
		res_smallMap = "110",
		res_bgm = "110",
		event_in = [],
		event_copy = [],
		event_out = []
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

