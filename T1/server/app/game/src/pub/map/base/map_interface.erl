
%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 13. 六月 2018 9:58
%%%-------------------------------------------------------------------
-module(map_interface).
-author("mawenhong").
-include("logger.hrl").
-include("map_core.hrl").
-include("error_code.hrl").
%% API
%%--------------------------------
%% WARNING!!! WARNING!!! WARNING!!!
%% call
-export([player_join_call/2, player_exit_call/2, player_teleport_call/2]).
-export([player_exit_map_exception_/2, player_exit_map_exception_try/2, clear_online_player_immediately_/1]).
%%--------------------------------
-export([player_move_/2, player_stop_move_/2, player_change_combat_prop_/2]).
-export([status_/1]).


%%--------------------------------
%%--------------------------------
%% WARNING!!! WARNING!!! WARNING!!!
%% call
player_exit_call(MapPid, Req) ->
    gen_server:call(MapPid, {player_exit, Req}, ?MAP_CALL_TIMEOUT).
%%--------------------------------
player_join_call(MapPid, Req) ->
    gen_server:call(MapPid, {player_join, Req}, ?MAP_CALL_TIMEOUT).
%%--------------------------------
player_teleport_call(MapPid, Req) ->
    gen_server:call(MapPid, {player_teleport, Req}, ?MAP_CALL_TIMEOUT).


player_exit_map_exception_call(MapPid, Uid) ->
    gen_server:call(MapPid,{player_exit_exception, Uid}, ?MAP_CALL_TIMEOUT).

%%--------------------------------
player_exit_map_exception_try(MapPid, Uid) when is_pid(MapPid) ->
    case player_exit_map_exception_call(MapPid, Uid) of
        ?MAP_CHANGE_OK -> skip;
        _Any -> player_exit_map_exception_(MapPid, Uid)
    end;
player_exit_map_exception_try(_,_)->
    ok.

player_exit_map_exception_(MapPid, Uid) when is_pid(MapPid) ->
    gen_server:cast(MapPid,{player_exit_exception_, self(), misc:registered_name(), Uid});
player_exit_map_exception_(_MapPid, _Uid) ->
    ok.

clear_online_player_immediately_(Pid) ->
    ps:send(Pid, {event, clear_online_player_immediately}).

%%--------------------------------
player_change_combat_prop_(MapPid, Req) ->
    ps:send(MapPid, player_change_combat_prop, Req),
    ok.

%%--------------------------------
player_move_(MapPid, Req) ->
    ps:send(MapPid, start_move, Req),
    ok.

%%--------------------------------
player_stop_move_(MapPid, Req) ->
    ps:send(MapPid, stop_move, Req),
    ok.

%%--------------------------------
status_(MapPid) -> ps:send(MapPid, status).
