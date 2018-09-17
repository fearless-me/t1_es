%% coding: latin-1
%% This File Is AUTO GENERATED, Don't Modify it MANUALLY!!!

-module(cfg_conditional_event_chs).
-compile(export_all).

-include("cfg_conditional_event.hrl").
-include("logger.hrl").

%% 条件事件集合表
getRow(1) ->
	#conditional_eventCfg{
		desc__ = "条件组1",
		id = 1,
		module = 0,
		type = 1,
		subtype = 2,
		conditional = [0,1,2,3,4,5],
		event_true = [11,22,33,44,55],
		event_false = [],
		param = []
	};
getRow(_) -> {}.

getKeyList() -> [
	{1}
].

get1KeyList() -> [
	1
].

