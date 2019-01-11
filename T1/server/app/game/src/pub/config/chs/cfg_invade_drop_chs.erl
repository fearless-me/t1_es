%% coding: latin-1
%%: 实现
-module(cfg_invade_drop_chs).
-compile(export_all).
-include("cfg_invade_drop.hrl").
-include("logger.hrl").

getRow(2710)->
    #invade_dropCfg {
    monsterid = 2710,
    dropid = [{23101,1}],
    probability = [1500]
    };
getRow(2711)->
    #invade_dropCfg {
    monsterid = 2711,
    dropid = [{23101,1}],
    probability = [2500]
    };
getRow(2712)->
    #invade_dropCfg {
    monsterid = 2712,
    dropid = [{23101,1}],
    probability = [3500]
    };
getRow(2713)->
    #invade_dropCfg {
    monsterid = 2713,
    dropid = [{23101,5},{23107,5}],
    probability = [10000,10000]
    };
getRow(2714)->
    #invade_dropCfg {
    monsterid = 2714,
    dropid = [{23101,10},{23107,10}],
    probability = [10000,10000]
    };
getRow(2720)->
    #invade_dropCfg {
    monsterid = 2720,
    dropid = [{23101,1}],
    probability = [2200]
    };
getRow(2721)->
    #invade_dropCfg {
    monsterid = 2721,
    dropid = [{23101,1}],
    probability = [3200]
    };
getRow(2722)->
    #invade_dropCfg {
    monsterid = 2722,
    dropid = [{23101,1}],
    probability = [5000]
    };
getRow(2723)->
    #invade_dropCfg {
    monsterid = 2723,
    dropid = [{23102,5},{23107,6}],
    probability = [10000,10000]
    };
getRow(2724)->
    #invade_dropCfg {
    monsterid = 2724,
    dropid = [{23102,10},{23107,12}],
    probability = [10000,10000]
    };
getRow(2730)->
    #invade_dropCfg {
    monsterid = 2730,
    dropid = [{23101,1}],
    probability = [2500]
    };
getRow(2731)->
    #invade_dropCfg {
    monsterid = 2731,
    dropid = [{23101,1}],
    probability = [4000]
    };
getRow(2732)->
    #invade_dropCfg {
    monsterid = 2732,
    dropid = [{23101,1}],
    probability = [5000]
    };
getRow(2733)->
    #invade_dropCfg {
    monsterid = 2733,
    dropid = [{23103,5},{23107,8}],
    probability = [10000,10000]
    };
getRow(2734)->
    #invade_dropCfg {
    monsterid = 2734,
    dropid = [{23103,10},{23107,16}],
    probability = [10000,10000]
    };
getRow(_)->[].

getKeyList()->[
    {2710},
    {2711},
    {2712},
    {2713},
    {2714},
    {2720},
    {2721},
    {2722},
    {2723},
    {2724},
    {2730},
    {2731},
    {2732},
    {2733},
    {2734}
    ].

get1KeyList()->[
    2710,
    2711,
    2712,
    2713,
    2714,
    2720,
    2721,
    2722,
    2723,
    2724,
    2730,
    2731,
    2732,
    2733,
    2734
    ].

