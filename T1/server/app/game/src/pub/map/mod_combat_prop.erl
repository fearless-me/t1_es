%%%-------------------------------------------------------------------
%%% @author tiancheng
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%% 地图上属性战斗计算
%%% @end
%%% Created : 29. 十一月 2018 15:09
%%%-------------------------------------------------------------------
-module(mod_combat_prop).
-author("tiancheng").

-include("gs_cache.hrl").
-include("combat.hrl").
-include("logger.hrl").
-include("rec_rw.hrl").
-include("netmsg.hrl").
-include("cfg_skill.hrl").

%% API
-export([
    change_combat_prop/3,
    change_combat_prop/5,

    hit_damage/8,

    treat/8,    %% 带吸血标志
    treat/7,
    treat/5,

    hp_percent/1
]).

change_combat_prop(Uid, AddList, MultiList) ->
    change_combat_prop(Uid, AddList, MultiList, [], []),
    ok.

change_combat_prop(Uid, AddList, MultiList, AddList_Del, MultiList_Del) ->
    case object_rw:get_battle_props(Uid) of
        #m_battleProps{} = BattleProps ->
            BattlePropsNew = #m_battleProps{listBPFinal = ListBPFinal} = prop_interface:calc(
                BattleProps, AddList, MultiList, AddList_Del, MultiList_Del),
            object_rw:set_battle_props(Uid, BattlePropsNew),

            {_, _, Hp} = lists:keyfind(?BP_2_HP_CUR, 1, ListBPFinal),   %% 必定能找到
            {_, _, HpMax} = lists:keyfind(?BP_2_HP_MAX, 1, ListBPFinal),   %% 必定能找到

            ?DEBUG("change_combat_prop [~p] result[~p,~p]", [Uid, Hp, HpMax]),
            object_rw:set_hp(Uid, erlang:trunc(Hp)),
            object_rw:set_max_hp(Uid, erlang:trunc(HpMax)),
            gs_interface:send_net_msg(Uid, prop_interface:battleProps2NetMsg(Uid, BattlePropsNew)),
            ok;
        _ ->
            %% 没有找到该元素，取默认值进行计算
            ?ERROR("change_combat_prop not found Uid:~w", [Uid])
    end,
    ok.

%% 治疗
-spec treat(#m_object_rw{}, #m_object_rw{}, TreatValue::float(),
    SkillID::integer(), SkillSerial::integer(), HPChangeReason::integer(),
    SpecialOptions::integer()) -> #m_hit_damage_result{}.
treat(#m_object_rw{uid = Uid, battle_props = AttackBps} = Attack,
    #m_object_rw{uid = TargetUid, battle_props = DefenseBps} = Defense,
    TreatValue, Misc1, SkillSerial, HPChangeReason, SpecialOptions) ->
    case can(Uid, TargetUid) of
        true ->
            treat(Attack, Defense, TreatValue, Misc1, SkillSerial, HPChangeReason, SpecialOptions, false);
        _ ->
            ?DEFAULT_DAMAGE_RESULT(AttackBps, DefenseBps, mod_combat_revive:is_dead(DefenseBps))
    end.

%% 治疗
-spec treat(#m_object_rw{}, #m_object_rw{}, TreatValue::float(),
    SkillID::integer(), SkillSerial::integer(), HPChangeReason::integer(),
    SpecialOptions::integer(), IsSuckBloodFlag::boolean()) -> #m_hit_damage_result{}.
treat(#m_object_rw{uid = Uid, battle_props = AttackBps} = Attack,
    #m_object_rw{uid = TargetUid, battle_props = DefenseBps} = Defense,
    TreatValue, Misc1, SkillSerial, HPChangeReason, SpecialOptions, IsSuckBloodFlag) when TreatValue > 0 ->
    case can(Uid, TargetUid) of
        true ->
            Result = #m_hit_damage_result{} = treat(Attack, Defense, TreatValue, SpecialOptions, IsSuckBloodFlag),

            %% 通知客户端血量变化
            HpMsg = #pk_GS2U_HPChange{
                uid = TargetUid,
                src_uid = Uid,
                cause = HPChangeReason,
                misc1 = Misc1,
                serial = SkillSerial
            },
            broadcast_hp_change(Result, HpMsg);
        _ ->
            ?DEFAULT_DAMAGE_RESULT(AttackBps, DefenseBps, mod_combat_revive:is_dead(DefenseBps))
    end;
treat(#m_object_rw{battle_props = ABps}, #m_object_rw{battle_props = DBps},
    _TreatValue, _Misc1, _SkillSerial, _HPChangeReason, _SpecialOptions, _IsSuckBloodFlag) ->
    ?DEFAULT_DAMAGE_RESULT(ABps, DBps, mod_combat_revive:is_dead(DBps)).

%% 伤害打击
-spec hit_damage(#m_object_rw{}, #m_object_rw{}, DamageValue::float(),
    SkillID::integer(), SkillSerial::integer(), HPChangeReason::integer(),
    HpSteal::integer(), SpecialOptions::integer()) -> #m_hit_damage_result{}.
hit_damage(
    #m_object_rw{uid = Uid, battle_props = AttackBps} = Attack,
    #m_object_rw{uid = TargetUid, battle_props = DefenseBps} = Defense,
    DamageValue, Misc1, SkillSerial, HPChangeReason, HpSteal, SpecialOptions) ->
    case can(Uid, TargetUid) of
        true ->
            Result = #m_hit_damage_result{deltaHp = DeltaHp}
                = hit_damage(Attack, Defense, DamageValue, SpecialOptions),

            HpMsg = #pk_GS2U_HPChange{
                uid = TargetUid,
                src_uid = Uid,
                cause = HPChangeReason,
                misc1 = Misc1,
                serial = SkillSerial
            },
            broadcast_hp_change(Result, HpMsg),

            %% 吸血根据实际伤害来计算最终数据
            Attack2 = object_rw:get(Uid),
            treat(Attack2, Attack2, erlang:abs(DeltaHp) * HpSteal,
                Misc1, SkillSerial, HPChangeReason, 0, true),
            Result;
        _ ->
            ?DEFAULT_DAMAGE_RESULT(AttackBps, DefenseBps, mod_combat_revive:is_dead(DefenseBps))
    end.

broadcast_hp_change(
    #m_hit_damage_result{isHit = IsHit, isCri = IsCri, deltaHp = DeltaHp, isDead = IsDead},
    #pk_GS2U_HPChange{uid = TargetUid, src_uid = Uid, misc1 = Misc1} = HpMsg) ->
    %% 血量变化
    Result =
        case IsHit of
            false -> ?ESR_DODGE;
            _ when IsCri =:= true -> ?ESR_CRITICAL;
            _ -> ?ESR_NORMAL
        end,

    %% 通知客户端血量变化
    Hp = mod_combat_prop:hp_percent(TargetUid),
    Msg = HpMsg#pk_GS2U_HPChange{
        hp_change = DeltaHp,
        hp_percent = Hp,
        result = Result
    },
    ?DEBUG("hp_change ~p -> ~p DeltaHp:~p Misc1:~p, Hp:~p", [Uid, TargetUid, DeltaHp, Misc1, Hp]),
    mod_view:send_net_msg_to_visual(TargetUid, Msg),

    %% 是否死亡
    case IsDead of
        true ->
            mod_combat_revive:dead(Uid, TargetUid);
        _ -> skip
    end,
    ok.

-spec hit_damage(#m_object_rw{}, #m_object_rw{}, DamageValue::float(),
    SpecialOptions::integer()) -> #m_hit_damage_result{}.
hit_damage(
    #m_object_rw{uid = Uid, battle_props = AttackBps},
    #m_object_rw{uid = TargetUid, battle_props = DefenseBps}, DamageValue, SpecialOptions) ->
    case can(Uid, TargetUid) of
        true ->
            Ret = #m_hit_damage_result{
                attackBps = AttackBpsRet,
                defenseBps = DefenseBpsRet
            } = prop_interface:calcHitAndDamage(AttackBps, DefenseBps, DamageValue, SpecialOptions),
            Ahp = fresh_prop(Uid, AttackBpsRet),
            Dhp = fresh_prop(TargetUid, DefenseBpsRet),

            ?DEBUG("hitAndDamage:~p(~p) -> ~p(~p)", [Uid, Ahp, TargetUid, Dhp]),
            Ret;
        _ ->
            ?DEFAULT_DAMAGE_RESULT(AttackBps, DefenseBps, mod_combat_revive:is_dead(DefenseBps))
    end.

-spec treat(#m_object_rw{}, #m_object_rw{}, TreatValue::float(),
    SpecialOptions::integer(), IsSuckBloodFlag::boolean()) -> #m_hit_damage_result{}.
treat(
    #m_object_rw{uid = Uid, battle_props = AttackBps},
    #m_object_rw{uid = TargetUid, battle_props = DefenseBps}, TreatValue, SpecialOptions, IsSuckBloodFlag) ->
    case can(Uid, TargetUid) of
        true ->
            Ret = #m_hit_damage_result{
                defenseBps = DefenseBpsRet
            } = prop_interface:calcTreat(AttackBps, DefenseBps, TreatValue, SpecialOptions, IsSuckBloodFlag),
            Dhp = fresh_prop(TargetUid, DefenseBpsRet),

            ?DEBUG("treat:~p target:~p(~p)", [Uid, TargetUid, Dhp]),
            Ret;
        _ ->
            ?DEFAULT_DAMAGE_RESULT(AttackBps, DefenseBps, mod_combat_revive:is_dead(DefenseBps))
    end.

can(Uid, Uid) ->
    not mod_combat_revive:is_dead(Uid);
can(Uid, Target) ->
    (not mod_combat_revive:is_dead(Uid)) andalso (not mod_combat_revive:is_dead(Target)).

fresh_prop(Uid, #m_battleProps{} = Bp) ->
    object_rw:set_battle_props(Uid, Bp),
    Hp = prop_interface:query_v_pf_bpu(?BP_2_HP_CUR, Bp),
    object_rw:set_hp(Uid, erlang:trunc(Hp)),

    MaxHp = prop_interface:query_v_pf_bpu(?BP_2_HP_MAX, Bp),
    object_rw:set_max_hp(Uid, erlang:trunc(MaxHp)),
    Hp.

hp_percent(Uid) ->
    Bp = object_rw:get_battle_props(Uid),
    Hp = prop_interface:query_v_pf_bpu(?BP_2_HP_CUR, Bp),
    MaxHp = prop_interface:query_v_pf_bpu(?BP_2_HP_MAX, Bp),
    player_interface:get_hp_percent(Hp, MaxHp).