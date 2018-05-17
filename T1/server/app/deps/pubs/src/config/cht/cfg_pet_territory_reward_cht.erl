%% coding: latin-1
%%: 实现
-module(cfg_pet_territory_reward_cht).
-compile(export_all).
-include("cfg_pet_territory_reward.hrl").


getRow(17)->
    #pet_territory_rewardCfg {
    id = 17,
    reward = [{201,4},{601,16}]
    };
getRow(30)->
    #pet_territory_rewardCfg {
    id = 30,
    reward = [{201,4},{601,24}]
    };
getRow(40)->
    #pet_territory_rewardCfg {
    id = 40,
    reward = [{201,5},{601,32}]
    };
getRow(50)->
    #pet_territory_rewardCfg {
    id = 50,
    reward = [{201,5},{601,40}]
    };
getRow(60)->
    #pet_territory_rewardCfg {
    id = 60,
    reward = [{201,6},{602,10}]
    };
getRow(70)->
    #pet_territory_rewardCfg {
    id = 70,
    reward = [{201,6},{602,15}]
    };
getRow(80)->
    #pet_territory_rewardCfg {
    id = 80,
    reward = [{201,10},{602,22}]
    };
getRow(90)->
    #pet_territory_rewardCfg {
    id = 90,
    reward = [{201,15},{602,29}]
    };
getRow(100)->
    #pet_territory_rewardCfg {
    id = 100,
    reward = [{201,20},{602,36}]
    };
getRow(_)->[].

getKeyList()->[
    {17},
    {30},
    {40},
    {50},
    {60},
    {70},
    {80},
    {90},
    {100}
    ].

get1KeyList()->[
    17,
    30,
    40,
    50,
    60,
    70,
    80,
    90,
    100
    ].

