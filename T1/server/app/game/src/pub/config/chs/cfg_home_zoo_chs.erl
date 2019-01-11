%% coding: latin-1
%%: 实现
-module(cfg_home_zoo_chs).
-compile(export_all).
-include("cfg_home_zoo.hrl").
-include("logger.hrl").

getRow(24786)->
    #home_zooCfg {
    zoo_item = 24786,
    exp_permin = 300,
    maxmin = 180
    };
getRow(24787)->
    #home_zooCfg {
    zoo_item = 24787,
    exp_permin = 400,
    maxmin = 180
    };
getRow(24788)->
    #home_zooCfg {
    zoo_item = 24788,
    exp_permin = 466,
    maxmin = 180
    };
getRow(24789)->
    #home_zooCfg {
    zoo_item = 24789,
    exp_permin = 566,
    maxmin = 180
    };
getRow(24790)->
    #home_zooCfg {
    zoo_item = 24790,
    exp_permin = 666,
    maxmin = 180
    };
getRow(_)->[].

getKeyList()->[
    {24786},
    {24787},
    {24788},
    {24789},
    {24790}
    ].

get1KeyList()->[
    24786,
    24787,
    24788,
    24789,
    24790
    ].

