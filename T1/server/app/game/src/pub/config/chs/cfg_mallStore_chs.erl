%% coding: latin-1
%%: 实现
-module(cfg_mallStore_chs).
-compile(export_all).
-include("cfg_mallStore.hrl").
-include("logger.hrl").

getRow(1)->
    #mallStoreCfg {
    id = 1,
    name = "家族商店",
    icon = "Sundry_Guild",
    sort = 1
    };
getRow(2)->
    #mallStoreCfg {
    id = 2,
    name = "幽界兑换",
    icon = "Sundry_Alrest",
    sort = 3
    };
getRow(3)->
    #mallStoreCfg {
    id = 3,
    name = "深渊兑换",
    icon = "Sundry_MagicCrystal",
    sort = 4
    };
getRow(4)->
    #mallStoreCfg {
    id = 4,
    name = "阿露娜商店",
    icon = "Sundry_Aruna",
    sort = 5
    };
getRow(5)->
    #mallStoreCfg {
    id = 5,
    name = "随身商店",
    icon = "Sundry_Carrystone",
    sort = 6
    };
getRow(6)->
    #mallStoreCfg {
    id = 6,
    name = "资源兑换",
    icon = "Sundry_Rechange",
    sort = 2
    };
getRow(_)->[].

getKeyList()->[
    {1},
    {2},
    {3},
    {4},
    {5},
    {6}
    ].

get1KeyList()->[
    1,
    2,
    3,
    4,
    5,
    6
    ].

