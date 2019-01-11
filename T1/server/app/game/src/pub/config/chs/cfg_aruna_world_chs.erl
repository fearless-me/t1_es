%% coding: latin-1
%%: 实现
-module(cfg_aruna_world_chs).
-compile(export_all).
-include("cfg_aruna_world.hrl").
-include("logger.hrl").

getRow(1)->
    #aruna_worldCfg {
    id = 1,
    sample_value = 1500000,
    mapid = 50,
    worldlevel = 160,
    duration = 10,
    extra = 200,
    reward_rank = 250,
    reward_Currency = 2000,
    reward = [{226,2},{13001,1}],
    desc = "[A6a8a9]世界一·[-] [ff9806]魔族入侵[-]",
    minlevel = 1
    };
getRow(2)->
    #aruna_worldCfg {
    id = 2,
    sample_value = 2700000,
    mapid = 54,
    worldlevel = 160,
    duration = 20,
    extra = 200,
    reward_rank = 250,
    reward_Currency = 2000,
    reward = [{226,2},{13001,1}],
    desc = "[A6a8a9]世界二·[-] [ff9806]夜袭敌营[-]",
    minlevel = 90
    };
getRow(3)->
    #aruna_worldCfg {
    id = 3,
    sample_value = 3200000,
    mapid = 51,
    worldlevel = 160,
    duration = 30,
    extra = 200,
    reward_rank = 250,
    reward_Currency = 2000,
    reward = [{226,2},{13001,1}],
    desc = "[A6a8a9]世界三·[-] [ff9808]乘胜追击[-]",
    minlevel = 115
    };
getRow(4)->
    #aruna_worldCfg {
    id = 4,
    sample_value = 4400000,
    mapid = 55,
    worldlevel = 160,
    duration = 40,
    extra = 200,
    reward_rank = 250,
    reward_Currency = 2000,
    reward = [{226,2},{13001,1}],
    desc = "[A6a8a9]世界四·[-] [ff9809]无尽长夜[-]",
    minlevel = 135
    };
getRow(5)->
    #aruna_worldCfg {
    id = 5,
    sample_value = 5300000,
    mapid = 52,
    worldlevel = 180,
    duration = 40,
    extra = 200,
    reward_rank = 250,
    reward_Currency = 2000,
    reward = [{226,2},{13001,1}],
    desc = "[A6a8a9]世界五·[-] [ff9809]深入腹地[-]",
    minlevel = 155
    };
getRow(6)->
    #aruna_worldCfg {
    id = 6,
    sample_value = 5500000,
    mapid = 56,
    worldlevel = 200,
    duration = 40,
    extra = 200,
    reward_rank = 250,
    reward_Currency = 2000,
    reward = [{226,2},{13001,1}],
    desc = "[A6a8a9]世界六·[-] [ff9809]恐怖之夜[-]",
    minlevel = 175
    };
getRow(7)->
    #aruna_worldCfg {
    id = 7,
    sample_value = 6300000,
    mapid = 53,
    worldlevel = 210,
    duration = 40,
    extra = 200,
    reward_rank = 250,
    reward_Currency = 2000,
    reward = [{226,2},{13001,1}],
    desc = "[A6a8a9]世界七·[-] [ff9809]最后一战[-]",
    minlevel = 195
    };
getRow(_)->[].

getKeyList()->[
    {1},
    {2},
    {3},
    {4},
    {5},
    {6},
    {7}
    ].

get1KeyList()->[
    1,
    2,
    3,
    4,
    5,
    6,
    7
    ].

