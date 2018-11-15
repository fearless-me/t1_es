%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 10. 五月 2018 19:57
%%%-------------------------------------------------------------------
-module(mod_map_priv).
-author("mawenhong").

-include("logger.hrl").
-include("error_code.hrl").
-include("pub_def.hrl").
-include("netmsg.hrl").
-include("gs_cache.hrl").
-include("gs_common_rec.hrl").
-include("cfg_map.hrl").
-include("map_core.hrl").
-include("rec_rw.hrl").


%% 初始化， tick， 开始终止进程
-export([init/1, tick/1, start_stop_now/1, change_group/1]).
-export([player_start_move/1, player_stop_move/1]).
-export([broadcast_msg/2, broadcast_net_msg/2, broadcast_msg_view/1, broadcast_net_msg_view/1, broadcast_net_msg_view/2]).

%%--------------------------------
%% WARNING!!! WARNING!!! WARNING!!!
%% call
%% 基础代码调用的玩家上线，下线、切地图、同地图传送
-export([player_join_call/3]).
-export([player_exit_call/3]).
-export([force_teleport_call/3]).
-export([player_exit_exception_call/2]).
%%--------------------------------

%%-------------------------------------------------------------------
-spec init(S :: #m_map_state{}) -> #m_map_state{}.
init(S) ->
    Conf = map_creator_interface:map_data(S#m_map_state.map_id),
    ok = map_rw:init(S),
    ok = mod_view:init_vis_tile(Conf),
    ok = init_npc(Conf),
    ok = init_monster(Conf),
    tick_msg(),
    ?TRY_CATCH(hook_map:on_map_create()),
    S.


%%-------------------------------------------------------------------
%% WARNING!!! WARNING!!! WARNING!!!
%% call
player_exit_call(S, From, #r_exit_map_req{uid = Uid}) ->
    Obj = map_rw:find_unit(?OBJ_PLAYER, Uid),
    ?TRY_CATCH_RET(do_player_exit_call(S, From, Uid, Obj), {reply, ?E_Exception, S}).

do_player_exit_call(S, _From, Uid, #m_cache_map_object_priv{} = Obj) ->
    ?INFO("player ~p exit map ~p:~p:~p",
        [Uid, map_rw:map_id(), map_rw:line_id(), self()]),

    ?TRY_CATCH_ERROR(map_rw:del_obj_to_map(Obj), Err1),
    ?TRY_CATCH_ERROR(mod_view:sync_player_exit_map(Obj), Err2),
    ?TRY_CATCH_ERROR(hook_map:on_player_exit(Uid), Err3),
    ?TRY_CATCH_ERROR(dec_line_number(S#m_map_state.mgr_ets, map_rw:line_id()), Err4),
    {reply, ?E_Success, S};
do_player_exit_call(S, _From, Uid, _) ->
    ?WARN("~w req exit map ~w ~w, but obj not exists!",
        [Uid, self(), misc:registered_name()]),
    Obj = #m_cache_map_object_priv{uid = Uid, type = ?OBJ_PLAYER},
    ?TRY_CATCH_ERROR(map_rw:del_obj_to_map(Obj), Err1),
    ?TRY_CATCH_ERROR(mod_view:sync_player_exit_map(Obj), Err2),
    ?TRY_CATCH_ERROR(hook_map:on_player_exit(Uid), Err3),
    ?TRY_CATCH_ERROR(dec_line_number(S#m_map_state.mgr_ets, map_rw:line_id()), Err4),
    {reply, ?E_Success, S}.


dec_line_number(Ets, LineId) ->
    case catch misc_ets:update_counter(Ets, LineId, {#m_map_line.in, -1}) of
        Res when is_number(Res), Res < 0 ->
            ?ERROR("~p map player number < 0", [misc:registered_name()]),
            catch misc_ets:update_element(Ets, LineId, {#m_map_line.in, 0});
        _ -> skip
    end,
    ok.

%%-------------------------------------------------------------------
%% WARNING!!! WARNING!!! WARNING!!!
%% call
player_exit_exception_call(S, Uid) ->
    Obj = map_rw:find_unit(?OBJ_PLAYER, Uid),
    ?TRY_CATCH(do_player_exit_call(S, undefined, Uid, Obj)),
    {reply, ?E_Success, S}.

%%-------------------------------------------------------------------
%% WARNING!!! WARNING!!! WARNING!!!
%% call
player_join_call(S, From, #r_join_map_req{uid = Uid, pid = Pid, group = Group, tar_pos = Pos}) ->
    try
        ?DEBUG("map ~p player ~p to ~p", [misc:registered_name(), Uid, Pos]),
        Obj = object_priv:new_player(Pid, Uid, Group, Pos, vector3:new(0.1, 0, 0.5)),
        send_goto_map_msg(Uid, Pos),
        map_rw:add_obj_to_map(Obj),
        map_srv:call_reply(From, ?E_Success),
        ?TRY_CATCH(mod_view:sync_player_join_map(Obj)),
        ?TRY_CATCH(hook_map:on_player_join(Uid), Err1, St1),
        misc_ets:update_counter(S#m_map_state.mgr_ets, map_rw:line_id(), {#m_map_line.in, 1}),
        ?DEBUG("uid ~p, join map ~w, name ~p", [object_priv:get_uid(Obj), self(), misc:registered_name()]),
        {noreply, S}
    catch _ : Error : ST ->
        ?TRY_CATCH_ONLY(map_rw:del_obj_to_map(#m_cache_map_object_priv{uid = Uid, type = ?OBJ_PLAYER})),
        ?ERROR("player join map ~w, name ~p, error ~p, ~p", [self(), misc:registered_name(), Error, ST]),
        {reply, ?E_Exception, S}
    end;
player_join_call(S, _From, Any) ->
    ?ERROR("player join map ~w, name ~p, error obj data ~w",
        [self(), misc:registered_name(), Any]),
    {reply, ?E_Exception, S}.


%%-------------------------------------------------------------------
%% WARNING!!! WARNING!!! WARNING!!!
%% call
force_teleport_call(S, From, #r_teleport_req{uid = Uid, tar = TarPos}) ->
    map_srv:call_reply(From, ok),
    CurPos = object_rw:get_cur_pos(Uid),
    ?TRY_CATCH(mod_move:on_obj_pos_change(Uid, TarPos)),
    ?DEBUG("player ~p teleport from ~w to ~w in map ~p_~p",
        [Uid, CurPos, TarPos, map_rw:map_id(), map_rw:line_id()]),
    {ok, S}.


%%-------------------------------------------------------------------
init_monster(#recGameMapCfg{
    mapMonster = MonsterList
}) ->
    lists:foreach(
        fun(MData) ->
            init_all_monster_1(MData)
        end, MonsterList).

init_all_monster_1(Mdata) ->
    Obj = object_priv:new_monster(Mdata),
    init_all_monster_2(Obj).

init_all_monster_2(Obj) ->
    Uid = object_priv:get_uid(Obj),
    VisIndex = mod_view:pos_to_vis_index(object_rw:get_cur_pos(Uid)),
    map_rw:add_obj_to_map(Obj),
    mod_view:add_obj_to_vis_tile(Obj, VisIndex),
    hook_map:on_monster_create(Uid),
    ?DEBUG("map ~p:~p create monster ~p, uid ~p, visIndex ~p",
        [map_rw:map_id(), map_rw:line_id(), object_priv:get_data_id(Obj), Uid, VisIndex]),
    ok.

%%-------------------------------------------------------------------
init_npc(#recGameMapCfg{
    mapNpc = NpcList
}) ->
    init_all_npc(NpcList).

init_all_npc(_NL) ->
    ok.

%%-------------------------------------------------------------------
tick_msg() -> erlang:send_after(?MAP_TICK, self(), tick_now).

-spec tick(S :: #m_map_state{}) -> #m_map_state{}.
tick(S) ->
    Now = misc_time:milli_seconds(),
    map_rw:update_move_timer(Now),
    S1 = tick_1(S, Now),
    map_rw:check_tick(misc_time:milli_seconds() - Now),
    S1.

tick_1(#m_map_state{status = ?MAP_READY_EXIT, protect_tick = Tick} = S, _Now) when Tick =< 0 ->
    PlayerSize = map_rw:obj_size_with_type(?OBJ_PLAYER),
    ?WARN("**map_~p_~p destroy warning, player size ~p, force stop now",
        [map_rw:map_id(), map_rw:line_id(), PlayerSize]),
    ?TRY_CATCH(real_stop_now(0)),
    S;
tick_1(#m_map_state{status = ?MAP_READY_EXIT, protect_tick = TickMax} = S, _Now) ->
    PlayerSize = map_rw:obj_size_with_type(?OBJ_PLAYER),
    ?TRY_CATCH(real_stop_now(PlayerSize)),
    S#m_map_state{protect_tick = TickMax - 1};
tick_1(S, Now) ->
    ?TRY_CATCH(tick_msg(), Err1, Stk1),
    ?TRY_CATCH(tick_obj(S, Now), Err2, Stk2),
    S.

tick_obj(S, Now) ->
    ?TRY_CATCH(tick_update_before(S, Now), Err1, Stk1),

    % 更新各个对象
    %------------------
    ?TRY_CATCH(tick_player(S, Now), Err2, Stk2),
    ?TRY_CATCH(tick_monster(S, Now), Err3, Stk3),
    ?TRY_CATCH(tick_pet(S, Now), Err4, Stk4),
    ?TRY_CATCH(tick_respawn_monster(S, Now), Err5, Stk5),
    %------------------

    ?TRY_CATCH(tick_update_after(S, Now), Err, Stk),
    ok.

%%-------------------------------------------------------------------
tick_player(_S, Now) ->
    maps:fold(
        fun(_, Uid, _) ->
            tick_player_1(map_rw:find_unit(?OBJ_PLAYER, Uid), Uid, Now)
        end, 0, map_rw:obj_maps_with_type(?OBJ_PLAYER)).

tick_player_1(undefined, Uid, _Now) ->
    %% @todo 加入异常处理删除该玩家
    map_rw:del_uid_from_maps(?OBJ_PLAYER, Uid),
    ?ERROR("tick player ~p may be leave map", [Uid]);
tick_player_1(Obj, _, Now) ->
    ?TRY_CATCH(mod_move:tick(Obj, Now), Err1, Stk1),
    ?TRY_CATCH(mod_combat:tick(Obj, Now), Err2, Stk2),
    ?TRY_CATCH(mod_buff:tick(Obj, Now), Err3, Stk3),
    ok.

%%-------------------------------------------------------------------
tick_monster(_S, Now) ->
    maps:fold(
        fun(_, Uid, _) ->
            tick_monster_1(map_rw:find_unit(?OBJ_MON, Uid), Uid, Now)
        end, 0, map_rw:obj_maps_with_type(?OBJ_MON)).

tick_monster_1(undefined, Uid, _Now) ->
    ?ERROR("tick monster ~p  ~p not exists", [Uid, object_rw:get_data_id(Uid)]);
tick_monster_1(Obj, _, Now) ->
    ?TRY_CATCH(mod_move:tick(Obj, Now), Err1, Stk1),
    ?TRY_CATCH(mod_ai:update(Obj, Now), Err2, Stk2),
    ?TRY_CATCH(mod_combat:tick(Obj, Now), Err3, Stk3),
    ?TRY_CATCH(mod_buff:tick(Obj, Now), Err4, Stk4),
    ok.

%%-------------------------------------------------------------------
tick_pet(_S, Now) ->
    maps:fold(
        fun(_, Uid, _) ->
            tick_pet_1(map_rw:find_unit(?OBJ_PET, Uid), Uid, Now)
        end, 0, map_rw:obj_maps_with_type(?OBJ_PET)).

tick_pet_1(undefined, Uid, _Now) ->
    ?ERROR("tick pet ~p not exists", [Uid]);
tick_pet_1(Obj, _, Now) ->
    ?TRY_CATCH(mod_move:tick(Obj, Now), Err1, Stk1),
    ?TRY_CATCH(mod_combat:tick(Obj, Now), Err2, Stk2),
    ?TRY_CATCH(mod_buff:tick(Obj, Now), Err3, Stk3),
    ok.

%%-------------------------------------------------------------------
tick_respawn_monster(_S, _Now) ->
    ok.

%%-------------------------------------------------------------------
tick_update_before(_S, _Now) -> ok.

tick_update_after(_S, _Now) -> ok.

%%-------------------------------------------------------------------
real_stop_now(0) ->
    ?INFO("~p ~p stop now", [misc:registered_name(), self()]),
    ps:send(self(), stop_immediately);
real_stop_now(_Players) ->
    tick_msg(),
    ok.

%%-------------------------------------------------------------------
-spec start_stop_now(S :: #m_map_state{}) -> #m_map_state{}.
start_stop_now(S) ->
    ?INFO("~p ~p start stop now, kick all ~p player(s)",
        [misc:registered_name(), self(), map_rw:obj_size_with_type(?OBJ_PLAYER)]),
    ?TRY_CATCH(hook_map:on_map_destroy(), Err1, Stk1),
    ?TRY_CATCH(kick_all_player(S), Err2, Stk2),
    S#m_map_state{status = ?MAP_READY_EXIT}.

kick_all_player(_S) ->
    maps:fold(
        fun(_, Uid, _) ->
            ?WARN("~p kick player ~p", [misc:registered_name(), Uid]),
            catch player_interface:change_pre_map_(Uid)
        end, 0, map_rw:obj_maps_with_type(?OBJ_PLAYER)),
    ok.

%%-------------------------------------------------------------------
-spec player_start_move(Req :: #r_player_start_move_req{}) -> ok | error.
player_start_move(Req) ->
    #r_player_start_move_req{uid = Uid, tar = Dst} = Req,
    mod_move:start_player_walk(Uid, object_rw:get_cur_pos(Uid), Dst).

%%-------------------------------------------------------------------
-spec player_stop_move(Req :: #r_player_stop_move_req{}) -> ok | error.
player_stop_move(Req) ->
    #r_player_stop_move_req{uid = Uid, pos = Pos} = Req,
    mod_move:stop_player_move(Uid, Pos).

%%-------------------------------------------------------------------
send_goto_map_msg(Uid, Pos) ->
    Msg = #pk_GS2U_GotoNewMap{
        map_id = map_rw:map_id(),
        x = vector3:x(Pos), y = vector3:z(Pos)
    },
    gs_interface:send_net_msg(Uid, Msg),
    ok.

%%-------------------------------------------------------------------
-spec broadcast_msg(S :: #m_map_state{}, {MsgId :: term()} | {MsgId :: term(), Msg :: term()}) -> ok.
broadcast_msg(_S, {MsgId}) ->
    maps:fold(
        fun(_, Uid, _) ->
            gs_interface:send_msg(Uid, MsgId)
        end, 0, map_rw:obj_maps_with_type(?OBJ_PLAYER)),
    ok;
broadcast_msg(_S, {MsgId, Msg}) ->
    maps:fold(
        fun(_, Uid, _) ->
            gs_interface:send_msg(Uid, MsgId, Msg)
        end, 0, map_rw:obj_maps_with_type(?OBJ_PLAYER)),
    ok.

-spec broadcast_net_msg(S :: #m_map_state{}, NetMsg :: tuple()) -> ok.
broadcast_net_msg(_S, NetMsg) ->
    maps:fold(
        fun(_, Uid, _) ->
            gs_interface:send_net_msg(Uid, NetMsg)
        end, 0, map_rw:obj_maps_with_type(?OBJ_PLAYER)),
    ok.

%%-------------------------------------------------------------------
-spec broadcast_msg_view({Uid :: integer(), MsgId :: term()} | {Uid :: integer(), MsgId :: term(), Msg :: term()}) -> ok.
broadcast_msg_view({Uid, MsgId}) ->
    mod_view:send_msg_to_visual(Uid, MsgId),
    ok;
broadcast_msg_view({Uid, MsgId, Msg}) ->
    mod_view:send_msg_to_visual(Uid, MsgId, Msg),
    ok.

-spec broadcast_net_msg_view({Uid :: integer(), NetMsg :: tuple()}) -> ok.
broadcast_net_msg_view({Uid, NetMsg}) ->
    mod_view:broadcast_net_msg_view(Uid, NetMsg),
    ok.

broadcast_net_msg_view(Uid, NetMsg) ->
    mod_view:send_net_msg_to_visual(Uid, NetMsg),
    ok.

%%-------------------------------------------------------------------
change_group({Uid, GroupId}) ->
    mod_view:sync_player_join_group(Uid, GroupId),
    ok.



