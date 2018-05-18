%%: 声明
-ifndef(cfg_equipRecastAdvance).
-define(cfg_equipRecastAdvance, 1).

-record(equipRecastAdvanceCfg, {
        %%: 部位id
        %%: 1 主手
        %%: 2 头盔
        %%: 3 耳环
        %%: 4 胸甲
        %%: 5 项链
        %%: 6 裤子
        %%: 7 戒指
        %%: 8 靴子
        slot,

        %%: 基础职业id
        career,

        %%: 等级
        %%: 升级到对应等级时，解锁（读取）这条属性
        level,

        %%: 专精附魔的第1条属性
        %%: [属性ID，每次附魔提升的属性随机组（对应equipRecastRand表），初始值，第一个区间点，第二个区间点，…]
        %%: 1，配置的最后一个区间点值为当前等级的属性上限
        %%: 2，当前专精附魔的属性值在【初始值，第一个区间点）中，消耗为Cost_1中第1个数组，【第一个区间点，第二个区间点）中，消耗为Cost_1中第2个数组，依次类推。
        %%: Props_2和Cost_2的规则同Props_1和Cost_1
        %%: Props_3和Cost_3的规则同Props_1和Cost_1
        props_1,

        %%: 第一条属性的显示方式
        %%: 0，整数
        %%: 1，4位小数百分比
        displaymode_1,

        %%: 备注见Props_1
        cost_1,

        props_2,

        %%: 第二条属性的显示方式
        %%: 0，整数
        %%: 1，4位小数百分比
        displaymode_2,

        cost_2,

        props_3,

        %%: 第三条属性的显示方式
        %%: 0，整数
        %%: 1，4位小数百分比
        displaymode_3,

        cost_3

 }).

-endif.