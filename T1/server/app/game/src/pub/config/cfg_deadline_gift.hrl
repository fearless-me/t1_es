%%: 声明
-ifndef(cfg_deadline_gift).
-define(cfg_deadline_gift, 1).

-record(deadline_giftCfg, {
        %%: 序号
        id,

        %%: luoch：
        %%: 1 等级触发
        %%: 2 精炼触发
        %%: 3 升星触发
        %%: 4 宠物升星触发
        type,

        %%: 触发类型参数
        type_num,

        %%: 左侧页签文本
        tab_string,

        %%: luoch ：
        %%: 单位/秒
        time,

        %%: 礼包1序号
        gift1,

        %%: 道具1
        item1,

        %%: 礼包1名称
        item1_name,

        %%: 道具1数量
        item1_Counts,

        %%: 罗成：
        %%: 折扣率，显示使用。当为0时，显示为免费。
        item1_Discount,

        %%: 货币类型
        item1_coinType,

        %%: 原价
        item1_coinInitial,

        %%: 道具1价格
        item1_coinNum,

        %%: 道具1限购次数
        item1_num,

        %%: 礼包2序号
        gift2,

        %%: 道具2
        item2,

        %%: 礼包2名称
        item2_name,

        %%: 道具2数量
        item2_Counts,

        %%: 罗成：
        %%: 折扣率，显示使用。当为0时，显示为免费。
        item2_Discount,

        %%: 货币类型
        item2_coinType,

        %%: 原价
        item2_coinInitial,

        %%: 道具2价格
        item2_coinNum,

        %%: 道具2限购次数
        item2_num,

        %%: 礼包3序号
        gift3,

        %%: 道具3
        item3,

        %%: 礼包3名称
        item3_name,

        %%: 道具3数量
        item3_Counts,

        %%: 罗成：
        %%: 折扣率，显示使用。当为0时，显示为免费。
        item3_Discount,

        %%: 货币类型
        item3_coinType,

        %%: 原价
        item3_coinInitial,

        %%: 道具3价格
        item3_coinNum,

        %%: 道具3限购次数
        item3_num,

        %%: 背景图
        image

 }).

-endif.