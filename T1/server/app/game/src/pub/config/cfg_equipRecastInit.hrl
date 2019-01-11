%%: 声明
-ifndef(cfg_equipRecastInit).
-define(cfg_equipRecastInit, 1).

-record(equipRecastInitCfg, {
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

        %%: 属性附魔的属性条目
        %%: 最多3条属性
        %%: [{属性ID，初始值，最大值},..]
        props,

        %%: 附魔精度分段
        %%: [a,b,c...]
        %%: 在0<附魔精度<=a 时，Group取第1个数组
        %%: 在a<附魔精度<=b 时，Group取第2个数组
        %%: 以此类推
        reCastValue,

        %%: 根据附魔精度分段而配置的属性随机组
        %%: [a,b,c...]
        %%: 在0<附魔精度<=a 时，Group取第1个数组
        %%: 在a<附魔精度<=b 时，Group取第2个数组
        %%: 以此类推
        %%: 数组中的值对应equipRecastRand表的group
        group,

        %%: 根据附魔精度分段而配置的属性随机组
        %%: [a,b,c...]
        %%: 在0<附魔精度<=a 时，Cost取第1个数组
        %%: 在a<附魔精度<=b 时，Cost取第2个数组
        %%: 以此类推
        %%: 意思是在不同附魔精度时，使用不同的消耗
        %%: [{道具id，消耗数量}，{道具id，消耗数量}…….]
        cost,

        %%: 多少精度解锁专精附魔栏位
        %%: 第1个，第2个，第3个
        lockCastVal

 }).

-endif.