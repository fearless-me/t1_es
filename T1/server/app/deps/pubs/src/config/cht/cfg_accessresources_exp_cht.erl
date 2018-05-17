%% coding: latin-1
%%: 实现
-module(cfg_accessresources_exp_cht).
-compile(export_all).
-include("cfg_accessresources_exp.hrl").


getRow(1)->
    #accessresources_expCfg {
    id = 1,
    icon = 6014,
    name = "经验升降梯",
    desc = "单人活动，每日挑战获得海量经验。",
    star = 5,
    ralation_ui = [22,30]
    };
getRow(2)->
    #accessresources_expCfg {
    id = 2,
    icon = 6014,
    name = "野外怪物",
    desc = "野外挂机打怪，以时间换取大量经验。",
    star = 4,
    ralation_ui = [22,105]
    };
getRow(3)->
    #accessresources_expCfg {
    id = 3,
    icon = 6014,
    name = "家族任务",
    desc = "为家族贡献你的力量，换取大量经验。",
    star = 4,
    ralation_ui = [15,0]
    };
getRow(4)->
    #accessresources_expCfg {
    id = 4,
    icon = 6014,
    name = "吟游任务",
    desc = "休息一下，看看沿途的风景！",
    star = 4,
    ralation_ui = [4,8]
    };
getRow(5)->
    #accessresources_expCfg {
    id = 5,
    icon = 6014,
    name = "限时广场舞",
    desc = "娱乐至上！一边跳舞一边获得经验！",
    star = 3,
    ralation_ui = [22,103]
    };
getRow(6)->
    #accessresources_expCfg {
    id = 6,
    icon = 6014,
    name = "女神禁闭室",
    desc = "挑战层层魔物，以实力换取经验！",
    star = 3,
    ralation_ui = [22,13]
    };
getRow(_)->[].

getKeyList()->[
    {1},
    {2},
    {3},
    {4},
    {5},
    {6}
    ].

get1KeyList()->[
    1,
    2,
    3,
    4,
    5,
    6
    ].

