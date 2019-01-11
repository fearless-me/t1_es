%%: 声明
-ifndef(cfg_aruna_Samplevalue).
-define(cfg_aruna_Samplevalue, 1).

-record(aruna_SamplevalueCfg, {
        %%: 序号
        id,

        %%: 世界ID
        worldID,

        %%: 类型
        %%: 1 怪物
        %%: 2 采集物
        type,

        %%: 对应的ID，怪物时为怪物ID
        valueID,

        %%: 击杀、采集时获得样本值
        sample

 }).

-endif.