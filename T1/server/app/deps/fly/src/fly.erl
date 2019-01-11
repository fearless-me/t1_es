-module(fly).

-behaviour(application).
-behaviour(supervisor).


-export([start/0, run_now/0, pause/0, continue/0]).
-export([info/1]).

%% Application callbacks
-export([start/2, stop/1]).

%% Supervisor callbacks
-export([init/1]).

%% ----------------------------------------------------------------------
%% API
%% ----------------------------------------------------------------------
-ifndef(RELEASE).
start() ->
    application:start(compiler),
    application:start(syntax_tools),
    application:start(fly),
    ok.
-else.
start() -> ok.
-endif.


pause() ->
    fly_worker:pause(),
    ok.

continue() ->
    fly_worker:continue(),
    ok.

run_now() ->
    fly_worker:run_now(),
    ok.

info(src_dirs)->
    application:get_env(fly, src_dirs,[]);
info(inc_dirs)->
    application:get_env(fly, inc_dirs,[]);
info(opts)->
    application:get_env(fly, opts,[]);
info(interval)->
    application:get_env(fly, interval, 30000).


%% ===================================================================
%% Application callbacks
%% ===================================================================
start(_StartType, _StartArgs) ->
    supervisor:start_link({local, ?MODULE}, ?MODULE, []).
stop(_State) ->
    ok.

%% ===================================================================
%% Supervisor callbacks
%% ===================================================================
init([]) ->
    {
        ok,
        {
            {one_for_one, 5, 10},
            [
                {fly_worker, {fly_worker, start_link, []}, permanent, 5000, worker, [fly_worker]}
            ]
        }
    }.

