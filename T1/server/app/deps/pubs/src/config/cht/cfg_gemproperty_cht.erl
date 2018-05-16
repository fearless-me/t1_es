%% coding: latin-1
%%: 实现
-module(cfg_gemproperty_cht).
-compile(export_all).
-include("cfg_gemproperty.hrl").
-include("logger.hrl").

getRow(1,1)->
    #gempropertyCfg {
    color = 1,
    level = 1,
    pro = [{136,60,0},{137,60,0}],
    cost = [{1,5000}]
    };
getRow(1,2)->
    #gempropertyCfg {
    color = 1,
    level = 2,
    pro = [{136,80,0},{137,80,0}],
    cost = [{1,10000}]
    };
getRow(1,3)->
    #gempropertyCfg {
    color = 1,
    level = 3,
    pro = [{136,120,0},{137,120,0}],
    cost = [{1,20000}]
    };
getRow(1,4)->
    #gempropertyCfg {
    color = 1,
    level = 4,
    pro = [{136,160,0},{137,160,0}],
    cost = [{1,40000}]
    };
getRow(1,5)->
    #gempropertyCfg {
    color = 1,
    level = 5,
    pro = [{136,230,0},{137,230,0}],
    cost = [{1,80000}]
    };
getRow(1,6)->
    #gempropertyCfg {
    color = 1,
    level = 6,
    pro = [{136,320,0},{137,320,0}],
    cost = [{1,160000}]
    };
getRow(1,7)->
    #gempropertyCfg {
    color = 1,
    level = 7,
    pro = [{136,450,0},{137,450,0}],
    cost = [{1,320000}]
    };
getRow(1,8)->
    #gempropertyCfg {
    color = 1,
    level = 8,
    pro = [{136,630,0},{137,630,0}],
    cost = [{1,640000}]
    };
getRow(1,9)->
    #gempropertyCfg {
    color = 1,
    level = 9,
    pro = [{136,880,0},{137,880,0}],
    cost = [{1,1280000}]
    };
getRow(1,10)->
    #gempropertyCfg {
    color = 1,
    level = 10,
    pro = [{136,1240,0},{137,1240,0}]
    };
getRow(2,1)->
    #gempropertyCfg {
    color = 2,
    level = 1,
    pro = [{138,120,0},{139,120,0}],
    cost = [{1,5000}]
    };
getRow(2,2)->
    #gempropertyCfg {
    color = 2,
    level = 2,
    pro = [{138,170,0},{139,170,0}],
    cost = [{1,10000}]
    };
getRow(2,3)->
    #gempropertyCfg {
    color = 2,
    level = 3,
    pro = [{138,230,0},{139,230,0}],
    cost = [{1,20000}]
    };
getRow(2,4)->
    #gempropertyCfg {
    color = 2,
    level = 4,
    pro = [{138,330,0},{139,330,0}],
    cost = [{1,40000}]
    };
getRow(2,5)->
    #gempropertyCfg {
    color = 2,
    level = 5,
    pro = [{138,460,0},{139,460,0}],
    cost = [{1,80000}]
    };
getRow(2,6)->
    #gempropertyCfg {
    color = 2,
    level = 6,
    pro = [{138,640,0},{139,640,0}],
    cost = [{1,160000}]
    };
getRow(2,7)->
    #gempropertyCfg {
    color = 2,
    level = 7,
    pro = [{138,900,0},{139,900,0}],
    cost = [{1,320000}]
    };
getRow(2,8)->
    #gempropertyCfg {
    color = 2,
    level = 8,
    pro = [{138,1260,0},{139,1260,0}],
    cost = [{1,640000}]
    };
getRow(2,9)->
    #gempropertyCfg {
    color = 2,
    level = 9,
    pro = [{138,1760,0},{139,1760,0}],
    cost = [{1,1280000}]
    };
getRow(2,10)->
    #gempropertyCfg {
    color = 2,
    level = 10,
    pro = [{138,2460,0},{139,2460,0}]
    };
getRow(3,1)->
    #gempropertyCfg {
    color = 3,
    level = 1,
    pro = [{135,790,0}],
    cost = [{1,5000}]
    };
getRow(3,2)->
    #gempropertyCfg {
    color = 3,
    level = 2,
    pro = [{135,1100,0}],
    cost = [{1,10000}]
    };
getRow(3,3)->
    #gempropertyCfg {
    color = 3,
    level = 3,
    pro = [{135,1550,0}],
    cost = [{1,20000}]
    };
getRow(3,4)->
    #gempropertyCfg {
    color = 3,
    level = 4,
    pro = [{135,2160,0}],
    cost = [{1,40000}]
    };
getRow(3,5)->
    #gempropertyCfg {
    color = 3,
    level = 5,
    pro = [{135,3030,0}],
    cost = [{1,80000}]
    };
getRow(3,6)->
    #gempropertyCfg {
    color = 3,
    level = 6,
    pro = [{135,4240,0}],
    cost = [{1,160000}]
    };
getRow(3,7)->
    #gempropertyCfg {
    color = 3,
    level = 7,
    pro = [{135,5940,0}],
    cost = [{1,320000}]
    };
getRow(3,8)->
    #gempropertyCfg {
    color = 3,
    level = 8,
    pro = [{135,8310,0}],
    cost = [{1,640000}]
    };
getRow(3,9)->
    #gempropertyCfg {
    color = 3,
    level = 9,
    pro = [{135,11640,0}],
    cost = [{1,1280000}]
    };
getRow(3,10)->
    #gempropertyCfg {
    color = 3,
    level = 10,
    pro = [{135,16300,0}]
    };
getRow(_,_)->[].

getKeyList()->[
    {1,1},
    {1,2},
    {1,3},
    {1,4},
    {1,5},
    {1,6},
    {1,7},
    {1,8},
    {1,9},
    {1,10},
    {2,1},
    {2,2},
    {2,3},
    {2,4},
    {2,5},
    {2,6},
    {2,7},
    {2,8},
    {2,9},
    {2,10},
    {3,1},
    {3,2},
    {3,3},
    {3,4},
    {3,5},
    {3,6},
    {3,7},
    {3,8},
    {3,9},
    {3,10}
    ].

get1KeyList()->[
    1,
    2,
    3
    ].

get2KeyList(1)->[
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9,
    10
    ];
get2KeyList(2)->[
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9,
    10
    ];
get2KeyList(3)->[
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9,
    10
    ];
get2KeyList(_)->[].

