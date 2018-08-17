%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 02. 一月 2018 11:41
%%%-------------------------------------------------------------------
-author("mawenhong").
-ifndef(PUB_REC_HRL).
-define(PUB_REC_HRL, true).

-record(pub_kv,{key,value}).
-record(m_server_info,{sid = 0, type = 0, node = '', name = "", status = 0, online = 0, max_online = 1800, src_pid , worker}).


-record(recPlayerInfo,{
    roleID              = 0, % 角色ID
    roleName            = "",% 角色名字
    accountID           = 0, % 帐号ID
    status              = 0,
    pid                 = 0,
    netPid              = 0,
    gsServerID          = 0,
    cgsServerID         = 0
}).

-endif.

