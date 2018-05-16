%%: 声明
-ifndef(cfg_group_buy_des).
-define(cfg_group_buy_des, 1).

-record(group_buy_desCfg, {
        group,

        ver,

        image,

        open_y_m_d,

        limit_time,

        score_add_time

 }).

-endif.