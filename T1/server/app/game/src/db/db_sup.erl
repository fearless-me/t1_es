%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 30. 五月 2018 14:12
%%%-------------------------------------------------------------------
-module(db_sup).
-author("mawenhong").

-behaviour(supervisor).

%% API
-export([start_link/0]).
-export([start_child/1]).

%% Supervisor callbacks
-export([init/1]).

%% Helper macro for declaring children of supervisor
-define(CHILD(I, Type), {I, {I, start_link, []}, permanent, 5000, Type, [I]}).
-define(CHILD(I, Type, Params), {I, {I, start_link, Params}, permanent, 5000, Type, [I]}).
-define(CHILD(Name, I, Type, Params), {Name, {I, start_link, Params}, permanent, 5000, Type, [Name]}).


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
    supervisor:start_child(?MODULE, [Args]).

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
                    {db_son, start_link, []},             % StartFun = {M, F, A}
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
