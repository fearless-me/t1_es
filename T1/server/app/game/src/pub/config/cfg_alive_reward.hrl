%%: 声明
-ifndef(cfg_alive_reward).
-define(cfg_alive_reward, 1).

-record(alive_rewardCfg, {
        %%: 小于等于该排名的数字为此行奖励
        id,

        %%: 奖励itemId1
        itemId1,

        %%: 奖励数量1
        itemNum1,

        %%: 奖励itemId2
        itemId2,

        %%: 奖励数量2
        itemNum2

 }).

-endif.