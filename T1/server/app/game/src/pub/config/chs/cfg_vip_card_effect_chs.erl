%% coding: latin-1
%%: 实现
-module(cfg_vip_card_effect_chs).
-compile(export_all).
-include("cfg_vip_card_effect.hrl").
-include("logger.hrl").

getRow(50001,1)->
    #vip_card_effectCfg {
    vip_card_id = 50001,
    effect_id = 1,
    function_id = 1,
    des = "经验升降梯每日免费增加{0}次",
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
    des = "惊天喵盗团每日免费增加{0}次",
    param1 = 1,
    param2 = 1009,
    param3 = 0,
    is_num_show = 1
    };
getRow(50001,6)->
    #vip_card_effectCfg {
    vip_card_id = 50001,
    effect_id = 6,
    function_id = 1,
    des = "挑战副本每日免费增加{0}次",
    param1 = 1,
    param2 = 9,
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
getRow(50001,14)->
    #vip_card_effectCfg {
    vip_card_id = 50001,
    effect_id = 14,
    function_id = 0,
    des = "立即获得{0}星月币",
    param1 = 1200,
    param2 = 0,
    param3 = 0,
    is_num_show = 1
    };
getRow(50002,12)->
    #vip_card_effectCfg {
    vip_card_id = 50002,
    effect_id = 12,
    function_id = 0,
    des = "每日领取1200星月币",
    param1 = 0,
    param2 = 0,
    param3 = 0,
    is_num_show = 0
    };
getRow(50002,13)->
    #vip_card_effectCfg {
    vip_card_id = 50002,
    effect_id = 13,
    function_id = 0,
    des = "每日领取50000金币",
    param1 = 0,
    param2 = 0,
    param3 = 0,
    is_num_show = 0
    };
getRow(50002,15)->
    #vip_card_effectCfg {
    vip_card_id = 50002,
    effect_id = 15,
    function_id = 0,
    des = "立即获得{0}星月币",
    param1 = 1800,
    param2 = 0,
    param3 = 0,
    is_num_show = 1
    };
getRow(50002,100)->
    #vip_card_effectCfg {
    vip_card_id = 50002,
    effect_id = 100,
    function_id = 0,
    des = "每日领取1个背包解锁符文盒",
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
getRow(50003,4)->
    #vip_card_effectCfg {
    vip_card_id = 50003,
    effect_id = 4,
    function_id = 4,
    des = "女神扭蛋机每日免费抽取{0}次",
    param1 = 1,
    param2 = 0,
    param3 = 0,
    is_num_show = 1
    };
getRow(50003,5)->
    #vip_card_effectCfg {
    vip_card_id = 50003,
    effect_id = 5,
    function_id = 5,
    des = "神秘商店每日免费增加{0}次刷新",
    param1 = 3,
    param2 = 0,
    param3 = 0,
    is_num_show = 1
    };
getRow(50003,16)->
    #vip_card_effectCfg {
    vip_card_id = 50003,
    effect_id = 16,
    function_id = 0,
    des = "立即获得{0}星月币",
    param1 = 3600,
    param2 = 0,
    param3 = 0,
    is_num_show = 1
    };
getRow(50003,23)->
    #vip_card_effectCfg {
    vip_card_id = 50003,
    effect_id = 23,
    function_id = 0,
    des = "奖励超萌精灵-雪熊熊(30天)",
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
    {50001,6},
    {50001,11},
    {50001,14},
    {50002,12},
    {50002,13},
    {50002,15},
    {50002,100},
    {50003,3},
    {50003,4},
    {50003,5},
    {50003,16},
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
    6,
    11,
    14
    ];
get2KeyList(50002)->[
    12,
    13,
    15,
    100
    ];
get2KeyList(50003)->[
    3,
    4,
    5,
    16,
    23
    ];
get2KeyList(50004)->[
    7,
    8,
    9,
    10
    ];
get2KeyList(_)->[].

