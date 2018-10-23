%% coding: latin-1
%% This File Is AUTO GENERATED, Don't Modify it MANUALLY!!!
-module(cfg_string_package_chs).
-author("tiancheng").

-compile(export_all).

-include("cfg_string_package.hrl").
-include("logger.hrl").
-include("battle_prop.hrl").

%% 语言包，翻译表
getRow(1000001) ->
	#string_packageCfg{
		desc__ = "海螺",
		id = 1000001,
		enum_string_id = "",
		type = 4,
		notice_type = 0,
		content = "海螺5555"
	};
getRow(2) ->
	#string_packageCfg{
		desc__ = "服务器TIPS定义开始",
		id = 2,
		enum_string_id = "system",
		type = 1,
		notice_type = 1,
		content = "欢迎你"
	};
getRow(2000003) ->
	#string_packageCfg{
		desc__ = "世界守护BOSS",
		id = 2000003,
		enum_string_id = "",
		type = 4,
		notice_type = 0,
		content = "世界守护BOSS"
	};
getRow(2000004) ->
	#string_packageCfg{
		desc__ = "世界守护BOSS小弟",
		id = 2000004,
		enum_string_id = "",
		type = 4,
		notice_type = 0,
		content = "世界守护BOSS小弟"
	};
getRow(_) -> {}.

getKeyList() -> [
	{1000001},
	{2},
	{2000003},
	{2000004}
].

get1KeyList() -> [
	1000001,
	2,
	2000003,
	2000004
].

