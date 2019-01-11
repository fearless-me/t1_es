%%: 声明
-ifndef(cfg_awake).
-define(cfg_awake, 1).

-record(awakeCfg, {
        %%: 对应rouse表
        id,

        %%: 对应rouse表
        id_stone,

        %%: 激活消耗的道具
        item,

        %%: 激活需要的元气值
        vitality,

        %%: 对应每个激活石的属性选择
        selectattribute,

        %%: 属性1的对应增加项
        %%: {属性ID，增加值}
        attribute_one,

        %%: 属性2的对应增加项
        %%: {属性ID，增加值}
        attribute_two,

        %%: 属性3的对应增加项
        %%: {属性ID，增加值}
        attribute_thr,

        %%: 对应slot位置
        position,

        %%: 对应skill表
        %%: 0代表没有
        skillid,

        %%: 对应buff表
        %%: 0代表没有
        buffid,

        %%: 默认BUFF时间(毫秒)
        bufftime,

        %%: 默认BUFF时间
        minlevel

 }).

-endif.