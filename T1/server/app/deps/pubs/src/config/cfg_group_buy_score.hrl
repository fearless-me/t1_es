%%: 声明
-ifndef(cfg_group_buy_score).
-define(cfg_group_buy_score, 1).

-record(group_buy_scoreCfg, {
        id,

        group,

        score,

        reward1_id,

        reward1_num,

        reward2_id,

        reward2_num,

        reward3_id,

        reward3_num,

        reward4_id,

        reward4_num,

        reward5_id,

        reward5_num

 }).

-endif.