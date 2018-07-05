%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 13. 六月 2018 15:00
%%%-------------------------------------------------------------------
-module(lib_map).
-author("mawenhong").
-author("mawenhong").

-include("logger.hrl").

%% API
-export([on_call_msg/2]).
-export([on_cast_msg/1]).
-export([on_info_msg/1]).

%%-------------------------------------------------------------------
on_info_msg({player_change_attr, _Req}) ->
    ok;
on_info_msg({net_msg_broadcast, _Req}) ->
    ok;
on_info_msg(Info) ->
    ?DEBUG("info:~p",[Info]),
    ok.

%%-------------------------------------------------------------------
on_call_msg(Request, From)->
    ?DEBUG("call ~p from ~p",[Request, From]),
    error.

%%-------------------------------------------------------------------
on_cast_msg(Request) ->
    ?DEBUG("cast:~p",[Request]),
    ok.
