%% coding: latin-1
%%: 实现
-module(cfg_pet_rebirth_chs).
-compile(export_all).
-include("cfg_pet_rebirth.hrl").
-include("logger.hrl").

getRow(1,0)->
    #pet_rebirthCfg {
    petRebirth = 1,
    petQuality = 0,
    maxHP2 = 758,
    physicalAttack = 75,
    magicAttack = 75,
    physicalDefence = 75,
    magicDefence = 75,
    maxHP2Multiply = 0.033,
    physicalAttackMultiply = 0.033,
    magicAttackMultiply = 0.033,
    physicalDefenceMultiply = 0.033,
    magicDefenceMultiply = 0.033,
    rebirthGrow = 0.09
    };
getRow(1,1)->
    #pet_rebirthCfg {
    petRebirth = 1,
    petQuality = 1,
    maxHP2 = 1365,
    physicalAttack = 136,
    magicAttack = 136,
    physicalDefence = 136,
    magicDefence = 136,
    maxHP2Multiply = 0.033,
    physicalAttackMultiply = 0.033,
    magicAttackMultiply = 0.033,
    physicalDefenceMultiply = 0.033,
    magicDefenceMultiply = 0.033,
    rebirthGrow = 0.09
    };
getRow(1,2)->
    #pet_rebirthCfg {
    petRebirth = 1,
    petQuality = 2,
    maxHP2 = 2275,
    physicalAttack = 227,
    magicAttack = 227,
    physicalDefence = 227,
    magicDefence = 227,
    maxHP2Multiply = 0.033,
    physicalAttackMultiply = 0.033,
    magicAttackMultiply = 0.033,
    physicalDefenceMultiply = 0.033,
    magicDefenceMultiply = 0.033,
    rebirthGrow = 0.09
    };
getRow(1,3)->
    #pet_rebirthCfg {
    petRebirth = 1,
    petQuality = 3,
    maxHP2 = 3791,
    physicalAttack = 379,
    magicAttack = 379,
    physicalDefence = 379,
    magicDefence = 379,
    maxHP2Multiply = 0.033,
    physicalAttackMultiply = 0.033,
    magicAttackMultiply = 0.033,
    physicalDefenceMultiply = 0.033,
    magicDefenceMultiply = 0.033,
    rebirthGrow = 0.09
    };
getRow(1,4)->
    #pet_rebirthCfg {
    petRebirth = 1,
    petQuality = 4,
    maxHP2 = 6066,
    physicalAttack = 606,
    magicAttack = 606,
    physicalDefence = 606,
    magicDefence = 606,
    maxHP2Multiply = 0.033,
    physicalAttackMultiply = 0.033,
    magicAttackMultiply = 0.033,
    physicalDefenceMultiply = 0.033,
    magicDefenceMultiply = 0.033,
    rebirthGrow = 0.09
    };
getRow(1,5)->
    #pet_rebirthCfg {
    petRebirth = 1,
    petQuality = 5,
    maxHP2 = 9100,
    physicalAttack = 910,
    magicAttack = 910,
    physicalDefence = 910,
    magicDefence = 910,
    maxHP2Multiply = 0.033,
    physicalAttackMultiply = 0.033,
    magicAttackMultiply = 0.033,
    physicalDefenceMultiply = 0.033,
    magicDefenceMultiply = 0.033,
    rebirthGrow = 0.09
    };
getRow(2,0)->
    #pet_rebirthCfg {
    petRebirth = 2,
    petQuality = 0,
    maxHP2 = 1563,
    physicalAttack = 156,
    magicAttack = 156,
    physicalDefence = 156,
    magicDefence = 156,
    maxHP2Multiply = 0.069,
    physicalAttackMultiply = 0.069,
    magicAttackMultiply = 0.069,
    physicalDefenceMultiply = 0.069,
    magicDefenceMultiply = 0.069,
    rebirthGrow = 0.21
    };
getRow(2,1)->
    #pet_rebirthCfg {
    petRebirth = 2,
    petQuality = 1,
    maxHP2 = 2814,
    physicalAttack = 281,
    magicAttack = 281,
    physicalDefence = 281,
    magicDefence = 281,
    maxHP2Multiply = 0.069,
    physicalAttackMultiply = 0.069,
    magicAttackMultiply = 0.069,
    physicalDefenceMultiply = 0.069,
    magicDefenceMultiply = 0.069,
    rebirthGrow = 0.2
    };
getRow(2,2)->
    #pet_rebirthCfg {
    petRebirth = 2,
    petQuality = 2,
    maxHP2 = 4690,
    physicalAttack = 469,
    magicAttack = 469,
    physicalDefence = 469,
    magicDefence = 469,
    maxHP2Multiply = 0.069,
    physicalAttackMultiply = 0.069,
    magicAttackMultiply = 0.069,
    physicalDefenceMultiply = 0.069,
    magicDefenceMultiply = 0.069,
    rebirthGrow = 0.21
    };
getRow(2,3)->
    #pet_rebirthCfg {
    petRebirth = 2,
    petQuality = 3,
    maxHP2 = 7817,
    physicalAttack = 781,
    magicAttack = 781,
    physicalDefence = 781,
    magicDefence = 781,
    maxHP2Multiply = 0.069,
    physicalAttackMultiply = 0.069,
    magicAttackMultiply = 0.069,
    physicalDefenceMultiply = 0.069,
    magicDefenceMultiply = 0.069,
    rebirthGrow = 0.21
    };
getRow(2,4)->
    #pet_rebirthCfg {
    petRebirth = 2,
    petQuality = 4,
    maxHP2 = 12507,
    physicalAttack = 1250,
    magicAttack = 1250,
    physicalDefence = 1250,
    magicDefence = 1250,
    maxHP2Multiply = 0.069,
    physicalAttackMultiply = 0.069,
    magicAttackMultiply = 0.069,
    physicalDefenceMultiply = 0.069,
    magicDefenceMultiply = 0.069,
    rebirthGrow = 0.21
    };
getRow(2,5)->
    #pet_rebirthCfg {
    petRebirth = 2,
    petQuality = 5,
    maxHP2 = 18761,
    physicalAttack = 1876,
    magicAttack = 1876,
    physicalDefence = 1876,
    magicDefence = 1876,
    maxHP2Multiply = 0.069,
    physicalAttackMultiply = 0.069,
    magicAttackMultiply = 0.069,
    physicalDefenceMultiply = 0.069,
    magicDefenceMultiply = 0.069,
    rebirthGrow = 0.21
    };
getRow(3,0)->
    #pet_rebirthCfg {
    petRebirth = 3,
    petQuality = 0,
    maxHP2 = 2539,
    physicalAttack = 253,
    magicAttack = 253,
    physicalDefence = 253,
    magicDefence = 253,
    maxHP2Multiply = 0.112,
    physicalAttackMultiply = 0.112,
    magicAttackMultiply = 0.112,
    physicalDefenceMultiply = 0.112,
    magicDefenceMultiply = 0.112,
    rebirthGrow = 0.33
    };
getRow(3,1)->
    #pet_rebirthCfg {
    petRebirth = 3,
    petQuality = 1,
    maxHP2 = 4571,
    physicalAttack = 457,
    magicAttack = 457,
    physicalDefence = 457,
    magicDefence = 457,
    maxHP2Multiply = 0.112,
    physicalAttackMultiply = 0.112,
    magicAttackMultiply = 0.112,
    physicalDefenceMultiply = 0.112,
    magicDefenceMultiply = 0.112,
    rebirthGrow = 0.33
    };
getRow(3,2)->
    #pet_rebirthCfg {
    petRebirth = 3,
    petQuality = 2,
    maxHP2 = 7619,
    physicalAttack = 761,
    magicAttack = 761,
    physicalDefence = 761,
    magicDefence = 761,
    maxHP2Multiply = 0.112,
    physicalAttackMultiply = 0.112,
    magicAttackMultiply = 0.112,
    physicalDefenceMultiply = 0.112,
    magicDefenceMultiply = 0.112,
    rebirthGrow = 0.33
    };
getRow(3,3)->
    #pet_rebirthCfg {
    petRebirth = 3,
    petQuality = 3,
    maxHP2 = 12699,
    physicalAttack = 1269,
    magicAttack = 1269,
    physicalDefence = 1269,
    magicDefence = 1269,
    maxHP2Multiply = 0.112,
    physicalAttackMultiply = 0.112,
    magicAttackMultiply = 0.112,
    physicalDefenceMultiply = 0.112,
    magicDefenceMultiply = 0.112,
    rebirthGrow = 0.33
    };
getRow(3,4)->
    #pet_rebirthCfg {
    petRebirth = 3,
    petQuality = 4,
    maxHP2 = 20318,
    physicalAttack = 2031,
    magicAttack = 2031,
    physicalDefence = 2031,
    magicDefence = 2031,
    maxHP2Multiply = 0.112,
    physicalAttackMultiply = 0.112,
    magicAttackMultiply = 0.112,
    physicalDefenceMultiply = 0.112,
    magicDefenceMultiply = 0.112,
    rebirthGrow = 0.33
    };
getRow(3,5)->
    #pet_rebirthCfg {
    petRebirth = 3,
    petQuality = 5,
    maxHP2 = 30477,
    physicalAttack = 3047,
    magicAttack = 3047,
    physicalDefence = 3047,
    magicDefence = 3047,
    maxHP2Multiply = 0.112,
    physicalAttackMultiply = 0.112,
    magicAttackMultiply = 0.112,
    physicalDefenceMultiply = 0.112,
    magicDefenceMultiply = 0.112,
    rebirthGrow = 0.33
    };
getRow(4,0)->
    #pet_rebirthCfg {
    petRebirth = 4,
    petQuality = 0,
    maxHP2 = 3763,
    physicalAttack = 376,
    magicAttack = 376,
    physicalDefence = 376,
    magicDefence = 376,
    maxHP2Multiply = 0.165,
    physicalAttackMultiply = 0.165,
    magicAttackMultiply = 0.165,
    physicalDefenceMultiply = 0.165,
    magicDefenceMultiply = 0.165,
    rebirthGrow = 0.51
    };
getRow(4,1)->
    #pet_rebirthCfg {
    petRebirth = 4,
    petQuality = 1,
    maxHP2 = 6773,
    physicalAttack = 677,
    magicAttack = 677,
    physicalDefence = 677,
    magicDefence = 677,
    maxHP2Multiply = 0.165,
    physicalAttackMultiply = 0.165,
    magicAttackMultiply = 0.165,
    physicalDefenceMultiply = 0.165,
    magicDefenceMultiply = 0.165,
    rebirthGrow = 0.51
    };
getRow(4,2)->
    #pet_rebirthCfg {
    petRebirth = 4,
    petQuality = 2,
    maxHP2 = 11289,
    physicalAttack = 1128,
    magicAttack = 1128,
    physicalDefence = 1128,
    magicDefence = 1128,
    maxHP2Multiply = 0.165,
    physicalAttackMultiply = 0.165,
    magicAttackMultiply = 0.165,
    physicalDefenceMultiply = 0.165,
    magicDefenceMultiply = 0.165,
    rebirthGrow = 0.51
    };
getRow(4,3)->
    #pet_rebirthCfg {
    petRebirth = 4,
    petQuality = 3,
    maxHP2 = 18815,
    physicalAttack = 1881,
    magicAttack = 1881,
    physicalDefence = 1881,
    magicDefence = 1881,
    maxHP2Multiply = 0.165,
    physicalAttackMultiply = 0.165,
    magicAttackMultiply = 0.165,
    physicalDefenceMultiply = 0.165,
    magicDefenceMultiply = 0.165,
    rebirthGrow = 0.51
    };
getRow(4,4)->
    #pet_rebirthCfg {
    petRebirth = 4,
    petQuality = 4,
    maxHP2 = 30104,
    physicalAttack = 3010,
    magicAttack = 3010,
    physicalDefence = 3010,
    magicDefence = 3010,
    maxHP2Multiply = 0.165,
    physicalAttackMultiply = 0.165,
    magicAttackMultiply = 0.165,
    physicalDefenceMultiply = 0.165,
    magicDefenceMultiply = 0.165,
    rebirthGrow = 0.51
    };
getRow(4,5)->
    #pet_rebirthCfg {
    petRebirth = 4,
    petQuality = 5,
    maxHP2 = 45156,
    physicalAttack = 4515,
    magicAttack = 4515,
    physicalDefence = 4515,
    magicDefence = 4515,
    maxHP2Multiply = 0.165,
    physicalAttackMultiply = 0.165,
    magicAttackMultiply = 0.165,
    physicalDefenceMultiply = 0.165,
    magicDefenceMultiply = 0.165,
    rebirthGrow = 0.51
    };
getRow(5,0)->
    #pet_rebirthCfg {
    petRebirth = 5,
    petQuality = 0,
    maxHP2 = 5289,
    physicalAttack = 528,
    magicAttack = 528,
    physicalDefence = 528,
    magicDefence = 528,
    maxHP2Multiply = 0.232,
    physicalAttackMultiply = 0.232,
    magicAttackMultiply = 0.232,
    physicalDefenceMultiply = 0.232,
    magicDefenceMultiply = 0.232,
    rebirthGrow = 0.69
    };
getRow(5,1)->
    #pet_rebirthCfg {
    petRebirth = 5,
    petQuality = 1,
    maxHP2 = 9521,
    physicalAttack = 952,
    magicAttack = 952,
    physicalDefence = 952,
    magicDefence = 952,
    maxHP2Multiply = 0.232,
    physicalAttackMultiply = 0.232,
    magicAttackMultiply = 0.232,
    physicalDefenceMultiply = 0.232,
    magicDefenceMultiply = 0.232,
    rebirthGrow = 0.69
    };
getRow(5,2)->
    #pet_rebirthCfg {
    petRebirth = 5,
    petQuality = 2,
    maxHP2 = 15868,
    physicalAttack = 1586,
    magicAttack = 1586,
    physicalDefence = 1586,
    magicDefence = 1586,
    maxHP2Multiply = 0.232,
    physicalAttackMultiply = 0.232,
    magicAttackMultiply = 0.232,
    physicalDefenceMultiply = 0.232,
    magicDefenceMultiply = 0.232,
    rebirthGrow = 0.69
    };
getRow(5,3)->
    #pet_rebirthCfg {
    petRebirth = 5,
    petQuality = 3,
    maxHP2 = 26448,
    physicalAttack = 2644,
    magicAttack = 2644,
    physicalDefence = 2644,
    magicDefence = 2644,
    maxHP2Multiply = 0.232,
    physicalAttackMultiply = 0.232,
    magicAttackMultiply = 0.232,
    physicalDefenceMultiply = 0.232,
    magicDefenceMultiply = 0.232,
    rebirthGrow = 0.69
    };
getRow(5,4)->
    #pet_rebirthCfg {
    petRebirth = 5,
    petQuality = 4,
    maxHP2 = 42316,
    physicalAttack = 4231,
    magicAttack = 4231,
    physicalDefence = 4231,
    magicDefence = 4231,
    maxHP2Multiply = 0.232,
    physicalAttackMultiply = 0.232,
    magicAttackMultiply = 0.232,
    physicalDefenceMultiply = 0.232,
    magicDefenceMultiply = 0.232,
    rebirthGrow = 0.69
    };
getRow(5,5)->
    #pet_rebirthCfg {
    petRebirth = 5,
    petQuality = 5,
    maxHP2 = 63475,
    physicalAttack = 6347,
    magicAttack = 6347,
    physicalDefence = 6347,
    magicDefence = 6347,
    maxHP2Multiply = 0.232,
    physicalAttackMultiply = 0.232,
    magicAttackMultiply = 0.232,
    physicalDefenceMultiply = 0.232,
    magicDefenceMultiply = 0.232,
    rebirthGrow = 0.69
    };
getRow(6,0)->
    #pet_rebirthCfg {
    petRebirth = 6,
    petQuality = 0,
    maxHP2 = 7166,
    physicalAttack = 716,
    magicAttack = 716,
    physicalDefence = 716,
    magicDefence = 716,
    maxHP2Multiply = 0.315,
    physicalAttackMultiply = 0.315,
    magicAttackMultiply = 0.315,
    physicalDefenceMultiply = 0.315,
    magicDefenceMultiply = 0.315,
    rebirthGrow = 0.93
    };
getRow(6,1)->
    #pet_rebirthCfg {
    petRebirth = 6,
    petQuality = 1,
    maxHP2 = 12900,
    physicalAttack = 1290,
    magicAttack = 1290,
    physicalDefence = 1290,
    magicDefence = 1290,
    maxHP2Multiply = 0.315,
    physicalAttackMultiply = 0.315,
    magicAttackMultiply = 0.315,
    physicalDefenceMultiply = 0.315,
    magicDefenceMultiply = 0.315,
    rebirthGrow = 0.93
    };
getRow(6,2)->
    #pet_rebirthCfg {
    petRebirth = 6,
    petQuality = 2,
    maxHP2 = 21500,
    physicalAttack = 2150,
    magicAttack = 2150,
    physicalDefence = 2150,
    magicDefence = 2150,
    maxHP2Multiply = 0.315,
    physicalAttackMultiply = 0.315,
    magicAttackMultiply = 0.315,
    physicalDefenceMultiply = 0.315,
    magicDefenceMultiply = 0.315,
    rebirthGrow = 0.93
    };
getRow(6,3)->
    #pet_rebirthCfg {
    petRebirth = 6,
    petQuality = 3,
    maxHP2 = 35833,
    physicalAttack = 3583,
    magicAttack = 3583,
    physicalDefence = 3583,
    magicDefence = 3583,
    maxHP2Multiply = 0.315,
    physicalAttackMultiply = 0.315,
    magicAttackMultiply = 0.315,
    physicalDefenceMultiply = 0.315,
    magicDefenceMultiply = 0.315,
    rebirthGrow = 0.93
    };
getRow(6,4)->
    #pet_rebirthCfg {
    petRebirth = 6,
    petQuality = 4,
    maxHP2 = 57334,
    physicalAttack = 5733,
    magicAttack = 5733,
    physicalDefence = 5733,
    magicDefence = 5733,
    maxHP2Multiply = 0.315,
    physicalAttackMultiply = 0.315,
    magicAttackMultiply = 0.315,
    physicalDefenceMultiply = 0.315,
    magicDefenceMultiply = 0.315,
    rebirthGrow = 0.93
    };
getRow(6,5)->
    #pet_rebirthCfg {
    petRebirth = 6,
    petQuality = 5,
    maxHP2 = 86001,
    physicalAttack = 8600,
    magicAttack = 8600,
    physicalDefence = 8600,
    magicDefence = 8600,
    maxHP2Multiply = 0.315,
    physicalAttackMultiply = 0.315,
    magicAttackMultiply = 0.315,
    physicalDefenceMultiply = 0.315,
    magicDefenceMultiply = 0.315,
    rebirthGrow = 0.93
    };
getRow(7,0)->
    #pet_rebirthCfg {
    petRebirth = 7,
    petQuality = 0,
    maxHP2 = 9436,
    physicalAttack = 943,
    magicAttack = 943,
    physicalDefence = 943,
    magicDefence = 943,
    maxHP2Multiply = 0.414,
    physicalAttackMultiply = 0.414,
    magicAttackMultiply = 0.414,
    physicalDefenceMultiply = 0.414,
    magicDefenceMultiply = 0.414,
    rebirthGrow = 1.23
    };
getRow(7,1)->
    #pet_rebirthCfg {
    petRebirth = 7,
    petQuality = 1,
    maxHP2 = 16985,
    physicalAttack = 1698,
    magicAttack = 1698,
    physicalDefence = 1698,
    magicDefence = 1698,
    maxHP2Multiply = 0.414,
    physicalAttackMultiply = 0.414,
    magicAttackMultiply = 0.414,
    physicalDefenceMultiply = 0.414,
    magicDefenceMultiply = 0.414,
    rebirthGrow = 1.23
    };
getRow(7,2)->
    #pet_rebirthCfg {
    petRebirth = 7,
    petQuality = 2,
    maxHP2 = 28308,
    physicalAttack = 2830,
    magicAttack = 2830,
    physicalDefence = 2830,
    magicDefence = 2830,
    maxHP2Multiply = 0.414,
    physicalAttackMultiply = 0.414,
    magicAttackMultiply = 0.414,
    physicalDefenceMultiply = 0.414,
    magicDefenceMultiply = 0.414,
    rebirthGrow = 1.23
    };
getRow(7,3)->
    #pet_rebirthCfg {
    petRebirth = 7,
    petQuality = 3,
    maxHP2 = 47180,
    physicalAttack = 4718,
    magicAttack = 4718,
    physicalDefence = 4718,
    magicDefence = 4718,
    maxHP2Multiply = 0.414,
    physicalAttackMultiply = 0.414,
    magicAttackMultiply = 0.414,
    physicalDefenceMultiply = 0.414,
    magicDefenceMultiply = 0.414,
    rebirthGrow = 1.23
    };
getRow(7,4)->
    #pet_rebirthCfg {
    petRebirth = 7,
    petQuality = 4,
    maxHP2 = 75489,
    physicalAttack = 7548,
    magicAttack = 7548,
    physicalDefence = 7548,
    magicDefence = 7548,
    maxHP2Multiply = 0.414,
    physicalAttackMultiply = 0.414,
    magicAttackMultiply = 0.414,
    physicalDefenceMultiply = 0.414,
    magicDefenceMultiply = 0.414,
    rebirthGrow = 1.23
    };
getRow(7,5)->
    #pet_rebirthCfg {
    petRebirth = 7,
    petQuality = 5,
    maxHP2 = 113234,
    physicalAttack = 11323,
    magicAttack = 11323,
    physicalDefence = 11323,
    magicDefence = 11323,
    maxHP2Multiply = 0.414,
    physicalAttackMultiply = 0.414,
    magicAttackMultiply = 0.414,
    physicalDefenceMultiply = 0.414,
    magicDefenceMultiply = 0.414,
    rebirthGrow = 1.23
    };
getRow(8,0)->
    #pet_rebirthCfg {
    petRebirth = 8,
    petQuality = 0,
    maxHP2 = 12135,
    physicalAttack = 1213,
    magicAttack = 1213,
    physicalDefence = 1213,
    magicDefence = 1213,
    maxHP2Multiply = 0.533,
    physicalAttackMultiply = 0.533,
    magicAttackMultiply = 0.533,
    physicalDefenceMultiply = 0.533,
    magicDefenceMultiply = 0.533,
    rebirthGrow = 1.59
    };
getRow(8,1)->
    #pet_rebirthCfg {
    petRebirth = 8,
    petQuality = 1,
    maxHP2 = 21843,
    physicalAttack = 2184,
    magicAttack = 2184,
    physicalDefence = 2184,
    magicDefence = 2184,
    maxHP2Multiply = 0.533,
    physicalAttackMultiply = 0.533,
    magicAttackMultiply = 0.533,
    physicalDefenceMultiply = 0.533,
    magicDefenceMultiply = 0.533,
    rebirthGrow = 1.59
    };
getRow(8,2)->
    #pet_rebirthCfg {
    petRebirth = 8,
    petQuality = 2,
    maxHP2 = 36405,
    physicalAttack = 3640,
    magicAttack = 3640,
    physicalDefence = 3640,
    magicDefence = 3640,
    maxHP2Multiply = 0.533,
    physicalAttackMultiply = 0.533,
    magicAttackMultiply = 0.533,
    physicalDefenceMultiply = 0.533,
    magicDefenceMultiply = 0.533,
    rebirthGrow = 1.59
    };
getRow(8,3)->
    #pet_rebirthCfg {
    petRebirth = 8,
    petQuality = 3,
    maxHP2 = 60676,
    physicalAttack = 6067,
    magicAttack = 6067,
    physicalDefence = 6067,
    magicDefence = 6067,
    maxHP2Multiply = 0.533,
    physicalAttackMultiply = 0.533,
    magicAttackMultiply = 0.533,
    physicalDefenceMultiply = 0.533,
    magicDefenceMultiply = 0.533,
    rebirthGrow = 1.59
    };
getRow(8,4)->
    #pet_rebirthCfg {
    petRebirth = 8,
    petQuality = 4,
    maxHP2 = 97082,
    physicalAttack = 9708,
    magicAttack = 9708,
    physicalDefence = 9708,
    magicDefence = 9708,
    maxHP2Multiply = 0.533,
    physicalAttackMultiply = 0.533,
    magicAttackMultiply = 0.533,
    physicalDefenceMultiply = 0.533,
    magicDefenceMultiply = 0.533,
    rebirthGrow = 1.59
    };
getRow(8,5)->
    #pet_rebirthCfg {
    petRebirth = 8,
    petQuality = 5,
    maxHP2 = 145623,
    physicalAttack = 14562,
    magicAttack = 14562,
    physicalDefence = 14562,
    magicDefence = 14562,
    maxHP2Multiply = 0.533,
    physicalAttackMultiply = 0.533,
    magicAttackMultiply = 0.533,
    physicalDefenceMultiply = 0.533,
    magicDefenceMultiply = 0.533,
    rebirthGrow = 1.59
    };
getRow(9,0)->
    #pet_rebirthCfg {
    petRebirth = 9,
    petQuality = 0,
    maxHP2 = 15298,
    physicalAttack = 1529,
    magicAttack = 1529,
    physicalDefence = 1529,
    magicDefence = 1529,
    maxHP2Multiply = 0.672,
    physicalAttackMultiply = 0.672,
    magicAttackMultiply = 0.672,
    physicalDefenceMultiply = 0.672,
    magicDefenceMultiply = 0.672,
    rebirthGrow = 2.01
    };
getRow(9,1)->
    #pet_rebirthCfg {
    petRebirth = 9,
    petQuality = 1,
    maxHP2 = 27537,
    physicalAttack = 2753,
    magicAttack = 2753,
    physicalDefence = 2753,
    magicDefence = 2753,
    maxHP2Multiply = 0.672,
    physicalAttackMultiply = 0.672,
    magicAttackMultiply = 0.672,
    physicalDefenceMultiply = 0.672,
    magicDefenceMultiply = 0.672,
    rebirthGrow = 2.01
    };
getRow(9,2)->
    #pet_rebirthCfg {
    petRebirth = 9,
    petQuality = 2,
    maxHP2 = 45895,
    physicalAttack = 4589,
    magicAttack = 4589,
    physicalDefence = 4589,
    magicDefence = 4589,
    maxHP2Multiply = 0.672,
    physicalAttackMultiply = 0.672,
    magicAttackMultiply = 0.672,
    physicalDefenceMultiply = 0.672,
    magicDefenceMultiply = 0.672,
    rebirthGrow = 2.01
    };
getRow(9,3)->
    #pet_rebirthCfg {
    petRebirth = 9,
    petQuality = 3,
    maxHP2 = 76493,
    physicalAttack = 7649,
    magicAttack = 7649,
    physicalDefence = 7649,
    magicDefence = 7649,
    maxHP2Multiply = 0.672,
    physicalAttackMultiply = 0.672,
    magicAttackMultiply = 0.672,
    physicalDefenceMultiply = 0.672,
    magicDefenceMultiply = 0.672,
    rebirthGrow = 2.01
    };
getRow(9,4)->
    #pet_rebirthCfg {
    petRebirth = 9,
    petQuality = 4,
    maxHP2 = 122389,
    physicalAttack = 12238,
    magicAttack = 12238,
    physicalDefence = 12238,
    magicDefence = 12238,
    maxHP2Multiply = 0.672,
    physicalAttackMultiply = 0.672,
    magicAttackMultiply = 0.672,
    physicalDefenceMultiply = 0.672,
    magicDefenceMultiply = 0.672,
    rebirthGrow = 2.01
    };
getRow(9,5)->
    #pet_rebirthCfg {
    petRebirth = 9,
    petQuality = 5,
    maxHP2 = 183583,
    physicalAttack = 18358,
    magicAttack = 18358,
    physicalDefence = 18358,
    magicDefence = 18358,
    maxHP2Multiply = 0.672,
    physicalAttackMultiply = 0.672,
    magicAttackMultiply = 0.672,
    physicalDefenceMultiply = 0.672,
    magicDefenceMultiply = 0.672,
    rebirthGrow = 2.01
    };
getRow(10,0)->
    #pet_rebirthCfg {
    petRebirth = 10,
    petQuality = 0,
    maxHP2 = 18958,
    physicalAttack = 1895,
    magicAttack = 1895,
    physicalDefence = 1895,
    magicDefence = 1895,
    maxHP2Multiply = 0.833,
    physicalAttackMultiply = 0.833,
    magicAttackMultiply = 0.833,
    physicalDefenceMultiply = 0.833,
    magicDefenceMultiply = 0.833,
    rebirthGrow = 2.49
    };
getRow(10,1)->
    #pet_rebirthCfg {
    petRebirth = 10,
    petQuality = 1,
    maxHP2 = 34125,
    physicalAttack = 3412,
    magicAttack = 3412,
    physicalDefence = 3412,
    magicDefence = 3412,
    maxHP2Multiply = 0.833,
    physicalAttackMultiply = 0.833,
    magicAttackMultiply = 0.833,
    physicalDefenceMultiply = 0.833,
    magicDefenceMultiply = 0.833,
    rebirthGrow = 2.49
    };
getRow(10,2)->
    #pet_rebirthCfg {
    petRebirth = 10,
    petQuality = 2,
    maxHP2 = 56875,
    physicalAttack = 5687,
    magicAttack = 5687,
    physicalDefence = 5687,
    magicDefence = 5687,
    maxHP2Multiply = 0.833,
    physicalAttackMultiply = 0.833,
    magicAttackMultiply = 0.833,
    physicalDefenceMultiply = 0.833,
    magicDefenceMultiply = 0.833,
    rebirthGrow = 2.49
    };
getRow(10,3)->
    #pet_rebirthCfg {
    petRebirth = 10,
    petQuality = 3,
    maxHP2 = 94791,
    physicalAttack = 9479,
    magicAttack = 9479,
    physicalDefence = 9479,
    magicDefence = 9479,
    maxHP2Multiply = 0.833,
    physicalAttackMultiply = 0.833,
    magicAttackMultiply = 0.833,
    physicalDefenceMultiply = 0.833,
    magicDefenceMultiply = 0.833,
    rebirthGrow = 2.49
    };
getRow(10,4)->
    #pet_rebirthCfg {
    petRebirth = 10,
    petQuality = 4,
    maxHP2 = 151666,
    physicalAttack = 15166,
    magicAttack = 15166,
    physicalDefence = 15166,
    magicDefence = 15166,
    maxHP2Multiply = 0.833,
    physicalAttackMultiply = 0.833,
    magicAttackMultiply = 0.833,
    physicalDefenceMultiply = 0.833,
    magicDefenceMultiply = 0.833,
    rebirthGrow = 2.49
    };
getRow(10,5)->
    #pet_rebirthCfg {
    petRebirth = 10,
    petQuality = 5,
    maxHP2 = 227500,
    physicalAttack = 22750,
    magicAttack = 22750,
    physicalDefence = 22750,
    magicDefence = 22750,
    maxHP2Multiply = 0.833,
    physicalAttackMultiply = 0.833,
    magicAttackMultiply = 0.833,
    physicalDefenceMultiply = 0.833,
    magicDefenceMultiply = 0.833,
    rebirthGrow = 2.49
    };
getRow(_,_)->[].

getKeyList()->[
    {1,0},
    {1,1},
    {1,2},
    {1,3},
    {1,4},
    {1,5},
    {2,0},
    {2,1},
    {2,2},
    {2,3},
    {2,4},
    {2,5},
    {3,0},
    {3,1},
    {3,2},
    {3,3},
    {3,4},
    {3,5},
    {4,0},
    {4,1},
    {4,2},
    {4,3},
    {4,4},
    {4,5},
    {5,0},
    {5,1},
    {5,2},
    {5,3},
    {5,4},
    {5,5},
    {6,0},
    {6,1},
    {6,2},
    {6,3},
    {6,4},
    {6,5},
    {7,0},
    {7,1},
    {7,2},
    {7,3},
    {7,4},
    {7,5},
    {8,0},
    {8,1},
    {8,2},
    {8,3},
    {8,4},
    {8,5},
    {9,0},
    {9,1},
    {9,2},
    {9,3},
    {9,4},
    {9,5},
    {10,0},
    {10,1},
    {10,2},
    {10,3},
    {10,4},
    {10,5}
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
    4,
    5
    ];
get2KeyList(2)->[
    0,
    1,
    2,
    3,
    4,
    5
    ];
get2KeyList(3)->[
    0,
    1,
    2,
    3,
    4,
    5
    ];
get2KeyList(4)->[
    0,
    1,
    2,
    3,
    4,
    5
    ];
get2KeyList(5)->[
    0,
    1,
    2,
    3,
    4,
    5
    ];
get2KeyList(6)->[
    0,
    1,
    2,
    3,
    4,
    5
    ];
get2KeyList(7)->[
    0,
    1,
    2,
    3,
    4,
    5
    ];
get2KeyList(8)->[
    0,
    1,
    2,
    3,
    4,
    5
    ];
get2KeyList(9)->[
    0,
    1,
    2,
    3,
    4,
    5
    ];
get2KeyList(10)->[
    0,
    1,
    2,
    3,
    4,
    5
    ];
get2KeyList(_)->[].

