%%: 声明
-ifndef(cfg_dailytask_Cycle).
-define(cfg_dailytask_Cycle, 1).

-record(dailytask_CycleCfg, {
        %%: 等级区间
        level,

        %%: groupID
        group

 }).

-endif.