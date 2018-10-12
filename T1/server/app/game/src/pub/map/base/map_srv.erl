%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 10. 五月 2018 11:09
%%%-------------------------------------------------------------------
-module(map_srv).
-author("mawenhong").

-behaviour(gen_serverw).
-include("logger.hrl").
-include("map_core.hrl").


%% API
-export([start_link/1, start_link/2]).
-export([mod_init/1, do_handle_call/3, do_handle_info/2, do_handle_cast/2]).
-export([call_reply/2]).

%%%===================================================================
%%% public functions
%%%===================================================================
start_link(Params) ->
    gen_serverw:start_link(?MODULE, Params, [{timeout, ?MAP_INIT_TIMEOUT}]).

start_link(Params, SpawnOpts) ->
    gen_serverw:start_link(?MODULE, Params, [{timeout, ?MAP_INIT_TIMEOUT}] ++ SpawnOpts).

call_reply(FromPid, Ret) ->
    gen_server:reply(FromPid, Ret),
    ok.

%%%===================================================================
%%% Internal functions
%%%===================================================================	
mod_init([MapID, MapLine]) ->
    erlang:process_flag(trap_exit, true),
    erlang:process_flag(priority, high),
    ProcessName = misc:create_atom(?MODULE, [MapID, MapLine]),
    true = erlang:register(ProcessName, self()),
    ?INFO("map ~p:~p started", [ProcessName, self()]),
    ps:send(self(), init),
    {ok, #m_map_state{map_id = MapID, line_id = MapLine}}.

%%--------------------------------------------------------------------
do_handle_call({player_join, Obj}, From, State) ->
    mod_map_priv:player_join_call(State, From, Obj);
do_handle_call({player_exit, Req}, From, State) ->
    mod_map_priv:player_exit_call(State, From, Req);
do_handle_call({player_teleport, Req}, From, State) ->
    mod_map_priv:force_teleport_call(State, From, Req);
do_handle_call(Request, From, State) ->
    Ret = mod_map:on_call_msg(Request, From),
    {reply, Ret, State}.

%%--------------------------------------------------------------------
do_handle_info(init, State) ->
    {noreply, mod_map_priv:init(State)};
do_handle_info(status, State) ->
    catch show_status(),
    {noreply, State};
do_handle_info(tick_now, State) ->
    {noreply, mod_map_priv:tick(State)};
do_handle_info(start_stop_now, State) ->
    {noreply, mod_map_priv:start_stop_now(State)};
do_handle_info({start_move, Req}, State) ->
    mod_map_priv:player_start_move(Req),
    {noreply, State};
do_handle_info({stop_move, Req}, State) ->
    mod_map_priv:player_stop_move(Req),
    {noreply, State};
do_handle_info(stop_immediately, State) ->
    {stop, normal, State};
do_handle_info({msg_broadcast, Msg}, State) ->
    mod_map_priv:broadcast_msg(State, Msg),
    {noreply, State};
do_handle_info({net_msg_broadcast, NetMsg}, State) ->
    mod_map_priv:broadcast_net_msg(State, NetMsg),
    {noreply, State};
do_handle_info({msg_broadcast_view, Msg}, State) ->
    mod_map_priv:broadcast_msg_view(Msg),
    {noreply, State};
do_handle_info({net_msg_broadcast_view, ViewNetMsg}, State) ->
    mod_map_priv:broadcast_net_msg_view(ViewNetMsg),
    {noreply, State};
do_handle_info({change_group, Msg}, State) ->
    mod_map_priv:change_group(Msg),
    {noreply, State};
do_handle_info({condition_event, ConditionEventMsg}, State) ->
    mod_map_condition_event:on_event(ConditionEventMsg),
    {noreply, State};
do_handle_info(Info, State) ->
    mod_map:on_info_msg(Info),
    {noreply, State}.

%%--------------------------------------------------------------------
do_handle_cast(Request, State) ->
    mod_map:on_cast_msg(Request),
    {noreply, State}.

show_status() ->
    
    ok.





