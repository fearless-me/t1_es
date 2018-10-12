-module(guild_sup).

-behaviour(supervisor).
-include("pub_def.hrl").

%% API
-export([start_link/0]).
-export([init/1]).


start_link() -> supervisor:start_link({local, ?MODULE}, ?MODULE, []).

%% ===================================================================
%% Supervisor callbacks
%% ===================================================================
init([]) ->
    {
        ok,
        {
            {one_for_one, 5, 10},
            [
            
            ]
        }
    }.

