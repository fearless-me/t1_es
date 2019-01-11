%% coding: latin-1
%%: 实现
-module(cfg_home_level_chs).
-compile(export_all).
-include("cfg_home_level.hrl").
-include("logger.hrl").

getRow(1)->
    #home_levelCfg {
    id = 1,
    name = "1级家园",
    stylish = 0,
    comfort = 0,
    cost_coin = [{100,0}],
    cost_item1 = [{1,24300,240},{2,24402,240},{3,24500,240}],
    build_cd = 600,
    area = [6,4],
    stylish_limit = 14000
    };
getRow(2)->
    #home_levelCfg {
    id = 2,
    name = "2级家园",
    stylish = 0,
    comfort = 0,
    cost_coin = [{100,0}],
    cost_item1 = [{1,24303,180},{2,24403,180},{3,24503,180}],
    build_cd = 600,
    area = [7,4],
    stylish_limit = 14000
    };
getRow(3)->
    #home_levelCfg {
    id = 3,
    name = "3级家园",
    stylish = 0,
    comfort = 0,
    cost_coin = [{100,0}],
    cost_item1 = [{1,24306,240},{2,24407,240},{3,24507,240}],
    build_cd = 600,
    area = [8,4],
    stylish_limit = 14000
    };
getRow(4)->
    #home_levelCfg {
    id = 4,
    name = "4级家园",
    stylish = 0,
    comfort = 0,
    cost_coin = [{100,0}],
    cost_item1 = [{1,24309,210},{2,24412,210},{3,24510,210}],
    build_cd = 600,
    area = [9,4],
    stylish_limit = 14000
    };
getRow(5)->
    #home_levelCfg {
    id = 5,
    name = "5级家园",
    stylish = 0,
    comfort = 0,
    cost_coin = [{100,0}],
    cost_item1 = [{1,24312,255},{2,24419,255},{3,24513,255}],
    build_cd = 600,
    area = [10,4],
    stylish_limit = 14000
    };
getRow(6)->
    #home_levelCfg {
    id = 6,
    name = "6级家园",
    stylish = 0,
    comfort = 0,
    cost_coin = [{100,0}],
    cost_item1 = [{1,24316,248},{2,24425,248},{3,24517,248}],
    build_cd = 600,
    area = [11,4],
    stylish_limit = 14000
    };
getRow(7)->
    #home_levelCfg {
    id = 7,
    name = "7级家园",
    stylish = 0,
    comfort = 0,
    cost_coin = [{100,0}],
    cost_item1 = [],
    build_cd = 600,
    area = [12,4],
    stylish_limit = 14000
    };
getRow(_)->[].

getKeyList()->[
    {1},
    {2},
    {3},
    {4},
    {5},
    {6},
    {7}
    ].

get1KeyList()->[
    1,
    2,
    3,
    4,
    5,
    6,
    7
    ].

