%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 16. 八月 2018 10:28
%%%-------------------------------------------------------------------
-author("mawenhong").

-ifndef(DEF_GS_CS_HRL).
-define(DEF_GS_CS_HRL, true).

%%
-define(CenterServerKey, 1).
-define(TickTime, 500).%% 10 s
-define(ConnectTick, 20).%% 30 s
-define(SyncAllServerTick, 60).
-define(ConnectTimeoutSec, 60).
%%
-define(CenterServerEts, centerServerEts____).
-record(recCenterInfo, {id = ?CenterServerKey, pid = 0, status = 0, dead_line = 0}).

-endif.
