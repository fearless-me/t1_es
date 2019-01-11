%%: 声明
-ifndef(cfg_mallStore).
-define(cfg_mallStore, 1).

-record(mallStoreCfg, {
        %%: ID
        id,

        %%: 跨表引用名字
        name,

        %%: 图标ICON
        icon,

        %%: 排序
        sort

 }).

-endif.