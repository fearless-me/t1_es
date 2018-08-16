%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2017, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 27. 九月 2017 19:33
%%%-------------------------------------------------------------------
-module(cs_interface).
-author("mawenhong").

-include("cs_priv.hrl").
-include("pub_def.hrl").

-define(TYPE_WORKER, 0).
-define(TYPE_WINDOW, 1).

%% 直接给服务器发消息
-export([
    %%
    is_center_ready/0,
    
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
    is_server_worker_alive/1, select_cross/1, select_cross/2,

    %%
    get_player_state/1, get_server_info/1, get_cgs_info/0,
    %%
    get_all_sid/1
]).


%%%-------------------------------------------------------------------
is_center_ready() ->
    cs_watchdog:ready().

%%%-------------------------------------------------------------------
get_all_sid(Type)->
    sel_server_id(Type).

%%%-------------------------------------------------------------------
get_server_info(ServerID) ->
%%    case ets:lookup(?GLOBAL_GS_ETS, ServerID) of
    case mne_ex:dirty_read(m_server_info, ServerID) of
        [Info] ->
            Info;
        _ ->
            undefined
    end.

%%%-------------------------------------------------------------------
% 选取所有可用跨服信息
get_cgs_info() ->
    Q = ets:fun2ms(fun(Info) when Info#m_server_info.type =:= ?SERVER_TYPE_CGS -> Info end),
    ets:select(?GLOBAL_GS_ETS, Q).

%%%-------------------------------------------------------------------
select_cross(?SelectPolicy_Turn) ->
    L = sel_server_id(?SERVER_TYPE_CGS),
    N = ets:update_counter(?GS_SELECT_REG, ?SelectPolicy_Turn, {#pub_kv.value, 1}),
    get_n(L, N);
select_cross(?SelectPolicy_Full) ->
    Q = ets:fun2ms(
        fun(#m_server_info{online = OL, max_online = Max, type = Type} = Info) when OL < Max, Type =:= ?SERVER_TYPE_CGS ->
            {Info#m_server_info.online, Info#m_server_info.sid}
        end
    ),
    L = ets:select(?GLOBAL_GS_ETS, Q),
    S = lists:sort(fun({OL1, _S1}, {OL2, _S2}) -> OL1 > OL2 end, L),
    E =
        case lists:reverse(S) of
            [] ->
                [0];
            [{_OL, ServerID} | _] ->
                [ServerID]
        end,
    get_n(E, 1);
select_cross(_) ->
    L = sel_server_id(?SERVER_TYPE_CGS),
    get_n(L, misc:rand(1, 1000)).

get_n([], _N) ->
    0;
get_n([S | _], 1) ->
    S;
get_n(L, N) ->
    RN = N rem length(L) + 1,
    lists:nth(RN, L).

%%%-------------------------------------------------------------------
select_cross(Type, 0) ->
    select_cross(Type);
select_cross(Type, DstServerID) ->
    case get_server_info(DstServerID) of
        #m_server_info{} ->
            DstServerID;
        _ ->
            select_cross(Type)
    end.

%%%-------------------------------------------------------------------
is_server_worker_alive(ServerID) ->
    Pid = sel_server_pid_1(ServerID, ?TYPE_WORKER),
    misc:is_process_alive(Pid).

%%%-------------------------------------------------------------------
get_player_state(RoleID) ->
    case ets:lookup(?CSPLAYRER_ETS, RoleID) of
        [#recPlayerInfo{status = ST}] ->
            ST;
        _ ->
            ?PS_NONE
    end.

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
    PidList = sel_server_pid_list(?SERVER_TYPE_GS, ?TYPE_WINDOW),
    broadcast_with_msg(PidList, Msg),
    ok.

send_msg_2_all_gs(Msg, MsgData) ->
    PidList = sel_server_pid_list(?SERVER_TYPE_GS, ?TYPE_WINDOW),
    broadcast_with_msg_data(PidList, Msg, MsgData),
    ok.
%%%-------------------------------------------------------------------
send_msg_2_all_cross(Msg) ->
    PidList = sel_server_pid_list(?SERVER_TYPE_CGS, ?TYPE_WINDOW),
    broadcast_with_msg(PidList, Msg),
    ok.

send_msg_2_all_cross(Msg, MsgData) ->
    PidList = sel_server_pid_list(?SERVER_TYPE_CGS, ?TYPE_WINDOW),
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
    PidList = sel_server_pid_list(?SERVER_TYPE_GS, ?TYPE_WORKER),
    broadcast_with_msg(PidList, Msg),
    ok.

send_msg_2_all_gs_worker(Msg, MsgData) ->
    PidList = sel_server_pid_list(?SERVER_TYPE_GS, ?TYPE_WORKER),
    broadcast_with_msg_data(PidList, Msg, MsgData),
    ok.

%%%-------------------------------------------------------------------
send_msg_2_all_cross_worker(Msg) ->
    PidList = sel_server_pid_list(?SERVER_TYPE_CGS, ?TYPE_WORKER),
    broadcast_with_msg(PidList, Msg),
    ok.

send_msg_2_all_cross_worker(Msg, MsgData) ->
    PidList = sel_server_pid_list(?SERVER_TYPE_CGS, ?TYPE_WORKER),
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
    QS = ets:fun2ms(fun(Info) -> Info#m_server_info.sid end),
    ets:select(?GLOBAL_GS_ETS, QS);
sel_server_id(SeverType) ->
    QS = ets:fun2ms(fun(Info) when Info#m_server_info.type =:= SeverType -> Info#m_server_info.sid end),
    ets:select(?GLOBAL_GS_ETS, QS).

sel_server_pid_list_1(0, ?TYPE_WINDOW, ExceptServerID) ->
    QS = ets:fun2ms(fun(Info) when Info#m_server_info.sid =/= ExceptServerID -> Info#m_server_info.src_pid end),
    ets:select(?GLOBAL_GS_ETS, QS);
sel_server_pid_list_1(Type, ?TYPE_WINDOW, ExceptServerID) ->
    QS = ets:fun2ms(fun(Info) when Info#m_server_info.sid =/= ExceptServerID andalso Info#m_server_info.type =:= Type -> Info#m_server_info.src_pid end),
    ets:select(?GLOBAL_GS_ETS, QS);
sel_server_pid_list_1(0, _Type, ExceptServerID) ->
    QS = ets:fun2ms(
        fun(Info) when Info#m_server_info.status =:= ?SEVER_STATUS_DONE andalso Info#m_server_info.sid =/= ExceptServerID ->
            Info#m_server_info.worker end
    ),
    ets:select(?GLOBAL_GS_ETS, QS);
sel_server_pid_list_1(Type, _Type, ExceptServerID) ->
    QS = ets:fun2ms(
        fun(Info) when Info#m_server_info.sid =/= ExceptServerID, Info#m_server_info.type =:= Type, Info#m_server_info.status =:= ?SEVER_STATUS_DONE ->
            Info#m_server_info.worker
        end
    ),
    ets:select(?GLOBAL_GS_ETS, QS).


%%%-------------------------------------------------------------------
sel_server_pid(ServerID, Type) ->
    case catch sel_server_pid_1(ServerID, Type) of
        {'EXIT', _Err} ->
            0;
        Pid ->
            Pid
    end.


sel_server_pid_1(ServerID, ?TYPE_WINDOW) ->
    case ets:lookup(?GLOBAL_GS_ETS, ServerID) of
        [#m_server_info{src_pid = Pid}] when is_pid(Pid) ->
            Pid;
        _ ->
            0
    end;
sel_server_pid_1(ServerID, _Type) ->
    case ets:lookup(?GLOBAL_GS_ETS, ServerID) of
        [#m_server_info{worker = Pid, status = ?SEVER_STATUS_DONE}] when is_pid(Pid) ->
            Pid;
        _ ->
            0
    end.

