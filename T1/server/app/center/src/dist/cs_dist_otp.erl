%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 27. 八月 2018 16:53
%%%-------------------------------------------------------------------
-module(cs_dist_otp).
-author("mawenhong").

-behaviour(gen_serverw).
-include("logger.hrl").
-include("pub_def.hrl").
-include("cs_ps_def.hrl").



%% API
-export([is_all_slaves_stared/0]).
-export([start_link/0]).
-export([mod_init/1, on_terminate/2, do_handle_call/3, do_handle_info/2, do_handle_cast/2]).


is_all_slaves_stared() ->
    gen_server:call(?CS_DIST_OTP, all_slaves_stared).

%%%===================================================================
%%% public functions
%%%===================================================================
start_link() ->
    gen_serverw:start_link({local, ?CS_DIST_OTP}, ?MODULE, [], []).

%%%===================================================================
%%% Internal functions
%%%===================================================================	
mod_init(_Args) ->
    erlang:process_flag(trap_exit, true),
    {ok, []}.

%%--------------------------------------------------------------------
do_handle_call(all_slaves_stared, _From, State) ->
    Ret = ?if_else(State =:= [], true, State),
    {reply, Ret, State};
do_handle_call(Request, From, State) ->
    ?ERROR("undeal call ~w from ~w", [Request, From]),
    {reply, ok, State}.

%%--------------------------------------------------------------------
do_handle_info({slave_register, SlaveNode}, State) ->
    {noreply, lists:append([SlaveNode], State)};
do_handle_info({slave_started, SlaveNode}, State) ->
    cs_share:sync(SlaveNode),
    {noreply, lists:delete(SlaveNode, State)};
do_handle_info(Info, State) ->
    ?ERROR("undeal info ~w", [Info]),
    {noreply, State}.

%%--------------------------------------------------------------------
do_handle_cast(Request, State) ->
    ?ERROR("undeal cast ~w", [Request]),
    {noreply, State}.

%%--------------------------------------------------------------------
on_terminate(_Reason, _State) ->
    ok.