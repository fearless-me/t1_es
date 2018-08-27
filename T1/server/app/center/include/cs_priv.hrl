%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 15. 八月 2018 11:29
%%%-------------------------------------------------------------------
-author("mawenhong").

-ifndef(CS_PRIV_HRL).
-define(CS_PRIV_HRL, true).

-define(CS_SERVERS_CHECK_ETS,csAllServerCheckEts_).
-define(CROSS_SELECT_POLICY_ETS,csCGSSelcectEts_).
-define(CS_GLOBAL_PLAYER_INFO_ETS, csAllPlayerEts_).


-define(SERVER_MGR_TICK, 100).
-define(ServerAckTime, 60*1000).




%%选择策略
%% 轮着来
-define(SelectPolicy_Turn, 1).
%% 优先填满人数
-define(SelectPolicy_Full, 2).
%% 随机选
-define(SelectPolicy_Rand, 3).
%% 选负载小的
-define(SelectPolicy_LowLoad, 4).



-record(m_all_server_check,{id = 0, time = 0}).

-endif.
