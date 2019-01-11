%%: 声明
-ifndef(cfg_home_plants).
-define(cfg_home_plants, 1).

-record(home_plantsCfg, {
        %%: 种子id
        id,

        %%: 种子名称
        name,

        %%: 种子等级
        level,

        %%: 100 仅使用金币
        %%: 103 先使用绑钻再使用非绑钻
        %%: 105 仅使用非绑钻
        buy_type,

        %%: 货币值
        price,

        %%: [幼苗阶段分钟数,发育到成熟分钟数,成熟后的枯萎分钟数]
        growtime,

        %%: [{道具id,道具数量}]
        result,

        %%: [道具ID,道具数量,几率值]
        %%: 几率为[0,100]，对应百分比
        bonus,

        %%: [产生虫害最小分钟数,最大分钟数,最大虫害次数,虫害导致每小时降低健康值]
        pestis,

        %%: [初始健康值,最大健康值]
        health,

        %%: 种子形态模型
        seed_model,

        %%: 成长过程中模型
        growing_model,

        %%: 成长完成模型
        final_model,

        %%: 枯萎形态模型
        droop_model

 }).

-endif.