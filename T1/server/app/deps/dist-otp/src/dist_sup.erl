-module(dist_sup).

-behaviour(supervisor).

%% API
-export([start/1]).
-export([start_link/0]).

%% Supervisor callbacks
-export([init/1]).

%% ===================================================================
%% API functions
%% ===================================================================

start_link() ->
    supervisor:start_link({local, ?MODULE}, ?MODULE, []).

%% ===================================================================
%% Supervisor callbacks
%% ===================================================================

init([]) ->
    {ok, { {one_for_one, 5, 10}, []} }.


start(Module) ->
    {ok, SupPid} = dist_sup:start_link(),
    Module:slave_start(SupPid, dist),
    {ok, SupPid}.

