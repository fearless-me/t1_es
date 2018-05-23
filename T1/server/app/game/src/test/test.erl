%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 23. 五月 2018 10:36
%%%-------------------------------------------------------------------
-module(test).
-author("mawenhong").
-include("vector3.hrl").

%% API
-export([tv3/0]).

tv3()->
    P1 = #vector3{x = 150.1, z = 100.1},
    P2 = #vector3{x = 100.1, z = 50.1},
    P3 = #vector3{x = 100.1, z = 150.1},
    io:format("normalized ~w -> ~w~n",[P1, vector3:normalized(P1)]),
    io:format("behind     ~w -> ~w~n",[P1, vector3:behind(P1, P2, 10)]),
    io:format("before     ~w -> ~w~n",[P1, vector3:before(P1, P2, 10)]),
    io:format("P1 is_before P2 -> ~w~n", [vector3:is_behind(P1, P2, vector3:subtract(P1, P2))]),
    io:format("P1 is_before P2 -> ~w~n", [vector3:is_behind(P1, P2, vector3:subtract(P2, P1))]),
    ok.
