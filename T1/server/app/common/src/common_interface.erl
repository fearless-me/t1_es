%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2017, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 27. 九月 2017 19:33
%%%-------------------------------------------------------------------
-module(common_interface).
-author("mawenhong").

-include("pub_def.hrl").
-include("pub_rec.hrl").
-include("common_rec.hrl").
-include("common_def.hrl").
%%-include("cs_priv.hrl").


-define(TYPE_WORKER, 0).
-define(TYPE_WINDOW, 1).

%% 直接给服务器发消息
-export([
    %%
    send_msg_2_server_with_sid/2, send_msg_2_server_with_sid/3,
    send_msg_2_all_gs/1, send_msg_2_all_gs/2,
    send_msg_2_all_cross/1, send_msg_2_all_cross/2,
    send_msg_2_all_server/1, send_msg_2_all_server/2,
    send_msg_2_all_server_excl/2, send_msg_2_all_server_excl/3,

    %%
    send_msg_2_worker_with_sid/2, send_msg_2_worker_with_sid/3,
    send_msg_2_all_gs_worker/1, send_msg_2_all_gs_worker/2,
    send_msg_2_all_cross_worker/1, send_msg_2_all_cross_worker/2,
    send_msg_2_all_server_worker/1, send_msg_2_all_server_worker/2,

    %%
    is_server_worker_alive/1,

    %%
    get_server_info/1, get_cgs_info/0,
    %%
    get_all_sid/1
]).


%%%-------------------------------------------------------------------
get_all_sid(Type)->
    sel_server_id(Type).

%%%-------------------------------------------------------------------
get_server_info(ServerID) ->
    case misc_mnesia:dirty_read(?ShareServerInfoName, ServerID) of
        [Info] ->
            Info;
        _ ->
            undefined
    end.

%%%-------------------------------------------------------------------
% 选取所有可用跨服信息
get_cgs_info() ->
    Q = ets:fun2ms(fun(Info) when Info#m_share_server_info.type =:= ?SERVER_TYPE_CROSS -> Info end),
    misc_mnesia:dirty_select(?ShareServerInfoName, Q).


%%%-------------------------------------------------------------------
is_server_worker_alive(ServerID) ->
    Pid = sel_server_pid_1(ServerID, ?TYPE_WORKER),
    misc:is_alive_lg(Pid).

%%%-------------------------------------------------------------------
send_msg_2_server_with_sid(ServerID, Msg) ->
    Pid = sel_server_pid(ServerID, ?TYPE_WINDOW),
    ps:send(Pid, Msg),
    ok.

send_msg_2_server_with_sid(ServerID, Msg, MsgData) ->
    Pid = sel_server_pid(ServerID, ?TYPE_WINDOW),
    ps:send(Pid, Msg, MsgData),
    ok.

%%%-------------------------------------------------------------------
send_msg_2_all_gs(Msg) ->
    PidList = sel_server_pid_list(?SERVER_TYPE_GAME, ?TYPE_WINDOW),
    broadcast_with_msg(PidList, Msg),
    ok.

send_msg_2_all_gs(Msg, MsgData) ->
    PidList = sel_server_pid_list(?SERVER_TYPE_GAME, ?TYPE_WINDOW),
    broadcast_with_msg_data(PidList, Msg, MsgData),
    ok.
%%%-------------------------------------------------------------------
send_msg_2_all_cross(Msg) ->
    PidList = sel_server_pid_list(?SERVER_TYPE_CROSS, ?TYPE_WINDOW),
    broadcast_with_msg(PidList, Msg),
    ok.

send_msg_2_all_cross(Msg, MsgData) ->
    PidList = sel_server_pid_list(?SERVER_TYPE_CROSS, ?TYPE_WINDOW),
    broadcast_with_msg_data(PidList, Msg, MsgData),
    ok.

%%%-------------------------------------------------------------------
send_msg_2_all_server(Msg) ->
    PidList = sel_server_pid_list(0, ?TYPE_WINDOW),
    broadcast_with_msg(PidList, Msg),
    ok.

send_msg_2_all_server(Msg, MsgData) ->
    PidList = sel_server_pid_list(0, ?TYPE_WINDOW),
    broadcast_with_msg_data(PidList, Msg, MsgData),
    ok.

send_msg_2_all_server_excl(Msg, ExceptServerID) ->
    PidList = sel_server_pid_list(0, ?TYPE_WINDOW, ExceptServerID),
    broadcast_with_msg(PidList, Msg),
    ok.

send_msg_2_all_server_excl(Msg, MsgData ,ExceptServerID) ->
    PidList = sel_server_pid_list(0, ?TYPE_WINDOW, ExceptServerID),
    broadcast_with_msg_data(PidList, Msg, MsgData),
    ok.

%%%-------------------------------------------------------------------
send_msg_2_worker_with_sid(ServerID, Msg) ->
    Pid = sel_server_pid(ServerID, ?TYPE_WORKER),
    ps:send(Pid, Msg),
    ok.

send_msg_2_worker_with_sid(ServerID, Msg, MsgData) ->
    Pid = sel_server_pid(ServerID, ?TYPE_WORKER),
    ps:send(Pid, Msg, MsgData),
    ok.
%%%-------------------------------------------------------------------
send_msg_2_all_gs_worker(Msg) ->
    PidList = sel_server_pid_list(?SERVER_TYPE_GAME, ?TYPE_WORKER),
    broadcast_with_msg(PidList, Msg),
    ok.

send_msg_2_all_gs_worker(Msg, MsgData) ->
    PidList = sel_server_pid_list(?SERVER_TYPE_GAME, ?TYPE_WORKER),
    broadcast_with_msg_data(PidList, Msg, MsgData),
    ok.

%%%-------------------------------------------------------------------
send_msg_2_all_cross_worker(Msg) ->
    PidList = sel_server_pid_list(?SERVER_TYPE_CROSS, ?TYPE_WORKER),
    broadcast_with_msg(PidList, Msg),
    ok.

send_msg_2_all_cross_worker(Msg, MsgData) ->
    PidList = sel_server_pid_list(?SERVER_TYPE_CROSS, ?TYPE_WORKER),
    broadcast_with_msg_data(PidList, Msg, MsgData),
    ok.
%%%-------------------------------------------------------------------
send_msg_2_all_server_worker(Msg) ->
    PidList = sel_server_pid_list(0, ?TYPE_WORKER),
    broadcast_with_msg(PidList, Msg),
    ok.

send_msg_2_all_server_worker(Msg, MsgData) ->
    PidList = sel_server_pid_list(0, ?TYPE_WORKER),
    broadcast_with_msg_data(PidList, Msg, MsgData),
    ok.

%%%-------------------------------------------------------------------
%%%-------------------------------------------------------------------
%%%-------------------------------------------------------------------
broadcast_with_msg([], _Msg) ->
    ok;
broadcast_with_msg([Pid | PidList], Msg) ->
    catch ps:send(Pid, Msg),
    broadcast_with_msg(PidList, Msg).

%%%-------------------------------------------------------------------
broadcast_with_msg_data([], _Msg, _MsgData) ->
    ok;
broadcast_with_msg_data([Pid | PidList], Msg, MsgData) ->
    catch ps:send(Pid, Msg, MsgData),
    broadcast_with_msg_data(PidList, Msg, MsgData).

%%%-------------------------------------------------------------------
sel_server_pid_list(ServerType, Type) ->
    sel_server_pid_list_1(ServerType, Type, 0).

sel_server_pid_list(ServerType, Type, ExceptServerID) ->
    case catch sel_server_pid_list_1(ServerType, Type, ExceptServerID) of
        {'EXIT', _} ->
            [];
        V ->
            V
    end.

sel_server_id(0) ->
    QS = ets:fun2ms(fun(Info) -> Info#m_share_server_info.sid end),
    misc_mnesia:dirty_select(?ShareServerInfoName, QS);
sel_server_id(SeverType) ->
    QS = ets:fun2ms(fun(Info) when Info#m_share_server_info.type =:= SeverType -> Info#m_share_server_info.sid end),
    misc_mnesia:dirty_select(?ShareServerInfoName, QS).

sel_server_pid_list_1(0, ?TYPE_WINDOW, ExceptServerID) ->
    QS = ets:fun2ms(fun(Info) when Info#m_share_server_info.sid =/= ExceptServerID -> Info#m_share_server_info.src_pid end),
    misc_mnesia:dirty_select(?ShareServerInfoName, QS);
sel_server_pid_list_1(Type, ?TYPE_WINDOW, ExceptServerID) ->
    QS = ets:fun2ms(fun(Info) when Info#m_share_server_info.sid =/= ExceptServerID andalso Info#m_share_server_info.type =:= Type -> Info#m_share_server_info.src_pid end),
    misc_mnesia:dirty_select(?ShareServerInfoName, QS);
sel_server_pid_list_1(0, _Type, ExceptServerID) ->
    QS = ets:fun2ms(
        fun(Info) when Info#m_share_server_info.status =:= ?SEVER_STATUS_DONE andalso Info#m_share_server_info.sid =/= ExceptServerID ->
            Info#m_share_server_info.worker end
    ),
    misc_mnesia:dirty_select(?ShareServerInfoName, QS);
sel_server_pid_list_1(Type, _Type, ExceptServerID) ->
    QS = ets:fun2ms(
        fun(Info) when Info#m_share_server_info.sid =/= ExceptServerID, Info#m_share_server_info.type =:= Type, Info#m_share_server_info.status =:= ?SEVER_STATUS_DONE ->
            Info#m_share_server_info.worker
        end
    ),
    misc_mnesia:dirty_select(?ShareServerInfoName, QS).

%%%-------------------------------------------------------------------
sel_server_pid(ServerID, Type) ->
    case catch sel_server_pid_1(ServerID, Type) of
        {'EXIT', _Err} ->
            0;
        Pid ->
            Pid
    end.


sel_server_pid_1(ServerID, ?TYPE_WINDOW) ->
%%    case ets:lookup(?GLOBAL_GS_ETS, ServerID) of
    case misc_mnesia:dirty_read(?ShareServerInfoName, ServerID) of
        [#m_share_server_info{src_pid = Pid}] when is_pid(Pid) ->
            Pid;
        _ ->
            0
    end;
sel_server_pid_1(ServerID, _Type) ->
%%    case ets:lookup(?GLOBAL_GS_ETS, ServerID) of
    case misc_mnesia:dirty_read(?ShareServerInfoName, ServerID) of
        [#m_share_server_info{worker = Pid, status = ?SEVER_STATUS_DONE}] when is_pid(Pid) ->
            Pid;
        _ ->
            0
    end.

