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

-include("vector3.hrl").
%% API
-export([add/2]).
-export([subtract/2]).
-export([multi/2]).
-export([divi/2]).
-export([behind/3]).
-export([before/3]).
-export([dist/2, dist_sq/2]).
-export([linear_lerp/3]).

%%
add(P1, P2) ->
    #vector3{x = X1, y = Y1, z = Z1} = P1,
    #vector3{x = X2, y = Y2, z = Z2} = P2,
    #vector3{x = X1 + X2, y = Y1 + Y2, z = Z1 + Z2}.

%%
subtract(P1, P2) ->
    #vector3{x = X1, y = Y1, z = Z1} = P1,
    #vector3{x = X2, y = Y2, z = Z2} = P2,
    #vector3{x = X1 - X2, y = Y1 - Y2, z = Z1 - Z2}.

%%
multi(P, Factor) ->
    #vector3{x = X, y = Y, z = Z} = P,
    #vector3{x = X * Factor, y = Y * Factor, z = Z * Factor}.

%%
divi(_P, 0) ->
    #vector3{};
divi(P, Factor) ->
    #vector3{x = X, y = Y, z = Z} = P,
    #vector3{x = X / Factor, y = Y / Factor, z = Z / Factor}.

%%
normalized(
    #vector3{
        x = X, y = Y, z = Z
    } = P
) ->
    Len = math:sqrt(X * X + Y * Y + Z * Z),
    case Len == 0 of
        true -> P;
        _ -> #vector3{x = X / Len, y = Y / Len, z = Z / Len}
    end.
%%
behind(Src, Dst, Dist) ->
    % 目标朝向我
    FaceDir = Dst - Src,
    % 归一化
    Normal  = normalized(FaceDir),
    % *
    Delta   = multi(Normal, Dist),
    % +
    add(Src, Delta).

%%
before(Src, Dst, Dist) ->
    % 目标朝向我
    FaceDir = Dst - Src,
    % 归一化
    Normal  = normalized(FaceDir),
    % *
    Delta   = multi(Normal, -Dist),
    % +
    add(Src, Delta).

%%
dist(P1, P2) ->
    Sq = dist(P1, P2),
    math:sqrt(Sq).

%%
dist_sq(P1, P2) ->
    P1#vector3.x * P2#vector3.x +
        P1#vector3.y * P2#vector3.y +
        P1#vector3.z * P2#vector3.z.
%%
linear_lerp(Src, Dst, X) ->
    #vector3{
        x = Src#vector3.x * (1 - X) + Dst#vector3.x * X,
        y = Src#vector3.y * (1 - X) + Dst#vector3.y * X,
        z = Src#vector3.z * (1 - X) + Dst#vector3.z * X
    }.
    