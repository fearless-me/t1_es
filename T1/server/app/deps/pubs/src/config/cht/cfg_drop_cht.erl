%% coding: latin-1
%%: 实现
-module(cfg_drop_cht).
-compile(export_all).
-include("cfg_drop.hrl").
-include("logger.hrl").

getRow(1)->
    #dropCfg {
    dropId = 1,
    dropType = 0,
    dataId = 11,
    probability = 5000,
    career = 0,
    sex = 0,
    min = 1,
    max = 5,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(2)->
    #dropCfg {
    dropId = 2,
    dropType = 1,
    dataId = 1,
    probability = 5000,
    career = 0,
    sex = 0,
    min = 0,
    max = 0,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(3)->
    #dropCfg {
    dropId = 2,
    dropType = 1,
    dataId = 2,
    probability = 5000,
    career = 0,
    sex = 0,
    min = 0,
    max = 0,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(4)->
    #dropCfg {
    dropId = 51,
    dropType = 1,
    dataId = 11,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(5)->
    #dropCfg {
    dropId = 52,
    dropType = 1,
    dataId = 12,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(6)->
    #dropCfg {
    dropId = 53,
    dropType = 1,
    dataId = 13,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(7)->
    #dropCfg {
    dropId = 54,
    dropType = 1,
    dataId = 14,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(8)->
    #dropCfg {
    dropId = 55,
    dropType = 1,
    dataId = 15,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(9)->
    #dropCfg {
    dropId = 56,
    dropType = 1,
    dataId = 16,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(10)->
    #dropCfg {
    dropId = 57,
    dropType = 1,
    dataId = 17,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(11)->
    #dropCfg {
    dropId = 58,
    dropType = 1,
    dataId = 18,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(12)->
    #dropCfg {
    dropId = 59,
    dropType = 1,
    dataId = 19,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(13)->
    #dropCfg {
    dropId = 60,
    dropType = 1,
    dataId = 20,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(14)->
    #dropCfg {
    dropId = 71,
    dropType = 1,
    dataId = 11,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(15)->
    #dropCfg {
    dropId = 72,
    dropType = 1,
    dataId = 11,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(16)->
    #dropCfg {
    dropId = 73,
    dropType = 1,
    dataId = 11,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(17)->
    #dropCfg {
    dropId = 74,
    dropType = 1,
    dataId = 11,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(18)->
    #dropCfg {
    dropId = 75,
    dropType = 1,
    dataId = 11,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(19)->
    #dropCfg {
    dropId = 76,
    dropType = 1,
    dataId = 11,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(20)->
    #dropCfg {
    dropId = 77,
    dropType = 1,
    dataId = 11,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(21)->
    #dropCfg {
    dropId = 78,
    dropType = 1,
    dataId = 11,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(22)->
    #dropCfg {
    dropId = 79,
    dropType = 1,
    dataId = 11,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(23)->
    #dropCfg {
    dropId = 80,
    dropType = 1,
    dataId = 11,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(24)->
    #dropCfg {
    dropId = 101,
    dropType = 0,
    dataId = 611,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 5,
    max = 5,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(25)->
    #dropCfg {
    dropId = 101,
    dropType = 0,
    dataId = 612,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 5,
    max = 5,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(26)->
    #dropCfg {
    dropId = 101,
    dropType = 0,
    dataId = 613,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 5,
    max = 5,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(27)->
    #dropCfg {
    dropId = 101,
    dropType = 0,
    dataId = 614,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 5,
    max = 5,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(28)->
    #dropCfg {
    dropId = 102,
    dropType = 0,
    dataId = 152,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(29)->
    #dropCfg {
    dropId = 102,
    dropType = 0,
    dataId = 200,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 99,
    max = 99,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(30)->
    #dropCfg {
    dropId = 103,
    dropType = 0,
    dataId = 21001,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 5,
    max = 5,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(31)->
    #dropCfg {
    dropId = 103,
    dropType = 0,
    dataId = 11,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 5,
    max = 5,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(32)->
    #dropCfg {
    dropId = 103,
    dropType = 0,
    dataId = 11,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 5,
    max = 5,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(33)->
    #dropCfg {
    dropId = 221,
    dropType = 1,
    dataId = 221,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(34)->
    #dropCfg {
    dropId = 261,
    dropType = 1,
    dataId = 261,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(35)->
    #dropCfg {
    dropId = 262,
    dropType = 1,
    dataId = 262,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(36)->
    #dropCfg {
    dropId = 263,
    dropType = 1,
    dataId = 263,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(37)->
    #dropCfg {
    dropId = 1001,
    dropType = 1,
    dataId = 11,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 2,
    max = 2,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(38)->
    #dropCfg {
    dropId = 1001,
    dropType = 1,
    dataId = 12,
    probability = 1000,
    career = 0,
    sex = 0,
    min = 2,
    max = 2,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(39)->
    #dropCfg {
    dropId = 1001,
    dropType = 0,
    dataId = 222,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 4,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(40)->
    #dropCfg {
    dropId = 1001,
    dropType = 0,
    dataId = 622,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 5,
    max = 10,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(41)->
    #dropCfg {
    dropId = 1001,
    dropType = 0,
    dataId = 2104,
    probability = 2500,
    career = 0,
    sex = 0,
    min = 2,
    max = 2,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(42)->
    #dropCfg {
    dropId = 1001,
    dropType = 0,
    dataId = 7000,
    probability = 6000,
    career = 0,
    sex = 0,
    min = 2,
    max = 10,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(43)->
    #dropCfg {
    dropId = 1001,
    dropType = 0,
    dataId = 2022,
    probability = 5000,
    career = 0,
    sex = 0,
    min = 2,
    max = 2,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(44)->
    #dropCfg {
    dropId = 1001,
    dropType = 0,
    dataId = 2213,
    probability = 300,
    career = 0,
    sex = 0,
    min = 2,
    max = 2,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(45)->
    #dropCfg {
    dropId = 1001,
    dropType = 0,
    dataId = 2215,
    probability = 300,
    career = 0,
    sex = 0,
    min = 2,
    max = 2,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(46)->
    #dropCfg {
    dropId = 1001,
    dropType = 0,
    dataId = 3200,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 3200,
    level = 1,
    kind = 0
    };
getRow(47)->
    #dropCfg {
    dropId = 1002,
    dropType = 1,
    dataId = 11,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 2,
    max = 2,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(48)->
    #dropCfg {
    dropId = 1002,
    dropType = 1,
    dataId = 12,
    probability = 1000,
    career = 0,
    sex = 0,
    min = 2,
    max = 2,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(49)->
    #dropCfg {
    dropId = 1002,
    dropType = 0,
    dataId = 222,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 4,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(50)->
    #dropCfg {
    dropId = 1002,
    dropType = 0,
    dataId = 622,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 5,
    max = 10,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(51)->
    #dropCfg {
    dropId = 1002,
    dropType = 0,
    dataId = 2104,
    probability = 2500,
    career = 0,
    sex = 0,
    min = 2,
    max = 2,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(52)->
    #dropCfg {
    dropId = 1002,
    dropType = 0,
    dataId = 7000,
    probability = 6000,
    career = 0,
    sex = 0,
    min = 2,
    max = 10,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(53)->
    #dropCfg {
    dropId = 1002,
    dropType = 0,
    dataId = 2022,
    probability = 5000,
    career = 0,
    sex = 0,
    min = 2,
    max = 2,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(54)->
    #dropCfg {
    dropId = 1002,
    dropType = 0,
    dataId = 2213,
    probability = 300,
    career = 0,
    sex = 0,
    min = 2,
    max = 2,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(55)->
    #dropCfg {
    dropId = 1002,
    dropType = 0,
    dataId = 2215,
    probability = 300,
    career = 0,
    sex = 0,
    min = 1,
    max = 2,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(56)->
    #dropCfg {
    dropId = 1002,
    dropType = 0,
    dataId = 4400,
    probability = 100,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 4400,
    level = 1,
    kind = 0
    };
getRow(57)->
    #dropCfg {
    dropId = 1002,
    dropType = 0,
    dataId = 4410,
    probability = 100,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 4410,
    level = 1,
    kind = 0
    };
getRow(58)->
    #dropCfg {
    dropId = 1002,
    dropType = 0,
    dataId = 4420,
    probability = 100,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 4420,
    level = 1,
    kind = 0
    };
getRow(59)->
    #dropCfg {
    dropId = 1002,
    dropType = 0,
    dataId = 4430,
    probability = 100,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 4430,
    level = 1,
    kind = 0
    };
getRow(60)->
    #dropCfg {
    dropId = 1002,
    dropType = 0,
    dataId = 4440,
    probability = 100,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 4440,
    level = 1,
    kind = 0
    };
getRow(61)->
    #dropCfg {
    dropId = 1002,
    dropType = 0,
    dataId = 3200,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 3200,
    level = 1,
    kind = 0
    };
getRow(62)->
    #dropCfg {
    dropId = 1003,
    dropType = 1,
    dataId = 11,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 2,
    max = 2,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(63)->
    #dropCfg {
    dropId = 1003,
    dropType = 1,
    dataId = 12,
    probability = 1000,
    career = 0,
    sex = 0,
    min = 2,
    max = 2,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(64)->
    #dropCfg {
    dropId = 1003,
    dropType = 0,
    dataId = 222,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 4,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(65)->
    #dropCfg {
    dropId = 1003,
    dropType = 0,
    dataId = 622,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 5,
    max = 10,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(66)->
    #dropCfg {
    dropId = 1003,
    dropType = 0,
    dataId = 2104,
    probability = 2500,
    career = 0,
    sex = 0,
    min = 2,
    max = 2,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(67)->
    #dropCfg {
    dropId = 1003,
    dropType = 0,
    dataId = 7001,
    probability = 2500,
    career = 0,
    sex = 0,
    min = 2,
    max = 10,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(68)->
    #dropCfg {
    dropId = 1003,
    dropType = 0,
    dataId = 2022,
    probability = 5000,
    career = 0,
    sex = 0,
    min = 2,
    max = 2,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(69)->
    #dropCfg {
    dropId = 1003,
    dropType = 0,
    dataId = 2213,
    probability = 300,
    career = 0,
    sex = 0,
    min = 2,
    max = 2,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(70)->
    #dropCfg {
    dropId = 1003,
    dropType = 0,
    dataId = 2215,
    probability = 300,
    career = 0,
    sex = 0,
    min = 2,
    max = 2,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(71)->
    #dropCfg {
    dropId = 1003,
    dropType = 0,
    dataId = 4400,
    probability = 100,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 4400,
    level = 1,
    kind = 0
    };
getRow(72)->
    #dropCfg {
    dropId = 1003,
    dropType = 0,
    dataId = 4410,
    probability = 100,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 4410,
    level = 1,
    kind = 0
    };
getRow(73)->
    #dropCfg {
    dropId = 1003,
    dropType = 0,
    dataId = 4420,
    probability = 100,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 4420,
    level = 1,
    kind = 0
    };
getRow(74)->
    #dropCfg {
    dropId = 1003,
    dropType = 0,
    dataId = 4430,
    probability = 100,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 4430,
    level = 1,
    kind = 0
    };
getRow(75)->
    #dropCfg {
    dropId = 1003,
    dropType = 0,
    dataId = 4440,
    probability = 100,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 4440,
    level = 1,
    kind = 0
    };
getRow(76)->
    #dropCfg {
    dropId = 1003,
    dropType = 0,
    dataId = 3200,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 3200,
    level = 1,
    kind = 0
    };
getRow(77)->
    #dropCfg {
    dropId = 1004,
    dropType = 1,
    dataId = 11,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 2,
    max = 2,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(78)->
    #dropCfg {
    dropId = 1004,
    dropType = 1,
    dataId = 12,
    probability = 1000,
    career = 0,
    sex = 0,
    min = 2,
    max = 2,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(79)->
    #dropCfg {
    dropId = 1004,
    dropType = 0,
    dataId = 222,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 4,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(80)->
    #dropCfg {
    dropId = 1004,
    dropType = 0,
    dataId = 622,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 5,
    max = 10,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(81)->
    #dropCfg {
    dropId = 1004,
    dropType = 0,
    dataId = 2104,
    probability = 2500,
    career = 0,
    sex = 0,
    min = 2,
    max = 2,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(82)->
    #dropCfg {
    dropId = 1004,
    dropType = 0,
    dataId = 7001,
    probability = 5000,
    career = 0,
    sex = 0,
    min = 2,
    max = 10,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(83)->
    #dropCfg {
    dropId = 1004,
    dropType = 0,
    dataId = 2022,
    probability = 5000,
    career = 0,
    sex = 0,
    min = 2,
    max = 2,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(84)->
    #dropCfg {
    dropId = 1004,
    dropType = 0,
    dataId = 2213,
    probability = 300,
    career = 0,
    sex = 0,
    min = 2,
    max = 2,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(85)->
    #dropCfg {
    dropId = 1004,
    dropType = 0,
    dataId = 2215,
    probability = 300,
    career = 0,
    sex = 0,
    min = 2,
    max = 2,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(86)->
    #dropCfg {
    dropId = 1004,
    dropType = 0,
    dataId = 4400,
    probability = 100,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 4400,
    level = 1,
    kind = 0
    };
getRow(87)->
    #dropCfg {
    dropId = 1004,
    dropType = 0,
    dataId = 4410,
    probability = 100,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 4410,
    level = 1,
    kind = 0
    };
getRow(88)->
    #dropCfg {
    dropId = 1004,
    dropType = 0,
    dataId = 4420,
    probability = 100,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 4420,
    level = 1,
    kind = 0
    };
getRow(89)->
    #dropCfg {
    dropId = 1004,
    dropType = 0,
    dataId = 4430,
    probability = 100,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 4430,
    level = 1,
    kind = 0
    };
getRow(90)->
    #dropCfg {
    dropId = 1004,
    dropType = 0,
    dataId = 4440,
    probability = 100,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 4440,
    level = 1,
    kind = 0
    };
getRow(91)->
    #dropCfg {
    dropId = 1004,
    dropType = 0,
    dataId = 3200,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 3200,
    level = 1,
    kind = 0
    };
getRow(92)->
    #dropCfg {
    dropId = 1005,
    dropType = 1,
    dataId = 11,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 2,
    max = 2,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(93)->
    #dropCfg {
    dropId = 1005,
    dropType = 1,
    dataId = 12,
    probability = 1000,
    career = 0,
    sex = 0,
    min = 2,
    max = 2,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(94)->
    #dropCfg {
    dropId = 1005,
    dropType = 0,
    dataId = 222,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 4,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(95)->
    #dropCfg {
    dropId = 1005,
    dropType = 0,
    dataId = 622,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 5,
    max = 10,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(96)->
    #dropCfg {
    dropId = 1005,
    dropType = 0,
    dataId = 2104,
    probability = 2500,
    career = 0,
    sex = 0,
    min = 2,
    max = 2,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(97)->
    #dropCfg {
    dropId = 1005,
    dropType = 0,
    dataId = 7001,
    probability = 5000,
    career = 0,
    sex = 0,
    min = 2,
    max = 10,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(98)->
    #dropCfg {
    dropId = 1005,
    dropType = 0,
    dataId = 2022,
    probability = 5000,
    career = 0,
    sex = 0,
    min = 2,
    max = 2,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(99)->
    #dropCfg {
    dropId = 1005,
    dropType = 0,
    dataId = 2213,
    probability = 300,
    career = 0,
    sex = 0,
    min = 2,
    max = 2,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(100)->
    #dropCfg {
    dropId = 1005,
    dropType = 0,
    dataId = 2215,
    probability = 300,
    career = 0,
    sex = 0,
    min = 2,
    max = 2,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(101)->
    #dropCfg {
    dropId = 1005,
    dropType = 0,
    dataId = 4400,
    probability = 100,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 4400,
    level = 1,
    kind = 0
    };
getRow(102)->
    #dropCfg {
    dropId = 1005,
    dropType = 0,
    dataId = 4410,
    probability = 100,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 4410,
    level = 1,
    kind = 0
    };
getRow(103)->
    #dropCfg {
    dropId = 1005,
    dropType = 0,
    dataId = 4420,
    probability = 100,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 4420,
    level = 1,
    kind = 0
    };
getRow(104)->
    #dropCfg {
    dropId = 1005,
    dropType = 0,
    dataId = 4430,
    probability = 100,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 4430,
    level = 1,
    kind = 0
    };
getRow(105)->
    #dropCfg {
    dropId = 1005,
    dropType = 0,
    dataId = 4440,
    probability = 100,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 4440,
    level = 1,
    kind = 0
    };
getRow(106)->
    #dropCfg {
    dropId = 1005,
    dropType = 0,
    dataId = 3200,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 3200,
    level = 1,
    kind = 0
    };
getRow(107)->
    #dropCfg {
    dropId = 1006,
    dropType = 0,
    dataId = 7000,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 10,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(108)->
    #dropCfg {
    dropId = 1006,
    dropType = 0,
    dataId = 1112,
    probability = 1000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(109)->
    #dropCfg {
    dropId = 1006,
    dropType = 0,
    dataId = 7005,
    probability = 2500,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(110)->
    #dropCfg {
    dropId = 1006,
    dropType = 0,
    dataId = 616,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(111)->
    #dropCfg {
    dropId = 1006,
    dropType = 0,
    dataId = 2104,
    probability = 2500,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(112)->
    #dropCfg {
    dropId = 1006,
    dropType = 0,
    dataId = 222,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 5,
    max = 15,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(113)->
    #dropCfg {
    dropId = 1006,
    dropType = 0,
    dataId = 2022,
    probability = 5000,
    career = 0,
    sex = 0,
    min = 5,
    max = 5,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(114)->
    #dropCfg {
    dropId = 1006,
    dropType = 0,
    dataId = 382,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 3,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(115)->
    #dropCfg {
    dropId = 1006,
    dropType = 0,
    dataId = 4401,
    probability = 100,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 4401,
    level = 1,
    kind = 0
    };
getRow(116)->
    #dropCfg {
    dropId = 1006,
    dropType = 0,
    dataId = 4411,
    probability = 100,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 4411,
    level = 1,
    kind = 0
    };
getRow(117)->
    #dropCfg {
    dropId = 1006,
    dropType = 0,
    dataId = 4421,
    probability = 100,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 4421,
    level = 1,
    kind = 0
    };
getRow(118)->
    #dropCfg {
    dropId = 1006,
    dropType = 0,
    dataId = 4431,
    probability = 100,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 4431,
    level = 1,
    kind = 0
    };
getRow(119)->
    #dropCfg {
    dropId = 1006,
    dropType = 0,
    dataId = 4441,
    probability = 100,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 4441,
    level = 1,
    kind = 0
    };
getRow(120)->
    #dropCfg {
    dropId = 1006,
    dropType = 0,
    dataId = 3200,
    probability = 1000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 3200,
    level = 1,
    kind = 0
    };
getRow(121)->
    #dropCfg {
    dropId = 1007,
    dropType = 0,
    dataId = 7001,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 10,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(122)->
    #dropCfg {
    dropId = 1007,
    dropType = 0,
    dataId = 1112,
    probability = 1000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(123)->
    #dropCfg {
    dropId = 1007,
    dropType = 0,
    dataId = 7007,
    probability = 2500,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(124)->
    #dropCfg {
    dropId = 1007,
    dropType = 0,
    dataId = 616,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(125)->
    #dropCfg {
    dropId = 1007,
    dropType = 0,
    dataId = 2104,
    probability = 2500,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(126)->
    #dropCfg {
    dropId = 1007,
    dropType = 0,
    dataId = 222,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 5,
    max = 15,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(127)->
    #dropCfg {
    dropId = 1007,
    dropType = 0,
    dataId = 2022,
    probability = 5000,
    career = 0,
    sex = 0,
    min = 5,
    max = 5,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(128)->
    #dropCfg {
    dropId = 1007,
    dropType = 0,
    dataId = 382,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 3,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(129)->
    #dropCfg {
    dropId = 1007,
    dropType = 0,
    dataId = 4401,
    probability = 100,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 4401,
    level = 1,
    kind = 0
    };
getRow(130)->
    #dropCfg {
    dropId = 1007,
    dropType = 0,
    dataId = 4411,
    probability = 100,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 4411,
    level = 1,
    kind = 0
    };
getRow(131)->
    #dropCfg {
    dropId = 1007,
    dropType = 0,
    dataId = 4421,
    probability = 100,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 4421,
    level = 1,
    kind = 0
    };
getRow(132)->
    #dropCfg {
    dropId = 1007,
    dropType = 0,
    dataId = 4431,
    probability = 100,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 4431,
    level = 1,
    kind = 0
    };
getRow(133)->
    #dropCfg {
    dropId = 1007,
    dropType = 0,
    dataId = 4441,
    probability = 100,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 4441,
    level = 1,
    kind = 0
    };
getRow(134)->
    #dropCfg {
    dropId = 1007,
    dropType = 0,
    dataId = 3200,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 3200,
    level = 1,
    kind = 0
    };
getRow(135)->
    #dropCfg {
    dropId = 1008,
    dropType = 0,
    dataId = 7002,
    probability = 7000,
    career = 0,
    sex = 0,
    min = 1,
    max = 10,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(136)->
    #dropCfg {
    dropId = 1008,
    dropType = 0,
    dataId = 1112,
    probability = 1000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(137)->
    #dropCfg {
    dropId = 1008,
    dropType = 0,
    dataId = 7009,
    probability = 1000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(138)->
    #dropCfg {
    dropId = 1008,
    dropType = 0,
    dataId = 616,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(139)->
    #dropCfg {
    dropId = 1008,
    dropType = 0,
    dataId = 2104,
    probability = 2500,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(140)->
    #dropCfg {
    dropId = 1008,
    dropType = 0,
    dataId = 222,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 5,
    max = 15,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(141)->
    #dropCfg {
    dropId = 1008,
    dropType = 0,
    dataId = 2022,
    probability = 5000,
    career = 0,
    sex = 0,
    min = 5,
    max = 5,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(142)->
    #dropCfg {
    dropId = 1008,
    dropType = 0,
    dataId = 382,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 3,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(143)->
    #dropCfg {
    dropId = 1008,
    dropType = 0,
    dataId = 4401,
    probability = 100,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 4401,
    level = 1,
    kind = 0
    };
getRow(144)->
    #dropCfg {
    dropId = 1008,
    dropType = 0,
    dataId = 4411,
    probability = 100,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 4411,
    level = 1,
    kind = 0
    };
getRow(145)->
    #dropCfg {
    dropId = 1008,
    dropType = 0,
    dataId = 4421,
    probability = 100,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 4421,
    level = 1,
    kind = 0
    };
getRow(146)->
    #dropCfg {
    dropId = 1008,
    dropType = 0,
    dataId = 4431,
    probability = 100,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 4431,
    level = 1,
    kind = 0
    };
getRow(147)->
    #dropCfg {
    dropId = 1008,
    dropType = 0,
    dataId = 4441,
    probability = 100,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 4441,
    level = 1,
    kind = 0
    };
getRow(148)->
    #dropCfg {
    dropId = 1008,
    dropType = 0,
    dataId = 3200,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 3200,
    level = 1,
    kind = 0
    };
getRow(149)->
    #dropCfg {
    dropId = 1009,
    dropType = 0,
    dataId = 7002,
    probability = 7000,
    career = 0,
    sex = 0,
    min = 1,
    max = 10,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(150)->
    #dropCfg {
    dropId = 1009,
    dropType = 0,
    dataId = 1112,
    probability = 1000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(151)->
    #dropCfg {
    dropId = 1009,
    dropType = 0,
    dataId = 7009,
    probability = 2000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(152)->
    #dropCfg {
    dropId = 1009,
    dropType = 0,
    dataId = 616,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(153)->
    #dropCfg {
    dropId = 1009,
    dropType = 0,
    dataId = 2104,
    probability = 2500,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(154)->
    #dropCfg {
    dropId = 1009,
    dropType = 0,
    dataId = 222,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 5,
    max = 15,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(155)->
    #dropCfg {
    dropId = 1009,
    dropType = 0,
    dataId = 2022,
    probability = 5000,
    career = 0,
    sex = 0,
    min = 5,
    max = 5,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(156)->
    #dropCfg {
    dropId = 1009,
    dropType = 0,
    dataId = 382,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 3,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(157)->
    #dropCfg {
    dropId = 1009,
    dropType = 0,
    dataId = 4401,
    probability = 100,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 4401,
    level = 1,
    kind = 0
    };
getRow(158)->
    #dropCfg {
    dropId = 1009,
    dropType = 0,
    dataId = 4411,
    probability = 100,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 4411,
    level = 1,
    kind = 0
    };
getRow(159)->
    #dropCfg {
    dropId = 1009,
    dropType = 0,
    dataId = 4421,
    probability = 100,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 4421,
    level = 1,
    kind = 0
    };
getRow(160)->
    #dropCfg {
    dropId = 1009,
    dropType = 0,
    dataId = 4431,
    probability = 100,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 4431,
    level = 1,
    kind = 0
    };
getRow(161)->
    #dropCfg {
    dropId = 1009,
    dropType = 0,
    dataId = 4441,
    probability = 100,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 4441,
    level = 1,
    kind = 0
    };
getRow(162)->
    #dropCfg {
    dropId = 1009,
    dropType = 0,
    dataId = 3200,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 3200,
    level = 1,
    kind = 0
    };
getRow(163)->
    #dropCfg {
    dropId = 1010,
    dropType = 1,
    dataId = 11,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 3,
    max = 3,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(164)->
    #dropCfg {
    dropId = 1010,
    dropType = 1,
    dataId = 12,
    probability = 1000,
    career = 0,
    sex = 0,
    min = 3,
    max = 3,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(165)->
    #dropCfg {
    dropId = 1010,
    dropType = 0,
    dataId = 222,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 4,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(166)->
    #dropCfg {
    dropId = 1010,
    dropType = 0,
    dataId = 622,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 5,
    max = 10,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(167)->
    #dropCfg {
    dropId = 1010,
    dropType = 0,
    dataId = 2104,
    probability = 2500,
    career = 0,
    sex = 0,
    min = 3,
    max = 3,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(168)->
    #dropCfg {
    dropId = 1010,
    dropType = 0,
    dataId = 7004,
    probability = 8000,
    career = 0,
    sex = 0,
    min = 6,
    max = 15,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(169)->
    #dropCfg {
    dropId = 1010,
    dropType = 0,
    dataId = 2022,
    probability = 5000,
    career = 0,
    sex = 0,
    min = 3,
    max = 3,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(170)->
    #dropCfg {
    dropId = 1011,
    dropType = 1,
    dataId = 11,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 3,
    max = 3,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(171)->
    #dropCfg {
    dropId = 1011,
    dropType = 1,
    dataId = 12,
    probability = 1000,
    career = 0,
    sex = 0,
    min = 3,
    max = 3,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(172)->
    #dropCfg {
    dropId = 1011,
    dropType = 0,
    dataId = 222,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 4,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(173)->
    #dropCfg {
    dropId = 1011,
    dropType = 0,
    dataId = 622,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 5,
    max = 10,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(174)->
    #dropCfg {
    dropId = 1011,
    dropType = 0,
    dataId = 2104,
    probability = 2500,
    career = 0,
    sex = 0,
    min = 3,
    max = 3,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(175)->
    #dropCfg {
    dropId = 1011,
    dropType = 0,
    dataId = 7004,
    probability = 8000,
    career = 0,
    sex = 0,
    min = 6,
    max = 15,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(176)->
    #dropCfg {
    dropId = 1011,
    dropType = 0,
    dataId = 2022,
    probability = 5000,
    career = 0,
    sex = 0,
    min = 3,
    max = 3,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(177)->
    #dropCfg {
    dropId = 1012,
    dropType = 1,
    dataId = 11,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 2,
    max = 2,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(178)->
    #dropCfg {
    dropId = 1012,
    dropType = 1,
    dataId = 12,
    probability = 1000,
    career = 0,
    sex = 0,
    min = 2,
    max = 2,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(179)->
    #dropCfg {
    dropId = 1012,
    dropType = 0,
    dataId = 222,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 4,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(180)->
    #dropCfg {
    dropId = 1012,
    dropType = 0,
    dataId = 622,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 5,
    max = 10,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(181)->
    #dropCfg {
    dropId = 1012,
    dropType = 0,
    dataId = 2104,
    probability = 2500,
    career = 0,
    sex = 0,
    min = 2,
    max = 2,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(182)->
    #dropCfg {
    dropId = 1012,
    dropType = 0,
    dataId = 7021,
    probability = 5000,
    career = 0,
    sex = 0,
    min = 1,
    max = 5,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(183)->
    #dropCfg {
    dropId = 1012,
    dropType = 0,
    dataId = 2022,
    probability = 5000,
    career = 0,
    sex = 0,
    min = 2,
    max = 2,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(184)->
    #dropCfg {
    dropId = 1012,
    dropType = 0,
    dataId = 2213,
    probability = 300,
    career = 0,
    sex = 0,
    min = 2,
    max = 2,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(185)->
    #dropCfg {
    dropId = 1012,
    dropType = 0,
    dataId = 2215,
    probability = 300,
    career = 0,
    sex = 0,
    min = 2,
    max = 2,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(186)->
    #dropCfg {
    dropId = 1012,
    dropType = 0,
    dataId = 4400,
    probability = 100,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 4400,
    level = 1,
    kind = 0
    };
getRow(187)->
    #dropCfg {
    dropId = 1012,
    dropType = 0,
    dataId = 4410,
    probability = 100,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 4410,
    level = 1,
    kind = 0
    };
getRow(188)->
    #dropCfg {
    dropId = 1012,
    dropType = 0,
    dataId = 4420,
    probability = 100,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 4420,
    level = 1,
    kind = 0
    };
getRow(189)->
    #dropCfg {
    dropId = 1012,
    dropType = 0,
    dataId = 4430,
    probability = 100,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 4430,
    level = 1,
    kind = 0
    };
getRow(190)->
    #dropCfg {
    dropId = 1012,
    dropType = 0,
    dataId = 4440,
    probability = 100,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 4440,
    level = 1,
    kind = 0
    };
getRow(191)->
    #dropCfg {
    dropId = 1012,
    dropType = 0,
    dataId = 3200,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 3200,
    level = 1,
    kind = 0
    };
getRow(192)->
    #dropCfg {
    dropId = 1013,
    dropType = 1,
    dataId = 11,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 2,
    max = 2,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(193)->
    #dropCfg {
    dropId = 1013,
    dropType = 1,
    dataId = 12,
    probability = 1000,
    career = 0,
    sex = 0,
    min = 2,
    max = 2,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(194)->
    #dropCfg {
    dropId = 1013,
    dropType = 0,
    dataId = 222,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 4,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(195)->
    #dropCfg {
    dropId = 1013,
    dropType = 0,
    dataId = 622,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 5,
    max = 10,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(196)->
    #dropCfg {
    dropId = 1013,
    dropType = 0,
    dataId = 2104,
    probability = 2500,
    career = 0,
    sex = 0,
    min = 2,
    max = 2,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(197)->
    #dropCfg {
    dropId = 1013,
    dropType = 0,
    dataId = 7021,
    probability = 5000,
    career = 0,
    sex = 0,
    min = 1,
    max = 5,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(198)->
    #dropCfg {
    dropId = 1013,
    dropType = 0,
    dataId = 2022,
    probability = 5000,
    career = 0,
    sex = 0,
    min = 2,
    max = 2,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(199)->
    #dropCfg {
    dropId = 1013,
    dropType = 0,
    dataId = 2213,
    probability = 300,
    career = 0,
    sex = 0,
    min = 2,
    max = 2,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(200)->
    #dropCfg {
    dropId = 1013,
    dropType = 0,
    dataId = 2215,
    probability = 300,
    career = 0,
    sex = 0,
    min = 2,
    max = 2,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(201)->
    #dropCfg {
    dropId = 1013,
    dropType = 0,
    dataId = 4400,
    probability = 100,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 4400,
    level = 1,
    kind = 0
    };
getRow(202)->
    #dropCfg {
    dropId = 1013,
    dropType = 0,
    dataId = 4410,
    probability = 100,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 4410,
    level = 1,
    kind = 0
    };
getRow(203)->
    #dropCfg {
    dropId = 1013,
    dropType = 0,
    dataId = 4420,
    probability = 100,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 4420,
    level = 1,
    kind = 0
    };
getRow(204)->
    #dropCfg {
    dropId = 1013,
    dropType = 0,
    dataId = 4430,
    probability = 100,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 4430,
    level = 1,
    kind = 0
    };
getRow(205)->
    #dropCfg {
    dropId = 1013,
    dropType = 0,
    dataId = 4440,
    probability = 100,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 4440,
    level = 1,
    kind = 0
    };
getRow(206)->
    #dropCfg {
    dropId = 1013,
    dropType = 0,
    dataId = 3200,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 3200,
    level = 1,
    kind = 0
    };
getRow(207)->
    #dropCfg {
    dropId = 1014,
    dropType = 1,
    dataId = 11,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 2,
    max = 2,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(208)->
    #dropCfg {
    dropId = 1014,
    dropType = 1,
    dataId = 12,
    probability = 1000,
    career = 0,
    sex = 0,
    min = 2,
    max = 2,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(209)->
    #dropCfg {
    dropId = 1014,
    dropType = 0,
    dataId = 222,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 4,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(210)->
    #dropCfg {
    dropId = 1014,
    dropType = 0,
    dataId = 622,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 5,
    max = 10,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(211)->
    #dropCfg {
    dropId = 1014,
    dropType = 0,
    dataId = 2104,
    probability = 2500,
    career = 0,
    sex = 0,
    min = 2,
    max = 2,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(212)->
    #dropCfg {
    dropId = 1014,
    dropType = 0,
    dataId = 7023,
    probability = 5000,
    career = 0,
    sex = 0,
    min = 1,
    max = 5,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(213)->
    #dropCfg {
    dropId = 1014,
    dropType = 0,
    dataId = 2022,
    probability = 5000,
    career = 0,
    sex = 0,
    min = 2,
    max = 2,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(214)->
    #dropCfg {
    dropId = 1014,
    dropType = 0,
    dataId = 2213,
    probability = 300,
    career = 0,
    sex = 0,
    min = 2,
    max = 2,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(215)->
    #dropCfg {
    dropId = 1014,
    dropType = 0,
    dataId = 2215,
    probability = 300,
    career = 0,
    sex = 0,
    min = 2,
    max = 2,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(216)->
    #dropCfg {
    dropId = 1014,
    dropType = 0,
    dataId = 4400,
    probability = 100,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 4400,
    level = 1,
    kind = 0
    };
getRow(217)->
    #dropCfg {
    dropId = 1014,
    dropType = 0,
    dataId = 4410,
    probability = 100,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 4410,
    level = 1,
    kind = 0
    };
getRow(218)->
    #dropCfg {
    dropId = 1014,
    dropType = 0,
    dataId = 4420,
    probability = 100,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 4420,
    level = 1,
    kind = 0
    };
getRow(219)->
    #dropCfg {
    dropId = 1014,
    dropType = 0,
    dataId = 4430,
    probability = 100,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 4430,
    level = 1,
    kind = 0
    };
getRow(220)->
    #dropCfg {
    dropId = 1014,
    dropType = 0,
    dataId = 4440,
    probability = 100,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 4440,
    level = 1,
    kind = 0
    };
getRow(221)->
    #dropCfg {
    dropId = 1014,
    dropType = 0,
    dataId = 3200,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 3200,
    level = 1,
    kind = 0
    };
getRow(222)->
    #dropCfg {
    dropId = 1015,
    dropType = 0,
    dataId = 7022,
    probability = 7000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(223)->
    #dropCfg {
    dropId = 1015,
    dropType = 0,
    dataId = 1112,
    probability = 1000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(224)->
    #dropCfg {
    dropId = 1015,
    dropType = 0,
    dataId = 7022,
    probability = 2500,
    career = 0,
    sex = 0,
    min = 1,
    max = 2,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(225)->
    #dropCfg {
    dropId = 1015,
    dropType = 0,
    dataId = 616,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(226)->
    #dropCfg {
    dropId = 1015,
    dropType = 0,
    dataId = 2104,
    probability = 2500,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(227)->
    #dropCfg {
    dropId = 1015,
    dropType = 0,
    dataId = 222,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 10,
    max = 20,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(228)->
    #dropCfg {
    dropId = 1015,
    dropType = 0,
    dataId = 2022,
    probability = 5000,
    career = 0,
    sex = 0,
    min = 5,
    max = 5,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(229)->
    #dropCfg {
    dropId = 1015,
    dropType = 0,
    dataId = 382,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 3,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(230)->
    #dropCfg {
    dropId = 1015,
    dropType = 0,
    dataId = 4401,
    probability = 100,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 4401,
    level = 1,
    kind = 0
    };
getRow(231)->
    #dropCfg {
    dropId = 1015,
    dropType = 0,
    dataId = 4411,
    probability = 100,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 4411,
    level = 1,
    kind = 0
    };
getRow(232)->
    #dropCfg {
    dropId = 1015,
    dropType = 0,
    dataId = 4421,
    probability = 100,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 4421,
    level = 1,
    kind = 0
    };
getRow(233)->
    #dropCfg {
    dropId = 1015,
    dropType = 0,
    dataId = 4431,
    probability = 100,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 4431,
    level = 1,
    kind = 0
    };
getRow(234)->
    #dropCfg {
    dropId = 1015,
    dropType = 0,
    dataId = 4441,
    probability = 100,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 4441,
    level = 1,
    kind = 0
    };
getRow(235)->
    #dropCfg {
    dropId = 1015,
    dropType = 0,
    dataId = 3200,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 3200,
    level = 1,
    kind = 0
    };
getRow(236)->
    #dropCfg {
    dropId = 1016,
    dropType = 0,
    dataId = 7022,
    probability = 7000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(237)->
    #dropCfg {
    dropId = 1016,
    dropType = 0,
    dataId = 1112,
    probability = 1000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(238)->
    #dropCfg {
    dropId = 1016,
    dropType = 0,
    dataId = 7022,
    probability = 2500,
    career = 0,
    sex = 0,
    min = 1,
    max = 2,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(239)->
    #dropCfg {
    dropId = 1016,
    dropType = 0,
    dataId = 616,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(240)->
    #dropCfg {
    dropId = 1016,
    dropType = 0,
    dataId = 2104,
    probability = 2500,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(241)->
    #dropCfg {
    dropId = 1016,
    dropType = 0,
    dataId = 222,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 10,
    max = 20,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(242)->
    #dropCfg {
    dropId = 1016,
    dropType = 0,
    dataId = 2022,
    probability = 5000,
    career = 0,
    sex = 0,
    min = 5,
    max = 5,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(243)->
    #dropCfg {
    dropId = 1016,
    dropType = 0,
    dataId = 382,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 3,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(244)->
    #dropCfg {
    dropId = 1016,
    dropType = 0,
    dataId = 4401,
    probability = 100,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 4401,
    level = 1,
    kind = 0
    };
getRow(245)->
    #dropCfg {
    dropId = 1016,
    dropType = 0,
    dataId = 4411,
    probability = 100,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 4411,
    level = 1,
    kind = 0
    };
getRow(246)->
    #dropCfg {
    dropId = 1016,
    dropType = 0,
    dataId = 4421,
    probability = 100,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 4421,
    level = 1,
    kind = 0
    };
getRow(247)->
    #dropCfg {
    dropId = 1016,
    dropType = 0,
    dataId = 4431,
    probability = 100,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 4431,
    level = 1,
    kind = 0
    };
getRow(248)->
    #dropCfg {
    dropId = 1016,
    dropType = 0,
    dataId = 4441,
    probability = 100,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 4441,
    level = 1,
    kind = 0
    };
getRow(249)->
    #dropCfg {
    dropId = 1016,
    dropType = 0,
    dataId = 3200,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 3200,
    level = 1,
    kind = 0
    };
getRow(250)->
    #dropCfg {
    dropId = 1017,
    dropType = 0,
    dataId = 7024,
    probability = 7000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(251)->
    #dropCfg {
    dropId = 1017,
    dropType = 0,
    dataId = 1112,
    probability = 1000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(252)->
    #dropCfg {
    dropId = 1017,
    dropType = 0,
    dataId = 7024,
    probability = 5000,
    career = 0,
    sex = 0,
    min = 1,
    max = 2,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(253)->
    #dropCfg {
    dropId = 1017,
    dropType = 0,
    dataId = 616,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(254)->
    #dropCfg {
    dropId = 1017,
    dropType = 0,
    dataId = 2104,
    probability = 2500,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(255)->
    #dropCfg {
    dropId = 1017,
    dropType = 0,
    dataId = 222,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 10,
    max = 20,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(256)->
    #dropCfg {
    dropId = 1017,
    dropType = 0,
    dataId = 2022,
    probability = 5000,
    career = 0,
    sex = 0,
    min = 5,
    max = 5,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(257)->
    #dropCfg {
    dropId = 1017,
    dropType = 0,
    dataId = 382,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 3,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(258)->
    #dropCfg {
    dropId = 1017,
    dropType = 0,
    dataId = 7025,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 3,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(259)->
    #dropCfg {
    dropId = 1017,
    dropType = 0,
    dataId = 7026,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(260)->
    #dropCfg {
    dropId = 1017,
    dropType = 0,
    dataId = 4401,
    probability = 100,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 4401,
    level = 1,
    kind = 0
    };
getRow(261)->
    #dropCfg {
    dropId = 1017,
    dropType = 0,
    dataId = 4411,
    probability = 100,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 4411,
    level = 1,
    kind = 0
    };
getRow(262)->
    #dropCfg {
    dropId = 1017,
    dropType = 0,
    dataId = 4421,
    probability = 100,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 4421,
    level = 1,
    kind = 0
    };
getRow(263)->
    #dropCfg {
    dropId = 1017,
    dropType = 0,
    dataId = 4431,
    probability = 100,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 4431,
    level = 1,
    kind = 0
    };
getRow(264)->
    #dropCfg {
    dropId = 1017,
    dropType = 0,
    dataId = 4441,
    probability = 100,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 4441,
    level = 1,
    kind = 0
    };
getRow(265)->
    #dropCfg {
    dropId = 1017,
    dropType = 0,
    dataId = 3200,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 3200,
    level = 1,
    kind = 0
    };
getRow(266)->
    #dropCfg {
    dropId = 1020,
    dropType = 1,
    dataId = 11,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 2,
    max = 2,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(267)->
    #dropCfg {
    dropId = 1020,
    dropType = 1,
    dataId = 12,
    probability = 1000,
    career = 0,
    sex = 0,
    min = 2,
    max = 2,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(268)->
    #dropCfg {
    dropId = 1020,
    dropType = 0,
    dataId = 222,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 5,
    max = 10,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(269)->
    #dropCfg {
    dropId = 1020,
    dropType = 0,
    dataId = 622,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 5,
    max = 10,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(270)->
    #dropCfg {
    dropId = 1020,
    dropType = 0,
    dataId = 2104,
    probability = 2500,
    career = 0,
    sex = 0,
    min = 2,
    max = 2,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(271)->
    #dropCfg {
    dropId = 1020,
    dropType = 0,
    dataId = 7026,
    probability = 5000,
    career = 0,
    sex = 0,
    min = 2,
    max = 5,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(272)->
    #dropCfg {
    dropId = 1020,
    dropType = 0,
    dataId = 2022,
    probability = 5000,
    career = 0,
    sex = 0,
    min = 2,
    max = 2,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(273)->
    #dropCfg {
    dropId = 1020,
    dropType = 0,
    dataId = 2213,
    probability = 300,
    career = 0,
    sex = 0,
    min = 2,
    max = 2,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(274)->
    #dropCfg {
    dropId = 1020,
    dropType = 0,
    dataId = 2215,
    probability = 300,
    career = 0,
    sex = 0,
    min = 2,
    max = 2,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(275)->
    #dropCfg {
    dropId = 1020,
    dropType = 0,
    dataId = 4400,
    probability = 100,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 4400,
    level = 1,
    kind = 0
    };
getRow(276)->
    #dropCfg {
    dropId = 1020,
    dropType = 0,
    dataId = 4410,
    probability = 100,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 4410,
    level = 1,
    kind = 0
    };
getRow(277)->
    #dropCfg {
    dropId = 1020,
    dropType = 0,
    dataId = 4420,
    probability = 100,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 4420,
    level = 1,
    kind = 0
    };
getRow(278)->
    #dropCfg {
    dropId = 1020,
    dropType = 0,
    dataId = 4430,
    probability = 100,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 4430,
    level = 1,
    kind = 0
    };
getRow(279)->
    #dropCfg {
    dropId = 1020,
    dropType = 0,
    dataId = 4440,
    probability = 100,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 4440,
    level = 1,
    kind = 0
    };
getRow(280)->
    #dropCfg {
    dropId = 1020,
    dropType = 0,
    dataId = 3200,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 3200,
    level = 1,
    kind = 0
    };
getRow(281)->
    #dropCfg {
    dropId = 1021,
    dropType = 0,
    dataId = 3200,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 3200,
    level = 1,
    kind = 0
    };
getRow(282)->
    #dropCfg {
    dropId = 1021,
    dropType = 0,
    dataId = 7026,
    probability = 7000,
    career = 0,
    sex = 0,
    min = 1,
    max = 3,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(283)->
    #dropCfg {
    dropId = 1021,
    dropType = 0,
    dataId = 1112,
    probability = 1000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(284)->
    #dropCfg {
    dropId = 1021,
    dropType = 0,
    dataId = 7027,
    probability = 5000,
    career = 0,
    sex = 0,
    min = 1,
    max = 3,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(285)->
    #dropCfg {
    dropId = 1021,
    dropType = 0,
    dataId = 616,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(286)->
    #dropCfg {
    dropId = 1021,
    dropType = 0,
    dataId = 2104,
    probability = 2500,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(287)->
    #dropCfg {
    dropId = 1021,
    dropType = 0,
    dataId = 222,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 15,
    max = 25,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(288)->
    #dropCfg {
    dropId = 1021,
    dropType = 0,
    dataId = 2022,
    probability = 5000,
    career = 0,
    sex = 0,
    min = 5,
    max = 5,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(289)->
    #dropCfg {
    dropId = 1021,
    dropType = 0,
    dataId = 382,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 3,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(290)->
    #dropCfg {
    dropId = 1021,
    dropType = 0,
    dataId = 7028,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 3,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(291)->
    #dropCfg {
    dropId = 1021,
    dropType = 0,
    dataId = 4401,
    probability = 100,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 4400,
    level = 1,
    kind = 0
    };
getRow(292)->
    #dropCfg {
    dropId = 1021,
    dropType = 0,
    dataId = 4411,
    probability = 100,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 4410,
    level = 1,
    kind = 0
    };
getRow(293)->
    #dropCfg {
    dropId = 1021,
    dropType = 0,
    dataId = 4421,
    probability = 100,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 4420,
    level = 1,
    kind = 0
    };
getRow(294)->
    #dropCfg {
    dropId = 1021,
    dropType = 0,
    dataId = 4431,
    probability = 100,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 4430,
    level = 1,
    kind = 0
    };
getRow(295)->
    #dropCfg {
    dropId = 1021,
    dropType = 0,
    dataId = 4441,
    probability = 100,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 4440,
    level = 1,
    kind = 0
    };
getRow(296)->
    #dropCfg {
    dropId = 1301,
    dropType = 0,
    dataId = 902,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(297)->
    #dropCfg {
    dropId = 1301,
    dropType = 0,
    dataId = 1132,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 5,
    max = 5,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(298)->
    #dropCfg {
    dropId = 1301,
    dropType = 0,
    dataId = 2104,
    probability = 1000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(299)->
    #dropCfg {
    dropId = 1302,
    dropType = 0,
    dataId = 902,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 3,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(300)->
    #dropCfg {
    dropId = 1302,
    dropType = 0,
    dataId = 1132,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 5,
    max = 5,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(301)->
    #dropCfg {
    dropId = 1302,
    dropType = 0,
    dataId = 2104,
    probability = 3000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(302)->
    #dropCfg {
    dropId = 1303,
    dropType = 0,
    dataId = 902,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 5,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(303)->
    #dropCfg {
    dropId = 1303,
    dropType = 0,
    dataId = 1132,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 5,
    max = 5,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(304)->
    #dropCfg {
    dropId = 1303,
    dropType = 0,
    dataId = 2104,
    probability = 4000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(305)->
    #dropCfg {
    dropId = 1303,
    dropType = 0,
    dataId = 1911,
    probability = 5000,
    career = 0,
    sex = 0,
    min = 1,
    max = 3,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(306)->
    #dropCfg {
    dropId = 1304,
    dropType = 0,
    dataId = 903,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(307)->
    #dropCfg {
    dropId = 1304,
    dropType = 0,
    dataId = 1132,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 5,
    max = 5,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(308)->
    #dropCfg {
    dropId = 1304,
    dropType = 0,
    dataId = 2104,
    probability = 6000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(309)->
    #dropCfg {
    dropId = 1304,
    dropType = 0,
    dataId = 1921,
    probability = 5000,
    career = 0,
    sex = 0,
    min = 1,
    max = 3,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(310)->
    #dropCfg {
    dropId = 1305,
    dropType = 0,
    dataId = 903,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(311)->
    #dropCfg {
    dropId = 1305,
    dropType = 0,
    dataId = 1134,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(312)->
    #dropCfg {
    dropId = 1305,
    dropType = 0,
    dataId = 2104,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(313)->
    #dropCfg {
    dropId = 1305,
    dropType = 0,
    dataId = 1913,
    probability = 3000,
    career = 0,
    sex = 0,
    min = 1,
    max = 5,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(314)->
    #dropCfg {
    dropId = 1426,
    dropType = 0,
    dataId = 225,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 100,
    max = 100,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(315)->
    #dropCfg {
    dropId = 1426,
    dropType = 0,
    dataId = 616,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 10,
    max = 10,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(316)->
    #dropCfg {
    dropId = 1427,
    dropType = 0,
    dataId = 225,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 50,
    max = 50,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(317)->
    #dropCfg {
    dropId = 1427,
    dropType = 0,
    dataId = 616,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 5,
    max = 5,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(318)->
    #dropCfg {
    dropId = 1428,
    dropType = 0,
    dataId = 225,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 40,
    max = 40,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(319)->
    #dropCfg {
    dropId = 1428,
    dropType = 0,
    dataId = 616,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 4,
    max = 4,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(320)->
    #dropCfg {
    dropId = 1429,
    dropType = 0,
    dataId = 225,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 30,
    max = 30,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(321)->
    #dropCfg {
    dropId = 1429,
    dropType = 0,
    dataId = 616,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 3,
    max = 3,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(322)->
    #dropCfg {
    dropId = 1430,
    dropType = 0,
    dataId = 225,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 20,
    max = 20,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(323)->
    #dropCfg {
    dropId = 1430,
    dropType = 0,
    dataId = 616,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 2,
    max = 2,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(324)->
    #dropCfg {
    dropId = 1431,
    dropType = 0,
    dataId = 225,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 10,
    max = 10,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(325)->
    #dropCfg {
    dropId = 1431,
    dropType = 0,
    dataId = 616,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(326)->
    #dropCfg {
    dropId = 1901,
    dropType = 2,
    dataId = 11,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 10,
    max = 16,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(327)->
    #dropCfg {
    dropId = 1902,
    dropType = 2,
    dataId = 11,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 24,
    max = 30,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(328)->
    #dropCfg {
    dropId = 1903,
    dropType = 2,
    dataId = 11,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 40,
    max = 50,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(329)->
    #dropCfg {
    dropId = 1904,
    dropType = 2,
    dataId = 11,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 60,
    max = 70,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(330)->
    #dropCfg {
    dropId = 1905,
    dropType = 2,
    dataId = 11,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 160,
    max = 320,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(331)->
    #dropCfg {
    dropId = 1915,
    dropType = 0,
    dataId = 7001,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 100,
    max = 100,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(332)->
    #dropCfg {
    dropId = 1915,
    dropType = 1,
    dataId = 283002,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 2,
    max = 2,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(333)->
    #dropCfg {
    dropId = 1915,
    dropType = 0,
    dataId = 270,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 12,
    max = 12,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(334)->
    #dropCfg {
    dropId = 1915,
    dropType = 0,
    dataId = 1801,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 15,
    max = 15,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(335)->
    #dropCfg {
    dropId = 1916,
    dropType = 0,
    dataId = 7002,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 150,
    max = 150,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(336)->
    #dropCfg {
    dropId = 1916,
    dropType = 1,
    dataId = 283003,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 2,
    max = 2,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(337)->
    #dropCfg {
    dropId = 1916,
    dropType = 0,
    dataId = 271,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 8,
    max = 8,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(338)->
    #dropCfg {
    dropId = 1916,
    dropType = 0,
    dataId = 1801,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 20,
    max = 20,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(339)->
    #dropCfg {
    dropId = 1917,
    dropType = 0,
    dataId = 7003,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 200,
    max = 200,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(340)->
    #dropCfg {
    dropId = 1917,
    dropType = 1,
    dataId = 283004,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 2,
    max = 2,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(341)->
    #dropCfg {
    dropId = 1917,
    dropType = 0,
    dataId = 271,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 10,
    max = 10,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(342)->
    #dropCfg {
    dropId = 1917,
    dropType = 0,
    dataId = 1801,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 25,
    max = 25,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(343)->
    #dropCfg {
    dropId = 1918,
    dropType = 0,
    dataId = 7004,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 250,
    max = 250,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(344)->
    #dropCfg {
    dropId = 1918,
    dropType = 1,
    dataId = 283005,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 2,
    max = 2,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(345)->
    #dropCfg {
    dropId = 1918,
    dropType = 0,
    dataId = 272,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 8,
    max = 8,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(346)->
    #dropCfg {
    dropId = 1918,
    dropType = 0,
    dataId = 1801,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 30,
    max = 30,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(347)->
    #dropCfg {
    dropId = 1919,
    dropType = 0,
    dataId = 7006,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 300,
    max = 300,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(348)->
    #dropCfg {
    dropId = 1919,
    dropType = 1,
    dataId = 283006,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 2,
    max = 2,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(349)->
    #dropCfg {
    dropId = 1919,
    dropType = 0,
    dataId = 272,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 10,
    max = 10,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(350)->
    #dropCfg {
    dropId = 1919,
    dropType = 0,
    dataId = 1801,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 35,
    max = 35,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(351)->
    #dropCfg {
    dropId = 1920,
    dropType = 2,
    dataId = 1,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 70000,
    max = 70000,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(352)->
    #dropCfg {
    dropId = 1920,
    dropType = 0,
    dataId = 7002,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 40,
    max = 40,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(353)->
    #dropCfg {
    dropId = 1920,
    dropType = 0,
    dataId = 9104,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 3,
    max = 3,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(354)->
    #dropCfg {
    dropId = 1921,
    dropType = 2,
    dataId = 1,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 80000,
    max = 80000,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(355)->
    #dropCfg {
    dropId = 1921,
    dropType = 0,
    dataId = 7003,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 35,
    max = 35,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(356)->
    #dropCfg {
    dropId = 1921,
    dropType = 0,
    dataId = 9105,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 2,
    max = 2,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(357)->
    #dropCfg {
    dropId = 1922,
    dropType = 2,
    dataId = 1,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 90000,
    max = 90000,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(358)->
    #dropCfg {
    dropId = 1922,
    dropType = 0,
    dataId = 7003,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 30,
    max = 30,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(359)->
    #dropCfg {
    dropId = 1922,
    dropType = 0,
    dataId = 9105,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 3,
    max = 3,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(360)->
    #dropCfg {
    dropId = 1924,
    dropType = 0,
    dataId = 271,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 10,
    max = 10,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(361)->
    #dropCfg {
    dropId = 1924,
    dropType = 0,
    dataId = 1801,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 20,
    max = 20,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(362)->
    #dropCfg {
    dropId = 1925,
    dropType = 0,
    dataId = 271,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 9,
    max = 9,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(363)->
    #dropCfg {
    dropId = 1925,
    dropType = 0,
    dataId = 1801,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 18,
    max = 18,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(364)->
    #dropCfg {
    dropId = 1926,
    dropType = 0,
    dataId = 271,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 8,
    max = 8,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(365)->
    #dropCfg {
    dropId = 1926,
    dropType = 0,
    dataId = 1801,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 16,
    max = 16,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(366)->
    #dropCfg {
    dropId = 1927,
    dropType = 0,
    dataId = 271,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 7,
    max = 7,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(367)->
    #dropCfg {
    dropId = 1927,
    dropType = 0,
    dataId = 1801,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 14,
    max = 14,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(368)->
    #dropCfg {
    dropId = 1928,
    dropType = 0,
    dataId = 271,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 6,
    max = 6,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(369)->
    #dropCfg {
    dropId = 1928,
    dropType = 0,
    dataId = 1801,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 12,
    max = 12,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(370)->
    #dropCfg {
    dropId = 1929,
    dropType = 0,
    dataId = 271,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 5,
    max = 5,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(371)->
    #dropCfg {
    dropId = 1929,
    dropType = 0,
    dataId = 1801,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 10,
    max = 10,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(372)->
    #dropCfg {
    dropId = 1930,
    dropType = 0,
    dataId = 271,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 5,
    max = 5,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(373)->
    #dropCfg {
    dropId = 1930,
    dropType = 0,
    dataId = 1801,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 10,
    max = 10,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(374)->
    #dropCfg {
    dropId = 1931,
    dropType = 0,
    dataId = 271,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 4,
    max = 4,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(375)->
    #dropCfg {
    dropId = 1931,
    dropType = 0,
    dataId = 1801,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 8,
    max = 8,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(376)->
    #dropCfg {
    dropId = 1932,
    dropType = 0,
    dataId = 271,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 4,
    max = 4,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(377)->
    #dropCfg {
    dropId = 1932,
    dropType = 0,
    dataId = 1801,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 8,
    max = 8,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(378)->
    #dropCfg {
    dropId = 1933,
    dropType = 0,
    dataId = 271,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 4,
    max = 4,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(379)->
    #dropCfg {
    dropId = 1933,
    dropType = 0,
    dataId = 1801,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 7,
    max = 7,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(380)->
    #dropCfg {
    dropId = 1934,
    dropType = 0,
    dataId = 271,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 3,
    max = 3,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(381)->
    #dropCfg {
    dropId = 1934,
    dropType = 0,
    dataId = 1801,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 5,
    max = 5,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(382)->
    #dropCfg {
    dropId = 2000,
    dropType = 2,
    dataId = 1,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 10000,
    max = 10000,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(383)->
    #dropCfg {
    dropId = 2000,
    dropType = 0,
    dataId = 1801,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 8,
    max = 8,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(384)->
    #dropCfg {
    dropId = 2001,
    dropType = 2,
    dataId = 1,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 10000,
    max = 10000,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(385)->
    #dropCfg {
    dropId = 2001,
    dropType = 0,
    dataId = 1801,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 8,
    max = 8,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(386)->
    #dropCfg {
    dropId = 2002,
    dropType = 2,
    dataId = 1,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 10000,
    max = 10000,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(387)->
    #dropCfg {
    dropId = 2002,
    dropType = 0,
    dataId = 1801,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 8,
    max = 8,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(388)->
    #dropCfg {
    dropId = 2003,
    dropType = 2,
    dataId = 1,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 10000,
    max = 10000,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(389)->
    #dropCfg {
    dropId = 2003,
    dropType = 0,
    dataId = 1801,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 8,
    max = 8,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(390)->
    #dropCfg {
    dropId = 2800,
    dropType = 1,
    dataId = 2800,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 4,
    max = 4,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(391)->
    #dropCfg {
    dropId = 2800,
    dropType = 1,
    dataId = 2900,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(392)->
    #dropCfg {
    dropId = 2801,
    dropType = 1,
    dataId = 2801,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 4,
    max = 4,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(393)->
    #dropCfg {
    dropId = 2801,
    dropType = 1,
    dataId = 2901,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(394)->
    #dropCfg {
    dropId = 2802,
    dropType = 1,
    dataId = 2802,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 4,
    max = 4,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(395)->
    #dropCfg {
    dropId = 2802,
    dropType = 1,
    dataId = 2902,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(396)->
    #dropCfg {
    dropId = 2803,
    dropType = 1,
    dataId = 2803,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 4,
    max = 4,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(397)->
    #dropCfg {
    dropId = 2803,
    dropType = 1,
    dataId = 2903,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(398)->
    #dropCfg {
    dropId = 2804,
    dropType = 1,
    dataId = 2804,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 4,
    max = 4,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(399)->
    #dropCfg {
    dropId = 2804,
    dropType = 1,
    dataId = 2904,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(400)->
    #dropCfg {
    dropId = 2805,
    dropType = 1,
    dataId = 2805,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 4,
    max = 4,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(401)->
    #dropCfg {
    dropId = 2805,
    dropType = 1,
    dataId = 2905,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(402)->
    #dropCfg {
    dropId = 2806,
    dropType = 1,
    dataId = 2806,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 4,
    max = 4,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(403)->
    #dropCfg {
    dropId = 2806,
    dropType = 1,
    dataId = 2906,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(404)->
    #dropCfg {
    dropId = 2807,
    dropType = 1,
    dataId = 2807,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 4,
    max = 4,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(405)->
    #dropCfg {
    dropId = 2807,
    dropType = 1,
    dataId = 2907,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(406)->
    #dropCfg {
    dropId = 2808,
    dropType = 1,
    dataId = 2808,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 4,
    max = 4,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(407)->
    #dropCfg {
    dropId = 2808,
    dropType = 1,
    dataId = 2908,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(408)->
    #dropCfg {
    dropId = 3000,
    dropType = 1,
    dataId = 3000,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 2,
    max = 2,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(409)->
    #dropCfg {
    dropId = 3000,
    dropType = 1,
    dataId = 3100,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(410)->
    #dropCfg {
    dropId = 3001,
    dropType = 1,
    dataId = 3001,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 2,
    max = 2,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(411)->
    #dropCfg {
    dropId = 3001,
    dropType = 1,
    dataId = 3101,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(412)->
    #dropCfg {
    dropId = 3002,
    dropType = 1,
    dataId = 3002,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 2,
    max = 2,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(413)->
    #dropCfg {
    dropId = 3002,
    dropType = 1,
    dataId = 3102,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(414)->
    #dropCfg {
    dropId = 3003,
    dropType = 1,
    dataId = 3003,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 2,
    max = 2,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(415)->
    #dropCfg {
    dropId = 3003,
    dropType = 1,
    dataId = 3103,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(416)->
    #dropCfg {
    dropId = 3004,
    dropType = 1,
    dataId = 3004,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 2,
    max = 2,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(417)->
    #dropCfg {
    dropId = 3004,
    dropType = 1,
    dataId = 3104,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(418)->
    #dropCfg {
    dropId = 3005,
    dropType = 1,
    dataId = 3005,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 2,
    max = 2,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(419)->
    #dropCfg {
    dropId = 3005,
    dropType = 1,
    dataId = 3105,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(420)->
    #dropCfg {
    dropId = 3006,
    dropType = 1,
    dataId = 3006,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 2,
    max = 2,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(421)->
    #dropCfg {
    dropId = 3006,
    dropType = 1,
    dataId = 3106,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(422)->
    #dropCfg {
    dropId = 3007,
    dropType = 1,
    dataId = 3007,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 2,
    max = 2,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(423)->
    #dropCfg {
    dropId = 3007,
    dropType = 1,
    dataId = 3107,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(424)->
    #dropCfg {
    dropId = 3008,
    dropType = 1,
    dataId = 3008,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 2,
    max = 2,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(425)->
    #dropCfg {
    dropId = 3008,
    dropType = 1,
    dataId = 3108,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(426)->
    #dropCfg {
    dropId = 3500,
    dropType = 1,
    dataId = 35000,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(427)->
    #dropCfg {
    dropId = 3501,
    dropType = 1,
    dataId = 35010,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(428)->
    #dropCfg {
    dropId = 3502,
    dropType = 1,
    dataId = 35020,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(429)->
    #dropCfg {
    dropId = 4000,
    dropType = 0,
    dataId = 26206,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(430)->
    #dropCfg {
    dropId = 4000,
    dropType = 0,
    dataId = 26207,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(431)->
    #dropCfg {
    dropId = 4000,
    dropType = 0,
    dataId = 26208,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(432)->
    #dropCfg {
    dropId = 4001,
    dropType = 0,
    dataId = 26206,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(433)->
    #dropCfg {
    dropId = 4001,
    dropType = 0,
    dataId = 26207,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(434)->
    #dropCfg {
    dropId = 4001,
    dropType = 0,
    dataId = 26208,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(435)->
    #dropCfg {
    dropId = 4001,
    dropType = 0,
    dataId = 14051,
    probability = 10000,
    career = 0,
    sex = 1,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(436)->
    #dropCfg {
    dropId = 4001,
    dropType = 0,
    dataId = 14052,
    probability = 10000,
    career = 0,
    sex = 2,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(437)->
    #dropCfg {
    dropId = 4001,
    dropType = 0,
    dataId = 14053,
    probability = 10000,
    career = 0,
    sex = 1,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(438)->
    #dropCfg {
    dropId = 4001,
    dropType = 0,
    dataId = 14054,
    probability = 10000,
    career = 0,
    sex = 2,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(439)->
    #dropCfg {
    dropId = 4001,
    dropType = 0,
    dataId = 14055,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(440)->
    #dropCfg {
    dropId = 4002,
    dropType = 0,
    dataId = 14166,
    probability = 10000,
    career = 0,
    sex = 1,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(441)->
    #dropCfg {
    dropId = 4002,
    dropType = 0,
    dataId = 14167,
    probability = 10000,
    career = 0,
    sex = 2,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(442)->
    #dropCfg {
    dropId = 4003,
    dropType = 0,
    dataId = 14168,
    probability = 10000,
    career = 0,
    sex = 1,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(443)->
    #dropCfg {
    dropId = 4003,
    dropType = 0,
    dataId = 14169,
    probability = 10000,
    career = 0,
    sex = 2,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(444)->
    #dropCfg {
    dropId = 5000,
    dropType = 1,
    dataId = 5000,
    probability = 5000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(445)->
    #dropCfg {
    dropId = 6001,
    dropType = 2,
    dataId = 1,
    probability = 149,
    career = 0,
    sex = 0,
    min = 100,
    max = 100,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(446)->
    #dropCfg {
    dropId = 6001,
    dropType = 2,
    dataId = 1,
    probability = 89,
    career = 0,
    sex = 0,
    min = 250,
    max = 250,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(447)->
    #dropCfg {
    dropId = 6001,
    dropType = 2,
    dataId = 1,
    probability = 59,
    career = 0,
    sex = 0,
    min = 500,
    max = 500,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(448)->
    #dropCfg {
    dropId = 6001,
    dropType = 2,
    dataId = 1,
    probability = 3,
    career = 0,
    sex = 0,
    min = 2000,
    max = 2000,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(449)->
    #dropCfg {
    dropId = 6001,
    dropType = 1,
    dataId = 6500,
    probability = 1,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(450)->
    #dropCfg {
    dropId = 6001,
    dropType = 1,
    dataId = 0,
    probability = 1,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(451)->
    #dropCfg {
    dropId = 6001,
    dropType = 1,
    dataId = 0,
    probability = 10,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(452)->
    #dropCfg {
    dropId = 6001,
    dropType = 1,
    dataId = 5004,
    probability = 200,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 1
    };
getRow(453)->
    #dropCfg {
    dropId = 6002,
    dropType = 2,
    dataId = 1,
    probability = 150,
    career = 0,
    sex = 0,
    min = 100,
    max = 100,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(454)->
    #dropCfg {
    dropId = 6002,
    dropType = 2,
    dataId = 1,
    probability = 90,
    career = 0,
    sex = 0,
    min = 250,
    max = 250,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(455)->
    #dropCfg {
    dropId = 6002,
    dropType = 2,
    dataId = 1,
    probability = 60,
    career = 0,
    sex = 0,
    min = 500,
    max = 500,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(456)->
    #dropCfg {
    dropId = 6002,
    dropType = 2,
    dataId = 1,
    probability = 3,
    career = 0,
    sex = 0,
    min = 2000,
    max = 2000,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(457)->
    #dropCfg {
    dropId = 6002,
    dropType = 1,
    dataId = 6500,
    probability = 1,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(458)->
    #dropCfg {
    dropId = 6002,
    dropType = 1,
    dataId = 0,
    probability = 1,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(459)->
    #dropCfg {
    dropId = 6002,
    dropType = 1,
    dataId = 0,
    probability = 10,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(460)->
    #dropCfg {
    dropId = 6002,
    dropType = 1,
    dataId = 5004,
    probability = 200,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 1
    };
getRow(461)->
    #dropCfg {
    dropId = 6003,
    dropType = 2,
    dataId = 1,
    probability = 151,
    career = 0,
    sex = 0,
    min = 100,
    max = 100,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(462)->
    #dropCfg {
    dropId = 6003,
    dropType = 2,
    dataId = 1,
    probability = 91,
    career = 0,
    sex = 0,
    min = 250,
    max = 250,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(463)->
    #dropCfg {
    dropId = 6003,
    dropType = 2,
    dataId = 1,
    probability = 61,
    career = 0,
    sex = 0,
    min = 500,
    max = 500,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(464)->
    #dropCfg {
    dropId = 6003,
    dropType = 2,
    dataId = 1,
    probability = 3,
    career = 0,
    sex = 0,
    min = 2000,
    max = 2000,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(465)->
    #dropCfg {
    dropId = 6003,
    dropType = 1,
    dataId = 6500,
    probability = 1,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(466)->
    #dropCfg {
    dropId = 6003,
    dropType = 1,
    dataId = 0,
    probability = 1,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(467)->
    #dropCfg {
    dropId = 6003,
    dropType = 1,
    dataId = 0,
    probability = 10,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(468)->
    #dropCfg {
    dropId = 6003,
    dropType = 1,
    dataId = 5004,
    probability = 200,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 1
    };
getRow(469)->
    #dropCfg {
    dropId = 6004,
    dropType = 2,
    dataId = 1,
    probability = 153,
    career = 0,
    sex = 0,
    min = 100,
    max = 100,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(470)->
    #dropCfg {
    dropId = 6004,
    dropType = 2,
    dataId = 1,
    probability = 92,
    career = 0,
    sex = 0,
    min = 250,
    max = 250,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(471)->
    #dropCfg {
    dropId = 6004,
    dropType = 2,
    dataId = 1,
    probability = 61,
    career = 0,
    sex = 0,
    min = 500,
    max = 500,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(472)->
    #dropCfg {
    dropId = 6004,
    dropType = 2,
    dataId = 1,
    probability = 3,
    career = 0,
    sex = 0,
    min = 2000,
    max = 2000,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(473)->
    #dropCfg {
    dropId = 6004,
    dropType = 1,
    dataId = 6500,
    probability = 1,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(474)->
    #dropCfg {
    dropId = 6004,
    dropType = 1,
    dataId = 0,
    probability = 1,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(475)->
    #dropCfg {
    dropId = 6004,
    dropType = 1,
    dataId = 0,
    probability = 10,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(476)->
    #dropCfg {
    dropId = 6004,
    dropType = 1,
    dataId = 5004,
    probability = 200,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 1
    };
getRow(477)->
    #dropCfg {
    dropId = 6005,
    dropType = 2,
    dataId = 1,
    probability = 154,
    career = 0,
    sex = 0,
    min = 100,
    max = 100,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(478)->
    #dropCfg {
    dropId = 6005,
    dropType = 2,
    dataId = 1,
    probability = 93,
    career = 0,
    sex = 0,
    min = 250,
    max = 250,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(479)->
    #dropCfg {
    dropId = 6005,
    dropType = 2,
    dataId = 1,
    probability = 62,
    career = 0,
    sex = 0,
    min = 500,
    max = 500,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(480)->
    #dropCfg {
    dropId = 6005,
    dropType = 2,
    dataId = 1,
    probability = 3,
    career = 0,
    sex = 0,
    min = 2000,
    max = 2000,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(481)->
    #dropCfg {
    dropId = 6005,
    dropType = 1,
    dataId = 6500,
    probability = 1,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(482)->
    #dropCfg {
    dropId = 6005,
    dropType = 1,
    dataId = 0,
    probability = 1,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(483)->
    #dropCfg {
    dropId = 6005,
    dropType = 1,
    dataId = 0,
    probability = 10,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(484)->
    #dropCfg {
    dropId = 6005,
    dropType = 1,
    dataId = 5004,
    probability = 200,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 1
    };
getRow(485)->
    #dropCfg {
    dropId = 6006,
    dropType = 2,
    dataId = 1,
    probability = 156,
    career = 0,
    sex = 0,
    min = 100,
    max = 100,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(486)->
    #dropCfg {
    dropId = 6006,
    dropType = 2,
    dataId = 1,
    probability = 94,
    career = 0,
    sex = 0,
    min = 250,
    max = 250,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(487)->
    #dropCfg {
    dropId = 6006,
    dropType = 2,
    dataId = 1,
    probability = 62,
    career = 0,
    sex = 0,
    min = 500,
    max = 500,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(488)->
    #dropCfg {
    dropId = 6006,
    dropType = 2,
    dataId = 1,
    probability = 3,
    career = 0,
    sex = 0,
    min = 2000,
    max = 2000,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(489)->
    #dropCfg {
    dropId = 6006,
    dropType = 1,
    dataId = 6500,
    probability = 1,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(490)->
    #dropCfg {
    dropId = 6006,
    dropType = 1,
    dataId = 0,
    probability = 1,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(491)->
    #dropCfg {
    dropId = 6006,
    dropType = 1,
    dataId = 0,
    probability = 10,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(492)->
    #dropCfg {
    dropId = 6006,
    dropType = 1,
    dataId = 5004,
    probability = 200,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 1
    };
getRow(493)->
    #dropCfg {
    dropId = 6007,
    dropType = 2,
    dataId = 1,
    probability = 157,
    career = 0,
    sex = 0,
    min = 100,
    max = 100,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(494)->
    #dropCfg {
    dropId = 6007,
    dropType = 2,
    dataId = 1,
    probability = 94,
    career = 0,
    sex = 0,
    min = 250,
    max = 250,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(495)->
    #dropCfg {
    dropId = 6007,
    dropType = 2,
    dataId = 1,
    probability = 63,
    career = 0,
    sex = 0,
    min = 500,
    max = 500,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(496)->
    #dropCfg {
    dropId = 6007,
    dropType = 2,
    dataId = 1,
    probability = 3,
    career = 0,
    sex = 0,
    min = 2000,
    max = 2000,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(497)->
    #dropCfg {
    dropId = 6007,
    dropType = 1,
    dataId = 6500,
    probability = 1,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(498)->
    #dropCfg {
    dropId = 6007,
    dropType = 1,
    dataId = 0,
    probability = 1,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(499)->
    #dropCfg {
    dropId = 6007,
    dropType = 1,
    dataId = 0,
    probability = 10,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(500)->
    #dropCfg {
    dropId = 6007,
    dropType = 1,
    dataId = 5004,
    probability = 200,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 1
    };
getRow(501)->
    #dropCfg {
    dropId = 6008,
    dropType = 2,
    dataId = 1,
    probability = 159,
    career = 0,
    sex = 0,
    min = 100,
    max = 100,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(502)->
    #dropCfg {
    dropId = 6008,
    dropType = 2,
    dataId = 1,
    probability = 95,
    career = 0,
    sex = 0,
    min = 250,
    max = 250,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(503)->
    #dropCfg {
    dropId = 6008,
    dropType = 2,
    dataId = 1,
    probability = 64,
    career = 0,
    sex = 0,
    min = 500,
    max = 500,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(504)->
    #dropCfg {
    dropId = 6008,
    dropType = 2,
    dataId = 1,
    probability = 3,
    career = 0,
    sex = 0,
    min = 2000,
    max = 2000,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(505)->
    #dropCfg {
    dropId = 6008,
    dropType = 1,
    dataId = 6500,
    probability = 1,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(506)->
    #dropCfg {
    dropId = 6008,
    dropType = 1,
    dataId = 0,
    probability = 1,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(507)->
    #dropCfg {
    dropId = 6008,
    dropType = 1,
    dataId = 0,
    probability = 10,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(508)->
    #dropCfg {
    dropId = 6008,
    dropType = 1,
    dataId = 5004,
    probability = 200,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 1
    };
getRow(509)->
    #dropCfg {
    dropId = 6009,
    dropType = 2,
    dataId = 1,
    probability = 160,
    career = 0,
    sex = 0,
    min = 100,
    max = 100,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(510)->
    #dropCfg {
    dropId = 6009,
    dropType = 2,
    dataId = 1,
    probability = 96,
    career = 0,
    sex = 0,
    min = 250,
    max = 250,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(511)->
    #dropCfg {
    dropId = 6009,
    dropType = 2,
    dataId = 1,
    probability = 64,
    career = 0,
    sex = 0,
    min = 500,
    max = 500,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(512)->
    #dropCfg {
    dropId = 6009,
    dropType = 2,
    dataId = 1,
    probability = 3,
    career = 0,
    sex = 0,
    min = 2000,
    max = 2000,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(513)->
    #dropCfg {
    dropId = 6009,
    dropType = 1,
    dataId = 6500,
    probability = 1,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(514)->
    #dropCfg {
    dropId = 6009,
    dropType = 1,
    dataId = 0,
    probability = 1,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(515)->
    #dropCfg {
    dropId = 6009,
    dropType = 1,
    dataId = 0,
    probability = 10,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(516)->
    #dropCfg {
    dropId = 6009,
    dropType = 1,
    dataId = 5004,
    probability = 200,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 1
    };
getRow(517)->
    #dropCfg {
    dropId = 6010,
    dropType = 2,
    dataId = 1,
    probability = 163,
    career = 0,
    sex = 0,
    min = 100,
    max = 100,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(518)->
    #dropCfg {
    dropId = 6010,
    dropType = 2,
    dataId = 1,
    probability = 98,
    career = 0,
    sex = 0,
    min = 250,
    max = 250,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(519)->
    #dropCfg {
    dropId = 6010,
    dropType = 2,
    dataId = 1,
    probability = 65,
    career = 0,
    sex = 0,
    min = 500,
    max = 500,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(520)->
    #dropCfg {
    dropId = 6010,
    dropType = 2,
    dataId = 1,
    probability = 3,
    career = 0,
    sex = 0,
    min = 2000,
    max = 2000,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(521)->
    #dropCfg {
    dropId = 6010,
    dropType = 1,
    dataId = 6500,
    probability = 1,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(522)->
    #dropCfg {
    dropId = 6010,
    dropType = 1,
    dataId = 284000,
    probability = 1,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(523)->
    #dropCfg {
    dropId = 6010,
    dropType = 1,
    dataId = 0,
    probability = 10,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(524)->
    #dropCfg {
    dropId = 6010,
    dropType = 1,
    dataId = 5004,
    probability = 200,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 1
    };
getRow(525)->
    #dropCfg {
    dropId = 6011,
    dropType = 2,
    dataId = 1,
    probability = 166,
    career = 0,
    sex = 0,
    min = 100,
    max = 100,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(526)->
    #dropCfg {
    dropId = 6011,
    dropType = 2,
    dataId = 1,
    probability = 100,
    career = 0,
    sex = 0,
    min = 250,
    max = 250,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(527)->
    #dropCfg {
    dropId = 6011,
    dropType = 2,
    dataId = 1,
    probability = 67,
    career = 0,
    sex = 0,
    min = 500,
    max = 500,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(528)->
    #dropCfg {
    dropId = 6011,
    dropType = 2,
    dataId = 1,
    probability = 3,
    career = 0,
    sex = 0,
    min = 2000,
    max = 2000,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(529)->
    #dropCfg {
    dropId = 6011,
    dropType = 1,
    dataId = 6500,
    probability = 1,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(530)->
    #dropCfg {
    dropId = 6011,
    dropType = 1,
    dataId = 284000,
    probability = 1,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(531)->
    #dropCfg {
    dropId = 6011,
    dropType = 1,
    dataId = 0,
    probability = 10,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(532)->
    #dropCfg {
    dropId = 6011,
    dropType = 1,
    dataId = 5004,
    probability = 200,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 1
    };
getRow(533)->
    #dropCfg {
    dropId = 6012,
    dropType = 2,
    dataId = 1,
    probability = 169,
    career = 0,
    sex = 0,
    min = 100,
    max = 100,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(534)->
    #dropCfg {
    dropId = 6012,
    dropType = 2,
    dataId = 1,
    probability = 102,
    career = 0,
    sex = 0,
    min = 250,
    max = 250,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(535)->
    #dropCfg {
    dropId = 6012,
    dropType = 2,
    dataId = 1,
    probability = 68,
    career = 0,
    sex = 0,
    min = 500,
    max = 500,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(536)->
    #dropCfg {
    dropId = 6012,
    dropType = 2,
    dataId = 1,
    probability = 3,
    career = 0,
    sex = 0,
    min = 2000,
    max = 2000,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(537)->
    #dropCfg {
    dropId = 6012,
    dropType = 1,
    dataId = 6500,
    probability = 1,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(538)->
    #dropCfg {
    dropId = 6012,
    dropType = 1,
    dataId = 284000,
    probability = 1,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(539)->
    #dropCfg {
    dropId = 6012,
    dropType = 1,
    dataId = 0,
    probability = 10,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(540)->
    #dropCfg {
    dropId = 6012,
    dropType = 1,
    dataId = 5004,
    probability = 200,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 1
    };
getRow(541)->
    #dropCfg {
    dropId = 6013,
    dropType = 2,
    dataId = 1,
    probability = 172,
    career = 0,
    sex = 0,
    min = 100,
    max = 100,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(542)->
    #dropCfg {
    dropId = 6013,
    dropType = 2,
    dataId = 1,
    probability = 103,
    career = 0,
    sex = 0,
    min = 250,
    max = 250,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(543)->
    #dropCfg {
    dropId = 6013,
    dropType = 2,
    dataId = 1,
    probability = 69,
    career = 0,
    sex = 0,
    min = 500,
    max = 500,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(544)->
    #dropCfg {
    dropId = 6013,
    dropType = 2,
    dataId = 1,
    probability = 3,
    career = 0,
    sex = 0,
    min = 2000,
    max = 2000,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(545)->
    #dropCfg {
    dropId = 6013,
    dropType = 1,
    dataId = 6500,
    probability = 1,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(546)->
    #dropCfg {
    dropId = 6013,
    dropType = 1,
    dataId = 284000,
    probability = 1,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(547)->
    #dropCfg {
    dropId = 6013,
    dropType = 1,
    dataId = 0,
    probability = 10,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(548)->
    #dropCfg {
    dropId = 6013,
    dropType = 1,
    dataId = 5004,
    probability = 200,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 1
    };
getRow(549)->
    #dropCfg {
    dropId = 6014,
    dropType = 2,
    dataId = 1,
    probability = 175,
    career = 0,
    sex = 0,
    min = 100,
    max = 100,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(550)->
    #dropCfg {
    dropId = 6014,
    dropType = 2,
    dataId = 1,
    probability = 105,
    career = 0,
    sex = 0,
    min = 250,
    max = 250,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(551)->
    #dropCfg {
    dropId = 6014,
    dropType = 2,
    dataId = 1,
    probability = 70,
    career = 0,
    sex = 0,
    min = 500,
    max = 500,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(552)->
    #dropCfg {
    dropId = 6014,
    dropType = 2,
    dataId = 1,
    probability = 4,
    career = 0,
    sex = 0,
    min = 2000,
    max = 2000,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(553)->
    #dropCfg {
    dropId = 6014,
    dropType = 1,
    dataId = 6500,
    probability = 1,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(554)->
    #dropCfg {
    dropId = 6014,
    dropType = 1,
    dataId = 284000,
    probability = 1,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(555)->
    #dropCfg {
    dropId = 6014,
    dropType = 1,
    dataId = 0,
    probability = 10,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(556)->
    #dropCfg {
    dropId = 6014,
    dropType = 1,
    dataId = 5004,
    probability = 200,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 1
    };
getRow(557)->
    #dropCfg {
    dropId = 6015,
    dropType = 2,
    dataId = 1,
    probability = 178,
    career = 0,
    sex = 0,
    min = 100,
    max = 100,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(558)->
    #dropCfg {
    dropId = 6015,
    dropType = 2,
    dataId = 1,
    probability = 107,
    career = 0,
    sex = 0,
    min = 250,
    max = 250,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(559)->
    #dropCfg {
    dropId = 6015,
    dropType = 2,
    dataId = 1,
    probability = 71,
    career = 0,
    sex = 0,
    min = 500,
    max = 500,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(560)->
    #dropCfg {
    dropId = 6015,
    dropType = 2,
    dataId = 1,
    probability = 4,
    career = 0,
    sex = 0,
    min = 2000,
    max = 2000,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(561)->
    #dropCfg {
    dropId = 6015,
    dropType = 1,
    dataId = 6500,
    probability = 1,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(562)->
    #dropCfg {
    dropId = 6015,
    dropType = 1,
    dataId = 284000,
    probability = 1,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(563)->
    #dropCfg {
    dropId = 6015,
    dropType = 1,
    dataId = 6000,
    probability = 10,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(564)->
    #dropCfg {
    dropId = 6015,
    dropType = 1,
    dataId = 5004,
    probability = 200,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 1
    };
getRow(565)->
    #dropCfg {
    dropId = 6016,
    dropType = 2,
    dataId = 1,
    probability = 181,
    career = 0,
    sex = 0,
    min = 100,
    max = 100,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(566)->
    #dropCfg {
    dropId = 6016,
    dropType = 2,
    dataId = 1,
    probability = 109,
    career = 0,
    sex = 0,
    min = 250,
    max = 250,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(567)->
    #dropCfg {
    dropId = 6016,
    dropType = 2,
    dataId = 1,
    probability = 72,
    career = 0,
    sex = 0,
    min = 500,
    max = 500,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(568)->
    #dropCfg {
    dropId = 6016,
    dropType = 2,
    dataId = 1,
    probability = 4,
    career = 0,
    sex = 0,
    min = 2000,
    max = 2000,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(569)->
    #dropCfg {
    dropId = 6016,
    dropType = 1,
    dataId = 6500,
    probability = 1,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(570)->
    #dropCfg {
    dropId = 6016,
    dropType = 1,
    dataId = 284000,
    probability = 1,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(571)->
    #dropCfg {
    dropId = 6016,
    dropType = 1,
    dataId = 6000,
    probability = 10,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(572)->
    #dropCfg {
    dropId = 6016,
    dropType = 1,
    dataId = 5004,
    probability = 200,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 1
    };
getRow(573)->
    #dropCfg {
    dropId = 6017,
    dropType = 2,
    dataId = 1,
    probability = 184,
    career = 0,
    sex = 0,
    min = 100,
    max = 100,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(574)->
    #dropCfg {
    dropId = 6017,
    dropType = 2,
    dataId = 1,
    probability = 110,
    career = 0,
    sex = 0,
    min = 250,
    max = 250,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(575)->
    #dropCfg {
    dropId = 6017,
    dropType = 2,
    dataId = 1,
    probability = 74,
    career = 0,
    sex = 0,
    min = 500,
    max = 500,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(576)->
    #dropCfg {
    dropId = 6017,
    dropType = 2,
    dataId = 1,
    probability = 4,
    career = 0,
    sex = 0,
    min = 2000,
    max = 2000,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(577)->
    #dropCfg {
    dropId = 6017,
    dropType = 1,
    dataId = 6500,
    probability = 1,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(578)->
    #dropCfg {
    dropId = 6017,
    dropType = 1,
    dataId = 284000,
    probability = 1,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(579)->
    #dropCfg {
    dropId = 6017,
    dropType = 1,
    dataId = 6000,
    probability = 10,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(580)->
    #dropCfg {
    dropId = 6017,
    dropType = 1,
    dataId = 5004,
    probability = 200,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 1
    };
getRow(581)->
    #dropCfg {
    dropId = 6018,
    dropType = 2,
    dataId = 1,
    probability = 187,
    career = 0,
    sex = 0,
    min = 100,
    max = 100,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(582)->
    #dropCfg {
    dropId = 6018,
    dropType = 2,
    dataId = 1,
    probability = 112,
    career = 0,
    sex = 0,
    min = 250,
    max = 250,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(583)->
    #dropCfg {
    dropId = 6018,
    dropType = 2,
    dataId = 1,
    probability = 75,
    career = 0,
    sex = 0,
    min = 500,
    max = 500,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(584)->
    #dropCfg {
    dropId = 6018,
    dropType = 2,
    dataId = 1,
    probability = 4,
    career = 0,
    sex = 0,
    min = 2000,
    max = 2000,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(585)->
    #dropCfg {
    dropId = 6018,
    dropType = 1,
    dataId = 6500,
    probability = 1,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(586)->
    #dropCfg {
    dropId = 6018,
    dropType = 1,
    dataId = 284000,
    probability = 1,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(587)->
    #dropCfg {
    dropId = 6018,
    dropType = 1,
    dataId = 6000,
    probability = 10,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(588)->
    #dropCfg {
    dropId = 6018,
    dropType = 1,
    dataId = 5004,
    probability = 200,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 1
    };
getRow(589)->
    #dropCfg {
    dropId = 6019,
    dropType = 2,
    dataId = 1,
    probability = 190,
    career = 0,
    sex = 0,
    min = 100,
    max = 100,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(590)->
    #dropCfg {
    dropId = 6019,
    dropType = 2,
    dataId = 1,
    probability = 114,
    career = 0,
    sex = 0,
    min = 250,
    max = 250,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(591)->
    #dropCfg {
    dropId = 6019,
    dropType = 2,
    dataId = 1,
    probability = 76,
    career = 0,
    sex = 0,
    min = 500,
    max = 500,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(592)->
    #dropCfg {
    dropId = 6019,
    dropType = 2,
    dataId = 1,
    probability = 4,
    career = 0,
    sex = 0,
    min = 2000,
    max = 2000,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(593)->
    #dropCfg {
    dropId = 6019,
    dropType = 1,
    dataId = 6500,
    probability = 1,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(594)->
    #dropCfg {
    dropId = 6019,
    dropType = 1,
    dataId = 284000,
    probability = 1,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(595)->
    #dropCfg {
    dropId = 6019,
    dropType = 1,
    dataId = 6000,
    probability = 10,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(596)->
    #dropCfg {
    dropId = 6019,
    dropType = 1,
    dataId = 5004,
    probability = 200,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 1
    };
getRow(597)->
    #dropCfg {
    dropId = 6020,
    dropType = 2,
    dataId = 1,
    probability = 195,
    career = 0,
    sex = 0,
    min = 100,
    max = 100,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(598)->
    #dropCfg {
    dropId = 6020,
    dropType = 2,
    dataId = 1,
    probability = 117,
    career = 0,
    sex = 0,
    min = 250,
    max = 250,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(599)->
    #dropCfg {
    dropId = 6020,
    dropType = 2,
    dataId = 1,
    probability = 78,
    career = 0,
    sex = 0,
    min = 500,
    max = 500,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(600)->
    #dropCfg {
    dropId = 6020,
    dropType = 2,
    dataId = 1,
    probability = 4,
    career = 0,
    sex = 0,
    min = 2000,
    max = 2000,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(601)->
    #dropCfg {
    dropId = 6020,
    dropType = 1,
    dataId = 6500,
    probability = 1,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(602)->
    #dropCfg {
    dropId = 6020,
    dropType = 1,
    dataId = 284001,
    probability = 1,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(603)->
    #dropCfg {
    dropId = 6020,
    dropType = 1,
    dataId = 6001,
    probability = 10,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(604)->
    #dropCfg {
    dropId = 6020,
    dropType = 1,
    dataId = 5004,
    probability = 200,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 1
    };
getRow(605)->
    #dropCfg {
    dropId = 6021,
    dropType = 2,
    dataId = 1,
    probability = 199,
    career = 0,
    sex = 0,
    min = 100,
    max = 100,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(606)->
    #dropCfg {
    dropId = 6021,
    dropType = 2,
    dataId = 1,
    probability = 119,
    career = 0,
    sex = 0,
    min = 250,
    max = 250,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(607)->
    #dropCfg {
    dropId = 6021,
    dropType = 2,
    dataId = 1,
    probability = 80,
    career = 0,
    sex = 0,
    min = 500,
    max = 500,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(608)->
    #dropCfg {
    dropId = 6021,
    dropType = 2,
    dataId = 1,
    probability = 4,
    career = 0,
    sex = 0,
    min = 2000,
    max = 2000,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(609)->
    #dropCfg {
    dropId = 6021,
    dropType = 1,
    dataId = 6500,
    probability = 1,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(610)->
    #dropCfg {
    dropId = 6021,
    dropType = 1,
    dataId = 284001,
    probability = 1,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(611)->
    #dropCfg {
    dropId = 6021,
    dropType = 1,
    dataId = 6001,
    probability = 10,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(612)->
    #dropCfg {
    dropId = 6021,
    dropType = 1,
    dataId = 5004,
    probability = 200,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 1
    };
getRow(613)->
    #dropCfg {
    dropId = 6022,
    dropType = 2,
    dataId = 1,
    probability = 203,
    career = 0,
    sex = 0,
    min = 100,
    max = 100,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(614)->
    #dropCfg {
    dropId = 6022,
    dropType = 2,
    dataId = 1,
    probability = 122,
    career = 0,
    sex = 0,
    min = 250,
    max = 250,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(615)->
    #dropCfg {
    dropId = 6022,
    dropType = 2,
    dataId = 1,
    probability = 81,
    career = 0,
    sex = 0,
    min = 500,
    max = 500,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(616)->
    #dropCfg {
    dropId = 6022,
    dropType = 2,
    dataId = 1,
    probability = 4,
    career = 0,
    sex = 0,
    min = 2000,
    max = 2000,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(617)->
    #dropCfg {
    dropId = 6022,
    dropType = 1,
    dataId = 6500,
    probability = 1,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(618)->
    #dropCfg {
    dropId = 6022,
    dropType = 1,
    dataId = 284001,
    probability = 1,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(619)->
    #dropCfg {
    dropId = 6022,
    dropType = 1,
    dataId = 6001,
    probability = 10,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(620)->
    #dropCfg {
    dropId = 6022,
    dropType = 1,
    dataId = 5004,
    probability = 200,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 1
    };
getRow(621)->
    #dropCfg {
    dropId = 6023,
    dropType = 2,
    dataId = 1,
    probability = 208,
    career = 0,
    sex = 0,
    min = 100,
    max = 100,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(622)->
    #dropCfg {
    dropId = 6023,
    dropType = 2,
    dataId = 1,
    probability = 125,
    career = 0,
    sex = 0,
    min = 250,
    max = 250,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(623)->
    #dropCfg {
    dropId = 6023,
    dropType = 2,
    dataId = 1,
    probability = 83,
    career = 0,
    sex = 0,
    min = 500,
    max = 500,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(624)->
    #dropCfg {
    dropId = 6023,
    dropType = 2,
    dataId = 1,
    probability = 4,
    career = 0,
    sex = 0,
    min = 2000,
    max = 2000,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(625)->
    #dropCfg {
    dropId = 6023,
    dropType = 1,
    dataId = 6500,
    probability = 1,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(626)->
    #dropCfg {
    dropId = 6023,
    dropType = 1,
    dataId = 284001,
    probability = 1,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(627)->
    #dropCfg {
    dropId = 6023,
    dropType = 1,
    dataId = 6001,
    probability = 10,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(628)->
    #dropCfg {
    dropId = 6023,
    dropType = 1,
    dataId = 5004,
    probability = 200,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 1
    };
getRow(629)->
    #dropCfg {
    dropId = 6024,
    dropType = 2,
    dataId = 1,
    probability = 212,
    career = 0,
    sex = 0,
    min = 100,
    max = 100,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(630)->
    #dropCfg {
    dropId = 6024,
    dropType = 2,
    dataId = 1,
    probability = 127,
    career = 0,
    sex = 0,
    min = 250,
    max = 250,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(631)->
    #dropCfg {
    dropId = 6024,
    dropType = 2,
    dataId = 1,
    probability = 85,
    career = 0,
    sex = 0,
    min = 500,
    max = 500,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(632)->
    #dropCfg {
    dropId = 6024,
    dropType = 2,
    dataId = 1,
    probability = 4,
    career = 0,
    sex = 0,
    min = 2000,
    max = 2000,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(633)->
    #dropCfg {
    dropId = 6024,
    dropType = 1,
    dataId = 6500,
    probability = 1,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(634)->
    #dropCfg {
    dropId = 6024,
    dropType = 1,
    dataId = 284001,
    probability = 1,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(635)->
    #dropCfg {
    dropId = 6024,
    dropType = 1,
    dataId = 6001,
    probability = 10,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(636)->
    #dropCfg {
    dropId = 6024,
    dropType = 1,
    dataId = 5004,
    probability = 200,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 1
    };
getRow(637)->
    #dropCfg {
    dropId = 6025,
    dropType = 2,
    dataId = 1,
    probability = 217,
    career = 0,
    sex = 0,
    min = 100,
    max = 100,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(638)->
    #dropCfg {
    dropId = 6025,
    dropType = 2,
    dataId = 1,
    probability = 130,
    career = 0,
    sex = 0,
    min = 250,
    max = 250,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(639)->
    #dropCfg {
    dropId = 6025,
    dropType = 2,
    dataId = 1,
    probability = 87,
    career = 0,
    sex = 0,
    min = 500,
    max = 500,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(640)->
    #dropCfg {
    dropId = 6025,
    dropType = 2,
    dataId = 1,
    probability = 4,
    career = 0,
    sex = 0,
    min = 2000,
    max = 2000,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(641)->
    #dropCfg {
    dropId = 6025,
    dropType = 1,
    dataId = 6500,
    probability = 1,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(642)->
    #dropCfg {
    dropId = 6025,
    dropType = 1,
    dataId = 284001,
    probability = 1,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(643)->
    #dropCfg {
    dropId = 6025,
    dropType = 1,
    dataId = 6001,
    probability = 10,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(644)->
    #dropCfg {
    dropId = 6025,
    dropType = 1,
    dataId = 5004,
    probability = 200,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 1
    };
getRow(645)->
    #dropCfg {
    dropId = 6026,
    dropType = 2,
    dataId = 1,
    probability = 221,
    career = 0,
    sex = 0,
    min = 100,
    max = 100,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(646)->
    #dropCfg {
    dropId = 6026,
    dropType = 2,
    dataId = 1,
    probability = 133,
    career = 0,
    sex = 0,
    min = 250,
    max = 250,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(647)->
    #dropCfg {
    dropId = 6026,
    dropType = 2,
    dataId = 1,
    probability = 89,
    career = 0,
    sex = 0,
    min = 500,
    max = 500,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(648)->
    #dropCfg {
    dropId = 6026,
    dropType = 2,
    dataId = 1,
    probability = 4,
    career = 0,
    sex = 0,
    min = 2000,
    max = 2000,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(649)->
    #dropCfg {
    dropId = 6026,
    dropType = 1,
    dataId = 6500,
    probability = 1,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(650)->
    #dropCfg {
    dropId = 6026,
    dropType = 1,
    dataId = 284001,
    probability = 1,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(651)->
    #dropCfg {
    dropId = 6026,
    dropType = 1,
    dataId = 6001,
    probability = 10,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(652)->
    #dropCfg {
    dropId = 6026,
    dropType = 1,
    dataId = 5004,
    probability = 200,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 1
    };
getRow(653)->
    #dropCfg {
    dropId = 6027,
    dropType = 2,
    dataId = 1,
    probability = 226,
    career = 0,
    sex = 0,
    min = 100,
    max = 100,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(654)->
    #dropCfg {
    dropId = 6027,
    dropType = 2,
    dataId = 1,
    probability = 135,
    career = 0,
    sex = 0,
    min = 250,
    max = 250,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(655)->
    #dropCfg {
    dropId = 6027,
    dropType = 2,
    dataId = 1,
    probability = 90,
    career = 0,
    sex = 0,
    min = 500,
    max = 500,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(656)->
    #dropCfg {
    dropId = 6027,
    dropType = 2,
    dataId = 1,
    probability = 5,
    career = 0,
    sex = 0,
    min = 2000,
    max = 2000,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(657)->
    #dropCfg {
    dropId = 6027,
    dropType = 1,
    dataId = 6500,
    probability = 1,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(658)->
    #dropCfg {
    dropId = 6027,
    dropType = 1,
    dataId = 284001,
    probability = 1,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(659)->
    #dropCfg {
    dropId = 6027,
    dropType = 1,
    dataId = 6001,
    probability = 10,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(660)->
    #dropCfg {
    dropId = 6027,
    dropType = 1,
    dataId = 5004,
    probability = 200,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 1
    };
getRow(661)->
    #dropCfg {
    dropId = 6028,
    dropType = 2,
    dataId = 1,
    probability = 230,
    career = 0,
    sex = 0,
    min = 100,
    max = 100,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(662)->
    #dropCfg {
    dropId = 6028,
    dropType = 2,
    dataId = 1,
    probability = 138,
    career = 0,
    sex = 0,
    min = 250,
    max = 250,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(663)->
    #dropCfg {
    dropId = 6028,
    dropType = 2,
    dataId = 1,
    probability = 92,
    career = 0,
    sex = 0,
    min = 500,
    max = 500,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(664)->
    #dropCfg {
    dropId = 6028,
    dropType = 2,
    dataId = 1,
    probability = 5,
    career = 0,
    sex = 0,
    min = 2000,
    max = 2000,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(665)->
    #dropCfg {
    dropId = 6028,
    dropType = 1,
    dataId = 6500,
    probability = 1,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(666)->
    #dropCfg {
    dropId = 6028,
    dropType = 1,
    dataId = 284001,
    probability = 1,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(667)->
    #dropCfg {
    dropId = 6028,
    dropType = 1,
    dataId = 6002,
    probability = 10,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(668)->
    #dropCfg {
    dropId = 6028,
    dropType = 1,
    dataId = 5004,
    probability = 200,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 1
    };
getRow(669)->
    #dropCfg {
    dropId = 6029,
    dropType = 2,
    dataId = 1,
    probability = 235,
    career = 0,
    sex = 0,
    min = 100,
    max = 100,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(670)->
    #dropCfg {
    dropId = 6029,
    dropType = 2,
    dataId = 1,
    probability = 141,
    career = 0,
    sex = 0,
    min = 250,
    max = 250,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(671)->
    #dropCfg {
    dropId = 6029,
    dropType = 2,
    dataId = 1,
    probability = 94,
    career = 0,
    sex = 0,
    min = 500,
    max = 500,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(672)->
    #dropCfg {
    dropId = 6029,
    dropType = 2,
    dataId = 1,
    probability = 5,
    career = 0,
    sex = 0,
    min = 2000,
    max = 2000,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(673)->
    #dropCfg {
    dropId = 6029,
    dropType = 1,
    dataId = 6500,
    probability = 1,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(674)->
    #dropCfg {
    dropId = 6029,
    dropType = 1,
    dataId = 284001,
    probability = 1,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(675)->
    #dropCfg {
    dropId = 6029,
    dropType = 1,
    dataId = 6002,
    probability = 10,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(676)->
    #dropCfg {
    dropId = 6029,
    dropType = 1,
    dataId = 5004,
    probability = 200,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 1
    };
getRow(677)->
    #dropCfg {
    dropId = 6030,
    dropType = 2,
    dataId = 1,
    probability = 242,
    career = 0,
    sex = 0,
    min = 100,
    max = 100,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(678)->
    #dropCfg {
    dropId = 6030,
    dropType = 2,
    dataId = 1,
    probability = 145,
    career = 0,
    sex = 0,
    min = 250,
    max = 250,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(679)->
    #dropCfg {
    dropId = 6030,
    dropType = 2,
    dataId = 1,
    probability = 97,
    career = 0,
    sex = 0,
    min = 500,
    max = 500,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(680)->
    #dropCfg {
    dropId = 6030,
    dropType = 2,
    dataId = 1,
    probability = 5,
    career = 0,
    sex = 0,
    min = 2000,
    max = 2000,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(681)->
    #dropCfg {
    dropId = 6030,
    dropType = 1,
    dataId = 6500,
    probability = 1,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(682)->
    #dropCfg {
    dropId = 6030,
    dropType = 1,
    dataId = 284001,
    probability = 1,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(683)->
    #dropCfg {
    dropId = 6030,
    dropType = 1,
    dataId = 6002,
    probability = 10,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(684)->
    #dropCfg {
    dropId = 6030,
    dropType = 1,
    dataId = 5004,
    probability = 200,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 1
    };
getRow(685)->
    #dropCfg {
    dropId = 6031,
    dropType = 2,
    dataId = 1,
    probability = 250,
    career = 0,
    sex = 0,
    min = 100,
    max = 100,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(686)->
    #dropCfg {
    dropId = 6031,
    dropType = 2,
    dataId = 1,
    probability = 150,
    career = 0,
    sex = 0,
    min = 250,
    max = 250,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(687)->
    #dropCfg {
    dropId = 6031,
    dropType = 2,
    dataId = 1,
    probability = 100,
    career = 0,
    sex = 0,
    min = 500,
    max = 500,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(688)->
    #dropCfg {
    dropId = 6031,
    dropType = 2,
    dataId = 1,
    probability = 5,
    career = 0,
    sex = 0,
    min = 2000,
    max = 2000,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(689)->
    #dropCfg {
    dropId = 6031,
    dropType = 1,
    dataId = 6500,
    probability = 1,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(690)->
    #dropCfg {
    dropId = 6031,
    dropType = 1,
    dataId = 284001,
    probability = 1,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(691)->
    #dropCfg {
    dropId = 6031,
    dropType = 1,
    dataId = 6002,
    probability = 10,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(692)->
    #dropCfg {
    dropId = 6031,
    dropType = 1,
    dataId = 5004,
    probability = 200,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 1
    };
getRow(693)->
    #dropCfg {
    dropId = 6032,
    dropType = 2,
    dataId = 1,
    probability = 257,
    career = 0,
    sex = 0,
    min = 100,
    max = 100,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(694)->
    #dropCfg {
    dropId = 6032,
    dropType = 2,
    dataId = 1,
    probability = 154,
    career = 0,
    sex = 0,
    min = 250,
    max = 250,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(695)->
    #dropCfg {
    dropId = 6032,
    dropType = 2,
    dataId = 1,
    probability = 103,
    career = 0,
    sex = 0,
    min = 500,
    max = 500,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(696)->
    #dropCfg {
    dropId = 6032,
    dropType = 2,
    dataId = 1,
    probability = 5,
    career = 0,
    sex = 0,
    min = 2000,
    max = 2000,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(697)->
    #dropCfg {
    dropId = 6032,
    dropType = 1,
    dataId = 6500,
    probability = 1,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(698)->
    #dropCfg {
    dropId = 6032,
    dropType = 1,
    dataId = 284001,
    probability = 1,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(699)->
    #dropCfg {
    dropId = 6032,
    dropType = 1,
    dataId = 6002,
    probability = 10,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(700)->
    #dropCfg {
    dropId = 6032,
    dropType = 1,
    dataId = 5004,
    probability = 200,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 1
    };
getRow(701)->
    #dropCfg {
    dropId = 6033,
    dropType = 2,
    dataId = 1,
    probability = 264,
    career = 0,
    sex = 0,
    min = 100,
    max = 100,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(702)->
    #dropCfg {
    dropId = 6033,
    dropType = 2,
    dataId = 1,
    probability = 159,
    career = 0,
    sex = 0,
    min = 250,
    max = 250,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(703)->
    #dropCfg {
    dropId = 6033,
    dropType = 2,
    dataId = 1,
    probability = 106,
    career = 0,
    sex = 0,
    min = 500,
    max = 500,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(704)->
    #dropCfg {
    dropId = 6033,
    dropType = 2,
    dataId = 1,
    probability = 5,
    career = 0,
    sex = 0,
    min = 2000,
    max = 2000,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(705)->
    #dropCfg {
    dropId = 6033,
    dropType = 1,
    dataId = 6500,
    probability = 1,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(706)->
    #dropCfg {
    dropId = 6033,
    dropType = 1,
    dataId = 284001,
    probability = 1,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(707)->
    #dropCfg {
    dropId = 6033,
    dropType = 1,
    dataId = 6002,
    probability = 10,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(708)->
    #dropCfg {
    dropId = 6033,
    dropType = 1,
    dataId = 5004,
    probability = 200,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 1
    };
getRow(709)->
    #dropCfg {
    dropId = 6034,
    dropType = 2,
    dataId = 1,
    probability = 272,
    career = 0,
    sex = 0,
    min = 100,
    max = 100,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(710)->
    #dropCfg {
    dropId = 6034,
    dropType = 2,
    dataId = 1,
    probability = 163,
    career = 0,
    sex = 0,
    min = 250,
    max = 250,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(711)->
    #dropCfg {
    dropId = 6034,
    dropType = 2,
    dataId = 1,
    probability = 109,
    career = 0,
    sex = 0,
    min = 500,
    max = 500,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(712)->
    #dropCfg {
    dropId = 6034,
    dropType = 2,
    dataId = 1,
    probability = 5,
    career = 0,
    sex = 0,
    min = 2000,
    max = 2000,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(713)->
    #dropCfg {
    dropId = 6034,
    dropType = 1,
    dataId = 6500,
    probability = 1,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(714)->
    #dropCfg {
    dropId = 6034,
    dropType = 1,
    dataId = 284001,
    probability = 1,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(715)->
    #dropCfg {
    dropId = 6034,
    dropType = 1,
    dataId = 6002,
    probability = 10,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(716)->
    #dropCfg {
    dropId = 6034,
    dropType = 1,
    dataId = 5004,
    probability = 200,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 1
    };
getRow(717)->
    #dropCfg {
    dropId = 6035,
    dropType = 2,
    dataId = 1,
    probability = 279,
    career = 0,
    sex = 0,
    min = 100,
    max = 100,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(718)->
    #dropCfg {
    dropId = 6035,
    dropType = 2,
    dataId = 1,
    probability = 168,
    career = 0,
    sex = 0,
    min = 250,
    max = 250,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(719)->
    #dropCfg {
    dropId = 6035,
    dropType = 2,
    dataId = 1,
    probability = 112,
    career = 0,
    sex = 0,
    min = 500,
    max = 500,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(720)->
    #dropCfg {
    dropId = 6035,
    dropType = 2,
    dataId = 1,
    probability = 6,
    career = 0,
    sex = 0,
    min = 2000,
    max = 2000,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(721)->
    #dropCfg {
    dropId = 6035,
    dropType = 1,
    dataId = 6500,
    probability = 1,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(722)->
    #dropCfg {
    dropId = 6035,
    dropType = 1,
    dataId = 284001,
    probability = 1,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(723)->
    #dropCfg {
    dropId = 6035,
    dropType = 1,
    dataId = 6002,
    probability = 10,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(724)->
    #dropCfg {
    dropId = 6035,
    dropType = 1,
    dataId = 5004,
    probability = 200,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 1
    };
getRow(725)->
    #dropCfg {
    dropId = 6036,
    dropType = 2,
    dataId = 1,
    probability = 287,
    career = 0,
    sex = 0,
    min = 100,
    max = 100,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(726)->
    #dropCfg {
    dropId = 6036,
    dropType = 2,
    dataId = 1,
    probability = 172,
    career = 0,
    sex = 0,
    min = 250,
    max = 250,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(727)->
    #dropCfg {
    dropId = 6036,
    dropType = 2,
    dataId = 1,
    probability = 115,
    career = 0,
    sex = 0,
    min = 500,
    max = 500,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(728)->
    #dropCfg {
    dropId = 6036,
    dropType = 2,
    dataId = 1,
    probability = 6,
    career = 0,
    sex = 0,
    min = 2000,
    max = 2000,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(729)->
    #dropCfg {
    dropId = 6036,
    dropType = 1,
    dataId = 6500,
    probability = 1,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(730)->
    #dropCfg {
    dropId = 6036,
    dropType = 1,
    dataId = 284001,
    probability = 1,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(731)->
    #dropCfg {
    dropId = 6036,
    dropType = 1,
    dataId = 6002,
    probability = 10,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(732)->
    #dropCfg {
    dropId = 6036,
    dropType = 1,
    dataId = 5004,
    probability = 200,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 1
    };
getRow(733)->
    #dropCfg {
    dropId = 6037,
    dropType = 2,
    dataId = 1,
    probability = 294,
    career = 0,
    sex = 0,
    min = 100,
    max = 100,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(734)->
    #dropCfg {
    dropId = 6037,
    dropType = 2,
    dataId = 1,
    probability = 176,
    career = 0,
    sex = 0,
    min = 250,
    max = 250,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(735)->
    #dropCfg {
    dropId = 6037,
    dropType = 2,
    dataId = 1,
    probability = 118,
    career = 0,
    sex = 0,
    min = 500,
    max = 500,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(736)->
    #dropCfg {
    dropId = 6037,
    dropType = 2,
    dataId = 1,
    probability = 6,
    career = 0,
    sex = 0,
    min = 2000,
    max = 2000,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(737)->
    #dropCfg {
    dropId = 6037,
    dropType = 1,
    dataId = 6500,
    probability = 1,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(738)->
    #dropCfg {
    dropId = 6037,
    dropType = 1,
    dataId = 284001,
    probability = 1,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(739)->
    #dropCfg {
    dropId = 6037,
    dropType = 1,
    dataId = 6002,
    probability = 10,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(740)->
    #dropCfg {
    dropId = 6037,
    dropType = 1,
    dataId = 5004,
    probability = 200,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 1
    };
getRow(741)->
    #dropCfg {
    dropId = 6038,
    dropType = 2,
    dataId = 1,
    probability = 301,
    career = 0,
    sex = 0,
    min = 100,
    max = 100,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(742)->
    #dropCfg {
    dropId = 6038,
    dropType = 2,
    dataId = 1,
    probability = 181,
    career = 0,
    sex = 0,
    min = 250,
    max = 250,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(743)->
    #dropCfg {
    dropId = 6038,
    dropType = 2,
    dataId = 1,
    probability = 121,
    career = 0,
    sex = 0,
    min = 500,
    max = 500,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(744)->
    #dropCfg {
    dropId = 6038,
    dropType = 2,
    dataId = 1,
    probability = 6,
    career = 0,
    sex = 0,
    min = 2000,
    max = 2000,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(745)->
    #dropCfg {
    dropId = 6038,
    dropType = 1,
    dataId = 6500,
    probability = 1,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(746)->
    #dropCfg {
    dropId = 6038,
    dropType = 1,
    dataId = 284001,
    probability = 1,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(747)->
    #dropCfg {
    dropId = 6038,
    dropType = 1,
    dataId = 6000,
    probability = 10,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(748)->
    #dropCfg {
    dropId = 6038,
    dropType = 1,
    dataId = 5004,
    probability = 200,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 1
    };
getRow(749)->
    #dropCfg {
    dropId = 6039,
    dropType = 2,
    dataId = 1,
    probability = 309,
    career = 0,
    sex = 0,
    min = 100,
    max = 100,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(750)->
    #dropCfg {
    dropId = 6039,
    dropType = 2,
    dataId = 1,
    probability = 185,
    career = 0,
    sex = 0,
    min = 250,
    max = 250,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(751)->
    #dropCfg {
    dropId = 6039,
    dropType = 2,
    dataId = 1,
    probability = 124,
    career = 0,
    sex = 0,
    min = 500,
    max = 500,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(752)->
    #dropCfg {
    dropId = 6039,
    dropType = 2,
    dataId = 1,
    probability = 6,
    career = 0,
    sex = 0,
    min = 2000,
    max = 2000,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(753)->
    #dropCfg {
    dropId = 6039,
    dropType = 1,
    dataId = 6500,
    probability = 1,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(754)->
    #dropCfg {
    dropId = 6039,
    dropType = 1,
    dataId = 284001,
    probability = 1,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(755)->
    #dropCfg {
    dropId = 6039,
    dropType = 1,
    dataId = 6000,
    probability = 10,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(756)->
    #dropCfg {
    dropId = 6039,
    dropType = 1,
    dataId = 5004,
    probability = 200,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 1
    };
getRow(757)->
    #dropCfg {
    dropId = 6040,
    dropType = 2,
    dataId = 1,
    probability = 319,
    career = 0,
    sex = 0,
    min = 100,
    max = 100,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(758)->
    #dropCfg {
    dropId = 6040,
    dropType = 2,
    dataId = 1,
    probability = 192,
    career = 0,
    sex = 0,
    min = 250,
    max = 250,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(759)->
    #dropCfg {
    dropId = 6040,
    dropType = 2,
    dataId = 1,
    probability = 128,
    career = 0,
    sex = 0,
    min = 500,
    max = 500,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(760)->
    #dropCfg {
    dropId = 6040,
    dropType = 2,
    dataId = 1,
    probability = 6,
    career = 0,
    sex = 0,
    min = 2000,
    max = 2000,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(761)->
    #dropCfg {
    dropId = 6040,
    dropType = 1,
    dataId = 6500,
    probability = 1,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(762)->
    #dropCfg {
    dropId = 6040,
    dropType = 1,
    dataId = 284002,
    probability = 1,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(763)->
    #dropCfg {
    dropId = 6040,
    dropType = 1,
    dataId = 6000,
    probability = 10,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(764)->
    #dropCfg {
    dropId = 6040,
    dropType = 1,
    dataId = 5004,
    probability = 200,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 1
    };
getRow(765)->
    #dropCfg {
    dropId = 6041,
    dropType = 2,
    dataId = 1,
    probability = 330,
    career = 0,
    sex = 0,
    min = 100,
    max = 100,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(766)->
    #dropCfg {
    dropId = 6041,
    dropType = 2,
    dataId = 1,
    probability = 198,
    career = 0,
    sex = 0,
    min = 250,
    max = 250,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(767)->
    #dropCfg {
    dropId = 6041,
    dropType = 2,
    dataId = 1,
    probability = 132,
    career = 0,
    sex = 0,
    min = 500,
    max = 500,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(768)->
    #dropCfg {
    dropId = 6041,
    dropType = 2,
    dataId = 1,
    probability = 7,
    career = 0,
    sex = 0,
    min = 2000,
    max = 2000,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(769)->
    #dropCfg {
    dropId = 6041,
    dropType = 1,
    dataId = 6500,
    probability = 1,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(770)->
    #dropCfg {
    dropId = 6041,
    dropType = 1,
    dataId = 284002,
    probability = 1,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(771)->
    #dropCfg {
    dropId = 6041,
    dropType = 1,
    dataId = 6000,
    probability = 10,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(772)->
    #dropCfg {
    dropId = 6041,
    dropType = 1,
    dataId = 5004,
    probability = 200,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 1
    };
getRow(773)->
    #dropCfg {
    dropId = 6042,
    dropType = 2,
    dataId = 1,
    probability = 340,
    career = 0,
    sex = 0,
    min = 100,
    max = 100,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(774)->
    #dropCfg {
    dropId = 6042,
    dropType = 2,
    dataId = 1,
    probability = 204,
    career = 0,
    sex = 0,
    min = 250,
    max = 250,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(775)->
    #dropCfg {
    dropId = 6042,
    dropType = 2,
    dataId = 1,
    probability = 136,
    career = 0,
    sex = 0,
    min = 500,
    max = 500,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(776)->
    #dropCfg {
    dropId = 6042,
    dropType = 2,
    dataId = 1,
    probability = 7,
    career = 0,
    sex = 0,
    min = 2000,
    max = 2000,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(777)->
    #dropCfg {
    dropId = 6042,
    dropType = 1,
    dataId = 6500,
    probability = 1,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(778)->
    #dropCfg {
    dropId = 6042,
    dropType = 1,
    dataId = 284002,
    probability = 1,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(779)->
    #dropCfg {
    dropId = 6042,
    dropType = 1,
    dataId = 6000,
    probability = 10,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(780)->
    #dropCfg {
    dropId = 6042,
    dropType = 1,
    dataId = 5004,
    probability = 200,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 1
    };
getRow(781)->
    #dropCfg {
    dropId = 6043,
    dropType = 2,
    dataId = 1,
    probability = 350,
    career = 0,
    sex = 0,
    min = 100,
    max = 100,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(782)->
    #dropCfg {
    dropId = 6043,
    dropType = 2,
    dataId = 1,
    probability = 210,
    career = 0,
    sex = 0,
    min = 250,
    max = 250,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(783)->
    #dropCfg {
    dropId = 6043,
    dropType = 2,
    dataId = 1,
    probability = 140,
    career = 0,
    sex = 0,
    min = 500,
    max = 500,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(784)->
    #dropCfg {
    dropId = 6043,
    dropType = 2,
    dataId = 1,
    probability = 7,
    career = 0,
    sex = 0,
    min = 2000,
    max = 2000,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(785)->
    #dropCfg {
    dropId = 6043,
    dropType = 1,
    dataId = 6500,
    probability = 1,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(786)->
    #dropCfg {
    dropId = 6043,
    dropType = 1,
    dataId = 284002,
    probability = 1,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(787)->
    #dropCfg {
    dropId = 6043,
    dropType = 1,
    dataId = 6000,
    probability = 10,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(788)->
    #dropCfg {
    dropId = 6043,
    dropType = 1,
    dataId = 5004,
    probability = 200,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 1
    };
getRow(789)->
    #dropCfg {
    dropId = 6044,
    dropType = 2,
    dataId = 1,
    probability = 361,
    career = 0,
    sex = 0,
    min = 100,
    max = 100,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(790)->
    #dropCfg {
    dropId = 6044,
    dropType = 2,
    dataId = 1,
    probability = 217,
    career = 0,
    sex = 0,
    min = 250,
    max = 250,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(791)->
    #dropCfg {
    dropId = 6044,
    dropType = 2,
    dataId = 1,
    probability = 144,
    career = 0,
    sex = 0,
    min = 500,
    max = 500,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(792)->
    #dropCfg {
    dropId = 6044,
    dropType = 2,
    dataId = 1,
    probability = 7,
    career = 0,
    sex = 0,
    min = 2000,
    max = 2000,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(793)->
    #dropCfg {
    dropId = 6044,
    dropType = 1,
    dataId = 6500,
    probability = 1,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(794)->
    #dropCfg {
    dropId = 6044,
    dropType = 1,
    dataId = 284002,
    probability = 1,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(795)->
    #dropCfg {
    dropId = 6044,
    dropType = 1,
    dataId = 6000,
    probability = 10,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(796)->
    #dropCfg {
    dropId = 6044,
    dropType = 1,
    dataId = 5004,
    probability = 200,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 1
    };
getRow(797)->
    #dropCfg {
    dropId = 6045,
    dropType = 2,
    dataId = 1,
    probability = 374,
    career = 0,
    sex = 0,
    min = 100,
    max = 100,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(798)->
    #dropCfg {
    dropId = 6045,
    dropType = 2,
    dataId = 1,
    probability = 225,
    career = 0,
    sex = 0,
    min = 250,
    max = 250,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(799)->
    #dropCfg {
    dropId = 6045,
    dropType = 2,
    dataId = 1,
    probability = 150,
    career = 0,
    sex = 0,
    min = 500,
    max = 500,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(800)->
    #dropCfg {
    dropId = 6045,
    dropType = 2,
    dataId = 1,
    probability = 7,
    career = 0,
    sex = 0,
    min = 2000,
    max = 2000,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(801)->
    #dropCfg {
    dropId = 6045,
    dropType = 1,
    dataId = 6500,
    probability = 1,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(802)->
    #dropCfg {
    dropId = 6045,
    dropType = 1,
    dataId = 284002,
    probability = 1,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(803)->
    #dropCfg {
    dropId = 6045,
    dropType = 1,
    dataId = 6000,
    probability = 10,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(804)->
    #dropCfg {
    dropId = 6045,
    dropType = 1,
    dataId = 5004,
    probability = 200,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 1
    };
getRow(805)->
    #dropCfg {
    dropId = 6046,
    dropType = 2,
    dataId = 1,
    probability = 388,
    career = 0,
    sex = 0,
    min = 100,
    max = 100,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(806)->
    #dropCfg {
    dropId = 6046,
    dropType = 2,
    dataId = 1,
    probability = 233,
    career = 0,
    sex = 0,
    min = 250,
    max = 250,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(807)->
    #dropCfg {
    dropId = 6046,
    dropType = 2,
    dataId = 1,
    probability = 155,
    career = 0,
    sex = 0,
    min = 500,
    max = 500,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(808)->
    #dropCfg {
    dropId = 6046,
    dropType = 2,
    dataId = 1,
    probability = 8,
    career = 0,
    sex = 0,
    min = 2000,
    max = 2000,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(809)->
    #dropCfg {
    dropId = 6046,
    dropType = 1,
    dataId = 6500,
    probability = 1,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(810)->
    #dropCfg {
    dropId = 6046,
    dropType = 1,
    dataId = 284002,
    probability = 1,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(811)->
    #dropCfg {
    dropId = 6046,
    dropType = 1,
    dataId = 6001,
    probability = 10,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(812)->
    #dropCfg {
    dropId = 6046,
    dropType = 1,
    dataId = 5004,
    probability = 200,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 1
    };
getRow(813)->
    #dropCfg {
    dropId = 6047,
    dropType = 2,
    dataId = 1,
    probability = 401,
    career = 0,
    sex = 0,
    min = 100,
    max = 100,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(814)->
    #dropCfg {
    dropId = 6047,
    dropType = 2,
    dataId = 1,
    probability = 241,
    career = 0,
    sex = 0,
    min = 250,
    max = 250,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(815)->
    #dropCfg {
    dropId = 6047,
    dropType = 2,
    dataId = 1,
    probability = 160,
    career = 0,
    sex = 0,
    min = 500,
    max = 500,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(816)->
    #dropCfg {
    dropId = 6047,
    dropType = 2,
    dataId = 1,
    probability = 8,
    career = 0,
    sex = 0,
    min = 2000,
    max = 2000,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(817)->
    #dropCfg {
    dropId = 6047,
    dropType = 1,
    dataId = 6500,
    probability = 1,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(818)->
    #dropCfg {
    dropId = 6047,
    dropType = 1,
    dataId = 284002,
    probability = 1,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(819)->
    #dropCfg {
    dropId = 6047,
    dropType = 1,
    dataId = 6001,
    probability = 10,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(820)->
    #dropCfg {
    dropId = 6047,
    dropType = 1,
    dataId = 5004,
    probability = 200,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 1
    };
getRow(821)->
    #dropCfg {
    dropId = 6048,
    dropType = 2,
    dataId = 1,
    probability = 414,
    career = 0,
    sex = 0,
    min = 100,
    max = 100,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(822)->
    #dropCfg {
    dropId = 6048,
    dropType = 2,
    dataId = 1,
    probability = 249,
    career = 0,
    sex = 0,
    min = 250,
    max = 250,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(823)->
    #dropCfg {
    dropId = 6048,
    dropType = 2,
    dataId = 1,
    probability = 166,
    career = 0,
    sex = 0,
    min = 500,
    max = 500,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(824)->
    #dropCfg {
    dropId = 6048,
    dropType = 2,
    dataId = 1,
    probability = 8,
    career = 0,
    sex = 0,
    min = 2000,
    max = 2000,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(825)->
    #dropCfg {
    dropId = 6048,
    dropType = 1,
    dataId = 6500,
    probability = 1,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(826)->
    #dropCfg {
    dropId = 6048,
    dropType = 1,
    dataId = 284002,
    probability = 1,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(827)->
    #dropCfg {
    dropId = 6048,
    dropType = 1,
    dataId = 6001,
    probability = 10,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(828)->
    #dropCfg {
    dropId = 6048,
    dropType = 1,
    dataId = 5004,
    probability = 200,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 1
    };
getRow(829)->
    #dropCfg {
    dropId = 6049,
    dropType = 2,
    dataId = 1,
    probability = 428,
    career = 0,
    sex = 0,
    min = 100,
    max = 100,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(830)->
    #dropCfg {
    dropId = 6049,
    dropType = 2,
    dataId = 1,
    probability = 257,
    career = 0,
    sex = 0,
    min = 250,
    max = 250,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(831)->
    #dropCfg {
    dropId = 6049,
    dropType = 2,
    dataId = 1,
    probability = 171,
    career = 0,
    sex = 0,
    min = 500,
    max = 500,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(832)->
    #dropCfg {
    dropId = 6049,
    dropType = 2,
    dataId = 1,
    probability = 9,
    career = 0,
    sex = 0,
    min = 2000,
    max = 2000,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(833)->
    #dropCfg {
    dropId = 6049,
    dropType = 1,
    dataId = 6500,
    probability = 1,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(834)->
    #dropCfg {
    dropId = 6049,
    dropType = 1,
    dataId = 284002,
    probability = 1,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(835)->
    #dropCfg {
    dropId = 6049,
    dropType = 1,
    dataId = 6001,
    probability = 10,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(836)->
    #dropCfg {
    dropId = 6049,
    dropType = 1,
    dataId = 5004,
    probability = 200,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 1
    };
getRow(837)->
    #dropCfg {
    dropId = 6050,
    dropType = 2,
    dataId = 1,
    probability = 444,
    career = 0,
    sex = 0,
    min = 100,
    max = 100,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(838)->
    #dropCfg {
    dropId = 6050,
    dropType = 2,
    dataId = 1,
    probability = 266,
    career = 0,
    sex = 0,
    min = 250,
    max = 250,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(839)->
    #dropCfg {
    dropId = 6050,
    dropType = 2,
    dataId = 1,
    probability = 178,
    career = 0,
    sex = 0,
    min = 500,
    max = 500,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(840)->
    #dropCfg {
    dropId = 6050,
    dropType = 2,
    dataId = 1,
    probability = 9,
    career = 0,
    sex = 0,
    min = 2000,
    max = 2000,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(841)->
    #dropCfg {
    dropId = 6050,
    dropType = 1,
    dataId = 6500,
    probability = 1,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(842)->
    #dropCfg {
    dropId = 6050,
    dropType = 1,
    dataId = 284002,
    probability = 1,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(843)->
    #dropCfg {
    dropId = 6050,
    dropType = 1,
    dataId = 6002,
    probability = 10,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(844)->
    #dropCfg {
    dropId = 6050,
    dropType = 1,
    dataId = 5004,
    probability = 200,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 1
    };
getRow(845)->
    #dropCfg {
    dropId = 6051,
    dropType = 2,
    dataId = 1,
    probability = 460,
    career = 0,
    sex = 0,
    min = 100,
    max = 100,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(846)->
    #dropCfg {
    dropId = 6051,
    dropType = 2,
    dataId = 1,
    probability = 276,
    career = 0,
    sex = 0,
    min = 250,
    max = 250,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(847)->
    #dropCfg {
    dropId = 6051,
    dropType = 2,
    dataId = 1,
    probability = 184,
    career = 0,
    sex = 0,
    min = 500,
    max = 500,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(848)->
    #dropCfg {
    dropId = 6051,
    dropType = 2,
    dataId = 1,
    probability = 9,
    career = 0,
    sex = 0,
    min = 2000,
    max = 2000,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(849)->
    #dropCfg {
    dropId = 6051,
    dropType = 1,
    dataId = 6500,
    probability = 2,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(850)->
    #dropCfg {
    dropId = 6051,
    dropType = 1,
    dataId = 284002,
    probability = 1,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(851)->
    #dropCfg {
    dropId = 6051,
    dropType = 1,
    dataId = 6002,
    probability = 10,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(852)->
    #dropCfg {
    dropId = 6051,
    dropType = 1,
    dataId = 5004,
    probability = 200,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 1
    };
getRow(853)->
    #dropCfg {
    dropId = 6052,
    dropType = 2,
    dataId = 1,
    probability = 477,
    career = 0,
    sex = 0,
    min = 100,
    max = 100,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(854)->
    #dropCfg {
    dropId = 6052,
    dropType = 2,
    dataId = 1,
    probability = 286,
    career = 0,
    sex = 0,
    min = 250,
    max = 250,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(855)->
    #dropCfg {
    dropId = 6052,
    dropType = 2,
    dataId = 1,
    probability = 191,
    career = 0,
    sex = 0,
    min = 500,
    max = 500,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(856)->
    #dropCfg {
    dropId = 6052,
    dropType = 2,
    dataId = 1,
    probability = 10,
    career = 0,
    sex = 0,
    min = 2000,
    max = 2000,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(857)->
    #dropCfg {
    dropId = 6052,
    dropType = 1,
    dataId = 6500,
    probability = 2,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(858)->
    #dropCfg {
    dropId = 6052,
    dropType = 1,
    dataId = 284002,
    probability = 1,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(859)->
    #dropCfg {
    dropId = 6052,
    dropType = 1,
    dataId = 6002,
    probability = 10,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(860)->
    #dropCfg {
    dropId = 6052,
    dropType = 1,
    dataId = 5004,
    probability = 200,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 1
    };
getRow(861)->
    #dropCfg {
    dropId = 6053,
    dropType = 2,
    dataId = 1,
    probability = 493,
    career = 0,
    sex = 0,
    min = 100,
    max = 100,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(862)->
    #dropCfg {
    dropId = 6053,
    dropType = 2,
    dataId = 1,
    probability = 296,
    career = 0,
    sex = 0,
    min = 250,
    max = 250,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(863)->
    #dropCfg {
    dropId = 6053,
    dropType = 2,
    dataId = 1,
    probability = 197,
    career = 0,
    sex = 0,
    min = 500,
    max = 500,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(864)->
    #dropCfg {
    dropId = 6053,
    dropType = 2,
    dataId = 1,
    probability = 10,
    career = 0,
    sex = 0,
    min = 2000,
    max = 2000,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(865)->
    #dropCfg {
    dropId = 6053,
    dropType = 1,
    dataId = 6500,
    probability = 2,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(866)->
    #dropCfg {
    dropId = 6053,
    dropType = 1,
    dataId = 284002,
    probability = 1,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(867)->
    #dropCfg {
    dropId = 6053,
    dropType = 1,
    dataId = 6002,
    probability = 10,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(868)->
    #dropCfg {
    dropId = 6053,
    dropType = 1,
    dataId = 5004,
    probability = 200,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 1
    };
getRow(869)->
    #dropCfg {
    dropId = 6054,
    dropType = 2,
    dataId = 1,
    probability = 509,
    career = 0,
    sex = 0,
    min = 100,
    max = 100,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(870)->
    #dropCfg {
    dropId = 6054,
    dropType = 2,
    dataId = 1,
    probability = 306,
    career = 0,
    sex = 0,
    min = 250,
    max = 250,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(871)->
    #dropCfg {
    dropId = 6054,
    dropType = 2,
    dataId = 1,
    probability = 204,
    career = 0,
    sex = 0,
    min = 500,
    max = 500,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(872)->
    #dropCfg {
    dropId = 6054,
    dropType = 2,
    dataId = 1,
    probability = 10,
    career = 0,
    sex = 0,
    min = 2000,
    max = 2000,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(873)->
    #dropCfg {
    dropId = 6054,
    dropType = 1,
    dataId = 6500,
    probability = 2,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(874)->
    #dropCfg {
    dropId = 6054,
    dropType = 1,
    dataId = 284002,
    probability = 1,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(875)->
    #dropCfg {
    dropId = 6054,
    dropType = 1,
    dataId = 6002,
    probability = 10,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(876)->
    #dropCfg {
    dropId = 6054,
    dropType = 1,
    dataId = 5004,
    probability = 200,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 1
    };
getRow(877)->
    #dropCfg {
    dropId = 6055,
    dropType = 2,
    dataId = 1,
    probability = 529,
    career = 0,
    sex = 0,
    min = 100,
    max = 100,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(878)->
    #dropCfg {
    dropId = 6055,
    dropType = 2,
    dataId = 1,
    probability = 317,
    career = 0,
    sex = 0,
    min = 250,
    max = 250,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(879)->
    #dropCfg {
    dropId = 6055,
    dropType = 2,
    dataId = 1,
    probability = 211,
    career = 0,
    sex = 0,
    min = 500,
    max = 500,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(880)->
    #dropCfg {
    dropId = 6055,
    dropType = 2,
    dataId = 1,
    probability = 11,
    career = 0,
    sex = 0,
    min = 2000,
    max = 2000,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(881)->
    #dropCfg {
    dropId = 6055,
    dropType = 1,
    dataId = 6500,
    probability = 2,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(882)->
    #dropCfg {
    dropId = 6055,
    dropType = 1,
    dataId = 284003,
    probability = 1,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(883)->
    #dropCfg {
    dropId = 6055,
    dropType = 1,
    dataId = 6002,
    probability = 10,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(884)->
    #dropCfg {
    dropId = 6055,
    dropType = 1,
    dataId = 5004,
    probability = 200,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 1
    };
getRow(885)->
    #dropCfg {
    dropId = 6056,
    dropType = 2,
    dataId = 1,
    probability = 548,
    career = 0,
    sex = 0,
    min = 100,
    max = 100,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(886)->
    #dropCfg {
    dropId = 6056,
    dropType = 2,
    dataId = 1,
    probability = 329,
    career = 0,
    sex = 0,
    min = 250,
    max = 250,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(887)->
    #dropCfg {
    dropId = 6056,
    dropType = 2,
    dataId = 1,
    probability = 219,
    career = 0,
    sex = 0,
    min = 500,
    max = 500,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(888)->
    #dropCfg {
    dropId = 6056,
    dropType = 2,
    dataId = 1,
    probability = 11,
    career = 0,
    sex = 0,
    min = 2000,
    max = 2000,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(889)->
    #dropCfg {
    dropId = 6056,
    dropType = 1,
    dataId = 6500,
    probability = 2,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(890)->
    #dropCfg {
    dropId = 6056,
    dropType = 1,
    dataId = 284003,
    probability = 1,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(891)->
    #dropCfg {
    dropId = 6056,
    dropType = 1,
    dataId = 6002,
    probability = 10,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(892)->
    #dropCfg {
    dropId = 6056,
    dropType = 1,
    dataId = 5004,
    probability = 200,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 1
    };
getRow(893)->
    #dropCfg {
    dropId = 6057,
    dropType = 2,
    dataId = 1,
    probability = 567,
    career = 0,
    sex = 0,
    min = 100,
    max = 100,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(894)->
    #dropCfg {
    dropId = 6057,
    dropType = 2,
    dataId = 1,
    probability = 340,
    career = 0,
    sex = 0,
    min = 250,
    max = 250,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(895)->
    #dropCfg {
    dropId = 6057,
    dropType = 2,
    dataId = 1,
    probability = 227,
    career = 0,
    sex = 0,
    min = 500,
    max = 500,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(896)->
    #dropCfg {
    dropId = 6057,
    dropType = 2,
    dataId = 1,
    probability = 11,
    career = 0,
    sex = 0,
    min = 2000,
    max = 2000,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(897)->
    #dropCfg {
    dropId = 6057,
    dropType = 1,
    dataId = 6500,
    probability = 2,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(898)->
    #dropCfg {
    dropId = 6057,
    dropType = 1,
    dataId = 284003,
    probability = 1,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(899)->
    #dropCfg {
    dropId = 6057,
    dropType = 1,
    dataId = 6002,
    probability = 10,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(900)->
    #dropCfg {
    dropId = 6057,
    dropType = 1,
    dataId = 5004,
    probability = 200,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 1
    };
getRow(901)->
    #dropCfg {
    dropId = 6058,
    dropType = 2,
    dataId = 1,
    probability = 587,
    career = 0,
    sex = 0,
    min = 100,
    max = 100,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(902)->
    #dropCfg {
    dropId = 6058,
    dropType = 2,
    dataId = 1,
    probability = 352,
    career = 0,
    sex = 0,
    min = 250,
    max = 250,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(903)->
    #dropCfg {
    dropId = 6058,
    dropType = 2,
    dataId = 1,
    probability = 235,
    career = 0,
    sex = 0,
    min = 500,
    max = 500,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(904)->
    #dropCfg {
    dropId = 6058,
    dropType = 2,
    dataId = 1,
    probability = 12,
    career = 0,
    sex = 0,
    min = 2000,
    max = 2000,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(905)->
    #dropCfg {
    dropId = 6058,
    dropType = 1,
    dataId = 6500,
    probability = 2,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(906)->
    #dropCfg {
    dropId = 6058,
    dropType = 1,
    dataId = 284003,
    probability = 1,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(907)->
    #dropCfg {
    dropId = 6058,
    dropType = 1,
    dataId = 6002,
    probability = 10,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(908)->
    #dropCfg {
    dropId = 6058,
    dropType = 1,
    dataId = 5004,
    probability = 200,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 1
    };
getRow(909)->
    #dropCfg {
    dropId = 6059,
    dropType = 2,
    dataId = 1,
    probability = 606,
    career = 0,
    sex = 0,
    min = 100,
    max = 100,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(910)->
    #dropCfg {
    dropId = 6059,
    dropType = 2,
    dataId = 1,
    probability = 364,
    career = 0,
    sex = 0,
    min = 250,
    max = 250,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(911)->
    #dropCfg {
    dropId = 6059,
    dropType = 2,
    dataId = 1,
    probability = 242,
    career = 0,
    sex = 0,
    min = 500,
    max = 500,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(912)->
    #dropCfg {
    dropId = 6059,
    dropType = 2,
    dataId = 1,
    probability = 12,
    career = 0,
    sex = 0,
    min = 2000,
    max = 2000,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(913)->
    #dropCfg {
    dropId = 6059,
    dropType = 1,
    dataId = 6500,
    probability = 2,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(914)->
    #dropCfg {
    dropId = 6059,
    dropType = 1,
    dataId = 284003,
    probability = 1,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(915)->
    #dropCfg {
    dropId = 6059,
    dropType = 1,
    dataId = 6002,
    probability = 10,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(916)->
    #dropCfg {
    dropId = 6059,
    dropType = 1,
    dataId = 5004,
    probability = 200,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 1
    };
getRow(917)->
    #dropCfg {
    dropId = 6060,
    dropType = 2,
    dataId = 1,
    probability = 628,
    career = 0,
    sex = 0,
    min = 100,
    max = 100,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(918)->
    #dropCfg {
    dropId = 6060,
    dropType = 2,
    dataId = 1,
    probability = 377,
    career = 0,
    sex = 0,
    min = 250,
    max = 250,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(919)->
    #dropCfg {
    dropId = 6060,
    dropType = 2,
    dataId = 1,
    probability = 251,
    career = 0,
    sex = 0,
    min = 500,
    max = 500,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(920)->
    #dropCfg {
    dropId = 6060,
    dropType = 2,
    dataId = 1,
    probability = 13,
    career = 0,
    sex = 0,
    min = 2000,
    max = 2000,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(921)->
    #dropCfg {
    dropId = 6060,
    dropType = 1,
    dataId = 6500,
    probability = 2,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(922)->
    #dropCfg {
    dropId = 6060,
    dropType = 1,
    dataId = 284003,
    probability = 1,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(923)->
    #dropCfg {
    dropId = 6060,
    dropType = 1,
    dataId = 6002,
    probability = 10,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(924)->
    #dropCfg {
    dropId = 6060,
    dropType = 1,
    dataId = 5004,
    probability = 200,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 1
    };
getRow(925)->
    #dropCfg {
    dropId = 6061,
    dropType = 2,
    dataId = 1,
    probability = 650,
    career = 0,
    sex = 0,
    min = 100,
    max = 100,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(926)->
    #dropCfg {
    dropId = 6061,
    dropType = 2,
    dataId = 1,
    probability = 390,
    career = 0,
    sex = 0,
    min = 250,
    max = 250,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(927)->
    #dropCfg {
    dropId = 6061,
    dropType = 2,
    dataId = 1,
    probability = 260,
    career = 0,
    sex = 0,
    min = 500,
    max = 500,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(928)->
    #dropCfg {
    dropId = 6061,
    dropType = 2,
    dataId = 1,
    probability = 13,
    career = 0,
    sex = 0,
    min = 2000,
    max = 2000,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(929)->
    #dropCfg {
    dropId = 6061,
    dropType = 1,
    dataId = 6500,
    probability = 2,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(930)->
    #dropCfg {
    dropId = 6061,
    dropType = 1,
    dataId = 284003,
    probability = 1,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(931)->
    #dropCfg {
    dropId = 6061,
    dropType = 1,
    dataId = 6002,
    probability = 10,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(932)->
    #dropCfg {
    dropId = 6061,
    dropType = 1,
    dataId = 5004,
    probability = 200,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 1
    };
getRow(933)->
    #dropCfg {
    dropId = 6062,
    dropType = 2,
    dataId = 1,
    probability = 673,
    career = 0,
    sex = 0,
    min = 100,
    max = 100,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(934)->
    #dropCfg {
    dropId = 6062,
    dropType = 2,
    dataId = 1,
    probability = 404,
    career = 0,
    sex = 0,
    min = 250,
    max = 250,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(935)->
    #dropCfg {
    dropId = 6062,
    dropType = 2,
    dataId = 1,
    probability = 269,
    career = 0,
    sex = 0,
    min = 500,
    max = 500,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(936)->
    #dropCfg {
    dropId = 6062,
    dropType = 2,
    dataId = 1,
    probability = 13,
    career = 0,
    sex = 0,
    min = 2000,
    max = 2000,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(937)->
    #dropCfg {
    dropId = 6062,
    dropType = 1,
    dataId = 6500,
    probability = 2,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(938)->
    #dropCfg {
    dropId = 6062,
    dropType = 1,
    dataId = 284003,
    probability = 1,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(939)->
    #dropCfg {
    dropId = 6062,
    dropType = 1,
    dataId = 6002,
    probability = 10,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(940)->
    #dropCfg {
    dropId = 6062,
    dropType = 1,
    dataId = 5004,
    probability = 200,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 1
    };
getRow(941)->
    #dropCfg {
    dropId = 6063,
    dropType = 2,
    dataId = 1,
    probability = 695,
    career = 0,
    sex = 0,
    min = 100,
    max = 100,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(942)->
    #dropCfg {
    dropId = 6063,
    dropType = 2,
    dataId = 1,
    probability = 417,
    career = 0,
    sex = 0,
    min = 250,
    max = 250,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(943)->
    #dropCfg {
    dropId = 6063,
    dropType = 2,
    dataId = 1,
    probability = 278,
    career = 0,
    sex = 0,
    min = 500,
    max = 500,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(944)->
    #dropCfg {
    dropId = 6063,
    dropType = 2,
    dataId = 1,
    probability = 14,
    career = 0,
    sex = 0,
    min = 2000,
    max = 2000,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(945)->
    #dropCfg {
    dropId = 6063,
    dropType = 1,
    dataId = 6500,
    probability = 2,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(946)->
    #dropCfg {
    dropId = 6063,
    dropType = 1,
    dataId = 284003,
    probability = 1,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(947)->
    #dropCfg {
    dropId = 6063,
    dropType = 1,
    dataId = 6002,
    probability = 10,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(948)->
    #dropCfg {
    dropId = 6063,
    dropType = 1,
    dataId = 5004,
    probability = 200,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 1
    };
getRow(949)->
    #dropCfg {
    dropId = 6064,
    dropType = 2,
    dataId = 1,
    probability = 717,
    career = 0,
    sex = 0,
    min = 100,
    max = 100,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(950)->
    #dropCfg {
    dropId = 6064,
    dropType = 2,
    dataId = 1,
    probability = 430,
    career = 0,
    sex = 0,
    min = 250,
    max = 250,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(951)->
    #dropCfg {
    dropId = 6064,
    dropType = 2,
    dataId = 1,
    probability = 287,
    career = 0,
    sex = 0,
    min = 500,
    max = 500,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(952)->
    #dropCfg {
    dropId = 6064,
    dropType = 2,
    dataId = 1,
    probability = 14,
    career = 0,
    sex = 0,
    min = 2000,
    max = 2000,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(953)->
    #dropCfg {
    dropId = 6064,
    dropType = 1,
    dataId = 6500,
    probability = 2,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(954)->
    #dropCfg {
    dropId = 6064,
    dropType = 1,
    dataId = 284003,
    probability = 1,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(955)->
    #dropCfg {
    dropId = 6064,
    dropType = 1,
    dataId = 6002,
    probability = 10,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(956)->
    #dropCfg {
    dropId = 6064,
    dropType = 1,
    dataId = 5004,
    probability = 200,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 1
    };
getRow(957)->
    #dropCfg {
    dropId = 6065,
    dropType = 2,
    dataId = 1,
    probability = 743,
    career = 0,
    sex = 0,
    min = 100,
    max = 100,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(958)->
    #dropCfg {
    dropId = 6065,
    dropType = 2,
    dataId = 1,
    probability = 446,
    career = 0,
    sex = 0,
    min = 250,
    max = 250,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(959)->
    #dropCfg {
    dropId = 6065,
    dropType = 2,
    dataId = 1,
    probability = 297,
    career = 0,
    sex = 0,
    min = 500,
    max = 500,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(960)->
    #dropCfg {
    dropId = 6065,
    dropType = 2,
    dataId = 1,
    probability = 15,
    career = 0,
    sex = 0,
    min = 2000,
    max = 2000,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(961)->
    #dropCfg {
    dropId = 6065,
    dropType = 1,
    dataId = 6500,
    probability = 3,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(962)->
    #dropCfg {
    dropId = 6065,
    dropType = 1,
    dataId = 284003,
    probability = 1,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(963)->
    #dropCfg {
    dropId = 6065,
    dropType = 1,
    dataId = 6002,
    probability = 10,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(964)->
    #dropCfg {
    dropId = 6065,
    dropType = 1,
    dataId = 5004,
    probability = 200,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 1
    };
getRow(965)->
    #dropCfg {
    dropId = 6066,
    dropType = 2,
    dataId = 1,
    probability = 768,
    career = 0,
    sex = 0,
    min = 100,
    max = 100,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(966)->
    #dropCfg {
    dropId = 6066,
    dropType = 2,
    dataId = 1,
    probability = 461,
    career = 0,
    sex = 0,
    min = 250,
    max = 250,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(967)->
    #dropCfg {
    dropId = 6066,
    dropType = 2,
    dataId = 1,
    probability = 307,
    career = 0,
    sex = 0,
    min = 500,
    max = 500,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(968)->
    #dropCfg {
    dropId = 6066,
    dropType = 2,
    dataId = 1,
    probability = 15,
    career = 0,
    sex = 0,
    min = 2000,
    max = 2000,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(969)->
    #dropCfg {
    dropId = 6066,
    dropType = 1,
    dataId = 6500,
    probability = 3,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(970)->
    #dropCfg {
    dropId = 6066,
    dropType = 1,
    dataId = 284003,
    probability = 1,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(971)->
    #dropCfg {
    dropId = 6066,
    dropType = 1,
    dataId = 6002,
    probability = 10,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(972)->
    #dropCfg {
    dropId = 6066,
    dropType = 1,
    dataId = 5004,
    probability = 200,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 1
    };
getRow(973)->
    #dropCfg {
    dropId = 6067,
    dropType = 2,
    dataId = 1,
    probability = 793,
    career = 0,
    sex = 0,
    min = 100,
    max = 100,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(974)->
    #dropCfg {
    dropId = 6067,
    dropType = 2,
    dataId = 1,
    probability = 476,
    career = 0,
    sex = 0,
    min = 250,
    max = 250,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(975)->
    #dropCfg {
    dropId = 6067,
    dropType = 2,
    dataId = 1,
    probability = 317,
    career = 0,
    sex = 0,
    min = 500,
    max = 500,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(976)->
    #dropCfg {
    dropId = 6067,
    dropType = 2,
    dataId = 1,
    probability = 16,
    career = 0,
    sex = 0,
    min = 2000,
    max = 2000,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(977)->
    #dropCfg {
    dropId = 6067,
    dropType = 1,
    dataId = 6500,
    probability = 3,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(978)->
    #dropCfg {
    dropId = 6067,
    dropType = 1,
    dataId = 284003,
    probability = 1,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(979)->
    #dropCfg {
    dropId = 6067,
    dropType = 1,
    dataId = 6002,
    probability = 10,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(980)->
    #dropCfg {
    dropId = 6067,
    dropType = 1,
    dataId = 5004,
    probability = 200,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 1
    };
getRow(981)->
    #dropCfg {
    dropId = 6068,
    dropType = 2,
    dataId = 1,
    probability = 818,
    career = 0,
    sex = 0,
    min = 100,
    max = 100,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(982)->
    #dropCfg {
    dropId = 6068,
    dropType = 2,
    dataId = 1,
    probability = 491,
    career = 0,
    sex = 0,
    min = 250,
    max = 250,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(983)->
    #dropCfg {
    dropId = 6068,
    dropType = 2,
    dataId = 1,
    probability = 327,
    career = 0,
    sex = 0,
    min = 500,
    max = 500,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(984)->
    #dropCfg {
    dropId = 6068,
    dropType = 2,
    dataId = 1,
    probability = 16,
    career = 0,
    sex = 0,
    min = 2000,
    max = 2000,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(985)->
    #dropCfg {
    dropId = 6068,
    dropType = 1,
    dataId = 6500,
    probability = 3,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(986)->
    #dropCfg {
    dropId = 6068,
    dropType = 1,
    dataId = 284003,
    probability = 1,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(987)->
    #dropCfg {
    dropId = 6068,
    dropType = 1,
    dataId = 6002,
    probability = 10,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(988)->
    #dropCfg {
    dropId = 6068,
    dropType = 1,
    dataId = 5004,
    probability = 200,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 1
    };
getRow(989)->
    #dropCfg {
    dropId = 6069,
    dropType = 2,
    dataId = 1,
    probability = 844,
    career = 0,
    sex = 0,
    min = 100,
    max = 100,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(990)->
    #dropCfg {
    dropId = 6069,
    dropType = 2,
    dataId = 1,
    probability = 506,
    career = 0,
    sex = 0,
    min = 250,
    max = 250,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(991)->
    #dropCfg {
    dropId = 6069,
    dropType = 2,
    dataId = 1,
    probability = 337,
    career = 0,
    sex = 0,
    min = 500,
    max = 500,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(992)->
    #dropCfg {
    dropId = 6069,
    dropType = 2,
    dataId = 1,
    probability = 17,
    career = 0,
    sex = 0,
    min = 2000,
    max = 2000,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(993)->
    #dropCfg {
    dropId = 6069,
    dropType = 1,
    dataId = 6500,
    probability = 3,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(994)->
    #dropCfg {
    dropId = 6069,
    dropType = 1,
    dataId = 284003,
    probability = 1,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(995)->
    #dropCfg {
    dropId = 6069,
    dropType = 1,
    dataId = 6002,
    probability = 10,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(996)->
    #dropCfg {
    dropId = 6069,
    dropType = 1,
    dataId = 5004,
    probability = 200,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 1
    };
getRow(997)->
    #dropCfg {
    dropId = 6070,
    dropType = 2,
    dataId = 1,
    probability = 872,
    career = 0,
    sex = 0,
    min = 100,
    max = 100,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(998)->
    #dropCfg {
    dropId = 6070,
    dropType = 2,
    dataId = 1,
    probability = 523,
    career = 0,
    sex = 0,
    min = 250,
    max = 250,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(999)->
    #dropCfg {
    dropId = 6070,
    dropType = 2,
    dataId = 1,
    probability = 349,
    career = 0,
    sex = 0,
    min = 500,
    max = 500,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1000)->
    #dropCfg {
    dropId = 6070,
    dropType = 2,
    dataId = 1,
    probability = 17,
    career = 0,
    sex = 0,
    min = 2000,
    max = 2000,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1001)->
    #dropCfg {
    dropId = 6070,
    dropType = 1,
    dataId = 6500,
    probability = 3,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1002)->
    #dropCfg {
    dropId = 6070,
    dropType = 1,
    dataId = 284004,
    probability = 1,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1003)->
    #dropCfg {
    dropId = 6070,
    dropType = 1,
    dataId = 6002,
    probability = 10,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1004)->
    #dropCfg {
    dropId = 6070,
    dropType = 1,
    dataId = 5004,
    probability = 200,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 1
    };
getRow(1005)->
    #dropCfg {
    dropId = 6071,
    dropType = 2,
    dataId = 1,
    probability = 900,
    career = 0,
    sex = 0,
    min = 100,
    max = 100,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1006)->
    #dropCfg {
    dropId = 6071,
    dropType = 2,
    dataId = 1,
    probability = 540,
    career = 0,
    sex = 0,
    min = 250,
    max = 250,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1007)->
    #dropCfg {
    dropId = 6071,
    dropType = 2,
    dataId = 1,
    probability = 360,
    career = 0,
    sex = 0,
    min = 500,
    max = 500,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1008)->
    #dropCfg {
    dropId = 6071,
    dropType = 2,
    dataId = 1,
    probability = 18,
    career = 0,
    sex = 0,
    min = 2000,
    max = 2000,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1009)->
    #dropCfg {
    dropId = 6071,
    dropType = 1,
    dataId = 6500,
    probability = 3,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1010)->
    #dropCfg {
    dropId = 6071,
    dropType = 1,
    dataId = 284004,
    probability = 1,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1011)->
    #dropCfg {
    dropId = 6071,
    dropType = 1,
    dataId = 6002,
    probability = 10,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1012)->
    #dropCfg {
    dropId = 6071,
    dropType = 1,
    dataId = 5004,
    probability = 200,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 1
    };
getRow(1013)->
    #dropCfg {
    dropId = 6072,
    dropType = 2,
    dataId = 1,
    probability = 928,
    career = 0,
    sex = 0,
    min = 100,
    max = 100,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1014)->
    #dropCfg {
    dropId = 6072,
    dropType = 2,
    dataId = 1,
    probability = 557,
    career = 0,
    sex = 0,
    min = 250,
    max = 250,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1015)->
    #dropCfg {
    dropId = 6072,
    dropType = 2,
    dataId = 1,
    probability = 371,
    career = 0,
    sex = 0,
    min = 500,
    max = 500,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1016)->
    #dropCfg {
    dropId = 6072,
    dropType = 2,
    dataId = 1,
    probability = 19,
    career = 0,
    sex = 0,
    min = 2000,
    max = 2000,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1017)->
    #dropCfg {
    dropId = 6072,
    dropType = 1,
    dataId = 6500,
    probability = 3,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1018)->
    #dropCfg {
    dropId = 6072,
    dropType = 1,
    dataId = 284004,
    probability = 1,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1019)->
    #dropCfg {
    dropId = 6072,
    dropType = 1,
    dataId = 6002,
    probability = 10,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1020)->
    #dropCfg {
    dropId = 6072,
    dropType = 1,
    dataId = 5004,
    probability = 200,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 1
    };
getRow(1021)->
    #dropCfg {
    dropId = 6073,
    dropType = 2,
    dataId = 1,
    probability = 956,
    career = 0,
    sex = 0,
    min = 100,
    max = 100,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1022)->
    #dropCfg {
    dropId = 6073,
    dropType = 2,
    dataId = 1,
    probability = 574,
    career = 0,
    sex = 0,
    min = 250,
    max = 250,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1023)->
    #dropCfg {
    dropId = 6073,
    dropType = 2,
    dataId = 1,
    probability = 383,
    career = 0,
    sex = 0,
    min = 500,
    max = 500,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1024)->
    #dropCfg {
    dropId = 6073,
    dropType = 2,
    dataId = 1,
    probability = 19,
    career = 0,
    sex = 0,
    min = 2000,
    max = 2000,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1025)->
    #dropCfg {
    dropId = 6073,
    dropType = 1,
    dataId = 6500,
    probability = 3,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1026)->
    #dropCfg {
    dropId = 6073,
    dropType = 1,
    dataId = 284004,
    probability = 1,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1027)->
    #dropCfg {
    dropId = 6073,
    dropType = 1,
    dataId = 6002,
    probability = 10,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1028)->
    #dropCfg {
    dropId = 6073,
    dropType = 1,
    dataId = 5004,
    probability = 200,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 1
    };
getRow(1029)->
    #dropCfg {
    dropId = 6074,
    dropType = 2,
    dataId = 1,
    probability = 985,
    career = 0,
    sex = 0,
    min = 100,
    max = 100,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1030)->
    #dropCfg {
    dropId = 6074,
    dropType = 2,
    dataId = 1,
    probability = 591,
    career = 0,
    sex = 0,
    min = 250,
    max = 250,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1031)->
    #dropCfg {
    dropId = 6074,
    dropType = 2,
    dataId = 1,
    probability = 394,
    career = 0,
    sex = 0,
    min = 500,
    max = 500,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1032)->
    #dropCfg {
    dropId = 6074,
    dropType = 2,
    dataId = 1,
    probability = 20,
    career = 0,
    sex = 0,
    min = 2000,
    max = 2000,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1033)->
    #dropCfg {
    dropId = 6074,
    dropType = 1,
    dataId = 6500,
    probability = 3,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1034)->
    #dropCfg {
    dropId = 6074,
    dropType = 1,
    dataId = 284004,
    probability = 1,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1035)->
    #dropCfg {
    dropId = 6074,
    dropType = 1,
    dataId = 6002,
    probability = 10,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1036)->
    #dropCfg {
    dropId = 6074,
    dropType = 1,
    dataId = 5004,
    probability = 200,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 1
    };
getRow(1037)->
    #dropCfg {
    dropId = 6075,
    dropType = 2,
    dataId = 1,
    probability = 1016,
    career = 0,
    sex = 0,
    min = 100,
    max = 100,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1038)->
    #dropCfg {
    dropId = 6075,
    dropType = 2,
    dataId = 1,
    probability = 610,
    career = 0,
    sex = 0,
    min = 250,
    max = 250,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1039)->
    #dropCfg {
    dropId = 6075,
    dropType = 2,
    dataId = 1,
    probability = 406,
    career = 0,
    sex = 0,
    min = 500,
    max = 500,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1040)->
    #dropCfg {
    dropId = 6075,
    dropType = 2,
    dataId = 1,
    probability = 20,
    career = 0,
    sex = 0,
    min = 2000,
    max = 2000,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1041)->
    #dropCfg {
    dropId = 6075,
    dropType = 1,
    dataId = 6500,
    probability = 3,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1042)->
    #dropCfg {
    dropId = 6075,
    dropType = 1,
    dataId = 284004,
    probability = 1,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1043)->
    #dropCfg {
    dropId = 6075,
    dropType = 1,
    dataId = 6002,
    probability = 10,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1044)->
    #dropCfg {
    dropId = 6075,
    dropType = 1,
    dataId = 5004,
    probability = 200,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 1
    };
getRow(1045)->
    #dropCfg {
    dropId = 6076,
    dropType = 2,
    dataId = 1,
    probability = 1047,
    career = 0,
    sex = 0,
    min = 100,
    max = 100,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1046)->
    #dropCfg {
    dropId = 6076,
    dropType = 2,
    dataId = 1,
    probability = 628,
    career = 0,
    sex = 0,
    min = 250,
    max = 250,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1047)->
    #dropCfg {
    dropId = 6076,
    dropType = 2,
    dataId = 1,
    probability = 419,
    career = 0,
    sex = 0,
    min = 500,
    max = 500,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1048)->
    #dropCfg {
    dropId = 6076,
    dropType = 2,
    dataId = 1,
    probability = 21,
    career = 0,
    sex = 0,
    min = 2000,
    max = 2000,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1049)->
    #dropCfg {
    dropId = 6076,
    dropType = 1,
    dataId = 6500,
    probability = 4,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1050)->
    #dropCfg {
    dropId = 6076,
    dropType = 1,
    dataId = 284004,
    probability = 1,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1051)->
    #dropCfg {
    dropId = 6076,
    dropType = 1,
    dataId = 6002,
    probability = 10,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1052)->
    #dropCfg {
    dropId = 6076,
    dropType = 1,
    dataId = 5004,
    probability = 200,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 1
    };
getRow(1053)->
    #dropCfg {
    dropId = 6077,
    dropType = 2,
    dataId = 1,
    probability = 1078,
    career = 0,
    sex = 0,
    min = 100,
    max = 100,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1054)->
    #dropCfg {
    dropId = 6077,
    dropType = 2,
    dataId = 1,
    probability = 647,
    career = 0,
    sex = 0,
    min = 250,
    max = 250,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1055)->
    #dropCfg {
    dropId = 6077,
    dropType = 2,
    dataId = 1,
    probability = 431,
    career = 0,
    sex = 0,
    min = 500,
    max = 500,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1056)->
    #dropCfg {
    dropId = 6077,
    dropType = 2,
    dataId = 1,
    probability = 22,
    career = 0,
    sex = 0,
    min = 2000,
    max = 2000,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1057)->
    #dropCfg {
    dropId = 6077,
    dropType = 1,
    dataId = 6500,
    probability = 4,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1058)->
    #dropCfg {
    dropId = 6077,
    dropType = 1,
    dataId = 284004,
    probability = 1,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1059)->
    #dropCfg {
    dropId = 6077,
    dropType = 1,
    dataId = 6002,
    probability = 10,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1060)->
    #dropCfg {
    dropId = 6077,
    dropType = 1,
    dataId = 5004,
    probability = 200,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 1
    };
getRow(1061)->
    #dropCfg {
    dropId = 6078,
    dropType = 2,
    dataId = 1,
    probability = 1109,
    career = 0,
    sex = 0,
    min = 100,
    max = 100,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1062)->
    #dropCfg {
    dropId = 6078,
    dropType = 2,
    dataId = 1,
    probability = 666,
    career = 0,
    sex = 0,
    min = 250,
    max = 250,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1063)->
    #dropCfg {
    dropId = 6078,
    dropType = 2,
    dataId = 1,
    probability = 444,
    career = 0,
    sex = 0,
    min = 500,
    max = 500,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1064)->
    #dropCfg {
    dropId = 6078,
    dropType = 2,
    dataId = 1,
    probability = 22,
    career = 0,
    sex = 0,
    min = 2000,
    max = 2000,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1065)->
    #dropCfg {
    dropId = 6078,
    dropType = 1,
    dataId = 6500,
    probability = 4,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1066)->
    #dropCfg {
    dropId = 6078,
    dropType = 1,
    dataId = 284004,
    probability = 1,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1067)->
    #dropCfg {
    dropId = 6078,
    dropType = 1,
    dataId = 6002,
    probability = 10,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1068)->
    #dropCfg {
    dropId = 6078,
    dropType = 1,
    dataId = 5004,
    probability = 200,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 1
    };
getRow(1069)->
    #dropCfg {
    dropId = 6079,
    dropType = 2,
    dataId = 1,
    probability = 1141,
    career = 0,
    sex = 0,
    min = 100,
    max = 100,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1070)->
    #dropCfg {
    dropId = 6079,
    dropType = 2,
    dataId = 1,
    probability = 684,
    career = 0,
    sex = 0,
    min = 250,
    max = 250,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1071)->
    #dropCfg {
    dropId = 6079,
    dropType = 2,
    dataId = 1,
    probability = 456,
    career = 0,
    sex = 0,
    min = 500,
    max = 500,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1072)->
    #dropCfg {
    dropId = 6079,
    dropType = 2,
    dataId = 1,
    probability = 23,
    career = 0,
    sex = 0,
    min = 2000,
    max = 2000,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1073)->
    #dropCfg {
    dropId = 6079,
    dropType = 1,
    dataId = 6500,
    probability = 4,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1074)->
    #dropCfg {
    dropId = 6079,
    dropType = 1,
    dataId = 284004,
    probability = 1,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1075)->
    #dropCfg {
    dropId = 6079,
    dropType = 1,
    dataId = 6002,
    probability = 10,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1076)->
    #dropCfg {
    dropId = 6079,
    dropType = 1,
    dataId = 5004,
    probability = 200,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 1
    };
getRow(1077)->
    #dropCfg {
    dropId = 6080,
    dropType = 2,
    dataId = 1,
    probability = 1175,
    career = 0,
    sex = 0,
    min = 100,
    max = 100,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1078)->
    #dropCfg {
    dropId = 6080,
    dropType = 2,
    dataId = 1,
    probability = 705,
    career = 0,
    sex = 0,
    min = 250,
    max = 250,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1079)->
    #dropCfg {
    dropId = 6080,
    dropType = 2,
    dataId = 1,
    probability = 470,
    career = 0,
    sex = 0,
    min = 500,
    max = 500,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1080)->
    #dropCfg {
    dropId = 6080,
    dropType = 2,
    dataId = 1,
    probability = 23,
    career = 0,
    sex = 0,
    min = 2000,
    max = 2000,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1081)->
    #dropCfg {
    dropId = 6080,
    dropType = 1,
    dataId = 6500,
    probability = 4,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1082)->
    #dropCfg {
    dropId = 6080,
    dropType = 1,
    dataId = 284005,
    probability = 1,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1083)->
    #dropCfg {
    dropId = 6080,
    dropType = 1,
    dataId = 6002,
    probability = 10,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1084)->
    #dropCfg {
    dropId = 6080,
    dropType = 1,
    dataId = 5004,
    probability = 200,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 1
    };
getRow(1085)->
    #dropCfg {
    dropId = 6081,
    dropType = 2,
    dataId = 1,
    probability = 1209,
    career = 0,
    sex = 0,
    min = 100,
    max = 100,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1086)->
    #dropCfg {
    dropId = 6081,
    dropType = 2,
    dataId = 1,
    probability = 725,
    career = 0,
    sex = 0,
    min = 250,
    max = 250,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1087)->
    #dropCfg {
    dropId = 6081,
    dropType = 2,
    dataId = 1,
    probability = 484,
    career = 0,
    sex = 0,
    min = 500,
    max = 500,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1088)->
    #dropCfg {
    dropId = 6081,
    dropType = 2,
    dataId = 1,
    probability = 24,
    career = 0,
    sex = 0,
    min = 2000,
    max = 2000,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1089)->
    #dropCfg {
    dropId = 6081,
    dropType = 1,
    dataId = 6500,
    probability = 4,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1090)->
    #dropCfg {
    dropId = 6081,
    dropType = 1,
    dataId = 284005,
    probability = 1,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1091)->
    #dropCfg {
    dropId = 6081,
    dropType = 1,
    dataId = 6002,
    probability = 10,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1092)->
    #dropCfg {
    dropId = 6081,
    dropType = 1,
    dataId = 5004,
    probability = 200,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 1
    };
getRow(1093)->
    #dropCfg {
    dropId = 6082,
    dropType = 2,
    dataId = 1,
    probability = 1243,
    career = 0,
    sex = 0,
    min = 100,
    max = 100,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1094)->
    #dropCfg {
    dropId = 6082,
    dropType = 2,
    dataId = 1,
    probability = 746,
    career = 0,
    sex = 0,
    min = 250,
    max = 250,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1095)->
    #dropCfg {
    dropId = 6082,
    dropType = 2,
    dataId = 1,
    probability = 497,
    career = 0,
    sex = 0,
    min = 500,
    max = 500,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1096)->
    #dropCfg {
    dropId = 6082,
    dropType = 2,
    dataId = 1,
    probability = 25,
    career = 0,
    sex = 0,
    min = 2000,
    max = 2000,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1097)->
    #dropCfg {
    dropId = 6082,
    dropType = 1,
    dataId = 6500,
    probability = 4,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1098)->
    #dropCfg {
    dropId = 6082,
    dropType = 1,
    dataId = 284005,
    probability = 1,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1099)->
    #dropCfg {
    dropId = 6082,
    dropType = 1,
    dataId = 6002,
    probability = 10,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1100)->
    #dropCfg {
    dropId = 6082,
    dropType = 1,
    dataId = 5004,
    probability = 200,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 1
    };
getRow(1101)->
    #dropCfg {
    dropId = 6083,
    dropType = 2,
    dataId = 1,
    probability = 1277,
    career = 0,
    sex = 0,
    min = 100,
    max = 100,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1102)->
    #dropCfg {
    dropId = 6083,
    dropType = 2,
    dataId = 1,
    probability = 766,
    career = 0,
    sex = 0,
    min = 250,
    max = 250,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1103)->
    #dropCfg {
    dropId = 6083,
    dropType = 2,
    dataId = 1,
    probability = 511,
    career = 0,
    sex = 0,
    min = 500,
    max = 500,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1104)->
    #dropCfg {
    dropId = 6083,
    dropType = 2,
    dataId = 1,
    probability = 26,
    career = 0,
    sex = 0,
    min = 2000,
    max = 2000,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1105)->
    #dropCfg {
    dropId = 6083,
    dropType = 1,
    dataId = 6500,
    probability = 4,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1106)->
    #dropCfg {
    dropId = 6083,
    dropType = 1,
    dataId = 284005,
    probability = 1,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1107)->
    #dropCfg {
    dropId = 6083,
    dropType = 1,
    dataId = 6002,
    probability = 10,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1108)->
    #dropCfg {
    dropId = 6083,
    dropType = 1,
    dataId = 5004,
    probability = 200,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 1
    };
getRow(1109)->
    #dropCfg {
    dropId = 6084,
    dropType = 2,
    dataId = 1,
    probability = 1311,
    career = 0,
    sex = 0,
    min = 100,
    max = 100,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1110)->
    #dropCfg {
    dropId = 6084,
    dropType = 2,
    dataId = 1,
    probability = 787,
    career = 0,
    sex = 0,
    min = 250,
    max = 250,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1111)->
    #dropCfg {
    dropId = 6084,
    dropType = 2,
    dataId = 1,
    probability = 525,
    career = 0,
    sex = 0,
    min = 500,
    max = 500,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1112)->
    #dropCfg {
    dropId = 6084,
    dropType = 2,
    dataId = 1,
    probability = 26,
    career = 0,
    sex = 0,
    min = 2000,
    max = 2000,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1113)->
    #dropCfg {
    dropId = 6084,
    dropType = 1,
    dataId = 6500,
    probability = 4,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1114)->
    #dropCfg {
    dropId = 6084,
    dropType = 1,
    dataId = 284005,
    probability = 1,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1115)->
    #dropCfg {
    dropId = 6084,
    dropType = 1,
    dataId = 6002,
    probability = 10,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1116)->
    #dropCfg {
    dropId = 6084,
    dropType = 1,
    dataId = 5004,
    probability = 200,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 1
    };
getRow(1117)->
    #dropCfg {
    dropId = 6085,
    dropType = 2,
    dataId = 1,
    probability = 1349,
    career = 0,
    sex = 0,
    min = 100,
    max = 100,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1118)->
    #dropCfg {
    dropId = 6085,
    dropType = 2,
    dataId = 1,
    probability = 809,
    career = 0,
    sex = 0,
    min = 250,
    max = 250,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1119)->
    #dropCfg {
    dropId = 6085,
    dropType = 2,
    dataId = 1,
    probability = 539,
    career = 0,
    sex = 0,
    min = 500,
    max = 500,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1120)->
    #dropCfg {
    dropId = 6085,
    dropType = 2,
    dataId = 1,
    probability = 27,
    career = 0,
    sex = 0,
    min = 2000,
    max = 2000,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1121)->
    #dropCfg {
    dropId = 6085,
    dropType = 1,
    dataId = 6500,
    probability = 5,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1122)->
    #dropCfg {
    dropId = 6085,
    dropType = 1,
    dataId = 284005,
    probability = 1,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1123)->
    #dropCfg {
    dropId = 6085,
    dropType = 1,
    dataId = 6002,
    probability = 10,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1124)->
    #dropCfg {
    dropId = 6085,
    dropType = 1,
    dataId = 5004,
    probability = 200,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 1
    };
getRow(1125)->
    #dropCfg {
    dropId = 6086,
    dropType = 2,
    dataId = 1,
    probability = 1386,
    career = 0,
    sex = 0,
    min = 100,
    max = 100,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1126)->
    #dropCfg {
    dropId = 6086,
    dropType = 2,
    dataId = 1,
    probability = 831,
    career = 0,
    sex = 0,
    min = 250,
    max = 250,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1127)->
    #dropCfg {
    dropId = 6086,
    dropType = 2,
    dataId = 1,
    probability = 554,
    career = 0,
    sex = 0,
    min = 500,
    max = 500,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1128)->
    #dropCfg {
    dropId = 6086,
    dropType = 2,
    dataId = 1,
    probability = 28,
    career = 0,
    sex = 0,
    min = 2000,
    max = 2000,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1129)->
    #dropCfg {
    dropId = 6086,
    dropType = 1,
    dataId = 6500,
    probability = 5,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1130)->
    #dropCfg {
    dropId = 6086,
    dropType = 1,
    dataId = 284005,
    probability = 1,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1131)->
    #dropCfg {
    dropId = 6086,
    dropType = 1,
    dataId = 6002,
    probability = 10,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1132)->
    #dropCfg {
    dropId = 6086,
    dropType = 1,
    dataId = 5004,
    probability = 200,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 1
    };
getRow(1133)->
    #dropCfg {
    dropId = 6087,
    dropType = 2,
    dataId = 1,
    probability = 1423,
    career = 0,
    sex = 0,
    min = 100,
    max = 100,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1134)->
    #dropCfg {
    dropId = 6087,
    dropType = 2,
    dataId = 1,
    probability = 854,
    career = 0,
    sex = 0,
    min = 250,
    max = 250,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1135)->
    #dropCfg {
    dropId = 6087,
    dropType = 2,
    dataId = 1,
    probability = 569,
    career = 0,
    sex = 0,
    min = 500,
    max = 500,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1136)->
    #dropCfg {
    dropId = 6087,
    dropType = 2,
    dataId = 1,
    probability = 28,
    career = 0,
    sex = 0,
    min = 2000,
    max = 2000,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1137)->
    #dropCfg {
    dropId = 6087,
    dropType = 1,
    dataId = 6500,
    probability = 5,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1138)->
    #dropCfg {
    dropId = 6087,
    dropType = 1,
    dataId = 284005,
    probability = 1,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1139)->
    #dropCfg {
    dropId = 6087,
    dropType = 1,
    dataId = 6002,
    probability = 10,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1140)->
    #dropCfg {
    dropId = 6087,
    dropType = 1,
    dataId = 5004,
    probability = 200,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 1
    };
getRow(1141)->
    #dropCfg {
    dropId = 6088,
    dropType = 2,
    dataId = 1,
    probability = 1460,
    career = 0,
    sex = 0,
    min = 100,
    max = 100,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1142)->
    #dropCfg {
    dropId = 6088,
    dropType = 2,
    dataId = 1,
    probability = 876,
    career = 0,
    sex = 0,
    min = 250,
    max = 250,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1143)->
    #dropCfg {
    dropId = 6088,
    dropType = 2,
    dataId = 1,
    probability = 584,
    career = 0,
    sex = 0,
    min = 500,
    max = 500,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1144)->
    #dropCfg {
    dropId = 6088,
    dropType = 2,
    dataId = 1,
    probability = 29,
    career = 0,
    sex = 0,
    min = 2000,
    max = 2000,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1145)->
    #dropCfg {
    dropId = 6088,
    dropType = 1,
    dataId = 6500,
    probability = 5,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1146)->
    #dropCfg {
    dropId = 6088,
    dropType = 1,
    dataId = 284005,
    probability = 1,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1147)->
    #dropCfg {
    dropId = 6088,
    dropType = 1,
    dataId = 6002,
    probability = 10,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1148)->
    #dropCfg {
    dropId = 6088,
    dropType = 1,
    dataId = 5004,
    probability = 200,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 1
    };
getRow(1149)->
    #dropCfg {
    dropId = 6089,
    dropType = 2,
    dataId = 1,
    probability = 1497,
    career = 0,
    sex = 0,
    min = 100,
    max = 100,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1150)->
    #dropCfg {
    dropId = 6089,
    dropType = 2,
    dataId = 1,
    probability = 898,
    career = 0,
    sex = 0,
    min = 250,
    max = 250,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1151)->
    #dropCfg {
    dropId = 6089,
    dropType = 2,
    dataId = 1,
    probability = 599,
    career = 0,
    sex = 0,
    min = 500,
    max = 500,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1152)->
    #dropCfg {
    dropId = 6089,
    dropType = 2,
    dataId = 1,
    probability = 30,
    career = 0,
    sex = 0,
    min = 2000,
    max = 2000,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1153)->
    #dropCfg {
    dropId = 6089,
    dropType = 1,
    dataId = 6500,
    probability = 5,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1154)->
    #dropCfg {
    dropId = 6089,
    dropType = 1,
    dataId = 284005,
    probability = 2,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1155)->
    #dropCfg {
    dropId = 6089,
    dropType = 1,
    dataId = 6002,
    probability = 10,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1156)->
    #dropCfg {
    dropId = 6089,
    dropType = 1,
    dataId = 5004,
    probability = 200,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 1
    };
getRow(1157)->
    #dropCfg {
    dropId = 6090,
    dropType = 2,
    dataId = 1,
    probability = 1537,
    career = 0,
    sex = 0,
    min = 100,
    max = 100,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1158)->
    #dropCfg {
    dropId = 6090,
    dropType = 2,
    dataId = 1,
    probability = 922,
    career = 0,
    sex = 0,
    min = 250,
    max = 250,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1159)->
    #dropCfg {
    dropId = 6090,
    dropType = 2,
    dataId = 1,
    probability = 615,
    career = 0,
    sex = 0,
    min = 500,
    max = 500,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1160)->
    #dropCfg {
    dropId = 6090,
    dropType = 2,
    dataId = 1,
    probability = 31,
    career = 0,
    sex = 0,
    min = 2000,
    max = 2000,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1161)->
    #dropCfg {
    dropId = 6090,
    dropType = 1,
    dataId = 6500,
    probability = 5,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1162)->
    #dropCfg {
    dropId = 6090,
    dropType = 1,
    dataId = 284006,
    probability = 2,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1163)->
    #dropCfg {
    dropId = 6090,
    dropType = 1,
    dataId = 6002,
    probability = 10,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1164)->
    #dropCfg {
    dropId = 6090,
    dropType = 1,
    dataId = 5004,
    probability = 200,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 1
    };
getRow(1165)->
    #dropCfg {
    dropId = 6091,
    dropType = 2,
    dataId = 1,
    probability = 1577,
    career = 0,
    sex = 0,
    min = 100,
    max = 100,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1166)->
    #dropCfg {
    dropId = 6091,
    dropType = 2,
    dataId = 1,
    probability = 946,
    career = 0,
    sex = 0,
    min = 250,
    max = 250,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1167)->
    #dropCfg {
    dropId = 6091,
    dropType = 2,
    dataId = 1,
    probability = 631,
    career = 0,
    sex = 0,
    min = 500,
    max = 500,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1168)->
    #dropCfg {
    dropId = 6091,
    dropType = 2,
    dataId = 1,
    probability = 32,
    career = 0,
    sex = 0,
    min = 2000,
    max = 2000,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1169)->
    #dropCfg {
    dropId = 6091,
    dropType = 1,
    dataId = 6500,
    probability = 5,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1170)->
    #dropCfg {
    dropId = 6091,
    dropType = 1,
    dataId = 284006,
    probability = 2,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1171)->
    #dropCfg {
    dropId = 6091,
    dropType = 1,
    dataId = 6002,
    probability = 10,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1172)->
    #dropCfg {
    dropId = 6091,
    dropType = 1,
    dataId = 5004,
    probability = 200,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 1
    };
getRow(1173)->
    #dropCfg {
    dropId = 6092,
    dropType = 2,
    dataId = 1,
    probability = 1617,
    career = 0,
    sex = 0,
    min = 100,
    max = 100,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1174)->
    #dropCfg {
    dropId = 6092,
    dropType = 2,
    dataId = 1,
    probability = 970,
    career = 0,
    sex = 0,
    min = 250,
    max = 250,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1175)->
    #dropCfg {
    dropId = 6092,
    dropType = 2,
    dataId = 1,
    probability = 647,
    career = 0,
    sex = 0,
    min = 500,
    max = 500,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1176)->
    #dropCfg {
    dropId = 6092,
    dropType = 2,
    dataId = 1,
    probability = 32,
    career = 0,
    sex = 0,
    min = 2000,
    max = 2000,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1177)->
    #dropCfg {
    dropId = 6092,
    dropType = 1,
    dataId = 6500,
    probability = 5,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1178)->
    #dropCfg {
    dropId = 6092,
    dropType = 1,
    dataId = 284006,
    probability = 2,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1179)->
    #dropCfg {
    dropId = 6092,
    dropType = 1,
    dataId = 6002,
    probability = 10,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1180)->
    #dropCfg {
    dropId = 6092,
    dropType = 1,
    dataId = 5004,
    probability = 200,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 1
    };
getRow(1181)->
    #dropCfg {
    dropId = 6093,
    dropType = 2,
    dataId = 1,
    probability = 1657,
    career = 0,
    sex = 0,
    min = 100,
    max = 100,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1182)->
    #dropCfg {
    dropId = 6093,
    dropType = 2,
    dataId = 1,
    probability = 994,
    career = 0,
    sex = 0,
    min = 250,
    max = 250,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1183)->
    #dropCfg {
    dropId = 6093,
    dropType = 2,
    dataId = 1,
    probability = 663,
    career = 0,
    sex = 0,
    min = 500,
    max = 500,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1184)->
    #dropCfg {
    dropId = 6093,
    dropType = 2,
    dataId = 1,
    probability = 33,
    career = 0,
    sex = 0,
    min = 2000,
    max = 2000,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1185)->
    #dropCfg {
    dropId = 6093,
    dropType = 1,
    dataId = 6500,
    probability = 6,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1186)->
    #dropCfg {
    dropId = 6093,
    dropType = 1,
    dataId = 284006,
    probability = 2,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1187)->
    #dropCfg {
    dropId = 6093,
    dropType = 1,
    dataId = 6002,
    probability = 10,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1188)->
    #dropCfg {
    dropId = 6093,
    dropType = 1,
    dataId = 5004,
    probability = 200,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 1
    };
getRow(1189)->
    #dropCfg {
    dropId = 6094,
    dropType = 2,
    dataId = 1,
    probability = 1698,
    career = 0,
    sex = 0,
    min = 100,
    max = 100,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1190)->
    #dropCfg {
    dropId = 6094,
    dropType = 2,
    dataId = 1,
    probability = 1019,
    career = 0,
    sex = 0,
    min = 250,
    max = 250,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1191)->
    #dropCfg {
    dropId = 6094,
    dropType = 2,
    dataId = 1,
    probability = 679,
    career = 0,
    sex = 0,
    min = 500,
    max = 500,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1192)->
    #dropCfg {
    dropId = 6094,
    dropType = 2,
    dataId = 1,
    probability = 34,
    career = 0,
    sex = 0,
    min = 2000,
    max = 2000,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1193)->
    #dropCfg {
    dropId = 6094,
    dropType = 1,
    dataId = 6500,
    probability = 6,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1194)->
    #dropCfg {
    dropId = 6094,
    dropType = 1,
    dataId = 284006,
    probability = 2,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1195)->
    #dropCfg {
    dropId = 6094,
    dropType = 1,
    dataId = 6002,
    probability = 10,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1196)->
    #dropCfg {
    dropId = 6094,
    dropType = 1,
    dataId = 5004,
    probability = 200,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 1
    };
getRow(1197)->
    #dropCfg {
    dropId = 6095,
    dropType = 2,
    dataId = 1,
    probability = 1741,
    career = 0,
    sex = 0,
    min = 100,
    max = 100,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1198)->
    #dropCfg {
    dropId = 6095,
    dropType = 2,
    dataId = 1,
    probability = 1044,
    career = 0,
    sex = 0,
    min = 250,
    max = 250,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1199)->
    #dropCfg {
    dropId = 6095,
    dropType = 2,
    dataId = 1,
    probability = 696,
    career = 0,
    sex = 0,
    min = 500,
    max = 500,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1200)->
    #dropCfg {
    dropId = 6095,
    dropType = 2,
    dataId = 1,
    probability = 35,
    career = 0,
    sex = 0,
    min = 2000,
    max = 2000,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1201)->
    #dropCfg {
    dropId = 6095,
    dropType = 1,
    dataId = 6500,
    probability = 6,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1202)->
    #dropCfg {
    dropId = 6095,
    dropType = 1,
    dataId = 284006,
    probability = 2,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1203)->
    #dropCfg {
    dropId = 6095,
    dropType = 1,
    dataId = 6002,
    probability = 10,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1204)->
    #dropCfg {
    dropId = 6095,
    dropType = 1,
    dataId = 5004,
    probability = 200,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 1
    };
getRow(1205)->
    #dropCfg {
    dropId = 6096,
    dropType = 2,
    dataId = 1,
    probability = 1784,
    career = 0,
    sex = 0,
    min = 100,
    max = 100,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1206)->
    #dropCfg {
    dropId = 6096,
    dropType = 2,
    dataId = 1,
    probability = 1070,
    career = 0,
    sex = 0,
    min = 250,
    max = 250,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1207)->
    #dropCfg {
    dropId = 6096,
    dropType = 2,
    dataId = 1,
    probability = 713,
    career = 0,
    sex = 0,
    min = 500,
    max = 500,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1208)->
    #dropCfg {
    dropId = 6096,
    dropType = 2,
    dataId = 1,
    probability = 36,
    career = 0,
    sex = 0,
    min = 2000,
    max = 2000,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1209)->
    #dropCfg {
    dropId = 6096,
    dropType = 1,
    dataId = 6500,
    probability = 6,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1210)->
    #dropCfg {
    dropId = 6096,
    dropType = 1,
    dataId = 284006,
    probability = 2,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1211)->
    #dropCfg {
    dropId = 6096,
    dropType = 1,
    dataId = 6002,
    probability = 10,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1212)->
    #dropCfg {
    dropId = 6096,
    dropType = 1,
    dataId = 5004,
    probability = 200,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 1
    };
getRow(1213)->
    #dropCfg {
    dropId = 6097,
    dropType = 2,
    dataId = 1,
    probability = 1827,
    career = 0,
    sex = 0,
    min = 100,
    max = 100,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1214)->
    #dropCfg {
    dropId = 6097,
    dropType = 2,
    dataId = 1,
    probability = 1096,
    career = 0,
    sex = 0,
    min = 250,
    max = 250,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1215)->
    #dropCfg {
    dropId = 6097,
    dropType = 2,
    dataId = 1,
    probability = 731,
    career = 0,
    sex = 0,
    min = 500,
    max = 500,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1216)->
    #dropCfg {
    dropId = 6097,
    dropType = 2,
    dataId = 1,
    probability = 37,
    career = 0,
    sex = 0,
    min = 2000,
    max = 2000,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1217)->
    #dropCfg {
    dropId = 6097,
    dropType = 1,
    dataId = 6500,
    probability = 6,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1218)->
    #dropCfg {
    dropId = 6097,
    dropType = 1,
    dataId = 284006,
    probability = 2,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1219)->
    #dropCfg {
    dropId = 6097,
    dropType = 1,
    dataId = 6002,
    probability = 10,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1220)->
    #dropCfg {
    dropId = 6097,
    dropType = 1,
    dataId = 5004,
    probability = 200,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 1
    };
getRow(1221)->
    #dropCfg {
    dropId = 6098,
    dropType = 2,
    dataId = 1,
    probability = 1870,
    career = 0,
    sex = 0,
    min = 100,
    max = 100,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1222)->
    #dropCfg {
    dropId = 6098,
    dropType = 2,
    dataId = 1,
    probability = 1122,
    career = 0,
    sex = 0,
    min = 250,
    max = 250,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1223)->
    #dropCfg {
    dropId = 6098,
    dropType = 2,
    dataId = 1,
    probability = 748,
    career = 0,
    sex = 0,
    min = 500,
    max = 500,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1224)->
    #dropCfg {
    dropId = 6098,
    dropType = 2,
    dataId = 1,
    probability = 37,
    career = 0,
    sex = 0,
    min = 2000,
    max = 2000,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1225)->
    #dropCfg {
    dropId = 6098,
    dropType = 1,
    dataId = 6500,
    probability = 6,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1226)->
    #dropCfg {
    dropId = 6098,
    dropType = 1,
    dataId = 284006,
    probability = 2,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1227)->
    #dropCfg {
    dropId = 6098,
    dropType = 1,
    dataId = 6002,
    probability = 10,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1228)->
    #dropCfg {
    dropId = 6098,
    dropType = 1,
    dataId = 5004,
    probability = 200,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 1
    };
getRow(1229)->
    #dropCfg {
    dropId = 6099,
    dropType = 2,
    dataId = 1,
    probability = 1913,
    career = 0,
    sex = 0,
    min = 100,
    max = 100,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1230)->
    #dropCfg {
    dropId = 6099,
    dropType = 2,
    dataId = 1,
    probability = 1148,
    career = 0,
    sex = 0,
    min = 250,
    max = 250,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1231)->
    #dropCfg {
    dropId = 6099,
    dropType = 2,
    dataId = 1,
    probability = 765,
    career = 0,
    sex = 0,
    min = 500,
    max = 500,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1232)->
    #dropCfg {
    dropId = 6099,
    dropType = 2,
    dataId = 1,
    probability = 38,
    career = 0,
    sex = 0,
    min = 2000,
    max = 2000,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1233)->
    #dropCfg {
    dropId = 6099,
    dropType = 1,
    dataId = 6500,
    probability = 6,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1234)->
    #dropCfg {
    dropId = 6099,
    dropType = 1,
    dataId = 284006,
    probability = 2,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1235)->
    #dropCfg {
    dropId = 6099,
    dropType = 1,
    dataId = 6002,
    probability = 10,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1236)->
    #dropCfg {
    dropId = 6099,
    dropType = 1,
    dataId = 5004,
    probability = 200,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 1
    };
getRow(1237)->
    #dropCfg {
    dropId = 6100,
    dropType = 2,
    dataId = 1,
    probability = 1959,
    career = 0,
    sex = 0,
    min = 100,
    max = 100,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1238)->
    #dropCfg {
    dropId = 6100,
    dropType = 2,
    dataId = 1,
    probability = 1175,
    career = 0,
    sex = 0,
    min = 250,
    max = 250,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1239)->
    #dropCfg {
    dropId = 6100,
    dropType = 2,
    dataId = 1,
    probability = 784,
    career = 0,
    sex = 0,
    min = 500,
    max = 500,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1240)->
    #dropCfg {
    dropId = 6100,
    dropType = 2,
    dataId = 1,
    probability = 39,
    career = 0,
    sex = 0,
    min = 2000,
    max = 2000,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1241)->
    #dropCfg {
    dropId = 6100,
    dropType = 1,
    dataId = 6500,
    probability = 7,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1242)->
    #dropCfg {
    dropId = 6100,
    dropType = 1,
    dataId = 284006,
    probability = 2,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1243)->
    #dropCfg {
    dropId = 6100,
    dropType = 1,
    dataId = 6002,
    probability = 10,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1244)->
    #dropCfg {
    dropId = 6100,
    dropType = 1,
    dataId = 5004,
    probability = 200,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 1
    };
getRow(1245)->
    #dropCfg {
    dropId = 6101,
    dropType = 2,
    dataId = 1,
    probability = 2005,
    career = 0,
    sex = 0,
    min = 100,
    max = 100,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1246)->
    #dropCfg {
    dropId = 6101,
    dropType = 2,
    dataId = 1,
    probability = 1203,
    career = 0,
    sex = 0,
    min = 250,
    max = 250,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1247)->
    #dropCfg {
    dropId = 6101,
    dropType = 2,
    dataId = 1,
    probability = 802,
    career = 0,
    sex = 0,
    min = 500,
    max = 500,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1248)->
    #dropCfg {
    dropId = 6101,
    dropType = 2,
    dataId = 1,
    probability = 40,
    career = 0,
    sex = 0,
    min = 2000,
    max = 2000,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1249)->
    #dropCfg {
    dropId = 6101,
    dropType = 1,
    dataId = 6500,
    probability = 7,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1250)->
    #dropCfg {
    dropId = 6101,
    dropType = 1,
    dataId = 284006,
    probability = 2,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1251)->
    #dropCfg {
    dropId = 6101,
    dropType = 1,
    dataId = 6002,
    probability = 10,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1252)->
    #dropCfg {
    dropId = 6101,
    dropType = 1,
    dataId = 5004,
    probability = 200,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 1
    };
getRow(1253)->
    #dropCfg {
    dropId = 6102,
    dropType = 2,
    dataId = 1,
    probability = 2051,
    career = 0,
    sex = 0,
    min = 100,
    max = 100,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1254)->
    #dropCfg {
    dropId = 6102,
    dropType = 2,
    dataId = 1,
    probability = 1231,
    career = 0,
    sex = 0,
    min = 250,
    max = 250,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1255)->
    #dropCfg {
    dropId = 6102,
    dropType = 2,
    dataId = 1,
    probability = 820,
    career = 0,
    sex = 0,
    min = 500,
    max = 500,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1256)->
    #dropCfg {
    dropId = 6102,
    dropType = 2,
    dataId = 1,
    probability = 41,
    career = 0,
    sex = 0,
    min = 2000,
    max = 2000,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1257)->
    #dropCfg {
    dropId = 6102,
    dropType = 1,
    dataId = 6500,
    probability = 7,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1258)->
    #dropCfg {
    dropId = 6102,
    dropType = 1,
    dataId = 284006,
    probability = 2,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1259)->
    #dropCfg {
    dropId = 6102,
    dropType = 1,
    dataId = 6002,
    probability = 10,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1260)->
    #dropCfg {
    dropId = 6102,
    dropType = 1,
    dataId = 5004,
    probability = 200,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 1
    };
getRow(1261)->
    #dropCfg {
    dropId = 6103,
    dropType = 2,
    dataId = 1,
    probability = 2097,
    career = 0,
    sex = 0,
    min = 100,
    max = 100,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1262)->
    #dropCfg {
    dropId = 6103,
    dropType = 2,
    dataId = 1,
    probability = 1258,
    career = 0,
    sex = 0,
    min = 250,
    max = 250,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1263)->
    #dropCfg {
    dropId = 6103,
    dropType = 2,
    dataId = 1,
    probability = 839,
    career = 0,
    sex = 0,
    min = 500,
    max = 500,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1264)->
    #dropCfg {
    dropId = 6103,
    dropType = 2,
    dataId = 1,
    probability = 42,
    career = 0,
    sex = 0,
    min = 2000,
    max = 2000,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1265)->
    #dropCfg {
    dropId = 6103,
    dropType = 1,
    dataId = 6500,
    probability = 7,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1266)->
    #dropCfg {
    dropId = 6103,
    dropType = 1,
    dataId = 284006,
    probability = 2,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1267)->
    #dropCfg {
    dropId = 6103,
    dropType = 1,
    dataId = 6002,
    probability = 10,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1268)->
    #dropCfg {
    dropId = 6103,
    dropType = 1,
    dataId = 5004,
    probability = 200,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 1
    };
getRow(1269)->
    #dropCfg {
    dropId = 6104,
    dropType = 2,
    dataId = 1,
    probability = 2143,
    career = 0,
    sex = 0,
    min = 100,
    max = 100,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1270)->
    #dropCfg {
    dropId = 6104,
    dropType = 2,
    dataId = 1,
    probability = 1286,
    career = 0,
    sex = 0,
    min = 250,
    max = 250,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1271)->
    #dropCfg {
    dropId = 6104,
    dropType = 2,
    dataId = 1,
    probability = 857,
    career = 0,
    sex = 0,
    min = 500,
    max = 500,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1272)->
    #dropCfg {
    dropId = 6104,
    dropType = 2,
    dataId = 1,
    probability = 43,
    career = 0,
    sex = 0,
    min = 2000,
    max = 2000,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1273)->
    #dropCfg {
    dropId = 6104,
    dropType = 1,
    dataId = 6500,
    probability = 7,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1274)->
    #dropCfg {
    dropId = 6104,
    dropType = 1,
    dataId = 284006,
    probability = 2,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1275)->
    #dropCfg {
    dropId = 6104,
    dropType = 1,
    dataId = 6002,
    probability = 10,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1276)->
    #dropCfg {
    dropId = 6104,
    dropType = 1,
    dataId = 5004,
    probability = 200,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 1
    };
getRow(1277)->
    #dropCfg {
    dropId = 6105,
    dropType = 2,
    dataId = 1,
    probability = 2189,
    career = 0,
    sex = 0,
    min = 100,
    max = 100,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1278)->
    #dropCfg {
    dropId = 6105,
    dropType = 2,
    dataId = 1,
    probability = 1313,
    career = 0,
    sex = 0,
    min = 250,
    max = 250,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1279)->
    #dropCfg {
    dropId = 6105,
    dropType = 2,
    dataId = 1,
    probability = 876,
    career = 0,
    sex = 0,
    min = 500,
    max = 500,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1280)->
    #dropCfg {
    dropId = 6105,
    dropType = 2,
    dataId = 1,
    probability = 44,
    career = 0,
    sex = 0,
    min = 2000,
    max = 2000,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1281)->
    #dropCfg {
    dropId = 6105,
    dropType = 1,
    dataId = 6500,
    probability = 7,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1282)->
    #dropCfg {
    dropId = 6105,
    dropType = 1,
    dataId = 284006,
    probability = 2,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1283)->
    #dropCfg {
    dropId = 6105,
    dropType = 1,
    dataId = 6002,
    probability = 10,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1284)->
    #dropCfg {
    dropId = 6105,
    dropType = 1,
    dataId = 5004,
    probability = 200,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 1
    };
getRow(1285)->
    #dropCfg {
    dropId = 8000,
    dropType = 1,
    dataId = 8000,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1286)->
    #dropCfg {
    dropId = 8001,
    dropType = 1,
    dataId = 8001,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1287)->
    #dropCfg {
    dropId = 8002,
    dropType = 1,
    dataId = 8002,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1288)->
    #dropCfg {
    dropId = 8003,
    dropType = 1,
    dataId = 8003,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1289)->
    #dropCfg {
    dropId = 8004,
    dropType = 1,
    dataId = 8004,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1290)->
    #dropCfg {
    dropId = 8005,
    dropType = 1,
    dataId = 8005,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1291)->
    #dropCfg {
    dropId = 8006,
    dropType = 1,
    dataId = 8006,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1292)->
    #dropCfg {
    dropId = 8007,
    dropType = 1,
    dataId = 8007,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1293)->
    #dropCfg {
    dropId = 8008,
    dropType = 1,
    dataId = 8008,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1294)->
    #dropCfg {
    dropId = 8009,
    dropType = 1,
    dataId = 8009,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1295)->
    #dropCfg {
    dropId = 18001,
    dropType = 1,
    dataId = 18001,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(1296)->
    #dropCfg {
    dropId = 100000,
    dropType = 1,
    dataId = 280000,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1297)->
    #dropCfg {
    dropId = 100001,
    dropType = 1,
    dataId = 280001,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1298)->
    #dropCfg {
    dropId = 100002,
    dropType = 1,
    dataId = 280002,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1299)->
    #dropCfg {
    dropId = 100003,
    dropType = 1,
    dataId = 280003,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1300)->
    #dropCfg {
    dropId = 100004,
    dropType = 1,
    dataId = 280004,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1301)->
    #dropCfg {
    dropId = 100005,
    dropType = 1,
    dataId = 280005,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1302)->
    #dropCfg {
    dropId = 100006,
    dropType = 1,
    dataId = 280006,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1303)->
    #dropCfg {
    dropId = 100010,
    dropType = 1,
    dataId = 281000,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1304)->
    #dropCfg {
    dropId = 100011,
    dropType = 1,
    dataId = 281001,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1305)->
    #dropCfg {
    dropId = 100012,
    dropType = 1,
    dataId = 281002,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1306)->
    #dropCfg {
    dropId = 100013,
    dropType = 1,
    dataId = 281003,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1307)->
    #dropCfg {
    dropId = 100014,
    dropType = 1,
    dataId = 281004,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1308)->
    #dropCfg {
    dropId = 100015,
    dropType = 1,
    dataId = 281005,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1309)->
    #dropCfg {
    dropId = 100016,
    dropType = 1,
    dataId = 281006,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1310)->
    #dropCfg {
    dropId = 100020,
    dropType = 1,
    dataId = 282000,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1311)->
    #dropCfg {
    dropId = 100021,
    dropType = 1,
    dataId = 282001,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1312)->
    #dropCfg {
    dropId = 100022,
    dropType = 1,
    dataId = 282002,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1313)->
    #dropCfg {
    dropId = 100023,
    dropType = 1,
    dataId = 282003,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1314)->
    #dropCfg {
    dropId = 100024,
    dropType = 1,
    dataId = 282004,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1315)->
    #dropCfg {
    dropId = 100025,
    dropType = 1,
    dataId = 282005,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1316)->
    #dropCfg {
    dropId = 100026,
    dropType = 1,
    dataId = 282006,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1317)->
    #dropCfg {
    dropId = 100030,
    dropType = 1,
    dataId = 283000,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1318)->
    #dropCfg {
    dropId = 100031,
    dropType = 1,
    dataId = 283001,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1319)->
    #dropCfg {
    dropId = 100032,
    dropType = 1,
    dataId = 283002,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1320)->
    #dropCfg {
    dropId = 100033,
    dropType = 1,
    dataId = 283003,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1321)->
    #dropCfg {
    dropId = 100034,
    dropType = 1,
    dataId = 283004,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1322)->
    #dropCfg {
    dropId = 100035,
    dropType = 1,
    dataId = 283005,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1323)->
    #dropCfg {
    dropId = 100036,
    dropType = 1,
    dataId = 283006,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1324)->
    #dropCfg {
    dropId = 200000,
    dropType = 0,
    dataId = 7002,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 20,
    max = 20,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1325)->
    #dropCfg {
    dropId = 200000,
    dropType = 0,
    dataId = 221,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 10,
    max = 10,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1326)->
    #dropCfg {
    dropId = 200000,
    dropType = 0,
    dataId = 230,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 4,
    max = 4,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1327)->
    #dropCfg {
    dropId = 200000,
    dropType = 1,
    dataId = 285003,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1328)->
    #dropCfg {
    dropId = 200000,
    dropType = 0,
    dataId = 3151,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1329)->
    #dropCfg {
    dropId = 200001,
    dropType = 0,
    dataId = 7003,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 30,
    max = 30,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1330)->
    #dropCfg {
    dropId = 200001,
    dropType = 0,
    dataId = 221,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 20,
    max = 20,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1331)->
    #dropCfg {
    dropId = 200001,
    dropType = 0,
    dataId = 230,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 5,
    max = 5,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1332)->
    #dropCfg {
    dropId = 200001,
    dropType = 1,
    dataId = 285004,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1333)->
    #dropCfg {
    dropId = 200001,
    dropType = 0,
    dataId = 3151,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1334)->
    #dropCfg {
    dropId = 200002,
    dropType = 0,
    dataId = 7004,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 30,
    max = 30,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1335)->
    #dropCfg {
    dropId = 200002,
    dropType = 0,
    dataId = 221,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 30,
    max = 30,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1336)->
    #dropCfg {
    dropId = 200002,
    dropType = 0,
    dataId = 230,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 6,
    max = 6,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1337)->
    #dropCfg {
    dropId = 200002,
    dropType = 1,
    dataId = 285005,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1338)->
    #dropCfg {
    dropId = 200002,
    dropType = 0,
    dataId = 3152,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1339)->
    #dropCfg {
    dropId = 200003,
    dropType = 0,
    dataId = 7005,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 30,
    max = 30,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1340)->
    #dropCfg {
    dropId = 200003,
    dropType = 0,
    dataId = 221,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 40,
    max = 40,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1341)->
    #dropCfg {
    dropId = 200003,
    dropType = 0,
    dataId = 230,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 7,
    max = 7,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1342)->
    #dropCfg {
    dropId = 200003,
    dropType = 1,
    dataId = 285006,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1343)->
    #dropCfg {
    dropId = 200003,
    dropType = 0,
    dataId = 3152,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1344)->
    #dropCfg {
    dropId = 200004,
    dropType = 0,
    dataId = 7006,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 30,
    max = 30,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1345)->
    #dropCfg {
    dropId = 200004,
    dropType = 0,
    dataId = 221,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 50,
    max = 50,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1346)->
    #dropCfg {
    dropId = 200004,
    dropType = 0,
    dataId = 230,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 8,
    max = 8,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1347)->
    #dropCfg {
    dropId = 200004,
    dropType = 1,
    dataId = 285006,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1348)->
    #dropCfg {
    dropId = 200004,
    dropType = 0,
    dataId = 3153,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1349)->
    #dropCfg {
    dropId = 200005,
    dropType = 0,
    dataId = 7006,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 30,
    max = 30,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1350)->
    #dropCfg {
    dropId = 200005,
    dropType = 0,
    dataId = 221,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 60,
    max = 60,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1351)->
    #dropCfg {
    dropId = 200005,
    dropType = 0,
    dataId = 230,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 9,
    max = 9,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1352)->
    #dropCfg {
    dropId = 200005,
    dropType = 1,
    dataId = 285006,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1353)->
    #dropCfg {
    dropId = 200005,
    dropType = 0,
    dataId = 3153,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1354)->
    #dropCfg {
    dropId = 200006,
    dropType = 0,
    dataId = 7006,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 30,
    max = 30,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1355)->
    #dropCfg {
    dropId = 200006,
    dropType = 0,
    dataId = 221,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 70,
    max = 70,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1356)->
    #dropCfg {
    dropId = 200006,
    dropType = 0,
    dataId = 230,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 10,
    max = 10,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1357)->
    #dropCfg {
    dropId = 200006,
    dropType = 1,
    dataId = 285006,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1358)->
    #dropCfg {
    dropId = 200006,
    dropType = 0,
    dataId = 3153,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1359)->
    #dropCfg {
    dropId = 200007,
    dropType = 0,
    dataId = 7006,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 30,
    max = 30,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1360)->
    #dropCfg {
    dropId = 200007,
    dropType = 0,
    dataId = 221,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 80,
    max = 80,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1361)->
    #dropCfg {
    dropId = 200007,
    dropType = 0,
    dataId = 230,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 11,
    max = 11,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1362)->
    #dropCfg {
    dropId = 200007,
    dropType = 1,
    dataId = 285006,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1363)->
    #dropCfg {
    dropId = 200007,
    dropType = 0,
    dataId = 3153,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1364)->
    #dropCfg {
    dropId = 200008,
    dropType = 0,
    dataId = 7006,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 30,
    max = 30,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1365)->
    #dropCfg {
    dropId = 200008,
    dropType = 0,
    dataId = 221,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 90,
    max = 90,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1366)->
    #dropCfg {
    dropId = 200008,
    dropType = 0,
    dataId = 230,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 12,
    max = 12,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1367)->
    #dropCfg {
    dropId = 200008,
    dropType = 1,
    dataId = 285006,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1368)->
    #dropCfg {
    dropId = 200008,
    dropType = 0,
    dataId = 3153,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1369)->
    #dropCfg {
    dropId = 200009,
    dropType = 0,
    dataId = 7006,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 30,
    max = 30,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1370)->
    #dropCfg {
    dropId = 200009,
    dropType = 0,
    dataId = 221,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 100,
    max = 100,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1371)->
    #dropCfg {
    dropId = 200009,
    dropType = 0,
    dataId = 230,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 13,
    max = 13,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1372)->
    #dropCfg {
    dropId = 200009,
    dropType = 1,
    dataId = 285006,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1373)->
    #dropCfg {
    dropId = 200009,
    dropType = 0,
    dataId = 3153,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1374)->
    #dropCfg {
    dropId = 210000,
    dropType = 2,
    dataId = 1,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 100000,
    max = 100000,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1375)->
    #dropCfg {
    dropId = 210000,
    dropType = 0,
    dataId = 221,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 3,
    max = 3,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1376)->
    #dropCfg {
    dropId = 210000,
    dropType = 0,
    dataId = 271,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 3,
    max = 3,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1377)->
    #dropCfg {
    dropId = 210001,
    dropType = 2,
    dataId = 1,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 150000,
    max = 150000,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1378)->
    #dropCfg {
    dropId = 210001,
    dropType = 0,
    dataId = 221,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 4,
    max = 4,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1379)->
    #dropCfg {
    dropId = 210001,
    dropType = 0,
    dataId = 271,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 4,
    max = 4,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1380)->
    #dropCfg {
    dropId = 210002,
    dropType = 2,
    dataId = 1,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 200000,
    max = 200000,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1381)->
    #dropCfg {
    dropId = 210002,
    dropType = 0,
    dataId = 221,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 5,
    max = 5,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1382)->
    #dropCfg {
    dropId = 210002,
    dropType = 0,
    dataId = 271,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 5,
    max = 5,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1383)->
    #dropCfg {
    dropId = 210003,
    dropType = 2,
    dataId = 1,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 250000,
    max = 250000,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1384)->
    #dropCfg {
    dropId = 210003,
    dropType = 0,
    dataId = 221,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 6,
    max = 6,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1385)->
    #dropCfg {
    dropId = 210003,
    dropType = 0,
    dataId = 271,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 6,
    max = 6,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1386)->
    #dropCfg {
    dropId = 210004,
    dropType = 2,
    dataId = 1,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 300000,
    max = 300000,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1387)->
    #dropCfg {
    dropId = 210004,
    dropType = 0,
    dataId = 221,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 7,
    max = 7,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1388)->
    #dropCfg {
    dropId = 210004,
    dropType = 0,
    dataId = 271,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 7,
    max = 7,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1389)->
    #dropCfg {
    dropId = 210005,
    dropType = 2,
    dataId = 1,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 350000,
    max = 350000,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1390)->
    #dropCfg {
    dropId = 210005,
    dropType = 0,
    dataId = 221,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 8,
    max = 8,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1391)->
    #dropCfg {
    dropId = 210005,
    dropType = 0,
    dataId = 271,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 8,
    max = 8,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1392)->
    #dropCfg {
    dropId = 210006,
    dropType = 2,
    dataId = 1,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 400000,
    max = 400000,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1393)->
    #dropCfg {
    dropId = 210006,
    dropType = 0,
    dataId = 221,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 9,
    max = 9,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1394)->
    #dropCfg {
    dropId = 210006,
    dropType = 0,
    dataId = 271,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 9,
    max = 9,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1395)->
    #dropCfg {
    dropId = 210007,
    dropType = 2,
    dataId = 1,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 450000,
    max = 450000,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1396)->
    #dropCfg {
    dropId = 210007,
    dropType = 0,
    dataId = 221,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 10,
    max = 10,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1397)->
    #dropCfg {
    dropId = 210007,
    dropType = 0,
    dataId = 271,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 10,
    max = 10,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1398)->
    #dropCfg {
    dropId = 210008,
    dropType = 2,
    dataId = 1,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 500000,
    max = 500000,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1399)->
    #dropCfg {
    dropId = 210008,
    dropType = 0,
    dataId = 221,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 11,
    max = 11,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1400)->
    #dropCfg {
    dropId = 210008,
    dropType = 0,
    dataId = 271,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 11,
    max = 11,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1401)->
    #dropCfg {
    dropId = 210009,
    dropType = 2,
    dataId = 1,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 550000,
    max = 550000,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1402)->
    #dropCfg {
    dropId = 210009,
    dropType = 0,
    dataId = 221,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 12,
    max = 12,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1403)->
    #dropCfg {
    dropId = 210009,
    dropType = 0,
    dataId = 271,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 12,
    max = 12,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1404)->
    #dropCfg {
    dropId = 250000,
    dropType = 1,
    dataId = 250000,
    probability = 10000,
    career = 1,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1405)->
    #dropCfg {
    dropId = 250000,
    dropType = 1,
    dataId = 250001,
    probability = 10000,
    career = 2,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1406)->
    #dropCfg {
    dropId = 250000,
    dropType = 1,
    dataId = 250002,
    probability = 10000,
    career = 3,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1407)->
    #dropCfg {
    dropId = 251000,
    dropType = 1,
    dataId = 251000,
    probability = 10000,
    career = 1,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1408)->
    #dropCfg {
    dropId = 251000,
    dropType = 1,
    dataId = 251001,
    probability = 10000,
    career = 2,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1409)->
    #dropCfg {
    dropId = 251000,
    dropType = 1,
    dataId = 251002,
    probability = 10000,
    career = 3,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1410)->
    #dropCfg {
    dropId = 252000,
    dropType = 1,
    dataId = 252000,
    probability = 10000,
    career = 1,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1411)->
    #dropCfg {
    dropId = 252000,
    dropType = 1,
    dataId = 252001,
    probability = 10000,
    career = 2,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1412)->
    #dropCfg {
    dropId = 252000,
    dropType = 1,
    dataId = 252002,
    probability = 10000,
    career = 3,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1413)->
    #dropCfg {
    dropId = 253000,
    dropType = 1,
    dataId = 253000,
    probability = 10000,
    career = 1,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1414)->
    #dropCfg {
    dropId = 253000,
    dropType = 1,
    dataId = 253001,
    probability = 10000,
    career = 2,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1415)->
    #dropCfg {
    dropId = 253000,
    dropType = 1,
    dataId = 253002,
    probability = 10000,
    career = 3,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1416)->
    #dropCfg {
    dropId = 254000,
    dropType = 1,
    dataId = 254000,
    probability = 10000,
    career = 1,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1417)->
    #dropCfg {
    dropId = 254000,
    dropType = 1,
    dataId = 254001,
    probability = 10000,
    career = 2,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1418)->
    #dropCfg {
    dropId = 254000,
    dropType = 1,
    dataId = 254002,
    probability = 10000,
    career = 3,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1419)->
    #dropCfg {
    dropId = 255000,
    dropType = 1,
    dataId = 255000,
    probability = 10000,
    career = 1,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1420)->
    #dropCfg {
    dropId = 255000,
    dropType = 1,
    dataId = 255001,
    probability = 10000,
    career = 2,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1421)->
    #dropCfg {
    dropId = 255000,
    dropType = 1,
    dataId = 255002,
    probability = 10000,
    career = 3,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1422)->
    #dropCfg {
    dropId = 256000,
    dropType = 1,
    dataId = 256000,
    probability = 10000,
    career = 1,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1423)->
    #dropCfg {
    dropId = 256000,
    dropType = 1,
    dataId = 256001,
    probability = 10000,
    career = 2,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1424)->
    #dropCfg {
    dropId = 256000,
    dropType = 1,
    dataId = 256002,
    probability = 10000,
    career = 3,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1425)->
    #dropCfg {
    dropId = 260000,
    dropType = 1,
    dataId = 260000,
    probability = 10000,
    career = 1,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1426)->
    #dropCfg {
    dropId = 260000,
    dropType = 1,
    dataId = 260001,
    probability = 10000,
    career = 2,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1427)->
    #dropCfg {
    dropId = 260000,
    dropType = 1,
    dataId = 260002,
    probability = 10000,
    career = 3,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1428)->
    #dropCfg {
    dropId = 270000,
    dropType = 1,
    dataId = 270000,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1429)->
    #dropCfg {
    dropId = 270001,
    dropType = 1,
    dataId = 270001,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1430)->
    #dropCfg {
    dropId = 270002,
    dropType = 1,
    dataId = 270002,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1431)->
    #dropCfg {
    dropId = 280000,
    dropType = 2,
    dataId = 1,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 5000,
    max = 5000,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(1432)->
    #dropCfg {
    dropId = 280000,
    dropType = 1,
    dataId = 6601,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(1433)->
    #dropCfg {
    dropId = 280000,
    dropType = 1,
    dataId = 282000,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 2,
    max = 2,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(1434)->
    #dropCfg {
    dropId = 280001,
    dropType = 2,
    dataId = 1,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 10000,
    max = 10000,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(1435)->
    #dropCfg {
    dropId = 280001,
    dropType = 1,
    dataId = 6602,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(1436)->
    #dropCfg {
    dropId = 280001,
    dropType = 1,
    dataId = 282000,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 2,
    max = 2,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(1437)->
    #dropCfg {
    dropId = 280002,
    dropType = 2,
    dataId = 1,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 15000,
    max = 15000,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(1438)->
    #dropCfg {
    dropId = 280002,
    dropType = 1,
    dataId = 6603,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(1439)->
    #dropCfg {
    dropId = 280002,
    dropType = 1,
    dataId = 282001,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 3,
    max = 3,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(1440)->
    #dropCfg {
    dropId = 280003,
    dropType = 2,
    dataId = 1,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 20000,
    max = 20000,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(1441)->
    #dropCfg {
    dropId = 280003,
    dropType = 1,
    dataId = 6604,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(1442)->
    #dropCfg {
    dropId = 280003,
    dropType = 1,
    dataId = 282001,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 2,
    max = 2,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(1443)->
    #dropCfg {
    dropId = 280004,
    dropType = 2,
    dataId = 1,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 25000,
    max = 25000,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(1444)->
    #dropCfg {
    dropId = 280004,
    dropType = 1,
    dataId = 6605,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(1445)->
    #dropCfg {
    dropId = 280004,
    dropType = 1,
    dataId = 282001,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 3,
    max = 3,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(1446)->
    #dropCfg {
    dropId = 280005,
    dropType = 2,
    dataId = 1,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 30000,
    max = 30000,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(1447)->
    #dropCfg {
    dropId = 280005,
    dropType = 1,
    dataId = 6606,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(1448)->
    #dropCfg {
    dropId = 280005,
    dropType = 1,
    dataId = 282002,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 2,
    max = 2,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(1449)->
    #dropCfg {
    dropId = 280006,
    dropType = 2,
    dataId = 1,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 35000,
    max = 35000,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(1450)->
    #dropCfg {
    dropId = 280006,
    dropType = 1,
    dataId = 6607,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(1451)->
    #dropCfg {
    dropId = 280006,
    dropType = 1,
    dataId = 282002,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 3,
    max = 3,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(1452)->
    #dropCfg {
    dropId = 280007,
    dropType = 2,
    dataId = 1,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 40000,
    max = 40000,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(1453)->
    #dropCfg {
    dropId = 280007,
    dropType = 1,
    dataId = 6608,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(1454)->
    #dropCfg {
    dropId = 280007,
    dropType = 1,
    dataId = 282003,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 2,
    max = 2,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(1455)->
    #dropCfg {
    dropId = 280008,
    dropType = 2,
    dataId = 1,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 50000,
    max = 50000,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(1456)->
    #dropCfg {
    dropId = 280008,
    dropType = 1,
    dataId = 6609,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(1457)->
    #dropCfg {
    dropId = 280008,
    dropType = 1,
    dataId = 282004,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 2,
    max = 2,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(1458)->
    #dropCfg {
    dropId = 280009,
    dropType = 2,
    dataId = 1,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 60000,
    max = 60000,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(1459)->
    #dropCfg {
    dropId = 280009,
    dropType = 1,
    dataId = 6610,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(1460)->
    #dropCfg {
    dropId = 280009,
    dropType = 1,
    dataId = 282005,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 2,
    max = 2,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(1461)->
    #dropCfg {
    dropId = 280010,
    dropType = 2,
    dataId = 1,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 70000,
    max = 70000,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(1462)->
    #dropCfg {
    dropId = 280010,
    dropType = 1,
    dataId = 6611,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(1463)->
    #dropCfg {
    dropId = 280010,
    dropType = 1,
    dataId = 282006,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 2,
    max = 2,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(1464)->
    #dropCfg {
    dropId = 280011,
    dropType = 2,
    dataId = 1,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 80000,
    max = 80000,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(1465)->
    #dropCfg {
    dropId = 280011,
    dropType = 1,
    dataId = 6612,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(1466)->
    #dropCfg {
    dropId = 280011,
    dropType = 1,
    dataId = 282006,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 3,
    max = 3,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(1467)->
    #dropCfg {
    dropId = 300000,
    dropType = 0,
    dataId = 2800,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1468)->
    #dropCfg {
    dropId = 300001,
    dropType = 0,
    dataId = 2801,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1469)->
    #dropCfg {
    dropId = 300002,
    dropType = 0,
    dataId = 2802,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1470)->
    #dropCfg {
    dropId = 300003,
    dropType = 0,
    dataId = 2803,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1471)->
    #dropCfg {
    dropId = 300004,
    dropType = 0,
    dataId = 2804,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1472)->
    #dropCfg {
    dropId = 300005,
    dropType = 0,
    dataId = 2805,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1473)->
    #dropCfg {
    dropId = 300006,
    dropType = 0,
    dataId = 2806,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1474)->
    #dropCfg {
    dropId = 300007,
    dropType = 0,
    dataId = 2807,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1475)->
    #dropCfg {
    dropId = 300008,
    dropType = 0,
    dataId = 2808,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1476)->
    #dropCfg {
    dropId = 301000,
    dropType = 0,
    dataId = 2601,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 10,
    max = 10,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1477)->
    #dropCfg {
    dropId = 301000,
    dropType = 0,
    dataId = 6000,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 3,
    max = 3,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1478)->
    #dropCfg {
    dropId = 301001,
    dropType = 0,
    dataId = 230,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 20,
    max = 20,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1479)->
    #dropCfg {
    dropId = 301001,
    dropType = 0,
    dataId = 225,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 2,
    max = 2,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1480)->
    #dropCfg {
    dropId = 301002,
    dropType = 0,
    dataId = 14905,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1481)->
    #dropCfg {
    dropId = 301003,
    dropType = 0,
    dataId = 2601,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 20,
    max = 20,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1482)->
    #dropCfg {
    dropId = 301003,
    dropType = 0,
    dataId = 6000,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 5,
    max = 5,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1483)->
    #dropCfg {
    dropId = 301004,
    dropType = 0,
    dataId = 1801,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 30,
    max = 30,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1484)->
    #dropCfg {
    dropId = 301004,
    dropType = 0,
    dataId = 226,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1485)->
    #dropCfg {
    dropId = 301005,
    dropType = 0,
    dataId = 14905,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1486)->
    #dropCfg {
    dropId = 301006,
    dropType = 0,
    dataId = 2601,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 30,
    max = 30,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1487)->
    #dropCfg {
    dropId = 301006,
    dropType = 0,
    dataId = 6000,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 8,
    max = 8,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1488)->
    #dropCfg {
    dropId = 301007,
    dropType = 0,
    dataId = 273,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1489)->
    #dropCfg {
    dropId = 301007,
    dropType = 0,
    dataId = 226,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1490)->
    #dropCfg {
    dropId = 301008,
    dropType = 0,
    dataId = 14905,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1491)->
    #dropCfg {
    dropId = 301008,
    dropType = 0,
    dataId = 241,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 20,
    max = 20,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1492)->
    #dropCfg {
    dropId = 301009,
    dropType = 0,
    dataId = 14308,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1493)->
    #dropCfg {
    dropId = 302000,
    dropType = 0,
    dataId = 2601,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 10,
    max = 10,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1494)->
    #dropCfg {
    dropId = 302000,
    dropType = 0,
    dataId = 6000,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 3,
    max = 3,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1495)->
    #dropCfg {
    dropId = 302001,
    dropType = 0,
    dataId = 230,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 30,
    max = 30,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1496)->
    #dropCfg {
    dropId = 302001,
    dropType = 0,
    dataId = 225,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 2,
    max = 2,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1497)->
    #dropCfg {
    dropId = 302002,
    dropType = 0,
    dataId = 14904,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1498)->
    #dropCfg {
    dropId = 302003,
    dropType = 0,
    dataId = 2601,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 20,
    max = 20,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1499)->
    #dropCfg {
    dropId = 302003,
    dropType = 0,
    dataId = 6000,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 5,
    max = 5,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1500)->
    #dropCfg {
    dropId = 302004,
    dropType = 0,
    dataId = 1801,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 40,
    max = 40,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1501)->
    #dropCfg {
    dropId = 302004,
    dropType = 0,
    dataId = 226,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1502)->
    #dropCfg {
    dropId = 302005,
    dropType = 0,
    dataId = 14904,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1503)->
    #dropCfg {
    dropId = 302006,
    dropType = 0,
    dataId = 2601,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 30,
    max = 30,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1504)->
    #dropCfg {
    dropId = 302006,
    dropType = 0,
    dataId = 6000,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 8,
    max = 8,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1505)->
    #dropCfg {
    dropId = 302007,
    dropType = 0,
    dataId = 274,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1506)->
    #dropCfg {
    dropId = 302007,
    dropType = 0,
    dataId = 226,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1507)->
    #dropCfg {
    dropId = 302008,
    dropType = 0,
    dataId = 14904,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1508)->
    #dropCfg {
    dropId = 302008,
    dropType = 0,
    dataId = 241,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 30,
    max = 30,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1509)->
    #dropCfg {
    dropId = 302009,
    dropType = 0,
    dataId = 14182,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1510)->
    #dropCfg {
    dropId = 303000,
    dropType = 0,
    dataId = 2601,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 10,
    max = 10,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1511)->
    #dropCfg {
    dropId = 303001,
    dropType = 0,
    dataId = 230,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 30,
    max = 30,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1512)->
    #dropCfg {
    dropId = 303002,
    dropType = 0,
    dataId = 14904,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1513)->
    #dropCfg {
    dropId = 303003,
    dropType = 0,
    dataId = 2601,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 20,
    max = 20,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1514)->
    #dropCfg {
    dropId = 303004,
    dropType = 0,
    dataId = 1801,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 40,
    max = 40,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1515)->
    #dropCfg {
    dropId = 303005,
    dropType = 0,
    dataId = 14904,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1516)->
    #dropCfg {
    dropId = 303006,
    dropType = 0,
    dataId = 2601,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 30,
    max = 30,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1517)->
    #dropCfg {
    dropId = 303007,
    dropType = 0,
    dataId = 274,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1518)->
    #dropCfg {
    dropId = 303008,
    dropType = 0,
    dataId = 14904,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1519)->
    #dropCfg {
    dropId = 303009,
    dropType = 0,
    dataId = 14182,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1520)->
    #dropCfg {
    dropId = 303010,
    dropType = 0,
    dataId = 6000,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 3,
    max = 3,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1521)->
    #dropCfg {
    dropId = 303011,
    dropType = 0,
    dataId = 225,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 2,
    max = 2,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1522)->
    #dropCfg {
    dropId = 303012,
    dropType = 0,
    dataId = 6000,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 5,
    max = 5,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1523)->
    #dropCfg {
    dropId = 303013,
    dropType = 0,
    dataId = 226,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1524)->
    #dropCfg {
    dropId = 303014,
    dropType = 0,
    dataId = 6000,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 8,
    max = 8,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1525)->
    #dropCfg {
    dropId = 303015,
    dropType = 0,
    dataId = 226,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1526)->
    #dropCfg {
    dropId = 303016,
    dropType = 0,
    dataId = 241,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 30,
    max = 30,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1527)->
    #dropCfg {
    dropId = 310003,
    dropType = 0,
    dataId = 613,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 12,
    max = 16,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1528)->
    #dropCfg {
    dropId = 310003,
    dropType = 0,
    dataId = 225,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 7,
    max = 9,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1529)->
    #dropCfg {
    dropId = 310004,
    dropType = 0,
    dataId = 613,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 10,
    max = 14,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1530)->
    #dropCfg {
    dropId = 310004,
    dropType = 0,
    dataId = 225,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 5,
    max = 7,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1531)->
    #dropCfg {
    dropId = 310005,
    dropType = 0,
    dataId = 613,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 8,
    max = 12,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1532)->
    #dropCfg {
    dropId = 310005,
    dropType = 0,
    dataId = 225,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 4,
    max = 6,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1533)->
    #dropCfg {
    dropId = 310006,
    dropType = 0,
    dataId = 613,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 6,
    max = 8,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1534)->
    #dropCfg {
    dropId = 310006,
    dropType = 0,
    dataId = 225,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 3,
    max = 5,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1535)->
    #dropCfg {
    dropId = 310007,
    dropType = 0,
    dataId = 613,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 6,
    max = 8,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1536)->
    #dropCfg {
    dropId = 310007,
    dropType = 0,
    dataId = 225,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 3,
    max = 5,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1537)->
    #dropCfg {
    dropId = 310200,
    dropType = 2,
    dataId = 6,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 100,
    max = 100,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1538)->
    #dropCfg {
    dropId = 310200,
    dropType = 0,
    dataId = 2601,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 6,
    max = 6,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1539)->
    #dropCfg {
    dropId = 310201,
    dropType = 2,
    dataId = 6,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 100,
    max = 100,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1540)->
    #dropCfg {
    dropId = 310201,
    dropType = 0,
    dataId = 2601,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 5,
    max = 5,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1541)->
    #dropCfg {
    dropId = 310202,
    dropType = 2,
    dataId = 6,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 90,
    max = 90,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1542)->
    #dropCfg {
    dropId = 310202,
    dropType = 0,
    dataId = 2601,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 5,
    max = 5,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1543)->
    #dropCfg {
    dropId = 310203,
    dropType = 2,
    dataId = 6,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 90,
    max = 90,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1544)->
    #dropCfg {
    dropId = 310203,
    dropType = 0,
    dataId = 2601,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 4,
    max = 4,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1545)->
    #dropCfg {
    dropId = 310204,
    dropType = 2,
    dataId = 6,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 80,
    max = 80,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1546)->
    #dropCfg {
    dropId = 310204,
    dropType = 0,
    dataId = 2601,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 4,
    max = 4,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1547)->
    #dropCfg {
    dropId = 310205,
    dropType = 2,
    dataId = 6,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 70,
    max = 70,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1548)->
    #dropCfg {
    dropId = 310205,
    dropType = 0,
    dataId = 2601,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 3,
    max = 3,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1549)->
    #dropCfg {
    dropId = 310206,
    dropType = 2,
    dataId = 6,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 70,
    max = 70,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1550)->
    #dropCfg {
    dropId = 310206,
    dropType = 0,
    dataId = 2601,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 3,
    max = 3,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1551)->
    #dropCfg {
    dropId = 310207,
    dropType = 2,
    dataId = 6,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 60,
    max = 60,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1552)->
    #dropCfg {
    dropId = 310207,
    dropType = 0,
    dataId = 2601,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 3,
    max = 3,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1553)->
    #dropCfg {
    dropId = 310208,
    dropType = 2,
    dataId = 6,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 55,
    max = 55,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1554)->
    #dropCfg {
    dropId = 310208,
    dropType = 0,
    dataId = 2601,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 3,
    max = 3,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1555)->
    #dropCfg {
    dropId = 310209,
    dropType = 2,
    dataId = 6,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 50,
    max = 50,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1556)->
    #dropCfg {
    dropId = 310209,
    dropType = 0,
    dataId = 2601,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 2,
    max = 2,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1557)->
    #dropCfg {
    dropId = 310210,
    dropType = 2,
    dataId = 6,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 40,
    max = 40,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1558)->
    #dropCfg {
    dropId = 310210,
    dropType = 0,
    dataId = 2601,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 2,
    max = 2,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1559)->
    #dropCfg {
    dropId = 310300,
    dropType = 0,
    dataId = 221,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 0,
    max = 0,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1560)->
    #dropCfg {
    dropId = 310300,
    dropType = 0,
    dataId = 1113,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1561)->
    #dropCfg {
    dropId = 310301,
    dropType = 0,
    dataId = 221,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 0,
    max = 0,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1562)->
    #dropCfg {
    dropId = 310301,
    dropType = 0,
    dataId = 1113,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1563)->
    #dropCfg {
    dropId = 310302,
    dropType = 0,
    dataId = 221,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 0,
    max = 0,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1564)->
    #dropCfg {
    dropId = 310302,
    dropType = 0,
    dataId = 1113,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1565)->
    #dropCfg {
    dropId = 310303,
    dropType = 0,
    dataId = 221,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 0,
    max = 0,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1566)->
    #dropCfg {
    dropId = 310303,
    dropType = 0,
    dataId = 1113,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1567)->
    #dropCfg {
    dropId = 310304,
    dropType = 0,
    dataId = 221,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 10,
    max = 10,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1568)->
    #dropCfg {
    dropId = 310304,
    dropType = 0,
    dataId = 1113,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1569)->
    #dropCfg {
    dropId = 310305,
    dropType = 0,
    dataId = 221,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 0,
    max = 0,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1570)->
    #dropCfg {
    dropId = 310305,
    dropType = 0,
    dataId = 1113,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1571)->
    #dropCfg {
    dropId = 310306,
    dropType = 0,
    dataId = 221,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 0,
    max = 0,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1572)->
    #dropCfg {
    dropId = 310306,
    dropType = 0,
    dataId = 1113,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1573)->
    #dropCfg {
    dropId = 310307,
    dropType = 0,
    dataId = 221,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 0,
    max = 0,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1574)->
    #dropCfg {
    dropId = 310307,
    dropType = 0,
    dataId = 1113,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1575)->
    #dropCfg {
    dropId = 310308,
    dropType = 0,
    dataId = 221,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 0,
    max = 0,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1576)->
    #dropCfg {
    dropId = 310308,
    dropType = 0,
    dataId = 1113,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1577)->
    #dropCfg {
    dropId = 310309,
    dropType = 0,
    dataId = 221,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 10,
    max = 10,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1578)->
    #dropCfg {
    dropId = 310309,
    dropType = 0,
    dataId = 1113,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1579)->
    #dropCfg {
    dropId = 310310,
    dropType = 0,
    dataId = 221,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 0,
    max = 0,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1580)->
    #dropCfg {
    dropId = 310310,
    dropType = 0,
    dataId = 1113,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1581)->
    #dropCfg {
    dropId = 310311,
    dropType = 0,
    dataId = 221,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 0,
    max = 0,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1582)->
    #dropCfg {
    dropId = 310311,
    dropType = 0,
    dataId = 1113,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1583)->
    #dropCfg {
    dropId = 310312,
    dropType = 0,
    dataId = 221,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 0,
    max = 0,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1584)->
    #dropCfg {
    dropId = 310312,
    dropType = 0,
    dataId = 1113,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1585)->
    #dropCfg {
    dropId = 310313,
    dropType = 0,
    dataId = 221,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 0,
    max = 0,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1586)->
    #dropCfg {
    dropId = 310313,
    dropType = 0,
    dataId = 1113,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1587)->
    #dropCfg {
    dropId = 310314,
    dropType = 0,
    dataId = 221,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 10,
    max = 10,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1588)->
    #dropCfg {
    dropId = 310314,
    dropType = 0,
    dataId = 1113,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1589)->
    #dropCfg {
    dropId = 310315,
    dropType = 0,
    dataId = 221,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 0,
    max = 0,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1590)->
    #dropCfg {
    dropId = 310315,
    dropType = 0,
    dataId = 1113,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1591)->
    #dropCfg {
    dropId = 310316,
    dropType = 0,
    dataId = 221,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 0,
    max = 0,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1592)->
    #dropCfg {
    dropId = 310316,
    dropType = 0,
    dataId = 1113,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1593)->
    #dropCfg {
    dropId = 310317,
    dropType = 0,
    dataId = 221,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 0,
    max = 0,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1594)->
    #dropCfg {
    dropId = 310317,
    dropType = 0,
    dataId = 1113,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1595)->
    #dropCfg {
    dropId = 310318,
    dropType = 0,
    dataId = 221,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 0,
    max = 0,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1596)->
    #dropCfg {
    dropId = 310318,
    dropType = 0,
    dataId = 1113,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1597)->
    #dropCfg {
    dropId = 310319,
    dropType = 0,
    dataId = 221,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 10,
    max = 10,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1598)->
    #dropCfg {
    dropId = 310319,
    dropType = 0,
    dataId = 1113,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1599)->
    #dropCfg {
    dropId = 310320,
    dropType = 0,
    dataId = 221,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 0,
    max = 0,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1600)->
    #dropCfg {
    dropId = 310320,
    dropType = 0,
    dataId = 1113,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1601)->
    #dropCfg {
    dropId = 310321,
    dropType = 0,
    dataId = 221,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 0,
    max = 0,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1602)->
    #dropCfg {
    dropId = 310321,
    dropType = 0,
    dataId = 1113,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1603)->
    #dropCfg {
    dropId = 310322,
    dropType = 0,
    dataId = 221,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 0,
    max = 0,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1604)->
    #dropCfg {
    dropId = 310322,
    dropType = 0,
    dataId = 1113,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1605)->
    #dropCfg {
    dropId = 310323,
    dropType = 0,
    dataId = 221,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 0,
    max = 0,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1606)->
    #dropCfg {
    dropId = 310323,
    dropType = 0,
    dataId = 1113,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1607)->
    #dropCfg {
    dropId = 310324,
    dropType = 0,
    dataId = 221,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 10,
    max = 10,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1608)->
    #dropCfg {
    dropId = 310324,
    dropType = 0,
    dataId = 1113,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1609)->
    #dropCfg {
    dropId = 310325,
    dropType = 0,
    dataId = 221,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 0,
    max = 0,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1610)->
    #dropCfg {
    dropId = 310325,
    dropType = 0,
    dataId = 1113,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1611)->
    #dropCfg {
    dropId = 310326,
    dropType = 0,
    dataId = 221,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 0,
    max = 0,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1612)->
    #dropCfg {
    dropId = 310326,
    dropType = 0,
    dataId = 1113,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1613)->
    #dropCfg {
    dropId = 310327,
    dropType = 0,
    dataId = 221,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 0,
    max = 0,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1614)->
    #dropCfg {
    dropId = 310327,
    dropType = 0,
    dataId = 1113,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1615)->
    #dropCfg {
    dropId = 310328,
    dropType = 0,
    dataId = 221,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 0,
    max = 0,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1616)->
    #dropCfg {
    dropId = 310328,
    dropType = 0,
    dataId = 1113,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1617)->
    #dropCfg {
    dropId = 310329,
    dropType = 0,
    dataId = 221,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 20,
    max = 20,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1618)->
    #dropCfg {
    dropId = 310329,
    dropType = 0,
    dataId = 1113,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 2,
    max = 2,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1619)->
    #dropCfg {
    dropId = 310330,
    dropType = 0,
    dataId = 221,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 0,
    max = 0,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1620)->
    #dropCfg {
    dropId = 310330,
    dropType = 0,
    dataId = 1113,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 2,
    max = 2,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1621)->
    #dropCfg {
    dropId = 310331,
    dropType = 0,
    dataId = 221,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 0,
    max = 0,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1622)->
    #dropCfg {
    dropId = 310331,
    dropType = 0,
    dataId = 1113,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 2,
    max = 2,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1623)->
    #dropCfg {
    dropId = 310332,
    dropType = 0,
    dataId = 221,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 0,
    max = 0,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1624)->
    #dropCfg {
    dropId = 310332,
    dropType = 0,
    dataId = 1113,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 2,
    max = 2,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1625)->
    #dropCfg {
    dropId = 310333,
    dropType = 0,
    dataId = 221,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 0,
    max = 0,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1626)->
    #dropCfg {
    dropId = 310333,
    dropType = 0,
    dataId = 1113,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 2,
    max = 2,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1627)->
    #dropCfg {
    dropId = 310334,
    dropType = 0,
    dataId = 221,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 20,
    max = 20,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1628)->
    #dropCfg {
    dropId = 310334,
    dropType = 0,
    dataId = 1113,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 2,
    max = 2,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1629)->
    #dropCfg {
    dropId = 310335,
    dropType = 0,
    dataId = 221,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 0,
    max = 0,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1630)->
    #dropCfg {
    dropId = 310335,
    dropType = 0,
    dataId = 1113,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 2,
    max = 2,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1631)->
    #dropCfg {
    dropId = 310336,
    dropType = 0,
    dataId = 221,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 0,
    max = 0,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1632)->
    #dropCfg {
    dropId = 310336,
    dropType = 0,
    dataId = 1113,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 2,
    max = 2,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1633)->
    #dropCfg {
    dropId = 310337,
    dropType = 0,
    dataId = 221,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 0,
    max = 0,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1634)->
    #dropCfg {
    dropId = 310337,
    dropType = 0,
    dataId = 1113,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 2,
    max = 2,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1635)->
    #dropCfg {
    dropId = 310338,
    dropType = 0,
    dataId = 221,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 0,
    max = 0,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1636)->
    #dropCfg {
    dropId = 310338,
    dropType = 0,
    dataId = 1113,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 2,
    max = 2,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1637)->
    #dropCfg {
    dropId = 310339,
    dropType = 0,
    dataId = 221,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 20,
    max = 20,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1638)->
    #dropCfg {
    dropId = 310339,
    dropType = 0,
    dataId = 1113,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 2,
    max = 2,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1639)->
    #dropCfg {
    dropId = 310340,
    dropType = 0,
    dataId = 221,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 0,
    max = 0,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1640)->
    #dropCfg {
    dropId = 310340,
    dropType = 0,
    dataId = 1113,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 2,
    max = 2,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1641)->
    #dropCfg {
    dropId = 310341,
    dropType = 0,
    dataId = 221,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 0,
    max = 0,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1642)->
    #dropCfg {
    dropId = 310341,
    dropType = 0,
    dataId = 1113,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 2,
    max = 2,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1643)->
    #dropCfg {
    dropId = 310342,
    dropType = 0,
    dataId = 221,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 0,
    max = 0,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1644)->
    #dropCfg {
    dropId = 310342,
    dropType = 0,
    dataId = 1113,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 2,
    max = 2,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1645)->
    #dropCfg {
    dropId = 310343,
    dropType = 0,
    dataId = 221,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 0,
    max = 0,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1646)->
    #dropCfg {
    dropId = 310343,
    dropType = 0,
    dataId = 1113,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 2,
    max = 2,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1647)->
    #dropCfg {
    dropId = 310344,
    dropType = 0,
    dataId = 221,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 25,
    max = 25,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1648)->
    #dropCfg {
    dropId = 310344,
    dropType = 0,
    dataId = 1113,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 3,
    max = 3,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1649)->
    #dropCfg {
    dropId = 310345,
    dropType = 0,
    dataId = 221,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 0,
    max = 0,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1650)->
    #dropCfg {
    dropId = 310345,
    dropType = 0,
    dataId = 1113,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 3,
    max = 3,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1651)->
    #dropCfg {
    dropId = 310346,
    dropType = 0,
    dataId = 221,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 0,
    max = 0,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1652)->
    #dropCfg {
    dropId = 310346,
    dropType = 0,
    dataId = 1113,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 3,
    max = 3,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1653)->
    #dropCfg {
    dropId = 310347,
    dropType = 0,
    dataId = 221,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 0,
    max = 0,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1654)->
    #dropCfg {
    dropId = 310347,
    dropType = 0,
    dataId = 1113,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 3,
    max = 3,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1655)->
    #dropCfg {
    dropId = 310348,
    dropType = 0,
    dataId = 221,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 0,
    max = 0,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1656)->
    #dropCfg {
    dropId = 310348,
    dropType = 0,
    dataId = 1113,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 3,
    max = 3,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1657)->
    #dropCfg {
    dropId = 310349,
    dropType = 0,
    dataId = 221,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 25,
    max = 25,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1658)->
    #dropCfg {
    dropId = 310349,
    dropType = 0,
    dataId = 1113,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 3,
    max = 3,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1659)->
    #dropCfg {
    dropId = 310350,
    dropType = 0,
    dataId = 221,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 0,
    max = 0,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1660)->
    #dropCfg {
    dropId = 310350,
    dropType = 0,
    dataId = 1113,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 3,
    max = 3,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1661)->
    #dropCfg {
    dropId = 310351,
    dropType = 0,
    dataId = 221,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 0,
    max = 0,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1662)->
    #dropCfg {
    dropId = 310351,
    dropType = 0,
    dataId = 1113,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 3,
    max = 3,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1663)->
    #dropCfg {
    dropId = 310352,
    dropType = 0,
    dataId = 221,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 0,
    max = 0,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1664)->
    #dropCfg {
    dropId = 310352,
    dropType = 0,
    dataId = 1113,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 3,
    max = 3,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1665)->
    #dropCfg {
    dropId = 310353,
    dropType = 0,
    dataId = 221,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 0,
    max = 0,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1666)->
    #dropCfg {
    dropId = 310353,
    dropType = 0,
    dataId = 1113,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 3,
    max = 3,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1667)->
    #dropCfg {
    dropId = 310354,
    dropType = 0,
    dataId = 221,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 25,
    max = 25,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1668)->
    #dropCfg {
    dropId = 310354,
    dropType = 0,
    dataId = 1113,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 3,
    max = 3,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1669)->
    #dropCfg {
    dropId = 310355,
    dropType = 0,
    dataId = 221,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 0,
    max = 0,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1670)->
    #dropCfg {
    dropId = 310355,
    dropType = 0,
    dataId = 1113,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 3,
    max = 3,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1671)->
    #dropCfg {
    dropId = 310356,
    dropType = 0,
    dataId = 221,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 0,
    max = 0,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1672)->
    #dropCfg {
    dropId = 310356,
    dropType = 0,
    dataId = 1113,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 3,
    max = 3,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1673)->
    #dropCfg {
    dropId = 310357,
    dropType = 0,
    dataId = 221,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 0,
    max = 0,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1674)->
    #dropCfg {
    dropId = 310357,
    dropType = 0,
    dataId = 1113,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 3,
    max = 3,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1675)->
    #dropCfg {
    dropId = 310358,
    dropType = 0,
    dataId = 221,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 0,
    max = 0,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1676)->
    #dropCfg {
    dropId = 310358,
    dropType = 0,
    dataId = 1113,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 3,
    max = 3,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1677)->
    #dropCfg {
    dropId = 310359,
    dropType = 0,
    dataId = 221,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 30,
    max = 30,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1678)->
    #dropCfg {
    dropId = 310359,
    dropType = 0,
    dataId = 1113,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 4,
    max = 4,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1679)->
    #dropCfg {
    dropId = 310360,
    dropType = 0,
    dataId = 221,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 0,
    max = 0,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1680)->
    #dropCfg {
    dropId = 310360,
    dropType = 0,
    dataId = 1113,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 4,
    max = 4,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1681)->
    #dropCfg {
    dropId = 310361,
    dropType = 0,
    dataId = 221,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 0,
    max = 0,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1682)->
    #dropCfg {
    dropId = 310361,
    dropType = 0,
    dataId = 1113,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 4,
    max = 4,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1683)->
    #dropCfg {
    dropId = 310362,
    dropType = 0,
    dataId = 221,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 0,
    max = 0,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1684)->
    #dropCfg {
    dropId = 310362,
    dropType = 0,
    dataId = 1113,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 4,
    max = 4,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1685)->
    #dropCfg {
    dropId = 310363,
    dropType = 0,
    dataId = 221,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 0,
    max = 0,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1686)->
    #dropCfg {
    dropId = 310363,
    dropType = 0,
    dataId = 1113,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 4,
    max = 4,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1687)->
    #dropCfg {
    dropId = 310364,
    dropType = 0,
    dataId = 221,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 30,
    max = 30,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1688)->
    #dropCfg {
    dropId = 310364,
    dropType = 0,
    dataId = 1113,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 4,
    max = 4,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1689)->
    #dropCfg {
    dropId = 310365,
    dropType = 0,
    dataId = 221,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 0,
    max = 0,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1690)->
    #dropCfg {
    dropId = 310365,
    dropType = 0,
    dataId = 1113,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 4,
    max = 4,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1691)->
    #dropCfg {
    dropId = 310366,
    dropType = 0,
    dataId = 221,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 0,
    max = 0,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1692)->
    #dropCfg {
    dropId = 310366,
    dropType = 0,
    dataId = 1113,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 4,
    max = 4,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1693)->
    #dropCfg {
    dropId = 310367,
    dropType = 0,
    dataId = 221,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 0,
    max = 0,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1694)->
    #dropCfg {
    dropId = 310367,
    dropType = 0,
    dataId = 1113,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 4,
    max = 4,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1695)->
    #dropCfg {
    dropId = 310368,
    dropType = 0,
    dataId = 221,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 0,
    max = 0,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1696)->
    #dropCfg {
    dropId = 310368,
    dropType = 0,
    dataId = 1113,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 4,
    max = 4,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1697)->
    #dropCfg {
    dropId = 310369,
    dropType = 0,
    dataId = 221,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 35,
    max = 35,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1698)->
    #dropCfg {
    dropId = 310369,
    dropType = 0,
    dataId = 1113,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 5,
    max = 5,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1699)->
    #dropCfg {
    dropId = 310370,
    dropType = 0,
    dataId = 221,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 0,
    max = 0,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1700)->
    #dropCfg {
    dropId = 310370,
    dropType = 0,
    dataId = 1113,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 5,
    max = 5,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1701)->
    #dropCfg {
    dropId = 310371,
    dropType = 0,
    dataId = 221,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 0,
    max = 0,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1702)->
    #dropCfg {
    dropId = 310371,
    dropType = 0,
    dataId = 1113,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 5,
    max = 5,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1703)->
    #dropCfg {
    dropId = 310372,
    dropType = 0,
    dataId = 221,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 0,
    max = 0,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1704)->
    #dropCfg {
    dropId = 310372,
    dropType = 0,
    dataId = 1113,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 5,
    max = 5,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1705)->
    #dropCfg {
    dropId = 310373,
    dropType = 0,
    dataId = 221,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 0,
    max = 0,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1706)->
    #dropCfg {
    dropId = 310373,
    dropType = 0,
    dataId = 1113,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 5,
    max = 5,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1707)->
    #dropCfg {
    dropId = 310374,
    dropType = 0,
    dataId = 221,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 35,
    max = 35,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1708)->
    #dropCfg {
    dropId = 310374,
    dropType = 0,
    dataId = 1113,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 5,
    max = 5,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1709)->
    #dropCfg {
    dropId = 310375,
    dropType = 0,
    dataId = 221,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 0,
    max = 0,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1710)->
    #dropCfg {
    dropId = 310375,
    dropType = 0,
    dataId = 1113,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 5,
    max = 5,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1711)->
    #dropCfg {
    dropId = 310376,
    dropType = 0,
    dataId = 221,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 0,
    max = 0,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1712)->
    #dropCfg {
    dropId = 310376,
    dropType = 0,
    dataId = 1113,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 5,
    max = 5,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1713)->
    #dropCfg {
    dropId = 310377,
    dropType = 0,
    dataId = 221,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 0,
    max = 0,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1714)->
    #dropCfg {
    dropId = 310377,
    dropType = 0,
    dataId = 1113,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 5,
    max = 5,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1715)->
    #dropCfg {
    dropId = 310378,
    dropType = 0,
    dataId = 221,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 0,
    max = 0,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1716)->
    #dropCfg {
    dropId = 310378,
    dropType = 0,
    dataId = 1113,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 5,
    max = 5,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1717)->
    #dropCfg {
    dropId = 310379,
    dropType = 0,
    dataId = 221,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 40,
    max = 40,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1718)->
    #dropCfg {
    dropId = 310379,
    dropType = 0,
    dataId = 1113,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 6,
    max = 6,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1719)->
    #dropCfg {
    dropId = 310380,
    dropType = 0,
    dataId = 221,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 0,
    max = 0,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1720)->
    #dropCfg {
    dropId = 310380,
    dropType = 0,
    dataId = 1113,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 6,
    max = 6,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1721)->
    #dropCfg {
    dropId = 310381,
    dropType = 0,
    dataId = 221,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 0,
    max = 0,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1722)->
    #dropCfg {
    dropId = 310381,
    dropType = 0,
    dataId = 1113,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 6,
    max = 6,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1723)->
    #dropCfg {
    dropId = 310382,
    dropType = 0,
    dataId = 221,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 0,
    max = 0,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1724)->
    #dropCfg {
    dropId = 310382,
    dropType = 0,
    dataId = 1113,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 6,
    max = 6,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1725)->
    #dropCfg {
    dropId = 310383,
    dropType = 0,
    dataId = 221,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 0,
    max = 0,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1726)->
    #dropCfg {
    dropId = 310383,
    dropType = 0,
    dataId = 1113,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 6,
    max = 6,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1727)->
    #dropCfg {
    dropId = 310384,
    dropType = 0,
    dataId = 221,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 40,
    max = 40,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1728)->
    #dropCfg {
    dropId = 310384,
    dropType = 0,
    dataId = 1113,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 6,
    max = 6,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1729)->
    #dropCfg {
    dropId = 310385,
    dropType = 0,
    dataId = 221,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 0,
    max = 0,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1730)->
    #dropCfg {
    dropId = 310385,
    dropType = 0,
    dataId = 1113,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 6,
    max = 6,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1731)->
    #dropCfg {
    dropId = 310386,
    dropType = 0,
    dataId = 221,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 0,
    max = 0,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1732)->
    #dropCfg {
    dropId = 310386,
    dropType = 0,
    dataId = 1113,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 6,
    max = 6,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1733)->
    #dropCfg {
    dropId = 310387,
    dropType = 0,
    dataId = 221,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 0,
    max = 0,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1734)->
    #dropCfg {
    dropId = 310387,
    dropType = 0,
    dataId = 1113,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 6,
    max = 6,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1735)->
    #dropCfg {
    dropId = 310388,
    dropType = 0,
    dataId = 221,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 0,
    max = 0,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1736)->
    #dropCfg {
    dropId = 310388,
    dropType = 0,
    dataId = 1113,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 6,
    max = 6,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1737)->
    #dropCfg {
    dropId = 310389,
    dropType = 0,
    dataId = 221,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 45,
    max = 45,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1738)->
    #dropCfg {
    dropId = 310389,
    dropType = 0,
    dataId = 1113,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 7,
    max = 7,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1739)->
    #dropCfg {
    dropId = 310390,
    dropType = 0,
    dataId = 221,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 0,
    max = 0,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1740)->
    #dropCfg {
    dropId = 310390,
    dropType = 0,
    dataId = 1113,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 7,
    max = 7,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1741)->
    #dropCfg {
    dropId = 310391,
    dropType = 0,
    dataId = 221,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 0,
    max = 0,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1742)->
    #dropCfg {
    dropId = 310391,
    dropType = 0,
    dataId = 1113,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 7,
    max = 7,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1743)->
    #dropCfg {
    dropId = 310392,
    dropType = 0,
    dataId = 221,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 0,
    max = 0,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1744)->
    #dropCfg {
    dropId = 310392,
    dropType = 0,
    dataId = 1113,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 7,
    max = 7,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1745)->
    #dropCfg {
    dropId = 310393,
    dropType = 0,
    dataId = 221,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 0,
    max = 0,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1746)->
    #dropCfg {
    dropId = 310393,
    dropType = 0,
    dataId = 1113,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 7,
    max = 7,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1747)->
    #dropCfg {
    dropId = 310394,
    dropType = 0,
    dataId = 221,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 45,
    max = 45,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1748)->
    #dropCfg {
    dropId = 310394,
    dropType = 0,
    dataId = 1113,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 7,
    max = 7,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1749)->
    #dropCfg {
    dropId = 310395,
    dropType = 0,
    dataId = 221,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 0,
    max = 0,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1750)->
    #dropCfg {
    dropId = 310395,
    dropType = 0,
    dataId = 1113,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 7,
    max = 7,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1751)->
    #dropCfg {
    dropId = 310396,
    dropType = 0,
    dataId = 221,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 0,
    max = 0,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1752)->
    #dropCfg {
    dropId = 310396,
    dropType = 0,
    dataId = 1113,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 7,
    max = 7,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1753)->
    #dropCfg {
    dropId = 310397,
    dropType = 0,
    dataId = 221,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 0,
    max = 0,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1754)->
    #dropCfg {
    dropId = 310397,
    dropType = 0,
    dataId = 1113,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 7,
    max = 7,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1755)->
    #dropCfg {
    dropId = 310398,
    dropType = 0,
    dataId = 221,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 0,
    max = 0,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1756)->
    #dropCfg {
    dropId = 310398,
    dropType = 0,
    dataId = 1113,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 7,
    max = 7,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1757)->
    #dropCfg {
    dropId = 310399,
    dropType = 0,
    dataId = 221,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 50,
    max = 50,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1758)->
    #dropCfg {
    dropId = 310399,
    dropType = 0,
    dataId = 1113,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 8,
    max = 8,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1759)->
    #dropCfg {
    dropId = 310400,
    dropType = 0,
    dataId = 221,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 0,
    max = 0,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1760)->
    #dropCfg {
    dropId = 310400,
    dropType = 0,
    dataId = 1113,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 8,
    max = 8,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1761)->
    #dropCfg {
    dropId = 310401,
    dropType = 0,
    dataId = 221,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 0,
    max = 0,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1762)->
    #dropCfg {
    dropId = 310401,
    dropType = 0,
    dataId = 1113,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 8,
    max = 8,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1763)->
    #dropCfg {
    dropId = 310402,
    dropType = 0,
    dataId = 221,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 0,
    max = 0,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1764)->
    #dropCfg {
    dropId = 310402,
    dropType = 0,
    dataId = 1113,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 8,
    max = 8,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1765)->
    #dropCfg {
    dropId = 310403,
    dropType = 0,
    dataId = 221,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 0,
    max = 0,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1766)->
    #dropCfg {
    dropId = 310403,
    dropType = 0,
    dataId = 1113,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 8,
    max = 8,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1767)->
    #dropCfg {
    dropId = 310404,
    dropType = 0,
    dataId = 221,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 50,
    max = 50,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1768)->
    #dropCfg {
    dropId = 310404,
    dropType = 0,
    dataId = 1113,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 8,
    max = 8,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1769)->
    #dropCfg {
    dropId = 310405,
    dropType = 0,
    dataId = 221,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 0,
    max = 0,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1770)->
    #dropCfg {
    dropId = 310405,
    dropType = 0,
    dataId = 1113,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 8,
    max = 8,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1771)->
    #dropCfg {
    dropId = 310406,
    dropType = 0,
    dataId = 221,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 0,
    max = 0,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1772)->
    #dropCfg {
    dropId = 310406,
    dropType = 0,
    dataId = 1113,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 8,
    max = 8,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1773)->
    #dropCfg {
    dropId = 310407,
    dropType = 0,
    dataId = 221,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 0,
    max = 0,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1774)->
    #dropCfg {
    dropId = 310407,
    dropType = 0,
    dataId = 1113,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 8,
    max = 8,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1775)->
    #dropCfg {
    dropId = 310408,
    dropType = 0,
    dataId = 221,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 0,
    max = 0,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1776)->
    #dropCfg {
    dropId = 310408,
    dropType = 0,
    dataId = 1113,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 8,
    max = 8,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1777)->
    #dropCfg {
    dropId = 310409,
    dropType = 0,
    dataId = 221,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 50,
    max = 50,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1778)->
    #dropCfg {
    dropId = 310409,
    dropType = 0,
    dataId = 1113,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 8,
    max = 8,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1779)->
    #dropCfg {
    dropId = 310410,
    dropType = 0,
    dataId = 221,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 0,
    max = 0,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1780)->
    #dropCfg {
    dropId = 310410,
    dropType = 0,
    dataId = 1113,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 8,
    max = 8,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1781)->
    #dropCfg {
    dropId = 310411,
    dropType = 0,
    dataId = 221,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 0,
    max = 0,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1782)->
    #dropCfg {
    dropId = 310411,
    dropType = 0,
    dataId = 1113,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 8,
    max = 8,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1783)->
    #dropCfg {
    dropId = 310412,
    dropType = 0,
    dataId = 221,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 0,
    max = 0,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1784)->
    #dropCfg {
    dropId = 310412,
    dropType = 0,
    dataId = 1113,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 8,
    max = 8,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1785)->
    #dropCfg {
    dropId = 310413,
    dropType = 0,
    dataId = 221,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 0,
    max = 0,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1786)->
    #dropCfg {
    dropId = 310413,
    dropType = 0,
    dataId = 1113,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 8,
    max = 8,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1787)->
    #dropCfg {
    dropId = 310414,
    dropType = 0,
    dataId = 221,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 50,
    max = 50,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1788)->
    #dropCfg {
    dropId = 310414,
    dropType = 0,
    dataId = 1113,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 8,
    max = 8,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1789)->
    #dropCfg {
    dropId = 310415,
    dropType = 0,
    dataId = 221,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 0,
    max = 0,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1790)->
    #dropCfg {
    dropId = 310415,
    dropType = 0,
    dataId = 1113,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 8,
    max = 8,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1791)->
    #dropCfg {
    dropId = 310416,
    dropType = 0,
    dataId = 221,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 0,
    max = 0,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1792)->
    #dropCfg {
    dropId = 310416,
    dropType = 0,
    dataId = 1113,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 8,
    max = 8,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1793)->
    #dropCfg {
    dropId = 310417,
    dropType = 0,
    dataId = 221,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 0,
    max = 0,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1794)->
    #dropCfg {
    dropId = 310417,
    dropType = 0,
    dataId = 1113,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 8,
    max = 8,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1795)->
    #dropCfg {
    dropId = 310418,
    dropType = 0,
    dataId = 221,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 0,
    max = 0,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1796)->
    #dropCfg {
    dropId = 310418,
    dropType = 0,
    dataId = 1113,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 8,
    max = 8,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1797)->
    #dropCfg {
    dropId = 310419,
    dropType = 0,
    dataId = 221,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 50,
    max = 50,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1798)->
    #dropCfg {
    dropId = 310419,
    dropType = 0,
    dataId = 1113,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 8,
    max = 8,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1799)->
    #dropCfg {
    dropId = 310420,
    dropType = 0,
    dataId = 221,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 0,
    max = 0,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1800)->
    #dropCfg {
    dropId = 310420,
    dropType = 0,
    dataId = 1113,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 8,
    max = 8,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1801)->
    #dropCfg {
    dropId = 310421,
    dropType = 0,
    dataId = 221,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 0,
    max = 0,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1802)->
    #dropCfg {
    dropId = 310421,
    dropType = 0,
    dataId = 1113,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 8,
    max = 8,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1803)->
    #dropCfg {
    dropId = 310422,
    dropType = 0,
    dataId = 221,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 0,
    max = 0,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1804)->
    #dropCfg {
    dropId = 310422,
    dropType = 0,
    dataId = 1113,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 8,
    max = 8,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1805)->
    #dropCfg {
    dropId = 310423,
    dropType = 0,
    dataId = 221,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 0,
    max = 0,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1806)->
    #dropCfg {
    dropId = 310423,
    dropType = 0,
    dataId = 1113,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 8,
    max = 8,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1807)->
    #dropCfg {
    dropId = 310424,
    dropType = 0,
    dataId = 221,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 50,
    max = 50,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1808)->
    #dropCfg {
    dropId = 310424,
    dropType = 0,
    dataId = 1113,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 8,
    max = 8,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1809)->
    #dropCfg {
    dropId = 310425,
    dropType = 0,
    dataId = 221,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 0,
    max = 0,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1810)->
    #dropCfg {
    dropId = 310425,
    dropType = 0,
    dataId = 1113,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 8,
    max = 8,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1811)->
    #dropCfg {
    dropId = 310426,
    dropType = 0,
    dataId = 221,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 0,
    max = 0,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1812)->
    #dropCfg {
    dropId = 310426,
    dropType = 0,
    dataId = 1113,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 8,
    max = 8,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1813)->
    #dropCfg {
    dropId = 310427,
    dropType = 0,
    dataId = 221,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 0,
    max = 0,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1814)->
    #dropCfg {
    dropId = 310427,
    dropType = 0,
    dataId = 1113,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 8,
    max = 8,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1815)->
    #dropCfg {
    dropId = 310428,
    dropType = 0,
    dataId = 221,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 0,
    max = 0,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1816)->
    #dropCfg {
    dropId = 310428,
    dropType = 0,
    dataId = 1113,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 8,
    max = 8,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1817)->
    #dropCfg {
    dropId = 310429,
    dropType = 0,
    dataId = 221,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 50,
    max = 50,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1818)->
    #dropCfg {
    dropId = 310429,
    dropType = 0,
    dataId = 1113,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 8,
    max = 8,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1819)->
    #dropCfg {
    dropId = 310430,
    dropType = 0,
    dataId = 221,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 0,
    max = 0,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1820)->
    #dropCfg {
    dropId = 310430,
    dropType = 0,
    dataId = 1113,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 8,
    max = 8,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1821)->
    #dropCfg {
    dropId = 310431,
    dropType = 0,
    dataId = 221,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 0,
    max = 0,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1822)->
    #dropCfg {
    dropId = 310431,
    dropType = 0,
    dataId = 1113,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 8,
    max = 8,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1823)->
    #dropCfg {
    dropId = 310432,
    dropType = 0,
    dataId = 221,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 0,
    max = 0,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1824)->
    #dropCfg {
    dropId = 310432,
    dropType = 0,
    dataId = 1113,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 8,
    max = 8,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1825)->
    #dropCfg {
    dropId = 310433,
    dropType = 0,
    dataId = 221,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 0,
    max = 0,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1826)->
    #dropCfg {
    dropId = 310433,
    dropType = 0,
    dataId = 1113,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 8,
    max = 8,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1827)->
    #dropCfg {
    dropId = 310434,
    dropType = 0,
    dataId = 221,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 50,
    max = 50,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1828)->
    #dropCfg {
    dropId = 310434,
    dropType = 0,
    dataId = 1113,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 8,
    max = 8,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1829)->
    #dropCfg {
    dropId = 310435,
    dropType = 0,
    dataId = 221,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 0,
    max = 0,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1830)->
    #dropCfg {
    dropId = 310435,
    dropType = 0,
    dataId = 1113,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 8,
    max = 8,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1831)->
    #dropCfg {
    dropId = 310436,
    dropType = 0,
    dataId = 221,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 0,
    max = 0,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1832)->
    #dropCfg {
    dropId = 310436,
    dropType = 0,
    dataId = 1113,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 8,
    max = 8,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1833)->
    #dropCfg {
    dropId = 310437,
    dropType = 0,
    dataId = 221,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 0,
    max = 0,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1834)->
    #dropCfg {
    dropId = 310437,
    dropType = 0,
    dataId = 1113,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 8,
    max = 8,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1835)->
    #dropCfg {
    dropId = 310438,
    dropType = 0,
    dataId = 221,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 0,
    max = 0,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1836)->
    #dropCfg {
    dropId = 310438,
    dropType = 0,
    dataId = 1113,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 8,
    max = 8,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1837)->
    #dropCfg {
    dropId = 310439,
    dropType = 0,
    dataId = 221,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 50,
    max = 50,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1838)->
    #dropCfg {
    dropId = 310439,
    dropType = 0,
    dataId = 1113,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 8,
    max = 8,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1839)->
    #dropCfg {
    dropId = 310440,
    dropType = 0,
    dataId = 221,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 0,
    max = 0,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1840)->
    #dropCfg {
    dropId = 310440,
    dropType = 0,
    dataId = 1113,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 8,
    max = 8,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1841)->
    #dropCfg {
    dropId = 310441,
    dropType = 0,
    dataId = 221,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 0,
    max = 0,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1842)->
    #dropCfg {
    dropId = 310441,
    dropType = 0,
    dataId = 1113,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 8,
    max = 8,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1843)->
    #dropCfg {
    dropId = 310442,
    dropType = 0,
    dataId = 221,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 0,
    max = 0,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1844)->
    #dropCfg {
    dropId = 310442,
    dropType = 0,
    dataId = 1113,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 8,
    max = 8,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1845)->
    #dropCfg {
    dropId = 310443,
    dropType = 0,
    dataId = 221,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 0,
    max = 0,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1846)->
    #dropCfg {
    dropId = 310443,
    dropType = 0,
    dataId = 1113,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 8,
    max = 8,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1847)->
    #dropCfg {
    dropId = 310444,
    dropType = 0,
    dataId = 221,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 50,
    max = 50,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1848)->
    #dropCfg {
    dropId = 310444,
    dropType = 0,
    dataId = 1113,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 8,
    max = 8,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1849)->
    #dropCfg {
    dropId = 310445,
    dropType = 0,
    dataId = 221,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 0,
    max = 0,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1850)->
    #dropCfg {
    dropId = 310445,
    dropType = 0,
    dataId = 1113,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 8,
    max = 8,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1851)->
    #dropCfg {
    dropId = 310446,
    dropType = 0,
    dataId = 221,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 0,
    max = 0,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1852)->
    #dropCfg {
    dropId = 310446,
    dropType = 0,
    dataId = 1113,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 8,
    max = 8,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1853)->
    #dropCfg {
    dropId = 310447,
    dropType = 0,
    dataId = 221,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 0,
    max = 0,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1854)->
    #dropCfg {
    dropId = 310447,
    dropType = 0,
    dataId = 1113,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 8,
    max = 8,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1855)->
    #dropCfg {
    dropId = 310448,
    dropType = 0,
    dataId = 221,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 0,
    max = 0,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1856)->
    #dropCfg {
    dropId = 310448,
    dropType = 0,
    dataId = 1113,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 8,
    max = 8,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1857)->
    #dropCfg {
    dropId = 310449,
    dropType = 0,
    dataId = 221,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 50,
    max = 50,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1858)->
    #dropCfg {
    dropId = 310449,
    dropType = 0,
    dataId = 1113,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 8,
    max = 8,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1859)->
    #dropCfg {
    dropId = 310450,
    dropType = 0,
    dataId = 221,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 0,
    max = 0,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1860)->
    #dropCfg {
    dropId = 310450,
    dropType = 0,
    dataId = 1113,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 8,
    max = 8,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1861)->
    #dropCfg {
    dropId = 310451,
    dropType = 0,
    dataId = 221,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 0,
    max = 0,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1862)->
    #dropCfg {
    dropId = 310451,
    dropType = 0,
    dataId = 1113,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 8,
    max = 8,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1863)->
    #dropCfg {
    dropId = 310452,
    dropType = 0,
    dataId = 221,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 0,
    max = 0,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1864)->
    #dropCfg {
    dropId = 310452,
    dropType = 0,
    dataId = 1113,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 8,
    max = 8,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1865)->
    #dropCfg {
    dropId = 310453,
    dropType = 0,
    dataId = 221,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 0,
    max = 0,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1866)->
    #dropCfg {
    dropId = 310453,
    dropType = 0,
    dataId = 1113,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 8,
    max = 8,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1867)->
    #dropCfg {
    dropId = 310454,
    dropType = 0,
    dataId = 221,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 50,
    max = 50,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1868)->
    #dropCfg {
    dropId = 310454,
    dropType = 0,
    dataId = 1113,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 8,
    max = 8,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1869)->
    #dropCfg {
    dropId = 310455,
    dropType = 0,
    dataId = 221,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 0,
    max = 0,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1870)->
    #dropCfg {
    dropId = 310455,
    dropType = 0,
    dataId = 1113,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 8,
    max = 8,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1871)->
    #dropCfg {
    dropId = 310456,
    dropType = 0,
    dataId = 221,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 0,
    max = 0,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1872)->
    #dropCfg {
    dropId = 310456,
    dropType = 0,
    dataId = 1113,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 8,
    max = 8,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1873)->
    #dropCfg {
    dropId = 310457,
    dropType = 0,
    dataId = 221,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 0,
    max = 0,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1874)->
    #dropCfg {
    dropId = 310457,
    dropType = 0,
    dataId = 1113,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 8,
    max = 8,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1875)->
    #dropCfg {
    dropId = 310458,
    dropType = 0,
    dataId = 221,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 0,
    max = 0,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1876)->
    #dropCfg {
    dropId = 310458,
    dropType = 0,
    dataId = 1113,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 8,
    max = 8,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1877)->
    #dropCfg {
    dropId = 310459,
    dropType = 0,
    dataId = 221,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 50,
    max = 50,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1878)->
    #dropCfg {
    dropId = 310459,
    dropType = 0,
    dataId = 1113,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 8,
    max = 8,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1879)->
    #dropCfg {
    dropId = 310460,
    dropType = 0,
    dataId = 221,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 0,
    max = 0,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1880)->
    #dropCfg {
    dropId = 310460,
    dropType = 0,
    dataId = 1113,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 8,
    max = 8,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1881)->
    #dropCfg {
    dropId = 310461,
    dropType = 0,
    dataId = 221,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 0,
    max = 0,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1882)->
    #dropCfg {
    dropId = 310461,
    dropType = 0,
    dataId = 1113,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 8,
    max = 8,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1883)->
    #dropCfg {
    dropId = 310462,
    dropType = 0,
    dataId = 221,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 0,
    max = 0,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1884)->
    #dropCfg {
    dropId = 310462,
    dropType = 0,
    dataId = 1113,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 8,
    max = 8,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1885)->
    #dropCfg {
    dropId = 310463,
    dropType = 0,
    dataId = 221,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 0,
    max = 0,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1886)->
    #dropCfg {
    dropId = 310463,
    dropType = 0,
    dataId = 1113,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 8,
    max = 8,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1887)->
    #dropCfg {
    dropId = 310464,
    dropType = 0,
    dataId = 221,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 50,
    max = 50,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1888)->
    #dropCfg {
    dropId = 310464,
    dropType = 0,
    dataId = 1113,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 8,
    max = 8,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1889)->
    #dropCfg {
    dropId = 310465,
    dropType = 0,
    dataId = 221,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 0,
    max = 0,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1890)->
    #dropCfg {
    dropId = 310465,
    dropType = 0,
    dataId = 1113,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 8,
    max = 8,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1891)->
    #dropCfg {
    dropId = 310466,
    dropType = 0,
    dataId = 221,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 0,
    max = 0,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1892)->
    #dropCfg {
    dropId = 310466,
    dropType = 0,
    dataId = 1113,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 8,
    max = 8,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1893)->
    #dropCfg {
    dropId = 310467,
    dropType = 0,
    dataId = 221,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 0,
    max = 0,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1894)->
    #dropCfg {
    dropId = 310467,
    dropType = 0,
    dataId = 1113,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 8,
    max = 8,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1895)->
    #dropCfg {
    dropId = 310468,
    dropType = 0,
    dataId = 221,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 0,
    max = 0,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1896)->
    #dropCfg {
    dropId = 310468,
    dropType = 0,
    dataId = 1113,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 8,
    max = 8,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1897)->
    #dropCfg {
    dropId = 310469,
    dropType = 0,
    dataId = 221,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 50,
    max = 50,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1898)->
    #dropCfg {
    dropId = 310469,
    dropType = 0,
    dataId = 1113,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 8,
    max = 8,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1899)->
    #dropCfg {
    dropId = 310470,
    dropType = 0,
    dataId = 221,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 0,
    max = 0,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1900)->
    #dropCfg {
    dropId = 310470,
    dropType = 0,
    dataId = 1113,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 8,
    max = 8,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1901)->
    #dropCfg {
    dropId = 310471,
    dropType = 0,
    dataId = 221,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 0,
    max = 0,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1902)->
    #dropCfg {
    dropId = 310471,
    dropType = 0,
    dataId = 1113,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 8,
    max = 8,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1903)->
    #dropCfg {
    dropId = 310472,
    dropType = 0,
    dataId = 221,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 0,
    max = 0,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1904)->
    #dropCfg {
    dropId = 310472,
    dropType = 0,
    dataId = 1113,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 8,
    max = 8,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1905)->
    #dropCfg {
    dropId = 310473,
    dropType = 0,
    dataId = 221,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 0,
    max = 0,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1906)->
    #dropCfg {
    dropId = 310473,
    dropType = 0,
    dataId = 1113,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 8,
    max = 8,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1907)->
    #dropCfg {
    dropId = 310474,
    dropType = 0,
    dataId = 221,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 50,
    max = 50,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1908)->
    #dropCfg {
    dropId = 310474,
    dropType = 0,
    dataId = 1113,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 8,
    max = 8,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1909)->
    #dropCfg {
    dropId = 310475,
    dropType = 0,
    dataId = 221,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 0,
    max = 0,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1910)->
    #dropCfg {
    dropId = 310475,
    dropType = 0,
    dataId = 1113,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 8,
    max = 8,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1911)->
    #dropCfg {
    dropId = 310476,
    dropType = 0,
    dataId = 221,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 0,
    max = 0,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1912)->
    #dropCfg {
    dropId = 310476,
    dropType = 0,
    dataId = 1113,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 8,
    max = 8,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1913)->
    #dropCfg {
    dropId = 310477,
    dropType = 0,
    dataId = 221,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 0,
    max = 0,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1914)->
    #dropCfg {
    dropId = 310477,
    dropType = 0,
    dataId = 1113,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 8,
    max = 8,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1915)->
    #dropCfg {
    dropId = 310478,
    dropType = 0,
    dataId = 221,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 0,
    max = 0,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1916)->
    #dropCfg {
    dropId = 310478,
    dropType = 0,
    dataId = 1113,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 8,
    max = 8,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1917)->
    #dropCfg {
    dropId = 310479,
    dropType = 0,
    dataId = 221,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 50,
    max = 50,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1918)->
    #dropCfg {
    dropId = 310479,
    dropType = 0,
    dataId = 1113,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 8,
    max = 8,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1919)->
    #dropCfg {
    dropId = 310480,
    dropType = 0,
    dataId = 221,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 0,
    max = 0,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1920)->
    #dropCfg {
    dropId = 310480,
    dropType = 0,
    dataId = 1113,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 8,
    max = 8,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1921)->
    #dropCfg {
    dropId = 310481,
    dropType = 0,
    dataId = 221,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 0,
    max = 0,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1922)->
    #dropCfg {
    dropId = 310481,
    dropType = 0,
    dataId = 1113,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 8,
    max = 8,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1923)->
    #dropCfg {
    dropId = 310482,
    dropType = 0,
    dataId = 221,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 0,
    max = 0,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1924)->
    #dropCfg {
    dropId = 310482,
    dropType = 0,
    dataId = 1113,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 8,
    max = 8,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1925)->
    #dropCfg {
    dropId = 310483,
    dropType = 0,
    dataId = 221,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 0,
    max = 0,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1926)->
    #dropCfg {
    dropId = 310483,
    dropType = 0,
    dataId = 1113,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 8,
    max = 8,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1927)->
    #dropCfg {
    dropId = 310484,
    dropType = 0,
    dataId = 221,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 50,
    max = 50,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1928)->
    #dropCfg {
    dropId = 310484,
    dropType = 0,
    dataId = 1113,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 8,
    max = 8,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1929)->
    #dropCfg {
    dropId = 310485,
    dropType = 0,
    dataId = 221,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 0,
    max = 0,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1930)->
    #dropCfg {
    dropId = 310485,
    dropType = 0,
    dataId = 1113,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 8,
    max = 8,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1931)->
    #dropCfg {
    dropId = 310486,
    dropType = 0,
    dataId = 221,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 0,
    max = 0,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1932)->
    #dropCfg {
    dropId = 310486,
    dropType = 0,
    dataId = 1113,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 8,
    max = 8,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1933)->
    #dropCfg {
    dropId = 310487,
    dropType = 0,
    dataId = 221,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 0,
    max = 0,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1934)->
    #dropCfg {
    dropId = 310487,
    dropType = 0,
    dataId = 1113,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 8,
    max = 8,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1935)->
    #dropCfg {
    dropId = 310488,
    dropType = 0,
    dataId = 221,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 0,
    max = 0,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1936)->
    #dropCfg {
    dropId = 310488,
    dropType = 0,
    dataId = 1113,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 8,
    max = 8,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1937)->
    #dropCfg {
    dropId = 310489,
    dropType = 0,
    dataId = 221,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 50,
    max = 50,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1938)->
    #dropCfg {
    dropId = 310489,
    dropType = 0,
    dataId = 1113,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 8,
    max = 8,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1939)->
    #dropCfg {
    dropId = 310490,
    dropType = 0,
    dataId = 221,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 0,
    max = 0,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1940)->
    #dropCfg {
    dropId = 310490,
    dropType = 0,
    dataId = 1113,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 8,
    max = 8,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1941)->
    #dropCfg {
    dropId = 310491,
    dropType = 0,
    dataId = 221,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 0,
    max = 0,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1942)->
    #dropCfg {
    dropId = 310491,
    dropType = 0,
    dataId = 1113,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 8,
    max = 8,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1943)->
    #dropCfg {
    dropId = 310492,
    dropType = 0,
    dataId = 221,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 0,
    max = 0,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1944)->
    #dropCfg {
    dropId = 310492,
    dropType = 0,
    dataId = 1113,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 8,
    max = 8,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1945)->
    #dropCfg {
    dropId = 310493,
    dropType = 0,
    dataId = 221,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 0,
    max = 0,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1946)->
    #dropCfg {
    dropId = 310493,
    dropType = 0,
    dataId = 1113,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 8,
    max = 8,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1947)->
    #dropCfg {
    dropId = 310494,
    dropType = 0,
    dataId = 221,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 50,
    max = 50,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1948)->
    #dropCfg {
    dropId = 310494,
    dropType = 0,
    dataId = 1113,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 8,
    max = 8,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1949)->
    #dropCfg {
    dropId = 310495,
    dropType = 0,
    dataId = 221,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 0,
    max = 0,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1950)->
    #dropCfg {
    dropId = 310495,
    dropType = 0,
    dataId = 1113,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 8,
    max = 8,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1951)->
    #dropCfg {
    dropId = 310496,
    dropType = 0,
    dataId = 221,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 0,
    max = 0,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1952)->
    #dropCfg {
    dropId = 310496,
    dropType = 0,
    dataId = 1113,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 8,
    max = 8,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1953)->
    #dropCfg {
    dropId = 310497,
    dropType = 0,
    dataId = 221,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 0,
    max = 0,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1954)->
    #dropCfg {
    dropId = 310497,
    dropType = 0,
    dataId = 1113,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 8,
    max = 8,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1955)->
    #dropCfg {
    dropId = 310498,
    dropType = 0,
    dataId = 221,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 0,
    max = 0,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1956)->
    #dropCfg {
    dropId = 310498,
    dropType = 0,
    dataId = 1113,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 8,
    max = 8,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1957)->
    #dropCfg {
    dropId = 310499,
    dropType = 0,
    dataId = 221,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 50,
    max = 50,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1958)->
    #dropCfg {
    dropId = 310499,
    dropType = 0,
    dataId = 1113,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 8,
    max = 8,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1959)->
    #dropCfg {
    dropId = 314000,
    dropType = 0,
    dataId = 700,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 2,
    max = 2,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1960)->
    #dropCfg {
    dropId = 314000,
    dropType = 0,
    dataId = 700,
    probability = 6000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(1961)->
    #dropCfg {
    dropId = 314001,
    dropType = 0,
    dataId = 700,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 2,
    max = 2,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1962)->
    #dropCfg {
    dropId = 314001,
    dropType = 0,
    dataId = 700,
    probability = 8600,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(1963)->
    #dropCfg {
    dropId = 314002,
    dropType = 0,
    dataId = 700,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 3,
    max = 3,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1964)->
    #dropCfg {
    dropId = 314002,
    dropType = 0,
    dataId = 700,
    probability = 3800,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(1965)->
    #dropCfg {
    dropId = 314003,
    dropType = 0,
    dataId = 702,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 2,
    max = 2,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1966)->
    #dropCfg {
    dropId = 314003,
    dropType = 0,
    dataId = 702,
    probability = 6000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(1967)->
    #dropCfg {
    dropId = 314004,
    dropType = 0,
    dataId = 700,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 3,
    max = 3,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1968)->
    #dropCfg {
    dropId = 314004,
    dropType = 0,
    dataId = 700,
    probability = 3800,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(1969)->
    #dropCfg {
    dropId = 314005,
    dropType = 0,
    dataId = 700,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 3,
    max = 3,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1970)->
    #dropCfg {
    dropId = 314005,
    dropType = 0,
    dataId = 700,
    probability = 7200,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(1971)->
    #dropCfg {
    dropId = 314006,
    dropType = 0,
    dataId = 700,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 4,
    max = 4,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1972)->
    #dropCfg {
    dropId = 314006,
    dropType = 0,
    dataId = 700,
    probability = 4000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(1973)->
    #dropCfg {
    dropId = 314007,
    dropType = 0,
    dataId = 702,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 3,
    max = 3,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1974)->
    #dropCfg {
    dropId = 314007,
    dropType = 0,
    dataId = 702,
    probability = 3800,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(1975)->
    #dropCfg {
    dropId = 314008,
    dropType = 0,
    dataId = 700,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 4,
    max = 4,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1976)->
    #dropCfg {
    dropId = 314008,
    dropType = 0,
    dataId = 700,
    probability = 4000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(1977)->
    #dropCfg {
    dropId = 314009,
    dropType = 0,
    dataId = 700,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 4,
    max = 4,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1978)->
    #dropCfg {
    dropId = 314009,
    dropType = 0,
    dataId = 700,
    probability = 8400,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(1979)->
    #dropCfg {
    dropId = 314010,
    dropType = 0,
    dataId = 700,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 5,
    max = 5,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1980)->
    #dropCfg {
    dropId = 314010,
    dropType = 0,
    dataId = 700,
    probability = 7200,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(1981)->
    #dropCfg {
    dropId = 314011,
    dropType = 0,
    dataId = 702,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 4,
    max = 4,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1982)->
    #dropCfg {
    dropId = 314011,
    dropType = 0,
    dataId = 702,
    probability = 3940,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(1983)->
    #dropCfg {
    dropId = 314012,
    dropType = 0,
    dataId = 700,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 5,
    max = 5,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1984)->
    #dropCfg {
    dropId = 314012,
    dropType = 0,
    dataId = 700,
    probability = 7200,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(1985)->
    #dropCfg {
    dropId = 314013,
    dropType = 0,
    dataId = 700,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 6,
    max = 6,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1986)->
    #dropCfg {
    dropId = 314013,
    dropType = 0,
    dataId = 700,
    probability = 3000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(1987)->
    #dropCfg {
    dropId = 314014,
    dropType = 0,
    dataId = 700,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 7,
    max = 7,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1988)->
    #dropCfg {
    dropId = 314014,
    dropType = 0,
    dataId = 700,
    probability = 4400,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(1989)->
    #dropCfg {
    dropId = 314015,
    dropType = 0,
    dataId = 702,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 5,
    max = 5,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1990)->
    #dropCfg {
    dropId = 314015,
    dropType = 0,
    dataId = 702,
    probability = 7120,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(1991)->
    #dropCfg {
    dropId = 314016,
    dropType = 0,
    dataId = 700,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 3,
    max = 3,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1992)->
    #dropCfg {
    dropId = 314016,
    dropType = 0,
    dataId = 700,
    probability = 9000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(1993)->
    #dropCfg {
    dropId = 314017,
    dropType = 0,
    dataId = 700,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 4,
    max = 4,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1994)->
    #dropCfg {
    dropId = 314017,
    dropType = 0,
    dataId = 700,
    probability = 2900,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(1995)->
    #dropCfg {
    dropId = 314018,
    dropType = 0,
    dataId = 700,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 5,
    max = 5,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1996)->
    #dropCfg {
    dropId = 314018,
    dropType = 0,
    dataId = 700,
    probability = 700,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(1997)->
    #dropCfg {
    dropId = 314019,
    dropType = 0,
    dataId = 702,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 3,
    max = 3,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(1998)->
    #dropCfg {
    dropId = 314019,
    dropType = 0,
    dataId = 702,
    probability = 9000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(1999)->
    #dropCfg {
    dropId = 314020,
    dropType = 0,
    dataId = 700,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 4,
    max = 4,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(2000)->
    #dropCfg {
    dropId = 314020,
    dropType = 0,
    dataId = 700,
    probability = 2800,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2001)->
    #dropCfg {
    dropId = 314021,
    dropType = 0,
    dataId = 700,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 4,
    max = 4,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(2002)->
    #dropCfg {
    dropId = 314021,
    dropType = 0,
    dataId = 700,
    probability = 7000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2003)->
    #dropCfg {
    dropId = 314022,
    dropType = 0,
    dataId = 700,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 5,
    max = 5,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(2004)->
    #dropCfg {
    dropId = 314022,
    dropType = 0,
    dataId = 700,
    probability = 5600,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2005)->
    #dropCfg {
    dropId = 314023,
    dropType = 0,
    dataId = 702,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 4,
    max = 4,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(2006)->
    #dropCfg {
    dropId = 314023,
    dropType = 0,
    dataId = 702,
    probability = 2900,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2007)->
    #dropCfg {
    dropId = 314024,
    dropType = 0,
    dataId = 700,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 4,
    max = 4,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(2008)->
    #dropCfg {
    dropId = 314024,
    dropType = 0,
    dataId = 700,
    probability = 7000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2009)->
    #dropCfg {
    dropId = 314025,
    dropType = 0,
    dataId = 700,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 5,
    max = 5,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(2010)->
    #dropCfg {
    dropId = 314025,
    dropType = 0,
    dataId = 700,
    probability = 1600,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2011)->
    #dropCfg {
    dropId = 314026,
    dropType = 0,
    dataId = 700,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 6,
    max = 6,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(2012)->
    #dropCfg {
    dropId = 314026,
    dropType = 0,
    dataId = 700,
    probability = 1000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2013)->
    #dropCfg {
    dropId = 314027,
    dropType = 0,
    dataId = 702,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 4,
    max = 4,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(2014)->
    #dropCfg {
    dropId = 314027,
    dropType = 0,
    dataId = 702,
    probability = 7180,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2015)->
    #dropCfg {
    dropId = 314028,
    dropType = 0,
    dataId = 700,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 5,
    max = 5,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(2016)->
    #dropCfg {
    dropId = 314028,
    dropType = 0,
    dataId = 700,
    probability = 1600,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2017)->
    #dropCfg {
    dropId = 314029,
    dropType = 0,
    dataId = 700,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 5,
    max = 5,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(2018)->
    #dropCfg {
    dropId = 314029,
    dropType = 0,
    dataId = 700,
    probability = 6600,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2019)->
    #dropCfg {
    dropId = 314030,
    dropType = 0,
    dataId = 700,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 6,
    max = 6,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(2020)->
    #dropCfg {
    dropId = 314030,
    dropType = 0,
    dataId = 700,
    probability = 7000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2021)->
    #dropCfg {
    dropId = 314031,
    dropType = 0,
    dataId = 702,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 5,
    max = 5,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(2022)->
    #dropCfg {
    dropId = 314031,
    dropType = 0,
    dataId = 702,
    probability = 1880,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2023)->
    #dropCfg {
    dropId = 314032,
    dropType = 0,
    dataId = 700,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 4,
    max = 4,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(2024)->
    #dropCfg {
    dropId = 314032,
    dropType = 0,
    dataId = 700,
    probability = 6800,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2025)->
    #dropCfg {
    dropId = 314033,
    dropType = 0,
    dataId = 700,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 5,
    max = 5,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(2026)->
    #dropCfg {
    dropId = 314033,
    dropType = 0,
    dataId = 700,
    probability = 1480,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2027)->
    #dropCfg {
    dropId = 314034,
    dropType = 0,
    dataId = 700,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 6,
    max = 6,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(2028)->
    #dropCfg {
    dropId = 314034,
    dropType = 0,
    dataId = 700,
    probability = 840,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2029)->
    #dropCfg {
    dropId = 314035,
    dropType = 0,
    dataId = 702,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 4,
    max = 4,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(2030)->
    #dropCfg {
    dropId = 314035,
    dropType = 0,
    dataId = 702,
    probability = 6800,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2031)->
    #dropCfg {
    dropId = 314036,
    dropType = 0,
    dataId = 701,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 2,
    max = 2,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(2032)->
    #dropCfg {
    dropId = 314036,
    dropType = 0,
    dataId = 701,
    probability = 5700,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2033)->
    #dropCfg {
    dropId = 314037,
    dropType = 0,
    dataId = 701,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 2,
    max = 2,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(2034)->
    #dropCfg {
    dropId = 314037,
    dropType = 0,
    dataId = 701,
    probability = 8300,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2035)->
    #dropCfg {
    dropId = 314038,
    dropType = 0,
    dataId = 701,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 3,
    max = 3,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(2036)->
    #dropCfg {
    dropId = 314038,
    dropType = 0,
    dataId = 701,
    probability = 3400,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2037)->
    #dropCfg {
    dropId = 314039,
    dropType = 0,
    dataId = 702,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 5,
    max = 5,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(2038)->
    #dropCfg {
    dropId = 314039,
    dropType = 0,
    dataId = 702,
    probability = 1480,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2039)->
    #dropCfg {
    dropId = 314040,
    dropType = 0,
    dataId = 701,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 2,
    max = 2,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(2040)->
    #dropCfg {
    dropId = 314040,
    dropType = 0,
    dataId = 701,
    probability = 8200,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2041)->
    #dropCfg {
    dropId = 314041,
    dropType = 0,
    dataId = 701,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 3,
    max = 3,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(2042)->
    #dropCfg {
    dropId = 314041,
    dropType = 0,
    dataId = 701,
    probability = 1100,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2043)->
    #dropCfg {
    dropId = 314042,
    dropType = 0,
    dataId = 701,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 3,
    max = 3,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(2044)->
    #dropCfg {
    dropId = 314042,
    dropType = 0,
    dataId = 701,
    probability = 6700,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2045)->
    #dropCfg {
    dropId = 314043,
    dropType = 0,
    dataId = 702,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 5,
    max = 5,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(2046)->
    #dropCfg {
    dropId = 314043,
    dropType = 0,
    dataId = 702,
    probability = 6620,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2047)->
    #dropCfg {
    dropId = 314044,
    dropType = 0,
    dataId = 701,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 3,
    max = 3,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(2048)->
    #dropCfg {
    dropId = 314044,
    dropType = 0,
    dataId = 701,
    probability = 1000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2049)->
    #dropCfg {
    dropId = 314045,
    dropType = 0,
    dataId = 701,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 3,
    max = 3,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(2050)->
    #dropCfg {
    dropId = 314045,
    dropType = 0,
    dataId = 701,
    probability = 4200,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2051)->
    #dropCfg {
    dropId = 314046,
    dropType = 0,
    dataId = 701,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 4,
    max = 4,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(2052)->
    #dropCfg {
    dropId = 314046,
    dropType = 0,
    dataId = 701,
    probability = 300,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2053)->
    #dropCfg {
    dropId = 314047,
    dropType = 0,
    dataId = 702,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 6,
    max = 6,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(2054)->
    #dropCfg {
    dropId = 314047,
    dropType = 0,
    dataId = 702,
    probability = 2280,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2055)->
    #dropCfg {
    dropId = 314048,
    dropType = 0,
    dataId = 701,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 3,
    max = 3,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(2056)->
    #dropCfg {
    dropId = 314048,
    dropType = 0,
    dataId = 701,
    probability = 2240,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2057)->
    #dropCfg {
    dropId = 314049,
    dropType = 0,
    dataId = 701,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 3,
    max = 3,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(2058)->
    #dropCfg {
    dropId = 314049,
    dropType = 0,
    dataId = 701,
    probability = 5464,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2059)->
    #dropCfg {
    dropId = 314050,
    dropType = 0,
    dataId = 701,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 4,
    max = 4,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(2060)->
    #dropCfg {
    dropId = 314050,
    dropType = 0,
    dataId = 701,
    probability = 1912,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2061)->
    #dropCfg {
    dropId = 314051,
    dropType = 0,
    dataId = 702,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 6,
    max = 6,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(2062)->
    #dropCfg {
    dropId = 314051,
    dropType = 0,
    dataId = 702,
    probability = 4480,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2063)->
    #dropCfg {
    dropId = 314052,
    dropType = 0,
    dataId = 701,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 3,
    max = 3,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(2064)->
    #dropCfg {
    dropId = 314052,
    dropType = 0,
    dataId = 701,
    probability = 5400,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2065)->
    #dropCfg {
    dropId = 314053,
    dropType = 0,
    dataId = 701,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 3,
    max = 3,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(2066)->
    #dropCfg {
    dropId = 314053,
    dropType = 0,
    dataId = 701,
    probability = 9000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2067)->
    #dropCfg {
    dropId = 314054,
    dropType = 0,
    dataId = 701,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 4,
    max = 4,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(2068)->
    #dropCfg {
    dropId = 314054,
    dropType = 0,
    dataId = 701,
    probability = 6100,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2069)->
    #dropCfg {
    dropId = 314055,
    dropType = 0,
    dataId = 702,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 7,
    max = 7,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(2070)->
    #dropCfg {
    dropId = 314055,
    dropType = 0,
    dataId = 702,
    probability = 920,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2071)->
    #dropCfg {
    dropId = 314056,
    dropType = 0,
    dataId = 701,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 3,
    max = 3,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(2072)->
    #dropCfg {
    dropId = 314056,
    dropType = 0,
    dataId = 701,
    probability = 8900,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2073)->
    #dropCfg {
    dropId = 314057,
    dropType = 0,
    dataId = 701,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 4,
    max = 4,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(2074)->
    #dropCfg {
    dropId = 314057,
    dropType = 0,
    dataId = 701,
    probability = 2900,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2075)->
    #dropCfg {
    dropId = 314058,
    dropType = 0,
    dataId = 701,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 5,
    max = 5,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(2076)->
    #dropCfg {
    dropId = 314058,
    dropType = 0,
    dataId = 701,
    probability = 700,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2077)->
    #dropCfg {
    dropId = 314059,
    dropType = 0,
    dataId = 702,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 7,
    max = 7,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(2078)->
    #dropCfg {
    dropId = 314059,
    dropType = 0,
    dataId = 702,
    probability = 8000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2079)->
    #dropCfg {
    dropId = 314060,
    dropType = 0,
    dataId = 701,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 4,
    max = 4,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(2080)->
    #dropCfg {
    dropId = 314060,
    dropType = 0,
    dataId = 701,
    probability = 2700,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2081)->
    #dropCfg {
    dropId = 314061,
    dropType = 0,
    dataId = 701,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 4,
    max = 4,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(2082)->
    #dropCfg {
    dropId = 314061,
    dropType = 0,
    dataId = 701,
    probability = 7100,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2083)->
    #dropCfg {
    dropId = 314062,
    dropType = 0,
    dataId = 701,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 5,
    max = 5,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(2084)->
    #dropCfg {
    dropId = 314062,
    dropType = 0,
    dataId = 701,
    probability = 5700,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2085)->
    #dropCfg {
    dropId = 314063,
    dropType = 0,
    dataId = 702,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 8,
    max = 8,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(2086)->
    #dropCfg {
    dropId = 314063,
    dropType = 0,
    dataId = 702,
    probability = 5800,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2087)->
    #dropCfg {
    dropId = 314064,
    dropType = 0,
    dataId = 702,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 0,
    max = 0,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(2088)->
    #dropCfg {
    dropId = 314064,
    dropType = 0,
    dataId = 702,
    probability = 8320,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2089)->
    #dropCfg {
    dropId = 314065,
    dropType = 0,
    dataId = 702,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 0,
    max = 0,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(2090)->
    #dropCfg {
    dropId = 314065,
    dropType = 0,
    dataId = 702,
    probability = 9152,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2091)->
    #dropCfg {
    dropId = 314066,
    dropType = 0,
    dataId = 702,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(2092)->
    #dropCfg {
    dropId = 314066,
    dropType = 0,
    dataId = 702,
    probability = 816,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2093)->
    #dropCfg {
    dropId = 314067,
    dropType = 0,
    dataId = 703,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 4,
    max = 4,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(2094)->
    #dropCfg {
    dropId = 314067,
    dropType = 0,
    dataId = 703,
    probability = 1600,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2095)->
    #dropCfg {
    dropId = 314068,
    dropType = 0,
    dataId = 702,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 0,
    max = 0,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(2096)->
    #dropCfg {
    dropId = 314068,
    dropType = 0,
    dataId = 702,
    probability = 9140,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2097)->
    #dropCfg {
    dropId = 314069,
    dropType = 0,
    dataId = 702,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(2098)->
    #dropCfg {
    dropId = 314069,
    dropType = 0,
    dataId = 702,
    probability = 60,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2099)->
    #dropCfg {
    dropId = 314070,
    dropType = 0,
    dataId = 702,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(2100)->
    #dropCfg {
    dropId = 314070,
    dropType = 0,
    dataId = 702,
    probability = 1880,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2101)->
    #dropCfg {
    dropId = 314071,
    dropType = 0,
    dataId = 703,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 4,
    max = 4,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(2102)->
    #dropCfg {
    dropId = 314071,
    dropType = 0,
    dataId = 703,
    probability = 5760,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2103)->
    #dropCfg {
    dropId = 314072,
    dropType = 0,
    dataId = 702,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(2104)->
    #dropCfg {
    dropId = 314072,
    dropType = 0,
    dataId = 702,
    probability = 40,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2105)->
    #dropCfg {
    dropId = 314073,
    dropType = 0,
    dataId = 702,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(2106)->
    #dropCfg {
    dropId = 314073,
    dropType = 0,
    dataId = 702,
    probability = 1060,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2107)->
    #dropCfg {
    dropId = 314074,
    dropType = 0,
    dataId = 702,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(2108)->
    #dropCfg {
    dropId = 314074,
    dropType = 0,
    dataId = 702,
    probability = 3060,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2109)->
    #dropCfg {
    dropId = 314075,
    dropType = 0,
    dataId = 703,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 5,
    max = 5,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(2110)->
    #dropCfg {
    dropId = 314075,
    dropType = 0,
    dataId = 703,
    probability = 330,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2111)->
    #dropCfg {
    dropId = 314076,
    dropType = 0,
    dataId = 702,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(2112)->
    #dropCfg {
    dropId = 314076,
    dropType = 0,
    dataId = 702,
    probability = 1040,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2113)->
    #dropCfg {
    dropId = 314077,
    dropType = 0,
    dataId = 702,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(2114)->
    #dropCfg {
    dropId = 314077,
    dropType = 0,
    dataId = 702,
    probability = 2160,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2115)->
    #dropCfg {
    dropId = 314078,
    dropType = 0,
    dataId = 702,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(2116)->
    #dropCfg {
    dropId = 314078,
    dropType = 0,
    dataId = 702,
    probability = 4360,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2117)->
    #dropCfg {
    dropId = 314079,
    dropType = 0,
    dataId = 703,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 5,
    max = 5,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(2118)->
    #dropCfg {
    dropId = 314079,
    dropType = 0,
    dataId = 703,
    probability = 5360,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2119)->
    #dropCfg {
    dropId = 314080,
    dropType = 0,
    dataId = 702,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(2120)->
    #dropCfg {
    dropId = 314080,
    dropType = 0,
    dataId = 702,
    probability = 140,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2121)->
    #dropCfg {
    dropId = 314081,
    dropType = 0,
    dataId = 702,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(2122)->
    #dropCfg {
    dropId = 314081,
    dropType = 0,
    dataId = 702,
    probability = 1154,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2123)->
    #dropCfg {
    dropId = 314082,
    dropType = 0,
    dataId = 702,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(2124)->
    #dropCfg {
    dropId = 314082,
    dropType = 0,
    dataId = 702,
    probability = 3182,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2125)->
    #dropCfg {
    dropId = 314083,
    dropType = 0,
    dataId = 703,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 5,
    max = 5,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(2126)->
    #dropCfg {
    dropId = 314083,
    dropType = 0,
    dataId = 703,
    probability = 700,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2127)->
    #dropCfg {
    dropId = 314084,
    dropType = 0,
    dataId = 702,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(2128)->
    #dropCfg {
    dropId = 314084,
    dropType = 0,
    dataId = 702,
    probability = 1140,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2129)->
    #dropCfg {
    dropId = 314085,
    dropType = 0,
    dataId = 702,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(2130)->
    #dropCfg {
    dropId = 314085,
    dropType = 0,
    dataId = 702,
    probability = 2260,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2131)->
    #dropCfg {
    dropId = 314086,
    dropType = 0,
    dataId = 702,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(2132)->
    #dropCfg {
    dropId = 314086,
    dropType = 0,
    dataId = 702,
    probability = 4500,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2133)->
    #dropCfg {
    dropId = 314087,
    dropType = 0,
    dataId = 703,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 5,
    max = 5,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(2134)->
    #dropCfg {
    dropId = 314087,
    dropType = 0,
    dataId = 703,
    probability = 5770,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2135)->
    #dropCfg {
    dropId = 314088,
    dropType = 0,
    dataId = 702,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(2136)->
    #dropCfg {
    dropId = 314088,
    dropType = 0,
    dataId = 702,
    probability = 2240,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2137)->
    #dropCfg {
    dropId = 314089,
    dropType = 0,
    dataId = 702,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(2138)->
    #dropCfg {
    dropId = 314089,
    dropType = 0,
    dataId = 702,
    probability = 3480,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2139)->
    #dropCfg {
    dropId = 314090,
    dropType = 0,
    dataId = 702,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(2140)->
    #dropCfg {
    dropId = 314090,
    dropType = 0,
    dataId = 702,
    probability = 5940,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2141)->
    #dropCfg {
    dropId = 314091,
    dropType = 0,
    dataId = 703,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 6,
    max = 6,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(2142)->
    #dropCfg {
    dropId = 314091,
    dropType = 0,
    dataId = 703,
    probability = 1340,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2143)->
    #dropCfg {
    dropId = 314092,
    dropType = 0,
    dataId = 702,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(2144)->
    #dropCfg {
    dropId = 314092,
    dropType = 0,
    dataId = 702,
    probability = 3460,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2145)->
    #dropCfg {
    dropId = 314093,
    dropType = 0,
    dataId = 702,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(2146)->
    #dropCfg {
    dropId = 314093,
    dropType = 0,
    dataId = 702,
    probability = 4820,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2147)->
    #dropCfg {
    dropId = 314094,
    dropType = 0,
    dataId = 702,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(2148)->
    #dropCfg {
    dropId = 314094,
    dropType = 0,
    dataId = 702,
    probability = 7520,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2149)->
    #dropCfg {
    dropId = 314095,
    dropType = 0,
    dataId = 703,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 6,
    max = 6,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(2150)->
    #dropCfg {
    dropId = 314095,
    dropType = 0,
    dataId = 703,
    probability = 7470,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2151)->
    #dropCfg {
    dropId = 314096,
    dropType = 0,
    dataId = 702,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(2152)->
    #dropCfg {
    dropId = 314096,
    dropType = 0,
    dataId = 702,
    probability = 1960,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2153)->
    #dropCfg {
    dropId = 314097,
    dropType = 0,
    dataId = 702,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(2154)->
    #dropCfg {
    dropId = 314097,
    dropType = 0,
    dataId = 702,
    probability = 3156,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2155)->
    #dropCfg {
    dropId = 314098,
    dropType = 0,
    dataId = 702,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(2156)->
    #dropCfg {
    dropId = 314098,
    dropType = 0,
    dataId = 702,
    probability = 5548,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2157)->
    #dropCfg {
    dropId = 314099,
    dropType = 0,
    dataId = 703,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 5,
    max = 5,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(2158)->
    #dropCfg {
    dropId = 314099,
    dropType = 0,
    dataId = 703,
    probability = 9800,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2159)->
    #dropCfg {
    dropId = 314100,
    dropType = 0,
    dataId = 702,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(2160)->
    #dropCfg {
    dropId = 314100,
    dropType = 0,
    dataId = 702,
    probability = 3140,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2161)->
    #dropCfg {
    dropId = 314101,
    dropType = 0,
    dataId = 702,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(2162)->
    #dropCfg {
    dropId = 314101,
    dropType = 0,
    dataId = 702,
    probability = 4460,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2163)->
    #dropCfg {
    dropId = 314102,
    dropType = 0,
    dataId = 702,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(2164)->
    #dropCfg {
    dropId = 314102,
    dropType = 0,
    dataId = 702,
    probability = 7100,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2165)->
    #dropCfg {
    dropId = 314103,
    dropType = 0,
    dataId = 703,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 6,
    max = 6,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(2166)->
    #dropCfg {
    dropId = 314103,
    dropType = 0,
    dataId = 703,
    probability = 5780,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2167)->
    #dropCfg {
    dropId = 314104,
    dropType = 0,
    dataId = 702,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(2168)->
    #dropCfg {
    dropId = 314104,
    dropType = 0,
    dataId = 702,
    probability = 4440,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2169)->
    #dropCfg {
    dropId = 314105,
    dropType = 0,
    dataId = 702,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(2170)->
    #dropCfg {
    dropId = 314105,
    dropType = 0,
    dataId = 702,
    probability = 5900,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2171)->
    #dropCfg {
    dropId = 314106,
    dropType = 0,
    dataId = 702,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2172)->
    #dropCfg {
    dropId = 314106,
    dropType = 0,
    dataId = 702,
    probability = 8800,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2173)->
    #dropCfg {
    dropId = 314107,
    dropType = 0,
    dataId = 703,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 7,
    max = 7,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2174)->
    #dropCfg {
    dropId = 314107,
    dropType = 0,
    dataId = 703,
    probability = 2350,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2175)->
    #dropCfg {
    dropId = 314108,
    dropType = 0,
    dataId = 702,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2176)->
    #dropCfg {
    dropId = 314108,
    dropType = 0,
    dataId = 702,
    probability = 5880,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2177)->
    #dropCfg {
    dropId = 314109,
    dropType = 0,
    dataId = 702,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2178)->
    #dropCfg {
    dropId = 314109,
    dropType = 0,
    dataId = 702,
    probability = 7480,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2179)->
    #dropCfg {
    dropId = 314110,
    dropType = 0,
    dataId = 702,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 2,
    max = 2,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2180)->
    #dropCfg {
    dropId = 314110,
    dropType = 0,
    dataId = 702,
    probability = 680,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2181)->
    #dropCfg {
    dropId = 314111,
    dropType = 0,
    dataId = 703,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 7,
    max = 7,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2182)->
    #dropCfg {
    dropId = 314111,
    dropType = 0,
    dataId = 703,
    probability = 9580,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2183)->
    #dropCfg {
    dropId = 314112,
    dropType = 0,
    dataId = 702,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2184)->
    #dropCfg {
    dropId = 314112,
    dropType = 0,
    dataId = 702,
    probability = 3780,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2185)->
    #dropCfg {
    dropId = 314113,
    dropType = 0,
    dataId = 702,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2186)->
    #dropCfg {
    dropId = 314113,
    dropType = 0,
    dataId = 702,
    probability = 5158,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2187)->
    #dropCfg {
    dropId = 314114,
    dropType = 0,
    dataId = 702,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2188)->
    #dropCfg {
    dropId = 314114,
    dropType = 0,
    dataId = 702,
    probability = 7914,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2189)->
    #dropCfg {
    dropId = 314115,
    dropType = 0,
    dataId = 703,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 6,
    max = 6,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2190)->
    #dropCfg {
    dropId = 314115,
    dropType = 0,
    dataId = 703,
    probability = 8900,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2191)->
    #dropCfg {
    dropId = 314116,
    dropType = 0,
    dataId = 702,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2192)->
    #dropCfg {
    dropId = 314116,
    dropType = 0,
    dataId = 702,
    probability = 5140,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2193)->
    #dropCfg {
    dropId = 314117,
    dropType = 0,
    dataId = 702,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2194)->
    #dropCfg {
    dropId = 314117,
    dropType = 0,
    dataId = 702,
    probability = 6660,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2195)->
    #dropCfg {
    dropId = 314118,
    dropType = 0,
    dataId = 702,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2196)->
    #dropCfg {
    dropId = 314118,
    dropType = 0,
    dataId = 702,
    probability = 9700,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2197)->
    #dropCfg {
    dropId = 314119,
    dropType = 0,
    dataId = 703,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 7,
    max = 7,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2198)->
    #dropCfg {
    dropId = 314119,
    dropType = 0,
    dataId = 703,
    probability = 5790,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2199)->
    #dropCfg {
    dropId = 314120,
    dropType = 0,
    dataId = 702,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2200)->
    #dropCfg {
    dropId = 314120,
    dropType = 0,
    dataId = 702,
    probability = 6640,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2201)->
    #dropCfg {
    dropId = 314121,
    dropType = 0,
    dataId = 702,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2202)->
    #dropCfg {
    dropId = 314121,
    dropType = 0,
    dataId = 702,
    probability = 8320,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2203)->
    #dropCfg {
    dropId = 314122,
    dropType = 0,
    dataId = 702,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 2,
    max = 2,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2204)->
    #dropCfg {
    dropId = 314122,
    dropType = 0,
    dataId = 702,
    probability = 1660,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2205)->
    #dropCfg {
    dropId = 314123,
    dropType = 0,
    dataId = 703,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 8,
    max = 8,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2206)->
    #dropCfg {
    dropId = 314123,
    dropType = 0,
    dataId = 703,
    probability = 3360,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2207)->
    #dropCfg {
    dropId = 314124,
    dropType = 0,
    dataId = 702,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2208)->
    #dropCfg {
    dropId = 314124,
    dropType = 0,
    dataId = 702,
    probability = 8300,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2209)->
    #dropCfg {
    dropId = 314125,
    dropType = 0,
    dataId = 702,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 2,
    max = 2,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2210)->
    #dropCfg {
    dropId = 314125,
    dropType = 0,
    dataId = 702,
    probability = 140,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2211)->
    #dropCfg {
    dropId = 314126,
    dropType = 0,
    dataId = 702,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 2,
    max = 2,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2212)->
    #dropCfg {
    dropId = 314126,
    dropType = 0,
    dataId = 702,
    probability = 3820,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2213)->
    #dropCfg {
    dropId = 314127,
    dropType = 0,
    dataId = 703,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 9,
    max = 9,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2214)->
    #dropCfg {
    dropId = 314127,
    dropType = 0,
    dataId = 703,
    probability = 1690,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2215)->
    #dropCfg {
    dropId = 314128,
    dropType = 0,
    dataId = 702,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2216)->
    #dropCfg {
    dropId = 314128,
    dropType = 0,
    dataId = 702,
    probability = 6120,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2217)->
    #dropCfg {
    dropId = 314129,
    dropType = 0,
    dataId = 702,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2218)->
    #dropCfg {
    dropId = 314129,
    dropType = 0,
    dataId = 702,
    probability = 7732,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2219)->
    #dropCfg {
    dropId = 314130,
    dropType = 0,
    dataId = 702,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 2,
    max = 2,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2220)->
    #dropCfg {
    dropId = 314130,
    dropType = 0,
    dataId = 702,
    probability = 956,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2221)->
    #dropCfg {
    dropId = 314131,
    dropType = 0,
    dataId = 703,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 8,
    max = 8,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2222)->
    #dropCfg {
    dropId = 314131,
    dropType = 0,
    dataId = 703,
    probability = 600,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2223)->
    #dropCfg {
    dropId = 314132,
    dropType = 0,
    dataId = 702,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2224)->
    #dropCfg {
    dropId = 314132,
    dropType = 0,
    dataId = 702,
    probability = 7720,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2225)->
    #dropCfg {
    dropId = 314133,
    dropType = 0,
    dataId = 702,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2226)->
    #dropCfg {
    dropId = 314133,
    dropType = 0,
    dataId = 702,
    probability = 9500,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2227)->
    #dropCfg {
    dropId = 314134,
    dropType = 0,
    dataId = 702,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 2,
    max = 2,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2228)->
    #dropCfg {
    dropId = 314134,
    dropType = 0,
    dataId = 702,
    probability = 3040,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2229)->
    #dropCfg {
    dropId = 314135,
    dropType = 0,
    dataId = 703,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 8,
    max = 8,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2230)->
    #dropCfg {
    dropId = 314135,
    dropType = 0,
    dataId = 703,
    probability = 8660,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2231)->
    #dropCfg {
    dropId = 314136,
    dropType = 0,
    dataId = 702,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2232)->
    #dropCfg {
    dropId = 314136,
    dropType = 0,
    dataId = 702,
    probability = 9480,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(2233)->
    #dropCfg {
    dropId = 314137,
    dropType = 0,
    dataId = 702,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 2,
    max = 2,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2234)->
    #dropCfg {
    dropId = 314137,
    dropType = 0,
    dataId = 702,
    probability = 1440,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(2235)->
    #dropCfg {
    dropId = 314138,
    dropType = 0,
    dataId = 702,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 2,
    max = 2,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2236)->
    #dropCfg {
    dropId = 314138,
    dropType = 0,
    dataId = 702,
    probability = 5340,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(2237)->
    #dropCfg {
    dropId = 314139,
    dropType = 0,
    dataId = 703,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 9,
    max = 9,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2238)->
    #dropCfg {
    dropId = 314139,
    dropType = 0,
    dataId = 703,
    probability = 7520,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 1,
    kind = 0
    };
getRow(2239)->
    #dropCfg {
    dropId = 314140,
    dropType = 0,
    dataId = 702,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 2,
    max = 2,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2240)->
    #dropCfg {
    dropId = 314140,
    dropType = 0,
    dataId = 702,
    probability = 1420,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2241)->
    #dropCfg {
    dropId = 314141,
    dropType = 0,
    dataId = 702,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 2,
    max = 2,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2242)->
    #dropCfg {
    dropId = 314141,
    dropType = 0,
    dataId = 702,
    probability = 3580,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2243)->
    #dropCfg {
    dropId = 314142,
    dropType = 0,
    dataId = 702,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 2,
    max = 2,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2244)->
    #dropCfg {
    dropId = 314142,
    dropType = 0,
    dataId = 702,
    probability = 7860,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2245)->
    #dropCfg {
    dropId = 314143,
    dropType = 0,
    dataId = 703,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 10,
    max = 10,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2246)->
    #dropCfg {
    dropId = 314143,
    dropType = 0,
    dataId = 703,
    probability = 7270,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2247)->
    #dropCfg {
    dropId = 314144,
    dropType = 0,
    dataId = 702,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2248)->
    #dropCfg {
    dropId = 314144,
    dropType = 0,
    dataId = 702,
    probability = 9500,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2249)->
    #dropCfg {
    dropId = 314145,
    dropType = 0,
    dataId = 702,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 2,
    max = 2,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2250)->
    #dropCfg {
    dropId = 314145,
    dropType = 0,
    dataId = 702,
    probability = 1450,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2251)->
    #dropCfg {
    dropId = 314146,
    dropType = 0,
    dataId = 702,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 2,
    max = 2,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2252)->
    #dropCfg {
    dropId = 314146,
    dropType = 0,
    dataId = 702,
    probability = 5350,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2253)->
    #dropCfg {
    dropId = 314147,
    dropType = 0,
    dataId = 704,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2254)->
    #dropCfg {
    dropId = 314147,
    dropType = 0,
    dataId = 704,
    probability = 9500,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2255)->
    #dropCfg {
    dropId = 314148,
    dropType = 0,
    dataId = 702,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 2,
    max = 2,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2256)->
    #dropCfg {
    dropId = 314148,
    dropType = 0,
    dataId = 702,
    probability = 1440,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2257)->
    #dropCfg {
    dropId = 314149,
    dropType = 0,
    dataId = 702,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 2,
    max = 2,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2258)->
    #dropCfg {
    dropId = 314149,
    dropType = 0,
    dataId = 702,
    probability = 3580,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2259)->
    #dropCfg {
    dropId = 314150,
    dropType = 0,
    dataId = 702,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 2,
    max = 2,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2260)->
    #dropCfg {
    dropId = 314150,
    dropType = 0,
    dataId = 702,
    probability = 7880,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2261)->
    #dropCfg {
    dropId = 314151,
    dropType = 0,
    dataId = 704,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 2,
    max = 2,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2262)->
    #dropCfg {
    dropId = 314151,
    dropType = 0,
    dataId = 704,
    probability = 1450,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2263)->
    #dropCfg {
    dropId = 314152,
    dropType = 0,
    dataId = 702,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 2,
    max = 2,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2264)->
    #dropCfg {
    dropId = 314152,
    dropType = 0,
    dataId = 702,
    probability = 3580,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2265)->
    #dropCfg {
    dropId = 314153,
    dropType = 0,
    dataId = 702,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 2,
    max = 2,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2266)->
    #dropCfg {
    dropId = 314153,
    dropType = 0,
    dataId = 702,
    probability = 5920,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2267)->
    #dropCfg {
    dropId = 314154,
    dropType = 0,
    dataId = 702,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 3,
    max = 3,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2268)->
    #dropCfg {
    dropId = 314154,
    dropType = 0,
    dataId = 702,
    probability = 660,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2269)->
    #dropCfg {
    dropId = 314155,
    dropType = 0,
    dataId = 704,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 2,
    max = 2,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2270)->
    #dropCfg {
    dropId = 314155,
    dropType = 0,
    dataId = 704,
    probability = 3594,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2271)->
    #dropCfg {
    dropId = 314156,
    dropType = 0,
    dataId = 702,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 2,
    max = 2,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2272)->
    #dropCfg {
    dropId = 314156,
    dropType = 0,
    dataId = 702,
    probability = 5920,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2273)->
    #dropCfg {
    dropId = 314157,
    dropType = 0,
    dataId = 702,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 2,
    max = 2,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2274)->
    #dropCfg {
    dropId = 314157,
    dropType = 0,
    dataId = 702,
    probability = 8500,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2275)->
    #dropCfg {
    dropId = 314158,
    dropType = 0,
    dataId = 702,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 3,
    max = 3,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2276)->
    #dropCfg {
    dropId = 314158,
    dropType = 0,
    dataId = 702,
    probability = 3720,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2277)->
    #dropCfg {
    dropId = 314159,
    dropType = 0,
    dataId = 704,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 2,
    max = 2,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2278)->
    #dropCfg {
    dropId = 314159,
    dropType = 0,
    dataId = 704,
    probability = 5952,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2279)->
    #dropCfg {
    dropId = 314160,
    dropType = 0,
    dataId = 702,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 2,
    max = 2,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2280)->
    #dropCfg {
    dropId = 314160,
    dropType = 0,
    dataId = 702,
    probability = 3400,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2281)->
    #dropCfg {
    dropId = 314161,
    dropType = 0,
    dataId = 702,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 2,
    max = 2,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2282)->
    #dropCfg {
    dropId = 314161,
    dropType = 0,
    dataId = 702,
    probability = 5740,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2283)->
    #dropCfg {
    dropId = 314162,
    dropType = 0,
    dataId = 702,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 3,
    max = 3,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2284)->
    #dropCfg {
    dropId = 314162,
    dropType = 0,
    dataId = 702,
    probability = 420,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2285)->
    #dropCfg {
    dropId = 314163,
    dropType = 0,
    dataId = 704,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 2,
    max = 2,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2286)->
    #dropCfg {
    dropId = 314163,
    dropType = 0,
    dataId = 704,
    probability = 3400,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2287)->
    #dropCfg {
    dropId = 314164,
    dropType = 0,
    dataId = 702,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 2,
    max = 2,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2288)->
    #dropCfg {
    dropId = 314164,
    dropType = 0,
    dataId = 702,
    probability = 5740,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2289)->
    #dropCfg {
    dropId = 314165,
    dropType = 0,
    dataId = 702,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 2,
    max = 2,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2290)->
    #dropCfg {
    dropId = 314165,
    dropType = 0,
    dataId = 702,
    probability = 8300,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2291)->
    #dropCfg {
    dropId = 314166,
    dropType = 0,
    dataId = 702,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 3,
    max = 3,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2292)->
    #dropCfg {
    dropId = 314166,
    dropType = 0,
    dataId = 702,
    probability = 3460,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2293)->
    #dropCfg {
    dropId = 314167,
    dropType = 0,
    dataId = 704,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 2,
    max = 2,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2294)->
    #dropCfg {
    dropId = 314167,
    dropType = 0,
    dataId = 704,
    probability = 5740,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2295)->
    #dropCfg {
    dropId = 314168,
    dropType = 0,
    dataId = 702,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 2,
    max = 2,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2296)->
    #dropCfg {
    dropId = 314168,
    dropType = 0,
    dataId = 702,
    probability = 8300,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2297)->
    #dropCfg {
    dropId = 314169,
    dropType = 0,
    dataId = 702,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 3,
    max = 3,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2298)->
    #dropCfg {
    dropId = 314169,
    dropType = 0,
    dataId = 702,
    probability = 1120,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2299)->
    #dropCfg {
    dropId = 314170,
    dropType = 0,
    dataId = 702,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 3,
    max = 3,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2300)->
    #dropCfg {
    dropId = 314170,
    dropType = 0,
    dataId = 702,
    probability = 6800,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2301)->
    #dropCfg {
    dropId = 314171,
    dropType = 0,
    dataId = 704,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 2,
    max = 2,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2302)->
    #dropCfg {
    dropId = 314171,
    dropType = 0,
    dataId = 704,
    probability = 8314,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2303)->
    #dropCfg {
    dropId = 314172,
    dropType = 0,
    dataId = 702,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 3,
    max = 3,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2304)->
    #dropCfg {
    dropId = 314172,
    dropType = 0,
    dataId = 702,
    probability = 1120,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2305)->
    #dropCfg {
    dropId = 314173,
    dropType = 0,
    dataId = 702,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 3,
    max = 3,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2306)->
    #dropCfg {
    dropId = 314173,
    dropType = 0,
    dataId = 702,
    probability = 4220,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2307)->
    #dropCfg {
    dropId = 314174,
    dropType = 0,
    dataId = 702,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 4,
    max = 4,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2308)->
    #dropCfg {
    dropId = 314174,
    dropType = 0,
    dataId = 702,
    probability = 480,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2309)->
    #dropCfg {
    dropId = 314175,
    dropType = 0,
    dataId = 704,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 3,
    max = 3,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2310)->
    #dropCfg {
    dropId = 314175,
    dropType = 0,
    dataId = 704,
    probability = 1144,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2311)->
    #dropCfg {
    dropId = 314176,
    dropType = 0,
    dataId = 702,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 2,
    max = 2,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2312)->
    #dropCfg {
    dropId = 314176,
    dropType = 0,
    dataId = 702,
    probability = 6000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2313)->
    #dropCfg {
    dropId = 314177,
    dropType = 0,
    dataId = 702,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 2,
    max = 2,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2314)->
    #dropCfg {
    dropId = 314177,
    dropType = 0,
    dataId = 702,
    probability = 8600,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2315)->
    #dropCfg {
    dropId = 314178,
    dropType = 0,
    dataId = 702,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 3,
    max = 3,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2316)->
    #dropCfg {
    dropId = 314178,
    dropType = 0,
    dataId = 702,
    probability = 3800,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2317)->
    #dropCfg {
    dropId = 314179,
    dropType = 0,
    dataId = 704,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 2,
    max = 2,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2318)->
    #dropCfg {
    dropId = 314179,
    dropType = 0,
    dataId = 704,
    probability = 6000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2319)->
    #dropCfg {
    dropId = 314180,
    dropType = 0,
    dataId = 702,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 2,
    max = 2,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2320)->
    #dropCfg {
    dropId = 314180,
    dropType = 0,
    dataId = 702,
    probability = 8600,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2321)->
    #dropCfg {
    dropId = 314181,
    dropType = 0,
    dataId = 702,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 3,
    max = 3,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2322)->
    #dropCfg {
    dropId = 314181,
    dropType = 0,
    dataId = 702,
    probability = 1460,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2323)->
    #dropCfg {
    dropId = 314182,
    dropType = 0,
    dataId = 702,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 3,
    max = 3,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2324)->
    #dropCfg {
    dropId = 314182,
    dropType = 0,
    dataId = 702,
    probability = 7180,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2325)->
    #dropCfg {
    dropId = 314183,
    dropType = 0,
    dataId = 704,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 2,
    max = 2,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2326)->
    #dropCfg {
    dropId = 314183,
    dropType = 0,
    dataId = 704,
    probability = 8600,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2327)->
    #dropCfg {
    dropId = 314184,
    dropType = 0,
    dataId = 702,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 3,
    max = 3,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2328)->
    #dropCfg {
    dropId = 314184,
    dropType = 0,
    dataId = 702,
    probability = 1460,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2329)->
    #dropCfg {
    dropId = 314185,
    dropType = 0,
    dataId = 702,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 3,
    max = 3,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2330)->
    #dropCfg {
    dropId = 314185,
    dropType = 0,
    dataId = 702,
    probability = 4600,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2331)->
    #dropCfg {
    dropId = 314186,
    dropType = 0,
    dataId = 702,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 4,
    max = 4,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2332)->
    #dropCfg {
    dropId = 314186,
    dropType = 0,
    dataId = 702,
    probability = 880,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2333)->
    #dropCfg {
    dropId = 314187,
    dropType = 0,
    dataId = 704,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 3,
    max = 3,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2334)->
    #dropCfg {
    dropId = 314187,
    dropType = 0,
    dataId = 704,
    probability = 1460,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2335)->
    #dropCfg {
    dropId = 314188,
    dropType = 0,
    dataId = 702,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 3,
    max = 3,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2336)->
    #dropCfg {
    dropId = 314188,
    dropType = 0,
    dataId = 702,
    probability = 4600,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2337)->
    #dropCfg {
    dropId = 314189,
    dropType = 0,
    dataId = 702,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 3,
    max = 3,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2338)->
    #dropCfg {
    dropId = 314189,
    dropType = 0,
    dataId = 702,
    probability = 8060,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2339)->
    #dropCfg {
    dropId = 314190,
    dropType = 0,
    dataId = 702,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 4,
    max = 4,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2340)->
    #dropCfg {
    dropId = 314190,
    dropType = 0,
    dataId = 702,
    probability = 4960,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2341)->
    #dropCfg {
    dropId = 314191,
    dropType = 0,
    dataId = 704,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 3,
    max = 3,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2342)->
    #dropCfg {
    dropId = 314191,
    dropType = 0,
    dataId = 704,
    probability = 4606,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2343)->
    #dropCfg {
    dropId = 314192,
    dropType = 0,
    dataId = 702,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 3,
    max = 3,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2344)->
    #dropCfg {
    dropId = 314192,
    dropType = 0,
    dataId = 702,
    probability = 1200,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2345)->
    #dropCfg {
    dropId = 314193,
    dropType = 0,
    dataId = 702,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 3,
    max = 3,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2346)->
    #dropCfg {
    dropId = 314193,
    dropType = 0,
    dataId = 702,
    probability = 4320,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2347)->
    #dropCfg {
    dropId = 314194,
    dropType = 0,
    dataId = 702,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 4,
    max = 4,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2348)->
    #dropCfg {
    dropId = 314194,
    dropType = 0,
    dataId = 702,
    probability = 560,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2349)->
    #dropCfg {
    dropId = 314195,
    dropType = 0,
    dataId = 704,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 3,
    max = 3,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2350)->
    #dropCfg {
    dropId = 314195,
    dropType = 0,
    dataId = 704,
    probability = 1200,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2351)->
    #dropCfg {
    dropId = 314196,
    dropType = 0,
    dataId = 702,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 3,
    max = 3,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2352)->
    #dropCfg {
    dropId = 314196,
    dropType = 0,
    dataId = 702,
    probability = 4320,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2353)->
    #dropCfg {
    dropId = 314197,
    dropType = 0,
    dataId = 702,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 3,
    max = 3,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2354)->
    #dropCfg {
    dropId = 314197,
    dropType = 0,
    dataId = 702,
    probability = 7740,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2355)->
    #dropCfg {
    dropId = 314198,
    dropType = 0,
    dataId = 702,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 4,
    max = 4,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2356)->
    #dropCfg {
    dropId = 314198,
    dropType = 0,
    dataId = 702,
    probability = 4600,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2357)->
    #dropCfg {
    dropId = 314199,
    dropType = 0,
    dataId = 704,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 3,
    max = 3,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2358)->
    #dropCfg {
    dropId = 314199,
    dropType = 0,
    dataId = 704,
    probability = 4320,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2359)->
    #dropCfg {
    dropId = 314200,
    dropType = 0,
    dataId = 702,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 3,
    max = 3,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2360)->
    #dropCfg {
    dropId = 314200,
    dropType = 0,
    dataId = 702,
    probability = 7740,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2361)->
    #dropCfg {
    dropId = 314201,
    dropType = 0,
    dataId = 702,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 4,
    max = 4,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2362)->
    #dropCfg {
    dropId = 314201,
    dropType = 0,
    dataId = 702,
    probability = 1500,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2363)->
    #dropCfg {
    dropId = 314202,
    dropType = 0,
    dataId = 702,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 4,
    max = 4,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2364)->
    #dropCfg {
    dropId = 314202,
    dropType = 0,
    dataId = 702,
    probability = 9060,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2365)->
    #dropCfg {
    dropId = 314203,
    dropType = 0,
    dataId = 704,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 3,
    max = 3,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2366)->
    #dropCfg {
    dropId = 314203,
    dropType = 0,
    dataId = 704,
    probability = 7752,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2367)->
    #dropCfg {
    dropId = 314204,
    dropType = 0,
    dataId = 702,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 4,
    max = 4,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2368)->
    #dropCfg {
    dropId = 314204,
    dropType = 0,
    dataId = 702,
    probability = 1500,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2369)->
    #dropCfg {
    dropId = 314205,
    dropType = 0,
    dataId = 702,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 4,
    max = 4,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2370)->
    #dropCfg {
    dropId = 314205,
    dropType = 0,
    dataId = 702,
    probability = 5640,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2371)->
    #dropCfg {
    dropId = 314206,
    dropType = 0,
    dataId = 702,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 5,
    max = 5,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2372)->
    #dropCfg {
    dropId = 314206,
    dropType = 0,
    dataId = 702,
    probability = 3960,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2373)->
    #dropCfg {
    dropId = 314207,
    dropType = 0,
    dataId = 704,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 4,
    max = 4,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2374)->
    #dropCfg {
    dropId = 314207,
    dropType = 0,
    dataId = 704,
    probability = 1526,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2375)->
    #dropCfg {
    dropId = 314208,
    dropType = 0,
    dataId = 702,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 3,
    max = 3,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2376)->
    #dropCfg {
    dropId = 314208,
    dropType = 0,
    dataId = 702,
    probability = 3800,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2377)->
    #dropCfg {
    dropId = 314209,
    dropType = 0,
    dataId = 702,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 3,
    max = 3,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2378)->
    #dropCfg {
    dropId = 314209,
    dropType = 0,
    dataId = 702,
    probability = 7180,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2379)->
    #dropCfg {
    dropId = 314210,
    dropType = 0,
    dataId = 702,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 4,
    max = 4,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2380)->
    #dropCfg {
    dropId = 314210,
    dropType = 0,
    dataId = 702,
    probability = 3940,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2381)->
    #dropCfg {
    dropId = 314211,
    dropType = 0,
    dataId = 704,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 3,
    max = 3,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2382)->
    #dropCfg {
    dropId = 314211,
    dropType = 0,
    dataId = 704,
    probability = 3800,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2383)->
    #dropCfg {
    dropId = 314212,
    dropType = 0,
    dataId = 702,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 3,
    max = 3,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2384)->
    #dropCfg {
    dropId = 314212,
    dropType = 0,
    dataId = 702,
    probability = 7180,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2385)->
    #dropCfg {
    dropId = 314213,
    dropType = 0,
    dataId = 702,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 4,
    max = 4,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2386)->
    #dropCfg {
    dropId = 314213,
    dropType = 0,
    dataId = 702,
    probability = 880,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2387)->
    #dropCfg {
    dropId = 314214,
    dropType = 0,
    dataId = 702,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 4,
    max = 4,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2388)->
    #dropCfg {
    dropId = 314214,
    dropType = 0,
    dataId = 702,
    probability = 8320,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2389)->
    #dropCfg {
    dropId = 314215,
    dropType = 0,
    dataId = 704,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 3,
    max = 3,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2390)->
    #dropCfg {
    dropId = 314215,
    dropType = 0,
    dataId = 704,
    probability = 7180,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2391)->
    #dropCfg {
    dropId = 314216,
    dropType = 0,
    dataId = 702,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 4,
    max = 4,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2392)->
    #dropCfg {
    dropId = 314216,
    dropType = 0,
    dataId = 702,
    probability = 880,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2393)->
    #dropCfg {
    dropId = 314217,
    dropType = 0,
    dataId = 702,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 4,
    max = 4,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2394)->
    #dropCfg {
    dropId = 314217,
    dropType = 0,
    dataId = 702,
    probability = 4960,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2395)->
    #dropCfg {
    dropId = 314218,
    dropType = 0,
    dataId = 702,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 5,
    max = 5,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2396)->
    #dropCfg {
    dropId = 314218,
    dropType = 0,
    dataId = 702,
    probability = 3140,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2397)->
    #dropCfg {
    dropId = 314219,
    dropType = 0,
    dataId = 704,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 4,
    max = 4,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2398)->
    #dropCfg {
    dropId = 314219,
    dropType = 0,
    dataId = 704,
    probability = 898,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2399)->
    #dropCfg {
    dropId = 314220,
    dropType = 0,
    dataId = 702,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 4,
    max = 4,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2400)->
    #dropCfg {
    dropId = 314220,
    dropType = 0,
    dataId = 702,
    probability = 4960,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2401)->
    #dropCfg {
    dropId = 314221,
    dropType = 0,
    dataId = 702,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 4,
    max = 4,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2402)->
    #dropCfg {
    dropId = 314221,
    dropType = 0,
    dataId = 702,
    probability = 9440,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2403)->
    #dropCfg {
    dropId = 314222,
    dropType = 0,
    dataId = 702,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 5,
    max = 5,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2404)->
    #dropCfg {
    dropId = 314222,
    dropType = 0,
    dataId = 702,
    probability = 8440,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2405)->
    #dropCfg {
    dropId = 314223,
    dropType = 0,
    dataId = 704,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 4,
    max = 4,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2406)->
    #dropCfg {
    dropId = 314223,
    dropType = 0,
    dataId = 704,
    probability = 4986,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2407)->
    #dropCfg {
    dropId = 315000,
    dropType = 2,
    dataId = 1,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 50000,
    max = 50000,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2408)->
    #dropCfg {
    dropId = 315000,
    dropType = 1,
    dataId = 6701,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2409)->
    #dropCfg {
    dropId = 315000,
    dropType = 1,
    dataId = 285001,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2410)->
    #dropCfg {
    dropId = 315000,
    dropType = 0,
    dataId = 7000,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 20,
    max = 20,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2411)->
    #dropCfg {
    dropId = 315000,
    dropType = 1,
    dataId = 282001,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 3,
    max = 3,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2412)->
    #dropCfg {
    dropId = 315001,
    dropType = 2,
    dataId = 1,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 80000,
    max = 80000,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2413)->
    #dropCfg {
    dropId = 315001,
    dropType = 1,
    dataId = 6702,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2414)->
    #dropCfg {
    dropId = 315001,
    dropType = 1,
    dataId = 285001,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2415)->
    #dropCfg {
    dropId = 315001,
    dropType = 0,
    dataId = 7000,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 30,
    max = 30,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2416)->
    #dropCfg {
    dropId = 315001,
    dropType = 1,
    dataId = 282001,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 3,
    max = 3,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2417)->
    #dropCfg {
    dropId = 315002,
    dropType = 2,
    dataId = 1,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 110000,
    max = 110000,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2418)->
    #dropCfg {
    dropId = 315002,
    dropType = 1,
    dataId = 6703,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2419)->
    #dropCfg {
    dropId = 315002,
    dropType = 1,
    dataId = 285002,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2420)->
    #dropCfg {
    dropId = 315002,
    dropType = 0,
    dataId = 7001,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 20,
    max = 20,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2421)->
    #dropCfg {
    dropId = 315002,
    dropType = 1,
    dataId = 282002,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 3,
    max = 3,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2422)->
    #dropCfg {
    dropId = 315003,
    dropType = 2,
    dataId = 1,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 140000,
    max = 140000,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2423)->
    #dropCfg {
    dropId = 315003,
    dropType = 1,
    dataId = 6704,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2424)->
    #dropCfg {
    dropId = 315003,
    dropType = 1,
    dataId = 285002,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2425)->
    #dropCfg {
    dropId = 315003,
    dropType = 0,
    dataId = 7001,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 30,
    max = 30,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2426)->
    #dropCfg {
    dropId = 315003,
    dropType = 1,
    dataId = 282002,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 3,
    max = 3,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2427)->
    #dropCfg {
    dropId = 315004,
    dropType = 2,
    dataId = 1,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 170000,
    max = 170000,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2428)->
    #dropCfg {
    dropId = 315004,
    dropType = 1,
    dataId = 6705,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2429)->
    #dropCfg {
    dropId = 315004,
    dropType = 1,
    dataId = 285003,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2430)->
    #dropCfg {
    dropId = 315004,
    dropType = 0,
    dataId = 7002,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 30,
    max = 30,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2431)->
    #dropCfg {
    dropId = 315004,
    dropType = 1,
    dataId = 282003,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 3,
    max = 3,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2432)->
    #dropCfg {
    dropId = 315005,
    dropType = 2,
    dataId = 1,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 200000,
    max = 200000,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2433)->
    #dropCfg {
    dropId = 315005,
    dropType = 1,
    dataId = 6706,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2434)->
    #dropCfg {
    dropId = 315005,
    dropType = 1,
    dataId = 285003,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2435)->
    #dropCfg {
    dropId = 315005,
    dropType = 0,
    dataId = 7002,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 40,
    max = 40,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2436)->
    #dropCfg {
    dropId = 315005,
    dropType = 1,
    dataId = 282003,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 3,
    max = 3,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2437)->
    #dropCfg {
    dropId = 315006,
    dropType = 2,
    dataId = 1,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 230000,
    max = 230000,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2438)->
    #dropCfg {
    dropId = 315006,
    dropType = 1,
    dataId = 6707,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2439)->
    #dropCfg {
    dropId = 315006,
    dropType = 1,
    dataId = 285003,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2440)->
    #dropCfg {
    dropId = 315006,
    dropType = 0,
    dataId = 7002,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 50,
    max = 50,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2441)->
    #dropCfg {
    dropId = 315006,
    dropType = 1,
    dataId = 282003,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 3,
    max = 3,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2442)->
    #dropCfg {
    dropId = 315007,
    dropType = 2,
    dataId = 1,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 260000,
    max = 260000,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2443)->
    #dropCfg {
    dropId = 315007,
    dropType = 1,
    dataId = 6708,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2444)->
    #dropCfg {
    dropId = 315007,
    dropType = 1,
    dataId = 285004,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2445)->
    #dropCfg {
    dropId = 315007,
    dropType = 0,
    dataId = 7003,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 50,
    max = 50,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2446)->
    #dropCfg {
    dropId = 315007,
    dropType = 1,
    dataId = 282004,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 3,
    max = 3,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2447)->
    #dropCfg {
    dropId = 315008,
    dropType = 2,
    dataId = 1,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 290000,
    max = 290000,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2448)->
    #dropCfg {
    dropId = 315008,
    dropType = 1,
    dataId = 6709,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2449)->
    #dropCfg {
    dropId = 315008,
    dropType = 1,
    dataId = 285004,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2450)->
    #dropCfg {
    dropId = 315008,
    dropType = 0,
    dataId = 7003,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 70,
    max = 70,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2451)->
    #dropCfg {
    dropId = 315008,
    dropType = 1,
    dataId = 282004,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 3,
    max = 3,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2452)->
    #dropCfg {
    dropId = 315009,
    dropType = 2,
    dataId = 1,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 320000,
    max = 320000,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2453)->
    #dropCfg {
    dropId = 315009,
    dropType = 1,
    dataId = 6710,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2454)->
    #dropCfg {
    dropId = 315009,
    dropType = 1,
    dataId = 285005,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2455)->
    #dropCfg {
    dropId = 315009,
    dropType = 0,
    dataId = 7004,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 50,
    max = 50,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2456)->
    #dropCfg {
    dropId = 315009,
    dropType = 1,
    dataId = 282005,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 3,
    max = 3,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2457)->
    #dropCfg {
    dropId = 315010,
    dropType = 2,
    dataId = 1,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 350000,
    max = 350000,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2458)->
    #dropCfg {
    dropId = 315010,
    dropType = 1,
    dataId = 6711,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2459)->
    #dropCfg {
    dropId = 315010,
    dropType = 1,
    dataId = 285005,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2460)->
    #dropCfg {
    dropId = 315010,
    dropType = 0,
    dataId = 7004,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 70,
    max = 70,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2461)->
    #dropCfg {
    dropId = 315010,
    dropType = 1,
    dataId = 282005,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 3,
    max = 3,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2462)->
    #dropCfg {
    dropId = 315011,
    dropType = 2,
    dataId = 1,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 380000,
    max = 380000,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2463)->
    #dropCfg {
    dropId = 315011,
    dropType = 1,
    dataId = 6712,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2464)->
    #dropCfg {
    dropId = 315011,
    dropType = 1,
    dataId = 285005,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2465)->
    #dropCfg {
    dropId = 315011,
    dropType = 0,
    dataId = 7005,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 50,
    max = 50,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2466)->
    #dropCfg {
    dropId = 315011,
    dropType = 1,
    dataId = 282006,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 3,
    max = 3,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2467)->
    #dropCfg {
    dropId = 315012,
    dropType = 2,
    dataId = 1,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 410000,
    max = 410000,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2468)->
    #dropCfg {
    dropId = 315012,
    dropType = 1,
    dataId = 6713,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2469)->
    #dropCfg {
    dropId = 315012,
    dropType = 1,
    dataId = 285005,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2470)->
    #dropCfg {
    dropId = 315012,
    dropType = 0,
    dataId = 7005,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 70,
    max = 70,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2471)->
    #dropCfg {
    dropId = 315012,
    dropType = 1,
    dataId = 282006,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 3,
    max = 3,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2472)->
    #dropCfg {
    dropId = 315013,
    dropType = 2,
    dataId = 1,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 440000,
    max = 440000,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2473)->
    #dropCfg {
    dropId = 315013,
    dropType = 1,
    dataId = 6714,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2474)->
    #dropCfg {
    dropId = 315013,
    dropType = 1,
    dataId = 285005,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2475)->
    #dropCfg {
    dropId = 315013,
    dropType = 0,
    dataId = 7006,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 50,
    max = 50,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2476)->
    #dropCfg {
    dropId = 315013,
    dropType = 1,
    dataId = 282006,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 3,
    max = 3,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2477)->
    #dropCfg {
    dropId = 315014,
    dropType = 2,
    dataId = 1,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 470000,
    max = 470000,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2478)->
    #dropCfg {
    dropId = 315014,
    dropType = 1,
    dataId = 6715,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2479)->
    #dropCfg {
    dropId = 315014,
    dropType = 1,
    dataId = 285005,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2480)->
    #dropCfg {
    dropId = 315014,
    dropType = 0,
    dataId = 7006,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 70,
    max = 70,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2481)->
    #dropCfg {
    dropId = 315014,
    dropType = 1,
    dataId = 282006,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 3,
    max = 3,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2482)->
    #dropCfg {
    dropId = 316000,
    dropType = 1,
    dataId = 316000,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2483)->
    #dropCfg {
    dropId = 316001,
    dropType = 1,
    dataId = 316001,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2484)->
    #dropCfg {
    dropId = 316002,
    dropType = 1,
    dataId = 316002,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2485)->
    #dropCfg {
    dropId = 316003,
    dropType = 1,
    dataId = 316003,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2486)->
    #dropCfg {
    dropId = 316004,
    dropType = 1,
    dataId = 316004,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2487)->
    #dropCfg {
    dropId = 316005,
    dropType = 1,
    dataId = 316005,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2488)->
    #dropCfg {
    dropId = 316006,
    dropType = 1,
    dataId = 316006,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2489)->
    #dropCfg {
    dropId = 316007,
    dropType = 1,
    dataId = 316007,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2490)->
    #dropCfg {
    dropId = 316500,
    dropType = 1,
    dataId = 316500,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2491)->
    #dropCfg {
    dropId = 316501,
    dropType = 1,
    dataId = 316501,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2492)->
    #dropCfg {
    dropId = 316502,
    dropType = 1,
    dataId = 316502,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2493)->
    #dropCfg {
    dropId = 316503,
    dropType = 1,
    dataId = 316503,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2494)->
    #dropCfg {
    dropId = 317000,
    dropType = 0,
    dataId = 29005,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 2,
    max = 2,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2495)->
    #dropCfg {
    dropId = 317000,
    dropType = 0,
    dataId = 2601,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 0,
    max = 0,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2496)->
    #dropCfg {
    dropId = 317001,
    dropType = 0,
    dataId = 29005,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 2,
    max = 2,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2497)->
    #dropCfg {
    dropId = 317001,
    dropType = 0,
    dataId = 2601,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2498)->
    #dropCfg {
    dropId = 317002,
    dropType = 0,
    dataId = 29005,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 2,
    max = 2,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2499)->
    #dropCfg {
    dropId = 317002,
    dropType = 0,
    dataId = 2601,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2500)->
    #dropCfg {
    dropId = 317003,
    dropType = 0,
    dataId = 29005,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 2,
    max = 2,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2501)->
    #dropCfg {
    dropId = 317003,
    dropType = 0,
    dataId = 2601,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2502)->
    #dropCfg {
    dropId = 318000,
    dropType = 0,
    dataId = 270,
    probability = 56,
    career = 0,
    sex = 0,
    min = 0,
    max = 0,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2503)->
    #dropCfg {
    dropId = 318000,
    dropType = 1,
    dataId = 312002,
    probability = 265,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2504)->
    #dropCfg {
    dropId = 318001,
    dropType = 0,
    dataId = 270,
    probability = 89,
    career = 0,
    sex = 0,
    min = 0,
    max = 0,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2505)->
    #dropCfg {
    dropId = 318001,
    dropType = 1,
    dataId = 312002,
    probability = 278,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2506)->
    #dropCfg {
    dropId = 318002,
    dropType = 0,
    dataId = 270,
    probability = 50,
    career = 0,
    sex = 0,
    min = 0,
    max = 0,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2507)->
    #dropCfg {
    dropId = 318003,
    dropType = 0,
    dataId = 270,
    probability = 50,
    career = 0,
    sex = 0,
    min = 0,
    max = 0,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2508)->
    #dropCfg {
    dropId = 318004,
    dropType = 0,
    dataId = 270,
    probability = 50,
    career = 0,
    sex = 0,
    min = 0,
    max = 0,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2509)->
    #dropCfg {
    dropId = 319000,
    dropType = 1,
    dataId = 319000,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2510)->
    #dropCfg {
    dropId = 319001,
    dropType = 1,
    dataId = 319001,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2511)->
    #dropCfg {
    dropId = 319002,
    dropType = 1,
    dataId = 319002,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2512)->
    #dropCfg {
    dropId = 319003,
    dropType = 1,
    dataId = 319003,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2513)->
    #dropCfg {
    dropId = 320000,
    dropType = 0,
    dataId = 4303,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 5,
    max = 5,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2514)->
    #dropCfg {
    dropId = 320000,
    dropType = 0,
    dataId = 4304,
    probability = 10000,
    career = 0,
    sex = 1,
    min = 2,
    max = 2,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2515)->
    #dropCfg {
    dropId = 320000,
    dropType = 0,
    dataId = 4305,
    probability = 10000,
    career = 0,
    sex = 2,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2516)->
    #dropCfg {
    dropId = 320001,
    dropType = 0,
    dataId = 2160,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 5,
    max = 5,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2517)->
    #dropCfg {
    dropId = 320002,
    dropType = 0,
    dataId = 2161,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 5,
    max = 5,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2518)->
    #dropCfg {
    dropId = 320003,
    dropType = 1,
    dataId = 420000,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2519)->
    #dropCfg {
    dropId = 320004,
    dropType = 0,
    dataId = 222,
    probability = 10000,
    career = 1,
    sex = 0,
    min = 15,
    max = 15,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2520)->
    #dropCfg {
    dropId = 320004,
    dropType = 0,
    dataId = 225,
    probability = 10000,
    career = 2,
    sex = 0,
    min = 10,
    max = 10,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2521)->
    #dropCfg {
    dropId = 320005,
    dropType = 0,
    dataId = 2600,
    probability = 10000,
    career = 3,
    sex = 0,
    min = 5,
    max = 5,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2522)->
    #dropCfg {
    dropId = 320006,
    dropType = 0,
    dataId = 2601,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 5,
    max = 5,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2523)->
    #dropCfg {
    dropId = 330000,
    dropType = 0,
    dataId = 2160,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2524)->
    #dropCfg {
    dropId = 330000,
    dropType = 0,
    dataId = 201,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2525)->
    #dropCfg {
    dropId = 330000,
    dropType = 0,
    dataId = 201,
    probability = 5000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2526)->
    #dropCfg {
    dropId = 340000,
    dropType = 2,
    dataId = 12,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 300,
    max = 300,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2527)->
    #dropCfg {
    dropId = 340001,
    dropType = 2,
    dataId = 12,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 450,
    max = 450,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2528)->
    #dropCfg {
    dropId = 340002,
    dropType = 2,
    dataId = 12,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 600,
    max = 600,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2529)->
    #dropCfg {
    dropId = 340002,
    dropType = 2,
    dataId = 6,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 15,
    max = 15,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2530)->
    #dropCfg {
    dropId = 340003,
    dropType = 2,
    dataId = 12,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 800,
    max = 800,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2531)->
    #dropCfg {
    dropId = 340003,
    dropType = 2,
    dataId = 6,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 30,
    max = 30,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2532)->
    #dropCfg {
    dropId = 350000,
    dropType = 0,
    dataId = 261,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 20,
    max = 20,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2533)->
    #dropCfg {
    dropId = 350001,
    dropType = 0,
    dataId = 261,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 25,
    max = 25,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2534)->
    #dropCfg {
    dropId = 350002,
    dropType = 0,
    dataId = 261,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 30,
    max = 30,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2535)->
    #dropCfg {
    dropId = 350003,
    dropType = 0,
    dataId = 261,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 35,
    max = 35,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2536)->
    #dropCfg {
    dropId = 350004,
    dropType = 0,
    dataId = 262,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 13,
    max = 13,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2537)->
    #dropCfg {
    dropId = 350005,
    dropType = 0,
    dataId = 262,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 15,
    max = 15,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2538)->
    #dropCfg {
    dropId = 350006,
    dropType = 0,
    dataId = 262,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 18,
    max = 18,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2539)->
    #dropCfg {
    dropId = 350007,
    dropType = 0,
    dataId = 263,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 7,
    max = 7,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2540)->
    #dropCfg {
    dropId = 350008,
    dropType = 0,
    dataId = 263,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 9,
    max = 9,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2541)->
    #dropCfg {
    dropId = 360000,
    dropType = 0,
    dataId = 27072,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2542)->
    #dropCfg {
    dropId = 360000,
    dropType = 0,
    dataId = 27073,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2543)->
    #dropCfg {
    dropId = 360000,
    dropType = 0,
    dataId = 27074,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2544)->
    #dropCfg {
    dropId = 360001,
    dropType = 0,
    dataId = 27075,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2545)->
    #dropCfg {
    dropId = 360001,
    dropType = 0,
    dataId = 27076,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2546)->
    #dropCfg {
    dropId = 360001,
    dropType = 0,
    dataId = 27077,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2547)->
    #dropCfg {
    dropId = 360002,
    dropType = 0,
    dataId = 27078,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2548)->
    #dropCfg {
    dropId = 360002,
    dropType = 0,
    dataId = 27079,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2549)->
    #dropCfg {
    dropId = 360002,
    dropType = 0,
    dataId = 27080,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2550)->
    #dropCfg {
    dropId = 360003,
    dropType = 0,
    dataId = 27081,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2551)->
    #dropCfg {
    dropId = 360003,
    dropType = 0,
    dataId = 27082,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2552)->
    #dropCfg {
    dropId = 360003,
    dropType = 0,
    dataId = 27083,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2553)->
    #dropCfg {
    dropId = 360004,
    dropType = 0,
    dataId = 27084,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2554)->
    #dropCfg {
    dropId = 360004,
    dropType = 0,
    dataId = 27085,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2555)->
    #dropCfg {
    dropId = 360004,
    dropType = 0,
    dataId = 27086,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2556)->
    #dropCfg {
    dropId = 360005,
    dropType = 0,
    dataId = 27087,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2557)->
    #dropCfg {
    dropId = 360005,
    dropType = 0,
    dataId = 27088,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2558)->
    #dropCfg {
    dropId = 360005,
    dropType = 0,
    dataId = 27089,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2559)->
    #dropCfg {
    dropId = 360006,
    dropType = 0,
    dataId = 27090,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2560)->
    #dropCfg {
    dropId = 360006,
    dropType = 0,
    dataId = 27091,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2561)->
    #dropCfg {
    dropId = 360006,
    dropType = 0,
    dataId = 27092,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2562)->
    #dropCfg {
    dropId = 360007,
    dropType = 0,
    dataId = 27093,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2563)->
    #dropCfg {
    dropId = 360007,
    dropType = 0,
    dataId = 27094,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2564)->
    #dropCfg {
    dropId = 360007,
    dropType = 0,
    dataId = 27095,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2565)->
    #dropCfg {
    dropId = 360008,
    dropType = 0,
    dataId = 27096,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2566)->
    #dropCfg {
    dropId = 360008,
    dropType = 0,
    dataId = 27097,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2567)->
    #dropCfg {
    dropId = 360008,
    dropType = 0,
    dataId = 27098,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2568)->
    #dropCfg {
    dropId = 360009,
    dropType = 0,
    dataId = 27099,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2569)->
    #dropCfg {
    dropId = 360009,
    dropType = 0,
    dataId = 27100,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2570)->
    #dropCfg {
    dropId = 360009,
    dropType = 0,
    dataId = 27101,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2571)->
    #dropCfg {
    dropId = 360010,
    dropType = 0,
    dataId = 27102,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2572)->
    #dropCfg {
    dropId = 360010,
    dropType = 0,
    dataId = 27103,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2573)->
    #dropCfg {
    dropId = 360010,
    dropType = 0,
    dataId = 27104,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2574)->
    #dropCfg {
    dropId = 360011,
    dropType = 0,
    dataId = 27105,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2575)->
    #dropCfg {
    dropId = 360011,
    dropType = 0,
    dataId = 27106,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2576)->
    #dropCfg {
    dropId = 360011,
    dropType = 0,
    dataId = 27107,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2577)->
    #dropCfg {
    dropId = 360012,
    dropType = 0,
    dataId = 27108,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2578)->
    #dropCfg {
    dropId = 360012,
    dropType = 0,
    dataId = 27109,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2579)->
    #dropCfg {
    dropId = 360012,
    dropType = 0,
    dataId = 27110,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2580)->
    #dropCfg {
    dropId = 360013,
    dropType = 0,
    dataId = 27111,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2581)->
    #dropCfg {
    dropId = 360013,
    dropType = 0,
    dataId = 27112,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2582)->
    #dropCfg {
    dropId = 360013,
    dropType = 0,
    dataId = 27113,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2583)->
    #dropCfg {
    dropId = 360014,
    dropType = 0,
    dataId = 27114,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2584)->
    #dropCfg {
    dropId = 360014,
    dropType = 0,
    dataId = 27115,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2585)->
    #dropCfg {
    dropId = 360014,
    dropType = 0,
    dataId = 27116,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2586)->
    #dropCfg {
    dropId = 360015,
    dropType = 0,
    dataId = 27117,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2587)->
    #dropCfg {
    dropId = 360015,
    dropType = 0,
    dataId = 27118,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2588)->
    #dropCfg {
    dropId = 360015,
    dropType = 0,
    dataId = 27119,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2589)->
    #dropCfg {
    dropId = 360016,
    dropType = 0,
    dataId = 27120,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2590)->
    #dropCfg {
    dropId = 360016,
    dropType = 0,
    dataId = 27121,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2591)->
    #dropCfg {
    dropId = 360016,
    dropType = 0,
    dataId = 27122,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2592)->
    #dropCfg {
    dropId = 360017,
    dropType = 0,
    dataId = 27123,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2593)->
    #dropCfg {
    dropId = 360017,
    dropType = 0,
    dataId = 27124,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2594)->
    #dropCfg {
    dropId = 360017,
    dropType = 0,
    dataId = 27125,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2595)->
    #dropCfg {
    dropId = 369000,
    dropType = 1,
    dataId = 369000,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2596)->
    #dropCfg {
    dropId = 369000,
    dropType = 1,
    dataId = 369001,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2597)->
    #dropCfg {
    dropId = 369000,
    dropType = 1,
    dataId = 369002,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2598)->
    #dropCfg {
    dropId = 369000,
    dropType = 1,
    dataId = 369009,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2599)->
    #dropCfg {
    dropId = 369001,
    dropType = 1,
    dataId = 369000,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2600)->
    #dropCfg {
    dropId = 369001,
    dropType = 1,
    dataId = 369001,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2601)->
    #dropCfg {
    dropId = 369001,
    dropType = 1,
    dataId = 369004,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2602)->
    #dropCfg {
    dropId = 369001,
    dropType = 1,
    dataId = 369009,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2603)->
    #dropCfg {
    dropId = 369002,
    dropType = 1,
    dataId = 369000,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2604)->
    #dropCfg {
    dropId = 369002,
    dropType = 1,
    dataId = 369001,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2605)->
    #dropCfg {
    dropId = 369002,
    dropType = 1,
    dataId = 369006,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2606)->
    #dropCfg {
    dropId = 369002,
    dropType = 1,
    dataId = 369009,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2607)->
    #dropCfg {
    dropId = 369003,
    dropType = 1,
    dataId = 369000,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2608)->
    #dropCfg {
    dropId = 369003,
    dropType = 1,
    dataId = 369001,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2609)->
    #dropCfg {
    dropId = 369003,
    dropType = 1,
    dataId = 369008,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2610)->
    #dropCfg {
    dropId = 369003,
    dropType = 1,
    dataId = 369009,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2611)->
    #dropCfg {
    dropId = 370001,
    dropType = 2,
    dataId = 6,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 75,
    max = 75,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2612)->
    #dropCfg {
    dropId = 370001,
    dropType = 0,
    dataId = 201,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 25,
    max = 25,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2613)->
    #dropCfg {
    dropId = 370002,
    dropType = 2,
    dataId = 6,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 50,
    max = 50,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2614)->
    #dropCfg {
    dropId = 370002,
    dropType = 0,
    dataId = 201,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 15,
    max = 15,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2615)->
    #dropCfg {
    dropId = 370003,
    dropType = 2,
    dataId = 6,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 35,
    max = 35,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2616)->
    #dropCfg {
    dropId = 370003,
    dropType = 0,
    dataId = 201,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 10,
    max = 10,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2617)->
    #dropCfg {
    dropId = 370004,
    dropType = 2,
    dataId = 6,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 25,
    max = 25,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2618)->
    #dropCfg {
    dropId = 370004,
    dropType = 0,
    dataId = 201,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 10,
    max = 10,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2619)->
    #dropCfg {
    dropId = 370011,
    dropType = 2,
    dataId = 6,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 75,
    max = 75,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2620)->
    #dropCfg {
    dropId = 370011,
    dropType = 0,
    dataId = 201,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 25,
    max = 25,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2621)->
    #dropCfg {
    dropId = 370012,
    dropType = 2,
    dataId = 6,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 50,
    max = 50,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2622)->
    #dropCfg {
    dropId = 370012,
    dropType = 0,
    dataId = 201,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 15,
    max = 15,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2623)->
    #dropCfg {
    dropId = 370013,
    dropType = 2,
    dataId = 6,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 35,
    max = 35,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2624)->
    #dropCfg {
    dropId = 370013,
    dropType = 0,
    dataId = 201,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 10,
    max = 10,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2625)->
    #dropCfg {
    dropId = 370014,
    dropType = 2,
    dataId = 6,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 25,
    max = 25,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2626)->
    #dropCfg {
    dropId = 370014,
    dropType = 0,
    dataId = 201,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 10,
    max = 10,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2627)->
    #dropCfg {
    dropId = 371001,
    dropType = 2,
    dataId = 6,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 75,
    max = 75,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2628)->
    #dropCfg {
    dropId = 371001,
    dropType = 0,
    dataId = 201,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 35,
    max = 35,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2629)->
    #dropCfg {
    dropId = 371002,
    dropType = 2,
    dataId = 6,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 50,
    max = 50,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2630)->
    #dropCfg {
    dropId = 371002,
    dropType = 0,
    dataId = 201,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 25,
    max = 25,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2631)->
    #dropCfg {
    dropId = 371003,
    dropType = 2,
    dataId = 6,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 35,
    max = 35,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2632)->
    #dropCfg {
    dropId = 371003,
    dropType = 0,
    dataId = 201,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 15,
    max = 15,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2633)->
    #dropCfg {
    dropId = 371004,
    dropType = 2,
    dataId = 6,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 25,
    max = 25,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2634)->
    #dropCfg {
    dropId = 371004,
    dropType = 0,
    dataId = 201,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 15,
    max = 15,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2635)->
    #dropCfg {
    dropId = 371011,
    dropType = 2,
    dataId = 6,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 75,
    max = 75,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2636)->
    #dropCfg {
    dropId = 371011,
    dropType = 0,
    dataId = 201,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 35,
    max = 35,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2637)->
    #dropCfg {
    dropId = 371012,
    dropType = 2,
    dataId = 6,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 50,
    max = 50,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2638)->
    #dropCfg {
    dropId = 371012,
    dropType = 0,
    dataId = 201,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 25,
    max = 25,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2639)->
    #dropCfg {
    dropId = 371013,
    dropType = 2,
    dataId = 6,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 35,
    max = 35,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2640)->
    #dropCfg {
    dropId = 371013,
    dropType = 0,
    dataId = 201,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 15,
    max = 15,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2641)->
    #dropCfg {
    dropId = 371014,
    dropType = 2,
    dataId = 6,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 25,
    max = 25,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2642)->
    #dropCfg {
    dropId = 371014,
    dropType = 0,
    dataId = 201,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 15,
    max = 15,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2643)->
    #dropCfg {
    dropId = 372001,
    dropType = 2,
    dataId = 6,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 75,
    max = 75,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2644)->
    #dropCfg {
    dropId = 372001,
    dropType = 0,
    dataId = 201,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 45,
    max = 45,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2645)->
    #dropCfg {
    dropId = 372002,
    dropType = 2,
    dataId = 6,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 50,
    max = 50,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2646)->
    #dropCfg {
    dropId = 372002,
    dropType = 0,
    dataId = 201,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 35,
    max = 35,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2647)->
    #dropCfg {
    dropId = 372003,
    dropType = 2,
    dataId = 6,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 35,
    max = 35,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2648)->
    #dropCfg {
    dropId = 372003,
    dropType = 0,
    dataId = 201,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 20,
    max = 20,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2649)->
    #dropCfg {
    dropId = 372004,
    dropType = 2,
    dataId = 6,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 25,
    max = 25,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2650)->
    #dropCfg {
    dropId = 372004,
    dropType = 0,
    dataId = 201,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 20,
    max = 20,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2651)->
    #dropCfg {
    dropId = 372011,
    dropType = 2,
    dataId = 6,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 75,
    max = 75,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2652)->
    #dropCfg {
    dropId = 372011,
    dropType = 0,
    dataId = 201,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 45,
    max = 45,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2653)->
    #dropCfg {
    dropId = 372012,
    dropType = 2,
    dataId = 6,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 50,
    max = 50,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2654)->
    #dropCfg {
    dropId = 372012,
    dropType = 0,
    dataId = 201,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 35,
    max = 35,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2655)->
    #dropCfg {
    dropId = 372013,
    dropType = 2,
    dataId = 6,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 35,
    max = 35,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2656)->
    #dropCfg {
    dropId = 372013,
    dropType = 0,
    dataId = 201,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 20,
    max = 20,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2657)->
    #dropCfg {
    dropId = 372014,
    dropType = 2,
    dataId = 6,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 25,
    max = 25,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2658)->
    #dropCfg {
    dropId = 372014,
    dropType = 0,
    dataId = 201,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 20,
    max = 20,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2659)->
    #dropCfg {
    dropId = 380001,
    dropType = 2,
    dataId = 1,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 50000,
    max = 50000,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2660)->
    #dropCfg {
    dropId = 380002,
    dropType = 0,
    dataId = 221,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 8,
    max = 8,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2661)->
    #dropCfg {
    dropId = 380003,
    dropType = 0,
    dataId = 23000,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 2,
    max = 2,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2662)->
    #dropCfg {
    dropId = 380003,
    dropType = 0,
    dataId = 29005,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 5,
    max = 5,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2663)->
    #dropCfg {
    dropId = 380004,
    dropType = 0,
    dataId = 2160,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 5,
    max = 5,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2664)->
    #dropCfg {
    dropId = 380004,
    dropType = 0,
    dataId = 4200,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2665)->
    #dropCfg {
    dropId = 380005,
    dropType = 2,
    dataId = 6,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 50,
    max = 50,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2666)->
    #dropCfg {
    dropId = 390001,
    dropType = 2,
    dataId = 6,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 2000,
    max = 2000,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2667)->
    #dropCfg {
    dropId = 390001,
    dropType = 0,
    dataId = 22008,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2668)->
    #dropCfg {
    dropId = 390002,
    dropType = 2,
    dataId = 6,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 2500,
    max = 2500,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2669)->
    #dropCfg {
    dropId = 390002,
    dropType = 0,
    dataId = 22009,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2670)->
    #dropCfg {
    dropId = 390003,
    dropType = 2,
    dataId = 6,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 2800,
    max = 2800,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2671)->
    #dropCfg {
    dropId = 390003,
    dropType = 0,
    dataId = 22010,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2672)->
    #dropCfg {
    dropId = 390004,
    dropType = 2,
    dataId = 6,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 3000,
    max = 3000,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2673)->
    #dropCfg {
    dropId = 400000,
    dropType = 0,
    dataId = 27048,
    probability = 10000,
    career = 0,
    sex = 1,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2674)->
    #dropCfg {
    dropId = 400000,
    dropType = 0,
    dataId = 27049,
    probability = 10000,
    career = 0,
    sex = 2,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2675)->
    #dropCfg {
    dropId = 400001,
    dropType = 0,
    dataId = 27050,
    probability = 10000,
    career = 0,
    sex = 1,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2676)->
    #dropCfg {
    dropId = 400001,
    dropType = 0,
    dataId = 27051,
    probability = 10000,
    career = 0,
    sex = 2,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2677)->
    #dropCfg {
    dropId = 400002,
    dropType = 0,
    dataId = 27016,
    probability = 10000,
    career = 0,
    sex = 1,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2678)->
    #dropCfg {
    dropId = 400002,
    dropType = 0,
    dataId = 27017,
    probability = 10000,
    career = 0,
    sex = 2,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2679)->
    #dropCfg {
    dropId = 400003,
    dropType = 0,
    dataId = 27018,
    probability = 10000,
    career = 0,
    sex = 1,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2680)->
    #dropCfg {
    dropId = 400003,
    dropType = 0,
    dataId = 27019,
    probability = 10000,
    career = 0,
    sex = 2,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2681)->
    #dropCfg {
    dropId = 400004,
    dropType = 0,
    dataId = 27028,
    probability = 10000,
    career = 0,
    sex = 1,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2682)->
    #dropCfg {
    dropId = 400004,
    dropType = 0,
    dataId = 27029,
    probability = 10000,
    career = 0,
    sex = 2,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2683)->
    #dropCfg {
    dropId = 400005,
    dropType = 0,
    dataId = 27030,
    probability = 10000,
    career = 0,
    sex = 1,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2684)->
    #dropCfg {
    dropId = 400005,
    dropType = 0,
    dataId = 27031,
    probability = 10000,
    career = 0,
    sex = 2,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2685)->
    #dropCfg {
    dropId = 410000,
    dropType = 1,
    dataId = 410000,
    probability = 10000,
    career = 0,
    sex = 1,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2686)->
    #dropCfg {
    dropId = 410000,
    dropType = 1,
    dataId = 410001,
    probability = 10000,
    career = 0,
    sex = 2,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2687)->
    #dropCfg {
    dropId = 410001,
    dropType = 0,
    dataId = 23000,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2688)->
    #dropCfg {
    dropId = 410001,
    dropType = 0,
    dataId = 23001,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2689)->
    #dropCfg {
    dropId = 420001,
    dropType = 0,
    dataId = 2160,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 20,
    max = 20,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2690)->
    #dropCfg {
    dropId = 420001,
    dropType = 0,
    dataId = 2161,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 0,
    max = 0,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2691)->
    #dropCfg {
    dropId = 420001,
    dropType = 0,
    dataId = 2162,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 0,
    max = 0,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2692)->
    #dropCfg {
    dropId = 420001,
    dropType = 0,
    dataId = 202,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 10,
    max = 10,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2693)->
    #dropCfg {
    dropId = 420001,
    dropType = 0,
    dataId = 203,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 2,
    max = 2,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2694)->
    #dropCfg {
    dropId = 420001,
    dropType = 0,
    dataId = 204,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 0,
    max = 0,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2695)->
    #dropCfg {
    dropId = 420002,
    dropType = 0,
    dataId = 2160,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 20,
    max = 20,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2696)->
    #dropCfg {
    dropId = 420002,
    dropType = 0,
    dataId = 2161,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 0,
    max = 0,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2697)->
    #dropCfg {
    dropId = 420002,
    dropType = 0,
    dataId = 2162,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 0,
    max = 0,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2698)->
    #dropCfg {
    dropId = 420002,
    dropType = 0,
    dataId = 202,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 12,
    max = 12,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2699)->
    #dropCfg {
    dropId = 420002,
    dropType = 0,
    dataId = 203,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 2,
    max = 2,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2700)->
    #dropCfg {
    dropId = 420002,
    dropType = 0,
    dataId = 204,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 0,
    max = 0,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2701)->
    #dropCfg {
    dropId = 420003,
    dropType = 0,
    dataId = 2160,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 24,
    max = 24,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2702)->
    #dropCfg {
    dropId = 420003,
    dropType = 0,
    dataId = 2161,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 0,
    max = 0,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2703)->
    #dropCfg {
    dropId = 420003,
    dropType = 0,
    dataId = 2162,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 0,
    max = 0,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2704)->
    #dropCfg {
    dropId = 420003,
    dropType = 0,
    dataId = 202,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 14,
    max = 14,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2705)->
    #dropCfg {
    dropId = 420003,
    dropType = 0,
    dataId = 203,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 3,
    max = 3,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2706)->
    #dropCfg {
    dropId = 420003,
    dropType = 0,
    dataId = 204,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 0,
    max = 0,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2707)->
    #dropCfg {
    dropId = 420004,
    dropType = 0,
    dataId = 2160,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 30,
    max = 30,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2708)->
    #dropCfg {
    dropId = 420004,
    dropType = 0,
    dataId = 2161,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 0,
    max = 0,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2709)->
    #dropCfg {
    dropId = 420004,
    dropType = 0,
    dataId = 2162,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 0,
    max = 0,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2710)->
    #dropCfg {
    dropId = 420004,
    dropType = 0,
    dataId = 202,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 14,
    max = 14,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2711)->
    #dropCfg {
    dropId = 420004,
    dropType = 0,
    dataId = 203,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 4,
    max = 4,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2712)->
    #dropCfg {
    dropId = 420004,
    dropType = 0,
    dataId = 204,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 0,
    max = 0,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2713)->
    #dropCfg {
    dropId = 420005,
    dropType = 0,
    dataId = 2160,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 35,
    max = 35,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2714)->
    #dropCfg {
    dropId = 420005,
    dropType = 0,
    dataId = 2161,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 4,
    max = 4,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2715)->
    #dropCfg {
    dropId = 420005,
    dropType = 0,
    dataId = 2162,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 0,
    max = 0,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2716)->
    #dropCfg {
    dropId = 420005,
    dropType = 0,
    dataId = 202,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 0,
    max = 0,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2717)->
    #dropCfg {
    dropId = 420005,
    dropType = 0,
    dataId = 203,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 4,
    max = 4,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2718)->
    #dropCfg {
    dropId = 420005,
    dropType = 0,
    dataId = 204,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2719)->
    #dropCfg {
    dropId = 420006,
    dropType = 0,
    dataId = 2160,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 40,
    max = 40,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2720)->
    #dropCfg {
    dropId = 420006,
    dropType = 0,
    dataId = 2161,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 6,
    max = 6,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2721)->
    #dropCfg {
    dropId = 420006,
    dropType = 0,
    dataId = 2162,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 0,
    max = 0,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2722)->
    #dropCfg {
    dropId = 420006,
    dropType = 0,
    dataId = 202,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 0,
    max = 0,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2723)->
    #dropCfg {
    dropId = 420006,
    dropType = 0,
    dataId = 203,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 6,
    max = 6,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2724)->
    #dropCfg {
    dropId = 420006,
    dropType = 0,
    dataId = 204,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2725)->
    #dropCfg {
    dropId = 420007,
    dropType = 0,
    dataId = 2160,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 0,
    max = 0,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2726)->
    #dropCfg {
    dropId = 420007,
    dropType = 0,
    dataId = 2161,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 8,
    max = 8,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2727)->
    #dropCfg {
    dropId = 420007,
    dropType = 0,
    dataId = 2162,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 4,
    max = 4,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2728)->
    #dropCfg {
    dropId = 420007,
    dropType = 0,
    dataId = 202,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 0,
    max = 0,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2729)->
    #dropCfg {
    dropId = 420007,
    dropType = 0,
    dataId = 203,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 8,
    max = 8,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2730)->
    #dropCfg {
    dropId = 420007,
    dropType = 0,
    dataId = 204,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2731)->
    #dropCfg {
    dropId = 420008,
    dropType = 0,
    dataId = 2160,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 0,
    max = 0,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2732)->
    #dropCfg {
    dropId = 420008,
    dropType = 0,
    dataId = 2161,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 12,
    max = 12,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2733)->
    #dropCfg {
    dropId = 420008,
    dropType = 0,
    dataId = 2162,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 6,
    max = 6,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2734)->
    #dropCfg {
    dropId = 420008,
    dropType = 0,
    dataId = 202,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 0,
    max = 0,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2735)->
    #dropCfg {
    dropId = 420008,
    dropType = 0,
    dataId = 203,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 8,
    max = 8,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2736)->
    #dropCfg {
    dropId = 420008,
    dropType = 0,
    dataId = 204,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 2,
    max = 2,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2737)->
    #dropCfg {
    dropId = 420009,
    dropType = 0,
    dataId = 2160,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 0,
    max = 0,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2738)->
    #dropCfg {
    dropId = 420009,
    dropType = 0,
    dataId = 2161,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 14,
    max = 14,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2739)->
    #dropCfg {
    dropId = 420009,
    dropType = 0,
    dataId = 2162,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 8,
    max = 8,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2740)->
    #dropCfg {
    dropId = 420009,
    dropType = 0,
    dataId = 202,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 0,
    max = 0,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2741)->
    #dropCfg {
    dropId = 420009,
    dropType = 0,
    dataId = 203,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 12,
    max = 12,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2742)->
    #dropCfg {
    dropId = 420009,
    dropType = 0,
    dataId = 204,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 2,
    max = 2,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2743)->
    #dropCfg {
    dropId = 420010,
    dropType = 0,
    dataId = 2160,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 0,
    max = 0,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2744)->
    #dropCfg {
    dropId = 420010,
    dropType = 0,
    dataId = 2161,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 16,
    max = 16,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2745)->
    #dropCfg {
    dropId = 420010,
    dropType = 0,
    dataId = 2162,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 10,
    max = 10,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2746)->
    #dropCfg {
    dropId = 420010,
    dropType = 0,
    dataId = 202,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 0,
    max = 0,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2747)->
    #dropCfg {
    dropId = 420010,
    dropType = 0,
    dataId = 203,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 16,
    max = 16,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2748)->
    #dropCfg {
    dropId = 420010,
    dropType = 0,
    dataId = 204,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 2,
    max = 2,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2749)->
    #dropCfg {
    dropId = 420011,
    dropType = 0,
    dataId = 2160,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 0,
    max = 0,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2750)->
    #dropCfg {
    dropId = 420011,
    dropType = 0,
    dataId = 2161,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 0,
    max = 0,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2751)->
    #dropCfg {
    dropId = 420011,
    dropType = 0,
    dataId = 2162,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 0,
    max = 0,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2752)->
    #dropCfg {
    dropId = 420011,
    dropType = 0,
    dataId = 202,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 0,
    max = 0,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2753)->
    #dropCfg {
    dropId = 420011,
    dropType = 0,
    dataId = 203,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 0,
    max = 0,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2754)->
    #dropCfg {
    dropId = 420011,
    dropType = 0,
    dataId = 204,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 0,
    max = 0,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2755)->
    #dropCfg {
    dropId = 420020,
    dropType = 0,
    dataId = 23001,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 2,
    max = 2,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2756)->
    #dropCfg {
    dropId = 420020,
    dropType = 0,
    dataId = 1800,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 5,
    max = 5,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2757)->
    #dropCfg {
    dropId = 420021,
    dropType = 0,
    dataId = 23001,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2758)->
    #dropCfg {
    dropId = 420021,
    dropType = 0,
    dataId = 1800,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 4,
    max = 4,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2759)->
    #dropCfg {
    dropId = 420022,
    dropType = 0,
    dataId = 23001,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 0,
    max = 0,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2760)->
    #dropCfg {
    dropId = 420022,
    dropType = 0,
    dataId = 1800,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 3,
    max = 3,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2761)->
    #dropCfg {
    dropId = 420023,
    dropType = 0,
    dataId = 23001,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 0,
    max = 0,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2762)->
    #dropCfg {
    dropId = 420023,
    dropType = 0,
    dataId = 1800,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 2,
    max = 2,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2763)->
    #dropCfg {
    dropId = 420024,
    dropType = 0,
    dataId = 240,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 40,
    max = 40,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2764)->
    #dropCfg {
    dropId = 420024,
    dropType = 0,
    dataId = 14125,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2765)->
    #dropCfg {
    dropId = 420025,
    dropType = 0,
    dataId = 902,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 5,
    max = 5,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2766)->
    #dropCfg {
    dropId = 420025,
    dropType = 0,
    dataId = 240,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 20,
    max = 20,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2767)->
    #dropCfg {
    dropId = 420026,
    dropType = 0,
    dataId = 902,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 20,
    max = 20,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2768)->
    #dropCfg {
    dropId = 420026,
    dropType = 0,
    dataId = 240,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 40,
    max = 40,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2769)->
    #dropCfg {
    dropId = 420027,
    dropType = 0,
    dataId = 902,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 18,
    max = 18,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2770)->
    #dropCfg {
    dropId = 420027,
    dropType = 0,
    dataId = 240,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 38,
    max = 38,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2771)->
    #dropCfg {
    dropId = 420028,
    dropType = 0,
    dataId = 902,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 18,
    max = 18,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2772)->
    #dropCfg {
    dropId = 420028,
    dropType = 0,
    dataId = 240,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 36,
    max = 36,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2773)->
    #dropCfg {
    dropId = 420029,
    dropType = 0,
    dataId = 902,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 16,
    max = 16,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2774)->
    #dropCfg {
    dropId = 420029,
    dropType = 0,
    dataId = 240,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 34,
    max = 34,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2775)->
    #dropCfg {
    dropId = 420030,
    dropType = 0,
    dataId = 902,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 16,
    max = 16,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2776)->
    #dropCfg {
    dropId = 420030,
    dropType = 0,
    dataId = 240,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 32,
    max = 32,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2777)->
    #dropCfg {
    dropId = 420031,
    dropType = 0,
    dataId = 902,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 14,
    max = 14,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2778)->
    #dropCfg {
    dropId = 420031,
    dropType = 0,
    dataId = 240,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 30,
    max = 30,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2779)->
    #dropCfg {
    dropId = 420032,
    dropType = 0,
    dataId = 902,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 14,
    max = 14,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2780)->
    #dropCfg {
    dropId = 420032,
    dropType = 0,
    dataId = 240,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 28,
    max = 28,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2781)->
    #dropCfg {
    dropId = 420033,
    dropType = 0,
    dataId = 902,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 12,
    max = 12,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2782)->
    #dropCfg {
    dropId = 420033,
    dropType = 0,
    dataId = 240,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 26,
    max = 26,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2783)->
    #dropCfg {
    dropId = 420034,
    dropType = 0,
    dataId = 902,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 12,
    max = 12,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2784)->
    #dropCfg {
    dropId = 420034,
    dropType = 0,
    dataId = 240,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 24,
    max = 24,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2785)->
    #dropCfg {
    dropId = 420035,
    dropType = 0,
    dataId = 902,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 10,
    max = 10,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2786)->
    #dropCfg {
    dropId = 420035,
    dropType = 0,
    dataId = 240,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 22,
    max = 22,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2787)->
    #dropCfg {
    dropId = 420036,
    dropType = 0,
    dataId = 902,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 5,
    max = 5,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2788)->
    #dropCfg {
    dropId = 420036,
    dropType = 0,
    dataId = 240,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 20,
    max = 20,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2789)->
    #dropCfg {
    dropId = 500000,
    dropType = 0,
    dataId = 2601,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 10,
    max = 10,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2790)->
    #dropCfg {
    dropId = 500000,
    dropType = 0,
    dataId = 904,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2791)->
    #dropCfg {
    dropId = 500000,
    dropType = 0,
    dataId = 605,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2792)->
    #dropCfg {
    dropId = 500001,
    dropType = 0,
    dataId = 904,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 3,
    max = 3,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2793)->
    #dropCfg {
    dropId = 500001,
    dropType = 0,
    dataId = 604,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 3,
    max = 3,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2794)->
    #dropCfg {
    dropId = 500002,
    dropType = 0,
    dataId = 904,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 2,
    max = 2,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2795)->
    #dropCfg {
    dropId = 500002,
    dropType = 0,
    dataId = 604,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 2,
    max = 2,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2796)->
    #dropCfg {
    dropId = 500003,
    dropType = 0,
    dataId = 904,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2797)->
    #dropCfg {
    dropId = 500003,
    dropType = 0,
    dataId = 604,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2798)->
    #dropCfg {
    dropId = 500004,
    dropType = 0,
    dataId = 903,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2799)->
    #dropCfg {
    dropId = 500004,
    dropType = 0,
    dataId = 603,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 2,
    max = 2,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2800)->
    #dropCfg {
    dropId = 500501,
    dropType = 0,
    dataId = 904,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 3,
    max = 3,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2801)->
    #dropCfg {
    dropId = 500501,
    dropType = 0,
    dataId = 2160,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 30,
    max = 30,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2802)->
    #dropCfg {
    dropId = 500501,
    dropType = 0,
    dataId = 28051,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2803)->
    #dropCfg {
    dropId = 500501,
    dropType = 0,
    dataId = 6024,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2804)->
    #dropCfg {
    dropId = 500501,
    dropType = 0,
    dataId = 6025,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2805)->
    #dropCfg {
    dropId = 500502,
    dropType = 0,
    dataId = 904,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2806)->
    #dropCfg {
    dropId = 500502,
    dropType = 0,
    dataId = 222,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 20,
    max = 20,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2807)->
    #dropCfg {
    dropId = 500502,
    dropType = 0,
    dataId = 28052,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2808)->
    #dropCfg {
    dropId = 500503,
    dropType = 0,
    dataId = 903,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2809)->
    #dropCfg {
    dropId = 500503,
    dropType = 0,
    dataId = 202,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 10,
    max = 10,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2810)->
    #dropCfg {
    dropId = 500601,
    dropType = 0,
    dataId = 31025,
    probability = 10000,
    career = 1,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2811)->
    #dropCfg {
    dropId = 500601,
    dropType = 0,
    dataId = 31073,
    probability = 10000,
    career = 2,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2812)->
    #dropCfg {
    dropId = 500601,
    dropType = 0,
    dataId = 31121,
    probability = 10000,
    career = 3,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2813)->
    #dropCfg {
    dropId = 500601,
    dropType = 0,
    dataId = 31166,
    probability = 10000,
    career = 1,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2814)->
    #dropCfg {
    dropId = 500601,
    dropType = 0,
    dataId = 31201,
    probability = 10000,
    career = 2,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2815)->
    #dropCfg {
    dropId = 500601,
    dropType = 0,
    dataId = 31236,
    probability = 10000,
    career = 3,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2816)->
    #dropCfg {
    dropId = 500601,
    dropType = 0,
    dataId = 31271,
    probability = 10000,
    career = 1,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2817)->
    #dropCfg {
    dropId = 500602,
    dropType = 0,
    dataId = 37026,
    probability = 10000,
    career = 1,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2818)->
    #dropCfg {
    dropId = 500602,
    dropType = 0,
    dataId = 37074,
    probability = 10000,
    career = 2,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2819)->
    #dropCfg {
    dropId = 500602,
    dropType = 0,
    dataId = 37122,
    probability = 10000,
    career = 3,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2820)->
    #dropCfg {
    dropId = 500603,
    dropType = 0,
    dataId = 33026,
    probability = 10000,
    career = 1,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2821)->
    #dropCfg {
    dropId = 500603,
    dropType = 0,
    dataId = 33074,
    probability = 10000,
    career = 2,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2822)->
    #dropCfg {
    dropId = 500603,
    dropType = 0,
    dataId = 33122,
    probability = 10000,
    career = 3,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2823)->
    #dropCfg {
    dropId = 500604,
    dropType = 0,
    dataId = 36026,
    probability = 10000,
    career = 1,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2824)->
    #dropCfg {
    dropId = 500604,
    dropType = 0,
    dataId = 36074,
    probability = 10000,
    career = 2,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2825)->
    #dropCfg {
    dropId = 500604,
    dropType = 0,
    dataId = 36122,
    probability = 10000,
    career = 3,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2826)->
    #dropCfg {
    dropId = 500605,
    dropType = 0,
    dataId = 32026,
    probability = 10000,
    career = 1,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2827)->
    #dropCfg {
    dropId = 500605,
    dropType = 0,
    dataId = 32074,
    probability = 10000,
    career = 2,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2828)->
    #dropCfg {
    dropId = 500605,
    dropType = 0,
    dataId = 32122,
    probability = 10000,
    career = 3,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2829)->
    #dropCfg {
    dropId = 500661,
    dropType = 1,
    dataId = 7001,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2830)->
    #dropCfg {
    dropId = 500662,
    dropType = 1,
    dataId = 7002,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2831)->
    #dropCfg {
    dropId = 500663,
    dropType = 1,
    dataId = 7003,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2832)->
    #dropCfg {
    dropId = 500701,
    dropType = 0,
    dataId = 222,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 25,
    max = 25,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2833)->
    #dropCfg {
    dropId = 500702,
    dropType = 0,
    dataId = 222,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 30,
    max = 30,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2834)->
    #dropCfg {
    dropId = 500702,
    dropType = 0,
    dataId = 230,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 30,
    max = 30,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2835)->
    #dropCfg {
    dropId = 500702,
    dropType = 0,
    dataId = 605,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 5,
    max = 5,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2836)->
    #dropCfg {
    dropId = 500703,
    dropType = 0,
    dataId = 201,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 35,
    max = 35,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2837)->
    #dropCfg {
    dropId = 500703,
    dropType = 0,
    dataId = 203,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 20,
    max = 20,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2838)->
    #dropCfg {
    dropId = 500703,
    dropType = 0,
    dataId = 604,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 4,
    max = 4,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2839)->
    #dropCfg {
    dropId = 500704,
    dropType = 0,
    dataId = 201,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 100,
    max = 100,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2840)->
    #dropCfg {
    dropId = 500704,
    dropType = 0,
    dataId = 2002,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 10000,
    max = 10000,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2841)->
    #dropCfg {
    dropId = 500704,
    dropType = 0,
    dataId = 2022,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 60,
    max = 60,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2842)->
    #dropCfg {
    dropId = 500704,
    dropType = 0,
    dataId = 204,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 10,
    max = 10,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2843)->
    #dropCfg {
    dropId = 500704,
    dropType = 0,
    dataId = 2160,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 50,
    max = 50,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2844)->
    #dropCfg {
    dropId = 500705,
    dropType = 0,
    dataId = 252,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 10,
    max = 10,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2845)->
    #dropCfg {
    dropId = 500705,
    dropType = 0,
    dataId = 606,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 5,
    max = 5,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2846)->
    #dropCfg {
    dropId = 500705,
    dropType = 0,
    dataId = 241,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 40,
    max = 40,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2847)->
    #dropCfg {
    dropId = 500705,
    dropType = 0,
    dataId = 240,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 50,
    max = 50,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2848)->
    #dropCfg {
    dropId = 500705,
    dropType = 0,
    dataId = 251,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 10,
    max = 10,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2849)->
    #dropCfg {
    dropId = 500706,
    dropType = 0,
    dataId = 23000,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 3,
    max = 3,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2850)->
    #dropCfg {
    dropId = 500706,
    dropType = 0,
    dataId = 23001,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 3,
    max = 3,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2851)->
    #dropCfg {
    dropId = 500706,
    dropType = 0,
    dataId = 21108,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 2,
    max = 2,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2852)->
    #dropCfg {
    dropId = 500706,
    dropType = 0,
    dataId = 21008,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 2,
    max = 2,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2853)->
    #dropCfg {
    dropId = 500706,
    dropType = 0,
    dataId = 21058,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 2,
    max = 2,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2854)->
    #dropCfg {
    dropId = 500707,
    dropType = 0,
    dataId = 278,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 3,
    max = 3,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2855)->
    #dropCfg {
    dropId = 500707,
    dropType = 0,
    dataId = 230,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 50,
    max = 50,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2856)->
    #dropCfg {
    dropId = 500707,
    dropType = 0,
    dataId = 241,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 80,
    max = 80,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2857)->
    #dropCfg {
    dropId = 500707,
    dropType = 0,
    dataId = 227,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 10,
    max = 10,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2858)->
    #dropCfg {
    dropId = 500707,
    dropType = 0,
    dataId = 2022,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 80,
    max = 80,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2859)->
    #dropCfg {
    dropId = 500771,
    dropType = 1,
    dataId = 7701,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2860)->
    #dropCfg {
    dropId = 500772,
    dropType = 1,
    dataId = 7702,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2861)->
    #dropCfg {
    dropId = 500773,
    dropType = 1,
    dataId = 7703,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2862)->
    #dropCfg {
    dropId = 500774,
    dropType = 1,
    dataId = 7704,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2863)->
    #dropCfg {
    dropId = 500801,
    dropType = 1,
    dataId = 7501,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2864)->
    #dropCfg {
    dropId = 500802,
    dropType = 1,
    dataId = 7502,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2865)->
    #dropCfg {
    dropId = 500803,
    dropType = 1,
    dataId = 7503,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2866)->
    #dropCfg {
    dropId = 500811,
    dropType = 0,
    dataId = 605,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2867)->
    #dropCfg {
    dropId = 500811,
    dropType = 0,
    dataId = 0,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 0,
    max = 0,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2868)->
    #dropCfg {
    dropId = 500811,
    dropType = 0,
    dataId = 0,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 0,
    max = 0,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2869)->
    #dropCfg {
    dropId = 500812,
    dropType = 0,
    dataId = 222,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 10,
    max = 10,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2870)->
    #dropCfg {
    dropId = 500812,
    dropType = 0,
    dataId = 0,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 0,
    max = 0,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2871)->
    #dropCfg {
    dropId = 500812,
    dropType = 0,
    dataId = 0,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 0,
    max = 0,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2872)->
    #dropCfg {
    dropId = 500813,
    dropType = 0,
    dataId = 225,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 5,
    max = 5,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2873)->
    #dropCfg {
    dropId = 500813,
    dropType = 0,
    dataId = 0,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 0,
    max = 0,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2874)->
    #dropCfg {
    dropId = 500813,
    dropType = 0,
    dataId = 0,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 0,
    max = 0,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2875)->
    #dropCfg {
    dropId = 500814,
    dropType = 0,
    dataId = 226,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2876)->
    #dropCfg {
    dropId = 500814,
    dropType = 0,
    dataId = 0,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 0,
    max = 0,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2877)->
    #dropCfg {
    dropId = 500814,
    dropType = 0,
    dataId = 0,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 0,
    max = 0,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2878)->
    #dropCfg {
    dropId = 500815,
    dropType = 0,
    dataId = 226,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2879)->
    #dropCfg {
    dropId = 500815,
    dropType = 0,
    dataId = 0,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 0,
    max = 0,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2880)->
    #dropCfg {
    dropId = 500815,
    dropType = 0,
    dataId = 0,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 0,
    max = 0,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2881)->
    #dropCfg {
    dropId = 500816,
    dropType = 0,
    dataId = 226,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2882)->
    #dropCfg {
    dropId = 500816,
    dropType = 0,
    dataId = 0,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 0,
    max = 0,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2883)->
    #dropCfg {
    dropId = 500816,
    dropType = 0,
    dataId = 0,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 0,
    max = 0,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2884)->
    #dropCfg {
    dropId = 500817,
    dropType = 0,
    dataId = 14090,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2885)->
    #dropCfg {
    dropId = 500817,
    dropType = 0,
    dataId = 0,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 0,
    max = 0,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2886)->
    #dropCfg {
    dropId = 500817,
    dropType = 0,
    dataId = 0,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 0,
    max = 0,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2887)->
    #dropCfg {
    dropId = 500821,
    dropType = 0,
    dataId = 605,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2888)->
    #dropCfg {
    dropId = 500821,
    dropType = 0,
    dataId = 0,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 0,
    max = 0,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2889)->
    #dropCfg {
    dropId = 500821,
    dropType = 0,
    dataId = 0,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 0,
    max = 0,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2890)->
    #dropCfg {
    dropId = 500822,
    dropType = 0,
    dataId = 222,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 10,
    max = 10,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2891)->
    #dropCfg {
    dropId = 500822,
    dropType = 0,
    dataId = 0,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 0,
    max = 0,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2892)->
    #dropCfg {
    dropId = 500822,
    dropType = 0,
    dataId = 0,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 0,
    max = 0,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2893)->
    #dropCfg {
    dropId = 500823,
    dropType = 0,
    dataId = 225,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 5,
    max = 5,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2894)->
    #dropCfg {
    dropId = 500823,
    dropType = 0,
    dataId = 0,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 0,
    max = 0,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2895)->
    #dropCfg {
    dropId = 500823,
    dropType = 0,
    dataId = 0,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 0,
    max = 0,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2896)->
    #dropCfg {
    dropId = 500824,
    dropType = 0,
    dataId = 226,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2897)->
    #dropCfg {
    dropId = 500824,
    dropType = 0,
    dataId = 0,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 0,
    max = 0,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2898)->
    #dropCfg {
    dropId = 500824,
    dropType = 0,
    dataId = 0,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 0,
    max = 0,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2899)->
    #dropCfg {
    dropId = 500825,
    dropType = 0,
    dataId = 226,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2900)->
    #dropCfg {
    dropId = 500825,
    dropType = 0,
    dataId = 0,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 0,
    max = 0,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2901)->
    #dropCfg {
    dropId = 500825,
    dropType = 0,
    dataId = 0,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 0,
    max = 0,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2902)->
    #dropCfg {
    dropId = 500826,
    dropType = 0,
    dataId = 226,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2903)->
    #dropCfg {
    dropId = 500826,
    dropType = 0,
    dataId = 0,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 0,
    max = 0,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2904)->
    #dropCfg {
    dropId = 500826,
    dropType = 0,
    dataId = 0,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 0,
    max = 0,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2905)->
    #dropCfg {
    dropId = 500827,
    dropType = 0,
    dataId = 14090,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2906)->
    #dropCfg {
    dropId = 500827,
    dropType = 0,
    dataId = 0,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 0,
    max = 0,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2907)->
    #dropCfg {
    dropId = 500827,
    dropType = 0,
    dataId = 0,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 0,
    max = 0,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2908)->
    #dropCfg {
    dropId = 500861,
    dropType = 1,
    dataId = 7511,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2909)->
    #dropCfg {
    dropId = 500862,
    dropType = 1,
    dataId = 7512,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2910)->
    #dropCfg {
    dropId = 500863,
    dropType = 1,
    dataId = 7513,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2911)->
    #dropCfg {
    dropId = 500871,
    dropType = 1,
    dataId = 7521,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2912)->
    #dropCfg {
    dropId = 500881,
    dropType = 1,
    dataId = 7531,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2913)->
    #dropCfg {
    dropId = 500891,
    dropType = 1,
    dataId = 7541,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2914)->
    #dropCfg {
    dropId = 500901,
    dropType = 1,
    dataId = 7551,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2915)->
    #dropCfg {
    dropId = 500903,
    dropType = 0,
    dataId = 904,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2916)->
    #dropCfg {
    dropId = 500903,
    dropType = 0,
    dataId = 604,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2917)->
    #dropCfg {
    dropId = 501000,
    dropType = 0,
    dataId = 1828,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2918)->
    #dropCfg {
    dropId = 501601,
    dropType = 0,
    dataId = 31173,
    probability = 10000,
    career = 111,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2919)->
    #dropCfg {
    dropId = 501601,
    dropType = 0,
    dataId = 31037,
    probability = 10000,
    career = 112,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2920)->
    #dropCfg {
    dropId = 501601,
    dropType = 0,
    dataId = 31085,
    probability = 10000,
    career = 211,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2921)->
    #dropCfg {
    dropId = 501601,
    dropType = 0,
    dataId = 31208,
    probability = 10000,
    career = 212,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2922)->
    #dropCfg {
    dropId = 501601,
    dropType = 0,
    dataId = 31243,
    probability = 10000,
    career = 311,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2923)->
    #dropCfg {
    dropId = 501601,
    dropType = 0,
    dataId = 31133,
    probability = 10000,
    career = 312,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2924)->
    #dropCfg {
    dropId = 510001,
    dropType = 0,
    dataId = 62003,
    probability = 10000,
    career = 1,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2925)->
    #dropCfg {
    dropId = 510001,
    dropType = 0,
    dataId = 62006,
    probability = 10000,
    career = 2,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2926)->
    #dropCfg {
    dropId = 510001,
    dropType = 0,
    dataId = 62009,
    probability = 10000,
    career = 3,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2927)->
    #dropCfg {
    dropId = 510003,
    dropType = 0,
    dataId = 32018,
    probability = 10000,
    career = 1,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2928)->
    #dropCfg {
    dropId = 510003,
    dropType = 0,
    dataId = 32066,
    probability = 10000,
    career = 2,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
    };
getRow(2929)->
    #dropCfg {
    dropId = 510003,
    dropType = 0,
    dataId = 32114,
    probability = 10000,
    career = 3,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0,
    kind = 0
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
    {210},
    {211},
    {212},
    {213},
    {214},
    {215},
    {216},
    {217},
    {218},
    {219},
    {220},
    {221},
    {222},
    {223},
    {224},
    {225},
    {226},
    {227},
    {228},
    {229},
    {230},
    {231},
    {232},
    {233},
    {234},
    {235},
    {236},
    {237},
    {238},
    {239},
    {240},
    {241},
    {242},
    {243},
    {244},
    {245},
    {246},
    {247},
    {248},
    {249},
    {250},
    {251},
    {252},
    {253},
    {254},
    {255},
    {256},
    {257},
    {258},
    {259},
    {260},
    {261},
    {262},
    {263},
    {264},
    {265},
    {266},
    {267},
    {268},
    {269},
    {270},
    {271},
    {272},
    {273},
    {274},
    {275},
    {276},
    {277},
    {278},
    {279},
    {280},
    {281},
    {282},
    {283},
    {284},
    {285},
    {286},
    {287},
    {288},
    {289},
    {290},
    {291},
    {292},
    {293},
    {294},
    {295},
    {296},
    {297},
    {298},
    {299},
    {300},
    {301},
    {302},
    {303},
    {304},
    {305},
    {306},
    {307},
    {308},
    {309},
    {310},
    {311},
    {312},
    {313},
    {314},
    {315},
    {316},
    {317},
    {318},
    {319},
    {320},
    {321},
    {322},
    {323},
    {324},
    {325},
    {326},
    {327},
    {328},
    {329},
    {330},
    {331},
    {332},
    {333},
    {334},
    {335},
    {336},
    {337},
    {338},
    {339},
    {340},
    {341},
    {342},
    {343},
    {344},
    {345},
    {346},
    {347},
    {348},
    {349},
    {350},
    {351},
    {352},
    {353},
    {354},
    {355},
    {356},
    {357},
    {358},
    {359},
    {360},
    {361},
    {362},
    {363},
    {364},
    {365},
    {366},
    {367},
    {368},
    {369},
    {370},
    {371},
    {372},
    {373},
    {374},
    {375},
    {376},
    {377},
    {378},
    {379},
    {380},
    {381},
    {382},
    {383},
    {384},
    {385},
    {386},
    {387},
    {388},
    {389},
    {390},
    {391},
    {392},
    {393},
    {394},
    {395},
    {396},
    {397},
    {398},
    {399},
    {400},
    {401},
    {402},
    {403},
    {404},
    {405},
    {406},
    {407},
    {408},
    {409},
    {410},
    {411},
    {412},
    {413},
    {414},
    {415},
    {416},
    {417},
    {418},
    {419},
    {420},
    {421},
    {422},
    {423},
    {424},
    {425},
    {426},
    {427},
    {428},
    {429},
    {430},
    {431},
    {432},
    {433},
    {434},
    {435},
    {436},
    {437},
    {438},
    {439},
    {440},
    {441},
    {442},
    {443},
    {444},
    {445},
    {446},
    {447},
    {448},
    {449},
    {450},
    {451},
    {452},
    {453},
    {454},
    {455},
    {456},
    {457},
    {458},
    {459},
    {460},
    {461},
    {462},
    {463},
    {464},
    {465},
    {466},
    {467},
    {468},
    {469},
    {470},
    {471},
    {472},
    {473},
    {474},
    {475},
    {476},
    {477},
    {478},
    {479},
    {480},
    {481},
    {482},
    {483},
    {484},
    {485},
    {486},
    {487},
    {488},
    {489},
    {490},
    {491},
    {492},
    {493},
    {494},
    {495},
    {496},
    {497},
    {498},
    {499},
    {500},
    {501},
    {502},
    {503},
    {504},
    {505},
    {506},
    {507},
    {508},
    {509},
    {510},
    {511},
    {512},
    {513},
    {514},
    {515},
    {516},
    {517},
    {518},
    {519},
    {520},
    {521},
    {522},
    {523},
    {524},
    {525},
    {526},
    {527},
    {528},
    {529},
    {530},
    {531},
    {532},
    {533},
    {534},
    {535},
    {536},
    {537},
    {538},
    {539},
    {540},
    {541},
    {542},
    {543},
    {544},
    {545},
    {546},
    {547},
    {548},
    {549},
    {550},
    {551},
    {552},
    {553},
    {554},
    {555},
    {556},
    {557},
    {558},
    {559},
    {560},
    {561},
    {562},
    {563},
    {564},
    {565},
    {566},
    {567},
    {568},
    {569},
    {570},
    {571},
    {572},
    {573},
    {574},
    {575},
    {576},
    {577},
    {578},
    {579},
    {580},
    {581},
    {582},
    {583},
    {584},
    {585},
    {586},
    {587},
    {588},
    {589},
    {590},
    {591},
    {592},
    {593},
    {594},
    {595},
    {596},
    {597},
    {598},
    {599},
    {600},
    {601},
    {602},
    {603},
    {604},
    {605},
    {606},
    {607},
    {608},
    {609},
    {610},
    {611},
    {612},
    {613},
    {614},
    {615},
    {616},
    {617},
    {618},
    {619},
    {620},
    {621},
    {622},
    {623},
    {624},
    {625},
    {626},
    {627},
    {628},
    {629},
    {630},
    {631},
    {632},
    {633},
    {634},
    {635},
    {636},
    {637},
    {638},
    {639},
    {640},
    {641},
    {642},
    {643},
    {644},
    {645},
    {646},
    {647},
    {648},
    {649},
    {650},
    {651},
    {652},
    {653},
    {654},
    {655},
    {656},
    {657},
    {658},
    {659},
    {660},
    {661},
    {662},
    {663},
    {664},
    {665},
    {666},
    {667},
    {668},
    {669},
    {670},
    {671},
    {672},
    {673},
    {674},
    {675},
    {676},
    {677},
    {678},
    {679},
    {680},
    {681},
    {682},
    {683},
    {684},
    {685},
    {686},
    {687},
    {688},
    {689},
    {690},
    {691},
    {692},
    {693},
    {694},
    {695},
    {696},
    {697},
    {698},
    {699},
    {700},
    {701},
    {702},
    {703},
    {704},
    {705},
    {706},
    {707},
    {708},
    {709},
    {710},
    {711},
    {712},
    {713},
    {714},
    {715},
    {716},
    {717},
    {718},
    {719},
    {720},
    {721},
    {722},
    {723},
    {724},
    {725},
    {726},
    {727},
    {728},
    {729},
    {730},
    {731},
    {732},
    {733},
    {734},
    {735},
    {736},
    {737},
    {738},
    {739},
    {740},
    {741},
    {742},
    {743},
    {744},
    {745},
    {746},
    {747},
    {748},
    {749},
    {750},
    {751},
    {752},
    {753},
    {754},
    {755},
    {756},
    {757},
    {758},
    {759},
    {760},
    {761},
    {762},
    {763},
    {764},
    {765},
    {766},
    {767},
    {768},
    {769},
    {770},
    {771},
    {772},
    {773},
    {774},
    {775},
    {776},
    {777},
    {778},
    {779},
    {780},
    {781},
    {782},
    {783},
    {784},
    {785},
    {786},
    {787},
    {788},
    {789},
    {790},
    {791},
    {792},
    {793},
    {794},
    {795},
    {796},
    {797},
    {798},
    {799},
    {800},
    {801},
    {802},
    {803},
    {804},
    {805},
    {806},
    {807},
    {808},
    {809},
    {810},
    {811},
    {812},
    {813},
    {814},
    {815},
    {816},
    {817},
    {818},
    {819},
    {820},
    {821},
    {822},
    {823},
    {824},
    {825},
    {826},
    {827},
    {828},
    {829},
    {830},
    {831},
    {832},
    {833},
    {834},
    {835},
    {836},
    {837},
    {838},
    {839},
    {840},
    {841},
    {842},
    {843},
    {844},
    {845},
    {846},
    {847},
    {848},
    {849},
    {850},
    {851},
    {852},
    {853},
    {854},
    {855},
    {856},
    {857},
    {858},
    {859},
    {860},
    {861},
    {862},
    {863},
    {864},
    {865},
    {866},
    {867},
    {868},
    {869},
    {870},
    {871},
    {872},
    {873},
    {874},
    {875},
    {876},
    {877},
    {878},
    {879},
    {880},
    {881},
    {882},
    {883},
    {884},
    {885},
    {886},
    {887},
    {888},
    {889},
    {890},
    {891},
    {892},
    {893},
    {894},
    {895},
    {896},
    {897},
    {898},
    {899},
    {900},
    {901},
    {902},
    {903},
    {904},
    {905},
    {906},
    {907},
    {908},
    {909},
    {910},
    {911},
    {912},
    {913},
    {914},
    {915},
    {916},
    {917},
    {918},
    {919},
    {920},
    {921},
    {922},
    {923},
    {924},
    {925},
    {926},
    {927},
    {928},
    {929},
    {930},
    {931},
    {932},
    {933},
    {934},
    {935},
    {936},
    {937},
    {938},
    {939},
    {940},
    {941},
    {942},
    {943},
    {944},
    {945},
    {946},
    {947},
    {948},
    {949},
    {950},
    {951},
    {952},
    {953},
    {954},
    {955},
    {956},
    {957},
    {958},
    {959},
    {960},
    {961},
    {962},
    {963},
    {964},
    {965},
    {966},
    {967},
    {968},
    {969},
    {970},
    {971},
    {972},
    {973},
    {974},
    {975},
    {976},
    {977},
    {978},
    {979},
    {980},
    {981},
    {982},
    {983},
    {984},
    {985},
    {986},
    {987},
    {988},
    {989},
    {990},
    {991},
    {992},
    {993},
    {994},
    {995},
    {996},
    {997},
    {998},
    {999},
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
    {1096},
    {1097},
    {1098},
    {1099},
    {1100},
    {1101},
    {1102},
    {1103},
    {1104},
    {1105},
    {1106},
    {1107},
    {1108},
    {1109},
    {1110},
    {1111},
    {1112},
    {1113},
    {1114},
    {1115},
    {1116},
    {1117},
    {1118},
    {1119},
    {1120},
    {1121},
    {1122},
    {1123},
    {1124},
    {1125},
    {1126},
    {1127},
    {1128},
    {1129},
    {1130},
    {1131},
    {1132},
    {1133},
    {1134},
    {1135},
    {1136},
    {1137},
    {1138},
    {1139},
    {1140},
    {1141},
    {1142},
    {1143},
    {1144},
    {1145},
    {1146},
    {1147},
    {1148},
    {1149},
    {1150},
    {1151},
    {1152},
    {1153},
    {1154},
    {1155},
    {1156},
    {1157},
    {1158},
    {1159},
    {1160},
    {1161},
    {1162},
    {1163},
    {1164},
    {1165},
    {1166},
    {1167},
    {1168},
    {1169},
    {1170},
    {1171},
    {1172},
    {1173},
    {1174},
    {1175},
    {1176},
    {1177},
    {1178},
    {1179},
    {1180},
    {1181},
    {1182},
    {1183},
    {1184},
    {1185},
    {1186},
    {1187},
    {1188},
    {1189},
    {1190},
    {1191},
    {1192},
    {1193},
    {1194},
    {1195},
    {1196},
    {1197},
    {1198},
    {1199},
    {1200},
    {1201},
    {1202},
    {1203},
    {1204},
    {1205},
    {1206},
    {1207},
    {1208},
    {1209},
    {1210},
    {1211},
    {1212},
    {1213},
    {1214},
    {1215},
    {1216},
    {1217},
    {1218},
    {1219},
    {1220},
    {1221},
    {1222},
    {1223},
    {1224},
    {1225},
    {1226},
    {1227},
    {1228},
    {1229},
    {1230},
    {1231},
    {1232},
    {1233},
    {1234},
    {1235},
    {1236},
    {1237},
    {1238},
    {1239},
    {1240},
    {1241},
    {1242},
    {1243},
    {1244},
    {1245},
    {1246},
    {1247},
    {1248},
    {1249},
    {1250},
    {1251},
    {1252},
    {1253},
    {1254},
    {1255},
    {1256},
    {1257},
    {1258},
    {1259},
    {1260},
    {1261},
    {1262},
    {1263},
    {1264},
    {1265},
    {1266},
    {1267},
    {1268},
    {1269},
    {1270},
    {1271},
    {1272},
    {1273},
    {1274},
    {1275},
    {1276},
    {1277},
    {1278},
    {1279},
    {1280},
    {1281},
    {1282},
    {1283},
    {1284},
    {1285},
    {1286},
    {1287},
    {1288},
    {1289},
    {1290},
    {1291},
    {1292},
    {1293},
    {1294},
    {1295},
    {1296},
    {1297},
    {1298},
    {1299},
    {1300},
    {1301},
    {1302},
    {1303},
    {1304},
    {1305},
    {1306},
    {1307},
    {1308},
    {1309},
    {1310},
    {1311},
    {1312},
    {1313},
    {1314},
    {1315},
    {1316},
    {1317},
    {1318},
    {1319},
    {1320},
    {1321},
    {1322},
    {1323},
    {1324},
    {1325},
    {1326},
    {1327},
    {1328},
    {1329},
    {1330},
    {1331},
    {1332},
    {1333},
    {1334},
    {1335},
    {1336},
    {1337},
    {1338},
    {1339},
    {1340},
    {1341},
    {1342},
    {1343},
    {1344},
    {1345},
    {1346},
    {1347},
    {1348},
    {1349},
    {1350},
    {1351},
    {1352},
    {1353},
    {1354},
    {1355},
    {1356},
    {1357},
    {1358},
    {1359},
    {1360},
    {1361},
    {1362},
    {1363},
    {1364},
    {1365},
    {1366},
    {1367},
    {1368},
    {1369},
    {1370},
    {1371},
    {1372},
    {1373},
    {1374},
    {1375},
    {1376},
    {1377},
    {1378},
    {1379},
    {1380},
    {1381},
    {1382},
    {1383},
    {1384},
    {1385},
    {1386},
    {1387},
    {1388},
    {1389},
    {1390},
    {1391},
    {1392},
    {1393},
    {1394},
    {1395},
    {1396},
    {1397},
    {1398},
    {1399},
    {1400},
    {1401},
    {1402},
    {1403},
    {1404},
    {1405},
    {1406},
    {1407},
    {1408},
    {1409},
    {1410},
    {1411},
    {1412},
    {1413},
    {1414},
    {1415},
    {1416},
    {1417},
    {1418},
    {1419},
    {1420},
    {1421},
    {1422},
    {1423},
    {1424},
    {1425},
    {1426},
    {1427},
    {1428},
    {1429},
    {1430},
    {1431},
    {1432},
    {1433},
    {1434},
    {1435},
    {1436},
    {1437},
    {1438},
    {1439},
    {1440},
    {1441},
    {1442},
    {1443},
    {1444},
    {1445},
    {1446},
    {1447},
    {1448},
    {1449},
    {1450},
    {1451},
    {1452},
    {1453},
    {1454},
    {1455},
    {1456},
    {1457},
    {1458},
    {1459},
    {1460},
    {1461},
    {1462},
    {1463},
    {1464},
    {1465},
    {1466},
    {1467},
    {1468},
    {1469},
    {1470},
    {1471},
    {1472},
    {1473},
    {1474},
    {1475},
    {1476},
    {1477},
    {1478},
    {1479},
    {1480},
    {1481},
    {1482},
    {1483},
    {1484},
    {1485},
    {1486},
    {1487},
    {1488},
    {1489},
    {1490},
    {1491},
    {1492},
    {1493},
    {1494},
    {1495},
    {1496},
    {1497},
    {1498},
    {1499},
    {1500},
    {1501},
    {1502},
    {1503},
    {1504},
    {1505},
    {1506},
    {1507},
    {1508},
    {1509},
    {1510},
    {1511},
    {1512},
    {1513},
    {1514},
    {1515},
    {1516},
    {1517},
    {1518},
    {1519},
    {1520},
    {1521},
    {1522},
    {1523},
    {1524},
    {1525},
    {1526},
    {1527},
    {1528},
    {1529},
    {1530},
    {1531},
    {1532},
    {1533},
    {1534},
    {1535},
    {1536},
    {1537},
    {1538},
    {1539},
    {1540},
    {1541},
    {1542},
    {1543},
    {1544},
    {1545},
    {1546},
    {1547},
    {1548},
    {1549},
    {1550},
    {1551},
    {1552},
    {1553},
    {1554},
    {1555},
    {1556},
    {1557},
    {1558},
    {1559},
    {1560},
    {1561},
    {1562},
    {1563},
    {1564},
    {1565},
    {1566},
    {1567},
    {1568},
    {1569},
    {1570},
    {1571},
    {1572},
    {1573},
    {1574},
    {1575},
    {1576},
    {1577},
    {1578},
    {1579},
    {1580},
    {1581},
    {1582},
    {1583},
    {1584},
    {1585},
    {1586},
    {1587},
    {1588},
    {1589},
    {1590},
    {1591},
    {1592},
    {1593},
    {1594},
    {1595},
    {1596},
    {1597},
    {1598},
    {1599},
    {1600},
    {1601},
    {1602},
    {1603},
    {1604},
    {1605},
    {1606},
    {1607},
    {1608},
    {1609},
    {1610},
    {1611},
    {1612},
    {1613},
    {1614},
    {1615},
    {1616},
    {1617},
    {1618},
    {1619},
    {1620},
    {1621},
    {1622},
    {1623},
    {1624},
    {1625},
    {1626},
    {1627},
    {1628},
    {1629},
    {1630},
    {1631},
    {1632},
    {1633},
    {1634},
    {1635},
    {1636},
    {1637},
    {1638},
    {1639},
    {1640},
    {1641},
    {1642},
    {1643},
    {1644},
    {1645},
    {1646},
    {1647},
    {1648},
    {1649},
    {1650},
    {1651},
    {1652},
    {1653},
    {1654},
    {1655},
    {1656},
    {1657},
    {1658},
    {1659},
    {1660},
    {1661},
    {1662},
    {1663},
    {1664},
    {1665},
    {1666},
    {1667},
    {1668},
    {1669},
    {1670},
    {1671},
    {1672},
    {1673},
    {1674},
    {1675},
    {1676},
    {1677},
    {1678},
    {1679},
    {1680},
    {1681},
    {1682},
    {1683},
    {1684},
    {1685},
    {1686},
    {1687},
    {1688},
    {1689},
    {1690},
    {1691},
    {1692},
    {1693},
    {1694},
    {1695},
    {1696},
    {1697},
    {1698},
    {1699},
    {1700},
    {1701},
    {1702},
    {1703},
    {1704},
    {1705},
    {1706},
    {1707},
    {1708},
    {1709},
    {1710},
    {1711},
    {1712},
    {1713},
    {1714},
    {1715},
    {1716},
    {1717},
    {1718},
    {1719},
    {1720},
    {1721},
    {1722},
    {1723},
    {1724},
    {1725},
    {1726},
    {1727},
    {1728},
    {1729},
    {1730},
    {1731},
    {1732},
    {1733},
    {1734},
    {1735},
    {1736},
    {1737},
    {1738},
    {1739},
    {1740},
    {1741},
    {1742},
    {1743},
    {1744},
    {1745},
    {1746},
    {1747},
    {1748},
    {1749},
    {1750},
    {1751},
    {1752},
    {1753},
    {1754},
    {1755},
    {1756},
    {1757},
    {1758},
    {1759},
    {1760},
    {1761},
    {1762},
    {1763},
    {1764},
    {1765},
    {1766},
    {1767},
    {1768},
    {1769},
    {1770},
    {1771},
    {1772},
    {1773},
    {1774},
    {1775},
    {1776},
    {1777},
    {1778},
    {1779},
    {1780},
    {1781},
    {1782},
    {1783},
    {1784},
    {1785},
    {1786},
    {1787},
    {1788},
    {1789},
    {1790},
    {1791},
    {1792},
    {1793},
    {1794},
    {1795},
    {1796},
    {1797},
    {1798},
    {1799},
    {1800},
    {1801},
    {1802},
    {1803},
    {1804},
    {1805},
    {1806},
    {1807},
    {1808},
    {1809},
    {1810},
    {1811},
    {1812},
    {1813},
    {1814},
    {1815},
    {1816},
    {1817},
    {1818},
    {1819},
    {1820},
    {1821},
    {1822},
    {1823},
    {1824},
    {1825},
    {1826},
    {1827},
    {1828},
    {1829},
    {1830},
    {1831},
    {1832},
    {1833},
    {1834},
    {1835},
    {1836},
    {1837},
    {1838},
    {1839},
    {1840},
    {1841},
    {1842},
    {1843},
    {1844},
    {1845},
    {1846},
    {1847},
    {1848},
    {1849},
    {1850},
    {1851},
    {1852},
    {1853},
    {1854},
    {1855},
    {1856},
    {1857},
    {1858},
    {1859},
    {1860},
    {1861},
    {1862},
    {1863},
    {1864},
    {1865},
    {1866},
    {1867},
    {1868},
    {1869},
    {1870},
    {1871},
    {1872},
    {1873},
    {1874},
    {1875},
    {1876},
    {1877},
    {1878},
    {1879},
    {1880},
    {1881},
    {1882},
    {1883},
    {1884},
    {1885},
    {1886},
    {1887},
    {1888},
    {1889},
    {1890},
    {1891},
    {1892},
    {1893},
    {1894},
    {1895},
    {1896},
    {1897},
    {1898},
    {1899},
    {1900},
    {1901},
    {1902},
    {1903},
    {1904},
    {1905},
    {1906},
    {1907},
    {1908},
    {1909},
    {1910},
    {1911},
    {1912},
    {1913},
    {1914},
    {1915},
    {1916},
    {1917},
    {1918},
    {1919},
    {1920},
    {1921},
    {1922},
    {1923},
    {1924},
    {1925},
    {1926},
    {1927},
    {1928},
    {1929},
    {1930},
    {1931},
    {1932},
    {1933},
    {1934},
    {1935},
    {1936},
    {1937},
    {1938},
    {1939},
    {1940},
    {1941},
    {1942},
    {1943},
    {1944},
    {1945},
    {1946},
    {1947},
    {1948},
    {1949},
    {1950},
    {1951},
    {1952},
    {1953},
    {1954},
    {1955},
    {1956},
    {1957},
    {1958},
    {1959},
    {1960},
    {1961},
    {1962},
    {1963},
    {1964},
    {1965},
    {1966},
    {1967},
    {1968},
    {1969},
    {1970},
    {1971},
    {1972},
    {1973},
    {1974},
    {1975},
    {1976},
    {1977},
    {1978},
    {1979},
    {1980},
    {1981},
    {1982},
    {1983},
    {1984},
    {1985},
    {1986},
    {1987},
    {1988},
    {1989},
    {1990},
    {1991},
    {1992},
    {1993},
    {1994},
    {1995},
    {1996},
    {1997},
    {1998},
    {1999},
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
    {2095},
    {2096},
    {2097},
    {2098},
    {2099},
    {2100},
    {2101},
    {2102},
    {2103},
    {2104},
    {2105},
    {2106},
    {2107},
    {2108},
    {2109},
    {2110},
    {2111},
    {2112},
    {2113},
    {2114},
    {2115},
    {2116},
    {2117},
    {2118},
    {2119},
    {2120},
    {2121},
    {2122},
    {2123},
    {2124},
    {2125},
    {2126},
    {2127},
    {2128},
    {2129},
    {2130},
    {2131},
    {2132},
    {2133},
    {2134},
    {2135},
    {2136},
    {2137},
    {2138},
    {2139},
    {2140},
    {2141},
    {2142},
    {2143},
    {2144},
    {2145},
    {2146},
    {2147},
    {2148},
    {2149},
    {2150},
    {2151},
    {2152},
    {2153},
    {2154},
    {2155},
    {2156},
    {2157},
    {2158},
    {2159},
    {2160},
    {2161},
    {2162},
    {2163},
    {2164},
    {2165},
    {2166},
    {2167},
    {2168},
    {2169},
    {2170},
    {2171},
    {2172},
    {2173},
    {2174},
    {2175},
    {2176},
    {2177},
    {2178},
    {2179},
    {2180},
    {2181},
    {2182},
    {2183},
    {2184},
    {2185},
    {2186},
    {2187},
    {2188},
    {2189},
    {2190},
    {2191},
    {2192},
    {2193},
    {2194},
    {2195},
    {2196},
    {2197},
    {2198},
    {2199},
    {2200},
    {2201},
    {2202},
    {2203},
    {2204},
    {2205},
    {2206},
    {2207},
    {2208},
    {2209},
    {2210},
    {2211},
    {2212},
    {2213},
    {2214},
    {2215},
    {2216},
    {2217},
    {2218},
    {2219},
    {2220},
    {2221},
    {2222},
    {2223},
    {2224},
    {2225},
    {2226},
    {2227},
    {2228},
    {2229},
    {2230},
    {2231},
    {2232},
    {2233},
    {2234},
    {2235},
    {2236},
    {2237},
    {2238},
    {2239},
    {2240},
    {2241},
    {2242},
    {2243},
    {2244},
    {2245},
    {2246},
    {2247},
    {2248},
    {2249},
    {2250},
    {2251},
    {2252},
    {2253},
    {2254},
    {2255},
    {2256},
    {2257},
    {2258},
    {2259},
    {2260},
    {2261},
    {2262},
    {2263},
    {2264},
    {2265},
    {2266},
    {2267},
    {2268},
    {2269},
    {2270},
    {2271},
    {2272},
    {2273},
    {2274},
    {2275},
    {2276},
    {2277},
    {2278},
    {2279},
    {2280},
    {2281},
    {2282},
    {2283},
    {2284},
    {2285},
    {2286},
    {2287},
    {2288},
    {2289},
    {2290},
    {2291},
    {2292},
    {2293},
    {2294},
    {2295},
    {2296},
    {2297},
    {2298},
    {2299},
    {2300},
    {2301},
    {2302},
    {2303},
    {2304},
    {2305},
    {2306},
    {2307},
    {2308},
    {2309},
    {2310},
    {2311},
    {2312},
    {2313},
    {2314},
    {2315},
    {2316},
    {2317},
    {2318},
    {2319},
    {2320},
    {2321},
    {2322},
    {2323},
    {2324},
    {2325},
    {2326},
    {2327},
    {2328},
    {2329},
    {2330},
    {2331},
    {2332},
    {2333},
    {2334},
    {2335},
    {2336},
    {2337},
    {2338},
    {2339},
    {2340},
    {2341},
    {2342},
    {2343},
    {2344},
    {2345},
    {2346},
    {2347},
    {2348},
    {2349},
    {2350},
    {2351},
    {2352},
    {2353},
    {2354},
    {2355},
    {2356},
    {2357},
    {2358},
    {2359},
    {2360},
    {2361},
    {2362},
    {2363},
    {2364},
    {2365},
    {2366},
    {2367},
    {2368},
    {2369},
    {2370},
    {2371},
    {2372},
    {2373},
    {2374},
    {2375},
    {2376},
    {2377},
    {2378},
    {2379},
    {2380},
    {2381},
    {2382},
    {2383},
    {2384},
    {2385},
    {2386},
    {2387},
    {2388},
    {2389},
    {2390},
    {2391},
    {2392},
    {2393},
    {2394},
    {2395},
    {2396},
    {2397},
    {2398},
    {2399},
    {2400},
    {2401},
    {2402},
    {2403},
    {2404},
    {2405},
    {2406},
    {2407},
    {2408},
    {2409},
    {2410},
    {2411},
    {2412},
    {2413},
    {2414},
    {2415},
    {2416},
    {2417},
    {2418},
    {2419},
    {2420},
    {2421},
    {2422},
    {2423},
    {2424},
    {2425},
    {2426},
    {2427},
    {2428},
    {2429},
    {2430},
    {2431},
    {2432},
    {2433},
    {2434},
    {2435},
    {2436},
    {2437},
    {2438},
    {2439},
    {2440},
    {2441},
    {2442},
    {2443},
    {2444},
    {2445},
    {2446},
    {2447},
    {2448},
    {2449},
    {2450},
    {2451},
    {2452},
    {2453},
    {2454},
    {2455},
    {2456},
    {2457},
    {2458},
    {2459},
    {2460},
    {2461},
    {2462},
    {2463},
    {2464},
    {2465},
    {2466},
    {2467},
    {2468},
    {2469},
    {2470},
    {2471},
    {2472},
    {2473},
    {2474},
    {2475},
    {2476},
    {2477},
    {2478},
    {2479},
    {2480},
    {2481},
    {2482},
    {2483},
    {2484},
    {2485},
    {2486},
    {2487},
    {2488},
    {2489},
    {2490},
    {2491},
    {2492},
    {2493},
    {2494},
    {2495},
    {2496},
    {2497},
    {2498},
    {2499},
    {2500},
    {2501},
    {2502},
    {2503},
    {2504},
    {2505},
    {2506},
    {2507},
    {2508},
    {2509},
    {2510},
    {2511},
    {2512},
    {2513},
    {2514},
    {2515},
    {2516},
    {2517},
    {2518},
    {2519},
    {2520},
    {2521},
    {2522},
    {2523},
    {2524},
    {2525},
    {2526},
    {2527},
    {2528},
    {2529},
    {2530},
    {2531},
    {2532},
    {2533},
    {2534},
    {2535},
    {2536},
    {2537},
    {2538},
    {2539},
    {2540},
    {2541},
    {2542},
    {2543},
    {2544},
    {2545},
    {2546},
    {2547},
    {2548},
    {2549},
    {2550},
    {2551},
    {2552},
    {2553},
    {2554},
    {2555},
    {2556},
    {2557},
    {2558},
    {2559},
    {2560},
    {2561},
    {2562},
    {2563},
    {2564},
    {2565},
    {2566},
    {2567},
    {2568},
    {2569},
    {2570},
    {2571},
    {2572},
    {2573},
    {2574},
    {2575},
    {2576},
    {2577},
    {2578},
    {2579},
    {2580},
    {2581},
    {2582},
    {2583},
    {2584},
    {2585},
    {2586},
    {2587},
    {2588},
    {2589},
    {2590},
    {2591},
    {2592},
    {2593},
    {2594},
    {2595},
    {2596},
    {2597},
    {2598},
    {2599},
    {2600},
    {2601},
    {2602},
    {2603},
    {2604},
    {2605},
    {2606},
    {2607},
    {2608},
    {2609},
    {2610},
    {2611},
    {2612},
    {2613},
    {2614},
    {2615},
    {2616},
    {2617},
    {2618},
    {2619},
    {2620},
    {2621},
    {2622},
    {2623},
    {2624},
    {2625},
    {2626},
    {2627},
    {2628},
    {2629},
    {2630},
    {2631},
    {2632},
    {2633},
    {2634},
    {2635},
    {2636},
    {2637},
    {2638},
    {2639},
    {2640},
    {2641},
    {2642},
    {2643},
    {2644},
    {2645},
    {2646},
    {2647},
    {2648},
    {2649},
    {2650},
    {2651},
    {2652},
    {2653},
    {2654},
    {2655},
    {2656},
    {2657},
    {2658},
    {2659},
    {2660},
    {2661},
    {2662},
    {2663},
    {2664},
    {2665},
    {2666},
    {2667},
    {2668},
    {2669},
    {2670},
    {2671},
    {2672},
    {2673},
    {2674},
    {2675},
    {2676},
    {2677},
    {2678},
    {2679},
    {2680},
    {2681},
    {2682},
    {2683},
    {2684},
    {2685},
    {2686},
    {2687},
    {2688},
    {2689},
    {2690},
    {2691},
    {2692},
    {2693},
    {2694},
    {2695},
    {2696},
    {2697},
    {2698},
    {2699},
    {2700},
    {2701},
    {2702},
    {2703},
    {2704},
    {2705},
    {2706},
    {2707},
    {2708},
    {2709},
    {2710},
    {2711},
    {2712},
    {2713},
    {2714},
    {2715},
    {2716},
    {2717},
    {2718},
    {2719},
    {2720},
    {2721},
    {2722},
    {2723},
    {2724},
    {2725},
    {2726},
    {2727},
    {2728},
    {2729},
    {2730},
    {2731},
    {2732},
    {2733},
    {2734},
    {2735},
    {2736},
    {2737},
    {2738},
    {2739},
    {2740},
    {2741},
    {2742},
    {2743},
    {2744},
    {2745},
    {2746},
    {2747},
    {2748},
    {2749},
    {2750},
    {2751},
    {2752},
    {2753},
    {2754},
    {2755},
    {2756},
    {2757},
    {2758},
    {2759},
    {2760},
    {2761},
    {2762},
    {2763},
    {2764},
    {2765},
    {2766},
    {2767},
    {2768},
    {2769},
    {2770},
    {2771},
    {2772},
    {2773},
    {2774},
    {2775},
    {2776},
    {2777},
    {2778},
    {2779},
    {2780},
    {2781},
    {2782},
    {2783},
    {2784},
    {2785},
    {2786},
    {2787},
    {2788},
    {2789},
    {2790},
    {2791},
    {2792},
    {2793},
    {2794},
    {2795},
    {2796},
    {2797},
    {2798},
    {2799},
    {2800},
    {2801},
    {2802},
    {2803},
    {2804},
    {2805},
    {2806},
    {2807},
    {2808},
    {2809},
    {2810},
    {2811},
    {2812},
    {2813},
    {2814},
    {2815},
    {2816},
    {2817},
    {2818},
    {2819},
    {2820},
    {2821},
    {2822},
    {2823},
    {2824},
    {2825},
    {2826},
    {2827},
    {2828},
    {2829},
    {2830},
    {2831},
    {2832},
    {2833},
    {2834},
    {2835},
    {2836},
    {2837},
    {2838},
    {2839},
    {2840},
    {2841},
    {2842},
    {2843},
    {2844},
    {2845},
    {2846},
    {2847},
    {2848},
    {2849},
    {2850},
    {2851},
    {2852},
    {2853},
    {2854},
    {2855},
    {2856},
    {2857},
    {2858},
    {2859},
    {2860},
    {2861},
    {2862},
    {2863},
    {2864},
    {2865},
    {2866},
    {2867},
    {2868},
    {2869},
    {2870},
    {2871},
    {2872},
    {2873},
    {2874},
    {2875},
    {2876},
    {2877},
    {2878},
    {2879},
    {2880},
    {2881},
    {2882},
    {2883},
    {2884},
    {2885},
    {2886},
    {2887},
    {2888},
    {2889},
    {2890},
    {2891},
    {2892},
    {2893},
    {2894},
    {2895},
    {2896},
    {2897},
    {2898},
    {2899},
    {2900},
    {2901},
    {2902},
    {2903},
    {2904},
    {2905},
    {2906},
    {2907},
    {2908},
    {2909},
    {2910},
    {2911},
    {2912},
    {2913},
    {2914},
    {2915},
    {2916},
    {2917},
    {2918},
    {2919},
    {2920},
    {2921},
    {2922},
    {2923},
    {2924},
    {2925},
    {2926},
    {2927},
    {2928},
    {2929}
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
    210,
    211,
    212,
    213,
    214,
    215,
    216,
    217,
    218,
    219,
    220,
    221,
    222,
    223,
    224,
    225,
    226,
    227,
    228,
    229,
    230,
    231,
    232,
    233,
    234,
    235,
    236,
    237,
    238,
    239,
    240,
    241,
    242,
    243,
    244,
    245,
    246,
    247,
    248,
    249,
    250,
    251,
    252,
    253,
    254,
    255,
    256,
    257,
    258,
    259,
    260,
    261,
    262,
    263,
    264,
    265,
    266,
    267,
    268,
    269,
    270,
    271,
    272,
    273,
    274,
    275,
    276,
    277,
    278,
    279,
    280,
    281,
    282,
    283,
    284,
    285,
    286,
    287,
    288,
    289,
    290,
    291,
    292,
    293,
    294,
    295,
    296,
    297,
    298,
    299,
    300,
    301,
    302,
    303,
    304,
    305,
    306,
    307,
    308,
    309,
    310,
    311,
    312,
    313,
    314,
    315,
    316,
    317,
    318,
    319,
    320,
    321,
    322,
    323,
    324,
    325,
    326,
    327,
    328,
    329,
    330,
    331,
    332,
    333,
    334,
    335,
    336,
    337,
    338,
    339,
    340,
    341,
    342,
    343,
    344,
    345,
    346,
    347,
    348,
    349,
    350,
    351,
    352,
    353,
    354,
    355,
    356,
    357,
    358,
    359,
    360,
    361,
    362,
    363,
    364,
    365,
    366,
    367,
    368,
    369,
    370,
    371,
    372,
    373,
    374,
    375,
    376,
    377,
    378,
    379,
    380,
    381,
    382,
    383,
    384,
    385,
    386,
    387,
    388,
    389,
    390,
    391,
    392,
    393,
    394,
    395,
    396,
    397,
    398,
    399,
    400,
    401,
    402,
    403,
    404,
    405,
    406,
    407,
    408,
    409,
    410,
    411,
    412,
    413,
    414,
    415,
    416,
    417,
    418,
    419,
    420,
    421,
    422,
    423,
    424,
    425,
    426,
    427,
    428,
    429,
    430,
    431,
    432,
    433,
    434,
    435,
    436,
    437,
    438,
    439,
    440,
    441,
    442,
    443,
    444,
    445,
    446,
    447,
    448,
    449,
    450,
    451,
    452,
    453,
    454,
    455,
    456,
    457,
    458,
    459,
    460,
    461,
    462,
    463,
    464,
    465,
    466,
    467,
    468,
    469,
    470,
    471,
    472,
    473,
    474,
    475,
    476,
    477,
    478,
    479,
    480,
    481,
    482,
    483,
    484,
    485,
    486,
    487,
    488,
    489,
    490,
    491,
    492,
    493,
    494,
    495,
    496,
    497,
    498,
    499,
    500,
    501,
    502,
    503,
    504,
    505,
    506,
    507,
    508,
    509,
    510,
    511,
    512,
    513,
    514,
    515,
    516,
    517,
    518,
    519,
    520,
    521,
    522,
    523,
    524,
    525,
    526,
    527,
    528,
    529,
    530,
    531,
    532,
    533,
    534,
    535,
    536,
    537,
    538,
    539,
    540,
    541,
    542,
    543,
    544,
    545,
    546,
    547,
    548,
    549,
    550,
    551,
    552,
    553,
    554,
    555,
    556,
    557,
    558,
    559,
    560,
    561,
    562,
    563,
    564,
    565,
    566,
    567,
    568,
    569,
    570,
    571,
    572,
    573,
    574,
    575,
    576,
    577,
    578,
    579,
    580,
    581,
    582,
    583,
    584,
    585,
    586,
    587,
    588,
    589,
    590,
    591,
    592,
    593,
    594,
    595,
    596,
    597,
    598,
    599,
    600,
    601,
    602,
    603,
    604,
    605,
    606,
    607,
    608,
    609,
    610,
    611,
    612,
    613,
    614,
    615,
    616,
    617,
    618,
    619,
    620,
    621,
    622,
    623,
    624,
    625,
    626,
    627,
    628,
    629,
    630,
    631,
    632,
    633,
    634,
    635,
    636,
    637,
    638,
    639,
    640,
    641,
    642,
    643,
    644,
    645,
    646,
    647,
    648,
    649,
    650,
    651,
    652,
    653,
    654,
    655,
    656,
    657,
    658,
    659,
    660,
    661,
    662,
    663,
    664,
    665,
    666,
    667,
    668,
    669,
    670,
    671,
    672,
    673,
    674,
    675,
    676,
    677,
    678,
    679,
    680,
    681,
    682,
    683,
    684,
    685,
    686,
    687,
    688,
    689,
    690,
    691,
    692,
    693,
    694,
    695,
    696,
    697,
    698,
    699,
    700,
    701,
    702,
    703,
    704,
    705,
    706,
    707,
    708,
    709,
    710,
    711,
    712,
    713,
    714,
    715,
    716,
    717,
    718,
    719,
    720,
    721,
    722,
    723,
    724,
    725,
    726,
    727,
    728,
    729,
    730,
    731,
    732,
    733,
    734,
    735,
    736,
    737,
    738,
    739,
    740,
    741,
    742,
    743,
    744,
    745,
    746,
    747,
    748,
    749,
    750,
    751,
    752,
    753,
    754,
    755,
    756,
    757,
    758,
    759,
    760,
    761,
    762,
    763,
    764,
    765,
    766,
    767,
    768,
    769,
    770,
    771,
    772,
    773,
    774,
    775,
    776,
    777,
    778,
    779,
    780,
    781,
    782,
    783,
    784,
    785,
    786,
    787,
    788,
    789,
    790,
    791,
    792,
    793,
    794,
    795,
    796,
    797,
    798,
    799,
    800,
    801,
    802,
    803,
    804,
    805,
    806,
    807,
    808,
    809,
    810,
    811,
    812,
    813,
    814,
    815,
    816,
    817,
    818,
    819,
    820,
    821,
    822,
    823,
    824,
    825,
    826,
    827,
    828,
    829,
    830,
    831,
    832,
    833,
    834,
    835,
    836,
    837,
    838,
    839,
    840,
    841,
    842,
    843,
    844,
    845,
    846,
    847,
    848,
    849,
    850,
    851,
    852,
    853,
    854,
    855,
    856,
    857,
    858,
    859,
    860,
    861,
    862,
    863,
    864,
    865,
    866,
    867,
    868,
    869,
    870,
    871,
    872,
    873,
    874,
    875,
    876,
    877,
    878,
    879,
    880,
    881,
    882,
    883,
    884,
    885,
    886,
    887,
    888,
    889,
    890,
    891,
    892,
    893,
    894,
    895,
    896,
    897,
    898,
    899,
    900,
    901,
    902,
    903,
    904,
    905,
    906,
    907,
    908,
    909,
    910,
    911,
    912,
    913,
    914,
    915,
    916,
    917,
    918,
    919,
    920,
    921,
    922,
    923,
    924,
    925,
    926,
    927,
    928,
    929,
    930,
    931,
    932,
    933,
    934,
    935,
    936,
    937,
    938,
    939,
    940,
    941,
    942,
    943,
    944,
    945,
    946,
    947,
    948,
    949,
    950,
    951,
    952,
    953,
    954,
    955,
    956,
    957,
    958,
    959,
    960,
    961,
    962,
    963,
    964,
    965,
    966,
    967,
    968,
    969,
    970,
    971,
    972,
    973,
    974,
    975,
    976,
    977,
    978,
    979,
    980,
    981,
    982,
    983,
    984,
    985,
    986,
    987,
    988,
    989,
    990,
    991,
    992,
    993,
    994,
    995,
    996,
    997,
    998,
    999,
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
    1096,
    1097,
    1098,
    1099,
    1100,
    1101,
    1102,
    1103,
    1104,
    1105,
    1106,
    1107,
    1108,
    1109,
    1110,
    1111,
    1112,
    1113,
    1114,
    1115,
    1116,
    1117,
    1118,
    1119,
    1120,
    1121,
    1122,
    1123,
    1124,
    1125,
    1126,
    1127,
    1128,
    1129,
    1130,
    1131,
    1132,
    1133,
    1134,
    1135,
    1136,
    1137,
    1138,
    1139,
    1140,
    1141,
    1142,
    1143,
    1144,
    1145,
    1146,
    1147,
    1148,
    1149,
    1150,
    1151,
    1152,
    1153,
    1154,
    1155,
    1156,
    1157,
    1158,
    1159,
    1160,
    1161,
    1162,
    1163,
    1164,
    1165,
    1166,
    1167,
    1168,
    1169,
    1170,
    1171,
    1172,
    1173,
    1174,
    1175,
    1176,
    1177,
    1178,
    1179,
    1180,
    1181,
    1182,
    1183,
    1184,
    1185,
    1186,
    1187,
    1188,
    1189,
    1190,
    1191,
    1192,
    1193,
    1194,
    1195,
    1196,
    1197,
    1198,
    1199,
    1200,
    1201,
    1202,
    1203,
    1204,
    1205,
    1206,
    1207,
    1208,
    1209,
    1210,
    1211,
    1212,
    1213,
    1214,
    1215,
    1216,
    1217,
    1218,
    1219,
    1220,
    1221,
    1222,
    1223,
    1224,
    1225,
    1226,
    1227,
    1228,
    1229,
    1230,
    1231,
    1232,
    1233,
    1234,
    1235,
    1236,
    1237,
    1238,
    1239,
    1240,
    1241,
    1242,
    1243,
    1244,
    1245,
    1246,
    1247,
    1248,
    1249,
    1250,
    1251,
    1252,
    1253,
    1254,
    1255,
    1256,
    1257,
    1258,
    1259,
    1260,
    1261,
    1262,
    1263,
    1264,
    1265,
    1266,
    1267,
    1268,
    1269,
    1270,
    1271,
    1272,
    1273,
    1274,
    1275,
    1276,
    1277,
    1278,
    1279,
    1280,
    1281,
    1282,
    1283,
    1284,
    1285,
    1286,
    1287,
    1288,
    1289,
    1290,
    1291,
    1292,
    1293,
    1294,
    1295,
    1296,
    1297,
    1298,
    1299,
    1300,
    1301,
    1302,
    1303,
    1304,
    1305,
    1306,
    1307,
    1308,
    1309,
    1310,
    1311,
    1312,
    1313,
    1314,
    1315,
    1316,
    1317,
    1318,
    1319,
    1320,
    1321,
    1322,
    1323,
    1324,
    1325,
    1326,
    1327,
    1328,
    1329,
    1330,
    1331,
    1332,
    1333,
    1334,
    1335,
    1336,
    1337,
    1338,
    1339,
    1340,
    1341,
    1342,
    1343,
    1344,
    1345,
    1346,
    1347,
    1348,
    1349,
    1350,
    1351,
    1352,
    1353,
    1354,
    1355,
    1356,
    1357,
    1358,
    1359,
    1360,
    1361,
    1362,
    1363,
    1364,
    1365,
    1366,
    1367,
    1368,
    1369,
    1370,
    1371,
    1372,
    1373,
    1374,
    1375,
    1376,
    1377,
    1378,
    1379,
    1380,
    1381,
    1382,
    1383,
    1384,
    1385,
    1386,
    1387,
    1388,
    1389,
    1390,
    1391,
    1392,
    1393,
    1394,
    1395,
    1396,
    1397,
    1398,
    1399,
    1400,
    1401,
    1402,
    1403,
    1404,
    1405,
    1406,
    1407,
    1408,
    1409,
    1410,
    1411,
    1412,
    1413,
    1414,
    1415,
    1416,
    1417,
    1418,
    1419,
    1420,
    1421,
    1422,
    1423,
    1424,
    1425,
    1426,
    1427,
    1428,
    1429,
    1430,
    1431,
    1432,
    1433,
    1434,
    1435,
    1436,
    1437,
    1438,
    1439,
    1440,
    1441,
    1442,
    1443,
    1444,
    1445,
    1446,
    1447,
    1448,
    1449,
    1450,
    1451,
    1452,
    1453,
    1454,
    1455,
    1456,
    1457,
    1458,
    1459,
    1460,
    1461,
    1462,
    1463,
    1464,
    1465,
    1466,
    1467,
    1468,
    1469,
    1470,
    1471,
    1472,
    1473,
    1474,
    1475,
    1476,
    1477,
    1478,
    1479,
    1480,
    1481,
    1482,
    1483,
    1484,
    1485,
    1486,
    1487,
    1488,
    1489,
    1490,
    1491,
    1492,
    1493,
    1494,
    1495,
    1496,
    1497,
    1498,
    1499,
    1500,
    1501,
    1502,
    1503,
    1504,
    1505,
    1506,
    1507,
    1508,
    1509,
    1510,
    1511,
    1512,
    1513,
    1514,
    1515,
    1516,
    1517,
    1518,
    1519,
    1520,
    1521,
    1522,
    1523,
    1524,
    1525,
    1526,
    1527,
    1528,
    1529,
    1530,
    1531,
    1532,
    1533,
    1534,
    1535,
    1536,
    1537,
    1538,
    1539,
    1540,
    1541,
    1542,
    1543,
    1544,
    1545,
    1546,
    1547,
    1548,
    1549,
    1550,
    1551,
    1552,
    1553,
    1554,
    1555,
    1556,
    1557,
    1558,
    1559,
    1560,
    1561,
    1562,
    1563,
    1564,
    1565,
    1566,
    1567,
    1568,
    1569,
    1570,
    1571,
    1572,
    1573,
    1574,
    1575,
    1576,
    1577,
    1578,
    1579,
    1580,
    1581,
    1582,
    1583,
    1584,
    1585,
    1586,
    1587,
    1588,
    1589,
    1590,
    1591,
    1592,
    1593,
    1594,
    1595,
    1596,
    1597,
    1598,
    1599,
    1600,
    1601,
    1602,
    1603,
    1604,
    1605,
    1606,
    1607,
    1608,
    1609,
    1610,
    1611,
    1612,
    1613,
    1614,
    1615,
    1616,
    1617,
    1618,
    1619,
    1620,
    1621,
    1622,
    1623,
    1624,
    1625,
    1626,
    1627,
    1628,
    1629,
    1630,
    1631,
    1632,
    1633,
    1634,
    1635,
    1636,
    1637,
    1638,
    1639,
    1640,
    1641,
    1642,
    1643,
    1644,
    1645,
    1646,
    1647,
    1648,
    1649,
    1650,
    1651,
    1652,
    1653,
    1654,
    1655,
    1656,
    1657,
    1658,
    1659,
    1660,
    1661,
    1662,
    1663,
    1664,
    1665,
    1666,
    1667,
    1668,
    1669,
    1670,
    1671,
    1672,
    1673,
    1674,
    1675,
    1676,
    1677,
    1678,
    1679,
    1680,
    1681,
    1682,
    1683,
    1684,
    1685,
    1686,
    1687,
    1688,
    1689,
    1690,
    1691,
    1692,
    1693,
    1694,
    1695,
    1696,
    1697,
    1698,
    1699,
    1700,
    1701,
    1702,
    1703,
    1704,
    1705,
    1706,
    1707,
    1708,
    1709,
    1710,
    1711,
    1712,
    1713,
    1714,
    1715,
    1716,
    1717,
    1718,
    1719,
    1720,
    1721,
    1722,
    1723,
    1724,
    1725,
    1726,
    1727,
    1728,
    1729,
    1730,
    1731,
    1732,
    1733,
    1734,
    1735,
    1736,
    1737,
    1738,
    1739,
    1740,
    1741,
    1742,
    1743,
    1744,
    1745,
    1746,
    1747,
    1748,
    1749,
    1750,
    1751,
    1752,
    1753,
    1754,
    1755,
    1756,
    1757,
    1758,
    1759,
    1760,
    1761,
    1762,
    1763,
    1764,
    1765,
    1766,
    1767,
    1768,
    1769,
    1770,
    1771,
    1772,
    1773,
    1774,
    1775,
    1776,
    1777,
    1778,
    1779,
    1780,
    1781,
    1782,
    1783,
    1784,
    1785,
    1786,
    1787,
    1788,
    1789,
    1790,
    1791,
    1792,
    1793,
    1794,
    1795,
    1796,
    1797,
    1798,
    1799,
    1800,
    1801,
    1802,
    1803,
    1804,
    1805,
    1806,
    1807,
    1808,
    1809,
    1810,
    1811,
    1812,
    1813,
    1814,
    1815,
    1816,
    1817,
    1818,
    1819,
    1820,
    1821,
    1822,
    1823,
    1824,
    1825,
    1826,
    1827,
    1828,
    1829,
    1830,
    1831,
    1832,
    1833,
    1834,
    1835,
    1836,
    1837,
    1838,
    1839,
    1840,
    1841,
    1842,
    1843,
    1844,
    1845,
    1846,
    1847,
    1848,
    1849,
    1850,
    1851,
    1852,
    1853,
    1854,
    1855,
    1856,
    1857,
    1858,
    1859,
    1860,
    1861,
    1862,
    1863,
    1864,
    1865,
    1866,
    1867,
    1868,
    1869,
    1870,
    1871,
    1872,
    1873,
    1874,
    1875,
    1876,
    1877,
    1878,
    1879,
    1880,
    1881,
    1882,
    1883,
    1884,
    1885,
    1886,
    1887,
    1888,
    1889,
    1890,
    1891,
    1892,
    1893,
    1894,
    1895,
    1896,
    1897,
    1898,
    1899,
    1900,
    1901,
    1902,
    1903,
    1904,
    1905,
    1906,
    1907,
    1908,
    1909,
    1910,
    1911,
    1912,
    1913,
    1914,
    1915,
    1916,
    1917,
    1918,
    1919,
    1920,
    1921,
    1922,
    1923,
    1924,
    1925,
    1926,
    1927,
    1928,
    1929,
    1930,
    1931,
    1932,
    1933,
    1934,
    1935,
    1936,
    1937,
    1938,
    1939,
    1940,
    1941,
    1942,
    1943,
    1944,
    1945,
    1946,
    1947,
    1948,
    1949,
    1950,
    1951,
    1952,
    1953,
    1954,
    1955,
    1956,
    1957,
    1958,
    1959,
    1960,
    1961,
    1962,
    1963,
    1964,
    1965,
    1966,
    1967,
    1968,
    1969,
    1970,
    1971,
    1972,
    1973,
    1974,
    1975,
    1976,
    1977,
    1978,
    1979,
    1980,
    1981,
    1982,
    1983,
    1984,
    1985,
    1986,
    1987,
    1988,
    1989,
    1990,
    1991,
    1992,
    1993,
    1994,
    1995,
    1996,
    1997,
    1998,
    1999,
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
    2095,
    2096,
    2097,
    2098,
    2099,
    2100,
    2101,
    2102,
    2103,
    2104,
    2105,
    2106,
    2107,
    2108,
    2109,
    2110,
    2111,
    2112,
    2113,
    2114,
    2115,
    2116,
    2117,
    2118,
    2119,
    2120,
    2121,
    2122,
    2123,
    2124,
    2125,
    2126,
    2127,
    2128,
    2129,
    2130,
    2131,
    2132,
    2133,
    2134,
    2135,
    2136,
    2137,
    2138,
    2139,
    2140,
    2141,
    2142,
    2143,
    2144,
    2145,
    2146,
    2147,
    2148,
    2149,
    2150,
    2151,
    2152,
    2153,
    2154,
    2155,
    2156,
    2157,
    2158,
    2159,
    2160,
    2161,
    2162,
    2163,
    2164,
    2165,
    2166,
    2167,
    2168,
    2169,
    2170,
    2171,
    2172,
    2173,
    2174,
    2175,
    2176,
    2177,
    2178,
    2179,
    2180,
    2181,
    2182,
    2183,
    2184,
    2185,
    2186,
    2187,
    2188,
    2189,
    2190,
    2191,
    2192,
    2193,
    2194,
    2195,
    2196,
    2197,
    2198,
    2199,
    2200,
    2201,
    2202,
    2203,
    2204,
    2205,
    2206,
    2207,
    2208,
    2209,
    2210,
    2211,
    2212,
    2213,
    2214,
    2215,
    2216,
    2217,
    2218,
    2219,
    2220,
    2221,
    2222,
    2223,
    2224,
    2225,
    2226,
    2227,
    2228,
    2229,
    2230,
    2231,
    2232,
    2233,
    2234,
    2235,
    2236,
    2237,
    2238,
    2239,
    2240,
    2241,
    2242,
    2243,
    2244,
    2245,
    2246,
    2247,
    2248,
    2249,
    2250,
    2251,
    2252,
    2253,
    2254,
    2255,
    2256,
    2257,
    2258,
    2259,
    2260,
    2261,
    2262,
    2263,
    2264,
    2265,
    2266,
    2267,
    2268,
    2269,
    2270,
    2271,
    2272,
    2273,
    2274,
    2275,
    2276,
    2277,
    2278,
    2279,
    2280,
    2281,
    2282,
    2283,
    2284,
    2285,
    2286,
    2287,
    2288,
    2289,
    2290,
    2291,
    2292,
    2293,
    2294,
    2295,
    2296,
    2297,
    2298,
    2299,
    2300,
    2301,
    2302,
    2303,
    2304,
    2305,
    2306,
    2307,
    2308,
    2309,
    2310,
    2311,
    2312,
    2313,
    2314,
    2315,
    2316,
    2317,
    2318,
    2319,
    2320,
    2321,
    2322,
    2323,
    2324,
    2325,
    2326,
    2327,
    2328,
    2329,
    2330,
    2331,
    2332,
    2333,
    2334,
    2335,
    2336,
    2337,
    2338,
    2339,
    2340,
    2341,
    2342,
    2343,
    2344,
    2345,
    2346,
    2347,
    2348,
    2349,
    2350,
    2351,
    2352,
    2353,
    2354,
    2355,
    2356,
    2357,
    2358,
    2359,
    2360,
    2361,
    2362,
    2363,
    2364,
    2365,
    2366,
    2367,
    2368,
    2369,
    2370,
    2371,
    2372,
    2373,
    2374,
    2375,
    2376,
    2377,
    2378,
    2379,
    2380,
    2381,
    2382,
    2383,
    2384,
    2385,
    2386,
    2387,
    2388,
    2389,
    2390,
    2391,
    2392,
    2393,
    2394,
    2395,
    2396,
    2397,
    2398,
    2399,
    2400,
    2401,
    2402,
    2403,
    2404,
    2405,
    2406,
    2407,
    2408,
    2409,
    2410,
    2411,
    2412,
    2413,
    2414,
    2415,
    2416,
    2417,
    2418,
    2419,
    2420,
    2421,
    2422,
    2423,
    2424,
    2425,
    2426,
    2427,
    2428,
    2429,
    2430,
    2431,
    2432,
    2433,
    2434,
    2435,
    2436,
    2437,
    2438,
    2439,
    2440,
    2441,
    2442,
    2443,
    2444,
    2445,
    2446,
    2447,
    2448,
    2449,
    2450,
    2451,
    2452,
    2453,
    2454,
    2455,
    2456,
    2457,
    2458,
    2459,
    2460,
    2461,
    2462,
    2463,
    2464,
    2465,
    2466,
    2467,
    2468,
    2469,
    2470,
    2471,
    2472,
    2473,
    2474,
    2475,
    2476,
    2477,
    2478,
    2479,
    2480,
    2481,
    2482,
    2483,
    2484,
    2485,
    2486,
    2487,
    2488,
    2489,
    2490,
    2491,
    2492,
    2493,
    2494,
    2495,
    2496,
    2497,
    2498,
    2499,
    2500,
    2501,
    2502,
    2503,
    2504,
    2505,
    2506,
    2507,
    2508,
    2509,
    2510,
    2511,
    2512,
    2513,
    2514,
    2515,
    2516,
    2517,
    2518,
    2519,
    2520,
    2521,
    2522,
    2523,
    2524,
    2525,
    2526,
    2527,
    2528,
    2529,
    2530,
    2531,
    2532,
    2533,
    2534,
    2535,
    2536,
    2537,
    2538,
    2539,
    2540,
    2541,
    2542,
    2543,
    2544,
    2545,
    2546,
    2547,
    2548,
    2549,
    2550,
    2551,
    2552,
    2553,
    2554,
    2555,
    2556,
    2557,
    2558,
    2559,
    2560,
    2561,
    2562,
    2563,
    2564,
    2565,
    2566,
    2567,
    2568,
    2569,
    2570,
    2571,
    2572,
    2573,
    2574,
    2575,
    2576,
    2577,
    2578,
    2579,
    2580,
    2581,
    2582,
    2583,
    2584,
    2585,
    2586,
    2587,
    2588,
    2589,
    2590,
    2591,
    2592,
    2593,
    2594,
    2595,
    2596,
    2597,
    2598,
    2599,
    2600,
    2601,
    2602,
    2603,
    2604,
    2605,
    2606,
    2607,
    2608,
    2609,
    2610,
    2611,
    2612,
    2613,
    2614,
    2615,
    2616,
    2617,
    2618,
    2619,
    2620,
    2621,
    2622,
    2623,
    2624,
    2625,
    2626,
    2627,
    2628,
    2629,
    2630,
    2631,
    2632,
    2633,
    2634,
    2635,
    2636,
    2637,
    2638,
    2639,
    2640,
    2641,
    2642,
    2643,
    2644,
    2645,
    2646,
    2647,
    2648,
    2649,
    2650,
    2651,
    2652,
    2653,
    2654,
    2655,
    2656,
    2657,
    2658,
    2659,
    2660,
    2661,
    2662,
    2663,
    2664,
    2665,
    2666,
    2667,
    2668,
    2669,
    2670,
    2671,
    2672,
    2673,
    2674,
    2675,
    2676,
    2677,
    2678,
    2679,
    2680,
    2681,
    2682,
    2683,
    2684,
    2685,
    2686,
    2687,
    2688,
    2689,
    2690,
    2691,
    2692,
    2693,
    2694,
    2695,
    2696,
    2697,
    2698,
    2699,
    2700,
    2701,
    2702,
    2703,
    2704,
    2705,
    2706,
    2707,
    2708,
    2709,
    2710,
    2711,
    2712,
    2713,
    2714,
    2715,
    2716,
    2717,
    2718,
    2719,
    2720,
    2721,
    2722,
    2723,
    2724,
    2725,
    2726,
    2727,
    2728,
    2729,
    2730,
    2731,
    2732,
    2733,
    2734,
    2735,
    2736,
    2737,
    2738,
    2739,
    2740,
    2741,
    2742,
    2743,
    2744,
    2745,
    2746,
    2747,
    2748,
    2749,
    2750,
    2751,
    2752,
    2753,
    2754,
    2755,
    2756,
    2757,
    2758,
    2759,
    2760,
    2761,
    2762,
    2763,
    2764,
    2765,
    2766,
    2767,
    2768,
    2769,
    2770,
    2771,
    2772,
    2773,
    2774,
    2775,
    2776,
    2777,
    2778,
    2779,
    2780,
    2781,
    2782,
    2783,
    2784,
    2785,
    2786,
    2787,
    2788,
    2789,
    2790,
    2791,
    2792,
    2793,
    2794,
    2795,
    2796,
    2797,
    2798,
    2799,
    2800,
    2801,
    2802,
    2803,
    2804,
    2805,
    2806,
    2807,
    2808,
    2809,
    2810,
    2811,
    2812,
    2813,
    2814,
    2815,
    2816,
    2817,
    2818,
    2819,
    2820,
    2821,
    2822,
    2823,
    2824,
    2825,
    2826,
    2827,
    2828,
    2829,
    2830,
    2831,
    2832,
    2833,
    2834,
    2835,
    2836,
    2837,
    2838,
    2839,
    2840,
    2841,
    2842,
    2843,
    2844,
    2845,
    2846,
    2847,
    2848,
    2849,
    2850,
    2851,
    2852,
    2853,
    2854,
    2855,
    2856,
    2857,
    2858,
    2859,
    2860,
    2861,
    2862,
    2863,
    2864,
    2865,
    2866,
    2867,
    2868,
    2869,
    2870,
    2871,
    2872,
    2873,
    2874,
    2875,
    2876,
    2877,
    2878,
    2879,
    2880,
    2881,
    2882,
    2883,
    2884,
    2885,
    2886,
    2887,
    2888,
    2889,
    2890,
    2891,
    2892,
    2893,
    2894,
    2895,
    2896,
    2897,
    2898,
    2899,
    2900,
    2901,
    2902,
    2903,
    2904,
    2905,
    2906,
    2907,
    2908,
    2909,
    2910,
    2911,
    2912,
    2913,
    2914,
    2915,
    2916,
    2917,
    2918,
    2919,
    2920,
    2921,
    2922,
    2923,
    2924,
    2925,
    2926,
    2927,
    2928,
    2929
    ].

getKey(1)->[
    1
    ];
getKey(2)->[
    2,
    3
    ];
getKey(51)->[
    4
    ];
getKey(52)->[
    5
    ];
getKey(53)->[
    6
    ];
getKey(54)->[
    7
    ];
getKey(55)->[
    8
    ];
getKey(56)->[
    9
    ];
getKey(57)->[
    10
    ];
getKey(58)->[
    11
    ];
getKey(59)->[
    12
    ];
getKey(60)->[
    13
    ];
getKey(71)->[
    14
    ];
getKey(72)->[
    15
    ];
getKey(73)->[
    16
    ];
getKey(74)->[
    17
    ];
getKey(75)->[
    18
    ];
getKey(76)->[
    19
    ];
getKey(77)->[
    20
    ];
getKey(78)->[
    21
    ];
getKey(79)->[
    22
    ];
getKey(80)->[
    23
    ];
getKey(101)->[
    24,
    25,
    26,
    27
    ];
getKey(102)->[
    28,
    29
    ];
getKey(103)->[
    30,
    31,
    32
    ];
getKey(221)->[
    33
    ];
getKey(261)->[
    34
    ];
getKey(262)->[
    35
    ];
getKey(263)->[
    36
    ];
getKey(1001)->[
    37,
    38,
    39,
    40,
    41,
    42,
    43,
    44,
    45,
    46
    ];
getKey(1002)->[
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
    61
    ];
getKey(1003)->[
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
    76
    ];
getKey(1004)->[
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
    91
    ];
getKey(1005)->[
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
    106
    ];
getKey(1006)->[
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
    120
    ];
getKey(1007)->[
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
    134
    ];
getKey(1008)->[
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
    148
    ];
getKey(1009)->[
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
    162
    ];
getKey(1010)->[
    163,
    164,
    165,
    166,
    167,
    168,
    169
    ];
getKey(1011)->[
    170,
    171,
    172,
    173,
    174,
    175,
    176
    ];
getKey(1012)->[
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
    191
    ];
getKey(1013)->[
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
    206
    ];
getKey(1014)->[
    207,
    208,
    209,
    210,
    211,
    212,
    213,
    214,
    215,
    216,
    217,
    218,
    219,
    220,
    221
    ];
getKey(1015)->[
    222,
    223,
    224,
    225,
    226,
    227,
    228,
    229,
    230,
    231,
    232,
    233,
    234,
    235
    ];
getKey(1016)->[
    236,
    237,
    238,
    239,
    240,
    241,
    242,
    243,
    244,
    245,
    246,
    247,
    248,
    249
    ];
getKey(1017)->[
    250,
    251,
    252,
    253,
    254,
    255,
    256,
    257,
    258,
    259,
    260,
    261,
    262,
    263,
    264,
    265
    ];
getKey(1020)->[
    266,
    267,
    268,
    269,
    270,
    271,
    272,
    273,
    274,
    275,
    276,
    277,
    278,
    279,
    280
    ];
getKey(1021)->[
    281,
    282,
    283,
    284,
    285,
    286,
    287,
    288,
    289,
    290,
    291,
    292,
    293,
    294,
    295
    ];
getKey(1301)->[
    296,
    297,
    298
    ];
getKey(1302)->[
    299,
    300,
    301
    ];
getKey(1303)->[
    302,
    303,
    304,
    305
    ];
getKey(1304)->[
    306,
    307,
    308,
    309
    ];
getKey(1305)->[
    310,
    311,
    312,
    313
    ];
getKey(1426)->[
    314,
    315
    ];
getKey(1427)->[
    316,
    317
    ];
getKey(1428)->[
    318,
    319
    ];
getKey(1429)->[
    320,
    321
    ];
getKey(1430)->[
    322,
    323
    ];
getKey(1431)->[
    324,
    325
    ];
getKey(1901)->[
    326
    ];
getKey(1902)->[
    327
    ];
getKey(1903)->[
    328
    ];
getKey(1904)->[
    329
    ];
getKey(1905)->[
    330
    ];
getKey(1915)->[
    331,
    332,
    333,
    334
    ];
getKey(1916)->[
    335,
    336,
    337,
    338
    ];
getKey(1917)->[
    339,
    340,
    341,
    342
    ];
getKey(1918)->[
    343,
    344,
    345,
    346
    ];
getKey(1919)->[
    347,
    348,
    349,
    350
    ];
getKey(1920)->[
    351,
    352,
    353
    ];
getKey(1921)->[
    354,
    355,
    356
    ];
getKey(1922)->[
    357,
    358,
    359
    ];
getKey(1924)->[
    360,
    361
    ];
getKey(1925)->[
    362,
    363
    ];
getKey(1926)->[
    364,
    365
    ];
getKey(1927)->[
    366,
    367
    ];
getKey(1928)->[
    368,
    369
    ];
getKey(1929)->[
    370,
    371
    ];
getKey(1930)->[
    372,
    373
    ];
getKey(1931)->[
    374,
    375
    ];
getKey(1932)->[
    376,
    377
    ];
getKey(1933)->[
    378,
    379
    ];
getKey(1934)->[
    380,
    381
    ];
getKey(2000)->[
    382,
    383
    ];
getKey(2001)->[
    384,
    385
    ];
getKey(2002)->[
    386,
    387
    ];
getKey(2003)->[
    388,
    389
    ];
getKey(2800)->[
    390,
    391
    ];
getKey(2801)->[
    392,
    393
    ];
getKey(2802)->[
    394,
    395
    ];
getKey(2803)->[
    396,
    397
    ];
getKey(2804)->[
    398,
    399
    ];
getKey(2805)->[
    400,
    401
    ];
getKey(2806)->[
    402,
    403
    ];
getKey(2807)->[
    404,
    405
    ];
getKey(2808)->[
    406,
    407
    ];
getKey(3000)->[
    408,
    409
    ];
getKey(3001)->[
    410,
    411
    ];
getKey(3002)->[
    412,
    413
    ];
getKey(3003)->[
    414,
    415
    ];
getKey(3004)->[
    416,
    417
    ];
getKey(3005)->[
    418,
    419
    ];
getKey(3006)->[
    420,
    421
    ];
getKey(3007)->[
    422,
    423
    ];
getKey(3008)->[
    424,
    425
    ];
getKey(3500)->[
    426
    ];
getKey(3501)->[
    427
    ];
getKey(3502)->[
    428
    ];
getKey(4000)->[
    429,
    430,
    431
    ];
getKey(4001)->[
    432,
    433,
    434,
    435,
    436,
    437,
    438,
    439
    ];
getKey(4002)->[
    440,
    441
    ];
getKey(4003)->[
    442,
    443
    ];
getKey(5000)->[
    444
    ];
getKey(6001)->[
    445,
    446,
    447,
    448,
    449,
    450,
    451,
    452
    ];
getKey(6002)->[
    453,
    454,
    455,
    456,
    457,
    458,
    459,
    460
    ];
getKey(6003)->[
    461,
    462,
    463,
    464,
    465,
    466,
    467,
    468
    ];
getKey(6004)->[
    469,
    470,
    471,
    472,
    473,
    474,
    475,
    476
    ];
getKey(6005)->[
    477,
    478,
    479,
    480,
    481,
    482,
    483,
    484
    ];
getKey(6006)->[
    485,
    486,
    487,
    488,
    489,
    490,
    491,
    492
    ];
getKey(6007)->[
    493,
    494,
    495,
    496,
    497,
    498,
    499,
    500
    ];
getKey(6008)->[
    501,
    502,
    503,
    504,
    505,
    506,
    507,
    508
    ];
getKey(6009)->[
    509,
    510,
    511,
    512,
    513,
    514,
    515,
    516
    ];
getKey(6010)->[
    517,
    518,
    519,
    520,
    521,
    522,
    523,
    524
    ];
getKey(6011)->[
    525,
    526,
    527,
    528,
    529,
    530,
    531,
    532
    ];
getKey(6012)->[
    533,
    534,
    535,
    536,
    537,
    538,
    539,
    540
    ];
getKey(6013)->[
    541,
    542,
    543,
    544,
    545,
    546,
    547,
    548
    ];
getKey(6014)->[
    549,
    550,
    551,
    552,
    553,
    554,
    555,
    556
    ];
getKey(6015)->[
    557,
    558,
    559,
    560,
    561,
    562,
    563,
    564
    ];
getKey(6016)->[
    565,
    566,
    567,
    568,
    569,
    570,
    571,
    572
    ];
getKey(6017)->[
    573,
    574,
    575,
    576,
    577,
    578,
    579,
    580
    ];
getKey(6018)->[
    581,
    582,
    583,
    584,
    585,
    586,
    587,
    588
    ];
getKey(6019)->[
    589,
    590,
    591,
    592,
    593,
    594,
    595,
    596
    ];
getKey(6020)->[
    597,
    598,
    599,
    600,
    601,
    602,
    603,
    604
    ];
getKey(6021)->[
    605,
    606,
    607,
    608,
    609,
    610,
    611,
    612
    ];
getKey(6022)->[
    613,
    614,
    615,
    616,
    617,
    618,
    619,
    620
    ];
getKey(6023)->[
    621,
    622,
    623,
    624,
    625,
    626,
    627,
    628
    ];
getKey(6024)->[
    629,
    630,
    631,
    632,
    633,
    634,
    635,
    636
    ];
getKey(6025)->[
    637,
    638,
    639,
    640,
    641,
    642,
    643,
    644
    ];
getKey(6026)->[
    645,
    646,
    647,
    648,
    649,
    650,
    651,
    652
    ];
getKey(6027)->[
    653,
    654,
    655,
    656,
    657,
    658,
    659,
    660
    ];
getKey(6028)->[
    661,
    662,
    663,
    664,
    665,
    666,
    667,
    668
    ];
getKey(6029)->[
    669,
    670,
    671,
    672,
    673,
    674,
    675,
    676
    ];
getKey(6030)->[
    677,
    678,
    679,
    680,
    681,
    682,
    683,
    684
    ];
getKey(6031)->[
    685,
    686,
    687,
    688,
    689,
    690,
    691,
    692
    ];
getKey(6032)->[
    693,
    694,
    695,
    696,
    697,
    698,
    699,
    700
    ];
getKey(6033)->[
    701,
    702,
    703,
    704,
    705,
    706,
    707,
    708
    ];
getKey(6034)->[
    709,
    710,
    711,
    712,
    713,
    714,
    715,
    716
    ];
getKey(6035)->[
    717,
    718,
    719,
    720,
    721,
    722,
    723,
    724
    ];
getKey(6036)->[
    725,
    726,
    727,
    728,
    729,
    730,
    731,
    732
    ];
getKey(6037)->[
    733,
    734,
    735,
    736,
    737,
    738,
    739,
    740
    ];
getKey(6038)->[
    741,
    742,
    743,
    744,
    745,
    746,
    747,
    748
    ];
getKey(6039)->[
    749,
    750,
    751,
    752,
    753,
    754,
    755,
    756
    ];
getKey(6040)->[
    757,
    758,
    759,
    760,
    761,
    762,
    763,
    764
    ];
getKey(6041)->[
    765,
    766,
    767,
    768,
    769,
    770,
    771,
    772
    ];
getKey(6042)->[
    773,
    774,
    775,
    776,
    777,
    778,
    779,
    780
    ];
getKey(6043)->[
    781,
    782,
    783,
    784,
    785,
    786,
    787,
    788
    ];
getKey(6044)->[
    789,
    790,
    791,
    792,
    793,
    794,
    795,
    796
    ];
getKey(6045)->[
    797,
    798,
    799,
    800,
    801,
    802,
    803,
    804
    ];
getKey(6046)->[
    805,
    806,
    807,
    808,
    809,
    810,
    811,
    812
    ];
getKey(6047)->[
    813,
    814,
    815,
    816,
    817,
    818,
    819,
    820
    ];
getKey(6048)->[
    821,
    822,
    823,
    824,
    825,
    826,
    827,
    828
    ];
getKey(6049)->[
    829,
    830,
    831,
    832,
    833,
    834,
    835,
    836
    ];
getKey(6050)->[
    837,
    838,
    839,
    840,
    841,
    842,
    843,
    844
    ];
getKey(6051)->[
    845,
    846,
    847,
    848,
    849,
    850,
    851,
    852
    ];
getKey(6052)->[
    853,
    854,
    855,
    856,
    857,
    858,
    859,
    860
    ];
getKey(6053)->[
    861,
    862,
    863,
    864,
    865,
    866,
    867,
    868
    ];
getKey(6054)->[
    869,
    870,
    871,
    872,
    873,
    874,
    875,
    876
    ];
getKey(6055)->[
    877,
    878,
    879,
    880,
    881,
    882,
    883,
    884
    ];
getKey(6056)->[
    885,
    886,
    887,
    888,
    889,
    890,
    891,
    892
    ];
getKey(6057)->[
    893,
    894,
    895,
    896,
    897,
    898,
    899,
    900
    ];
getKey(6058)->[
    901,
    902,
    903,
    904,
    905,
    906,
    907,
    908
    ];
getKey(6059)->[
    909,
    910,
    911,
    912,
    913,
    914,
    915,
    916
    ];
getKey(6060)->[
    917,
    918,
    919,
    920,
    921,
    922,
    923,
    924
    ];
getKey(6061)->[
    925,
    926,
    927,
    928,
    929,
    930,
    931,
    932
    ];
getKey(6062)->[
    933,
    934,
    935,
    936,
    937,
    938,
    939,
    940
    ];
getKey(6063)->[
    941,
    942,
    943,
    944,
    945,
    946,
    947,
    948
    ];
getKey(6064)->[
    949,
    950,
    951,
    952,
    953,
    954,
    955,
    956
    ];
getKey(6065)->[
    957,
    958,
    959,
    960,
    961,
    962,
    963,
    964
    ];
getKey(6066)->[
    965,
    966,
    967,
    968,
    969,
    970,
    971,
    972
    ];
getKey(6067)->[
    973,
    974,
    975,
    976,
    977,
    978,
    979,
    980
    ];
getKey(6068)->[
    981,
    982,
    983,
    984,
    985,
    986,
    987,
    988
    ];
getKey(6069)->[
    989,
    990,
    991,
    992,
    993,
    994,
    995,
    996
    ];
getKey(6070)->[
    997,
    998,
    999,
    1000,
    1001,
    1002,
    1003,
    1004
    ];
getKey(6071)->[
    1005,
    1006,
    1007,
    1008,
    1009,
    1010,
    1011,
    1012
    ];
getKey(6072)->[
    1013,
    1014,
    1015,
    1016,
    1017,
    1018,
    1019,
    1020
    ];
getKey(6073)->[
    1021,
    1022,
    1023,
    1024,
    1025,
    1026,
    1027,
    1028
    ];
getKey(6074)->[
    1029,
    1030,
    1031,
    1032,
    1033,
    1034,
    1035,
    1036
    ];
getKey(6075)->[
    1037,
    1038,
    1039,
    1040,
    1041,
    1042,
    1043,
    1044
    ];
getKey(6076)->[
    1045,
    1046,
    1047,
    1048,
    1049,
    1050,
    1051,
    1052
    ];
getKey(6077)->[
    1053,
    1054,
    1055,
    1056,
    1057,
    1058,
    1059,
    1060
    ];
getKey(6078)->[
    1061,
    1062,
    1063,
    1064,
    1065,
    1066,
    1067,
    1068
    ];
getKey(6079)->[
    1069,
    1070,
    1071,
    1072,
    1073,
    1074,
    1075,
    1076
    ];
getKey(6080)->[
    1077,
    1078,
    1079,
    1080,
    1081,
    1082,
    1083,
    1084
    ];
getKey(6081)->[
    1085,
    1086,
    1087,
    1088,
    1089,
    1090,
    1091,
    1092
    ];
getKey(6082)->[
    1093,
    1094,
    1095,
    1096,
    1097,
    1098,
    1099,
    1100
    ];
getKey(6083)->[
    1101,
    1102,
    1103,
    1104,
    1105,
    1106,
    1107,
    1108
    ];
getKey(6084)->[
    1109,
    1110,
    1111,
    1112,
    1113,
    1114,
    1115,
    1116
    ];
getKey(6085)->[
    1117,
    1118,
    1119,
    1120,
    1121,
    1122,
    1123,
    1124
    ];
getKey(6086)->[
    1125,
    1126,
    1127,
    1128,
    1129,
    1130,
    1131,
    1132
    ];
getKey(6087)->[
    1133,
    1134,
    1135,
    1136,
    1137,
    1138,
    1139,
    1140
    ];
getKey(6088)->[
    1141,
    1142,
    1143,
    1144,
    1145,
    1146,
    1147,
    1148
    ];
getKey(6089)->[
    1149,
    1150,
    1151,
    1152,
    1153,
    1154,
    1155,
    1156
    ];
getKey(6090)->[
    1157,
    1158,
    1159,
    1160,
    1161,
    1162,
    1163,
    1164
    ];
getKey(6091)->[
    1165,
    1166,
    1167,
    1168,
    1169,
    1170,
    1171,
    1172
    ];
getKey(6092)->[
    1173,
    1174,
    1175,
    1176,
    1177,
    1178,
    1179,
    1180
    ];
getKey(6093)->[
    1181,
    1182,
    1183,
    1184,
    1185,
    1186,
    1187,
    1188
    ];
getKey(6094)->[
    1189,
    1190,
    1191,
    1192,
    1193,
    1194,
    1195,
    1196
    ];
getKey(6095)->[
    1197,
    1198,
    1199,
    1200,
    1201,
    1202,
    1203,
    1204
    ];
getKey(6096)->[
    1205,
    1206,
    1207,
    1208,
    1209,
    1210,
    1211,
    1212
    ];
getKey(6097)->[
    1213,
    1214,
    1215,
    1216,
    1217,
    1218,
    1219,
    1220
    ];
getKey(6098)->[
    1221,
    1222,
    1223,
    1224,
    1225,
    1226,
    1227,
    1228
    ];
getKey(6099)->[
    1229,
    1230,
    1231,
    1232,
    1233,
    1234,
    1235,
    1236
    ];
getKey(6100)->[
    1237,
    1238,
    1239,
    1240,
    1241,
    1242,
    1243,
    1244
    ];
getKey(6101)->[
    1245,
    1246,
    1247,
    1248,
    1249,
    1250,
    1251,
    1252
    ];
getKey(6102)->[
    1253,
    1254,
    1255,
    1256,
    1257,
    1258,
    1259,
    1260
    ];
getKey(6103)->[
    1261,
    1262,
    1263,
    1264,
    1265,
    1266,
    1267,
    1268
    ];
getKey(6104)->[
    1269,
    1270,
    1271,
    1272,
    1273,
    1274,
    1275,
    1276
    ];
getKey(6105)->[
    1277,
    1278,
    1279,
    1280,
    1281,
    1282,
    1283,
    1284
    ];
getKey(8000)->[
    1285
    ];
getKey(8001)->[
    1286
    ];
getKey(8002)->[
    1287
    ];
getKey(8003)->[
    1288
    ];
getKey(8004)->[
    1289
    ];
getKey(8005)->[
    1290
    ];
getKey(8006)->[
    1291
    ];
getKey(8007)->[
    1292
    ];
getKey(8008)->[
    1293
    ];
getKey(8009)->[
    1294
    ];
getKey(18001)->[
    1295
    ];
getKey(100000)->[
    1296
    ];
getKey(100001)->[
    1297
    ];
getKey(100002)->[
    1298
    ];
getKey(100003)->[
    1299
    ];
getKey(100004)->[
    1300
    ];
getKey(100005)->[
    1301
    ];
getKey(100006)->[
    1302
    ];
getKey(100010)->[
    1303
    ];
getKey(100011)->[
    1304
    ];
getKey(100012)->[
    1305
    ];
getKey(100013)->[
    1306
    ];
getKey(100014)->[
    1307
    ];
getKey(100015)->[
    1308
    ];
getKey(100016)->[
    1309
    ];
getKey(100020)->[
    1310
    ];
getKey(100021)->[
    1311
    ];
getKey(100022)->[
    1312
    ];
getKey(100023)->[
    1313
    ];
getKey(100024)->[
    1314
    ];
getKey(100025)->[
    1315
    ];
getKey(100026)->[
    1316
    ];
getKey(100030)->[
    1317
    ];
getKey(100031)->[
    1318
    ];
getKey(100032)->[
    1319
    ];
getKey(100033)->[
    1320
    ];
getKey(100034)->[
    1321
    ];
getKey(100035)->[
    1322
    ];
getKey(100036)->[
    1323
    ];
getKey(200000)->[
    1324,
    1325,
    1326,
    1327,
    1328
    ];
getKey(200001)->[
    1329,
    1330,
    1331,
    1332,
    1333
    ];
getKey(200002)->[
    1334,
    1335,
    1336,
    1337,
    1338
    ];
getKey(200003)->[
    1339,
    1340,
    1341,
    1342,
    1343
    ];
getKey(200004)->[
    1344,
    1345,
    1346,
    1347,
    1348
    ];
getKey(200005)->[
    1349,
    1350,
    1351,
    1352,
    1353
    ];
getKey(200006)->[
    1354,
    1355,
    1356,
    1357,
    1358
    ];
getKey(200007)->[
    1359,
    1360,
    1361,
    1362,
    1363
    ];
getKey(200008)->[
    1364,
    1365,
    1366,
    1367,
    1368
    ];
getKey(200009)->[
    1369,
    1370,
    1371,
    1372,
    1373
    ];
getKey(210000)->[
    1374,
    1375,
    1376
    ];
getKey(210001)->[
    1377,
    1378,
    1379
    ];
getKey(210002)->[
    1380,
    1381,
    1382
    ];
getKey(210003)->[
    1383,
    1384,
    1385
    ];
getKey(210004)->[
    1386,
    1387,
    1388
    ];
getKey(210005)->[
    1389,
    1390,
    1391
    ];
getKey(210006)->[
    1392,
    1393,
    1394
    ];
getKey(210007)->[
    1395,
    1396,
    1397
    ];
getKey(210008)->[
    1398,
    1399,
    1400
    ];
getKey(210009)->[
    1401,
    1402,
    1403
    ];
getKey(250000)->[
    1404,
    1405,
    1406
    ];
getKey(251000)->[
    1407,
    1408,
    1409
    ];
getKey(252000)->[
    1410,
    1411,
    1412
    ];
getKey(253000)->[
    1413,
    1414,
    1415
    ];
getKey(254000)->[
    1416,
    1417,
    1418
    ];
getKey(255000)->[
    1419,
    1420,
    1421
    ];
getKey(256000)->[
    1422,
    1423,
    1424
    ];
getKey(260000)->[
    1425,
    1426,
    1427
    ];
getKey(270000)->[
    1428
    ];
getKey(270001)->[
    1429
    ];
getKey(270002)->[
    1430
    ];
getKey(280000)->[
    1431,
    1432,
    1433
    ];
getKey(280001)->[
    1434,
    1435,
    1436
    ];
getKey(280002)->[
    1437,
    1438,
    1439
    ];
getKey(280003)->[
    1440,
    1441,
    1442
    ];
getKey(280004)->[
    1443,
    1444,
    1445
    ];
getKey(280005)->[
    1446,
    1447,
    1448
    ];
getKey(280006)->[
    1449,
    1450,
    1451
    ];
getKey(280007)->[
    1452,
    1453,
    1454
    ];
getKey(280008)->[
    1455,
    1456,
    1457
    ];
getKey(280009)->[
    1458,
    1459,
    1460
    ];
getKey(280010)->[
    1461,
    1462,
    1463
    ];
getKey(280011)->[
    1464,
    1465,
    1466
    ];
getKey(300000)->[
    1467
    ];
getKey(300001)->[
    1468
    ];
getKey(300002)->[
    1469
    ];
getKey(300003)->[
    1470
    ];
getKey(300004)->[
    1471
    ];
getKey(300005)->[
    1472
    ];
getKey(300006)->[
    1473
    ];
getKey(300007)->[
    1474
    ];
getKey(300008)->[
    1475
    ];
getKey(301000)->[
    1476,
    1477
    ];
getKey(301001)->[
    1478,
    1479
    ];
getKey(301002)->[
    1480
    ];
getKey(301003)->[
    1481,
    1482
    ];
getKey(301004)->[
    1483,
    1484
    ];
getKey(301005)->[
    1485
    ];
getKey(301006)->[
    1486,
    1487
    ];
getKey(301007)->[
    1488,
    1489
    ];
getKey(301008)->[
    1490,
    1491
    ];
getKey(301009)->[
    1492
    ];
getKey(302000)->[
    1493,
    1494
    ];
getKey(302001)->[
    1495,
    1496
    ];
getKey(302002)->[
    1497
    ];
getKey(302003)->[
    1498,
    1499
    ];
getKey(302004)->[
    1500,
    1501
    ];
getKey(302005)->[
    1502
    ];
getKey(302006)->[
    1503,
    1504
    ];
getKey(302007)->[
    1505,
    1506
    ];
getKey(302008)->[
    1507,
    1508
    ];
getKey(302009)->[
    1509
    ];
getKey(303000)->[
    1510
    ];
getKey(303001)->[
    1511
    ];
getKey(303002)->[
    1512
    ];
getKey(303003)->[
    1513
    ];
getKey(303004)->[
    1514
    ];
getKey(303005)->[
    1515
    ];
getKey(303006)->[
    1516
    ];
getKey(303007)->[
    1517
    ];
getKey(303008)->[
    1518
    ];
getKey(303009)->[
    1519
    ];
getKey(303010)->[
    1520
    ];
getKey(303011)->[
    1521
    ];
getKey(303012)->[
    1522
    ];
getKey(303013)->[
    1523
    ];
getKey(303014)->[
    1524
    ];
getKey(303015)->[
    1525
    ];
getKey(303016)->[
    1526
    ];
getKey(310003)->[
    1527,
    1528
    ];
getKey(310004)->[
    1529,
    1530
    ];
getKey(310005)->[
    1531,
    1532
    ];
getKey(310006)->[
    1533,
    1534
    ];
getKey(310007)->[
    1535,
    1536
    ];
getKey(310200)->[
    1537,
    1538
    ];
getKey(310201)->[
    1539,
    1540
    ];
getKey(310202)->[
    1541,
    1542
    ];
getKey(310203)->[
    1543,
    1544
    ];
getKey(310204)->[
    1545,
    1546
    ];
getKey(310205)->[
    1547,
    1548
    ];
getKey(310206)->[
    1549,
    1550
    ];
getKey(310207)->[
    1551,
    1552
    ];
getKey(310208)->[
    1553,
    1554
    ];
getKey(310209)->[
    1555,
    1556
    ];
getKey(310210)->[
    1557,
    1558
    ];
getKey(310300)->[
    1559,
    1560
    ];
getKey(310301)->[
    1561,
    1562
    ];
getKey(310302)->[
    1563,
    1564
    ];
getKey(310303)->[
    1565,
    1566
    ];
getKey(310304)->[
    1567,
    1568
    ];
getKey(310305)->[
    1569,
    1570
    ];
getKey(310306)->[
    1571,
    1572
    ];
getKey(310307)->[
    1573,
    1574
    ];
getKey(310308)->[
    1575,
    1576
    ];
getKey(310309)->[
    1577,
    1578
    ];
getKey(310310)->[
    1579,
    1580
    ];
getKey(310311)->[
    1581,
    1582
    ];
getKey(310312)->[
    1583,
    1584
    ];
getKey(310313)->[
    1585,
    1586
    ];
getKey(310314)->[
    1587,
    1588
    ];
getKey(310315)->[
    1589,
    1590
    ];
getKey(310316)->[
    1591,
    1592
    ];
getKey(310317)->[
    1593,
    1594
    ];
getKey(310318)->[
    1595,
    1596
    ];
getKey(310319)->[
    1597,
    1598
    ];
getKey(310320)->[
    1599,
    1600
    ];
getKey(310321)->[
    1601,
    1602
    ];
getKey(310322)->[
    1603,
    1604
    ];
getKey(310323)->[
    1605,
    1606
    ];
getKey(310324)->[
    1607,
    1608
    ];
getKey(310325)->[
    1609,
    1610
    ];
getKey(310326)->[
    1611,
    1612
    ];
getKey(310327)->[
    1613,
    1614
    ];
getKey(310328)->[
    1615,
    1616
    ];
getKey(310329)->[
    1617,
    1618
    ];
getKey(310330)->[
    1619,
    1620
    ];
getKey(310331)->[
    1621,
    1622
    ];
getKey(310332)->[
    1623,
    1624
    ];
getKey(310333)->[
    1625,
    1626
    ];
getKey(310334)->[
    1627,
    1628
    ];
getKey(310335)->[
    1629,
    1630
    ];
getKey(310336)->[
    1631,
    1632
    ];
getKey(310337)->[
    1633,
    1634
    ];
getKey(310338)->[
    1635,
    1636
    ];
getKey(310339)->[
    1637,
    1638
    ];
getKey(310340)->[
    1639,
    1640
    ];
getKey(310341)->[
    1641,
    1642
    ];
getKey(310342)->[
    1643,
    1644
    ];
getKey(310343)->[
    1645,
    1646
    ];
getKey(310344)->[
    1647,
    1648
    ];
getKey(310345)->[
    1649,
    1650
    ];
getKey(310346)->[
    1651,
    1652
    ];
getKey(310347)->[
    1653,
    1654
    ];
getKey(310348)->[
    1655,
    1656
    ];
getKey(310349)->[
    1657,
    1658
    ];
getKey(310350)->[
    1659,
    1660
    ];
getKey(310351)->[
    1661,
    1662
    ];
getKey(310352)->[
    1663,
    1664
    ];
getKey(310353)->[
    1665,
    1666
    ];
getKey(310354)->[
    1667,
    1668
    ];
getKey(310355)->[
    1669,
    1670
    ];
getKey(310356)->[
    1671,
    1672
    ];
getKey(310357)->[
    1673,
    1674
    ];
getKey(310358)->[
    1675,
    1676
    ];
getKey(310359)->[
    1677,
    1678
    ];
getKey(310360)->[
    1679,
    1680
    ];
getKey(310361)->[
    1681,
    1682
    ];
getKey(310362)->[
    1683,
    1684
    ];
getKey(310363)->[
    1685,
    1686
    ];
getKey(310364)->[
    1687,
    1688
    ];
getKey(310365)->[
    1689,
    1690
    ];
getKey(310366)->[
    1691,
    1692
    ];
getKey(310367)->[
    1693,
    1694
    ];
getKey(310368)->[
    1695,
    1696
    ];
getKey(310369)->[
    1697,
    1698
    ];
getKey(310370)->[
    1699,
    1700
    ];
getKey(310371)->[
    1701,
    1702
    ];
getKey(310372)->[
    1703,
    1704
    ];
getKey(310373)->[
    1705,
    1706
    ];
getKey(310374)->[
    1707,
    1708
    ];
getKey(310375)->[
    1709,
    1710
    ];
getKey(310376)->[
    1711,
    1712
    ];
getKey(310377)->[
    1713,
    1714
    ];
getKey(310378)->[
    1715,
    1716
    ];
getKey(310379)->[
    1717,
    1718
    ];
getKey(310380)->[
    1719,
    1720
    ];
getKey(310381)->[
    1721,
    1722
    ];
getKey(310382)->[
    1723,
    1724
    ];
getKey(310383)->[
    1725,
    1726
    ];
getKey(310384)->[
    1727,
    1728
    ];
getKey(310385)->[
    1729,
    1730
    ];
getKey(310386)->[
    1731,
    1732
    ];
getKey(310387)->[
    1733,
    1734
    ];
getKey(310388)->[
    1735,
    1736
    ];
getKey(310389)->[
    1737,
    1738
    ];
getKey(310390)->[
    1739,
    1740
    ];
getKey(310391)->[
    1741,
    1742
    ];
getKey(310392)->[
    1743,
    1744
    ];
getKey(310393)->[
    1745,
    1746
    ];
getKey(310394)->[
    1747,
    1748
    ];
getKey(310395)->[
    1749,
    1750
    ];
getKey(310396)->[
    1751,
    1752
    ];
getKey(310397)->[
    1753,
    1754
    ];
getKey(310398)->[
    1755,
    1756
    ];
getKey(310399)->[
    1757,
    1758
    ];
getKey(310400)->[
    1759,
    1760
    ];
getKey(310401)->[
    1761,
    1762
    ];
getKey(310402)->[
    1763,
    1764
    ];
getKey(310403)->[
    1765,
    1766
    ];
getKey(310404)->[
    1767,
    1768
    ];
getKey(310405)->[
    1769,
    1770
    ];
getKey(310406)->[
    1771,
    1772
    ];
getKey(310407)->[
    1773,
    1774
    ];
getKey(310408)->[
    1775,
    1776
    ];
getKey(310409)->[
    1777,
    1778
    ];
getKey(310410)->[
    1779,
    1780
    ];
getKey(310411)->[
    1781,
    1782
    ];
getKey(310412)->[
    1783,
    1784
    ];
getKey(310413)->[
    1785,
    1786
    ];
getKey(310414)->[
    1787,
    1788
    ];
getKey(310415)->[
    1789,
    1790
    ];
getKey(310416)->[
    1791,
    1792
    ];
getKey(310417)->[
    1793,
    1794
    ];
getKey(310418)->[
    1795,
    1796
    ];
getKey(310419)->[
    1797,
    1798
    ];
getKey(310420)->[
    1799,
    1800
    ];
getKey(310421)->[
    1801,
    1802
    ];
getKey(310422)->[
    1803,
    1804
    ];
getKey(310423)->[
    1805,
    1806
    ];
getKey(310424)->[
    1807,
    1808
    ];
getKey(310425)->[
    1809,
    1810
    ];
getKey(310426)->[
    1811,
    1812
    ];
getKey(310427)->[
    1813,
    1814
    ];
getKey(310428)->[
    1815,
    1816
    ];
getKey(310429)->[
    1817,
    1818
    ];
getKey(310430)->[
    1819,
    1820
    ];
getKey(310431)->[
    1821,
    1822
    ];
getKey(310432)->[
    1823,
    1824
    ];
getKey(310433)->[
    1825,
    1826
    ];
getKey(310434)->[
    1827,
    1828
    ];
getKey(310435)->[
    1829,
    1830
    ];
getKey(310436)->[
    1831,
    1832
    ];
getKey(310437)->[
    1833,
    1834
    ];
getKey(310438)->[
    1835,
    1836
    ];
getKey(310439)->[
    1837,
    1838
    ];
getKey(310440)->[
    1839,
    1840
    ];
getKey(310441)->[
    1841,
    1842
    ];
getKey(310442)->[
    1843,
    1844
    ];
getKey(310443)->[
    1845,
    1846
    ];
getKey(310444)->[
    1847,
    1848
    ];
getKey(310445)->[
    1849,
    1850
    ];
getKey(310446)->[
    1851,
    1852
    ];
getKey(310447)->[
    1853,
    1854
    ];
getKey(310448)->[
    1855,
    1856
    ];
getKey(310449)->[
    1857,
    1858
    ];
getKey(310450)->[
    1859,
    1860
    ];
getKey(310451)->[
    1861,
    1862
    ];
getKey(310452)->[
    1863,
    1864
    ];
getKey(310453)->[
    1865,
    1866
    ];
getKey(310454)->[
    1867,
    1868
    ];
getKey(310455)->[
    1869,
    1870
    ];
getKey(310456)->[
    1871,
    1872
    ];
getKey(310457)->[
    1873,
    1874
    ];
getKey(310458)->[
    1875,
    1876
    ];
getKey(310459)->[
    1877,
    1878
    ];
getKey(310460)->[
    1879,
    1880
    ];
getKey(310461)->[
    1881,
    1882
    ];
getKey(310462)->[
    1883,
    1884
    ];
getKey(310463)->[
    1885,
    1886
    ];
getKey(310464)->[
    1887,
    1888
    ];
getKey(310465)->[
    1889,
    1890
    ];
getKey(310466)->[
    1891,
    1892
    ];
getKey(310467)->[
    1893,
    1894
    ];
getKey(310468)->[
    1895,
    1896
    ];
getKey(310469)->[
    1897,
    1898
    ];
getKey(310470)->[
    1899,
    1900
    ];
getKey(310471)->[
    1901,
    1902
    ];
getKey(310472)->[
    1903,
    1904
    ];
getKey(310473)->[
    1905,
    1906
    ];
getKey(310474)->[
    1907,
    1908
    ];
getKey(310475)->[
    1909,
    1910
    ];
getKey(310476)->[
    1911,
    1912
    ];
getKey(310477)->[
    1913,
    1914
    ];
getKey(310478)->[
    1915,
    1916
    ];
getKey(310479)->[
    1917,
    1918
    ];
getKey(310480)->[
    1919,
    1920
    ];
getKey(310481)->[
    1921,
    1922
    ];
getKey(310482)->[
    1923,
    1924
    ];
getKey(310483)->[
    1925,
    1926
    ];
getKey(310484)->[
    1927,
    1928
    ];
getKey(310485)->[
    1929,
    1930
    ];
getKey(310486)->[
    1931,
    1932
    ];
getKey(310487)->[
    1933,
    1934
    ];
getKey(310488)->[
    1935,
    1936
    ];
getKey(310489)->[
    1937,
    1938
    ];
getKey(310490)->[
    1939,
    1940
    ];
getKey(310491)->[
    1941,
    1942
    ];
getKey(310492)->[
    1943,
    1944
    ];
getKey(310493)->[
    1945,
    1946
    ];
getKey(310494)->[
    1947,
    1948
    ];
getKey(310495)->[
    1949,
    1950
    ];
getKey(310496)->[
    1951,
    1952
    ];
getKey(310497)->[
    1953,
    1954
    ];
getKey(310498)->[
    1955,
    1956
    ];
getKey(310499)->[
    1957,
    1958
    ];
getKey(314000)->[
    1959,
    1960
    ];
getKey(314001)->[
    1961,
    1962
    ];
getKey(314002)->[
    1963,
    1964
    ];
getKey(314003)->[
    1965,
    1966
    ];
getKey(314004)->[
    1967,
    1968
    ];
getKey(314005)->[
    1969,
    1970
    ];
getKey(314006)->[
    1971,
    1972
    ];
getKey(314007)->[
    1973,
    1974
    ];
getKey(314008)->[
    1975,
    1976
    ];
getKey(314009)->[
    1977,
    1978
    ];
getKey(314010)->[
    1979,
    1980
    ];
getKey(314011)->[
    1981,
    1982
    ];
getKey(314012)->[
    1983,
    1984
    ];
getKey(314013)->[
    1985,
    1986
    ];
getKey(314014)->[
    1987,
    1988
    ];
getKey(314015)->[
    1989,
    1990
    ];
getKey(314016)->[
    1991,
    1992
    ];
getKey(314017)->[
    1993,
    1994
    ];
getKey(314018)->[
    1995,
    1996
    ];
getKey(314019)->[
    1997,
    1998
    ];
getKey(314020)->[
    1999,
    2000
    ];
getKey(314021)->[
    2001,
    2002
    ];
getKey(314022)->[
    2003,
    2004
    ];
getKey(314023)->[
    2005,
    2006
    ];
getKey(314024)->[
    2007,
    2008
    ];
getKey(314025)->[
    2009,
    2010
    ];
getKey(314026)->[
    2011,
    2012
    ];
getKey(314027)->[
    2013,
    2014
    ];
getKey(314028)->[
    2015,
    2016
    ];
getKey(314029)->[
    2017,
    2018
    ];
getKey(314030)->[
    2019,
    2020
    ];
getKey(314031)->[
    2021,
    2022
    ];
getKey(314032)->[
    2023,
    2024
    ];
getKey(314033)->[
    2025,
    2026
    ];
getKey(314034)->[
    2027,
    2028
    ];
getKey(314035)->[
    2029,
    2030
    ];
getKey(314036)->[
    2031,
    2032
    ];
getKey(314037)->[
    2033,
    2034
    ];
getKey(314038)->[
    2035,
    2036
    ];
getKey(314039)->[
    2037,
    2038
    ];
getKey(314040)->[
    2039,
    2040
    ];
getKey(314041)->[
    2041,
    2042
    ];
getKey(314042)->[
    2043,
    2044
    ];
getKey(314043)->[
    2045,
    2046
    ];
getKey(314044)->[
    2047,
    2048
    ];
getKey(314045)->[
    2049,
    2050
    ];
getKey(314046)->[
    2051,
    2052
    ];
getKey(314047)->[
    2053,
    2054
    ];
getKey(314048)->[
    2055,
    2056
    ];
getKey(314049)->[
    2057,
    2058
    ];
getKey(314050)->[
    2059,
    2060
    ];
getKey(314051)->[
    2061,
    2062
    ];
getKey(314052)->[
    2063,
    2064
    ];
getKey(314053)->[
    2065,
    2066
    ];
getKey(314054)->[
    2067,
    2068
    ];
getKey(314055)->[
    2069,
    2070
    ];
getKey(314056)->[
    2071,
    2072
    ];
getKey(314057)->[
    2073,
    2074
    ];
getKey(314058)->[
    2075,
    2076
    ];
getKey(314059)->[
    2077,
    2078
    ];
getKey(314060)->[
    2079,
    2080
    ];
getKey(314061)->[
    2081,
    2082
    ];
getKey(314062)->[
    2083,
    2084
    ];
getKey(314063)->[
    2085,
    2086
    ];
getKey(314064)->[
    2087,
    2088
    ];
getKey(314065)->[
    2089,
    2090
    ];
getKey(314066)->[
    2091,
    2092
    ];
getKey(314067)->[
    2093,
    2094
    ];
getKey(314068)->[
    2095,
    2096
    ];
getKey(314069)->[
    2097,
    2098
    ];
getKey(314070)->[
    2099,
    2100
    ];
getKey(314071)->[
    2101,
    2102
    ];
getKey(314072)->[
    2103,
    2104
    ];
getKey(314073)->[
    2105,
    2106
    ];
getKey(314074)->[
    2107,
    2108
    ];
getKey(314075)->[
    2109,
    2110
    ];
getKey(314076)->[
    2111,
    2112
    ];
getKey(314077)->[
    2113,
    2114
    ];
getKey(314078)->[
    2115,
    2116
    ];
getKey(314079)->[
    2117,
    2118
    ];
getKey(314080)->[
    2119,
    2120
    ];
getKey(314081)->[
    2121,
    2122
    ];
getKey(314082)->[
    2123,
    2124
    ];
getKey(314083)->[
    2125,
    2126
    ];
getKey(314084)->[
    2127,
    2128
    ];
getKey(314085)->[
    2129,
    2130
    ];
getKey(314086)->[
    2131,
    2132
    ];
getKey(314087)->[
    2133,
    2134
    ];
getKey(314088)->[
    2135,
    2136
    ];
getKey(314089)->[
    2137,
    2138
    ];
getKey(314090)->[
    2139,
    2140
    ];
getKey(314091)->[
    2141,
    2142
    ];
getKey(314092)->[
    2143,
    2144
    ];
getKey(314093)->[
    2145,
    2146
    ];
getKey(314094)->[
    2147,
    2148
    ];
getKey(314095)->[
    2149,
    2150
    ];
getKey(314096)->[
    2151,
    2152
    ];
getKey(314097)->[
    2153,
    2154
    ];
getKey(314098)->[
    2155,
    2156
    ];
getKey(314099)->[
    2157,
    2158
    ];
getKey(314100)->[
    2159,
    2160
    ];
getKey(314101)->[
    2161,
    2162
    ];
getKey(314102)->[
    2163,
    2164
    ];
getKey(314103)->[
    2165,
    2166
    ];
getKey(314104)->[
    2167,
    2168
    ];
getKey(314105)->[
    2169,
    2170
    ];
getKey(314106)->[
    2171,
    2172
    ];
getKey(314107)->[
    2173,
    2174
    ];
getKey(314108)->[
    2175,
    2176
    ];
getKey(314109)->[
    2177,
    2178
    ];
getKey(314110)->[
    2179,
    2180
    ];
getKey(314111)->[
    2181,
    2182
    ];
getKey(314112)->[
    2183,
    2184
    ];
getKey(314113)->[
    2185,
    2186
    ];
getKey(314114)->[
    2187,
    2188
    ];
getKey(314115)->[
    2189,
    2190
    ];
getKey(314116)->[
    2191,
    2192
    ];
getKey(314117)->[
    2193,
    2194
    ];
getKey(314118)->[
    2195,
    2196
    ];
getKey(314119)->[
    2197,
    2198
    ];
getKey(314120)->[
    2199,
    2200
    ];
getKey(314121)->[
    2201,
    2202
    ];
getKey(314122)->[
    2203,
    2204
    ];
getKey(314123)->[
    2205,
    2206
    ];
getKey(314124)->[
    2207,
    2208
    ];
getKey(314125)->[
    2209,
    2210
    ];
getKey(314126)->[
    2211,
    2212
    ];
getKey(314127)->[
    2213,
    2214
    ];
getKey(314128)->[
    2215,
    2216
    ];
getKey(314129)->[
    2217,
    2218
    ];
getKey(314130)->[
    2219,
    2220
    ];
getKey(314131)->[
    2221,
    2222
    ];
getKey(314132)->[
    2223,
    2224
    ];
getKey(314133)->[
    2225,
    2226
    ];
getKey(314134)->[
    2227,
    2228
    ];
getKey(314135)->[
    2229,
    2230
    ];
getKey(314136)->[
    2231,
    2232
    ];
getKey(314137)->[
    2233,
    2234
    ];
getKey(314138)->[
    2235,
    2236
    ];
getKey(314139)->[
    2237,
    2238
    ];
getKey(314140)->[
    2239,
    2240
    ];
getKey(314141)->[
    2241,
    2242
    ];
getKey(314142)->[
    2243,
    2244
    ];
getKey(314143)->[
    2245,
    2246
    ];
getKey(314144)->[
    2247,
    2248
    ];
getKey(314145)->[
    2249,
    2250
    ];
getKey(314146)->[
    2251,
    2252
    ];
getKey(314147)->[
    2253,
    2254
    ];
getKey(314148)->[
    2255,
    2256
    ];
getKey(314149)->[
    2257,
    2258
    ];
getKey(314150)->[
    2259,
    2260
    ];
getKey(314151)->[
    2261,
    2262
    ];
getKey(314152)->[
    2263,
    2264
    ];
getKey(314153)->[
    2265,
    2266
    ];
getKey(314154)->[
    2267,
    2268
    ];
getKey(314155)->[
    2269,
    2270
    ];
getKey(314156)->[
    2271,
    2272
    ];
getKey(314157)->[
    2273,
    2274
    ];
getKey(314158)->[
    2275,
    2276
    ];
getKey(314159)->[
    2277,
    2278
    ];
getKey(314160)->[
    2279,
    2280
    ];
getKey(314161)->[
    2281,
    2282
    ];
getKey(314162)->[
    2283,
    2284
    ];
getKey(314163)->[
    2285,
    2286
    ];
getKey(314164)->[
    2287,
    2288
    ];
getKey(314165)->[
    2289,
    2290
    ];
getKey(314166)->[
    2291,
    2292
    ];
getKey(314167)->[
    2293,
    2294
    ];
getKey(314168)->[
    2295,
    2296
    ];
getKey(314169)->[
    2297,
    2298
    ];
getKey(314170)->[
    2299,
    2300
    ];
getKey(314171)->[
    2301,
    2302
    ];
getKey(314172)->[
    2303,
    2304
    ];
getKey(314173)->[
    2305,
    2306
    ];
getKey(314174)->[
    2307,
    2308
    ];
getKey(314175)->[
    2309,
    2310
    ];
getKey(314176)->[
    2311,
    2312
    ];
getKey(314177)->[
    2313,
    2314
    ];
getKey(314178)->[
    2315,
    2316
    ];
getKey(314179)->[
    2317,
    2318
    ];
getKey(314180)->[
    2319,
    2320
    ];
getKey(314181)->[
    2321,
    2322
    ];
getKey(314182)->[
    2323,
    2324
    ];
getKey(314183)->[
    2325,
    2326
    ];
getKey(314184)->[
    2327,
    2328
    ];
getKey(314185)->[
    2329,
    2330
    ];
getKey(314186)->[
    2331,
    2332
    ];
getKey(314187)->[
    2333,
    2334
    ];
getKey(314188)->[
    2335,
    2336
    ];
getKey(314189)->[
    2337,
    2338
    ];
getKey(314190)->[
    2339,
    2340
    ];
getKey(314191)->[
    2341,
    2342
    ];
getKey(314192)->[
    2343,
    2344
    ];
getKey(314193)->[
    2345,
    2346
    ];
getKey(314194)->[
    2347,
    2348
    ];
getKey(314195)->[
    2349,
    2350
    ];
getKey(314196)->[
    2351,
    2352
    ];
getKey(314197)->[
    2353,
    2354
    ];
getKey(314198)->[
    2355,
    2356
    ];
getKey(314199)->[
    2357,
    2358
    ];
getKey(314200)->[
    2359,
    2360
    ];
getKey(314201)->[
    2361,
    2362
    ];
getKey(314202)->[
    2363,
    2364
    ];
getKey(314203)->[
    2365,
    2366
    ];
getKey(314204)->[
    2367,
    2368
    ];
getKey(314205)->[
    2369,
    2370
    ];
getKey(314206)->[
    2371,
    2372
    ];
getKey(314207)->[
    2373,
    2374
    ];
getKey(314208)->[
    2375,
    2376
    ];
getKey(314209)->[
    2377,
    2378
    ];
getKey(314210)->[
    2379,
    2380
    ];
getKey(314211)->[
    2381,
    2382
    ];
getKey(314212)->[
    2383,
    2384
    ];
getKey(314213)->[
    2385,
    2386
    ];
getKey(314214)->[
    2387,
    2388
    ];
getKey(314215)->[
    2389,
    2390
    ];
getKey(314216)->[
    2391,
    2392
    ];
getKey(314217)->[
    2393,
    2394
    ];
getKey(314218)->[
    2395,
    2396
    ];
getKey(314219)->[
    2397,
    2398
    ];
getKey(314220)->[
    2399,
    2400
    ];
getKey(314221)->[
    2401,
    2402
    ];
getKey(314222)->[
    2403,
    2404
    ];
getKey(314223)->[
    2405,
    2406
    ];
getKey(315000)->[
    2407,
    2408,
    2409,
    2410,
    2411
    ];
getKey(315001)->[
    2412,
    2413,
    2414,
    2415,
    2416
    ];
getKey(315002)->[
    2417,
    2418,
    2419,
    2420,
    2421
    ];
getKey(315003)->[
    2422,
    2423,
    2424,
    2425,
    2426
    ];
getKey(315004)->[
    2427,
    2428,
    2429,
    2430,
    2431
    ];
getKey(315005)->[
    2432,
    2433,
    2434,
    2435,
    2436
    ];
getKey(315006)->[
    2437,
    2438,
    2439,
    2440,
    2441
    ];
getKey(315007)->[
    2442,
    2443,
    2444,
    2445,
    2446
    ];
getKey(315008)->[
    2447,
    2448,
    2449,
    2450,
    2451
    ];
getKey(315009)->[
    2452,
    2453,
    2454,
    2455,
    2456
    ];
getKey(315010)->[
    2457,
    2458,
    2459,
    2460,
    2461
    ];
getKey(315011)->[
    2462,
    2463,
    2464,
    2465,
    2466
    ];
getKey(315012)->[
    2467,
    2468,
    2469,
    2470,
    2471
    ];
getKey(315013)->[
    2472,
    2473,
    2474,
    2475,
    2476
    ];
getKey(315014)->[
    2477,
    2478,
    2479,
    2480,
    2481
    ];
getKey(316000)->[
    2482
    ];
getKey(316001)->[
    2483
    ];
getKey(316002)->[
    2484
    ];
getKey(316003)->[
    2485
    ];
getKey(316004)->[
    2486
    ];
getKey(316005)->[
    2487
    ];
getKey(316006)->[
    2488
    ];
getKey(316007)->[
    2489
    ];
getKey(316500)->[
    2490
    ];
getKey(316501)->[
    2491
    ];
getKey(316502)->[
    2492
    ];
getKey(316503)->[
    2493
    ];
getKey(317000)->[
    2494,
    2495
    ];
getKey(317001)->[
    2496,
    2497
    ];
getKey(317002)->[
    2498,
    2499
    ];
getKey(317003)->[
    2500,
    2501
    ];
getKey(318000)->[
    2502,
    2503
    ];
getKey(318001)->[
    2504,
    2505
    ];
getKey(318002)->[
    2506
    ];
getKey(318003)->[
    2507
    ];
getKey(318004)->[
    2508
    ];
getKey(319000)->[
    2509
    ];
getKey(319001)->[
    2510
    ];
getKey(319002)->[
    2511
    ];
getKey(319003)->[
    2512
    ];
getKey(320000)->[
    2513,
    2514,
    2515
    ];
getKey(320001)->[
    2516
    ];
getKey(320002)->[
    2517
    ];
getKey(320003)->[
    2518
    ];
getKey(320004)->[
    2519,
    2520
    ];
getKey(320005)->[
    2521
    ];
getKey(320006)->[
    2522
    ];
getKey(330000)->[
    2523,
    2524,
    2525
    ];
getKey(340000)->[
    2526
    ];
getKey(340001)->[
    2527
    ];
getKey(340002)->[
    2528,
    2529
    ];
getKey(340003)->[
    2530,
    2531
    ];
getKey(350000)->[
    2532
    ];
getKey(350001)->[
    2533
    ];
getKey(350002)->[
    2534
    ];
getKey(350003)->[
    2535
    ];
getKey(350004)->[
    2536
    ];
getKey(350005)->[
    2537
    ];
getKey(350006)->[
    2538
    ];
getKey(350007)->[
    2539
    ];
getKey(350008)->[
    2540
    ];
getKey(360000)->[
    2541,
    2542,
    2543
    ];
getKey(360001)->[
    2544,
    2545,
    2546
    ];
getKey(360002)->[
    2547,
    2548,
    2549
    ];
getKey(360003)->[
    2550,
    2551,
    2552
    ];
getKey(360004)->[
    2553,
    2554,
    2555
    ];
getKey(360005)->[
    2556,
    2557,
    2558
    ];
getKey(360006)->[
    2559,
    2560,
    2561
    ];
getKey(360007)->[
    2562,
    2563,
    2564
    ];
getKey(360008)->[
    2565,
    2566,
    2567
    ];
getKey(360009)->[
    2568,
    2569,
    2570
    ];
getKey(360010)->[
    2571,
    2572,
    2573
    ];
getKey(360011)->[
    2574,
    2575,
    2576
    ];
getKey(360012)->[
    2577,
    2578,
    2579
    ];
getKey(360013)->[
    2580,
    2581,
    2582
    ];
getKey(360014)->[
    2583,
    2584,
    2585
    ];
getKey(360015)->[
    2586,
    2587,
    2588
    ];
getKey(360016)->[
    2589,
    2590,
    2591
    ];
getKey(360017)->[
    2592,
    2593,
    2594
    ];
getKey(369000)->[
    2595,
    2596,
    2597,
    2598
    ];
getKey(369001)->[
    2599,
    2600,
    2601,
    2602
    ];
getKey(369002)->[
    2603,
    2604,
    2605,
    2606
    ];
getKey(369003)->[
    2607,
    2608,
    2609,
    2610
    ];
getKey(370001)->[
    2611,
    2612
    ];
getKey(370002)->[
    2613,
    2614
    ];
getKey(370003)->[
    2615,
    2616
    ];
getKey(370004)->[
    2617,
    2618
    ];
getKey(370011)->[
    2619,
    2620
    ];
getKey(370012)->[
    2621,
    2622
    ];
getKey(370013)->[
    2623,
    2624
    ];
getKey(370014)->[
    2625,
    2626
    ];
getKey(371001)->[
    2627,
    2628
    ];
getKey(371002)->[
    2629,
    2630
    ];
getKey(371003)->[
    2631,
    2632
    ];
getKey(371004)->[
    2633,
    2634
    ];
getKey(371011)->[
    2635,
    2636
    ];
getKey(371012)->[
    2637,
    2638
    ];
getKey(371013)->[
    2639,
    2640
    ];
getKey(371014)->[
    2641,
    2642
    ];
getKey(372001)->[
    2643,
    2644
    ];
getKey(372002)->[
    2645,
    2646
    ];
getKey(372003)->[
    2647,
    2648
    ];
getKey(372004)->[
    2649,
    2650
    ];
getKey(372011)->[
    2651,
    2652
    ];
getKey(372012)->[
    2653,
    2654
    ];
getKey(372013)->[
    2655,
    2656
    ];
getKey(372014)->[
    2657,
    2658
    ];
getKey(380001)->[
    2659
    ];
getKey(380002)->[
    2660
    ];
getKey(380003)->[
    2661,
    2662
    ];
getKey(380004)->[
    2663,
    2664
    ];
getKey(380005)->[
    2665
    ];
getKey(390001)->[
    2666,
    2667
    ];
getKey(390002)->[
    2668,
    2669
    ];
getKey(390003)->[
    2670,
    2671
    ];
getKey(390004)->[
    2672
    ];
getKey(400000)->[
    2673,
    2674
    ];
getKey(400001)->[
    2675,
    2676
    ];
getKey(400002)->[
    2677,
    2678
    ];
getKey(400003)->[
    2679,
    2680
    ];
getKey(400004)->[
    2681,
    2682
    ];
getKey(400005)->[
    2683,
    2684
    ];
getKey(410000)->[
    2685,
    2686
    ];
getKey(410001)->[
    2687,
    2688
    ];
getKey(420001)->[
    2689,
    2690,
    2691,
    2692,
    2693,
    2694
    ];
getKey(420002)->[
    2695,
    2696,
    2697,
    2698,
    2699,
    2700
    ];
getKey(420003)->[
    2701,
    2702,
    2703,
    2704,
    2705,
    2706
    ];
getKey(420004)->[
    2707,
    2708,
    2709,
    2710,
    2711,
    2712
    ];
getKey(420005)->[
    2713,
    2714,
    2715,
    2716,
    2717,
    2718
    ];
getKey(420006)->[
    2719,
    2720,
    2721,
    2722,
    2723,
    2724
    ];
getKey(420007)->[
    2725,
    2726,
    2727,
    2728,
    2729,
    2730
    ];
getKey(420008)->[
    2731,
    2732,
    2733,
    2734,
    2735,
    2736
    ];
getKey(420009)->[
    2737,
    2738,
    2739,
    2740,
    2741,
    2742
    ];
getKey(420010)->[
    2743,
    2744,
    2745,
    2746,
    2747,
    2748
    ];
getKey(420011)->[
    2749,
    2750,
    2751,
    2752,
    2753,
    2754
    ];
getKey(420020)->[
    2755,
    2756
    ];
getKey(420021)->[
    2757,
    2758
    ];
getKey(420022)->[
    2759,
    2760
    ];
getKey(420023)->[
    2761,
    2762
    ];
getKey(420024)->[
    2763,
    2764
    ];
getKey(420025)->[
    2765,
    2766
    ];
getKey(420026)->[
    2767,
    2768
    ];
getKey(420027)->[
    2769,
    2770
    ];
getKey(420028)->[
    2771,
    2772
    ];
getKey(420029)->[
    2773,
    2774
    ];
getKey(420030)->[
    2775,
    2776
    ];
getKey(420031)->[
    2777,
    2778
    ];
getKey(420032)->[
    2779,
    2780
    ];
getKey(420033)->[
    2781,
    2782
    ];
getKey(420034)->[
    2783,
    2784
    ];
getKey(420035)->[
    2785,
    2786
    ];
getKey(420036)->[
    2787,
    2788
    ];
getKey(500000)->[
    2789,
    2790,
    2791
    ];
getKey(500001)->[
    2792,
    2793
    ];
getKey(500002)->[
    2794,
    2795
    ];
getKey(500003)->[
    2796,
    2797
    ];
getKey(500004)->[
    2798,
    2799
    ];
getKey(500501)->[
    2800,
    2801,
    2802,
    2803,
    2804
    ];
getKey(500502)->[
    2805,
    2806,
    2807
    ];
getKey(500503)->[
    2808,
    2809
    ];
getKey(500601)->[
    2810,
    2811,
    2812,
    2813,
    2814,
    2815,
    2816
    ];
getKey(500602)->[
    2817,
    2818,
    2819
    ];
getKey(500603)->[
    2820,
    2821,
    2822
    ];
getKey(500604)->[
    2823,
    2824,
    2825
    ];
getKey(500605)->[
    2826,
    2827,
    2828
    ];
getKey(500661)->[
    2829
    ];
getKey(500662)->[
    2830
    ];
getKey(500663)->[
    2831
    ];
getKey(500701)->[
    2832
    ];
getKey(500702)->[
    2833,
    2834,
    2835
    ];
getKey(500703)->[
    2836,
    2837,
    2838
    ];
getKey(500704)->[
    2839,
    2840,
    2841,
    2842,
    2843
    ];
getKey(500705)->[
    2844,
    2845,
    2846,
    2847,
    2848
    ];
getKey(500706)->[
    2849,
    2850,
    2851,
    2852,
    2853
    ];
getKey(500707)->[
    2854,
    2855,
    2856,
    2857,
    2858
    ];
getKey(500771)->[
    2859
    ];
getKey(500772)->[
    2860
    ];
getKey(500773)->[
    2861
    ];
getKey(500774)->[
    2862
    ];
getKey(500801)->[
    2863
    ];
getKey(500802)->[
    2864
    ];
getKey(500803)->[
    2865
    ];
getKey(500811)->[
    2866,
    2867,
    2868
    ];
getKey(500812)->[
    2869,
    2870,
    2871
    ];
getKey(500813)->[
    2872,
    2873,
    2874
    ];
getKey(500814)->[
    2875,
    2876,
    2877
    ];
getKey(500815)->[
    2878,
    2879,
    2880
    ];
getKey(500816)->[
    2881,
    2882,
    2883
    ];
getKey(500817)->[
    2884,
    2885,
    2886
    ];
getKey(500821)->[
    2887,
    2888,
    2889
    ];
getKey(500822)->[
    2890,
    2891,
    2892
    ];
getKey(500823)->[
    2893,
    2894,
    2895
    ];
getKey(500824)->[
    2896,
    2897,
    2898
    ];
getKey(500825)->[
    2899,
    2900,
    2901
    ];
getKey(500826)->[
    2902,
    2903,
    2904
    ];
getKey(500827)->[
    2905,
    2906,
    2907
    ];
getKey(500861)->[
    2908
    ];
getKey(500862)->[
    2909
    ];
getKey(500863)->[
    2910
    ];
getKey(500871)->[
    2911
    ];
getKey(500881)->[
    2912
    ];
getKey(500891)->[
    2913
    ];
getKey(500901)->[
    2914
    ];
getKey(500903)->[
    2915,
    2916
    ];
getKey(501000)->[
    2917
    ];
getKey(501601)->[
    2918,
    2919,
    2920,
    2921,
    2922,
    2923
    ];
getKey(510001)->[
    2924,
    2925,
    2926
    ];
getKey(510003)->[
    2927,
    2928,
    2929
    ];
getKey(_)->[].
