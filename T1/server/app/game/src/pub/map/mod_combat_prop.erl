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

%% API
-export([change_combat_prop/3, change_combat_prop/5]).


change_combat_prop(Uid, AddList, MultiList) ->
    change_combat_prop(Uid, AddList, MultiList, [], []),
    ok.

change_combat_prop(Uid, AddList, MultiList, AddList_Del, MultiList_Del) ->
    case gs_cache_interface:get_online_player(Uid) of
        #m_cache_online_player{battle_props = #m_battleProps{} = BattleProps} ->
            BattlePropsNew = combat_prop_calc:calc(
                BattleProps, AddList, MultiList, AddList_Del, MultiList_Del),
            gs_cache_interface:update_online_player(
                Uid, {#m_cache_online_player.battle_props, BattlePropsNew});
        #m_cache_online_player{battle_props = undefined, career = Career} ->
            BattleProps = #m_battleProps{career = 1}, %% fixme combat_prop_calc:?Career_1
            BattlePropsNew = combat_prop_calc:calc(
                BattleProps, AddList, MultiList, AddList_Del, MultiList_Del),
            gs_cache_interface:update_online_player(
                Uid, {#m_cache_online_player.battle_props, BattlePropsNew});
        _ ->
            skip
    end,
    ok.