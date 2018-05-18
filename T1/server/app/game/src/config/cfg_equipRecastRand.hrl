%%: 声明
-ifndef(cfg_equipRecastRand).
-define(cfg_equipRecastRand, 1).

-record(equipRecastRandCfg, {
        %%: Administrator:
        %%: ID 无意义
        id,

        %%: 属性随机组id
        %%: 对应equipRecastInit表的Group
        group,

        %%: 属性变化值随机区间[下限，上限]
        values,

        %%: 每次附魔增加的附魔精度
        %%: 取到属性区间随出来的值在该区域的位置，用这个位置在附魔精度区间找到对应的值
        %%: 比如属性区间为【0,100】，附魔精度区间为【0,1000】
        %%: 随出来的属性值为40，那么增加的附魔精度则为400
        enchant_add,

        %%: 权重
        weight

 }).

-endif.