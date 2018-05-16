%% coding: latin-1
%%: 实现
-module(cfg_uiSoundCfg_cht).
-compile(export_all).
-include("cfg_uiSoundCfg.hrl").
-include("logger.hrl").

getRow(1)->
    #uiSoundCfgCfg {
    id = 1,
    sound = "ui_close",
    uiType = "Close",
    desc = "关闭面板提示音"
    };
getRow(2)->
    #uiSoundCfgCfg {
    id = 2,
    uiType = "Skill"
    };
getRow(3)->
    #uiSoundCfgCfg {
    id = 3,
    uiType = "Normal"
    };
getRow(4)->
    #uiSoundCfgCfg {
    id = 4,
    sound = "ui_message",
    uiType = "Help",
    desc = "点帮助提示音"
    };
getRow(5)->
    #uiSoundCfgCfg {
    id = 5,
    sound = "ui_open",
    uiType = "Open",
    desc = "打开面板提示音"
    };
getRow(6)->
    #uiSoundCfgCfg {
    id = 6,
    sound = "ui_open",
    uiType = "Change",
    desc = "切换分页提示音"
    };
getRow(7)->
    #uiSoundCfgCfg {
    id = 7,
    sound = "ui_openbag",
    uiType = "OpenBag",
    desc = "打开背包"
    };
getRow(8)->
    #uiSoundCfgCfg {
    id = 8,
    sound = "ui_add",
    uiType = "Add",
    desc = "点击加号提示音"
    };
getRow(9)->
    #uiSoundCfgCfg {
    id = 9,
    sound = "ui_dimix",
    uiType = "Dimax",
    desc = "纹章合成"
    };
getRow(10)->
    #uiSoundCfgCfg {
    id = 10,
    sound = "ui_buy",
    uiType = "Buy",
    desc = "购买道具、装备"
    };
getRow(11)->
    #uiSoundCfgCfg {
    id = 11,
    sound = "ui_sold",
    uiType = "Sold",
    desc = "出售道具、装备"
    };
getRow(12)->
    #uiSoundCfgCfg {
    id = 12,
    sound = "ui_diput",
    uiType = "Diput",
    desc = "纹章镶嵌"
    };
getRow(13)->
    #uiSoundCfgCfg {
    id = 13,
    sound = "ui_itemselect",
    uiType = "ItemSelect",
    desc = "道具选择"
    };
getRow(14)->
    #uiSoundCfgCfg {
    id = 14,
    sound = "ui_normal_click1",
    uiType = "ItemClick1",
    desc = "按键点击提示音1"
    };
getRow(15)->
    #uiSoundCfgCfg {
    id = 15,
    sound = "ui_normal_click2",
    uiType = "ItemClick2",
    desc = "按键点击提示音2"
    };
getRow(16)->
    #uiSoundCfgCfg {
    id = 16,
    sound = "ui_normal_click3",
    uiType = "ItemClick3",
    desc = "按键点击提示音3"
    };
getRow(17)->
    #uiSoundCfgCfg {
    id = 17,
    sound = "ui_normal_click4",
    uiType = "ItemClick4",
    desc = "按键点击提示音4"
    };
getRow(18)->
    #uiSoundCfgCfg {
    id = 18,
    sound = "ui_message",
    uiType = "Message",
    desc = "新邮件到了"
    };
getRow(19)->
    #uiSoundCfgCfg {
    id = 19,
    sound = "ui_no",
    uiType = "No",
    desc = "二次框点确定"
    };
getRow(20)->
    #uiSoundCfgCfg {
    id = 20,
    sound = "ui_yes",
    uiType = "Yes",
    desc = "二次框点取消"
    };
getRow(21)->
    #uiSoundCfgCfg {
    id = 21,
    sound = "ui_changeclass",
    uiType = "changeclass",
    desc = "同页面切换分类提示音"
    };
getRow(22)->
    #uiSoundCfgCfg {
    id = 22,
    sound = "ui_error",
    uiType = "error",
    desc = "任务完成"
    };
getRow(23)->
    #uiSoundCfgCfg {
    id = 23,
    sound = "ui_mission_finish",
    uiType = "mission_finish",
    desc = "任务完成"
    };
getRow(24)->
    #uiSoundCfgCfg {
    id = 24,
    sound = "ui_newmountget",
    uiType = "newmountget",
    desc = "获得坐骑"
    };
getRow(25)->
    #uiSoundCfgCfg {
    id = 25,
    sound = "ui_newmountstar",
    uiType = "newmountstar",
    desc = "坐骑升级加星"
    };
getRow(26)->
    #uiSoundCfgCfg {
    id = 26,
    sound = "ui_phase_finish",
    uiType = "phase_finish"
    };
getRow(27)->
    #uiSoundCfgCfg {
    id = 27,
    sound = "card_click",
    uiType = "cark_click"
    };
getRow(28)->
    #uiSoundCfgCfg {
    id = 28,
    sound = "ui_reduce",
    uiType = "Reduce",
    desc = "数量选择时点击减加号提示音"
    };
getRow(29)->
    #uiSoundCfgCfg {
    id = 29,
    sound = "ui_camera",
    uiType = "camera",
    desc = "拍照时播放音效"
    };
getRow(30)->
    #uiSoundCfgCfg {
    id = 30,
    sound = "ui_getreward",
    uiType = "getreward",
    desc = "领取奖励"
    };
getRow(31)->
    #uiSoundCfgCfg {
    id = 31,
    sound = "ui_getrebattle",
    uiType = "getrebattle",
    desc = "成长系统中的提升&转生&升级等"
    };
getRow(32)->
    #uiSoundCfgCfg {
    id = 32,
    sound = "ui_mission_control",
    uiType = "mission_control",
    desc = "执行采集任务时点击执行图标播放"
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
    {32}
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
    32
    ].

