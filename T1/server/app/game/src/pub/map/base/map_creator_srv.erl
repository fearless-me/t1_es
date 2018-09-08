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
-include("gs_map_inc.hrl").
-include("cfg_map.hrl").

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

    ets:new(?MAP_MGR_ETS, [protected, named_table, {keypos, #m_map_mgr.map_id}, ?ETS_RC]),

    load_all_map(),

    ?INFO("map_creator started"),
    {ok, {}}.

%%--------------------------------------------------------------------	
do_handle_call(Request, From, State) ->
    ?ERROR("undeal call ~w from ~w", [Request, From]),
    {reply, ok, State}.

%%--------------------------------------------------------------------
do_handle_info({map_mgr_line_ets, {MapID, Ets}}, State) ->
    ets:update_element(?MAP_MGR_ETS, MapID, {#m_map_mgr.line_ets, Ets}),
    {noreply, State};
do_handle_info(Info, State) ->
    ?ERROR("undeal info ~w", [Info]),
    {noreply, State}.

%%--------------------------------------------------------------------
do_handle_cast(Request, State) ->
    ?ERROR("undeal cast ~w", [Request]),
    {noreply, State}.

%%--------------------------------------------------------------------
load_all_map() ->
    IsCross = gs_conf:is_cross(),
    L = getCfg:get1KeyList(cfg_map),
    _ = [load_one_map(IsCross, getCfg:getCfgByArgs(cfg_map, MapID)) || MapID <- L],
    ok.

load_one_map(true,  #mapCfg{is_cross = 1, id = MapID}) ->
    {ok, Pid} = map_mgr_sup:start_child(MapID),
    ets:insert(?MAP_MGR_ETS, #m_map_mgr{map_id = MapID, mgr = Pid}),
    ok;
load_one_map(true, #mapCfg{is_cross = 0, id = MapID}) ->
    ?WARN("~p This is a cross-server won't create normal map mgr ~p ",[node(), MapID]),
    ok;
load_one_map(false, #mapCfg{is_cross = 0, id = MapID}) ->
    {ok, Pid} = map_mgr_sup:start_child(MapID),
    ets:insert(?MAP_MGR_ETS, #m_map_mgr{map_id = MapID, mgr = Pid}),
    ok;
load_one_map(false, #mapCfg{is_cross = 1, id = MapID}) ->
    ?WARN("~p This is a normal-server won't create cross-server map mgr ~p ",[node(), MapID]),
    ok.








