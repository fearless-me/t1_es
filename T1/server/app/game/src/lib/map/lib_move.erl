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
-export([on_player_pos_change/3]).
-export([cal_move_msg/1]).
%%-export([cal_move_msg_info/2]).

%%%-------------------------------------------------------------------
init(Uid, Pos, Face) ->
    lib_obj_rw:set_cur_move(Uid, ?EMS_STAND),
    lib_obj_rw:set_next_move(Uid, ?EMS_STAND),
    lib_obj_rw:set_cur_pos(Uid, Pos),
    lib_obj_rw:set_face(Uid, Face),
    lib_obj_rw:set_dir(Uid, Face),
    lib_obj_rw:set_start_pos(Uid, Pos),
    lib_obj_rw:set_dest_pos(Uid, Pos),
    lib_obj_rw:set_vis_tile_idx(Uid, 0),
    lib_obj_rw:set_stopped(Uid, false),
    lib_obj_rw:set_move_speed(Uid, 20),
    ok.

start_walk_set(Uid, CurMove, NextMove, Src, Dst, Face, Dir, Now, PathList) ->
    lib_obj_rw:set_cur_move(Uid, CurMove),
    lib_obj_rw:set_next_move(Uid, NextMove),
    lib_obj_rw:set_face(Uid, Face),
    lib_obj_rw:set_dir(Uid, Dir),
    lib_obj_rw:set_start_pos(Uid, Src),
    lib_obj_rw:set_dest_pos(Uid, Dst),
    lib_obj_rw:set_seg_move_time(Uid, 0),
    lib_obj_rw:set_start_time(Uid, Now),
    lib_obj_rw:set_stopped(Uid, false),
    lib_obj_rw:set_path_list(Uid, PathList),
    ok.

%%%-------------------------------------------------------------------
start_player_walk(Uid, Start, End) ->
    case is_role_can_walk(Start, End) of
        true -> start_player_walk_1(Uid, Start, End);
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

start_player_walk_1(Uid, Start, End) ->

    Speed = lib_obj_rw:get_move_speed(Uid),
    Now = lib_map_rw:get_move_timer_now(),
%%    Dir = test_dir(),
%%    Way = test_path(),

    Way = [End],
    Dir = vector3:subtract(End, Start),
    PathList = make_path_list([], Start, Way, Speed),

    %%
    TotalDist = lists:foldl(
        fun(#m_move_pos{dist = DistCur}, Acc) -> Acc + DistCur end, 0, PathList),
    TotalTime = TotalDist / Speed * 1000,
    ?WARN("~p start move from ~w to ~w, dist ~w, ~w(ms)",
        [Uid, Start, lists:last(Way), TotalDist, TotalTime]),

    % 路点变化时同步到ETS
    [End | _] = Way,

    start_walk_set(Uid, ?EMS_WALK, ?EMS_STAND, Start, End, Dir, Dir, Now, PathList),

    on_player_pos_change(Uid, Start, Start),
    %
    Msg = cal_move_msg(Uid),
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
    #m_move_pos{
        dist = Dist,
        speed = Speed,
        start_pos = Start,
        end_pos = End,
        dir = vector3:subtract(End, Start)
    }.

%%%-------------------------------------------------------------------
update(Obj) -> update_dispatcher(Obj).

%%%-------------------------------------------------------------------
update_dispatcher(#m_map_obj{type = ?OBJ_USR, uid = Uid} = Obj) ->
    update_player_move(Obj, lib_obj_rw:get_cur_move(Uid));
update_dispatcher(_Obj) -> skip.

%%%-------------------------------------------------------------------
update_player_move(Obj, ?EMS_WALK) ->
    #m_map_obj{uid = Uid} = Obj,
    
    CurPos      = lib_obj_rw:get_cur_pos(Uid),
    PathList    = lib_obj_rw:get_path_list(Uid),
    Delta       = lib_map_rw:get_move_timer_delta(),
    MovedTime   = lib_obj_rw:get_seg_move_time(Uid),
    update_role_walk(Uid, CurPos, PathList, MovedTime + Delta),
    ok;
update_player_move(_Obj, _Move) -> skip.

%%%-------------------------------------------------------------------
update_role_walk(Uid, CurPos, [], _MoveTime) ->
    ?WARN("mapid ~p player ~w arrived ~w", [self(), Uid, CurPos]),
    lib_obj_rw:set_cur_move(Uid, ?EMS_STAND),
    lib_obj_rw:set_next_move(Uid, ?EMS_STAND),
    lib_obj_rw:set_start_time(Uid, lib_map_rw:get_move_timer_now()),
    ?ENR_ARRIVE;
update_role_walk(Uid, CurPos, PathList, MoveTime) ->

    Dir = lib_obj_rw:get_dir(Uid),
    Dst = lib_obj_rw:get_dest_pos(Uid),
    {NewPos, NewPathList, MoreTime} = linear_pos(PathList, MoveTime, keep),

%%    ?DEBUG("mapid ~p ~w from ~w to ~w move time ~p",
%%        [self(), Obj#m_map_obj.uid, CurPos, NewPos, MoveTime]),
%%    ?DEBUG("# ~p,~p", [NewPos#vector3.x, NewPos#vector3.z]),
    on_player_pos_change(Uid, CurPos, NewPos),

    case NewPathList of
        ?ENR_TOBECONTINUED ->
            lib_obj_rw:set_seg_move_time(Uid, MoveTime),
            ?ENR_TOBECONTINUED;
        [] ->
            lib_obj_rw:set_path_list(Uid, []),
            lib_obj_rw:set_seg_move_time(Uid, MoreTime),
            {?ENR_TOBECONTINUED, [], Dir, Dst, MoreTime};
        [#m_move_pos{end_pos = End, dir = TarDir} | _] ->
%%            ?DEBUG("new dest ~w, dir ~w",[End, TarDir]),
            lib_obj_rw:set_path_list(Uid, NewPathList),
            lib_obj_rw:set_dir(Uid, TarDir),
            lib_obj_rw:set_dest_pos(Uid, End),
            lib_obj_rw:set_seg_move_time(Uid, MoreTime),
            {?ENR_TOBECONTINUED, NewPathList, TarDir, End, MoreTime}
    end.

%%%-------------------------------------------------------------------
-spec linear_pos(vector3(), list(), keep | changed) ->
    {vector3(), list() | ?ENR_TOBECONTINUED, float()}.

linear_pos([MovePos] = PL, MoveTime, Flag) ->
    #m_move_pos{dist = Dist, start_pos = Start, end_pos = End, speed = Speed} = MovePos,
    MoveDist = calc_move_dist(Speed, MoveTime),
    if
        MoveDist < Dist -> linear_pos_1(Start, End, MoveDist / Dist, MoveTime, PL, Flag);
        true -> {End, [], 0}
    end;
linear_pos([MovePos | PathList] = PL, MoveTime, Flag) ->
    #m_move_pos{dist = Dist, start_pos = Start, end_pos = End, speed = Speed} = MovePos,
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
on_player_pos_change(Uid, Src, Tar) ->
    %
    %% ?DEBUG("~w pos change ~w", [Uid, Tar]),
    %
    Obj = lib_map_rw:get_player(Uid),
    lib_obj_rw:set_cur_pos(Uid, Tar),
    OldVisIndex = lib_map_view:pos_to_vis_index(Src),
    NewVisIndex = lib_map_view:pos_to_vis_index(Tar),
    lib_cache:update_player_pub(Uid, {#m_player_pub.pos, Tar}),
    lib_map_view:sync_change_pos_visual_tile(Obj, OldVisIndex, NewVisIndex),
    ok.

%%%-------------------------------------------------------------------
cal_move_msg(Uid) ->
    do_cal_move_msg(lib_obj_rw:get_cur_move(Uid), Uid).

do_cal_move_msg(?EMS_WALK, Uid) ->
    Src         = lib_obj_rw:get_start_pos(Uid),
    Dst         = lib_obj_rw:get_dest_pos(Uid),
    Speed       = lib_obj_rw:get_move_speed(Uid),
    StartTime   = lib_obj_rw:get_start_time(Uid),
    #pk_GS2U_SyncWalk{
        uid = Uid,
        move_time = lib_map_rw:get_move_timer_pass_time(StartTime),
        src_x = vector3:x(Src), src_y = vector3:z(Src),
        dst_x = vector3:x(Dst), dst_y = vector3:z(Dst),
        speed = Speed
    };
do_cal_move_msg(?EMS_STAND, Uid) ->
    Pos = lib_obj_rw:get_start_pos(Uid),
    #pk_GS2U_SyncStand{uid = Uid, cur_x = vector3:x(Pos), cur_y = vector3:z(Pos)};
do_cal_move_msg(_S, _Uid) ->
    undefined.

