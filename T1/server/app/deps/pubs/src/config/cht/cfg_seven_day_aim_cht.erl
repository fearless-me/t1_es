%% coding: latin-1
%%: 实现
-module(cfg_seven_day_aim_cht).
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
    rewardCoin = [{6,50}]
    };
getRow(2)->
    #seven_day_aimCfg {
    id = 2,
    day = 1,
    type = 1,
    name = "每日福利",
    show = "主角到达15级",
    preview = 2,
    subType1 = 0,
    args1 = [],
    subType2 = 101,
    args2 = [15],
    subType3 = 0,
    args3 = [],
    rewardCoin = [{1,50000}]
    };
getRow(3)->
    #seven_day_aimCfg {
    id = 3,
    day = 1,
    type = 1,
    name = "每日福利",
    show = "主角到达20级",
    preview = 0,
    subType1 = 0,
    args1 = [],
    subType2 = 101,
    args2 = [20],
    subType3 = 0,
    args3 = [],
    rewardCoin = [{1,80000}]
    };
getRow(4)->
    #seven_day_aimCfg {
    id = 4,
    day = 1,
    type = 2,
    name = "装备升星",
    show = "8件装备升星到达1级",
    preview = 3,
    subType1 = 0,
    args1 = [],
    subType2 = 0,
    args2 = [],
    subType3 = 201,
    args3 = [1,8],
    rewardItem = [{230,2}]
    };
getRow(5)->
    #seven_day_aimCfg {
    id = 5,
    day = 1,
    type = 2,
    name = "装备升星",
    show = "8件装备升星到达5级",
    preview = 0,
    subType1 = 0,
    args1 = [],
    subType2 = 0,
    args2 = [],
    subType3 = 201,
    args3 = [5,8],
    rewardItem = [{230,4}]
    };
getRow(6)->
    #seven_day_aimCfg {
    id = 6,
    day = 1,
    type = 2,
    name = "装备升星",
    show = "8件装备升星到达10级",
    preview = 0,
    subType1 = 0,
    args1 = [],
    subType2 = 0,
    args2 = [],
    subType3 = 201,
    args3 = [10,8],
    rewardItem = [{230,8}]
    };
getRow(7)->
    #seven_day_aimCfg {
    id = 7,
    day = 1,
    type = 2,
    name = "装备升星",
    show = "8件装备升星到达15级",
    preview = 0,
    subType1 = 0,
    args1 = [],
    subType2 = 0,
    args2 = [],
    subType3 = 201,
    args3 = [15,8],
    rewardItem = [{230,12}]
    };
getRow(8)->
    #seven_day_aimCfg {
    id = 8,
    day = 1,
    type = 2,
    name = "装备升星",
    show = "8件装备升星到达20级",
    preview = 0,
    subType1 = 0,
    args1 = [],
    subType2 = 0,
    args2 = [],
    subType3 = 201,
    args3 = [20,8],
    rewardItem = [{230,16}]
    };
getRow(9)->
    #seven_day_aimCfg {
    id = 9,
    day = 1,
    type = 2,
    name = "装备升星",
    show = "8件装备升星到达25级",
    preview = 0,
    subType1 = 0,
    args1 = [],
    subType2 = 0,
    args2 = [],
    subType3 = 201,
    args3 = [25,8],
    rewardItem = [{230,20}]
    };
getRow(10)->
    #seven_day_aimCfg {
    id = 10,
    day = 1,
    type = 2,
    name = "装备升星",
    show = "8件装备升星到达28级",
    preview = 0,
    subType1 = 0,
    args1 = [],
    subType2 = 0,
    args2 = [],
    subType3 = 201,
    args3 = [28,8],
    rewardItem = [{230,25}]
    };
getRow(11)->
    #seven_day_aimCfg {
    id = 11,
    day = 1,
    type = 2,
    name = "装备升星",
    show = "8件装备升星到达30级",
    preview = 0,
    subType1 = 0,
    args1 = [],
    subType2 = 0,
    args2 = [],
    subType3 = 201,
    args3 = [30,8],
    rewardItem = [{230,30}]
    };
getRow(12)->
    #seven_day_aimCfg {
    id = 12,
    day = 1,
    type = 2,
    name = "装备升星",
    show = "8件装备升星到达33级",
    preview = 0,
    subType1 = 0,
    args1 = [],
    subType2 = 0,
    args2 = [],
    subType3 = 201,
    args3 = [33,8],
    rewardItem = [{230,35}]
    };
getRow(13)->
    #seven_day_aimCfg {
    id = 13,
    day = 1,
    type = 2,
    name = "装备升星",
    show = "8件装备升星到达35级",
    preview = 0,
    subType1 = 0,
    args1 = [],
    subType2 = 0,
    args2 = [],
    subType3 = 201,
    args3 = [35,8],
    rewardItem = [{230,40}]
    };
getRow(14)->
    #seven_day_aimCfg {
    id = 14,
    day = 1,
    type = 3,
    name = "骑宠升级",
    show = "将1只骑宠升到2级",
    preview = 4,
    subType1 = 0,
    args1 = [],
    subType2 = 0,
    args2 = [],
    subType3 = 206,
    args3 = [2,1],
    rewardItem = [{2160,4}]
    };
getRow(15)->
    #seven_day_aimCfg {
    id = 15,
    day = 1,
    type = 3,
    name = "骑宠升级",
    show = "将1只骑宠升到5级",
    preview = 0,
    subType1 = 0,
    args1 = [],
    subType2 = 0,
    args2 = [],
    subType3 = 206,
    args3 = [5,1],
    rewardItem = [{2160,6}]
    };
getRow(16)->
    #seven_day_aimCfg {
    id = 16,
    day = 1,
    type = 3,
    name = "骑宠升级",
    show = "将1只骑宠升到8级",
    preview = 0,
    subType1 = 0,
    args1 = [],
    subType2 = 0,
    args2 = [],
    subType3 = 206,
    args3 = [8,1],
    rewardItem = [{2160,8}]
    };
getRow(17)->
    #seven_day_aimCfg {
    id = 17,
    day = 1,
    type = 3,
    name = "骑宠升级",
    show = "将1只骑宠升到12级",
    preview = 0,
    subType1 = 0,
    args1 = [],
    subType2 = 0,
    args2 = [],
    subType3 = 206,
    args3 = [12,1],
    rewardItem = [{2160,10}]
    };
getRow(18)->
    #seven_day_aimCfg {
    id = 18,
    day = 1,
    type = 3,
    name = "骑宠升级",
    show = "将1只骑宠升到14级",
    preview = 0,
    subType1 = 0,
    args1 = [],
    subType2 = 0,
    args2 = [],
    subType3 = 206,
    args3 = [14,1],
    rewardItem = [{2160,12}]
    };
getRow(19)->
    #seven_day_aimCfg {
    id = 19,
    day = 1,
    type = 3,
    name = "骑宠升级",
    show = "将1只骑宠升到16级",
    preview = 0,
    subType1 = 0,
    args1 = [],
    subType2 = 0,
    args2 = [],
    subType3 = 206,
    args3 = [16,1],
    rewardItem = [{2160,14}]
    };
getRow(20)->
    #seven_day_aimCfg {
    id = 20,
    day = 1,
    type = 3,
    name = "骑宠升级",
    show = "将1只骑宠升到18级",
    preview = 0,
    subType1 = 0,
    args1 = [],
    subType2 = 0,
    args2 = [],
    subType3 = 206,
    args3 = [18,1],
    rewardItem = [{2160,16}]
    };
getRow(21)->
    #seven_day_aimCfg {
    id = 21,
    day = 1,
    type = 3,
    name = "骑宠升级",
    show = "将1只骑宠升到20级",
    preview = 0,
    subType1 = 0,
    args1 = [],
    subType2 = 0,
    args2 = [],
    subType3 = 206,
    args3 = [20,1],
    rewardItem = [{2160,18}]
    };
getRow(22)->
    #seven_day_aimCfg {
    id = 22,
    day = 1,
    type = 3,
    name = "骑宠升级",
    show = "将1只骑宠升到25级",
    preview = 0,
    subType1 = 0,
    args1 = [],
    subType2 = 0,
    args2 = [],
    subType3 = 206,
    args3 = [25,1],
    rewardItem = [{2160,25}]
    };
getRow(23)->
    #seven_day_aimCfg {
    id = 23,
    day = 1,
    type = 3,
    name = "骑宠升级",
    show = "将1只骑宠升到30级",
    preview = 0,
    subType1 = 0,
    args1 = [],
    subType2 = 0,
    args2 = [],
    subType3 = 206,
    args3 = [30,1],
    rewardItem = [{2160,40}]
    };
getRow(24)->
    #seven_day_aimCfg {
    id = 24,
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
    rewardCoin = [{6,80}]
    };
getRow(25)->
    #seven_day_aimCfg {
    id = 25,
    day = 2,
    type = 1,
    name = "每日福利",
    show = "主角到达25级",
    preview = 2,
    subType1 = 0,
    args1 = [],
    subType2 = 101,
    args2 = [25],
    subType3 = 0,
    args3 = [],
    rewardCoin = [{1,120000}]
    };
getRow(26)->
    #seven_day_aimCfg {
    id = 26,
    day = 2,
    type = 1,
    name = "每日福利",
    show = "主角到达28级",
    preview = 0,
    subType1 = 0,
    args1 = [],
    subType2 = 101,
    args2 = [28],
    subType3 = 0,
    args3 = [],
    rewardCoin = [{1,150000}]
    };
getRow(27)->
    #seven_day_aimCfg {
    id = 27,
    day = 2,
    type = 2,
    name = "竞技场",
    show = "竞技场排名达到2000",
    preview = 3,
    subType1 = 0,
    args1 = [],
    subType2 = 105,
    args2 = [2000],
    subType3 = 0,
    args3 = [],
    rewardItem = [{2002,1200}]
    };
getRow(28)->
    #seven_day_aimCfg {
    id = 28,
    day = 2,
    type = 2,
    name = "竞技场",
    show = "竞技场排名达到1500",
    preview = 0,
    subType1 = 0,
    args1 = [],
    subType2 = 105,
    args2 = [1500],
    subType3 = 0,
    args3 = [],
    rewardItem = [{2002,1600}]
    };
getRow(29)->
    #seven_day_aimCfg {
    id = 29,
    day = 2,
    type = 2,
    name = "竞技场",
    show = "竞技场排名达到1000",
    preview = 0,
    subType1 = 0,
    args1 = [],
    subType2 = 105,
    args2 = [1000],
    subType3 = 0,
    args3 = [],
    rewardItem = [{2002,2000}]
    };
getRow(30)->
    #seven_day_aimCfg {
    id = 30,
    day = 2,
    type = 2,
    name = "竞技场",
    show = "竞技场排名达到500",
    preview = 0,
    subType1 = 0,
    args1 = [],
    subType2 = 105,
    args2 = [500],
    subType3 = 0,
    args3 = [],
    rewardItem = [{2002,2400}]
    };
getRow(31)->
    #seven_day_aimCfg {
    id = 31,
    day = 2,
    type = 2,
    name = "竞技场",
    show = "竞技场排名达到200",
    preview = 0,
    subType1 = 0,
    args1 = [],
    subType2 = 105,
    args2 = [200],
    subType3 = 0,
    args3 = [],
    rewardItem = [{2002,2800}]
    };
getRow(32)->
    #seven_day_aimCfg {
    id = 32,
    day = 2,
    type = 2,
    name = "竞技场",
    show = "竞技场排名达到100",
    preview = 0,
    subType1 = 0,
    args1 = [],
    subType2 = 105,
    args2 = [100],
    subType3 = 0,
    args3 = [],
    rewardItem = [{2002,3200}]
    };
getRow(33)->
    #seven_day_aimCfg {
    id = 33,
    day = 2,
    type = 2,
    name = "竞技场",
    show = "竞技场排名达到50",
    preview = 0,
    subType1 = 0,
    args1 = [],
    subType2 = 105,
    args2 = [50],
    subType3 = 0,
    args3 = [],
    rewardItem = [{2002,4000}]
    };
getRow(34)->
    #seven_day_aimCfg {
    id = 34,
    day = 2,
    type = 2,
    name = "竞技场",
    show = "竞技场排名达到30",
    preview = 0,
    subType1 = 0,
    args1 = [],
    subType2 = 105,
    args2 = [30],
    subType3 = 0,
    args3 = [],
    rewardItem = [{2002,6000}]
    };
getRow(35)->
    #seven_day_aimCfg {
    id = 35,
    day = 2,
    type = 2,
    name = "竞技场",
    show = "竞技场排名达到10",
    preview = 0,
    subType1 = 0,
    args1 = [],
    subType2 = 105,
    args2 = [10],
    subType3 = 0,
    args3 = [],
    rewardItem = [{2002,8000}]
    };
getRow(36)->
    #seven_day_aimCfg {
    id = 36,
    day = 2,
    type = 2,
    name = "竞技场",
    show = "竞技场排名达到5",
    preview = 0,
    subType1 = 0,
    args1 = [],
    subType2 = 105,
    args2 = [5],
    subType3 = 0,
    args3 = [],
    rewardItem = [{2002,10000}]
    };
getRow(37)->
    #seven_day_aimCfg {
    id = 37,
    day = 2,
    type = 2,
    name = "竞技场",
    show = "竞技场排名达到1",
    preview = 0,
    subType1 = 0,
    args1 = [],
    subType2 = 105,
    args2 = [1],
    subType3 = 0,
    args3 = [],
    rewardItem = [{2002,12000}]
    };
getRow(38)->
    #seven_day_aimCfg {
    id = 38,
    day = 2,
    type = 3,
    name = "元素保卫战",
    show = "通关元素保卫战第1关",
    preview = 4,
    subType1 = 4,
    args1 = [528],
    subType2 = 0,
    args2 = [],
    subType3 = 0,
    args3 = [],
    rewardItem = [{7000,50}]
    };
getRow(39)->
    #seven_day_aimCfg {
    id = 39,
    day = 2,
    type = 3,
    name = "元素保卫战",
    show = "通关元素保卫战第2关",
    preview = 0,
    subType1 = 4,
    args1 = [529],
    subType2 = 0,
    args2 = [],
    subType3 = 0,
    args3 = [],
    rewardItem = [{7000,100}]
    };
getRow(40)->
    #seven_day_aimCfg {
    id = 40,
    day = 2,
    type = 3,
    name = "元素保卫战",
    show = "通关元素保卫战第3关",
    preview = 0,
    subType1 = 4,
    args1 = [530],
    subType2 = 0,
    args2 = [],
    subType3 = 0,
    args3 = [],
    rewardItem = [{7001,200}]
    };
getRow(41)->
    #seven_day_aimCfg {
    id = 41,
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
    rewardCoin = [{6,100}]
    };
getRow(42)->
    #seven_day_aimCfg {
    id = 42,
    day = 3,
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
    rewardCoin = [{1,210000}]
    };
getRow(43)->
    #seven_day_aimCfg {
    id = 43,
    day = 3,
    type = 1,
    name = "每日福利",
    show = "主角到达33级",
    preview = 0,
    subType1 = 0,
    args1 = [],
    subType2 = 101,
    args2 = [33],
    subType3 = 0,
    args3 = [],
    rewardCoin = [{1,240000}]
    };
getRow(44)->
    #seven_day_aimCfg {
    id = 44,
    day = 3,
    type = 2,
    name = "女神禁闭室",
    show = "通关禁闭室1层",
    preview = 3,
    subType1 = 2,
    args1 = [1],
    subType2 = 0,
    args2 = [],
    subType3 = 0,
    args3 = [],
    rewardItem = [{221,1}]
    };
getRow(45)->
    #seven_day_aimCfg {
    id = 45,
    day = 3,
    type = 2,
    name = "女神禁闭室",
    show = "通关禁闭室5层",
    preview = 0,
    subType1 = 2,
    args1 = [5],
    subType2 = 0,
    args2 = [],
    subType3 = 0,
    args3 = [],
    rewardItem = [{221,2}]
    };
getRow(46)->
    #seven_day_aimCfg {
    id = 46,
    day = 3,
    type = 2,
    name = "女神禁闭室",
    show = "通关禁闭室10层",
    preview = 0,
    subType1 = 2,
    args1 = [10],
    subType2 = 0,
    args2 = [],
    subType3 = 0,
    args3 = [],
    rewardItem = [{221,2}]
    };
getRow(47)->
    #seven_day_aimCfg {
    id = 47,
    day = 3,
    type = 2,
    name = "女神禁闭室",
    show = "通关禁闭室20层",
    preview = 0,
    subType1 = 2,
    args1 = [20],
    subType2 = 0,
    args2 = [],
    subType3 = 0,
    args3 = [],
    rewardItem = [{221,4}]
    };
getRow(48)->
    #seven_day_aimCfg {
    id = 48,
    day = 3,
    type = 2,
    name = "女神禁闭室",
    show = "通关禁闭室30层",
    preview = 0,
    subType1 = 2,
    args1 = [30],
    subType2 = 0,
    args2 = [],
    subType3 = 0,
    args3 = [],
    rewardItem = [{221,6}]
    };
getRow(49)->
    #seven_day_aimCfg {
    id = 49,
    day = 3,
    type = 2,
    name = "女神禁闭室",
    show = "通关禁闭室40层",
    preview = 0,
    subType1 = 2,
    args1 = [40],
    subType2 = 0,
    args2 = [],
    subType3 = 0,
    args3 = [],
    rewardItem = [{221,8}]
    };
getRow(50)->
    #seven_day_aimCfg {
    id = 50,
    day = 3,
    type = 2,
    name = "女神禁闭室",
    show = "通关禁闭室50层",
    preview = 0,
    subType1 = 2,
    args1 = [50],
    subType2 = 0,
    args2 = [],
    subType3 = 0,
    args3 = [],
    rewardItem = [{221,15}]
    };
getRow(51)->
    #seven_day_aimCfg {
    id = 51,
    day = 3,
    type = 2,
    name = "女神禁闭室",
    show = "通关禁闭室60层",
    preview = 0,
    subType1 = 2,
    args1 = [60],
    subType2 = 0,
    args2 = [],
    subType3 = 0,
    args3 = [],
    rewardItem = [{221,20}]
    };
getRow(52)->
    #seven_day_aimCfg {
    id = 52,
    day = 3,
    type = 3,
    name = "装备精炼",
    show = "2件装备精炼到+2",
    preview = 4,
    subType1 = 0,
    args1 = [],
    subType2 = 0,
    args2 = [],
    subType3 = 202,
    args3 = [2,2],
    rewardItem = [{221,5}]
    };
getRow(53)->
    #seven_day_aimCfg {
    id = 53,
    day = 3,
    type = 3,
    name = "装备精炼",
    show = "8件装备精炼到+2",
    preview = 0,
    subType1 = 0,
    args1 = [],
    subType2 = 0,
    args2 = [],
    subType3 = 202,
    args3 = [2,8],
    rewardItem = [{221,10}]
    };
getRow(54)->
    #seven_day_aimCfg {
    id = 54,
    day = 3,
    type = 3,
    name = "装备精炼",
    show = "4件装备精炼到+3",
    preview = 0,
    subType1 = 0,
    args1 = [],
    subType2 = 0,
    args2 = [],
    subType3 = 202,
    args3 = [3,4],
    rewardItem = [{221,10}]
    };
getRow(55)->
    #seven_day_aimCfg {
    id = 55,
    day = 3,
    type = 3,
    name = "装备精炼",
    show = "8件装备精炼到+3",
    preview = 0,
    subType1 = 0,
    args1 = [],
    subType2 = 0,
    args2 = [],
    subType3 = 202,
    args3 = [3,8],
    rewardItem = [{221,15}]
    };
getRow(56)->
    #seven_day_aimCfg {
    id = 56,
    day = 3,
    type = 3,
    name = "装备精炼",
    show = "4件装备精炼到+4",
    preview = 0,
    subType1 = 0,
    args1 = [],
    subType2 = 0,
    args2 = [],
    subType3 = 202,
    args3 = [4,4],
    rewardItem = [{221,15}]
    };
getRow(57)->
    #seven_day_aimCfg {
    id = 57,
    day = 3,
    type = 3,
    name = "装备精炼",
    show = "8件装备精炼到+4",
    preview = 0,
    subType1 = 0,
    args1 = [],
    subType2 = 0,
    args2 = [],
    subType3 = 202,
    args3 = [4,8],
    rewardItem = [{221,20}]
    };
getRow(58)->
    #seven_day_aimCfg {
    id = 58,
    day = 3,
    type = 3,
    name = "装备精炼",
    show = "8件装备精炼到+5",
    preview = 0,
    subType1 = 0,
    args1 = [],
    subType2 = 0,
    args2 = [],
    subType3 = 202,
    args3 = [5,8],
    rewardItem = [{221,20}]
    };
getRow(59)->
    #seven_day_aimCfg {
    id = 59,
    day = 3,
    type = 3,
    name = "装备精炼",
    show = "8件装备精炼到+6",
    preview = 0,
    subType1 = 0,
    args1 = [],
    subType2 = 0,
    args2 = [],
    subType3 = 202,
    args3 = [6,8],
    rewardItem = [{221,25}]
    };
getRow(60)->
    #seven_day_aimCfg {
    id = 60,
    day = 3,
    type = 3,
    name = "装备精炼",
    show = "8件装备精炼到+8",
    preview = 0,
    subType1 = 0,
    args1 = [],
    subType2 = 0,
    args2 = [],
    subType3 = 202,
    args3 = [8,8],
    rewardItem = [{221,30}]
    };
getRow(61)->
    #seven_day_aimCfg {
    id = 61,
    day = 3,
    type = 3,
    name = "装备精炼",
    show = "8件装备精炼到+9",
    preview = 0,
    subType1 = 0,
    args1 = [],
    subType2 = 0,
    args2 = [],
    subType3 = 202,
    args3 = [9,8],
    rewardItem = [{221,50}]
    };
getRow(62)->
    #seven_day_aimCfg {
    id = 62,
    day = 3,
    type = 3,
    name = "装备精炼",
    show = "8件装备精炼到+10",
    preview = 0,
    subType1 = 0,
    args1 = [],
    subType2 = 0,
    args2 = [],
    subType3 = 202,
    args3 = [10,8],
    rewardItem = [{221,80}]
    };
getRow(63)->
    #seven_day_aimCfg {
    id = 63,
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
    rewardCoin = [{6,150}]
    };
getRow(64)->
    #seven_day_aimCfg {
    id = 64,
    day = 4,
    type = 1,
    name = "每日福利",
    show = "主角到达35级",
    preview = 2,
    subType1 = 0,
    args1 = [],
    subType2 = 101,
    args2 = [35],
    subType3 = 0,
    args3 = [],
    rewardCoin = [{1,300000}]
    };
getRow(65)->
    #seven_day_aimCfg {
    id = 65,
    day = 4,
    type = 1,
    name = "每日福利",
    show = "主角到达37级",
    preview = 0,
    subType1 = 0,
    args1 = [],
    subType2 = 101,
    args2 = [37],
    subType3 = 0,
    args3 = [],
    rewardCoin = [{1,350000}]
    };
getRow(66)->
    #seven_day_aimCfg {
    id = 66,
    day = 4,
    type = 2,
    name = "属性附魔",
    show = "1个部位附魔精度到达400",
    preview = 3,
    subType1 = 0,
    args1 = [],
    subType2 = 0,
    args2 = [],
    subType3 = 210,
    args3 = [400,1],
    rewardItem = [{240,5}]
    };
getRow(67)->
    #seven_day_aimCfg {
    id = 67,
    day = 4,
    type = 2,
    name = "属性附魔",
    show = "4个部位附魔精度到达400",
    preview = 0,
    subType1 = 0,
    args1 = [],
    subType2 = 0,
    args2 = [],
    subType3 = 210,
    args3 = [400,4],
    rewardItem = [{240,8}]
    };
getRow(68)->
    #seven_day_aimCfg {
    id = 68,
    day = 4,
    type = 2,
    name = "属性附魔",
    show = "8个部位附魔精度到达400",
    preview = 0,
    subType1 = 0,
    args1 = [],
    subType2 = 0,
    args2 = [],
    subType3 = 210,
    args3 = [400,8],
    rewardItem = [{240,12}]
    };
getRow(69)->
    #seven_day_aimCfg {
    id = 69,
    day = 4,
    type = 2,
    name = "属性附魔",
    show = "8个部位附魔精度到达600",
    preview = 0,
    subType1 = 0,
    args1 = [],
    subType2 = 0,
    args2 = [],
    subType3 = 210,
    args3 = [600,8],
    rewardItem = [{240,16}]
    };
getRow(70)->
    #seven_day_aimCfg {
    id = 70,
    day = 4,
    type = 2,
    name = "属性附魔",
    show = "8个部位附魔精度到达800",
    preview = 0,
    subType1 = 0,
    args1 = [],
    subType2 = 0,
    args2 = [],
    subType3 = 210,
    args3 = [800,8],
    rewardItem = [{240,20}]
    };
getRow(71)->
    #seven_day_aimCfg {
    id = 71,
    day = 4,
    type = 2,
    name = "属性附魔",
    show = "8个部位附魔精度到达1000",
    preview = 0,
    subType1 = 0,
    args1 = [],
    subType2 = 0,
    args2 = [],
    subType3 = 210,
    args3 = [1000,8],
    rewardItem = [{240,24}]
    };
getRow(72)->
    #seven_day_aimCfg {
    id = 72,
    day = 4,
    type = 2,
    name = "属性附魔",
    show = "8个部位附魔精度到达1200",
    preview = 0,
    subType1 = 0,
    args1 = [],
    subType2 = 0,
    args2 = [],
    subType3 = 210,
    args3 = [1200,8],
    rewardItem = [{240,28}]
    };
getRow(73)->
    #seven_day_aimCfg {
    id = 73,
    day = 4,
    type = 2,
    name = "属性附魔",
    show = "8个部位附魔精度到达1400",
    preview = 0,
    subType1 = 0,
    args1 = [],
    subType2 = 0,
    args2 = [],
    subType3 = 210,
    args3 = [1400,8],
    rewardItem = [{240,32}]
    };
getRow(74)->
    #seven_day_aimCfg {
    id = 74,
    day = 4,
    type = 2,
    name = "属性附魔",
    show = "8个部位附魔精度到达1600",
    preview = 0,
    subType1 = 0,
    args1 = [],
    subType2 = 0,
    args2 = [],
    subType3 = 210,
    args3 = [1600,8],
    rewardItem = [{240,40}]
    };
getRow(75)->
    #seven_day_aimCfg {
    id = 75,
    day = 4,
    type = 2,
    name = "属性附魔",
    show = "8个部位附魔精度到达1800",
    preview = 0,
    subType1 = 0,
    args1 = [],
    subType2 = 0,
    args2 = [],
    subType3 = 210,
    args3 = [1800,8],
    rewardItem = [{240,60}]
    };
getRow(76)->
    #seven_day_aimCfg {
    id = 76,
    day = 4,
    type = 3,
    name = "守护女神",
    show = "成功通关守护女神第1关",
    preview = 4,
    subType1 = 3,
    args1 = [190],
    subType2 = 0,
    args2 = [],
    subType3 = 0,
    args3 = [],
    rewardItem = [{261,20}]
    };
getRow(77)->
    #seven_day_aimCfg {
    id = 77,
    day = 4,
    type = 3,
    name = "守护女神",
    show = "成功通关守护女神第2关",
    preview = 0,
    subType1 = 3,
    args1 = [191],
    subType2 = 0,
    args2 = [],
    subType3 = 0,
    args3 = [],
    rewardItem = [{261,30}]
    };
getRow(78)->
    #seven_day_aimCfg {
    id = 78,
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
    rewardCoin = [{6,200}]
    };
getRow(79)->
    #seven_day_aimCfg {
    id = 79,
    day = 5,
    type = 1,
    name = "每日福利",
    show = "主角到达38级",
    preview = 2,
    subType1 = 0,
    args1 = [],
    subType2 = 101,
    args2 = [38],
    subType3 = 0,
    args3 = [],
    rewardCoin = [{1,360000}]
    };
getRow(80)->
    #seven_day_aimCfg {
    id = 80,
    day = 5,
    type = 1,
    name = "每日福利",
    show = "主角到达40级",
    preview = 0,
    subType1 = 0,
    args1 = [],
    subType2 = 101,
    args2 = [40],
    subType3 = 0,
    args3 = [],
    rewardCoin = [{1,400000}]
    };
getRow(81)->
    #seven_day_aimCfg {
    id = 81,
    day = 5,
    type = 2,
    name = "骑宠升星",
    show = "1只骑宠升星到黄色2星",
    preview = 0,
    subType1 = 0,
    args1 = [],
    subType2 = 0,
    args2 = [],
    subType3 = 207,
    args3 = [2,1],
    rewardItem = [{2160,4}]
    };
getRow(82)->
    #seven_day_aimCfg {
    id = 82,
    day = 5,
    type = 2,
    name = "骑宠升星",
    show = "1只骑宠升星到黄色5星",
    preview = 0,
    subType1 = 0,
    args1 = [],
    subType2 = 0,
    args2 = [],
    subType3 = 207,
    args3 = [5,1],
    rewardItem = [{2160,6}]
    };
getRow(83)->
    #seven_day_aimCfg {
    id = 83,
    day = 5,
    type = 2,
    name = "骑宠升星",
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
getRow(84)->
    #seven_day_aimCfg {
    id = 84,
    day = 5,
    type = 2,
    name = "骑宠升星",
    show = "1只骑宠升星到绿色5星",
    preview = 0,
    subType1 = 0,
    args1 = [],
    subType2 = 0,
    args2 = [],
    subType3 = 207,
    args3 = [10,1],
    rewardItem = [{2160,10}]
    };
getRow(85)->
    #seven_day_aimCfg {
    id = 85,
    day = 5,
    type = 2,
    name = "骑宠升星",
    show = "1只骑宠升星到蓝色1星",
    preview = 0,
    subType1 = 0,
    args1 = [],
    subType2 = 0,
    args2 = [],
    subType3 = 207,
    args3 = [11,1],
    rewardItem = [{2160,12}]
    };
getRow(86)->
    #seven_day_aimCfg {
    id = 86,
    day = 5,
    type = 2,
    name = "骑宠升星",
    show = "1只骑宠升星到蓝色5星",
    preview = 0,
    subType1 = 0,
    args1 = [],
    subType2 = 0,
    args2 = [],
    subType3 = 207,
    args3 = [15,1],
    rewardItem = [{2160,14}]
    };
getRow(87)->
    #seven_day_aimCfg {
    id = 87,
    day = 5,
    type = 2,
    name = "骑宠升星",
    show = "1只骑宠升星到红色1星",
    preview = 0,
    subType1 = 0,
    args1 = [],
    subType2 = 0,
    args2 = [],
    subType3 = 207,
    args3 = [16,1],
    rewardItem = [{2160,16}]
    };
getRow(88)->
    #seven_day_aimCfg {
    id = 88,
    day = 5,
    type = 2,
    name = "骑宠升星",
    show = "1只骑宠升星到红色5星",
    preview = 0,
    subType1 = 0,
    args1 = [],
    subType2 = 0,
    args2 = [],
    subType3 = 207,
    args3 = [20,1],
    rewardItem = [{2160,18}]
    };
getRow(89)->
    #seven_day_aimCfg {
    id = 89,
    day = 5,
    type = 2,
    name = "骑宠升星",
    show = "1只骑宠升星到紫色1星",
    preview = 0,
    subType1 = 0,
    args1 = [],
    subType2 = 0,
    args2 = [],
    subType3 = 207,
    args3 = [21,1],
    rewardItem = [{2160,25}]
    };
getRow(90)->
    #seven_day_aimCfg {
    id = 90,
    day = 5,
    type = 2,
    name = "骑宠升星",
    show = "1只骑宠升星到紫色5星",
    preview = 0,
    subType1 = 0,
    args1 = [],
    subType2 = 0,
    args2 = [],
    subType3 = 207,
    args3 = [25,1],
    rewardItem = [{2160,40}]
    };
getRow(91)->
    #seven_day_aimCfg {
    id = 91,
    day = 5,
    type = 2,
    name = "骑宠升星",
    show = "1只骑宠升星到黄色1月",
    preview = 0,
    subType1 = 0,
    args1 = [],
    subType2 = 0,
    args2 = [],
    subType3 = 207,
    args3 = [26,1],
    rewardItem = [{2160,55}]
    };
getRow(92)->
    #seven_day_aimCfg {
    id = 92,
    day = 5,
    type = 2,
    name = "骑宠升星",
    show = "1只骑宠升星到黄色5月",
    preview = 0,
    subType1 = 0,
    args1 = [],
    subType2 = 0,
    args2 = [],
    subType3 = 207,
    args3 = [30,1],
    rewardItem = [{2160,70}]
    };
getRow(93)->
    #seven_day_aimCfg {
    id = 93,
    day = 5,
    type = 3,
    name = "骑宠转生",
    show = "1个骑宠转生到1转",
    preview = 4,
    subType1 = 0,
    args1 = [],
    subType2 = 0,
    args2 = [],
    subType3 = 208,
    args3 = [1,1],
    rewardItem = [{1801,10}]
    };
getRow(94)->
    #seven_day_aimCfg {
    id = 94,
    day = 5,
    type = 3,
    name = "骑宠转生",
    show = "2个骑宠转生到1转",
    preview = 0,
    subType1 = 0,
    args1 = [],
    subType2 = 0,
    args2 = [],
    subType3 = 208,
    args3 = [1,2],
    rewardItem = [{1801,15}]
    };
getRow(95)->
    #seven_day_aimCfg {
    id = 95,
    day = 5,
    type = 3,
    name = "骑宠转生",
    show = "1个骑宠转生到2转",
    preview = 0,
    subType1 = 0,
    args1 = [],
    subType2 = 0,
    args2 = [],
    subType3 = 208,
    args3 = [2,1],
    rewardItem = [{1801,20}]
    };
getRow(96)->
    #seven_day_aimCfg {
    id = 96,
    day = 5,
    type = 3,
    name = "骑宠转生",
    show = "2个骑宠转生到2转",
    preview = 0,
    subType1 = 0,
    args1 = [],
    subType2 = 0,
    args2 = [],
    subType3 = 208,
    args3 = [2,2],
    rewardItem = [{1800,5}]
    };
getRow(97)->
    #seven_day_aimCfg {
    id = 97,
    day = 5,
    type = 3,
    name = "骑宠转生",
    show = "1个骑宠转生到3转",
    preview = 0,
    subType1 = 0,
    args1 = [],
    subType2 = 0,
    args2 = [],
    subType3 = 208,
    args3 = [3,1],
    rewardItem = [{1800,10}]
    };
getRow(98)->
    #seven_day_aimCfg {
    id = 98,
    day = 5,
    type = 3,
    name = "骑宠转生",
    show = "2个骑宠转生到3转",
    preview = 0,
    subType1 = 0,
    args1 = [],
    subType2 = 0,
    args2 = [],
    subType3 = 208,
    args3 = [3,2],
    rewardItem = [{1800,15}]
    };
getRow(99)->
    #seven_day_aimCfg {
    id = 99,
    day = 5,
    type = 3,
    name = "骑宠转生",
    show = "3个骑宠转生到3转",
    preview = 0,
    subType1 = 0,
    args1 = [],
    subType2 = 0,
    args2 = [],
    subType3 = 208,
    args3 = [3,3],
    rewardItem = [{1800,20}]
    };
getRow(100)->
    #seven_day_aimCfg {
    id = 100,
    day = 5,
    type = 3,
    name = "骑宠转生",
    show = "1个骑宠转生到4转",
    preview = 0,
    subType1 = 0,
    args1 = [],
    subType2 = 0,
    args2 = [],
    subType3 = 208,
    args3 = [4,1],
    rewardItem = [{1800,20}]
    };
getRow(101)->
    #seven_day_aimCfg {
    id = 101,
    day = 5,
    type = 3,
    name = "骑宠转生",
    show = "1个骑宠转生到5转",
    preview = 0,
    subType1 = 0,
    args1 = [],
    subType2 = 0,
    args2 = [],
    subType3 = 208,
    args3 = [5,1],
    rewardItem = [{1800,30}]
    };
getRow(102)->
    #seven_day_aimCfg {
    id = 102,
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
    rewardCoin = [{6,250}]
    };
getRow(103)->
    #seven_day_aimCfg {
    id = 103,
    day = 6,
    type = 1,
    name = "每日福利",
    show = "主角到达41级",
    preview = 2,
    subType1 = 0,
    args1 = [],
    subType2 = 101,
    args2 = [41],
    subType3 = 0,
    args3 = [],
    rewardCoin = [{1,450000}]
    };
getRow(104)->
    #seven_day_aimCfg {
    id = 104,
    day = 6,
    type = 1,
    name = "每日福利",
    show = "主角到达43级",
    preview = 0,
    subType1 = 0,
    args1 = [],
    subType2 = 101,
    args2 = [43],
    subType3 = 0,
    args3 = [],
    rewardCoin = [{1,480000}]
    };
getRow(105)->
    #seven_day_aimCfg {
    id = 105,
    day = 6,
    type = 2,
    name = "骑宠大联盟",
    show = "拥有骑宠数量达到2个",
    preview = 3,
    subType1 = 0,
    args1 = [],
    subType2 = 102,
    args2 = [-1,2],
    subType3 = 0,
    args3 = [],
    rewardItem = [{1801,15}]
    };
getRow(106)->
    #seven_day_aimCfg {
    id = 106,
    day = 6,
    type = 2,
    name = "骑宠大联盟",
    show = "拥有骑宠数量达到5个",
    preview = 0,
    subType1 = 0,
    args1 = [],
    subType2 = 102,
    args2 = [-1,5],
    subType3 = 0,
    args3 = [],
    rewardItem = [{1801,30}]
    };
getRow(107)->
    #seven_day_aimCfg {
    id = 107,
    day = 6,
    type = 2,
    name = "骑宠大联盟",
    show = "拥有骑宠数量达到10个",
    preview = 0,
    subType1 = 0,
    args1 = [],
    subType2 = 102,
    args2 = [-1,10],
    subType3 = 0,
    args3 = [],
    rewardItem = [{1801,45}]
    };
getRow(108)->
    #seven_day_aimCfg {
    id = 108,
    day = 6,
    type = 2,
    name = "骑宠大联盟",
    show = "拥有骑宠数量达到20个",
    preview = 0,
    subType1 = 0,
    args1 = [],
    subType2 = 102,
    args2 = [-1,20],
    subType3 = 0,
    args3 = [],
    rewardItem = [{1800,15}]
    };
getRow(109)->
    #seven_day_aimCfg {
    id = 109,
    day = 6,
    type = 3,
    name = "时装收集",
    show = "拥有时装第1件",
    preview = 0,
    subType1 = 0,
    args1 = [],
    subType2 = 103,
    args2 = [1],
    subType3 = 0,
    args3 = [],
    rewardItem = [{2601,5}]
    };
getRow(110)->
    #seven_day_aimCfg {
    id = 110,
    day = 6,
    type = 3,
    name = "时装收集",
    show = "拥有时装第3件",
    preview = 0,
    subType1 = 0,
    args1 = [],
    subType2 = 103,
    args2 = [3],
    subType3 = 0,
    args3 = [],
    rewardItem = [{2601,8}]
    };
getRow(111)->
    #seven_day_aimCfg {
    id = 111,
    day = 6,
    type = 3,
    name = "时装收集",
    show = "拥有时装第5件",
    preview = 0,
    subType1 = 0,
    args1 = [],
    subType2 = 103,
    args2 = [5],
    subType3 = 0,
    args3 = [],
    rewardItem = [{2601,10}]
    };
getRow(112)->
    #seven_day_aimCfg {
    id = 112,
    day = 6,
    type = 3,
    name = "时装收集",
    show = "拥有时装第10件",
    preview = 0,
    subType1 = 0,
    args1 = [],
    subType2 = 103,
    args2 = [10],
    subType3 = 0,
    args3 = [],
    rewardItem = [{2601,15}]
    };
getRow(113)->
    #seven_day_aimCfg {
    id = 113,
    day = 6,
    type = 3,
    name = "时装收集",
    show = "拥有时装第15件",
    preview = 0,
    subType1 = 0,
    args1 = [],
    subType2 = 103,
    args2 = [15],
    subType3 = 0,
    args3 = [],
    rewardItem = [{2601,20}]
    };
getRow(114)->
    #seven_day_aimCfg {
    id = 114,
    day = 6,
    type = 3,
    name = "时装收集",
    show = "拥有时装第20件",
    preview = 0,
    subType1 = 0,
    args1 = [],
    subType2 = 103,
    args2 = [20],
    subType3 = 0,
    args3 = [],
    rewardItem = [{2601,30}]
    };
getRow(115)->
    #seven_day_aimCfg {
    id = 115,
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
    rewardCoin = [{6,300}]
    };
getRow(116)->
    #seven_day_aimCfg {
    id = 116,
    day = 7,
    type = 1,
    name = "每日福利",
    show = "战斗力达到100000",
    preview = 2,
    subType1 = 0,
    args1 = [],
    subType2 = 104,
    args2 = [100000],
    subType3 = 0,
    args3 = [],
    rewardCoin = [{1,600000}]
    };
getRow(117)->
    #seven_day_aimCfg {
    id = 117,
    day = 7,
    type = 1,
    name = "每日福利",
    show = "战斗力达到150000",
    preview = 0,
    subType1 = 0,
    args1 = [],
    subType2 = 104,
    args2 = [150000],
    subType3 = 0,
    args3 = [],
    rewardCoin = [{1,650000}]
    };
getRow(118)->
    #seven_day_aimCfg {
    id = 118,
    day = 7,
    type = 2,
    name = "纹章收集",
    show = "镶嵌1个2级纹章",
    preview = 3,
    subType1 = 0,
    args1 = [],
    subType2 = 0,
    args2 = [],
    subType3 = 203,
    args3 = [2,1],
    rewardItem = [{271,1}]
    };
getRow(119)->
    #seven_day_aimCfg {
    id = 119,
    day = 7,
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
getRow(120)->
    #seven_day_aimCfg {
    id = 120,
    day = 7,
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
    rewardItem = [{272,2}]
    };
getRow(121)->
    #seven_day_aimCfg {
    id = 121,
    day = 7,
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
getRow(122)->
    #seven_day_aimCfg {
    id = 122,
    day = 7,
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
getRow(123)->
    #seven_day_aimCfg {
    id = 123,
    day = 7,
    type = 3,
    name = "拥有装备",
    show = "拥有红色品质装备2件",
    preview = 4,
    subType1 = 0,
    args1 = [],
    subType2 = 106,
    args2 = [3,2],
    subType3 = 0,
    args3 = [],
    rewardCoin = [{7,2000}]
    };
getRow(124)->
    #seven_day_aimCfg {
    id = 124,
    day = 7,
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
    rewardCoin = [{7,4000}]
    };
getRow(125)->
    #seven_day_aimCfg {
    id = 125,
    day = 7,
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
    rewardCoin = [{7,6000}]
    };
getRow(126)->
    #seven_day_aimCfg {
    id = 126,
    day = 7,
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
    rewardCoin = [{7,10000}]
    };
getRow(127)->
    #seven_day_aimCfg {
    id = 127,
    day = 7,
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
    rewardCoin = [{7,10000}]
    };
getRow(128)->
    #seven_day_aimCfg {
    id = 128,
    day = 7,
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
    rewardCoin = [{7,15000}]
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
    {128}
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
    128
    ].

