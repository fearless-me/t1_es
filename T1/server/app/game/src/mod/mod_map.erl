%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 10. 五月 2018 11:09
%%%-------------------------------------------------------------------
-module(mod_map).
-author("mawenhong").

-behaviour(gen_serverw).
-include("logger.hrl").
-include("map.hrl").


-export([status_/1]).
-export([player_exit/2, player_join/2]).

%% API
-export([start_link/2]).
-export([mod_init/1, do_handle_call/3, do_handle_info/2, do_handle_cast/2]).


player_exit(MapPid, PlayerID) ->
    gen_server:call(MapPid, {exit, PlayerID}).

player_join(MapPid, PlayerID) ->
    gen_server:call(MapPid, {join, PlayerID}).


status_(MapPid) -> ps_mgr:send(MapPid, status).


%%%===================================================================
%%% public functions
%%%===================================================================
start_link(MapID, MapLine) ->
    gen_serverw:start_link(?MODULE, [{MapID, MapLine}], []).

%%%===================================================================
%%% Internal functions
%%%===================================================================	
mod_init({MapID, MapLine}) ->
    %% erlang:process_flag(trap_exit, true),
    %% erlang:process_flag(priority, high),
    ProcessName = misc:create_process_name(mod_map, [MapID,MapLine]),
    erlang:register(ProcessName, self()),
    {ok, #map_state{map_id = MapID}}.

%%--------------------------------------------------------------------
do_handle_call({init}, _From, State) ->
    NewState = lib_map:init(State),
    {reply, ok, NewState};
do_handle_call({join, Params}, _From, State) ->
    {Ret, NewState} = lib_map:player_join(State, Params),
    {reply, Ret, NewState};
do_handle_call({exit, Params}, _From, State) ->
    {Ret, NewState} = lib_map:player_exit(State, Params),
    {reply, Ret, NewState};
do_handle_call(Request, From, State) ->
    ?ERROR("undeal call ~w from ~w", [Request, From]),
    {reply, ok, State}.

%%--------------------------------------------------------------------
do_handle_info(status, State) ->
    catch show_status(),
    {noreply, State};
do_handle_info(tick, State) ->
    {noreply, lib_map:tick(State)};
do_handle_info(Info, State) ->
    ?ERROR("undeal info ~w", [Info]),
    {noreply, State}.

%%--------------------------------------------------------------------
do_handle_cast(Request, State) ->
    ?ERROR("undeal cast ~w", [Request]),
    {noreply, State}.

show_status() ->
    ok.





