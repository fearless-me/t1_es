%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%% 上线 进入上次退出的地图，如果失败就直接返回出生地
%%% 游戏 如果目标地图存在则先退出在进入，如果失败返回出生地
%%% 游戏 如果目标地图不存在，则会切地图失败
%%% 游戏 如果原地图不存在了(比如跨服挂掉了) 返回出生地
%%% @end
%%% Created : 14. 六月 2018 14:23
%%%-------------------------------------------------------------------
-module(player_map_priv).
-author("mawenhong").
-include("logger.hrl").
-include("error_code.hrl").
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
    teleport_call/1, return_to_old_map_call/0, kick_to_born_map/0
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
    Req = #r_join_map_req{
        uid = Uid, pid = self(), tar_map_id = Mid, tar_pos = Tar
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
    #r_join_map_ack{error = -4, map_id = Req#r_join_map_req.tar_map_id};
do_online_call_1(Mgr, Req) ->
    case catch map_mgr_interface:player_join_map_call(Mgr, Req) of
        #r_join_map_ack{} = Ack -> Ack;
        _ -> #r_join_map_ack{error = ?E_Exception, map_id = Req#r_join_map_req.tar_map_id}
    end.

%%-------------------------------------------------------------------
serve_change_map_call(TarMid, TarLineId, TarPos) ->
    player_rw:set_status(?PS_CHANGE_MAP),
    Uid = player_rw:get_uid(),
    #m_cache_online_player{
        map_id = SrcMid, line = SrcLineId, map_pid = SrcMPid, pos = SrcPos
    } = gs_cache_interface:get_online_player(Uid),
    player_cross_priv:change_map_before(SrcMid, TarMid),
    


    ExitReq = #r_exit_map_req{uid = Uid, map_id = SrcMid, line_id = SrcLineId, map_pid = SrcMPid},
    JoinReq = #r_join_map_req{uid = Uid, group = 0, pid = self(), tar_map_id = TarMid, tar_line_id = TarLineId, tar_pos = TarPos},
    
    Ack = do_serve_change_map_call(ExitReq, JoinReq),
    serve_change_map_call_ret(SrcMid, SrcLineId, SrcPos, Ack, JoinReq, gaming),
    ok.

%%-------------------------------------------------------------------
do_serve_change_map_call(ExitReq, JoinReq) ->

    %% 1.
    #r_exit_map_req{uid = Uid, map_id = SrcMid, line_id = SrcLineId, map_pid = SrcMpid} = ExitReq,
    #r_join_map_req{uid = Uid, tar_map_id = TarMid} = JoinReq,

    
    CurMgr = map_creator_interface:map_mgr_lr(Uid, SrcMid),
    TarMgr = map_creator_interface:map_mgr_lr(Uid, TarMid),

    ?INFO("player ~p, changeMap map_~p_~p:~p -> map ~p",
        [Uid, SrcMid, SrcLineId, SrcMpid, TarMid]),

    %% 2.
    ExitRes = do_serve_change_map_call_exit(CurMgr, TarMgr, ExitReq),
    do_serve_change_map_call_join(ExitRes, TarMgr, JoinReq).

%% 先退出
%% 这种情况可能是在跨服(比如跨服中切跨服地图，但是跨服挂了)
do_serve_change_map_call_exit(undefined, undefined, #r_exit_map_req{map_id = Mid}) ->
    #r_exit_map_ack{error = ?E_Exception, map_id = Mid};
%% 这种情况可能是在跨服(跨服中去切普通服务器，但是跨服挂了)
do_serve_change_map_call_exit(undefined, _CurMgr, #r_exit_map_req{map_id = Mid}) ->
    #r_exit_map_ack{error = ?E_Success, map_id = Mid};
%% 这种情况可能是在普通服切跨服，但是跨服不存在
do_serve_change_map_call_exit(_CurMgr, undefined, #r_exit_map_req{map_id = Mid}) ->
    #r_exit_map_ack{error = ?E_MapNotExists, map_id = Mid};
%% 这种是服务器安全的情况下
do_serve_change_map_call_exit(CurMgr, _TarMgr, #r_exit_map_req{map_id = Mid} = ExitReq) ->
    case catch map_mgr_interface:player_exit_map_call(CurMgr, ExitReq) of
        Code when is_number(Code)-> #r_exit_map_ack{error = Code, map_id = Mid};
        _ ->   #r_exit_map_ack{error = ?E_Exception, map_id = Mid}
    end.

%% 在进入
%% 1.应该不会存在这种情况
do_serve_change_map_call_join(#r_exit_map_ack{error = ?E_Success}, undefined, _JoinReq) ->
    #r_join_map_ack{error = ?E_Exception, map_id = 0};
%% 2. 成功退出地图，加入新地图
do_serve_change_map_call_join(#r_exit_map_ack{error = ?E_Success}, TarMgr, JoinReq)->
    case catch map_mgr_interface:player_join_map_call(TarMgr, JoinReq) of
        #r_join_map_ack{} = Ack -> Ack;
        _ -> #r_join_map_ack{error = ?E_Exception, map_id = JoinReq#r_join_map_req.tar_map_id}
    end;
do_serve_change_map_call_join(#r_exit_map_ack{error = ErrorCode}, _TarMgr, _Req) ->
    #r_join_map_ack{error = ErrorCode, map_id = 0}.

%%-------------------------------------------------------------------
serve_change_map_call_ret(
    OldMid, OldLineId, OldPos,
    #r_join_map_ack{error = ?E_Success, map_id = Mid, line_id = LineId, map_pid = MPid, pos = Pos},
    _Req, _Flag
) ->
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
    #r_join_map_ack{error = Err, map_id = Mid} = Ack,
    Req, Flag
) ->
    player_cross_priv:change_map_after(OldMid, Mid, false),
    
    ?ERROR("player ~p change from map ~p:~p to map ~p flag ~p failed with ~p",
        [player_rw:get_uid(), OldMid, OldLineId, Mid, Flag, Err]),
    
    serve_change_map_call_fail(Flag, Req, Ack),
    ok.

serve_change_map_call_fail(kick_born_map, _Req, #r_join_map_ack{error = Error, map_id = Mid}) ->
    %% todo 告诉客户端切地图失败
    Uid = player_rw:get_uid(),
    ?FATAL("fatal error ~p, player[~p]can not enter the born map ~p", [Error, Uid, Mid]),
    player_pub:stop("online can't join map");
serve_change_map_call_fail(gaming, _Req, #r_join_map_ack{error = ?E_MapNotExists}) ->
    %% todo 告诉客户端切地图失败
    player_rw:set_status(?PS_GAME);
serve_change_map_call_fail(gaming, Req, _Ack) ->
    %% todo 告诉客户端切地图失败
    kick_to_born_map(Req);
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
    catch map_mgr_interface:player_exit_map_call(
        Mgr,
        #r_exit_map_req{map_id = MapID, line_id = LineId, map_pid = MapPid, uid = Uid}
    ),
    ok.

%%-------------------------------------------------------------------
kick_to_born_map()->
    Uid = player_rw:get_uid(),
    Req = #r_join_map_req{uid = Uid, pid = self()},
    kick_to_born_map(Req),
    ok.

kick_to_born_map(Req) ->
    Uid = player_rw:get_aid(),
    Mid = map_creator_interface:born_map_id(),
    Pos = map_creator_interface:born_map_pos(),
    Mgr = map_creator_interface:map_mgr_lr(Uid, Mid),
    ?WARN("kick player ~p to born map ~p", [Uid, Mid]),
    
    Ack = map_mgr_interface:player_join_map_call(
        Mgr, Req#r_join_map_req{tar_map_id = Mid, tar_pos = Pos}),
    
    serve_change_map_call_ret(Mid, 0, Pos, Ack, Req, kick_born_map),
    ok.

