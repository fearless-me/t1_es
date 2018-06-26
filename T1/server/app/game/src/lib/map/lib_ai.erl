%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 15. 六月 2018 14:49
%%%-------------------------------------------------------------------
-module(lib_ai).
-author("mawenhong").
-include("logger.hrl").
-include("ai_def.hrl").
-include("movement.hrl").
-include("pub_common.hrl").

%% API
-export([
    init/2, update/1, update_patrol/1
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
    % todo 根据怪物巡逻的配置
    _Did = lib_map_obj_rw:get_did(Uid),
    PatrolType = ?ECPT_Path,
    case PatrolType of
        ?ECPT_Path ->
            lib_ai_rw:set_wp_idx(Uid, 1),
            lib_ai_rw:set_wp_list(Uid, PathList),
            lib_ai_rw:set_wp_num(Uid, erlang:length(PathList)),
            ok;
        _ ->
            ok
    end,
    ok.

init_ai(Uid) ->
    _Did = lib_map_obj_rw:get_did(Uid),
    CreateType = ?EACT_Indicate,
    case CreateType of
        ?EACT_NoAI ->
            lib_ai_rw:set_ai_id(Uid, 0);
        ?EACT_Indicate ->
            lib_ai_rw:set_ai_id(Uid, 0);
        ?EACT_Random ->
            lib_ai_rw:set_ai_id(Uid, 0);
        ?EACT_GroupRandom ->
            lib_ai_rw:set_ai_id(Uid, 0)
    end,
    % todo 添加buff、技能等等
    ok.

init_trigger(_Uid) ->
    % todo 根据AI配置添加触发器等等
    ok.

init_transition(Uid) ->
    % todo 根据怪物配置添加AI类型
    case lib_ai_rw:get_ai_id(Uid) of
        0 -> skip;
        _Id ->
            _AiAction = ?AIAT_Active
    end,
    ok.
%%-------------------------------------------------------------------
%%-------------------------------------------------------------------
reset_patrol_tick(Uid) ->
    ResetTick = rand_tool:rand() div ?CREATURE_PATROL_REST_TICK_INTERVAL + ?CREATURE_PATROL_REST_TICK_MIN,
    lib_ai_rw:set_patrol_rest_tick(Uid, ResetTick),
    ok.

reset_look_for_target_tick(_Uid) ->
    ok.

%%-------------------------------------------------------------------
can_update_ai(_Uid) -> false.

%%-------------------------------------------------------------------
update(Uid) ->
    NeedUpdate = can_update_ai(Uid),
    update_action(Uid, NeedUpdate),
    ok.

%%-------------------------------------------------------------------
update_action(Uid, true) ->
    %% todo 获取怪物AI配置
    AiAction = ?AIAT_Null,
    State = lib_ai_rw:get_ai_state(Uid),

    ?TRY_CATCH(update_hook(Uid), Err1, Stk1),
    ?TRY_CATCH(update_transition(Uid, AiAction), Err2, Stk2),
    ?TRY_CATCH(update_state(Uid, State), Err3, Stk3),
    ?TRY_CATCH(update_trigger(Uid), Err4, Stk4),
    ok;
update_action(_Uid, _Any) -> ok.


%%-------------------------------------------------------------------
update_hook(_Uid) ->
    % todo hook 针对特殊的BOSS等等特殊处理
    ok.

%%-------------------------------------------------------------------
update_transition(_Uid, ?AIAT_Null) ->
    skip;
update_transition(Uid, AiAction) ->
    OldState = lib_ai_rw:get_ai_state(Uid),
    NewState = ai_transition:transition(Uid, AiAction),
    case NewState of
        OldState -> skip;
        _ -> change_state(Uid, OldState, NewState)
    end,
    ok.

%%-------------------------------------------------------------------
update_state(_Uid, ?AIST_Null) ->
    ok;
update_state(Uid, State) ->
    ai_state:update(Uid, State),
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
    lib_ai_rw:set_ai_state(NewState),
    ai_state:on_enter(Uid, NewState),
    ok.

%%-------------------------------------------------------------------
%% 巡逻
%%-------------------------------------------------------------------
update_patrol(Uid) ->
    _Did = lib_map_obj_rw:get_did(Uid),
    PatrolType = ?ECPT_Wood,
    case PatrolType of
        ?ECPT_Wood -> skip;
        _ ->
            IsPatrol = lib_ai_rw:get_is_patrol(Uid),
            PatrolTick = lib_ai_rw:get_patrol_rest_tick(Uid),
            update_patrol_action(Uid, IsPatrol, PatrolTick)
    end,
    ok.

%% 巡逻结束
update_patrol_action(Uid, true, _ResetTick) ->
    CurMove = lib_map_obj_rw:get_cur_move(Uid),
    case CurMove of
        ?EMS_STAND ->
            lib_ai_rw:set_is_patrol(Uid, false),
            reset_patrol_tick(Uid),
            ok;
        _ ->
            skip
    end,
    ok;
%% 等待重启
update_patrol_action(Uid, _IsPatrol, ResetTick) when ResetTick > 0 ->
    lib_ai_rw:set_patrol_rest_tick(Uid, ResetTick - 1),
    ok;
%% 更新巡逻
update_patrol_action(Uid, _IsPatrol, _ResetTick) ->
    start_patrol(Uid),
    ok.
%%-------------------------------------------------------------------
start_patrol(Uid) ->
    PatrolType = ?ECPT_Wood,
    start_patrol_action(Uid, PatrolType),
    ok.

start_patrol_action(Uid, ?ECPT_Path) ->
    WPNum = lib_ai_rw:get_wp_num(Uid),
    WPIdx = lib_ai_rw:get_wp_idx(Uid),

    %
    IsReversePatrol1 = lib_ai_rw:get_is_reverse_patrol(Uid),
    IsReversePatrol2 = if not IsReversePatrol1 andalso (WPIdx == WPNum) -> not IsReversePatrol1; true -> IsReversePatrol1 end,
    IsReversePatrol3 = if IsReversePatrol1 andalso (WPIdx == 1) -> not IsReversePatrol1; true -> IsReversePatrol2 end,

    NewWPIdx = if IsReversePatrol3 -> WPIdx - 1; true -> WPIdx + 1 end,

    lib_ai_rw:set_wp_idx(Uid, NewWPIdx),
    lib_ai_rw:set_is_patrol(Uid, IsReversePatrol3),

    WPList = lib_ai_rw:get_wp_list(Uid),
    TarPos = lists:nth(NewWPIdx, WPList),

    %% move to     

    ok;
start_patrol_action(Uid, ?ECPT_Range) ->
    Range = ?CREATURE_PATROL_RADIUS * 2,
    NowPos = lib_map_obj_rw:get_cur_pos(Uid),
    X = vector3:x(NowPos) + ((rand_tool:rand() rem Range) - ?CREATURE_PATROL_RADIUS),
    Z = vector3:z(NowPos) + ((rand_tool:rand() rem Range) - ?CREATURE_PATROL_RADIUS),
    TarPos = vector3:new(X, 0, Z),

    % todo 怪物开始跑路

    ok;
start_patrol_action(_Uid, _AnyType) ->
    ok.

