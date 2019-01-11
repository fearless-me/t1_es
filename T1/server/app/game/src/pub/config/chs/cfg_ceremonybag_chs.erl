%% coding: latin-1
%%: 实现
-module(cfg_ceremonybag_chs).
-compile(export_all).
-include("cfg_ceremonybag.hrl").
-include("logger.hrl").

getRow(1)->
    #ceremonybagCfg {
    id = 1,
    tag = 1,
    announce = 0,
    price = [103,400],
    reward1 = 606,
    limit = [2,2],
    weight1 = 200,
    reward2 = 2601,
    limit2 = [3,3],
    weight2 = 500,
    reward3 = 26239,
    limit3 = [2,2],
    weight3 = 500
    };
getRow(2)->
    #ceremonybagCfg {
    id = 2,
    tag = 1,
    announce = 0,
    price = [103,400],
    reward1 = 606,
    limit = [2,2],
    weight1 = 200,
    reward2 = 221,
    limit2 = [6,6],
    weight2 = 500,
    reward3 = 230,
    limit3 = [4,4],
    weight3 = 500
    };
getRow(3)->
    #ceremonybagCfg {
    id = 3,
    tag = 1,
    announce = 0,
    price = [103,400],
    reward1 = 606,
    limit = [2,2],
    weight1 = 200,
    reward2 = 11000,
    limit2 = [2,2],
    weight2 = 500,
    reward3 = 2160,
    limit3 = [6,6],
    weight3 = 500
    };
getRow(4)->
    #ceremonybagCfg {
    id = 4,
    tag = 1,
    announce = 0,
    price = [103,800],
    reward1 = 606,
    limit = [4,4],
    weight1 = 200,
    reward2 = 271,
    limit2 = [2,2],
    weight2 = 300,
    reward3 = 270,
    limit3 = [2,2],
    weight3 = 500
    };
getRow(5)->
    #ceremonybagCfg {
    id = 5,
    tag = 1,
    announce = 0,
    price = [103,800],
    reward1 = 606,
    limit = [3,3],
    weight1 = 500,
    reward2 = 15215,
    limit2 = [2,2],
    weight2 = 500,
    reward3 = 1802,
    limit3 = [1,1],
    weight3 = 500
    };
getRow(6)->
    #ceremonybagCfg {
    id = 6,
    tag = 1,
    announce = 1,
    price = [103,800],
    reward1 = 606,
    limit = [4,4],
    weight1 = 500,
    reward2 = 29007,
    limit2 = [4,4],
    weight2 = 1000,
    reward3 = 1974,
    limit3 = [1,1],
    weight3 = 270
    };
getRow(7)->
    #ceremonybagCfg {
    id = 7,
    tag = 2,
    announce = 0,
    price = [105,40],
    reward1 = 606,
    limit = [2,2],
    weight1 = 200,
    reward2 = 2601,
    limit2 = [4,4],
    weight2 = 500,
    reward3 = 26239,
    limit3 = [2,2],
    weight3 = 500
    };
getRow(8)->
    #ceremonybagCfg {
    id = 8,
    tag = 2,
    announce = 0,
    price = [105,40],
    reward1 = 606,
    limit = [2,2],
    weight1 = 200,
    reward2 = 221,
    limit2 = [10,10],
    weight2 = 500,
    reward3 = 230,
    limit3 = [5,5],
    weight3 = 500
    };
getRow(9)->
    #ceremonybagCfg {
    id = 9,
    tag = 2,
    announce = 0,
    price = [105,40],
    reward1 = 606,
    limit = [2,2],
    weight1 = 200,
    reward2 = 11000,
    limit2 = [3,3],
    weight2 = 500,
    reward3 = 2160,
    limit3 = [9,9],
    weight3 = 500
    };
getRow(10)->
    #ceremonybagCfg {
    id = 10,
    tag = 2,
    announce = 0,
    price = [105,80],
    reward1 = 606,
    limit = [4,4],
    weight1 = 200,
    reward2 = 271,
    limit2 = [2,2],
    weight2 = 400,
    reward3 = 270,
    limit3 = [2,2],
    weight3 = 500
    };
getRow(11)->
    #ceremonybagCfg {
    id = 11,
    tag = 2,
    announce = 0,
    price = [105,80],
    reward1 = 606,
    limit = [4,4],
    weight1 = 1500,
    reward2 = 15216,
    limit2 = [1,1],
    weight2 = 500,
    reward3 = 1802,
    limit3 = [1,1],
    weight3 = 500
    };
getRow(12)->
    #ceremonybagCfg {
    id = 12,
    tag = 2,
    announce = 1,
    price = [105,80],
    reward1 = 606,
    limit = [4,4],
    weight1 = 500,
    reward2 = 29007,
    limit2 = [4,4],
    weight2 = 1000,
    reward3 = 1974,
    limit3 = [2,2],
    weight3 = 500
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
    {12}
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
    12
    ].

