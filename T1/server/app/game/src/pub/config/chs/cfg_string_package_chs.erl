%% coding: latin-1
%% This File Is AUTO GENERATED, Don't Modify it MANUALLY!!!
-module(cfg_string_package_chs).
-author("tiancheng").

-compile(export_all).

-include("cfg_string_package.hrl").
-include("logger.hrl").
-include("battle_prop.hrl").

%% 语言包，翻译表
getRow(3) ->
	#string_packageCfg{
		desc__ = "tiancheng",
		id = 3,
		enum_string_id = "",
		type = 4,
		notice_type = 0,
		content = "tiancheng"
	};
getRow(4) ->
	#string_packageCfg{
		desc__ = "拳击",
		id = 4,
		enum_string_id = "",
		type = 4,
		notice_type = 0,
		content = "拳击"
	};
getRow(5) ->
	#string_packageCfg{
		desc__ = "横扫拳击",
		id = 5,
		enum_string_id = "",
		type = 4,
		notice_type = 0,
		content = "横扫拳击"
	};
getRow(6) ->
	#string_packageCfg{
		desc__ = "蓄力重拳",
		id = 6,
		enum_string_id = "",
		type = 4,
		notice_type = 0,
		content = "蓄力重拳"
	};
getRow(7) ->
	#string_packageCfg{
		desc__ = "佛山无影脚",
		id = 7,
		enum_string_id = "",
		type = 4,
		notice_type = 0,
		content = "佛山无影脚"
	};
getRow(8) ->
	#string_packageCfg{
		desc__ = "加班续命",
		id = 8,
		enum_string_id = "",
		type = 4,
		notice_type = 0,
		content = "加班续命"
	};
getRow(9) ->
	#string_packageCfg{
		desc__ = "边回边打",
		id = 9,
		enum_string_id = "",
		type = 4,
		notice_type = 0,
		content = "边回边打"
	};
getRow(0) ->
	#string_packageCfg{
		desc__ = "test_server",
		id = 0,
		enum_string_id = "server_system",
		type = 1,
		notice_type = 0,
		content = "服务器内部定义"
	};
getRow(1) ->
	#string_packageCfg{
		desc__ = "test_client",
		id = 1,
		enum_string_id = "client_system",
		type = 2,
		notice_type = 0,
		content = "客户端内部定义"
	};
getRow(2) ->
	#string_packageCfg{
		desc__ = "test_ui",
		id = 2,
		enum_string_id = "ui_system",
		type = 3,
		notice_type = 0,
		content = "客户端UI使用定义"
	};
getRow(1000000) ->
	#string_packageCfg{
		desc__ = "剑圣",
		id = 1000000,
		enum_string_id = "",
		type = 4,
		notice_type = 0,
		content = "剑圣"
	};
getRow(_) -> {}.

getKeyList() -> [
	{3},
	{4},
	{5},
	{6},
	{7},
	{8},
	{9},
	{0},
	{1},
	{2},
	{1000000}
].

get1KeyList() -> [
	3,
	4,
	5,
	6,
	7,
	8,
	9,
	0,
	1,
	2,
	1000000
].

