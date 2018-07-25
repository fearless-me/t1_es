%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 15. 五月 2018 16:34
%%%-------------------------------------------------------------------
-module(test_change_map).
-author("mawenhong").

%% API
-export([run/0]).

run() ->
    lib_player_bag:new(1, 100),
    ok.