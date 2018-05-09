%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 15. 一月 2018 17:23
%%%-------------------------------------------------------------------
-module(tcp_handler).
-author("mawenhong").

-behaviour(ranch_protocol).
-behaviour(gen_server).
-include("logger.hrl").
-include("common.hrl").
-include("netconf.hrl").

%% define
-record(state, {socket = undefined, handler = undefined}).

%% API
-export([active_stop/1, send_net_msg/1, direct_send_net_msg/2]).
-export([start_link/4]).
-export([init/1, handle_call/3, handle_cast/2, handle_info/2,
    terminate/2, code_change/3]).

%%%===================================================================
%%% API
%%%===================================================================
active_stop(Reason)->
    ps_mgr:send(self(), {active_stop, Reason}).

send_net_msg(DataBinaryList) when is_list(DataBinaryList)->
    ps_mgr:send(self(), {write, DataBinaryList}),
    ok.

direct_send_net_msg(Socket, DataBinaryList) when is_list(DataBinaryList)->
    ranch_tcp:send(Socket, DataBinaryList),
    ok.
%%%===================================================================
%%% public functions
%%%===================================================================	
start_link(Ref, Socket, Transport, Opts) ->
    {ok, proc_lib:spawn_link(?MODULE, init, [{Ref, Socket, Transport, Opts}])}.

%%%===================================================================
%%% Internal functions
%%%===================================================================	
mod_init({Ref, Socket, ranch_tcp, Opts}) ->
    %% Perform any required state initialization here.
    Handler = misc:get_value(handler, Opts, false),
    SockOpts = misc:get_value(sock_opts, Opts, [{active, once}]),
    NetConf = misc:get_value(netConf, Opts, #net_conf{max_msg_bytes = 16 * 1024}),
    ok = ranch:accept_ack(Ref),
    ok = ranch_tcp:setopts(Socket, SockOpts),
    ok = Handler:on_init(Socket),
    ok = tcp_codec:init(NetConf),
    erlang:process_flag(trap_exit, true),
    gen_server:enter_loop(?MODULE, [], #state{
        socket = Socket,handler = Handler
    }).


%%--------------------------------------------------------------------	
do_handle_call(Request, From,  #state{handler = Handler} = State) ->
    Ret = Handler:on_call_msg(Request, From),
    {reply, Ret, State}.

%%--------------------------------------------------------------------
do_handle_info({tcp, Socket, Data},
    State=#state{socket=Socket, handler = Handler}
) ->
    ranch_tcp:setopts(Socket, [{active, once}]),
    try Handler:on_data(Socket,Data), {noreply, State}
    catch _:_ ->
            ranch_tcp:shutdown(Socket, read),
            ?WARN("~p stop,shutdown socket ~p",[self(), Socket]),
            {stop, shutdown, State}
    end;
do_handle_info({tcp_closed, Socket}, #state{handler = Handler} = State) ->
    ?TRY_CATCH(Handler:on_close(Socket, tcp_closed)),
    {stop, normal, State};
do_handle_info({tcp_error, Socket, Reason}, #state{handler = Handler} = State) ->
    ?TRY_CATCH(Handler:on_close(Socket, tcp_error)),
    {stop, Reason, State};
do_handle_info({active_stop,Reason}, #state{handler = Handler, socket = Socket}=State) ->
    ?TRY_CATCH(Handler:on_close(Socket, Reason)),
    {stop, normal, State};
do_handle_info({write,DataBinaryList}, #state{socket = Socket}=State) ->
    ranch_tcp:send(Socket, DataBinaryList),
    {noreply, State};
do_handle_info(Info, #state{handler = Handler} = State) ->
    Handler:on_info_msg(Info),
    {noreply, State}.

%%--------------------------------------------------------------------
do_handle_cast(Request, #state{handler = Handler} = State) ->
    Handler:on_cast_msg(Request),
    {noreply, State}.


%%--------------------------------------------------------------------
%% @private
%% @doc
%% Initializes the server
%%
%% @spec init(Args) -> {ok, State} |
%%  {ok, State, Timeout} | ignore | {stop, Reason}
%% @end
%%--------------------------------------------------------------------
init(Args) -> mod_init(Args).

%%--------------------------------------------------------------------
%% @private
%% @doc
%% Handling call messages
%% @spec handle_call(_Request, _From, State) ->
%% {reply, Reply, NewState} |
%% {reply, Reply, NewState, timeout() | hibernate} |
%% {noreply, NewState} | {noreply, NewState, timeout() | hibernate} |
%% {stop, Reason, Reply, NewState} | {stop, Reason, NewState}
%%
%% @end
%%--------------------------------------------------------------------
handle_call(Request, From, State) ->
    try
        do_handle_call(Request, From, State)
    catch
        T : E ->
            ?ERROR("call ~w:~w,stack:~p",
                [T, E, erlang:get_stacktrace()]),
            {reply, ok, State}
    end.
%%--------------------------------------------------------------------
%% @private
%% @doc
%% Handling cast messages
%%
%% {noreply, NewState}} |
%% {noreply, NewState, timeout() | hibernate} |
%% {stop, Reason, NewState}
%%
%% @end
%%--------------------------------------------------------------------
handle_cast(Request, State) ->
    try
        do_handle_cast(Request, State)
    catch
        T : E ->
            ?ERROR("cast ~w:~w,stack:~p",
                [T, E, erlang:get_stacktrace()]),
            {noreply, State}
    end.

%%--------------------------------------------------------------------
%% @private
%% @doc
%% Handling all non call/cast messages
%%
%% @spec handle_info(Info, State) -> 
%% 	{noreply, State} | {noreply, State, Timeout} | {stop, Reason, State}
%% @end
%%--------------------------------------------------------------------
handle_info(Info, State) ->
    try
        do_handle_info(Info, State)
    catch
        T : E ->
            ?ERROR("info ~w:~w,stack:~p",
                [T, E, erlang:get_stacktrace()]),
            {noreply, State}
    end.

%%--------------------------------------------------------------------
%% @private
%% @spec terminate(Reason, State) -> void()
%% 
%%--------------------------------------------------------------------
terminate(_Reason, _State) -> ok.

%%--------------------------------------------------------------------
%% @private
%% @spec code_change(OldVsn, State, Extra) -> {ok, NewState}
%%--------------------------------------------------------------------
code_change(_OldVsn, State, _Extra) -> {ok, State}.
