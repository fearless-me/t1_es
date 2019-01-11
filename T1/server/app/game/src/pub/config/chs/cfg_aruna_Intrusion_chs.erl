%% coding: latin-1
%%: 实现
-module(cfg_aruna_Intrusion_chs).
-compile(export_all).
-include("cfg_aruna_Intrusion.hrl").
-include("logger.hrl").

getRow(1)->
    #aruna_IntrusionCfg {
    id = 1,
    worldid = 1,
    batch = 1,
    monsterid = [{9701,30}],
    position = [303,142,10],
    time_interval = 60,
    boss = 1
    };
getRow(2)->
    #aruna_IntrusionCfg {
    id = 2,
    worldid = 1,
    batch = 2,
    monsterid = [{9702,30}],
    position = [287,117,10],
    time_interval = 60,
    boss = 1
    };
getRow(3)->
    #aruna_IntrusionCfg {
    id = 3,
    worldid = 1,
    batch = 3,
    monsterid = [{9703,30}],
    position = [250,105,10],
    time_interval = 60,
    boss = 1
    };
getRow(4)->
    #aruna_IntrusionCfg {
    id = 4,
    worldid = 1,
    batch = 4,
    monsterid = [{9704,30}],
    position = [280,75,10],
    time_interval = 60,
    boss = 1
    };
getRow(5)->
    #aruna_IntrusionCfg {
    id = 5,
    worldid = 1,
    batch = 5,
    monsterid = [{9705,30}],
    position = [233,62,10],
    time_interval = 60,
    boss = 1
    };
getRow(6)->
    #aruna_IntrusionCfg {
    id = 6,
    worldid = 1,
    batch = 6,
    monsterid = [{9801,1}],
    position = [253,51,10],
    time_interval = 60,
    boss = 1
    };
getRow(7)->
    #aruna_IntrusionCfg {
    id = 7,
    worldid = 1,
    batch = 7,
    monsterid = [{9551,10}],
    position = [250,51,10],
    time_interval = 15,
    boss = 0
    };
getRow(8)->
    #aruna_IntrusionCfg {
    id = 8,
    worldid = 2,
    batch = 1,
    monsterid = [{9706,30}],
    position = [303,142,10],
    time_interval = 60,
    boss = 1
    };
getRow(9)->
    #aruna_IntrusionCfg {
    id = 9,
    worldid = 2,
    batch = 2,
    monsterid = [{9707,30}],
    position = [287,117,10],
    time_interval = 60,
    boss = 1
    };
getRow(10)->
    #aruna_IntrusionCfg {
    id = 10,
    worldid = 2,
    batch = 3,
    monsterid = [{9708,30}],
    position = [250,105,10],
    time_interval = 60,
    boss = 1
    };
getRow(11)->
    #aruna_IntrusionCfg {
    id = 11,
    worldid = 2,
    batch = 4,
    monsterid = [{9709,30}],
    position = [280,75,10],
    time_interval = 60,
    boss = 1
    };
getRow(12)->
    #aruna_IntrusionCfg {
    id = 12,
    worldid = 2,
    batch = 5,
    monsterid = [{9710,30}],
    position = [233,62,10],
    time_interval = 60,
    boss = 1
    };
getRow(13)->
    #aruna_IntrusionCfg {
    id = 13,
    worldid = 2,
    batch = 6,
    monsterid = [{9802,1}],
    position = [253,51,10],
    time_interval = 60,
    boss = 1
    };
getRow(14)->
    #aruna_IntrusionCfg {
    id = 14,
    worldid = 2,
    batch = 7,
    monsterid = [{9552,10}],
    position = [250,51,10],
    time_interval = 15,
    boss = 0
    };
getRow(15)->
    #aruna_IntrusionCfg {
    id = 15,
    worldid = 3,
    batch = 1,
    monsterid = [{9711,30}],
    position = [361,162,10],
    time_interval = 60,
    boss = 1
    };
getRow(16)->
    #aruna_IntrusionCfg {
    id = 16,
    worldid = 3,
    batch = 2,
    monsterid = [{9712,30}],
    position = [387,140,10],
    time_interval = 60,
    boss = 1
    };
getRow(17)->
    #aruna_IntrusionCfg {
    id = 17,
    worldid = 3,
    batch = 3,
    monsterid = [{9713,30}],
    position = [425,158,10],
    time_interval = 60,
    boss = 1
    };
getRow(18)->
    #aruna_IntrusionCfg {
    id = 18,
    worldid = 3,
    batch = 4,
    monsterid = [{9714,30}],
    position = [420,117,10],
    time_interval = 60,
    boss = 1
    };
getRow(19)->
    #aruna_IntrusionCfg {
    id = 19,
    worldid = 3,
    batch = 5,
    monsterid = [{9715,30}],
    position = [406,80,10],
    time_interval = 60,
    boss = 1
    };
getRow(20)->
    #aruna_IntrusionCfg {
    id = 20,
    worldid = 3,
    batch = 6,
    monsterid = [{9803,1}],
    position = [418,86,10],
    time_interval = 60,
    boss = 1
    };
getRow(21)->
    #aruna_IntrusionCfg {
    id = 21,
    worldid = 3,
    batch = 7,
    monsterid = [{9553,10}],
    position = [406,80,10],
    time_interval = 15,
    boss = 0
    };
getRow(22)->
    #aruna_IntrusionCfg {
    id = 22,
    worldid = 4,
    batch = 1,
    monsterid = [{9716,30}],
    position = [361,162,10],
    time_interval = 60,
    boss = 1
    };
getRow(23)->
    #aruna_IntrusionCfg {
    id = 23,
    worldid = 4,
    batch = 2,
    monsterid = [{9717,30}],
    position = [387,140,10],
    time_interval = 60,
    boss = 1
    };
getRow(24)->
    #aruna_IntrusionCfg {
    id = 24,
    worldid = 4,
    batch = 3,
    monsterid = [{9718,30}],
    position = [425,158,10],
    time_interval = 60,
    boss = 1
    };
getRow(25)->
    #aruna_IntrusionCfg {
    id = 25,
    worldid = 4,
    batch = 4,
    monsterid = [{9719,30}],
    position = [420,117,10],
    time_interval = 60,
    boss = 1
    };
getRow(26)->
    #aruna_IntrusionCfg {
    id = 26,
    worldid = 4,
    batch = 5,
    monsterid = [{9720,30}],
    position = [406,80,10],
    time_interval = 60,
    boss = 1
    };
getRow(27)->
    #aruna_IntrusionCfg {
    id = 27,
    worldid = 4,
    batch = 6,
    monsterid = [{9804,1}],
    position = [418,86,10],
    time_interval = 60,
    boss = 1
    };
getRow(28)->
    #aruna_IntrusionCfg {
    id = 28,
    worldid = 4,
    batch = 7,
    monsterid = [{9554,10}],
    position = [406,80,10],
    time_interval = 15,
    boss = 0
    };
getRow(29)->
    #aruna_IntrusionCfg {
    id = 29,
    worldid = 5,
    batch = 1,
    monsterid = [{9721,30}],
    position = [330,232,10],
    time_interval = 60,
    boss = 1
    };
getRow(30)->
    #aruna_IntrusionCfg {
    id = 30,
    worldid = 5,
    batch = 2,
    monsterid = [{9722,30}],
    position = [327,227,10],
    time_interval = 60,
    boss = 1
    };
getRow(31)->
    #aruna_IntrusionCfg {
    id = 31,
    worldid = 5,
    batch = 3,
    monsterid = [{9723,30}],
    position = [383,233,10],
    time_interval = 60,
    boss = 1
    };
getRow(32)->
    #aruna_IntrusionCfg {
    id = 32,
    worldid = 5,
    batch = 4,
    monsterid = [{9724,30}],
    position = [403,243,10],
    time_interval = 60,
    boss = 1
    };
getRow(33)->
    #aruna_IntrusionCfg {
    id = 33,
    worldid = 5,
    batch = 5,
    monsterid = [{9725,30}],
    position = [405,290,10],
    time_interval = 60,
    boss = 1
    };
getRow(34)->
    #aruna_IntrusionCfg {
    id = 34,
    worldid = 5,
    batch = 6,
    monsterid = [{9805,1}],
    position = [397,266,10],
    time_interval = 60,
    boss = 1
    };
getRow(35)->
    #aruna_IntrusionCfg {
    id = 35,
    worldid = 5,
    batch = 7,
    monsterid = [{9555,10}],
    position = [405,290,10],
    time_interval = 15,
    boss = 0
    };
getRow(36)->
    #aruna_IntrusionCfg {
    id = 36,
    worldid = 6,
    batch = 1,
    monsterid = [{9726,30}],
    position = [330,232,10],
    time_interval = 60,
    boss = 1
    };
getRow(37)->
    #aruna_IntrusionCfg {
    id = 37,
    worldid = 6,
    batch = 2,
    monsterid = [{9727,30}],
    position = [327,227,10],
    time_interval = 60,
    boss = 1
    };
getRow(38)->
    #aruna_IntrusionCfg {
    id = 38,
    worldid = 6,
    batch = 3,
    monsterid = [{9728,30}],
    position = [383,233,10],
    time_interval = 60,
    boss = 1
    };
getRow(39)->
    #aruna_IntrusionCfg {
    id = 39,
    worldid = 6,
    batch = 4,
    monsterid = [{9729,30}],
    position = [403,243,10],
    time_interval = 60,
    boss = 1
    };
getRow(40)->
    #aruna_IntrusionCfg {
    id = 40,
    worldid = 6,
    batch = 5,
    monsterid = [{9730,30}],
    position = [405,290,10],
    time_interval = 60,
    boss = 1
    };
getRow(41)->
    #aruna_IntrusionCfg {
    id = 41,
    worldid = 6,
    batch = 6,
    monsterid = [{9806,1}],
    position = [397,266,10],
    time_interval = 60,
    boss = 1
    };
getRow(42)->
    #aruna_IntrusionCfg {
    id = 42,
    worldid = 6,
    batch = 7,
    monsterid = [{9556,10}],
    position = [405,290,10],
    time_interval = 15,
    boss = 0
    };
getRow(43)->
    #aruna_IntrusionCfg {
    id = 43,
    worldid = 7,
    batch = 1,
    monsterid = [{9731,30}],
    position = [455,233,10],
    time_interval = 60,
    boss = 1
    };
getRow(44)->
    #aruna_IntrusionCfg {
    id = 44,
    worldid = 7,
    batch = 2,
    monsterid = [{9732,30}],
    position = [418,205,10],
    time_interval = 60,
    boss = 1
    };
getRow(45)->
    #aruna_IntrusionCfg {
    id = 45,
    worldid = 7,
    batch = 3,
    monsterid = [{9733,30}],
    position = [423,150,10],
    time_interval = 60,
    boss = 1
    };
getRow(46)->
    #aruna_IntrusionCfg {
    id = 46,
    worldid = 7,
    batch = 4,
    monsterid = [{9734,30}],
    position = [472,200,10],
    time_interval = 60,
    boss = 1
    };
getRow(47)->
    #aruna_IntrusionCfg {
    id = 47,
    worldid = 7,
    batch = 5,
    monsterid = [{9735,30}],
    position = [512,173,10],
    time_interval = 60,
    boss = 1
    };
getRow(48)->
    #aruna_IntrusionCfg {
    id = 48,
    worldid = 7,
    batch = 6,
    monsterid = [{9807,1}],
    position = [514,135,10],
    time_interval = 60,
    boss = 1
    };
getRow(49)->
    #aruna_IntrusionCfg {
    id = 49,
    worldid = 7,
    batch = 7,
    monsterid = [{9557,10}],
    position = [512,173,10],
    time_interval = 15,
    boss = 0
    };
getRow(50)->
    #aruna_IntrusionCfg {
    id = 50,
    worldid = 8,
    batch = 1,
    monsterid = [{9736,30}],
    position = [455,233,10],
    time_interval = 60,
    boss = 1
    };
getRow(51)->
    #aruna_IntrusionCfg {
    id = 51,
    worldid = 8,
    batch = 2,
    monsterid = [{9737,30}],
    position = [418,205,10],
    time_interval = 60,
    boss = 1
    };
getRow(52)->
    #aruna_IntrusionCfg {
    id = 52,
    worldid = 8,
    batch = 3,
    monsterid = [{9738,30}],
    position = [423,150,10],
    time_interval = 60,
    boss = 1
    };
getRow(53)->
    #aruna_IntrusionCfg {
    id = 53,
    worldid = 8,
    batch = 4,
    monsterid = [{9739,30}],
    position = [472,200,10],
    time_interval = 60,
    boss = 1
    };
getRow(54)->
    #aruna_IntrusionCfg {
    id = 54,
    worldid = 8,
    batch = 5,
    monsterid = [{9740,30}],
    position = [512,173,10],
    time_interval = 60,
    boss = 1
    };
getRow(55)->
    #aruna_IntrusionCfg {
    id = 55,
    worldid = 8,
    batch = 6,
    monsterid = [{9808,1}],
    position = [514,135,10],
    time_interval = 60,
    boss = 1
    };
getRow(56)->
    #aruna_IntrusionCfg {
    id = 56,
    worldid = 8,
    batch = 7,
    monsterid = [{9558,10}],
    position = [512,173,10],
    time_interval = 15,
    boss = 0
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

