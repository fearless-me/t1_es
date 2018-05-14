%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 10. 五月 2018 11:06
%%%-------------------------------------------------------------------
-module(mod_map_creator).
-author("mawenhong").

-behaviour(gen_serverw).
-include("logger.hrl").

%% API
-export([take_over_player_online/0]).
-export([player_change_map/1]).
-export([map_conf/1]).
-export([broadcast_all/0, broadcast_map/1]).

%%
-export([start_link/0]).
-export([mod_init/1, do_handle_call/3, do_handle_info/2, do_handle_cast/2]).



take_over_player_online() ->
    Mgr = map_mgr(1),
    case mod_map_mgr:player_join_map(Mgr, 0) of
        {_MapPid, _Pos} = Msg -> ps_mgr:send(0, Msg);
         _ -> kick_to_born_map(0)
    end,
    ok.

player_change_map({PlayerID,CurMap,TarMap})->
    CurMgr = map_mgr(CurMap),
    TarMgr = map_mgr(TarMap),
    mod_map_mgr:player_exit_map(CurMgr, PlayerID),
    case mod_map_mgr:player_join_map(TarMgr, PlayerID) of
        {_MapPid, _Pos} = Msg -> ps_mgr:send(0, Msg);
        _ -> kick_to_born_map(0)
    end,
    ok.

broadcast_all() ->

    ok.

broadcast_map(MapID) ->
    ok.

map_mgr(MapID) ->
    ok.

map_conf(MapID) ->
    ok.

kick_to_born_map(PlayerID) ->
    ok.


%%%===================================================================
%%% public functions
%%%===================================================================
start_link() ->
    gen_serverw:start_link({local, ?MODULE}, ?MODULE, [], []).

%%%===================================================================
%%% Internal functions
%%%===================================================================	
mod_init(_Args) ->
    erlang:process_flag(trap_exit, true),
    erlang:process_flag(priority, high),

    load_all_map(),

    {ok, {}}.

%%--------------------------------------------------------------------	
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

%%--------------------------------------------------------------------
load_all_map() ->
    L = lists:seq(1,10),
    _ = [ load_one_map(MapID) || MapID <- L],
    ok.

load_one_map(MapID) ->
    ok.








