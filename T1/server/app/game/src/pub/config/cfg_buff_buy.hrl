%%: 声明
-ifndef(cfg_buff_buy).
-define(cfg_buff_buy, 1).

-record(buff_buyCfg, {
        %%: Wangshiyu:
        %%: id，同type内，界面排序按照id大小来！
        id,

        %%: Wangshiyu：
        %%: 购买类型，每个活动使用不同的type
        %%: 1，幽界探险BUFF
        type,

        %%: Wangshiyu：
        %%: 填写BUFF id
        buffid,

        %%: Wangshiyu:
        %%: 【支付类型，价格】 就是100 103 105那一套
        price,

        %%: Wangshiyu：
        %%: 展示用itemid，用于展示tips，展示icon
        itemid

 }).

-endif.