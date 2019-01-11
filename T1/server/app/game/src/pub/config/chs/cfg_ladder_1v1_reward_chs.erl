%% coding: latin-1
%%: 实现
-module(cfg_ladder_1v1_reward_chs).
-compile(export_all).
-include("cfg_ladder_1v1_reward.hrl").
-include("logger.hrl").

getRow(1,1)->
    #ladder_1v1_rewardCfg {
    rank_start = 1,
    rank_end = 1,
    normal = 1000,
    extra = 0,
    everydaycoin = [6,2000],
    item = 2400,
    coin = [1,6,1000]
    };
getRow(2,5)->
    #ladder_1v1_rewardCfg {
    rank_start = 2,
    rank_end = 5,
    normal = 800,
    extra = 0,
    everydaycoin = [6,1500],
    item = 2401,
    coin = [1,6,500]
    };
getRow(6,10)->
    #ladder_1v1_rewardCfg {
    rank_start = 6,
    rank_end = 10,
    normal = 180,
    extra = 0,
    everydaycoin = [6,1200],
    item = 2405,
    coin = [1,6,500]
    };
getRow(11,30)->
    #ladder_1v1_rewardCfg {
    rank_start = 11,
    rank_end = 30,
    normal = 120,
    extra = 0,
    everydaycoin = [6,1000],
    item = 2405,
    coin = [5,6,250]
    };
getRow(31,50)->
    #ladder_1v1_rewardCfg {
    rank_start = 31,
    rank_end = 50,
    normal = 110,
    extra = 0,
    everydaycoin = [6,900],
    item = 2405,
    coin = [5,6,250]
    };
getRow(51,100)->
    #ladder_1v1_rewardCfg {
    rank_start = 51,
    rank_end = 100,
    normal = 110,
    extra = 0,
    everydaycoin = [6,800],
    item = 2405,
    coin = [10,6,250]
    };
getRow(101,300)->
    #ladder_1v1_rewardCfg {
    rank_start = 101,
    rank_end = 300,
    normal = 90,
    extra = 0,
    everydaycoin = [6,600],
    item = 2405,
    coin = [40,6,200]
    };
getRow(301,500)->
    #ladder_1v1_rewardCfg {
    rank_start = 301,
    rank_end = 500,
    normal = 70,
    extra = 0,
    everydaycoin = [6,400],
    item = 2405,
    coin = [40,6,200]
    };
getRow(501,1000)->
    #ladder_1v1_rewardCfg {
    rank_start = 501,
    rank_end = 1000,
    normal = 60,
    extra = 0,
    everydaycoin = [6,200],
    item = 2405,
    coin = [100,6,200]
    };
getRow(1001,3000)->
    #ladder_1v1_rewardCfg {
    rank_start = 1001,
    rank_end = 3000,
    normal = 40,
    extra = 0,
    everydaycoin = [6,200],
    item = 2405,
    coin = [200,6,100]
    };
getRow(3001,9999999)->
    #ladder_1v1_rewardCfg {
    rank_start = 3001,
    rank_end = 9999999,
    normal = 30,
    extra = 0,
    everydaycoin = [6,200],
    item = 2405,
    coin = [500,6,0]
    };
getRow(_,_)->[].

getKeyList()->[
    {1,1},
    {2,5},
    {6,10},
    {11,30},
    {31,50},
    {51,100},
    {101,300},
    {301,500},
    {501,1000},
    {1001,3000},
    {3001,9999999}
    ].

get1KeyList()->[
    1,
    2,
    6,
    11,
    31,
    51,
    101,
    301,
    501,
    1001,
    3001
    ].

get2KeyList(1)->[
    1
    ];
get2KeyList(2)->[
    5
    ];
get2KeyList(6)->[
    10
    ];
get2KeyList(11)->[
    30
    ];
get2KeyList(31)->[
    50
    ];
get2KeyList(51)->[
    100
    ];
get2KeyList(101)->[
    300
    ];
get2KeyList(301)->[
    500
    ];
get2KeyList(501)->[
    1000
    ];
get2KeyList(1001)->[
    3000
    ];
get2KeyList(3001)->[
    9999999
    ];
get2KeyList(_)->[].

