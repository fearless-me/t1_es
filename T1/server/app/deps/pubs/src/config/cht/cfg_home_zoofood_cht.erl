%% coding: latin-1
%%: 实现
-module(cfg_home_zoofood_cht).
-compile(export_all).
-include("cfg_home_zoofood.hrl").


getRow(24100)->
    #home_zoofoodCfg {
    give_item_id = 24100,
    back_item = [{702,3,10,1,10000}],
    pet_like = [0],
    range = 10000
    };
getRow(24101)->
    #home_zoofoodCfg {
    give_item_id = 24101,
    back_item = [{703,5,12,1,10000}],
    pet_like = [0],
    range = 10000
    };
getRow(_)->[].

getKeyList()->[
    {24100},
    {24101}
    ].

get1KeyList()->[
    24100,
    24101
    ].

