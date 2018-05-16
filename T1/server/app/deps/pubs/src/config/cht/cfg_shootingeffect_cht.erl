%% coding: latin-1
%%: 实现
-module(cfg_shootingeffect_cht).
-compile(export_all).
-include("cfg_shootingeffect.hrl").
-include("logger.hrl").

getRow(1)->
    #shootingeffectCfg {
    iD = 1,
    effectname = "星星",
    effectpath = "other/vfx_26_87"
    };
getRow(2)->
    #shootingeffectCfg {
    iD = 2,
    effectname = "雪花",
    effectpath = "other/vfx_26_88"
    };
getRow(3)->
    #shootingeffectCfg {
    iD = 3,
    effectname = "气泡",
    effectpath = "other/vfx_26_89"
    };
getRow(4)->
    #shootingeffectCfg {
    iD = 4,
    effectname = "爱心",
    effectpath = "other/vfx_26_90"
    };
getRow(5)->
    #shootingeffectCfg {
    iD = 5,
    effectname = "花瓣",
    effectpath = "other/vfx_26_91"
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

