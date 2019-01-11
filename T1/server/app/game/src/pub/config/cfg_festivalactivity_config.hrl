%%: 声明
-ifndef(cfg_festivalactivity_config).
-define(cfg_festivalactivity_config, 1).

-record(festivalactivity_configCfg, {
        %%: 活动id
        id,

        %%: 活动名称
        name,

        %%: 活动开始时间
        timestart,

        %%: 活动结束时间
        timeend,

        %%: Administrator:
        %%: [普通副本id,Boss副本id]
        copyid,

        %%: Wahaha:
        %%: [入场券id,消耗的入场券数目,进入Boss副本的概率(万分比),每日免费挑战次数],[入场券id,消耗的入场券数目,进入Boss副本的概率(万分比),每日免费挑战次数]
        enterprop,

        %%: 关联节日礼包表id
        giftid,

        %%: 副本签页所需道具
        copypageitem,

        %%: 兑换签页所需道具
        exchangepageitem,

        %%: 礼包签页所需道具
        giftpageitem

 }).

-endif.