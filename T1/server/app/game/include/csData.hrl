%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2017, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 06. 十月 2017 11:04
%%%-------------------------------------------------------------------
-author("mawenhong").


-ifndef(CSDATAINC_HRL).
-define(CSDATAINC_HRL,1).

-include("cgsInc.hrl").


-define(GCS_CK_REG,csAllServerCheckEts_).
-define(GS_SELECT_REG,csCGSSelcectEts_).
-define(GLOBAL_GS_ETS, csAllGSEts_).
-define(CSPLAYRER_ETS, csAllPlayerEts_).
-define(CSPLAYRER_CK_ETS, csAllPlayerCheckEts_).
-define(CSSTATE_ETS, csStateEts__).
-define(SVRMGR_TICK, 100).
-define(ServerAckTime, 60*1000).

-record(recServerCheck,{
	id = 0,
	time = 0
}).

%%选择策略
%% 轮着来
-define(SelectPolicy_Turn, 1).
%% 优先填满人数
-define(SelectPolicy_Full, 2).
%% 随机选
-define(SelectPolicy_Rand, 3).
%% 选负载小的
-define(SelectPolicy_LowLoad, 4).
-endif.   %% CSDATAINC_HRL