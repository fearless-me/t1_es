%% coding: latin-1
%%: 实现
-module(cfg_thirty_day_login_gift_chs).
-compile(export_all).
-include("cfg_thirty_day_login_gift.hrl").
-include("logger.hrl").

getRow(100)->
    #thirty_day_login_giftCfg {
    id = 100,
    name = "30级红色武器",
    type = 1,
    value = 28,
    title = "无",
    text = "ThirtyDay_Title_0",
    rewardstype = 1,
    rewards = [{101,55000},{201,55001},{301,55002}],
    extra_rewards = [{6000,3},{2160,6},{230,5},{605,2}],
    modelType = 0,
    display = 2,
    tabIcon = [],
    model = [{101,55000},{201,55001},{301,55002}]
    };
getRow(101)->
    #thirty_day_login_giftCfg {
    id = 101,
    name = "普通扭蛋劵",
    type = 1,
    value = 38,
    title = "无",
    text = "ThirtyDay_Title_0",
    rewardstype = 3,
    extra_rewards = [{15215,4},{2601,5},{11000,4},{221,10},{605,2}],
    modelType = 2,
    display = 2,
    tabIcon = [],
    model = [{30043}]
    };
getRow(102)->
    #thirty_day_login_giftCfg {
    id = 102,
    name = "普通扭蛋劵",
    type = 1,
    value = 40,
    title = "无",
    text = "ThirtyDay_Title_0",
    rewardstype = 3,
    extra_rewards = [{15215,5},{4501,30},{1801,6},{230,6},{605,2}],
    modelType = 2,
    display = 2,
    tabIcon = [],
    model = [{30043}]
    };
getRow(103)->
    #thirty_day_login_giftCfg {
    id = 103,
    name = "蓝色骑宠蛋",
    type = 2,
    value = 2,
    title = "无",
    text = "ThirtyDay_Title_0",
    rewardstype = 3,
    extra_rewards = [{1803,1},{6000,3},{2160,10},{221,12},{4212,3}],
    modelType = 2,
    display = 2,
    tabIcon = [],
    model = [{30043}]
    };
getRow(104)->
    #thirty_day_login_giftCfg {
    id = 104,
    name = "猫咪时装衣服（7天）",
    type = 1,
    value = 50,
    title = "无",
    text = "ThirtyDay_Title_0",
    rewardstype = 2,
    rewards = [{0,16163},{1,16164}],
    extra_rewards = [{2601,5},{11000,4},{230,7},{605,3}],
    modelType = 3,
    display = 2,
    tabIcon = [],
    model = [{0,161},{1,162}]
    };
getRow(105)->
    #thirty_day_login_giftCfg {
    id = 105,
    name = "猫咪时装头（7天）",
    type = 2,
    value = 3,
    title = "无",
    text = "ThirtyDay_Title_0",
    rewardstype = 2,
    rewards = [{0,16161},{1,16162}],
    extra_rewards = [{4501,40},{1801,8},{221,15},{606,2}],
    modelType = 3,
    display = 2,
    tabIcon = [],
    model = [{0,161},{1,162}]
    };
getRow(106)->
    #thirty_day_login_giftCfg {
    id = 106,
    name = "钓鱼客的背包（7天）",
    type = 1,
    value = 65,
    title = "无",
    text = "ThirtyDay_Title_0",
    rewardstype = 2,
    rewards = [{0,16175},{1,16175}],
    extra_rewards = [{6000,4},{2160,15},{230,8},{606,2}],
    modelType = 3,
    display = 2,
    tabIcon = [],
    model = [{0,175},{1,175}]
    };
getRow(107)->
    #thirty_day_login_giftCfg {
    id = 107,
    name = "60级紫色核心宝箱",
    type = 2,
    value = 4,
    title = "无",
    text = "ThirtyDay_Title_0",
    rewardstype = 3,
    extra_rewards = [{3150,3},{2601,5},{11000,5},{221,20},{606,3}],
    modelType = 2,
    display = 2,
    tabIcon = [],
    model = [{30044}]
    };
getRow(108)->
    #thirty_day_login_giftCfg {
    id = 108,
    name = "65级红色装备材料",
    type = 2,
    value = 5,
    title = "无",
    text = "ThirtyDay_Title_0",
    rewardstype = 3,
    extra_rewards = [{7001,40},{4502,40},{1801,10},{230,9},{606,3}],
    modelType = 2,
    display = 2,
    tabIcon = [],
    model = [{30044}]
    };
getRow(109)->
    #thirty_day_login_giftCfg {
    id = 109,
    name = "3级攻击纹章",
    type = 2,
    value = 6,
    title = "无",
    text = "ThirtyDay_Title_0",
    rewardstype = 3,
    extra_rewards = [{21002,2},{6000,4},{2160,20},{221,25},{606,4}],
    modelType = 2,
    display = 2,
    tabIcon = [],
    model = [{30040}]
    };
getRow(110)->
    #thirty_day_login_giftCfg {
    id = 110,
    name = "气球熊猫",
    type = 2,
    value = 7,
    title = "无",
    text = "ThirtyDay_Title_0",
    rewardstype = 3,
    rewards = [{1842,1}],
    extra_rewards = [{2601,10},{11000,8},{230,10},{606,4}],
    modelType = 1,
    display = 2,
    tabIcon = [],
    model = [{54002}]
    };
getRow(111)->
    #thirty_day_login_giftCfg {
    id = 111,
    name = "90级红色装备材料",
    type = 2,
    value = 10,
    title = "无",
    text = "ThirtyDay_Title_0",
    rewardstype = 3,
    extra_rewards = [{7002,70},{4502,50},{1801,12},{221,30},{606,4}],
    modelType = 2,
    display = 2,
    tabIcon = [],
    model = [{30045}]
    };
getRow(112)->
    #thirty_day_login_giftCfg {
    id = 112,
    name = "3级攻击纹章",
    type = 2,
    value = 14,
    title = "无",
    text = "ThirtyDay_Title_0",
    rewardstype = 3,
    extra_rewards = [{21002,5},{6000,5},{2160,25},{230,12},{606,5}],
    modelType = 2,
    display = 2,
    tabIcon = [],
    model = [{30040}]
    };
getRow(113)->
    #thirty_day_login_giftCfg {
    id = 113,
    name = "110级红色装备材料",
    type = 2,
    value = 20,
    title = "无",
    text = "ThirtyDay_Title_0",
    rewardstype = 3,
    extra_rewards = [{7003,90},{2601,10},{11000,10},{221,35},{606,5}],
    modelType = 2,
    display = 2,
    tabIcon = [],
    model = [{30046}]
    };
getRow(114)->
    #thirty_day_login_giftCfg {
    id = 114,
    name = "120级紫色核心宝箱",
    type = 2,
    value = 25,
    title = "无",
    text = "ThirtyDay_Title_0",
    rewardstype = 3,
    extra_rewards = [{3151,2},{4503,50},{1801,15},{230,15},{606,5}],
    modelType = 2,
    display = 2,
    tabIcon = [],
    model = [{30047}]
    };
getRow(115)->
    #thirty_day_login_giftCfg {
    id = 115,
    name = "女神扭蛋劵",
    type = 2,
    value = 30,
    title = "无",
    text = "ThirtyDay_Title_0",
    rewardstype = 3,
    extra_rewards = [{15216,9},{6000,5},{2160,30},{221,40},{606,5}],
    modelType = 2,
    display = 2,
    tabIcon = [],
    model = [{30048}]
    };
getRow(_)->[].

getKeyList()->[
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
    {115}
    ].

get1KeyList()->[
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
    115
    ].

