%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 15. 八月 2018 16:24
%%%-------------------------------------------------------------------
-module(center_priv).
-author("mawenhong").
-include("logger.hrl").
-include("pub_def.hrl").
-include("pub_rec.hrl").
-include("common_def.hrl").
-include("gs_ps_def.hrl").
-include("gs_cache.hrl").
-include("center_srv.hrl").


%% API
-export([
    init/0,
    register_ack/2, nodedown/1, ack_timeout/1, other_down/1,
    sync_all_data/1, start_now/1, tick_check_connect/0
]).


%%%-------------------------------------------------------------------
init() ->
    misc_ets:new(?CenterServerEts, [set, protected, named_table, {keypos, #recCenterInfo.id}, ?ETS_RC]),
    tick_msg(),
    connect_cs_node(),
    ok.

%%-------------------------------------------------------------------
register_ack(MgrPid, {true, WorkerPid}) ->
    DbID = gs_interface:get_sid(),
    ps:send_with_from(MgrPid, ackMeNow, {DbID}),
    ?WARN("[~p][~p]register to centerServer[~p] ok, worker[~p],wait sync",
        [self(), DbID, erlang:node(MgrPid), WorkerPid]),
    ok;
register_ack(MgrPid, {false, Reason}) ->
    ?ERROR("[~p]register to centerServer[~p] failed, y[~p]",
        [self(), erlang:node(MgrPid), Reason]),
    ok;
register_ack(MgrPid, Data) ->
    ?ERROR("[~p]register to centerServer[~p] undeal[~p]",
        [self(), erlang:node(MgrPid), Data]),
    ok.

%%%-------------------------------------------------------------------
%%%-------------------------------------------------------------------
nodedown(NodeName) ->
    ?WARN("centerServer Node[~p] is down", [NodeName]),
    misc_ets:write(?CenterServerEts, #recCenterInfo{}),
    center_nodedown(gs_interface:is_cross()),
    ok.
%%%-------------------------------------------------------------------
center_nodedown(true) ->
    ?WARN("center server nodedown, all backGS"),
    ok;
center_nodedown(_IsCrossServer) ->
    ok.

%%%-------------------------------------------------------------------
other_down({Sid, ?SERVER_TYPE_GAME, GSNode}) ->
    kick_all_player(
        gs_interface:is_cross(),
        Sid,
        GSNode
    ),
    ok;
other_down({_Sid, _Type, _GSNode}) ->
    ok.

kick_all_player(true, Sid, GSNode) ->
    ?WARN("*** server ~p|~p down, kick all player in this cross ***", [Sid, GSNode]),
    erlang:spawn(
        fun() ->
            QS =
                ets:fun2ms
                (
                    fun(Info) when Info#m_cache_online_player.sid == Sid ->
                        {
                            Info#m_cache_online_player.aid,
                            Info#m_cache_online_player.uid,
                            Info#m_cache_online_player.map_id,
                            Info#m_cache_online_player.line
                        }
                    end
                ),
            List = misc_ets:select(?ETS_CACHE_ONLINE_PLAYER, QS),
            lists:foreach(
                fun({Aid, Uid, Mid, LineId}) ->
                    Mgr = map_creator_interface:map_mgr_l(Mid),
                    map_mgr_interface:player_exit_map_exception_call(Mgr, {Uid, LineId}),
                    gs_cache_interface:offline(Aid, Uid)
                end, List)
        end),
    ok;
kick_all_player(_Any, _Sid, _GSNode) -> skip.

%%%-------------------------------------------------------------------
ack_timeout(MgrPid) ->
    ?ERROR("ackTimeout to centerServer[~p]",
        [erlang:node(MgrPid)]),
    misc_ets:write(?CenterServerEts, #recCenterInfo{}),
    ok.
%%%-------------------------------------------------------------------
sync_all_data(CsWorkerPid) ->
    DBId = gs_interface:get_sid(),
    ?WARN("[~p][~p]start syncAllData cs worker ~p...", [self(), DBId, CsWorkerPid]),
    ok.


start_now(WorkerPid) ->
    misc_ets:write(?CenterServerEts, #recCenterInfo{pid = WorkerPid, status = ?SEVER_STATUS_DONE}),
    %% game/cross server 成功连接 center server，通知?PublicDataMgr是否要同步真实DBID映射表

    ?WARN("####centerServer[~p][ok]####", [erlang:node(WorkerPid)]),
    ok.

%%%-------------------------------------------------------------------
tick_check_connect() ->
    inc_tick_count(),
    tick_msg(),
    case gs_cs_interface:is_center_ready() of
        true ->
            skip;
        _ ->
            tick_connect_cs_node()
    end,
    ok.

tick_connect_cs_node() ->
    case (tick_count() rem ?ConnectTick) =:= 0 of
        true ->
            connect_cs_node();
        _ ->
            skip
    end,
    ok.

connect_cs_node() ->
    Now = misc_time:utc_seconds(),
    case misc_ets:read(?CenterServerEts, ?CenterServerKey) of
        [#recCenterInfo{status = ?SEVER_STATUS_DONE}] ->
            ok;
        [#recCenterInfo{status = ?SEVER_STATUS_READY, dead_line = DeadLine}] when DeadLine >= Now ->
            skip;
        _ ->
            DbID = gs_interface:get_sid(),
            Node = gs_interface:get_center_node(),
            connect_cs_node(DbID, Node),
            ok
    end,
    ok.

connect_cs_node(undefined, _Node) ->
    skip;
connect_cs_node(DBId, Node) ->
    case net_kernel:connect_node(Node) of
        true ->
            %% 已连通，打印信息
            ?WARN("[~p][~p]start register to centerServer[~p]", [self(), DBId, Node]),
            %% 监控节点
            erlang:monitor_node(Node, false),
            erlang:monitor_node(Node, true),
            gs_share:restart(),

            %% 告诉跨服，保存本节点
            case gs_cs_interface:register(Node) of
                true ->
                    DeadLine = misc_time:utc_seconds() + ?ConnectTimeoutSec,
                    misc_ets:write(?CenterServerEts, #recCenterInfo{status = ?SEVER_STATUS_READY, dead_line = DeadLine}),
                    ?WARN("[~p][~p]wait centerServer regiseter ack", [self(), DBId]),
                    ok;
                _ ->
                    skip
            end,

            ok;
        _ ->
            ?WARN("[~p][~p]connect centerServer failed:~p", [self(), DBId, Node]),
            ok
    end,
    ok.

tick_msg() ->
    erlang:send_after(?TickTime, self(), check_connect).


tick_count() ->
    case get(tickCount) of
        undefined -> 0;
        V -> V
    end.

inc_tick_count() ->
    V = tick_count(),
    put(tickCount, V + 1).