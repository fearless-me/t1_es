%% coding: latin-1
%%: 实现
-module(cfg_festivalactivity_gift_chs).
-compile(export_all).
-include("cfg_festivalactivity_gift.hrl").
-include("logger.hrl").

getRow(1)->
    #festivalactivity_giftCfg {
    id = 1,
    giftid = 15225,
    presentid = [{15220,50}],
    price = [105,3000],
    buytimes = -1,
    resource_gift = "Textures/UI/Base_Bg_129"
    };
getRow(2)->
    #festivalactivity_giftCfg {
    id = 2,
    giftid = 15220,
    presentid = [{501,5}],
    price = [105,60],
    buytimes = -1,
    resource_gift = "Textures/UI/Base_Bg_125"
    };
getRow(3)->
    #festivalactivity_giftCfg {
    id = 3,
    giftid = 15238,
    presentid = [{505,1}],
    price = [105,60],
    buytimes = -1,
    resource_gift = "Textures/UI/Base_Bg_142"
    };
getRow(4)->
    #festivalactivity_giftCfg {
    id = 4,
    giftid = 15240,
    presentid = [{504,2400}],
    price = [105,3000],
    buytimes = -1,
    resource_gift = "Textures/UI/Base_Bg_139"
    };
getRow(5)->
    #festivalactivity_giftCfg {
    id = 5,
    giftid = 15241,
    presentid = [{504,2400}],
    price = [105,3000],
    buytimes = -1,
    resource_gift = "Textures/UI/Base_Bg_140"
    };
getRow(6)->
    #festivalactivity_giftCfg {
    id = 6,
    giftid = 15242,
    presentid = [{504,2400}],
    price = [105,3000],
    buytimes = -1,
    resource_gift = "Textures/UI/Base_Bg_141"
    };
getRow(7)->
    #festivalactivity_giftCfg {
    id = 7,
    giftid = 15274,
    presentid = [{508,1}],
    price = [105,55],
    buytimes = -1,
    resource_gift = "Textures/UI/Base_Bg_144"
    };
getRow(8)->
    #festivalactivity_giftCfg {
    id = 8,
    giftid = 15275,
    presentid = [{506,1000}],
    price = [105,3000],
    buytimes = 1,
    resource_gift = "Textures/UI/Base_Bg_145"
    };
getRow(_)->[].

getKeyList()->[
    {1},
    {2},
    {3},
    {4},
    {5},
    {6},
    {7},
    {8}
    ].

get1KeyList()->[
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8
    ].

