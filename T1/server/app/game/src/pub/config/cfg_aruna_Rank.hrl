%%: 声明
-ifndef(cfg_aruna_Rank).
-define(cfg_aruna_Rank, 1).

-record(aruna_RankCfg, {
        %%: 等级
        id,

        %%: 军衔名称
        rankname,

        %%: 军衔图标
        rankicon,

        %%: 军衔值
        %%: 满后提升到下一阶
        value,

        %%: 血量提升值
        %%: [{属性类型、加成、算法类型}]
        %%: 0 加法
        %%: 1 乘法
        buff_def,

        %%: 携带上限提升
        buff_Sample,

        %%: 军衔边框
        rankicon_Border

 }).

-endif.