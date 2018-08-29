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

-record(m_server_info,{sid = 0, type = 0, node = '', name = "", status = 0, online = 0, max_online = 1800, src_pid , worker}).
-record(m_player_cross_lock,{aid=0,src_sid=0, cross_sid =0,lock=0,lock_time=0}).
-record(m_player_cross_data,{aid=0, data}).

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
