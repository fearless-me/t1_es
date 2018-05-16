%% coding: latin-1
%%: 实现
-module(cfg_collect_word_cht).
-compile(export_all).
-include("cfg_collect_word.hrl").
-include("logger.hrl").

getRow(101)->
    #collect_wordCfg {
    id = 101,
    group = 1,
    collect_num = 1,
    target1_id = 29341,
    target1_num = 10,
    target2_id = 29342,
    target2_num = 10,
    target3_id = 29343,
    target3_num = 10,
    target4_id = 29344,
    target4_num = 10,
    target5_id = 0,
    target5_num = 0,
    reward1_id = 29441,
    reward1_num = 1,
    reward2_id = 0,
    reward2_num = 0,
    reward3_id = 0,
    reward3_num = 0,
    word_limit = 50
    };
getRow(102)->
    #collect_wordCfg {
    id = 102,
    group = 1,
    collect_num = 1,
    target1_id = 29341,
    target1_num = 30,
    target2_id = 29342,
    target2_num = 30,
    target3_id = 29343,
    target3_num = 30,
    target4_id = 29344,
    target4_num = 30,
    target5_id = 0,
    target5_num = 0,
    reward1_id = 29441,
    reward1_num = 3,
    reward2_id = 0,
    reward2_num = 0,
    reward3_id = 0,
    reward3_num = 0,
    word_limit = 50
    };
getRow(103)->
    #collect_wordCfg {
    id = 103,
    group = 1,
    collect_num = 1,
    target1_id = 29341,
    target1_num = 50,
    target2_id = 29342,
    target2_num = 50,
    target3_id = 29343,
    target3_num = 50,
    target4_id = 29344,
    target4_num = 50,
    target5_id = 0,
    target5_num = 0,
    reward1_id = 29441,
    reward1_num = 6,
    reward2_id = 0,
    reward2_num = 0,
    reward3_id = 0,
    reward3_num = 0,
    word_limit = 50
    };
getRow(_)->[].

getKeyList()->[
    {101},
    {102},
    {103}
    ].

get1KeyList()->[
    101,
    102,
    103
    ].

