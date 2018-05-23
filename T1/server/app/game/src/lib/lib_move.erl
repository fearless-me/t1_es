%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 22. 五月 2018 8:54
%%%-------------------------------------------------------------------
-module(lib_move).
-author("mawenhong").
-include("map_obj.hrl").
-include("movement.hrl").
-include("logger.hrl").
-include("vector3.hrl").


%% API
-export([init/3]).
-export([update/1]).
-export([start_player_walk/3]).
-export([on_player_pos_change/2]).

%%%-------------------------------------------------------------------
init(Obj, Pos, Face) ->
    Obj#r_map_obj{
        cur_move = ?EMS_STAND,
        next_move = ?EMS_STAND,
        pos = Pos,
        face = Face,
        start = Pos,
        dest = Pos,
        dir = Face,
        vis_tile_idx = 0,
        stopped = false

    }.


%%%-------------------------------------------------------------------
start_player_walk(Obj, Start, End) ->
    case is_role_can_walk(Start, End) of
        true -> start_player_walk_1(Obj, Start, End);
        _ -> false
    end,
    ok.

start_player_walk_1(
    #r_map_obj{uid = Code} = Obj,
    Start, End
) ->
    Now = misc:milli_seconds(),
    Dir = vector3:subtract(End, Start),

    NewObj = Obj#r_map_obj{
        cur_move = ?EMS_WALK,
        next_move = ?EMS_STAND,
        start = Start,
        dest = End,
        dir = Dir,
        face = Dir,
        start_time = Now,
        last_up_time = Now,
        stopped = false
    },
    lib_map_rw:player_update(
        Code,
        [
            {#r_map_obj.cur_move, ?EMS_WALK},
            {#r_map_obj.next_move, ?EMS_STAND},
            {#r_map_obj.start, Start},
            {#r_map_obj.dest, End},
            {#r_map_obj.dir, Dir},
            {#r_map_obj.face, Dir},
            {#r_map_obj.start_time, Now},
            {#r_map_obj.last_up_time, Now},
            {#r_map_obj.stopped, false}
        ]
    ),
    on_player_pos_change(NewObj, Start).


is_role_can_walk(_Pos, _End) -> true.
%%%-------------------------------------------------------------------

update(Obj) ->
    update_1(Obj, Obj#r_map_obj.cur_move).


update_1(Obj, ?EMS_WALK) ->
    #r_map_obj{
        pos = CurPos,
        last_up_time = LastUpTime,
        path_list = PathList
    } = Obj,
    Now = misc:milli_seconds(),
    DiffMs = Now - LastUpTime,
    Ret = update_role_walk(Obj, CurPos, PathList, DiffMs, 10),
    case Ret of
        ?ENR_TOBECONTINUED ->
            ok;
        {?ENR_TOBECONTINUED, NewPath} ->
            lib_map_rw:player_update(
                Obj#r_map_obj.uid,
                {#r_map_obj.path_list, NewPath}
            );
        _ ->
            lib_map_rw:player_update(
                Obj#r_map_obj.uid,
                [
                    {#r_map_obj.cur_move, ?EMS_STAND},
                    {#r_map_obj.next_move, ?EMS_STAND},
                    {#r_map_obj.path_list, []}
                ]
            )
    end,
    ok;
update_1(_Obj, _Move) -> skip.

%%%-------------------------------------------------------------------
update_role_walk(_Obj, _CurPos, [], _DiffTime, _Speed) ->
    ?ENR_ARRIVE;
update_role_walk(_Obj, CurPos, [CurPos], _DiffTime, _Speed) ->
    ?ENR_ARRIVE;
update_role_walk(Obj, CurPos, PathList, DiffTime, Speed) ->
    MoveDist = Speed * DiffTime / 1000,
    {NewPos, NewPathList} = linear_pos(CurPos, PathList, MoveDist),
    on_player_pos_change(Obj, NewPos),
    case NewPathList of
        ?ENR_TOBECONTINUED -> ?ENR_TOBECONTINUED;
        _ -> {?ENR_TOBECONTINUED, NewPathList}
    end.

%%%-------------------------------------------------------------------
linear_pos(Cur, [EndPos], MoveDist) ->
    Dist = vector3:dist(Cur, EndPos),
    if
        MoveDist < Dist -> linear_pos_1(Cur, EndPos, Dist, MoveDist);
        true -> {EndPos, []}
    end;
linear_pos(Cur, [FirstPos | PathList], MoveDist) ->
    Dist = vector3:dist(Cur, FirstPos),
    if
        MoveDist == Dist -> {FirstPos, PathList};
        MoveDist < Dist -> linear_pos_1(Cur, FirstPos, Dist, MoveDist);
        true -> linear_pos(Cur, PathList, MoveDist)
    end.

linear_pos_1(CurPos, TarPos, Dist, MoveDist) ->
    R1 = MoveDist / Dist,
    R2 = if R1 < 0 -> 0; true -> R1 end,
    R3 = if R2 > 1 -> 1; true -> R2 end,
    Dst = vector3:linear_lerp(CurPos, TarPos, R3),
    {Dst, ?ENR_TOBECONTINUED}.

%%%-------------------------------------------------------------------
on_player_pos_change(undefined, _TarPos) ->
    ok;
on_player_pos_change(Obj, TarPos) ->
    stop_move(false),
    OldVisIndex = lib_map_view:pos_to_vis_index(lib_map_rw:get_obj_pos(Obj)),
    NewVisIndex = lib_map_view:pos_to_vis_index(TarPos),
    lib_map_rw:player_update_pos(Obj#r_map_obj.uid, TarPos),
    lib_map_view:sync_change_pos_visual_tile(Obj, OldVisIndex, NewVisIndex),
    lib_map_view:sync_movement_to_big_visual_tile({player_move_to, lib_map_rw:get_obj_pos(Obj), TarPos}),
    ok.

stop_move(_Send) -> ok.