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
-export([task_list/0]).


task_list() ->
    [
        ?WATCHDOG_TASK_GROUP(1, load_all_data, priority_1()),
        ?WATCHDOG_TASK_GROUP(2, start_master_slave, priority_2(), true)
    ].

priority_1() ->
    [
        ?WATCHDOG_TASK(fun data_loader:is_all_done/0, "load all data")
    ].

priority_2() ->
    [
        ?WATCHDOG_TASK(fun dist_monitor:is_all_slaves_stared/0, "wait start all slave nodes")
    ].