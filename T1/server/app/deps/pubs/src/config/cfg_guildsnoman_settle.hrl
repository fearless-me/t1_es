%%: 声明
-ifndef(cfg_guildsnoman_settle).
-define(cfg_guildsnoman_settle, 1).

-record(guildsnoman_settleCfg, {
        %%: 作者:
        %%: 修改定义为：
        %%: 对应家族等级
        id,

        %%: 作者:
        %%: 家族奖励：针对整个家族
        %%: [家族资金,家族活跃]
        rl,

        %%: 作者:
        %%: 个人代币奖励
        %%: [{类型,数量},{类型,数量},{类型,数量}]
        coin,

        %%: 作者:
        %%: 个人道具奖励
        %%: [{道具ID,道具数量}]
        item,

        %%: Luoch:
        %%: 雪人体积大小，百分比。
        volume

 }).

-endif.