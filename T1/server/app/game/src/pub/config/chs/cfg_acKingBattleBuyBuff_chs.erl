%% coding: latin-1
%%: 实现
-module(cfg_acKingBattleBuyBuff_chs).
-compile(export_all).
-include("cfg_acKingBattleBuyBuff.hrl").
-include("logger.hrl").

getRow(1)->
    #acKingBattleBuyBuffCfg {
    id = 1,
    buffID = 50002,
    coinType = 103,
    coin = 200,
    nextCfgID = 12,
    oneKeyBuyCfgID = 16,
    oneKeyBuyCoin = 2000,
    oneKeyBuyCoinType = 103,
    floor = 0
    };
getRow(2)->
    #acKingBattleBuyBuffCfg {
    id = 2,
    buffID = 50001,
    coinType = 103,
    coin = 500,
    nextCfgID = 4,
    oneKeyBuyCfgID = 11,
    oneKeyBuyCoin = 5000,
    oneKeyBuyCoinType = 103,
    floor = 0
    };
getRow(3)->
    #acKingBattleBuyBuffCfg {
    id = 3,
    buffID = 50000,
    coinType = 103,
    coin = 500,
    nextCfgID = 4,
    oneKeyBuyCfgID = 11,
    oneKeyBuyCoin = 5000,
    oneKeyBuyCoinType = 103,
    floor = 0
    };
getRow(4)->
    #acKingBattleBuyBuffCfg {
    id = 4,
    buffID = 50003,
    coinType = 103,
    coin = 1000,
    nextCfgID = 5,
    oneKeyBuyCfgID = 11,
    oneKeyBuyCoin = 4500,
    oneKeyBuyCoinType = 103,
    floor = 1
    };
getRow(5)->
    #acKingBattleBuyBuffCfg {
    id = 5,
    buffID = 50004,
    coinType = 103,
    coin = 1500,
    nextCfgID = 6,
    oneKeyBuyCfgID = 11,
    oneKeyBuyCoin = 3500,
    oneKeyBuyCoinType = 103,
    floor = 2
    };
getRow(6)->
    #acKingBattleBuyBuffCfg {
    id = 6,
    buffID = 50005,
    coinType = 103,
    coin = 2000,
    nextCfgID = 11,
    oneKeyBuyCfgID = 11,
    oneKeyBuyCoin = 2000,
    oneKeyBuyCoinType = 103,
    floor = 3
    };
getRow(7)->
    #acKingBattleBuyBuffCfg {
    id = 7,
    buffID = 50006,
    coinType = 103,
    coin = 500,
    nextCfgID = 8,
    oneKeyBuyCfgID = 11,
    oneKeyBuyCoin = 1440,
    oneKeyBuyCoinType = 103,
    floor = 4
    };
getRow(8)->
    #acKingBattleBuyBuffCfg {
    id = 8,
    buffID = 50007,
    coinType = 103,
    coin = 600,
    nextCfgID = 9,
    oneKeyBuyCfgID = 11,
    oneKeyBuyCoin = 1040,
    oneKeyBuyCoinType = 103,
    floor = 5
    };
getRow(9)->
    #acKingBattleBuyBuffCfg {
    id = 9,
    buffID = 50008,
    coinType = 103,
    coin = 700,
    nextCfgID = 10,
    oneKeyBuyCfgID = 11,
    oneKeyBuyCoin = 560,
    oneKeyBuyCoinType = 103,
    floor = 6
    };
getRow(10)->
    #acKingBattleBuyBuffCfg {
    id = 10,
    buffID = 50009,
    coinType = 103,
    coin = 700,
    nextCfgID = 11,
    oneKeyBuyCfgID = 11,
    oneKeyBuyCoin = 560,
    oneKeyBuyCoinType = 103,
    floor = 7
    };
getRow(11)->
    #acKingBattleBuyBuffCfg {
    id = 11,
    buffID = 50010,
    coinType = 103,
    coin = 0,
    nextCfgID = -1,
    oneKeyBuyCfgID = -1,
    oneKeyBuyCoin = 0,
    oneKeyBuyCoinType = 103,
    floor = 4
    };
getRow(12)->
    #acKingBattleBuyBuffCfg {
    id = 12,
    buffID = 50003,
    coinType = 103,
    coin = 400,
    nextCfgID = 13,
    oneKeyBuyCfgID = 16,
    oneKeyBuyCoin = 1800,
    oneKeyBuyCoinType = 103,
    floor = 1
    };
getRow(13)->
    #acKingBattleBuyBuffCfg {
    id = 13,
    buffID = 50004,
    coinType = 103,
    coin = 600,
    nextCfgID = 14,
    oneKeyBuyCfgID = 16,
    oneKeyBuyCoin = 1400,
    oneKeyBuyCoinType = 103,
    floor = 2
    };
getRow(14)->
    #acKingBattleBuyBuffCfg {
    id = 14,
    buffID = 50005,
    coinType = 103,
    coin = 800,
    nextCfgID = 16,
    oneKeyBuyCfgID = 16,
    oneKeyBuyCoin = 800,
    oneKeyBuyCoinType = 103,
    floor = 3
    };
getRow(15)->
    #acKingBattleBuyBuffCfg {
    id = 15,
    buffID = 50006,
    coinType = 103,
    coin = 80,
    nextCfgID = 16,
    oneKeyBuyCfgID = 16,
    oneKeyBuyCoin = 64,
    oneKeyBuyCoinType = 103,
    floor = 4
    };
getRow(16)->
    #acKingBattleBuyBuffCfg {
    id = 16,
    buffID = 50007,
    coinType = 103,
    coin = 0,
    nextCfgID = -1,
    oneKeyBuyCfgID = -1,
    oneKeyBuyCoin = 0,
    oneKeyBuyCoinType = 103,
    floor = 4
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
    {9},
    {10},
    {11},
    {12},
    {13},
    {14},
    {15},
    {16}
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
    9,
    10,
    11,
    12,
    13,
    14,
    15,
    16
    ].

