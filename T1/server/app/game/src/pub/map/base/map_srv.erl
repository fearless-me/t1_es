%%%-------------------------------------------------------------------
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
-include("pub_rec.hrl").
-include("pub_def.hrl").
-include("map_core.hrl").
-include("rec_rw.hrl").


%% API
-export([start_link/1, start_link/2]).
-export([mod_init/1, do_handle_call/3, do_handle_info/2, do_handle_cast/2]).
-export([show_status_/1, status/1, call_reply/2]).

show_status_(Name) ->
    catch ps:send(Name, show_status).

status(Name) ->
    case catch gen_server:call(Name, status) of
        {'EXIT', Reason} -> Reason;
        Res -> Res
    end.

%%%===================================================================
%%% public functions
%%%===================================================================
start_link(Params) ->
    gen_serverw:start_link
    (
        ?MODULE, Params,
        [
            {timeout, ?MAP_INIT_TIMEOUT}
%%            {spawn_opt, [{min_heap_size, 256 * 1024}, {min_bin_vheap_size, 32 * 1024}]}
        ]
    ).

start_link(Params, SpawnOpts) ->
    gen_serverw:start_link(?MODULE, Params, [{timeout, ?MAP_INIT_TIMEOUT}] ++ SpawnOpts).

call_reply(FromPid, Ret) ->
    gen_server:reply(FromPid, Ret),
    ok.

%%%===================================================================
%%% Internal functions
%%%===================================================================

mod_init([MapID, MapLine, MgrEts]) ->
    erlang:process_flag(trap_exit, true),
    erlang:process_flag(priority, high),
    i_tick_clear_msg(),
    gen_serverw:continue_effective_monitor(self(), ?MAP_TICK),
    {ok, mod_map_priv:init_priv(MgrEts, MapID, MapLine)}.

%%--------------------------------------------------------------------
do_handle_call(status, _From, State) ->
    {reply, i_status(), State};
do_handle_call({player_join, Obj}, From, State) ->
    mod_map_priv:player_join_call(State, From, Obj);
do_handle_call({player_exit, Req}, From, State) ->
    mod_map_priv:player_exit_call(State, From, Req);
do_handle_call({player_exit_exception, Data}, _From, State) ->
    mod_map_priv:player_exit_exception_call(State, Data);
do_handle_call({player_teleport, Req}, From, State) ->
    mod_map_priv:force_teleport_call(State, From, Req);
do_handle_call(Request, From, State) ->
    Ret = mod_map:on_call_msg(Request, From),
    {reply, Ret, State}.

%%--------------------------------------------------------------------

do_handle_info(init, State) ->
    {noreply, mod_map_priv:init(State)};
do_handle_info({event, clear_online_player_immediately}, State) ->
    catch tick_clear_player(),
    {noreply, State};
do_handle_info({event, clear_online_player}, State) ->
    catch tick_clear_player(),
    i_tick_clear_msg(),
    {noreply, State};
do_handle_info(show_status, State) ->
    catch i_show_status(),
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
do_handle_info({'EXIT', _FromPid, force}, State) ->
    {stop, normal, State};
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
do_handle_cast({player_exit_exception_, _From, _PsName, Data}, State) ->
    mod_map_priv:player_exit_exception_call(State, Data),
    {noreply, State};
do_handle_cast(Request, State) ->
    mod_map:on_cast_msg(Request),
    {noreply, State}.


%%--------------------------------------------------------------------
%%--------------------------------------------------------------------
tick_clear_player() ->
    Self = self(),
    Maps = map_rw:obj_maps_with_type(?UID_TYPE_PLAYER),
    erlang:spawn
    (fun() ->
        MapName = misc:registered_name(Self),
        ClearAll =
            maps:fold
            (
                fun(_, Uid, X) ->
                    PPid = gs_cache_interface:get_online_player_pid(Uid),
                    case misc:is_alive_rpc(PPid) of
                        true -> X;
                        _Any ->
                            catch ?WARN("~p|~p clear player ~p", [Self, MapName, Uid]),
                            ?TRY_CATCH_ERROR(map_interface:player_exit_map_exception_(Self, Uid)),
                            X + 1
                    end
                end, 0, Maps
            ),
        catch ?WARN("~p|~p tick_clear_player ~p", [Self, MapName, ClearAll])
     end
    ),

    ok.

i_tick_clear_msg() ->
    TickTime = ?if_else(gs_interface:is_cross(), ?MAP_TICK_CLEAR_PLAYER_CROSS, ?MAP_TICK_CLEAR_PLAYER_LOCAL),
    erlang:send_after(TickTime, self(), {event, clear_online_player}).

i_status() -> map_rw:status().

i_show_status() ->
    ?WARN("~nmap:~p~n~p~n", [misc:registered_name(), map_rw:status()]).





