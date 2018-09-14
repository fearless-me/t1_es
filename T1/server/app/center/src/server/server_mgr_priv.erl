%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2017, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 06. 十月 2017 11:00
%%%-------------------------------------------------------------------
-module(server_mgr_priv).
-author("mawenhong").

-include("logger.hrl").
-include("pub_def.hrl").
-include("pub_rec.hrl").
-include("common_def.hrl").
-include("common_rec.hrl").
-include("cs_priv.hrl").
%% API
-export([
	init/0, tick/0, ack_now/2, register/2, nodedown/1, server_ready/2
]).

%%%-------------------------------------------------------------------
init() ->
	tick_msg(),
	ok.


%%%-------------------------------------------------------------------
tick_msg() ->
	erlang:send_after(?SERVER_MGR_TICK, self(), tickNow).

tick() ->
	tick_msg(),
	check(),
	ok.

check() ->
	NowTime = misc_time:milli_seconds(),
	ServerList = ets:tab2list(?ETS_CACHE_SERVER_CHECK),
	do_check(NowTime, ServerList, []),
	ok.

do_check(_NowTime, [], Acc) ->
	Acc;
do_check(NowTime, [#m_cache_server_check{id = ServerID, time = ConnectTime} = Info | List], Acc) ->
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
	cs_cache:del_check_server(ServerID),
	common_interface:send_msg_2_server_with_sid(ServerID, {ackTimeOut, self()}),
%%	 worker 心跳自动退出
%%	csInterface:sendMsg2ServerWorkerWithID(ServerID, ackTimeOut),
%%	lib_cs_cgs_cache:delServerInfo(ServerID),
	mne_ex:dirty_delete(?ShareServerInfoName, ServerID),
	ok.

server_ready(_WorkerPid, {ServerID})->
	cs_cache:del_check_server(ServerID),
	ok.

%%%-------------------------------------------------------------------
ack_now(_WindowPid, {ServerID})->
	case ets:lookup(?ETS_CACHE_SERVER_CHECK, ServerID) of
		[#m_cache_server_check{id = ServerID}] ->
			case mne_ex:dirty_read(?ShareServerInfoName, ServerID) of
				[#m_share_server_info{node = GSNode, worker = WorkerPid}]->
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
	server_mgr_pub:on_nodedown(GSNode, ServerID),
	mne_ex:dirty_delete(?ShareServerInfoName, ServerID),
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
	case server_sup:start_child([{ServerId, ServerType, FromPid}]) of
		{ok, Pid} ->
			Info = #m_share_server_info{
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
			cs_cache:add_check_server(ServerId),
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
	case watchdog:ready() of
		true ->
			GSNode = erlang:node(FromPid),
			case mne_ex:dirty_read(?ShareServerInfoName, ServerId) of
				[#m_share_server_info{worker = Worker, node = Node}] when is_pid(Worker) ->
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



