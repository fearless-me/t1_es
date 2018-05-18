%%: 声明
-ifndef(cfg_warriortrial_battle_power).
-define(cfg_warriortrial_battle_power, 1).

-record(warriortrial_battle_powerCfg, {
        id,

        playerLessCommand,

        warriortrial_battle_power_effect

 }).

-endif.