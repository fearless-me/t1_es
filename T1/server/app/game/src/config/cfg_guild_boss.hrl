%%: 声明
-ifndef(cfg_guild_boss).
-define(cfg_guild_boss, 1).

-record(guild_bossCfg, {
        id,

        bossClass,

        monsterID,

        background,

        activityreward,

        p_killreward_1,

        p_killreward_2,

        p_Fristreward_1,

        p_Fristreward_2,

        g_touchreward_2,

        g_touchreward_1,

        g_killreward_2,

        g_killreward_1,

        g_Fristreward_2,

        g_Fristreward_1,

        boss_describe

 }).

-endif.