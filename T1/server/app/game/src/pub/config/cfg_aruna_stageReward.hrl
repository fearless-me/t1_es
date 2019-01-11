%%: 声明
-ifndef(cfg_aruna_stageReward).
-define(cfg_aruna_stageReward, 1).

-record(aruna_stageRewardCfg, {
        %%: 序号
        id,

        %%: 世界id
        %%: ID相同，世界阶段相同
        worldid,

        %%: 排名区间
        %%: [m,n]第m~n名次的奖励。包含m,n
        rank,

        %%: 奖励1：军衔值
        %%: 排名结算时获得
        reward_rank,

        %%: 奖励2：阿露兰币
        reward_Currency,

        %%: 奖励3：道具
        reward_item

 }).

-endif.