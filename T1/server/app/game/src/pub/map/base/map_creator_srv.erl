%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 10. 五月 2018 11:06
%%%-------------------------------------------------------------------
-module(map_creator_srv).
-author("mawenhong").

-behaviour(gen_serverw).
-include("logger.hrl").
-include("pub_def.hrl").
-include("gs_ps_def.hrl").
-include("map_core.hrl").
-include("cfg_mapsetting.hrl").

%%
-export([start_link/0]).
-export([mod_init/1, do_handle_call/3, do_handle_info/2, do_handle_cast/2]).

%%%===================================================================
%%% public functions
%%%===================================================================
start_link() ->
    gen_serverw:start_link({local, ?GS_MAP_CREATOR_OTP}, ?MODULE, [], []).

%%%===================================================================
%%% Internal functions
%%%===================================================================	
mod_init(_Args) ->
    erlang:process_flag(trap_exit, true),
    erlang:process_flag(priority, high),
    
    misc_ets:new(?MAP_MGR_ETS, [protected, named_table, {keypos, #m_map_mgr.map_id}, ?ETS_RC]),
    
    start_all_map_mgr(),

    ?INFO("map_creator started"),
    {ok, {}}.

%%--------------------------------------------------------------------	
do_handle_call(Request, From, State) ->
    ?ERROR("call ~w from ~w", [Request, From]),
    {reply, ok, State}.

%%--------------------------------------------------------------------
do_handle_info(Info, State) ->
    ?ERROR("info ~w", [Info]),
    {noreply, State}.

%%--------------------------------------------------------------------
do_handle_cast(Request, State) ->
    ?ERROR("cast ~w", [Request]),
    {noreply, State}.

%%--------------------------------------------------------------------
start_all_map_mgr() ->
    IsCross = gs_interface:is_cross(),
    L = getCfg:get1KeyList(cfg_map),
    _ = [load_one_map(IsCross, getCfg:getCfgByArgs(cfg_map, MapID)) || MapID <- L],
    check_mgr(misc_ets:size(?MAP_MGR_ETS)),
    ok.

load_one_map(true, #mapsettingCfg{is_cross = ?MAP_EXIST_TYPE_NORMAL, id = MapID}) ->
    ?WARN("~p This is a cross-server won't create normal map mgr ~p ", [node(), MapID]),
    ok;
load_one_map(false, #mapsettingCfg{is_cross = ?MAP_EXIST_TYPE_CROSS, id = MapID}) ->
    ?WARN("~p This is a normal-server won't create cross-server map mgr ~p ", [node(), MapID]),
    ok;
load_one_map(_Any, MapCfg) -> do_load_one_map(MapCfg).

do_load_one_map(#mapsettingCfg{id = MapID}) ->
    {ok, Pid} = map_mgr_sup:start_child(MapID),
    Ets = gen_server:call(Pid, get_line_ets, infinity),
    misc_ets:write(?MAP_MGR_ETS, #m_map_mgr{map_id = MapID, mgr = Pid, line_ets = Ets}),
    ok.


check_mgr(0)->
    lists:foreach(
        fun(_)->
            ?FATAL("server ~p has *0* maps",[erlang:node()])
        end, lists:seq(1, 5));
check_mgr(_) -> skip.





