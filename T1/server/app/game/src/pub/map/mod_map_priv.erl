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
-include("pub_rec.hrl").
-include("netmsg.hrl").
-include("gs_cache.hrl").
-include("gs_common_rec.hrl").
-include("cfg_map.hrl").
-include("map_core.hrl").
-include("rec_rw.hrl").


%% 初始化， tick， 开始终止进程
-export([init_priv/1]).
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
-define(MAP_OBJ_DETAIL_ETS, map_obj_detail_ets__).
-define(MAP_EXCL_ETS, map_excl_ets__).
init_priv(#r_map_create_params{
    map_id = MapID, line_id = LineID, mgr_ets = MgrEts,
    creator = Creator, owner_type = Type, owner_params = Param, wait_list = WaitList
}) ->
    ProcessName = misc:create_atom(?MODULE, [MapID, LineID]),
    true = erlang:register(ProcessName, self()),
    Ets0 = misc_ets:new(?MAP_OBJ_DETAIL_ETS, [protected, set, {keypos, #m_object_rw.uid}, ?ETS_RC]),
    Ets1 = misc_ets:new(?MAP_EXCL_ETS, [protected, set, {keypos, #pub_kv.key}, ?ETS_RC]),
    #mapCfg{peopleLimit = Limit, lifetime = Lifetime} = getCfg:getCfgByArgs(cfg_map, MapID),
    RealLifeTime = ?if_else(Lifetime == 0, ?UINT32_MAX, Lifetime),
    RealLimitCnt = ?if_else(Limit == 0, 150, Limit),
    Now = misc_time:milli_seconds(),
    Line = #m_map_line{
        map_id = MapID, line_id = LineID, pid = self(), status = ?MAP_RUNNING,
        limits = RealLimitCnt, obj_ets = Ets0,
        dead_line = Now + RealLifeTime, create_time = Now
    },
    misc_ets:write(MgrEts, Line),
    map_rw:set_owner(Creator, Type, Param, WaitList),
    ps:send(self(), init),

    #m_map_state{map_id = MapID, line_id = LineID, obj_ets = Ets0, mgr_ets = MgrEts, excl_ets = Ets1}.

%%-------------------------------------------------------------------

-spec init(S :: #m_map_state{}) -> #m_map_state{}.

init(S) ->
    Conf = map_creator_interface:map_data(S#m_map_state.map_id),
    ok = map_rw:init(S),
    ok = mod_view:init_vis_tile(Conf),
    ok = mod_copy_priv:init(),
    ok = init_npc(Conf),
    ok = init_monster(Conf),
    
    mod_progress_core:init(),
    tick_msg(),
    ?TRY_CATCH(hook_map:on_map_create()),
    catch ?INFO("~p|~p init ok", [self(), misc:registered_name()]),
    S.


%%-------------------------------------------------------------------
%% WARNING!!! WARNING!!! WARNING!!!
%% call
player_exit_call(S, From, #r_exit_map_req{uid = Uid}) ->
    ObjPriv = object_priv:find_object_priv(?UID_TYPE_PLAYER, Uid),
    Ack = #r_exit_map_ack{error = ?MAP_CHANGE_EXCEPTION, map_id = map_rw:map_id(), line_id = map_rw:line_id()},
    ?TRY_CATCH_RET(do_player_exit_call(S, From, Uid, ObjPriv), {reply, Ack, S}).

do_player_exit_call(S, From, Uid, #m_cache_map_object_priv{} = ObjPriv) ->
    ?INFO("player ~p exit ~p | ~p from ~w", [Uid, self(), misc:registered_name(), From]),

    ?TRY_CATCH_ERROR(map_rw:del_object(ObjPriv), Err1),
    ?TRY_CATCH_ERROR(mod_view:sync_player_exit_map(ObjPriv), Err2),
    ?TRY_CATCH_ERROR(hook_map:on_player_exit(Uid), Err3),
    ?TRY_CATCH_ERROR(dec_line_number(S#m_map_state.mgr_ets, map_rw:line_id()), Err4),
    Ack = #r_exit_map_ack{error = ?MAP_CHANGE_OK, map_id = map_rw:map_id(), line_id = map_rw:line_id()},
    {reply, Ack, S};
do_player_exit_call(S, From, Uid, ObjPriv) ->
    ?WARN("~w req exit map ~w|~w from ~p, but obj is ~w",
        [Uid, self(), misc:registered_name(), From, ObjPriv]),
%%    ObjPriv = #m_cache_map_object_priv{uid = Uid, type = ?OBJ_PLAYER},
%%    ?TRY_CATCH_ERROR(map_rw:del_object(ObjPriv), Err1),
%%    ?TRY_CATCH_ERROR(mod_view:sync_player_exit_map(ObjPriv), Err2),
%%    ?TRY_CATCH_ERROR(hook_map:on_player_exit(Uid), Err3),
%%    ?TRY_CATCH_ERROR(dec_line_number(S#m_map_state.mgr_ets, map_rw:line_id()), Err4),
    Ack = #r_exit_map_ack{error = ?MAP_CHANGE_OK, map_id = map_rw:map_id(), line_id = map_rw:line_id()},
    {reply, Ack, S}.


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
    ObjPriv = object_priv:find_object_priv(?UID_TYPE_PLAYER, Uid),
    ?TRY_CATCH(do_player_exit_call(S, undefined, Uid, ObjPriv)),
    catch ?WARN("player_exit_exception_call(~p), ~w", [Uid, ObjPriv]),
    {reply, ?MAP_CHANGE_OK, S}.

%%-------------------------------------------------------------------
%% WARNING!!! WARNING!!! WARNING!!!
%% call
player_join_call(S, From, #r_join_map_req{uid = Uid, pid = Pid, group = Group, tar_pos = Pos}) ->
    try
        ?DEBUG("map ~p player ~p to ~p", [misc:registered_name(), Uid, Pos]),
        ObjPriv = object_priv:new_player(Pid, Uid, Group, Pos, vector3:new(0.1, 0, 0.5)),
        send_goto_map_msg(Uid, Pos),
        map_rw:add_object(ObjPriv),
        X = misc_ets:update_counter(S#m_map_state.mgr_ets, map_rw:line_id(), {#m_map_line.in, 1}),
        map_srv:call_reply(From, ?MAP_CHANGE_OK),
        ?TRY_CATCH(mod_view:sync_player_join_map(ObjPriv)),
        ?TRY_CATCH(hook_map:on_player_join(Uid), Err1, St1),
        catch ?DEBUG("uid ~p, join map ~w, name ~p, map players ~p",
            [Uid, self(), misc:registered_name(), X]),
        {noreply, S}
    catch _ : Error : ST ->
        ?TRY_CATCH_ONLY(map_rw:del_object(#m_cache_map_object_priv{uid = Uid, type = ?UID_TYPE_PLAYER})),
        catch ?ERROR("player join map ~w, name ~p, error ~p, ~p", [self(), misc:registered_name(), Error, ST]),
        {reply, ?MAP_CHANGE_EXCEPTION, S}
    end;
player_join_call(S, _From, Any) ->
    catch ?ERROR("player join map ~w, name ~p, error obj data ~w",
        [self(), misc:registered_name(), Any]),
    {reply, ?MAP_CHANGE_EXCEPTION, S}.


%%-------------------------------------------------------------------
%% WARNING!!! WARNING!!! WARNING!!!
%% call
force_teleport_call(S, From, #r_teleport_req{uid = Uid, tar = TarPos}) ->
    map_srv:call_reply(From, ok),
    CurPos = object_rw:get_cur_pos(Uid),
    ?TRY_CATCH(mod_move:on_obj_pos_change(Uid, TarPos)),
    ?DEBUG("player ~p teleport from ~w to ~w in map_~p_~p",
        [Uid, CurPos, TarPos, map_rw:map_id(), map_rw:line_id()]),
    {ok, S}.


%%-------------------------------------------------------------------
init_monster(#recGameMapCfg{mapMonster = []}) ->
    ok;
init_monster(#recGameMapCfg{mapMonster = MonsterList}) ->
    lists:foreach
    (
        fun(MData) ->
            ?TRY_CATCH(init_one_monster(MData))
        end,
        MonsterList
    ).

init_one_monster(MData) ->
    ObjPriv = object_priv:new_monster(MData),
    Uid = object_priv:get_uid(ObjPriv),
    VisIndex = mod_view:pos_to_vis_index(object_rw:get_cur_pos(Uid)),
    map_rw:add_object(ObjPriv),
    mod_view:add_obj_to_vis_tile(ObjPriv, VisIndex),
    hook_map:on_monster_create(Uid, object_priv:get_data_id(ObjPriv)),
    ?DEBUG("map_~p_~p create monster ~p, uid ~p, visIndex ~p",
        [map_rw:map_id(), map_rw:line_id(), object_priv:get_data_id(ObjPriv), Uid, VisIndex]),
    ok.

%%-------------------------------------------------------------------
init_npc(#recGameMapCfg{mapNpc = NpcList}) ->
    lists:foreach
    (
        fun(MData) ->
            ?TRY_CATCH(init_one_npc(MData))
        end,
        NpcList
    ).


init_one_npc(Mdata) ->

    ObjPriv = object_priv:new_npc(Mdata),
    Uid = object_priv:get_uid(ObjPriv),
    VisIndex = mod_view:pos_to_vis_index(object_rw:get_cur_pos(Uid)),
    map_rw:add_object(ObjPriv),
    mod_view:add_obj_to_vis_tile(ObjPriv, VisIndex),
    ?DEBUG("map_~p_~p create npc ~p, uid ~p, visIndex ~p",
        [map_rw:map_id(), map_rw:line_id(), object_priv:get_data_id(ObjPriv), Uid, VisIndex]),
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
    PlayerSize = map_rw:obj_size_with_type(?UID_TYPE_PLAYER),
    ?WARN("**map_~p_~p destroy warning, player size ~p, force stop now~n~p",
        [map_rw:map_id(), map_rw:line_id(), PlayerSize, map_rw:obj_maps_with_type(?UID_TYPE_PLAYER)]),
    ?TRY_CATCH(real_stop_now(0)),
    S;
tick_1(#m_map_state{status = ?MAP_READY_EXIT, protect_tick = TickMax} = S, _Now) ->
    PlayerSize = map_rw:obj_size_with_type(?UID_TYPE_PLAYER),
    ?TRY_CATCH(real_stop_now(PlayerSize)),
    S#m_map_state{protect_tick = TickMax - 1};
tick_1(S, Now) ->
    ?TRY_CATCH(tick_obj(S, Now), Err2, Stk2),
    ?TRY_CATCH(tick_msg(), Err1, Stk1),
    S.

tick_obj(S, Now) ->
    ?TRY_CATCH(tick_update_before(S, Now), Err1, Stk1),

    % 更新各个对象
    %------------------
    ?TRY_CATCH(mod_progress_core:tick(Now), Err1_1, Stk1_1),
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
            catch tick_player_1(object_priv:find_object_priv(?UID_TYPE_PLAYER, Uid), Uid, Now)
        end, 0, map_rw:obj_maps_with_type(?UID_TYPE_PLAYER)).

tick_player_1(undefined, Uid, _Now) ->
    map_rw:del_uid_from_maps(?UID_TYPE_PLAYER, Uid),
    ?ERROR("tick player ~p may be leave map", [Uid]);
tick_player_1(ObjPriv, _, Now) ->
    ?TRY_CATCH(mod_move:tick(ObjPriv, Now), Err1, Stk1),
    ?TRY_CATCH(mod_buff:tick(ObjPriv, Now), Err3, Stk3),
    ok.

%%-------------------------------------------------------------------
tick_monster(_S, Now) ->
    maps:fold(
        fun(_, Uid, _) ->
            catch tick_monster_1(object_priv:find_object_priv(?UID_TYPE_MON, Uid), Uid, Now)
        end, 0, map_rw:obj_maps_with_type(?UID_TYPE_MON)).

tick_monster_1(undefined, Uid, _Now) ->
    ?ERROR("tick monster ~p  ~p not exists", [Uid, object_rw:get_data_id(Uid)]);
tick_monster_1(ObjPriv, _, Now) ->
    ?TRY_CATCH(mod_move:tick(ObjPriv, Now), Err1, Stk1),
    ?TRY_CATCH(mod_ai:update(ObjPriv, Now), Err2, Stk2),
    ?TRY_CATCH(mod_buff:tick(ObjPriv, Now), Err4, Stk4),
    ok.

%%-------------------------------------------------------------------
tick_pet(_S, Now) ->
    maps:fold(
        fun(_, Uid, _) ->
            catch tick_pet_1(object_priv:find_object_priv(?UID_TYPE_PET, Uid), Uid, Now)
        end, 0, map_rw:obj_maps_with_type(?UID_TYPE_PET)).

tick_pet_1(undefined, Uid, _Now) ->
    ?ERROR("tick pet ~p not exists", [Uid]);
tick_pet_1(ObjPriv, _, Now) ->
    ?TRY_CATCH(mod_move:tick(ObjPriv, Now), Err1, Stk1),
    ?TRY_CATCH(mod_buff:tick(ObjPriv, Now), Err3, Stk3),
    ok.

%%-------------------------------------------------------------------
tick_respawn_monster(_S, _Now) ->
    ok.

%%-------------------------------------------------------------------
tick_update_before(_S, _Now) -> ok.

tick_update_after(_S, _Now) -> ok.

%%-------------------------------------------------------------------
real_stop_now(0) ->
    ?INFO("~p|~p stop now", [self(), misc:registered_name()]),
    clear_all_obj(),
    ps:send(self(), stop_immediately);
real_stop_now(_Players) ->
    tick_msg(),
    ok.

clear_all_obj() ->
    do_clear_all_obj(?UID_TYPE_MON, ?ETS_CACHE_MAP_MONSTER_PRIV),
    do_clear_all_obj(?UID_TYPE_NPC, ?ETS_CACHE_MAP_NPC_PRIV),
    do_clear_all_obj(?UID_TYPE_PET, ?ETS_CACHE_MAP_PET_PRIV),
    ok.

do_clear_all_obj(Type, Ets) ->
    maps:fold(
        fun(_, Uid, _) ->
            misc_ets:delete(Ets, Uid)
        end, 0, map_rw:obj_maps_with_type(Type)),
    ok.

%%-------------------------------------------------------------------
-spec start_stop_now(S :: #m_map_state{}) -> #m_map_state{}.
start_stop_now(S) ->
    ?INFO("~p|~p start stop now, kick all ~p player(s)",
        [self(), misc:registered_name(), map_rw:obj_size_with_type(?UID_TYPE_PLAYER)]),
    ?TRY_CATCH(hook_map:on_map_destroy(), Err1, Stk1),
    ?TRY_CATCH(mod_map_pub:kick_all_player(), Err2, Stk2),
    S#m_map_state{status = ?MAP_READY_EXIT}.


%%-------------------------------------------------------------------
-spec player_start_move(Req :: #r_player_start_move_req{}) -> ok | error.
player_start_move(Req) ->
    #r_player_start_move_req{uid = Uid, tar = Dst, speed = Speed} = Req,
    mod_move:start_player_walk(Uid, object_rw:get_cur_pos(Uid), Dst, Speed).

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
    mod_map_pub:broadcast_msg(MsgId),
    ok;
broadcast_msg(_S, {MsgId, Msg}) ->
    mod_map_pub:broadcast_msg(MsgId, Msg),
    ok.

-spec broadcast_net_msg(S :: #m_map_state{}, NetMsg :: tuple()) -> ok.
broadcast_net_msg(_S, NetMsg) ->
    mod_map_pub:broadcast_net_msg(NetMsg),
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
    mod_view:send_net_msg_to_visual(Uid, NetMsg),
    ok.

broadcast_net_msg_view(Uid, NetMsg) ->
    mod_view:send_net_msg_to_visual(Uid, NetMsg),
    ok.

%%-------------------------------------------------------------------
change_group({Uid, GroupId}) ->
    mod_view:sync_player_join_group(Uid, GroupId),
    ok.



