%% coding: latin-1
%%: 实现
-module(cfg_alrest_buytime_chs).
-compile(export_all).
-include("cfg_alrest_buytime.hrl").
-include("logger.hrl").

getRow(1)->
    #alrest_buytimeCfg {
    id = 1,
    time = 300,
    price = [103,500],
    limit = 1
    };
getRow(2)->
    #alrest_buytimeCfg {
    id = 2,
    time = 600,
    price = [105,80],
    limit = 1
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

