%%: 声明
-ifndef(cfg_race_item).
-define(cfg_race_item, 1).

-record(race_itemCfg, {
        %%: 道具列表
        %%: 1，冰冻
        %%: 2，无敌
        %%: 3，闪电
        %%: 4，烟幕
        %%: 5，反向
        %%: 6，加速
        %%: 7，加速带
        %%: 8，陷阱
        id,

        %%: 目标选择
        %%: 1，对自己及队友使用
        %%: 2，对周围敌方使用
        %%: 3，对第一名使用
        %%: 4，创建采集物
        %%: 5，创建载体
        type,

        %%: 参数1——————
        %%: type为1/2/3时，为【普通buffid，强化buffid】
        %%: type为4时，为【普通采集物id，强化采集物id】
        %%: type为5时，为【普通载体id，强化载体id】
        param1,

        %%: 参数1——————
        %%: type为1/3时，忽略
        %%: type为2时，为【普通半径，强化半径】
        %%: type为4/5时，为【朝向（0-6.28），偏移坐标X，偏移坐标Y】
        param2,

        %%: 各名次的道具权重获取——————
        %%: [名次1权重，名次2权重，名次3权重….]
        rand,

        %%: 道具名字
        name,

        %%: 道具icon
        icon,

        %%: 道具描述
        text,

        %%: 给施放者增加特效
        cast_vfx

 }).

-endif.