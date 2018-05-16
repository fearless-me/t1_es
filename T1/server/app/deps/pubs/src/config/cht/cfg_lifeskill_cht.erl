%% coding: latin-1
%%: 实现
-module(cfg_lifeskill_cht).
-compile(export_all).
-include("cfg_lifeskill.hrl").
-include("logger.hrl").

getRow(1,1)->
    #lifeskillCfg {
    skill_type = 1,
    skill_level = 1,
    skill_desc = "1级钓鱼",
    skill_exp = 7000,
    buy_times = [{40,100,50000,24202}],
    buy_limit = 9999,
    buff = 63031,
    cd = 10,
    product = [1,2,3],
    rate = 5000
    };
getRow(1,2)->
    #lifeskillCfg {
    skill_type = 1,
    skill_level = 2,
    skill_desc = "2级钓鱼",
    skill_exp = 18000,
    buy_times = [{40,100,50000,24202}],
    buy_limit = 9999,
    buff = 63031,
    cd = 10,
    product = [4,5,6],
    rate = 5000
    };
getRow(1,3)->
    #lifeskillCfg {
    skill_type = 1,
    skill_level = 3,
    skill_desc = "3级钓鱼",
    skill_exp = 40000,
    buy_times = [{40,100,50000,24202}],
    buy_limit = 9999,
    buff = 63031,
    cd = 10,
    product = [7,8,9],
    rate = 5000
    };
getRow(1,4)->
    #lifeskillCfg {
    skill_type = 1,
    skill_level = 4,
    skill_desc = "4级钓鱼",
    skill_exp = 70000,
    buy_times = [{40,100,50000,24202}],
    buy_limit = 9999,
    buff = 63031,
    cd = 10,
    product = [10,11,12],
    rate = 5000
    };
getRow(1,5)->
    #lifeskillCfg {
    skill_type = 1,
    skill_level = 5,
    skill_desc = "5级钓鱼",
    skill_exp = 170000,
    buy_times = [{40,100,50000,24202}],
    buy_limit = 9999,
    buff = 63031,
    cd = 10,
    product = [13,14],
    rate = 5000
    };
getRow(1,6)->
    #lifeskillCfg {
    skill_type = 1,
    skill_level = 6,
    skill_desc = "6级钓鱼",
    skill_exp = 0,
    buy_times = [{40,100,50000,24202}],
    buy_limit = 9999,
    buff = 63031,
    cd = 10,
    product = [212,213,214],
    rate = 5000
    };
getRow(2,1)->
    #lifeskillCfg {
    skill_type = 2,
    skill_level = 1,
    skill_desc = "1级狩猎",
    skill_exp = 7000,
    buy_times = [{40,100,50000,24205}],
    buy_limit = 9999,
    buff = 63032,
    cd = 3,
    product = [15,16,17],
    rate = 10000
    };
getRow(2,2)->
    #lifeskillCfg {
    skill_type = 2,
    skill_level = 2,
    skill_desc = "2级狩猎",
    skill_exp = 18000,
    buy_times = [{40,100,50000,24205}],
    buy_limit = 9999,
    buff = 63032,
    cd = 3,
    product = [18,19,20,21],
    rate = 10000
    };
getRow(2,3)->
    #lifeskillCfg {
    skill_type = 2,
    skill_level = 3,
    skill_desc = "3级狩猎",
    skill_exp = 40000,
    buy_times = [{40,100,50000,24205}],
    buy_limit = 9999,
    buff = 63032,
    cd = 3,
    product = [22,23,24,25,26],
    rate = 10000
    };
getRow(2,4)->
    #lifeskillCfg {
    skill_type = 2,
    skill_level = 4,
    skill_desc = "4级狩猎",
    skill_exp = 70000,
    buy_times = [{40,100,50000,24205}],
    buy_limit = 9999,
    buff = 63032,
    cd = 3,
    product = [27,28,29,30,31,32,33],
    rate = 10000
    };
getRow(2,5)->
    #lifeskillCfg {
    skill_type = 2,
    skill_level = 5,
    skill_desc = "5级狩猎",
    skill_exp = 170000,
    buy_times = [{40,100,50000,24205}],
    buy_limit = 9999,
    buff = 63032,
    cd = 3,
    product = [34,35,36,37,38,39],
    rate = 10000
    };
getRow(2,6)->
    #lifeskillCfg {
    skill_type = 2,
    skill_level = 6,
    skill_desc = "6级狩猎",
    skill_exp = 0,
    buy_times = [{40,100,50000,24205}],
    buy_limit = 9999,
    buff = 63032,
    cd = 3,
    product = [215,216,217],
    rate = 10000
    };
getRow(3,1)->
    #lifeskillCfg {
    skill_type = 3,
    skill_level = 1,
    skill_desc = "1级采矿",
    skill_exp = 7000,
    buy_times = [{40,100,50000,24208}],
    buy_limit = 9999,
    buff = 63033,
    cd = 10,
    product = [40,41,42],
    rate = 5000
    };
getRow(3,2)->
    #lifeskillCfg {
    skill_type = 3,
    skill_level = 2,
    skill_desc = "2级采矿",
    skill_exp = 18000,
    buy_times = [{40,100,50000,24208}],
    buy_limit = 9999,
    buff = 63033,
    cd = 10,
    product = [43,44,45,46],
    rate = 5000
    };
getRow(3,3)->
    #lifeskillCfg {
    skill_type = 3,
    skill_level = 3,
    skill_desc = "3级采矿",
    skill_exp = 40000,
    buy_times = [{40,100,50000,24208}],
    buy_limit = 9999,
    buff = 63033,
    cd = 10,
    product = [47,48,49],
    rate = 5000
    };
getRow(3,4)->
    #lifeskillCfg {
    skill_type = 3,
    skill_level = 4,
    skill_desc = "4级采矿",
    skill_exp = 70000,
    buy_times = [{40,100,50000,24208}],
    buy_limit = 9999,
    buff = 63033,
    cd = 10,
    product = [50,51,52],
    rate = 5000
    };
getRow(3,5)->
    #lifeskillCfg {
    skill_type = 3,
    skill_level = 5,
    skill_desc = "5级采矿",
    skill_exp = 170000,
    buy_times = [{40,100,50000,24208}],
    buy_limit = 9999,
    buff = 63033,
    cd = 10,
    product = [53,54,55],
    rate = 5000
    };
getRow(3,6)->
    #lifeskillCfg {
    skill_type = 3,
    skill_level = 6,
    skill_desc = "6级采矿",
    skill_exp = 0,
    buy_times = [{40,100,50000,24208}],
    buy_limit = 9999,
    buff = 63033,
    cd = 10,
    product = [218,219,220],
    rate = 5000
    };
getRow(4,1)->
    #lifeskillCfg {
    skill_type = 4,
    skill_level = 1,
    skill_desc = "1级烹饪",
    skill_exp = 7000,
    buy_limit = 9999,
    buff = 63034,
    cd = 3,
    product = [56,57,58,62],
    rate = 10000
    };
getRow(4,2)->
    #lifeskillCfg {
    skill_type = 4,
    skill_level = 2,
    skill_desc = "2级烹饪",
    skill_exp = 18000,
    buy_limit = 9999,
    buff = 63034,
    cd = 3,
    product = [59,60,61,163],
    rate = 10000
    };
getRow(4,3)->
    #lifeskillCfg {
    skill_type = 4,
    skill_level = 3,
    skill_desc = "3级烹饪",
    skill_exp = 40000,
    buy_limit = 9999,
    buff = 63034,
    cd = 3,
    product = [63,64,65,66],
    rate = 10000
    };
getRow(4,4)->
    #lifeskillCfg {
    skill_type = 4,
    skill_level = 4,
    skill_desc = "4级烹饪",
    skill_exp = 70000,
    buy_limit = 9999,
    buff = 63034,
    cd = 3,
    product = [67,68,69,164],
    rate = 10000
    };
getRow(4,5)->
    #lifeskillCfg {
    skill_type = 4,
    skill_level = 5,
    skill_desc = "5级烹饪",
    skill_exp = 170000,
    buy_limit = 9999,
    buff = 63034,
    cd = 3,
    product = [70,71,72,73],
    rate = 10000
    };
getRow(4,6)->
    #lifeskillCfg {
    skill_type = 4,
    skill_level = 6,
    skill_desc = "6级烹饪",
    skill_exp = 0,
    buy_limit = 9999,
    buff = 63034,
    cd = 3,
    product = [221,222,223,224],
    rate = 10000
    };
getRow(5,1)->
    #lifeskillCfg {
    skill_type = 5,
    skill_level = 1,
    skill_desc = "1级装修",
    skill_exp = 7000,
    buy_limit = 9999,
    buff = 63035,
    cd = 3,
    product = [94,95,96,117,145,78,87,91,92,93,75,101,136,138],
    rate = 10000
    };
getRow(5,2)->
    #lifeskillCfg {
    skill_type = 5,
    skill_level = 2,
    skill_desc = "2级装修",
    skill_exp = 18000,
    buy_limit = 9999,
    buff = 63035,
    cd = 3,
    product = [76,77,88,89,118,119,120,121,122,124,137,139,161],
    rate = 10000
    };
getRow(5,3)->
    #lifeskillCfg {
    skill_type = 5,
    skill_level = 3,
    skill_desc = "3级装修",
    skill_exp = 40000,
    buy_limit = 9999,
    buff = 63035,
    cd = 3,
    product = [80,82,83,84,97,98,99,100,104,105,107,113,114,115,116,123,140,141,142,160],
    rate = 10000
    };
getRow(5,4)->
    #lifeskillCfg {
    skill_type = 5,
    skill_level = 4,
    skill_desc = "4级装修",
    skill_exp = 70000,
    buy_limit = 9999,
    buff = 63035,
    cd = 3,
    product = [85,86,102,103,109,125,126,127,143,144,151,152,155,157,159,162],
    rate = 10000
    };
getRow(5,5)->
    #lifeskillCfg {
    skill_type = 5,
    skill_level = 5,
    skill_desc = "5级装修",
    skill_exp = 170000,
    buy_limit = 9999,
    buff = 63035,
    cd = 3,
    product = [79,81,106,108,128,129,130,131,132,133,134,135,150,153,154,156,158,147],
    rate = 10000
    };
getRow(5,6)->
    #lifeskillCfg {
    skill_type = 5,
    skill_level = 6,
    skill_desc = "6级装修",
    skill_exp = 0,
    buy_limit = 9999,
    buff = 63035,
    cd = 3,
    product = [165,166,167,168,169],
    rate = 10000
    };
getRow(_,_)->[].

getKeyList()->[
    {1,1},
    {1,2},
    {1,3},
    {1,4},
    {1,5},
    {1,6},
    {2,1},
    {2,2},
    {2,3},
    {2,4},
    {2,5},
    {2,6},
    {3,1},
    {3,2},
    {3,3},
    {3,4},
    {3,5},
    {3,6},
    {4,1},
    {4,2},
    {4,3},
    {4,4},
    {4,5},
    {4,6},
    {5,1},
    {5,2},
    {5,3},
    {5,4},
    {5,5},
    {5,6}
    ].

get1KeyList()->[
    1,
    2,
    3,
    4,
    5
    ].

get2KeyList(1)->[
    1,
    2,
    3,
    4,
    5,
    6
    ];
get2KeyList(2)->[
    1,
    2,
    3,
    4,
    5,
    6
    ];
get2KeyList(3)->[
    1,
    2,
    3,
    4,
    5,
    6
    ];
get2KeyList(4)->[
    1,
    2,
    3,
    4,
    5,
    6
    ];
get2KeyList(5)->[
    1,
    2,
    3,
    4,
    5,
    6
    ];
get2KeyList(_)->[].

