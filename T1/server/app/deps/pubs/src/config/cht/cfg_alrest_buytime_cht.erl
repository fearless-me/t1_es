%% coding: latin-1
%%: 实现
-module(cfg_alrest_buytime_cht).
-compile(export_all).
-include("cfg_alrest_buytime.hrl").
-include("logger.hrl").

getRow(1)->
    #alrest_buytimeCfg {
    id = 1,
    time = 3600,
    price = [103,100],
    limit = 1
    };
getRow(_)->[].

getKeyList()->[
    {1}
    ].

get1KeyList()->[
    1
    ].

