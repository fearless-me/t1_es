%% coding: latin-1
%%: 实现
-module(cfg_show1_cht).
-compile(export_all).
-include("cfg_show1.hrl").


getRow(103)->
    #show1Cfg {
    id = 103,
    showgroupid_1 = 103,
    showname_1 = "露娜女神",
    emotion = 1,
    head = 451,
    content = "这里就是囚禁魔龙的之所，它已被我囚禁多年，怨气极深，你可要小心！",
    show_wait = 2500
    };
getRow(104)->
    #show1Cfg {
    id = 104,
    showgroupid_1 = 104,
    showname_1 = "派诺",
    emotion = 1,
    head = 457,
    content = "欢迎来到兽息之地，这里有很多的骑宠，不过只有一只是没有主人的，找到它，你就有机会获得。",
    show_wait = 2500
    };
getRow(106)->
    #show1Cfg {
    id = 106,
    showgroupid_1 = 105,
    showname_1 = "飞行萝卜",
    emotion = 1,
    head = 458,
    content = "不好，镇守出口的胖鱼大王出来了，主人，你可要小心。",
    show_wait = 2500
    };
getRow(107)->
    #show1Cfg {
    id = 107,
    showgroupid_1 = 500,
    showname_1 = "夏洛克船长",
    emotion = 1,
    head = 506,
    content = "注意，你已经接近海盗船了。千万小心  (っ•̀ω•́)っ",
    show_wait = 2500
    };
getRow(108)->
    #show1Cfg {
    id = 108,
    showgroupid_1 = 500,
    showname_1 = "0",
    emotion = 1,
    head = 0,
    content = "放心吧！",
    show_wait = 2500
    };
getRow(110)->
    #show1Cfg {
    id = 110,
    showgroupid_1 = 501,
    showname_1 = "魔族女战士",
    emotion = 1,
    head = 450,
    content = "真是废物，连个人都看不住，给我抓住他们。",
    show_wait = 1500
    };
getRow(111)->
    #show1Cfg {
    id = 111,
    showgroupid_1 = 502,
    showname_1 = "乌齐斯",
    emotion = 1,
    head = 455,
    content = "呵，你以为你们能逃出去，说出漂浮之石的下落，我会考虑放了你们。",
    show_wait = 1500
    };
getRow(112)->
    #show1Cfg {
    id = 112,
    showgroupid_1 = 502,
    showname_1 = "0",
    emotion = 1,
    head = 0,
    content = "你先告诉我漂浮之石是什么？我才知道是不是你要找的东西！",
    show_wait = 1500
    };
getRow(113)->
    #show1Cfg {
    id = 113,
    showgroupid_1 = 502,
    showname_1 = "乌齐斯",
    emotion = 1,
    head = 455,
    content = "漂浮之石是魔王阿尔赛德重生的关键之物，你拿了也没有用，不如交给我。",
    show_wait = 1500
    };
getRow(114)->
    #show1Cfg {
    id = 114,
    showgroupid_1 = 502,
    showname_1 = "0",
    emotion = 1,
    head = 0,
    content = "原来如此，可惜我并不知道它的下落",
    show_wait = 1500
    };
getRow(115)->
    #show1Cfg {
    id = 115,
    showgroupid_1 = 502,
    showname_1 = "乌齐斯",
    emotion = 1,
    head = 455,
    content = "竟然敢耍我，简直活腻了。",
    show_wait = 1500
    };
getRow(116)->
    #show1Cfg {
    id = 116,
    showgroupid_1 = 106,
    showname_1 = "莉安",
    emotion = 1,
    head = 459,
    content = "快使用刚学会的技能，击败敌人！",
    show_wait = 2500
    };
getRow(117)->
    #show1Cfg {
    id = 117,
    showgroupid_1 = 103,
    showname_1 = "露娜女神",
    emotion = 1,
    head = 451,
    content = "[fff000]【{PlayerName}】[-]就是现在！快使用你的觉醒之力，击败魔龙！",
    show_wait = 2500
    };
getRow(118)->
    #show1Cfg {
    id = 118,
    showgroupid_1 = 503,
    showname_1 = "黄金乌齐斯",
    emotion = 1,
    head = 460,
    content = "我！就是力量的化身！天命的毁灭者！末日的终结者！",
    show_wait = 2500
    };
getRow(119)->
    #show1Cfg {
    id = 119,
    showgroupid_1 = 503,
    showname_1 = "露娜女神",
    emotion = 1,
    head = 451,
    content = "[fff000]【{PlayerName}】[-]快使用你的觉醒之力！",
    show_wait = 2500
    };
getRow(122)->
    #show1Cfg {
    id = 122,
    showgroupid_1 = 107,
    showname_1 = "大白",
    emotion = 1,
    head = 464,
    content = "请跟随地面指示护送我到指定地点哟！",
    show_wait = 2500
    };
getRow(123)->
    #show1Cfg {
    id = 123,
    showgroupid_1 = 107,
    showname_1 = "大白",
    emotion = 1,
    head = 464,
    content = "如果离我太远了，可能会导致任务失败哟！",
    show_wait = 2500
    };
getRow(200)->
    #show1Cfg {
    id = 200,
    showgroupid_1 = 200,
    showname_1 = "龙息阿拉丁",
    emotion = 1,
    head = 4200,
    content = "站住！不许你打扰魔龙大人的休息！",
    show_wait = 2000
    };
getRow(201)->
    #show1Cfg {
    id = 201,
    showgroupid_1 = 201,
    showname_1 = "露娜女神",
    emotion = 1,
    head = 451,
    content = "[fff000]【{PlayerName}】[-]前面有魔龙气息，快去唤醒魔龙！",
    show_wait = 2000
    };
getRow(202)->
    #show1Cfg {
    id = 202,
    showgroupid_1 = 202,
    showname_1 = "幻境魔龙",
    emotion = 1,
    head = 20024,
    content = "冒险之路可没那么简单，让我来试试你的实力！",
    show_wait = 2000,
    show_talk = "m_306_1"
    };
getRow(203)->
    #show1Cfg {
    id = 203,
    showgroupid_1 = 203,
    showname_1 = "幻境魔龙",
    emotion = 1,
    head = 20024,
    content = "超越自己的枷锁吧！",
    show_wait = 2000,
    show_talk = "m_306_2"
    };
getRow(204)->
    #show1Cfg {
    id = 204,
    showgroupid_1 = 204,
    showname_1 = "露娜女神",
    emotion = 1,
    head = 451,
    content = "[fff000]【{PlayerName}】[-]你做的很好，巧妙运用觉醒之力可扭转战局",
    show_wait = 2000
    };
getRow(205)->
    #show1Cfg {
    id = 205,
    showgroupid_1 = 205,
    showname_1 = "神秘咕咕",
    emotion = 1,
    head = 9218,
    content = "咕~~咕~~咕！！是谁揪我咕咕的蘑菇头？咕咕不高兴！咕咕发怒了！",
    show_wait = 3000
    };
getRow(_)->[].

getKeyList()->[
    {103},
    {104},
    {106},
    {107},
    {108},
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
    {122},
    {123},
    {200},
    {201},
    {202},
    {203},
    {204},
    {205}
    ].

get1KeyList()->[
    103,
    104,
    106,
    107,
    108,
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
    122,
    123,
    200,
    201,
    202,
    203,
    204,
    205
    ].

