%% coding: latin-1
%%: 实现
-module(cfg_dailyActive_cht).
-compile(export_all).
-include("cfg_dailyActive.hrl").


getRow(4)->
    #dailyActiveCfg {
    iD = 4,
    sort = 6,
    name = "完成家族的委托",
    type = 3,
    subType = 15,
    activeDegree = 5,
    limit = 2,
    relation_UI = [15,0],
    completeCondition = 0,
    itemshow = 4200,
    activeReward = 0
    };
getRow(5)->
    #dailyActiveCfg {
    iD = 5,
    sort = 7,
    name = "参与女神禁闭室",
    type = 2,
    subType = 13,
    activeDegree = 10,
    limit = 1,
    relation_UI = [22,13],
    completeCondition = 1,
    itemshow = 4303,
    activeReward = 0
    };
getRow(6)->
    #dailyActiveCfg {
    iD = 6,
    sort = 4,
    name = "参与守护女神",
    type = 2,
    subType = 1,
    activeDegree = 10,
    limit = 1,
    relation_UI = [22,1],
    completeCondition = 1,
    itemshow = 20,
    activeReward = 0
    };
getRow(7)->
    #dailyActiveCfg {
    iD = 7,
    sort = 3,
    name = "通关惊天喵盗团",
    type = 2,
    subType = 4,
    activeDegree = 5,
    limit = 2,
    relation_UI = [22,4],
    completeCondition = 0,
    itemshow = 700,
    activeReward = 0
    };
getRow(9)->
    #dailyActiveCfg {
    iD = 9,
    sort = 5,
    name = "参与竞技场",
    type = 2,
    subType = 16,
    activeDegree = 2,
    limit = 5,
    relation_UI = [22,16],
    completeCondition = 1,
    itemshow = 902,
    activeReward = 0
    };
getRow(10)->
    #dailyActiveCfg {
    iD = 10,
    sort = 9,
    name = "参与经验升降梯",
    type = 2,
    subType = 30,
    activeDegree = 5,
    limit = 2,
    relation_UI = [22,30],
    completeCondition = 1,
    itemshow = 1,
    activeReward = 0
    };
getRow(12)->
    #dailyActiveCfg {
    iD = 12,
    sort = 11,
    name = "通关元素保卫战",
    type = 2,
    subType = 31,
    activeDegree = 10,
    limit = 2,
    relation_UI = [22,31],
    completeCondition = 0,
    itemshow = 7000,
    activeReward = 0
    };
getRow(15)->
    #dailyActiveCfg {
    iD = 15,
    sort = 14,
    name = "通关史莱姆秘境",
    type = 2,
    subType = 37,
    activeDegree = 5,
    limit = 2,
    relation_UI = [22,37],
    completeCondition = 0,
    itemshow = 11,
    activeReward = 0
    };
getRow(16)->
    #dailyActiveCfg {
    iD = 16,
    sort = 15,
    name = "永不停歇获得全部经验",
    type = 2,
    subType = 105,
    activeDegree = 10,
    limit = 1,
    relation_UI = [22,105],
    completeCondition = 0,
    itemshow = 11,
    activeReward = 0
    };
getRow(17)->
    #dailyActiveCfg {
    iD = 17,
    sort = 16,
    name = "完成家园种植",
    type = 3,
    subType = 0,
    activeDegree = 5,
    limit = 1,
    relation_UI = [60,0],
    completeCondition = 0,
    itemshow = 11,
    activeReward = 0
    };
getRow(18)->
    #dailyActiveCfg {
    iD = 18,
    sort = 17,
    name = "进行家族祈愿",
    type = 3,
    subType = 0,
    activeDegree = 5,
    limit = 1,
    relation_UI = [15,0],
    completeCondition = 0,
    itemshow = 11,
    activeReward = 0
    };
getRow(19)->
    #dailyActiveCfg {
    iD = 19,
    sort = 18,
    name = "进入约会地下城",
    type = 2,
    subType = 35,
    activeDegree = 5,
    limit = 1,
    relation_UI = [22,35],
    completeCondition = 1,
    itemshow = 11,
    activeReward = 0
    };
getRow(20)->
    #dailyActiveCfg {
    iD = 20,
    sort = 19,
    name = "骑宠领地开采",
    type = 2,
    subType = 36,
    activeDegree = 5,
    limit = 1,
    relation_UI = [22,36],
    completeCondition = 0,
    itemshow = 11,
    activeReward = 0
    };
getRow(21)->
    #dailyActiveCfg {
    iD = 21,
    sort = 20,
    name = "精炼装备",
    type = 3,
    subType = 0,
    activeDegree = 10,
    limit = 1,
    relation_UI = [9,0],
    completeCondition = 0,
    itemshow = 11,
    activeReward = 0
    };
getRow(22)->
    #dailyActiveCfg {
    iD = 22,
    sort = 21,
    name = "骑宠升星",
    type = 3,
    subType = 0,
    activeDegree = 10,
    limit = 1,
    relation_UI = [5,0],
    completeCondition = 0,
    itemshow = 11,
    activeReward = 0
    };
getRow(23)->
    #dailyActiveCfg {
    iD = 23,
    sort = 22,
    name = "扭蛋抽取",
    type = 3,
    subType = 0,
    activeDegree = 5,
    limit = 2,
    relation_UI = [53,0],
    completeCondition = 0,
    itemshow = 11,
    activeReward = 0
    };
getRow(24)->
    #dailyActiveCfg {
    iD = 24,
    sort = 23,
    name = "家族祈福",
    type = 3,
    subType = 0,
    activeDegree = 5,
    limit = 1,
    relation_UI = [15,0],
    completeCondition = 0,
    itemshow = 11,
    activeReward = 0
    };
getRow(_)->[].

getKeyList()->[
    {4},
    {5},
    {6},
    {7},
    {9},
    {10},
    {12},
    {15},
    {16},
    {17},
    {18},
    {19},
    {20},
    {21},
    {22},
    {23},
    {24}
    ].

get1KeyList()->[
    4,
    5,
    6,
    7,
    9,
    10,
    12,
    15,
    16,
    17,
    18,
    19,
    20,
    21,
    22,
    23,
    24
    ].

