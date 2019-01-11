%% coding: latin-1
%%: 实现
-module(cfg_pet_stronger_chs).
-compile(export_all).
-include("cfg_pet_stronger.hrl").
-include("logger.hrl").

getRow(135)->
    #pet_strongerCfg {
    stronger_id = 135,
    point_1 = 0,
    value_1 = [45,134],
    point_2 = 0.05,
    value_2 = [45,134],
    point_3 = 0.15,
    value_3 = [45,134],
    point_4 = 0.35,
    value_4 = [45,134],
    point_5 = 0.7,
    value_5 = [45,134],
    info = "生命",
    maxvalue = 134000,
    battlepower = 500
    };
getRow(136)->
    #pet_strongerCfg {
    stronger_id = 136,
    point_1 = 0,
    value_1 = [4,13],
    point_2 = 0.05,
    value_2 = [4,13],
    point_3 = 0.15,
    value_3 = [4,13],
    point_4 = 0.35,
    value_4 = [4,13],
    point_5 = 0.7,
    value_5 = [4,13],
    info = "物理攻击",
    maxvalue = 13000,
    battlepower = 500
    };
getRow(137)->
    #pet_strongerCfg {
    stronger_id = 137,
    point_1 = 0,
    value_1 = [4,13],
    point_2 = 0.05,
    value_2 = [4,13],
    point_3 = 0.15,
    value_3 = [4,13],
    point_4 = 0.35,
    value_4 = [4,13],
    point_5 = 0.7,
    value_5 = [4,13],
    info = "魔法攻击",
    maxvalue = 13000,
    battlepower = 500
    };
getRow(138)->
    #pet_strongerCfg {
    stronger_id = 138,
    point_1 = 0,
    value_1 = [4,13],
    point_2 = 0.05,
    value_2 = [4,13],
    point_3 = 0.15,
    value_3 = [4,13],
    point_4 = 0.35,
    value_4 = [4,13],
    point_5 = 0.7,
    value_5 = [4,13],
    info = "物理防御",
    maxvalue = 13000,
    battlepower = 250
    };
getRow(139)->
    #pet_strongerCfg {
    stronger_id = 139,
    point_1 = 0,
    value_1 = [4,13],
    point_2 = 0.05,
    value_2 = [4,13],
    point_3 = 0.15,
    value_3 = [4,13],
    point_4 = 0.35,
    value_4 = [4,13],
    point_5 = 0.7,
    value_5 = [4,13],
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

