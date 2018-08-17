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

-include("inc_map.hrl").
-include("inc_map_unit.hrl").
-include("netmsg.hrl").
-include_lib("stdlib/include/assert.hrl").

%% API
-export([
    init_vis_tile/1,
    sync_movement_to_big_visual_tile/1,
    sync_change_pos_visual_tile/3,
    sync_del_pet/1,
    sync_player_join_map/1,
    sync_player_exit_map/1,
    add_obj_to_vis_tile/2,

    send_net_msg_to_visual/2, send_msg_to_visual/3, send_msg_to_visual/2
]).

-export([pos_to_vis_index/1, get_vis_tile_around/1]).



-define(VIS_KEY, map_vis_key__).
-define(VIS_W, map_vis_w__).
-define(VIS_H, map_vis_h__).
-define(CELL_SIZE, map_cell_size__).

%%-------------------------------------------------------------------
sync_player_join_map(Unit) ->
    %1.
    Uid = lib_unit:get_uid(Unit),
    Pos = lib_move_rw:get_cur_pos(Uid),
    Index = pos_to_vis_index(Pos, get(?VIS_W), ?VIS_DIST),
    Tiles = get_vis_tile_around(Index),

    %2.
    sync_add_obj(Unit, Tiles),
    add_obj_to_vis_tile(Unit, Index),
    ok.

%%-------------------------------------------------------------------
sync_player_exit_map(Unit) ->
    %1.
    Uid = lib_unit:get_uid(Unit),
    Index = pos_to_vis_index(lib_move_rw:get_cur_pos(Uid), get(?VIS_W), ?VIS_DIST),

    %2.
    del_obj_from_vis_tile(Unit, Index),

    %3.
    Tiles = get_vis_tile_around(Index),
    sync_del_obj(Unit, Tiles),
    ok.

%%-------------------------------------------------------------------
sync_del_pet(_Uid) -> ok.


%%-------------------------------------------------------------------
init_vis_tile(#recGameMapCfg{
    colCellNum = Col,
    rowCellNum = Row,
    cellSize = CellSize
}) ->
    VisW = (erlang:trunc(Col * 1) div ?VIS_DIST) + 1,
    VisH = (erlang:trunc(Row * 1) div ?VIS_DIST) + 1,
    VisT = VisW * VisH,

    ?assert(VisT > 1),

    put(?VIS_W, VisW),
    put(?VIS_H, VisH),
    put(?CELL_SIZE, CellSize),
    init_vis_tile_1(VisT),
    ok.

%%-------------------------------------------------------------------
init_vis_tile_1(X) when X < 0 ->
    ?ERROR("");
init_vis_tile_1(X) when X =:= 0 ->
    ok;
init_vis_tile_1(X) ->
    set_vis_tile(X, #m_vis_tile{index = X}),
    init_vis_tile_1(X - 1).

%%-------------------------------------------------------------------
send_net_msg_to_visual(Uid, NetMsg) ->
    VisTileIndex = lib_move_rw:get_vis_tile_idx(Uid),
    VisTileList = get_vis_tile_around(VisTileIndex),
    send_net_msg_to_big_visual(VisTileList, NetMsg),
    ok.

%%-------------------------------------------------------------------
send_msg_to_visual(Uid, MsgId) ->
    VisTileIndex = lib_move_rw:get_vis_tile_idx(Uid),
    VisTileList = get_vis_tile_around(VisTileIndex),
    send_msg_to_big_visual(VisTileList, MsgId),
    ok.


%%-------------------------------------------------------------------
send_msg_to_visual(Uid, MsgId, Msg) ->
    VisTileIndex = lib_move_rw:get_vis_tile_idx(Uid),
    VisTileList = get_vis_tile_around(VisTileIndex),
    send_msg_to_big_visual(VisTileList, MsgId, Msg),
    ok.

%%-------------------------------------------------------------------
%% 开始移动广播
sync_movement_to_big_visual_tile(Uid) ->
    Msg = lib_move:cal_move_msg(Uid),
    VisTileIndex = lib_move_rw:get_vis_tile_idx(Uid),
    sync_movement_to_big_visual_tile(VisTileIndex, Msg),
    ok.

%%-------------------------------------------------------------------
sync_movement_to_big_visual_tile(_VisTileIndex, undefined) ->
    skip;
sync_movement_to_big_visual_tile(VisTileIndex, Msg) ->
    VisTileList = get_vis_tile_around(VisTileIndex),
    send_net_msg_to_big_visual(VisTileList, Msg),
    ok.


%%-------------------------------------------------------------------
send_net_msg_to_big_visual(_VisTileList, undefined) ->
    skip;
send_net_msg_to_big_visual(VisTileList, Msg) ->
    PlayerList = [Players || #m_vis_tile{player = Players} <- VisTileList],
    lists:foreach(
        fun(Uid) -> gs_interface:send_net_msg(Uid, Msg) end,
        lists:flatten(PlayerList)
    ),
    ok.


%%-------------------------------------------------------------------
send_msg_to_big_visual(VisTileList, MsgId) ->
    PlayerList = [Players || #m_vis_tile{player = Players} <- VisTileList],
    lists:foreach(
        fun(Uid) -> gs_interface:send_msg(Uid, MsgId) end,
        lists:flatten(PlayerList)
    ),
    ok.

send_msg_to_big_visual(VisTileList, MsgId, Msg) ->
    PlayerList = [Players || #m_vis_tile{player = Players} <- VisTileList],
    lists:foreach(
        fun(Uid) -> gs_interface:send_msg(Uid, MsgId, Msg) end,
        lists:flatten(PlayerList)
    ),
    ok.


%%-------------------------------------------------------------------
%% 坐標位移廣播
sync_change_pos_visual_tile(_Obj, OldVisTileIndex, OldVisTileIndex) ->
    ok;
sync_change_pos_visual_tile(undefined, OldVisTileIndex, OldVisTileIndex) ->
    error;
sync_change_pos_visual_tile(Unit, OldVisTileIndex, NewVisTileIndex) ->
%%    ?DEBUG("uid ~w vis_tile_index from ~w to ~w",
%%        [Unit#m_map_obj.uid, OldVisTileIndex, NewVisTileIndex]),

    del_obj_from_vis_tile(Unit, OldVisTileIndex),
    {VisTileLeave, VisTileEnter} = vis_tile_intersection(OldVisTileIndex, NewVisTileIndex),
    sync_del_obj(Unit, VisTileLeave),
    sync_add_obj(Unit, VisTileEnter),
    add_obj_to_vis_tile(Unit, NewVisTileIndex),
    ok.

%%-------------------------------------------------------------------
%% 删除广播
sync_del_obj(Unit, VisTiles) ->
    sync_me_to_big_vis_tile(Unit, VisTiles, del_me),
    sync_big_vis_tile_to_me(Unit, VisTiles, del_all),
    ok.

%%-------------------------------------------------------------------
%% 添加广播                           
sync_add_obj(Unit, VisTiles) ->
    sync_me_to_big_vis_tile(Unit, VisTiles, add_me),
    sync_big_vis_tile_to_me(Unit, VisTiles, add_all),
    ok.

%%-------------------------------------------------------------------
%% 加入格子
add_obj_to_vis_tile(Unit, VisTileIndex) ->
    ?assert(is_number(VisTileIndex) andalso VisTileIndex > 0),

%%    ?DEBUG("add ~p to vis index ~p", [Unit#m_map_obj.uid, VisTileIndex]),

    VisTile = get_vis_tile(VisTileIndex),
    add_to_vis_tile_1(
        lib_unit:get_type(Unit), lib_unit:get_uid(Unit), VisTileIndex, VisTile),
    ok.

%%
add_to_vis_tile_1(Type, Uid, VisTileIndex, undefined) ->
    W = get(?VIS_W), H = get(?VIS_H),
    ?ERROR("map ~p add t ~p  code ~p to visIdx ~p invalid ~p, W ~p H ~p",
        [lib_map_rw:get_map_id(), Type, Uid, VisTileIndex, W * H, W, H]);
add_to_vis_tile_1(?OBJ_USR, Uid, VisTileIndex, VisTile) ->
    set_vis_tile(
        VisTileIndex,
        VisTile#m_vis_tile{player = [Uid | VisTile#m_vis_tile.player]}
    );
add_to_vis_tile_1(?OBJ_MON, Uid, VisTileIndex, VisTile) ->
    set_vis_tile(
        VisTileIndex,
        VisTile#m_vis_tile{monster = [Uid | VisTile#m_vis_tile.monster]}
    );
add_to_vis_tile_1(?OBJ_PET, Uid, VisTileIndex, VisTile) ->
    set_vis_tile(
        VisTileIndex,
        VisTile#m_vis_tile{pet = [Uid | VisTile#m_vis_tile.pet]}
    );
add_to_vis_tile_1(?OBJ_NPC, Uid, VisTileIndex, VisTile) ->
    set_vis_tile(
        VisTileIndex,
        VisTile#m_vis_tile{npc = [Uid | VisTile#m_vis_tile.npc]}
    );
add_to_vis_tile_1(_Type, _Uid, _VisTileIndex, _VisTile) ->
    ok.

%%-------------------------------------------------------------------
%% 移除格子
del_obj_from_vis_tile(Unit, VisTileIndex) ->
    ?assert(is_number(VisTileIndex) andalso VisTileIndex > 0),

%%    ?DEBUG("del ~p from vis index ~p", [Unit#m_map_obj.uid, VisTileIndex]),
    VisTile = get_vis_tile(VisTileIndex),
    del_from_vis_tile_1(lib_unit:get_type(Unit), lib_unit:get_uid(Unit), VisTileIndex, VisTile),
    ok.

%%
del_from_vis_tile_1(Type, Uid, VisTileIndex, undefined) ->
    W = get(?VIS_W), H = get(?VIS_H),
    ?ERROR("del t ~p, code ~p to visIdx ~p invalid ~p, W ~p H ~p",
        [Type, Uid, VisTileIndex, W * H, W, H]);
del_from_vis_tile_1(?OBJ_USR, Uid, VisTileIndex, VisTile) ->
    set_vis_tile(
        VisTileIndex,
        VisTile#m_vis_tile{player = lists:delete(Uid, VisTile#m_vis_tile.player)}
    );
del_from_vis_tile_1(?OBJ_MON, Uid, VisTileIndex, VisTile) ->
    set_vis_tile(
        VisTileIndex,
        VisTile#m_vis_tile{monster = lists:delete(Uid, VisTile#m_vis_tile.monster)}
    );
del_from_vis_tile_1(?OBJ_PET, Uid, VisTileIndex, VisTile) ->
    set_vis_tile(
        VisTileIndex,
        VisTile#m_vis_tile{pet = lists:delete(Uid, VisTile#m_vis_tile.pet)}
    );
del_from_vis_tile_1(?OBJ_NPC, Uid, VisTileIndex, VisTile) ->
    set_vis_tile(
        VisTileIndex,
        VisTile#m_vis_tile{npc = lists:delete(Uid, VisTile#m_vis_tile.npc)}
    );
del_from_vis_tile_1(_Type, _Uid, _VisTileIndex, _VisTile) ->
    ok.

%%-------------------------------------------------------------------
%%-------------------------------------------------------------------
%% 同步周围Obj给我
sync_big_vis_tile_to_me(Unit, VisTileList, Msg) ->
    Uid = lib_unit:get_uid(Unit),
    Type = lib_unit:get_type(Unit),
    do_sync_big_vis_tile_to_me(Type, Uid, VisTileList, Msg),
    ok.

do_sync_big_vis_tile_to_me(?OBJ_USR, Uid, VisTileList, del_all) ->
    UidList = lists:foldl(
        fun(#m_vis_tile{player = PL, monster = ML, npc = NL, pet = Pets}, Acc) ->
            PL ++ ML ++ NL ++ Pets ++ Acc
        end, [], VisTileList),
    case UidList of
        [] -> skip;
        _ ->
            Msg = #pk_GS2U_RemoveRemote{uid_list = UidList},
            gs_interface:send_net_msg(Uid, Msg)
    end,
    ok;
do_sync_big_vis_tile_to_me(?OBJ_USR, TarUid, VisTileList, add_all) ->
    FC =
        fun(Uid) ->
            Msg = lib_move:cal_move_msg(Uid),
            if
                Msg =:= undefined -> skip;
                true -> gs_interface:send_net_msg(TarUid, Msg)
            end
        end,
    FV =
        fun(#m_vis_tile{player = PL, monster = ML, npc = NL, pet = Pets}) ->
            lists:foreach(FC, PL),
            lists:foreach(FC, ML),
            lists:foreach(FC, NL),
            lists:foreach(FC, Pets)
        end,
    lists:foreach(FV, VisTileList),
    ok;
do_sync_big_vis_tile_to_me(_Type, _Uid, _VisTileList, _Msg) -> skip.
%%do_sync_big_vis_tile_to_me(?OBJ_USR, TarUid, VisTileList, add_all) ->
%%    FC =
%%        fun(_Ets, Uid, Acc) ->
%%            MoveState = lib_obj_rw:get_cur_move(Uid),
%%            Info = lib_move:cal_move_msg_info(MoveState, Uid),
%%            if
%%                Info =/= undefined -> [Info | Acc];
%%                true ->
%%                    ?DEBUG("Uid ~p",[Uid]),
%%                    Acc
%%            end
%%        end,
%%    FV =
%%        fun(#m_vis_tile{player = PL, monster = ML, npc = NL, pet = Pets}, Acc0) ->
%%            Acc1 = lists:foldl(fun(Uid, Acc) -> FC(lib_map_rw:get_player_ets(),   Uid, Acc) end, Acc0, PL),
%%            Acc2 = lists:foldl(fun(Uid, Acc) -> FC(lib_map_rw:get_monster_ets(),  Uid, Acc) end, Acc1, ML),
%%            Acc3 = lists:foldl(fun(Uid, Acc) -> FC(lib_map_rw:get_npc_ets(),      Uid, Acc) end, Acc2, NL),
%%                   lists:foldl(fun(Uid, Acc) -> FC(lib_map_rw:get_pet_ets(),      Uid, Acc) end, Acc3, Pets)
%%        end,
%%    InfoList = lists:foldl(FV, [], VisTileList),
%%    case InfoList of
%%        [] -> skip;
%%        _ -> gcore:send_net_msg(TarUid, #pk_GS2U_SyncWalkMany{walks = InfoList})
%%    end,
%%    ok;


%%-------------------------------------------------------------------
%% 把Obj信息广播到九宫格中
sync_me_to_big_vis_tile(Unit, VisTileList, del_me) ->
    Uid = lib_unit:get_uid(Unit),
    Msg = #pk_GS2U_RemoveRemote{uid_list = [Uid]},
    send_net_msg_to_big_visual(VisTileList, Msg),
    ok;
sync_me_to_big_vis_tile(Unit, VisTileList, add_me) ->
    Uid = lib_unit:get_uid(Unit),
    Msg = lib_move:cal_move_msg(Uid),
    send_net_msg_to_big_visual(VisTileList, Msg),
    ok.
%%-------------------------------------------------------------------
%%
%%-------------------------------------------------------------------

%%-------------------------------------------------------------------
pos_to_vis_index(Pos) ->
    pos_to_vis_index(Pos, get(?VIS_W), ?VIS_DIST).

%% vector3 
pos_to_vis_index(Pos, VisTileWidth, ViewDist) ->
    CellSize = get(?CELL_SIZE),
    IndexX = trunc(vector3:x(Pos) / CellSize / ?TILE_SCALE / ViewDist) + 1,
    IndexZ = trunc(vector3:z(Pos) / CellSize / ?TILE_SCALE / ViewDist) + 1,

    (IndexZ * VisTileWidth + IndexX).

%%-------------------------------------------------------------------
vis_tile_intersection(OldVisTileIndex, NewVisTileIndex) ->
    L1 = get_vis_tile_around_index(OldVisTileIndex),
    L2 = get_vis_tile_around_index(NewVisTileIndex),
    L3 = lists:subtract(L1, L2),
    L4 = lists:subtract(L2, L1),
    {[get_vis_tile(TileIndex) || TileIndex <- L3], [get_vis_tile(TileIndex) || TileIndex <- L4]}.

%%-------------------------------------------------------------------
get_vis_tile_around(VisTileIndex) ->
    L1 = get_vis_tile_around_index(VisTileIndex),
    [get_vis_tile(TileIndex) || TileIndex <- L1].

get_vis_tile_around_index(VisTileIndex) ->
%%    +--------------+
%%    | tl | top|  tr|
%%    +--------------+
%%    | l  |  c |  r |
%%    +--------------+
%%    | bl |  b | br |
%%    +--------------+
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
        , TileIndex > 0, TileIndex =< (W * H)].

%%-------------------------------------------------------------------
get_vis_tile(VisTileIndex) ->
    get({?VIS_KEY, VisTileIndex}).

%%-------------------------------------------------------------------
set_vis_tile(VisTileIndex, VisTile) ->
    put({?VIS_KEY, VisTileIndex}, VisTile).

%%-------------------------------------------------------------------
%%is_visible(_Self, _Target) -> true.


