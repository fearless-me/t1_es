%% coding: latin-1
%%: 实现
-module(cfg_home_area_chs).
-compile(export_all).
-include("cfg_home_area.hrl").
-include("logger.hrl").

getRow(1,1)->
    #home_areaCfg {
    id = 1,
    type = 1,
    level = 1,
    name = "普通小屋",
    homelevel = 1,
    materials = [],
    coin_cost = [],
    area_position = [],
    position_parm = 0,
    area_limit = [4,8],
    area_cost = [100,10000,2000]
    };
getRow(1,2)->
    #home_areaCfg {
    id = 1,
    type = 1,
    level = 2,
    name = "精致小屋",
    homelevel = 1,
    materials = [],
    coin_cost = [],
    area_position = [],
    position_parm = 0,
    area_limit = [8,12],
    area_cost = [100,20000,3000]
    };
getRow(1,3)->
    #home_areaCfg {
    id = 1,
    type = 1,
    level = 3,
    name = "豪华小屋",
    homelevel = 1,
    materials = [],
    coin_cost = [],
    area_position = [],
    position_parm = 0,
    area_limit = [12,25],
    area_cost = [103,100,20]
    };
getRow(3,1)->
    #home_areaCfg {
    id = 3,
    type = 2,
    level = 1,
    name = "一级饲养区",
    homelevel = 1,
    materials = [],
    coin_cost = [{1,100000}],
    area_position = [{191,197},{183,223},{212,233},{220,205}],
    position_parm = 0
    };
getRow(3,2)->
    #home_areaCfg {
    id = 3,
    type = 2,
    level = 2,
    name = "二级饲养区",
    homelevel = 2,
    materials = [],
    coin_cost = [{3,200}],
    area_position = [{191,197},{183,223},{212,233},{220,205}],
    position_parm = 0
    };
getRow(3,3)->
    #home_areaCfg {
    id = 3,
    type = 2,
    level = 3,
    name = "三级饲养区",
    homelevel = 4,
    materials = [],
    coin_cost = [],
    area_position = [{191,197},{183,223},{212,233},{220,205}],
    position_parm = 0
    };
getRow(4,1)->
    #home_areaCfg {
    id = 4,
    type = 3,
    level = 1,
    name = "农田A",
    homelevel = 1,
    materials = [],
    coin_cost = [],
    area_position = [{341,195},{341,183},{349,184},{349,195},{357,195},{357,184}],
    position_parm = 4
    };
getRow(8,0)->
    #home_areaCfg {
    id = 8,
    type = 3,
    level = 0,
    name = "农田B",
    homelevel = 3,
    materials = [],
    coin_cost = [{1,100000}],
    area_position = [{341,217},{341,228},{349,217},{349,228},{357,217},{357,229}],
    position_parm = 4
    };
getRow(8,1)->
    #home_areaCfg {
    id = 8,
    type = 3,
    level = 1,
    name = "农田B",
    homelevel = 3,
    materials = [],
    coin_cost = [],
    area_position = [{341,217},{341,228},{349,217},{349,228},{357,217},{357,229}],
    position_parm = 4
    };
getRow(9,0)->
    #home_areaCfg {
    id = 9,
    type = 3,
    level = 0,
    name = "农田C",
    homelevel = 5,
    materials = [],
    coin_cost = [{3,200}],
    area_position = [{341,250},{341,262},{349,250},{349,262},{357,251},{357,262}],
    position_parm = 4
    };
getRow(9,1)->
    #home_areaCfg {
    id = 9,
    type = 3,
    level = 1,
    name = "农田C",
    homelevel = 5,
    materials = [],
    coin_cost = [],
    area_position = [{341,250},{341,262},{349,250},{349,262},{357,251},{357,262}],
    position_parm = 4
    };
getRow(_,_)->[].

getKeyList()->[
    {1,1},
    {1,2},
    {1,3},
    {3,1},
    {3,2},
    {3,3},
    {4,1},
    {8,0},
    {8,1},
    {9,0},
    {9,1}
    ].

get1KeyList()->[
    1,
    3,
    4,
    8,
    9
    ].

get2KeyList(1)->[
    1,
    2,
    3
    ];
get2KeyList(3)->[
    1,
    2,
    3
    ];
get2KeyList(4)->[
    1
    ];
get2KeyList(8)->[
    0,
    1
    ];
get2KeyList(9)->[
    0,
    1
    ];
get2KeyList(_)->[].

