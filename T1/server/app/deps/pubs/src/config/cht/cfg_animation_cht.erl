%% coding: latin-1
%%: 实现
-module(cfg_animation_cht).
-compile(export_all).
-include("cfg_animation.hrl").
-include("logger.hrl").

getRow(1)->
    #animationCfg {
    id = 1,
    name = "10jifuben_1",
    isloop = 1
    };
getRow(2)->
    #animationCfg {
    id = 2,
    name = "10jifuben_boss_1",
    isloop = 1
    };
getRow(3)->
    #animationCfg {
    id = 3,
    name = "20jifuben_1",
    isloop = 1
    };
getRow(4)->
    #animationCfg {
    id = 4,
    name = "20jifuben_boss_1",
    isloop = 1
    };
getRow(5)->
    #animationCfg {
    id = 5,
    name = "30jifuben_1",
    isloop = 1
    };
getRow(6)->
    #animationCfg {
    id = 6,
    name = "30jifuben_boss_1",
    isloop = 1
    };
getRow(7)->
    #animationCfg {
    id = 7,
    name = "shilaimu_1",
    isloop = 1
    };
getRow(8)->
    #animationCfg {
    id = 8,
    name = "shilaimu_2",
    isloop = 1
    };
getRow(101)->
    #animationCfg {
    id = 101,
    name = "cailiaofuben_1",
    isloop = 1
    };
getRow(102)->
    #animationCfg {
    id = 102,
    name = "jingtianmiaodaotuan_1",
    isloop = 1
    };
getRow(1001)->
    #animationCfg {
    id = 1001,
    name = "akelegangkou_1",
    isloop = 0
    };
getRow(1002)->
    #animationCfg {
    id = 1002,
    name = "dongchengjiao_1",
    isloop = 0
    };
getRow(1004)->
    #animationCfg {
    id = 1004,
    name = "akelepingyuan_1",
    isloop = 0
    };
getRow(1005)->
    #animationCfg {
    id = 1005,
    name = "cangkongxueyv_1",
    isloop = 0
    };
getRow(1006)->
    #animationCfg {
    id = 1006,
    name = "jinglinggutu_1",
    isloop = 0
    };
getRow(1007)->
    #animationCfg {
    id = 1007,
    name = "akelezhucheng_1",
    isloop = 0
    };
getRow(1008)->
    #animationCfg {
    id = 1008,
    name = "cangkongzhita_1",
    isloop = 0
    };
getRow(1009)->
    #animationCfg {
    id = 1009,
    name = "jinglinggutu_1",
    isloop = 0
    };
getRow(1010)->
    #animationCfg {
    id = 1010,
    name = "yijigudi_1",
    isloop = 0
    };
getRow(1011)->
    #animationCfg {
    id = 1011,
    name = "jinlingbinansuo_1",
    isloop = 0
    };
getRow(1012)->
    #animationCfg {
    id = 1012,
    name = "heiansenlin_1",
    isloop = 0
    };
getRow(2001)->
    #animationCfg {
    id = 2001,
    name = "kuqidenvhai_1",
    isloop = 0
    };
getRow(2002)->
    #animationCfg {
    id = 2002,
    name = "mozuanna_1",
    isloop = 0
    };
getRow(2003)->
    #animationCfg {
    id = 2003,
    name = "shenzhizhaohuan_1",
    isloop = 0
    };
getRow(2100)->
    #animationCfg {
    id = 2100,
    name = "kaohekaishi_1",
    isloop = 0
    };
getRow(2101)->
    #animationCfg {
    id = 2101,
    name = "chouqukaohe_1",
    isloop = 0
    };
getRow(2102)->
    #animationCfg {
    id = 2102,
    name = "dabaimowu_1",
    isloop = 1
    };
getRow(2103)->
    #animationCfg {
    id = 2103,
    name = "huodeqichong_2",
    isloop = 1
    };
getRow(2104)->
    #animationCfg {
    id = 2104,
    name = "huodeqichong_1",
    isloop = 1
    };
getRow(2105)->
    #animationCfg {
    id = 2105,
    name = "jibailuosate_1",
    isloop = 1
    };
getRow(2106)->
    #animationCfg {
    id = 2106,
    name = "juexingboss_1",
    isloop = 1
    };
getRow(2107)->
    #animationCfg {
    id = 2107,
    name = "annabeibang_1",
    isloop = 1
    };
getRow(2108)->
    #animationCfg {
    id = 2108,
    name = "lingzhubeikun_1",
    isloop = 0
    };
getRow(2109)->
    #animationCfg {
    id = 2109,
    name = "fashexinhao_1",
    isloop = 0
    };
getRow(2110)->
    #animationCfg {
    id = 2110,
    name = "kaichang_1",
    isloop = 0
    };
getRow(2111)->
    #animationCfg {
    id = 2111,
    name = "molongchuchang_1",
    isloop = 1
    };
getRow(2112)->
    #animationCfg {
    id = 2112,
    name = "mozuluanru_1",
    isloop = 1
    };
getRow(2113)->
    #animationCfg {
    id = 2113,
    name = "tongguiyujin",
    isloop = 1
    };
getRow(2114)->
    #animationCfg {
    id = 2114,
    name = "chengzhendemeng_1",
    isloop = 1
    };
getRow(2115)->
    #animationCfg {
    id = 2115,
    name = "pingxiyuanqi_1",
    isloop = 1
    };
getRow(2116)->
    #animationCfg {
    id = 2116,
    name = "cangkongxueyu_1",
    isloop = 0
    };
getRow(2117)->
    #animationCfg {
    id = 2117,
    name = "mozudamen_1",
    isloop = 1
    };
getRow(2118)->
    #animationCfg {
    id = 2118,
    name = "keyidexiangzi_1",
    isloop = 1
    };
getRow(10001)->
    #animationCfg {
    id = 10001,
    name = "zhuiganmozu_1",
    isloop = 0
    };
getRow(10002)->
    #animationCfg {
    id = 10002,
    name = "annadejia_1",
    isloop = 0
    };
getRow(10003)->
    #animationCfg {
    id = 10003,
    name = "baohuhuochuan_1",
    isloop = 0
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
    {101},
    {102},
    {1001},
    {1002},
    {1004},
    {1005},
    {1006},
    {1007},
    {1008},
    {1009},
    {1010},
    {1011},
    {1012},
    {2001},
    {2002},
    {2003},
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
    {10001},
    {10002},
    {10003}
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
    101,
    102,
    1001,
    1002,
    1004,
    1005,
    1006,
    1007,
    1008,
    1009,
    1010,
    1011,
    1012,
    2001,
    2002,
    2003,
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
    10001,
    10002,
    10003
    ].

