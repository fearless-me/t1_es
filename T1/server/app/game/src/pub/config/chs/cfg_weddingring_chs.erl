%% coding: latin-1
%%: 实现
-module(cfg_weddingring_chs).
-compile(export_all).
-include("cfg_weddingring.hrl").
-include("logger.hrl").

getRow(1,1)->
    #weddingringCfg {
    id = 1,
    stage = 1,
    level = 1,
    exp = 2000,
    intimacy = 200,
    name = "心心相印",
    model = "Prefab/role/ring/ring3",
    property = [{135,866},{136,86},{137,86},{138,86},{139,86}],
    levelLimit = 0
    };
getRow(1,2)->
    #weddingringCfg {
    id = 2,
    stage = 1,
    level = 2,
    exp = 4000,
    intimacy = 400,
    name = "心心相印",
    model = "Prefab/role/ring/ring3",
    property = [{135,1736},{136,173},{137,173},{138,173},{139,173}],
    levelLimit = 0
    };
getRow(1,3)->
    #weddingringCfg {
    id = 3,
    stage = 1,
    level = 3,
    exp = 6000,
    intimacy = 600,
    name = "心心相印",
    model = "Prefab/role/ring/ring3",
    property = [{135,2620},{136,262},{137,262},{138,262},{139,262}],
    levelLimit = 0
    };
getRow(1,4)->
    #weddingringCfg {
    id = 4,
    stage = 1,
    level = 4,
    exp = 8000,
    intimacy = 800,
    name = "心心相印",
    model = "Prefab/role/ring/ring3",
    property = [{135,3523},{136,352},{137,352},{138,352},{139,352}],
    levelLimit = 0
    };
getRow(1,5)->
    #weddingringCfg {
    id = 5,
    stage = 1,
    level = 5,
    exp = 10000,
    intimacy = 1000,
    name = "心心相印",
    model = "Prefab/role/ring/ring3",
    property = [{135,4449},{136,444},{137,444},{138,444},{139,444}],
    levelLimit = 0
    };
getRow(1,6)->
    #weddingringCfg {
    id = 6,
    stage = 1,
    level = 6,
    exp = 12000,
    intimacy = 1200,
    name = "心心相印",
    model = "Prefab/role/ring/ring3",
    property = [{135,5402},{136,540},{137,540},{138,540},{139,540}],
    levelLimit = 0
    };
getRow(1,7)->
    #weddingringCfg {
    id = 7,
    stage = 1,
    level = 7,
    exp = 14000,
    intimacy = 1400,
    name = "心心相印",
    model = "Prefab/role/ring/ring3",
    property = [{135,6386},{136,638},{137,638},{138,638},{139,638}],
    levelLimit = 0
    };
getRow(1,8)->
    #weddingringCfg {
    id = 8,
    stage = 1,
    level = 8,
    exp = 16000,
    intimacy = 1600,
    name = "心心相印",
    model = "Prefab/role/ring/ring3",
    property = [{135,7403},{136,740},{137,740},{138,740},{139,740}],
    levelLimit = 0
    };
getRow(1,9)->
    #weddingringCfg {
    id = 9,
    stage = 1,
    level = 9,
    exp = 18000,
    intimacy = 1800,
    name = "心心相印",
    model = "Prefab/role/ring/ring3",
    property = [{135,8457},{136,845},{137,845},{138,845},{139,845}],
    levelLimit = 0
    };
getRow(1,10)->
    #weddingringCfg {
    id = 10,
    stage = 1,
    level = 10,
    exp = 21000,
    intimacy = 2100,
    name = "心心相印",
    model = "Prefab/role/ring/ring3",
    property = [{135,9548},{136,954},{137,954},{138,954},{139,954}],
    break_itemID = [{26005,5}],
    levelLimit = 50
    };
getRow(2,1)->
    #weddingringCfg {
    id = 11,
    stage = 2,
    level = 1,
    exp = 24000,
    intimacy = 2400,
    name = "心心相印",
    model = "Prefab/role/ring/ring3",
    property = [{135,12946},{136,1294},{137,1294},{138,1294},{139,1294}],
    levelLimit = 0
    };
getRow(2,2)->
    #weddingringCfg {
    id = 12,
    stage = 2,
    level = 2,
    exp = 27000,
    intimacy = 2700,
    name = "心心相印",
    model = "Prefab/role/ring/ring3",
    property = [{135,14121},{136,1412},{137,1412},{138,1412},{139,1412}],
    levelLimit = 0
    };
getRow(2,3)->
    #weddingringCfg {
    id = 13,
    stage = 2,
    level = 3,
    exp = 30000,
    intimacy = 3000,
    name = "心心相印",
    model = "Prefab/role/ring/ring3",
    property = [{135,15342},{136,1534},{137,1534},{138,1534},{139,1534}],
    levelLimit = 0
    };
getRow(2,4)->
    #weddingringCfg {
    id = 14,
    stage = 2,
    level = 4,
    exp = 33000,
    intimacy = 3300,
    name = "心心相印",
    model = "Prefab/role/ring/ring3",
    property = [{135,16610},{136,1661},{137,1661},{138,1661},{139,1661}],
    levelLimit = 0
    };
getRow(2,5)->
    #weddingringCfg {
    id = 15,
    stage = 2,
    level = 5,
    exp = 36000,
    intimacy = 3600,
    name = "心心相印",
    model = "Prefab/role/ring/ring3",
    property = [{135,17927},{136,1792},{137,1792},{138,1792},{139,1792}],
    levelLimit = 0
    };
getRow(2,6)->
    #weddingringCfg {
    id = 16,
    stage = 2,
    level = 6,
    exp = 39000,
    intimacy = 3900,
    name = "心心相印",
    model = "Prefab/role/ring/ring3",
    property = [{135,19295},{136,1929},{137,1929},{138,1929},{139,1929}],
    levelLimit = 0
    };
getRow(2,7)->
    #weddingringCfg {
    id = 17,
    stage = 2,
    level = 7,
    exp = 42000,
    intimacy = 4200,
    name = "心心相印",
    model = "Prefab/role/ring/ring3",
    property = [{135,20715},{136,2071},{137,2071},{138,2071},{139,2071}],
    levelLimit = 0
    };
getRow(2,8)->
    #weddingringCfg {
    id = 18,
    stage = 2,
    level = 8,
    exp = 45000,
    intimacy = 4500,
    name = "心心相印",
    model = "Prefab/role/ring/ring3",
    property = [{135,22190},{136,2219},{137,2219},{138,2219},{139,2219}],
    levelLimit = 0
    };
getRow(2,9)->
    #weddingringCfg {
    id = 19,
    stage = 2,
    level = 9,
    exp = 48000,
    intimacy = 4800,
    name = "心心相印",
    model = "Prefab/role/ring/ring3",
    property = [{135,23721},{136,2372},{137,2372},{138,2372},{139,2372}],
    levelLimit = 0
    };
getRow(2,10)->
    #weddingringCfg {
    id = 20,
    stage = 2,
    level = 10,
    exp = 52000,
    intimacy = 5200,
    name = "心心相印",
    model = "Prefab/role/ring/ring3",
    property = [{135,25310},{136,2531},{137,2531},{138,2531},{139,2531}],
    break_itemID = [{26005,30}],
    levelLimit = 60
    };
getRow(3,1)->
    #weddingringCfg {
    id = 21,
    stage = 3,
    level = 1,
    exp = 56000,
    intimacy = 5600,
    name = "心心相印",
    model = "Prefab/role/ring/ring3",
    property = [{135,30255},{136,3025},{137,3025},{138,3025},{139,3025}],
    levelLimit = 0
    };
getRow(3,2)->
    #weddingringCfg {
    id = 22,
    stage = 3,
    level = 2,
    exp = 60000,
    intimacy = 6000,
    name = "心心相印",
    model = "Prefab/role/ring/ring3",
    property = [{135,31964},{136,3196},{137,3196},{138,3196},{139,3196}],
    levelLimit = 0
    };
getRow(3,3)->
    #weddingringCfg {
    id = 23,
    stage = 3,
    level = 3,
    exp = 64000,
    intimacy = 6400,
    name = "心心相印",
    model = "Prefab/role/ring/ring3",
    property = [{135,33736},{136,3373},{137,3373},{138,3373},{139,3373}],
    levelLimit = 0
    };
getRow(3,4)->
    #weddingringCfg {
    id = 24,
    stage = 3,
    level = 4,
    exp = 68000,
    intimacy = 6800,
    name = "心心相印",
    model = "Prefab/role/ring/ring3",
    property = [{135,35571},{136,3557},{137,3557},{138,3557},{139,3557}],
    levelLimit = 0
    };
getRow(3,5)->
    #weddingringCfg {
    id = 25,
    stage = 3,
    level = 5,
    exp = 72000,
    intimacy = 7200,
    name = "心心相印",
    model = "Prefab/role/ring/ring3",
    property = [{135,37472},{136,3747},{137,3747},{138,3747},{139,3747}],
    levelLimit = 0
    };
getRow(3,6)->
    #weddingringCfg {
    id = 26,
    stage = 3,
    level = 6,
    exp = 76000,
    intimacy = 7600,
    name = "心心相印",
    model = "Prefab/role/ring/ring3",
    property = [{135,39439},{136,3943},{137,3943},{138,3943},{139,3943}],
    levelLimit = 0
    };
getRow(3,7)->
    #weddingringCfg {
    id = 27,
    stage = 3,
    level = 7,
    exp = 80000,
    intimacy = 8000,
    name = "心心相印",
    model = "Prefab/role/ring/ring3",
    property = [{135,41474},{136,4147},{137,4147},{138,4147},{139,4147}],
    levelLimit = 0
    };
getRow(3,8)->
    #weddingringCfg {
    id = 28,
    stage = 3,
    level = 8,
    exp = 84000,
    intimacy = 8400,
    name = "心心相印",
    model = "Prefab/role/ring/ring3",
    property = [{135,43579},{136,4357},{137,4357},{138,4357},{139,4357}],
    levelLimit = 0
    };
getRow(3,9)->
    #weddingringCfg {
    id = 29,
    stage = 3,
    level = 9,
    exp = 88000,
    intimacy = 8800,
    name = "心心相印",
    model = "Prefab/role/ring/ring3",
    property = [{135,45755},{136,4575},{137,4575},{138,4575},{139,4575}],
    levelLimit = 0
    };
getRow(3,10)->
    #weddingringCfg {
    id = 30,
    stage = 3,
    level = 10,
    exp = 94000,
    intimacy = 9400,
    name = "心心相印",
    model = "Prefab/role/ring/ring3",
    property = [{135,48002},{136,4800},{137,4800},{138,4800},{139,4800}],
    break_itemID = [{26005,50}],
    levelLimit = 80
    };
getRow(4,1)->
    #weddingringCfg {
    id = 31,
    stage = 4,
    level = 1,
    exp = 100000,
    intimacy = 10000,
    name = "心心相印",
    model = "Prefab/role/ring/ring3",
    property = [{135,54965},{136,5496},{137,5496},{138,5496},{139,5496}],
    levelLimit = 0
    };
getRow(4,2)->
    #weddingringCfg {
    id = 32,
    stage = 4,
    level = 2,
    exp = 106000,
    intimacy = 10600,
    name = "心心相印",
    model = "Prefab/role/ring/ring3",
    property = [{135,57360},{136,5736},{137,5736},{138,5736},{139,5736}],
    levelLimit = 0
    };
getRow(4,3)->
    #weddingringCfg {
    id = 33,
    stage = 4,
    level = 3,
    exp = 112000,
    intimacy = 11200,
    name = "心心相印",
    model = "Prefab/role/ring/ring3",
    property = [{135,59832},{136,5983},{137,5983},{138,5983},{139,5983}],
    levelLimit = 0
    };
getRow(4,4)->
    #weddingringCfg {
    id = 34,
    stage = 4,
    level = 4,
    exp = 118000,
    intimacy = 11800,
    name = "心心相印",
    model = "Prefab/role/ring/ring3",
    property = [{135,62380},{136,6238},{137,6238},{138,6238},{139,6238}],
    levelLimit = 0
    };
getRow(4,5)->
    #weddingringCfg {
    id = 35,
    stage = 4,
    level = 5,
    exp = 124000,
    intimacy = 12400,
    name = "心心相印",
    model = "Prefab/role/ring/ring3",
    property = [{135,65006},{136,6500},{137,6500},{138,6500},{139,6500}],
    levelLimit = 0
    };
getRow(4,6)->
    #weddingringCfg {
    id = 36,
    stage = 4,
    level = 6,
    exp = 130000,
    intimacy = 13000,
    name = "心心相印",
    model = "Prefab/role/ring/ring3",
    property = [{135,67712},{136,6771},{137,6771},{138,6771},{139,6771}],
    levelLimit = 0
    };
getRow(4,7)->
    #weddingringCfg {
    id = 37,
    stage = 4,
    level = 7,
    exp = 136000,
    intimacy = 13600,
    name = "心心相印",
    model = "Prefab/role/ring/ring3",
    property = [{135,70498},{136,7049},{137,7049},{138,7049},{139,7049}],
    levelLimit = 0
    };
getRow(4,8)->
    #weddingringCfg {
    id = 38,
    stage = 4,
    level = 8,
    exp = 142000,
    intimacy = 14200,
    name = "心心相印",
    model = "Prefab/role/ring/ring3",
    property = [{135,73367},{136,7336},{137,7336},{138,7336},{139,7336}],
    levelLimit = 0
    };
getRow(4,9)->
    #weddingringCfg {
    id = 39,
    stage = 4,
    level = 9,
    exp = 148000,
    intimacy = 14800,
    name = "心心相印",
    model = "Prefab/role/ring/ring3",
    property = [{135,76317},{136,7631},{137,7631},{138,7631},{139,7631}],
    levelLimit = 0
    };
getRow(4,10)->
    #weddingringCfg {
    id = 40,
    stage = 4,
    level = 10,
    exp = 156000,
    intimacy = 15600,
    name = "心心相印",
    model = "Prefab/role/ring/ring3",
    property = [{135,79352},{136,7935},{137,7935},{138,7935},{139,7935}],
    break_itemID = [{26005,80}],
    levelLimit = 100
    };
getRow(5,1)->
    #weddingringCfg {
    id = 41,
    stage = 5,
    level = 1,
    exp = 164000,
    intimacy = 16400,
    name = "心心相印",
    model = "Prefab/role/ring/ring3",
    property = [{135,88712},{136,8871},{137,8871},{138,8871},{139,8871}],
    levelLimit = 0
    };
getRow(5,2)->
    #weddingringCfg {
    id = 42,
    stage = 5,
    level = 2,
    exp = 172000,
    intimacy = 17200,
    name = "心心相印",
    model = "Prefab/role/ring/ring3",
    property = [{135,91917},{136,9191},{137,9191},{138,9191},{139,9191}],
    levelLimit = 0
    };
getRow(5,3)->
    #weddingringCfg {
    id = 43,
    stage = 5,
    level = 3,
    exp = 180000,
    intimacy = 18000,
    name = "心心相印",
    model = "Prefab/role/ring/ring3",
    property = [{135,95210},{136,9521},{137,9521},{138,9521},{139,9521}],
    levelLimit = 0
    };
getRow(5,4)->
    #weddingringCfg {
    id = 44,
    stage = 5,
    level = 4,
    exp = 188000,
    intimacy = 18800,
    name = "心心相印",
    model = "Prefab/role/ring/ring3",
    property = [{135,98592},{136,9859},{137,9859},{138,9859},{139,9859}],
    levelLimit = 0
    };
getRow(5,5)->
    #weddingringCfg {
    id = 45,
    stage = 5,
    level = 5,
    exp = 196000,
    intimacy = 19600,
    name = "心心相印",
    model = "Prefab/role/ring/ring3",
    property = [{135,102062},{136,10206},{137,10206},{138,10206},{139,10206}],
    levelLimit = 0
    };
getRow(5,6)->
    #weddingringCfg {
    id = 46,
    stage = 5,
    level = 6,
    exp = 204000,
    intimacy = 20400,
    name = "心心相印",
    model = "Prefab/role/ring/ring3",
    property = [{135,105623},{136,10562},{137,10562},{138,10562},{139,10562}],
    levelLimit = 0
    };
getRow(5,7)->
    #weddingringCfg {
    id = 47,
    stage = 5,
    level = 7,
    exp = 212000,
    intimacy = 21200,
    name = "心心相印",
    model = "Prefab/role/ring/ring3",
    property = [{135,109275},{136,10927},{137,10927},{138,10927},{139,10927}],
    levelLimit = 0
    };
getRow(5,8)->
    #weddingringCfg {
    id = 48,
    stage = 5,
    level = 8,
    exp = 220000,
    intimacy = 22000,
    name = "心心相印",
    model = "Prefab/role/ring/ring3",
    property = [{135,113020},{136,11302},{137,11302},{138,11302},{139,11302}],
    levelLimit = 0
    };
getRow(5,9)->
    #weddingringCfg {
    id = 49,
    stage = 5,
    level = 9,
    exp = 228000,
    intimacy = 22800,
    name = "心心相印",
    model = "Prefab/role/ring/ring3",
    property = [{135,116858},{136,11685},{137,11685},{138,11685},{139,11685}],
    levelLimit = 0
    };
getRow(5,10)->
    #weddingringCfg {
    id = 50,
    stage = 5,
    level = 10,
    exp = 238000,
    intimacy = 23800,
    name = "心心相印",
    model = "Prefab/role/ring/ring3",
    property = [{135,120790},{136,12079},{137,12079},{138,12079},{139,12079}],
    break_itemID = [{26005,100}],
    levelLimit = 120
    };
getRow(6,1)->
    #weddingringCfg {
    id = 51,
    stage = 6,
    level = 1,
    exp = 248000,
    intimacy = 24800,
    name = "心心相印",
    model = "Prefab/role/ring/ring3",
    property = [{135,132872},{136,13287},{137,13287},{138,13287},{139,13287}],
    levelLimit = 0
    };
getRow(6,2)->
    #weddingringCfg {
    id = 52,
    stage = 6,
    level = 2,
    exp = 258000,
    intimacy = 25800,
    name = "心心相印",
    model = "Prefab/role/ring/ring3",
    property = [{135,136996},{136,13699},{137,13699},{138,13699},{139,13699}],
    levelLimit = 0
    };
getRow(6,3)->
    #weddingringCfg {
    id = 53,
    stage = 6,
    level = 3,
    exp = 268000,
    intimacy = 26800,
    name = "心心相印",
    model = "Prefab/role/ring/ring3",
    property = [{135,141217},{136,14121},{137,14121},{138,14121},{139,14121}],
    levelLimit = 0
    };
getRow(6,4)->
    #weddingringCfg {
    id = 54,
    stage = 6,
    level = 4,
    exp = 278000,
    intimacy = 27800,
    name = "心心相印",
    model = "Prefab/role/ring/ring3",
    property = [{135,145536},{136,14553},{137,14553},{138,14553},{139,14553}],
    levelLimit = 0
    };
getRow(6,5)->
    #weddingringCfg {
    id = 55,
    stage = 6,
    level = 5,
    exp = 288000,
    intimacy = 28800,
    name = "心心相印",
    model = "Prefab/role/ring/ring3",
    property = [{135,149954},{136,14995},{137,14995},{138,14995},{139,14995}],
    levelLimit = 0
    };
getRow(6,6)->
    #weddingringCfg {
    id = 56,
    stage = 6,
    level = 6,
    exp = 298000,
    intimacy = 29800,
    name = "心心相印",
    model = "Prefab/role/ring/ring3",
    property = [{135,154472},{136,15447},{137,15447},{138,15447},{139,15447}],
    levelLimit = 0
    };
getRow(6,7)->
    #weddingringCfg {
    id = 57,
    stage = 6,
    level = 7,
    exp = 308000,
    intimacy = 30800,
    name = "心心相印",
    model = "Prefab/role/ring/ring3",
    property = [{135,159091},{136,15909},{137,15909},{138,15909},{139,15909}],
    levelLimit = 0
    };
getRow(6,8)->
    #weddingringCfg {
    id = 58,
    stage = 6,
    level = 8,
    exp = 318000,
    intimacy = 31800,
    name = "心心相印",
    model = "Prefab/role/ring/ring3",
    property = [{135,163812},{136,16381},{137,16381},{138,16381},{139,16381}],
    levelLimit = 0
    };
getRow(6,9)->
    #weddingringCfg {
    id = 59,
    stage = 6,
    level = 9,
    exp = 328000,
    intimacy = 32800,
    name = "心心相印",
    model = "Prefab/role/ring/ring3",
    property = [{135,168636},{136,16863},{137,16863},{138,16863},{139,16863}],
    levelLimit = 0
    };
getRow(6,10)->
    #weddingringCfg {
    id = 60,
    stage = 6,
    level = 10,
    exp = 340000,
    intimacy = 34000,
    name = "心心相印",
    model = "Prefab/role/ring/ring3",
    property = [{135,173564},{136,17356},{137,17356},{138,17356},{139,17356}],
    levelLimit = 0
    };
getRow(_,_)->[].

getKeyList()->[
    {1,1},
    {1,2},
    {1,3},
    {1,4},
    {1,5},
    {1,6},
    {1,7},
    {1,8},
    {1,9},
    {1,10},
    {2,1},
    {2,2},
    {2,3},
    {2,4},
    {2,5},
    {2,6},
    {2,7},
    {2,8},
    {2,9},
    {2,10},
    {3,1},
    {3,2},
    {3,3},
    {3,4},
    {3,5},
    {3,6},
    {3,7},
    {3,8},
    {3,9},
    {3,10},
    {4,1},
    {4,2},
    {4,3},
    {4,4},
    {4,5},
    {4,6},
    {4,7},
    {4,8},
    {4,9},
    {4,10},
    {5,1},
    {5,2},
    {5,3},
    {5,4},
    {5,5},
    {5,6},
    {5,7},
    {5,8},
    {5,9},
    {5,10},
    {6,1},
    {6,2},
    {6,3},
    {6,4},
    {6,5},
    {6,6},
    {6,7},
    {6,8},
    {6,9},
    {6,10}
    ].

get1KeyList()->[
    1,
    2,
    3,
    4,
    5,
    6
    ].

get2KeyList(1)->[
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9,
    10
    ];
get2KeyList(2)->[
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9,
    10
    ];
get2KeyList(3)->[
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9,
    10
    ];
get2KeyList(4)->[
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9,
    10
    ];
get2KeyList(5)->[
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9,
    10
    ];
get2KeyList(6)->[
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9,
    10
    ];
get2KeyList(_)->[].

