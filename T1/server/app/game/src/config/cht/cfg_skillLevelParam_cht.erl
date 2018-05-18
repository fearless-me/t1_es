%% coding: latin-1
%%: 实现
-module(cfg_skillLevelParam_cht).
-compile(export_all).
-include("cfg_skillLevelParam.hrl").


getRow(1)->
    #skillLevelParamCfg {
    level = 1,
    critParam1 = 80,
    critParam2 = 500,
    dodgeParam1 = 37.5,
    dodgeParam2 = 500,
    breakParam1 = 60,
    breakParam2 = 300,
    critdamage1 = 30,
    critdamage2 = 300
    };
getRow(2)->
    #skillLevelParamCfg {
    level = 2,
    critParam1 = 89.1,
    critParam2 = 550,
    dodgeParam1 = 42.075,
    dodgeParam2 = 550,
    breakParam1 = 66.66,
    breakParam2 = 330,
    critdamage1 = 34.65,
    critdamage2 = 330
    };
getRow(3)->
    #skillLevelParamCfg {
    level = 3,
    critParam1 = 98.4,
    critParam2 = 600,
    dodgeParam1 = 46.8,
    dodgeParam2 = 600,
    breakParam1 = 73.44,
    breakParam2 = 360,
    critdamage1 = 39.6,
    critdamage2 = 360
    };
getRow(4)->
    #skillLevelParamCfg {
    level = 4,
    critParam1 = 107.9,
    critParam2 = 650,
    dodgeParam1 = 51.675,
    dodgeParam2 = 650,
    breakParam1 = 80.34,
    breakParam2 = 390,
    critdamage1 = 44.85,
    critdamage2 = 390
    };
getRow(5)->
    #skillLevelParamCfg {
    level = 5,
    critParam1 = 117.6,
    critParam2 = 700,
    dodgeParam1 = 56.7,
    dodgeParam2 = 700,
    breakParam1 = 87.36,
    breakParam2 = 420,
    critdamage1 = 50.4,
    critdamage2 = 420
    };
getRow(6)->
    #skillLevelParamCfg {
    level = 6,
    critParam1 = 127.5,
    critParam2 = 750,
    dodgeParam1 = 61.875,
    dodgeParam2 = 750,
    breakParam1 = 94.5,
    breakParam2 = 450,
    critdamage1 = 56.25,
    critdamage2 = 450
    };
getRow(7)->
    #skillLevelParamCfg {
    level = 7,
    critParam1 = 137.6,
    critParam2 = 800,
    dodgeParam1 = 67.2,
    dodgeParam2 = 800,
    breakParam1 = 101.76,
    breakParam2 = 480,
    critdamage1 = 62.3999999999999,
    critdamage2 = 480
    };
getRow(8)->
    #skillLevelParamCfg {
    level = 8,
    critParam1 = 147.9,
    critParam2 = 850,
    dodgeParam1 = 72.675,
    dodgeParam2 = 850,
    breakParam1 = 109.14,
    breakParam2 = 510,
    critdamage1 = 68.85,
    critdamage2 = 510
    };
getRow(9)->
    #skillLevelParamCfg {
    level = 9,
    critParam1 = 158.4,
    critParam2 = 900,
    dodgeParam1 = 78.3,
    dodgeParam2 = 900,
    breakParam1 = 116.64,
    breakParam2 = 540,
    critdamage1 = 75.6,
    critdamage2 = 540
    };
getRow(10)->
    #skillLevelParamCfg {
    level = 10,
    critParam1 = 169.1,
    critParam2 = 950,
    dodgeParam1 = 84.075,
    dodgeParam2 = 950,
    breakParam1 = 124.26,
    breakParam2 = 570,
    critdamage1 = 82.65,
    critdamage2 = 570
    };
getRow(11)->
    #skillLevelParamCfg {
    level = 11,
    critParam1 = 180,
    critParam2 = 1000,
    dodgeParam1 = 90,
    dodgeParam2 = 1000,
    breakParam1 = 132,
    breakParam2 = 600,
    critdamage1 = 89.9999999999999,
    critdamage2 = 600
    };
getRow(12)->
    #skillLevelParamCfg {
    level = 12,
    critParam1 = 191.1,
    critParam2 = 1050,
    dodgeParam1 = 96.075,
    dodgeParam2 = 1050,
    breakParam1 = 139.86,
    breakParam2 = 630,
    critdamage1 = 97.65,
    critdamage2 = 630
    };
getRow(13)->
    #skillLevelParamCfg {
    level = 13,
    critParam1 = 202.4,
    critParam2 = 1100,
    dodgeParam1 = 102.3,
    dodgeParam2 = 1100,
    breakParam1 = 147.84,
    breakParam2 = 660,
    critdamage1 = 105.6,
    critdamage2 = 660
    };
getRow(14)->
    #skillLevelParamCfg {
    level = 14,
    critParam1 = 213.9,
    critParam2 = 1150,
    dodgeParam1 = 108.675,
    dodgeParam2 = 1150,
    breakParam1 = 155.94,
    breakParam2 = 690,
    critdamage1 = 113.85,
    critdamage2 = 690
    };
getRow(15)->
    #skillLevelParamCfg {
    level = 15,
    critParam1 = 225.6,
    critParam2 = 1200,
    dodgeParam1 = 115.2,
    dodgeParam2 = 1200,
    breakParam1 = 164.16,
    breakParam2 = 720,
    critdamage1 = 122.4,
    critdamage2 = 720
    };
getRow(16)->
    #skillLevelParamCfg {
    level = 16,
    critParam1 = 237.5,
    critParam2 = 1250,
    dodgeParam1 = 121.875,
    dodgeParam2 = 1250,
    breakParam1 = 172.5,
    breakParam2 = 750,
    critdamage1 = 131.25,
    critdamage2 = 750
    };
getRow(17)->
    #skillLevelParamCfg {
    level = 17,
    critParam1 = 249.6,
    critParam2 = 1300,
    dodgeParam1 = 128.7,
    dodgeParam2 = 1300,
    breakParam1 = 180.96,
    breakParam2 = 780,
    critdamage1 = 140.4,
    critdamage2 = 780
    };
getRow(18)->
    #skillLevelParamCfg {
    level = 18,
    critParam1 = 261.9,
    critParam2 = 1350,
    dodgeParam1 = 135.675,
    dodgeParam2 = 1350,
    breakParam1 = 189.54,
    breakParam2 = 810,
    critdamage1 = 149.85,
    critdamage2 = 810
    };
getRow(19)->
    #skillLevelParamCfg {
    level = 19,
    critParam1 = 274.4,
    critParam2 = 1400,
    dodgeParam1 = 142.8,
    dodgeParam2 = 1400,
    breakParam1 = 198.24,
    breakParam2 = 840,
    critdamage1 = 159.6,
    critdamage2 = 840
    };
getRow(20)->
    #skillLevelParamCfg {
    level = 20,
    critParam1 = 287.1,
    critParam2 = 1450,
    dodgeParam1 = 150.075,
    dodgeParam2 = 1450,
    breakParam1 = 207.06,
    breakParam2 = 870,
    critdamage1 = 169.65,
    critdamage2 = 870
    };
getRow(21)->
    #skillLevelParamCfg {
    level = 21,
    critParam1 = 300,
    critParam2 = 1500,
    dodgeParam1 = 157.5,
    dodgeParam2 = 1500,
    breakParam1 = 216,
    breakParam2 = 900,
    critdamage1 = 180,
    critdamage2 = 900
    };
getRow(22)->
    #skillLevelParamCfg {
    level = 22,
    critParam1 = 313.1,
    critParam2 = 1550,
    dodgeParam1 = 165.075,
    dodgeParam2 = 1550,
    breakParam1 = 225.06,
    breakParam2 = 930,
    critdamage1 = 190.65,
    critdamage2 = 930
    };
getRow(23)->
    #skillLevelParamCfg {
    level = 23,
    critParam1 = 326.4,
    critParam2 = 1600,
    dodgeParam1 = 172.8,
    dodgeParam2 = 1600,
    breakParam1 = 234.24,
    breakParam2 = 960,
    critdamage1 = 201.6,
    critdamage2 = 960
    };
getRow(24)->
    #skillLevelParamCfg {
    level = 24,
    critParam1 = 339.9,
    critParam2 = 1650,
    dodgeParam1 = 180.675,
    dodgeParam2 = 1650,
    breakParam1 = 243.54,
    breakParam2 = 990,
    critdamage1 = 212.85,
    critdamage2 = 990
    };
getRow(25)->
    #skillLevelParamCfg {
    level = 25,
    critParam1 = 353.6,
    critParam2 = 1700,
    dodgeParam1 = 188.7,
    dodgeParam2 = 1700,
    breakParam1 = 252.96,
    breakParam2 = 1020,
    critdamage1 = 224.4,
    critdamage2 = 1020
    };
getRow(26)->
    #skillLevelParamCfg {
    level = 26,
    critParam1 = 367.5,
    critParam2 = 1750,
    dodgeParam1 = 196.875,
    dodgeParam2 = 1750,
    breakParam1 = 262.5,
    breakParam2 = 1050,
    critdamage1 = 236.25,
    critdamage2 = 1050
    };
getRow(27)->
    #skillLevelParamCfg {
    level = 27,
    critParam1 = 381.6,
    critParam2 = 1800,
    dodgeParam1 = 205.2,
    dodgeParam2 = 1800,
    breakParam1 = 272.16,
    breakParam2 = 1080,
    critdamage1 = 248.4,
    critdamage2 = 1080
    };
getRow(28)->
    #skillLevelParamCfg {
    level = 28,
    critParam1 = 395.9,
    critParam2 = 1850,
    dodgeParam1 = 213.675,
    dodgeParam2 = 1850,
    breakParam1 = 281.94,
    breakParam2 = 1110,
    critdamage1 = 260.85,
    critdamage2 = 1110
    };
getRow(29)->
    #skillLevelParamCfg {
    level = 29,
    critParam1 = 410.4,
    critParam2 = 1900,
    dodgeParam1 = 222.3,
    dodgeParam2 = 1900,
    breakParam1 = 291.84,
    breakParam2 = 1140,
    critdamage1 = 273.6,
    critdamage2 = 1140
    };
getRow(30)->
    #skillLevelParamCfg {
    level = 30,
    critParam1 = 425.1,
    critParam2 = 1950,
    dodgeParam1 = 231.075,
    dodgeParam2 = 1950,
    breakParam1 = 301.86,
    breakParam2 = 1170,
    critdamage1 = 286.65,
    critdamage2 = 1170
    };
getRow(31)->
    #skillLevelParamCfg {
    level = 31,
    critParam1 = 440,
    critParam2 = 2000,
    dodgeParam1 = 240,
    dodgeParam2 = 2000,
    breakParam1 = 312,
    breakParam2 = 1200,
    critdamage1 = 300,
    critdamage2 = 1200
    };
getRow(32)->
    #skillLevelParamCfg {
    level = 32,
    critParam1 = 455.1,
    critParam2 = 2050,
    dodgeParam1 = 249.075,
    dodgeParam2 = 2050,
    breakParam1 = 322.260000000001,
    breakParam2 = 1230,
    critdamage1 = 313.65,
    critdamage2 = 1230
    };
getRow(33)->
    #skillLevelParamCfg {
    level = 33,
    critParam1 = 470.4,
    critParam2 = 2100,
    dodgeParam1 = 258.3,
    dodgeParam2 = 2100,
    breakParam1 = 332.640000000001,
    breakParam2 = 1260,
    critdamage1 = 327.6,
    critdamage2 = 1260
    };
getRow(34)->
    #skillLevelParamCfg {
    level = 34,
    critParam1 = 485.9,
    critParam2 = 2150,
    dodgeParam1 = 267.675,
    dodgeParam2 = 2150,
    breakParam1 = 343.14,
    breakParam2 = 1290,
    critdamage1 = 341.85,
    critdamage2 = 1290
    };
getRow(35)->
    #skillLevelParamCfg {
    level = 35,
    critParam1 = 501.6,
    critParam2 = 2200,
    dodgeParam1 = 277.2,
    dodgeParam2 = 2200,
    breakParam1 = 353.760000000001,
    breakParam2 = 1320,
    critdamage1 = 356.4,
    critdamage2 = 1320
    };
getRow(36)->
    #skillLevelParamCfg {
    level = 36,
    critParam1 = 517.5,
    critParam2 = 2250,
    dodgeParam1 = 286.875,
    dodgeParam2 = 2250,
    breakParam1 = 364.500000000001,
    breakParam2 = 1350,
    critdamage1 = 371.25,
    critdamage2 = 1350
    };
getRow(37)->
    #skillLevelParamCfg {
    level = 37,
    critParam1 = 533.6,
    critParam2 = 2300,
    dodgeParam1 = 296.7,
    dodgeParam2 = 2300,
    breakParam1 = 375.360000000001,
    breakParam2 = 1380,
    critdamage1 = 386.4,
    critdamage2 = 1380
    };
getRow(38)->
    #skillLevelParamCfg {
    level = 38,
    critParam1 = 549.9,
    critParam2 = 2350,
    dodgeParam1 = 306.675,
    dodgeParam2 = 2350,
    breakParam1 = 386.340000000001,
    breakParam2 = 1410,
    critdamage1 = 401.85,
    critdamage2 = 1410
    };
getRow(39)->
    #skillLevelParamCfg {
    level = 39,
    critParam1 = 566.4,
    critParam2 = 2400,
    dodgeParam1 = 316.8,
    dodgeParam2 = 2400,
    breakParam1 = 397.440000000001,
    breakParam2 = 1440,
    critdamage1 = 417.6,
    critdamage2 = 1440
    };
getRow(40)->
    #skillLevelParamCfg {
    level = 40,
    critParam1 = 583.1,
    critParam2 = 2450,
    dodgeParam1 = 327.075,
    dodgeParam2 = 2450,
    breakParam1 = 408.660000000001,
    breakParam2 = 1470,
    critdamage1 = 433.65,
    critdamage2 = 1470
    };
getRow(41)->
    #skillLevelParamCfg {
    level = 41,
    critParam1 = 600,
    critParam2 = 2500,
    dodgeParam1 = 337.5,
    dodgeParam2 = 2500,
    breakParam1 = 420.000000000001,
    breakParam2 = 1500,
    critdamage1 = 450,
    critdamage2 = 1500
    };
getRow(42)->
    #skillLevelParamCfg {
    level = 42,
    critParam1 = 617.1,
    critParam2 = 2550,
    dodgeParam1 = 348.075,
    dodgeParam2 = 2550,
    breakParam1 = 431.460000000001,
    breakParam2 = 1530,
    critdamage1 = 462.06,
    critdamage2 = 1530
    };
getRow(43)->
    #skillLevelParamCfg {
    level = 43,
    critParam1 = 634.4,
    critParam2 = 2600,
    dodgeParam1 = 358.8,
    dodgeParam2 = 2600,
    breakParam1 = 443.040000000001,
    breakParam2 = 1560,
    critdamage1 = 474.24,
    critdamage2 = 1560
    };
getRow(44)->
    #skillLevelParamCfg {
    level = 44,
    critParam1 = 651.9,
    critParam2 = 2650,
    dodgeParam1 = 369.675,
    dodgeParam2 = 2650,
    breakParam1 = 454.740000000001,
    breakParam2 = 1590,
    critdamage1 = 486.54,
    critdamage2 = 1590
    };
getRow(45)->
    #skillLevelParamCfg {
    level = 45,
    critParam1 = 669.6,
    critParam2 = 2700,
    dodgeParam1 = 380.7,
    dodgeParam2 = 2700,
    breakParam1 = 466.560000000001,
    breakParam2 = 1620,
    critdamage1 = 498.96,
    critdamage2 = 1620
    };
getRow(46)->
    #skillLevelParamCfg {
    level = 46,
    critParam1 = 687.5,
    critParam2 = 2750,
    dodgeParam1 = 391.875,
    dodgeParam2 = 2750,
    breakParam1 = 478.500000000001,
    breakParam2 = 1650,
    critdamage1 = 511.5,
    critdamage2 = 1650
    };
getRow(47)->
    #skillLevelParamCfg {
    level = 47,
    critParam1 = 705.6,
    critParam2 = 2800,
    dodgeParam1 = 403.2,
    dodgeParam2 = 2800,
    breakParam1 = 490.560000000001,
    breakParam2 = 1680,
    critdamage1 = 524.16,
    critdamage2 = 1680
    };
getRow(48)->
    #skillLevelParamCfg {
    level = 48,
    critParam1 = 723.9,
    critParam2 = 2850,
    dodgeParam1 = 414.675,
    dodgeParam2 = 2850,
    breakParam1 = 502.740000000001,
    breakParam2 = 1710,
    critdamage1 = 536.94,
    critdamage2 = 1710
    };
getRow(49)->
    #skillLevelParamCfg {
    level = 49,
    critParam1 = 742.4,
    critParam2 = 2900,
    dodgeParam1 = 426.3,
    dodgeParam2 = 2900,
    breakParam1 = 515.040000000001,
    breakParam2 = 1740,
    critdamage1 = 549.84,
    critdamage2 = 1740
    };
getRow(50)->
    #skillLevelParamCfg {
    level = 50,
    critParam1 = 761.1,
    critParam2 = 2950,
    dodgeParam1 = 438.075,
    dodgeParam2 = 2950,
    breakParam1 = 527.460000000001,
    breakParam2 = 1770,
    critdamage1 = 562.86,
    critdamage2 = 1770
    };
getRow(51)->
    #skillLevelParamCfg {
    level = 51,
    critParam1 = 780,
    critParam2 = 3000,
    dodgeParam1 = 450,
    dodgeParam2 = 3000,
    breakParam1 = 540.000000000001,
    breakParam2 = 1800,
    critdamage1 = 576,
    critdamage2 = 1800
    };
getRow(52)->
    #skillLevelParamCfg {
    level = 52,
    critParam1 = 799.1,
    critParam2 = 3050,
    dodgeParam1 = 462.075,
    dodgeParam2 = 3050,
    breakParam1 = 552.660000000001,
    breakParam2 = 1830,
    critdamage1 = 589.26,
    critdamage2 = 1830
    };
getRow(53)->
    #skillLevelParamCfg {
    level = 53,
    critParam1 = 818.4,
    critParam2 = 3100,
    dodgeParam1 = 474.3,
    dodgeParam2 = 3100,
    breakParam1 = 565.440000000001,
    breakParam2 = 1860,
    critdamage1 = 602.64,
    critdamage2 = 1860
    };
getRow(54)->
    #skillLevelParamCfg {
    level = 54,
    critParam1 = 837.9,
    critParam2 = 3150,
    dodgeParam1 = 486.675,
    dodgeParam2 = 3150,
    breakParam1 = 578.340000000001,
    breakParam2 = 1890,
    critdamage1 = 616.14,
    critdamage2 = 1890
    };
getRow(55)->
    #skillLevelParamCfg {
    level = 55,
    critParam1 = 857.6,
    critParam2 = 3200,
    dodgeParam1 = 499.2,
    dodgeParam2 = 3200,
    breakParam1 = 591.360000000001,
    breakParam2 = 1920,
    critdamage1 = 629.76,
    critdamage2 = 1920
    };
getRow(56)->
    #skillLevelParamCfg {
    level = 56,
    critParam1 = 877.5,
    critParam2 = 3250,
    dodgeParam1 = 511.875,
    dodgeParam2 = 3250,
    breakParam1 = 604.500000000001,
    breakParam2 = 1950,
    critdamage1 = 643.5,
    critdamage2 = 1950
    };
getRow(57)->
    #skillLevelParamCfg {
    level = 57,
    critParam1 = 897.6,
    critParam2 = 3300,
    dodgeParam1 = 524.7,
    dodgeParam2 = 3300,
    breakParam1 = 617.760000000001,
    breakParam2 = 1980,
    critdamage1 = 657.36,
    critdamage2 = 1980
    };
getRow(58)->
    #skillLevelParamCfg {
    level = 58,
    critParam1 = 917.9,
    critParam2 = 3350,
    dodgeParam1 = 537.675,
    dodgeParam2 = 3350,
    breakParam1 = 631.140000000001,
    breakParam2 = 2010,
    critdamage1 = 671.34,
    critdamage2 = 2010
    };
getRow(59)->
    #skillLevelParamCfg {
    level = 59,
    critParam1 = 938.4,
    critParam2 = 3400,
    dodgeParam1 = 550.8,
    dodgeParam2 = 3400,
    breakParam1 = 644.640000000001,
    breakParam2 = 2040,
    critdamage1 = 685.44,
    critdamage2 = 2040
    };
getRow(60)->
    #skillLevelParamCfg {
    level = 60,
    critParam1 = 959.1,
    critParam2 = 3450,
    dodgeParam1 = 564.075,
    dodgeParam2 = 3450,
    breakParam1 = 658.260000000001,
    breakParam2 = 2070,
    critdamage1 = 699.66,
    critdamage2 = 2070
    };
getRow(61)->
    #skillLevelParamCfg {
    level = 61,
    critParam1 = 980,
    critParam2 = 3500,
    dodgeParam1 = 577.5,
    dodgeParam2 = 3500,
    breakParam1 = 672.000000000001,
    breakParam2 = 2100,
    critdamage1 = 714,
    critdamage2 = 2100
    };
getRow(62)->
    #skillLevelParamCfg {
    level = 62,
    critParam1 = 1001.1,
    critParam2 = 3550,
    dodgeParam1 = 591.075,
    dodgeParam2 = 3550,
    breakParam1 = 685.860000000001,
    breakParam2 = 2130,
    critdamage1 = 728.46,
    critdamage2 = 2130
    };
getRow(63)->
    #skillLevelParamCfg {
    level = 63,
    critParam1 = 1022.4,
    critParam2 = 3600,
    dodgeParam1 = 604.8,
    dodgeParam2 = 3600,
    breakParam1 = 699.840000000001,
    breakParam2 = 2160,
    critdamage1 = 743.04,
    critdamage2 = 2160
    };
getRow(64)->
    #skillLevelParamCfg {
    level = 64,
    critParam1 = 1043.9,
    critParam2 = 3650,
    dodgeParam1 = 618.675,
    dodgeParam2 = 3650,
    breakParam1 = 713.940000000002,
    breakParam2 = 2190,
    critdamage1 = 757.74,
    critdamage2 = 2190
    };
getRow(65)->
    #skillLevelParamCfg {
    level = 65,
    critParam1 = 1065.6,
    critParam2 = 3700,
    dodgeParam1 = 632.7,
    dodgeParam2 = 3700,
    breakParam1 = 728.160000000001,
    breakParam2 = 2220,
    critdamage1 = 772.56,
    critdamage2 = 2220
    };
getRow(66)->
    #skillLevelParamCfg {
    level = 66,
    critParam1 = 1087.5,
    critParam2 = 3750,
    dodgeParam1 = 646.875,
    dodgeParam2 = 3750,
    breakParam1 = 742.500000000002,
    breakParam2 = 2250,
    critdamage1 = 787.5,
    critdamage2 = 2250
    };
getRow(67)->
    #skillLevelParamCfg {
    level = 67,
    critParam1 = 1109.6,
    critParam2 = 3800,
    dodgeParam1 = 661.2,
    dodgeParam2 = 3800,
    breakParam1 = 756.960000000002,
    breakParam2 = 2280,
    critdamage1 = 802.56,
    critdamage2 = 2280
    };
getRow(68)->
    #skillLevelParamCfg {
    level = 68,
    critParam1 = 1131.9,
    critParam2 = 3850,
    dodgeParam1 = 675.675,
    dodgeParam2 = 3850,
    breakParam1 = 771.540000000002,
    breakParam2 = 2310,
    critdamage1 = 817.74,
    critdamage2 = 2310
    };
getRow(69)->
    #skillLevelParamCfg {
    level = 69,
    critParam1 = 1154.4,
    critParam2 = 3900,
    dodgeParam1 = 690.3,
    dodgeParam2 = 3900,
    breakParam1 = 786.240000000002,
    breakParam2 = 2340,
    critdamage1 = 833.04,
    critdamage2 = 2340
    };
getRow(70)->
    #skillLevelParamCfg {
    level = 70,
    critParam1 = 1177.1,
    critParam2 = 3950,
    dodgeParam1 = 705.075,
    dodgeParam2 = 3950,
    breakParam1 = 801.060000000002,
    breakParam2 = 2370,
    critdamage1 = 848.46,
    critdamage2 = 2370
    };
getRow(71)->
    #skillLevelParamCfg {
    level = 71,
    critParam1 = 1200,
    critParam2 = 4000,
    dodgeParam1 = 720,
    dodgeParam2 = 4000,
    breakParam1 = 816.000000000002,
    breakParam2 = 2400,
    critdamage1 = 864,
    critdamage2 = 2400
    };
getRow(72)->
    #skillLevelParamCfg {
    level = 72,
    critParam1 = 1223.1,
    critParam2 = 4050,
    dodgeParam1 = 735.075,
    dodgeParam2 = 4050,
    breakParam1 = 831.060000000002,
    breakParam2 = 2430,
    critdamage1 = 879.66,
    critdamage2 = 2430
    };
getRow(73)->
    #skillLevelParamCfg {
    level = 73,
    critParam1 = 1246.4,
    critParam2 = 4100,
    dodgeParam1 = 750.3,
    dodgeParam2 = 4100,
    breakParam1 = 846.240000000002,
    breakParam2 = 2460,
    critdamage1 = 895.44,
    critdamage2 = 2460
    };
getRow(74)->
    #skillLevelParamCfg {
    level = 74,
    critParam1 = 1269.9,
    critParam2 = 4150,
    dodgeParam1 = 765.675,
    dodgeParam2 = 4150,
    breakParam1 = 861.540000000002,
    breakParam2 = 2490,
    critdamage1 = 911.34,
    critdamage2 = 2490
    };
getRow(75)->
    #skillLevelParamCfg {
    level = 75,
    critParam1 = 1293.6,
    critParam2 = 4200,
    dodgeParam1 = 781.2,
    dodgeParam2 = 4200,
    breakParam1 = 876.960000000002,
    breakParam2 = 2520,
    critdamage1 = 927.36,
    critdamage2 = 2520
    };
getRow(76)->
    #skillLevelParamCfg {
    level = 76,
    critParam1 = 1317.5,
    critParam2 = 4250,
    dodgeParam1 = 796.875,
    dodgeParam2 = 4250,
    breakParam1 = 892.500000000002,
    breakParam2 = 2550,
    critdamage1 = 943.5,
    critdamage2 = 2550
    };
getRow(77)->
    #skillLevelParamCfg {
    level = 77,
    critParam1 = 1341.6,
    critParam2 = 4300,
    dodgeParam1 = 812.7,
    dodgeParam2 = 4300,
    breakParam1 = 908.160000000002,
    breakParam2 = 2580,
    critdamage1 = 959.76,
    critdamage2 = 2580
    };
getRow(78)->
    #skillLevelParamCfg {
    level = 78,
    critParam1 = 1365.9,
    critParam2 = 4350,
    dodgeParam1 = 828.675,
    dodgeParam2 = 4350,
    breakParam1 = 923.940000000002,
    breakParam2 = 2610,
    critdamage1 = 976.14,
    critdamage2 = 2610
    };
getRow(79)->
    #skillLevelParamCfg {
    level = 79,
    critParam1 = 1390.4,
    critParam2 = 4400,
    dodgeParam1 = 844.8,
    dodgeParam2 = 4400,
    breakParam1 = 939.840000000002,
    breakParam2 = 2640,
    critdamage1 = 992.64,
    critdamage2 = 2640
    };
getRow(80)->
    #skillLevelParamCfg {
    level = 80,
    critParam1 = 1415.1,
    critParam2 = 4450,
    dodgeParam1 = 861.075,
    dodgeParam2 = 4450,
    breakParam1 = 955.860000000002,
    breakParam2 = 2670,
    critdamage1 = 1009.26,
    critdamage2 = 2670
    };
getRow(81)->
    #skillLevelParamCfg {
    level = 81,
    critParam1 = 1440,
    critParam2 = 4500,
    dodgeParam1 = 877.5,
    dodgeParam2 = 4500,
    breakParam1 = 972.000000000002,
    breakParam2 = 2700,
    critdamage1 = 1026,
    critdamage2 = 2700
    };
getRow(82)->
    #skillLevelParamCfg {
    level = 82,
    critParam1 = 1465.1,
    critParam2 = 4550,
    dodgeParam1 = 894.075,
    dodgeParam2 = 4550,
    breakParam1 = 988.260000000002,
    breakParam2 = 2730,
    critdamage1 = 1042.86,
    critdamage2 = 2730
    };
getRow(83)->
    #skillLevelParamCfg {
    level = 83,
    critParam1 = 1490.4,
    critParam2 = 4600,
    dodgeParam1 = 910.8,
    dodgeParam2 = 4600,
    breakParam1 = 1004.64,
    breakParam2 = 2760,
    critdamage1 = 1059.84,
    critdamage2 = 2760
    };
getRow(84)->
    #skillLevelParamCfg {
    level = 84,
    critParam1 = 1515.9,
    critParam2 = 4650,
    dodgeParam1 = 927.675,
    dodgeParam2 = 4650,
    breakParam1 = 1021.14,
    breakParam2 = 2790,
    critdamage1 = 1076.94,
    critdamage2 = 2790
    };
getRow(85)->
    #skillLevelParamCfg {
    level = 85,
    critParam1 = 1541.6,
    critParam2 = 4700,
    dodgeParam1 = 944.7,
    dodgeParam2 = 4700,
    breakParam1 = 1037.76,
    breakParam2 = 2820,
    critdamage1 = 1094.16,
    critdamage2 = 2820
    };
getRow(86)->
    #skillLevelParamCfg {
    level = 86,
    critParam1 = 1567.5,
    critParam2 = 4750,
    dodgeParam1 = 961.875,
    dodgeParam2 = 4750,
    breakParam1 = 1054.5,
    breakParam2 = 2850,
    critdamage1 = 1111.5,
    critdamage2 = 2850
    };
getRow(87)->
    #skillLevelParamCfg {
    level = 87,
    critParam1 = 1593.6,
    critParam2 = 4800,
    dodgeParam1 = 979.2,
    dodgeParam2 = 4800,
    breakParam1 = 1071.36,
    breakParam2 = 2880,
    critdamage1 = 1128.96,
    critdamage2 = 2880
    };
getRow(88)->
    #skillLevelParamCfg {
    level = 88,
    critParam1 = 1619.9,
    critParam2 = 4850,
    dodgeParam1 = 996.675,
    dodgeParam2 = 4850,
    breakParam1 = 1088.34,
    breakParam2 = 2910,
    critdamage1 = 1146.54,
    critdamage2 = 2910
    };
getRow(89)->
    #skillLevelParamCfg {
    level = 89,
    critParam1 = 1646.4,
    critParam2 = 4900,
    dodgeParam1 = 1014.3,
    dodgeParam2 = 4900,
    breakParam1 = 1105.44,
    breakParam2 = 2940,
    critdamage1 = 1164.24,
    critdamage2 = 2940
    };
getRow(90)->
    #skillLevelParamCfg {
    level = 90,
    critParam1 = 1673.1,
    critParam2 = 4950,
    dodgeParam1 = 1032.075,
    dodgeParam2 = 4950,
    breakParam1 = 1122.66,
    breakParam2 = 2970,
    critdamage1 = 1182.06,
    critdamage2 = 2970
    };
getRow(91)->
    #skillLevelParamCfg {
    level = 91,
    critParam1 = 1700,
    critParam2 = 5000,
    dodgeParam1 = 1050,
    dodgeParam2 = 5000,
    breakParam1 = 1140,
    breakParam2 = 3000,
    critdamage1 = 1200,
    critdamage2 = 3000
    };
getRow(92)->
    #skillLevelParamCfg {
    level = 92,
    critParam1 = 1727.1,
    critParam2 = 5050,
    dodgeParam1 = 1068.075,
    dodgeParam2 = 5050,
    breakParam1 = 1157.46,
    breakParam2 = 3030,
    critdamage1 = 1218.06,
    critdamage2 = 3030
    };
getRow(93)->
    #skillLevelParamCfg {
    level = 93,
    critParam1 = 1754.4,
    critParam2 = 5100,
    dodgeParam1 = 1086.3,
    dodgeParam2 = 5100,
    breakParam1 = 1175.04,
    breakParam2 = 3060,
    critdamage1 = 1236.24,
    critdamage2 = 3060
    };
getRow(94)->
    #skillLevelParamCfg {
    level = 94,
    critParam1 = 1781.9,
    critParam2 = 5150,
    dodgeParam1 = 1104.675,
    dodgeParam2 = 5150,
    breakParam1 = 1192.74,
    breakParam2 = 3090,
    critdamage1 = 1254.54,
    critdamage2 = 3090
    };
getRow(95)->
    #skillLevelParamCfg {
    level = 95,
    critParam1 = 1809.6,
    critParam2 = 5200,
    dodgeParam1 = 1123.2,
    dodgeParam2 = 5200,
    breakParam1 = 1210.56,
    breakParam2 = 3120,
    critdamage1 = 1272.96,
    critdamage2 = 3120
    };
getRow(96)->
    #skillLevelParamCfg {
    level = 96,
    critParam1 = 1837.5,
    critParam2 = 5250,
    dodgeParam1 = 1141.875,
    dodgeParam2 = 5250,
    breakParam1 = 1228.5,
    breakParam2 = 3150,
    critdamage1 = 1291.5,
    critdamage2 = 3150
    };
getRow(97)->
    #skillLevelParamCfg {
    level = 97,
    critParam1 = 1865.6,
    critParam2 = 5300,
    dodgeParam1 = 1160.7,
    dodgeParam2 = 5300,
    breakParam1 = 1246.56,
    breakParam2 = 3180,
    critdamage1 = 1310.16,
    critdamage2 = 3180
    };
getRow(98)->
    #skillLevelParamCfg {
    level = 98,
    critParam1 = 1893.9,
    critParam2 = 5350,
    dodgeParam1 = 1179.675,
    dodgeParam2 = 5350,
    breakParam1 = 1264.74,
    breakParam2 = 3210,
    critdamage1 = 1328.94,
    critdamage2 = 3210
    };
getRow(99)->
    #skillLevelParamCfg {
    level = 99,
    critParam1 = 1922.4,
    critParam2 = 5400,
    dodgeParam1 = 1198.8,
    dodgeParam2 = 5400,
    breakParam1 = 1283.04,
    breakParam2 = 3240,
    critdamage1 = 1347.84,
    critdamage2 = 3240
    };
getRow(100)->
    #skillLevelParamCfg {
    level = 100,
    critParam1 = 1951.1,
    critParam2 = 5450,
    dodgeParam1 = 1218.075,
    dodgeParam2 = 5450,
    breakParam1 = 1301.46,
    breakParam2 = 3270,
    critdamage1 = 1366.86,
    critdamage2 = 3270
    };
getRow(101)->
    #skillLevelParamCfg {
    level = 101,
    critParam1 = 1980,
    critParam2 = 5500,
    dodgeParam1 = 1237.5,
    dodgeParam2 = 5500,
    breakParam1 = 1320,
    breakParam2 = 3300,
    critdamage1 = 1386,
    critdamage2 = 3300
    };
getRow(102)->
    #skillLevelParamCfg {
    level = 102,
    critParam1 = 2009.1,
    critParam2 = 5550,
    dodgeParam1 = 1257.075,
    dodgeParam2 = 5550,
    breakParam1 = 1338.66,
    breakParam2 = 3330,
    critdamage1 = 1405.26,
    critdamage2 = 3330
    };
getRow(103)->
    #skillLevelParamCfg {
    level = 103,
    critParam1 = 2038.4,
    critParam2 = 5600,
    dodgeParam1 = 1276.8,
    dodgeParam2 = 5600,
    breakParam1 = 1357.44,
    breakParam2 = 3360,
    critdamage1 = 1424.64,
    critdamage2 = 3360
    };
getRow(104)->
    #skillLevelParamCfg {
    level = 104,
    critParam1 = 2067.9,
    critParam2 = 5650,
    dodgeParam1 = 1296.675,
    dodgeParam2 = 5650,
    breakParam1 = 1376.34,
    breakParam2 = 3390,
    critdamage1 = 1444.14,
    critdamage2 = 3390
    };
getRow(105)->
    #skillLevelParamCfg {
    level = 105,
    critParam1 = 2097.6,
    critParam2 = 5700,
    dodgeParam1 = 1316.7,
    dodgeParam2 = 5700,
    breakParam1 = 1395.36,
    breakParam2 = 3420,
    critdamage1 = 1463.76,
    critdamage2 = 3420
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
    {97},
    {98},
    {99},
    {100},
    {101},
    {102},
    {103},
    {104},
    {105}
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
    100,
    101,
    102,
    103,
    104,
    105
    ].

