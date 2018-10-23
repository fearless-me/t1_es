%% This File Is AUTO GENERATED, Don't Modify it MANUALLY!!!
-author("tiancheng").

-ifndef(cfg_monster).
-define(cfg_monster, 1).

%% 怪物配置表
-record(monsterCfg, {
	%% 行描述
	desc__,

	%% 怪物ID
	id,

	%% 怪物名
	name,

	%% 怪物类型
	%% 1.BOSS
	%% 2.精英
	%% 3.普通怪
	type,

	%% 怪物子类型
	%% 1.野外怪物
	%% 2.副本怪物
	sub_type,

	%% 暂未定义AI类型
	ai,

	%% AI参数，一维数组
	ai_param,

	%% 怪物模型
	model,

	%% 出生事件
	born_event,

	%% 死亡事件
	death_event,

	%% 数组修正列表
	proplist
 }).

-endif.
