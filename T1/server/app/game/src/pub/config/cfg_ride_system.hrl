%%: 声明
-ifndef(cfg_ride_system).
-define(cfg_ride_system, 1).

-record(ride_systemCfg, {
        %%: 唯一编号
        id,

        %%: 道具id
        itemID,

        %%: 地图id
        mapID,

        %%: x坐标
        x,

        %%: y坐标
        y,

        %%: 旋转角度
        rotw

 }).

-endif.