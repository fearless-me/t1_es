%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 12. 一月 2018 10:28
%%%-------------------------------------------------------------------
-module(sentinel_server).
-author("mawenhong").

-behaviour(gen_serverw).
-include("common.hrl").
-include("logger.hrl").

%% define
-record(state, {}).

%% API
-export([status/0, status_/0]).
-export([ready/1, ready/0]).
-export([start_link/0]).
-export([mod_init/1, do_handle_call/3, do_handle_info/2, do_handle_cast/2]).

%%%===================================================================
%%% public functions
%%%===================================================================
start_link() ->
    gen_serverw:start_link({local, ?MODULE}, ?MODULE, [], []).

%%%===================================================================
%%% API
%%%===================================================================
status()->
    gen_server:call(?MODULE, status, infinity).

status_()->
    ps_mgr:send(?MODULE, status).

ready(V) ->
    ets:insert(?ServerState, #kv{k = 1, v = V}).

ready()->
    case catch ets:lookup(?ServerState, 1) of
        [#kv{v = V}] -> misc:integer_to_bool(V);
        _ -> false
    end.

%%%===================================================================
%%% Internal functions
%%%===================================================================	
mod_init(_Args) ->
    erlang:process_flag(trap_exit, true),
    ets:new(?ServerState,
        [public, named_table, {keypos, #kv.k}, {read_concurrency, true},{write_concurrency, true}]),
    {ok, #state{}}.

%%--------------------------------------------------------------------
do_handle_call(status, _From, State) ->
    print_status(),
    {reply, ok, State};
do_handle_call(Request, From, State) ->
    ?ERROR("undeal call ~w from ~w", [Request, From]),
    {reply, ok, State}.

%%--------------------------------------------------------------------
do_handle_info(status, State) ->
    print_status(),
    {noreply, State};
do_handle_info(Info, State) ->
    ?ERROR("undeal info ~w", [Info]),
    {noreply, State}.
%%--------------------------------------------------------------------
do_handle_cast(Request, State) ->
    ?ERROR("undeal cast ~w", [Request]),
    {noreply, State}.

%%--------------------------------------------------------------------
print_status()->
    ?WARN("status:~n"
    "==========~n"
    "cache:                ~w/~w(num/ttl)~n"
    "dbs_worker:           ~w~n"
    "player_db_instance:   ~w~n"
    "player_db_partition:  ~w~n"
    "auto reload src dirs: ~ts~n"
    "auto reload inc incs: ~ts~n"
    "auto reload interval: ~w(milliseconds)~n"
    "==========",
        [
            mod_ini_conf:get_player_cache_num(),
            mod_ini_conf:get_player_cache_ttl(),
            dbs_worker_manager:get_worker_size(),
            mysql_pool_manager:get_player_data_mysql_instance_num(),
            mod_ini_conf:get_mysql_player_db_table_partition(),
            io_lib:format("~p",[fly:info(src_dirs)]),
            io_lib:format("~p",[fly:info(inc_dirs)]),
            fly:info(interval)
        ]
    ),
    ok.
