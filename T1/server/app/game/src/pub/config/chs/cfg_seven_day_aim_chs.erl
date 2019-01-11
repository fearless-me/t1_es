%% coding: latin-1
%%: 实现
-module(cfg_seven_day_aim_chs).
-compile(export_all).
-include("cfg_seven_day_aim.hrl").
-include("logger.hrl").

getRow(1)->
    #seven_day_aimCfg {
    id = 1,
    day = 1,
    type = 1,
    name = "每日福利",
    show = "第1天登录奖励",
    preview = 1,
    subType1 = 0,
    args1 = [],
    subType2 = 0,
    args2 = [],
    subType3 = 0,
    args3 = [],
    rewardItem = [{14213,2}]
    };
getRow(2)->
    #seven_day_aimCfg {
    id = 2,
    day = 1,
    type = 1,
    name = "每日福利",
    show = "主角到达30级",
    preview = 2,
    subType1 = 0,
    args1 = [],
    subType2 = 101,
    args2 = [30],
    subType3 = 0,
    args3 = [],
    rewardItem = [{1922,10}]
    };
getRow(3)->
    #seven_day_aimCfg {
    id = 3,
    day = 1,
    type = 1,
    name = "每日福利",
    show = "主角到达40级",
    preview = 3,
    subType1 = 0,
    args1 = [],
    subType2 = 101,
    args2 = [40],
    subType3 = 0,
    args3 = [],
    rewardItem = [{405,1}]
    };
getRow(4)->
    #seven_day_aimCfg {
    id = 4,
    day = 1,
    type = 2,
    name = "玩法活动",
    show = "加入或创建1个家族",
    preview = 4,
    subType1 = 301,
    args1 = [],
    subType2 = 0,
    args2 = [],
    subType3 = 0,
    args3 = [],
    rewardCoin = [{6,150}]
    };
getRow(5)->
    #seven_day_aimCfg {
    id = 5,
    day = 1,
    type = 2,
    name = "玩法活动",
    show = "完成20次家族任务",
    preview = 0,
    subType1 = 0,
    args1 = [],
    subType2 = 319,
    args2 = [20],
    subType3 = 0,
    args3 = [],
    rewardCoin = [{6,150}]
    };
getRow(6)->
    #seven_day_aimCfg {
    id = 6,
    day = 1,
    type = 2,
    name = "玩法活动",
    show = "创建1个家园",
    preview = 0,
    subType1 = 302,
    args1 = [],
    subType2 = 0,
    args2 = [],
    subType3 = 0,
    args3 = [],
    rewardCoin = [{6,150}]
    };
getRow(7)->
    #seven_day_aimCfg {
    id = 7,
    day = 1,
    type = 2,
    name = "玩法活动",
    show = "合成4次家具",
    preview = 0,
    subType1 = 0,
    args1 = [],
    subType2 = 303,
    args2 = [4],
    subType3 = 0,
    args3 = [],
    rewardCoin = [{6,150}]
    };
getRow(8)->
    #seven_day_aimCfg {
    id = 8,
    day = 1,
    type = 2,
    name = "玩法活动",
    show = "摆放1次家具",
    preview = 0,
    subType1 = 304,
    args1 = [],
    subType2 = 0,
    args2 = [],
    subType3 = 0,
    args3 = [],
    rewardCoin = [{6,150}]
    };
getRow(9)->
    #seven_day_aimCfg {
    id = 9,
    day = 1,
    type = 2,
    name = "玩法活动",
    show = "完成2次约会地下城",
    preview = 0,
    subType1 = 0,
    args1 = [],
    subType2 = 318,
    args2 = [2],
    subType3 = 0,
    args3 = [],
    rewardCoin = [{6,150}]
    };
getRow(10)->
    #seven_day_aimCfg {
    id = 10,
    day = 1,
    type = 2,
    name = "玩法活动",
    show = "完成1次全民答题",
    preview = 0,
    subType1 = 0,
    args1 = [],
    subType2 = 306,
    args2 = [1],
    subType3 = 0,
    args3 = [],
    rewardCoin = [{6,150}]
    };
getRow(11)->
    #seven_day_aimCfg {
    id = 11,
    day = 1,
    type = 2,
    name = "玩法活动",
    show = "完成1次限时广场舞",
    preview = 0,
    subType1 = 0,
    args1 = [],
    subType2 = 305,
    args2 = [1],
    subType3 = 0,
    args3 = [],
    rewardCoin = [{6,150}]
    };
getRow(12)->
    #seven_day_aimCfg {
    id = 12,
    day = 1,
    type = 3,
    name = "装备强化",
    show = "8件装备升星到达1级",
    preview = 0,
    subType1 = 0,
    args1 = [],
    subType2 = 0,
    args2 = [],
    subType3 = 201,
    args3 = [1,8],
    rewardItem = [{230,2}]
    };
getRow(13)->
    #seven_day_aimCfg {
    id = 13,
    day = 1,
    type = 3,
    name = "装备强化",
    show = "8件装备升星到达5级",
    preview = 0,
    subType1 = 0,
    args1 = [],
    subType2 = 0,
    args2 = [],
    subType3 = 201,
    args3 = [5,8],
    rewardItem = [{230,2}]
    };
getRow(14)->
    #seven_day_aimCfg {
    id = 14,
    day = 1,
    type = 3,
    name = "装备强化",
    show = "8件装备升星到达10级",
    preview = 0,
    subType1 = 0,
    args1 = [],
    subType2 = 0,
    args2 = [],
    subType3 = 201,
    args3 = [10,8],
    rewardItem = [{230,4}]
    };
getRow(15)->
    #seven_day_aimCfg {
    id = 15,
    day = 1,
    type = 3,
    name = "装备强化",
    show = "8件装备升星到达15级",
    preview = 0,
    subType1 = 0,
    args1 = [],
    subType2 = 0,
    args2 = [],
    subType3 = 201,
    args3 = [15,8],
    rewardItem = [{230,6}]
    };
getRow(16)->
    #seven_day_aimCfg {
    id = 16,
    day = 1,
    type = 3,
    name = "装备强化",
    show = "8件装备升星到达20级",
    preview = 0,
    subType1 = 0,
    args1 = [],
    subType2 = 0,
    args2 = [],
    subType3 = 201,
    args3 = [20,8],
    rewardItem = [{230,8}]
    };
getRow(17)->
    #seven_day_aimCfg {
    id = 17,
    day = 1,
    type = 3,
    name = "装备强化",
    show = "8件装备升星到达25级",
    preview = 0,
    subType1 = 0,
    args1 = [],
    subType2 = 0,
    args2 = [],
    subType3 = 201,
    args3 = [25,8],
    rewardItem = [{230,8}]
    };
getRow(18)->
    #seven_day_aimCfg {
    id = 18,
    day = 1,
    type = 3,
    name = "装备强化",
    show = "8件装备升星到达30级",
    preview = 0,
    subType1 = 0,
    args1 = [],
    subType2 = 0,
    args2 = [],
    subType3 = 201,
    args3 = [30,8],
    rewardItem = [{231,6}]
    };
getRow(19)->
    #seven_day_aimCfg {
    id = 19,
    day = 1,
    type = 3,
    name = "装备强化",
    show = "8件装备升星到达35级",
    preview = 0,
    subType1 = 0,
    args1 = [],
    subType2 = 0,
    args2 = [],
    subType3 = 201,
    args3 = [35,8],
    rewardItem = [{231,9}]
    };
getRow(20)->
    #seven_day_aimCfg {
    id = 20,
    day = 1,
    type = 3,
    name = "装备强化",
    show = "2件装备精炼到+2",
    preview = 0,
    subType1 = 0,
    args1 = [],
    subType2 = 0,
    args2 = [],
    subType3 = 202,
    args3 = [2,2],
    rewardItem = [{221,2}]
    };
getRow(21)->
    #seven_day_aimCfg {
    id = 21,
    day = 1,
    type = 3,
    name = "装备强化",
    show = "8件装备精炼到+2",
    preview = 0,
    subType1 = 0,
    args1 = [],
    subType2 = 0,
    args2 = [],
    subType3 = 202,
    args3 = [2,8],
    rewardItem = [{221,2}]
    };
getRow(22)->
    #seven_day_aimCfg {
    id = 22,
    day = 1,
    type = 3,
    name = "装备强化",
    show = "8件装备精炼到+3",
    preview = 0,
    subType1 = 0,
    args1 = [],
    subType2 = 0,
    args2 = [],
    subType3 = 202,
    args3 = [3,8],
    rewardItem = [{221,3}]
    };
getRow(23)->
    #seven_day_aimCfg {
    id = 23,
    day = 1,
    type = 3,
    name = "装备强化",
    show = "8件装备精炼到+4",
    preview = 0,
    subType1 = 0,
    args1 = [],
    subType2 = 0,
    args2 = [],
    subType3 = 202,
    args3 = [4,8],
    rewardItem = [{221,6}]
    };
getRow(24)->
    #seven_day_aimCfg {
    id = 24,
    day = 1,
    type = 3,
    name = "装备强化",
    show = "8件装备精炼到+6",
    preview = 0,
    subType1 = 0,
    args1 = [],
    subType2 = 0,
    args2 = [],
    subType3 = 202,
    args3 = [6,8],
    rewardItem = [{221,8}]
    };
getRow(25)->
    #seven_day_aimCfg {
    id = 25,
    day = 1,
    type = 3,
    name = "装备强化",
    show = "8件装备精炼到+8",
    preview = 0,
    subType1 = 0,
    args1 = [],
    subType2 = 0,
    args2 = [],
    subType3 = 202,
    args3 = [8,8],
    rewardItem = [{221,8}]
    };
getRow(26)->
    #seven_day_aimCfg {
    id = 26,
    day = 1,
    type = 3,
    name = "装备强化",
    show = "8件装备精炼到+10",
    preview = 0,
    subType1 = 0,
    args1 = [],
    subType2 = 0,
    args2 = [],
    subType3 = 202,
    args3 = [10,8],
    rewardItem = [{221,12}]
    };
getRow(27)->
    #seven_day_aimCfg {
    id = 27,
    day = 1,
    type = 3,
    name = "装备强化",
    show = "8件装备精炼到+12",
    preview = 0,
    subType1 = 0,
    args1 = [],
    subType2 = 0,
    args2 = [],
    subType3 = 202,
    args3 = [12,8],
    rewardItem = [{221,15}]
    };
getRow(28)->
    #seven_day_aimCfg {
    id = 28,
    day = 1,
    type = 3,
    name = "装备强化",
    show = "8件装备精炼到+14",
    preview = 0,
    subType1 = 0,
    args1 = [],
    subType2 = 0,
    args2 = [],
    subType3 = 202,
    args3 = [14,8],
    rewardItem = [{221,20}]
    };
getRow(29)->
    #seven_day_aimCfg {
    id = 29,
    day = 2,
    type = 1,
    name = "每日福利",
    show = "第2天登录奖励",
    preview = 1,
    subType1 = 0,
    args1 = [],
    subType2 = 0,
    args2 = [],
    subType3 = 0,
    args3 = [],
    rewardItem = [{14213,3}]
    };
getRow(30)->
    #seven_day_aimCfg {
    id = 30,
    day = 2,
    type = 1,
    name = "每日福利",
    show = "主角到达50级",
    preview = 2,
    subType1 = 0,
    args1 = [],
    subType2 = 101,
    args2 = [50],
    subType3 = 0,
    args3 = [],
    rewardItem = [{1922,10}]
    };
getRow(31)->
    #seven_day_aimCfg {
    id = 31,
    day = 2,
    type = 1,
    name = "每日福利",
    show = "主角到达55级",
    preview = 3,
    subType1 = 0,
    args1 = [],
    subType2 = 101,
    args2 = [55],
    subType3 = 0,
    args3 = [],
    rewardItem = [{405,1}]
    };
getRow(32)->
    #seven_day_aimCfg {
    id = 32,
    day = 2,
    type = 2,
    name = "玩法活动",
    show = "交易行上架5次道具",
    preview = 4,
    subType1 = 0,
    args1 = [],
    subType2 = 312,
    args2 = [5],
    subType3 = 0,
    args3 = [],
    rewardCoin = [{6,150}]
    };
getRow(33)->
    #seven_day_aimCfg {
    id = 33,
    day = 2,
    type = 2,
    name = "玩法活动",
    show = "完成1次首领入侵",
    preview = 0,
    subType1 = 0,
    args1 = [],
    subType2 = 311,
    args2 = [1],
    subType3 = 0,
    args3 = [],
    rewardCoin = [{6,150}]
    };
getRow(34)->
    #seven_day_aimCfg {
    id = 34,
    day = 2,
    type = 2,
    name = "玩法活动",
    show = "进行种植20次",
    preview = 0,
    subType1 = 0,
    args1 = [],
    subType2 = 307,
    args2 = [20],
    subType3 = 0,
    args3 = [],
    rewardCoin = [{6,150}]
    };
getRow(35)->
    #seven_day_aimCfg {
    id = 35,
    day = 2,
    type = 2,
    name = "玩法活动",
    show = "进行钓鱼60次",
    preview = 0,
    subType1 = 0,
    args1 = [],
    subType2 = 308,
    args2 = [60],
    subType3 = 0,
    args3 = [],
    rewardCoin = [{6,150}]
    };
getRow(36)->
    #seven_day_aimCfg {
    id = 36,
    day = 2,
    type = 2,
    name = "玩法活动",
    show = "进行采矿60次",
    preview = 0,
    subType1 = 0,
    args1 = [],
    subType2 = 309,
    args2 = [60],
    subType3 = 0,
    args3 = [],
    rewardCoin = [{6,150}]
    };
getRow(37)->
    #seven_day_aimCfg {
    id = 37,
    day = 2,
    type = 2,
    name = "玩法活动",
    show = "进行狩猎30次",
    preview = 0,
    subType1 = 0,
    args1 = [],
    subType2 = 310,
    args2 = [30],
    subType3 = 0,
    args3 = [],
    rewardCoin = [{6,150}]
    };
getRow(38)->
    #seven_day_aimCfg {
    id = 38,
    day = 2,
    type = 3,
    name = "骑宠强化",
    show = "将1只骑宠升到5级",
    preview = 0,
    subType1 = 0,
    args1 = [],
    subType2 = 0,
    args2 = [],
    subType3 = 206,
    args3 = [5,1],
    rewardItem = [{202,4}]
    };
getRow(39)->
    #seven_day_aimCfg {
    id = 39,
    day = 2,
    type = 3,
    name = "骑宠强化",
    show = "将1只骑宠升到10级",
    preview = 0,
    subType1 = 0,
    args1 = [],
    subType2 = 0,
    args2 = [],
    subType3 = 206,
    args3 = [10,1],
    rewardItem = [{202,6}]
    };
getRow(40)->
    #seven_day_aimCfg {
    id = 40,
    day = 2,
    type = 3,
    name = "骑宠强化",
    show = "将3只骑宠升到10级",
    preview = 0,
    subType1 = 0,
    args1 = [],
    subType2 = 0,
    args2 = [],
    subType3 = 206,
    args3 = [10,3],
    rewardItem = [{202,10}]
    };
getRow(41)->
    #seven_day_aimCfg {
    id = 41,
    day = 2,
    type = 3,
    name = "骑宠强化",
    show = "将4只骑宠升到10级",
    preview = 0,
    subType1 = 0,
    args1 = [],
    subType2 = 0,
    args2 = [],
    subType3 = 206,
    args3 = [10,4],
    rewardItem = [{202,12}]
    };
getRow(42)->
    #seven_day_aimCfg {
    id = 42,
    day = 2,
    type = 3,
    name = "骑宠强化",
    show = "将4只骑宠升到13级",
    preview = 0,
    subType1 = 0,
    args1 = [],
    subType2 = 0,
    args2 = [],
    subType3 = 206,
    args3 = [13,4],
    rewardItem = [{202,16}]
    };
getRow(43)->
    #seven_day_aimCfg {
    id = 43,
    day = 2,
    type = 3,
    name = "骑宠强化",
    show = "将4只骑宠升到16级",
    preview = 0,
    subType1 = 0,
    args1 = [],
    subType2 = 0,
    args2 = [],
    subType3 = 206,
    args3 = [16,4],
    rewardItem = [{202,20}]
    };
getRow(44)->
    #seven_day_aimCfg {
    id = 44,
    day = 2,
    type = 3,
    name = "骑宠强化",
    show = "将4只骑宠升到20级",
    preview = 0,
    subType1 = 0,
    args1 = [],
    subType2 = 0,
    args2 = [],
    subType3 = 206,
    args3 = [20,4],
    rewardItem = [{202,25}]
    };
getRow(45)->
    #seven_day_aimCfg {
    id = 45,
    day = 2,
    type = 3,
    name = "骑宠强化",
    show = "1只骑宠升星到黄色2星",
    preview = 0,
    subType1 = 0,
    args1 = [],
    subType2 = 0,
    args2 = [],
    subType3 = 207,
    args3 = [2,1],
    rewardItem = [{2160,6}]
    };
getRow(46)->
    #seven_day_aimCfg {
    id = 46,
    day = 2,
    type = 3,
    name = "骑宠强化",
    show = "1只骑宠升星到绿色1星",
    preview = 0,
    subType1 = 0,
    args1 = [],
    subType2 = 0,
    args2 = [],
    subType3 = 207,
    args3 = [6,1],
    rewardItem = [{2160,8}]
    };
getRow(47)->
    #seven_day_aimCfg {
    id = 47,
    day = 2,
    type = 3,
    name = "骑宠强化",
    show = "2只骑宠升星到绿色1星",
    preview = 0,
    subType1 = 0,
    args1 = [],
    subType2 = 0,
    args2 = [],
    subType3 = 207,
    args3 = [6,2],
    rewardItem = [{2160,10}]
    };
getRow(48)->
    #seven_day_aimCfg {
    id = 48,
    day = 2,
    type = 3,
    name = "骑宠强化",
    show = "2只骑宠升星到蓝色1星",
    preview = 0,
    subType1 = 0,
    args1 = [],
    subType2 = 0,
    args2 = [],
    subType3 = 207,
    args3 = [11,2],
    rewardItem = [{2160,12}]
    };
getRow(49)->
    #seven_day_aimCfg {
    id = 49,
    day = 2,
    type = 3,
    name = "骑宠强化",
    show = "3只骑宠升星到蓝色1星",
    preview = 0,
    subType1 = 0,
    args1 = [],
    subType2 = 0,
    args2 = [],
    subType3 = 207,
    args3 = [11,3],
    rewardItem = [{2160,14}]
    };
getRow(50)->
    #seven_day_aimCfg {
    id = 50,
    day = 2,
    type = 3,
    name = "骑宠强化",
    show = "2只骑宠升星到红色1星",
    preview = 0,
    subType1 = 0,
    args1 = [],
    subType2 = 0,
    args2 = [],
    subType3 = 207,
    args3 = [16,2],
    rewardItem = [{2160,20}]
    };
getRow(51)->
    #seven_day_aimCfg {
    id = 51,
    day = 2,
    type = 3,
    name = "骑宠强化",
    show = "3只骑宠升星到红色1星",
    preview = 0,
    subType1 = 0,
    args1 = [],
    subType2 = 0,
    args2 = [],
    subType3 = 207,
    args3 = [16,3],
    rewardItem = [{2160,25}]
    };
getRow(52)->
    #seven_day_aimCfg {
    id = 52,
    day = 3,
    type = 1,
    name = "每日福利",
    show = "第3天登录奖励",
    preview = 1,
    subType1 = 0,
    args1 = [],
    subType2 = 0,
    args2 = [],
    subType3 = 0,
    args3 = [],
    rewardItem = [{14213,3}]
    };
getRow(53)->
    #seven_day_aimCfg {
    id = 53,
    day = 3,
    type = 1,
    name = "每日福利",
    show = "主角到达60级",
    preview = 2,
    subType1 = 0,
    args1 = [],
    subType2 = 101,
    args2 = [60],
    subType3 = 0,
    args3 = [],
    rewardItem = [{1922,20}]
    };
getRow(54)->
    #seven_day_aimCfg {
    id = 54,
    day = 3,
    type = 1,
    name = "每日福利",
    show = "主角到达65级",
    preview = 3,
    subType1 = 0,
    args1 = [],
    subType2 = 101,
    args2 = [65],
    subType3 = 0,
    args3 = [],
    rewardItem = [{405,1}]
    };
getRow(55)->
    #seven_day_aimCfg {
    id = 55,
    day = 3,
    type = 2,
    name = "玩法活动",
    show = "通关挑战副本-普通贪念寺院",
    preview = 4,
    subType1 = 0,
    args1 = [],
    subType2 = 313,
    args2 = [3006,1],
    subType3 = 0,
    args3 = [],
    rewardCoin = [{6,150}]
    };
getRow(56)->
    #seven_day_aimCfg {
    id = 56,
    day = 3,
    type = 2,
    name = "玩法活动",
    show = "通关挑战副本-困难贪念寺院",
    preview = 0,
    subType1 = 0,
    args1 = [],
    subType2 = 313,
    args2 = [3007,1],
    subType3 = 0,
    args3 = [],
    rewardCoin = [{6,150}]
    };
getRow(57)->
    #seven_day_aimCfg {
    id = 57,
    day = 3,
    type = 2,
    name = "玩法活动",
    show = "参与1次幽界探险",
    preview = 0,
    subType1 = 314,
    args1 = [],
    subType2 = 0,
    args2 = [],
    subType3 = 0,
    args3 = [],
    rewardCoin = [{6,150}]
    };
getRow(58)->
    #seven_day_aimCfg {
    id = 58,
    day = 3,
    type = 2,
    name = "玩法活动",
    show = "完成6个阿露娜世界任务",
    preview = 0,
    subType1 = 0,
    args1 = [],
    subType2 = 315,
    args2 = [6],
    subType3 = 0,
    args3 = [],
    rewardCoin = [{6,150}]
    };
getRow(59)->
    #seven_day_aimCfg {
    id = 59,
    day = 3,
    type = 2,
    name = "玩法活动",
    show = "完成12个阿露娜世界任务",
    preview = 0,
    subType1 = 0,
    args1 = [],
    subType2 = 315,
    args2 = [12],
    subType3 = 0,
    args3 = [],
    rewardCoin = [{6,150}]
    };
getRow(60)->
    #seven_day_aimCfg {
    id = 60,
    day = 3,
    type = 2,
    name = "玩法活动",
    show = "完成24个阿露娜世界任务",
    preview = 0,
    subType1 = 0,
    args1 = [],
    subType2 = 315,
    args2 = [24],
    subType3 = 0,
    args3 = [],
    rewardCoin = [{6,150}]
    };
getRow(61)->
    #seven_day_aimCfg {
    id = 61,
    day = 3,
    type = 3,
    name = "拥有装备",
    show = "拥有红色品质装备1件",
    preview = 0,
    subType1 = 0,
    args1 = [],
    subType2 = 106,
    args2 = [3,1],
    subType3 = 0,
    args3 = [],
    rewardCoin = [{7,200}]
    };
getRow(62)->
    #seven_day_aimCfg {
    id = 62,
    day = 3,
    type = 3,
    name = "拥有装备",
    show = "拥有红色品质装备4件",
    preview = 0,
    subType1 = 0,
    args1 = [],
    subType2 = 106,
    args2 = [3,4],
    subType3 = 0,
    args3 = [],
    rewardCoin = [{7,400}]
    };
getRow(63)->
    #seven_day_aimCfg {
    id = 63,
    day = 3,
    type = 3,
    name = "拥有装备",
    show = "拥有红色品质装备6件",
    preview = 0,
    subType1 = 0,
    args1 = [],
    subType2 = 106,
    args2 = [3,6],
    subType3 = 0,
    args3 = [],
    rewardCoin = [{7,600}]
    };
getRow(64)->
    #seven_day_aimCfg {
    id = 64,
    day = 3,
    type = 3,
    name = "拥有装备",
    show = "拥有红色品质装备8件",
    preview = 0,
    subType1 = 0,
    args1 = [],
    subType2 = 106,
    args2 = [3,8],
    subType3 = 0,
    args3 = [],
    rewardCoin = [{7,800}]
    };
getRow(65)->
    #seven_day_aimCfg {
    id = 65,
    day = 3,
    type = 3,
    name = "拥有装备",
    show = "拥有紫色品质装备2件",
    preview = 0,
    subType1 = 0,
    args1 = [],
    subType2 = 106,
    args2 = [4,2],
    subType3 = 0,
    args3 = [],
    rewardCoin = [{7,1000}]
    };
getRow(66)->
    #seven_day_aimCfg {
    id = 66,
    day = 3,
    type = 3,
    name = "拥有装备",
    show = "拥有紫色品质装备4件",
    preview = 0,
    subType1 = 0,
    args1 = [],
    subType2 = 106,
    args2 = [4,4],
    subType3 = 0,
    args3 = [],
    rewardCoin = [{7,1500}]
    };
getRow(67)->
    #seven_day_aimCfg {
    id = 67,
    day = 4,
    type = 1,
    name = "每日福利",
    show = "第4天登录奖励",
    preview = 1,
    subType1 = 0,
    args1 = [],
    subType2 = 0,
    args2 = [],
    subType3 = 0,
    args3 = [],
    rewardItem = [{14213,3}]
    };
getRow(68)->
    #seven_day_aimCfg {
    id = 68,
    day = 4,
    type = 1,
    name = "每日福利",
    show = "主角到达68级",
    preview = 2,
    subType1 = 0,
    args1 = [],
    subType2 = 101,
    args2 = [68],
    subType3 = 0,
    args3 = [],
    rewardItem = [{4501,100}]
    };
getRow(69)->
    #seven_day_aimCfg {
    id = 69,
    day = 4,
    type = 1,
    name = "每日福利",
    show = "主角到达70级",
    preview = 3,
    subType1 = 0,
    args1 = [],
    subType2 = 101,
    args2 = [70],
    subType3 = 0,
    args3 = [],
    rewardItem = [{405,1}]
    };
getRow(70)->
    #seven_day_aimCfg {
    id = 70,
    day = 4,
    type = 2,
    name = "玩法活动",
    show = "完成1次家族战、家族雪人或家族首领活动",
    preview = 4,
    subType1 = 0,
    args1 = [],
    subType2 = 316,
    args2 = [1],
    subType3 = 0,
    args3 = [],
    rewardCoin = [{6,150}]
    };
getRow(71)->
    #seven_day_aimCfg {
    id = 71,
    day = 4,
    type = 2,
    name = "玩法活动",
    show = "通关2次守护女神",
    preview = 0,
    subType1 = 0,
    args1 = [],
    subType2 = 317,
    args2 = [2],
    subType3 = 0,
    args3 = [],
    rewardCoin = [{6,150}]
    };
getRow(72)->
    #seven_day_aimCfg {
    id = 72,
    day = 4,
    type = 2,
    name = "玩法活动",
    show = "竞技场排名达到2000",
    preview = 0,
    subType1 = 0,
    args1 = [],
    subType2 = 105,
    args2 = [2000],
    subType3 = 0,
    args3 = [],
    rewardCoin = [{1,100000}]
    };
getRow(73)->
    #seven_day_aimCfg {
    id = 73,
    day = 4,
    type = 2,
    name = "玩法活动",
    show = "竞技场排名达到1000",
    preview = 0,
    subType1 = 0,
    args1 = [],
    subType2 = 105,
    args2 = [1000],
    subType3 = 0,
    args3 = [],
    rewardCoin = [{1,100000}]
    };
getRow(74)->
    #seven_day_aimCfg {
    id = 74,
    day = 4,
    type = 2,
    name = "玩法活动",
    show = "竞技场排名达到500",
    preview = 0,
    subType1 = 0,
    args1 = [],
    subType2 = 105,
    args2 = [500],
    subType3 = 0,
    args3 = [],
    rewardCoin = [{1,200000}]
    };
getRow(75)->
    #seven_day_aimCfg {
    id = 75,
    day = 4,
    type = 2,
    name = "玩法活动",
    show = "竞技场排名达到100",
    preview = 0,
    subType1 = 0,
    args1 = [],
    subType2 = 105,
    args2 = [100],
    subType3 = 0,
    args3 = [],
    rewardCoin = [{1,200000}]
    };
getRow(76)->
    #seven_day_aimCfg {
    id = 76,
    day = 4,
    type = 2,
    name = "玩法活动",
    show = "竞技场排名达到50",
    preview = 0,
    subType1 = 0,
    args1 = [],
    subType2 = 105,
    args2 = [50],
    subType3 = 0,
    args3 = [],
    rewardCoin = [{1,300000}]
    };
getRow(77)->
    #seven_day_aimCfg {
    id = 77,
    day = 4,
    type = 2,
    name = "玩法活动",
    show = "竞技场排名达到30",
    preview = 0,
    subType1 = 0,
    args1 = [],
    subType2 = 105,
    args2 = [30],
    subType3 = 0,
    args3 = [],
    rewardCoin = [{1,500000}]
    };
getRow(78)->
    #seven_day_aimCfg {
    id = 78,
    day = 4,
    type = 2,
    name = "玩法活动",
    show = "竞技场排名达到10",
    preview = 0,
    subType1 = 0,
    args1 = [],
    subType2 = 105,
    args2 = [10],
    subType3 = 0,
    args3 = [],
    rewardCoin = [{1,800000}]
    };
getRow(79)->
    #seven_day_aimCfg {
    id = 79,
    day = 4,
    type = 2,
    name = "玩法活动",
    show = "竞技场排名达到5",
    preview = 0,
    subType1 = 0,
    args1 = [],
    subType2 = 105,
    args2 = [5],
    subType3 = 0,
    args3 = [],
    rewardCoin = [{1,1000000}]
    };
getRow(80)->
    #seven_day_aimCfg {
    id = 80,
    day = 4,
    type = 2,
    name = "玩法活动",
    show = "竞技场排名达到1",
    preview = 0,
    subType1 = 0,
    args1 = [],
    subType2 = 105,
    args2 = [1],
    subType3 = 0,
    args3 = [],
    rewardCoin = [{1,2000000}]
    };
getRow(81)->
    #seven_day_aimCfg {
    id = 81,
    day = 4,
    type = 3,
    name = "骑宠收集",
    show = "拥有骑宠数量达到2个",
    preview = 0,
    subType1 = 0,
    args1 = [],
    subType2 = 102,
    args2 = [-1,2],
    subType3 = 0,
    args3 = [],
    rewardItem = [{1802,2}]
    };
getRow(82)->
    #seven_day_aimCfg {
    id = 82,
    day = 4,
    type = 3,
    name = "骑宠收集",
    show = "拥有骑宠数量达到4个",
    preview = 0,
    subType1 = 0,
    args1 = [],
    subType2 = 102,
    args2 = [-1,4],
    subType3 = 0,
    args3 = [],
    rewardItem = [{1802,5}]
    };
getRow(83)->
    #seven_day_aimCfg {
    id = 83,
    day = 4,
    type = 3,
    name = "骑宠收集",
    show = "拥有骑宠数量达到8个",
    preview = 0,
    subType1 = 0,
    args1 = [],
    subType2 = 102,
    args2 = [-1,8],
    subType3 = 0,
    args3 = [],
    rewardItem = [{1802,10}]
    };
getRow(84)->
    #seven_day_aimCfg {
    id = 84,
    day = 4,
    type = 3,
    name = "骑宠收集",
    show = "拥有骑宠数量达到15个",
    preview = 0,
    subType1 = 0,
    args1 = [],
    subType2 = 102,
    args2 = [-1,15],
    subType3 = 0,
    args3 = [],
    rewardItem = [{1802,15}]
    };
getRow(85)->
    #seven_day_aimCfg {
    id = 85,
    day = 5,
    type = 1,
    name = "每日福利",
    show = "第5天登录奖励",
    preview = 1,
    subType1 = 0,
    args1 = [],
    subType2 = 0,
    args2 = [],
    subType3 = 0,
    args3 = [],
    rewardItem = [{14213,3}]
    };
getRow(86)->
    #seven_day_aimCfg {
    id = 86,
    day = 5,
    type = 1,
    name = "每日福利",
    show = "主角到达73级",
    preview = 2,
    subType1 = 0,
    args1 = [],
    subType2 = 101,
    args2 = [73],
    subType3 = 0,
    args3 = [],
    rewardItem = [{4501,120}]
    };
getRow(87)->
    #seven_day_aimCfg {
    id = 87,
    day = 5,
    type = 1,
    name = "每日福利",
    show = "主角到达75级",
    preview = 3,
    subType1 = 0,
    args1 = [],
    subType2 = 101,
    args2 = [75],
    subType3 = 0,
    args3 = [],
    rewardItem = [{405,1}]
    };
getRow(88)->
    #seven_day_aimCfg {
    id = 88,
    day = 5,
    type = 2,
    name = "玩法活动",
    show = "通关挑战副本-噩梦贪念寺院",
    preview = 4,
    subType1 = 0,
    args1 = [],
    subType2 = 313,
    args2 = [3008,1],
    subType3 = 0,
    args3 = [],
    rewardItem = [{3150,2}]
    };
getRow(89)->
    #seven_day_aimCfg {
    id = 89,
    day = 5,
    type = 2,
    name = "玩法活动",
    show = "通关10次挑战副本-噩梦贪念寺院",
    preview = 0,
    subType1 = 0,
    args1 = [],
    subType2 = 313,
    args2 = [3008,10],
    subType3 = 0,
    args3 = [],
    rewardItem = [{3150,3}]
    };
getRow(90)->
    #seven_day_aimCfg {
    id = 90,
    day = 5,
    type = 2,
    name = "玩法活动",
    show = "通关挑战副本-地狱1星贪念寺院",
    preview = 0,
    subType1 = 0,
    args1 = [],
    subType2 = 313,
    args2 = [3120,1],
    subType3 = 0,
    args3 = [],
    rewardItem = [{3150,2}]
    };
getRow(91)->
    #seven_day_aimCfg {
    id = 91,
    day = 5,
    type = 2,
    name = "玩法活动",
    show = "通关挑战副本-地狱2星贪念寺院",
    preview = 0,
    subType1 = 0,
    args1 = [],
    subType2 = 313,
    args2 = [3121,1],
    subType3 = 0,
    args3 = [],
    rewardItem = [{3150,3}]
    };
getRow(92)->
    #seven_day_aimCfg {
    id = 92,
    day = 5,
    type = 2,
    name = "玩法活动",
    show = "通关挑战副本-地狱3星贪念寺院",
    preview = 0,
    subType1 = 0,
    args1 = [],
    subType2 = 313,
    args2 = [3122,1],
    subType3 = 0,
    args3 = [],
    rewardItem = [{3150,4}]
    };
getRow(93)->
    #seven_day_aimCfg {
    id = 93,
    day = 5,
    type = 3,
    name = "时装收集",
    show = "拥有1件永久时装",
    preview = 0,
    subType1 = 0,
    args1 = [],
    subType2 = 103,
    args2 = [1],
    subType3 = 0,
    args3 = [],
    rewardItem = [{2601,2}]
    };
getRow(94)->
    #seven_day_aimCfg {
    id = 94,
    day = 5,
    type = 3,
    name = "时装收集",
    show = "拥有3件永久时装",
    preview = 0,
    subType1 = 0,
    args1 = [],
    subType2 = 103,
    args2 = [3],
    subType3 = 0,
    args3 = [],
    rewardItem = [{2601,5}]
    };
getRow(95)->
    #seven_day_aimCfg {
    id = 95,
    day = 5,
    type = 3,
    name = "时装收集",
    show = "拥有5件永久时装",
    preview = 0,
    subType1 = 0,
    args1 = [],
    subType2 = 103,
    args2 = [5],
    subType3 = 0,
    args3 = [],
    rewardItem = [{2601,8}]
    };
getRow(96)->
    #seven_day_aimCfg {
    id = 96,
    day = 5,
    type = 3,
    name = "时装收集",
    show = "拥有10件永久时装",
    preview = 0,
    subType1 = 0,
    args1 = [],
    subType2 = 103,
    args2 = [10],
    subType3 = 0,
    args3 = [],
    rewardItem = [{2601,10}]
    };
getRow(97)->
    #seven_day_aimCfg {
    id = 97,
    day = 5,
    type = 3,
    name = "时装收集",
    show = "拥有15件永久时装",
    preview = 0,
    subType1 = 0,
    args1 = [],
    subType2 = 103,
    args2 = [15],
    subType3 = 0,
    args3 = [],
    rewardItem = [{2601,15}]
    };
getRow(98)->
    #seven_day_aimCfg {
    id = 98,
    day = 5,
    type = 3,
    name = "时装收集",
    show = "拥有20件永久时装",
    preview = 0,
    subType1 = 0,
    args1 = [],
    subType2 = 103,
    args2 = [20],
    subType3 = 0,
    args3 = [],
    rewardItem = [{2601,20}]
    };
getRow(99)->
    #seven_day_aimCfg {
    id = 99,
    day = 6,
    type = 1,
    name = "每日福利",
    show = "第6天登录奖励",
    preview = 1,
    subType1 = 0,
    args1 = [],
    subType2 = 0,
    args2 = [],
    subType3 = 0,
    args3 = [],
    rewardItem = [{14213,3}]
    };
getRow(100)->
    #seven_day_aimCfg {
    id = 100,
    day = 6,
    type = 1,
    name = "每日福利",
    show = "主角到达76级",
    preview = 2,
    subType1 = 0,
    args1 = [],
    subType2 = 101,
    args2 = [76],
    subType3 = 0,
    args3 = [],
    rewardItem = [{4502,150}]
    };
getRow(101)->
    #seven_day_aimCfg {
    id = 101,
    day = 6,
    type = 1,
    name = "每日福利",
    show = "主角到达78级",
    preview = 3,
    subType1 = 0,
    args1 = [],
    subType2 = 101,
    args2 = [78],
    subType3 = 0,
    args3 = [],
    rewardItem = [{405,1}]
    };
getRow(102)->
    #seven_day_aimCfg {
    id = 102,
    day = 6,
    type = 2,
    name = "纹章收集",
    show = "镶嵌1个2级纹章",
    preview = 4,
    subType1 = 0,
    args1 = [],
    subType2 = 0,
    args2 = [],
    subType3 = 203,
    args3 = [2,1],
    rewardItem = [{271,1}]
    };
getRow(103)->
    #seven_day_aimCfg {
    id = 103,
    day = 6,
    type = 2,
    name = "纹章收集",
    show = "镶嵌1个3级纹章",
    preview = 0,
    subType1 = 0,
    args1 = [],
    subType2 = 0,
    args2 = [],
    subType3 = 203,
    args3 = [3,1],
    rewardItem = [{272,1}]
    };
getRow(104)->
    #seven_day_aimCfg {
    id = 104,
    day = 6,
    type = 2,
    name = "纹章收集",
    show = "镶嵌5个3级纹章",
    preview = 0,
    subType1 = 0,
    args1 = [],
    subType2 = 0,
    args2 = [],
    subType3 = 203,
    args3 = [3,5],
    rewardItem = [{272,1}]
    };
getRow(105)->
    #seven_day_aimCfg {
    id = 105,
    day = 6,
    type = 2,
    name = "纹章收集",
    show = "镶嵌5个4级纹章",
    preview = 0,
    subType1 = 0,
    args1 = [],
    subType2 = 0,
    args2 = [],
    subType3 = 203,
    args3 = [4,5],
    rewardItem = [{273,1}]
    };
getRow(106)->
    #seven_day_aimCfg {
    id = 106,
    day = 6,
    type = 2,
    name = "纹章收集",
    show = "镶嵌5个5级纹章",
    preview = 0,
    subType1 = 0,
    args1 = [],
    subType2 = 0,
    args2 = [],
    subType3 = 203,
    args3 = [5,5],
    rewardItem = [{274,1}]
    };
getRow(107)->
    #seven_day_aimCfg {
    id = 107,
    day = 7,
    type = 1,
    name = "每日福利",
    show = "第7天登录奖励",
    preview = 1,
    subType1 = 0,
    args1 = [],
    subType2 = 0,
    args2 = [],
    subType3 = 0,
    args3 = [],
    rewardItem = [{14213,3}]
    };
getRow(108)->
    #seven_day_aimCfg {
    id = 108,
    day = 7,
    type = 1,
    name = "每日福利",
    show = "主角到达78级",
    preview = 2,
    subType1 = 0,
    args1 = [],
    subType2 = 101,
    args2 = [78],
    subType3 = 0,
    args3 = [],
    rewardItem = [{4502,200}]
    };
getRow(109)->
    #seven_day_aimCfg {
    id = 109,
    day = 7,
    type = 1,
    name = "每日福利",
    show = "主角到达80级",
    preview = 3,
    subType1 = 0,
    args1 = [],
    subType2 = 101,
    args2 = [80],
    subType3 = 0,
    args3 = [],
    rewardItem = [{405,1}]
    };
getRow(110)->
    #seven_day_aimCfg {
    id = 110,
    day = 7,
    type = 2,
    name = "骑宠强化",
    show = "1个骑宠转生到1转",
    preview = 4,
    subType1 = 0,
    args1 = [],
    subType2 = 0,
    args2 = [],
    subType3 = 208,
    args3 = [1,1],
    rewardItem = [{1802,2}]
    };
getRow(111)->
    #seven_day_aimCfg {
    id = 111,
    day = 7,
    type = 2,
    name = "骑宠强化",
    show = "2个骑宠转生到1转",
    preview = 0,
    subType1 = 0,
    args1 = [],
    subType2 = 0,
    args2 = [],
    subType3 = 208,
    args3 = [1,2],
    rewardItem = [{1802,2}]
    };
getRow(112)->
    #seven_day_aimCfg {
    id = 112,
    day = 7,
    type = 2,
    name = "骑宠强化",
    show = "1个骑宠转生到2转",
    preview = 0,
    subType1 = 0,
    args1 = [],
    subType2 = 0,
    args2 = [],
    subType3 = 208,
    args3 = [2,1],
    rewardItem = [{1802,5}]
    };
getRow(113)->
    #seven_day_aimCfg {
    id = 113,
    day = 7,
    type = 2,
    name = "骑宠强化",
    show = "2个骑宠转生到2转",
    preview = 0,
    subType1 = 0,
    args1 = [],
    subType2 = 0,
    args2 = [],
    subType3 = 208,
    args3 = [2,2],
    rewardItem = [{1802,5}]
    };
getRow(114)->
    #seven_day_aimCfg {
    id = 114,
    day = 7,
    type = 2,
    name = "骑宠强化",
    show = "1个骑宠转生到3转",
    preview = 0,
    subType1 = 0,
    args1 = [],
    subType2 = 0,
    args2 = [],
    subType3 = 208,
    args3 = [3,1],
    rewardItem = [{1802,10}]
    };
getRow(115)->
    #seven_day_aimCfg {
    id = 115,
    day = 7,
    type = 2,
    name = "骑宠强化",
    show = "2个骑宠转生到3转",
    preview = 0,
    subType1 = 0,
    args1 = [],
    subType2 = 0,
    args2 = [],
    subType3 = 208,
    args3 = [3,2],
    rewardItem = [{1802,10}]
    };
getRow(116)->
    #seven_day_aimCfg {
    id = 116,
    day = 7,
    type = 2,
    name = "骑宠强化",
    show = "3个骑宠转生到3转",
    preview = 0,
    subType1 = 0,
    args1 = [],
    subType2 = 0,
    args2 = [],
    subType3 = 208,
    args3 = [3,3],
    rewardItem = [{1802,15}]
    };
getRow(117)->
    #seven_day_aimCfg {
    id = 117,
    day = 7,
    type = 2,
    name = "骑宠强化",
    show = "1个骑宠转生到4转",
    preview = 0,
    subType1 = 0,
    args1 = [],
    subType2 = 0,
    args2 = [],
    subType3 = 208,
    args3 = [4,1],
    rewardItem = [{1802,15}]
    };
getRow(118)->
    #seven_day_aimCfg {
    id = 118,
    day = 7,
    type = 2,
    name = "骑宠强化",
    show = "1个骑宠转生到5转",
    preview = 0,
    subType1 = 0,
    args1 = [],
    subType2 = 0,
    args2 = [],
    subType3 = 208,
    args3 = [5,1],
    rewardItem = [{1802,20}]
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
    {118}
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
    118
    ].

