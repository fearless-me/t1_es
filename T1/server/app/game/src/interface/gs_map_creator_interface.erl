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
-include("inc_map.hrl").
-include("pub_rec.hrl").


%% API
-export([
    map_conf/1,map_mgr/1, born_map_id/0, born_map_pos/0,
    broadcast_all/0, broadcast_map/1, map_init_pos/1
]).

%%-------------------------------------------------------------------
broadcast_all() ->
    ok.

%%-------------------------------------------------------------------
broadcast_map(_MapID) ->
    ok.

%%-------------------------------------------------------------------
map_mgr(MapID) ->
    case ets:lookup(?MAP_MGR_ETS, MapID) of
        [#m_map_mgr{mgr = Mgr} | _] -> Mgr;
        _ -> undefined
    end.

%%-------------------------------------------------------------------
map_conf(MapID) -> gameMapCfg:getMapCfg(MapID).

map_init_pos(MapID) ->
    case map_conf(MapID) of
        #recGameMapCfg{initX = X, initY = Y} ->
            vector3:new(X, 0, Y);
        _ ->
            vector3:new(323.19, 0, 255.8)
    end.


born_map_id()   -> 1.
born_map_pos()  -> vector3:new(321, 0, 235).


%%--------------------------------
map_line_info(line_count, all) ->
    QS = ets:fun2ms(fun(Info)-> {Info#m_map_mgr.map_id, Info#m_map_mgr.line_ets} end),
    List = ets:select(?MAP_MGR_ETS),
    lists:map(
        fun({MapId, Ets})->
            ok
        end, List);
map_line_info(line_count, MapId) ->
    ok.


info_head(linecount)->
    "mapid    line count".

