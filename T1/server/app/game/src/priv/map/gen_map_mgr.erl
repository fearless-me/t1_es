%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 10. 五月 2018 11:06
%%%-------------------------------------------------------------------
-module(gen_map_mgr).
-author("mawenhong").

-behaviour(gen_serverw).
-include("pub_common.hrl").
-include("logger.hrl").
-include("map.hrl").
-include("common_record.hrl").
-include("map_unit.hrl").

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
    ProcessName = misc:create_atom(gen_map_mgr, [MapID]),
    true = erlang:register(ProcessName, self()),
    erlang:process_flag(trap_exit, true),
    erlang:process_flag(priority, high),
    EtsAtom = misc:create_atom(?MAP_LINES, [MapID]),
    Ets = ets:new(EtsAtom, [named_table, protected, {keypos, #m_map_line.line_id}, ?ETS_RC]),
    ?INFO("mapMgr ~p started, line ets:~p,mapID:~p", [ProcessName, Ets, MapID]),
    ps:send(gen_map_creator, map_mgr_line_ets, {MapID, EtsAtom}),
    {ok, #state{ets = Ets, map_id = MapID}}.

%%--------------------------------------------------------------------
do_handle_call({join_map, Req}, _From, State) ->
    Ret = do_player_join_map_call(State, Req),
    {reply, Ret, State};
do_handle_call({exit_map, Req}, _From, State) ->
    Ret = do_player_exit_map_call(State, Req),
    {reply, Ret, State};
do_handle_call(Request, From, State) ->
    ?ERROR("undeal call ~w from ~w", [Request, From]),
    {reply, ok, State}.

%%--------------------------------------------------------------------
do_handle_info({stop_line, Line}, State) ->
    stop_map_line(State, Line),
    {noreply, State};
do_handle_info({force_del_line_now, Line}, State) ->
    force_del_line(State, Line),
    {noreply, State};
do_handle_info(broadcast, State) ->
    {noreply, State};
do_handle_info(Info, State) ->
    ?ERROR("undeal info ~w", [Info]),
    {noreply, State}.

%%--------------------------------------------------------------------
do_handle_cast(Request, State) ->
    ?ERROR("undeal cast ~w", [Request]),
    {noreply, State}.

%%--------------------------------------------------------------------
do_player_join_map_call(S, Req) ->
    %1. 选线
    #r_change_map_req{
        tar_map_id = MapID, tar_line_id = TarLineId,
        tar_pos = Pos, force = Force
    } = Req,

    Now = time:milli_seconds(),
    MS =
        ets:fun2ms(
            fun(#m_map_line{
                line_id = CurLineID,
                limits = Limit,
                in = In,
                reserve = Reserve,
                dead_line = DeadLine,
                status = Status
            } = T) when (Limit > In orelse (Force andalso Limit + Reserve > In )),
                        DeadLine > Now + ?DEAD_LINE_PROTECT,
                        Status =:= ?MAP_NORMAL,
                        (TarLineId =:= 0 orelse CurLineID =:= TarLineId)
                -> T
            end
        ),
    Line =
        case ets:select(S#state.ets, MS, 1) of
            {[Line1 | _], _Continue} ->
                Line1;
            _ ->
                create_new_line(S, S#state.map_id, next_line_id())
        end,

    %2. ** MapID 与第一行的MapID 强制匹配下
    #m_map_line{pid = MapPid, map_id = MapID, line_id = LineID} = Line,

    %3. 加入
    map_pub:player_join_call(MapPid, Req),

    %4. 更新
    ets:update_counter(S#state.ets, LineID, {#m_map_line.in, 1}),

    %5. ack
    #r_change_map_ack{map_id = MapID, line_id = LineID, map_pid = MapPid, pos = Pos}.

%%--------------------------------------------------------------------
do_player_exit_map_call(S, Req) ->
    %%1.
    #r_exit_map_req{uid = Uid, line_id = LineID} = Req,

    ?WARN("player ~p exit map_~p_~p", [Uid, S#state.map_id, LineID]),

    %2.
    case ets:lookup(S#state.ets, LineID) of
        [#m_map_line{pid = Pid}] ->
            ets:update_counter(S#state.ets, LineID, {#m_map_line.in, -1}),
            map_pub:player_exit_call(Pid, Req);
        _ ->
            ?ERROR("player ~p exit map_~p_~p but line ~p not exists",
                [Uid, S#state.map_id, LineID, LineID]),
            error
    end.

%%--------------------------------------------------------------------
create_new_line(S, MapID, LineID) ->
    {ok, Pid} = map_sup:start_child([MapID, LineID]),
    Line = #m_map_line{
        map_id = MapID, line_id = LineID, pid = Pid,
        dead_line = time:milli_seconds() + ?LINE_LIFETIME
    },
    erlang:send_after(?LINE_LIFETIME, self(), {stop_line, Line}),
    ets:insert(S#state.ets, Line),
    ?WARN("map_~p_~p ~p start, mgr ets ~p", [MapID, LineID, Pid, S#state.ets]),
    Line.


next_line_id() ->
    LineID =
        case get('LINE_ID') of
            undefined -> 1;
            V -> V + 1
        end,
    put('LINE_ID', LineID),
    LineID.

stop_map_line(S, Line) ->
    #m_map_line{map_id = Mid, line_id = LineId, pid = Pid} = Line,
    ?WARN("map_~p_~p ~p will be stopped", [Mid, LineId, Pid]),
    % 预留保护时间让玩家退出
    erlang:send_after(?DEAD_LINE_PROTECT, self(), {force_del_line_now, Line}),
    ets:update_element(S#state.ets, LineId, {#m_map_line.status, ?MAP_READY_EXIT}),
    ps:send(Pid, start_stop_now),
    ok.

force_del_line(S, Line) ->
    #m_map_line{line_id = LineId, pid = Pid} = Line,
    catch erlang:exit(Pid, normal),
    ets:delete(S#state.ets, LineId),
    ok.