%% coding: latin-1
%%: 实现
-module(cfg_pet_stronger_cht).
-compile(export_all).
-include("cfg_pet_stronger.hrl").
-include("logger.hrl").

getRow(135)->
    #pet_strongerCfg {
    stronger_id = 135,
    point_1 = 0,
    value_1 = [33,100],
    point_2 = 0.05,
    value_2 = [33,100],
    point_3 = 0.15,
    value_3 = [33,100],
    point_4 = 0.35,
    value_4 = [33,100],
    point_5 = 0.7,
    value_5 = [33,100],
    info = "生命",
    maxvalue = 134000,
    battlepower = 500
    };
getRow(136)->
    #pet_strongerCfg {
    stronger_id = 136,
    point_1 = 0,
    value_1 = [3,10],
    point_2 = 0.05,
    value_2 = [3,10],
    point_3 = 0.15,
    value_3 = [3,10],
    point_4 = 0.35,
    value_4 = [3,10],
    point_5 = 0.7,
    value_5 = [3,10],
    info = "物理攻击",
    maxvalue = 13000,
    battlepower = 500
    };
getRow(137)->
    #pet_strongerCfg {
    stronger_id = 137,
    point_1 = 0,
    value_1 = [3,10],
    point_2 = 0.05,
    value_2 = [3,10],
    point_3 = 0.15,
    value_3 = [3,10],
    point_4 = 0.35,
    value_4 = [3,10],
    point_5 = 0.7,
    value_5 = [3,10],
    info = "魔法攻击",
    maxvalue = 13000,
    battlepower = 500
    };
getRow(138)->
    #pet_strongerCfg {
    stronger_id = 138,
    point_1 = 0,
    value_1 = [3,10],
    point_2 = 0.05,
    value_2 = [3,10],
    point_3 = 0.15,
    value_3 = [3,10],
    point_4 = 0.35,
    value_4 = [3,10],
    point_5 = 0.7,
    value_5 = [3,10],
    info = "物理防御",
    maxvalue = 13000,
    battlepower = 250
    };
getRow(139)->
    #pet_strongerCfg {
    stronger_id = 139,
    point_1 = 0,
    value_1 = [3,10],
    point_2 = 0.05,
    value_2 = [3,10],
    point_3 = 0.15,
    value_3 = [3,10],
    point_4 = 0.35,
    value_4 = [3,10],
    point_5 = 0.7,
    value_5 = [3,10],
    info = "魔法防御",
    maxvalue = 13000,
    battlepower = 250
    };
getRow(_)->[].

getKeyList()->[
    {135},
    {136},
    {137},
    {138},
    {139}
    ].

get1KeyList()->[
    135,
    136,
    137,
    138,
    139
    ].

