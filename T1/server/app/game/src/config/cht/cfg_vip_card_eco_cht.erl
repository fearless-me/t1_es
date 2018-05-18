%% coding: latin-1
%%: 实现
-module(cfg_vip_card_eco_cht).
-compile(export_all).
-include("cfg_vip_card_eco.hrl").


getRow(50001)->
    #vip_card_ecoCfg {
    id = 50001,
    type = 1,
    name = "冒險家公會",
    price = 500,
    vip_card_des = [21,1,2,11],
    rmb = 60,
    gift = 0,
    day = 30,
    coin_type = 6,
    coin_num = 120,
    item_id = 14180,
    item_num = 1
    };
getRow(50002)->
    #vip_card_ecoCfg {
    id = 50002,
    type = 2,
    name = "屠魔騎士勳章",
    price = 800,
    vip_card_des = [22,4,6,5],
    rmb = 90,
    gift = 0,
    day = 30,
    coin_type = 6,
    coin_num = 180,
    item_id = 14231,
    item_num = 1
    };
getRow(50003)->
    #vip_card_ecoCfg {
    id = 50003,
    type = 3,
    name = "星月商會勳章",
    price = 1500,
    vip_card_des = [23,3,12,13],
    rmb = 180,
    gift = 29903,
    day = 30,
    coin_type = 6,
    coin_num = 360,
    item_id = 14233,
    item_num = 1
    };
getRow(_)->[].

getKeyList()->[
    {50001},
    {50002},
    {50003}
    ].

get1KeyList()->[
    50001,
    50002,
    50003
    ].

