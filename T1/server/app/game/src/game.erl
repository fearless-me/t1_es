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
    {ok, SupPid} = game_sup:start_link(),
    lists:foreach(
        fun({Msg, stdio, Thunk}) ->
            io:format("starting ~s ~n", [Msg]),
            Thunk(),
            ok;
            ({Msg, Thunk}) ->
                ?INFO("starting ~s ...", [Msg]),
                try
                    Thunk()
                catch
                    _ : Err  ->
                        ?ERROR("run ~p,error ~p, app crash!!! ",[Thunk, Err]),
                        timer:sleep(50000),
                        erlang:halt()
                end,
                ?INFO("starting ~s done", [Msg]),
                ok
        end,
        [
            {"Logger", stdio,
                fun() ->
                    ok = loggerS:start()
                end},
            {"Error Logger",
                fun() ->
                    common_error_logger:start(game_sup, game)
                end},
            {"Config init",
                fun() ->
                    ok
                end},
            {"monitor/gc/vms",
                fun() ->
                    {ok, _} = background_gc:start_link(),
                    {ok, _} = vm_memory_monitor:start_link(0.5),
                    ok
                end},
            {"start auto compile and load",
                fun() ->
                    ok = fly:start()
                end},
            {"test network",
                fun() ->
                    tcp_listener:start_listener(
                        test_tcp, 10, [{port, 25555}, {max_connections, 1000}], behaviour_example)
                end},
            {"test network2",
                fun() ->
                    tcp_listener:start_listener(
                        test_tcp2, 10, [{port, 15555}, {max_connections, 1000}], behaviour_example)
                end}
        ]
    ),
    ?WARN("###~p start ok###", [?APP]),
    {ok, SupPid}.

stop(_State) ->
    ok.
