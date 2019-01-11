%% coding: latin-1
%%: 实现
-module(cfg_level_reward_chs).
-compile(export_all).
-include("cfg_level_reward.hrl").
-include("logger.hrl").

getRow(10)->
    #level_rewardCfg {
    id = 10,
    item1 = 222,
    num1 = 10,
    tpye1 = 0,
    item2 = 223,
    num2 = 40,
    tpye2 = 0,
    item3 = 224,
    num3 = 30,
    tpye3 = 0,
    item4 = 0,
    num4 = 0,
    tpye4 = 0,
    item5 = 0,
    num5 = 0,
    tpye5 = 0
    };
getRow(15)->
    #level_rewardCfg {
    id = 15,
    item1 = 20,
    num1 = 50,
    tpye1 = 0,
    item2 = 23002,
    num2 = 5,
    tpye2 = 0,
    item3 = 29006,
    num3 = 10,
    tpye3 = 0,
    item4 = 0,
    num4 = 0,
    tpye4 = 0,
    item5 = 0,
    num5 = 0,
    tpye5 = 0
    };
getRow(20)->
    #level_rewardCfg {
    id = 20,
    item1 = 230,
    num1 = 20,
    tpye1 = 0,
    item2 = 203,
    num2 = 10,
    tpye2 = 0,
    item3 = 2160,
    num3 = 20,
    tpye3 = 0,
    item4 = 0,
    num4 = 0,
    tpye4 = 0,
    item5 = 0,
    num5 = 0,
    tpye5 = 0
    };
getRow(30)->
    #level_rewardCfg {
    id = 30,
    item1 = 7000,
    num1 = 100,
    tpye1 = 0,
    item2 = 20,
    num2 = 100,
    tpye2 = 0,
    item3 = 201,
    num3 = 20,
    tpye3 = 0,
    item4 = 0,
    num4 = 0,
    tpye4 = 0,
    item5 = 0,
    num5 = 0,
    tpye5 = 0
    };
getRow(40)->
    #level_rewardCfg {
    id = 40,
    item1 = 251,
    num1 = 50,
    tpye1 = 0,
    item2 = 252,
    num2 = 50,
    tpye2 = 0,
    item3 = 2002,
    num3 = 2000,
    tpye3 = 0,
    item4 = 0,
    num4 = 0,
    tpye4 = 0,
    item5 = 0,
    num5 = 0,
    tpye5 = 0
    };
getRow(50)->
    #level_rewardCfg {
    id = 50,
    item1 = 270,
    num1 = 3,
    tpye1 = 0,
    item2 = 1800,
    num2 = 20,
    tpye2 = 0,
    item3 = 240,
    num3 = 60,
    tpye3 = 0,
    item4 = 604,
    num4 = 3,
    tpye4 = 0,
    item5 = 0,
    num5 = 0,
    tpye5 = 0
    };
getRow(60)->
    #level_rewardCfg {
    id = 60,
    item1 = 1803,
    num1 = 1,
    tpye1 = 0,
    item2 = 2161,
    num2 = 20,
    tpye2 = 0,
    item3 = 13001,
    num3 = 1,
    tpye3 = 0,
    item4 = 271,
    num4 = 3,
    tpye4 = 0,
    item5 = 0,
    num5 = 0,
    tpye5 = 0
    };
getRow(_)->[].

getKeyList()->[
    {10},
    {15},
    {20},
    {30},
    {40},
    {50},
    {60}
    ].

get1KeyList()->[
    10,
    15,
    20,
    30,
    40,
    50,
    60
    ].

