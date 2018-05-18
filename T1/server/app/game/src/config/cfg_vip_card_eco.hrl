%%: 声明
-ifndef(cfg_vip_card_eco).
-define(cfg_vip_card_eco, 1).

-record(vip_card_ecoCfg, {
        id,

        type,

        name,

        price,

        vip_card_des,

        rmb,

        gift,

        day,

        coin_type,

        coin_num,

        item_id,

        item_num

 }).

-endif.