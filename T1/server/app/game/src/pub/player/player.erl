%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 28. 五月 2018 11:28
%%%-------------------------------------------------------------------
-module(player).
-author("mawenhong").

-include("logger.hrl").

%% API
-export([on_call_msg/2]).
-export([on_cast_msg/1]).
-export([on_info_msg/1]).

%%-------------------------------------------------------------------
on_info_msg(tick_me) ->
    player_sub:tick_me(),
    ok;
on_info_msg(Info) ->
    ?ERROR("info:~p", [Info]),
    playerOtp:handle_info(Info, none).

%%-------------------------------------------------------------------
on_call_msg(Request, From) ->
    ?DEBUG("call ~p from ~p", [Request, From]),
    playerOtp:handle_call(Request, From, none).

%%-------------------------------------------------------------------
on_cast_msg(Request) ->
    ?DEBUG("cast:~p", [Request]),
    playerOtp:handle_cast(Request, none).
