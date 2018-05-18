%%: 声明
-ifndef(cfg_fashionCollectionLevel).
-define(cfg_fashionCollectionLevel, 1).

-record(fashionCollectionLevelCfg, {
        level,

        exp,

        attribute

 }).

-endif.