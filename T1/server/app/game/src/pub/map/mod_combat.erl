%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%       这仅仅是个例子,这得策划说了算
%%% @end
%%% Created : 22. 五月 2018 17:32
%%%-------------------------------------------------------------------
-module(mod_combat).
-author("mawenhong").
-include("logger.hrl").
-include("pub_def.hrl").
-include("netmsg.hrl").
-include("gs_cache.hrl").
-include("gs_common_rec.hrl").
-include("map_core.hrl").
-include("combat.hrl").
-include("rec_rw.hrl").
-include("cfg_skill.hrl").
-include("module_process_define.hrl").

%% 瞬发技能放完就结束
%% 吟唱技能设置到当前技能
%% 引导技能也设置到当前技能
%% 还有些技能可能释放完就结束，但是会持续作用
%% 吟唱技能多次伤害的技能支持配置每一次计算伤害的时间 #m_combat_rw.cur_dmg_index / operate_time
%% 引导技能要看策划需求，如果每次一样就设置cd

%% API
-export([
    use_skill/4, tick/2, interrupt_skill/1,
    dispatcher/5, can_ai_use_skill/1, is_using_skill/1
]).

use_skill(Aer, DerList, SkillId, Serial) ->
    SkillCfg = combat_interface:get_skill_cfg(SkillId),
    case mod_combat_filter:filter(Aer, DerList, SkillCfg) of
        {#m_object_rw{} = Attacker, [#m_object_rw{}|_] = TargetList} ->
            use_skill_success(Attacker, TargetList, SkillCfg, Serial);
        ErrorCode ->
            %% failed
            NetMsg = #pk_GS2U_UseSkill{
                uid = Aer,
                tar_uids = DerList,
                skill_id = SkillId,
                serial = Serial,
                error_code = ErrorCode
            },
            gs_interface:send_net_msg(Aer,NetMsg)
    end.

use_skill_success(#m_object_rw{uid = Uid} = Attacker, [#m_object_rw{}|_] = TargetList, #skillCfg{id = SkillId} = SkillCfg, Serial) ->
    DerList = [ID || #m_object_rw{uid = ID} <- TargetList],
    NetMsg = #pk_GS2U_UseSkill{
        uid = Uid,
        tar_uids = DerList,
        skill_id = SkillId,
        serial = Serial,
        error_code = 0
    },
    mod_view:send_net_msg_to_visual(Uid, NetMsg),

    %% 触发事件
    CEParams = get_ce_param(SkillId, ?HP_CHANGE_SKILL, Serial),
    ?TRY_CATCH(trigger_before_cast_event(Attacker, TargetList, SkillCfg, CEParams)),

    %% 根据类型
    object_rw:set_skill_serial(Uid, Serial),

    use_skill_dispatcher(SkillCfg, Attacker, TargetList, Serial),
    ?DEBUG("~p use skill ~p to tar ~p", [Uid, SkillId, DerList]),
    ok.

%% 吟唱
use_skill_dispatcher(#skillCfg{it_type = ?SKILL_SUB_TYPE_IT_SPELL} = SkillCfg , Aer, Tar, Serial) ->
    spell_skill(Aer, Tar, SkillCfg, Serial);
%% 瞬时
use_skill_dispatcher(#skillCfg{it_type = IT_Type} = SkillCfg, Aer, Tar, Serial)
    when IT_Type =:= ?SKILL_SUB_TYPE_IT_INSTANT; IT_Type =:= ?SKILL_SUB_TYPE_IT_NORMAL ->
    instant_skill(Aer, Tar, SkillCfg, Serial).

%% todo 吟唱技能
spell_skill(_Aer, _Tar, #skillCfg{id = SkillID} = _SkillCfg, _Serial) ->
    ?WARN("spell skill no realize:~p", [SkillID]),
    ok.

%% 瞬发技能
instant_skill(Aer, TarList, SkillCfg, Serial) ->
    active_skill_once(Aer, TarList, SkillCfg, Serial).

active_skill_once(#m_object_rw{uid = Uid} = Aer, TarList, #skillCfg{id = SkillId} = SkillCfg, Serial) ->
    TargetUidList = [ID || #m_object_rw{uid = ID} <- TarList],
    HitMsg = #pk_GS2U_HitTarget{
        tar_uids = TargetUidList, src_uid = Uid, cause = ?HIT_REASON_SKILL, misc = SkillId, serial = Serial
    },

    F =
        fun(#m_object_rw{uid = TargetUid} = Hit) ->
            gs_interface:send_net_msg(TargetUid, HitMsg),

            calculate_dmg(Aer, Hit, SkillCfg, Serial)
        end,
    lists:foreach(F, TarList).

%%-------------------------------------------------------------------
calculate_dmg(
    #m_object_rw{} = Attack,
    #m_object_rw{} = Target,
    #skillCfg{id = SkillId} = SkillCfg, Serial
) ->
    %% 命中事件
    CEParams = get_ce_param(SkillId, ?HP_CHANGE_SKILL, Serial),
    ?TRY_CATCH(trigger_hit_event(Attack, [Target], SkillCfg, CEParams)),
    ok.

%%-------------------------------------------------------------------
interrupt_skill(Uid) ->
    SkillId = object_rw:get_skill_id(Uid),
    object_rw:set_fields(
        Uid,
        [
            {#m_object_rw.skill_id, 0},
            {#m_object_rw.target_uid, 0},
            {#m_object_rw.skill_serial, 0},
            {#m_object_rw.persist_pos, vector3:new()},
            {#m_object_rw.cur_dmg_index,0},
            {#m_object_rw.operate_time, 0},
            {#m_object_rw.spell_time, 0},
            {#m_object_rw.channel_cd, 0},
            {#m_object_rw.skill_queue, []}
        ]
    ),
    Msg = #pk_GS2U_SkillInterrupt{uid = Uid, skill_id = SkillId},
    mod_view:send_net_msg_to_visual(Uid, Msg),
    ok.


%%-------------------------------------------------------------------
tick(Obj, Now) ->
    ?TRY_CATCH(tick_cur_skill(Obj), Err1, Stk1),
    ?TRY_CATCH(tick_skill_queue(Obj), Err2, Stk2),
    ok.


%%todo 引导技能、吟唱技能
tick_cur_skill(#m_cache_map_object_priv{uid = Uid}) ->
    CurSkillId = object_rw:get_skill_id(Uid),
    do_tick_cur_skill(Uid, combat_interface:get_skill_cfg(CurSkillId)),
    ok.


do_tick_cur_skill(Uid, #skillCfg{id = SkillId} = SkillCfg) ->
    ?WARN("uid ~p tick skill ~p", [Uid, SkillId]),
    Serial = object_rw:get_skill_serial(Uid),
    OpTime0 = object_rw:get_operate_time(Uid, 0),
    OpTime1 = OpTime0 + ?MAP_TICK,
    object_rw:set_operate_time(Uid, OpTime1),
    case can_skill_active_tick(Uid, SkillCfg) of
        true ->
%%            Pos = object_rw:get_persist_pos(Uid),
            ?TRY_CATCH(trigger_cast_tick_event(Uid, Uid, SkillCfg)),
            ?TRY_CATCH(active_skill_once(Uid, Uid, SkillCfg, Serial), Err1, Stk1),
            ?TRY_CATCH(check_end_skill_tick(Uid, SkillCfg), Err2, Stk2),
            ok;
        _ ->
            skip
    end,
    %%

    ok;
do_tick_cur_skill(_Uid, undefined) ->
    ok.

can_skill_active_tick(_Uid, _SkillCfg) ->
    true.

check_end_skill_tick(Uid, _SkillCfg) ->
    _OpTime = object_rw:get_operate_time(Uid),
    %% todo 到达最大时间? 到达最大次数?
    interrupt_skill(Uid).

%%todo 放完就不管的，但是要持续生效的技能
%%todo 创建了一个 OBJ_STATIC
tick_skill_queue(#m_cache_map_object_priv{uid = Uid}) ->
    Queue0 = object_rw:get_skill_queue(Uid),
    Queue1 = tick_skill_queue(Uid, Queue0, []),
    object_rw:set_skill_queue(Uid, Queue1),
    ok.

tick_skill_queue(_Uid, [], Acc) -> Acc;
tick_skill_queue(Uid, [Elm | Queue], Acc) ->
    case ?TRY_CATCH_RET(tick_one_skill_queue(Uid, Elm), error) of
        error -> tick_skill_queue(Uid, Queue, Acc);
        NewElm -> tick_skill_queue(Uid, Queue, [NewElm | Acc])
    end.

tick_one_skill_queue(_Uid, Elm) ->
    Elm.

%%-------------------------------------------------------------------
dispatcher(?OBJ_PLAYER, ?OBJ_PLAYER, Aer, Der, SkillId) ->
    player_vs_player(Aer, Der, SkillId);
dispatcher(?OBJ_PLAYER, ?OBJ_MON, Aer, Der, SkillId) ->
    player_vs_mon(Aer, Der, SkillId);
dispatcher(?OBJ_MON, ?OBJ_PLAYER, Aer, Der, SkillId) ->
    mon_vs_player(Aer, Der, SkillId);
dispatcher(AType, DType, Aer, Der, SkillId) ->
    ?WARN("~p(~p) vs ~p(~p) skill", [Aer, AType, Der, DType, SkillId]).


%%-------------------------------------------------------------------
player_vs_player(Aer, Der, SkillId) ->
    ?INFO("~w vs ~w skill ~p", [Aer, Der, SkillId]),
    ok.

%%-------------------------------------------------------------------
player_vs_mon(Aer, Der, SkillId) ->
    ?INFO("~w vs ~w skill ~p", [Aer, Der, SkillId]),
    ok.

%%-------------------------------------------------------------------
mon_vs_player(Aer, Der, SkillId) ->
    ?INFO("~w vs ~w skill ~p", [Aer, Der, SkillId]),
    ok.


can_ai_use_skill(_Aer) ->
    true.


is_using_skill(Aer) ->
    object_rw:get_skill_id(Aer, 0) > 0.


trigger_before_cast_event(Aer, DerList, #skillCfg{beforecast = EventList}, CEParams) ->
    trigger_event(Aer, DerList, EventList, CEParams).
trigger_hit_event(Aer, DerList, #skillCfg{beforehit = EventList}, CEParams) ->
    trigger_event(Aer, DerList, EventList, CEParams).

%% TODO
trigger_cast_tick_event(Aer, Der, #skillCfg{castingtick = EventList}) ->
%%    condition_event:action_all(EventList, [Aer, Der]).
    ok.

trigger_event(_Aer, [], _EventList, _CEParams) -> ok;
trigger_event(Aer, [Der | DerList], EventList, CEParams) ->
    condition_event:action_all(EventList, [Aer, Der], CEParams),
    trigger_event(Aer, DerList, EventList, CEParams).

get_ce_param(SkillId, Cause, Serial) ->
    CEParams = condition_event_interface:init_self_ce_param(?MODULE_MAP_PROCESS),
    CEParams#{
        skillID => SkillId,
        cause => Cause,
        serial => Serial
    }.