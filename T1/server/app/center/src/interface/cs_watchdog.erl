%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 12. 一月 2018 10:28
%%%-------------------------------------------------------------------
-module(cs_watchdog).
-behaviour(watchdog).
-author("mawenhong").
-include("pub_rec.hrl").


%% API
-export([start_link/0, task_list/0]).


start_link() ->
    watchdog:start_link(?MODULE).

task_list() ->
    [
        ?WATCHDOG_TASK(fun cs_data_loader:task_all_done/0, "load all data")
    ].