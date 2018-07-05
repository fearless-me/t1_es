%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 10. 五月 2018 11:09
%%%-------------------------------------------------------------------
-module(gen_mod_map).
-author("mawenhong").

-behaviour(gen_serverw).
-include("logger.hrl").
-include("map.hrl").


%% API
-export([start_link/1]).
-export([mod_init/1, do_handle_call/3, do_handle_info/2, do_handle_cast/2]).

%%%===================================================================
%%% public functions
%%%===================================================================
start_link(Params) ->
    gen_serverw:start_link(?MODULE, Params, [{timeout, ?MAP_INIT_TIMEOUT}]).

%%%===================================================================
%%% Internal functions
%%%===================================================================	
mod_init([MapID, MapLine]) ->
     erlang:process_flag(trap_exit, true),
    %% erlang:process_flag(priority, high),
    ProcessName = misc:create_atom(gen_mod_map, [MapID,MapLine]),
    true = erlang:register(ProcessName, self()),
    ?INFO("map ~p:~p started",[ProcessName, self()]),
    {ok, lib_map_priv:init(#m_map_state{map_id = MapID, line_id = MapLine})}.

%%--------------------------------------------------------------------
do_handle_call({player_join, Unit}, _From, State) ->
    {Ret, NewState} = lib_map_priv:player_join_call(State, Unit),
    {reply, Ret, NewState};
do_handle_call({player_exit, Req}, _From, State) ->
    {Ret, NewState} = lib_map_priv:player_exit_call(State, Req),
    {reply, Ret, NewState};
do_handle_call({player_teleport, Req}, _From, State) ->
    {Ret, NewState} = lib_map_priv:force_teleport_call(State, Req),
    {reply, Ret, NewState};
do_handle_call(Request, From, State) ->
    Ret = lib_map:on_call_msg(Request, From),
    {reply, Ret, State}.

%%--------------------------------------------------------------------
do_handle_info(status, State) ->
    catch show_status(),
    {noreply, State};
do_handle_info(tick_now, State) ->
    {noreply, lib_map_priv:tick(State)};
do_handle_info(start_stop_now, State) ->
    {noreply, lib_map_priv:start_stop_now(State)};
do_handle_info({start_move, Req}, State) ->
    lib_map_priv:player_start_move(Req),
    {noreply, State};
do_handle_info({stop_move, Req}, State) ->
    lib_map_priv:player_stop_move(Req),
    {noreply, State};
do_handle_info(stop_immediately, State) ->
    {stop, normal, State};
do_handle_info({msg_broadcast, {MsgId}}, State) ->
    {noreply, State};
do_handle_info({msg_broadcast,  {MsgId, Msg}}, State) ->
    {noreply, State};
do_handle_info({net_msg_broadcast, NetMsg}, State) ->
    {noreply, State};
do_handle_info({msg_broadcast_view, {MsgId}}, State) ->
    {noreply, State};
do_handle_info({msg_broadcast_view, {MsgId, Msg}}, State) ->
    {noreply, State};
do_handle_info({net_msg_broadcast_view, {Uid, NetMsg}}, State) ->
    {noreply, State};
do_handle_info(Info, State) ->
    lib_map:on_info_msg(Info),
    {noreply, State}.

%%--------------------------------------------------------------------
do_handle_cast(Request, State) ->
    lib_map:on_cast_msg(Request),
    {noreply, State}.

show_status() ->

    ok.





