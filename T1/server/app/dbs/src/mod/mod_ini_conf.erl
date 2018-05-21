%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 02. 一月 2018 20:47
%%%-------------------------------------------------------------------
-module(mod_ini_conf).
-author("mawenhong").
-include("dbs_private.hrl").

%% API
-compile(export_all).


init_conf(FileName)->
    misc:start_all_application(econfig),
    ok = econfig:register_config(?DbsIniCfg, [FileName]),
    ok.

get_dbs_worker_num() ->
    econfig:get_integer(?DbsIniCfg, dbs_worker, worker_number, 100).

get_manager_node()->
    Bin = econfig:get_binary(?DbsIniCfg, manager_node, manager_node, <<>>),
    erlang:binary_to_atom(Bin, utf8).

get_player_cache_ttl() ->
    econfig:get_integer(?DbsIniCfg, player_cache, ttl, 3600).

get_player_cache_num() ->
    econfig:get_integer(?DbsIniCfg, player_cache, cache_num, 15).

get_mysql_pool_connections() ->
    econfig:get_integer(?DbsIniCfg, mysql_pool, connections, 10).

get_mysql_player_db_table_partition()-> 5.

get_mysql_pool_max_connections() ->
    econfig:get_integer(?DbsIniCfg, mysql_pool, max_connections, 20).

get_db_conf()->
    econfig:get_value(?DbsIniCfg, db_conf).


