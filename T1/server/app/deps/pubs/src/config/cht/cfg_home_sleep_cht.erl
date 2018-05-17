%% coding: latin-1
%%: 实现
-module(cfg_home_sleep_cht).
-compile(export_all).
-include("cfg_home_sleep.hrl").


getRow(24759)->
    #home_sleepCfg {
    item_id = 24759,
    rate = 3,
    maxmin = 300
    };
getRow(24800)->
    #home_sleepCfg {
    item_id = 24800,
    rate = 3,
    maxmin = 300
    };
getRow(_)->[].

getKeyList()->[
    {24759},
    {24800}
    ].

get1KeyList()->[
    24759,
    24800
    ].

