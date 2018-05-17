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
-include("common.hrl").
-include("logger.hrl").
-include("map.hrl").
-define(MAP_LINES, map_line_ets__).


-export([player_join_map/2]).
-export([player_exit_map/2]).
%% API
-export([start_link/1]).
-export([mod_init/1, do_handle_call/3, do_handle_info/2, do_handle_cast/2]).

player_join_map(MgrPid, Req) ->
    gen_server:call(MgrPid, {join_map, Req}).

player_exit_map(MgrPid, Params) ->
    gen_server:call(MgrPid, {exit_map, Params}).

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
    %% erlang:process_flag(trap_exit, true),
    %% erlang:process_flag(priority, high),
    ProcessName = misc:create_process_name(mod_map_mgr, [MapID]),
    erlang:register(ProcessName, self()),
    Ets = ets:new(?MAP_LINES, [{keypos, #map_line.line_id}, ?ETSRC]),
    ?INFO("mapMgr ~p started, line ets:~p,mapID:~p", [ProcessName, Ets, MapID]),
    {ok, #state{ets = Ets, map_id = MapID}}.

%%--------------------------------------------------------------------
do_handle_call({join_map, Req}, _From, State) ->
    Ret = player_join_map_1(State, Req),
    {reply, Ret, State};
do_handle_call({exit_map, PlayerID}, _From, State) ->
    Ret = player_exit_map_1(State, PlayerID),
    {reply, Ret, State};
do_handle_call(Request, From, State) ->
    ?ERROR("undeal call ~w from ~w", [Request, From]),
    {reply, ok, State}.

%%--------------------------------------------------------------------
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
player_join_map_1(
    S, #change_map_req{
        player_id = PlayerID,
        map_id = MapID,
        pos = Pos,
        obj = Obj
    }) ->
    MS = ets:fun2ms(
        fun(T) when T#map_line.limits > T#map_line.in
            -> T
        end),
    Line =
        case ets:select(S#state.ets, MS, 1) of
            {[Line1 | _], _Continue} ->
                Line1;
            _ ->
                create_new_line(S, S#state.map_id, next_line_id())
        end,

    #map_line{pid = MapPid, map_id = MapID, line_id = LineID} = Line,
    mod_map:player_join(MapPid, Obj),
    ets:update_counter(S#state.ets, LineID, {#map_line.in, 1}),
    #change_map_ack{map_id = MapID, line_id = LineID,  map_pid = MapPid, pos = Pos}.

%%--------------------------------------------------------------------
player_exit_map_1(_S, PlayerID) ->
%%    CurPid = undefined,
%%    mod_map:player_exit(CurPid, PlayerID).
    ok.

%%--------------------------------------------------------------------
create_new_line(S, MapID, LineID) ->
    ?WARN("ets:~p,~p,~p",[S#state.ets, MapID, LineID]),
    {ok, Pid} = mod_map_supervisor:start_child([MapID, LineID]),
    Line = #map_line{
        map_id = MapID,
        line_id = LineID,
        pid = Pid
    },
    ets:insert(S#state.ets, Line),
    ps_mgr:send(Pid, init_all_creatue),
    Line.


next_line_id() ->
    LineID =
        case get('LINE_ID') of
            undefined -> 1;
            V -> V + 1
        end,
    put('LINE_ID', LineID),
    LineID.