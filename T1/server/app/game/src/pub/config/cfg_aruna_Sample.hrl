%%: 声明
-ifndef(cfg_aruna_Sample).
-define(cfg_aruna_Sample, 1).

-record(aruna_SampleCfg, {
        %%: 序号
        id,

        %%: 世界阶段
        worldid,

        %%: 主类型
        %%: 1 怪物
        %%: 2 采集物
        type,

        %%: 对应的ID
        valueID,

        %%: 刷新坐标(x,z,圆半径)
        position

 }).

-endif.