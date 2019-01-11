%%: 声明
-ifndef(cfg_alrest_buytime).
-define(cfg_alrest_buytime, 1).

-record(alrest_buytimeCfg, {
        %%: id
        id,

        %%: 购买时长
        time,

        %%: 价格
        price,

        %%: 每日限购
        limit

 }).

-endif.