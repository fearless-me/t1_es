%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 11. 五月 2018 14:50
%%%-------------------------------------------------------------------
-module(lib_map_view).
-author("mawenhong").

-include("logger.hrl").
-include("map.hrl").
-include("obj.hrl").
-include_lib("stdlib/include/assert.hrl").

%% API
-export([init_vis_tile/3]).
-export([sync_movement_to_big_visual_tile/1]).
-export([sync_change_pos_visual_tile/3]).
-export([pos_to_vis_index/1]).
-export([sync_remove_pet/1]).
-export([sync_player_join_map/1]).
-export([sync_player_exit_map/1]).

-export([add_to_vis_tile/2]).



-define(VIS_KEY, map_vis_key__).
-define(VIS_W, map_vis_w__).
-define(VIS_H, map_vis_h__).

%%%-------------------------------------------------------------------
sync_player_join_map(Obj) ->
    %% fix_pos(Obj),
    Index = pos_to_vis_index(Obj#obj.pos, get(?VIS_W), 100),
    Tiles = get_vis_tile_around(Index),
    sync_add_to_vis_tile(Obj, Tiles),
    add_to_vis_tile(Obj, Index),
    ok.

%%%-------------------------------------------------------------------
sync_player_exit_map(Obj) ->
    Index = pos_to_vis_index(Obj#obj.pos, get(?VIS_W), 100),
    Tiles = get_vis_tile_around(Index),
    remove_from_vis_tile(Obj, Index),
    sync_remove_from_vis_tile(Obj, Tiles),
    ok.

%%%-------------------------------------------------------------------
sync_remove_pet(_Obj)->ok.


%%%-------------------------------------------------------------------
init_vis_tile(Width, Height, ViewDist) ->
    VisW = (Width + ViewDist - 1) div ViewDist + 2,
    VisH = (Height + ViewDist - 1) div ViewDist + 2,
    VisT = VisW * VisH,

    ?assert(VisT > 1),

    put(?VIS_W, VisW),
    put(?VIS_H, VisH),
    init_vis_tile_1(VisT),
    ok.

%%%-------------------------------------------------------------------
init_vis_tile_1(X) when X < 0 ->
    ?ERROR("");
init_vis_tile_1(X) when X =:= 0 ->
    ok;
init_vis_tile_1(X) ->
    set_vis_tile(X, #visTile{index = X}),
    init_vis_tile_1(X - 1).

%%%-------------------------------------------------------------------
%% 开始移动广播
sync_movement_to_big_visual_tile(_Msg) ->
    ok.

%%%-------------------------------------------------------------------
%% 坐標位移廣播
sync_change_pos_visual_tile(Obj, OldVisTileIndex, NewVisTileIndex) ->
    remove_from_vis_tile(Obj, OldVisTileIndex),
    {DecVisTile, AddVisTile} = vis_tile_add_dec(OldVisTileIndex, NewVisTileIndex),
    sync_remove_from_vis_tile(Obj, DecVisTile),
    sync_add_to_vis_tile(Obj, AddVisTile),
    add_to_vis_tile(Obj, NewVisTileIndex),
    ok.

%%%-------------------------------------------------------------------
%% 删除广播
sync_remove_from_vis_tile(Obj, VisTiles) ->
    sync_big_vis_tile_to_player(Obj, VisTiles, unit_remove),
    ok.

%%%-------------------------------------------------------------------
%% 添加广播
sync_add_to_vis_tile(Obj, VisTiles) ->
    sync_big_vis_tile_to_player(Obj, VisTiles, unit_add),
    ok.

%%%-------------------------------------------------------------------
%% 加入格子
add_to_vis_tile(Obj, VisTileIndex) ->
    ?assert(is_number(VisTileIndex) andalso VisTileIndex > 0),

    VisTile1 = get_vis_tile(VisTileIndex),
    VisTile2 =
        case lib_obj:obj_type(Obj) of
            ?OBJ_USR ->
                VisTile1#visTile{player = [Obj | VisTile1#visTile.player]};
            ?OBJ_MON ->
                VisTile1#visTile{monster = [Obj | VisTile1#visTile.monster]};
            ?OBJ_PET ->
                VisTile1#visTile{pet = [Obj | VisTile1#visTile.pet]};
            ?OBJ_NPC ->
                VisTile1#visTile{npc = [Obj | VisTile1#visTile.npc]};
            _ -> VisTile1
        end,

    set_vis_tile(VisTileIndex, VisTile2),
    ok.

%%%-------------------------------------------------------------------
%% 移除格子
remove_from_vis_tile(Obj, VisTileIndex) ->
    ?assert(is_number(VisTileIndex) andalso VisTileIndex > 0),

    VisTile1 = get_vis_tile(VisTileIndex),
    VisTile2 =
        case lib_obj:obj_type(Obj) of
            ?OBJ_USR ->
                VisTile1#visTile{
                    player = lists:keydelete(Obj#obj.code, #obj.code, VisTile1#visTile.player)
                };
            ?OBJ_MON ->
                VisTile1#visTile{
                    monster = lists:keydelete(Obj#obj.code, #obj.code, VisTile1#visTile.monster)
                };
            ?OBJ_PET ->
                VisTile1#visTile{
                    pet = lists:keydelete(Obj#obj.code, #obj.code, VisTile1#visTile.pet)
                };
            _ -> VisTile1
        end,
    set_vis_tile(VisTileIndex, VisTile2),
    ok.

%%%-------------------------------------------------------------------
%% 把角色信息广播到九宫格中
sync_big_vis_tile_to_player(Unit, VisTileList, Msg) ->
    ?DEBUG("~p, msg ~p to view list:~p",
        [Unit, Msg, VisTileList]),
    lists:foreach(
        fun(VisTile) ->
            _ = [Role#obj.pid ! Msg || Role <- VisTile#visTile.player, is_visible(Unit, Role)]
        end, VisTileList),
    ok.


%%%-------------------------------------------------------------------
pos_to_vis_index(Pos) ->
    pos_to_vis_index(Pos, get(?VIS_W), 100).

%% vector3 
pos_to_vis_index(Pos, VisTileWidth, ViewDist) ->
    IndexX = trunc(Pos#vector3.x / ?TILE_SCALE / ViewDist + 1),
    IndexZ = trunc(Pos#vector3.z / ?TILE_SCALE / ViewDist + 1),

    (IndexZ * VisTileWidth + IndexX).

%%%-------------------------------------------------------------------
vis_tile_add_dec(OldVisTileIndex, NewVisTileIndex) ->
    L1 = get_vis_tile_around_index(OldVisTileIndex),
    L2 = get_vis_tile_around_index(NewVisTileIndex),
    L3 = lists:subtract(L1, L2),
    L4 = lists:subtract(L2, L3),
    {[get_vis_tile(TileIndex) || TileIndex <- L3], [get_vis_tile(TileIndex) || TileIndex <- L4]}.

%%%-------------------------------------------------------------------
get_vis_tile_around(VisTileIndex) ->
    L1 = get_vis_tile_around_index(VisTileIndex),
    [get_vis_tile(TileIndex) || TileIndex <- L1 ].

get_vis_tile_around_index(VisTileIndex) ->
%% _______________
%% | lt | t | rt |
%% ---------------
%% | l  | c | r  |
%% ---------------
%% | lb | b | rb |
%% ---------------
    ?assert(VisTileIndex > 0),
    W = get(?VIS_W),
    H = get(?VIS_H),
    C = VisTileIndex,
    L = C - 1,
    R = C + 1,
    T = C - W,
    B = C + W,
    LT = T - 1,
    RT = T + 1,
    LB = B - 1,
    RB = B + 1,
    [TileIndex || TileIndex <- [C, L, R, T, B, LT, RT, LB, RB]
        , TileIndex > 1, TileIndex =< (W * H)].

%%%-------------------------------------------------------------------
get_vis_tile(VisTileIndex) ->
    get({?VIS_KEY, VisTileIndex}).

%%%-------------------------------------------------------------------
set_vis_tile(VisTileIndex, VisTile) ->
    put({?VIS_KEY, VisTileIndex}, VisTile).

%%%-------------------------------------------------------------------
is_visible(_Self, _Target) -> true.


