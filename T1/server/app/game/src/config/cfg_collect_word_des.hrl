%%: 声明
-ifndef(cfg_collect_word_des).
-define(cfg_collect_word_des, 1).

-record(collect_word_desCfg, {
        group,

        ver,

        image,

        info_1,

        info_2,

        open_y_m_d,

        limit_time

 }).

-endif.