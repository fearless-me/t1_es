%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 24. 七月 2018 17:25
%%%-------------------------------------------------------------------
-module(test_bag).
-author("mawenhong").

%% API
-export([run/0]).

run() ->
    case lib_player_bag:bag_valid(1) of
        true -> skip;
        _ -> lib_player_bag:new(1, 100)
    end,
    lib_player_bag:add(1, 5555, 09),
    lib_player_bag:add(1, 6666, 19),
    lib_player_bag:add(1, 7777, 29),
    lib_player_bag:add(1, 8888, 39),
    lib_player_bag:add(1, 8888, 38),
    lib_player_bag:add(1, 8888, 37),

    lib_player_bag:del_did(1, 8888, 25),
    lib_player_bag:del_did(1, 8888, 40),
    _Cnt = lib_player_bag:sum(1, 8888),


    ok.
