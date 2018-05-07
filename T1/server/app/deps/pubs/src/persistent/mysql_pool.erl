%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2017, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 29. 十二月 2017 9:54
%%%-------------------------------------------------------------------
-module(mysql_pool).
-author("mawenhong").

%% API
-export([
    start_db_pool_alone/8,start_db_pool_alone_emysql/7
]).


start_db_pool_alone(
    PoolName,
    Host, Port,
    User, Password, Database,
    PoolSize, OverFlow
) ->
    MySqlOptions =
        [
            {keep_alive, true},
            {host, Host},{port, Port},
            {user, User}, {password, Password}, {database, Database},
            {prepare, []}
        ],
    PoolOptions = [{size, PoolSize}, {max_overflow, OverFlow}],
    {ok, _Pid} = mysql_poolboy:add_pool(PoolName, PoolOptions, MySqlOptions).

start_db_pool_alone_emysql(
    PoolName, Host, Port, User, Password, Database, PoolSize)->
    ok = emysql:add_pool(PoolName, PoolSize,
        User,
        Password,
        Host,
        Port,
        Database,
        utf8),
    emysql:prepare(get_player_data, "call get_player_data(?)"),
    emysql:prepare(insert_player_data, "call insert_player_data(?,?,?,?)"),
    ok.