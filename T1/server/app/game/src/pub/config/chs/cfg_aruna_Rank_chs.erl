%% coding: latin-1
%%: 实现
-module(cfg_aruna_Rank_chs).
-compile(export_all).
-include("cfg_aruna_Rank.hrl").
-include("logger.hrl").

getRow(1)->
    #aruna_RankCfg {
    id = 1,
    rankname = "无军衔",
    rankicon = 0,
    value = 0,
    buff_def = [],
    buff_Sample = 1500,
    rankicon_Border = 0
    };
getRow(2)->
    #aruna_RankCfg {
    id = 2,
    rankname = "冒险家I",
    rankicon = 1,
    value = 100,
    buff_def = [{135,3250,0}],
    buff_Sample = 1500,
    rankicon_Border = 0
    };
getRow(3)->
    #aruna_RankCfg {
    id = 3,
    rankname = "冒险家II",
    rankicon = 2,
    value = 310,
    buff_def = [{135,7956,0}],
    buff_Sample = 1650,
    rankicon_Border = 0
    };
getRow(4)->
    #aruna_RankCfg {
    id = 4,
    rankname = "冒险家III",
    rankicon = 3,
    value = 550,
    buff_def = [{135,13870,0}],
    buff_Sample = 1800,
    rankicon_Border = 0
    };
getRow(5)->
    #aruna_RankCfg {
    id = 5,
    rankname = "冒险家IV",
    rankicon = 4,
    value = 810,
    buff_def = [{135,20569,0}],
    buff_Sample = 1950,
    rankicon_Border = 0
    };
getRow(6)->
    #aruna_RankCfg {
    id = 6,
    rankname = "冒险家V",
    rankicon = 5,
    value = 1080,
    buff_def = [{135,27903,0}],
    buff_Sample = 2100,
    rankicon_Border = 0
    };
getRow(7)->
    #aruna_RankCfg {
    id = 7,
    rankname = "佣兵I",
    rankicon = 6,
    value = 1360,
    buff_def = [{135,35786,0}],
    buff_Sample = 2250,
    rankicon_Border = 0
    };
getRow(8)->
    #aruna_RankCfg {
    id = 8,
    rankname = "佣兵II",
    rankicon = 7,
    value = 1650,
    buff_def = [{135,44159,0}],
    buff_Sample = 2400,
    rankicon_Border = 0
    };
getRow(9)->
    #aruna_RankCfg {
    id = 9,
    rankname = "佣兵III",
    rankicon = 8,
    value = 1940,
    buff_def = [{135,52979,0}],
    buff_Sample = 2550,
    rankicon_Border = 0
    };
getRow(10)->
    #aruna_RankCfg {
    id = 10,
    rankname = "佣兵IV",
    rankicon = 9,
    value = 2240,
    buff_def = [{135,62212,0}],
    buff_Sample = 2700,
    rankicon_Border = 0
    };
getRow(11)->
    #aruna_RankCfg {
    id = 11,
    rankname = "佣兵V",
    rankicon = 10,
    value = 2540,
    buff_def = [{135,71832,0}],
    buff_Sample = 2850,
    rankicon_Border = 0
    };
getRow(12)->
    #aruna_RankCfg {
    id = 12,
    rankname = "勇士I",
    rankicon = 1,
    value = 2850,
    buff_def = [{135,81816,0}],
    buff_Sample = 3000,
    rankicon_Border = 1
    };
getRow(13)->
    #aruna_RankCfg {
    id = 13,
    rankname = "勇士II",
    rankicon = 2,
    value = 3160,
    buff_def = [{135,92146,0}],
    buff_Sample = 3150,
    rankicon_Border = 1
    };
getRow(14)->
    #aruna_RankCfg {
    id = 14,
    rankname = "勇士III",
    rankicon = 3,
    value = 3480,
    buff_def = [{135,102805,0}],
    buff_Sample = 3300,
    rankicon_Border = 1
    };
getRow(15)->
    #aruna_RankCfg {
    id = 15,
    rankname = "勇士IV",
    rankicon = 4,
    value = 3800,
    buff_def = [{135,113780,0}],
    buff_Sample = 3450,
    rankicon_Border = 1
    };
getRow(16)->
    #aruna_RankCfg {
    id = 16,
    rankname = "勇士V",
    rankicon = 5,
    value = 4120,
    buff_def = [{135,125059,0}],
    buff_Sample = 3600,
    rankicon_Border = 1
    };
getRow(17)->
    #aruna_RankCfg {
    id = 17,
    rankname = "骑士I",
    rankicon = 6,
    value = 4450,
    buff_def = [{135,136629,0}],
    buff_Sample = 3750,
    rankicon_Border = 1
    };
getRow(18)->
    #aruna_RankCfg {
    id = 18,
    rankname = "骑士II",
    rankicon = 7,
    value = 4780,
    buff_def = [{135,148481,0}],
    buff_Sample = 3900,
    rankicon_Border = 1
    };
getRow(19)->
    #aruna_RankCfg {
    id = 19,
    rankname = "骑士III",
    rankicon = 8,
    value = 5110,
    buff_def = [{135,160607,0}],
    buff_Sample = 4050,
    rankicon_Border = 1
    };
getRow(20)->
    #aruna_RankCfg {
    id = 20,
    rankname = "骑士IV",
    rankicon = 9,
    value = 5450,
    buff_def = [{135,172998,0}],
    buff_Sample = 4200,
    rankicon_Border = 1
    };
getRow(21)->
    #aruna_RankCfg {
    id = 21,
    rankname = "骑士V",
    rankicon = 10,
    value = 5790,
    buff_def = [{135,185646,0}],
    buff_Sample = 4350,
    rankicon_Border = 1
    };
getRow(22)->
    #aruna_RankCfg {
    id = 22,
    rankname = "指挥官I",
    rankicon = 1,
    value = 6130,
    buff_def = [{135,198545,0}],
    buff_Sample = 4500,
    rankicon_Border = 2
    };
getRow(23)->
    #aruna_RankCfg {
    id = 23,
    rankname = "指挥官II",
    rankicon = 2,
    value = 6470,
    buff_def = [{135,211688,0}],
    buff_Sample = 4650,
    rankicon_Border = 2
    };
getRow(24)->
    #aruna_RankCfg {
    id = 24,
    rankname = "指挥官III",
    rankicon = 3,
    value = 6820,
    buff_def = [{135,225070,0}],
    buff_Sample = 4800,
    rankicon_Border = 2
    };
getRow(25)->
    #aruna_RankCfg {
    id = 25,
    rankname = "指挥官IV",
    rankicon = 4,
    value = 7170,
    buff_def = [{135,238685,0}],
    buff_Sample = 4950,
    rankicon_Border = 2
    };
getRow(26)->
    #aruna_RankCfg {
    id = 26,
    rankname = "指挥官V",
    rankicon = 5,
    value = 7520,
    buff_def = [{135,252527,0}],
    buff_Sample = 5100,
    rankicon_Border = 2
    };
getRow(27)->
    #aruna_RankCfg {
    id = 27,
    rankname = "统帅I",
    rankicon = 6,
    value = 7870,
    buff_def = [{135,266593,0}],
    buff_Sample = 5250,
    rankicon_Border = 2
    };
getRow(28)->
    #aruna_RankCfg {
    id = 28,
    rankname = "统帅II",
    rankicon = 7,
    value = 8220,
    buff_def = [{135,280877,0}],
    buff_Sample = 5400,
    rankicon_Border = 2
    };
getRow(29)->
    #aruna_RankCfg {
    id = 29,
    rankname = "统帅III",
    rankicon = 8,
    value = 8580,
    buff_def = [{135,295376,0}],
    buff_Sample = 5550,
    rankicon_Border = 2
    };
getRow(30)->
    #aruna_RankCfg {
    id = 30,
    rankname = "统帅IV",
    rankicon = 9,
    value = 8940,
    buff_def = [{135,310084,0}],
    buff_Sample = 5700,
    rankicon_Border = 2
    };
getRow(31)->
    #aruna_RankCfg {
    id = 31,
    rankname = "统帅V",
    rankicon = 10,
    value = 9300,
    buff_def = [{135,325000,0}],
    buff_Sample = 5850,
    rankicon_Border = 2
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
    {31}
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
    31
    ].

