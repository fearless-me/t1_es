%% coding: latin-1
%%: 实现
-module(cfg_home_level_cht).
-compile(export_all).
-include("cfg_home_level.hrl").
-include("logger.hrl").

getRow(1)->
    #home_levelCfg {
    id = 1,
    name = "1级家园",
    stylish = 0,
    comfort = 0,
    cost_coin = [{1,0}],
    cost_item1 = [{1,24300,240},{2,24402,240},{3,24500,240}],
    build_cd = 600,
    area = [6,4],
    stylish_limit = 10000
    };
getRow(2)->
    #home_levelCfg {
    id = 2,
    name = "2级家园",
    stylish = 0,
    comfort = 0,
    cost_coin = [{1,0}],
    cost_item1 = [{1,24303,120},{2,24403,120},{3,24503,120}],
    build_cd = 600,
    area = [7,4],
    stylish_limit = 10000
    };
getRow(3)->
    #home_levelCfg {
    id = 3,
    name = "3级家园",
    stylish = 0,
    comfort = 0,
    cost_coin = [{1,0}],
    cost_item1 = [{1,24306,80},{2,24406,80},{3,24507,80}],
    build_cd = 600,
    area = [8,4],
    stylish_limit = 10000
    };
getRow(4)->
    #home_levelCfg {
    id = 4,
    name = "4级家园",
    stylish = 0,
    comfort = 0,
    cost_coin = [{1,0}],
    cost_item1 = [{1,24309,60},{2,24412,60},{3,24510,60}],
    build_cd = 600,
    area = [9,4],
    stylish_limit = 10000
    };
getRow(5)->
    #home_levelCfg {
    id = 5,
    name = "5级家园",
    stylish = 0,
    comfort = 0,
    cost_coin = [{1,0}],
    cost_item1 = [{1,24312,48},{2,24419,48},{3,24513,48}],
    build_cd = 600,
    area = [10,4],
    stylish_limit = 10000
    };
getRow(6)->
    #home_levelCfg {
    id = 6,
    name = "5级家园",
    stylish = 0,
    comfort = 0,
    cost_coin = [{1,0}],
    cost_item1 = [{1,24312,48},{2,24419,48},{3,24513,48}],
    build_cd = 600,
    area = [11,4],
    stylish_limit = 10000
    };
getRow(_)->[].

getKeyList()->[
    {1},
    {2},
    {3},
    {4},
    {5},
    {6}
    ].

get1KeyList()->[
    1,
    2,
    3,
    4,
    5,
    6
    ].

