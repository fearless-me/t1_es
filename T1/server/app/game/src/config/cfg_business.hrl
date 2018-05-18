%%: 声明
-ifndef(cfg_business).
-define(cfg_business, 1).

-record(businessCfg, {
        iD,

        platform_item_ID,

        name,

        des,

        pic,

        activityType,

        isAlonePay,

        resetclaimNumType,

        label,

        claimRmb,

        claimRecharge,

        claimConsumeType,

        claimConsume,

        claimNum,

        claimIsBuy,

        claimVip,

        claimLevel,

        rewardCoinType,

        rewardCoinNum,

        rewardItemId,

        item1,

        num1,

        item2,

        num2,

        item3,

        num3,

        item4,

        num4,

        item5,

        num5,

        item6,

        num6,

        item7,

        num7,

        item8,

        num8,

        item9,

        num9,

        item10,

        num10

 }).

-endif.