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
-export([new/0, new/3]).
-export([zero/0]).
-export([valid/1]).
-export([x/1, y/1, z/1, angle/2]).
-export([add/2]).
-export([subtract/2]).
-export([multi/2]).
-export([divi/2]).
-export([behind/3, behind_dir/3]).
-export([front/3, front_dir/3]).
-export([is_behind/3]). %% src 是否在目标反面
-export([is_front/3]). %% src 是否在目标正面
-export([normalized/1]).
-export([dist/1, dist_sq/1]).
-export([dist/2, dist_sq/2]).
-export([linear_lerp/3]).
-export([rotate_around_origin_2d/2]). %% 围绕原点的2d旋转,传入的是角度
-export([dot_product/2, cross_product/2, dot_product_v/2, cross_product_v/2, dist_to_line/3]).
%% 点乘 a●b = |a|*|b|*cosθ
%% 叉乘 |a*b| = |a|*|b|*sinθ

angle(V1, V2) ->
    % cost(Angle) = A*B/ |A|*|B|
    DistA = vector3:dist(V1),
    DistB = vector3:dist(V2),
    DotAB = vector3:dot_product(V1, V2),
    Cross = vector3:cross_product(V1, V2),
    CosA =
        case DistA == 0 orelse DistB == 0 of
            true ->
                0;
            _ ->
                DotAB/DistA/DistB
        end,
    Angle = erlang:trunc(math:acos(CosA) * 180 / math:pi() * 10)/10,
    if
        Cross =< 0 ->
            Angle;
        true ->
            360 - Angle
    end.



%% V 到 S、E 表示的支线的距离
dist_to_line(V, S, E)->
    V1 = vector3:subtract(S, V),
    V2 = vector3:subtract(E, S),
    V3 = vector3:cross_product_v(V1, V2),
    % | V1 * V2| 表示菱形面积 |V2| 高
    vector3:dist(V3) / vector3:dist(V2).

%%  叉乘
cross_product(V1, V2) ->
    CV = cross_product_v(V1, V2),
    vector3:x(CV) + vector3:y(CV) + vector3:z(CV).

cross_product_v(V1, V2) ->
    #vector3{x = X1, y = Y1, z = Z1} = V1,
    #vector3{x = X2, y = Y2, z = Z2} = V2,
    #vector3{x = Y1*Z2 - Y2*Z1, y = Z1*X2 - Z2*X1, z = X1*Y2 - X2*Y1}.

%%  点乘
dot_product(V1, V2) ->
    DV = dot_product_v(V1, V2),
    vector3:x(DV) + vector3:y(DV) + vector3:z(DV).

dot_product_v(V1, V2) ->
    #vector3{x = X1, y = Y1, z = Z1} = V1,
    #vector3{x = X2, y = Y2, z = Z2} = V2,
    #vector3{x = X1*X2, y = Y1*Y2, z = Z1*Z2}.

%%
zero()-> #vector3{}.

%%
new() -> #vector3{x = 0.0, y = 0.0, z =0.0}.

%%
new(X, Y, Z) -> #vector3{x = float(X), y = float(Y), z = float(Z)}.

%%
x(V) -> V#vector3.x.
y(V) -> V#vector3.y.
z(V) -> V#vector3.z.

%%
valid(V) ->
    #vector3{x = X,  z = Z} = V,
    erlang:is_number(X) andalso erlang:is_number(Z).

%%
add(V1, V2) ->
    #vector3{x = X1, y = Y1, z = Z1} = V1,
    #vector3{x = X2, y = Y2, z = Z2} = V2,
    #vector3{x = X1 + X2, y = Y1 + Y2, z = Z1 + Z2}.

%%
subtract(V1, V2) ->
    #vector3{x = X1, y = Y1, z = Z1} = V1,
    #vector3{x = X2, y = Y2, z = Z2} = V2,
    #vector3{x = X1 - X2, y = Y1 - Y2, z = Z1 - Z2}.

%%
multi(V, Factor) ->
    #vector3{x = X, y = Y, z = Z} = V,
    #vector3{x = X * Factor, y = Y * Factor, z = Z * Factor}.

%%
divi(_V, Factor) when Factor == 0 ->
    #vector3{};
divi(V, Factor) ->
    #vector3{x = X, y = Y, z = Z} = V,
    #vector3{x = X / Factor, y = Y / Factor, z = Z / Factor}.

%%
normalized(V) ->
    Len = vector3:dist(V),
    case Len == 0 of
        true -> V;
        _ ->
            #vector3{x = X, y = Y, z = Z} = V,
            #vector3{x = X / Len, y = Y / Len, z = Z / Len}
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
    Dir = vector3:subtract(Src, Dst),
    behind_dir_action(Src, Dir, Dist).

behind_dir(Src, Dir, Dist) ->
    behind_dir_action(Src, Dir, Dist).

behind_dir_action(Src, Dir, Dist) ->
    % normalize
    Normal = vector3:normalized(Dir),
    % *
    Delta = vector3:multi(Normal, -Dist),
    % +
    vector3:add(Src, Delta).

%%
front(Src, Dst, Dist) ->
    % dir
    Dir = vector3:subtract(Src, Dst),
    front_dir_action(Src, Dir, Dist).

%%
front_dir(Src, Dir, Dist) ->
    front_dir_action(Src, Dir, Dist).

front_dir_action(Src, Dir, Dist) ->
    % normalize
    Normal = vector3:normalized(Dir),
    % *
    Delta = vector3:multi(Normal, Dist),
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
dist(V) ->
    Sq = vector3:dist_sq(V),
    math:sqrt(Sq).

dist_sq(V) ->
    #vector3{x = X, y = Y, z = Z} = V,
    X * X + Y * Y + Z * Z.

%%
dist(V1, V2) ->
    Sq = vector3:dist_sq(V1, V2),
    math:sqrt(Sq).

%%
dist_sq(V1, V2) ->
    #vector3{x = X1, y = Y1, z = Z1} = V1,
    #vector3{x = X2, y = Y2, z = Z2} = V2,
    X = X1 - X2, Y = Y1 - Y2, Z = Z1 - Z2,
    X * X + Y * Y + Z * Z.

%% 线性差值
linear_lerp(Src, Dst, Factor) ->
    #vector3{x = X1, y = Y1, z = Z1} = Src,
    #vector3{x = X2, y = Y2, z = Z2} = Dst,
    #vector3{
        x = X1 * (1 - Factor) + X2 * Factor,
        y = Y1 * (1 - Factor) + Y2 * Factor,
        z = Z1 * (1 - Factor) + Z2 * Factor
    }.

rotate_around_origin_2d(V, Ang0) ->
    Ang = Ang0*math:pi()/180,
    Matrix_00 = Matrix_11 = 0 + math:cos(Ang),
    Matrix_01 = math:sin(Ang), Matrix_10 = 0 - Matrix_01,
    #vector3{
        x = Matrix_00 * vector3:x(V) + Matrix_01 * vector3:z(V),
        z = Matrix_10 * vector3:x(V) + Matrix_11 * vector3:z(V)
    }.
