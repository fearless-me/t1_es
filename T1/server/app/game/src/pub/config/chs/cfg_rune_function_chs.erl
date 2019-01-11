%% coding: latin-1
%%: 实现
-module(cfg_rune_function_chs).
-compile(export_all).
-include("cfg_rune_function.hrl").
-include("logger.hrl").

getRow(130,3)->
    #rune_functionCfg {
    equipLevel = 130,
    quality = 3,
    fusecostnor = [23300,3],
    fusecost = [{23300,3},{23301,3}],
    transcost = [23302,3],
    meltcost = [23303,3],
    rune_probnor = [100,40,100],
    rune_prob = [100,40,100]
    };
getRow(130,4)->
    #rune_functionCfg {
    equipLevel = 130,
    quality = 4,
    fusecostnor = [23300,4],
    fusecost = [{23300,4},{23301,4}],
    transcost = [23302,4],
    meltcost = [23303,4],
    rune_probnor = [100,40,100],
    rune_prob = [100,40,100]
    };
getRow(170,3)->
    #rune_functionCfg {
    equipLevel = 170,
    quality = 3,
    fusecostnor = [23300,4],
    fusecost = [{23300,4},{23301,4}],
    transcost = [23302,4],
    meltcost = [23303,4],
    rune_probnor = [100,40,100],
    rune_prob = [100,40,100]
    };
getRow(170,4)->
    #rune_functionCfg {
    equipLevel = 170,
    quality = 4,
    fusecostnor = [23300,6],
    fusecost = [{23300,6},{23301,6}],
    transcost = [23302,6],
    meltcost = [23303,6],
    rune_probnor = [100,40,100],
    rune_prob = [100,40,100]
    };
getRow(210,3)->
    #rune_functionCfg {
    equipLevel = 210,
    quality = 3,
    fusecostnor = [23300,6],
    fusecost = [{23300,6},{23301,6}],
    transcost = [23302,6],
    meltcost = [23303,6],
    rune_probnor = [100,40,100],
    rune_prob = [100,40,100]
    };
getRow(210,4)->
    #rune_functionCfg {
    equipLevel = 210,
    quality = 4,
    fusecostnor = [23300,9],
    fusecost = [{23300,9},{23301,9}],
    transcost = [23302,9],
    meltcost = [23303,9],
    rune_probnor = [100,40,100],
    rune_prob = [100,40,100]
    };
getRow(_,_)->[].

getKeyList()->[
    {130,3},
    {130,4},
    {170,3},
    {170,4},
    {210,3},
    {210,4}
    ].

get1KeyList()->[
    130,
    170,
    210
    ].

get2KeyList(130)->[
    3,
    4
    ];
get2KeyList(170)->[
    3,
    4
    ];
get2KeyList(210)->[
    3,
    4
    ];
get2KeyList(_)->[].

