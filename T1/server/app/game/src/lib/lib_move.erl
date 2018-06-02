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
-include("mem_record.hrl").


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
        cur_pos = Pos,
        face = Face,
        start_pos = Pos,
        dest_pos = Pos,
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

test_path() ->
    [
        vector3:new(150.0, 0, 150.0),
        vector3:new(200.0, 0, 150.0),
        vector3:new(250.0, 0, 200.0),
        vector3:new(300.0, 0, 50.00),
        vector3:new(350.0, 0, 250.0),
        vector3:new(400.0, 0, 200.0),
        vector3:new(420.0, 0, 300.0),
        vector3:new(25.00, 0, 280.0),
        vector3:new(30.01, 0, 230.0),
        vector3:new(40.01, 0, 100.0),
        vector3:new(180.0, 0, 250.0)
    ].

test_dir() ->
    S = vector3:new(150.0, 0, 150.0),
    E = vector3:new(200.0, 0, 150.0),
    vector3:subtract(E, S).

start_player_walk_1(Obj, Start, _End) ->
    #r_map_obj{uid = Uid, move_speed = Speed} = Obj,

    Now = time:milli_seconds(),
    Dir = test_dir(),
    Way = test_path(),

    PathList = make_path_list([], Start, Way),
    TotalDist = lists:foldl(
        fun(#r_move_pos{dist = DistCur}, Acc) -> Acc + DistCur end, 0, PathList),
    TotalTime = TotalDist / Speed * 1000,
    ?WARN("~p start move from ~w to ~w, dist ~w, ~w(ms)",
        [Uid, Start, lists:last(Way), TotalDist, TotalTime]),

    % 路点变化时同步到ETS
    [End | _] = Way,
    NewObj = Obj#r_map_obj{
        cur_move = ?EMS_WALK,
        next_move = ?EMS_STAND,
        start_pos = Start,
        dest_pos = End,
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
            {#r_map_obj.start_pos, Start},
            {#r_map_obj.dest_pos, End},
            {#r_map_obj.dir, Dir},
            {#r_map_obj.face, Dir},
            {#r_map_obj.start_time, Now},
            {#r_map_obj.last_up_time, Now},
            {#r_map_obj.moved_time, 0},
            {#r_map_obj.stopped, false},
            {#r_map_obj.path_list, PathList}
        ]
    ),
    on_player_pos_change(NewObj, Start).


%%%-------------------------------------------------------------------
is_role_can_walk(_Pos, _End) -> true.

%%%-------------------------------------------------------------------
make_path_list(Acc, _Start, []) -> lists:reverse(Acc);
make_path_list(Acc, Start, [Tar | Left]) ->
    R = make_move_r(Start, Tar),
    make_path_list([R | Acc], Tar, Left).

%%%-------------------------------------------------------------------
make_move_r(Start, End) ->
    Dist = vector3:dist(Start, End),
    #r_move_pos{
        dist = Dist,
        start_pos = Start,
        end_pos = End,
        dir = vector3:subtract(End, Start)
    }.

%%%-------------------------------------------------------------------
update(Obj) -> update_dispatcher(Obj).

%%%-------------------------------------------------------------------
update_dispatcher(#r_map_obj{type = ?OBJ_USR} = Obj) ->
    update_player_move(Obj, Obj#r_map_obj.cur_move);
update_dispatcher(_Obj) -> skip.

%%%-------------------------------------------------------------------
update_player_move(Obj, ?EMS_WALK) ->
    #r_map_obj{
        cur_pos = CurPos, path_list = PathList, moved_time = MovedTime
    } = Obj,
    Now = time:milli_seconds(),
    Delta = lib_obj:get_obj_move_diff_time(Obj, Now),
    Ret = update_role_walk(Obj, CurPos, PathList, MovedTime + Delta),
    case Ret of
        ?ENR_TOBECONTINUED ->
            lib_map_rw:player_update(
                Obj#r_map_obj.uid,
                [
                    {#r_map_obj.last_up_time, Now},
                    {#r_map_obj.moved_time, MovedTime + Delta}
                ]
            );
        {?ENR_TOBECONTINUED, NewPath, TarDir, Dest, MoreMoveTime} ->
            lib_map_rw:player_update(
                Obj#r_map_obj.uid,
                [
                    {#r_map_obj.path_list, NewPath},
                    {#r_map_obj.dir, TarDir},
                    {#r_map_obj.face, TarDir},
                    {#r_map_obj.dest_pos, Dest},
                    {#r_map_obj.last_up_time, Now},
                    {#r_map_obj.moved_time, MoreMoveTime}
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
update_player_move(_Obj, _Move) -> skip.

%%%-------------------------------------------------------------------
update_role_walk(Obj, CurPos, [], _MoveTime) ->
    ?WARN("mapid ~p player ~w arrived ~w", [self(), Obj#r_map_obj.uid, CurPos]),
    ?ENR_ARRIVE;
update_role_walk(Obj, CurPos, PathList, MoveTime) ->
    MoveDist = lib_obj:get_obj_speed(Obj) * MoveTime / 1000,
    {NewPos, NewPathList, MoreDist} = linear_pos(PathList, MoveDist, keep),

    ?DEBUG("mapid ~p ~w from ~w to ~w dist ~p",
        [self(), Obj#r_map_obj.uid, CurPos, NewPos, MoveDist]),
    ?DEBUG("# ~p,~p",[NewPos#vector3.x, NewPos#vector3.z]),
    on_player_pos_change(Obj, NewPos),

    #r_map_obj{dir = Dir, dest_pos = Dst} = Obj,
    MoreTime = misc:ceil(MoreDist / lib_obj:get_obj_speed(Obj) * 1000),
    case NewPathList of
        ?ENR_TOBECONTINUED -> ?ENR_TOBECONTINUED;
        [] -> {?ENR_TOBECONTINUED, [], Dir, Dst, MoreTime};
        [#r_move_pos{end_pos = End, dir = TarDir} | _] ->
%%            ?DEBUG("new dest ~w, dir ~w",[End, TarDir]),
            {?ENR_TOBECONTINUED, NewPathList, TarDir, End, MoreTime}
    end.

%%%-------------------------------------------------------------------
-spec linear_pos(vector3(), list(), keep | changed) ->
    {vector3(), list() | ?ENR_TOBECONTINUED, float()}.

linear_pos([MovePos] = PL, MoveDist, Flag) ->
    #r_move_pos{dist = Dist, start_pos = Start, end_pos = End} = MovePos,
    if
        MoveDist < Dist -> linear_pos_1(Start, End, Dist, MoveDist, PL, Flag);
        true -> {End, [], 0}
    end;
linear_pos([MovePos | PathList] = PL, MoveDist, Flag) ->
    #r_move_pos{dist = Dist, start_pos = Start, end_pos = End} = MovePos,
    if
        MoveDist == Dist -> {End, PathList, 0};
        MoveDist < Dist -> linear_pos_1(Start, End, Dist, MoveDist, PL, Flag);
        true -> linear_pos(PathList, MoveDist - Dist, changed)
    end.

%%%-------------------------------------------------------------------
linear_pos_1(StartPos, EndPos, Dist, MoveDist, PathList, Flag) ->
    R1 = MoveDist / Dist,
    R2 = if R1 < 0 -> 0; true -> R1 end,
    R3 = if R2 > 1 -> 1; true -> R2 end,
    Dst = vector3:linear_lerp(StartPos, EndPos, R3),
    linear_pos_2(Dst, PathList, MoveDist, Flag).

%%%-------------------------------------------------------------------
linear_pos_2(Dst, _PathList, _MoveDist, keep) ->
    {Dst, ?ENR_TOBECONTINUED, 0};
linear_pos_2(Dst, PathList, MoveDist, changed) ->
    {Dst, PathList, MoveDist}.

%%%-------------------------------------------------------------------
on_player_pos_change(undefined, _TarPos) ->
    ok;
on_player_pos_change(Obj, TarPos) ->
    %
%%    ?DEBUG("~w pos change ~w", [Obj#r_map_obj.uid, TarPos]),

    %
    Uid = lib_obj:get_obj_uid(Obj),
    OldVisIndex = lib_map_view:pos_to_vis_index(lib_obj:get_obj_pos(Obj)),
    NewVisIndex = lib_map_view:pos_to_vis_index(TarPos),
    lib_map_rw:player_update_pos(Uid, TarPos),
    lib_mem:player_update(Uid, {#m_player.pos, TarPos}),
    lib_map_view:sync_change_pos_visual_tile(Obj, OldVisIndex, NewVisIndex),
    lib_map_view:sync_movement_to_big_visual_tile({player_move_to, lib_obj:get_obj_pos(Obj), TarPos}),
    ok.

stop_move(_Send) -> ok.