%% coding: latin-1
%%: 实现
-module(cfg_guild_boss_cht).
-compile(export_all).
-include("cfg_guild_boss.hrl").


getRow(1)->
    #guild_bossCfg {
    id = 1,
    bossClass = "一阶",
    monsterID = 3500,
    background = "Textures/Image_npc/NpcShow_546",
    activityreward = [3,13,11,15],
    p_killreward_1 = 50,
    p_killreward_2 = 2400,
    p_Fristreward_1 = 250,
    p_Fristreward_2 = 12000,
    g_touchreward_2 = 2100,
    g_touchreward_1 = 36800,
    g_killreward_2 = 2100,
    g_killreward_1 = 55200,
    g_Fristreward_2 = 11000,
    g_Fristreward_1 = 280000,
    boss_describe = "家族1阶boss，挑战成功后解锁2阶BOSS。"
    };
getRow(2)->
    #guild_bossCfg {
    id = 2,
    bossClass = "二阶",
    monsterID = 3501,
    background = "Textures/Image_npc/NpcShow_546",
    activityreward = [3,13,11,15],
    p_killreward_1 = 50,
    p_killreward_2 = 2800,
    p_Fristreward_1 = 275,
    p_Fristreward_2 = 14000,
    g_touchreward_2 = 2450,
    g_touchreward_1 = 42900,
    g_killreward_2 = 2450,
    g_killreward_1 = 64350,
    g_Fristreward_2 = 12000,
    g_Fristreward_1 = 320000,
    boss_describe = "家族2阶boss，挑战成功后解锁3阶BOSS。"
    };
getRow(3)->
    #guild_bossCfg {
    id = 3,
    bossClass = "三阶",
    monsterID = 3502,
    background = "Textures/Image_npc/NpcShow_546",
    activityreward = [3,13,11,15],
    p_killreward_1 = 50,
    p_killreward_2 = 3200,
    p_Fristreward_1 = 300,
    p_Fristreward_2 = 16000,
    g_touchreward_2 = 2800,
    g_touchreward_1 = 49000,
    g_killreward_2 = 2800,
    g_killreward_1 = 73500,
    g_Fristreward_2 = 14000,
    g_Fristreward_1 = 370000,
    boss_describe = "家族3阶boss，挑战成功后解锁4阶BOSS。"
    };
getRow(4)->
    #guild_bossCfg {
    id = 4,
    bossClass = "四阶",
    monsterID = 3503,
    background = "Textures/Image_npc/NpcShow_546",
    activityreward = [3,13,11,15],
    p_killreward_1 = 50,
    p_killreward_2 = 3600,
    p_Fristreward_1 = 325,
    p_Fristreward_2 = 18000,
    g_touchreward_2 = 3150,
    g_touchreward_1 = 55100,
    g_killreward_2 = 3150,
    g_killreward_1 = 82650,
    g_Fristreward_2 = 16000,
    g_Fristreward_1 = 410000,
    boss_describe = "家族4阶boss，挑战成功后解锁5阶BOSS。"
    };
getRow(5)->
    #guild_bossCfg {
    id = 5,
    bossClass = "五阶",
    monsterID = 3504,
    background = "Textures/Image_npc/NpcShow_546",
    activityreward = [3,13,11,15],
    p_killreward_1 = 50,
    p_killreward_2 = 4000,
    p_Fristreward_1 = 350,
    p_Fristreward_2 = 20000,
    g_touchreward_2 = 3500,
    g_touchreward_1 = 61300,
    g_killreward_2 = 3500,
    g_killreward_1 = 91950,
    g_Fristreward_2 = 18000,
    g_Fristreward_1 = 460000,
    boss_describe = "家族5阶boss，挑战成功后解锁6阶BOSS。"
    };
getRow(6)->
    #guild_bossCfg {
    id = 6,
    bossClass = "六阶",
    monsterID = 3505,
    background = "Textures/Image_npc/NpcShow_546",
    activityreward = [3,13,11,15],
    p_killreward_1 = 50,
    p_killreward_2 = 4400,
    p_Fristreward_1 = 375,
    p_Fristreward_2 = 22000,
    g_touchreward_2 = 3850,
    g_touchreward_1 = 67400,
    g_killreward_2 = 3850,
    g_killreward_1 = 101100,
    g_Fristreward_2 = 19000,
    g_Fristreward_1 = 510000,
    boss_describe = "家族6阶boss，挑战成功后解锁7阶BOSS。"
    };
getRow(7)->
    #guild_bossCfg {
    id = 7,
    bossClass = "七阶",
    monsterID = 3506,
    background = "Textures/Image_npc/NpcShow_546",
    activityreward = [3,13,11,15],
    p_killreward_1 = 50,
    p_killreward_2 = 4800,
    p_Fristreward_1 = 400,
    p_Fristreward_2 = 24000,
    g_touchreward_2 = 4200,
    g_touchreward_1 = 73500,
    g_killreward_2 = 4200,
    g_killreward_1 = 110250,
    g_Fristreward_2 = 21000,
    g_Fristreward_1 = 550000,
    boss_describe = "家族7阶boss，挑战成功后解锁8阶BOSS。"
    };
getRow(8)->
    #guild_bossCfg {
    id = 8,
    bossClass = "八阶",
    monsterID = 3507,
    background = "Textures/Image_npc/NpcShow_546",
    activityreward = [3,13,11,15],
    p_killreward_1 = 50,
    p_killreward_2 = 5200,
    p_Fristreward_1 = 425,
    p_Fristreward_2 = 26000,
    g_touchreward_2 = 4550,
    g_touchreward_1 = 79600,
    g_killreward_2 = 4550,
    g_killreward_1 = 119400,
    g_Fristreward_2 = 23000,
    g_Fristreward_1 = 600000,
    boss_describe = "家族8阶boss，挑战成功后解锁9阶BOSS。"
    };
getRow(9)->
    #guild_bossCfg {
    id = 9,
    bossClass = "九阶",
    monsterID = 3508,
    background = "Textures/Image_npc/NpcShow_546",
    activityreward = [3,13,11,15],
    p_killreward_1 = 50,
    p_killreward_2 = 5600,
    p_Fristreward_1 = 450,
    p_Fristreward_2 = 28000,
    g_touchreward_2 = 4900,
    g_touchreward_1 = 85800,
    g_killreward_2 = 4900,
    g_killreward_1 = 128700,
    g_Fristreward_2 = 25000,
    g_Fristreward_1 = 640000,
    boss_describe = "家族9阶boss，挑战成功后解锁10阶BOSS。"
    };
getRow(10)->
    #guild_bossCfg {
    id = 10,
    bossClass = "十阶",
    monsterID = 3509,
    background = "Textures/Image_npc/NpcShow_546",
    activityreward = [3,13,11,15],
    p_killreward_1 = 50,
    p_killreward_2 = 6000,
    p_Fristreward_1 = 500,
    p_Fristreward_2 = 30000,
    g_touchreward_2 = 5250,
    g_touchreward_1 = 91900,
    g_killreward_2 = 5250,
    g_killreward_1 = 137850,
    g_Fristreward_2 = 26000,
    g_Fristreward_1 = 690000,
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

