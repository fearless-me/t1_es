%% coding: latin-1
%%: 实现
-module(cfg_monsterBoss_cht).
-compile(export_all).
-include("cfg_monsterBoss.hrl").
-include("logger.hrl").

getRow(4,1109)->
    #monsterBossCfg {
    map_id = 4,
    monster_id = 1109,
    pos = [161,427],
    cycle_time = 120
    };
getRow(7,1105)->
    #monsterBossCfg {
    map_id = 7,
    monster_id = 1105,
    pos = [404,216],
    cycle_time = 120
    };
getRow(11,1107)->
    #monsterBossCfg {
    map_id = 11,
    monster_id = 1107,
    pos = [234,383],
    cycle_time = 120
    };
getRow(12,1106)->
    #monsterBossCfg {
    map_id = 12,
    monster_id = 1106,
    pos = [409,76],
    cycle_time = 120
    };
getRow(13,1108)->
    #monsterBossCfg {
    map_id = 13,
    monster_id = 1108,
    pos = [158,262],
    cycle_time = 120
    };
getRow(14,1110)->
    #monsterBossCfg {
    map_id = 14,
    monster_id = 1110,
    pos = [181,53],
    cycle_time = 120
    };
getRow(_,_)->[].

getKeyList()->[
    {4,1109},
    {7,1105},
    {11,1107},
    {12,1106},
    {13,1108},
    {14,1110}
    ].

get1KeyList()->[
    4,
    7,
    11,
    12,
    13,
    14
    ].

get2KeyList(4)->[
    1109
    ];
get2KeyList(7)->[
    1105
    ];
get2KeyList(11)->[
    1107
    ];
get2KeyList(12)->[
    1106
    ];
get2KeyList(13)->[
    1108
    ];
get2KeyList(14)->[
    1110
    ];
get2KeyList(_)->[].

