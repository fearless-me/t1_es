%% coding: latin-1
%%: 实现
-module(cfg_skillLevelParam_chs).
-compile(export_all).
-include("cfg_skillLevelParam.hrl").
-include("logger.hrl").

getRow(1)->
    #skillLevelParamCfg {
    level = 1,
    critParam1 = 65,
    critParam2 = 500,
    dodgeParam1 = 37.5,
    dodgeParam2 = 500,
    breakParam1 = 65,
    breakParam2 = 300,
    critdamage1 = 20,
    critdamage2 = 300
    };
getRow(2)->
    #skillLevelParamCfg {
    level = 2,
    critParam1 = 72.05,
    critParam2 = 550,
    dodgeParam1 = 41.8,
    dodgeParam2 = 550,
    breakParam1 = 72.05,
    breakParam2 = 330,
    critdamage1 = 22.55,
    critdamage2 = 330
    };
getRow(3)->
    #skillLevelParamCfg {
    level = 3,
    critParam1 = 79.2,
    critParam2 = 600,
    dodgeParam1 = 46.2,
    dodgeParam2 = 600,
    breakParam1 = 79.2,
    breakParam2 = 360,
    critdamage1 = 25.2,
    critdamage2 = 360
    };
getRow(4)->
    #skillLevelParamCfg {
    level = 4,
    critParam1 = 86.45,
    critParam2 = 650,
    dodgeParam1 = 50.7,
    dodgeParam2 = 650,
    breakParam1 = 86.45,
    breakParam2 = 390,
    critdamage1 = 27.95,
    critdamage2 = 390
    };
getRow(5)->
    #skillLevelParamCfg {
    level = 5,
    critParam1 = 93.8,
    critParam2 = 700,
    dodgeParam1 = 55.3,
    dodgeParam2 = 700,
    breakParam1 = 93.8,
    breakParam2 = 420,
    critdamage1 = 30.8,
    critdamage2 = 420
    };
getRow(6)->
    #skillLevelParamCfg {
    level = 6,
    critParam1 = 101.25,
    critParam2 = 750,
    dodgeParam1 = 60,
    dodgeParam2 = 750,
    breakParam1 = 101.25,
    breakParam2 = 450,
    critdamage1 = 33.75,
    critdamage2 = 450
    };
getRow(7)->
    #skillLevelParamCfg {
    level = 7,
    critParam1 = 108.8,
    critParam2 = 800,
    dodgeParam1 = 64.8,
    dodgeParam2 = 800,
    breakParam1 = 108.8,
    breakParam2 = 480,
    critdamage1 = 36.8,
    critdamage2 = 480
    };
getRow(8)->
    #skillLevelParamCfg {
    level = 8,
    critParam1 = 116.45,
    critParam2 = 850,
    dodgeParam1 = 69.7,
    dodgeParam2 = 850,
    breakParam1 = 116.45,
    breakParam2 = 510,
    critdamage1 = 39.95,
    critdamage2 = 510
    };
getRow(9)->
    #skillLevelParamCfg {
    level = 9,
    critParam1 = 124.2,
    critParam2 = 900,
    dodgeParam1 = 74.7,
    dodgeParam2 = 900,
    breakParam1 = 124.2,
    breakParam2 = 540,
    critdamage1 = 43.2,
    critdamage2 = 540
    };
getRow(10)->
    #skillLevelParamCfg {
    level = 10,
    critParam1 = 132.05,
    critParam2 = 950,
    dodgeParam1 = 79.8,
    dodgeParam2 = 950,
    breakParam1 = 132.05,
    breakParam2 = 570,
    critdamage1 = 46.55,
    critdamage2 = 570
    };
getRow(11)->
    #skillLevelParamCfg {
    level = 11,
    critParam1 = 140,
    critParam2 = 1000,
    dodgeParam1 = 85,
    dodgeParam2 = 1000,
    breakParam1 = 140,
    breakParam2 = 600,
    critdamage1 = 50,
    critdamage2 = 600
    };
getRow(12)->
    #skillLevelParamCfg {
    level = 12,
    critParam1 = 148.05,
    critParam2 = 1050,
    dodgeParam1 = 90.3,
    dodgeParam2 = 1050,
    breakParam1 = 148.05,
    breakParam2 = 630,
    critdamage1 = 53.55,
    critdamage2 = 630
    };
getRow(13)->
    #skillLevelParamCfg {
    level = 13,
    critParam1 = 156.2,
    critParam2 = 1100,
    dodgeParam1 = 95.7,
    dodgeParam2 = 1100,
    breakParam1 = 156.2,
    breakParam2 = 660,
    critdamage1 = 57.2,
    critdamage2 = 660
    };
getRow(14)->
    #skillLevelParamCfg {
    level = 14,
    critParam1 = 164.45,
    critParam2 = 1150,
    dodgeParam1 = 101.2,
    dodgeParam2 = 1150,
    breakParam1 = 164.45,
    breakParam2 = 690,
    critdamage1 = 60.95,
    critdamage2 = 690
    };
getRow(15)->
    #skillLevelParamCfg {
    level = 15,
    critParam1 = 172.8,
    critParam2 = 1200,
    dodgeParam1 = 106.8,
    dodgeParam2 = 1200,
    breakParam1 = 172.8,
    breakParam2 = 720,
    critdamage1 = 64.8,
    critdamage2 = 720
    };
getRow(16)->
    #skillLevelParamCfg {
    level = 16,
    critParam1 = 181.25,
    critParam2 = 1250,
    dodgeParam1 = 112.5,
    dodgeParam2 = 1250,
    breakParam1 = 181.25,
    breakParam2 = 750,
    critdamage1 = 68.75,
    critdamage2 = 750
    };
getRow(17)->
    #skillLevelParamCfg {
    level = 17,
    critParam1 = 189.8,
    critParam2 = 1300,
    dodgeParam1 = 118.3,
    dodgeParam2 = 1300,
    breakParam1 = 189.8,
    breakParam2 = 780,
    critdamage1 = 72.7999999999999,
    critdamage2 = 780
    };
getRow(18)->
    #skillLevelParamCfg {
    level = 18,
    critParam1 = 198.45,
    critParam2 = 1350,
    dodgeParam1 = 124.2,
    dodgeParam2 = 1350,
    breakParam1 = 198.45,
    breakParam2 = 810,
    critdamage1 = 76.95,
    critdamage2 = 810
    };
getRow(19)->
    #skillLevelParamCfg {
    level = 19,
    critParam1 = 207.2,
    critParam2 = 1400,
    dodgeParam1 = 130.2,
    dodgeParam2 = 1400,
    breakParam1 = 207.2,
    breakParam2 = 840,
    critdamage1 = 81.2,
    critdamage2 = 840
    };
getRow(20)->
    #skillLevelParamCfg {
    level = 20,
    critParam1 = 216.05,
    critParam2 = 1450,
    dodgeParam1 = 136.3,
    dodgeParam2 = 1450,
    breakParam1 = 216.05,
    breakParam2 = 870,
    critdamage1 = 85.55,
    critdamage2 = 870
    };
getRow(21)->
    #skillLevelParamCfg {
    level = 21,
    critParam1 = 224.25,
    critParam2 = 1500,
    dodgeParam1 = 142.5,
    dodgeParam2 = 1500,
    breakParam1 = 224.25,
    breakParam2 = 900,
    critdamage1 = 89.9999999999999,
    critdamage2 = 900
    };
getRow(22)->
    #skillLevelParamCfg {
    level = 22,
    critParam1 = 232.5,
    critParam2 = 1550,
    dodgeParam1 = 148.8,
    dodgeParam2 = 1550,
    breakParam1 = 232.5,
    breakParam2 = 930,
    critdamage1 = 94.5500000000001,
    critdamage2 = 930
    };
getRow(23)->
    #skillLevelParamCfg {
    level = 23,
    critParam1 = 240.8,
    critParam2 = 1600,
    dodgeParam1 = 155.2,
    dodgeParam2 = 1600,
    breakParam1 = 240.8,
    breakParam2 = 960,
    critdamage1 = 99.2,
    critdamage2 = 960
    };
getRow(24)->
    #skillLevelParamCfg {
    level = 24,
    critParam1 = 249.15,
    critParam2 = 1650,
    dodgeParam1 = 161.7,
    dodgeParam2 = 1650,
    breakParam1 = 249.15,
    breakParam2 = 990,
    critdamage1 = 103.95,
    critdamage2 = 990
    };
getRow(25)->
    #skillLevelParamCfg {
    level = 25,
    critParam1 = 257.55,
    critParam2 = 1700,
    dodgeParam1 = 168.3,
    dodgeParam2 = 1700,
    breakParam1 = 257.55,
    breakParam2 = 1020,
    critdamage1 = 108.8,
    critdamage2 = 1020
    };
getRow(26)->
    #skillLevelParamCfg {
    level = 26,
    critParam1 = 266,
    critParam2 = 1750,
    dodgeParam1 = 175,
    dodgeParam2 = 1750,
    breakParam1 = 266,
    breakParam2 = 1050,
    critdamage1 = 113.75,
    critdamage2 = 1050
    };
getRow(27)->
    #skillLevelParamCfg {
    level = 27,
    critParam1 = 274.5,
    critParam2 = 1800,
    dodgeParam1 = 181.8,
    dodgeParam2 = 1800,
    breakParam1 = 274.5,
    breakParam2 = 1080,
    critdamage1 = 118.8,
    critdamage2 = 1080
    };
getRow(28)->
    #skillLevelParamCfg {
    level = 28,
    critParam1 = 283.05,
    critParam2 = 1850,
    dodgeParam1 = 188.7,
    dodgeParam2 = 1850,
    breakParam1 = 283.05,
    breakParam2 = 1110,
    critdamage1 = 123.95,
    critdamage2 = 1110
    };
getRow(29)->
    #skillLevelParamCfg {
    level = 29,
    critParam1 = 291.65,
    critParam2 = 1900,
    dodgeParam1 = 195.7,
    dodgeParam2 = 1900,
    breakParam1 = 291.65,
    breakParam2 = 1140,
    critdamage1 = 129.2,
    critdamage2 = 1140
    };
getRow(30)->
    #skillLevelParamCfg {
    level = 30,
    critParam1 = 300.3,
    critParam2 = 1950,
    dodgeParam1 = 202.8,
    dodgeParam2 = 1950,
    breakParam1 = 300.3,
    breakParam2 = 1170,
    critdamage1 = 134.55,
    critdamage2 = 1170
    };
getRow(31)->
    #skillLevelParamCfg {
    level = 31,
    critParam1 = 309,
    critParam2 = 2000,
    dodgeParam1 = 210,
    dodgeParam2 = 2000,
    breakParam1 = 309,
    breakParam2 = 1200,
    critdamage1 = 140,
    critdamage2 = 1200
    };
getRow(32)->
    #skillLevelParamCfg {
    level = 32,
    critParam1 = 317.75,
    critParam2 = 2050,
    dodgeParam1 = 217.3,
    dodgeParam2 = 2050,
    breakParam1 = 317.75,
    breakParam2 = 1230,
    critdamage1 = 145.55,
    critdamage2 = 1230
    };
getRow(33)->
    #skillLevelParamCfg {
    level = 33,
    critParam1 = 326.55,
    critParam2 = 2100,
    dodgeParam1 = 224.7,
    dodgeParam2 = 2100,
    breakParam1 = 326.55,
    breakParam2 = 1260,
    critdamage1 = 151.2,
    critdamage2 = 1260
    };
getRow(34)->
    #skillLevelParamCfg {
    level = 34,
    critParam1 = 335.4,
    critParam2 = 2150,
    dodgeParam1 = 232.2,
    dodgeParam2 = 2150,
    breakParam1 = 335.4,
    breakParam2 = 1290,
    critdamage1 = 156.95,
    critdamage2 = 1290
    };
getRow(35)->
    #skillLevelParamCfg {
    level = 35,
    critParam1 = 344.3,
    critParam2 = 2200,
    dodgeParam1 = 239.8,
    dodgeParam2 = 2200,
    breakParam1 = 344.3,
    breakParam2 = 1320,
    critdamage1 = 162.8,
    critdamage2 = 1320
    };
getRow(36)->
    #skillLevelParamCfg {
    level = 36,
    critParam1 = 353.25,
    critParam2 = 2250,
    dodgeParam1 = 247.5,
    dodgeParam2 = 2250,
    breakParam1 = 353.25,
    breakParam2 = 1350,
    critdamage1 = 168.75,
    critdamage2 = 1350
    };
getRow(37)->
    #skillLevelParamCfg {
    level = 37,
    critParam1 = 362.25,
    critParam2 = 2300,
    dodgeParam1 = 255.3,
    dodgeParam2 = 2300,
    breakParam1 = 362.25,
    breakParam2 = 1380,
    critdamage1 = 174.8,
    critdamage2 = 1380
    };
getRow(38)->
    #skillLevelParamCfg {
    level = 38,
    critParam1 = 371.3,
    critParam2 = 2350,
    dodgeParam1 = 263.2,
    dodgeParam2 = 2350,
    breakParam1 = 371.3,
    breakParam2 = 1410,
    critdamage1 = 180.95,
    critdamage2 = 1410
    };
getRow(39)->
    #skillLevelParamCfg {
    level = 39,
    critParam1 = 380.4,
    critParam2 = 2400,
    dodgeParam1 = 271.2,
    dodgeParam2 = 2400,
    breakParam1 = 380.4,
    breakParam2 = 1440,
    critdamage1 = 187.2,
    critdamage2 = 1440
    };
getRow(40)->
    #skillLevelParamCfg {
    level = 40,
    critParam1 = 389.55,
    critParam2 = 2450,
    dodgeParam1 = 279.3,
    dodgeParam2 = 2450,
    breakParam1 = 389.55,
    breakParam2 = 1470,
    critdamage1 = 193.55,
    critdamage2 = 1470
    };
getRow(41)->
    #skillLevelParamCfg {
    level = 41,
    critParam1 = 398.75,
    critParam2 = 2500,
    dodgeParam1 = 287.5,
    dodgeParam2 = 2500,
    breakParam1 = 398.75,
    breakParam2 = 1500,
    critdamage1 = 200,
    critdamage2 = 1500
    };
getRow(42)->
    #skillLevelParamCfg {
    level = 42,
    critParam1 = 408,
    critParam2 = 2550,
    dodgeParam1 = 295.8,
    dodgeParam2 = 2550,
    breakParam1 = 408,
    breakParam2 = 1530,
    critdamage1 = 205.02,
    critdamage2 = 1530
    };
getRow(43)->
    #skillLevelParamCfg {
    level = 43,
    critParam1 = 417.3,
    critParam2 = 2600,
    dodgeParam1 = 304.2,
    dodgeParam2 = 2600,
    breakParam1 = 417.3,
    breakParam2 = 1560,
    critdamage1 = 210.08,
    critdamage2 = 1560
    };
getRow(44)->
    #skillLevelParamCfg {
    level = 44,
    critParam1 = 426.65,
    critParam2 = 2650,
    dodgeParam1 = 312.7,
    dodgeParam2 = 2650,
    breakParam1 = 426.65,
    breakParam2 = 1590,
    critdamage1 = 215.18,
    critdamage2 = 1590
    };
getRow(45)->
    #skillLevelParamCfg {
    level = 45,
    critParam1 = 436.05,
    critParam2 = 2700,
    dodgeParam1 = 321.3,
    dodgeParam2 = 2700,
    breakParam1 = 436.05,
    breakParam2 = 1620,
    critdamage1 = 220.32,
    critdamage2 = 1620
    };
getRow(46)->
    #skillLevelParamCfg {
    level = 46,
    critParam1 = 445.5,
    critParam2 = 2750,
    dodgeParam1 = 330,
    dodgeParam2 = 2750,
    breakParam1 = 445.5,
    breakParam2 = 1650,
    critdamage1 = 225.5,
    critdamage2 = 1650
    };
getRow(47)->
    #skillLevelParamCfg {
    level = 47,
    critParam1 = 455,
    critParam2 = 2800,
    dodgeParam1 = 338.8,
    dodgeParam2 = 2800,
    breakParam1 = 455,
    breakParam2 = 1680,
    critdamage1 = 230.72,
    critdamage2 = 1680
    };
getRow(48)->
    #skillLevelParamCfg {
    level = 48,
    critParam1 = 464.55,
    critParam2 = 2850,
    dodgeParam1 = 347.7,
    dodgeParam2 = 2850,
    breakParam1 = 464.55,
    breakParam2 = 1710,
    critdamage1 = 235.98,
    critdamage2 = 1710
    };
getRow(49)->
    #skillLevelParamCfg {
    level = 49,
    critParam1 = 474.15,
    critParam2 = 2900,
    dodgeParam1 = 356.700000000001,
    dodgeParam2 = 2900,
    breakParam1 = 474.15,
    breakParam2 = 1740,
    critdamage1 = 241.28,
    critdamage2 = 1740
    };
getRow(50)->
    #skillLevelParamCfg {
    level = 50,
    critParam1 = 483.8,
    critParam2 = 2950,
    dodgeParam1 = 365.800000000001,
    dodgeParam2 = 2950,
    breakParam1 = 483.8,
    breakParam2 = 1770,
    critdamage1 = 246.62,
    critdamage2 = 1770
    };
getRow(51)->
    #skillLevelParamCfg {
    level = 51,
    critParam1 = 493.5,
    critParam2 = 3000,
    dodgeParam1 = 375.000000000001,
    dodgeParam2 = 3000,
    breakParam1 = 493.5,
    breakParam2 = 1800,
    critdamage1 = 252,
    critdamage2 = 1800
    };
getRow(52)->
    #skillLevelParamCfg {
    level = 52,
    critParam1 = 503.25,
    critParam2 = 3050,
    dodgeParam1 = 384.300000000001,
    dodgeParam2 = 3050,
    breakParam1 = 503.25,
    breakParam2 = 1830,
    critdamage1 = 257.42,
    critdamage2 = 1830
    };
getRow(53)->
    #skillLevelParamCfg {
    level = 53,
    critParam1 = 513.05,
    critParam2 = 3100,
    dodgeParam1 = 393.700000000001,
    dodgeParam2 = 3100,
    breakParam1 = 513.05,
    breakParam2 = 1860,
    critdamage1 = 262.88,
    critdamage2 = 1860
    };
getRow(54)->
    #skillLevelParamCfg {
    level = 54,
    critParam1 = 522.9,
    critParam2 = 3150,
    dodgeParam1 = 403.200000000001,
    dodgeParam2 = 3150,
    breakParam1 = 522.9,
    breakParam2 = 1890,
    critdamage1 = 268.38,
    critdamage2 = 1890
    };
getRow(55)->
    #skillLevelParamCfg {
    level = 55,
    critParam1 = 532.8,
    critParam2 = 3200,
    dodgeParam1 = 412.800000000001,
    dodgeParam2 = 3200,
    breakParam1 = 532.8,
    breakParam2 = 1920,
    critdamage1 = 273.92,
    critdamage2 = 1920
    };
getRow(56)->
    #skillLevelParamCfg {
    level = 56,
    critParam1 = 542.75,
    critParam2 = 3250,
    dodgeParam1 = 422.500000000001,
    dodgeParam2 = 3250,
    breakParam1 = 542.75,
    breakParam2 = 1950,
    critdamage1 = 279.5,
    critdamage2 = 1950
    };
getRow(57)->
    #skillLevelParamCfg {
    level = 57,
    critParam1 = 552.75,
    critParam2 = 3300,
    dodgeParam1 = 432.300000000001,
    dodgeParam2 = 3300,
    breakParam1 = 552.75,
    breakParam2 = 1980,
    critdamage1 = 285.12,
    critdamage2 = 1980
    };
getRow(58)->
    #skillLevelParamCfg {
    level = 58,
    critParam1 = 562.8,
    critParam2 = 3350,
    dodgeParam1 = 442.200000000001,
    dodgeParam2 = 3350,
    breakParam1 = 562.8,
    breakParam2 = 2010,
    critdamage1 = 290.78,
    critdamage2 = 2010
    };
getRow(59)->
    #skillLevelParamCfg {
    level = 59,
    critParam1 = 572.9,
    critParam2 = 3400,
    dodgeParam1 = 452.200000000001,
    dodgeParam2 = 3400,
    breakParam1 = 572.9,
    breakParam2 = 2040,
    critdamage1 = 296.48,
    critdamage2 = 2040
    };
getRow(60)->
    #skillLevelParamCfg {
    level = 60,
    critParam1 = 583.05,
    critParam2 = 3450,
    dodgeParam1 = 462.300000000001,
    dodgeParam2 = 3450,
    breakParam1 = 583.05,
    breakParam2 = 2070,
    critdamage1 = 302.22,
    critdamage2 = 2070
    };
getRow(61)->
    #skillLevelParamCfg {
    level = 61,
    critParam1 = 593.25,
    critParam2 = 3500,
    dodgeParam1 = 472.500000000001,
    dodgeParam2 = 3500,
    breakParam1 = 593.25,
    breakParam2 = 2100,
    critdamage1 = 308,
    critdamage2 = 2100
    };
getRow(62)->
    #skillLevelParamCfg {
    level = 62,
    critParam1 = 603.5,
    critParam2 = 3550,
    dodgeParam1 = 482.800000000001,
    dodgeParam2 = 3550,
    breakParam1 = 603.5,
    breakParam2 = 2130,
    critdamage1 = 313.82,
    critdamage2 = 2130
    };
getRow(63)->
    #skillLevelParamCfg {
    level = 63,
    critParam1 = 613.8,
    critParam2 = 3600,
    dodgeParam1 = 493.200000000001,
    dodgeParam2 = 3600,
    breakParam1 = 613.8,
    breakParam2 = 2160,
    critdamage1 = 319.68,
    critdamage2 = 2160
    };
getRow(64)->
    #skillLevelParamCfg {
    level = 64,
    critParam1 = 624.15,
    critParam2 = 3650,
    dodgeParam1 = 503.700000000001,
    dodgeParam2 = 3650,
    breakParam1 = 624.15,
    breakParam2 = 2190,
    critdamage1 = 325.58,
    critdamage2 = 2190
    };
getRow(65)->
    #skillLevelParamCfg {
    level = 65,
    critParam1 = 634.55,
    critParam2 = 3700,
    dodgeParam1 = 514.300000000001,
    dodgeParam2 = 3700,
    breakParam1 = 634.55,
    breakParam2 = 2220,
    critdamage1 = 331.52,
    critdamage2 = 2220
    };
getRow(66)->
    #skillLevelParamCfg {
    level = 66,
    critParam1 = 645,
    critParam2 = 3750,
    dodgeParam1 = 525.000000000001,
    dodgeParam2 = 3750,
    breakParam1 = 645,
    breakParam2 = 2250,
    critdamage1 = 337.5,
    critdamage2 = 2250
    };
getRow(67)->
    #skillLevelParamCfg {
    level = 67,
    critParam1 = 655.5,
    critParam2 = 3800,
    dodgeParam1 = 535.800000000001,
    dodgeParam2 = 3800,
    breakParam1 = 655.5,
    breakParam2 = 2280,
    critdamage1 = 343.52,
    critdamage2 = 2280
    };
getRow(68)->
    #skillLevelParamCfg {
    level = 68,
    critParam1 = 666.05,
    critParam2 = 3850,
    dodgeParam1 = 546.700000000001,
    dodgeParam2 = 3850,
    breakParam1 = 666.05,
    breakParam2 = 2310,
    critdamage1 = 349.58,
    critdamage2 = 2310
    };
getRow(69)->
    #skillLevelParamCfg {
    level = 69,
    critParam1 = 676.65,
    critParam2 = 3900,
    dodgeParam1 = 557.700000000001,
    dodgeParam2 = 3900,
    breakParam1 = 676.65,
    breakParam2 = 2340,
    critdamage1 = 355.68,
    critdamage2 = 2340
    };
getRow(70)->
    #skillLevelParamCfg {
    level = 70,
    critParam1 = 687.3,
    critParam2 = 3950,
    dodgeParam1 = 568.800000000001,
    dodgeParam2 = 3950,
    breakParam1 = 687.3,
    breakParam2 = 2370,
    critdamage1 = 361.82,
    critdamage2 = 2370
    };
getRow(71)->
    #skillLevelParamCfg {
    level = 71,
    critParam1 = 698,
    critParam2 = 4000,
    dodgeParam1 = 580.000000000001,
    dodgeParam2 = 4000,
    breakParam1 = 698,
    breakParam2 = 2400,
    critdamage1 = 368,
    critdamage2 = 2400
    };
getRow(72)->
    #skillLevelParamCfg {
    level = 72,
    critParam1 = 708.75,
    critParam2 = 4050,
    dodgeParam1 = 591.300000000001,
    dodgeParam2 = 4050,
    breakParam1 = 708.75,
    breakParam2 = 2430,
    critdamage1 = 374.22,
    critdamage2 = 2430
    };
getRow(73)->
    #skillLevelParamCfg {
    level = 73,
    critParam1 = 719.55,
    critParam2 = 4100,
    dodgeParam1 = 602.700000000001,
    dodgeParam2 = 4100,
    breakParam1 = 719.55,
    breakParam2 = 2460,
    critdamage1 = 380.48,
    critdamage2 = 2460
    };
getRow(74)->
    #skillLevelParamCfg {
    level = 74,
    critParam1 = 730.4,
    critParam2 = 4150,
    dodgeParam1 = 614.200000000001,
    dodgeParam2 = 4150,
    breakParam1 = 730.4,
    breakParam2 = 2490,
    critdamage1 = 386.78,
    critdamage2 = 2490
    };
getRow(75)->
    #skillLevelParamCfg {
    level = 75,
    critParam1 = 741.3,
    critParam2 = 4200,
    dodgeParam1 = 625.800000000001,
    dodgeParam2 = 4200,
    breakParam1 = 741.3,
    breakParam2 = 2520,
    critdamage1 = 393.12,
    critdamage2 = 2520
    };
getRow(76)->
    #skillLevelParamCfg {
    level = 76,
    critParam1 = 752.25,
    critParam2 = 4250,
    dodgeParam1 = 637.500000000001,
    dodgeParam2 = 4250,
    breakParam1 = 752.25,
    breakParam2 = 2550,
    critdamage1 = 399.5,
    critdamage2 = 2550
    };
getRow(77)->
    #skillLevelParamCfg {
    level = 77,
    critParam1 = 763.25,
    critParam2 = 4300,
    dodgeParam1 = 649.300000000001,
    dodgeParam2 = 4300,
    breakParam1 = 763.25,
    breakParam2 = 2580,
    critdamage1 = 405.92,
    critdamage2 = 2580
    };
getRow(78)->
    #skillLevelParamCfg {
    level = 78,
    critParam1 = 774.3,
    critParam2 = 4350,
    dodgeParam1 = 661.200000000001,
    dodgeParam2 = 4350,
    breakParam1 = 774.3,
    breakParam2 = 2610,
    critdamage1 = 412.38,
    critdamage2 = 2610
    };
getRow(79)->
    #skillLevelParamCfg {
    level = 79,
    critParam1 = 785.4,
    critParam2 = 4400,
    dodgeParam1 = 673.200000000001,
    dodgeParam2 = 4400,
    breakParam1 = 785.4,
    breakParam2 = 2640,
    critdamage1 = 418.88,
    critdamage2 = 2640
    };
getRow(80)->
    #skillLevelParamCfg {
    level = 80,
    critParam1 = 796.55,
    critParam2 = 4450,
    dodgeParam1 = 685.300000000001,
    dodgeParam2 = 4450,
    breakParam1 = 796.55,
    breakParam2 = 2670,
    critdamage1 = 425.42,
    critdamage2 = 2670
    };
getRow(81)->
    #skillLevelParamCfg {
    level = 81,
    critParam1 = 807.75,
    critParam2 = 4500,
    dodgeParam1 = 697.500000000001,
    dodgeParam2 = 4500,
    breakParam1 = 807.75,
    breakParam2 = 2700,
    critdamage1 = 432,
    critdamage2 = 2700
    };
getRow(82)->
    #skillLevelParamCfg {
    level = 82,
    critParam1 = 819,
    critParam2 = 4550,
    dodgeParam1 = 709.800000000001,
    dodgeParam2 = 4550,
    breakParam1 = 819,
    breakParam2 = 2730,
    critdamage1 = 438.62,
    critdamage2 = 2730
    };
getRow(83)->
    #skillLevelParamCfg {
    level = 83,
    critParam1 = 830.3,
    critParam2 = 4600,
    dodgeParam1 = 722.200000000001,
    dodgeParam2 = 4600,
    breakParam1 = 830.3,
    breakParam2 = 2760,
    critdamage1 = 445.28,
    critdamage2 = 2760
    };
getRow(84)->
    #skillLevelParamCfg {
    level = 84,
    critParam1 = 557.457,
    critParam2 = 4650,
    dodgeParam1 = 1026.874,
    dodgeParam2 = 4650,
    breakParam1 = 841.65,
    breakParam2 = 2790,
    critdamage1 = 451.98,
    critdamage2 = 2790
    };
getRow(85)->
    #skillLevelParamCfg {
    level = 85,
    critParam1 = 853.05,
    critParam2 = 4700,
    dodgeParam1 = 747.300000000001,
    dodgeParam2 = 4700,
    breakParam1 = 853.05,
    breakParam2 = 2820,
    critdamage1 = 458.72,
    critdamage2 = 2820
    };
getRow(86)->
    #skillLevelParamCfg {
    level = 86,
    critParam1 = 864.5,
    critParam2 = 4750,
    dodgeParam1 = 760.000000000001,
    dodgeParam2 = 4750,
    breakParam1 = 864.5,
    breakParam2 = 2850,
    critdamage1 = 465.5,
    critdamage2 = 2850
    };
getRow(87)->
    #skillLevelParamCfg {
    level = 87,
    critParam1 = 876,
    critParam2 = 4800,
    dodgeParam1 = 772.800000000001,
    dodgeParam2 = 4800,
    breakParam1 = 876,
    breakParam2 = 2880,
    critdamage1 = 472.320000000019,
    critdamage2 = 2880
    };
getRow(88)->
    #skillLevelParamCfg {
    level = 88,
    critParam1 = 604.868,
    critParam2 = 4850,
    dodgeParam1 = 1075.648,
    dodgeParam2 = 4850,
    breakParam1 = 887.55,
    breakParam2 = 2910,
    critdamage1 = 479.18000000002,
    critdamage2 = 2910
    };
getRow(89)->
    #skillLevelParamCfg {
    level = 89,
    critParam1 = 899.15,
    critParam2 = 4900,
    dodgeParam1 = 798.700000000001,
    dodgeParam2 = 4900,
    breakParam1 = 899.15,
    breakParam2 = 2940,
    critdamage1 = 486.08000000002,
    critdamage2 = 2940
    };
getRow(90)->
    #skillLevelParamCfg {
    level = 90,
    critParam1 = 910.8,
    critParam2 = 4950,
    dodgeParam1 = 810.5625,
    dodgeParam2 = 4950,
    breakParam1 = 910.8,
    breakParam2 = 2970,
    critdamage1 = 493.02000000002,
    critdamage2 = 2970
    };
getRow(91)->
    #skillLevelParamCfg {
    level = 91,
    critParam1 = 922.5,
    critParam2 = 5000,
    dodgeParam1 = 825.000000000001,
    dodgeParam2 = 5000,
    breakParam1 = 922.5,
    breakParam2 = 3000,
    critdamage1 = 500.00000000002,
    critdamage2 = 3000
    };
getRow(92)->
    #skillLevelParamCfg {
    level = 92,
    critParam1 = 934.25,
    critParam2 = 5050,
    dodgeParam1 = 260.338000000001,
    dodgeParam2 = 5050,
    breakParam1 = 934.25,
    breakParam2 = 3030,
    critdamage1 = 507.02000000002,
    critdamage2 = 3030
    };
getRow(93)->
    #skillLevelParamCfg {
    level = 93,
    critParam1 = 946.05,
    critParam2 = 5100,
    dodgeParam1 = 851.700000000001,
    dodgeParam2 = 5100,
    breakParam1 = 946.05,
    breakParam2 = 3060,
    critdamage1 = 514.08000000002,
    critdamage2 = 3060
    };
getRow(94)->
    #skillLevelParamCfg {
    level = 94,
    critParam1 = 957.9,
    critParam2 = 5150,
    dodgeParam1 = 865.200000000001,
    dodgeParam2 = 5150,
    breakParam1 = 1436.07,
    breakParam2 = 3090,
    critdamage1 = 521.180000000021,
    critdamage2 = 3090
    };
getRow(95)->
    #skillLevelParamCfg {
    level = 95,
    critParam1 = 969.8,
    critParam2 = 5200,
    dodgeParam1 = 878.800000000001,
    dodgeParam2 = 5200,
    breakParam1 = 969.8,
    breakParam2 = 3120,
    critdamage1 = 528.320000000021,
    critdamage2 = 3120
    };
getRow(96)->
    #skillLevelParamCfg {
    level = 96,
    critParam1 = 981.75,
    critParam2 = 5250,
    dodgeParam1 = 892.500000000001,
    dodgeParam2 = 5250,
    breakParam1 = 981.75,
    breakParam2 = 3150,
    critdamage1 = 535.500000000021,
    critdamage2 = 3150
    };
getRow(97)->
    #skillLevelParamCfg {
    level = 97,
    critParam1 = 993.75,
    critParam2 = 5300,
    dodgeParam1 = 906.300000000001,
    dodgeParam2 = 5300,
    breakParam1 = 993.75,
    breakParam2 = 3180,
    critdamage1 = 542.720000000021,
    critdamage2 = 3180
    };
getRow(98)->
    #skillLevelParamCfg {
    level = 98,
    critParam1 = 1568.516,
    critParam2 = 5350,
    dodgeParam1 = 920.200000000001,
    dodgeParam2 = 5350,
    breakParam1 = 1005.8,
    breakParam2 = 3210,
    critdamage1 = 549.980000000022,
    critdamage2 = 3210
    };
getRow(99)->
    #skillLevelParamCfg {
    level = 99,
    critParam1 = 1017.9,
    critParam2 = 5400,
    dodgeParam1 = 934.200000000001,
    dodgeParam2 = 5400,
    breakParam1 = 1017.9,
    breakParam2 = 3240,
    critdamage1 = 557.280000000022,
    critdamage2 = 3240
    };
getRow(100)->
    #skillLevelParamCfg {
    level = 100,
    critParam1 = 1030.05,
    critParam2 = 5450,
    dodgeParam1 = 948.300000000001,
    dodgeParam2 = 5450,
    breakParam1 = 1030.05,
    breakParam2 = 3270,
    critdamage1 = 564.620000000022,
    critdamage2 = 3270
    };
getRow(101)->
    #skillLevelParamCfg {
    level = 101,
    critParam1 = 1042.25,
    critParam2 = 5500,
    dodgeParam1 = 962.500000000001,
    dodgeParam2 = 5500,
    breakParam1 = 1042.25,
    breakParam2 = 3300,
    critdamage1 = 572.000000000022,
    critdamage2 = 3300
    };
getRow(102)->
    #skillLevelParamCfg {
    level = 102,
    critParam1 = 1054.5,
    critParam2 = 5550,
    dodgeParam1 = 976.800000000001,
    dodgeParam2 = 5550,
    breakParam1 = 1054.5,
    breakParam2 = 3330,
    critdamage1 = 6.17600000002642,
    critdamage2 = 3330
    };
getRow(103)->
    #skillLevelParamCfg {
    level = 103,
    critParam1 = 1066.8,
    critParam2 = 5600,
    dodgeParam1 = 991.200000000001,
    dodgeParam2 = 5600,
    breakParam1 = 1066.8,
    breakParam2 = 3360,
    critdamage1 = 586.880000000022,
    critdamage2 = 3360
    };
getRow(104)->
    #skillLevelParamCfg {
    level = 104,
    critParam1 = 1079.15,
    critParam2 = 5650,
    dodgeParam1 = 1005.7,
    dodgeParam2 = 5650,
    breakParam1 = 1079.15,
    breakParam2 = 3390,
    critdamage1 = 594.380000000022,
    critdamage2 = 3390
    };
getRow(105)->
    #skillLevelParamCfg {
    level = 105,
    critParam1 = 1091.55,
    critParam2 = 5700,
    dodgeParam1 = 1020.3,
    dodgeParam2 = 5700,
    breakParam1 = 1091.55,
    breakParam2 = 3420,
    critdamage1 = 601.920000000023,
    critdamage2 = 3420
    };
getRow(106)->
    #skillLevelParamCfg {
    level = 106,
    critParam1 = 0.018048,
    critParam2 = 0.094,
    dodgeParam1 = 0.016965,
    dodgeParam2 = 0.09425,
    breakParam1 = 0.03024,
    breakParam2 = 0.0945,
    critdamage1 = 571.410072499995,
    critdamage2 = 0.09475
    };
getRow(107)->
    #skillLevelParamCfg {
    level = 107,
    critParam1 = 1116.5,
    critParam2 = 5800,
    dodgeParam1 = 1049.8,
    dodgeParam2 = 5800,
    breakParam1 = 1116.5,
    breakParam2 = 3480,
    critdamage1 = 617.120000000023,
    critdamage2 = 3480
    };
getRow(108)->
    #skillLevelParamCfg {
    level = 108,
    critParam1 = 1129.05,
    critParam2 = 5850,
    dodgeParam1 = 1064.7,
    dodgeParam2 = 5850,
    breakParam1 = 658.286666666667,
    breakParam2 = 3510,
    critdamage1 = 624.780000000023,
    critdamage2 = 3510
    };
getRow(109)->
    #skillLevelParamCfg {
    level = 109,
    critParam1 = 1141.65,
    critParam2 = 5900,
    dodgeParam1 = 1079.7,
    dodgeParam2 = 5900,
    breakParam1 = 1141.65,
    breakParam2 = 3540,
    critdamage1 = 632.480000000024,
    critdamage2 = 3540
    };
getRow(110)->
    #skillLevelParamCfg {
    level = 110,
    critParam1 = 1154.3,
    critParam2 = 5950,
    dodgeParam1 = 1094.8,
    dodgeParam2 = 5950,
    breakParam1 = 1154.3,
    breakParam2 = 3570,
    critdamage1 = 640.220000000024,
    critdamage2 = 3570
    };
getRow(111)->
    #skillLevelParamCfg {
    level = 111,
    critParam1 = 1167,
    critParam2 = 6000,
    dodgeParam1 = 1110,
    dodgeParam2 = 6000,
    breakParam1 = 1167,
    breakParam2 = 3600,
    critdamage1 = 648.000000000024,
    critdamage2 = 3600
    };
getRow(112)->
    #skillLevelParamCfg {
    level = 112,
    critParam1 = 1179.75,
    critParam2 = 6050,
    dodgeParam1 = 1125.3,
    dodgeParam2 = 6050,
    breakParam1 = 1179.75,
    breakParam2 = 3630,
    critdamage1 = 655.820000000024,
    critdamage2 = 3630
    };
getRow(113)->
    #skillLevelParamCfg {
    level = 113,
    critParam1 = 1192.55,
    critParam2 = 6100,
    dodgeParam1 = 1140.7,
    dodgeParam2 = 6100,
    breakParam1 = 1192.55,
    breakParam2 = 3660,
    critdamage1 = 663.680000000024,
    critdamage2 = 3660
    };
getRow(114)->
    #skillLevelParamCfg {
    level = 114,
    critParam1 = 1205.4,
    critParam2 = 6150,
    dodgeParam1 = 1156.2,
    dodgeParam2 = 6150,
    breakParam1 = 1205.4,
    breakParam2 = 3690,
    critdamage1 = 671.580000000024,
    critdamage2 = 3690
    };
getRow(115)->
    #skillLevelParamCfg {
    level = 115,
    critParam1 = 1218.3,
    critParam2 = 6200,
    dodgeParam1 = 1171.8,
    dodgeParam2 = 6200,
    breakParam1 = 1218.3,
    breakParam2 = 3720,
    critdamage1 = 679.520000000025,
    critdamage2 = 3720
    };
getRow(116)->
    #skillLevelParamCfg {
    level = 116,
    critParam1 = 1231.25,
    critParam2 = 6250,
    dodgeParam1 = 1187.5,
    dodgeParam2 = 6250,
    breakParam1 = 1231.25,
    breakParam2 = 3750,
    critdamage1 = 687.500000000025,
    critdamage2 = 3750
    };
getRow(117)->
    #skillLevelParamCfg {
    level = 117,
    critParam1 = 1244.25,
    critParam2 = 6300,
    dodgeParam1 = 1203.3,
    dodgeParam2 = 6300,
    breakParam1 = 1244.25,
    breakParam2 = 3780,
    critdamage1 = 695.520000000025,
    critdamage2 = 3780
    };
getRow(118)->
    #skillLevelParamCfg {
    level = 118,
    critParam1 = 1257.3,
    critParam2 = 6350,
    dodgeParam1 = 1219.2,
    dodgeParam2 = 6350,
    breakParam1 = 1257.3,
    breakParam2 = 3810,
    critdamage1 = 703.580000000025,
    critdamage2 = 3810
    };
getRow(119)->
    #skillLevelParamCfg {
    level = 119,
    critParam1 = 1270.4,
    critParam2 = 6400,
    dodgeParam1 = 1235.2,
    dodgeParam2 = 6400,
    breakParam1 = 1270.4,
    breakParam2 = 3840,
    critdamage1 = 711.680000000026,
    critdamage2 = 3840
    };
getRow(120)->
    #skillLevelParamCfg {
    level = 120,
    critParam1 = 1283.55,
    critParam2 = 6450,
    dodgeParam1 = 1251.3,
    dodgeParam2 = 6450,
    breakParam1 = 1283.55,
    breakParam2 = 3870,
    critdamage1 = 719.820000000026,
    critdamage2 = 3870
    };
getRow(121)->
    #skillLevelParamCfg {
    level = 121,
    critParam1 = 1296.75,
    critParam2 = 6500,
    dodgeParam1 = 1267.5,
    dodgeParam2 = 6500,
    breakParam1 = 1296.75,
    breakParam2 = 3900,
    critdamage1 = 728.000000000026,
    critdamage2 = 3900
    };
getRow(122)->
    #skillLevelParamCfg {
    level = 122,
    critParam1 = 1310,
    critParam2 = 6550,
    dodgeParam1 = 1283.8,
    dodgeParam2 = 6550,
    breakParam1 = 1310,
    breakParam2 = 3930,
    critdamage1 = 736.220000000026,
    critdamage2 = 3930
    };
getRow(123)->
    #skillLevelParamCfg {
    level = 123,
    critParam1 = 1323.3,
    critParam2 = 6600,
    dodgeParam1 = 1300.2,
    dodgeParam2 = 6600,
    breakParam1 = 1323.3,
    breakParam2 = 3960,
    critdamage1 = 744.480000000026,
    critdamage2 = 3960
    };
getRow(124)->
    #skillLevelParamCfg {
    level = 124,
    critParam1 = 1336.65,
    critParam2 = 6650,
    dodgeParam1 = 1316.7,
    dodgeParam2 = 6650,
    breakParam1 = 1336.65,
    breakParam2 = 3990,
    critdamage1 = 752.780000000026,
    critdamage2 = 3990
    };
getRow(125)->
    #skillLevelParamCfg {
    level = 125,
    critParam1 = 1350.05,
    critParam2 = 6700,
    dodgeParam1 = 1333.3,
    dodgeParam2 = 6700,
    breakParam1 = 1350.05,
    breakParam2 = 4020,
    critdamage1 = 761.120000000027,
    critdamage2 = 4020
    };
getRow(126)->
    #skillLevelParamCfg {
    level = 126,
    critParam1 = 1363.5,
    critParam2 = 6750,
    dodgeParam1 = 1350,
    dodgeParam2 = 6750,
    breakParam1 = 1363.5,
    breakParam2 = 4050,
    critdamage1 = 769.500000000027,
    critdamage2 = 4050
    };
getRow(127)->
    #skillLevelParamCfg {
    level = 127,
    critParam1 = 1377,
    critParam2 = 6800,
    dodgeParam1 = 1366.8,
    dodgeParam2 = 6800,
    breakParam1 = 1377,
    breakParam2 = 4080,
    critdamage1 = 777.920000000027,
    critdamage2 = 4080
    };
getRow(128)->
    #skillLevelParamCfg {
    level = 128,
    critParam1 = 1390.55,
    critParam2 = 6850,
    dodgeParam1 = 1383.7,
    dodgeParam2 = 6850,
    breakParam1 = 1390.55,
    breakParam2 = 4110,
    critdamage1 = 786.380000000027,
    critdamage2 = 4110
    };
getRow(129)->
    #skillLevelParamCfg {
    level = 129,
    critParam1 = 1404.15,
    critParam2 = 6900,
    dodgeParam1 = 1400.7,
    dodgeParam2 = 6900,
    breakParam1 = 1404.15,
    breakParam2 = 4140,
    critdamage1 = 794.880000000028,
    critdamage2 = 4140
    };
getRow(130)->
    #skillLevelParamCfg {
    level = 130,
    critParam1 = 1417.8,
    critParam2 = 6950,
    dodgeParam1 = 1417.8,
    dodgeParam2 = 6950,
    breakParam1 = 1417.8,
    breakParam2 = 4170,
    critdamage1 = 803.420000000027,
    critdamage2 = 4170
    };
getRow(131)->
    #skillLevelParamCfg {
    level = 131,
    critParam1 = 1431.5,
    critParam2 = 7000,
    dodgeParam1 = 1435,
    dodgeParam2 = 7000,
    breakParam1 = 1431.5,
    breakParam2 = 4200,
    critdamage1 = 812.000000000028,
    critdamage2 = 4200
    };
getRow(132)->
    #skillLevelParamCfg {
    level = 132,
    critParam1 = 1445.25,
    critParam2 = 7050,
    dodgeParam1 = 1452.3,
    dodgeParam2 = 7050,
    breakParam1 = 1445.25,
    breakParam2 = 4230,
    critdamage1 = 820.620000000028,
    critdamage2 = 4230
    };
getRow(133)->
    #skillLevelParamCfg {
    level = 133,
    critParam1 = 1459.05,
    critParam2 = 7100,
    dodgeParam1 = 1469.7,
    dodgeParam2 = 7100,
    breakParam1 = 1459.05,
    breakParam2 = 4260,
    critdamage1 = 829.280000000029,
    critdamage2 = 4260
    };
getRow(134)->
    #skillLevelParamCfg {
    level = 134,
    critParam1 = 1472.9,
    critParam2 = 7150,
    dodgeParam1 = 1487.2,
    dodgeParam2 = 7150,
    breakParam1 = 1472.9,
    breakParam2 = 4290,
    critdamage1 = 837.980000000028,
    critdamage2 = 4290
    };
getRow(135)->
    #skillLevelParamCfg {
    level = 135,
    critParam1 = 1486.8,
    critParam2 = 7200,
    dodgeParam1 = 1504.8,
    dodgeParam2 = 7200,
    breakParam1 = 1486.8,
    breakParam2 = 4320,
    critdamage1 = 846.720000000029,
    critdamage2 = 4320
    };
getRow(136)->
    #skillLevelParamCfg {
    level = 136,
    critParam1 = 1500.75,
    critParam2 = 7250,
    dodgeParam1 = 1522.5,
    dodgeParam2 = 7250,
    breakParam1 = 1500.75,
    breakParam2 = 4350,
    critdamage1 = 855.500000000029,
    critdamage2 = 4350
    };
getRow(137)->
    #skillLevelParamCfg {
    level = 137,
    critParam1 = 1514.75,
    critParam2 = 7300,
    dodgeParam1 = 1540.3,
    dodgeParam2 = 7300,
    breakParam1 = 1514.75,
    breakParam2 = 4380,
    critdamage1 = 864.320000000029,
    critdamage2 = 4380
    };
getRow(138)->
    #skillLevelParamCfg {
    level = 138,
    critParam1 = 1528.8,
    critParam2 = 7350,
    dodgeParam1 = 1558.2,
    dodgeParam2 = 7350,
    breakParam1 = 1528.8,
    breakParam2 = 4410,
    critdamage1 = 873.180000000029,
    critdamage2 = 4410
    };
getRow(139)->
    #skillLevelParamCfg {
    level = 139,
    critParam1 = 1542.9,
    critParam2 = 7400,
    dodgeParam1 = 1576.2,
    dodgeParam2 = 7400,
    breakParam1 = 1542.9,
    breakParam2 = 4440,
    critdamage1 = 882.08000000003,
    critdamage2 = 4440
    };
getRow(140)->
    #skillLevelParamCfg {
    level = 140,
    critParam1 = 1557.05,
    critParam2 = 7450,
    dodgeParam1 = 1594.3,
    dodgeParam2 = 7450,
    breakParam1 = 1557.05,
    breakParam2 = 4470,
    critdamage1 = 891.02000000003,
    critdamage2 = 4470
    };
getRow(141)->
    #skillLevelParamCfg {
    level = 141,
    critParam1 = 1571.25,
    critParam2 = 7500,
    dodgeParam1 = 1612.5,
    dodgeParam2 = 7500,
    breakParam1 = 1571.25,
    breakParam2 = 4500,
    critdamage1 = 900.00000000003,
    critdamage2 = 4500
    };
getRow(142)->
    #skillLevelParamCfg {
    level = 142,
    critParam1 = 1585.5,
    critParam2 = 7550,
    dodgeParam1 = 1630.8,
    dodgeParam2 = 7550,
    breakParam1 = 1585.5,
    breakParam2 = 4530,
    critdamage1 = 909.02000000003,
    critdamage2 = 4530
    };
getRow(143)->
    #skillLevelParamCfg {
    level = 143,
    critParam1 = 1599.8,
    critParam2 = 7600,
    dodgeParam1 = 1649.2,
    dodgeParam2 = 7600,
    breakParam1 = 1599.8,
    breakParam2 = 4560,
    critdamage1 = 918.080000000031,
    critdamage2 = 4560
    };
getRow(144)->
    #skillLevelParamCfg {
    level = 144,
    critParam1 = 1614.15,
    critParam2 = 7650,
    dodgeParam1 = 1667.7,
    dodgeParam2 = 7650,
    breakParam1 = 1614.15,
    breakParam2 = 4590,
    critdamage1 = 927.18000000003,
    critdamage2 = 4590
    };
getRow(145)->
    #skillLevelParamCfg {
    level = 145,
    critParam1 = 1628.55,
    critParam2 = 7700,
    dodgeParam1 = 1686.3,
    dodgeParam2 = 7700,
    breakParam1 = 1628.55,
    breakParam2 = 4620,
    critdamage1 = 936.320000000031,
    critdamage2 = 4620
    };
getRow(146)->
    #skillLevelParamCfg {
    level = 146,
    critParam1 = 1643,
    critParam2 = 7750,
    dodgeParam1 = 1705,
    dodgeParam2 = 7750,
    breakParam1 = 1643,
    breakParam2 = 4650,
    critdamage1 = 945.500000000031,
    critdamage2 = 4650
    };
getRow(147)->
    #skillLevelParamCfg {
    level = 147,
    critParam1 = 1657.5,
    critParam2 = 7800,
    dodgeParam1 = 1723.8,
    dodgeParam2 = 7800,
    breakParam1 = 1657.5,
    breakParam2 = 4680,
    critdamage1 = 954.720000000031,
    critdamage2 = 4680
    };
getRow(148)->
    #skillLevelParamCfg {
    level = 148,
    critParam1 = 1672.05,
    critParam2 = 7850,
    dodgeParam1 = 1742.7,
    dodgeParam2 = 7850,
    breakParam1 = 1672.05,
    breakParam2 = 4710,
    critdamage1 = 963.980000000031,
    critdamage2 = 4710
    };
getRow(149)->
    #skillLevelParamCfg {
    level = 149,
    critParam1 = 1686.65,
    critParam2 = 7900,
    dodgeParam1 = 1761.7,
    dodgeParam2 = 7900,
    breakParam1 = 1686.65,
    breakParam2 = 4740,
    critdamage1 = 973.280000000032,
    critdamage2 = 4740
    };
getRow(150)->
    #skillLevelParamCfg {
    level = 150,
    critParam1 = 1701.3,
    critParam2 = 7950,
    dodgeParam1 = 1780.8,
    dodgeParam2 = 7950,
    breakParam1 = 1701.3,
    breakParam2 = 4770,
    critdamage1 = 982.620000000032,
    critdamage2 = 4770
    };
getRow(151)->
    #skillLevelParamCfg {
    level = 151,
    critParam1 = 1716,
    critParam2 = 8000,
    dodgeParam1 = 1800,
    dodgeParam2 = 8000,
    breakParam1 = 1716,
    breakParam2 = 4800,
    critdamage1 = 992.000000000032,
    critdamage2 = 4800
    };
getRow(152)->
    #skillLevelParamCfg {
    level = 152,
    critParam1 = 1730.75,
    critParam2 = 8050,
    dodgeParam1 = 1819.3,
    dodgeParam2 = 8050,
    breakParam1 = 1730.75,
    breakParam2 = 4830,
    critdamage1 = 1001.42000000003,
    critdamage2 = 4830
    };
getRow(153)->
    #skillLevelParamCfg {
    level = 153,
    critParam1 = 1745.55,
    critParam2 = 8100,
    dodgeParam1 = 1838.7,
    dodgeParam2 = 8100,
    breakParam1 = 1745.55,
    breakParam2 = 4860,
    critdamage1 = 1010.88000000003,
    critdamage2 = 4860
    };
getRow(154)->
    #skillLevelParamCfg {
    level = 154,
    critParam1 = 1760.4,
    critParam2 = 8150,
    dodgeParam1 = 1858.2,
    dodgeParam2 = 8150,
    breakParam1 = 1760.4,
    breakParam2 = 4890,
    critdamage1 = 1020.38000000003,
    critdamage2 = 4890
    };
getRow(155)->
    #skillLevelParamCfg {
    level = 155,
    critParam1 = 1775.3,
    critParam2 = 8200,
    dodgeParam1 = 1877.8,
    dodgeParam2 = 8200,
    breakParam1 = 1775.3,
    breakParam2 = 4920,
    critdamage1 = 1029.92000000003,
    critdamage2 = 4920
    };
getRow(156)->
    #skillLevelParamCfg {
    level = 156,
    critParam1 = 1790.25,
    critParam2 = 8250,
    dodgeParam1 = 1897.5,
    dodgeParam2 = 8250,
    breakParam1 = 1790.25,
    breakParam2 = 4950,
    critdamage1 = 1039.50000000003,
    critdamage2 = 4950
    };
getRow(157)->
    #skillLevelParamCfg {
    level = 157,
    critParam1 = 1805.25,
    critParam2 = 8300,
    dodgeParam1 = 1917.3,
    dodgeParam2 = 8300,
    breakParam1 = 1805.25,
    breakParam2 = 4980,
    critdamage1 = 1049.12000000003,
    critdamage2 = 4980
    };
getRow(158)->
    #skillLevelParamCfg {
    level = 158,
    critParam1 = 1820.3,
    critParam2 = 8350,
    dodgeParam1 = 1937.2,
    dodgeParam2 = 8350,
    breakParam1 = 1820.3,
    breakParam2 = 5010,
    critdamage1 = 1058.78000000003,
    critdamage2 = 5010
    };
getRow(159)->
    #skillLevelParamCfg {
    level = 159,
    critParam1 = 1835.4,
    critParam2 = 8400,
    dodgeParam1 = 1957.2,
    dodgeParam2 = 8400,
    breakParam1 = 1835.4,
    breakParam2 = 5040,
    critdamage1 = 1068.48000000003,
    critdamage2 = 5040
    };
getRow(160)->
    #skillLevelParamCfg {
    level = 160,
    critParam1 = 1850.55,
    critParam2 = 8450,
    dodgeParam1 = 1977.3,
    dodgeParam2 = 8450,
    breakParam1 = 1850.55,
    breakParam2 = 5070,
    critdamage1 = 1078.22000000003,
    critdamage2 = 5070
    };
getRow(161)->
    #skillLevelParamCfg {
    level = 161,
    critParam1 = 1865.75,
    critParam2 = 8500,
    dodgeParam1 = 1997.5,
    dodgeParam2 = 8500,
    breakParam1 = 1865.75,
    breakParam2 = 5100,
    critdamage1 = 1088.00000000003,
    critdamage2 = 5100
    };
getRow(162)->
    #skillLevelParamCfg {
    level = 162,
    critParam1 = 1881,
    critParam2 = 8550,
    dodgeParam1 = 2017.8,
    dodgeParam2 = 8550,
    breakParam1 = 1881,
    breakParam2 = 5130,
    critdamage1 = 1097.82000000003,
    critdamage2 = 5130
    };
getRow(163)->
    #skillLevelParamCfg {
    level = 163,
    critParam1 = 1896.3,
    critParam2 = 8600,
    dodgeParam1 = 2038.2,
    dodgeParam2 = 8600,
    breakParam1 = 1896.3,
    breakParam2 = 5160,
    critdamage1 = 1107.68000000003,
    critdamage2 = 5160
    };
getRow(164)->
    #skillLevelParamCfg {
    level = 164,
    critParam1 = 1911.65,
    critParam2 = 8650,
    dodgeParam1 = 2058.7,
    dodgeParam2 = 8650,
    breakParam1 = 1911.65,
    breakParam2 = 5190,
    critdamage1 = 1117.58000000003,
    critdamage2 = 5190
    };
getRow(165)->
    #skillLevelParamCfg {
    level = 165,
    critParam1 = 1927.05,
    critParam2 = 8700,
    dodgeParam1 = 2079.3,
    dodgeParam2 = 8700,
    breakParam1 = 1927.05,
    breakParam2 = 5220,
    critdamage1 = 1127.52000000004,
    critdamage2 = 5220
    };
getRow(166)->
    #skillLevelParamCfg {
    level = 166,
    critParam1 = 1942.5,
    critParam2 = 8750,
    dodgeParam1 = 2100,
    dodgeParam2 = 8750,
    breakParam1 = 1942.5,
    breakParam2 = 5250,
    critdamage1 = 1137.50000000003,
    critdamage2 = 5250
    };
getRow(167)->
    #skillLevelParamCfg {
    level = 167,
    critParam1 = 1958,
    critParam2 = 8800,
    dodgeParam1 = 2120.8,
    dodgeParam2 = 8800,
    breakParam1 = 1958,
    breakParam2 = 5280,
    critdamage1 = 1147.52000000004,
    critdamage2 = 5280
    };
getRow(168)->
    #skillLevelParamCfg {
    level = 168,
    critParam1 = 1973.55,
    critParam2 = 8850,
    dodgeParam1 = 2141.7,
    dodgeParam2 = 8850,
    breakParam1 = 1973.55,
    breakParam2 = 5310,
    critdamage1 = 1157.58000000004,
    critdamage2 = 5310
    };
getRow(169)->
    #skillLevelParamCfg {
    level = 169,
    critParam1 = 1989.15,
    critParam2 = 8900,
    dodgeParam1 = 2162.7,
    dodgeParam2 = 8900,
    breakParam1 = 1989.15,
    breakParam2 = 5340,
    critdamage1 = 1167.68000000004,
    critdamage2 = 5340
    };
getRow(170)->
    #skillLevelParamCfg {
    level = 170,
    critParam1 = 2004.8,
    critParam2 = 8950,
    dodgeParam1 = 2183.8,
    dodgeParam2 = 8950,
    breakParam1 = 2004.8,
    breakParam2 = 5370,
    critdamage1 = 1177.82000000004,
    critdamage2 = 5370
    };
getRow(171)->
    #skillLevelParamCfg {
    level = 171,
    critParam1 = 2020.5,
    critParam2 = 9000,
    dodgeParam1 = 2205,
    dodgeParam2 = 9000,
    breakParam1 = 2020.5,
    breakParam2 = 5400,
    critdamage1 = 1188.00000000004,
    critdamage2 = 5400
    };
getRow(172)->
    #skillLevelParamCfg {
    level = 172,
    critParam1 = 2036.25,
    critParam2 = 9050,
    dodgeParam1 = 2226.3,
    dodgeParam2 = 9050,
    breakParam1 = 2036.25,
    breakParam2 = 5430,
    critdamage1 = 1198.22000000007,
    critdamage2 = 5430
    };
getRow(173)->
    #skillLevelParamCfg {
    level = 173,
    critParam1 = 2052.05,
    critParam2 = 9100,
    dodgeParam1 = 2247.7,
    dodgeParam2 = 9100,
    breakParam1 = 2052.05,
    breakParam2 = 5460,
    critdamage1 = 1208.48000000004,
    critdamage2 = 5460
    };
getRow(174)->
    #skillLevelParamCfg {
    level = 174,
    critParam1 = 2067.9,
    critParam2 = 9150,
    dodgeParam1 = 2269.2,
    dodgeParam2 = 9150,
    breakParam1 = 2067.9,
    breakParam2 = 5490,
    critdamage1 = 1218.78000000004,
    critdamage2 = 5490
    };
getRow(175)->
    #skillLevelParamCfg {
    level = 175,
    critParam1 = 2083.8,
    critParam2 = 9200,
    dodgeParam1 = 2290.8,
    dodgeParam2 = 9200,
    breakParam1 = 2083.8,
    breakParam2 = 5520,
    critdamage1 = 1229.12000000004,
    critdamage2 = 5520
    };
getRow(176)->
    #skillLevelParamCfg {
    level = 176,
    critParam1 = 2099.75,
    critParam2 = 9250,
    dodgeParam1 = 2312.5,
    dodgeParam2 = 9250,
    breakParam1 = 2099.75,
    breakParam2 = 5550,
    critdamage1 = 1239.50000000007,
    critdamage2 = 5550
    };
getRow(177)->
    #skillLevelParamCfg {
    level = 177,
    critParam1 = 2115.75,
    critParam2 = 9300,
    dodgeParam1 = 2334.3,
    dodgeParam2 = 9300,
    breakParam1 = 2115.75,
    breakParam2 = 5580,
    critdamage1 = 1249.92000000004,
    critdamage2 = 5580
    };
getRow(178)->
    #skillLevelParamCfg {
    level = 178,
    critParam1 = 2131.8,
    critParam2 = 9350,
    dodgeParam1 = 2356.2,
    dodgeParam2 = 9350,
    breakParam1 = 2131.8,
    breakParam2 = 5610,
    critdamage1 = 1260.38000000004,
    critdamage2 = 5610
    };
getRow(179)->
    #skillLevelParamCfg {
    level = 179,
    critParam1 = 2147.9,
    critParam2 = 9400,
    dodgeParam1 = 2378.2,
    dodgeParam2 = 9400,
    breakParam1 = 2147.9,
    breakParam2 = 5640,
    critdamage1 = 1270.88000000004,
    critdamage2 = 5640
    };
getRow(180)->
    #skillLevelParamCfg {
    level = 180,
    critParam1 = 2164.05,
    critParam2 = 9450,
    dodgeParam1 = 2400.3,
    dodgeParam2 = 9450,
    breakParam1 = 2164.05,
    breakParam2 = 5670,
    critdamage1 = 1281.42000000008,
    critdamage2 = 5670
    };
getRow(181)->
    #skillLevelParamCfg {
    level = 181,
    critParam1 = 2180.25,
    critParam2 = 9500,
    dodgeParam1 = 2422.5,
    dodgeParam2 = 9500,
    breakParam1 = 2180.25,
    breakParam2 = 5700,
    critdamage1 = 1292.00000000008,
    critdamage2 = 5700
    };
getRow(182)->
    #skillLevelParamCfg {
    level = 182,
    critParam1 = 2196.5,
    critParam2 = 9550,
    dodgeParam1 = 2444.8,
    dodgeParam2 = 9550,
    breakParam1 = 2196.5,
    breakParam2 = 5730,
    critdamage1 = 1302.62000000008,
    critdamage2 = 5730
    };
getRow(183)->
    #skillLevelParamCfg {
    level = 183,
    critParam1 = 2212.8,
    critParam2 = 9600,
    dodgeParam1 = 2467.2,
    dodgeParam2 = 9600,
    breakParam1 = 2212.8,
    breakParam2 = 5760,
    critdamage1 = 1313.28000000008,
    critdamage2 = 5760
    };
getRow(184)->
    #skillLevelParamCfg {
    level = 184,
    critParam1 = 2229.15,
    critParam2 = 9650,
    dodgeParam1 = 2489.7,
    dodgeParam2 = 9650,
    breakParam1 = 2229.15,
    breakParam2 = 5790,
    critdamage1 = 1323.98000000008,
    critdamage2 = 5790
    };
getRow(185)->
    #skillLevelParamCfg {
    level = 185,
    critParam1 = 2245.55,
    critParam2 = 9700,
    dodgeParam1 = 2512.3,
    dodgeParam2 = 9700,
    breakParam1 = 2245.55,
    breakParam2 = 5820,
    critdamage1 = 1334.72000000008,
    critdamage2 = 5820
    };
getRow(186)->
    #skillLevelParamCfg {
    level = 186,
    critParam1 = 2262,
    critParam2 = 9750,
    dodgeParam1 = 2535,
    dodgeParam2 = 9750,
    breakParam1 = 2262,
    breakParam2 = 5850,
    critdamage1 = 1345.50000000008,
    critdamage2 = 5850
    };
getRow(187)->
    #skillLevelParamCfg {
    level = 187,
    critParam1 = 2278.5,
    critParam2 = 9800,
    dodgeParam1 = 2557.8,
    dodgeParam2 = 9800,
    breakParam1 = 2278.5,
    breakParam2 = 5880,
    critdamage1 = 1356.32000000008,
    critdamage2 = 5880
    };
getRow(188)->
    #skillLevelParamCfg {
    level = 188,
    critParam1 = 2295.05,
    critParam2 = 9850,
    dodgeParam1 = 2580.7,
    dodgeParam2 = 9850,
    breakParam1 = 2295.05,
    breakParam2 = 5910,
    critdamage1 = 1367.18000000008,
    critdamage2 = 5910
    };
getRow(189)->
    #skillLevelParamCfg {
    level = 189,
    critParam1 = 2311.65,
    critParam2 = 9900,
    dodgeParam1 = 2603.7,
    dodgeParam2 = 9900,
    breakParam1 = 2311.65,
    breakParam2 = 5940,
    critdamage1 = 1378.08000000008,
    critdamage2 = 5940
    };
getRow(190)->
    #skillLevelParamCfg {
    level = 190,
    critParam1 = 2328.3,
    critParam2 = 9950,
    dodgeParam1 = 2626.8,
    dodgeParam2 = 9950,
    breakParam1 = 2328.3,
    breakParam2 = 5970,
    critdamage1 = 1389.02000000008,
    critdamage2 = 5970
    };
getRow(191)->
    #skillLevelParamCfg {
    level = 191,
    critParam1 = 2345,
    critParam2 = 10000,
    dodgeParam1 = 2650,
    dodgeParam2 = 10000,
    breakParam1 = 2345,
    breakParam2 = 6000,
    critdamage1 = 1400.00000000008,
    critdamage2 = 6000
    };
getRow(192)->
    #skillLevelParamCfg {
    level = 192,
    critParam1 = 2361.75,
    critParam2 = 10050,
    dodgeParam1 = 2673.3,
    dodgeParam2 = 10050,
    breakParam1 = 2361.75,
    breakParam2 = 6030,
    critdamage1 = 1411.02000000008,
    critdamage2 = 6030
    };
getRow(193)->
    #skillLevelParamCfg {
    level = 193,
    critParam1 = 2378.55,
    critParam2 = 10100,
    dodgeParam1 = 2696.7,
    dodgeParam2 = 10100,
    breakParam1 = 2378.55,
    breakParam2 = 6060,
    critdamage1 = 1422.08000000008,
    critdamage2 = 6060
    };
getRow(194)->
    #skillLevelParamCfg {
    level = 194,
    critParam1 = 2395.4,
    critParam2 = 10150,
    dodgeParam1 = 2720.2,
    dodgeParam2 = 10150,
    breakParam1 = 2395.4,
    breakParam2 = 6090,
    critdamage1 = 1433.18000000008,
    critdamage2 = 6090
    };
getRow(195)->
    #skillLevelParamCfg {
    level = 195,
    critParam1 = 2412.3,
    critParam2 = 10200,
    dodgeParam1 = 2743.8,
    dodgeParam2 = 10200,
    breakParam1 = 2412.3,
    breakParam2 = 6120,
    critdamage1 = 1444.32000000008,
    critdamage2 = 6120
    };
getRow(196)->
    #skillLevelParamCfg {
    level = 196,
    critParam1 = 2429.25,
    critParam2 = 10250,
    dodgeParam1 = 2767.5,
    dodgeParam2 = 10250,
    breakParam1 = 2429.25,
    breakParam2 = 6150,
    critdamage1 = 1455.50000000008,
    critdamage2 = 6150
    };
getRow(197)->
    #skillLevelParamCfg {
    level = 197,
    critParam1 = 2446.25,
    critParam2 = 10300,
    dodgeParam1 = 2791.3,
    dodgeParam2 = 10300,
    breakParam1 = 2446.25,
    breakParam2 = 6180,
    critdamage1 = 1466.72000000008,
    critdamage2 = 6180
    };
getRow(198)->
    #skillLevelParamCfg {
    level = 198,
    critParam1 = 2463.3,
    critParam2 = 10350,
    dodgeParam1 = 2815.2,
    dodgeParam2 = 10350,
    breakParam1 = 2463.3,
    breakParam2 = 6210,
    critdamage1 = 1477.98000000008,
    critdamage2 = 6210
    };
getRow(199)->
    #skillLevelParamCfg {
    level = 199,
    critParam1 = 2480.4,
    critParam2 = 10400,
    dodgeParam1 = 2839.2,
    dodgeParam2 = 10400,
    breakParam1 = 2480.4,
    breakParam2 = 6240,
    critdamage1 = 1489.28000000008,
    critdamage2 = 6240
    };
getRow(200)->
    #skillLevelParamCfg {
    level = 200,
    critParam1 = 2497.55,
    critParam2 = 10450,
    dodgeParam1 = 2863.3,
    dodgeParam2 = 10450,
    breakParam1 = 2497.55,
    breakParam2 = 6270,
    critdamage1 = 1500.62000000008,
    critdamage2 = 6270
    };
getRow(201)->
    #skillLevelParamCfg {
    level = 201,
    critParam1 = 2514.75,
    critParam2 = 10500,
    dodgeParam1 = 2887.5,
    dodgeParam2 = 10500,
    breakParam1 = 2514.75,
    breakParam2 = 6300,
    critdamage1 = 1512.00000000008,
    critdamage2 = 6300
    };
getRow(202)->
    #skillLevelParamCfg {
    level = 202,
    critParam1 = 2532,
    critParam2 = 10550,
    dodgeParam1 = 2911.8,
    dodgeParam2 = 10550,
    breakParam1 = 2532,
    breakParam2 = 6330,
    critdamage1 = 1523.42000000008,
    critdamage2 = 6330
    };
getRow(203)->
    #skillLevelParamCfg {
    level = 203,
    critParam1 = 2549.3,
    critParam2 = 10600,
    dodgeParam1 = 2936.2,
    dodgeParam2 = 10600,
    breakParam1 = 2549.3,
    breakParam2 = 6360,
    critdamage1 = 1534.88000000009,
    critdamage2 = 6360
    };
getRow(204)->
    #skillLevelParamCfg {
    level = 204,
    critParam1 = 2566.65,
    critParam2 = 10650,
    dodgeParam1 = 2960.7,
    dodgeParam2 = 10650,
    breakParam1 = 2566.65,
    breakParam2 = 6390,
    critdamage1 = 1546.38000000008,
    critdamage2 = 6390
    };
getRow(205)->
    #skillLevelParamCfg {
    level = 205,
    critParam1 = 2584.05,
    critParam2 = 10700,
    dodgeParam1 = 2985.3,
    dodgeParam2 = 10700,
    breakParam1 = 2584.05,
    breakParam2 = 6420,
    critdamage1 = 1557.92000000009,
    critdamage2 = 6420
    };
getRow(206)->
    #skillLevelParamCfg {
    level = 206,
    critParam1 = 2601.5,
    critParam2 = 10750,
    dodgeParam1 = 3010,
    dodgeParam2 = 10750,
    breakParam1 = 2601.5,
    breakParam2 = 6450,
    critdamage1 = 1569.50000000009,
    critdamage2 = 6450
    };
getRow(207)->
    #skillLevelParamCfg {
    level = 207,
    critParam1 = 2619,
    critParam2 = 10800,
    dodgeParam1 = 3034.8,
    dodgeParam2 = 10800,
    breakParam1 = 2619,
    breakParam2 = 6480,
    critdamage1 = 1581.12000000009,
    critdamage2 = 6480
    };
getRow(208)->
    #skillLevelParamCfg {
    level = 208,
    critParam1 = 2636.55,
    critParam2 = 10850,
    dodgeParam1 = 3059.7,
    dodgeParam2 = 10850,
    breakParam1 = 2636.55,
    breakParam2 = 6510,
    critdamage1 = 1592.78000000009,
    critdamage2 = 6510
    };
getRow(209)->
    #skillLevelParamCfg {
    level = 209,
    critParam1 = 2654.15,
    critParam2 = 10900,
    dodgeParam1 = 3084.7,
    dodgeParam2 = 10900,
    breakParam1 = 2654.15,
    breakParam2 = 6540,
    critdamage1 = 1604.48000000009,
    critdamage2 = 6540
    };
getRow(210)->
    #skillLevelParamCfg {
    level = 210,
    critParam1 = 2671.8,
    critParam2 = 10950,
    dodgeParam1 = 3109.8,
    dodgeParam2 = 10950,
    breakParam1 = 2671.8,
    breakParam2 = 6570,
    critdamage1 = 1616.22000000009,
    critdamage2 = 6570
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
    {105},
    {106},
    {107},
    {108},
    {109},
    {110},
    {111},
    {112},
    {113},
    {114},
    {115},
    {116},
    {117},
    {118},
    {119},
    {120},
    {121},
    {122},
    {123},
    {124},
    {125},
    {126},
    {127},
    {128},
    {129},
    {130},
    {131},
    {132},
    {133},
    {134},
    {135},
    {136},
    {137},
    {138},
    {139},
    {140},
    {141},
    {142},
    {143},
    {144},
    {145},
    {146},
    {147},
    {148},
    {149},
    {150},
    {151},
    {152},
    {153},
    {154},
    {155},
    {156},
    {157},
    {158},
    {159},
    {160},
    {161},
    {162},
    {163},
    {164},
    {165},
    {166},
    {167},
    {168},
    {169},
    {170},
    {171},
    {172},
    {173},
    {174},
    {175},
    {176},
    {177},
    {178},
    {179},
    {180},
    {181},
    {182},
    {183},
    {184},
    {185},
    {186},
    {187},
    {188},
    {189},
    {190},
    {191},
    {192},
    {193},
    {194},
    {195},
    {196},
    {197},
    {198},
    {199},
    {200},
    {201},
    {202},
    {203},
    {204},
    {205},
    {206},
    {207},
    {208},
    {209},
    {210}
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
    105,
    106,
    107,
    108,
    109,
    110,
    111,
    112,
    113,
    114,
    115,
    116,
    117,
    118,
    119,
    120,
    121,
    122,
    123,
    124,
    125,
    126,
    127,
    128,
    129,
    130,
    131,
    132,
    133,
    134,
    135,
    136,
    137,
    138,
    139,
    140,
    141,
    142,
    143,
    144,
    145,
    146,
    147,
    148,
    149,
    150,
    151,
    152,
    153,
    154,
    155,
    156,
    157,
    158,
    159,
    160,
    161,
    162,
    163,
    164,
    165,
    166,
    167,
    168,
    169,
    170,
    171,
    172,
    173,
    174,
    175,
    176,
    177,
    178,
    179,
    180,
    181,
    182,
    183,
    184,
    185,
    186,
    187,
    188,
    189,
    190,
    191,
    192,
    193,
    194,
    195,
    196,
    197,
    198,
    199,
    200,
    201,
    202,
    203,
    204,
    205,
    206,
    207,
    208,
    209,
    210
    ].

