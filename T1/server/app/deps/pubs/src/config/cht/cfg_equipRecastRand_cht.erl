%% coding: latin-1
%%: 实现
-module(cfg_equipRecastRand_cht).
-compile(export_all).
-include("cfg_equipRecastRand.hrl").
-include("logger.hrl").

getRow(1)->
    #equipRecastRandCfg {
    id = 1,
    group = 111,
    values = [6,14],
    enchant_add = [48,58],
    weight = 1000
    };
getRow(2)->
    #equipRecastRandCfg {
    id = 2,
    group = 112,
    values = [8,18],
    enchant_add = [48,58],
    weight = 1000
    };
getRow(3)->
    #equipRecastRandCfg {
    id = 3,
    group = 113,
    values = [3,6],
    enchant_add = [48,58],
    weight = 1000
    };
getRow(4)->
    #equipRecastRandCfg {
    id = 4,
    group = 121,
    values = [52,122],
    enchant_add = [48,58],
    weight = 1000
    };
getRow(5)->
    #equipRecastRandCfg {
    id = 5,
    group = 122,
    values = [8,18],
    enchant_add = [48,58],
    weight = 1000
    };
getRow(6)->
    #equipRecastRandCfg {
    id = 6,
    group = 123,
    values = [3,6],
    enchant_add = [48,58],
    weight = 1000
    };
getRow(7)->
    #equipRecastRandCfg {
    id = 7,
    group = 131,
    values = [3,8],
    enchant_add = [48,58],
    weight = 1000
    };
getRow(8)->
    #equipRecastRandCfg {
    id = 8,
    group = 132,
    values = [8,18],
    enchant_add = [48,58],
    weight = 1000
    };
getRow(9)->
    #equipRecastRandCfg {
    id = 9,
    group = 133,
    values = [3,6],
    enchant_add = [48,58],
    weight = 1000
    };
getRow(10)->
    #equipRecastRandCfg {
    id = 10,
    group = 141,
    values = [61,142],
    enchant_add = [48,58],
    weight = 1000
    };
getRow(11)->
    #equipRecastRandCfg {
    id = 11,
    group = 142,
    values = [8,18],
    enchant_add = [48,58],
    weight = 1000
    };
getRow(12)->
    #equipRecastRandCfg {
    id = 12,
    group = 143,
    values = [3,6],
    enchant_add = [48,58],
    weight = 1000
    };
getRow(13)->
    #equipRecastRandCfg {
    id = 13,
    group = 151,
    values = [3,8],
    enchant_add = [48,58],
    weight = 1000
    };
getRow(14)->
    #equipRecastRandCfg {
    id = 14,
    group = 152,
    values = [8,18],
    enchant_add = [48,58],
    weight = 1000
    };
getRow(15)->
    #equipRecastRandCfg {
    id = 15,
    group = 153,
    values = [4,10],
    enchant_add = [48,58],
    weight = 1000
    };
getRow(16)->
    #equipRecastRandCfg {
    id = 16,
    group = 161,
    values = [9,20],
    enchant_add = [48,58],
    weight = 1000
    };
getRow(17)->
    #equipRecastRandCfg {
    id = 17,
    group = 162,
    values = [8,18],
    enchant_add = [48,58],
    weight = 1000
    };
getRow(18)->
    #equipRecastRandCfg {
    id = 18,
    group = 163,
    values = [26,61],
    enchant_add = [48,58],
    weight = 1000
    };
getRow(19)->
    #equipRecastRandCfg {
    id = 19,
    group = 171,
    values = [5,12],
    enchant_add = [48,58],
    weight = 1000
    };
getRow(20)->
    #equipRecastRandCfg {
    id = 20,
    group = 172,
    values = [8,18],
    enchant_add = [48,58],
    weight = 1000
    };
getRow(21)->
    #equipRecastRandCfg {
    id = 21,
    group = 173,
    values = [3,8],
    enchant_add = [48,58],
    weight = 1000
    };
getRow(22)->
    #equipRecastRandCfg {
    id = 22,
    group = 181,
    values = [7,16],
    enchant_add = [48,58],
    weight = 1000
    };
getRow(23)->
    #equipRecastRandCfg {
    id = 23,
    group = 182,
    values = [8,18],
    enchant_add = [48,58],
    weight = 1000
    };
getRow(24)->
    #equipRecastRandCfg {
    id = 24,
    group = 183,
    values = [35,81],
    enchant_add = [48,58],
    weight = 1000
    };
getRow(25)->
    #equipRecastRandCfg {
    id = 25,
    group = 211,
    values = [7,15],
    enchant_add = [52,63],
    weight = 1000
    };
getRow(26)->
    #equipRecastRandCfg {
    id = 26,
    group = 212,
    values = [8,19],
    enchant_add = [52,63],
    weight = 1000
    };
getRow(27)->
    #equipRecastRandCfg {
    id = 27,
    group = 213,
    values = [3,7],
    enchant_add = [52,63],
    weight = 1000
    };
getRow(28)->
    #equipRecastRandCfg {
    id = 28,
    group = 221,
    values = [57,132],
    enchant_add = [52,63],
    weight = 1000
    };
getRow(29)->
    #equipRecastRandCfg {
    id = 29,
    group = 222,
    values = [8,19],
    enchant_add = [52,63],
    weight = 1000
    };
getRow(30)->
    #equipRecastRandCfg {
    id = 30,
    group = 223,
    values = [3,7],
    enchant_add = [52,63],
    weight = 1000
    };
getRow(31)->
    #equipRecastRandCfg {
    id = 31,
    group = 231,
    values = [4,9],
    enchant_add = [52,63],
    weight = 1000
    };
getRow(32)->
    #equipRecastRandCfg {
    id = 32,
    group = 232,
    values = [8,19],
    enchant_add = [52,63],
    weight = 1000
    };
getRow(33)->
    #equipRecastRandCfg {
    id = 33,
    group = 233,
    values = [3,7],
    enchant_add = [52,63],
    weight = 1000
    };
getRow(34)->
    #equipRecastRandCfg {
    id = 34,
    group = 241,
    values = [66,154],
    enchant_add = [52,63],
    weight = 1000
    };
getRow(35)->
    #equipRecastRandCfg {
    id = 35,
    group = 242,
    values = [8,19],
    enchant_add = [52,63],
    weight = 1000
    };
getRow(36)->
    #equipRecastRandCfg {
    id = 36,
    group = 243,
    values = [3,7],
    enchant_add = [52,63],
    weight = 1000
    };
getRow(37)->
    #equipRecastRandCfg {
    id = 37,
    group = 251,
    values = [4,9],
    enchant_add = [52,63],
    weight = 1000
    };
getRow(38)->
    #equipRecastRandCfg {
    id = 38,
    group = 252,
    values = [8,19],
    enchant_add = [52,63],
    weight = 1000
    };
getRow(39)->
    #equipRecastRandCfg {
    id = 39,
    group = 253,
    values = [5,11],
    enchant_add = [52,63],
    weight = 1000
    };
getRow(40)->
    #equipRecastRandCfg {
    id = 40,
    group = 261,
    values = [9,22],
    enchant_add = [52,63],
    weight = 1000
    };
getRow(41)->
    #equipRecastRandCfg {
    id = 41,
    group = 262,
    values = [8,19],
    enchant_add = [52,63],
    weight = 1000
    };
getRow(42)->
    #equipRecastRandCfg {
    id = 42,
    group = 263,
    values = [28,66],
    enchant_add = [52,63],
    weight = 1000
    };
getRow(43)->
    #equipRecastRandCfg {
    id = 43,
    group = 271,
    values = [6,13],
    enchant_add = [52,63],
    weight = 1000
    };
getRow(44)->
    #equipRecastRandCfg {
    id = 44,
    group = 272,
    values = [8,19],
    enchant_add = [52,63],
    weight = 1000
    };
getRow(45)->
    #equipRecastRandCfg {
    id = 45,
    group = 273,
    values = [4,9],
    enchant_add = [52,63],
    weight = 1000
    };
getRow(46)->
    #equipRecastRandCfg {
    id = 46,
    group = 281,
    values = [8,18],
    enchant_add = [52,63],
    weight = 1000
    };
getRow(47)->
    #equipRecastRandCfg {
    id = 47,
    group = 282,
    values = [8,19],
    enchant_add = [52,63],
    weight = 1000
    };
getRow(48)->
    #equipRecastRandCfg {
    id = 48,
    group = 283,
    values = [38,88],
    enchant_add = [52,63],
    weight = 1000
    };
getRow(49)->
    #equipRecastRandCfg {
    id = 49,
    group = 311,
    values = [7,17],
    enchant_add = [57,70],
    weight = 1000
    };
getRow(50)->
    #equipRecastRandCfg {
    id = 50,
    group = 312,
    values = [9,21],
    enchant_add = [57,70],
    weight = 1000
    };
getRow(51)->
    #equipRecastRandCfg {
    id = 51,
    group = 313,
    values = [3,7],
    enchant_add = [57,70],
    weight = 1000
    };
getRow(52)->
    #equipRecastRandCfg {
    id = 52,
    group = 321,
    values = [62,146],
    enchant_add = [57,70],
    weight = 1000
    };
getRow(53)->
    #equipRecastRandCfg {
    id = 53,
    group = 322,
    values = [9,21],
    enchant_add = [57,70],
    weight = 1000
    };
getRow(54)->
    #equipRecastRandCfg {
    id = 54,
    group = 323,
    values = [3,7],
    enchant_add = [57,70],
    weight = 1000
    };
getRow(55)->
    #equipRecastRandCfg {
    id = 55,
    group = 331,
    values = [4,10],
    enchant_add = [57,70],
    weight = 1000
    };
getRow(56)->
    #equipRecastRandCfg {
    id = 56,
    group = 332,
    values = [9,21],
    enchant_add = [57,70],
    weight = 1000
    };
getRow(57)->
    #equipRecastRandCfg {
    id = 57,
    group = 333,
    values = [3,7],
    enchant_add = [57,70],
    weight = 1000
    };
getRow(58)->
    #equipRecastRandCfg {
    id = 58,
    group = 341,
    values = [73,170],
    enchant_add = [57,70],
    weight = 1000
    };
getRow(59)->
    #equipRecastRandCfg {
    id = 59,
    group = 342,
    values = [9,21],
    enchant_add = [57,70],
    weight = 1000
    };
getRow(60)->
    #equipRecastRandCfg {
    id = 60,
    group = 343,
    values = [3,7],
    enchant_add = [57,70],
    weight = 1000
    };
getRow(61)->
    #equipRecastRandCfg {
    id = 61,
    group = 351,
    values = [4,10],
    enchant_add = [57,70],
    weight = 1000
    };
getRow(62)->
    #equipRecastRandCfg {
    id = 62,
    group = 352,
    values = [9,21],
    enchant_add = [57,70],
    weight = 1000
    };
getRow(63)->
    #equipRecastRandCfg {
    id = 63,
    group = 353,
    values = [5,12],
    enchant_add = [57,70],
    weight = 1000
    };
getRow(64)->
    #equipRecastRandCfg {
    id = 64,
    group = 361,
    values = [10,24],
    enchant_add = [57,70],
    weight = 1000
    };
getRow(65)->
    #equipRecastRandCfg {
    id = 65,
    group = 362,
    values = [9,21],
    enchant_add = [57,70],
    weight = 1000
    };
getRow(66)->
    #equipRecastRandCfg {
    id = 66,
    group = 363,
    values = [31,73],
    enchant_add = [57,70],
    weight = 1000
    };
getRow(67)->
    #equipRecastRandCfg {
    id = 67,
    group = 371,
    values = [6,15],
    enchant_add = [57,70],
    weight = 1000
    };
getRow(68)->
    #equipRecastRandCfg {
    id = 68,
    group = 372,
    values = [9,21],
    enchant_add = [57,70],
    weight = 1000
    };
getRow(69)->
    #equipRecastRandCfg {
    id = 69,
    group = 373,
    values = [4,10],
    enchant_add = [57,70],
    weight = 1000
    };
getRow(70)->
    #equipRecastRandCfg {
    id = 70,
    group = 381,
    values = [8,19],
    enchant_add = [57,70],
    weight = 1000
    };
getRow(71)->
    #equipRecastRandCfg {
    id = 71,
    group = 382,
    values = [9,21],
    enchant_add = [57,70],
    weight = 1000
    };
getRow(72)->
    #equipRecastRandCfg {
    id = 72,
    group = 383,
    values = [42,97],
    enchant_add = [57,70],
    weight = 1000
    };
getRow(73)->
    #equipRecastRandCfg {
    id = 73,
    group = 411,
    values = [7,17],
    enchant_add = [58,70],
    weight = 1000
    };
getRow(74)->
    #equipRecastRandCfg {
    id = 74,
    group = 412,
    values = [9,21],
    enchant_add = [58,70],
    weight = 1000
    };
getRow(75)->
    #equipRecastRandCfg {
    id = 75,
    group = 413,
    values = [3,7],
    enchant_add = [58,70],
    weight = 1000
    };
getRow(76)->
    #equipRecastRandCfg {
    id = 76,
    group = 421,
    values = [63,147],
    enchant_add = [58,70],
    weight = 1000
    };
getRow(77)->
    #equipRecastRandCfg {
    id = 77,
    group = 422,
    values = [9,21],
    enchant_add = [58,70],
    weight = 1000
    };
getRow(78)->
    #equipRecastRandCfg {
    id = 78,
    group = 423,
    values = [3,7],
    enchant_add = [58,70],
    weight = 1000
    };
getRow(79)->
    #equipRecastRandCfg {
    id = 79,
    group = 431,
    values = [4,10],
    enchant_add = [58,70],
    weight = 1000
    };
getRow(80)->
    #equipRecastRandCfg {
    id = 80,
    group = 432,
    values = [9,21],
    enchant_add = [58,70],
    weight = 1000
    };
getRow(81)->
    #equipRecastRandCfg {
    id = 81,
    group = 433,
    values = [3,7],
    enchant_add = [58,70],
    weight = 1000
    };
getRow(82)->
    #equipRecastRandCfg {
    id = 82,
    group = 441,
    values = [74,172],
    enchant_add = [58,70],
    weight = 1000
    };
getRow(83)->
    #equipRecastRandCfg {
    id = 83,
    group = 442,
    values = [9,21],
    enchant_add = [58,70],
    weight = 1000
    };
getRow(84)->
    #equipRecastRandCfg {
    id = 84,
    group = 443,
    values = [3,7],
    enchant_add = [58,70],
    weight = 1000
    };
getRow(85)->
    #equipRecastRandCfg {
    id = 85,
    group = 451,
    values = [4,10],
    enchant_add = [58,70],
    weight = 1000
    };
getRow(86)->
    #equipRecastRandCfg {
    id = 86,
    group = 452,
    values = [9,21],
    enchant_add = [58,70],
    weight = 1000
    };
getRow(87)->
    #equipRecastRandCfg {
    id = 87,
    group = 453,
    values = [5,12],
    enchant_add = [58,70],
    weight = 1000
    };
getRow(88)->
    #equipRecastRandCfg {
    id = 88,
    group = 461,
    values = [11,25],
    enchant_add = [58,70],
    weight = 1000
    };
getRow(89)->
    #equipRecastRandCfg {
    id = 89,
    group = 462,
    values = [9,21],
    enchant_add = [58,70],
    weight = 1000
    };
getRow(90)->
    #equipRecastRandCfg {
    id = 90,
    group = 463,
    values = [32,74],
    enchant_add = [58,70],
    weight = 1000
    };
getRow(91)->
    #equipRecastRandCfg {
    id = 91,
    group = 471,
    values = [6,15],
    enchant_add = [58,70],
    weight = 1000
    };
getRow(92)->
    #equipRecastRandCfg {
    id = 92,
    group = 472,
    values = [9,21],
    enchant_add = [58,70],
    weight = 1000
    };
getRow(93)->
    #equipRecastRandCfg {
    id = 93,
    group = 473,
    values = [4,10],
    enchant_add = [58,70],
    weight = 1000
    };
getRow(94)->
    #equipRecastRandCfg {
    id = 94,
    group = 481,
    values = [8,20],
    enchant_add = [58,70],
    weight = 1000
    };
getRow(95)->
    #equipRecastRandCfg {
    id = 95,
    group = 482,
    values = [9,21],
    enchant_add = [58,70],
    weight = 1000
    };
getRow(96)->
    #equipRecastRandCfg {
    id = 96,
    group = 483,
    values = [42,98],
    enchant_add = [58,70],
    weight = 1000
    };
getRow(1000)->
    #equipRecastRandCfg {
    id = 1000,
    group = 1111,
    values = [31,46],
    enchant_add = [0,0],
    weight = 7500
    };
getRow(1001)->
    #equipRecastRandCfg {
    id = 1001,
    group = 1112,
    values = [9,14],
    enchant_add = [0,0],
    weight = 7500
    };
getRow(1002)->
    #equipRecastRandCfg {
    id = 1002,
    group = 1113,
    values = [13,20],
    enchant_add = [0,0],
    weight = 7500
    };
getRow(1003)->
    #equipRecastRandCfg {
    id = 1003,
    group = 1121,
    values = [31,46],
    enchant_add = [0,0],
    weight = 7500
    };
getRow(1004)->
    #equipRecastRandCfg {
    id = 1004,
    group = 1122,
    values = [125,187],
    enchant_add = [0,0],
    weight = 7500
    };
getRow(1005)->
    #equipRecastRandCfg {
    id = 1005,
    group = 1123,
    values = [146,218],
    enchant_add = [0,0],
    weight = 7500
    };
getRow(1006)->
    #equipRecastRandCfg {
    id = 1006,
    group = 1131,
    values = [31,46],
    enchant_add = [0,0],
    weight = 7500
    };
getRow(1007)->
    #equipRecastRandCfg {
    id = 1007,
    group = 1132,
    values = [9,14],
    enchant_add = [0,0],
    weight = 7500
    };
getRow(1008)->
    #equipRecastRandCfg {
    id = 1008,
    group = 1133,
    values = [13,20],
    enchant_add = [0,0],
    weight = 7500
    };
getRow(1009)->
    #equipRecastRandCfg {
    id = 1009,
    group = 1141,
    values = [31,46],
    enchant_add = [0,0],
    weight = 7500
    };
getRow(1010)->
    #equipRecastRandCfg {
    id = 1010,
    group = 1142,
    values = [125,187],
    enchant_add = [0,0],
    weight = 7500
    };
getRow(1011)->
    #equipRecastRandCfg {
    id = 1011,
    group = 1143,
    values = [146,218],
    enchant_add = [0,0],
    weight = 7500
    };
getRow(1012)->
    #equipRecastRandCfg {
    id = 1012,
    group = 1151,
    values = [31,46],
    enchant_add = [0,0],
    weight = 7500
    };
getRow(1013)->
    #equipRecastRandCfg {
    id = 1013,
    group = 1152,
    values = [36,54],
    enchant_add = [0,0],
    weight = 7500
    };
getRow(1014)->
    #equipRecastRandCfg {
    id = 1014,
    group = 1153,
    values = [13,20],
    enchant_add = [0,0],
    weight = 7500
    };
getRow(1015)->
    #equipRecastRandCfg {
    id = 1015,
    group = 1161,
    values = [31,46],
    enchant_add = [0,0],
    weight = 7500
    };
getRow(1016)->
    #equipRecastRandCfg {
    id = 1016,
    group = 1162,
    values = [36,54],
    enchant_add = [0,0],
    weight = 7500
    };
getRow(1017)->
    #equipRecastRandCfg {
    id = 1017,
    group = 1163,
    values = [146,218],
    enchant_add = [0,0],
    weight = 7500
    };
getRow(1018)->
    #equipRecastRandCfg {
    id = 1018,
    group = 1171,
    values = [31,46],
    enchant_add = [0,0],
    weight = 7500
    };
getRow(1019)->
    #equipRecastRandCfg {
    id = 1019,
    group = 1172,
    values = [36,54],
    enchant_add = [0,0],
    weight = 7500
    };
getRow(1020)->
    #equipRecastRandCfg {
    id = 1020,
    group = 1173,
    values = [13,20],
    enchant_add = [0,0],
    weight = 7500
    };
getRow(1021)->
    #equipRecastRandCfg {
    id = 1021,
    group = 1181,
    values = [31,46],
    enchant_add = [0,0],
    weight = 7500
    };
getRow(1022)->
    #equipRecastRandCfg {
    id = 1022,
    group = 1182,
    values = [36,54],
    enchant_add = [0,0],
    weight = 7500
    };
getRow(1023)->
    #equipRecastRandCfg {
    id = 1023,
    group = 1183,
    values = [146,218],
    enchant_add = [0,0],
    weight = 7500
    };
getRow(1024)->
    #equipRecastRandCfg {
    id = 1024,
    group = 1211,
    values = [46,69],
    enchant_add = [0,0],
    weight = 7500
    };
getRow(1025)->
    #equipRecastRandCfg {
    id = 1025,
    group = 1212,
    values = [14,21],
    enchant_add = [0,0],
    weight = 7500
    };
getRow(1026)->
    #equipRecastRandCfg {
    id = 1026,
    group = 1213,
    values = [20,30],
    enchant_add = [0,0],
    weight = 7500
    };
getRow(1027)->
    #equipRecastRandCfg {
    id = 1027,
    group = 1221,
    values = [46,69],
    enchant_add = [0,0],
    weight = 7500
    };
getRow(1028)->
    #equipRecastRandCfg {
    id = 1028,
    group = 1222,
    values = [187,281],
    enchant_add = [0,0],
    weight = 7500
    };
getRow(1029)->
    #equipRecastRandCfg {
    id = 1029,
    group = 1223,
    values = [218,328],
    enchant_add = [0,0],
    weight = 7500
    };
getRow(1030)->
    #equipRecastRandCfg {
    id = 1030,
    group = 1231,
    values = [46,69],
    enchant_add = [0,0],
    weight = 7500
    };
getRow(1031)->
    #equipRecastRandCfg {
    id = 1031,
    group = 1232,
    values = [14,21],
    enchant_add = [0,0],
    weight = 7500
    };
getRow(1032)->
    #equipRecastRandCfg {
    id = 1032,
    group = 1233,
    values = [20,30],
    enchant_add = [0,0],
    weight = 7500
    };
getRow(1033)->
    #equipRecastRandCfg {
    id = 1033,
    group = 1241,
    values = [46,69],
    enchant_add = [0,0],
    weight = 7500
    };
getRow(1034)->
    #equipRecastRandCfg {
    id = 1034,
    group = 1242,
    values = [187,281],
    enchant_add = [0,0],
    weight = 7500
    };
getRow(1035)->
    #equipRecastRandCfg {
    id = 1035,
    group = 1243,
    values = [218,328],
    enchant_add = [0,0],
    weight = 7500
    };
getRow(1036)->
    #equipRecastRandCfg {
    id = 1036,
    group = 1251,
    values = [46,69],
    enchant_add = [0,0],
    weight = 7500
    };
getRow(1037)->
    #equipRecastRandCfg {
    id = 1037,
    group = 1252,
    values = [54,82],
    enchant_add = [0,0],
    weight = 7500
    };
getRow(1038)->
    #equipRecastRandCfg {
    id = 1038,
    group = 1253,
    values = [20,30],
    enchant_add = [0,0],
    weight = 7500
    };
getRow(1039)->
    #equipRecastRandCfg {
    id = 1039,
    group = 1261,
    values = [46,69],
    enchant_add = [0,0],
    weight = 7500
    };
getRow(1040)->
    #equipRecastRandCfg {
    id = 1040,
    group = 1262,
    values = [54,82],
    enchant_add = [0,0],
    weight = 7500
    };
getRow(1041)->
    #equipRecastRandCfg {
    id = 1041,
    group = 1263,
    values = [218,328],
    enchant_add = [0,0],
    weight = 7500
    };
getRow(1042)->
    #equipRecastRandCfg {
    id = 1042,
    group = 1271,
    values = [46,69],
    enchant_add = [0,0],
    weight = 7500
    };
getRow(1043)->
    #equipRecastRandCfg {
    id = 1043,
    group = 1272,
    values = [54,82],
    enchant_add = [0,0],
    weight = 7500
    };
getRow(1044)->
    #equipRecastRandCfg {
    id = 1044,
    group = 1273,
    values = [20,30],
    enchant_add = [0,0],
    weight = 7500
    };
getRow(1045)->
    #equipRecastRandCfg {
    id = 1045,
    group = 1281,
    values = [46,69],
    enchant_add = [0,0],
    weight = 7500
    };
getRow(1046)->
    #equipRecastRandCfg {
    id = 1046,
    group = 1282,
    values = [54,82],
    enchant_add = [0,0],
    weight = 7500
    };
getRow(1047)->
    #equipRecastRandCfg {
    id = 1047,
    group = 1283,
    values = [218,328],
    enchant_add = [0,0],
    weight = 7500
    };
getRow(1048)->
    #equipRecastRandCfg {
    id = 1048,
    group = 1311,
    values = [56,84],
    enchant_add = [0,0],
    weight = 7500
    };
getRow(1049)->
    #equipRecastRandCfg {
    id = 1049,
    group = 1312,
    values = [17,26],
    enchant_add = [0,0],
    weight = 7500
    };
getRow(1050)->
    #equipRecastRandCfg {
    id = 1050,
    group = 1313,
    values = [24,36],
    enchant_add = [0,0],
    weight = 7500
    };
getRow(1051)->
    #equipRecastRandCfg {
    id = 1051,
    group = 1321,
    values = [56,84],
    enchant_add = [0,0],
    weight = 7500
    };
getRow(1052)->
    #equipRecastRandCfg {
    id = 1052,
    group = 1322,
    values = [229,343],
    enchant_add = [0,0],
    weight = 7500
    };
getRow(1053)->
    #equipRecastRandCfg {
    id = 1053,
    group = 1323,
    values = [267,401],
    enchant_add = [0,0],
    weight = 7500
    };
getRow(1054)->
    #equipRecastRandCfg {
    id = 1054,
    group = 1331,
    values = [56,84],
    enchant_add = [0,0],
    weight = 7500
    };
getRow(1055)->
    #equipRecastRandCfg {
    id = 1055,
    group = 1332,
    values = [17,26],
    enchant_add = [0,0],
    weight = 7500
    };
getRow(1056)->
    #equipRecastRandCfg {
    id = 1056,
    group = 1333,
    values = [24,36],
    enchant_add = [0,0],
    weight = 7500
    };
getRow(1057)->
    #equipRecastRandCfg {
    id = 1057,
    group = 1341,
    values = [56,84],
    enchant_add = [0,0],
    weight = 7500
    };
getRow(1058)->
    #equipRecastRandCfg {
    id = 1058,
    group = 1342,
    values = [229,343],
    enchant_add = [0,0],
    weight = 7500
    };
getRow(1059)->
    #equipRecastRandCfg {
    id = 1059,
    group = 1343,
    values = [267,401],
    enchant_add = [0,0],
    weight = 7500
    };
getRow(1060)->
    #equipRecastRandCfg {
    id = 1060,
    group = 1351,
    values = [56,84],
    enchant_add = [0,0],
    weight = 7500
    };
getRow(1061)->
    #equipRecastRandCfg {
    id = 1061,
    group = 1352,
    values = [66,100],
    enchant_add = [0,0],
    weight = 7500
    };
getRow(1062)->
    #equipRecastRandCfg {
    id = 1062,
    group = 1353,
    values = [24,36],
    enchant_add = [0,0],
    weight = 7500
    };
getRow(1063)->
    #equipRecastRandCfg {
    id = 1063,
    group = 1361,
    values = [56,84],
    enchant_add = [0,0],
    weight = 7500
    };
getRow(1064)->
    #equipRecastRandCfg {
    id = 1064,
    group = 1362,
    values = [66,100],
    enchant_add = [0,0],
    weight = 7500
    };
getRow(1065)->
    #equipRecastRandCfg {
    id = 1065,
    group = 1363,
    values = [267,401],
    enchant_add = [0,0],
    weight = 7500
    };
getRow(1066)->
    #equipRecastRandCfg {
    id = 1066,
    group = 1371,
    values = [56,84],
    enchant_add = [0,0],
    weight = 7500
    };
getRow(1067)->
    #equipRecastRandCfg {
    id = 1067,
    group = 1372,
    values = [66,100],
    enchant_add = [0,0],
    weight = 7500
    };
getRow(1068)->
    #equipRecastRandCfg {
    id = 1068,
    group = 1373,
    values = [24,36],
    enchant_add = [0,0],
    weight = 7500
    };
getRow(1069)->
    #equipRecastRandCfg {
    id = 1069,
    group = 1381,
    values = [56,84],
    enchant_add = [0,0],
    weight = 7500
    };
getRow(1070)->
    #equipRecastRandCfg {
    id = 1070,
    group = 1382,
    values = [66,100],
    enchant_add = [0,0],
    weight = 7500
    };
getRow(1071)->
    #equipRecastRandCfg {
    id = 1071,
    group = 1383,
    values = [267,401],
    enchant_add = [0,0],
    weight = 7500
    };
getRow(1072)->
    #equipRecastRandCfg {
    id = 1072,
    group = 1411,
    values = [59,88],
    enchant_add = [0,0],
    weight = 7500
    };
getRow(1073)->
    #equipRecastRandCfg {
    id = 1073,
    group = 1412,
    values = [18,27],
    enchant_add = [0,0],
    weight = 7500
    };
getRow(1074)->
    #equipRecastRandCfg {
    id = 1074,
    group = 1413,
    values = [25,38],
    enchant_add = [0,0],
    weight = 7500
    };
getRow(1075)->
    #equipRecastRandCfg {
    id = 1075,
    group = 1421,
    values = [59,88],
    enchant_add = [0,0],
    weight = 7500
    };
getRow(1076)->
    #equipRecastRandCfg {
    id = 1076,
    group = 1422,
    values = [239,359],
    enchant_add = [0,0],
    weight = 7500
    };
getRow(1077)->
    #equipRecastRandCfg {
    id = 1077,
    group = 1423,
    values = [279,419],
    enchant_add = [0,0],
    weight = 7500
    };
getRow(1078)->
    #equipRecastRandCfg {
    id = 1078,
    group = 1431,
    values = [59,88],
    enchant_add = [0,0],
    weight = 7500
    };
getRow(1079)->
    #equipRecastRandCfg {
    id = 1079,
    group = 1432,
    values = [18,27],
    enchant_add = [0,0],
    weight = 7500
    };
getRow(1080)->
    #equipRecastRandCfg {
    id = 1080,
    group = 1433,
    values = [25,38],
    enchant_add = [0,0],
    weight = 7500
    };
getRow(1081)->
    #equipRecastRandCfg {
    id = 1081,
    group = 1441,
    values = [59,88],
    enchant_add = [0,0],
    weight = 7500
    };
getRow(1082)->
    #equipRecastRandCfg {
    id = 1082,
    group = 1442,
    values = [239,359],
    enchant_add = [0,0],
    weight = 7500
    };
getRow(1083)->
    #equipRecastRandCfg {
    id = 1083,
    group = 1443,
    values = [279,419],
    enchant_add = [0,0],
    weight = 7500
    };
getRow(1084)->
    #equipRecastRandCfg {
    id = 1084,
    group = 1451,
    values = [59,88],
    enchant_add = [0,0],
    weight = 7500
    };
getRow(1085)->
    #equipRecastRandCfg {
    id = 1085,
    group = 1452,
    values = [70,104],
    enchant_add = [0,0],
    weight = 7500
    };
getRow(1086)->
    #equipRecastRandCfg {
    id = 1086,
    group = 1453,
    values = [25,38],
    enchant_add = [0,0],
    weight = 7500
    };
getRow(1087)->
    #equipRecastRandCfg {
    id = 1087,
    group = 1461,
    values = [59,88],
    enchant_add = [0,0],
    weight = 7500
    };
getRow(1088)->
    #equipRecastRandCfg {
    id = 1088,
    group = 1462,
    values = [70,104],
    enchant_add = [0,0],
    weight = 7500
    };
getRow(1089)->
    #equipRecastRandCfg {
    id = 1089,
    group = 1463,
    values = [279,419],
    enchant_add = [0,0],
    weight = 7500
    };
getRow(1090)->
    #equipRecastRandCfg {
    id = 1090,
    group = 1471,
    values = [59,88],
    enchant_add = [0,0],
    weight = 7500
    };
getRow(1091)->
    #equipRecastRandCfg {
    id = 1091,
    group = 1472,
    values = [70,104],
    enchant_add = [0,0],
    weight = 7500
    };
getRow(1092)->
    #equipRecastRandCfg {
    id = 1092,
    group = 1473,
    values = [25,38],
    enchant_add = [0,0],
    weight = 7500
    };
getRow(1093)->
    #equipRecastRandCfg {
    id = 1093,
    group = 1481,
    values = [59,88],
    enchant_add = [0,0],
    weight = 7500
    };
getRow(1094)->
    #equipRecastRandCfg {
    id = 1094,
    group = 1482,
    values = [70,104],
    enchant_add = [0,0],
    weight = 7500
    };
getRow(1095)->
    #equipRecastRandCfg {
    id = 1095,
    group = 1483,
    values = [279,419],
    enchant_add = [0,0],
    weight = 7500
    };
getRow(2000)->
    #equipRecastRandCfg {
    id = 2000,
    group = 1111,
    values = [-2,-1],
    enchant_add = [0,0],
    weight = 2500
    };
getRow(2001)->
    #equipRecastRandCfg {
    id = 2001,
    group = 1112,
    values = [-2,-1],
    enchant_add = [0,0],
    weight = 2500
    };
getRow(2002)->
    #equipRecastRandCfg {
    id = 2002,
    group = 1113,
    values = [-2,-1],
    enchant_add = [0,0],
    weight = 2500
    };
getRow(2003)->
    #equipRecastRandCfg {
    id = 2003,
    group = 1121,
    values = [-2,-1],
    enchant_add = [0,0],
    weight = 2500
    };
getRow(2004)->
    #equipRecastRandCfg {
    id = 2004,
    group = 1122,
    values = [-2,-1],
    enchant_add = [0,0],
    weight = 2500
    };
getRow(2005)->
    #equipRecastRandCfg {
    id = 2005,
    group = 1123,
    values = [-2,-1],
    enchant_add = [0,0],
    weight = 2500
    };
getRow(2006)->
    #equipRecastRandCfg {
    id = 2006,
    group = 1131,
    values = [-2,-1],
    enchant_add = [0,0],
    weight = 2500
    };
getRow(2007)->
    #equipRecastRandCfg {
    id = 2007,
    group = 1132,
    values = [-2,-1],
    enchant_add = [0,0],
    weight = 2500
    };
getRow(2008)->
    #equipRecastRandCfg {
    id = 2008,
    group = 1133,
    values = [-2,-1],
    enchant_add = [0,0],
    weight = 2500
    };
getRow(2009)->
    #equipRecastRandCfg {
    id = 2009,
    group = 1141,
    values = [-2,-1],
    enchant_add = [0,0],
    weight = 2500
    };
getRow(2010)->
    #equipRecastRandCfg {
    id = 2010,
    group = 1142,
    values = [-2,-1],
    enchant_add = [0,0],
    weight = 2500
    };
getRow(2011)->
    #equipRecastRandCfg {
    id = 2011,
    group = 1143,
    values = [-2,-1],
    enchant_add = [0,0],
    weight = 2500
    };
getRow(2012)->
    #equipRecastRandCfg {
    id = 2012,
    group = 1151,
    values = [-2,-1],
    enchant_add = [0,0],
    weight = 2500
    };
getRow(2013)->
    #equipRecastRandCfg {
    id = 2013,
    group = 1152,
    values = [-2,-1],
    enchant_add = [0,0],
    weight = 2500
    };
getRow(2014)->
    #equipRecastRandCfg {
    id = 2014,
    group = 1153,
    values = [-2,-1],
    enchant_add = [0,0],
    weight = 2500
    };
getRow(2015)->
    #equipRecastRandCfg {
    id = 2015,
    group = 1161,
    values = [-2,-1],
    enchant_add = [0,0],
    weight = 2500
    };
getRow(2016)->
    #equipRecastRandCfg {
    id = 2016,
    group = 1162,
    values = [-2,-1],
    enchant_add = [0,0],
    weight = 2500
    };
getRow(2017)->
    #equipRecastRandCfg {
    id = 2017,
    group = 1163,
    values = [-2,-1],
    enchant_add = [0,0],
    weight = 2500
    };
getRow(2018)->
    #equipRecastRandCfg {
    id = 2018,
    group = 1171,
    values = [-2,-1],
    enchant_add = [0,0],
    weight = 2500
    };
getRow(2019)->
    #equipRecastRandCfg {
    id = 2019,
    group = 1172,
    values = [-2,-1],
    enchant_add = [0,0],
    weight = 2500
    };
getRow(2020)->
    #equipRecastRandCfg {
    id = 2020,
    group = 1173,
    values = [-2,-1],
    enchant_add = [0,0],
    weight = 2500
    };
getRow(2021)->
    #equipRecastRandCfg {
    id = 2021,
    group = 1181,
    values = [-2,-1],
    enchant_add = [0,0],
    weight = 2500
    };
getRow(2022)->
    #equipRecastRandCfg {
    id = 2022,
    group = 1182,
    values = [-2,-1],
    enchant_add = [0,0],
    weight = 2500
    };
getRow(2023)->
    #equipRecastRandCfg {
    id = 2023,
    group = 1183,
    values = [-2,-1],
    enchant_add = [0,0],
    weight = 2500
    };
getRow(2024)->
    #equipRecastRandCfg {
    id = 2024,
    group = 1211,
    values = [-2,-1],
    enchant_add = [0,0],
    weight = 2500
    };
getRow(2025)->
    #equipRecastRandCfg {
    id = 2025,
    group = 1212,
    values = [-2,-1],
    enchant_add = [0,0],
    weight = 2500
    };
getRow(2026)->
    #equipRecastRandCfg {
    id = 2026,
    group = 1213,
    values = [-2,-1],
    enchant_add = [0,0],
    weight = 2500
    };
getRow(2027)->
    #equipRecastRandCfg {
    id = 2027,
    group = 1221,
    values = [-2,-1],
    enchant_add = [0,0],
    weight = 2500
    };
getRow(2028)->
    #equipRecastRandCfg {
    id = 2028,
    group = 1222,
    values = [-2,-1],
    enchant_add = [0,0],
    weight = 2500
    };
getRow(2029)->
    #equipRecastRandCfg {
    id = 2029,
    group = 1223,
    values = [-2,-1],
    enchant_add = [0,0],
    weight = 2500
    };
getRow(2030)->
    #equipRecastRandCfg {
    id = 2030,
    group = 1231,
    values = [-2,-1],
    enchant_add = [0,0],
    weight = 2500
    };
getRow(2031)->
    #equipRecastRandCfg {
    id = 2031,
    group = 1232,
    values = [-2,-1],
    enchant_add = [0,0],
    weight = 2500
    };
getRow(2032)->
    #equipRecastRandCfg {
    id = 2032,
    group = 1233,
    values = [-2,-1],
    enchant_add = [0,0],
    weight = 2500
    };
getRow(2033)->
    #equipRecastRandCfg {
    id = 2033,
    group = 1241,
    values = [-2,-1],
    enchant_add = [0,0],
    weight = 2500
    };
getRow(2034)->
    #equipRecastRandCfg {
    id = 2034,
    group = 1242,
    values = [-2,-1],
    enchant_add = [0,0],
    weight = 2500
    };
getRow(2035)->
    #equipRecastRandCfg {
    id = 2035,
    group = 1243,
    values = [-2,-1],
    enchant_add = [0,0],
    weight = 2500
    };
getRow(2036)->
    #equipRecastRandCfg {
    id = 2036,
    group = 1251,
    values = [-2,-1],
    enchant_add = [0,0],
    weight = 2500
    };
getRow(2037)->
    #equipRecastRandCfg {
    id = 2037,
    group = 1252,
    values = [-2,-1],
    enchant_add = [0,0],
    weight = 2500
    };
getRow(2038)->
    #equipRecastRandCfg {
    id = 2038,
    group = 1253,
    values = [-2,-1],
    enchant_add = [0,0],
    weight = 2500
    };
getRow(2039)->
    #equipRecastRandCfg {
    id = 2039,
    group = 1261,
    values = [-2,-1],
    enchant_add = [0,0],
    weight = 2500
    };
getRow(2040)->
    #equipRecastRandCfg {
    id = 2040,
    group = 1262,
    values = [-2,-1],
    enchant_add = [0,0],
    weight = 2500
    };
getRow(2041)->
    #equipRecastRandCfg {
    id = 2041,
    group = 1263,
    values = [-2,-1],
    enchant_add = [0,0],
    weight = 2500
    };
getRow(2042)->
    #equipRecastRandCfg {
    id = 2042,
    group = 1271,
    values = [-2,-1],
    enchant_add = [0,0],
    weight = 2500
    };
getRow(2043)->
    #equipRecastRandCfg {
    id = 2043,
    group = 1272,
    values = [-2,-1],
    enchant_add = [0,0],
    weight = 2500
    };
getRow(2044)->
    #equipRecastRandCfg {
    id = 2044,
    group = 1273,
    values = [-2,-1],
    enchant_add = [0,0],
    weight = 2500
    };
getRow(2045)->
    #equipRecastRandCfg {
    id = 2045,
    group = 1281,
    values = [-2,-1],
    enchant_add = [0,0],
    weight = 2500
    };
getRow(2046)->
    #equipRecastRandCfg {
    id = 2046,
    group = 1282,
    values = [-2,-1],
    enchant_add = [0,0],
    weight = 2500
    };
getRow(2047)->
    #equipRecastRandCfg {
    id = 2047,
    group = 1283,
    values = [-2,-1],
    enchant_add = [0,0],
    weight = 2500
    };
getRow(2048)->
    #equipRecastRandCfg {
    id = 2048,
    group = 1311,
    values = [-2,-1],
    enchant_add = [0,0],
    weight = 2500
    };
getRow(2049)->
    #equipRecastRandCfg {
    id = 2049,
    group = 1312,
    values = [-2,-1],
    enchant_add = [0,0],
    weight = 2500
    };
getRow(2050)->
    #equipRecastRandCfg {
    id = 2050,
    group = 1313,
    values = [-2,-1],
    enchant_add = [0,0],
    weight = 2500
    };
getRow(2051)->
    #equipRecastRandCfg {
    id = 2051,
    group = 1321,
    values = [-2,-1],
    enchant_add = [0,0],
    weight = 2500
    };
getRow(2052)->
    #equipRecastRandCfg {
    id = 2052,
    group = 1322,
    values = [-2,-1],
    enchant_add = [0,0],
    weight = 2500
    };
getRow(2053)->
    #equipRecastRandCfg {
    id = 2053,
    group = 1323,
    values = [-2,-1],
    enchant_add = [0,0],
    weight = 2500
    };
getRow(2054)->
    #equipRecastRandCfg {
    id = 2054,
    group = 1331,
    values = [-2,-1],
    enchant_add = [0,0],
    weight = 2500
    };
getRow(2055)->
    #equipRecastRandCfg {
    id = 2055,
    group = 1332,
    values = [-2,-1],
    enchant_add = [0,0],
    weight = 2500
    };
getRow(2056)->
    #equipRecastRandCfg {
    id = 2056,
    group = 1333,
    values = [-2,-1],
    enchant_add = [0,0],
    weight = 2500
    };
getRow(2057)->
    #equipRecastRandCfg {
    id = 2057,
    group = 1341,
    values = [-2,-1],
    enchant_add = [0,0],
    weight = 2500
    };
getRow(2058)->
    #equipRecastRandCfg {
    id = 2058,
    group = 1342,
    values = [-2,-1],
    enchant_add = [0,0],
    weight = 2500
    };
getRow(2059)->
    #equipRecastRandCfg {
    id = 2059,
    group = 1343,
    values = [-2,-1],
    enchant_add = [0,0],
    weight = 2500
    };
getRow(2060)->
    #equipRecastRandCfg {
    id = 2060,
    group = 1351,
    values = [-2,-1],
    enchant_add = [0,0],
    weight = 2500
    };
getRow(2061)->
    #equipRecastRandCfg {
    id = 2061,
    group = 1352,
    values = [-2,-1],
    enchant_add = [0,0],
    weight = 2500
    };
getRow(2062)->
    #equipRecastRandCfg {
    id = 2062,
    group = 1353,
    values = [-2,-1],
    enchant_add = [0,0],
    weight = 2500
    };
getRow(2063)->
    #equipRecastRandCfg {
    id = 2063,
    group = 1361,
    values = [-2,-1],
    enchant_add = [0,0],
    weight = 2500
    };
getRow(2064)->
    #equipRecastRandCfg {
    id = 2064,
    group = 1362,
    values = [-2,-1],
    enchant_add = [0,0],
    weight = 2500
    };
getRow(2065)->
    #equipRecastRandCfg {
    id = 2065,
    group = 1363,
    values = [-2,-1],
    enchant_add = [0,0],
    weight = 2500
    };
getRow(2066)->
    #equipRecastRandCfg {
    id = 2066,
    group = 1371,
    values = [-2,-1],
    enchant_add = [0,0],
    weight = 2500
    };
getRow(2067)->
    #equipRecastRandCfg {
    id = 2067,
    group = 1372,
    values = [-2,-1],
    enchant_add = [0,0],
    weight = 2500
    };
getRow(2068)->
    #equipRecastRandCfg {
    id = 2068,
    group = 1373,
    values = [-2,-1],
    enchant_add = [0,0],
    weight = 2500
    };
getRow(2069)->
    #equipRecastRandCfg {
    id = 2069,
    group = 1381,
    values = [-2,-1],
    enchant_add = [0,0],
    weight = 2500
    };
getRow(2070)->
    #equipRecastRandCfg {
    id = 2070,
    group = 1382,
    values = [-2,-1],
    enchant_add = [0,0],
    weight = 2500
    };
getRow(2071)->
    #equipRecastRandCfg {
    id = 2071,
    group = 1383,
    values = [-2,-1],
    enchant_add = [0,0],
    weight = 2500
    };
getRow(2072)->
    #equipRecastRandCfg {
    id = 2072,
    group = 1411,
    values = [-2,-1],
    enchant_add = [0,0],
    weight = 2500
    };
getRow(2073)->
    #equipRecastRandCfg {
    id = 2073,
    group = 1412,
    values = [-2,-1],
    enchant_add = [0,0],
    weight = 2500
    };
getRow(2074)->
    #equipRecastRandCfg {
    id = 2074,
    group = 1413,
    values = [-2,-1],
    enchant_add = [0,0],
    weight = 2500
    };
getRow(2075)->
    #equipRecastRandCfg {
    id = 2075,
    group = 1421,
    values = [-2,-1],
    enchant_add = [0,0],
    weight = 2500
    };
getRow(2076)->
    #equipRecastRandCfg {
    id = 2076,
    group = 1422,
    values = [-2,-1],
    enchant_add = [0,0],
    weight = 2500
    };
getRow(2077)->
    #equipRecastRandCfg {
    id = 2077,
    group = 1423,
    values = [-2,-1],
    enchant_add = [0,0],
    weight = 2500
    };
getRow(2078)->
    #equipRecastRandCfg {
    id = 2078,
    group = 1431,
    values = [-2,-1],
    enchant_add = [0,0],
    weight = 2500
    };
getRow(2079)->
    #equipRecastRandCfg {
    id = 2079,
    group = 1432,
    values = [-2,-1],
    enchant_add = [0,0],
    weight = 2500
    };
getRow(2080)->
    #equipRecastRandCfg {
    id = 2080,
    group = 1433,
    values = [-2,-1],
    enchant_add = [0,0],
    weight = 2500
    };
getRow(2081)->
    #equipRecastRandCfg {
    id = 2081,
    group = 1441,
    values = [-2,-1],
    enchant_add = [0,0],
    weight = 2500
    };
getRow(2082)->
    #equipRecastRandCfg {
    id = 2082,
    group = 1442,
    values = [-2,-1],
    enchant_add = [0,0],
    weight = 2500
    };
getRow(2083)->
    #equipRecastRandCfg {
    id = 2083,
    group = 1443,
    values = [-2,-1],
    enchant_add = [0,0],
    weight = 2500
    };
getRow(2084)->
    #equipRecastRandCfg {
    id = 2084,
    group = 1451,
    values = [-2,-1],
    enchant_add = [0,0],
    weight = 2500
    };
getRow(2085)->
    #equipRecastRandCfg {
    id = 2085,
    group = 1452,
    values = [-2,-1],
    enchant_add = [0,0],
    weight = 2500
    };
getRow(2086)->
    #equipRecastRandCfg {
    id = 2086,
    group = 1453,
    values = [-2,-1],
    enchant_add = [0,0],
    weight = 2500
    };
getRow(2087)->
    #equipRecastRandCfg {
    id = 2087,
    group = 1461,
    values = [-2,-1],
    enchant_add = [0,0],
    weight = 2500
    };
getRow(2088)->
    #equipRecastRandCfg {
    id = 2088,
    group = 1462,
    values = [-2,-1],
    enchant_add = [0,0],
    weight = 2500
    };
getRow(2089)->
    #equipRecastRandCfg {
    id = 2089,
    group = 1463,
    values = [-2,-1],
    enchant_add = [0,0],
    weight = 2500
    };
getRow(2090)->
    #equipRecastRandCfg {
    id = 2090,
    group = 1471,
    values = [-2,-1],
    enchant_add = [0,0],
    weight = 2500
    };
getRow(2091)->
    #equipRecastRandCfg {
    id = 2091,
    group = 1472,
    values = [-2,-1],
    enchant_add = [0,0],
    weight = 2500
    };
getRow(2092)->
    #equipRecastRandCfg {
    id = 2092,
    group = 1473,
    values = [-2,-1],
    enchant_add = [0,0],
    weight = 2500
    };
getRow(2093)->
    #equipRecastRandCfg {
    id = 2093,
    group = 1481,
    values = [-2,-1],
    enchant_add = [0,0],
    weight = 2500
    };
getRow(2094)->
    #equipRecastRandCfg {
    id = 2094,
    group = 1482,
    values = [-2,-1],
    enchant_add = [0,0],
    weight = 2500
    };
getRow(2095)->
    #equipRecastRandCfg {
    id = 2095,
    group = 1483,
    values = [-2,-1],
    enchant_add = [0,0],
    weight = 2500
    };
getRow(_)->[].

getKeyList()->[
    {1},
    {2},
    {3},
    {4},
    {5},
    {6},
    {7},
    {8},
    {9},
    {10},
    {11},
    {12},
    {13},
    {14},
    {15},
    {16},
    {17},
    {18},
    {19},
    {20},
    {21},
    {22},
    {23},
    {24},
    {25},
    {26},
    {27},
    {28},
    {29},
    {30},
    {31},
    {32},
    {33},
    {34},
    {35},
    {36},
    {37},
    {38},
    {39},
    {40},
    {41},
    {42},
    {43},
    {44},
    {45},
    {46},
    {47},
    {48},
    {49},
    {50},
    {51},
    {52},
    {53},
    {54},
    {55},
    {56},
    {57},
    {58},
    {59},
    {60},
    {61},
    {62},
    {63},
    {64},
    {65},
    {66},
    {67},
    {68},
    {69},
    {70},
    {71},
    {72},
    {73},
    {74},
    {75},
    {76},
    {77},
    {78},
    {79},
    {80},
    {81},
    {82},
    {83},
    {84},
    {85},
    {86},
    {87},
    {88},
    {89},
    {90},
    {91},
    {92},
    {93},
    {94},
    {95},
    {96},
    {1000},
    {1001},
    {1002},
    {1003},
    {1004},
    {1005},
    {1006},
    {1007},
    {1008},
    {1009},
    {1010},
    {1011},
    {1012},
    {1013},
    {1014},
    {1015},
    {1016},
    {1017},
    {1018},
    {1019},
    {1020},
    {1021},
    {1022},
    {1023},
    {1024},
    {1025},
    {1026},
    {1027},
    {1028},
    {1029},
    {1030},
    {1031},
    {1032},
    {1033},
    {1034},
    {1035},
    {1036},
    {1037},
    {1038},
    {1039},
    {1040},
    {1041},
    {1042},
    {1043},
    {1044},
    {1045},
    {1046},
    {1047},
    {1048},
    {1049},
    {1050},
    {1051},
    {1052},
    {1053},
    {1054},
    {1055},
    {1056},
    {1057},
    {1058},
    {1059},
    {1060},
    {1061},
    {1062},
    {1063},
    {1064},
    {1065},
    {1066},
    {1067},
    {1068},
    {1069},
    {1070},
    {1071},
    {1072},
    {1073},
    {1074},
    {1075},
    {1076},
    {1077},
    {1078},
    {1079},
    {1080},
    {1081},
    {1082},
    {1083},
    {1084},
    {1085},
    {1086},
    {1087},
    {1088},
    {1089},
    {1090},
    {1091},
    {1092},
    {1093},
    {1094},
    {1095},
    {2000},
    {2001},
    {2002},
    {2003},
    {2004},
    {2005},
    {2006},
    {2007},
    {2008},
    {2009},
    {2010},
    {2011},
    {2012},
    {2013},
    {2014},
    {2015},
    {2016},
    {2017},
    {2018},
    {2019},
    {2020},
    {2021},
    {2022},
    {2023},
    {2024},
    {2025},
    {2026},
    {2027},
    {2028},
    {2029},
    {2030},
    {2031},
    {2032},
    {2033},
    {2034},
    {2035},
    {2036},
    {2037},
    {2038},
    {2039},
    {2040},
    {2041},
    {2042},
    {2043},
    {2044},
    {2045},
    {2046},
    {2047},
    {2048},
    {2049},
    {2050},
    {2051},
    {2052},
    {2053},
    {2054},
    {2055},
    {2056},
    {2057},
    {2058},
    {2059},
    {2060},
    {2061},
    {2062},
    {2063},
    {2064},
    {2065},
    {2066},
    {2067},
    {2068},
    {2069},
    {2070},
    {2071},
    {2072},
    {2073},
    {2074},
    {2075},
    {2076},
    {2077},
    {2078},
    {2079},
    {2080},
    {2081},
    {2082},
    {2083},
    {2084},
    {2085},
    {2086},
    {2087},
    {2088},
    {2089},
    {2090},
    {2091},
    {2092},
    {2093},
    {2094},
    {2095}
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
    1000,
    1001,
    1002,
    1003,
    1004,
    1005,
    1006,
    1007,
    1008,
    1009,
    1010,
    1011,
    1012,
    1013,
    1014,
    1015,
    1016,
    1017,
    1018,
    1019,
    1020,
    1021,
    1022,
    1023,
    1024,
    1025,
    1026,
    1027,
    1028,
    1029,
    1030,
    1031,
    1032,
    1033,
    1034,
    1035,
    1036,
    1037,
    1038,
    1039,
    1040,
    1041,
    1042,
    1043,
    1044,
    1045,
    1046,
    1047,
    1048,
    1049,
    1050,
    1051,
    1052,
    1053,
    1054,
    1055,
    1056,
    1057,
    1058,
    1059,
    1060,
    1061,
    1062,
    1063,
    1064,
    1065,
    1066,
    1067,
    1068,
    1069,
    1070,
    1071,
    1072,
    1073,
    1074,
    1075,
    1076,
    1077,
    1078,
    1079,
    1080,
    1081,
    1082,
    1083,
    1084,
    1085,
    1086,
    1087,
    1088,
    1089,
    1090,
    1091,
    1092,
    1093,
    1094,
    1095,
    2000,
    2001,
    2002,
    2003,
    2004,
    2005,
    2006,
    2007,
    2008,
    2009,
    2010,
    2011,
    2012,
    2013,
    2014,
    2015,
    2016,
    2017,
    2018,
    2019,
    2020,
    2021,
    2022,
    2023,
    2024,
    2025,
    2026,
    2027,
    2028,
    2029,
    2030,
    2031,
    2032,
    2033,
    2034,
    2035,
    2036,
    2037,
    2038,
    2039,
    2040,
    2041,
    2042,
    2043,
    2044,
    2045,
    2046,
    2047,
    2048,
    2049,
    2050,
    2051,
    2052,
    2053,
    2054,
    2055,
    2056,
    2057,
    2058,
    2059,
    2060,
    2061,
    2062,
    2063,
    2064,
    2065,
    2066,
    2067,
    2068,
    2069,
    2070,
    2071,
    2072,
    2073,
    2074,
    2075,
    2076,
    2077,
    2078,
    2079,
    2080,
    2081,
    2082,
    2083,
    2084,
    2085,
    2086,
    2087,
    2088,
    2089,
    2090,
    2091,
    2092,
    2093,
    2094,
    2095
    ].

