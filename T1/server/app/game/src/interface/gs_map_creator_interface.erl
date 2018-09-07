%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 13. 六月 2018 10:05
%%%-------------------------------------------------------------------
-module(gs_map_creator_interface).
-author("mawenhong").
-include("logger.hrl").
-include("gs_map_inc.hrl").
-include("pub_rec.hrl").
-include("cfg_map.hrl").


%% API
-export([
    is_cross_map/1, map_data/1,
    map_mgr_lr/2, map_mgr_l/1,
    born_map_id/0, born_map_pos/0, map_init_pos/1
]).

%%-------------------------------------------------------------------
map_mgr_l(MapID) ->
    case ets:lookup(?MAP_MGR_ETS, MapID) of
        [#m_map_mgr{mgr = Mgr} | _] -> Mgr;
        _ -> undefined
    end.
%%-------------------------------------------------------------------
map_mgr_lr(Aid, MapID) ->
    do_map_mgr_lr(gs_conf:is_cross(), Aid, getCfg:getCfgByArgs(cfg_map, MapID)).


%% 在跨服上找非跨服地图
do_map_mgr_lr(true, Aid, #mapCfg{is_cross = 0, id = MapID}) ->
    Node = gs_cross_interface:get_player_src_node(Aid),
    case gs_cross_interface:get_remote_server_map_mgr(Node, MapID) of
        MgrPid when is_pid(MgrPid) -> MgrPid;
        Error ->
            ?ERROR("~p get map mgr ~p from ~p, error ~p", [node(), MapID, Node, Error]),
            undefined
    end;
%% 在普通服务器招跨服地图
do_map_mgr_lr(false, Aid, #mapCfg{is_cross = 1, id = MapID}) ->
    Node = gs_cross_interface:get_player_cross_node(Aid),
    case gs_cross_interface:get_remote_server_map_mgr(Node, MapID) of
        MgrPid when is_pid(MgrPid) -> MgrPid;
        Error ->
            ?ERROR("~p get map mgr ~p from ~p, error ~p", [node(), MapID, Node, Error]),
            undefined
    end;
%% 在跨服上找跨服地图/在普通副找非跨服地图
do_map_mgr_lr(_Any, _Aid, #mapCfg{id = MapID}) ->
    case ets:lookup(?MAP_MGR_ETS, MapID) of
        [#m_map_mgr{mgr = Mgr} | _] -> Mgr;
        _ -> undefined
    end.


%%-------------------------------------------------------------------
map_data(MapID) -> gameMapCfg:getMapCfg(MapID).

%%-------------------------------------------------------------------
map_init_pos(MapID) ->
    case map_data(MapID) of
        #recGameMapCfg{initX = X, initY = Y} ->
            vector3:new(X, 0, Y);
        _ ->
            vector3:new(323.19, 0, 255.8)
    end.

%%-------------------------------------------------------------------
born_map_id() -> 1.

%%-------------------------------------------------------------------
born_map_pos() -> vector3:new(321, 0, 235).

%%-------------------------------------------------------------------
is_cross_map(MapId) ->
    case getCfg:getCfgByArgs(cfg_map, MapId) of
        #mapCfg{is_cross = 1} -> true;
        _ -> false
    end.

%%--------------------------------
map_line_info(line_count, all) ->
    QS = ets:fun2ms(fun(Info) -> {Info#m_map_mgr.map_id, Info#m_map_mgr.line_ets} end),
    List = ets:select(?MAP_MGR_ETS),
    lists:map(
        fun({MapId, Ets}) ->
            ok
        end, List);
map_line_info(line_count, MapId) ->
    ok.


info_head(linecount) ->
    "mapid    line count".

