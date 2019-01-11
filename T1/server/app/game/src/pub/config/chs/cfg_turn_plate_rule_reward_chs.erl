%% coding: latin-1
%%: 实现
-module(cfg_turn_plate_rule_reward_chs).
-compile(export_all).
-include("cfg_turn_plate_rule_reward.hrl").
-include("logger.hrl").

getRow(1,1)->
    #turn_plate_rule_rewardCfg {
    turnType = 1,
    paneId = 1,
    pro = 1,
    itemId = 14083,
    itemNum = 1
    };
getRow(1,2)->
    #turn_plate_rule_rewardCfg {
    turnType = 1,
    paneId = 2,
    pro = 1,
    itemId = 14131,
    itemNum = 1
    };
getRow(1,3)->
    #turn_plate_rule_rewardCfg {
    turnType = 1,
    paneId = 3,
    pro = 5,
    itemId = 16083,
    itemNum = 1
    };
getRow(1,4)->
    #turn_plate_rule_rewardCfg {
    turnType = 1,
    paneId = 4,
    pro = 5,
    itemId = 25200,
    itemNum = 1
    };
getRow(1,5)->
    #turn_plate_rule_rewardCfg {
    turnType = 1,
    paneId = 5,
    pro = 50,
    itemId = 203,
    itemNum = 2
    };
getRow(1,6)->
    #turn_plate_rule_rewardCfg {
    turnType = 1,
    paneId = 6,
    pro = 50,
    itemId = 221,
    itemNum = 15
    };
getRow(1,7)->
    #turn_plate_rule_rewardCfg {
    turnType = 1,
    paneId = 7,
    pro = 200,
    itemId = 16139,
    itemNum = 1
    };
getRow(1,8)->
    #turn_plate_rule_rewardCfg {
    turnType = 1,
    paneId = 8,
    pro = 200,
    itemId = 11000,
    itemNum = 3
    };
getRow(1,9)->
    #turn_plate_rule_rewardCfg {
    turnType = 1,
    paneId = 9,
    pro = 200,
    itemId = 2601,
    itemNum = 6
    };
getRow(1,10)->
    #turn_plate_rule_rewardCfg {
    turnType = 1,
    paneId = 10,
    pro = 200,
    itemId = 4306,
    itemNum = 2
    };
getRow(1,11)->
    #turn_plate_rule_rewardCfg {
    turnType = 1,
    paneId = 11,
    pro = 250,
    itemId = 202,
    itemNum = 10
    };
getRow(1,12)->
    #turn_plate_rule_rewardCfg {
    turnType = 1,
    paneId = 12,
    pro = 250,
    itemId = 904,
    itemNum = 1
    };
getRow(1,13)->
    #turn_plate_rule_rewardCfg {
    turnType = 1,
    paneId = 13,
    pro = 400,
    itemId = 606,
    itemNum = 5
    };
getRow(1,14)->
    #turn_plate_rule_rewardCfg {
    turnType = 1,
    paneId = 14,
    pro = 400,
    itemId = 230,
    itemNum = 8
    };
getRow(1,15)->
    #turn_plate_rule_rewardCfg {
    turnType = 1,
    paneId = 15,
    pro = 400,
    itemId = 221,
    itemNum = 10
    };
getRow(1,16)->
    #turn_plate_rule_rewardCfg {
    turnType = 1,
    paneId = 16,
    pro = 400,
    itemId = 2160,
    itemNum = 10
    };
getRow(2,1)->
    #turn_plate_rule_rewardCfg {
    turnType = 2,
    paneId = 1,
    pro = 1,
    itemId = 14079,
    itemNum = 1
    };
getRow(2,2)->
    #turn_plate_rule_rewardCfg {
    turnType = 2,
    paneId = 2,
    pro = 1,
    itemId = 14081,
    itemNum = 1
    };
getRow(2,3)->
    #turn_plate_rule_rewardCfg {
    turnType = 2,
    paneId = 3,
    pro = 5,
    itemId = 16079,
    itemNum = 1
    };
getRow(2,4)->
    #turn_plate_rule_rewardCfg {
    turnType = 2,
    paneId = 4,
    pro = 10,
    itemId = 203,
    itemNum = 8
    };
getRow(2,5)->
    #turn_plate_rule_rewardCfg {
    turnType = 2,
    paneId = 5,
    pro = 10,
    itemId = 204,
    itemNum = 5
    };
getRow(2,6)->
    #turn_plate_rule_rewardCfg {
    turnType = 2,
    paneId = 6,
    pro = 20,
    itemId = 8001,
    itemNum = 50
    };
getRow(2,7)->
    #turn_plate_rule_rewardCfg {
    turnType = 2,
    paneId = 7,
    pro = 50,
    itemId = 11000,
    itemNum = 6
    };
getRow(2,8)->
    #turn_plate_rule_rewardCfg {
    turnType = 2,
    paneId = 8,
    pro = 50,
    itemId = 16081,
    itemNum = 1
    };
getRow(2,9)->
    #turn_plate_rule_rewardCfg {
    turnType = 2,
    paneId = 9,
    pro = 200,
    itemId = 221,
    itemNum = 20
    };
getRow(2,10)->
    #turn_plate_rule_rewardCfg {
    turnType = 2,
    paneId = 10,
    pro = 200,
    itemId = 2601,
    itemNum = 8
    };
getRow(2,11)->
    #turn_plate_rule_rewardCfg {
    turnType = 2,
    paneId = 11,
    pro = 400,
    itemId = 2160,
    itemNum = 12
    };
getRow(2,12)->
    #turn_plate_rule_rewardCfg {
    turnType = 2,
    paneId = 12,
    pro = 500,
    itemId = 221,
    itemNum = 15
    };
getRow(2,13)->
    #turn_plate_rule_rewardCfg {
    turnType = 2,
    paneId = 13,
    pro = 500,
    itemId = 606,
    itemNum = 5
    };
getRow(2,14)->
    #turn_plate_rule_rewardCfg {
    turnType = 2,
    paneId = 14,
    pro = 500,
    itemId = 904,
    itemNum = 1
    };
getRow(2,15)->
    #turn_plate_rule_rewardCfg {
    turnType = 2,
    paneId = 15,
    pro = 500,
    itemId = 202,
    itemNum = 10
    };
getRow(2,16)->
    #turn_plate_rule_rewardCfg {
    turnType = 2,
    paneId = 16,
    pro = 500,
    itemId = 230,
    itemNum = 8
    };
getRow(_,_)->[].

getKeyList()->[
    {1,1},
    {1,2},
    {1,3},
    {1,4},
    {1,5},
    {1,6},
    {1,7},
    {1,8},
    {1,9},
    {1,10},
    {1,11},
    {1,12},
    {1,13},
    {1,14},
    {1,15},
    {1,16},
    {2,1},
    {2,2},
    {2,3},
    {2,4},
    {2,5},
    {2,6},
    {2,7},
    {2,8},
    {2,9},
    {2,10},
    {2,11},
    {2,12},
    {2,13},
    {2,14},
    {2,15},
    {2,16}
    ].

get1KeyList()->[
    1,
    2
    ].

get2KeyList(1)->[
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9,
    10,
    11,
    12,
    13,
    14,
    15,
    16
    ];
get2KeyList(2)->[
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9,
    10,
    11,
    12,
    13,
    14,
    15,
    16
    ];
get2KeyList(_)->[].

