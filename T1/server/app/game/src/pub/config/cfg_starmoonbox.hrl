%%: 声明
-ifndef(cfg_starmoonbox).
-define(cfg_starmoonbox, 1).

-record(starmoonboxCfg, {
        %%: 编号id
        id,

        %%: 库
        jackpot,

        %%: 道具
        item

 }).

-endif.