%% coding: latin-1
%%: 实现
-module(cfg_passive_skill_group_chs).
-compile(export_all).
-include("cfg_passive_skill_group.hrl").
-include("logger.hrl").

getRow(41)->
    #passive_skill_groupCfg {
    id = 41,
    name = "符文骑士",
    includeskills = [4101,4102,4103,4104,4105,4106,4107,4109,4110,4111,4112]
    };
getRow(42)->
    #passive_skill_groupCfg {
    id = 42,
    name = "元素大师",
    includeskills = [4201,4202,4203,4204,4205,4206,4207,4209,4210,4211,4212]
    };
getRow(43)->
    #passive_skill_groupCfg {
    id = 43,
    name = "游侠",
    includeskills = [4301,4302,4303,4304,4305,4306,4307,4309,4310,4311,4312]
    };
getRow(_)->[].

getKeyList()->[
    {41},
    {42},
    {43}
    ].

get1KeyList()->[
    41,
    42,
    43
    ].

