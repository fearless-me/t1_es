%% coding: latin-1
%%: 实现
-module(cfg_portraitFrame_chs).
-compile(export_all).
-include("cfg_portraitFrame.hrl").
-include("logger.hrl").

getRow(10)->
    #portraitFrameCfg {
    id = 10,
    type = 3,
    type_num = 500,
    class = 1,
    time = 0,
    icon = 9601,
    name = "经典史莱姆",
    condition_des = "被点赞次数达到500次"
    };
getRow(20)->
    #portraitFrameCfg {
    id = 20,
    type = 99,
    type_num = 0,
    class = 1,
    time = 0,
    icon = 9602,
    name = "迷幻宝石",
    condition_des = "通过荣耀礼赞获取"
    };
getRow(30)->
    #portraitFrameCfg {
    id = 30,
    type = 99,
    type_num = 0,
    class = 1,
    time = 0,
    icon = 9603,
    name = "樱与爱",
    condition_des = "通过璀璨晶体婚戒礼包获取"
    };
getRow(32)->
    #portraitFrameCfg {
    id = 32,
    type = 1,
    type_num = 80,
    class = 1,
    time = 0,
    icon = 9605,
    name = "春暖花开",
    condition_des = "女神禁闭室达到80层"
    };
getRow(40)->
    #portraitFrameCfg {
    id = 40,
    type = 2,
    type_num = 50,
    class = 1,
    time = 0,
    icon = 9606,
    name = "Luna勇士",
    condition_des = "竞技场排名达到前50"
    };
getRow(_)->[].

getKeyList()->[
    {10},
    {20},
    {30},
    {32},
    {40}
    ].

get1KeyList()->[
    10,
    20,
    30,
    32,
    40
    ].

