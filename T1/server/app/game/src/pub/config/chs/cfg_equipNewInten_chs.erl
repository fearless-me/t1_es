%% coding: latin-1
%%: 实现
-module(cfg_equipNewInten_chs).
-compile(export_all).
-include("cfg_equipNewInten.hrl").
-include("logger.hrl").

getRow(101)->
    #equipNewIntenCfg {
    iD = 101,
    mainHandBonus = [{136,0.5,0},{140,0.6,0}],
    helmBonus = [{135,0.25,0},{139,0.35,0},{143,1,0}],
    offHandBonus = [{136,0.25,0},{144,1,0}],
    chestBonus = [{135,0.38,0},{138,0.5,0},{160,1,0}],
    amuletBonus = [{136,0.25,0},{142,1,0}],
    pantBonus = [{135,0.23,0},{138,0.5,0},{145,1,0}],
    ringBonus = [{140,0.4,0},{141,1,0}],
    bootBonus = [{135,0.14,0},{139,0.65,0},{146,1,0}]
    };
getRow(201)->
    #equipNewIntenCfg {
    iD = 201,
    mainHandBonus = [{137,0.5,0},{140,0.6,0}],
    helmBonus = [{135,0.25,0},{139,0.35,0},{143,1,0}],
    offHandBonus = [{137,0.25,0},{144,1,0}],
    chestBonus = [{135,0.38,0},{138,0.5,0},{160,1,0}],
    amuletBonus = [{137,0.25,0},{142,1,0}],
    pantBonus = [{135,0.23,0},{138,0.5,0},{145,1,0}],
    ringBonus = [{140,0.4,0},{141,1,0}],
    bootBonus = [{135,0.14,0},{139,0.65,0},{146,1,0}]
    };
getRow(301)->
    #equipNewIntenCfg {
    iD = 301,
    mainHandBonus = [{136,0.5,0},{140,0.6,0}],
    helmBonus = [{135,0.25,0},{139,0.35,0},{143,1,0}],
    offHandBonus = [{136,0.25,0},{144,1,0}],
    chestBonus = [{135,0.38,0},{138,0.5,0},{160,1,0}],
    amuletBonus = [{136,0.25,0},{142,1,0}],
    pantBonus = [{135,0.23,0},{138,0.5,0},{145,1,0}],
    ringBonus = [{140,0.4,0},{141,1,0}],
    bootBonus = [{135,0.14,0},{139,0.65,0},{146,1,0}]
    };
getRow(401)->
    #equipNewIntenCfg {
    iD = 401,
    mainHandBonus = [{136,0.5,0},{140,0.6,0}],
    helmBonus = [{135,0.25,0},{139,0.35,0},{143,1,0}],
    offHandBonus = [{136,0.25,0},{144,1,0}],
    chestBonus = [{135,0.38,0},{138,0.5,0},{160,1,0}],
    amuletBonus = [{136,0.25,0},{142,1,0}],
    pantBonus = [{135,0.23,0},{138,0.5,0},{145,1,0}],
    ringBonus = [{140,0.4,0},{141,1,0}],
    bootBonus = [{135,0.14,0},{139,0.65,0},{146,1,0}]
    };
getRow(_)->[].

getKeyList()->[
    {101},
    {201},
    {301},
    {401}
    ].

get1KeyList()->[
    101,
    201,
    301,
    401
    ].

