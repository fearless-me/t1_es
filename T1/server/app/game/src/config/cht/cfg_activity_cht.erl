%% coding: latin-1
%%: 实现
-module(cfg_activity_cht).
-compile(export_all).
-include("cfg_activity.hrl").


getRow(1)->
    #activityCfg {
    id = 1,
    name = "混沌战场",
    dailyInterfaceid = 0,
    type = 0,
    matchType = 0,
    cycletype = 0,
    cycletime = 0,
    starttime = [{0,2,0}],
    lenghtime = 3550,
    stage = [{0,10}],
    mapidlist = [4000],
    condition = 0,
    awardlist = [],
    limitApply = 2000,
    limitGroup = []
    };
getRow(2)->
    #activityCfg {
    id = 2,
    name = "守卫碧空城",
    dailyInterfaceid = 0,
    type = 0,
    matchType = 0,
    cycletype = 0,
    cycletime = 0,
    starttime = [{1,19,0},{2,19,0},{3,19,0}],
    lenghtime = 9000,
    stage = [{1,10},{2,1100},{3,600}],
    mapidlist = [20],
    condition = 0,
    awardlist = [],
    limitApply = 2000,
    limitGroup = []
    };
getRow(3)->
    #activityCfg {
    id = 3,
    name = "首领入侵",
    dailyInterfaceid = 2,
    type = 0,
    matchType = 0,
    cycletype = 2,
    cycletime = 0,
    starttime = [{0,15,45}],
    lenghtime = 1500,
    stage = [{0,1},{1,300},{1,300},{1,300},{1,20},{4,550},{0,30}],
    mapidlist = [22],
    condition = 0,
    awardlist = [],
    limitApply = 2000,
    limitGroup = []
    };
getRow(4)->
    #activityCfg {
    id = 4,
    name = "家族战场",
    dailyInterfaceid = 107,
    type = 0,
    matchType = 0,
    cycletype = 3,
    cycletime = 0,
    starttime = [{3,9,45},{6,9,45}],
    lenghtime = 43200,
    stage = [{0,1},{1,300},{1,300},{1,300},{2,39600},{3,1800},{4,900}],
    mapidlist = [7002],
    condition = 0,
    awardlist = [],
    limitApply = 2000,
    limitGroup = []
    };
getRow(5)->
    #activityCfg {
    id = 5,
    name = "世界守护",
    dailyInterfaceid = 5,
    type = 0,
    matchType = 0,
    cycletype = 3,
    cycletime = 0,
    starttime = [{1,21,45},{5,21,45}],
    lenghtime = 1560,
    stage = [{0,1},{1,300},{1,300},{1,300},{4,600},{0,60}],
    mapidlist = [8001],
    condition = 0,
    awardlist = [],
    limitApply = 2000,
    limitGroup = []
    };
getRow(6)->
    #activityCfg {
    id = 6,
    name = "全民答题",
    dailyInterfaceid = 104,
    type = 0,
    matchType = 0,
    cycletype = 2,
    cycletime = 0,
    starttime = [{0,20,50}],
    lenghtime = 1200,
    stage = [{0,1},{1,300},{1,300},{2,300},{4,300}],
    mapidlist = [],
    condition = 0,
    awardlist = [],
    limitApply = 2000,
    limitGroup = []
    };
getRow(7)->
    #activityCfg {
    id = 7,
    name = "荒野护送",
    dailyInterfaceid = 0,
    type = 0,
    matchType = 0,
    cycletype = 0,
    cycletime = 0,
    starttime = [{0,11,0},{0,22,0}],
    lenghtime = 7201,
    stage = [{0,1}],
    mapidlist = [6001],
    condition = 0,
    awardlist = [],
    limitApply = 2000,
    limitGroup = []
    };
getRow(8)->
    #activityCfg {
    id = 8,
    name = "深红熔渊",
    dailyInterfaceid = 0,
    type = 0,
    matchType = 0,
    cycletype = 2,
    cycletime = 0,
    starttime = [{0,12,0}],
    lenghtime = 50400,
    stage = [{4,0}],
    mapidlist = [501,502,503,504,505],
    condition = 0,
    awardlist = [],
    limitApply = 2000,
    limitGroup = []
    };
getRow(9)->
    #activityCfg {
    id = 9,
    name = "骑宠领地争夺",
    dailyInterfaceid = 36,
    type = 0,
    matchType = 0,
    cycletype = 2,
    cycletime = 0,
    starttime = [{0,10,0}],
    lenghtime = 43230,
    stage = [{4,0}],
    mapidlist = [],
    condition = 0,
    awardlist = [],
    limitApply = 2000,
    limitGroup = []
    };
getRow(10)->
    #activityCfg {
    id = 10,
    name = "家族精英联赛",
    dailyInterfaceid = 22,
    type = 0,
    matchType = 0,
    cycletype = 3,
    cycletime = 0,
    starttime = [{5,20,15}],
    lenghtime = 2401,
    stage = [{0,1},{1,300},{1,300},{1,300},{4,600},{3,300},{4,600}],
    mapidlist = [4010],
    condition = 0,
    awardlist = [],
    limitApply = 2000,
    limitGroup = []
    };
getRow(11)->
    #activityCfg {
    id = 11,
    name = "跨服战场",
    dailyInterfaceid = 0,
    type = 1,
    matchType = 0,
    cycletype = 0,
    cycletime = 0,
    starttime = [{1,21,0}],
    lenghtime = 1800,
    stage = [{0,1}],
    mapidlist = [6016],
    condition = 0,
    awardlist = [],
    limitApply = 2000,
    limitGroup = []
    };
getRow(12)->
    #activityCfg {
    id = 12,
    name = "血腥角斗",
    dailyInterfaceid = 0,
    type = 1,
    matchType = 0,
    cycletype = 0,
    cycletime = 0,
    starttime = [{0,12,0}],
    lenghtime = 21600,
    stage = [{0,1}],
    mapidlist = [6018,6019,6020],
    condition = 0,
    awardlist = [],
    limitApply = 2000,
    limitGroup = []
    };
getRow(13)->
    #activityCfg {
    id = 13,
    name = "列王纷争",
    dailyInterfaceid = 0,
    type = 0,
    matchType = 0,
    cycletype = 0,
    cycletime = 0,
    starttime = [{2,20,0},{6,20,0}],
    lenghtime = 1810,
    stage = [{4,1800},{0,10}],
    mapidlist = [6030,6031,6032,6033,6034,6035],
    condition = 0,
    awardlist = [],
    limitApply = 2000,
    limitGroup = []
    };
getRow(14)->
    #activityCfg {
    id = 14,
    name = "约会地下城",
    dailyInterfaceid = 0,
    type = 0,
    matchType = 0,
    cycletype = 6,
    cycletime = 0,
    starttime = [],
    lenghtime = 86400,
    stage = [],
    mapidlist = [540,541,542,543],
    condition = 0,
    awardlist = [],
    limitApply = 2000,
    limitGroup = []
    };
getRow(15)->
    #activityCfg {
    id = 15,
    name = "乱世为王",
    dailyInterfaceid = 28,
    type = 0,
    matchType = 0,
    cycletype = 6,
    cycletime = 0,
    starttime = [{0,20,0}],
    lenghtime = 1800,
    stage = [],
    mapidlist = [8000],
    condition = 0,
    awardlist = [],
    limitApply = 2000,
    limitGroup = []
    };
getRow(16)->
    #activityCfg {
    id = 16,
    name = "骑宠竞速",
    dailyInterfaceid = 29,
    type = 1,
    matchType = 0,
    cycletype = 3,
    cycletime = 0,
    starttime = [{2,20,15},{4,20,15},{7,20,15}],
    lenghtime = 1680,
    stage = [{0,1},{1,300},{1,300},{1,300},{2,180},{4,600}],
    mapidlist = [9001],
    condition = 0,
    awardlist = [],
    limitApply = 2000,
    groupApply = [1,2],
    groupMatch = [1,2],
    limitGroup = [5,10,1,1],
    limitForce = [0,0]
    };
getRow(17)->
    #activityCfg {
    id = 17,
    name = "惊天喵盗团",
    dailyInterfaceid = 4,
    type = 0,
    matchType = 0,
    cycletype = 6,
    cycletime = 0,
    starttime = [],
    lenghtime = 86400,
    stage = [],
    mapidlist = [520],
    condition = 0,
    awardlist = [],
    limitApply = 2000,
    limitGroup = []
    };
getRow(18)->
    #activityCfg {
    id = 18,
    name = "元素保卫战",
    dailyInterfaceid = 31,
    type = 0,
    matchType = 0,
    cycletype = 6,
    cycletime = 0,
    starttime = [],
    lenghtime = 86400,
    stage = [],
    mapidlist = [528,529,530,531,532,533,534,535,536],
    condition = 0,
    awardlist = [],
    limitApply = 2000,
    limitGroup = []
    };
getRow(19)->
    #activityCfg {
    id = 19,
    name = "家族雪人",
    dailyInterfaceid = 33,
    type = 0,
    matchType = 0,
    cycletype = 3,
    cycletime = 0,
    starttime = [{2,21,15},{5,21,15}],
    lenghtime = 1630,
    stage = [{0,1},{1,300},{1,300},{1,300},{1,10},{4,600},{0,2},{0,120}],
    mapidlist = [7000],
    condition = 0,
    awardlist = [],
    limitApply = 2000,
    limitGroup = []
    };
getRow(20)->
    #activityCfg {
    id = 20,
    name = "混沌灵界",
    dailyInterfaceid = 0,
    type = 0,
    matchType = 0,
    cycletype = 6,
    cycletime = 0,
    starttime = [{0,0,0}],
    lenghtime = 86400,
    stage = [],
    mapidlist = [],
    condition = 0,
    awardlist = [],
    limitApply = 2000,
    limitGroup = []
    };
getRow(21)->
    #activityCfg {
    id = 21,
    name = "骑宠领地战斗",
    dailyInterfaceid = 36,
    type = 0,
    matchType = 0,
    cycletype = 0,
    cycletime = 0,
    starttime = [{0,0,0}],
    lenghtime = 86400,
    stage = [],
    mapidlist = [6000],
    condition = 0,
    awardlist = [],
    limitApply = 2000,
    limitGroup = []
    };
getRow(22)->
    #activityCfg {
    id = 22,
    name = "限时广场舞",
    dailyInterfaceid = 103,
    type = 0,
    matchType = 0,
    cycletype = 2,
    cycletime = 0,
    starttime = [{0,12,45},{0,19,45}],
    lenghtime = 1490,
    stage = [{0,1},{1,300},{1,300},{2,300},{4,590}],
    mapidlist = [],
    condition = 0,
    awardlist = [],
    limitApply = 2000,
    limitGroup = []
    };
getRow(24)->
    #activityCfg {
    id = 24,
    name = "家族首领",
    dailyInterfaceid = 106,
    type = 0,
    matchType = 0,
    cycletype = 3,
    cycletime = 0,
    starttime = [{1,21,15},{4,21,15},{7,21,15}],
    lenghtime = 1560,
    stage = [{0,1},{1,300},{1,300},{1,300},{4,600},{0,60}],
    mapidlist = [8002],
    condition = 0,
    awardlist = [],
    limitApply = 2000,
    limitGroup = []
    };
getRow(25)->
    #activityCfg {
    id = 25,
    name = "极地求生",
    dailyInterfaceid = 38,
    type = 1,
    matchType = 1,
    cycletype = 2,
    cycletime = 0,
    starttime = [{0,11,45},{0,18,45}],
    lenghtime = 4500,
    stage = [{0,1},{1,300},{1,300},{1,300},{4,3600}],
    mapidlist = [2001],
    condition = 0,
    awardlist = [],
    limitApply = 2000,
    groupApply = [1,1],
    groupMatch = [1,1],
    limitGroup = [6,16,0,0],
    limitForce = [0,0]
    };
getRow(26)->
    #activityCfg {
    id = 26,
    name = "幽界探险(双倍）",
    dailyInterfaceid = 2002,
    type = 1,
    matchType = 0,
    cycletype = 2,
    cycletime = 0,
    starttime = [{0,16,30}],
    lenghtime = 1800,
    stage = [{0,1}],
    mapidlist = [2002],
    condition = 0,
    awardlist = [],
    limitApply = 0,
    groupApply = [],
    groupMatch = [],
    limitGroup = [],
    limitForce = []
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
    {24},
    {25},
    {26}
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
    24,
    25,
    26
    ].

