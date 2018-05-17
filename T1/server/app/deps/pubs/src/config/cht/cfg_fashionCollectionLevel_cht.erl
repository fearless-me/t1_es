%% coding: latin-1
%%: 实现
-module(cfg_fashionCollectionLevel_cht).
-compile(export_all).
-include("cfg_fashionCollectionLevel.hrl").


getRow(1)->
    #fashionCollectionLevelCfg {
    level = 1,
    exp = 100,
    attribute = [{135,334,0},{136,33,0},{137,33,0},{138,33,0},{139,33,0}]
    };
getRow(2)->
    #fashionCollectionLevelCfg {
    level = 2,
    exp = 200,
    attribute = [{135,655,0},{136,65,0},{137,65,0},{138,65,0},{139,65,0}]
    };
getRow(3)->
    #fashionCollectionLevelCfg {
    level = 3,
    exp = 300,
    attribute = [{135,1308,0},{136,130,0},{137,130,0},{138,130,0},{139,130,0}]
    };
getRow(4)->
    #fashionCollectionLevelCfg {
    level = 4,
    exp = 500,
    attribute = [{135,2198,0},{136,219,0},{137,219,0},{138,219,0},{139,219,0}]
    };
getRow(5)->
    #fashionCollectionLevelCfg {
    level = 5,
    exp = 700,
    attribute = [{135,3288,0},{136,328,0},{137,328,0},{138,328,0},{139,328,0}]
    };
getRow(6)->
    #fashionCollectionLevelCfg {
    level = 6,
    exp = 1000,
    attribute = [{135,4555,0},{136,455,0},{137,455,0},{138,455,0},{139,455,0}]
    };
getRow(7)->
    #fashionCollectionLevelCfg {
    level = 7,
    exp = 1200,
    attribute = [{135,5985,0},{136,598,0},{137,598,0},{138,598,0},{139,598,0}]
    };
getRow(8)->
    #fashionCollectionLevelCfg {
    level = 8,
    exp = 1500,
    attribute = [{135,7566,0},{136,756,0},{137,756,0},{138,756,0},{139,756,0}]
    };
getRow(9)->
    #fashionCollectionLevelCfg {
    level = 9,
    exp = 1800,
    attribute = [{135,9288,0},{136,928,0},{137,928,0},{138,928,0},{139,928,0}]
    };
getRow(10)->
    #fashionCollectionLevelCfg {
    level = 10,
    exp = 2000,
    attribute = [{135,11145,0},{136,1114,0},{137,1114,0},{138,1114,0},{139,1114,0}]
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
    {10}
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
    10
    ].

