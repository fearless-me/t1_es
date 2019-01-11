%% coding: latin-1
%%: 实现
-module(cfg_guild_boss_chs).
-compile(export_all).
-include("cfg_guild_boss.hrl").
-include("logger.hrl").

getRow(1)->
    #guild_bossCfg {
    id = 1,
    bossClass = "一阶",
    monsterID = 3500,
    background = "Textures/Image_npc/NpcShow_546",
    activityreward = [3,13,11,15],
    p_killreward_1 = 500,
    p_killreward_2 = 2400,
    p_Fristreward_1 = 1500,
    p_Fristreward_2 = 7200,
    g_touchreward_2 = 1600,
    g_touchreward_1 = 8000,
    g_killreward_2 = 3200,
    g_killreward_1 = 16000,
    g_Fristreward_2 = 9600,
    g_Fristreward_1 = 48000,
    boss_describe = "家族1阶boss，挑战成功后解锁2阶BOSS。"
    };
getRow(2)->
    #guild_bossCfg {
    id = 2,
    bossClass = "二阶",
    monsterID = 3501,
    background = "Textures/Image_npc/NpcShow_546",
    activityreward = [3,13,11,15],
    p_killreward_1 = 500,
    p_killreward_2 = 2800,
    p_Fristreward_1 = 1650,
    p_Fristreward_2 = 8400,
    g_touchreward_2 = 2000,
    g_touchreward_1 = 9200,
    g_killreward_2 = 3600,
    g_killreward_1 = 18400,
    g_Fristreward_2 = 10800,
    g_Fristreward_1 = 55200,
    boss_describe = "家族2阶boss，挑战成功后解锁3阶BOSS。"
    };
getRow(3)->
    #guild_bossCfg {
    id = 3,
    bossClass = "三阶",
    monsterID = 3502,
    background = "Textures/Image_npc/NpcShow_546",
    activityreward = [3,13,11,15],
    p_killreward_1 = 500,
    p_killreward_2 = 3200,
    p_Fristreward_1 = 1800,
    p_Fristreward_2 = 9600,
    g_touchreward_2 = 2000,
    g_touchreward_1 = 10400,
    g_killreward_2 = 4400,
    g_killreward_1 = 21200,
    g_Fristreward_2 = 13200,
    g_Fristreward_1 = 63600,
    boss_describe = "家族3阶boss，挑战成功后解锁4阶BOSS。"
    };
getRow(4)->
    #guild_bossCfg {
    id = 4,
    bossClass = "四阶",
    monsterID = 3503,
    background = "Textures/Image_npc/NpcShow_546",
    activityreward = [3,13,11,15],
    p_killreward_1 = 500,
    p_killreward_2 = 3600,
    p_Fristreward_1 = 1950,
    p_Fristreward_2 = 10800,
    g_touchreward_2 = 2400,
    g_touchreward_1 = 12000,
    g_killreward_2 = 4800,
    g_killreward_1 = 23600,
    g_Fristreward_2 = 14400,
    g_Fristreward_1 = 70800,
    boss_describe = "家族4阶boss，挑战成功后解锁5阶BOSS。"
    };
getRow(5)->
    #guild_bossCfg {
    id = 5,
    bossClass = "五阶",
    monsterID = 3504,
    background = "Textures/Image_npc/NpcShow_546",
    activityreward = [3,13,11,15],
    p_killreward_1 = 500,
    p_killreward_2 = 4000,
    p_Fristreward_1 = 2100,
    p_Fristreward_2 = 12000,
    g_touchreward_2 = 2800,
    g_touchreward_1 = 13200,
    g_killreward_2 = 5200,
    g_killreward_1 = 26400,
    g_Fristreward_2 = 15600,
    g_Fristreward_1 = 79200,
    boss_describe = "家族5阶boss，挑战成功后解锁6阶BOSS。"
    };
getRow(6)->
    #guild_bossCfg {
    id = 6,
    bossClass = "六阶",
    monsterID = 3505,
    background = "Textures/Image_npc/NpcShow_546",
    activityreward = [3,13,11,15],
    p_killreward_1 = 500,
    p_killreward_2 = 4400,
    p_Fristreward_1 = 2250,
    p_Fristreward_2 = 13200,
    g_touchreward_2 = 2800,
    g_touchreward_1 = 14400,
    g_killreward_2 = 6000,
    g_killreward_1 = 29200,
    g_Fristreward_2 = 18000,
    g_Fristreward_1 = 87600,
    boss_describe = "家族6阶boss，挑战成功后解锁7阶BOSS。"
    };
getRow(7)->
    #guild_bossCfg {
    id = 7,
    bossClass = "七阶",
    monsterID = 3506,
    background = "Textures/Image_npc/NpcShow_546",
    activityreward = [3,13,11,15],
    p_killreward_1 = 500,
    p_killreward_2 = 4800,
    p_Fristreward_1 = 2400,
    p_Fristreward_2 = 14400,
    g_touchreward_2 = 3200,
    g_touchreward_1 = 16000,
    g_killreward_2 = 6400,
    g_killreward_1 = 31600,
    g_Fristreward_2 = 19200,
    g_Fristreward_1 = 94800,
    boss_describe = "家族7阶boss，挑战成功后解锁8阶BOSS。"
    };
getRow(8)->
    #guild_bossCfg {
    id = 8,
    bossClass = "八阶",
    monsterID = 3507,
    background = "Textures/Image_npc/NpcShow_546",
    activityreward = [3,13,11,15],
    p_killreward_1 = 500,
    p_killreward_2 = 5200,
    p_Fristreward_1 = 2550,
    p_Fristreward_2 = 15600,
    g_touchreward_2 = 3600,
    g_touchreward_1 = 17200,
    g_killreward_2 = 6800,
    g_killreward_1 = 34400,
    g_Fristreward_2 = 20400,
    g_Fristreward_1 = 103200,
    boss_describe = "家族8阶boss，挑战成功后解锁9阶BOSS。"
    };
getRow(9)->
    #guild_bossCfg {
    id = 9,
    bossClass = "九阶",
    monsterID = 3508,
    background = "Textures/Image_npc/NpcShow_546",
    activityreward = [3,13,11,15],
    p_killreward_1 = 500,
    p_killreward_2 = 5600,
    p_Fristreward_1 = 2700,
    p_Fristreward_2 = 16800,
    g_touchreward_2 = 3600,
    g_touchreward_1 = 18400,
    g_killreward_2 = 7200,
    g_killreward_1 = 36800,
    g_Fristreward_2 = 21600,
    g_Fristreward_1 = 110400,
    boss_describe = "家族9阶boss，挑战成功后解锁10阶BOSS。"
    };
getRow(10)->
    #guild_bossCfg {
    id = 10,
    bossClass = "十阶",
    monsterID = 3509,
    background = "Textures/Image_npc/NpcShow_546",
    activityreward = [3,13,11,15],
    p_killreward_1 = 500,
    p_killreward_2 = 6000,
    p_Fristreward_1 = 3000,
    p_Fristreward_2 = 18000,
    g_touchreward_2 = 4000,
    g_touchreward_1 = 20000,
    g_killreward_2 = 8000,
    g_killreward_1 = 39600,
    g_Fristreward_2 = 24000,
    g_Fristreward_1 = 118800,
    boss_describe = "家族10阶boss，最高阶BOSS!"
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

