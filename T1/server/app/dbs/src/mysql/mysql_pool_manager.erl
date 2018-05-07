%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 12. 一月 2018 10:25
%%%-------------------------------------------------------------------
-module(mysql_pool_manager).
-author("mawenhong").

-behaviour(gen_serverw).
-include("dbs_private.hrl").
-include("logger.hrl").

%% define
-record(state, {}).

%% API
-export([set_player_data_mysql_instance/1]).
-export([get_player_data_mysql_instance/0, get_player_data_mysql_instance_num/0]).
-export([get_player_mysql_pool/1, get_player_mysql_pool_/1, check_player_db/0]).
-export([start_player_mysql_pool/0]).

%%
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

%% 读取所有玩家数据库配置
set_player_data_mysql_instance([])->
    erlang:error(mysql_instance_empty);
set_player_data_mysql_instance(Ins)->
    gen_server:call(?MODULE, {set_player_data_mysql_instance, Ins},infinity),
    ok.

%% 获取mysql实例
get_player_data_mysql_instance() ->
    ets:tab2list(?PlayerDataMysqlInstanceEts).

get_player_data_mysql_instance_num() ->
    ets:info(?PlayerDataMysqlInstanceEts, size).

%% 启动mysql pool
start_player_mysql_pool() ->
    gen_server:call(?MODULE, start_player_mysql_pool, infinity).

%% 获取玩家归属的pool
get_player_mysql_pool(PlayerID) ->
    gen_server:call(?MODULE, {get_player_mysql_pool, PlayerID}, infinity).

get_player_mysql_pool_(PlayerID) ->
    PoolCount = misc:mod_1(PlayerID, mysql_pool_manager:get_player_data_mysql_instance_num()),
    [#player_mysql_pool_info{pool = Pool}] = ets:lookup(?PlayerDataMysqlPoolEts, PoolCount),
    Pool.

%% 检查
check_player_db() ->
    Num = mod_ini_conf:get_mysql_player_db_table_partition(),
    PoolNum = mysql_pool_manager:get_player_data_mysql_instance_num(),
    PoolList = [get_player_mysql_pool_(PoolID) || PoolID <- lists:seq(1, PoolNum)],
    lists:foldl(
        fun(Pool, Acc) ->
            case check_player_db_1(Pool, lists:seq(1, Num), Num) of
                [] -> Acc;
                Res -> [Res | Acc]
            end
        end, [], PoolList).

check_player_db_1(PoolID, TabList, Num) ->
    ?INFO("check pool ~p ...", [PoolID]),
    ErrorList =
        lists:foldl(
            fun(Index, Acc) ->
                Sql = mod_sql_format:format_check_player_db_sql(Index),
                Res = mysql_interface:query(PoolID, Sql, 30 * 1000),
                case mysql_interface:succeed(Res) of
                    true -> Acc;
                    _ -> [Index | Acc]
                end
            end, [], TabList),
    case ErrorList of
        [] -> skip;
        _ -> ?ERROR("PoolID[~p],need player table[1->~p], not exists~w",
            [PoolID, Num, ErrorList])
    end,
    ErrorList.

%%%===================================================================
%%% Internal functions
%%%===================================================================	
mod_init(_Args) ->
    erlang:process_flag(trap_exit, true),
    erlang:process_flag(priority, high),
    ets:new(?PlayerDataMysqlPoolEts,
        [protected, set, named_table, {keypos, #player_mysql_pool_info.id}, {read_concurrency, true}]),
    ets:new(?PlayerDataMysqlInstanceEts,
        [protected, set, named_table, {keypos, #player_db_instance_info.id}, {read_concurrency, true}]),
    {ok, #state{}}.

%%--------------------------------------------------------------------
do_handle_call({set_player_data_mysql_instance, Ins}, _From, State)->
    ets:insert(?PlayerDataMysqlInstanceEts, Ins),
    {reply, ok, State};
do_handle_call(start_player_mysql_pool, _From, State) ->
    start_player_mysql_pool_1(),
    {reply, ok, State};
do_handle_call({get_player_mysql_pool, PlayerID}, _From, State) ->
    PoolCount = misc:mod_1(PlayerID, mysql_pool_manager:get_player_data_mysql_instance_num()),
    [#player_mysql_pool_info{pool = Pool}] = ets:lookup(?PlayerDataMysqlPoolEts, PoolCount),
    {reply, Pool, State};
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



%%--------------------------------------------------------------------
start_player_mysql_pool_1() ->
    InsList = mysql_pool_manager:get_player_data_mysql_instance(),
    _ = [start_player_mysql_pool_2(Ins) || Ins <- InsList],
    ok.

start_player_mysql_pool_2(#player_db_instance_info{
    id = Id,
    host = Host, port = Port,
    user = User, password = Password, database = Database
}) ->
    Connections = mod_ini_conf:get_mysql_pool_connections(),
    MaxConnections = mod_ini_conf:get_mysql_pool_max_connections(),
    Pool = erlang:list_to_atom(lists:flatten(io_lib:format("player_db_pool_~w", [Id]))),
    mysql_pool:start_db_pool_alone(
        Pool, Host, Port, User, Password, Database, Connections, MaxConnections),
    ets:insert(?PlayerDataMysqlPoolEts,
        #player_mysql_pool_info{id = Id, pool = Pool}),
    ok.

