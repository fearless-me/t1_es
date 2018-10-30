%% coding: latin-1
%% This File Is AUTO GENERATED, Don't Modify it MANUALLY!!!
-module(cfg_drop_table_chs).
-author("tiancheng").

-compile(export_all).

-include("cfg_drop_table.hrl").
-include("logger.hrl").
-include("battle_prop.hrl").

%% 掉落表
getRow(1, 0, 112) ->
	#drop_tableCfg{
		desc__ = "发情丹的掉落",
		drop_id = 1,
		drop_group_id = 0,
		item_id = 112,
		array_test1 = [],
		array_test2 = []
	};
getRow(20, 5, 111) ->
	#drop_tableCfg{
		desc__ = "田成发情丹",
		drop_id = 20,
		drop_group_id = 5,
		item_id = 111,
		array_test1 = [],
		array_test2 = []
	};
getRow(_, _, _) -> {}.

getKeyList() -> [
	{1,0,112},
	{20,5,111}
].

get1KeyList() -> [
	1,
	20
].

get2KeyList(1) -> [
	{0,112}
];
get2KeyList(20) -> [
	{5,111}
];
get2KeyList(_) -> [].

get3KeyList(1, 0) -> [
	112
];
get3KeyList(20, 5) -> [
	111
];
get3KeyList(_, _) -> [].
