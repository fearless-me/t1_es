%%: 声明
-ifndef(cfg_ride_system).
-define(cfg_ride_system, 1).

-record(ride_systemCfg, {
        id,

        itemID,

        mapID,

        x,

        y,

        rotw

 }).

-endif.