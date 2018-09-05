
%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 13. 六月 2018 9:58
%%%-------------------------------------------------------------------
-module(gs_map_interface).
-author("mawenhong").
-include("gs_map_inc.hrl").
%% API
%%--------------------------------
%% WARNING!!! WARNING!!! WARNING!!!
%% call
-export([player_join_call/2, player_exit_call/2, player_teleport_call/2]).
%%--------------------------------
-export([player_move_/2, player_stop_move_/2, player_change_attr_/2]).
-export([status_/1]).


%%--------------------------------
%%--------------------------------
%% WARNING!!! WARNING!!! WARNING!!!
%% call
player_exit_call(MapPid, Req) ->
    gen_server:call(MapPid, {player_exit, Req}, ?MAP_CALL_TIMEOUT).
%%--------------------------------
player_join_call(MapPid, Unit) ->
    gen_server:call(MapPid, {player_join, Unit}, ?MAP_CALL_TIMEOUT).
%%--------------------------------
player_teleport_call(MapPid, Req) ->
    gen_server:call(MapPid, {player_teleport, Req}, ?MAP_CALL_TIMEOUT).
%%--------------------------------


%%--------------------------------
player_change_attr_(MapPid, Req) ->
    ps:send(MapPid, player_change_attr, Req),
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
