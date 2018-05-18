%%: 声明
-ifndef(cfg_turn_plate_rule_reward).
-define(cfg_turn_plate_rule_reward, 1).

-record(turn_plate_rule_rewardCfg, {
        turnType,

        paneId,

        pro,

        itemId,

        itemNum

 }).

-endif.