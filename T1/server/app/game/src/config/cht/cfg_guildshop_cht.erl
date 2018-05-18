%% coding: latin-1
%%: 实现
-module(cfg_guildshop_cht).
-compile(export_all).
-include("cfg_guildshop.hrl").


getRow(1)->
    #guildshopCfg {
    id = 1,
    itemID = 25200,
    cost = 90000,
    needLevel = 2
    };
getRow(2)->
    #guildshopCfg {
    id = 2,
    itemID = 1965,
    cost = 2000,
    needLevel = 2
    };
getRow(3)->
    #guildshopCfg {
    id = 3,
    itemID = 1971,
    cost = 6000,
    needLevel = 6
    };
getRow(4)->
    #guildshopCfg {
    id = 4,
    itemID = 14065,
    cost = 75000,
    needLevel = 1
    };
getRow(5)->
    #guildshopCfg {
    id = 5,
    itemID = 14066,
    cost = 75000,
    needLevel = 1
    };
getRow(6)->
    #guildshopCfg {
    id = 6,
    itemID = 14067,
    cost = 75000,
    needLevel = 2
    };
getRow(7)->
    #guildshopCfg {
    id = 7,
    itemID = 14068,
    cost = 75000,
    needLevel = 2
    };
getRow(8)->
    #guildshopCfg {
    id = 8,
    itemID = 14069,
    cost = 75000,
    needLevel = 3
    };
getRow(9)->
    #guildshopCfg {
    id = 9,
    itemID = 270,
    cost = 2400,
    needLevel = 2
    };
getRow(10)->
    #guildshopCfg {
    id = 10,
    itemID = 271,
    cost = 4600,
    needLevel = 3
    };
getRow(11)->
    #guildshopCfg {
    id = 11,
    itemID = 272,
    cost = 9100,
    needLevel = 4
    };
getRow(12)->
    #guildshopCfg {
    id = 12,
    itemID = 225,
    cost = 5300,
    needLevel = 1
    };
getRow(13)->
    #guildshopCfg {
    id = 13,
    itemID = 2002,
    cost = 1,
    needLevel = 1
    };
getRow(14)->
    #guildshopCfg {
    id = 14,
    itemID = 251,
    cost = 1000,
    needLevel = 2
    };
getRow(15)->
    #guildshopCfg {
    id = 15,
    itemID = 252,
    cost = 1000,
    needLevel = 2
    };
getRow(16)->
    #guildshopCfg {
    id = 16,
    itemID = 253,
    cost = 3000,
    needLevel = 3
    };
getRow(17)->
    #guildshopCfg {
    id = 17,
    itemID = 254,
    cost = 3000,
    needLevel = 3
    };
getRow(18)->
    #guildshopCfg {
    id = 18,
    itemID = 255,
    cost = 9000,
    needLevel = 4
    };
getRow(19)->
    #guildshopCfg {
    id = 19,
    itemID = 256,
    cost = 9000,
    needLevel = 4
    };
getRow(20)->
    #guildshopCfg {
    id = 20,
    itemID = 11000,
    cost = 1600,
    needLevel = 1
    };
getRow(21)->
    #guildshopCfg {
    id = 21,
    itemID = 11001,
    cost = 4800,
    needLevel = 2
    };
getRow(22)->
    #guildshopCfg {
    id = 22,
    itemID = 11002,
    cost = 14400,
    needLevel = 3
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
    {18},
    {19},
    {20},
    {21},
    {22}
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
    18,
    19,
    20,
    21,
    22
    ].

