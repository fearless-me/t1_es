%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2017, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 28. 十二月 2017 17:12
%%%-------------------------------------------------------------------

-module(dbs).
-author("mawenhong").

-include("logger.hrl").

-behaviour(application).

%% Application callbacks
-export([start/2, stop/1]).
-export([start/0, stop/0]).

-define(APP, dbs).

%% ===================================================================
%% Application callbacks
%% ===================================================================


start() ->
    application:ensure_all_started(?APP).

start(_StartType, _StartArgs) ->
    V = dbs_sup:start(),
    ?WARN("###~p start ok###", [?APP]),
    V.

stop() ->
    application:stop(?APP),
    erlang:halt().

stop(_State) ->
    ok.


