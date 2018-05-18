%% coding: latin-1
%%: 实现
-module(cfg_player_base_cht).
-compile(export_all).
-include("cfg_player_base.hrl").


getRow(1,101)->
    #player_baseCfg {
    level = 1,
    maxLevel = 105,
    class = 101,
    maxHP = 185,
    physicalAttack = 14,
    magicAttack = 0,
    physicalDefence = 19,
    magicDefence = 18,
    criticalLevel = 7,
    criticalResistLevel = 7,
    maxHPMultiply = 22,
    physicalAttackMultiply = 1,
    magicAttackMultiply = 0,
    physicalDefenceMultiply = 2,
    magicDefenceMultiply = 2,
    criticalLevelMultiply = 1,
    criticalResistLevelMultiply = 1
    };
getRow(1,111)->
    #player_baseCfg {
    level = 1,
    maxLevel = 105,
    class = 111,
    maxHP = 1313,
    physicalAttack = 103,
    magicAttack = 0,
    physicalDefence = 150,
    magicDefence = 121,
    criticalLevel = 49,
    criticalResistLevel = 49,
    maxHPMultiply = 157,
    physicalAttackMultiply = 12,
    magicAttackMultiply = 0,
    physicalDefenceMultiply = 18,
    magicDefenceMultiply = 14,
    criticalLevelMultiply = 7,
    criticalResistLevelMultiply = 7
    };
getRow(1,112)->
    #player_baseCfg {
    level = 1,
    maxLevel = 105,
    class = 112,
    maxHP = 1125,
    physicalAttack = 121,
    magicAttack = 0,
    physicalDefence = 127,
    magicDefence = 103,
    criticalLevel = 49,
    criticalResistLevel = 49,
    maxHPMultiply = 134,
    physicalAttackMultiply = 14,
    magicAttackMultiply = 0,
    physicalDefenceMultiply = 15,
    magicDefenceMultiply = 12,
    criticalLevelMultiply = 7,
    criticalResistLevelMultiply = 7
    };
getRow(1,121)->
    #player_baseCfg {
    level = 1,
    maxLevel = 105,
    class = 121,
    maxHP = 3190,
    physicalAttack = 252,
    magicAttack = 0,
    physicalDefence = 364,
    magicDefence = 294,
    criticalLevel = 119,
    criticalResistLevel = 119,
    maxHPMultiply = 382,
    physicalAttackMultiply = 30,
    magicAttackMultiply = 0,
    physicalDefenceMultiply = 44,
    magicDefenceMultiply = 35,
    criticalLevelMultiply = 17,
    criticalResistLevelMultiply = 17
    };
getRow(1,122)->
    #player_baseCfg {
    level = 1,
    maxLevel = 105,
    class = 122,
    maxHP = 2839,
    physicalAttack = 280,
    magicAttack = 0,
    physicalDefence = 336,
    magicDefence = 280,
    criticalLevel = 119,
    criticalResistLevel = 119,
    maxHPMultiply = 340,
    physicalAttackMultiply = 34,
    magicAttackMultiply = 0,
    physicalDefenceMultiply = 40,
    magicDefenceMultiply = 34,
    criticalLevelMultiply = 17,
    criticalResistLevelMultiply = 17
    };
getRow(1,123)->
    #player_baseCfg {
    level = 1,
    maxLevel = 105,
    class = 123,
    maxHP = 2734,
    physicalAttack = 294,
    magicAttack = 0,
    physicalDefence = 308,
    magicDefence = 252,
    criticalLevel = 119,
    criticalResistLevel = 119,
    maxHPMultiply = 327,
    physicalAttackMultiply = 35,
    magicAttackMultiply = 0,
    physicalDefenceMultiply = 37,
    magicDefenceMultiply = 30,
    criticalLevelMultiply = 17,
    criticalResistLevelMultiply = 17
    };
getRow(1,201)->
    #player_baseCfg {
    level = 1,
    maxLevel = 105,
    class = 201,
    maxHP = 137,
    physicalAttack = 0,
    magicAttack = 19,
    physicalDefence = 14,
    magicDefence = 21,
    criticalLevel = 7,
    criticalResistLevel = 7,
    maxHPMultiply = 16,
    physicalAttackMultiply = 0,
    magicAttackMultiply = 2,
    physicalDefenceMultiply = 1,
    magicDefenceMultiply = 2,
    criticalLevelMultiply = 1,
    criticalResistLevelMultiply = 1
    };
getRow(1,211)->
    #player_baseCfg {
    level = 1,
    maxLevel = 105,
    class = 211,
    maxHP = 1150,
    physicalAttack = 0,
    magicAttack = 115,
    physicalDefence = 124,
    magicDefence = 138,
    criticalLevel = 49,
    criticalResistLevel = 49,
    maxHPMultiply = 137,
    physicalAttackMultiply = 0,
    magicAttackMultiply = 14,
    physicalDefenceMultiply = 15,
    magicDefenceMultiply = 16,
    criticalLevelMultiply = 7,
    criticalResistLevelMultiply = 7
    };
getRow(1,212)->
    #player_baseCfg {
    level = 1,
    maxLevel = 105,
    class = 212,
    maxHP = 1064,
    physicalAttack = 0,
    magicAttack = 127,
    physicalDefence = 103,
    magicDefence = 121,
    criticalLevel = 49,
    criticalResistLevel = 49,
    maxHPMultiply = 127,
    physicalAttackMultiply = 0,
    magicAttackMultiply = 15,
    physicalDefenceMultiply = 12,
    magicDefenceMultiply = 14,
    criticalLevelMultiply = 7,
    criticalResistLevelMultiply = 7
    };
getRow(1,221)->
    #player_baseCfg {
    level = 1,
    maxLevel = 105,
    class = 221,
    maxHP = 2795,
    physicalAttack = 0,
    magicAttack = 280,
    physicalDefence = 302,
    magicDefence = 336,
    criticalLevel = 119,
    criticalResistLevel = 119,
    maxHPMultiply = 334,
    physicalAttackMultiply = 0,
    magicAttackMultiply = 34,
    physicalDefenceMultiply = 36,
    magicDefenceMultiply = 40,
    criticalLevelMultiply = 17,
    criticalResistLevelMultiply = 17
    };
getRow(1,222)->
    #player_baseCfg {
    level = 1,
    maxLevel = 105,
    class = 222,
    maxHP = 2585,
    physicalAttack = 0,
    magicAttack = 308,
    physicalDefence = 252,
    magicDefence = 294,
    criticalLevel = 119,
    criticalResistLevel = 119,
    maxHPMultiply = 309,
    physicalAttackMultiply = 0,
    magicAttackMultiply = 37,
    physicalDefenceMultiply = 30,
    magicDefenceMultiply = 35,
    criticalLevelMultiply = 17,
    criticalResistLevelMultiply = 17
    };
getRow(1,223)->
    #player_baseCfg {
    level = 1,
    maxLevel = 105,
    class = 223,
    maxHP = 2705,
    physicalAttack = 0,
    magicAttack = 294,
    physicalDefence = 266,
    magicDefence = 308,
    criticalLevel = 119,
    criticalResistLevel = 119,
    maxHPMultiply = 323,
    physicalAttackMultiply = 0,
    magicAttackMultiply = 35,
    physicalDefenceMultiply = 32,
    magicDefenceMultiply = 37,
    criticalLevelMultiply = 17,
    criticalResistLevelMultiply = 17
    };
getRow(1,301)->
    #player_baseCfg {
    level = 1,
    maxLevel = 105,
    class = 301,
    maxHP = 160,
    physicalAttack = 17,
    magicAttack = 0,
    physicalDefence = 17,
    magicDefence = 14,
    criticalLevel = 7,
    criticalResistLevel = 7,
    maxHPMultiply = 19,
    physicalAttackMultiply = 2,
    magicAttackMultiply = 0,
    physicalDefenceMultiply = 2,
    magicDefenceMultiply = 1,
    criticalLevelMultiply = 1,
    criticalResistLevelMultiply = 1
    };
getRow(1,311)->
    #player_baseCfg {
    level = 1,
    maxLevel = 105,
    class = 311,
    maxHP = 1125,
    physicalAttack = 121,
    magicAttack = 0,
    physicalDefence = 121,
    magicDefence = 103,
    criticalLevel = 49,
    criticalResistLevel = 49,
    maxHPMultiply = 134,
    physicalAttackMultiply = 14,
    magicAttackMultiply = 0,
    physicalDefenceMultiply = 14,
    magicDefenceMultiply = 12,
    criticalLevelMultiply = 7,
    criticalResistLevelMultiply = 7
    };
getRow(1,312)->
    #player_baseCfg {
    level = 1,
    maxLevel = 105,
    class = 312,
    maxHP = 1088,
    physicalAttack = 124,
    magicAttack = 0,
    physicalDefence = 121,
    magicDefence = 103,
    criticalLevel = 49,
    criticalResistLevel = 49,
    maxHPMultiply = 130,
    physicalAttackMultiply = 15,
    magicAttackMultiply = 0,
    physicalDefenceMultiply = 14,
    magicDefenceMultiply = 12,
    criticalLevelMultiply = 7,
    criticalResistLevelMultiply = 7
    };
getRow(1,321)->
    #player_baseCfg {
    level = 1,
    maxLevel = 105,
    class = 321,
    maxHP = 2734,
    physicalAttack = 294,
    magicAttack = 0,
    physicalDefence = 294,
    magicDefence = 252,
    criticalLevel = 119,
    criticalResistLevel = 119,
    maxHPMultiply = 327,
    physicalAttackMultiply = 35,
    magicAttackMultiply = 0,
    physicalDefenceMultiply = 35,
    magicDefenceMultiply = 30,
    criticalLevelMultiply = 17,
    criticalResistLevelMultiply = 17
    };
getRow(1,322)->
    #player_baseCfg {
    level = 1,
    maxLevel = 105,
    class = 322,
    maxHP = 2643,
    physicalAttack = 302,
    magicAttack = 0,
    physicalDefence = 294,
    magicDefence = 252,
    criticalLevel = 119,
    criticalResistLevel = 119,
    maxHPMultiply = 316,
    physicalAttackMultiply = 36,
    magicAttackMultiply = 0,
    physicalDefenceMultiply = 35,
    magicDefenceMultiply = 30,
    criticalLevelMultiply = 17,
    criticalResistLevelMultiply = 17
    };
getRow(1,323)->
    #player_baseCfg {
    level = 1,
    maxLevel = 105,
    class = 323,
    maxHP = 2784,
    physicalAttack = 280,
    magicAttack = 0,
    physicalDefence = 308,
    magicDefence = 308,
    criticalLevel = 119,
    criticalResistLevel = 119,
    maxHPMultiply = 333,
    physicalAttackMultiply = 34,
    magicAttackMultiply = 0,
    physicalDefenceMultiply = 37,
    magicDefenceMultiply = 37,
    criticalLevelMultiply = 17,
    criticalResistLevelMultiply = 17
    };
getRow(_,_)->[].

getKeyList()->[
    {1,101},
    {1,111},
    {1,112},
    {1,121},
    {1,122},
    {1,123},
    {1,201},
    {1,211},
    {1,212},
    {1,221},
    {1,222},
    {1,223},
    {1,301},
    {1,311},
    {1,312},
    {1,321},
    {1,322},
    {1,323}
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
    201,
    211,
    212,
    221,
    222,
    223,
    301,
    311,
    312,
    321,
    322,
    323
    ];
get2KeyList(_)->[].

