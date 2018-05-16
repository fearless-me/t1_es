%% coding: latin-1
%%: 实现
-module(cfg_guildsnoman_settle_cht).
-compile(export_all).
-include("cfg_guildsnoman_settle.hrl").
-include("logger.hrl").

getRow(1)->
    #guildsnoman_settleCfg {
    id = 1,
    rl = [43000,4900],
    coin = [{12,2800},{6,100}],
    volume = 100
    };
getRow(2)->
    #guildsnoman_settleCfg {
    id = 2,
    rl = [49000,5600],
    coin = [{12,3200},{6,100}],
    volume = 120
    };
getRow(3)->
    #guildsnoman_settleCfg {
    id = 3,
    rl = [56000,6400],
    coin = [{12,3600},{6,100}],
    volume = 140
    };
getRow(4)->
    #guildsnoman_settleCfg {
    id = 4,
    rl = [62000,7100],
    coin = [{12,4100},{6,100}],
    volume = 160
    };
getRow(5)->
    #guildsnoman_settleCfg {
    id = 5,
    rl = [69000,7800],
    coin = [{12,4500},{6,100}],
    volume = 180
    };
getRow(6)->
    #guildsnoman_settleCfg {
    id = 6,
    rl = [75000,8600],
    coin = [{12,4900},{6,100}],
    volume = 200
    };
getRow(7)->
    #guildsnoman_settleCfg {
    id = 7,
    rl = [81000,9300],
    coin = [{12,5300},{6,100}],
    volume = 220
    };
getRow(8)->
    #guildsnoman_settleCfg {
    id = 8,
    rl = [88000,10000],
    coin = [{12,5700},{6,100}],
    volume = 240
    };
getRow(9)->
    #guildsnoman_settleCfg {
    id = 9,
    rl = [94000,10800],
    coin = [{12,6200},{6,100}],
    volume = 260
    };
getRow(10)->
    #guildsnoman_settleCfg {
    id = 10,
    rl = [101000,11500],
    coin = [{12,6600},{6,100}],
    volume = 280
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

