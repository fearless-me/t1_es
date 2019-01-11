%% coding: latin-1
%%: 实现
-module(cfg_mainmenu_FunctionOpen_chs).
-compile(export_all).
-include("cfg_mainmenu_FunctionOpen.hrl").
-include("logger.hrl").

getRow(1)->
    #mainmenu_FunctionOpenCfg {
    id = 1,
    type = 1,
    param = 2,
    name = "新技能",
    namedescribe = "3级开启",
    describe = "角色第一个技能即将开启",
    icon = "MenuIcon_20"
    };
getRow(2)->
    #mainmenu_FunctionOpenCfg {
    id = 2,
    type = 1,
    param = 4,
    name = "新技能",
    namedescribe = "4级开启",
    describe = "角色第二个技能即将开启",
    icon = "MenuIcon_20"
    };
getRow(3)->
    #mainmenu_FunctionOpenCfg {
    id = 3,
    type = 1,
    param = 5,
    name = "必杀技",
    namedescribe = "5级开启",
    describe = "必杀技即将开启",
    icon = "MenuIcon_32"
    };
getRow(4)->
    #mainmenu_FunctionOpenCfg {
    id = 4,
    type = 1,
    param = 6,
    name = "图鉴",
    namedescribe = "6级开启",
    describe = "图鉴功能即将开启",
    icon = "MenuIcon_21"
    };
getRow(5)->
    #mainmenu_FunctionOpenCfg {
    id = 5,
    type = 1,
    param = 7,
    name = "装备精炼",
    namedescribe = "7级开启",
    describe = "强化-精炼功能即将开启",
    icon = "MenuIcon_7"
    };
getRow(6)->
    #mainmenu_FunctionOpenCfg {
    id = 6,
    type = 1,
    param = 8,
    name = "骑宠",
    namedescribe = "8级开启",
    describe = "骑宠功能即将开启",
    icon = "MenuIcon_14"
    };
getRow(7)->
    #mainmenu_FunctionOpenCfg {
    id = 7,
    type = 1,
    param = 10,
    name = "蓝色武器",
    namedescribe = "10级获得",
    describe = "10级蓝色武器即将获得",
    icon = "MenuIcon_35"
    };
getRow(8)->
    #mainmenu_FunctionOpenCfg {
    id = 8,
    type = 1,
    param = 11,
    name = "新技能",
    namedescribe = "11级开启",
    describe = "角色第四个技能即将开启",
    icon = "MenuIcon_20"
    };
getRow(9)->
    #mainmenu_FunctionOpenCfg {
    id = 9,
    type = 2,
    param = 95,
    name = "扭蛋",
    namedescribe = "即将开启",
    describe = "扭蛋功能即将开启",
    icon = "MenuIcon_11"
    };
getRow(10)->
    #mainmenu_FunctionOpenCfg {
    id = 10,
    type = 2,
    param = 101,
    name = "家族",
    namedescribe = "即将开启",
    describe = "家族功能即将开启",
    icon = "MenuIcon_25"
    };
getRow(11)->
    #mainmenu_FunctionOpenCfg {
    id = 11,
    type = 2,
    param = 105,
    name = "衣帽间",
    namedescribe = "即将开启",
    describe = "衣帽间功能即将开启",
    icon = "MenuIcon_4"
    };
getRow(12)->
    #mainmenu_FunctionOpenCfg {
    id = 12,
    type = 2,
    param = 107,
    name = "婚姻",
    namedescribe = "即将开启",
    describe = "婚姻功能即将开启",
    icon = "MenuIcon_8"
    };
getRow(13)->
    #mainmenu_FunctionOpenCfg {
    id = 13,
    type = 2,
    param = 111,
    name = "交易行",
    namedescribe = "即将开启",
    describe = "交易行功能即将开启",
    icon = "MenuIcon_10"
    };
getRow(14)->
    #mainmenu_FunctionOpenCfg {
    id = 14,
    type = 1,
    param = 17,
    name = "经验升降梯",
    namedescribe = "17级开启",
    describe = "玩法-经验升降梯即将开启",
    icon = "MenuIcon_28"
    };
getRow(15)->
    #mainmenu_FunctionOpenCfg {
    id = 15,
    type = 2,
    param = 124,
    name = "装备升星",
    namedescribe = "即将开启",
    describe = "强化-升星功能即将开启",
    icon = "MenuIcon_7"
    };
getRow(16)->
    #mainmenu_FunctionOpenCfg {
    id = 16,
    type = 2,
    param = 128,
    name = "家园",
    namedescribe = "即将开启",
    describe = "家园功能即将开启",
    icon = "MenuIcon_9"
    };
getRow(17)->
    #mainmenu_FunctionOpenCfg {
    id = 17,
    type = 1,
    param = 20,
    name = "一转",
    namedescribe = "20级开启",
    describe = "一转即将开启",
    icon = "MenuIcon_33"
    };
getRow(18)->
    #mainmenu_FunctionOpenCfg {
    id = 18,
    type = 2,
    param = 175,
    name = "合成",
    namedescribe = "即将开启",
    describe = "合成功能即将开启",
    icon = "MenuIcon_7"
    };
getRow(19)->
    #mainmenu_FunctionOpenCfg {
    id = 19,
    type = 1,
    param = 26,
    name = "骑宠装备",
    namedescribe = "26级开启",
    describe = "骑宠装备功能即将开启",
    icon = "MenuIcon_14"
    };
getRow(20)->
    #mainmenu_FunctionOpenCfg {
    id = 20,
    type = 1,
    param = 30,
    name = "挑战副本",
    namedescribe = "30级开启",
    describe = "玩法-挑战副本即将开启",
    icon = "MenuIcon_28"
    };
getRow(21)->
    #mainmenu_FunctionOpenCfg {
    id = 21,
    type = 1,
    param = 35,
    name = "守护女神",
    namedescribe = "35级开启",
    describe = "玩法-守护女神即将开启",
    icon = "MenuIcon_28"
    };
getRow(22)->
    #mainmenu_FunctionOpenCfg {
    id = 22,
    type = 1,
    param = 40,
    name = "深红熔渊",
    namedescribe = "40级开启",
    describe = "玩法-深红熔渊即将开启",
    icon = "MenuIcon_28"
    };
getRow(23)->
    #mainmenu_FunctionOpenCfg {
    id = 23,
    type = 1,
    param = 60,
    name = "首领禁地",
    namedescribe = "60级开启",
    describe = "玩法-首领禁地即将开启",
    icon = "MenuIcon_28"
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
    {23}
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
    23
    ].

