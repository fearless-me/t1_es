%%%-------------------------------------------------------------------
%%% @author Administrator
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 26. 十二月 2018 11:35
%%%-------------------------------------------------------------------
-module(mod_copy).
-author("Administrator").

%% todo 地图事件：玩家掉线后重新进入怎么处理；退队怎么处理等等
%% API
-export([
    on_player_join/1, on_player_exit/1,
    on_finish/0
]).

%%-------------------------------------------------------------------
on_player_join(Uid) ->
    player_enter_event(Uid).

%%-------------------------------------------------------------------
on_player_exit(Uid) ->
    player_leave_event(Uid).


on_finish() ->
    ok.

%%-------------------------------------------------------------------
player_enter_event(_Uid) ->
    ok.

player_leave_event(_Uid) ->
    ok.