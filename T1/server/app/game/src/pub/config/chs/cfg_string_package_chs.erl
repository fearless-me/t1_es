%% coding: latin-1
%% This File Is AUTO GENERATED, Don't Modify it MANUALLY!!!
-module(cfg_string_package_chs).
-author("tiancheng").

-compile(export_all).

-include("cfg_string_package.hrl").
-include("logger.hrl").
-include("battle_prop.hrl").

%% 语言包，翻译表

%%-----------------------------------Fields Note-----------------------------------
	%% desc__:
	%% 行描述

	%% id:
	%% 翻译ID，不需要填，根据类型自动生成

	%% enum_string_id:
	%% 用于生成枚举的字符串标识

	%% type:
	%% 翻译类型
	%% 1.服务器内部
	%% 2.客户端内部
	%% 3.客户端UI
	%% 4.配置表翻译

	%% notice_type:
	%% 提示类型
	%% 0忽略
	%% 1仅绿字向上提示
	%% 2仅聊天框提示
	%% 3仅跑马灯提示

	%% content:
	%% 内容
%%---------------------------------------------------------------------------------

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
		content = "101测试普攻"
	};
getRow(5) ->
	#string_packageCfg{
		desc__ = "横扫拳击",
		id = 5,
		enum_string_id = "",
		type = 4,
		notice_type = 0,
		content = "101测试普攻2"
	};
getRow(6) ->
	#string_packageCfg{
		desc__ = "蓄力重拳",
		id = 6,
		enum_string_id = "",
		type = 4,
		notice_type = 0,
		content = "101快速冲拳"
	};
getRow(7) ->
	#string_packageCfg{
		desc__ = "佛山无影脚",
		id = 7,
		enum_string_id = "",
		type = 4,
		notice_type = 0,
		content = "爆破重拳"
	};
getRow(8) ->
	#string_packageCfg{
		desc__ = "加班续命",
		id = 8,
		enum_string_id = "",
		type = 4,
		notice_type = 0,
		content = "破甲打击"
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
getRow(1000001) ->
	#string_packageCfg{
		desc__ = "添加回血BUFF",
		id = 1000001,
		enum_string_id = "",
		type = 4,
		notice_type = 0,
		content = "添加回血BUFF"
	};
getRow(1000002) ->
	#string_packageCfg{
		desc__ = "喵村场景",
		id = 1000002,
		enum_string_id = "",
		type = 4,
		notice_type = 0,
		content = "喵村"
	};
getRow(1000004) ->
	#string_packageCfg{
		desc__ = "防御强度被降低10%",
		id = 1000004,
		enum_string_id = "",
		type = 4,
		notice_type = 0,
		content = "防御强度被降低10%"
	};
getRow(1000005) ->
	#string_packageCfg{
		desc__ = "破魔之道·零式",
		id = 1000005,
		enum_string_id = "",
		type = 4,
		notice_type = 0,
		content = "破魔之道·零式"
	};
getRow(1000006) ->
	#string_packageCfg{
		desc__ = "增加自身20%AP",
		id = 1000006,
		enum_string_id = "",
		type = 4,
		notice_type = 0,
		content = "增加自身20%AP"
	};
getRow(1000007) ->
	#string_packageCfg{
		desc__ = "流血，每3秒损失生命值",
		id = 1000007,
		enum_string_id = "",
		type = 4,
		notice_type = 0,
		content = "流血，每3秒损失生命值"
	};
getRow(_) -> {}.

getKeyList() -> [
	{3},
	{4},
	{5},
	{6},
	{7},
	{8},
	{0},
	{1},
	{2},
	{1000000},
	{1000001},
	{1000002},
	{1000004},
	{1000005},
	{1000006},
	{1000007}
].

get1KeyList() -> [
	3,
	4,
	5,
	6,
	7,
	8,
	0,
	1,
	2,
	1000000,
	1000001,
	1000002,
	1000004,
	1000005,
	1000006,
	1000007
].

