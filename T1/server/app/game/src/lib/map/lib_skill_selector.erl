%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 09. 七月 2018 15:50
%%%-------------------------------------------------------------------
-module(lib_skill_selector).
-author("mawenhong").
-include("logger.hrl").
-include("vector3.hrl").
-include("map.hrl").
-include("map_unit.hrl").


%% API
-export([circle/3, ring/4, sector/4, rectangle/5, rectangle_center/5]).

%% 圆形
circle(Aer, Pos, Radius) ->
    Index = lib_map_view:pos_to_vis_index(Pos),
    Tiles = lib_map_view:get_vis_tile_around(Index),
    %%
    FC =
        fun(Der, Acc) ->
            Own = lib_unit_rw:get_owner(Der),
            case Own =/= Aer andalso Aer =/= Der of
                true ->
                    DPos = lib_move_rw:get_cur_pos(Der),
                    Dist = vector3:dist(Pos, DPos),
                    case Dist =< Radius of
                        true -> [Der | Acc];
                        _ -> [Acc]
                    end;
                _ ->
                    Acc
            end
        end,
    FV =
        fun(#m_vis_tile{player = PL, monster = ML, npc = NL, pet = Pets}, Acc0) ->
            Acc1 = lists:foldl(fun(Uid, Acc) -> FC(Uid, Acc) end, Acc0, PL),
            Acc2 = lists:foldl(fun(Uid, Acc) -> FC(Uid, Acc) end, Acc1, ML),
            Acc3 = lists:foldl(fun(Uid, Acc) -> FC(Uid, Acc) end, Acc2, NL),
            lists:foldl(fun(Uid, Acc) -> FC(Uid, Acc) end, Acc3, Pets)
        end,
    lists:foldl(FV, [], Tiles).

%% 环形
ring(Aer, Pos, RadiusIn, RadiusOut) ->
    Index = lib_map_view:pos_to_vis_index(Pos),
    Tiles = lib_map_view:get_vis_tile_around(Index),
    %%
    FC =
        fun(Der, Acc) ->
            Own = lib_unit_rw:get_owner(Der),
            case Own =/= Aer andalso Aer =/= Der of
                true ->
                    DPos = lib_move_rw:get_cur_pos(Der),
                    Dist = vector3:dist(Pos, DPos),
                    case Dist >= RadiusIn andalso Dist =< RadiusOut of
                        true -> [Der | Acc];
                        _ -> [Acc]
                    end;
                _ ->
                    Acc
            end
        end,
    FV =
        fun(#m_vis_tile{player = PL, monster = ML, npc = NL, pet = Pets}, Acc0) ->
            Acc1 = lists:foldl(fun(Uid, Acc) -> FC(Uid, Acc) end, Acc0, PL),
            Acc2 = lists:foldl(fun(Uid, Acc) -> FC(Uid, Acc) end, Acc1, ML),
            Acc3 = lists:foldl(fun(Uid, Acc) -> FC(Uid, Acc) end, Acc2, NL),
            lists:foldl(fun(Uid, Acc) -> FC(Uid, Acc) end, Acc3, Pets)
        end,
    lists:foldl(FV, [], Tiles).

%% 扇形
sector(Aer, Pos, Face, Angle) ->
    Index = lib_map_view:pos_to_vis_index(Pos),
    Tiles = lib_map_view:get_vis_tile_around(Index),
    Half = Angle / 2,
    %%
    FC =
        fun(Der, Acc) ->
            Own = lib_unit_rw:get_owner(Der),
            case Own =/= Aer andalso Aer =/= Der of
                true ->
                    DPos = lib_move_rw:get_cur_pos(Der),
                    AngleBetween = vector3:angle(Face, DPos),
                    case AngleBetween =< Half of
                        true -> [Der | Acc];
                        _ -> [Acc]
                    end;
                _ ->
                    Acc
            end
        end,
    FV =
        fun(#m_vis_tile{player = PL, monster = ML, npc = NL, pet = Pets}, Acc0) ->
            Acc1 = lists:foldl(fun(Uid, Acc) -> FC(Uid, Acc) end, Acc0, PL),
            Acc2 = lists:foldl(fun(Uid, Acc) -> FC(Uid, Acc) end, Acc1, ML),
            Acc3 = lists:foldl(fun(Uid, Acc) -> FC(Uid, Acc) end, Acc2, NL),
            lists:foldl(fun(Uid, Acc) -> FC(Uid, Acc) end, Acc3, Pets)
        end,
    lists:foldl(FV, [], Tiles).

%% 矩形
rectangle(Aer, Pos, Dir, Width, Height) ->
    rectangle_selector(Aer, Pos, Dir, Width, Height).

%% 矩形 Pos 为中心点
rectangle_center(Aer, Pos, Dir, Width, Height) ->
    Behind = vector3:behind_dir(Pos, Dir, Height / 2),
    rectangle_selector(Aer, Behind, Dir, Width, Height).

%% 矩形选择实现
rectangle_selector(Aer, Pos, Face, Width, Height) ->
    Index = lib_map_view:pos_to_vis_index(Pos),
    Tiles = lib_map_view:get_vis_tile_around(Index),
    Face_SQ = vector3:dist_sq(Face),
    Height_SQ = Height * Height,
    Width_SQ = Width * Width,
    %%
    FC =
        fun(Der, Acc) ->
            Own = lib_unit_rw:get_owner(Der),
            case Own =/= Aer andalso Aer =/= Der of
                true ->
                    DPos = lib_move_rw:get_cur_pos(Der),
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
    FV =
        fun(#m_vis_tile{player = PL, monster = ML, npc = NL, pet = Pets}, Acc0) ->
            Acc1 = lists:foldl(fun(Uid, Acc) -> FC(Uid, Acc) end, Acc0, PL),
            Acc2 = lists:foldl(fun(Uid, Acc) -> FC(Uid, Acc) end, Acc1, ML),
            Acc3 = lists:foldl(fun(Uid, Acc) -> FC(Uid, Acc) end, Acc2, NL),
            lists:foldl(fun(Uid, Acc) -> FC(Uid, Acc) end, Acc3, Pets)
        end,
    lists:foldl(FV, [], Tiles).
