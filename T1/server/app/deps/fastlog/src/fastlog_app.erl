-module(fastlog_app).

-behaviour(application).

%% Application callbacks
-export([start/2, stop/1]).

%% ===================================================================
%% Application callbacks
%% ===================================================================

start(_StartType, _) ->
    fastlog_sup:start().

stop(_State) ->
    ok.
