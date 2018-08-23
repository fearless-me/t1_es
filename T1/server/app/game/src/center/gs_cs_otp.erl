%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 15. 八月 2018 16:24
%%%-------------------------------------------------------------------
-module(gs_cs_otp).
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
    gs_cs_priv:init(),
    ?INFO("init OK"),
    {ok, #{}}.

%%--------------------------------------------------------------------
do_handle_call(Request, From, State) ->
    Ret = gs_cs_pub:call(Request, From),
    {reply, Ret, State}.

%%--------------------------------------------------------------------
do_handle_info({registerAck, Data, FromPid}, State) ->
    gs_cs_priv:register_ack(FromPid, Data),
    {noreply, State};
do_handle_info({nodedown, NodeName}, State) ->
    gs_cs_priv:nodedown(NodeName),
    {noreply, State};
do_handle_info({ackTimeOut, FromPid}, State) ->
    gs_cs_priv:ack_timeout(FromPid),
    {noreply, State};
do_handle_info({syncAllData,FromPid}, State) ->
    gs_cs_priv:sync_all_data(FromPid),
    {noreply, State};
do_handle_info(check_connect, State) ->
    gs_cs_priv:tick_check_connect(),
    {noreply, State};
do_handle_info({startNow,FromPid}, State) ->
    gs_cs_priv:start_now(FromPid),
    {noreply, State};
do_handle_info(Info, State) ->
    gs_cs_pub:info(Info),
    {noreply, State}.

%%--------------------------------------------------------------------
do_handle_cast(Request, State) ->
    ?ERROR("undeal cast ~w", [Request]),
    {noreply, State}.

%%--------------------------------------------------------------------
on_terminate(_Reason, _State) ->
    ok.