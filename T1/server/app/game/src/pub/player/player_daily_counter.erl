%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 27. 九月 2018 11:48
%%%-------------------------------------------------------------------
-module(player_daily_counter).
-author("mawenhong").

%% API
-export([
    on_login/1,
    inc_daily_counter/0, dec_daily_counter/0,
    reset_daily_counter/0, get_daily_counter/0, set_daily_counter/0
]).

on_login(_Data) ->
    ok.

%%-------------------------------------------------------------------
inc_daily_counter() -> ok.

%%-------------------------------------------------------------------
dec_daily_counter() -> ok.

%%-------------------------------------------------------------------
get_daily_counter() -> ok.

%%-------------------------------------------------------------------
set_daily_counter() -> ok.

%%-------------------------------------------------------------------
reset_daily_counter() -> ok.




