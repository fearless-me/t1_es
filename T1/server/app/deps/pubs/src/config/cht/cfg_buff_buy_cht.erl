%% coding: latin-1
%%: 实现
-module(cfg_buff_buy_cht).
-compile(export_all).
-include("cfg_buff_buy.hrl").


getRow(1)->
    #buff_buyCfg {
    id = 1,
    type = 1,
    buffid = 501,
    price = [105,100]
    };
getRow(2)->
    #buff_buyCfg {
    id = 2,
    type = 1,
    buffid = 502,
    price = [103,100]
    };
getRow(3)->
    #buff_buyCfg {
    id = 3,
    type = 1,
    buffid = 503,
    price = [105,100]
    };
getRow(4)->
    #buff_buyCfg {
    id = 4,
    type = 1,
    buffid = 504,
    price = [103,100]
    };
getRow(5)->
    #buff_buyCfg {
    id = 5,
    type = 1,
    buffid = 505,
    price = [105,100]
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

