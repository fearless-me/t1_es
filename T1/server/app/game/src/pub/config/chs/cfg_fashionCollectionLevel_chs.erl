%% coding: latin-1
%%: 实现
-module(cfg_fashionCollectionLevel_chs).
-compile(export_all).
-include("cfg_fashionCollectionLevel.hrl").
-include("logger.hrl").

getRow(1)->
    #fashionCollectionLevelCfg {
    level = 1,
    exp = 200,
    attribute = [{135,975,0},{136,97,0},{137,97,0},{138,97,0},{139,97,0}]
    };
getRow(2)->
    #fashionCollectionLevelCfg {
    level = 2,
    exp = 220,
    attribute = [{135,1964,0},{136,196,0},{137,196,0},{138,196,0},{139,196,0}]
    };
getRow(3)->
    #fashionCollectionLevelCfg {
    level = 3,
    exp = 310,
    attribute = [{135,3018,0},{136,301,0},{137,301,0},{138,301,0},{139,301,0}]
    };
getRow(4)->
    #fashionCollectionLevelCfg {
    level = 4,
    exp = 430,
    attribute = [{135,4179,0},{136,417,0},{137,417,0},{138,417,0},{139,417,0}]
    };
getRow(5)->
    #fashionCollectionLevelCfg {
    level = 5,
    exp = 590,
    attribute = [{135,5482,0},{136,548,0},{137,548,0},{138,548,0},{139,548,0}]
    };
getRow(6)->
    #fashionCollectionLevelCfg {
    level = 6,
    exp = 760,
    attribute = [{135,6958,0},{136,695,0},{137,695,0},{138,695,0},{139,695,0}]
    };
getRow(7)->
    #fashionCollectionLevelCfg {
    level = 7,
    exp = 950,
    attribute = [{135,8639,0},{136,863,0},{137,863,0},{138,863,0},{139,863,0}]
    };
getRow(8)->
    #fashionCollectionLevelCfg {
    level = 8,
    exp = 1180,
    attribute = [{135,10550,0},{136,1055,0},{137,1055,0},{138,1055,0},{139,1055,0}]
    };
getRow(9)->
    #fashionCollectionLevelCfg {
    level = 9,
    exp = 1400,
    attribute = [{135,12719,0},{136,1271,0},{137,1271,0},{138,1271,0},{139,1271,0}]
    };
getRow(10)->
    #fashionCollectionLevelCfg {
    level = 10,
    exp = 1650,
    attribute = [{135,15171,0},{136,1517,0},{137,1517,0},{138,1517,0},{139,1517,0}]
    };
getRow(11)->
    #fashionCollectionLevelCfg {
    level = 11,
    exp = 1910,
    attribute = [{135,17931,0},{136,1793,0},{137,1793,0},{138,1793,0},{139,1793,0}]
    };
getRow(12)->
    #fashionCollectionLevelCfg {
    level = 12,
    exp = 2200,
    attribute = [{135,21020,0},{136,2102,0},{137,2102,0},{138,2102,0},{139,2102,0}]
    };
getRow(13)->
    #fashionCollectionLevelCfg {
    level = 13,
    exp = 2480,
    attribute = [{135,24464,0},{136,2446,0},{137,2446,0},{138,2446,0},{139,2446,0}]
    };
getRow(14)->
    #fashionCollectionLevelCfg {
    level = 14,
    exp = 2790,
    attribute = [{135,28283,0},{136,2828,0},{137,2828,0},{138,2828,0},{139,2828,0}]
    };
getRow(15)->
    #fashionCollectionLevelCfg {
    level = 15,
    exp = 3100,
    attribute = [{135,32500,0},{136,3250,0},{137,3250,0},{138,3250,0},{139,3250,0}]
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
    {15}
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
    15
    ].

