%% coding: latin-1
%%: 实现
-module(cfg_task_obj_cht).
-compile(export_all).
-include("cfg_task_obj.hrl").


getRow(1)->
    #task_objCfg {
    id = 1,
    type = 2,
    belong = "任务用采集物特效",
    name = "vfx_26_21",
    rotate = [0,0,0],
    scale = [1,1,1],
    attach = 0
    };
getRow(2)->
    #task_objCfg {
    id = 2,
    type = 1,
    belong = "星月岛木桌",
    name = "c%sc_object_zhuozi_01",
    location = [36.8,8.6,94.2],
    rotate = [0,7.14,0],
    scale = [1,1,1],
    maps = "map330",
    attach = 0
    };
getRow(3)->
    #task_objCfg {
    id = 3,
    type = 1,
    belong = "星月岛木桌粘液",
    name = "c%sc_object_nianye_01",
    location = [37.8,12.1,94.5],
    rotate = [2.5,15.0,-1.52],
    scale = [1,1,1],
    maps = "map330",
    attach = 1
    };
getRow(4)->
    #task_objCfg {
    id = 4,
    type = 1,
    belong = "星月岛木桶",
    name = "c%sc_object_mt_02",
    location = [107.4,4,115],
    rotate = [0,0,0],
    scale = [1,1,1],
    maps = "map330",
    attach = 1
    };
getRow(5)->
    #task_objCfg {
    id = 5,
    type = 1,
    belong = "星月岛木桶",
    name = "c%sc_object_mt_02",
    location = [107.4,4,115],
    rotate = [0,0,0],
    scale = [1,1,1],
    maps = "map330",
    attach = 0
    };
getRow(6)->
    #task_objCfg {
    id = 6,
    type = 2,
    belong = "草丛闪光",
    name = "vfx_26_21",
    location = [46,8,147],
    rotate = [0,0,0],
    scale = [1,1,1],
    maps = "map330",
    attach = 0
    };
getRow(8)->
    #task_objCfg {
    id = 8,
    type = 1,
    belong = "平原农具",
    name = "c%sc_object_nongju",
    location = [161,8.7,232.8],
    rotate = [0,0,0],
    scale = [1,1,1],
    maps = "map331",
    attach = 1
    };
getRow(9)->
    #task_objCfg {
    id = 9,
    type = 1,
    belong = "平原雕塑",
    name = "c%sc_object_diaoshu",
    location = [298.4,12.9,227.1],
    rotate = [0,-90,0],
    scale = [1,1,1],
    maps = "map331",
    attach = 1
    };
getRow(10)->
    #task_objCfg {
    id = 10,
    type = 1,
    belong = "苍空之塔武器架",
    name = "c%sc_object_wuqijia",
    location = [290,33,288],
    rotate = [0,-103.5,0],
    scale = [1,1,1],
    maps = "map324",
    attach = 1
    };
getRow(11)->
    #task_objCfg {
    id = 11,
    type = 2,
    belong = "任务用采集物特效",
    name = "vfx_26_21",
    rotate = [0,0,0],
    scale = [1,1,1],
    attach = 0
    };
getRow(12)->
    #task_objCfg {
    id = 12,
    type = 2,
    belong = "港口铃铛_特效",
    name = "vfx_26_21",
    location = [65.89,17.66,166.63],
    rotate = [0,0,0],
    scale = [1,1,1],
    maps = "map333",
    attach = 0
    };
getRow(13)->
    #task_objCfg {
    id = 13,
    type = 2,
    belong = "港口红木_特效",
    name = "vfx_26_21",
    location = [58,16.67,221],
    rotate = [0,8.6,0],
    scale = [1,1,1],
    maps = "map333",
    attach = 0
    };
getRow(14)->
    #task_objCfg {
    id = 14,
    type = 2,
    belong = "港口项链_特效",
    name = "vfx_26_21",
    location = [128.05,19.53,60.98],
    rotate = [0,0,0],
    scale = [1,1,1],
    maps = "map333",
    attach = 0
    };
getRow(15)->
    #task_objCfg {
    id = 15,
    type = 2,
    belong = "青梅-特效",
    name = "vfx_26_21",
    location = [120.39,33.41,123.37],
    rotate = [0,-90,0],
    scale = [1,1,1],
    maps = "map332",
    attach = 0
    };
getRow(16)->
    #task_objCfg {
    id = 16,
    type = 2,
    belong = "青梅-特效",
    name = "vfx_26_21",
    location = [122.33,32.73,121.26],
    rotate = [0,-90,0],
    scale = [1,1,1],
    maps = "map332",
    attach = 0
    };
getRow(17)->
    #task_objCfg {
    id = 17,
    type = 2,
    belong = "青梅-特效",
    name = "vfx_26_21",
    location = [125.48,32.29,121.28],
    rotate = [0,-90,0],
    scale = [1,1,1],
    maps = "map332",
    attach = 0
    };
getRow(18)->
    #task_objCfg {
    id = 18,
    type = 2,
    belong = "橄榄-特效",
    name = "vfx_26_21",
    location = [150.23,31.97,114.87],
    rotate = [0,0,0],
    scale = [1,1,1],
    maps = "map332",
    attach = 0
    };
getRow(19)->
    #task_objCfg {
    id = 19,
    type = 2,
    belong = "橄榄-特效",
    name = "vfx_26_21",
    location = [146.7,31.97,114.87],
    rotate = [0,0,0],
    scale = [1,1,1],
    maps = "map332",
    attach = 0
    };
getRow(20)->
    #task_objCfg {
    id = 20,
    type = 2,
    belong = "橄榄-特效",
    name = "vfx_26_21",
    location = [142.96,31.97,114.87],
    rotate = [0,0,0],
    scale = [1,1,1],
    maps = "map332",
    attach = 0
    };
getRow(21)->
    #task_objCfg {
    id = 21,
    type = 2,
    belong = "橄榄-特效",
    name = "vfx_26_21",
    location = [139.3,31.97,114.57],
    rotate = [0,0,0],
    scale = [1,1,1],
    maps = "map332",
    attach = 0
    };
getRow(22)->
    #task_objCfg {
    id = 22,
    type = 2,
    belong = "蓝血草-特效",
    name = "vfx_26_21",
    location = [158.71,8.7,88.98],
    rotate = [0,0,0],
    scale = [1,1,1],
    maps = "map331",
    attach = 0
    };
getRow(23)->
    #task_objCfg {
    id = 23,
    type = 2,
    belong = "蓝血草-特效",
    name = "vfx_26_21",
    location = [159.86,8.7,98.31],
    rotate = [0,0,0],
    scale = [1,1,1],
    maps = "map331",
    attach = 0
    };
getRow(24)->
    #task_objCfg {
    id = 24,
    type = 2,
    belong = "蓝血草-特效",
    name = "vfx_26_21",
    location = [159.43,8.7,93.37],
    rotate = [0,0,0],
    scale = [1,1,1],
    maps = "map331",
    attach = 0
    };
getRow(25)->
    #task_objCfg {
    id = 25,
    type = 2,
    belong = "薄荷草-特效",
    name = "vfx_26_21",
    location = [140.54,8.70,86.48],
    rotate = [0,0,0],
    scale = [1,1,1],
    maps = "map331",
    attach = 0
    };
getRow(26)->
    #task_objCfg {
    id = 26,
    type = 2,
    belong = "薄荷草-特效",
    name = "vfx_26_21",
    location = [140.55,8.70,83.46],
    rotate = [0,0,0],
    scale = [1,1,1],
    maps = "map331",
    attach = 0
    };
getRow(27)->
    #task_objCfg {
    id = 27,
    type = 2,
    belong = "薄荷草-特效",
    name = "vfx_26_21",
    location = [140.33,8.70,80.10],
    rotate = [0,0,0],
    scale = [1,1,1],
    maps = "map331",
    attach = 0
    };
getRow(28)->
    #task_objCfg {
    id = 28,
    type = 2,
    belong = "薄荷草-特效",
    name = "vfx_26_21",
    location = [140.44,8.70,76.65],
    rotate = [0,0,0],
    scale = [1,1,1],
    maps = "map331",
    attach = 0
    };
getRow(29)->
    #task_objCfg {
    id = 29,
    type = 2,
    belong = "鳞片-特效",
    name = "vfx_26_21",
    location = [122.81,8.70,141.73],
    rotate = [0,90,0],
    scale = [1,1,1],
    maps = "map331",
    attach = 0
    };
getRow(30)->
    #task_objCfg {
    id = 30,
    type = 2,
    belong = "生命之石特效",
    name = "vfx_26_21",
    location = [86.17,15.99,65.58],
    rotate = [0,178,0],
    scale = [1,1,1],
    maps = "map331",
    attach = 0
    };
getRow(31)->
    #task_objCfg {
    id = 31,
    type = 2,
    belong = "火龙果-特效",
    name = "vfx_26_21",
    location = [165.37,47.84,324.63],
    rotate = [0,0,0],
    scale = [1,1,1],
    maps = "map324",
    attach = 0
    };
getRow(32)->
    #task_objCfg {
    id = 32,
    type = 2,
    belong = "火龙果-特效",
    name = "vfx_26_21",
    location = [168.79,46.59,324.69],
    rotate = [0,0,0],
    scale = [1,1,1],
    maps = "map324",
    attach = 0
    };
getRow(33)->
    #task_objCfg {
    id = 33,
    type = 2,
    belong = "火龙果-特效",
    name = "vfx_26_21",
    location = [172.16,45.36,324.75],
    rotate = [0,0,0],
    scale = [1,1,1],
    maps = "map324",
    attach = 0
    };
getRow(34)->
    #task_objCfg {
    id = 34,
    type = 2,
    belong = "火龙果-特效",
    name = "vfx_26_21",
    location = [175.67,44.08,324.82],
    rotate = [0,0,0],
    scale = [1,1,1],
    maps = "map324",
    attach = 0
    };
getRow(35)->
    #task_objCfg {
    id = 35,
    type = 2,
    belong = "伏加特-特效",
    name = "vfx_26_21",
    location = [287.39,36.01,281.86],
    rotate = [0,0,0],
    scale = [1,1,1],
    maps = "map324",
    attach = 0
    };
getRow(36)->
    #task_objCfg {
    id = 36,
    type = 2,
    belong = "伏加特-特效",
    name = "vfx_26_21",
    location = [287.46,36.01,285.33],
    rotate = [0,0,0],
    scale = [1,1,1],
    maps = "map324",
    attach = 0
    };
getRow(37)->
    #task_objCfg {
    id = 37,
    type = 2,
    belong = "伏加特-特效",
    name = "vfx_26_21",
    location = [287.46,36.01,288.75],
    rotate = [0,0,0],
    scale = [1,1,1],
    maps = "map324",
    attach = 0
    };
getRow(38)->
    #task_objCfg {
    id = 38,
    type = 2,
    belong = "宝箱-特效",
    name = "vfx_26_21",
    location = [68.3,50.32,209.4],
    rotate = [0,0,0],
    scale = [1,1,1],
    maps = "map324",
    attach = 0
    };
getRow(40)->
    #task_objCfg {
    id = 40,
    type = 2,
    belong = "泰罗果-特效",
    name = "vfx_26_21",
    location = [119.64,7.62,240.41],
    rotate = [0,0,0],
    scale = [1,1,1],
    maps = "map326",
    attach = 0
    };
getRow(41)->
    #task_objCfg {
    id = 41,
    type = 2,
    belong = "泰罗果-特效",
    name = "vfx_26_21",
    location = [117.7,7.62,243.47],
    rotate = [0,0,0],
    scale = [1,1,1],
    maps = "map326",
    attach = 0
    };
getRow(42)->
    #task_objCfg {
    id = 42,
    type = 2,
    belong = "泰罗果-特效",
    name = "vfx_26_21",
    location = [115.52,7.62,246.41],
    rotate = [0,0,0],
    scale = [1,1,1],
    maps = "map326",
    attach = 0
    };
getRow(43)->
    #task_objCfg {
    id = 43,
    type = 2,
    belong = "泰罗果-特效",
    name = "vfx_26_21",
    location = [113.75,7.62,249.29],
    rotate = [0,0,0],
    scale = [1,1,1],
    maps = "map326",
    attach = 0
    };
getRow(44)->
    #task_objCfg {
    id = 44,
    type = 2,
    belong = "冰焰草-特效",
    name = "vfx_26_21",
    location = [127.93,7.62,270.23],
    rotate = [0,0,0],
    scale = [1,1,1],
    maps = "map326",
    attach = 0
    };
getRow(45)->
    #task_objCfg {
    id = 45,
    type = 2,
    belong = "冰焰草-特效",
    name = "vfx_26_21",
    location = [131.26,7.62,270.23],
    rotate = [0,0,0],
    scale = [1,1,1],
    maps = "map326",
    attach = 0
    };
getRow(46)->
    #task_objCfg {
    id = 46,
    type = 2,
    belong = "冰焰草-特效",
    name = "vfx_26_21",
    location = [134.59,7.62,270.23],
    rotate = [0,0,0],
    scale = [1,1,1],
    maps = "map326",
    attach = 0
    };
getRow(47)->
    #task_objCfg {
    id = 47,
    type = 2,
    belong = "冰焰草-特效",
    name = "vfx_26_21",
    location = [137.67,7.62,270.23],
    rotate = [0,0,0],
    scale = [1,1,1],
    maps = "map326",
    attach = 0
    };
getRow(48)->
    #task_objCfg {
    id = 48,
    type = 2,
    belong = "冰焰草-特效",
    name = "vfx_26_21",
    location = [140.95,7.62,270.23],
    rotate = [0,0,0],
    scale = [1,1,1],
    maps = "map326",
    attach = 0
    };
getRow(50)->
    #task_objCfg {
    id = 50,
    type = 1,
    belong = "考核结束时派诺",
    name = "c%sc_object_gsp_02",
    location = [79,20.15,129.2],
    rotate = [0,-20,0],
    scale = [1,1,1],
    maps = "map333",
    attach = 0
    };
getRow(51)->
    #task_objCfg {
    id = 51,
    type = 1,
    belong = "考核结束时告示牌",
    name = "n%n_47",
    location = [79,20.15,129.2],
    rotate = [0,-20,0],
    scale = [1,1,1],
    maps = "map333",
    attach = 0
    };
getRow(52)->
    #task_objCfg {
    id = 52,
    type = 2,
    belong = "告示牌光效",
    name = "vfx_26_21",
    location = [79,20.15,129.2],
    rotate = [0,-20,0],
    scale = [1,1,1],
    maps = "map333",
    attach = 0
    };
getRow(53)->
    #task_objCfg {
    id = 53,
    type = 2,
    belong = "告示牌光效",
    name = "vfx_26_4",
    location = [79,20.15,129.2],
    rotate = [0,-20,0],
    scale = [1,1,1],
    maps = "map333",
    attach = 0
    };
getRow(60)->
    #task_objCfg {
    id = 60,
    type = 1,
    belong = "学霸托比赏花",
    name = "n%n_41",
    location = [277.91,21.41,248.49],
    rotate = [0,-109.5,0],
    scale = [1,1,1],
    maps = "map333",
    attach = 0
    };
getRow(61)->
    #task_objCfg {
    id = 61,
    type = 1,
    belong = "史莱姆出现",
    name = "m%m_1!",
    location = [216.98,21.39,193.01],
    rotate = [0,-145.93,0],
    scale = [1,1,1],
    maps = "map333",
    attach = 0
    };
getRow(62)->
    #task_objCfg {
    id = 62,
    type = 2,
    belong = "觉醒副本特效",
    name = "vfx_26_21",
    location = [69.35,21.72,77.35],
    rotate = [0,0,0],
    scale = [2,2,2],
    maps = "map333",
    attach = 0
    };
getRow(63)->
    #task_objCfg {
    id = 63,
    type = 1,
    belong = "采集布娃娃",
    name = "n%n_76",
    location = [220.06,21.39,200.31],
    rotate = [0,-30,0],
    scale = [1,1,1],
    maps = "map333",
    attach = 0
    };
getRow(64)->
    #task_objCfg {
    id = 64,
    type = 1,
    belong = "安娜跟随后出现",
    name = "m%m_82",
    location = [114.84,19.55,61.65],
    rotate = [0,0,0],
    scale = [1,1,1],
    maps = "map333",
    attach = 0
    };
getRow(65)->
    #task_objCfg {
    id = 65,
    type = 1,
    belong = "安娜失踪后出现",
    name = "m%m_82",
    location = [81.3,17.89,215.8],
    rotate = [0,0,0],
    scale = [1,1,1],
    maps = "map333",
    attach = 0
    };
getRow(66)->
    #task_objCfg {
    id = 66,
    type = 2,
    belong = "港口动态特效",
    name = "vfx_26_36",
    location = [65.52,17.88294,171.5],
    rotate = [0,0,0],
    scale = [2,2,2],
    maps = "map333",
    attach = 0
    };
getRow(67)->
    #task_objCfg {
    id = 67,
    type = 2,
    belong = "骑宠副本特效",
    name = "vfx_26_21",
    location = [160.9,17.08,210.7],
    rotate = [0,0,0],
    scale = [2,2,2],
    maps = "map333",
    attach = 0
    };
getRow(68)->
    #task_objCfg {
    id = 68,
    type = 1,
    belong = "寻找大白2踪迹",
    name = "c%sc_object_nianye_01",
    location = [273,24.9,113.6],
    rotate = [0,0,0],
    scale = [0.8,0.8,0.8],
    maps = "map333",
    attach = 0
    };
getRow(69)->
    #task_objCfg {
    id = 69,
    type = 1,
    belong = "寻找大白3-大白",
    name = "m%m_81!",
    location = [179.58,21.3,80.06],
    rotate = [0,-174.12,0],
    scale = [2,2,2],
    maps = "map333",
    attach = 0
    };
getRow(70)->
    #task_objCfg {
    id = 70,
    type = 1,
    belong = "寻找大白2踪迹",
    name = "c%sc_object_nianye_01",
    location = [284.2,21.7,80.5],
    rotate = [0,0,0],
    scale = [0.8,0.8,0.8],
    maps = "map333",
    attach = 0
    };
getRow(71)->
    #task_objCfg {
    id = 71,
    type = 1,
    belong = "寻找大白3-红海龟",
    name = "m%m_508!",
    location = [178.15,19.94,74.37],
    rotate = [0,11.6,0],
    scale = [1.2,1.2,1.2],
    maps = "map333",
    attach = 0
    };
getRow(72)->
    #task_objCfg {
    id = 72,
    type = 1,
    belong = "绑架安娜的炸弹头头",
    name = "m%m_14",
    location = [64.31,21.7,70.84],
    rotate = [0,-122.15,0],
    scale = [1.2,1.2,1.2],
    maps = "map333",
    attach = 0
    };
getRow(73)->
    #task_objCfg {
    id = 73,
    type = 1,
    belong = "绑架安娜位面后的安娜",
    name = "m%m_82",
    location = [81.22,20.91,94.92],
    rotate = [0,-119,0],
    scale = [1,1,1],
    maps = "map333",
    attach = 0
    };
getRow(74)->
    #task_objCfg {
    id = 74,
    type = 1,
    belong = "海盗小喽喽",
    name = "m%m_116",
    location = [71.44,16.61,265.38],
    rotate = [0,-160,0],
    scale = [1,1,1],
    maps = "map333",
    attach = 0
    };
getRow(75)->
    #task_objCfg {
    id = 75,
    type = 1,
    belong = "海盗小喽喽",
    name = "m%m_116",
    location = [68.9,16.52,267.25],
    rotate = [0,-160,0],
    scale = [1,1,1],
    maps = "map333",
    attach = 0
    };
getRow(76)->
    #task_objCfg {
    id = 76,
    type = 1,
    belong = "海盗小喽喽",
    name = "m%m_116",
    location = [65.54,16.41,268.54],
    rotate = [0,-160,0],
    scale = [1,1,1],
    maps = "map333",
    attach = 0
    };
getRow(77)->
    #task_objCfg {
    id = 77,
    type = 1,
    belong = "海盗小喽喽",
    name = "m%m_116",
    location = [62,16.5,269.41],
    rotate = [0,-160,0],
    scale = [1,1,1],
    maps = "map333",
    attach = 0
    };
getRow(78)->
    #task_objCfg {
    id = 78,
    type = 1,
    belong = "猫绅士右2",
    name = "n%n_400",
    location = [52.14,16.65,233.1],
    rotate = [0,90,0],
    scale = [1,1,1],
    maps = "map333",
    attach = 0
    };
getRow(79)->
    #task_objCfg {
    id = 79,
    type = 1,
    belong = "猫绅士右3",
    name = "n%n_200",
    location = [51.7,16.65,236.31],
    rotate = [0,90,0],
    scale = [1,1,1],
    maps = "map333",
    attach = 0
    };
getRow(80)->
    #task_objCfg {
    id = 80,
    type = 2,
    belong = "位面点光效",
    name = "vfx_26_4",
    location = [146.13,18.38,158.5],
    rotate = [0,0,0],
    scale = [1,1,1],
    maps = "map333",
    attach = 0
    };
getRow(81)->
    #task_objCfg {
    id = 81,
    type = 2,
    belong = "武器架光效",
    name = "vfx_26_21",
    location = [108.46,18.38,176.5],
    rotate = [0,180,0],
    scale = [1.5,1.5,1.5],
    maps = "map333",
    attach = 0
    };
getRow(82)->
    #task_objCfg {
    id = 82,
    type = 2,
    belong = "武器架光效",
    name = "vfx_26_4",
    location = [108.46,18.38,176.5],
    rotate = [0,180,0],
    scale = [1.5,1.5,1.5],
    maps = "map333",
    attach = 0
    };
getRow(83)->
    #task_objCfg {
    id = 83,
    type = 1,
    belong = "史莱姆的踪迹1",
    name = "m%m_5",
    location = [213.546,21.28,199.92],
    rotate = [0,21.287,0],
    scale = [1,1,1],
    maps = "map333",
    attach = 0
    };
getRow(84)->
    #task_objCfg {
    id = 84,
    type = 1,
    belong = "史莱姆的踪迹2",
    name = "m%m_5",
    location = [216.48,21.28,199.93],
    rotate = [0,0,0],
    scale = [1,1,1],
    maps = "map333",
    attach = 0
    };
getRow(85)->
    #task_objCfg {
    id = 85,
    type = 1,
    belong = "史莱姆的踪迹3",
    name = "m%m_5",
    location = [219.21,21.28,199.94],
    rotate = [0,21.287,2],
    scale = [1,1,1],
    maps = "map333",
    attach = 0
    };
getRow(86)->
    #task_objCfg {
    id = 86,
    type = 1,
    belong = "史莱姆的踪迹4",
    name = "m%m_5",
    location = [221.38,21.28,199.95],
    rotate = [0,0,0],
    scale = [1,1,1],
    maps = "map333",
    attach = 0
    };
getRow(87)->
    #task_objCfg {
    id = 87,
    type = 1,
    belong = "武器架",
    name = "c%sc_object_wuqijia",
    location = [108.46,18.38,176.5],
    rotate = [0,-92,0],
    scale = [0.3,0.3,0.3],
    maps = "map333",
    attach = 0
    };
getRow(88)->
    #task_objCfg {
    id = 88,
    type = 1,
    belong = "托比的骑宠",
    name = "m%m_545",
    location = [282.52,21.41,247.41],
    rotate = [0,-140,0],
    scale = [0.4,0.4,0.4],
    maps = "map333",
    attach = 0
    };
getRow(89)->
    #task_objCfg {
    id = 89,
    type = 1,
    belong = "罗撒特出现",
    name = "m%m_331",
    location = [87.93,16.73,245.71],
    rotate = [0,-140.13,0],
    scale = [1.5,1.5,1.5],
    maps = "map333",
    attach = 0
    };
getRow(90)->
    #task_objCfg {
    id = 90,
    type = 2,
    belong = "考核通过的特效",
    name = "plot\vfx_29_27",
    location = [79,20.15,129.2],
    rotate = [0,0,0],
    scale = [1,1,1],
    maps = "map333",
    attach = 0
    };
getRow(91)->
    #task_objCfg {
    id = 91,
    type = 1,
    belong = "绑架安娜位面后的安娜",
    name = "m%m_82",
    location = [75.52,21.58,65.37],
    rotate = [0,31.43,0],
    scale = [1,1,1],
    maps = "map333",
    attach = 0
    };
getRow(92)->
    #task_objCfg {
    id = 92,
    type = 1,
    belong = "绑架怪物1",
    name = "m%m_56",
    location = [79.86,21,56.9],
    rotate = [0,-21.1,0],
    scale = [1,1,1],
    maps = "map333",
    attach = 0
    };
getRow(93)->
    #task_objCfg {
    id = 93,
    type = 1,
    belong = "绑架怪物2",
    name = "m%m_14",
    location = [69.37,21.14,57.81],
    rotate = [0,35.72,0],
    scale = [1.5,1.5,1.5],
    maps = "map333",
    attach = 0
    };
getRow(94)->
    #task_objCfg {
    id = 94,
    type = 1,
    belong = "绑架怪物3",
    name = "m%m_56",
    location = [64.1,20.79,66.99],
    rotate = [0,100.34,0],
    scale = [1,1,1],
    maps = "map333",
    attach = 0
    };
getRow(95)->
    #task_objCfg {
    id = 95,
    type = 1,
    belong = "绑架怪物4",
    name = "m%m_14",
    location = [70.99,21.68,74.61],
    rotate = [0,118.47,0],
    scale = [1.5,1.5,1.5],
    maps = "map333",
    attach = 0
    };
getRow(96)->
    #task_objCfg {
    id = 96,
    type = 1,
    belong = "绑架怪物5",
    name = "m%m_56",
    location = [79.12,21.18,72.46],
    rotate = [0,-144.72,0],
    scale = [1,1,1],
    maps = "map333",
    attach = 0
    };
getRow(97)->
    #task_objCfg {
    id = 97,
    type = 1,
    belong = "绑架怪物6",
    name = "m%m_14",
    location = [84.04,21.29,66.46],
    rotate = [0,-113.45,0],
    scale = [1.5,1.5,1.5],
    maps = "map333",
    attach = 0
    };
getRow(98)->
    #task_objCfg {
    id = 98,
    type = 1,
    belong = "骑宠胡萝卜",
    name = "m%m_506",
    location = [108.56,17.67,165.7],
    rotate = [0,42.74,0],
    scale = [1,1,1],
    maps = "map333",
    attach = 0
    };
getRow(100)->
    #task_objCfg {
    id = 100,
    type = 1,
    belong = "金大胖出现",
    name = "m%m_26",
    location = [226.8,33.2,255.11],
    rotate = [0,171.57,0],
    scale = [2.7,2.7,2.7],
    maps = "map332",
    attach = 0
    };
getRow(101)->
    #task_objCfg {
    id = 101,
    type = 1,
    belong = "金中胖出现",
    name = "m%m_26",
    location = [243.28,33.2,255.11],
    rotate = [0,171.57,0],
    scale = [2.2,2.2,2.2],
    maps = "map332",
    attach = 0
    };
getRow(102)->
    #task_objCfg {
    id = 102,
    type = 1,
    belong = "金小胖出现",
    name = "m%m_26",
    location = [256.32,33.2,255.1],
    rotate = [0,171.57,0],
    scale = [1.2,1.2,1.2],
    maps = "map332",
    attach = 0
    };
getRow(103)->
    #task_objCfg {
    id = 103,
    type = 1,
    belong = "美味蟹肉",
    name = "c%sc_object_xuedui_01",
    location = [187.42,25.09,90.19],
    rotate = [0,0,0],
    scale = [0.5,0.5,0.5],
    maps = "map332",
    attach = 0
    };
getRow(104)->
    #task_objCfg {
    id = 104,
    type = 2,
    belong = "美味蟹肉特效",
    name = "vfx_26_21",
    location = [187.42,25.09,90.19],
    rotate = [0,0,0],
    scale = [1,1,1],
    maps = "map332",
    attach = 0
    };
getRow(105)->
    #task_objCfg {
    id = 105,
    type = 1,
    belong = "吹响号角后追随的骑士",
    name = "n%n_42",
    location = [257.69,34.54,140.5],
    rotate = [0,71.12,0],
    scale = [1,1,1],
    maps = "map332",
    attach = 0
    };
getRow(106)->
    #task_objCfg {
    id = 106,
    type = 1,
    belong = "吹响号角后追随的骑士",
    name = "n%n_46",
    location = [255.58,34.54,136.8],
    rotate = [0,71.12,0],
    scale = [1,1,1],
    maps = "map332",
    attach = 0
    };
getRow(107)->
    #task_objCfg {
    id = 107,
    type = 1,
    belong = "吹响号角后追随的骑士",
    name = "n%n_46",
    location = [254.05,34.54,133.45],
    rotate = [0,71.12,0],
    scale = [1,1,1],
    maps = "map332",
    attach = 0
    };
getRow(108)->
    #task_objCfg {
    id = 108,
    type = 1,
    belong = "吹响号角后追随的骑士",
    name = "n%n_42",
    location = [253.01,34.54,129.53],
    rotate = [0,71.12,0],
    scale = [1,1,1],
    maps = "map332",
    attach = 0
    };
getRow(109)->
    #task_objCfg {
    id = 109,
    type = 1,
    belong = "吹响号角后追随的骑士",
    name = "n%n_46",
    location = [252.53,34.54,125.21],
    rotate = [0,71.12,0],
    scale = [1,1,1],
    maps = "map332",
    attach = 0
    };
getRow(110)->
    #task_objCfg {
    id = 110,
    type = 1,
    belong = "吹响号角后骑士领主",
    name = "n%n_46",
    location = [261.03,34.54,133.65],
    rotate = [0,-71.12,0],
    scale = [1,1,1],
    maps = "map332",
    attach = 0
    };
getRow(113)->
    #task_objCfg {
    id = 113,
    type = 1,
    belong = "大风营救I魔族小鬼",
    name = "m%m_78",
    location = [127.29,32.4,129.52],
    rotate = [0,96.9,0],
    scale = [1,1,1],
    maps = "map332",
    attach = 0
    };
getRow(114)->
    #task_objCfg {
    id = 114,
    type = 1,
    belong = "大风营救I魔族女战士",
    name = "m%m_30",
    location = [117.7,33.97,128.91],
    rotate = [0,76.28,0],
    scale = [1,1,1],
    maps = "map332",
    attach = 0
    };
getRow(116)->
    #task_objCfg {
    id = 116,
    type = 1,
    belong = "护送宝马后领主",
    name = "m%m_118",
    location = [96.56,34.48,217.95],
    rotate = [0,163.85,0],
    scale = [1.2,1.2,1.2],
    maps = "map332",
    attach = 0
    };
getRow(117)->
    #task_objCfg {
    id = 117,
    type = 1,
    belong = "护送宝马后宝马",
    name = "m%m_502",
    location = [100.36,34.48,218.09],
    rotate = [0,163.85,1],
    scale = [1,1,1],
    maps = "map332",
    attach = 0
    };
getRow(120)->
    #task_objCfg {
    id = 120,
    type = 2,
    belong = "吹响号角后的特效",
    name = "vfx_26_37",
    location = [295.09,69,125.91],
    rotate = [0,0,0],
    scale = [2,2,2],
    maps = "map332",
    attach = 0
    };
getRow(125)->
    #task_objCfg {
    id = 125,
    type = 1,
    belong = "护送宝马处魔族包围",
    name = "m%m_54",
    location = [98,39,167],
    rotate = [0,-140,0],
    scale = [1,1,1],
    maps = "map332",
    attach = 0
    };
getRow(126)->
    #task_objCfg {
    id = 126,
    type = 1,
    belong = "护送宝马处魔族包围",
    name = "m%m_54",
    location = [104,38,172],
    rotate = [0,-140,0],
    scale = [1,1,1],
    maps = "map332",
    attach = 0
    };
getRow(127)->
    #task_objCfg {
    id = 127,
    type = 1,
    belong = "护送宝马处魔族包围",
    name = "m%m_54",
    location = [106,36,178],
    rotate = [0,-140,0],
    scale = [1,1,1],
    maps = "map332",
    attach = 0
    };
getRow(128)->
    #task_objCfg {
    id = 128,
    type = 1,
    belong = "护送宝马处魔族包围",
    name = "m%m_54",
    location = [110,35,183],
    rotate = [0,-140,0],
    scale = [1,1,1],
    maps = "map332",
    attach = 0
    };
getRow(129)->
    #task_objCfg {
    id = 129,
    type = 1,
    belong = "护送宝马处魔族包围",
    name = "m%m_27",
    location = [106,34,190],
    rotate = [0,148,0],
    scale = [1,1,1],
    maps = "map332",
    attach = 0
    };
getRow(130)->
    #task_objCfg {
    id = 130,
    type = 1,
    belong = "护送宝马处魔族包围",
    name = "m%m_27",
    location = [100,34,198],
    rotate = [0,169,0],
    scale = [1,1,1],
    maps = "map332",
    attach = 0
    };
getRow(131)->
    #task_objCfg {
    id = 131,
    type = 1,
    belong = "护送宝马处魔族包围",
    name = "m%m_27",
    location = [100,34.5,208],
    rotate = [0,172,0],
    scale = [1,1,1],
    maps = "map332",
    attach = 0
    };
getRow(132)->
    #task_objCfg {
    id = 132,
    type = 1,
    belong = "阅读地图",
    name = "c%sc_object_sj_01",
    location = [185.32,23.13,72.8],
    rotate = [0,111.24,0],
    scale = [1,1,1],
    maps = "map332",
    attach = 0
    };
getRow(152)->
    #task_objCfg {
    id = 152,
    type = 1,
    belong = "主城-打劫现场调查",
    name = "m%m_57",
    location = [111,6.38,256],
    rotate = [0,-55,-88],
    scale = [2,2,2],
    maps = "map340",
    attach = 0
    };
getRow(153)->
    #task_objCfg {
    id = 153,
    type = 1,
    belong = "主城-打劫现场调查",
    name = "m%m_57",
    location = [114,6.38,258],
    rotate = [0,-55,-88],
    scale = [2,2,2],
    maps = "map340",
    attach = 0
    };
getRow(154)->
    #task_objCfg {
    id = 154,
    type = 1,
    belong = "主城-打劫现场调查",
    name = "m%m_57",
    location = [111,6.38,256],
    rotate = [0,-3.4,-88],
    scale = [2,2,2],
    maps = "map340",
    attach = 0
    };
getRow(155)->
    #task_objCfg {
    id = 155,
    type = 2,
    belong = "主城-打劫现场调查特效",
    name = "vfx_26_4",
    location = [112,6,255],
    rotate = [0,0,0],
    scale = [2,2,2],
    maps = "map340",
    attach = 0
    };
getRow(156)->
    #task_objCfg {
    id = 156,
    type = 2,
    belong = "主城-打劫现场调查特效",
    name = "vfx_26_21",
    location = [109,6,256],
    rotate = [0,0,0],
    scale = [2,2,2],
    maps = "map340",
    attach = 0
    };
getRow(157)->
    #task_objCfg {
    id = 157,
    type = 1,
    belong = "主城-铁匠处调查",
    name = "m%m_57",
    location = [281,6.16,302],
    rotate = [0.5,146,-88],
    scale = [2,2,2],
    maps = "map340",
    attach = 0
    };
getRow(158)->
    #task_objCfg {
    id = 158,
    type = 2,
    belong = "主城-铁匠处调查特效",
    name = "vfx_26_4",
    location = [281,6,302],
    rotate = [0,0,0],
    scale = [2,2,2],
    maps = "map340",
    attach = 0
    };
getRow(159)->
    #task_objCfg {
    id = 159,
    type = 2,
    belong = "主城-铁匠处调查特效",
    name = "vfx_26_21",
    location = [281,6,302],
    rotate = [0,0,0],
    scale = [2,2,2],
    maps = "map340",
    attach = 0
    };
getRow(160)->
    #task_objCfg {
    id = 160,
    type = 1,
    belong = "主城-打劫现场劫匪出现",
    name = "m%m_23",
    location = [115,6,261],
    rotate = [0,0,0],
    scale = [1,1,1],
    maps = "map340",
    attach = 0
    };
getRow(161)->
    #task_objCfg {
    id = 161,
    type = 1,
    belong = "主城-打劫现场劫匪出现",
    name = "m%m_23",
    location = [120,6,261],
    rotate = [0,0,0],
    scale = [1,1,1],
    maps = "map340",
    attach = 0
    };
getRow(162)->
    #task_objCfg {
    id = 162,
    type = 1,
    belong = "主城-打劫现场劫匪出现",
    name = "m%m_23",
    location = [111,6,261],
    rotate = [0,0,0],
    scale = [1,1,1],
    maps = "map340",
    attach = 0
    };
getRow(163)->
    #task_objCfg {
    id = 163,
    type = 1,
    belong = "主城-打劫现场劫匪出现",
    name = "m%m_73",
    location = [119.6,6,251],
    rotate = [0,0,0],
    scale = [1,1,1],
    maps = "map340",
    attach = 0
    };
getRow(164)->
    #task_objCfg {
    id = 164,
    type = 1,
    belong = "主城-打劫现场劫匪出现",
    name = "m%m_73",
    location = [112,6,251],
    rotate = [0,0,0],
    scale = [1,1,1],
    maps = "map340",
    attach = 0
    };
getRow(200)->
    #task_objCfg {
    id = 200,
    type = 1,
    belong = "弗洛多老爷跟随后出现",
    name = "n%n_21",
    location = [165.41,8.61,156.44],
    rotate = [0,-31.9,0],
    scale = [1,1,1],
    maps = "map331",
    attach = 0
    };
getRow(201)->
    #task_objCfg {
    id = 201,
    type = 1,
    belong = "弗洛多老爷跟随后出现",
    name = "n%n_21",
    location = [157.29,8.61,174.67],
    rotate = [0,160.7,0],
    scale = [1,1,1],
    maps = "map331",
    attach = 0
    };
getRow(202)->
    #task_objCfg {
    id = 202,
    type = 1,
    belong = "祭坛处女神幻象出现",
    name = "n%n_1",
    location = [261.19,8.7,116.93],
    rotate = [0,88.5,0],
    scale = [1,1,1],
    maps = "map331",
    attach = 0
    };
getRow(203)->
    #task_objCfg {
    id = 203,
    type = 1,
    belong = "异魔人首领跟随后出现",
    name = "m%m_122",
    location = [353.78,10.72,229.5],
    rotate = [0,0,0],
    scale = [1,1,1],
    maps = "map331",
    attach = 0
    };
getRow(204)->
    #task_objCfg {
    id = 204,
    type = 1,
    belong = "魔怨出世位面怪Boss",
    name = "m%m_101",
    location = [290.2,12.67,230.45],
    rotate = [0,105.5,0],
    scale = [0.06,0.06,0.06],
    maps = "map331",
    attach = 0
    };
getRow(205)->
    #task_objCfg {
    id = 205,
    type = 1,
    belong = "魔怨出世位面怪",
    name = "m%m_107",
    location = [295.6,12.67,233.45],
    rotate = [0,102,0],
    scale = [1,1,1],
    maps = "map331",
    attach = 0
    };
getRow(206)->
    #task_objCfg {
    id = 206,
    type = 1,
    belong = "魔怨出世位面怪",
    name = "m%m_107",
    location = [294,12.6,224],
    rotate = [0,115,0],
    scale = [1,1,1],
    maps = "map331",
    attach = 0
    };
getRow(207)->
    #task_objCfg {
    id = 207,
    type = 1,
    belong = "魔怨出世位面怪",
    name = "m%m_108",
    location = [298,12.6,227],
    rotate = [0,112,0],
    scale = [1,1,1],
    maps = "map331",
    attach = 0
    };
getRow(220)->
    #task_objCfg {
    id = 220,
    type = 1,
    belong = "到达苍空银原队伍首领",
    name = "m%m_118",
    location = [65,16,326.5],
    rotate = [0,-90,0],
    scale = [1,1,1],
    maps = "map300",
    attach = 0
    };
getRow(221)->
    #task_objCfg {
    id = 221,
    type = 1,
    belong = "苍空银原队伍士兵披风1",
    name = "m%m_104",
    location = [75,16,336.5],
    rotate = [0,-90,0],
    scale = [1,1,1],
    maps = "map300",
    attach = 0
    };
getRow(222)->
    #task_objCfg {
    id = 222,
    type = 1,
    belong = "苍空银原队伍士兵黑2",
    name = "m%m_106",
    location = [75,16,331.5],
    rotate = [0,-90,0],
    scale = [1,1,1],
    maps = "map300",
    attach = 0
    };
getRow(223)->
    #task_objCfg {
    id = 223,
    type = 1,
    belong = "苍空银原队伍士兵白3",
    name = "m%m_105",
    location = [75,16,326.5],
    rotate = [0,-90,0],
    scale = [1,1,1],
    maps = "map300",
    attach = 0
    };
getRow(224)->
    #task_objCfg {
    id = 224,
    type = 1,
    belong = "苍空银原队伍士兵黑4",
    name = "m%m_106",
    location = [75,16,321.5],
    rotate = [0,-90,0],
    scale = [1,1,1],
    maps = "map300",
    attach = 0
    };
getRow(225)->
    #task_objCfg {
    id = 225,
    type = 1,
    belong = "苍空银原队伍士兵白5",
    name = "m%m_105",
    location = [75,16,316.5],
    rotate = [0,-90,0],
    scale = [1,1,1],
    maps = "map300",
    attach = 0
    };
getRow(226)->
    #task_objCfg {
    id = 226,
    type = 1,
    belong = "苍空银原队伍士兵披风6",
    name = "m%m_104",
    location = [82.5,16,336.5],
    rotate = [0,-90,0],
    scale = [1,1,1],
    maps = "map300",
    attach = 0
    };
getRow(227)->
    #task_objCfg {
    id = 227,
    type = 1,
    belong = "苍空银原队伍士兵黑7",
    name = "m%m_106",
    location = [82.5,16,331.5],
    rotate = [0,-90,0],
    scale = [1,1,1],
    maps = "map300",
    attach = 0
    };
getRow(228)->
    #task_objCfg {
    id = 228,
    type = 1,
    belong = "苍空银原队伍士兵白8",
    name = "m%m_105",
    location = [82.5,16,326.5],
    rotate = [0,-90,0],
    scale = [1,1,1],
    maps = "map300",
    attach = 0
    };
getRow(229)->
    #task_objCfg {
    id = 229,
    type = 1,
    belong = "苍空银原队伍士兵黑9",
    name = "m%m_106",
    location = [82.5,16,321.5],
    rotate = [0,-90,0],
    scale = [1,1,1],
    maps = "map300",
    attach = 0
    };
getRow(230)->
    #task_objCfg {
    id = 230,
    type = 1,
    belong = "苍空银原队伍士兵白10",
    name = "m%m_105",
    location = [82.5,16,316.5],
    rotate = [0,-90,0],
    scale = [1,1,1],
    maps = "map300",
    attach = 0
    };
getRow(231)->
    #task_objCfg {
    id = 231,
    type = 1,
    belong = "通过位面后的士兵披风1",
    name = "m%m_104",
    location = [114.12,16,45],
    rotate = [0,-90,0],
    scale = [1,1,1],
    maps = "map300",
    attach = 0
    };
getRow(232)->
    #task_objCfg {
    id = 232,
    type = 1,
    belong = "苍空银原队伍士兵黑2",
    name = "m%m_106",
    location = [114.12,16,44],
    rotate = [0,-90,0],
    scale = [1,1,1],
    maps = "map300",
    attach = 0
    };
getRow(233)->
    #task_objCfg {
    id = 233,
    type = 1,
    belong = "苍空银原队伍士兵白3",
    name = "m%m_105",
    location = [114.12,16,44],
    rotate = [0,-90,0],
    scale = [1,1,1],
    maps = "map300",
    attach = 0
    };
getRow(234)->
    #task_objCfg {
    id = 234,
    type = 1,
    belong = "苍空银原队伍士兵黑4",
    name = "m%m_106",
    location = [114.12,16,43],
    rotate = [0,-90,0],
    scale = [1,1,1],
    maps = "map300",
    attach = 0
    };
getRow(235)->
    #task_objCfg {
    id = 235,
    type = 1,
    belong = "苍空银原队伍士兵白5",
    name = "m%m_105",
    location = [114.12,16,43],
    rotate = [0,-90,0],
    scale = [1,1,1],
    maps = "map300",
    attach = 0
    };
getRow(236)->
    #task_objCfg {
    id = 236,
    type = 1,
    belong = "收集止血果后的士兵披风1",
    name = "m%m_104",
    location = [123.25,16,299.37],
    rotate = [0,-120,0],
    scale = [1,1,1],
    maps = "map300",
    attach = 0
    };
getRow(237)->
    #task_objCfg {
    id = 237,
    type = 1,
    belong = "收集止血果后的士兵黑2",
    name = "m%m_106",
    location = [127.75,16,292.37],
    rotate = [0,-120,1],
    scale = [1,1,1],
    maps = "map300",
    attach = 0
    };
getRow(238)->
    #task_objCfg {
    id = 238,
    type = 1,
    belong = "收集止血果后的士兵白3",
    name = "m%m_105",
    location = [132.5,16,41],
    rotate = [0,-120,0],
    scale = [1,1,1],
    maps = "map300",
    attach = 0
    };
getRow(239)->
    #task_objCfg {
    id = 239,
    type = 1,
    belong = "收集止血果后的士兵黑4",
    name = "m%m_106",
    location = [136.62,16,291.5],
    rotate = [0,-120,0],
    scale = [1,1,1],
    maps = "map300",
    attach = 0
    };
getRow(240)->
    #task_objCfg {
    id = 240,
    type = 1,
    belong = "收集止血果后的士兵白5",
    name = "m%m_105",
    location = [132.12,16,299.87],
    rotate = [0,-120,0],
    scale = [1,1,1],
    maps = "map300",
    attach = 0
    };
getRow(241)->
    #task_objCfg {
    id = 241,
    type = 1,
    belong = "收集止血果后的果实1",
    name = "c%sc_object_mogu_01",
    location = [120.62,16,302.62],
    rotate = [0,90,0],
    scale = [0.6,0.6,0.6],
    maps = "map300",
    attach = 0
    };
getRow(242)->
    #task_objCfg {
    id = 242,
    type = 2,
    belong = "果实1特效",
    name = "vfx_26_4",
    location = [120.62,16,302.62],
    rotate = [0,0,0],
    scale = [1,1,1],
    maps = "map300",
    attach = 0
    };
getRow(243)->
    #task_objCfg {
    id = 243,
    type = 2,
    belong = "果实1特效",
    name = "vfx_26_21",
    location = [120.62,16,302.62],
    rotate = [0,0,0],
    scale = [1,1,1],
    maps = "map300",
    attach = 0
    };
getRow(244)->
    #task_objCfg {
    id = 244,
    type = 1,
    belong = "收集止血果后的果实2",
    name = "c%sc_object_mogu_01",
    location = [126,16,42],
    rotate = [0,75,0],
    scale = [0.6,0.6,0.6],
    maps = "map300",
    attach = 0
    };
getRow(245)->
    #task_objCfg {
    id = 245,
    type = 2,
    belong = "果实2特效",
    name = "vfx_26_4",
    location = [126,16,42],
    rotate = [0,0,0],
    scale = [1,1,1],
    maps = "map300",
    attach = 0
    };
getRow(246)->
    #task_objCfg {
    id = 246,
    type = 2,
    belong = "果实2特效",
    name = "vfx_26_21",
    location = [126,16,42],
    rotate = [0,0,0],
    scale = [1,1,1],
    maps = "map300",
    attach = 0
    };
getRow(247)->
    #task_objCfg {
    id = 247,
    type = 1,
    belong = "收集止血果后的果实3",
    name = "c%sc_object_mogu_01",
    location = [130.62,16,287.75],
    rotate = [0,75,0],
    scale = [0.6,0.6,0.6],
    maps = "map300",
    attach = 0
    };
getRow(248)->
    #task_objCfg {
    id = 248,
    type = 2,
    belong = "果实3特效",
    name = "vfx_26_4",
    location = [130.62,16,287.75],
    rotate = [0,0,0],
    scale = [1,1,1],
    maps = "map300",
    attach = 0
    };
getRow(249)->
    #task_objCfg {
    id = 249,
    type = 2,
    belong = "果实3特效",
    name = "vfx_26_21",
    location = [130.62,16,287.75],
    rotate = [0,0,0],
    scale = [1,1,1],
    maps = "map300",
    attach = 0
    };
getRow(250)->
    #task_objCfg {
    id = 250,
    type = 1,
    belong = "收集止血果后的枯萎1",
    name = "c%sc_336_plant_0_3a",
    location = [136.87,16,295.12],
    rotate = [0,0,0],
    scale = [0.6,0.6,0.6],
    maps = "map300",
    attach = 0
    };
getRow(251)->
    #task_objCfg {
    id = 251,
    type = 1,
    belong = "收集止血果后的枯萎2",
    name = "c%sc_336_plant_0_3a",
    location = [131.37,16,43],
    rotate = [0,0,0],
    scale = [0.6,0.6,0.6],
    maps = "map300",
    attach = 0
    };
getRow(252)->
    #task_objCfg {
    id = 252,
    type = 1,
    belong = "潜伏开始侦查兵披风1",
    name = "m%m_104",
    location = [141.25,16,223.5],
    rotate = [0,-170,0],
    scale = [1,1,1],
    maps = "map300",
    attach = 0
    };
getRow(253)->
    #task_objCfg {
    id = 253,
    type = 1,
    belong = "潜伏开始侦查兵士兵黑2",
    name = "m%m_106",
    location = [159.12,16,222.25],
    rotate = [0,-90,0],
    scale = [1,1,1],
    maps = "map300",
    attach = 0
    };
getRow(254)->
    #task_objCfg {
    id = 254,
    type = 1,
    belong = "潜伏开始侦查兵士兵白3",
    name = "m%m_105",
    location = [159.12,16,215.25],
    rotate = [0,-73,0],
    scale = [1,1,1],
    maps = "map300",
    attach = 0
    };
getRow(255)->
    #task_objCfg {
    id = 255,
    type = 1,
    belong = "收集止血果后的士兵披风1",
    name = "m%m_104",
    location = [93.12,16,161.5],
    rotate = [0,-40,0],
    scale = [1,1,1],
    maps = "map300",
    attach = 0
    };
getRow(256)->
    #task_objCfg {
    id = 256,
    type = 1,
    belong = "收集止血果后的果实1",
    name = "c%sc_336_plant_8",
    location = [88.5,16,159.87],
    rotate = [0,-180,0],
    scale = [0.6,0.6,0.6],
    maps = "map300",
    attach = 0
    };
getRow(257)->
    #task_objCfg {
    id = 257,
    type = 2,
    belong = "果实1特效",
    name = "vfx_26_4",
    location = [88.5,16,159.87],
    rotate = [0,0,0],
    scale = [1,1,1],
    maps = "map300",
    attach = 0
    };
getRow(258)->
    #task_objCfg {
    id = 258,
    type = 2,
    belong = "果实1特效",
    name = "vfx_26_21",
    location = [88.5,16,159.87],
    rotate = [0,0,0],
    scale = [1,1,1],
    maps = "map300",
    attach = 0
    };
getRow(259)->
    #task_objCfg {
    id = 259,
    type = 1,
    belong = "发现魔族披风1",
    name = "m%m_104",
    location = [127.87,17.3,142.25],
    rotate = [0,-90,0],
    scale = [1,1,1],
    maps = "map300",
    attach = 0
    };
getRow(260)->
    #task_objCfg {
    id = 260,
    type = 1,
    belong = "发现魔族士兵黑2",
    name = "m%m_106",
    location = [127.87,20,131.75],
    rotate = [0,-90,0],
    scale = [1,1,1],
    maps = "map300",
    attach = 0
    };
getRow(261)->
    #task_objCfg {
    id = 261,
    type = 1,
    belong = "发现魔族士兵白3",
    name = "m%m_105",
    location = [114.5,20,131.75],
    rotate = [0,90,0],
    scale = [1,1,1],
    maps = "map300",
    attach = 0
    };
getRow(262)->
    #task_objCfg {
    id = 262,
    type = 1,
    belong = "装满硫磺的货物1",
    name = "c%sc_object_mt_01",
    location = [141,20,109],
    rotate = [0,0,0],
    scale = [1,1,1],
    maps = "map300",
    attach = 0
    };
getRow(263)->
    #task_objCfg {
    id = 263,
    type = 1,
    belong = "装满硫磺的货物2",
    name = "c%sc_object_mt_01",
    location = [141,20,115.25],
    rotate = [0,0,0],
    scale = [1,1,1],
    maps = "map300",
    attach = 0
    };
getRow(264)->
    #task_objCfg {
    id = 264,
    type = 1,
    belong = "装满硫磺的货物3",
    name = "c%sc_object_mt_01",
    location = [141,20,121.5],
    rotate = [0,0,0],
    scale = [1,1,1],
    maps = "map300",
    attach = 0
    };
getRow(265)->
    #task_objCfg {
    id = 265,
    type = 1,
    belong = "魔族工头",
    name = "m%m_342",
    location = [138.75,20,82.5],
    rotate = [0,-66.8,0],
    scale = [1,1,1],
    maps = "map300",
    attach = 0
    };
getRow(266)->
    #task_objCfg {
    id = 266,
    type = 1,
    belong = "魔族工头-尸体",
    name = "m%m_342",
    location = [141.87,20,52.75],
    rotate = [-78,-115.7,0],
    scale = [1,1,1],
    maps = "map300",
    attach = 0
    };
getRow(267)->
    #task_objCfg {
    id = 267,
    type = 1,
    belong = "埋尸体披风1",
    name = "m%m_104",
    location = [140,20,72.75],
    rotate = [0,-48,0],
    scale = [1,1,1],
    maps = "map300",
    attach = 0
    };
getRow(268)->
    #task_objCfg {
    id = 268,
    type = 1,
    belong = "埋尸体士兵黑2",
    name = "m%m_106",
    location = [146.25,20,61.12],
    rotate = [0,0,0],
    scale = [1,1,1],
    maps = "map300",
    attach = 0
    };
getRow(269)->
    #task_objCfg {
    id = 269,
    type = 1,
    belong = "埋尸体士兵白3",
    name = "m%m_105",
    location = [151.75,20,67.37],
    rotate = [0,-33,0],
    scale = [1,1,1],
    maps = "map300",
    attach = 0
    };
getRow(270)->
    #task_objCfg {
    id = 270,
    type = 1,
    belong = "隐蔽披风1",
    name = "m%m_104",
    location = [133.25,20,64],
    rotate = [0,76.5,0],
    scale = [1,1,1],
    maps = "map300",
    attach = 0
    };
getRow(271)->
    #task_objCfg {
    id = 271,
    type = 1,
    belong = "隐蔽黑2",
    name = "m%m_106",
    location = [133.25,20,59.87],
    rotate = [0,76.5,0],
    scale = [1,1,1],
    maps = "map300",
    attach = 0
    };
getRow(272)->
    #task_objCfg {
    id = 272,
    type = 1,
    belong = "隐蔽白3",
    name = "m%m_105",
    location = [136.62,20,59.87],
    rotate = [0,68,0],
    scale = [1,1,1],
    maps = "map300",
    attach = 0
    };
getRow(273)->
    #task_objCfg {
    id = 273,
    type = 1,
    belong = "巡查的士兵1",
    name = "m%m_73",
    location = [166.25,20,75.25],
    rotate = [0,-36.6,0],
    scale = [1,1,1],
    maps = "map300",
    attach = 0
    };
getRow(274)->
    #task_objCfg {
    id = 274,
    type = 1,
    belong = "巡查的士兵2",
    name = "m%m_73",
    location = [173.25,20,72.25],
    rotate = [0,-41,0],
    scale = [1,1,1],
    maps = "map300",
    attach = 0
    };
getRow(275)->
    #task_objCfg {
    id = 275,
    type = 1,
    belong = "巡查的士兵3",
    name = "m%m_73",
    location = [178.75,20,69.5],
    rotate = [0,-45,0],
    scale = [1,1,1],
    maps = "map300",
    attach = 0
    };
getRow(276)->
    #task_objCfg {
    id = 276,
    type = 1,
    belong = "巡查的士兵4",
    name = "m%m_73",
    location = [185.75,20,67.62],
    rotate = [0,-50,0],
    scale = [1,1,1],
    maps = "map300",
    attach = 0
    };
getRow(277)->
    #task_objCfg {
    id = 277,
    type = 1,
    belong = "巡查的士兵长官",
    name = "m%m_340",
    location = [177.5,20,67.75],
    rotate = [0,-73,0],
    scale = [1,1,1],
    maps = "map300",
    attach = 0
    };
getRow(278)->
    #task_objCfg {
    id = 278,
    type = 1,
    belong = "右侧陷阱",
    name = "c%sc_object_dcr_01",
    location = [170.37,20,64.87],
    rotate = [0,0,0],
    scale = [1,1,1],
    maps = "map300",
    attach = 0
    };
getRow(279)->
    #task_objCfg {
    id = 279,
    type = 1,
    belong = "左侧陷阱",
    name = "c%sc_object_dcr_01",
    location = [174.62,20,83.25],
    rotate = [0,-142.7,0],
    scale = [1,1,1],
    maps = "map300",
    attach = 0
    };
getRow(280)->
    #task_objCfg {
    id = 280,
    type = 1,
    belong = "陷阱白1",
    name = "m%m_104",
    location = [173.5,20,70.25],
    rotate = [0,-180,0],
    scale = [1,1,1],
    maps = "map300",
    attach = 0
    };
getRow(281)->
    #task_objCfg {
    id = 281,
    type = 1,
    belong = "陷阱披风1",
    name = "m%m_105",
    location = [171.25,20,59],
    rotate = [0,0,0],
    scale = [1,1,1],
    maps = "map300",
    attach = 0
    };
getRow(282)->
    #task_objCfg {
    id = 282,
    type = 1,
    belong = "伪装士兵1",
    name = "m%m_73",
    location = [206.62,24,70.75],
    rotate = [0,180,0],
    scale = [1,1,1],
    maps = "map300",
    attach = 0
    };
getRow(283)->
    #task_objCfg {
    id = 283,
    type = 1,
    belong = "伪装士兵2",
    name = "m%m_73",
    location = [202.5,24,71.25],
    rotate = [0,180,0],
    scale = [1,1,1],
    maps = "map300",
    attach = 0
    };
getRow(284)->
    #task_objCfg {
    id = 284,
    type = 1,
    belong = "伪装士兵3",
    name = "m%m_73",
    location = [206.25,24,71.5],
    rotate = [0,180,0],
    scale = [1,1,1],
    maps = "map300",
    attach = 0
    };
getRow(285)->
    #task_objCfg {
    id = 285,
    type = 1,
    belong = "偷听伪装士兵1",
    name = "m%m_73",
    location = [253.75,24,45.25],
    rotate = [0,-22.9,0],
    scale = [1,1,1],
    maps = "map300",
    attach = 0
    };
getRow(286)->
    #task_objCfg {
    id = 286,
    type = 1,
    belong = "偷听伪装士兵2",
    name = "m%m_73",
    location = [250,24,42.75],
    rotate = [0,-34.7,0],
    scale = [1,1,1],
    maps = "map300",
    attach = 0
    };
getRow(287)->
    #task_objCfg {
    id = 287,
    type = 1,
    belong = "偷听伪装士兵3",
    name = "m%m_73",
    location = [245.37,24,96.5],
    rotate = [0,-20.9,0],
    scale = [1,1,1],
    maps = "map300",
    attach = 0
    };
getRow(288)->
    #task_objCfg {
    id = 288,
    type = 1,
    belong = "看守俘虏的士兵1",
    name = "m%m_21",
    location = [228,24,82.75],
    rotate = [0,160,0],
    scale = [1,1,1],
    maps = "map300",
    attach = 0
    };
getRow(289)->
    #task_objCfg {
    id = 289,
    type = 1,
    belong = "看守俘虏的士兵1",
    name = "m%m_21",
    location = [237.12,24,109.83],
    rotate = [0,133.67,0],
    scale = [1,1,1],
    maps = "map300",
    attach = 0
    };
getRow(290)->
    #task_objCfg {
    id = 290,
    type = 1,
    belong = "泼洒炸药1",
    name = "c%sc_object_mt_01",
    location = [284.25,24,96.5],
    rotate = [0,0,0],
    scale = [1,1,1],
    maps = "map300",
    attach = 0
    };
getRow(291)->
    #task_objCfg {
    id = 291,
    type = 1,
    belong = "泼洒炸药2",
    name = "c%sc_object_mt_01",
    location = [283.75,24,79],
    rotate = [0,0,0],
    scale = [1,1,1],
    maps = "map300",
    attach = 0
    };
getRow(292)->
    #task_objCfg {
    id = 292,
    type = 1,
    belong = "指挥官动态",
    name = "m%m_31",
    location = [258.25,24,46.5],
    rotate = [0,-78,0],
    scale = [0.8,0.8,0.8],
    maps = "map300",
    attach = 0
    };
getRow(293)->
    #task_objCfg {
    id = 293,
    type = 1,
    belong = "泼洒炸药-友军1",
    name = "m%m_104",
    location = [280.37,24,94.12],
    rotate = [0,-70,0],
    scale = [1,1,1],
    maps = "map300",
    attach = 0
    };
getRow(294)->
    #task_objCfg {
    id = 294,
    type = 1,
    belong = "泼洒炸药-友军1",
    name = "m%m_105",
    location = [278.75,24,82.75],
    rotate = [0,-78,0],
    scale = [1,1,1],
    maps = "map300",
    attach = 0
    };
getRow(295)->
    #task_objCfg {
    id = 295,
    type = 1,
    belong = "解救村民队友1",
    name = "m%m_104",
    location = [309.62,30.21,41],
    rotate = [0,180,0],
    scale = [1,1,1],
    maps = "map300",
    attach = 0
    };
getRow(296)->
    #task_objCfg {
    id = 296,
    type = 1,
    belong = "解救村民队友2",
    name = "m%m_105",
    location = [309.62,30.21,283.75],
    rotate = [0,180,0],
    scale = [1,1,1],
    maps = "map300",
    attach = 0
    };
getRow(297)->
    #task_objCfg {
    id = 297,
    type = 1,
    belong = "解救村民队友3",
    name = "m%m_106",
    location = [309.62,30.21,276.37],
    rotate = [0,180,0],
    scale = [1,1,1],
    maps = "map300",
    attach = 0
    };
getRow(298)->
    #task_objCfg {
    id = 298,
    type = 2,
    belong = "魔能结界特效1",
    name = "vfx_26_6",
    location = [360.12,42.5,349.12],
    rotate = [0,0,0],
    scale = [1,1,1],
    maps = "map300",
    attach = 0
    };
getRow(299)->
    #task_objCfg {
    id = 299,
    type = 2,
    belong = "魔能结界特效2",
    name = "vfx_26_6",
    location = [376.62,42.5,349.12],
    rotate = [0,0,0],
    scale = [1,1,1],
    maps = "map300",
    attach = 0
    };
getRow(300)->
    #task_objCfg {
    id = 300,
    type = 1,
    belong = "魔能结界炼金术尸",
    name = "m%m_315",
    location = [377.12,43.9,345.75],
    rotate = [0,180,0],
    scale = [1,1,1],
    maps = "map300",
    attach = 0
    };
getRow(301)->
    #task_objCfg {
    id = 301,
    type = 1,
    belong = "魔能结界小怪1",
    name = "m%m_93",
    location = [368.5,43.9,343.12],
    rotate = [0,180,0],
    scale = [1,1,1],
    maps = "map300",
    attach = 0
    };
getRow(302)->
    #task_objCfg {
    id = 302,
    type = 1,
    belong = "魔能结界小怪2",
    name = "m%m_93",
    location = [384.25,43.9,343.12],
    rotate = [0,180,0],
    scale = [1,1,1],
    maps = "map300",
    attach = 0
    };
getRow(310)->
    #task_objCfg {
    id = 310,
    type = 1,
    belong = "魔族足迹-苍空之塔入口",
    name = "c%sc_object_nianye_01",
    location = [508.25,109.56,683.87],
    rotate = [0,0,0],
    scale = [0.5,0.5,0.5],
    maps = "map301",
    attach = 0
    };
getRow(311)->
    #task_objCfg {
    id = 311,
    type = 2,
    belong = "魔族足迹1特效",
    name = "vfx_26_4",
    location = [508.25,109.56,683.87],
    rotate = [0,0,0],
    scale = [1,1,1],
    maps = "map301",
    attach = 0
    };
getRow(312)->
    #task_objCfg {
    id = 312,
    type = 2,
    belong = "魔族足迹特效",
    name = "vfx_26_21",
    location = [508.25,109.56,683.87],
    rotate = [0,0,0],
    scale = [1,1,1],
    maps = "map301",
    attach = 0
    };
getRow(313)->
    #task_objCfg {
    id = 313,
    type = 1,
    belong = "魔族突袭小怪1",
    name = "m%m_94",
    location = [355.37,126.3,582.12],
    rotate = [0,-60,0],
    scale = [1,1,1],
    maps = "map301",
    attach = 0
    };
getRow(314)->
    #task_objCfg {
    id = 314,
    type = 1,
    belong = "魔族突袭小怪2",
    name = "m%m_94",
    location = [352.62,126.3,577.75],
    rotate = [0,-60,0],
    scale = [1,1,1],
    maps = "map301",
    attach = 0
    };
getRow(315)->
    #task_objCfg {
    id = 315,
    type = 1,
    belong = "魔族突袭小怪3",
    name = "m%m_94",
    location = [350,126.3,575],
    rotate = [0,-60,0],
    scale = [1,1,1],
    maps = "map301",
    attach = 0
    };
getRow(316)->
    #task_objCfg {
    id = 316,
    type = 1,
    belong = "雪堆陷阱-苍空之塔",
    name = "c%sc_object_meiqiu_01",
    location = [390.62,125.35,539.75],
    rotate = [0,0,0],
    scale = [2,2,2],
    maps = "map301",
    attach = 0
    };
getRow(317)->
    #task_objCfg {
    id = 317,
    type = 2,
    belong = "雪堆陷阱特效",
    name = "vfx_26_4",
    location = [390.62,126.5,539.75],
    rotate = [0,0,0],
    scale = [1,1,1],
    maps = "map301",
    attach = 0
    };
getRow(318)->
    #task_objCfg {
    id = 318,
    type = 2,
    belong = "魔族足迹特效",
    name = "vfx_26_21",
    location = [390.62,126.5,539.75],
    rotate = [0,0,0],
    scale = [1,1,1],
    maps = "map301",
    attach = 0
    };
getRow(319)->
    #task_objCfg {
    id = 319,
    type = 1,
    belong = "祭司的宝珠-苍空之塔",
    name = "c%sc_object_sjq_01",
    location = [619.25,126.5,688.75],
    rotate = [0,0,0],
    scale = [1,1,1],
    maps = "map301",
    attach = 0
    };
getRow(320)->
    #task_objCfg {
    id = 320,
    type = 2,
    belong = "雪堆陷阱特效",
    name = "vfx_26_4",
    location = [619.25,126.5,688.75],
    rotate = [0,0,0],
    scale = [1,1,1],
    maps = "map301",
    attach = 0
    };
getRow(321)->
    #task_objCfg {
    id = 321,
    type = 2,
    belong = "魔族足迹特效",
    name = "vfx_26_21",
    location = [619.25,126.5,688.75],
    rotate = [0,0,0],
    scale = [1,1,1],
    maps = "map301",
    attach = 0
    };
getRow(322)->
    #task_objCfg {
    id = 322,
    type = 1,
    belong = "能量机关-苍空之塔",
    name = "c%sc_74",
    location = [509.12,138.8,419.12],
    rotate = [0,0,0],
    scale = [0.5,0.5,0.5],
    maps = "map301",
    attach = 0
    };
getRow(323)->
    #task_objCfg {
    id = 323,
    type = 2,
    belong = "能量机关特效",
    name = "vfx_26_4",
    location = [509.12,138.8,419.12],
    rotate = [0,0,0],
    scale = [1,1,1],
    maps = "map301",
    attach = 0
    };
getRow(324)->
    #task_objCfg {
    id = 324,
    type = 2,
    belong = "能量机关特效",
    name = "vfx_26_21",
    location = [509.12,138.8,419.12],
    rotate = [0,0,0],
    scale = [1,1,1],
    maps = "map301",
    attach = 0
    };
getRow(325)->
    #task_objCfg {
    id = 325,
    type = 1,
    belong = "能量机关-苍空之塔",
    name = "c%sc_object_baoshi_01",
    location = [581.25,139,422.25],
    rotate = [0,0,0],
    scale = [0.5,0.5,0.5],
    maps = "map301",
    attach = 0
    };
getRow(326)->
    #task_objCfg {
    id = 326,
    type = 2,
    belong = "能量机关特效",
    name = "vfx_26_4",
    location = [581.25,139,422.25],
    rotate = [0,0,0],
    scale = [1,1,1],
    maps = "map301",
    attach = 0
    };
getRow(327)->
    #task_objCfg {
    id = 327,
    type = 2,
    belong = "能量机关特效",
    name = "vfx_26_21",
    location = [581.25,139,422.25],
    rotate = [0,0,0],
    scale = [1,1,1],
    maps = "map301",
    attach = 0
    };
getRow(328)->
    #task_objCfg {
    id = 328,
    type = 1,
    belong = "苍空女王出现-苍空之塔",
    name = "m%m_34",
    location = [530.25,152,290.87],
    rotate = [0,0,0],
    scale = [1.2,1.2,1.2],
    maps = "map301",
    attach = 0
    };
getRow(329)->
    #task_objCfg {
    id = 329,
    type = 1,
    belong = "苍空祭司出现-苍空之塔",
    name = "m%m_41",
    location = [528.5,151,296.25],
    rotate = [0,0,0],
    scale = [1,1,1],
    maps = "map301",
    attach = 0
    };
getRow(330)->
    #task_objCfg {
    id = 330,
    type = 1,
    belong = "泯灭领主出现-苍空之塔",
    name = "m%m_40",
    location = [567.5,151.4,277.75],
    rotate = [0,0,0],
    scale = [1.5,1.5,1.5],
    maps = "map301",
    attach = 0
    };
getRow(331)->
    #task_objCfg {
    id = 331,
    type = 2,
    belong = "能量机关特效",
    name = "vfx_26_4",
    location = [567.5,151.4,277.75],
    rotate = [0,0,0],
    scale = [1,1,1],
    maps = "map301",
    attach = 0
    };
getRow(332)->
    #task_objCfg {
    id = 332,
    type = 2,
    belong = "能量机关特效",
    name = "vfx_26_21",
    location = [567.5,151.4,277.75],
    rotate = [0,0,0],
    scale = [1,1,1],
    maps = "map301",
    attach = 0
    };
getRow(333)->
    #task_objCfg {
    id = 333,
    type = 1,
    belong = "魔族大门",
    name = "m%m_352",
    location = [151.6,16,238],
    rotate = [0,0,0],
    scale = [1,1,1],
    maps = "map300",
    attach = 0
    };
getRow(350)->
    #task_objCfg {
    id = 350,
    type = 1,
    belong = "魔化仪式_魔族巫师",
    name = "m%m_76",
    location = [196.6,60.5,318],
    rotate = [0,-160,0],
    scale = [1,1,1],
    maps = "map334",
    attach = 0
    };
getRow(351)->
    #task_objCfg {
    id = 351,
    type = 1,
    belong = "魔化仪式_魔族巫师",
    name = "m%m_76",
    location = [201.8,60.5,303.7],
    rotate = [0,-70,0],
    scale = [1,1,1],
    maps = "map334",
    attach = 0
    };
getRow(352)->
    #task_objCfg {
    id = 352,
    type = 1,
    belong = "魔化仪式_魔族巫师",
    name = "m%m_76",
    location = [182.6,60.5,310.6],
    rotate = [0,110,0],
    scale = [1,1,1],
    maps = "map334",
    attach = 0
    };
getRow(353)->
    #task_objCfg {
    id = 353,
    type = 1,
    belong = "魔化仪式_魔族巫师",
    name = "m%m_76",
    location = [188.5,60.5,296.8],
    rotate = [0,20,0],
    scale = [1,1,1],
    maps = "map334",
    attach = 0
    };
getRow(354)->
    #task_objCfg {
    id = 354,
    type = 1,
    belong = "魔化仪式_魔化精灵",
    name = "m%m_89",
    location = [192.4,60.7,306.6],
    rotate = [0,40,0],
    scale = [1,1,1],
    maps = "map334",
    attach = 0
    };
getRow(355)->
    #task_objCfg {
    id = 355,
    type = 1,
    belong = "前往西侧_魔族门卫",
    name = "m%m_73",
    location = [267,73.1,342.1],
    rotate = [0,86,0],
    scale = [1,1,1],
    maps = "map334",
    attach = 0
    };
getRow(356)->
    #task_objCfg {
    id = 356,
    type = 1,
    belong = "前往西侧_魔族门卫",
    name = "m%m_73",
    location = [271.8,73.1,321.8],
    rotate = [0,65,0],
    scale = [1,1,1],
    maps = "map334",
    attach = 0
    };
getRow(357)->
    #task_objCfg {
    id = 357,
    type = 1,
    belong = "侦查敌情_魔族看守",
    name = "m%m_73",
    location = [137.2,73.1,412.2],
    rotate = [0,-150,0],
    scale = [1,1,1],
    maps = "map334",
    attach = 0
    };
getRow(358)->
    #task_objCfg {
    id = 358,
    type = 1,
    belong = "侦查敌情_魔族看守",
    name = "m%m_73",
    location = [146.2,73.1,407.9],
    rotate = [0,-150,0],
    scale = [1,1,1],
    maps = "map334",
    attach = 0
    };
getRow(359)->
    #task_objCfg {
    id = 359,
    type = 1,
    belong = "侦查敌情_魔族看守",
    name = "m%m_73",
    location = [129.9,73.1,415.7],
    rotate = [0,-150,0],
    scale = [1,1,1],
    maps = "map334",
    attach = 0
    };
getRow(360)->
    #task_objCfg {
    id = 360,
    type = 1,
    belong = "侦查敌情_精灵族人",
    name = "n%n_55",
    location = [141.4,73.1,425.7],
    rotate = [0,-160,0],
    scale = [1,1,1],
    maps = "map334",
    attach = 0
    };
getRow(361)->
    #task_objCfg {
    id = 361,
    type = 1,
    belong = "侦查敌情_精灵族人",
    name = "n%n_55",
    location = [152.6,73.1,421.5],
    rotate = [0,-160,0],
    scale = [1,1,1],
    maps = "map334",
    attach = 0
    };
getRow(362)->
    #task_objCfg {
    id = 362,
    type = 1,
    belong = "侦查敌情_精灵族人",
    name = "n%n_55",
    location = [144.6,73.1,422.7],
    rotate = [0,-160,0],
    scale = [1,1,1],
    maps = "map334",
    attach = 0
    };
getRow(363)->
    #task_objCfg {
    id = 363,
    type = 1,
    belong = "侦查敌情_精灵族人",
    name = "n%n_55",
    location = [149,73.1,424.8],
    rotate = [0,-160,0],
    scale = [1,1,1],
    maps = "map334",
    attach = 0
    };
getRow(364)->
    #task_objCfg {
    id = 364,
    type = 1,
    belong = "探查军需库_精灵少年",
    name = "m%m_147",
    location = [455.2,73.1,383.6],
    rotate = [0,-50,0],
    scale = [1,1,1],
    maps = "map334",
    attach = 0
    };
getRow(365)->
    #task_objCfg {
    id = 365,
    type = 1,
    belong = "探查军需库_精灵族人",
    name = "n%n_55",
    location = [449.5,73.1,381.2],
    rotate = [0,-40,0],
    scale = [1,1,1],
    maps = "map334",
    attach = 0
    };
getRow(366)->
    #task_objCfg {
    id = 366,
    type = 1,
    belong = "探查军需库_精灵族人",
    name = "n%n_55",
    location = [454.4,73.1,387.7],
    rotate = [0,-80,0],
    scale = [1,1,1],
    maps = "map334",
    attach = 0
    };
getRow(367)->
    #task_objCfg {
    id = 367,
    type = 1,
    belong = "第一滴血_魔族侵略者",
    name = "m%m_102",
    location = [438,85.8,489.5],
    rotate = [0,180,0],
    scale = [1,1,1],
    maps = "map334",
    attach = 0
    };
getRow(368)->
    #task_objCfg {
    id = 368,
    type = 1,
    belong = "第一滴血_魔族侵略者",
    name = "m%m_102",
    location = [448.5,85.8,485.3],
    rotate = [0,-170,0],
    scale = [1,1,1],
    maps = "map334",
    attach = 0
    };
getRow(369)->
    #task_objCfg {
    id = 369,
    type = 1,
    belong = "第一滴血_魔族侵略者",
    name = "m%m_102",
    location = [426.4,85.8,486.2],
    rotate = [0,170,0],
    scale = [1,1,1],
    maps = "map334",
    attach = 0
    };
getRow(370)->
    #task_objCfg {
    id = 370,
    type = 1,
    belong = "第一滴血_魔族侵略者",
    name = "m%m_102",
    location = [424.9,85.8,477.9],
    rotate = [0,170,0],
    scale = [1,1,1],
    maps = "map334",
    attach = 0
    };
getRow(371)->
    #task_objCfg {
    id = 371,
    type = 1,
    belong = "第一滴血_魔族侵略者",
    name = "m%m_102",
    location = [453,85.8,478.2],
    rotate = [0,-170,0],
    scale = [1,1,1],
    maps = "map334",
    attach = 0
    };
getRow(372)->
    #task_objCfg {
    id = 372,
    type = 1,
    belong = "继续前进_魔族侵略者",
    name = "m%m_102",
    location = [282.4,85.5,444.6],
    rotate = [0,70,0],
    scale = [1,1,1],
    maps = "map334",
    attach = 0
    };
getRow(373)->
    #task_objCfg {
    id = 373,
    type = 1,
    belong = "继续前进_魔族侵略者",
    name = "m%m_102",
    location = [279.1,85.5,450.4],
    rotate = [0,85,0],
    scale = [1,1,1],
    maps = "map334",
    attach = 0
    };
getRow(374)->
    #task_objCfg {
    id = 374,
    type = 1,
    belong = "继续前进_魔族侵略者",
    name = "m%m_102",
    location = [280.3,85.5,456.2],
    rotate = [0,95,0],
    scale = [1,1,1],
    maps = "map334",
    attach = 0
    };
getRow(375)->
    #task_objCfg {
    id = 375,
    type = 1,
    belong = "继续前进_魔族侵略者",
    name = "m%m_102",
    location = [284.9,87,460],
    rotate = [0,120,0],
    scale = [1,1,1],
    maps = "map334",
    attach = 0
    };
getRow(376)->
    #task_objCfg {
    id = 376,
    type = 1,
    belong = "追击残余魔军_魔族侵略者",
    name = "m%m_102",
    location = [161.2,85.5,468.6],
    rotate = [0,90,0],
    scale = [1,1,1],
    maps = "map334",
    attach = 0
    };
getRow(377)->
    #task_objCfg {
    id = 377,
    type = 1,
    belong = "追击残余魔军_魔族侵略者",
    name = "m%m_102",
    location = [165.9,85.5,479.2],
    rotate = [0,140,0],
    scale = [1,1,1],
    maps = "map334",
    attach = 0
    };
getRow(378)->
    #task_objCfg {
    id = 378,
    type = 1,
    belong = "追击残余魔军_魔族侵略者",
    name = "m%m_102",
    location = [172.4,85.5,480.9],
    rotate = [0,160,0],
    scale = [1,1,1],
    maps = "map334",
    attach = 0
    };
getRow(379)->
    #task_objCfg {
    id = 379,
    type = 1,
    belong = "追击残余魔军_魔族侵略者",
    name = "m%m_102",
    location = [161.8,85.5,474.5],
    rotate = [0,95,0],
    scale = [1,1,1],
    maps = "map334",
    attach = 0
    };
getRow(380)->
    #task_objCfg {
    id = 380,
    type = 1,
    belong = "解放的精灵故土_精灵少年",
    name = "m%m_147",
    location = [274.4,91.7,517.4],
    rotate = [0,0,0],
    scale = [1,1,1],
    maps = "map334",
    attach = 0
    };
getRow(381)->
    #task_objCfg {
    id = 381,
    type = 1,
    belong = "解放的精灵故土_精灵族人",
    name = "n%n_55",
    location = [269.4,91.7,518.7],
    rotate = [0,40,0],
    scale = [1,1,1],
    maps = "map334",
    attach = 0
    };
getRow(382)->
    #task_objCfg {
    id = 382,
    type = 1,
    belong = "解放的精灵故土_精灵族人",
    name = "n%n_55",
    location = [278.7,91.7,518.8],
    rotate = [0,-40,0],
    scale = [1,1,1],
    maps = "map334",
    attach = 0
    };
getRow(383)->
    #task_objCfg {
    id = 383,
    type = 1,
    belong = "追踪开始_精灵族人",
    name = "n%n_55",
    location = [270.7,91.5,501.4],
    rotate = [0,128,0],
    scale = [1,1,1],
    maps = "map334",
    attach = 0
    };
getRow(384)->
    #task_objCfg {
    id = 384,
    type = 1,
    belong = "追踪开始_精灵族人",
    name = "n%n_55",
    location = [280.5,91.1,493.9],
    rotate = [0,-52,0],
    scale = [1,1,1],
    maps = "map334",
    attach = 0
    };
getRow(385)->
    #task_objCfg {
    id = 385,
    type = 1,
    belong = "追踪开始_精灵族人",
    name = "n%n_55",
    location = [270.5,91,494.2],
    rotate = [0,55,0],
    scale = [1,1,1],
    maps = "map334",
    attach = 0
    };
getRow(386)->
    #task_objCfg {
    id = 386,
    type = 1,
    belong = "追踪开始_精灵族人",
    name = "n%n_55",
    location = [280.7,91.2,501.3],
    rotate = [0,-125,0],
    scale = [1,1,1],
    maps = "map334",
    attach = 0
    };
getRow(387)->
    #task_objCfg {
    id = 387,
    type = 1,
    belong = "调查精灵故土_精灵少年",
    name = "m%m_147",
    location = [271.2,58.2,228.3],
    rotate = [0,140,0],
    scale = [1,1,1],
    maps = "map334",
    attach = 0
    };
getRow(388)->
    #task_objCfg {
    id = 388,
    type = 1,
    belong = "调查精灵故土_魔族守卫1",
    name = "m%m_73",
    location = [264,58,203],
    rotate = [0,50,0],
    scale = [1,1,1],
    maps = "map334",
    attach = 0
    };
getRow(389)->
    #task_objCfg {
    id = 389,
    type = 1,
    belong = "调查精灵故土_魔族守卫2",
    name = "m%m_73",
    location = [300.5,58,216.7],
    rotate = [0,-120,0],
    scale = [1,1,1],
    maps = "map334",
    attach = 0
    };
getRow(390)->
    #task_objCfg {
    id = 390,
    type = 1,
    belong = "调查精灵故土_魔族守卫3",
    name = "m%m_73",
    location = [275.7,58.2,189.4],
    rotate = [0,50,0],
    scale = [1,1,1],
    maps = "map334",
    attach = 0
    };
getRow(391)->
    #task_objCfg {
    id = 391,
    type = 1,
    belong = "调查精灵故土_魔族守卫4",
    name = "m%m_73",
    location = [283.6,58.2,225.7],
    rotate = [0,-120,0],
    scale = [1,1,1],
    maps = "map334",
    attach = 0
    };
getRow(392)->
    #task_objCfg {
    id = 392,
    type = 1,
    belong = "调查精灵故土_魔族守卫5",
    name = "m%m_73",
    location = [265.2,58.3,216.5],
    rotate = [0,50,0],
    scale = [1,1,1],
    maps = "map334",
    attach = 0
    };
getRow(393)->
    #task_objCfg {
    id = 393,
    type = 1,
    belong = "遗迹谷地_精灵少年",
    name = "m%m_147",
    location = [155.8,19.2,62.6],
    rotate = [0,10,0],
    scale = [1,1,1],
    maps = "map337",
    attach = 0
    };
getRow(394)->
    #task_objCfg {
    id = 394,
    type = 1,
    belong = "将计就计I_巡逻队长",
    name = "m%m_102",
    location = [91.9,43.1,199.1],
    rotate = [0,110,0],
    scale = [1,1,1],
    maps = "map337",
    attach = 0
    };
getRow(395)->
    #task_objCfg {
    id = 395,
    type = 1,
    belong = "将计就计I_巡逻兵",
    name = "m%m_73",
    location = [88.6,43.1,203.8],
    rotate = [0,110,0],
    scale = [1,1,1],
    maps = "map337",
    attach = 0
    };
getRow(396)->
    #task_objCfg {
    id = 396,
    type = 1,
    belong = "将计就计I_巡逻兵",
    name = "m%m_73",
    location = [85.2,43.1,196],
    rotate = [0,110,0],
    scale = [1,1,1],
    maps = "map337",
    attach = 0
    };
getRow(397)->
    #task_objCfg {
    id = 397,
    type = 1,
    belong = "潜入祭坛_黄沙领主",
    name = "m%m_335",
    location = [273.6,23.9,349.6],
    rotate = [0,0,0],
    scale = [1.6,1.6,1.6],
    maps = "map337",
    attach = 0
    };
getRow(398)->
    #task_objCfg {
    id = 398,
    type = 1,
    belong = "潜入祭坛_血之祭司",
    name = "m%m_338",
    location = [275.5,23.9,346.2],
    rotate = [0,-30,0],
    scale = [1.6,1.6,1.6],
    maps = "map337",
    attach = 0
    };
getRow(399)->
    #task_objCfg {
    id = 399,
    type = 1,
    belong = "长途奔袭I_巡逻兵",
    name = "m%m_73",
    location = [285.1,7.8,259.3],
    rotate = [0,60,0],
    scale = [1,1,1],
    maps = "map337",
    attach = 0
    };
getRow(400)->
    #task_objCfg {
    id = 400,
    type = 1,
    belong = "长途奔袭I_巡逻兵",
    name = "m%m_73",
    location = [289.1,7.8,253.2],
    rotate = [0,60,0],
    scale = [1,1,1],
    maps = "map337",
    attach = 0
    };
getRow(401)->
    #task_objCfg {
    id = 401,
    type = 1,
    belong = "长途奔袭I_巡逻兵",
    name = "m%m_73",
    location = [280,7.8,256.8],
    rotate = [0,60,0],
    scale = [1,1,1],
    maps = "map337",
    attach = 0
    };
getRow(402)->
    #task_objCfg {
    id = 402,
    type = 1,
    belong = "长途奔袭I_巡逻兵",
    name = "m%m_73",
    location = [290.3,7.8,261.7],
    rotate = [0,60,0],
    scale = [1,1,1],
    maps = "map337",
    attach = 0
    };
getRow(403)->
    #task_objCfg {
    id = 403,
    type = 1,
    belong = "长途奔袭I_巡逻兵",
    name = "m%m_73",
    location = [293.8,7.8,255.4],
    rotate = [0,60,0],
    scale = [1,1,1],
    maps = "map337",
    attach = 0
    };
getRow(404)->
    #task_objCfg {
    id = 404,
    type = 1,
    belong = "长途奔袭I_巡逻兵",
    name = "m%m_73",
    location = [283.7,7.8,250.8],
    rotate = [0,60,0],
    scale = [1,1,1],
    maps = "map337",
    attach = 0
    };
getRow(405)->
    #task_objCfg {
    id = 405,
    type = 1,
    belong = "长途奔袭III_魔族祭司",
    name = "m%m_88",
    location = [223.5,7.8,181.4],
    rotate = [0,90,0],
    scale = [1,1,1],
    maps = "map337",
    attach = 0
    };
getRow(406)->
    #task_objCfg {
    id = 406,
    type = 1,
    belong = "长途奔袭III_魔族祭司",
    name = "m%m_88",
    location = [233.5,7.8,19.6],
    rotate = [0,-25.8,0],
    scale = [1,1,1],
    maps = "map337",
    attach = 0
    };
getRow(407)->
    #task_objCfg {
    id = 407,
    type = 1,
    belong = "长途奔袭III_魔族祭司",
    name = "m%m_88",
    location = [244.7,7.8,181.3],
    rotate = [0,-90,0],
    scale = [1,1,1],
    maps = "map337",
    attach = 0
    };
getRow(408)->
    #task_objCfg {
    id = 408,
    type = 1,
    belong = "长途奔袭III_魔族祭司",
    name = "m%m_88",
    location = [233.83,7.8,170.7],
    rotate = [0,0,0],
    scale = [1,1,1],
    maps = "map337",
    attach = 0
    };
getRow(409)->
    #task_objCfg {
    id = 409,
    type = 1,
    belong = "孤军奋战I_魔族援军",
    name = "m%m_340",
    location = [227.86,7.8,197.8],
    rotate = [0,150,0],
    scale = [1,1,1],
    maps = "map337",
    attach = 0
    };
getRow(410)->
    #task_objCfg {
    id = 410,
    type = 1,
    belong = "孤军奋战I_魔族援军",
    name = "m%m_340",
    location = [219.4,7.8,193],
    rotate = [0,120,0],
    scale = [1,1,1],
    maps = "map337",
    attach = 0
    };
getRow(411)->
    #task_objCfg {
    id = 411,
    type = 1,
    belong = "孤军奋战I_魔族援军",
    name = "m%m_340",
    location = [237,7.8,197.9],
    rotate = [0,-170,0],
    scale = [1,1,1],
    maps = "map337",
    attach = 0
    };
getRow(412)->
    #task_objCfg {
    id = 412,
    type = 1,
    belong = "孤军奋战I_魔族援军",
    name = "m%m_340",
    location = [244.5,7.8,195],
    rotate = [0,-150,0],
    scale = [1,1,1],
    maps = "map337",
    attach = 0
    };
getRow(413)->
    #task_objCfg {
    id = 413,
    type = 1,
    belong = "孤军奋战I_魔族援军",
    name = "m%m_340",
    location = [249.4,7.8,190.2],
    rotate = [0,-130,0],
    scale = [1,1,1],
    maps = "map337",
    attach = 0
    };
getRow(414)->
    #task_objCfg {
    id = 414,
    type = 1,
    belong = "孤军奋战I_魔族援军",
    name = "m%m_340",
    location = [247.3,7.8,192.7],
    rotate = [0,-130,0],
    scale = [1,1,1],
    maps = "map337",
    attach = 0
    };
getRow(415)->
    #task_objCfg {
    id = 415,
    type = 1,
    belong = "孤军奋战I_魔族援军",
    name = "m%m_340",
    location = [241,7.8,196.7],
    rotate = [0,-155,0],
    scale = [1,1,1],
    maps = "map337",
    attach = 0
    };
getRow(416)->
    #task_objCfg {
    id = 416,
    type = 1,
    belong = "孤军奋战I_魔族援军",
    name = "m%m_340",
    location = [232.4,7.8,198.2],
    rotate = [0,180,0],
    scale = [1,1,1],
    maps = "map337",
    attach = 0
    };
getRow(417)->
    #task_objCfg {
    id = 417,
    type = 1,
    belong = "孤军奋战I_魔族援军",
    name = "m%m_340",
    location = [223.5,7.8,195.9],
    rotate = [0,140,0],
    scale = [1,1,1],
    maps = "map337",
    attach = 0
    };
getRow(418)->
    #task_objCfg {
    id = 418,
    type = 1,
    belong = "汇合_精灵首领",
    name = "n%n_12",
    location = [249.7,7.8,210],
    rotate = [0,-150,0],
    scale = [1,1,1],
    maps = "map337",
    attach = 0
    };
getRow(419)->
    #task_objCfg {
    id = 419,
    type = 1,
    belong = "汇合_精灵士兵",
    name = "n%n_13",
    location = [261,7.8,206.6],
    rotate = [0,-145,0],
    scale = [1,1,1],
    maps = "map337",
    attach = 0
    };
getRow(420)->
    #task_objCfg {
    id = 420,
    type = 1,
    belong = "汇合_精灵士兵",
    name = "n%n_13",
    location = [257.9,7.8,208.2],
    rotate = [0,-145,0],
    scale = [1,1,1],
    maps = "map337",
    attach = 0
    };
getRow(421)->
    #task_objCfg {
    id = 421,
    type = 1,
    belong = "汇合_精灵士兵",
    name = "n%n_13",
    location = [255.1,7.8,209.6],
    rotate = [0,-145,0],
    scale = [1,1,1],
    maps = "map337",
    attach = 0
    };
getRow(422)->
    #task_objCfg {
    id = 422,
    type = 1,
    belong = "汇合_精灵士兵",
    name = "n%n_13",
    location = [247,7.8,213.9],
    rotate = [0,-150,0],
    scale = [1,1,1],
    maps = "map337",
    attach = 0
    };
getRow(423)->
    #task_objCfg {
    id = 423,
    type = 1,
    belong = "汇合_精灵士兵",
    name = "n%n_13",
    location = [244.3,7.8,215.2],
    rotate = [0,-150,0],
    scale = [1,1,1],
    maps = "map337",
    attach = 0
    };
getRow(424)->
    #task_objCfg {
    id = 424,
    type = 1,
    belong = "汇合_精灵士兵",
    name = "n%n_13",
    location = [241.3,7.8,216.8],
    rotate = [0,-150,0],
    scale = [1,1,1],
    maps = "map337",
    attach = 0
    };
getRow(425)->
    #task_objCfg {
    id = 425,
    type = 1,
    belong = "前往魔族祭坛_精灵首领",
    name = "n%n_12",
    location = [288.5,23.9,329.4],
    rotate = [0,-30,0],
    scale = [1,1,1],
    maps = "map337",
    attach = 0
    };
getRow(426)->
    #task_objCfg {
    id = 426,
    type = 1,
    belong = "前往魔族祭坛_精灵士兵",
    name = "n%n_13",
    location = [283.6,23.9,326.7],
    rotate = [0,-20,0],
    scale = [1,1,1],
    maps = "map337",
    attach = 0
    };
getRow(427)->
    #task_objCfg {
    id = 427,
    type = 1,
    belong = "前往魔族祭坛_精灵士兵",
    name = "n%n_13",
    location = [277.1,23.9,325.1],
    rotate = [0,-15,0],
    scale = [1,1,1],
    maps = "map337",
    attach = 0
    };
getRow(428)->
    #task_objCfg {
    id = 428,
    type = 1,
    belong = "前往魔族祭坛_精灵士兵",
    name = "n%n_13",
    location = [270.3,23.9,324.6],
    rotate = [0,5,0],
    scale = [1,1,1],
    maps = "map337",
    attach = 0
    };
getRow(429)->
    #task_objCfg {
    id = 429,
    type = 1,
    belong = "前往魔族祭坛_精灵士兵",
    name = "n%n_13",
    location = [293.2,23.9,332.5],
    rotate = [0,-40,0],
    scale = [1,1,1],
    maps = "map337",
    attach = 0
    };
getRow(430)->
    #task_objCfg {
    id = 430,
    type = 1,
    belong = "前往魔族祭坛_精灵士兵",
    name = "n%n_13",
    location = [296.9,23.9,336.3],
    rotate = [0,-50,0],
    scale = [1,1,1],
    maps = "map337",
    attach = 0
    };
getRow(431)->
    #task_objCfg {
    id = 431,
    type = 1,
    belong = "前往魔族祭坛_精灵士兵",
    name = "n%n_13",
    location = [299.3,23.9,340.2],
    rotate = [0,-60,0],
    scale = [1,1,1],
    maps = "map337",
    attach = 0
    };
getRow(432)->
    #task_objCfg {
    id = 432,
    type = 1,
    belong = "前往魔族祭坛_黄沙统领",
    name = "m%m_335",
    location = [273.6,23.9,348.2],
    rotate = [0,140,0],
    scale = [1.6,1.6,1.6],
    maps = "map337",
    attach = 0
    };
getRow(433)->
    #task_objCfg {
    id = 433,
    type = 1,
    belong = "怪兽出笼III_血之祭司",
    name = "m%m_338",
    location = [280.7,23.9,350],
    rotate = [0,-130,0],
    scale = [1.6,1.6,1.6],
    maps = "map337",
    attach = 0
    };
getRow(434)->
    #task_objCfg {
    id = 434,
    type = 1,
    belong = "前往交界地II_精灵少年",
    name = "m%m_147",
    location = [327.9,7.8,86.7],
    rotate = [0,10,0],
    scale = [1,1,1],
    maps = "map337",
    attach = 0
    };
getRow(435)->
    #task_objCfg {
    id = 435,
    type = 1,
    belong = "精灵避难所_精灵首领",
    name = "n%n_12",
    location = [332.3,7.8,94.7],
    rotate = [0,-170,0],
    scale = [1,1,1],
    maps = "map337",
    attach = 0
    };
getRow(436)->
    #task_objCfg {
    id = 436,
    type = 1,
    belong = "精灵避难所_精灵卫兵",
    name = "n%n_13",
    location = [328.1,7.8,97.4],
    rotate = [0,-170,0],
    scale = [1,1,1],
    maps = "map337",
    attach = 0
    };
getRow(437)->
    #task_objCfg {
    id = 437,
    type = 1,
    belong = "精灵避难所_精灵卫兵",
    name = "n%n_13",
    location = [337,7.8,96.6],
    rotate = [0,-170,0],
    scale = [1,1,1],
    maps = "map337",
    attach = 0
    };
getRow(438)->
    #task_objCfg {
    id = 438,
    type = 1,
    belong = "紧跟精灵首领_精灵首领",
    name = "n%n_12",
    location = [182.7,30,95.3],
    rotate = [0,20,0],
    scale = [1,1,1],
    maps = "map335",
    attach = 0
    };
getRow(439)->
    #task_objCfg {
    id = 439,
    type = 1,
    belong = "紧跟精灵首领_精灵卫兵",
    name = "n%n_13",
    location = [184.2,30.3,92.1],
    rotate = [0,20,0],
    scale = [1,1,1],
    maps = "map335",
    attach = 0
    };
getRow(440)->
    #task_objCfg {
    id = 440,
    type = 1,
    belong = "紧跟精灵首领_精灵卫兵",
    name = "n%n_13",
    location = [179,30,93.8],
    rotate = [0,20,0],
    scale = [1,1,1],
    maps = "map335",
    attach = 0
    };
getRow(441)->
    #task_objCfg {
    id = 441,
    type = 1,
    belong = "避风头_精灵老人",
    name = "n%n_68",
    location = [179.4,30,120],
    rotate = [0,-170,0],
    scale = [1,1,1],
    maps = "map335",
    attach = 0
    };
getRow(442)->
    #task_objCfg {
    id = 442,
    type = 1,
    belong = "可疑的陌生人_陌生人",
    name = "m%m_23",
    location = [50.5,30.1,194.7],
    rotate = [0,90,0],
    scale = [1,1,1],
    maps = "map335",
    attach = 0
    };
getRow(443)->
    #task_objCfg {
    id = 443,
    type = 1,
    belong = "抢救伤者_精灵伤者",
    name = "n%n_41",
    location = [54.3,30.2,201.4],
    rotate = [90,80,0],
    scale = [1,1,1],
    maps = "map335",
    attach = 0
    };
getRow(444)->
    #task_objCfg {
    id = 444,
    type = 1,
    belong = "有惊无险_异魔人首领",
    name = "m%m_125",
    location = [54.8,30.2,204],
    rotate = [0,160,0],
    scale = [1,1,1],
    maps = "map335",
    attach = 0
    };
getRow(445)->
    #task_objCfg {
    id = 445,
    type = 1,
    belong = "精灵族的宴会_精灵首领",
    name = "n%n_12",
    location = [254,44.5,408.6],
    rotate = [0,180,0],
    scale = [1,1,1],
    maps = "map335",
    attach = 0
    };
getRow(446)->
    #task_objCfg {
    id = 446,
    type = 1,
    belong = "精灵族的宴会_紧张先生",
    name = "n%n_17",
    location = [251.2,44.5,392.3],
    rotate = [0,20,0],
    scale = [1,1,1],
    maps = "map335",
    attach = 0
    };
getRow(447)->
    #task_objCfg {
    id = 447,
    type = 1,
    belong = "女神的怒火_露娜女神",
    name = "n%n_1",
    location = [246.1,44.5,404.9],
    rotate = [0,140,0],
    scale = [1,1,1],
    maps = "map335",
    attach = 0
    };
getRow(448)->
    #task_objCfg {
    id = 448,
    type = 1,
    belong = "善后I_异魔人首领",
    name = "m%m_125",
    location = [255.9,44.5,405],
    rotate = [0,-140,0],
    scale = [1,1,1],
    maps = "map335",
    attach = 0
    };
getRow(449)->
    #task_objCfg {
    id = 449,
    type = 1,
    belong = "追凶II_魔族恶徒残党",
    name = "m%m_340",
    location = [307.2,55.6,188.7],
    rotate = [0,-70,0],
    scale = [1,1,1],
    maps = "map335",
    attach = 0
    };
getRow(450)->
    #task_objCfg {
    id = 450,
    type = 1,
    belong = "追凶II_魔族恶徒残党",
    name = "m%m_340",
    location = [305.6,56.4,185.5],
    rotate = [0,-60,0],
    scale = [1,1,1],
    maps = "map335",
    attach = 0
    };
getRow(451)->
    #task_objCfg {
    id = 451,
    type = 1,
    belong = "追凶II_魔族恶徒残党",
    name = "m%m_340",
    location = [303.4,55.4,182.3],
    rotate = [0,-55,0],
    scale = [1,1,1],
    maps = "map335",
    attach = 0
    };
getRow(452)->
    #task_objCfg {
    id = 452,
    type = 1,
    belong = "追凶III_魔族恶徒残党",
    name = "m%m_340",
    location = [351.8,55.8,145.4],
    rotate = [0,60,0],
    scale = [1,1,1],
    maps = "map335",
    attach = 0
    };
getRow(453)->
    #task_objCfg {
    id = 453,
    type = 1,
    belong = "追凶III_魔族恶徒残党",
    name = "m%m_340",
    location = [352.8,54.3,142.6],
    rotate = [0,60,0],
    scale = [1,1,1],
    maps = "map335",
    attach = 0
    };
getRow(454)->
    #task_objCfg {
    id = 454,
    type = 1,
    belong = "追凶III_魔族恶徒残党",
    name = "m%m_340",
    location = [350,55.4,147.5],
    rotate = [0,60,0],
    scale = [1,1,1],
    maps = "map335",
    attach = 0
    };
getRow(455)->
    #task_objCfg {
    id = 455,
    type = 1,
    belong = "追凶IV_魔族恶徒残党",
    name = "m%m_340",
    location = [326.9,25.9,81.7],
    rotate = [0,10,0],
    scale = [1,1,1],
    maps = "map335",
    attach = 0
    };
getRow(456)->
    #task_objCfg {
    id = 456,
    type = 1,
    belong = "追凶IV_魔族恶徒残党",
    name = "m%m_340",
    location = [333.5,26.3,81.6],
    rotate = [0,-5,0],
    scale = [1,1,1],
    maps = "map335",
    attach = 0
    };
getRow(457)->
    #task_objCfg {
    id = 457,
    type = 1,
    belong = "追凶IV_魔族恶徒残党",
    name = "m%m_340",
    location = [330.4,26.9,81.9],
    rotate = [0,0,0],
    scale = [1,1,1],
    maps = "map335",
    attach = 0
    };
getRow(458)->
    #task_objCfg {
    id = 458,
    type = 1,
    belong = "危机90秒_魔族恶徒首领",
    name = "m%m_339",
    location = [355.3,20.3,50.3],
    rotate = [0,-60,0],
    scale = [1,1,1],
    maps = "map335",
    attach = 0
    };
getRow(459)->
    #task_objCfg {
    id = 459,
    type = 1,
    belong = "危机1秒_炸弹",
    name = "m%m_14",
    location = [358.8,16.7,49.5],
    rotate = [0,0,0],
    scale = [2,2,2],
    maps = "map335",
    attach = 0
    };
getRow(460)->
    #task_objCfg {
    id = 460,
    type = 1,
    belong = "押解罪人II_精灵首领",
    name = "n%n_12",
    location = [252,44.5,406.1],
    rotate = [0,180,0],
    scale = [1,1,1],
    maps = "map335",
    attach = 0
    };
getRow(461)->
    #task_objCfg {
    id = 461,
    type = 2,
    belong = "位面点光效_前往精灵故土",
    name = "vfx_26_4",
    location = [262.5,58.3,73.1],
    rotate = [0,0,0],
    scale = [1,1,1],
    maps = "map334",
    attach = 0
    };
getRow(462)->
    #task_objCfg {
    id = 462,
    type = 2,
    belong = "武器架光效_军需物资1",
    name = "vfx_26_21",
    location = [555.1,85.6,466.8],
    rotate = [0,0,0],
    scale = [3,3,3],
    maps = "map334",
    attach = 0
    };
getRow(463)->
    #task_objCfg {
    id = 463,
    type = 2,
    belong = "武器架光效_军需物资1",
    name = "vfx_26_4",
    location = [555.1,85.6,466.8],
    rotate = [0,0,0],
    scale = [3,3,3],
    maps = "map334",
    attach = 0
    };
getRow(464)->
    #task_objCfg {
    id = 464,
    type = 2,
    belong = "武器架光效_军需物资2",
    name = "vfx_26_21",
    location = [588.3,85.6,458.5],
    rotate = [0,0,0],
    scale = [3,3,3],
    maps = "map334",
    attach = 0
    };
getRow(465)->
    #task_objCfg {
    id = 465,
    type = 2,
    belong = "武器架光效_军需物资2",
    name = "vfx_26_4",
    location = [588.3,85.6,458.5],
    rotate = [0,0,0],
    scale = [3,3,3],
    maps = "map334",
    attach = 0
    };
getRow(466)->
    #task_objCfg {
    id = 466,
    type = 2,
    belong = "位面点光效_前往精灵故土",
    name = "vfx_26_4",
    location = [334.4,73.1,322.3],
    rotate = [0,0,0],
    scale = [1,1,1],
    maps = "map334",
    attach = 0
    };
getRow(467)->
    #task_objCfg {
    id = 467,
    type = 2,
    belong = "位面点光效_追击元凶",
    name = "vfx_26_4",
    location = [177,54.5,248],
    rotate = [0,0,0],
    scale = [1,1,1],
    maps = "map334",
    attach = 0
    };
getRow(468)->
    #task_objCfg {
    id = 468,
    type = 2,
    belong = "位面点光效_囚禁高地",
    name = "vfx_26_4",
    location = [76.7,73.1,350.2],
    rotate = [0,0,0],
    scale = [1,1,1],
    maps = "map334",
    attach = 0
    };
getRow(469)->
    #task_objCfg {
    id = 469,
    type = 2,
    belong = "解救精灵_侦查敌情",
    name = "vfx_26_4",
    location = [144.2,73.1,420.8],
    rotate = [0,0,0],
    scale = [4,4,4],
    maps = "map334",
    attach = 0
    };
getRow(470)->
    #task_objCfg {
    id = 470,
    type = 2,
    belong = "位面点光效_前往精灵故土",
    name = "vfx_26_4",
    location = [278.4,73.1,351.8],
    rotate = [0,0,0],
    scale = [1,1,1],
    maps = "map334",
    attach = 0
    };
getRow(471)->
    #task_objCfg {
    id = 471,
    type = 2,
    belong = "位面点光效_占领1",
    name = "vfx_26_4",
    location = [438.6,86,475.1],
    rotate = [0,0,0],
    scale = [1,1,1],
    maps = "map334",
    attach = 0
    };
getRow(472)->
    #task_objCfg {
    id = 472,
    type = 2,
    belong = "位面点光效_占领1",
    name = "vfx_26_4",
    location = [143.9,86.3,487.5],
    rotate = [0,0,0],
    scale = [1,1,1],
    maps = "map334",
    attach = 0
    };
getRow(473)->
    #task_objCfg {
    id = 473,
    type = 2,
    belong = "位面点光效_解放精灵故土",
    name = "vfx_26_4",
    location = [274,91.7,522.3],
    rotate = [0,0,0],
    scale = [1,1,1],
    maps = "map334",
    attach = 0
    };
getRow(474)->
    #task_objCfg {
    id = 474,
    type = 2,
    belong = "位面点光效_追踪开始",
    name = "vfx_26_4",
    location = [275.3,91.1,497.9],
    rotate = [0,0,0],
    scale = [1,1,1],
    maps = "map334",
    attach = 0
    };
getRow(475)->
    #task_objCfg {
    id = 475,
    type = 2,
    belong = "位面点光效_暂避锋芒",
    name = "vfx_26_4",
    location = [67.1,36.3,154.3],
    rotate = [0,0,0],
    scale = [1,1,1],
    maps = "map337",
    attach = 0
    };
getRow(476)->
    #task_objCfg {
    id = 476,
    type = 2,
    belong = "位面点光效",
    name = "vfx_26_4",
    location = [143.3,43.1,315.3],
    rotate = [0,0,0],
    scale = [1,1,1],
    maps = "map337",
    attach = 0
    };
getRow(477)->
    #task_objCfg {
    id = 477,
    type = 2,
    belong = "位面点光效",
    name = "vfx_26_4",
    location = [194.2,42.5,341],
    rotate = [0,0,0],
    scale = [1,1,1],
    maps = "map337",
    attach = 0
    };
getRow(478)->
    #task_objCfg {
    id = 478,
    type = 2,
    belong = "位面点光效",
    name = "vfx_26_4",
    location = [236.8,7.8,183],
    rotate = [0,0,0],
    scale = [1,1,1],
    maps = "map337",
    attach = 0
    };
getRow(479)->
    #task_objCfg {
    id = 479,
    type = 2,
    belong = "位面点光效_孤军奋战II",
    name = "vfx_26_4",
    location = [223.8,7.8,191],
    rotate = [0,0,0],
    scale = [1,1,1],
    maps = "map337",
    attach = 0
    };
getRow(480)->
    #task_objCfg {
    id = 480,
    type = 2,
    belong = "位面点光效_孤军奋战III",
    name = "vfx_26_4",
    location = [239.5,7.8,199.3],
    rotate = [0,0,0],
    scale = [1,1,1],
    maps = "map337",
    attach = 0
    };
getRow(481)->
    #task_objCfg {
    id = 481,
    type = 2,
    belong = "位面点光效_汇合",
    name = "vfx_26_4",
    location = [245.7,7.8,206.2],
    rotate = [0,0,0],
    scale = [1,1,1],
    maps = "map337",
    attach = 0
    };
getRow(482)->
    #task_objCfg {
    id = 482,
    type = 2,
    belong = "位面点光效_前往交界地I",
    name = "vfx_26_4",
    location = [334,7.8,233.7],
    rotate = [0,0,0],
    scale = [1,1,1],
    maps = "map337",
    attach = 0
    };
getRow(483)->
    #task_objCfg {
    id = 483,
    type = 2,
    belong = "位面点光效_前往交界地II",
    name = "vfx_26_4",
    location = [331.5,7.8,88.5],
    rotate = [0,0,0],
    scale = [1,1,1],
    maps = "map337",
    attach = 0
    };
getRow(484)->
    #task_objCfg {
    id = 484,
    type = 2,
    belong = "位面点光效_前往交界地II",
    name = "vfx_26_4",
    location = [181.2,30,116.8],
    rotate = [0,0,0],
    scale = [1,1,1],
    maps = "map335",
    attach = 0
    };
getRow(485)->
    #task_objCfg {
    id = 485,
    type = 2,
    belong = "位面点光效_尊老爱幼",
    name = "vfx_26_4",
    location = [182.8,30.3,204],
    rotate = [0,0,0],
    scale = [1,1,1],
    maps = "map335",
    attach = 0
    };
getRow(486)->
    #task_objCfg {
    id = 486,
    type = 2,
    belong = "位面点光效_送货上门",
    name = "vfx_26_4",
    location = [56.2,30.2,194.6],
    rotate = [0,0,0],
    scale = [1,1,1],
    maps = "map335",
    attach = 0
    };
getRow(487)->
    #task_objCfg {
    id = 487,
    type = 2,
    belong = "酒桶_1",
    name = "vfx_26_21",
    location = [175.5,29.9,229.3],
    rotate = [0,0,0],
    scale = [1,1,1],
    maps = "map335",
    attach = 0
    };
getRow(488)->
    #task_objCfg {
    id = 488,
    type = 2,
    belong = "酒桶_2",
    name = "vfx_26_4",
    location = [175.5,29.9,229.3],
    rotate = [0,0,0],
    scale = [1,1,1],
    maps = "map335",
    attach = 0
    };
getRow(489)->
    #task_objCfg {
    id = 489,
    type = 2,
    belong = "酒桶_1",
    name = "vfx_26_21",
    location = [179.3,29.9,23.5],
    rotate = [0,0,0],
    scale = [1,1,1],
    maps = "map335",
    attach = 0
    };
getRow(490)->
    #task_objCfg {
    id = 490,
    type = 2,
    belong = "酒桶_2",
    name = "vfx_26_4",
    location = [179.3,29.9,23.5],
    rotate = [0,0,0],
    scale = [1,1,1],
    maps = "map335",
    attach = 0
    };
getRow(491)->
    #task_objCfg {
    id = 491,
    type = 2,
    belong = "位面点光效_美酒随行",
    name = "vfx_26_4",
    location = [246.5,33.9,209.9],
    rotate = [0,0,0],
    scale = [1,1,1],
    maps = "map335",
    attach = 0
    };
getRow(492)->
    #task_objCfg {
    id = 492,
    type = 2,
    belong = "位面点光效_美酒随行",
    name = "vfx_26_4",
    location = [296.2,33.9,258.6],
    rotate = [0,0,0],
    scale = [1,1,1],
    maps = "map335",
    attach = 0
    };
getRow(493)->
    #task_objCfg {
    id = 493,
    type = 2,
    belong = "位面点光效_美酒随行",
    name = "vfx_26_4",
    location = [278.9,39.5,296.8],
    rotate = [0,0,0],
    scale = [1,1,1],
    maps = "map335",
    attach = 0
    };
getRow(494)->
    #task_objCfg {
    id = 494,
    type = 2,
    belong = "位面点光效_调查1",
    name = "vfx_26_4",
    location = [251.6,42.3,354.2],
    rotate = [0,0,0],
    scale = [1,1,1],
    maps = "map335",
    attach = 0
    };
getRow(495)->
    #task_objCfg {
    id = 495,
    type = 2,
    belong = "位面点光效_调查2",
    name = "vfx_26_4",
    location = [209.5,42.3,383.4],
    rotate = [0,0,0],
    scale = [1,1,1],
    maps = "map335",
    attach = 0
    };
getRow(496)->
    #task_objCfg {
    id = 496,
    type = 2,
    belong = "位面点光效_服务1",
    name = "vfx_26_4",
    location = [237.7,44.5,394.5],
    rotate = [0,0,0],
    scale = [1,1,1],
    maps = "map335",
    attach = 0
    };
getRow(497)->
    #task_objCfg {
    id = 497,
    type = 2,
    belong = "位面点光效_服务2",
    name = "vfx_26_4",
    location = [248.7,44.5,391.2],
    rotate = [0,0,0],
    scale = [1,1,1],
    maps = "map335",
    attach = 0
    };
getRow(498)->
    #task_objCfg {
    id = 498,
    type = 2,
    belong = "位面点光效_服务3",
    name = "vfx_26_4",
    location = [253.6,44.5,404.5],
    rotate = [0,0,0],
    scale = [1,1,1],
    maps = "map335",
    attach = 0
    };
getRow(499)->
    #task_objCfg {
    id = 499,
    type = 2,
    belong = "位面点光效_追凶1",
    name = "vfx_26_4",
    location = [301.4,54.5,186.4],
    rotate = [0,0,0],
    scale = [1,1,1],
    maps = "map335",
    attach = 0
    };
getRow(500)->
    #task_objCfg {
    id = 500,
    type = 2,
    belong = "位面点光效_追凶2",
    name = "vfx_26_4",
    location = [356.4,58.5,146.4],
    rotate = [0,0,0],
    scale = [1,1,1],
    maps = "map335",
    attach = 0
    };
getRow(501)->
    #task_objCfg {
    id = 501,
    type = 2,
    belong = "位面点光效_追凶3",
    name = "vfx_26_4",
    location = [330.2,26.5,84.2],
    rotate = [0,0,0],
    scale = [1,1,1],
    maps = "map335",
    attach = 0
    };
getRow(502)->
    #task_objCfg {
    id = 502,
    type = 2,
    belong = "光效_炸弹光1",
    name = "vfx_26_4",
    location = [358.8,20.3,49.5],
    rotate = [0,0,0],
    scale = [1,1,1],
    maps = "map335",
    attach = 0
    };
getRow(503)->
    #task_objCfg {
    id = 503,
    type = 2,
    belong = "光效_炸弹光2",
    name = "vfx_26_21",
    location = [358.8,20.3,49.5],
    rotate = [0,0,0],
    scale = [1,1,1],
    maps = "map335",
    attach = 0
    };
getRow(504)->
    #task_objCfg {
    id = 504,
    type = 2,
    belong = "光效_押解罪人1",
    name = "vfx_26_4",
    location = [307.4,57.2,184.7],
    rotate = [0,0,0],
    scale = [1,1,1],
    maps = "map335",
    attach = 0
    };
getRow(505)->
    #task_objCfg {
    id = 505,
    type = 2,
    belong = "光效_押解罪人2",
    name = "vfx_26_4",
    location = [250.7,44.5,383.4],
    rotate = [0,0,0],
    scale = [1,1,1],
    maps = "map335",
    attach = 0
    };
getRow(506)->
    #task_objCfg {
    id = 506,
    type = 1,
    belong = "露娜女神",
    name = "n%n_1",
    location = [209.4,0.5,200.2],
    rotate = [0,180,0],
    scale = [1,1,1],
    maps = "map340",
    attach = 0
    };
getRow(507)->
    #task_objCfg {
    id = 507,
    type = 2,
    belong = "寻找漂浮之石",
    name = "vfx_26_4",
    location = [196.5,6.7,224.6],
    rotate = [0,0,0],
    scale = [1,1,1],
    maps = "map340",
    attach = 0
    };
getRow(508)->
    #task_objCfg {
    id = 508,
    type = 2,
    belong = "检查追踪仪",
    name = "vfx_26_4",
    location = [205.3,0.5,201.5],
    rotate = [0,0,0],
    scale = [1,1,1],
    maps = "map340",
    attach = 0
    };
getRow(509)->
    #task_objCfg {
    id = 509,
    type = 1,
    belong = "找到安娜-假安娜",
    name = "m%m_82",
    location = [72.1,17.54,224.5],
    rotate = [0,0,0],
    scale = [1,1,1],
    maps = "map333",
    attach = 0
    };
getRow(510)->
    #task_objCfg {
    id = 510,
    type = 1,
    belong = "登船出击-假罗萨特",
    name = "m%m_331",
    location = [76.8,16.7,274.2],
    rotate = [0,180,0],
    scale = [1,1,1],
    maps = "map333",
    attach = 0
    };
getRow(511)->
    #task_objCfg {
    id = 511,
    type = 1,
    belong = "召集水手1",
    name = "n%n_46",
    location = [163,17.05,177],
    rotate = [0,0,0],
    scale = [1,1,1],
    maps = "map333",
    attach = 0
    };
getRow(512)->
    #task_objCfg {
    id = 512,
    type = 1,
    belong = "召集水手2",
    name = "n%n_46",
    location = [175,16.88,178],
    rotate = [0,0,0],
    scale = [1,1,1],
    maps = "map333",
    attach = 0
    };
getRow(513)->
    #task_objCfg {
    id = 513,
    type = 1,
    belong = "召集水手3",
    name = "n%n_46",
    location = [169,16.88,177],
    rotate = [0,0,0],
    scale = [1,1,1],
    maps = "map333",
    attach = 0
    };
getRow(514)->
    #task_objCfg {
    id = 514,
    type = 1,
    belong = "升旗1",
    name = "c%sc_object_qzps_01",
    location = [164.58,17.62,205.13],
    rotate = [0,-74.2,0],
    scale = [2,2,2],
    maps = "map333",
    attach = 0
    };
getRow(515)->
    #task_objCfg {
    id = 515,
    type = 1,
    belong = "升旗2",
    name = "c%sc_object_qzps_01",
    location = [174.19,16.52,195.45],
    rotate = [0,-81.94,0],
    scale = [2.5,2.5,2.5],
    maps = "map333",
    attach = 0
    };
getRow(516)->
    #task_objCfg {
    id = 516,
    type = 1,
    belong = "cos-美人鱼1",
    name = "n%n_50",
    location = [190.19,6.25,290.5],
    rotate = [0,0,0],
    scale = [1,1,1],
    maps = "map340",
    attach = 0
    };
getRow(517)->
    #task_objCfg {
    id = 517,
    type = 1,
    belong = "cos-美人鱼2",
    name = "n%n_51",
    location = [203.8,6.25,290.57],
    rotate = [0,0,0],
    scale = [1,1,1],
    maps = "map340",
    attach = 0
    };
getRow(518)->
    #task_objCfg {
    id = 518,
    type = 1,
    belong = "cos-绅士",
    name = "n%n_400",
    location = [191,7.04,285.56],
    rotate = [0,0,0],
    scale = [1,1,1],
    maps = "map340",
    attach = 0
    };
getRow(519)->
    #task_objCfg {
    id = 519,
    type = 1,
    belong = "cos-船长",
    name = "n%n_17",
    location = [203.1,7.04,285.62],
    rotate = [0,0,0],
    scale = [1,1,1],
    maps = "map340",
    attach = 0
    };
getRow(520)->
    #task_objCfg {
    id = 520,
    type = 1,
    belong = "cos-采蘑菇的女孩",
    name = "n%n_14",
    location = [191.5,6.71,280.13],
    rotate = [0,0,0],
    scale = [1,1,1],
    maps = "map340",
    attach = 0
    };
getRow(521)->
    #task_objCfg {
    id = 521,
    type = 1,
    belong = "cos-女巫",
    name = "n%n_11",
    location = [202.7,6.71,280.14],
    rotate = [0,0,0],
    scale = [1,1,1],
    maps = "map340",
    attach = 0
    };
getRow(522)->
    #task_objCfg {
    id = 522,
    type = 1,
    belong = "cos-舞娘",
    name = "n%n_8",
    location = [192.29,6.71,274.99],
    rotate = [0,0,0],
    scale = [1,1,1],
    maps = "map340",
    attach = 0
    };
getRow(523)->
    #task_objCfg {
    id = 523,
    type = 1,
    belong = "cos-自由女神",
    name = "n%n_7",
    location = [202.1,6.71,275.17],
    rotate = [0,0,0],
    scale = [1,1,1],
    maps = "map340",
    attach = 0
    };
getRow(524)->
    #task_objCfg {
    id = 524,
    type = 1,
    belong = "评审1",
    name = "n%n_9",
    location = [194.5,6.35,300.9],
    rotate = [0,180,0],
    scale = [1,1,1],
    maps = "map340",
    attach = 0
    };
getRow(525)->
    #task_objCfg {
    id = 525,
    type = 1,
    belong = "评审2",
    name = "n%n_10",
    location = [199.4,6.39,301],
    rotate = [0,180,0],
    scale = [1,1,1],
    maps = "map340",
    attach = 0
    };
getRow(526)->
    #task_objCfg {
    id = 526,
    type = 1,
    belong = "cos-女巫第二名",
    name = "n%n_11",
    location = [205.89,13.72,317.61],
    rotate = [0,-61.28,0],
    scale = [1,1,1],
    maps = "map340",
    attach = 0
    };
getRow(527)->
    #task_objCfg {
    id = 527,
    type = 1,
    belong = "cos-自由女神第三名",
    name = "n%n_7",
    location = [206.8,12.57,315.38],
    rotate = [0,-71.53,0],
    scale = [1,1,1],
    maps = "map340",
    attach = 0
    };
getRow(528)->
    #task_objCfg {
    id = 528,
    type = 1,
    belong = "颁奖评审1",
    name = "n%n_9",
    location = [196.4,15.52,324.8],
    rotate = [0,180,0],
    scale = [1,1,1],
    maps = "map340",
    attach = 0
    };
getRow(529)->
    #task_objCfg {
    id = 529,
    type = 1,
    belong = "颁奖评审2",
    name = "n%n_10",
    location = [201,15.52,325.2],
    rotate = [0,180,0],
    scale = [1,1,1],
    maps = "map340",
    attach = 0
    };
getRow(530)->
    #task_objCfg {
    id = 530,
    type = 1,
    belong = "史莱姆国王",
    name = "m%m_347",
    location = [241.56,33.02,349.34],
    rotate = [0,180,0],
    scale = [1,1,1],
    maps = "map332",
    attach = 0
    };
getRow(531)->
    #task_objCfg {
    id = 531,
    type = 1,
    belong = "魔族卫兵",
    name = "n%n_20",
    location = [266.4,29.78,177.58],
    rotate = [0,-43.3,0],
    scale = [1,1,1],
    maps = "map332",
    attach = 0
    };
getRow(532)->
    #task_objCfg {
    id = 532,
    type = 1,
    belong = "年轻的水手",
    name = "n%n_15",
    location = [97.72,16.61,244.59],
    rotate = [0,-17.5,0],
    scale = [1,1,1],
    maps = "map333",
    attach = 0
    };
getRow(533)->
    #task_objCfg {
    id = 533,
    type = 1,
    belong = "熟练的水手",
    name = "n%n_15",
    location = [87.94,16.79,246.16],
    rotate = [0,0,0],
    scale = [1,1,1],
    maps = "map333",
    attach = 0
    };
getRow(534)->
    #task_objCfg {
    id = 534,
    type = 1,
    belong = "年迈的水手",
    name = "n%n_5",
    location = [92.54,16.79,248.74],
    rotate = [0,-21.13,0],
    scale = [1,1,1],
    maps = "map333",
    attach = 0
    };
getRow(535)->
    #task_objCfg {
    id = 535,
    type = 1,
    belong = "沙滩上的女神镜像",
    name = "n%n_1",
    location = [252.03,22.53,99.23],
    rotate = [0,-122.6,0],
    scale = [1,1,1],
    maps = "map332",
    attach = 0
    };
getRow(536)->
    #task_objCfg {
    id = 536,
    type = 1,
    belong = "物归原处特效",
    name = "c%sc_object_26118",
    location = [336.66,39.53,223.6],
    rotate = [0,0,0],
    scale = [1,1,1],
    maps = "map332",
    attach = 0
    };
getRow(537)->
    #task_objCfg {
    id = 537,
    type = 2,
    belong = "武器架光效",
    name = "vfx_26_21",
    location = [164.58,17.62,205.13],
    rotate = [0,0,0],
    scale = [2,2,2],
    maps = "map333",
    attach = 0
    };
getRow(538)->
    #task_objCfg {
    id = 538,
    type = 1,
    belong = "年轻的水手",
    name = "n%n_15",
    location = [115.7,17.10,231.7],
    rotate = [0,-149.79,0],
    scale = [1,1,1],
    maps = "map333",
    attach = 0
    };
getRow(539)->
    #task_objCfg {
    id = 539,
    type = 1,
    belong = "熟练的水手",
    name = "n%n_15",
    location = [143.47,17.60,221.93],
    rotate = [0,-156.5,0],
    scale = [1,1,1],
    maps = "map333",
    attach = 0
    };
getRow(540)->
    #task_objCfg {
    id = 540,
    type = 1,
    belong = "年迈的水手",
    name = "n%n_5",
    location = [160.53,17.11,210.3],
    rotate = [0,-169.96,0],
    scale = [1,1,1],
    maps = "map333",
    attach = 0
    };
getRow(541)->
    #task_objCfg {
    id = 541,
    type = 1,
    belong = "露娜女神幻象",
    name = "n%n_1",
    location = [48.59,21.84,80.8],
    rotate = [0,110,0],
    scale = [1,1,1],
    maps = "map333",
    attach = 0
    };
getRow(542)->
    #task_objCfg {
    id = 542,
    type = 1,
    belong = "安娜",
    name = "m%m_82",
    location = [48.22,22,102.21],
    rotate = [0,100,0],
    scale = [1,1,1],
    maps = "map333",
    attach = 0
    };
getRow(543)->
    #task_objCfg {
    id = 543,
    type = 2,
    belong = "召唤的仪式",
    name = "vfx_26_4",
    location = [161.3,34.60,217.5],
    rotate = [0,0,0],
    scale = [1,1,1],
    maps = "map332",
    attach = 0
    };
getRow(544)->
    #task_objCfg {
    id = 544,
    type = 2,
    belong = "召唤的仪式",
    name = "vfx_26_21",
    location = [161.3,34.60,217.5],
    rotate = [0,0,0],
    scale = [1,1,1],
    maps = "map332",
    attach = 0
    };
getRow(545)->
    #task_objCfg {
    id = 545,
    type = 1,
    belong = "物归原处特效",
    name = "c%sc_object_26118",
    location = [331.44,34.65,196.71],
    rotate = [0,0,0],
    scale = [1,1,1],
    maps = "map332",
    attach = 0
    };
getRow(546)->
    #task_objCfg {
    id = 546,
    type = 1,
    belong = "毕业典礼NPC1",
    name = "n%n_47",
    location = [46.85,21.95,167.9],
    rotate = [0,130,0],
    scale = [1,1,1],
    maps = "map333",
    attach = 0
    };
getRow(547)->
    #task_objCfg {
    id = 547,
    type = 1,
    belong = "毕业典礼NPC2",
    name = "n%n_200",
    location = [49.91,20.9,172.15],
    rotate = [0,140,0],
    scale = [1,1,1],
    maps = "map333",
    attach = 0
    };
getRow(548)->
    #task_objCfg {
    id = 548,
    type = 1,
    belong = "毕业典礼NPC3",
    name = "n%n_9",
    location = [43.1,23,155.15],
    rotate = [0,50,0],
    scale = [1,1,1],
    maps = "map333",
    attach = 0
    };
getRow(549)->
    #task_objCfg {
    id = 549,
    type = 1,
    belong = "毕业典礼NPC4",
    name = "n%n_80",
    location = [44.39,22.7,149.6],
    rotate = [0,50,0],
    scale = [1,1,1],
    maps = "map333",
    attach = 0
    };
getRow(550)->
    #task_objCfg {
    id = 550,
    type = 2,
    belong = "毕业典礼特效",
    name = "vfx_26_4",
    location = [48.21,22.14,161.11],
    rotate = [0,0,0],
    scale = [1,1,1],
    maps = "map333",
    attach = 0
    };
getRow(551)->
    #task_objCfg {
    id = 551,
    type = 1,
    belong = "精灵战士",
    name = "m%m_146",
    location = [269.8,30.2,430.5],
    rotate = [80,150,0],
    scale = [1,1,1],
    maps = "map342",
    attach = 0
    };
getRow(552)->
    #task_objCfg {
    id = 552,
    type = 1,
    belong = "恶灵祭司",
    name = "m%m_78",
    location = [191.5,29.5,400.3],
    rotate = [0,0,0],
    scale = [1,1,1],
    maps = "map342",
    attach = 0
    };
getRow(553)->
    #task_objCfg {
    id = 553,
    type = 1,
    belong = "恶灵祭司",
    name = "m%m_78",
    location = [192.2,29.5,417.3],
    rotate = [0,180,0],
    scale = [1,1,1],
    maps = "map342",
    attach = 0
    };
getRow(554)->
    #task_objCfg {
    id = 554,
    type = 1,
    belong = "恶灵祭司",
    name = "m%m_78",
    location = [183.9,29.5,408.7],
    rotate = [0,90,0],
    scale = [1,1,1],
    maps = "map342",
    attach = 0
    };
getRow(555)->
    #task_objCfg {
    id = 555,
    type = 1,
    belong = "恶灵祭司",
    name = "m%m_78",
    location = [201,29.5,408.6],
    rotate = [0,-90,0],
    scale = [1,1,1],
    maps = "map342",
    attach = 0
    };
getRow(556)->
    #task_objCfg {
    id = 556,
    type = 1,
    belong = "恶灵祭司-火堆旁",
    name = "m%m_78",
    location = [67.4,41.5,493.2],
    rotate = [0,60,0],
    scale = [1,1,1],
    maps = "map342",
    attach = 0
    };
getRow(557)->
    #task_objCfg {
    id = 557,
    type = 1,
    belong = "恶灵祭司-火堆旁",
    name = "m%m_78",
    location = [74.1,41.5,501.5],
    rotate = [0,-160,0],
    scale = [1,1,1],
    maps = "map342",
    attach = 0
    };
getRow(558)->
    #task_objCfg {
    id = 558,
    type = 1,
    belong = "恶灵祭司-火堆旁",
    name = "m%m_78",
    location = [77.3,41.5,492.4],
    rotate = [0,-50,0],
    scale = [1,1,1],
    maps = "map342",
    attach = 0
    };
getRow(559)->
    #task_objCfg {
    id = 559,
    type = 1,
    belong = "异魔人战士",
    name = "m%m_122",
    location = [405.6,31.9,21.4],
    rotate = [0,-130,0],
    scale = [1,1,1],
    maps = "map342",
    attach = 0
    };
getRow(560)->
    #task_objCfg {
    id = 560,
    type = 1,
    belong = "异魔人战士",
    name = "m%m_122",
    location = [406.9,31.9,202.5],
    rotate = [0,-50,0],
    scale = [1,1,1],
    maps = "map342",
    attach = 0
    };
getRow(561)->
    #task_objCfg {
    id = 561,
    type = 1,
    belong = "异魔人战士",
    name = "m%m_122",
    location = [397.8,31.7,200.9],
    rotate = [0,10,0],
    scale = [1,1,1],
    maps = "map342",
    attach = 0
    };
getRow(562)->
    #task_objCfg {
    id = 562,
    type = 1,
    belong = "异魔人战士",
    name = "m%m_122",
    location = [399.4,31.7,205.8],
    rotate = [80,150,0],
    scale = [1,1,1],
    maps = "map342",
    attach = 0
    };
getRow(563)->
    #task_objCfg {
    id = 563,
    type = 1,
    belong = "黑暗领主",
    name = "m%m_353",
    location = [390.9,13.8,44.6],
    rotate = [0,-110,0],
    scale = [1,1,1],
    maps = "map342",
    attach = 0
    };
getRow(564)->
    #task_objCfg {
    id = 564,
    type = 1,
    belong = "黑暗爪牙",
    name = "m%m_341",
    location = [392.6,13.8,47.3],
    rotate = [0,-110,0],
    scale = [1,1,1],
    maps = "map342",
    attach = 0
    };
getRow(565)->
    #task_objCfg {
    id = 565,
    type = 1,
    belong = "黑暗爪牙",
    name = "m%m_341",
    location = [393.5,13.8,43.3],
    rotate = [0,-110,0],
    scale = [1,1,1],
    maps = "map342",
    attach = 0
    };
getRow(566)->
    #task_objCfg {
    id = 566,
    type = 1,
    belong = "迷你白",
    name = "m%m_67",
    location = [270,23.4,110.53],
    rotate = [0,60,0],
    scale = [2,2,2],
    maps = "map333",
    attach = 0
    };
getRow(_)->[].

getKeyList()->[
    {1},
    {2},
    {3},
    {4},
    {5},
    {6},
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
    {40},
    {41},
    {42},
    {43},
    {44},
    {45},
    {46},
    {47},
    {48},
    {50},
    {51},
    {52},
    {53},
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
    {113},
    {114},
    {116},
    {117},
    {120},
    {125},
    {126},
    {127},
    {128},
    {129},
    {130},
    {131},
    {132},
    {152},
    {153},
    {154},
    {155},
    {156},
    {157},
    {158},
    {159},
    {160},
    {161},
    {162},
    {163},
    {164},
    {200},
    {201},
    {202},
    {203},
    {204},
    {205},
    {206},
    {207},
    {220},
    {221},
    {222},
    {223},
    {224},
    {225},
    {226},
    {227},
    {228},
    {229},
    {230},
    {231},
    {232},
    {233},
    {234},
    {235},
    {236},
    {237},
    {238},
    {239},
    {240},
    {241},
    {242},
    {243},
    {244},
    {245},
    {246},
    {247},
    {248},
    {249},
    {250},
    {251},
    {252},
    {253},
    {254},
    {255},
    {256},
    {257},
    {258},
    {259},
    {260},
    {261},
    {262},
    {263},
    {264},
    {265},
    {266},
    {267},
    {268},
    {269},
    {270},
    {271},
    {272},
    {273},
    {274},
    {275},
    {276},
    {277},
    {278},
    {279},
    {280},
    {281},
    {282},
    {283},
    {284},
    {285},
    {286},
    {287},
    {288},
    {289},
    {290},
    {291},
    {292},
    {293},
    {294},
    {295},
    {296},
    {297},
    {298},
    {299},
    {300},
    {301},
    {302},
    {310},
    {311},
    {312},
    {313},
    {314},
    {315},
    {316},
    {317},
    {318},
    {319},
    {320},
    {321},
    {322},
    {323},
    {324},
    {325},
    {326},
    {327},
    {328},
    {329},
    {330},
    {331},
    {332},
    {333},
    {350},
    {351},
    {352},
    {353},
    {354},
    {355},
    {356},
    {357},
    {358},
    {359},
    {360},
    {361},
    {362},
    {363},
    {364},
    {365},
    {366},
    {367},
    {368},
    {369},
    {370},
    {371},
    {372},
    {373},
    {374},
    {375},
    {376},
    {377},
    {378},
    {379},
    {380},
    {381},
    {382},
    {383},
    {384},
    {385},
    {386},
    {387},
    {388},
    {389},
    {390},
    {391},
    {392},
    {393},
    {394},
    {395},
    {396},
    {397},
    {398},
    {399},
    {400},
    {401},
    {402},
    {403},
    {404},
    {405},
    {406},
    {407},
    {408},
    {409},
    {410},
    {411},
    {412},
    {413},
    {414},
    {415},
    {416},
    {417},
    {418},
    {419},
    {420},
    {421},
    {422},
    {423},
    {424},
    {425},
    {426},
    {427},
    {428},
    {429},
    {430},
    {431},
    {432},
    {433},
    {434},
    {435},
    {436},
    {437},
    {438},
    {439},
    {440},
    {441},
    {442},
    {443},
    {444},
    {445},
    {446},
    {447},
    {448},
    {449},
    {450},
    {451},
    {452},
    {453},
    {454},
    {455},
    {456},
    {457},
    {458},
    {459},
    {460},
    {461},
    {462},
    {463},
    {464},
    {465},
    {466},
    {467},
    {468},
    {469},
    {470},
    {471},
    {472},
    {473},
    {474},
    {475},
    {476},
    {477},
    {478},
    {479},
    {480},
    {481},
    {482},
    {483},
    {484},
    {485},
    {486},
    {487},
    {488},
    {489},
    {490},
    {491},
    {492},
    {493},
    {494},
    {495},
    {496},
    {497},
    {498},
    {499},
    {500},
    {501},
    {502},
    {503},
    {504},
    {505},
    {506},
    {507},
    {508},
    {509},
    {510},
    {511},
    {512},
    {513},
    {514},
    {515},
    {516},
    {517},
    {518},
    {519},
    {520},
    {521},
    {522},
    {523},
    {524},
    {525},
    {526},
    {527},
    {528},
    {529},
    {530},
    {531},
    {532},
    {533},
    {534},
    {535},
    {536},
    {537},
    {538},
    {539},
    {540},
    {541},
    {542},
    {543},
    {544},
    {545},
    {546},
    {547},
    {548},
    {549},
    {550},
    {551},
    {552},
    {553},
    {554},
    {555},
    {556},
    {557},
    {558},
    {559},
    {560},
    {561},
    {562},
    {563},
    {564},
    {565},
    {566}
    ].

get1KeyList()->[
    1,
    2,
    3,
    4,
    5,
    6,
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
    40,
    41,
    42,
    43,
    44,
    45,
    46,
    47,
    48,
    50,
    51,
    52,
    53,
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
    113,
    114,
    116,
    117,
    120,
    125,
    126,
    127,
    128,
    129,
    130,
    131,
    132,
    152,
    153,
    154,
    155,
    156,
    157,
    158,
    159,
    160,
    161,
    162,
    163,
    164,
    200,
    201,
    202,
    203,
    204,
    205,
    206,
    207,
    220,
    221,
    222,
    223,
    224,
    225,
    226,
    227,
    228,
    229,
    230,
    231,
    232,
    233,
    234,
    235,
    236,
    237,
    238,
    239,
    240,
    241,
    242,
    243,
    244,
    245,
    246,
    247,
    248,
    249,
    250,
    251,
    252,
    253,
    254,
    255,
    256,
    257,
    258,
    259,
    260,
    261,
    262,
    263,
    264,
    265,
    266,
    267,
    268,
    269,
    270,
    271,
    272,
    273,
    274,
    275,
    276,
    277,
    278,
    279,
    280,
    281,
    282,
    283,
    284,
    285,
    286,
    287,
    288,
    289,
    290,
    291,
    292,
    293,
    294,
    295,
    296,
    297,
    298,
    299,
    300,
    301,
    302,
    310,
    311,
    312,
    313,
    314,
    315,
    316,
    317,
    318,
    319,
    320,
    321,
    322,
    323,
    324,
    325,
    326,
    327,
    328,
    329,
    330,
    331,
    332,
    333,
    350,
    351,
    352,
    353,
    354,
    355,
    356,
    357,
    358,
    359,
    360,
    361,
    362,
    363,
    364,
    365,
    366,
    367,
    368,
    369,
    370,
    371,
    372,
    373,
    374,
    375,
    376,
    377,
    378,
    379,
    380,
    381,
    382,
    383,
    384,
    385,
    386,
    387,
    388,
    389,
    390,
    391,
    392,
    393,
    394,
    395,
    396,
    397,
    398,
    399,
    400,
    401,
    402,
    403,
    404,
    405,
    406,
    407,
    408,
    409,
    410,
    411,
    412,
    413,
    414,
    415,
    416,
    417,
    418,
    419,
    420,
    421,
    422,
    423,
    424,
    425,
    426,
    427,
    428,
    429,
    430,
    431,
    432,
    433,
    434,
    435,
    436,
    437,
    438,
    439,
    440,
    441,
    442,
    443,
    444,
    445,
    446,
    447,
    448,
    449,
    450,
    451,
    452,
    453,
    454,
    455,
    456,
    457,
    458,
    459,
    460,
    461,
    462,
    463,
    464,
    465,
    466,
    467,
    468,
    469,
    470,
    471,
    472,
    473,
    474,
    475,
    476,
    477,
    478,
    479,
    480,
    481,
    482,
    483,
    484,
    485,
    486,
    487,
    488,
    489,
    490,
    491,
    492,
    493,
    494,
    495,
    496,
    497,
    498,
    499,
    500,
    501,
    502,
    503,
    504,
    505,
    506,
    507,
    508,
    509,
    510,
    511,
    512,
    513,
    514,
    515,
    516,
    517,
    518,
    519,
    520,
    521,
    522,
    523,
    524,
    525,
    526,
    527,
    528,
    529,
    530,
    531,
    532,
    533,
    534,
    535,
    536,
    537,
    538,
    539,
    540,
    541,
    542,
    543,
    544,
    545,
    546,
    547,
    548,
    549,
    550,
    551,
    552,
    553,
    554,
    555,
    556,
    557,
    558,
    559,
    560,
    561,
    562,
    563,
    564,
    565,
    566
    ].

