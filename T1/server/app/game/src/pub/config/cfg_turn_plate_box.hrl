%%: 声明
-ifndef(cfg_turn_plate_box).
-define(cfg_turn_plate_box, 1).

-record(turn_plate_boxCfg, {
        %%: 類型
        boxType,

        %%: 需要轉動的次數
        reclaimTurnNum,

        %%: 王仕宇：
        %%: 格式 [itemid,num]
        %%: 可以空置，[0,0]表示null，而不是[] 
        rewardItem1,

        %%: 獎勵的寶箱禮包2
        rewardItem2,

        %%: 獎勵的寶箱禮包3
        rewardItem3

 }).

-endif.