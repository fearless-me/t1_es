%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 12. 一月 2018 10:38
%%%-------------------------------------------------------------------
-module(svr_worker).
-author("mawenhong").

-behaviour(gen_serverw).
-include("dbs_private.hrl").
-include("pub_common.hrl").
-include("logger.hrl").

%% define
-record(state, {
    db_id = 0,
    type = 0,
    from_pid = undefined,
    register_name = unknown
}).
-define(CheckAliveTime, 1000).

%% API
-export([start_link/1]).
-export([mod_init/1, do_handle_call/3, do_handle_info/2, do_handle_cast/2]).

%%%===================================================================
%%% API
%%%===================================================================

%%%===================================================================
%%% public functions
%%%===================================================================	
start_link(Args) ->
    gen_serverw:start_link(?MODULE, Args, []).

%%%===================================================================
%%% Internal functions
%%%===================================================================
mod_init({DBId, SeverType, FromPid}) ->
    erlang:process_flag(trap_exit, true),
    erlang:process_flag(priority, high),
    try
        GSNode = erlang:node(FromPid),
        NameAtom = misc:create_atom(SeverType, [DBId]),
        true = erlang:register(NameAtom, self()),
        erlang:monitor_node(GSNode, true),
        tick_msg(),
        ?WARN("server [~p] id[~p],type[~p] [~p] init OK", [GSNode, DBId, SeverType, NameAtom]),
        {ok, #state{db_id = DBId, type = SeverType, from_pid = FromPid, register_name = NameAtom}}
    catch
        _ : Err : _ST ->
            ?ERROR("start s[~p],t[~p],node[~p],err[~p]",
                [DBId, SeverType, erlang:node(FromPid), Err]),
            {stop, exception}
    end.

%%--------------------------------------------------------------------	
do_handle_call(Request, From, State) ->
    ?ERROR("undeal call ~w from ~w", [Request, From]),
    {reply, ok, State}.

%%--------------------------------------------------------------------
do_handle_info({nodedown, NodeName}, State) ->
    nodedown(NodeName, State),
    {stop, normal, State};
do_handle_info(checkAlive, State) ->
    check_alive(State);
do_handle_info({ready_now, From}, State) ->
    ready(State#state.db_id, From),
    {noreply, State};
do_handle_info(Info, State) ->
    db_msg:do_handle_info(Info),
    {noreply, State}.

%%--------------------------------------------------------------------
do_handle_cast(Request, State) ->
    ?ERROR("undeal cast ~w", [Request]),
    {noreply, State}.

%%--------------------------------------------------------------------
check_alive(#state{db_id = DBId} = State) ->
    Pid = self(),
    case svr_worker_manager:get_server_info(DBId) of
        #sever_info{worker_pid = Pid} ->
            tick_msg(),
            {noreply, State};
        V ->
            ?WARN("server [~p] id[~p],type[~p],workerDie reginfo[~p], me[~p] stop now",
                [State#state.register_name, State#state.db_id, State#state.type, V, self()]),
            {stop, normal, State}
    end.

tick_msg() ->
    erlang:send_after(?CheckAliveTime, self(), checkAlive),
    ok.

%%--------------------------------------------------------------------
nodedown(ServerNode, #state{db_id = DBId, register_name = RegName}) ->
    ps:send(svr_worker_manager, nodedown, {ServerNode, DBId}),
    ?WARN("nodedown[~p], stop worker[~p][~p] now",
        [ServerNode, self(), RegName]),
    ok.

%%--------------------------------------------------------------------
ready(DbId, From) ->
    ?WARN("server ~p  ~p ready,", [DbId, erlang:node(From)]),
    svr_worker_manager:update_server_status(DbId, ?SS_DONE),
    db_gs_interface:send_2_gs(DbId, {start_now, self()}),
    ok.