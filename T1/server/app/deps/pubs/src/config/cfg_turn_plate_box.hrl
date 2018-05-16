%%: 声明
-ifndef(cfg_turn_plate_box).
-define(cfg_turn_plate_box, 1).

-record(turn_plate_boxCfg, {
        boxType,

        reclaimTurnNum,

        rewardItem

 }).

-endif.