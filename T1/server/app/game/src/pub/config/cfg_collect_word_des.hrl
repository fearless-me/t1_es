%%: 声明
-ifndef(cfg_collect_word_des).
-define(cfg_collect_word_des, 1).

-record(collect_word_desCfg, {
        %%: 群组id
        group,

        %%: 活动时间变动
        ver,

        %%: 图片文件路径
        image,

        %%: 文字信息1
        info_1,

        %%: 文字信息2
        info_2,

        %%: 开启时间年，月，日
        open_y_m_d,

        %%: 持续时间（小时）
        limit_time

 }).

-endif.