%%: 声明
-ifndef(cfg_festivalactivity_gift).
-define(cfg_festivalactivity_gift, 1).

-record(festivalactivity_giftCfg, {
        %%: 序号
        id,

        %%: 礼包道具id数量
        giftid,

        %%: 赠送的道具id数量
        presentid,

        %%: 礼包价格（单位为 非绑钻石）
        price,

        %%: Wahahar:
        %%: -1为无限次
        buytimes,

        %%: Wahahar:
        %%: 每个礼包都有一张对应的宣传资源
        resource_gift

 }).

-endif.