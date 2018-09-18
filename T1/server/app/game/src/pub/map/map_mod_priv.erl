%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 10. 五月 2018 19:57
%%%-------------------------------------------------------------------
-module(map_mod_priv).
-author("mawenhong").

-include("logger.hrl").
-include("pub_def.hrl").
-include("netmsg.hrl").
-include("gs_cache.hrl").
-include("gs_common_rec.hrl").
-include("cfg_map.hrl").
-include("map_core.hrl").


%% 初始化， tick， 开始终止进程
-export([init/1, tick/1, start_stop_now/1]).
-export([player_start_move/1, player_stop_move/1]).
-export([broadcast_msg/2, broadcast_net_msg/2, broadcast_msg_view/1, broadcast_net_msg_view/1]).

%%--------------------------------
%% WARNING!!! WARNING!!! WARNING!!!
%% call
%% 基础代码调用的玩家上线，下线、切地图、同地图传送
-export([player_join_call/3]).
-export([player_exit_call/3]).
-export([force_teleport_call/3]).
%%--------------------------------

%%-------------------------------------------------------------------
-spec init(S :: #m_map_state{}) -> #m_map_state{}.
init(S) ->
    Conf = map_creator_interface:map_data(S#m_map_state.map_id),
    ok = map_rw:init(S),
    ok = map_view:init_vis_tile(Conf),
    ok = init_npc(Conf),
    ok = init_monster(Conf),
    tick_msg(),
    ?TRY_CATCH(hook_map:on_map_create()),
    S.


%%-------------------------------------------------------------------
%% WARNING!!! WARNING!!! WARNING!!!
%% call
player_exit_call(S, From, #r_exit_map_req{uid = Uid}) ->
    Obj = map_rw:get_player(Uid),
    ?TRY_CATCH_RET(do_player_exit_call(S, From, Uid, Obj), {reply, error, S}).

do_player_exit_call(S, _From, Uid, #m_cache_map_object{} = Obj) ->
    ?INFO("player ~p exit map ~p:~p:~p",
        [Uid, map_rw:get_map_id(), map_rw:get_line_id(), self()]),

    map_rw:del_obj_to_map(Obj),

    ?TRY_CATCH(map_view:sync_player_exit_map(Obj)),
    ?TRY_CATCH(hook_map:on_player_exit(Uid), Err1, St1),
    {reply, ok, S};
do_player_exit_call(S, _From, Uid, _Obj) ->
    ?ERROR("~w req exit map ~w ~w, but obj not exists!",
        [Uid, self(), misc:registered_name()]),
    map_rw:set_player_map(maps:remove(Uid, map_rw:get_player_map())),
    {reply, error, S}.

%%-------------------------------------------------------------------
%% WARNING!!! WARNING!!! WARNING!!!
%% call
player_join_call(S, From, #r_change_map_req{uid = Uid, pid = Pid, group = Group, tar_pos = Pos}) ->
    try
        ?DEBUG("player ~p to ~p", [Uid, Pos]),
        Obj = object_core:new_player(Pid, Uid, Group, Pos, vector3:new(0.1, 0, 0.5)),
        send_goto_map_msg(Uid, Pos),
        map_rw:add_obj_to_map(Obj),
        map_srv:call_reply(From, ok),
        ?TRY_CATCH(map_view:sync_player_join_map(Obj)),
        ?TRY_CATCH(hook_map:on_player_join(Uid), Err1, St1),
        ?DEBUG("uid ~p, join map ~w, name ~p", [object_core:get_uid(Obj), self(), misc:registered_name()]),
        {noreply, S}
    catch _ : Error : ST ->
        ?ERROR("player join map ~w, name ~p, error ~p, ~p", [self(), misc:registered_name(), Error, ST]),
        {reply, error, S}
    end;
player_join_call(S, _From, Any) ->
    ?ERROR("player join map ~w, name ~p, error obj data ~w",
        [self(), misc:registered_name(), Any]),
    {reply, error, S}.


%%-------------------------------------------------------------------
%% WARNING!!! WARNING!!! WARNING!!!
%% call
force_teleport_call(S, From, #r_teleport_req{uid = Uid, tar = TarPos}) ->
    map_srv:call_reply(From, ok),
    Cur = object_rw:get_cur_pos(Uid),
    ?TRY_CATCH(move_mod:on_obj_pos_change(Uid, TarPos)),
    ?DEBUG("player ~p teleport from ~w to ~w in map ~p_~p",
        [Uid, Cur, TarPos, map_rw:get_map_id(), map_rw:get_line_id()]),
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
    Obj = object_core:new_monster(Mdata),
    init_all_monster_2(Obj).

init_all_monster_2(Obj) ->
    Uid = object_core:get_uid(Obj),
    VisIndex = map_view:pos_to_vis_index(object_rw:get_cur_pos(Uid)),
    map_rw:add_obj_to_map(Obj),
    map_view:add_obj_to_vis_tile(Obj, VisIndex),
    hook_map:on_monster_create(Uid),
    ?DEBUG("map ~p:~p create monster ~p, uid ~p, visIndex ~p",
        [map_rw:get_map_id(), map_rw:get_line_id(), object_core:get_data_id(Obj), Uid, VisIndex]),
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
    map_rw:update_move_timer(),
    tick_1(S).

tick_1(#m_map_state{status = ?MAP_READY_EXIT, protect_tick = Tick} = S) when Tick =< 0 ->
    PlayerSize = map_rw:get_player_size(),
    ?FATAL("map_~p_~p destroy error, player size ~p, force stop now",
        [map_rw:get_map_id(), map_rw:get_line_id(), PlayerSize]),
    ?TRY_CATCH(real_stop_now(0)),
    S;
tick_1(#m_map_state{status = ?MAP_READY_EXIT, protect_tick = TickMax} = S) ->
    PlayerSize = map_rw:get_player_size(),
    ?TRY_CATCH(real_stop_now(PlayerSize)),
    S#m_map_state{protect_tick = TickMax - 1};
tick_1(S) ->
    ?TRY_CATCH(tick_msg(), Err1, Stk1),
    ?TRY_CATCH(tick_obj(S), Err2, Stk2),
    S.

tick_obj(S) ->
    ?TRY_CATCH(tick_update_before(S), Err1, Stk1),

    % 更新各个对象
    %------------------
    ?TRY_CATCH(tick_player(S), Err2, Stk2),
    ?TRY_CATCH(tick_monster(S), Err3, Stk3),
    ?TRY_CATCH(tick_pet(S), Err4, Stk4),
    %------------------

    ?TRY_CATCH(tick_update_after(S), Err5, Stk5),
    ok.

%%-------------------------------------------------------------------
tick_player(_S) ->
    maps:fold(
        fun(_, Uid, _) ->
            tick_player_1(map_rw:get_player(Uid), Uid)
        end, 0, map_rw:get_player_map()).

tick_player_1(undefined, Uid) ->
    %% @todo 加入异常处理删除该玩家
    ?ERROR("player ~p may be leave map", [Uid]);
tick_player_1(Obj, _) ->
    ?TRY_CATCH(move_mod:update(Obj), Err1, Stk1),
    ?TRY_CATCH(combat_mod:tick(Obj), Err2, Stk2),
    ok.

%%-------------------------------------------------------------------
tick_monster(_S) ->
    maps:fold(
        fun(_, Uid, _) ->
            tick_monster_1(map_rw:get_monster(Uid), Uid)
        end, 0, map_rw:get_monster_map()).

tick_monster_1(undefined, Uid) ->
    ?ERROR("monster ~p  ~p not exists", [Uid, object_rw:get_data_id(Uid)]);
tick_monster_1(Obj, _) ->
    ?TRY_CATCH(move_mod:update(Obj), Err1, Stk1),
    ?TRY_CATCH(ai_mod:update(Obj), Err2, Stk2),
    ?TRY_CATCH(combat_mod:tick(Obj), Err3, Stk3),
    ok.

%%-------------------------------------------------------------------
tick_pet(_S) ->
    maps:fold(
        fun(_, Uid, _) ->
            tick_pet_1(map_rw:get_pet(Uid), Uid)
        end, 0, map_rw:get_pet_map()).

tick_pet_1(undefined, Uid) ->
    ?ERROR("pet ~p not exists", [Uid]);
tick_pet_1(Obj, _) ->
    ?TRY_CATCH(move_mod:update(Obj), Err1, Stk1),
    ?TRY_CATCH(combat_mod:tick(Obj), Err2, Stk2),
    ok.

%%-------------------------------------------------------------------
tick_update_before(_S) -> ok.

tick_update_after(_S) -> ok.

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
    ?INFO("~p ~p start stop now, kick all player(s)",
        [misc:registered_name(), self()]),
    ?TRY_CATCH(hook_map:on_map_destroy(), Err1, Stk1),
    ?TRY_CATCH(kick_all_player(S), Err2, Stk2),
    S#m_map_state{status = ?MAP_READY_EXIT}.

kick_all_player(_S) ->
    maps:fold(
        fun(_, Uid, _) ->
            catch gs_interface:send_msg(Uid, return_to_pre_map_req)
        end, 0, map_rw:get_player_map()),
    ok.

%%-------------------------------------------------------------------
-spec player_start_move(Req :: #r_player_start_move_req{}) -> ok | error.
player_start_move(Req) ->
    #r_player_start_move_req{uid = Uid, tar = Dst} = Req,
    move_mod:start_player_walk(Uid, object_rw:get_cur_pos(Uid), Dst).

%%-------------------------------------------------------------------
-spec player_stop_move(Req :: #r_player_stop_move_req{}) -> ok | error.
player_stop_move(Req) ->
    #r_player_stop_move_req{uid = Uid, pos = Pos} = Req,
    move_mod:stop_player_move(Uid, Pos).

%%-------------------------------------------------------------------
send_goto_map_msg(Uid, Pos) ->
    Msg = #pk_GS2U_GotoNewMap{
        map_id = map_rw:get_map_id(),
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
        end, 0, map_rw:get_player_map()),
    ok;
broadcast_msg(_S, {MsgId, Msg}) ->
    maps:fold(
        fun(_, Uid, _) ->
            gs_interface:send_msg(Uid, MsgId, Msg)
        end, 0, map_rw:get_player_map()),
    ok.

-spec broadcast_net_msg(S :: #m_map_state{}, NetMsg :: tuple()) -> ok.
broadcast_net_msg(_S, NetMsg) ->
    maps:fold(
        fun(_, Uid, _) ->
            gs_interface:send_net_msg(Uid, NetMsg)
        end, 0, map_rw:get_player_map()),
    ok.

%%-------------------------------------------------------------------
-spec broadcast_msg_view({Uid :: integer(), MsgId :: term()} | {Uid :: integer(), MsgId :: term(), Msg :: term()}) -> ok.
broadcast_msg_view({Uid, MsgId}) ->
    map_view:send_msg_to_visual(Uid, MsgId),
    ok;
broadcast_msg_view({Uid, MsgId, Msg}) ->
    map_view:send_msg_to_visual(Uid, MsgId, Msg),
    ok.

-spec broadcast_net_msg_view({Uid :: integer(), NetMsg :: tuple()}) -> ok.
broadcast_net_msg_view({Uid, NetMsg}) ->
    map_view:send_net_msg_to_visual(Uid, NetMsg),
    ok.




