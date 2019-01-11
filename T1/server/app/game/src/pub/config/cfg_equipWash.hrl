%%: 声明
-ifndef(cfg_equipWash).
-define(cfg_equipWash, 1).

-record(equipWashCfg, {
        %%: 等级库
        equipLevel,

        %%: 装备品质
        equipQuality,

        %%: 属性类型
        valueKind,

        %%: 属性最小
        valueMin,

        %%: 属性最大
        valueMax,

        %%: 属性下限值
        valueDown,

        %%: 属性上限值
        valueUp,

        %%: 分解石头的系数
        breakUpPara

 }).

-endif.