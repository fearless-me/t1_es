%%: 声明
-ifndef(cfg_gemproperty).
-define(cfg_gemproperty, 1).

-record(gempropertyCfg, {
        %%: 颜色
        color,

        %%: 等级
        level,

        %%: 属性组
        pro,

        %%: 消耗
        cost

 }).

-endif.