%%: 声明
-ifndef(cfg_equipWashEco).
-define(cfg_equipWashEco, 1).

-record(equipWashEcoCfg, {
        %%: 等级库
        equipLevel,

        %%: 装备品质
        equipQuality,

        %%: 部位分类
        equipPart,

        %%: 消耗道具
        item,

        %%: 道具数量
        itemNum

 }).

-endif.