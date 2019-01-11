%%: 声明
-ifndef(cfg_race_chaosmode).
-define(cfg_race_chaosmode, 1).

-record(race_chaosmodeCfg, {
        %%: 顺序
        id,

        %%: skillicon图标
        icon,

        %%: 名称
        name,

        %%: 文本
        text,

        %%: 报名界面文本
        text2

 }).

-endif.