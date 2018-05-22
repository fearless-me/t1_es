%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 22. 五月 2018 10:41
%%%-------------------------------------------------------------------
-module(vector3).
-author("mawenhong").

-include("map.hrl").
%% API
-export([subtract/2]).
-export([dist/2, dist_sq/2]).
-export([linear_lerp/3]).

subtract(P1, P2) ->
    #vector3{
        x = P1#vector3.x - P2#vector3.x,
        y = P1#vector3.y - P2#vector3.y,
        z = P1#vector3.z - P2#vector3.z
    }.

dist(P1, P2) ->
    Sq =
        P1#vector3.x * P2#vector3.x +
            P1#vector3.y * P2#vector3.y +
            P1#vector3.z * P2#vector3.z,
    math:sqrt(Sq).

dist_sq(P1, P2) ->
    P1#vector3.x * P2#vector3.x +
        P1#vector3.y * P2#vector3.y +
        P1#vector3.z * P2#vector3.z.

linear_lerp(Src, Dst, X) ->
    #vector3{
        x = Src#vector3.x * (1 - X) + Dst#vector3.x * X,
        y = Src#vector3.y * (1 - X) + Dst#vector3.y * X,
        z = Src#vector3.z * (1 - X) + Dst#vector3.z * X
    }.
    