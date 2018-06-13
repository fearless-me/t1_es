%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 10. 五月 2018 11:10
%%%-------------------------------------------------------------------
-module(map_root_supervisor).
-author("mawenhong").

-behaviour(supervisor).

%% API
-export([start_link/0]).

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

%%%===================================================================
%%% Supervisor callbacks
%%%===================================================================
%%--------------------------------------------------------------------
init([]) ->
    {
        ok,
        {
            {one_for_one, 5, 10},
            [
                ?CHILD(map_mgr_supervisor, supervisor),
                ?CHILD(map_supervisor, supervisor),
                ?CHILD(gen_map_creator, worker)
            ]
        }
    }.

%%%===================================================================
%%% Internal functions
%%%===================================================================
