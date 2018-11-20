%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 20. 九月 2018 10:49
%%%-------------------------------------------------------------------
-module(mod_combat_prop).
-author("mawenhong").

-include("gs_cache.hrl").
-include("combat.hrl").
-include("logger.hrl").

%% API
-export([change_combat_prop/3, change_combat_prop/5]).


change_combat_prop(Uid, AddList, MultiList) ->
    change_combat_prop(Uid, AddList, MultiList, [], []),
    ok.

change_combat_prop(Uid, AddList, MultiList, AddList_Del, MultiList_Del) ->
    BattlePropsNew_ = #m_battleProps{listBPFinal = ListBPFinal} =
        case object_rw:get_battle_props(Uid) of
            #m_battleProps{} = BattleProps ->
                BattlePropsNew = combat_prop_calc:calc(
                    BattleProps, AddList, MultiList, AddList_Del, MultiList_Del),
                object_rw:set_battle_props(Uid, BattlePropsNew),
                BattlePropsNew;
            _ ->
                %% 没有找到该元素，取默认值进行计算
                ?ERROR("change_combat_prop not found Uid:~w, will use default value", [Uid]),
                BattleProps = #m_battleProps{career = 1}, %% fixme combat_prop_calc:?Career_1
                BattlePropsNew = combat_prop_calc:calc(
                    BattleProps, AddList, MultiList, AddList_Del, MultiList_Del),
                object_rw:set_battle_props(Uid, BattlePropsNew),
                BattlePropsNew
        end,
    {_, _, Hp} = lists:keyfind(?BP_2_HP_CUR, 1, ListBPFinal),   %% 必定能找到
    {_, _, HpMax} = lists:keyfind(?BP_2_HP_MAX, 1, ListBPFinal),   %% 必定能找到
    object_rw:set_hp(Uid, erlang:trunc(Hp)),
    object_rw:set_max_hp(Uid, erlang:trunc(HpMax)),
    gs_interface:send_net_msg(Uid, combat_prop_calc:battleProps2NetMsg(Uid, BattlePropsNew_)),
    ok.