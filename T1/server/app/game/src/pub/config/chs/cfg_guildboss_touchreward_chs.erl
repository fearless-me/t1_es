%% coding: latin-1
%%: 实现
-module(cfg_guildboss_touchreward_chs).
-compile(export_all).
-include("cfg_guildboss_touchreward.hrl").
-include("logger.hrl").

getRow(1)->
    #guildboss_touchrewardCfg {
    rank = 1,
    touch_1 = [800,2400],
    touch_2 = [800,3000],
    touch_3 = [800,3000],
    touch_4 = [800,3600],
    touch_5 = [800,4200],
    touch_6 = [800,4200],
    touch_7 = [800,4800],
    touch_8 = [800,5400],
    touch_9 = [800,5400],
    touch_10 = [800,6000]
    };
getRow(2)->
    #guildboss_touchrewardCfg {
    rank = 2,
    touch_1 = [700,2250],
    touch_2 = [700,2810],
    touch_3 = [700,2810],
    touch_4 = [700,3380],
    touch_5 = [700,3940],
    touch_6 = [700,3940],
    touch_7 = [700,4500],
    touch_8 = [700,5060],
    touch_9 = [700,5060],
    touch_10 = [700,5630]
    };
getRow(3)->
    #guildboss_touchrewardCfg {
    rank = 3,
    touch_1 = [650,2100],
    touch_2 = [650,2630],
    touch_3 = [650,2630],
    touch_4 = [650,3150],
    touch_5 = [650,3680],
    touch_6 = [650,3680],
    touch_7 = [650,4200],
    touch_8 = [650,4730],
    touch_9 = [650,4730],
    touch_10 = [650,5250]
    };
getRow(4)->
    #guildboss_touchrewardCfg {
    rank = 4,
    touch_1 = [600,1950],
    touch_2 = [600,2440],
    touch_3 = [600,2440],
    touch_4 = [600,2930],
    touch_5 = [600,3410],
    touch_6 = [600,3410],
    touch_7 = [600,3900],
    touch_8 = [600,4390],
    touch_9 = [600,4390],
    touch_10 = [600,4880]
    };
getRow(5)->
    #guildboss_touchrewardCfg {
    rank = 5,
    touch_1 = [500,1800],
    touch_2 = [500,2250],
    touch_3 = [500,2250],
    touch_4 = [500,2700],
    touch_5 = [500,3150],
    touch_6 = [500,3150],
    touch_7 = [500,3600],
    touch_8 = [500,4050],
    touch_9 = [500,4050],
    touch_10 = [500,4500]
    };
getRow(6)->
    #guildboss_touchrewardCfg {
    rank = 6,
    touch_1 = [500,1800],
    touch_2 = [500,2250],
    touch_3 = [500,2250],
    touch_4 = [500,2700],
    touch_5 = [500,3150],
    touch_6 = [500,3150],
    touch_7 = [500,3600],
    touch_8 = [500,4050],
    touch_9 = [500,4050],
    touch_10 = [500,4500]
    };
getRow(7)->
    #guildboss_touchrewardCfg {
    rank = 7,
    touch_1 = [500,1800],
    touch_2 = [500,2250],
    touch_3 = [500,2250],
    touch_4 = [500,2700],
    touch_5 = [500,3150],
    touch_6 = [500,3150],
    touch_7 = [500,3600],
    touch_8 = [500,4050],
    touch_9 = [500,4050],
    touch_10 = [500,4500]
    };
getRow(8)->
    #guildboss_touchrewardCfg {
    rank = 8,
    touch_1 = [500,1800],
    touch_2 = [500,2250],
    touch_3 = [500,2250],
    touch_4 = [500,2700],
    touch_5 = [500,3150],
    touch_6 = [500,3150],
    touch_7 = [500,3600],
    touch_8 = [500,4050],
    touch_9 = [500,4050],
    touch_10 = [500,4500]
    };
getRow(9)->
    #guildboss_touchrewardCfg {
    rank = 9,
    touch_1 = [500,1800],
    touch_2 = [500,2250],
    touch_3 = [500,2250],
    touch_4 = [500,2700],
    touch_5 = [500,3150],
    touch_6 = [500,3150],
    touch_7 = [500,3600],
    touch_8 = [500,4050],
    touch_9 = [500,4050],
    touch_10 = [500,4500]
    };
getRow(10)->
    #guildboss_touchrewardCfg {
    rank = 10,
    touch_1 = [400,1650],
    touch_2 = [400,2060],
    touch_3 = [400,2060],
    touch_4 = [400,2480],
    touch_5 = [400,2890],
    touch_6 = [400,2890],
    touch_7 = [400,3300],
    touch_8 = [400,3710],
    touch_9 = [400,3710],
    touch_10 = [400,4130]
    };
getRow(11)->
    #guildboss_touchrewardCfg {
    rank = 11,
    touch_1 = [400,1650],
    touch_2 = [400,2060],
    touch_3 = [400,2060],
    touch_4 = [400,2480],
    touch_5 = [400,2890],
    touch_6 = [400,2890],
    touch_7 = [400,3300],
    touch_8 = [400,3710],
    touch_9 = [400,3710],
    touch_10 = [400,4130]
    };
getRow(12)->
    #guildboss_touchrewardCfg {
    rank = 12,
    touch_1 = [400,1650],
    touch_2 = [400,2060],
    touch_3 = [400,2060],
    touch_4 = [400,2480],
    touch_5 = [400,2890],
    touch_6 = [400,2890],
    touch_7 = [400,3300],
    touch_8 = [400,3710],
    touch_9 = [400,3710],
    touch_10 = [400,4130]
    };
getRow(13)->
    #guildboss_touchrewardCfg {
    rank = 13,
    touch_1 = [400,1650],
    touch_2 = [400,2060],
    touch_3 = [400,2060],
    touch_4 = [400,2480],
    touch_5 = [400,2890],
    touch_6 = [400,2890],
    touch_7 = [400,3300],
    touch_8 = [400,3710],
    touch_9 = [400,3710],
    touch_10 = [400,4130]
    };
getRow(14)->
    #guildboss_touchrewardCfg {
    rank = 14,
    touch_1 = [400,1650],
    touch_2 = [400,2060],
    touch_3 = [400,2060],
    touch_4 = [400,2480],
    touch_5 = [400,2890],
    touch_6 = [400,2890],
    touch_7 = [400,3300],
    touch_8 = [400,3710],
    touch_9 = [400,3710],
    touch_10 = [400,4130]
    };
getRow(15)->
    #guildboss_touchrewardCfg {
    rank = 15,
    touch_1 = [400,1650],
    touch_2 = [400,2060],
    touch_3 = [400,2060],
    touch_4 = [400,2480],
    touch_5 = [400,2890],
    touch_6 = [400,2890],
    touch_7 = [400,3300],
    touch_8 = [400,3710],
    touch_9 = [400,3710],
    touch_10 = [400,4130]
    };
getRow(16)->
    #guildboss_touchrewardCfg {
    rank = 16,
    touch_1 = [400,1650],
    touch_2 = [400,2060],
    touch_3 = [400,2060],
    touch_4 = [400,2480],
    touch_5 = [400,2890],
    touch_6 = [400,2890],
    touch_7 = [400,3300],
    touch_8 = [400,3710],
    touch_9 = [400,3710],
    touch_10 = [400,4130]
    };
getRow(17)->
    #guildboss_touchrewardCfg {
    rank = 17,
    touch_1 = [400,1650],
    touch_2 = [400,2060],
    touch_3 = [400,2060],
    touch_4 = [400,2480],
    touch_5 = [400,2890],
    touch_6 = [400,2890],
    touch_7 = [400,3300],
    touch_8 = [400,3710],
    touch_9 = [400,3710],
    touch_10 = [400,4130]
    };
getRow(18)->
    #guildboss_touchrewardCfg {
    rank = 18,
    touch_1 = [400,1650],
    touch_2 = [400,2060],
    touch_3 = [400,2060],
    touch_4 = [400,2480],
    touch_5 = [400,2890],
    touch_6 = [400,2890],
    touch_7 = [400,3300],
    touch_8 = [400,3710],
    touch_9 = [400,3710],
    touch_10 = [400,4130]
    };
getRow(19)->
    #guildboss_touchrewardCfg {
    rank = 19,
    touch_1 = [400,1650],
    touch_2 = [400,2060],
    touch_3 = [400,2060],
    touch_4 = [400,2480],
    touch_5 = [400,2890],
    touch_6 = [400,2890],
    touch_7 = [400,3300],
    touch_8 = [400,3710],
    touch_9 = [400,3710],
    touch_10 = [400,4130]
    };
getRow(20)->
    #guildboss_touchrewardCfg {
    rank = 20,
    touch_1 = [300,1500],
    touch_2 = [300,1880],
    touch_3 = [300,1880],
    touch_4 = [300,2250],
    touch_5 = [300,2630],
    touch_6 = [300,2630],
    touch_7 = [300,3000],
    touch_8 = [300,3380],
    touch_9 = [300,3380],
    touch_10 = [300,3750]
    };
getRow(21)->
    #guildboss_touchrewardCfg {
    rank = 21,
    touch_1 = [300,1500],
    touch_2 = [300,1880],
    touch_3 = [300,1880],
    touch_4 = [300,2250],
    touch_5 = [300,2630],
    touch_6 = [300,2630],
    touch_7 = [300,3000],
    touch_8 = [300,3380],
    touch_9 = [300,3380],
    touch_10 = [300,3750]
    };
getRow(22)->
    #guildboss_touchrewardCfg {
    rank = 22,
    touch_1 = [300,1500],
    touch_2 = [300,1880],
    touch_3 = [300,1880],
    touch_4 = [300,2250],
    touch_5 = [300,2630],
    touch_6 = [300,2630],
    touch_7 = [300,3000],
    touch_8 = [300,3380],
    touch_9 = [300,3380],
    touch_10 = [300,3750]
    };
getRow(23)->
    #guildboss_touchrewardCfg {
    rank = 23,
    touch_1 = [300,1500],
    touch_2 = [300,1880],
    touch_3 = [300,1880],
    touch_4 = [300,2250],
    touch_5 = [300,2630],
    touch_6 = [300,2630],
    touch_7 = [300,3000],
    touch_8 = [300,3380],
    touch_9 = [300,3380],
    touch_10 = [300,3750]
    };
getRow(24)->
    #guildboss_touchrewardCfg {
    rank = 24,
    touch_1 = [300,1500],
    touch_2 = [300,1880],
    touch_3 = [300,1880],
    touch_4 = [300,2250],
    touch_5 = [300,2630],
    touch_6 = [300,2630],
    touch_7 = [300,3000],
    touch_8 = [300,3380],
    touch_9 = [300,3380],
    touch_10 = [300,3750]
    };
getRow(25)->
    #guildboss_touchrewardCfg {
    rank = 25,
    touch_1 = [300,1500],
    touch_2 = [300,1880],
    touch_3 = [300,1880],
    touch_4 = [300,2250],
    touch_5 = [300,2630],
    touch_6 = [300,2630],
    touch_7 = [300,3000],
    touch_8 = [300,3380],
    touch_9 = [300,3380],
    touch_10 = [300,3750]
    };
getRow(26)->
    #guildboss_touchrewardCfg {
    rank = 26,
    touch_1 = [300,1500],
    touch_2 = [300,1880],
    touch_3 = [300,1880],
    touch_4 = [300,2250],
    touch_5 = [300,2630],
    touch_6 = [300,2630],
    touch_7 = [300,3000],
    touch_8 = [300,3380],
    touch_9 = [300,3380],
    touch_10 = [300,3750]
    };
getRow(27)->
    #guildboss_touchrewardCfg {
    rank = 27,
    touch_1 = [300,1500],
    touch_2 = [300,1880],
    touch_3 = [300,1880],
    touch_4 = [300,2250],
    touch_5 = [300,2630],
    touch_6 = [300,2630],
    touch_7 = [300,3000],
    touch_8 = [300,3380],
    touch_9 = [300,3380],
    touch_10 = [300,3750]
    };
getRow(28)->
    #guildboss_touchrewardCfg {
    rank = 28,
    touch_1 = [300,1500],
    touch_2 = [300,1880],
    touch_3 = [300,1880],
    touch_4 = [300,2250],
    touch_5 = [300,2630],
    touch_6 = [300,2630],
    touch_7 = [300,3000],
    touch_8 = [300,3380],
    touch_9 = [300,3380],
    touch_10 = [300,3750]
    };
getRow(29)->
    #guildboss_touchrewardCfg {
    rank = 29,
    touch_1 = [300,1500],
    touch_2 = [300,1880],
    touch_3 = [300,1880],
    touch_4 = [300,2250],
    touch_5 = [300,2630],
    touch_6 = [300,2630],
    touch_7 = [300,3000],
    touch_8 = [300,3380],
    touch_9 = [300,3380],
    touch_10 = [300,3750]
    };
getRow(30)->
    #guildboss_touchrewardCfg {
    rank = 30,
    touch_1 = [250,1350],
    touch_2 = [250,1690],
    touch_3 = [250,1690],
    touch_4 = [250,2030],
    touch_5 = [250,2360],
    touch_6 = [250,2360],
    touch_7 = [250,2700],
    touch_8 = [250,3040],
    touch_9 = [250,3040],
    touch_10 = [250,3380]
    };
getRow(31)->
    #guildboss_touchrewardCfg {
    rank = 31,
    touch_1 = [250,1350],
    touch_2 = [250,1690],
    touch_3 = [250,1690],
    touch_4 = [250,2030],
    touch_5 = [250,2360],
    touch_6 = [250,2360],
    touch_7 = [250,2700],
    touch_8 = [250,3040],
    touch_9 = [250,3040],
    touch_10 = [250,3380]
    };
getRow(32)->
    #guildboss_touchrewardCfg {
    rank = 32,
    touch_1 = [250,1350],
    touch_2 = [250,1690],
    touch_3 = [250,1690],
    touch_4 = [250,2030],
    touch_5 = [250,2360],
    touch_6 = [250,2360],
    touch_7 = [250,2700],
    touch_8 = [250,3040],
    touch_9 = [250,3040],
    touch_10 = [250,3380]
    };
getRow(33)->
    #guildboss_touchrewardCfg {
    rank = 33,
    touch_1 = [250,1350],
    touch_2 = [250,1690],
    touch_3 = [250,1690],
    touch_4 = [250,2030],
    touch_5 = [250,2360],
    touch_6 = [250,2360],
    touch_7 = [250,2700],
    touch_8 = [250,3040],
    touch_9 = [250,3040],
    touch_10 = [250,3380]
    };
getRow(34)->
    #guildboss_touchrewardCfg {
    rank = 34,
    touch_1 = [250,1350],
    touch_2 = [250,1690],
    touch_3 = [250,1690],
    touch_4 = [250,2030],
    touch_5 = [250,2360],
    touch_6 = [250,2360],
    touch_7 = [250,2700],
    touch_8 = [250,3040],
    touch_9 = [250,3040],
    touch_10 = [250,3380]
    };
getRow(35)->
    #guildboss_touchrewardCfg {
    rank = 35,
    touch_1 = [250,1350],
    touch_2 = [250,1690],
    touch_3 = [250,1690],
    touch_4 = [250,2030],
    touch_5 = [250,2360],
    touch_6 = [250,2360],
    touch_7 = [250,2700],
    touch_8 = [250,3040],
    touch_9 = [250,3040],
    touch_10 = [250,3380]
    };
getRow(36)->
    #guildboss_touchrewardCfg {
    rank = 36,
    touch_1 = [250,1350],
    touch_2 = [250,1690],
    touch_3 = [250,1690],
    touch_4 = [250,2030],
    touch_5 = [250,2360],
    touch_6 = [250,2360],
    touch_7 = [250,2700],
    touch_8 = [250,3040],
    touch_9 = [250,3040],
    touch_10 = [250,3380]
    };
getRow(37)->
    #guildboss_touchrewardCfg {
    rank = 37,
    touch_1 = [250,1350],
    touch_2 = [250,1690],
    touch_3 = [250,1690],
    touch_4 = [250,2030],
    touch_5 = [250,2360],
    touch_6 = [250,2360],
    touch_7 = [250,2700],
    touch_8 = [250,3040],
    touch_9 = [250,3040],
    touch_10 = [250,3380]
    };
getRow(38)->
    #guildboss_touchrewardCfg {
    rank = 38,
    touch_1 = [250,1350],
    touch_2 = [250,1690],
    touch_3 = [250,1690],
    touch_4 = [250,2030],
    touch_5 = [250,2360],
    touch_6 = [250,2360],
    touch_7 = [250,2700],
    touch_8 = [250,3040],
    touch_9 = [250,3040],
    touch_10 = [250,3380]
    };
getRow(39)->
    #guildboss_touchrewardCfg {
    rank = 39,
    touch_1 = [250,1350],
    touch_2 = [250,1690],
    touch_3 = [250,1690],
    touch_4 = [250,2030],
    touch_5 = [250,2360],
    touch_6 = [250,2360],
    touch_7 = [250,2700],
    touch_8 = [250,3040],
    touch_9 = [250,3040],
    touch_10 = [250,3380]
    };
getRow(40)->
    #guildboss_touchrewardCfg {
    rank = 40,
    touch_1 = [250,1350],
    touch_2 = [250,1690],
    touch_3 = [250,1690],
    touch_4 = [250,2030],
    touch_5 = [250,2360],
    touch_6 = [250,2360],
    touch_7 = [250,2700],
    touch_8 = [250,3040],
    touch_9 = [250,3040],
    touch_10 = [250,3380]
    };
getRow(41)->
    #guildboss_touchrewardCfg {
    rank = 41,
    touch_1 = [250,1350],
    touch_2 = [250,1690],
    touch_3 = [250,1690],
    touch_4 = [250,2030],
    touch_5 = [250,2360],
    touch_6 = [250,2360],
    touch_7 = [250,2700],
    touch_8 = [250,3040],
    touch_9 = [250,3040],
    touch_10 = [250,3380]
    };
getRow(42)->
    #guildboss_touchrewardCfg {
    rank = 42,
    touch_1 = [250,1350],
    touch_2 = [250,1690],
    touch_3 = [250,1690],
    touch_4 = [250,2030],
    touch_5 = [250,2360],
    touch_6 = [250,2360],
    touch_7 = [250,2700],
    touch_8 = [250,3040],
    touch_9 = [250,3040],
    touch_10 = [250,3380]
    };
getRow(43)->
    #guildboss_touchrewardCfg {
    rank = 43,
    touch_1 = [250,1350],
    touch_2 = [250,1690],
    touch_3 = [250,1690],
    touch_4 = [250,2030],
    touch_5 = [250,2360],
    touch_6 = [250,2360],
    touch_7 = [250,2700],
    touch_8 = [250,3040],
    touch_9 = [250,3040],
    touch_10 = [250,3380]
    };
getRow(44)->
    #guildboss_touchrewardCfg {
    rank = 44,
    touch_1 = [250,1350],
    touch_2 = [250,1690],
    touch_3 = [250,1690],
    touch_4 = [250,2030],
    touch_5 = [250,2360],
    touch_6 = [250,2360],
    touch_7 = [250,2700],
    touch_8 = [250,3040],
    touch_9 = [250,3040],
    touch_10 = [250,3380]
    };
getRow(45)->
    #guildboss_touchrewardCfg {
    rank = 45,
    touch_1 = [250,1350],
    touch_2 = [250,1690],
    touch_3 = [250,1690],
    touch_4 = [250,2030],
    touch_5 = [250,2360],
    touch_6 = [250,2360],
    touch_7 = [250,2700],
    touch_8 = [250,3040],
    touch_9 = [250,3040],
    touch_10 = [250,3380]
    };
getRow(46)->
    #guildboss_touchrewardCfg {
    rank = 46,
    touch_1 = [250,1350],
    touch_2 = [250,1690],
    touch_3 = [250,1690],
    touch_4 = [250,2030],
    touch_5 = [250,2360],
    touch_6 = [250,2360],
    touch_7 = [250,2700],
    touch_8 = [250,3040],
    touch_9 = [250,3040],
    touch_10 = [250,3380]
    };
getRow(47)->
    #guildboss_touchrewardCfg {
    rank = 47,
    touch_1 = [250,1350],
    touch_2 = [250,1690],
    touch_3 = [250,1690],
    touch_4 = [250,2030],
    touch_5 = [250,2360],
    touch_6 = [250,2360],
    touch_7 = [250,2700],
    touch_8 = [250,3040],
    touch_9 = [250,3040],
    touch_10 = [250,3380]
    };
getRow(48)->
    #guildboss_touchrewardCfg {
    rank = 48,
    touch_1 = [250,1350],
    touch_2 = [250,1690],
    touch_3 = [250,1690],
    touch_4 = [250,2030],
    touch_5 = [250,2360],
    touch_6 = [250,2360],
    touch_7 = [250,2700],
    touch_8 = [250,3040],
    touch_9 = [250,3040],
    touch_10 = [250,3380]
    };
getRow(49)->
    #guildboss_touchrewardCfg {
    rank = 49,
    touch_1 = [250,1350],
    touch_2 = [250,1690],
    touch_3 = [250,1690],
    touch_4 = [250,2030],
    touch_5 = [250,2360],
    touch_6 = [250,2360],
    touch_7 = [250,2700],
    touch_8 = [250,3040],
    touch_9 = [250,3040],
    touch_10 = [250,3380]
    };
getRow(50)->
    #guildboss_touchrewardCfg {
    rank = 50,
    touch_1 = [250,1200],
    touch_2 = [250,1500],
    touch_3 = [250,1500],
    touch_4 = [250,1800],
    touch_5 = [250,2100],
    touch_6 = [250,2100],
    touch_7 = [250,2400],
    touch_8 = [250,2700],
    touch_9 = [250,2700],
    touch_10 = [250,3000]
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
    {50}
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
    50
    ].

