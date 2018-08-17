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
        {fun lib_cs_loader:is_task_all_done/0, "load all data"}
    ].