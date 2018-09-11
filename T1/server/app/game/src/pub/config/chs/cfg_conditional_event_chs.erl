%% coding: latin-1
%% This File Is AUTO GENERATED, Don't Modify it MANUALLY!!!

-module(cfg_conditional_event_chs).
-compile(export_all).

-include("cfg_conditional_event.hrl").
-include("logger.hrl").

%% 条件事件集合表
getRow(0) ->
	#conditional_eventCfg{
		desc__ = "",
		id = 0,
		module = 0,
		type = 0,
		subtype = 0,
		conditional = [],
		event_true = [],
		event_false = [],
		param = []
	};
getRow(_) -> {}.

getKeyList() -> [
	{0}
].

get1KeyList() -> [
	0
].

