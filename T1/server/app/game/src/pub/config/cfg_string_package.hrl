%% This File Is AUTO GENERATED, Don't Modify it MANUALLY!!!
-author("tiancheng").

-ifndef(cfg_string_package).
-define(cfg_string_package, 1).

%% 语言包，翻译表
-record(string_packageCfg, {
	%% 行描述
	desc__,

	%% 翻译ID
	id,

	%% 用于生成枚举的字符串标识
	enum_string_id,

	%% 翻译类型
	%% 1.服务器内部
	%% 2.客户端内部
	%% 3.客户端UI
	%% 4.配置表翻译
	type,

	%% 内容
	content
 }).

-endif.
