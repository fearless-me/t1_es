%% coding: latin-1
%%: 实现
-module(cfg_player_base_chs).
-compile(export_all).
-include("cfg_player_base.hrl").
-include("logger.hrl").

getRow(1,101)->
    #player_baseCfg {
    level = 1,
    maxLevel = 105,
    class = 101,
    maxHP = 277,
    physicalAttack = 22,
    magicAttack = 0,
    physicalDefence = 29,
    magicDefence = 27,
    criticalLevel = 0,
    criticalResistLevel = 0,
    maxHPMultiply = 16,
    physicalAttackMultiply = 1,
    magicAttackMultiply = 0,
    physicalDefenceMultiply = 2,
    magicDefenceMultiply = 2,
    criticalLevelMultiply = 0,
    criticalResistLevelMultiply = 0
    };
getRow(1,111)->
    #player_baseCfg {
    level = 1,
    maxLevel = 105,
    class = 111,
    maxHP = 840,
    physicalAttack = 66,
    magicAttack = 0,
    physicalDefence = 96,
    magicDefence = 77,
    criticalLevel = 0,
    criticalResistLevel = 0,
    maxHPMultiply = 48,
    physicalAttackMultiply = 4,
    magicAttackMultiply = 0,
    physicalDefenceMultiply = 6,
    magicDefenceMultiply = 5,
    criticalLevelMultiply = 0,
    criticalResistLevelMultiply = 0
    };
getRow(1,112)->
    #player_baseCfg {
    level = 1,
    maxLevel = 105,
    class = 112,
    maxHP = 720,
    physicalAttack = 77,
    magicAttack = 0,
    physicalDefence = 81,
    magicDefence = 66,
    criticalLevel = 0,
    criticalResistLevel = 0,
    maxHPMultiply = 41,
    physicalAttackMultiply = 5,
    magicAttackMultiply = 0,
    physicalDefenceMultiply = 5,
    magicDefenceMultiply = 4,
    criticalLevelMultiply = 0,
    criticalResistLevelMultiply = 0
    };
getRow(1,121)->
    #player_baseCfg {
    level = 1,
    maxLevel = 105,
    class = 121,
    maxHP = 2241,
    physicalAttack = 176,
    magicAttack = 0,
    physicalDefence = 255,
    magicDefence = 206,
    criticalLevel = 0,
    criticalResistLevel = 0,
    maxHPMultiply = 129,
    physicalAttackMultiply = 11,
    magicAttackMultiply = 0,
    physicalDefenceMultiply = 16,
    magicDefenceMultiply = 13,
    criticalLevelMultiply = 0,
    criticalResistLevelMultiply = 0
    };
getRow(1,122)->
    #player_baseCfg {
    level = 1,
    maxLevel = 105,
    class = 122,
    maxHP = 1986,
    physicalAttack = 196,
    magicAttack = 0,
    physicalDefence = 235,
    magicDefence = 196,
    criticalLevel = 0,
    criticalResistLevel = 0,
    maxHPMultiply = 114,
    physicalAttackMultiply = 12,
    magicAttackMultiply = 0,
    physicalDefenceMultiply = 14,
    magicDefenceMultiply = 12,
    criticalLevelMultiply = 0,
    criticalResistLevelMultiply = 0
    };
getRow(1,123)->
    #player_baseCfg {
    level = 1,
    maxLevel = 105,
    class = 123,
    maxHP = 1920,
    physicalAttack = 206,
    magicAttack = 0,
    physicalDefence = 216,
    magicDefence = 176,
    criticalLevel = 0,
    criticalResistLevel = 0,
    maxHPMultiply = 110,
    physicalAttackMultiply = 13,
    magicAttackMultiply = 0,
    physicalDefenceMultiply = 13,
    magicDefenceMultiply = 11,
    criticalLevelMultiply = 0,
    criticalResistLevelMultiply = 0
    };
getRow(1,131)->
    #player_baseCfg {
    level = 1,
    maxLevel = 105,
    class = 131,
    maxHP = 4294,
    physicalAttack = 338,
    magicAttack = 0,
    physicalDefence = 488,
    magicDefence = 394,
    criticalLevel = 0,
    criticalResistLevel = 0,
    maxHPMultiply = 246,
    physicalAttackMultiply = 20,
    magicAttackMultiply = 0,
    physicalDefenceMultiply = 29,
    magicDefenceMultiply = 24,
    criticalLevelMultiply = 0,
    criticalResistLevelMultiply = 0
    };
getRow(1,132)->
    #player_baseCfg {
    level = 1,
    maxLevel = 105,
    class = 132,
    maxHP = 3807,
    physicalAttack = 376,
    magicAttack = 0,
    physicalDefence = 451,
    magicDefence = 376,
    criticalLevel = 0,
    criticalResistLevel = 0,
    maxHPMultiply = 218,
    physicalAttackMultiply = 23,
    magicAttackMultiply = 0,
    physicalDefenceMultiply = 27,
    magicDefenceMultiply = 23,
    criticalLevelMultiply = 0,
    criticalResistLevelMultiply = 0
    };
getRow(1,133)->
    #player_baseCfg {
    level = 1,
    maxLevel = 105,
    class = 133,
    maxHP = 3679,
    physicalAttack = 394,
    magicAttack = 0,
    physicalDefence = 413,
    magicDefence = 338,
    criticalLevel = 0,
    criticalResistLevel = 0,
    maxHPMultiply = 211,
    physicalAttackMultiply = 24,
    magicAttackMultiply = 0,
    physicalDefenceMultiply = 25,
    magicDefenceMultiply = 20,
    criticalLevelMultiply = 0,
    criticalResistLevelMultiply = 0
    };
getRow(1,201)->
    #player_baseCfg {
    level = 1,
    maxLevel = 105,
    class = 201,
    maxHP = 203,
    physicalAttack = 0,
    magicAttack = 29,
    physicalDefence = 22,
    magicDefence = 32,
    criticalLevel = 0,
    criticalResistLevel = 0,
    maxHPMultiply = 12,
    physicalAttackMultiply = 0,
    magicAttackMultiply = 2,
    physicalDefenceMultiply = 1,
    magicDefenceMultiply = 2,
    criticalLevelMultiply = 0,
    criticalResistLevelMultiply = 0
    };
getRow(1,211)->
    #player_baseCfg {
    level = 1,
    maxLevel = 105,
    class = 211,
    maxHP = 730,
    physicalAttack = 0,
    magicAttack = 74,
    physicalDefence = 79,
    magicDefence = 88,
    criticalLevel = 0,
    criticalResistLevel = 0,
    maxHPMultiply = 42,
    physicalAttackMultiply = 0,
    magicAttackMultiply = 5,
    physicalDefenceMultiply = 5,
    magicDefenceMultiply = 5,
    criticalLevelMultiply = 0,
    criticalResistLevelMultiply = 0
    };
getRow(1,212)->
    #player_baseCfg {
    level = 1,
    maxLevel = 105,
    class = 212,
    maxHP = 679,
    physicalAttack = 0,
    magicAttack = 81,
    physicalDefence = 66,
    magicDefence = 77,
    criticalLevel = 0,
    criticalResistLevel = 0,
    maxHPMultiply = 39,
    physicalAttackMultiply = 0,
    magicAttackMultiply = 5,
    physicalDefenceMultiply = 4,
    magicDefenceMultiply = 5,
    criticalLevelMultiply = 0,
    criticalResistLevelMultiply = 0
    };
getRow(1,221)->
    #player_baseCfg {
    level = 1,
    maxLevel = 105,
    class = 221,
    maxHP = 1946,
    physicalAttack = 0,
    magicAttack = 196,
    physicalDefence = 212,
    magicDefence = 235,
    criticalLevel = 0,
    criticalResistLevel = 0,
    maxHPMultiply = 112,
    physicalAttackMultiply = 0,
    magicAttackMultiply = 12,
    physicalDefenceMultiply = 13,
    magicDefenceMultiply = 14,
    criticalLevelMultiply = 0,
    criticalResistLevelMultiply = 0
    };
getRow(1,222)->
    #player_baseCfg {
    level = 1,
    maxLevel = 105,
    class = 222,
    maxHP = 1810,
    physicalAttack = 0,
    magicAttack = 216,
    physicalDefence = 176,
    magicDefence = 206,
    criticalLevel = 0,
    criticalResistLevel = 0,
    maxHPMultiply = 104,
    physicalAttackMultiply = 0,
    magicAttackMultiply = 13,
    physicalDefenceMultiply = 11,
    magicDefenceMultiply = 13,
    criticalLevelMultiply = 0,
    criticalResistLevelMultiply = 0
    };
getRow(1,223)->
    #player_baseCfg {
    level = 1,
    maxLevel = 105,
    class = 223,
    maxHP = 1893,
    physicalAttack = 0,
    magicAttack = 206,
    physicalDefence = 186,
    magicDefence = 216,
    criticalLevel = 0,
    criticalResistLevel = 0,
    maxHPMultiply = 109,
    physicalAttackMultiply = 0,
    magicAttackMultiply = 13,
    physicalDefenceMultiply = 11,
    magicDefenceMultiply = 13,
    criticalLevelMultiply = 0,
    criticalResistLevelMultiply = 0
    };
getRow(1,231)->
    #player_baseCfg {
    level = 1,
    maxLevel = 105,
    class = 231,
    maxHP = 3730,
    physicalAttack = 0,
    magicAttack = 376,
    physicalDefence = 406,
    magicDefence = 451,
    criticalLevel = 0,
    criticalResistLevel = 0,
    maxHPMultiply = 213,
    physicalAttackMultiply = 0,
    magicAttackMultiply = 23,
    physicalDefenceMultiply = 24,
    magicDefenceMultiply = 27,
    criticalLevelMultiply = 0,
    criticalResistLevelMultiply = 0
    };
getRow(1,232)->
    #player_baseCfg {
    level = 1,
    maxLevel = 105,
    class = 232,
    maxHP = 3470,
    physicalAttack = 0,
    magicAttack = 413,
    physicalDefence = 338,
    magicDefence = 394,
    criticalLevel = 0,
    criticalResistLevel = 0,
    maxHPMultiply = 199,
    physicalAttackMultiply = 0,
    magicAttackMultiply = 25,
    physicalDefenceMultiply = 20,
    magicDefenceMultiply = 24,
    criticalLevelMultiply = 0,
    criticalResistLevelMultiply = 0
    };
getRow(1,233)->
    #player_baseCfg {
    level = 1,
    maxLevel = 105,
    class = 233,
    maxHP = 3628,
    physicalAttack = 0,
    magicAttack = 394,
    physicalDefence = 357,
    magicDefence = 413,
    criticalLevel = 0,
    criticalResistLevel = 0,
    maxHPMultiply = 208,
    physicalAttackMultiply = 0,
    magicAttackMultiply = 24,
    physicalDefenceMultiply = 21,
    magicDefenceMultiply = 25,
    criticalLevelMultiply = 0,
    criticalResistLevelMultiply = 0
    };
getRow(1,301)->
    #player_baseCfg {
    level = 1,
    maxLevel = 105,
    class = 301,
    maxHP = 240,
    physicalAttack = 26,
    magicAttack = 0,
    physicalDefence = 26,
    magicDefence = 22,
    criticalLevel = 0,
    criticalResistLevel = 0,
    maxHPMultiply = 14,
    physicalAttackMultiply = 2,
    magicAttackMultiply = 0,
    physicalDefenceMultiply = 2,
    magicDefenceMultiply = 1,
    criticalLevelMultiply = 0,
    criticalResistLevelMultiply = 0
    };
getRow(1,311)->
    #player_baseCfg {
    level = 1,
    maxLevel = 105,
    class = 311,
    maxHP = 720,
    physicalAttack = 77,
    magicAttack = 0,
    physicalDefence = 77,
    magicDefence = 66,
    criticalLevel = 0,
    criticalResistLevel = 0,
    maxHPMultiply = 41,
    physicalAttackMultiply = 5,
    magicAttackMultiply = 0,
    physicalDefenceMultiply = 5,
    magicDefenceMultiply = 4,
    criticalLevelMultiply = 0,
    criticalResistLevelMultiply = 0
    };
getRow(1,312)->
    #player_baseCfg {
    level = 1,
    maxLevel = 105,
    class = 312,
    maxHP = 695,
    physicalAttack = 79,
    magicAttack = 0,
    physicalDefence = 77,
    magicDefence = 66,
    criticalLevel = 0,
    criticalResistLevel = 0,
    maxHPMultiply = 40,
    physicalAttackMultiply = 5,
    magicAttackMultiply = 0,
    physicalDefenceMultiply = 5,
    magicDefenceMultiply = 4,
    criticalLevelMultiply = 0,
    criticalResistLevelMultiply = 0
    };
getRow(1,321)->
    #player_baseCfg {
    level = 1,
    maxLevel = 105,
    class = 321,
    maxHP = 1920,
    physicalAttack = 206,
    magicAttack = 0,
    physicalDefence = 206,
    magicDefence = 176,
    criticalLevel = 0,
    criticalResistLevel = 0,
    maxHPMultiply = 110,
    physicalAttackMultiply = 13,
    magicAttackMultiply = 0,
    physicalDefenceMultiply = 13,
    magicDefenceMultiply = 11,
    criticalLevelMultiply = 0,
    criticalResistLevelMultiply = 0
    };
getRow(1,322)->
    #player_baseCfg {
    level = 1,
    maxLevel = 105,
    class = 322,
    maxHP = 1853,
    physicalAttack = 212,
    magicAttack = 0,
    physicalDefence = 206,
    magicDefence = 176,
    criticalLevel = 0,
    criticalResistLevel = 0,
    maxHPMultiply = 106,
    physicalAttackMultiply = 13,
    magicAttackMultiply = 0,
    physicalDefenceMultiply = 13,
    magicDefenceMultiply = 11,
    criticalLevelMultiply = 0,
    criticalResistLevelMultiply = 0
    };
getRow(1,323)->
    #player_baseCfg {
    level = 1,
    maxLevel = 105,
    class = 323,
    maxHP = 1936,
    physicalAttack = 196,
    magicAttack = 0,
    physicalDefence = 216,
    magicDefence = 216,
    criticalLevel = 0,
    criticalResistLevel = 0,
    maxHPMultiply = 111,
    physicalAttackMultiply = 12,
    magicAttackMultiply = 0,
    physicalDefenceMultiply = 13,
    magicDefenceMultiply = 13,
    criticalLevelMultiply = 0,
    criticalResistLevelMultiply = 0
    };
getRow(1,331)->
    #player_baseCfg {
    level = 1,
    maxLevel = 105,
    class = 331,
    maxHP = 3679,
    physicalAttack = 394,
    magicAttack = 0,
    physicalDefence = 394,
    magicDefence = 338,
    criticalLevel = 0,
    criticalResistLevel = 0,
    maxHPMultiply = 211,
    physicalAttackMultiply = 24,
    magicAttackMultiply = 0,
    physicalDefenceMultiply = 24,
    magicDefenceMultiply = 20,
    criticalLevelMultiply = 0,
    criticalResistLevelMultiply = 0
    };
getRow(1,332)->
    #player_baseCfg {
    level = 1,
    maxLevel = 105,
    class = 332,
    maxHP = 3551,
    physicalAttack = 406,
    magicAttack = 0,
    physicalDefence = 394,
    magicDefence = 338,
    criticalLevel = 0,
    criticalResistLevel = 0,
    maxHPMultiply = 203,
    physicalAttackMultiply = 24,
    magicAttackMultiply = 0,
    physicalDefenceMultiply = 24,
    magicDefenceMultiply = 20,
    criticalLevelMultiply = 0,
    criticalResistLevelMultiply = 0
    };
getRow(1,333)->
    #player_baseCfg {
    level = 1,
    maxLevel = 105,
    class = 333,
    maxHP = 3711,
    physicalAttack = 376,
    magicAttack = 0,
    physicalDefence = 413,
    magicDefence = 413,
    criticalLevel = 0,
    criticalResistLevel = 0,
    maxHPMultiply = 212,
    physicalAttackMultiply = 23,
    magicAttackMultiply = 0,
    physicalDefenceMultiply = 25,
    magicDefenceMultiply = 25,
    criticalLevelMultiply = 0,
    criticalResistLevelMultiply = 0
    };
getRow(_,_)->[].

getKeyList()->[
    {1,101},
    {1,111},
    {1,112},
    {1,121},
    {1,122},
    {1,123},
    {1,131},
    {1,132},
    {1,133},
    {1,201},
    {1,211},
    {1,212},
    {1,221},
    {1,222},
    {1,223},
    {1,231},
    {1,232},
    {1,233},
    {1,301},
    {1,311},
    {1,312},
    {1,321},
    {1,322},
    {1,323},
    {1,331},
    {1,332},
    {1,333}
    ].

get1KeyList()->[
    1
    ].

get2KeyList(1)->[
    101,
    111,
    112,
    121,
    122,
    123,
    131,
    132,
    133,
    201,
    211,
    212,
    221,
    222,
    223,
    231,
    232,
    233,
    301,
    311,
    312,
    321,
    322,
    323,
    331,
    332,
    333
    ];
get2KeyList(_)->[].

