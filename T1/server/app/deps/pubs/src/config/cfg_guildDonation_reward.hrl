%%: 声明
-ifndef(cfg_guildDonation_reward).
-define(cfg_guildDonation_reward, 1).

-record(guildDonation_rewardCfg, {
        %%: 作者:
        %%: 任务组id
        groupid,

        %%: 作者:
        %%: 任务星级
        task_star,

        %%: 李孟：十环奖励道具1，格式[{物品ID，数量},…]
        reward_item1,

        %%: 作者:
        %%: 十环奖励金币
        %%: [{货币类型,货币数量}, ...]
        %%: 个人货币类型均在此处配置
        reward_money

 }).

-endif.