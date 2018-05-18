%% coding: latin-1
%%: 实现
-module(cfg_guild_league_cht).
-compile(export_all).
-include("cfg_guild_league.hrl").


getRow(1)->
    #guild_leagueCfg {
    id = 1,
    patriarch = [{29001,1},{29002,1}],
    big_Elders = [{29001,1},{29002,1}],
    elders = [{29001,1},{29002,1}],
    elite = [{29001,1},{29002,1}]
    };
getRow(2)->
    #guild_leagueCfg {
    id = 2,
    patriarch = [{29001,1},{29002,1}],
    big_Elders = [{29001,1},{29002,1}],
    elders = [{29001,1},{29002,1}],
    elite = [{29001,1},{29002,1}]
    };
getRow(3)->
    #guild_leagueCfg {
    id = 3,
    patriarch = [{29001,1},{29002,1}],
    big_Elders = [{29001,1},{29002,1}],
    elders = [{29001,1},{29002,1}],
    elite = [{29001,1},{29002,1}]
    };
getRow(4)->
    #guild_leagueCfg {
    id = 4,
    patriarch = [{29001,1},{29002,1}],
    big_Elders = [{29001,1},{29002,1}],
    elders = [{29001,1},{29002,1}],
    elite = [{29001,1},{29002,1}]
    };
getRow(5)->
    #guild_leagueCfg {
    id = 5,
    patriarch = [{29001,1},{29002,1}],
    big_Elders = [{29001,1},{29002,1}],
    elders = [{29001,1},{29002,1}],
    elite = [{29001,1},{29002,1}]
    };
getRow(6)->
    #guild_leagueCfg {
    id = 6,
    patriarch = [{29001,1},{29002,1}],
    big_Elders = [{29001,1},{29002,1}],
    elders = [{29001,1},{29002,1}],
    elite = [{29001,1},{29002,1}]
    };
getRow(7)->
    #guild_leagueCfg {
    id = 7,
    patriarch = [{29001,1},{29002,1}],
    big_Elders = [{29001,1},{29002,1}],
    elders = [{29001,1},{29002,1}],
    elite = [{29001,1},{29002,1}]
    };
getRow(8)->
    #guild_leagueCfg {
    id = 8,
    patriarch = [{29001,1},{29002,1}],
    big_Elders = [{29001,1},{29002,1}],
    elders = [{29001,1},{29002,1}],
    elite = [{29001,1},{29002,1}]
    };
getRow(9)->
    #guild_leagueCfg {
    id = 9,
    patriarch = [{29001,1},{29002,1}],
    big_Elders = [{29001,1},{29002,1}],
    elders = [{29001,1},{29002,1}],
    elite = [{29001,1},{29002,1}]
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

