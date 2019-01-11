%%: 声明
-ifndef(cfg_home_area).
-define(cfg_home_area, 1).

-record(home_areaCfg, {
        %%: tiancheng:
        %%: -define(Home_House, 1).   %% 房子
        %%: -define(Home_Courtyard, 2).  %% 庭院
        %%: -define(Home_BreedArea , 3). %% 饲养区
        %%: -define(Home_Plantation, 4). %% 种植区
        %%: -define(Home_HotSpring, 5).  %% 温泉
        %%: -define(Home_Bonfire, 6).  %% 篝火区
        %%: -define(Home_WishingWell, 7). %% 许愿池
        %%: -define(Home_Plantation, 8). %% 种植区B
        %%: -define(Home_Plantation, 9). %% 种植区C
        id,

        %%: 1.小屋
        %%: 2.饲养区
        %%: 3.农田
        type,

        %%: admin:
        %%: 区等级
        level,

        %%: admin:
        %%: 小屋名称
        name,

        %%: admin:
        %%: 需要家园等级
        homelevel,

        %%: tiancheng:
        %%: 需要材料
        %%: [{itemID,number},{itemID,number}]
        materials,

        %%: [货币类型，货币数量]
        %%: 1.金币
        %%: 3.钻石
        coin_cost,

        %%: 农田配置的是每一个小种植块的中心坐标，半径配置在position_parm中
        %%: 屋子、饲养区配置的是区域4个顶点坐标。
        area_position,

        %%: 农田地块的半径
        position_parm,

        %%: 房间由于是正方形
        %%: 此处填写边长即可
        area_limit,

        %%: [消耗方式，货币值，递增值]
        %%: 100). %%使用金币
        %%: 103). %%使用钻石币,先扣绑定再扣非绑定
        %%: 105). %%仅使用非绑钻石币
        area_cost

 }).

-endif.