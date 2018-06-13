%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 13. 六月 2018 10:05
%%%-------------------------------------------------------------------
-module(map_creator).
-author("mawenhong").
-include("logger.hrl").
-include("map.hrl").
-include("pub_common.hrl").
-include("vector3.hrl").

%% API

%%--------------------------------
%% WARNING!!! WARNING!!! WARNING!!!
%% call
-export([player_online/2]).
-export([player_change_map/1]).
-export([player_offline/4]).
%%--------------------------------

-export([map_conf/1]).
-export([broadcast_all/0, broadcast_map/1]).
-export([born_map_id/0]).
-export([born_map_pos/0]).



%%%-------------------------------------------------------------------
%% WARNING!!! WARNING!!! WARNING!!!
%% call
player_online(MapID, Req) ->
    Mgr = map_mgr(MapID),
    do_player_online(Mgr, Req).

%%
do_player_online(undefined, Req) ->
    kick_to_born_map(Req);
do_player_online(Mgr, Req) ->
    case map_mgr:player_join_map(Mgr, Req) of
        #r_change_map_ack{} = Ack -> Ack;
        _ -> kick_to_born_map(Req)
    end.
%%%-------------------------------------------------------------------

%%%-------------------------------------------------------------------
player_offline(Uid, MapID, LineId, MapPid) ->
    Mgr = map_mgr(MapID),
    map_mgr:player_exit_map(
        Mgr,
        #r_exit_map_req{map_id = MapID, line_id = LineId,  map_pid = MapPid, uid = Uid}
    ),
    ok.

%%%-------------------------------------------------------------------
player_change_map(Req) ->
    #r_change_map_req{
        uid = Uid, tar_map_id = TMid,
        map_id = Mid, line_id = LineId, map_pid = Mpid
    } = Req,
    CurMgr = map_mgr(Mid),
    TarMgr = map_mgr(TMid),
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
            kick_to_born_map(Req);
        _ ->
            case map_mgr:player_join_map(TarMgr, Req) of
                #r_change_map_ack{} = Ack -> Ack;
                _ -> kick_to_born_map(Req)
            end
    end.

%%%-------------------------------------------------------------------
kick_to_born_map(Req) ->
    Mid = born_map_id(),
    Pos = born_map_pos(),
    Mgr = map_mgr( Mid ),
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

%%%-------------------------------------------------------------------
broadcast_all() ->
    ok.

%%%-------------------------------------------------------------------
broadcast_map(_MapID) ->
    ok.

%%%-------------------------------------------------------------------
map_mgr(MapID) ->
    case ets:lookup(?MAP_MGR_ETS, MapID) of
        [#map_mgr_r{mgr = Mgr} | _] -> Mgr;
        _ -> undefined
    end.

%%%-------------------------------------------------------------------
map_conf(MapID) -> gameMapCfg:getMapCfg(MapID).


born_map_id()   -> 1.
born_map_pos()  -> vector3:new(323.19, 0, 255.8).