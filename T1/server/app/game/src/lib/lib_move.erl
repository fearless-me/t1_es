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
-include("netmsg.hrl").


%% API
-export([init/3]).
-export([update/1]).
-export([start_player_walk/3]).
-export([on_player_pos_change/2]).
-export([cal_move_msg/1]).

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

    PathList = make_path_list([], Start, Way, Speed),
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
    on_player_pos_change(NewObj, Start),
    %
    Msg = cal_move_msg(NewObj),
    NewVisIndex = lib_map_view:pos_to_vis_index(Start),
    lib_map_view:sync_movement_to_big_visual_tile(NewVisIndex, Msg),
    ok.


%%%-------------------------------------------------------------------
is_role_can_walk(_Pos, _End) -> true.

%%%-------------------------------------------------------------------
make_path_list(Acc, _Start, [], _Speed) -> lists:reverse(Acc);
make_path_list(Acc, Start, [Tar | Left], Speed) ->
    R = make_move_r(Start, Tar, Speed),
    make_path_list([R | Acc], Tar, Left, Speed).

%%%-------------------------------------------------------------------
make_move_r(Start, End, Speed) ->
    Dist = vector3:dist(Start, End),
    #r_move_pos{
        dist = Dist,
        speed = Speed,
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

    {NewPos, NewPathList, MoreTime} = linear_pos(PathList, MoveTime, keep),

    ?DEBUG("mapid ~p ~w from ~w to ~w move time ~p",
        [self(), Obj#r_map_obj.uid, CurPos, NewPos, MoveTime]),
    ?DEBUG("# ~p,~p", [NewPos#vector3.x, NewPos#vector3.z]),
    on_player_pos_change(Obj, NewPos),

    #r_map_obj{dir = Dir, dest_pos = Dst} = Obj,
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

linear_pos([MovePos] = PL, MoveTime, Flag) ->
    #r_move_pos{dist = Dist, start_pos = Start, end_pos = End, speed = Speed} = MovePos,
    MoveDist = calc_move_dist(Speed, MoveTime),
    if
        MoveDist < Dist -> linear_pos_1(Start, End, MoveDist / Dist, MoveTime, PL, Flag);
        true -> {End, [], 0}
    end;
linear_pos([MovePos | PathList] = PL, MoveTime, Flag) ->
    #r_move_pos{dist = Dist, start_pos = Start, end_pos = End, speed = Speed} = MovePos,
    MoveDist = calc_move_dist(Speed, MoveTime),
    if
        MoveDist == Dist -> {End, PathList, 0};
        MoveDist < Dist -> linear_pos_1(Start, End, MoveDist / Dist, MoveTime, PL, Flag);
        true -> linear_pos(PathList, calc_move_time(Speed, MoveDist - Dist), changed)
    end.

calc_move_dist(Speed, MoveTime) ->
    MoveTime * Speed / 1000.

calc_move_time(Speed, Dist) ->
    misc:ceil(Dist / Speed * 1000).


%%%-------------------------------------------------------------------
linear_pos_1(StartPos, EndPos, K0, MoveTime, PathList, Flag) ->
    K1 = if K0 < 0 -> 0; true -> K0 end,
    K2 = if K1 > 1 -> 1; true -> K1 end,
    Dst = vector3:linear_lerp(StartPos, EndPos, K2),
    linear_pos_2(Dst, PathList, MoveTime, Flag).

%%%-------------------------------------------------------------------
linear_pos_2(Dst, _PathList, _MoveTime, keep) ->
    {Dst, ?ENR_TOBECONTINUED, 0};
linear_pos_2(Dst, PathList, MoveTime, changed) ->
    {Dst, PathList, MoveTime}.

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
    ok.

%%%-------------------------------------------------------------------
cal_move_msg(#r_map_obj{cur_move = ?EMS_WALK} = Obj) ->
    #r_map_obj{uid = Uid, start_pos = Src, dest_pos = Dst, moved_time = MovedTime} = Obj,
    Walk = #pk_ObjWalk{
        uid = Uid, move_time = MovedTime,
        src_x = vector3:x(Src), src_y = vector3:z(Src),
        dst_x = vector3:x(Dst), dst_y = vector3:z(Dst),
        speed = lib_obj:get_obj_speed(Obj)
    },
    #pk_GS2U_SyncWalk{walk = Walk};
cal_move_msg(_Obj) ->
    undefined.


stop_move(_Send) -> ok.