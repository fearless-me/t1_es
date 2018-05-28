%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 09. 一月 2018 20:17
%%%-------------------------------------------------------------------
-module(svr_worker_manager_logic).
-author("mawenhong").
-include("dbs_private.hrl").
-include("pub_common.hrl").
-include("logger.hrl").

%% API
-export([
    register/1, worker_nodedown/2
]).
%%%-------------------------------------------------------------------
worker_nodedown(ServerNode, ServerID) ->
    svr_worker_manager:del_server_info(ServerID),
    ?WARN("node[~p]down, remove s[~p]",[ServerNode, ServerID]),
    ok.

%%%-------------------------------------------------------------------
register({FromPid, DBId, ServerType}) ->
    case can_register(sentinel_server:ready(), FromPid, DBId) of
        true -> do_register(FromPid, DBId, ServerType);
        {true, Worker} -> ps:send_with_from(FromPid, register_ack, {true, Worker});
        Error -> ps:send_with_from(FromPid, register_ack, Error)
    end,
    ok.

do_register(FromPid, ServerId, ServerType) ->
    case svr_supervisor:start_child([{ServerId, ServerType, FromPid}]) of
        {ok, Pid} ->
            GSNode = erlang:node(FromPid),
            Info = #sever_info{
                db_id = ServerId
                , name = GSNode
                , type = ServerType
                , src_pid = FromPid
                , worker_pid = Pid
                , node = GSNode
                , status = ?SS_READY
            },

            svr_worker_manager:add_server_info(Info),
            ps:send_with_from(FromPid, register_ack, {true, Pid}),
            ?WARN("id[~p],type[~p],node[~p],wnd[~p],worker[~p] registered, wait ack",
                [ServerId, ServerType, GSNode, FromPid, Pid]),
            ok;
        V ->
            ?ERROR("regiseter gameserver[~p] failed, reason:[~p]",
                [ServerId, V]),
            ps:send_with_from(FromPid, register_ack, {false, V}),
            ok
    end,
    ok.

can_register(false,_FromPid, _DBId) ->
    {false, dbs_not_ready};
can_register(_, FromPid, DBId) ->
    case svr_worker_manager:get_server_info(DBId) of
        #sever_info{worker_pid = Worker, node = Node} when is_pid(Worker) ->
            FromNode = erlang:node(FromPid),
            case misc:is_alive(Worker) of
                true when FromNode =:= Node ->
                    {true, Worker};
                _ ->
                    {false, {server_regisetered, Node}}
            end;
        _ ->
            true
    end.

