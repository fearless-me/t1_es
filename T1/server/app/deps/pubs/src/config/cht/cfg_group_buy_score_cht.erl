%% coding: latin-1
%%: 实现
-module(cfg_group_buy_score_cht).
-compile(export_all).
-include("cfg_group_buy_score.hrl").
-include("logger.hrl").

getRow(101)->
    #group_buy_scoreCfg {
    id = 101,
    group = 1,
    score = 680,
    reward1_id = 251,
    reward1_num = 2,
    reward2_id = 0,
    reward2_num = 0,
    reward3_id = 0,
    reward3_num = 0,
    reward4_id = 0,
    reward4_num = 0,
    reward5_id = 0,
    reward5_num = 0
    };
getRow(102)->
    #group_buy_scoreCfg {
    id = 102,
    group = 1,
    score = 1880,
    reward1_id = 251,
    reward1_num = 4,
    reward2_id = 0,
    reward2_num = 0,
    reward3_id = 0,
    reward3_num = 0,
    reward4_id = 0,
    reward4_num = 0,
    reward5_id = 0,
    reward5_num = 0
    };
getRow(103)->
    #group_buy_scoreCfg {
    id = 103,
    group = 1,
    score = 3080,
    reward1_id = 253,
    reward1_num = 1,
    reward2_id = 0,
    reward2_num = 0,
    reward3_id = 0,
    reward3_num = 0,
    reward4_id = 0,
    reward4_num = 0,
    reward5_id = 0,
    reward5_num = 0
    };
getRow(104)->
    #group_buy_scoreCfg {
    id = 104,
    group = 1,
    score = 6800,
    reward1_id = 230,
    reward1_num = 2,
    reward2_id = 0,
    reward2_num = 0,
    reward3_id = 0,
    reward3_num = 0,
    reward4_id = 0,
    reward4_num = 0,
    reward5_id = 0,
    reward5_num = 0
    };
getRow(105)->
    #group_buy_scoreCfg {
    id = 105,
    group = 1,
    score = 9200,
    reward1_id = 233,
    reward1_num = 1,
    reward2_id = 0,
    reward2_num = 0,
    reward3_id = 0,
    reward3_num = 0,
    reward4_id = 0,
    reward4_num = 0,
    reward5_id = 0,
    reward5_num = 0
    };
getRow(106)->
    #group_buy_scoreCfg {
    id = 106,
    group = 1,
    score = 11300,
    reward1_id = 273,
    reward1_num = 1,
    reward2_id = 0,
    reward2_num = 0,
    reward3_id = 0,
    reward3_num = 0,
    reward4_id = 0,
    reward4_num = 0,
    reward5_id = 0,
    reward5_num = 0
    };
getRow(201)->
    #group_buy_scoreCfg {
    id = 201,
    group = 2,
    score = 50000,
    reward1_id = 241,
    reward1_num = 50,
    reward2_id = 0,
    reward2_num = 0,
    reward3_id = 0,
    reward3_num = 0,
    reward4_id = 0,
    reward4_num = 0,
    reward5_id = 0,
    reward5_num = 0
    };
getRow(202)->
    #group_buy_scoreCfg {
    id = 202,
    group = 2,
    score = 200000,
    reward1_id = 230,
    reward1_num = 4,
    reward2_id = 0,
    reward2_num = 0,
    reward3_id = 0,
    reward3_num = 0,
    reward4_id = 0,
    reward4_num = 0,
    reward5_id = 0,
    reward5_num = 0
    };
getRow(203)->
    #group_buy_scoreCfg {
    id = 203,
    group = 2,
    score = 500000,
    reward1_id = 2160,
    reward1_num = 20,
    reward2_id = 0,
    reward2_num = 0,
    reward3_id = 0,
    reward3_num = 0,
    reward4_id = 0,
    reward4_num = 0,
    reward5_id = 0,
    reward5_num = 0
    };
getRow(204)->
    #group_buy_scoreCfg {
    id = 204,
    group = 2,
    score = 1000000,
    reward1_id = 21104,
    reward1_num = 1,
    reward2_id = 0,
    reward2_num = 0,
    reward3_id = 0,
    reward3_num = 0,
    reward4_id = 0,
    reward4_num = 0,
    reward5_id = 0,
    reward5_num = 0
    };
getRow(301)->
    #group_buy_scoreCfg {
    id = 301,
    group = 3,
    score = 200000,
    reward1_id = 230,
    reward1_num = 4,
    reward2_id = 0,
    reward2_num = 0,
    reward3_id = 0,
    reward3_num = 0,
    reward4_id = 0,
    reward4_num = 0,
    reward5_id = 0,
    reward5_num = 0
    };
getRow(302)->
    #group_buy_scoreCfg {
    id = 302,
    group = 3,
    score = 500000,
    reward1_id = 2160,
    reward1_num = 20,
    reward2_id = 0,
    reward2_num = 0,
    reward3_id = 0,
    reward3_num = 0,
    reward4_id = 0,
    reward4_num = 0,
    reward5_id = 0,
    reward5_num = 0
    };
getRow(303)->
    #group_buy_scoreCfg {
    id = 303,
    group = 3,
    score = 1000000,
    reward1_id = 21104,
    reward1_num = 1,
    reward2_id = 0,
    reward2_num = 0,
    reward3_id = 0,
    reward3_num = 0,
    reward4_id = 0,
    reward4_num = 0,
    reward5_id = 0,
    reward5_num = 0
    };
getRow(_)->[].

getKeyList()->[
    {101},
    {102},
    {103},
    {104},
    {105},
    {106},
    {201},
    {202},
    {203},
    {204},
    {301},
    {302},
    {303}
    ].

get1KeyList()->[
    101,
    102,
    103,
    104,
    105,
    106,
    201,
    202,
    203,
    204,
    301,
    302,
    303
    ].

