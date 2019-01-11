%%: 声明
-ifndef(cfg_vip_card_eco).
-define(cfg_vip_card_eco, 1).

-record(vip_card_ecoCfg, {
        %%: 級別
        id,

        %%: 類型
        type,

        %%: 名稱
        name,

        %%: 價值顯示
        price,

        %%: 特權顯示說明
        vip_card_des,

        %%: 所需人民幣
        rmb,

        %%: 每日禮包
        gift,

        %%: 生效總天數
        day,

        %%: 發放貨幣類型
        coin_type,

        %%: 發放貨幣數量
        coin_num,

        %%: 一次性道具
        item_id,

        %%: 道具数量
        item_num

 }).

-endif.