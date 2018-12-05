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
    broadcast/1, select_all_map_pid/0,
    is_cross_map/1, map_data/1, map_type/1, normal_map/1,
    map_mgr_lr/2, map_mgr_l/1,
    born_map_id/0, map_init_pos/1,
    map_line_recover/1
]).

-export([status_/1, status/0, check/0]).

check()->
    L0 = getCfg:get1KeyList(cfg_map),
    L1 = [MapId || MapId <- L0, gameMapCfg:getMapCfg(MapId) =:= undefined],
    case L1 of
        [] ->
            case misc_ets:size(?MAP_MGR_ETS) of
                X when X > 0 -> true;
                _ -> "server has *0* map(s)"
            end;
        _ ->
            lists:flatten(io_lib:format("maps ~p gameMapCfg:getMapCfg/1 return undefined",[L1]))
    end.

broadcast(Msg) ->
    erlang:spawn
    (
        fun() ->
            MLL = select_all_map_pid(),
            lists:foreach
            (
                fun(Pid)->
                    ?DEBUG("send to map pid ~p msg ~p", [Pid, Msg]),
                    ps:send(Pid, Msg)
                end,
                MLL
            )
        end
    ),
    ok.

select_all_map_pid() ->
    QS1 = ets:fun2ms(fun(Info) -> Info#m_map_mgr.line_ets end),
    MGL = misc_ets:select(?MAP_MGR_ETS, QS1),
    QS2 = ets:fun2ms(fun(Info) -> Info#m_map_line.pid end),
    lists:foldl(
        fun(LineEts, Acc)->
            MLL = misc_ets:select(LineEts, QS2),
            lists:append(MLL, Acc)
        end, [], MGL).


%%
%% 一般情况切地图是制定了一定要加入某个线路
%% 但是某个线路由于生命周期终止或者出错等等导致
%% 查询不到这个线路时怎么办
%% ?MAP_LINE_RECOVER_*
%%
map_line_recover(MapID) ->
    Cfg = getCfg:getCfgByArgs(cfg_map, MapID),
    do_map_line_recover(Cfg).

do_map_line_recover(#mapCfg{type = ?MAP_TYPE_NORMAL}) ->
    ?MAP_LINE_RECOVER_ANY_NEW;
do_map_line_recover(#mapCfg{type = ?MAP_TYPE_COPY}) ->
    ?MAP_LINE_RECOVER_ERR;
do_map_line_recover(#mapCfg{type = ?MAP_TYPE_GROUP}) ->
    ?MAP_LINE_RECOVER_ERR;
do_map_line_recover(#mapCfg{type = ?MAP_TYPE_ACTIVITY}) ->
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
do_map_mgr_lr(true, Uid, #mapCfg{is_cross = ?MAP_EXIST_TYPE_NORMAL, id = MapID}) ->
    Node = cross_interface:get_player_src_node(Uid),
    case cross_interface:get_remote_server_map_mgr(Node, MapID) of
        MgrPid when erlang:is_pid(MgrPid) -> MgrPid;
        Error ->
            ?ERROR("~p get map mgr ~p from ~p, error ~p", [erlang:node(), MapID, Node, Error]),
            undefined
    end;
%% 在普通服务器招跨服地图
do_map_mgr_lr(false, Uid, #mapCfg{is_cross = ?MAP_EXIST_TYPE_CROSS, id = MapID}) ->
    IsCenterReady = gs_cs_interface:is_center_ready(),
    case IsCenterReady of
        true ->
            Node = cross_interface:get_player_cross_node(Uid),
            case cross_interface:get_remote_server_map_mgr(Node, MapID) of
                MgrPid when erlang:is_pid(MgrPid) -> MgrPid;
                Error ->
                    ?ERROR("~p get map mgr ~p from ~p, error ~p", [erlang:node(), MapID, Node, Error]),
                    undefined
            end;
        _Any -> undefined
    end;
%% 在跨服上找跨服地图/在普通副找非跨服地图
do_map_mgr_lr(_Any, _Uid, #mapCfg{id = MapID}) ->
    case misc_ets:read(?MAP_MGR_ETS, MapID) of
        [#m_map_mgr{mgr = Mgr} | _] -> Mgr;
        _ -> undefined
    end;
do_map_mgr_lr(_Any, _Uid, _) -> undefined.


map_type(MapID) ->
    case getCfg:getCfgByArgs(cfg_map, MapID) of
        #mapCfg{type = Type} -> Type;
        _Any -> ?MAP_TYPE_INVALID
    end.

normal_map(MapID) ->
    map_creator_interface:map_type(MapID) =:= ?MAP_TYPE_NORMAL.

%%-------------------------------------------------------------------
map_data(MapID) ->
    case gameMapCfg:getMapCfg(MapID) of
        undefined -> undefined;
        Mod -> Mod:getRow(MapID)
    end.

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
is_cross_map(MapId) ->
    case getCfg:getCfgByArgs(cfg_map, MapId) of
        #mapCfg{is_cross = ?MAP_EXIST_TYPE_CROSS} -> true;
        _ -> false
    end.

%%--------------------------------
status_(detail) ->
    erlang:spawn(
        fun() ->
            Info = map_creator_interface:status(),
            io:format("~ts~n", [Info])
        end);
status_(MapId) ->
    erlang:spawn(
        fun() ->
            try
                LineEts = misc_ets:read_element(?MAP_MGR_ETS, MapId, #m_map_mgr.line_ets),
                io:format("~ts~n", [line_status(MapId, LineEts, detail)])
            catch _ : Error : _ ->
                io:format("status(~p) error ~p~n", [MapId, Error])
            end
        end),
    ok.


status() ->
    try
        QS = ets:fun2ms(fun(Info) -> {Info#m_map_mgr.map_id, Info#m_map_mgr.line_ets} end),
        List = misc_ets:select(?MAP_MGR_ETS, QS),
        Info = lists:map(fun({MapId, LineEts}) -> line_status(MapId, LineEts, detail) end, List),
        string:join(Info, "\n")
    catch _ : Error : ST ->
        io_lib:format("status(detail) error ~p ~p~n", [Error, ST])
    end.

-define(INFO_FMT_BODY, "~-5.w~-18.w~-8.w~-6.w~-8.w~-12.ts~-20.ts~-10.w~w~n").
-define(INFO_FMT_HEAD, "~-5.ts~-18.ts~-8.ts~-6.ts~-8.ts~-12ts~-20.ts~-10.ts~ts~n").
line_status(MapId, LineEts, Extra) ->
    Overview = io_lib:format("~nMap:~p  Line Count:~p~n", [MapId, misc_ets:size(LineEts)]),
    List = lists:sort(misc_ets:to_list(LineEts)),
    InfoHead = io_lib:format(?INFO_FMT_HEAD, ["Id", "Pid", "Limit", "In", "Reserve", "Memory","Deadline", "Status", "Extra"]),
    InfoAll = lists:map(
        fun(#m_map_line{
            line_id = LineId, pid = Pid,
            limits = Limits, in = In, reserve = Reserve,
            dead_line = DeadLine, status = Status
        }) ->
            ExtraInfo = line_status_extra(Pid, Status, Extra),
            Memory =
                case erlang:process_info(Pid, memory) of
                    {memory, V} -> V;
                    _ -> 0
                end,
            io_lib:format
            (
                ?INFO_FMT_BODY,
                [
                    LineId, Pid, Limits, In, Reserve,
                    misc:format_memory_readable(Memory),
                    misc_time:milli_seconds_to_str(DeadLine), Status, ExtraInfo
                ]
            )
        end, List),
    io_lib:format("~s~ts~s", [Overview, InfoHead, string:join(InfoAll, "")]).

line_status_extra(_Pid, Status, _) when Status =/= ?MAP_RUNNING ->
    killed;
line_status_extra(Pid, _Status, detail) ->
    map_srv:status(Pid);
line_status_extra(_Pid, _Status, _Ex) ->
    unknown.

