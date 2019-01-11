%%: 声明
-ifndef(cfg_dailyinterface_index).
-define(cfg_dailyinterface_index, 1).

-record(dailyinterface_indexCfg, {
        %%: Luoch:
        %%: 活动ID，不可重复，客户端使用。
        %%: 与dailyinterface表中ID对应。可能出现此表中的ID在dailyinterface表中没有。
        id,

        %%: Luoch:
        %%: 该活动的类型，影响显示在哪一个签页下。
        %%: 1 日常玩法
        %%: 2 限时活动
        %%: 4 竞技玩法
        activitytype,

        %%: 玩法名称
        name,

        %%: Luoch:
        %%: 影响在该签页下的默认显示顺序。但是实际顺序会受到程序代码排序规则影响。
        position,

        %%: Luoch:
        %%: 该活动的图标、背景图资源。
        %%: 当玩法类型为1时，对应的活动图标资源。
        %%: 当玩法类型为2时，对应背景图资源。
        %%: 当玩法类型为3时，对应图标资源。
        activity_icon,

        %%: Luoch:
        %%: 主要产出奖励类型（最多显示两个）
        %%: 1 金币
        %%: 2 材料
        %%: 3 经验
        rewardtype,

        %%: Luoch:
        %%: 控制是否显示并检测更新该类活动的次数。
        %%: 注：仅独立功能副本可以检测。
        active_num,

        %%: 日常玩法最低进入等级
        %%: 仅用于日常界面对应显示
        level,

        %%: Luoch:
        %%: 该大类活动的描述
        describe_all,

        %%: 主要产出（显示）
        main_output,

        %%: 开放时间（限时活动）
        begintime,

        %%: 按钮文字
        button_string,

        %%: 活动点开后的资源
        activity_background,

        %%: Luoch：
        %%: 限时活动的图标
        %%: 主界面中显示
        limited_icon,

        %%: 特权皇冠显示
        vipShow

 }).

-endif.