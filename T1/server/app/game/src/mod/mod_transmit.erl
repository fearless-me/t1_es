%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 14. 五月 2018 20:54
%%%-------------------------------------------------------------------
-module(mod_transmit).
-author("mawenhong").

-behaviour(gen_serverw).
-include("logger.hrl").
-include("player_transmit.hrl").
-include("common.hrl").

-export([get_player/0]).
-export([insert_player/1]).
-export([update_player/0]).
-export([delete_player/0]).

%% API
-export([start_link/0]).
-export([mod_init/1, do_handle_call/3, do_handle_info/2, do_handle_cast/2]).


%%--------------------------------------------------------------------
insert_player(Data) ->
    ok.

update_player() -> ok.

delete_player() -> ok.

get_player() -> ok.


%%%===================================================================
%%% public functions
%%%===================================================================
start_link() ->
    gen_serverw:start_link({local, ?MODULE}, ?MODULE, [], []).

%%%===================================================================
%%% Internal functions
%%%===================================================================	
mod_init(_Args) ->
    %% erlang:process_flag(trap_exit, true),
    %% erlang:process_flag(priority, high),
    ets:new(?PLAYER_TRANSMIT_ETS,
        [public, named_table, {keypos, #player_transmit.player_id}, ?ETSWC, ?ETSRC]),
    {ok, #{}}.

%%--------------------------------------------------------------------	
do_handle_call(Request, From, State) ->
    ?ERROR("undeal call ~w from ~w", [Request, From]),
    {reply, ok, State}.

%%--------------------------------------------------------------------
do_handle_info(Info, State) ->
    ?ERROR("undeal info ~w", [Info]),
    {noreply, State}.

%%--------------------------------------------------------------------
do_handle_cast(Request, State) ->
    ?ERROR("undeal cast ~w", [Request]),
    {noreply, State}.

