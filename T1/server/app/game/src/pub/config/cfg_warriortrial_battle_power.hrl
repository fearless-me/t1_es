%%: 声明
-ifndef(cfg_warriortrial_battle_power).
-define(cfg_warriortrial_battle_power, 1).

-record(warriortrial_battle_powerCfg, {
        %%: ID
        id,

        %%: 玩家小于推荐战力百分比
        playerLessCommand,

        %%: 女神禁闭室影响战力因素
        warriortrial_battle_power_effect

 }).

-endif.