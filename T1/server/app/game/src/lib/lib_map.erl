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
-include("map_obj.hrl").
-include("pub_common.hrl").
-include("cfg_mapsetting.hrl").

%% API
-export([init/1]).
-export([tick/1]).
-export([start_stop_now/1]).

-export([player_exit/2, player_join/2]).
-export([force_teleport/2]).

-define(MAP_TICK, 50).

%%%-------------------------------------------------------------------
init(S) ->
    Conf = mod_map_creator:map_conf(S#r_map_state.map_id),
    S1 = init_1(S),
    ok = lib_map_rw:init_ets(S1),
    ok = lib_map_view:init_vis_tile(Conf),
    ok = init_npc(Conf),
    ok = init_monster(Conf),
    tick_msg(),
    S1.

%%%-------------------------------------------------------------------
init_1(State) ->
    State#r_map_state{
        npc     = ets:new(npc,      [protected, {keypos, #r_map_obj.uid}, ?ETSRC]),
        pet     = ets:new(pet,      [protected, {keypos, #r_map_obj.uid}, ?ETSRC]),
        player  = ets:new(player,   [protected, {keypos, #r_map_obj.uid}, ?ETSRC]),
        monster = ets:new(monster,  [protected, {keypos, #r_map_obj.uid}, ?ETSRC])
    }.

%%%-------------------------------------------------------------------
player_exit(S, #r_exit_map_req{
    uid = PlayerID
}) ->
    Obj = lib_map_rw:get_player(PlayerID),
    player_exit_1(Obj),
    {ok, S}.

player_exit_1(Obj) ->
    ?INFO("user ~p exit map ~p:~p:~p",
        [Obj#r_map_obj.uid, lib_map_rw:get_map_id(), lib_map_rw:get_line_id(), self()]),
    ets:delete(lib_map_rw:get_player_ets(), Obj#r_map_obj.uid),
    lib_map_view:sync_player_exit_map(Obj),
    ok.

%%%-------------------------------------------------------------------
player_join(S, Obj) ->
    ets:insert(lib_map_rw:get_player_ets(), Obj),
    lib_map_view:sync_player_join_map(Obj),
    {ok, S}.


%%%-------------------------------------------------------------------
force_teleport(S, #r_teleport_req{
    uid = PlayerId,
    tar_pos = TarPos
}) ->
    Obj = lib_map_rw:get_player(PlayerId),
    lib_move:on_player_pos_change(Obj, TarPos),
    ?DEBUG("player ~p teleport from ~p to ~p in map ~p",
        [Obj#r_map_obj.uid, lib_map_rw:get_obj_pos(Obj), TarPos, lib_map_rw:get_map_id()]),
    {ok, S}.


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
    ok = init_all_monster_2(Obj).

init_all_monster_2(#r_map_obj{} = Obj) ->
    VisIndex = lib_map_view:pos_to_vis_index(Obj#r_map_obj.pos),
    lib_map_rw:add_obj_to_ets(Obj),
    lib_map_view:add_to_vis_tile(Obj, VisIndex),
    ?DEBUG("map ~p:~p create monster ~p, uid ~p, visIndex ~p",
        [lib_map_rw:get_map_id(), lib_map_rw:get_line_id(), Obj#r_map_obj.uid, Obj#r_map_obj.uid, VisIndex]),
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
tick_msg() -> erlang:send_after(?MAP_TICK, self(), tick_now).

tick(#r_map_state{exit = true, player = PL}) ->
    real_stop_now(PL);
tick(S) ->
    tick_msg(),
    tick_obj(),
    S.

tick_obj()->
    tick_player(),
    tick_monster(),
    ok.

tick_player() ->
    ets:foldl(fun(_Obj, _) -> ok end, 0, lib_map_rw:get_player_ets()).

tick_monster() ->
    ets:foldl(fun(_Obj, _) -> ok end, 0, lib_map_rw:get_monster_ets()).

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
        fun(#r_map_obj{pid = Pid}, _) ->
            ps:send(Pid, return_to_pre_map)
        end, 0, Ets),
    ok.