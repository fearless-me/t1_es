%% coding: latin-1
%%: 实现
-module(cfg_starmoonbox_chs).
-compile(export_all).
-include("cfg_starmoonbox.hrl").
-include("logger.hrl").

getRow(1)->
    #starmoonboxCfg {
    id = 1,
    jackpot = 1,
    item = 15051
    };
getRow(2)->
    #starmoonboxCfg {
    id = 2,
    jackpot = 1,
    item = 15053
    };
getRow(3)->
    #starmoonboxCfg {
    id = 3,
    jackpot = 1,
    item = 14027
    };
getRow(4)->
    #starmoonboxCfg {
    id = 4,
    jackpot = 1,
    item = 14138
    };
getRow(5)->
    #starmoonboxCfg {
    id = 5,
    jackpot = 1,
    item = 14171
    };
getRow(6)->
    #starmoonboxCfg {
    id = 6,
    jackpot = 2,
    item = 15030
    };
getRow(7)->
    #starmoonboxCfg {
    id = 7,
    jackpot = 2,
    item = 15032
    };
getRow(8)->
    #starmoonboxCfg {
    id = 8,
    jackpot = 2,
    item = 15037
    };
getRow(9)->
    #starmoonboxCfg {
    id = 9,
    jackpot = 2,
    item = 15039
    };
getRow(10)->
    #starmoonboxCfg {
    id = 10,
    jackpot = 3,
    item = 904
    };
getRow(11)->
    #starmoonboxCfg {
    id = 11,
    jackpot = 3,
    item = 4203
    };
getRow(12)->
    #starmoonboxCfg {
    id = 12,
    jackpot = 3,
    item = 204
    };
getRow(13)->
    #starmoonboxCfg {
    id = 13,
    jackpot = 3,
    item = 29006
    };
getRow(14)->
    #starmoonboxCfg {
    id = 14,
    jackpot = 3,
    item = 230
    };
getRow(15)->
    #starmoonboxCfg {
    id = 15,
    jackpot = 3,
    item = 11000
    };
getRow(16)->
    #starmoonboxCfg {
    id = 16,
    jackpot = 4,
    item = 903
    };
getRow(17)->
    #starmoonboxCfg {
    id = 17,
    jackpot = 4,
    item = 1801
    };
getRow(18)->
    #starmoonboxCfg {
    id = 18,
    jackpot = 4,
    item = 6000
    };
getRow(19)->
    #starmoonboxCfg {
    id = 19,
    jackpot = 4,
    item = 4100
    };
getRow(20)->
    #starmoonboxCfg {
    id = 20,
    jackpot = 4,
    item = 4101
    };
getRow(21)->
    #starmoonboxCfg {
    id = 21,
    jackpot = 4,
    item = 606
    };
getRow(22)->
    #starmoonboxCfg {
    id = 22,
    jackpot = 4,
    item = 221
    };
getRow(23)->
    #starmoonboxCfg {
    id = 23,
    jackpot = 4,
    item = 2160
    };
getRow(24)->
    #starmoonboxCfg {
    id = 24,
    jackpot = 4,
    item = 202
    };
getRow(25)->
    #starmoonboxCfg {
    id = 25,
    jackpot = 4,
    item = 11000
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
    {22},
    {23},
    {24},
    {25}
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
    22,
    23,
    24,
    25
    ].

