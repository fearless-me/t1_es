%% This File Is AUTO GENERATED, Don't Modify it MANUALLY!!!

-ifndef(cfg_conditional_event).
-define(cfg_conditional_event, 1).

%% 条件事件集合表
-record(conditional_eventCfg, {
	%% 行描述
	desc__,

	%% ID
	id,

	%% 作用模块
	%% 0：通用
	%% 1：技能
	%% 2：副本
	module,

	%% 主类型
	type,

	%% 子类型
	subtype,

	%% 条件
	conditional,

	%% 事件真
	event_true,

	%% 事件假
	event_false,

	%% 参数列表
	param
 }).

-endif.
