%%: 声明
-ifndef(cfg_exchange).
-define(cfg_exchange, 1).

-record(exchangeCfg, {
        %%: 1，用于有双货币的版本，客户端在显示现金金额时，将美元值转化为对应的货币值。
        %%: 2，business中claimRmb字段为货币显示值，要配美元值。
        id,

        %%: 美元
        usd,

        %%: 人民币
        cny,

        %%: 新台币
        twd,

        %%: 韩元
        krw,

        %%: 新加坡元
        sgd,

        %%: 泰铢
        thb,

        %%: 马来西亚
        myr,

        %%: 越南盾
        vnd

 }).

-endif.