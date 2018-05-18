%%: 声明
-ifndef(cfg_alrest_buytime).
-define(cfg_alrest_buytime, 1).

-record(alrest_buytimeCfg, {
        id,

        time,

        price,

        limit

 }).

-endif.