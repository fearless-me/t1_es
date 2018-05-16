%% coding: latin-1
%%: 实现
-module(cfg_basic_head_cht).
-compile(export_all).
-include("cfg_basic_head.hrl").
-include("logger.hrl").

getRow(1)->
    #basic_headCfg {
    id = 1,
    icon = [11010,10010,20010,21010],
    icon_for_creat = [11010,10010,20010,21010],
    model = ["10fashion/head_10_1","11fashion/head_11_2","20fashion/head_90_2","21fashion/head_91_3"]
    };
getRow(2)->
    #basic_headCfg {
    id = 2,
    icon = [10030,11030,20020,21020],
    icon_for_creat = [10030,11030,20020,21020],
    model = ["10fashion/head_10_2","11fashion/head_11_1","20fashion/head_90_3","21fashion/head_91_2"]
    };
getRow(3)->
    #basic_headCfg {
    id = 3,
    icon = [10020,11020,20030,21030],
    icon_for_creat = [10020,11020,20030,21030],
    model = ["10fashion/head_90_1","11fashion/head_91_1","20fashion/head_10_3","21fashion/head_11_3"]
    };
getRow(_)->[].

getKeyList()->[
    {1},
    {2},
    {3}
    ].

get1KeyList()->[
    1,
    2,
    3
    ].

