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
-include("common.hrl").

%% API
-export([init/1]).
-export([tick/1]).
-export([get_npc_ets/0, get_monster_ets/0]).
-export([get_pet_ets/0, get_player_ets/0]).
-export([get_map_id/0, get_map_hook/0]).
-export([player_exit/2, player_join/2]).

-define(MAP_MON_ETS, map_monster_ets__).
-define(MAP_USR_ETS, map_player_ets__).
-define(MAP_NPC_ETS, map_npc_ets__).
-define(MAP_PET_ETS, map_pet_ets__).
-define(MAP_ID, map_id__).
-define(MAP_HOOK, map_hook__).
-define(MAP_TICK, 50).

%%%-------------------------------------------------------------------
init(S) ->
    Conf = mod_map_creator:map_conf(S#map_state.map_id),
    S1 = init_1(S),
    ok = init_2(S1),
    ok = lib_map_view:init_vis_tile(1024, 1024, 64),
    ok = init_npc(Conf),
    ok = init_monster(Conf),
    tick_msg(),
    S1.

%%%-------------------------------------------------------------------
init_1(State) ->
    State#map_state{
        npc     = ets:new(?MAP_NPC_ETS, [protected, {keypos, #obj.code}, ?ETSRC]),
        pet     = ets:new(?MAP_PET_ETS, [protected, {keypos, #obj.code}, ?ETSRC]),
        player  = ets:new(?MAP_USR_ETS, [protected, {keypos, #obj.code}, ?ETSRC]),
        monster = ets:new(?MAP_MON_ETS, [protected, {keypos, #obj.code}, ?ETSRC])
    }.

init_2(State) ->
    put(?MAP_NPC_ETS, State#map_state.npc),
    put(?MAP_PET_ETS, State#map_state.pet),
    put(?MAP_USR_ETS, State#map_state.player),
    put(?MAP_MON_ETS, State#map_state.monster),
    put(?MAP_ID, State#map_state.map_id),
    put(?MAP_HOOK, State#map_state.hook_mod),
    ok.
%%%-------------------------------------------------------------------
get_map_id() -> get(?MAP_ID).
get_map_hook() -> get(?MAP_HOOK).
get_npc_ets() -> get(?MAP_NPC_ETS).
get_pet_ets() -> get(?MAP_PET_ETS).
get_player_ets() -> get(?MAP_USR_ETS).
get_monster_ets() -> get(?MAP_MON_ETS).

%%%-------------------------------------------------------------------
init_npc(Conf) -> ok.

init_monster(Conf) -> ok.

%%%-------------------------------------------------------------------


%%%-------------------------------------------------------------------
player_exit(S, PlayerCode) ->
    Obj = get_player(PlayerCode),
    player_exit_1(Obj),
    {ok, S}.

player_exit_1(Obj) ->
    ets:delete(get_player_ets(), Obj#obj.code),
    lib_map_view:sync_player_exit_map(Obj),
    ok.

%%%-------------------------------------------------------------------
player_join(S, Obj) ->
    ets:insert(get_player_ets(), Obj),
    lib_map_view:sync_player_join_map(Obj),
    {ok, S}.

%%%-------------------------------------------------------------------
get_player(PlayerCode) ->
    case ets:lookup(get_player_ets(), PlayerCode) of
        [#obj{} = Obj | _] -> Obj;
        _ -> undefined
    end.

%%%-------------------------------------------------------------------
tick_msg() -> erlang:send_after(?MAP_TICK, self(), tick_now).

tick(S) ->
    tick_msg(),
    S.