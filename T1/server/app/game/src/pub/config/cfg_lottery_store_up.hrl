%%: 声明
-ifndef(cfg_lottery_store_up).
-define(cfg_lottery_store_up, 1).

-record(lottery_store_upCfg, {
        %%: 周几
        week,

        %%: UP宠物(万分比权重）
        up_pet

 }).

-endif.