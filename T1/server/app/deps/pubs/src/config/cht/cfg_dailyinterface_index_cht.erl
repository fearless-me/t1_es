%% coding: latin-1
%%: 实现
-module(cfg_dailyinterface_index_cht).
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
    level = 35,
    describe_all = "[a6a6a6]守护露娜女神！[-]\n[ff6a00]多人活动,每日挑战获得装备升星材料[-]",
    main_output = [92],
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
    level = 23,
    describe_all = "[a6a6a6]\"我还会回来的！啊啊啊啊…！\"[-][ff6a00]多人活动,请尽可能提升自己的名次[-]",
    main_output = [3,201],
    begintime = "16:00~16:10",
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
    level = 11,
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
    level = 33,
    describe_all = "[a6a6a6]“守护好您的镜像、面对99个敌人吧！”[-][ff6a00]活动最多可支持100人参加！[-]",
    main_output = [3,240],
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
    level = 18,
    describe_all = "[a6a6a6]\"嘘...禁闭室里正关着一群调皮的大家伙.\"[-]\n[ff6a00]单人活动,每日挑战次数不限,凌晨4点重置关卡进度[-]",
    main_output = [1,221,63],
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
    level = 22,
    describe_all = "[a6a6a6]这注定是一场权利的游戏,关乎那个传说的终极.[-]\n[ff6a00]每日挑战获得钻石奖励,凌晨4点刷新次数[-]",
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
    level = 60,
    describe_all = "[a6a6a6]\"首领禁地中被几只强大的魔物霸占了.\"[-]\n[ff6a00]多人活动,杀戮地图，请注意安全[-]",
    main_output = [230,221,271,87,53,91],
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
    level = 40,
    describe_all = "[a6a6a6]\"在深红的深处寄居着一群可怕的恶魔.\"[-]\n[ff6a00]击杀恶魔获得硬币,兑换珍稀材料.杀戮地图,请注意安全[-]",
    main_output = [81,88,270,1801],
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
    position = 108,
    activity_icon = "12",
    rewardtype = [2],
    active_num = 0,
    level = 1,
    describe_all = "[a6a6a6]“为了家族的荣耀！”[-][ff6a00]。周一至周五为竞价阶段，竞价成功后获取参与资格。[-]",
    main_output = [81,88,270,1801],
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
    level = 15,
    describe_all = "[a6a6a6]\"全力奔跑吧，好好利用道具和加速带，注意陷阱.\"[-][ff6a00]报名时段为3分钟，千万别错过！[-]",
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
    level = 17,
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
    level = 20,
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
    level = 15,
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
    level = 14,
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
    level = 15,
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
    level = 17,
    describe_all = "勤劳的骑宠们既可以采集物资，也能去掠夺别人！\n[00ff00]每日可获得骑宠材料[-]",
    main_output = [201,4],
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
    level = 12,
    describe_all = "欢迎来到我的王国,在这里你可以尊称我为国王陛下.\n[00ff00]多人活动,每日挑战获得骑宠材料[-]",
    main_output = [93,94],
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
    level = 20,
    describe_all = "[a6a6a6]\"在场景内搜集武器、装备，争取最高击败次数\"[-]",
    main_output = [3,2601],
    begintime = "12:00~13:00\n19:00~20:00",
    button_string = "查看",
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
    level = 15,
    describe_all = "[a6a6a6]\"当音乐响起，你可愿与我共舞一曲~\"[-][ff6a00]参加尬舞，获得大量经验奖励！[-]",
    main_output = [1],
    begintime = "13:00~13:10\n20:00~20:10",
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
    position = 101,
    activity_icon = "6",
    rewardtype = [0],
    active_num = 0,
    level = 15,
    describe_all = "[a6a6a6]知识就是金钱，我的朋友~[-][ff6a00]参与答题，获取绑定钻石！[-]",
    main_output = [3,29001,29002,29003],
    begintime = "21:00~21:10",
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
    level = 18,
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
    level = 14,
    describe_all = "[a6a6a6]\"像我这么厉害的，还有九个！.\"[-][ff6a00]钻石贡献拿不停！[-]",
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
    level = 14,
    describe_all = "[a6a6a6]\"金钱与荣耀，一个都不能少！.\"[-][ff6a00]获胜将获得大量钻石、贡献奖励！[-]",
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
    level = 30,
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
    level = 1000,
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
    level = 1000,
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
    activitytype = 1,
    name = "幽界探险",
    position = 12,
    activity_icon = "active_wanfa_15",
    rewardtype = [2],
    active_num = 0,
    level = 40,
    describe_all = "[a6a6a6]幽界探险测试描述内容[-]\n[ff6a00]测试额外描述，还没有玩法图标哈[-]",
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
    {103},
    {104},
    {105},
    {106},
    {107},
    {999},
    {1000},
    {1002},
    {2002}
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
    103,
    104,
    105,
    106,
    107,
    999,
    1000,
    1002,
    2002
    ].

