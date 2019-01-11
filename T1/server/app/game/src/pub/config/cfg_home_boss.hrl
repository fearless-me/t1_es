%%: 声明
-ifndef(cfg_home_boss).
-define(cfg_home_boss, 1).

-record(home_bossCfg, {
        %%: 家园等级
        homelevel,

        %%: bossid
        monsterid,

        %%: mapid
        mapid,

        %%: 奖励阶段1
        reward1,

        %%: 奖励阶段2
        reward2,

        %%: 奖励阶段3
        reward3,

        %%: 奖励阶段4
        reward4,

        %%: 帮助阶段1
        assist1,

        %%: 帮助阶段2
        assist2,

        %%: 帮助阶段3
        assist3,

        %%: 帮助阶段4
        assist4,

        %%: 展示奖励
        showreward

 }).

-endif.