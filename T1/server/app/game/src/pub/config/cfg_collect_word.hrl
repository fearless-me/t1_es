%%: 声明
-ifndef(cfg_collect_word).
-define(cfg_collect_word, 1).

-record(collect_wordCfg, {
        %%: 奖项id
        id,

        %%: 群组id
        group,

        %%: 兑换次数
        collect_num,

        %%: 目标道具1
        target1_id,

        %%: 数量1
        target1_num,

        %%: 目标道具2
        target2_id,

        %%: 数量2
        target2_num,

        %%: 目标道具3
        target3_id,

        %%: 数量3
        target3_num,

        %%: 目标道具4
        target4_id,

        %%: 数量4
        target4_num,

        %%: 目标道具5
        target5_id,

        %%: 数量5
        target5_num,

        %%: 奖励道具1
        reward1_id,

        %%: 道具1数量
        reward1_num,

        %%: 奖励道具2
        reward2_id,

        %%: 道具2数量
        reward2_num,

        %%: 奖励道具3
        reward3_id,

        %%: 道具3数量
        reward3_num,

        %%: 每个字体每日兑换上限
        word_limit

 }).

-endif.