%% coding: latin-1
%%: 实现
-module(cfg_alive_cht).
-compile(export_all).
-include("cfg_alive.hrl").


getRow(1)->
    #aliveCfg {
    id = 1,
    objid = 2000,
    type = 1,
    equipID = [31284,31286,31288,31290,31292,31294,31296],
    buffList = [2001],
    skillList = [2001],
    drop = 1,
    pos = [432,600],
    percent = 5000
    };
getRow(2)->
    #aliveCfg {
    id = 2,
    objid = 2000,
    type = 1,
    equipID = [31284,31286,31288,31290,31292,31294,31296],
    buffList = [2001],
    skillList = [2001],
    drop = 1,
    pos = [438,229],
    percent = 5000
    };
getRow(3)->
    #aliveCfg {
    id = 3,
    objid = 2000,
    type = 1,
    equipID = [31284,31286,31288,31290,31292,31294,31296],
    buffList = [2001],
    skillList = [2001],
    drop = 1,
    pos = [246,591],
    percent = 5000
    };
getRow(4)->
    #aliveCfg {
    id = 4,
    objid = 2001,
    type = 2,
    equipID = [36145],
    buffList = [2002],
    skillList = [],
    drop = 1,
    pos = [558,560],
    percent = 5000
    };
getRow(5)->
    #aliveCfg {
    id = 5,
    objid = 2001,
    type = 2,
    equipID = [36145],
    buffList = [2002],
    skillList = [],
    drop = 1,
    pos = [304,291],
    percent = 5000
    };
getRow(6)->
    #aliveCfg {
    id = 6,
    objid = 2001,
    type = 2,
    equipID = [36145],
    buffList = [2002],
    skillList = [],
    drop = 1,
    pos = [605,503],
    percent = 5000
    };
getRow(7)->
    #aliveCfg {
    id = 7,
    objid = 2002,
    type = 3,
    equipID = [32145],
    buffList = [2003],
    skillList = [],
    drop = 1,
    pos = [646,433],
    percent = 5000
    };
getRow(8)->
    #aliveCfg {
    id = 8,
    objid = 2002,
    type = 3,
    equipID = [32145],
    buffList = [2003],
    skillList = [],
    drop = 1,
    pos = [250,432],
    percent = 5000
    };
getRow(9)->
    #aliveCfg {
    id = 9,
    objid = 2002,
    type = 3,
    equipID = [32145],
    buffList = [2003],
    skillList = [],
    drop = 1,
    pos = [270,344],
    percent = 5000
    };
getRow(10)->
    #aliveCfg {
    id = 10,
    objid = 2003,
    type = 4,
    equipID = [33145],
    buffList = [2004],
    skillList = [],
    drop = 1,
    pos = [556,286],
    percent = 5000
    };
getRow(11)->
    #aliveCfg {
    id = 11,
    objid = 2003,
    type = 4,
    equipID = [33145],
    buffList = [2004],
    skillList = [],
    drop = 1,
    pos = [307,564],
    percent = 5000
    };
getRow(12)->
    #aliveCfg {
    id = 12,
    objid = 2003,
    type = 4,
    equipID = [33145],
    buffList = [2004],
    skillList = [],
    drop = 1,
    pos = [556,351],
    percent = 5000
    };
getRow(13)->
    #aliveCfg {
    id = 13,
    objid = 2004,
    type = 0,
    equipID = [],
    buffList = [2000],
    skillList = [],
    drop = 0,
    pos = [390,530],
    percent = 5000
    };
getRow(14)->
    #aliveCfg {
    id = 14,
    objid = 2004,
    type = 0,
    equipID = [],
    buffList = [2000],
    skillList = [],
    drop = 0,
    pos = [483,340],
    percent = 5000
    };
getRow(15)->
    #aliveCfg {
    id = 15,
    objid = 2004,
    type = 0,
    equipID = [],
    buffList = [2000],
    skillList = [],
    drop = 0,
    pos = [349,523],
    percent = 5000
    };
getRow(16)->
    #aliveCfg {
    id = 16,
    objid = 2005,
    type = 0,
    equipID = [],
    buffList = [2007],
    skillList = [],
    drop = 0,
    pos = [481,534],
    percent = 5000
    };
getRow(17)->
    #aliveCfg {
    id = 17,
    objid = 2005,
    type = 0,
    equipID = [],
    buffList = [2007],
    skillList = [],
    drop = 0,
    pos = [390,330],
    percent = 5000
    };
getRow(18)->
    #aliveCfg {
    id = 18,
    objid = 2005,
    type = 0,
    equipID = [],
    buffList = [2007],
    skillList = [],
    drop = 0,
    pos = [438,543],
    percent = 5000
    };
getRow(19)->
    #aliveCfg {
    id = 19,
    objid = 2006,
    type = 0,
    equipID = [],
    buffList = [2008,2016],
    skillList = [],
    drop = 0,
    pos = [540,481],
    percent = 5000
    };
getRow(20)->
    #aliveCfg {
    id = 20,
    objid = 2006,
    type = 0,
    equipID = [],
    buffList = [2008,2016],
    skillList = [],
    drop = 0,
    pos = [335,384],
    percent = 5000
    };
getRow(21)->
    #aliveCfg {
    id = 21,
    objid = 2006,
    type = 0,
    equipID = [],
    buffList = [2008,2016],
    skillList = [],
    drop = 0,
    pos = [525,522],
    percent = 5000
    };
getRow(22)->
    #aliveCfg {
    id = 22,
    objid = 2007,
    type = 0,
    equipID = [],
    buffList = [2005],
    skillList = [],
    drop = 0,
    pos = [543,383],
    percent = 5000
    };
getRow(23)->
    #aliveCfg {
    id = 23,
    objid = 2007,
    type = 0,
    equipID = [],
    buffList = [2005],
    skillList = [],
    drop = 0,
    pos = [340,480],
    percent = 5000
    };
getRow(24)->
    #aliveCfg {
    id = 24,
    objid = 2007,
    type = 0,
    equipID = [],
    buffList = [2005],
    skillList = [],
    drop = 0,
    pos = [560,435],
    percent = 5000
    };
getRow(25)->
    #aliveCfg {
    id = 25,
    objid = 2008,
    type = 1,
    equipID = [31285,31287,31289,31291,31293,31295,31297],
    buffList = [2006],
    skillList = [],
    drop = 1,
    pos = [389,409],
    percent = 3334
    };
getRow(26)->
    #aliveCfg {
    id = 26,
    objid = 2008,
    type = 1,
    equipID = [31285,31287,31289,31291,31293,31295,31297],
    buffList = [2006],
    skillList = [],
    drop = 1,
    pos = [491,409],
    percent = 3334
    };
getRow(27)->
    #aliveCfg {
    id = 27,
    objid = 2008,
    type = 1,
    equipID = [31285,31287,31289,31291,31293,31295,31297],
    buffList = [2006],
    skillList = [],
    drop = 1,
    pos = [438,409],
    percent = 3334
    };
getRow(28)->
    #aliveCfg {
    id = 28,
    objid = 2009,
    type = 0,
    equipID = [],
    buffList = [2011,2013],
    skillList = [],
    drop = 0,
    pos = [437,398],
    percent = 5000
    };
getRow(29)->
    #aliveCfg {
    id = 29,
    objid = 2009,
    type = 0,
    equipID = [],
    buffList = [2011,2013],
    skillList = [],
    drop = 0,
    pos = [532,347],
    percent = 5000
    };
getRow(30)->
    #aliveCfg {
    id = 30,
    objid = 2009,
    type = 0,
    equipID = [],
    buffList = [2011,2013],
    skillList = [],
    drop = 0,
    pos = [440,317],
    percent = 5000
    };
getRow(31)->
    #aliveCfg {
    id = 31,
    objid = 2010,
    type = 0,
    equipID = [],
    buffList = [2012,2014],
    skillList = [],
    drop = 0,
    pos = [443,599],
    percent = 5000
    };
getRow(32)->
    #aliveCfg {
    id = 32,
    objid = 2010,
    type = 0,
    equipID = [],
    buffList = [2012,2014],
    skillList = [],
    drop = 0,
    pos = [349,345],
    percent = 5000
    };
getRow(33)->
    #aliveCfg {
    id = 33,
    objid = 2010,
    type = 0,
    equipID = [],
    buffList = [2012,2014],
    skillList = [],
    drop = 0,
    pos = [329,437],
    percent = 5000
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
    {16},
    {17},
    {18},
    {19},
    {20},
    {21},
    {22},
    {23},
    {24},
    {25},
    {26},
    {27},
    {28},
    {29},
    {30},
    {31},
    {32},
    {33}
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
    16,
    17,
    18,
    19,
    20,
    21,
    22,
    23,
    24,
    25,
    26,
    27,
    28,
    29,
    30,
    31,
    32,
    33
    ].

