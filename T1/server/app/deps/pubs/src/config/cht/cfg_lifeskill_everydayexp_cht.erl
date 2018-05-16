%% coding: latin-1
%%: 实现
-module(cfg_lifeskill_everydayexp_cht).
-compile(export_all).
-include("cfg_lifeskill_everydayexp.hrl").
-include("logger.hrl").

getRow(1)->
    #lifeskill_everydayexpCfg {
    level_sum = 1,
    everydayexp_up = 1500
    };
getRow(2)->
    #lifeskill_everydayexpCfg {
    level_sum = 2,
    everydayexp_up = 1500
    };
getRow(3)->
    #lifeskill_everydayexpCfg {
    level_sum = 3,
    everydayexp_up = 1500
    };
getRow(4)->
    #lifeskill_everydayexpCfg {
    level_sum = 4,
    everydayexp_up = 1500
    };
getRow(5)->
    #lifeskill_everydayexpCfg {
    level_sum = 5,
    everydayexp_up = 1500
    };
getRow(6)->
    #lifeskill_everydayexpCfg {
    level_sum = 6,
    everydayexp_up = 2250
    };
getRow(7)->
    #lifeskill_everydayexpCfg {
    level_sum = 7,
    everydayexp_up = 3000
    };
getRow(8)->
    #lifeskill_everydayexpCfg {
    level_sum = 8,
    everydayexp_up = 3750
    };
getRow(9)->
    #lifeskill_everydayexpCfg {
    level_sum = 9,
    everydayexp_up = 4500
    };
getRow(10)->
    #lifeskill_everydayexpCfg {
    level_sum = 10,
    everydayexp_up = 5250
    };
getRow(11)->
    #lifeskill_everydayexpCfg {
    level_sum = 11,
    everydayexp_up = 6000
    };
getRow(12)->
    #lifeskill_everydayexpCfg {
    level_sum = 12,
    everydayexp_up = 6750
    };
getRow(13)->
    #lifeskill_everydayexpCfg {
    level_sum = 13,
    everydayexp_up = 7500
    };
getRow(14)->
    #lifeskill_everydayexpCfg {
    level_sum = 14,
    everydayexp_up = 8250
    };
getRow(15)->
    #lifeskill_everydayexpCfg {
    level_sum = 15,
    everydayexp_up = 9000
    };
getRow(16)->
    #lifeskill_everydayexpCfg {
    level_sum = 16,
    everydayexp_up = 9750
    };
getRow(17)->
    #lifeskill_everydayexpCfg {
    level_sum = 17,
    everydayexp_up = 10500
    };
getRow(18)->
    #lifeskill_everydayexpCfg {
    level_sum = 18,
    everydayexp_up = 11250
    };
getRow(19)->
    #lifeskill_everydayexpCfg {
    level_sum = 19,
    everydayexp_up = 12000
    };
getRow(20)->
    #lifeskill_everydayexpCfg {
    level_sum = 20,
    everydayexp_up = 12750
    };
getRow(21)->
    #lifeskill_everydayexpCfg {
    level_sum = 21,
    everydayexp_up = 13500
    };
getRow(22)->
    #lifeskill_everydayexpCfg {
    level_sum = 22,
    everydayexp_up = 14250
    };
getRow(23)->
    #lifeskill_everydayexpCfg {
    level_sum = 23,
    everydayexp_up = 15000
    };
getRow(24)->
    #lifeskill_everydayexpCfg {
    level_sum = 24,
    everydayexp_up = 15750
    };
getRow(25)->
    #lifeskill_everydayexpCfg {
    level_sum = 25,
    everydayexp_up = 16500
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

