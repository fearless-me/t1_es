%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2017, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 06. 十月 2017 11:00
%%%-------------------------------------------------------------------
-module(svr_mgr_priv).
-author("mawenhong").

-include("logger.hrl").
-include("pub_def.hrl").
-include("pub_rec.hrl").
-include("cs_priv.hrl").
%% API
-export([
	init/0, tick/0, ack_now/2, register/2, nodedown/1, server_ready/2
]).

%%%-------------------------------------------------------------------
init() ->
	lib_cs_cgs_cache:init(),
	tick_msg(),
	ok.


%%%-------------------------------------------------------------------
tick_msg() ->
	erlang:send_after(?SVRMGR_TICK, self(), tickNow).

tick() ->
	tick_msg(),
	check(),
	ok.

check() ->
	NowTime = time_misc:milli_seconds(),
	ServerList = ets:tab2list(?GCS_CK_REG),
	do_check(NowTime, ServerList, []),
	ok.

do_check(_NowTime, [], Acc) ->
	Acc;
do_check(NowTime, [#recServerCheck{id = ServerID, time = ConnectTime} = Info | List], Acc) ->
	NewAcc =
		case NowTime > ConnectTime + ?ServerAckTime of
			true ->
				catch serv_ack_timeout(ServerID),
				Acc;
			_ ->
				[Info | Acc]
		end,
	do_check(NowTime, List, NewAcc).


serv_ack_timeout(ServerID) ->
	?WARN("wait server[~p] ack timeout",[ServerID]),
	lib_cs_cgs_cache:del_from_check(ServerID),
	cs_interface:send_msg_2_server_with_sid(ServerID, {ackTimeOut, self()}),
%%	 worker 心跳自动退出
%%	csInterface:sendMsg2ServerWorkerWithID(ServerID, ackTimeOut),
%%	lib_cs_cgs_cache:delServerInfo(ServerID),
	mne_ex:dirty_delete(m_server_info, ServerID),
	ok.

server_ready(_WorkerPid, {ServerID})->
	lib_cs_cgs_cache:del_from_check(ServerID),
	ok.

%%%-------------------------------------------------------------------
ack_now(_WindowPid, {ServerID})->
	case ets:lookup(?GCS_CK_REG, ServerID) of
		[#recServerCheck{id = ServerID}] ->
			case mne_ex:dirty_read(m_server_info, ServerID) of
				[#m_server_info{node = GSNode, worker = WorkerPid}]->
					ps:send(WorkerPid, sync_all_data),
					?WARN("server[~p] worker[~p|~p], ack ok, start sync",
						[GSNode, WorkerPid, misc:registered_name(WorkerPid)]),
					ok;
				_ ->
					skip
			end,
			ok;
		_ ->
			serv_ack_timeout(ServerID)
	end,
	ok.
%%%-------------------------------------------------------------------
nodedown({GSNode, ServerID}) ->
	svr_mgr_pub:on_nodedown(GSNode, ServerID),
	mne_ex:dirty_delete(m_server_info, ServerID),
    mne_mt:remove_node_if_mnesia_running(GSNode),
	?WARN("server[~p]down, remove s[~p]",[GSNode, ServerID]),
	ok.


%%%-------------------------------------------------------------------
register(FromPid, {ServerId, ServerType, ServerName}) ->
	case can_register(FromPid, ServerId) of
		{true, WorkerPid} when is_pid(WorkerPid) ->
			ps:send_with_from(FromPid, registerAck, {true, WorkerPid});
		{true, _Any} ->
			do_register(FromPid, ServerId, ServerType, ServerName);
		Error->
			ps:send_with_from(FromPid, registerAck, {false, Error})
	end.

do_register(FromPid, ServerId, ServerType, ServerName) ->
	GSNode = erlang:node(FromPid),
	case svr_sup:start_child([{ServerId, ServerType, FromPid}]) of
		{ok, Pid} ->
			Info = #m_server_info{
				sid = ServerId
				, name = ServerName
				, type = ServerType
				, src_pid = FromPid
				, worker = Pid
				, node = GSNode
				, status = ?SEVER_STATUS_READY
			},

%%			lib_cs_cgs_cache:insertServerInfo(Info),
			mne_ex:dirty_write(Info),
			lib_cs_cgs_cache:add_to_check(ServerId),
			ps:send_with_from(FromPid, registerAck, {true, Pid}),
			?WARN("server[~p] name[~ts] wnd[~p] worker[~p|~p] registered, wait ack",
				[GSNode, ServerName, FromPid, Pid, misc:registered_name(Pid)]),
			ok;
		V ->
			?ERROR("server[~p] name[~ts] sid[~p] register failed reason[~p]",
				[GSNode, ServerName,  ServerId, V]),
			ps:send_with_from(FromPid, registerAck, {false, V}),
			ok
	end,
	ok.

can_register(FromPid, ServerId) ->
	case cs_interface:is_center_ready() of
		true ->
			GSNode = erlang:node(FromPid),
			case mne_ex:dirty_read(m_server_info, ServerId) of
				[#m_server_info{worker = Worker, node = Node}] when is_pid(Worker) ->
					case erlang:is_process_alive(Worker) of
						true ->
							case GSNode =:= Node of
								true ->
									{true, Worker};
								_ ->
									{false, {server_regisetered, Node}}
							end;
						_ ->
							{true, 0}
					end;
				_ ->
					{true, 0}
			end;
		_ ->
			{false, center_not_ready}
	end.



