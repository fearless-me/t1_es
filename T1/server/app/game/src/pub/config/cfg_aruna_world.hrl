%%: 声明
-ifndef(cfg_aruna_world).
-define(cfg_aruna_world, 1).

-record(aruna_worldCfg, {
        %%: 序号（千万别改）
        id,

        %%: 贡献总值
        sample_value,

        %%: 地图id
        mapid,

        %%: 世界等级
        worldlevel,

        %%: 废弃
        duration,

        %%: 废弃
        extra,

        %%: 奖励1：军衔值
        reward_rank,

        %%: 奖励2：阿露兰币
        reward_Currency,

        %%: 世界阶段奖励
        reward,

        %%: 世界阶段名
        desc,

        %%: 最低等级
        minlevel

 }).

-endif.