%%: 声明
-ifndef(cfg_accessresources_exp).
-define(cfg_accessresources_exp, 1).

-record(accessresources_expCfg, {
        %%: 排序id
        id,

        icon,

        %%: 名称
        name,

        %%: 描述
        desc,

        %%: 星级数量
        star,

        %%: [20,0],值1代表跳转到的界面ID，值2代表书签ID
        %%: 值1通过mainMenu获得
        %%:    当值1为活动（编号为22），则可在DailyInterface查找对应活动ID
        %%: 值为4时，第二个参数为任务类型，会跳转到任务界面对应的页签
        %%: 1.主线 2.家族 3.情缘 4.狩猎 5.支线
        ralation_ui

 }).

-endif.