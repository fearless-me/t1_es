%% coding: latin-1
%%: 实现
-module(cfg_bussyItemTree_chs).
-compile(export_all).
-include("cfg_bussyItemTree.hrl").
-include("logger.hrl").

getRow(1)->
    #bussyItemTreeCfg {
    order = 11,
    isFirst = 1,
    mainType = 2,
    type = [3],
    text = "装备材料",
    icon = 0,
    quality = -1,
    subType = -1,
    qualityRangeShow = 0,
    weaponRangeShow = 0,
    raceRangeShow = 0,
    levelRangeShow = 0
    };
getRow(2)->
    #bussyItemTreeCfg {
    order = 12,
    isFirst = 0,
    mainType = 2,
    type = [3],
    text = "全部",
    icon = 7158,
    quality = -1,
    subType = -1,
    qualityRangeShow = 0,
    weaponRangeShow = 0,
    raceRangeShow = 0,
    levelRangeShow = 1
    };
getRow(3)->
    #bussyItemTreeCfg {
    order = 13,
    isFirst = 0,
    mainType = 2,
    type = [3],
    text = "红装材料",
    icon = 7118,
    quality = 3,
    subType = -1,
    qualityRangeShow = 0,
    weaponRangeShow = 0,
    raceRangeShow = 0,
    levelRangeShow = 1
    };
getRow(4)->
    #bussyItemTreeCfg {
    order = 14,
    isFirst = 0,
    mainType = 2,
    type = [3],
    text = "紫装材料",
    icon = 7119,
    quality = 4,
    subType = -1,
    qualityRangeShow = 0,
    weaponRangeShow = 0,
    raceRangeShow = 0,
    levelRangeShow = 1
    };
getRow(5)->
    #bussyItemTreeCfg {
    order = 21,
    isFirst = 1,
    mainType = 2,
    type = [50,60,14],
    text = "角色强化",
    icon = 0,
    quality = -1,
    subType = -1,
    qualityRangeShow = 0,
    weaponRangeShow = 0,
    raceRangeShow = 0,
    levelRangeShow = 0
    };
getRow(6)->
    #bussyItemTreeCfg {
    order = 22,
    isFirst = 0,
    mainType = 2,
    type = [50,60,14],
    text = "全部",
    icon = 7234,
    quality = -1,
    subType = -1,
    qualityRangeShow = 0,
    weaponRangeShow = 0,
    raceRangeShow = 0,
    levelRangeShow = 0
    };
getRow(7)->
    #bussyItemTreeCfg {
    order = 23,
    isFirst = 0,
    mainType = 2,
    type = [50],
    text = "装备升星突破",
    icon = 7231,
    quality = -1,
    subType = 11,
    qualityRangeShow = 0,
    weaponRangeShow = 0,
    raceRangeShow = 0,
    levelRangeShow = 0
    };
getRow(8)->
    #bussyItemTreeCfg {
    order = 26,
    isFirst = 0,
    mainType = 2,
    type = [60],
    text = "暗夜之石",
    icon = 9411,
    quality = -1,
    subType = -1,
    qualityRangeShow = 0,
    weaponRangeShow = 0,
    raceRangeShow = 0,
    levelRangeShow = 0
    };
getRow(9)->
    #bussyItemTreeCfg {
    order = 27,
    isFirst = 0,
    mainType = 2,
    type = [14],
    text = "婚戒突破",
    icon = 131,
    quality = -1,
    subType = -1,
    qualityRangeShow = 0,
    weaponRangeShow = 0,
    raceRangeShow = 0,
    levelRangeShow = 0
    };
getRow(10)->
    #bussyItemTreeCfg {
    order = 31,
    isFirst = 1,
    mainType = 2,
    type = [28],
    text = "骑宠",
    icon = 0,
    quality = -1,
    subType = -1,
    qualityRangeShow = 0,
    weaponRangeShow = 0,
    raceRangeShow = 0,
    levelRangeShow = 0
    };
getRow(11)->
    #bussyItemTreeCfg {
    order = 32,
    isFirst = 0,
    mainType = 2,
    type = [28],
    text = "全部",
    icon = 1011,
    quality = -1,
    subType = -1,
    qualityRangeShow = 0,
    weaponRangeShow = 0,
    raceRangeShow = 0,
    levelRangeShow = 0
    };
getRow(12)->
    #bussyItemTreeCfg {
    order = 33,
    isFirst = 0,
    mainType = 2,
    type = [28],
    text = "红宠",
    icon = 1034,
    quality = 3,
    subType = -1,
    qualityRangeShow = 0,
    weaponRangeShow = 0,
    raceRangeShow = 0,
    levelRangeShow = 0
    };
getRow(13)->
    #bussyItemTreeCfg {
    order = 34,
    isFirst = 0,
    mainType = 2,
    type = [28],
    text = "紫宠",
    icon = 1018,
    quality = 4,
    subType = -1,
    qualityRangeShow = 0,
    weaponRangeShow = 0,
    raceRangeShow = 0,
    levelRangeShow = 0
    };
getRow(14)->
    #bussyItemTreeCfg {
    order = 41,
    isFirst = 1,
    mainType = 2,
    type = [28],
    text = "骑宠强化",
    icon = 0,
    quality = -1,
    subType = -1,
    qualityRangeShow = 0,
    weaponRangeShow = 0,
    raceRangeShow = 0,
    levelRangeShow = 0
    };
getRow(15)->
    #bussyItemTreeCfg {
    order = 42,
    isFirst = 0,
    mainType = 2,
    type = [9],
    text = "全部",
    icon = 409,
    quality = -1,
    subType = -1,
    qualityRangeShow = 0,
    weaponRangeShow = 0,
    raceRangeShow = 0,
    levelRangeShow = 0
    };
getRow(16)->
    #bussyItemTreeCfg {
    order = 43,
    isFirst = 0,
    mainType = 2,
    type = [9],
    text = "骑宠升星突破",
    icon = 407,
    quality = -1,
    subType = 6,
    qualityRangeShow = 0,
    weaponRangeShow = 0,
    raceRangeShow = 0,
    levelRangeShow = 0
    };
getRow(17)->
    #bussyItemTreeCfg {
    order = 51,
    isFirst = 1,
    mainType = 2,
    type = [6,57],
    text = "时装外观",
    icon = 0,
    quality = -1,
    subType = -1,
    qualityRangeShow = 0,
    weaponRangeShow = 0,
    raceRangeShow = 0,
    levelRangeShow = 0
    };
getRow(18)->
    #bussyItemTreeCfg {
    order = 52,
    isFirst = 0,
    mainType = 2,
    type = [6,57],
    text = "全部",
    icon = 98,
    quality = -1,
    subType = -1,
    qualityRangeShow = 0,
    weaponRangeShow = 0,
    raceRangeShow = 0,
    levelRangeShow = 0
    };
getRow(19)->
    #bussyItemTreeCfg {
    order = 53,
    isFirst = 0,
    mainType = 2,
    type = [6,57],
    text = "武器装扮",
    icon = 8817,
    quality = -1,
    subType = 1,
    qualityRangeShow = 0,
    weaponRangeShow = 0,
    raceRangeShow = 0,
    levelRangeShow = 0
    };
getRow(20)->
    #bussyItemTreeCfg {
    order = 54,
    isFirst = 0,
    mainType = 2,
    type = [6,57],
    text = "头饰",
    icon = 2029,
    quality = -1,
    subType = 2,
    qualityRangeShow = 0,
    weaponRangeShow = 0,
    raceRangeShow = 0,
    levelRangeShow = 0
    };
getRow(21)->
    #bussyItemTreeCfg {
    order = 55,
    isFirst = 0,
    mainType = 2,
    type = [6,57],
    text = "服装",
    icon = 2032,
    quality = -1,
    subType = 3,
    qualityRangeShow = 0,
    weaponRangeShow = 0,
    raceRangeShow = 0,
    levelRangeShow = 0
    };
getRow(22)->
    #bussyItemTreeCfg {
    order = 56,
    isFirst = 0,
    mainType = 2,
    type = [6,57],
    text = "翅膀",
    icon = 5002,
    quality = -1,
    subType = 4,
    qualityRangeShow = 0,
    weaponRangeShow = 0,
    raceRangeShow = 0,
    levelRangeShow = 0
    };
getRow(23)->
    #bussyItemTreeCfg {
    order = 57,
    isFirst = 0,
    mainType = 2,
    type = [6,57],
    text = "小精灵",
    icon = 2085,
    quality = -1,
    subType = 5,
    qualityRangeShow = 0,
    weaponRangeShow = 0,
    raceRangeShow = 0,
    levelRangeShow = 0
    };
getRow(24)->
    #bussyItemTreeCfg {
    order = 58,
    isFirst = 0,
    mainType = 2,
    type = [6,57],
    text = "表情",
    icon = 2070,
    quality = -1,
    subType = 6,
    qualityRangeShow = 0,
    weaponRangeShow = 0,
    raceRangeShow = 0,
    levelRangeShow = 0
    };
getRow(25)->
    #bussyItemTreeCfg {
    order = 61,
    isFirst = 1,
    mainType = 2,
    type = [31,37,38,39,40,41],
    text = "生活技能",
    icon = 0,
    quality = -1,
    subType = -1,
    qualityRangeShow = 0,
    weaponRangeShow = 0,
    raceRangeShow = 0,
    levelRangeShow = 0
    };
getRow(26)->
    #bussyItemTreeCfg {
    order = 62,
    isFirst = 0,
    mainType = 2,
    type = [31,37,38,39,40,41],
    text = "全部",
    icon = 6407,
    quality = -1,
    subType = -1,
    qualityRangeShow = 0,
    weaponRangeShow = 0,
    raceRangeShow = 0,
    levelRangeShow = 0
    };
getRow(27)->
    #bussyItemTreeCfg {
    order = 63,
    isFirst = 0,
    mainType = 2,
    type = [31],
    text = "种植",
    icon = 4016,
    quality = -1,
    subType = -1,
    qualityRangeShow = 0,
    weaponRangeShow = 0,
    raceRangeShow = 0,
    levelRangeShow = 0
    };
getRow(28)->
    #bussyItemTreeCfg {
    order = 64,
    isFirst = 0,
    mainType = 2,
    type = [37],
    text = "鱼类",
    icon = 6409,
    quality = -1,
    subType = -1,
    qualityRangeShow = 0,
    weaponRangeShow = 0,
    raceRangeShow = 0,
    levelRangeShow = 0
    };
getRow(29)->
    #bussyItemTreeCfg {
    order = 65,
    isFirst = 0,
    mainType = 2,
    type = [40],
    text = "矿石",
    icon = 6312,
    quality = -1,
    subType = -1,
    qualityRangeShow = 0,
    weaponRangeShow = 0,
    raceRangeShow = 0,
    levelRangeShow = 0
    };
getRow(30)->
    #bussyItemTreeCfg {
    order = 66,
    isFirst = 0,
    mainType = 2,
    type = [39],
    text = "狩猎",
    icon = 6365,
    quality = -1,
    subType = -1,
    qualityRangeShow = 0,
    weaponRangeShow = 0,
    raceRangeShow = 0,
    levelRangeShow = 0
    };
getRow(31)->
    #bussyItemTreeCfg {
    order = 67,
    isFirst = 0,
    mainType = 2,
    type = [38],
    text = "烹饪",
    icon = 6462,
    quality = -1,
    subType = -1,
    qualityRangeShow = 0,
    weaponRangeShow = 0,
    raceRangeShow = 0,
    levelRangeShow = 0
    };
getRow(32)->
    #bussyItemTreeCfg {
    order = 68,
    isFirst = 0,
    mainType = 2,
    type = [41],
    text = "家具",
    icon = 6530,
    quality = -1,
    subType = -1,
    qualityRangeShow = 0,
    weaponRangeShow = 0,
    raceRangeShow = 0,
    levelRangeShow = 0
    };
getRow(33)->
    #bussyItemTreeCfg {
    order = 71,
    isFirst = 1,
    mainType = 2,
    type = [8,52],
    text = "其他",
    icon = 0,
    quality = -1,
    subType = -1,
    qualityRangeShow = 0,
    weaponRangeShow = 0,
    raceRangeShow = 0,
    levelRangeShow = 0
    };
getRow(34)->
    #bussyItemTreeCfg {
    order = 72,
    isFirst = 0,
    mainType = 2,
    type = [8,52],
    text = "全部",
    icon = 8011,
    quality = -1,
    subType = -1,
    qualityRangeShow = 0,
    weaponRangeShow = 0,
    raceRangeShow = 0,
    levelRangeShow = 0
    };
getRow(35)->
    #bussyItemTreeCfg {
    order = 73,
    isFirst = 0,
    mainType = 2,
    type = [52],
    text = "其他",
    icon = 8011,
    quality = -1,
    subType = -1,
    qualityRangeShow = 0,
    weaponRangeShow = 0,
    raceRangeShow = 0,
    levelRangeShow = 0
    };
getRow(36)->
    #bussyItemTreeCfg {
    order = 74,
    isFirst = 0,
    mainType = 2,
    type = [8],
    text = "道具包",
    icon = 6264,
    quality = -1,
    subType = -1,
    qualityRangeShow = 0,
    weaponRangeShow = 0,
    raceRangeShow = 0,
    levelRangeShow = 0
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
    {33},
    {34},
    {35},
    {36}
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
    33,
    34,
    35,
    36
    ].

