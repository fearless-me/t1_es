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

%%-------------------------------------------------------------------
%% @doc
%%
%% 要注意 
%% #loader_task_group.priority数值越低，优先级越高
%% 执行顺序是按照优先级从高到低
%%
%% @end
%%
-record(loader_task,        {ref, mfa}).
-record(loader_task_group,  {priority, ref, mode, task_list=[]}).

-define(TASK_SEQ, seq).
-define(TASK_PARALLEL,  parallel).
-define(LOADER_TASK(Ref, Mfa), #loader_task{ref = Ref, mfa = Mfa}).
-define(LOADER_TASK_GROUP(Pr, Ref, Mode, Tasks), #loader_task_group{priority = Pr, ref = Ref, mode = Mode, task_list = Tasks}).

%%-------------------------------------------------------------------


-endif.

