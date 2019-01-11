%% coding: latin-1
%%: 实现
-module(cfg_guildshop_chs).
-compile(export_all).
-include("cfg_guildshop.hrl").
-include("logger.hrl").

getRow(1)->
    #guildshopCfg {
    id = 1,
    itemID = 25200,
    cost = 60000,
    needLevel = 1
    };
getRow(2)->
    #guildshopCfg {
    id = 2,
    itemID = 25201,
    cost = 60000,
    needLevel = 3
    };
getRow(3)->
    #guildshopCfg {
    id = 3,
    itemID = 1924,
    cost = 600,
    needLevel = 1
    };
getRow(4)->
    #guildshopCfg {
    id = 4,
    itemID = 1933,
    cost = 1000,
    needLevel = 1
    };
getRow(5)->
    #guildshopCfg {
    id = 5,
    itemID = 1965,
    cost = 1600,
    needLevel = 2
    };
getRow(6)->
    #guildshopCfg {
    id = 6,
    itemID = 270,
    cost = 1500,
    needLevel = 2
    };
getRow(7)->
    #guildshopCfg {
    id = 7,
    itemID = 271,
    cost = 2700,
    needLevel = 3
    };
getRow(8)->
    #guildshopCfg {
    id = 8,
    itemID = 272,
    cost = 5400,
    needLevel = 4
    };
getRow(9)->
    #guildshopCfg {
    id = 9,
    itemID = 225,
    cost = 3400,
    needLevel = 1
    };
getRow(10)->
    #guildshopCfg {
    id = 10,
    itemID = 2002,
    cost = 5,
    needLevel = 1
    };
getRow(11)->
    #guildshopCfg {
    id = 11,
    itemID = 11000,
    cost = 1200,
    needLevel = 1
    };
getRow(12)->
    #guildshopCfg {
    id = 12,
    itemID = 11001,
    cost = 3600,
    needLevel = 2
    };
getRow(13)->
    #guildshopCfg {
    id = 13,
    itemID = 11002,
    cost = 10800,
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
    {13}
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
    13
    ].

