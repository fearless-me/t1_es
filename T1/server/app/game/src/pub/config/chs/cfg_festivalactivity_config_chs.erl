%% coding: latin-1
%%: 实现
-module(cfg_festivalactivity_config_chs).
-compile(export_all).
-include("cfg_festivalactivity_config.hrl").
-include("logger.hrl").

getRow(1)->
    #festivalactivity_configCfg {
    id = 1,
    name = "万圣节狂欢",
    timestart = [2018,10,8,4],
    timeend = [2018,10,23,12],
    copyid = [10300,10301],
    enterprop = [{502,1,9000,1},{502,10,0,0}],
    giftid = [1,2],
    copypageitem = [502],
    exchangepageitem = [500,501],
    giftpageitem = [-105]
    };
getRow(2)->
    #festivalactivity_configCfg {
    id = 2,
    name = "圣诞节快乐",
    timestart = [2018,12,25,4],
    timeend = [2018,12,31,12],
    copyid = [10302,10303],
    enterprop = [{505,1,9000,1},{505,10,0,0}],
    giftid = [3,4,5,6],
    copypageitem = [505],
    exchangepageitem = [504],
    giftpageitem = [-105]
    };
getRow(3)->
    #festivalactivity_configCfg {
    id = 3,
    name = "春节快乐",
    timestart = [2019,1,9,4],
    timeend = [2019,1,18,12],
    copyid = [10304,10305],
    enterprop = [{508,1,9000,2},{508,10,0,0}],
    giftid = [7,8],
    copypageitem = [508],
    exchangepageitem = [506],
    giftpageitem = [-105]
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

