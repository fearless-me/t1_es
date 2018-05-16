%%: 声明
-ifndef(cfg_turn_plate_lucky_cost).
-define(cfg_turn_plate_lucky_cost, 1).

-record(turn_plate_lucky_costCfg, {
        id,

        des,

        turnType,

        turnNum,

        coin,

        coinNum,

        luckyValue,

        para_a,

        para_b,

        para_x

 }).

-endif.