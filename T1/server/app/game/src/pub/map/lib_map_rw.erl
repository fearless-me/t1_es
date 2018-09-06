%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 19. 五月 2018 17:09
%%%-------------------------------------------------------------------
-module(lib_map_rw).
-author("mawenhong").
-include("gs_map_inc.hrl").
-include("gs_cache_inc.hrl").
-include("gs_map_unit_inc.hrl").
-include("gs_move_inc.hrl").

%%
-export([init/1]).
-export([add_obj_to_ets/2, del_obj_to_ets/2]).
-export([
    get_obj/1,
    get_player/1, get_player_size/1,
    get_monster/1, get_monster_size/1,
    get_npc/1, get_pet/1
]).
-export([
    get_map_id/0, get_line_id/0,get_map_hook/0,
    update_move_timer/0,
    get_move_timer_delta/0,
    get_move_timer_now/0,
    get_move_timer_pass_time/1
]).


%% define
-define(MAP_MON_ETS, map_monster_ets__).
-define(MAP_USR_ETS, map_player_ets__).
-define(MAP_NPC_ETS, map_npc_ets__).
-define(MAP_PET_ETS, map_pet_ets__).
-define(MAP_ID, map_id__).
-define(LINE_ID, line_id__).
-define(MAP_HOOK, map_hook__).
-define(MOVE_TIMER, map_move_timer__).

%%%-------------------------------------------------------------------
init(State) ->
    Now = misc_time:milli_seconds(),
    put(?MAP_ID,        State#m_map_state.map_id),
    put(?LINE_ID,       State#m_map_state.line_id),
%%    put(?MAP_NPC_ETS,   State#m_map_state.npc),
%%    put(?MAP_PET_ETS,   State#m_map_state.pet),
%%    put(?MAP_USR_ETS,   State#m_map_state.player),
%%    put(?MAP_MON_ETS,   State#m_map_state.monster),
    put(?MAP_HOOK,      State#m_map_state.hook_mod),
    put(?MOVE_TIMER,    #m_move_timer{now = Now, latest_up = Now, delta = 0}),
    ok.

%%-------------------------------------------------------------------
get_map_id()        -> get(?MAP_ID).
get_line_id()       -> get(?LINE_ID).
get_map_hook()      -> get(?MAP_HOOK).

%%-------------------------------------------------------------------
get_obj(Uid) ->
    Type = lib_unit_rw:get_type(Uid),
    case Type of
        ?OBJ_USR -> get_player(Uid);
        ?OBJ_MON -> get_monster(Uid);
        ?OBJ_PET -> get_pet(Uid);
        ?OBJ_NPC -> get_npc(Uid);
        _ -> undefined
    end.
%%-------------------------------------------------------------------
get_player(Uid) ->
    case ets:lookup(?ETS_CACHE_MAP_PLAYER, Uid) of
        [#m_cache_map_unit{} = Unit | _] -> Unit;
        _ -> undefined
    end.

get_player_size(S) ->
    maps:size(S#m_map_state.player).

%%-------------------------------------------------------------------
%%player_update(Uid, Elements)->
%%    ets:update_element(
%%        lib_map_rw:get_player_ets(),
%%        Uid, Elements),
%%    ok.
%%
%%player_update_pos(Uid, Pos)->
%%    ets:update_element(
%%        lib_map_rw:get_player_ets(),
%%        Uid, {#m_map_obj.cur_pos, Pos}),
%%    ok.

%%-------------------------------------------------------------------
get_monster(Uid) ->
    case ets:lookup(?ETS_CACHE_MAP_MONSTER, Uid) of
        [#m_cache_map_unit{} = Unit | _] -> Unit;
        _ -> undefined
    end.

get_monster_size(S) ->
    maps:size(S#m_map_state.monster).

%%-------------------------------------------------------------------
get_npc(Uid) ->
    case ets:lookup(?ETS_CACHE_MAP_NPC, Uid) of
        [#m_cache_map_unit{} = Unit | _] -> Unit;
        _ -> undefined
    end.

%%-------------------------------------------------------------------
get_pet(Uid) ->
    case ets:lookup(?ETS_CACHE_MAP_PET, Uid) of
        [#m_cache_map_unit{} = Unit | _] -> Unit;
        _ -> undefined
    end.

%%-------------------------------------------------------------------
add_obj_to_ets(#m_map_state{ monster = Monster } = S, #m_cache_map_unit{type = ?OBJ_MON, uid = Uid} = Unit) ->
    catch ets:insert(?ETS_CACHE_MAP_MONSTER, Unit),
    S#m_map_state{monster = maps:put(Uid, Uid, Monster)};
add_obj_to_ets(#m_map_state{ player =  Player } = S, #m_cache_map_unit{type = ?OBJ_USR, uid = Uid} = Unit) ->
    catch ets:insert(?ETS_CACHE_MAP_PLAYER, Unit),
    S#m_map_state{player = maps:put(Uid, Uid, Player)};
add_obj_to_ets(S, _) ->
    S.

del_obj_to_ets(#m_map_state{ monster = Monster } = S, #m_cache_map_unit{uid = Uid, type = ?OBJ_MON}) ->
    catch ets:delete(?ETS_CACHE_MAP_MONSTER, Uid),
    S#m_map_state{monster = maps:remove(Uid, Monster)};
del_obj_to_ets(#m_map_state{ player =  Player } = S, #m_cache_map_unit{uid = Uid, type = ?OBJ_USR}) ->
    catch ets:update_element(?ETS_CACHE_MAP_PLAYER, Uid, [{#m_cache_map_unit.map_id, 0}, {#m_cache_map_unit.line_id, 0}]),
    S#m_map_state{monster = maps:remove(Uid, Player)};
del_obj_to_ets(S, _) ->
    S.
%%-------------------------------------------------------------------
update_move_timer() ->
    Now = misc_time:milli_seconds(),
    #m_move_timer{latest_up = Latest} = get(?MOVE_TIMER),
    put(?MOVE_TIMER, #m_move_timer{now = Now, latest_up = Now, delta = Now - Latest}),
    ok.

%%-------------------------------------------------------------------
get_move_timer_now() ->
    #m_move_timer{now = Now} = get(?MOVE_TIMER),
    Now.

get_move_timer_pass_time(StartTime) ->
    #m_move_timer{now = Now} = get(?MOVE_TIMER),
    Now - StartTime.

get_move_timer_delta() ->
    #m_move_timer{delta = Delta} = get(?MOVE_TIMER),
    Delta.

%%-------------------------------------------------------------------






