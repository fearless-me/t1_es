-module(dist_sup).

-behaviour(supervisor).

%% API
-export([start/1]).
-export([start_link/0]).

%% Supervisor callbacks
-export([init/1]).

%% Helper macro for declaring children of supervisor
-define(CHILD(I, Type), {I, {I, start_link, []}, permanent, 5000, Type, [I]}).

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
    try
        Module:slave_start(SupPid, dist)
    catch _ : Err : ST ->
        misc:halt("start app error ~p, stacktrace ~p", [Err, ST])
    end,
    {ok, SupPid}.

