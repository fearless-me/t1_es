%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 12. 六月 2018 17:22
%%%-------------------------------------------------------------------
-module(lib_player_pub).
-author("mawenhong").
-include("logger.hrl").
-include("map.hrl").
-include("pub_common.hrl").
-include("vector3.hrl").


%% API
%% 玩家进程其他模块可调用的接口
-export([
    shutdown/1, socket/0,
    stop/1, send/1
]).

-export([
    change_map_/2, change_map_pre_/0,
    teleport_/1, start_move_/2, stop_move_/2
]).


%%-------------------------------------------------------------------
-spec shutdown(How) -> ok when
    How :: read | write | read_write.
shutdown(How) -> mod_player:shutdown(How).
stop(Reason) -> mod_player:stop(Reason).
%%-------------------------------------------------------------------

-spec send(Msg :: list() | tuple()) -> ok.
send(Msg) -> mod_player:send(Msg).
socket() -> mod_player:socket().

%%-------------------------------------------------------------------
change_map_pre_() ->
    ps:send(self(), return_to_pre_map_req).

%%-------------------------------------------------------------------
change_map_(DestMapID, TarPos) ->
    ps:send(self(), passive_change_req, {DestMapID, TarPos}).

%%-------------------------------------------------------------------
teleport_(NewPos) -> ps:send(self(), teleport, NewPos).

%%-------------------------------------------------------------------
start_move_(MapPid, Req) -> map:player_move_(MapPid, Req).

%%-------------------------------------------------------------------
stop_move_(MapPid, Req) -> map:player_stop_move_(MapPid, Req).





