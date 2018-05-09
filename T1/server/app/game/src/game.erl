-module(game).

-include("logger.hrl").

-behaviour(application).

%% Application callbacks
-export([start/2, stop/1]).
-export([start/0, stop/0]).

-define(APP, game).

%% ===================================================================
%% Application callbacks
%% ===================================================================


start() ->
    application:ensure_all_started(?APP).

stop() ->
    application:stop(?APP),
    erlang:halt().

start(_StartType, _StartArgs) ->
    V = game_sup:start(),
    ?WARN("###~p start ok###", [?APP]),
    V.

stop(_State) ->
    ok.
