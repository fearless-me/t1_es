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
-include("map_unit.hrl").
-include("pub_common.hrl").
-include("cfg_mapsetting.hrl").
-include("common_record.hrl").
-include("netmsg.hrl").



-spec init(S ::#m_map_state{}) -> #m_map_state{}.
-spec tick(S ::#m_map_state{}) -> #m_map_state{}.
-spec start_stop_now(S :: #m_map_state{}) -> #m_map_state{}.
-spec player_start_move(Req :: #r_player_start_move_req{}) -> ok | error.
-spec player_stop_move(Req :: #r_player_stop_move_req{})  -> ok | error.
-spec broadcast_msg({MsgId :: term()} | {MsgId :: term(), Msg :: term()}) -> ok.
-spec broadcast_net_msg(NetMsg :: tuple()) -> ok.
-spec broadcast_msg_view(
    {Uid :: integer(), MsgId :: term()} |{Uid :: integer(), MsgId :: term(), Msg :: term()} ) -> ok.
-spec broadcast_net_msg_view({Uid :: integer(), NetMsg :: tuple()}) -> ok.



%% 初始化， tick， 开始终止进程
-export([init/1, tick/1, start_stop_now/1]).
-export([player_start_move/1, player_stop_move/1]).
-export([broadcast_msg/1, broadcast_net_msg/1, broadcast_msg_view/1, broadcast_net_msg_view/1]).

%%--------------------------------
%% WARNING!!! WARNING!!! WARNING!!!
%% call
%% 基础代码调用的玩家上线，下线、切地图、同地图传送
-export([player_join_call/2]).
-export([player_exit_call/2]).
-export([force_teleport_call/2]).
%%--------------------------------

%%-------------------------------------------------------------------
init(S) ->
    Conf = map_creator_pub:map_conf(S#m_map_state.map_id),
    S1 = init_1(S),
    ok = lib_map_rw:init_ets(S1),
    ok = lib_map_view:init_vis_tile(Conf),
    ok = init_npc(Conf),
    ok = init_monster(Conf),
    tick_msg(),
    catch hook_map:on_map_create(),
    S1.

%%-------------------------------------------------------------------
init_1(State) ->
    State#m_map_state{
        npc = ets:new(npc, [protected, {keypos, #m_map_unit.uid}, ?ETS_RC]),
        pet = ets:new(pet, [protected, {keypos, #m_map_unit.uid}, ?ETS_RC]),
        player = ets:new(player, [protected, {keypos, #m_map_unit.uid}, ?ETS_RC]),
        monster = ets:new(monster, [protected, {keypos, #m_map_unit.uid}, ?ETS_RC])
    }.

%%-------------------------------------------------------------------
%% WARNING!!! WARNING!!! WARNING!!!
%% call
player_exit_call(S, #r_exit_map_req{
    uid = Uid
}) ->
    Unit = lib_map_rw:get_player(Uid),
    Ret = ?TRY_CATCH_RET(do_player_exit_call(Uid, Unit), error),
    {Ret, S}.

do_player_exit_call(Uid, #m_map_unit{} = Unit) ->
    ?INFO("user ~p exit map ~p:~p:~p",
        [Uid, lib_map_rw:get_map_id(), lib_map_rw:get_line_id(), self()]),

    lib_map_rw:del_obj_to_ets(Unit),
    lib_map_view:sync_player_exit_map(Unit),
    Data = lib_unit_rw:to_record(Uid),
    hook_map:on_player_exit(Uid),
    Data;
do_player_exit_call(Uid, _Obj) ->
    ?ERROR("~w req exit map ~w ~w, but obj not exists!",
        [Uid, self(), misc:registered_name()]),
    error.

%%-------------------------------------------------------------------
%% WARNING!!! WARNING!!! WARNING!!!
%% call
player_join_call(
    S,
    #r_change_map_req{uid = Uid, name = _Name, pid = Pid, group = Group, tar_pos = Pos}
) ->
    ?DEBUG("player ~p to ~p", [Uid, Pos]),
    Unit = lib_unit:new_player(Pid, Uid, Group, Pos, vector3:new(0.1, 0, 0.5)),
    send_goto_map_msg(Uid, Pos),
    lib_map_rw:add_obj_to_ets(Unit),
    lib_map_view:sync_player_join_map(Unit),
    hook_map:on_player_join(Uid),
    ?DEBUG("uid ~p, join map ~w, name ~p",
        [lib_unit:get_uid(Unit), self(), misc:registered_name()]),
    {ok, S};
player_join_call(S, Any) ->
    ?ERROR("player join map ~w, name ~p, error obj data ~w",
        [self(), misc:registered_name(), Any]),
    {error, S}.


%%-------------------------------------------------------------------
%% WARNING!!! WARNING!!! WARNING!!!
%% call
force_teleport_call(S, #r_teleport_req{
    uid = Uid,
    tar = TarPos
}) ->
    Cur = lib_move_rw:get_cur_pos(Uid),
    lib_move:on_obj_pos_change(Uid, TarPos),
    ?DEBUG("player ~p teleport from ~w to ~w in map ~p_~p",
        [Uid, Cur, TarPos, lib_map_rw:get_map_id(), lib_map_rw:get_line_id()]),
    {ok, S}.


%%-------------------------------------------------------------------
init_monster(#recGameMapCfg{
    mapMonster = MonsterList
}) ->
    lists:foreach(
        fun(MData) ->
            ok = init_all_monster_1(MData)
        end, MonsterList),
    ok.

init_all_monster_1(Mdata) ->
    Unit = lib_unit:new_monster(Mdata),
    ok = init_all_monster_2(Unit).

init_all_monster_2(Unit) ->
    Uid = lib_unit:get_uid(Unit),
    VisIndex = lib_map_view:pos_to_vis_index(lib_move_rw:get_cur_pos(Uid)),
    lib_map_rw:add_obj_to_ets(Unit),
    lib_map_view:add_obj_to_vis_tile(Unit, VisIndex),
    hook_map:on_monster_create(Uid),
    ?DEBUG("map ~p:~p create monster ~p, uid ~p, visIndex ~p",
        [lib_map_rw:get_map_id(), lib_map_rw:get_line_id(), lib_unit:get_did(Unit), Uid, VisIndex]),
    ok.

%%-------------------------------------------------------------------
init_npc(#recGameMapCfg{
    mapNpc = NpcList
}) ->
    init_all_npc(NpcList),
    ok.

init_all_npc(_NL) ->
    ok.

%%-------------------------------------------------------------------
tick_msg() -> erlang:send_after(?MAP_TICK, self(), tick_now).

tick(S) ->
    lib_map_rw:update_move_timer(),
    tick_1(S).

tick_1(#m_map_state{status = ?MAP_READY_EXIT, protect_tick = Tick} = S) when Tick =< 0 ->
    PlayerSize = lib_map_rw:get_player_size(),
    ?FATAL("map_~p_~p destroy error, player size ~p, force stop now",
        [lib_map_rw:get_map_id(), lib_map_rw:get_line_id(), PlayerSize]),
    ?TRY_CATCH(real_stop_now(0)),
    S;
tick_1(#m_map_state{status = ?MAP_READY_EXIT, protect_tick = TickMax} = S) ->
    PlayerSize = lib_map_rw:get_player_size(),
    ?TRY_CATCH(real_stop_now(PlayerSize)),
    S#m_map_state{protect_tick = TickMax - 1};
tick_1(S) ->
    ?TRY_CATCH(tick_msg(), Err1, Stk1),
    ?TRY_CATCH(tick_obj(), Err2, Stk2),
    S.

tick_obj() ->
    ?TRY_CATCH(tick_update_before(), Err1, Stk1),
    % 更新各个对象
    %------------------
    ?TRY_CATCH(tick_player(),        Err2, Stk2),
    ?TRY_CATCH(tick_monster(),       Err3, Stk3),
    ?TRY_CATCH(tick_pet(),           Err4, Stk4),
    %------------------
    
    ?TRY_CATCH(tick_update_after(),  Err5, Stk5),
    ok.

%%-------------------------------------------------------------------
tick_player() ->
    ets:foldl(
        fun(Unit, _) -> tick_player_1(Unit) end,
        0, lib_map_rw:get_player_ets()
    ).

tick_player_1(Unit) ->
    ?TRY_CATCH(lib_move:update(Unit), Err1, Stk1),
    ?TRY_CATCH(lib_combat:tick(Unit), Err2, Stk2),
    ok.

%%-------------------------------------------------------------------
tick_monster() ->
    ets:foldl(
        fun(Unit, _) -> tick_monster_1(Unit) end,
        0, lib_map_rw:get_monster_ets()
    ).

tick_monster_1(Unit) ->
    ?TRY_CATCH(lib_move:update(Unit), Err1, Stk1),
    ?TRY_CATCH(lib_ai:update(Unit),   Err2, Stk2),
    ?TRY_CATCH(lib_combat:tick(Unit), Err3, Stk3),
    ok.

%%-------------------------------------------------------------------
tick_pet() ->
    ets:foldl(
        fun(Unit, _) -> tick_pet_1(Unit) end,
        0, lib_map_rw:get_pet_ets()
    ).

tick_pet_1(Unit) ->
    ?TRY_CATCH(lib_move:update(Unit), Err1, Stk1),
    ?TRY_CATCH(lib_combat:tick(Unit), Err2, Stk2),
    ok.

%%-------------------------------------------------------------------
tick_update_before() -> ok.

tick_update_after() -> ok.

%%-------------------------------------------------------------------
real_stop_now(0) ->
    ?INFO("~p ~p stop now", [misc:registered_name(), self()]),
    ps:send(self(), stop_immediately);
real_stop_now(_Players) ->
    tick_msg(),
    ok.

%%-------------------------------------------------------------------
start_stop_now(S) ->
    ?INFO("~p ~p start stop now, kick all player(s)",
        [misc:registered_name(), self()]),
    ?TRY_CATCH(hook_map:on_map_destroy(), Err1, Stk1),
    ?TRY_CATCH(kick_all_player(S), Err2, Stk2),
    S#m_map_state{status = ?MAP_READY_EXIT}.

kick_all_player(#m_map_state{player = Ets}) ->
    ets:foldl(
        fun(#m_map_unit{pid = Pid}, _) ->
            ps:send(Pid, return_to_pre_map_req)
        end, 0, Ets),
    ok.

%%-------------------------------------------------------------------
player_start_move(Req) ->
    #r_player_start_move_req{uid = Uid, tar = Dst} = Req,
    lib_move:start_player_walk(Uid, lib_move_rw:get_cur_pos(Uid), Dst).

%%-------------------------------------------------------------------
player_stop_move(Req) ->
    #r_player_stop_move_req{uid = Uid, pos = Pos} = Req,
    lib_move:stop_player_move(Uid, Pos).

%%-------------------------------------------------------------------
send_goto_map_msg(Uid, Pos) ->
    Msg = #pk_GS2U_GotoNewMap{
        map_id = lib_map_rw:get_map_id(),
        x = vector3:x(Pos), y = vector3:z(Pos)
    },
    gcore:send_net_msg(Uid, Msg),
    ok.

%%-------------------------------------------------------------------
broadcast_msg({MsgId}) ->
    ets:foldl(
        fun(#m_map_unit{uid = Uid}, _) ->
            gcore:send_msg(Uid, MsgId)
        end, 0, lib_map_rw:get_player_ets()
    ),
    ok;
broadcast_msg({MsgId, Msg}) ->
    ets:foldl(
        fun(#m_map_unit{uid = Uid}, _) ->
            gcore:send_msg(Uid, MsgId, Msg)
        end, 0, lib_map_rw:get_player_ets()
    ),
    ok.

broadcast_net_msg(NetMsg) ->
    ets:foldl(
        fun(#m_map_unit{uid = Uid}, _) ->
            gcore:send_net_msg(Uid, NetMsg)
        end, 0, lib_map_rw:get_player_ets()
    ),
    ok.

%%-------------------------------------------------------------------
broadcast_msg_view({Uid, MsgId}) ->
    lib_map_view:send_msg_to_visual(Uid, MsgId),
    ok;
broadcast_msg_view({Uid, MsgId, Msg}) ->
    lib_map_view:send_msg_to_visual(Uid, MsgId, Msg),
    ok.

broadcast_net_msg_view({Uid, NetMsg}) ->
    lib_map_view:send_net_msg_to_visual(Uid, NetMsg),
    ok.




