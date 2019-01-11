%%: 声明
-ifndef(cfg_fashionCollectionLevel).
-define(cfg_fashionCollectionLevel, 1).

-record(fashionCollectionLevelCfg, {
        %%: 等级
        level,

        %%: 升级点数
        exp,

        %%: 属性加成
        attribute

 }).

-endif.