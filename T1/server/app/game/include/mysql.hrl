%%%-------------------------------------------------------------------
%%% @author ZhongYuanWei
%%% @copyright (C) 2013, 好玩一二三科技
%%% @doc
%%%
%%% @end
%%% Created : 17. 十二月 2013 14:09
%%%-------------------------------------------------------------------
-ifndef(MYSQL_HRL).
-define(MYSQL_HRL, 1).

%%gs
-define(GAMEDB_GS_POOL, gs).
-define(GAMEDB_LS_POOL, ls).

%%游戏数据库
-define(GAMEDB_CONNECT_POOL, gameDBConnectPool).
%%游戏日志数据库
-define(LOGDB_CONNECT_POOL, logDBConnectPool).
%%游戏登录账号数据库
-define(LOGINDB_CONNECT_POOL, loginDBConnectPool).
%%激活码数据库
-define(ACTIVECODEDB_CONNECT_POOL, activeCodeDBConnectPool).
%%订单支付数据库连接
-define(RECHARGE_CONNECT_POOL, rechargeDBConnectPool).

-define(CSDB_CONNECT_POOL, csDBConnectPool).


-ifndef(RELEASE).
%%游戏数据库的连接数量
-define(GAMEDB_CONNECT_NUM, 6).
%%游戏日志数据库的连接数量
-define(LOGDB_CONNECT_NUM, 5).
%%游戏登录账号数据库的连接数量
-define(LOGINDB_CONNECT_NUM, 5).
%%激活码数据库的连接数量
-define(ACTIVECODEDB_CONNECT_NUM, 1).
%%订单支付数据库连接的连接数量
-define(RECHARGE_CONNECT_NUM, 1).
%%为LS服务的工作者进程数量
-define(DBOTP_LS_NUM, 5).
%%为GS服务的工作者进程数量
-define(DBOTP_GS_NUM, 2).
%%日志工作者进程数量
-define(LogDBWorkerOtp_NUM, 5).
-define(CSDB_CONNECT_NUM, 6).
-else.
%%游戏数据库的连接数量
-define(GAMEDB_CONNECT_NUM, 50).
%%游戏日志数据库的连接数量
-define(LOGDB_CONNECT_NUM, 40).
%%游戏登录账号数据库的连接数量
-define(LOGINDB_CONNECT_NUM, 20).
%%激活码数据库的连接数量
-define(ACTIVECODEDB_CONNECT_NUM, 5).
%%订单支付数据库连接的连接数量
-define(RECHARGE_CONNECT_NUM, 20).
%%为LS服务的工作者进程数量
-define(DBOTP_LS_NUM, 20).
%%为GS服务的工作者进程数量
-define(DBOTP_GS_NUM, 400).
%%日志工作者进程数量
-define(LogDBWorkerOtp_NUM, 20).
-define(CSDB_CONNECT_NUM, 100).
-endif.

%% MySQL记录集中的所有行
-record(mysqlRows, {fieldNames = [],    %所有字段名
	row = [],            %第一行记录的所有值
	remainRows = []        %其余行记录的所有值
}).

-endif.
