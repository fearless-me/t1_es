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

    tv3_1(P1, P2),
    tv3_1(P1, P3),
    tv3_1(P2, P1),
    tv3_1(P2, P3),
    tv3_1(P3, P1),
    tv3_1(P3, P2),
    ok.

tv3_1(Src, Dst) ->
    io:format("~n"),
    io:format("src:~w~n",[Src]),
    io:format("dst:~w~n",[Dst]),
    io:format("\tbehind     ~w -> ~w~n",[Src, vector3:behind(Src, Dst, 10)]),
    io:format("\tbefore     ~w -> ~w~n",[Src, vector3:front(Src, Dst, 10)]),
    io:format("\tSrc is_front Dst -> ~w~n", [vector3:is_front(Src, Dst, vector3:subtract(Src, Dst))]),
    io:format("\tSrc is_front Dst -> ~w~n", [vector3:is_front(Src, Dst, vector3:subtract(Dst, Src))]),
    ok.
