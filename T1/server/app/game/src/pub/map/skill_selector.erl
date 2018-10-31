%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 09. 七月 2018 15:50
%%%-------------------------------------------------------------------
-module(skill_selector).
-author("mawenhong").
-include("logger.hrl").
-include("rec_rw.hrl").
-include("combat.hrl").
-include("map_core.hrl").



%% API
-export([circle/4, ring/5, sector/5, rectangle/6, rectangle_center/6]).

%% 圆形
circle(Aer, Pos, Radius, TargetType) ->
    Index = map_view:pos_to_vis_index(Pos),
    Tiles = map_view:get_vis_tile_around(Index),
    %%
    FC =
        fun(Der, Acc) ->Own = object_rw:get_owner(Der),
            case Own =/= Aer andalso Aer =/= Der of
                true ->
                    DPos = object_rw:get_cur_pos(Der),
                    Dist = vector3:dist(Pos, DPos),
                    case Dist =< Radius of
                        true -> [Der | Acc];
                        _ -> Acc
                    end;
                _ ->
                    Acc
            end
        end,
    select_from_tiles(Tiles, FC, [], TargetType).

%% 环形
ring(Aer, Pos, RadiusIn, RadiusOut, TargetType) ->
    Index = map_view:pos_to_vis_index(Pos),
    Tiles = map_view:get_vis_tile_around(Index),
    %%
    FC =
        fun(Der, Acc) ->
            Own = object_rw:get_owner(Der),
            case Own =/= Aer andalso Aer =/= Der of
                true ->
                    DPos = object_rw:get_cur_pos(Der),
                    Dist = vector3:dist(Pos, DPos),
                    case Dist >= RadiusIn andalso Dist =< RadiusOut of
                        true -> [Der | Acc];
                        _ -> Acc
                    end;
                _ ->
                    Acc
            end
        end,
    select_from_tiles(Tiles, FC, [], TargetType).

%% 扇形
sector(Aer, Pos, Face, Angle, TargetType) ->
    Index = map_view:pos_to_vis_index(Pos),
    Tiles = map_view:get_vis_tile_around(Index),
    Half = Angle / 2,
    %%
    FC =
        fun(Der, Acc) ->
            Own = object_rw:get_owner(Der),
            case Own =/= Aer andalso Aer =/= Der of
                true ->
                    DPos = object_rw:get_cur_pos(Der),
                    DDir = vector3:subtract(DPos, Pos),
                    AngleBetween = vector3:angle(Face, DDir),
                    case AngleBetween =< Half of
                        true -> [Der | Acc];
                        _ -> Acc
                    end;
                _ ->
                    Acc
            end
        end,
    select_from_tiles(Tiles, FC, [], TargetType).

%% 矩形
rectangle(Aer, Pos, Dir, Width, Height, TargetType) ->
    rectangle_selector(Aer, Pos, Dir, Width, Height, TargetType).

%% 矩形 Pos 为中心点
rectangle_center(Aer, Pos, Dir, Width, Height, TargetType) ->
    Behind = vector3:behind_dir(Pos, Dir, Height / 2),
    rectangle_selector(Aer, Behind, Dir, Width, Height, TargetType).

%% 矩形选择实现
rectangle_selector(Aer, Pos, Face, Width, Height, TargetType) ->
    Index = map_view:pos_to_vis_index(Pos),
    Tiles = map_view:get_vis_tile_around(Index),
    Face_SQ = vector3:dist_sq(Face),
    Height_SQ = Height * Height,
    Width_SQ = Width * Width,
    %%
    FC =
        fun(Der, Acc) ->
            Own = object_rw:get_cur_pos(Der),
            case Own =/= Aer andalso Aer =/= Der of
                true ->
                    DPos = object_rw:get_cur_pos(Der),
                    TarV = vector3:subtract(DPos, Pos),
                    Dot_Dist = vector3:dot_product(TarV, Face),
                    % cos(a) >0 [0,90]
                    case Dot_Dist < 0 of
                        true -> Acc;
                        _ ->
                            %% 点乘 a●b = |a|*|b|*cosθ
                            Dot_Dist_SQ = Dot_Dist * Dot_Dist,
                            %% 目标点距离 投影到face上的距离
                            ProjectorDist_SQ =
                                case Face_SQ == 0 of
                                    true -> 0;
                                    _ -> Dot_Dist_SQ / Face_SQ
                                end,
                            
                            case ProjectorDist_SQ > Height_SQ of
                                true -> Acc;
                                _ ->
                                    TarV_SQ = vector3:dist_sq(TarV),
                                    case TarV_SQ - ProjectorDist_SQ > Width_SQ of
                                        true -> Acc;
                                        _ -> [Der | Acc]
                                    end
                            end
                    end;
                _ ->
                    Acc
            end
        end,
    select_from_tiles(Tiles, FC, [], TargetType).


%%-------------------------------------------------------------------
select_from_tiles([], _Func, Acc, _TargetType) ->
    Acc;
select_from_tiles([ #m_vis_tile{player = PL, monster = ML, pet = Pets} | Tiles], Func, Acc0, TargetType) ->
    Acc1 = select_apply(PL, Func, Acc0, TargetType band ?SKILL_TARGET_PLAYER),
    Acc2 = select_apply(ML, Func, Acc1, TargetType band ?SKILL_TARGET_MONSTER),
    Acc3 = select_apply(Pets, Func, Acc2, TargetType band ?SKILL_TARGET_PET),
    select_from_tiles(Tiles, Func, Acc3, TargetType).

%%-------------------------------------------------------------------
select_apply(ObjList, Func, Acc0, X) when X > 0 ->
    lists:foldl(fun(Uid, Acc1) -> Func(Uid, Acc1) end, Acc0, ObjList);
select_apply(_ObjList, _Func, Acc0, _X) ->
    Acc0.