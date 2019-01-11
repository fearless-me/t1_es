%% coding: latin-1
%%: 实现
-module(cfg_turn_plate_lucky_cost_chs).
-compile(export_all).
-include("cfg_turn_plate_lucky_cost.hrl").
-include("logger.hrl").

getRow(1)->
    #turn_plate_lucky_costCfg {
    id = 1,
    des = "綁鑽1次",
    turnType = 1,
    turnNum = 1,
    coin = 6,
    coinNum = 1000,
    luckyValue = 2,
    para_a = 180,
    para_b = 300,
    para_x = 36000
    };
getRow(2)->
    #turn_plate_lucky_costCfg {
    id = 2,
    des = "綁鑽5次",
    turnType = 1,
    turnNum = 5,
    coin = 6,
    coinNum = 4000,
    luckyValue = 2,
    para_a = 180,
    para_b = 300,
    para_x = 36000
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
    para_a = 180,
    para_b = 300,
    para_x = 36000
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
    para_a = 180,
    para_b = 300,
    para_x = 36000
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

