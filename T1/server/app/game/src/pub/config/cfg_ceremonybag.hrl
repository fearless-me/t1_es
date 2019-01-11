%%: 声明
-ifndef(cfg_ceremonybag).
-define(cfg_ceremonybag, 1).

-record(ceremonybagCfg, {
        %%: 福袋号数
        id,

        %%: Wangshiyu：
        %%: 1，绑钻福袋
        %%: 2，非绑福袋
        tag,

        %%: wangshiyu：
        %%: 如果有人获得此项奖励，是否在界面右侧Log
        %%: 0 不公告
        %%: 1 公告
        announce,

        %%: Wangshiyu：
        %%: 103绑钻
        %%: 105非绑
        %%: 填价格
        price,

        %%: 奖励道具1 id
        reward1,

        %%: 数量范围1
        limit,

        %%: 权重1
        weight1,

        %%: 奖励道具2
        reward2,

        %%: 数量范围2
        limit2,

        %%: 权重2
        weight2,

        %%: 奖励道具3
        reward3,

        %%: 数量范围3
        limit3,

        %%: 权重3
        weight3

 }).

-endif.