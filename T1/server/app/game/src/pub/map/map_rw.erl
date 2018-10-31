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
    map_id/0, line_id/0, hook_mod/0,
    %%
    add_obj_to_map/1, del_obj_to_map/1,
    %%
    find_unit/1, find_unit/2,
    %%
    detail_ets/0,
    obj_maps_with_uid/1, obj_maps_with_type/1,

    obj_maps_with_uid/2, obj_maps_with_type/2,

    obj_size_with_uid/1, obj_size_with_type/1,

    add_uid_to_maps/2, del_uid_from_maps/2,
    %%
    update_move_timer/1,
    get_move_timer_delta/0,
    get_move_timer_now/0,
    get_move_timer_pass_time/1
]).


%% define
-define(MAPS_MON, monster_maps).
-define(MAPS_PLAYER, player_maps).
-define(MAPS_NPC, pet_maps).
-define(MAPS_PET, pet_maps).
-define(ETS_MAP_OBJ, map_obj_ets).
-define(MAP_ID, map_id__).
-define(LINE_ID, line_id__).
-define(MAP_HOOK, map_hook__).
-define(MOVE_TIMER, map_move_timer__).
-define(MAP_TICK_INFO, map_tick_info__).
-record(tick_info,{runs = 0, timeout = 0, max = 0, min = 0}).

%%-------------------------------------------------------------------
init(State) ->
    init_base(State),
    obj_maps_with_type(?OBJ_PLAYER, #{}),
    obj_maps_with_type(?OBJ_MON, #{}),
    obj_maps_with_type(?OBJ_PET, #{}),
    obj_maps_with_type(?OBJ_NPC, #{}),
    detail_ets(State#m_map_state.ets),
    set_tick_info(#tick_info{}),
    ok.

init_base(State) ->
    Now = misc_time:milli_seconds(),
    erlang:put(?MAP_ID, State#m_map_state.map_id),
    erlang:put(?LINE_ID, State#m_map_state.line_id),
    erlang:put(?MAP_HOOK, State#m_map_state.hook_mod),
    erlang:put(?MOVE_TIMER, #m_move_timer{now = Now, latest_up = Now, delta = 0}),
    ok.

%%-------------------------------------------------------------------
map_id() -> erlang:get(?MAP_ID).
line_id() -> erlang:get(?LINE_ID).
hook_mod() -> erlang:get(?MAP_HOOK).

%%-------------------------------------------------------------------
detail_ets(Ets) -> erlang:put(?ETS_MAP_OBJ, Ets).
detail_ets( ) -> erlang:get(?ETS_MAP_OBJ).

%%-------------------------------------------------------------------
find_unit(Uid) ->
    Type = object_rw:get_type(Uid),
    map_rw:find_unit(Type, Uid).

find_unit(?OBJ_PLAYER, Uid) ->
    case misc_ets:read(?ETS_CACHE_MAP_PLAYER, Uid) of
        [#m_cache_map_object{} = Obj | _] -> Obj;
        _ -> undefined
    end;
find_unit(?OBJ_MON, Uid) ->
    case misc_ets:read(?ETS_CACHE_MAP_MONSTER, Uid) of
        [#m_cache_map_object{} = Obj | _] -> Obj;
        _ -> undefined
    end;
find_unit(?OBJ_PET, Uid) ->
    case misc_ets:read(?ETS_CACHE_MAP_PET, Uid) of
        [#m_cache_map_object{} = Obj | _] -> Obj;
        _ -> undefined
    end;
find_unit(?OBJ_NPC, Uid) ->
    case misc_ets:read(?ETS_CACHE_MAP_NPC, Uid) of
        [#m_cache_map_object{} = Obj | _] -> Obj;
        _ -> undefined
    end;
find_unit(_Type, _Uid) -> undefined.

%%-------------------------------------------------------------------
obj_maps_with_uid(Uid) ->
    Type = object_rw:get_type(Uid),
    obj_maps_with_type(Type).

%%-------------------------------------------------------------------
obj_maps_with_type(?OBJ_PLAYER) -> erlang:get(?MAPS_PLAYER);
obj_maps_with_type(?OBJ_MON) -> erlang:get(?MAPS_MON);
obj_maps_with_type(?OBJ_PET) -> erlang:get(?MAPS_PET);
obj_maps_with_type(?OBJ_NPC) -> erlang:get(?MAPS_NPC).

%%-------------------------------------------------------------------
obj_maps_with_uid(Uid, Maps) ->
    Type = object_rw:get_type(Uid),
    obj_maps_with_type(Type, Maps).


obj_maps_with_type(?OBJ_PLAYER, Maps) ->
    erlang:put(?MAPS_PLAYER, Maps);
obj_maps_with_type(?OBJ_MON, Maps) ->
    erlang:put(?MAPS_MON, Maps);
obj_maps_with_type(?OBJ_PET, Maps) ->
    erlang:put(?MAPS_PET, Maps);
obj_maps_with_type(?OBJ_NPC, Maps) ->
    erlang:put(?MAPS_NPC, Maps).

%%-------------------------------------------------------------------
obj_size_with_uid(Uid) ->
    Type = object_rw:get_type(Uid),
    obj_size_with_type(Type).

obj_size_with_type(?OBJ_PLAYER) ->
    maps:size(map_rw:obj_maps_with_type(?OBJ_PLAYER));
obj_size_with_type(?OBJ_MON) ->
    maps:size(map_rw:obj_maps_with_type(?OBJ_MON));
obj_size_with_type(?OBJ_PET) ->
    maps:size(map_rw:obj_maps_with_type(?OBJ_PET));
obj_size_with_type(?OBJ_NPC) ->
    maps:size(map_rw:obj_maps_with_type(?OBJ_NPC)).

%%-------------------------------------------------------------------
add_uid_to_maps(Type, Uid) ->
    i_add_uid_from_maps(obj_maps_with_type(Type), Type, Uid),
    ok.

i_add_uid_from_maps(undefined, Type, _Uid) ->
    erlang:error(Type);
i_add_uid_from_maps(Maps, Type, Uid) ->
    map_rw:obj_maps_with_type(Type, maps:put(Uid, Uid, Maps)),
    ok.


%%-------------------------------------------------------------------
del_uid_from_maps(Type, Uid) ->
    i_del_uid_from_maps(obj_maps_with_type(Type), Type, Uid),
    ok.
i_del_uid_from_maps(undefined, Type, _Uid) ->
    erlang:error(Type);
i_del_uid_from_maps(Maps, Type, Uid) ->
    map_rw:obj_maps_with_type(Type, maps:remove(Uid, Maps)),
    ok.

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
add_obj_to_map(#m_cache_map_object{type = ?OBJ_MON, uid = Uid} = Obj) ->
    misc_ets:write(?ETS_CACHE_MAP_MONSTER, Obj),
    map_rw:add_uid_to_maps(?OBJ_MON, Uid),
    ok;
add_obj_to_map(#m_cache_map_object{type = ?OBJ_PLAYER, uid = Uid} = Obj) ->
    misc_ets:write(?ETS_CACHE_MAP_PLAYER, Obj),
    map_rw:add_uid_to_maps(?OBJ_PLAYER, Uid),
    ok;
add_obj_to_map(_) ->
    ok.

del_obj_to_map(#m_cache_map_object{uid = Uid, type = ?OBJ_MON}) ->
    misc_ets:delete(?ETS_CACHE_MAP_MONSTER, Uid),
    map_rw:del_uid_from_maps(?OBJ_MON, Uid),
    ok;
del_obj_to_map(#m_cache_map_object{uid = Uid, type = ?OBJ_PLAYER}) ->
    misc_ets:delete(?ETS_CACHE_MAP_PLAYER, Uid),
    map_rw:del_uid_from_maps(?OBJ_PLAYER, Uid),
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
        {objects,   misc_ets:size(detail_ets())},
        {player,    obj_size_with_type(?OBJ_PLAYER)},
        {pet,       obj_size_with_type(?OBJ_PET)},
        {npc,       obj_size_with_type(?OBJ_NPC)},
        {monster,   obj_size_with_type(?OBJ_MON)},
        {respawn,   0},
        {tick,      get_tick_info()}
    ].





