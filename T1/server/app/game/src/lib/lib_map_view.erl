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
-include("vector3.hrl").
-include("map.hrl").
-include("map_obj.hrl").
-include_lib("stdlib/include/assert.hrl").

%% API
-export([init_vis_tile/1]).
-export([sync_movement_to_big_visual_tile/1]).
-export([sync_change_pos_visual_tile/3]).
-export([pos_to_vis_index/1]).
-export([sync_del_pet/1]).
-export([sync_player_join_map/1]).
-export([sync_player_exit_map/1]).

-export([add_to_vis_tile/2]).



-define(VIS_KEY, map_vis_key__).
-define(VIS_W, map_vis_w__).
-define(VIS_H, map_vis_h__).
-define(CELL_SIZE, map_cell_size__).

%%%-------------------------------------------------------------------
sync_player_join_map(Obj) ->
    %% fix_pos(Obj),
    Index = pos_to_vis_index(lib_map_rw:get_obj_pos(Obj), get(?VIS_W), ?VIS_DIST),
    Tiles = get_vis_tile_around(Index),
    sync_add_to_vis_tile(Obj, Tiles),
    add_to_vis_tile(Obj, Index),
    ok.

%%%-------------------------------------------------------------------
sync_player_exit_map(Obj) ->
    Index = pos_to_vis_index(lib_map_rw:get_obj_pos(Obj), get(?VIS_W), ?VIS_DIST),
    Tiles = get_vis_tile_around(Index),
    del_from_vis_tile(Obj, Index),
    sync_del_from_vis_tile(Obj, Tiles),
    ok.

%%%-------------------------------------------------------------------
sync_del_pet(_Obj)->ok.


%%%-------------------------------------------------------------------
init_vis_tile(#recGameMapCfg{
    colCellNum = Col,
    rowCellNum = Row,
    cellSize = CellSize
}) ->
    VisW = (Col + ?VIS_DIST - 1) div ?VIS_DIST + 2,
    VisH = (Row + ?VIS_DIST - 1) div ?VIS_DIST + 2,
    VisT = VisW * VisH,

    ?assert(VisT > 1),

    put(?VIS_W, VisW),
    put(?VIS_H, VisH),
    put(?CELL_SIZE, CellSize),
    init_vis_tile_1(VisT),
    ok.

%%%-------------------------------------------------------------------
init_vis_tile_1(X) when X < 0 ->
    ?ERROR("");
init_vis_tile_1(X) when X =:= 0 ->
    ok;
init_vis_tile_1(X) ->
    set_vis_tile(X, #r_vis_tile{index = X}),
    init_vis_tile_1(X - 1).

%%%-------------------------------------------------------------------
%% 开始移动广播
sync_movement_to_big_visual_tile(_Msg) ->
    ok.

%%%-------------------------------------------------------------------
%% 坐標位移廣播
sync_change_pos_visual_tile(_Obj, OldVisTileIndex, OldVisTileIndex) ->
    skip;
sync_change_pos_visual_tile(Obj, OldVisTileIndex, NewVisTileIndex) ->
    del_from_vis_tile(Obj, OldVisTileIndex),
    {DecVisTile, AddVisTile} = vis_tile_add_dec(OldVisTileIndex, NewVisTileIndex),
    sync_del_from_vis_tile(Obj, DecVisTile),
    sync_add_to_vis_tile(Obj, AddVisTile),
    add_to_vis_tile(Obj, NewVisTileIndex),
    ok.

%%%-------------------------------------------------------------------
%% 删除广播
sync_del_from_vis_tile(Obj, VisTiles) ->
    sync_me_to_big_vis_tile(Obj, VisTiles, me_2_around_player_del),
    sync_big_vis_tile_to_me(Obj, VisTiles, around_unit_2_me_del),
    ok.

%%%-------------------------------------------------------------------
%% 添加广播                           N
sync_add_to_vis_tile(Obj, VisTiles) ->
    sync_big_vis_tile_to_me(Obj, VisTiles, around_unit_2_me_add),
    sync_me_to_big_vis_tile(Obj, VisTiles, me_2_around_player_add),
    ok.

%%%-------------------------------------------------------------------
%% 加入格子
add_to_vis_tile(Obj, VisTileIndex) ->
    ?assert(is_number(VisTileIndex) andalso VisTileIndex > 0),

    VisTile = get_vis_tile(VisTileIndex),
    add_to_vis_tile_1( lib_obj:obj_type(Obj), Obj#r_map_obj.uid, VisTileIndex, VisTile),
    ok.

%%
add_to_vis_tile_1(Type, Uid, VisTileIndex, undefined) ->
    ?ERROR(" add t ~p, code ~p to visIdx ~p invalid",[Type, Uid, VisTileIndex]);
add_to_vis_tile_1(?OBJ_USR, Uid, VisTileIndex, VisTile) ->
    set_vis_tile(
        VisTileIndex,
        VisTile#r_vis_tile{player = [Uid | VisTile#r_vis_tile.player]}
    );
add_to_vis_tile_1(?OBJ_MON, Uid, VisTileIndex, VisTile) ->
    set_vis_tile(
        VisTileIndex,
        VisTile#r_vis_tile{monster = [Uid | VisTile#r_vis_tile.monster]}
    );
add_to_vis_tile_1(?OBJ_PET, Uid, VisTileIndex, VisTile) ->
    set_vis_tile(
        VisTileIndex,
        VisTile#r_vis_tile{pet = [Uid | VisTile#r_vis_tile.pet]}
    );
add_to_vis_tile_1(?OBJ_NPC, Uid, VisTileIndex, VisTile) ->
    set_vis_tile(
        VisTileIndex,
        VisTile#r_vis_tile{npc = [Uid | VisTile#r_vis_tile.npc]}
    );
add_to_vis_tile_1(_Type, _Uid, _VisTileIndex, _VisTile) ->
    ok.


%%%-------------------------------------------------------------------
%% 移除格子
del_from_vis_tile(Obj, VisTileIndex) ->
    ?assert(is_number(VisTileIndex) andalso VisTileIndex > 0),

    VisTile = get_vis_tile(VisTileIndex),
    del_from_vis_tile_1( lib_obj:obj_type(Obj), Obj#r_map_obj.uid, VisTileIndex, VisTile),
    ok.

%%
del_from_vis_tile_1(Type, Uid, VisTileIndex, undefined) ->
    ?ERROR("del t ~p, code ~p from visIdx ~p invalid",[Type, Uid, VisTileIndex]);
del_from_vis_tile_1(?OBJ_USR, Uid, VisTileIndex, VisTile) ->
    set_vis_tile(
        VisTileIndex,
        VisTile#r_vis_tile{ player = lists:delete(Uid,VisTile#r_vis_tile.player)}
    );
del_from_vis_tile_1(?OBJ_MON, Uid, VisTileIndex, VisTile) ->
    set_vis_tile(
        VisTileIndex,
        VisTile#r_vis_tile{monster = lists:delete(Uid,VisTile#r_vis_tile.monster)}
    );
del_from_vis_tile_1(?OBJ_PET, Uid, VisTileIndex, VisTile) ->
    set_vis_tile(
        VisTileIndex,
        VisTile#r_vis_tile{pet = lists:delete(Uid,VisTile#r_vis_tile.pet)}
    );
del_from_vis_tile_1(?OBJ_NPC, Uid, VisTileIndex, VisTile) ->
    set_vis_tile(
        VisTileIndex,
        VisTile#r_vis_tile{npc = lists:delete(Uid,VisTile#r_vis_tile.npc)}
    );
del_from_vis_tile_1(_Type, _Uid, _VisTileIndex, _VisTile) ->
    ok.

%%%-------------------------------------------------------------------
%% 把角色信息广播到九宫格中
sync_big_vis_tile_to_me(
    #r_map_obj{uid = Uid, type = ?OBJ_USR},
    VisTileList,
    Msg
) ->
    lists:foreach(
        fun(VisTile) ->
            ?DEBUG("~nsrc:~w~nmsg:~w~ntar:~w", [Uid, Msg, VisTile#r_vis_tile.player])
        end, VisTileList),
%%    lists:foreach(
%%        fun(VisTile) ->
%%            _ = [Obj#r_obj.pid ! Msg || Player <- VisTile#r_vis_tile.player, is_visible(Obj, Player)]
%%        end, VisTileList),
%%
%%    lists:foreach(
%%        fun(VisTile) ->
%%            _ = [Obj#r_obj.pid ! Msg || Monster <- VisTile#r_vis_tile.monster, is_visible(Obj, Monster)]
%%        end, VisTileList),
    ok;
sync_big_vis_tile_to_me(_Obj, _VisTileList, _Msg) -> skip.

sync_me_to_big_vis_tile(#r_map_obj{uid = Uid}, VisTileList, Msg) ->
    lists:foreach(
        fun(VisTile) ->
            ?DEBUG("~nsrc:~w~nmsg:~w~ntar:~w", [Uid, Msg, VisTile#r_vis_tile.player])
        end, VisTileList),
%%    lists:foreach(
%%        fun(VisTile) ->
%%            _ = [Role#r_obj.pid ! Msg || Role <- VisTile#r_vis_tile.player, is_visible(Unit, Role)]
%%        end, VisTileList),
    ok.


%%%-------------------------------------------------------------------
pos_to_vis_index(Pos) ->
    pos_to_vis_index(Pos, get(?VIS_W), ?VIS_DIST).

%% vector3 
pos_to_vis_index(Pos, VisTileWidth, ViewDist) ->
    CellSize = get(?CELL_SIZE),
    IndexX = trunc(Pos#vector3.x / CellSize / ?TILE_SCALE / ViewDist + 1),
    IndexZ = trunc(Pos#vector3.z / CellSize / ?TILE_SCALE / ViewDist + 1),

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
    W  = get(?VIS_W),
    H  = get(?VIS_H),
    C  = VisTileIndex,
    L  = C - 1,
    R  = C + 1,
    T  = C - W,
    B  = C + W,
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
%%is_visible(_Self, _Target) -> true.

