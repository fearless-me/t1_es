%%: 声明
-ifndef(cfg_alive).
-define(cfg_alive, 1).

-record(aliveCfg, {
        id,

        objid,

        type,

        equipID,

        buffList,

        skillList,

        %%: AutoBVT:
        %%: 0表示不掉落，
        %%: 1表示死亡后原地掉落，
        %%: 红色装备特殊处理，不应在此处掉落
        drop,

        pos,

        percent

 }).

-endif.