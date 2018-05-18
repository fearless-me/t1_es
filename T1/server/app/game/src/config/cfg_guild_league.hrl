%%: 声明
-ifndef(cfg_guild_league).
-define(cfg_guild_league, 1).

-record(guild_leagueCfg, {
        %%: Luoch:
        %%: 家族精英联赛的积分排名
        id,

        %%: Luoch：
        %%: 族长奖励。
        patriarch,

        %%: 罗成：
        %%: 大长老奖励
        big_Elders,

        %%: Administrator:
        %%: 长老奖励
        elders,

        %%: luoch:
        %%: 其他人奖励
        elite

 }).

-endif.