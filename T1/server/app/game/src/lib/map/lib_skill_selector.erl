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
-export([circle/3, ring/4, sector/3, rectangle/4, rectangle_center/4]).

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
sector(Aer, Pos, Angle) ->
    Face  = lib_move_rw:get_face(Aer),
    Index = lib_map_view:pos_to_vis_index(Pos),
    Tiles = lib_map_view:get_vis_tile_around(Index),
    Half  = Angle / 2,
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
rectangle(Aer, Pos, Width, Height) -> rectangle_selector(Aer, Pos, Width, Height).
%% 矩形 Pos 为中心点
rectangle_center(Aer, Pos, Width, Height) ->
    Dir = lib_move_rw:get_face(Aer),
    Behind = vector3:behind(Pos, Dir, Height/2),
    rectangle_selector(Aer, Behind, Width, Height).

%% 矩形选择实现
rectangle_selector(Aer, Pos, Width, Height) ->
    Face  = lib_move_rw:get_face(Aer),
    Index = lib_map_view:pos_to_vis_index(Pos),
    Tiles = lib_map_view:get_vis_tile_around(Index),
    %%
    FC =
        fun(Der, Acc) ->
            Own = lib_unit_rw:get_owner(Der),
            case Own =/= Aer andalso Aer =/= Der of
                true ->
                    DPos = lib_move_rw:get_cur_pos(Der),
                    TarV = vector3:subtract(DPos, Pos),
                    DotC = vector3:dot_product(TarV, Face),
                    Dist_Face = vector3:dist(Face),
                    Dist_Tar = vector3:dist(TarV),
                    CosA = misc:clamp(DotC / Dist_Face / Dist_Tar, -1, 1),
                    Dist_H = Dist_Tar * CosA,
                    Dist_W_SQ = Dist_Tar * Dist_Tar - Dist_H * Dist_H,
                    case Dist_H =< Height of
                        true when Dist_W_SQ < 0 ->
                            [Der | Acc];
                        true ->
                            case Dist_W_SQ =<  Width * Width of
                                true ->
                                    [Der | Acc];
                                _ ->
                                    Acc
                            end;
                        _ ->
                            Acc
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
