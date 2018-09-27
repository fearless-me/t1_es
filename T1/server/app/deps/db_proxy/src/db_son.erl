%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 30. 五月 2018 14:11
%%%-------------------------------------------------------------------
-module(db_son).
-author("mawenhong").

-behaviour(gen_serverw).
-include("logger.hrl").


%% API
-export([scheduler_/2]).
-export([start_link/1]).
-export([mod_init/1, do_handle_call/3, do_handle_info/2, do_handle_cast/2]).


scheduler_(Worker, Msg) -> ps:send(Worker, {scheduler, Msg}).
%%%===================================================================
%%% public functions
%%%===================================================================
start_link(Args) ->
    gen_serverw:start_link(?MODULE, Args, []).

-record(db_son_state, {pool, func}).
%%%===================================================================
%%% Internal functions
%%%===================================================================
mod_init([PoolId, MgrName, X, Func]) ->
    misc:register_process(self(), MgrName, [son, X]),
    erlang:process_flag(trap_exit, true),
    {ok, #db_son_state{pool = PoolId, func = Func}}.

%%--------------------------------------------------------------------
do_handle_call(Request, From, State) ->
    ?ERROR("undeal call ~w from ~w", [Request, From]),
    {reply, ok, State}.

%%--------------------------------------------------------------------
do_handle_info({scheduler, {MsgId, Msg, FromPid}}, State) ->
    #db_son_state{pool = PoolId, func = Func} = State,
    Func(MsgId, Msg, FromPid, PoolId),
    {noreply, State};
do_handle_info(Info, State) ->
    ?ERROR("undeal info ~w", [Info]),
    {noreply, State}.

%%--------------------------------------------------------------------
do_handle_cast(Request, State) ->
    ?ERROR("undeal cast ~w", [Request]),
    {noreply, State}.

