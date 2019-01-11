%% coding: latin-1
%%: 实现
-module(cfg_buff_buy_chs).
-compile(export_all).
-include("cfg_buff_buy.hrl").
-include("logger.hrl").

getRow(1)->
    #buff_buyCfg {
    id = 1,
    type = 1,
    buffid = 64500,
    price = [105,100],
    itemid = 24623
    };
getRow(2)->
    #buff_buyCfg {
    id = 2,
    type = 1,
    buffid = 64501,
    price = [105,100],
    itemid = 24624
    };
getRow(3)->
    #buff_buyCfg {
    id = 3,
    type = 1,
    buffid = 64502,
    price = [105,100],
    itemid = 24625
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

