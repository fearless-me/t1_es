%%: 声明
-ifndef(cfg_race_waypoint).
-define(cfg_race_waypoint, 1).

-record(race_waypointCfg, {
        %%: 作者:
        %%: 触发区域序列
        id,

        %%: 作者:
        %%: 寻路箭头指向点
        %%: [x,z]
        waypoint

 }).

-endif.