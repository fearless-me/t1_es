%% coding: latin-1
%%: 实现
-module(cfg_ladder_1v1_reward_cht).
-compile(export_all).
-include("cfg_ladder_1v1_reward.hrl").
-include("logger.hrl").

getRow(1,1)->
    #ladder_1v1_rewardCfg {
    rank_start = 1,
    rank_end = 1,
    normal = 1000,
    extra = 0,
    everydaycoin = [6,600],
    item = 2400,
    coin = [1,6,200]
    };
getRow(2,2)->
    #ladder_1v1_rewardCfg {
    rank_start = 2,
    rank_end = 2,
    normal = 800,
    extra = 0,
    everydaycoin = [6,500],
    item = 2401,
    coin = [1,6,100]
    };
getRow(3,3)->
    #ladder_1v1_rewardCfg {
    rank_start = 3,
    rank_end = 3,
    normal = 700,
    extra = 0,
    everydaycoin = [6,500],
    item = 2402,
    coin = [1,6,100]
    };
getRow(4,4)->
    #ladder_1v1_rewardCfg {
    rank_start = 4,
    rank_end = 4,
    normal = 600,
    extra = 0,
    everydaycoin = [6,450],
    item = 2403,
    coin = [1,6,100]
    };
getRow(5,5)->
    #ladder_1v1_rewardCfg {
    rank_start = 5,
    rank_end = 5,
    normal = 300,
    extra = 0,
    everydaycoin = [6,450],
    item = 2404,
    coin = [1,6,100]
    };
getRow(6,7)->
    #ladder_1v1_rewardCfg {
    rank_start = 6,
    rank_end = 7,
    normal = 180,
    extra = 0,
    everydaycoin = [6,400],
    item = 2405,
    coin = [1,6,100]
    };
getRow(8,10)->
    #ladder_1v1_rewardCfg {
    rank_start = 8,
    rank_end = 10,
    normal = 130,
    extra = 0,
    everydaycoin = [6,400],
    item = 2405,
    coin = [1,6,100]
    };
getRow(11,20)->
    #ladder_1v1_rewardCfg {
    rank_start = 11,
    rank_end = 20,
    normal = 120,
    extra = 0,
    everydaycoin = [6,350],
    item = 2405,
    coin = [2,6,50]
    };
getRow(21,30)->
    #ladder_1v1_rewardCfg {
    rank_start = 21,
    rank_end = 30,
    normal = 110,
    extra = 0,
    everydaycoin = [6,300],
    item = 2405,
    coin = [2,6,50]
    };
getRow(31,50)->
    #ladder_1v1_rewardCfg {
    rank_start = 31,
    rank_end = 50,
    normal = 110,
    extra = 0,
    everydaycoin = [6,250],
    item = 2405,
    coin = [5,6,50]
    };
getRow(51,70)->
    #ladder_1v1_rewardCfg {
    rank_start = 51,
    rank_end = 70,
    normal = 110,
    extra = 0,
    everydaycoin = [6,250],
    item = 2405,
    coin = [10,6,50]
    };
getRow(71,100)->
    #ladder_1v1_rewardCfg {
    rank_start = 71,
    rank_end = 100,
    normal = 100,
    extra = 0,
    everydaycoin = [6,200],
    item = 2405,
    coin = [10,6,50]
    };
getRow(101,200)->
    #ladder_1v1_rewardCfg {
    rank_start = 101,
    rank_end = 200,
    normal = 90,
    extra = 0,
    everydaycoin = [6,150],
    item = 2405,
    coin = [20,6,40]
    };
getRow(201,300)->
    #ladder_1v1_rewardCfg {
    rank_start = 201,
    rank_end = 300,
    normal = 80,
    extra = 0,
    everydaycoin = [6,150],
    item = 2405,
    coin = [20,6,40]
    };
getRow(301,400)->
    #ladder_1v1_rewardCfg {
    rank_start = 301,
    rank_end = 400,
    normal = 70,
    extra = 0,
    everydaycoin = [6,100],
    item = 2405,
    coin = [20,6,40]
    };
getRow(401,500)->
    #ladder_1v1_rewardCfg {
    rank_start = 401,
    rank_end = 500,
    normal = 60,
    extra = 0,
    everydaycoin = [6,100],
    item = 2405,
    coin = [20,6,40]
    };
getRow(501,700)->
    #ladder_1v1_rewardCfg {
    rank_start = 501,
    rank_end = 700,
    normal = 60,
    extra = 0,
    everydaycoin = [6,100],
    item = 2405,
    coin = [50,6,20]
    };
getRow(701,1000)->
    #ladder_1v1_rewardCfg {
    rank_start = 701,
    rank_end = 1000,
    normal = 50,
    extra = 0,
    everydaycoin = [6,100],
    item = 2405,
    coin = [50,6,20]
    };
getRow(1001,3000)->
    #ladder_1v1_rewardCfg {
    rank_start = 1001,
    rank_end = 3000,
    normal = 40,
    extra = 0,
    everydaycoin = [6,50],
    item = 2405,
    coin = [200,6,20]
    };
getRow(3001,9999999)->
    #ladder_1v1_rewardCfg {
    rank_start = 3001,
    rank_end = 9999999,
    normal = 30,
    extra = 0,
    everydaycoin = [6,50],
    item = 2405,
    coin = [500,6,0]
    };
getRow(_,_)->[].

getKeyList()->[
    {1,1},
    {2,2},
    {3,3},
    {4,4},
    {5,5},
    {6,7},
    {8,10},
    {11,20},
    {21,30},
    {31,50},
    {51,70},
    {71,100},
    {101,200},
    {201,300},
    {301,400},
    {401,500},
    {501,700},
    {701,1000},
    {1001,3000},
    {3001,9999999}
    ].

get1KeyList()->[
    1,
    2,
    3,
    4,
    5,
    6,
    8,
    11,
    21,
    31,
    51,
    71,
    101,
    201,
    301,
    401,
    501,
    701,
    1001,
    3001
    ].

get2KeyList(1)->[
    1
    ];
get2KeyList(2)->[
    2
    ];
get2KeyList(3)->[
    3
    ];
get2KeyList(4)->[
    4
    ];
get2KeyList(5)->[
    5
    ];
get2KeyList(6)->[
    7
    ];
get2KeyList(8)->[
    10
    ];
get2KeyList(11)->[
    20
    ];
get2KeyList(21)->[
    30
    ];
get2KeyList(31)->[
    50
    ];
get2KeyList(51)->[
    70
    ];
get2KeyList(71)->[
    100
    ];
get2KeyList(101)->[
    200
    ];
get2KeyList(201)->[
    300
    ];
get2KeyList(301)->[
    400
    ];
get2KeyList(401)->[
    500
    ];
get2KeyList(501)->[
    700
    ];
get2KeyList(701)->[
    1000
    ];
get2KeyList(1001)->[
    3000
    ];
get2KeyList(3001)->[
    9999999
    ];
get2KeyList(_)->[].

