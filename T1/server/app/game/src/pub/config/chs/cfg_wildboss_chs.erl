%% coding: latin-1
%%: 实现
-module(cfg_wildboss_chs).
-compile(export_all).
-include("cfg_wildboss.hrl").
-include("logger.hrl").

getRow(18001)->
    #wildbossCfg {
    bossID = 18001,
    mapID = 5,
    pos = [435,159],
    rewardID = 200000,
    normal = 1500,
    lucky = 0,
    refreshTime = 900,
    item = [4,270,53,3151],
    bust = 312,
    sequence = 1
    };
getRow(18002)->
    #wildbossCfg {
    bossID = 18002,
    mapID = 5,
    pos = [106,320],
    rewardID = 200001,
    normal = 1501,
    lucky = 0,
    refreshTime = 1200,
    item = [4,270,53,3151],
    bust = 306,
    sequence = 2
    };
getRow(18003)->
    #wildbossCfg {
    bossID = 18003,
    mapID = 5,
    pos = [117,133],
    rewardID = 200002,
    normal = 1502,
    lucky = 0,
    refreshTime = 1800,
    item = [4,270,53,3152],
    bust = 316,
    sequence = 3
    };
getRow(18004)->
    #wildbossCfg {
    bossID = 18004,
    mapID = 5,
    pos = [282,387],
    rewardID = 200003,
    normal = 1503,
    lucky = 0,
    refreshTime = 1800,
    item = [4,270,53,3153],
    bust = 311,
    sequence = 4
    };
getRow(18005)->
    #wildbossCfg {
    bossID = 18005,
    mapID = 5,
    pos = [282,85],
    rewardID = 200004,
    normal = 1504,
    lucky = 0,
    refreshTime = 1800,
    item = [4,270,53,3153],
    bust = 313,
    sequence = 5
    };
getRow(18006)->
    #wildbossCfg {
    bossID = 18006,
    mapID = 30,
    pos = [435,159],
    rewardID = 200005,
    normal = 1505,
    lucky = 0,
    refreshTime = 1800,
    item = [4,270,53,3153],
    bust = 355,
    sequence = 6
    };
getRow(_)->[].

getKeyList()->[
    {18001},
    {18002},
    {18003},
    {18004},
    {18005},
    {18006}
    ].

get1KeyList()->[
    18001,
    18002,
    18003,
    18004,
    18005,
    18006
    ].

