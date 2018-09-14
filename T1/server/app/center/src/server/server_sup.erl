%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2017, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 27. 九月 2017 19:29
%%%-------------------------------------------------------------------
-module(server_sup).
-author("mawenhong").

-behaviour(supervisor).

%% API
-export([start_link/0]).
-export([start_child/1]).

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

start_child(Args) ->
    supervisor:start_child(?MODULE, Args).

%%%===================================================================
%%% Supervisor callbacks
%%%===================================================================
init([]) ->
    {
        ok,
        {
            {simple_one_for_one, 5, 10},
            [
                {   undefind,                               	% Id       = internal id
                    {server_srv, start_link, []},             % StartFun = {M, F, A}
                    temporary,                               	% Restart  = permanent | transient | temporary (不会重启)
                    2000,                                    	% Shutdown = brutal_kill | int() >= 0 | infinity
                    worker,                                  	% Type     = worker | supervisor
                    []                                       	% Modules  = [Module] | dynamic
                }
            ]
        }
    }.


%%%===================================================================
%%% Internal functions
%%%===================================================================
