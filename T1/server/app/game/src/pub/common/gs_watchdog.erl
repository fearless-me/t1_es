%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 12. 一月 2018 10:28
%%%-------------------------------------------------------------------
-module(gs_watchdog).
-behaviour(watchdog).

-author("mawenhong").
-include("pub_rec.hrl").



%% API
-export([start_link/0, task_list/0]).


start_link() ->
    watchdog:start_link(?MODULE).

task_list() ->
    [
        ?WATCHDOG_TASK(fun gs_loader:is_task_all_done/0, "load all data"),
        ?WATCHDOG_TASK(fun gs_cs_interface:is_center_ready/0, "connect to center")
    ].
