%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 15. 八月 2018 14:29
%%%-------------------------------------------------------------------
-module(server_mgr_srv).
-author("mawenhong").

-behaviour(gen_serverw).
-include("logger.hrl").
-include("pub_def.hrl").
-include("cs_ps_def.hrl").

%% API
-export([start_link/0]).
-export([mod_init/1, on_terminate/2, do_handle_call/3, do_handle_info/2, do_handle_cast/2]).

%%%===================================================================
%%% public functions
%%%===================================================================
start_link() ->
    gen_serverw:start_link({local, ?CS_SVR_MGR_OTP}, ?MODULE, [], []).

%%%===================================================================
%%% Internal functions
%%%===================================================================	
mod_init(_Args) ->
    erlang:process_flag(trap_exit, true),
    erlang:process_flag(priority, high),
    server_mgr_priv:init(),
    ?INFO("init OK"),
    {ok, ok}.

%%--------------------------------------------------------------------	
do_handle_call(Request, From, State) ->
    ?ERROR("call ~w from ~w", [Request, From]),
    {reply, ok, State}.

%%--------------------------------------------------------------------
do_handle_info({nodedown, Msg}, State) ->
    server_mgr_priv:nodedown(Msg),
    {noreply, State};
do_handle_info({register, Data, FromPid}, State) ->
    server_mgr_priv:register(FromPid, Data),
    {noreply, State};
do_handle_info({ackMeNow, Data, FromPid}, State) ->
    server_mgr_priv:ack_now(FromPid, Data),
    {noreply, State};
do_handle_info({allReadyNow, Data, FromPid}, State) ->
    server_mgr_priv:server_ready(FromPid, Data),
    {noreply, State};
do_handle_info(tickNow, State) ->
    server_mgr_priv:tick(),
    {noreply, State};
do_handle_info(stop_cs, State) ->
    erlang:halt(),
    {noreply, State};
do_handle_info(Info, State) ->
    ?ERROR("info ~w", [Info]),
    {noreply, State}.

%%--------------------------------------------------------------------
do_handle_cast(Request, State) ->
    ?ERROR("cast ~w", [Request]),
    {noreply, State}.

%%--------------------------------------------------------------------
on_terminate(_Reason, _State) ->
    ok.