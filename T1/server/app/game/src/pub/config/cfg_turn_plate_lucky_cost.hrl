%%: 声明
-ifndef(cfg_turn_plate_lucky_cost).
-define(cfg_turn_plate_lucky_cost, 1).

-record(turn_plate_lucky_costCfg, {
        %%: ID
        id,

        %%: 描述解釋
        des,

        %%: 轉盤類型
        turnType,

        %%: 轉動次數
        turnNum,

        %%: 花費對應貨幣類型
        coin,

        %%: 貨幣數
        coinNum,

        %%: 每次轉動增加的幸運值
        luckyValue,

        %%: 參數a
        para_a,

        %%: 參數b
        para_b,

        %%: 參數x
        para_x

 }).

-endif.