%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%% 上线 进入上次退出的地图，如果失败就直接返回出生地
%%% 游戏 如果目标地图存在则先退出在进入，如果失败返回出生地
%%% 游戏 如果目标地图不存在，则会切地图失败
%%% @end
%%% Created : 14. 六月 2018 14:23
%%%-------------------------------------------------------------------
-module(player_map_priv).
-author("mawenhong").
-include("logger.hrl").
-include("map_core.hrl").
-include("pub_rec.hrl").

-include("gs_cache.hrl").
-include("db_record.hrl").
-include("gs_common_rec.hrl").
-include("player_status.hrl").
%% API

%%--------------------------------
%% WARNING!!! WARNING!!! WARNING!!!
%% call
%% todo teleport_call / offline_call 是需要call调用，等后面来确定

-export([
    online_call/1, offline_call/4, serve_change_map_call/3,
    teleport_call/1, return_to_old_map_call/0
]).


%%-------------------------------------------------------------------
teleport_call(NewPos) ->
    #m_player_map{map_pid = MPid} = player_rw:get_map(),
    do_teleport_call(MPid, NewPos).

do_teleport_call(undefined, _NewPos) ->
    ?ERROR("");
do_teleport_call(MapPid, NewPos) ->
    Uid = player_rw:get_uid(),
    ok = map_interface:player_teleport_call(
        MapPid,
        #r_teleport_req{uid = Uid, tar = NewPos}
    ),
    ok.

%%-------------------------------------------------------------------
online_call(Player) ->
    #p_player{
        uid = Uid, map_id = Mid, x = X, y = Y,
        old_map_id = OldMid, old_line = OldLine, old_x = OX, old_y = OY
    } = Player,
    
    Pos = vector3:new(OX, 0, OY),
    Tar = vector3:new(X, 0, Y),
    Req = #r_change_map_req{
        uid = Uid, pid = self(),
        map_id = OldMid, line_id = OldLine, pos = Pos,
        tar_map_id = Mid, tar_pos = Tar
    },
    Ack = do_online_call(Mid, Req),
    
    serve_change_map_call_ret(OldMid, OldLine, Pos, Ack, Req, login),
    ok.

do_online_call(MapID, Req) ->
    Uid = player_rw:get_uid(),
    Mgr = map_creator_interface:map_mgr_lr(Uid, MapID),
    do_online_call_1(Mgr, Req).

%%
do_online_call_1(undefined, Req) ->
    #r_change_map_ack{error = -4, map_id = Req#r_change_map_req.map_id};
do_online_call_1(Mgr, Req) ->
    case map_mgr_interface:player_join_map_call(Mgr, Req) of
        #r_change_map_ack{} = Ack -> Ack;
        _ -> #r_change_map_ack{error = -5, map_id = Req#r_change_map_req.map_id}
    end.


%%-------------------------------------------------------------------
serve_change_map_call(DestMapID, DestLineId, TarPos) ->
    player_rw:set_status(?PS_CHANGE_MAP),
    Uid = player_rw:get_uid(),
    #m_cache_online_player{map_id = Mid, line = Line, map_pid = MPid, pos = Pos} = gs_cache_interface:get_online_player(Uid),
    player_cross_priv:change_map_before(Mid, DestMapID),
    
    Req = #r_change_map_req{
        uid = Uid, pid = self(),
        map_id = Mid, line_id = Line, map_pid = MPid, pos = Pos,
        tar_map_id = DestMapID, tar_line_id = DestLineId, tar_pos = TarPos
    },
    
    Ack = do_serve_change_map_call(Req),
    serve_change_map_call_ret(Mid, Line, Pos, Ack, Req, gaming),
    ok.

%%-------------------------------------------------------------------
do_serve_change_map_call(Req) ->
    #r_change_map_req{
        uid = Uid, tar_map_id = TMid,
        map_id = Mid, line_id = LineId, map_pid = Mpid
    } = Req,
    CurMgr = map_creator_interface:map_mgr_lr(Uid, Mid),
    TarMgr = map_creator_interface:map_mgr_lr(Uid, TMid),
    ?INFO("player ~p, changeMap map_~p_~p:~p -> map ~p",
        [Uid, Mid, LineId, Mpid, TMid]),
    ExitRes = do_serve_change_map_call_exit(CurMgr, TarMgr, Req),
    do_serve_change_map_call_join(ExitRes, TarMgr, Req).

%% 先退出
do_serve_change_map_call_exit(undefined, undefined, #r_change_map_req{map_id = Mid}) ->
    #r_change_map_ack{error = -666, map_id = Mid};
do_serve_change_map_call_exit(_CurMgr, undefined, #r_change_map_req{map_id = Mid}) ->
    #r_change_map_ack{error = -777, map_id = Mid};
do_serve_change_map_call_exit(undefined, _CurMgr, #r_change_map_req{map_id = Mid}) ->
    #r_change_map_ack{error = -888, map_id = Mid};
do_serve_change_map_call_exit(CurMgr, _TarMgr, #r_change_map_req{
    uid = Uid, map_id = Mid, line_id = LineId, map_pid = Mpid
}) ->
    map_mgr_interface:player_exit_map_call(CurMgr,
        #r_exit_map_req{map_id = Mid, line_id = LineId, map_pid = Mpid, uid = Uid}).

%% 在进入
do_serve_change_map_call_join(error, _TarMgr, #r_change_map_req{map_id = Mid}) ->
    #r_change_map_ack{error = -7, map_id = Mid};
do_serve_change_map_call_join(#r_change_map_ack{} = Ack, _TarMgr, _Req) ->
    Ack;
do_serve_change_map_call_join(_Any, undefined, #r_change_map_req{
    uid = Uid, tar_map_id = TMid, map_id = Mid}
) ->
    ?ERROR("player[~p] tar map[~p] not exists, goto born map", [Uid, TMid]),
    #r_change_map_ack{error = -8, map_id = Mid};
do_serve_change_map_call_join(_Any, TarMgr, Req) ->
    case map_mgr_interface:player_join_map_call(TarMgr, Req) of
        #r_change_map_ack{} = Ack -> Ack;
        _ -> #r_change_map_ack{error = -9, map_id = Req#r_change_map_req.map_id}
    end.

%%-------------------------------------------------------------------
serve_change_map_call_ret(
    OldMid, OldLineId, OldPos,
    #r_change_map_ack{
        error = 0,
        map_id = Mid, line_id = LineId,
        map_pid = MPid, pos = Pos
    }, _Req, _Flag) ->
    Uid = player_rw:get_uid(),
    gs_cache_interface:update_online_player(
        Uid,
        [
            {#m_cache_online_player.old_map_id, OldMid},
            {#m_cache_online_player.old_line, OldLineId},
            {#m_cache_online_player.old_pos, OldPos},
            {#m_cache_online_player.map_id, Mid},
            {#m_cache_online_player.line, LineId},
            {#m_cache_online_player.map_pid, MPid},
            {#m_cache_online_player.pos, Pos}
        ]
    ),
    player_rw:set_map(
        #m_player_map{map_id = Mid, line_id = LineId, map_pid = MPid}
    ),
    player_cross_priv:change_map_after(OldMid, Mid, true),
    ?WARN("player ~p enter map_~p_~p map_pid ~p", [Uid, Mid, LineId, MPid]),
    hook_player:on_change_map(Mid, Mid),
    
    player_rw:set_status(?PS_GAME),
    ok;
serve_change_map_call_ret(
    OldMid, OldLineId, _OldPos,
    #r_change_map_ack{error = Err, map_id = Mid} = Ack, Req, Flag
) ->
    player_cross_priv:change_map_after(OldMid, Mid, false),
    
    ?ERROR("player ~p change from map ~p:~p to map ~p failed with ~p",
        [player_rw:get_uid(), OldMid, OldLineId, Mid, Err]),
    
    serve_change_map_call_fail(Flag, Req, Ack),
    ok.

serve_change_map_call_fail(born_map, _Req, #r_change_map_ack{error = Error, map_id = Mid}) ->
    %% todo 告诉客户端切地图失败
    Uid = player_rw:get_uid(),
    ?FATAL("fatal error ~p, player[~p]can not enter the born map ~p", [Error, Uid, Mid]),
    player_pub:stop("online can't join map");
serve_change_map_call_fail(gaming, _Req, _Ack) ->
    %% todo 告诉客户端切地图失败
    player_rw:set_status(?PS_GAME);
serve_change_map_call_fail(_, Req, _Ack) ->
    kick_to_born_map(Req).

%%-------------------------------------------------------------------
return_to_old_map_call() ->
    Uid = player_rw:get_uid(),
    #m_cache_online_player{
        map_pid = Mid, old_map_id = OMid, old_line = OLineId, old_pos = OPos
    } = gs_cache_interface:get_online_player(Uid),
    ?DEBUG("player ~p return_to_pre_map from ~p to ~p", [Uid, Mid, OMid]),
    serve_change_map_call(OMid, OLineId, OPos),
    ok.

%%-------------------------------------------------------------------
offline_call(Uid, MapID, LineId, MapPid) ->
    Mgr = map_creator_interface:map_mgr_lr(Uid, MapID),
    map_mgr_interface:player_exit_map_call(
        Mgr,
        #r_exit_map_req{map_id = MapID, line_id = LineId, map_pid = MapPid, uid = Uid}
    ),
    ok.

%%-------------------------------------------------------------------
kick_to_born_map(Req) ->
    Uid = player_rw:get_aid(),
    Mid = map_creator_interface:born_map_id(),
    Pos = map_creator_interface:born_map_pos(),
    Mgr = map_creator_interface:map_mgr_lr(Uid, Mid),
    Old = Req#r_change_map_req.tar_map_id,
    ?WARN(" player[~p] can't enter ~p kick to born map ~p", [Uid, Old, Mid]),
    
    Ack = map_mgr_interface:player_join_map_call(
        Mgr, Req#r_change_map_req{tar_map_id = Mid, tar_pos = Pos}),
    
    serve_change_map_call_ret(
        Req#r_change_map_req.map_id,
        Req#r_change_map_req.line_id,
        Req#r_change_map_req.tar_pos,
        Ack, Req, born_map
    ),
    ok.

