-module(dist).

-behaviour(application).

%% Application callbacks
-export([start/2, stop/1]).
-export([start/0, stop/0]).

-define(APP, dist).

%% ===================================================================
%% Application callbacks
%% ===================================================================


start() ->
    true = misc:start_all_app(?APP).

stop() ->
    application:stop(?APP),
    erlang:halt().

start(_StartType, [Module]) ->
    dist_sup:start(Module).

stop(_State) ->
    ok.
