%%: 声明
-ifndef(cfg_group_buy).
-define(cfg_group_buy, 1).

-record(group_buyCfg, {
        id,

        group,

        collect_num,

        product_name,

        product_icon,

        product_quality,

        price,

        true_price,

        rebate1_num,

        rebate1_price,

        rebate2_num,

        rebate2_price,

        rebate3_num,

        rebate3_price,

        rebate4_num,

        rebate4_price,

        rebate5_num,

        rebate5_price,

        item1_id,

        item1_num,

        item2_id,

        item2_num,

        item3_id,

        item3_num,

        item4_id,

        item4_num,

        item5_id,

        item5_num,

        score

 }).

-endif.