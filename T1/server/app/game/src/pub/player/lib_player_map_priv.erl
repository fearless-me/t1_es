%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 14. 六月 2018 14:23
%%%-------------------------------------------------------------------
-module(lib_player_map_priv).
-author("mawenhong").
-include("logger.hrl").
-include("gs_map_inc.hrl").
-include("pub_rec.hrl").

-include("gs_mem_rec.hrl").
-include("gs_db_rec.hrl").
-include("gs_common_rec.hrl").
-include("gs_player_status.hrl").
%% API

%%--------------------------------
%% WARNING!!! WARNING!!! WARNING!!!
%% call
%% todo teleport_call / offline_call 是需要call调用，等后面来确定

-export([
    online_call/1, offline_call/4, serv_change_map_call/3,
    teleport_call/1, return_to_old_map_call/0
]).


%%-------------------------------------------------------------------
teleport_call(NewPos) ->
    Uid = lib_player_rw:get_uid(),
    #m_player_pub{mpid = MPid} = gs_cache_interface:get_player_pub(Uid),
    do_teleport_call(MPid, NewPos).

do_teleport_call(undefined, _NewPos) ->
    ?ERROR("");
do_teleport_call(MapPid, NewPos) ->
    Uid = lib_player_rw:get_uid(),
    ok = gs_map_interface:player_teleport_call(
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

    serv_change_map_call_ret(OldMid, OldLine, vector3:new(OX, 0, OY), Ack, login),
    ok.

do_online_call(MapID, Req) ->
    Aid = lib_player_rw:get_aid(),
    Mgr = gs_map_creator_interface:map_mgr_lr(Aid, MapID),
    do_online_call_1(Mgr, Req).

%%
do_online_call_1(undefined, Req) ->
    goto_born_map(Req);
do_online_call_1(Mgr, Req) ->
    case gs_map_mgr_interface:player_join_map_call(Mgr, Req) of
        #r_change_map_ack{} = Ack -> Ack;
        _ -> goto_born_map(Req)
    end.


%%-------------------------------------------------------------------
serv_change_map_call(DestMapID, DestLineId, TarPos) ->
    lib_player_rw:set_status(?PS_CHANGE_MAP),
    Uid = lib_player_rw:get_uid(),
    #m_player_pub{mid = Mid, line = Line, mpid = MPid, pos = Pos} = gs_cache_interface:get_player_pub(Uid),
    lib_player_cross:change_map_before(Mid, DestMapID),
    Ack = serv_change_map_call_cation(
        #r_change_map_req{
            uid = Uid, pid = self(),
            map_id = Mid, line_id = Line, map_pid = MPid,
            tar_map_id = DestMapID, tar_line_id = DestLineId, tar_pos = TarPos
        }
    ),

    serv_change_map_call_ret(Mid, Line, Pos, Ack, gaming),
    ok.

%%-------------------------------------------------------------------
serv_change_map_call_cation(Req) ->
    #r_change_map_req{
        uid = Uid, tar_map_id = TMid,
        map_id = Mid, line_id = LineId, map_pid = Mpid
    } = Req,
    Aid = lib_player_rw:get_aid(),
    CurMgr = gs_map_creator_interface:map_mgr_lr(Aid, Mid),
    TarMgr = gs_map_creator_interface:map_mgr_lr(Aid, TMid),
    ?INFO("player ~p, changeMap map_~p_~p:~p -> map ~p",
        [Uid, Mid, LineId, Mpid, TMid]),
    ExitRet =
        case CurMgr of
            undefined ->
                ?FATAL("player[~p] cur map[~p] not exists", [Uid, Mid]),
                error;
            _ ->
                gs_map_mgr_interface:player_exit_map_call(CurMgr,
                    #r_exit_map_req{map_id = Mid, line_id = LineId, map_pid = Mpid, uid = Uid})
        end,
    case ExitRet of
        error ->
            #r_change_map_ack{error = -1, map_id = Mid};
        _ ->
            case TarMgr of
                undefined ->
                    ?ERROR("player[~p] tar map[~p] not exists", [Uid, TMid]),
                    goto_born_map(Req);
                _ ->
                    case gs_map_mgr_interface:player_join_map_call(TarMgr, Req) of
                        #r_change_map_ack{} = Ack -> Ack;
                        _ -> goto_born_map(Req)
                    end
            end
    end.


%%-------------------------------------------------------------------
serv_change_map_call_ret(
    OldMid, OldLineId, OldPos,
    #r_change_map_ack{
        error = 0,
        map_id = Mid, line_id = LineId,
        map_pid = MPid, pos = Pos
    }, _Flag) ->
    Uid = lib_player_rw:get_uid(),
    gs_cache_interface:update_player_pub(
        Uid,
        [
            {#m_player_pub.old_mid, OldMid},
            {#m_player_pub.old_line, OldLineId},
            {#m_player_pub.old_pos, OldPos},
            {#m_player_pub.mid, Mid},
            {#m_player_pub.line, LineId},
            {#m_player_pub.mpid, MPid},
            {#m_player_pub.pos, Pos}
        ]
    ),
    lib_player_rw:set_map(
        #m_player_map{map_id = Mid, line_id = LineId, map_pid = MPid}
    ),
    lib_player_cross:change_map_after(OldMid, Mid, true),
    ?WARN("player ~p enter map_~p_~p map_pid ~p", [Uid, Mid, LineId, MPid]),
    hook_player:on_change_map(Mid, Mid),

    lib_player_rw:set_status(?PS_GAME),
    ok;
serv_change_map_call_ret(
    OldMid, OldLineId, _OldPos,
    #r_change_map_ack{error = Err, map_id = Mid}, Flag
) ->
    case Flag of
        gaming -> lib_player_rw:set_status(?PS_GAME);
        _Flag -> error
    end,
    lib_player_cross:change_map_after(OldMid, Mid, false),
    ?ERROR("player ~p change from map ~p:~p to map ~p failed with ~p",
        [lib_player_rw:get_uid(), OldMid, OldLineId, Mid, Err]),
    ok.

%%-------------------------------------------------------------------
return_to_old_map_call() ->
    Uid = lib_player_rw:get_uid(),
    #m_player_pub{
        mpid = Mid, old_mid = OMid, old_line = OLineId, old_pos = OPos
    } = gs_cache_interface:get_player_pub(Uid),
    ?DEBUG("player ~p return_to_pre_map from ~p to ~p", [Uid, Mid, OMid]),
    serv_change_map_call(OMid, OLineId, OPos),
    ok.

%%-------------------------------------------------------------------
offline_call(Uid, MapID, LineId, MapPid) ->
    Aid = lib_player_rw:get_aid(),
    Mgr = gs_map_creator_interface:map_mgr_lr(Aid, MapID),
    gs_map_mgr_interface:player_exit_map_call(
        Mgr,
        #r_exit_map_req{map_id = MapID, line_id = LineId, map_pid = MapPid, uid = Uid}
    ),
    ok.

%%-------------------------------------------------------------------
goto_born_map(Req) ->
    Aid = lib_player_rw:get_aid(),
    Mid = gs_map_creator_interface:born_map_id(),
    Pos = gs_map_creator_interface:born_map_pos(),
    Mgr = gs_map_creator_interface:map_mgr_lr(Aid, Mid),
    ?WARN("kick player[~p] to born map", [Req#r_change_map_req.uid]),

    case gs_map_mgr_interface:player_join_map_call(
        Mgr,
        Req#r_change_map_req{tar_map_id = Mid, tar_pos = Pos}
    ) of
        #r_change_map_ack{} = Ack -> Ack;
        _ ->
            ?FATAL("fatal error, player[~p]can not enter the born map",
                [Req#r_change_map_req.uid]),
            #r_change_map_ack{error = -9999, map_id = Mid}
    end.

