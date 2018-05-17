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
-export([start_link/1]).
-export([mod_init/1, do_handle_call/3, do_handle_info/2, do_handle_cast/2]).


player_exit(MapPid, PlayerID) ->
    gen_server:call(MapPid, {player_exit, PlayerID}).

player_join(MapPid, PlayerID) ->
    gen_server:call(MapPid, {player_join, PlayerID}).

status_(MapPid) -> ps_mgr:send(MapPid, status).


%%%===================================================================
%%% public functions
%%%===================================================================
start_link(Params) ->
    gen_serverw:start_link(?MODULE, Params, []).

%%%===================================================================
%%% Internal functions
%%%===================================================================	
mod_init([MapID, MapLine]) ->
     erlang:process_flag(trap_exit, true),
    %% erlang:process_flag(priority, high),
    ProcessName = misc:create_process_name(mod_map, [MapID,MapLine]),
    erlang:register(ProcessName, self()),
    ?INFO("map ~p:~p started",[ProcessName, self()]),
    {ok, lib_map:init(#map_state{map_id = MapID, line_id = MapLine})}.

%%--------------------------------------------------------------------
do_handle_call({init}, _From, State) ->
    NewState = lib_map:init(State),
    {reply, ok, NewState};
do_handle_call({player_join, Params}, _From, State) ->
    {Ret, NewState} = lib_map:player_join(State, Params),
    {reply, Ret, NewState};
do_handle_call({player_exit, Params}, _From, State) ->
    {Ret, NewState} = lib_map:player_exit(State, Params),
    {reply, Ret, NewState};
do_handle_call(Request, From, State) ->
    ?ERROR("undeal call ~w from ~w", [Request, From]),
    {reply, ok, State}.

%%--------------------------------------------------------------------
do_handle_info(status, State) ->
    catch show_status(),
    {noreply, State};
do_handle_info(tick_now, State) ->
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





