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
-include("error_code.hrl").
-include("pub_def.hrl").
-include("gs_common_rec.hrl").
-include("gs_ps_def.hrl").
-include("map_core.hrl").


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
    Ets = misc_ets:new(EtsAtom, [named_table, public, {keypos, #m_map_line.line_id}, ?ETS_RC]),
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
do_handle_call({exit_map_excetipon, {Uid, LineId}}, _From, State) ->
    Ret = player_exit_map_exception_call(State, Uid, LineId),
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
    #r_join_map_req{
        tar_map_id = MapID, tar_line_id = TarLineId, force = Force
    } = Req,
    
    Recover = map_creator_interface:map_line_recover(MapID),
    Now = misc_time:milli_seconds(),
    MS =
        ets:fun2ms(
            fun(#m_map_line{
                line_id = CurLineID,
                limits = Limit, in = In, reserve = Reserve,
                dead_line = DeadLine, status = Status
            } = T
            ) when
                In >= 0,
                (Limit > In orelse (Force andalso Limit + Reserve > In)),
                DeadLine > Now + ?DEAD_LINE_PROTECT,
                Status =:= ?MAP_NORMAL,
                (TarLineId =:= 0 orelse CurLineID =:= TarLineId orelse Recover =:= ?MAP_LINE_RECOVER_ANY_NEW)
                -> T
            end
        ),
    Res =
        case misc_ets:select(S#state.ets, MS, 2) of
            {[Line1], _Continue} -> Line1;
            {[Line11, _], _Continue} when Line11#m_map_line.line_id  =:= TarLineId -> Line11;
            {[_, Line22], _Continue} -> Line22;
            EndOfTable ->  EndOfTable
        end,
    
    i_player_join_map_call(Res, Recover, Req, S).

%%--------------------------------------------------------------------
%%1.可以进入一条线
i_player_join_map_call(#m_map_line{pid = MapPid, map_id = MapID, line_id = LineID}, _, Req, State) ->
    %3. 加入
    case map_interface:player_join_call(MapPid, Req) of
        ?E_Success ->
            #r_join_map_ack{error = ?E_Success, map_id = MapID, line_id = LineID, map_pid = MapPid, pos = Req#r_join_map_req.tar_pos};
        _ ->
            #r_join_map_ack{map_id = MapID, line_id = LineID, map_pid = MapPid, error = ?E_Exception}
    end;
%%2.没有线就返回错误
i_player_join_map_call(_Any, ?MAP_LINE_RECOVER_ERR, Req, _State) ->
    #r_join_map_ack{map_id = Req#r_join_map_req.tar_map_id, error = ?E_Exception};
%%3.没有线就创建一条新线
i_player_join_map_call(_Any, Recover, Req, State) ->
    case catch create_new_line(State, State#state.map_id, next_line_id()) of
        #m_map_line{} = Line ->
            i_player_join_map_call(Line, Recover, Req, State);
        Error ->
            ?ERROR("create map ~p new line error ~p",[State#state.map_id, Error]),
            #r_join_map_ack{map_id = Req#r_join_map_req.tar_map_id, error = ?E_MapCreateLineFailed}
    end.

%%--------------------------------------------------------------------
do_player_exit_map_call(S, Req) ->
    %%1.
    #r_exit_map_req{uid = Uid, line_id = LineID, map_id = Mid} = Req,
    
    ?WARN("player ~p exit map_~p_~p", [Uid, S#state.map_id, LineID]),
    
    %2.
    case misc_ets:read(S#state.ets, LineID) of
        [#m_map_line{pid = Pid}] ->

            %% @todo 退出地图失败是否要处理
            ExitRes = map_interface:player_exit_call(Pid, Req),
            #r_exit_map_ack{error = ExitRes, map_id = Mid, line_id = LineID };
        _ ->
            ?ERROR("player ~p exit map_~p_~p but line ~p not exists",
                [Uid, S#state.map_id, LineID, LineID]),
            #r_exit_map_ack{error = ?E_Exception, map_id = Mid}
    end.

player_exit_map_exception_call(S, Uid, LineID) ->
    ?WARN("player ~p exit map_~p_~p", [Uid, S#state.map_id, LineID]),
    case misc_ets:read(S#state.ets, LineID) of
        [#m_map_line{pid = Pid}] ->
            map_interface:player_exit_map_exception_call(Pid, Uid),
            ok;
        _ ->
            ?ERROR("player ~p exit map_~p_~p but line ~p not exists",
                [Uid, S#state.map_id, LineID, LineID])
    end,
    ok.

%%--------------------------------------------------------------------
create_new_line(S, MapID, LineID) ->
    %% @todo 此处要根据地图类型的不同来采取不同的策略
    %% 比如副本地图不用做任何优化
    %% 但是长时间存在的地图必须要调整内存相关属性，减少GC
    {ok, Pid} = map_sup:start_child([MapID, LineID, S#state.ets]),
    Line = #m_map_line{
        map_id = MapID, line_id = LineID, pid = Pid, status = ?MAP_NORMAL,
        dead_line = misc_time:milli_seconds() + ?LINE_LIFETIME
    },
    erlang:send_after(?LINE_LIFETIME, self(), {stop_line, Line}),
    misc_ets:write(S#state.ets, Line),
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
    misc_ets:update_element(S#state.ets, LineId, {#m_map_line.status, ?MAP_READY_EXIT}),
    ps:send(Pid, start_stop_now),
    ok.

force_del_line(S, Line) ->
    #m_map_line{map_id = Mid, line_id = LineId, pid = Pid} = Line,
    ?WARN("map_~p_~p ~p will be killed(force:~p)",
        [Mid, LineId, Pid, misc:is_alive(Pid)]),
    catch erlang:exit(Pid, normal),
    misc_ets:delete(S#state.ets, LineId),
    ok.

