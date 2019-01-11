%%: 声明
-ifndef(cfg_ride).
-define(cfg_ride, 1).

-record(rideCfg, {
        %%: 道具ID
        id,

        %%: 游乐设施类型
        type,

        %%: 关联NPC表
        npcId,

        %%: 最大使用次数
        maxTimes,

        %%: 是否开启，1开启，0关闭
        open,

        %%: 消耗货币类型
        costType,

        %%: 消耗数量
        costValue,

        %%: 乘坐人数
        playerMax,

        %%: 奖励BUFF
        rewardBuff,

        %%: 奖励给所有者的比例
        rewardCost,

        %%: 乘坐时间
        rideTime,

        %%: 是否隐藏
        weapon_hiden,

        %%: 设施动画速度
        playspeed,

        %%: 乘坐动作
        animation_1,

        %%: 角色缩放
        char_scale,

        %%: 设施距离间隔
        ride_distance,

        %%: 游乐设施关联系统管理员
        ride_npc

 }).

-endif.