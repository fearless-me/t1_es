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
-include("map.hrl").
-include("pub_common.hrl").
-include("vector3.hrl").
-include("mem_record.hrl").
-include("db_record.hrl").
-include("player_status.hrl").
%% API

%%--------------------------------
%% WARNING!!! WARNING!!! WARNING!!!
%% call
-export([
    online_call/1, offline_call/4, change_map_call/2,
    teleport_call/1, return_to_old_map_call/0
]).


%%-------------------------------------------------------------------
teleport_call(NewPos) ->
    Uid = lib_player_rw:get_uid(),
    #m_player_pub{mpid = MPid} = lib_cache:get_player_pub(Uid),
    do_teleport_call(MPid, NewPos).

do_teleport_call(undefined, _NewPos) ->
    ?ERROR("");
do_teleport_call(MapPid, NewPos) ->
    Uid = lib_player_rw:get_uid(),
    ok  = map:player_teleport(
        MapPid,
        #r_teleport_req{uid = Uid, tar_pos = NewPos}
    ),
    ok.

%%-------------------------------------------------------------------
online_call(Player) ->
    #p_player{
        uid = Uid, map_id = Mid, x = X, y = Y,
        old_map_id = OldMid, old_line = OldLine, old_x = OX, old_y = OY
    } = Player,

    Ack = do_online_call(
        Mid,
        #r_change_map_req{
            uid = Uid,
            pid = self(),
            tar_map_id = Mid,
            tar_pos = vector3:new(X, 0, Y)
        }
    ),

    do_change_map_call_ret(OldMid, OldLine, vector3:new(OX, 0, OY), Ack, login),
    ok.

do_online_call(MapID, Req) ->
    Mgr = map_creator:map_mgr(MapID),
    do_online_call_1(Mgr, Req).

%%
do_online_call_1(undefined, Req) ->
    goto_born_map(Req);
do_online_call_1(Mgr, Req) ->
    case map_mgr:player_join_map(Mgr, Req) of
        #r_change_map_ack{} = Ack -> Ack;
        _ -> goto_born_map(Req)
    end.


%%-------------------------------------------------------------------
change_map_call(DestMapID, TarPos) ->
    lib_player_rw:set_status(?PS_CHANGE_MAP),
    Uid = lib_player_rw:get_uid(),
    #m_player_pub{mid = Mid, line = Line, mpid = MPid, pos = Pos} = lib_cache:get_player_pub(Uid),
    Ack = do_change_map_call(
        #r_change_map_req{
            uid = Uid, pid = self(),
            map_id = Mid, line_id = Line, map_pid = MPid,
            tar_map_id = DestMapID, tar_pos = TarPos
        }
    ),

    do_change_map_call_ret(Mid, Line, Pos, Ack, online),
    ok.

%%%-------------------------------------------------------------------
do_change_map_call(Req) ->
    #r_change_map_req{
        uid = Uid, tar_map_id = TMid,
        map_id = Mid, line_id = LineId, map_pid = Mpid
    } = Req,
    CurMgr = map_creator:map_mgr(Mid),
    TarMgr = map_creator:map_mgr(TMid),
    ?INFO("player ~p, changeMap mgr ~p:~p:~p -> mgr ~p:~p",
        [Uid, Mid, LineId, CurMgr, TMid, TarMgr]),
    case CurMgr of
        undefined ->
            ?FATAL("player[~p] cur map[~p] not exists", [Uid, Mid]);
        _ ->
            map_mgr:player_exit_map(CurMgr,
                #r_exit_map_req{map_id = Mid, line_id = LineId, map_pid = Mpid, uid = Uid})
    end,
    case TarMgr of
        undefined ->
            ?ERROR("player[~p] tar map[~p] not exists", [Uid, TMid]),
            goto_born_map(Req);
        _ ->
            case map_mgr:player_join_map(TarMgr, Req) of
                #r_change_map_ack{} = Ack -> Ack;
                _ -> goto_born_map(Req)
            end
    end.
do_change_map_call_ret(
    OldMid, OldLineId, OldPos,
    #r_change_map_ack{
        error = 0,
        map_id = Mid, line_id = LineId,
        map_pid = MPid , pos = Pos
    }, _Flag) ->
    Uid = lib_player_rw:get_uid(),
    lib_cache:update_player_pub(
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
    ?WARN("player ~p enter map_~p_~p",[Uid, Mid, LineId]),
    hook_player:on_change_map(Mid, Mid),

    lib_player_rw:set_status(?PS_GAME),

    map:player_move_(
        MPid,
        #r_player_start_move_req{uid = Uid, tar_pos = vector3:new(400.6, 0, 358.9)}
    ),
    ok;
do_change_map_call_ret(
    OldMid, OldLineId, _OldPos,
    #r_change_map_ack{error = Err, map_id = Mid}, Flag
)->
    case Flag of
        online -> lib_player_rw:set_status(?PS_GAME);
        _Flag  -> error
    end,
    ?ERROR("player ~p change from map ~p:~p to map ~p failed with ~p",
        [lib_player_rw:get_uid(), OldMid, OldLineId, Mid, Err]),
    ok.

%%%-------------------------------------------------------------------
return_to_old_map_call() ->
    Uid = lib_player_rw:get_uid(),
    #m_player_pub{mpid = Mid, old_mid = OMid, old_pos = OPos} = lib_cache:get_player_pub(Uid),
    ?DEBUG("player ~p return_to_pre_map from ~p to ~p", [Uid, Mid, OMid]),
    change_map_call(OMid, OPos),
    ok.

%%%-------------------------------------------------------------------
offline_call(Uid, MapID, LineId, MapPid) ->
    Mgr = map_creator:map_mgr(MapID),
    map_mgr:player_exit_map(
        Mgr,
        #r_exit_map_req{map_id = MapID, line_id = LineId,  map_pid = MapPid, uid = Uid}
    ),
    ok.

%%%-------------------------------------------------------------------
goto_born_map(Req) ->
    Mid = map_creator:born_map_id(),
    Pos = map_creator:born_map_pos(),
    Mgr = map_creator:map_mgr( Mid ),
    ?WARN("kick player[~p] to born map",
        [Req#r_change_map_req.uid]),

    case map_mgr:player_join_map(
        Mgr,
        Req#r_change_map_req{
            tar_map_id = Mid,
            tar_pos = Pos
        }
    ) of
        #r_change_map_ack{} = Ack -> Ack;
        _ -> ?FATAL("fatal error, player[~p]can not enter the born map",
            [Req#r_change_map_req.uid])
    end.