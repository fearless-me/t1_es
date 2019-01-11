-module(fastlog_sup).
-behaviour(supervisor).

%% API
-export([start/0]).
-export([start_child/3]).

%% Supervisor callbacks
-export([init/1]).

%% ===================================================================
%% API functions
%% ===================================================================

start() ->
    supervisor:start_link({local, ?MODULE}, ?MODULE, []).

start_child(Sink, FdName, CreateErr) ->
    case supervisor:start_child(?MODULE, [Sink, FdName, CreateErr]) of
        {error, Error} ->
            catch io:format("create log sink ~p ~ts failed ~p~n",[Sink, FdName, Error]),
            false;
        _ ->
            true
    end.

%% ===================================================================
%% Supervisor callbacks
%% ===================================================================

init([]) ->
    {
        ok,
        {
            {simple_one_for_one, 5, 10},
            [
                {undefind,                                % Id       = internal id
                    {fastlog_sink, start_link, []},             % StartFun = {M, F, A}
                    temporary,                                % Restart  = permanent | transient | temporary (不会重启)
                    2000,                                        % Shutdown = brutal_kill | int() >= 0 | infinity
                    worker,                                    % Type     = worker | supervisor
                    []                                        % Modules  = [Module] | dynamic
                }
            ]
        }
    }.

