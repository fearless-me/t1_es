%% coding: latin-1
%%: 实现
-module(cfg_race_chaosmode_chs).
-compile(export_all).
-include("cfg_race_chaosmode.hrl").
-include("logger.hrl").

getRow(1)->
    #race_chaosmodeCfg {
    id = 1,
    icon = 2000,
    name = "[fffabf]【普通模式】[-]",
    text = "请正常的奔跑",
    text2 = "[A6A6A6]环绕港口2圈[-][fffabf]（今日为普通模式）[-]"
    };
getRow(2)->
    #race_chaosmodeCfg {
    id = 2,
    icon = 2001,
    name = "[fffabf]【双倍模式】[-]",
    text = "从道具箱中将获得两个道具",
    text2 = "[A6A6A6]环绕港口2圈[-][fffabf]（今日为双倍道具模式）[-]"
    };
getRow(3)->
    #race_chaosmodeCfg {
    id = 3,
    icon = 2002,
    name = "[fffabf]【强化模式】[-]",
    text = "道具将获得更强力的效果",
    text2 = "[A6A6A6]环绕港口2圈[-][fffabf]（今日为强化道具模式）[-]"
    };
getRow(4)->
    #race_chaosmodeCfg {
    id = 4,
    icon = 2003,
    name = "[fffabf]【加速模式】[-]",
    text = "每次使用道具都会获得加速",
    text2 = "[A6A6A6]环绕港口3圈[-][fffabf]（今日为加速模式）[-]"
    };
getRow(5)->
    #race_chaosmodeCfg {
    id = 5,
    icon = 2004,
    name = "[fffabf]【陷阱模式】[-]",
    text = "每5秒自动向身后施放一个永久的加速带或者减速带",
    text2 = "[A6A6A6]环绕港口2圈[-][fffabf]（今日为陷阱模式）[-]"
    };
getRow(_)->[].

getKeyList()->[
    {1},
    {2},
    {3},
    {4},
    {5}
    ].

get1KeyList()->[
    1,
    2,
    3,
    4,
    5
    ].

