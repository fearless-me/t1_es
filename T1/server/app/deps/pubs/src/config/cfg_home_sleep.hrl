%%: 声明
-ifndef(cfg_home_sleep).
-define(cfg_home_sleep, 1).

-record(home_sleepCfg, {
        %%: Wangshiyu:
        %%: 配家具实体的item.id
        item_id,

        rate,

        maxmin

 }).

-endif.