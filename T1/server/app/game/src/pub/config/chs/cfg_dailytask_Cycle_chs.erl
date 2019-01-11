%% coding: latin-1
%%: 实现
-module(cfg_dailytask_Cycle_chs).
-compile(export_all).
-include("cfg_dailytask_Cycle.hrl").
-include("logger.hrl").

getRow(37)->
    #dailytask_CycleCfg {
    level = 37,
    group = 2
    };
getRow(43)->
    #dailytask_CycleCfg {
    level = 43,
    group = 3
    };
getRow(53)->
    #dailytask_CycleCfg {
    level = 53,
    group = 4
    };
getRow(60)->
    #dailytask_CycleCfg {
    level = 60,
    group = 5
    };
getRow(70)->
    #dailytask_CycleCfg {
    level = 70,
    group = 6
    };
getRow(75)->
    #dailytask_CycleCfg {
    level = 75,
    group = 7
    };
getRow(80)->
    #dailytask_CycleCfg {
    level = 80,
    group = 8
    };
getRow(85)->
    #dailytask_CycleCfg {
    level = 85,
    group = 9
    };
getRow(90)->
    #dailytask_CycleCfg {
    level = 90,
    group = 10
    };
getRow(100)->
    #dailytask_CycleCfg {
    level = 100,
    group = 11
    };
getRow(110)->
    #dailytask_CycleCfg {
    level = 110,
    group = 12
    };
getRow(120)->
    #dailytask_CycleCfg {
    level = 120,
    group = 13
    };
getRow(130)->
    #dailytask_CycleCfg {
    level = 130,
    group = 14
    };
getRow(140)->
    #dailytask_CycleCfg {
    level = 140,
    group = 15
    };
getRow(150)->
    #dailytask_CycleCfg {
    level = 150,
    group = 16
    };
getRow(160)->
    #dailytask_CycleCfg {
    level = 160,
    group = 17
    };
getRow(170)->
    #dailytask_CycleCfg {
    level = 170,
    group = 18
    };
getRow(180)->
    #dailytask_CycleCfg {
    level = 180,
    group = 19
    };
getRow(190)->
    #dailytask_CycleCfg {
    level = 190,
    group = 20
    };
getRow(200)->
    #dailytask_CycleCfg {
    level = 200,
    group = 21
    };
getRow(210)->
    #dailytask_CycleCfg {
    level = 210,
    group = 22
    };
getRow(_)->[].

getKeyList()->[
    {37},
    {43},
    {53},
    {60},
    {70},
    {75},
    {80},
    {85},
    {90},
    {100},
    {110},
    {120},
    {130},
    {140},
    {150},
    {160},
    {170},
    {180},
    {190},
    {200},
    {210}
    ].

get1KeyList()->[
    37,
    43,
    53,
    60,
    70,
    75,
    80,
    85,
    90,
    100,
    110,
    120,
    130,
    140,
    150,
    160,
    170,
    180,
    190,
    200,
    210
    ].

