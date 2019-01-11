%% coding: latin-1
%%: 实现
-module(cfg_exchange_chs).
-compile(export_all).
-include("cfg_exchange.hrl").
-include("logger.hrl").

getRow(1)->
    #exchangeCfg {
    id = 1,
    usd = "3.29",
    krw = "3300"
    };
getRow(2)->
    #exchangeCfg {
    id = 2,
    usd = "5.49",
    krw = "5500"
    };
getRow(3)->
    #exchangeCfg {
    id = 3,
    usd = "10.99",
    krw = "11000"
    };
getRow(4)->
    #exchangeCfg {
    id = 4,
    usd = "16.49",
    krw = "16500"
    };
getRow(5)->
    #exchangeCfg {
    id = 5,
    usd = "32.99",
    krw = "33000"
    };
getRow(6)->
    #exchangeCfg {
    id = 6,
    usd = "54.99",
    krw = "55000"
    };
getRow(7)->
    #exchangeCfg {
    id = 7,
    usd = "109.99",
    krw = "110000"
    };
getRow(8)->
    #exchangeCfg {
    id = 8,
    usd = "164.99",
    krw = "165000"
    };
getRow(9)->
    #exchangeCfg {
    id = 9,
    usd = "197.99",
    krw = "198000"
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
    {8},
    {9}
    ].

get1KeyList()->[
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9
    ].

