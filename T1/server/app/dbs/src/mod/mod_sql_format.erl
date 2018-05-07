%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 10. 一月 2018 14:52
%%%-------------------------------------------------------------------
-module(mod_sql_format).
-author("mawenhong").

%% API
-export([
    format_load_sql/1,
    format_sql_del/1,
    format_sql_insert/1,
    format_sql_update/3,
    format_check_player_db_sql/1
]).

format_check_player_db_sql(Idx)->
    io_lib:format("select min(player_id) from player_~p",[Idx]).


format_load_sql(PlayerID)->
    Idx = player_id_to_table_idx(PlayerID),
    io_lib:format("select player_id,name,data,version from player_~p where player_id = ~p", [Idx,PlayerID]).

format_sql_del(PlayerID) ->
    Idx = player_id_to_table_idx(PlayerID),
    io_lib:format("delete from player_~p where player_id = ~p", [Idx,PlayerID]).

format_sql_insert(PlayerID) ->
    Idx = player_id_to_table_idx(PlayerID),
    io_lib:format("insert player_~p(player_id,name,version,data) VALUES(?,?,?,?)",[Idx]).

format_sql_update(PlayerID, Data, Version) ->
    Idx = player_id_to_table_idx(PlayerID),
    io_lib:format("update player_~p set data = ~p, version = ~p where player_id = ~p and version < ~p",
        [Idx, Data, version, PlayerID, Version]).

player_id_to_table_idx(PlayerID)->
    misc:mod_1(PlayerID, mod_ini_conf:get_mysql_player_db_table_partition()).
