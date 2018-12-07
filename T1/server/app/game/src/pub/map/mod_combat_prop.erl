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
    hit_damage/4,

    treat/8,    %% 带吸血标志
    treat/7,
    treat/5
]).

change_combat_prop(Uid, AddList, MultiList) ->
    change_combat_prop(Uid, AddList, MultiList, [], []),
    ok.

change_combat_prop(Uid, AddList, MultiList, AddList_Del, MultiList_Del) ->
    BattlePropsNew_ = #m_battleProps{listBPFinal = ListBPFinal} =
        case object_rw:get_battle_props(Uid) of
            #m_battleProps{} = BattleProps ->
                BattlePropsNew = prop_interface:calc(
                    BattleProps, AddList, MultiList, AddList_Del, MultiList_Del),
                object_rw:set_battle_props(Uid, BattlePropsNew),
                BattlePropsNew;
            _ ->
                %% 没有找到该元素，取默认值进行计算
                ?ERROR("change_combat_prop not found Uid:~w, will use default value", [Uid]),
                BattleProps = #m_battleProps{career = 1}, %% fixme prop_interface:?Career_1
                BattlePropsNew = prop_interface:calc(
                    BattleProps, AddList, MultiList, AddList_Del, MultiList_Del),
                object_rw:set_battle_props(Uid, BattlePropsNew),
                BattlePropsNew
        end,
    {_, _, Hp} = lists:keyfind(?BP_2_HP_CUR, 1, ListBPFinal),   %% 必定能找到
    {_, _, HpMax} = lists:keyfind(?BP_2_HP_MAX, 1, ListBPFinal),   %% 必定能找到
    object_rw:set_hp(Uid, erlang:trunc(Hp)),
    object_rw:set_max_hp(Uid, erlang:trunc(HpMax)),
    gs_interface:send_net_msg(Uid, prop_interface:battleProps2NetMsg(Uid, BattlePropsNew_)),
    ok.

%% 治疗
-spec treat(#m_object_rw{}, #m_object_rw{}, TreatValue::float(),
    SkillID::integer(), SkillSerial::integer(), HPChangeReason::integer(),
    SpecialOptions::integer()) -> #m_hit_damage_result{}.
treat(#m_object_rw{} = Attack, #m_object_rw{} = Defense,
    TreatValue, Misc1, SkillSerial, HPChangeReason, SpecialOptions) ->
    treat(Attack, Defense, TreatValue, Misc1, SkillSerial, HPChangeReason, SpecialOptions, false).

%% 治疗
-spec treat(#m_object_rw{}, #m_object_rw{}, TreatValue::float(),
    SkillID::integer(), SkillSerial::integer(), HPChangeReason::integer(),
    SpecialOptions::integer(), IsSuckBloodFlag::boolean()) -> #m_hit_damage_result{}.
treat(#m_object_rw{uid = Uid} = Attack, #m_object_rw{uid = TargetUid} = Defense,
    TreatValue, Misc1, SkillSerial, HPChangeReason, SpecialOptions, IsSuckBloodFlag) when TreatValue > 0 ->
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
treat(_Attack, _Defense, _TreatValue, _Misc1, _SkillSerial, _HPChangeReason, _SpecialOptions, _IsSuckBloodFlag) ->
    ok.

%% 伤害打击
-spec hit_damage(#m_object_rw{}, #m_object_rw{}, DamageValue::float(),
    SkillID::integer(), SkillSerial::integer(), HPChangeReason::integer(),
    HpSteal::integer(), SpecialOptions::integer()) -> #m_hit_damage_result{}.
hit_damage(
    #m_object_rw{uid = Uid} = Attack,
    #m_object_rw{uid = TargetUid} = Defense,
    DamageValue, Misc1, SkillSerial, HPChangeReason, HpSteal, SpecialOptions) ->
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
    Attack2 = object_rw:get_uid(Uid),
    treat(Attack2, Attack2, erlang:abs(DeltaHp) * HpSteal,
        Misc1, SkillSerial, HPChangeReason, 0, true).

broadcast_hp_change(
    #m_hit_damage_result{isHit = IsHit, isCri = IsCri, deltaHp = DeltaHp},
    #pk_GS2U_HPChange{uid = TargetUid, src_uid = Uid, misc1 = Misc1} = HpMsg) ->
    %% 血量变化
    Result =
        case IsHit of
            false -> ?ESR_DODGE;
            _ when IsCri =:= true -> ?ESR_CRITICAL;
            _ -> ?ESR_NORMAL
        end,

    %% 通知客户端血量变化
    Msg = HpMsg#pk_GS2U_HPChange{
        hp_change = DeltaHp,
        result = Result
    },
    ?DEBUG("hp_change ~p -> ~p DeltaHp:~p Misc1:~p", [Uid, TargetUid, DeltaHp, Misc1]),
    mod_view:send_net_msg_to_visual(TargetUid, Msg),
    ok.

-spec hit_damage(#m_object_rw{}, #m_object_rw{}, DamageValue::float(),
    SpecialOptions::integer()) -> #m_hit_damage_result{}.
hit_damage(
    #m_object_rw{uid = Uid, battle_props = AttackBps},
    #m_object_rw{uid = TargetUid, battle_props = DefenseBps}, DamageValue, SpecialOptions) ->
    Ret = #m_hit_damage_result{
        attackBps = AttackBpsRet,
        defenseBps = DefenseBpsRet
    } = prop_interface:calcHitAndDamage(AttackBps, DefenseBps, DamageValue, SpecialOptions),
    Ahp = fresh_prop(Uid, AttackBpsRet),
    Dhp = fresh_prop(TargetUid, DefenseBpsRet),
    ?DEBUG("hitAndDamage:~p(~p) -> ~p(~p)", [Uid, Ahp, TargetUid, Dhp]),
    Ret.

-spec treat(#m_object_rw{}, #m_object_rw{}, TreatValue::float(),
    SpecialOptions::integer(), IsSuckBloodFlag::boolean()) -> #m_hit_damage_result{}.
treat(
    #m_object_rw{uid = Uid, battle_props = AttackBps},
    #m_object_rw{uid = TargetUid, battle_props = DefenseBps}, TreatValue, SpecialOptions, IsSuckBloodFlag) ->
    Ret = #m_hit_damage_result{
        defenseBps = DefenseBpsRet
    } = prop_interface:calcTreat(AttackBps, DefenseBps, TreatValue, SpecialOptions, IsSuckBloodFlag),
    Dhp = fresh_prop(TargetUid, DefenseBpsRet),

    ?DEBUG("treat:~p target:~p(~p)", [Uid, TargetUid, Dhp]),
    Ret.

fresh_prop(Uid, #m_battleProps{} = Bp) ->
    object_rw:set_battle_props(Uid, Bp),
    Hp = prop_interface:query_v_pf_bpu(?BP_2_HP_CUR, Bp),
    object_rw:set_hp(Uid, erlang:trunc(Hp)),

    MaxHp = prop_interface:query_v_pf_bpu(?BP_2_HP_MAX, Bp),
    object_rw:set_max_hp(Uid, erlang:trunc(MaxHp)),
    Hp.