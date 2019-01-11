%% coding: latin-1
%%: 实现
-module(cfg_warriortrial_battle_power_chs).
-compile(export_all).
-include("cfg_warriortrial_battle_power.hrl").
-include("logger.hrl").

getRow(1)->
    #warriortrial_battle_powerCfg {
    id = 1,
    playerLessCommand = 1,
    warriortrial_battle_power_effect = [{135,1.1},{136,1.1},{137,1.1},{138,1.1},{139,1.1},{140,1.5},{141,1.5},{142,1.5},{143,1.5},{144,1.5},{145,1.5},{146,1.5},{160,1.5}]
    };
getRow(2)->
    #warriortrial_battle_powerCfg {
    id = 2,
    playerLessCommand = 0.9,
    warriortrial_battle_power_effect = [{135,1.5},{136,1.5},{137,1.5},{138,1.5},{139,1.5},{140,2},{141,2},{142,2},{143,2},{144,2},{145,2},{146,2},{160,2}]
    };
getRow(3)->
    #warriortrial_battle_powerCfg {
    id = 3,
    playerLessCommand = 0.8,
    warriortrial_battle_power_effect = [{135,2},{136,2},{137,2},{138,2},{139,2},{140,2.5},{141,2.5},{142,2.5},{143,2.5},{144,2.5},{145,2.5},{146,2.5},{160,2.5}]
    };
getRow(4)->
    #warriortrial_battle_powerCfg {
    id = 4,
    playerLessCommand = 0.7,
    warriortrial_battle_power_effect = [{135,2.5},{136,2.5},{137,2.5},{138,2.5},{139,2.5},{140,3},{141,3},{142,3},{143,3},{144,3},{145,3},{146,3},{160,3}]
    };
getRow(5)->
    #warriortrial_battle_powerCfg {
    id = 5,
    playerLessCommand = 0.6,
    warriortrial_battle_power_effect = [{135,3},{136,3},{137,3},{138,3},{139,3},{140,3.5},{141,3.5},{142,3.5},{143,3.5},{144,3.5},{145,3.5},{146,3.5},{160,3.5}]
    };
getRow(6)->
    #warriortrial_battle_powerCfg {
    id = 6,
    playerLessCommand = 0.5,
    warriortrial_battle_power_effect = [{135,3.5},{136,3.5},{137,3.5},{138,3.5},{139,3.5},{140,4},{141,4},{142,4},{143,4},{144,4},{145,4},{146,4},{160,4}]
    };
getRow(7)->
    #warriortrial_battle_powerCfg {
    id = 7,
    playerLessCommand = 0.4,
    warriortrial_battle_power_effect = [{135,4},{136,4},{137,4},{138,4},{139,4},{140,4.5},{141,4.5},{142,4.5},{143,4.5},{144,4.5},{145,4.5},{146,4.5},{160,4.5}]
    };
getRow(8)->
    #warriortrial_battle_powerCfg {
    id = 8,
    playerLessCommand = 0.3,
    warriortrial_battle_power_effect = [{135,4.5},{136,4.5},{137,4.5},{138,4.5},{139,4.5},{140,5},{141,5},{142,5},{143,5},{144,5},{145,5},{146,5},{160,5}]
    };
getRow(9)->
    #warriortrial_battle_powerCfg {
    id = 9,
    playerLessCommand = 0.199999999999999,
    warriortrial_battle_power_effect = [{135,5},{136,5},{137,5},{138,5},{139,5},{140,5.5},{141,5.5},{142,5.5},{143,5.5},{144,5.5},{145,5.5},{146,5.5},{160,5.5}]
    };
getRow(10)->
    #warriortrial_battle_powerCfg {
    id = 10,
    playerLessCommand = 0.099999999999998,
    warriortrial_battle_power_effect = [{135,5.5},{136,5.5},{137,5.5},{138,5.5},{139,5.5},{140,6},{141,6},{142,6},{143,6},{144,6},{145,6},{146,6},{160,6}]
    };
getRow(_)->[].

getKeyList()->[
    {1},
    {2},
    {3},
    {4},
    {5},
    {6},
    {7},
    {8},
    {9},
    {10}
    ].

get1KeyList()->[
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9,
    10
    ].

