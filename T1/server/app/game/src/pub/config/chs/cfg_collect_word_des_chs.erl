%% coding: latin-1
%%: 实现
-module(cfg_collect_word_des_chs).
-compile(export_all).
-include("cfg_collect_word_des.hrl").
-include("logger.hrl").

getRow(1)->
    #collect_word_desCfg {
    group = 1,
    ver = 1,
    image = "Textures/UI/Base_Bg_89",
    info_1 = "活動時間:{0}-{1}",
    info_2 = "活動規則:活動期間可以從野外怪物獲得道具",
    open_y_m_d = [2018,08,18],
    limit_time = 2928
    };
getRow(_)->[].

getKeyList()->[
    {1}
    ].

get1KeyList()->[
    1
    ].

