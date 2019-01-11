%% coding: latin-1
%%: 实现
-module(cfg_guild_chs).
-compile(export_all).
-include("cfg_guild.hrl").
-include("logger.hrl").

getRow(1)->
    #guildCfg {
    id = 1,
    max_res = 300000,
    max_liv = 100000,
    need_res = 200000,
    need_liv = 80000,
    member_number = 50,
    leader_1 = 2,
    leader_2 = 15,
    shop_upgrade = [],
    reward = [1000,500,300,100],
    snowman = 1
    };
getRow(2)->
    #guildCfg {
    id = 2,
    max_res = 500000,
    max_liv = 180000,
    need_res = 400000,
    need_liv = 140000,
    member_number = 50,
    leader_1 = 2,
    leader_2 = 15,
    shop_upgrade = [],
    reward = [1000,500,300,101],
    snowman = 1
    };
getRow(3)->
    #guildCfg {
    id = 3,
    max_res = 900000,
    max_liv = 260000,
    need_res = 700000,
    need_liv = 200000,
    member_number = 50,
    leader_1 = 2,
    leader_2 = 15,
    shop_upgrade = [],
    reward = [1000,500,300,102],
    snowman = 1
    };
getRow(4)->
    #guildCfg {
    id = 4,
    max_res = 1400000,
    max_liv = 400000,
    need_res = 1100000,
    need_liv = 310000,
    member_number = 50,
    leader_1 = 2,
    leader_2 = 15,
    shop_upgrade = [],
    reward = [1000,500,300,103],
    snowman = 1
    };
getRow(5)->
    #guildCfg {
    id = 5,
    max_res = 1600000,
    max_liv = 430000,
    need_res = 1200000,
    need_liv = 330000,
    member_number = 50,
    leader_1 = 2,
    leader_2 = 15,
    shop_upgrade = [],
    reward = [1000,500,300,103],
    snowman = 1
    };
getRow(6)->
    #guildCfg {
    id = 6,
    max_res = 1700000,
    max_liv = 460000,
    need_res = 1300000,
    need_liv = 350000,
    member_number = 50,
    leader_1 = 2,
    leader_2 = 15,
    shop_upgrade = [],
    reward = [1000,500,300,103],
    snowman = 1
    };
getRow(7)->
    #guildCfg {
    id = 7,
    max_res = 1800000,
    max_liv = 480000,
    need_res = 1400000,
    need_liv = 370000,
    member_number = 50,
    leader_1 = 2,
    leader_2 = 15,
    shop_upgrade = [],
    reward = [1000,500,300,103],
    snowman = 1
    };
getRow(8)->
    #guildCfg {
    id = 8,
    max_res = 2900000,
    max_liv = 750000,
    need_res = 2200000,
    need_liv = 580000,
    member_number = 50,
    leader_1 = 2,
    leader_2 = 15,
    shop_upgrade = [],
    reward = [1000,500,300,103],
    snowman = 1
    };
getRow(9)->
    #guildCfg {
    id = 9,
    max_res = 3000000,
    max_liv = 790000,
    need_res = 2300000,
    need_liv = 610000,
    member_number = 50,
    leader_1 = 2,
    leader_2 = 15,
    shop_upgrade = [],
    reward = [1000,500,300,103],
    snowman = 1
    };
getRow(10)->
    #guildCfg {
    id = 10,
    max_res = 3300000,
    max_liv = 830000,
    need_res = 2500000,
    need_liv = 640000,
    member_number = 50,
    leader_1 = 2,
    leader_2 = 15,
    shop_upgrade = [],
    reward = [1000,500,300,103],
    snowman = 1
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

