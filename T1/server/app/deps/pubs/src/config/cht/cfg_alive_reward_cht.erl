%% coding: latin-1
%%: 实现
-module(cfg_alive_reward_cht).
-compile(export_all).
-include("cfg_alive_reward.hrl").
-include("logger.hrl").

getRow(1)->
    #alive_rewardCfg {
    id = 1,
    itemId1 = 2601,
    itemNum1 = 4,
    itemId2 = 902,
    itemNum2 = 3
    };
getRow(2)->
    #alive_rewardCfg {
    id = 2,
    itemId1 = 2601,
    itemNum1 = 3,
    itemId2 = 902,
    itemNum2 = 3
    };
getRow(3)->
    #alive_rewardCfg {
    id = 3,
    itemId1 = 2601,
    itemNum1 = 3,
    itemId2 = 902,
    itemNum2 = 3
    };
getRow(4)->
    #alive_rewardCfg {
    id = 4,
    itemId1 = 2601,
    itemNum1 = 3,
    itemId2 = 902,
    itemNum2 = 3
    };
getRow(6)->
    #alive_rewardCfg {
    id = 6,
    itemId1 = 2601,
    itemNum1 = 2,
    itemId2 = 902,
    itemNum2 = 3
    };
getRow(8)->
    #alive_rewardCfg {
    id = 8,
    itemId1 = 2601,
    itemNum1 = 2,
    itemId2 = 902,
    itemNum2 = 3
    };
getRow(11)->
    #alive_rewardCfg {
    id = 11,
    itemId1 = 2601,
    itemNum1 = 2,
    itemId2 = 902,
    itemNum2 = 3
    };
getRow(16)->
    #alive_rewardCfg {
    id = 16,
    itemId1 = 2601,
    itemNum1 = 1,
    itemId2 = 902,
    itemNum2 = 3
    };
getRow(_)->[].

getKeyList()->[
    {1},
    {2},
    {3},
    {4},
    {6},
    {8},
    {11},
    {16}
    ].

get1KeyList()->[
    1,
    2,
    3,
    4,
    6,
    8,
    11,
    16
    ].

