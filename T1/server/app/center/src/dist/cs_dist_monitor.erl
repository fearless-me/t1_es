%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 29. 八月 2018 17:00
%%%-------------------------------------------------------------------
-module(cs_dist_monitor).
-behavior(dist_monitor).
-author("mawenhong").

%% API
%% API
-export([start_link/0, slave_started/1]).


start_link() ->
    dist_monitor:start_link(?MODULE).

slave_started(SlaveNode) ->
    cs_share:sync(SlaveNode),
    ok.
