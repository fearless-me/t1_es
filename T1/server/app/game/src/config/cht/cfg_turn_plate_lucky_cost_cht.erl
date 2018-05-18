%% coding: latin-1
%%: 实现
-module(cfg_turn_plate_lucky_cost_cht).
-compile(export_all).
-include("cfg_turn_plate_lucky_cost.hrl").


getRow(1)->
    #turn_plate_lucky_costCfg {
    id = 1,
    des = "綁鑽1次",
    turnType = 1,
    turnNum = 1,
    coin = 6,
    coinNum = 100,
    luckyValue = 2,
    para_a = 600,
    para_b = 1000,
    para_x = 30000
    };
getRow(2)->
    #turn_plate_lucky_costCfg {
    id = 2,
    des = "綁鑽5次",
    turnType = 1,
    turnNum = 5,
    coin = 6,
    coinNum = 400,
    luckyValue = 2,
    para_a = 600,
    para_b = 1000,
    para_x = 30000
    };
getRow(3)->
    #turn_plate_lucky_costCfg {
    id = 3,
    des = "非綁鑽1次",
    turnType = 2,
    turnNum = 1,
    coin = 3,
    coinNum = 100,
    luckyValue = 2,
    para_a = 600,
    para_b = 1000,
    para_x = 30000
    };
getRow(4)->
    #turn_plate_lucky_costCfg {
    id = 4,
    des = "非綁鑽5次",
    turnType = 2,
    turnNum = 5,
    coin = 3,
    coinNum = 400,
    luckyValue = 2,
    para_a = 600,
    para_b = 1000,
    para_x = 30000
    };
getRow(_)->[].

getKeyList()->[
    {1},
    {2},
    {3},
    {4}
    ].

get1KeyList()->[
    1,
    2,
    3,
    4
    ].

