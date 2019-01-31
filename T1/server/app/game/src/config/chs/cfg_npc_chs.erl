%% coding: latin-1
%% This File Is AUTO GENERATED, Don't Modify it MANUALLY!!!
-module(cfg_npc_chs).
-author("tiancheng").

-compile(export_all).

-include("cfg_npc.hrl").
-include("logger.hrl").
-include("battle_prop.hrl").

%% NPC表

%%-----------------------------------Fields Note-----------------------------------
	%% desc__:

	%% id:
	%% NPC备用ID

	%% name:
	%% 显示使用名称

	%% title:
	%% NPC的头衔称号

	%% level:
	%% 等级

	%% icon:
	%% 头像

	%% type:
	%% 类型
	%% 1.普通NPC
	%% 2.其他

	%% model:
	%% 模型资源

	%% model_scale:
	%% 模型缩放

	%% talk_content:
	%% 对话内容

	%% talk_sound:
	%% 对话语音资源
%%---------------------------------------------------------------------------------

getRow(1) ->
	#npcCfg{
		desc__ = "",
		id = 1,
		name = "@@>1000032<",
		title = "@@>1000033<",
		level = 10,
		icon = "1",
		type = 1,
		model = "1",
		model_scale = 1.0,
		talk_content = "@@>1000034<",
		talk_sound = "1"
	};
getRow(_) -> {}.

getKeyList() -> [
	{1}
].

get1KeyList() -> [
	1
].

