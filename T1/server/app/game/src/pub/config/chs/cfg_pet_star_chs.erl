%% coding: latin-1
%%: 实现
-module(cfg_pet_star_chs).
-compile(export_all).
-include("cfg_pet_star.hrl").
-include("logger.hrl").

getRow(1,0)->
    #pet_starCfg {
    petStar = 1,
    petQuality = 0,
    maxHP2 = 0,
    physicalAttack = 0,
    magicAttack = 0,
    physicalDefence = 0,
    magicDefence = 0
    };
getRow(1,1)->
    #pet_starCfg {
    petStar = 1,
    petQuality = 1,
    maxHP2 = 0,
    physicalAttack = 0,
    magicAttack = 0,
    physicalDefence = 0,
    magicDefence = 0
    };
getRow(1,2)->
    #pet_starCfg {
    petStar = 1,
    petQuality = 2,
    maxHP2 = 0,
    physicalAttack = 0,
    magicAttack = 0,
    physicalDefence = 0,
    magicDefence = 0
    };
getRow(1,3)->
    #pet_starCfg {
    petStar = 1,
    petQuality = 3,
    maxHP2 = 0,
    physicalAttack = 0,
    magicAttack = 0,
    physicalDefence = 0,
    magicDefence = 0
    };
getRow(1,4)->
    #pet_starCfg {
    petStar = 1,
    petQuality = 4,
    maxHP2 = 0,
    physicalAttack = 0,
    magicAttack = 0,
    physicalDefence = 0,
    magicDefence = 0
    };
getRow(1,5)->
    #pet_starCfg {
    petStar = 1,
    petQuality = 5,
    maxHP2 = 0,
    physicalAttack = 0,
    magicAttack = 0,
    physicalDefence = 0,
    magicDefence = 0
    };
getRow(2,0)->
    #pet_starCfg {
    petStar = 2,
    petQuality = 0,
    maxHP2 = 260,
    physicalAttack = 26,
    magicAttack = 26,
    physicalDefence = 26,
    magicDefence = 26
    };
getRow(2,1)->
    #pet_starCfg {
    petStar = 2,
    petQuality = 1,
    maxHP2 = 260,
    physicalAttack = 26,
    magicAttack = 26,
    physicalDefence = 26,
    magicDefence = 26
    };
getRow(2,2)->
    #pet_starCfg {
    petStar = 2,
    petQuality = 2,
    maxHP2 = 260,
    physicalAttack = 26,
    magicAttack = 26,
    physicalDefence = 26,
    magicDefence = 26
    };
getRow(2,3)->
    #pet_starCfg {
    petStar = 2,
    petQuality = 3,
    maxHP2 = 260,
    physicalAttack = 26,
    magicAttack = 26,
    physicalDefence = 26,
    magicDefence = 26
    };
getRow(2,4)->
    #pet_starCfg {
    petStar = 2,
    petQuality = 4,
    maxHP2 = 260,
    physicalAttack = 26,
    magicAttack = 26,
    physicalDefence = 26,
    magicDefence = 26
    };
getRow(2,5)->
    #pet_starCfg {
    petStar = 2,
    petQuality = 5,
    maxHP2 = 260,
    physicalAttack = 26,
    magicAttack = 26,
    physicalDefence = 26,
    magicDefence = 26
    };
getRow(3,0)->
    #pet_starCfg {
    petStar = 3,
    petQuality = 0,
    maxHP2 = 521,
    physicalAttack = 52,
    magicAttack = 52,
    physicalDefence = 52,
    magicDefence = 52
    };
getRow(3,1)->
    #pet_starCfg {
    petStar = 3,
    petQuality = 1,
    maxHP2 = 521,
    physicalAttack = 52,
    magicAttack = 52,
    physicalDefence = 52,
    magicDefence = 52
    };
getRow(3,2)->
    #pet_starCfg {
    petStar = 3,
    petQuality = 2,
    maxHP2 = 521,
    physicalAttack = 52,
    magicAttack = 52,
    physicalDefence = 52,
    magicDefence = 52
    };
getRow(3,3)->
    #pet_starCfg {
    petStar = 3,
    petQuality = 3,
    maxHP2 = 521,
    physicalAttack = 52,
    magicAttack = 52,
    physicalDefence = 52,
    magicDefence = 52
    };
getRow(3,4)->
    #pet_starCfg {
    petStar = 3,
    petQuality = 4,
    maxHP2 = 521,
    physicalAttack = 52,
    magicAttack = 52,
    physicalDefence = 52,
    magicDefence = 52
    };
getRow(3,5)->
    #pet_starCfg {
    petStar = 3,
    petQuality = 5,
    maxHP2 = 521,
    physicalAttack = 52,
    magicAttack = 52,
    physicalDefence = 52,
    magicDefence = 52
    };
getRow(4,0)->
    #pet_starCfg {
    petStar = 4,
    petQuality = 0,
    maxHP2 = 785,
    physicalAttack = 79,
    magicAttack = 79,
    physicalDefence = 79,
    magicDefence = 79
    };
getRow(4,1)->
    #pet_starCfg {
    petStar = 4,
    petQuality = 1,
    maxHP2 = 785,
    physicalAttack = 79,
    magicAttack = 79,
    physicalDefence = 79,
    magicDefence = 79
    };
getRow(4,2)->
    #pet_starCfg {
    petStar = 4,
    petQuality = 2,
    maxHP2 = 785,
    physicalAttack = 79,
    magicAttack = 79,
    physicalDefence = 79,
    magicDefence = 79
    };
getRow(4,3)->
    #pet_starCfg {
    petStar = 4,
    petQuality = 3,
    maxHP2 = 785,
    physicalAttack = 79,
    magicAttack = 79,
    physicalDefence = 79,
    magicDefence = 79
    };
getRow(4,4)->
    #pet_starCfg {
    petStar = 4,
    petQuality = 4,
    maxHP2 = 785,
    physicalAttack = 79,
    magicAttack = 79,
    physicalDefence = 79,
    magicDefence = 79
    };
getRow(4,5)->
    #pet_starCfg {
    petStar = 4,
    petQuality = 5,
    maxHP2 = 785,
    physicalAttack = 79,
    magicAttack = 79,
    physicalDefence = 79,
    magicDefence = 79
    };
getRow(5,0)->
    #pet_starCfg {
    petStar = 5,
    petQuality = 0,
    maxHP2 = 1056,
    physicalAttack = 106,
    magicAttack = 106,
    physicalDefence = 106,
    magicDefence = 106
    };
getRow(5,1)->
    #pet_starCfg {
    petStar = 5,
    petQuality = 1,
    maxHP2 = 1056,
    physicalAttack = 106,
    magicAttack = 106,
    physicalDefence = 106,
    magicDefence = 106
    };
getRow(5,2)->
    #pet_starCfg {
    petStar = 5,
    petQuality = 2,
    maxHP2 = 1056,
    physicalAttack = 106,
    magicAttack = 106,
    physicalDefence = 106,
    magicDefence = 106
    };
getRow(5,3)->
    #pet_starCfg {
    petStar = 5,
    petQuality = 3,
    maxHP2 = 1056,
    physicalAttack = 106,
    magicAttack = 106,
    physicalDefence = 106,
    magicDefence = 106
    };
getRow(5,4)->
    #pet_starCfg {
    petStar = 5,
    petQuality = 4,
    maxHP2 = 1056,
    physicalAttack = 106,
    magicAttack = 106,
    physicalDefence = 106,
    magicDefence = 106
    };
getRow(5,5)->
    #pet_starCfg {
    petStar = 5,
    petQuality = 5,
    maxHP2 = 1056,
    physicalAttack = 106,
    magicAttack = 106,
    physicalDefence = 106,
    magicDefence = 106
    };
getRow(6,0)->
    #pet_starCfg {
    petStar = 6,
    petQuality = 0,
    maxHP2 = 1334,
    physicalAttack = 133,
    magicAttack = 133,
    physicalDefence = 133,
    magicDefence = 133
    };
getRow(6,1)->
    #pet_starCfg {
    petStar = 6,
    petQuality = 1,
    maxHP2 = 1334,
    physicalAttack = 133,
    magicAttack = 133,
    physicalDefence = 133,
    magicDefence = 133
    };
getRow(6,2)->
    #pet_starCfg {
    petStar = 6,
    petQuality = 2,
    maxHP2 = 1334,
    physicalAttack = 133,
    magicAttack = 133,
    physicalDefence = 133,
    magicDefence = 133
    };
getRow(6,3)->
    #pet_starCfg {
    petStar = 6,
    petQuality = 3,
    maxHP2 = 1334,
    physicalAttack = 133,
    magicAttack = 133,
    physicalDefence = 133,
    magicDefence = 133
    };
getRow(6,4)->
    #pet_starCfg {
    petStar = 6,
    petQuality = 4,
    maxHP2 = 1334,
    physicalAttack = 133,
    magicAttack = 133,
    physicalDefence = 133,
    magicDefence = 133
    };
getRow(6,5)->
    #pet_starCfg {
    petStar = 6,
    petQuality = 5,
    maxHP2 = 1334,
    physicalAttack = 133,
    magicAttack = 133,
    physicalDefence = 133,
    magicDefence = 133
    };
getRow(7,0)->
    #pet_starCfg {
    petStar = 7,
    petQuality = 0,
    maxHP2 = 1911,
    physicalAttack = 191,
    magicAttack = 191,
    physicalDefence = 191,
    magicDefence = 191
    };
getRow(7,1)->
    #pet_starCfg {
    petStar = 7,
    petQuality = 1,
    maxHP2 = 1911,
    physicalAttack = 191,
    magicAttack = 191,
    physicalDefence = 191,
    magicDefence = 191
    };
getRow(7,2)->
    #pet_starCfg {
    petStar = 7,
    petQuality = 2,
    maxHP2 = 1911,
    physicalAttack = 191,
    magicAttack = 191,
    physicalDefence = 191,
    magicDefence = 191
    };
getRow(7,3)->
    #pet_starCfg {
    petStar = 7,
    petQuality = 3,
    maxHP2 = 1911,
    physicalAttack = 191,
    magicAttack = 191,
    physicalDefence = 191,
    magicDefence = 191
    };
getRow(7,4)->
    #pet_starCfg {
    petStar = 7,
    petQuality = 4,
    maxHP2 = 1911,
    physicalAttack = 191,
    magicAttack = 191,
    physicalDefence = 191,
    magicDefence = 191
    };
getRow(7,5)->
    #pet_starCfg {
    petStar = 7,
    petQuality = 5,
    maxHP2 = 1911,
    physicalAttack = 191,
    magicAttack = 191,
    physicalDefence = 191,
    magicDefence = 191
    };
getRow(8,0)->
    #pet_starCfg {
    petStar = 8,
    petQuality = 0,
    maxHP2 = 2211,
    physicalAttack = 221,
    magicAttack = 221,
    physicalDefence = 221,
    magicDefence = 221
    };
getRow(8,1)->
    #pet_starCfg {
    petStar = 8,
    petQuality = 1,
    maxHP2 = 2211,
    physicalAttack = 221,
    magicAttack = 221,
    physicalDefence = 221,
    magicDefence = 221
    };
getRow(8,2)->
    #pet_starCfg {
    petStar = 8,
    petQuality = 2,
    maxHP2 = 2211,
    physicalAttack = 221,
    magicAttack = 221,
    physicalDefence = 221,
    magicDefence = 221
    };
getRow(8,3)->
    #pet_starCfg {
    petStar = 8,
    petQuality = 3,
    maxHP2 = 2211,
    physicalAttack = 221,
    magicAttack = 221,
    physicalDefence = 221,
    magicDefence = 221
    };
getRow(8,4)->
    #pet_starCfg {
    petStar = 8,
    petQuality = 4,
    maxHP2 = 2211,
    physicalAttack = 221,
    magicAttack = 221,
    physicalDefence = 221,
    magicDefence = 221
    };
getRow(8,5)->
    #pet_starCfg {
    petStar = 8,
    petQuality = 5,
    maxHP2 = 2211,
    physicalAttack = 221,
    magicAttack = 221,
    physicalDefence = 221,
    magicDefence = 221
    };
getRow(9,0)->
    #pet_starCfg {
    petStar = 9,
    petQuality = 0,
    maxHP2 = 2523,
    physicalAttack = 252,
    magicAttack = 252,
    physicalDefence = 252,
    magicDefence = 252
    };
getRow(9,1)->
    #pet_starCfg {
    petStar = 9,
    petQuality = 1,
    maxHP2 = 2523,
    physicalAttack = 252,
    magicAttack = 252,
    physicalDefence = 252,
    magicDefence = 252
    };
getRow(9,2)->
    #pet_starCfg {
    petStar = 9,
    petQuality = 2,
    maxHP2 = 2523,
    physicalAttack = 252,
    magicAttack = 252,
    physicalDefence = 252,
    magicDefence = 252
    };
getRow(9,3)->
    #pet_starCfg {
    petStar = 9,
    petQuality = 3,
    maxHP2 = 2523,
    physicalAttack = 252,
    magicAttack = 252,
    physicalDefence = 252,
    magicDefence = 252
    };
getRow(9,4)->
    #pet_starCfg {
    petStar = 9,
    petQuality = 4,
    maxHP2 = 2523,
    physicalAttack = 252,
    magicAttack = 252,
    physicalDefence = 252,
    magicDefence = 252
    };
getRow(9,5)->
    #pet_starCfg {
    petStar = 9,
    petQuality = 5,
    maxHP2 = 2523,
    physicalAttack = 252,
    magicAttack = 252,
    physicalDefence = 252,
    magicDefence = 252
    };
getRow(10,0)->
    #pet_starCfg {
    petStar = 10,
    petQuality = 0,
    maxHP2 = 2851,
    physicalAttack = 285,
    magicAttack = 285,
    physicalDefence = 285,
    magicDefence = 285
    };
getRow(10,1)->
    #pet_starCfg {
    petStar = 10,
    petQuality = 1,
    maxHP2 = 2851,
    physicalAttack = 285,
    magicAttack = 285,
    physicalDefence = 285,
    magicDefence = 285
    };
getRow(10,2)->
    #pet_starCfg {
    petStar = 10,
    petQuality = 2,
    maxHP2 = 2851,
    physicalAttack = 285,
    magicAttack = 285,
    physicalDefence = 285,
    magicDefence = 285
    };
getRow(10,3)->
    #pet_starCfg {
    petStar = 10,
    petQuality = 3,
    maxHP2 = 2851,
    physicalAttack = 285,
    magicAttack = 285,
    physicalDefence = 285,
    magicDefence = 285
    };
getRow(10,4)->
    #pet_starCfg {
    petStar = 10,
    petQuality = 4,
    maxHP2 = 2851,
    physicalAttack = 285,
    magicAttack = 285,
    physicalDefence = 285,
    magicDefence = 285
    };
getRow(10,5)->
    #pet_starCfg {
    petStar = 10,
    petQuality = 5,
    maxHP2 = 2851,
    physicalAttack = 285,
    magicAttack = 285,
    physicalDefence = 285,
    magicDefence = 285
    };
getRow(11,0)->
    #pet_starCfg {
    petStar = 11,
    petQuality = 0,
    maxHP2 = 3194,
    physicalAttack = 319,
    magicAttack = 319,
    physicalDefence = 319,
    magicDefence = 319
    };
getRow(11,1)->
    #pet_starCfg {
    petStar = 11,
    petQuality = 1,
    maxHP2 = 3194,
    physicalAttack = 319,
    magicAttack = 319,
    physicalDefence = 319,
    magicDefence = 319
    };
getRow(11,2)->
    #pet_starCfg {
    petStar = 11,
    petQuality = 2,
    maxHP2 = 3194,
    physicalAttack = 319,
    magicAttack = 319,
    physicalDefence = 319,
    magicDefence = 319
    };
getRow(11,3)->
    #pet_starCfg {
    petStar = 11,
    petQuality = 3,
    maxHP2 = 3194,
    physicalAttack = 319,
    magicAttack = 319,
    physicalDefence = 319,
    magicDefence = 319
    };
getRow(11,4)->
    #pet_starCfg {
    petStar = 11,
    petQuality = 4,
    maxHP2 = 3194,
    physicalAttack = 319,
    magicAttack = 319,
    physicalDefence = 319,
    magicDefence = 319
    };
getRow(11,5)->
    #pet_starCfg {
    petStar = 11,
    petQuality = 5,
    maxHP2 = 3194,
    physicalAttack = 319,
    magicAttack = 319,
    physicalDefence = 319,
    magicDefence = 319
    };
getRow(12,0)->
    #pet_starCfg {
    petStar = 12,
    petQuality = 0,
    maxHP2 = 3915,
    physicalAttack = 392,
    magicAttack = 392,
    physicalDefence = 392,
    magicDefence = 392
    };
getRow(12,1)->
    #pet_starCfg {
    petStar = 12,
    petQuality = 1,
    maxHP2 = 3915,
    physicalAttack = 392,
    magicAttack = 392,
    physicalDefence = 392,
    magicDefence = 392
    };
getRow(12,2)->
    #pet_starCfg {
    petStar = 12,
    petQuality = 2,
    maxHP2 = 3915,
    physicalAttack = 392,
    magicAttack = 392,
    physicalDefence = 392,
    magicDefence = 392
    };
getRow(12,3)->
    #pet_starCfg {
    petStar = 12,
    petQuality = 3,
    maxHP2 = 3915,
    physicalAttack = 392,
    magicAttack = 392,
    physicalDefence = 392,
    magicDefence = 392
    };
getRow(12,4)->
    #pet_starCfg {
    petStar = 12,
    petQuality = 4,
    maxHP2 = 3915,
    physicalAttack = 392,
    magicAttack = 392,
    physicalDefence = 392,
    magicDefence = 392
    };
getRow(12,5)->
    #pet_starCfg {
    petStar = 12,
    petQuality = 5,
    maxHP2 = 3915,
    physicalAttack = 392,
    magicAttack = 392,
    physicalDefence = 392,
    magicDefence = 392
    };
getRow(13,0)->
    #pet_starCfg {
    petStar = 13,
    petQuality = 0,
    maxHP2 = 4295,
    physicalAttack = 429,
    magicAttack = 429,
    physicalDefence = 429,
    magicDefence = 429
    };
getRow(13,1)->
    #pet_starCfg {
    petStar = 13,
    petQuality = 1,
    maxHP2 = 4295,
    physicalAttack = 429,
    magicAttack = 429,
    physicalDefence = 429,
    magicDefence = 429
    };
getRow(13,2)->
    #pet_starCfg {
    petStar = 13,
    petQuality = 2,
    maxHP2 = 4295,
    physicalAttack = 429,
    magicAttack = 429,
    physicalDefence = 429,
    magicDefence = 429
    };
getRow(13,3)->
    #pet_starCfg {
    petStar = 13,
    petQuality = 3,
    maxHP2 = 4295,
    physicalAttack = 429,
    magicAttack = 429,
    physicalDefence = 429,
    magicDefence = 429
    };
getRow(13,4)->
    #pet_starCfg {
    petStar = 13,
    petQuality = 4,
    maxHP2 = 4295,
    physicalAttack = 429,
    magicAttack = 429,
    physicalDefence = 429,
    magicDefence = 429
    };
getRow(13,5)->
    #pet_starCfg {
    petStar = 13,
    petQuality = 5,
    maxHP2 = 4295,
    physicalAttack = 429,
    magicAttack = 429,
    physicalDefence = 429,
    magicDefence = 429
    };
getRow(14,0)->
    #pet_starCfg {
    petStar = 14,
    petQuality = 0,
    maxHP2 = 4694,
    physicalAttack = 469,
    magicAttack = 469,
    physicalDefence = 469,
    magicDefence = 469
    };
getRow(14,1)->
    #pet_starCfg {
    petStar = 14,
    petQuality = 1,
    maxHP2 = 4694,
    physicalAttack = 469,
    magicAttack = 469,
    physicalDefence = 469,
    magicDefence = 469
    };
getRow(14,2)->
    #pet_starCfg {
    petStar = 14,
    petQuality = 2,
    maxHP2 = 4694,
    physicalAttack = 469,
    magicAttack = 469,
    physicalDefence = 469,
    magicDefence = 469
    };
getRow(14,3)->
    #pet_starCfg {
    petStar = 14,
    petQuality = 3,
    maxHP2 = 4694,
    physicalAttack = 469,
    magicAttack = 469,
    physicalDefence = 469,
    magicDefence = 469
    };
getRow(14,4)->
    #pet_starCfg {
    petStar = 14,
    petQuality = 4,
    maxHP2 = 4694,
    physicalAttack = 469,
    magicAttack = 469,
    physicalDefence = 469,
    magicDefence = 469
    };
getRow(14,5)->
    #pet_starCfg {
    petStar = 14,
    petQuality = 5,
    maxHP2 = 4694,
    physicalAttack = 469,
    magicAttack = 469,
    physicalDefence = 469,
    magicDefence = 469
    };
getRow(15,0)->
    #pet_starCfg {
    petStar = 15,
    petQuality = 0,
    maxHP2 = 5114,
    physicalAttack = 511,
    magicAttack = 511,
    physicalDefence = 511,
    magicDefence = 511
    };
getRow(15,1)->
    #pet_starCfg {
    petStar = 15,
    petQuality = 1,
    maxHP2 = 5114,
    physicalAttack = 511,
    magicAttack = 511,
    physicalDefence = 511,
    magicDefence = 511
    };
getRow(15,2)->
    #pet_starCfg {
    petStar = 15,
    petQuality = 2,
    maxHP2 = 5114,
    physicalAttack = 511,
    magicAttack = 511,
    physicalDefence = 511,
    magicDefence = 511
    };
getRow(15,3)->
    #pet_starCfg {
    petStar = 15,
    petQuality = 3,
    maxHP2 = 5114,
    physicalAttack = 511,
    magicAttack = 511,
    physicalDefence = 511,
    magicDefence = 511
    };
getRow(15,4)->
    #pet_starCfg {
    petStar = 15,
    petQuality = 4,
    maxHP2 = 5114,
    physicalAttack = 511,
    magicAttack = 511,
    physicalDefence = 511,
    magicDefence = 511
    };
getRow(15,5)->
    #pet_starCfg {
    petStar = 15,
    petQuality = 5,
    maxHP2 = 5114,
    physicalAttack = 511,
    magicAttack = 511,
    physicalDefence = 511,
    magicDefence = 511
    };
getRow(16,0)->
    #pet_starCfg {
    petStar = 16,
    petQuality = 0,
    maxHP2 = 5557,
    physicalAttack = 556,
    magicAttack = 556,
    physicalDefence = 556,
    magicDefence = 556
    };
getRow(16,1)->
    #pet_starCfg {
    petStar = 16,
    petQuality = 1,
    maxHP2 = 5557,
    physicalAttack = 556,
    magicAttack = 556,
    physicalDefence = 556,
    magicDefence = 556
    };
getRow(16,2)->
    #pet_starCfg {
    petStar = 16,
    petQuality = 2,
    maxHP2 = 5557,
    physicalAttack = 556,
    magicAttack = 556,
    physicalDefence = 556,
    magicDefence = 556
    };
getRow(16,3)->
    #pet_starCfg {
    petStar = 16,
    petQuality = 3,
    maxHP2 = 5557,
    physicalAttack = 556,
    magicAttack = 556,
    physicalDefence = 556,
    magicDefence = 556
    };
getRow(16,4)->
    #pet_starCfg {
    petStar = 16,
    petQuality = 4,
    maxHP2 = 5557,
    physicalAttack = 556,
    magicAttack = 556,
    physicalDefence = 556,
    magicDefence = 556
    };
getRow(16,5)->
    #pet_starCfg {
    petStar = 16,
    petQuality = 5,
    maxHP2 = 5557,
    physicalAttack = 556,
    magicAttack = 556,
    physicalDefence = 556,
    magicDefence = 556
    };
getRow(17,0)->
    #pet_starCfg {
    petStar = 17,
    petQuality = 0,
    maxHP2 = 6490,
    physicalAttack = 649,
    magicAttack = 649,
    physicalDefence = 649,
    magicDefence = 649
    };
getRow(17,1)->
    #pet_starCfg {
    petStar = 17,
    petQuality = 1,
    maxHP2 = 6490,
    physicalAttack = 649,
    magicAttack = 649,
    physicalDefence = 649,
    magicDefence = 649
    };
getRow(17,2)->
    #pet_starCfg {
    petStar = 17,
    petQuality = 2,
    maxHP2 = 6490,
    physicalAttack = 649,
    magicAttack = 649,
    physicalDefence = 649,
    magicDefence = 649
    };
getRow(17,3)->
    #pet_starCfg {
    petStar = 17,
    petQuality = 3,
    maxHP2 = 6490,
    physicalAttack = 649,
    magicAttack = 649,
    physicalDefence = 649,
    magicDefence = 649
    };
getRow(17,4)->
    #pet_starCfg {
    petStar = 17,
    petQuality = 4,
    maxHP2 = 6490,
    physicalAttack = 649,
    magicAttack = 649,
    physicalDefence = 649,
    magicDefence = 649
    };
getRow(17,5)->
    #pet_starCfg {
    petStar = 17,
    petQuality = 5,
    maxHP2 = 6490,
    physicalAttack = 649,
    magicAttack = 649,
    physicalDefence = 649,
    magicDefence = 649
    };
getRow(18,0)->
    #pet_starCfg {
    petStar = 18,
    petQuality = 0,
    maxHP2 = 6982,
    physicalAttack = 698,
    magicAttack = 698,
    physicalDefence = 698,
    magicDefence = 698
    };
getRow(18,1)->
    #pet_starCfg {
    petStar = 18,
    petQuality = 1,
    maxHP2 = 6982,
    physicalAttack = 698,
    magicAttack = 698,
    physicalDefence = 698,
    magicDefence = 698
    };
getRow(18,2)->
    #pet_starCfg {
    petStar = 18,
    petQuality = 2,
    maxHP2 = 6982,
    physicalAttack = 698,
    magicAttack = 698,
    physicalDefence = 698,
    magicDefence = 698
    };
getRow(18,3)->
    #pet_starCfg {
    petStar = 18,
    petQuality = 3,
    maxHP2 = 6982,
    physicalAttack = 698,
    magicAttack = 698,
    physicalDefence = 698,
    magicDefence = 698
    };
getRow(18,4)->
    #pet_starCfg {
    petStar = 18,
    petQuality = 4,
    maxHP2 = 6982,
    physicalAttack = 698,
    magicAttack = 698,
    physicalDefence = 698,
    magicDefence = 698
    };
getRow(18,5)->
    #pet_starCfg {
    petStar = 18,
    petQuality = 5,
    maxHP2 = 6982,
    physicalAttack = 698,
    magicAttack = 698,
    physicalDefence = 698,
    magicDefence = 698
    };
getRow(19,0)->
    #pet_starCfg {
    petStar = 19,
    petQuality = 0,
    maxHP2 = 7499,
    physicalAttack = 750,
    magicAttack = 750,
    physicalDefence = 750,
    magicDefence = 750
    };
getRow(19,1)->
    #pet_starCfg {
    petStar = 19,
    petQuality = 1,
    maxHP2 = 7499,
    physicalAttack = 750,
    magicAttack = 750,
    physicalDefence = 750,
    magicDefence = 750
    };
getRow(19,2)->
    #pet_starCfg {
    petStar = 19,
    petQuality = 2,
    maxHP2 = 7499,
    physicalAttack = 750,
    magicAttack = 750,
    physicalDefence = 750,
    magicDefence = 750
    };
getRow(19,3)->
    #pet_starCfg {
    petStar = 19,
    petQuality = 3,
    maxHP2 = 7499,
    physicalAttack = 750,
    magicAttack = 750,
    physicalDefence = 750,
    magicDefence = 750
    };
getRow(19,4)->
    #pet_starCfg {
    petStar = 19,
    petQuality = 4,
    maxHP2 = 7499,
    physicalAttack = 750,
    magicAttack = 750,
    physicalDefence = 750,
    magicDefence = 750
    };
getRow(19,5)->
    #pet_starCfg {
    petStar = 19,
    petQuality = 5,
    maxHP2 = 7499,
    physicalAttack = 750,
    magicAttack = 750,
    physicalDefence = 750,
    magicDefence = 750
    };
getRow(20,0)->
    #pet_starCfg {
    petStar = 20,
    petQuality = 0,
    maxHP2 = 8043,
    physicalAttack = 804,
    magicAttack = 804,
    physicalDefence = 804,
    magicDefence = 804
    };
getRow(20,1)->
    #pet_starCfg {
    petStar = 20,
    petQuality = 1,
    maxHP2 = 8043,
    physicalAttack = 804,
    magicAttack = 804,
    physicalDefence = 804,
    magicDefence = 804
    };
getRow(20,2)->
    #pet_starCfg {
    petStar = 20,
    petQuality = 2,
    maxHP2 = 8043,
    physicalAttack = 804,
    magicAttack = 804,
    physicalDefence = 804,
    magicDefence = 804
    };
getRow(20,3)->
    #pet_starCfg {
    petStar = 20,
    petQuality = 3,
    maxHP2 = 8043,
    physicalAttack = 804,
    magicAttack = 804,
    physicalDefence = 804,
    magicDefence = 804
    };
getRow(20,4)->
    #pet_starCfg {
    petStar = 20,
    petQuality = 4,
    maxHP2 = 8043,
    physicalAttack = 804,
    magicAttack = 804,
    physicalDefence = 804,
    magicDefence = 804
    };
getRow(20,5)->
    #pet_starCfg {
    petStar = 20,
    petQuality = 5,
    maxHP2 = 8043,
    physicalAttack = 804,
    magicAttack = 804,
    physicalDefence = 804,
    magicDefence = 804
    };
getRow(21,0)->
    #pet_starCfg {
    petStar = 21,
    petQuality = 0,
    maxHP2 = 8615,
    physicalAttack = 862,
    magicAttack = 862,
    physicalDefence = 862,
    magicDefence = 862
    };
getRow(21,1)->
    #pet_starCfg {
    petStar = 21,
    petQuality = 1,
    maxHP2 = 8615,
    physicalAttack = 862,
    magicAttack = 862,
    physicalDefence = 862,
    magicDefence = 862
    };
getRow(21,2)->
    #pet_starCfg {
    petStar = 21,
    petQuality = 2,
    maxHP2 = 8615,
    physicalAttack = 862,
    magicAttack = 862,
    physicalDefence = 862,
    magicDefence = 862
    };
getRow(21,3)->
    #pet_starCfg {
    petStar = 21,
    petQuality = 3,
    maxHP2 = 8615,
    physicalAttack = 862,
    magicAttack = 862,
    physicalDefence = 862,
    magicDefence = 862
    };
getRow(21,4)->
    #pet_starCfg {
    petStar = 21,
    petQuality = 4,
    maxHP2 = 8615,
    physicalAttack = 862,
    magicAttack = 862,
    physicalDefence = 862,
    magicDefence = 862
    };
getRow(21,5)->
    #pet_starCfg {
    petStar = 21,
    petQuality = 5,
    maxHP2 = 8615,
    physicalAttack = 862,
    magicAttack = 862,
    physicalDefence = 862,
    magicDefence = 862
    };
getRow(22,0)->
    #pet_starCfg {
    petStar = 22,
    petQuality = 0,
    maxHP2 = 9819,
    physicalAttack = 982,
    magicAttack = 982,
    physicalDefence = 982,
    magicDefence = 982
    };
getRow(22,1)->
    #pet_starCfg {
    petStar = 22,
    petQuality = 1,
    maxHP2 = 9819,
    physicalAttack = 982,
    magicAttack = 982,
    physicalDefence = 982,
    magicDefence = 982
    };
getRow(22,2)->
    #pet_starCfg {
    petStar = 22,
    petQuality = 2,
    maxHP2 = 9819,
    physicalAttack = 982,
    magicAttack = 982,
    physicalDefence = 982,
    magicDefence = 982
    };
getRow(22,3)->
    #pet_starCfg {
    petStar = 22,
    petQuality = 3,
    maxHP2 = 9819,
    physicalAttack = 982,
    magicAttack = 982,
    physicalDefence = 982,
    magicDefence = 982
    };
getRow(22,4)->
    #pet_starCfg {
    petStar = 22,
    petQuality = 4,
    maxHP2 = 9819,
    physicalAttack = 982,
    magicAttack = 982,
    physicalDefence = 982,
    magicDefence = 982
    };
getRow(22,5)->
    #pet_starCfg {
    petStar = 22,
    petQuality = 5,
    maxHP2 = 9819,
    physicalAttack = 982,
    magicAttack = 982,
    physicalDefence = 982,
    magicDefence = 982
    };
getRow(23,0)->
    #pet_starCfg {
    petStar = 23,
    petQuality = 0,
    maxHP2 = 10450,
    physicalAttack = 1045,
    magicAttack = 1045,
    physicalDefence = 1045,
    magicDefence = 1045
    };
getRow(23,1)->
    #pet_starCfg {
    petStar = 23,
    petQuality = 1,
    maxHP2 = 10450,
    physicalAttack = 1045,
    magicAttack = 1045,
    physicalDefence = 1045,
    magicDefence = 1045
    };
getRow(23,2)->
    #pet_starCfg {
    petStar = 23,
    petQuality = 2,
    maxHP2 = 10450,
    physicalAttack = 1045,
    magicAttack = 1045,
    physicalDefence = 1045,
    magicDefence = 1045
    };
getRow(23,3)->
    #pet_starCfg {
    petStar = 23,
    petQuality = 3,
    maxHP2 = 10450,
    physicalAttack = 1045,
    magicAttack = 1045,
    physicalDefence = 1045,
    magicDefence = 1045
    };
getRow(23,4)->
    #pet_starCfg {
    petStar = 23,
    petQuality = 4,
    maxHP2 = 10450,
    physicalAttack = 1045,
    magicAttack = 1045,
    physicalDefence = 1045,
    magicDefence = 1045
    };
getRow(23,5)->
    #pet_starCfg {
    petStar = 23,
    petQuality = 5,
    maxHP2 = 10450,
    physicalAttack = 1045,
    magicAttack = 1045,
    physicalDefence = 1045,
    magicDefence = 1045
    };
getRow(24,0)->
    #pet_starCfg {
    petStar = 24,
    petQuality = 0,
    maxHP2 = 11114,
    physicalAttack = 1111,
    magicAttack = 1111,
    physicalDefence = 1111,
    magicDefence = 1111
    };
getRow(24,1)->
    #pet_starCfg {
    petStar = 24,
    petQuality = 1,
    maxHP2 = 11114,
    physicalAttack = 1111,
    magicAttack = 1111,
    physicalDefence = 1111,
    magicDefence = 1111
    };
getRow(24,2)->
    #pet_starCfg {
    petStar = 24,
    petQuality = 2,
    maxHP2 = 11114,
    physicalAttack = 1111,
    magicAttack = 1111,
    physicalDefence = 1111,
    magicDefence = 1111
    };
getRow(24,3)->
    #pet_starCfg {
    petStar = 24,
    petQuality = 3,
    maxHP2 = 11114,
    physicalAttack = 1111,
    magicAttack = 1111,
    physicalDefence = 1111,
    magicDefence = 1111
    };
getRow(24,4)->
    #pet_starCfg {
    petStar = 24,
    petQuality = 4,
    maxHP2 = 11114,
    physicalAttack = 1111,
    magicAttack = 1111,
    physicalDefence = 1111,
    magicDefence = 1111
    };
getRow(24,5)->
    #pet_starCfg {
    petStar = 24,
    petQuality = 5,
    maxHP2 = 11114,
    physicalAttack = 1111,
    magicAttack = 1111,
    physicalDefence = 1111,
    magicDefence = 1111
    };
getRow(25,0)->
    #pet_starCfg {
    petStar = 25,
    petQuality = 0,
    maxHP2 = 11809,
    physicalAttack = 1181,
    magicAttack = 1181,
    physicalDefence = 1181,
    magicDefence = 1181
    };
getRow(25,1)->
    #pet_starCfg {
    petStar = 25,
    petQuality = 1,
    maxHP2 = 11809,
    physicalAttack = 1181,
    magicAttack = 1181,
    physicalDefence = 1181,
    magicDefence = 1181
    };
getRow(25,2)->
    #pet_starCfg {
    petStar = 25,
    petQuality = 2,
    maxHP2 = 11809,
    physicalAttack = 1181,
    magicAttack = 1181,
    physicalDefence = 1181,
    magicDefence = 1181
    };
getRow(25,3)->
    #pet_starCfg {
    petStar = 25,
    petQuality = 3,
    maxHP2 = 11809,
    physicalAttack = 1181,
    magicAttack = 1181,
    physicalDefence = 1181,
    magicDefence = 1181
    };
getRow(25,4)->
    #pet_starCfg {
    petStar = 25,
    petQuality = 4,
    maxHP2 = 11809,
    physicalAttack = 1181,
    magicAttack = 1181,
    physicalDefence = 1181,
    magicDefence = 1181
    };
getRow(25,5)->
    #pet_starCfg {
    petStar = 25,
    petQuality = 5,
    maxHP2 = 11809,
    physicalAttack = 1181,
    magicAttack = 1181,
    physicalDefence = 1181,
    magicDefence = 1181
    };
getRow(26,0)->
    #pet_starCfg {
    petStar = 26,
    petQuality = 0,
    maxHP2 = 12539,
    physicalAttack = 1254,
    magicAttack = 1254,
    physicalDefence = 1254,
    magicDefence = 1254
    };
getRow(26,1)->
    #pet_starCfg {
    petStar = 26,
    petQuality = 1,
    maxHP2 = 12539,
    physicalAttack = 1254,
    magicAttack = 1254,
    physicalDefence = 1254,
    magicDefence = 1254
    };
getRow(26,2)->
    #pet_starCfg {
    petStar = 26,
    petQuality = 2,
    maxHP2 = 12539,
    physicalAttack = 1254,
    magicAttack = 1254,
    physicalDefence = 1254,
    magicDefence = 1254
    };
getRow(26,3)->
    #pet_starCfg {
    petStar = 26,
    petQuality = 3,
    maxHP2 = 12539,
    physicalAttack = 1254,
    magicAttack = 1254,
    physicalDefence = 1254,
    magicDefence = 1254
    };
getRow(26,4)->
    #pet_starCfg {
    petStar = 26,
    petQuality = 4,
    maxHP2 = 12539,
    physicalAttack = 1254,
    magicAttack = 1254,
    physicalDefence = 1254,
    magicDefence = 1254
    };
getRow(26,5)->
    #pet_starCfg {
    petStar = 26,
    petQuality = 5,
    maxHP2 = 12539,
    physicalAttack = 1254,
    magicAttack = 1254,
    physicalDefence = 1254,
    magicDefence = 1254
    };
getRow(27,0)->
    #pet_starCfg {
    petStar = 27,
    petQuality = 0,
    maxHP2 = 14066,
    physicalAttack = 1407,
    magicAttack = 1407,
    physicalDefence = 1407,
    magicDefence = 1407
    };
getRow(27,1)->
    #pet_starCfg {
    petStar = 27,
    petQuality = 1,
    maxHP2 = 14066,
    physicalAttack = 1407,
    magicAttack = 1407,
    physicalDefence = 1407,
    magicDefence = 1407
    };
getRow(27,2)->
    #pet_starCfg {
    petStar = 27,
    petQuality = 2,
    maxHP2 = 14066,
    physicalAttack = 1407,
    magicAttack = 1407,
    physicalDefence = 1407,
    magicDefence = 1407
    };
getRow(27,3)->
    #pet_starCfg {
    petStar = 27,
    petQuality = 3,
    maxHP2 = 14066,
    physicalAttack = 1407,
    magicAttack = 1407,
    physicalDefence = 1407,
    magicDefence = 1407
    };
getRow(27,4)->
    #pet_starCfg {
    petStar = 27,
    petQuality = 4,
    maxHP2 = 14066,
    physicalAttack = 1407,
    magicAttack = 1407,
    physicalDefence = 1407,
    magicDefence = 1407
    };
getRow(27,5)->
    #pet_starCfg {
    petStar = 27,
    petQuality = 5,
    maxHP2 = 14066,
    physicalAttack = 1407,
    magicAttack = 1407,
    physicalDefence = 1407,
    magicDefence = 1407
    };
getRow(28,0)->
    #pet_starCfg {
    petStar = 28,
    petQuality = 0,
    maxHP2 = 14865,
    physicalAttack = 1486,
    magicAttack = 1486,
    physicalDefence = 1486,
    magicDefence = 1486
    };
getRow(28,1)->
    #pet_starCfg {
    petStar = 28,
    petQuality = 1,
    maxHP2 = 14865,
    physicalAttack = 1486,
    magicAttack = 1486,
    physicalDefence = 1486,
    magicDefence = 1486
    };
getRow(28,2)->
    #pet_starCfg {
    petStar = 28,
    petQuality = 2,
    maxHP2 = 14865,
    physicalAttack = 1486,
    magicAttack = 1486,
    physicalDefence = 1486,
    magicDefence = 1486
    };
getRow(28,3)->
    #pet_starCfg {
    petStar = 28,
    petQuality = 3,
    maxHP2 = 14865,
    physicalAttack = 1486,
    magicAttack = 1486,
    physicalDefence = 1486,
    magicDefence = 1486
    };
getRow(28,4)->
    #pet_starCfg {
    petStar = 28,
    petQuality = 4,
    maxHP2 = 14865,
    physicalAttack = 1486,
    magicAttack = 1486,
    physicalDefence = 1486,
    magicDefence = 1486
    };
getRow(28,5)->
    #pet_starCfg {
    petStar = 28,
    petQuality = 5,
    maxHP2 = 14865,
    physicalAttack = 1486,
    magicAttack = 1486,
    physicalDefence = 1486,
    magicDefence = 1486
    };
getRow(29,0)->
    #pet_starCfg {
    petStar = 29,
    petQuality = 0,
    maxHP2 = 15700,
    physicalAttack = 1570,
    magicAttack = 1570,
    physicalDefence = 1570,
    magicDefence = 1570
    };
getRow(29,1)->
    #pet_starCfg {
    petStar = 29,
    petQuality = 1,
    maxHP2 = 15700,
    physicalAttack = 1570,
    magicAttack = 1570,
    physicalDefence = 1570,
    magicDefence = 1570
    };
getRow(29,2)->
    #pet_starCfg {
    petStar = 29,
    petQuality = 2,
    maxHP2 = 15700,
    physicalAttack = 1570,
    magicAttack = 1570,
    physicalDefence = 1570,
    magicDefence = 1570
    };
getRow(29,3)->
    #pet_starCfg {
    petStar = 29,
    petQuality = 3,
    maxHP2 = 15700,
    physicalAttack = 1570,
    magicAttack = 1570,
    physicalDefence = 1570,
    magicDefence = 1570
    };
getRow(29,4)->
    #pet_starCfg {
    petStar = 29,
    petQuality = 4,
    maxHP2 = 15700,
    physicalAttack = 1570,
    magicAttack = 1570,
    physicalDefence = 1570,
    magicDefence = 1570
    };
getRow(29,5)->
    #pet_starCfg {
    petStar = 29,
    petQuality = 5,
    maxHP2 = 15700,
    physicalAttack = 1570,
    magicAttack = 1570,
    physicalDefence = 1570,
    magicDefence = 1570
    };
getRow(30,0)->
    #pet_starCfg {
    petStar = 30,
    petQuality = 0,
    maxHP2 = 16573,
    physicalAttack = 1657,
    magicAttack = 1657,
    physicalDefence = 1657,
    magicDefence = 1657
    };
getRow(30,1)->
    #pet_starCfg {
    petStar = 30,
    petQuality = 1,
    maxHP2 = 16573,
    physicalAttack = 1657,
    magicAttack = 1657,
    physicalDefence = 1657,
    magicDefence = 1657
    };
getRow(30,2)->
    #pet_starCfg {
    petStar = 30,
    petQuality = 2,
    maxHP2 = 16573,
    physicalAttack = 1657,
    magicAttack = 1657,
    physicalDefence = 1657,
    magicDefence = 1657
    };
getRow(30,3)->
    #pet_starCfg {
    petStar = 30,
    petQuality = 3,
    maxHP2 = 16573,
    physicalAttack = 1657,
    magicAttack = 1657,
    physicalDefence = 1657,
    magicDefence = 1657
    };
getRow(30,4)->
    #pet_starCfg {
    petStar = 30,
    petQuality = 4,
    maxHP2 = 16573,
    physicalAttack = 1657,
    magicAttack = 1657,
    physicalDefence = 1657,
    magicDefence = 1657
    };
getRow(30,5)->
    #pet_starCfg {
    petStar = 30,
    petQuality = 5,
    maxHP2 = 16573,
    physicalAttack = 1657,
    magicAttack = 1657,
    physicalDefence = 1657,
    magicDefence = 1657
    };
getRow(31,0)->
    #pet_starCfg {
    petStar = 31,
    petQuality = 0,
    maxHP2 = 17484,
    physicalAttack = 1748,
    magicAttack = 1748,
    physicalDefence = 1748,
    magicDefence = 1748
    };
getRow(31,1)->
    #pet_starCfg {
    petStar = 31,
    petQuality = 1,
    maxHP2 = 17484,
    physicalAttack = 1748,
    magicAttack = 1748,
    physicalDefence = 1748,
    magicDefence = 1748
    };
getRow(31,2)->
    #pet_starCfg {
    petStar = 31,
    petQuality = 2,
    maxHP2 = 17484,
    physicalAttack = 1748,
    magicAttack = 1748,
    physicalDefence = 1748,
    magicDefence = 1748
    };
getRow(31,3)->
    #pet_starCfg {
    petStar = 31,
    petQuality = 3,
    maxHP2 = 17484,
    physicalAttack = 1748,
    magicAttack = 1748,
    physicalDefence = 1748,
    magicDefence = 1748
    };
getRow(31,4)->
    #pet_starCfg {
    petStar = 31,
    petQuality = 4,
    maxHP2 = 17484,
    physicalAttack = 1748,
    magicAttack = 1748,
    physicalDefence = 1748,
    magicDefence = 1748
    };
getRow(31,5)->
    #pet_starCfg {
    petStar = 31,
    petQuality = 5,
    maxHP2 = 17484,
    physicalAttack = 1748,
    magicAttack = 1748,
    physicalDefence = 1748,
    magicDefence = 1748
    };
getRow(32,0)->
    #pet_starCfg {
    petStar = 32,
    petQuality = 0,
    maxHP2 = 19385,
    physicalAttack = 1939,
    magicAttack = 1939,
    physicalDefence = 1939,
    magicDefence = 1939
    };
getRow(32,1)->
    #pet_starCfg {
    petStar = 32,
    petQuality = 1,
    maxHP2 = 19385,
    physicalAttack = 1939,
    magicAttack = 1939,
    physicalDefence = 1939,
    magicDefence = 1939
    };
getRow(32,2)->
    #pet_starCfg {
    petStar = 32,
    petQuality = 2,
    maxHP2 = 19385,
    physicalAttack = 1939,
    magicAttack = 1939,
    physicalDefence = 1939,
    magicDefence = 1939
    };
getRow(32,3)->
    #pet_starCfg {
    petStar = 32,
    petQuality = 3,
    maxHP2 = 19385,
    physicalAttack = 1939,
    magicAttack = 1939,
    physicalDefence = 1939,
    magicDefence = 1939
    };
getRow(32,4)->
    #pet_starCfg {
    petStar = 32,
    petQuality = 4,
    maxHP2 = 19385,
    physicalAttack = 1939,
    magicAttack = 1939,
    physicalDefence = 1939,
    magicDefence = 1939
    };
getRow(32,5)->
    #pet_starCfg {
    petStar = 32,
    petQuality = 5,
    maxHP2 = 19385,
    physicalAttack = 1939,
    magicAttack = 1939,
    physicalDefence = 1939,
    magicDefence = 1939
    };
getRow(33,0)->
    #pet_starCfg {
    petStar = 33,
    petQuality = 0,
    maxHP2 = 20376,
    physicalAttack = 2038,
    magicAttack = 2038,
    physicalDefence = 2038,
    magicDefence = 2038
    };
getRow(33,1)->
    #pet_starCfg {
    petStar = 33,
    petQuality = 1,
    maxHP2 = 20376,
    physicalAttack = 2038,
    magicAttack = 2038,
    physicalDefence = 2038,
    magicDefence = 2038
    };
getRow(33,2)->
    #pet_starCfg {
    petStar = 33,
    petQuality = 2,
    maxHP2 = 20376,
    physicalAttack = 2038,
    magicAttack = 2038,
    physicalDefence = 2038,
    magicDefence = 2038
    };
getRow(33,3)->
    #pet_starCfg {
    petStar = 33,
    petQuality = 3,
    maxHP2 = 20376,
    physicalAttack = 2038,
    magicAttack = 2038,
    physicalDefence = 2038,
    magicDefence = 2038
    };
getRow(33,4)->
    #pet_starCfg {
    petStar = 33,
    petQuality = 4,
    maxHP2 = 20376,
    physicalAttack = 2038,
    magicAttack = 2038,
    physicalDefence = 2038,
    magicDefence = 2038
    };
getRow(33,5)->
    #pet_starCfg {
    petStar = 33,
    petQuality = 5,
    maxHP2 = 20376,
    physicalAttack = 2038,
    magicAttack = 2038,
    physicalDefence = 2038,
    magicDefence = 2038
    };
getRow(34,0)->
    #pet_starCfg {
    petStar = 34,
    petQuality = 0,
    maxHP2 = 21408,
    physicalAttack = 2141,
    magicAttack = 2141,
    physicalDefence = 2141,
    magicDefence = 2141
    };
getRow(34,1)->
    #pet_starCfg {
    petStar = 34,
    petQuality = 1,
    maxHP2 = 21408,
    physicalAttack = 2141,
    magicAttack = 2141,
    physicalDefence = 2141,
    magicDefence = 2141
    };
getRow(34,2)->
    #pet_starCfg {
    petStar = 34,
    petQuality = 2,
    maxHP2 = 21408,
    physicalAttack = 2141,
    magicAttack = 2141,
    physicalDefence = 2141,
    magicDefence = 2141
    };
getRow(34,3)->
    #pet_starCfg {
    petStar = 34,
    petQuality = 3,
    maxHP2 = 21408,
    physicalAttack = 2141,
    magicAttack = 2141,
    physicalDefence = 2141,
    magicDefence = 2141
    };
getRow(34,4)->
    #pet_starCfg {
    petStar = 34,
    petQuality = 4,
    maxHP2 = 21408,
    physicalAttack = 2141,
    magicAttack = 2141,
    physicalDefence = 2141,
    magicDefence = 2141
    };
getRow(34,5)->
    #pet_starCfg {
    petStar = 34,
    petQuality = 5,
    maxHP2 = 21408,
    physicalAttack = 2141,
    magicAttack = 2141,
    physicalDefence = 2141,
    magicDefence = 2141
    };
getRow(35,0)->
    #pet_starCfg {
    petStar = 35,
    petQuality = 0,
    maxHP2 = 22482,
    physicalAttack = 2248,
    magicAttack = 2248,
    physicalDefence = 2248,
    magicDefence = 2248
    };
getRow(35,1)->
    #pet_starCfg {
    petStar = 35,
    petQuality = 1,
    maxHP2 = 22482,
    physicalAttack = 2248,
    magicAttack = 2248,
    physicalDefence = 2248,
    magicDefence = 2248
    };
getRow(35,2)->
    #pet_starCfg {
    petStar = 35,
    petQuality = 2,
    maxHP2 = 22482,
    physicalAttack = 2248,
    magicAttack = 2248,
    physicalDefence = 2248,
    magicDefence = 2248
    };
getRow(35,3)->
    #pet_starCfg {
    petStar = 35,
    petQuality = 3,
    maxHP2 = 22482,
    physicalAttack = 2248,
    magicAttack = 2248,
    physicalDefence = 2248,
    magicDefence = 2248
    };
getRow(35,4)->
    #pet_starCfg {
    petStar = 35,
    petQuality = 4,
    maxHP2 = 22482,
    physicalAttack = 2248,
    magicAttack = 2248,
    physicalDefence = 2248,
    magicDefence = 2248
    };
getRow(35,5)->
    #pet_starCfg {
    petStar = 35,
    petQuality = 5,
    maxHP2 = 22482,
    physicalAttack = 2248,
    magicAttack = 2248,
    physicalDefence = 2248,
    magicDefence = 2248
    };
getRow(36,0)->
    #pet_starCfg {
    petStar = 36,
    petQuality = 0,
    maxHP2 = 23599,
    physicalAttack = 2360,
    magicAttack = 2360,
    physicalDefence = 2360,
    magicDefence = 2360
    };
getRow(36,1)->
    #pet_starCfg {
    petStar = 36,
    petQuality = 1,
    maxHP2 = 23599,
    physicalAttack = 2360,
    magicAttack = 2360,
    physicalDefence = 2360,
    magicDefence = 2360
    };
getRow(36,2)->
    #pet_starCfg {
    petStar = 36,
    petQuality = 2,
    maxHP2 = 23599,
    physicalAttack = 2360,
    magicAttack = 2360,
    physicalDefence = 2360,
    magicDefence = 2360
    };
getRow(36,3)->
    #pet_starCfg {
    petStar = 36,
    petQuality = 3,
    maxHP2 = 23599,
    physicalAttack = 2360,
    magicAttack = 2360,
    physicalDefence = 2360,
    magicDefence = 2360
    };
getRow(36,4)->
    #pet_starCfg {
    petStar = 36,
    petQuality = 4,
    maxHP2 = 23599,
    physicalAttack = 2360,
    magicAttack = 2360,
    physicalDefence = 2360,
    magicDefence = 2360
    };
getRow(36,5)->
    #pet_starCfg {
    petStar = 36,
    petQuality = 5,
    maxHP2 = 23599,
    physicalAttack = 2360,
    magicAttack = 2360,
    physicalDefence = 2360,
    magicDefence = 2360
    };
getRow(37,0)->
    #pet_starCfg {
    petStar = 37,
    petQuality = 0,
    maxHP2 = 25921,
    physicalAttack = 2592,
    magicAttack = 2592,
    physicalDefence = 2592,
    magicDefence = 2592
    };
getRow(37,1)->
    #pet_starCfg {
    petStar = 37,
    petQuality = 1,
    maxHP2 = 25921,
    physicalAttack = 2592,
    magicAttack = 2592,
    physicalDefence = 2592,
    magicDefence = 2592
    };
getRow(37,2)->
    #pet_starCfg {
    petStar = 37,
    petQuality = 2,
    maxHP2 = 25921,
    physicalAttack = 2592,
    magicAttack = 2592,
    physicalDefence = 2592,
    magicDefence = 2592
    };
getRow(37,3)->
    #pet_starCfg {
    petStar = 37,
    petQuality = 3,
    maxHP2 = 25921,
    physicalAttack = 2592,
    magicAttack = 2592,
    physicalDefence = 2592,
    magicDefence = 2592
    };
getRow(37,4)->
    #pet_starCfg {
    petStar = 37,
    petQuality = 4,
    maxHP2 = 25921,
    physicalAttack = 2592,
    magicAttack = 2592,
    physicalDefence = 2592,
    magicDefence = 2592
    };
getRow(37,5)->
    #pet_starCfg {
    petStar = 37,
    petQuality = 5,
    maxHP2 = 25921,
    physicalAttack = 2592,
    magicAttack = 2592,
    physicalDefence = 2592,
    magicDefence = 2592
    };
getRow(38,0)->
    #pet_starCfg {
    petStar = 38,
    petQuality = 0,
    maxHP2 = 27127,
    physicalAttack = 2713,
    magicAttack = 2713,
    physicalDefence = 2713,
    magicDefence = 2713
    };
getRow(38,1)->
    #pet_starCfg {
    petStar = 38,
    petQuality = 1,
    maxHP2 = 27127,
    physicalAttack = 2713,
    magicAttack = 2713,
    physicalDefence = 2713,
    magicDefence = 2713
    };
getRow(38,2)->
    #pet_starCfg {
    petStar = 38,
    petQuality = 2,
    maxHP2 = 27127,
    physicalAttack = 2713,
    magicAttack = 2713,
    physicalDefence = 2713,
    magicDefence = 2713
    };
getRow(38,3)->
    #pet_starCfg {
    petStar = 38,
    petQuality = 3,
    maxHP2 = 27127,
    physicalAttack = 2713,
    magicAttack = 2713,
    physicalDefence = 2713,
    magicDefence = 2713
    };
getRow(38,4)->
    #pet_starCfg {
    petStar = 38,
    petQuality = 4,
    maxHP2 = 27127,
    physicalAttack = 2713,
    magicAttack = 2713,
    physicalDefence = 2713,
    magicDefence = 2713
    };
getRow(38,5)->
    #pet_starCfg {
    petStar = 38,
    petQuality = 5,
    maxHP2 = 27127,
    physicalAttack = 2713,
    magicAttack = 2713,
    physicalDefence = 2713,
    magicDefence = 2713
    };
getRow(39,0)->
    #pet_starCfg {
    petStar = 39,
    petQuality = 0,
    maxHP2 = 28378,
    physicalAttack = 2838,
    magicAttack = 2838,
    physicalDefence = 2838,
    magicDefence = 2838
    };
getRow(39,1)->
    #pet_starCfg {
    petStar = 39,
    petQuality = 1,
    maxHP2 = 28378,
    physicalAttack = 2838,
    magicAttack = 2838,
    physicalDefence = 2838,
    magicDefence = 2838
    };
getRow(39,2)->
    #pet_starCfg {
    petStar = 39,
    petQuality = 2,
    maxHP2 = 28378,
    physicalAttack = 2838,
    magicAttack = 2838,
    physicalDefence = 2838,
    magicDefence = 2838
    };
getRow(39,3)->
    #pet_starCfg {
    petStar = 39,
    petQuality = 3,
    maxHP2 = 28378,
    physicalAttack = 2838,
    magicAttack = 2838,
    physicalDefence = 2838,
    magicDefence = 2838
    };
getRow(39,4)->
    #pet_starCfg {
    petStar = 39,
    petQuality = 4,
    maxHP2 = 28378,
    physicalAttack = 2838,
    magicAttack = 2838,
    physicalDefence = 2838,
    magicDefence = 2838
    };
getRow(39,5)->
    #pet_starCfg {
    petStar = 39,
    petQuality = 5,
    maxHP2 = 28378,
    physicalAttack = 2838,
    magicAttack = 2838,
    physicalDefence = 2838,
    magicDefence = 2838
    };
getRow(40,0)->
    #pet_starCfg {
    petStar = 40,
    petQuality = 0,
    maxHP2 = 29677,
    physicalAttack = 2968,
    magicAttack = 2968,
    physicalDefence = 2968,
    magicDefence = 2968
    };
getRow(40,1)->
    #pet_starCfg {
    petStar = 40,
    petQuality = 1,
    maxHP2 = 29677,
    physicalAttack = 2968,
    magicAttack = 2968,
    physicalDefence = 2968,
    magicDefence = 2968
    };
getRow(40,2)->
    #pet_starCfg {
    petStar = 40,
    petQuality = 2,
    maxHP2 = 29677,
    physicalAttack = 2968,
    magicAttack = 2968,
    physicalDefence = 2968,
    magicDefence = 2968
    };
getRow(40,3)->
    #pet_starCfg {
    petStar = 40,
    petQuality = 3,
    maxHP2 = 29677,
    physicalAttack = 2968,
    magicAttack = 2968,
    physicalDefence = 2968,
    magicDefence = 2968
    };
getRow(40,4)->
    #pet_starCfg {
    petStar = 40,
    petQuality = 4,
    maxHP2 = 29677,
    physicalAttack = 2968,
    magicAttack = 2968,
    physicalDefence = 2968,
    magicDefence = 2968
    };
getRow(40,5)->
    #pet_starCfg {
    petStar = 40,
    petQuality = 5,
    maxHP2 = 29677,
    physicalAttack = 2968,
    magicAttack = 2968,
    physicalDefence = 2968,
    magicDefence = 2968
    };
getRow(41,0)->
    #pet_starCfg {
    petStar = 41,
    petQuality = 0,
    maxHP2 = 31022,
    physicalAttack = 3102,
    magicAttack = 3102,
    physicalDefence = 3102,
    magicDefence = 3102
    };
getRow(41,1)->
    #pet_starCfg {
    petStar = 41,
    petQuality = 1,
    maxHP2 = 31022,
    physicalAttack = 3102,
    magicAttack = 3102,
    physicalDefence = 3102,
    magicDefence = 3102
    };
getRow(41,2)->
    #pet_starCfg {
    petStar = 41,
    petQuality = 2,
    maxHP2 = 31022,
    physicalAttack = 3102,
    magicAttack = 3102,
    physicalDefence = 3102,
    magicDefence = 3102
    };
getRow(41,3)->
    #pet_starCfg {
    petStar = 41,
    petQuality = 3,
    maxHP2 = 31022,
    physicalAttack = 3102,
    magicAttack = 3102,
    physicalDefence = 3102,
    magicDefence = 3102
    };
getRow(41,4)->
    #pet_starCfg {
    petStar = 41,
    petQuality = 4,
    maxHP2 = 31022,
    physicalAttack = 3102,
    magicAttack = 3102,
    physicalDefence = 3102,
    magicDefence = 3102
    };
getRow(41,5)->
    #pet_starCfg {
    petStar = 41,
    petQuality = 5,
    maxHP2 = 31022,
    physicalAttack = 3102,
    magicAttack = 3102,
    physicalDefence = 3102,
    magicDefence = 3102
    };
getRow(42,0)->
    #pet_starCfg {
    petStar = 42,
    petQuality = 0,
    maxHP2 = 33811,
    physicalAttack = 3381,
    magicAttack = 3381,
    physicalDefence = 3381,
    magicDefence = 3381
    };
getRow(42,1)->
    #pet_starCfg {
    petStar = 42,
    petQuality = 1,
    maxHP2 = 33811,
    physicalAttack = 3381,
    magicAttack = 3381,
    physicalDefence = 3381,
    magicDefence = 3381
    };
getRow(42,2)->
    #pet_starCfg {
    petStar = 42,
    petQuality = 2,
    maxHP2 = 33811,
    physicalAttack = 3381,
    magicAttack = 3381,
    physicalDefence = 3381,
    magicDefence = 3381
    };
getRow(42,3)->
    #pet_starCfg {
    petStar = 42,
    petQuality = 3,
    maxHP2 = 33811,
    physicalAttack = 3381,
    magicAttack = 3381,
    physicalDefence = 3381,
    magicDefence = 3381
    };
getRow(42,4)->
    #pet_starCfg {
    petStar = 42,
    petQuality = 4,
    maxHP2 = 33811,
    physicalAttack = 3381,
    magicAttack = 3381,
    physicalDefence = 3381,
    magicDefence = 3381
    };
getRow(42,5)->
    #pet_starCfg {
    petStar = 42,
    petQuality = 5,
    maxHP2 = 33811,
    physicalAttack = 3381,
    magicAttack = 3381,
    physicalDefence = 3381,
    magicDefence = 3381
    };
getRow(43,0)->
    #pet_starCfg {
    petStar = 43,
    petQuality = 0,
    maxHP2 = 35254,
    physicalAttack = 3525,
    magicAttack = 3525,
    physicalDefence = 3525,
    magicDefence = 3525
    };
getRow(43,1)->
    #pet_starCfg {
    petStar = 43,
    petQuality = 1,
    maxHP2 = 35254,
    physicalAttack = 3525,
    magicAttack = 3525,
    physicalDefence = 3525,
    magicDefence = 3525
    };
getRow(43,2)->
    #pet_starCfg {
    petStar = 43,
    petQuality = 2,
    maxHP2 = 35254,
    physicalAttack = 3525,
    magicAttack = 3525,
    physicalDefence = 3525,
    magicDefence = 3525
    };
getRow(43,3)->
    #pet_starCfg {
    petStar = 43,
    petQuality = 3,
    maxHP2 = 35254,
    physicalAttack = 3525,
    magicAttack = 3525,
    physicalDefence = 3525,
    magicDefence = 3525
    };
getRow(43,4)->
    #pet_starCfg {
    petStar = 43,
    petQuality = 4,
    maxHP2 = 35254,
    physicalAttack = 3525,
    magicAttack = 3525,
    physicalDefence = 3525,
    magicDefence = 3525
    };
getRow(43,5)->
    #pet_starCfg {
    petStar = 43,
    petQuality = 5,
    maxHP2 = 35254,
    physicalAttack = 3525,
    magicAttack = 3525,
    physicalDefence = 3525,
    magicDefence = 3525
    };
getRow(44,0)->
    #pet_starCfg {
    petStar = 44,
    petQuality = 0,
    maxHP2 = 36747,
    physicalAttack = 3675,
    magicAttack = 3675,
    physicalDefence = 3675,
    magicDefence = 3675
    };
getRow(44,1)->
    #pet_starCfg {
    petStar = 44,
    petQuality = 1,
    maxHP2 = 36747,
    physicalAttack = 3675,
    magicAttack = 3675,
    physicalDefence = 3675,
    magicDefence = 3675
    };
getRow(44,2)->
    #pet_starCfg {
    petStar = 44,
    petQuality = 2,
    maxHP2 = 36747,
    physicalAttack = 3675,
    magicAttack = 3675,
    physicalDefence = 3675,
    magicDefence = 3675
    };
getRow(44,3)->
    #pet_starCfg {
    petStar = 44,
    petQuality = 3,
    maxHP2 = 36747,
    physicalAttack = 3675,
    magicAttack = 3675,
    physicalDefence = 3675,
    magicDefence = 3675
    };
getRow(44,4)->
    #pet_starCfg {
    petStar = 44,
    petQuality = 4,
    maxHP2 = 36747,
    physicalAttack = 3675,
    magicAttack = 3675,
    physicalDefence = 3675,
    magicDefence = 3675
    };
getRow(44,5)->
    #pet_starCfg {
    petStar = 44,
    petQuality = 5,
    maxHP2 = 36747,
    physicalAttack = 3675,
    magicAttack = 3675,
    physicalDefence = 3675,
    magicDefence = 3675
    };
getRow(45,0)->
    #pet_starCfg {
    petStar = 45,
    petQuality = 0,
    maxHP2 = 38292,
    physicalAttack = 3829,
    magicAttack = 3829,
    physicalDefence = 3829,
    magicDefence = 3829
    };
getRow(45,1)->
    #pet_starCfg {
    petStar = 45,
    petQuality = 1,
    maxHP2 = 38292,
    physicalAttack = 3829,
    magicAttack = 3829,
    physicalDefence = 3829,
    magicDefence = 3829
    };
getRow(45,2)->
    #pet_starCfg {
    petStar = 45,
    petQuality = 2,
    maxHP2 = 38292,
    physicalAttack = 3829,
    magicAttack = 3829,
    physicalDefence = 3829,
    magicDefence = 3829
    };
getRow(45,3)->
    #pet_starCfg {
    petStar = 45,
    petQuality = 3,
    maxHP2 = 38292,
    physicalAttack = 3829,
    magicAttack = 3829,
    physicalDefence = 3829,
    magicDefence = 3829
    };
getRow(45,4)->
    #pet_starCfg {
    petStar = 45,
    petQuality = 4,
    maxHP2 = 38292,
    physicalAttack = 3829,
    magicAttack = 3829,
    physicalDefence = 3829,
    magicDefence = 3829
    };
getRow(45,5)->
    #pet_starCfg {
    petStar = 45,
    petQuality = 5,
    maxHP2 = 38292,
    physicalAttack = 3829,
    magicAttack = 3829,
    physicalDefence = 3829,
    magicDefence = 3829
    };
getRow(46,0)->
    #pet_starCfg {
    petStar = 46,
    petQuality = 0,
    maxHP2 = 39888,
    physicalAttack = 3989,
    magicAttack = 3989,
    physicalDefence = 3989,
    magicDefence = 3989
    };
getRow(46,1)->
    #pet_starCfg {
    petStar = 46,
    petQuality = 1,
    maxHP2 = 39888,
    physicalAttack = 3989,
    magicAttack = 3989,
    physicalDefence = 3989,
    magicDefence = 3989
    };
getRow(46,2)->
    #pet_starCfg {
    petStar = 46,
    petQuality = 2,
    maxHP2 = 39888,
    physicalAttack = 3989,
    magicAttack = 3989,
    physicalDefence = 3989,
    magicDefence = 3989
    };
getRow(46,3)->
    #pet_starCfg {
    petStar = 46,
    petQuality = 3,
    maxHP2 = 39888,
    physicalAttack = 3989,
    magicAttack = 3989,
    physicalDefence = 3989,
    magicDefence = 3989
    };
getRow(46,4)->
    #pet_starCfg {
    petStar = 46,
    petQuality = 4,
    maxHP2 = 39888,
    physicalAttack = 3989,
    magicAttack = 3989,
    physicalDefence = 3989,
    magicDefence = 3989
    };
getRow(46,5)->
    #pet_starCfg {
    petStar = 46,
    petQuality = 5,
    maxHP2 = 39888,
    physicalAttack = 3989,
    magicAttack = 3989,
    physicalDefence = 3989,
    magicDefence = 3989
    };
getRow(47,0)->
    #pet_starCfg {
    petStar = 47,
    petQuality = 0,
    maxHP2 = 43186,
    physicalAttack = 4319,
    magicAttack = 4319,
    physicalDefence = 4319,
    magicDefence = 4319
    };
getRow(47,1)->
    #pet_starCfg {
    petStar = 47,
    petQuality = 1,
    maxHP2 = 43186,
    physicalAttack = 4319,
    magicAttack = 4319,
    physicalDefence = 4319,
    magicDefence = 4319
    };
getRow(47,2)->
    #pet_starCfg {
    petStar = 47,
    petQuality = 2,
    maxHP2 = 43186,
    physicalAttack = 4319,
    magicAttack = 4319,
    physicalDefence = 4319,
    magicDefence = 4319
    };
getRow(47,3)->
    #pet_starCfg {
    petStar = 47,
    petQuality = 3,
    maxHP2 = 43186,
    physicalAttack = 4319,
    magicAttack = 4319,
    physicalDefence = 4319,
    magicDefence = 4319
    };
getRow(47,4)->
    #pet_starCfg {
    petStar = 47,
    petQuality = 4,
    maxHP2 = 43186,
    physicalAttack = 4319,
    magicAttack = 4319,
    physicalDefence = 4319,
    magicDefence = 4319
    };
getRow(47,5)->
    #pet_starCfg {
    petStar = 47,
    petQuality = 5,
    maxHP2 = 43186,
    physicalAttack = 4319,
    magicAttack = 4319,
    physicalDefence = 4319,
    magicDefence = 4319
    };
getRow(48,0)->
    #pet_starCfg {
    petStar = 48,
    petQuality = 0,
    maxHP2 = 44888,
    physicalAttack = 4489,
    magicAttack = 4489,
    physicalDefence = 4489,
    magicDefence = 4489
    };
getRow(48,1)->
    #pet_starCfg {
    petStar = 48,
    petQuality = 1,
    maxHP2 = 44888,
    physicalAttack = 4489,
    magicAttack = 4489,
    physicalDefence = 4489,
    magicDefence = 4489
    };
getRow(48,2)->
    #pet_starCfg {
    petStar = 48,
    petQuality = 2,
    maxHP2 = 44888,
    physicalAttack = 4489,
    magicAttack = 4489,
    physicalDefence = 4489,
    magicDefence = 4489
    };
getRow(48,3)->
    #pet_starCfg {
    petStar = 48,
    petQuality = 3,
    maxHP2 = 44888,
    physicalAttack = 4489,
    magicAttack = 4489,
    physicalDefence = 4489,
    magicDefence = 4489
    };
getRow(48,4)->
    #pet_starCfg {
    petStar = 48,
    petQuality = 4,
    maxHP2 = 44888,
    physicalAttack = 4489,
    magicAttack = 4489,
    physicalDefence = 4489,
    magicDefence = 4489
    };
getRow(48,5)->
    #pet_starCfg {
    petStar = 48,
    petQuality = 5,
    maxHP2 = 44888,
    physicalAttack = 4489,
    magicAttack = 4489,
    physicalDefence = 4489,
    magicDefence = 4489
    };
getRow(49,0)->
    #pet_starCfg {
    petStar = 49,
    petQuality = 0,
    maxHP2 = 46645,
    physicalAttack = 4664,
    magicAttack = 4664,
    physicalDefence = 4664,
    magicDefence = 4664
    };
getRow(49,1)->
    #pet_starCfg {
    petStar = 49,
    petQuality = 1,
    maxHP2 = 46645,
    physicalAttack = 4664,
    magicAttack = 4664,
    physicalDefence = 4664,
    magicDefence = 4664
    };
getRow(49,2)->
    #pet_starCfg {
    petStar = 49,
    petQuality = 2,
    maxHP2 = 46645,
    physicalAttack = 4664,
    magicAttack = 4664,
    physicalDefence = 4664,
    magicDefence = 4664
    };
getRow(49,3)->
    #pet_starCfg {
    petStar = 49,
    petQuality = 3,
    maxHP2 = 46645,
    physicalAttack = 4664,
    magicAttack = 4664,
    physicalDefence = 4664,
    magicDefence = 4664
    };
getRow(49,4)->
    #pet_starCfg {
    petStar = 49,
    petQuality = 4,
    maxHP2 = 46645,
    physicalAttack = 4664,
    magicAttack = 4664,
    physicalDefence = 4664,
    magicDefence = 4664
    };
getRow(49,5)->
    #pet_starCfg {
    petStar = 49,
    petQuality = 5,
    maxHP2 = 46645,
    physicalAttack = 4664,
    magicAttack = 4664,
    physicalDefence = 4664,
    magicDefence = 4664
    };
getRow(50,0)->
    #pet_starCfg {
    petStar = 50,
    petQuality = 0,
    maxHP2 = 48456,
    physicalAttack = 4846,
    magicAttack = 4846,
    physicalDefence = 4846,
    magicDefence = 4846
    };
getRow(50,1)->
    #pet_starCfg {
    petStar = 50,
    petQuality = 1,
    maxHP2 = 48456,
    physicalAttack = 4846,
    magicAttack = 4846,
    physicalDefence = 4846,
    magicDefence = 4846
    };
getRow(50,2)->
    #pet_starCfg {
    petStar = 50,
    petQuality = 2,
    maxHP2 = 48456,
    physicalAttack = 4846,
    magicAttack = 4846,
    physicalDefence = 4846,
    magicDefence = 4846
    };
getRow(50,3)->
    #pet_starCfg {
    petStar = 50,
    petQuality = 3,
    maxHP2 = 48456,
    physicalAttack = 4846,
    magicAttack = 4846,
    physicalDefence = 4846,
    magicDefence = 4846
    };
getRow(50,4)->
    #pet_starCfg {
    petStar = 50,
    petQuality = 4,
    maxHP2 = 48456,
    physicalAttack = 4846,
    magicAttack = 4846,
    physicalDefence = 4846,
    magicDefence = 4846
    };
getRow(50,5)->
    #pet_starCfg {
    petStar = 50,
    petQuality = 5,
    maxHP2 = 48456,
    physicalAttack = 4846,
    magicAttack = 4846,
    physicalDefence = 4846,
    magicDefence = 4846
    };
getRow(51,0)->
    #pet_starCfg {
    petStar = 51,
    petQuality = 0,
    maxHP2 = 50324,
    physicalAttack = 5032,
    magicAttack = 5032,
    physicalDefence = 5032,
    magicDefence = 5032
    };
getRow(51,1)->
    #pet_starCfg {
    petStar = 51,
    petQuality = 1,
    maxHP2 = 50324,
    physicalAttack = 5032,
    magicAttack = 5032,
    physicalDefence = 5032,
    magicDefence = 5032
    };
getRow(51,2)->
    #pet_starCfg {
    petStar = 51,
    petQuality = 2,
    maxHP2 = 50324,
    physicalAttack = 5032,
    magicAttack = 5032,
    physicalDefence = 5032,
    magicDefence = 5032
    };
getRow(51,3)->
    #pet_starCfg {
    petStar = 51,
    petQuality = 3,
    maxHP2 = 50324,
    physicalAttack = 5032,
    magicAttack = 5032,
    physicalDefence = 5032,
    magicDefence = 5032
    };
getRow(51,4)->
    #pet_starCfg {
    petStar = 51,
    petQuality = 4,
    maxHP2 = 50324,
    physicalAttack = 5032,
    magicAttack = 5032,
    physicalDefence = 5032,
    magicDefence = 5032
    };
getRow(51,5)->
    #pet_starCfg {
    petStar = 51,
    petQuality = 5,
    maxHP2 = 50324,
    physicalAttack = 5032,
    magicAttack = 5032,
    physicalDefence = 5032,
    magicDefence = 5032
    };
getRow(52,0)->
    #pet_starCfg {
    petStar = 52,
    petQuality = 0,
    maxHP2 = 54173,
    physicalAttack = 5417,
    magicAttack = 5417,
    physicalDefence = 5417,
    magicDefence = 5417
    };
getRow(52,1)->
    #pet_starCfg {
    petStar = 52,
    petQuality = 1,
    maxHP2 = 54173,
    physicalAttack = 5417,
    magicAttack = 5417,
    physicalDefence = 5417,
    magicDefence = 5417
    };
getRow(52,2)->
    #pet_starCfg {
    petStar = 52,
    petQuality = 2,
    maxHP2 = 54173,
    physicalAttack = 5417,
    magicAttack = 5417,
    physicalDefence = 5417,
    magicDefence = 5417
    };
getRow(52,3)->
    #pet_starCfg {
    petStar = 52,
    petQuality = 3,
    maxHP2 = 54173,
    physicalAttack = 5417,
    magicAttack = 5417,
    physicalDefence = 5417,
    magicDefence = 5417
    };
getRow(52,4)->
    #pet_starCfg {
    petStar = 52,
    petQuality = 4,
    maxHP2 = 54173,
    physicalAttack = 5417,
    magicAttack = 5417,
    physicalDefence = 5417,
    magicDefence = 5417
    };
getRow(52,5)->
    #pet_starCfg {
    petStar = 52,
    petQuality = 5,
    maxHP2 = 54173,
    physicalAttack = 5417,
    magicAttack = 5417,
    physicalDefence = 5417,
    magicDefence = 5417
    };
getRow(53,0)->
    #pet_starCfg {
    petStar = 53,
    petQuality = 0,
    maxHP2 = 56155,
    physicalAttack = 5616,
    magicAttack = 5616,
    physicalDefence = 5616,
    magicDefence = 5616
    };
getRow(53,1)->
    #pet_starCfg {
    petStar = 53,
    petQuality = 1,
    maxHP2 = 56155,
    physicalAttack = 5616,
    magicAttack = 5616,
    physicalDefence = 5616,
    magicDefence = 5616
    };
getRow(53,2)->
    #pet_starCfg {
    petStar = 53,
    petQuality = 2,
    maxHP2 = 56155,
    physicalAttack = 5616,
    magicAttack = 5616,
    physicalDefence = 5616,
    magicDefence = 5616
    };
getRow(53,3)->
    #pet_starCfg {
    petStar = 53,
    petQuality = 3,
    maxHP2 = 56155,
    physicalAttack = 5616,
    magicAttack = 5616,
    physicalDefence = 5616,
    magicDefence = 5616
    };
getRow(53,4)->
    #pet_starCfg {
    petStar = 53,
    petQuality = 4,
    maxHP2 = 56155,
    physicalAttack = 5616,
    magicAttack = 5616,
    physicalDefence = 5616,
    magicDefence = 5616
    };
getRow(53,5)->
    #pet_starCfg {
    petStar = 53,
    petQuality = 5,
    maxHP2 = 56155,
    physicalAttack = 5616,
    magicAttack = 5616,
    physicalDefence = 5616,
    magicDefence = 5616
    };
getRow(54,0)->
    #pet_starCfg {
    petStar = 54,
    petQuality = 0,
    maxHP2 = 58195,
    physicalAttack = 5820,
    magicAttack = 5820,
    physicalDefence = 5820,
    magicDefence = 5820
    };
getRow(54,1)->
    #pet_starCfg {
    petStar = 54,
    petQuality = 1,
    maxHP2 = 58195,
    physicalAttack = 5820,
    magicAttack = 5820,
    physicalDefence = 5820,
    magicDefence = 5820
    };
getRow(54,2)->
    #pet_starCfg {
    petStar = 54,
    petQuality = 2,
    maxHP2 = 58195,
    physicalAttack = 5820,
    magicAttack = 5820,
    physicalDefence = 5820,
    magicDefence = 5820
    };
getRow(54,3)->
    #pet_starCfg {
    petStar = 54,
    petQuality = 3,
    maxHP2 = 58195,
    physicalAttack = 5820,
    magicAttack = 5820,
    physicalDefence = 5820,
    magicDefence = 5820
    };
getRow(54,4)->
    #pet_starCfg {
    petStar = 54,
    petQuality = 4,
    maxHP2 = 58195,
    physicalAttack = 5820,
    magicAttack = 5820,
    physicalDefence = 5820,
    magicDefence = 5820
    };
getRow(54,5)->
    #pet_starCfg {
    petStar = 54,
    petQuality = 5,
    maxHP2 = 58195,
    physicalAttack = 5820,
    magicAttack = 5820,
    physicalDefence = 5820,
    magicDefence = 5820
    };
getRow(55,0)->
    #pet_starCfg {
    petStar = 55,
    petQuality = 0,
    maxHP2 = 60295,
    physicalAttack = 6029,
    magicAttack = 6029,
    physicalDefence = 6029,
    magicDefence = 6029
    };
getRow(55,1)->
    #pet_starCfg {
    petStar = 55,
    petQuality = 1,
    maxHP2 = 60295,
    physicalAttack = 6029,
    magicAttack = 6029,
    physicalDefence = 6029,
    magicDefence = 6029
    };
getRow(55,2)->
    #pet_starCfg {
    petStar = 55,
    petQuality = 2,
    maxHP2 = 60295,
    physicalAttack = 6029,
    magicAttack = 6029,
    physicalDefence = 6029,
    magicDefence = 6029
    };
getRow(55,3)->
    #pet_starCfg {
    petStar = 55,
    petQuality = 3,
    maxHP2 = 60295,
    physicalAttack = 6029,
    magicAttack = 6029,
    physicalDefence = 6029,
    magicDefence = 6029
    };
getRow(55,4)->
    #pet_starCfg {
    petStar = 55,
    petQuality = 4,
    maxHP2 = 60295,
    physicalAttack = 6029,
    magicAttack = 6029,
    physicalDefence = 6029,
    magicDefence = 6029
    };
getRow(55,5)->
    #pet_starCfg {
    petStar = 55,
    petQuality = 5,
    maxHP2 = 60295,
    physicalAttack = 6029,
    magicAttack = 6029,
    physicalDefence = 6029,
    magicDefence = 6029
    };
getRow(56,0)->
    #pet_starCfg {
    petStar = 56,
    petQuality = 0,
    maxHP2 = 62454,
    physicalAttack = 6245,
    magicAttack = 6245,
    physicalDefence = 6245,
    magicDefence = 6245
    };
getRow(56,1)->
    #pet_starCfg {
    petStar = 56,
    petQuality = 1,
    maxHP2 = 62454,
    physicalAttack = 6245,
    magicAttack = 6245,
    physicalDefence = 6245,
    magicDefence = 6245
    };
getRow(56,2)->
    #pet_starCfg {
    petStar = 56,
    petQuality = 2,
    maxHP2 = 62454,
    physicalAttack = 6245,
    magicAttack = 6245,
    physicalDefence = 6245,
    magicDefence = 6245
    };
getRow(56,3)->
    #pet_starCfg {
    petStar = 56,
    petQuality = 3,
    maxHP2 = 62454,
    physicalAttack = 6245,
    magicAttack = 6245,
    physicalDefence = 6245,
    magicDefence = 6245
    };
getRow(56,4)->
    #pet_starCfg {
    petStar = 56,
    petQuality = 4,
    maxHP2 = 62454,
    physicalAttack = 6245,
    magicAttack = 6245,
    physicalDefence = 6245,
    magicDefence = 6245
    };
getRow(56,5)->
    #pet_starCfg {
    petStar = 56,
    petQuality = 5,
    maxHP2 = 62454,
    physicalAttack = 6245,
    magicAttack = 6245,
    physicalDefence = 6245,
    magicDefence = 6245
    };
getRow(57,0)->
    #pet_starCfg {
    petStar = 57,
    petQuality = 0,
    maxHP2 = 66895,
    physicalAttack = 6689,
    magicAttack = 6689,
    physicalDefence = 6689,
    magicDefence = 6689
    };
getRow(57,1)->
    #pet_starCfg {
    petStar = 57,
    petQuality = 1,
    maxHP2 = 66895,
    physicalAttack = 6689,
    magicAttack = 6689,
    physicalDefence = 6689,
    magicDefence = 6689
    };
getRow(57,2)->
    #pet_starCfg {
    petStar = 57,
    petQuality = 2,
    maxHP2 = 66895,
    physicalAttack = 6689,
    magicAttack = 6689,
    physicalDefence = 6689,
    magicDefence = 6689
    };
getRow(57,3)->
    #pet_starCfg {
    petStar = 57,
    petQuality = 3,
    maxHP2 = 66895,
    physicalAttack = 6689,
    magicAttack = 6689,
    physicalDefence = 6689,
    magicDefence = 6689
    };
getRow(57,4)->
    #pet_starCfg {
    petStar = 57,
    petQuality = 4,
    maxHP2 = 66895,
    physicalAttack = 6689,
    magicAttack = 6689,
    physicalDefence = 6689,
    magicDefence = 6689
    };
getRow(57,5)->
    #pet_starCfg {
    petStar = 57,
    petQuality = 5,
    maxHP2 = 66895,
    physicalAttack = 6689,
    magicAttack = 6689,
    physicalDefence = 6689,
    magicDefence = 6689
    };
getRow(58,0)->
    #pet_starCfg {
    petStar = 58,
    petQuality = 0,
    maxHP2 = 69177,
    physicalAttack = 6918,
    magicAttack = 6918,
    physicalDefence = 6918,
    magicDefence = 6918
    };
getRow(58,1)->
    #pet_starCfg {
    petStar = 58,
    petQuality = 1,
    maxHP2 = 69177,
    physicalAttack = 6918,
    magicAttack = 6918,
    physicalDefence = 6918,
    magicDefence = 6918
    };
getRow(58,2)->
    #pet_starCfg {
    petStar = 58,
    petQuality = 2,
    maxHP2 = 69177,
    physicalAttack = 6918,
    magicAttack = 6918,
    physicalDefence = 6918,
    magicDefence = 6918
    };
getRow(58,3)->
    #pet_starCfg {
    petStar = 58,
    petQuality = 3,
    maxHP2 = 69177,
    physicalAttack = 6918,
    magicAttack = 6918,
    physicalDefence = 6918,
    magicDefence = 6918
    };
getRow(58,4)->
    #pet_starCfg {
    petStar = 58,
    petQuality = 4,
    maxHP2 = 69177,
    physicalAttack = 6918,
    magicAttack = 6918,
    physicalDefence = 6918,
    magicDefence = 6918
    };
getRow(58,5)->
    #pet_starCfg {
    petStar = 58,
    petQuality = 5,
    maxHP2 = 69177,
    physicalAttack = 6918,
    magicAttack = 6918,
    physicalDefence = 6918,
    magicDefence = 6918
    };
getRow(59,0)->
    #pet_starCfg {
    petStar = 59,
    petQuality = 0,
    maxHP2 = 71521,
    physicalAttack = 7152,
    magicAttack = 7152,
    physicalDefence = 7152,
    magicDefence = 7152
    };
getRow(59,1)->
    #pet_starCfg {
    petStar = 59,
    petQuality = 1,
    maxHP2 = 71521,
    physicalAttack = 7152,
    magicAttack = 7152,
    physicalDefence = 7152,
    magicDefence = 7152
    };
getRow(59,2)->
    #pet_starCfg {
    petStar = 59,
    petQuality = 2,
    maxHP2 = 71521,
    physicalAttack = 7152,
    magicAttack = 7152,
    physicalDefence = 7152,
    magicDefence = 7152
    };
getRow(59,3)->
    #pet_starCfg {
    petStar = 59,
    petQuality = 3,
    maxHP2 = 71521,
    physicalAttack = 7152,
    magicAttack = 7152,
    physicalDefence = 7152,
    magicDefence = 7152
    };
getRow(59,4)->
    #pet_starCfg {
    petStar = 59,
    petQuality = 4,
    maxHP2 = 71521,
    physicalAttack = 7152,
    magicAttack = 7152,
    physicalDefence = 7152,
    magicDefence = 7152
    };
getRow(59,5)->
    #pet_starCfg {
    petStar = 59,
    petQuality = 5,
    maxHP2 = 71521,
    physicalAttack = 7152,
    magicAttack = 7152,
    physicalDefence = 7152,
    magicDefence = 7152
    };
getRow(60,0)->
    #pet_starCfg {
    petStar = 60,
    petQuality = 0,
    maxHP2 = 73928,
    physicalAttack = 7393,
    magicAttack = 7393,
    physicalDefence = 7393,
    magicDefence = 7393
    };
getRow(60,1)->
    #pet_starCfg {
    petStar = 60,
    petQuality = 1,
    maxHP2 = 73928,
    physicalAttack = 7393,
    magicAttack = 7393,
    physicalDefence = 7393,
    magicDefence = 7393
    };
getRow(60,2)->
    #pet_starCfg {
    petStar = 60,
    petQuality = 2,
    maxHP2 = 73928,
    physicalAttack = 7393,
    magicAttack = 7393,
    physicalDefence = 7393,
    magicDefence = 7393
    };
getRow(60,3)->
    #pet_starCfg {
    petStar = 60,
    petQuality = 3,
    maxHP2 = 73928,
    physicalAttack = 7393,
    magicAttack = 7393,
    physicalDefence = 7393,
    magicDefence = 7393
    };
getRow(60,4)->
    #pet_starCfg {
    petStar = 60,
    petQuality = 4,
    maxHP2 = 73928,
    physicalAttack = 7393,
    magicAttack = 7393,
    physicalDefence = 7393,
    magicDefence = 7393
    };
getRow(60,5)->
    #pet_starCfg {
    petStar = 60,
    petQuality = 5,
    maxHP2 = 73928,
    physicalAttack = 7393,
    magicAttack = 7393,
    physicalDefence = 7393,
    magicDefence = 7393
    };
getRow(61,0)->
    #pet_starCfg {
    petStar = 61,
    petQuality = 0,
    maxHP2 = 76399,
    physicalAttack = 7640,
    magicAttack = 7640,
    physicalDefence = 7640,
    magicDefence = 7640
    };
getRow(61,1)->
    #pet_starCfg {
    petStar = 61,
    petQuality = 1,
    maxHP2 = 76399,
    physicalAttack = 7640,
    magicAttack = 7640,
    physicalDefence = 7640,
    magicDefence = 7640
    };
getRow(61,2)->
    #pet_starCfg {
    petStar = 61,
    petQuality = 2,
    maxHP2 = 76399,
    physicalAttack = 7640,
    magicAttack = 7640,
    physicalDefence = 7640,
    magicDefence = 7640
    };
getRow(61,3)->
    #pet_starCfg {
    petStar = 61,
    petQuality = 3,
    maxHP2 = 76399,
    physicalAttack = 7640,
    magicAttack = 7640,
    physicalDefence = 7640,
    magicDefence = 7640
    };
getRow(61,4)->
    #pet_starCfg {
    petStar = 61,
    petQuality = 4,
    maxHP2 = 76399,
    physicalAttack = 7640,
    magicAttack = 7640,
    physicalDefence = 7640,
    magicDefence = 7640
    };
getRow(61,5)->
    #pet_starCfg {
    petStar = 61,
    petQuality = 5,
    maxHP2 = 76399,
    physicalAttack = 7640,
    magicAttack = 7640,
    physicalDefence = 7640,
    magicDefence = 7640
    };
getRow(62,0)->
    #pet_starCfg {
    petStar = 62,
    petQuality = 0,
    maxHP2 = 81471,
    physicalAttack = 8147,
    magicAttack = 8147,
    physicalDefence = 8147,
    magicDefence = 8147
    };
getRow(62,1)->
    #pet_starCfg {
    petStar = 62,
    petQuality = 1,
    maxHP2 = 81471,
    physicalAttack = 8147,
    magicAttack = 8147,
    physicalDefence = 8147,
    magicDefence = 8147
    };
getRow(62,2)->
    #pet_starCfg {
    petStar = 62,
    petQuality = 2,
    maxHP2 = 81471,
    physicalAttack = 8147,
    magicAttack = 8147,
    physicalDefence = 8147,
    magicDefence = 8147
    };
getRow(62,3)->
    #pet_starCfg {
    petStar = 62,
    petQuality = 3,
    maxHP2 = 81471,
    physicalAttack = 8147,
    magicAttack = 8147,
    physicalDefence = 8147,
    magicDefence = 8147
    };
getRow(62,4)->
    #pet_starCfg {
    petStar = 62,
    petQuality = 4,
    maxHP2 = 81471,
    physicalAttack = 8147,
    magicAttack = 8147,
    physicalDefence = 8147,
    magicDefence = 8147
    };
getRow(62,5)->
    #pet_starCfg {
    petStar = 62,
    petQuality = 5,
    maxHP2 = 81471,
    physicalAttack = 8147,
    magicAttack = 8147,
    physicalDefence = 8147,
    magicDefence = 8147
    };
getRow(63,0)->
    #pet_starCfg {
    petStar = 63,
    petQuality = 0,
    maxHP2 = 84072,
    physicalAttack = 8407,
    magicAttack = 8407,
    physicalDefence = 8407,
    magicDefence = 8407
    };
getRow(63,1)->
    #pet_starCfg {
    petStar = 63,
    petQuality = 1,
    maxHP2 = 84072,
    physicalAttack = 8407,
    magicAttack = 8407,
    physicalDefence = 8407,
    magicDefence = 8407
    };
getRow(63,2)->
    #pet_starCfg {
    petStar = 63,
    petQuality = 2,
    maxHP2 = 84072,
    physicalAttack = 8407,
    magicAttack = 8407,
    physicalDefence = 8407,
    magicDefence = 8407
    };
getRow(63,3)->
    #pet_starCfg {
    petStar = 63,
    petQuality = 3,
    maxHP2 = 84072,
    physicalAttack = 8407,
    magicAttack = 8407,
    physicalDefence = 8407,
    magicDefence = 8407
    };
getRow(63,4)->
    #pet_starCfg {
    petStar = 63,
    petQuality = 4,
    maxHP2 = 84072,
    physicalAttack = 8407,
    magicAttack = 8407,
    physicalDefence = 8407,
    magicDefence = 8407
    };
getRow(63,5)->
    #pet_starCfg {
    petStar = 63,
    petQuality = 5,
    maxHP2 = 84072,
    physicalAttack = 8407,
    magicAttack = 8407,
    physicalDefence = 8407,
    magicDefence = 8407
    };
getRow(64,0)->
    #pet_starCfg {
    petStar = 64,
    petQuality = 0,
    maxHP2 = 86739,
    physicalAttack = 8674,
    magicAttack = 8674,
    physicalDefence = 8674,
    magicDefence = 8674
    };
getRow(64,1)->
    #pet_starCfg {
    petStar = 64,
    petQuality = 1,
    maxHP2 = 86739,
    physicalAttack = 8674,
    magicAttack = 8674,
    physicalDefence = 8674,
    magicDefence = 8674
    };
getRow(64,2)->
    #pet_starCfg {
    petStar = 64,
    petQuality = 2,
    maxHP2 = 86739,
    physicalAttack = 8674,
    magicAttack = 8674,
    physicalDefence = 8674,
    magicDefence = 8674
    };
getRow(64,3)->
    #pet_starCfg {
    petStar = 64,
    petQuality = 3,
    maxHP2 = 86739,
    physicalAttack = 8674,
    magicAttack = 8674,
    physicalDefence = 8674,
    magicDefence = 8674
    };
getRow(64,4)->
    #pet_starCfg {
    petStar = 64,
    petQuality = 4,
    maxHP2 = 86739,
    physicalAttack = 8674,
    magicAttack = 8674,
    physicalDefence = 8674,
    magicDefence = 8674
    };
getRow(64,5)->
    #pet_starCfg {
    petStar = 64,
    petQuality = 5,
    maxHP2 = 86739,
    physicalAttack = 8674,
    magicAttack = 8674,
    physicalDefence = 8674,
    magicDefence = 8674
    };
getRow(65,0)->
    #pet_starCfg {
    petStar = 65,
    petQuality = 0,
    maxHP2 = 89473,
    physicalAttack = 8947,
    magicAttack = 8947,
    physicalDefence = 8947,
    magicDefence = 8947
    };
getRow(65,1)->
    #pet_starCfg {
    petStar = 65,
    petQuality = 1,
    maxHP2 = 89473,
    physicalAttack = 8947,
    magicAttack = 8947,
    physicalDefence = 8947,
    magicDefence = 8947
    };
getRow(65,2)->
    #pet_starCfg {
    petStar = 65,
    petQuality = 2,
    maxHP2 = 89473,
    physicalAttack = 8947,
    magicAttack = 8947,
    physicalDefence = 8947,
    magicDefence = 8947
    };
getRow(65,3)->
    #pet_starCfg {
    petStar = 65,
    petQuality = 3,
    maxHP2 = 89473,
    physicalAttack = 8947,
    magicAttack = 8947,
    physicalDefence = 8947,
    magicDefence = 8947
    };
getRow(65,4)->
    #pet_starCfg {
    petStar = 65,
    petQuality = 4,
    maxHP2 = 89473,
    physicalAttack = 8947,
    magicAttack = 8947,
    physicalDefence = 8947,
    magicDefence = 8947
    };
getRow(65,5)->
    #pet_starCfg {
    petStar = 65,
    petQuality = 5,
    maxHP2 = 89473,
    physicalAttack = 8947,
    magicAttack = 8947,
    physicalDefence = 8947,
    magicDefence = 8947
    };
getRow(66,0)->
    #pet_starCfg {
    petStar = 66,
    petQuality = 0,
    maxHP2 = 92275,
    physicalAttack = 9227,
    magicAttack = 9227,
    physicalDefence = 9227,
    magicDefence = 9227
    };
getRow(66,1)->
    #pet_starCfg {
    petStar = 66,
    petQuality = 1,
    maxHP2 = 92275,
    physicalAttack = 9227,
    magicAttack = 9227,
    physicalDefence = 9227,
    magicDefence = 9227
    };
getRow(66,2)->
    #pet_starCfg {
    petStar = 66,
    petQuality = 2,
    maxHP2 = 92275,
    physicalAttack = 9227,
    magicAttack = 9227,
    physicalDefence = 9227,
    magicDefence = 9227
    };
getRow(66,3)->
    #pet_starCfg {
    petStar = 66,
    petQuality = 3,
    maxHP2 = 92275,
    physicalAttack = 9227,
    magicAttack = 9227,
    physicalDefence = 9227,
    magicDefence = 9227
    };
getRow(66,4)->
    #pet_starCfg {
    petStar = 66,
    petQuality = 4,
    maxHP2 = 92275,
    physicalAttack = 9227,
    magicAttack = 9227,
    physicalDefence = 9227,
    magicDefence = 9227
    };
getRow(66,5)->
    #pet_starCfg {
    petStar = 66,
    petQuality = 5,
    maxHP2 = 92275,
    physicalAttack = 9227,
    magicAttack = 9227,
    physicalDefence = 9227,
    magicDefence = 9227
    };
getRow(67,0)->
    #pet_starCfg {
    petStar = 67,
    petQuality = 0,
    maxHP2 = 98015,
    physicalAttack = 9802,
    magicAttack = 9802,
    physicalDefence = 9802,
    magicDefence = 9802
    };
getRow(67,1)->
    #pet_starCfg {
    petStar = 67,
    petQuality = 1,
    maxHP2 = 98015,
    physicalAttack = 9802,
    magicAttack = 9802,
    physicalDefence = 9802,
    magicDefence = 9802
    };
getRow(67,2)->
    #pet_starCfg {
    petStar = 67,
    petQuality = 2,
    maxHP2 = 98015,
    physicalAttack = 9802,
    magicAttack = 9802,
    physicalDefence = 9802,
    magicDefence = 9802
    };
getRow(67,3)->
    #pet_starCfg {
    petStar = 67,
    petQuality = 3,
    maxHP2 = 98015,
    physicalAttack = 9802,
    magicAttack = 9802,
    physicalDefence = 9802,
    magicDefence = 9802
    };
getRow(67,4)->
    #pet_starCfg {
    petStar = 67,
    petQuality = 4,
    maxHP2 = 98015,
    physicalAttack = 9802,
    magicAttack = 9802,
    physicalDefence = 9802,
    magicDefence = 9802
    };
getRow(67,5)->
    #pet_starCfg {
    petStar = 67,
    petQuality = 5,
    maxHP2 = 98015,
    physicalAttack = 9802,
    magicAttack = 9802,
    physicalDefence = 9802,
    magicDefence = 9802
    };
getRow(68,0)->
    #pet_starCfg {
    petStar = 68,
    petQuality = 0,
    maxHP2 = 100955,
    physicalAttack = 10095,
    magicAttack = 10095,
    physicalDefence = 10095,
    magicDefence = 10095
    };
getRow(68,1)->
    #pet_starCfg {
    petStar = 68,
    petQuality = 1,
    maxHP2 = 100955,
    physicalAttack = 10095,
    magicAttack = 10095,
    physicalDefence = 10095,
    magicDefence = 10095
    };
getRow(68,2)->
    #pet_starCfg {
    petStar = 68,
    petQuality = 2,
    maxHP2 = 100955,
    physicalAttack = 10095,
    magicAttack = 10095,
    physicalDefence = 10095,
    magicDefence = 10095
    };
getRow(68,3)->
    #pet_starCfg {
    petStar = 68,
    petQuality = 3,
    maxHP2 = 100955,
    physicalAttack = 10095,
    magicAttack = 10095,
    physicalDefence = 10095,
    magicDefence = 10095
    };
getRow(68,4)->
    #pet_starCfg {
    petStar = 68,
    petQuality = 4,
    maxHP2 = 100955,
    physicalAttack = 10095,
    magicAttack = 10095,
    physicalDefence = 10095,
    magicDefence = 10095
    };
getRow(68,5)->
    #pet_starCfg {
    petStar = 68,
    petQuality = 5,
    maxHP2 = 100955,
    physicalAttack = 10095,
    magicAttack = 10095,
    physicalDefence = 10095,
    magicDefence = 10095
    };
getRow(69,0)->
    #pet_starCfg {
    petStar = 69,
    petQuality = 0,
    maxHP2 = 103964,
    physicalAttack = 10396,
    magicAttack = 10396,
    physicalDefence = 10396,
    magicDefence = 10396
    };
getRow(69,1)->
    #pet_starCfg {
    petStar = 69,
    petQuality = 1,
    maxHP2 = 103964,
    physicalAttack = 10396,
    magicAttack = 10396,
    physicalDefence = 10396,
    magicDefence = 10396
    };
getRow(69,2)->
    #pet_starCfg {
    petStar = 69,
    petQuality = 2,
    maxHP2 = 103964,
    physicalAttack = 10396,
    magicAttack = 10396,
    physicalDefence = 10396,
    magicDefence = 10396
    };
getRow(69,3)->
    #pet_starCfg {
    petStar = 69,
    petQuality = 3,
    maxHP2 = 103964,
    physicalAttack = 10396,
    magicAttack = 10396,
    physicalDefence = 10396,
    magicDefence = 10396
    };
getRow(69,4)->
    #pet_starCfg {
    petStar = 69,
    petQuality = 4,
    maxHP2 = 103964,
    physicalAttack = 10396,
    magicAttack = 10396,
    physicalDefence = 10396,
    magicDefence = 10396
    };
getRow(69,5)->
    #pet_starCfg {
    petStar = 69,
    petQuality = 5,
    maxHP2 = 103964,
    physicalAttack = 10396,
    magicAttack = 10396,
    physicalDefence = 10396,
    magicDefence = 10396
    };
getRow(70,0)->
    #pet_starCfg {
    petStar = 70,
    petQuality = 0,
    maxHP2 = 107044,
    physicalAttack = 10704,
    magicAttack = 10704,
    physicalDefence = 10704,
    magicDefence = 10704
    };
getRow(70,1)->
    #pet_starCfg {
    petStar = 70,
    petQuality = 1,
    maxHP2 = 107044,
    physicalAttack = 10704,
    magicAttack = 10704,
    physicalDefence = 10704,
    magicDefence = 10704
    };
getRow(70,2)->
    #pet_starCfg {
    petStar = 70,
    petQuality = 2,
    maxHP2 = 107044,
    physicalAttack = 10704,
    magicAttack = 10704,
    physicalDefence = 10704,
    magicDefence = 10704
    };
getRow(70,3)->
    #pet_starCfg {
    petStar = 70,
    petQuality = 3,
    maxHP2 = 107044,
    physicalAttack = 10704,
    magicAttack = 10704,
    physicalDefence = 10704,
    magicDefence = 10704
    };
getRow(70,4)->
    #pet_starCfg {
    petStar = 70,
    petQuality = 4,
    maxHP2 = 107044,
    physicalAttack = 10704,
    magicAttack = 10704,
    physicalDefence = 10704,
    magicDefence = 10704
    };
getRow(70,5)->
    #pet_starCfg {
    petStar = 70,
    petQuality = 5,
    maxHP2 = 107044,
    physicalAttack = 10704,
    magicAttack = 10704,
    physicalDefence = 10704,
    magicDefence = 10704
    };
getRow(71,0)->
    #pet_starCfg {
    petStar = 71,
    petQuality = 0,
    maxHP2 = 110196,
    physicalAttack = 11020,
    magicAttack = 11020,
    physicalDefence = 11020,
    magicDefence = 11020
    };
getRow(71,1)->
    #pet_starCfg {
    petStar = 71,
    petQuality = 1,
    maxHP2 = 110196,
    physicalAttack = 11020,
    magicAttack = 11020,
    physicalDefence = 11020,
    magicDefence = 11020
    };
getRow(71,2)->
    #pet_starCfg {
    petStar = 71,
    petQuality = 2,
    maxHP2 = 110196,
    physicalAttack = 11020,
    magicAttack = 11020,
    physicalDefence = 11020,
    magicDefence = 11020
    };
getRow(71,3)->
    #pet_starCfg {
    petStar = 71,
    petQuality = 3,
    maxHP2 = 110196,
    physicalAttack = 11020,
    magicAttack = 11020,
    physicalDefence = 11020,
    magicDefence = 11020
    };
getRow(71,4)->
    #pet_starCfg {
    petStar = 71,
    petQuality = 4,
    maxHP2 = 110196,
    physicalAttack = 11020,
    magicAttack = 11020,
    physicalDefence = 11020,
    magicDefence = 11020
    };
getRow(71,5)->
    #pet_starCfg {
    petStar = 71,
    petQuality = 5,
    maxHP2 = 110196,
    physicalAttack = 11020,
    magicAttack = 11020,
    physicalDefence = 11020,
    magicDefence = 11020
    };
getRow(72,0)->
    #pet_starCfg {
    petStar = 72,
    petQuality = 0,
    maxHP2 = 116643,
    physicalAttack = 11664,
    magicAttack = 11664,
    physicalDefence = 11664,
    magicDefence = 11664
    };
getRow(72,1)->
    #pet_starCfg {
    petStar = 72,
    petQuality = 1,
    maxHP2 = 116643,
    physicalAttack = 11664,
    magicAttack = 11664,
    physicalDefence = 11664,
    magicDefence = 11664
    };
getRow(72,2)->
    #pet_starCfg {
    petStar = 72,
    petQuality = 2,
    maxHP2 = 116643,
    physicalAttack = 11664,
    magicAttack = 11664,
    physicalDefence = 11664,
    magicDefence = 11664
    };
getRow(72,3)->
    #pet_starCfg {
    petStar = 72,
    petQuality = 3,
    maxHP2 = 116643,
    physicalAttack = 11664,
    magicAttack = 11664,
    physicalDefence = 11664,
    magicDefence = 11664
    };
getRow(72,4)->
    #pet_starCfg {
    petStar = 72,
    petQuality = 4,
    maxHP2 = 116643,
    physicalAttack = 11664,
    magicAttack = 11664,
    physicalDefence = 11664,
    magicDefence = 11664
    };
getRow(72,5)->
    #pet_starCfg {
    petStar = 72,
    petQuality = 5,
    maxHP2 = 116643,
    physicalAttack = 11664,
    magicAttack = 11664,
    physicalDefence = 11664,
    magicDefence = 11664
    };
getRow(73,0)->
    #pet_starCfg {
    petStar = 73,
    petQuality = 0,
    maxHP2 = 119939,
    physicalAttack = 11994,
    magicAttack = 11994,
    physicalDefence = 11994,
    magicDefence = 11994
    };
getRow(73,1)->
    #pet_starCfg {
    petStar = 73,
    petQuality = 1,
    maxHP2 = 119939,
    physicalAttack = 11994,
    magicAttack = 11994,
    physicalDefence = 11994,
    magicDefence = 11994
    };
getRow(73,2)->
    #pet_starCfg {
    petStar = 73,
    petQuality = 2,
    maxHP2 = 119939,
    physicalAttack = 11994,
    magicAttack = 11994,
    physicalDefence = 11994,
    magicDefence = 11994
    };
getRow(73,3)->
    #pet_starCfg {
    petStar = 73,
    petQuality = 3,
    maxHP2 = 119939,
    physicalAttack = 11994,
    magicAttack = 11994,
    physicalDefence = 11994,
    magicDefence = 11994
    };
getRow(73,4)->
    #pet_starCfg {
    petStar = 73,
    petQuality = 4,
    maxHP2 = 119939,
    physicalAttack = 11994,
    magicAttack = 11994,
    physicalDefence = 11994,
    magicDefence = 11994
    };
getRow(73,5)->
    #pet_starCfg {
    petStar = 73,
    petQuality = 5,
    maxHP2 = 119939,
    physicalAttack = 11994,
    magicAttack = 11994,
    physicalDefence = 11994,
    magicDefence = 11994
    };
getRow(74,0)->
    #pet_starCfg {
    petStar = 74,
    petQuality = 0,
    maxHP2 = 123309,
    physicalAttack = 12331,
    magicAttack = 12331,
    physicalDefence = 12331,
    magicDefence = 12331
    };
getRow(74,1)->
    #pet_starCfg {
    petStar = 74,
    petQuality = 1,
    maxHP2 = 123309,
    physicalAttack = 12331,
    magicAttack = 12331,
    physicalDefence = 12331,
    magicDefence = 12331
    };
getRow(74,2)->
    #pet_starCfg {
    petStar = 74,
    petQuality = 2,
    maxHP2 = 123309,
    physicalAttack = 12331,
    magicAttack = 12331,
    physicalDefence = 12331,
    magicDefence = 12331
    };
getRow(74,3)->
    #pet_starCfg {
    petStar = 74,
    petQuality = 3,
    maxHP2 = 123309,
    physicalAttack = 12331,
    magicAttack = 12331,
    physicalDefence = 12331,
    magicDefence = 12331
    };
getRow(74,4)->
    #pet_starCfg {
    petStar = 74,
    petQuality = 4,
    maxHP2 = 123309,
    physicalAttack = 12331,
    magicAttack = 12331,
    physicalDefence = 12331,
    magicDefence = 12331
    };
getRow(74,5)->
    #pet_starCfg {
    petStar = 74,
    petQuality = 5,
    maxHP2 = 123309,
    physicalAttack = 12331,
    magicAttack = 12331,
    physicalDefence = 12331,
    magicDefence = 12331
    };
getRow(75,0)->
    #pet_starCfg {
    petStar = 75,
    petQuality = 0,
    maxHP2 = 126753,
    physicalAttack = 12675,
    magicAttack = 12675,
    physicalDefence = 12675,
    magicDefence = 12675
    };
getRow(75,1)->
    #pet_starCfg {
    petStar = 75,
    petQuality = 1,
    maxHP2 = 126753,
    physicalAttack = 12675,
    magicAttack = 12675,
    physicalDefence = 12675,
    magicDefence = 12675
    };
getRow(75,2)->
    #pet_starCfg {
    petStar = 75,
    petQuality = 2,
    maxHP2 = 126753,
    physicalAttack = 12675,
    magicAttack = 12675,
    physicalDefence = 12675,
    magicDefence = 12675
    };
getRow(75,3)->
    #pet_starCfg {
    petStar = 75,
    petQuality = 3,
    maxHP2 = 126753,
    physicalAttack = 12675,
    magicAttack = 12675,
    physicalDefence = 12675,
    magicDefence = 12675
    };
getRow(75,4)->
    #pet_starCfg {
    petStar = 75,
    petQuality = 4,
    maxHP2 = 126753,
    physicalAttack = 12675,
    magicAttack = 12675,
    physicalDefence = 12675,
    magicDefence = 12675
    };
getRow(75,5)->
    #pet_starCfg {
    petStar = 75,
    petQuality = 5,
    maxHP2 = 126753,
    physicalAttack = 12675,
    magicAttack = 12675,
    physicalDefence = 12675,
    magicDefence = 12675
    };
getRow(76,0)->
    #pet_starCfg {
    petStar = 76,
    petQuality = 0,
    maxHP2 = 130273,
    physicalAttack = 13027,
    magicAttack = 13027,
    physicalDefence = 13027,
    magicDefence = 13027
    };
getRow(76,1)->
    #pet_starCfg {
    petStar = 76,
    petQuality = 1,
    maxHP2 = 130273,
    physicalAttack = 13027,
    magicAttack = 13027,
    physicalDefence = 13027,
    magicDefence = 13027
    };
getRow(76,2)->
    #pet_starCfg {
    petStar = 76,
    petQuality = 2,
    maxHP2 = 130273,
    physicalAttack = 13027,
    magicAttack = 13027,
    physicalDefence = 13027,
    magicDefence = 13027
    };
getRow(76,3)->
    #pet_starCfg {
    petStar = 76,
    petQuality = 3,
    maxHP2 = 130273,
    physicalAttack = 13027,
    magicAttack = 13027,
    physicalDefence = 13027,
    magicDefence = 13027
    };
getRow(76,4)->
    #pet_starCfg {
    petStar = 76,
    petQuality = 4,
    maxHP2 = 130273,
    physicalAttack = 13027,
    magicAttack = 13027,
    physicalDefence = 13027,
    magicDefence = 13027
    };
getRow(76,5)->
    #pet_starCfg {
    petStar = 76,
    petQuality = 5,
    maxHP2 = 130273,
    physicalAttack = 13027,
    magicAttack = 13027,
    physicalDefence = 13027,
    magicDefence = 13027
    };
getRow(77,0)->
    #pet_starCfg {
    petStar = 77,
    petQuality = 0,
    maxHP2 = 137463,
    physicalAttack = 13746,
    magicAttack = 13746,
    physicalDefence = 13746,
    magicDefence = 13746
    };
getRow(77,1)->
    #pet_starCfg {
    petStar = 77,
    petQuality = 1,
    maxHP2 = 137463,
    physicalAttack = 13746,
    magicAttack = 13746,
    physicalDefence = 13746,
    magicDefence = 13746
    };
getRow(77,2)->
    #pet_starCfg {
    petStar = 77,
    petQuality = 2,
    maxHP2 = 137463,
    physicalAttack = 13746,
    magicAttack = 13746,
    physicalDefence = 13746,
    magicDefence = 13746
    };
getRow(77,3)->
    #pet_starCfg {
    petStar = 77,
    petQuality = 3,
    maxHP2 = 137463,
    physicalAttack = 13746,
    magicAttack = 13746,
    physicalDefence = 13746,
    magicDefence = 13746
    };
getRow(77,4)->
    #pet_starCfg {
    petStar = 77,
    petQuality = 4,
    maxHP2 = 137463,
    physicalAttack = 13746,
    magicAttack = 13746,
    physicalDefence = 13746,
    magicDefence = 13746
    };
getRow(77,5)->
    #pet_starCfg {
    petStar = 77,
    petQuality = 5,
    maxHP2 = 137463,
    physicalAttack = 13746,
    magicAttack = 13746,
    physicalDefence = 13746,
    magicDefence = 13746
    };
getRow(78,0)->
    #pet_starCfg {
    petStar = 78,
    petQuality = 0,
    maxHP2 = 141134,
    physicalAttack = 14113,
    magicAttack = 14113,
    physicalDefence = 14113,
    magicDefence = 14113
    };
getRow(78,1)->
    #pet_starCfg {
    petStar = 78,
    petQuality = 1,
    maxHP2 = 141134,
    physicalAttack = 14113,
    magicAttack = 14113,
    physicalDefence = 14113,
    magicDefence = 14113
    };
getRow(78,2)->
    #pet_starCfg {
    petStar = 78,
    petQuality = 2,
    maxHP2 = 141134,
    physicalAttack = 14113,
    magicAttack = 14113,
    physicalDefence = 14113,
    magicDefence = 14113
    };
getRow(78,3)->
    #pet_starCfg {
    petStar = 78,
    petQuality = 3,
    maxHP2 = 141134,
    physicalAttack = 14113,
    magicAttack = 14113,
    physicalDefence = 14113,
    magicDefence = 14113
    };
getRow(78,4)->
    #pet_starCfg {
    petStar = 78,
    petQuality = 4,
    maxHP2 = 141134,
    physicalAttack = 14113,
    magicAttack = 14113,
    physicalDefence = 14113,
    magicDefence = 14113
    };
getRow(78,5)->
    #pet_starCfg {
    petStar = 78,
    petQuality = 5,
    maxHP2 = 141134,
    physicalAttack = 14113,
    magicAttack = 14113,
    physicalDefence = 14113,
    magicDefence = 14113
    };
getRow(79,0)->
    #pet_starCfg {
    petStar = 79,
    petQuality = 0,
    maxHP2 = 144883,
    physicalAttack = 14488,
    magicAttack = 14488,
    physicalDefence = 14488,
    magicDefence = 14488
    };
getRow(79,1)->
    #pet_starCfg {
    petStar = 79,
    petQuality = 1,
    maxHP2 = 144883,
    physicalAttack = 14488,
    magicAttack = 14488,
    physicalDefence = 14488,
    magicDefence = 14488
    };
getRow(79,2)->
    #pet_starCfg {
    petStar = 79,
    petQuality = 2,
    maxHP2 = 144883,
    physicalAttack = 14488,
    magicAttack = 14488,
    physicalDefence = 14488,
    magicDefence = 14488
    };
getRow(79,3)->
    #pet_starCfg {
    petStar = 79,
    petQuality = 3,
    maxHP2 = 144883,
    physicalAttack = 14488,
    magicAttack = 14488,
    physicalDefence = 14488,
    magicDefence = 14488
    };
getRow(79,4)->
    #pet_starCfg {
    petStar = 79,
    petQuality = 4,
    maxHP2 = 144883,
    physicalAttack = 14488,
    magicAttack = 14488,
    physicalDefence = 14488,
    magicDefence = 14488
    };
getRow(79,5)->
    #pet_starCfg {
    petStar = 79,
    petQuality = 5,
    maxHP2 = 144883,
    physicalAttack = 14488,
    magicAttack = 14488,
    physicalDefence = 14488,
    magicDefence = 14488
    };
getRow(80,0)->
    #pet_starCfg {
    petStar = 80,
    petQuality = 0,
    maxHP2 = 148709,
    physicalAttack = 14871,
    magicAttack = 14871,
    physicalDefence = 14871,
    magicDefence = 14871
    };
getRow(80,1)->
    #pet_starCfg {
    petStar = 80,
    petQuality = 1,
    maxHP2 = 148709,
    physicalAttack = 14871,
    magicAttack = 14871,
    physicalDefence = 14871,
    magicDefence = 14871
    };
getRow(80,2)->
    #pet_starCfg {
    petStar = 80,
    petQuality = 2,
    maxHP2 = 148709,
    physicalAttack = 14871,
    magicAttack = 14871,
    physicalDefence = 14871,
    magicDefence = 14871
    };
getRow(80,3)->
    #pet_starCfg {
    petStar = 80,
    petQuality = 3,
    maxHP2 = 148709,
    physicalAttack = 14871,
    magicAttack = 14871,
    physicalDefence = 14871,
    magicDefence = 14871
    };
getRow(80,4)->
    #pet_starCfg {
    petStar = 80,
    petQuality = 4,
    maxHP2 = 148709,
    physicalAttack = 14871,
    magicAttack = 14871,
    physicalDefence = 14871,
    magicDefence = 14871
    };
getRow(80,5)->
    #pet_starCfg {
    petStar = 80,
    petQuality = 5,
    maxHP2 = 148709,
    physicalAttack = 14871,
    magicAttack = 14871,
    physicalDefence = 14871,
    magicDefence = 14871
    };
getRow(81,0)->
    #pet_starCfg {
    petStar = 81,
    petQuality = 0,
    maxHP2 = 152615,
    physicalAttack = 15261,
    magicAttack = 15261,
    physicalDefence = 15261,
    magicDefence = 15261
    };
getRow(81,1)->
    #pet_starCfg {
    petStar = 81,
    petQuality = 1,
    maxHP2 = 152615,
    physicalAttack = 15261,
    magicAttack = 15261,
    physicalDefence = 15261,
    magicDefence = 15261
    };
getRow(81,2)->
    #pet_starCfg {
    petStar = 81,
    petQuality = 2,
    maxHP2 = 152615,
    physicalAttack = 15261,
    magicAttack = 15261,
    physicalDefence = 15261,
    magicDefence = 15261
    };
getRow(81,3)->
    #pet_starCfg {
    petStar = 81,
    petQuality = 3,
    maxHP2 = 152615,
    physicalAttack = 15261,
    magicAttack = 15261,
    physicalDefence = 15261,
    magicDefence = 15261
    };
getRow(81,4)->
    #pet_starCfg {
    petStar = 81,
    petQuality = 4,
    maxHP2 = 152615,
    physicalAttack = 15261,
    magicAttack = 15261,
    physicalDefence = 15261,
    magicDefence = 15261
    };
getRow(81,5)->
    #pet_starCfg {
    petStar = 81,
    petQuality = 5,
    maxHP2 = 152615,
    physicalAttack = 15261,
    magicAttack = 15261,
    physicalDefence = 15261,
    magicDefence = 15261
    };
getRow(82,0)->
    #pet_starCfg {
    petStar = 82,
    petQuality = 0,
    maxHP2 = 160583,
    physicalAttack = 16058,
    magicAttack = 16058,
    physicalDefence = 16058,
    magicDefence = 16058
    };
getRow(82,1)->
    #pet_starCfg {
    petStar = 82,
    petQuality = 1,
    maxHP2 = 160583,
    physicalAttack = 16058,
    magicAttack = 16058,
    physicalDefence = 16058,
    magicDefence = 16058
    };
getRow(82,2)->
    #pet_starCfg {
    petStar = 82,
    petQuality = 2,
    maxHP2 = 160583,
    physicalAttack = 16058,
    magicAttack = 16058,
    physicalDefence = 16058,
    magicDefence = 16058
    };
getRow(82,3)->
    #pet_starCfg {
    petStar = 82,
    petQuality = 3,
    maxHP2 = 160583,
    physicalAttack = 16058,
    magicAttack = 16058,
    physicalDefence = 16058,
    magicDefence = 16058
    };
getRow(82,4)->
    #pet_starCfg {
    petStar = 82,
    petQuality = 4,
    maxHP2 = 160583,
    physicalAttack = 16058,
    magicAttack = 16058,
    physicalDefence = 16058,
    magicDefence = 16058
    };
getRow(82,5)->
    #pet_starCfg {
    petStar = 82,
    petQuality = 5,
    maxHP2 = 160583,
    physicalAttack = 16058,
    magicAttack = 16058,
    physicalDefence = 16058,
    magicDefence = 16058
    };
getRow(83,0)->
    #pet_starCfg {
    petStar = 83,
    petQuality = 0,
    maxHP2 = 164648,
    physicalAttack = 16465,
    magicAttack = 16465,
    physicalDefence = 16465,
    magicDefence = 16465
    };
getRow(83,1)->
    #pet_starCfg {
    petStar = 83,
    petQuality = 1,
    maxHP2 = 164648,
    physicalAttack = 16465,
    magicAttack = 16465,
    physicalDefence = 16465,
    magicDefence = 16465
    };
getRow(83,2)->
    #pet_starCfg {
    petStar = 83,
    petQuality = 2,
    maxHP2 = 164648,
    physicalAttack = 16465,
    magicAttack = 16465,
    physicalDefence = 16465,
    magicDefence = 16465
    };
getRow(83,3)->
    #pet_starCfg {
    petStar = 83,
    petQuality = 3,
    maxHP2 = 164648,
    physicalAttack = 16465,
    magicAttack = 16465,
    physicalDefence = 16465,
    magicDefence = 16465
    };
getRow(83,4)->
    #pet_starCfg {
    petStar = 83,
    petQuality = 4,
    maxHP2 = 164648,
    physicalAttack = 16465,
    magicAttack = 16465,
    physicalDefence = 16465,
    magicDefence = 16465
    };
getRow(83,5)->
    #pet_starCfg {
    petStar = 83,
    petQuality = 5,
    maxHP2 = 164648,
    physicalAttack = 16465,
    magicAttack = 16465,
    physicalDefence = 16465,
    magicDefence = 16465
    };
getRow(84,0)->
    #pet_starCfg {
    petStar = 84,
    petQuality = 0,
    maxHP2 = 168793,
    physicalAttack = 16879,
    magicAttack = 16879,
    physicalDefence = 16879,
    magicDefence = 16879
    };
getRow(84,1)->
    #pet_starCfg {
    petStar = 84,
    petQuality = 1,
    maxHP2 = 168793,
    physicalAttack = 16879,
    magicAttack = 16879,
    physicalDefence = 16879,
    magicDefence = 16879
    };
getRow(84,2)->
    #pet_starCfg {
    petStar = 84,
    petQuality = 2,
    maxHP2 = 168793,
    physicalAttack = 16879,
    magicAttack = 16879,
    physicalDefence = 16879,
    magicDefence = 16879
    };
getRow(84,3)->
    #pet_starCfg {
    petStar = 84,
    petQuality = 3,
    maxHP2 = 168793,
    physicalAttack = 16879,
    magicAttack = 16879,
    physicalDefence = 16879,
    magicDefence = 16879
    };
getRow(84,4)->
    #pet_starCfg {
    petStar = 84,
    petQuality = 4,
    maxHP2 = 168793,
    physicalAttack = 16879,
    magicAttack = 16879,
    physicalDefence = 16879,
    magicDefence = 16879
    };
getRow(84,5)->
    #pet_starCfg {
    petStar = 84,
    petQuality = 5,
    maxHP2 = 168793,
    physicalAttack = 16879,
    magicAttack = 16879,
    physicalDefence = 16879,
    magicDefence = 16879
    };
getRow(85,0)->
    #pet_starCfg {
    petStar = 85,
    petQuality = 0,
    maxHP2 = 173019,
    physicalAttack = 17302,
    magicAttack = 17302,
    physicalDefence = 17302,
    magicDefence = 17302
    };
getRow(85,1)->
    #pet_starCfg {
    petStar = 85,
    petQuality = 1,
    maxHP2 = 173019,
    physicalAttack = 17302,
    magicAttack = 17302,
    physicalDefence = 17302,
    magicDefence = 17302
    };
getRow(85,2)->
    #pet_starCfg {
    petStar = 85,
    petQuality = 2,
    maxHP2 = 173019,
    physicalAttack = 17302,
    magicAttack = 17302,
    physicalDefence = 17302,
    magicDefence = 17302
    };
getRow(85,3)->
    #pet_starCfg {
    petStar = 85,
    petQuality = 3,
    maxHP2 = 173019,
    physicalAttack = 17302,
    magicAttack = 17302,
    physicalDefence = 17302,
    magicDefence = 17302
    };
getRow(85,4)->
    #pet_starCfg {
    petStar = 85,
    petQuality = 4,
    maxHP2 = 173019,
    physicalAttack = 17302,
    magicAttack = 17302,
    physicalDefence = 17302,
    magicDefence = 17302
    };
getRow(85,5)->
    #pet_starCfg {
    petStar = 85,
    petQuality = 5,
    maxHP2 = 173019,
    physicalAttack = 17302,
    magicAttack = 17302,
    physicalDefence = 17302,
    magicDefence = 17302
    };
getRow(86,0)->
    #pet_starCfg {
    petStar = 86,
    petQuality = 0,
    maxHP2 = 177328,
    physicalAttack = 17733,
    magicAttack = 17733,
    physicalDefence = 17733,
    magicDefence = 17733
    };
getRow(86,1)->
    #pet_starCfg {
    petStar = 86,
    petQuality = 1,
    maxHP2 = 177328,
    physicalAttack = 17733,
    magicAttack = 17733,
    physicalDefence = 17733,
    magicDefence = 17733
    };
getRow(86,2)->
    #pet_starCfg {
    petStar = 86,
    petQuality = 2,
    maxHP2 = 177328,
    physicalAttack = 17733,
    magicAttack = 17733,
    physicalDefence = 17733,
    magicDefence = 17733
    };
getRow(86,3)->
    #pet_starCfg {
    petStar = 86,
    petQuality = 3,
    maxHP2 = 177328,
    physicalAttack = 17733,
    magicAttack = 17733,
    physicalDefence = 17733,
    magicDefence = 17733
    };
getRow(86,4)->
    #pet_starCfg {
    petStar = 86,
    petQuality = 4,
    maxHP2 = 177328,
    physicalAttack = 17733,
    magicAttack = 17733,
    physicalDefence = 17733,
    magicDefence = 17733
    };
getRow(86,5)->
    #pet_starCfg {
    petStar = 86,
    petQuality = 5,
    maxHP2 = 177328,
    physicalAttack = 17733,
    magicAttack = 17733,
    physicalDefence = 17733,
    magicDefence = 17733
    };
getRow(87,0)->
    #pet_starCfg {
    petStar = 87,
    petQuality = 0,
    maxHP2 = 186111,
    physicalAttack = 18611,
    magicAttack = 18611,
    physicalDefence = 18611,
    magicDefence = 18611
    };
getRow(87,1)->
    #pet_starCfg {
    petStar = 87,
    petQuality = 1,
    maxHP2 = 186111,
    physicalAttack = 18611,
    magicAttack = 18611,
    physicalDefence = 18611,
    magicDefence = 18611
    };
getRow(87,2)->
    #pet_starCfg {
    petStar = 87,
    petQuality = 2,
    maxHP2 = 186111,
    physicalAttack = 18611,
    magicAttack = 18611,
    physicalDefence = 18611,
    magicDefence = 18611
    };
getRow(87,3)->
    #pet_starCfg {
    petStar = 87,
    petQuality = 3,
    maxHP2 = 186111,
    physicalAttack = 18611,
    magicAttack = 18611,
    physicalDefence = 18611,
    magicDefence = 18611
    };
getRow(87,4)->
    #pet_starCfg {
    petStar = 87,
    petQuality = 4,
    maxHP2 = 186111,
    physicalAttack = 18611,
    magicAttack = 18611,
    physicalDefence = 18611,
    magicDefence = 18611
    };
getRow(87,5)->
    #pet_starCfg {
    petStar = 87,
    petQuality = 5,
    maxHP2 = 186111,
    physicalAttack = 18611,
    magicAttack = 18611,
    physicalDefence = 18611,
    magicDefence = 18611
    };
getRow(88,0)->
    #pet_starCfg {
    petStar = 88,
    petQuality = 0,
    maxHP2 = 190585,
    physicalAttack = 19059,
    magicAttack = 19059,
    physicalDefence = 19059,
    magicDefence = 19059
    };
getRow(88,1)->
    #pet_starCfg {
    petStar = 88,
    petQuality = 1,
    maxHP2 = 190585,
    physicalAttack = 19059,
    magicAttack = 19059,
    physicalDefence = 19059,
    magicDefence = 19059
    };
getRow(88,2)->
    #pet_starCfg {
    petStar = 88,
    petQuality = 2,
    maxHP2 = 190585,
    physicalAttack = 19059,
    magicAttack = 19059,
    physicalDefence = 19059,
    magicDefence = 19059
    };
getRow(88,3)->
    #pet_starCfg {
    petStar = 88,
    petQuality = 3,
    maxHP2 = 190585,
    physicalAttack = 19059,
    magicAttack = 19059,
    physicalDefence = 19059,
    magicDefence = 19059
    };
getRow(88,4)->
    #pet_starCfg {
    petStar = 88,
    petQuality = 4,
    maxHP2 = 190585,
    physicalAttack = 19059,
    magicAttack = 19059,
    physicalDefence = 19059,
    magicDefence = 19059
    };
getRow(88,5)->
    #pet_starCfg {
    petStar = 88,
    petQuality = 5,
    maxHP2 = 190585,
    physicalAttack = 19059,
    magicAttack = 19059,
    physicalDefence = 19059,
    magicDefence = 19059
    };
getRow(89,0)->
    #pet_starCfg {
    petStar = 89,
    petQuality = 0,
    maxHP2 = 195144,
    physicalAttack = 19514,
    magicAttack = 19514,
    physicalDefence = 19514,
    magicDefence = 19514
    };
getRow(89,1)->
    #pet_starCfg {
    petStar = 89,
    petQuality = 1,
    maxHP2 = 195144,
    physicalAttack = 19514,
    magicAttack = 19514,
    physicalDefence = 19514,
    magicDefence = 19514
    };
getRow(89,2)->
    #pet_starCfg {
    petStar = 89,
    petQuality = 2,
    maxHP2 = 195144,
    physicalAttack = 19514,
    magicAttack = 19514,
    physicalDefence = 19514,
    magicDefence = 19514
    };
getRow(89,3)->
    #pet_starCfg {
    petStar = 89,
    petQuality = 3,
    maxHP2 = 195144,
    physicalAttack = 19514,
    magicAttack = 19514,
    physicalDefence = 19514,
    magicDefence = 19514
    };
getRow(89,4)->
    #pet_starCfg {
    petStar = 89,
    petQuality = 4,
    maxHP2 = 195144,
    physicalAttack = 19514,
    magicAttack = 19514,
    physicalDefence = 19514,
    magicDefence = 19514
    };
getRow(89,5)->
    #pet_starCfg {
    petStar = 89,
    petQuality = 5,
    maxHP2 = 195144,
    physicalAttack = 19514,
    magicAttack = 19514,
    physicalDefence = 19514,
    magicDefence = 19514
    };
getRow(90,0)->
    #pet_starCfg {
    petStar = 90,
    petQuality = 0,
    maxHP2 = 199788,
    physicalAttack = 19979,
    magicAttack = 19979,
    physicalDefence = 19979,
    magicDefence = 19979
    };
getRow(90,1)->
    #pet_starCfg {
    petStar = 90,
    petQuality = 1,
    maxHP2 = 199788,
    physicalAttack = 19979,
    magicAttack = 19979,
    physicalDefence = 19979,
    magicDefence = 19979
    };
getRow(90,2)->
    #pet_starCfg {
    petStar = 90,
    petQuality = 2,
    maxHP2 = 199788,
    physicalAttack = 19979,
    magicAttack = 19979,
    physicalDefence = 19979,
    magicDefence = 19979
    };
getRow(90,3)->
    #pet_starCfg {
    petStar = 90,
    petQuality = 3,
    maxHP2 = 199788,
    physicalAttack = 19979,
    magicAttack = 19979,
    physicalDefence = 19979,
    magicDefence = 19979
    };
getRow(90,4)->
    #pet_starCfg {
    petStar = 90,
    petQuality = 4,
    maxHP2 = 199788,
    physicalAttack = 19979,
    magicAttack = 19979,
    physicalDefence = 19979,
    magicDefence = 19979
    };
getRow(90,5)->
    #pet_starCfg {
    petStar = 90,
    petQuality = 5,
    maxHP2 = 199788,
    physicalAttack = 19979,
    magicAttack = 19979,
    physicalDefence = 19979,
    magicDefence = 19979
    };
getRow(91,0)->
    #pet_starCfg {
    petStar = 91,
    petQuality = 0,
    maxHP2 = 204517,
    physicalAttack = 20452,
    magicAttack = 20452,
    physicalDefence = 20452,
    magicDefence = 20452
    };
getRow(91,1)->
    #pet_starCfg {
    petStar = 91,
    petQuality = 1,
    maxHP2 = 204517,
    physicalAttack = 20452,
    magicAttack = 20452,
    physicalDefence = 20452,
    magicDefence = 20452
    };
getRow(91,2)->
    #pet_starCfg {
    petStar = 91,
    petQuality = 2,
    maxHP2 = 204517,
    physicalAttack = 20452,
    magicAttack = 20452,
    physicalDefence = 20452,
    magicDefence = 20452
    };
getRow(91,3)->
    #pet_starCfg {
    petStar = 91,
    petQuality = 3,
    maxHP2 = 204517,
    physicalAttack = 20452,
    magicAttack = 20452,
    physicalDefence = 20452,
    magicDefence = 20452
    };
getRow(91,4)->
    #pet_starCfg {
    petStar = 91,
    petQuality = 4,
    maxHP2 = 204517,
    physicalAttack = 20452,
    magicAttack = 20452,
    physicalDefence = 20452,
    magicDefence = 20452
    };
getRow(91,5)->
    #pet_starCfg {
    petStar = 91,
    petQuality = 5,
    maxHP2 = 204517,
    physicalAttack = 20452,
    magicAttack = 20452,
    physicalDefence = 20452,
    magicDefence = 20452
    };
getRow(92,0)->
    #pet_starCfg {
    petStar = 92,
    petQuality = 0,
    maxHP2 = 214148,
    physicalAttack = 21415,
    magicAttack = 21415,
    physicalDefence = 21415,
    magicDefence = 21415
    };
getRow(92,1)->
    #pet_starCfg {
    petStar = 92,
    petQuality = 1,
    maxHP2 = 214148,
    physicalAttack = 21415,
    magicAttack = 21415,
    physicalDefence = 21415,
    magicDefence = 21415
    };
getRow(92,2)->
    #pet_starCfg {
    petStar = 92,
    petQuality = 2,
    maxHP2 = 214148,
    physicalAttack = 21415,
    magicAttack = 21415,
    physicalDefence = 21415,
    magicDefence = 21415
    };
getRow(92,3)->
    #pet_starCfg {
    petStar = 92,
    petQuality = 3,
    maxHP2 = 214148,
    physicalAttack = 21415,
    magicAttack = 21415,
    physicalDefence = 21415,
    magicDefence = 21415
    };
getRow(92,4)->
    #pet_starCfg {
    petStar = 92,
    petQuality = 4,
    maxHP2 = 214148,
    physicalAttack = 21415,
    magicAttack = 21415,
    physicalDefence = 21415,
    magicDefence = 21415
    };
getRow(92,5)->
    #pet_starCfg {
    petStar = 92,
    petQuality = 5,
    maxHP2 = 214148,
    physicalAttack = 21415,
    magicAttack = 21415,
    physicalDefence = 21415,
    magicDefence = 21415
    };
getRow(93,0)->
    #pet_starCfg {
    petStar = 93,
    petQuality = 0,
    maxHP2 = 219051,
    physicalAttack = 21905,
    magicAttack = 21905,
    physicalDefence = 21905,
    magicDefence = 21905
    };
getRow(93,1)->
    #pet_starCfg {
    petStar = 93,
    petQuality = 1,
    maxHP2 = 219051,
    physicalAttack = 21905,
    magicAttack = 21905,
    physicalDefence = 21905,
    magicDefence = 21905
    };
getRow(93,2)->
    #pet_starCfg {
    petStar = 93,
    petQuality = 2,
    maxHP2 = 219051,
    physicalAttack = 21905,
    magicAttack = 21905,
    physicalDefence = 21905,
    magicDefence = 21905
    };
getRow(93,3)->
    #pet_starCfg {
    petStar = 93,
    petQuality = 3,
    maxHP2 = 219051,
    physicalAttack = 21905,
    magicAttack = 21905,
    physicalDefence = 21905,
    magicDefence = 21905
    };
getRow(93,4)->
    #pet_starCfg {
    petStar = 93,
    petQuality = 4,
    maxHP2 = 219051,
    physicalAttack = 21905,
    magicAttack = 21905,
    physicalDefence = 21905,
    magicDefence = 21905
    };
getRow(93,5)->
    #pet_starCfg {
    petStar = 93,
    petQuality = 5,
    maxHP2 = 219051,
    physicalAttack = 21905,
    magicAttack = 21905,
    physicalDefence = 21905,
    magicDefence = 21905
    };
getRow(94,0)->
    #pet_starCfg {
    petStar = 94,
    petQuality = 0,
    maxHP2 = 224040,
    physicalAttack = 22404,
    magicAttack = 22404,
    physicalDefence = 22404,
    magicDefence = 22404
    };
getRow(94,1)->
    #pet_starCfg {
    petStar = 94,
    petQuality = 1,
    maxHP2 = 224040,
    physicalAttack = 22404,
    magicAttack = 22404,
    physicalDefence = 22404,
    magicDefence = 22404
    };
getRow(94,2)->
    #pet_starCfg {
    petStar = 94,
    petQuality = 2,
    maxHP2 = 224040,
    physicalAttack = 22404,
    magicAttack = 22404,
    physicalDefence = 22404,
    magicDefence = 22404
    };
getRow(94,3)->
    #pet_starCfg {
    petStar = 94,
    petQuality = 3,
    maxHP2 = 224040,
    physicalAttack = 22404,
    magicAttack = 22404,
    physicalDefence = 22404,
    magicDefence = 22404
    };
getRow(94,4)->
    #pet_starCfg {
    petStar = 94,
    petQuality = 4,
    maxHP2 = 224040,
    physicalAttack = 22404,
    magicAttack = 22404,
    physicalDefence = 22404,
    magicDefence = 22404
    };
getRow(94,5)->
    #pet_starCfg {
    petStar = 94,
    petQuality = 5,
    maxHP2 = 224040,
    physicalAttack = 22404,
    magicAttack = 22404,
    physicalDefence = 22404,
    magicDefence = 22404
    };
getRow(95,0)->
    #pet_starCfg {
    petStar = 95,
    petQuality = 0,
    maxHP2 = 229119,
    physicalAttack = 22912,
    magicAttack = 22912,
    physicalDefence = 22912,
    magicDefence = 22912
    };
getRow(95,1)->
    #pet_starCfg {
    petStar = 95,
    petQuality = 1,
    maxHP2 = 229119,
    physicalAttack = 22912,
    magicAttack = 22912,
    physicalDefence = 22912,
    magicDefence = 22912
    };
getRow(95,2)->
    #pet_starCfg {
    petStar = 95,
    petQuality = 2,
    maxHP2 = 229119,
    physicalAttack = 22912,
    magicAttack = 22912,
    physicalDefence = 22912,
    magicDefence = 22912
    };
getRow(95,3)->
    #pet_starCfg {
    petStar = 95,
    petQuality = 3,
    maxHP2 = 229119,
    physicalAttack = 22912,
    magicAttack = 22912,
    physicalDefence = 22912,
    magicDefence = 22912
    };
getRow(95,4)->
    #pet_starCfg {
    petStar = 95,
    petQuality = 4,
    maxHP2 = 229119,
    physicalAttack = 22912,
    magicAttack = 22912,
    physicalDefence = 22912,
    magicDefence = 22912
    };
getRow(95,5)->
    #pet_starCfg {
    petStar = 95,
    petQuality = 5,
    maxHP2 = 229119,
    physicalAttack = 22912,
    magicAttack = 22912,
    physicalDefence = 22912,
    magicDefence = 22912
    };
getRow(96,0)->
    #pet_starCfg {
    petStar = 96,
    petQuality = 0,
    maxHP2 = 234286,
    physicalAttack = 23429,
    magicAttack = 23429,
    physicalDefence = 23429,
    magicDefence = 23429
    };
getRow(96,1)->
    #pet_starCfg {
    petStar = 96,
    petQuality = 1,
    maxHP2 = 234286,
    physicalAttack = 23429,
    magicAttack = 23429,
    physicalDefence = 23429,
    magicDefence = 23429
    };
getRow(96,2)->
    #pet_starCfg {
    petStar = 96,
    petQuality = 2,
    maxHP2 = 234286,
    physicalAttack = 23429,
    magicAttack = 23429,
    physicalDefence = 23429,
    magicDefence = 23429
    };
getRow(96,3)->
    #pet_starCfg {
    petStar = 96,
    petQuality = 3,
    maxHP2 = 234286,
    physicalAttack = 23429,
    magicAttack = 23429,
    physicalDefence = 23429,
    magicDefence = 23429
    };
getRow(96,4)->
    #pet_starCfg {
    petStar = 96,
    petQuality = 4,
    maxHP2 = 234286,
    physicalAttack = 23429,
    magicAttack = 23429,
    physicalDefence = 23429,
    magicDefence = 23429
    };
getRow(96,5)->
    #pet_starCfg {
    petStar = 96,
    petQuality = 5,
    maxHP2 = 234286,
    physicalAttack = 23429,
    magicAttack = 23429,
    physicalDefence = 23429,
    magicDefence = 23429
    };
getRow(97,0)->
    #pet_starCfg {
    petStar = 97,
    petQuality = 0,
    maxHP2 = 244799,
    physicalAttack = 24480,
    magicAttack = 24480,
    physicalDefence = 24480,
    magicDefence = 24480
    };
getRow(97,1)->
    #pet_starCfg {
    petStar = 97,
    petQuality = 1,
    maxHP2 = 244799,
    physicalAttack = 24480,
    magicAttack = 24480,
    physicalDefence = 24480,
    magicDefence = 24480
    };
getRow(97,2)->
    #pet_starCfg {
    petStar = 97,
    petQuality = 2,
    maxHP2 = 244799,
    physicalAttack = 24480,
    magicAttack = 24480,
    physicalDefence = 24480,
    magicDefence = 24480
    };
getRow(97,3)->
    #pet_starCfg {
    petStar = 97,
    petQuality = 3,
    maxHP2 = 244799,
    physicalAttack = 24480,
    magicAttack = 24480,
    physicalDefence = 24480,
    magicDefence = 24480
    };
getRow(97,4)->
    #pet_starCfg {
    petStar = 97,
    petQuality = 4,
    maxHP2 = 244799,
    physicalAttack = 24480,
    magicAttack = 24480,
    physicalDefence = 24480,
    magicDefence = 24480
    };
getRow(97,5)->
    #pet_starCfg {
    petStar = 97,
    petQuality = 5,
    maxHP2 = 244799,
    physicalAttack = 24480,
    magicAttack = 24480,
    physicalDefence = 24480,
    magicDefence = 24480
    };
getRow(98,0)->
    #pet_starCfg {
    petStar = 98,
    petQuality = 0,
    maxHP2 = 250145,
    physicalAttack = 25015,
    magicAttack = 25015,
    physicalDefence = 25015,
    magicDefence = 25015
    };
getRow(98,1)->
    #pet_starCfg {
    petStar = 98,
    petQuality = 1,
    maxHP2 = 250145,
    physicalAttack = 25015,
    magicAttack = 25015,
    physicalDefence = 25015,
    magicDefence = 25015
    };
getRow(98,2)->
    #pet_starCfg {
    petStar = 98,
    petQuality = 2,
    maxHP2 = 250145,
    physicalAttack = 25015,
    magicAttack = 25015,
    physicalDefence = 25015,
    magicDefence = 25015
    };
getRow(98,3)->
    #pet_starCfg {
    petStar = 98,
    petQuality = 3,
    maxHP2 = 250145,
    physicalAttack = 25015,
    magicAttack = 25015,
    physicalDefence = 25015,
    magicDefence = 25015
    };
getRow(98,4)->
    #pet_starCfg {
    petStar = 98,
    petQuality = 4,
    maxHP2 = 250145,
    physicalAttack = 25015,
    magicAttack = 25015,
    physicalDefence = 25015,
    magicDefence = 25015
    };
getRow(98,5)->
    #pet_starCfg {
    petStar = 98,
    petQuality = 5,
    maxHP2 = 250145,
    physicalAttack = 25015,
    magicAttack = 25015,
    physicalDefence = 25015,
    magicDefence = 25015
    };
getRow(99,0)->
    #pet_starCfg {
    petStar = 99,
    petQuality = 0,
    maxHP2 = 255583,
    physicalAttack = 25558,
    magicAttack = 25558,
    physicalDefence = 25558,
    magicDefence = 25558
    };
getRow(99,1)->
    #pet_starCfg {
    petStar = 99,
    petQuality = 1,
    maxHP2 = 255583,
    physicalAttack = 25558,
    magicAttack = 25558,
    physicalDefence = 25558,
    magicDefence = 25558
    };
getRow(99,2)->
    #pet_starCfg {
    petStar = 99,
    petQuality = 2,
    maxHP2 = 255583,
    physicalAttack = 25558,
    magicAttack = 25558,
    physicalDefence = 25558,
    magicDefence = 25558
    };
getRow(99,3)->
    #pet_starCfg {
    petStar = 99,
    petQuality = 3,
    maxHP2 = 255583,
    physicalAttack = 25558,
    magicAttack = 25558,
    physicalDefence = 25558,
    magicDefence = 25558
    };
getRow(99,4)->
    #pet_starCfg {
    petStar = 99,
    petQuality = 4,
    maxHP2 = 255583,
    physicalAttack = 25558,
    magicAttack = 25558,
    physicalDefence = 25558,
    magicDefence = 25558
    };
getRow(99,5)->
    #pet_starCfg {
    petStar = 99,
    petQuality = 5,
    maxHP2 = 255583,
    physicalAttack = 25558,
    magicAttack = 25558,
    physicalDefence = 25558,
    magicDefence = 25558
    };
getRow(100,0)->
    #pet_starCfg {
    petStar = 100,
    petQuality = 0,
    maxHP2 = 261112,
    physicalAttack = 26111,
    magicAttack = 26111,
    physicalDefence = 26111,
    magicDefence = 26111
    };
getRow(100,1)->
    #pet_starCfg {
    petStar = 100,
    petQuality = 1,
    maxHP2 = 261112,
    physicalAttack = 26111,
    magicAttack = 26111,
    physicalDefence = 26111,
    magicDefence = 26111
    };
getRow(100,2)->
    #pet_starCfg {
    petStar = 100,
    petQuality = 2,
    maxHP2 = 261112,
    physicalAttack = 26111,
    magicAttack = 26111,
    physicalDefence = 26111,
    magicDefence = 26111
    };
getRow(100,3)->
    #pet_starCfg {
    petStar = 100,
    petQuality = 3,
    maxHP2 = 261112,
    physicalAttack = 26111,
    magicAttack = 26111,
    physicalDefence = 26111,
    magicDefence = 26111
    };
getRow(100,4)->
    #pet_starCfg {
    petStar = 100,
    petQuality = 4,
    maxHP2 = 261112,
    physicalAttack = 26111,
    magicAttack = 26111,
    physicalDefence = 26111,
    magicDefence = 26111
    };
getRow(100,5)->
    #pet_starCfg {
    petStar = 100,
    petQuality = 5,
    maxHP2 = 261112,
    physicalAttack = 26111,
    magicAttack = 26111,
    physicalDefence = 26111,
    magicDefence = 26111
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
    {10,5},
    {11,0},
    {11,1},
    {11,2},
    {11,3},
    {11,4},
    {11,5},
    {12,0},
    {12,1},
    {12,2},
    {12,3},
    {12,4},
    {12,5},
    {13,0},
    {13,1},
    {13,2},
    {13,3},
    {13,4},
    {13,5},
    {14,0},
    {14,1},
    {14,2},
    {14,3},
    {14,4},
    {14,5},
    {15,0},
    {15,1},
    {15,2},
    {15,3},
    {15,4},
    {15,5},
    {16,0},
    {16,1},
    {16,2},
    {16,3},
    {16,4},
    {16,5},
    {17,0},
    {17,1},
    {17,2},
    {17,3},
    {17,4},
    {17,5},
    {18,0},
    {18,1},
    {18,2},
    {18,3},
    {18,4},
    {18,5},
    {19,0},
    {19,1},
    {19,2},
    {19,3},
    {19,4},
    {19,5},
    {20,0},
    {20,1},
    {20,2},
    {20,3},
    {20,4},
    {20,5},
    {21,0},
    {21,1},
    {21,2},
    {21,3},
    {21,4},
    {21,5},
    {22,0},
    {22,1},
    {22,2},
    {22,3},
    {22,4},
    {22,5},
    {23,0},
    {23,1},
    {23,2},
    {23,3},
    {23,4},
    {23,5},
    {24,0},
    {24,1},
    {24,2},
    {24,3},
    {24,4},
    {24,5},
    {25,0},
    {25,1},
    {25,2},
    {25,3},
    {25,4},
    {25,5},
    {26,0},
    {26,1},
    {26,2},
    {26,3},
    {26,4},
    {26,5},
    {27,0},
    {27,1},
    {27,2},
    {27,3},
    {27,4},
    {27,5},
    {28,0},
    {28,1},
    {28,2},
    {28,3},
    {28,4},
    {28,5},
    {29,0},
    {29,1},
    {29,2},
    {29,3},
    {29,4},
    {29,5},
    {30,0},
    {30,1},
    {30,2},
    {30,3},
    {30,4},
    {30,5},
    {31,0},
    {31,1},
    {31,2},
    {31,3},
    {31,4},
    {31,5},
    {32,0},
    {32,1},
    {32,2},
    {32,3},
    {32,4},
    {32,5},
    {33,0},
    {33,1},
    {33,2},
    {33,3},
    {33,4},
    {33,5},
    {34,0},
    {34,1},
    {34,2},
    {34,3},
    {34,4},
    {34,5},
    {35,0},
    {35,1},
    {35,2},
    {35,3},
    {35,4},
    {35,5},
    {36,0},
    {36,1},
    {36,2},
    {36,3},
    {36,4},
    {36,5},
    {37,0},
    {37,1},
    {37,2},
    {37,3},
    {37,4},
    {37,5},
    {38,0},
    {38,1},
    {38,2},
    {38,3},
    {38,4},
    {38,5},
    {39,0},
    {39,1},
    {39,2},
    {39,3},
    {39,4},
    {39,5},
    {40,0},
    {40,1},
    {40,2},
    {40,3},
    {40,4},
    {40,5},
    {41,0},
    {41,1},
    {41,2},
    {41,3},
    {41,4},
    {41,5},
    {42,0},
    {42,1},
    {42,2},
    {42,3},
    {42,4},
    {42,5},
    {43,0},
    {43,1},
    {43,2},
    {43,3},
    {43,4},
    {43,5},
    {44,0},
    {44,1},
    {44,2},
    {44,3},
    {44,4},
    {44,5},
    {45,0},
    {45,1},
    {45,2},
    {45,3},
    {45,4},
    {45,5},
    {46,0},
    {46,1},
    {46,2},
    {46,3},
    {46,4},
    {46,5},
    {47,0},
    {47,1},
    {47,2},
    {47,3},
    {47,4},
    {47,5},
    {48,0},
    {48,1},
    {48,2},
    {48,3},
    {48,4},
    {48,5},
    {49,0},
    {49,1},
    {49,2},
    {49,3},
    {49,4},
    {49,5},
    {50,0},
    {50,1},
    {50,2},
    {50,3},
    {50,4},
    {50,5},
    {51,0},
    {51,1},
    {51,2},
    {51,3},
    {51,4},
    {51,5},
    {52,0},
    {52,1},
    {52,2},
    {52,3},
    {52,4},
    {52,5},
    {53,0},
    {53,1},
    {53,2},
    {53,3},
    {53,4},
    {53,5},
    {54,0},
    {54,1},
    {54,2},
    {54,3},
    {54,4},
    {54,5},
    {55,0},
    {55,1},
    {55,2},
    {55,3},
    {55,4},
    {55,5},
    {56,0},
    {56,1},
    {56,2},
    {56,3},
    {56,4},
    {56,5},
    {57,0},
    {57,1},
    {57,2},
    {57,3},
    {57,4},
    {57,5},
    {58,0},
    {58,1},
    {58,2},
    {58,3},
    {58,4},
    {58,5},
    {59,0},
    {59,1},
    {59,2},
    {59,3},
    {59,4},
    {59,5},
    {60,0},
    {60,1},
    {60,2},
    {60,3},
    {60,4},
    {60,5},
    {61,0},
    {61,1},
    {61,2},
    {61,3},
    {61,4},
    {61,5},
    {62,0},
    {62,1},
    {62,2},
    {62,3},
    {62,4},
    {62,5},
    {63,0},
    {63,1},
    {63,2},
    {63,3},
    {63,4},
    {63,5},
    {64,0},
    {64,1},
    {64,2},
    {64,3},
    {64,4},
    {64,5},
    {65,0},
    {65,1},
    {65,2},
    {65,3},
    {65,4},
    {65,5},
    {66,0},
    {66,1},
    {66,2},
    {66,3},
    {66,4},
    {66,5},
    {67,0},
    {67,1},
    {67,2},
    {67,3},
    {67,4},
    {67,5},
    {68,0},
    {68,1},
    {68,2},
    {68,3},
    {68,4},
    {68,5},
    {69,0},
    {69,1},
    {69,2},
    {69,3},
    {69,4},
    {69,5},
    {70,0},
    {70,1},
    {70,2},
    {70,3},
    {70,4},
    {70,5},
    {71,0},
    {71,1},
    {71,2},
    {71,3},
    {71,4},
    {71,5},
    {72,0},
    {72,1},
    {72,2},
    {72,3},
    {72,4},
    {72,5},
    {73,0},
    {73,1},
    {73,2},
    {73,3},
    {73,4},
    {73,5},
    {74,0},
    {74,1},
    {74,2},
    {74,3},
    {74,4},
    {74,5},
    {75,0},
    {75,1},
    {75,2},
    {75,3},
    {75,4},
    {75,5},
    {76,0},
    {76,1},
    {76,2},
    {76,3},
    {76,4},
    {76,5},
    {77,0},
    {77,1},
    {77,2},
    {77,3},
    {77,4},
    {77,5},
    {78,0},
    {78,1},
    {78,2},
    {78,3},
    {78,4},
    {78,5},
    {79,0},
    {79,1},
    {79,2},
    {79,3},
    {79,4},
    {79,5},
    {80,0},
    {80,1},
    {80,2},
    {80,3},
    {80,4},
    {80,5},
    {81,0},
    {81,1},
    {81,2},
    {81,3},
    {81,4},
    {81,5},
    {82,0},
    {82,1},
    {82,2},
    {82,3},
    {82,4},
    {82,5},
    {83,0},
    {83,1},
    {83,2},
    {83,3},
    {83,4},
    {83,5},
    {84,0},
    {84,1},
    {84,2},
    {84,3},
    {84,4},
    {84,5},
    {85,0},
    {85,1},
    {85,2},
    {85,3},
    {85,4},
    {85,5},
    {86,0},
    {86,1},
    {86,2},
    {86,3},
    {86,4},
    {86,5},
    {87,0},
    {87,1},
    {87,2},
    {87,3},
    {87,4},
    {87,5},
    {88,0},
    {88,1},
    {88,2},
    {88,3},
    {88,4},
    {88,5},
    {89,0},
    {89,1},
    {89,2},
    {89,3},
    {89,4},
    {89,5},
    {90,0},
    {90,1},
    {90,2},
    {90,3},
    {90,4},
    {90,5},
    {91,0},
    {91,1},
    {91,2},
    {91,3},
    {91,4},
    {91,5},
    {92,0},
    {92,1},
    {92,2},
    {92,3},
    {92,4},
    {92,5},
    {93,0},
    {93,1},
    {93,2},
    {93,3},
    {93,4},
    {93,5},
    {94,0},
    {94,1},
    {94,2},
    {94,3},
    {94,4},
    {94,5},
    {95,0},
    {95,1},
    {95,2},
    {95,3},
    {95,4},
    {95,5},
    {96,0},
    {96,1},
    {96,2},
    {96,3},
    {96,4},
    {96,5},
    {97,0},
    {97,1},
    {97,2},
    {97,3},
    {97,4},
    {97,5},
    {98,0},
    {98,1},
    {98,2},
    {98,3},
    {98,4},
    {98,5},
    {99,0},
    {99,1},
    {99,2},
    {99,3},
    {99,4},
    {99,5},
    {100,0},
    {100,1},
    {100,2},
    {100,3},
    {100,4},
    {100,5}
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
get2KeyList(11)->[
    0,
    1,
    2,
    3,
    4,
    5
    ];
get2KeyList(12)->[
    0,
    1,
    2,
    3,
    4,
    5
    ];
get2KeyList(13)->[
    0,
    1,
    2,
    3,
    4,
    5
    ];
get2KeyList(14)->[
    0,
    1,
    2,
    3,
    4,
    5
    ];
get2KeyList(15)->[
    0,
    1,
    2,
    3,
    4,
    5
    ];
get2KeyList(16)->[
    0,
    1,
    2,
    3,
    4,
    5
    ];
get2KeyList(17)->[
    0,
    1,
    2,
    3,
    4,
    5
    ];
get2KeyList(18)->[
    0,
    1,
    2,
    3,
    4,
    5
    ];
get2KeyList(19)->[
    0,
    1,
    2,
    3,
    4,
    5
    ];
get2KeyList(20)->[
    0,
    1,
    2,
    3,
    4,
    5
    ];
get2KeyList(21)->[
    0,
    1,
    2,
    3,
    4,
    5
    ];
get2KeyList(22)->[
    0,
    1,
    2,
    3,
    4,
    5
    ];
get2KeyList(23)->[
    0,
    1,
    2,
    3,
    4,
    5
    ];
get2KeyList(24)->[
    0,
    1,
    2,
    3,
    4,
    5
    ];
get2KeyList(25)->[
    0,
    1,
    2,
    3,
    4,
    5
    ];
get2KeyList(26)->[
    0,
    1,
    2,
    3,
    4,
    5
    ];
get2KeyList(27)->[
    0,
    1,
    2,
    3,
    4,
    5
    ];
get2KeyList(28)->[
    0,
    1,
    2,
    3,
    4,
    5
    ];
get2KeyList(29)->[
    0,
    1,
    2,
    3,
    4,
    5
    ];
get2KeyList(30)->[
    0,
    1,
    2,
    3,
    4,
    5
    ];
get2KeyList(31)->[
    0,
    1,
    2,
    3,
    4,
    5
    ];
get2KeyList(32)->[
    0,
    1,
    2,
    3,
    4,
    5
    ];
get2KeyList(33)->[
    0,
    1,
    2,
    3,
    4,
    5
    ];
get2KeyList(34)->[
    0,
    1,
    2,
    3,
    4,
    5
    ];
get2KeyList(35)->[
    0,
    1,
    2,
    3,
    4,
    5
    ];
get2KeyList(36)->[
    0,
    1,
    2,
    3,
    4,
    5
    ];
get2KeyList(37)->[
    0,
    1,
    2,
    3,
    4,
    5
    ];
get2KeyList(38)->[
    0,
    1,
    2,
    3,
    4,
    5
    ];
get2KeyList(39)->[
    0,
    1,
    2,
    3,
    4,
    5
    ];
get2KeyList(40)->[
    0,
    1,
    2,
    3,
    4,
    5
    ];
get2KeyList(41)->[
    0,
    1,
    2,
    3,
    4,
    5
    ];
get2KeyList(42)->[
    0,
    1,
    2,
    3,
    4,
    5
    ];
get2KeyList(43)->[
    0,
    1,
    2,
    3,
    4,
    5
    ];
get2KeyList(44)->[
    0,
    1,
    2,
    3,
    4,
    5
    ];
get2KeyList(45)->[
    0,
    1,
    2,
    3,
    4,
    5
    ];
get2KeyList(46)->[
    0,
    1,
    2,
    3,
    4,
    5
    ];
get2KeyList(47)->[
    0,
    1,
    2,
    3,
    4,
    5
    ];
get2KeyList(48)->[
    0,
    1,
    2,
    3,
    4,
    5
    ];
get2KeyList(49)->[
    0,
    1,
    2,
    3,
    4,
    5
    ];
get2KeyList(50)->[
    0,
    1,
    2,
    3,
    4,
    5
    ];
get2KeyList(51)->[
    0,
    1,
    2,
    3,
    4,
    5
    ];
get2KeyList(52)->[
    0,
    1,
    2,
    3,
    4,
    5
    ];
get2KeyList(53)->[
    0,
    1,
    2,
    3,
    4,
    5
    ];
get2KeyList(54)->[
    0,
    1,
    2,
    3,
    4,
    5
    ];
get2KeyList(55)->[
    0,
    1,
    2,
    3,
    4,
    5
    ];
get2KeyList(56)->[
    0,
    1,
    2,
    3,
    4,
    5
    ];
get2KeyList(57)->[
    0,
    1,
    2,
    3,
    4,
    5
    ];
get2KeyList(58)->[
    0,
    1,
    2,
    3,
    4,
    5
    ];
get2KeyList(59)->[
    0,
    1,
    2,
    3,
    4,
    5
    ];
get2KeyList(60)->[
    0,
    1,
    2,
    3,
    4,
    5
    ];
get2KeyList(61)->[
    0,
    1,
    2,
    3,
    4,
    5
    ];
get2KeyList(62)->[
    0,
    1,
    2,
    3,
    4,
    5
    ];
get2KeyList(63)->[
    0,
    1,
    2,
    3,
    4,
    5
    ];
get2KeyList(64)->[
    0,
    1,
    2,
    3,
    4,
    5
    ];
get2KeyList(65)->[
    0,
    1,
    2,
    3,
    4,
    5
    ];
get2KeyList(66)->[
    0,
    1,
    2,
    3,
    4,
    5
    ];
get2KeyList(67)->[
    0,
    1,
    2,
    3,
    4,
    5
    ];
get2KeyList(68)->[
    0,
    1,
    2,
    3,
    4,
    5
    ];
get2KeyList(69)->[
    0,
    1,
    2,
    3,
    4,
    5
    ];
get2KeyList(70)->[
    0,
    1,
    2,
    3,
    4,
    5
    ];
get2KeyList(71)->[
    0,
    1,
    2,
    3,
    4,
    5
    ];
get2KeyList(72)->[
    0,
    1,
    2,
    3,
    4,
    5
    ];
get2KeyList(73)->[
    0,
    1,
    2,
    3,
    4,
    5
    ];
get2KeyList(74)->[
    0,
    1,
    2,
    3,
    4,
    5
    ];
get2KeyList(75)->[
    0,
    1,
    2,
    3,
    4,
    5
    ];
get2KeyList(76)->[
    0,
    1,
    2,
    3,
    4,
    5
    ];
get2KeyList(77)->[
    0,
    1,
    2,
    3,
    4,
    5
    ];
get2KeyList(78)->[
    0,
    1,
    2,
    3,
    4,
    5
    ];
get2KeyList(79)->[
    0,
    1,
    2,
    3,
    4,
    5
    ];
get2KeyList(80)->[
    0,
    1,
    2,
    3,
    4,
    5
    ];
get2KeyList(81)->[
    0,
    1,
    2,
    3,
    4,
    5
    ];
get2KeyList(82)->[
    0,
    1,
    2,
    3,
    4,
    5
    ];
get2KeyList(83)->[
    0,
    1,
    2,
    3,
    4,
    5
    ];
get2KeyList(84)->[
    0,
    1,
    2,
    3,
    4,
    5
    ];
get2KeyList(85)->[
    0,
    1,
    2,
    3,
    4,
    5
    ];
get2KeyList(86)->[
    0,
    1,
    2,
    3,
    4,
    5
    ];
get2KeyList(87)->[
    0,
    1,
    2,
    3,
    4,
    5
    ];
get2KeyList(88)->[
    0,
    1,
    2,
    3,
    4,
    5
    ];
get2KeyList(89)->[
    0,
    1,
    2,
    3,
    4,
    5
    ];
get2KeyList(90)->[
    0,
    1,
    2,
    3,
    4,
    5
    ];
get2KeyList(91)->[
    0,
    1,
    2,
    3,
    4,
    5
    ];
get2KeyList(92)->[
    0,
    1,
    2,
    3,
    4,
    5
    ];
get2KeyList(93)->[
    0,
    1,
    2,
    3,
    4,
    5
    ];
get2KeyList(94)->[
    0,
    1,
    2,
    3,
    4,
    5
    ];
get2KeyList(95)->[
    0,
    1,
    2,
    3,
    4,
    5
    ];
get2KeyList(96)->[
    0,
    1,
    2,
    3,
    4,
    5
    ];
get2KeyList(97)->[
    0,
    1,
    2,
    3,
    4,
    5
    ];
get2KeyList(98)->[
    0,
    1,
    2,
    3,
    4,
    5
    ];
get2KeyList(99)->[
    0,
    1,
    2,
    3,
    4,
    5
    ];
get2KeyList(100)->[
    0,
    1,
    2,
    3,
    4,
    5
    ];
get2KeyList(_)->[].

