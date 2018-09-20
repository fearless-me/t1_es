-module(dist).

-behaviour(application).

%% Application callbacks
-export([start/2, stop/1]).
-export([start/0, stop/0]).

-define(APP, dist).

%% ===================================================================
%% Application callbacks
%% ===================================================================


start() -> misc:start_all_app(?APP).

stop() ->
    application:stop(?APP),
    erlang:halt().

start(_StartType, Args) ->
    try
        [Module | _] = Args,
        dist_sup:start(Module)
    catch _ : Err : ST ->
        Msg = io_lib:format(
            "~n*** FATAL start node ~p crash *** ~n"
            "error: ~p ~n"
            "call statck ~p",
            [node(), Err, ST]
        ),
        rpc:call(misc:master_node(), misc, halt, [Msg]),
        misc:halt(Msg)
    end.

stop(_State) ->
    ok.
