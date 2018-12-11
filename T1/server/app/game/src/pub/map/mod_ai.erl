%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%  ai 使用有限状态机外加一些触发器的机制实现，如果是特殊的BOSS
%%%  单独处理或挂很多触发器
%%% @end
%%% Created : 15. 六月 2018 14:49
%%%-------------------------------------------------------------------
-module(mod_ai).
-author("mawenhong").
-include("logger.hrl").
-include("pub_def.hrl").
-include("rec_rw.hrl").
-include("gs_cache.hrl").
-include("movement.hrl").
-include("ai.hrl").




%% API
-export([
    init/2, update/2,
    %% patrol
    update_patrol/1,
    clear_all_enmity/1, reset_patrol_tick/1, reset_look_for_target_tick/1,
    update_look_for_enemy/1, reset_lock_target_time/1, update_lock_target/1,
    %% pursue
    get_pursue_unit/1, start_pursue/2, update_pursue/2, count_down_attack_tick/1,
    %% skill&combat
    add_enmity/3, clear_enmity/3, set_enmity_active/3,
    on_ai_event/2, is_in_attack_dist/2, ai_use_skill/3,
    %% flee
    count_down_flee_tick/1, rand_flee_pos/1, start_flee/2, update_flee/1,
    %% return
    start_return/1, update_return/1,
    %%
    get_target_by_type/2
]).

%%-------------------------------------------------------------------
init(Uid, AiType) ->
    ?DEBUG("~p init ai type ~p", [Uid, AiType]),
    init_patrol(Uid, []),
    init_ai(Uid),
    init_trigger(Uid),
    init_transition(Uid),
    reset_look_for_target_tick(Uid),
    reset_patrol_tick(Uid),
    ok.

%%-------------------------------------------------------------------
init_patrol(Uid, PathList) ->
    Did = object_rw:get_data_id(Uid),
    #monster_cfg{patrol_type = PatrolType} = ?get_monster_cfg(Did),
    case PatrolType of
        ?AI_PATROL_PATH ->
            object_rw:set_fields(
                Uid,
                [
                    {#m_object_rw.ai_wp_idx, 1},
                    {#m_object_rw.ai_wp_list, PathList},
                    {#m_object_rw.ai_wp_num, erlang:length(PathList)}
                ]
            ),
            ok;
        _ ->
            ok
    end,
    ok.

%%-------------------------------------------------------------------
init_ai(Uid) ->
    Did = object_rw:get_data_id(Uid),
    #monster_cfg{ai_init_type = CreateType, ai_id = AiId } = ?get_monster_cfg(Did),
    case CreateType of
        ?AI_INIT_INDICATE ->
            object_rw:set_ai_id(Uid, AiId),
            object_rw:set_ai_state(Uid, ?AI_STATE_IDLE);
        ?AI_INIT_RANDOM ->
            object_rw:set_ai_id(Uid, 0),
            object_rw:set_ai_state(Uid, ?AI_STATE_IDLE);
        ?AI_INIT_GROUP_RANDOM ->
            object_rw:set_ai_id(Uid, 0),
            object_rw:set_ai_state(Uid, ?AI_STATE_IDLE);
        _ ->
            object_rw:set_ai_id(Uid, 0)
    end,
    % todo 添加buff、技能等等
    ok.

%%-------------------------------------------------------------------
init_trigger(Uid) ->
    % todo 根据AI配置添加触发器等等
    ai_trigger:init(Uid),
    ok.

%%-------------------------------------------------------------------
init_transition(_Uid) -> ok.
%%-------------------------------------------------------------------
%%-------------------------------------------------------------------
reset_patrol_tick(Uid) ->
    ResetTick = rand_tool:rand() rem ?AI_PATROL_REST_TICK_INTERVAL + ?AI_PATROL_REST_TICK_MIN,
    object_rw:set_ai_patrol_rest_tick(Uid, ResetTick),
    ok.

%%-------------------------------------------------------------------
can_update_ai(Uid) ->
    %% todo 检查是否有AI，是否死亡，以及其他限制状态
    AiId = object_rw:get_ai_id(Uid, 0),
    AiId > 0.

%%-------------------------------------------------------------------
update(#m_cache_map_object_priv{uid = Uid}, _Now) ->
    NeedUpdate = can_update_ai(Uid),
    do_update(Uid, NeedUpdate),
    ok;
update(_Any, _Now) ->
    ok.

%%-------------------------------------------------------------------
do_update(Uid, true) ->
    %% 获取怪物AI配置
    Did = object_rw:get_data_id(Uid),
    #monster_cfg{ai_type = AiType } = ?get_monster_cfg(Did),
    State = object_rw:get_ai_state(Uid),
    
    ?TRY_CATCH(update_hook(Uid), Err1, Stk1),
    ?TRY_CATCH(update_transition(Uid, AiType), Err2, Stk2),
    ?TRY_CATCH(update_state(Uid, State), Err3, Stk3),
    ?TRY_CATCH(update_trigger(Uid), Err4, Stk4),
    ok;
do_update(_Uid, _Any) -> ok.


%%-------------------------------------------------------------------
update_hook(_Uid) ->
    % todo hook 针对特殊的BOSS等等特殊处理
    ok.

%%-------------------------------------------------------------------
update_transition(_Uid, ?AI_NULL) ->
    skip;
update_transition(Uid, AiType) ->
    OldState = object_rw:get_ai_state(Uid),
    NewState = ai_transition:transition(Uid, AiType),
    case NewState of
        OldState -> skip;
        _ -> change_state(Uid, OldState, NewState)
    end,
    ok.

%%-------------------------------------------------------------------
update_state(_Uid, ?AI_STATE_NULL) ->
    ok;
update_state(Uid, AiState) ->
    ai_state:update(Uid, AiState),
    ok.

%%-------------------------------------------------------------------
update_trigger(_Uid) ->
    % todo 更新触发器
    ok.

%%-------------------------------------------------------------------
change_state(Uid, OldState, NewState) ->
    % 先退出旧状态
    ai_state:on_exit(Uid, OldState),
    %在更新状态
    object_rw:set_ai_state(Uid, NewState),
    ai_state:on_enter(Uid, NewState),
    ok.

%%-------------------------------------------------------------------
%% 巡逻
%%-------------------------------------------------------------------
update_patrol(Uid) ->
    Did = object_rw:get_data_id(Uid),
    #monster_cfg{patrol_type = PatrolType} = ?get_monster_cfg(Did),
    case PatrolType of
        ?AI_PATROL_WOOD -> skip;
        _ ->
            IsPatrol = object_rw:get_ai_is_patrol(Uid),
            PatrolTick = object_rw:get_ai_patrol_rest_tick(Uid),
            do_update_patrol(Uid, IsPatrol, PatrolTick)
    end,
    ok.

%% 巡逻结束
do_update_patrol(Uid, true, _ResetTick) ->
    CurMove = object_rw:get_cur_move(Uid),
    case CurMove of
        ?EMS_STAND ->
            object_rw:set_ai_is_patrol(Uid, false),
            reset_patrol_tick(Uid),
            ok;
        _ ->
            skip
    end,
    ok;
%% 等待重启
do_update_patrol(Uid, _IsPatrol, ResetTick) when ResetTick > 0 ->
    object_rw:set_ai_patrol_rest_tick(Uid, ResetTick - 1),
    ok;
%% 更新巡逻
do_update_patrol(Uid, _IsPatrol, _ResetTick) ->
    start_patrol(Uid),
    ok.
%%-------------------------------------------------------------------
start_patrol(Uid) ->
    % todo 根据怪物的配置来启动
    Did = object_rw:get_data_id(Uid),
    #monster_cfg{patrol_type = PatrolType} = ?get_monster_cfg(Did),
    do_start_patrol(Uid, PatrolType),
    ok.

do_start_patrol(Uid, ?AI_PATROL_PATH) ->
    WPNum = object_rw:get_ai_wp_num(Uid),
    WPIdx = object_rw:get_ai_wp_idx(Uid),
    
    %
    IsReversePatrol1 = object_rw:get_ai_is_reverse_patrol(Uid),
    IsReversePatrol2 =
        if
            not IsReversePatrol1 andalso (WPIdx == WPNum) ->
                not IsReversePatrol1;
            true ->
                IsReversePatrol1
        end,
    IsReversePatrol3 =
        if
            IsReversePatrol1 andalso (WPIdx == 1) ->
                not IsReversePatrol1;
            true ->
                IsReversePatrol2
        end,
    
    NewWPIdx = if IsReversePatrol3 -> WPIdx - 1; true -> WPIdx + 1 end,
    

    object_rw:set_fields(Uid,
        [
            {#m_object_rw.ai_wp_idx, NewWPIdx},
            {#m_object_rw.ai_is_patrol, IsReversePatrol3}
        ]
    ),
    
    WPList = object_rw:get_ai_wp_list(Uid),
    TarPos = lists:nth(NewWPIdx, WPList),
    
    % 怪物开始跑路
    do_started_patrol_1(Uid, TarPos),
    ok;
do_start_patrol(Uid, ?AI_PATROL_RANGE) ->
    Did = object_rw:get_data_id(Uid),
    Pos = object_rw:get_born_pos(Uid),
    #monster_cfg{patrol_radius = Radius} = ?get_monster_cfg(Did),
    Diameter = Radius * 2,
    X = vector3:x(Pos) + ((rand_tool:rand() rem Diameter) - Radius),
    Z = vector3:z(Pos) + ((rand_tool:rand() rem Diameter) - Radius),
    TarPos = vector3:new(X, 0, Z),
    
    % 怪物开始跑路
    do_started_patrol_1(Uid, TarPos),
    ok;
do_start_patrol(_Uid, _AnyType) ->
    ok.

%%
do_started_patrol_1(Uid, TarPos) ->
    Ret = mod_move:start_monster_walk(Uid, TarPos, ?EMS_MONSTER_PATROL, true),
    case Ret of
        true -> object_rw:set_ai_is_patrol(Uid, true);
        _ -> skip
    end,
    ok.

%%-------------------------------------------------------------------
%%-------------------------------------------------------------------
%%
clear_all_enmity(Uid) ->
    List = object_rw:get_enmity_list(Uid),
    lists:foreach(
        fun(#m_unit_enmity{uid = TarUid}) ->
            clear_enmity(TarUid, Uid, false)
        end, List),
    
    object_rw:set_fields(Uid,
        [{#m_object_rw.enmity_list, []}, {#m_object_rw.max_enmity_uid, 0}]),
    ok.

%% todo 优化仇恨列表的计算
add_enmity(Uid, TarUid, Val) ->
    EnList0 = object_rw:get_enmity_list(Uid),
    EnList1 =
        case lists:keyfind(TarUid, #m_unit_enmity.uid, EnList0) of
            #m_unit_enmity{enmity = EnmityVal} = Enmity ->
                lists:keystore(
                    TarUid,
                    #m_unit_enmity.uid,
                    EnList0,
                    Enmity#m_unit_enmity{enmity = EnmityVal + Val}
                );
            _ ->
                [#m_unit_enmity{uid = TarUid, enmity = Val} | EnList0]
        end,
    
    object_rw:set_fields(Uid,
        [{#m_object_rw.enmity_list, EnList1}, {#m_object_rw.no_inc_enmity_tick, 0}]),
    
    sort_max_enmity(Uid, EnList1),
    ok.

%%-------------------------------------------------------------------
sort_max_enmity(Uid, []) ->
    object_rw:set_max_enmity_uid(Uid, 0),
    ok;
sort_max_enmity(Uid, EnList0) ->
    EnList1 = filter_enmity_list(EnList0, []),
    TarUid = do_sort_max_enmity(EnList1, 0, 0),
    
    object_rw:set_fields(Uid,
        [
            {#m_object_rw.enmity_list, EnList1},
            {#m_object_rw.max_enmity_uid, TarUid}
        ]
    ),
    
    ok.

filter_enmity_list([], Acc) ->
    Acc;
filter_enmity_list([#m_unit_enmity{uid = Uid} = Enmity | EnList], Acc) ->
    case is_target_valid(Uid) of
        true ->
            filter_enmity_list(EnList, [Enmity | Acc]);
        _ ->
            filter_enmity_list(EnList, [Enmity#m_unit_enmity{active = false} | Acc])
    end.

do_sort_max_enmity([], TarUid, _TarEnVal) ->
    TarUid;
do_sort_max_enmity(
    [#m_unit_enmity{uid = Uid, enmity = EnVal, active = true} | EnList],
    _TarUid, TarEnVal
) when EnVal > TarEnVal ->
    do_sort_max_enmity(EnList, Uid, EnVal);
do_sort_max_enmity([_H | EnList], TarUid, TarEnVal) ->
    do_sort_max_enmity(EnList, TarUid, TarEnVal).


%%-------------------------------------------------------------------
clear_enmity(Uid, TarUid, false) ->
    EnList0 = object_rw:get_enmity_list(Uid),
    EnList1 = lists:keydelete(TarUid, #m_unit_enmity.uid, EnList0),
    object_rw:set_enmity_list(Uid, EnList1),
    
    EnList1;
clear_enmity(Uid, TarUid, _SetMaxEnmity) ->
    EnList1 = clear_enmity(Uid, TarUid, false),
    sort_max_enmity(Uid, EnList1),
    ok.

%%-------------------------------------------------------------------
set_enmity_active(Uid, Tar, Active) ->
    EnList0 = object_rw:get_enmity_list(Uid),
    case lists:keyfind(Tar, #m_unit_enmity.uid, EnList0) of
        #m_unit_enmity{} = Enmity ->
            EnList1 = lists:keyreplace(Enmity#m_unit_enmity{active = Active}),
            sort_max_enmity(Uid, EnList1);
        _ ->
            skip
    end.

%%-------------------------------------------------------------------
update_look_for_enemy(Uid) ->
    T = object_rw:get_ai_look_for_target_tick(Uid),
    R = can_look_for_enemy(Uid, T),
    do_update_look_for_enemy(Uid, R).

do_update_look_for_enemy(Uid, true) ->
    reset_look_for_target_tick(Uid),
    start_look_for_enemy(Uid);
do_update_look_for_enemy(_Uid, _) -> skip.

%%-------------------------------------------------------------------
can_look_for_enemy(_Uid, V) when V =< 0 -> true;
can_look_for_enemy(Uid, V) when V > 0 ->
    object_rw:set_ai_look_for_target_tick(Uid, V - 1),
    false;
can_look_for_enemy(_Uid, _V) ->
    true.

%%-------------------------------------------------------------------
start_look_for_enemy(Uid) ->
    % todo 在视野范围内寻目标，可以优先在当前所在的格子里找
    reset_look_for_target_tick(Uid),
    ok.

%%-------------------------------------------------------------------
update_lock_target(Uid) ->
    Current = object_rw:get_ai_target_uid(Uid),
    Changed = find_lock_target(Uid, Current, false),
    changed_lock_target(Uid, Changed).

changed_lock_target(_Uid, true) -> true;
changed_lock_target(Uid, _False) ->
    LockTick = object_rw:get_ai_lock_target_tick(Uid),
    case LockTick > 0 of
        true ->
            object_rw:set_ai_look_for_target_tick(Uid, LockTick - 1),
            false;
        _ ->
            TarUid = object_rw:get_ai_target_uid(Uid),
            MaxUid = get_max_enmity_uid(Uid),
            reset_lock_target_time(Uid),
            case TarUid =:= MaxUid of
                true ->
                    false;
                _ ->
                    object_rw:set_ai_target_uid(Uid, MaxUid),
                    true
            end
    end.

%%-------------------------------------------------------------------
find_lock_target(_Uid, 0, Changed) ->
    Changed;
find_lock_target(Uid, TargetUid, Changed) ->
    case is_target_valid(TargetUid) of
        true -> Changed;
        _ ->
            % todo 目标存在清除仇恨
            clear_enmity(Uid, TargetUid, true),
            NewTar = get_max_enmity_uid(Uid),
            object_rw:set_ai_target_uid(Uid, NewTar),
            reset_lock_target_time(Uid),
            find_lock_target(Uid, NewTar, true)
    end.

%%-------------------------------------------------------------------
is_target_valid(_TargetUid) ->
    true.

%%-------------------------------------------------------------------
reset_look_for_target_tick(Uid) ->
    ResetTick = rand_tool:rand() rem ?AI_LOOK_FOR_ENEMY_TICK_INTERVAL + ?AI_LOOK_FOR_ENEMY_TICK_MIN,
    object_rw:set_ai_look_for_target_tick(Uid, ResetTick),
    ok.

%%-------------------------------------------------------------------
%%-------------------------------------------------------------------
reset_lock_target_time(Uid) ->
    ResetTick = rand_tool:rand() rem ?AI_LOCK_TARGET_TICK_INTERVAL + ?AI_LOCK_TARGET_MIN_TICK,
    object_rw:set_ai_look_for_target_tick(Uid, ResetTick),
    ok.

%%-------------------------------------------------------------------
reset_check_pursue_tick(Uid) ->
    object_rw:set_ai_check_pursue_tick(Uid, rand_tool:rand() rem 6 + 5),
    ok.

%%-------------------------------------------------------------------
count_down_attack_tick(Uid) ->
    Tick = object_rw:get_ai_attack_wait_tick(Uid),
    object_rw:set_ai_attack_wait_tick(Uid, Tick - 1),
    ok.

%%-------------------------------------------------------------------
get_pursue_unit(Uid) ->
    TarUid = object_rw:get_ai_target_uid(Uid),
    object_priv:find_object_priv(TarUid).

%%-------------------------------------------------------------------
start_pursue(Uid, TarUid) when is_integer(TarUid), TarUid > 0 ->
    object_rw:set_fields(
        Uid,
        [
            {#m_object_rw.ai_pursue_failed, false},
            {#m_object_rw.ai_cant_pursue, false}
        ]
    ),
    reset_check_pursue_tick(Uid),
    
    Pos = object_rw:get_cur_pos(Uid),
    Ret = mod_move:is_can_monster_walk(Uid, Pos, ?EMS_MONSTER_WALK, true),
    case Ret of
        true ->
            object_rw:set_ai_pursue_tar_pos(Uid, Pos),
            mod_move:start_monster_walk(Uid, Pos, ?EMS_MONSTER_WALK, false);
        _ ->
            object_rw:set_ai_pursue_failed(Uid, true)
    end,
    ok;
start_pursue(_Uid, _TarUid) -> ok.

%%-------------------------------------------------------------------
update_pursue(Uid, TarUid) when is_integer(TarUid), TarUid > 0 ->
    CheckTick = object_rw:get_ai_check_pursue_tick(Uid),
    NoEnmityTick = object_rw:get_no_inc_enmity_tick(Uid),
    IsPursueFailed = object_rw:get_ai_pursue_failed(Uid),
    IsCantPursue = object_rw:get_ai_cant_pursue(Uid),
    object_rw:set_fields(
        Uid,
        [
            {#m_object_rw.ai_check_pursue_tick, CheckTick - 1},
            {#m_object_rw.no_inc_enmity_tick, NoEnmityTick - 1}
        ]
    ),
    update_pursue_1(Uid, TarUid, IsPursueFailed, IsCantPursue),
    ok;
update_pursue(_Uid, _TarUid) -> ok.

%%-------------------------------------------------------------------
update_pursue_1(Uid, _TarUid, true, _Cant) ->
    % todo 目标从仇恨列表删除
    MaxUid = get_max_enmity_uid(Uid),
    start_pursue(Uid, MaxUid),
    ok;
update_pursue_1(Uid, TarUid, _Failed, true) ->
    % todo 检查目标能否移动
    CanMove = true,
    case CanMove of
        true -> start_pursue(Uid, TarUid);
        _ -> skip
    end;
update_pursue_1(Uid, TarUid, _Failed, _Cant) ->
    % todo 检查目标能否移动
    CanMove = true,
    case CanMove of
        falae ->
            object_rw:set_ai_cant_pursue(Uid, true);
        _ ->
            NoEnmityTick = object_rw:get_no_inc_enmity_tick(Uid),
            update_pursue_2(Uid, TarUid, NoEnmityTick)
    end,
    ok.

%%-------------------------------------------------------------------
update_pursue_2(Uid, _TarUid, NoEnmityTick) when NoEnmityTick > ?AI_RETURN_TICK ->
    object_rw:set_ai_pursue_failed(Uid, true),
    ok;
update_pursue_2(Uid, TarUid, _NoEnmityTick) ->
    CurMove = object_rw:get_cur_move(Uid),
    IsStop = object_rw:get_force_stopped(Uid),
    case CurMove of
        ?EMS_STAND when IsStop ->
            start_pursue(Uid, TarUid);
        ?EMS_STAND when IsStop =:= false ->
            start_pursue(Uid, TarUid);
        _ ->
            update_pursue_3(Uid, TarUid, object_rw:get_ai_check_pursue_tick(Uid))
    end,
    ok.

%%-------------------------------------------------------------------
update_pursue_3(Uid, TarUid, CheckTick) when CheckTick =< 0 ->
    reset_check_pursue_tick(Uid),
    CurPos = object_rw:get_cur_pos(Uid),
    TarPos = object_rw:get_cur_pos(TarUid),
    Diff_X = vector3:x(CurPos) - vector3:x(TarPos),
    Diff_Z = vector3:z(CurPos) - vector3:z(TarPos),
    if
        erlang:abs(Diff_X) > ?AI_PURSUE_XZ_MAX;
        erlang:abs(Diff_Z) > ?AI_PURSUE_XZ_MAX ->
            start_pursue(Uid, TarUid);
        true ->
            skip
    end,
    ok;
update_pursue_3(_Uid, _TarUid, _CheckTick) ->
    skip.

%%-------------------------------------------------------------------
get_max_enmity_uid(_Uid) ->
    % todo 从仇恨列表中找一个最大的
    0.

%%-------------------------------------------------------------------
on_ai_event(_Uid, _Event) ->
    ok.

%%-------------------------------------------------------------------
is_in_attack_dist(_Uid, TarUid) when TarUid =< 0 ->
    false;
is_in_attack_dist(Uid, TarUid) when is_number(TarUid) ->
    Obj = object_priv:find_object_priv(TarUid),
    is_in_attack_dist(Uid, Obj);
is_in_attack_dist(_Uid, undefined) ->
    false;
is_in_attack_dist(Uid, #m_cache_map_object_priv{uid = TarUid}) ->
    VSrc = object_rw:get_cur_pos(Uid),
    VDst = object_rw:get_cur_pos(TarUid),
    Dist_SQ = vector3:dist_sq(VSrc, VDst),
    %% todo 根据普攻来检查距离， AI使用的技能可能需要动态选择
    Dist_SQ >= 100;
is_in_attack_dist(_Uid, _Any) ->
    false.

ai_use_skill(Uid, SkillId, TarUid) ->
    Serial = object_rw:get_ai_skill_serial(Uid),
    Ret = mod_combat:use_skill(Uid, TarUid, SkillId, Serial),
    case Ret =:= ok of
        true ->
            object_rw:set_ai_skill_serial(Uid, Serial + 1);
        _ -> skip
    end,
    Ret =:= ok.


%%-------------------------------------------------------------------
%%-------------------------------------------------------------------
count_down_flee_tick(Uid) ->
    Tick = object_rw:get_ai_flee_tick(Uid),
    object_rw:set_ai_flee_tick(Uid, Tick - 1),
    Tick - 1.

rand_flee_pos(Uid) ->
    V_X = (rand_tool:rand() rem ?AI_RANGE_FLEE_RADIUS) + ?AI_RANGE_FLEE_RADIUS,
    Ang = (rand_tool:rand() rem 360) / 1.0,
    Dir1 = vector3:new(V_X, 0, 0),
    Dir2 = vector3:rotate_around_origin_2d(Dir1, Ang),
    Pos1 = object_rw:get_cur_pos(Uid),
    Pos2 = vector3:add(Pos1, Dir2),
    % todo 检查目标是否可以走，不可走多随机几次
    object_rw:set_fields(
        Uid,
        [
            {#m_object_rw.ai_flee_dir, Dir2},
            {#m_object_rw.ai_flee_dst, Pos2}
        ]
    ),
    Pos2.

start_flee(Uid, Dst) ->
    object_rw:set_fields(
        Uid,
        [
            {#m_object_rw.ai_is_arrived_flee_pos, false},
            {#m_object_rw.ai_pursue_failed, false},
            {#m_object_rw.ai_cant_pursue, false}
        ]
    ),
    
    Ret = mod_move:is_can_monster_walk(Uid, Dst, ?EMS_MONSTER_FLEE, true),
    case Ret of
        true ->
            object_rw:set_ai_flee_dst(Uid, Dst),
            mod_move:start_monster_walk(Uid, Dst, ?EMS_MONSTER_FLEE, false);
        _ ->
            object_rw:set_ai_pursue_failed(Uid, true)
    end,
    
    ok.

update_flee(Uid) ->
    IsFailed = object_rw:get_ai_pursue_failed(Uid),
    IsCantPursue = object_rw:get_ai_cant_pursue(Uid),
    do_update_flee(Uid, IsFailed, IsCantPursue),
    ok.

%% 巡逻结束
do_update_flee(Uid, true, _Cant) ->
    rand_flee_pos(Uid),
    start_flee(Uid, object_rw:get_ai_flee_dst(Uid)),
    ok;
%% 等待重启
do_update_flee(Uid, _Failed, true) ->
    case object_priv:is_unit_cant_move_state(Uid) of
        false -> start_flee(Uid, object_rw:get_ai_flee_dst(Uid));
        _ -> skip
    end,
    ok;
%% 更新巡逻
do_update_flee(Uid, _Failed, _Cant) ->
    case object_priv:is_unit_cant_move_state(Uid) of
        true ->
            object_rw:set_ai_cant_pursue(Uid, true);
        _ ->
            CurMove = object_rw:get_cur_move(Uid),
            IsStop = object_rw:get_force_stopped(Uid),
            case CurMove of
                ?EMS_STAND when IsStop ->
                    start_flee(Uid, object_rw:get_ai_flee_dst(Uid));
                ?EMS_STAND when IsStop =:= false ->
                    object_rw:set_ai_is_arrived_flee_pos(Uid, true);
                _ ->
                    start_flee(Uid, object_rw:get_ai_flee_dst(Uid))
            end
    end,
    ok.
-spec get_target_by_type(Uid :: integer(), Type :: trigger_target()) -> integer().
get_target_by_type(_Uid, ?CFE_NULL) ->
    0;
get_target_by_type(Uid, ?CFE_Self) ->
    Uid;
get_target_by_type(Uid, ?CFE_CurPlayer) ->
    object_rw:get_ai_target_uid(Uid);
get_target_by_type(Uid, ?CFE_RandPlayer) ->
    L = object_rw:get_enmity_list(Uid),
    case misc:lists_rand_get(L) of
        undefined -> 0;
        R -> R#m_unit_enmity.uid
    end;
get_target_by_type(Uid, ?CFE_MinEnimty) ->
    get_max_enmity_uid(Uid).

%%-------------------------------------------------------------------
%%-------------------------------------------------------------------
start_return(Uid) ->
    BornPos = object_rw:get_born_pos(Uid),
    ?TRY_CATCH(mod_move:on_obj_pos_change(Uid, BornPos)),
    ok.

update_return(Uid) ->
    case object_rw:get_cur_move(Uid) of
        true -> object_rw:set_ai_arrived_return_pos_direct(Uid, true);
        _Any -> skip
    end,
    ok.