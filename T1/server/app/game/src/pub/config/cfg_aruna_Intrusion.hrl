%%: 声明
-ifndef(cfg_aruna_Intrusion).
-define(cfg_aruna_Intrusion, 1).

-record(aruna_IntrusionCfg, {
        %%: 序号
        id,

        %%: 世界ID
        worldid,

        %%: 波次编号
        batch,

        %%: 怪物组
        monsterid,

        %%: 刷新坐标(x,z,圆半径)
        position,

        %%: 间隔时间(秒）
        time_interval,

        %%: 是否是BOSS
        boss

 }).

-endif.