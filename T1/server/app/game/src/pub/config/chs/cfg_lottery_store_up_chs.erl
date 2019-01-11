%% coding: latin-1
%%: 实现
-module(cfg_lottery_store_up_chs).
-compile(export_all).
-include("cfg_lottery_store_up.hrl").
-include("logger.hrl").

getRow(1)->
    #lottery_store_upCfg {
    week = 1,
    up_pet = [{1848,990},{1822,1005},{1821,1005}]
    };
getRow(2)->
    #lottery_store_upCfg {
    week = 2,
    up_pet = [{1844,990},{1842,1005},{1836,1005}]
    };
getRow(3)->
    #lottery_store_upCfg {
    week = 3,
    up_pet = [{1856,990},{1863,1005},{1843,1005}]
    };
getRow(4)->
    #lottery_store_upCfg {
    week = 4,
    up_pet = [{1864,990},{1862,1005},{1870,1005}]
    };
getRow(5)->
    #lottery_store_upCfg {
    week = 5,
    up_pet = [{1869,990},{1822,1005},{1821,1005}]
    };
getRow(6)->
    #lottery_store_upCfg {
    week = 6,
    up_pet = [{1848,990},{1842,1005},{1836,1005}]
    };
getRow(7)->
    #lottery_store_upCfg {
    week = 7,
    up_pet = [{1844,990},{1863,1005},{1843,1005}]
    };
getRow(_)->[].

getKeyList()->[
    {1},
    {2},
    {3},
    {4},
    {5},
    {6},
    {7}
    ].

get1KeyList()->[
    1,
    2,
    3,
    4,
    5,
    6,
    7
    ].

