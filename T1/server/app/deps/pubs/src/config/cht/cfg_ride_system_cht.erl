%% coding: latin-1
%%: 实现
-module(cfg_ride_system_cht).
-compile(export_all).
-include("cfg_ride_system.hrl").
-include("logger.hrl").

getRow(1)->
    #ride_systemCfg {
    id = 1,
    itemID = 25301,
    mapID = 2,
    x = 0,
    y = 0,
    rotw = 0
    };
getRow(2)->
    #ride_systemCfg {
    id = 2,
    itemID = 25302,
    mapID = 6,
    x = 0,
    y = 0,
    rotw = 0
    };
getRow(_)->[].

getKeyList()->[
    {1},
    {2}
    ].

get1KeyList()->[
    1,
    2
    ].

