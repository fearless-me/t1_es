%% coding: latin-1
%%: 实现
-module(cfg_demonBattleID_cht).
-compile(export_all).
-include("cfg_demonBattleID.hrl").


getRow(1)->
    #demonBattleIDCfg {
    iD = 1,
    monster = [[664,664,664,665,665],[666,667,666,667,666],[667,667,668,668,667],[670,671,670,670,671],[672,672,672,673,673],[673,673,674,674,674]],
    boss = [[669],[675]]
    };
getRow(2)->
    #demonBattleIDCfg {
    iD = 2,
    monster = [[676,677,676,677,676],[678,679,678,679,679],[679,680,680,680,679],[682,682,683,683,682],[684,684,684,685,685],[685,686,686,686,685]],
    boss = [[681],[689]]
    };
getRow(3)->
    #demonBattleIDCfg {
    iD = 3,
    monster = [[700,700,701,701,700],[702,702,703,703,703],[703,704,704,704,704],[705,705,706,706,706],[707,707,707,708,708],[709,708,709,708,709],[710,710,710,711,711],[712,712,712,712,713],[713,713,714,714,714]],
    boss = [[715],[716],[717],[718]]
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

