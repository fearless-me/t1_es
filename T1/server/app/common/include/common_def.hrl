%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 04. 九月 2018 14:50
%%%-------------------------------------------------------------------
-author("mawenhong").

-ifndef(COMMON_DEF_HRL).
-define(COMMON_DEF_HRL, true).


%% 服务器类型
-define(SERVER_TYPE_GAME,   1). % 游戏服
-define(SERVER_TYPE_CROSS,  2). % 跨服
-define(SERVER_TYPE_CENTER, 3). % 中心服

%% 服务器状态
-define(SEVER_STATUS_INIT, 0).  % 初始化
-define(SEVER_STATUS_READY, 1). % 连接中
-define(SEVER_STATUS_DONE, 2).  % 启动好

%% 玩家跨服状态
-define(CS_PS_NONE,  0). % 无状态
-define(CS_PS_READY, 1). % 连接好，等待确认
-define(CS_PS_DONE,  2). % 已经完成跨服


%%选择策略
%% 轮着来
-define(SelectPolicy_Turn, 1).
%% 优先填满人数
-define(SelectPolicy_Full, 2).
%% 随机选
-define(SelectPolicy_Rand, 3).
%% 选负载小的
-define(SelectPolicy_LowLoad, 4).


%%
-define(SYSTEM_GUID_GUILD,  100).
-define(SYSTEM_GUID_TEAM,   102).
-define(SYSTEM_GUID_FRIEND, 103).

-endif.
