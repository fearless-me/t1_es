%%: 声明
-ifndef(cfg_collect_word).
-define(cfg_collect_word, 1).

-record(collect_wordCfg, {
        id,

        group,

        collect_num,

        target1_id,

        target1_num,

        target2_id,

        target2_num,

        target3_id,

        target3_num,

        target4_id,

        target4_num,

        target5_id,

        target5_num,

        reward1_id,

        reward1_num,

        reward2_id,

        reward2_num,

        reward3_id,

        reward3_num,

        word_limit

 }).

-endif.