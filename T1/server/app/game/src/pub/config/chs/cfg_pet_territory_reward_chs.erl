%% coding: latin-1
%%: 实现
-module(cfg_pet_territory_reward_chs).
-compile(export_all).
-include("cfg_pet_territory_reward.hrl").
-include("logger.hrl").

getRow(27)->
    #pet_territory_rewardCfg {
    id = 27,
    reward = [{2002,50},{2003,50}]
    };
getRow(60)->
    #pet_territory_rewardCfg {
    id = 60,
    reward = [{2002,60},{2003,60}]
    };
getRow(80)->
    #pet_territory_rewardCfg {
    id = 80,
    reward = [{2002,70},{2003,70}]
    };
getRow(100)->
    #pet_territory_rewardCfg {
    id = 100,
    reward = [{2002,80},{2003,80}]
    };
getRow(120)->
    #pet_territory_rewardCfg {
    id = 120,
    reward = [{2002,90},{2003,90}]
    };
getRow(140)->
    #pet_territory_rewardCfg {
    id = 140,
    reward = [{2002,100},{2003,100}]
    };
getRow(160)->
    #pet_territory_rewardCfg {
    id = 160,
    reward = [{2002,120},{2003,120}]
    };
getRow(180)->
    #pet_territory_rewardCfg {
    id = 180,
    reward = [{2002,140},{2003,140}]
    };
getRow(200)->
    #pet_territory_rewardCfg {
    id = 200,
    reward = [{2002,160},{2003,160}]
    };
getRow(_)->[].

getKeyList()->[
    {27},
    {60},
    {80},
    {100},
    {120},
    {140},
    {160},
    {180},
    {200}
    ].

get1KeyList()->[
    27,
    60,
    80,
    100,
    120,
    140,
    160,
    180,
    200
    ].

