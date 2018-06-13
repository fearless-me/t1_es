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


%% API
%% 玩家进程其他模块可调用的接口
-export([
    shutdown/1,
    stop/1, direct_stop/0, send/1,
    socket/0, teleport_/1
]).


%%-------------------------------------------------------------------
-spec shutdown(How) -> ok when
    How :: read | write | read_write.
shutdown(How) -> mod_player:shutdown(socket(), How).
stop(Reason) -> mod_player:active_stop(Reason).
direct_stop() -> mod_player:direct_stop().
%%-------------------------------------------------------------------

-spec send(Msg :: list() | tuple()) -> ok.
send(Msg) -> mod_player:send(Msg).
socket() -> mod_player:socket().


%%-------------------------------------------------------------------
teleport_(NewPos) -> ps:send(self(), teleport, NewPos).


%%-------------------------------------------------------------------

