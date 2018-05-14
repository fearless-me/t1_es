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

-export([is_full/0]).
-export([player_will_join/2, player_leave/2]).

%% API
-export([start_link/2]).
-export([mod_init/1, do_handle_call/3, do_handle_info/2, do_handle_cast/2]).

is_full() -> false.
player_will_join(_MapPid, _ID) -> ok.
player_leave(_MapPid, _ID) -> ok.


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
do_handle_call({init}, From, State) ->
    Ret = init(State),
    {reply, Ret, State};
do_handle_call(Request, From, State) ->
    ?ERROR("undeal call ~w from ~w", [Request, From]),
    {reply, ok, State}.

%%--------------------------------------------------------------------
do_handle_info(Info, State) ->
    ?ERROR("undeal info ~w", [Info]),
    {noreply, State}.

%%--------------------------------------------------------------------
do_handle_cast(Request, State) ->
    ?ERROR("undeal cast ~w", [Request]),
    {noreply, State}.


init(#map_state{
    map_id = MapID
} = State
)->
    Conf = mod_map_creator:map_conf(MapID),
    ok = init_vis_tile(Conf),
    ok = init_npc(Conf),
    ok = init_monster(Conf),
    ok.

init_vis_tile(Conf) -> ok.
init_npc(Conf) -> ok.
init_monster(Conf) -> ok.



