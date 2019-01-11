%%: 声明
-ifndef(cfg_ladder_1v1_reward).
-define(cfg_ladder_1v1_reward, 1).

-record(ladder_1v1_rewardCfg, {
        %%: tiancheng:
        %%: 排名开始
        rank_start,

        %%: tiancheng:
        %%: 排名结束
        rank_end,

        %%: tiancheng:
        %%: 普通功勋奖励
        normal,

        %%: tiancheng:
        %%: 额外功勋奖励
        extra,

        %%: user:
        %%: 每日固定时间获得的结算奖励
        %%: [货币类型，奖励值]
        everydaycoin,

        %%: 每周结算奖励
        %%: 周1凌晨4点
        item,

        %%: Administrator:
        %%: 刷新历史排名时获得的一次性钻石奖励，每个号只领取一次。
        %%: [a,b,c]表示——在该排名区间每第一次上升a名，获得一次货币类型为b的货币，数量c。
        %%: 举例，从3000上升到2000，（3000-2000)/200，应获得5次奖励
        coin

 }).

-endif.