%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 12. 一月 2018 10:28
%%%-------------------------------------------------------------------
-module(gs_watchdog_hook).
-author("mawenhong").


%% API
-export([task_list/0]).


task_list() ->
    [
        {fun gs_loader:is_task_all_done/0, "load all data"},
        {fun gs_cs_interface:is_center_ready/0, "connect to center"}
    ].
