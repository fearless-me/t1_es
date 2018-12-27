%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 11. 五月 2018 14:50
%%%-------------------------------------------------------------------
-module(mod_view).
-author("mawenhong").
-include_lib("stdlib/include/assert.hrl").
-include("logger.hrl").
-include("pub_def.hrl").
-include("pub_rec.hrl").
-include("map_core.hrl").
-include("netmsg.hrl").
-include("rec_rw.hrl").


%% API
-export([
    init_vis_tile/1,
    sync_movement_to_big_visual_tile/1,
    sync_change_pos_visual_tile/3,
    sync_del_pet/1,
    sync_player_join_map/1,
    sync_player_exit_map/1,
    sync_player_join_group/2,
    add_obj_to_vis_tile/2,
    
    send_net_msg_to_visual/2, send_msg_to_visual/3, send_msg_to_visual/2
]).

-export([pos_to_vis_index/1, get_vis_tile_around/1]).



-define(VIS_K, map_vis_k__).
-define(VIS_W, map_vis_w__).
-define(VIS_H, map_vis_h__).
-define(CELL_SIZE, map_cell_size__).
-define(WORLD_POS, map_world_pos__).
-define(VIS_DIST_KEY, view_dist).


sync_player_join_group(Uid, Group) ->
    %1.
    ObjPriv = object_priv:find_object_priv(?UID_TYPE_PLAYER, Uid),
    Index = pos_to_vis_index(object_rw:get_cur_pos(Uid), visual_w(), view_dist()),
    
    %2.
    ?TRY_CATCH(del_obj_from_vis_tile(ObjPriv, Index)),
    
    %3.
    Tiles = get_vis_tile_around(Index),
    sync_del_obj(ObjPriv, Tiles),
    
    %% 4
    object_rw:set_group(Uid, Group),
    
    %% 5
    sync_add_obj(ObjPriv, Tiles),
    add_obj_to_vis_tile(ObjPriv, Index),
    ok.

%%-------------------------------------------------------------------
sync_player_join_map(ObjPriv) ->
    %1.
    Uid = object_priv:get_uid(ObjPriv),
    Pos = object_rw:get_cur_pos(Uid),
    Index = pos_to_vis_index(Pos, visual_w(), view_dist()),
    Tiles = get_vis_tile_around(Index),
    
    %2.
    sync_add_obj(ObjPriv, Tiles),
    add_obj_to_vis_tile(ObjPriv, Index),
    ok.

%%-------------------------------------------------------------------
sync_player_exit_map(ObjPriv) ->
    %1.
    Uid = object_priv:get_uid(ObjPriv),
    Index = pos_to_vis_index(object_rw:get_cur_pos(Uid), visual_w(), view_dist()),
    
    %2.
    ?TRY_CATCH(del_obj_from_vis_tile(ObjPriv, Index)),
    
    %3.
    Tiles = get_vis_tile_around(Index),
    sync_del_obj(ObjPriv, Tiles),
    ok.

%%-------------------------------------------------------------------
sync_del_pet(_Uid) -> ok.


%%-------------------------------------------------------------------
init_vis_tile(#recGameMapCfg{
    colCellNum = Col,
    rowCellNum = Row,
    cellSize = CellSize,
    worldPos = {X, Y, Z}
}) ->
    VisW = (erlang:trunc(Col * 1) div view_dist()) + 1,
    VisH = (erlang:trunc(Row * 1) div view_dist()) + 1,
    VisT = VisW * VisH,

    ?assert(VisT > 1),


    visual_w(VisW),
    visual_h(VisH),
    map_cell_size(CellSize),
    init_vis_tile_1(VisT),
    view_dist(CellSize),
    world_pos(vector3:new(X, Y, Z)),
%%    erlang:put(?VIS_K, ViewMaps),
    ok.

%%-------------------------------------------------------------------
init_vis_tile_1(X) when X < 0 ->
    ?ERROR("");
init_vis_tile_1(X) when X =:= 0 ->
    ok;
init_vis_tile_1(X) ->
    i_set_visual(X, #m_vis_tile{index = X}),
    init_vis_tile_1(X - 1).

%%init_vis_tile_1(X, ViewMaps) when X < 0 ->
%%    ?ERROR(""),
%%    ViewMaps;
%%init_vis_tile_1(X, ViewMaps) when X =:= 0 ->
%%    ViewMaps;
%%init_vis_tile_1(X, ViewMaps) ->
%%    init_vis_tile_1(X - 1, ViewMaps#{ X => #m_vis_tile{index = X} }).

%%-------------------------------------------------------------------
send_net_msg_to_visual(Uid, NetMsg) ->
    Group = object_rw:get_group(Uid),
    VisTileIndex = object_rw:get_vis_tile_idx(Uid),
    VisTileList = get_vis_tile_around(VisTileIndex),
    send_net_msg_to_big_visual_with_group(VisTileList, NetMsg, Group),
    ok.

%%-------------------------------------------------------------------
send_msg_to_visual(Uid, MsgId) ->
    Group = object_rw:get_group(Uid),
    VisTileIndex = object_rw:get_vis_tile_idx(Uid),
    VisTileList = get_vis_tile_around(VisTileIndex),
    send_msg_to_big_visual_with_group(VisTileList, MsgId, Group),
    ok.


%%-------------------------------------------------------------------
send_msg_to_visual(Uid, MsgId, Msg) ->
    Group = object_rw:get_group(Uid),
    VisTileIndex = object_rw:get_vis_tile_idx(Uid),
    VisTileList = get_vis_tile_around(VisTileIndex),
    send_msg_to_big_visual_with_group(VisTileList, MsgId, Msg, Group),
    ok.

%%-------------------------------------------------------------------
%% 开始移动广播
sync_movement_to_big_visual_tile(Uid) ->
    Msg = mod_move:cal_move_msg(Uid),
    Group = object_rw:get_group(Uid),
    VisTileIndex = object_rw:get_vis_tile_idx(Uid),
    sync_movement_to_big_visual_tile(VisTileIndex, Msg, Group),
    ok.

%%-------------------------------------------------------------------
sync_movement_to_big_visual_tile(_VisTileIndex, undefined, _Group) ->
    skip;
sync_movement_to_big_visual_tile(VisTileIndex, Msg, Group) ->
    VisTileList = get_vis_tile_around(VisTileIndex),
    send_net_msg_to_big_visual_with_group(VisTileList, Msg, Group),
    ok.


%%-------------------------------------------------------------------
send_net_msg_to_big_visual_with_group(_VisTileList, undefined, _Group) ->
    skip;
send_net_msg_to_big_visual_with_group(VisTileList, Msg, Group) ->
    PlayerList = [Players || #m_vis_tile{player = Players} <- VisTileList],
    
    lists:foreach(
        fun
            (UidList) ->
                lists:foreach(
                    fun(Uid) ->
                        case object_rw:get_group(Uid) =:= Group of
                            true ->
                                %% 移动_同步_调试日志
                                %% ?WARN("to ~p|~ts|~w",[Uid, object_rw:get_name(Uid), Msg]),
                                gs_interface:send_net_msg(Uid, Msg);
                            _Any -> skip
                        end
                    end, UidList)
        end,
        PlayerList
    ),
    
    ok.


%%-------------------------------------------------------------------
%%send_msg_to_big_visual(VisTileList, MsgId) ->
%%    send_msg_to_big_visual_with_group(VisTileList, MsgId, 0),
%%    ok.

send_msg_to_big_visual_with_group(VisTileList, MsgId, Group) ->
    PlayerList = [Players || #m_vis_tile{player = Players} <- VisTileList],
    lists:foreach(
        fun(UidList) ->
            lists:foreach(
                fun(Uid) ->
                    case object_rw:get_group(Uid) =:= Group of
                        true -> gs_interface:send_msg(Uid, MsgId);
                        _Any -> skip
                    end
                end, UidList)
        end, PlayerList
    ),
    ok.

%%send_msg_to_big_visual(VisTileList, MsgId, Msg) ->
%%    send_msg_to_big_visual_with_group(VisTileList, MsgId, Msg, 0),
%%    ok.

send_msg_to_big_visual_with_group(VisTileList, MsgId, Msg, Group) ->
    PlayerList = [Players || #m_vis_tile{player = Players} <- VisTileList],
    lists:foreach(
        fun(UidList) ->
            lists:foreach(
                fun(Uid) ->
                    case object_rw:get_group(Uid) =:= Group of
                        true -> gs_interface:send_msg(Uid, MsgId, Msg);
                        _Any -> skip
                    end
                end, UidList)
        end, PlayerList
    ),
    ok.


%%-------------------------------------------------------------------
%% 坐標位移廣播
sync_change_pos_visual_tile(_Obj, OldVisTileIndex, OldVisTileIndex) ->
    ok;
sync_change_pos_visual_tile(undefined, OldVisTileIndex, OldVisTileIndex) ->
    error;
sync_change_pos_visual_tile(ObjPriv, OldVisTileIndex, NewVisTileIndex) ->
%%    ?DEBUG("uid ~w vis_tile_index from ~w to ~w",
%%        [ObjPriv#m_map_obj.uid, OldVisTileIndex, NewVisTileIndex]),
    
    del_obj_from_vis_tile(ObjPriv, OldVisTileIndex),
    {VisTileLeave, VisTileEnter} = vis_tile_intersection(OldVisTileIndex, NewVisTileIndex),
    sync_del_obj(ObjPriv, VisTileLeave),
    sync_add_obj(ObjPriv, VisTileEnter),
    add_obj_to_vis_tile(ObjPriv, NewVisTileIndex),
    ok.

%%-------------------------------------------------------------------
%% 删除广播
sync_del_obj(ObjPriv, VisTiles) ->
    sync_me_to_big_vis_tile(ObjPriv, VisTiles, del_me),
    sync_big_vis_tile_to_me(ObjPriv, VisTiles, del_all),
    ok.

%%-------------------------------------------------------------------
%% 添加广播                           
sync_add_obj(ObjPriv, VisTiles) ->
    sync_me_to_big_vis_tile(ObjPriv, VisTiles, add_me),
    sync_big_vis_tile_to_me(ObjPriv, VisTiles, add_all),
    ok.

%%-------------------------------------------------------------------
%% 加入格子
add_obj_to_vis_tile(ObjPriv, VisTileIndex) ->
    ?assert(is_number(VisTileIndex) andalso VisTileIndex > 0),

    %% 移动_同步_调试日志
    %% ?DEBUG("add ~p to vis index ~p", [object_priv:get_uid(ObjPriv), VisTileIndex]),
    
    VisTile = get_vis_tile(VisTileIndex),
    catch object_rw:set_vis_tile_idx(
        object_priv:get_uid(ObjPriv),
        VisTileIndex
    ),
    add_to_vis_tile_1(
        object_priv:get_type(ObjPriv),
        object_priv:get_uid(ObjPriv),
        VisTileIndex, VisTile
    ),
    ok.

%%
add_to_vis_tile_1(Type, Uid, VisTileIndex, undefined) ->
    W = visual_w(), H = visual_h(),
    ?ERROR("map ~p add t ~p  code ~p to visIdx ~p invalid ~p, W ~p H ~p",
        [map_rw:map_id(), Type, Uid, VisTileIndex, W * H, W, H]);
add_to_vis_tile_1(?UID_TYPE_PLAYER, Uid, VisTileIndex, VisTile) ->
    set_vis_tile(
        VisTileIndex,
        VisTile#m_vis_tile{player = [Uid | VisTile#m_vis_tile.player]}
    );
add_to_vis_tile_1(?UID_TYPE_MON, Uid, VisTileIndex, VisTile) ->
    set_vis_tile(
        VisTileIndex,
        VisTile#m_vis_tile{monster = [Uid | VisTile#m_vis_tile.monster]}
    );
add_to_vis_tile_1(?UID_TYPE_PET, Uid, VisTileIndex, VisTile) ->
    set_vis_tile(
        VisTileIndex,
        VisTile#m_vis_tile{pet = [Uid | VisTile#m_vis_tile.pet]}
    );
add_to_vis_tile_1(?UID_TYPE_NPC, Uid, VisTileIndex, VisTile) ->
    set_vis_tile(
        VisTileIndex,
        VisTile#m_vis_tile{npc = [Uid | VisTile#m_vis_tile.npc]}
    );
add_to_vis_tile_1(_Type, _Uid, _VisTileIndex, _VisTile) ->
    ok.

%%-------------------------------------------------------------------
%% 移除格子
del_obj_from_vis_tile(ObjPriv, VisTileIndex) ->
    ?assert(is_number(VisTileIndex) andalso VisTileIndex > 0),
    %% 移动_同步_调试日志
    %% ?DEBUG("del ~p from vis index ~p", [object_priv:get_uid(ObjPriv), VisTileIndex]),
    VisTile = get_vis_tile(VisTileIndex),
    del_from_vis_tile_1(object_priv:get_type(ObjPriv), object_priv:get_uid(ObjPriv), VisTileIndex, VisTile),
    ok.

%%
del_from_vis_tile_1(Type, Uid, VisTileIndex, undefined) ->
    W = visual_w(), H = visual_h(),
    ?ERROR("del t ~p, code ~p to visIdx ~p invalid ~p, W ~p H ~p",
        [Type, Uid, VisTileIndex, W * H, W, H]);
del_from_vis_tile_1(?UID_TYPE_PLAYER, Uid, VisTileIndex, VisTile) ->
    set_vis_tile(
        VisTileIndex,
        VisTile#m_vis_tile{player = lists:delete(Uid, VisTile#m_vis_tile.player)}
    );
del_from_vis_tile_1(?UID_TYPE_MON, Uid, VisTileIndex, VisTile) ->
    set_vis_tile(
        VisTileIndex,
        VisTile#m_vis_tile{monster = lists:delete(Uid, VisTile#m_vis_tile.monster)}
    );
del_from_vis_tile_1(?UID_TYPE_PET, Uid, VisTileIndex, VisTile) ->
    set_vis_tile(
        VisTileIndex,
        VisTile#m_vis_tile{pet = lists:delete(Uid, VisTile#m_vis_tile.pet)}
    );
del_from_vis_tile_1(?UID_TYPE_NPC, Uid, VisTileIndex, VisTile) ->
    set_vis_tile(
        VisTileIndex,
        VisTile#m_vis_tile{npc = lists:delete(Uid, VisTile#m_vis_tile.npc)}
    );
del_from_vis_tile_1(_Type, _Uid, _VisTileIndex, _VisTile) ->
    ok.

%%-------------------------------------------------------------------
%%-------------------------------------------------------------------
%% 同步周围Obj给我
sync_big_vis_tile_to_me(ObjPriv, VisTileList, Msg) ->
    Uid = object_priv:get_uid(ObjPriv),
    Type = object_priv:get_type(ObjPriv),
    do_sync_big_vis_tile_to_me(Type, Uid, VisTileList, Msg),
    ok.

do_sync_big_vis_tile_to_me(?UID_TYPE_PLAYER, Uid, VisTileList, del_all) ->
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
do_sync_big_vis_tile_to_me(?UID_TYPE_PLAYER, TarUid, VisTileList, add_all) ->
    MeGroupId = object_rw:get_group(TarUid),
    FC =
        fun(Uid) ->
            case object_rw:get_group(Uid) =:= MeGroupId of
                true ->
                    Msg = mod_move:cal_move_msg(Uid),
                    gs_interface:send_net_msg(TarUid, Msg);
                _ -> skip
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
sync_me_to_big_vis_tile(ObjPriv, VisTileList, del_me) ->
    Uid = object_priv:get_uid(ObjPriv),
    Msg = #pk_GS2U_RemoveRemote{uid_list = [Uid]},
    Group = object_rw:get_group(Uid),
    send_net_msg_to_big_visual_with_group(VisTileList, Msg, Group),
    ok;
sync_me_to_big_vis_tile(ObjPriv, VisTileList, add_me) ->
    Uid = object_priv:get_uid(ObjPriv),
    Msg = mod_move:cal_move_msg(Uid),
    Group = object_rw:get_group(Uid),
    send_net_msg_to_big_visual_with_group(VisTileList, Msg, Group),
    ok.
%%-------------------------------------------------------------------
%%
%%-------------------------------------------------------------------

%%-------------------------------------------------------------------
pos_to_vis_index(Pos) ->
    pos_to_vis_index(Pos, visual_w(), view_dist()).

%% vector3 
pos_to_vis_index(Pos, VisTileWidth, ViewDist) ->
    WorldPos = world_pos(),
    CellSize = map_cell_size(),
    IndexX = trunc((vector3:x(Pos) - vector3:x(WorldPos)) / CellSize / ?TILE_SCALE / ViewDist) + 1,
    IndexZ = trunc((vector3:z(Pos) - vector3:z(WorldPos)) / CellSize / ?TILE_SCALE / ViewDist) + 1,
    
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
    W = visual_w(),
    H = visual_h(),
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
    i_get_visual(VisTileIndex).
%%    #{VisTileIndex := ViewTile} = erlang:get(?VIS_K),
%%    ViewTile.

%%-------------------------------------------------------------------
set_vis_tile(VisTileIndex, VisTile) ->
    i_set_visual(VisTileIndex, VisTile).
%%    Maps = erlang:get(?VIS_K),
%%    erlang:put(?VIS_K, Maps#{ VisTileIndex := VisTile}).

%%-------------------------------------------------------------------
%%is_visible(_Self, _Target) -> true.


visual_w() -> erlang:get(?VIS_W).
visual_w(Width) -> erlang:put(?VIS_W, Width).

visual_h() -> erlang:get(?VIS_H).
visual_h(Height) -> erlang:put(?VIS_H, Height).

map_cell_size() -> erlang:get(?CELL_SIZE).
map_cell_size(CS) -> erlang:put(?CELL_SIZE, CS).


i_set_visual(Index, Tile) ->
    misc_ets:write(map_rw:excl_ets(), #pub_kv{key = {?VIS_K, Index}, value = Tile}).

i_get_visual(Index) ->
    misc_ets:read_element(map_rw:excl_ets(), {?VIS_K, Index}, #pub_kv.value).

world_pos(Pos) -> erlang:put(?WORLD_POS, Pos).
world_pos() -> erlang:get(?WORLD_POS).


view_dist() ->
    misc:get_dict_def(?VIS_DIST_KEY, ?VIS_DIST).

view_dist(CellSize) when CellSize == 0 ->
    erlang:put(?VIS_DIST_KEY, ?VIS_DIST);
view_dist(CellSize) ->
    Dist = erlang:trunc(?VIS_DIST / CellSize),
    erlang:put(?VIS_DIST_KEY, Dist).