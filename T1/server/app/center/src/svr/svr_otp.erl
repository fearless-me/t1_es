%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 15. 八月 2018 11:41
%%%-------------------------------------------------------------------
-module(svr_otp).
-author("mawenhong").

-behaviour(gen_serverw).
-include("logger.hrl").
-include("pub_def.hrl").
-include("pub_rec.hrl").
-include("cs_priv.hrl").

%% API
-export([start_link/1]).
-export([mod_init/1, on_terminate/2, do_handle_call/3, do_handle_info/2, do_handle_cast/2]).

-define(CheckAliveTime, 1000).
-record(state, {sid = 0, type = 0, fromPid, register_name = unknown}).
%%%===================================================================
%%% public functions
%%%===================================================================
start_link(Params) ->
    gen_serverw:start_link(
        ?MODULE, Params,
        [{spawn_opt, [{min_heap_size, 128*1024}, {min_bin_vheap_size, 32*1024}]}]
    ).

%%%===================================================================
%%% Internal functions
%%%===================================================================	
mod_init({DBId, SeverType, FromPid}) ->
    try
        GSNode = erlang:node(FromPid),
        NameAtom = makeName(SeverType, DBId),
        true = erlang:register(NameAtom, self()),
        svr_priv:set_id_pid(DBId, FromPid),
        erlang:monitor_node(GSNode, true),
        erlang:process_flag(priority, high),
        tick_msg(),
        ?WARN("server[~p][~p] init OK", [GSNode, NameAtom]),
        {ok, #state{sid = DBId, type = SeverType, fromPid = FromPid, register_name = NameAtom}}
    catch
        _ : Err ->
            ?ERROR("start s[~p],t[~p],node[~p],err[~p]",
                [DBId, SeverType, erlang:node(FromPid), Err]),
            {stop, exception}
    end.

%%--------------------------------------------------------------------	
do_handle_call(Request, From, State) ->
    Ret = svr_logic:call(Request, From),
    {reply, Ret, State}.

%%--------------------------------------------------------------------
do_handle_info(checkAlive, State) ->
    check_alive(State);
do_handle_info({ackTimeOut, _MgrPid}, State) ->
    ?WARN("ackTimeOut, stop self[~p][~p] now",
        [self(), State#state.register_name]),
    {stop, normal, State};
do_handle_info({nodedown, NodeName}, State) ->
    svr_priv:nodedown(NodeName, State#state.register_name),
    {stop, normal, State};
do_handle_info(sync_all_data, State) ->
    svr_priv:sync(),
    {noreply, State};
do_handle_info(Info, State) ->
    svr_logic:info(Info),
    {noreply, State}.



%%--------------------------------------------------------------------
do_handle_cast(Request, State) ->
    ?ERROR("undeal cast ~w", [Request]),
    {noreply, State}.

%%--------------------------------------------------------------------
on_terminate(_Reason, _State) ->
    ok.

%%--------------------------------------------------------------------
%%--------------------------------------------------------------------
check_alive(State) ->
    ServerID = svr_priv:get_sid(),
    Pid = self(),
    case cs_interface:get_server_info(ServerID) of
        #m_server_info{worker = Pid} ->
            tick_msg(),
            {noreply, State};
        V ->
            ?WARN("server [~p] id[~p],type[~p],workerDie reginfo[~p], me[~p] stop now",
                [State#state.register_name, State#state.sid, State#state.type, V, self()]),
            {stop, normal, State}
    end.

%%--------------------------------------------------------------------
%%--------------------------------------------------------------------
makeName(?SERVER_TYPE_GS, DBId) ->
    list_to_atom(lists:flatten(io_lib:format("gameServer_~p", [DBId])));
makeName(?SERVER_TYPE_CGS, DBId) ->
    list_to_atom(lists:flatten(io_lib:format("gameServerCross_~p", [DBId])));
makeName(_, _DBId) ->
    "".

%%--------------------------------------------------------------------
%%--------------------------------------------------------------------
tick_msg() ->
    erlang:send_after(?CheckAliveTime, self(), checkAlive),
    ok.
