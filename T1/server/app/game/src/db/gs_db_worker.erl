%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 28. 五月 2018 14:17
%%%-------------------------------------------------------------------
-module(gs_db_worker).
-author("mawenhong").

-behaviour(gen_serverw).
-include("logger.hrl").
-include("pub_common.hrl").
-include("common_record.hrl").
-include("gsdef.hrl").


%% API
-export([start_link/1]).
-export([mod_init/1, do_handle_call/3, do_handle_info/2, do_handle_cast/2]).

-define(TICK_TIME, 500).
%% 10 s
-define(CONNECT_TICK, 20).

%%%===================================================================
%%% public functions
%%%===================================================================
start_link(NodeName) ->
    gen_serverw:start_link(?MODULE, [NodeName], []).

%%%===================================================================
%%% Internal functions
%%%===================================================================	
mod_init([NodeName]) ->
    erlang:process_flag(trap_exit, true),
    erlang:process_flag(priority, high),
    ets:insert(?ETS_GS_DBS, #r_gs_db_info{node = NodeName, status = ?SS_INIT}),
    ?INFO("gs to db ~p 's window started", [NodeName]),
    tick_msg(),
    {ok, #{node => NodeName}}.

%%--------------------------------------------------------------------	
do_handle_call(Request, From, State) ->
    ?ERROR("undeal call ~w from ~w", [Request, From]),
    {reply, ok, State}.

%%--------------------------------------------------------------------
do_handle_info(tick, State) ->
    tick(maps:get(node, State)),
    {noreply, State};
do_handle_info(start_connect, State) ->
    connect_db(maps:get(node, State)),
    {noreply, State};
%%{{registerAck,{true,<8951.446.0>}},<8951.219.0>}
do_handle_info({register_ack, Data, FromPid}, State) ->
    register_ack(FromPid, Data),
    {noreply, State};
do_handle_info({nodedown, NodeName}, State) ->
    nodedown(NodeName),
    {noreply, State};
do_handle_info({start_now, RemoteWorker}, State) ->
    start_now(RemoteWorker),
    {noreply, State};
do_handle_info(Info, State) ->
    ?ERROR("undeal info ~w", [Info]),
    {noreply, State}.

%%--------------------------------------------------------------------
do_handle_cast(Request, State) ->
    ?ERROR("undeal cast ~w", [Request]),
    {noreply, State}.


%%-------------------------------------------------------------------
tick(DbNodeName) ->
    tick_msg(),
    add_tick(),
    tick_connect(DbNodeName),
    ok.

tick_msg() ->
    erlang:send_after(?TICK_TIME, self(), tick).

tick_connect(DbNodeName) ->
    case (tick_count() rem ?CONNECT_TICK) =:= 0 of
        true ->
            connect_db(DbNodeName);
        _ ->
            skip
    end,
    ok.

%%%-------------------------------------------------------------------
tick_count() ->
    case get(tickCount) of undefined -> 0; V -> V end.

add_tick() -> V = tick_count(), put(tickCount, V + 1).

%%--------------------------------------------------------------------
connect_db(Node) ->
    case ets:lookup(?ETS_GS_DBS, Node) of
        [#r_gs_db_info{status = Status}] when Status =/= ?SS_INIT ->
            ok;
        _ ->
            connect_db_action(Node)
    end,
    ok.

%%--------------------------------------------------------------------
connect_db_action(Node) ->
    case net_adm:ping(Node) of
        pong -> register_me_action(Node);
        pang -> ?WARN("[~p][~p]connect dbs failed:~p", [self(), gs_core:get_db_id(), Node])
    end,
    ok.

%%--------------------------------------------------------------------
register_me_action(DbNode) ->
    DBId = gs_core:get_db_id(),
    % 已连通，打印信息
    ?WARN("[~p][~p]start register to dbs[~p]", [self(), DBId, DbNode]),
    % 监控节点
    erlang:monitor_node(DbNode, true),

    %
    ServerType = gs_core:server_type(),

    % 告诉跨服，保存本节点
    ps:send({?DBS_SVR_MGR, DbNode}, register, {self(), DBId, ServerType}),
    ets:insert(?ETS_GS_DBS, #r_gs_db_info{node = DbNode, status = ?SS_READY}),
    ?WARN("[~p][~p]wait dbs regiseter ack", [self(), DBId]),
    ok.

%%--------------------------------------------------------------------
register_ack(MgrPid, {true, RemoteWorkerPid}) ->
    DbID = gs_core:get_db_id(),
    NodeName = erlang:node(MgrPid),
    ?WARN("[~p][~p]register to dbs[~p] ok, worker[~p], start bind",
        [self(), DbID, NodeName, RemoteWorkerPid]),
    ps:send(RemoteWorkerPid, ready_now, self()),
    ok;
register_ack(MgrPid, {false, Reason}) ->
    NodeName = erlang:node(MgrPid),
    ?ERROR("[~p]register to dbs[~p] failed, y[~p]",
        [self(), NodeName, Reason]),
    ets:update_element(
        ?ETS_GS_DBS, NodeName, {#r_gs_db_info.status, ?SS_INIT}),
    ok.

start_now(RemoteWorker) ->
    NodeName = erlang:node(RemoteWorker),
    ets:update_element(
        ?ETS_GS_DBS,
        NodeName,
        {#r_gs_db_info.status, ?SS_DONE}
    ),
    ?WARN("###connect to dbs ~p ok", [NodeName]),
    ok.

%%--------------------------------------------------------------------
nodedown(NodeName) ->
    ?WARN("dbs Node[~p] is down", [NodeName]),
    ets:update_element(
        ?ETS_GS_DBS,
        NodeName,
        [
            {#r_gs_db_info.pid, 0},
            {#r_gs_db_info.status, ?SS_INIT}
        ]
    ),
    ok.

