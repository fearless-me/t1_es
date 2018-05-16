%% coding: latin-1
%%: 实现
-module(cfg_buffAnnounce_cht).
-compile(export_all).
-include("cfg_buffAnnounce.hrl").
-include("logger.hrl").

getRow(1)->
    #buffAnnounceCfg {
    id = 1,
    msg_target = 1,
    msg_time = 1,
    msg_1 = "仅添加提示测试1",
    showTime_1 = 0,
    showTime_2 = 0,
    showTime_4 = 0
    };
getRow(2)->
    #buffAnnounceCfg {
    id = 2,
    msg_target = 1,
    msg_time = 2,
    showTime_1 = 0,
    msg_2 = "仅间隔触发提示测试2",
    showTime_2 = 0,
    showTime_4 = 0
    };
getRow(3)->
    #buffAnnounceCfg {
    id = 3,
    msg_target = 1,
    msg_time = 4,
    showTime_1 = 0,
    showTime_2 = 0,
    msg_4 = "仅删除提示测试4",
    showTime_4 = 0
    };
getRow(4)->
    #buffAnnounceCfg {
    id = 4,
    msg_target = 0,
    msg_time = 7,
    msg_1 = "{0}获得了暗斩BUFF~喵 5秒",
    showTime_1 = 5000,
    msg_2 = "{0}受到暗斩间隔伤害~喵 2.5秒",
    showTime_2 = 2500,
    msg_4 = "{0}暗斩结束了哟~喵 5秒",
    showTime_4 = 5000
    };
getRow(5)->
    #buffAnnounceCfg {
    id = 5,
    msg_target = 1,
    msg_time = 1,
    msg_1 = "请前往周围平台拾取与小史莱姆颜色一样的buff",
    showTime_1 = 60000,
    showTime_2 = 0,
    showTime_4 = 0
    };
getRow(6)->
    #buffAnnounceCfg {
    id = 6,
    msg_target = 0,
    msg_time = 1,
    msg_1 = "你获得了红色Buff，请优先攻击[ff0000]红色的小史莱姆[-]",
    showTime_1 = 5000,
    showTime_2 = 0,
    showTime_4 = 0
    };
getRow(7)->
    #buffAnnounceCfg {
    id = 7,
    msg_target = 0,
    msg_time = 1,
    msg_1 = "你获得了蓝色Buff，请优先攻击[549fff]蓝色的小史莱姆[-]",
    showTime_1 = 5000,
    showTime_2 = 0,
    showTime_4 = 0
    };
getRow(8)->
    #buffAnnounceCfg {
    id = 8,
    msg_target = 0,
    msg_time = 1,
    msg_1 = "你获得了紫色Buff，请优先攻击[d336ff]紫色的小史莱姆[-]",
    showTime_1 = 5000,
    showTime_2 = 0,
    showTime_4 = 0
    };
getRow(9)->
    #buffAnnounceCfg {
    id = 9,
    msg_target = 0,
    msg_time = 1,
    msg_1 = "你获得了青色Buff，请优先攻击[4debf5]青色的小史莱姆[-]",
    showTime_1 = 5000,
    showTime_2 = 0,
    showTime_4 = 0
    };
getRow(10)->
    #buffAnnounceCfg {
    id = 10,
    msg_target = 0,
    msg_time = 1,
    msg_1 = "你获得了橙色Buff，请优先攻击[ff8f79]橙色的小史莱姆[-]",
    showTime_1 = 5000,
    showTime_2 = 0,
    showTime_4 = 0
    };
getRow(11)->
    #buffAnnounceCfg {
    id = 11,
    msg_target = 0,
    msg_time = 1,
    msg_1 = "你获得了黄色Buff，请优先攻击[ffdf6c]黄色的小史莱姆[-]",
    showTime_1 = 5000,
    showTime_2 = 0,
    showTime_4 = 0
    };
getRow(12)->
    #buffAnnounceCfg {
    id = 12,
    msg_target = 1,
    msg_time = 1,
    msg_1 = "请击破发光的守护石来破除巴鲁西亚的无敌效果！",
    showTime_1 = 10000,
    showTime_2 = 0,
    showTime_4 = 0
    };
getRow(13)->
    #buffAnnounceCfg {
    id = 13,
    msg_target = 1,
    msg_time = 1,
    msg_1 = "兄弟水手需要在15秒内击破！否则可能会复活！",
    showTime_1 = 10000,
    showTime_2 = 0,
    showTime_4 = 0
    };
getRow(14)->
    #buffAnnounceCfg {
    id = 14,
    msg_target = 1,
    msg_time = 1,
    msg_1 = "请将水手兄弟拉出回血法阵！",
    showTime_1 = 10000,
    showTime_2 = 0,
    showTime_4 = 0
    };
getRow(15)->
    #buffAnnounceCfg {
    id = 15,
    msg_target = 1,
    msg_time = 1,
    msg_1 = "请迅速前往阿修罗的无敌区域来躲避伤害(区域内玩家伤害大幅降低）！",
    showTime_1 = 10000,
    showTime_2 = 0,
    showTime_4 = 0
    };
getRow(16)->
    #buffAnnounceCfg {
    id = 16,
    msg_target = 0,
    msg_time = 5,
    msg_1 = "现在你变得非常强！谁都打不过你！",
    showTime_1 = 5000,
    showTime_2 = 0,
    msg_4 = "超强的BUFF结束了！不要无脑刚正面了！",
    showTime_4 = 3000
    };
getRow(17)->
    #buffAnnounceCfg {
    id = 17,
    msg_target = 0,
    msg_time = 1,
    msg_1 = "因为你离开了【阿克勒城】，【极地求生】的匹配被迫中断！",
    showTime_1 = 10000,
    showTime_2 = 0,
    showTime_4 = 0
    };
getRow(18)->
    #buffAnnounceCfg {
    id = 18,
    msg_target = 0,
    msg_time = 1,
    msg_1 = "你进去了安全区，不再受到【恐怖迷雾】的伤害了！",
    showTime_1 = 5000,
    showTime_2 = 0,
    showTime_4 = 0
    };
getRow(19)->
    #buffAnnounceCfg {
    id = 19,
    msg_target = 0,
    msg_time = 1,
    msg_1 = "【恐怖迷雾】即将来袭，请尽速逃离至女神庇护范围内",
    showTime_1 = 5000,
    showTime_2 = 0,
    showTime_4 = 0
    };
getRow(2500)->
    #buffAnnounceCfg {
    id = 2500,
    msg_target = 1,
    msg_time = 1,
    msg_1 = "首领当前血量为[ff0000]98%[-]，请加快火力！",
    showTime_1 = 5000,
    showTime_2 = 0,
    showTime_4 = 0
    };
getRow(2501)->
    #buffAnnounceCfg {
    id = 2501,
    msg_target = 1,
    msg_time = 1,
    msg_1 = "首领当前血量为[ff0000]96%[-]，请加快火力！",
    showTime_1 = 5000,
    showTime_2 = 0,
    showTime_4 = 0
    };
getRow(2502)->
    #buffAnnounceCfg {
    id = 2502,
    msg_target = 1,
    msg_time = 1,
    msg_1 = "首领当前血量为[ff0000]94%[-]，请加快火力！",
    showTime_1 = 5000,
    showTime_2 = 0,
    showTime_4 = 0
    };
getRow(2503)->
    #buffAnnounceCfg {
    id = 2503,
    msg_target = 1,
    msg_time = 1,
    msg_1 = "首领当前血量为[ff0000]92%[-]，请加快火力！",
    showTime_1 = 5000,
    showTime_2 = 0,
    showTime_4 = 0
    };
getRow(2504)->
    #buffAnnounceCfg {
    id = 2504,
    msg_target = 1,
    msg_time = 1,
    msg_1 = "首领当前血量为[ff0000]90%[-]，请加快火力！",
    showTime_1 = 5000,
    showTime_2 = 0,
    showTime_4 = 0
    };
getRow(2505)->
    #buffAnnounceCfg {
    id = 2505,
    msg_target = 1,
    msg_time = 1,
    msg_1 = "首领当前血量为[ff0000]88%[-]，请加快火力！",
    showTime_1 = 5000,
    showTime_2 = 0,
    showTime_4 = 0
    };
getRow(2506)->
    #buffAnnounceCfg {
    id = 2506,
    msg_target = 1,
    msg_time = 1,
    msg_1 = "首领当前血量为[ff0000]86%[-]，请加快火力！",
    showTime_1 = 5000,
    showTime_2 = 0,
    showTime_4 = 0
    };
getRow(2507)->
    #buffAnnounceCfg {
    id = 2507,
    msg_target = 1,
    msg_time = 1,
    msg_1 = "首领当前血量为[ff0000]84%[-]，请加快火力！",
    showTime_1 = 5000,
    showTime_2 = 0,
    showTime_4 = 0
    };
getRow(2508)->
    #buffAnnounceCfg {
    id = 2508,
    msg_target = 1,
    msg_time = 1,
    msg_1 = "首领当前血量为[ff0000]82%[-]，请加快火力！",
    showTime_1 = 5000,
    showTime_2 = 0,
    showTime_4 = 0
    };
getRow(2509)->
    #buffAnnounceCfg {
    id = 2509,
    msg_target = 1,
    msg_time = 1,
    msg_1 = "首领当前血量为[ff0000]80%[-]，请加快火力！",
    showTime_1 = 5000,
    showTime_2 = 0,
    showTime_4 = 0
    };
getRow(2510)->
    #buffAnnounceCfg {
    id = 2510,
    msg_target = 1,
    msg_time = 1,
    msg_1 = "首领当前血量为[ff0000]78%[-]，请加快火力！",
    showTime_1 = 5000,
    showTime_2 = 0,
    showTime_4 = 0
    };
getRow(2511)->
    #buffAnnounceCfg {
    id = 2511,
    msg_target = 1,
    msg_time = 1,
    msg_1 = "首领当前血量为[ff0000]76%[-]，请加快火力！",
    showTime_1 = 5000,
    showTime_2 = 0,
    showTime_4 = 0
    };
getRow(2512)->
    #buffAnnounceCfg {
    id = 2512,
    msg_target = 1,
    msg_time = 1,
    msg_1 = "首领当前血量为[ff0000]74%[-]，请加快火力！",
    showTime_1 = 5000,
    showTime_2 = 0,
    showTime_4 = 0
    };
getRow(2513)->
    #buffAnnounceCfg {
    id = 2513,
    msg_target = 1,
    msg_time = 1,
    msg_1 = "首领当前血量为[ff0000]72%[-]，请加快火力！",
    showTime_1 = 5000,
    showTime_2 = 0,
    showTime_4 = 0
    };
getRow(2514)->
    #buffAnnounceCfg {
    id = 2514,
    msg_target = 1,
    msg_time = 1,
    msg_1 = "首领当前血量为[ff0000]70%[-]，请加快火力！",
    showTime_1 = 5000,
    showTime_2 = 0,
    showTime_4 = 0
    };
getRow(2515)->
    #buffAnnounceCfg {
    id = 2515,
    msg_target = 1,
    msg_time = 1,
    msg_1 = "首领当前血量为[ff0000]68%[-]，请加快火力！",
    showTime_1 = 5000,
    showTime_2 = 0,
    showTime_4 = 0
    };
getRow(2516)->
    #buffAnnounceCfg {
    id = 2516,
    msg_target = 1,
    msg_time = 1,
    msg_1 = "首领当前血量为[ff0000]66%[-]，请加快火力！",
    showTime_1 = 5000,
    showTime_2 = 0,
    showTime_4 = 0
    };
getRow(2517)->
    #buffAnnounceCfg {
    id = 2517,
    msg_target = 1,
    msg_time = 1,
    msg_1 = "首领当前血量为[ff0000]64%[-]，请加快火力！",
    showTime_1 = 5000,
    showTime_2 = 0,
    showTime_4 = 0
    };
getRow(2518)->
    #buffAnnounceCfg {
    id = 2518,
    msg_target = 1,
    msg_time = 1,
    msg_1 = "首领当前血量为[ff0000]62%[-]，请加快火力！",
    showTime_1 = 5000,
    showTime_2 = 0,
    showTime_4 = 0
    };
getRow(2519)->
    #buffAnnounceCfg {
    id = 2519,
    msg_target = 1,
    msg_time = 1,
    msg_1 = "首领当前血量为[ff0000]60%[-]，请加快火力！",
    showTime_1 = 5000,
    showTime_2 = 0,
    showTime_4 = 0
    };
getRow(2520)->
    #buffAnnounceCfg {
    id = 2520,
    msg_target = 1,
    msg_time = 1,
    msg_1 = "首领当前血量为[ff0000]58%[-]，请加快火力！",
    showTime_1 = 5000,
    showTime_2 = 0,
    showTime_4 = 0
    };
getRow(2521)->
    #buffAnnounceCfg {
    id = 2521,
    msg_target = 1,
    msg_time = 1,
    msg_1 = "首领当前血量为[ff0000]56%[-]，请加快火力！",
    showTime_1 = 5000,
    showTime_2 = 0,
    showTime_4 = 0
    };
getRow(2522)->
    #buffAnnounceCfg {
    id = 2522,
    msg_target = 1,
    msg_time = 1,
    msg_1 = "首领当前血量为[ff0000]54%[-]，请加快火力！",
    showTime_1 = 5000,
    showTime_2 = 0,
    showTime_4 = 0
    };
getRow(2523)->
    #buffAnnounceCfg {
    id = 2523,
    msg_target = 1,
    msg_time = 1,
    msg_1 = "首领当前血量为[ff0000]52%[-]，请加快火力！",
    showTime_1 = 5000,
    showTime_2 = 0,
    showTime_4 = 0
    };
getRow(2524)->
    #buffAnnounceCfg {
    id = 2524,
    msg_target = 1,
    msg_time = 1,
    msg_1 = "首领当前血量为[ff0000]50%[-]，请加快火力！",
    showTime_1 = 5000,
    showTime_2 = 0,
    showTime_4 = 0
    };
getRow(2525)->
    #buffAnnounceCfg {
    id = 2525,
    msg_target = 1,
    msg_time = 1,
    msg_1 = "首领当前血量为[ff0000]48%[-]，请加快火力！",
    showTime_1 = 5000,
    showTime_2 = 0,
    showTime_4 = 0
    };
getRow(2526)->
    #buffAnnounceCfg {
    id = 2526,
    msg_target = 1,
    msg_time = 1,
    msg_1 = "首领当前血量为[ff0000]46%[-]，请加快火力！",
    showTime_1 = 5000,
    showTime_2 = 0,
    showTime_4 = 0
    };
getRow(2527)->
    #buffAnnounceCfg {
    id = 2527,
    msg_target = 1,
    msg_time = 1,
    msg_1 = "首领当前血量为[ff0000]44%[-]，请加快火力！",
    showTime_1 = 5000,
    showTime_2 = 0,
    showTime_4 = 0
    };
getRow(2528)->
    #buffAnnounceCfg {
    id = 2528,
    msg_target = 1,
    msg_time = 1,
    msg_1 = "首领当前血量为[ff0000]42%[-]，请加快火力！",
    showTime_1 = 5000,
    showTime_2 = 0,
    showTime_4 = 0
    };
getRow(2529)->
    #buffAnnounceCfg {
    id = 2529,
    msg_target = 1,
    msg_time = 1,
    msg_1 = "首领当前血量为[ff0000]40%[-]，请加快火力！",
    showTime_1 = 5000,
    showTime_2 = 0,
    showTime_4 = 0
    };
getRow(2530)->
    #buffAnnounceCfg {
    id = 2530,
    msg_target = 1,
    msg_time = 1,
    msg_1 = "首领当前血量为[ff0000]38%[-]，请加快火力！",
    showTime_1 = 5000,
    showTime_2 = 0,
    showTime_4 = 0
    };
getRow(2531)->
    #buffAnnounceCfg {
    id = 2531,
    msg_target = 1,
    msg_time = 1,
    msg_1 = "首领当前血量为[ff0000]36%[-]，请加快火力！",
    showTime_1 = 5000,
    showTime_2 = 0,
    showTime_4 = 0
    };
getRow(2532)->
    #buffAnnounceCfg {
    id = 2532,
    msg_target = 1,
    msg_time = 1,
    msg_1 = "首领当前血量为[ff0000]34%[-]，请加快火力！",
    showTime_1 = 5000,
    showTime_2 = 0,
    showTime_4 = 0
    };
getRow(2533)->
    #buffAnnounceCfg {
    id = 2533,
    msg_target = 1,
    msg_time = 1,
    msg_1 = "首领当前血量为[ff0000]32%[-]，请加快火力！",
    showTime_1 = 5000,
    showTime_2 = 0,
    showTime_4 = 0
    };
getRow(2534)->
    #buffAnnounceCfg {
    id = 2534,
    msg_target = 1,
    msg_time = 1,
    msg_1 = "首领当前血量为[ff0000]30%[-]，请加快火力！",
    showTime_1 = 5000,
    showTime_2 = 0,
    showTime_4 = 0
    };
getRow(2535)->
    #buffAnnounceCfg {
    id = 2535,
    msg_target = 1,
    msg_time = 1,
    msg_1 = "首领当前血量为[ff0000]28%[-]，请加快火力！",
    showTime_1 = 5000,
    showTime_2 = 0,
    showTime_4 = 0
    };
getRow(2536)->
    #buffAnnounceCfg {
    id = 2536,
    msg_target = 1,
    msg_time = 1,
    msg_1 = "首领当前血量为[ff0000]26%[-]，请加快火力！",
    showTime_1 = 5000,
    showTime_2 = 0,
    showTime_4 = 0
    };
getRow(2537)->
    #buffAnnounceCfg {
    id = 2537,
    msg_target = 1,
    msg_time = 1,
    msg_1 = "首领当前血量为[ff0000]24%[-]，请加快火力！",
    showTime_1 = 5000,
    showTime_2 = 0,
    showTime_4 = 0
    };
getRow(2538)->
    #buffAnnounceCfg {
    id = 2538,
    msg_target = 1,
    msg_time = 1,
    msg_1 = "首领当前血量为[ff0000]22%[-]，请加快火力！",
    showTime_1 = 5000,
    showTime_2 = 0,
    showTime_4 = 0
    };
getRow(2539)->
    #buffAnnounceCfg {
    id = 2539,
    msg_target = 1,
    msg_time = 1,
    msg_1 = "首领当前血量为[ff0000]20%[-]，请加快火力！",
    showTime_1 = 5000,
    showTime_2 = 0,
    showTime_4 = 0
    };
getRow(2540)->
    #buffAnnounceCfg {
    id = 2540,
    msg_target = 1,
    msg_time = 1,
    msg_1 = "首领当前血量为[ff0000]18%[-]，请加快火力！",
    showTime_1 = 5000,
    showTime_2 = 0,
    showTime_4 = 0
    };
getRow(2541)->
    #buffAnnounceCfg {
    id = 2541,
    msg_target = 1,
    msg_time = 1,
    msg_1 = "首领当前血量为[ff0000]16%[-]，请加快火力！",
    showTime_1 = 5000,
    showTime_2 = 0,
    showTime_4 = 0
    };
getRow(2542)->
    #buffAnnounceCfg {
    id = 2542,
    msg_target = 1,
    msg_time = 1,
    msg_1 = "首领当前血量为[ff0000]14%[-]，请加快火力！",
    showTime_1 = 5000,
    showTime_2 = 0,
    showTime_4 = 0
    };
getRow(2543)->
    #buffAnnounceCfg {
    id = 2543,
    msg_target = 1,
    msg_time = 1,
    msg_1 = "首领当前血量为[ff0000]12%[-]，请加快火力！",
    showTime_1 = 5000,
    showTime_2 = 0,
    showTime_4 = 0
    };
getRow(2544)->
    #buffAnnounceCfg {
    id = 2544,
    msg_target = 1,
    msg_time = 1,
    msg_1 = "首领当前血量为[ff0000]10%[-]，请加快火力！",
    showTime_1 = 5000,
    showTime_2 = 0,
    showTime_4 = 0
    };
getRow(2545)->
    #buffAnnounceCfg {
    id = 2545,
    msg_target = 1,
    msg_time = 1,
    msg_1 = "首领当前血量为[ff0000]8%[-]，请加快火力！",
    showTime_1 = 5000,
    showTime_2 = 0,
    showTime_4 = 0
    };
getRow(2546)->
    #buffAnnounceCfg {
    id = 2546,
    msg_target = 1,
    msg_time = 1,
    msg_1 = "首领当前血量为[ff0000]6%[-]，请加快火力！",
    showTime_1 = 5000,
    showTime_2 = 0,
    showTime_4 = 0
    };
getRow(2547)->
    #buffAnnounceCfg {
    id = 2547,
    msg_target = 1,
    msg_time = 1,
    msg_1 = "首领当前血量为[ff0000]4%[-]，请加快火力！",
    showTime_1 = 5000,
    showTime_2 = 0,
    showTime_4 = 0
    };
getRow(2548)->
    #buffAnnounceCfg {
    id = 2548,
    msg_target = 1,
    msg_time = 1,
    msg_1 = "首领当前血量为[ff0000]2%[-]，请加快火力！",
    showTime_1 = 5000,
    showTime_2 = 0,
    showTime_4 = 0
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
    {2500},
    {2501},
    {2502},
    {2503},
    {2504},
    {2505},
    {2506},
    {2507},
    {2508},
    {2509},
    {2510},
    {2511},
    {2512},
    {2513},
    {2514},
    {2515},
    {2516},
    {2517},
    {2518},
    {2519},
    {2520},
    {2521},
    {2522},
    {2523},
    {2524},
    {2525},
    {2526},
    {2527},
    {2528},
    {2529},
    {2530},
    {2531},
    {2532},
    {2533},
    {2534},
    {2535},
    {2536},
    {2537},
    {2538},
    {2539},
    {2540},
    {2541},
    {2542},
    {2543},
    {2544},
    {2545},
    {2546},
    {2547},
    {2548}
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
    2500,
    2501,
    2502,
    2503,
    2504,
    2505,
    2506,
    2507,
    2508,
    2509,
    2510,
    2511,
    2512,
    2513,
    2514,
    2515,
    2516,
    2517,
    2518,
    2519,
    2520,
    2521,
    2522,
    2523,
    2524,
    2525,
    2526,
    2527,
    2528,
    2529,
    2530,
    2531,
    2532,
    2533,
    2534,
    2535,
    2536,
    2537,
    2538,
    2539,
    2540,
    2541,
    2542,
    2543,
    2544,
    2545,
    2546,
    2547,
    2548
    ].

