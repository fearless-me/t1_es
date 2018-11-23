%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%% 上线 进入上次退出的地图，如果失败就直接返回出生地
%%% 游戏 如果目标地图存在则先退出在进入，如果失败返回出生地
%%% 游戏 如果目标地图不存在，则会切地图失败
%%% 游戏 如果原地图不存在了(比如跨服挂掉了) 返回出生地
%%% todo 有些异常情况比如跨服很卡长时间不能获取跨服上地图管理器
%%% todo 或者即使取到了在后续逻辑时timeout了怎么办（保证状态不错）？
%%% todo 如果游戏服挂掉了，在跨服的玩家怎么处理
%%% todo 如果跨服挂掉怎么办
%%% todo 如果地图销毁,踢所有玩家，在地图保护时间内（20秒）(跨服、游戏服)玩家没有退出地图怎么办？
%%% todo 如跨服中切跨服地图，但是跨服挂
%%% todo 跨服中去切普通服务器，但是跨服挂了
%%% todo 普通服切跨服，但是跨服不存在
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
    #r_join_map_ack{error = ?E_Exception, map_id = Req#r_join_map_req.tar_map_id};
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

    
%%    CurMgr = map_creator_interface:map_mgr_lr(Uid, SrcMid),
    TarMgr = map_creator_interface:map_mgr_lr(Uid, TarMid),


    ?INFO("player ~p, changeMap ~p|map_~p_~p -> map ~p | mgr ~p",
        [Uid, SrcMpid, SrcMid, SrcLineId, TarMid, TarMgr]),

    case TarMgr of
        undefined -> skip;
        _ -> player_cross_priv:change_map_before(SrcMid, TarMid)
    end,

    %% 2.
    ExitAck = do_serve_change_map_call_exit(SrcMpid, TarMgr, ExitReq),
    ?DEBUG("~w",[ExitAck]),
    do_serve_change_map_call_join(ExitAck, TarMgr, JoinReq).

%% 先退出
%% 这种情况可能是在跨服(比如跨服中切跨服地图，但是跨服挂了)
do_serve_change_map_call_exit(undefined, _TarMgr, #r_exit_map_req{map_id = Mid}) ->
    #r_exit_map_ack{error = ?E_Exception, map_id = Mid};
%%%% 这种情况可能是在跨服(跨服中去切普通服务器，但是跨服挂了)
%%do_serve_change_map_call_exit(undefined, _TarMgr, #r_exit_map_req{map_id = Mid}) ->
%%    #r_exit_map_ack{error = ?E_Success, map_id = Mid};
%% 这种情况可能是在普通服切跨服，但是跨服不存在  | 也有可能是跨服切跨服
do_serve_change_map_call_exit(_SrcMpid, undefined, #r_exit_map_req{map_id = Mid}) ->
    #r_exit_map_ack{error = ?E_MapNotExists, map_id = Mid};
%% 这种是服务器安全的情况下
do_serve_change_map_call_exit(SrcMpid, _TarMgr, #r_exit_map_req{map_id = Mid} = ExitReq) ->
    case catch map_interface:player_exit_call(SrcMpid, ExitReq) of
        #r_exit_map_ack{} = Ack -> Ack;
        _Err -> #r_exit_map_ack{error = ?E_Exception, map_id = Mid}
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
do_serve_change_map_call_join(#r_exit_map_ack{error = ErrorCode}, _TarMgr, JoinReq) ->
    #r_join_map_ack{error = ErrorCode, map_id = JoinReq#r_join_map_req.tar_map_id}.

%%-------------------------------------------------------------------
serve_change_map_call_ret(
    OldMid, OldLineId, OldPos,
    #r_join_map_ack{error = ?E_Success, map_id = Mid, line_id = LineId, map_pid = MPid, pos = Pos},
    _Req, _Flag
) ->
    Uid = player_rw:get_uid(),

    %% 优先处理，否则后面的更新会同步到跨服去
    %% 就回造成玩家在跨服退出时会继续退出时进而会退出地图
    player_cross_priv:change_map_after(OldMid, Mid, true),

    case map_creator_interface:normal_map(OldMid) of
        true ->
            catch gs_cache_interface:update_online_player(
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
            );
        _Any ->
            catch gs_cache_interface:update_online_player(
                Uid,
                [
                    {#m_cache_online_player.map_id, Mid},
                    {#m_cache_online_player.line, LineId},
                    {#m_cache_online_player.map_pid, MPid},
                    {#m_cache_online_player.pos, Pos}
                ]
            )
    end,

    player_rw:set_map(
        #m_player_map{map_id = Mid, line_id = LineId, map_pid = MPid}
    ),
    ?WARN("player ~p enter ~p|map_~p_~p", [Uid, MPid, Mid, LineId]),
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
%%    Req = #r_exit_map_req{map_id = MapID, line_id = LineId, map_pid = MapPid, uid = Uid},
%%    case catch map_interface:player_exit_call(MapPid, Req) of
    case catch map_interface:player_exit_map_exception_try(MapPid, Uid) of
        {'EXIT', Error} ->
            ?ERROR("player ~p exit ~p|map_~p_~p, ~w", [Uid, MapPid, MapID, LineId, Error]);
        _ ->
            skip
    end,
    ok.

%%-------------------------------------------------------------------
kick_to_born_map()->
    Uid = player_rw:get_uid(),
    Req = #r_join_map_req{uid = Uid, pid = self()},
    kick_to_born_map(Req),
    ok.

kick_to_born_map(Req) ->
    Uid = player_rw:get_uid(),
    Mid = map_creator_interface:born_map_id(),
    Pos = map_creator_interface:born_map_pos(),
    Mgr = map_creator_interface:map_mgr_lr(Uid, Mid),
    #m_player_map{map_id = CurMapId, map_pid = MapPid} = player_rw:get_map(),
    ?WARN("kick player ~p to born map from ~p|~p", [Uid, Mid, misc:registered_name(MapPid)]),

    catch map_interface:player_exit_map_exception_try(MapPid, Uid),
    Ack = map_mgr_interface:player_join_map_call(
        Mgr, Req#r_join_map_req{tar_map_id = Mid, tar_pos = Pos}),
    
    serve_change_map_call_ret(CurMapId, 0, Pos, Ack, Req, kick_born_map),
    ok.

