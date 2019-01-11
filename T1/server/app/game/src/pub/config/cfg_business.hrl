%%: 声明
-ifndef(cfg_business).
-define(cfg_business, 1).

-record(businessCfg, {
        %%: 活动ID
        iD,

        %%: 平台索引ID
        platform_item_ID,

        %%: 活动名称
        name,

        %%: 活动描述
        des,

        %%: Administrator:
        %%: 首充：
        %%: 充值金额美术图|充值奖励图|充值背景|展示模型播音效
        pic,

        %%: 活动类型
        activityType,

        %%: 充值类型计算活动
        isAlonePay,

        %%: 重置购买次数类型
        resetclaimNumType,

        %%: 物品标签
        label,

        %%: 货币，钱
        claimRmb,

        %%: 充值钻石
        claimRecharge,

        %%: 消费金额类型
        claimConsumeType,

        %%: 消费金额
        claimConsume,

        %%: 购买次数限制
        claimNum,

        %%: 开服基金是否购买
        claimIsBuy,

        %%: 特权卡限制
        claimVip,

        %%: 等级需求
        claimLevel,

        %%: 货币类型
        rewardCoinType,

        %%: 货币数量
        rewardCoinNum,

        %%: 掉落包
        rewardItemId,

        %%: 道具1
        item1,

        %%: 数量1
        num1,

        %%: 道具2
        item2,

        %%: 数量2
        num2,

        %%: 道具3
        item3,

        %%: 数量3
        num3,

        %%: 道具4
        item4,

        %%: 数量4
        num4,

        %%: 道具5
        item5,

        %%: 数量5
        num5,

        %%: 道具6
        item6,

        %%: 数量6
        num6,

        %%: 道具7
        item7,

        %%: 数量7
        num7,

        %%: 道具8
        item8,

        %%: 数量8
        num8,

        %%: 道具9
        item9,

        %%: 数量9
        num9,

        %%: 道具10
        item10,

        %%: 数量10
        num10

 }).

-endif.