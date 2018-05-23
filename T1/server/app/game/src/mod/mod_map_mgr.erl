%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 10. 五月 2018 11:06
%%%-------------------------------------------------------------------
-module(mod_map_mgr).
-author("mawenhong").

-behaviour(gen_serverw).
-include("pub_common.hrl").
-include("logger.hrl").
-include("map.hrl").
-include("map_obj.hrl").
-define(MAP_LINES, map_line_ets__).
-define(LINE_LIFETIME, 30 * 1000).
-define(DEAD_LINE_PROTECT, 15 * 1000).


-export([player_join_map/2]).
-export([player_exit_map/2]).

%% API
-export([start_link/1]).
-export([mod_init/1, do_handle_call/3, do_handle_info/2, do_handle_cast/2]).

player_join_map(MgrPid, Req) ->
    gen_server:call(MgrPid, {join_map, Req}).

player_exit_map(MgrPid, Req) ->
    gen_server:call(MgrPid, {exit_map, Req}).

%%%===================================================================
%%% public functions
%%%===================================================================
start_link(MapID) ->
    gen_serverw:start_link(?MODULE, [MapID], []).

-record(state, {ets, map_id = 0}).

%%%===================================================================
%%% Internal functions
%%%===================================================================	
mod_init([MapID]) ->
    ProcessName = misc:create_process_name(mod_map_mgr, [MapID]),
    true = erlang:register(ProcessName, self()),
    erlang:process_flag(trap_exit, true),
    erlang:process_flag(priority, high),
    Ets = ets:new(?MAP_LINES, [{keypos, #m_map_line.line_id}, ?ETSRC]),
    ?INFO("mapMgr ~p started, line ets:~p,mapID:~p", [ProcessName, Ets, MapID]),
    {ok, #state{ets = Ets, map_id = MapID}}.

%%--------------------------------------------------------------------
do_handle_call({join_map, Req}, _From, State) ->
    Ret = player_join_map_1(State, Req),
    {reply, Ret, State};
do_handle_call({exit_map, Req}, _From, State) ->
    Ret = player_exit_map_1(State, Req),
    {reply, Ret, State};
do_handle_call(Request, From, State) ->
    ?ERROR("undeal call ~w from ~w", [Request, From]),
    {reply, ok, State}.

%%--------------------------------------------------------------------
do_handle_info({stop_line, Line}, State) ->
    stop_map_line(State, Line),
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
player_join_map_1(S, Req) ->
    Now = misc:milli_seconds(),
    #r_change_map_req{tar_map_id = MapID, tar_pos = Pos, obj = Obj} = Req,
    MS = ets:fun2ms(
        fun(T) when T#m_map_line.limits > T#m_map_line.in,
                    T#m_map_line.dead_line > Now + ?DEAD_LINE_PROTECT
            -> T
        end),
    Line =
        case ets:select(S#state.ets, MS, 1) of
            {[Line1 | _], _Continue} ->
                Line1;
            _ ->
                create_new_line(S, S#state.map_id, next_line_id())
        end,

    #m_map_line{pid = MapPid, map_id = MapID, line_id = LineID} = Line,
    mod_map:player_join(MapPid, Obj#r_map_obj{map_id = MapID, line_id = LineID, map_pid = MapPid}),
    ets:update_counter(S#state.ets, LineID, {#m_map_line.in, 1}),
    #r_change_map_ack{map_id = MapID, line_id = LineID,  map_pid = MapPid, pos = Pos}.

%%--------------------------------------------------------------------
player_exit_map_1(_S, Req) ->
    MapPid = Req#r_exit_map_req.map_pid,
    case misc:is_alive(MapPid) of
        true -> mod_map:player_exit(MapPid, Req);
        _ -> skip
    end,
    ok.

%%--------------------------------------------------------------------
create_new_line(S, MapID, LineID) ->
    {ok, Pid} = mod_map_supervisor:start_child([MapID, LineID]),
    Line = #m_map_line{
        map_id = MapID,
        line_id = LineID,
        pid = Pid,
        dead_line = misc:milli_seconds() + ?LINE_LIFETIME
    },
    erlang:send_after(?LINE_LIFETIME, self(), {stop_line, Line}),
    ets:insert(S#state.ets, Line),
    ?INFO("map ~p create new line ~p,~p",[MapID, LineID, Pid]),
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
    ?INFO("map ~p line ~p pid ~p will be stopped",
        [Line#m_map_line.map_id, Line#m_map_line.line_id, Line#m_map_line.pid]),
    ets:delete(S#state.ets, Line#m_map_line.line_id),
    ps:send(Line#m_map_line.pid, start_stop_now),
    ok.