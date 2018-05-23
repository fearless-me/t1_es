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
-export([front/3]).
-export([is_behind/3]). %% src 是否在目标反面
-export([is_front/3]). %% src 是否在目标正面
-export([normalized/1]).
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
normalized(P) ->
    #vector3{x = X, y = Y, z = Z} = P,
    Len = math:sqrt(X * X + Y * Y + Z * Z),
    case Len == 0 of
        true -> P;
        _ -> #vector3{x = X / Len, y = Y / Len, z = Z / Len}
    end.

%%
is_behind(Src, Dst, DstFace) ->
    %
    #vector3{x = X2, y = Y2, z = Z2} = DstFace,
    % dir
    #vector3{x = X1, y = Y1, z = Z1} = vector3:subtract(Src, Dst),
    % |A|*|B|*cosθ
    (X1 * X2 + Y1 * Y2 + Z1 * Z2) < 0.
%%
behind(Src, Dst, Dist) ->
    % dir
    Dir     = vector3:subtract(Src, Dst),
    % normalize
    Normal  = vector3:normalized(Dir),
    % *
    Delta   = vector3:multi(Normal, -Dist),
    % +
    vector3:add(Src, Delta).

%%
front(Src, Dst, Dist) ->
    % dir
    Dir     = vector3:subtract(Src, Dst),
    % normalize
    Normal  = vector3:normalized(Dir),
    % *
    Delta   = vector3:multi(Normal, Dist),
    % +
    vector3:add(Src, Delta).

%%
is_front(Src, Dst, DstFace) ->
    %
    #vector3{x = X2, y = Y2, z = Z2} = DstFace,
    % dir
    #vector3{x = X1, y = Y1, z = Z1} = vector3:subtract(Src, Dst),
    % |A|*|B|*cosθ
    (X1 * X2 + Y1 * Y2 + Z1 * Z2) >= 0.


%%
dist(P1, P2) ->
    Sq = vector3:dist_sq(P1, P2),
    math:sqrt(Sq).

%%
dist_sq(P1, P2) ->
    #vector3{x = X1, y = Y1, z = Z1} = P1,
    #vector3{x = X2, y = Y2, z = Z2} = P2,
    X1 * X2 + Y1 * Y2 + Z1 * Z2.

%%
linear_lerp(Src, Dst, Factor) ->
    #vector3{x = X1, y = Y1, z = Z1} = Src,
    #vector3{x = X2, y = Y2, z = Z2} = Dst,
    #vector3{
        x = X1 * (1 - Factor) + X2 * Factor,
        y = Y1 * (1 - Factor) + Y2 * Factor,
        z = Z1 * (1 - Factor) + Z2 * Factor
    }.
