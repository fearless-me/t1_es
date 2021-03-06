%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 10. 五月 2018 11:06
%%%-------------------------------------------------------------------
-module(map_mgr_srv).
-author("mawenhong").

-behaviour(gen_serverw).
-include("logger.hrl").

-include("pub_def.hrl").
-include("gs_common_rec.hrl").
-include("gs_ps_def.hrl").
-include("map_core.hrl").
-include("gs_cache.hrl").
-include("cfg_map.hrl").


%% API
-export([start_link/1]).
-export([mod_init/1, do_handle_call/3, do_handle_info/2, do_handle_cast/2]).


%%%===================================================================
%%% public functions
%%%===================================================================
start_link(MapID) ->
    gen_serverw:start_link(?MODULE, [MapID], []).

-record(state, {ets, map_id = 0}).

%%%===================================================================
%%% Internal functions
%%%===================================================================
-define(MAP_LINES, map_mgr_line_ets).
mod_init([MapID]) ->
    ProcessName = misc:create_atom(?MODULE, [MapID]),
    true = erlang:register(ProcessName, self()),
    erlang:process_flag(trap_exit, true),
    erlang:process_flag(priority, high),
    EtsAtom = misc:create_atom(?MAP_LINES, [MapID]),
    Ets = misc_ets:new(EtsAtom, [named_table, public, {keypos, #m_map_line.line_id}, ?ETS_RC,?ETS_WC]),
    catch tick_recycle_line_msg(MapID),
    ?INFO("mapMgr ~p started, line ets:~p,mapID:~p", [ProcessName, Ets, MapID]),
    {ok, #state{ets = Ets, map_id = MapID}}.

%%--------------------------------------------------------------------
do_handle_call(get_line_ets, _From, State) ->
    {reply, State#state.ets, State};
do_handle_call({join_map, Req}, _From, State) ->
    Ret = do_player_join_map_call(State, Req),
    {reply, Ret, State};
do_handle_call({exit_map, Req}, _From, State) ->
    Ret = do_player_exit_map_call(State, Req),
    {reply, Ret, State};
%%do_handle_call({exit_map_excetipon, {Uid, LineId}}, _From, State) ->
%%    Ret = player_exit_map_exception_call(State, Uid, LineId),
%%    {reply, Ret, State};
do_handle_call(Request, From, State) ->
    ?ERROR("call ~w from ~w", [Request, From]),
    {reply, ok, State}.

%%--------------------------------------------------------------------
do_handle_info({deadline_stop, Line}, State) ->
    stop_map_line(State, Line, deadline_stop),
    {noreply, State};
do_handle_info({force_del_line_now, Line}, State) ->
    force_del_line(State, Line),
    {noreply, State};
do_handle_info(broadcast, State) ->
    {noreply, State};
do_handle_info(tick_recyle_line_msg, State) ->
    recycle_line(State),
    {noreply, State};
do_handle_info(Info, State) ->
    ?ERROR("info ~w", [Info]),
    {noreply, State}.

%%--------------------------------------------------------------------
do_handle_cast(Request, State) ->
    ?ERROR("cast ~w", [Request]),
    {noreply, State}.

%%--------------------------------------------------------------------
do_player_join_map_call(S, Req) ->
    #r_join_map_req{uid = Uid} = Req,
    Exists = object_priv:object_priv_exist(?UID_TYPE_PLAYER, Uid),
    do_player_join_map_call_1(Exists, S, Req).

do_player_join_map_call_1(true, _S, Req) ->
    #r_join_map_req{uid = Uid, tar_map_id = TarMapID, tar_line_id = TarLineId} = Req,
    ?ERROR("player ~p req join map ~p|~p, but player already in map ~w",
        [Uid, TarMapID, TarLineId, object_priv:find_object_priv(?UID_TYPE_PLAYER, Uid)]),
    #r_join_map_ack{map_id = TarMapID, error = ?MAP_CHANGE_EXCEPTION};
do_player_join_map_call_1(_Any, S, Req) ->
    %1. 选线
    #r_join_map_req{
        uid = Uid,
        tar_map_id = MapID, tar_line_id = TarLineId, force = Force
    } = Req,
    
    Res = map_mgr_priv:try_to_select_line(S#state.ets, MapID, TarLineId, Force, Uid),
    i_player_join_map_call(Res, Req, S).

%%--------------------------------------------------------------------
%%1.可以进入一条线
i_player_join_map_call(#m_map_line{pid = MapPid, map_id = MapID, line_id = LineID}, Req, _State) ->
    %3. 加入
    case map_interface:player_join_call(MapPid, Req) of
        ?MAP_CHANGE_OK ->
            #r_join_map_ack{
                error = ?MAP_CHANGE_OK,
                map_id = MapID, line_id = LineID, map_pid = MapPid,
                pos = Req#r_join_map_req.tar_pos
            };
        _ ->
            #r_join_map_ack{
                error = ?MAP_CHANGE_EXCEPTION,
                map_id = MapID, line_id = LineID, map_pid = MapPid
            }
    end;
%%2.没有线就返回错误
i_player_join_map_call(Res, _Req, _State) ->
    Res.

%%--------------------------------------------------------------------
do_player_exit_map_call(S, Req) ->
    %%1.
    #r_exit_map_req{uid = Uid, line_id = LineID, map_id = Mid} = Req,

    ?WARN("player ~p exit map_~p_~p", [Uid, S#state.map_id, LineID]),

    %2.
    case misc_ets:read(S#state.ets, LineID) of
        [#m_map_line{pid = Pid}] ->

            %% @todo 退出地图失败是否要处理
            map_interface:player_exit_call(Pid, Req);
        _ ->
            ?ERROR("player ~p exit map_~p_~p but line ~p not exists",
                [Uid, S#state.map_id, LineID, LineID]),
            #r_exit_map_ack{error = ?MAP_CHANGE_EXCEPTION, map_id = Mid}
    end.

%%player_exit_map_exception_call(S, Uid, LineID) ->
%%    ?WARN("player ~p exit map_~p_~p", [Uid, S#state.map_id, LineID]),
%%    case misc_ets:read(S#state.ets, LineID) of
%%        [#m_map_line{pid = Pid}] ->
%%            map_interface:player_exit_map_exception_call(Pid, Uid),
%%            ok;
%%        _ ->
%%            ?ERROR("player ~p exit map_~p_~p but line ~p not exists",
%%                [Uid, S#state.map_id, LineID, LineID])
%%    end,
%%    ok.

%%--------------------------------------------------------------------
stop_map_line(S, Line, Reason) ->
    #m_map_line{map_id = Mid, line_id = LineId, pid = Pid} = Line,
    ?WARN("~p|map_~p_~p will be stopped reason ~p", [Pid, Mid, LineId, Reason]),
    % 预留保护时间让玩家退出
    erlang:send_after(?DEAD_LINE_PROTECT, self(), {force_del_line_now, Line}),
    misc_ets:update_element(S#state.ets, LineId, {#m_map_line.status, ?MAP_READY_EXIT}),
    ps:send(Pid, start_stop_now),
    ok.

force_del_line(S, Line) ->
    #m_map_line{map_id = Mid, line_id = LineId, pid = Pid} = Line,
    IsAlive = misc:is_alive(Pid),
    ?TRY_CATCH_ONLY(clear_line_player(IsAlive, Mid, LineId)),
    ?WARN("~p|map_~p_~p will be killed(force:~p)", [Pid, Mid, LineId, IsAlive]),
    catch erlang:exit(Pid, force),
    misc_ets:delete(S#state.ets, LineId),

    ok.

clear_line_player(true, Mid, Line) ->
    erlang:spawn
    (
        fun() ->
            Match = #m_cache_map_object_priv{map_id = Mid, line_id = Line, _ = '_'},
            misc_ets:match_delete(?ETS_CACHE_MAP_PLAYER_PRIV, Match),
            misc_ets:match_delete(?ETS_CACHE_MAP_MONSTER_PRIV, Match),
            misc_ets:match_delete(?ETS_CACHE_MAP_NPC_PRIV, Match),
            misc_ets:match_delete(?ETS_CACHE_MAP_PET_PRIV, Match)
        end
    );
clear_line_player(_, _Mid, _Line) -> skip.

tick_recycle_line_msg(MapId) ->
    case map_creator_interface:can_recycle_no_player(MapId) of
        true -> erlang:send_after(?MAP_MGR_RECYCLE_TIME, self(), tick_recyle_line_msg);
        _Any -> skip
    end.

recycle_line(S) ->
    catch do_recycle_line(S),
    catch tick_recycle_line_msg(S#state.map_id),
    ok.

do_recycle_line(S) ->
    MS =
        ets:fun2ms
        (
            fun(#m_map_line{in = In, status = Status} = T)
                when In == 0, Status =:= ?MAP_RUNNING -> T
            end
        ),
    case misc_ets:select(S#state.ets, MS, ?MAP_MGR_RECYCLE_THR) of
        {Matched, _Continue} ->
            lists:foreach(fun(Line) -> stop_map_line(S, Line, recycle_line) end, Matched);
        _EndOfTable -> skip
    end.