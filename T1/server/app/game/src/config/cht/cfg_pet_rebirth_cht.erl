%% coding: latin-1
%%: 实现
-module(cfg_pet_rebirth_cht).
-compile(export_all).
-include("cfg_pet_rebirth.hrl").


getRow(1,0)->
    #pet_rebirthCfg {
    petRebirth = 1,
    petQuality = 0,
    maxHP2 = 1040,
    physicalAttack = 104,
    magicAttack = 104,
    physicalDefence = 104,
    magicDefence = 104,
    maxHP2Multiply = 0.042,
    physicalAttackMultiply = 0.042,
    magicAttackMultiply = 0.042,
    physicalDefenceMultiply = 0.042,
    magicDefenceMultiply = 0.042,
    rebirthGrow = 0.04
    };
getRow(1,1)->
    #pet_rebirthCfg {
    petRebirth = 1,
    petQuality = 1,
    maxHP2 = 1248,
    physicalAttack = 124,
    magicAttack = 124,
    physicalDefence = 124,
    magicDefence = 124,
    maxHP2Multiply = 0.042,
    physicalAttackMultiply = 0.042,
    magicAttackMultiply = 0.042,
    physicalDefenceMultiply = 0.042,
    magicDefenceMultiply = 0.042,
    rebirthGrow = 0.04
    };
getRow(1,2)->
    #pet_rebirthCfg {
    petRebirth = 1,
    petQuality = 2,
    maxHP2 = 1560,
    physicalAttack = 156,
    magicAttack = 156,
    physicalDefence = 156,
    magicDefence = 156,
    maxHP2Multiply = 0.042,
    physicalAttackMultiply = 0.042,
    magicAttackMultiply = 0.042,
    physicalDefenceMultiply = 0.042,
    magicDefenceMultiply = 0.042,
    rebirthGrow = 0.04
    };
getRow(1,3)->
    #pet_rebirthCfg {
    petRebirth = 1,
    petQuality = 3,
    maxHP2 = 2080,
    physicalAttack = 208,
    magicAttack = 208,
    physicalDefence = 208,
    magicDefence = 208,
    maxHP2Multiply = 0.042,
    physicalAttackMultiply = 0.042,
    magicAttackMultiply = 0.042,
    physicalDefenceMultiply = 0.042,
    magicDefenceMultiply = 0.042,
    rebirthGrow = 0.04
    };
getRow(1,4)->
    #pet_rebirthCfg {
    petRebirth = 1,
    petQuality = 4,
    maxHP2 = 3120,
    physicalAttack = 312,
    magicAttack = 312,
    physicalDefence = 312,
    magicDefence = 312,
    maxHP2Multiply = 0.042,
    physicalAttackMultiply = 0.042,
    magicAttackMultiply = 0.042,
    physicalDefenceMultiply = 0.042,
    magicDefenceMultiply = 0.042,
    rebirthGrow = 0.04
    };
getRow(2,0)->
    #pet_rebirthCfg {
    petRebirth = 2,
    petQuality = 0,
    maxHP2 = 2594,
    physicalAttack = 259,
    magicAttack = 259,
    physicalDefence = 259,
    magicDefence = 259,
    maxHP2Multiply = 0.106,
    physicalAttackMultiply = 0.106,
    magicAttackMultiply = 0.106,
    physicalDefenceMultiply = 0.106,
    magicDefenceMultiply = 0.106,
    rebirthGrow = 0.11
    };
getRow(2,1)->
    #pet_rebirthCfg {
    petRebirth = 2,
    petQuality = 1,
    maxHP2 = 3113,
    physicalAttack = 311,
    magicAttack = 311,
    physicalDefence = 311,
    magicDefence = 311,
    maxHP2Multiply = 0.106,
    physicalAttackMultiply = 0.106,
    magicAttackMultiply = 0.106,
    physicalDefenceMultiply = 0.106,
    magicDefenceMultiply = 0.106,
    rebirthGrow = 0.11
    };
getRow(2,2)->
    #pet_rebirthCfg {
    petRebirth = 2,
    petQuality = 2,
    maxHP2 = 3891,
    physicalAttack = 389,
    magicAttack = 389,
    physicalDefence = 389,
    magicDefence = 389,
    maxHP2Multiply = 0.106,
    physicalAttackMultiply = 0.106,
    magicAttackMultiply = 0.106,
    physicalDefenceMultiply = 0.106,
    magicDefenceMultiply = 0.106,
    rebirthGrow = 0.11
    };
getRow(2,3)->
    #pet_rebirthCfg {
    petRebirth = 2,
    petQuality = 3,
    maxHP2 = 5188,
    physicalAttack = 518,
    magicAttack = 518,
    physicalDefence = 518,
    magicDefence = 518,
    maxHP2Multiply = 0.106,
    physicalAttackMultiply = 0.106,
    magicAttackMultiply = 0.106,
    physicalDefenceMultiply = 0.106,
    magicDefenceMultiply = 0.106,
    rebirthGrow = 0.11
    };
getRow(2,4)->
    #pet_rebirthCfg {
    petRebirth = 2,
    petQuality = 4,
    maxHP2 = 7782,
    physicalAttack = 778,
    magicAttack = 778,
    physicalDefence = 778,
    magicDefence = 778,
    maxHP2Multiply = 0.106,
    physicalAttackMultiply = 0.106,
    magicAttackMultiply = 0.106,
    physicalDefenceMultiply = 0.106,
    magicDefenceMultiply = 0.106,
    rebirthGrow = 0.11
    };
getRow(3,0)->
    #pet_rebirthCfg {
    petRebirth = 3,
    petQuality = 0,
    maxHP2 = 5175,
    physicalAttack = 517,
    magicAttack = 517,
    physicalDefence = 517,
    magicDefence = 517,
    maxHP2Multiply = 0.211,
    physicalAttackMultiply = 0.211,
    magicAttackMultiply = 0.211,
    physicalDefenceMultiply = 0.211,
    magicDefenceMultiply = 0.211,
    rebirthGrow = 0.21
    };
getRow(3,1)->
    #pet_rebirthCfg {
    petRebirth = 3,
    petQuality = 1,
    maxHP2 = 6210,
    physicalAttack = 621,
    magicAttack = 621,
    physicalDefence = 621,
    magicDefence = 621,
    maxHP2Multiply = 0.211,
    physicalAttackMultiply = 0.211,
    magicAttackMultiply = 0.211,
    physicalDefenceMultiply = 0.211,
    magicDefenceMultiply = 0.211,
    rebirthGrow = 0.21
    };
getRow(3,2)->
    #pet_rebirthCfg {
    petRebirth = 3,
    petQuality = 2,
    maxHP2 = 7763,
    physicalAttack = 776,
    magicAttack = 776,
    physicalDefence = 776,
    magicDefence = 776,
    maxHP2Multiply = 0.211,
    physicalAttackMultiply = 0.211,
    magicAttackMultiply = 0.211,
    physicalDefenceMultiply = 0.211,
    magicDefenceMultiply = 0.211,
    rebirthGrow = 0.21
    };
getRow(3,3)->
    #pet_rebirthCfg {
    petRebirth = 3,
    petQuality = 3,
    maxHP2 = 10351,
    physicalAttack = 1035,
    magicAttack = 1035,
    physicalDefence = 1035,
    magicDefence = 1035,
    maxHP2Multiply = 0.211,
    physicalAttackMultiply = 0.211,
    magicAttackMultiply = 0.211,
    physicalDefenceMultiply = 0.211,
    magicDefenceMultiply = 0.211,
    rebirthGrow = 0.21
    };
getRow(3,4)->
    #pet_rebirthCfg {
    petRebirth = 3,
    petQuality = 4,
    maxHP2 = 15527,
    physicalAttack = 1552,
    magicAttack = 1552,
    physicalDefence = 1552,
    magicDefence = 1552,
    maxHP2Multiply = 0.211,
    physicalAttackMultiply = 0.211,
    magicAttackMultiply = 0.211,
    physicalDefenceMultiply = 0.211,
    magicDefenceMultiply = 0.211,
    rebirthGrow = 0.21
    };
getRow(4,0)->
    #pet_rebirthCfg {
    petRebirth = 4,
    petQuality = 0,
    maxHP2 = 8784,
    physicalAttack = 878,
    magicAttack = 878,
    physicalDefence = 878,
    magicDefence = 878,
    maxHP2Multiply = 0.358,
    physicalAttackMultiply = 0.358,
    magicAttackMultiply = 0.358,
    physicalDefenceMultiply = 0.358,
    magicDefenceMultiply = 0.358,
    rebirthGrow = 0.36
    };
getRow(4,1)->
    #pet_rebirthCfg {
    petRebirth = 4,
    petQuality = 1,
    maxHP2 = 10541,
    physicalAttack = 1054,
    magicAttack = 1054,
    physicalDefence = 1054,
    magicDefence = 1054,
    maxHP2Multiply = 0.358,
    physicalAttackMultiply = 0.358,
    magicAttackMultiply = 0.358,
    physicalDefenceMultiply = 0.358,
    magicDefenceMultiply = 0.358,
    rebirthGrow = 0.36
    };
getRow(4,2)->
    #pet_rebirthCfg {
    petRebirth = 4,
    petQuality = 2,
    maxHP2 = 13176,
    physicalAttack = 1317,
    magicAttack = 1317,
    physicalDefence = 1317,
    magicDefence = 1317,
    maxHP2Multiply = 0.358,
    physicalAttackMultiply = 0.358,
    magicAttackMultiply = 0.358,
    physicalDefenceMultiply = 0.358,
    magicDefenceMultiply = 0.358,
    rebirthGrow = 0.36
    };
getRow(4,3)->
    #pet_rebirthCfg {
    petRebirth = 4,
    petQuality = 3,
    maxHP2 = 17569,
    physicalAttack = 1756,
    magicAttack = 1756,
    physicalDefence = 1756,
    magicDefence = 1756,
    maxHP2Multiply = 0.358,
    physicalAttackMultiply = 0.358,
    magicAttackMultiply = 0.358,
    physicalDefenceMultiply = 0.358,
    magicDefenceMultiply = 0.358,
    rebirthGrow = 0.36
    };
getRow(4,4)->
    #pet_rebirthCfg {
    petRebirth = 4,
    petQuality = 4,
    maxHP2 = 26353,
    physicalAttack = 2635,
    magicAttack = 2635,
    physicalDefence = 2635,
    magicDefence = 2635,
    maxHP2Multiply = 0.358,
    physicalAttackMultiply = 0.358,
    magicAttackMultiply = 0.358,
    physicalDefenceMultiply = 0.358,
    magicDefenceMultiply = 0.358,
    rebirthGrow = 0.36
    };
getRow(5,0)->
    #pet_rebirthCfg {
    petRebirth = 5,
    petQuality = 0,
    maxHP2 = 13420,
    physicalAttack = 1342,
    magicAttack = 1342,
    physicalDefence = 1342,
    magicDefence = 1342,
    maxHP2Multiply = 0.547,
    physicalAttackMultiply = 0.547,
    magicAttackMultiply = 0.547,
    physicalDefenceMultiply = 0.547,
    magicDefenceMultiply = 0.547,
    rebirthGrow = 0.55
    };
getRow(5,1)->
    #pet_rebirthCfg {
    petRebirth = 5,
    petQuality = 1,
    maxHP2 = 16105,
    physicalAttack = 1610,
    magicAttack = 1610,
    physicalDefence = 1610,
    magicDefence = 1610,
    maxHP2Multiply = 0.547,
    physicalAttackMultiply = 0.547,
    magicAttackMultiply = 0.547,
    physicalDefenceMultiply = 0.547,
    magicDefenceMultiply = 0.547,
    rebirthGrow = 0.55
    };
getRow(5,2)->
    #pet_rebirthCfg {
    petRebirth = 5,
    petQuality = 2,
    maxHP2 = 20131,
    physicalAttack = 2013,
    magicAttack = 2013,
    physicalDefence = 2013,
    magicDefence = 2013,
    maxHP2Multiply = 0.547,
    physicalAttackMultiply = 0.547,
    magicAttackMultiply = 0.547,
    physicalDefenceMultiply = 0.547,
    magicDefenceMultiply = 0.547,
    rebirthGrow = 0.55
    };
getRow(5,3)->
    #pet_rebirthCfg {
    petRebirth = 5,
    petQuality = 3,
    maxHP2 = 26841,
    physicalAttack = 2684,
    magicAttack = 2684,
    physicalDefence = 2684,
    magicDefence = 2684,
    maxHP2Multiply = 0.547,
    physicalAttackMultiply = 0.547,
    magicAttackMultiply = 0.547,
    physicalDefenceMultiply = 0.547,
    magicDefenceMultiply = 0.547,
    rebirthGrow = 0.55
    };
getRow(5,4)->
    #pet_rebirthCfg {
    petRebirth = 5,
    petQuality = 4,
    maxHP2 = 40262,
    physicalAttack = 4026,
    magicAttack = 4026,
    physicalDefence = 4026,
    magicDefence = 4026,
    maxHP2Multiply = 0.547,
    physicalAttackMultiply = 0.547,
    magicAttackMultiply = 0.547,
    physicalDefenceMultiply = 0.547,
    magicDefenceMultiply = 0.547,
    rebirthGrow = 0.55
    };
getRow(6,0)->
    #pet_rebirthCfg {
    petRebirth = 6,
    petQuality = 0,
    maxHP2 = 19084,
    physicalAttack = 1908,
    magicAttack = 1908,
    physicalDefence = 1908,
    magicDefence = 1908,
    maxHP2Multiply = 0.778,
    physicalAttackMultiply = 0.778,
    magicAttackMultiply = 0.778,
    physicalDefenceMultiply = 0.778,
    magicDefenceMultiply = 0.778,
    rebirthGrow = 0.78
    };
getRow(6,1)->
    #pet_rebirthCfg {
    petRebirth = 6,
    petQuality = 1,
    maxHP2 = 22901,
    physicalAttack = 2290,
    magicAttack = 2290,
    physicalDefence = 2290,
    magicDefence = 2290,
    maxHP2Multiply = 0.778,
    physicalAttackMultiply = 0.778,
    magicAttackMultiply = 0.778,
    physicalDefenceMultiply = 0.778,
    magicDefenceMultiply = 0.778,
    rebirthGrow = 0.78
    };
getRow(6,2)->
    #pet_rebirthCfg {
    petRebirth = 6,
    petQuality = 2,
    maxHP2 = 28626,
    physicalAttack = 2862,
    magicAttack = 2862,
    physicalDefence = 2862,
    magicDefence = 2862,
    maxHP2Multiply = 0.778,
    physicalAttackMultiply = 0.778,
    magicAttackMultiply = 0.778,
    physicalDefenceMultiply = 0.778,
    magicDefenceMultiply = 0.778,
    rebirthGrow = 0.78
    };
getRow(6,3)->
    #pet_rebirthCfg {
    petRebirth = 6,
    petQuality = 3,
    maxHP2 = 38169,
    physicalAttack = 3816,
    magicAttack = 3816,
    physicalDefence = 3816,
    magicDefence = 3816,
    maxHP2Multiply = 0.778,
    physicalAttackMultiply = 0.778,
    magicAttackMultiply = 0.778,
    physicalDefenceMultiply = 0.778,
    magicDefenceMultiply = 0.778,
    rebirthGrow = 0.78
    };
getRow(6,4)->
    #pet_rebirthCfg {
    petRebirth = 6,
    petQuality = 4,
    maxHP2 = 57253,
    physicalAttack = 5725,
    magicAttack = 5725,
    physicalDefence = 5725,
    magicDefence = 5725,
    maxHP2Multiply = 0.778,
    physicalAttackMultiply = 0.778,
    magicAttackMultiply = 0.778,
    physicalDefenceMultiply = 0.778,
    magicDefenceMultiply = 0.778,
    rebirthGrow = 0.78
    };
getRow(7,0)->
    #pet_rebirthCfg {
    petRebirth = 7,
    petQuality = 0,
    maxHP2 = 25775,
    physicalAttack = 2577,
    magicAttack = 2577,
    physicalDefence = 2577,
    magicDefence = 2577,
    maxHP2Multiply = 1.051,
    physicalAttackMultiply = 1.051,
    magicAttackMultiply = 1.051,
    physicalDefenceMultiply = 1.051,
    magicDefenceMultiply = 1.051,
    rebirthGrow = 1.05
    };
getRow(7,1)->
    #pet_rebirthCfg {
    petRebirth = 7,
    petQuality = 1,
    maxHP2 = 30930,
    physicalAttack = 3093,
    magicAttack = 3093,
    physicalDefence = 3093,
    magicDefence = 3093,
    maxHP2Multiply = 1.051,
    physicalAttackMultiply = 1.051,
    magicAttackMultiply = 1.051,
    physicalDefenceMultiply = 1.051,
    magicDefenceMultiply = 1.051,
    rebirthGrow = 1.05
    };
getRow(7,2)->
    #pet_rebirthCfg {
    petRebirth = 7,
    petQuality = 2,
    maxHP2 = 38663,
    physicalAttack = 3866,
    magicAttack = 3866,
    physicalDefence = 3866,
    magicDefence = 3866,
    maxHP2Multiply = 1.051,
    physicalAttackMultiply = 1.051,
    magicAttackMultiply = 1.051,
    physicalDefenceMultiply = 1.051,
    magicDefenceMultiply = 1.051,
    rebirthGrow = 1.05
    };
getRow(7,3)->
    #pet_rebirthCfg {
    petRebirth = 7,
    petQuality = 3,
    maxHP2 = 51551,
    physicalAttack = 5155,
    magicAttack = 5155,
    physicalDefence = 5155,
    magicDefence = 5155,
    maxHP2Multiply = 1.051,
    physicalAttackMultiply = 1.051,
    magicAttackMultiply = 1.051,
    physicalDefenceMultiply = 1.051,
    magicDefenceMultiply = 1.051,
    rebirthGrow = 1.05
    };
getRow(7,4)->
    #pet_rebirthCfg {
    petRebirth = 7,
    petQuality = 4,
    maxHP2 = 77327,
    physicalAttack = 7732,
    magicAttack = 7732,
    physicalDefence = 7732,
    magicDefence = 7732,
    maxHP2Multiply = 1.051,
    physicalAttackMultiply = 1.051,
    magicAttackMultiply = 1.051,
    physicalDefenceMultiply = 1.051,
    magicDefenceMultiply = 1.051,
    rebirthGrow = 1.05
    };
getRow(8,0)->
    #pet_rebirthCfg {
    petRebirth = 8,
    petQuality = 0,
    maxHP2 = 33494,
    physicalAttack = 3349,
    magicAttack = 3349,
    physicalDefence = 3349,
    magicDefence = 3349,
    maxHP2Multiply = 1.365,
    physicalAttackMultiply = 1.365,
    magicAttackMultiply = 1.365,
    physicalDefenceMultiply = 1.365,
    magicDefenceMultiply = 1.365,
    rebirthGrow = 1.37
    };
getRow(8,1)->
    #pet_rebirthCfg {
    petRebirth = 8,
    petQuality = 1,
    maxHP2 = 40193,
    physicalAttack = 4019,
    magicAttack = 4019,
    physicalDefence = 4019,
    magicDefence = 4019,
    maxHP2Multiply = 1.365,
    physicalAttackMultiply = 1.365,
    magicAttackMultiply = 1.365,
    physicalDefenceMultiply = 1.365,
    magicDefenceMultiply = 1.365,
    rebirthGrow = 1.37
    };
getRow(8,2)->
    #pet_rebirthCfg {
    petRebirth = 8,
    petQuality = 2,
    maxHP2 = 50241,
    physicalAttack = 5024,
    magicAttack = 5024,
    physicalDefence = 5024,
    magicDefence = 5024,
    maxHP2Multiply = 1.365,
    physicalAttackMultiply = 1.365,
    magicAttackMultiply = 1.365,
    physicalDefenceMultiply = 1.365,
    magicDefenceMultiply = 1.365,
    rebirthGrow = 1.37
    };
getRow(8,3)->
    #pet_rebirthCfg {
    petRebirth = 8,
    petQuality = 3,
    maxHP2 = 66988,
    physicalAttack = 6698,
    magicAttack = 6698,
    physicalDefence = 6698,
    magicDefence = 6698,
    maxHP2Multiply = 1.365,
    physicalAttackMultiply = 1.365,
    magicAttackMultiply = 1.365,
    physicalDefenceMultiply = 1.365,
    magicDefenceMultiply = 1.365,
    rebirthGrow = 1.37
    };
getRow(8,4)->
    #pet_rebirthCfg {
    petRebirth = 8,
    petQuality = 4,
    maxHP2 = 100483,
    physicalAttack = 10048,
    magicAttack = 10048,
    physicalDefence = 10048,
    magicDefence = 10048,
    maxHP2Multiply = 1.365,
    physicalAttackMultiply = 1.365,
    magicAttackMultiply = 1.365,
    physicalDefenceMultiply = 1.365,
    magicDefenceMultiply = 1.365,
    rebirthGrow = 1.37
    };
getRow(9,0)->
    #pet_rebirthCfg {
    petRebirth = 9,
    petQuality = 0,
    maxHP2 = 42240,
    physicalAttack = 4224,
    magicAttack = 4224,
    physicalDefence = 4224,
    magicDefence = 4224,
    maxHP2Multiply = 1.722,
    physicalAttackMultiply = 1.722,
    magicAttackMultiply = 1.722,
    physicalDefenceMultiply = 1.722,
    magicDefenceMultiply = 1.722,
    rebirthGrow = 1.72
    };
getRow(9,1)->
    #pet_rebirthCfg {
    petRebirth = 9,
    petQuality = 1,
    maxHP2 = 50688,
    physicalAttack = 5068,
    magicAttack = 5068,
    physicalDefence = 5068,
    magicDefence = 5068,
    maxHP2Multiply = 1.722,
    physicalAttackMultiply = 1.722,
    magicAttackMultiply = 1.722,
    physicalDefenceMultiply = 1.722,
    magicDefenceMultiply = 1.722,
    rebirthGrow = 1.72
    };
getRow(9,2)->
    #pet_rebirthCfg {
    petRebirth = 9,
    petQuality = 2,
    maxHP2 = 63360,
    physicalAttack = 6336,
    magicAttack = 6336,
    physicalDefence = 6336,
    magicDefence = 6336,
    maxHP2Multiply = 1.722,
    physicalAttackMultiply = 1.722,
    magicAttackMultiply = 1.722,
    physicalDefenceMultiply = 1.722,
    magicDefenceMultiply = 1.722,
    rebirthGrow = 1.72
    };
getRow(9,3)->
    #pet_rebirthCfg {
    petRebirth = 9,
    petQuality = 3,
    maxHP2 = 84480,
    physicalAttack = 8448,
    magicAttack = 8448,
    physicalDefence = 8448,
    magicDefence = 8448,
    maxHP2Multiply = 1.722,
    physicalAttackMultiply = 1.722,
    magicAttackMultiply = 1.722,
    physicalDefenceMultiply = 1.722,
    magicDefenceMultiply = 1.722,
    rebirthGrow = 1.72
    };
getRow(9,4)->
    #pet_rebirthCfg {
    petRebirth = 9,
    petQuality = 4,
    maxHP2 = 126721,
    physicalAttack = 12672,
    magicAttack = 12672,
    physicalDefence = 12672,
    magicDefence = 12672,
    maxHP2Multiply = 1.722,
    physicalAttackMultiply = 1.722,
    magicAttackMultiply = 1.722,
    physicalDefenceMultiply = 1.722,
    magicDefenceMultiply = 1.722,
    rebirthGrow = 1.72
    };
getRow(10,0)->
    #pet_rebirthCfg {
    petRebirth = 10,
    petQuality = 0,
    maxHP2 = 52013,
    physicalAttack = 5201,
    magicAttack = 5201,
    physicalDefence = 5201,
    magicDefence = 5201,
    maxHP2Multiply = 2.12,
    physicalAttackMultiply = 2.12,
    magicAttackMultiply = 2.12,
    physicalDefenceMultiply = 2.12,
    magicDefenceMultiply = 2.12,
    rebirthGrow = 2.12
    };
getRow(10,1)->
    #pet_rebirthCfg {
    petRebirth = 10,
    petQuality = 1,
    maxHP2 = 62416,
    physicalAttack = 6241,
    magicAttack = 6241,
    physicalDefence = 6241,
    magicDefence = 6241,
    maxHP2Multiply = 2.12,
    physicalAttackMultiply = 2.12,
    magicAttackMultiply = 2.12,
    physicalDefenceMultiply = 2.12,
    magicDefenceMultiply = 2.12,
    rebirthGrow = 2.12
    };
getRow(10,2)->
    #pet_rebirthCfg {
    petRebirth = 10,
    petQuality = 2,
    maxHP2 = 78020,
    physicalAttack = 7802,
    magicAttack = 7802,
    physicalDefence = 7802,
    magicDefence = 7802,
    maxHP2Multiply = 2.12,
    physicalAttackMultiply = 2.12,
    magicAttackMultiply = 2.12,
    physicalDefenceMultiply = 2.12,
    magicDefenceMultiply = 2.12,
    rebirthGrow = 2.12
    };
getRow(10,3)->
    #pet_rebirthCfg {
    petRebirth = 10,
    petQuality = 3,
    maxHP2 = 104027,
    physicalAttack = 10402,
    magicAttack = 10402,
    physicalDefence = 10402,
    magicDefence = 10402,
    maxHP2Multiply = 2.12,
    physicalAttackMultiply = 2.12,
    magicAttackMultiply = 2.12,
    physicalDefenceMultiply = 2.12,
    magicDefenceMultiply = 2.12,
    rebirthGrow = 2.12
    };
getRow(10,4)->
    #pet_rebirthCfg {
    petRebirth = 10,
    petQuality = 4,
    maxHP2 = 156041,
    physicalAttack = 15604,
    magicAttack = 15604,
    physicalDefence = 15604,
    magicDefence = 15604,
    maxHP2Multiply = 2.12,
    physicalAttackMultiply = 2.12,
    magicAttackMultiply = 2.12,
    physicalDefenceMultiply = 2.12,
    magicDefenceMultiply = 2.12,
    rebirthGrow = 2.12
    };
getRow(_,_)->[].

getKeyList()->[
    {1,0},
    {1,1},
    {1,2},
    {1,3},
    {1,4},
    {2,0},
    {2,1},
    {2,2},
    {2,3},
    {2,4},
    {3,0},
    {3,1},
    {3,2},
    {3,3},
    {3,4},
    {4,0},
    {4,1},
    {4,2},
    {4,3},
    {4,4},
    {5,0},
    {5,1},
    {5,2},
    {5,3},
    {5,4},
    {6,0},
    {6,1},
    {6,2},
    {6,3},
    {6,4},
    {7,0},
    {7,1},
    {7,2},
    {7,3},
    {7,4},
    {8,0},
    {8,1},
    {8,2},
    {8,3},
    {8,4},
    {9,0},
    {9,1},
    {9,2},
    {9,3},
    {9,4},
    {10,0},
    {10,1},
    {10,2},
    {10,3},
    {10,4}
    ].

get1KeyList()->[
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9,
    10
    ].

get2KeyList(1)->[
    0,
    1,
    2,
    3,
    4
    ];
get2KeyList(2)->[
    0,
    1,
    2,
    3,
    4
    ];
get2KeyList(3)->[
    0,
    1,
    2,
    3,
    4
    ];
get2KeyList(4)->[
    0,
    1,
    2,
    3,
    4
    ];
get2KeyList(5)->[
    0,
    1,
    2,
    3,
    4
    ];
get2KeyList(6)->[
    0,
    1,
    2,
    3,
    4
    ];
get2KeyList(7)->[
    0,
    1,
    2,
    3,
    4
    ];
get2KeyList(8)->[
    0,
    1,
    2,
    3,
    4
    ];
get2KeyList(9)->[
    0,
    1,
    2,
    3,
    4
    ];
get2KeyList(10)->[
    0,
    1,
    2,
    3,
    4
    ];
get2KeyList(_)->[].

