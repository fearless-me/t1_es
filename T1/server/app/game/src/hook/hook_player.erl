%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 30. 五月 2018 19:07
%%%-------------------------------------------------------------------
-module(hook_player).
-author("mawenhong").
-include("logger.hrl").

%% API
-export([on_create/1]).
-export([on_login/0]).
-export([on_offline/0]).
-export([on_change_map/2]).
-export([on_tick/0, on_second/0, on_minute/0, on_hour/0, on_sharp/1]).

%%-------------------------------------------------------------------
on_create(Uid) ->
    ?DEBUG("[hook]Aid ~p create new player ~w",
        [lib_player_rw:get_aid(), Uid]),
    ok.

%%-------------------------------------------------------------------
on_login() ->
    lib_player_alarm:init(),
    lib_player_sub:tick_go(),
    ?DEBUG("[hook]Aid ~p player login ~w",
        [lib_player_rw:get_aid(), lib_player_rw:get_uid()]),
    ok.

%%-------------------------------------------------------------------
on_offline() ->
    lib_player_alarm:save(),
    ?DEBUG("[hook]Aid ~p player offline ~w",
        [lib_player_rw:get_aid(), lib_player_rw:get_uid()]),
    ok.

%%-------------------------------------------------------------------
on_change_map(OldMap, NewMap) ->
    ?DEBUG("[hook]Aid ~p  player ~p change map from ~w to ~w",
        [lib_player_rw:get_aid(), lib_player_rw:get_uid(), OldMap, NewMap]),
    ok.

%%-------------------------------------------------------------------
on_tick() ->
    ok.

%%-------------------------------------------------------------------
on_second() ->
    ?INFO("player ~p on_second", [lib_player_rw:get_uid()]),
    ok.

%%-------------------------------------------------------------------
on_minute() ->
    ?INFO("player ~p on_minute", [lib_player_rw:get_uid()]),
    ok.

%%-------------------------------------------------------------------
on_hour() ->
    ?INFO("player ~p on_hour", [lib_player_rw:get_uid()]),
    ok.

%%-------------------------------------------------------------------
on_sharp(Hour) ->
    ?INFO("player ~p on_sharp ~p", [lib_player_rw:get_uid(), Hour]),
    ok.

%%-------------------------------------------------------------------

