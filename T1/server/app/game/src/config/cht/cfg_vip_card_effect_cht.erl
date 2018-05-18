%% coding: latin-1
%%: 实现
-module(cfg_vip_card_effect_cht).
-compile(export_all).
-include("cfg_vip_card_effect.hrl").


getRow(50001,1)->
    #vip_card_effectCfg {
    vip_card_id = 50001,
    effect_id = 1,
    function_id = 1,
    des = "经验副本每日免费增加{0}次",
    param1 = 1,
    param2 = 5,
    param3 = 0,
    is_num_show = 1
    };
getRow(50001,2)->
    #vip_card_effectCfg {
    vip_card_id = 50001,
    effect_id = 2,
    function_id = 1,
    des = "金币副本每日免费增加{0}次",
    param1 = 1,
    param2 = 1009,
    param3 = 0,
    is_num_show = 1
    };
getRow(50001,11)->
    #vip_card_effectCfg {
    vip_card_id = 50001,
    effect_id = 11,
    function_id = 11,
    des = "解锁拍卖行功能的开启",
    param1 = 1,
    param2 = 0,
    param3 = 0,
    is_num_show = 0
    };
getRow(50001,21)->
    #vip_card_effectCfg {
    vip_card_id = 50001,
    effect_id = 21,
    function_id = 0,
    des = "奖励精灵：变异蝙蝠(永久)",
    param1 = 0,
    param2 = 0,
    param3 = 0,
    is_num_show = 0
    };
getRow(50002,4)->
    #vip_card_effectCfg {
    vip_card_id = 50002,
    effect_id = 4,
    function_id = 4,
    des = "女神扭蛋机每天免费赠送{0}次抽取",
    param1 = 1,
    param2 = 0,
    param3 = 0,
    is_num_show = 1
    };
getRow(50002,5)->
    #vip_card_effectCfg {
    vip_card_id = 50002,
    effect_id = 5,
    function_id = 5,
    des = "限时商城免费刷新增加{0}次",
    param1 = 3,
    param2 = 0,
    param3 = 0,
    is_num_show = 1
    };
getRow(50002,6)->
    #vip_card_effectCfg {
    vip_card_id = 50002,
    effect_id = 6,
    function_id = 1,
    des = "挑战副本增加{0}次",
    param1 = 1,
    param2 = 9,
    param3 = 0,
    is_num_show = 1
    };
getRow(50002,22)->
    #vip_card_effectCfg {
    vip_card_id = 50002,
    effect_id = 22,
    function_id = 0,
    des = "奖励时装：经典造型头饰(永久)",
    param1 = 0,
    param2 = 0,
    param3 = 0,
    is_num_show = 0
    };
getRow(50003,3)->
    #vip_card_effectCfg {
    vip_card_id = 50003,
    effect_id = 3,
    function_id = 3,
    des = "商城每日限购次数增加{0}",
    param1 = 2,
    param2 = 0,
    param3 = 0,
    is_num_show = 2
    };
getRow(50003,12)->
    #vip_card_effectCfg {
    vip_card_id = 50003,
    effect_id = 12,
    function_id = 0,
    des = "每日奖励100绑定钻石",
    param1 = 0,
    param2 = 0,
    param3 = 0,
    is_num_show = 0
    };
getRow(50003,13)->
    #vip_card_effectCfg {
    vip_card_id = 50003,
    effect_id = 13,
    function_id = 0,
    des = "每日奖励20000金币",
    param1 = 0,
    param2 = 0,
    param3 = 0,
    is_num_show = 0
    };
getRow(50003,23)->
    #vip_card_effectCfg {
    vip_card_id = 50003,
    effect_id = 23,
    function_id = 0,
    des = "奖励时装：经典造型衣服(永久)",
    param1 = 0,
    param2 = 0,
    param3 = 0,
    is_num_show = 0
    };
getRow(50004,7)->
    #vip_card_effectCfg {
    vip_card_id = 50004,
    effect_id = 7,
    function_id = 0,
    des = "解锁开启超值3元礼包购买权",
    param1 = 0,
    param2 = 0,
    param3 = 0,
    is_num_show = 0
    };
getRow(50004,8)->
    #vip_card_effectCfg {
    vip_card_id = 50004,
    effect_id = 8,
    function_id = 8,
    des = "首领禁地击杀奖励增加{0}次",
    param1 = 2,
    param2 = 0,
    param3 = 0,
    is_num_show = 1
    };
getRow(50004,9)->
    #vip_card_effectCfg {
    vip_card_id = 50004,
    effect_id = 9,
    function_id = 9,
    des = "首领禁地协助奖励增加{0}次",
    param1 = 1,
    param2 = 0,
    param3 = 0,
    is_num_show = 1
    };
getRow(50004,10)->
    #vip_card_effectCfg {
    vip_card_id = 50004,
    effect_id = 10,
    function_id = 0,
    des = "解锁开启超值6元礼包购买权",
    param1 = 0,
    param2 = 0,
    param3 = 0,
    is_num_show = 0
    };
getRow(_,_)->[].

getKeyList()->[
    {50001,1},
    {50001,2},
    {50001,11},
    {50001,21},
    {50002,4},
    {50002,5},
    {50002,6},
    {50002,22},
    {50003,3},
    {50003,12},
    {50003,13},
    {50003,23},
    {50004,7},
    {50004,8},
    {50004,9},
    {50004,10}
    ].

get1KeyList()->[
    50001,
    50002,
    50003,
    50004
    ].

get2KeyList(50001)->[
    1,
    2,
    11,
    21
    ];
get2KeyList(50002)->[
    4,
    5,
    6,
    22
    ];
get2KeyList(50003)->[
    3,
    12,
    13,
    23
    ];
get2KeyList(50004)->[
    7,
    8,
    9,
    10
    ];
get2KeyList(_)->[].

