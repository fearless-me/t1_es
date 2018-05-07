-module(fastlog_app).

-behaviour(application).

%% Application callbacks
-export([start/2, stop/1]).

%% ===================================================================
%% Application callbacks
%% ===================================================================

start(_StartType, [App| _]) ->
    fastlog_sup:start_link(App).

stop(_State) ->
    ok.
