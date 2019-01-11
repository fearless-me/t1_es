%%: 声明
-ifndef(cfg_guild_boss).
-define(cfg_guild_boss, 1).

-record(guild_bossCfg, {
        %%: ID
        id,

        %%: BOSS的阶级
        bossClass,

        %%: BOSSID
        monsterID,

        %%: 背景资源
        background,

        %%: 界面下方的客户端显示奖励用。
        activityreward,

        %%: 个人击杀-钻石
        p_killreward_1,

        %%: 个人击杀-贡献
        p_killreward_2,

        %%: 个人首杀-钻石
        p_Fristreward_1,

        %%: 个人首杀-贡献
        p_Fristreward_2,

        %%: 家族参与-活跃
        g_touchreward_2,

        %%: 家族参与-资金
        g_touchreward_1,

        %%: 家族击杀-活跃
        g_killreward_2,

        %%: 家族击杀-资金
        g_killreward_1,

        %%: 家族首杀-活跃
        g_Fristreward_2,

        %%: 家族首杀-资金
        g_Fristreward_1,

        %%: boss描述
        boss_describe

 }).

-endif.