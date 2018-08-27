%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 12. 一月 2018 10:28
%%%-------------------------------------------------------------------
-module(cs_watchdog_hook).
-author("mawenhong").


%% API
-export([task_list/0]).


task_list() ->
    [
        {fun cs_loader:is_task_all_done/0, "load all data"},
        {fun cs_dist_otp:is_all_slaves_stared/0, "start all slaves "}
    ].