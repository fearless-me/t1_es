%% coding: latin-1
%%: 实现
-module(cfg_fashion_Discount_chs).
-compile(export_all).
-include("cfg_fashion_Discount.hrl").
-include("logger.hrl").

getRow(1)->
    #fashion_DiscountCfg {
    id = 1,
    batch = 1,
    fashionID = [{1,24},{0,23}],
    itemID = [{1,14024},{0,14023}],
    discount = 7,
    cointype = 105,
    original_price = 2000,
    price = 1400,
    start_time = [2018,10,9],
    time = 48,
    resources_bg = "",
    fashion_show = 1
    };
getRow(2)->
    #fashion_DiscountCfg {
    id = 2,
    batch = 1,
    fashionID = [{1,26},{0,25}],
    itemID = [{1,14026},{0,14025}],
    discount = 7,
    cointype = 105,
    original_price = 2000,
    price = 1400,
    start_time = [2018,10,9],
    time = 48,
    resources_bg = "",
    fashion_show = 1
    };
getRow(3)->
    #fashion_DiscountCfg {
    id = 3,
    batch = 1,
    fashionID = [{1,27},{0,27}],
    itemID = [{1,14027},{0,14027}],
    discount = 7,
    cointype = 105,
    original_price = 2000,
    price = 1400,
    start_time = [2018,10,9],
    time = 48,
    resources_bg = "",
    fashion_show = 1
    };
getRow(_)->[].

getKeyList()->[
    {1},
    {2},
    {3}
    ].

get1KeyList()->[
    1,
    2,
    3
    ].

