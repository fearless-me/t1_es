%%: 声明
-ifndef(cfg_google_achievement).
-define(cfg_google_achievement, 1).

-record(google_achievementCfg, {
        %%: 序列
        iD,

        %%: 类型
        type,

        %%: 参数
        param,

        %%: sdk传参
        achi_id

 }).

-endif.