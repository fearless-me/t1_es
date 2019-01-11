%% coding: latin-1
%%: 实现
-module(cfg_guild_league_chs).
-compile(export_all).
-include("cfg_guild_league.hrl").
-include("logger.hrl").

getRow(1)->
    #guild_leagueCfg {
    id = 1,
    patriarch = [{15101,1},{15104,1}],
    big_Elders = [{15101,1},{15104,1}],
    elders = [{15101,1},{15104,1}],
    elite = [{15101,1},{15104,1}]
    };
getRow(2)->
    #guild_leagueCfg {
    id = 2,
    patriarch = [{15102,1},{15104,1}],
    big_Elders = [{15102,1},{15104,1}],
    elders = [{15102,1},{15104,1}],
    elite = [{15102,1},{15104,1}]
    };
getRow(3)->
    #guild_leagueCfg {
    id = 3,
    patriarch = [{15103,1},{15104,1}],
    big_Elders = [{15103,1},{15104,1}],
    elders = [{15103,1},{15104,1}],
    elite = [{15103,1},{15104,1}]
    };
getRow(4)->
    #guild_leagueCfg {
    id = 4,
    patriarch = [{15105,1}],
    big_Elders = [{15105,1}],
    elders = [{15105,1}],
    elite = [{15105,1}]
    };
getRow(5)->
    #guild_leagueCfg {
    id = 5,
    patriarch = [{15105,1}],
    big_Elders = [{15105,1}],
    elders = [{15105,1}],
    elite = [{15105,1}]
    };
getRow(6)->
    #guild_leagueCfg {
    id = 6,
    patriarch = [{15105,1}],
    big_Elders = [{15105,1}],
    elders = [{15105,1}],
    elite = [{15105,1}]
    };
getRow(7)->
    #guild_leagueCfg {
    id = 7,
    patriarch = [{15105,1}],
    big_Elders = [{15105,1}],
    elders = [{15105,1}],
    elite = [{15105,1}]
    };
getRow(8)->
    #guild_leagueCfg {
    id = 8,
    patriarch = [{15105,1}],
    big_Elders = [{15105,1}],
    elders = [{15105,1}],
    elite = [{15105,1}]
    };
getRow(9)->
    #guild_leagueCfg {
    id = 9,
    patriarch = [{15105,1}],
    big_Elders = [{15105,1}],
    elders = [{15105,1}],
    elite = [{15105,1}]
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
    {9}
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
    9
    ].

