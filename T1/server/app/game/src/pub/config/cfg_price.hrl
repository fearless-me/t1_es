%%: 声明
-ifndef(cfg_price).
-define(cfg_price, 1).

-record(priceCfg, {
        id,

        %%: 点金手消耗货币类型
        %%: 100 金币
        %%: 103 优先绑钻然后非绑钻
        %%: 105 只非绑钻
        coinType,

        %%: 点金手消耗价格
        coinBuy,

        %%: 作者:罗成
        %%: BUFFID 63030 已占位
        %%: 购买对应层数的BUFF需要的钻石数量。优先消耗绑钻。
        guild_boss_buffprice

 }).

-endif.