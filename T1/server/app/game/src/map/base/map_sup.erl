%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 10. 五月 2018 11:10
%%%-------------------------------------------------------------------
-module(map_sup).
-author("mawenhong").

-behaviour(supervisor).

%% API
-export([start_link/0]).
-export([start_child/1, start_child/2]).

%% Supervisor callbacks
-export([init/1]).


%%%===================================================================
%%% API functions
%%%===================================================================

%%--------------------------------------------------------------------
%% @doc
%% Starts the supervisor
%%
%% @end
%%--------------------------------------------------------------------
start_link() ->
    supervisor:start_link({local, ?MODULE}, ?MODULE, []).

start_child(CreateMapArg) ->
    supervisor:start_child(?MODULE, [CreateMapArg]).

start_child(CreateMapArg, SpawnOpts) ->
    supervisor:start_child(?MODULE, [CreateMapArg, SpawnOpts]).

%%%===================================================================
%%% Supervisor callbacks
%%%===================================================================
init([]) ->
    {
        ok,
        {
            {simple_one_for_one, 5, 10},
            [
                {undefind,                                % Id       = internal id
                    {map_srv, start_link, []},             % StartFun = {M, F, A}
                    temporary,                                % Restart  = permanent | transient | temporary (不会重启)
                    2000,                                        % Shutdown = brutal_kill | int() >= 0 | infinity
                    worker,                                    % Type     = worker | supervisor
                    []                                        % Modules  = [Module] | dynamic
                }
            ]
        }
    }.


%%%===================================================================
%%% Internal functions
%%%===================================================================
