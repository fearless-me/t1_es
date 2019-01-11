%% coding: latin-1
%%: 实现
-module(cfg_find_res_chs).
-compile(export_all).
-include("cfg_find_res.hrl").
-include("logger.hrl").

getRow(1)->
    #find_resCfg {
    id = 1,
    ac_id = 2,
    name = "家族的委托",
    max_times = 2,
    open_level = 28,
    lvl_s = 28,
    lvl_e = 33,
    diamonds_find = 2,
    use_diamond = 500,
    ext_item = [{2002,263}],
    reward_exp = 0,
    type_number = [{1,43750}],
    value = 0
    };
getRow(2)->
    #find_resCfg {
    id = 2,
    ac_id = 2,
    name = "家族的委托",
    max_times = 2,
    open_level = 28,
    lvl_s = 34,
    lvl_e = 45,
    diamonds_find = 2,
    use_diamond = 500,
    ext_item = [{2002,298}],
    reward_exp = 0,
    type_number = [{1,48300}],
    value = 0
    };
getRow(3)->
    #find_resCfg {
    id = 3,
    ac_id = 2,
    name = "家族的委托",
    max_times = 2,
    open_level = 28,
    lvl_s = 46,
    lvl_e = 57,
    diamonds_find = 2,
    use_diamond = 500,
    ext_item = [{2002,306}],
    reward_exp = 0,
    type_number = [{1,52500}],
    value = 0
    };
getRow(4)->
    #find_resCfg {
    id = 4,
    ac_id = 2,
    name = "家族的委托",
    max_times = 2,
    open_level = 28,
    lvl_s = 58,
    lvl_e = 67,
    diamonds_find = 2,
    use_diamond = 500,
    ext_item = [{2002,333}],
    reward_exp = 0,
    type_number = [{1,57050}],
    value = 0
    };
getRow(5)->
    #find_resCfg {
    id = 5,
    ac_id = 2,
    name = "家族的委托",
    max_times = 2,
    open_level = 28,
    lvl_s = 68,
    lvl_e = 75,
    diamonds_find = 2,
    use_diamond = 500,
    ext_item = [{2002,350}],
    reward_exp = 0,
    type_number = [{1,61250}],
    value = 0
    };
getRow(6)->
    #find_resCfg {
    id = 6,
    ac_id = 2,
    name = "家族的委托",
    max_times = 2,
    open_level = 28,
    lvl_s = 76,
    lvl_e = 81,
    diamonds_find = 2,
    use_diamond = 500,
    ext_item = [{2002,368}],
    reward_exp = 0,
    type_number = [{1,65800}],
    value = 0
    };
getRow(7)->
    #find_resCfg {
    id = 7,
    ac_id = 2,
    name = "家族的委托",
    max_times = 2,
    open_level = 28,
    lvl_s = 82,
    lvl_e = 87,
    diamonds_find = 2,
    use_diamond = 500,
    ext_item = [{2002,394}],
    reward_exp = 0,
    type_number = [{1,70000}],
    value = 0
    };
getRow(8)->
    #find_resCfg {
    id = 8,
    ac_id = 2,
    name = "家族的委托",
    max_times = 2,
    open_level = 28,
    lvl_s = 88,
    lvl_e = 91,
    diamonds_find = 2,
    use_diamond = 500,
    ext_item = [{2002,403}],
    reward_exp = 0,
    type_number = [{1,76650}],
    value = 0
    };
getRow(9)->
    #find_resCfg {
    id = 9,
    ac_id = 2,
    name = "家族的委托",
    max_times = 2,
    open_level = 28,
    lvl_s = 92,
    lvl_e = 99,
    diamonds_find = 2,
    use_diamond = 500,
    ext_item = [{2002,438}],
    reward_exp = 0,
    type_number = [{1,83300}],
    value = 0
    };
getRow(10)->
    #find_resCfg {
    id = 10,
    ac_id = 2,
    name = "家族的委托",
    max_times = 2,
    open_level = 28,
    lvl_s = 100,
    lvl_e = 109,
    diamonds_find = 2,
    use_diamond = 500,
    ext_item = [{2002,481}],
    reward_exp = 0,
    type_number = [{1,89600}],
    value = 0
    };
getRow(11)->
    #find_resCfg {
    id = 11,
    ac_id = 2,
    name = "家族的委托",
    max_times = 2,
    open_level = 28,
    lvl_s = 110,
    lvl_e = 119,
    diamonds_find = 2,
    use_diamond = 500,
    ext_item = [{2002,525}],
    reward_exp = 0,
    type_number = [{1,96250}],
    value = 0
    };
getRow(12)->
    #find_resCfg {
    id = 12,
    ac_id = 2,
    name = "家族的委托",
    max_times = 2,
    open_level = 28,
    lvl_s = 120,
    lvl_e = 129,
    diamonds_find = 2,
    use_diamond = 500,
    ext_item = [{2002,569}],
    reward_exp = 0,
    type_number = [{1,102900}],
    value = 0
    };
getRow(13)->
    #find_resCfg {
    id = 13,
    ac_id = 2,
    name = "家族的委托",
    max_times = 2,
    open_level = 28,
    lvl_s = 130,
    lvl_e = 139,
    diamonds_find = 2,
    use_diamond = 500,
    ext_item = [{2002,613}],
    reward_exp = 0,
    type_number = [{1,109550}],
    value = 0
    };
getRow(14)->
    #find_resCfg {
    id = 14,
    ac_id = 2,
    name = "家族的委托",
    max_times = 2,
    open_level = 28,
    lvl_s = 140,
    lvl_e = 149,
    diamonds_find = 2,
    use_diamond = 500,
    ext_item = [{2002,656}],
    reward_exp = 0,
    type_number = [{1,115850}],
    value = 0
    };
getRow(15)->
    #find_resCfg {
    id = 15,
    ac_id = 2,
    name = "家族的委托",
    max_times = 2,
    open_level = 28,
    lvl_s = 150,
    lvl_e = 159,
    diamonds_find = 2,
    use_diamond = 500,
    ext_item = [{2002,700}],
    reward_exp = 0,
    type_number = [{1,122500}],
    value = 0
    };
getRow(16)->
    #find_resCfg {
    id = 16,
    ac_id = 2,
    name = "家族的委托",
    max_times = 2,
    open_level = 28,
    lvl_s = 160,
    lvl_e = 169,
    diamonds_find = 2,
    use_diamond = 500,
    ext_item = [{2002,744}],
    reward_exp = 0,
    type_number = [{1,135800}],
    value = 0
    };
getRow(17)->
    #find_resCfg {
    id = 17,
    ac_id = 2,
    name = "家族的委托",
    max_times = 2,
    open_level = 28,
    lvl_s = 170,
    lvl_e = 179,
    diamonds_find = 2,
    use_diamond = 500,
    ext_item = [{2002,788}],
    reward_exp = 0,
    type_number = [{1,148750}],
    value = 0
    };
getRow(18)->
    #find_resCfg {
    id = 18,
    ac_id = 2,
    name = "家族的委托",
    max_times = 2,
    open_level = 28,
    lvl_s = 180,
    lvl_e = 189,
    diamonds_find = 2,
    use_diamond = 500,
    ext_item = [{2002,831}],
    reward_exp = 0,
    type_number = [{1,162050}],
    value = 0
    };
getRow(19)->
    #find_resCfg {
    id = 19,
    ac_id = 2,
    name = "家族的委托",
    max_times = 2,
    open_level = 28,
    lvl_s = 190,
    lvl_e = 199,
    diamonds_find = 2,
    use_diamond = 500,
    ext_item = [{2002,875}],
    reward_exp = 0,
    type_number = [{1,175000}],
    value = 0
    };
getRow(20)->
    #find_resCfg {
    id = 20,
    ac_id = 2,
    name = "家族的委托",
    max_times = 2,
    open_level = 28,
    lvl_s = 200,
    lvl_e = 210,
    diamonds_find = 2,
    use_diamond = 500,
    ext_item = [{2002,919}],
    reward_exp = 0,
    type_number = [{1,189000}],
    value = 0
    };
getRow(21)->
    #find_resCfg {
    id = 21,
    ac_id = 1,
    name = "守卫女神",
    max_times = 2,
    open_level = 70,
    lvl_s = 70,
    lvl_e = 87,
    diamonds_find = 2,
    use_diamond = 400,
    ext_item = [{270,1}],
    reward_exp = 0,
    type_number = [],
    value = 0
    };
getRow(22)->
    #find_resCfg {
    id = 22,
    ac_id = 1,
    name = "守卫女神",
    max_times = 2,
    open_level = 70,
    lvl_s = 88,
    lvl_e = 103,
    diamonds_find = 2,
    use_diamond = 400,
    ext_item = [{270,1}],
    reward_exp = 0,
    type_number = [],
    value = 0
    };
getRow(23)->
    #find_resCfg {
    id = 23,
    ac_id = 1,
    name = "守卫女神",
    max_times = 2,
    open_level = 70,
    lvl_s = 104,
    lvl_e = 117,
    diamonds_find = 2,
    use_diamond = 400,
    ext_item = [{270,2}],
    reward_exp = 0,
    type_number = [],
    value = 0
    };
getRow(24)->
    #find_resCfg {
    id = 24,
    ac_id = 1,
    name = "守卫女神",
    max_times = 2,
    open_level = 70,
    lvl_s = 118,
    lvl_e = 131,
    diamonds_find = 2,
    use_diamond = 400,
    ext_item = [{270,2}],
    reward_exp = 0,
    type_number = [],
    value = 0
    };
getRow(25)->
    #find_resCfg {
    id = 25,
    ac_id = 1,
    name = "守卫女神",
    max_times = 2,
    open_level = 70,
    lvl_s = 132,
    lvl_e = 143,
    diamonds_find = 2,
    use_diamond = 400,
    ext_item = [{270,3}],
    reward_exp = 0,
    type_number = [],
    value = 0
    };
getRow(26)->
    #find_resCfg {
    id = 26,
    ac_id = 1,
    name = "守卫女神",
    max_times = 2,
    open_level = 70,
    lvl_s = 144,
    lvl_e = 159,
    diamonds_find = 2,
    use_diamond = 400,
    ext_item = [{270,3}],
    reward_exp = 0,
    type_number = [],
    value = 0
    };
getRow(27)->
    #find_resCfg {
    id = 27,
    ac_id = 1,
    name = "守卫女神",
    max_times = 2,
    open_level = 70,
    lvl_s = 160,
    lvl_e = 179,
    diamonds_find = 2,
    use_diamond = 400,
    ext_item = [{270,4}],
    reward_exp = 0,
    type_number = [],
    value = 0
    };
getRow(28)->
    #find_resCfg {
    id = 28,
    ac_id = 1,
    name = "守卫女神",
    max_times = 2,
    open_level = 70,
    lvl_s = 180,
    lvl_e = 199,
    diamonds_find = 2,
    use_diamond = 400,
    ext_item = [{270,4}],
    reward_exp = 0,
    type_number = [],
    value = 0
    };
getRow(29)->
    #find_resCfg {
    id = 29,
    ac_id = 1,
    name = "守卫女神",
    max_times = 2,
    open_level = 70,
    lvl_s = 200,
    lvl_e = 210,
    diamonds_find = 2,
    use_diamond = 400,
    ext_item = [{270,5}],
    reward_exp = 0,
    type_number = [],
    value = 0
    };
getRow(32)->
    #find_resCfg {
    id = 32,
    ac_id = 6,
    name = "惊天喵盗团",
    max_times = 2,
    open_level = 38,
    lvl_s = 38,
    lvl_e = 37,
    diamonds_find = 2,
    use_diamond = 400,
    reward_exp = 0,
    type_number = [{1,50000}],
    value = 0
    };
getRow(33)->
    #find_resCfg {
    id = 33,
    ac_id = 6,
    name = "惊天喵盗团",
    max_times = 2,
    open_level = 38,
    lvl_s = 38,
    lvl_e = 57,
    diamonds_find = 2,
    use_diamond = 400,
    reward_exp = 0,
    type_number = [{1,50000}],
    value = 0
    };
getRow(34)->
    #find_resCfg {
    id = 34,
    ac_id = 6,
    name = "惊天喵盗团",
    max_times = 2,
    open_level = 38,
    lvl_s = 58,
    lvl_e = 71,
    diamonds_find = 2,
    use_diamond = 400,
    reward_exp = 0,
    type_number = [{1,57500}],
    value = 0
    };
getRow(35)->
    #find_resCfg {
    id = 35,
    ac_id = 6,
    name = "惊天喵盗团",
    max_times = 2,
    open_level = 38,
    lvl_s = 72,
    lvl_e = 85,
    diamonds_find = 2,
    use_diamond = 400,
    reward_exp = 0,
    type_number = [{1,65000}],
    value = 0
    };
getRow(36)->
    #find_resCfg {
    id = 36,
    ac_id = 6,
    name = "惊天喵盗团",
    max_times = 2,
    open_level = 38,
    lvl_s = 86,
    lvl_e = 99,
    diamonds_find = 2,
    use_diamond = 400,
    reward_exp = 0,
    type_number = [{1,72500}],
    value = 0
    };
getRow(37)->
    #find_resCfg {
    id = 37,
    ac_id = 6,
    name = "惊天喵盗团",
    max_times = 2,
    open_level = 38,
    lvl_s = 100,
    lvl_e = 113,
    diamonds_find = 2,
    use_diamond = 400,
    reward_exp = 0,
    type_number = [{1,80000}],
    value = 0
    };
getRow(38)->
    #find_resCfg {
    id = 38,
    ac_id = 6,
    name = "惊天喵盗团",
    max_times = 2,
    open_level = 38,
    lvl_s = 114,
    lvl_e = 127,
    diamonds_find = 2,
    use_diamond = 400,
    reward_exp = 0,
    type_number = [{1,87500}],
    value = 0
    };
getRow(39)->
    #find_resCfg {
    id = 39,
    ac_id = 6,
    name = "惊天喵盗团",
    max_times = 2,
    open_level = 38,
    lvl_s = 128,
    lvl_e = 137,
    diamonds_find = 2,
    use_diamond = 400,
    reward_exp = 0,
    type_number = [{1,95000}],
    value = 0
    };
getRow(40)->
    #find_resCfg {
    id = 40,
    ac_id = 6,
    name = "惊天喵盗团",
    max_times = 2,
    open_level = 38,
    lvl_s = 138,
    lvl_e = 147,
    diamonds_find = 2,
    use_diamond = 400,
    reward_exp = 0,
    type_number = [{1,102500}],
    value = 0
    };
getRow(41)->
    #find_resCfg {
    id = 41,
    ac_id = 6,
    name = "惊天喵盗团",
    max_times = 2,
    open_level = 38,
    lvl_s = 148,
    lvl_e = 157,
    diamonds_find = 2,
    use_diamond = 400,
    reward_exp = 0,
    type_number = [{1,110000}],
    value = 0
    };
getRow(42)->
    #find_resCfg {
    id = 42,
    ac_id = 6,
    name = "惊天喵盗团",
    max_times = 2,
    open_level = 38,
    lvl_s = 158,
    lvl_e = 167,
    diamonds_find = 2,
    use_diamond = 400,
    reward_exp = 0,
    type_number = [{1,115000}],
    value = 0
    };
getRow(43)->
    #find_resCfg {
    id = 43,
    ac_id = 6,
    name = "惊天喵盗团",
    max_times = 2,
    open_level = 38,
    lvl_s = 168,
    lvl_e = 177,
    diamonds_find = 2,
    use_diamond = 400,
    reward_exp = 0,
    type_number = [{1,120000}],
    value = 0
    };
getRow(44)->
    #find_resCfg {
    id = 44,
    ac_id = 6,
    name = "惊天喵盗团",
    max_times = 2,
    open_level = 38,
    lvl_s = 178,
    lvl_e = 187,
    diamonds_find = 2,
    use_diamond = 400,
    reward_exp = 0,
    type_number = [{1,125000}],
    value = 0
    };
getRow(45)->
    #find_resCfg {
    id = 45,
    ac_id = 6,
    name = "惊天喵盗团",
    max_times = 2,
    open_level = 38,
    lvl_s = 188,
    lvl_e = 210,
    diamonds_find = 2,
    use_diamond = 400,
    reward_exp = 0,
    type_number = [{1,130000}],
    value = 0
    };
getRow(47)->
    #find_resCfg {
    id = 47,
    ac_id = 8,
    name = "经验升降梯",
    max_times = 2,
    open_level = 34,
    lvl_s = 34,
    lvl_e = 45,
    diamonds_find = 2,
    use_diamond = 500,
    reward_exp = 225000,
    type_number = [],
    value = 0
    };
getRow(48)->
    #find_resCfg {
    id = 48,
    ac_id = 8,
    name = "经验升降梯",
    max_times = 2,
    open_level = 34,
    lvl_s = 46,
    lvl_e = 57,
    diamonds_find = 2,
    use_diamond = 500,
    reward_exp = 292500,
    type_number = [],
    value = 0
    };
getRow(49)->
    #find_resCfg {
    id = 49,
    ac_id = 8,
    name = "经验升降梯",
    max_times = 2,
    open_level = 34,
    lvl_s = 58,
    lvl_e = 67,
    diamonds_find = 2,
    use_diamond = 500,
    reward_exp = 348750,
    type_number = [],
    value = 0
    };
getRow(50)->
    #find_resCfg {
    id = 50,
    ac_id = 8,
    name = "经验升降梯",
    max_times = 2,
    open_level = 34,
    lvl_s = 68,
    lvl_e = 75,
    diamonds_find = 2,
    use_diamond = 500,
    reward_exp = 405000,
    type_number = [],
    value = 0
    };
getRow(51)->
    #find_resCfg {
    id = 51,
    ac_id = 8,
    name = "经验升降梯",
    max_times = 2,
    open_level = 34,
    lvl_s = 76,
    lvl_e = 85,
    diamonds_find = 2,
    use_diamond = 500,
    reward_exp = 461250,
    type_number = [],
    value = 0
    };
getRow(52)->
    #find_resCfg {
    id = 52,
    ac_id = 8,
    name = "经验升降梯",
    max_times = 2,
    open_level = 34,
    lvl_s = 86,
    lvl_e = 95,
    diamonds_find = 2,
    use_diamond = 500,
    reward_exp = 528750,
    type_number = [],
    value = 0
    };
getRow(53)->
    #find_resCfg {
    id = 53,
    ac_id = 8,
    name = "经验升降梯",
    max_times = 2,
    open_level = 34,
    lvl_s = 96,
    lvl_e = 105,
    diamonds_find = 2,
    use_diamond = 500,
    reward_exp = 596250,
    type_number = [],
    value = 0
    };
getRow(54)->
    #find_resCfg {
    id = 54,
    ac_id = 8,
    name = "经验升降梯",
    max_times = 2,
    open_level = 34,
    lvl_s = 106,
    lvl_e = 115,
    diamonds_find = 2,
    use_diamond = 500,
    reward_exp = 663750,
    type_number = [],
    value = 0
    };
getRow(55)->
    #find_resCfg {
    id = 55,
    ac_id = 8,
    name = "经验升降梯",
    max_times = 2,
    open_level = 34,
    lvl_s = 116,
    lvl_e = 125,
    diamonds_find = 2,
    use_diamond = 500,
    reward_exp = 731250,
    type_number = [],
    value = 0
    };
getRow(56)->
    #find_resCfg {
    id = 56,
    ac_id = 8,
    name = "经验升降梯",
    max_times = 2,
    open_level = 34,
    lvl_s = 126,
    lvl_e = 135,
    diamonds_find = 2,
    use_diamond = 500,
    reward_exp = 798750,
    type_number = [],
    value = 0
    };
getRow(57)->
    #find_resCfg {
    id = 57,
    ac_id = 8,
    name = "经验升降梯",
    max_times = 2,
    open_level = 34,
    lvl_s = 136,
    lvl_e = 145,
    diamonds_find = 2,
    use_diamond = 500,
    reward_exp = 866250,
    type_number = [],
    value = 0
    };
getRow(58)->
    #find_resCfg {
    id = 58,
    ac_id = 8,
    name = "经验升降梯",
    max_times = 2,
    open_level = 34,
    lvl_s = 146,
    lvl_e = 155,
    diamonds_find = 2,
    use_diamond = 500,
    reward_exp = 933750,
    type_number = [],
    value = 0
    };
getRow(59)->
    #find_resCfg {
    id = 59,
    ac_id = 8,
    name = "经验升降梯",
    max_times = 2,
    open_level = 34,
    lvl_s = 156,
    lvl_e = 165,
    diamonds_find = 2,
    use_diamond = 500,
    reward_exp = 1001250,
    type_number = [],
    value = 0
    };
getRow(60)->
    #find_resCfg {
    id = 60,
    ac_id = 8,
    name = "经验升降梯",
    max_times = 2,
    open_level = 34,
    lvl_s = 166,
    lvl_e = 175,
    diamonds_find = 2,
    use_diamond = 500,
    reward_exp = 1068750,
    type_number = [],
    value = 0
    };
getRow(61)->
    #find_resCfg {
    id = 61,
    ac_id = 8,
    name = "经验升降梯",
    max_times = 2,
    open_level = 34,
    lvl_s = 176,
    lvl_e = 185,
    diamonds_find = 2,
    use_diamond = 500,
    reward_exp = 1136250,
    type_number = [],
    value = 0
    };
getRow(62)->
    #find_resCfg {
    id = 62,
    ac_id = 8,
    name = "经验升降梯",
    max_times = 2,
    open_level = 34,
    lvl_s = 186,
    lvl_e = 195,
    diamonds_find = 2,
    use_diamond = 500,
    reward_exp = 1203750,
    type_number = [],
    value = 0
    };
getRow(63)->
    #find_resCfg {
    id = 63,
    ac_id = 8,
    name = "经验升降梯",
    max_times = 2,
    open_level = 34,
    lvl_s = 196,
    lvl_e = 205,
    diamonds_find = 2,
    use_diamond = 500,
    reward_exp = 1271250,
    type_number = [],
    value = 0
    };
getRow(64)->
    #find_resCfg {
    id = 64,
    ac_id = 8,
    name = "经验升降梯",
    max_times = 2,
    open_level = 34,
    lvl_s = 206,
    lvl_e = 210,
    diamonds_find = 2,
    use_diamond = 500,
    reward_exp = 1338750,
    type_number = [],
    value = 0
    };
getRow(65)->
    #find_resCfg {
    id = 65,
    ac_id = 10,
    name = "元素保卫战",
    max_times = 2,
    open_level = 40,
    lvl_s = 40,
    lvl_e = 67,
    diamonds_find = 2,
    use_diamond = 600,
    ext_item = [{3000,1}],
    reward_exp = 0,
    type_number = [],
    value = 0
    };
getRow(66)->
    #find_resCfg {
    id = 66,
    ac_id = 10,
    name = "元素保卫战",
    max_times = 2,
    open_level = 40,
    lvl_s = 68,
    lvl_e = 89,
    diamonds_find = 2,
    use_diamond = 600,
    ext_item = [{3001,1}],
    reward_exp = 0,
    type_number = [],
    value = 0
    };
getRow(67)->
    #find_resCfg {
    id = 67,
    ac_id = 10,
    name = "元素保卫战",
    max_times = 2,
    open_level = 40,
    lvl_s = 90,
    lvl_e = 109,
    diamonds_find = 2,
    use_diamond = 600,
    ext_item = [{3002,1}],
    reward_exp = 0,
    type_number = [],
    value = 0
    };
getRow(68)->
    #find_resCfg {
    id = 68,
    ac_id = 10,
    name = "元素保卫战",
    max_times = 2,
    open_level = 40,
    lvl_s = 110,
    lvl_e = 124,
    diamonds_find = 2,
    use_diamond = 600,
    ext_item = [{3003,1}],
    reward_exp = 0,
    type_number = [],
    value = 0
    };
getRow(69)->
    #find_resCfg {
    id = 69,
    ac_id = 10,
    name = "元素保卫战",
    max_times = 2,
    open_level = 40,
    lvl_s = 125,
    lvl_e = 139,
    diamonds_find = 2,
    use_diamond = 600,
    ext_item = [{3004,1}],
    reward_exp = 0,
    type_number = [],
    value = 0
    };
getRow(70)->
    #find_resCfg {
    id = 70,
    ac_id = 10,
    name = "元素保卫战",
    max_times = 2,
    open_level = 40,
    lvl_s = 140,
    lvl_e = 159,
    diamonds_find = 2,
    use_diamond = 600,
    ext_item = [{3005,1}],
    reward_exp = 0,
    type_number = [],
    value = 0
    };
getRow(71)->
    #find_resCfg {
    id = 71,
    ac_id = 10,
    name = "元素保卫战",
    max_times = 2,
    open_level = 40,
    lvl_s = 160,
    lvl_e = 179,
    diamonds_find = 2,
    use_diamond = 600,
    ext_item = [{3006,1}],
    reward_exp = 0,
    type_number = [],
    value = 0
    };
getRow(72)->
    #find_resCfg {
    id = 72,
    ac_id = 10,
    name = "元素保卫战",
    max_times = 2,
    open_level = 40,
    lvl_s = 180,
    lvl_e = 199,
    diamonds_find = 2,
    use_diamond = 600,
    ext_item = [{3007,1}],
    reward_exp = 0,
    type_number = [],
    value = 0
    };
getRow(73)->
    #find_resCfg {
    id = 73,
    ac_id = 10,
    name = "元素保卫战",
    max_times = 2,
    open_level = 40,
    lvl_s = 200,
    lvl_e = 210,
    diamonds_find = 2,
    use_diamond = 600,
    ext_item = [{3008,1}],
    reward_exp = 0,
    type_number = [],
    value = 0
    };
getRow(74)->
    #find_resCfg {
    id = 74,
    ac_id = 11,
    name = "史莱姆秘境",
    max_times = 2,
    open_level = 24,
    lvl_s = 24,
    lvl_e = 39,
    diamonds_find = 2,
    use_diamond = 400,
    ext_item = [{202,2},{2160,3},{2002,100}],
    reward_exp = 0,
    type_number = [],
    value = 0
    };
getRow(75)->
    #find_resCfg {
    id = 75,
    ac_id = 11,
    name = "史莱姆秘境",
    max_times = 2,
    open_level = 24,
    lvl_s = 40,
    lvl_e = 57,
    diamonds_find = 2,
    use_diamond = 400,
    ext_item = [{202,3},{2160,4},{2002,120}],
    reward_exp = 0,
    type_number = [],
    value = 0
    };
getRow(76)->
    #find_resCfg {
    id = 76,
    ac_id = 11,
    name = "史莱姆秘境",
    max_times = 2,
    open_level = 24,
    lvl_s = 58,
    lvl_e = 75,
    diamonds_find = 2,
    use_diamond = 400,
    ext_item = [{202,3},{2160,5},{2002,140}],
    reward_exp = 0,
    type_number = [],
    value = 0
    };
getRow(77)->
    #find_resCfg {
    id = 77,
    ac_id = 11,
    name = "史莱姆秘境",
    max_times = 2,
    open_level = 24,
    lvl_s = 76,
    lvl_e = 95,
    diamonds_find = 2,
    use_diamond = 400,
    ext_item = [{202,4},{2160,6},{2002,160}],
    reward_exp = 0,
    type_number = [],
    value = 0
    };
getRow(78)->
    #find_resCfg {
    id = 78,
    ac_id = 11,
    name = "史莱姆秘境",
    max_times = 2,
    open_level = 24,
    lvl_s = 96,
    lvl_e = 115,
    diamonds_find = 2,
    use_diamond = 400,
    ext_item = [{203,1},{2160,7},{2002,200}],
    reward_exp = 0,
    type_number = [],
    value = 0
    };
getRow(79)->
    #find_resCfg {
    id = 79,
    ac_id = 11,
    name = "史莱姆秘境",
    max_times = 2,
    open_level = 24,
    lvl_s = 116,
    lvl_e = 135,
    diamonds_find = 2,
    use_diamond = 400,
    ext_item = [{203,1},{2160,8},{2002,300}],
    reward_exp = 0,
    type_number = [],
    value = 0
    };
getRow(80)->
    #find_resCfg {
    id = 80,
    ac_id = 11,
    name = "史莱姆秘境",
    max_times = 2,
    open_level = 24,
    lvl_s = 136,
    lvl_e = 155,
    diamonds_find = 2,
    use_diamond = 400,
    ext_item = [{203,1},{2160,10},{2002,300}],
    reward_exp = 0,
    type_number = [],
    value = 0
    };
getRow(81)->
    #find_resCfg {
    id = 81,
    ac_id = 11,
    name = "史莱姆秘境",
    max_times = 2,
    open_level = 24,
    lvl_s = 156,
    lvl_e = 175,
    diamonds_find = 2,
    use_diamond = 400,
    ext_item = [{203,2},{2160,10},{2002,400}],
    reward_exp = 0,
    type_number = [],
    value = 0
    };
getRow(82)->
    #find_resCfg {
    id = 82,
    ac_id = 11,
    name = "史莱姆秘境",
    max_times = 2,
    open_level = 24,
    lvl_s = 176,
    lvl_e = 195,
    diamonds_find = 2,
    use_diamond = 400,
    ext_item = [{203,2},{2160,12},{2002,400}],
    reward_exp = 0,
    type_number = [],
    value = 0
    };
getRow(83)->
    #find_resCfg {
    id = 83,
    ac_id = 11,
    name = "史莱姆秘境",
    max_times = 2,
    open_level = 24,
    lvl_s = 196,
    lvl_e = 210,
    diamonds_find = 2,
    use_diamond = 400,
    ext_item = [{203,2},{2160,12},{2002,500}],
    reward_exp = 0,
    type_number = [],
    value = 0
    };
getRow(84)->
    #find_resCfg {
    id = 84,
    ac_id = 12,
    name = "永不停歇",
    max_times = 2000000,
    open_level = 12,
    lvl_s = 12,
    lvl_e = 12,
    diamonds_find = 2,
    use_diamond = 1500,
    reward_exp = 0,
    type_number = [],
    value = 0
    };
getRow(85)->
    #find_resCfg {
    id = 85,
    ac_id = 12,
    name = "永不停歇",
    max_times = 2000000,
    open_level = 12,
    lvl_s = 13,
    lvl_e = 13,
    diamonds_find = 2,
    use_diamond = 1500,
    reward_exp = 0,
    type_number = [],
    value = 0
    };
getRow(86)->
    #find_resCfg {
    id = 86,
    ac_id = 12,
    name = "永不停歇",
    max_times = 2000000,
    open_level = 12,
    lvl_s = 14,
    lvl_e = 14,
    diamonds_find = 2,
    use_diamond = 1500,
    reward_exp = 0,
    type_number = [],
    value = 0
    };
getRow(87)->
    #find_resCfg {
    id = 87,
    ac_id = 12,
    name = "永不停歇",
    max_times = 2000000,
    open_level = 12,
    lvl_s = 15,
    lvl_e = 15,
    diamonds_find = 2,
    use_diamond = 1500,
    reward_exp = 0,
    type_number = [],
    value = 0
    };
getRow(88)->
    #find_resCfg {
    id = 88,
    ac_id = 12,
    name = "永不停歇",
    max_times = 2000000,
    open_level = 12,
    lvl_s = 16,
    lvl_e = 16,
    diamonds_find = 2,
    use_diamond = 1500,
    reward_exp = 0,
    type_number = [],
    value = 0
    };
getRow(89)->
    #find_resCfg {
    id = 89,
    ac_id = 12,
    name = "永不停歇",
    max_times = 2000000,
    open_level = 12,
    lvl_s = 17,
    lvl_e = 17,
    diamonds_find = 2,
    use_diamond = 1500,
    reward_exp = 0,
    type_number = [],
    value = 0
    };
getRow(90)->
    #find_resCfg {
    id = 90,
    ac_id = 12,
    name = "永不停歇",
    max_times = 2000000,
    open_level = 12,
    lvl_s = 18,
    lvl_e = 18,
    diamonds_find = 2,
    use_diamond = 1500,
    reward_exp = 0,
    type_number = [],
    value = 0
    };
getRow(91)->
    #find_resCfg {
    id = 91,
    ac_id = 12,
    name = "永不停歇",
    max_times = 2000000,
    open_level = 12,
    lvl_s = 19,
    lvl_e = 19,
    diamonds_find = 2,
    use_diamond = 1500,
    reward_exp = 0,
    type_number = [],
    value = 0
    };
getRow(92)->
    #find_resCfg {
    id = 92,
    ac_id = 12,
    name = "永不停歇",
    max_times = 2000000,
    open_level = 12,
    lvl_s = 20,
    lvl_e = 20,
    diamonds_find = 2,
    use_diamond = 1500,
    reward_exp = 0,
    type_number = [],
    value = 0
    };
getRow(93)->
    #find_resCfg {
    id = 93,
    ac_id = 12,
    name = "永不停歇",
    max_times = 2000000,
    open_level = 12,
    lvl_s = 21,
    lvl_e = 21,
    diamonds_find = 2,
    use_diamond = 1500,
    reward_exp = 0,
    type_number = [],
    value = 0
    };
getRow(94)->
    #find_resCfg {
    id = 94,
    ac_id = 12,
    name = "永不停歇",
    max_times = 2000000,
    open_level = 12,
    lvl_s = 22,
    lvl_e = 22,
    diamonds_find = 2,
    use_diamond = 1500,
    reward_exp = 0,
    type_number = [],
    value = 0
    };
getRow(95)->
    #find_resCfg {
    id = 95,
    ac_id = 12,
    name = "永不停歇",
    max_times = 2000000,
    open_level = 12,
    lvl_s = 23,
    lvl_e = 23,
    diamonds_find = 2,
    use_diamond = 1500,
    reward_exp = 0,
    type_number = [],
    value = 0
    };
getRow(96)->
    #find_resCfg {
    id = 96,
    ac_id = 12,
    name = "永不停歇",
    max_times = 2000000,
    open_level = 12,
    lvl_s = 24,
    lvl_e = 24,
    diamonds_find = 2,
    use_diamond = 1500,
    reward_exp = 0,
    type_number = [],
    value = 0
    };
getRow(97)->
    #find_resCfg {
    id = 97,
    ac_id = 12,
    name = "永不停歇",
    max_times = 2000000,
    open_level = 12,
    lvl_s = 25,
    lvl_e = 25,
    diamonds_find = 2,
    use_diamond = 1500,
    reward_exp = 0,
    type_number = [],
    value = 0
    };
getRow(98)->
    #find_resCfg {
    id = 98,
    ac_id = 12,
    name = "永不停歇",
    max_times = 2000000,
    open_level = 12,
    lvl_s = 26,
    lvl_e = 26,
    diamonds_find = 2,
    use_diamond = 1500,
    reward_exp = 0,
    type_number = [],
    value = 0
    };
getRow(99)->
    #find_resCfg {
    id = 99,
    ac_id = 12,
    name = "永不停歇",
    max_times = 2000000,
    open_level = 12,
    lvl_s = 27,
    lvl_e = 27,
    diamonds_find = 2,
    use_diamond = 1500,
    reward_exp = 0,
    type_number = [],
    value = 0
    };
getRow(100)->
    #find_resCfg {
    id = 100,
    ac_id = 12,
    name = "永不停歇",
    max_times = 2000000,
    open_level = 12,
    lvl_s = 28,
    lvl_e = 28,
    diamonds_find = 2,
    use_diamond = 1500,
    reward_exp = 0,
    type_number = [],
    value = 0
    };
getRow(101)->
    #find_resCfg {
    id = 101,
    ac_id = 12,
    name = "永不停歇",
    max_times = 2000000,
    open_level = 12,
    lvl_s = 29,
    lvl_e = 29,
    diamonds_find = 2,
    use_diamond = 1500,
    reward_exp = 0,
    type_number = [],
    value = 0
    };
getRow(102)->
    #find_resCfg {
    id = 102,
    ac_id = 12,
    name = "永不停歇",
    max_times = 2000000,
    open_level = 12,
    lvl_s = 30,
    lvl_e = 30,
    diamonds_find = 2,
    use_diamond = 1500,
    reward_exp = 0,
    type_number = [],
    value = 0
    };
getRow(103)->
    #find_resCfg {
    id = 103,
    ac_id = 12,
    name = "永不停歇",
    max_times = 2000000,
    open_level = 12,
    lvl_s = 31,
    lvl_e = 31,
    diamonds_find = 2,
    use_diamond = 1500,
    reward_exp = 0,
    type_number = [],
    value = 0
    };
getRow(104)->
    #find_resCfg {
    id = 104,
    ac_id = 12,
    name = "永不停歇",
    max_times = 2000000,
    open_level = 12,
    lvl_s = 32,
    lvl_e = 32,
    diamonds_find = 2,
    use_diamond = 1500,
    reward_exp = 0,
    type_number = [],
    value = 0
    };
getRow(105)->
    #find_resCfg {
    id = 105,
    ac_id = 12,
    name = "永不停歇",
    max_times = 2000000,
    open_level = 12,
    lvl_s = 33,
    lvl_e = 33,
    diamonds_find = 2,
    use_diamond = 1500,
    reward_exp = 0,
    type_number = [],
    value = 0
    };
getRow(106)->
    #find_resCfg {
    id = 106,
    ac_id = 12,
    name = "永不停歇",
    max_times = 2000000,
    open_level = 12,
    lvl_s = 34,
    lvl_e = 34,
    diamonds_find = 2,
    use_diamond = 1500,
    reward_exp = 0,
    type_number = [],
    value = 0
    };
getRow(107)->
    #find_resCfg {
    id = 107,
    ac_id = 12,
    name = "永不停歇",
    max_times = 2000000,
    open_level = 12,
    lvl_s = 35,
    lvl_e = 35,
    diamonds_find = 2,
    use_diamond = 1500,
    reward_exp = 0,
    type_number = [],
    value = 0
    };
getRow(108)->
    #find_resCfg {
    id = 108,
    ac_id = 12,
    name = "永不停歇",
    max_times = 2000000,
    open_level = 12,
    lvl_s = 36,
    lvl_e = 36,
    diamonds_find = 2,
    use_diamond = 1500,
    reward_exp = 0,
    type_number = [],
    value = 0
    };
getRow(109)->
    #find_resCfg {
    id = 109,
    ac_id = 12,
    name = "永不停歇",
    max_times = 2000000,
    open_level = 12,
    lvl_s = 37,
    lvl_e = 37,
    diamonds_find = 2,
    use_diamond = 1500,
    reward_exp = 0,
    type_number = [],
    value = 0
    };
getRow(110)->
    #find_resCfg {
    id = 110,
    ac_id = 12,
    name = "永不停歇",
    max_times = 2000000,
    open_level = 12,
    lvl_s = 38,
    lvl_e = 38,
    diamonds_find = 2,
    use_diamond = 1500,
    reward_exp = 0,
    type_number = [],
    value = 0
    };
getRow(111)->
    #find_resCfg {
    id = 111,
    ac_id = 12,
    name = "永不停歇",
    max_times = 2000000,
    open_level = 12,
    lvl_s = 39,
    lvl_e = 39,
    diamonds_find = 2,
    use_diamond = 1500,
    reward_exp = 0,
    type_number = [],
    value = 0
    };
getRow(112)->
    #find_resCfg {
    id = 112,
    ac_id = 12,
    name = "永不停歇",
    max_times = 2000000,
    open_level = 12,
    lvl_s = 40,
    lvl_e = 40,
    diamonds_find = 2,
    use_diamond = 1500,
    reward_exp = 0,
    type_number = [],
    value = 0
    };
getRow(113)->
    #find_resCfg {
    id = 113,
    ac_id = 12,
    name = "永不停歇",
    max_times = 2000000,
    open_level = 12,
    lvl_s = 41,
    lvl_e = 41,
    diamonds_find = 2,
    use_diamond = 1500,
    reward_exp = 0,
    type_number = [],
    value = 0
    };
getRow(114)->
    #find_resCfg {
    id = 114,
    ac_id = 12,
    name = "永不停歇",
    max_times = 2000000,
    open_level = 12,
    lvl_s = 42,
    lvl_e = 42,
    diamonds_find = 2,
    use_diamond = 1500,
    reward_exp = 0,
    type_number = [],
    value = 0
    };
getRow(115)->
    #find_resCfg {
    id = 115,
    ac_id = 12,
    name = "永不停歇",
    max_times = 2000000,
    open_level = 12,
    lvl_s = 43,
    lvl_e = 43,
    diamonds_find = 2,
    use_diamond = 1500,
    reward_exp = 0,
    type_number = [],
    value = 0
    };
getRow(116)->
    #find_resCfg {
    id = 116,
    ac_id = 12,
    name = "永不停歇",
    max_times = 2000000,
    open_level = 12,
    lvl_s = 44,
    lvl_e = 44,
    diamonds_find = 2,
    use_diamond = 1500,
    reward_exp = 0,
    type_number = [],
    value = 0
    };
getRow(117)->
    #find_resCfg {
    id = 117,
    ac_id = 12,
    name = "永不停歇",
    max_times = 2700000,
    open_level = 12,
    lvl_s = 45,
    lvl_e = 45,
    diamonds_find = 2,
    use_diamond = 1500,
    reward_exp = 0,
    type_number = [],
    value = 0
    };
getRow(118)->
    #find_resCfg {
    id = 118,
    ac_id = 12,
    name = "永不停歇",
    max_times = 2700000,
    open_level = 12,
    lvl_s = 46,
    lvl_e = 46,
    diamonds_find = 2,
    use_diamond = 1500,
    reward_exp = 0,
    type_number = [],
    value = 0
    };
getRow(119)->
    #find_resCfg {
    id = 119,
    ac_id = 12,
    name = "永不停歇",
    max_times = 2700000,
    open_level = 12,
    lvl_s = 47,
    lvl_e = 47,
    diamonds_find = 2,
    use_diamond = 1500,
    reward_exp = 0,
    type_number = [],
    value = 0
    };
getRow(120)->
    #find_resCfg {
    id = 120,
    ac_id = 12,
    name = "永不停歇",
    max_times = 2700000,
    open_level = 12,
    lvl_s = 48,
    lvl_e = 48,
    diamonds_find = 2,
    use_diamond = 1500,
    reward_exp = 0,
    type_number = [],
    value = 0
    };
getRow(121)->
    #find_resCfg {
    id = 121,
    ac_id = 12,
    name = "永不停歇",
    max_times = 2700000,
    open_level = 12,
    lvl_s = 49,
    lvl_e = 49,
    diamonds_find = 2,
    use_diamond = 1500,
    reward_exp = 0,
    type_number = [],
    value = 0
    };
getRow(122)->
    #find_resCfg {
    id = 122,
    ac_id = 12,
    name = "永不停歇",
    max_times = 2700000,
    open_level = 12,
    lvl_s = 50,
    lvl_e = 50,
    diamonds_find = 2,
    use_diamond = 1500,
    reward_exp = 0,
    type_number = [],
    value = 0
    };
getRow(123)->
    #find_resCfg {
    id = 123,
    ac_id = 12,
    name = "永不停歇",
    max_times = 2700000,
    open_level = 12,
    lvl_s = 51,
    lvl_e = 51,
    diamonds_find = 2,
    use_diamond = 1500,
    reward_exp = 0,
    type_number = [],
    value = 0
    };
getRow(124)->
    #find_resCfg {
    id = 124,
    ac_id = 12,
    name = "永不停歇",
    max_times = 2700000,
    open_level = 12,
    lvl_s = 52,
    lvl_e = 52,
    diamonds_find = 2,
    use_diamond = 1500,
    reward_exp = 0,
    type_number = [],
    value = 0
    };
getRow(125)->
    #find_resCfg {
    id = 125,
    ac_id = 12,
    name = "永不停歇",
    max_times = 2700000,
    open_level = 12,
    lvl_s = 53,
    lvl_e = 53,
    diamonds_find = 2,
    use_diamond = 1500,
    reward_exp = 0,
    type_number = [],
    value = 0
    };
getRow(126)->
    #find_resCfg {
    id = 126,
    ac_id = 12,
    name = "永不停歇",
    max_times = 2700000,
    open_level = 12,
    lvl_s = 54,
    lvl_e = 54,
    diamonds_find = 2,
    use_diamond = 1500,
    reward_exp = 0,
    type_number = [],
    value = 0
    };
getRow(127)->
    #find_resCfg {
    id = 127,
    ac_id = 12,
    name = "永不停歇",
    max_times = 2700000,
    open_level = 12,
    lvl_s = 55,
    lvl_e = 55,
    diamonds_find = 2,
    use_diamond = 1500,
    reward_exp = 0,
    type_number = [],
    value = 0
    };
getRow(128)->
    #find_resCfg {
    id = 128,
    ac_id = 12,
    name = "永不停歇",
    max_times = 2700000,
    open_level = 12,
    lvl_s = 56,
    lvl_e = 56,
    diamonds_find = 2,
    use_diamond = 1500,
    reward_exp = 0,
    type_number = [],
    value = 0
    };
getRow(129)->
    #find_resCfg {
    id = 129,
    ac_id = 12,
    name = "永不停歇",
    max_times = 3400000,
    open_level = 12,
    lvl_s = 57,
    lvl_e = 57,
    diamonds_find = 2,
    use_diamond = 1500,
    reward_exp = 0,
    type_number = [],
    value = 0
    };
getRow(130)->
    #find_resCfg {
    id = 130,
    ac_id = 12,
    name = "永不停歇",
    max_times = 3400000,
    open_level = 12,
    lvl_s = 58,
    lvl_e = 58,
    diamonds_find = 2,
    use_diamond = 1500,
    reward_exp = 0,
    type_number = [],
    value = 0
    };
getRow(131)->
    #find_resCfg {
    id = 131,
    ac_id = 12,
    name = "永不停歇",
    max_times = 3400000,
    open_level = 12,
    lvl_s = 59,
    lvl_e = 59,
    diamonds_find = 2,
    use_diamond = 1500,
    reward_exp = 0,
    type_number = [],
    value = 0
    };
getRow(132)->
    #find_resCfg {
    id = 132,
    ac_id = 12,
    name = "永不停歇",
    max_times = 3400000,
    open_level = 12,
    lvl_s = 60,
    lvl_e = 60,
    diamonds_find = 2,
    use_diamond = 1500,
    reward_exp = 0,
    type_number = [],
    value = 0
    };
getRow(133)->
    #find_resCfg {
    id = 133,
    ac_id = 12,
    name = "永不停歇",
    max_times = 3400000,
    open_level = 12,
    lvl_s = 61,
    lvl_e = 61,
    diamonds_find = 2,
    use_diamond = 1500,
    reward_exp = 0,
    type_number = [],
    value = 0
    };
getRow(134)->
    #find_resCfg {
    id = 134,
    ac_id = 12,
    name = "永不停歇",
    max_times = 3400000,
    open_level = 12,
    lvl_s = 62,
    lvl_e = 62,
    diamonds_find = 2,
    use_diamond = 1500,
    reward_exp = 0,
    type_number = [],
    value = 0
    };
getRow(135)->
    #find_resCfg {
    id = 135,
    ac_id = 12,
    name = "永不停歇",
    max_times = 3400000,
    open_level = 12,
    lvl_s = 63,
    lvl_e = 63,
    diamonds_find = 2,
    use_diamond = 1500,
    reward_exp = 0,
    type_number = [],
    value = 0
    };
getRow(136)->
    #find_resCfg {
    id = 136,
    ac_id = 12,
    name = "永不停歇",
    max_times = 3400000,
    open_level = 12,
    lvl_s = 64,
    lvl_e = 64,
    diamonds_find = 2,
    use_diamond = 1500,
    reward_exp = 0,
    type_number = [],
    value = 0
    };
getRow(137)->
    #find_resCfg {
    id = 137,
    ac_id = 12,
    name = "永不停歇",
    max_times = 3400000,
    open_level = 12,
    lvl_s = 65,
    lvl_e = 65,
    diamonds_find = 2,
    use_diamond = 1500,
    reward_exp = 0,
    type_number = [],
    value = 0
    };
getRow(138)->
    #find_resCfg {
    id = 138,
    ac_id = 12,
    name = "永不停歇",
    max_times = 3400000,
    open_level = 12,
    lvl_s = 66,
    lvl_e = 66,
    diamonds_find = 2,
    use_diamond = 1500,
    reward_exp = 0,
    type_number = [],
    value = 0
    };
getRow(139)->
    #find_resCfg {
    id = 139,
    ac_id = 12,
    name = "永不停歇",
    max_times = 4100000,
    open_level = 12,
    lvl_s = 67,
    lvl_e = 67,
    diamonds_find = 2,
    use_diamond = 1500,
    reward_exp = 0,
    type_number = [],
    value = 0
    };
getRow(140)->
    #find_resCfg {
    id = 140,
    ac_id = 12,
    name = "永不停歇",
    max_times = 4100000,
    open_level = 12,
    lvl_s = 68,
    lvl_e = 68,
    diamonds_find = 2,
    use_diamond = 1500,
    reward_exp = 0,
    type_number = [],
    value = 0
    };
getRow(141)->
    #find_resCfg {
    id = 141,
    ac_id = 12,
    name = "永不停歇",
    max_times = 4100000,
    open_level = 12,
    lvl_s = 69,
    lvl_e = 69,
    diamonds_find = 2,
    use_diamond = 1500,
    reward_exp = 0,
    type_number = [],
    value = 0
    };
getRow(142)->
    #find_resCfg {
    id = 142,
    ac_id = 12,
    name = "永不停歇",
    max_times = 4100000,
    open_level = 12,
    lvl_s = 70,
    lvl_e = 70,
    diamonds_find = 2,
    use_diamond = 1500,
    reward_exp = 0,
    type_number = [],
    value = 0
    };
getRow(143)->
    #find_resCfg {
    id = 143,
    ac_id = 12,
    name = "永不停歇",
    max_times = 4100000,
    open_level = 12,
    lvl_s = 71,
    lvl_e = 71,
    diamonds_find = 2,
    use_diamond = 1500,
    reward_exp = 0,
    type_number = [],
    value = 0
    };
getRow(144)->
    #find_resCfg {
    id = 144,
    ac_id = 12,
    name = "永不停歇",
    max_times = 4100000,
    open_level = 12,
    lvl_s = 72,
    lvl_e = 72,
    diamonds_find = 2,
    use_diamond = 1500,
    reward_exp = 0,
    type_number = [],
    value = 0
    };
getRow(145)->
    #find_resCfg {
    id = 145,
    ac_id = 12,
    name = "永不停歇",
    max_times = 4800000,
    open_level = 12,
    lvl_s = 73,
    lvl_e = 73,
    diamonds_find = 2,
    use_diamond = 1500,
    reward_exp = 0,
    type_number = [],
    value = 0
    };
getRow(146)->
    #find_resCfg {
    id = 146,
    ac_id = 12,
    name = "永不停歇",
    max_times = 4800000,
    open_level = 12,
    lvl_s = 74,
    lvl_e = 74,
    diamonds_find = 2,
    use_diamond = 1500,
    reward_exp = 0,
    type_number = [],
    value = 0
    };
getRow(147)->
    #find_resCfg {
    id = 147,
    ac_id = 12,
    name = "永不停歇",
    max_times = 4800000,
    open_level = 12,
    lvl_s = 75,
    lvl_e = 75,
    diamonds_find = 2,
    use_diamond = 1500,
    reward_exp = 0,
    type_number = [],
    value = 0
    };
getRow(148)->
    #find_resCfg {
    id = 148,
    ac_id = 12,
    name = "永不停歇",
    max_times = 4800000,
    open_level = 12,
    lvl_s = 76,
    lvl_e = 76,
    diamonds_find = 2,
    use_diamond = 1500,
    reward_exp = 0,
    type_number = [],
    value = 0
    };
getRow(149)->
    #find_resCfg {
    id = 149,
    ac_id = 12,
    name = "永不停歇",
    max_times = 5500000,
    open_level = 12,
    lvl_s = 77,
    lvl_e = 77,
    diamonds_find = 2,
    use_diamond = 1500,
    reward_exp = 0,
    type_number = [],
    value = 0
    };
getRow(150)->
    #find_resCfg {
    id = 150,
    ac_id = 12,
    name = "永不停歇",
    max_times = 5500000,
    open_level = 12,
    lvl_s = 78,
    lvl_e = 78,
    diamonds_find = 2,
    use_diamond = 1500,
    reward_exp = 0,
    type_number = [],
    value = 0
    };
getRow(151)->
    #find_resCfg {
    id = 151,
    ac_id = 12,
    name = "永不停歇",
    max_times = 5500000,
    open_level = 12,
    lvl_s = 79,
    lvl_e = 79,
    diamonds_find = 2,
    use_diamond = 1500,
    reward_exp = 0,
    type_number = [],
    value = 0
    };
getRow(152)->
    #find_resCfg {
    id = 152,
    ac_id = 12,
    name = "永不停歇",
    max_times = 5500000,
    open_level = 12,
    lvl_s = 80,
    lvl_e = 80,
    diamonds_find = 2,
    use_diamond = 1500,
    reward_exp = 0,
    type_number = [],
    value = 0
    };
getRow(153)->
    #find_resCfg {
    id = 153,
    ac_id = 12,
    name = "永不停歇",
    max_times = 6200000,
    open_level = 12,
    lvl_s = 81,
    lvl_e = 81,
    diamonds_find = 2,
    use_diamond = 1500,
    reward_exp = 0,
    type_number = [],
    value = 0
    };
getRow(154)->
    #find_resCfg {
    id = 154,
    ac_id = 12,
    name = "永不停歇",
    max_times = 6200000,
    open_level = 12,
    lvl_s = 82,
    lvl_e = 82,
    diamonds_find = 2,
    use_diamond = 1500,
    reward_exp = 0,
    type_number = [],
    value = 0
    };
getRow(155)->
    #find_resCfg {
    id = 155,
    ac_id = 12,
    name = "永不停歇",
    max_times = 6200000,
    open_level = 12,
    lvl_s = 83,
    lvl_e = 83,
    diamonds_find = 2,
    use_diamond = 1500,
    reward_exp = 0,
    type_number = [],
    value = 0
    };
getRow(156)->
    #find_resCfg {
    id = 156,
    ac_id = 12,
    name = "永不停歇",
    max_times = 6200000,
    open_level = 12,
    lvl_s = 84,
    lvl_e = 84,
    diamonds_find = 2,
    use_diamond = 1500,
    reward_exp = 0,
    type_number = [],
    value = 0
    };
getRow(157)->
    #find_resCfg {
    id = 157,
    ac_id = 12,
    name = "永不停歇",
    max_times = 6900000,
    open_level = 12,
    lvl_s = 85,
    lvl_e = 85,
    diamonds_find = 2,
    use_diamond = 1500,
    reward_exp = 0,
    type_number = [],
    value = 0
    };
getRow(158)->
    #find_resCfg {
    id = 158,
    ac_id = 12,
    name = "永不停歇",
    max_times = 6900000,
    open_level = 12,
    lvl_s = 86,
    lvl_e = 86,
    diamonds_find = 2,
    use_diamond = 1500,
    reward_exp = 0,
    type_number = [],
    value = 0
    };
getRow(159)->
    #find_resCfg {
    id = 159,
    ac_id = 12,
    name = "永不停歇",
    max_times = 6900000,
    open_level = 12,
    lvl_s = 87,
    lvl_e = 87,
    diamonds_find = 2,
    use_diamond = 1500,
    reward_exp = 0,
    type_number = [],
    value = 0
    };
getRow(160)->
    #find_resCfg {
    id = 160,
    ac_id = 12,
    name = "永不停歇",
    max_times = 6900000,
    open_level = 12,
    lvl_s = 88,
    lvl_e = 88,
    diamonds_find = 2,
    use_diamond = 1500,
    reward_exp = 0,
    type_number = [],
    value = 0
    };
getRow(161)->
    #find_resCfg {
    id = 161,
    ac_id = 12,
    name = "永不停歇",
    max_times = 6900000,
    open_level = 12,
    lvl_s = 89,
    lvl_e = 89,
    diamonds_find = 2,
    use_diamond = 1500,
    reward_exp = 0,
    type_number = [],
    value = 0
    };
getRow(162)->
    #find_resCfg {
    id = 162,
    ac_id = 12,
    name = "永不停歇",
    max_times = 6900000,
    open_level = 12,
    lvl_s = 90,
    lvl_e = 90,
    diamonds_find = 2,
    use_diamond = 1500,
    reward_exp = 0,
    type_number = [],
    value = 0
    };
getRow(163)->
    #find_resCfg {
    id = 163,
    ac_id = 12,
    name = "永不停歇",
    max_times = 6900000,
    open_level = 12,
    lvl_s = 91,
    lvl_e = 91,
    diamonds_find = 2,
    use_diamond = 1500,
    reward_exp = 0,
    type_number = [],
    value = 0
    };
getRow(164)->
    #find_resCfg {
    id = 164,
    ac_id = 12,
    name = "永不停歇",
    max_times = 6900000,
    open_level = 12,
    lvl_s = 92,
    lvl_e = 92,
    diamonds_find = 2,
    use_diamond = 1500,
    reward_exp = 0,
    type_number = [],
    value = 0
    };
getRow(165)->
    #find_resCfg {
    id = 165,
    ac_id = 12,
    name = "永不停歇",
    max_times = 6900000,
    open_level = 12,
    lvl_s = 93,
    lvl_e = 93,
    diamonds_find = 2,
    use_diamond = 1500,
    reward_exp = 0,
    type_number = [],
    value = 0
    };
getRow(166)->
    #find_resCfg {
    id = 166,
    ac_id = 12,
    name = "永不停歇",
    max_times = 6900000,
    open_level = 12,
    lvl_s = 94,
    lvl_e = 94,
    diamonds_find = 2,
    use_diamond = 1500,
    reward_exp = 0,
    type_number = [],
    value = 0
    };
getRow(167)->
    #find_resCfg {
    id = 167,
    ac_id = 12,
    name = "永不停歇",
    max_times = 6900000,
    open_level = 12,
    lvl_s = 95,
    lvl_e = 95,
    diamonds_find = 2,
    use_diamond = 1500,
    reward_exp = 0,
    type_number = [],
    value = 0
    };
getRow(168)->
    #find_resCfg {
    id = 168,
    ac_id = 12,
    name = "永不停歇",
    max_times = 6900000,
    open_level = 12,
    lvl_s = 96,
    lvl_e = 96,
    diamonds_find = 2,
    use_diamond = 1500,
    reward_exp = 0,
    type_number = [],
    value = 0
    };
getRow(169)->
    #find_resCfg {
    id = 169,
    ac_id = 12,
    name = "永不停歇",
    max_times = 6900000,
    open_level = 12,
    lvl_s = 97,
    lvl_e = 97,
    diamonds_find = 2,
    use_diamond = 1500,
    reward_exp = 0,
    type_number = [],
    value = 0
    };
getRow(170)->
    #find_resCfg {
    id = 170,
    ac_id = 12,
    name = "永不停歇",
    max_times = 6900000,
    open_level = 12,
    lvl_s = 98,
    lvl_e = 98,
    diamonds_find = 2,
    use_diamond = 1500,
    reward_exp = 0,
    type_number = [],
    value = 0
    };
getRow(171)->
    #find_resCfg {
    id = 171,
    ac_id = 12,
    name = "永不停歇",
    max_times = 6900000,
    open_level = 12,
    lvl_s = 99,
    lvl_e = 99,
    diamonds_find = 2,
    use_diamond = 1500,
    reward_exp = 0,
    type_number = [],
    value = 0
    };
getRow(172)->
    #find_resCfg {
    id = 172,
    ac_id = 12,
    name = "永不停歇",
    max_times = 7600000,
    open_level = 12,
    lvl_s = 100,
    lvl_e = 100,
    diamonds_find = 2,
    use_diamond = 1500,
    reward_exp = 0,
    type_number = [],
    value = 0
    };
getRow(173)->
    #find_resCfg {
    id = 173,
    ac_id = 12,
    name = "永不停歇",
    max_times = 7600000,
    open_level = 12,
    lvl_s = 101,
    lvl_e = 101,
    diamonds_find = 2,
    use_diamond = 1500,
    reward_exp = 0,
    type_number = [],
    value = 0
    };
getRow(174)->
    #find_resCfg {
    id = 174,
    ac_id = 12,
    name = "永不停歇",
    max_times = 7600000,
    open_level = 12,
    lvl_s = 102,
    lvl_e = 102,
    diamonds_find = 2,
    use_diamond = 1500,
    reward_exp = 0,
    type_number = [],
    value = 0
    };
getRow(175)->
    #find_resCfg {
    id = 175,
    ac_id = 12,
    name = "永不停歇",
    max_times = 7600000,
    open_level = 12,
    lvl_s = 103,
    lvl_e = 103,
    diamonds_find = 2,
    use_diamond = 1500,
    reward_exp = 0,
    type_number = [],
    value = 0
    };
getRow(176)->
    #find_resCfg {
    id = 176,
    ac_id = 12,
    name = "永不停歇",
    max_times = 7600000,
    open_level = 12,
    lvl_s = 104,
    lvl_e = 104,
    diamonds_find = 2,
    use_diamond = 1500,
    reward_exp = 0,
    type_number = [],
    value = 0
    };
getRow(177)->
    #find_resCfg {
    id = 177,
    ac_id = 12,
    name = "永不停歇",
    max_times = 7600000,
    open_level = 12,
    lvl_s = 105,
    lvl_e = 105,
    diamonds_find = 2,
    use_diamond = 1500,
    reward_exp = 0,
    type_number = [],
    value = 0
    };
getRow(178)->
    #find_resCfg {
    id = 178,
    ac_id = 12,
    name = "永不停歇",
    max_times = 7600000,
    open_level = 12,
    lvl_s = 106,
    lvl_e = 106,
    diamonds_find = 2,
    use_diamond = 1500,
    reward_exp = 0,
    type_number = [],
    value = 0
    };
getRow(179)->
    #find_resCfg {
    id = 179,
    ac_id = 12,
    name = "永不停歇",
    max_times = 7600000,
    open_level = 12,
    lvl_s = 107,
    lvl_e = 107,
    diamonds_find = 2,
    use_diamond = 1500,
    reward_exp = 0,
    type_number = [],
    value = 0
    };
getRow(180)->
    #find_resCfg {
    id = 180,
    ac_id = 12,
    name = "永不停歇",
    max_times = 7600000,
    open_level = 12,
    lvl_s = 108,
    lvl_e = 108,
    diamonds_find = 2,
    use_diamond = 1500,
    reward_exp = 0,
    type_number = [],
    value = 0
    };
getRow(181)->
    #find_resCfg {
    id = 181,
    ac_id = 12,
    name = "永不停歇",
    max_times = 7600000,
    open_level = 12,
    lvl_s = 109,
    lvl_e = 109,
    diamonds_find = 2,
    use_diamond = 1500,
    reward_exp = 0,
    type_number = [],
    value = 0
    };
getRow(182)->
    #find_resCfg {
    id = 182,
    ac_id = 12,
    name = "永不停歇",
    max_times = 8300000,
    open_level = 12,
    lvl_s = 110,
    lvl_e = 110,
    diamonds_find = 2,
    use_diamond = 1500,
    reward_exp = 0,
    type_number = [],
    value = 0
    };
getRow(183)->
    #find_resCfg {
    id = 183,
    ac_id = 12,
    name = "永不停歇",
    max_times = 8300000,
    open_level = 12,
    lvl_s = 111,
    lvl_e = 111,
    diamonds_find = 2,
    use_diamond = 1500,
    reward_exp = 0,
    type_number = [],
    value = 0
    };
getRow(184)->
    #find_resCfg {
    id = 184,
    ac_id = 12,
    name = "永不停歇",
    max_times = 8300000,
    open_level = 12,
    lvl_s = 112,
    lvl_e = 112,
    diamonds_find = 2,
    use_diamond = 1500,
    reward_exp = 0,
    type_number = [],
    value = 0
    };
getRow(185)->
    #find_resCfg {
    id = 185,
    ac_id = 12,
    name = "永不停歇",
    max_times = 8300000,
    open_level = 12,
    lvl_s = 113,
    lvl_e = 113,
    diamonds_find = 2,
    use_diamond = 1500,
    reward_exp = 0,
    type_number = [],
    value = 0
    };
getRow(186)->
    #find_resCfg {
    id = 186,
    ac_id = 12,
    name = "永不停歇",
    max_times = 8300000,
    open_level = 12,
    lvl_s = 114,
    lvl_e = 114,
    diamonds_find = 2,
    use_diamond = 1500,
    reward_exp = 0,
    type_number = [],
    value = 0
    };
getRow(187)->
    #find_resCfg {
    id = 187,
    ac_id = 12,
    name = "永不停歇",
    max_times = 8300000,
    open_level = 12,
    lvl_s = 115,
    lvl_e = 115,
    diamonds_find = 2,
    use_diamond = 1500,
    reward_exp = 0,
    type_number = [],
    value = 0
    };
getRow(188)->
    #find_resCfg {
    id = 188,
    ac_id = 12,
    name = "永不停歇",
    max_times = 8300000,
    open_level = 12,
    lvl_s = 116,
    lvl_e = 116,
    diamonds_find = 2,
    use_diamond = 1500,
    reward_exp = 0,
    type_number = [],
    value = 0
    };
getRow(189)->
    #find_resCfg {
    id = 189,
    ac_id = 12,
    name = "永不停歇",
    max_times = 8300000,
    open_level = 12,
    lvl_s = 117,
    lvl_e = 117,
    diamonds_find = 2,
    use_diamond = 1500,
    reward_exp = 0,
    type_number = [],
    value = 0
    };
getRow(190)->
    #find_resCfg {
    id = 190,
    ac_id = 12,
    name = "永不停歇",
    max_times = 8300000,
    open_level = 12,
    lvl_s = 118,
    lvl_e = 118,
    diamonds_find = 2,
    use_diamond = 1500,
    reward_exp = 0,
    type_number = [],
    value = 0
    };
getRow(191)->
    #find_resCfg {
    id = 191,
    ac_id = 12,
    name = "永不停歇",
    max_times = 8300000,
    open_level = 12,
    lvl_s = 119,
    lvl_e = 119,
    diamonds_find = 2,
    use_diamond = 1500,
    reward_exp = 0,
    type_number = [],
    value = 0
    };
getRow(192)->
    #find_resCfg {
    id = 192,
    ac_id = 12,
    name = "永不停歇",
    max_times = 9000000,
    open_level = 12,
    lvl_s = 120,
    lvl_e = 120,
    diamonds_find = 2,
    use_diamond = 1500,
    reward_exp = 0,
    type_number = [],
    value = 0
    };
getRow(193)->
    #find_resCfg {
    id = 193,
    ac_id = 12,
    name = "永不停歇",
    max_times = 9000000,
    open_level = 12,
    lvl_s = 121,
    lvl_e = 121,
    diamonds_find = 2,
    use_diamond = 1500,
    reward_exp = 0,
    type_number = [],
    value = 0
    };
getRow(194)->
    #find_resCfg {
    id = 194,
    ac_id = 12,
    name = "永不停歇",
    max_times = 9000000,
    open_level = 12,
    lvl_s = 122,
    lvl_e = 122,
    diamonds_find = 2,
    use_diamond = 1500,
    reward_exp = 0,
    type_number = [],
    value = 0
    };
getRow(195)->
    #find_resCfg {
    id = 195,
    ac_id = 12,
    name = "永不停歇",
    max_times = 9000000,
    open_level = 12,
    lvl_s = 123,
    lvl_e = 123,
    diamonds_find = 2,
    use_diamond = 1500,
    reward_exp = 0,
    type_number = [],
    value = 0
    };
getRow(196)->
    #find_resCfg {
    id = 196,
    ac_id = 12,
    name = "永不停歇",
    max_times = 9000000,
    open_level = 12,
    lvl_s = 124,
    lvl_e = 124,
    diamonds_find = 2,
    use_diamond = 1500,
    reward_exp = 0,
    type_number = [],
    value = 0
    };
getRow(197)->
    #find_resCfg {
    id = 197,
    ac_id = 12,
    name = "永不停歇",
    max_times = 9000000,
    open_level = 12,
    lvl_s = 125,
    lvl_e = 125,
    diamonds_find = 2,
    use_diamond = 1500,
    reward_exp = 0,
    type_number = [],
    value = 0
    };
getRow(198)->
    #find_resCfg {
    id = 198,
    ac_id = 12,
    name = "永不停歇",
    max_times = 9000000,
    open_level = 12,
    lvl_s = 126,
    lvl_e = 126,
    diamonds_find = 2,
    use_diamond = 1500,
    reward_exp = 0,
    type_number = [],
    value = 0
    };
getRow(199)->
    #find_resCfg {
    id = 199,
    ac_id = 12,
    name = "永不停歇",
    max_times = 9000000,
    open_level = 12,
    lvl_s = 127,
    lvl_e = 127,
    diamonds_find = 2,
    use_diamond = 1500,
    reward_exp = 0,
    type_number = [],
    value = 0
    };
getRow(200)->
    #find_resCfg {
    id = 200,
    ac_id = 12,
    name = "永不停歇",
    max_times = 9000000,
    open_level = 12,
    lvl_s = 128,
    lvl_e = 128,
    diamonds_find = 2,
    use_diamond = 1500,
    reward_exp = 0,
    type_number = [],
    value = 0
    };
getRow(201)->
    #find_resCfg {
    id = 201,
    ac_id = 12,
    name = "永不停歇",
    max_times = 9000000,
    open_level = 12,
    lvl_s = 129,
    lvl_e = 129,
    diamonds_find = 2,
    use_diamond = 1500,
    reward_exp = 0,
    type_number = [],
    value = 0
    };
getRow(202)->
    #find_resCfg {
    id = 202,
    ac_id = 12,
    name = "永不停歇",
    max_times = 9700000,
    open_level = 12,
    lvl_s = 130,
    lvl_e = 130,
    diamonds_find = 2,
    use_diamond = 1500,
    reward_exp = 0,
    type_number = [],
    value = 0
    };
getRow(203)->
    #find_resCfg {
    id = 203,
    ac_id = 12,
    name = "永不停歇",
    max_times = 9700000,
    open_level = 12,
    lvl_s = 131,
    lvl_e = 131,
    diamonds_find = 2,
    use_diamond = 1500,
    reward_exp = 0,
    type_number = [],
    value = 0
    };
getRow(204)->
    #find_resCfg {
    id = 204,
    ac_id = 12,
    name = "永不停歇",
    max_times = 9700000,
    open_level = 12,
    lvl_s = 132,
    lvl_e = 132,
    diamonds_find = 2,
    use_diamond = 1500,
    reward_exp = 0,
    type_number = [],
    value = 0
    };
getRow(205)->
    #find_resCfg {
    id = 205,
    ac_id = 12,
    name = "永不停歇",
    max_times = 9700000,
    open_level = 12,
    lvl_s = 133,
    lvl_e = 133,
    diamonds_find = 2,
    use_diamond = 1500,
    reward_exp = 0,
    type_number = [],
    value = 0
    };
getRow(206)->
    #find_resCfg {
    id = 206,
    ac_id = 12,
    name = "永不停歇",
    max_times = 9700000,
    open_level = 12,
    lvl_s = 134,
    lvl_e = 134,
    diamonds_find = 2,
    use_diamond = 1500,
    reward_exp = 0,
    type_number = [],
    value = 0
    };
getRow(207)->
    #find_resCfg {
    id = 207,
    ac_id = 12,
    name = "永不停歇",
    max_times = 9700000,
    open_level = 12,
    lvl_s = 135,
    lvl_e = 135,
    diamonds_find = 2,
    use_diamond = 1500,
    reward_exp = 0,
    type_number = [],
    value = 0
    };
getRow(208)->
    #find_resCfg {
    id = 208,
    ac_id = 12,
    name = "永不停歇",
    max_times = 9700000,
    open_level = 12,
    lvl_s = 136,
    lvl_e = 136,
    diamonds_find = 2,
    use_diamond = 1500,
    reward_exp = 0,
    type_number = [],
    value = 0
    };
getRow(209)->
    #find_resCfg {
    id = 209,
    ac_id = 12,
    name = "永不停歇",
    max_times = 9700000,
    open_level = 12,
    lvl_s = 137,
    lvl_e = 137,
    diamonds_find = 2,
    use_diamond = 1500,
    reward_exp = 0,
    type_number = [],
    value = 0
    };
getRow(210)->
    #find_resCfg {
    id = 210,
    ac_id = 12,
    name = "永不停歇",
    max_times = 9700000,
    open_level = 12,
    lvl_s = 138,
    lvl_e = 138,
    diamonds_find = 2,
    use_diamond = 1500,
    reward_exp = 0,
    type_number = [],
    value = 0
    };
getRow(211)->
    #find_resCfg {
    id = 211,
    ac_id = 12,
    name = "永不停歇",
    max_times = 9700000,
    open_level = 12,
    lvl_s = 139,
    lvl_e = 139,
    diamonds_find = 2,
    use_diamond = 1500,
    reward_exp = 0,
    type_number = [],
    value = 0
    };
getRow(212)->
    #find_resCfg {
    id = 212,
    ac_id = 12,
    name = "永不停歇",
    max_times = 10400000,
    open_level = 12,
    lvl_s = 140,
    lvl_e = 140,
    diamonds_find = 2,
    use_diamond = 1500,
    reward_exp = 0,
    type_number = [],
    value = 0
    };
getRow(213)->
    #find_resCfg {
    id = 213,
    ac_id = 12,
    name = "永不停歇",
    max_times = 10400000,
    open_level = 12,
    lvl_s = 141,
    lvl_e = 141,
    diamonds_find = 2,
    use_diamond = 1500,
    reward_exp = 0,
    type_number = [],
    value = 0
    };
getRow(214)->
    #find_resCfg {
    id = 214,
    ac_id = 12,
    name = "永不停歇",
    max_times = 10400000,
    open_level = 12,
    lvl_s = 142,
    lvl_e = 142,
    diamonds_find = 2,
    use_diamond = 1500,
    reward_exp = 0,
    type_number = [],
    value = 0
    };
getRow(215)->
    #find_resCfg {
    id = 215,
    ac_id = 12,
    name = "永不停歇",
    max_times = 10400000,
    open_level = 12,
    lvl_s = 143,
    lvl_e = 143,
    diamonds_find = 2,
    use_diamond = 1500,
    reward_exp = 0,
    type_number = [],
    value = 0
    };
getRow(216)->
    #find_resCfg {
    id = 216,
    ac_id = 12,
    name = "永不停歇",
    max_times = 10400000,
    open_level = 12,
    lvl_s = 144,
    lvl_e = 144,
    diamonds_find = 2,
    use_diamond = 1500,
    reward_exp = 0,
    type_number = [],
    value = 0
    };
getRow(217)->
    #find_resCfg {
    id = 217,
    ac_id = 12,
    name = "永不停歇",
    max_times = 10400000,
    open_level = 12,
    lvl_s = 145,
    lvl_e = 145,
    diamonds_find = 2,
    use_diamond = 1500,
    reward_exp = 0,
    type_number = [],
    value = 0
    };
getRow(218)->
    #find_resCfg {
    id = 218,
    ac_id = 12,
    name = "永不停歇",
    max_times = 10400000,
    open_level = 12,
    lvl_s = 146,
    lvl_e = 146,
    diamonds_find = 2,
    use_diamond = 1500,
    reward_exp = 0,
    type_number = [],
    value = 0
    };
getRow(219)->
    #find_resCfg {
    id = 219,
    ac_id = 12,
    name = "永不停歇",
    max_times = 10400000,
    open_level = 12,
    lvl_s = 147,
    lvl_e = 147,
    diamonds_find = 2,
    use_diamond = 1500,
    reward_exp = 0,
    type_number = [],
    value = 0
    };
getRow(220)->
    #find_resCfg {
    id = 220,
    ac_id = 12,
    name = "永不停歇",
    max_times = 10400000,
    open_level = 12,
    lvl_s = 148,
    lvl_e = 148,
    diamonds_find = 2,
    use_diamond = 1500,
    reward_exp = 0,
    type_number = [],
    value = 0
    };
getRow(221)->
    #find_resCfg {
    id = 221,
    ac_id = 12,
    name = "永不停歇",
    max_times = 10400000,
    open_level = 12,
    lvl_s = 149,
    lvl_e = 149,
    diamonds_find = 2,
    use_diamond = 1500,
    reward_exp = 0,
    type_number = [],
    value = 0
    };
getRow(222)->
    #find_resCfg {
    id = 222,
    ac_id = 12,
    name = "永不停歇",
    max_times = 11100000,
    open_level = 12,
    lvl_s = 150,
    lvl_e = 150,
    diamonds_find = 2,
    use_diamond = 1500,
    reward_exp = 0,
    type_number = [],
    value = 0
    };
getRow(223)->
    #find_resCfg {
    id = 223,
    ac_id = 12,
    name = "永不停歇",
    max_times = 11100000,
    open_level = 12,
    lvl_s = 151,
    lvl_e = 151,
    diamonds_find = 2,
    use_diamond = 1500,
    reward_exp = 0,
    type_number = [],
    value = 0
    };
getRow(224)->
    #find_resCfg {
    id = 224,
    ac_id = 12,
    name = "永不停歇",
    max_times = 11100000,
    open_level = 12,
    lvl_s = 152,
    lvl_e = 152,
    diamonds_find = 2,
    use_diamond = 1500,
    reward_exp = 0,
    type_number = [],
    value = 0
    };
getRow(225)->
    #find_resCfg {
    id = 225,
    ac_id = 12,
    name = "永不停歇",
    max_times = 11100000,
    open_level = 12,
    lvl_s = 153,
    lvl_e = 153,
    diamonds_find = 2,
    use_diamond = 1500,
    reward_exp = 0,
    type_number = [],
    value = 0
    };
getRow(226)->
    #find_resCfg {
    id = 226,
    ac_id = 12,
    name = "永不停歇",
    max_times = 11100000,
    open_level = 12,
    lvl_s = 154,
    lvl_e = 154,
    diamonds_find = 2,
    use_diamond = 1500,
    reward_exp = 0,
    type_number = [],
    value = 0
    };
getRow(227)->
    #find_resCfg {
    id = 227,
    ac_id = 12,
    name = "永不停歇",
    max_times = 11100000,
    open_level = 12,
    lvl_s = 155,
    lvl_e = 155,
    diamonds_find = 2,
    use_diamond = 1500,
    reward_exp = 0,
    type_number = [],
    value = 0
    };
getRow(228)->
    #find_resCfg {
    id = 228,
    ac_id = 12,
    name = "永不停歇",
    max_times = 11100000,
    open_level = 12,
    lvl_s = 156,
    lvl_e = 156,
    diamonds_find = 2,
    use_diamond = 1500,
    reward_exp = 0,
    type_number = [],
    value = 0
    };
getRow(229)->
    #find_resCfg {
    id = 229,
    ac_id = 12,
    name = "永不停歇",
    max_times = 11100000,
    open_level = 12,
    lvl_s = 157,
    lvl_e = 157,
    diamonds_find = 2,
    use_diamond = 1500,
    reward_exp = 0,
    type_number = [],
    value = 0
    };
getRow(230)->
    #find_resCfg {
    id = 230,
    ac_id = 12,
    name = "永不停歇",
    max_times = 11100000,
    open_level = 12,
    lvl_s = 158,
    lvl_e = 158,
    diamonds_find = 2,
    use_diamond = 1500,
    reward_exp = 0,
    type_number = [],
    value = 0
    };
getRow(231)->
    #find_resCfg {
    id = 231,
    ac_id = 12,
    name = "永不停歇",
    max_times = 11100000,
    open_level = 12,
    lvl_s = 159,
    lvl_e = 159,
    diamonds_find = 2,
    use_diamond = 1500,
    reward_exp = 0,
    type_number = [],
    value = 0
    };
getRow(232)->
    #find_resCfg {
    id = 232,
    ac_id = 12,
    name = "永不停歇",
    max_times = 11800000,
    open_level = 12,
    lvl_s = 160,
    lvl_e = 160,
    diamonds_find = 2,
    use_diamond = 1500,
    reward_exp = 0,
    type_number = [],
    value = 0
    };
getRow(233)->
    #find_resCfg {
    id = 233,
    ac_id = 12,
    name = "永不停歇",
    max_times = 11800000,
    open_level = 12,
    lvl_s = 161,
    lvl_e = 161,
    diamonds_find = 2,
    use_diamond = 1500,
    reward_exp = 0,
    type_number = [],
    value = 0
    };
getRow(234)->
    #find_resCfg {
    id = 234,
    ac_id = 12,
    name = "永不停歇",
    max_times = 11800000,
    open_level = 12,
    lvl_s = 162,
    lvl_e = 162,
    diamonds_find = 2,
    use_diamond = 1500,
    reward_exp = 0,
    type_number = [],
    value = 0
    };
getRow(235)->
    #find_resCfg {
    id = 235,
    ac_id = 12,
    name = "永不停歇",
    max_times = 11800000,
    open_level = 12,
    lvl_s = 163,
    lvl_e = 163,
    diamonds_find = 2,
    use_diamond = 1500,
    reward_exp = 0,
    type_number = [],
    value = 0
    };
getRow(236)->
    #find_resCfg {
    id = 236,
    ac_id = 12,
    name = "永不停歇",
    max_times = 11800000,
    open_level = 12,
    lvl_s = 164,
    lvl_e = 164,
    diamonds_find = 2,
    use_diamond = 1500,
    reward_exp = 0,
    type_number = [],
    value = 0
    };
getRow(237)->
    #find_resCfg {
    id = 237,
    ac_id = 12,
    name = "永不停歇",
    max_times = 11800000,
    open_level = 12,
    lvl_s = 165,
    lvl_e = 165,
    diamonds_find = 2,
    use_diamond = 1500,
    reward_exp = 0,
    type_number = [],
    value = 0
    };
getRow(238)->
    #find_resCfg {
    id = 238,
    ac_id = 12,
    name = "永不停歇",
    max_times = 11800000,
    open_level = 12,
    lvl_s = 166,
    lvl_e = 166,
    diamonds_find = 2,
    use_diamond = 1500,
    reward_exp = 0,
    type_number = [],
    value = 0
    };
getRow(239)->
    #find_resCfg {
    id = 239,
    ac_id = 12,
    name = "永不停歇",
    max_times = 11800000,
    open_level = 12,
    lvl_s = 167,
    lvl_e = 167,
    diamonds_find = 2,
    use_diamond = 1500,
    reward_exp = 0,
    type_number = [],
    value = 0
    };
getRow(240)->
    #find_resCfg {
    id = 240,
    ac_id = 12,
    name = "永不停歇",
    max_times = 11800000,
    open_level = 12,
    lvl_s = 168,
    lvl_e = 168,
    diamonds_find = 2,
    use_diamond = 1500,
    reward_exp = 0,
    type_number = [],
    value = 0
    };
getRow(241)->
    #find_resCfg {
    id = 241,
    ac_id = 12,
    name = "永不停歇",
    max_times = 11800000,
    open_level = 12,
    lvl_s = 169,
    lvl_e = 169,
    diamonds_find = 2,
    use_diamond = 1500,
    reward_exp = 0,
    type_number = [],
    value = 0
    };
getRow(242)->
    #find_resCfg {
    id = 242,
    ac_id = 12,
    name = "永不停歇",
    max_times = 12500000,
    open_level = 12,
    lvl_s = 170,
    lvl_e = 170,
    diamonds_find = 2,
    use_diamond = 1500,
    reward_exp = 0,
    type_number = [],
    value = 0
    };
getRow(243)->
    #find_resCfg {
    id = 243,
    ac_id = 12,
    name = "永不停歇",
    max_times = 12500000,
    open_level = 12,
    lvl_s = 171,
    lvl_e = 171,
    diamonds_find = 2,
    use_diamond = 1500,
    reward_exp = 0,
    type_number = [],
    value = 0
    };
getRow(244)->
    #find_resCfg {
    id = 244,
    ac_id = 12,
    name = "永不停歇",
    max_times = 12500000,
    open_level = 12,
    lvl_s = 172,
    lvl_e = 172,
    diamonds_find = 2,
    use_diamond = 1500,
    reward_exp = 0,
    type_number = [],
    value = 0
    };
getRow(245)->
    #find_resCfg {
    id = 245,
    ac_id = 12,
    name = "永不停歇",
    max_times = 12500000,
    open_level = 12,
    lvl_s = 173,
    lvl_e = 173,
    diamonds_find = 2,
    use_diamond = 1500,
    reward_exp = 0,
    type_number = [],
    value = 0
    };
getRow(246)->
    #find_resCfg {
    id = 246,
    ac_id = 12,
    name = "永不停歇",
    max_times = 12500000,
    open_level = 12,
    lvl_s = 174,
    lvl_e = 174,
    diamonds_find = 2,
    use_diamond = 1500,
    reward_exp = 0,
    type_number = [],
    value = 0
    };
getRow(247)->
    #find_resCfg {
    id = 247,
    ac_id = 12,
    name = "永不停歇",
    max_times = 12500000,
    open_level = 12,
    lvl_s = 175,
    lvl_e = 175,
    diamonds_find = 2,
    use_diamond = 1500,
    reward_exp = 0,
    type_number = [],
    value = 0
    };
getRow(248)->
    #find_resCfg {
    id = 248,
    ac_id = 12,
    name = "永不停歇",
    max_times = 12500000,
    open_level = 12,
    lvl_s = 176,
    lvl_e = 176,
    diamonds_find = 2,
    use_diamond = 1500,
    reward_exp = 0,
    type_number = [],
    value = 0
    };
getRow(249)->
    #find_resCfg {
    id = 249,
    ac_id = 12,
    name = "永不停歇",
    max_times = 12500000,
    open_level = 12,
    lvl_s = 177,
    lvl_e = 177,
    diamonds_find = 2,
    use_diamond = 1500,
    reward_exp = 0,
    type_number = [],
    value = 0
    };
getRow(250)->
    #find_resCfg {
    id = 250,
    ac_id = 12,
    name = "永不停歇",
    max_times = 12500000,
    open_level = 12,
    lvl_s = 178,
    lvl_e = 178,
    diamonds_find = 2,
    use_diamond = 1500,
    reward_exp = 0,
    type_number = [],
    value = 0
    };
getRow(251)->
    #find_resCfg {
    id = 251,
    ac_id = 12,
    name = "永不停歇",
    max_times = 12500000,
    open_level = 12,
    lvl_s = 179,
    lvl_e = 179,
    diamonds_find = 2,
    use_diamond = 1500,
    reward_exp = 0,
    type_number = [],
    value = 0
    };
getRow(252)->
    #find_resCfg {
    id = 252,
    ac_id = 12,
    name = "永不停歇",
    max_times = 13200000,
    open_level = 12,
    lvl_s = 180,
    lvl_e = 180,
    diamonds_find = 2,
    use_diamond = 1500,
    reward_exp = 0,
    type_number = [],
    value = 0
    };
getRow(253)->
    #find_resCfg {
    id = 253,
    ac_id = 12,
    name = "永不停歇",
    max_times = 13200000,
    open_level = 12,
    lvl_s = 181,
    lvl_e = 181,
    diamonds_find = 2,
    use_diamond = 1500,
    reward_exp = 0,
    type_number = [],
    value = 0
    };
getRow(254)->
    #find_resCfg {
    id = 254,
    ac_id = 12,
    name = "永不停歇",
    max_times = 13200000,
    open_level = 12,
    lvl_s = 182,
    lvl_e = 182,
    diamonds_find = 2,
    use_diamond = 1500,
    reward_exp = 0,
    type_number = [],
    value = 0
    };
getRow(255)->
    #find_resCfg {
    id = 255,
    ac_id = 12,
    name = "永不停歇",
    max_times = 13200000,
    open_level = 12,
    lvl_s = 183,
    lvl_e = 183,
    diamonds_find = 2,
    use_diamond = 1500,
    reward_exp = 0,
    type_number = [],
    value = 0
    };
getRow(256)->
    #find_resCfg {
    id = 256,
    ac_id = 12,
    name = "永不停歇",
    max_times = 13200000,
    open_level = 12,
    lvl_s = 184,
    lvl_e = 184,
    diamonds_find = 2,
    use_diamond = 1500,
    reward_exp = 0,
    type_number = [],
    value = 0
    };
getRow(257)->
    #find_resCfg {
    id = 257,
    ac_id = 12,
    name = "永不停歇",
    max_times = 13200000,
    open_level = 12,
    lvl_s = 185,
    lvl_e = 185,
    diamonds_find = 2,
    use_diamond = 1500,
    reward_exp = 0,
    type_number = [],
    value = 0
    };
getRow(258)->
    #find_resCfg {
    id = 258,
    ac_id = 12,
    name = "永不停歇",
    max_times = 13200000,
    open_level = 12,
    lvl_s = 186,
    lvl_e = 186,
    diamonds_find = 2,
    use_diamond = 1500,
    reward_exp = 0,
    type_number = [],
    value = 0
    };
getRow(259)->
    #find_resCfg {
    id = 259,
    ac_id = 12,
    name = "永不停歇",
    max_times = 13200000,
    open_level = 12,
    lvl_s = 187,
    lvl_e = 187,
    diamonds_find = 2,
    use_diamond = 1500,
    reward_exp = 0,
    type_number = [],
    value = 0
    };
getRow(260)->
    #find_resCfg {
    id = 260,
    ac_id = 12,
    name = "永不停歇",
    max_times = 13200000,
    open_level = 12,
    lvl_s = 188,
    lvl_e = 188,
    diamonds_find = 2,
    use_diamond = 1500,
    reward_exp = 0,
    type_number = [],
    value = 0
    };
getRow(261)->
    #find_resCfg {
    id = 261,
    ac_id = 12,
    name = "永不停歇",
    max_times = 13200000,
    open_level = 12,
    lvl_s = 189,
    lvl_e = 189,
    diamonds_find = 2,
    use_diamond = 1500,
    reward_exp = 0,
    type_number = [],
    value = 0
    };
getRow(262)->
    #find_resCfg {
    id = 262,
    ac_id = 12,
    name = "永不停歇",
    max_times = 13900000,
    open_level = 12,
    lvl_s = 190,
    lvl_e = 190,
    diamonds_find = 2,
    use_diamond = 1500,
    reward_exp = 0,
    type_number = [],
    value = 0
    };
getRow(263)->
    #find_resCfg {
    id = 263,
    ac_id = 12,
    name = "永不停歇",
    max_times = 13900000,
    open_level = 12,
    lvl_s = 191,
    lvl_e = 191,
    diamonds_find = 2,
    use_diamond = 1500,
    reward_exp = 0,
    type_number = [],
    value = 0
    };
getRow(264)->
    #find_resCfg {
    id = 264,
    ac_id = 12,
    name = "永不停歇",
    max_times = 13900000,
    open_level = 12,
    lvl_s = 192,
    lvl_e = 192,
    diamonds_find = 2,
    use_diamond = 1500,
    reward_exp = 0,
    type_number = [],
    value = 0
    };
getRow(265)->
    #find_resCfg {
    id = 265,
    ac_id = 12,
    name = "永不停歇",
    max_times = 13900000,
    open_level = 12,
    lvl_s = 193,
    lvl_e = 193,
    diamonds_find = 2,
    use_diamond = 1500,
    reward_exp = 0,
    type_number = [],
    value = 0
    };
getRow(266)->
    #find_resCfg {
    id = 266,
    ac_id = 12,
    name = "永不停歇",
    max_times = 13900000,
    open_level = 12,
    lvl_s = 194,
    lvl_e = 194,
    diamonds_find = 2,
    use_diamond = 1500,
    reward_exp = 0,
    type_number = [],
    value = 0
    };
getRow(267)->
    #find_resCfg {
    id = 267,
    ac_id = 12,
    name = "永不停歇",
    max_times = 13900000,
    open_level = 12,
    lvl_s = 195,
    lvl_e = 195,
    diamonds_find = 2,
    use_diamond = 1500,
    reward_exp = 0,
    type_number = [],
    value = 0
    };
getRow(268)->
    #find_resCfg {
    id = 268,
    ac_id = 12,
    name = "永不停歇",
    max_times = 13900000,
    open_level = 12,
    lvl_s = 196,
    lvl_e = 196,
    diamonds_find = 2,
    use_diamond = 1500,
    reward_exp = 0,
    type_number = [],
    value = 0
    };
getRow(269)->
    #find_resCfg {
    id = 269,
    ac_id = 12,
    name = "永不停歇",
    max_times = 13900000,
    open_level = 12,
    lvl_s = 197,
    lvl_e = 197,
    diamonds_find = 2,
    use_diamond = 1500,
    reward_exp = 0,
    type_number = [],
    value = 0
    };
getRow(270)->
    #find_resCfg {
    id = 270,
    ac_id = 12,
    name = "永不停歇",
    max_times = 13900000,
    open_level = 12,
    lvl_s = 198,
    lvl_e = 198,
    diamonds_find = 2,
    use_diamond = 1500,
    reward_exp = 0,
    type_number = [],
    value = 0
    };
getRow(271)->
    #find_resCfg {
    id = 271,
    ac_id = 12,
    name = "永不停歇",
    max_times = 13900000,
    open_level = 12,
    lvl_s = 199,
    lvl_e = 199,
    diamonds_find = 2,
    use_diamond = 1500,
    reward_exp = 0,
    type_number = [],
    value = 0
    };
getRow(272)->
    #find_resCfg {
    id = 272,
    ac_id = 12,
    name = "永不停歇",
    max_times = 14600000,
    open_level = 12,
    lvl_s = 200,
    lvl_e = 200,
    diamonds_find = 2,
    use_diamond = 1500,
    reward_exp = 0,
    type_number = [],
    value = 0
    };
getRow(273)->
    #find_resCfg {
    id = 273,
    ac_id = 12,
    name = "永不停歇",
    max_times = 14600000,
    open_level = 12,
    lvl_s = 201,
    lvl_e = 201,
    diamonds_find = 2,
    use_diamond = 1500,
    reward_exp = 0,
    type_number = [],
    value = 0
    };
getRow(274)->
    #find_resCfg {
    id = 274,
    ac_id = 12,
    name = "永不停歇",
    max_times = 14600000,
    open_level = 12,
    lvl_s = 202,
    lvl_e = 202,
    diamonds_find = 2,
    use_diamond = 1500,
    reward_exp = 0,
    type_number = [],
    value = 0
    };
getRow(275)->
    #find_resCfg {
    id = 275,
    ac_id = 12,
    name = "永不停歇",
    max_times = 14600000,
    open_level = 12,
    lvl_s = 203,
    lvl_e = 203,
    diamonds_find = 2,
    use_diamond = 1500,
    reward_exp = 0,
    type_number = [],
    value = 0
    };
getRow(276)->
    #find_resCfg {
    id = 276,
    ac_id = 12,
    name = "永不停歇",
    max_times = 14600000,
    open_level = 12,
    lvl_s = 204,
    lvl_e = 204,
    diamonds_find = 2,
    use_diamond = 1500,
    reward_exp = 0,
    type_number = [],
    value = 0
    };
getRow(277)->
    #find_resCfg {
    id = 277,
    ac_id = 12,
    name = "永不停歇",
    max_times = 14600000,
    open_level = 12,
    lvl_s = 205,
    lvl_e = 205,
    diamonds_find = 2,
    use_diamond = 1500,
    reward_exp = 0,
    type_number = [],
    value = 0
    };
getRow(278)->
    #find_resCfg {
    id = 278,
    ac_id = 12,
    name = "永不停歇",
    max_times = 14600000,
    open_level = 12,
    lvl_s = 206,
    lvl_e = 206,
    diamonds_find = 2,
    use_diamond = 1500,
    reward_exp = 0,
    type_number = [],
    value = 0
    };
getRow(279)->
    #find_resCfg {
    id = 279,
    ac_id = 12,
    name = "永不停歇",
    max_times = 14600000,
    open_level = 12,
    lvl_s = 207,
    lvl_e = 207,
    diamonds_find = 2,
    use_diamond = 1500,
    reward_exp = 0,
    type_number = [],
    value = 0
    };
getRow(280)->
    #find_resCfg {
    id = 280,
    ac_id = 12,
    name = "永不停歇",
    max_times = 14600000,
    open_level = 12,
    lvl_s = 208,
    lvl_e = 208,
    diamonds_find = 2,
    use_diamond = 1500,
    reward_exp = 0,
    type_number = [],
    value = 0
    };
getRow(281)->
    #find_resCfg {
    id = 281,
    ac_id = 12,
    name = "永不停歇",
    max_times = 14600000,
    open_level = 12,
    lvl_s = 209,
    lvl_e = 209,
    diamonds_find = 2,
    use_diamond = 1500,
    reward_exp = 0,
    type_number = [],
    value = 0
    };
getRow(282)->
    #find_resCfg {
    id = 282,
    ac_id = 12,
    name = "永不停歇",
    max_times = 15300000,
    open_level = 12,
    lvl_s = 210,
    lvl_e = 210,
    diamonds_find = 2,
    use_diamond = 1500,
    reward_exp = 0,
    type_number = [],
    value = 0
    };
getRow(290)->
    #find_resCfg {
    id = 290,
    ac_id = 13,
    name = "日常任务",
    max_times = 10,
    open_level = 37,
    lvl_s = 37,
    lvl_e = 42,
    diamonds_find = 2,
    use_diamond = 100,
    reward_exp = 90000,
    type_number = [],
    value = 0
    };
getRow(291)->
    #find_resCfg {
    id = 291,
    ac_id = 13,
    name = "日常任务",
    max_times = 10,
    open_level = 37,
    lvl_s = 43,
    lvl_e = 52,
    diamonds_find = 2,
    use_diamond = 100,
    reward_exp = 90000,
    type_number = [],
    value = 0
    };
getRow(292)->
    #find_resCfg {
    id = 292,
    ac_id = 13,
    name = "日常任务",
    max_times = 10,
    open_level = 37,
    lvl_s = 53,
    lvl_e = 59,
    diamonds_find = 2,
    use_diamond = 100,
    reward_exp = 113000,
    type_number = [],
    value = 0
    };
getRow(293)->
    #find_resCfg {
    id = 293,
    ac_id = 13,
    name = "日常任务",
    max_times = 10,
    open_level = 37,
    lvl_s = 60,
    lvl_e = 69,
    diamonds_find = 2,
    use_diamond = 100,
    reward_exp = 135000,
    type_number = [],
    value = 0
    };
getRow(294)->
    #find_resCfg {
    id = 294,
    ac_id = 13,
    name = "日常任务",
    max_times = 10,
    open_level = 37,
    lvl_s = 70,
    lvl_e = 74,
    diamonds_find = 2,
    use_diamond = 100,
    reward_exp = 158000,
    type_number = [],
    value = 0
    };
getRow(295)->
    #find_resCfg {
    id = 295,
    ac_id = 13,
    name = "日常任务",
    max_times = 10,
    open_level = 37,
    lvl_s = 75,
    lvl_e = 79,
    diamonds_find = 2,
    use_diamond = 100,
    reward_exp = 180000,
    type_number = [],
    value = 0
    };
getRow(296)->
    #find_resCfg {
    id = 296,
    ac_id = 13,
    name = "日常任务",
    max_times = 10,
    open_level = 37,
    lvl_s = 80,
    lvl_e = 84,
    diamonds_find = 2,
    use_diamond = 100,
    reward_exp = 203000,
    type_number = [],
    value = 0
    };
getRow(297)->
    #find_resCfg {
    id = 297,
    ac_id = 13,
    name = "日常任务",
    max_times = 10,
    open_level = 37,
    lvl_s = 85,
    lvl_e = 89,
    diamonds_find = 2,
    use_diamond = 100,
    reward_exp = 225000,
    type_number = [],
    value = 0
    };
getRow(298)->
    #find_resCfg {
    id = 298,
    ac_id = 13,
    name = "日常任务",
    max_times = 10,
    open_level = 37,
    lvl_s = 90,
    lvl_e = 99,
    diamonds_find = 2,
    use_diamond = 100,
    reward_exp = 248000,
    type_number = [],
    value = 0
    };
getRow(299)->
    #find_resCfg {
    id = 299,
    ac_id = 13,
    name = "日常任务",
    max_times = 10,
    open_level = 37,
    lvl_s = 100,
    lvl_e = 109,
    diamonds_find = 2,
    use_diamond = 100,
    reward_exp = 270000,
    type_number = [],
    value = 0
    };
getRow(300)->
    #find_resCfg {
    id = 300,
    ac_id = 13,
    name = "日常任务",
    max_times = 10,
    open_level = 37,
    lvl_s = 110,
    lvl_e = 119,
    diamonds_find = 2,
    use_diamond = 100,
    reward_exp = 293000,
    type_number = [],
    value = 0
    };
getRow(301)->
    #find_resCfg {
    id = 301,
    ac_id = 13,
    name = "日常任务",
    max_times = 10,
    open_level = 37,
    lvl_s = 120,
    lvl_e = 129,
    diamonds_find = 2,
    use_diamond = 100,
    reward_exp = 315000,
    type_number = [],
    value = 0
    };
getRow(302)->
    #find_resCfg {
    id = 302,
    ac_id = 13,
    name = "日常任务",
    max_times = 10,
    open_level = 37,
    lvl_s = 130,
    lvl_e = 139,
    diamonds_find = 2,
    use_diamond = 100,
    reward_exp = 338000,
    type_number = [],
    value = 0
    };
getRow(303)->
    #find_resCfg {
    id = 303,
    ac_id = 13,
    name = "日常任务",
    max_times = 10,
    open_level = 37,
    lvl_s = 140,
    lvl_e = 149,
    diamonds_find = 2,
    use_diamond = 100,
    reward_exp = 360000,
    type_number = [],
    value = 0
    };
getRow(304)->
    #find_resCfg {
    id = 304,
    ac_id = 13,
    name = "日常任务",
    max_times = 10,
    open_level = 37,
    lvl_s = 150,
    lvl_e = 159,
    diamonds_find = 2,
    use_diamond = 100,
    reward_exp = 383000,
    type_number = [],
    value = 0
    };
getRow(305)->
    #find_resCfg {
    id = 305,
    ac_id = 13,
    name = "日常任务",
    max_times = 10,
    open_level = 37,
    lvl_s = 160,
    lvl_e = 169,
    diamonds_find = 2,
    use_diamond = 100,
    reward_exp = 405000,
    type_number = [],
    value = 0
    };
getRow(306)->
    #find_resCfg {
    id = 306,
    ac_id = 13,
    name = "日常任务",
    max_times = 10,
    open_level = 37,
    lvl_s = 170,
    lvl_e = 179,
    diamonds_find = 2,
    use_diamond = 100,
    reward_exp = 428000,
    type_number = [],
    value = 0
    };
getRow(307)->
    #find_resCfg {
    id = 307,
    ac_id = 13,
    name = "日常任务",
    max_times = 10,
    open_level = 37,
    lvl_s = 180,
    lvl_e = 189,
    diamonds_find = 2,
    use_diamond = 100,
    reward_exp = 450000,
    type_number = [],
    value = 0
    };
getRow(308)->
    #find_resCfg {
    id = 308,
    ac_id = 13,
    name = "日常任务",
    max_times = 10,
    open_level = 37,
    lvl_s = 190,
    lvl_e = 199,
    diamonds_find = 2,
    use_diamond = 100,
    reward_exp = 473000,
    type_number = [],
    value = 0
    };
getRow(309)->
    #find_resCfg {
    id = 309,
    ac_id = 13,
    name = "日常任务",
    max_times = 10,
    open_level = 37,
    lvl_s = 200,
    lvl_e = 209,
    diamonds_find = 2,
    use_diamond = 100,
    reward_exp = 495000,
    type_number = [],
    value = 0
    };
getRow(310)->
    #find_resCfg {
    id = 310,
    ac_id = 13,
    name = "日常任务",
    max_times = 10,
    open_level = 37,
    lvl_s = 210,
    lvl_e = 210,
    diamonds_find = 2,
    use_diamond = 100,
    reward_exp = 518000,
    type_number = [],
    value = 0
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
    {310}
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
    310
    ].

