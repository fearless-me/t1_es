%%: 声明
-ifndef(cfg_equipment_randomprop_ex).
-define(cfg_equipment_randomprop_ex, 1).

-record(equipment_randomprop_exCfg, {
        %%: 装备品质
        qulity,

        %%: 装备等级
        level,

        %%: 合成次数
        number,

        %%: 区间1权重
        region_1,

        %%: 区间2权重
        region_2,

        %%: 区间3权重
        region_3,

        %%: 区间4权重
        region_4

 }).

-endif.