%%: 声明
-ifndef(cfg_alive).
-define(cfg_alive, 1).

-record(aliveCfg, {
        %%: id
        id,

        %%: 对应object.id
        objid,

        %%: 物品类型
        type,

        %%: 关联equipID
        equipID,

        %%: 触发物品获得的BUFF
        buffList,

        %%: 触发物品获得的临时技能
        skillList,

        %%: AutoBVT:
        %%: 0表示不掉落，
        %%: 1表示死亡后原地掉落，
        %%: 红色装备特殊处理，不应在此处掉落
        drop,

        %%: 坐标
        pos,

        %%: 刷新概率
        percent

 }).

-endif.