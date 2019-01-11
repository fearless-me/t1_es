%% coding: latin-1
%%: 实现
-module(cfg_accessresources_exp_chs).
-compile(export_all).
-include("cfg_accessresources_exp.hrl").
-include("logger.hrl").

getRow(1)->
    #accessresources_expCfg {
    id = 1,
    icon = 6014,
    name = "经验升降梯",
    desc = "[ff6a00]【日常活动】[-]完成每日挑战，获取海量经验。",
    star = 5,
    ralation_ui = [22,30]
    };
getRow(2)->
    #accessresources_expCfg {
    id = 2,
    icon = 6014,
    name = "吟游任务",
    desc = "[ff6a00]【单人任务】[-]完成吟游诗人发布的一次性清理魔物任务，获取大量经验。",
    star = 4,
    ralation_ui = [4,8]
    };
getRow(3)->
    #accessresources_expCfg {
    id = 3,
    icon = 6014,
    name = "日常任务",
    desc = "[ff6a00]【日常任务】[-]完成日常环线任务（每日10环），获取大量经验。",
    star = 4,
    ralation_ui = [4,10]
    };
getRow(4)->
    #accessresources_expCfg {
    id = 4,
    icon = 6014,
    name = "限时广场舞",
    desc = "[ff6a00]【限时活动】【13:00~13:30】【20:00~20:30】[-]娱乐至上！一边跳舞一边获得经验！",
    star = 3,
    ralation_ui = [64,0]
    };
getRow(5)->
    #accessresources_expCfg {
    id = 5,
    icon = 6014,
    name = "女神禁闭室",
    desc = "[ff6a00]【首通奖励】[-]挑战层层魔物，领取首通奖励，以实力换取经验！",
    star = 3,
    ralation_ui = [22,13]
    };
getRow(6)->
    #accessresources_expCfg {
    id = 6,
    icon = 6014,
    name = "野外怪物",
    desc = "[ff6a00]【日常互动】[-]野外挂机打怪，以时间换取大量经验。",
    star = 3,
    ralation_ui = [22,105]
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

