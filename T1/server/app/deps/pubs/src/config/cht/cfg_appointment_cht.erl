%% coding: latin-1
%%: 实现
-module(cfg_appointment_cht).
-compile(export_all).
-include("cfg_appointment.hrl").
-include("logger.hrl").

getRow(1)->
    #appointmentCfg {
    id = 1,
    name = "连连看",
    type = 2,
    param = [1,3],
    level = 15,
    daily_type = 104,
    daily_count = 2,
    picture = "Daily_17_1",
    txt = "废弃",
    reward_show = [2601,31,32],
    time = 180,
    mapid = 540,
    cameratype = 5,
    datetitle = "连连看",
    datetxt = "与你的伙伴进入相同的宝石区域，即可获得珍贵积分！期间，还有幸运宝箱，刺激的冒险等着你们！！biubiubiu(∩｀-´)⊃━✿✿✿✿✿✿\nPs：其实(๑˃́ꇴ˂̀๑)，你离成功只差一个身位的距离",
    datepicture = "Textures/UI/appointment1"
    };
getRow(2)->
    #appointmentCfg {
    id = 2,
    name = "推箱子",
    type = 2,
    param = [2,4],
    level = 15,
    daily_type = 108,
    daily_count = 2,
    picture = "Daily_17_2",
    txt = "废弃",
    reward_show = [2601,31,32],
    time = 270,
    mapid = 541,
    cameratype = 6,
    datetitle = "推箱子",
    datetxt = "将迷路的梦妖引领到终点区域，即可获得宝贵积分！记住，梦妖们都很慵懒，一定要用推的，从背后！！emmmmm○(｀・ω・)＝○ノД)\nPs：其实(๑˃́ꇴ˂̀๑)，你迷路的样子也很美",
    datepicture = "Textures/UI/appointment2"
    };
getRow(3)->
    #appointmentCfg {
    id = 3,
    name = "躲水枪",
    type = 2,
    param = [5],
    level = 15,
    daily_type = 109,
    daily_count = 2,
    picture = "Daily_17_3",
    txt = "废弃",
    reward_show = [2601,31,32],
    time = 120,
    mapid = 542,
    cameratype = 7,
    datetitle = "躲水枪",
    datetxt = "躲避每轮泡泡鱼的水柱侵袭，即可获得宝贵积分！其实，躲避的最高境界，就是不动如山！！pupupu(\'ω\') 三 ( ε: ) 三 (. .) 三 ( :з )\nPs：其实(๑˃́ꇴ˂̀๑)，水边总能发生些令人愉悦的事情",
    datepicture = "Textures/UI/appointment3"
    };
getRow(4)->
    #appointmentCfg {
    id = 4,
    name = "抓喵喵",
    type = 2,
    param = [6,7],
    level = 15,
    daily_type = 110,
    daily_count = 2,
    picture = "Daily_17_4",
    txt = "废弃",
    reward_show = [2601,31,32],
    time = 270,
    mapid = 543,
    cameratype = 8,
    datetitle = "抓喵喵",
    datetxt = "震慑庄园中调皮捣蛋的躲喵喵，即可获得宝贵分！有时，不啪啪啪打几下，怎么能叫震慑呢？piapiapia(∩ ͡ ° ʖ ͡ °) ⊃-(===>\nPs：又想起了那个夏天(๑˃́ꇴ˂̀๑)，八岁的我牵着六岁的她",
    datepicture = "Textures/UI/appointment4"
    };
getRow(_)->[].

getKeyList()->[
    {1},
    {2},
    {3},
    {4}
    ].

get1KeyList()->[
    1,
    2,
    3,
    4
    ].

