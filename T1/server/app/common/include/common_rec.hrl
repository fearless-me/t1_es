%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 29. 八月 2018 10:01
%%%-------------------------------------------------------------------
-author("mawenhong").

-ifndef(COMMON_REC_HRL).
-define(COMMON_REC_HRL, true).

-define(ShareServerInfoName, m_share_server_info).
-record(m_share_server_info, {sid = 0, type = 0, node = '', name = "", status = 0, online = 0, max_online = 1800, src_pid, worker}).

-record(recPlayerInfo, {
    roleID = 0, % 角色ID
    roleName = "",% 角色名字
    accountID = 0, % 帐号ID
    status = 0,
    pid = 0,
    netPid = 0,
    gsServerID = 0,
    cgsServerID = 0
}).


-endif.
