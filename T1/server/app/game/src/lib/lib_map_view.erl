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
-export([sync_move_to_big_visual_tile/1]).
-export([sync_change_pos_visual_tile/3]).
-export([pos_to_vis_tile/4]).
-export([sync_remove_from_vis_tile/2]).


-define(VIS_KEY, map_vis_key__).

init_vis_tile(Width, Height, ViewDist) ->
    VisW = (Width + ViewDist - 1) div ViewDist + 2,
    VisH = (Height + ViewDist - 1) div ViewDist + 2,
    VisT = VisW * VisH,

    ?assert(VisT > 1),

    init_vis_tile_1(VisT),
    ok.

init_vis_tile_1(X) when X < 0 ->
    ?ERROR("");
init_vis_tile_1(X) when X =:= 0 ->
    ok;
init_vis_tile_1(X) ->
    set_vis_tile(X, #visTile{}),
    init_vis_tile_1(X - 1).

%% 开始移动广播
sync_move_to_big_visual_tile(_Msg)->
    ok.

%% 坐標位移廣播
sync_change_pos_visual_tile(Obj, OldVisTileIndex, NewVisTileIndex) ->
    remove_from_vis_tile(Obj, OldVisTileIndex),
    {DecVisTile, AddVisTile} = vis_tile_add_dec(OldVisTileIndex, NewVisTileIndex),
    sync_remove_from_vis_tile(Obj, DecVisTile),
    sync_add_to_vis_tile(Obj, AddVisTile),
    add_to_vis_tile(Obj, NewVisTileIndex),
    ok.


%% 删除广播
sync_remove_from_vis_tile(Obj, VisTile) ->
    sync_big_vis_tile_to_player(Obj, VisTile, unit_remove),
    ok.

%% 添加广播
sync_add_to_vis_tile(Obj, VisTile) ->
    sync_big_vis_tile_to_player(Obj, VisTile, unit_add),
    ok.

%% 加入格子
add_to_vis_tile(Obj, VisTileIndex)->
    ?assert(is_number(VisTileIndex) andalso VisTileIndex > 0),

    VisTile1 = get_vis_tile(VisTileIndex),
    VisTile2 =
        case lib_map_obj:obj_type(Obj) of
            ?OBJ_USR ->
                VisTile1#visTile{ player = [ Obj | VisTile1#visTile.player ] };
            ?OBJ_MON ->
                VisTile1#visTile{ monster = [ Obj | VisTile1#visTile.monster ] };
            _ -> VisTile1
        end,
    
    set_vis_tile(VisTileIndex, VisTile2),
    ok.

%% 移除格子
remove_from_vis_tile(Obj, VisTileIndex) ->
    ?assert(is_number(VisTileIndex) andalso VisTileIndex > 0),

    VisTile1 = get_vis_tile(VisTileIndex),
    VisTile2 =
        case lib_map_obj:obj_type(Obj) of
            ?OBJ_USR ->
                VisTile1#visTile{
                    player = lists:keydelete(Obj#obj.code, #obj.code, VisTile1#visTile.player)
                };
            ?OBJ_MON ->
                VisTile1#visTile{
                    monster = lists:keydelete(Obj#obj.code, #obj.code, VisTile1#visTile.monster)
                };
            _ -> VisTile1
        end,
    set_vis_tile(VisTileIndex, VisTile2),
    ok.

%% 把角色信息广播到九宫格中
sync_big_vis_tile_to_player(Unit, VisTileList, Msg) ->
    lists:foreach(
        fun(VisTile) ->
            _ = [ Role ! Msg || Role <- VisTile#visTile.player, is_visible(Unit, Role)]
        end, VisTileList),
    ok.


%% vector3 
pos_to_vis_tile(Pos, VisTileWidth, _VisTileHeight, ViewDist) ->
    IndexX = trunc(Pos#vector3.x div ?TILE_SCALE / ViewDist + 1),
    IndexZ = trunc(Pos#vector3.z div ?TILE_SCALE / ViewDist + 1),

    (IndexZ * VisTileWidth + IndexX).

vis_tile_add_dec(_OldVisTile, _NewVisTile) ->
    {[],[]}.

get_vis_tile(VisTileIndex) ->
    get({?VIS_KEY, VisTileIndex}).

set_vis_tile(VisTileIndex, VisTile)->
    put({?VIS_KEY, VisTileIndex}, VisTile).

is_visible(_Self, _Target) -> true.


