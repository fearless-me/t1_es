%%: 声明
-ifndef(cfg_group_buy_des).
-define(cfg_group_buy_des, 1).

-record(group_buy_desCfg, {
        %%: 群组id
        group,

        %%: 临时字段 
        ver,

        %%: 图片文件路径
        image,

        %%: 开启时间年，月，日
        open_y_m_d,

        %%: 持续时间（小时）
        limit_time,

        %%: 积分领取延后时间
        score_add_time

 }).

-endif.