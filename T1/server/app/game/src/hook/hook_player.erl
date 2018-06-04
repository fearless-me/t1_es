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

%%-------------------------------------------------------------------
on_create(Uid) ->
    ?DEBUG("[hook]Aid ~p create new player ~w",
        [lib_player_rw:get_aid(), Uid]),
    ok.

%%-------------------------------------------------------------------
on_login() ->
    ?DEBUG("[hook]Aid ~p player login ~w",
        [lib_player_rw:get_aid(), lib_player_rw:get_uid()]),
    lib_player_alarm:init(),
    ok.

%%-------------------------------------------------------------------
on_offline() ->
    ?DEBUG("[hook]Aid ~p player offline ~w",
        [lib_player_rw:get_aid(), lib_player_rw:get_uid()]),
    lib_player_alarm:save(),
    ok.

