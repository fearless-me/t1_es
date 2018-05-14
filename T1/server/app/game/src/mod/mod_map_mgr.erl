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
-include("move.hrl").
-include("map.hrl").

-export([player_join_map/2]).
-export([player_exit_map/2]).
%% API
-export([start_link/1]).
-export([mod_init/1, do_handle_call/3, do_handle_info/2, do_handle_cast/2]).

player_join_map(MgrPid, Params) ->
    gen_server:call(MgrPid, {join_map, Params}).

player_exit_map(MgrPid, Params) ->
    gen_server:call(MgrPid, {exit_map, Params}).

%%%===================================================================
%%% public functions
%%%===================================================================
start_link(MapID) ->
    gen_serverw:start_link(?MODULE, [MapID], []).

%%%===================================================================
%%% Internal functions
%%%===================================================================	
mod_init(MapID) ->
    %% erlang:process_flag(trap_exit, true),
    %% erlang:process_flag(priority, high),
    ProcessName = misc:create_process_name(mod_map_mgr, [MapID]),
    erlang:register(ProcessName, self()),
    ets:new(?MAP_LINES,
        [named_table, {keypos, #map_line.map_id}, ?ETSRC]),

    {ok, #{}}.

%%--------------------------------------------------------------------
do_handle_call({join_map, Params}, From, State) ->
    Ret = player_join_map_1(Params),
    {reply, Ret, State};
do_handle_call({exit_map, PlayerID}, From, State) ->
    Ret = player_exit_map_1(PlayerID),
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
player_join_map_1({MapID, PlayerPid, PlayerID, Pos}) ->
    MS = ets:fun2ms(
        fun(T) when
            T#map_line.limits > T#map_line.in + T#map_line.ready
            -> T
        end),
    SelectLine =
        case ets:select(?MAP_LINES, MS, 1) of
            {[Line | _], _Continue} ->
                Line;
            _ ->
                create_new_line()
        end,

    #map_line{pid = MapPid} = SelectLine,
    mod_map:player_will_join(MapPid, PlayerID),
    ets:update_counter(?MAP_LINES, MapID, {#map_line.ready, 1}),
    {MapPid, Pos}.

%%--------------------------------------------------------------------
player_exit_map_1(PlayerID) ->
    CurPid = undefined,
    mod_map:player_leave(CurPid, PlayerID).

%%--------------------------------------------------------------------
create_new_line() ->
    ok.

