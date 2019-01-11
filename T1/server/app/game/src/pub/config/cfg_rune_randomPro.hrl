%%: 声明
-ifndef(cfg_rune_randomPro).
-define(cfg_rune_randomPro, 1).

-record(rune_randomProCfg, {
        %%: 基础属性库id
        random_property_group_id,

        %%: 属性id
        property_id,

        equipLevel,

        quality,

        %%: 最小值
        property_number_min,

        %%: 最大值
        property_number_max,

        mulityOrPlus,

        weight

 }).

-endif.