%% coding: latin-1
%% This File Is AUTO GENERATED, Don't Modify it MANUALLY!!!
-module(cfg_monster_chs).
-author("tiancheng").

-compile(export_all).

-include("cfg_monster.hrl").
-include("logger.hrl").
-include("battle_prop.hrl").

%% 怪物配置表

%%-----------------------------------Fields Note-----------------------------------
	%% desc__:
	%% 行描述

	%% id:
	%% 怪物ID

	%% name:
	%% 怪物名

	%% type:
	%% 怪物类型
	%% 1.BOSS
	%% 2.精英
	%% 3.普通怪

	%% sub_type:
	%% 怪物子类型
	%% 1.野外怪物
	%% 2.副本怪物

	%% ai:
	%% 暂未定义AI类型

	%% ai_param:
	%% AI参数，一维数组

	%% model:
	%% 怪物模型

	%% born_event:
	%% 出生事件

	%% death_event:
	%% 死亡事件

	%% proplist:
	%% 数组修正列表
%%---------------------------------------------------------------------------------

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
		proplist = [{?BP_2_HP_MAX,?BPUseType_ADD,100000000}]
	};
getRow(_) -> {}.

getKeyList() -> [
	{0}
].

get1KeyList() -> [
	0
].

