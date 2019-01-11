%% coding: latin-1
%%: 实现
-module(cfg_google_achievement_chs).
-compile(export_all).
-include("cfg_google_achievement.hrl").
-include("logger.hrl").

getRow(1)->
    #google_achievementCfg {
    iD = 1,
    type = 1,
    param = 30,
    achi_id = "CgkIx8fkmfMYEAIQAg"
    };
getRow(2)->
    #google_achievementCfg {
    iD = 2,
    type = 1,
    param = 60,
    achi_id = "CgkIx8fkmfMYEAIQAw"
    };
getRow(3)->
    #google_achievementCfg {
    iD = 3,
    type = 1,
    param = 120,
    achi_id = "CgkIx8fkmfMYEAIQBA"
    };
getRow(4)->
    #google_achievementCfg {
    iD = 4,
    type = 1,
    param = 180,
    achi_id = "CgkIx8fkmfMYEAIQBQ"
    };
getRow(5)->
    #google_achievementCfg {
    iD = 5,
    type = 2,
    param = 2,
    achi_id = "CgkIx8fkmfMYEAIQBg"
    };
getRow(6)->
    #google_achievementCfg {
    iD = 6,
    type = 2,
    param = 3,
    achi_id = "CgkIx8fkmfMYEAIQBw"
    };
getRow(7)->
    #google_achievementCfg {
    iD = 7,
    type = 2,
    param = 4,
    achi_id = "CgkIx8fkmfMYEAIQCQ"
    };
getRow(8)->
    #google_achievementCfg {
    iD = 8,
    type = 2,
    param = 5,
    achi_id = "CgkIx8fkmfMYEAIQCg"
    };
getRow(9)->
    #google_achievementCfg {
    iD = 9,
    type = 3,
    param = 3,
    achi_id = "CgkIx8fkmfMYEAIQCw"
    };
getRow(10)->
    #google_achievementCfg {
    iD = 10,
    type = 3,
    param = 5,
    achi_id = "CgkIx8fkmfMYEAIQDA"
    };
getRow(11)->
    #google_achievementCfg {
    iD = 11,
    type = 3,
    param = 7,
    achi_id = "CgkIx8fkmfMYEAIQDQ"
    };
getRow(12)->
    #google_achievementCfg {
    iD = 12,
    type = 3,
    param = 10,
    achi_id = "CgkIx8fkmfMYEAIQDg"
    };
getRow(13)->
    #google_achievementCfg {
    iD = 13,
    type = 4,
    param = 2,
    achi_id = "CgkIx8fkmfMYEAIQDw"
    };
getRow(14)->
    #google_achievementCfg {
    iD = 14,
    type = 4,
    param = 4,
    achi_id = "CgkIx8fkmfMYEAIQEA"
    };
getRow(15)->
    #google_achievementCfg {
    iD = 15,
    type = 4,
    param = 6,
    achi_id = "CgkIx8fkmfMYEAIQEQ"
    };
getRow(16)->
    #google_achievementCfg {
    iD = 16,
    type = 4,
    param = 8,
    achi_id = "CgkIx8fkmfMYEAIQEg"
    };
getRow(17)->
    #google_achievementCfg {
    iD = 17,
    type = 5,
    param = 1,
    achi_id = "CgkIx8fkmfMYEAIQEw"
    };
getRow(18)->
    #google_achievementCfg {
    iD = 18,
    type = 5,
    param = 7,
    achi_id = "CgkIx8fkmfMYEAIQFA"
    };
getRow(19)->
    #google_achievementCfg {
    iD = 19,
    type = 5,
    param = 15,
    achi_id = "CgkIx8fkmfMYEAIQFQ"
    };
getRow(20)->
    #google_achievementCfg {
    iD = 20,
    type = 5,
    param = 30,
    achi_id = "CgkIx8fkmfMYEAIQFg"
    };
getRow(21)->
    #google_achievementCfg {
    iD = 21,
    type = 6,
    param = 1000,
    achi_id = "CgkIx8fkmfMYEAIQFw"
    };
getRow(22)->
    #google_achievementCfg {
    iD = 22,
    type = 6,
    param = 3000,
    achi_id = "CgkIx8fkmfMYEAIQGA"
    };
getRow(23)->
    #google_achievementCfg {
    iD = 23,
    type = 6,
    param = 5000,
    achi_id = "CgkIx8fkmfMYEAIQGQ"
    };
getRow(24)->
    #google_achievementCfg {
    iD = 24,
    type = 6,
    param = 10000,
    achi_id = "CgkIx8fkmfMYEAIQGg"
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
    {24}
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
    24
    ].

