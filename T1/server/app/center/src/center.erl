-module(center).

-include("logger.hrl").

-behaviour(application).

%% Application callbacks
-export([start/2, stop/1]).
-export([start/0, stop/0]).

-define(APP, center).

%% ===================================================================
%% Application callbacks
%% ===================================================================


start() ->
    true = misc:start_all_app(?APP).
                            
stop() ->
    application:stop(?APP),
    erlang:halt().

start(_StartType, _StartArgs) ->
    V = center_sup:start(),
    ?WARN("###~p start ok###", [?APP]),
    V.

stop(_State) ->
    ok.
