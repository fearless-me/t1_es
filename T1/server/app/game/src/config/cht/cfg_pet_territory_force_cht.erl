%% coding: latin-1
%%: 实现
-module(cfg_pet_territory_force_cht).
-compile(export_all).
-include("cfg_pet_territory_force.hrl").


getRow(1)->
    #pet_territory_forceCfg {
    id = 1,
    rate = 1
    };
getRow(30000)->
    #pet_territory_forceCfg {
    id = 30000,
    rate = 1
    };
getRow(60000)->
    #pet_territory_forceCfg {
    id = 60000,
    rate = 1
    };
getRow(90000)->
    #pet_territory_forceCfg {
    id = 90000,
    rate = 1
    };
getRow(120000)->
    #pet_territory_forceCfg {
    id = 120000,
    rate = 1
    };
getRow(200000)->
    #pet_territory_forceCfg {
    id = 200000,
    rate = 1
    };
getRow(_)->[].

getKeyList()->[
    {1},
    {30000},
    {60000},
    {90000},
    {120000},
    {200000}
    ].

get1KeyList()->[
    1,
    30000,
    60000,
    90000,
    120000,
    200000
    ].

