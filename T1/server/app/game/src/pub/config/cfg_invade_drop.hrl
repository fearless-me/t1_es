%%: 声明
-ifndef(cfg_invade_drop).
-define(cfg_invade_drop, 1).

-record(invade_dropCfg, {
        %%: 对应monster表
        monsterid,

        %%: 对应item表
        %%: [道具ID，最大掉落数]
        dropid,

        %%: 掉落几率 万分比
        probability

 }).

-endif.