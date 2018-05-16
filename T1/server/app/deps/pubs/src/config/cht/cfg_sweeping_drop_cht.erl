%% coding: latin-1
%%: 实现
-module(cfg_sweeping_drop_cht).
-compile(export_all).
-include("cfg_sweeping_drop.hrl").
-include("logger.hrl").

getRow(110)->
    #sweeping_dropCfg {
    id = 110,
    name = "20级普通副本",
    exp = 6000,
    gold = [1000,1000],
    purple = [0,0],
    golden = [0,0],
    drop = 300000,
    cost_money = 0
    };
getRow(111)->
    #sweeping_dropCfg {
    id = 111,
    name = "30级普通副本",
    exp = 6000,
    gold = [2000,2000],
    purple = [0,0],
    golden = [0,0],
    drop = 300001,
    cost_money = 0
    };
getRow(112)->
    #sweeping_dropCfg {
    id = 112,
    name = "40级普通副本",
    exp = 6000,
    gold = [3000,3000],
    purple = [0,0],
    golden = [0,0],
    drop = 300002,
    cost_money = 0
    };
getRow(113)->
    #sweeping_dropCfg {
    id = 113,
    name = "50级普通副本",
    exp = 6000,
    gold = [4000,4000],
    purple = [0,0],
    golden = [0,0],
    drop = 300003,
    cost_money = 0
    };
getRow(114)->
    #sweeping_dropCfg {
    id = 114,
    name = "60级普通副本",
    exp = 6000,
    gold = [4000,4000],
    purple = [0,0],
    golden = [0,0],
    drop = 300004,
    cost_money = 0
    };
getRow(115)->
    #sweeping_dropCfg {
    id = 115,
    name = "70级普通副本",
    exp = 6000,
    gold = [4000,4000],
    purple = [0,0],
    golden = [0,0],
    drop = 300004,
    cost_money = 0
    };
getRow(116)->
    #sweeping_dropCfg {
    id = 116,
    name = "80级普通副本",
    exp = 6000,
    gold = [4000,4000],
    purple = [0,0],
    golden = [0,0],
    drop = 300004,
    cost_money = 0
    };
getRow(117)->
    #sweeping_dropCfg {
    id = 117,
    name = "90级普通副本",
    exp = 6000,
    gold = [4000,4000],
    purple = [0,0],
    golden = [0,0],
    drop = 300004,
    cost_money = 0
    };
getRow(118)->
    #sweeping_dropCfg {
    id = 118,
    name = "100级普通副本",
    exp = 6000,
    gold = [4000,4000],
    purple = [0,0],
    golden = [0,0],
    drop = 300004,
    cost_money = 0
    };
getRow(119)->
    #sweeping_dropCfg {
    id = 119,
    name = "110级普通副本",
    exp = 6000,
    gold = [4000,4000],
    purple = [0,0],
    golden = [0,0],
    drop = 300004,
    cost_money = 0
    };
getRow(120)->
    #sweeping_dropCfg {
    id = 120,
    name = "120级普通副本",
    exp = 6000,
    gold = [4000,4000],
    purple = [0,0],
    golden = [0,0],
    drop = 300004,
    cost_money = 0
    };
getRow(121)->
    #sweeping_dropCfg {
    id = 121,
    name = "130级普通副本",
    exp = 6000,
    gold = [4000,4000],
    purple = [0,0],
    golden = [0,0],
    drop = 300004,
    cost_money = 0
    };
getRow(122)->
    #sweeping_dropCfg {
    id = 122,
    name = "140级普通副本",
    exp = 6000,
    gold = [4000,4000],
    purple = [0,0],
    golden = [0,0],
    drop = 300004,
    cost_money = 0
    };
getRow(123)->
    #sweeping_dropCfg {
    id = 123,
    name = "150级普通副本",
    exp = 6000,
    gold = [4000,4000],
    purple = [0,0],
    golden = [0,0],
    drop = 300004,
    cost_money = 0
    };
getRow(_)->[].

getKeyList()->[
    {110},
    {111},
    {112},
    {113},
    {114},
    {115},
    {116},
    {117},
    {118},
    {119},
    {120},
    {121},
    {122},
    {123}
    ].

get1KeyList()->[
    110,
    111,
    112,
    113,
    114,
    115,
    116,
    117,
    118,
    119,
    120,
    121,
    122,
    123
    ].

