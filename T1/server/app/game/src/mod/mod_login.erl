%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 15. 五月 2018 20:12
%%%-------------------------------------------------------------------
-module(mod_login).
-author("mawenhong").

-behaviour(gen_serverw).
-include("logger.hrl").
-include("netmsg.hrl").
-include("common_record.hrl").

-export([login_/1, logout_/1]).
%% API
-export([start_link/0]).
-export([mod_init/1, do_handle_call/3, do_handle_info/2, do_handle_cast/2]).

login_(Req)         -> ps:send(?MODULE, login_req,Req).
logout_(AccountID)  -> ps:send(?MODULE, logout, AccountID).

%%%===================================================================
%%% public functions
%%%===================================================================
start_link() ->
    gen_serverw:start_link({local, ?MODULE}, ?MODULE, [], []).

%%%===================================================================
%%% Internal functions
%%%===================================================================	
mod_init(_Args) ->
     erlang:process_flag(trap_exit, true),
     erlang:process_flag(priority, high),

    {ok, #{lt => 1800, in => 0, lq => lqueue:new()}}.

%%--------------------------------------------------------------------	
do_handle_call(Request, From, State) ->
    ?ERROR("undeal call ~w from ~w", [Request, From]),
    {reply, ok, State}.

%%--------------------------------------------------------------------
do_handle_info({login_req, Req}, State) ->
    {noreply, lib_login:login_1(Req, State)};
do_handle_info({logout, AccountID}, State) ->
    {noreply, lib_login:logout_1(AccountID, State)};
do_handle_info(Info, State) ->
    ?ERROR("undeal info ~w", [Info]),
    {noreply, State}.

%%--------------------------------------------------------------------
do_handle_cast(Request, State) ->
    ?ERROR("undeal cast ~w", [Request]),
    {noreply, State}.


