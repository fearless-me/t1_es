%%%-------------------------------------------------------------------
%%% @author tiancheng
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%% 玩家数据打包相关
%%% @end
%%% Created : 11. 一月 2018 11:10
%%%-------------------------------------------------------------------
-author("tiancheng").

-ifndef(pack_hrl).
-define(pack_hrl, 1).

%% 支持类型，例：unsigned int -> bigint
-define(T_Bool, 	1).
-define(T_Byte, 	2).
-define(T_Short,	3).
-define(T_INT,		4).
-define(T_Bigint,	5).
-define(T_Float,	6).
-define(T_Double,	7).
-define(T_String,	8).
-define(T_Any,		9).	% 本类型不支持打包给客户端,保存会当成字符串处理
-define(T_Array,	10).

-define(Sync_Broadcast,		3).	% 广播
-define(Sync_Private,		2).	% 私有可视
-define(Sync_ServerOnly,	1). % 仅服务器用

-record(pack_s, {
	index = 0,
	sync = 1,
	save = false
}).

-endif.