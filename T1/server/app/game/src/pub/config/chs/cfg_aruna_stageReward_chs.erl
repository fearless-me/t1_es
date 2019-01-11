%% coding: latin-1
%%: 实现
-module(cfg_aruna_stageReward_chs).
-compile(export_all).
-include("cfg_aruna_stageReward.hrl").
-include("logger.hrl").

getRow(1)->
    #aruna_stageRewardCfg {
    id = 1,
    worldid = 1,
    rank = [1],
    reward_rank = 500,
    reward_Currency = 1500,
    reward_item = [{273,1},{1801,4}]
    };
getRow(2)->
    #aruna_stageRewardCfg {
    id = 2,
    worldid = 1,
    rank = [2,5],
    reward_rank = 400,
    reward_Currency = 1200,
    reward_item = [{272,1},{1801,4}]
    };
getRow(3)->
    #aruna_stageRewardCfg {
    id = 3,
    worldid = 1,
    rank = [6,10],
    reward_rank = 300,
    reward_Currency = 1000,
    reward_item = [{271,1},{1801,3}]
    };
getRow(4)->
    #aruna_stageRewardCfg {
    id = 4,
    worldid = 1,
    rank = [11,50],
    reward_rank = 240,
    reward_Currency = 800,
    reward_item = [{270,1},{1801,3}]
    };
getRow(5)->
    #aruna_stageRewardCfg {
    id = 5,
    worldid = 1,
    rank = [51,100],
    reward_rank = 180,
    reward_Currency = 700,
    reward_item = [{270,1},{1801,3}]
    };
getRow(6)->
    #aruna_stageRewardCfg {
    id = 6,
    worldid = 1,
    rank = [101,500],
    reward_rank = 150,
    reward_Currency = 600,
    reward_item = [{270,1},{1801,2}]
    };
getRow(7)->
    #aruna_stageRewardCfg {
    id = 7,
    worldid = 1,
    rank = [501,9999],
    reward_rank = 100,
    reward_Currency = 500,
    reward_item = [{270,1},{1801,2}]
    };
getRow(8)->
    #aruna_stageRewardCfg {
    id = 8,
    worldid = 2,
    rank = [1],
    reward_rank = 500,
    reward_Currency = 1500,
    reward_item = [{273,1},{1801,4}]
    };
getRow(9)->
    #aruna_stageRewardCfg {
    id = 9,
    worldid = 2,
    rank = [2,5],
    reward_rank = 400,
    reward_Currency = 1200,
    reward_item = [{272,1},{1801,4}]
    };
getRow(10)->
    #aruna_stageRewardCfg {
    id = 10,
    worldid = 2,
    rank = [6,10],
    reward_rank = 300,
    reward_Currency = 1000,
    reward_item = [{271,1},{1801,3}]
    };
getRow(11)->
    #aruna_stageRewardCfg {
    id = 11,
    worldid = 2,
    rank = [11,50],
    reward_rank = 240,
    reward_Currency = 800,
    reward_item = [{270,1},{1801,3}]
    };
getRow(12)->
    #aruna_stageRewardCfg {
    id = 12,
    worldid = 2,
    rank = [51,100],
    reward_rank = 180,
    reward_Currency = 700,
    reward_item = [{270,1},{1801,3}]
    };
getRow(13)->
    #aruna_stageRewardCfg {
    id = 13,
    worldid = 2,
    rank = [101,500],
    reward_rank = 150,
    reward_Currency = 600,
    reward_item = [{270,1},{1801,2}]
    };
getRow(14)->
    #aruna_stageRewardCfg {
    id = 14,
    worldid = 2,
    rank = [501,9999],
    reward_rank = 100,
    reward_Currency = 500,
    reward_item = [{270,1},{1801,2}]
    };
getRow(15)->
    #aruna_stageRewardCfg {
    id = 15,
    worldid = 3,
    rank = [1],
    reward_rank = 500,
    reward_Currency = 1500,
    reward_item = [{273,1},{1801,4}]
    };
getRow(16)->
    #aruna_stageRewardCfg {
    id = 16,
    worldid = 3,
    rank = [2,5],
    reward_rank = 400,
    reward_Currency = 1200,
    reward_item = [{272,1},{1801,4}]
    };
getRow(17)->
    #aruna_stageRewardCfg {
    id = 17,
    worldid = 3,
    rank = [6,10],
    reward_rank = 300,
    reward_Currency = 1000,
    reward_item = [{271,1},{1801,3}]
    };
getRow(18)->
    #aruna_stageRewardCfg {
    id = 18,
    worldid = 3,
    rank = [11,50],
    reward_rank = 240,
    reward_Currency = 800,
    reward_item = [{270,1},{1801,3}]
    };
getRow(19)->
    #aruna_stageRewardCfg {
    id = 19,
    worldid = 3,
    rank = [51,100],
    reward_rank = 180,
    reward_Currency = 700,
    reward_item = [{270,1},{1801,3}]
    };
getRow(20)->
    #aruna_stageRewardCfg {
    id = 20,
    worldid = 3,
    rank = [101,500],
    reward_rank = 150,
    reward_Currency = 600,
    reward_item = [{270,1},{1801,2}]
    };
getRow(21)->
    #aruna_stageRewardCfg {
    id = 21,
    worldid = 3,
    rank = [501,9999],
    reward_rank = 100,
    reward_Currency = 500,
    reward_item = [{270,1},{1801,2}]
    };
getRow(22)->
    #aruna_stageRewardCfg {
    id = 22,
    worldid = 4,
    rank = [1],
    reward_rank = 500,
    reward_Currency = 1500,
    reward_item = [{273,1},{1801,4}]
    };
getRow(23)->
    #aruna_stageRewardCfg {
    id = 23,
    worldid = 4,
    rank = [2,5],
    reward_rank = 400,
    reward_Currency = 1200,
    reward_item = [{272,1},{1801,4}]
    };
getRow(24)->
    #aruna_stageRewardCfg {
    id = 24,
    worldid = 4,
    rank = [6,10],
    reward_rank = 300,
    reward_Currency = 1000,
    reward_item = [{271,1},{1801,3}]
    };
getRow(25)->
    #aruna_stageRewardCfg {
    id = 25,
    worldid = 4,
    rank = [11,50],
    reward_rank = 240,
    reward_Currency = 800,
    reward_item = [{270,1},{1801,3}]
    };
getRow(26)->
    #aruna_stageRewardCfg {
    id = 26,
    worldid = 4,
    rank = [51,100],
    reward_rank = 180,
    reward_Currency = 700,
    reward_item = [{270,1},{1801,3}]
    };
getRow(27)->
    #aruna_stageRewardCfg {
    id = 27,
    worldid = 4,
    rank = [101,500],
    reward_rank = 150,
    reward_Currency = 600,
    reward_item = [{270,1},{1801,2}]
    };
getRow(28)->
    #aruna_stageRewardCfg {
    id = 28,
    worldid = 4,
    rank = [501,9999],
    reward_rank = 100,
    reward_Currency = 500,
    reward_item = [{270,1},{1801,2}]
    };
getRow(29)->
    #aruna_stageRewardCfg {
    id = 29,
    worldid = 5,
    rank = [1],
    reward_rank = 500,
    reward_Currency = 2000,
    reward_item = [{273,1},{1801,4}]
    };
getRow(30)->
    #aruna_stageRewardCfg {
    id = 30,
    worldid = 5,
    rank = [2,5],
    reward_rank = 400,
    reward_Currency = 1800,
    reward_item = [{272,1},{1801,4}]
    };
getRow(31)->
    #aruna_stageRewardCfg {
    id = 31,
    worldid = 5,
    rank = [6,10],
    reward_rank = 300,
    reward_Currency = 1600,
    reward_item = [{271,1},{1801,3}]
    };
getRow(32)->
    #aruna_stageRewardCfg {
    id = 32,
    worldid = 5,
    rank = [11,50],
    reward_rank = 240,
    reward_Currency = 1400,
    reward_item = [{270,1},{1801,3}]
    };
getRow(33)->
    #aruna_stageRewardCfg {
    id = 33,
    worldid = 5,
    rank = [51,100],
    reward_rank = 180,
    reward_Currency = 1300,
    reward_item = [{270,1},{1801,3}]
    };
getRow(34)->
    #aruna_stageRewardCfg {
    id = 34,
    worldid = 5,
    rank = [101,500],
    reward_rank = 150,
    reward_Currency = 1100,
    reward_item = [{270,1},{1801,2}]
    };
getRow(35)->
    #aruna_stageRewardCfg {
    id = 35,
    worldid = 5,
    rank = [501,9999],
    reward_rank = 100,
    reward_Currency = 1000,
    reward_item = [{270,1},{1801,2}]
    };
getRow(36)->
    #aruna_stageRewardCfg {
    id = 36,
    worldid = 6,
    rank = [1],
    reward_rank = 500,
    reward_Currency = 2000,
    reward_item = [{273,1},{1801,4}]
    };
getRow(37)->
    #aruna_stageRewardCfg {
    id = 37,
    worldid = 6,
    rank = [2,5],
    reward_rank = 400,
    reward_Currency = 1800,
    reward_item = [{272,1},{1801,4}]
    };
getRow(38)->
    #aruna_stageRewardCfg {
    id = 38,
    worldid = 6,
    rank = [6,10],
    reward_rank = 300,
    reward_Currency = 1600,
    reward_item = [{271,1},{1801,3}]
    };
getRow(39)->
    #aruna_stageRewardCfg {
    id = 39,
    worldid = 6,
    rank = [11,50],
    reward_rank = 240,
    reward_Currency = 1400,
    reward_item = [{270,1},{1801,3}]
    };
getRow(40)->
    #aruna_stageRewardCfg {
    id = 40,
    worldid = 6,
    rank = [51,100],
    reward_rank = 180,
    reward_Currency = 1300,
    reward_item = [{270,1},{1801,3}]
    };
getRow(41)->
    #aruna_stageRewardCfg {
    id = 41,
    worldid = 6,
    rank = [101,500],
    reward_rank = 150,
    reward_Currency = 1100,
    reward_item = [{270,1},{1801,2}]
    };
getRow(42)->
    #aruna_stageRewardCfg {
    id = 42,
    worldid = 6,
    rank = [501,9999],
    reward_rank = 100,
    reward_Currency = 1000,
    reward_item = [{270,1},{1801,2}]
    };
getRow(43)->
    #aruna_stageRewardCfg {
    id = 43,
    worldid = 7,
    rank = [1],
    reward_rank = 500,
    reward_Currency = 2000,
    reward_item = [{273,1},{1801,4}]
    };
getRow(44)->
    #aruna_stageRewardCfg {
    id = 44,
    worldid = 7,
    rank = [2,5],
    reward_rank = 400,
    reward_Currency = 1800,
    reward_item = [{272,1},{1801,4}]
    };
getRow(45)->
    #aruna_stageRewardCfg {
    id = 45,
    worldid = 7,
    rank = [6,10],
    reward_rank = 300,
    reward_Currency = 1600,
    reward_item = [{271,1},{1801,3}]
    };
getRow(46)->
    #aruna_stageRewardCfg {
    id = 46,
    worldid = 7,
    rank = [11,50],
    reward_rank = 240,
    reward_Currency = 1400,
    reward_item = [{270,1},{1801,3}]
    };
getRow(47)->
    #aruna_stageRewardCfg {
    id = 47,
    worldid = 7,
    rank = [51,100],
    reward_rank = 180,
    reward_Currency = 1300,
    reward_item = [{270,1},{1801,3}]
    };
getRow(48)->
    #aruna_stageRewardCfg {
    id = 48,
    worldid = 7,
    rank = [101,500],
    reward_rank = 150,
    reward_Currency = 1100,
    reward_item = [{270,1},{1801,2}]
    };
getRow(49)->
    #aruna_stageRewardCfg {
    id = 49,
    worldid = 7,
    rank = [501,9999],
    reward_rank = 100,
    reward_Currency = 1000,
    reward_item = [{270,1},{1801,2}]
    };
getRow(50)->
    #aruna_stageRewardCfg {
    id = 50,
    worldid = 8,
    rank = [1],
    reward_rank = 500,
    reward_Currency = 2000,
    reward_item = [{273,1},{1801,4}]
    };
getRow(51)->
    #aruna_stageRewardCfg {
    id = 51,
    worldid = 8,
    rank = [2,5],
    reward_rank = 400,
    reward_Currency = 1800,
    reward_item = [{272,1},{1801,4}]
    };
getRow(52)->
    #aruna_stageRewardCfg {
    id = 52,
    worldid = 8,
    rank = [6,10],
    reward_rank = 300,
    reward_Currency = 1600,
    reward_item = [{271,1},{1801,3}]
    };
getRow(53)->
    #aruna_stageRewardCfg {
    id = 53,
    worldid = 8,
    rank = [11,50],
    reward_rank = 240,
    reward_Currency = 1400,
    reward_item = [{270,1},{1801,3}]
    };
getRow(54)->
    #aruna_stageRewardCfg {
    id = 54,
    worldid = 8,
    rank = [51,100],
    reward_rank = 180,
    reward_Currency = 1300,
    reward_item = [{270,1},{1801,3}]
    };
getRow(55)->
    #aruna_stageRewardCfg {
    id = 55,
    worldid = 8,
    rank = [101,500],
    reward_rank = 150,
    reward_Currency = 1100,
    reward_item = [{270,1},{1801,2}]
    };
getRow(56)->
    #aruna_stageRewardCfg {
    id = 56,
    worldid = 8,
    rank = [501,9999],
    reward_rank = 100,
    reward_Currency = 1000,
    reward_item = [{270,1},{1801,2}]
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
    {25},
    {26},
    {27},
    {28},
    {29},
    {30},
    {31},
    {32},
    {33},
    {34},
    {35},
    {36},
    {37},
    {38},
    {39},
    {40},
    {41},
    {42},
    {43},
    {44},
    {45},
    {46},
    {47},
    {48},
    {49},
    {50},
    {51},
    {52},
    {53},
    {54},
    {55},
    {56}
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
    25,
    26,
    27,
    28,
    29,
    30,
    31,
    32,
    33,
    34,
    35,
    36,
    37,
    38,
    39,
    40,
    41,
    42,
    43,
    44,
    45,
    46,
    47,
    48,
    49,
    50,
    51,
    52,
    53,
    54,
    55,
    56
    ].

