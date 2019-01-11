%% coding: latin-1
%%: 实现
-module(cfg_mall_chs).
-compile(export_all).
-include("cfg_mall.hrl").
-include("logger.hrl").

getRow(202,2,11)->
    #mallCfg {
    item_id = 202,
    type = 2,
    sort = 11,
    type1 = 0,
    gold = 10,
    bind_gold = 0,
    use_integral = 0,
    get_integral = 0,
    limit_buy = 0,
    limit_type = 0,
    limit_day = 0,
    buy_reset = 0,
    level = 1,
    level_max = 210,
    recharge = 0,
    ishide = 1,
    showtype = 0,
    present = 1
    };
getRow(203,2,12)->
    #mallCfg {
    item_id = 203,
    type = 2,
    sort = 12,
    type1 = 0,
    gold = 50,
    bind_gold = 0,
    use_integral = 0,
    get_integral = 0,
    limit_buy = 0,
    limit_type = 0,
    limit_day = 0,
    buy_reset = 0,
    level = 1,
    level_max = 210,
    recharge = 0,
    ishide = 1,
    showtype = 0,
    present = 1
    };
getRow(204,2,13)->
    #mallCfg {
    item_id = 204,
    type = 2,
    sort = 13,
    type1 = 0,
    gold = 100,
    bind_gold = 0,
    use_integral = 0,
    get_integral = 0,
    limit_buy = 0,
    limit_type = 0,
    limit_day = 0,
    buy_reset = 0,
    level = 60,
    level_max = 210,
    recharge = 0,
    ishide = 1,
    showtype = 0,
    present = 1
    };
getRow(220,1,7)->
    #mallCfg {
    item_id = 220,
    type = 1,
    sort = 7,
    type1 = 0,
    gold = 100,
    bind_gold = 0,
    use_integral = 0,
    get_integral = 0,
    limit_buy = 0,
    limit_type = 3,
    limit_day = 2,
    buy_reset = 0,
    level = 1,
    level_max = 99,
    recharge = 0,
    ishide = 1,
    showtype = 2,
    present = 0
    };
getRow(220,1,8)->
    #mallCfg {
    item_id = 220,
    type = 1,
    sort = 8,
    type1 = 0,
    gold = 100,
    bind_gold = 0,
    use_integral = 0,
    get_integral = 0,
    limit_buy = 0,
    limit_type = 3,
    limit_day = 6,
    buy_reset = 0,
    level = 100,
    level_max = 179,
    recharge = 0,
    ishide = 1,
    showtype = 2,
    present = 0
    };
getRow(220,1,9)->
    #mallCfg {
    item_id = 220,
    type = 1,
    sort = 9,
    type1 = 0,
    gold = 100,
    bind_gold = 0,
    use_integral = 0,
    get_integral = 0,
    limit_buy = 0,
    limit_type = 3,
    limit_day = 12,
    buy_reset = 0,
    level = 180,
    level_max = 210,
    recharge = 0,
    ishide = 1,
    showtype = 2,
    present = 0
    };
getRow(222,2,3)->
    #mallCfg {
    item_id = 222,
    type = 2,
    sort = 3,
    type1 = 0,
    gold = 10,
    bind_gold = 0,
    use_integral = 0,
    get_integral = 0,
    limit_buy = 0,
    limit_type = 0,
    limit_day = 0,
    buy_reset = 0,
    level = 1,
    level_max = 210,
    recharge = 0,
    ishide = 1,
    showtype = 0,
    present = 1
    };
getRow(222,4,4)->
    #mallCfg {
    item_id = 222,
    type = 4,
    sort = 4,
    type1 = 0,
    gold = 0,
    bind_gold = 100,
    use_integral = 0,
    get_integral = 0,
    limit_buy = 0,
    limit_type = 0,
    limit_day = 0,
    buy_reset = 0,
    level = 1,
    level_max = 210,
    recharge = 0,
    ishide = 1,
    showtype = 2,
    present = 0
    };
getRow(223,2,4)->
    #mallCfg {
    item_id = 223,
    type = 2,
    sort = 4,
    type1 = 0,
    gold = 7,
    bind_gold = 0,
    use_integral = 0,
    get_integral = 0,
    limit_buy = 0,
    limit_type = 0,
    limit_day = 0,
    buy_reset = 0,
    level = 1,
    level_max = 210,
    recharge = 0,
    ishide = 1,
    showtype = 0,
    present = 1
    };
getRow(223,4,5)->
    #mallCfg {
    item_id = 223,
    type = 4,
    sort = 5,
    type1 = 0,
    gold = 0,
    bind_gold = 70,
    use_integral = 0,
    get_integral = 0,
    limit_buy = 0,
    limit_type = 0,
    limit_day = 0,
    buy_reset = 0,
    level = 1,
    level_max = 210,
    recharge = 0,
    ishide = 1,
    showtype = 2,
    present = 0
    };
getRow(224,2,5)->
    #mallCfg {
    item_id = 224,
    type = 2,
    sort = 5,
    type1 = 0,
    gold = 7,
    bind_gold = 0,
    use_integral = 0,
    get_integral = 0,
    limit_buy = 0,
    limit_type = 0,
    limit_day = 0,
    buy_reset = 0,
    level = 1,
    level_max = 210,
    recharge = 0,
    ishide = 1,
    showtype = 0,
    present = 1
    };
getRow(224,4,6)->
    #mallCfg {
    item_id = 224,
    type = 4,
    sort = 6,
    type1 = 0,
    gold = 0,
    bind_gold = 70,
    use_integral = 0,
    get_integral = 0,
    limit_buy = 0,
    limit_type = 0,
    limit_day = 0,
    buy_reset = 0,
    level = 1,
    level_max = 210,
    recharge = 0,
    ishide = 1,
    showtype = 2,
    present = 0
    };
getRow(230,1,10)->
    #mallCfg {
    item_id = 230,
    type = 1,
    sort = 10,
    type1 = 0,
    gold = 8,
    bind_gold = 0,
    use_integral = 0,
    get_integral = 0,
    limit_buy = 0,
    limit_type = 3,
    limit_day = 5,
    buy_reset = 0,
    level = 1,
    level_max = 99,
    recharge = 0,
    ishide = 1,
    showtype = 2,
    present = 0
    };
getRow(230,1,11)->
    #mallCfg {
    item_id = 230,
    type = 1,
    sort = 11,
    type1 = 0,
    gold = 8,
    bind_gold = 0,
    use_integral = 0,
    get_integral = 0,
    limit_buy = 0,
    limit_type = 3,
    limit_day = 15,
    buy_reset = 0,
    level = 100,
    level_max = 179,
    recharge = 0,
    ishide = 1,
    showtype = 2,
    present = 0
    };
getRow(230,1,12)->
    #mallCfg {
    item_id = 230,
    type = 1,
    sort = 12,
    type1 = 0,
    gold = 8,
    bind_gold = 0,
    use_integral = 0,
    get_integral = 0,
    limit_buy = 0,
    limit_type = 3,
    limit_day = 30,
    buy_reset = 0,
    level = 180,
    level_max = 210,
    recharge = 0,
    ishide = 1,
    showtype = 2,
    present = 0
    };
getRow(230,2,6)->
    #mallCfg {
    item_id = 230,
    type = 2,
    sort = 6,
    type1 = 0,
    gold = 12,
    bind_gold = 0,
    use_integral = 0,
    get_integral = 0,
    limit_buy = 0,
    limit_type = 0,
    limit_day = 0,
    buy_reset = 0,
    level = 1,
    level_max = 210,
    recharge = 0,
    ishide = 1,
    showtype = 0,
    present = 1
    };
getRow(230,4,7)->
    #mallCfg {
    item_id = 230,
    type = 4,
    sort = 7,
    type1 = 0,
    gold = 0,
    bind_gold = 120,
    use_integral = 0,
    get_integral = 0,
    limit_buy = 0,
    limit_type = 0,
    limit_day = 0,
    buy_reset = 0,
    level = 1,
    level_max = 210,
    recharge = 0,
    ishide = 1,
    showtype = 2,
    present = 0
    };
getRow(231,2,7)->
    #mallCfg {
    item_id = 231,
    type = 2,
    sort = 7,
    type1 = 0,
    gold = 24,
    bind_gold = 0,
    use_integral = 0,
    get_integral = 0,
    limit_buy = 0,
    limit_type = 0,
    limit_day = 0,
    buy_reset = 0,
    level = 60,
    level_max = 210,
    recharge = 0,
    ishide = 1,
    showtype = 0,
    present = 1
    };
getRow(231,4,8)->
    #mallCfg {
    item_id = 231,
    type = 4,
    sort = 8,
    type1 = 0,
    gold = 0,
    bind_gold = 240,
    use_integral = 0,
    get_integral = 0,
    limit_buy = 0,
    limit_type = 0,
    limit_day = 0,
    buy_reset = 0,
    level = 1,
    level_max = 210,
    recharge = 0,
    ishide = 1,
    showtype = 2,
    present = 0
    };
getRow(232,2,8)->
    #mallCfg {
    item_id = 232,
    type = 2,
    sort = 8,
    type1 = 0,
    gold = 48,
    bind_gold = 0,
    use_integral = 0,
    get_integral = 0,
    limit_buy = 0,
    limit_type = 0,
    limit_day = 0,
    buy_reset = 0,
    level = 90,
    level_max = 210,
    recharge = 0,
    ishide = 1,
    showtype = 0,
    present = 1
    };
getRow(232,4,9)->
    #mallCfg {
    item_id = 232,
    type = 4,
    sort = 9,
    type1 = 0,
    gold = 0,
    bind_gold = 480,
    use_integral = 0,
    get_integral = 0,
    limit_buy = 0,
    limit_type = 0,
    limit_day = 0,
    buy_reset = 0,
    level = 1,
    level_max = 210,
    recharge = 0,
    ishide = 1,
    showtype = 2,
    present = 0
    };
getRow(233,2,9)->
    #mallCfg {
    item_id = 233,
    type = 2,
    sort = 9,
    type1 = 0,
    gold = 96,
    bind_gold = 0,
    use_integral = 0,
    get_integral = 0,
    limit_buy = 0,
    limit_type = 0,
    limit_day = 0,
    buy_reset = 0,
    level = 120,
    level_max = 210,
    recharge = 0,
    ishide = 1,
    showtype = 0,
    present = 1
    };
getRow(233,4,10)->
    #mallCfg {
    item_id = 233,
    type = 4,
    sort = 10,
    type1 = 0,
    gold = 0,
    bind_gold = 960,
    use_integral = 0,
    get_integral = 0,
    limit_buy = 0,
    limit_type = 0,
    limit_day = 0,
    buy_reset = 0,
    level = 1,
    level_max = 210,
    recharge = 0,
    ishide = 1,
    showtype = 2,
    present = 0
    };
getRow(272,1,13)->
    #mallCfg {
    item_id = 272,
    type = 1,
    sort = 13,
    type1 = 0,
    gold = 120,
    bind_gold = 0,
    use_integral = 0,
    get_integral = 0,
    limit_buy = 0,
    limit_type = 3,
    limit_day = 2,
    buy_reset = 0,
    level = 70,
    level_max = 210,
    recharge = 0,
    ishide = 1,
    showtype = 2,
    present = 0
    };
getRow(607,1,2)->
    #mallCfg {
    item_id = 607,
    type = 1,
    sort = 2,
    type1 = 0,
    gold = 45,
    bind_gold = 0,
    use_integral = 0,
    get_integral = 0,
    limit_buy = 10,
    limit_type = 1,
    limit_day = 0,
    buy_reset = 0,
    level = 1,
    level_max = 210,
    recharge = 0,
    ishide = 1,
    showtype = 2,
    present = 0
    };
getRow(801,1,1)->
    #mallCfg {
    item_id = 801,
    type = 1,
    sort = 1,
    type1 = 0,
    gold = 980,
    bind_gold = 0,
    use_integral = 0,
    get_integral = 0,
    limit_buy = 1,
    limit_type = 1,
    limit_day = 0,
    buy_reset = 0,
    level = 1,
    level_max = 210,
    recharge = 0,
    ishide = 1,
    showtype = 2,
    present = 0
    };
getRow(802,1,15)->
    #mallCfg {
    item_id = 802,
    type = 1,
    sort = 15,
    type1 = 0,
    gold = 600,
    bind_gold = 0,
    use_integral = 0,
    get_integral = 0,
    limit_buy = 0,
    limit_type = 3,
    limit_day = 1,
    buy_reset = 0,
    level = 1,
    level_max = 210,
    recharge = 0,
    ishide = 1,
    showtype = 2,
    present = 0
    };
getRow(803,1,16)->
    #mallCfg {
    item_id = 803,
    type = 1,
    sort = 16,
    type1 = 0,
    gold = 1000,
    bind_gold = 0,
    use_integral = 0,
    get_integral = 0,
    limit_buy = 0,
    limit_type = 3,
    limit_day = 1,
    buy_reset = 0,
    level = 1,
    level_max = 210,
    recharge = 0,
    ishide = 1,
    showtype = 2,
    present = 0
    };
getRow(804,1,14)->
    #mallCfg {
    item_id = 804,
    type = 1,
    sort = 14,
    type1 = 0,
    gold = 520,
    bind_gold = 0,
    use_integral = 0,
    get_integral = 0,
    limit_buy = 0,
    limit_type = 3,
    limit_day = 1,
    buy_reset = 0,
    level = 1,
    level_max = 210,
    recharge = 0,
    ishide = 1,
    showtype = 2,
    present = 0
    };
getRow(902,3,1)->
    #mallCfg {
    item_id = 902,
    type = 3,
    sort = 1,
    type1 = 0,
    gold = 10,
    bind_gold = 0,
    use_integral = 0,
    get_integral = 0,
    limit_buy = 0,
    limit_type = 0,
    limit_day = 0,
    buy_reset = 0,
    level = 1,
    level_max = 210,
    recharge = 0,
    ishide = 1,
    showtype = 0,
    present = 1
    };
getRow(1300,3,14)->
    #mallCfg {
    item_id = 1300,
    type = 3,
    sort = 14,
    type1 = 0,
    gold = 1000,
    bind_gold = 0,
    use_integral = 0,
    get_integral = 0,
    limit_buy = 0,
    limit_type = 0,
    limit_day = 0,
    buy_reset = 0,
    level = 40,
    level_max = 210,
    recharge = 0,
    ishide = 1,
    showtype = 0,
    present = 1
    };
getRow(2160,2,14)->
    #mallCfg {
    item_id = 2160,
    type = 2,
    sort = 14,
    type1 = 0,
    gold = 8,
    bind_gold = 0,
    use_integral = 0,
    get_integral = 0,
    limit_buy = 0,
    limit_type = 0,
    limit_day = 0,
    buy_reset = 0,
    level = 1,
    level_max = 210,
    recharge = 0,
    ishide = 1,
    showtype = 0,
    present = 1
    };
getRow(2160,4,11)->
    #mallCfg {
    item_id = 2160,
    type = 4,
    sort = 11,
    type1 = 0,
    gold = 0,
    bind_gold = 80,
    use_integral = 0,
    get_integral = 0,
    limit_buy = 0,
    limit_type = 0,
    limit_day = 0,
    buy_reset = 0,
    level = 1,
    level_max = 210,
    recharge = 0,
    ishide = 1,
    showtype = 2,
    present = 0
    };
getRow(2161,2,15)->
    #mallCfg {
    item_id = 2161,
    type = 2,
    sort = 15,
    type1 = 0,
    gold = 24,
    bind_gold = 0,
    use_integral = 0,
    get_integral = 0,
    limit_buy = 0,
    limit_type = 0,
    limit_day = 0,
    buy_reset = 0,
    level = 1,
    level_max = 210,
    recharge = 0,
    ishide = 1,
    showtype = 0,
    present = 1
    };
getRow(2161,4,12)->
    #mallCfg {
    item_id = 2161,
    type = 4,
    sort = 12,
    type1 = 0,
    gold = 0,
    bind_gold = 240,
    use_integral = 0,
    get_integral = 0,
    limit_buy = 0,
    limit_type = 0,
    limit_day = 0,
    buy_reset = 0,
    level = 1,
    level_max = 210,
    recharge = 0,
    ishide = 1,
    showtype = 2,
    present = 0
    };
getRow(2162,2,16)->
    #mallCfg {
    item_id = 2162,
    type = 2,
    sort = 16,
    type1 = 0,
    gold = 72,
    bind_gold = 0,
    use_integral = 0,
    get_integral = 0,
    limit_buy = 0,
    limit_type = 0,
    limit_day = 0,
    buy_reset = 0,
    level = 100,
    level_max = 210,
    recharge = 0,
    ishide = 1,
    showtype = 0,
    present = 1
    };
getRow(2162,4,13)->
    #mallCfg {
    item_id = 2162,
    type = 4,
    sort = 13,
    type1 = 0,
    gold = 0,
    bind_gold = 720,
    use_integral = 0,
    get_integral = 0,
    limit_buy = 0,
    limit_type = 0,
    limit_day = 0,
    buy_reset = 0,
    level = 1,
    level_max = 210,
    recharge = 0,
    ishide = 1,
    showtype = 2,
    present = 0
    };
getRow(2166,3,15)->
    #mallCfg {
    item_id = 2166,
    type = 3,
    sort = 15,
    type1 = 0,
    gold = 500,
    bind_gold = 0,
    use_integral = 0,
    get_integral = 0,
    limit_buy = 0,
    limit_type = 0,
    limit_day = 0,
    buy_reset = 0,
    level = 1,
    level_max = 210,
    recharge = 0,
    ishide = 1,
    showtype = 0,
    present = 1
    };
getRow(2167,3,4)->
    #mallCfg {
    item_id = 2167,
    type = 3,
    sort = 4,
    type1 = 0,
    gold = 5,
    bind_gold = 0,
    use_integral = 0,
    get_integral = 0,
    limit_buy = 0,
    limit_type = 3,
    limit_day = 5,
    buy_reset = 0,
    level = 30,
    level_max = 210,
    recharge = 0,
    ishide = 1,
    showtype = 0,
    present = 0
    };
getRow(2601,3,2)->
    #mallCfg {
    item_id = 2601,
    type = 3,
    sort = 2,
    type1 = 0,
    gold = 15,
    bind_gold = 0,
    use_integral = 0,
    get_integral = 0,
    limit_buy = 0,
    limit_type = 0,
    limit_day = 0,
    buy_reset = 0,
    level = 1,
    level_max = 210,
    recharge = 0,
    ishide = 1,
    showtype = 0,
    present = 1
    };
getRow(4100,3,17)->
    #mallCfg {
    item_id = 4100,
    type = 3,
    sort = 17,
    type1 = 0,
    gold = 20,
    bind_gold = 0,
    use_integral = 0,
    get_integral = 0,
    limit_buy = 0,
    limit_type = 0,
    limit_day = 0,
    buy_reset = 0,
    level = 1,
    level_max = 210,
    recharge = 0,
    ishide = 1,
    showtype = 0,
    present = 1
    };
getRow(4101,3,18)->
    #mallCfg {
    item_id = 4101,
    type = 3,
    sort = 18,
    type1 = 0,
    gold = 20,
    bind_gold = 0,
    use_integral = 0,
    get_integral = 0,
    limit_buy = 0,
    limit_type = 0,
    limit_day = 0,
    buy_reset = 0,
    level = 1,
    level_max = 210,
    recharge = 0,
    ishide = 1,
    showtype = 0,
    present = 1
    };
getRow(4200,4,14)->
    #mallCfg {
    item_id = 4200,
    type = 4,
    sort = 14,
    type1 = 0,
    gold = 0,
    bind_gold = 200,
    use_integral = 0,
    get_integral = 0,
    limit_buy = 0,
    limit_type = 0,
    limit_day = 0,
    buy_reset = 0,
    level = 1,
    level_max = 210,
    recharge = 0,
    ishide = 1,
    showtype = 2,
    present = 0
    };
getRow(4203,1,6)->
    #mallCfg {
    item_id = 4203,
    type = 1,
    sort = 6,
    type1 = 0,
    gold = 10,
    bind_gold = 0,
    use_integral = 0,
    get_integral = 0,
    limit_buy = 0,
    limit_type = 3,
    limit_day = 1,
    buy_reset = 0,
    level = 1,
    level_max = 210,
    recharge = 0,
    ishide = 1,
    showtype = 2,
    present = 0
    };
getRow(4203,3,3)->
    #mallCfg {
    item_id = 4203,
    type = 3,
    sort = 3,
    type1 = 0,
    gold = 100,
    bind_gold = 0,
    use_integral = 0,
    get_integral = 0,
    limit_buy = 0,
    limit_type = 0,
    limit_day = 0,
    buy_reset = 0,
    level = 1,
    level_max = 210,
    recharge = 0,
    ishide = 1,
    showtype = 0,
    present = 1
    };
getRow(4302,3,16)->
    #mallCfg {
    item_id = 4302,
    type = 3,
    sort = 16,
    type1 = 0,
    gold = 250,
    bind_gold = 0,
    use_integral = 0,
    get_integral = 0,
    limit_buy = 0,
    limit_type = 0,
    limit_day = 0,
    buy_reset = 0,
    level = 1,
    level_max = 210,
    recharge = 0,
    ishide = 1,
    showtype = 0,
    present = 1
    };
getRow(4306,3,13)->
    #mallCfg {
    item_id = 4306,
    type = 3,
    sort = 13,
    type1 = 0,
    gold = 50,
    bind_gold = 0,
    use_integral = 0,
    get_integral = 0,
    limit_buy = 0,
    limit_type = 0,
    limit_day = 0,
    buy_reset = 0,
    level = 1,
    level_max = 210,
    recharge = 0,
    ishide = 1,
    showtype = 0,
    present = 1
    };
getRow(5011,3,19)->
    #mallCfg {
    item_id = 5011,
    type = 3,
    sort = 19,
    type1 = 0,
    gold = 150,
    bind_gold = 0,
    use_integral = 0,
    get_integral = 0,
    limit_buy = 0,
    limit_type = 0,
    limit_day = 0,
    buy_reset = 0,
    level = 1,
    level_max = 210,
    recharge = 0,
    ishide = 1,
    showtype = 0,
    present = 1
    };
getRow(5012,3,20)->
    #mallCfg {
    item_id = 5012,
    type = 3,
    sort = 20,
    type1 = 0,
    gold = 150,
    bind_gold = 0,
    use_integral = 0,
    get_integral = 0,
    limit_buy = 0,
    limit_type = 0,
    limit_day = 0,
    buy_reset = 0,
    level = 1,
    level_max = 210,
    recharge = 0,
    ishide = 1,
    showtype = 0,
    present = 1
    };
getRow(5013,3,21)->
    #mallCfg {
    item_id = 5013,
    type = 3,
    sort = 21,
    type1 = 0,
    gold = 50,
    bind_gold = 0,
    use_integral = 0,
    get_integral = 0,
    limit_buy = 0,
    limit_type = 0,
    limit_day = 0,
    buy_reset = 0,
    level = 1,
    level_max = 210,
    recharge = 0,
    ishide = 1,
    showtype = 0,
    present = 1
    };
getRow(5014,3,22)->
    #mallCfg {
    item_id = 5014,
    type = 3,
    sort = 22,
    type1 = 0,
    gold = 30,
    bind_gold = 0,
    use_integral = 0,
    get_integral = 0,
    limit_buy = 0,
    limit_type = 0,
    limit_day = 0,
    buy_reset = 0,
    level = 1,
    level_max = 210,
    recharge = 0,
    ishide = 1,
    showtype = 0,
    present = 1
    };
getRow(5015,3,23)->
    #mallCfg {
    item_id = 5015,
    type = 3,
    sort = 23,
    type1 = 0,
    gold = 100,
    bind_gold = 0,
    use_integral = 0,
    get_integral = 0,
    limit_buy = 0,
    limit_type = 0,
    limit_day = 0,
    buy_reset = 0,
    level = 1,
    level_max = 210,
    recharge = 0,
    ishide = 1,
    showtype = 0,
    present = 1
    };
getRow(15215,2,2)->
    #mallCfg {
    item_id = 15215,
    type = 2,
    sort = 2,
    type1 = 0,
    gold = 80,
    bind_gold = 0,
    use_integral = 0,
    get_integral = 0,
    limit_buy = 0,
    limit_type = 0,
    limit_day = 0,
    buy_reset = 0,
    level = 1,
    level_max = 210,
    recharge = 0,
    ishide = 1,
    showtype = 0,
    present = 1
    };
getRow(15216,2,1)->
    #mallCfg {
    item_id = 15216,
    type = 2,
    sort = 1,
    type1 = 0,
    gold = 240,
    bind_gold = 0,
    use_integral = 0,
    get_integral = 0,
    limit_buy = 0,
    limit_type = 0,
    limit_day = 0,
    buy_reset = 0,
    level = 1,
    level_max = 210,
    recharge = 0,
    ishide = 1,
    showtype = 0,
    present = 1
    };
getRow(23000,3,5)->
    #mallCfg {
    item_id = 23000,
    type = 3,
    sort = 5,
    type1 = 0,
    gold = 10,
    bind_gold = 0,
    use_integral = 0,
    get_integral = 0,
    limit_buy = 0,
    limit_type = 0,
    limit_day = 0,
    buy_reset = 0,
    level = 1,
    level_max = 210,
    recharge = 0,
    ishide = 1,
    showtype = 0,
    present = 1
    };
getRow(23001,3,6)->
    #mallCfg {
    item_id = 23001,
    type = 3,
    sort = 6,
    type1 = 0,
    gold = 40,
    bind_gold = 0,
    use_integral = 0,
    get_integral = 0,
    limit_buy = 0,
    limit_type = 0,
    limit_day = 0,
    buy_reset = 0,
    level = 1,
    level_max = 210,
    recharge = 0,
    ishide = 1,
    showtype = 0,
    present = 1
    };
getRow(23002,1,3)->
    #mallCfg {
    item_id = 23002,
    type = 1,
    sort = 3,
    type1 = 0,
    gold = 30,
    bind_gold = 0,
    use_integral = 0,
    get_integral = 0,
    limit_buy = 10,
    limit_type = 1,
    limit_day = 0,
    buy_reset = 0,
    level = 1,
    level_max = 210,
    recharge = 0,
    ishide = 1,
    showtype = 2,
    present = 0
    };
getRow(23002,4,3)->
    #mallCfg {
    item_id = 23002,
    type = 4,
    sort = 3,
    type1 = 0,
    gold = 0,
    bind_gold = 400,
    use_integral = 0,
    get_integral = 0,
    limit_buy = 0,
    limit_type = 3,
    limit_day = 1,
    buy_reset = 0,
    level = 1,
    level_max = 210,
    recharge = 0,
    ishide = 1,
    showtype = 2,
    present = 0
    };
getRow(23100,4,2)->
    #mallCfg {
    item_id = 23100,
    type = 4,
    sort = 2,
    type1 = 0,
    gold = 0,
    bind_gold = 500,
    use_integral = 0,
    get_integral = 0,
    limit_buy = 0,
    limit_type = 3,
    limit_day = 2,
    buy_reset = 0,
    level = 100,
    level_max = 210,
    recharge = 0,
    ishide = 1,
    showtype = 2,
    present = 0
    };
getRow(23101,2,17)->
    #mallCfg {
    item_id = 23101,
    type = 2,
    sort = 17,
    type1 = 0,
    gold = 8,
    bind_gold = 0,
    use_integral = 0,
    get_integral = 0,
    limit_buy = 0,
    limit_type = 3,
    limit_day = 50,
    buy_reset = 0,
    level = 100,
    level_max = 210,
    recharge = 0,
    ishide = 1,
    showtype = 0,
    present = 0
    };
getRow(23108,2,18)->
    #mallCfg {
    item_id = 23108,
    type = 2,
    sort = 18,
    type1 = 0,
    gold = 50,
    bind_gold = 0,
    use_integral = 0,
    get_integral = 0,
    limit_buy = 0,
    limit_type = 3,
    limit_day = 1,
    buy_reset = 0,
    level = 100,
    level_max = 210,
    recharge = 0,
    ishide = 1,
    showtype = 0,
    present = 0
    };
getRow(23300,2,10)->
    #mallCfg {
    item_id = 23300,
    type = 2,
    sort = 10,
    type1 = 0,
    gold = 72,
    bind_gold = 0,
    use_integral = 0,
    get_integral = 0,
    limit_buy = 0,
    limit_type = 3,
    limit_day = 15,
    buy_reset = 0,
    level = 130,
    level_max = 210,
    recharge = 0,
    ishide = 1,
    showtype = 0,
    present = 0
    };
getRow(24705,5,1)->
    #mallCfg {
    item_id = 24705,
    type = 5,
    sort = 1,
    type1 = 0,
    gold = 480,
    bind_gold = 0,
    use_integral = 0,
    get_integral = 0,
    limit_buy = 0,
    limit_type = 0,
    limit_day = 0,
    buy_reset = 0,
    level = 1,
    level_max = 210,
    recharge = 0,
    ishide = 1,
    showtype = 2,
    present = 1
    };
getRow(24751,5,2)->
    #mallCfg {
    item_id = 24751,
    type = 5,
    sort = 2,
    type1 = 0,
    gold = 480,
    bind_gold = 0,
    use_integral = 0,
    get_integral = 0,
    limit_buy = 0,
    limit_type = 0,
    limit_day = 0,
    buy_reset = 0,
    level = 1,
    level_max = 210,
    recharge = 0,
    ishide = 1,
    showtype = 2,
    present = 1
    };
getRow(24787,1,4)->
    #mallCfg {
    item_id = 24787,
    type = 1,
    sort = 4,
    type1 = 0,
    gold = 20,
    bind_gold = 0,
    use_integral = 0,
    get_integral = 0,
    limit_buy = 2,
    limit_type = 1,
    limit_day = 0,
    buy_reset = 0,
    level = 1,
    level_max = 210,
    recharge = 0,
    ishide = 1,
    showtype = 2,
    present = 0
    };
getRow(24811,5,5)->
    #mallCfg {
    item_id = 24811,
    type = 5,
    sort = 5,
    type1 = 0,
    gold = 480,
    bind_gold = 0,
    use_integral = 0,
    get_integral = 0,
    limit_buy = 0,
    limit_type = 0,
    limit_day = 0,
    buy_reset = 0,
    level = 1,
    level_max = 210,
    recharge = 0,
    ishide = 1,
    showtype = 2,
    present = 1
    };
getRow(24812,5,6)->
    #mallCfg {
    item_id = 24812,
    type = 5,
    sort = 6,
    type1 = 0,
    gold = 480,
    bind_gold = 0,
    use_integral = 0,
    get_integral = 0,
    limit_buy = 0,
    limit_type = 0,
    limit_day = 0,
    buy_reset = 0,
    level = 1,
    level_max = 210,
    recharge = 0,
    ishide = 1,
    showtype = 2,
    present = 1
    };
getRow(24831,5,8)->
    #mallCfg {
    item_id = 24831,
    type = 5,
    sort = 8,
    type1 = 0,
    gold = 480,
    bind_gold = 0,
    use_integral = 0,
    get_integral = 0,
    limit_buy = 0,
    limit_type = 0,
    limit_day = 0,
    buy_reset = 0,
    level = 1,
    level_max = 210,
    recharge = 0,
    ishide = 1,
    showtype = 2,
    present = 1
    };
getRow(24841,5,4)->
    #mallCfg {
    item_id = 24841,
    type = 5,
    sort = 4,
    type1 = 0,
    gold = 480,
    bind_gold = 0,
    use_integral = 0,
    get_integral = 0,
    limit_buy = 0,
    limit_type = 0,
    limit_day = 0,
    buy_reset = 0,
    level = 1,
    level_max = 210,
    recharge = 0,
    ishide = 1,
    showtype = 2,
    present = 1
    };
getRow(24843,5,9)->
    #mallCfg {
    item_id = 24843,
    type = 5,
    sort = 9,
    type1 = 0,
    gold = 480,
    bind_gold = 0,
    use_integral = 0,
    get_integral = 0,
    limit_buy = 0,
    limit_type = 0,
    limit_day = 0,
    buy_reset = 0,
    level = 1,
    level_max = 210,
    recharge = 0,
    ishide = 1,
    showtype = 2,
    present = 1
    };
getRow(24845,5,7)->
    #mallCfg {
    item_id = 24845,
    type = 5,
    sort = 7,
    type1 = 0,
    gold = 480,
    bind_gold = 0,
    use_integral = 0,
    get_integral = 0,
    limit_buy = 0,
    limit_type = 0,
    limit_day = 0,
    buy_reset = 0,
    level = 1,
    level_max = 210,
    recharge = 0,
    ishide = 1,
    showtype = 2,
    present = 1
    };
getRow(24860,5,3)->
    #mallCfg {
    item_id = 24860,
    type = 5,
    sort = 3,
    type1 = 0,
    gold = 480,
    bind_gold = 0,
    use_integral = 0,
    get_integral = 0,
    limit_buy = 0,
    limit_type = 0,
    limit_day = 0,
    buy_reset = 0,
    level = 1,
    level_max = 210,
    recharge = 0,
    ishide = 1,
    showtype = 2,
    present = 1
    };
getRow(26001,4,1)->
    #mallCfg {
    item_id = 26001,
    type = 4,
    sort = 1,
    type1 = 0,
    gold = 0,
    bind_gold = 1500,
    use_integral = 0,
    get_integral = 0,
    limit_buy = 0,
    limit_type = 0,
    limit_day = 0,
    buy_reset = 0,
    level = 30,
    level_max = 210,
    recharge = 0,
    ishide = 1,
    showtype = 2,
    present = 0
    };
getRow(26002,3,7)->
    #mallCfg {
    item_id = 26002,
    type = 3,
    sort = 7,
    type1 = 0,
    gold = 1314,
    bind_gold = 0,
    use_integral = 0,
    get_integral = 0,
    limit_buy = 0,
    limit_type = 0,
    limit_day = 0,
    buy_reset = 0,
    level = 30,
    level_max = 210,
    recharge = 0,
    ishide = 1,
    showtype = 0,
    present = 1
    };
getRow(26204,3,8)->
    #mallCfg {
    item_id = 26204,
    type = 3,
    sort = 8,
    type1 = 0,
    gold = 3888,
    bind_gold = 0,
    use_integral = 0,
    get_integral = 0,
    limit_buy = 0,
    limit_type = 0,
    limit_day = 0,
    buy_reset = 0,
    level = 30,
    level_max = 210,
    recharge = 0,
    ishide = 1,
    showtype = 0,
    present = 1
    };
getRow(26205,1,5)->
    #mallCfg {
    item_id = 26205,
    type = 1,
    sort = 5,
    type1 = 0,
    gold = 5888,
    bind_gold = 0,
    use_integral = 0,
    get_integral = 0,
    limit_buy = 0,
    limit_type = 3,
    limit_day = 1,
    buy_reset = 0,
    level = 30,
    level_max = 210,
    recharge = 0,
    ishide = 1,
    showtype = 2,
    present = 0
    };
getRow(26246,3,9)->
    #mallCfg {
    item_id = 26246,
    type = 3,
    sort = 9,
    type1 = 0,
    gold = 10,
    bind_gold = 0,
    use_integral = 0,
    get_integral = 0,
    limit_buy = 0,
    limit_type = 0,
    limit_day = 0,
    buy_reset = 0,
    level = 30,
    level_max = 210,
    recharge = 0,
    ishide = 1,
    showtype = 0,
    present = 1
    };
getRow(29005,3,10)->
    #mallCfg {
    item_id = 29005,
    type = 3,
    sort = 10,
    type1 = 0,
    gold = 10,
    bind_gold = 0,
    use_integral = 0,
    get_integral = 0,
    limit_buy = 0,
    limit_type = 0,
    limit_day = 0,
    buy_reset = 0,
    level = 1,
    level_max = 210,
    recharge = 0,
    ishide = 1,
    showtype = 0,
    present = 1
    };
getRow(29006,3,11)->
    #mallCfg {
    item_id = 29006,
    type = 3,
    sort = 11,
    type1 = 0,
    gold = 30,
    bind_gold = 0,
    use_integral = 0,
    get_integral = 0,
    limit_buy = 0,
    limit_type = 0,
    limit_day = 0,
    buy_reset = 0,
    level = 1,
    level_max = 210,
    recharge = 0,
    ishide = 1,
    showtype = 0,
    present = 1
    };
getRow(29007,3,12)->
    #mallCfg {
    item_id = 29007,
    type = 3,
    sort = 12,
    type1 = 0,
    gold = 100,
    bind_gold = 0,
    use_integral = 0,
    get_integral = 0,
    limit_buy = 0,
    limit_type = 0,
    limit_day = 0,
    buy_reset = 0,
    level = 1,
    level_max = 210,
    recharge = 0,
    ishide = 1,
    showtype = 0,
    present = 1
    };
getRow(_,_,_)->[].

getKeyList()->[
    {202,2,11},
    {203,2,12},
    {204,2,13},
    {220,1,7},
    {220,1,8},
    {220,1,9},
    {222,2,3},
    {222,4,4},
    {223,2,4},
    {223,4,5},
    {224,2,5},
    {224,4,6},
    {230,1,10},
    {230,1,11},
    {230,1,12},
    {230,2,6},
    {230,4,7},
    {231,2,7},
    {231,4,8},
    {232,2,8},
    {232,4,9},
    {233,2,9},
    {233,4,10},
    {272,1,13},
    {607,1,2},
    {801,1,1},
    {802,1,15},
    {803,1,16},
    {804,1,14},
    {902,3,1},
    {1300,3,14},
    {2160,2,14},
    {2160,4,11},
    {2161,2,15},
    {2161,4,12},
    {2162,2,16},
    {2162,4,13},
    {2166,3,15},
    {2167,3,4},
    {2601,3,2},
    {4100,3,17},
    {4101,3,18},
    {4200,4,14},
    {4203,1,6},
    {4203,3,3},
    {4302,3,16},
    {4306,3,13},
    {5011,3,19},
    {5012,3,20},
    {5013,3,21},
    {5014,3,22},
    {5015,3,23},
    {15215,2,2},
    {15216,2,1},
    {23000,3,5},
    {23001,3,6},
    {23002,1,3},
    {23002,4,3},
    {23100,4,2},
    {23101,2,17},
    {23108,2,18},
    {23300,2,10},
    {24705,5,1},
    {24751,5,2},
    {24787,1,4},
    {24811,5,5},
    {24812,5,6},
    {24831,5,8},
    {24841,5,4},
    {24843,5,9},
    {24845,5,7},
    {24860,5,3},
    {26001,4,1},
    {26002,3,7},
    {26204,3,8},
    {26205,1,5},
    {26246,3,9},
    {29005,3,10},
    {29006,3,11},
    {29007,3,12}
    ].

get1KeyList()->[
    202,
    203,
    204,
    220,
    222,
    223,
    224,
    230,
    231,
    232,
    233,
    272,
    607,
    801,
    802,
    803,
    804,
    902,
    1300,
    2160,
    2161,
    2162,
    2166,
    2167,
    2601,
    4100,
    4101,
    4200,
    4203,
    4302,
    4306,
    5011,
    5012,
    5013,
    5014,
    5015,
    15215,
    15216,
    23000,
    23001,
    23002,
    23100,
    23101,
    23108,
    23300,
    24705,
    24751,
    24787,
    24811,
    24812,
    24831,
    24841,
    24843,
    24845,
    24860,
    26001,
    26002,
    26204,
    26205,
    26246,
    29005,
    29006,
    29007
    ].

get2KeyList(202)->[
    {2, 11}
    ];
get2KeyList(203)->[
    {2, 12}
    ];
get2KeyList(204)->[
    {2, 13}
    ];
get2KeyList(220)->[
    {1, 7},
    {1, 8},
    {1, 9}
    ];
get2KeyList(222)->[
    {2, 3},
    {4, 4}
    ];
get2KeyList(223)->[
    {2, 4},
    {4, 5}
    ];
get2KeyList(224)->[
    {2, 5},
    {4, 6}
    ];
get2KeyList(230)->[
    {1, 10},
    {1, 11},
    {1, 12},
    {2, 6},
    {4, 7}
    ];
get2KeyList(231)->[
    {2, 7},
    {4, 8}
    ];
get2KeyList(232)->[
    {2, 8},
    {4, 9}
    ];
get2KeyList(233)->[
    {2, 9},
    {4, 10}
    ];
get2KeyList(272)->[
    {1, 13}
    ];
get2KeyList(607)->[
    {1, 2}
    ];
get2KeyList(801)->[
    {1, 1}
    ];
get2KeyList(802)->[
    {1, 15}
    ];
get2KeyList(803)->[
    {1, 16}
    ];
get2KeyList(804)->[
    {1, 14}
    ];
get2KeyList(902)->[
    {3, 1}
    ];
get2KeyList(1300)->[
    {3, 14}
    ];
get2KeyList(2160)->[
    {2, 14},
    {4, 11}
    ];
get2KeyList(2161)->[
    {2, 15},
    {4, 12}
    ];
get2KeyList(2162)->[
    {2, 16},
    {4, 13}
    ];
get2KeyList(2166)->[
    {3, 15}
    ];
get2KeyList(2167)->[
    {3, 4}
    ];
get2KeyList(2601)->[
    {3, 2}
    ];
get2KeyList(4100)->[
    {3, 17}
    ];
get2KeyList(4101)->[
    {3, 18}
    ];
get2KeyList(4200)->[
    {4, 14}
    ];
get2KeyList(4203)->[
    {1, 6},
    {3, 3}
    ];
get2KeyList(4302)->[
    {3, 16}
    ];
get2KeyList(4306)->[
    {3, 13}
    ];
get2KeyList(5011)->[
    {3, 19}
    ];
get2KeyList(5012)->[
    {3, 20}
    ];
get2KeyList(5013)->[
    {3, 21}
    ];
get2KeyList(5014)->[
    {3, 22}
    ];
get2KeyList(5015)->[
    {3, 23}
    ];
get2KeyList(15215)->[
    {2, 2}
    ];
get2KeyList(15216)->[
    {2, 1}
    ];
get2KeyList(23000)->[
    {3, 5}
    ];
get2KeyList(23001)->[
    {3, 6}
    ];
get2KeyList(23002)->[
    {1, 3},
    {4, 3}
    ];
get2KeyList(23100)->[
    {4, 2}
    ];
get2KeyList(23101)->[
    {2, 17}
    ];
get2KeyList(23108)->[
    {2, 18}
    ];
get2KeyList(23300)->[
    {2, 10}
    ];
get2KeyList(24705)->[
    {5, 1}
    ];
get2KeyList(24751)->[
    {5, 2}
    ];
get2KeyList(24787)->[
    {1, 4}
    ];
get2KeyList(24811)->[
    {5, 5}
    ];
get2KeyList(24812)->[
    {5, 6}
    ];
get2KeyList(24831)->[
    {5, 8}
    ];
get2KeyList(24841)->[
    {5, 4}
    ];
get2KeyList(24843)->[
    {5, 9}
    ];
get2KeyList(24845)->[
    {5, 7}
    ];
get2KeyList(24860)->[
    {5, 3}
    ];
get2KeyList(26001)->[
    {4, 1}
    ];
get2KeyList(26002)->[
    {3, 7}
    ];
get2KeyList(26204)->[
    {3, 8}
    ];
get2KeyList(26205)->[
    {1, 5}
    ];
get2KeyList(26246)->[
    {3, 9}
    ];
get2KeyList(29005)->[
    {3, 10}
    ];
get2KeyList(29006)->[
    {3, 11}
    ];
get2KeyList(29007)->[
    {3, 12}
    ];
get2KeyList(_)->[].

get3KeyList(202,2)->[
    11
    ];
get3KeyList(203,2)->[
    12
    ];
get3KeyList(204,2)->[
    13
    ];
get3KeyList(220,1)->[
    7,
    8,
    9
    ];
get3KeyList(222,2)->[
    3
    ];
get3KeyList(222,4)->[
    4
    ];
get3KeyList(223,2)->[
    4
    ];
get3KeyList(223,4)->[
    5
    ];
get3KeyList(224,2)->[
    5
    ];
get3KeyList(224,4)->[
    6
    ];
get3KeyList(230,1)->[
    10,
    11,
    12
    ];
get3KeyList(230,2)->[
    6
    ];
get3KeyList(230,4)->[
    7
    ];
get3KeyList(231,2)->[
    7
    ];
get3KeyList(231,4)->[
    8
    ];
get3KeyList(232,2)->[
    8
    ];
get3KeyList(232,4)->[
    9
    ];
get3KeyList(233,2)->[
    9
    ];
get3KeyList(233,4)->[
    10
    ];
get3KeyList(272,1)->[
    13
    ];
get3KeyList(607,1)->[
    2
    ];
get3KeyList(801,1)->[
    1
    ];
get3KeyList(802,1)->[
    15
    ];
get3KeyList(803,1)->[
    16
    ];
get3KeyList(804,1)->[
    14
    ];
get3KeyList(902,3)->[
    1
    ];
get3KeyList(1300,3)->[
    14
    ];
get3KeyList(2160,2)->[
    14
    ];
get3KeyList(2160,4)->[
    11
    ];
get3KeyList(2161,2)->[
    15
    ];
get3KeyList(2161,4)->[
    12
    ];
get3KeyList(2162,2)->[
    16
    ];
get3KeyList(2162,4)->[
    13
    ];
get3KeyList(2166,3)->[
    15
    ];
get3KeyList(2167,3)->[
    4
    ];
get3KeyList(2601,3)->[
    2
    ];
get3KeyList(4100,3)->[
    17
    ];
get3KeyList(4101,3)->[
    18
    ];
get3KeyList(4200,4)->[
    14
    ];
get3KeyList(4203,1)->[
    6
    ];
get3KeyList(4203,3)->[
    3
    ];
get3KeyList(4302,3)->[
    16
    ];
get3KeyList(4306,3)->[
    13
    ];
get3KeyList(5011,3)->[
    19
    ];
get3KeyList(5012,3)->[
    20
    ];
get3KeyList(5013,3)->[
    21
    ];
get3KeyList(5014,3)->[
    22
    ];
get3KeyList(5015,3)->[
    23
    ];
get3KeyList(15215,2)->[
    2
    ];
get3KeyList(15216,2)->[
    1
    ];
get3KeyList(23000,3)->[
    5
    ];
get3KeyList(23001,3)->[
    6
    ];
get3KeyList(23002,1)->[
    3
    ];
get3KeyList(23002,4)->[
    3
    ];
get3KeyList(23100,4)->[
    2
    ];
get3KeyList(23101,2)->[
    17
    ];
get3KeyList(23108,2)->[
    18
    ];
get3KeyList(23300,2)->[
    10
    ];
get3KeyList(24705,5)->[
    1
    ];
get3KeyList(24751,5)->[
    2
    ];
get3KeyList(24787,1)->[
    4
    ];
get3KeyList(24811,5)->[
    5
    ];
get3KeyList(24812,5)->[
    6
    ];
get3KeyList(24831,5)->[
    8
    ];
get3KeyList(24841,5)->[
    4
    ];
get3KeyList(24843,5)->[
    9
    ];
get3KeyList(24845,5)->[
    7
    ];
get3KeyList(24860,5)->[
    3
    ];
get3KeyList(26001,4)->[
    1
    ];
get3KeyList(26002,3)->[
    7
    ];
get3KeyList(26204,3)->[
    8
    ];
get3KeyList(26205,1)->[
    5
    ];
get3KeyList(26246,3)->[
    9
    ];
get3KeyList(29005,3)->[
    10
    ];
get3KeyList(29006,3)->[
    11
    ];
get3KeyList(29007,3)->[
    12
    ];
get3KeyList(_,_)->[].

