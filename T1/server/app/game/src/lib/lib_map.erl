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
-include("cfg_mapsetting.hrl").

%% API
-export([init/1]).
-export([tick/1]).
-export([start_stop_now/1]).
-export([get_npc_ets/0, get_monster_ets/0]).
-export([get_pet_ets/0, get_player_ets/0]).
-export([get_map_id/0, get_line_id/0]).
-export([get_map_hook/0]).
-export([player_exit/2, player_join/2]).
-export([force_teleport/2]).
-export([get_player/1]).

-define(MAP_MON_ETS, map_monster_ets__).
-define(MAP_USR_ETS, map_player_ets__).
-define(MAP_NPC_ETS, map_npc_ets__).
-define(MAP_PET_ETS, map_pet_ets__).
-define(MAP_ID, map_id__).
-define(LINE_ID, line_id__).
-define(MAP_HOOK, map_hook__).
-define(MAP_TICK, 50).

%%%-------------------------------------------------------------------
init(S) ->
    Conf = mod_map_creator:map_conf(S#r_map_state.map_id),
    S1 = init_1(S),
    ok = init_2(S1),
    ok = lib_map_view:init_vis_tile(Conf),
    ok = init_npc(Conf),
    ok = init_monster(Conf),
    tick_msg(),
    S1.

%%%-------------------------------------------------------------------
init_1(State) ->
    State#r_map_state{
        npc     = ets:new(?MAP_NPC_ETS, [protected, {keypos, #r_obj.code}, ?ETSRC]),
        pet     = ets:new(?MAP_PET_ETS, [protected, {keypos, #r_obj.code}, ?ETSRC]),
        player  = ets:new(?MAP_USR_ETS, [protected, {keypos, #r_obj.code}, ?ETSRC]),
        monster = ets:new(?MAP_MON_ETS, [protected, {keypos, #r_obj.code}, ?ETSRC])
    }.

init_2(State) ->
    put(?MAP_ID,        State#r_map_state.map_id),
    put(?LINE_ID,       State#r_map_state.line_id),
    put(?MAP_NPC_ETS,   State#r_map_state.npc),
    put(?MAP_PET_ETS,   State#r_map_state.pet),
    put(?MAP_USR_ETS,   State#r_map_state.player),
    put(?MAP_MON_ETS,   State#r_map_state.monster),
    put(?MAP_HOOK,      State#r_map_state.hook_mod),
    ok.
%%%-------------------------------------------------------------------
get_map_id()        -> get(?MAP_ID).
get_line_id()       -> get(?LINE_ID).
get_map_hook()      -> get(?MAP_HOOK).
get_npc_ets()       -> get(?MAP_NPC_ETS).
get_pet_ets()       -> get(?MAP_PET_ETS).
get_player_ets()    -> get(?MAP_USR_ETS).
get_monster_ets()   -> get(?MAP_MON_ETS).

%%%-------------------------------------------------------------------
player_exit(S, #r_exit_map_req{
    code = PlayerCode
}) ->
    Obj = get_player(PlayerCode),
    player_exit_1(Obj),
    {ok, S}.

player_exit_1(Obj) ->
    ?INFO("user ~p:~p exit map ~p:~p:~p",
        [Obj#r_obj.id, Obj#r_obj.code, get_map_id(), get_line_id(), self()]),
    ets:delete(get_player_ets(), Obj#r_obj.code),
    lib_map_view:sync_player_exit_map(Obj),
    ok.

%%%-------------------------------------------------------------------
player_join(S, Obj) ->
    ets:insert(get_player_ets(), Obj),
    lib_map_view:sync_player_join_map(Obj),
    {ok, S}.


%%%-------------------------------------------------------------------
force_teleport(S, #r_teleport_req{
    player_code = PlayerCode,
    tar_pos = TarPos
}) ->
    Obj = lib_map:get_player(PlayerCode),
    on_player_pos_change(Obj, TarPos),
    {ok, S}.

on_player_pos_change(undefined, _TarPos) ->
    ok;
on_player_pos_change(Obj, TarPos) ->
    stop_move(false),
    OldVisIndex = lib_map_view:pos_to_vis_index(Obj#r_obj.pos),
    NewVisIndex = lib_map_view:pos_to_vis_index(TarPos),
    lib_map_view:sync_change_pos_visual_tile(Obj, OldVisIndex, NewVisIndex),
    lib_map_rw:player_update(Obj#r_obj.code, {#r_obj.tar_pos, TarPos}),
    lib_map_view:sync_movement_to_big_visual_tile(
        {player_move_to, Obj#r_obj.pos, TarPos}),
    ok.


stop_move(_Send)->  ok.
%%%-------------------------------------------------------------------
get_player(PlayerCode) ->
    case ets:lookup(get_player_ets(), PlayerCode) of
        [#r_obj{} = Obj | _] -> Obj;
        _ -> undefined
    end.

%%%-------------------------------------------------------------------
init_monster( #recGameMapCfg{
    mapMonster = MonsterList
}) ->
    lists:foreach(
        fun(MData) ->
            ok = init_all_monster_1(MData)
        end , MonsterList),
    ok.

init_all_monster_1(Mdata)->
    Obj = lib_monster:create(Mdata),
    init_all_monster_2(Obj).

init_all_monster_2(#r_obj{
  pos = Pos
} = Obj) ->

    add_obj_to_ets(Obj),
    VisIndex = lib_map_view:pos_to_vis_index(Pos),
    lib_map_view:add_to_vis_tile(Obj, VisIndex),
    ?DEBUG("map ~p:~p create monster ~p, code ~p, visIndex ~p",
        [lib_map:get_map_id(), lib_map:get_line_id(), Obj#r_obj.id, Obj#r_obj.code, VisIndex]),
    ok;
init_all_monster_2(_) -> error.

%%%-------------------------------------------------------------------
init_npc( #recGameMapCfg{
    mapNpc = NpcList
}) ->
    init_all_npc(NpcList),
    ok.

init_all_npc(_NL) ->
    ok.

%%%-------------------------------------------------------------------
add_obj_to_ets(#r_obj{type = ?OBJ_MON} = Obj) ->
    ets:insert(get_monster_ets(), Obj);
add_obj_to_ets(#r_obj{type = ?OBJ_USR} = Obj) ->
    ets:insert(get_player_ets(), Obj);
add_obj_to_ets(_) ->
    ok.

%%%-------------------------------------------------------------------
tick_msg() -> erlang:send_after(?MAP_TICK, self(), tick_now).

tick(#r_map_state{exit = true, player = PL}) ->
    real_stop_now(PL);
tick(S) ->
    tick_msg(),
    S.
%%%-------------------------------------------------------------------
real_stop_now([]) ->
    ?DEBUG("~p,~p stop now",[misc:register_name(self()), self()]),
    ps:send(self(), stop_immediately);
real_stop_now(_Players) ->
    ok.
%%%-------------------------------------------------------------------
start_stop_now(S) ->
    kick_all_player(S),
    S#r_map_state{exit = true}.

kick_all_player(#r_map_state{player = Ets}) ->
    ets:foldl(
        fun(#r_obj{pid = Pid}, _) ->
            ps:send(Pid, return_to_pre_map)
        end, 0, Ets),
    ok.