%% coding: latin-1
%%: 实现
-module(cfg_gemproperty_chs).
-compile(export_all).
-include("cfg_gemproperty.hrl").
-include("logger.hrl").

getRow(1,1)->
    #gempropertyCfg {
    color = 1,
    level = 1,
    pro = [{136,31,0},{137,31,0}],
    cost = [{1,1500}]
    };
getRow(1,2)->
    #gempropertyCfg {
    color = 1,
    level = 2,
    pro = [{136,55,0},{137,55,0}],
    cost = [{1,3000}]
    };
getRow(1,3)->
    #gempropertyCfg {
    color = 1,
    level = 3,
    pro = [{136,99,0},{137,99,0}],
    cost = [{1,6000}]
    };
getRow(1,4)->
    #gempropertyCfg {
    color = 1,
    level = 4,
    pro = [{136,180,0},{137,180,0}],
    cost = [{1,12000}]
    };
getRow(1,5)->
    #gempropertyCfg {
    color = 1,
    level = 5,
    pro = [{136,320,0},{137,320,0}],
    cost = [{1,24000}]
    };
getRow(1,6)->
    #gempropertyCfg {
    color = 1,
    level = 6,
    pro = [{136,550,0},{137,550,0}],
    cost = [{1,48000}]
    };
getRow(1,7)->
    #gempropertyCfg {
    color = 1,
    level = 7,
    pro = [{136,930,0},{137,930,0}],
    cost = [{1,96000}]
    };
getRow(1,8)->
    #gempropertyCfg {
    color = 1,
    level = 8,
    pro = [{136,1490,0},{137,1490,0}],
    cost = [{1,192000}]
    };
getRow(1,9)->
    #gempropertyCfg {
    color = 1,
    level = 9,
    pro = [{136,2080,0},{137,2080,0}],
    cost = [{1,384000}]
    };
getRow(1,10)->
    #gempropertyCfg {
    color = 1,
    level = 10,
    pro = [{136,2500,0},{137,2500,0}]
    };
getRow(2,1)->
    #gempropertyCfg {
    color = 2,
    level = 1,
    pro = [{138,60,0},{139,60,0}],
    cost = [{1,1500}]
    };
getRow(2,2)->
    #gempropertyCfg {
    color = 2,
    level = 2,
    pro = [{138,108,0},{139,108,0}],
    cost = [{1,3000}]
    };
getRow(2,3)->
    #gempropertyCfg {
    color = 2,
    level = 3,
    pro = [{138,194,0},{139,194,0}],
    cost = [{1,6000}]
    };
getRow(2,4)->
    #gempropertyCfg {
    color = 2,
    level = 4,
    pro = [{138,350,0},{139,350,0}],
    cost = [{1,12000}]
    };
getRow(2,5)->
    #gempropertyCfg {
    color = 2,
    level = 5,
    pro = [{138,630,0},{139,630,0}],
    cost = [{1,24000}]
    };
getRow(2,6)->
    #gempropertyCfg {
    color = 2,
    level = 6,
    pro = [{138,1070,0},{139,1070,0}],
    cost = [{1,48000}]
    };
getRow(2,7)->
    #gempropertyCfg {
    color = 2,
    level = 7,
    pro = [{138,1820,0},{139,1820,0}],
    cost = [{1,96000}]
    };
getRow(2,8)->
    #gempropertyCfg {
    color = 2,
    level = 8,
    pro = [{138,2910,0},{139,2910,0}],
    cost = [{1,192000}]
    };
getRow(2,9)->
    #gempropertyCfg {
    color = 2,
    level = 9,
    pro = [{138,4070,0},{139,4070,0}],
    cost = [{1,384000}]
    };
getRow(2,10)->
    #gempropertyCfg {
    color = 2,
    level = 10,
    pro = [{138,4880,0},{139,4880,0}]
    };
getRow(3,1)->
    #gempropertyCfg {
    color = 3,
    level = 1,
    pro = [{135,400,0}],
    cost = [{1,1500}]
    };
getRow(3,2)->
    #gempropertyCfg {
    color = 3,
    level = 2,
    pro = [{135,720,0}],
    cost = [{1,3000}]
    };
getRow(3,3)->
    #gempropertyCfg {
    color = 3,
    level = 3,
    pro = [{135,1300,0}],
    cost = [{1,6000}]
    };
getRow(3,4)->
    #gempropertyCfg {
    color = 3,
    level = 4,
    pro = [{135,2330,0}],
    cost = [{1,12000}]
    };
getRow(3,5)->
    #gempropertyCfg {
    color = 3,
    level = 5,
    pro = [{135,4200,0}],
    cost = [{1,24000}]
    };
getRow(3,6)->
    #gempropertyCfg {
    color = 3,
    level = 6,
    pro = [{135,7140,0}],
    cost = [{1,48000}]
    };
getRow(3,7)->
    #gempropertyCfg {
    color = 3,
    level = 7,
    pro = [{135,12140,0}],
    cost = [{1,96000}]
    };
getRow(3,8)->
    #gempropertyCfg {
    color = 3,
    level = 8,
    pro = [{135,19420,0}],
    cost = [{1,192000}]
    };
getRow(3,9)->
    #gempropertyCfg {
    color = 3,
    level = 9,
    pro = [{135,27180,0}],
    cost = [{1,384000}]
    };
getRow(3,10)->
    #gempropertyCfg {
    color = 3,
    level = 10,
    pro = [{135,32620,0}]
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

