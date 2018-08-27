%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 31. 五月 2018 11:41
%%%-------------------------------------------------------------------
-module(cs_db_sql).
-author("mawenhong").

%% API
-export([sql/1]).

sql(load_serv_start) ->
    <<"call get_serv_start(?)">>;
sql(_) ->
    <<"">>.