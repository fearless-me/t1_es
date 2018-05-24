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

start_player_walk_1(Obj, Start, _End) ->
    #r_map_obj{uid = Uid, move_speed = Speed} = Obj,

    Mid = #vector3{x = 200.0, z = 400.0},
    End = #vector3{x = 300.0, z = 150.0},
    Now = misc:milli_seconds(),
    Dir = vector3:subtract(End, Start),

    PathList = make_path_list([], Start, [Mid, End]),
    TotalDist = lists:foldl(
        fun(#r_move_pos{dist = DistCur}, Acc) -> Acc + DistCur end, 0, PathList),
    TotalTime = TotalDist / Speed * 1000,
    ?WARN("~p start move from ~w to ~w, dist ~w, ~w(ms)",
        [Uid, Start, End, TotalDist, TotalTime]),

    NewObj = Obj#r_map_obj{
        cur_move = ?EMS_WALK,
        next_move = ?EMS_STAND,
        start = Start,
        dest = End,
        dir = Dir,
        face = Dir,
        start_time = Now,
        last_up_time = Now,
        stopped = false,
        path_list = PathList
    },
    lib_map_rw:player_update(
        Uid,
        [
            {#r_map_obj.cur_move, ?EMS_WALK},
            {#r_map_obj.next_move, ?EMS_STAND},
            {#r_map_obj.start, Start},
            {#r_map_obj.dest, End},
            {#r_map_obj.dir, Dir},
            {#r_map_obj.face, Dir},
            {#r_map_obj.start_time, Now},
            {#r_map_obj.last_up_time, Now},
            {#r_map_obj.total_moved_time, 0},
            {#r_map_obj.stopped, false},
            {#r_map_obj.path_list, PathList}
        ]
    ),
    on_player_pos_change(NewObj, Start).


is_role_can_walk(_Pos, _End) -> true.

make_path_list(Acc, _Start, []) -> lists:reverse(Acc);
make_path_list(Acc, Start, [Tar | Left]) ->
    R = make_move_r(Start, Tar),
    make_path_list([R | Acc], Tar, Left).

make_move_r(Start, End) ->
    Dist = vector3:dist(Start, End),
    #r_move_pos{dist = Dist, start_pos = Start, end_pos = End}.

%%%-------------------------------------------------------------------

update(Obj) ->
    update_1(Obj, Obj#r_map_obj.cur_move).


update_1(Obj, ?EMS_WALK) ->
    #r_map_obj{
        pos = CurPos,
        path_list = PathList,
        total_moved_time = MovedTime
    } = Obj,
    Now = misc:milli_seconds(),
    DiffMs = lib_map_rw:get_obj_move_diff_time(Obj, Now),
    Ret = update_role_walk(Obj, CurPos, PathList, MovedTime + DiffMs),
    case Ret of
        ?ENR_TOBECONTINUED ->
            lib_map_rw:player_update(
                Obj#r_map_obj.uid,
                [
                    {#r_map_obj.last_up_time, Now},
                    {#r_map_obj.total_moved_time, MovedTime + DiffMs}
                ]
            );
        {?ENR_TOBECONTINUED, NewPath} ->
            lib_map_rw:player_update(
                Obj#r_map_obj.uid,
                [
                    {#r_map_obj.path_list, NewPath},
                    {#r_map_obj.last_up_time, Now},
                    {#r_map_obj.total_moved_time, 0}
                ]
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
update_role_walk(Obj, CurPos, [], _MoveTime) ->
    ?WARN("mapid ~p player ~w arrived ~w", [self(), Obj#r_map_obj.uid, CurPos]),
    ?ENR_ARRIVE;
update_role_walk(Obj, CurPos, PathList, MoveTime) ->
    MoveDist = lib_map_rw:get_obj_speed(Obj) * MoveTime / 1000,
    {NewPos, NewPathList} = linear_pos(PathList, MoveDist),
    ?DEBUG("mapid ~p ~w move from ~w to ~w,tick move dist ~p",
        [self(), Obj#r_map_obj.uid, CurPos, NewPos, MoveDist]),
    ?DEBUG("# ~p,~p",[NewPos#vector3.x, NewPos#vector3.z]),
    on_player_pos_change(Obj, NewPos),

    case NewPathList of
        ?ENR_TOBECONTINUED -> ?ENR_TOBECONTINUED;
        _ -> {?ENR_TOBECONTINUED, NewPathList}
    end.

%%%-------------------------------------------------------------------
linear_pos([MovePos], MoveDist) ->
    #r_move_pos{dist = Dist, start_pos = Start, end_pos = End} = MovePos,
    if
        MoveDist < Dist -> linear_pos_1(Start, End, Dist, MoveDist);
        true -> {End, []}
    end;
linear_pos([MovePos | PathList], MoveDist) ->
    #r_move_pos{dist = Dist, start_pos = Start, end_pos = End} = MovePos,
    if
        MoveDist == Dist -> {End, PathList};
        MoveDist < Dist -> linear_pos_1(Start, End, Dist, MoveDist);
        true -> linear_pos(PathList, MoveDist - Dist)
    end.

linear_pos_1(StartPos, EndPos, Dist, MoveDist) ->
    R1 = MoveDist / Dist,
    R2 = if R1 < 0 -> 0; true -> R1 end,
    R3 = if R2 > 1 -> 1; true -> R2 end,
    Dst = vector3:linear_lerp(StartPos, EndPos, R3),
    {Dst, ?ENR_TOBECONTINUED}.

%%%-------------------------------------------------------------------
on_player_pos_change(undefined, _TarPos) ->
    ok;
on_player_pos_change(Obj, TarPos) ->
    %
%%    ?DEBUG("~w pos change ~w", [Obj#r_map_obj.uid, TarPos]),

    %
    OldVisIndex = lib_map_view:pos_to_vis_index(lib_map_rw:get_obj_pos(Obj)),
    NewVisIndex = lib_map_view:pos_to_vis_index(TarPos),
    lib_map_rw:player_update_pos(Obj#r_map_obj.uid, TarPos),
    lib_map_view:sync_change_pos_visual_tile(Obj, OldVisIndex, NewVisIndex),
    lib_map_view:sync_movement_to_big_visual_tile({player_move_to, lib_map_rw:get_obj_pos(Obj), TarPos}),
    ok.

stop_move(_Send) -> ok.