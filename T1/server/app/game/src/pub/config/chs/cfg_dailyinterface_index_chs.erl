%% coding: latin-1
%%: 实现
-module(cfg_dailyinterface_index_chs).
-compile(export_all).
-include("cfg_dailyinterface_index.hrl").
-include("logger.hrl").

getRow(1)->
    #dailyinterface_indexCfg {
    id = 1,
    activitytype = 1,
    name = "守护女神",
    position = 10,
    activity_icon = "active_wanfa_3",
    rewardtype = [2],
    active_num = 0,
    level = 70,
    describe_all = "[a6a6a6]守护露娜女神！[-]\n[ff6a00]多人活动,每日挑战获得装备升星材料[-]",
    main_output = [62],
    begintime = "全天开放",
    button_string = "查看",
    activity_background = ["0"],
    limited_icon = 0,
    vipShow = 0
    };
getRow(2)->
    #dailyinterface_indexCfg {
    id = 2,
    activitytype = 2,
    name = "首领入侵",
    position = 106,
    activity_icon = "1",
    rewardtype = [0],
    active_num = 0,
    level = 46,
    describe_all = "[a6a6a6]强大的怪物首领接连不断的到来！[-][ff6a00]击败一个首领还会有另一个到来[-]",
    main_output = [3,11000],
    begintime = "16:00~16:10\n21:20~21:30",
    button_string = "参与",
    activity_background = ["0"],
    limited_icon = 32,
    vipShow = 0
    };
getRow(4)->
    #dailyinterface_indexCfg {
    id = 4,
    activitytype = 1,
    name = "惊天喵盗团",
    position = 5,
    activity_icon = "active_wanfa_6",
    rewardtype = [1],
    active_num = 1,
    level = 38,
    describe_all = "[a6a6a6]\"一个都不许跑….别别别别…别跑啦！.\"[-]\n[ff6a00]单人活动,每日挑战获得大量金币[-]",
    main_output = [4],
    begintime = "全天开放",
    button_string = "查看",
    activity_background = ["Textures/UI/Base_Bg_23"],
    limited_icon = 0,
    vipShow = 2
    };
getRow(5)->
    #dailyinterface_indexCfg {
    id = 5,
    activitytype = 2,
    name = "世界守护",
    position = 105,
    activity_icon = "2",
    rewardtype = [0],
    active_num = 0,
    level = 62,
    describe_all = "[a6a6a6]“守护好您的镜像、面对99个敌人吧！”[-][ff6a00]活动最多可支持100人参加！[-]",
    main_output = [3,2601],
    begintime = "周一、周五\n22:00~22:10",
    button_string = "参与",
    activity_background = ["0"],
    limited_icon = 32,
    vipShow = 0
    };
getRow(13)->
    #dailyinterface_indexCfg {
    id = 13,
    activitytype = 1,
    name = "女神禁闭室",
    position = 4,
    activity_icon = "active_wanfa_9",
    rewardtype = [2],
    active_num = 0,
    level = 37,
    describe_all = "[a6a6a6]\"嘘...禁闭室里正关着一群调皮的大家伙.\"[-]\n[ff6a00]单人活动,每日挑战次数不限,凌晨4点重置关卡进度[-]",
    main_output = [1,221,63,99],
    begintime = "全天开放",
    button_string = "查看",
    activity_background = ["0"],
    limited_icon = 0,
    vipShow = 0
    };
getRow(16)->
    #dailyinterface_indexCfg {
    id = 16,
    activitytype = 4,
    name = "竞技场",
    position = 51,
    activity_icon = "active_wanfa_7",
    rewardtype = [2],
    active_num = 1,
    level = 43,
    describe_all = "[a6a6a6]这注定是一场权利的游戏,关乎那个传说的终极.[-]\n[ff6a00]每日挑战获得星月币奖励,凌晨4点刷新次数[-]",
    main_output = [3],
    begintime = "0",
    button_string = "查看",
    activity_background = ["0"],
    limited_icon = 0,
    vipShow = 0
    };
getRow(19)->
    #dailyinterface_indexCfg {
    id = 19,
    activitytype = 4,
    name = "首领禁地",
    position = 52,
    activity_icon = "active_wanfa_4",
    rewardtype = [2],
    active_num = 0,
    level = 120,
    describe_all = "[a6a6a6]\"首领禁地中被几只强大的魔物霸占了.\"[-]\n[ff6a00]多人活动,杀戮地图，请注意安全[-]",
    main_output = [4,270,53,91],
    begintime = "0",
    button_string = "查看",
    activity_background = ["0"],
    limited_icon = 0,
    vipShow = 0
    };
getRow(21)->
    #dailyinterface_indexCfg {
    id = 21,
    activitytype = 4,
    name = "深红熔渊",
    position = 53,
    activity_icon = "active_wanfa_2",
    rewardtype = [2],
    active_num = 0,
    level = 76,
    describe_all = "[a6a6a6]\"在深红的深处寄居着一群可怕的恶魔.\"[-]\n[ff6a00]击杀恶魔获得硬币,兑换珍稀材料.杀戮地图,请注意安全[-]",
    main_output = [81,270,53,1801],
    begintime = "12~次日2点",
    button_string = "前往",
    activity_background = ["0"],
    limited_icon = 0,
    vipShow = 0
    };
getRow(22)->
    #dailyinterface_indexCfg {
    id = 22,
    activitytype = 2,
    name = "家族精英联赛",
    position = 101,
    activity_icon = "12",
    rewardtype = [2],
    active_num = 0,
    level = 28,
    describe_all = "[a6a6a6]“为了家族的荣耀！”[-][ff6a00]。竞价时间：周一12点~周五8点[-]",
    main_output = [2601,23002,903,15101,15102,15103],
    begintime = "周五\n20:30~20:55",
    button_string = "参与",
    activity_background = ["0"],
    limited_icon = 32,
    vipShow = 0
    };
getRow(29)->
    #dailyinterface_indexCfg {
    id = 29,
    activitytype = 2,
    name = "骑宠竞速",
    position = 102,
    activity_icon = "3",
    rewardtype = [0],
    active_num = 0,
    level = 30,
    describe_all = "[a6a6a6]\"全力奔跑吧，好好利用道具和加速带，注意陷阱.\"[-][ff6a00]活动时段内报名即可参与匹配！[-]",
    main_output = [3,2601],
    begintime = "周二、周四、周日\n20:30~20:45",
    button_string = "参与",
    activity_background = ["0"],
    limited_icon = 32,
    vipShow = 0
    };
getRow(30)->
    #dailyinterface_indexCfg {
    id = 30,
    activitytype = 1,
    name = "经验升降梯",
    position = 6,
    activity_icon = "active_wanfa_8",
    rewardtype = [3],
    active_num = 1,
    level = 34,
    describe_all = "[00ff00]单人活动,每日挑战获得海量经验.[-]\n[ff6a00]当前层数：第{0}层  下一层等级： {1}[-]",
    main_output = [1],
    begintime = "全天开放",
    button_string = "前往",
    activity_background = ["Textures/UI/Base_Bg_50"],
    limited_icon = 0,
    vipShow = 1
    };
getRow(31)->
    #dailyinterface_indexCfg {
    id = 31,
    activitytype = 1,
    name = "元素保卫战",
    position = 9,
    activity_icon = "active_wanfa_13",
    rewardtype = [1,2],
    active_num = 0,
    level = 40,
    describe_all = "[a6a6a6]\"来一场漂亮的塔防守卫战吧！\"[-]\n[ff6a00]多人活动,每日挑战获得大量装备合成材料[-]",
    main_output = [97],
    begintime = "全天开放",
    button_string = "查看",
    activity_background = ["Textures/UI/Base_Bg_13"],
    limited_icon = 0,
    vipShow = 0
    };
getRow(32)->
    #dailyinterface_indexCfg {
    id = 32,
    activitytype = 1,
    name = "情缘任务",
    position = 11,
    activity_icon = "active_wanfa_10",
    rewardtype = [2],
    active_num = 0,
    level = 36,
    describe_all = "[a6a6a6]\"与伴侣共游蓝色大陆,探寻失落的传说与爱情.\"[-]\n[ff6a00]伴侣双人组队前往,每日完成获得稀有奖励[-]",
    main_output = [2601,32,86],
    begintime = "全天开放",
    button_string = "前往",
    activity_background = ["0"],
    limited_icon = 0,
    vipShow = 0
    };
getRow(33)->
    #dailyinterface_indexCfg {
    id = 33,
    activitytype = 2,
    name = "家族雪人",
    position = 103,
    activity_icon = "4",
    rewardtype = [0],
    active_num = 0,
    level = 28,
    describe_all = "[a6a6a6]\"冬天真冷啊，大家一起来堆个雪人吧！\"[-][ff6a00]参与家族堆雪人，获得大量家族贡献[-]",
    main_output = [3,11,13,15],
    begintime = "周二、周五\n21:30~21:40",
    button_string = "参与",
    activity_background = ["0"],
    limited_icon = 32,
    vipShow = 0
    };
getRow(35)->
    #dailyinterface_indexCfg {
    id = 35,
    activitytype = 1,
    name = "约会地下城",
    position = 7,
    activity_icon = "active_wanfa_14",
    rewardtype = [2],
    active_num = 0,
    level = 36,
    describe_all = "[a6a6a6]和好朋友一起玩儿点小游戏吧~[-]\n[ff6a00]和好友进入才能获得亲密度奖励哟~[-]",
    main_output = [2601,31,32],
    begintime = "全天开放",
    button_string = "查看",
    activity_background = ["0"],
    limited_icon = 0,
    vipShow = 0
    };
getRow(36)->
    #dailyinterface_indexCfg {
    id = 36,
    activitytype = 1,
    name = "骑宠领地",
    position = 2,
    activity_icon = "active_wanfa_5",
    rewardtype = [2],
    active_num = 0,
    level = 27,
    describe_all = "让勤劳的骑宠们去采集物资！\n[00ff00]每日可获得骑宠材料[-]",
    main_output = [2002,2003],
    begintime = "全天开放",
    button_string = "查看",
    activity_background = ["0"],
    limited_icon = 0,
    vipShow = 0
    };
getRow(37)->
    #dailyinterface_indexCfg {
    id = 37,
    activitytype = 1,
    name = "史莱姆秘境",
    position = 1,
    activity_icon = "active_wanfa_11",
    rewardtype = [2],
    active_num = 1,
    level = 24,
    describe_all = "欢迎来到我的王国,在这里你可以尊称我为国王陛下.\n[00ff00]多人活动,每日挑战获得骑宠材料[-]",
    main_output = [2002,93,94],
    begintime = "全天开放",
    button_string = "组队前往",
    activity_background = ["0"],
    limited_icon = 0,
    vipShow = 0
    };
getRow(38)->
    #dailyinterface_indexCfg {
    id = 38,
    activitytype = 2,
    name = "极地求生",
    position = 54,
    activity_icon = "11",
    rewardtype = [2],
    active_num = 1,
    level = 50,
    describe_all = "[a6a6a6]\"在场景内搜集武器、装备，所有人都是你的敌人\"[-]",
    main_output = [3,2601],
    begintime = "12:00~13:00\n19:00~20:00",
    button_string = "查看",
    activity_background = ["0"],
    limited_icon = 32,
    vipShow = 0
    };
getRow(39)->
    #dailyinterface_indexCfg {
    id = 39,
    activitytype = 1,
    name = "暗夜侵袭",
    position = 13,
    activity_icon = "active_wanfa_16",
    rewardtype = [2],
    active_num = 0,
    level = 100,
    describe_all = "[a6a6a6]\"僵尸部队大举入侵阿克勒，保卫我们的家园把\"[-]\n[ff6a00]單人活動,每日挑戰次數不限,需要购买门票进入 [-]",
    main_output = [23101,23102,23103,23107],
    begintime = "0",
    button_string = "前往",
    activity_background = ["0"],
    limited_icon = 32,
    vipShow = 0
    };
getRow(103)->
    #dailyinterface_indexCfg {
    id = 103,
    activitytype = 2,
    name = "限时广场舞",
    position = 104,
    activity_icon = "5",
    rewardtype = [0],
    active_num = 0,
    level = 30,
    describe_all = "[a6a6a6]\"当音乐响起，你可愿与我共舞一曲~\"[-][ff6a00]参加尬舞，获得大量经验奖励！[-]",
    main_output = [1],
    begintime = "13:00~13:30\n20:00~20:30",
    button_string = "参与",
    activity_background = ["0"],
    limited_icon = 32,
    vipShow = 0
    };
getRow(104)->
    #dailyinterface_indexCfg {
    id = 104,
    activitytype = 2,
    name = "全民答题",
    position = 108,
    activity_icon = "6",
    rewardtype = [0],
    active_num = 0,
    level = 30,
    describe_all = "[a6a6a6]知识就是金钱，我的朋友~[-][ff6a00]参与答题，获取星月币！[-]",
    main_output = [3,29001,29002,29003],
    begintime = "12:00~12:10\n21:00~21:10",
    button_string = "报名",
    activity_background = ["0"],
    limited_icon = 32,
    vipShow = 0
    };
getRow(105)->
    #dailyinterface_indexCfg {
    id = 105,
    activitytype = 1,
    name = "永不停歇",
    position = 8,
    activity_icon = "active_wanfa_12",
    rewardtype = [3],
    active_num = 0,
    level = 36,
    describe_all = "[a6a6a6]\"打怪兽，打怪兽，去野外打怪兽，经验蹭蹭蹭！~\"[-]\n[ff6a00]野外怪兽经验获取达到上限后,打怪经验大量衰减[-]",
    main_output = [4,52,221,96],
    begintime = "全天开放",
    button_string = "查看",
    activity_background = ["Textures/UI/Base_Bg_31"],
    limited_icon = 0,
    vipShow = 0
    };
getRow(106)->
    #dailyinterface_indexCfg {
    id = 106,
    activitytype = 2,
    name = "家族首领",
    position = 202,
    activity_icon = "8",
    rewardtype = [0],
    active_num = 0,
    level = 28,
    describe_all = "[a6a6a6]\"像我这么厉害的，还有九个！.\"[-][ff6a00]星月币贡献拿不停！[-]",
    main_output = [3,11,13,15],
    begintime = "周一、周四、周日\n21:30~21:40",
    button_string = "参与",
    activity_background = ["0"],
    limited_icon = 32,
    vipShow = 0
    };
getRow(107)->
    #dailyinterface_indexCfg {
    id = 107,
    activitytype = 2,
    name = "家族战",
    position = 107,
    activity_icon = "10",
    rewardtype = [0],
    active_num = 0,
    level = 28,
    describe_all = "[a6a6a6]\"金钱与荣耀，一个都不能少！.\"[-][ff6a00]获胜将获得大量星月币、贡献奖励！[-]",
    main_output = [3,11,13,15],
    begintime = "周三、周六\n21:30~21:45",
    button_string = "参与",
    activity_background = ["0"],
    limited_icon = 32,
    vipShow = 0
    };
getRow(999)->
    #dailyinterface_indexCfg {
    id = 999,
    activitytype = 1,
    name = "挑战副本",
    position = 3,
    activity_icon = "active_wanfa_1",
    rewardtype = [2],
    active_num = 0,
    level = 54,
    describe_all = "[a6a6a6]\"蓝色大陆上,还有很多未知的禁区等着你去冒险.\"[-]\n[ff6a00]每日挑战获得稀有材料,凌晨4点重置次数[-]",
    main_output = [98],
    begintime = "全天开放",
    button_string = "查看",
    activity_background = ["0"],
    limited_icon = 0,
    vipShow = 6
    };
getRow(1000)->
    #dailyinterface_indexCfg {
    id = 1000,
    activitytype = 0,
    name = "家族据点战（临时）",
    position = 201,
    activity_icon = "7",
    rewardtype = [0],
    active_num = 0,
    level = 2000,
    describe_all = "[a6a6a6]限时活动备用",
    main_output = [29001,29002,29003,29004],
    begintime = "全天开放",
    button_string = "参与",
    activity_background = ["0"],
    limited_icon = 0,
    vipShow = 0
    };
getRow(1002)->
    #dailyinterface_indexCfg {
    id = 1002,
    activitytype = 0,
    name = "沙滩派对（临时）",
    position = 203,
    activity_icon = "9",
    rewardtype = [0],
    active_num = 0,
    level = 2000,
    describe_all = "限时活动备用",
    main_output = [29001,29002,29003,29004],
    begintime = "全天开放",
    button_string = "参与",
    activity_background = ["0"],
    limited_icon = 0,
    vipShow = 0
    };
getRow(2002)->
    #dailyinterface_indexCfg {
    id = 2002,
    activitytype = 2,
    name = "幽界探险(双倍)",
    position = 12,
    activity_icon = "13",
    rewardtype = [2],
    active_num = 0,
    level = 40,
    describe_all = "[a6a6a6]前往幽界采集核心水晶。[-][ff6a00]所有采集将获得双倍收益！！[-]",
    main_output = [65],
    begintime = "16:30~17:00",
    button_string = "前往",
    activity_background = ["0"],
    limited_icon = 32,
    vipShow = 0
    };
getRow(2003)->
    #dailyinterface_indexCfg {
    id = 2003,
    activitytype = 1,
    name = "幽界探险",
    position = 14,
    activity_icon = "active_wanfa_15",
    rewardtype = [2],
    active_num = 0,
    level = 60,
    describe_all = "[a6a6a6]前往幽界采集核心水晶[-]\n[ff6a00]残酷的PVP玩法，建议组队进行！[-]",
    main_output = [65],
    begintime = "0",
    button_string = "前往",
    activity_background = ["0"],
    limited_icon = 32,
    vipShow = 0
    };
getRow(2004)->
    #dailyinterface_indexCfg {
    id = 2004,
    activitytype = 1,
    name = "婚礼现场",
    position = 15,
    activity_icon = "active_wanfa_15",
    rewardtype = [2],
    active_num = 0,
    level = 1000,
    describe_all = "服务器说的要配一个activity，那就配",
    main_output = [65],
    begintime = "0",
    button_string = "前往",
    activity_background = ["0"],
    limited_icon = 32,
    vipShow = 0
    };
getRow(_)->[].

getKeyList()->[
    {1},
    {2},
    {4},
    {5},
    {13},
    {16},
    {19},
    {21},
    {22},
    {29},
    {30},
    {31},
    {32},
    {33},
    {35},
    {36},
    {37},
    {38},
    {39},
    {103},
    {104},
    {105},
    {106},
    {107},
    {999},
    {1000},
    {1002},
    {2002},
    {2003},
    {2004}
    ].

get1KeyList()->[
    1,
    2,
    4,
    5,
    13,
    16,
    19,
    21,
    22,
    29,
    30,
    31,
    32,
    33,
    35,
    36,
    37,
    38,
    39,
    103,
    104,
    105,
    106,
    107,
    999,
    1000,
    1002,
    2002,
    2003,
    2004
    ].

