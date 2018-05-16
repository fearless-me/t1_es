%% coding: latin-1
%%: 实现
-module(cfg_mall_cht).
-compile(export_all).
-include("cfg_mall.hrl").
-include("logger.hrl").

getRow(150,3,15)->
    #mallCfg {
    item_id = 150,
    type = 3,
    sort = 15,
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
    level_max = 105,
    recharge = 0,
    ishide = 1,
    showtype = 2,
    present = 1
    };
getRow(151,3,16)->
    #mallCfg {
    item_id = 151,
    type = 3,
    sort = 16,
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
    level_max = 105,
    recharge = 0,
    ishide = 1,
    showtype = 2,
    present = 1
    };
getRow(152,3,17)->
    #mallCfg {
    item_id = 152,
    type = 3,
    sort = 17,
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
    level_max = 105,
    recharge = 0,
    ishide = 1,
    showtype = 2,
    present = 1
    };
getRow(153,3,18)->
    #mallCfg {
    item_id = 153,
    type = 3,
    sort = 18,
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
    level_max = 105,
    recharge = 0,
    ishide = 1,
    showtype = 2,
    present = 1
    };
getRow(154,3,19)->
    #mallCfg {
    item_id = 154,
    type = 3,
    sort = 19,
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
    level_max = 105,
    recharge = 0,
    ishide = 1,
    showtype = 2,
    present = 1
    };
getRow(201,1,16)->
    #mallCfg {
    item_id = 201,
    type = 1,
    sort = 16,
    type1 = 0,
    gold = 12,
    bind_gold = 0,
    use_integral = 0,
    get_integral = 0,
    limit_buy = 0,
    limit_type = 3,
    limit_day = 5,
    buy_reset = 0,
    level = 1,
    level_max = 105,
    recharge = 0,
    ishide = 1,
    showtype = 2,
    present = 0
    };
getRow(201,2,19)->
    #mallCfg {
    item_id = 201,
    type = 2,
    sort = 19,
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
    level_max = 105,
    recharge = 0,
    ishide = 1,
    showtype = 0,
    present = 1
    };
getRow(202,2,13)->
    #mallCfg {
    item_id = 202,
    type = 2,
    sort = 13,
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
    level_max = 105,
    recharge = 0,
    ishide = 1,
    showtype = 0,
    present = 1
    };
getRow(202,4,11)->
    #mallCfg {
    item_id = 202,
    type = 4,
    sort = 11,
    type1 = 0,
    gold = 12,
    bind_gold = 12,
    use_integral = 0,
    get_integral = 0,
    limit_buy = 0,
    limit_type = 0,
    limit_day = 0,
    buy_reset = 0,
    level = 1,
    level_max = 105,
    recharge = 0,
    ishide = 1,
    showtype = 2,
    present = 0
    };
getRow(203,2,14)->
    #mallCfg {
    item_id = 203,
    type = 2,
    sort = 14,
    type1 = 0,
    gold = 60,
    bind_gold = 0,
    use_integral = 0,
    get_integral = 0,
    limit_buy = 0,
    limit_type = 0,
    limit_day = 0,
    buy_reset = 0,
    level = 1,
    level_max = 105,
    recharge = 0,
    ishide = 1,
    showtype = 0,
    present = 1
    };
getRow(203,4,12)->
    #mallCfg {
    item_id = 203,
    type = 4,
    sort = 12,
    type1 = 0,
    gold = 60,
    bind_gold = 60,
    use_integral = 0,
    get_integral = 0,
    limit_buy = 0,
    limit_type = 0,
    limit_day = 0,
    buy_reset = 0,
    level = 1,
    level_max = 105,
    recharge = 0,
    ishide = 1,
    showtype = 2,
    present = 0
    };
getRow(204,2,15)->
    #mallCfg {
    item_id = 204,
    type = 2,
    sort = 15,
    type1 = 0,
    gold = 240,
    bind_gold = 0,
    use_integral = 0,
    get_integral = 0,
    limit_buy = 0,
    limit_type = 0,
    limit_day = 0,
    buy_reset = 0,
    level = 30,
    level_max = 105,
    recharge = 0,
    ishide = 1,
    showtype = 0,
    present = 1
    };
getRow(204,4,13)->
    #mallCfg {
    item_id = 204,
    type = 4,
    sort = 13,
    type1 = 0,
    gold = 240,
    bind_gold = 240,
    use_integral = 0,
    get_integral = 0,
    limit_buy = 0,
    limit_type = 0,
    limit_day = 0,
    buy_reset = 0,
    level = 30,
    level_max = 105,
    recharge = 0,
    ishide = 1,
    showtype = 2,
    present = 0
    };
getRow(222,1,1)->
    #mallCfg {
    item_id = 222,
    type = 1,
    sort = 1,
    type1 = 0,
    gold = 24,
    bind_gold = 0,
    use_integral = 0,
    get_integral = 0,
    limit_buy = 0,
    limit_type = 3,
    limit_day = 5,
    buy_reset = 0,
    level = 1,
    level_max = 39,
    recharge = 0,
    ishide = 1,
    showtype = 2,
    present = 0
    };
getRow(222,1,2)->
    #mallCfg {
    item_id = 222,
    type = 1,
    sort = 2,
    type1 = 0,
    gold = 24,
    bind_gold = 0,
    use_integral = 0,
    get_integral = 0,
    limit_buy = 0,
    limit_type = 3,
    limit_day = 10,
    buy_reset = 0,
    level = 40,
    level_max = 69,
    recharge = 0,
    ishide = 1,
    showtype = 2,
    present = 0
    };
getRow(222,1,3)->
    #mallCfg {
    item_id = 222,
    type = 1,
    sort = 3,
    type1 = 0,
    gold = 24,
    bind_gold = 0,
    use_integral = 0,
    get_integral = 0,
    limit_buy = 0,
    limit_type = 3,
    limit_day = 20,
    buy_reset = 0,
    level = 70,
    level_max = 105,
    recharge = 0,
    ishide = 1,
    showtype = 2,
    present = 0
    };
getRow(222,2,1)->
    #mallCfg {
    item_id = 222,
    type = 2,
    sort = 1,
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
    level_max = 105,
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
    gold = 40,
    bind_gold = 40,
    use_integral = 0,
    get_integral = 0,
    limit_buy = 0,
    limit_type = 0,
    limit_day = 0,
    buy_reset = 0,
    level = 1,
    level_max = 105,
    recharge = 0,
    ishide = 1,
    showtype = 2,
    present = 0
    };
getRow(223,1,4)->
    #mallCfg {
    item_id = 223,
    type = 1,
    sort = 4,
    type1 = 0,
    gold = 7,
    bind_gold = 0,
    use_integral = 0,
    get_integral = 0,
    limit_buy = 0,
    limit_type = 3,
    limit_day = 5,
    buy_reset = 0,
    level = 1,
    level_max = 39,
    recharge = 0,
    ishide = 1,
    showtype = 2,
    present = 0
    };
getRow(223,1,5)->
    #mallCfg {
    item_id = 223,
    type = 1,
    sort = 5,
    type1 = 0,
    gold = 7,
    bind_gold = 0,
    use_integral = 0,
    get_integral = 0,
    limit_buy = 0,
    limit_type = 3,
    limit_day = 10,
    buy_reset = 0,
    level = 40,
    level_max = 69,
    recharge = 0,
    ishide = 1,
    showtype = 2,
    present = 0
    };
getRow(223,1,6)->
    #mallCfg {
    item_id = 223,
    type = 1,
    sort = 6,
    type1 = 0,
    gold = 7,
    bind_gold = 0,
    use_integral = 0,
    get_integral = 0,
    limit_buy = 0,
    limit_type = 3,
    limit_day = 20,
    buy_reset = 0,
    level = 70,
    level_max = 105,
    recharge = 0,
    ishide = 1,
    showtype = 2,
    present = 0
    };
getRow(223,2,2)->
    #mallCfg {
    item_id = 223,
    type = 2,
    sort = 2,
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
    level_max = 105,
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
    gold = 12,
    bind_gold = 12,
    use_integral = 0,
    get_integral = 0,
    limit_buy = 0,
    limit_type = 0,
    limit_day = 0,
    buy_reset = 0,
    level = 1,
    level_max = 105,
    recharge = 0,
    ishide = 1,
    showtype = 2,
    present = 0
    };
getRow(224,1,7)->
    #mallCfg {
    item_id = 224,
    type = 1,
    sort = 7,
    type1 = 0,
    gold = 9,
    bind_gold = 0,
    use_integral = 0,
    get_integral = 0,
    limit_buy = 0,
    limit_type = 3,
    limit_day = 5,
    buy_reset = 0,
    level = 1,
    level_max = 39,
    recharge = 0,
    ishide = 1,
    showtype = 2,
    present = 0
    };
getRow(224,1,8)->
    #mallCfg {
    item_id = 224,
    type = 1,
    sort = 8,
    type1 = 0,
    gold = 9,
    bind_gold = 0,
    use_integral = 0,
    get_integral = 0,
    limit_buy = 0,
    limit_type = 3,
    limit_day = 10,
    buy_reset = 0,
    level = 40,
    level_max = 69,
    recharge = 0,
    ishide = 1,
    showtype = 2,
    present = 0
    };
getRow(224,1,9)->
    #mallCfg {
    item_id = 224,
    type = 1,
    sort = 9,
    type1 = 0,
    gold = 9,
    bind_gold = 0,
    use_integral = 0,
    get_integral = 0,
    limit_buy = 0,
    limit_type = 3,
    limit_day = 20,
    buy_reset = 0,
    level = 70,
    level_max = 105,
    recharge = 0,
    ishide = 1,
    showtype = 2,
    present = 0
    };
getRow(224,2,3)->
    #mallCfg {
    item_id = 224,
    type = 2,
    sort = 3,
    type1 = 0,
    gold = 16,
    bind_gold = 0,
    use_integral = 0,
    get_integral = 0,
    limit_buy = 0,
    limit_type = 0,
    limit_day = 0,
    buy_reset = 0,
    level = 1,
    level_max = 105,
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
    gold = 16,
    bind_gold = 16,
    use_integral = 0,
    get_integral = 0,
    limit_buy = 0,
    limit_type = 0,
    limit_day = 0,
    buy_reset = 0,
    level = 1,
    level_max = 105,
    recharge = 0,
    ishide = 1,
    showtype = 2,
    present = 0
    };
getRow(226,2,4)->
    #mallCfg {
    item_id = 226,
    type = 2,
    sort = 4,
    type1 = 0,
    gold = 737,
    bind_gold = 0,
    use_integral = 0,
    get_integral = 0,
    limit_buy = 0,
    limit_type = 0,
    limit_day = 0,
    buy_reset = 0,
    level = 30,
    level_max = 105,
    recharge = 0,
    ishide = 1,
    showtype = 0,
    present = 1
    };
getRow(230,1,10)->
    #mallCfg {
    item_id = 230,
    type = 1,
    sort = 10,
    type1 = 0,
    gold = 30,
    bind_gold = 0,
    use_integral = 0,
    get_integral = 0,
    limit_buy = 0,
    limit_type = 3,
    limit_day = 4,
    buy_reset = 0,
    level = 1,
    level_max = 39,
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
    gold = 30,
    bind_gold = 0,
    use_integral = 0,
    get_integral = 0,
    limit_buy = 0,
    limit_type = 3,
    limit_day = 12,
    buy_reset = 0,
    level = 40,
    level_max = 69,
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
    gold = 30,
    bind_gold = 0,
    use_integral = 0,
    get_integral = 0,
    limit_buy = 0,
    limit_type = 3,
    limit_day = 16,
    buy_reset = 0,
    level = 70,
    level_max = 105,
    recharge = 0,
    ishide = 1,
    showtype = 2,
    present = 0
    };
getRow(230,2,5)->
    #mallCfg {
    item_id = 230,
    type = 2,
    sort = 5,
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
    level_max = 105,
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
    gold = 50,
    bind_gold = 50,
    use_integral = 0,
    get_integral = 0,
    limit_buy = 0,
    limit_type = 0,
    limit_day = 0,
    buy_reset = 0,
    level = 1,
    level_max = 105,
    recharge = 0,
    ishide = 1,
    showtype = 2,
    present = 0
    };
getRow(231,2,6)->
    #mallCfg {
    item_id = 231,
    type = 2,
    sort = 6,
    type1 = 0,
    gold = 100,
    bind_gold = 0,
    use_integral = 0,
    get_integral = 0,
    limit_buy = 0,
    limit_type = 0,
    limit_day = 0,
    buy_reset = 0,
    level = 30,
    level_max = 105,
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
    gold = 100,
    bind_gold = 100,
    use_integral = 0,
    get_integral = 0,
    limit_buy = 0,
    limit_type = 0,
    limit_day = 0,
    buy_reset = 0,
    level = 1,
    level_max = 105,
    recharge = 0,
    ishide = 1,
    showtype = 2,
    present = 0
    };
getRow(232,2,7)->
    #mallCfg {
    item_id = 232,
    type = 2,
    sort = 7,
    type1 = 0,
    gold = 200,
    bind_gold = 0,
    use_integral = 0,
    get_integral = 0,
    limit_buy = 0,
    limit_type = 0,
    limit_day = 0,
    buy_reset = 0,
    level = 45,
    level_max = 105,
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
    gold = 200,
    bind_gold = 200,
    use_integral = 0,
    get_integral = 0,
    limit_buy = 0,
    limit_type = 0,
    limit_day = 0,
    buy_reset = 0,
    level = 1,
    level_max = 105,
    recharge = 0,
    ishide = 1,
    showtype = 2,
    present = 0
    };
getRow(233,2,8)->
    #mallCfg {
    item_id = 233,
    type = 2,
    sort = 8,
    type1 = 0,
    gold = 400,
    bind_gold = 0,
    use_integral = 0,
    get_integral = 0,
    limit_buy = 0,
    limit_type = 0,
    limit_day = 0,
    buy_reset = 0,
    level = 60,
    level_max = 105,
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
    gold = 400,
    bind_gold = 400,
    use_integral = 0,
    get_integral = 0,
    limit_buy = 0,
    limit_type = 0,
    limit_day = 0,
    buy_reset = 0,
    level = 1,
    level_max = 105,
    recharge = 0,
    ishide = 1,
    showtype = 2,
    present = 0
    };
getRow(241,1,13)->
    #mallCfg {
    item_id = 241,
    type = 1,
    sort = 13,
    type1 = 0,
    gold = 80,
    bind_gold = 0,
    use_integral = 0,
    get_integral = 0,
    limit_buy = 0,
    limit_type = 3,
    limit_day = 8,
    buy_reset = 0,
    level = 30,
    level_max = 49,
    recharge = 0,
    ishide = 1,
    showtype = 2,
    present = 0
    };
getRow(241,1,14)->
    #mallCfg {
    item_id = 241,
    type = 1,
    sort = 14,
    type1 = 0,
    gold = 80,
    bind_gold = 0,
    use_integral = 0,
    get_integral = 0,
    limit_buy = 0,
    limit_type = 3,
    limit_day = 30,
    buy_reset = 0,
    level = 50,
    level_max = 69,
    recharge = 0,
    ishide = 1,
    showtype = 2,
    present = 0
    };
getRow(241,1,15)->
    #mallCfg {
    item_id = 241,
    type = 1,
    sort = 15,
    type1 = 0,
    gold = 80,
    bind_gold = 0,
    use_integral = 0,
    get_integral = 0,
    limit_buy = 0,
    limit_type = 3,
    limit_day = 50,
    buy_reset = 0,
    level = 70,
    level_max = 105,
    recharge = 0,
    ishide = 1,
    showtype = 2,
    present = 0
    };
getRow(251,2,9)->
    #mallCfg {
    item_id = 251,
    type = 2,
    sort = 9,
    type1 = 0,
    gold = 25,
    bind_gold = 0,
    use_integral = 0,
    get_integral = 0,
    limit_buy = 0,
    limit_type = 0,
    limit_day = 0,
    buy_reset = 0,
    level = 35,
    level_max = 105,
    recharge = 0,
    ishide = 1,
    showtype = 0,
    present = 1
    };
getRow(252,2,10)->
    #mallCfg {
    item_id = 252,
    type = 2,
    sort = 10,
    type1 = 0,
    gold = 25,
    bind_gold = 0,
    use_integral = 0,
    get_integral = 0,
    limit_buy = 0,
    limit_type = 0,
    limit_day = 0,
    buy_reset = 0,
    level = 35,
    level_max = 105,
    recharge = 0,
    ishide = 1,
    showtype = 0,
    present = 1
    };
getRow(253,2,11)->
    #mallCfg {
    item_id = 253,
    type = 2,
    sort = 11,
    type1 = 0,
    gold = 75,
    bind_gold = 0,
    use_integral = 0,
    get_integral = 0,
    limit_buy = 0,
    limit_type = 0,
    limit_day = 0,
    buy_reset = 0,
    level = 40,
    level_max = 105,
    recharge = 0,
    ishide = 1,
    showtype = 0,
    present = 1
    };
getRow(254,2,12)->
    #mallCfg {
    item_id = 254,
    type = 2,
    sort = 12,
    type1 = 0,
    gold = 75,
    bind_gold = 0,
    use_integral = 0,
    get_integral = 0,
    limit_buy = 0,
    limit_type = 0,
    limit_day = 0,
    buy_reset = 0,
    level = 40,
    level_max = 105,
    recharge = 0,
    ishide = 1,
    showtype = 0,
    present = 1
    };
getRow(272,1,18)->
    #mallCfg {
    item_id = 272,
    type = 1,
    sort = 18,
    type1 = 0,
    gold = 144,
    bind_gold = 0,
    use_integral = 0,
    get_integral = 0,
    limit_buy = 0,
    limit_type = 3,
    limit_day = 1,
    buy_reset = 0,
    level = 40,
    level_max = 105,
    recharge = 0,
    ishide = 1,
    showtype = 2,
    present = 0
    };
getRow(273,1,19)->
    #mallCfg {
    item_id = 273,
    type = 1,
    sort = 19,
    type1 = 0,
    gold = 288,
    bind_gold = 0,
    use_integral = 0,
    get_integral = 0,
    limit_buy = 0,
    limit_type = 3,
    limit_day = 1,
    buy_reset = 0,
    level = 55,
    level_max = 105,
    recharge = 0,
    ishide = 1,
    showtype = 2,
    present = 0
    };
getRow(274,1,20)->
    #mallCfg {
    item_id = 274,
    type = 1,
    sort = 20,
    type1 = 0,
    gold = 576,
    bind_gold = 0,
    use_integral = 0,
    get_integral = 0,
    limit_buy = 0,
    limit_type = 3,
    limit_day = 1,
    buy_reset = 0,
    level = 70,
    level_max = 105,
    recharge = 0,
    ishide = 1,
    showtype = 2,
    present = 0
    };
getRow(2160,2,16)->
    #mallCfg {
    item_id = 2160,
    type = 2,
    sort = 16,
    type1 = 0,
    gold = 25,
    bind_gold = 0,
    use_integral = 0,
    get_integral = 0,
    limit_buy = 0,
    limit_type = 0,
    limit_day = 0,
    buy_reset = 0,
    level = 1,
    level_max = 105,
    recharge = 0,
    ishide = 1,
    showtype = 0,
    present = 1
    };
getRow(2160,4,14)->
    #mallCfg {
    item_id = 2160,
    type = 4,
    sort = 14,
    type1 = 0,
    gold = 25,
    bind_gold = 25,
    use_integral = 0,
    get_integral = 0,
    limit_buy = 0,
    limit_type = 0,
    limit_day = 0,
    buy_reset = 0,
    level = 1,
    level_max = 105,
    recharge = 0,
    ishide = 1,
    showtype = 2,
    present = 0
    };
getRow(2161,2,17)->
    #mallCfg {
    item_id = 2161,
    type = 2,
    sort = 17,
    type1 = 0,
    gold = 75,
    bind_gold = 0,
    use_integral = 0,
    get_integral = 0,
    limit_buy = 0,
    limit_type = 0,
    limit_day = 0,
    buy_reset = 0,
    level = 1,
    level_max = 105,
    recharge = 0,
    ishide = 1,
    showtype = 0,
    present = 1
    };
getRow(2161,4,15)->
    #mallCfg {
    item_id = 2161,
    type = 4,
    sort = 15,
    type1 = 0,
    gold = 75,
    bind_gold = 75,
    use_integral = 0,
    get_integral = 0,
    limit_buy = 0,
    limit_type = 0,
    limit_day = 0,
    buy_reset = 0,
    level = 1,
    level_max = 105,
    recharge = 0,
    ishide = 1,
    showtype = 2,
    present = 0
    };
getRow(2162,2,18)->
    #mallCfg {
    item_id = 2162,
    type = 2,
    sort = 18,
    type1 = 0,
    gold = 225,
    bind_gold = 0,
    use_integral = 0,
    get_integral = 0,
    limit_buy = 0,
    limit_type = 0,
    limit_day = 0,
    buy_reset = 0,
    level = 50,
    level_max = 105,
    recharge = 0,
    ishide = 1,
    showtype = 0,
    present = 1
    };
getRow(2162,4,16)->
    #mallCfg {
    item_id = 2162,
    type = 4,
    sort = 16,
    type1 = 0,
    gold = 225,
    bind_gold = 225,
    use_integral = 0,
    get_integral = 0,
    limit_buy = 0,
    limit_type = 0,
    limit_day = 0,
    buy_reset = 0,
    level = 50,
    level_max = 105,
    recharge = 0,
    ishide = 1,
    showtype = 2,
    present = 0
    };
getRow(2601,3,3)->
    #mallCfg {
    item_id = 2601,
    type = 3,
    sort = 3,
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
    level_max = 105,
    recharge = 0,
    ishide = 1,
    showtype = 0,
    present = 1
    };
getRow(2601,4,2)->
    #mallCfg {
    item_id = 2601,
    type = 4,
    sort = 2,
    type1 = 0,
    gold = 120,
    bind_gold = 120,
    use_integral = 0,
    get_integral = 0,
    limit_buy = 0,
    limit_type = 0,
    limit_day = 0,
    buy_reset = 0,
    level = 1,
    level_max = 105,
    recharge = 0,
    ishide = 1,
    showtype = 2,
    present = 0
    };
getRow(4100,3,13)->
    #mallCfg {
    item_id = 4100,
    type = 3,
    sort = 13,
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
    level_max = 105,
    recharge = 0,
    ishide = 1,
    showtype = 2,
    present = 1
    };
getRow(4100,4,19)->
    #mallCfg {
    item_id = 4100,
    type = 4,
    sort = 19,
    type1 = 0,
    gold = 10,
    bind_gold = 10,
    use_integral = 0,
    get_integral = 0,
    limit_buy = 0,
    limit_type = 0,
    limit_day = 0,
    buy_reset = 0,
    level = 1,
    level_max = 105,
    recharge = 0,
    ishide = 1,
    showtype = 2,
    present = 0
    };
getRow(4101,3,14)->
    #mallCfg {
    item_id = 4101,
    type = 3,
    sort = 14,
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
    level_max = 105,
    recharge = 0,
    ishide = 1,
    showtype = 2,
    present = 1
    };
getRow(4101,4,20)->
    #mallCfg {
    item_id = 4101,
    type = 4,
    sort = 20,
    type1 = 0,
    gold = 10,
    bind_gold = 10,
    use_integral = 0,
    get_integral = 0,
    limit_buy = 0,
    limit_type = 0,
    limit_day = 0,
    buy_reset = 0,
    level = 1,
    level_max = 105,
    recharge = 0,
    ishide = 1,
    showtype = 2,
    present = 0
    };
getRow(4200,4,1)->
    #mallCfg {
    item_id = 4200,
    type = 4,
    sort = 1,
    type1 = 0,
    gold = 40,
    bind_gold = 40,
    use_integral = 0,
    get_integral = 0,
    limit_buy = 0,
    limit_type = 0,
    limit_day = 0,
    buy_reset = 0,
    level = 1,
    level_max = 105,
    recharge = 0,
    ishide = 1,
    showtype = 2,
    present = 0
    };
getRow(4203,3,2)->
    #mallCfg {
    item_id = 4203,
    type = 3,
    sort = 2,
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
    level_max = 105,
    recharge = 0,
    ishide = 1,
    showtype = 0,
    present = 1
    };
getRow(4302,3,12)->
    #mallCfg {
    item_id = 4302,
    type = 3,
    sort = 12,
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
    level_max = 105,
    recharge = 0,
    ishide = 1,
    showtype = 2,
    present = 1
    };
getRow(4306,3,1)->
    #mallCfg {
    item_id = 4306,
    type = 3,
    sort = 1,
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
    level_max = 105,
    recharge = 0,
    ishide = 1,
    showtype = 0,
    present = 1
    };
getRow(6000,4,18)->
    #mallCfg {
    item_id = 6000,
    type = 4,
    sort = 18,
    type1 = 0,
    gold = 30,
    bind_gold = 30,
    use_integral = 0,
    get_integral = 0,
    limit_buy = 0,
    limit_type = 0,
    limit_day = 0,
    buy_reset = 0,
    level = 1,
    level_max = 105,
    recharge = 0,
    ishide = 1,
    showtype = 2,
    present = 0
    };
getRow(23000,3,4)->
    #mallCfg {
    item_id = 23000,
    type = 3,
    sort = 4,
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
    level_max = 105,
    recharge = 0,
    ishide = 1,
    showtype = 2,
    present = 1
    };
getRow(23001,3,5)->
    #mallCfg {
    item_id = 23001,
    type = 3,
    sort = 5,
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
    level_max = 105,
    recharge = 0,
    ishide = 1,
    showtype = 2,
    present = 1
    };
getRow(23002,1,17)->
    #mallCfg {
    item_id = 23002,
    type = 1,
    sort = 17,
    type1 = 0,
    gold = 42,
    bind_gold = 0,
    use_integral = 0,
    get_integral = 0,
    limit_buy = 0,
    limit_type = 3,
    limit_day = 3,
    buy_reset = 0,
    level = 1,
    level_max = 105,
    recharge = 0,
    ishide = 1,
    showtype = 2,
    present = 0
    };
getRow(24102,1,21)->
    #mallCfg {
    item_id = 24102,
    type = 1,
    sort = 21,
    type1 = 0,
    gold = 150,
    bind_gold = 0,
    use_integral = 0,
    get_integral = 0,
    limit_buy = 0,
    limit_type = 3,
    limit_day = 1,
    buy_reset = 0,
    level = 14,
    level_max = 105,
    recharge = 0,
    ishide = 1,
    showtype = 2,
    present = 0
    };
getRow(24787,4,21)->
    #mallCfg {
    item_id = 24787,
    type = 4,
    sort = 21,
    type1 = 0,
    gold = 800,
    bind_gold = 800,
    use_integral = 0,
    get_integral = 0,
    limit_buy = 0,
    limit_type = 0,
    limit_day = 0,
    buy_reset = 0,
    level = 14,
    level_max = 105,
    recharge = 0,
    ishide = 1,
    showtype = 2,
    present = 0
    };
getRow(24789,5,1)->
    #mallCfg {
    item_id = 24789,
    type = 5,
    sort = 1,
    type1 = 0,
    gold = 500,
    bind_gold = 0,
    use_integral = 0,
    get_integral = 0,
    limit_buy = 0,
    limit_type = 0,
    limit_day = 0,
    buy_reset = 0,
    level = 50,
    level_max = 105,
    recharge = 0,
    ishide = 1,
    showtype = 2,
    present = 0
    };
getRow(24790,5,2)->
    #mallCfg {
    item_id = 24790,
    type = 5,
    sort = 2,
    type1 = 0,
    gold = 1000,
    bind_gold = 0,
    use_integral = 0,
    get_integral = 0,
    limit_buy = 0,
    limit_type = 0,
    limit_day = 0,
    buy_reset = 0,
    level = 51,
    level_max = 105,
    recharge = 0,
    ishide = 1,
    showtype = 2,
    present = 0
    };
getRow(26001,4,3)->
    #mallCfg {
    item_id = 26001,
    type = 4,
    sort = 3,
    type1 = 0,
    gold = 520,
    bind_gold = 520,
    use_integral = 0,
    get_integral = 0,
    limit_buy = 0,
    limit_type = 0,
    limit_day = 0,
    buy_reset = 0,
    level = 15,
    level_max = 105,
    recharge = 0,
    ishide = 1,
    showtype = 2,
    present = 0
    };
getRow(26002,3,6)->
    #mallCfg {
    item_id = 26002,
    type = 3,
    sort = 6,
    type1 = 0,
    gold = 1314,
    bind_gold = 0,
    use_integral = 0,
    get_integral = 0,
    limit_buy = 0,
    limit_type = 0,
    limit_day = 0,
    buy_reset = 0,
    level = 15,
    level_max = 105,
    recharge = 0,
    ishide = 1,
    showtype = 2,
    present = 1
    };
getRow(26005,4,17)->
    #mallCfg {
    item_id = 26005,
    type = 4,
    sort = 17,
    type1 = 0,
    gold = 100,
    bind_gold = 100,
    use_integral = 0,
    get_integral = 0,
    limit_buy = 0,
    limit_type = 0,
    limit_day = 0,
    buy_reset = 0,
    level = 1,
    level_max = 105,
    recharge = 0,
    ishide = 1,
    showtype = 2,
    present = 0
    };
getRow(26204,3,7)->
    #mallCfg {
    item_id = 26204,
    type = 3,
    sort = 7,
    type1 = 0,
    gold = 3888,
    bind_gold = 0,
    use_integral = 0,
    get_integral = 0,
    limit_buy = 0,
    limit_type = 0,
    limit_day = 0,
    buy_reset = 0,
    level = 15,
    level_max = 105,
    recharge = 0,
    ishide = 1,
    showtype = 2,
    present = 1
    };
getRow(26205,3,8)->
    #mallCfg {
    item_id = 26205,
    type = 3,
    sort = 8,
    type1 = 0,
    gold = 5888,
    bind_gold = 0,
    use_integral = 0,
    get_integral = 0,
    limit_buy = 0,
    limit_type = 0,
    limit_day = 0,
    buy_reset = 0,
    level = 15,
    level_max = 105,
    recharge = 0,
    ishide = 1,
    showtype = 2,
    present = 1
    };
getRow(29005,3,9)->
    #mallCfg {
    item_id = 29005,
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
    level = 1,
    level_max = 105,
    recharge = 0,
    ishide = 1,
    showtype = 2,
    present = 1
    };
getRow(29006,3,10)->
    #mallCfg {
    item_id = 29006,
    type = 3,
    sort = 10,
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
    level_max = 105,
    recharge = 0,
    ishide = 1,
    showtype = 2,
    present = 1
    };
getRow(29007,3,11)->
    #mallCfg {
    item_id = 29007,
    type = 3,
    sort = 11,
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
    level_max = 105,
    recharge = 0,
    ishide = 1,
    showtype = 2,
    present = 1
    };
getRow(_,_,_)->[].

getKeyList()->[
    {150,3,15},
    {151,3,16},
    {152,3,17},
    {153,3,18},
    {154,3,19},
    {201,1,16},
    {201,2,19},
    {202,2,13},
    {202,4,11},
    {203,2,14},
    {203,4,12},
    {204,2,15},
    {204,4,13},
    {222,1,1},
    {222,1,2},
    {222,1,3},
    {222,2,1},
    {222,4,4},
    {223,1,4},
    {223,1,5},
    {223,1,6},
    {223,2,2},
    {223,4,5},
    {224,1,7},
    {224,1,8},
    {224,1,9},
    {224,2,3},
    {224,4,6},
    {226,2,4},
    {230,1,10},
    {230,1,11},
    {230,1,12},
    {230,2,5},
    {230,4,7},
    {231,2,6},
    {231,4,8},
    {232,2,7},
    {232,4,9},
    {233,2,8},
    {233,4,10},
    {241,1,13},
    {241,1,14},
    {241,1,15},
    {251,2,9},
    {252,2,10},
    {253,2,11},
    {254,2,12},
    {272,1,18},
    {273,1,19},
    {274,1,20},
    {2160,2,16},
    {2160,4,14},
    {2161,2,17},
    {2161,4,15},
    {2162,2,18},
    {2162,4,16},
    {2601,3,3},
    {2601,4,2},
    {4100,3,13},
    {4100,4,19},
    {4101,3,14},
    {4101,4,20},
    {4200,4,1},
    {4203,3,2},
    {4302,3,12},
    {4306,3,1},
    {6000,4,18},
    {23000,3,4},
    {23001,3,5},
    {23002,1,17},
    {24102,1,21},
    {24787,4,21},
    {24789,5,1},
    {24790,5,2},
    {26001,4,3},
    {26002,3,6},
    {26005,4,17},
    {26204,3,7},
    {26205,3,8},
    {29005,3,9},
    {29006,3,10},
    {29007,3,11}
    ].

get1KeyList()->[
    150,
    151,
    152,
    153,
    154,
    201,
    202,
    203,
    204,
    222,
    223,
    224,
    226,
    230,
    231,
    232,
    233,
    241,
    251,
    252,
    253,
    254,
    272,
    273,
    274,
    2160,
    2161,
    2162,
    2601,
    4100,
    4101,
    4200,
    4203,
    4302,
    4306,
    6000,
    23000,
    23001,
    23002,
    24102,
    24787,
    24789,
    24790,
    26001,
    26002,
    26005,
    26204,
    26205,
    29005,
    29006,
    29007
    ].

get2KeyList(150)->[
    {3, 15}
    ];
get2KeyList(151)->[
    {3, 16}
    ];
get2KeyList(152)->[
    {3, 17}
    ];
get2KeyList(153)->[
    {3, 18}
    ];
get2KeyList(154)->[
    {3, 19}
    ];
get2KeyList(201)->[
    {1, 16},
    {2, 19}
    ];
get2KeyList(202)->[
    {2, 13},
    {4, 11}
    ];
get2KeyList(203)->[
    {2, 14},
    {4, 12}
    ];
get2KeyList(204)->[
    {2, 15},
    {4, 13}
    ];
get2KeyList(222)->[
    {1, 1},
    {1, 2},
    {1, 3},
    {2, 1},
    {4, 4}
    ];
get2KeyList(223)->[
    {1, 4},
    {1, 5},
    {1, 6},
    {2, 2},
    {4, 5}
    ];
get2KeyList(224)->[
    {1, 7},
    {1, 8},
    {1, 9},
    {2, 3},
    {4, 6}
    ];
get2KeyList(226)->[
    {2, 4}
    ];
get2KeyList(230)->[
    {1, 10},
    {1, 11},
    {1, 12},
    {2, 5},
    {4, 7}
    ];
get2KeyList(231)->[
    {2, 6},
    {4, 8}
    ];
get2KeyList(232)->[
    {2, 7},
    {4, 9}
    ];
get2KeyList(233)->[
    {2, 8},
    {4, 10}
    ];
get2KeyList(241)->[
    {1, 13},
    {1, 14},
    {1, 15}
    ];
get2KeyList(251)->[
    {2, 9}
    ];
get2KeyList(252)->[
    {2, 10}
    ];
get2KeyList(253)->[
    {2, 11}
    ];
get2KeyList(254)->[
    {2, 12}
    ];
get2KeyList(272)->[
    {1, 18}
    ];
get2KeyList(273)->[
    {1, 19}
    ];
get2KeyList(274)->[
    {1, 20}
    ];
get2KeyList(2160)->[
    {2, 16},
    {4, 14}
    ];
get2KeyList(2161)->[
    {2, 17},
    {4, 15}
    ];
get2KeyList(2162)->[
    {2, 18},
    {4, 16}
    ];
get2KeyList(2601)->[
    {3, 3},
    {4, 2}
    ];
get2KeyList(4100)->[
    {3, 13},
    {4, 19}
    ];
get2KeyList(4101)->[
    {3, 14},
    {4, 20}
    ];
get2KeyList(4200)->[
    {4, 1}
    ];
get2KeyList(4203)->[
    {3, 2}
    ];
get2KeyList(4302)->[
    {3, 12}
    ];
get2KeyList(4306)->[
    {3, 1}
    ];
get2KeyList(6000)->[
    {4, 18}
    ];
get2KeyList(23000)->[
    {3, 4}
    ];
get2KeyList(23001)->[
    {3, 5}
    ];
get2KeyList(23002)->[
    {1, 17}
    ];
get2KeyList(24102)->[
    {1, 21}
    ];
get2KeyList(24787)->[
    {4, 21}
    ];
get2KeyList(24789)->[
    {5, 1}
    ];
get2KeyList(24790)->[
    {5, 2}
    ];
get2KeyList(26001)->[
    {4, 3}
    ];
get2KeyList(26002)->[
    {3, 6}
    ];
get2KeyList(26005)->[
    {4, 17}
    ];
get2KeyList(26204)->[
    {3, 7}
    ];
get2KeyList(26205)->[
    {3, 8}
    ];
get2KeyList(29005)->[
    {3, 9}
    ];
get2KeyList(29006)->[
    {3, 10}
    ];
get2KeyList(29007)->[
    {3, 11}
    ];
get2KeyList(_)->[].

get3KeyList(150,3)->[
    15
    ];
get3KeyList(151,3)->[
    16
    ];
get3KeyList(152,3)->[
    17
    ];
get3KeyList(153,3)->[
    18
    ];
get3KeyList(154,3)->[
    19
    ];
get3KeyList(201,1)->[
    16
    ];
get3KeyList(201,2)->[
    19
    ];
get3KeyList(202,2)->[
    13
    ];
get3KeyList(202,4)->[
    11
    ];
get3KeyList(203,2)->[
    14
    ];
get3KeyList(203,4)->[
    12
    ];
get3KeyList(204,2)->[
    15
    ];
get3KeyList(204,4)->[
    13
    ];
get3KeyList(222,1)->[
    1,
    2,
    3
    ];
get3KeyList(222,2)->[
    1
    ];
get3KeyList(222,4)->[
    4
    ];
get3KeyList(223,1)->[
    4,
    5,
    6
    ];
get3KeyList(223,2)->[
    2
    ];
get3KeyList(223,4)->[
    5
    ];
get3KeyList(224,1)->[
    7,
    8,
    9
    ];
get3KeyList(224,2)->[
    3
    ];
get3KeyList(224,4)->[
    6
    ];
get3KeyList(226,2)->[
    4
    ];
get3KeyList(230,1)->[
    10,
    11,
    12
    ];
get3KeyList(230,2)->[
    5
    ];
get3KeyList(230,4)->[
    7
    ];
get3KeyList(231,2)->[
    6
    ];
get3KeyList(231,4)->[
    8
    ];
get3KeyList(232,2)->[
    7
    ];
get3KeyList(232,4)->[
    9
    ];
get3KeyList(233,2)->[
    8
    ];
get3KeyList(233,4)->[
    10
    ];
get3KeyList(241,1)->[
    13,
    14,
    15
    ];
get3KeyList(251,2)->[
    9
    ];
get3KeyList(252,2)->[
    10
    ];
get3KeyList(253,2)->[
    11
    ];
get3KeyList(254,2)->[
    12
    ];
get3KeyList(272,1)->[
    18
    ];
get3KeyList(273,1)->[
    19
    ];
get3KeyList(274,1)->[
    20
    ];
get3KeyList(2160,2)->[
    16
    ];
get3KeyList(2160,4)->[
    14
    ];
get3KeyList(2161,2)->[
    17
    ];
get3KeyList(2161,4)->[
    15
    ];
get3KeyList(2162,2)->[
    18
    ];
get3KeyList(2162,4)->[
    16
    ];
get3KeyList(2601,3)->[
    3
    ];
get3KeyList(2601,4)->[
    2
    ];
get3KeyList(4100,3)->[
    13
    ];
get3KeyList(4100,4)->[
    19
    ];
get3KeyList(4101,3)->[
    14
    ];
get3KeyList(4101,4)->[
    20
    ];
get3KeyList(4200,4)->[
    1
    ];
get3KeyList(4203,3)->[
    2
    ];
get3KeyList(4302,3)->[
    12
    ];
get3KeyList(4306,3)->[
    1
    ];
get3KeyList(6000,4)->[
    18
    ];
get3KeyList(23000,3)->[
    4
    ];
get3KeyList(23001,3)->[
    5
    ];
get3KeyList(23002,1)->[
    17
    ];
get3KeyList(24102,1)->[
    21
    ];
get3KeyList(24787,4)->[
    21
    ];
get3KeyList(24789,5)->[
    1
    ];
get3KeyList(24790,5)->[
    2
    ];
get3KeyList(26001,4)->[
    3
    ];
get3KeyList(26002,3)->[
    6
    ];
get3KeyList(26005,4)->[
    17
    ];
get3KeyList(26204,3)->[
    7
    ];
get3KeyList(26205,3)->[
    8
    ];
get3KeyList(29005,3)->[
    9
    ];
get3KeyList(29006,3)->[
    10
    ];
get3KeyList(29007,3)->[
    11
    ];
get3KeyList(_,_)->[].

