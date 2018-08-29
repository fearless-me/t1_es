%%%-------------------------------------------------------------------
%%% @author mawenhong
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 02. 一月 2018 11:41
%%%-------------------------------------------------------------------
-author("mawenhong").
-ifndef(PUB_REC_HRL).
-define(PUB_REC_HRL, true).

-record(pub_kv,{key,value}).
%%
-record(watchdog_task,{check_fun, tip}).
-define(WATCHDOG_TASK(FUNC, TIP), #watchdog_task{check_fun = FUNC, tip = TIP}).


-endif.

