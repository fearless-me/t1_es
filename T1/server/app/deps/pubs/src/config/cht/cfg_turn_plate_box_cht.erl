%% coding: latin-1
%%: 实现
-module(cfg_turn_plate_box_cht).
-compile(export_all).
-include("cfg_turn_plate_box.hrl").
-include("logger.hrl").

getRow(1,10)->
    #turn_plate_boxCfg {
    boxType = 1,
    reclaimTurnNum = 10,
    rewardItem = 29811
    };
getRow(1,30)->
    #turn_plate_boxCfg {
    boxType = 1,
    reclaimTurnNum = 30,
    rewardItem = 29812
    };
getRow(1,60)->
    #turn_plate_boxCfg {
    boxType = 1,
    reclaimTurnNum = 60,
    rewardItem = 29813
    };
getRow(1,90)->
    #turn_plate_boxCfg {
    boxType = 1,
    reclaimTurnNum = 90,
    rewardItem = 29814
    };
getRow(1,120)->
    #turn_plate_boxCfg {
    boxType = 1,
    reclaimTurnNum = 120,
    rewardItem = 29815
    };
getRow(1,150)->
    #turn_plate_boxCfg {
    boxType = 1,
    reclaimTurnNum = 150,
    rewardItem = 29816
    };
getRow(1,250)->
    #turn_plate_boxCfg {
    boxType = 1,
    reclaimTurnNum = 250,
    rewardItem = 29817
    };
getRow(2,10)->
    #turn_plate_boxCfg {
    boxType = 2,
    reclaimTurnNum = 10,
    rewardItem = 29821
    };
getRow(2,30)->
    #turn_plate_boxCfg {
    boxType = 2,
    reclaimTurnNum = 30,
    rewardItem = 29822
    };
getRow(2,60)->
    #turn_plate_boxCfg {
    boxType = 2,
    reclaimTurnNum = 60,
    rewardItem = 29823
    };
getRow(2,90)->
    #turn_plate_boxCfg {
    boxType = 2,
    reclaimTurnNum = 90,
    rewardItem = 29824
    };
getRow(2,120)->
    #turn_plate_boxCfg {
    boxType = 2,
    reclaimTurnNum = 120,
    rewardItem = 29825
    };
getRow(2,150)->
    #turn_plate_boxCfg {
    boxType = 2,
    reclaimTurnNum = 150,
    rewardItem = 29826
    };
getRow(2,250)->
    #turn_plate_boxCfg {
    boxType = 2,
    reclaimTurnNum = 250,
    rewardItem = 29827
    };
getRow(_,_)->[].

getKeyList()->[
    {1,10},
    {1,30},
    {1,60},
    {1,90},
    {1,120},
    {1,150},
    {1,250},
    {2,10},
    {2,30},
    {2,60},
    {2,90},
    {2,120},
    {2,150},
    {2,250}
    ].

get1KeyList()->[
    1,
    2
    ].

get2KeyList(1)->[
    10,
    30,
    60,
    90,
    120,
    150,
    250
    ];
get2KeyList(2)->[
    10,
    30,
    60,
    90,
    120,
    150,
    250
    ];
get2KeyList(_)->[].

