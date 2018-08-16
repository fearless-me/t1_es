%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 15. 八月 2018 14:44
%%%-------------------------------------------------------------------
-author("mawenhong").

-ifndef(PUB_DEF_HRL).
-define(PUB_DEF_HRL, true).

-define(PsCsSvrMgrName, csSvrMgr___).

%%
-define(SERVER_TYPE_GS, 1).
-define(SERVER_TYPE_CGS, 2).

-define(SEVER_STATUS_INIT, 0).
-define(SEVER_STATUS_READY, 1).
-define(SEVER_STATUS_DONE, 2).

-define(MAX_ROLE, 1800).

-define(PS_NONE, 0).
-define(PS_DONE, 2).

-record(pub_kv,{key,value}).
-record(m_server_info,{sid = 0, type = 0, node = '', name = "", status = 0, online = 0, max_online = 1800, src_pid , worker}).


-record(recPlayerInfo,{
    roleID              = 0, % 角色ID
    roleName            = "",% 角色名字
    accountID           = 0, % 帐号ID
    status              = ?PS_NONE,
    pid                 = 0,
    netPid              = 0,
    gsServerID          = 0,
    cgsServerID         = 0
}).


-endif.
