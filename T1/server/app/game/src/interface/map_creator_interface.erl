%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 13. 六月 2018 10:05
%%%-------------------------------------------------------------------
-module(map_creator_interface).
-author("mawenhong").
-include("logger.hrl").
-include("pub_def.hrl").
-include("map_core.hrl").
-include("pub_rec.hrl").
-include("cfg_map.hrl").



%% API
-export([
    is_cross_map/1, map_data/1,
    map_mgr_lr/2, map_mgr_l/1,
    born_map_id/0, born_map_pos/0, map_init_pos/1,
    map_line_recover/1
]).

-export([status/1]).

%%
%% 一般情况切地图是制定了一定要加入某个线路
%% 但是某个线路由于生命周期终止或者出错等等导致
%% 查询不到这个线路时怎么办
%% @reference ?MAP_LINE_RECOVER_*
%%
map_line_recover(MapID) ->
    Cfg = getCfg:getCfgByArgs(cfg_map, MapID),
    do_map_line_recover(Cfg).

do_map_line_recover(#mapCfg{ type = ?MAP_TYPE_NORMAL}) ->
    ?MAP_LINE_RECOVER_ANY_NEW;
do_map_line_recover(#mapCfg{ type = ?MAP_TYPE_COPY}) ->
    ?MAP_LINE_RECOVER_ERR;
do_map_line_recover(#mapCfg{ type = ?MAP_TYPE_GROUP}) ->
    ?MAP_LINE_RECOVER_ERR;
do_map_line_recover(#mapCfg{ type = ?MAP_TYPE_ACTIVITY}) ->
    ?MAP_LINE_RECOVER_ERR.

%%-------------------------------------------------------------------
map_mgr_l(MapID) ->
    case misc_ets:read(?MAP_MGR_ETS, MapID) of
        [#m_map_mgr{mgr = Mgr} | _] -> Mgr;
        _ -> undefined
    end.
%%-------------------------------------------------------------------
map_mgr_lr(Uid, MapID) ->
    do_map_mgr_lr(gs_interface:is_cross(), Uid, getCfg:getCfgByArgs(cfg_map, MapID)).


%% 在跨服上找非跨服地图
do_map_mgr_lr(true, Uid, #mapCfg{is_cross = 0, id = MapID}) ->
    Node = cross_interface:get_player_src_node(Uid),
    case cross_interface:get_remote_server_map_mgr(Node, MapID) of
        MgrPid when erlang:is_pid(MgrPid) -> MgrPid;
        Error ->
            ?ERROR("~p get map mgr ~p from ~p, error ~p", [erlang:node(), MapID, Node, Error]),
            undefined
    end;
%% 在普通服务器招跨服地图
do_map_mgr_lr(false, Uid, #mapCfg{is_cross = 1, id = MapID}) ->
    Node = cross_interface:get_player_cross_node(Uid),
    case cross_interface:get_remote_server_map_mgr(Node, MapID) of
        MgrPid when erlang:is_pid(MgrPid) -> MgrPid;
        Error ->
            ?ERROR("~p get map mgr ~p from ~p, error ~p", [erlang:node(), MapID, Node, Error]),
            undefined
    end;
%% 在跨服上找跨服地图/在普通副找非跨服地图
do_map_mgr_lr(_Any, _Uid, #mapCfg{id = MapID}) ->
    case misc_ets:read(?MAP_MGR_ETS, MapID) of
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
status(all) ->
    erlang:spawn(
        fun() ->
            try
                QS = ets:fun2ms(fun(Info) -> {Info#m_map_mgr.map_id, Info#m_map_mgr.line_ets} end),
                List = misc_ets:select(?MAP_MGR_ETS, QS),
                lists:map(fun({MapId, LineEts})-> line_status(MapId, LineEts, all) end, List )
            catch _ : Error: _  ->
                ?WARN("status(all) error ~p",[Error])
            end
        end);
status(detail) ->
    erlang:spawn(
        fun() ->
            try
                QS = ets:fun2ms(fun(Info) -> {Info#m_map_mgr.map_id, Info#m_map_mgr.line_ets} end),
                List = misc_ets:select(?MAP_MGR_ETS, QS),
                lists:map(fun({MapId, LineEts})-> line_status(MapId, LineEts, detail) end, List )
            catch _ : Error : _  ->
                ?WARN("status(all_detail) error ~p",[Error])
            end
        end);
status(MapId) ->
    erlang:spawn(
        fun() ->
            try
                LineEts = misc_ets:read_element(?MAP_MGR_ETS, MapId, #m_map_mgr.line_ets),
                line_status(MapId, LineEts, detail)
            catch _ : Error : _  ->
                ?WARN("status(~p) error ~p",[MapId, Error])
            end
        end),
    ok.


-define(INFO_FMT, "~-10.w~-20.w~-10.w~-10.w~-10.w~-30.ts~-10.w~w~n").
-define(INFO_FMT_STR, "~-10.ts~-20.ts~-10.ts~-10.ts~-10.ts~-30.ts~-10.ts~ts~n").
line_status(MapId, LineEts, Extra) ->
    Overview = io_lib:format("~nmapid:~p  line count:~p~n", [MapId, misc_ets:size(LineEts)]),
    List = misc_ets:to_list(LineEts),
    InfoHead = io_lib:format(?INFO_FMT_STR, ["line id","pid","limit","in", "reserve","deadline", "status", "extra"]),
    InfoAll = lists:map(
        fun(#m_map_line{
            line_id = LineId, pid = Pid,
            limits = Limits, in = In, reserve = Reserve,
            dead_line = DeadLine, status = Status
        })->
            ExtraInfo = line_status_extra(Pid, Status, Extra),
            io_lib:format(?INFO_FMT,
                [LineId, Pid, Limits, In, Reserve, misc_time:milli_seconds_to_str(DeadLine), Status, ExtraInfo])
        end, List),
    ?WARN("~s~ts~s",[Overview, InfoHead, string:join(InfoAll, "")]),
    ok.

line_status_extra(_Pid, Status, _) when Status =/= ?MAP_NORMAL ->
    killed;
line_status_extra(Pid, _Status, detail) ->
    map_srv:status(Pid);
line_status_extra(_Pid, _Status, _Ex) ->
    unknown.

