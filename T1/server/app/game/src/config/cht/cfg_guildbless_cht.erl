%% coding: latin-1
%%: 实现
-module(cfg_guildbless_cht).
-compile(export_all).
-include("cfg_guildbless.hrl").


getRow(1)->
    #guildblessCfg {
    typ = 1,
    rate = 0,
    contribute = 800,
    guildresource = 0,
    guildliveness = 40,
    cost = 20000,
    costtype = 100
    };
getRow(2)->
    #guildblessCfg {
    typ = 2,
    rate = 0,
    contribute = 1600,
    guildresource = 0,
    guildliveness = 80,
    cost = 40,
    costtype = 103
    };
getRow(3)->
    #guildblessCfg {
    typ = 3,
    rate = 0,
    contribute = 4800,
    guildresource = 0,
    guildliveness = 240,
    cost = 100,
    costtype = 103
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

