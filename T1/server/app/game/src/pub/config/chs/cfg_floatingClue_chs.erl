%% coding: latin-1
%%: 实现
-module(cfg_floatingClue_chs).
-compile(export_all).
-include("cfg_floatingClue.hrl").
-include("logger.hrl").

getRow(1)->
    #floatingClueCfg {
    id = 1,
    pieceid = 1,
    type = 1,
    condid = 1,
    desc = "问问派诺考官现在是什么情况"
    };
getRow(2)->
    #floatingClueCfg {
    id = 2,
    pieceid = 1,
    type = 1,
    condid = 5,
    desc = "先去完成战斗考核吧"
    };
getRow(3)->
    #floatingClueCfg {
    id = 3,
    pieceid = 1,
    type = 1,
    condid = 10,
    desc = "把大白送回到小女孩那里吧"
    };
getRow(4)->
    #floatingClueCfg {
    id = 4,
    pieceid = 1,
    type = 1,
    condid = 11,
    desc = "看看爱兰夏勒有什么需要帮忙的吗"
    };
getRow(5)->
    #floatingClueCfg {
    id = 5,
    pieceid = 1,
    type = 1,
    condid = 16,
    desc = "去问问最后的考官塔沙勒蒂亚吧"
    };
getRow(6)->
    #floatingClueCfg {
    id = 6,
    pieceid = 1,
    type = 1,
    condid = 21,
    desc = "完成女神为你准备的觉醒仪式"
    };
getRow(7)->
    #floatingClueCfg {
    id = 7,
    pieceid = 1,
    type = 1,
    condid = 26,
    desc = "问问女神蓝色大陆到底发生了什么"
    };
getRow(8)->
    #floatingClueCfg {
    id = 8,
    pieceid = 1,
    type = 1,
    condid = 29,
    desc = "向夏普雷班船长请求帮助"
    };
getRow(9)->
    #floatingClueCfg {
    id = 9,
    pieceid = 1,
    type = 1,
    condid = 33,
    desc = "夺回乌齐斯手上的那块碎片"
    };
getRow(10)->
    #floatingClueCfg {
    id = 10,
    pieceid = 2,
    type = 1,
    condid = 51,
    desc = "去看看应该怎么前往阿克勒主城"
    };
getRow(11)->
    #floatingClueCfg {
    id = 11,
    pieceid = 2,
    type = 1,
    condid = 55,
    desc = "听听骑士队长有什么想说的"
    };
getRow(12)->
    #floatingClueCfg {
    id = 12,
    pieceid = 2,
    type = 1,
    condid = 57,
    desc = "快去营救那个被魔族围攻的骑士！"
    };
getRow(13)->
    #floatingClueCfg {
    id = 13,
    pieceid = 2,
    type = 1,
    condid = 59,
    desc = "快去抢救前面的伤员！"
    };
getRow(14)->
    #floatingClueCfg {
    id = 14,
    pieceid = 2,
    type = 1,
    condid = 62,
    desc = "去问问骑士领主是否知道漂浮之石的消息"
    };
getRow(15)->
    #floatingClueCfg {
    id = 15,
    pieceid = 2,
    type = 1,
    condid = 65,
    desc = "掩护骑士领主离开这里！"
    };
getRow(16)->
    #floatingClueCfg {
    id = 16,
    pieceid = 2,
    type = 1,
    condid = 67,
    desc = "看看衣帽间里面有什么好东西？"
    };
getRow(17)->
    #floatingClueCfg {
    id = 17,
    pieceid = 3,
    type = 1,
    condid = 69,
    desc = "悄悄地通过这个地方~"
    };
getRow(18)->
    #floatingClueCfg {
    id = 18,
    pieceid = 3,
    type = 1,
    condid = 72,
    desc = "点亮前面的红晶灯塔！"
    };
getRow(19)->
    #floatingClueCfg {
    id = 19,
    pieceid = 3,
    type = 1,
    condid = 76,
    desc = "把红晶灯塔的能量源装回去！"
    };
getRow(20)->
    #floatingClueCfg {
    id = 20,
    pieceid = 3,
    type = 1,
    condid = 79,
    desc = "吹响冲锋的号角吧！"
    };
getRow(21)->
    #floatingClueCfg {
    id = 21,
    pieceid = 3,
    type = 1,
    condid = 81,
    desc = "和骑士领主先冲锋突围再说吧~"
    };
getRow(22)->
    #floatingClueCfg {
    id = 22,
    pieceid = 3,
    type = 1,
    condid = 83,
    desc = "这个大家伙看起来有破绽"
    };
getRow(23)->
    #floatingClueCfg {
    id = 23,
    pieceid = 3,
    type = 1,
    condid = 85,
    desc = "怎么会被。。。史莱姆包围了！"
    };
getRow(24)->
    #floatingClueCfg {
    id = 24,
    pieceid = 3,
    type = 7,
    condid = 20112,
    desc = "将一只骑宠先提升到3级吧~"
    };
getRow(25)->
    #floatingClueCfg {
    id = 25,
    pieceid = 3,
    type = 1,
    condid = 87,
    desc = "这个史莱姆国王的皇冠上有什么东西！"
    };
getRow(26)->
    #floatingClueCfg {
    id = 26,
    pieceid = 4,
    type = 1,
    condid = 88,
    desc = "终于能够进入阿克勒城了~"
    };
getRow(27)->
    #floatingClueCfg {
    id = 27,
    pieceid = 4,
    type = 1,
    condid = 91,
    desc = "问问国王漂浮之石碎片的消息吧"
    };
getRow(28)->
    #floatingClueCfg {
    id = 28,
    pieceid = 4,
    type = 1,
    condid = 93,
    desc = "王城的后巷里好像有什么人。。。"
    };
getRow(29)->
    #floatingClueCfg {
    id = 29,
    pieceid = 4,
    type = 1,
    condid = 95,
    desc = "。。。有人在跟踪我！"
    };
getRow(30)->
    #floatingClueCfg {
    id = 30,
    pieceid = 4,
    type = 1,
    condid = 97,
    desc = "银行里会不会有漂浮之石碎片呢？"
    };
getRow(31)->
    #floatingClueCfg {
    id = 31,
    pieceid = 4,
    type = 1,
    condid = 99,
    desc = "向铁匠铺的老板打听一下吧"
    };
getRow(32)->
    #floatingClueCfg {
    id = 32,
    pieceid = 4,
    type = 1,
    condid = 101,
    desc = "听听蓝梦兄弟会的管家有什么说的？"
    };
getRow(33)->
    #floatingClueCfg {
    id = 33,
    pieceid = 5,
    type = 1,
    condid = 105,
    desc = "哇~获得了时装走秀的冠军呢"
    };
getRow(34)->
    #floatingClueCfg {
    id = 34,
    pieceid = 5,
    type = 1,
    condid = 109,
    desc = "向女仆打听一下主人的去向吧"
    };
getRow(35)->
    #floatingClueCfg {
    id = 35,
    pieceid = 5,
    type = 1,
    condid = 113,
    desc = "和弗洛多老爷聊聊这奇怪的事情"
    };
getRow(36)->
    #floatingClueCfg {
    id = 36,
    pieceid = 5,
    type = 1,
    condid = 117,
    desc = "向异魔人首领打听一下吧"
    };
getRow(37)->
    #floatingClueCfg {
    id = 37,
    pieceid = 5,
    type = 1,
    condid = 121,
    desc = "赶紧“化妆”一下！！！"
    };
getRow(38)->
    #floatingClueCfg {
    id = 38,
    pieceid = 5,
    type = 1,
    condid = 125,
    desc = "销毁这堆危险的炸药"
    };
getRow(39)->
    #floatingClueCfg {
    id = 39,
    pieceid = 5,
    type = 7,
    condid = 20015,
    desc = "完成总计4次装备精炼"
    };
getRow(40)->
    #floatingClueCfg {
    id = 40,
    pieceid = 5,
    type = 1,
    condid = 133,
    desc = "包围这群魔族的营地"
    };
getRow(41)->
    #floatingClueCfg {
    id = 41,
    pieceid = 5,
    type = 1,
    condid = 136,
    desc = "准备和异魔人一起战斗吧！"
    };
getRow(42)->
    #floatingClueCfg {
    id = 42,
    pieceid = 6,
    type = 1,
    condid = 137,
    desc = "封印这个危险的魔兽吧"
    };
getRow(43)->
    #floatingClueCfg {
    id = 43,
    pieceid = 6,
    type = 1,
    condid = 138,
    desc = "平息被封印的魔兽的怨气~"
    };
getRow(44)->
    #floatingClueCfg {
    id = 44,
    pieceid = 6,
    type = 1,
    condid = 139,
    desc = "异魔人首领好像有什么东西要送给我"
    };
getRow(45)->
    #floatingClueCfg {
    id = 45,
    pieceid = 6,
    type = 7,
    condid = 20000,
    desc = "在转职之前，先把战斗力提升到12000吧"
    };
getRow(46)->
    #floatingClueCfg {
    id = 46,
    pieceid = 6,
    type = 1,
    condid = 1000,
    desc = "去找本职业的转职人员问问看吧~"
    };
getRow(47)->
    #floatingClueCfg {
    id = 47,
    pieceid = 7,
    type = 1,
    condid = 140,
    desc = "漂浮之石之间似乎有特殊的感应？"
    };
getRow(48)->
    #floatingClueCfg {
    id = 48,
    pieceid = 7,
    type = 1,
    condid = 144,
    desc = "看看军队的士兵有什么需要帮忙的？"
    };
getRow(49)->
    #floatingClueCfg {
    id = 49,
    pieceid = 7,
    type = 1,
    condid = 148,
    desc = "准备攻城！"
    };
getRow(50)->
    #floatingClueCfg {
    id = 50,
    pieceid = 7,
    type = 1,
    condid = 151,
    desc = "抵挡魔族这一波强劲的反击！"
    };
getRow(51)->
    #floatingClueCfg {
    id = 51,
    pieceid = 7,
    type = 1,
    condid = 155,
    desc = "这里太冷了，要想办法搞件厚衣服！"
    };
getRow(52)->
    #floatingClueCfg {
    id = 52,
    pieceid = 7,
    type = 1,
    condid = 159,
    desc = "干掉那个魔族工头！"
    };
getRow(53)->
    #floatingClueCfg {
    id = 53,
    pieceid = 7,
    type = 1,
    condid = 165,
    desc = "敌军阵容散乱，趁机发起攻势！"
    };
getRow(54)->
    #floatingClueCfg {
    id = 54,
    pieceid = 7,
    type = 1,
    condid = 170,
    desc = "乔装之后去刺探军情！"
    };
getRow(55)->
    #floatingClueCfg {
    id = 55,
    pieceid = 7,
    type = 1,
    condid = 175,
    desc = "夺取指挥官身上的信物！"
    };
getRow(56)->
    #floatingClueCfg {
    id = 56,
    pieceid = 9,
    type = 1,
    condid = 176,
    desc = "这是什么奇怪的味道？硫磺！"
    };
getRow(57)->
    #floatingClueCfg {
    id = 57,
    pieceid = 9,
    type = 7,
    condid = 20081,
    desc = "至少穿戴2件红色装备加强一下吧~"
    };
getRow(58)->
    #floatingClueCfg {
    id = 58,
    pieceid = 9,
    type = 1,
    condid = 183,
    desc = "魔族的残余部队就在前面了！"
    };
getRow(59)->
    #floatingClueCfg {
    id = 59,
    pieceid = 9,
    type = 1,
    condid = 186,
    desc = "这个门怎么开了？"
    };
getRow(60)->
    #floatingClueCfg {
    id = 60,
    pieceid = 9,
    type = 1,
    condid = 200,
    desc = "小心！魔族军队来偷袭了！"
    };
getRow(61)->
    #floatingClueCfg {
    id = 61,
    pieceid = 9,
    type = 7,
    condid = 20144,
    desc = "强化一下你的骑宠装备吧，全部提升至10级"
    };
getRow(62)->
    #floatingClueCfg {
    id = 62,
    pieceid = 9,
    type = 1,
    condid = 208,
    desc = "攻破他们的防线！"
    };
getRow(63)->
    #floatingClueCfg {
    id = 63,
    pieceid = 9,
    type = 1,
    condid = 212,
    desc = "魔族看起来要抵挡不住了！"
    };
getRow(64)->
    #floatingClueCfg {
    id = 64,
    pieceid = 9,
    type = 1,
    condid = 216,
    desc = "这个神秘人是谁？"
    };
getRow(65)->
    #floatingClueCfg {
    id = 65,
    pieceid = 10,
    type = 1,
    condid = 217,
    desc = "这些能量块应该有很大的作用！"
    };
getRow(66)->
    #floatingClueCfg {
    id = 66,
    pieceid = 10,
    type = 1,
    condid = 220,
    desc = "找苍空祭祀帮忙解毒吧。。。"
    };
getRow(67)->
    #floatingClueCfg {
    id = 67,
    pieceid = 10,
    type = 1,
    condid = 223,
    desc = "神殿中好像有些不可告人的东西"
    };
getRow(68)->
    #floatingClueCfg {
    id = 68,
    pieceid = 10,
    type = 1,
    condid = 226,
    desc = "快打开这个机关！"
    };
getRow(69)->
    #floatingClueCfg {
    id = 69,
    pieceid = 10,
    type = 1,
    condid = 229,
    desc = "前往祈求者平台的路被魔族挡住了"
    };
getRow(70)->
    #floatingClueCfg {
    id = 70,
    pieceid = 10,
    type = 1,
    condid = 232,
    desc = "这。。这是！泯灭领主！"
    };
getRow(71)->
    #floatingClueCfg {
    id = 71,
    pieceid = 10,
    type = 7,
    condid = 20011,
    desc = "将全身装备升星至蓝色5星"
    };
getRow(72)->
    #floatingClueCfg {
    id = 72,
    pieceid = 10,
    type = 1,
    condid = 234,
    desc = "打听漂浮之石的下落"
    };
getRow(73)->
    #floatingClueCfg {
    id = 73,
    pieceid = 11,
    type = 7,
    condid = 20016,
    desc = "完成总计80次装备精炼"
    };
getRow(74)->
    #floatingClueCfg {
    id = 74,
    pieceid = 11,
    type = 1,
    condid = 240,
    desc = "咦？漂浮之石好像又有感应了！"
    };
getRow(75)->
    #floatingClueCfg {
    id = 75,
    pieceid = 11,
    type = 1,
    condid = 244,
    desc = "那边的峡谷里好像有什么东西！"
    };
getRow(76)->
    #floatingClueCfg {
    id = 76,
    pieceid = 11,
    type = 1,
    condid = 248,
    desc = "据说精灵故土上有一些神秘的存在"
    };
getRow(77)->
    #floatingClueCfg {
    id = 77,
    pieceid = 11,
    type = 1,
    condid = 252,
    desc = "精灵少年好像知道些什么呢"
    };
getRow(78)->
    #floatingClueCfg {
    id = 78,
    pieceid = 11,
    type = 1,
    condid = 256,
    desc = "想要通过这里的话要解决魔族的岗哨"
    };
getRow(79)->
    #floatingClueCfg {
    id = 79,
    pieceid = 11,
    type = 1,
    condid = 260,
    desc = "这些精灵。。。好像不太一样！"
    };
getRow(80)->
    #floatingClueCfg {
    id = 80,
    pieceid = 12,
    type = 1,
    condid = 261,
    desc = "执行魔化仪式的人要跑，快追！"
    };
getRow(81)->
    #floatingClueCfg {
    id = 81,
    pieceid = 12,
    type = 1,
    condid = 264,
    desc = "就是这个邪恶的魔族巫师！"
    };
getRow(82)->
    #floatingClueCfg {
    id = 82,
    pieceid = 12,
    type = 1,
    condid = 268,
    desc = "前往精灵们被囚禁的地方看看"
    };
getRow(83)->
    #floatingClueCfg {
    id = 83,
    pieceid = 12,
    type = 1,
    condid = 272,
    desc = "这群守卫拦住了去路！"
    };
getRow(84)->
    #floatingClueCfg {
    id = 84,
    pieceid = 12,
    type = 1,
    condid = 275,
    desc = "尝试把大家的力量聚集起来~"
    };
getRow(85)->
    #floatingClueCfg {
    id = 85,
    pieceid = 12,
    type = 1,
    condid = 278,
    desc = "准备一下攀爬这个悬崖吧"
    };
getRow(86)->
    #floatingClueCfg {
    id = 86,
    pieceid = 12,
    type = 7,
    condid = 20129,
    desc = "将一只红色品质的骑宠升到红色5星"
    };
getRow(87)->
    #floatingClueCfg {
    id = 87,
    pieceid = 12,
    type = 1,
    condid = 281,
    desc = "悄悄地扒走魔族的军需物资"
    };
getRow(88)->
    #floatingClueCfg {
    id = 88,
    pieceid = 13,
    type = 1,
    condid = 282,
    desc = "回到军中向大家汇报好消息吧~"
    };
getRow(89)->
    #floatingClueCfg {
    id = 89,
    pieceid = 13,
    type = 1,
    condid = 284,
    desc = "解救被囚禁的人吧"
    };
getRow(90)->
    #floatingClueCfg {
    id = 90,
    pieceid = 13,
    type = 1,
    condid = 286,
    desc = "率领大家继续进军吧~"
    };
getRow(91)->
    #floatingClueCfg {
    id = 91,
    pieceid = 13,
    type = 1,
    condid = 288,
    desc = "这些残余的魔族军队想跑！"
    };
getRow(92)->
    #floatingClueCfg {
    id = 92,
    pieceid = 13,
    type = 1,
    condid = 290,
    desc = "这些是魔族的亲卫队？小心！"
    };
getRow(93)->
    #floatingClueCfg {
    id = 93,
    pieceid = 13,
    type = 1,
    condid = 293,
    desc = "还有一个黄沙统领的右护将！"
    };
getRow(94)->
    #floatingClueCfg {
    id = 94,
    pieceid = 13,
    type = 7,
    condid = 20033,
    desc = "在装备上镶嵌至少4个3级纹章"
    };
getRow(95)->
    #floatingClueCfg {
    id = 95,
    pieceid = 13,
    type = 1,
    condid = 295,
    desc = "与大家分享胜利的果实吧~"
    };
getRow(96)->
    #floatingClueCfg {
    id = 96,
    pieceid = 14,
    type = 1,
    condid = 300,
    desc = "之前的黄沙统领逃跑了！追上去！"
    };
getRow(97)->
    #floatingClueCfg {
    id = 97,
    pieceid = 14,
    type = 1,
    condid = 303,
    desc = "拯救这些被魔化的精灵族人。"
    };
getRow(98)->
    #floatingClueCfg {
    id = 98,
    pieceid = 14,
    type = 7,
    condid = 20012,
    desc = "将全身装备升星至紫色5星"
    };
getRow(99)->
    #floatingClueCfg {
    id = 99,
    pieceid = 14,
    type = 1,
    condid = 309,
    desc = "想办法混进魔族的营地"
    };
getRow(100)->
    #floatingClueCfg {
    id = 100,
    pieceid = 14,
    type = 1,
    condid = 312,
    desc = "潜入到祭坛看看发生了什么"
    };
getRow(101)->
    #floatingClueCfg {
    id = 101,
    pieceid = 14,
    type = 1,
    condid = 315,
    desc = "这些魔族祭祀应该知道能量源的信息"
    };
getRow(102)->
    #floatingClueCfg {
    id = 102,
    pieceid = 14,
    type = 1,
    condid = 318,
    desc = "前面有一队魔族巡逻兵，解决他们！"
    };
getRow(103)->
    #floatingClueCfg {
    id = 103,
    pieceid = 14,
    type = 1,
    condid = 321,
    desc = "这难道是能量供给的源头？"
    };
getRow(104)->
    #floatingClueCfg {
    id = 104,
    pieceid = 14,
    type = 1,
    condid = 323,
    desc = "想办法停止这里的能量传送！"
    };
getRow(105)->
    #floatingClueCfg {
    id = 105,
    pieceid = 15,
    type = 1,
    condid = 324,
    desc = "现在你只能依靠你自己了！"
    };
getRow(106)->
    #floatingClueCfg {
    id = 106,
    pieceid = 15,
    type = 1,
    condid = 326,
    desc = "再坚持一下！这应该是最后的敌人了！"
    };
getRow(107)->
    #floatingClueCfg {
    id = 107,
    pieceid = 15,
    type = 1,
    condid = 328,
    desc = "黄沙统领好像逃往了魔族祭坛！"
    };
getRow(108)->
    #floatingClueCfg {
    id = 108,
    pieceid = 15,
    type = 1,
    condid = 330,
    desc = "再次打倒这个手下败将！"
    };
getRow(109)->
    #floatingClueCfg {
    id = 109,
    pieceid = 15,
    type = 1,
    condid = 332,
    desc = "看来无法避免与祭祀这场战斗了。。。"
    };
getRow(110)->
    #floatingClueCfg {
    id = 110,
    pieceid = 15,
    type = 7,
    condid = 20017,
    desc = "完成总计100次装备精炼"
    };
getRow(111)->
    #floatingClueCfg {
    id = 111,
    pieceid = 15,
    type = 1,
    condid = 336,
    desc = "前往交界的地方汇合吧"
    };
getRow(112)->
    #floatingClueCfg {
    id = 112,
    pieceid = 15,
    type = 1,
    condid = 339,
    desc = "听说剩下的精灵都在他们的\"避难所\""
    };
getRow(113)->
    #floatingClueCfg {
    id = 113,
    pieceid = 16,
    type = 1,
    condid = 350,
    desc = "精灵首领好像有什么话没说完。。。"
    };
getRow(114)->
    #floatingClueCfg {
    id = 114,
    pieceid = 16,
    type = 1,
    condid = 353,
    desc = "把噪音解决了的好消息告诉小姐姐吧"
    };
getRow(115)->
    #floatingClueCfg {
    id = 115,
    pieceid = 16,
    type = 7,
    condid = 20097,
    desc = "获得至少4件红色时装来装扮一下自己"
    };
getRow(116)->
    #floatingClueCfg {
    id = 116,
    pieceid = 16,
    type = 1,
    condid = 359,
    desc = "把这把钥匙还给它的主人吧"
    };
getRow(117)->
    #floatingClueCfg {
    id = 117,
    pieceid = 16,
    type = 1,
    condid = 362,
    desc = "帮助酒商解决他的问题吧"
    };
getRow(118)->
    #floatingClueCfg {
    id = 118,
    pieceid = 16,
    type = 1,
    condid = 365,
    desc = "那个可疑的人就躲在屋子里！"
    };
getRow(119)->
    #floatingClueCfg {
    id = 119,
    pieceid = 16,
    type = 1,
    condid = 368,
    desc = "这个精灵族人伤的很严重！想想办法！"
    };
getRow(120)->
    #floatingClueCfg {
    id = 120,
    pieceid = 16,
    type = 1,
    condid = 370,
    desc = "也许应该和异魔人首领交换一下情报？"
    };
getRow(121)->
    #floatingClueCfg {
    id = 121,
    pieceid = 17,
    type = 1,
    condid = 371,
    desc = "把这些钱交给酒商吧"
    };
getRow(122)->
    #floatingClueCfg {
    id = 122,
    pieceid = 17,
    type = 7,
    condid = 20001,
    desc = "将自己总战力提升到180000吧"
    };
getRow(123)->
    #floatingClueCfg {
    id = 123,
    pieceid = 17,
    type = 1,
    condid = 375,
    desc = "一路边走边喝吧~"
    };
getRow(124)->
    #floatingClueCfg {
    id = 124,
    pieceid = 17,
    type = 1,
    condid = 377,
    desc = "之前好像从哪儿得到过一个令牌啊？"
    };
getRow(125)->
    #floatingClueCfg {
    id = 125,
    pieceid = 17,
    type = 1,
    condid = 379,
    desc = "这个宴会。。。总觉得有奇怪的地方呢"
    };
getRow(126)->
    #floatingClueCfg {
    id = 126,
    pieceid = 17,
    type = 1,
    condid = 381,
    desc = "装成服务生打探一下消息吧"
    };
getRow(127)->
    #floatingClueCfg {
    id = 127,
    pieceid = 17,
    type = 7,
    condid = 20005,
    desc = "将骑宠的战力提升到30000吧"
    };
getRow(128)->
    #floatingClueCfg {
    id = 128,
    pieceid = 17,
    type = 1,
    condid = 386,
    desc = "这首\"挽歌\"终于要结束了。。。"
    };
getRow(129)->
    #floatingClueCfg {
    id = 129,
    pieceid = 17,
    type = 1,
    condid = 389,
    desc = "抢救一下这些伤员吧"
    };
getRow(130)->
    #floatingClueCfg {
    id = 130,
    pieceid = 18,
    type = 1,
    condid = 390,
    desc = "女神好像生气了！去问问为什么。。。"
    };
getRow(131)->
    #floatingClueCfg {
    id = 131,
    pieceid = 18,
    type = 1,
    condid = 392,
    desc = "别让这个魔族恶徒跑掉！"
    };
getRow(132)->
    #floatingClueCfg {
    id = 132,
    pieceid = 18,
    type = 1,
    condid = 394,
    desc = "继续追！！！"
    };
getRow(133)->
    #floatingClueCfg {
    id = 133,
    pieceid = 18,
    type = 1,
    condid = 396,
    desc = "就快追上了！"
    };
getRow(134)->
    #floatingClueCfg {
    id = 134,
    pieceid = 18,
    type = 1,
    condid = 398,
    desc = "不能让这个恶徒为所欲为！"
    };
getRow(135)->
    #floatingClueCfg {
    id = 135,
    pieceid = 18,
    type = 1,
    condid = 400,
    desc = "人们常说最大的敌人是。。。自己！"
    };
getRow(136)->
    #floatingClueCfg {
    id = 136,
    pieceid = 18,
    type = 7,
    condid = 20143,
    desc = "强化一下你的骑宠装备吧，全部提升至25级"
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
    {30},
    {31},
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
    {46},
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
    {136}
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
    30,
    31,
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
    46,
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
    136
    ].

