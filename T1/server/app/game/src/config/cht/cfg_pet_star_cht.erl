%% coding: latin-1
%%: 实现
-module(cfg_pet_star_cht).
-compile(export_all).
-include("cfg_pet_star.hrl").


getRow(1,0)->
    #pet_starCfg {
    petStar = 1,
    petQuality = 0,
    maxHP2 = 148,
    physicalAttack = 15,
    magicAttack = 15,
    physicalDefence = 15,
    magicDefence = 15
    };
getRow(1,1)->
    #pet_starCfg {
    petStar = 1,
    petQuality = 1,
    maxHP2 = 178,
    physicalAttack = 18,
    magicAttack = 18,
    physicalDefence = 18,
    magicDefence = 18
    };
getRow(1,2)->
    #pet_starCfg {
    petStar = 1,
    petQuality = 2,
    maxHP2 = 223,
    physicalAttack = 22,
    magicAttack = 22,
    physicalDefence = 22,
    magicDefence = 22
    };
getRow(1,3)->
    #pet_starCfg {
    petStar = 1,
    petQuality = 3,
    maxHP2 = 297,
    physicalAttack = 30,
    magicAttack = 30,
    physicalDefence = 30,
    magicDefence = 30
    };
getRow(1,4)->
    #pet_starCfg {
    petStar = 1,
    petQuality = 4,
    maxHP2 = 446,
    physicalAttack = 45,
    magicAttack = 45,
    physicalDefence = 45,
    magicDefence = 45
    };
getRow(2,0)->
    #pet_starCfg {
    petStar = 2,
    petQuality = 0,
    maxHP2 = 297,
    physicalAttack = 29,
    magicAttack = 29,
    physicalDefence = 29,
    magicDefence = 29
    };
getRow(2,1)->
    #pet_starCfg {
    petStar = 2,
    petQuality = 1,
    maxHP2 = 356,
    physicalAttack = 35,
    magicAttack = 35,
    physicalDefence = 35,
    magicDefence = 35
    };
getRow(2,2)->
    #pet_starCfg {
    petStar = 2,
    petQuality = 2,
    maxHP2 = 446,
    physicalAttack = 44,
    magicAttack = 44,
    physicalDefence = 44,
    magicDefence = 44
    };
getRow(2,3)->
    #pet_starCfg {
    petStar = 2,
    petQuality = 3,
    maxHP2 = 594,
    physicalAttack = 59,
    magicAttack = 59,
    physicalDefence = 59,
    magicDefence = 59
    };
getRow(2,4)->
    #pet_starCfg {
    petStar = 2,
    petQuality = 4,
    maxHP2 = 892,
    physicalAttack = 89,
    magicAttack = 89,
    physicalDefence = 89,
    magicDefence = 89
    };
getRow(3,0)->
    #pet_starCfg {
    petStar = 3,
    petQuality = 0,
    maxHP2 = 446,
    physicalAttack = 44,
    magicAttack = 44,
    physicalDefence = 44,
    magicDefence = 44
    };
getRow(3,1)->
    #pet_starCfg {
    petStar = 3,
    petQuality = 1,
    maxHP2 = 535,
    physicalAttack = 53,
    magicAttack = 53,
    physicalDefence = 53,
    magicDefence = 53
    };
getRow(3,2)->
    #pet_starCfg {
    petStar = 3,
    petQuality = 2,
    maxHP2 = 669,
    physicalAttack = 67,
    magicAttack = 67,
    physicalDefence = 67,
    magicDefence = 67
    };
getRow(3,3)->
    #pet_starCfg {
    petStar = 3,
    petQuality = 3,
    maxHP2 = 892,
    physicalAttack = 89,
    magicAttack = 89,
    physicalDefence = 89,
    magicDefence = 89
    };
getRow(3,4)->
    #pet_starCfg {
    petStar = 3,
    petQuality = 4,
    maxHP2 = 1339,
    physicalAttack = 134,
    magicAttack = 134,
    physicalDefence = 134,
    magicDefence = 134
    };
getRow(4,0)->
    #pet_starCfg {
    petStar = 4,
    petQuality = 0,
    maxHP2 = 596,
    physicalAttack = 59,
    magicAttack = 59,
    physicalDefence = 59,
    magicDefence = 59
    };
getRow(4,1)->
    #pet_starCfg {
    petStar = 4,
    petQuality = 1,
    maxHP2 = 716,
    physicalAttack = 71,
    magicAttack = 71,
    physicalDefence = 71,
    magicDefence = 71
    };
getRow(4,2)->
    #pet_starCfg {
    petStar = 4,
    petQuality = 2,
    maxHP2 = 895,
    physicalAttack = 89,
    magicAttack = 89,
    physicalDefence = 89,
    magicDefence = 89
    };
getRow(4,3)->
    #pet_starCfg {
    petStar = 4,
    petQuality = 3,
    maxHP2 = 1193,
    physicalAttack = 119,
    magicAttack = 119,
    physicalDefence = 119,
    magicDefence = 119
    };
getRow(4,4)->
    #pet_starCfg {
    petStar = 4,
    petQuality = 4,
    maxHP2 = 1790,
    physicalAttack = 179,
    magicAttack = 179,
    physicalDefence = 179,
    magicDefence = 179
    };
getRow(5,0)->
    #pet_starCfg {
    petStar = 5,
    petQuality = 0,
    maxHP2 = 748,
    physicalAttack = 74,
    magicAttack = 74,
    physicalDefence = 74,
    magicDefence = 74
    };
getRow(5,1)->
    #pet_starCfg {
    petStar = 5,
    petQuality = 1,
    maxHP2 = 897,
    physicalAttack = 89,
    magicAttack = 89,
    physicalDefence = 89,
    magicDefence = 89
    };
getRow(5,2)->
    #pet_starCfg {
    petStar = 5,
    petQuality = 2,
    maxHP2 = 1122,
    physicalAttack = 112,
    magicAttack = 112,
    physicalDefence = 112,
    magicDefence = 112
    };
getRow(5,3)->
    #pet_starCfg {
    petStar = 5,
    petQuality = 3,
    maxHP2 = 1496,
    physicalAttack = 149,
    magicAttack = 149,
    physicalDefence = 149,
    magicDefence = 149
    };
getRow(5,4)->
    #pet_starCfg {
    petStar = 5,
    petQuality = 4,
    maxHP2 = 2244,
    physicalAttack = 224,
    magicAttack = 224,
    physicalDefence = 224,
    magicDefence = 224
    };
getRow(6,0)->
    #pet_starCfg {
    petStar = 6,
    petQuality = 0,
    maxHP2 = 975,
    physicalAttack = 97,
    magicAttack = 97,
    physicalDefence = 97,
    magicDefence = 97
    };
getRow(6,1)->
    #pet_starCfg {
    petStar = 6,
    petQuality = 1,
    maxHP2 = 1170,
    physicalAttack = 117,
    magicAttack = 117,
    physicalDefence = 117,
    magicDefence = 117
    };
getRow(6,2)->
    #pet_starCfg {
    petStar = 6,
    petQuality = 2,
    maxHP2 = 1463,
    physicalAttack = 146,
    magicAttack = 146,
    physicalDefence = 146,
    magicDefence = 146
    };
getRow(6,3)->
    #pet_starCfg {
    petStar = 6,
    petQuality = 3,
    maxHP2 = 1950,
    physicalAttack = 195,
    magicAttack = 195,
    physicalDefence = 195,
    magicDefence = 195
    };
getRow(6,4)->
    #pet_starCfg {
    petStar = 6,
    petQuality = 4,
    maxHP2 = 2926,
    physicalAttack = 293,
    magicAttack = 293,
    physicalDefence = 293,
    magicDefence = 293
    };
getRow(7,0)->
    #pet_starCfg {
    petStar = 7,
    petQuality = 0,
    maxHP2 = 1130,
    physicalAttack = 113,
    magicAttack = 113,
    physicalDefence = 113,
    magicDefence = 113
    };
getRow(7,1)->
    #pet_starCfg {
    petStar = 7,
    petQuality = 1,
    maxHP2 = 1356,
    physicalAttack = 135,
    magicAttack = 135,
    physicalDefence = 135,
    magicDefence = 135
    };
getRow(7,2)->
    #pet_starCfg {
    petStar = 7,
    petQuality = 2,
    maxHP2 = 1695,
    physicalAttack = 169,
    magicAttack = 169,
    physicalDefence = 169,
    magicDefence = 169
    };
getRow(7,3)->
    #pet_starCfg {
    petStar = 7,
    petQuality = 3,
    maxHP2 = 2260,
    physicalAttack = 226,
    magicAttack = 226,
    physicalDefence = 226,
    magicDefence = 226
    };
getRow(7,4)->
    #pet_starCfg {
    petStar = 7,
    petQuality = 4,
    maxHP2 = 3391,
    physicalAttack = 339,
    magicAttack = 339,
    physicalDefence = 339,
    magicDefence = 339
    };
getRow(8,0)->
    #pet_starCfg {
    petStar = 8,
    petQuality = 0,
    maxHP2 = 1287,
    physicalAttack = 128,
    magicAttack = 128,
    physicalDefence = 128,
    magicDefence = 128
    };
getRow(8,1)->
    #pet_starCfg {
    petStar = 8,
    petQuality = 1,
    maxHP2 = 1545,
    physicalAttack = 154,
    magicAttack = 154,
    physicalDefence = 154,
    magicDefence = 154
    };
getRow(8,2)->
    #pet_starCfg {
    petStar = 8,
    petQuality = 2,
    maxHP2 = 1931,
    physicalAttack = 193,
    magicAttack = 193,
    physicalDefence = 193,
    magicDefence = 193
    };
getRow(8,3)->
    #pet_starCfg {
    petStar = 8,
    petQuality = 3,
    maxHP2 = 2575,
    physicalAttack = 257,
    magicAttack = 257,
    physicalDefence = 257,
    magicDefence = 257
    };
getRow(8,4)->
    #pet_starCfg {
    petStar = 8,
    petQuality = 4,
    maxHP2 = 3863,
    physicalAttack = 386,
    magicAttack = 386,
    physicalDefence = 386,
    magicDefence = 386
    };
getRow(9,0)->
    #pet_starCfg {
    petStar = 9,
    petQuality = 0,
    maxHP2 = 1448,
    physicalAttack = 144,
    magicAttack = 144,
    physicalDefence = 144,
    magicDefence = 144
    };
getRow(9,1)->
    #pet_starCfg {
    petStar = 9,
    petQuality = 1,
    maxHP2 = 1737,
    physicalAttack = 173,
    magicAttack = 173,
    physicalDefence = 173,
    magicDefence = 173
    };
getRow(9,2)->
    #pet_starCfg {
    petStar = 9,
    petQuality = 2,
    maxHP2 = 2172,
    physicalAttack = 217,
    magicAttack = 217,
    physicalDefence = 217,
    magicDefence = 217
    };
getRow(9,3)->
    #pet_starCfg {
    petStar = 9,
    petQuality = 3,
    maxHP2 = 2896,
    physicalAttack = 289,
    magicAttack = 289,
    physicalDefence = 289,
    magicDefence = 289
    };
getRow(9,4)->
    #pet_starCfg {
    petStar = 9,
    petQuality = 4,
    maxHP2 = 4344,
    physicalAttack = 434,
    magicAttack = 434,
    physicalDefence = 434,
    magicDefence = 434
    };
getRow(10,0)->
    #pet_starCfg {
    petStar = 10,
    petQuality = 0,
    maxHP2 = 1611,
    physicalAttack = 161,
    magicAttack = 161,
    physicalDefence = 161,
    magicDefence = 161
    };
getRow(10,1)->
    #pet_starCfg {
    petStar = 10,
    petQuality = 1,
    maxHP2 = 1933,
    physicalAttack = 193,
    magicAttack = 193,
    physicalDefence = 193,
    magicDefence = 193
    };
getRow(10,2)->
    #pet_starCfg {
    petStar = 10,
    petQuality = 2,
    maxHP2 = 2417,
    physicalAttack = 241,
    magicAttack = 241,
    physicalDefence = 241,
    magicDefence = 241
    };
getRow(10,3)->
    #pet_starCfg {
    petStar = 10,
    petQuality = 3,
    maxHP2 = 3222,
    physicalAttack = 322,
    magicAttack = 322,
    physicalDefence = 322,
    magicDefence = 322
    };
getRow(10,4)->
    #pet_starCfg {
    petStar = 10,
    petQuality = 4,
    maxHP2 = 4834,
    physicalAttack = 483,
    magicAttack = 483,
    physicalDefence = 483,
    magicDefence = 483
    };
getRow(11,0)->
    #pet_starCfg {
    petStar = 11,
    petQuality = 0,
    maxHP2 = 1843,
    physicalAttack = 184,
    magicAttack = 184,
    physicalDefence = 184,
    magicDefence = 184
    };
getRow(11,1)->
    #pet_starCfg {
    petStar = 11,
    petQuality = 1,
    maxHP2 = 2212,
    physicalAttack = 221,
    magicAttack = 221,
    physicalDefence = 221,
    magicDefence = 221
    };
getRow(11,2)->
    #pet_starCfg {
    petStar = 11,
    petQuality = 2,
    maxHP2 = 2765,
    physicalAttack = 276,
    magicAttack = 276,
    physicalDefence = 276,
    magicDefence = 276
    };
getRow(11,3)->
    #pet_starCfg {
    petStar = 11,
    petQuality = 3,
    maxHP2 = 3686,
    physicalAttack = 368,
    magicAttack = 368,
    physicalDefence = 368,
    magicDefence = 368
    };
getRow(11,4)->
    #pet_starCfg {
    petStar = 11,
    petQuality = 4,
    maxHP2 = 5530,
    physicalAttack = 553,
    magicAttack = 553,
    physicalDefence = 553,
    magicDefence = 553
    };
getRow(12,0)->
    #pet_starCfg {
    petStar = 12,
    petQuality = 0,
    maxHP2 = 2014,
    physicalAttack = 201,
    magicAttack = 201,
    physicalDefence = 201,
    magicDefence = 201
    };
getRow(12,1)->
    #pet_starCfg {
    petStar = 12,
    petQuality = 1,
    maxHP2 = 2416,
    physicalAttack = 241,
    magicAttack = 241,
    physicalDefence = 241,
    magicDefence = 241
    };
getRow(12,2)->
    #pet_starCfg {
    petStar = 12,
    petQuality = 2,
    maxHP2 = 3021,
    physicalAttack = 302,
    magicAttack = 302,
    physicalDefence = 302,
    magicDefence = 302
    };
getRow(12,3)->
    #pet_starCfg {
    petStar = 12,
    petQuality = 3,
    maxHP2 = 4028,
    physicalAttack = 402,
    magicAttack = 402,
    physicalDefence = 402,
    magicDefence = 402
    };
getRow(12,4)->
    #pet_starCfg {
    petStar = 12,
    petQuality = 4,
    maxHP2 = 6042,
    physicalAttack = 604,
    magicAttack = 604,
    physicalDefence = 604,
    magicDefence = 604
    };
getRow(13,0)->
    #pet_starCfg {
    petStar = 13,
    petQuality = 0,
    maxHP2 = 2188,
    physicalAttack = 219,
    magicAttack = 219,
    physicalDefence = 219,
    magicDefence = 219
    };
getRow(13,1)->
    #pet_starCfg {
    petStar = 13,
    petQuality = 1,
    maxHP2 = 2626,
    physicalAttack = 262,
    magicAttack = 262,
    physicalDefence = 262,
    magicDefence = 262
    };
getRow(13,2)->
    #pet_starCfg {
    petStar = 13,
    petQuality = 2,
    maxHP2 = 3283,
    physicalAttack = 328,
    magicAttack = 328,
    physicalDefence = 328,
    magicDefence = 328
    };
getRow(13,3)->
    #pet_starCfg {
    petStar = 13,
    petQuality = 3,
    maxHP2 = 4377,
    physicalAttack = 438,
    magicAttack = 438,
    physicalDefence = 438,
    magicDefence = 438
    };
getRow(13,4)->
    #pet_starCfg {
    petStar = 13,
    petQuality = 4,
    maxHP2 = 6566,
    physicalAttack = 657,
    magicAttack = 657,
    physicalDefence = 657,
    magicDefence = 657
    };
getRow(14,0)->
    #pet_starCfg {
    petStar = 14,
    petQuality = 0,
    maxHP2 = 2367,
    physicalAttack = 236,
    magicAttack = 236,
    physicalDefence = 236,
    magicDefence = 236
    };
getRow(14,1)->
    #pet_starCfg {
    petStar = 14,
    petQuality = 1,
    maxHP2 = 2841,
    physicalAttack = 284,
    magicAttack = 284,
    physicalDefence = 284,
    magicDefence = 284
    };
getRow(14,2)->
    #pet_starCfg {
    petStar = 14,
    petQuality = 2,
    maxHP2 = 3551,
    physicalAttack = 355,
    magicAttack = 355,
    physicalDefence = 355,
    magicDefence = 355
    };
getRow(14,3)->
    #pet_starCfg {
    petStar = 14,
    petQuality = 3,
    maxHP2 = 4735,
    physicalAttack = 473,
    magicAttack = 473,
    physicalDefence = 473,
    magicDefence = 473
    };
getRow(14,4)->
    #pet_starCfg {
    petStar = 14,
    petQuality = 4,
    maxHP2 = 7103,
    physicalAttack = 710,
    magicAttack = 710,
    physicalDefence = 710,
    magicDefence = 710
    };
getRow(15,0)->
    #pet_starCfg {
    petStar = 15,
    petQuality = 0,
    maxHP2 = 2551,
    physicalAttack = 255,
    magicAttack = 255,
    physicalDefence = 255,
    magicDefence = 255
    };
getRow(15,1)->
    #pet_starCfg {
    petStar = 15,
    petQuality = 1,
    maxHP2 = 3062,
    physicalAttack = 306,
    magicAttack = 306,
    physicalDefence = 306,
    magicDefence = 306
    };
getRow(15,2)->
    #pet_starCfg {
    petStar = 15,
    petQuality = 2,
    maxHP2 = 3827,
    physicalAttack = 383,
    magicAttack = 383,
    physicalDefence = 383,
    magicDefence = 383
    };
getRow(15,3)->
    #pet_starCfg {
    petStar = 15,
    petQuality = 3,
    maxHP2 = 5103,
    physicalAttack = 510,
    magicAttack = 510,
    physicalDefence = 510,
    magicDefence = 510
    };
getRow(15,4)->
    #pet_starCfg {
    petStar = 15,
    petQuality = 4,
    maxHP2 = 7655,
    physicalAttack = 766,
    magicAttack = 766,
    physicalDefence = 766,
    magicDefence = 766
    };
getRow(16,0)->
    #pet_starCfg {
    petStar = 16,
    petQuality = 0,
    maxHP2 = 2836,
    physicalAttack = 283,
    magicAttack = 283,
    physicalDefence = 283,
    magicDefence = 283
    };
getRow(16,1)->
    #pet_starCfg {
    petStar = 16,
    petQuality = 1,
    maxHP2 = 3403,
    physicalAttack = 340,
    magicAttack = 340,
    physicalDefence = 340,
    magicDefence = 340
    };
getRow(16,2)->
    #pet_starCfg {
    petStar = 16,
    petQuality = 2,
    maxHP2 = 4254,
    physicalAttack = 425,
    magicAttack = 425,
    physicalDefence = 425,
    magicDefence = 425
    };
getRow(16,3)->
    #pet_starCfg {
    petStar = 16,
    petQuality = 3,
    maxHP2 = 5672,
    physicalAttack = 567,
    magicAttack = 567,
    physicalDefence = 567,
    magicDefence = 567
    };
getRow(16,4)->
    #pet_starCfg {
    petStar = 16,
    petQuality = 4,
    maxHP2 = 8508,
    physicalAttack = 851,
    magicAttack = 851,
    physicalDefence = 851,
    magicDefence = 851
    };
getRow(17,0)->
    #pet_starCfg {
    petStar = 17,
    petQuality = 0,
    maxHP2 = 3030,
    physicalAttack = 303,
    magicAttack = 303,
    physicalDefence = 303,
    magicDefence = 303
    };
getRow(17,1)->
    #pet_starCfg {
    petStar = 17,
    petQuality = 1,
    maxHP2 = 3636,
    physicalAttack = 363,
    magicAttack = 363,
    physicalDefence = 363,
    magicDefence = 363
    };
getRow(17,2)->
    #pet_starCfg {
    petStar = 17,
    petQuality = 2,
    maxHP2 = 4545,
    physicalAttack = 454,
    magicAttack = 454,
    physicalDefence = 454,
    magicDefence = 454
    };
getRow(17,3)->
    #pet_starCfg {
    petStar = 17,
    petQuality = 3,
    maxHP2 = 6060,
    physicalAttack = 606,
    magicAttack = 606,
    physicalDefence = 606,
    magicDefence = 606
    };
getRow(17,4)->
    #pet_starCfg {
    petStar = 17,
    petQuality = 4,
    maxHP2 = 9091,
    physicalAttack = 909,
    magicAttack = 909,
    physicalDefence = 909,
    magicDefence = 909
    };
getRow(18,0)->
    #pet_starCfg {
    petStar = 18,
    petQuality = 0,
    maxHP2 = 3230,
    physicalAttack = 323,
    magicAttack = 323,
    physicalDefence = 323,
    magicDefence = 323
    };
getRow(18,1)->
    #pet_starCfg {
    petStar = 18,
    petQuality = 1,
    maxHP2 = 3876,
    physicalAttack = 387,
    magicAttack = 387,
    physicalDefence = 387,
    magicDefence = 387
    };
getRow(18,2)->
    #pet_starCfg {
    petStar = 18,
    petQuality = 2,
    maxHP2 = 4846,
    physicalAttack = 484,
    magicAttack = 484,
    physicalDefence = 484,
    magicDefence = 484
    };
getRow(18,3)->
    #pet_starCfg {
    petStar = 18,
    petQuality = 3,
    maxHP2 = 6461,
    physicalAttack = 646,
    magicAttack = 646,
    physicalDefence = 646,
    magicDefence = 646
    };
getRow(18,4)->
    #pet_starCfg {
    petStar = 18,
    petQuality = 4,
    maxHP2 = 9692,
    physicalAttack = 969,
    magicAttack = 969,
    physicalDefence = 969,
    magicDefence = 969
    };
getRow(19,0)->
    #pet_starCfg {
    petStar = 19,
    petQuality = 0,
    maxHP2 = 3437,
    physicalAttack = 343,
    magicAttack = 343,
    physicalDefence = 343,
    magicDefence = 343
    };
getRow(19,1)->
    #pet_starCfg {
    petStar = 19,
    petQuality = 1,
    maxHP2 = 4124,
    physicalAttack = 412,
    magicAttack = 412,
    physicalDefence = 412,
    magicDefence = 412
    };
getRow(19,2)->
    #pet_starCfg {
    petStar = 19,
    petQuality = 2,
    maxHP2 = 5156,
    physicalAttack = 515,
    magicAttack = 515,
    physicalDefence = 515,
    magicDefence = 515
    };
getRow(19,3)->
    #pet_starCfg {
    petStar = 19,
    petQuality = 3,
    maxHP2 = 6874,
    physicalAttack = 687,
    magicAttack = 687,
    physicalDefence = 687,
    magicDefence = 687
    };
getRow(19,4)->
    #pet_starCfg {
    petStar = 19,
    petQuality = 4,
    maxHP2 = 10312,
    physicalAttack = 1031,
    magicAttack = 1031,
    physicalDefence = 1031,
    magicDefence = 1031
    };
getRow(20,0)->
    #pet_starCfg {
    petStar = 20,
    petQuality = 0,
    maxHP2 = 3650,
    physicalAttack = 365,
    magicAttack = 365,
    physicalDefence = 365,
    magicDefence = 365
    };
getRow(20,1)->
    #pet_starCfg {
    petStar = 20,
    petQuality = 1,
    maxHP2 = 4380,
    physicalAttack = 438,
    magicAttack = 438,
    physicalDefence = 438,
    magicDefence = 438
    };
getRow(20,2)->
    #pet_starCfg {
    petStar = 20,
    petQuality = 2,
    maxHP2 = 5475,
    physicalAttack = 547,
    magicAttack = 547,
    physicalDefence = 547,
    magicDefence = 547
    };
getRow(20,3)->
    #pet_starCfg {
    petStar = 20,
    petQuality = 3,
    maxHP2 = 7300,
    physicalAttack = 730,
    magicAttack = 730,
    physicalDefence = 730,
    magicDefence = 730
    };
getRow(20,4)->
    #pet_starCfg {
    petStar = 20,
    petQuality = 4,
    maxHP2 = 10951,
    physicalAttack = 1095,
    magicAttack = 1095,
    physicalDefence = 1095,
    magicDefence = 1095
    };
getRow(21,0)->
    #pet_starCfg {
    petStar = 21,
    petQuality = 0,
    maxHP2 = 3994,
    physicalAttack = 399,
    magicAttack = 399,
    physicalDefence = 399,
    magicDefence = 399
    };
getRow(21,1)->
    #pet_starCfg {
    petStar = 21,
    petQuality = 1,
    maxHP2 = 4793,
    physicalAttack = 479,
    magicAttack = 479,
    physicalDefence = 479,
    magicDefence = 479
    };
getRow(21,2)->
    #pet_starCfg {
    petStar = 21,
    petQuality = 2,
    maxHP2 = 5992,
    physicalAttack = 599,
    magicAttack = 599,
    physicalDefence = 599,
    magicDefence = 599
    };
getRow(21,3)->
    #pet_starCfg {
    petStar = 21,
    petQuality = 3,
    maxHP2 = 7989,
    physicalAttack = 798,
    magicAttack = 798,
    physicalDefence = 798,
    magicDefence = 798
    };
getRow(21,4)->
    #pet_starCfg {
    petStar = 21,
    petQuality = 4,
    maxHP2 = 11984,
    physicalAttack = 1198,
    magicAttack = 1198,
    physicalDefence = 1198,
    magicDefence = 1198
    };
getRow(22,0)->
    #pet_starCfg {
    petStar = 22,
    petQuality = 0,
    maxHP2 = 4221,
    physicalAttack = 422,
    magicAttack = 422,
    physicalDefence = 422,
    magicDefence = 422
    };
getRow(22,1)->
    #pet_starCfg {
    petStar = 22,
    petQuality = 1,
    maxHP2 = 5066,
    physicalAttack = 506,
    magicAttack = 506,
    physicalDefence = 506,
    magicDefence = 506
    };
getRow(22,2)->
    #pet_starCfg {
    petStar = 22,
    petQuality = 2,
    maxHP2 = 6332,
    physicalAttack = 633,
    magicAttack = 633,
    physicalDefence = 633,
    magicDefence = 633
    };
getRow(22,3)->
    #pet_starCfg {
    petStar = 22,
    petQuality = 3,
    maxHP2 = 8443,
    physicalAttack = 844,
    magicAttack = 844,
    physicalDefence = 844,
    magicDefence = 844
    };
getRow(22,4)->
    #pet_starCfg {
    petStar = 22,
    petQuality = 4,
    maxHP2 = 12665,
    physicalAttack = 1266,
    magicAttack = 1266,
    physicalDefence = 1266,
    magicDefence = 1266
    };
getRow(23,0)->
    #pet_starCfg {
    petStar = 23,
    petQuality = 0,
    maxHP2 = 4455,
    physicalAttack = 445,
    magicAttack = 445,
    physicalDefence = 445,
    magicDefence = 445
    };
getRow(23,1)->
    #pet_starCfg {
    petStar = 23,
    petQuality = 1,
    maxHP2 = 5346,
    physicalAttack = 534,
    magicAttack = 534,
    physicalDefence = 534,
    magicDefence = 534
    };
getRow(23,2)->
    #pet_starCfg {
    petStar = 23,
    petQuality = 2,
    maxHP2 = 6683,
    physicalAttack = 668,
    magicAttack = 668,
    physicalDefence = 668,
    magicDefence = 668
    };
getRow(23,3)->
    #pet_starCfg {
    petStar = 23,
    petQuality = 3,
    maxHP2 = 8911,
    physicalAttack = 891,
    magicAttack = 891,
    physicalDefence = 891,
    magicDefence = 891
    };
getRow(23,4)->
    #pet_starCfg {
    petStar = 23,
    petQuality = 4,
    maxHP2 = 13367,
    physicalAttack = 1337,
    magicAttack = 1337,
    physicalDefence = 1337,
    magicDefence = 1337
    };
getRow(24,0)->
    #pet_starCfg {
    petStar = 24,
    petQuality = 0,
    maxHP2 = 4697,
    physicalAttack = 469,
    magicAttack = 469,
    physicalDefence = 469,
    magicDefence = 469
    };
getRow(24,1)->
    #pet_starCfg {
    petStar = 24,
    petQuality = 1,
    maxHP2 = 5637,
    physicalAttack = 563,
    magicAttack = 563,
    physicalDefence = 563,
    magicDefence = 563
    };
getRow(24,2)->
    #pet_starCfg {
    petStar = 24,
    petQuality = 2,
    maxHP2 = 7046,
    physicalAttack = 704,
    magicAttack = 704,
    physicalDefence = 704,
    magicDefence = 704
    };
getRow(24,3)->
    #pet_starCfg {
    petStar = 24,
    petQuality = 3,
    maxHP2 = 9395,
    physicalAttack = 939,
    magicAttack = 939,
    physicalDefence = 939,
    magicDefence = 939
    };
getRow(24,4)->
    #pet_starCfg {
    petStar = 24,
    petQuality = 4,
    maxHP2 = 14093,
    physicalAttack = 1409,
    magicAttack = 1409,
    physicalDefence = 1409,
    magicDefence = 1409
    };
getRow(25,0)->
    #pet_starCfg {
    petStar = 25,
    petQuality = 0,
    maxHP2 = 4947,
    physicalAttack = 494,
    magicAttack = 494,
    physicalDefence = 494,
    magicDefence = 494
    };
getRow(25,1)->
    #pet_starCfg {
    petStar = 25,
    petQuality = 1,
    maxHP2 = 5937,
    physicalAttack = 593,
    magicAttack = 593,
    physicalDefence = 593,
    magicDefence = 593
    };
getRow(25,2)->
    #pet_starCfg {
    petStar = 25,
    petQuality = 2,
    maxHP2 = 7421,
    physicalAttack = 742,
    magicAttack = 742,
    physicalDefence = 742,
    magicDefence = 742
    };
getRow(25,3)->
    #pet_starCfg {
    petStar = 25,
    petQuality = 3,
    maxHP2 = 9895,
    physicalAttack = 989,
    magicAttack = 989,
    physicalDefence = 989,
    magicDefence = 989
    };
getRow(25,4)->
    #pet_starCfg {
    petStar = 25,
    petQuality = 4,
    maxHP2 = 14843,
    physicalAttack = 1484,
    magicAttack = 1484,
    physicalDefence = 1484,
    magicDefence = 1484
    };
getRow(26,0)->
    #pet_starCfg {
    petStar = 26,
    petQuality = 0,
    maxHP2 = 5360,
    physicalAttack = 536,
    magicAttack = 536,
    physicalDefence = 536,
    magicDefence = 536
    };
getRow(26,1)->
    #pet_starCfg {
    petStar = 26,
    petQuality = 1,
    maxHP2 = 6432,
    physicalAttack = 643,
    magicAttack = 643,
    physicalDefence = 643,
    magicDefence = 643
    };
getRow(26,2)->
    #pet_starCfg {
    petStar = 26,
    petQuality = 2,
    maxHP2 = 8040,
    physicalAttack = 804,
    magicAttack = 804,
    physicalDefence = 804,
    magicDefence = 804
    };
getRow(26,3)->
    #pet_starCfg {
    petStar = 26,
    petQuality = 3,
    maxHP2 = 10720,
    physicalAttack = 1072,
    magicAttack = 1072,
    physicalDefence = 1072,
    magicDefence = 1072
    };
getRow(26,4)->
    #pet_starCfg {
    petStar = 26,
    petQuality = 4,
    maxHP2 = 16081,
    physicalAttack = 1608,
    magicAttack = 1608,
    physicalDefence = 1608,
    magicDefence = 1608
    };
getRow(27,0)->
    #pet_starCfg {
    petStar = 27,
    petQuality = 0,
    maxHP2 = 5627,
    physicalAttack = 562,
    magicAttack = 562,
    physicalDefence = 562,
    magicDefence = 562
    };
getRow(27,1)->
    #pet_starCfg {
    petStar = 27,
    petQuality = 1,
    maxHP2 = 6752,
    physicalAttack = 675,
    magicAttack = 675,
    physicalDefence = 675,
    magicDefence = 675
    };
getRow(27,2)->
    #pet_starCfg {
    petStar = 27,
    petQuality = 2,
    maxHP2 = 8441,
    physicalAttack = 844,
    magicAttack = 844,
    physicalDefence = 844,
    magicDefence = 844
    };
getRow(27,3)->
    #pet_starCfg {
    petStar = 27,
    petQuality = 3,
    maxHP2 = 11254,
    physicalAttack = 1125,
    magicAttack = 1125,
    physicalDefence = 1125,
    magicDefence = 1125
    };
getRow(27,4)->
    #pet_starCfg {
    petStar = 27,
    petQuality = 4,
    maxHP2 = 16882,
    physicalAttack = 1688,
    magicAttack = 1688,
    physicalDefence = 1688,
    magicDefence = 1688
    };
getRow(28,0)->
    #pet_starCfg {
    petStar = 28,
    petQuality = 0,
    maxHP2 = 5903,
    physicalAttack = 590,
    magicAttack = 590,
    physicalDefence = 590,
    magicDefence = 590
    };
getRow(28,1)->
    #pet_starCfg {
    petStar = 28,
    petQuality = 1,
    maxHP2 = 7084,
    physicalAttack = 708,
    magicAttack = 708,
    physicalDefence = 708,
    magicDefence = 708
    };
getRow(28,2)->
    #pet_starCfg {
    petStar = 28,
    petQuality = 2,
    maxHP2 = 8855,
    physicalAttack = 885,
    magicAttack = 885,
    physicalDefence = 885,
    magicDefence = 885
    };
getRow(28,3)->
    #pet_starCfg {
    petStar = 28,
    petQuality = 3,
    maxHP2 = 11806,
    physicalAttack = 1180,
    magicAttack = 1180,
    physicalDefence = 1180,
    magicDefence = 1180
    };
getRow(28,4)->
    #pet_starCfg {
    petStar = 28,
    petQuality = 4,
    maxHP2 = 17710,
    physicalAttack = 1771,
    magicAttack = 1771,
    physicalDefence = 1771,
    magicDefence = 1771
    };
getRow(29,0)->
    #pet_starCfg {
    petStar = 29,
    petQuality = 0,
    maxHP2 = 6188,
    physicalAttack = 619,
    magicAttack = 619,
    physicalDefence = 619,
    magicDefence = 619
    };
getRow(29,1)->
    #pet_starCfg {
    petStar = 29,
    petQuality = 1,
    maxHP2 = 7426,
    physicalAttack = 742,
    magicAttack = 742,
    physicalDefence = 742,
    magicDefence = 742
    };
getRow(29,2)->
    #pet_starCfg {
    petStar = 29,
    petQuality = 2,
    maxHP2 = 9282,
    physicalAttack = 928,
    magicAttack = 928,
    physicalDefence = 928,
    magicDefence = 928
    };
getRow(29,3)->
    #pet_starCfg {
    petStar = 29,
    petQuality = 3,
    maxHP2 = 12376,
    physicalAttack = 1238,
    magicAttack = 1238,
    physicalDefence = 1238,
    magicDefence = 1238
    };
getRow(29,4)->
    #pet_starCfg {
    petStar = 29,
    petQuality = 4,
    maxHP2 = 18565,
    physicalAttack = 1857,
    magicAttack = 1857,
    physicalDefence = 1857,
    magicDefence = 1857
    };
getRow(30,0)->
    #pet_starCfg {
    petStar = 30,
    petQuality = 0,
    maxHP2 = 6483,
    physicalAttack = 648,
    magicAttack = 648,
    physicalDefence = 648,
    magicDefence = 648
    };
getRow(30,1)->
    #pet_starCfg {
    petStar = 30,
    petQuality = 1,
    maxHP2 = 7780,
    physicalAttack = 778,
    magicAttack = 778,
    physicalDefence = 778,
    magicDefence = 778
    };
getRow(30,2)->
    #pet_starCfg {
    petStar = 30,
    petQuality = 2,
    maxHP2 = 9725,
    physicalAttack = 972,
    magicAttack = 972,
    physicalDefence = 972,
    magicDefence = 972
    };
getRow(30,3)->
    #pet_starCfg {
    petStar = 30,
    petQuality = 3,
    maxHP2 = 12966,
    physicalAttack = 1296,
    magicAttack = 1296,
    physicalDefence = 1296,
    magicDefence = 1296
    };
getRow(30,4)->
    #pet_starCfg {
    petStar = 30,
    petQuality = 4,
    maxHP2 = 19450,
    physicalAttack = 1945,
    magicAttack = 1945,
    physicalDefence = 1945,
    magicDefence = 1945
    };
getRow(31,0)->
    #pet_starCfg {
    petStar = 31,
    petQuality = 0,
    maxHP2 = 6972,
    physicalAttack = 697,
    magicAttack = 697,
    physicalDefence = 697,
    magicDefence = 697
    };
getRow(31,1)->
    #pet_starCfg {
    petStar = 31,
    petQuality = 1,
    maxHP2 = 8366,
    physicalAttack = 836,
    magicAttack = 836,
    physicalDefence = 836,
    magicDefence = 836
    };
getRow(31,2)->
    #pet_starCfg {
    petStar = 31,
    petQuality = 2,
    maxHP2 = 10458,
    physicalAttack = 1046,
    magicAttack = 1046,
    physicalDefence = 1046,
    magicDefence = 1046
    };
getRow(31,3)->
    #pet_starCfg {
    petStar = 31,
    petQuality = 3,
    maxHP2 = 13944,
    physicalAttack = 1394,
    magicAttack = 1394,
    physicalDefence = 1394,
    magicDefence = 1394
    };
getRow(31,4)->
    #pet_starCfg {
    petStar = 31,
    petQuality = 4,
    maxHP2 = 20917,
    physicalAttack = 2092,
    magicAttack = 2092,
    physicalDefence = 2092,
    magicDefence = 2092
    };
getRow(32,0)->
    #pet_starCfg {
    petStar = 32,
    petQuality = 0,
    maxHP2 = 7287,
    physicalAttack = 728,
    magicAttack = 728,
    physicalDefence = 728,
    magicDefence = 728
    };
getRow(32,1)->
    #pet_starCfg {
    petStar = 32,
    petQuality = 1,
    maxHP2 = 8744,
    physicalAttack = 874,
    magicAttack = 874,
    physicalDefence = 874,
    magicDefence = 874
    };
getRow(32,2)->
    #pet_starCfg {
    petStar = 32,
    petQuality = 2,
    maxHP2 = 10930,
    physicalAttack = 1093,
    magicAttack = 1093,
    physicalDefence = 1093,
    magicDefence = 1093
    };
getRow(32,3)->
    #pet_starCfg {
    petStar = 32,
    petQuality = 3,
    maxHP2 = 14574,
    physicalAttack = 1457,
    magicAttack = 1457,
    physicalDefence = 1457,
    magicDefence = 1457
    };
getRow(32,4)->
    #pet_starCfg {
    petStar = 32,
    petQuality = 4,
    maxHP2 = 21861,
    physicalAttack = 2186,
    magicAttack = 2186,
    physicalDefence = 2186,
    magicDefence = 2186
    };
getRow(33,0)->
    #pet_starCfg {
    petStar = 33,
    petQuality = 0,
    maxHP2 = 7612,
    physicalAttack = 761,
    magicAttack = 761,
    physicalDefence = 761,
    magicDefence = 761
    };
getRow(33,1)->
    #pet_starCfg {
    petStar = 33,
    petQuality = 1,
    maxHP2 = 9134,
    physicalAttack = 913,
    magicAttack = 913,
    physicalDefence = 913,
    magicDefence = 913
    };
getRow(33,2)->
    #pet_starCfg {
    petStar = 33,
    petQuality = 2,
    maxHP2 = 11418,
    physicalAttack = 1142,
    magicAttack = 1142,
    physicalDefence = 1142,
    magicDefence = 1142
    };
getRow(33,3)->
    #pet_starCfg {
    petStar = 33,
    petQuality = 3,
    maxHP2 = 15224,
    physicalAttack = 1522,
    magicAttack = 1522,
    physicalDefence = 1522,
    magicDefence = 1522
    };
getRow(33,4)->
    #pet_starCfg {
    petStar = 33,
    petQuality = 4,
    maxHP2 = 22837,
    physicalAttack = 2284,
    magicAttack = 2284,
    physicalDefence = 2284,
    magicDefence = 2284
    };
getRow(34,0)->
    #pet_starCfg {
    petStar = 34,
    petQuality = 0,
    maxHP2 = 7948,
    physicalAttack = 795,
    magicAttack = 795,
    physicalDefence = 795,
    magicDefence = 795
    };
getRow(34,1)->
    #pet_starCfg {
    petStar = 34,
    petQuality = 1,
    maxHP2 = 9538,
    physicalAttack = 954,
    magicAttack = 954,
    physicalDefence = 954,
    magicDefence = 954
    };
getRow(34,2)->
    #pet_starCfg {
    petStar = 34,
    petQuality = 2,
    maxHP2 = 11923,
    physicalAttack = 1192,
    magicAttack = 1192,
    physicalDefence = 1192,
    magicDefence = 1192
    };
getRow(34,3)->
    #pet_starCfg {
    petStar = 34,
    petQuality = 3,
    maxHP2 = 15897,
    physicalAttack = 1590,
    magicAttack = 1590,
    physicalDefence = 1590,
    magicDefence = 1590
    };
getRow(34,4)->
    #pet_starCfg {
    petStar = 34,
    petQuality = 4,
    maxHP2 = 23846,
    physicalAttack = 2385,
    magicAttack = 2385,
    physicalDefence = 2385,
    magicDefence = 2385
    };
getRow(35,0)->
    #pet_starCfg {
    petStar = 35,
    petQuality = 0,
    maxHP2 = 8296,
    physicalAttack = 829,
    magicAttack = 829,
    physicalDefence = 829,
    magicDefence = 829
    };
getRow(35,1)->
    #pet_starCfg {
    petStar = 35,
    petQuality = 1,
    maxHP2 = 9955,
    physicalAttack = 995,
    magicAttack = 995,
    physicalDefence = 995,
    magicDefence = 995
    };
getRow(35,2)->
    #pet_starCfg {
    petStar = 35,
    petQuality = 2,
    maxHP2 = 12444,
    physicalAttack = 1244,
    magicAttack = 1244,
    physicalDefence = 1244,
    magicDefence = 1244
    };
getRow(35,3)->
    #pet_starCfg {
    petStar = 35,
    petQuality = 3,
    maxHP2 = 16592,
    physicalAttack = 1659,
    magicAttack = 1659,
    physicalDefence = 1659,
    magicDefence = 1659
    };
getRow(35,4)->
    #pet_starCfg {
    petStar = 35,
    petQuality = 4,
    maxHP2 = 24888,
    physicalAttack = 2489,
    magicAttack = 2489,
    physicalDefence = 2489,
    magicDefence = 2489
    };
getRow(36,0)->
    #pet_starCfg {
    petStar = 36,
    petQuality = 0,
    maxHP2 = 8868,
    physicalAttack = 887,
    magicAttack = 887,
    physicalDefence = 887,
    magicDefence = 887
    };
getRow(36,1)->
    #pet_starCfg {
    petStar = 36,
    petQuality = 1,
    maxHP2 = 10642,
    physicalAttack = 1064,
    magicAttack = 1064,
    physicalDefence = 1064,
    magicDefence = 1064
    };
getRow(36,2)->
    #pet_starCfg {
    petStar = 36,
    petQuality = 2,
    maxHP2 = 13303,
    physicalAttack = 1330,
    magicAttack = 1330,
    physicalDefence = 1330,
    magicDefence = 1330
    };
getRow(36,3)->
    #pet_starCfg {
    petStar = 36,
    petQuality = 3,
    maxHP2 = 17737,
    physicalAttack = 1774,
    magicAttack = 1774,
    physicalDefence = 1774,
    magicDefence = 1774
    };
getRow(36,4)->
    #pet_starCfg {
    petStar = 36,
    petQuality = 4,
    maxHP2 = 26606,
    physicalAttack = 2661,
    magicAttack = 2661,
    physicalDefence = 2661,
    magicDefence = 2661
    };
getRow(37,0)->
    #pet_starCfg {
    petStar = 37,
    petQuality = 0,
    maxHP2 = 9239,
    physicalAttack = 924,
    magicAttack = 924,
    physicalDefence = 924,
    magicDefence = 924
    };
getRow(37,1)->
    #pet_starCfg {
    petStar = 37,
    petQuality = 1,
    maxHP2 = 11087,
    physicalAttack = 1108,
    magicAttack = 1108,
    physicalDefence = 1108,
    magicDefence = 1108
    };
getRow(37,2)->
    #pet_starCfg {
    petStar = 37,
    petQuality = 2,
    maxHP2 = 13859,
    physicalAttack = 1386,
    magicAttack = 1386,
    physicalDefence = 1386,
    magicDefence = 1386
    };
getRow(37,3)->
    #pet_starCfg {
    petStar = 37,
    petQuality = 3,
    maxHP2 = 18478,
    physicalAttack = 1848,
    magicAttack = 1848,
    physicalDefence = 1848,
    magicDefence = 1848
    };
getRow(37,4)->
    #pet_starCfg {
    petStar = 37,
    petQuality = 4,
    maxHP2 = 27718,
    physicalAttack = 2772,
    magicAttack = 2772,
    physicalDefence = 2772,
    magicDefence = 2772
    };
getRow(38,0)->
    #pet_starCfg {
    petStar = 38,
    petQuality = 0,
    maxHP2 = 9621,
    physicalAttack = 962,
    magicAttack = 962,
    physicalDefence = 962,
    magicDefence = 962
    };
getRow(38,1)->
    #pet_starCfg {
    petStar = 38,
    petQuality = 1,
    maxHP2 = 11546,
    physicalAttack = 1154,
    magicAttack = 1154,
    physicalDefence = 1154,
    magicDefence = 1154
    };
getRow(38,2)->
    #pet_starCfg {
    petStar = 38,
    petQuality = 2,
    maxHP2 = 14432,
    physicalAttack = 1443,
    magicAttack = 1443,
    physicalDefence = 1443,
    magicDefence = 1443
    };
getRow(38,3)->
    #pet_starCfg {
    petStar = 38,
    petQuality = 3,
    maxHP2 = 19243,
    physicalAttack = 1924,
    magicAttack = 1924,
    physicalDefence = 1924,
    magicDefence = 1924
    };
getRow(38,4)->
    #pet_starCfg {
    petStar = 38,
    petQuality = 4,
    maxHP2 = 28865,
    physicalAttack = 2887,
    magicAttack = 2887,
    physicalDefence = 2887,
    magicDefence = 2887
    };
getRow(39,0)->
    #pet_starCfg {
    petStar = 39,
    petQuality = 0,
    maxHP2 = 10016,
    physicalAttack = 1001,
    magicAttack = 1001,
    physicalDefence = 1001,
    magicDefence = 1001
    };
getRow(39,1)->
    #pet_starCfg {
    petStar = 39,
    petQuality = 1,
    maxHP2 = 12020,
    physicalAttack = 1202,
    magicAttack = 1202,
    physicalDefence = 1202,
    magicDefence = 1202
    };
getRow(39,2)->
    #pet_starCfg {
    petStar = 39,
    petQuality = 2,
    maxHP2 = 15025,
    physicalAttack = 1502,
    magicAttack = 1502,
    physicalDefence = 1502,
    magicDefence = 1502
    };
getRow(39,3)->
    #pet_starCfg {
    petStar = 39,
    petQuality = 3,
    maxHP2 = 20033,
    physicalAttack = 2003,
    magicAttack = 2003,
    physicalDefence = 2003,
    magicDefence = 2003
    };
getRow(39,4)->
    #pet_starCfg {
    petStar = 39,
    petQuality = 4,
    maxHP2 = 30050,
    physicalAttack = 3005,
    magicAttack = 3005,
    physicalDefence = 3005,
    magicDefence = 3005
    };
getRow(40,0)->
    #pet_starCfg {
    petStar = 40,
    petQuality = 0,
    maxHP2 = 10424,
    physicalAttack = 1042,
    magicAttack = 1042,
    physicalDefence = 1042,
    magicDefence = 1042
    };
getRow(40,1)->
    #pet_starCfg {
    petStar = 40,
    petQuality = 1,
    maxHP2 = 12508,
    physicalAttack = 1250,
    magicAttack = 1250,
    physicalDefence = 1250,
    magicDefence = 1250
    };
getRow(40,2)->
    #pet_starCfg {
    petStar = 40,
    petQuality = 2,
    maxHP2 = 15636,
    physicalAttack = 1563,
    magicAttack = 1563,
    physicalDefence = 1563,
    magicDefence = 1563
    };
getRow(40,3)->
    #pet_starCfg {
    petStar = 40,
    petQuality = 3,
    maxHP2 = 20848,
    physicalAttack = 2084,
    magicAttack = 2084,
    physicalDefence = 2084,
    magicDefence = 2084
    };
getRow(40,4)->
    #pet_starCfg {
    petStar = 40,
    petQuality = 4,
    maxHP2 = 31272,
    physicalAttack = 3127,
    magicAttack = 3127,
    physicalDefence = 3127,
    magicDefence = 3127
    };
getRow(41,0)->
    #pet_starCfg {
    petStar = 41,
    petQuality = 0,
    maxHP2 = 11088,
    physicalAttack = 1108,
    magicAttack = 1108,
    physicalDefence = 1108,
    magicDefence = 1108
    };
getRow(41,1)->
    #pet_starCfg {
    petStar = 41,
    petQuality = 1,
    maxHP2 = 13305,
    physicalAttack = 1330,
    magicAttack = 1330,
    physicalDefence = 1330,
    magicDefence = 1330
    };
getRow(41,2)->
    #pet_starCfg {
    petStar = 41,
    petQuality = 2,
    maxHP2 = 16632,
    physicalAttack = 1663,
    magicAttack = 1663,
    physicalDefence = 1663,
    magicDefence = 1663
    };
getRow(41,3)->
    #pet_starCfg {
    petStar = 41,
    petQuality = 3,
    maxHP2 = 22176,
    physicalAttack = 2217,
    magicAttack = 2217,
    physicalDefence = 2217,
    magicDefence = 2217
    };
getRow(41,4)->
    #pet_starCfg {
    petStar = 41,
    petQuality = 4,
    maxHP2 = 33264,
    physicalAttack = 3326,
    magicAttack = 3326,
    physicalDefence = 3326,
    magicDefence = 3326
    };
getRow(42,0)->
    #pet_starCfg {
    petStar = 42,
    petQuality = 0,
    maxHP2 = 11521,
    physicalAttack = 1152,
    magicAttack = 1152,
    physicalDefence = 1152,
    magicDefence = 1152
    };
getRow(42,1)->
    #pet_starCfg {
    petStar = 42,
    petQuality = 1,
    maxHP2 = 13826,
    physicalAttack = 1382,
    magicAttack = 1382,
    physicalDefence = 1382,
    magicDefence = 1382
    };
getRow(42,2)->
    #pet_starCfg {
    petStar = 42,
    petQuality = 2,
    maxHP2 = 17282,
    physicalAttack = 1728,
    magicAttack = 1728,
    physicalDefence = 1728,
    magicDefence = 1728
    };
getRow(42,3)->
    #pet_starCfg {
    petStar = 42,
    petQuality = 3,
    maxHP2 = 23043,
    physicalAttack = 2304,
    magicAttack = 2304,
    physicalDefence = 2304,
    magicDefence = 2304
    };
getRow(42,4)->
    #pet_starCfg {
    petStar = 42,
    petQuality = 4,
    maxHP2 = 34565,
    physicalAttack = 3457,
    magicAttack = 3457,
    physicalDefence = 3457,
    magicDefence = 3457
    };
getRow(43,0)->
    #pet_starCfg {
    petStar = 43,
    petQuality = 0,
    maxHP2 = 11968,
    physicalAttack = 1197,
    magicAttack = 1197,
    physicalDefence = 1197,
    magicDefence = 1197
    };
getRow(43,1)->
    #pet_starCfg {
    petStar = 43,
    petQuality = 1,
    maxHP2 = 14362,
    physicalAttack = 1436,
    magicAttack = 1436,
    physicalDefence = 1436,
    magicDefence = 1436
    };
getRow(43,2)->
    #pet_starCfg {
    petStar = 43,
    petQuality = 2,
    maxHP2 = 17953,
    physicalAttack = 1795,
    magicAttack = 1795,
    physicalDefence = 1795,
    magicDefence = 1795
    };
getRow(43,3)->
    #pet_starCfg {
    petStar = 43,
    petQuality = 3,
    maxHP2 = 23937,
    physicalAttack = 2394,
    magicAttack = 2394,
    physicalDefence = 2394,
    magicDefence = 2394
    };
getRow(43,4)->
    #pet_starCfg {
    petStar = 43,
    petQuality = 4,
    maxHP2 = 35906,
    physicalAttack = 3591,
    magicAttack = 3591,
    physicalDefence = 3591,
    magicDefence = 3591
    };
getRow(44,0)->
    #pet_starCfg {
    petStar = 44,
    petQuality = 0,
    maxHP2 = 12429,
    physicalAttack = 1243,
    magicAttack = 1243,
    physicalDefence = 1243,
    magicDefence = 1243
    };
getRow(44,1)->
    #pet_starCfg {
    petStar = 44,
    petQuality = 1,
    maxHP2 = 14915,
    physicalAttack = 1491,
    magicAttack = 1491,
    physicalDefence = 1491,
    magicDefence = 1491
    };
getRow(44,2)->
    #pet_starCfg {
    petStar = 44,
    petQuality = 2,
    maxHP2 = 18644,
    physicalAttack = 1864,
    magicAttack = 1864,
    physicalDefence = 1864,
    magicDefence = 1864
    };
getRow(44,3)->
    #pet_starCfg {
    petStar = 44,
    petQuality = 3,
    maxHP2 = 24859,
    physicalAttack = 2486,
    magicAttack = 2486,
    physicalDefence = 2486,
    magicDefence = 2486
    };
getRow(44,4)->
    #pet_starCfg {
    petStar = 44,
    petQuality = 4,
    maxHP2 = 37289,
    physicalAttack = 3729,
    magicAttack = 3729,
    physicalDefence = 3729,
    magicDefence = 3729
    };
getRow(45,0)->
    #pet_starCfg {
    petStar = 45,
    petQuality = 0,
    maxHP2 = 12904,
    physicalAttack = 1290,
    magicAttack = 1290,
    physicalDefence = 1290,
    magicDefence = 1290
    };
getRow(45,1)->
    #pet_starCfg {
    petStar = 45,
    petQuality = 1,
    maxHP2 = 15485,
    physicalAttack = 1548,
    magicAttack = 1548,
    physicalDefence = 1548,
    magicDefence = 1548
    };
getRow(45,2)->
    #pet_starCfg {
    petStar = 45,
    petQuality = 2,
    maxHP2 = 19357,
    physicalAttack = 1935,
    magicAttack = 1935,
    physicalDefence = 1935,
    magicDefence = 1935
    };
getRow(45,3)->
    #pet_starCfg {
    petStar = 45,
    petQuality = 3,
    maxHP2 = 25809,
    physicalAttack = 2580,
    magicAttack = 2580,
    physicalDefence = 2580,
    magicDefence = 2580
    };
getRow(45,4)->
    #pet_starCfg {
    petStar = 45,
    petQuality = 4,
    maxHP2 = 38714,
    physicalAttack = 3871,
    magicAttack = 3871,
    physicalDefence = 3871,
    magicDefence = 3871
    };
getRow(46,0)->
    #pet_starCfg {
    petStar = 46,
    petQuality = 0,
    maxHP2 = 13667,
    physicalAttack = 1366,
    magicAttack = 1366,
    physicalDefence = 1366,
    magicDefence = 1366
    };
getRow(46,1)->
    #pet_starCfg {
    petStar = 46,
    petQuality = 1,
    maxHP2 = 16401,
    physicalAttack = 1640,
    magicAttack = 1640,
    physicalDefence = 1640,
    magicDefence = 1640
    };
getRow(46,2)->
    #pet_starCfg {
    petStar = 46,
    petQuality = 2,
    maxHP2 = 20501,
    physicalAttack = 2050,
    magicAttack = 2050,
    physicalDefence = 2050,
    magicDefence = 2050
    };
getRow(46,3)->
    #pet_starCfg {
    petStar = 46,
    petQuality = 3,
    maxHP2 = 27335,
    physicalAttack = 2733,
    magicAttack = 2733,
    physicalDefence = 2733,
    magicDefence = 2733
    };
getRow(46,4)->
    #pet_starCfg {
    petStar = 46,
    petQuality = 4,
    maxHP2 = 41003,
    physicalAttack = 4100,
    magicAttack = 4100,
    physicalDefence = 4100,
    magicDefence = 4100
    };
getRow(47,0)->
    #pet_starCfg {
    petStar = 47,
    petQuality = 0,
    maxHP2 = 14171,
    physicalAttack = 1417,
    magicAttack = 1417,
    physicalDefence = 1417,
    magicDefence = 1417
    };
getRow(47,1)->
    #pet_starCfg {
    petStar = 47,
    petQuality = 1,
    maxHP2 = 17006,
    physicalAttack = 1700,
    magicAttack = 1700,
    physicalDefence = 1700,
    magicDefence = 1700
    };
getRow(47,2)->
    #pet_starCfg {
    petStar = 47,
    petQuality = 2,
    maxHP2 = 21257,
    physicalAttack = 2126,
    magicAttack = 2126,
    physicalDefence = 2126,
    magicDefence = 2126
    };
getRow(47,3)->
    #pet_starCfg {
    petStar = 47,
    petQuality = 3,
    maxHP2 = 28343,
    physicalAttack = 2834,
    magicAttack = 2834,
    physicalDefence = 2834,
    magicDefence = 2834
    };
getRow(47,4)->
    #pet_starCfg {
    petStar = 47,
    petQuality = 4,
    maxHP2 = 42515,
    physicalAttack = 4252,
    magicAttack = 4252,
    physicalDefence = 4252,
    magicDefence = 4252
    };
getRow(48,0)->
    #pet_starCfg {
    petStar = 48,
    petQuality = 0,
    maxHP2 = 14691,
    physicalAttack = 1469,
    magicAttack = 1469,
    physicalDefence = 1469,
    magicDefence = 1469
    };
getRow(48,1)->
    #pet_starCfg {
    petStar = 48,
    petQuality = 1,
    maxHP2 = 17629,
    physicalAttack = 1762,
    magicAttack = 1762,
    physicalDefence = 1762,
    magicDefence = 1762
    };
getRow(48,2)->
    #pet_starCfg {
    petStar = 48,
    petQuality = 2,
    maxHP2 = 22036,
    physicalAttack = 2203,
    magicAttack = 2203,
    physicalDefence = 2203,
    magicDefence = 2203
    };
getRow(48,3)->
    #pet_starCfg {
    petStar = 48,
    petQuality = 3,
    maxHP2 = 29382,
    physicalAttack = 2938,
    magicAttack = 2938,
    physicalDefence = 2938,
    magicDefence = 2938
    };
getRow(48,4)->
    #pet_starCfg {
    petStar = 48,
    petQuality = 4,
    maxHP2 = 44073,
    physicalAttack = 4407,
    magicAttack = 4407,
    physicalDefence = 4407,
    magicDefence = 4407
    };
getRow(49,0)->
    #pet_starCfg {
    petStar = 49,
    petQuality = 0,
    maxHP2 = 15225,
    physicalAttack = 1522,
    magicAttack = 1522,
    physicalDefence = 1522,
    magicDefence = 1522
    };
getRow(49,1)->
    #pet_starCfg {
    petStar = 49,
    petQuality = 1,
    maxHP2 = 18270,
    physicalAttack = 1827,
    magicAttack = 1827,
    physicalDefence = 1827,
    magicDefence = 1827
    };
getRow(49,2)->
    #pet_starCfg {
    petStar = 49,
    petQuality = 2,
    maxHP2 = 22838,
    physicalAttack = 2284,
    magicAttack = 2284,
    physicalDefence = 2284,
    magicDefence = 2284
    };
getRow(49,3)->
    #pet_starCfg {
    petStar = 49,
    petQuality = 3,
    maxHP2 = 30450,
    physicalAttack = 3045,
    magicAttack = 3045,
    physicalDefence = 3045,
    magicDefence = 3045
    };
getRow(49,4)->
    #pet_starCfg {
    petStar = 49,
    petQuality = 4,
    maxHP2 = 45676,
    physicalAttack = 4568,
    magicAttack = 4568,
    physicalDefence = 4568,
    magicDefence = 4568
    };
getRow(50,0)->
    #pet_starCfg {
    petStar = 50,
    petQuality = 0,
    maxHP2 = 15775,
    physicalAttack = 1577,
    magicAttack = 1577,
    physicalDefence = 1577,
    magicDefence = 1577
    };
getRow(50,1)->
    #pet_starCfg {
    petStar = 50,
    petQuality = 1,
    maxHP2 = 18930,
    physicalAttack = 1893,
    magicAttack = 1893,
    physicalDefence = 1893,
    magicDefence = 1893
    };
getRow(50,2)->
    #pet_starCfg {
    petStar = 50,
    petQuality = 2,
    maxHP2 = 23663,
    physicalAttack = 2366,
    magicAttack = 2366,
    physicalDefence = 2366,
    magicDefence = 2366
    };
getRow(50,3)->
    #pet_starCfg {
    petStar = 50,
    petQuality = 3,
    maxHP2 = 31550,
    physicalAttack = 3155,
    magicAttack = 3155,
    physicalDefence = 3155,
    magicDefence = 3155
    };
getRow(50,4)->
    #pet_starCfg {
    petStar = 50,
    petQuality = 4,
    maxHP2 = 47326,
    physicalAttack = 4733,
    magicAttack = 4733,
    physicalDefence = 4733,
    magicDefence = 4733
    };
getRow(51,0)->
    #pet_starCfg {
    petStar = 51,
    petQuality = 0,
    maxHP2 = 16644,
    physicalAttack = 1664,
    magicAttack = 1664,
    physicalDefence = 1664,
    magicDefence = 1664
    };
getRow(51,1)->
    #pet_starCfg {
    petStar = 51,
    petQuality = 1,
    maxHP2 = 19973,
    physicalAttack = 1997,
    magicAttack = 1997,
    physicalDefence = 1997,
    magicDefence = 1997
    };
getRow(51,2)->
    #pet_starCfg {
    petStar = 51,
    petQuality = 2,
    maxHP2 = 24966,
    physicalAttack = 2496,
    magicAttack = 2496,
    physicalDefence = 2496,
    magicDefence = 2496
    };
getRow(51,3)->
    #pet_starCfg {
    petStar = 51,
    petQuality = 3,
    maxHP2 = 33288,
    physicalAttack = 3328,
    magicAttack = 3328,
    physicalDefence = 3328,
    magicDefence = 3328
    };
getRow(51,4)->
    #pet_starCfg {
    petStar = 51,
    petQuality = 4,
    maxHP2 = 49933,
    physicalAttack = 4993,
    magicAttack = 4993,
    physicalDefence = 4993,
    magicDefence = 4993
    };
getRow(52,0)->
    #pet_starCfg {
    petStar = 52,
    petQuality = 0,
    maxHP2 = 17226,
    physicalAttack = 1722,
    magicAttack = 1722,
    physicalDefence = 1722,
    magicDefence = 1722
    };
getRow(52,1)->
    #pet_starCfg {
    petStar = 52,
    petQuality = 1,
    maxHP2 = 20671,
    physicalAttack = 2067,
    magicAttack = 2067,
    physicalDefence = 2067,
    magicDefence = 2067
    };
getRow(52,2)->
    #pet_starCfg {
    petStar = 52,
    petQuality = 2,
    maxHP2 = 25839,
    physicalAttack = 2584,
    magicAttack = 2584,
    physicalDefence = 2584,
    magicDefence = 2584
    };
getRow(52,3)->
    #pet_starCfg {
    petStar = 52,
    petQuality = 3,
    maxHP2 = 34452,
    physicalAttack = 3445,
    magicAttack = 3445,
    physicalDefence = 3445,
    magicDefence = 3445
    };
getRow(52,4)->
    #pet_starCfg {
    petStar = 52,
    petQuality = 4,
    maxHP2 = 51679,
    physicalAttack = 5168,
    magicAttack = 5168,
    physicalDefence = 5168,
    magicDefence = 5168
    };
getRow(53,0)->
    #pet_starCfg {
    petStar = 53,
    petQuality = 0,
    maxHP2 = 17824,
    physicalAttack = 1782,
    magicAttack = 1782,
    physicalDefence = 1782,
    magicDefence = 1782
    };
getRow(53,1)->
    #pet_starCfg {
    petStar = 53,
    petQuality = 1,
    maxHP2 = 21389,
    physicalAttack = 2138,
    magicAttack = 2138,
    physicalDefence = 2138,
    magicDefence = 2138
    };
getRow(53,2)->
    #pet_starCfg {
    petStar = 53,
    petQuality = 2,
    maxHP2 = 26737,
    physicalAttack = 2673,
    magicAttack = 2673,
    physicalDefence = 2673,
    magicDefence = 2673
    };
getRow(53,3)->
    #pet_starCfg {
    petStar = 53,
    petQuality = 3,
    maxHP2 = 35649,
    physicalAttack = 3564,
    magicAttack = 3564,
    physicalDefence = 3564,
    magicDefence = 3564
    };
getRow(53,4)->
    #pet_starCfg {
    petStar = 53,
    petQuality = 4,
    maxHP2 = 53474,
    physicalAttack = 5347,
    magicAttack = 5347,
    physicalDefence = 5347,
    magicDefence = 5347
    };
getRow(54,0)->
    #pet_starCfg {
    petStar = 54,
    petQuality = 0,
    maxHP2 = 18440,
    physicalAttack = 1844,
    magicAttack = 1844,
    physicalDefence = 1844,
    magicDefence = 1844
    };
getRow(54,1)->
    #pet_starCfg {
    petStar = 54,
    petQuality = 1,
    maxHP2 = 22128,
    physicalAttack = 2212,
    magicAttack = 2212,
    physicalDefence = 2212,
    magicDefence = 2212
    };
getRow(54,2)->
    #pet_starCfg {
    petStar = 54,
    petQuality = 2,
    maxHP2 = 27660,
    physicalAttack = 2766,
    magicAttack = 2766,
    physicalDefence = 2766,
    magicDefence = 2766
    };
getRow(54,3)->
    #pet_starCfg {
    petStar = 54,
    petQuality = 3,
    maxHP2 = 36880,
    physicalAttack = 3688,
    magicAttack = 3688,
    physicalDefence = 3688,
    magicDefence = 3688
    };
getRow(54,4)->
    #pet_starCfg {
    petStar = 54,
    petQuality = 4,
    maxHP2 = 55320,
    physicalAttack = 5532,
    magicAttack = 5532,
    physicalDefence = 5532,
    magicDefence = 5532
    };
getRow(55,0)->
    #pet_starCfg {
    petStar = 55,
    petQuality = 0,
    maxHP2 = 19072,
    physicalAttack = 1907,
    magicAttack = 1907,
    physicalDefence = 1907,
    magicDefence = 1907
    };
getRow(55,1)->
    #pet_starCfg {
    petStar = 55,
    petQuality = 1,
    maxHP2 = 22886,
    physicalAttack = 2288,
    magicAttack = 2288,
    physicalDefence = 2288,
    magicDefence = 2288
    };
getRow(55,2)->
    #pet_starCfg {
    petStar = 55,
    petQuality = 2,
    maxHP2 = 28608,
    physicalAttack = 2861,
    magicAttack = 2861,
    physicalDefence = 2861,
    magicDefence = 2861
    };
getRow(55,3)->
    #pet_starCfg {
    petStar = 55,
    petQuality = 3,
    maxHP2 = 38144,
    physicalAttack = 3814,
    magicAttack = 3814,
    physicalDefence = 3814,
    magicDefence = 3814
    };
getRow(55,4)->
    #pet_starCfg {
    petStar = 55,
    petQuality = 4,
    maxHP2 = 57217,
    physicalAttack = 5722,
    magicAttack = 5722,
    physicalDefence = 5722,
    magicDefence = 5722
    };
getRow(56,0)->
    #pet_starCfg {
    petStar = 56,
    petQuality = 0,
    maxHP2 = 20054,
    physicalAttack = 2005,
    magicAttack = 2005,
    physicalDefence = 2005,
    magicDefence = 2005
    };
getRow(56,1)->
    #pet_starCfg {
    petStar = 56,
    petQuality = 1,
    maxHP2 = 24065,
    physicalAttack = 2406,
    magicAttack = 2406,
    physicalDefence = 2406,
    magicDefence = 2406
    };
getRow(56,2)->
    #pet_starCfg {
    petStar = 56,
    petQuality = 2,
    maxHP2 = 30082,
    physicalAttack = 3008,
    magicAttack = 3008,
    physicalDefence = 3008,
    magicDefence = 3008
    };
getRow(56,3)->
    #pet_starCfg {
    petStar = 56,
    petQuality = 3,
    maxHP2 = 40109,
    physicalAttack = 4010,
    magicAttack = 4010,
    physicalDefence = 4010,
    magicDefence = 4010
    };
getRow(56,4)->
    #pet_starCfg {
    petStar = 56,
    petQuality = 4,
    maxHP2 = 60164,
    physicalAttack = 6016,
    magicAttack = 6016,
    physicalDefence = 6016,
    magicDefence = 6016
    };
getRow(57,0)->
    #pet_starCfg {
    petStar = 57,
    petQuality = 0,
    maxHP2 = 20721,
    physicalAttack = 2072,
    magicAttack = 2072,
    physicalDefence = 2072,
    magicDefence = 2072
    };
getRow(57,1)->
    #pet_starCfg {
    petStar = 57,
    petQuality = 1,
    maxHP2 = 24866,
    physicalAttack = 2486,
    magicAttack = 2486,
    physicalDefence = 2486,
    magicDefence = 2486
    };
getRow(57,2)->
    #pet_starCfg {
    petStar = 57,
    petQuality = 2,
    maxHP2 = 31082,
    physicalAttack = 3108,
    magicAttack = 3108,
    physicalDefence = 3108,
    magicDefence = 3108
    };
getRow(57,3)->
    #pet_starCfg {
    petStar = 57,
    petQuality = 3,
    maxHP2 = 41443,
    physicalAttack = 4144,
    magicAttack = 4144,
    physicalDefence = 4144,
    magicDefence = 4144
    };
getRow(57,4)->
    #pet_starCfg {
    petStar = 57,
    petQuality = 4,
    maxHP2 = 62165,
    physicalAttack = 6217,
    magicAttack = 6217,
    physicalDefence = 6217,
    magicDefence = 6217
    };
getRow(58,0)->
    #pet_starCfg {
    petStar = 58,
    petQuality = 0,
    maxHP2 = 21407,
    physicalAttack = 2140,
    magicAttack = 2140,
    physicalDefence = 2140,
    magicDefence = 2140
    };
getRow(58,1)->
    #pet_starCfg {
    petStar = 58,
    petQuality = 1,
    maxHP2 = 25688,
    physicalAttack = 2568,
    magicAttack = 2568,
    physicalDefence = 2568,
    magicDefence = 2568
    };
getRow(58,2)->
    #pet_starCfg {
    petStar = 58,
    petQuality = 2,
    maxHP2 = 32110,
    physicalAttack = 3211,
    magicAttack = 3211,
    physicalDefence = 3211,
    magicDefence = 3211
    };
getRow(58,3)->
    #pet_starCfg {
    petStar = 58,
    petQuality = 3,
    maxHP2 = 42814,
    physicalAttack = 4281,
    magicAttack = 4281,
    physicalDefence = 4281,
    magicDefence = 4281
    };
getRow(58,4)->
    #pet_starCfg {
    petStar = 58,
    petQuality = 4,
    maxHP2 = 64221,
    physicalAttack = 6422,
    magicAttack = 6422,
    physicalDefence = 6422,
    magicDefence = 6422
    };
getRow(59,0)->
    #pet_starCfg {
    petStar = 59,
    petQuality = 0,
    maxHP2 = 22110,
    physicalAttack = 2211,
    magicAttack = 2211,
    physicalDefence = 2211,
    magicDefence = 2211
    };
getRow(59,1)->
    #pet_starCfg {
    petStar = 59,
    petQuality = 1,
    maxHP2 = 26532,
    physicalAttack = 2653,
    magicAttack = 2653,
    physicalDefence = 2653,
    magicDefence = 2653
    };
getRow(59,2)->
    #pet_starCfg {
    petStar = 59,
    petQuality = 2,
    maxHP2 = 33165,
    physicalAttack = 3316,
    magicAttack = 3316,
    physicalDefence = 3316,
    magicDefence = 3316
    };
getRow(59,3)->
    #pet_starCfg {
    petStar = 59,
    petQuality = 3,
    maxHP2 = 44220,
    physicalAttack = 4422,
    magicAttack = 4422,
    physicalDefence = 4422,
    magicDefence = 4422
    };
getRow(59,4)->
    #pet_starCfg {
    petStar = 59,
    petQuality = 4,
    maxHP2 = 66330,
    physicalAttack = 6633,
    magicAttack = 6633,
    physicalDefence = 6633,
    magicDefence = 6633
    };
getRow(60,0)->
    #pet_starCfg {
    petStar = 60,
    petQuality = 0,
    maxHP2 = 22831,
    physicalAttack = 2283,
    magicAttack = 2283,
    physicalDefence = 2283,
    magicDefence = 2283
    };
getRow(60,1)->
    #pet_starCfg {
    petStar = 60,
    petQuality = 1,
    maxHP2 = 27398,
    physicalAttack = 2740,
    magicAttack = 2740,
    physicalDefence = 2740,
    magicDefence = 2740
    };
getRow(60,2)->
    #pet_starCfg {
    petStar = 60,
    petQuality = 2,
    maxHP2 = 34247,
    physicalAttack = 3425,
    magicAttack = 3425,
    physicalDefence = 3425,
    magicDefence = 3425
    };
getRow(60,3)->
    #pet_starCfg {
    petStar = 60,
    petQuality = 3,
    maxHP2 = 45663,
    physicalAttack = 4566,
    magicAttack = 4566,
    physicalDefence = 4566,
    magicDefence = 4566
    };
getRow(60,4)->
    #pet_starCfg {
    petStar = 60,
    petQuality = 4,
    maxHP2 = 68495,
    physicalAttack = 6850,
    magicAttack = 6850,
    physicalDefence = 6850,
    magicDefence = 6850
    };
getRow(61,0)->
    #pet_starCfg {
    petStar = 61,
    petQuality = 0,
    maxHP2 = 23935,
    physicalAttack = 2393,
    magicAttack = 2393,
    physicalDefence = 2393,
    magicDefence = 2393
    };
getRow(61,1)->
    #pet_starCfg {
    petStar = 61,
    petQuality = 1,
    maxHP2 = 28722,
    physicalAttack = 2872,
    magicAttack = 2872,
    physicalDefence = 2872,
    magicDefence = 2872
    };
getRow(61,2)->
    #pet_starCfg {
    petStar = 61,
    petQuality = 2,
    maxHP2 = 35902,
    physicalAttack = 3590,
    magicAttack = 3590,
    physicalDefence = 3590,
    magicDefence = 3590
    };
getRow(61,3)->
    #pet_starCfg {
    petStar = 61,
    petQuality = 3,
    maxHP2 = 47870,
    physicalAttack = 4786,
    magicAttack = 4786,
    physicalDefence = 4786,
    magicDefence = 4786
    };
getRow(61,4)->
    #pet_starCfg {
    petStar = 61,
    petQuality = 4,
    maxHP2 = 71805,
    physicalAttack = 7180,
    magicAttack = 7180,
    physicalDefence = 7180,
    magicDefence = 7180
    };
getRow(62,0)->
    #pet_starCfg {
    petStar = 62,
    petQuality = 0,
    maxHP2 = 24694,
    physicalAttack = 2469,
    magicAttack = 2469,
    physicalDefence = 2469,
    magicDefence = 2469
    };
getRow(62,1)->
    #pet_starCfg {
    petStar = 62,
    petQuality = 1,
    maxHP2 = 29633,
    physicalAttack = 2963,
    magicAttack = 2963,
    physicalDefence = 2963,
    magicDefence = 2963
    };
getRow(62,2)->
    #pet_starCfg {
    petStar = 62,
    petQuality = 2,
    maxHP2 = 37041,
    physicalAttack = 3704,
    magicAttack = 3704,
    physicalDefence = 3704,
    magicDefence = 3704
    };
getRow(62,3)->
    #pet_starCfg {
    petStar = 62,
    petQuality = 3,
    maxHP2 = 49388,
    physicalAttack = 4938,
    magicAttack = 4938,
    physicalDefence = 4938,
    magicDefence = 4938
    };
getRow(62,4)->
    #pet_starCfg {
    petStar = 62,
    petQuality = 4,
    maxHP2 = 74083,
    physicalAttack = 7408,
    magicAttack = 7408,
    physicalDefence = 7408,
    magicDefence = 7408
    };
getRow(63,0)->
    #pet_starCfg {
    petStar = 63,
    petQuality = 0,
    maxHP2 = 25473,
    physicalAttack = 2547,
    magicAttack = 2547,
    physicalDefence = 2547,
    magicDefence = 2547
    };
getRow(63,1)->
    #pet_starCfg {
    petStar = 63,
    petQuality = 1,
    maxHP2 = 30568,
    physicalAttack = 3056,
    magicAttack = 3056,
    physicalDefence = 3056,
    magicDefence = 3056
    };
getRow(63,2)->
    #pet_starCfg {
    petStar = 63,
    petQuality = 2,
    maxHP2 = 38210,
    physicalAttack = 3821,
    magicAttack = 3821,
    physicalDefence = 3821,
    magicDefence = 3821
    };
getRow(63,3)->
    #pet_starCfg {
    petStar = 63,
    petQuality = 3,
    maxHP2 = 50946,
    physicalAttack = 5094,
    magicAttack = 5094,
    physicalDefence = 5094,
    magicDefence = 5094
    };
getRow(63,4)->
    #pet_starCfg {
    petStar = 63,
    petQuality = 4,
    maxHP2 = 76420,
    physicalAttack = 7642,
    magicAttack = 7642,
    physicalDefence = 7642,
    magicDefence = 7642
    };
getRow(64,0)->
    #pet_starCfg {
    petStar = 64,
    petQuality = 0,
    maxHP2 = 26271,
    physicalAttack = 2627,
    magicAttack = 2627,
    physicalDefence = 2627,
    magicDefence = 2627
    };
getRow(64,1)->
    #pet_starCfg {
    petStar = 64,
    petQuality = 1,
    maxHP2 = 31526,
    physicalAttack = 3152,
    magicAttack = 3152,
    physicalDefence = 3152,
    magicDefence = 3152
    };
getRow(64,2)->
    #pet_starCfg {
    petStar = 64,
    petQuality = 2,
    maxHP2 = 39407,
    physicalAttack = 3941,
    magicAttack = 3941,
    physicalDefence = 3941,
    magicDefence = 3941
    };
getRow(64,3)->
    #pet_starCfg {
    petStar = 64,
    petQuality = 3,
    maxHP2 = 52543,
    physicalAttack = 5254,
    magicAttack = 5254,
    physicalDefence = 5254,
    magicDefence = 5254
    };
getRow(64,4)->
    #pet_starCfg {
    petStar = 64,
    petQuality = 4,
    maxHP2 = 78815,
    physicalAttack = 7882,
    magicAttack = 7882,
    physicalDefence = 7882,
    magicDefence = 7882
    };
getRow(65,0)->
    #pet_starCfg {
    petStar = 65,
    petQuality = 0,
    maxHP2 = 27090,
    physicalAttack = 2709,
    magicAttack = 2709,
    physicalDefence = 2709,
    magicDefence = 2709
    };
getRow(65,1)->
    #pet_starCfg {
    petStar = 65,
    petQuality = 1,
    maxHP2 = 32508,
    physicalAttack = 3250,
    magicAttack = 3250,
    physicalDefence = 3250,
    magicDefence = 3250
    };
getRow(65,2)->
    #pet_starCfg {
    petStar = 65,
    petQuality = 2,
    maxHP2 = 40635,
    physicalAttack = 4063,
    magicAttack = 4063,
    physicalDefence = 4063,
    magicDefence = 4063
    };
getRow(65,3)->
    #pet_starCfg {
    petStar = 65,
    petQuality = 3,
    maxHP2 = 54180,
    physicalAttack = 5418,
    magicAttack = 5418,
    physicalDefence = 5418,
    magicDefence = 5418
    };
getRow(65,4)->
    #pet_starCfg {
    petStar = 65,
    petQuality = 4,
    maxHP2 = 81270,
    physicalAttack = 8127,
    magicAttack = 8127,
    physicalDefence = 8127,
    magicDefence = 8127
    };
getRow(66,0)->
    #pet_starCfg {
    petStar = 66,
    petQuality = 0,
    maxHP2 = 28321,
    physicalAttack = 2832,
    magicAttack = 2832,
    physicalDefence = 2832,
    magicDefence = 2832
    };
getRow(66,1)->
    #pet_starCfg {
    petStar = 66,
    petQuality = 1,
    maxHP2 = 33985,
    physicalAttack = 3398,
    magicAttack = 3398,
    physicalDefence = 3398,
    magicDefence = 3398
    };
getRow(66,2)->
    #pet_starCfg {
    petStar = 66,
    petQuality = 2,
    maxHP2 = 42481,
    physicalAttack = 4248,
    magicAttack = 4248,
    physicalDefence = 4248,
    magicDefence = 4248
    };
getRow(66,3)->
    #pet_starCfg {
    petStar = 66,
    petQuality = 3,
    maxHP2 = 56642,
    physicalAttack = 5664,
    magicAttack = 5664,
    physicalDefence = 5664,
    magicDefence = 5664
    };
getRow(66,4)->
    #pet_starCfg {
    petStar = 66,
    petQuality = 4,
    maxHP2 = 84963,
    physicalAttack = 8496,
    magicAttack = 8496,
    physicalDefence = 8496,
    magicDefence = 8496
    };
getRow(67,0)->
    #pet_starCfg {
    petStar = 67,
    petQuality = 0,
    maxHP2 = 29180,
    physicalAttack = 2918,
    magicAttack = 2918,
    physicalDefence = 2918,
    magicDefence = 2918
    };
getRow(67,1)->
    #pet_starCfg {
    petStar = 67,
    petQuality = 1,
    maxHP2 = 35016,
    physicalAttack = 3501,
    magicAttack = 3501,
    physicalDefence = 3501,
    magicDefence = 3501
    };
getRow(67,2)->
    #pet_starCfg {
    petStar = 67,
    petQuality = 2,
    maxHP2 = 43770,
    physicalAttack = 4377,
    magicAttack = 4377,
    physicalDefence = 4377,
    magicDefence = 4377
    };
getRow(67,3)->
    #pet_starCfg {
    petStar = 67,
    petQuality = 3,
    maxHP2 = 58360,
    physicalAttack = 5836,
    magicAttack = 5836,
    physicalDefence = 5836,
    magicDefence = 5836
    };
getRow(67,4)->
    #pet_starCfg {
    petStar = 67,
    petQuality = 4,
    maxHP2 = 87540,
    physicalAttack = 8754,
    magicAttack = 8754,
    physicalDefence = 8754,
    magicDefence = 8754
    };
getRow(68,0)->
    #pet_starCfg {
    petStar = 68,
    petQuality = 0,
    maxHP2 = 30059,
    physicalAttack = 3006,
    magicAttack = 3006,
    physicalDefence = 3006,
    magicDefence = 3006
    };
getRow(68,1)->
    #pet_starCfg {
    petStar = 68,
    petQuality = 1,
    maxHP2 = 36071,
    physicalAttack = 3607,
    magicAttack = 3607,
    physicalDefence = 3607,
    magicDefence = 3607
    };
getRow(68,2)->
    #pet_starCfg {
    petStar = 68,
    petQuality = 2,
    maxHP2 = 45089,
    physicalAttack = 4509,
    magicAttack = 4509,
    physicalDefence = 4509,
    magicDefence = 4509
    };
getRow(68,3)->
    #pet_starCfg {
    petStar = 68,
    petQuality = 3,
    maxHP2 = 60119,
    physicalAttack = 6012,
    magicAttack = 6012,
    physicalDefence = 6012,
    magicDefence = 6012
    };
getRow(68,4)->
    #pet_starCfg {
    petStar = 68,
    petQuality = 4,
    maxHP2 = 90179,
    physicalAttack = 9018,
    magicAttack = 9018,
    physicalDefence = 9018,
    magicDefence = 9018
    };
getRow(69,0)->
    #pet_starCfg {
    petStar = 69,
    petQuality = 0,
    maxHP2 = 30960,
    physicalAttack = 3096,
    magicAttack = 3096,
    physicalDefence = 3096,
    magicDefence = 3096
    };
getRow(69,1)->
    #pet_starCfg {
    petStar = 69,
    petQuality = 1,
    maxHP2 = 37152,
    physicalAttack = 3715,
    magicAttack = 3715,
    physicalDefence = 3715,
    magicDefence = 3715
    };
getRow(69,2)->
    #pet_starCfg {
    petStar = 69,
    petQuality = 2,
    maxHP2 = 46440,
    physicalAttack = 4644,
    magicAttack = 4644,
    physicalDefence = 4644,
    magicDefence = 4644
    };
getRow(69,3)->
    #pet_starCfg {
    petStar = 69,
    petQuality = 3,
    maxHP2 = 61920,
    physicalAttack = 6192,
    magicAttack = 6192,
    physicalDefence = 6192,
    magicDefence = 6192
    };
getRow(69,4)->
    #pet_starCfg {
    petStar = 69,
    petQuality = 4,
    maxHP2 = 92881,
    physicalAttack = 9288,
    magicAttack = 9288,
    physicalDefence = 9288,
    magicDefence = 9288
    };
getRow(70,0)->
    #pet_starCfg {
    petStar = 70,
    petQuality = 0,
    maxHP2 = 31882,
    physicalAttack = 3188,
    magicAttack = 3188,
    physicalDefence = 3188,
    magicDefence = 3188
    };
getRow(70,1)->
    #pet_starCfg {
    petStar = 70,
    petQuality = 1,
    maxHP2 = 38259,
    physicalAttack = 3826,
    magicAttack = 3826,
    physicalDefence = 3826,
    magicDefence = 3826
    };
getRow(70,2)->
    #pet_starCfg {
    petStar = 70,
    petQuality = 2,
    maxHP2 = 47824,
    physicalAttack = 4782,
    magicAttack = 4782,
    physicalDefence = 4782,
    magicDefence = 4782
    };
getRow(70,3)->
    #pet_starCfg {
    petStar = 70,
    petQuality = 3,
    maxHP2 = 63765,
    physicalAttack = 6376,
    magicAttack = 6376,
    physicalDefence = 6376,
    magicDefence = 6376
    };
getRow(70,4)->
    #pet_starCfg {
    petStar = 70,
    petQuality = 4,
    maxHP2 = 95648,
    physicalAttack = 9565,
    magicAttack = 9565,
    physicalDefence = 9565,
    magicDefence = 9565
    };
getRow(71,0)->
    #pet_starCfg {
    petStar = 71,
    petQuality = 0,
    maxHP2 = 33248,
    physicalAttack = 3324,
    magicAttack = 3324,
    physicalDefence = 3324,
    magicDefence = 3324
    };
getRow(71,1)->
    #pet_starCfg {
    petStar = 71,
    petQuality = 1,
    maxHP2 = 39898,
    physicalAttack = 3989,
    magicAttack = 3989,
    physicalDefence = 3989,
    magicDefence = 3989
    };
getRow(71,2)->
    #pet_starCfg {
    petStar = 71,
    petQuality = 2,
    maxHP2 = 49872,
    physicalAttack = 4987,
    magicAttack = 4987,
    physicalDefence = 4987,
    magicDefence = 4987
    };
getRow(71,3)->
    #pet_starCfg {
    petStar = 71,
    petQuality = 3,
    maxHP2 = 66496,
    physicalAttack = 6649,
    magicAttack = 6649,
    physicalDefence = 6649,
    magicDefence = 6649
    };
getRow(71,4)->
    #pet_starCfg {
    petStar = 71,
    petQuality = 4,
    maxHP2 = 99745,
    physicalAttack = 9974,
    magicAttack = 9974,
    physicalDefence = 9974,
    magicDefence = 9974
    };
getRow(72,0)->
    #pet_starCfg {
    petStar = 72,
    petQuality = 0,
    maxHP2 = 34213,
    physicalAttack = 3421,
    magicAttack = 3421,
    physicalDefence = 3421,
    magicDefence = 3421
    };
getRow(72,1)->
    #pet_starCfg {
    petStar = 72,
    petQuality = 1,
    maxHP2 = 41056,
    physicalAttack = 4105,
    magicAttack = 4105,
    physicalDefence = 4105,
    magicDefence = 4105
    };
getRow(72,2)->
    #pet_starCfg {
    petStar = 72,
    petQuality = 2,
    maxHP2 = 51320,
    physicalAttack = 5132,
    magicAttack = 5132,
    physicalDefence = 5132,
    magicDefence = 5132
    };
getRow(72,3)->
    #pet_starCfg {
    petStar = 72,
    petQuality = 3,
    maxHP2 = 68427,
    physicalAttack = 6842,
    magicAttack = 6842,
    physicalDefence = 6842,
    magicDefence = 6842
    };
getRow(72,4)->
    #pet_starCfg {
    petStar = 72,
    petQuality = 4,
    maxHP2 = 102641,
    physicalAttack = 10264,
    magicAttack = 10264,
    physicalDefence = 10264,
    magicDefence = 10264
    };
getRow(73,0)->
    #pet_starCfg {
    petStar = 73,
    petQuality = 0,
    maxHP2 = 35201,
    physicalAttack = 3520,
    magicAttack = 3520,
    physicalDefence = 3520,
    magicDefence = 3520
    };
getRow(73,1)->
    #pet_starCfg {
    petStar = 73,
    petQuality = 1,
    maxHP2 = 42242,
    physicalAttack = 4224,
    magicAttack = 4224,
    physicalDefence = 4224,
    magicDefence = 4224
    };
getRow(73,2)->
    #pet_starCfg {
    petStar = 73,
    petQuality = 2,
    maxHP2 = 52802,
    physicalAttack = 5280,
    magicAttack = 5280,
    physicalDefence = 5280,
    magicDefence = 5280
    };
getRow(73,3)->
    #pet_starCfg {
    petStar = 73,
    petQuality = 3,
    maxHP2 = 70403,
    physicalAttack = 7040,
    magicAttack = 7040,
    physicalDefence = 7040,
    magicDefence = 7040
    };
getRow(73,4)->
    #pet_starCfg {
    petStar = 73,
    petQuality = 4,
    maxHP2 = 105605,
    physicalAttack = 10560,
    magicAttack = 10560,
    physicalDefence = 10560,
    magicDefence = 10560
    };
getRow(74,0)->
    #pet_starCfg {
    petStar = 74,
    petQuality = 0,
    maxHP2 = 36211,
    physicalAttack = 3621,
    magicAttack = 3621,
    physicalDefence = 3621,
    magicDefence = 3621
    };
getRow(74,1)->
    #pet_starCfg {
    petStar = 74,
    petQuality = 1,
    maxHP2 = 43454,
    physicalAttack = 4345,
    magicAttack = 4345,
    physicalDefence = 4345,
    magicDefence = 4345
    };
getRow(74,2)->
    #pet_starCfg {
    petStar = 74,
    petQuality = 2,
    maxHP2 = 54317,
    physicalAttack = 5431,
    magicAttack = 5431,
    physicalDefence = 5431,
    magicDefence = 5431
    };
getRow(74,3)->
    #pet_starCfg {
    petStar = 74,
    petQuality = 3,
    maxHP2 = 72423,
    physicalAttack = 7242,
    magicAttack = 7242,
    physicalDefence = 7242,
    magicDefence = 7242
    };
getRow(74,4)->
    #pet_starCfg {
    petStar = 74,
    petQuality = 4,
    maxHP2 = 108635,
    physicalAttack = 10863,
    magicAttack = 10863,
    physicalDefence = 10863,
    magicDefence = 10863
    };
getRow(75,0)->
    #pet_starCfg {
    petStar = 75,
    petQuality = 0,
    maxHP2 = 37244,
    physicalAttack = 3724,
    magicAttack = 3724,
    physicalDefence = 3724,
    magicDefence = 3724
    };
getRow(75,1)->
    #pet_starCfg {
    petStar = 75,
    petQuality = 1,
    maxHP2 = 44693,
    physicalAttack = 4469,
    magicAttack = 4469,
    physicalDefence = 4469,
    magicDefence = 4469
    };
getRow(75,2)->
    #pet_starCfg {
    petStar = 75,
    petQuality = 2,
    maxHP2 = 55867,
    physicalAttack = 5586,
    magicAttack = 5586,
    physicalDefence = 5586,
    magicDefence = 5586
    };
getRow(75,3)->
    #pet_starCfg {
    petStar = 75,
    petQuality = 3,
    maxHP2 = 74489,
    physicalAttack = 7448,
    magicAttack = 7448,
    physicalDefence = 7448,
    magicDefence = 7448
    };
getRow(75,4)->
    #pet_starCfg {
    petStar = 75,
    petQuality = 4,
    maxHP2 = 111734,
    physicalAttack = 11173,
    magicAttack = 11173,
    physicalDefence = 11173,
    magicDefence = 11173
    };
getRow(76,0)->
    #pet_starCfg {
    petStar = 76,
    petQuality = 0,
    maxHP2 = 38752,
    physicalAttack = 3875,
    magicAttack = 3875,
    physicalDefence = 3875,
    magicDefence = 3875
    };
getRow(76,1)->
    #pet_starCfg {
    petStar = 76,
    petQuality = 1,
    maxHP2 = 46502,
    physicalAttack = 4650,
    magicAttack = 4650,
    physicalDefence = 4650,
    magicDefence = 4650
    };
getRow(76,2)->
    #pet_starCfg {
    petStar = 76,
    petQuality = 2,
    maxHP2 = 58128,
    physicalAttack = 5813,
    magicAttack = 5813,
    physicalDefence = 5813,
    magicDefence = 5813
    };
getRow(76,3)->
    #pet_starCfg {
    petStar = 76,
    petQuality = 3,
    maxHP2 = 77504,
    physicalAttack = 7750,
    magicAttack = 7750,
    physicalDefence = 7750,
    magicDefence = 7750
    };
getRow(76,4)->
    #pet_starCfg {
    petStar = 76,
    petQuality = 4,
    maxHP2 = 116256,
    physicalAttack = 11626,
    magicAttack = 11626,
    physicalDefence = 11626,
    magicDefence = 11626
    };
getRow(77,0)->
    #pet_starCfg {
    petStar = 77,
    petQuality = 0,
    maxHP2 = 39831,
    physicalAttack = 3983,
    magicAttack = 3983,
    physicalDefence = 3983,
    magicDefence = 3983
    };
getRow(77,1)->
    #pet_starCfg {
    petStar = 77,
    petQuality = 1,
    maxHP2 = 47797,
    physicalAttack = 4779,
    magicAttack = 4779,
    physicalDefence = 4779,
    magicDefence = 4779
    };
getRow(77,2)->
    #pet_starCfg {
    petStar = 77,
    petQuality = 2,
    maxHP2 = 59747,
    physicalAttack = 5974,
    magicAttack = 5974,
    physicalDefence = 5974,
    magicDefence = 5974
    };
getRow(77,3)->
    #pet_starCfg {
    petStar = 77,
    petQuality = 3,
    maxHP2 = 79662,
    physicalAttack = 7966,
    magicAttack = 7966,
    physicalDefence = 7966,
    magicDefence = 7966
    };
getRow(77,4)->
    #pet_starCfg {
    petStar = 77,
    petQuality = 4,
    maxHP2 = 119494,
    physicalAttack = 11949,
    magicAttack = 11949,
    physicalDefence = 11949,
    magicDefence = 11949
    };
getRow(78,0)->
    #pet_starCfg {
    petStar = 78,
    petQuality = 0,
    maxHP2 = 40934,
    physicalAttack = 4093,
    magicAttack = 4093,
    physicalDefence = 4093,
    magicDefence = 4093
    };
getRow(78,1)->
    #pet_starCfg {
    petStar = 78,
    petQuality = 1,
    maxHP2 = 49120,
    physicalAttack = 4912,
    magicAttack = 4912,
    physicalDefence = 4912,
    magicDefence = 4912
    };
getRow(78,2)->
    #pet_starCfg {
    petStar = 78,
    petQuality = 2,
    maxHP2 = 61401,
    physicalAttack = 6140,
    magicAttack = 6140,
    physicalDefence = 6140,
    magicDefence = 6140
    };
getRow(78,3)->
    #pet_starCfg {
    petStar = 78,
    petQuality = 3,
    maxHP2 = 81868,
    physicalAttack = 8186,
    magicAttack = 8186,
    physicalDefence = 8186,
    magicDefence = 8186
    };
getRow(78,4)->
    #pet_starCfg {
    petStar = 78,
    petQuality = 4,
    maxHP2 = 122802,
    physicalAttack = 12280,
    magicAttack = 12280,
    physicalDefence = 12280,
    magicDefence = 12280
    };
getRow(79,0)->
    #pet_starCfg {
    petStar = 79,
    petQuality = 0,
    maxHP2 = 42060,
    physicalAttack = 4206,
    magicAttack = 4206,
    physicalDefence = 4206,
    magicDefence = 4206
    };
getRow(79,1)->
    #pet_starCfg {
    petStar = 79,
    petQuality = 1,
    maxHP2 = 50472,
    physicalAttack = 5047,
    magicAttack = 5047,
    physicalDefence = 5047,
    magicDefence = 5047
    };
getRow(79,2)->
    #pet_starCfg {
    petStar = 79,
    petQuality = 2,
    maxHP2 = 63091,
    physicalAttack = 6309,
    magicAttack = 6309,
    physicalDefence = 6309,
    magicDefence = 6309
    };
getRow(79,3)->
    #pet_starCfg {
    petStar = 79,
    petQuality = 3,
    maxHP2 = 84121,
    physicalAttack = 8412,
    magicAttack = 8412,
    physicalDefence = 8412,
    magicDefence = 8412
    };
getRow(79,4)->
    #pet_starCfg {
    petStar = 79,
    petQuality = 4,
    maxHP2 = 126182,
    physicalAttack = 12618,
    magicAttack = 12618,
    physicalDefence = 12618,
    magicDefence = 12618
    };
getRow(80,0)->
    #pet_starCfg {
    petStar = 80,
    petQuality = 0,
    maxHP2 = 43211,
    physicalAttack = 4321,
    magicAttack = 4321,
    physicalDefence = 4321,
    magicDefence = 4321
    };
getRow(80,1)->
    #pet_starCfg {
    petStar = 80,
    petQuality = 1,
    maxHP2 = 51853,
    physicalAttack = 5185,
    magicAttack = 5185,
    physicalDefence = 5185,
    magicDefence = 5185
    };
getRow(80,2)->
    #pet_starCfg {
    petStar = 80,
    petQuality = 2,
    maxHP2 = 64817,
    physicalAttack = 6481,
    magicAttack = 6481,
    physicalDefence = 6481,
    magicDefence = 6481
    };
getRow(80,3)->
    #pet_starCfg {
    petStar = 80,
    petQuality = 3,
    maxHP2 = 86422,
    physicalAttack = 8642,
    magicAttack = 8642,
    physicalDefence = 8642,
    magicDefence = 8642
    };
getRow(80,4)->
    #pet_starCfg {
    petStar = 80,
    petQuality = 4,
    maxHP2 = 129634,
    physicalAttack = 12963,
    magicAttack = 12963,
    physicalDefence = 12963,
    magicDefence = 12963
    };
getRow(81,0)->
    #pet_starCfg {
    petStar = 81,
    petQuality = 0,
    maxHP2 = 44867,
    physicalAttack = 4486,
    magicAttack = 4486,
    physicalDefence = 4486,
    magicDefence = 4486
    };
getRow(81,1)->
    #pet_starCfg {
    petStar = 81,
    petQuality = 1,
    maxHP2 = 53841,
    physicalAttack = 5384,
    magicAttack = 5384,
    physicalDefence = 5384,
    magicDefence = 5384
    };
getRow(81,2)->
    #pet_starCfg {
    petStar = 81,
    petQuality = 2,
    maxHP2 = 67301,
    physicalAttack = 6730,
    magicAttack = 6730,
    physicalDefence = 6730,
    magicDefence = 6730
    };
getRow(81,3)->
    #pet_starCfg {
    petStar = 81,
    petQuality = 3,
    maxHP2 = 89735,
    physicalAttack = 8973,
    magicAttack = 8973,
    physicalDefence = 8973,
    magicDefence = 8973
    };
getRow(81,4)->
    #pet_starCfg {
    petStar = 81,
    petQuality = 4,
    maxHP2 = 134603,
    physicalAttack = 13460,
    magicAttack = 13460,
    physicalDefence = 13460,
    magicDefence = 13460
    };
getRow(82,0)->
    #pet_starCfg {
    petStar = 82,
    petQuality = 0,
    maxHP2 = 46067,
    physicalAttack = 4606,
    magicAttack = 4606,
    physicalDefence = 4606,
    magicDefence = 4606
    };
getRow(82,1)->
    #pet_starCfg {
    petStar = 82,
    petQuality = 1,
    maxHP2 = 55280,
    physicalAttack = 5528,
    magicAttack = 5528,
    physicalDefence = 5528,
    magicDefence = 5528
    };
getRow(82,2)->
    #pet_starCfg {
    petStar = 82,
    petQuality = 2,
    maxHP2 = 69101,
    physicalAttack = 6910,
    magicAttack = 6910,
    physicalDefence = 6910,
    magicDefence = 6910
    };
getRow(82,3)->
    #pet_starCfg {
    petStar = 82,
    petQuality = 3,
    maxHP2 = 92134,
    physicalAttack = 9213,
    magicAttack = 9213,
    physicalDefence = 9213,
    magicDefence = 9213
    };
getRow(82,4)->
    #pet_starCfg {
    petStar = 82,
    petQuality = 4,
    maxHP2 = 138202,
    physicalAttack = 13820,
    magicAttack = 13820,
    physicalDefence = 13820,
    magicDefence = 13820
    };
getRow(83,0)->
    #pet_starCfg {
    petStar = 83,
    petQuality = 0,
    maxHP2 = 47292,
    physicalAttack = 4729,
    magicAttack = 4729,
    physicalDefence = 4729,
    magicDefence = 4729
    };
getRow(83,1)->
    #pet_starCfg {
    petStar = 83,
    petQuality = 1,
    maxHP2 = 56750,
    physicalAttack = 5675,
    magicAttack = 5675,
    physicalDefence = 5675,
    magicDefence = 5675
    };
getRow(83,2)->
    #pet_starCfg {
    petStar = 83,
    petQuality = 2,
    maxHP2 = 70938,
    physicalAttack = 7094,
    magicAttack = 7094,
    physicalDefence = 7094,
    magicDefence = 7094
    };
getRow(83,3)->
    #pet_starCfg {
    petStar = 83,
    petQuality = 3,
    maxHP2 = 94584,
    physicalAttack = 9458,
    magicAttack = 9458,
    physicalDefence = 9458,
    magicDefence = 9458
    };
getRow(83,4)->
    #pet_starCfg {
    petStar = 83,
    petQuality = 4,
    maxHP2 = 141876,
    physicalAttack = 14188,
    magicAttack = 14188,
    physicalDefence = 14188,
    magicDefence = 14188
    };
getRow(84,0)->
    #pet_starCfg {
    petStar = 84,
    petQuality = 0,
    maxHP2 = 48542,
    physicalAttack = 4854,
    magicAttack = 4854,
    physicalDefence = 4854,
    magicDefence = 4854
    };
getRow(84,1)->
    #pet_starCfg {
    petStar = 84,
    petQuality = 1,
    maxHP2 = 58250,
    physicalAttack = 5825,
    magicAttack = 5825,
    physicalDefence = 5825,
    magicDefence = 5825
    };
getRow(84,2)->
    #pet_starCfg {
    petStar = 84,
    petQuality = 2,
    maxHP2 = 72813,
    physicalAttack = 7281,
    magicAttack = 7281,
    physicalDefence = 7281,
    magicDefence = 7281
    };
getRow(84,3)->
    #pet_starCfg {
    petStar = 84,
    petQuality = 3,
    maxHP2 = 97084,
    physicalAttack = 9708,
    magicAttack = 9708,
    physicalDefence = 9708,
    magicDefence = 9708
    };
getRow(84,4)->
    #pet_starCfg {
    petStar = 84,
    petQuality = 4,
    maxHP2 = 145626,
    physicalAttack = 14563,
    magicAttack = 14563,
    physicalDefence = 14563,
    magicDefence = 14563
    };
getRow(85,0)->
    #pet_starCfg {
    petStar = 85,
    petQuality = 0,
    maxHP2 = 49817,
    physicalAttack = 4981,
    magicAttack = 4981,
    physicalDefence = 4981,
    magicDefence = 4981
    };
getRow(85,1)->
    #pet_starCfg {
    petStar = 85,
    petQuality = 1,
    maxHP2 = 59780,
    physicalAttack = 5978,
    magicAttack = 5978,
    physicalDefence = 5978,
    magicDefence = 5978
    };
getRow(85,2)->
    #pet_starCfg {
    petStar = 85,
    petQuality = 2,
    maxHP2 = 74726,
    physicalAttack = 7472,
    magicAttack = 7472,
    physicalDefence = 7472,
    magicDefence = 7472
    };
getRow(85,3)->
    #pet_starCfg {
    petStar = 85,
    petQuality = 3,
    maxHP2 = 99634,
    physicalAttack = 9963,
    magicAttack = 9963,
    physicalDefence = 9963,
    magicDefence = 9963
    };
getRow(85,4)->
    #pet_starCfg {
    petStar = 85,
    petQuality = 4,
    maxHP2 = 149452,
    physicalAttack = 14945,
    magicAttack = 14945,
    physicalDefence = 14945,
    magicDefence = 14945
    };
getRow(86,0)->
    #pet_starCfg {
    petStar = 86,
    petQuality = 0,
    maxHP2 = 51629,
    physicalAttack = 5163,
    magicAttack = 5163,
    physicalDefence = 5163,
    magicDefence = 5163
    };
getRow(86,1)->
    #pet_starCfg {
    petStar = 86,
    petQuality = 1,
    maxHP2 = 61955,
    physicalAttack = 6195,
    magicAttack = 6195,
    physicalDefence = 6195,
    magicDefence = 6195
    };
getRow(86,2)->
    #pet_starCfg {
    petStar = 86,
    petQuality = 2,
    maxHP2 = 77444,
    physicalAttack = 7744,
    magicAttack = 7744,
    physicalDefence = 7744,
    magicDefence = 7744
    };
getRow(86,3)->
    #pet_starCfg {
    petStar = 86,
    petQuality = 3,
    maxHP2 = 103259,
    physicalAttack = 10326,
    magicAttack = 10326,
    physicalDefence = 10326,
    magicDefence = 10326
    };
getRow(86,4)->
    #pet_starCfg {
    petStar = 86,
    petQuality = 4,
    maxHP2 = 154889,
    physicalAttack = 15489,
    magicAttack = 15489,
    physicalDefence = 15489,
    magicDefence = 15489
    };
getRow(87,0)->
    #pet_starCfg {
    petStar = 87,
    petQuality = 0,
    maxHP2 = 52957,
    physicalAttack = 5295,
    magicAttack = 5295,
    physicalDefence = 5295,
    magicDefence = 5295
    };
getRow(87,1)->
    #pet_starCfg {
    petStar = 87,
    petQuality = 1,
    maxHP2 = 63548,
    physicalAttack = 6354,
    magicAttack = 6354,
    physicalDefence = 6354,
    magicDefence = 6354
    };
getRow(87,2)->
    #pet_starCfg {
    petStar = 87,
    petQuality = 2,
    maxHP2 = 79435,
    physicalAttack = 7943,
    magicAttack = 7943,
    physicalDefence = 7943,
    magicDefence = 7943
    };
getRow(87,3)->
    #pet_starCfg {
    petStar = 87,
    petQuality = 3,
    maxHP2 = 105914,
    physicalAttack = 10591,
    magicAttack = 10591,
    physicalDefence = 10591,
    magicDefence = 10591
    };
getRow(87,4)->
    #pet_starCfg {
    petStar = 87,
    petQuality = 4,
    maxHP2 = 158871,
    physicalAttack = 15887,
    magicAttack = 15887,
    physicalDefence = 15887,
    magicDefence = 15887
    };
getRow(88,0)->
    #pet_starCfg {
    petStar = 88,
    petQuality = 0,
    maxHP2 = 54310,
    physicalAttack = 5431,
    magicAttack = 5431,
    physicalDefence = 5431,
    magicDefence = 5431
    };
getRow(88,1)->
    #pet_starCfg {
    petStar = 88,
    petQuality = 1,
    maxHP2 = 65172,
    physicalAttack = 6517,
    magicAttack = 6517,
    physicalDefence = 6517,
    magicDefence = 6517
    };
getRow(88,2)->
    #pet_starCfg {
    petStar = 88,
    petQuality = 2,
    maxHP2 = 81465,
    physicalAttack = 8146,
    magicAttack = 8146,
    physicalDefence = 8146,
    magicDefence = 8146
    };
getRow(88,3)->
    #pet_starCfg {
    petStar = 88,
    petQuality = 3,
    maxHP2 = 108620,
    physicalAttack = 10862,
    magicAttack = 10862,
    physicalDefence = 10862,
    magicDefence = 10862
    };
getRow(88,4)->
    #pet_starCfg {
    petStar = 88,
    petQuality = 4,
    maxHP2 = 162931,
    physicalAttack = 16293,
    magicAttack = 16293,
    physicalDefence = 16293,
    magicDefence = 16293
    };
getRow(89,0)->
    #pet_starCfg {
    petStar = 89,
    petQuality = 0,
    maxHP2 = 55690,
    physicalAttack = 5569,
    magicAttack = 5569,
    physicalDefence = 5569,
    magicDefence = 5569
    };
getRow(89,1)->
    #pet_starCfg {
    petStar = 89,
    petQuality = 1,
    maxHP2 = 66828,
    physicalAttack = 6682,
    magicAttack = 6682,
    physicalDefence = 6682,
    magicDefence = 6682
    };
getRow(89,2)->
    #pet_starCfg {
    petStar = 89,
    petQuality = 2,
    maxHP2 = 83536,
    physicalAttack = 8353,
    magicAttack = 8353,
    physicalDefence = 8353,
    magicDefence = 8353
    };
getRow(89,3)->
    #pet_starCfg {
    petStar = 89,
    petQuality = 3,
    maxHP2 = 111381,
    physicalAttack = 11138,
    magicAttack = 11138,
    physicalDefence = 11138,
    magicDefence = 11138
    };
getRow(89,4)->
    #pet_starCfg {
    petStar = 89,
    petQuality = 4,
    maxHP2 = 167072,
    physicalAttack = 16707,
    magicAttack = 16707,
    physicalDefence = 16707,
    magicDefence = 16707
    };
getRow(90,0)->
    #pet_starCfg {
    petStar = 90,
    petQuality = 0,
    maxHP2 = 57097,
    physicalAttack = 5709,
    magicAttack = 5709,
    physicalDefence = 5709,
    magicDefence = 5709
    };
getRow(90,1)->
    #pet_starCfg {
    petStar = 90,
    petQuality = 1,
    maxHP2 = 68517,
    physicalAttack = 6851,
    magicAttack = 6851,
    physicalDefence = 6851,
    magicDefence = 6851
    };
getRow(90,2)->
    #pet_starCfg {
    petStar = 90,
    petQuality = 2,
    maxHP2 = 85646,
    physicalAttack = 8564,
    magicAttack = 8564,
    physicalDefence = 8564,
    magicDefence = 8564
    };
getRow(90,3)->
    #pet_starCfg {
    petStar = 90,
    petQuality = 3,
    maxHP2 = 114195,
    physicalAttack = 11419,
    magicAttack = 11419,
    physicalDefence = 11419,
    magicDefence = 11419
    };
getRow(90,4)->
    #pet_starCfg {
    petStar = 90,
    petQuality = 4,
    maxHP2 = 171293,
    physicalAttack = 17129,
    magicAttack = 17129,
    physicalDefence = 17129,
    magicDefence = 17129
    };
getRow(91,0)->
    #pet_starCfg {
    petStar = 91,
    petQuality = 0,
    maxHP2 = 59072,
    physicalAttack = 5907,
    magicAttack = 5907,
    physicalDefence = 5907,
    magicDefence = 5907
    };
getRow(91,1)->
    #pet_starCfg {
    petStar = 91,
    petQuality = 1,
    maxHP2 = 70887,
    physicalAttack = 7088,
    magicAttack = 7088,
    physicalDefence = 7088,
    magicDefence = 7088
    };
getRow(91,2)->
    #pet_starCfg {
    petStar = 91,
    petQuality = 2,
    maxHP2 = 88609,
    physicalAttack = 8861,
    magicAttack = 8861,
    physicalDefence = 8861,
    magicDefence = 8861
    };
getRow(91,3)->
    #pet_starCfg {
    petStar = 91,
    petQuality = 3,
    maxHP2 = 118145,
    physicalAttack = 11814,
    magicAttack = 11814,
    physicalDefence = 11814,
    magicDefence = 11814
    };
getRow(91,4)->
    #pet_starCfg {
    petStar = 91,
    petQuality = 4,
    maxHP2 = 177218,
    physicalAttack = 17722,
    magicAttack = 17722,
    physicalDefence = 17722,
    magicDefence = 17722
    };
getRow(92,0)->
    #pet_starCfg {
    petStar = 92,
    petQuality = 0,
    maxHP2 = 60534,
    physicalAttack = 6053,
    magicAttack = 6053,
    physicalDefence = 6053,
    magicDefence = 6053
    };
getRow(92,1)->
    #pet_starCfg {
    petStar = 92,
    petQuality = 1,
    maxHP2 = 72641,
    physicalAttack = 7264,
    magicAttack = 7264,
    physicalDefence = 7264,
    magicDefence = 7264
    };
getRow(92,2)->
    #pet_starCfg {
    petStar = 92,
    petQuality = 2,
    maxHP2 = 90801,
    physicalAttack = 9080,
    magicAttack = 9080,
    physicalDefence = 9080,
    magicDefence = 9080
    };
getRow(92,3)->
    #pet_starCfg {
    petStar = 92,
    petQuality = 3,
    maxHP2 = 121068,
    physicalAttack = 12106,
    magicAttack = 12106,
    physicalDefence = 12106,
    magicDefence = 12106
    };
getRow(92,4)->
    #pet_starCfg {
    petStar = 92,
    petQuality = 4,
    maxHP2 = 181603,
    physicalAttack = 18160,
    magicAttack = 18160,
    physicalDefence = 18160,
    magicDefence = 18160
    };
getRow(93,0)->
    #pet_starCfg {
    petStar = 93,
    petQuality = 0,
    maxHP2 = 62023,
    physicalAttack = 6202,
    magicAttack = 6202,
    physicalDefence = 6202,
    magicDefence = 6202
    };
getRow(93,1)->
    #pet_starCfg {
    petStar = 93,
    petQuality = 1,
    maxHP2 = 74428,
    physicalAttack = 7442,
    magicAttack = 7442,
    physicalDefence = 7442,
    magicDefence = 7442
    };
getRow(93,2)->
    #pet_starCfg {
    petStar = 93,
    petQuality = 2,
    maxHP2 = 93035,
    physicalAttack = 9303,
    magicAttack = 9303,
    physicalDefence = 9303,
    magicDefence = 9303
    };
getRow(93,3)->
    #pet_starCfg {
    petStar = 93,
    petQuality = 3,
    maxHP2 = 124047,
    physicalAttack = 12404,
    magicAttack = 12404,
    physicalDefence = 12404,
    magicDefence = 12404
    };
getRow(93,4)->
    #pet_starCfg {
    petStar = 93,
    petQuality = 4,
    maxHP2 = 186071,
    physicalAttack = 18607,
    magicAttack = 18607,
    physicalDefence = 18607,
    magicDefence = 18607
    };
getRow(94,0)->
    #pet_starCfg {
    petStar = 94,
    petQuality = 0,
    maxHP2 = 63541,
    physicalAttack = 6354,
    magicAttack = 6354,
    physicalDefence = 6354,
    magicDefence = 6354
    };
getRow(94,1)->
    #pet_starCfg {
    petStar = 94,
    petQuality = 1,
    maxHP2 = 76249,
    physicalAttack = 7624,
    magicAttack = 7624,
    physicalDefence = 7624,
    magicDefence = 7624
    };
getRow(94,2)->
    #pet_starCfg {
    petStar = 94,
    petQuality = 2,
    maxHP2 = 95311,
    physicalAttack = 9531,
    magicAttack = 9531,
    physicalDefence = 9531,
    magicDefence = 9531
    };
getRow(94,3)->
    #pet_starCfg {
    petStar = 94,
    petQuality = 3,
    maxHP2 = 127082,
    physicalAttack = 12708,
    magicAttack = 12708,
    physicalDefence = 12708,
    magicDefence = 12708
    };
getRow(94,4)->
    #pet_starCfg {
    petStar = 94,
    petQuality = 4,
    maxHP2 = 190623,
    physicalAttack = 19062,
    magicAttack = 19062,
    physicalDefence = 19062,
    magicDefence = 19062
    };
getRow(95,0)->
    #pet_starCfg {
    petStar = 95,
    petQuality = 0,
    maxHP2 = 65086,
    physicalAttack = 6508,
    magicAttack = 6508,
    physicalDefence = 6508,
    magicDefence = 6508
    };
getRow(95,1)->
    #pet_starCfg {
    petStar = 95,
    petQuality = 1,
    maxHP2 = 78103,
    physicalAttack = 7810,
    magicAttack = 7810,
    physicalDefence = 7810,
    magicDefence = 7810
    };
getRow(95,2)->
    #pet_starCfg {
    petStar = 95,
    petQuality = 2,
    maxHP2 = 97629,
    physicalAttack = 9763,
    magicAttack = 9763,
    physicalDefence = 9763,
    magicDefence = 9763
    };
getRow(95,3)->
    #pet_starCfg {
    petStar = 95,
    petQuality = 3,
    maxHP2 = 130172,
    physicalAttack = 13017,
    magicAttack = 13017,
    physicalDefence = 13017,
    magicDefence = 13017
    };
getRow(95,4)->
    #pet_starCfg {
    petStar = 95,
    petQuality = 4,
    maxHP2 = 195259,
    physicalAttack = 19526,
    magicAttack = 19526,
    physicalDefence = 19526,
    magicDefence = 19526
    };
getRow(96,0)->
    #pet_starCfg {
    petStar = 96,
    petQuality = 0,
    maxHP2 = 67231,
    physicalAttack = 6723,
    magicAttack = 6723,
    physicalDefence = 6723,
    magicDefence = 6723
    };
getRow(96,1)->
    #pet_starCfg {
    petStar = 96,
    petQuality = 1,
    maxHP2 = 80677,
    physicalAttack = 8067,
    magicAttack = 8067,
    physicalDefence = 8067,
    magicDefence = 8067
    };
getRow(96,2)->
    #pet_starCfg {
    petStar = 96,
    petQuality = 2,
    maxHP2 = 100847,
    physicalAttack = 10084,
    magicAttack = 10084,
    physicalDefence = 10084,
    magicDefence = 10084
    };
getRow(96,3)->
    #pet_starCfg {
    petStar = 96,
    petQuality = 3,
    maxHP2 = 134462,
    physicalAttack = 13446,
    magicAttack = 13446,
    physicalDefence = 13446,
    magicDefence = 13446
    };
getRow(96,4)->
    #pet_starCfg {
    petStar = 96,
    petQuality = 4,
    maxHP2 = 201694,
    physicalAttack = 20169,
    magicAttack = 20169,
    physicalDefence = 20169,
    magicDefence = 20169
    };
getRow(97,0)->
    #pet_starCfg {
    petStar = 97,
    petQuality = 0,
    maxHP2 = 68834,
    physicalAttack = 6883,
    magicAttack = 6883,
    physicalDefence = 6883,
    magicDefence = 6883
    };
getRow(97,1)->
    #pet_starCfg {
    petStar = 97,
    petQuality = 1,
    maxHP2 = 82600,
    physicalAttack = 8260,
    magicAttack = 8260,
    physicalDefence = 8260,
    magicDefence = 8260
    };
getRow(97,2)->
    #pet_starCfg {
    petStar = 97,
    petQuality = 2,
    maxHP2 = 103251,
    physicalAttack = 10325,
    magicAttack = 10325,
    physicalDefence = 10325,
    magicDefence = 10325
    };
getRow(97,3)->
    #pet_starCfg {
    petStar = 97,
    petQuality = 3,
    maxHP2 = 137668,
    physicalAttack = 13766,
    magicAttack = 13766,
    physicalDefence = 13766,
    magicDefence = 13766
    };
getRow(97,4)->
    #pet_starCfg {
    petStar = 97,
    petQuality = 4,
    maxHP2 = 206502,
    physicalAttack = 20650,
    magicAttack = 20650,
    physicalDefence = 20650,
    magicDefence = 20650
    };
getRow(98,0)->
    #pet_starCfg {
    petStar = 98,
    petQuality = 0,
    maxHP2 = 70466,
    physicalAttack = 7046,
    magicAttack = 7046,
    physicalDefence = 7046,
    magicDefence = 7046
    };
getRow(98,1)->
    #pet_starCfg {
    petStar = 98,
    petQuality = 1,
    maxHP2 = 84559,
    physicalAttack = 8456,
    magicAttack = 8456,
    physicalDefence = 8456,
    magicDefence = 8456
    };
getRow(98,2)->
    #pet_starCfg {
    petStar = 98,
    petQuality = 2,
    maxHP2 = 105699,
    physicalAttack = 10570,
    magicAttack = 10570,
    physicalDefence = 10570,
    magicDefence = 10570
    };
getRow(98,3)->
    #pet_starCfg {
    petStar = 98,
    petQuality = 3,
    maxHP2 = 140932,
    physicalAttack = 14093,
    magicAttack = 14093,
    physicalDefence = 14093,
    magicDefence = 14093
    };
getRow(98,4)->
    #pet_starCfg {
    petStar = 98,
    petQuality = 4,
    maxHP2 = 211398,
    physicalAttack = 21140,
    magicAttack = 21140,
    physicalDefence = 21140,
    magicDefence = 21140
    };
getRow(99,0)->
    #pet_starCfg {
    petStar = 99,
    petQuality = 0,
    maxHP2 = 72127,
    physicalAttack = 7212,
    magicAttack = 7212,
    physicalDefence = 7212,
    magicDefence = 7212
    };
getRow(99,1)->
    #pet_starCfg {
    petStar = 99,
    petQuality = 1,
    maxHP2 = 86552,
    physicalAttack = 8655,
    magicAttack = 8655,
    physicalDefence = 8655,
    magicDefence = 8655
    };
getRow(99,2)->
    #pet_starCfg {
    petStar = 99,
    petQuality = 2,
    maxHP2 = 108191,
    physicalAttack = 10819,
    magicAttack = 10819,
    physicalDefence = 10819,
    magicDefence = 10819
    };
getRow(99,3)->
    #pet_starCfg {
    petStar = 99,
    petQuality = 3,
    maxHP2 = 144254,
    physicalAttack = 14425,
    magicAttack = 14425,
    physicalDefence = 14425,
    magicDefence = 14425
    };
getRow(99,4)->
    #pet_starCfg {
    petStar = 99,
    petQuality = 4,
    maxHP2 = 216382,
    physicalAttack = 21638,
    magicAttack = 21638,
    physicalDefence = 21638,
    magicDefence = 21638
    };
getRow(100,0)->
    #pet_starCfg {
    petStar = 100,
    petQuality = 0,
    maxHP2 = 73818,
    physicalAttack = 7381,
    magicAttack = 7381,
    physicalDefence = 7381,
    magicDefence = 7381
    };
getRow(100,1)->
    #pet_starCfg {
    petStar = 100,
    petQuality = 1,
    maxHP2 = 88581,
    physicalAttack = 8858,
    magicAttack = 8858,
    physicalDefence = 8858,
    magicDefence = 8858
    };
getRow(100,2)->
    #pet_starCfg {
    petStar = 100,
    petQuality = 2,
    maxHP2 = 110727,
    physicalAttack = 11072,
    magicAttack = 11072,
    physicalDefence = 11072,
    magicDefence = 11072
    };
getRow(100,3)->
    #pet_starCfg {
    petStar = 100,
    petQuality = 3,
    maxHP2 = 147636,
    physicalAttack = 14763,
    magicAttack = 14763,
    physicalDefence = 14763,
    magicDefence = 14763
    };
getRow(100,4)->
    #pet_starCfg {
    petStar = 100,
    petQuality = 4,
    maxHP2 = 221454,
    physicalAttack = 22145,
    magicAttack = 22145,
    physicalDefence = 22145,
    magicDefence = 22145
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
    {10,4},
    {11,0},
    {11,1},
    {11,2},
    {11,3},
    {11,4},
    {12,0},
    {12,1},
    {12,2},
    {12,3},
    {12,4},
    {13,0},
    {13,1},
    {13,2},
    {13,3},
    {13,4},
    {14,0},
    {14,1},
    {14,2},
    {14,3},
    {14,4},
    {15,0},
    {15,1},
    {15,2},
    {15,3},
    {15,4},
    {16,0},
    {16,1},
    {16,2},
    {16,3},
    {16,4},
    {17,0},
    {17,1},
    {17,2},
    {17,3},
    {17,4},
    {18,0},
    {18,1},
    {18,2},
    {18,3},
    {18,4},
    {19,0},
    {19,1},
    {19,2},
    {19,3},
    {19,4},
    {20,0},
    {20,1},
    {20,2},
    {20,3},
    {20,4},
    {21,0},
    {21,1},
    {21,2},
    {21,3},
    {21,4},
    {22,0},
    {22,1},
    {22,2},
    {22,3},
    {22,4},
    {23,0},
    {23,1},
    {23,2},
    {23,3},
    {23,4},
    {24,0},
    {24,1},
    {24,2},
    {24,3},
    {24,4},
    {25,0},
    {25,1},
    {25,2},
    {25,3},
    {25,4},
    {26,0},
    {26,1},
    {26,2},
    {26,3},
    {26,4},
    {27,0},
    {27,1},
    {27,2},
    {27,3},
    {27,4},
    {28,0},
    {28,1},
    {28,2},
    {28,3},
    {28,4},
    {29,0},
    {29,1},
    {29,2},
    {29,3},
    {29,4},
    {30,0},
    {30,1},
    {30,2},
    {30,3},
    {30,4},
    {31,0},
    {31,1},
    {31,2},
    {31,3},
    {31,4},
    {32,0},
    {32,1},
    {32,2},
    {32,3},
    {32,4},
    {33,0},
    {33,1},
    {33,2},
    {33,3},
    {33,4},
    {34,0},
    {34,1},
    {34,2},
    {34,3},
    {34,4},
    {35,0},
    {35,1},
    {35,2},
    {35,3},
    {35,4},
    {36,0},
    {36,1},
    {36,2},
    {36,3},
    {36,4},
    {37,0},
    {37,1},
    {37,2},
    {37,3},
    {37,4},
    {38,0},
    {38,1},
    {38,2},
    {38,3},
    {38,4},
    {39,0},
    {39,1},
    {39,2},
    {39,3},
    {39,4},
    {40,0},
    {40,1},
    {40,2},
    {40,3},
    {40,4},
    {41,0},
    {41,1},
    {41,2},
    {41,3},
    {41,4},
    {42,0},
    {42,1},
    {42,2},
    {42,3},
    {42,4},
    {43,0},
    {43,1},
    {43,2},
    {43,3},
    {43,4},
    {44,0},
    {44,1},
    {44,2},
    {44,3},
    {44,4},
    {45,0},
    {45,1},
    {45,2},
    {45,3},
    {45,4},
    {46,0},
    {46,1},
    {46,2},
    {46,3},
    {46,4},
    {47,0},
    {47,1},
    {47,2},
    {47,3},
    {47,4},
    {48,0},
    {48,1},
    {48,2},
    {48,3},
    {48,4},
    {49,0},
    {49,1},
    {49,2},
    {49,3},
    {49,4},
    {50,0},
    {50,1},
    {50,2},
    {50,3},
    {50,4},
    {51,0},
    {51,1},
    {51,2},
    {51,3},
    {51,4},
    {52,0},
    {52,1},
    {52,2},
    {52,3},
    {52,4},
    {53,0},
    {53,1},
    {53,2},
    {53,3},
    {53,4},
    {54,0},
    {54,1},
    {54,2},
    {54,3},
    {54,4},
    {55,0},
    {55,1},
    {55,2},
    {55,3},
    {55,4},
    {56,0},
    {56,1},
    {56,2},
    {56,3},
    {56,4},
    {57,0},
    {57,1},
    {57,2},
    {57,3},
    {57,4},
    {58,0},
    {58,1},
    {58,2},
    {58,3},
    {58,4},
    {59,0},
    {59,1},
    {59,2},
    {59,3},
    {59,4},
    {60,0},
    {60,1},
    {60,2},
    {60,3},
    {60,4},
    {61,0},
    {61,1},
    {61,2},
    {61,3},
    {61,4},
    {62,0},
    {62,1},
    {62,2},
    {62,3},
    {62,4},
    {63,0},
    {63,1},
    {63,2},
    {63,3},
    {63,4},
    {64,0},
    {64,1},
    {64,2},
    {64,3},
    {64,4},
    {65,0},
    {65,1},
    {65,2},
    {65,3},
    {65,4},
    {66,0},
    {66,1},
    {66,2},
    {66,3},
    {66,4},
    {67,0},
    {67,1},
    {67,2},
    {67,3},
    {67,4},
    {68,0},
    {68,1},
    {68,2},
    {68,3},
    {68,4},
    {69,0},
    {69,1},
    {69,2},
    {69,3},
    {69,4},
    {70,0},
    {70,1},
    {70,2},
    {70,3},
    {70,4},
    {71,0},
    {71,1},
    {71,2},
    {71,3},
    {71,4},
    {72,0},
    {72,1},
    {72,2},
    {72,3},
    {72,4},
    {73,0},
    {73,1},
    {73,2},
    {73,3},
    {73,4},
    {74,0},
    {74,1},
    {74,2},
    {74,3},
    {74,4},
    {75,0},
    {75,1},
    {75,2},
    {75,3},
    {75,4},
    {76,0},
    {76,1},
    {76,2},
    {76,3},
    {76,4},
    {77,0},
    {77,1},
    {77,2},
    {77,3},
    {77,4},
    {78,0},
    {78,1},
    {78,2},
    {78,3},
    {78,4},
    {79,0},
    {79,1},
    {79,2},
    {79,3},
    {79,4},
    {80,0},
    {80,1},
    {80,2},
    {80,3},
    {80,4},
    {81,0},
    {81,1},
    {81,2},
    {81,3},
    {81,4},
    {82,0},
    {82,1},
    {82,2},
    {82,3},
    {82,4},
    {83,0},
    {83,1},
    {83,2},
    {83,3},
    {83,4},
    {84,0},
    {84,1},
    {84,2},
    {84,3},
    {84,4},
    {85,0},
    {85,1},
    {85,2},
    {85,3},
    {85,4},
    {86,0},
    {86,1},
    {86,2},
    {86,3},
    {86,4},
    {87,0},
    {87,1},
    {87,2},
    {87,3},
    {87,4},
    {88,0},
    {88,1},
    {88,2},
    {88,3},
    {88,4},
    {89,0},
    {89,1},
    {89,2},
    {89,3},
    {89,4},
    {90,0},
    {90,1},
    {90,2},
    {90,3},
    {90,4},
    {91,0},
    {91,1},
    {91,2},
    {91,3},
    {91,4},
    {92,0},
    {92,1},
    {92,2},
    {92,3},
    {92,4},
    {93,0},
    {93,1},
    {93,2},
    {93,3},
    {93,4},
    {94,0},
    {94,1},
    {94,2},
    {94,3},
    {94,4},
    {95,0},
    {95,1},
    {95,2},
    {95,3},
    {95,4},
    {96,0},
    {96,1},
    {96,2},
    {96,3},
    {96,4},
    {97,0},
    {97,1},
    {97,2},
    {97,3},
    {97,4},
    {98,0},
    {98,1},
    {98,2},
    {98,3},
    {98,4},
    {99,0},
    {99,1},
    {99,2},
    {99,3},
    {99,4},
    {100,0},
    {100,1},
    {100,2},
    {100,3},
    {100,4}
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
    10,
    11,
    12,
    13,
    14,
    15,
    16,
    17,
    18,
    19,
    20,
    21,
    22,
    23,
    24,
    25,
    26,
    27,
    28,
    29,
    30,
    31,
    32,
    33,
    34,
    35,
    36,
    37,
    38,
    39,
    40,
    41,
    42,
    43,
    44,
    45,
    46,
    47,
    48,
    49,
    50,
    51,
    52,
    53,
    54,
    55,
    56,
    57,
    58,
    59,
    60,
    61,
    62,
    63,
    64,
    65,
    66,
    67,
    68,
    69,
    70,
    71,
    72,
    73,
    74,
    75,
    76,
    77,
    78,
    79,
    80,
    81,
    82,
    83,
    84,
    85,
    86,
    87,
    88,
    89,
    90,
    91,
    92,
    93,
    94,
    95,
    96,
    97,
    98,
    99,
    100
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
get2KeyList(11)->[
    0,
    1,
    2,
    3,
    4
    ];
get2KeyList(12)->[
    0,
    1,
    2,
    3,
    4
    ];
get2KeyList(13)->[
    0,
    1,
    2,
    3,
    4
    ];
get2KeyList(14)->[
    0,
    1,
    2,
    3,
    4
    ];
get2KeyList(15)->[
    0,
    1,
    2,
    3,
    4
    ];
get2KeyList(16)->[
    0,
    1,
    2,
    3,
    4
    ];
get2KeyList(17)->[
    0,
    1,
    2,
    3,
    4
    ];
get2KeyList(18)->[
    0,
    1,
    2,
    3,
    4
    ];
get2KeyList(19)->[
    0,
    1,
    2,
    3,
    4
    ];
get2KeyList(20)->[
    0,
    1,
    2,
    3,
    4
    ];
get2KeyList(21)->[
    0,
    1,
    2,
    3,
    4
    ];
get2KeyList(22)->[
    0,
    1,
    2,
    3,
    4
    ];
get2KeyList(23)->[
    0,
    1,
    2,
    3,
    4
    ];
get2KeyList(24)->[
    0,
    1,
    2,
    3,
    4
    ];
get2KeyList(25)->[
    0,
    1,
    2,
    3,
    4
    ];
get2KeyList(26)->[
    0,
    1,
    2,
    3,
    4
    ];
get2KeyList(27)->[
    0,
    1,
    2,
    3,
    4
    ];
get2KeyList(28)->[
    0,
    1,
    2,
    3,
    4
    ];
get2KeyList(29)->[
    0,
    1,
    2,
    3,
    4
    ];
get2KeyList(30)->[
    0,
    1,
    2,
    3,
    4
    ];
get2KeyList(31)->[
    0,
    1,
    2,
    3,
    4
    ];
get2KeyList(32)->[
    0,
    1,
    2,
    3,
    4
    ];
get2KeyList(33)->[
    0,
    1,
    2,
    3,
    4
    ];
get2KeyList(34)->[
    0,
    1,
    2,
    3,
    4
    ];
get2KeyList(35)->[
    0,
    1,
    2,
    3,
    4
    ];
get2KeyList(36)->[
    0,
    1,
    2,
    3,
    4
    ];
get2KeyList(37)->[
    0,
    1,
    2,
    3,
    4
    ];
get2KeyList(38)->[
    0,
    1,
    2,
    3,
    4
    ];
get2KeyList(39)->[
    0,
    1,
    2,
    3,
    4
    ];
get2KeyList(40)->[
    0,
    1,
    2,
    3,
    4
    ];
get2KeyList(41)->[
    0,
    1,
    2,
    3,
    4
    ];
get2KeyList(42)->[
    0,
    1,
    2,
    3,
    4
    ];
get2KeyList(43)->[
    0,
    1,
    2,
    3,
    4
    ];
get2KeyList(44)->[
    0,
    1,
    2,
    3,
    4
    ];
get2KeyList(45)->[
    0,
    1,
    2,
    3,
    4
    ];
get2KeyList(46)->[
    0,
    1,
    2,
    3,
    4
    ];
get2KeyList(47)->[
    0,
    1,
    2,
    3,
    4
    ];
get2KeyList(48)->[
    0,
    1,
    2,
    3,
    4
    ];
get2KeyList(49)->[
    0,
    1,
    2,
    3,
    4
    ];
get2KeyList(50)->[
    0,
    1,
    2,
    3,
    4
    ];
get2KeyList(51)->[
    0,
    1,
    2,
    3,
    4
    ];
get2KeyList(52)->[
    0,
    1,
    2,
    3,
    4
    ];
get2KeyList(53)->[
    0,
    1,
    2,
    3,
    4
    ];
get2KeyList(54)->[
    0,
    1,
    2,
    3,
    4
    ];
get2KeyList(55)->[
    0,
    1,
    2,
    3,
    4
    ];
get2KeyList(56)->[
    0,
    1,
    2,
    3,
    4
    ];
get2KeyList(57)->[
    0,
    1,
    2,
    3,
    4
    ];
get2KeyList(58)->[
    0,
    1,
    2,
    3,
    4
    ];
get2KeyList(59)->[
    0,
    1,
    2,
    3,
    4
    ];
get2KeyList(60)->[
    0,
    1,
    2,
    3,
    4
    ];
get2KeyList(61)->[
    0,
    1,
    2,
    3,
    4
    ];
get2KeyList(62)->[
    0,
    1,
    2,
    3,
    4
    ];
get2KeyList(63)->[
    0,
    1,
    2,
    3,
    4
    ];
get2KeyList(64)->[
    0,
    1,
    2,
    3,
    4
    ];
get2KeyList(65)->[
    0,
    1,
    2,
    3,
    4
    ];
get2KeyList(66)->[
    0,
    1,
    2,
    3,
    4
    ];
get2KeyList(67)->[
    0,
    1,
    2,
    3,
    4
    ];
get2KeyList(68)->[
    0,
    1,
    2,
    3,
    4
    ];
get2KeyList(69)->[
    0,
    1,
    2,
    3,
    4
    ];
get2KeyList(70)->[
    0,
    1,
    2,
    3,
    4
    ];
get2KeyList(71)->[
    0,
    1,
    2,
    3,
    4
    ];
get2KeyList(72)->[
    0,
    1,
    2,
    3,
    4
    ];
get2KeyList(73)->[
    0,
    1,
    2,
    3,
    4
    ];
get2KeyList(74)->[
    0,
    1,
    2,
    3,
    4
    ];
get2KeyList(75)->[
    0,
    1,
    2,
    3,
    4
    ];
get2KeyList(76)->[
    0,
    1,
    2,
    3,
    4
    ];
get2KeyList(77)->[
    0,
    1,
    2,
    3,
    4
    ];
get2KeyList(78)->[
    0,
    1,
    2,
    3,
    4
    ];
get2KeyList(79)->[
    0,
    1,
    2,
    3,
    4
    ];
get2KeyList(80)->[
    0,
    1,
    2,
    3,
    4
    ];
get2KeyList(81)->[
    0,
    1,
    2,
    3,
    4
    ];
get2KeyList(82)->[
    0,
    1,
    2,
    3,
    4
    ];
get2KeyList(83)->[
    0,
    1,
    2,
    3,
    4
    ];
get2KeyList(84)->[
    0,
    1,
    2,
    3,
    4
    ];
get2KeyList(85)->[
    0,
    1,
    2,
    3,
    4
    ];
get2KeyList(86)->[
    0,
    1,
    2,
    3,
    4
    ];
get2KeyList(87)->[
    0,
    1,
    2,
    3,
    4
    ];
get2KeyList(88)->[
    0,
    1,
    2,
    3,
    4
    ];
get2KeyList(89)->[
    0,
    1,
    2,
    3,
    4
    ];
get2KeyList(90)->[
    0,
    1,
    2,
    3,
    4
    ];
get2KeyList(91)->[
    0,
    1,
    2,
    3,
    4
    ];
get2KeyList(92)->[
    0,
    1,
    2,
    3,
    4
    ];
get2KeyList(93)->[
    0,
    1,
    2,
    3,
    4
    ];
get2KeyList(94)->[
    0,
    1,
    2,
    3,
    4
    ];
get2KeyList(95)->[
    0,
    1,
    2,
    3,
    4
    ];
get2KeyList(96)->[
    0,
    1,
    2,
    3,
    4
    ];
get2KeyList(97)->[
    0,
    1,
    2,
    3,
    4
    ];
get2KeyList(98)->[
    0,
    1,
    2,
    3,
    4
    ];
get2KeyList(99)->[
    0,
    1,
    2,
    3,
    4
    ];
get2KeyList(100)->[
    0,
    1,
    2,
    3,
    4
    ];
get2KeyList(_)->[].

