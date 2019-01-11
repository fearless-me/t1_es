%% coding: latin-1
%%: 实现
-module(cfg_turn_plate_box_chs).
-compile(export_all).
-include("cfg_turn_plate_box.hrl").
-include("logger.hrl").

getRow(1,5)->
    #turn_plate_boxCfg {
    boxType = 1,
    reclaimTurnNum = 5,
    rewardItem1 = [605,5],
    rewardItem2 = [0,0],
    rewardItem3 = [0,0]
    };
getRow(1,12)->
    #turn_plate_boxCfg {
    boxType = 1,
    reclaimTurnNum = 12,
    rewardItem1 = [221,8],
    rewardItem2 = [0,0],
    rewardItem3 = [0,0]
    };
getRow(1,24)->
    #turn_plate_boxCfg {
    boxType = 1,
    reclaimTurnNum = 24,
    rewardItem1 = [225,1],
    rewardItem2 = [0,0],
    rewardItem3 = [0,0]
    };
getRow(1,42)->
    #turn_plate_boxCfg {
    boxType = 1,
    reclaimTurnNum = 42,
    rewardItem1 = [226,1],
    rewardItem2 = [0,0],
    rewardItem3 = [0,0]
    };
getRow(1,64)->
    #turn_plate_boxCfg {
    boxType = 1,
    reclaimTurnNum = 64,
    rewardItem1 = [226,1],
    rewardItem2 = [0,0],
    rewardItem3 = [0,0]
    };
getRow(1,92)->
    #turn_plate_boxCfg {
    boxType = 1,
    reclaimTurnNum = 92,
    rewardItem1 = [226,1],
    rewardItem2 = [0,0],
    rewardItem3 = [0,0]
    };
getRow(1,108)->
    #turn_plate_boxCfg {
    boxType = 1,
    reclaimTurnNum = 108,
    rewardItem1 = [2601,30],
    rewardItem2 = [0,0],
    rewardItem3 = [0,0]
    };
getRow(2,5)->
    #turn_plate_boxCfg {
    boxType = 2,
    reclaimTurnNum = 5,
    rewardItem1 = [14000,5],
    rewardItem2 = [0,0],
    rewardItem3 = [0,0]
    };
getRow(2,15)->
    #turn_plate_boxCfg {
    boxType = 2,
    reclaimTurnNum = 15,
    rewardItem1 = [14000,5],
    rewardItem2 = [0,0],
    rewardItem3 = [0,0]
    };
getRow(2,35)->
    #turn_plate_boxCfg {
    boxType = 2,
    reclaimTurnNum = 35,
    rewardItem1 = [14000,10],
    rewardItem2 = [0,0],
    rewardItem3 = [0,0]
    };
getRow(2,55)->
    #turn_plate_boxCfg {
    boxType = 2,
    reclaimTurnNum = 55,
    rewardItem1 = [226,2],
    rewardItem2 = [0,0],
    rewardItem3 = [0,0]
    };
getRow(2,75)->
    #turn_plate_boxCfg {
    boxType = 2,
    reclaimTurnNum = 75,
    rewardItem1 = [226,2],
    rewardItem2 = [0,0],
    rewardItem3 = [0,0]
    };
getRow(2,95)->
    #turn_plate_boxCfg {
    boxType = 2,
    reclaimTurnNum = 95,
    rewardItem1 = [226,3],
    rewardItem2 = [0,0],
    rewardItem3 = [0,0]
    };
getRow(2,125)->
    #turn_plate_boxCfg {
    boxType = 2,
    reclaimTurnNum = 125,
    rewardItem1 = [226,5],
    rewardItem2 = [0,0],
    rewardItem3 = [0,0]
    };
getRow(_,_)->[].

getKeyList()->[
    {1,5},
    {1,12},
    {1,24},
    {1,42},
    {1,64},
    {1,92},
    {1,108},
    {2,5},
    {2,15},
    {2,35},
    {2,55},
    {2,75},
    {2,95},
    {2,125}
    ].

get1KeyList()->[
    1,
    2
    ].

get2KeyList(1)->[
    5,
    12,
    24,
    42,
    64,
    92,
    108
    ];
get2KeyList(2)->[
    5,
    15,
    35,
    55,
    75,
    95,
    125
    ];
get2KeyList(_)->[].

