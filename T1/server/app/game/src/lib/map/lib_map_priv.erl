%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 10. 五月 2018 19:57
%%%-------------------------------------------------------------------
-module(lib_map_priv).
-author("mawenhong").

-include("logger.hrl").
-include("map.hrl").
-include("map_obj.hrl").
-include("pub_common.hrl").
-include("cfg_mapsetting.hrl").
-include("common_record.hrl").
-include("netmsg.hrl").

%% API
-export([init/1]).
-export([tick/1]).
-export([start_stop_now/1]).
-export([player_start_move/1, player_stop_move/1]).

%%--------------------------------
%% WARNING!!! WARNING!!! WARNING!!!
%% call
-export([player_join/2]).
-export([player_exit/2]).
-export([force_teleport/2]).
%%--------------------------------

-define(MAP_TICK, 200).

%%%-------------------------------------------------------------------
init(S) ->
    Conf = map_creator:map_conf(S#m_map_state.map_id),
    S1 = init_1(S),
    ok = lib_map_rw:init_ets(S1),
    ok = lib_map_view:init_vis_tile(Conf),
    ok = init_npc(Conf),
    ok = init_monster(Conf),
    tick_msg(),
    S1.

%%%-------------------------------------------------------------------
init_1(State) ->
    State#m_map_state{
        npc     = ets:new(npc,      [protected, {keypos, #m_map_obj.uid}, ?ETS_RC]),
        pet     = ets:new(pet,      [protected, {keypos, #m_map_obj.uid}, ?ETS_RC]),
        player  = ets:new(player,   [protected, {keypos, #m_map_obj.uid}, ?ETS_RC]),
        monster = ets:new(monster,  [protected, {keypos, #m_map_obj.uid}, ?ETS_RC])
    }.

%%%-------------------------------------------------------------------
%% WARNING!!! WARNING!!! WARNING!!!
%% call
player_exit(S, #r_exit_map_req{
    uid = Uid
}) ->
    Obj = lib_map_rw:get_player(Uid),
    Ret = do_player_exit(Uid, Obj),
    {Ret, S}.

do_player_exit(Uid, #m_map_obj{} = Obj) ->
    ?INFO("user ~p exit map ~p:~p:~p",
        [Uid, lib_map_rw:get_map_id(), lib_map_rw:get_line_id(), self()]),

    lib_map_rw:del_obj_to_ets(Obj),
    lib_map_view:sync_player_exit_map(Obj),
    lib_obj_rw:to_record(Uid);
do_player_exit(Uid, _Obj) ->
    ?ERROR("~w req exit map ~w ~w, but obj not exists!",
        [Uid, self(), misc:register_name()]),
    ok.

%%%-------------------------------------------------------------------
%% WARNING!!! WARNING!!! WARNING!!!
%% call
player_join(
    S,
    #r_change_map_req{uid = Uid, name = _Name, pid = Pid, group = Group, tar_pos = Pos}
) ->
    ?DEBUG("player ~p to ~p",[Uid, Pos]),
    Obj = lib_obj:new_player(Pid, Uid, Group, Pos, vector3:new(0.1, 0, 0.5)),
    send_goto_map_msg(Uid, Pos),
    lib_map_rw:add_obj_to_ets(Obj),
    lib_map_view:sync_player_join_map(Obj),
    ?DEBUG("uid ~p, join map ~w, name ~p",
        [lib_obj:get_uid(Obj), self(), misc:register_name()]),
    {ok, S};
player_join(S, Any) ->
    ?ERROR("player join map ~w, name ~p, error obj data ~w",
        [ self(), misc:register_name(), Any]),
    {error, S}.


%%%-------------------------------------------------------------------
%% WARNING!!! WARNING!!! WARNING!!!
%% call
force_teleport(S, #r_teleport_req{
    uid = Uid,
    tar = TarPos
}) ->
    Cur = lib_obj_rw:get_cur_pos(Uid),
    lib_move:on_player_pos_change(Uid, TarPos),
    ?DEBUG("player ~p teleport from ~w to ~w in map ~p_~p",
        [Uid, Cur, TarPos, lib_map_rw:get_map_id(), lib_map_rw:get_line_id()]),
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
    Obj = lib_obj:new_monster(Mdata),
    ok = init_all_monster_2(Obj).

init_all_monster_2(Obj) ->
    Uid = lib_obj:get_uid(Obj),
    VisIndex = lib_map_view:pos_to_vis_index(lib_obj_rw:get_cur_pos(Uid)),
    lib_map_rw:add_obj_to_ets(Obj),
    lib_map_view:add_obj_to_vis_tile(Obj, VisIndex),
    ?DEBUG("map ~p:~p create monster ~p, uid ~p, visIndex ~p",
        [lib_map_rw:get_map_id(), lib_map_rw:get_line_id(), lib_obj:get_did(Obj), Uid, VisIndex]),
    ok.

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

tick(S) ->
    lib_map_rw:update_move_timer(),
    tick_1(S),
    S.

tick_1(#m_map_state{status = ?MAP_READY_EXIT}) ->
    PlayerSize = lib_map_rw:get_player_size(),
    real_stop_now(PlayerSize),
    ok;
tick_1(_S) ->
    tick_msg(),
    tick_obj(),
    ok.

tick_obj()->
    tick_update_before(),
    tick_player(),
    tick_monster(),
    tick_update_after(),
    ok.

tick_player() ->
    ets:foldl(
        fun(Obj, _) -> tick_player_1(Obj) end,
        0, lib_map_rw:get_player_ets()
    ).

tick_player_1(Obj) ->
    ?TRY_CATCH(lib_move:update(Obj)),
    ok.

tick_monster() ->
    ets:foldl(
        fun(Obj, _) -> tick_monster_1(Obj) end,
        0, lib_map_rw:get_monster_ets()
    ).

tick_monster_1(Obj) ->
    ?TRY_CATCH(lib_move:update(Obj)),
    ok.

%%%-------------------------------------------------------------------
tick_update_before() ->  ok.

tick_update_after() -> ok.

%%%-------------------------------------------------------------------
real_stop_now(0) ->
    ?INFO("~p ~p stop now",[misc:register_name(), self()]),
    ps:send(self(), stop_immediately);
real_stop_now(_Players) ->
    tick_msg(),
    ok.

%%%-------------------------------------------------------------------
start_stop_now(S) ->
    ?INFO("~p ~p start stop now, kick all player(s)",
        [misc:register_name(), self()]),

    kick_all_player(S),
    S#m_map_state{status = ?MAP_READY_EXIT}.

kick_all_player(#m_map_state{player = Ets}) ->
    ets:foldl(
        fun(#m_map_obj{pid = Pid}, _) ->
            ps:send(Pid, return_to_pre_map_req)
        end, 0, Ets),
    ok.

%%-------------------------------------------------------------------
player_start_move(Req) ->
    #r_player_start_move_req{uid = Uid, tar = Dst} = Req,
    lib_move:start_player_walk(Uid, lib_obj_rw:get_cur_pos(Uid), Dst).

%%-------------------------------------------------------------------
player_stop_move(Req) ->
    #r_player_stop_move_req{uid = Uid, pos = Pos} = Req,
    lib_move:stop_player_move(Uid, Pos).

%%-------------------------------------------------------------------
send_goto_map_msg(Uid, Pos)->
    Msg = #pk_GS2U_GotoNewMap{
        map_id = lib_map_rw:get_map_id(),
        x = vector3:x(Pos), y = vector3:z(Pos)
    },
    gcore:send_net_msg(Uid, Msg),
    ok.


