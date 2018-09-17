%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 14. 九月 2018 17:36
%%%-------------------------------------------------------------------
-module(player_attr).
-author("mawenhong").

-include("logger.hrl").
-include("combat.hrl").
-include("gs_cache.hrl").
-include("gs_common_rec.hrl").

-export([change_attr/2, change_attr/4]).
-export([get_hp/0, set_hp/1, get_val/1, set_val/2]).

%% API
%%-------------------------------------------------------------------
change_attr(AddList, MultiList) ->
    change_attr(AddList, MultiList, [], []),
    ok.

change_attr(AddList, MultiList, AddList_Del, MultiList_Del) ->
    attr_mod:calc([], AddList, MultiList, AddList_Del, MultiList_Del),
    ok.

get_hp() ->
    Uid = player_rw:get_uid(),
    ets_cache:read_element(
        ?ETS_CACHE_ONLINE_PLAYER, Uid, #m_cache_online_player.hp).

set_hp(Hp) ->
    Uid = player_rw:get_uid(),
    gs_cache:read_element(
        ?ETS_CACHE_ONLINE_PLAYER, Uid, {#m_cache_online_player.hp, Hp}),
    ok.

get_val(?ATTR_MAX_HP) ->
    attr_rw:get_max_hp(0).

set_val(?ATTR_MAX_HP, MaxHp) ->
    attr_rw:set_max_hp(0, MaxHp).

