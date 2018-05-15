%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 10. 五月 2018 19:57
%%%-------------------------------------------------------------------
-module(lib_map).
-author("mawenhong").

-include("logger.hrl").
-include("map.hrl").
-include("obj.hrl").

%% API
-export([init/1]).
-export([tick/1]).
-export([player_will_join/2]).
-export([player_exit/2, player_join/2]).

-define(MAP_MON_ETS, map_monster_ets__).
-define(MAP_USR_ETS, map_player_ets__).
-define(MAP_NPC_ETS, map_npc_ets__).
-define(MAP_PET_ETS, map_pet_ets__).
-define(MAP_TICK, 50).

%%%-------------------------------------------------------------------
init(State) ->
    State1 = init_1(State),
    Conf = mod_map_creator:map_conf(State#map_state.map_id),
    ok = lib_map_view:init_vis_tile(1024, 1024, 64),
    ok = init_npc(Conf),
    ok = init_monster(Conf),
    tick_msg(),
    State1.

%%%-------------------------------------------------------------------
init_1(State)->
    State#map_state{
        npc     = ets:new(?MAP_NPC_ETS, [protect, {keypos, #obj.code}, {read_concurrency, true}]),
        pet     = ets:new(?MAP_PET_ETS, [protect, {keypos, #obj.code}, {read_concurrency, true}]),
        player  = ets:new(?MAP_USR_ETS, [protect, {keypos, #obj.code}, {read_concurrency, true}]),
        monster = ets:new(?MAP_MON_ETS, [protect, {keypos, #obj.code}, {read_concurrency, true}])
    }.
%%%-------------------------------------------------------------------
init_npc(Conf) -> ok.

init_monster(Conf) -> ok.

%%%-------------------------------------------------------------------
player_will_join(State, Params) ->
    {ok, State}.

%%%-------------------------------------------------------------------
player_exit(State, Params) ->
    {ok, State}.

%%%-------------------------------------------------------------------
player_join(State, Params) ->
    {ok, State}.

%%%-------------------------------------------------------------------
tick_msg() -> erlang:send_after(?MAP_TICK, self(), tick_now).

tick(State) ->
    tick_msg(),
    State.