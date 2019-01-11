%%: 声明
-ifndef(cfg_buffAnnounce).
-define(cfg_buffAnnounce, 1).

-record(buffAnnounceCfg, {
        %%: Id:
        %%: 填写ID，在buff.Announce字段使用本ID
        id,

        %%: 0自己可见，1周围人可见
        msg_target,

        %%: Msg_time:
        %%: 提示时机
        %%: 0无提示
        %%: 1添加提示
        %%: 2间隔触发提示
        %%: 4删除提示
        %%: 填写和值
        msg_time,

        %%: 添加提示内容
        msg_1,

        %%: 添加显示时间毫秒
        showTime_1,

        %%: 间隔触发提示文字
        msg_2,

        %%: 间隔显示时间毫秒
        showTime_2,

        %%: 删除提示文字
        msg_4,

        %%: 删除显示时间毫秒
        showTime_4

 }).

-endif.