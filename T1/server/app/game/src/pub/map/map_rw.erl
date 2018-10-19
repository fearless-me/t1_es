%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 19. 五月 2018 17:09
%%%-------------------------------------------------------------------
-module(map_rw).
-author("mawenhong").
-include("logger.hrl").
-include("map_core.hrl").
-include("gs_cache.hrl").
-include("rec_rw.hrl").
-include("movement.hrl").

%%
-export([
    init/1, status/0, check_tick/1,
    %%
    add_obj_to_map/1, del_obj_to_map/1,
    %%
    get_unit/1,
    get_player/1, get_player_size/0,
    get_monster/1, get_monster_size/0,
    get_npc/1, get_npc_size/0,
    get_pet/1, get_pet_size/0,
    %%
    get_detail_ets/0, 
    get_obj_maps/1,
    get_player_map/0, get_monster_map/0, get_npc_map/0, get_pet_map/0,
    set_player_map/1, set_monster_map/1, set_npc_map/1, set_pet_map/1,
    %%
    get_map_id/0, get_line_id/0, get_map_hook/0,
    update_move_timer/1,
    get_move_timer_delta/0,
    get_move_timer_now/0,
    get_move_timer_pass_time/1
]).


%% define
-define(MAP_MON_MAPS, monster_maps).
-define(MAP_PLAYER_MAPS, player_maps).
-define(MAP_NPC_MAPS, pet_maps).
-define(MAP_PET_MAPS, pet_maps).
-define(MAP_OBJ_ETS, map_obj_ets).
-define(MAP_ID, map_id__).
-define(LINE_ID, line_id__).
-define(MAP_HOOK, map_hook__).
-define(MOVE_TIMER, map_move_timer__).
-define(MAP_TICK_INFO, map_tick_info__).
-record(tick_info,{runs = 0, timeout = 0, max = 0, min = 0}).

%%%-------------------------------------------------------------------
init(State) ->
    init_base(State),
    set_player_map(#{}),
    set_monster_map(#{}),
    set_pet_map(#{}),
    set_npc_map(#{}),
    set_detail_ets(State#m_map_state.ets),
    set_tick_info(#tick_info{}),
    ok.

init_base(State) ->
    Now = misc_time:milli_seconds(),
    erlang:put(?MAP_ID, State#m_map_state.map_id),
    erlang:put(?LINE_ID, State#m_map_state.line_id),
    erlang:put(?MAP_HOOK, State#m_map_state.hook_mod),
    erlang:put(?MOVE_TIMER, #m_move_timer{now = Now, latest_up = Now, delta = 0}),
    ok.


set_detail_ets(Ets) -> erlang:put(?MAP_OBJ_ETS, Ets).
get_detail_ets( ) -> erlang:get(?MAP_OBJ_ETS).

get_obj_maps(Uid) ->
    Type = object_rw:get_field(Uid, #m_object_rw.type),
    case Type of
        ?OBJ_PLAYER -> get_player_map();
        ?OBJ_MON -> get_monster_map();
        ?OBJ_PET -> get_pet_map();
        ?OBJ_NPC -> get_npc_map();
        _ -> undefined
    end.

get_player_map() -> get(?MAP_PLAYER_MAPS).
set_player_map(Maps) -> erlang:put(?MAP_PLAYER_MAPS, Maps).

get_monster_map() -> get(?MAP_MON_MAPS).
set_monster_map(Maps) -> erlang:put(?MAP_MON_MAPS, Maps).

get_pet_map() -> get(?MAP_PET_MAPS).
set_pet_map(Maps) -> erlang:put(?MAP_PET_MAPS, Maps).

get_npc_map() -> get(?MAP_NPC_MAPS).
set_npc_map(Maps) -> erlang:put(?MAP_NPC_MAPS, Maps).

%%-------------------------------------------------------------------
set_tick_info(Info) -> erlang:put(?MAP_TICK_INFO, Info).
get_tick_info() -> erlang:get(?MAP_TICK_INFO).

%%-------------------------------------------------------------------
check_tick(Milliseconds) ->
    Info = do_check_tick(get_tick_info(), Milliseconds),
    set_tick_info(Info).

%%-------------------------------------------------------------------
do_check_tick(undefined, Milliseconds) ->
    #tick_info{runs = 1, timeout = 0, max = Milliseconds, min = Milliseconds};
do_check_tick(#tick_info{runs = C, timeout = TC, min = Min, max = Max} = Info, Milliseconds) when Milliseconds > ?MAP_TICK ->
    Info#tick_info{
        runs = C + 1,
        timeout = TC + 1,
        max = erlang:max(Max, Milliseconds),
        min = erlang:min(Min, Milliseconds)
    };
do_check_tick(#tick_info{runs = C, min = Min, max = Max} = Info, Milliseconds) ->
    Info#tick_info{
        runs = C + 1,
        max = erlang:max(Max, Milliseconds),
        min = erlang:min(Min, Milliseconds)
    };
do_check_tick(_Any, Milliseconds) when Milliseconds > ?MAP_TICK ->
    #tick_info{runs = 1, timeout = 1, max = Milliseconds, min = Milliseconds};
do_check_tick(_Any, Milliseconds) ->
    #tick_info{runs = 1, timeout = 0, max = Milliseconds, min = Milliseconds}.

%%-------------------------------------------------------------------
get_map_id() -> erlang:get(?MAP_ID).
get_line_id() -> erlang:get(?LINE_ID).
get_map_hook() -> erlang:get(?MAP_HOOK).

%%-------------------------------------------------------------------
get_unit(Uid) ->
    Type = object_rw:get_field(Uid, #m_object_rw.type),
    case Type of
        ?OBJ_PLAYER -> get_player(Uid);
        ?OBJ_MON -> get_monster(Uid);
        ?OBJ_PET -> get_pet(Uid);
        ?OBJ_NPC -> get_npc(Uid);
        _ -> undefined
    end.
%%-------------------------------------------------------------------
get_player(Uid) ->
    case misc_ets:read(?ETS_CACHE_MAP_PLAYER, Uid) of
        [#m_cache_map_object{} = Obj | _] -> Obj;
        _ -> undefined
    end.

get_player_size() ->
    maps:size(map_rw:get_player_map()).

%%-------------------------------------------------------------------
get_monster(Uid) ->
    case misc_ets:read(?ETS_CACHE_MAP_MONSTER, Uid) of
        [#m_cache_map_object{} = Obj | _] -> Obj;
        _ -> undefined
    end.

get_monster_size() ->
    maps:size(map_rw:get_monster_map()).

%%-------------------------------------------------------------------
get_npc(Uid) ->
    case misc_ets:read(?ETS_CACHE_MAP_NPC, Uid) of
        [#m_cache_map_object{} = Obj | _] -> Obj;
        _ -> undefined
    end.

get_npc_size() ->
    maps:size(map_rw:get_npc_map()).

%%-------------------------------------------------------------------
get_pet(Uid) ->
    case misc_ets:read(?ETS_CACHE_MAP_PET, Uid) of
        [#m_cache_map_object{} = Obj | _] -> Obj;
        _ -> undefined
    end.

get_pet_size() ->
    maps:size(map_rw:get_pet_map()).

%%-------------------------------------------------------------------
add_obj_to_map(#m_cache_map_object{type = ?OBJ_MON, uid = Uid} = Obj) ->
    misc_ets:write(?ETS_CACHE_MAP_MONSTER, Obj),
    map_rw:set_monster_map(maps:put(Uid, Uid, map_rw:get_monster_map())),
    ok;
add_obj_to_map(#m_cache_map_object{type = ?OBJ_PLAYER, uid = Uid} = Obj) ->
    misc_ets:write(?ETS_CACHE_MAP_PLAYER, Obj),
    map_rw:set_player_map(maps:put(Uid, Uid, map_rw:get_player_map())),
    ok;
add_obj_to_map(_) ->
    ok.

del_obj_to_map(#m_cache_map_object{uid = Uid, type = ?OBJ_MON}) ->
    misc_ets:delete(?ETS_CACHE_MAP_MONSTER, Uid),
    map_rw:set_monster_map(maps:remove(Uid, map_rw:get_monster_map())),
    ok;
del_obj_to_map(#m_cache_map_object{uid = Uid, type = ?OBJ_PLAYER}) ->
    misc_ets:delete(?ETS_CACHE_MAP_PLAYER, Uid),
    map_rw:set_player_map(maps:remove(Uid, map_rw:get_player_map())),
    ok;
del_obj_to_map(_) ->
    ok.
%%-------------------------------------------------------------------
update_move_timer(Now) ->
    #m_move_timer{latest_up = Latest} = erlang:get(?MOVE_TIMER),
    erlang:put(?MOVE_TIMER, #m_move_timer{now = Now, latest_up = Now, delta = Now - Latest}),
    ok.

%%-------------------------------------------------------------------
get_move_timer_now() ->
    #m_move_timer{now = Now} = erlang:get(?MOVE_TIMER),
    Now.

get_move_timer_pass_time(StartTime) ->
    #m_move_timer{now = Now} = erlang:get(?MOVE_TIMER),
    Now - StartTime.

get_move_timer_delta() ->
    #m_move_timer{delta = Delta} = erlang:get(?MOVE_TIMER),
    Delta.

%%-------------------------------------------------------------------
status()->
    [
        {objects, misc_ets:size(get_detail_ets())},
        {player, get_player_size()},
        {pet, get_pet_size()},
        {npc, get_npc_size()},
        {monster, get_monster_size()},
        {respawn, 0},
        {tick, get_tick_info()}
    ].





