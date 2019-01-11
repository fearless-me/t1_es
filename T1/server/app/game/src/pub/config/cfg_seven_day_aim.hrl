%%: 声明
-ifndef(cfg_seven_day_aim).
-define(cfg_seven_day_aim, 1).

-record(seven_day_aimCfg, {
        id,

        %%: 天数
        day,

        %%: 类型
        type,

        %%: 类型名称
        name,

        %%: 条件描述
        show,

        %%: 预览显示物品奖励
        preview,

        %%: 副本类型1
        subType1,

        %%: 副本条件
        args1,

        %%: 到达类型
        subType2,

        %%: 到达参数
        args2,

        %%: 需求等级条件
        subType3,

        %%: 需求参数
        args3,

        %%: 奖励货币
        rewardCoin,

        %%: 奖励道具
        rewardItem

 }).

-endif.