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

%% 吟唱技能会有一个施放过程，其余全是瞬发技能
%% API
-export([
    use_skill/4
]).

-export([
    is_using_skill/1,
    is_in_battle/1
]).

use_skill(Aer, DerList, SkillId, Serial) ->
    SkillCfg = combat_interface:get_skill_cfg(SkillId),
    case mod_combat_filter:filter(Aer, DerList, SkillCfg) of
        {#m_object_rw{} = Attacker, [#m_object_rw{}|_] = TargetList} ->
            use_skill_success(Attacker, TargetList, SkillCfg, Serial);
        ErrorCode ->
            ?ERROR("~p use skill ~p to ~p serial ~p failed:~p",
                [Aer, SkillId, DerList, Serial, ErrorCode]),
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
    CEParams = get_ce_param(SkillCfg, ?HP_CHANGE_SKILL, Serial),
    ?TRY_CATCH(trigger_before_cast_event(Attacker, TargetList, SkillCfg, CEParams)),

    %% 进入战斗状态
    object_rw:set_battle_in_time(Uid, misc_time:milli_seconds()),

    ?DEBUG("~p use skill ~p to tar ~p", [Uid, SkillId, DerList]),
    use_skill_dispatcher(SkillCfg, Attacker, TargetList, Serial),
    ok.

%% 吟唱
use_skill_dispatcher(#skillCfg{it_type = ?SKILL_SUB_TYPE_IT_SPELL} = SkillCfg , Aer, Tar, Serial) ->
    spell_skill(Aer, Tar, SkillCfg, Serial);
%% 瞬时
use_skill_dispatcher(#skillCfg{it_type = IT_Type} = SkillCfg, Aer, Tar, Serial)
    when IT_Type =:= ?SKILL_SUB_TYPE_IT_INSTANT; IT_Type =:= ?SKILL_SUB_TYPE_IT_NORMAL ->
    instant_skill(Aer, Tar, SkillCfg, Serial).

%% todo 吟唱技能 使用通用进度流程
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
    #m_object_rw{uid = Uid} = Target,
    #skillCfg{} = SkillCfg, Serial
) ->
    %% 进入战斗状态
    object_rw:set_battle_in_time(Uid, misc_time:milli_seconds()),

    %% 命中事件
    CEParams = get_ce_param(SkillCfg, ?HP_CHANGE_SKILL, Serial),
    ?TRY_CATCH(trigger_hit_before_event(Attack, [Target], SkillCfg, CEParams), Error1, Stk1),
    ?TRY_CATCH(trigger_hit_event(Attack, [Target], SkillCfg, CEParams), Error2, Stk2),
    ok.

is_using_skill(Aer) ->
    mod_progress_skill:is_using_skill(Aer).

is_in_battle(Aer) ->
    object_state:in_battle(Aer).

trigger_before_cast_event(Aer, DerList, #skillCfg{beforecast = EventList}, CEParams) ->
    trigger_event(Aer, DerList, EventList, CEParams).
trigger_hit_before_event(Aer, DerList, #skillCfg{beforehit = EventList}, CEParams) ->
    trigger_event(Aer, DerList, EventList, CEParams).
trigger_hit_event(Aer, DerList, #skillCfg{ishit = EventList}, CEParams) ->
    trigger_event(Aer, DerList, EventList, CEParams).

%% TODO 使用通用进度流程
trigger_cast_tick_event(Aer, Der, #skillCfg{castingtick = EventList}) ->
%%    condition_event:action_all(EventList, [Aer, Der]).
    ok.

trigger_event(_Aer, [], _EventList, _CEParams) -> ok;
trigger_event(Aer, [Der | DerList], EventList, CEParams) ->
    condition_event:action_all(EventList, [Aer, Der], CEParams),
    trigger_event(Aer, DerList, EventList, CEParams).

get_ce_param(#skillCfg{id = SkillId, hp_steal = HpSteal, special_options = SpecialOptions}, Cause, Serial) ->
    CEParams = condition_event_interface:init_self_ce_param(?MODULE_MAP_PROCESS),
    CEParams#{
        skillID => SkillId,
        cause => Cause,
        serial => Serial,
        hp_steal => HpSteal,
        special_options => SpecialOptions
    }.