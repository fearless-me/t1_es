%% This File Is AUTO GENERATED, Don't Modify it MANUALLY!!!
-author("tiancheng").

-ifndef(cfg_map).
-define(cfg_map, 1).

%% 地图配置表
-record(mapCfg, {
	%% 对应的地图文本描述
	desc__,

	%% mapID ，双端直接进行使用
	id,

	%% 地图的名称
	name,

	%% 地图的等级，同时也是进入的限制等级
	level,

	%% 是否跨服地图
	%% 1:本服
	%% 2:跨服
	is_cross,

	%% 地图人数上限
	peopleLimit,

	%% 地图创建到销毁的时间(秒),0为永久
	lifetime,

	%% 地图主类型
	%% 1.主城
	%% 2.玩法
	type,

	%% 地图子类型
	%% 1.主城
	%% 2.玩法
	%% 2.玩法
	subtype,

	%% PK类型
	%% 1.非战斗地图
	%% 2.PVE战斗地图
	%% 3.PVP战斗地图
	type_pk,

	%% 死亡复活模式
	%% 1.不可复活
	%% 2.营地复活
	%% 4.原地复活
	%% 8.原地复活
	type_revive,

	%% map美术资源
	res_art,

	%% 阻挡路点配置
	res_barrier,

	%% map_info配置
	res_mapinfo,

	%% 小地图
	res_smallMap,

	%% 背景音乐
	res_bgm,

	%% 进入事件组
	event_in,

	%% 副本逻辑组
	event_copy,

	%% 离开事件组
	event_out
 }).

-endif.
