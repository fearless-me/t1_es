%% coding: latin-1
%%: 实现
-module(cfg_treasure_event_cht).
-compile(export_all).
-include("cfg_treasure_event.hrl").


getRow(1)->
    #treasure_eventCfg {
    id = 1,
    event = [{1800,1}]
    };
getRow(_)->[].

getKeyList()->[
    {1}
    ].

get1KeyList()->[
    1
    ].

