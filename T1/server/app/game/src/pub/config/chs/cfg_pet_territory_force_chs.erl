%% coding: latin-1
%%: 实现
-module(cfg_pet_territory_force_chs).
-compile(export_all).
-include("cfg_pet_territory_force.hrl").
-include("logger.hrl").

getRow(1)->
    #pet_territory_forceCfg {
    id = 1,
    rate = 1
    };
getRow(15000)->
    #pet_territory_forceCfg {
    id = 15000,
    rate = 1.1
    };
getRow(50000)->
    #pet_territory_forceCfg {
    id = 50000,
    rate = 1.2
    };
getRow(100000)->
    #pet_territory_forceCfg {
    id = 100000,
    rate = 1.3
    };
getRow(150000)->
    #pet_territory_forceCfg {
    id = 150000,
    rate = 1.4
    };
getRow(200000)->
    #pet_territory_forceCfg {
    id = 200000,
    rate = 1.5
    };
getRow(300000)->
    #pet_territory_forceCfg {
    id = 300000,
    rate = 1.6
    };
getRow(400000)->
    #pet_territory_forceCfg {
    id = 400000,
    rate = 1.7
    };
getRow(500000)->
    #pet_territory_forceCfg {
    id = 500000,
    rate = 1.8
    };
getRow(600000)->
    #pet_territory_forceCfg {
    id = 600000,
    rate = 1.9
    };
getRow(700000)->
    #pet_territory_forceCfg {
    id = 700000,
    rate = 2
    };
getRow(_)->[].

getKeyList()->[
    {1},
    {15000},
    {50000},
    {100000},
    {150000},
    {200000},
    {300000},
    {400000},
    {500000},
    {600000},
    {700000}
    ].

get1KeyList()->[
    1,
    15000,
    50000,
    100000,
    150000,
    200000,
    300000,
    400000,
    500000,
    600000,
    700000
    ].

