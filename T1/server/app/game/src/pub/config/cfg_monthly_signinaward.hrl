%%: 声明
-ifndef(cfg_monthly_signinaward).
-define(cfg_monthly_signinaward, 1).

-record(monthly_signinawardCfg, {
        %%: Administrator:
        %%: 月份ID
        type,

        %%: 累计签到天数
        total,

        %%: 道具ID1
        item1,

        %%: 道具ID1数量
        num1,

        %%: 不知道什么东西
        tpye1,

        %%: 道具类型ID2
        item2,

        %%: ID2数量
        num2,

        tpye2,

        item3,

        num3,

        tpye3,

        item4,

        num4,

        tpye4,

        item5,

        num5,

        tpye5

 }).

-endif.