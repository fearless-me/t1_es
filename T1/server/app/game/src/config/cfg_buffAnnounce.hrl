%%: 声明
-ifndef(cfg_buffAnnounce).
-define(cfg_buffAnnounce, 1).

-record(buffAnnounceCfg, {
        %%: Id:
        %%: 填写ID，在buff.Announce字段使用本ID
        id,

        msg_target,

        %%: Msg_time:
        %%: 提示时机
        %%: 0无提示
        %%: 1添加提示
        %%: 2间隔触发提示
        %%: 4删除提示
        %%: 填写和值
        msg_time,

        msg_1,

        showTime_1,

        msg_2,

        showTime_2,

        msg_4,

        showTime_4

 }).

-endif.