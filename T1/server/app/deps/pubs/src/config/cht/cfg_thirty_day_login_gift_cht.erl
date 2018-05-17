%% coding: latin-1
%%: 实现
-module(cfg_thirty_day_login_gift_cht).
-compile(export_all).
-include("cfg_thirty_day_login_gift.hrl").


getRow(100)->
    #thirty_day_login_giftCfg {
    id = 100,
    name = "10级蓝色武器",
    type = 1,
    value = 10,
    title = "稀有武器 战力飙升",
    text = "ThirtyDay_Title_0",
    rewardstype = 1,
    rewards = [{101,31009},{201,31057},{301,31105}],
    extra_rewards = [{202,5},{2160,15},{230,10},{603,2}],
    modelType = 0,
    display = 2,
    tabIcon = [],
    model = [{101,31009},{201,31057},{301,31105}]
    };
getRow(101)->
    #thirty_day_login_giftCfg {
    id = 101,
    name = "白马",
    type = 1,
    value = 15,
    title = "浪漫童话 畅游梦乡",
    text = "ThirtyDay_Title_0",
    rewardstype = 3,
    rewards = [{1814,1}],
    extra_rewards = [{203,5},{6000,5},{11000,3},{603,3}],
    modelType = 1,
    display = 2,
    tabIcon = [],
    model = [{51004}]
    };
getRow(102)->
    #thirty_day_login_giftCfg {
    id = 102,
    name = "武器精炼石",
    type = 1,
    value = 18,
    title = "传说防具 固若金汤",
    text = "ThirtyDay_Title_0",
    rewardstype = 3,
    extra_rewards = [{222,2},{223,8},{224,6},{201,5},{603,3}],
    modelType = 2,
    display = 2,
    tabIcon = [],
    model = [{30040}]
    };
getRow(103)->
    #thirty_day_login_giftCfg {
    id = 103,
    name = "武器精炼石",
    type = 1,
    value = 20,
    title = "萌兔归来 Show time！",
    text = "ThirtyDay_Title_0",
    rewardstype = 3,
    extra_rewards = [{222,4},{223,16},{224,12},{2002,2000},{603,4}],
    modelType = 2,
    display = 2,
    tabIcon = [],
    model = [{30041}]
    };
getRow(104)->
    #thirty_day_login_giftCfg {
    id = 104,
    name = "猫咪时装衣服",
    type = 2,
    value = 2,
    title = "萌兔归来 Dance！",
    text = "ThirtyDay_Title_0",
    rewardstype = 2,
    rewards = [{0,14163},{1,14164}],
    extra_rewards = [{230,12},{225,1},{2160,20},{605,1}],
    modelType = 3,
    display = 2,
    tabIcon = [],
    model = [{0,163},{1,164}]
    };
getRow(105)->
    #thirty_day_login_giftCfg {
    id = 105,
    name = "25级红色武器核心",
    type = 1,
    value = 21,
    title = "化羽成蝶 随风起舞",
    text = "ThirtyDay_Title_0",
    rewardstype = 3,
    extra_rewards = [{7501,2},{7000,100},{2601,5},{221,5},{605,1}],
    modelType = 2,
    display = 2,
    tabIcon = [],
    model = [{30043}]
    };
getRow(106)->
    #thirty_day_login_giftCfg {
    id = 106,
    name = "猫咪时装头",
    type = 1,
    value = 24,
    title = "荣誉纹章 战力辉煌",
    text = "ThirtyDay_Title_0",
    rewardstype = 2,
    rewards = [{0,14161},{1,14162}],
    extra_rewards = [{2601,5},{221,5},{7501,3},{7000,150}],
    modelType = 3,
    display = 2,
    tabIcon = [],
    model = [{0,161},{1,162}]
    };
getRow(107)->
    #thirty_day_login_giftCfg {
    id = 107,
    name = "钓鱼客的背包",
    type = 2,
    value = 3,
    title = "天降千钻 好运连连",
    text = "ThirtyDay_Title_0",
    rewardstype = 2,
    rewards = [{0,14175},{1,14175}],
    extra_rewards = [{222,6},{223,24},{224,18},{605,1}],
    modelType = 3,
    display = 2,
    tabIcon = [],
    model = [{0,175},{1,175}]
    };
getRow(108)->
    #thirty_day_login_giftCfg {
    id = 108,
    name = "属性附魔石",
    type = 1,
    value = 28,
    title = "大黄蜂~变形！出发！",
    text = "ThirtyDay_Title_0",
    rewardstype = 3,
    extra_rewards = [{240,10},{230,10},{201,10},{1115,4},{605,1}],
    modelType = 2,
    display = 2,
    tabIcon = [],
    model = [{30044}]
    };
getRow(109)->
    #thirty_day_login_giftCfg {
    id = 109,
    name = "粉红独角兽",
    type = 1,
    value = 30,
    title = "传说防具 固若金汤",
    text = "ThirtyDay_Title_0",
    rewardstype = 3,
    extra_rewards = [{1836,2},{240,10},{230,10},{1115,4},{606,1}],
    modelType = 1,
    display = 2,
    tabIcon = [],
    model = [{53006}]
    };
getRow(110)->
    #thirty_day_login_giftCfg {
    id = 110,
    name = "30级紫色核心宝箱",
    type = 2,
    value = 4,
    title = "强悍魔灵 灌注辉光",
    text = "ThirtyDay_Title_0",
    rewardstype = 3,
    extra_rewards = [{3150,1},{905,1},{240,20},{2002,3000},{606,1}],
    modelType = 2,
    display = 2,
    tabIcon = [],
    model = [{30045}]
    };
getRow(111)->
    #thirty_day_login_giftCfg {
    id = 111,
    name = "璀璨晶体",
    type = 2,
    value = 5,
    title = "天降千钻 好运连连",
    text = "ThirtyDay_Title_0",
    rewardstype = 3,
    extra_rewards = [{2601,10},{251,15},{252,15},{2160,20},{606,1}],
    modelType = 2,
    display = 2,
    tabIcon = [],
    model = [{30046}]
    };
getRow(112)->
    #thirty_day_login_giftCfg {
    id = 112,
    name = "2级攻击纹章",
    type = 2,
    value = 6,
    title = "强悍魔灵 灌注辉光",
    text = "ThirtyDay_Title_0",
    rewardstype = 3,
    extra_rewards = [{21001,1},{21051,1},{21101,1},{221,40},{240,20}],
    modelType = 2,
    display = 2,
    tabIcon = [],
    model = [{30042}]
    };
getRow(113)->
    #thirty_day_login_giftCfg {
    id = 113,
    name = "气球熊猫",
    type = 2,
    value = 7,
    title = "oppa江南 史tyle",
    text = "ThirtyDay_Title_0",
    rewardstype = 3,
    rewards = [{1842,1}],
    extra_rewards = [{1836,3},{240,30},{2002,4000},{1115,10}],
    modelType = 1,
    display = 2,
    tabIcon = [],
    model = [{54002}]
    };
getRow(114)->
    #thirty_day_login_giftCfg {
    id = 114,
    name = "璀璨晶体",
    type = 2,
    value = 8,
    title = "强悍魔灵 灌注辉光",
    text = "ThirtyDay_Title_0",
    rewardstype = 3,
    extra_rewards = [{2601,20},{906,1},{204,3},{11001,6},{606,2}],
    modelType = 2,
    display = 2,
    tabIcon = [],
    model = [{30046}]
    };
getRow(115)->
    #thirty_day_login_giftCfg {
    id = 115,
    name = "属性附魔石",
    type = 2,
    value = 10,
    title = "紫象降临 碾压四方",
    text = "ThirtyDay_Title_0",
    rewardstype = 3,
    extra_rewards = [{240,50},{221,10},{230,5},{251,20},{252,20}],
    modelType = 2,
    display = 2,
    tabIcon = [],
    model = [{30047}]
    };
getRow(116)->
    #thirty_day_login_giftCfg {
    id = 116,
    name = "雪熊熊",
    type = 2,
    value = 15,
    title = "紫象降临 碾压四方",
    text = "ThirtyDay_Title_0",
    rewardstype = 2,
    rewards = [{0,14179},{1,14179}],
    extra_rewards = [{204,5},{23002,5},{1115,10},{606,3}],
    modelType = 3,
    display = 2,
    tabIcon = [],
    model = [{0,179},{1,179}]
    };
getRow(117)->
    #thirty_day_login_giftCfg {
    id = 117,
    name = "55级红色核心宝箱",
    type = 2,
    value = 20,
    title = "紫象降临 碾压四方",
    text = "ThirtyDay_Title_0",
    rewardstype = 3,
    extra_rewards = [{3102,2},{7002,200},{23002,5},{231,10},{606,4}],
    modelType = 2,
    display = 2,
    tabIcon = [],
    model = [{30047}]
    };
getRow(118)->
    #thirty_day_login_giftCfg {
    id = 118,
    name = "杂技大师",
    type = 2,
    value = 30,
    title = "紫象降临 碾压四方",
    text = "ThirtyDay_Title_0",
    rewardstype = 3,
    rewards = [{1841,1}],
    extra_rewards = [{907,1},{23002,5},{2002,5000},{607,1}],
    modelType = 1,
    display = 2,
    tabIcon = [],
    model = [{54001}]
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
    {115},
    {116},
    {117},
    {118}
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
    115,
    116,
    117,
    118
    ].

