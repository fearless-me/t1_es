%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 31. 五月 2018 11:41
%%%-------------------------------------------------------------------
-module(db_sql).
-author("mawenhong").

%% API
-export([sql/1]).

sql(insert_player) ->
    "insert player(aid, uid, sid, name, level, sex, camp, race, career, head,
    map_id, line, x, y, old_map_id, old_line, old_x, old_y, version)
    values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
sql(save_player) ->
    "update player set career=?, level=?, map_id=?,line=?,x=?,y=?,"
    "old_map_id=?, old_line=?, old_x=?, old_y=?, version = ? where uid=?";
sql(load_player) ->
    "select * from player where uid = ?";
sql(load_player_list) ->
    "select * from player where aid = ?";
sql(_) ->
    "".