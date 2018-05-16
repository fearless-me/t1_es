%%: 声明
-ifndef(cfg_equipWashEco).
-define(cfg_equipWashEco, 1).

-record(equipWashEcoCfg, {
        equipLevel,

        equipQuality,

        equipPart,

        item,

        itemNum

 }).

-endif.