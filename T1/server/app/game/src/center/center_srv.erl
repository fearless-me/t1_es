%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 15. 八月 2018 16:24
%%%-------------------------------------------------------------------
-module(center_srv).
-author("mawenhong").

-behaviour(gen_serverw).
-include("logger.hrl").
-include("gs_ps_def.hrl").

%% API
-export([start_link/0]).
-export([mod_init/1, on_terminate/2, do_handle_call/3, do_handle_info/2, do_handle_cast/2]).

%%%===================================================================
%%% public functions
%%%===================================================================
start_link() ->
    gen_serverw:start_link({local, ?GS_CS_OTP}, ?MODULE, [], []).

%%%===================================================================
%%% Internal functions
%%%===================================================================	
mod_init(_Args) ->
    erlang:process_flag(trap_exit, true),
    erlang:process_flag(priority, high),
    center_priv:init(),
    ?INFO("init OK"),
    {ok, ok}.

%%--------------------------------------------------------------------
do_handle_call(Request, From, State) ->
    Ret = center_pub:call(Request, From),
    {reply, Ret, State}.

%%--------------------------------------------------------------------
do_handle_info({registerAck, Data, FromPid}, State) ->
    center_priv:register_ack(FromPid, Data),
    {noreply, State};
do_handle_info({nodedown, NodeName}, State) ->
    center_priv:nodedown(NodeName),
    {noreply, State};
do_handle_info({server_down, Data}, State) ->
    center_priv:other_down(Data),
    {noreply, State};
do_handle_info({ackTimeOut, FromPid}, State) ->
    center_priv:ack_timeout(FromPid),
    {noreply, State};
do_handle_info({syncAllData, FromPid}, State) ->
    center_priv:sync_all_data(FromPid),
    {noreply, State};
do_handle_info(check_connect, State) ->
    center_priv:tick_check_connect(),
    {noreply, State};
do_handle_info({startNow, FromPid}, State) ->
    center_priv:start_now(FromPid),
    {noreply, State};
do_handle_info(Info, State) ->
    center_pub:info(Info),
    {noreply, State}.

%%--------------------------------------------------------------------
do_handle_cast(Request, State) ->
    ?ERROR("undeal cast ~w", [Request]),
    {noreply, State}.

%%--------------------------------------------------------------------
on_terminate(_Reason, _State) ->
    ok.