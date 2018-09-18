%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
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
    Uid = player_rw:get_uid(),
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

    Tar = vector3:new(X, 0, Y),
    Ack = do_online_call(
        Mid,
        #r_change_map_req{uid = Uid, pid = self(), tar_map_id = Mid, tar_pos = Tar}
    ),

    serve_change_map_call_ret(OldMid, OldLine, vector3:new(OX, 0, OY), Ack, login),
    ok.

do_online_call(MapID, Req) ->
    Uid = player_rw:get_uid(),
    Mgr = map_creator_interface:map_mgr_lr(Uid, MapID),
    do_online_call_1(Mgr, Req).

%%
do_online_call_1(undefined, Req) ->
    goto_born_map(Req);
do_online_call_1(Mgr, Req) ->
    case map_mgr_interface:player_join_map_call(Mgr, Req) of
        #r_change_map_ack{} = Ack -> Ack;
        _ -> goto_born_map(Req)
    end.


%%-------------------------------------------------------------------
serve_change_map_call(DestMapID, DestLineId, TarPos) ->
    player_rw:set_status(?PS_CHANGE_MAP),
    Uid = player_rw:get_uid(),
    #m_cache_online_player{map_id = Mid, line = Line, map_pid = MPid, pos = Pos} = gs_cache_interface:get_online_player(Uid),
    player_cross_priv:change_map_before(Mid, DestMapID),
    Ack = do_serve_change_map_call(
        #r_change_map_req{
            uid = Uid, pid = self(),
            map_id = Mid, line_id = Line, map_pid = MPid,
            tar_map_id = DestMapID, tar_line_id = DestLineId, tar_pos = TarPos
        }
    ),

    serve_change_map_call_ret(Mid, Line, Pos, Ack, gaming),
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
    ExitRet =
        case CurMgr of
            undefined ->
                ?FATAL("player[~p] cur map[~p] mgr not exists", [Uid, Mid]),
                error;
            _ ->
                map_mgr_interface:player_exit_map_call(CurMgr,
                    #r_exit_map_req{map_id = Mid, line_id = LineId, map_pid = Mpid, uid = Uid})
        end,
    case ExitRet of
        error -> #r_change_map_ack{error = -1, map_id = Mid};
        _ ->
        case TarMgr of
            undefined ->
                ?ERROR("player[~p] tar map[~p] not exists, goto born map", [Uid, TMid]),
                goto_born_map(Req);
            _ ->
                case map_mgr_interface:player_join_map_call(TarMgr, Req) of
                    #r_change_map_ack{} = Ack -> Ack;
                    _ -> goto_born_map(Req)
                end
        end
    end.


%%-------------------------------------------------------------------
serve_change_map_call_ret(
    OldMid, OldLineId, OldPos,
    #r_change_map_ack{
        error = 0,
        map_id = Mid, line_id = LineId,
        map_pid = MPid, pos = Pos
    }, _Flag) ->
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
    #r_change_map_ack{error = Err, map_id = Mid}, Flag
) ->
    player_cross_priv:change_map_after(OldMid, Mid, false),

    ?ERROR("player ~p change from map ~p:~p to map ~p failed with ~p",
        [player_rw:get_uid(), OldMid, OldLineId, Mid, Err]),
    case Flag of
        gaming -> player_rw:set_status(?PS_GAME);
        _Flag -> player_pub:stop("online can't join map")
    end,
    %% todo 告诉客户端切地图失败
    ok.

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
goto_born_map(Req) ->
    Uid = player_rw:get_aid(),
    Mid = map_creator_interface:born_map_id(),
    Pos = map_creator_interface:born_map_pos(),
    Mgr = map_creator_interface:map_mgr_lr(Uid, Mid),
    ?WARN("kick player[~p] to born map", [Req#r_change_map_req.uid]),

    case map_mgr_interface:player_join_map_call(
        Mgr,
        Req#r_change_map_req{tar_map_id = Mid, tar_pos = Pos}
    ) of
        #r_change_map_ack{} = Ack -> Ack;
        _ ->
            ?FATAL("fatal error, player[~p]can not enter the born map",
                [Req#r_change_map_req.uid]),
            #r_change_map_ack{error = -9999, map_id = Mid}
    end.

