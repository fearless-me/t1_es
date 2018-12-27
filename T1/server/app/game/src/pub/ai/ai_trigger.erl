%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 21. 六月 2018 16:30
%%%-------------------------------------------------------------------
-module(ai_trigger).
-author("mawenhong").
-include("logger.hrl").
-include("pub_def.hrl").
-include("gs_cache.hrl").
-include("ai.hrl").
-include("rec_rw.hrl").
-include("common_def.hrl").

%% API

-export([
    init/1, refresh/1, update/1, set_active/2, on_event/2
]).

%%-------------------------------------------------------------------
init(Uid) ->
    AIid = object_rw:get_ai_id(Uid),
    Triggers = init_1(Uid, AIid),
    object_rw:set_ai_triggers(Uid, Triggers),
    ok.


init_1(_Uid, 0) ->
    [];
init_1(Uid, AIid) when is_number(AIid) ->
    AifCfg = undefined,
    init_1(Uid, AifCfg);
init_1(_Uid, undefined) ->
    [];
init_1(_Uid, _Cfg) ->
    %% todo 怪物配置 [{触发器ID, 对应技能ID, 目标类型}, ...]
    TriggerList = [],
    
    lists:foldl(
        fun({CfgId, SkillId, TarType}, Acc) ->
            [
                #m_ai_trigger{
                    cfg_id = CfgId,
                    skill_id = SkillId,
                    target_type = TarType
                } || Acc
            ]
        end, [], TriggerList).

%%-------------------------------------------------------------------
update(Uid) ->
    Triggers0 = object_rw:get_ai_triggers(Uid, []),
    Triggers1 = lists:map(fun(Trigger) -> do_update(Uid, Trigger) end, Triggers0),
    object_rw:set_ai_triggers(Uid, Triggers1),
    ok.

do_update(_Uid, #m_ai_trigger{is_active = false} = Trigger) ->
    Trigger;
do_update(Uid, #m_ai_trigger{active_tick = Tick, target_type = Type} = Trigger) ->
    case test_interval(Trigger) of
        true ->
            TarUid = mod_ai:get_target_by_type(Uid, Type),
            case
                test_trigger_state(Uid, Trigger, TarUid) andalso
                    test_trigger_event(Uid, Trigger)
            of
                true ->
                    ?TRY_CATCH_RET(on_trigger(Uid, Trigger, TarUid), Trigger);
                _ ->
                    Trigger#m_ai_trigger{active_tick = Tick + 1}
            end;
        _ ->
            Trigger#m_ai_trigger{active_tick = Tick + 1}
    end.

%%-------------------------------------------------------------------
on_trigger(
    Uid,
    #m_ai_trigger{skill_id = SkillId, active_tick = Tick, trigger_times = Times} = Trigger,
    TarUid
) ->
    case mod_ai:ai_use_skill(Uid, SkillId, TarUid) of
        true ->
            Trigger#m_ai_trigger{active_tick = Tick + 1, trigger_times = Times + 1, is_active = true};
        _ ->
            Trigger#m_ai_trigger{is_active = true}
    end.


%%-------------------------------------------------------------------
refresh(Uid) ->
    Triggers0 = object_rw:get_ai_triggers(Uid, []),
    Triggers1 = lists:map(
        fun(Trigger) ->
            Trigger#m_ai_trigger{is_active = false, active_tick = 0, trigger_times = 0}
        end, Triggers0),
    object_rw:set_ai_triggers(Uid, Triggers1),
    ok.

%%-------------------------------------------------------------------
set_active(Uid, EventType) ->
    Triggers0 = object_rw:get_ai_triggers(Uid, []),
    Triggers1 = lists:map(
        fun(#m_ai_trigger{cfg_id = Id} = Trigger) ->
            IsNeedActive = can_active(Id, EventType),
            if
                IsNeedActive ->
                    Trigger#m_ai_trigger{is_active = true};
                true -> Trigger
            end
        end, Triggers0),
    object_rw:set_ai_triggers(Uid, Triggers1),
    ok.

can_active(_CfgId, EventType) ->
    %% todo 获取trigger 配置
    Cfg = #ai_trigger_cfg{},
    Cfg#ai_trigger_cfg.event =:= EventType.

%%-------------------------------------------------------------------
test_interval(#m_ai_trigger{cfg_id = _Id, active_tick = Tick, trigger_times = Times}) ->
    %% todo 获取trigger 配置
    Cfg = #ai_trigger_cfg{},
    #ai_trigger_cfg{event_misc1 = Period, event_misc2 = MaxTimes} = Cfg,
    (Period > 0 andalso Tick rem Period == 0) andalso
        (MaxTimes > 0 andalso Times < MaxTimes).

%%-------------------------------------------------------------------
test_trigger_event(Uid, #m_ai_trigger{cfg_id = _Id}) ->
    %% todo 获取trigger 配置
    Cfg = #ai_trigger_cfg{},
    test_trigger_event(Uid, Cfg);
test_trigger_event(_Uid, #ai_trigger_cfg{event = ?ETEE_Null}) ->
    true;
test_trigger_event(_Uid, #ai_trigger_cfg{prob = Prob}) ->
    rand_tool:rand() rem ?PERCENT =< Prob.

%%-------------------------------------------------------------------
test_trigger_state(_Uid, _Trigger, 0) ->
    false;
test_trigger_state(Uid, Trigger, TarUid) when is_integer(TarUid) ->
    ObjPriv = object_priv:find_object_priv(TarUid),
    test_trigger_state(Uid, Trigger, ObjPriv);
test_trigger_state(_Uid, _Trigger, undefined) ->
    false;
test_trigger_state(Uid, #m_ai_trigger{cfg_id = _Id}, #m_cache_map_object_priv{uid = TarUid} = ObjPriv) ->
    case
        object_priv:is_dead(Uid) orelse
            object_priv:is_dead(TarUid)
    of
        true ->
            false;
        _ ->
            %% todo 获取trigger 配置
            Cfg = #ai_trigger_cfg{},
            test_trigger_state(Uid, Cfg, ObjPriv)
    end;
%% todo 持续增加判断
test_trigger_state(_Uid, #ai_trigger_cfg{state = ?ETST_HPLower}, _Obj) ->
    true;
test_trigger_state(_Uid, _Any, _None) ->
    false.


%%-------------------------------------------------------------------
on_event(Uid, EventType) ->
    Triggers0 = object_rw:get_ai_triggers(Uid, []),
    Triggers1 = lists:map(
        fun(Trigger) ->
            on_event_1(Uid, Trigger, EventType)
        end, Triggers0),
    object_rw:set_ai_triggers(Uid, Triggers1),
    ok.

on_event_1(Uid, #m_ai_trigger{cfg_id = _Id} = Trigger, EventType) ->
    %% todo 获取trigger 配置
    Cfg = #ai_trigger_cfg{},
    on_event_2(Uid, Cfg, Trigger, EventType).

on_event_2(Uid, #ai_trigger_cfg{event = EventType}, Trigger, EventType) ->
    #m_ai_trigger{target_type = TarType, active_tick = Tick} = Trigger,
    TarUid = mod_ai:get_target_by_type(Uid, TarType),
    case test_trigger_event(Uid, Trigger) of
        true ->
            ?TRY_CATCH_RET(on_trigger(Uid, Trigger, TarUid), Trigger);
        _ ->
            Trigger#m_ai_trigger{active_tick = Tick + 1, is_active = true}
    end;
on_event_2(_Uid, _Any, Trigger, _EventType) ->
    Trigger.

