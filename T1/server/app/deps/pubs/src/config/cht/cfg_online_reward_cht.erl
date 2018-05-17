%% coding: latin-1
%%: 实现
-module(cfg_online_reward_cht).
-compile(export_all).
-include("cfg_online_reward.hrl").


getRow(1)->
    #online_rewardCfg {
    id = 1,
    time = 10,
    item1 = 4200,
    num1 = 1,
    tpye1 = 0,
    item2 = 0,
    num2 = 0,
    tpye2 = 0,
    item3 = 0,
    num3 = 0,
    tpye3 = 0,
    item4 = 0,
    num4 = 0,
    tpye4 = 0,
    item5 = 0,
    num5 = 0,
    tpye5 = 0
    };
getRow(2)->
    #online_rewardCfg {
    id = 2,
    time = 20,
    item1 = 604,
    num1 = 1,
    tpye1 = 0,
    item2 = 0,
    num2 = 0,
    tpye2 = 0,
    item3 = 0,
    num3 = 0,
    tpye3 = 0,
    item4 = 0,
    num4 = 0,
    tpye4 = 0,
    item5 = 0,
    num5 = 0,
    tpye5 = 0
    };
getRow(3)->
    #online_rewardCfg {
    id = 3,
    time = 40,
    item1 = 2160,
    num1 = 3,
    tpye1 = 0,
    item2 = 0,
    num2 = 0,
    tpye2 = 0,
    item3 = 0,
    num3 = 0,
    tpye3 = 0,
    item4 = 0,
    num4 = 0,
    tpye4 = 0,
    item5 = 0,
    num5 = 0,
    tpye5 = 0
    };
getRow(4)->
    #online_rewardCfg {
    id = 4,
    time = 60,
    item1 = 221,
    num1 = 8,
    tpye1 = 0,
    item2 = 0,
    num2 = 0,
    tpye2 = 0,
    item3 = 0,
    num3 = 0,
    tpye3 = 0,
    item4 = 0,
    num4 = 0,
    tpye4 = 0,
    item5 = 0,
    num5 = 0,
    tpye5 = 0
    };
getRow(5)->
    #online_rewardCfg {
    id = 5,
    time = 90,
    item1 = 1801,
    num1 = 3,
    tpye1 = 0,
    item2 = 0,
    num2 = 0,
    tpye2 = 0,
    item3 = 0,
    num3 = 0,
    tpye3 = 0,
    item4 = 0,
    num4 = 0,
    tpye4 = 0,
    item5 = 0,
    num5 = 0,
    tpye5 = 0
    };
getRow(_)->[].

getKeyList()->[
    {1},
    {2},
    {3},
    {4},
    {5}
    ].

get1KeyList()->[
    1,
    2,
    3,
    4,
    5
    ].

