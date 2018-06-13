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
-include("map_obj.hrl").
-include("map.hrl").
-include("movement.hrl").

%%
-export([init_ets/1]).
-export([add_obj_to_ets/1]).
-export([del_obj_to_ets/1]).
-export([get_player/1, get_player_size/0]).
-export([get_monster/1, get_monster_size/0]).
-export([get_npc/1, get_pets/1]).
-export([get_npc_ets/0, get_monster_ets/0]).
-export([get_pet_ets/0, get_player_ets/0]).
-export([get_map_id/0, get_line_id/0]).
-export([get_map_hook/0]).
-export([update_move_timer/0]).
-export([get_move_timer_delta/0]).
-export([get_move_timer_now/0]).
-export([get_move_timer_pass_time/1]).


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
init_ets(State) ->
    Now = time:milli_seconds(),
    put(?MAP_ID,        State#m_map_state.map_id),
    put(?LINE_ID,       State#m_map_state.line_id),
    put(?MAP_NPC_ETS,   State#m_map_state.npc),
    put(?MAP_PET_ETS,   State#m_map_state.pet),
    put(?MAP_USR_ETS,   State#m_map_state.player),
    put(?MAP_MON_ETS,   State#m_map_state.monster),
    put(?MAP_HOOK,      State#m_map_state.hook_mod),
    put(?MOVE_TIMER,    #m_move_timer{now = Now, latest_up = Now, delta = 0}),
    ok.

%%-------------------------------------------------------------------
get_map_id()        -> get(?MAP_ID).
get_line_id()       -> get(?LINE_ID).
get_map_hook()      -> get(?MAP_HOOK).

%%-------------------------------------------------------------------
get_npc_ets()       -> get(?MAP_NPC_ETS).
get_pet_ets()       -> get(?MAP_PET_ETS).
get_player_ets()    -> get(?MAP_USR_ETS).
get_monster_ets()   -> get(?MAP_MON_ETS).

%%-------------------------------------------------------------------
get_player(Uid) ->
    case ets:lookup(lib_map_rw:get_player_ets(), Uid) of
        [#m_map_obj{} = Obj | _] -> Obj;
        _ -> undefined
    end.

get_player_size() ->
    ets:info( get_player_ets(), size ).

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
    case ets:lookup(lib_map_rw:get_monster_ets(), Uid) of
        [#m_map_obj{} = Obj | _] -> Obj;
        _ -> undefined
    end.

get_monster_size() ->
    ets:info( lib_map_rw:get_monster_ets(), size ).

%%-------------------------------------------------------------------
get_npc(Uid) ->
    case ets:lookup(lib_map_rw:get_npc_ets(), Uid) of
        [#m_map_obj{} = Obj | _] -> Obj;
        _ -> undefined
    end.

%%-------------------------------------------------------------------
get_pets(Uid) ->
    case ets:lookup(lib_map_rw:get_pet_ets(), Uid) of
        [#m_map_obj{} = Obj | _] -> Obj;
        _ -> undefined
    end.

%%-------------------------------------------------------------------
add_obj_to_ets(#m_map_obj{type = ?OBJ_MON} = Obj) ->
    ets:insert(lib_map_rw:get_monster_ets(), Obj);
add_obj_to_ets(#m_map_obj{type = ?OBJ_USR} = Obj) ->
    ets:insert(lib_map_rw:get_player_ets(), Obj);
add_obj_to_ets(_) ->
    ok.

del_obj_to_ets(#m_map_obj{uid = Uid, type = ?OBJ_MON}) ->
    ets:delete(lib_map_rw:get_monster_ets(), Uid);
del_obj_to_ets(#m_map_obj{uid = Uid, type = ?OBJ_USR}) ->
    ets:delete(lib_map_rw:get_player_ets(), Uid);
del_obj_to_ets(_) ->
    ok.
%%-------------------------------------------------------------------
update_move_timer() ->
    Now = time:milli_seconds(),
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





