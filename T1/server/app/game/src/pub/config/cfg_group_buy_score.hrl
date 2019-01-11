%%: 声明
-ifndef(cfg_group_buy_score).
-define(cfg_group_buy_score, 1).

-record(group_buy_scoreCfg, {
        %%: 奖励id
        id,

        %%: 群组id
        group,

        %%: 积分对应
        score,

        %%: 奖励道具1
        reward1_id,

        %%: 道具1的数量
        reward1_num,

        %%: 奖励道具2
        reward2_id,

        %%: 道具2的数量
        reward2_num,

        %%: 奖励道具3
        reward3_id,

        %%: 道具3的数量
        reward3_num,

        %%: 奖励道具4
        reward4_id,

        %%: 道具4的数量
        reward4_num,

        %%: 奖励道具5
        reward5_id,

        %%: 道具5的数量
        reward5_num

 }).

-endif.