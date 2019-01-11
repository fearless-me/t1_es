%%: 声明
-ifndef(cfg_fashion_Discount).
-define(cfg_fashion_Discount, 1).

-record(fashion_DiscountCfg, {
        %%: 序号
        id,

        %%: 批次号
        batch,

        %%: luoch：
        %%: 0 女 1 男
        %%: [{性别，对应时装ID},...]
        fashionID,

        %%: luoch：
        %%: 0 女 1 男
        %%: [{性别，对应道具ID},...]
        itemID,

        %%: 折扣率
        discount,

        %%: luoch:
        %%: 103 绑钻
        %%: 105 非绑
        cointype,

        %%: 原价（显示）
        original_price,

        %%: 现价(实际)
        price,

        %%: 开启时间
        start_time,

        %%: 持续时间
        %%: /时
        time,

        %%: 原画资源
        resources_bg,

        %%: luoch：
        %%: 和fashion表show字段关联。当此字段为1时，强制显示时装，show字段的值是无效的。
        fashion_show

 }).

-endif.