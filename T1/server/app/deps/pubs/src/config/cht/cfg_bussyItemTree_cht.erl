%% coding: latin-1
%%: 实现
-module(cfg_bussyItemTree_cht).
-compile(export_all).
-include("cfg_bussyItemTree.hrl").
-include("logger.hrl").

getRow(1)->
    #bussyItemTreeCfg {
    order = 10,
    isFirst = 1,
    mainType = 1,
    type = [-1],
    text = "装备",
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
    order = 11,
    isFirst = 0,
    mainType = 1,
    type = [-1],
    text = "全部",
    icon = 1005,
    quality = -1,
    subType = -1,
    qualityRangeShow = 1,
    weaponRangeShow = 0,
    raceRangeShow = 0,
    levelRangeShow = 1
    };
getRow(3)->
    #bussyItemTreeCfg {
    order = 12,
    isFirst = 0,
    mainType = 1,
    type = [0],
    text = "武器",
    icon = 1001,
    quality = -1,
    subType = -1,
    qualityRangeShow = 1,
    weaponRangeShow = 1,
    raceRangeShow = 0,
    levelRangeShow = 1
    };
getRow(4)->
    #bussyItemTreeCfg {
    order = 13,
    isFirst = 0,
    mainType = 1,
    type = [1],
    text = "头盔",
    icon = 1302,
    quality = -1,
    subType = -1,
    qualityRangeShow = 1,
    weaponRangeShow = 0,
    raceRangeShow = 1,
    levelRangeShow = 1
    };
getRow(5)->
    #bussyItemTreeCfg {
    order = 14,
    isFirst = 0,
    mainType = 1,
    type = [2],
    text = "耳环",
    icon = 201,
    quality = -1,
    subType = -1,
    qualityRangeShow = 1,
    weaponRangeShow = 0,
    raceRangeShow = 1,
    levelRangeShow = 1
    };
getRow(6)->
    #bussyItemTreeCfg {
    order = 15,
    isFirst = 0,
    mainType = 1,
    type = [3],
    text = "衣服",
    icon = 1105,
    quality = -1,
    subType = -1,
    qualityRangeShow = 1,
    weaponRangeShow = 0,
    raceRangeShow = 1,
    levelRangeShow = 1
    };
getRow(7)->
    #bussyItemTreeCfg {
    order = 16,
    isFirst = 0,
    mainType = 1,
    type = [4],
    text = "项链",
    icon = 101,
    quality = -1,
    subType = -1,
    qualityRangeShow = 1,
    weaponRangeShow = 0,
    raceRangeShow = 1,
    levelRangeShow = 1
    };
getRow(8)->
    #bussyItemTreeCfg {
    order = 17,
    isFirst = 0,
    mainType = 1,
    type = [5],
    text = "裤子",
    icon = 1402,
    quality = -1,
    subType = -1,
    qualityRangeShow = 1,
    weaponRangeShow = 0,
    raceRangeShow = 1,
    levelRangeShow = 1
    };
getRow(9)->
    #bussyItemTreeCfg {
    order = 18,
    isFirst = 0,
    mainType = 1,
    type = [6],
    text = "戒指",
    icon = 1,
    quality = -1,
    subType = -1,
    qualityRangeShow = 1,
    weaponRangeShow = 0,
    raceRangeShow = 1,
    levelRangeShow = 1
    };
getRow(10)->
    #bussyItemTreeCfg {
    order = 19,
    isFirst = 0,
    mainType = 1,
    type = [7],
    text = "鞋子",
    icon = 2202,
    quality = -1,
    subType = -1,
    qualityRangeShow = 1,
    weaponRangeShow = 0,
    raceRangeShow = 1,
    levelRangeShow = 1
    };
getRow(11)->
    #bussyItemTreeCfg {
    order = 21,
    isFirst = 1,
    mainType = 2,
    type = [3,50],
    text = "装备材料",
    icon = 0,
    quality = -1,
    subType = -1,
    qualityRangeShow = 0,
    weaponRangeShow = 0,
    raceRangeShow = 0,
    levelRangeShow = 0
    };
getRow(12)->
    #bussyItemTreeCfg {
    order = 22,
    isFirst = 0,
    mainType = 2,
    type = [3,50],
    text = "全部",
    icon = 7158,
    quality = -1,
    subType = -1,
    qualityRangeShow = 0,
    weaponRangeShow = 0,
    raceRangeShow = 0,
    levelRangeShow = 1
    };
getRow(13)->
    #bussyItemTreeCfg {
    order = 23,
    isFirst = 0,
    mainType = 2,
    type = [3],
    text = "红装",
    icon = 7118,
    quality = 3,
    subType = -1,
    qualityRangeShow = 0,
    weaponRangeShow = 0,
    raceRangeShow = 0,
    levelRangeShow = 1
    };
getRow(14)->
    #bussyItemTreeCfg {
    order = 24,
    isFirst = 0,
    mainType = 2,
    type = [3],
    text = "紫装",
    icon = 7119,
    quality = 4,
    subType = -1,
    qualityRangeShow = 0,
    weaponRangeShow = 0,
    raceRangeShow = 0,
    levelRangeShow = 1
    };
getRow(15)->
    #bussyItemTreeCfg {
    order = 25,
    isFirst = 0,
    mainType = 2,
    type = [50],
    text = "附魔材料",
    icon = 7240,
    quality = -1,
    subType = 10,
    qualityRangeShow = 0,
    weaponRangeShow = 0,
    raceRangeShow = 0,
    levelRangeShow = 1
    };
getRow(16)->
    #bussyItemTreeCfg {
    order = 31,
    isFirst = 1,
    mainType = 2,
    type = [28,9],
    text = "骑宠",
    icon = 0,
    quality = -1,
    subType = -1,
    qualityRangeShow = 0,
    weaponRangeShow = 0,
    raceRangeShow = 0,
    levelRangeShow = 0
    };
getRow(17)->
    #bussyItemTreeCfg {
    order = 32,
    isFirst = 0,
    mainType = 2,
    type = [28,9],
    text = "全部",
    icon = 1011,
    quality = -1,
    subType = -1,
    qualityRangeShow = 0,
    weaponRangeShow = 0,
    raceRangeShow = 0,
    levelRangeShow = 0
    };
getRow(18)->
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
getRow(19)->
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
getRow(20)->
    #bussyItemTreeCfg {
    order = 35,
    isFirst = 0,
    mainType = 2,
    type = [9],
    text = "骑宠技能书",
    icon = 6712,
    quality = -1,
    subType = 20,
    qualityRangeShow = 0,
    weaponRangeShow = 0,
    raceRangeShow = 0,
    levelRangeShow = 0
    };
getRow(21)->
    #bussyItemTreeCfg {
    order = 41,
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
getRow(22)->
    #bussyItemTreeCfg {
    order = 42,
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
getRow(23)->
    #bussyItemTreeCfg {
    order = 43,
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
getRow(24)->
    #bussyItemTreeCfg {
    order = 44,
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
getRow(25)->
    #bussyItemTreeCfg {
    order = 45,
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
getRow(26)->
    #bussyItemTreeCfg {
    order = 46,
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
getRow(27)->
    #bussyItemTreeCfg {
    order = 47,
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
getRow(28)->
    #bussyItemTreeCfg {
    order = 48,
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
getRow(29)->
    #bussyItemTreeCfg {
    order = 51,
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
getRow(30)->
    #bussyItemTreeCfg {
    order = 52,
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
getRow(31)->
    #bussyItemTreeCfg {
    order = 53,
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
getRow(32)->
    #bussyItemTreeCfg {
    order = 54,
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
getRow(33)->
    #bussyItemTreeCfg {
    order = 55,
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
getRow(34)->
    #bussyItemTreeCfg {
    order = 56,
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
getRow(35)->
    #bussyItemTreeCfg {
    order = 57,
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
getRow(36)->
    #bussyItemTreeCfg {
    order = 58,
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

