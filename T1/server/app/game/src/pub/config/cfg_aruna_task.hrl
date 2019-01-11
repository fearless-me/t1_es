%%: 声明
-ifndef(cfg_aruna_task).
-define(cfg_aruna_task, 1).

-record(aruna_taskCfg, {
        %%: 序号
        id,

        %%: 对应世界id
        worldid,

        %%: 限制任务接取的等级区间
        limit,

        %%: 任务ID
        taskid

 }).

-endif.