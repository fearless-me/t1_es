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
-include("pub_def.hrl").
-include("pub_rec.hrl").
-include("map_core.hrl").
-include("gs_cache.hrl").
-include("rec_rw.hrl").
-include("movement.hrl").


%%
-export([
    map_cfg/0,
    init/1, status/0, check_tick/1,

    set_owner/4, get_owner/0, is_all_entered/0,

    %%
    map_id/0, line_id/0, hook_mod/0,
    %%
    add_object/1, del_object/1,
    
    %%
    detail_ets/0, excl_ets/0,
    obj_exist/1,
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
-define(MAPS_NPC, npc_maps).
-define(MAPS_PET, pet_maps).
-define(ETS_MAP_OBJ, map_obj_detail_ets__).
-define(ETS_MAP_EXCL, map_excl_ets__).
-define(MAP_ID, map_id__).
-define(LINE_ID, line_id__).
-define(MAP_HOOK, map_hook__).
-define(MOVE_TIMER, map_move_timer__).
-define(MAP_TICK_INFO, map_tick_info__).
-define(MAP_OWNER, map_owner).
-record(tick_info,{runs = 0, timeout = 0, all = 0, max = 0, min = 0}).

%%-------------------------------------------------------------------
init(State) ->
    init_base(State),
    obj_maps_with_type(?UID_TYPE_PLAYER, #{}),
    obj_maps_with_type(?UID_TYPE_MON, #{}),
    obj_maps_with_type(?UID_TYPE_PET, #{}),
    obj_maps_with_type(?UID_TYPE_NPC, #{}),
    ok.

init_base(State) ->
    Now = misc_time:milli_seconds(),
    erlang:put(?MAP_ID, State#m_map_state.map_id),
    erlang:put(?LINE_ID, State#m_map_state.line_id),
    erlang:put(?MAP_HOOK, State#m_map_state.hook_mod),
    erlang:put(?MOVE_TIMER, #m_move_timer{now = Now, latest_up = Now, delta = 0}),
    erlang:put(?ETS_MAP_OBJ, State#m_map_state.obj_ets),
    erlang:put(?ETS_MAP_EXCL, State#m_map_state.excl_ets),
    set_tick_info(#tick_info{}),
    ok.
%%-------------------------------------------------------------------
set_owner(Creator, Type, Param, WaitList) ->
    erlang:put(?MAP_OWNER, #m_map_owner{type = Type, creator = Creator, owner_param = Param, wait_list = WaitList}).

get_owner()-> erlang:get(?MAP_OWNER).

is_all_entered() ->
    case map_rw:get_owner() of
        undefined -> true;
        #m_map_owner{wait_list = WaitList, ready_list = ReadyList} ->
            lists:subtract(WaitList, ReadyList) == []
    end.
%%-------------------------------------------------------------------
map_id() -> erlang:get(?MAP_ID).
line_id() -> erlang:get(?LINE_ID).
hook_mod() -> erlang:get(?MAP_HOOK).

%%-------------------------------------------------------------------
detail_ets( ) -> erlang:get(?ETS_MAP_OBJ).
excl_ets() -> erlang:get(?ETS_MAP_EXCL).

%%-------------------------------------------------------------------
obj_exist(Uid) ->
    misc_ets:member(map_rw:detail_ets(), Uid).
%%  object_rw:get(Uid) =/= undefined.

%%-------------------------------------------------------------------
obj_maps_with_uid(Uid) ->
    Type = object_rw:get_type(Uid),
    obj_maps_with_type(Type).

%%-------------------------------------------------------------------
obj_maps_with_type(?UID_TYPE_PLAYER) ->
    misc_ets:read_element(excl_ets(), ?MAPS_PLAYER, #pub_kv.value);
%%erlang:get(?MAPS_PLAYER);
obj_maps_with_type(?UID_TYPE_MON) ->
    misc_ets:read_element(excl_ets(), ?MAPS_MON, #pub_kv.value);
%%erlang:get(?MAPS_MON);
obj_maps_with_type(?UID_TYPE_PET) ->
    misc_ets:read_element(excl_ets(), ?MAPS_PET, #pub_kv.value);
%%erlang:get(?MAPS_PET);
obj_maps_with_type(?UID_TYPE_NPC) ->
    misc_ets:read_element(excl_ets(), ?MAPS_NPC, #pub_kv.value).
%%erlang:get(?MAPS_NPC).

%%-------------------------------------------------------------------
obj_maps_with_uid(Uid, Maps) ->
    Type = object_rw:get_type(Uid),
    obj_maps_with_type(Type, Maps).


obj_maps_with_type(?UID_TYPE_PLAYER, Maps) ->
    misc_ets:write(excl_ets(), #pub_kv{key = ?MAPS_PLAYER, value = Maps});
%%    erlang:put(?MAPS_PLAYER, Maps);
obj_maps_with_type(?UID_TYPE_MON, Maps) ->
    misc_ets:write(excl_ets(), #pub_kv{key = ?MAPS_MON, value = Maps});
%%    erlang:put(?MAPS_MON, Maps);
obj_maps_with_type(?UID_TYPE_PET, Maps) ->
    misc_ets:write(excl_ets(), #pub_kv{key = ?MAPS_PET, value = Maps});
%%    erlang:put(?MAPS_PET, Maps);
obj_maps_with_type(?UID_TYPE_NPC, Maps) ->
    misc_ets:write(excl_ets(), #pub_kv{key = ?MAPS_NPC, value = Maps}).
%%    erlang:put(?MAPS_NPC, Maps).

%%-------------------------------------------------------------------
obj_size_with_uid(Uid) ->
    Type = object_rw:get_type(Uid),
    obj_size_with_type(Type).

obj_size_with_type(?UID_TYPE_PLAYER) ->
    maps:size(map_rw:obj_maps_with_type(?UID_TYPE_PLAYER));
obj_size_with_type(?UID_TYPE_MON) ->
    maps:size(map_rw:obj_maps_with_type(?UID_TYPE_MON));
obj_size_with_type(?UID_TYPE_PET) ->
    maps:size(map_rw:obj_maps_with_type(?UID_TYPE_PET));
obj_size_with_type(?UID_TYPE_NPC) ->
    maps:size(map_rw:obj_maps_with_type(?UID_TYPE_NPC)).

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
do_check_tick(#tick_info{runs = C, timeout = TC, all = All, min = Min, max = Max} = Info, Milliseconds) when Milliseconds > ?MAP_TICK ->
    Info#tick_info{
        runs = C + 1,
        timeout = TC + 1,
        all = All + Milliseconds,
        max = erlang:max(Max, Milliseconds),
        min = erlang:min(Min, Milliseconds)
    };
do_check_tick(#tick_info{runs = C, all = All, min = Min, max = Max} = Info, Milliseconds) ->
    Info#tick_info{
        runs = C + 1,
        all = All + Milliseconds,
        max = erlang:max(Max, Milliseconds),
        min = erlang:min(Min, Milliseconds)
    };
do_check_tick(_Any, Milliseconds) when Milliseconds > ?MAP_TICK ->
    #tick_info{runs = 1, timeout = 1, all = Milliseconds, max = Milliseconds, min = Milliseconds};
do_check_tick(_Any, Milliseconds) ->
    #tick_info{runs = 1, timeout = 0, all = Milliseconds, max = Milliseconds, min = Milliseconds}.


%%-------------------------------------------------------------------
add_object(#m_cache_map_object_priv{type = ?UID_TYPE_MON, uid = Uid} = ObjPriv) ->
    misc_ets:write(?ETS_CACHE_MAP_MONSTER_PRIV, ObjPriv),
    map_rw:add_uid_to_maps(?UID_TYPE_MON, Uid),
    ok;
add_object(#m_cache_map_object_priv{type = ?UID_TYPE_PLAYER, uid = Uid} = ObjPriv) ->
    misc_ets:write(?ETS_CACHE_MAP_PLAYER_PRIV, ObjPriv),
    map_rw:add_uid_to_maps(?UID_TYPE_PLAYER, Uid),
    ok;
add_object(#m_cache_map_object_priv{type = ?UID_TYPE_NPC, uid = Uid} = _Obj) ->
%%    misc_ets:write(?ETS_CACHE_MAP_PLAYER_PRIV, ObjPriv),
    map_rw:add_uid_to_maps(?UID_TYPE_NPC, Uid),
    ok;
add_object(_) ->
    ok.

del_object(#m_cache_map_object_priv{uid = Uid, type = ?UID_TYPE_MON}) ->
    misc_ets:delete(?ETS_CACHE_MAP_MONSTER_PRIV, Uid),
    map_rw:del_uid_from_maps(?UID_TYPE_MON, Uid),
    ok;
del_object(#m_cache_map_object_priv{uid = Uid, type = ?UID_TYPE_PLAYER}) ->
    misc_ets:delete(?ETS_CACHE_MAP_PLAYER_PRIV, Uid),
    map_rw:del_uid_from_maps(?UID_TYPE_PLAYER, Uid),
    ok;
del_object(_) ->
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
        {detail_ets, map_rw:detail_ets()},
        {t,   misc_ets:size(detail_ets())},
        {u,   obj_size_with_type(?UID_TYPE_PLAYER)},
        {p,   obj_size_with_type(?UID_TYPE_PET)},
        {n,   obj_size_with_type(?UID_TYPE_NPC)},
        {m,   obj_size_with_type(?UID_TYPE_MON)},
        {r,   0},
        format_tick(),
        gen_serverw:status_self()
    ].

%% -record(tick_info,{runs = 0, timeout = 0, max = 0, min = 0}).
format_tick()->
    case get_tick_info() of
        #tick_info{runs = Runs, timeout = Timeout, all = All, min = Min, max = Max} ->
            {tick, [Runs, Timeout],[Min, Max, ?MAP_TICK,  All]};
        _ -> {tick, undefined}
    end.




map_cfg() ->
    MapId = map_rw:map_id(),
    getCfg:getCfgByArgs(cfg_map, MapId).
