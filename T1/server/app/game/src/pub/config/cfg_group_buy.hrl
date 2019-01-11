%%: 声明
-ifndef(cfg_group_buy).
-define(cfg_group_buy, 1).

-record(group_buyCfg, {
        %%: 商品id
        id,

        %%: 群组id
        group,

        %%: 限购次数
        collect_num,

        %%: 商品的名称
        product_name,

        %%: 配置icon路径
        product_icon,

        %%: 品质框
        product_quality,

        %%: 原价，仅显示
        price,

        %%: 实际默认价格
        true_price,

        %%: 打折需数量1
        rebate1_num,

        %%: 第1次折扣
        rebate1_price,

        %%: 打折需数量2
        rebate2_num,

        %%: 第2次折扣
        rebate2_price,

        %%: 打折需数量3
        rebate3_num,

        %%: 第3次折扣
        rebate3_price,

        %%: 打折需数量4
        rebate4_num,

        %%: 第4次折扣
        rebate4_price,

        %%: 打折需数量5
        rebate5_num,

        %%: 第5次折扣
        rebate5_price,

        %%: 道具1的id
        item1_id,

        %%: 道具1数量
        item1_num,

        %%: 道具2的id
        item2_id,

        %%: 道具2数量
        item2_num,

        %%: 道具3的id
        item3_id,

        %%: 道具3数量
        item3_num,

        %%: 道具4的id
        item4_id,

        %%: 道具4数量
        item4_num,

        %%: 道具5的id
        item5_id,

        %%: 道具5数量
        item5_num,

        %%: 购买商品可累计的积分
        score

 }).

-endif.