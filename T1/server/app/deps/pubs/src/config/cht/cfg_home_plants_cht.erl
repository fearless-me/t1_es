%% coding: latin-1
%%: 实现
-module(cfg_home_plants_cht).
-compile(export_all).
-include("cfg_home_plants.hrl").
-include("logger.hrl").

getRow(1)->
    #home_plantsCfg {
    id = 1,
    name = "马铃薯种子",
    level = 1,
    buy_type = 100,
    price = 1000,
    growtime = [180,180,-1],
    result = [{24050,10}],
    bonus = [],
    pestis = [60,180,2,5],
    health = [80,100],
    seed_model = "sc_336_plant_0_1a",
    growing_model = "sc_336_plant_0_2a",
    final_model = "sc_336_plant_1",
    droop_model = "sc_336_plant_0_3a"
    };
getRow(2)->
    #home_plantsCfg {
    id = 2,
    name = "小麦种子",
    level = 1,
    buy_type = 100,
    price = 1000,
    growtime = [180,180,-1],
    result = [{24051,10}],
    bonus = [],
    pestis = [60,180,2,5],
    health = [80,100],
    seed_model = "sc_336_plant_0_1a",
    growing_model = "sc_336_plant_0_2a",
    final_model = "sc_336_plant_2",
    droop_model = "sc_336_plant_0_3a"
    };
getRow(3)->
    #home_plantsCfg {
    id = 3,
    name = "银杏种子",
    level = 1,
    buy_type = 100,
    price = 1000,
    growtime = [180,180,-1],
    result = [{24052,10}],
    bonus = [],
    pestis = [60,180,2,5],
    health = [80,100],
    seed_model = "sc_336_plant_0_1b",
    growing_model = "sc_336_plant_0_2b",
    final_model = "sc_336_plant_3",
    droop_model = "sc_336_plant_0_3b"
    };
getRow(4)->
    #home_plantsCfg {
    id = 4,
    name = "大白菜种子",
    level = 2,
    buy_type = 100,
    price = 2000,
    growtime = [180,180,-1],
    result = [{24053,6}],
    bonus = [],
    pestis = [60,180,2,5],
    health = [80,100],
    seed_model = "sc_336_plant_0_1a",
    growing_model = "sc_336_plant_0_2a",
    final_model = "sc_336_plant_4",
    droop_model = "sc_336_plant_0_3a"
    };
getRow(5)->
    #home_plantsCfg {
    id = 5,
    name = "番茄种子",
    level = 2,
    buy_type = 100,
    price = 2000,
    growtime = [180,180,-1],
    result = [{24054,6}],
    bonus = [],
    pestis = [60,180,2,5],
    health = [80,100],
    seed_model = "sc_336_plant_0_1a",
    growing_model = "sc_336_plant_0_2a",
    final_model = "sc_336_plant_5",
    droop_model = "sc_336_plant_0_3a"
    };
getRow(6)->
    #home_plantsCfg {
    id = 6,
    name = "楠木种子",
    level = 2,
    buy_type = 100,
    price = 2000,
    growtime = [180,180,-1],
    result = [{24055,6}],
    bonus = [],
    pestis = [60,180,2,5],
    health = [80,100],
    seed_model = "sc_336_plant_0_1b",
    growing_model = "sc_336_plant_0_2b",
    final_model = "sc_336_plant_6",
    droop_model = "sc_336_plant_0_3b"
    };
getRow(7)->
    #home_plantsCfg {
    id = 7,
    name = "洋葱种子",
    level = 3,
    buy_type = 100,
    price = 5000,
    growtime = [180,180,-1],
    result = [{24056,5}],
    bonus = [],
    pestis = [60,180,2,5],
    health = [80,100],
    seed_model = "sc_336_plant_0_1a",
    growing_model = "sc_336_plant_0_2a",
    final_model = "sc_336_plant_7",
    droop_model = "sc_336_plant_0_3a"
    };
getRow(8)->
    #home_plantsCfg {
    id = 8,
    name = "辣椒种子",
    level = 3,
    buy_type = 100,
    price = 5000,
    growtime = [180,180,-1],
    result = [{24057,5}],
    bonus = [],
    pestis = [60,180,2,5],
    health = [80,100],
    seed_model = "sc_336_plant_0_1a",
    growing_model = "sc_336_plant_0_2a",
    final_model = "sc_336_plant_8",
    droop_model = "sc_336_plant_0_3a"
    };
getRow(9)->
    #home_plantsCfg {
    id = 9,
    name = "杉树种子",
    level = 3,
    buy_type = 100,
    price = 5000,
    growtime = [180,180,-1],
    result = [{24058,5}],
    bonus = [],
    pestis = [60,180,2,5],
    health = [80,100],
    seed_model = "sc_336_plant_0_1b",
    growing_model = "sc_336_plant_0_2b",
    final_model = "sc_336_plant_9",
    droop_model = "sc_336_plant_0_3b"
    };
getRow(10)->
    #home_plantsCfg {
    id = 10,
    name = "甘蔗种子",
    level = 4,
    buy_type = 100,
    price = 15000,
    growtime = [180,180,-1],
    result = [{24059,5}],
    bonus = [],
    pestis = [60,180,2,5],
    health = [80,100],
    seed_model = "sc_336_plant_0_1a",
    growing_model = "sc_336_plant_0_2a",
    final_model = "sc_336_plant_10",
    droop_model = "sc_336_plant_0_3a"
    };
getRow(11)->
    #home_plantsCfg {
    id = 11,
    name = "豆芽种子",
    level = 4,
    buy_type = 100,
    price = 15000,
    growtime = [180,180,-1],
    result = [{24060,5}],
    bonus = [],
    pestis = [60,180,2,5],
    health = [80,100],
    seed_model = "sc_336_plant_0_1a",
    growing_model = "sc_336_plant_0_2a",
    final_model = "sc_336_plant_11",
    droop_model = "sc_336_plant_0_3a"
    };
getRow(12)->
    #home_plantsCfg {
    id = 12,
    name = "柏木种子",
    level = 4,
    buy_type = 100,
    price = 15000,
    growtime = [180,180,-1],
    result = [{24061,5}],
    bonus = [],
    pestis = [60,180,2,5],
    health = [80,100],
    seed_model = "sc_336_plant_0_1b",
    growing_model = "sc_336_plant_0_2b",
    final_model = "sc_336_plant_12",
    droop_model = "sc_336_plant_0_3b"
    };
getRow(13)->
    #home_plantsCfg {
    id = 13,
    name = "萝卜种子",
    level = 5,
    buy_type = 100,
    price = 30000,
    growtime = [180,180,-1],
    result = [{24062,5}],
    bonus = [],
    pestis = [60,180,2,5],
    health = [80,100],
    seed_model = "sc_336_plant_0_1a",
    growing_model = "sc_336_plant_0_2a",
    final_model = "sc_336_plant_13",
    droop_model = "sc_336_plant_0_3a"
    };
getRow(14)->
    #home_plantsCfg {
    id = 14,
    name = "玉米种子",
    level = 5,
    buy_type = 100,
    price = 30000,
    growtime = [180,180,-1],
    result = [{24063,5}],
    bonus = [],
    pestis = [60,180,2,5],
    health = [80,100],
    seed_model = "sc_336_plant_0_1a",
    growing_model = "sc_336_plant_0_2a",
    final_model = "sc_336_plant_14",
    droop_model = "sc_336_plant_0_3a"
    };
getRow(15)->
    #home_plantsCfg {
    id = 15,
    name = "青松种子",
    level = 5,
    buy_type = 100,
    price = 30000,
    growtime = [180,180,-1],
    result = [{24064,5}],
    bonus = [],
    pestis = [60,180,2,5],
    health = [80,100],
    seed_model = "sc_336_plant_0_1b",
    growing_model = "sc_336_plant_0_2b",
    final_model = "sc_336_plant_15",
    droop_model = "sc_336_plant_0_3b"
    };
getRow(16)->
    #home_plantsCfg {
    id = 16,
    name = "南瓜种子",
    level = 6,
    buy_type = 100,
    price = 60000,
    growtime = [180,180,-1],
    result = [{24067,5}],
    bonus = [],
    pestis = [60,180,2,5],
    health = [80,100],
    seed_model = "sc_336_plant_0_1b",
    growing_model = "sc_336_plant_0_2b",
    final_model = "sc_336_plant_15",
    droop_model = "sc_336_plant_0_3b"
    };
getRow(17)->
    #home_plantsCfg {
    id = 17,
    name = "茄子种子",
    level = 6,
    buy_type = 100,
    price = 60000,
    growtime = [180,180,-1],
    result = [{24068,5}],
    bonus = [],
    pestis = [60,180,2,5],
    health = [80,100],
    seed_model = "sc_336_plant_0_1b",
    growing_model = "sc_336_plant_0_2b",
    final_model = "sc_336_plant_15",
    droop_model = "sc_336_plant_0_3b"
    };
getRow(18)->
    #home_plantsCfg {
    id = 18,
    name = "枫树种子",
    level = 6,
    buy_type = 100,
    price = 60000,
    growtime = [180,180,-1],
    result = [{24069,5}],
    bonus = [],
    pestis = [60,180,2,5],
    health = [80,100],
    seed_model = "sc_336_plant_0_1b",
    growing_model = "sc_336_plant_0_2b",
    final_model = "sc_336_plant_15",
    droop_model = "sc_336_plant_0_3b"
    };
getRow(_)->[].

getKeyList()->[
    {1},
    {2},
    {3},
    {4},
    {5},
    {6},
    {7},
    {8},
    {9},
    {10},
    {11},
    {12},
    {13},
    {14},
    {15},
    {16},
    {17},
    {18}
    ].

get1KeyList()->[
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9,
    10,
    11,
    12,
    13,
    14,
    15,
    16,
    17,
    18
    ].

