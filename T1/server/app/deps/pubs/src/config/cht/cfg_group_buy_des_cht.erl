%% coding: latin-1
%%: 实现
-module(cfg_group_buy_des_cht).
-compile(export_all).
-include("cfg_group_buy_des.hrl").
-include("logger.hrl").

getRow(1)->
    #group_buy_desCfg {
    group = 1,
    ver = 1,
    image = "Textures/Recharge/Base_Bg_Group_1",
    open_y_m_d = [2018,01,31],
    limit_time = 1680,
    score_add_time = 24
    };
getRow(2)->
    #group_buy_desCfg {
    group = 2,
    ver = 1,
    image = "Textures/Recharge/Base_Bg_Group_1",
    open_y_m_d = [2018,01,12],
    limit_time = 1680,
    score_add_time = 24
    };
getRow(3)->
    #group_buy_desCfg {
    group = 3,
    ver = 1,
    image = "Textures/Recharge/Base_Bg_Group_1",
    open_y_m_d = [2018,01,20],
    limit_time = 1680,
    score_add_time = 24
    };
getRow(_)->[].

getKeyList()->[
    {1},
    {2},
    {3}
    ].

get1KeyList()->[
    1,
    2,
    3
    ].

