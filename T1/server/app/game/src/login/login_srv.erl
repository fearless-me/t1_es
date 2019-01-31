%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 15. 五月 2018 20:12
%%%-------------------------------------------------------------------
-module(login_srv).
-author("mawenhong").

-behaviour(gen_serverw).
-include("logger.hrl").
-include("netmsg.hrl").
-include("gs_common_rec.hrl").
-include("gs_ps_def.hrl").

%% API
-export([start_link/0]).
-export([mod_init/1, do_handle_call/3, do_handle_info/2, do_handle_cast/2]).



%%%===================================================================
%%% public functions
%%%===================================================================
start_link() ->
    gen_serverw:start_link({local, ?GS_LOGIN_OTP}, ?MODULE, [], []).

%%%===================================================================
%%% Internal functions
%%%===================================================================	
mod_init(_Args) ->
    erlang:process_flag(trap_exit, true),
    erlang:process_flag(priority, high),
    
    {ok, #{lt => 1800, in => 0, lq => lqueue:new()}}.

%%--------------------------------------------------------------------	
do_handle_call(Request, From, State) ->
    ?ERROR("call ~w from ~w", [Request, From]),
    {reply, ok, State}.

%%--------------------------------------------------------------------
do_handle_info({login_req, Req}, State) ->
    {noreply, login_mod:login_1(Req, State)};
do_handle_info({logout, AccountID}, State) ->
    {noreply, login_mod:logout_1(AccountID, State)};
do_handle_info(Info, State) ->
    ?ERROR("info ~w", [Info]),
    {noreply, State}.

%%--------------------------------------------------------------------
do_handle_cast(Request, State) ->
    ?ERROR("cast ~w", [Request]),
    {noreply, State}.


