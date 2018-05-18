%%: 声明
-ifndef(cfg_ride).
-define(cfg_ride, 1).

-record(rideCfg, {
        id,

        type,

        npcId,

        maxTimes,

        open,

        costType,

        costValue,

        playerMax,

        rewardBuff,

        rewardCost,

        rideTime,

        weapon_hiden,

        playspeed,

        animation_1,

        char_scale,

        ride_distance,

        ride_npc

 }).

-endif.