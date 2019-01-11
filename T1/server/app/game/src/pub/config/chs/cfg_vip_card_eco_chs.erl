%% coding: latin-1
%%: 实现
-module(cfg_vip_card_eco_chs).
-compile(export_all).
-include("cfg_vip_card_eco.hrl").
-include("logger.hrl").

getRow(50001)->
    #vip_card_ecoCfg {
    id = 50001,
    type = 1,
    name = "冒險家公會",
    price = 6000,
    vip_card_des = [14,1,6,2],
    rmb = 60,
    gift = 0,
    day = 30,
    coin_type = 6,
    coin_num = 1200,
    item_id = 0,
    item_num = 0
    };
getRow(50002)->
    #vip_card_ecoCfg {
    id = 50002,
    type = 2,
    name = "屠魔騎士勳章",
    price = 8000,
    vip_card_des = [15,12,100,13],
    rmb = 90,
    gift = 29903,
    day = 30,
    coin_type = 6,
    coin_num = 1800,
    item_id = 0,
    item_num = 0
    };
getRow(50003)->
    #vip_card_ecoCfg {
    id = 50003,
    type = 3,
    name = "星月商會勳章",
    price = 16000,
    vip_card_des = [16,4,23,3,5],
    rmb = 180,
    gift = 0,
    day = 30,
    coin_type = 6,
    coin_num = 3600,
    item_id = 16179,
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

