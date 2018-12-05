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

%% API
-export([
    change_combat_prop/3,
    change_combat_prop/5,

    hitAndDamage/6,
    hitAndDamage/3
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

%% 伤害打击
-spec hitAndDamage(#m_object_rw{}, #m_object_rw{}, DamageValue::float(),
    SkillID::integer(), SkillSerial::integer(), HPChangeReason::integer()) -> #m_hit_damage_result{}.
hitAndDamage(
    #m_object_rw{uid = Uid} = Attack,
    #m_object_rw{uid = TargetUid} = Defense,
    DamageValue, SkillID, SkillSerial, HPChangeReason) ->
    #m_hit_damage_result{
        isHit = IsHit,
        isCri = IsCri,
        deltaHp = DeltaHp
    } = hitAndDamage(Attack, Defense, DamageValue),

    %% 血量变化
    Result =
        case IsHit of
            false ->
                ?ESR_DODGE;
            _ when IsCri =:= true ->
                ?ESR_CRITICAL;
            _ ->
                ?ESR_NORMAL
        end,

    %% 通知客户端血量变化
    HpMsg = #pk_GS2U_HPChange{
        uid = TargetUid,
        cause = HPChangeReason,
        result = Result,
        hp_change = DeltaHp,
        misc1 = SkillID,
        src_uid = Uid,
        serial = SkillSerial
    },
    ?DEBUG("hitAndDamage ~p -> ~p DeltaHp:~p SkillID:~p", [Uid, TargetUid, DeltaHp, SkillID]),
    mod_view:send_net_msg_to_visual(TargetUid, HpMsg),
    ok.

-spec hitAndDamage(#m_object_rw{}, #m_object_rw{}, DamageValue::float()) -> #m_hit_damage_result{}.
hitAndDamage(
    #m_object_rw{uid = Uid, battle_props = AttackBps},
    #m_object_rw{uid = TargetUid, battle_props = DefenseBps}, DamageValue) ->
    Ret = #m_hit_damage_result{
        attackBps = AttackBpsRet,
        defenseBps = DefenseBpsRet
    } = prop_interface:calcHitAndDamage(AttackBps, DefenseBps, DamageValue),
    Ahp = fresh_prop(Uid, AttackBpsRet),
    Dhp = fresh_prop(TargetUid, DefenseBpsRet),

    %% TODO 计算吸血
    ?DEBUG("hitAndDamage:~p(~p) -> ~p(~p)", [Uid, Ahp, TargetUid, Dhp]),
    Ret.

fresh_prop(Uid, #m_battleProps{} = Bp) ->
    object_rw:set_battle_props(Uid, Bp),
    Hp = prop_interface:query_v_pf_bpu(?BP_2_HP_CUR, Bp),
    object_rw:set_hp(Uid, erlang:trunc(Hp)),

    MaxHp = prop_interface:query_v_pf_bpu(?BP_2_HP_MAX, Bp),
    object_rw:set_max_hp(Uid, erlang:trunc(MaxHp)),
    Hp.