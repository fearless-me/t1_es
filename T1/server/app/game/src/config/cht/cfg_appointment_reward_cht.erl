%% coding: latin-1
%%: 实现
-module(cfg_appointment_reward_cht).
-compile(export_all).
-include("cfg_appointment_reward.hrl").


getRow(1,15)->
    #appointment_rewardCfg {
    id = 1,
    level = 15,
    name = "梦幻消除",
    reward = [{0,3300},{20,3301},{60,3302},{100,3303}],
    reward_friend = 50,
    reward_couple = 2000
    };
getRow(2,15)->
    #appointment_rewardCfg {
    id = 2,
    level = 15,
    name = "游园惊梦",
    reward = [{0,3300},{20,3301},{60,3302},{100,3303}],
    reward_friend = 50,
    reward_couple = 2000
    };
getRow(3,15)->
    #appointment_rewardCfg {
    id = 3,
    level = 15,
    name = "泳池派对",
    reward = [{0,3300},{20,3301},{60,3302},{100,3303}],
    reward_friend = 50,
    reward_couple = 2000
    };
getRow(4,15)->
    #appointment_rewardCfg {
    id = 4,
    level = 15,
    name = "躲喵喵",
    reward = [{0,3300},{20,3301},{60,3302},{100,3303}],
    reward_friend = 50,
    reward_couple = 2000
    };
getRow(_,_)->[].

getKeyList()->[
    {1,15},
    {2,15},
    {3,15},
    {4,15}
    ].

get1KeyList()->[
    1,
    2,
    3,
    4
    ].

get2KeyList(1)->[
    15
    ];
get2KeyList(2)->[
    15
    ];
get2KeyList(3)->[
    15
    ];
get2KeyList(4)->[
    15
    ];
get2KeyList(_)->[].

