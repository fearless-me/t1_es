%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 28. 五月 2018 17:05
%%%-------------------------------------------------------------------
-module(db_gs_interface).
-author("mawenhong").

-include("dbs_private.hrl").
-include("pub_common.hrl").

%% API
-export([send_2_gs/2]).
-export([send_2_gs/3]).
-export([send_2_all_gs/1]).
-export([send_2_all_gs/2]).

-define(TYPE_WORKER, 0).
-define(TYPE_WINDOW, 1).

%%%-------------------------------------------------------------------
send_2_gs(ServerID, Msg) ->
    Pid = sel_server_pid(ServerID, ?TYPE_WINDOW),
    ps:send(Pid, Msg),
    ok.

send_2_gs(ServerID, Msg, MsgData) ->
    Pid = sel_server_pid(ServerID, ?TYPE_WINDOW),
    ps:send(Pid, {Msg, MsgData}),
    ok.

%%%-------------------------------------------------------------------
send_2_all_gs(Msg) ->
    PidList = sel_server_pid_list(?ST_GS, ?TYPE_WINDOW),
    broadcast_with_msg(PidList, Msg),
    ok.

send_2_all_gs(Msg, MsgData) ->
    PidList = sel_server_pid_list(?ST_GS, ?TYPE_WINDOW),
    broadcast_with_msg_data(PidList, Msg, MsgData),
    ok.

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
    catch ps:send(Pid, {Msg, MsgData}),
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
    QS = ets:fun2ms(fun(Info) -> Info#sever_info.db_id end),
    ets:select(?ServerEts, QS);
sel_server_id(SeverType) ->
    QS = ets:fun2ms(fun(Info) when Info#sever_info.type =:= SeverType -> Info#sever_info.db_id end),
    ets:select(?ServerEts, QS).

sel_server_pid_list_1(0, ?TYPE_WINDOW, ExceptServerID) ->
    QS = ets:fun2ms(fun(Info) when Info#sever_info.db_id =/= ExceptServerID -> Info#sever_info.src_pid end),
    ets:select(?ServerEts, QS);
sel_server_pid_list_1(Type, ?TYPE_WINDOW, ExceptServerID) ->
    QS = ets:fun2ms(fun(Info) when Info#sever_info.db_id =/= ExceptServerID andalso Info#sever_info.type =:= Type -> Info#sever_info.src_pid end),
    ets:select(?ServerEts, QS);
sel_server_pid_list_1(0, _Type, ExceptServerID) ->
    QS = ets:fun2ms(
        fun(Info) when Info#sever_info.status =:= ?SS_DONE andalso Info#sever_info.db_id =/= ExceptServerID ->
            Info#sever_info.worker_pid end
    ),
    ets:select(?ServerEts, QS);
sel_server_pid_list_1(Type, _Type, ExceptServerID) ->
    QS = ets:fun2ms(
        fun(Info) when Info#sever_info.db_id =/= ExceptServerID, Info#sever_info.type =:= Type, Info#sever_info.status =:= ?SS_DONE ->
            Info#sever_info.worker_pid
        end
    ),
    ets:select(?ServerEts, QS).

%%%-------------------------------------------------------------------
sel_server_pid(ServerID, Type) ->
    case catch sel_server_pid_1(ServerID, Type) of
        {'EXIT', _Err} ->
            0;
        Pid ->
            Pid
    end.

sel_server_pid_1(ServerID, ?TYPE_WINDOW) ->
    case ets:lookup(?ServerEts, ServerID) of
        [#sever_info{src_pid = Pid}] when is_pid(Pid) ->
            Pid;
        _ ->
            0
    end;
sel_server_pid_1(ServerID, _Type) ->
    case ets:lookup(?ServerEts, ServerID) of
        [#sever_info{worker_pid = Pid, status = ?SS_DONE}] when is_pid(Pid) ->
            Pid;
        _ ->
            0
    end.