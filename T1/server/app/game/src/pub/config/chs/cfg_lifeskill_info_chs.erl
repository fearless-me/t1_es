%% coding: latin-1
%%: 实现
-module(cfg_lifeskill_info_chs).
-compile(export_all).
-include("cfg_lifeskill_info.hrl").
-include("logger.hrl").

getRow(1)->
    #lifeskill_infoCfg {
    poolid = 1,
    item_id = 24300,
    skillname = "1级钓鱼产出",
    get_weight = 1000,
    energy_cost = 2,
    get_way = [1,0],
    get_num = [1,1],
    get_exp = 20,
    reward = [{14166,1,1,75},{14167,1,1,75},{14190,1,1,150}],
    stuff = [],
    coin_cost = [],
    target = [5421],
    type = 1,
    level = 1,
    ifshow = 1
    };
getRow(2)->
    #lifeskill_infoCfg {
    poolid = 2,
    item_id = 24301,
    skillname = "1级钓鱼产出",
    get_weight = 1000,
    energy_cost = 2,
    get_way = [1,0],
    get_num = [1,1],
    get_exp = 20,
    reward = [{14166,1,1,75},{14167,1,1,75},{14190,1,1,150}],
    stuff = [],
    coin_cost = [],
    target = [5421],
    type = 1,
    level = 1,
    ifshow = 1
    };
getRow(3)->
    #lifeskill_infoCfg {
    poolid = 3,
    item_id = 24302,
    skillname = "1级钓鱼产出",
    get_weight = 1000,
    energy_cost = 2,
    get_way = [1,0],
    get_num = [1,1],
    get_exp = 20,
    reward = [{14168,1,1,150},{14169,1,1,150}],
    stuff = [],
    coin_cost = [],
    target = [5421],
    type = 1,
    level = 1,
    ifshow = 1
    };
getRow(4)->
    #lifeskill_infoCfg {
    poolid = 4,
    item_id = 24303,
    skillname = "2级钓鱼产出",
    get_weight = 3000,
    energy_cost = 2,
    get_way = [1,0],
    get_num = [1,1],
    get_exp = 30,
    reward = [{14166,1,1,87},{14167,1,1,87},{14190,1,1,175}],
    stuff = [],
    coin_cost = [],
    target = [5421],
    type = 1,
    level = 2,
    ifshow = 1
    };
getRow(5)->
    #lifeskill_infoCfg {
    poolid = 5,
    item_id = 24304,
    skillname = "2级钓鱼产出",
    get_weight = 3000,
    energy_cost = 2,
    get_way = [1,0],
    get_num = [1,1],
    get_exp = 30,
    reward = [{14166,1,1,87},{14167,1,1,87},{14190,1,1,175}],
    stuff = [],
    coin_cost = [],
    target = [5421],
    type = 1,
    level = 2,
    ifshow = 1
    };
getRow(6)->
    #lifeskill_infoCfg {
    poolid = 6,
    item_id = 24305,
    skillname = "2级钓鱼产出",
    get_weight = 3000,
    energy_cost = 2,
    get_way = [1,0],
    get_num = [1,1],
    get_exp = 30,
    reward = [{14168,1,1,175},{14169,1,1,175}],
    stuff = [],
    coin_cost = [],
    target = [5421],
    type = 1,
    level = 2,
    ifshow = 1
    };
getRow(7)->
    #lifeskill_infoCfg {
    poolid = 7,
    item_id = 24306,
    skillname = "3级钓鱼产出",
    get_weight = 8000,
    energy_cost = 2,
    get_way = [1,0],
    get_num = [1,1],
    get_exp = 40,
    reward = [{14166,1,1,100},{14167,1,1,100},{14190,1,1,200}],
    stuff = [],
    coin_cost = [],
    target = [5421],
    type = 1,
    level = 3,
    ifshow = 1
    };
getRow(8)->
    #lifeskill_infoCfg {
    poolid = 8,
    item_id = 24307,
    skillname = "3级钓鱼产出",
    get_weight = 8000,
    energy_cost = 2,
    get_way = [1,0],
    get_num = [1,1],
    get_exp = 40,
    reward = [{14166,1,1,100},{14167,1,1,100},{14190,1,1,200}],
    stuff = [],
    coin_cost = [],
    target = [5421],
    type = 1,
    level = 3,
    ifshow = 1
    };
getRow(9)->
    #lifeskill_infoCfg {
    poolid = 9,
    item_id = 24308,
    skillname = "3级钓鱼产出",
    get_weight = 8000,
    energy_cost = 2,
    get_way = [1,0],
    get_num = [1,1],
    get_exp = 40,
    reward = [{14168,1,1,200},{14169,1,1,200}],
    stuff = [],
    coin_cost = [],
    target = [5421],
    type = 1,
    level = 3,
    ifshow = 1
    };
getRow(10)->
    #lifeskill_infoCfg {
    poolid = 10,
    item_id = 24309,
    skillname = "4级钓鱼产出",
    get_weight = 17000,
    energy_cost = 2,
    get_way = [1,0],
    get_num = [1,1],
    get_exp = 50,
    reward = [{14166,1,1,130},{14167,1,1,130},{14190,1,1,260}],
    stuff = [],
    coin_cost = [],
    target = [5421],
    type = 1,
    level = 4,
    ifshow = 1
    };
getRow(11)->
    #lifeskill_infoCfg {
    poolid = 11,
    item_id = 24310,
    skillname = "4级钓鱼产出",
    get_weight = 17000,
    energy_cost = 2,
    get_way = [1,0],
    get_num = [1,1],
    get_exp = 50,
    reward = [{14166,1,1,130},{14167,1,1,130},{14190,1,1,260}],
    stuff = [],
    coin_cost = [],
    target = [5421],
    type = 1,
    level = 4,
    ifshow = 1
    };
getRow(12)->
    #lifeskill_infoCfg {
    poolid = 12,
    item_id = 24311,
    skillname = "4级钓鱼产出",
    get_weight = 17000,
    energy_cost = 2,
    get_way = [1,0],
    get_num = [1,1],
    get_exp = 50,
    reward = [{14168,1,1,130},{14169,1,1,130},{26213,1,1,260}],
    stuff = [],
    coin_cost = [],
    target = [5421],
    type = 1,
    level = 4,
    ifshow = 1
    };
getRow(13)->
    #lifeskill_infoCfg {
    poolid = 13,
    item_id = 24312,
    skillname = "5级钓鱼产出",
    get_weight = 29000,
    energy_cost = 2,
    get_way = [1,0],
    get_num = [1,1],
    get_exp = 60,
    reward = [{14166,1,1,350},{14167,1,1,350}],
    stuff = [],
    coin_cost = [],
    target = [5421],
    type = 1,
    level = 5,
    ifshow = 1
    };
getRow(14)->
    #lifeskill_infoCfg {
    poolid = 14,
    item_id = 24313,
    skillname = "5级钓鱼产出",
    get_weight = 29000,
    energy_cost = 2,
    get_way = [1,0],
    get_num = [1,1],
    get_exp = 60,
    reward = [{14190,1,1,700}],
    stuff = [],
    coin_cost = [],
    target = [5421],
    type = 1,
    level = 5,
    ifshow = 1
    };
getRow(15)->
    #lifeskill_infoCfg {
    poolid = 15,
    item_id = 24400,
    skillname = "1级狩猎",
    get_weight = 1000,
    energy_cost = 4,
    get_way = [3,4000],
    get_num = [2,2],
    get_exp = 40,
    reward = [],
    stuff = [],
    coin_cost = [],
    target = [],
    type = 2,
    level = 1,
    ifshow = 1
    };
getRow(16)->
    #lifeskill_infoCfg {
    poolid = 16,
    item_id = 24401,
    skillname = "1级狩猎",
    get_weight = 1000,
    energy_cost = 4,
    get_way = [3,4001],
    get_num = [2,2],
    get_exp = 40,
    reward = [],
    stuff = [],
    coin_cost = [],
    target = [],
    type = 2,
    level = 1,
    ifshow = 1
    };
getRow(17)->
    #lifeskill_infoCfg {
    poolid = 17,
    item_id = 24402,
    skillname = "1级狩猎",
    get_weight = 1000,
    energy_cost = 4,
    get_way = [3,4002],
    get_num = [2,2],
    get_exp = 40,
    reward = [],
    stuff = [],
    coin_cost = [],
    target = [],
    type = 2,
    level = 1,
    ifshow = 1
    };
getRow(18)->
    #lifeskill_infoCfg {
    poolid = 18,
    item_id = 24403,
    skillname = "2级狩猎",
    get_weight = 1000,
    energy_cost = 4,
    get_way = [3,4003],
    get_num = [2,2],
    get_exp = 60,
    reward = [],
    stuff = [],
    coin_cost = [],
    target = [],
    type = 2,
    level = 2,
    ifshow = 1
    };
getRow(19)->
    #lifeskill_infoCfg {
    poolid = 19,
    item_id = 24404,
    skillname = "2级狩猎",
    get_weight = 1000,
    energy_cost = 4,
    get_way = [3,4004],
    get_num = [2,2],
    get_exp = 60,
    reward = [],
    stuff = [],
    coin_cost = [],
    target = [],
    type = 2,
    level = 2,
    ifshow = 1
    };
getRow(20)->
    #lifeskill_infoCfg {
    poolid = 20,
    item_id = 24405,
    skillname = "2级狩猎",
    get_weight = 1000,
    energy_cost = 4,
    get_way = [3,4005],
    get_num = [2,2],
    get_exp = 60,
    reward = [],
    stuff = [],
    coin_cost = [],
    target = [],
    type = 2,
    level = 2,
    ifshow = 1
    };
getRow(21)->
    #lifeskill_infoCfg {
    poolid = 21,
    item_id = 24406,
    skillname = "2级狩猎",
    get_weight = 1000,
    energy_cost = 4,
    get_way = [3,4006],
    get_num = [2,2],
    get_exp = 60,
    reward = [],
    stuff = [],
    coin_cost = [],
    target = [],
    type = 2,
    level = 2,
    ifshow = 1
    };
getRow(22)->
    #lifeskill_infoCfg {
    poolid = 22,
    item_id = 24407,
    skillname = "3级狩猎",
    get_weight = 1000,
    energy_cost = 4,
    get_way = [3,4007],
    get_num = [2,2],
    get_exp = 80,
    reward = [],
    stuff = [],
    coin_cost = [],
    target = [],
    type = 2,
    level = 3,
    ifshow = 1
    };
getRow(23)->
    #lifeskill_infoCfg {
    poolid = 23,
    item_id = 24408,
    skillname = "3级狩猎",
    get_weight = 1000,
    energy_cost = 4,
    get_way = [3,4008],
    get_num = [2,2],
    get_exp = 80,
    reward = [],
    stuff = [],
    coin_cost = [],
    target = [],
    type = 2,
    level = 3,
    ifshow = 1
    };
getRow(24)->
    #lifeskill_infoCfg {
    poolid = 24,
    item_id = 24409,
    skillname = "3级狩猎",
    get_weight = 1000,
    energy_cost = 4,
    get_way = [3,4009],
    get_num = [2,2],
    get_exp = 80,
    reward = [],
    stuff = [],
    coin_cost = [],
    target = [],
    type = 2,
    level = 3,
    ifshow = 1
    };
getRow(25)->
    #lifeskill_infoCfg {
    poolid = 25,
    item_id = 24410,
    skillname = "3级狩猎",
    get_weight = 1000,
    energy_cost = 4,
    get_way = [3,4010],
    get_num = [2,2],
    get_exp = 80,
    reward = [],
    stuff = [],
    coin_cost = [],
    target = [],
    type = 2,
    level = 3,
    ifshow = 1
    };
getRow(26)->
    #lifeskill_infoCfg {
    poolid = 26,
    item_id = 24411,
    skillname = "3级狩猎",
    get_weight = 1000,
    energy_cost = 4,
    get_way = [3,4011],
    get_num = [2,2],
    get_exp = 80,
    reward = [],
    stuff = [],
    coin_cost = [],
    target = [],
    type = 2,
    level = 3,
    ifshow = 1
    };
getRow(27)->
    #lifeskill_infoCfg {
    poolid = 27,
    item_id = 24412,
    skillname = "4级狩猎",
    get_weight = 1000,
    energy_cost = 4,
    get_way = [3,4012],
    get_num = [2,2],
    get_exp = 100,
    reward = [],
    stuff = [],
    coin_cost = [],
    target = [],
    type = 2,
    level = 4,
    ifshow = 1
    };
getRow(28)->
    #lifeskill_infoCfg {
    poolid = 28,
    item_id = 24413,
    skillname = "4级狩猎",
    get_weight = 1000,
    energy_cost = 4,
    get_way = [3,4013],
    get_num = [2,2],
    get_exp = 100,
    reward = [],
    stuff = [],
    coin_cost = [],
    target = [],
    type = 2,
    level = 4,
    ifshow = 1
    };
getRow(29)->
    #lifeskill_infoCfg {
    poolid = 29,
    item_id = 24414,
    skillname = "4级狩猎",
    get_weight = 1000,
    energy_cost = 4,
    get_way = [3,4014],
    get_num = [2,2],
    get_exp = 100,
    reward = [],
    stuff = [],
    coin_cost = [],
    target = [],
    type = 2,
    level = 4,
    ifshow = 1
    };
getRow(30)->
    #lifeskill_infoCfg {
    poolid = 30,
    item_id = 24415,
    skillname = "4级狩猎",
    get_weight = 1000,
    energy_cost = 4,
    get_way = [3,4015],
    get_num = [2,2],
    get_exp = 100,
    reward = [],
    stuff = [],
    coin_cost = [],
    target = [],
    type = 2,
    level = 4,
    ifshow = 1
    };
getRow(31)->
    #lifeskill_infoCfg {
    poolid = 31,
    item_id = 24416,
    skillname = "4级狩猎",
    get_weight = 1000,
    energy_cost = 4,
    get_way = [3,4016],
    get_num = [2,2],
    get_exp = 100,
    reward = [],
    stuff = [],
    coin_cost = [],
    target = [],
    type = 2,
    level = 4,
    ifshow = 1
    };
getRow(32)->
    #lifeskill_infoCfg {
    poolid = 32,
    item_id = 24417,
    skillname = "4级狩猎",
    get_weight = 1000,
    energy_cost = 4,
    get_way = [3,4017],
    get_num = [2,2],
    get_exp = 100,
    reward = [],
    stuff = [],
    coin_cost = [],
    target = [],
    type = 2,
    level = 4,
    ifshow = 1
    };
getRow(33)->
    #lifeskill_infoCfg {
    poolid = 33,
    item_id = 24418,
    skillname = "4级狩猎",
    get_weight = 1000,
    energy_cost = 4,
    get_way = [3,4018],
    get_num = [2,2],
    get_exp = 100,
    reward = [],
    stuff = [],
    coin_cost = [],
    target = [],
    type = 2,
    level = 4,
    ifshow = 1
    };
getRow(34)->
    #lifeskill_infoCfg {
    poolid = 34,
    item_id = 24419,
    skillname = "5级狩猎",
    get_weight = 1000,
    energy_cost = 4,
    get_way = [3,4019],
    get_num = [2,2],
    get_exp = 120,
    reward = [],
    stuff = [],
    coin_cost = [],
    target = [],
    type = 2,
    level = 5,
    ifshow = 1
    };
getRow(35)->
    #lifeskill_infoCfg {
    poolid = 35,
    item_id = 24420,
    skillname = "5级狩猎",
    get_weight = 1000,
    energy_cost = 4,
    get_way = [3,4020],
    get_num = [2,2],
    get_exp = 120,
    reward = [],
    stuff = [],
    coin_cost = [],
    target = [],
    type = 2,
    level = 5,
    ifshow = 1
    };
getRow(36)->
    #lifeskill_infoCfg {
    poolid = 36,
    item_id = 24421,
    skillname = "5级狩猎",
    get_weight = 1000,
    energy_cost = 4,
    get_way = [3,4021],
    get_num = [2,2],
    get_exp = 120,
    reward = [],
    stuff = [],
    coin_cost = [],
    target = [],
    type = 2,
    level = 5,
    ifshow = 1
    };
getRow(37)->
    #lifeskill_infoCfg {
    poolid = 37,
    item_id = 24422,
    skillname = "5级狩猎",
    get_weight = 1000,
    energy_cost = 4,
    get_way = [3,4022],
    get_num = [2,2],
    get_exp = 120,
    reward = [],
    stuff = [],
    coin_cost = [],
    target = [],
    type = 2,
    level = 5,
    ifshow = 1
    };
getRow(38)->
    #lifeskill_infoCfg {
    poolid = 38,
    item_id = 24423,
    skillname = "5级狩猎",
    get_weight = 1000,
    energy_cost = 4,
    get_way = [3,4023],
    get_num = [2,2],
    get_exp = 120,
    reward = [],
    stuff = [],
    coin_cost = [],
    target = [],
    type = 2,
    level = 5,
    ifshow = 1
    };
getRow(39)->
    #lifeskill_infoCfg {
    poolid = 39,
    item_id = 24424,
    skillname = "5级狩猎",
    get_weight = 1000,
    energy_cost = 4,
    get_way = [3,4024],
    get_num = [2,2],
    get_exp = 120,
    reward = [],
    stuff = [],
    coin_cost = [],
    target = [],
    type = 2,
    level = 5,
    ifshow = 1
    };
getRow(40)->
    #lifeskill_infoCfg {
    poolid = 40,
    item_id = 24500,
    skillname = "1级采矿",
    get_weight = 1000,
    energy_cost = 2,
    get_way = [1,0],
    get_num = [1,1],
    get_exp = 20,
    reward = [{903,1,1,40}],
    stuff = [],
    coin_cost = [],
    target = [5500,5501,5502],
    type = 3,
    level = 1,
    ifshow = 1
    };
getRow(41)->
    #lifeskill_infoCfg {
    poolid = 41,
    item_id = 24501,
    skillname = "1级采矿",
    get_weight = 1000,
    energy_cost = 2,
    get_way = [1,0],
    get_num = [1,1],
    get_exp = 20,
    reward = [{903,1,1,40}],
    stuff = [],
    coin_cost = [],
    target = [5500,5501,5502],
    type = 3,
    level = 1,
    ifshow = 1
    };
getRow(42)->
    #lifeskill_infoCfg {
    poolid = 42,
    item_id = 24502,
    skillname = "1级采矿",
    get_weight = 1000,
    energy_cost = 2,
    get_way = [1,0],
    get_num = [1,1],
    get_exp = 20,
    reward = [{903,1,1,40}],
    stuff = [],
    coin_cost = [],
    target = [5500,5501,5502],
    type = 3,
    level = 1,
    ifshow = 1
    };
getRow(43)->
    #lifeskill_infoCfg {
    poolid = 43,
    item_id = 24503,
    skillname = "2级采矿",
    get_weight = 3000,
    energy_cost = 2,
    get_way = [1,0],
    get_num = [1,1],
    get_exp = 30,
    reward = [{903,1,1,40}],
    stuff = [],
    coin_cost = [],
    target = [5503,5504,5505],
    type = 3,
    level = 2,
    ifshow = 1
    };
getRow(44)->
    #lifeskill_infoCfg {
    poolid = 44,
    item_id = 24504,
    skillname = "2级采矿",
    get_weight = 3000,
    energy_cost = 2,
    get_way = [1,0],
    get_num = [1,1],
    get_exp = 30,
    reward = [{903,1,1,40}],
    stuff = [],
    coin_cost = [],
    target = [5503,5504,5505],
    type = 3,
    level = 2,
    ifshow = 1
    };
getRow(45)->
    #lifeskill_infoCfg {
    poolid = 45,
    item_id = 24505,
    skillname = "2级采矿",
    get_weight = 3000,
    energy_cost = 2,
    get_way = [1,0],
    get_num = [1,1],
    get_exp = 30,
    reward = [{903,1,1,40}],
    stuff = [],
    coin_cost = [],
    target = [5503,5504,5505],
    type = 3,
    level = 2,
    ifshow = 1
    };
getRow(46)->
    #lifeskill_infoCfg {
    poolid = 46,
    item_id = 24506,
    skillname = "2级采矿",
    get_weight = 3000,
    energy_cost = 2,
    get_way = [1,0],
    get_num = [1,1],
    get_exp = 30,
    reward = [{903,1,1,40}],
    stuff = [],
    coin_cost = [],
    target = [5503,5504,5505],
    type = 3,
    level = 2,
    ifshow = 1
    };
getRow(47)->
    #lifeskill_infoCfg {
    poolid = 47,
    item_id = 24507,
    skillname = "3级采矿",
    get_weight = 8000,
    energy_cost = 2,
    get_way = [1,0],
    get_num = [1,1],
    get_exp = 40,
    reward = [{903,1,1,40}],
    stuff = [],
    coin_cost = [],
    target = [5506,5507,5508],
    type = 3,
    level = 3,
    ifshow = 1
    };
getRow(48)->
    #lifeskill_infoCfg {
    poolid = 48,
    item_id = 24508,
    skillname = "3级采矿",
    get_weight = 8000,
    energy_cost = 2,
    get_way = [1,0],
    get_num = [1,1],
    get_exp = 40,
    reward = [{903,1,1,40}],
    stuff = [],
    coin_cost = [],
    target = [5506,5507,5508],
    type = 3,
    level = 3,
    ifshow = 1
    };
getRow(49)->
    #lifeskill_infoCfg {
    poolid = 49,
    item_id = 24509,
    skillname = "3级采矿",
    get_weight = 8000,
    energy_cost = 2,
    get_way = [1,0],
    get_num = [1,1],
    get_exp = 40,
    reward = [{903,1,1,40}],
    stuff = [],
    coin_cost = [],
    target = [5506,5507,5508],
    type = 3,
    level = 3,
    ifshow = 1
    };
getRow(50)->
    #lifeskill_infoCfg {
    poolid = 50,
    item_id = 24510,
    skillname = "4级采矿",
    get_weight = 17000,
    energy_cost = 2,
    get_way = [1,0],
    get_num = [1,1],
    get_exp = 50,
    reward = [{903,1,1,40}],
    stuff = [],
    coin_cost = [],
    target = [5509,5510,5511],
    type = 3,
    level = 4,
    ifshow = 1
    };
getRow(51)->
    #lifeskill_infoCfg {
    poolid = 51,
    item_id = 24511,
    skillname = "4级采矿",
    get_weight = 17000,
    energy_cost = 2,
    get_way = [1,0],
    get_num = [1,1],
    get_exp = 50,
    reward = [{903,1,1,40}],
    stuff = [],
    coin_cost = [],
    target = [5509,5510,5511],
    type = 3,
    level = 4,
    ifshow = 1
    };
getRow(52)->
    #lifeskill_infoCfg {
    poolid = 52,
    item_id = 24512,
    skillname = "4级采矿",
    get_weight = 17000,
    energy_cost = 2,
    get_way = [1,0],
    get_num = [1,1],
    get_exp = 50,
    reward = [{903,1,1,40}],
    stuff = [],
    coin_cost = [],
    target = [5509,5510,5511],
    type = 3,
    level = 4,
    ifshow = 1
    };
getRow(53)->
    #lifeskill_infoCfg {
    poolid = 53,
    item_id = 24513,
    skillname = "5级采矿",
    get_weight = 29000,
    energy_cost = 2,
    get_way = [1,0],
    get_num = [1,1],
    get_exp = 60,
    reward = [{903,1,1,40}],
    stuff = [],
    coin_cost = [],
    target = [5512,5513,5514],
    type = 3,
    level = 5,
    ifshow = 1
    };
getRow(54)->
    #lifeskill_infoCfg {
    poolid = 54,
    item_id = 24514,
    skillname = "5级采矿",
    get_weight = 29000,
    energy_cost = 2,
    get_way = [1,0],
    get_num = [1,1],
    get_exp = 60,
    reward = [{903,1,1,40}],
    stuff = [],
    coin_cost = [],
    target = [5512,5513,5514],
    type = 3,
    level = 5,
    ifshow = 1
    };
getRow(55)->
    #lifeskill_infoCfg {
    poolid = 55,
    item_id = 24515,
    skillname = "5级采矿",
    get_weight = 29000,
    energy_cost = 2,
    get_way = [1,0],
    get_num = [1,1],
    get_exp = 60,
    reward = [{903,1,1,40}],
    stuff = [],
    coin_cost = [],
    target = [5512,5513,5514],
    type = 3,
    level = 5,
    ifshow = 1
    };
getRow(56)->
    #lifeskill_infoCfg {
    poolid = 56,
    item_id = 24600,
    skillname = "1级烹饪",
    get_weight = 1000,
    energy_cost = 10,
    get_way = [2,0],
    get_num = [1,1],
    get_exp = 200,
    reward = [],
    stuff = [{24050,20}],
    coin_cost = [],
    target = [],
    type = 4,
    level = 1,
    ifshow = 1
    };
getRow(57)->
    #lifeskill_infoCfg {
    poolid = 57,
    item_id = 24601,
    skillname = "1级烹饪",
    get_weight = 1000,
    energy_cost = 10,
    get_way = [2,0],
    get_num = [1,1],
    get_exp = 200,
    reward = [],
    stuff = [{24051,10},{24402,10}],
    coin_cost = [],
    target = [],
    type = 4,
    level = 1,
    ifshow = 1
    };
getRow(58)->
    #lifeskill_infoCfg {
    poolid = 58,
    item_id = 24602,
    skillname = "1级烹饪",
    get_weight = 1000,
    energy_cost = 10,
    get_way = [2,0],
    get_num = [25,25],
    get_exp = 200,
    reward = [],
    stuff = [{24050,10},{24301,10}],
    coin_cost = [],
    target = [],
    type = 4,
    level = 1,
    ifshow = 1
    };
getRow(59)->
    #lifeskill_infoCfg {
    poolid = 59,
    item_id = 24603,
    skillname = "2级烹饪",
    get_weight = 1000,
    energy_cost = 10,
    get_way = [2,0],
    get_num = [1,1],
    get_exp = 400,
    reward = [],
    stuff = [{24053,17},{24405,7},{24303,5}],
    coin_cost = [],
    target = [],
    type = 4,
    level = 2,
    ifshow = 1
    };
getRow(60)->
    #lifeskill_infoCfg {
    poolid = 60,
    item_id = 24604,
    skillname = "2级烹饪",
    get_weight = 1000,
    energy_cost = 10,
    get_way = [2,0],
    get_num = [1,1],
    get_exp = 400,
    reward = [],
    stuff = [{24054,17},{24403,7},{24303,5}],
    coin_cost = [],
    target = [],
    type = 4,
    level = 2,
    ifshow = 1
    };
getRow(61)->
    #lifeskill_infoCfg {
    poolid = 61,
    item_id = 24605,
    skillname = "2级烹饪",
    get_weight = 1000,
    energy_cost = 10,
    get_way = [2,0],
    get_num = [40,40],
    get_exp = 400,
    reward = [],
    stuff = [{24051,17},{24304,10}],
    coin_cost = [],
    target = [],
    type = 4,
    level = 2,
    ifshow = 1
    };
getRow(62)->
    #lifeskill_infoCfg {
    poolid = 62,
    item_id = 202,
    skillname = "1级烹饪",
    get_weight = 1000,
    energy_cost = 10,
    get_way = [2,0],
    get_num = [2,2],
    get_exp = 200,
    reward = [],
    stuff = [{24300,10},{24302,10}],
    coin_cost = [],
    target = [],
    type = 4,
    level = 1,
    ifshow = 1
    };
getRow(63)->
    #lifeskill_infoCfg {
    poolid = 63,
    item_id = 24607,
    skillname = "3级烹饪",
    get_weight = 1000,
    energy_cost = 10,
    get_way = [2,0],
    get_num = [1,1],
    get_exp = 600,
    reward = [],
    stuff = [{24056,23},{24407,15}],
    coin_cost = [],
    target = [],
    type = 4,
    level = 3,
    ifshow = 1
    };
getRow(64)->
    #lifeskill_infoCfg {
    poolid = 64,
    item_id = 24608,
    skillname = "3级烹饪",
    get_weight = 1000,
    energy_cost = 10,
    get_way = [2,0],
    get_num = [1,1],
    get_exp = 600,
    reward = [],
    stuff = [{24056,23},{24408,15}],
    coin_cost = [],
    target = [],
    type = 4,
    level = 3,
    ifshow = 1
    };
getRow(65)->
    #lifeskill_infoCfg {
    poolid = 65,
    item_id = 24609,
    skillname = "3级烹饪",
    get_weight = 1000,
    energy_cost = 10,
    get_way = [2,0],
    get_num = [45,45],
    get_exp = 600,
    reward = [],
    stuff = [{24057,23},{24306,5},{24307,5}],
    coin_cost = [],
    target = [],
    type = 4,
    level = 3,
    ifshow = 1
    };
getRow(66)->
    #lifeskill_infoCfg {
    poolid = 66,
    item_id = 203,
    skillname = "3级烹饪",
    get_weight = 1000,
    energy_cost = 10,
    get_way = [2,0],
    get_num = [1,1],
    get_exp = 600,
    reward = [],
    stuff = [{24057,23},{24308,10}],
    coin_cost = [],
    target = [],
    type = 4,
    level = 3,
    ifshow = 1
    };
getRow(67)->
    #lifeskill_infoCfg {
    poolid = 67,
    item_id = 24611,
    skillname = "4级烹饪",
    get_weight = 1000,
    energy_cost = 10,
    get_way = [2,0],
    get_num = [1,1],
    get_exp = 1000,
    reward = [],
    stuff = [{24059,35},{24417,10},{24414,10}],
    coin_cost = [],
    target = [],
    type = 4,
    level = 4,
    ifshow = 1
    };
getRow(68)->
    #lifeskill_infoCfg {
    poolid = 68,
    item_id = 24612,
    skillname = "4级烹饪",
    get_weight = 1000,
    energy_cost = 10,
    get_way = [2,0],
    get_num = [1,1],
    get_exp = 1000,
    reward = [],
    stuff = [{24057,35},{24412,20}],
    coin_cost = [],
    target = [],
    type = 4,
    level = 4,
    ifshow = 1
    };
getRow(69)->
    #lifeskill_infoCfg {
    poolid = 69,
    item_id = 24613,
    skillname = "4级烹饪",
    get_weight = 1000,
    energy_cost = 10,
    get_way = [2,0],
    get_num = [60,60],
    get_exp = 1000,
    reward = [],
    stuff = [{24060,35},{24309,6},{24305,6}],
    coin_cost = [],
    target = [],
    type = 4,
    level = 4,
    ifshow = 1
    };
getRow(70)->
    #lifeskill_infoCfg {
    poolid = 70,
    item_id = 204,
    skillname = "5级烹饪",
    get_weight = 1000,
    energy_cost = 10,
    get_way = [2,0],
    get_num = [1,1],
    get_exp = 1800,
    reward = [],
    stuff = [{24062,60},{24310,8},{24421,15}],
    coin_cost = [],
    target = [],
    type = 4,
    level = 5,
    ifshow = 1
    };
getRow(71)->
    #lifeskill_infoCfg {
    poolid = 71,
    item_id = 24615,
    skillname = "5级烹饪",
    get_weight = 1000,
    energy_cost = 10,
    get_way = [2,0],
    get_num = [1,1],
    get_exp = 1800,
    reward = [],
    stuff = [{24062,60},{24419,30}],
    coin_cost = [],
    target = [],
    type = 4,
    level = 5,
    ifshow = 1
    };
getRow(72)->
    #lifeskill_infoCfg {
    poolid = 72,
    item_id = 24616,
    skillname = "5级烹饪",
    get_weight = 1000,
    energy_cost = 10,
    get_way = [2,0],
    get_num = [1,1],
    get_exp = 1800,
    reward = [],
    stuff = [{24062,60},{24424,30}],
    coin_cost = [],
    target = [],
    type = 4,
    level = 5,
    ifshow = 1
    };
getRow(73)->
    #lifeskill_infoCfg {
    poolid = 73,
    item_id = 24617,
    skillname = "5级烹饪",
    get_weight = 1000,
    energy_cost = 10,
    get_way = [2,0],
    get_num = [80,80],
    get_exp = 1800,
    reward = [],
    stuff = [{24063,60},{24312,8},{24313,8}],
    coin_cost = [],
    target = [],
    type = 4,
    level = 5,
    ifshow = 1
    };
getRow(74)->
    #lifeskill_infoCfg {
    poolid = 74,
    item_id = 24618,
    skillname = "5级烹饪",
    get_weight = 1000,
    energy_cost = 10,
    get_way = [2,0],
    get_num = [1,1],
    get_exp = 1800,
    reward = [],
    stuff = [],
    coin_cost = [],
    target = [],
    type = 4,
    level = 5,
    ifshow = 0
    };
getRow(75)->
    #lifeskill_infoCfg {
    poolid = 75,
    item_id = 24701,
    skillname = "装修技能",
    get_weight = 1000,
    energy_cost = 20,
    get_way = [2,0],
    get_num = [1,1],
    get_exp = 500,
    reward = [],
    stuff = [{24504,36},{24501,36}],
    coin_cost = [],
    target = [],
    type = 5,
    level = 2,
    ifshow = 1
    };
getRow(76)->
    #lifeskill_infoCfg {
    poolid = 76,
    item_id = 24702,
    skillname = "装修技能",
    get_weight = 1000,
    energy_cost = 20,
    get_way = [2,0],
    get_num = [1,1],
    get_exp = 1200,
    reward = [],
    stuff = [{24504,36},{24404,48}],
    coin_cost = [],
    target = [],
    type = 5,
    level = 2,
    ifshow = 1
    };
getRow(77)->
    #lifeskill_infoCfg {
    poolid = 77,
    item_id = 24703,
    skillname = "装修技能",
    get_weight = 1000,
    energy_cost = 20,
    get_way = [2,0],
    get_num = [1,1],
    get_exp = 1200,
    reward = [],
    stuff = [{24504,36},{24052,60}],
    coin_cost = [],
    target = [],
    type = 5,
    level = 2,
    ifshow = 1
    };
getRow(78)->
    #lifeskill_infoCfg {
    poolid = 78,
    item_id = 24704,
    skillname = "装修技能",
    get_weight = 1000,
    energy_cost = 20,
    get_way = [2,0],
    get_num = [1,1],
    get_exp = 500,
    reward = [],
    stuff = [{24504,36},{24404,36}],
    coin_cost = [],
    target = [],
    type = 5,
    level = 1,
    ifshow = 1
    };
getRow(79)->
    #lifeskill_infoCfg {
    poolid = 79,
    item_id = 24705,
    skillname = "装修技能",
    get_weight = 1000,
    energy_cost = 20,
    get_way = [2,0],
    get_num = [1,1],
    get_exp = 9000,
    reward = [],
    stuff = [],
    coin_cost = [],
    target = [],
    type = 5,
    level = 5,
    ifshow = 1
    };
getRow(80)->
    #lifeskill_infoCfg {
    poolid = 80,
    item_id = 24706,
    skillname = "装修技能",
    get_weight = 1000,
    energy_cost = 20,
    get_way = [2,0],
    get_num = [1,1],
    get_exp = 2400,
    reward = [],
    stuff = [{24410,60},{24504,40}],
    coin_cost = [],
    target = [],
    type = 5,
    level = 3,
    ifshow = 1
    };
getRow(81)->
    #lifeskill_infoCfg {
    poolid = 81,
    item_id = 24707,
    skillname = "装修技能",
    get_weight = 1000,
    energy_cost = 20,
    get_way = [2,0],
    get_num = [1,1],
    get_exp = 9000,
    reward = [],
    stuff = [{24419,105},{24413,105}],
    coin_cost = [],
    target = [],
    type = 5,
    level = 5,
    ifshow = 1
    };
getRow(82)->
    #lifeskill_infoCfg {
    poolid = 82,
    item_id = 24708,
    skillname = "装修技能",
    get_weight = 1000,
    energy_cost = 20,
    get_way = [2,0],
    get_num = [1,1],
    get_exp = 2400,
    reward = [],
    stuff = [{24409,42},{24055,63}],
    coin_cost = [],
    target = [],
    type = 5,
    level = 3,
    ifshow = 1
    };
getRow(83)->
    #lifeskill_infoCfg {
    poolid = 83,
    item_id = 24709,
    skillname = "装修技能",
    get_weight = 1000,
    energy_cost = 20,
    get_way = [2,0],
    get_num = [1,1],
    get_exp = 2400,
    reward = [],
    stuff = [{24056,63},{24055,63}],
    coin_cost = [],
    target = [],
    type = 5,
    level = 3,
    ifshow = 1
    };
getRow(84)->
    #lifeskill_infoCfg {
    poolid = 84,
    item_id = 24710,
    skillname = "装修技能",
    get_weight = 1000,
    energy_cost = 20,
    get_way = [2,0],
    get_num = [1,1],
    get_exp = 2400,
    reward = [],
    stuff = [{24057,63},{24055,63}],
    coin_cost = [],
    target = [],
    type = 5,
    level = 3,
    ifshow = 1
    };
getRow(85)->
    #lifeskill_infoCfg {
    poolid = 85,
    item_id = 24711,
    skillname = "装修技能",
    get_weight = 1000,
    energy_cost = 20,
    get_way = [2,0],
    get_num = [1,1],
    get_exp = 6000,
    reward = [],
    stuff = [{24415,168}],
    coin_cost = [],
    target = [],
    type = 5,
    level = 4,
    ifshow = 1
    };
getRow(86)->
    #lifeskill_infoCfg {
    poolid = 86,
    item_id = 24712,
    skillname = "装修技能",
    get_weight = 1000,
    energy_cost = 20,
    get_way = [2,0],
    get_num = [1,1],
    get_exp = 6000,
    reward = [],
    stuff = [{24511,49},{24512,49}],
    coin_cost = [],
    target = [],
    type = 5,
    level = 4,
    ifshow = 1
    };
getRow(87)->
    #lifeskill_infoCfg {
    poolid = 87,
    item_id = 24713,
    skillname = "装修技能",
    get_weight = 1000,
    energy_cost = 20,
    get_way = [2,0],
    get_num = [1,1],
    get_exp = 500,
    reward = [],
    stuff = [{24050,34}],
    coin_cost = [],
    target = [],
    type = 5,
    level = 1,
    ifshow = 1
    };
getRow(88)->
    #lifeskill_infoCfg {
    poolid = 88,
    item_id = 24714,
    skillname = "装修技能",
    get_weight = 1000,
    energy_cost = 20,
    get_way = [2,0],
    get_num = [1,1],
    get_exp = 1200,
    reward = [],
    stuff = [{24505,21},{24506,21}],
    coin_cost = [],
    target = [],
    type = 5,
    level = 2,
    ifshow = 1
    };
getRow(89)->
    #lifeskill_infoCfg {
    poolid = 89,
    item_id = 24715,
    skillname = "装修技能",
    get_weight = 1000,
    energy_cost = 20,
    get_way = [2,0],
    get_num = [1,1],
    get_exp = 1200,
    reward = [],
    stuff = [{24504,21},{24500,21}],
    coin_cost = [],
    target = [],
    type = 5,
    level = 2,
    ifshow = 1
    };
getRow(90)->
    #lifeskill_infoCfg {
    poolid = 90,
    item_id = 24716,
    skillname = "装修技能",
    get_weight = 1000,
    energy_cost = 20,
    get_way = [2,0],
    get_num = [1,1],
    get_exp = 500,
    reward = [],
    stuff = [],
    coin_cost = [],
    target = [],
    type = 5,
    level = 1,
    ifshow = 0
    };
getRow(91)->
    #lifeskill_infoCfg {
    poolid = 91,
    item_id = 24717,
    skillname = "装修技能",
    get_weight = 1000,
    energy_cost = 20,
    get_way = [2,0],
    get_num = [1,1],
    get_exp = 500,
    reward = [],
    stuff = [{24401,24},{24400,24}],
    coin_cost = [],
    target = [],
    type = 5,
    level = 1,
    ifshow = 1
    };
getRow(92)->
    #lifeskill_infoCfg {
    poolid = 92,
    item_id = 24718,
    skillname = "装修技能",
    get_weight = 1000,
    energy_cost = 20,
    get_way = [2,0],
    get_num = [1,1],
    get_exp = 500,
    reward = [],
    stuff = [{24401,29},{24400,29}],
    coin_cost = [],
    target = [],
    type = 5,
    level = 1,
    ifshow = 1
    };
getRow(93)->
    #lifeskill_infoCfg {
    poolid = 93,
    item_id = 24719,
    skillname = "装修技能",
    get_weight = 1000,
    energy_cost = 20,
    get_way = [2,0],
    get_num = [1,1],
    get_exp = 500,
    reward = [],
    stuff = [{24401,24},{24052,24}],
    coin_cost = [],
    target = [],
    type = 5,
    level = 1,
    ifshow = 1
    };
getRow(94)->
    #lifeskill_infoCfg {
    poolid = 94,
    item_id = 24720,
    skillname = "装修技能",
    get_weight = 1000,
    energy_cost = 1,
    get_way = [2,0],
    get_num = [1,1],
    get_exp = 1,
    reward = [],
    stuff = [{24401,2}],
    coin_cost = [],
    target = [],
    type = 5,
    level = 1,
    ifshow = 1
    };
getRow(95)->
    #lifeskill_infoCfg {
    poolid = 95,
    item_id = 24721,
    skillname = "装修技能",
    get_weight = 1000,
    energy_cost = 1,
    get_way = [2,0],
    get_num = [1,1],
    get_exp = 1,
    reward = [],
    stuff = [{24401,2}],
    coin_cost = [],
    target = [],
    type = 5,
    level = 1,
    ifshow = 1
    };
getRow(96)->
    #lifeskill_infoCfg {
    poolid = 96,
    item_id = 24722,
    skillname = "装修技能",
    get_weight = 1000,
    energy_cost = 1,
    get_way = [2,0],
    get_num = [1,1],
    get_exp = 1,
    reward = [],
    stuff = [{24401,2}],
    coin_cost = [],
    target = [],
    type = 5,
    level = 1,
    ifshow = 1
    };
getRow(97)->
    #lifeskill_infoCfg {
    poolid = 97,
    item_id = 24740,
    skillname = "装修技能",
    get_weight = 1000,
    energy_cost = 20,
    get_way = [2,0],
    get_num = [1,1],
    get_exp = 2400,
    reward = [],
    stuff = [{24411,72},{24406,72}],
    coin_cost = [],
    target = [],
    type = 5,
    level = 3,
    ifshow = 1
    };
getRow(98)->
    #lifeskill_infoCfg {
    poolid = 98,
    item_id = 24741,
    skillname = "装修技能",
    get_weight = 1000,
    energy_cost = 20,
    get_way = [2,0],
    get_num = [1,1],
    get_exp = 2400,
    reward = [],
    stuff = [{24411,72},{24409,72}],
    coin_cost = [],
    target = [],
    type = 5,
    level = 3,
    ifshow = 1
    };
getRow(99)->
    #lifeskill_infoCfg {
    poolid = 99,
    item_id = 24742,
    skillname = "装修技能",
    get_weight = 1000,
    energy_cost = 20,
    get_way = [2,0],
    get_num = [1,1],
    get_exp = 2400,
    reward = [],
    stuff = [{24411,72},{24410,72}],
    coin_cost = [],
    target = [],
    type = 5,
    level = 3,
    ifshow = 1
    };
getRow(100)->
    #lifeskill_infoCfg {
    poolid = 100,
    item_id = 24743,
    skillname = "装修技能",
    get_weight = 1000,
    energy_cost = 20,
    get_way = [2,0],
    get_num = [1,1],
    get_exp = 2400,
    reward = [],
    stuff = [{24409,72},{24509,48}],
    coin_cost = [],
    target = [],
    type = 5,
    level = 3,
    ifshow = 1
    };
getRow(101)->
    #lifeskill_infoCfg {
    poolid = 101,
    item_id = 24744,
    skillname = "装修技能",
    get_weight = 1000,
    energy_cost = 20,
    get_way = [2,0],
    get_num = [1,1],
    get_exp = 500,
    reward = [],
    stuff = [{24401,15},{24052,15}],
    coin_cost = [],
    target = [],
    type = 5,
    level = 1,
    ifshow = 1
    };
getRow(102)->
    #lifeskill_infoCfg {
    poolid = 102,
    item_id = 24745,
    skillname = "装修技能",
    get_weight = 1000,
    energy_cost = 20,
    get_way = [2,0],
    get_num = [1,1],
    get_exp = 6000,
    reward = [],
    stuff = [{24511,49},{24507,49}],
    coin_cost = [],
    target = [],
    type = 5,
    level = 4,
    ifshow = 1
    };
getRow(103)->
    #lifeskill_infoCfg {
    poolid = 103,
    item_id = 24746,
    skillname = "装修技能",
    get_weight = 1000,
    energy_cost = 20,
    get_way = [2,0],
    get_num = [1,1],
    get_exp = 6000,
    reward = [],
    stuff = [{24058,90},{24508,40}],
    coin_cost = [],
    target = [],
    type = 5,
    level = 3,
    ifshow = 1
    };
getRow(104)->
    #lifeskill_infoCfg {
    poolid = 104,
    item_id = 24747,
    skillname = "装修技能",
    get_weight = 1000,
    energy_cost = 20,
    get_way = [2,0],
    get_num = [1,1],
    get_exp = 2400,
    reward = [],
    stuff = [{24508,40},{24411,60}],
    coin_cost = [],
    target = [],
    type = 5,
    level = 3,
    ifshow = 1
    };
getRow(105)->
    #lifeskill_infoCfg {
    poolid = 105,
    item_id = 24748,
    skillname = "装修技能",
    get_weight = 1000,
    energy_cost = 20,
    get_way = [2,0],
    get_num = [1,1],
    get_exp = 2400,
    reward = [],
    stuff = [{24508,40},{24509,40}],
    coin_cost = [],
    target = [],
    type = 5,
    level = 3,
    ifshow = 1
    };
getRow(106)->
    #lifeskill_infoCfg {
    poolid = 106,
    item_id = 24749,
    skillname = "装修技能",
    get_weight = 1000,
    energy_cost = 20,
    get_way = [2,0],
    get_num = [1,1],
    get_exp = 9000,
    reward = [],
    stuff = [{24513,53},{24514,53}],
    coin_cost = [],
    target = [],
    type = 5,
    level = 5,
    ifshow = 1
    };
getRow(107)->
    #lifeskill_infoCfg {
    poolid = 107,
    item_id = 24750,
    skillname = "装修技能",
    get_weight = 1000,
    energy_cost = 20,
    get_way = [2,0],
    get_num = [1,1],
    get_exp = 2400,
    reward = [],
    stuff = [{24058,90},{24508,40}],
    coin_cost = [],
    target = [],
    type = 5,
    level = 3,
    ifshow = 1
    };
getRow(108)->
    #lifeskill_infoCfg {
    poolid = 108,
    item_id = 24751,
    skillname = "装修技能",
    get_weight = 1000,
    energy_cost = 20,
    get_way = [2,0],
    get_num = [1,1],
    get_exp = 9000,
    reward = [],
    stuff = [],
    coin_cost = [],
    target = [],
    type = 5,
    level = 5,
    ifshow = 1
    };
getRow(109)->
    #lifeskill_infoCfg {
    poolid = 109,
    item_id = 24752,
    skillname = "装修技能",
    get_weight = 1000,
    energy_cost = 20,
    get_way = [2,0],
    get_num = [1,1],
    get_exp = 6000,
    reward = [],
    stuff = [{24061,252},{24411,144}],
    coin_cost = [],
    target = [],
    type = 5,
    level = 4,
    ifshow = 1
    };
getRow(110)->
    #lifeskill_infoCfg {
    poolid = 110,
    item_id = 24753,
    skillname = "装修技能",
    get_weight = 1000,
    energy_cost = 20,
    get_way = [2,0],
    get_num = [1,1],
    get_exp = 6000,
    reward = [],
    stuff = [],
    coin_cost = [],
    target = [],
    type = 5,
    level = 4,
    ifshow = 0
    };
getRow(112)->
    #lifeskill_infoCfg {
    poolid = 112,
    item_id = 24744,
    skillname = "装修技能",
    get_weight = 1000,
    energy_cost = 20,
    get_way = [2,0],
    get_num = [1,1],
    get_exp = 500,
    reward = [],
    stuff = [],
    coin_cost = [],
    target = [],
    type = 5,
    level = 1,
    ifshow = 0
    };
getRow(113)->
    #lifeskill_infoCfg {
    poolid = 113,
    item_id = 24754,
    skillname = "装修技能",
    get_weight = 1000,
    energy_cost = 20,
    get_way = [2,0],
    get_num = [1,1],
    get_exp = 2400,
    reward = [],
    stuff = [{24406,48},{24503,36}],
    coin_cost = [],
    target = [],
    type = 5,
    level = 2,
    ifshow = 1
    };
getRow(114)->
    #lifeskill_infoCfg {
    poolid = 114,
    item_id = 24755,
    skillname = "装修技能",
    get_weight = 1000,
    energy_cost = 20,
    get_way = [2,0],
    get_num = [1,1],
    get_exp = 2400,
    reward = [],
    stuff = [{24409,72},{24504,48}],
    coin_cost = [],
    target = [],
    type = 5,
    level = 3,
    ifshow = 1
    };
getRow(115)->
    #lifeskill_infoCfg {
    poolid = 115,
    item_id = 24756,
    skillname = "装修技能",
    get_weight = 1000,
    energy_cost = 20,
    get_way = [2,0],
    get_num = [1,1],
    get_exp = 2400,
    reward = [],
    stuff = [{24410,72},{24505,48}],
    coin_cost = [],
    target = [],
    type = 5,
    level = 3,
    ifshow = 1
    };
getRow(116)->
    #lifeskill_infoCfg {
    poolid = 116,
    item_id = 24757,
    skillname = "装修技能",
    get_weight = 1000,
    energy_cost = 20,
    get_way = [2,0],
    get_num = [1,1],
    get_exp = 2400,
    reward = [],
    stuff = [{24406,40},{24058,50}],
    coin_cost = [],
    target = [],
    type = 5,
    level = 2,
    ifshow = 1
    };
getRow(117)->
    #lifeskill_infoCfg {
    poolid = 117,
    item_id = 24758,
    skillname = "装修技能",
    get_weight = 1000,
    energy_cost = 1,
    get_way = [2,0],
    get_num = [1,1],
    get_exp = 1,
    reward = [],
    stuff = [{24401,2}],
    coin_cost = [],
    target = [],
    type = 5,
    level = 1,
    ifshow = 1
    };
getRow(118)->
    #lifeskill_infoCfg {
    poolid = 118,
    item_id = 24759,
    skillname = "装修技能",
    get_weight = 1000,
    energy_cost = 20,
    get_way = [2,0],
    get_num = [1,1],
    get_exp = 1200,
    reward = [],
    stuff = [{24055,60},{24404,48}],
    coin_cost = [],
    target = [],
    type = 5,
    level = 2,
    ifshow = 1
    };
getRow(119)->
    #lifeskill_infoCfg {
    poolid = 119,
    item_id = 24760,
    skillname = "装修技能",
    get_weight = 1000,
    energy_cost = 20,
    get_way = [2,0],
    get_num = [1,1],
    get_exp = 1200,
    reward = [],
    stuff = [{24055,120}],
    coin_cost = [],
    target = [],
    type = 5,
    level = 2,
    ifshow = 1
    };
getRow(120)->
    #lifeskill_infoCfg {
    poolid = 120,
    item_id = 24761,
    skillname = "装修技能",
    get_weight = 1000,
    energy_cost = 20,
    get_way = [2,0],
    get_num = [1,1],
    get_exp = 1200,
    reward = [],
    stuff = [{24504,36},{24501,36}],
    coin_cost = [],
    target = [],
    type = 5,
    level = 2,
    ifshow = 1
    };
getRow(121)->
    #lifeskill_infoCfg {
    poolid = 121,
    item_id = 24762,
    skillname = "装修技能",
    get_weight = 1000,
    energy_cost = 20,
    get_way = [2,0],
    get_num = [1,1],
    get_exp = 1200,
    reward = [],
    stuff = [{24504,36},{24052,60}],
    coin_cost = [],
    target = [],
    type = 5,
    level = 2,
    ifshow = 1
    };
getRow(122)->
    #lifeskill_infoCfg {
    poolid = 122,
    item_id = 24763,
    skillname = "装修技能",
    get_weight = 1000,
    energy_cost = 20,
    get_way = [2,0],
    get_num = [1,1],
    get_exp = 1200,
    reward = [],
    stuff = [{24504,36},{24404,48}],
    coin_cost = [],
    target = [],
    type = 5,
    level = 2,
    ifshow = 1
    };
getRow(123)->
    #lifeskill_infoCfg {
    poolid = 123,
    item_id = 24764,
    skillname = "装修技能",
    get_weight = 1000,
    energy_cost = 20,
    get_way = [2,0],
    get_num = [1,1],
    get_exp = 2400,
    reward = [],
    stuff = [{24406,48},{24506,36}],
    coin_cost = [],
    target = [],
    type = 5,
    level = 2,
    ifshow = 1
    };
getRow(124)->
    #lifeskill_infoCfg {
    poolid = 124,
    item_id = 24765,
    skillname = "装修技能",
    get_weight = 1000,
    energy_cost = 20,
    get_way = [2,0],
    get_num = [1,1],
    get_exp = 1200,
    reward = [],
    stuff = [{24503,36},{24505,36}],
    coin_cost = [],
    target = [],
    type = 5,
    level = 2,
    ifshow = 1
    };
getRow(125)->
    #lifeskill_infoCfg {
    poolid = 125,
    item_id = 24766,
    skillname = "装修技能",
    get_weight = 1000,
    energy_cost = 20,
    get_way = [2,0],
    get_num = [1,1],
    get_exp = 6000,
    reward = [],
    stuff = [{24510,42},{24059,126}],
    coin_cost = [],
    target = [],
    type = 5,
    level = 4,
    ifshow = 1
    };
getRow(126)->
    #lifeskill_infoCfg {
    poolid = 126,
    item_id = 24767,
    skillname = "装修技能",
    get_weight = 1000,
    energy_cost = 20,
    get_way = [2,0],
    get_num = [1,1],
    get_exp = 6000,
    reward = [],
    stuff = [{24511,70},{24059,210}],
    coin_cost = [],
    target = [],
    type = 5,
    level = 4,
    ifshow = 1
    };
getRow(127)->
    #lifeskill_infoCfg {
    poolid = 127,
    item_id = 24768,
    skillname = "装修技能",
    get_weight = 1000,
    energy_cost = 20,
    get_way = [2,0],
    get_num = [1,1],
    get_exp = 6000,
    reward = [],
    stuff = [{24512,70},{24415,120}],
    coin_cost = [],
    target = [],
    type = 5,
    level = 4,
    ifshow = 1
    };
getRow(128)->
    #lifeskill_infoCfg {
    poolid = 128,
    item_id = 24769,
    skillname = "装修技能",
    get_weight = 1000,
    energy_cost = 20,
    get_way = [2,0],
    get_num = [1,1],
    get_exp = 9000,
    reward = [],
    stuff = [{24064,300},{24418,150}],
    coin_cost = [],
    target = [],
    type = 5,
    level = 5,
    ifshow = 1
    };
getRow(129)->
    #lifeskill_infoCfg {
    poolid = 129,
    item_id = 24770,
    skillname = "装修技能",
    get_weight = 1000,
    energy_cost = 20,
    get_way = [2,0],
    get_num = [1,1],
    get_exp = 9000,
    reward = [],
    stuff = [{24422,180},{24061,360}],
    coin_cost = [],
    target = [],
    type = 5,
    level = 5,
    ifshow = 1
    };
getRow(130)->
    #lifeskill_infoCfg {
    poolid = 130,
    item_id = 24771,
    skillname = "装修技能",
    get_weight = 1000,
    energy_cost = 20,
    get_way = [2,0],
    get_num = [1,1],
    get_exp = 9000,
    reward = [],
    stuff = [{24514,75},{24059,300}],
    coin_cost = [],
    target = [],
    type = 5,
    level = 5,
    ifshow = 1
    };
getRow(131)->
    #lifeskill_infoCfg {
    poolid = 131,
    item_id = 24772,
    skillname = "装修技能",
    get_weight = 1000,
    energy_cost = 20,
    get_way = [2,0],
    get_num = [1,1],
    get_exp = 9000,
    reward = [],
    stuff = [{24515,75},{24064,300}],
    coin_cost = [],
    target = [],
    type = 5,
    level = 5,
    ifshow = 1
    };
getRow(132)->
    #lifeskill_infoCfg {
    poolid = 132,
    item_id = 24773,
    skillname = "装修技能",
    get_weight = 1000,
    energy_cost = 20,
    get_way = [2,0],
    get_num = [1,1],
    get_exp = 9000,
    reward = [],
    stuff = [{24064,300},{24418,150}],
    coin_cost = [],
    target = [],
    type = 5,
    level = 5,
    ifshow = 1
    };
getRow(133)->
    #lifeskill_infoCfg {
    poolid = 133,
    item_id = 24774,
    skillname = "装修技能",
    get_weight = 1000,
    energy_cost = 20,
    get_way = [2,0],
    get_num = [1,1],
    get_exp = 9000,
    reward = [],
    stuff = [{24422,180},{24061,360}],
    coin_cost = [],
    target = [],
    type = 5,
    level = 5,
    ifshow = 1
    };
getRow(134)->
    #lifeskill_infoCfg {
    poolid = 134,
    item_id = 24775,
    skillname = "装修技能",
    get_weight = 1000,
    energy_cost = 20,
    get_way = [2,0],
    get_num = [1,1],
    get_exp = 9000,
    reward = [],
    stuff = [{24514,75},{24059,300}],
    coin_cost = [],
    target = [],
    type = 5,
    level = 5,
    ifshow = 1
    };
getRow(135)->
    #lifeskill_infoCfg {
    poolid = 135,
    item_id = 24776,
    skillname = "装修技能",
    get_weight = 1000,
    energy_cost = 20,
    get_way = [2,0],
    get_num = [1,1],
    get_exp = 9000,
    reward = [],
    stuff = [{24515,75},{24064,300}],
    coin_cost = [],
    target = [],
    type = 5,
    level = 5,
    ifshow = 1
    };
getRow(136)->
    #lifeskill_infoCfg {
    poolid = 136,
    item_id = 24777,
    skillname = "装修技能",
    get_weight = 1000,
    energy_cost = 20,
    get_way = [2,0],
    get_num = [1,1],
    get_exp = 500,
    reward = [],
    stuff = [{24052,24},{24500,24}],
    coin_cost = [],
    target = [],
    type = 5,
    level = 1,
    ifshow = 1
    };
getRow(137)->
    #lifeskill_infoCfg {
    poolid = 137,
    item_id = 24778,
    skillname = "装修技能",
    get_weight = 1000,
    energy_cost = 20,
    get_way = [2,0],
    get_num = [1,1],
    get_exp = 1200,
    reward = [],
    stuff = [{24503,21},{24055,35}],
    coin_cost = [],
    target = [],
    type = 5,
    level = 2,
    ifshow = 1
    };
getRow(138)->
    #lifeskill_infoCfg {
    poolid = 138,
    item_id = 24779,
    skillname = "装修技能",
    get_weight = 1000,
    energy_cost = 20,
    get_way = [2,0],
    get_num = [1,1],
    get_exp = 500,
    reward = [],
    stuff = [{24500,24},{24052,24}],
    coin_cost = [],
    target = [],
    type = 5,
    level = 1,
    ifshow = 1
    };
getRow(139)->
    #lifeskill_infoCfg {
    poolid = 139,
    item_id = 24780,
    skillname = "装修技能",
    get_weight = 1000,
    energy_cost = 20,
    get_way = [2,0],
    get_num = [1,1],
    get_exp = 1200,
    reward = [],
    stuff = [{24505,21},{24055,35}],
    coin_cost = [],
    target = [],
    type = 5,
    level = 2,
    ifshow = 1
    };
getRow(140)->
    #lifeskill_infoCfg {
    poolid = 140,
    item_id = 24781,
    skillname = "装修技能",
    get_weight = 1000,
    energy_cost = 20,
    get_way = [2,0],
    get_num = [1,1],
    get_exp = 2400,
    reward = [],
    stuff = [{24058,63},{24507,28}],
    coin_cost = [],
    target = [],
    type = 5,
    level = 3,
    ifshow = 1
    };
getRow(141)->
    #lifeskill_infoCfg {
    poolid = 141,
    item_id = 24782,
    skillname = "装修技能",
    get_weight = 1000,
    energy_cost = 20,
    get_way = [2,0],
    get_num = [1,1],
    get_exp = 2400,
    reward = [],
    stuff = [{24058,63},{24508,28}],
    coin_cost = [],
    target = [],
    type = 5,
    level = 3,
    ifshow = 1
    };
getRow(142)->
    #lifeskill_infoCfg {
    poolid = 142,
    item_id = 24783,
    skillname = "装修技能",
    get_weight = 1000,
    energy_cost = 20,
    get_way = [2,0],
    get_num = [1,1],
    get_exp = 2400,
    reward = [],
    stuff = [{24058,63},{24509,28}],
    coin_cost = [],
    target = [],
    type = 5,
    level = 3,
    ifshow = 1
    };
getRow(143)->
    #lifeskill_infoCfg {
    poolid = 143,
    item_id = 24784,
    skillname = "装修技能",
    get_weight = 1000,
    energy_cost = 20,
    get_way = [2,0],
    get_num = [1,1],
    get_exp = 6000,
    reward = [],
    stuff = [{24061,210},{24416,120}],
    coin_cost = [],
    target = [],
    type = 5,
    level = 4,
    ifshow = 1
    };
getRow(144)->
    #lifeskill_infoCfg {
    poolid = 144,
    item_id = 24785,
    skillname = "装修技能",
    get_weight = 1000,
    energy_cost = 20,
    get_way = [2,0],
    get_num = [1,1],
    get_exp = 6000,
    reward = [],
    stuff = [{24061,210},{24510,70}],
    coin_cost = [],
    target = [],
    type = 5,
    level = 4,
    ifshow = 1
    };
getRow(145)->
    #lifeskill_infoCfg {
    poolid = 145,
    item_id = 24786,
    skillname = "装修技能",
    get_weight = 1000,
    energy_cost = 20,
    get_way = [2,0],
    get_num = [1,1],
    get_exp = 500,
    reward = [],
    stuff = [{24401,24},{24400,24}],
    coin_cost = [],
    target = [],
    type = 5,
    level = 1,
    ifshow = 1
    };
getRow(146)->
    #lifeskill_infoCfg {
    poolid = 146,
    item_id = 24787,
    skillname = "装修技能",
    get_weight = 1000,
    energy_cost = 20,
    get_way = [2,0],
    get_num = [1,1],
    get_exp = 1,
    reward = [],
    stuff = [],
    coin_cost = [],
    target = [],
    type = 5,
    level = 5,
    ifshow = 1
    };
getRow(147)->
    #lifeskill_infoCfg {
    poolid = 147,
    item_id = 24788,
    skillname = "装修技能",
    get_weight = 1000,
    energy_cost = 20,
    get_way = [2,0],
    get_num = [1,1],
    get_exp = 9000,
    reward = [],
    stuff = [{24422,300},{24515,150}],
    coin_cost = [],
    target = [],
    type = 5,
    level = 5,
    ifshow = 1
    };
getRow(148)->
    #lifeskill_infoCfg {
    poolid = 148,
    item_id = 24789,
    skillname = "装修技能",
    get_weight = 1000,
    energy_cost = 20,
    get_way = [2,0],
    get_num = [1,1],
    get_exp = 18100,
    reward = [],
    stuff = [{24519,373},{24429,900}],
    coin_cost = [],
    target = [],
    type = 5,
    level = 7,
    ifshow = 1
    };
getRow(149)->
    #lifeskill_infoCfg {
    poolid = 149,
    item_id = 24790,
    skillname = "装修技能",
    get_weight = 1000,
    energy_cost = 20,
    get_way = [2,0],
    get_num = [1,1],
    get_exp = 1,
    reward = [],
    stuff = [],
    coin_cost = [],
    target = [],
    type = 5,
    level = 5,
    ifshow = 1
    };
getRow(150)->
    #lifeskill_infoCfg {
    poolid = 150,
    item_id = 24791,
    skillname = "装修技能",
    get_weight = 1000,
    energy_cost = 20,
    get_way = [2,0],
    get_num = [1,1],
    get_exp = 9000,
    reward = [],
    stuff = [{24514,113},{24064,450}],
    coin_cost = [],
    target = [],
    type = 5,
    level = 5,
    ifshow = 1
    };
getRow(151)->
    #lifeskill_infoCfg {
    poolid = 151,
    item_id = 24792,
    skillname = "装修技能",
    get_weight = 1000,
    energy_cost = 20,
    get_way = [2,0],
    get_num = [1,1],
    get_exp = 6000,
    reward = [],
    stuff = [{24512,49},{24061,147}],
    coin_cost = [],
    target = [],
    type = 5,
    level = 4,
    ifshow = 1
    };
getRow(152)->
    #lifeskill_infoCfg {
    poolid = 152,
    item_id = 24793,
    skillname = "装修技能",
    get_weight = 1000,
    energy_cost = 20,
    get_way = [2,0],
    get_num = [1,1],
    get_exp = 6000,
    reward = [],
    stuff = [{24059,147},{24510,49}],
    coin_cost = [],
    target = [],
    type = 5,
    level = 4,
    ifshow = 1
    };
getRow(153)->
    #lifeskill_infoCfg {
    poolid = 153,
    item_id = 24794,
    skillname = "装修技能",
    get_weight = 1000,
    energy_cost = 20,
    get_way = [2,0],
    get_num = [1,1],
    get_exp = 9000,
    reward = [],
    stuff = [{24063,210},{24515,53}],
    coin_cost = [],
    target = [],
    type = 5,
    level = 5,
    ifshow = 1
    };
getRow(154)->
    #lifeskill_infoCfg {
    poolid = 154,
    item_id = 24795,
    skillname = "装修技能",
    get_weight = 1000,
    energy_cost = 20,
    get_way = [2,0],
    get_num = [1,1],
    get_exp = 9000,
    reward = [],
    stuff = [{24062,210},{24513,53}],
    coin_cost = [],
    target = [],
    type = 5,
    level = 5,
    ifshow = 1
    };
getRow(155)->
    #lifeskill_infoCfg {
    poolid = 155,
    item_id = 24796,
    skillname = "装修技能",
    get_weight = 1000,
    energy_cost = 20,
    get_way = [2,0],
    get_num = [1,1],
    get_exp = 6000,
    reward = [],
    stuff = [{24059,210},{24061,210}],
    coin_cost = [],
    target = [],
    type = 5,
    level = 4,
    ifshow = 1
    };
getRow(156)->
    #lifeskill_infoCfg {
    poolid = 156,
    item_id = 24797,
    skillname = "装修技能",
    get_weight = 1000,
    energy_cost = 20,
    get_way = [2,0],
    get_num = [1,1],
    get_exp = 9000,
    reward = [],
    stuff = [{24420,105},{24515,53}],
    coin_cost = [],
    target = [],
    type = 5,
    level = 5,
    ifshow = 1
    };
getRow(157)->
    #lifeskill_infoCfg {
    poolid = 157,
    item_id = 24798,
    skillname = "装修技能",
    get_weight = 1000,
    energy_cost = 20,
    get_way = [2,0],
    get_num = [1,1],
    get_exp = 6000,
    reward = [],
    stuff = [{24059,210},{24061,210}],
    coin_cost = [],
    target = [],
    type = 5,
    level = 4,
    ifshow = 1
    };
getRow(158)->
    #lifeskill_infoCfg {
    poolid = 158,
    item_id = 24799,
    skillname = "装修技能",
    get_weight = 1000,
    energy_cost = 20,
    get_way = [2,0],
    get_num = [1,1],
    get_exp = 9000,
    reward = [],
    stuff = [{24063,360},{24064,360}],
    coin_cost = [],
    target = [],
    type = 5,
    level = 5,
    ifshow = 1
    };
getRow(159)->
    #lifeskill_infoCfg {
    poolid = 159,
    item_id = 24800,
    skillname = "装修技能",
    get_weight = 1000,
    energy_cost = 20,
    get_way = [2,0],
    get_num = [1,1],
    get_exp = 6000,
    reward = [],
    stuff = [{24423,144},{24064,252}],
    coin_cost = [],
    target = [],
    type = 5,
    level = 4,
    ifshow = 1
    };
getRow(160)->
    #lifeskill_infoCfg {
    poolid = 160,
    item_id = 24801,
    skillname = "装修技能",
    get_weight = 1000,
    energy_cost = 20,
    get_way = [2,0],
    get_num = [1,1],
    get_exp = 2400,
    reward = [],
    stuff = [{24061,108},{24418,72}],
    coin_cost = [],
    target = [],
    type = 5,
    level = 3,
    ifshow = 1
    };
getRow(161)->
    #lifeskill_infoCfg {
    poolid = 161,
    item_id = 24802,
    skillname = "装修技能",
    get_weight = 1000,
    energy_cost = 20,
    get_way = [2,0],
    get_num = [1,1],
    get_exp = 1200,
    reward = [],
    stuff = [{24404,28},{24055,35}],
    coin_cost = [],
    target = [],
    type = 5,
    level = 2,
    ifshow = 1
    };
getRow(162)->
    #lifeskill_infoCfg {
    poolid = 162,
    item_id = 24803,
    skillname = "装修技能",
    get_weight = 1000,
    energy_cost = 20,
    get_way = [2,0],
    get_num = [1,1],
    get_exp = 6000,
    reward = [],
    stuff = [{24413,84},{24416,84}],
    coin_cost = [],
    target = [],
    type = 5,
    level = 4,
    ifshow = 1
    };
getRow(163)->
    #lifeskill_infoCfg {
    poolid = 163,
    item_id = 24100,
    skillname = "二级烹饪",
    get_weight = 1000,
    energy_cost = 10,
    get_way = [2,0],
    get_num = [1,1],
    get_exp = 400,
    reward = [],
    stuff = [{24054,17},{24304,10}],
    coin_cost = [],
    target = [],
    type = 4,
    level = 2,
    ifshow = 1
    };
getRow(164)->
    #lifeskill_infoCfg {
    poolid = 164,
    item_id = 24101,
    skillname = "四级烹饪",
    get_weight = 1000,
    energy_cost = 10,
    get_way = [2,0],
    get_num = [1,1],
    get_exp = 1000,
    reward = [],
    stuff = [{24417,20},{24311,12}],
    coin_cost = [],
    target = [],
    type = 4,
    level = 4,
    ifshow = 1
    };
getRow(165)->
    #lifeskill_infoCfg {
    poolid = 165,
    item_id = 24804,
    skillname = "装修技能",
    get_weight = 1000,
    energy_cost = 20,
    get_way = [2,0],
    get_num = [1,1],
    get_exp = 6000,
    reward = [],
    stuff = [{24061,252},{24415,144}],
    coin_cost = [],
    target = [],
    type = 5,
    level = 4,
    ifshow = 1
    };
getRow(166)->
    #lifeskill_infoCfg {
    poolid = 166,
    item_id = 24805,
    skillname = "装修技能",
    get_weight = 1000,
    energy_cost = 20,
    get_way = [2,0],
    get_num = [1,1],
    get_exp = 9000,
    reward = [],
    stuff = [{24064,360},{24422,180}],
    coin_cost = [],
    target = [],
    type = 5,
    level = 5,
    ifshow = 1
    };
getRow(167)->
    #lifeskill_infoCfg {
    poolid = 167,
    item_id = 24806,
    skillname = "装修技能",
    get_weight = 1000,
    energy_cost = 20,
    get_way = [2,0],
    get_num = [1,1],
    get_exp = 12100,
    reward = [],
    stuff = [{24069,480},{24517,99}],
    coin_cost = [],
    target = [],
    type = 5,
    level = 6,
    ifshow = 1
    };
getRow(168)->
    #lifeskill_infoCfg {
    poolid = 168,
    item_id = 24807,
    skillname = "装修技能",
    get_weight = 1000,
    energy_cost = 20,
    get_way = [2,0],
    get_num = [1,1],
    get_exp = 12100,
    reward = [],
    stuff = [{24069,480},{24516,99}],
    coin_cost = [],
    target = [],
    type = 5,
    level = 6,
    ifshow = 1
    };
getRow(169)->
    #lifeskill_infoCfg {
    poolid = 169,
    item_id = 24808,
    skillname = "幽界商店",
    get_weight = 1000,
    energy_cost = 20,
    get_way = [2,0],
    get_num = [1,1],
    get_exp = 1,
    reward = [],
    stuff = [],
    coin_cost = [],
    target = [],
    type = 5,
    level = 6,
    ifshow = 1
    };
getRow(170)->
    #lifeskill_infoCfg {
    poolid = 170,
    item_id = 24809,
    skillname = "装修技能",
    get_weight = 1000,
    energy_cost = 20,
    get_way = [2,0],
    get_num = [1,1],
    get_exp = 6000,
    reward = [],
    stuff = [{24061,252},{24510,84}],
    coin_cost = [],
    target = [],
    type = 5,
    level = 4,
    ifshow = 1
    };
getRow(171)->
    #lifeskill_infoCfg {
    poolid = 171,
    item_id = 24810,
    skillname = "装修技能",
    get_weight = 1000,
    energy_cost = 20,
    get_way = [2,0],
    get_num = [1,1],
    get_exp = 9000,
    reward = [],
    stuff = [{24515,90},{24420,180}],
    coin_cost = [],
    target = [],
    type = 5,
    level = 5,
    ifshow = 1
    };
getRow(172)->
    #lifeskill_infoCfg {
    poolid = 172,
    item_id = 24811,
    skillname = "商城出售",
    get_weight = 1000,
    energy_cost = 20,
    get_way = [2,0],
    get_num = [1,1],
    get_exp = 0,
    reward = [],
    stuff = [],
    coin_cost = [],
    target = [],
    type = 5,
    level = 6,
    ifshow = 1
    };
getRow(173)->
    #lifeskill_infoCfg {
    poolid = 173,
    item_id = 24812,
    skillname = "商城出售",
    get_weight = 1000,
    energy_cost = 20,
    get_way = [2,0],
    get_num = [1,1],
    get_exp = 0,
    reward = [],
    stuff = [],
    coin_cost = [],
    target = [],
    type = 5,
    level = 6,
    ifshow = 1
    };
getRow(174)->
    #lifeskill_infoCfg {
    poolid = 174,
    item_id = 24813,
    skillname = "装修技能",
    get_weight = 1000,
    energy_cost = 20,
    get_way = [2,0],
    get_num = [1,1],
    get_exp = 12100,
    reward = [],
    stuff = [{24426,240},{24418,240}],
    coin_cost = [],
    target = [],
    type = 5,
    level = 6,
    ifshow = 1
    };
getRow(175)->
    #lifeskill_infoCfg {
    poolid = 175,
    item_id = 24814,
    skillname = "装修技能",
    get_weight = 1000,
    energy_cost = 20,
    get_way = [2,0],
    get_num = [1,1],
    get_exp = 12100,
    reward = [],
    stuff = [{24426,240},{24413,240}],
    coin_cost = [],
    target = [],
    type = 5,
    level = 6,
    ifshow = 1
    };
getRow(176)->
    #lifeskill_infoCfg {
    poolid = 176,
    item_id = 24815,
    skillname = "幽界商店",
    get_weight = 1000,
    energy_cost = 20,
    get_way = [2,0],
    get_num = [1,1],
    get_exp = 0,
    reward = [],
    stuff = [],
    coin_cost = [],
    target = [],
    type = 5,
    level = 6,
    ifshow = 1
    };
getRow(177)->
    #lifeskill_infoCfg {
    poolid = 177,
    item_id = 24816,
    skillname = "幽界商店",
    get_weight = 1000,
    energy_cost = 20,
    get_way = [2,0],
    get_num = [1,1],
    get_exp = 0,
    reward = [],
    stuff = [],
    coin_cost = [],
    target = [],
    type = 5,
    level = 6,
    ifshow = 1
    };
getRow(178)->
    #lifeskill_infoCfg {
    poolid = 178,
    item_id = 24817,
    skillname = "装修技能",
    get_weight = 1000,
    energy_cost = 20,
    get_way = [2,0],
    get_num = [1,1],
    get_exp = 6000,
    reward = [],
    stuff = [{24427,84},{24423,84}],
    coin_cost = [],
    target = [],
    type = 5,
    level = 4,
    ifshow = 1
    };
getRow(179)->
    #lifeskill_infoCfg {
    poolid = 179,
    item_id = 24818,
    skillname = "装修技能",
    get_weight = 1000,
    energy_cost = 20,
    get_way = [2,0],
    get_num = [1,1],
    get_exp = 9000,
    reward = [],
    stuff = [{24426,105},{24423,105}],
    coin_cost = [],
    target = [],
    type = 5,
    level = 5,
    ifshow = 1
    };
getRow(180)->
    #lifeskill_infoCfg {
    poolid = 180,
    item_id = 24819,
    skillname = "幽界商店",
    get_weight = 1000,
    energy_cost = 20,
    get_way = [2,0],
    get_num = [1,1],
    get_exp = 0,
    reward = [],
    stuff = [],
    coin_cost = [],
    target = [],
    type = 5,
    level = 5,
    ifshow = 1
    };
getRow(181)->
    #lifeskill_infoCfg {
    poolid = 181,
    item_id = 24820,
    skillname = "活动奖励",
    get_weight = 1000,
    energy_cost = 20,
    get_way = [2,0],
    get_num = [1,1],
    get_exp = 0,
    reward = [],
    stuff = [],
    coin_cost = [],
    target = [],
    type = 5,
    level = 5,
    ifshow = 1
    };
getRow(182)->
    #lifeskill_infoCfg {
    poolid = 182,
    item_id = 24821,
    skillname = "活动奖励",
    get_weight = 1000,
    energy_cost = 20,
    get_way = [2,0],
    get_num = [1,1],
    get_exp = 0,
    reward = [],
    stuff = [],
    coin_cost = [],
    target = [],
    type = 5,
    level = 5,
    ifshow = 1
    };
getRow(183)->
    #lifeskill_infoCfg {
    poolid = 183,
    item_id = 24822,
    skillname = "活动奖励",
    get_weight = 1000,
    energy_cost = 20,
    get_way = [2,0],
    get_num = [1,1],
    get_exp = 0,
    reward = [],
    stuff = [],
    coin_cost = [],
    target = [],
    type = 5,
    level = 5,
    ifshow = 1
    };
getRow(184)->
    #lifeskill_infoCfg {
    poolid = 184,
    item_id = 24823,
    skillname = "活动奖励",
    get_weight = 1000,
    energy_cost = 20,
    get_way = [2,0],
    get_num = [1,1],
    get_exp = 0,
    reward = [],
    stuff = [],
    coin_cost = [],
    target = [],
    type = 5,
    level = 5,
    ifshow = 1
    };
getRow(185)->
    #lifeskill_infoCfg {
    poolid = 185,
    item_id = 24824,
    skillname = "活动奖励",
    get_weight = 1000,
    energy_cost = 20,
    get_way = [2,0],
    get_num = [1,1],
    get_exp = 0,
    reward = [],
    stuff = [],
    coin_cost = [],
    target = [],
    type = 5,
    level = 5,
    ifshow = 1
    };
getRow(186)->
    #lifeskill_infoCfg {
    poolid = 186,
    item_id = 24825,
    skillname = "活动奖励",
    get_weight = 1000,
    energy_cost = 20,
    get_way = [2,0],
    get_num = [1,1],
    get_exp = 0,
    reward = [],
    stuff = [],
    coin_cost = [],
    target = [],
    type = 5,
    level = 5,
    ifshow = 1
    };
getRow(187)->
    #lifeskill_infoCfg {
    poolid = 187,
    item_id = 24826,
    skillname = "活动奖励",
    get_weight = 1000,
    energy_cost = 20,
    get_way = [2,0],
    get_num = [1,1],
    get_exp = 500,
    reward = [],
    stuff = [{24502,36},{24500,17}],
    coin_cost = [],
    target = [],
    type = 5,
    level = 1,
    ifshow = 1
    };
getRow(188)->
    #lifeskill_infoCfg {
    poolid = 188,
    item_id = 24827,
    skillname = "活动奖励",
    get_weight = 1000,
    energy_cost = 20,
    get_way = [2,0],
    get_num = [1,1],
    get_exp = 1200,
    reward = [],
    stuff = [{24502,21},{24406,28}],
    coin_cost = [],
    target = [],
    type = 5,
    level = 2,
    ifshow = 1
    };
getRow(189)->
    #lifeskill_infoCfg {
    poolid = 189,
    item_id = 24828,
    skillname = "活动奖励",
    get_weight = 1000,
    energy_cost = 20,
    get_way = [2,0],
    get_num = [1,1],
    get_exp = 0,
    reward = [],
    stuff = [],
    coin_cost = [],
    target = [],
    type = 5,
    level = 5,
    ifshow = 1
    };
getRow(190)->
    #lifeskill_infoCfg {
    poolid = 190,
    item_id = 24829,
    skillname = "活动奖励",
    get_weight = 1000,
    energy_cost = 20,
    get_way = [2,0],
    get_num = [1,1],
    get_exp = 0,
    reward = [],
    stuff = [],
    coin_cost = [],
    target = [],
    type = 5,
    level = 5,
    ifshow = 1
    };
getRow(191)->
    #lifeskill_infoCfg {
    poolid = 191,
    item_id = 24830,
    skillname = "装修技能",
    get_weight = 1000,
    energy_cost = 20,
    get_way = [2,0],
    get_num = [1,1],
    get_exp = 12100,
    reward = [],
    stuff = [{24069,280},{24517,58}],
    coin_cost = [],
    target = [],
    type = 5,
    level = 6,
    ifshow = 1
    };
getRow(192)->
    #lifeskill_infoCfg {
    poolid = 192,
    item_id = 24831,
    skillname = "商城出售",
    get_weight = 1000,
    energy_cost = 20,
    get_way = [2,0],
    get_num = [1,1],
    get_exp = 0,
    reward = [],
    stuff = [],
    coin_cost = [],
    target = [],
    type = 5,
    level = 6,
    ifshow = 1
    };
getRow(193)->
    #lifeskill_infoCfg {
    poolid = 193,
    item_id = 24832,
    skillname = "装修技能",
    get_weight = 1000,
    energy_cost = 20,
    get_way = [2,0],
    get_num = [1,1],
    get_exp = 12100,
    reward = [],
    stuff = [{24518,83},{24514,83}],
    coin_cost = [],
    target = [],
    type = 5,
    level = 6,
    ifshow = 1
    };
getRow(194)->
    #lifeskill_infoCfg {
    poolid = 194,
    item_id = 24833,
    skillname = "幽界商店",
    get_weight = 1000,
    energy_cost = 20,
    get_way = [2,0],
    get_num = [1,1],
    get_exp = 0,
    reward = [],
    stuff = [],
    coin_cost = [],
    target = [],
    type = 5,
    level = 6,
    ifshow = 1
    };
getRow(195)->
    #lifeskill_infoCfg {
    poolid = 195,
    item_id = 24834,
    skillname = "幽界商店",
    get_weight = 1000,
    energy_cost = 20,
    get_way = [2,0],
    get_num = [1,1],
    get_exp = 0,
    reward = [],
    stuff = [],
    coin_cost = [],
    target = [],
    type = 5,
    level = 6,
    ifshow = 1
    };
getRow(196)->
    #lifeskill_infoCfg {
    poolid = 196,
    item_id = 24835,
    skillname = "幽界商店",
    get_weight = 1000,
    energy_cost = 20,
    get_way = [2,0],
    get_num = [1,1],
    get_exp = 0,
    reward = [],
    stuff = [],
    coin_cost = [],
    target = [],
    type = 5,
    level = 6,
    ifshow = 1
    };
getRow(197)->
    #lifeskill_infoCfg {
    poolid = 197,
    item_id = 24836,
    skillname = "幽界商店",
    get_weight = 1000,
    energy_cost = 20,
    get_way = [2,0],
    get_num = [1,1],
    get_exp = 0,
    reward = [],
    stuff = [],
    coin_cost = [],
    target = [],
    type = 5,
    level = 6,
    ifshow = 1
    };
getRow(198)->
    #lifeskill_infoCfg {
    poolid = 198,
    item_id = 24837,
    skillname = "幽界商店",
    get_weight = 1000,
    energy_cost = 20,
    get_way = [2,0],
    get_num = [1,1],
    get_exp = 0,
    reward = [],
    stuff = [],
    coin_cost = [],
    target = [],
    type = 5,
    level = 6,
    ifshow = 1
    };
getRow(199)->
    #lifeskill_infoCfg {
    poolid = 199,
    item_id = 24838,
    skillname = "幽界商店",
    get_weight = 1000,
    energy_cost = 20,
    get_way = [2,0],
    get_num = [1,1],
    get_exp = 0,
    reward = [],
    stuff = [],
    coin_cost = [],
    target = [],
    type = 5,
    level = 6,
    ifshow = 1
    };
getRow(200)->
    #lifeskill_infoCfg {
    poolid = 200,
    item_id = 24839,
    skillname = "幽界商店",
    get_weight = 1000,
    energy_cost = 20,
    get_way = [2,0],
    get_num = [1,1],
    get_exp = 0,
    reward = [],
    stuff = [],
    coin_cost = [],
    target = [],
    type = 5,
    level = 6,
    ifshow = 1
    };
getRow(201)->
    #lifeskill_infoCfg {
    poolid = 201,
    item_id = 24840,
    skillname = "幽界商店",
    get_weight = 1000,
    energy_cost = 20,
    get_way = [2,0],
    get_num = [1,1],
    get_exp = 0,
    reward = [],
    stuff = [],
    coin_cost = [],
    target = [],
    type = 5,
    level = 6,
    ifshow = 1
    };
getRow(202)->
    #lifeskill_infoCfg {
    poolid = 202,
    item_id = 24841,
    skillname = "商城出售",
    get_weight = 1000,
    energy_cost = 20,
    get_way = [2,0],
    get_num = [1,1],
    get_exp = 0,
    reward = [],
    stuff = [],
    coin_cost = [],
    target = [],
    type = 5,
    level = 6,
    ifshow = 1
    };
getRow(203)->
    #lifeskill_infoCfg {
    poolid = 203,
    item_id = 24842,
    skillname = "幽界商店",
    get_weight = 1000,
    energy_cost = 20,
    get_way = [2,0],
    get_num = [1,1],
    get_exp = 0,
    reward = [],
    stuff = [],
    coin_cost = [],
    target = [],
    type = 5,
    level = 6,
    ifshow = 1
    };
getRow(204)->
    #lifeskill_infoCfg {
    poolid = 204,
    item_id = 24843,
    skillname = "商城出售",
    get_weight = 1000,
    energy_cost = 20,
    get_way = [2,0],
    get_num = [1,1],
    get_exp = 0,
    reward = [],
    stuff = [],
    coin_cost = [],
    target = [],
    type = 5,
    level = 6,
    ifshow = 1
    };
getRow(205)->
    #lifeskill_infoCfg {
    poolid = 205,
    item_id = 24844,
    skillname = "装修技能",
    get_weight = 1000,
    energy_cost = 20,
    get_way = [2,0],
    get_num = [1,1],
    get_exp = 12100,
    reward = [],
    stuff = [{24069,280},{24517,58}],
    coin_cost = [],
    target = [],
    type = 5,
    level = 6,
    ifshow = 1
    };
getRow(206)->
    #lifeskill_infoCfg {
    poolid = 206,
    item_id = 24845,
    skillname = "商城出售",
    get_weight = 1000,
    energy_cost = 20,
    get_way = [2,0],
    get_num = [1,1],
    get_exp = 0,
    reward = [],
    stuff = [],
    coin_cost = [],
    target = [],
    type = 5,
    level = 6,
    ifshow = 1
    };
getRow(207)->
    #lifeskill_infoCfg {
    poolid = 207,
    item_id = 24846,
    skillname = "幽界商店",
    get_weight = 1000,
    energy_cost = 20,
    get_way = [2,0],
    get_num = [1,1],
    get_exp = 0,
    reward = [],
    stuff = [],
    coin_cost = [],
    target = [],
    type = 5,
    level = 6,
    ifshow = 1
    };
getRow(208)->
    #lifeskill_infoCfg {
    poolid = 208,
    item_id = 24847,
    skillname = "幽界商店",
    get_weight = 1000,
    energy_cost = 20,
    get_way = [2,0],
    get_num = [1,1],
    get_exp = 0,
    reward = [],
    stuff = [],
    coin_cost = [],
    target = [],
    type = 5,
    level = 6,
    ifshow = 1
    };
getRow(209)->
    #lifeskill_infoCfg {
    poolid = 209,
    item_id = 24848,
    skillname = "预定转盘",
    get_weight = 1000,
    energy_cost = 20,
    get_way = [2,0],
    get_num = [1,1],
    get_exp = 0,
    reward = [],
    stuff = [],
    coin_cost = [],
    target = [],
    type = 5,
    level = 6,
    ifshow = 1
    };
getRow(210)->
    #lifeskill_infoCfg {
    poolid = 210,
    item_id = 24849,
    skillname = "预定转盘",
    get_weight = 1000,
    energy_cost = 20,
    get_way = [2,0],
    get_num = [1,1],
    get_exp = 0,
    reward = [],
    stuff = [],
    coin_cost = [],
    target = [],
    type = 5,
    level = 6,
    ifshow = 1
    };
getRow(211)->
    #lifeskill_infoCfg {
    poolid = 211,
    item_id = 24850,
    skillname = "幽界商店",
    get_weight = 1000,
    energy_cost = 20,
    get_way = [2,0],
    get_num = [1,1],
    get_exp = 0,
    reward = [],
    stuff = [],
    coin_cost = [],
    target = [],
    type = 5,
    level = 6,
    ifshow = 1
    };
getRow(212)->
    #lifeskill_infoCfg {
    poolid = 212,
    item_id = 24316,
    skillname = "6级钓鱼",
    get_weight = 41000,
    energy_cost = 2,
    get_way = [1,0],
    get_num = [1,1],
    get_exp = 60,
    reward = [{14166,1,1,150},{14167,1,1,150},{14190,1,1,400}],
    stuff = [],
    coin_cost = [],
    target = [5421],
    type = 1,
    level = 6,
    ifshow = 1
    };
getRow(213)->
    #lifeskill_infoCfg {
    poolid = 213,
    item_id = 24317,
    skillname = "6级钓鱼",
    get_weight = 41000,
    energy_cost = 2,
    get_way = [1,0],
    get_num = [1,1],
    get_exp = 60,
    reward = [{14168,1,1,150},{14169,1,1,150},{14190,1,1,400}],
    stuff = [],
    coin_cost = [],
    target = [5421],
    type = 1,
    level = 6,
    ifshow = 1
    };
getRow(214)->
    #lifeskill_infoCfg {
    poolid = 214,
    item_id = 24318,
    skillname = "6级钓鱼",
    get_weight = 41000,
    energy_cost = 2,
    get_way = [1,0],
    get_num = [1,1],
    get_exp = 60,
    reward = [{14190,1,1,700}],
    stuff = [],
    coin_cost = [],
    target = [5421],
    type = 1,
    level = 6,
    ifshow = 1
    };
getRow(215)->
    #lifeskill_infoCfg {
    poolid = 215,
    item_id = 24425,
    skillname = "6级狩猎",
    get_weight = 1000,
    energy_cost = 4,
    get_way = [3,4025],
    get_num = [2,2],
    get_exp = 120,
    reward = [],
    stuff = [],
    coin_cost = [],
    target = [],
    type = 2,
    level = 6,
    ifshow = 1
    };
getRow(216)->
    #lifeskill_infoCfg {
    poolid = 216,
    item_id = 24426,
    skillname = "6级狩猎",
    get_weight = 1000,
    energy_cost = 4,
    get_way = [3,4026],
    get_num = [2,2],
    get_exp = 120,
    reward = [],
    stuff = [],
    coin_cost = [],
    target = [],
    type = 2,
    level = 6,
    ifshow = 1
    };
getRow(217)->
    #lifeskill_infoCfg {
    poolid = 217,
    item_id = 24427,
    skillname = "6级狩猎",
    get_weight = 1000,
    energy_cost = 4,
    get_way = [3,4027],
    get_num = [2,2],
    get_exp = 120,
    reward = [],
    stuff = [],
    coin_cost = [],
    target = [],
    type = 2,
    level = 6,
    ifshow = 1
    };
getRow(218)->
    #lifeskill_infoCfg {
    poolid = 218,
    item_id = 24516,
    skillname = "6级采矿",
    get_weight = 41000,
    energy_cost = 2,
    get_way = [1,0],
    get_num = [1,1],
    get_exp = 60,
    reward = [{903,1,1,40}],
    stuff = [],
    coin_cost = [],
    target = [5515,5516,5517],
    type = 3,
    level = 6,
    ifshow = 1
    };
getRow(219)->
    #lifeskill_infoCfg {
    poolid = 219,
    item_id = 24517,
    skillname = "6级采矿",
    get_weight = 41000,
    energy_cost = 2,
    get_way = [1,0],
    get_num = [1,1],
    get_exp = 60,
    reward = [{903,1,1,40}],
    stuff = [],
    coin_cost = [],
    target = [5515,5516,5517],
    type = 3,
    level = 6,
    ifshow = 1
    };
getRow(220)->
    #lifeskill_infoCfg {
    poolid = 220,
    item_id = 24518,
    skillname = "6级采矿",
    get_weight = 41000,
    energy_cost = 2,
    get_way = [1,0],
    get_num = [1,1],
    get_exp = 60,
    reward = [{903,1,1,40}],
    stuff = [],
    coin_cost = [],
    target = [5515,5516,5517],
    type = 3,
    level = 6,
    ifshow = 1
    };
getRow(221)->
    #lifeskill_infoCfg {
    poolid = 221,
    item_id = 24619,
    skillname = "6级烹饪",
    get_weight = 1000,
    energy_cost = 10,
    get_way = [2,0],
    get_num = [1,1],
    get_exp = 2400,
    reward = [],
    stuff = [{24068,80},{24425,20},{24316,8}],
    coin_cost = [],
    target = [],
    type = 4,
    level = 6,
    ifshow = 1
    };
getRow(222)->
    #lifeskill_infoCfg {
    poolid = 222,
    item_id = 24620,
    skillname = "6级烹饪",
    get_weight = 1000,
    energy_cost = 10,
    get_way = [2,0],
    get_num = [1,1],
    get_exp = 2400,
    reward = [],
    stuff = [{24068,80},{24318,8},{24424,20}],
    coin_cost = [],
    target = [],
    type = 4,
    level = 6,
    ifshow = 1
    };
getRow(223)->
    #lifeskill_infoCfg {
    poolid = 223,
    item_id = 24621,
    skillname = "6级烹饪",
    get_weight = 1000,
    energy_cost = 10,
    get_way = [2,0],
    get_num = [1,1],
    get_exp = 2400,
    reward = [],
    stuff = [{24068,80},{24313,8},{24426,20}],
    coin_cost = [],
    target = [],
    type = 4,
    level = 6,
    ifshow = 1
    };
getRow(224)->
    #lifeskill_infoCfg {
    poolid = 224,
    item_id = 24622,
    skillname = "6级烹饪",
    get_weight = 1000,
    energy_cost = 10,
    get_way = [2,0],
    get_num = [30,30],
    get_exp = 2400,
    reward = [],
    stuff = [{24067,80},{24317,8},{24518,8}],
    coin_cost = [],
    target = [],
    type = 4,
    level = 6,
    ifshow = 1
    };
getRow(225)->
    #lifeskill_infoCfg {
    poolid = 225,
    item_id = 24851,
    skillname = "幽界商店",
    get_weight = 1000,
    energy_cost = 20,
    get_way = [2,0],
    get_num = [1,1],
    get_exp = 0,
    reward = [],
    stuff = [],
    coin_cost = [],
    target = [],
    type = 5,
    level = 6,
    ifshow = 1
    };
getRow(226)->
    #lifeskill_infoCfg {
    poolid = 226,
    item_id = 24852,
    skillname = "幽界商店",
    get_weight = 1000,
    energy_cost = 20,
    get_way = [2,0],
    get_num = [1,1],
    get_exp = 0,
    reward = [],
    stuff = [],
    coin_cost = [],
    target = [],
    type = 5,
    level = 5,
    ifshow = 1
    };
getRow(227)->
    #lifeskill_infoCfg {
    poolid = 227,
    item_id = 24519,
    skillname = "7级采矿",
    get_weight = 70000,
    energy_cost = 2,
    get_way = [1,0],
    get_num = [1,1],
    get_exp = 60,
    reward = [{903,1,1,40}],
    stuff = [],
    coin_cost = [],
    target = [5518,5519,5520],
    type = 3,
    level = 7,
    ifshow = 1
    };
getRow(228)->
    #lifeskill_infoCfg {
    poolid = 228,
    item_id = 24520,
    skillname = "7级采矿",
    get_weight = 70000,
    energy_cost = 2,
    get_way = [1,0],
    get_num = [1,1],
    get_exp = 60,
    reward = [{903,1,1,40}],
    stuff = [],
    coin_cost = [],
    target = [5518,5519,5520],
    type = 3,
    level = 7,
    ifshow = 1
    };
getRow(229)->
    #lifeskill_infoCfg {
    poolid = 229,
    item_id = 24521,
    skillname = "7级采矿",
    get_weight = 70000,
    energy_cost = 2,
    get_way = [1,0],
    get_num = [1,1],
    get_exp = 60,
    reward = [{903,1,1,40}],
    stuff = [],
    coin_cost = [],
    target = [5518,5519,5520],
    type = 3,
    level = 7,
    ifshow = 1
    };
getRow(230)->
    #lifeskill_infoCfg {
    poolid = 230,
    item_id = 24319,
    skillname = "7级钓鱼",
    get_weight = 70000,
    energy_cost = 2,
    get_way = [1,0],
    get_num = [1,1],
    get_exp = 60,
    reward = [{14166,1,1,250},{14167,1,1,250},{14190,1,1,200}],
    stuff = [],
    coin_cost = [],
    target = [5421],
    type = 1,
    level = 7,
    ifshow = 1
    };
getRow(231)->
    #lifeskill_infoCfg {
    poolid = 231,
    item_id = 24320,
    skillname = "7级钓鱼",
    get_weight = 70000,
    energy_cost = 2,
    get_way = [1,0],
    get_num = [1,1],
    get_exp = 60,
    reward = [{14168,1,1,150},{14169,1,1,150},{14190,1,1,400}],
    stuff = [],
    coin_cost = [],
    target = [5421],
    type = 1,
    level = 7,
    ifshow = 1
    };
getRow(232)->
    #lifeskill_infoCfg {
    poolid = 232,
    item_id = 24321,
    skillname = "7级钓鱼",
    get_weight = 70000,
    energy_cost = 2,
    get_way = [1,0],
    get_num = [1,1],
    get_exp = 60,
    reward = [{14190,1,1,700}],
    stuff = [],
    coin_cost = [],
    target = [5421],
    type = 1,
    level = 7,
    ifshow = 1
    };
getRow(233)->
    #lifeskill_infoCfg {
    poolid = 233,
    item_id = 24626,
    skillname = "7级烹饪",
    get_weight = 1000,
    energy_cost = 10,
    get_way = [2,0],
    get_num = [1,1],
    get_exp = 2400,
    reward = [],
    stuff = [{24072,80},{24319,8},{24429,20}],
    coin_cost = [],
    target = [],
    type = 4,
    level = 7,
    ifshow = 1
    };
getRow(234)->
    #lifeskill_infoCfg {
    poolid = 234,
    item_id = 24627,
    skillname = "7级烹饪",
    get_weight = 1000,
    energy_cost = 10,
    get_way = [2,0],
    get_num = [1,1],
    get_exp = 2400,
    reward = [],
    stuff = [{24072,80},{24320,8},{24429,20}],
    coin_cost = [],
    target = [],
    type = 4,
    level = 7,
    ifshow = 1
    };
getRow(235)->
    #lifeskill_infoCfg {
    poolid = 235,
    item_id = 24628,
    skillname = "7级烹饪",
    get_weight = 1000,
    energy_cost = 10,
    get_way = [2,0],
    get_num = [1,1],
    get_exp = 2400,
    reward = [],
    stuff = [{24072,80},{24321,8},{24429,20}],
    coin_cost = [],
    target = [],
    type = 4,
    level = 7,
    ifshow = 1
    };
getRow(236)->
    #lifeskill_infoCfg {
    poolid = 236,
    item_id = 24629,
    skillname = "7级烹饪",
    get_weight = 1000,
    energy_cost = 10,
    get_way = [2,0],
    get_num = [30,30],
    get_exp = 2400,
    reward = [],
    stuff = [{24070,80},{24319,8},{24519,8}],
    coin_cost = [],
    target = [],
    type = 4,
    level = 7,
    ifshow = 1
    };
getRow(237)->
    #lifeskill_infoCfg {
    poolid = 237,
    item_id = 24102,
    skillname = "7级烹饪",
    get_weight = 1000,
    energy_cost = 10,
    get_way = [2,0],
    get_num = [1,1],
    get_exp = 2400,
    reward = [],
    stuff = [{24071,56},{24430,14},{24520,6}],
    coin_cost = [],
    target = [],
    type = 4,
    level = 7,
    ifshow = 1
    };
getRow(238)->
    #lifeskill_infoCfg {
    poolid = 238,
    item_id = 24428,
    skillname = "7级狩猎",
    get_weight = 1000,
    energy_cost = 4,
    get_way = [3,4028],
    get_num = [2,2],
    get_exp = 120,
    reward = [],
    stuff = [],
    coin_cost = [],
    target = [],
    type = 2,
    level = 7,
    ifshow = 1
    };
getRow(239)->
    #lifeskill_infoCfg {
    poolid = 239,
    item_id = 24429,
    skillname = "7级狩猎",
    get_weight = 1000,
    energy_cost = 4,
    get_way = [3,4029],
    get_num = [2,2],
    get_exp = 120,
    reward = [],
    stuff = [],
    coin_cost = [],
    target = [],
    type = 2,
    level = 7,
    ifshow = 1
    };
getRow(240)->
    #lifeskill_infoCfg {
    poolid = 240,
    item_id = 24430,
    skillname = "7级狩猎",
    get_weight = 1000,
    energy_cost = 4,
    get_way = [3,4030],
    get_num = [2,2],
    get_exp = 120,
    reward = [],
    stuff = [],
    coin_cost = [],
    target = [],
    type = 2,
    level = 7,
    ifshow = 1
    };
getRow(241)->
    #lifeskill_infoCfg {
    poolid = 241,
    item_id = 24853,
    skillname = "装修技能",
    get_weight = 1000,
    energy_cost = 20,
    get_way = [2,0],
    get_num = [1,1],
    get_exp = 18100,
    reward = [],
    stuff = [{24071,600},{24521,124}],
    coin_cost = [],
    target = [],
    type = 5,
    level = 7,
    ifshow = 1
    };
getRow(242)->
    #lifeskill_infoCfg {
    poolid = 242,
    item_id = 24854,
    skillname = "装修技能",
    get_weight = 1000,
    energy_cost = 20,
    get_way = [2,0],
    get_num = [1,1],
    get_exp = 18100,
    reward = [],
    stuff = [{24430,300},{24521,124}],
    coin_cost = [],
    target = [],
    type = 5,
    level = 7,
    ifshow = 1
    };
getRow(243)->
    #lifeskill_infoCfg {
    poolid = 243,
    item_id = 24855,
    skillname = "装修技能",
    get_weight = 1000,
    energy_cost = 20,
    get_way = [2,0],
    get_num = [1,1],
    get_exp = 18100,
    reward = [],
    stuff = [{24428,300},{24521,124}],
    coin_cost = [],
    target = [],
    type = 5,
    level = 7,
    ifshow = 1
    };
getRow(244)->
    #lifeskill_infoCfg {
    poolid = 244,
    item_id = 24856,
    skillname = "装修技能",
    get_weight = 1000,
    energy_cost = 20,
    get_way = [2,0],
    get_num = [1,1],
    get_exp = 18100,
    reward = [],
    stuff = [{24071,600},{24518,124}],
    coin_cost = [],
    target = [],
    type = 5,
    level = 7,
    ifshow = 1
    };
getRow(245)->
    #lifeskill_infoCfg {
    poolid = 245,
    item_id = 24857,
    skillname = "装修技能",
    get_weight = 1000,
    energy_cost = 20,
    get_way = [2,0],
    get_num = [1,1],
    get_exp = 18100,
    reward = [],
    stuff = [{24070,600},{24069,600}],
    coin_cost = [],
    target = [],
    type = 5,
    level = 7,
    ifshow = 1
    };
getRow(246)->
    #lifeskill_infoCfg {
    poolid = 246,
    item_id = 24858,
    skillname = "装修技能",
    get_weight = 1000,
    energy_cost = 20,
    get_way = [2,0],
    get_num = [1,1],
    get_exp = 12100,
    reward = [],
    stuff = [{24517,99},{24064,480}],
    coin_cost = [],
    target = [],
    type = 5,
    level = 6,
    ifshow = 1
    };
getRow(247)->
    #lifeskill_infoCfg {
    poolid = 247,
    item_id = 24859,
    skillname = "装修技能",
    get_weight = 1000,
    energy_cost = 20,
    get_way = [2,0],
    get_num = [1,1],
    get_exp = 12100,
    reward = [],
    stuff = [{24427,200},{24064,400}],
    coin_cost = [],
    target = [],
    type = 5,
    level = 6,
    ifshow = 1
    };
getRow(248)->
    #lifeskill_infoCfg {
    poolid = 248,
    item_id = 24860,
    skillname = "装修技能",
    get_weight = 1000,
    energy_cost = 20,
    get_way = [2,0],
    get_num = [1,1],
    get_exp = 12100,
    reward = [],
    stuff = [],
    coin_cost = [],
    target = [],
    type = 5,
    level = 6,
    ifshow = 1
    };
getRow(249)->
    #lifeskill_infoCfg {
    poolid = 249,
    item_id = 24861,
    skillname = "装修技能",
    get_weight = 1000,
    energy_cost = 20,
    get_way = [2,0],
    get_num = [1,1],
    get_exp = 18100,
    reward = [],
    stuff = [{24429,300},{24520,124}],
    coin_cost = [],
    target = [],
    type = 5,
    level = 7,
    ifshow = 1
    };
getRow(250)->
    #lifeskill_infoCfg {
    poolid = 250,
    item_id = 24862,
    skillname = "装修技能",
    get_weight = 1000,
    energy_cost = 20,
    get_way = [2,0],
    get_num = [1,1],
    get_exp = 12100,
    reward = [],
    stuff = [{24427,200},{24517,83}],
    coin_cost = [],
    target = [],
    type = 5,
    level = 6,
    ifshow = 1
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
    {250}
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
    250
    ].

