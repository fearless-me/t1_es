%% coding: latin-1
%%: 实现
-module(cfg_ride_chs).
-compile(export_all).
-include("cfg_ride.hrl").
-include("logger.hrl").

getRow(25200)->
    #rideCfg {
    id = 25200,
    type = 1,
    npcId = 30100,
    maxTimes = 24,
    open = 1,
    costType = 100,
    costValue = 8000,
    playerMax = 6,
    rewardBuff = 61501,
    rewardCost = 0.8,
    rideTime = 300,
    weapon_hiden = 1,
    playspeed = 0.1,
    animation_1 = 1,
    char_scale = 0.5,
    ride_distance = 10,
    ride_npc = 0
    };
getRow(25201)->
    #rideCfg {
    id = 25201,
    type = 2,
    npcId = 30101,
    maxTimes = 24,
    open = 1,
    costType = 100,
    costValue = 8000,
    playerMax = 12,
    rewardBuff = 61901,
    rewardCost = 0.8,
    rideTime = 300,
    weapon_hiden = 1,
    playspeed = 0.1,
    animation_1 = 3,
    char_scale = 0.5,
    ride_distance = 16,
    ride_npc = 0
    };
getRow(25202)->
    #rideCfg {
    id = 25202,
    type = 3,
    npcId = 30102,
    maxTimes = 24,
    open = 1,
    costType = 100,
    costValue = 8000,
    playerMax = 12,
    rewardBuff = 61801,
    rewardCost = 0.8,
    rideTime = 300,
    weapon_hiden = 1,
    playspeed = 0.1,
    animation_1 = 14,
    char_scale = 0.5,
    ride_distance = 16,
    ride_npc = 0
    };
getRow(25203)->
    #rideCfg {
    id = 25203,
    type = 4,
    npcId = 30103,
    maxTimes = 24,
    open = 1,
    costType = 100,
    costValue = 8000,
    playerMax = 6,
    rewardBuff = 61601,
    rewardCost = 0.8,
    rideTime = 300,
    weapon_hiden = 1,
    playspeed = 0.6,
    animation_1 = 13,
    char_scale = 0.5,
    ride_distance = 14,
    ride_npc = 0
    };
getRow(25301)->
    #rideCfg {
    id = 25301,
    type = 5,
    npcId = 30104,
    maxTimes = 1,
    open = 1,
    costType = 100,
    costValue = 8000,
    playerMax = 12,
    rewardBuff = 62001,
    rewardCost = 0.8,
    rideTime = 150,
    weapon_hiden = 1,
    playspeed = 1,
    animation_1 = 13,
    char_scale = 1.8,
    ride_distance = 14,
    ride_npc = 30014
    };
getRow(25302)->
    #rideCfg {
    id = 25302,
    type = 5,
    npcId = 30105,
    maxTimes = 1,
    open = 1,
    costType = 100,
    costValue = 8000,
    playerMax = 12,
    rewardBuff = 62001,
    rewardCost = 0.8,
    rideTime = 150,
    weapon_hiden = 1,
    playspeed = 1,
    animation_1 = 13,
    char_scale = 1,
    ride_distance = 14,
    ride_npc = 30016
    };
getRow(_)->[].

getKeyList()->[
    {25200},
    {25201},
    {25202},
    {25203},
    {25301},
    {25302}
    ].

get1KeyList()->[
    25200,
    25201,
    25202,
    25203,
    25301,
    25302
    ].

