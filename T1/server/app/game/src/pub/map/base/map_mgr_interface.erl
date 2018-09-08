%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 13. 六月 2018 10:00
%%%-------------------------------------------------------------------
-module(map_mgr_interface).
-author("mawenhong").

-include("gs_map_inc.hrl").

%% API

%%--------------------------------
%% WARNING!!! WARNING!!! WARNING!!!
%% call
-export([player_join_map_call/2]).
-export([player_exit_map_call/2]).
%%--------------------------------

%%--------------------------------
%% WARNING!!! WARNING!!! WARNING!!!
%% call
player_join_map_call(MgrPid, Req) ->
    gen_server:call(MgrPid, {join_map, Req}, ?MAP_CALL_TIMEOUT).
player_exit_map_call(MgrPid, Req) ->
    gen_server:call(MgrPid, {exit_map, Req}, ?MAP_CALL_TIMEOUT).
%%--------------------------------

