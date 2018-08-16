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

-define(GCS_CK_REG,csAllServerCheckEts_).
-define(GLOBAL_GS_ETS, csAllGSEts_).
-define(GS_SELECT_REG,csCGSSelcectEts_).
-define(CSPLAYRER_ETS, csAllPlayerEts_).


-define(SVRMGR_TICK, 100).
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



-record(recServerCheck,{id = 0, time = 0}).

-endif.
