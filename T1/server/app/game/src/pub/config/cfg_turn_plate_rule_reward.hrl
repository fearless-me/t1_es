%%: 声明
-ifndef(cfg_turn_plate_rule_reward).
-define(cfg_turn_plate_rule_reward, 1).

-record(turn_plate_rule_rewardCfg, {
        %%: 類型
        turnType,

        %%: 格子數
        paneId,

        %%: 格子對應的權重
        pro,

        %%: 物品ID
        itemId,

        %%: 物品數量
        itemNum

 }).

-endif.