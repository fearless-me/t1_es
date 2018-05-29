%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 29. 五月 2018 14:21
%%%-------------------------------------------------------------------
-module(mod_db).
-author("mawenhong").

-behaviour(gen_serverw).
-include("logger.hrl").

-export([get_pool/0]).

%% API
-export([start_link/0]).
-export([mod_init/1, do_handle_call/3, do_handle_info/2, do_handle_cast/2]).

get_pool() -> gen_server:call(?MODULE, get_pool).

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

    {ok, start_player_mysql_pool()}.

%%--------------------------------------------------------------------
do_handle_call(get_pool, _From, State) ->
    {reply, maps:get(pool, State), State};
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



start_player_mysql_pool() ->
    Connections = 20, MaxConnections = 40,
    Pool = erlang:list_to_atom("player_db_pool_1"),
    mysql_pool:start_db_pool_alone(
        Pool, "127.0.0.1", 3306, "root", "1234", "player_data_1", Connections, MaxConnections),
    #{pool => Pool}.



