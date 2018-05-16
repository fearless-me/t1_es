%% coding: latin-1
%%: 实现
-module(cfg_copymapScheduleSettle_cht).
-compile(export_all).
-include("cfg_copymapScheduleSettle.hrl").
-include("logger.hrl").

getRow(108)->
    #copymapScheduleSettleCfg {
    id = 108,
    name = "所有动画animation结束",
    killmonster = [],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(300)->
    #copymapScheduleSettleCfg {
    id = 300,
    name = "打败红海龟（拯救大白）",
    killmonster = [{22001,2},{22000,3}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(301)->
    #copymapScheduleSettleCfg {
    id = 301,
    name = "打败红海龟（拯救大白）",
    killmonster = [{22000,3}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(302)->
    #copymapScheduleSettleCfg {
    id = 302,
    name = "史莱姆的起床气",
    killmonster = [{22031,5}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(303)->
    #copymapScheduleSettleCfg {
    id = 303,
    name = "击败魔灵兽1",
    killmonster = [{22003,4}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(304)->
    #copymapScheduleSettleCfg {
    id = 304,
    name = "击败魔灵兽2",
    killmonster = [{22004,4}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(305)->
    #copymapScheduleSettleCfg {
    id = 305,
    name = "击败龙息阿拉丁",
    killmonster = [{22004,5}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(306)->
    #copymapScheduleSettleCfg {
    id = 306,
    name = "呼唤魔龙",
    killmonster = [],
    collect = [{9200,1}],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(307)->
    #copymapScheduleSettleCfg {
    id = 307,
    name = "击败魔龙",
    killmonster = [{22006,1}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(308)->
    #copymapScheduleSettleCfg {
    id = 308,
    name = "觉醒必胜！",
    killmonster = [{22005,1}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 204,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(310)->
    #copymapScheduleSettleCfg {
    id = 310,
    name = "安娜被绑架",
    killmonster = [{22026,3},{22027,3}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(314)->
    #copymapScheduleSettleCfg {
    id = 314,
    name = "获得骑宠",
    killmonster = [{22007,4}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(315)->
    #copymapScheduleSettleCfg {
    id = 315,
    name = "获得骑宠",
    killmonster = [{22016,4}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(316)->
    #copymapScheduleSettleCfg {
    id = 316,
    name = "获得骑宠",
    killmonster = [{22014,4}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(317)->
    #copymapScheduleSettleCfg {
    id = 317,
    name = "获得骑宠",
    killmonster = [{22013,1},{22015,2}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(318)->
    #copymapScheduleSettleCfg {
    id = 318,
    name = "获得骑宠",
    killmonster = [],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(322)->
    #copymapScheduleSettleCfg {
    id = 322,
    name = "10级剧情副本",
    killmonster = [{22018,3},{22019,1}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(325)->
    #copymapScheduleSettleCfg {
    id = 325,
    name = "10级剧情副本",
    killmonster = [{22022,2},{22023,2}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(326)->
    #copymapScheduleSettleCfg {
    id = 326,
    name = "10级剧情副本",
    killmonster = [{22024,1}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(327)->
    #copymapScheduleSettleCfg {
    id = 327,
    name = "收集翡翠咕咕（料理考核）",
    killmonster = [{22032,1}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(328)->
    #copymapScheduleSettleCfg {
    id = 328,
    name = "抢滩登陆位面",
    killmonster = [{22033,2},{22034,2}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(329)->
    #copymapScheduleSettleCfg {
    id = 329,
    name = "海盗复仇位面1",
    killmonster = [{22035,4},{22036,4}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(330)->
    #copymapScheduleSettleCfg {
    id = 330,
    name = "海盗复仇位面2",
    killmonster = [{22036,4}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(331)->
    #copymapScheduleSettleCfg {
    id = 331,
    name = "海盗复仇位面3",
    killmonster = [{22035,4}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(332)->
    #copymapScheduleSettleCfg {
    id = 332,
    name = "海盗复仇位面4",
    killmonster = [{22036,4}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(333)->
    #copymapScheduleSettleCfg {
    id = 333,
    name = "营救骑士位面",
    killmonster = [{22037,5}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(334)->
    #copymapScheduleSettleCfg {
    id = 334,
    name = "激活法阵位面",
    killmonster = [],
    collect = [{116,2}],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(335)->
    #copymapScheduleSettleCfg {
    id = 335,
    name = "护送大白位面",
    killmonster = [],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(336)->
    #copymapScheduleSettleCfg {
    id = 336,
    name = "获得技能1练习位面",
    killmonster = [{22002,2},{22031,2}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(337)->
    #copymapScheduleSettleCfg {
    id = 337,
    name = "10级剧情副本BOSS P2",
    killmonster = [{22038,1}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(338)->
    #copymapScheduleSettleCfg {
    id = 338,
    name = "边走边聊I位面",
    killmonster = [],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(339)->
    #copymapScheduleSettleCfg {
    id = 339,
    name = "边走边聊II位面",
    killmonster = [],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(340)->
    #copymapScheduleSettleCfg {
    id = 340,
    name = "误入歧途I位面",
    killmonster = [{30021,8}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(341)->
    #copymapScheduleSettleCfg {
    id = 341,
    name = "前往祭坛I位面",
    killmonster = [],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(342)->
    #copymapScheduleSettleCfg {
    id = 342,
    name = "移动指引进度1",
    killmonster = [],
    collect = [{207,2}],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(343)->
    #copymapScheduleSettleCfg {
    id = 343,
    name = "移动指引进度2",
    killmonster = [],
    collect = [{208,2}],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(348)->
    #copymapScheduleSettleCfg {
    id = 348,
    name = "史莱姆国王",
    killmonster = [{22041,1},{35066,3},{35067,3}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(600)->
    #copymapScheduleSettleCfg {
    id = 600,
    name = "橘鬼花异变",
    killmonster = [{22041,1},{22041,1},{22041,1},{22041,1}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 1
    };
getRow(950)->
    #copymapScheduleSettleCfg {
    id = 950,
    name = "金币副本",
    killmonster = [{771,5}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(951)->
    #copymapScheduleSettleCfg {
    id = 951,
    name = "金币副本",
    killmonster = [{771,5}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(952)->
    #copymapScheduleSettleCfg {
    id = 952,
    name = "金币副本",
    killmonster = [{772,5}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(953)->
    #copymapScheduleSettleCfg {
    id = 953,
    name = "金币副本",
    killmonster = [{772,5}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(954)->
    #copymapScheduleSettleCfg {
    id = 954,
    name = "金币副本",
    killmonster = [{773,5}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(955)->
    #copymapScheduleSettleCfg {
    id = 955,
    name = "金币副本",
    killmonster = [{773,5}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(956)->
    #copymapScheduleSettleCfg {
    id = 956,
    name = "金币副本",
    killmonster = [{771,5}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(957)->
    #copymapScheduleSettleCfg {
    id = 957,
    name = "金币副本",
    killmonster = [{772,5}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(958)->
    #copymapScheduleSettleCfg {
    id = 958,
    name = "金币副本",
    killmonster = [{773,5}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(959)->
    #copymapScheduleSettleCfg {
    id = 959,
    name = "金币副本",
    killmonster = [{774,1},{772,2},{773,2}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(970)->
    #copymapScheduleSettleCfg {
    id = 970,
    name = "金币副本",
    killmonster = [{775,5}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(971)->
    #copymapScheduleSettleCfg {
    id = 971,
    name = "金币副本",
    killmonster = [{775,5}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(972)->
    #copymapScheduleSettleCfg {
    id = 972,
    name = "金币副本",
    killmonster = [{776,5}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(973)->
    #copymapScheduleSettleCfg {
    id = 973,
    name = "金币副本",
    killmonster = [{776,5}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(974)->
    #copymapScheduleSettleCfg {
    id = 974,
    name = "金币副本",
    killmonster = [{777,5}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(975)->
    #copymapScheduleSettleCfg {
    id = 975,
    name = "金币副本",
    killmonster = [{777,5}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(976)->
    #copymapScheduleSettleCfg {
    id = 976,
    name = "金币副本",
    killmonster = [{775,5}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(977)->
    #copymapScheduleSettleCfg {
    id = 977,
    name = "金币副本",
    killmonster = [{776,5}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(978)->
    #copymapScheduleSettleCfg {
    id = 978,
    name = "金币副本",
    killmonster = [{777,5}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(979)->
    #copymapScheduleSettleCfg {
    id = 979,
    name = "金币副本",
    killmonster = [{778,1},{776,2},{777,2}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(990)->
    #copymapScheduleSettleCfg {
    id = 990,
    name = "金币副本",
    killmonster = [{779,5}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(991)->
    #copymapScheduleSettleCfg {
    id = 991,
    name = "金币副本",
    killmonster = [{779,5}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(992)->
    #copymapScheduleSettleCfg {
    id = 992,
    name = "金币副本",
    killmonster = [{780,5}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(993)->
    #copymapScheduleSettleCfg {
    id = 993,
    name = "金币副本",
    killmonster = [{780,5}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(994)->
    #copymapScheduleSettleCfg {
    id = 994,
    name = "金币副本",
    killmonster = [{781,5}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(995)->
    #copymapScheduleSettleCfg {
    id = 995,
    name = "金币副本",
    killmonster = [{781,5}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(996)->
    #copymapScheduleSettleCfg {
    id = 996,
    name = "金币副本",
    killmonster = [{779,5}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(997)->
    #copymapScheduleSettleCfg {
    id = 997,
    name = "金币副本",
    killmonster = [{780,5}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(998)->
    #copymapScheduleSettleCfg {
    id = 998,
    name = "金币副本",
    killmonster = [{781,5}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(999)->
    #copymapScheduleSettleCfg {
    id = 999,
    name = "金币副本",
    killmonster = [{782,1},{780,2},{781,2}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(1010)->
    #copymapScheduleSettleCfg {
    id = 1010,
    name = "金币副本",
    killmonster = [{783,5}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(1011)->
    #copymapScheduleSettleCfg {
    id = 1011,
    name = "金币副本",
    killmonster = [{783,5}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(1012)->
    #copymapScheduleSettleCfg {
    id = 1012,
    name = "金币副本",
    killmonster = [{784,5}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(1013)->
    #copymapScheduleSettleCfg {
    id = 1013,
    name = "金币副本",
    killmonster = [{784,5}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(1014)->
    #copymapScheduleSettleCfg {
    id = 1014,
    name = "金币副本",
    killmonster = [{785,5}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(1015)->
    #copymapScheduleSettleCfg {
    id = 1015,
    name = "金币副本",
    killmonster = [{785,5}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(1016)->
    #copymapScheduleSettleCfg {
    id = 1016,
    name = "金币副本",
    killmonster = [{783,5}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(1017)->
    #copymapScheduleSettleCfg {
    id = 1017,
    name = "金币副本",
    killmonster = [{784,5}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(1018)->
    #copymapScheduleSettleCfg {
    id = 1018,
    name = "金币副本",
    killmonster = [{785,5}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(1019)->
    #copymapScheduleSettleCfg {
    id = 1019,
    name = "金币副本",
    killmonster = [{786,1},{784,2},{785,2}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(1030)->
    #copymapScheduleSettleCfg {
    id = 1030,
    name = "金币副本",
    killmonster = [{771,5}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(1031)->
    #copymapScheduleSettleCfg {
    id = 1031,
    name = "金币副本",
    killmonster = [{771,5}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(1032)->
    #copymapScheduleSettleCfg {
    id = 1032,
    name = "金币副本",
    killmonster = [{771,5}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(1033)->
    #copymapScheduleSettleCfg {
    id = 1033,
    name = "金币副本",
    killmonster = [{771,5}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(1034)->
    #copymapScheduleSettleCfg {
    id = 1034,
    name = "金币副本",
    killmonster = [{771,5}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(1035)->
    #copymapScheduleSettleCfg {
    id = 1035,
    name = "金币副本",
    killmonster = [{771,5}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(1036)->
    #copymapScheduleSettleCfg {
    id = 1036,
    name = "金币副本",
    killmonster = [{771,5}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(1037)->
    #copymapScheduleSettleCfg {
    id = 1037,
    name = "金币副本",
    killmonster = [{771,5}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(1038)->
    #copymapScheduleSettleCfg {
    id = 1038,
    name = "金币副本",
    killmonster = [{771,5}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(1039)->
    #copymapScheduleSettleCfg {
    id = 1039,
    name = "金币副本",
    killmonster = [{771,5}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(1040)->
    #copymapScheduleSettleCfg {
    id = 1040,
    name = "金币副本",
    killmonster = [{771,5}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(1041)->
    #copymapScheduleSettleCfg {
    id = 1041,
    name = "金币副本",
    killmonster = [{771,5}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(1042)->
    #copymapScheduleSettleCfg {
    id = 1042,
    name = "金币副本",
    killmonster = [{771,5}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(1043)->
    #copymapScheduleSettleCfg {
    id = 1043,
    name = "金币副本",
    killmonster = [{771,5}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(1044)->
    #copymapScheduleSettleCfg {
    id = 1044,
    name = "金币副本",
    killmonster = [{771,5}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(1050)->
    #copymapScheduleSettleCfg {
    id = 1050,
    name = "金币副本",
    killmonster = [{791,5}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(1051)->
    #copymapScheduleSettleCfg {
    id = 1051,
    name = "金币副本",
    killmonster = [{791,5}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(1052)->
    #copymapScheduleSettleCfg {
    id = 1052,
    name = "金币副本",
    killmonster = [{792,5}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(1053)->
    #copymapScheduleSettleCfg {
    id = 1053,
    name = "金币副本",
    killmonster = [{792,5}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(1054)->
    #copymapScheduleSettleCfg {
    id = 1054,
    name = "金币副本",
    killmonster = [{793,5}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(1055)->
    #copymapScheduleSettleCfg {
    id = 1055,
    name = "金币副本",
    killmonster = [{793,5}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(1056)->
    #copymapScheduleSettleCfg {
    id = 1056,
    name = "金币副本",
    killmonster = [{791,5}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(1057)->
    #copymapScheduleSettleCfg {
    id = 1057,
    name = "金币副本",
    killmonster = [{792,5}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(1058)->
    #copymapScheduleSettleCfg {
    id = 1058,
    name = "金币副本",
    killmonster = [{793,5}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(1059)->
    #copymapScheduleSettleCfg {
    id = 1059,
    name = "金币副本",
    killmonster = [{794,1},{792,2},{793,2}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(1070)->
    #copymapScheduleSettleCfg {
    id = 1070,
    name = "金币副本",
    killmonster = [{795,5}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(1071)->
    #copymapScheduleSettleCfg {
    id = 1071,
    name = "金币副本",
    killmonster = [{795,5}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(1072)->
    #copymapScheduleSettleCfg {
    id = 1072,
    name = "金币副本",
    killmonster = [{796,5}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(1073)->
    #copymapScheduleSettleCfg {
    id = 1073,
    name = "金币副本",
    killmonster = [{796,5}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(1074)->
    #copymapScheduleSettleCfg {
    id = 1074,
    name = "金币副本",
    killmonster = [{797,5}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(1075)->
    #copymapScheduleSettleCfg {
    id = 1075,
    name = "金币副本",
    killmonster = [{797,5}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(1076)->
    #copymapScheduleSettleCfg {
    id = 1076,
    name = "金币副本",
    killmonster = [{795,5}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(1077)->
    #copymapScheduleSettleCfg {
    id = 1077,
    name = "金币副本",
    killmonster = [{796,5}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(1078)->
    #copymapScheduleSettleCfg {
    id = 1078,
    name = "金币副本",
    killmonster = [{797,5}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(1079)->
    #copymapScheduleSettleCfg {
    id = 1079,
    name = "金币副本",
    killmonster = [{798,1},{796,2},{797,2}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(1090)->
    #copymapScheduleSettleCfg {
    id = 1090,
    name = "金币副本",
    killmonster = [{799,5}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(1091)->
    #copymapScheduleSettleCfg {
    id = 1091,
    name = "金币副本",
    killmonster = [{799,5}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(1092)->
    #copymapScheduleSettleCfg {
    id = 1092,
    name = "金币副本",
    killmonster = [{800,5}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(1093)->
    #copymapScheduleSettleCfg {
    id = 1093,
    name = "金币副本",
    killmonster = [{800,5}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(1094)->
    #copymapScheduleSettleCfg {
    id = 1094,
    name = "金币副本",
    killmonster = [{801,5}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(1095)->
    #copymapScheduleSettleCfg {
    id = 1095,
    name = "金币副本",
    killmonster = [{801,5}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(1096)->
    #copymapScheduleSettleCfg {
    id = 1096,
    name = "金币副本",
    killmonster = [{799,5}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(1097)->
    #copymapScheduleSettleCfg {
    id = 1097,
    name = "金币副本",
    killmonster = [{800,5}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(1098)->
    #copymapScheduleSettleCfg {
    id = 1098,
    name = "金币副本",
    killmonster = [{801,5}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(1099)->
    #copymapScheduleSettleCfg {
    id = 1099,
    name = "金币副本",
    killmonster = [{802,1},{800,2},{801,2}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(1120)->
    #copymapScheduleSettleCfg {
    id = 1120,
    name = "金币副本",
    killmonster = [{867,4}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(1121)->
    #copymapScheduleSettleCfg {
    id = 1121,
    name = "金币副本",
    killmonster = [{867,4}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(1122)->
    #copymapScheduleSettleCfg {
    id = 1122,
    name = "金币副本",
    killmonster = [{867,4}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(1123)->
    #copymapScheduleSettleCfg {
    id = 1123,
    name = "金币副本",
    killmonster = [{867,4}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(1124)->
    #copymapScheduleSettleCfg {
    id = 1124,
    name = "金币副本",
    killmonster = [{867,4}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(1125)->
    #copymapScheduleSettleCfg {
    id = 1125,
    name = "金币副本",
    killmonster = [{868,4}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(1126)->
    #copymapScheduleSettleCfg {
    id = 1126,
    name = "金币副本",
    killmonster = [{868,4}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(1127)->
    #copymapScheduleSettleCfg {
    id = 1127,
    name = "金币副本",
    killmonster = [],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 1
    };
getRow(1140)->
    #copymapScheduleSettleCfg {
    id = 1140,
    name = "金币副本",
    killmonster = [{870,4}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(1141)->
    #copymapScheduleSettleCfg {
    id = 1141,
    name = "金币副本",
    killmonster = [{870,4}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(1142)->
    #copymapScheduleSettleCfg {
    id = 1142,
    name = "金币副本",
    killmonster = [{870,4}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(1143)->
    #copymapScheduleSettleCfg {
    id = 1143,
    name = "金币副本",
    killmonster = [{870,4}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(1144)->
    #copymapScheduleSettleCfg {
    id = 1144,
    name = "金币副本",
    killmonster = [{870,4}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(1145)->
    #copymapScheduleSettleCfg {
    id = 1145,
    name = "金币副本",
    killmonster = [{871,4}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(1146)->
    #copymapScheduleSettleCfg {
    id = 1146,
    name = "金币副本",
    killmonster = [{871,4}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(1147)->
    #copymapScheduleSettleCfg {
    id = 1147,
    name = "金币副本",
    killmonster = [],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 1
    };
getRow(1160)->
    #copymapScheduleSettleCfg {
    id = 1160,
    name = "金币副本",
    killmonster = [{873,4}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(1161)->
    #copymapScheduleSettleCfg {
    id = 1161,
    name = "金币副本",
    killmonster = [{873,4}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(1162)->
    #copymapScheduleSettleCfg {
    id = 1162,
    name = "金币副本",
    killmonster = [{873,4}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(1163)->
    #copymapScheduleSettleCfg {
    id = 1163,
    name = "金币副本",
    killmonster = [{873,4}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(1164)->
    #copymapScheduleSettleCfg {
    id = 1164,
    name = "金币副本",
    killmonster = [{873,4}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(1165)->
    #copymapScheduleSettleCfg {
    id = 1165,
    name = "金币副本",
    killmonster = [{874,4}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(1166)->
    #copymapScheduleSettleCfg {
    id = 1166,
    name = "金币副本",
    killmonster = [{874,4}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(1167)->
    #copymapScheduleSettleCfg {
    id = 1167,
    name = "金币副本",
    killmonster = [],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 1
    };
getRow(1180)->
    #copymapScheduleSettleCfg {
    id = 1180,
    name = "金币副本",
    killmonster = [{876,4}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(1181)->
    #copymapScheduleSettleCfg {
    id = 1181,
    name = "金币副本",
    killmonster = [{876,4}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(1182)->
    #copymapScheduleSettleCfg {
    id = 1182,
    name = "金币副本",
    killmonster = [{876,4}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(1183)->
    #copymapScheduleSettleCfg {
    id = 1183,
    name = "金币副本",
    killmonster = [{876,4}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(1184)->
    #copymapScheduleSettleCfg {
    id = 1184,
    name = "金币副本",
    killmonster = [{876,4}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(1185)->
    #copymapScheduleSettleCfg {
    id = 1185,
    name = "金币副本",
    killmonster = [{877,4}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(1186)->
    #copymapScheduleSettleCfg {
    id = 1186,
    name = "金币副本",
    killmonster = [{877,4}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(1187)->
    #copymapScheduleSettleCfg {
    id = 1187,
    name = "金币副本",
    killmonster = [],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 1
    };
getRow(1200)->
    #copymapScheduleSettleCfg {
    id = 1200,
    name = "金币副本",
    killmonster = [{879,4}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(1201)->
    #copymapScheduleSettleCfg {
    id = 1201,
    name = "金币副本",
    killmonster = [{879,4}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(1202)->
    #copymapScheduleSettleCfg {
    id = 1202,
    name = "金币副本",
    killmonster = [{879,4}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(1203)->
    #copymapScheduleSettleCfg {
    id = 1203,
    name = "金币副本",
    killmonster = [{879,4}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(1204)->
    #copymapScheduleSettleCfg {
    id = 1204,
    name = "金币副本",
    killmonster = [{879,4}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(1205)->
    #copymapScheduleSettleCfg {
    id = 1205,
    name = "金币副本",
    killmonster = [{880,4}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(1206)->
    #copymapScheduleSettleCfg {
    id = 1206,
    name = "金币副本",
    killmonster = [{880,4}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(1207)->
    #copymapScheduleSettleCfg {
    id = 1207,
    name = "金币副本",
    killmonster = [],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 1
    };
getRow(1220)->
    #copymapScheduleSettleCfg {
    id = 1220,
    name = "金币副本",
    killmonster = [{882,4}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(1221)->
    #copymapScheduleSettleCfg {
    id = 1221,
    name = "金币副本",
    killmonster = [{882,4}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(1222)->
    #copymapScheduleSettleCfg {
    id = 1222,
    name = "金币副本",
    killmonster = [{882,4}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(1223)->
    #copymapScheduleSettleCfg {
    id = 1223,
    name = "金币副本",
    killmonster = [{882,4}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(1224)->
    #copymapScheduleSettleCfg {
    id = 1224,
    name = "金币副本",
    killmonster = [{882,4}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(1225)->
    #copymapScheduleSettleCfg {
    id = 1225,
    name = "金币副本",
    killmonster = [{883,4}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(1226)->
    #copymapScheduleSettleCfg {
    id = 1226,
    name = "金币副本",
    killmonster = [{883,4}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(1227)->
    #copymapScheduleSettleCfg {
    id = 1227,
    name = "金币副本",
    killmonster = [],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 1
    };
getRow(1240)->
    #copymapScheduleSettleCfg {
    id = 1240,
    name = "金币副本",
    killmonster = [{885,4}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(1241)->
    #copymapScheduleSettleCfg {
    id = 1241,
    name = "金币副本",
    killmonster = [{885,4}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(1242)->
    #copymapScheduleSettleCfg {
    id = 1242,
    name = "金币副本",
    killmonster = [{885,4}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(1243)->
    #copymapScheduleSettleCfg {
    id = 1243,
    name = "金币副本",
    killmonster = [{885,4}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(1244)->
    #copymapScheduleSettleCfg {
    id = 1244,
    name = "金币副本",
    killmonster = [{885,4}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(1245)->
    #copymapScheduleSettleCfg {
    id = 1245,
    name = "金币副本",
    killmonster = [{886,4}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(1246)->
    #copymapScheduleSettleCfg {
    id = 1246,
    name = "金币副本",
    killmonster = [{886,4}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(1247)->
    #copymapScheduleSettleCfg {
    id = 1247,
    name = "金币副本",
    killmonster = [],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 1
    };
getRow(1260)->
    #copymapScheduleSettleCfg {
    id = 1260,
    name = "金币副本",
    killmonster = [{888,4}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(1261)->
    #copymapScheduleSettleCfg {
    id = 1261,
    name = "金币副本",
    killmonster = [{888,4}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(1262)->
    #copymapScheduleSettleCfg {
    id = 1262,
    name = "金币副本",
    killmonster = [{888,4}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(1263)->
    #copymapScheduleSettleCfg {
    id = 1263,
    name = "金币副本",
    killmonster = [{888,4}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(1264)->
    #copymapScheduleSettleCfg {
    id = 1264,
    name = "金币副本",
    killmonster = [{888,4}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(1265)->
    #copymapScheduleSettleCfg {
    id = 1265,
    name = "金币副本",
    killmonster = [{889,4}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(1266)->
    #copymapScheduleSettleCfg {
    id = 1266,
    name = "金币副本",
    killmonster = [{889,4}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(1267)->
    #copymapScheduleSettleCfg {
    id = 1267,
    name = "金币副本",
    killmonster = [],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 1
    };
getRow(1400)->
    #copymapScheduleSettleCfg {
    id = 1400,
    name = "金币副本",
    killmonster = [{819,3}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(1401)->
    #copymapScheduleSettleCfg {
    id = 1401,
    name = "金币副本",
    killmonster = [{819,3}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(1402)->
    #copymapScheduleSettleCfg {
    id = 1402,
    name = "金币副本",
    killmonster = [{820,3}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(1403)->
    #copymapScheduleSettleCfg {
    id = 1403,
    name = "金币副本",
    killmonster = [{820,4}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(1404)->
    #copymapScheduleSettleCfg {
    id = 1404,
    name = "金币副本",
    killmonster = [{819,4}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(1405)->
    #copymapScheduleSettleCfg {
    id = 1405,
    name = "金币副本",
    killmonster = [{820,5}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(1406)->
    #copymapScheduleSettleCfg {
    id = 1406,
    name = "金币副本",
    killmonster = [{819,5}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(1407)->
    #copymapScheduleSettleCfg {
    id = 1407,
    name = "金币副本",
    killmonster = [{820,5}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(1408)->
    #copymapScheduleSettleCfg {
    id = 1408,
    name = "金币副本",
    killmonster = [{819,5}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(1409)->
    #copymapScheduleSettleCfg {
    id = 1409,
    name = "金币副本",
    killmonster = [{820,5}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(1410)->
    #copymapScheduleSettleCfg {
    id = 1410,
    name = "金币副本",
    killmonster = [{821,1},{819,2}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(1420)->
    #copymapScheduleSettleCfg {
    id = 1420,
    name = "金币副本",
    killmonster = [{822,3}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(1421)->
    #copymapScheduleSettleCfg {
    id = 1421,
    name = "金币副本",
    killmonster = [{822,3}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(1422)->
    #copymapScheduleSettleCfg {
    id = 1422,
    name = "金币副本",
    killmonster = [{823,3}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(1423)->
    #copymapScheduleSettleCfg {
    id = 1423,
    name = "金币副本",
    killmonster = [{823,4}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(1424)->
    #copymapScheduleSettleCfg {
    id = 1424,
    name = "金币副本",
    killmonster = [{822,4}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(1425)->
    #copymapScheduleSettleCfg {
    id = 1425,
    name = "金币副本",
    killmonster = [{823,5}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(1426)->
    #copymapScheduleSettleCfg {
    id = 1426,
    name = "金币副本",
    killmonster = [{822,5}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(1427)->
    #copymapScheduleSettleCfg {
    id = 1427,
    name = "金币副本",
    killmonster = [{823,5}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(1428)->
    #copymapScheduleSettleCfg {
    id = 1428,
    name = "金币副本",
    killmonster = [{822,5}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(1429)->
    #copymapScheduleSettleCfg {
    id = 1429,
    name = "金币副本",
    killmonster = [{823,5}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(1430)->
    #copymapScheduleSettleCfg {
    id = 1430,
    name = "金币副本",
    killmonster = [{824,1},{822,2}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(1440)->
    #copymapScheduleSettleCfg {
    id = 1440,
    name = "金币副本",
    killmonster = [{825,3}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(1441)->
    #copymapScheduleSettleCfg {
    id = 1441,
    name = "金币副本",
    killmonster = [{825,3}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(1442)->
    #copymapScheduleSettleCfg {
    id = 1442,
    name = "金币副本",
    killmonster = [{826,3}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(1443)->
    #copymapScheduleSettleCfg {
    id = 1443,
    name = "金币副本",
    killmonster = [{826,4}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(1444)->
    #copymapScheduleSettleCfg {
    id = 1444,
    name = "金币副本",
    killmonster = [{825,4}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(1445)->
    #copymapScheduleSettleCfg {
    id = 1445,
    name = "金币副本",
    killmonster = [{826,5}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(1446)->
    #copymapScheduleSettleCfg {
    id = 1446,
    name = "金币副本",
    killmonster = [{825,5}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(1447)->
    #copymapScheduleSettleCfg {
    id = 1447,
    name = "金币副本",
    killmonster = [{826,5}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(1448)->
    #copymapScheduleSettleCfg {
    id = 1448,
    name = "金币副本",
    killmonster = [{825,5}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(1449)->
    #copymapScheduleSettleCfg {
    id = 1449,
    name = "金币副本",
    killmonster = [{826,5}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(1450)->
    #copymapScheduleSettleCfg {
    id = 1450,
    name = "金币副本",
    killmonster = [{827,1},{825,2}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(1460)->
    #copymapScheduleSettleCfg {
    id = 1460,
    name = "金币副本",
    killmonster = [{828,3}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(1461)->
    #copymapScheduleSettleCfg {
    id = 1461,
    name = "金币副本",
    killmonster = [{828,3}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(1462)->
    #copymapScheduleSettleCfg {
    id = 1462,
    name = "金币副本",
    killmonster = [{829,3}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(1463)->
    #copymapScheduleSettleCfg {
    id = 1463,
    name = "金币副本",
    killmonster = [{829,4}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(1464)->
    #copymapScheduleSettleCfg {
    id = 1464,
    name = "金币副本",
    killmonster = [{828,4}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(1465)->
    #copymapScheduleSettleCfg {
    id = 1465,
    name = "金币副本",
    killmonster = [{829,5}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(1466)->
    #copymapScheduleSettleCfg {
    id = 1466,
    name = "金币副本",
    killmonster = [{828,5}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(1467)->
    #copymapScheduleSettleCfg {
    id = 1467,
    name = "金币副本",
    killmonster = [{829,5}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(1468)->
    #copymapScheduleSettleCfg {
    id = 1468,
    name = "金币副本",
    killmonster = [{828,5}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(1469)->
    #copymapScheduleSettleCfg {
    id = 1469,
    name = "金币副本",
    killmonster = [{829,5}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(1470)->
    #copymapScheduleSettleCfg {
    id = 1470,
    name = "金币副本",
    killmonster = [{830,1},{828,2}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(1480)->
    #copymapScheduleSettleCfg {
    id = 1480,
    name = "金币副本",
    killmonster = [{831,3}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(1481)->
    #copymapScheduleSettleCfg {
    id = 1481,
    name = "金币副本",
    killmonster = [{831,3}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(1482)->
    #copymapScheduleSettleCfg {
    id = 1482,
    name = "金币副本",
    killmonster = [{832,3}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(1483)->
    #copymapScheduleSettleCfg {
    id = 1483,
    name = "金币副本",
    killmonster = [{832,4}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(1484)->
    #copymapScheduleSettleCfg {
    id = 1484,
    name = "金币副本",
    killmonster = [{831,4}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(1485)->
    #copymapScheduleSettleCfg {
    id = 1485,
    name = "金币副本",
    killmonster = [{832,5}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(1486)->
    #copymapScheduleSettleCfg {
    id = 1486,
    name = "金币副本",
    killmonster = [{831,5}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(1487)->
    #copymapScheduleSettleCfg {
    id = 1487,
    name = "金币副本",
    killmonster = [{832,5}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(1488)->
    #copymapScheduleSettleCfg {
    id = 1488,
    name = "金币副本",
    killmonster = [{831,5}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(1489)->
    #copymapScheduleSettleCfg {
    id = 1489,
    name = "金币副本",
    killmonster = [{832,5}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(1490)->
    #copymapScheduleSettleCfg {
    id = 1490,
    name = "金币副本",
    killmonster = [{833,1},{831,2}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(1510)->
    #copymapScheduleSettleCfg {
    id = 1510,
    name = "金币副本",
    killmonster = [{834,3}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(1511)->
    #copymapScheduleSettleCfg {
    id = 1511,
    name = "金币副本",
    killmonster = [{834,3}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(1512)->
    #copymapScheduleSettleCfg {
    id = 1512,
    name = "金币副本",
    killmonster = [{835,3}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(1513)->
    #copymapScheduleSettleCfg {
    id = 1513,
    name = "金币副本",
    killmonster = [{835,4}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(1514)->
    #copymapScheduleSettleCfg {
    id = 1514,
    name = "金币副本",
    killmonster = [{834,4}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(1515)->
    #copymapScheduleSettleCfg {
    id = 1515,
    name = "金币副本",
    killmonster = [{835,5}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(1516)->
    #copymapScheduleSettleCfg {
    id = 1516,
    name = "金币副本",
    killmonster = [{834,5}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(1517)->
    #copymapScheduleSettleCfg {
    id = 1517,
    name = "金币副本",
    killmonster = [{835,5}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(1518)->
    #copymapScheduleSettleCfg {
    id = 1518,
    name = "金币副本",
    killmonster = [{834,5}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(1519)->
    #copymapScheduleSettleCfg {
    id = 1519,
    name = "金币副本",
    killmonster = [{835,5}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(1520)->
    #copymapScheduleSettleCfg {
    id = 1520,
    name = "金币副本",
    killmonster = [{836,1},{834,2}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(1530)->
    #copymapScheduleSettleCfg {
    id = 1530,
    name = "金币副本",
    killmonster = [{837,3}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(1531)->
    #copymapScheduleSettleCfg {
    id = 1531,
    name = "金币副本",
    killmonster = [{837,3}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(1532)->
    #copymapScheduleSettleCfg {
    id = 1532,
    name = "金币副本",
    killmonster = [{838,3}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(1533)->
    #copymapScheduleSettleCfg {
    id = 1533,
    name = "金币副本",
    killmonster = [{838,4}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(1534)->
    #copymapScheduleSettleCfg {
    id = 1534,
    name = "金币副本",
    killmonster = [{837,4}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(1535)->
    #copymapScheduleSettleCfg {
    id = 1535,
    name = "金币副本",
    killmonster = [{838,5}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(1536)->
    #copymapScheduleSettleCfg {
    id = 1536,
    name = "金币副本",
    killmonster = [{837,5}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(1537)->
    #copymapScheduleSettleCfg {
    id = 1537,
    name = "金币副本",
    killmonster = [{838,5}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(1538)->
    #copymapScheduleSettleCfg {
    id = 1538,
    name = "金币副本",
    killmonster = [{837,5}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(1539)->
    #copymapScheduleSettleCfg {
    id = 1539,
    name = "金币副本",
    killmonster = [{838,5}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(1540)->
    #copymapScheduleSettleCfg {
    id = 1540,
    name = "金币副本",
    killmonster = [{839,1},{837,2}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(1550)->
    #copymapScheduleSettleCfg {
    id = 1550,
    name = "金币副本",
    killmonster = [{840,3}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(1551)->
    #copymapScheduleSettleCfg {
    id = 1551,
    name = "金币副本",
    killmonster = [{840,3}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(1552)->
    #copymapScheduleSettleCfg {
    id = 1552,
    name = "金币副本",
    killmonster = [{841,3}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(1553)->
    #copymapScheduleSettleCfg {
    id = 1553,
    name = "金币副本",
    killmonster = [{841,4}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(1554)->
    #copymapScheduleSettleCfg {
    id = 1554,
    name = "金币副本",
    killmonster = [{840,4}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(1555)->
    #copymapScheduleSettleCfg {
    id = 1555,
    name = "金币副本",
    killmonster = [{841,5}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(1556)->
    #copymapScheduleSettleCfg {
    id = 1556,
    name = "金币副本",
    killmonster = [{840,5}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(1557)->
    #copymapScheduleSettleCfg {
    id = 1557,
    name = "金币副本",
    killmonster = [{841,5}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(1558)->
    #copymapScheduleSettleCfg {
    id = 1558,
    name = "金币副本",
    killmonster = [{840,5}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(1559)->
    #copymapScheduleSettleCfg {
    id = 1559,
    name = "金币副本",
    killmonster = [{841,5}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(1560)->
    #copymapScheduleSettleCfg {
    id = 1560,
    name = "金币副本",
    killmonster = [{842,1},{840,2}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(1600)->
    #copymapScheduleSettleCfg {
    id = 1600,
    name = "金币副本",
    killmonster = [{843,2}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(1601)->
    #copymapScheduleSettleCfg {
    id = 1601,
    name = "金币副本",
    killmonster = [{843,1},{844,2}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(1602)->
    #copymapScheduleSettleCfg {
    id = 1602,
    name = "金币副本",
    killmonster = [{843,3}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(1603)->
    #copymapScheduleSettleCfg {
    id = 1603,
    name = "金币副本",
    killmonster = [{843,1},{844,2}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(1604)->
    #copymapScheduleSettleCfg {
    id = 1604,
    name = "金币副本",
    killmonster = [{843,1},{844,2}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(1605)->
    #copymapScheduleSettleCfg {
    id = 1605,
    name = "金币副本",
    killmonster = [{844,3}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(1606)->
    #copymapScheduleSettleCfg {
    id = 1606,
    name = "金币副本",
    killmonster = [{843,2}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(1607)->
    #copymapScheduleSettleCfg {
    id = 1607,
    name = "金币副本",
    killmonster = [{843,2}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(1608)->
    #copymapScheduleSettleCfg {
    id = 1608,
    name = "金币副本",
    killmonster = [{843,2}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(1609)->
    #copymapScheduleSettleCfg {
    id = 1609,
    name = "金币副本",
    killmonster = [{843,2}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(1610)->
    #copymapScheduleSettleCfg {
    id = 1610,
    name = "金币副本",
    killmonster = [{843,2}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(1611)->
    #copymapScheduleSettleCfg {
    id = 1611,
    name = "金币副本",
    killmonster = [{844,3}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(1612)->
    #copymapScheduleSettleCfg {
    id = 1612,
    name = "金币副本",
    killmonster = [{844,4}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(1613)->
    #copymapScheduleSettleCfg {
    id = 1613,
    name = "金币副本",
    killmonster = [{844,4}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(1614)->
    #copymapScheduleSettleCfg {
    id = 1614,
    name = "金币副本",
    killmonster = [],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 1
    };
getRow(1620)->
    #copymapScheduleSettleCfg {
    id = 1620,
    name = "金币副本",
    killmonster = [{846,2}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(1621)->
    #copymapScheduleSettleCfg {
    id = 1621,
    name = "金币副本",
    killmonster = [{846,1},{847,2}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(1622)->
    #copymapScheduleSettleCfg {
    id = 1622,
    name = "金币副本",
    killmonster = [{846,3}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(1623)->
    #copymapScheduleSettleCfg {
    id = 1623,
    name = "金币副本",
    killmonster = [{846,1},{847,2}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(1624)->
    #copymapScheduleSettleCfg {
    id = 1624,
    name = "金币副本",
    killmonster = [{846,1},{847,2}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(1625)->
    #copymapScheduleSettleCfg {
    id = 1625,
    name = "金币副本",
    killmonster = [{847,3}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(1626)->
    #copymapScheduleSettleCfg {
    id = 1626,
    name = "金币副本",
    killmonster = [{846,2}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(1627)->
    #copymapScheduleSettleCfg {
    id = 1627,
    name = "金币副本",
    killmonster = [{846,2}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(1628)->
    #copymapScheduleSettleCfg {
    id = 1628,
    name = "金币副本",
    killmonster = [{846,2}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(1629)->
    #copymapScheduleSettleCfg {
    id = 1629,
    name = "金币副本",
    killmonster = [{846,2}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(1630)->
    #copymapScheduleSettleCfg {
    id = 1630,
    name = "金币副本",
    killmonster = [{846,2}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(1631)->
    #copymapScheduleSettleCfg {
    id = 1631,
    name = "金币副本",
    killmonster = [{847,3}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(1632)->
    #copymapScheduleSettleCfg {
    id = 1632,
    name = "金币副本",
    killmonster = [{847,4}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(1633)->
    #copymapScheduleSettleCfg {
    id = 1633,
    name = "金币副本",
    killmonster = [{847,4}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(1634)->
    #copymapScheduleSettleCfg {
    id = 1634,
    name = "金币副本",
    killmonster = [],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 1
    };
getRow(1640)->
    #copymapScheduleSettleCfg {
    id = 1640,
    name = "金币副本",
    killmonster = [{849,2}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(1641)->
    #copymapScheduleSettleCfg {
    id = 1641,
    name = "金币副本",
    killmonster = [{849,1},{850,2}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(1642)->
    #copymapScheduleSettleCfg {
    id = 1642,
    name = "金币副本",
    killmonster = [{849,3}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(1643)->
    #copymapScheduleSettleCfg {
    id = 1643,
    name = "金币副本",
    killmonster = [{849,1},{850,2}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(1644)->
    #copymapScheduleSettleCfg {
    id = 1644,
    name = "金币副本",
    killmonster = [{849,1},{850,2}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(1645)->
    #copymapScheduleSettleCfg {
    id = 1645,
    name = "金币副本",
    killmonster = [{850,3}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(1646)->
    #copymapScheduleSettleCfg {
    id = 1646,
    name = "金币副本",
    killmonster = [{849,2}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(1647)->
    #copymapScheduleSettleCfg {
    id = 1647,
    name = "金币副本",
    killmonster = [{849,2}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(1648)->
    #copymapScheduleSettleCfg {
    id = 1648,
    name = "金币副本",
    killmonster = [{849,2}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(1649)->
    #copymapScheduleSettleCfg {
    id = 1649,
    name = "金币副本",
    killmonster = [{849,2}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(1650)->
    #copymapScheduleSettleCfg {
    id = 1650,
    name = "金币副本",
    killmonster = [{849,2}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(1651)->
    #copymapScheduleSettleCfg {
    id = 1651,
    name = "金币副本",
    killmonster = [{850,3}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(1652)->
    #copymapScheduleSettleCfg {
    id = 1652,
    name = "金币副本",
    killmonster = [{850,4}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(1653)->
    #copymapScheduleSettleCfg {
    id = 1653,
    name = "金币副本",
    killmonster = [{850,4}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(1654)->
    #copymapScheduleSettleCfg {
    id = 1654,
    name = "金币副本",
    killmonster = [],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 1
    };
getRow(1660)->
    #copymapScheduleSettleCfg {
    id = 1660,
    name = "金币副本",
    killmonster = [{852,2}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(1661)->
    #copymapScheduleSettleCfg {
    id = 1661,
    name = "金币副本",
    killmonster = [{852,1},{853,2}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(1662)->
    #copymapScheduleSettleCfg {
    id = 1662,
    name = "金币副本",
    killmonster = [{852,3}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(1663)->
    #copymapScheduleSettleCfg {
    id = 1663,
    name = "金币副本",
    killmonster = [{852,1},{853,2}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(1664)->
    #copymapScheduleSettleCfg {
    id = 1664,
    name = "金币副本",
    killmonster = [{852,1},{853,2}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(1665)->
    #copymapScheduleSettleCfg {
    id = 1665,
    name = "金币副本",
    killmonster = [{853,3}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(1666)->
    #copymapScheduleSettleCfg {
    id = 1666,
    name = "金币副本",
    killmonster = [{852,2}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(1667)->
    #copymapScheduleSettleCfg {
    id = 1667,
    name = "金币副本",
    killmonster = [{852,2}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(1668)->
    #copymapScheduleSettleCfg {
    id = 1668,
    name = "金币副本",
    killmonster = [{852,2}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(1669)->
    #copymapScheduleSettleCfg {
    id = 1669,
    name = "金币副本",
    killmonster = [{852,2}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(1670)->
    #copymapScheduleSettleCfg {
    id = 1670,
    name = "金币副本",
    killmonster = [{852,2}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(1671)->
    #copymapScheduleSettleCfg {
    id = 1671,
    name = "金币副本",
    killmonster = [{853,3}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(1672)->
    #copymapScheduleSettleCfg {
    id = 1672,
    name = "金币副本",
    killmonster = [{853,4}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(1673)->
    #copymapScheduleSettleCfg {
    id = 1673,
    name = "金币副本",
    killmonster = [{853,4}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(1674)->
    #copymapScheduleSettleCfg {
    id = 1674,
    name = "金币副本",
    killmonster = [],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 1
    };
getRow(1680)->
    #copymapScheduleSettleCfg {
    id = 1680,
    name = "金币副本",
    killmonster = [{855,2}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(1681)->
    #copymapScheduleSettleCfg {
    id = 1681,
    name = "金币副本",
    killmonster = [{855,1},{856,2}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(1682)->
    #copymapScheduleSettleCfg {
    id = 1682,
    name = "金币副本",
    killmonster = [{855,3}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(1683)->
    #copymapScheduleSettleCfg {
    id = 1683,
    name = "金币副本",
    killmonster = [{855,1},{856,2}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(1684)->
    #copymapScheduleSettleCfg {
    id = 1684,
    name = "金币副本",
    killmonster = [{855,1},{856,2}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(1685)->
    #copymapScheduleSettleCfg {
    id = 1685,
    name = "金币副本",
    killmonster = [{856,3}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(1686)->
    #copymapScheduleSettleCfg {
    id = 1686,
    name = "金币副本",
    killmonster = [{855,2}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(1687)->
    #copymapScheduleSettleCfg {
    id = 1687,
    name = "金币副本",
    killmonster = [{855,2}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(1688)->
    #copymapScheduleSettleCfg {
    id = 1688,
    name = "金币副本",
    killmonster = [{855,2}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(1689)->
    #copymapScheduleSettleCfg {
    id = 1689,
    name = "金币副本",
    killmonster = [{855,2}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(1690)->
    #copymapScheduleSettleCfg {
    id = 1690,
    name = "金币副本",
    killmonster = [{855,2}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(1691)->
    #copymapScheduleSettleCfg {
    id = 1691,
    name = "金币副本",
    killmonster = [{856,3}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(1692)->
    #copymapScheduleSettleCfg {
    id = 1692,
    name = "金币副本",
    killmonster = [{856,4}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(1693)->
    #copymapScheduleSettleCfg {
    id = 1693,
    name = "金币副本",
    killmonster = [{856,4}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(1694)->
    #copymapScheduleSettleCfg {
    id = 1694,
    name = "金币副本",
    killmonster = [],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 1
    };
getRow(1700)->
    #copymapScheduleSettleCfg {
    id = 1700,
    name = "金币副本",
    killmonster = [{858,2}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(1701)->
    #copymapScheduleSettleCfg {
    id = 1701,
    name = "金币副本",
    killmonster = [{858,1},{859,2}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(1702)->
    #copymapScheduleSettleCfg {
    id = 1702,
    name = "金币副本",
    killmonster = [{858,3}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(1703)->
    #copymapScheduleSettleCfg {
    id = 1703,
    name = "金币副本",
    killmonster = [{858,1},{859,2}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(1704)->
    #copymapScheduleSettleCfg {
    id = 1704,
    name = "金币副本",
    killmonster = [{858,1},{859,2}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(1705)->
    #copymapScheduleSettleCfg {
    id = 1705,
    name = "金币副本",
    killmonster = [{859,3}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(1706)->
    #copymapScheduleSettleCfg {
    id = 1706,
    name = "金币副本",
    killmonster = [{858,2}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(1707)->
    #copymapScheduleSettleCfg {
    id = 1707,
    name = "金币副本",
    killmonster = [{858,2}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(1708)->
    #copymapScheduleSettleCfg {
    id = 1708,
    name = "金币副本",
    killmonster = [{858,2}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(1709)->
    #copymapScheduleSettleCfg {
    id = 1709,
    name = "金币副本",
    killmonster = [{858,2}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(1710)->
    #copymapScheduleSettleCfg {
    id = 1710,
    name = "金币副本",
    killmonster = [{858,2}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(1711)->
    #copymapScheduleSettleCfg {
    id = 1711,
    name = "金币副本",
    killmonster = [{859,3}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(1712)->
    #copymapScheduleSettleCfg {
    id = 1712,
    name = "金币副本",
    killmonster = [{859,4}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(1713)->
    #copymapScheduleSettleCfg {
    id = 1713,
    name = "金币副本",
    killmonster = [{859,4}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(1714)->
    #copymapScheduleSettleCfg {
    id = 1714,
    name = "金币副本",
    killmonster = [],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 1
    };
getRow(1720)->
    #copymapScheduleSettleCfg {
    id = 1720,
    name = "金币副本",
    killmonster = [{861,2}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(1721)->
    #copymapScheduleSettleCfg {
    id = 1721,
    name = "金币副本",
    killmonster = [{861,1},{862,2}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(1722)->
    #copymapScheduleSettleCfg {
    id = 1722,
    name = "金币副本",
    killmonster = [{861,3}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(1723)->
    #copymapScheduleSettleCfg {
    id = 1723,
    name = "金币副本",
    killmonster = [{861,1},{862,2}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(1724)->
    #copymapScheduleSettleCfg {
    id = 1724,
    name = "金币副本",
    killmonster = [{861,1},{862,2}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(1725)->
    #copymapScheduleSettleCfg {
    id = 1725,
    name = "金币副本",
    killmonster = [{862,3}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(1726)->
    #copymapScheduleSettleCfg {
    id = 1726,
    name = "金币副本",
    killmonster = [{861,2}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(1727)->
    #copymapScheduleSettleCfg {
    id = 1727,
    name = "金币副本",
    killmonster = [{861,2}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(1728)->
    #copymapScheduleSettleCfg {
    id = 1728,
    name = "金币副本",
    killmonster = [{861,2}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(1729)->
    #copymapScheduleSettleCfg {
    id = 1729,
    name = "金币副本",
    killmonster = [{861,2}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(1730)->
    #copymapScheduleSettleCfg {
    id = 1730,
    name = "金币副本",
    killmonster = [{861,2}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(1731)->
    #copymapScheduleSettleCfg {
    id = 1731,
    name = "金币副本",
    killmonster = [{862,3}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(1732)->
    #copymapScheduleSettleCfg {
    id = 1732,
    name = "金币副本",
    killmonster = [{862,4}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(1733)->
    #copymapScheduleSettleCfg {
    id = 1733,
    name = "金币副本",
    killmonster = [{862,4}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(1734)->
    #copymapScheduleSettleCfg {
    id = 1734,
    name = "金币副本",
    killmonster = [],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 1
    };
getRow(1740)->
    #copymapScheduleSettleCfg {
    id = 1740,
    name = "金币副本",
    killmonster = [{864,2}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(1741)->
    #copymapScheduleSettleCfg {
    id = 1741,
    name = "金币副本",
    killmonster = [{864,1},{865,2}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(1742)->
    #copymapScheduleSettleCfg {
    id = 1742,
    name = "金币副本",
    killmonster = [{864,3}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(1743)->
    #copymapScheduleSettleCfg {
    id = 1743,
    name = "金币副本",
    killmonster = [{864,1},{865,2}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(1744)->
    #copymapScheduleSettleCfg {
    id = 1744,
    name = "金币副本",
    killmonster = [{864,1},{865,2}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(1745)->
    #copymapScheduleSettleCfg {
    id = 1745,
    name = "金币副本",
    killmonster = [{865,3}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(1746)->
    #copymapScheduleSettleCfg {
    id = 1746,
    name = "金币副本",
    killmonster = [{864,2}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(1747)->
    #copymapScheduleSettleCfg {
    id = 1747,
    name = "金币副本",
    killmonster = [{864,2}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(1748)->
    #copymapScheduleSettleCfg {
    id = 1748,
    name = "金币副本",
    killmonster = [{864,2}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(1749)->
    #copymapScheduleSettleCfg {
    id = 1749,
    name = "金币副本",
    killmonster = [{864,2}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(1750)->
    #copymapScheduleSettleCfg {
    id = 1750,
    name = "金币副本",
    killmonster = [{864,2}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(1751)->
    #copymapScheduleSettleCfg {
    id = 1751,
    name = "金币副本",
    killmonster = [{865,3}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(1752)->
    #copymapScheduleSettleCfg {
    id = 1752,
    name = "金币副本",
    killmonster = [{865,4}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(1753)->
    #copymapScheduleSettleCfg {
    id = 1753,
    name = "金币副本",
    killmonster = [{865,4}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(1754)->
    #copymapScheduleSettleCfg {
    id = 1754,
    name = "金币副本",
    killmonster = [],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 1
    };
getRow(2000)->
    #copymapScheduleSettleCfg {
    id = 2000,
    name = "遇难船-1号BOSS",
    killmonster = [{4000,1},{4001,1}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(2001)->
    #copymapScheduleSettleCfg {
    id = 2001,
    name = "遇难船-2号BOSS",
    killmonster = [{4002,1}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(2002)->
    #copymapScheduleSettleCfg {
    id = 2002,
    name = "遇难船-3号BOSS",
    killmonster = [{4004,1}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(2003)->
    #copymapScheduleSettleCfg {
    id = 2003,
    name = "遇难船-2号BOSS测试",
    killmonster = [{4002,1}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(2004)->
    #copymapScheduleSettleCfg {
    id = 2004,
    name = "遇难船-3号BOSS测试",
    killmonster = [{4004,1}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(2005)->
    #copymapScheduleSettleCfg {
    id = 2005,
    name = "魔幻丛林-1号BOSS",
    killmonster = [{4014,1}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(2006)->
    #copymapScheduleSettleCfg {
    id = 2006,
    name = "魔幻丛林-2号BOSS",
    killmonster = [{4015,1}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(2007)->
    #copymapScheduleSettleCfg {
    id = 2007,
    name = "魔幻丛林-3号BOSS",
    killmonster = [{4016,1}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(2008)->
    #copymapScheduleSettleCfg {
    id = 2008,
    name = "魔幻丛林-4号BOSS",
    killmonster = [{4018,1}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(2009)->
    #copymapScheduleSettleCfg {
    id = 2009,
    name = "魔幻丛林-2号BOSS测试",
    killmonster = [{4015,1}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(2010)->
    #copymapScheduleSettleCfg {
    id = 2010,
    name = "魔幻丛林-3号BOSS测试",
    killmonster = [{4016,1}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(2011)->
    #copymapScheduleSettleCfg {
    id = 2011,
    name = "魔幻丛林-4号BOSS测试",
    killmonster = [{4018,1}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(2012)->
    #copymapScheduleSettleCfg {
    id = 2012,
    name = "遇难船困难-1号BOSS",
    killmonster = [{4022,1},{4023,1}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(2013)->
    #copymapScheduleSettleCfg {
    id = 2013,
    name = "遇难船困难-2号BOSS",
    killmonster = [{4024,1}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(2014)->
    #copymapScheduleSettleCfg {
    id = 2014,
    name = "遇难船困难-3号BOSS",
    killmonster = [{4026,1}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(2015)->
    #copymapScheduleSettleCfg {
    id = 2015,
    name = "遇难船噩梦-1号BOSS",
    killmonster = [{4035,1},{4036,1}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(2016)->
    #copymapScheduleSettleCfg {
    id = 2016,
    name = "遇难船噩梦-2号BOSS",
    killmonster = [{4037,1}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(2017)->
    #copymapScheduleSettleCfg {
    id = 2017,
    name = "遇难船噩梦-3号BOSS",
    killmonster = [{4039,1}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(2018)->
    #copymapScheduleSettleCfg {
    id = 2018,
    name = "遇难船地狱1星-1号BOSS",
    killmonster = [{4048,1},{4049,1}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(2019)->
    #copymapScheduleSettleCfg {
    id = 2019,
    name = "遇难船地狱1星-2号BOSS",
    killmonster = [{4050,1}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(2020)->
    #copymapScheduleSettleCfg {
    id = 2020,
    name = "遇难船地狱1星-3号BOSS",
    killmonster = [{4052,1}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(2021)->
    #copymapScheduleSettleCfg {
    id = 2021,
    name = "魔幻丛林困难-1号BOSS",
    killmonster = [{4100,1}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(2022)->
    #copymapScheduleSettleCfg {
    id = 2022,
    name = "魔幻丛林困难-2号BOSS",
    killmonster = [{4101,1}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(2023)->
    #copymapScheduleSettleCfg {
    id = 2023,
    name = "魔幻丛林困难-3号BOSS",
    killmonster = [{4102,1}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(2024)->
    #copymapScheduleSettleCfg {
    id = 2024,
    name = "魔幻丛林困难-4号BOSS",
    killmonster = [{4104,1}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(2025)->
    #copymapScheduleSettleCfg {
    id = 2025,
    name = "魔幻丛林噩梦-1号BOSS",
    killmonster = [{4108,1}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(2026)->
    #copymapScheduleSettleCfg {
    id = 2026,
    name = "魔幻丛林噩梦-2号BOSS",
    killmonster = [{4109,1}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(2027)->
    #copymapScheduleSettleCfg {
    id = 2027,
    name = "魔幻丛林噩梦-3号BOSS",
    killmonster = [{4110,1}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(2028)->
    #copymapScheduleSettleCfg {
    id = 2028,
    name = "魔幻丛林噩梦-4号BOSS",
    killmonster = [{4112,1}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(2029)->
    #copymapScheduleSettleCfg {
    id = 2029,
    name = "贪念寺院普通-1号BOSS",
    killmonster = [{4200,1}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(2030)->
    #copymapScheduleSettleCfg {
    id = 2030,
    name = "贪念寺院普通-2号BOSS",
    killmonster = [{4201,1}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(2031)->
    #copymapScheduleSettleCfg {
    id = 2031,
    name = "贪念寺院普通-3号BOSS",
    killmonster = [{4202,1}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(2032)->
    #copymapScheduleSettleCfg {
    id = 2032,
    name = "贪念寺院困难-1号BOSS",
    killmonster = [{4220,1}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(2033)->
    #copymapScheduleSettleCfg {
    id = 2033,
    name = "贪念寺院困难-2号BOSS",
    killmonster = [{4221,1}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(2034)->
    #copymapScheduleSettleCfg {
    id = 2034,
    name = "贪念寺院困难-3号BOSS",
    killmonster = [{4222,1}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(2035)->
    #copymapScheduleSettleCfg {
    id = 2035,
    name = "贪念寺院噩梦-1号BOSS",
    killmonster = [{4240,1}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(2036)->
    #copymapScheduleSettleCfg {
    id = 2036,
    name = "贪念寺院噩梦-2号BOSS",
    killmonster = [{4241,1}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(2037)->
    #copymapScheduleSettleCfg {
    id = 2037,
    name = "贪念寺院噩梦-3号BOSS",
    killmonster = [{4242,1}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(2100)->
    #copymapScheduleSettleCfg {
    id = 2100,
    name = "遇难船-1号BOSS",
    killmonster = [{4600,1},{4601,1}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(2101)->
    #copymapScheduleSettleCfg {
    id = 2101,
    name = "遇难船-2号BOSS",
    killmonster = [{4602,1}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(2102)->
    #copymapScheduleSettleCfg {
    id = 2102,
    name = "遇难船-3号BOSS",
    killmonster = [{4604,1}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(2103)->
    #copymapScheduleSettleCfg {
    id = 2103,
    name = "遇难船-1号BOSS",
    killmonster = [{4610,1},{4611,1}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(2104)->
    #copymapScheduleSettleCfg {
    id = 2104,
    name = "遇难船-2号BOSS",
    killmonster = [{4612,1}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(2105)->
    #copymapScheduleSettleCfg {
    id = 2105,
    name = "遇难船-3号BOSS",
    killmonster = [{4614,1}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(2106)->
    #copymapScheduleSettleCfg {
    id = 2106,
    name = "遇难船-1号BOSS",
    killmonster = [{4620,1},{4621,1}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(2107)->
    #copymapScheduleSettleCfg {
    id = 2107,
    name = "遇难船-2号BOSS",
    killmonster = [{4622,1}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(2108)->
    #copymapScheduleSettleCfg {
    id = 2108,
    name = "遇难船-3号BOSS",
    killmonster = [{4624,1}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(2109)->
    #copymapScheduleSettleCfg {
    id = 2109,
    name = "遇难船-1号BOSS",
    killmonster = [{4630,1},{4631,1}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(2110)->
    #copymapScheduleSettleCfg {
    id = 2110,
    name = "遇难船-2号BOSS",
    killmonster = [{4632,1}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(2111)->
    #copymapScheduleSettleCfg {
    id = 2111,
    name = "遇难船-3号BOSS",
    killmonster = [{4634,1}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(2112)->
    #copymapScheduleSettleCfg {
    id = 2112,
    name = "遇难船-1号BOSS",
    killmonster = [{4640,1},{4641,1}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(2113)->
    #copymapScheduleSettleCfg {
    id = 2113,
    name = "遇难船-2号BOSS",
    killmonster = [{4642,1}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(2114)->
    #copymapScheduleSettleCfg {
    id = 2114,
    name = "遇难船-3号BOSS",
    killmonster = [{4644,1}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(2115)->
    #copymapScheduleSettleCfg {
    id = 2115,
    name = "遇难船-1号BOSS",
    killmonster = [{4650,1},{4651,1}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(2116)->
    #copymapScheduleSettleCfg {
    id = 2116,
    name = "遇难船-2号BOSS",
    killmonster = [{4652,1}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(2117)->
    #copymapScheduleSettleCfg {
    id = 2117,
    name = "遇难船-3号BOSS",
    killmonster = [{4654,1}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(2118)->
    #copymapScheduleSettleCfg {
    id = 2118,
    name = "遇难船-1号BOSS",
    killmonster = [{4660,1},{4661,1}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(2119)->
    #copymapScheduleSettleCfg {
    id = 2119,
    name = "遇难船-2号BOSS",
    killmonster = [{4662,1}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(2120)->
    #copymapScheduleSettleCfg {
    id = 2120,
    name = "遇难船-3号BOSS",
    killmonster = [{4664,1}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(2121)->
    #copymapScheduleSettleCfg {
    id = 2121,
    name = "遇难船-1号BOSS",
    killmonster = [{4670,1},{4671,1}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(2122)->
    #copymapScheduleSettleCfg {
    id = 2122,
    name = "遇难船-2号BOSS",
    killmonster = [{4672,1}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(2123)->
    #copymapScheduleSettleCfg {
    id = 2123,
    name = "遇难船-3号BOSS",
    killmonster = [{4674,1}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(2124)->
    #copymapScheduleSettleCfg {
    id = 2124,
    name = "遇难船-1号BOSS",
    killmonster = [{4680,1},{4681,1}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(2125)->
    #copymapScheduleSettleCfg {
    id = 2125,
    name = "遇难船-2号BOSS",
    killmonster = [{4682,1}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(2126)->
    #copymapScheduleSettleCfg {
    id = 2126,
    name = "遇难船-3号BOSS",
    killmonster = [{4684,1}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(2127)->
    #copymapScheduleSettleCfg {
    id = 2127,
    name = "遇难船-1号BOSS",
    killmonster = [{4690,1},{4691,1}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(2128)->
    #copymapScheduleSettleCfg {
    id = 2128,
    name = "遇难船-2号BOSS",
    killmonster = [{4692,1}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(2129)->
    #copymapScheduleSettleCfg {
    id = 2129,
    name = "遇难船-3号BOSS",
    killmonster = [{4694,1}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(2200)->
    #copymapScheduleSettleCfg {
    id = 2200,
    name = "魔幻丛林-1号BOSS",
    killmonster = [{4700,1}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(2201)->
    #copymapScheduleSettleCfg {
    id = 2201,
    name = "魔幻丛林-2号BOSS",
    killmonster = [{4701,1}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(2202)->
    #copymapScheduleSettleCfg {
    id = 2202,
    name = "魔幻丛林-3号BOSS",
    killmonster = [{4702,1}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(2203)->
    #copymapScheduleSettleCfg {
    id = 2203,
    name = "魔幻丛林-4号BOSS",
    killmonster = [{4704,1}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(2204)->
    #copymapScheduleSettleCfg {
    id = 2204,
    name = "魔幻丛林-1号BOSS",
    killmonster = [{4710,1}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(2205)->
    #copymapScheduleSettleCfg {
    id = 2205,
    name = "魔幻丛林-2号BOSS",
    killmonster = [{4711,1}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(2206)->
    #copymapScheduleSettleCfg {
    id = 2206,
    name = "魔幻丛林-3号BOSS",
    killmonster = [{4712,1}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(2207)->
    #copymapScheduleSettleCfg {
    id = 2207,
    name = "魔幻丛林-4号BOSS",
    killmonster = [{4714,1}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(2208)->
    #copymapScheduleSettleCfg {
    id = 2208,
    name = "魔幻丛林-1号BOSS",
    killmonster = [{4720,1}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(2209)->
    #copymapScheduleSettleCfg {
    id = 2209,
    name = "魔幻丛林-2号BOSS",
    killmonster = [{4721,1}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(2210)->
    #copymapScheduleSettleCfg {
    id = 2210,
    name = "魔幻丛林-3号BOSS",
    killmonster = [{4722,1}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(2211)->
    #copymapScheduleSettleCfg {
    id = 2211,
    name = "魔幻丛林-4号BOSS",
    killmonster = [{4724,1}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(2212)->
    #copymapScheduleSettleCfg {
    id = 2212,
    name = "魔幻丛林-1号BOSS",
    killmonster = [{4730,1}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(2213)->
    #copymapScheduleSettleCfg {
    id = 2213,
    name = "魔幻丛林-2号BOSS",
    killmonster = [{4731,1}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(2214)->
    #copymapScheduleSettleCfg {
    id = 2214,
    name = "魔幻丛林-3号BOSS",
    killmonster = [{4732,1}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(2215)->
    #copymapScheduleSettleCfg {
    id = 2215,
    name = "魔幻丛林-4号BOSS",
    killmonster = [{4734,1}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(2216)->
    #copymapScheduleSettleCfg {
    id = 2216,
    name = "魔幻丛林-1号BOSS",
    killmonster = [{4740,1}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(2217)->
    #copymapScheduleSettleCfg {
    id = 2217,
    name = "魔幻丛林-2号BOSS",
    killmonster = [{4741,1}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(2218)->
    #copymapScheduleSettleCfg {
    id = 2218,
    name = "魔幻丛林-3号BOSS",
    killmonster = [{4742,1}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(2219)->
    #copymapScheduleSettleCfg {
    id = 2219,
    name = "魔幻丛林-4号BOSS",
    killmonster = [{4744,1}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(2220)->
    #copymapScheduleSettleCfg {
    id = 2220,
    name = "魔幻丛林-1号BOSS",
    killmonster = [{4750,1}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(2221)->
    #copymapScheduleSettleCfg {
    id = 2221,
    name = "魔幻丛林-2号BOSS",
    killmonster = [{4751,1}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(2222)->
    #copymapScheduleSettleCfg {
    id = 2222,
    name = "魔幻丛林-3号BOSS",
    killmonster = [{4752,1}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(2223)->
    #copymapScheduleSettleCfg {
    id = 2223,
    name = "魔幻丛林-4号BOSS",
    killmonster = [{4754,1}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(2224)->
    #copymapScheduleSettleCfg {
    id = 2224,
    name = "魔幻丛林-1号BOSS",
    killmonster = [{4760,1}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(2225)->
    #copymapScheduleSettleCfg {
    id = 2225,
    name = "魔幻丛林-2号BOSS",
    killmonster = [{4761,1}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(2226)->
    #copymapScheduleSettleCfg {
    id = 2226,
    name = "魔幻丛林-3号BOSS",
    killmonster = [{4762,1}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(2227)->
    #copymapScheduleSettleCfg {
    id = 2227,
    name = "魔幻丛林-4号BOSS",
    killmonster = [{4764,1}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(2228)->
    #copymapScheduleSettleCfg {
    id = 2228,
    name = "魔幻丛林-1号BOSS",
    killmonster = [{4770,1}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(2229)->
    #copymapScheduleSettleCfg {
    id = 2229,
    name = "魔幻丛林-2号BOSS",
    killmonster = [{4771,1}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(2230)->
    #copymapScheduleSettleCfg {
    id = 2230,
    name = "魔幻丛林-3号BOSS",
    killmonster = [{4772,1}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(2231)->
    #copymapScheduleSettleCfg {
    id = 2231,
    name = "魔幻丛林-4号BOSS",
    killmonster = [{4774,1}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(2232)->
    #copymapScheduleSettleCfg {
    id = 2232,
    name = "魔幻丛林-1号BOSS",
    killmonster = [{4780,1}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(2233)->
    #copymapScheduleSettleCfg {
    id = 2233,
    name = "魔幻丛林-2号BOSS",
    killmonster = [{4781,1}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(2234)->
    #copymapScheduleSettleCfg {
    id = 2234,
    name = "魔幻丛林-3号BOSS",
    killmonster = [{4782,1}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(2235)->
    #copymapScheduleSettleCfg {
    id = 2235,
    name = "魔幻丛林-4号BOSS",
    killmonster = [{4784,1}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(2236)->
    #copymapScheduleSettleCfg {
    id = 2236,
    name = "魔幻丛林-1号BOSS",
    killmonster = [{4790,1}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(2237)->
    #copymapScheduleSettleCfg {
    id = 2237,
    name = "魔幻丛林-2号BOSS",
    killmonster = [{4791,1}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(2238)->
    #copymapScheduleSettleCfg {
    id = 2238,
    name = "魔幻丛林-3号BOSS",
    killmonster = [{4792,1}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(2239)->
    #copymapScheduleSettleCfg {
    id = 2239,
    name = "魔幻丛林-4号BOSS",
    killmonster = [{4794,1}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(2300)->
    #copymapScheduleSettleCfg {
    id = 2300,
    name = "贪念寺院-1号BOSS",
    killmonster = [{4800,1}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(2301)->
    #copymapScheduleSettleCfg {
    id = 2301,
    name = "贪念寺院-2号BOSS",
    killmonster = [{4801,1}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(2302)->
    #copymapScheduleSettleCfg {
    id = 2302,
    name = "贪念寺院-3号BOSS",
    killmonster = [{4802,1}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(2303)->
    #copymapScheduleSettleCfg {
    id = 2303,
    name = "贪念寺院-1号BOSS",
    killmonster = [{4820,1}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(2304)->
    #copymapScheduleSettleCfg {
    id = 2304,
    name = "贪念寺院-2号BOSS",
    killmonster = [{4821,1}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(2305)->
    #copymapScheduleSettleCfg {
    id = 2305,
    name = "贪念寺院-3号BOSS",
    killmonster = [{4822,1}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(2306)->
    #copymapScheduleSettleCfg {
    id = 2306,
    name = "贪念寺院-1号BOSS",
    killmonster = [{4840,1}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(2307)->
    #copymapScheduleSettleCfg {
    id = 2307,
    name = "贪念寺院-2号BOSS",
    killmonster = [{4841,1}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(2308)->
    #copymapScheduleSettleCfg {
    id = 2308,
    name = "贪念寺院-3号BOSS",
    killmonster = [{4842,1}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(2309)->
    #copymapScheduleSettleCfg {
    id = 2309,
    name = "贪念寺院-1号BOSS",
    killmonster = [{4860,1}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(2310)->
    #copymapScheduleSettleCfg {
    id = 2310,
    name = "贪念寺院-2号BOSS",
    killmonster = [{4861,1}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(2311)->
    #copymapScheduleSettleCfg {
    id = 2311,
    name = "贪念寺院-3号BOSS",
    killmonster = [{4862,1}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(2312)->
    #copymapScheduleSettleCfg {
    id = 2312,
    name = "贪念寺院-1号BOSS",
    killmonster = [{4880,1}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(2313)->
    #copymapScheduleSettleCfg {
    id = 2313,
    name = "贪念寺院-2号BOSS",
    killmonster = [{4881,1}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(2314)->
    #copymapScheduleSettleCfg {
    id = 2314,
    name = "贪念寺院-3号BOSS",
    killmonster = [{4882,1}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(2315)->
    #copymapScheduleSettleCfg {
    id = 2315,
    name = "贪念寺院-1号BOSS",
    killmonster = [{4900,1}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(2316)->
    #copymapScheduleSettleCfg {
    id = 2316,
    name = "贪念寺院-2号BOSS",
    killmonster = [{4901,1}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(2317)->
    #copymapScheduleSettleCfg {
    id = 2317,
    name = "贪念寺院-3号BOSS",
    killmonster = [{4902,1}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(2318)->
    #copymapScheduleSettleCfg {
    id = 2318,
    name = "贪念寺院-1号BOSS",
    killmonster = [{4920,1}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(2319)->
    #copymapScheduleSettleCfg {
    id = 2319,
    name = "贪念寺院-2号BOSS",
    killmonster = [{4921,1}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(2320)->
    #copymapScheduleSettleCfg {
    id = 2320,
    name = "贪念寺院-3号BOSS",
    killmonster = [{4922,1}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(2321)->
    #copymapScheduleSettleCfg {
    id = 2321,
    name = "贪念寺院-1号BOSS",
    killmonster = [{4940,1}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(2322)->
    #copymapScheduleSettleCfg {
    id = 2322,
    name = "贪念寺院-2号BOSS",
    killmonster = [{4941,1}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(2323)->
    #copymapScheduleSettleCfg {
    id = 2323,
    name = "贪念寺院-3号BOSS",
    killmonster = [{4942,1}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(2324)->
    #copymapScheduleSettleCfg {
    id = 2324,
    name = "贪念寺院-1号BOSS",
    killmonster = [{4960,1}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(2325)->
    #copymapScheduleSettleCfg {
    id = 2325,
    name = "贪念寺院-2号BOSS",
    killmonster = [{4961,1}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(2326)->
    #copymapScheduleSettleCfg {
    id = 2326,
    name = "贪念寺院-3号BOSS",
    killmonster = [{4962,1}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(2327)->
    #copymapScheduleSettleCfg {
    id = 2327,
    name = "贪念寺院-1号BOSS",
    killmonster = [{4980,1}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(2328)->
    #copymapScheduleSettleCfg {
    id = 2328,
    name = "贪念寺院-2号BOSS",
    killmonster = [{4981,1}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(2329)->
    #copymapScheduleSettleCfg {
    id = 2329,
    name = "贪念寺院-3号BOSS",
    killmonster = [{4982,1}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(5000)->
    #copymapScheduleSettleCfg {
    id = 5000,
    name = "大风营救1",
    killmonster = [{30006,1},{30007,4}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(5001)->
    #copymapScheduleSettleCfg {
    id = 5001,
    name = "大风营救2",
    killmonster = [{30008,1},{30011,5}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(5002)->
    #copymapScheduleSettleCfg {
    id = 5002,
    name = "绝地求生",
    killmonster = [{30010,4}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(5003)->
    #copymapScheduleSettleCfg {
    id = 5003,
    name = "秘密潜入I",
    killmonster = [{30009,4}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(5004)->
    #copymapScheduleSettleCfg {
    id = 5004,
    name = "魔族的围攻",
    killmonster = [{22102,4}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(5005)->
    #copymapScheduleSettleCfg {
    id = 5005,
    name = "冲锋！！！",
    killmonster = [{22103,6},{22105,2},{22104,2}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(5006)->
    #copymapScheduleSettleCfg {
    id = 5006,
    name = "被跟踪了",
    killmonster = [{30013,5}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(5007)->
    #copymapScheduleSettleCfg {
    id = 5007,
    name = "空中银行",
    killmonster = [{30014,3}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(5008)->
    #copymapScheduleSettleCfg {
    id = 5008,
    name = "大扫除",
    killmonster = [{30015,5}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(5009)->
    #copymapScheduleSettleCfg {
    id = 5009,
    name = "寻找能量源III",
    killmonster = [{30018,5}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(5010)->
    #copymapScheduleSettleCfg {
    id = 5010,
    name = "愤怒的大胖",
    killmonster = [{30019,1}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(5011)->
    #copymapScheduleSettleCfg {
    id = 5011,
    name = "拜访异魔人",
    killmonster = [{30020,5}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(5012)->
    #copymapScheduleSettleCfg {
    id = 5012,
    name = "小黄？",
    killmonster = [{30021,5}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(5013)->
    #copymapScheduleSettleCfg {
    id = 5013,
    name = "放开我！",
    killmonster = [{30023,5}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(5014)->
    #copymapScheduleSettleCfg {
    id = 5014,
    name = "准备战斗",
    killmonster = [{30024,5}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(5015)->
    #copymapScheduleSettleCfg {
    id = 5015,
    name = "平息怨气",
    killmonster = [{30036,2},{30037,1}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(5016)->
    #copymapScheduleSettleCfg {
    id = 5016,
    name = "故入歧途",
    killmonster = [{30021,4},{30022,1}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(5017)->
    #copymapScheduleSettleCfg {
    id = 5017,
    name = "护送宝马位面",
    killmonster = [{30031,4},{30032,5}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(5018)->
    #copymapScheduleSettleCfg {
    id = 5018,
    name = "平息怨气",
    killmonster = [{30036,2},{30037,1}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(5020)->
    #copymapScheduleSettleCfg {
    id = 5020,
    name = "空中银行",
    killmonster = [{30035,2}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(5022)->
    #copymapScheduleSettleCfg {
    id = 5022,
    name = "平息怨气",
    killmonster = [{30025,1},{30036,2},{30037,1}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(5030)->
    #copymapScheduleSettleCfg {
    id = 5030,
    name = "集结号",
    killmonster = [{22050,1},{22051,2},{22052,2}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(5031)->
    #copymapScheduleSettleCfg {
    id = 5031,
    name = "集结号",
    killmonster = [{22050,1},{22051,2},{22052,2}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(5051)->
    #copymapScheduleSettleCfg {
    id = 5051,
    name = "勇气考核",
    killmonster = [{22054,1},{22055,1},{22056,1}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(5052)->
    #copymapScheduleSettleCfg {
    id = 5052,
    name = "开始行动",
    killmonster = [{30067,4}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(5053)->
    #copymapScheduleSettleCfg {
    id = 5053,
    name = "一不做二不休",
    killmonster = [{30067,2},{30066,1}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(5054)->
    #copymapScheduleSettleCfg {
    id = 5054,
    name = "各个击破I",
    killmonster = [{30072,3},{30071,1}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(5055)->
    #copymapScheduleSettleCfg {
    id = 5055,
    name = "各个击破II",
    killmonster = [{30078,3},{30077,1}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(5056)->
    #copymapScheduleSettleCfg {
    id = 5056,
    name = "刺客信条",
    killmonster = [{30075,3}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(5057)->
    #copymapScheduleSettleCfg {
    id = 5057,
    name = "刺客信条",
    killmonster = [{30075,2},{30074,1}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(5058)->
    #copymapScheduleSettleCfg {
    id = 5058,
    name = "练金术尸",
    killmonster = [{30081,3},{30082,3}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(5059)->
    #copymapScheduleSettleCfg {
    id = 5059,
    name = "练金术尸",
    killmonster = [{30081,3},{30082,2},{30069,1}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(5060)->
    #copymapScheduleSettleCfg {
    id = 5060,
    name = "突然袭击",
    killmonster = [{30085,7}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(5064)->
    #copymapScheduleSettleCfg {
    id = 5064,
    name = "背水一战",
    killmonster = [{30091,7}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(5065)->
    #copymapScheduleSettleCfg {
    id = 5065,
    name = "泯灭领主杀到",
    killmonster = [{30091,3},{30092,1}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(5066)->
    #copymapScheduleSettleCfg {
    id = 5066,
    name = "暴走的泯灭领主",
    killmonster = [{30093,1}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(5067)->
    #copymapScheduleSettleCfg {
    id = 5067,
    name = "被发现了！",
    killmonster = [{30097,5}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(5068)->
    #copymapScheduleSettleCfg {
    id = 5068,
    name = "解决门卫",
    killmonster = [{30100,5}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(5069)->
    #copymapScheduleSettleCfg {
    id = 5069,
    name = "魔化的精灵",
    killmonster = [{30101,7}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(5070)->
    #copymapScheduleSettleCfg {
    id = 5070,
    name = "魔化陷阱",
    killmonster = [{30102,7}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(5071)->
    #copymapScheduleSettleCfg {
    id = 5071,
    name = "营救开始I",
    killmonster = [{30104,5}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(5072)->
    #copymapScheduleSettleCfg {
    id = 5072,
    name = "第一滴血",
    killmonster = [{30105,7}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(5073)->
    #copymapScheduleSettleCfg {
    id = 5073,
    name = "魔族的反扑",
    killmonster = [{35001,7}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(5074)->
    #copymapScheduleSettleCfg {
    id = 5074,
    name = "追击残余魔军",
    killmonster = [{35002,7}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(5075)->
    #copymapScheduleSettleCfg {
    id = 5075,
    name = "狂暴的亲卫队",
    killmonster = [{30106,6}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(5076)->
    #copymapScheduleSettleCfg {
    id = 5076,
    name = "突来的刁难",
    killmonster = [{30110,6}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(5077)->
    #copymapScheduleSettleCfg {
    id = 5077,
    name = "原形毕露",
    killmonster = [{30113,5}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(5078)->
    #copymapScheduleSettleCfg {
    id = 5078,
    name = "上层精灵的挽歌I",
    killmonster = [{30114,8}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(5079)->
    #copymapScheduleSettleCfg {
    id = 5079,
    name = "上层精灵的挽歌II",
    killmonster = [{35003,8}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(5080)->
    #copymapScheduleSettleCfg {
    id = 5080,
    name = "上层精灵的挽歌III",
    killmonster = [{35004,8}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(5081)->
    #copymapScheduleSettleCfg {
    id = 5081,
    name = "追凶II",
    killmonster = [{30115,5}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(5082)->
    #copymapScheduleSettleCfg {
    id = 5082,
    name = "追凶III",
    killmonster = [{35005,5}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(5083)->
    #copymapScheduleSettleCfg {
    id = 5083,
    name = "追凶V",
    killmonster = [{35006,5}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(5084)->
    #copymapScheduleSettleCfg {
    id = 5084,
    name = "危机60秒",
    killmonster = [{35007,5},{30116,1}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(5085)->
    #copymapScheduleSettleCfg {
    id = 5085,
    name = "危机30秒",
    killmonster = [{30117,2},{30118,2},{30119,2}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(5086)->
    #copymapScheduleSettleCfg {
    id = 5086,
    name = "长途奔袭II",
    killmonster = [{30123,6}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(5087)->
    #copymapScheduleSettleCfg {
    id = 5087,
    name = "摧毁目标",
    killmonster = [{30124,6}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(5088)->
    #copymapScheduleSettleCfg {
    id = 5088,
    name = "孤军奋战I",
    killmonster = [{30125,8}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(5089)->
    #copymapScheduleSettleCfg {
    id = 5089,
    name = "孤军奋战II",
    killmonster = [{35008,8}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(5090)->
    #copymapScheduleSettleCfg {
    id = 5090,
    name = "孤军奋战III",
    killmonster = [{35009,8}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(5091)->
    #copymapScheduleSettleCfg {
    id = 5091,
    name = "怪兽出笼II",
    killmonster = [{30127,1}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(5092)->
    #copymapScheduleSettleCfg {
    id = 5092,
    name = "怪兽出笼IV",
    killmonster = [{30128,1}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(5093)->
    #copymapScheduleSettleCfg {
    id = 5093,
    name = "怪兽出笼V",
    killmonster = [{35010,1}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(5094)->
    #copymapScheduleSettleCfg {
    id = 5094,
    name = "火烧前哨",
    killmonster = [{35012,5}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(5095)->
    #copymapScheduleSettleCfg {
    id = 5095,
    name = "教训土著",
    killmonster = [{35014,6},{35013,1}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(5096)->
    #copymapScheduleSettleCfg {
    id = 5096,
    name = "将功补过",
    killmonster = [{35015,7}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(5097)->
    #copymapScheduleSettleCfg {
    id = 5097,
    name = "到底谁捆谁I",
    killmonster = [{35016,7}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(5098)->
    #copymapScheduleSettleCfg {
    id = 5098,
    name = "越狱I",
    killmonster = [{35017,8}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(5099)->
    #copymapScheduleSettleCfg {
    id = 5099,
    name = "越狱II",
    killmonster = [{35018,8}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(5100)->
    #copymapScheduleSettleCfg {
    id = 5100,
    name = "魔族镇守的大门",
    killmonster = [{35019,1},{35022,4}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(5101)->
    #copymapScheduleSettleCfg {
    id = 5101,
    name = "魔族的反击",
    killmonster = [{35023,8}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(5102)->
    #copymapScheduleSettleCfg {
    id = 5102,
    name = "魔族守军的突袭I",
    killmonster = [{35024,8}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(5103)->
    #copymapScheduleSettleCfg {
    id = 5103,
    name = "魔族守军的突袭II",
    killmonster = [{35025,8}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(5104)->
    #copymapScheduleSettleCfg {
    id = 5104,
    name = "守护者的愤怒I",
    killmonster = [{35027,17}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(5105)->
    #copymapScheduleSettleCfg {
    id = 5105,
    name = "守护者的愤怒II",
    killmonster = [{35028,17}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(5106)->
    #copymapScheduleSettleCfg {
    id = 5106,
    name = "解除苍空女王的禁锢",
    killmonster = [{35030,15}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(5107)->
    #copymapScheduleSettleCfg {
    id = 5107,
    name = "千星审判降临",
    killmonster = [],
    collect = [{202,1},{203,1},{204,1},{205,1}],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(5108)->
    #copymapScheduleSettleCfg {
    id = 5108,
    name = "抓回逃犯",
    killmonster = [{35031,15}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(5109)->
    #copymapScheduleSettleCfg {
    id = 5109,
    name = "打探军情",
    killmonster = [{35032,10}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(5110)->
    #copymapScheduleSettleCfg {
    id = 5110,
    name = "冰冷的河水",
    killmonster = [{35033,10}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(5111)->
    #copymapScheduleSettleCfg {
    id = 5111,
    name = "重返大路",
    killmonster = [{35034,10}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(5112)->
    #copymapScheduleSettleCfg {
    id = 5112,
    name = "分秒必争",
    killmonster = [{35035,10}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(5113)->
    #copymapScheduleSettleCfg {
    id = 5113,
    name = "守护者的愤怒I",
    killmonster = [{35036,10}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(5114)->
    #copymapScheduleSettleCfg {
    id = 5114,
    name = "守护者的愤怒II",
    killmonster = [{35036,10}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(5115)->
    #copymapScheduleSettleCfg {
    id = 5115,
    name = "追击元凶",
    killmonster = [{35037,10}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(5116)->
    #copymapScheduleSettleCfg {
    id = 5116,
    name = "有序撤离",
    killmonster = [{35038,10}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(5117)->
    #copymapScheduleSettleCfg {
    id = 5117,
    name = "继续前进",
    killmonster = [{35039,10}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(5118)->
    #copymapScheduleSettleCfg {
    id = 5118,
    name = "杀出重围",
    killmonster = [{35040,10}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(5119)->
    #copymapScheduleSettleCfg {
    id = 5119,
    name = "长途奔袭I",
    killmonster = [{35041,10}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(5120)->
    #copymapScheduleSettleCfg {
    id = 5120,
    name = "前往交界地I",
    killmonster = [{35042,10}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(5121)->
    #copymapScheduleSettleCfg {
    id = 5121,
    name = "前往交界地II",
    killmonster = [{35043,10}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(5122)->
    #copymapScheduleSettleCfg {
    id = 5122,
    name = "押解罪人I",
    killmonster = [{35044,10}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(5123)->
    #copymapScheduleSettleCfg {
    id = 5123,
    name = "押解罪人II",
    killmonster = [{35045,10}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(5124)->
    #copymapScheduleSettleCfg {
    id = 5124,
    name = "觉醒仪式",
    killmonster = [],
    collect = [{209,1},{210,1},{211,1}],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(5125)->
    #copymapScheduleSettleCfg {
    id = 5125,
    name = "觉醒仪式",
    killmonster = [{22042,1},{22043,1},{22044,1}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(5126)->
    #copymapScheduleSettleCfg {
    id = 5126,
    name = "召集水手II",
    killmonster = [{22045,1}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(5127)->
    #copymapScheduleSettleCfg {
    id = 5127,
    name = "感性的女仆",
    killmonster = [{22046,1}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(5128)->
    #copymapScheduleSettleCfg {
    id = 5128,
    name = "半路截击",
    killmonster = [{22047,9}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(5129)->
    #copymapScheduleSettleCfg {
    id = 5129,
    name = "剿灭魔族",
    killmonster = [{22048,1},{22049,9}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(5130)->
    #copymapScheduleSettleCfg {
    id = 5130,
    name = "营地保卫战I",
    killmonster = [{35052,9}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(5131)->
    #copymapScheduleSettleCfg {
    id = 5131,
    name = "营地保卫战II",
    killmonster = [{35052,9}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(5132)->
    #copymapScheduleSettleCfg {
    id = 5132,
    name = "营地大扫除II",
    killmonster = [{35053,9}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(5133)->
    #copymapScheduleSettleCfg {
    id = 5133,
    name = "魔族的围攻",
    killmonster = [{35052,8},{35054,1}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(5134)->
    #copymapScheduleSettleCfg {
    id = 5134,
    name = "和睦生财II",
    killmonster = [{35055,9}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(5135)->
    #copymapScheduleSettleCfg {
    id = 5135,
    name = "全面开战I",
    killmonster = [{35056,8},{35057,1}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(5136)->
    #copymapScheduleSettleCfg {
    id = 5136,
    name = "全面开战II",
    killmonster = [{35056,8},{35057,1}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(5137)->
    #copymapScheduleSettleCfg {
    id = 5137,
    name = "全面开战III",
    killmonster = [{35056,8},{35057,1}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(5138)->
    #copymapScheduleSettleCfg {
    id = 5138,
    name = "暗中破坏",
    killmonster = [{35058,9}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(5139)->
    #copymapScheduleSettleCfg {
    id = 5139,
    name = "反围剿",
    killmonster = [{35058,9}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(5140)->
    #copymapScheduleSettleCfg {
    id = 5140,
    name = "突发情况",
    killmonster = [{35059,9}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(5141)->
    #copymapScheduleSettleCfg {
    id = 5141,
    name = "虎口脱险I",
    killmonster = [{35060,9}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(5142)->
    #copymapScheduleSettleCfg {
    id = 5142,
    name = "虎口脱险II",
    killmonster = [{35060,9}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(5143)->
    #copymapScheduleSettleCfg {
    id = 5143,
    name = "火火火II",
    killmonster = [{35061,9}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(5144)->
    #copymapScheduleSettleCfg {
    id = 5144,
    name = "火火火III",
    killmonster = [{35061,9}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(5145)->
    #copymapScheduleSettleCfg {
    id = 5145,
    name = "撤离II",
    killmonster = [{35062,9}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(5146)->
    #copymapScheduleSettleCfg {
    id = 5146,
    name = "继续战斗",
    killmonster = [{35062,9}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(5147)->
    #copymapScheduleSettleCfg {
    id = 5147,
    name = "拷问魔族",
    killmonster = [{35063,9}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(5148)->
    #copymapScheduleSettleCfg {
    id = 5148,
    name = "突破守卫II",
    killmonster = [{35063,9}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(5149)->
    #copymapScheduleSettleCfg {
    id = 5149,
    name = "爪牙来袭",
    killmonster = [{35064,9}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(5150)->
    #copymapScheduleSettleCfg {
    id = 5150,
    name = "黑暗来袭II",
    killmonster = [{35064,8},{35065,1}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(5151)->
    #copymapScheduleSettleCfg {
    id = 5151,
    name = "黑暗来袭III",
    killmonster = [{35064,8},{35065,1}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(5152)->
    #copymapScheduleSettleCfg {
    id = 5152,
    name = "复原大白",
    killmonster = [],
    collect = [{213,1}],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(5153)->
    #copymapScheduleSettleCfg {
    id = 5153,
    name = "复原大白",
    killmonster = [],
    collect = [{214,1}],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(5154)->
    #copymapScheduleSettleCfg {
    id = 5154,
    name = "采集咕咕",
    killmonster = [],
    collect = [{215,1}],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(5507)->
    #copymapScheduleSettleCfg {
    id = 5507,
    name = "王城的黑暗面",
    killmonster = [{33007,5}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(5508)->
    #copymapScheduleSettleCfg {
    id = 5508,
    name = "舞池斗舞",
    killmonster = [{33015,4}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(5587)->
    #copymapScheduleSettleCfg {
    id = 5587,
    name = "强行关闭能量法阵",
    killmonster = [],
    collect = [{115,2}],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(10000)->
    #copymapScheduleSettleCfg {
    id = 10000,
    name = "史莱姆秘境 12级 P1",
    killmonster = [{1221,1}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(10001)->
    #copymapScheduleSettleCfg {
    id = 10001,
    name = "史莱姆秘境 29级 P1",
    killmonster = [{1223,1}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(10002)->
    #copymapScheduleSettleCfg {
    id = 10002,
    name = "史莱姆秘境 48级 P1",
    killmonster = [{1225,1}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(10003)->
    #copymapScheduleSettleCfg {
    id = 10003,
    name = "史莱姆秘境 68级 P1",
    killmonster = [{1256,1}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(10004)->
    #copymapScheduleSettleCfg {
    id = 10004,
    name = "史莱姆秘境 88级 P1",
    killmonster = [{1258,1}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(10005)->
    #copymapScheduleSettleCfg {
    id = 10005,
    name = "史莱姆秘境 108级 P1",
    killmonster = [{1260,1}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(10006)->
    #copymapScheduleSettleCfg {
    id = 10006,
    name = "史莱姆秘境 12级 开场动画",
    killmonster = [],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 1
    };
getRow(10007)->
    #copymapScheduleSettleCfg {
    id = 10007,
    name = "史莱姆秘境 12级 中场动画",
    killmonster = [],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 1
    };
getRow(10008)->
    #copymapScheduleSettleCfg {
    id = 10008,
    name = "史莱姆秘境 12级 P2",
    killmonster = [{1229,1},{1200,1}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(10009)->
    #copymapScheduleSettleCfg {
    id = 10009,
    name = "史莱姆秘境 29级 P2",
    killmonster = [{1231,1},{1201,1},{1202,1}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(10010)->
    #copymapScheduleSettleCfg {
    id = 10010,
    name = "史莱姆秘境 48级 P2",
    killmonster = [{1233,1},{1203,1},{1204,1},{1205,1}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(10011)->
    #copymapScheduleSettleCfg {
    id = 10011,
    name = "史莱姆秘境 68级 P2",
    killmonster = [{1262,1},{1206,1},{1207,1},{1208,1},{1209,1}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(10012)->
    #copymapScheduleSettleCfg {
    id = 10012,
    name = "史莱姆秘境 88级 P2",
    killmonster = [{1264,1},{1210,1},{1211,1},{1212,1},{1213,1},{1214,1}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(10013)->
    #copymapScheduleSettleCfg {
    id = 10013,
    name = "史莱姆秘境 108级 P2",
    killmonster = [{1266,1},{1215,1},{1216,1},{1217,1},{1218,1},{1219,1},{1220,1}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(10014)->
    #copymapScheduleSettleCfg {
    id = 10014,
    name = "史莱姆秘境 20级 P1",
    killmonster = [{1222,1}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(10015)->
    #copymapScheduleSettleCfg {
    id = 10015,
    name = "史莱姆秘境 38级 P1",
    killmonster = [{1224,1}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(10016)->
    #copymapScheduleSettleCfg {
    id = 10016,
    name = "史莱姆秘境 58级 P1",
    killmonster = [{1226,1}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(10017)->
    #copymapScheduleSettleCfg {
    id = 10017,
    name = "史莱姆秘境 78级 P1",
    killmonster = [{1257,1}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(10018)->
    #copymapScheduleSettleCfg {
    id = 10018,
    name = "史莱姆秘境 98级 P1",
    killmonster = [{1259,1}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(10019)->
    #copymapScheduleSettleCfg {
    id = 10019,
    name = "史莱姆秘境 118级 P1",
    killmonster = [{1261,1}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(10020)->
    #copymapScheduleSettleCfg {
    id = 10020,
    name = "史莱姆秘境 20级 P2",
    killmonster = [{1230,1},{1235,1}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(10021)->
    #copymapScheduleSettleCfg {
    id = 10021,
    name = "史莱姆秘境 38级 P2",
    killmonster = [{1232,1},{1236,1},{1237,1}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(10022)->
    #copymapScheduleSettleCfg {
    id = 10022,
    name = "史莱姆秘境 58级 P2",
    killmonster = [{1234,1},{1238,1},{1239,1},{1240,1}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(10023)->
    #copymapScheduleSettleCfg {
    id = 10023,
    name = "史莱姆秘境 78级 P2",
    killmonster = [{1263,1},{1241,1},{1242,1},{1243,1},{1244,1}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(10024)->
    #copymapScheduleSettleCfg {
    id = 10024,
    name = "史莱姆秘境 98级 P2",
    killmonster = [{1265,1},{1245,1},{1246,1},{1247,1},{1248,1},{1249,1}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(10025)->
    #copymapScheduleSettleCfg {
    id = 10025,
    name = "史莱姆秘境 118级 P2",
    killmonster = [{1267,1},{1250,1},{1251,1},{1252,1},{1253,1},{1254,1},{1255,1}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(20000)->
    #copymapScheduleSettleCfg {
    id = 20000,
    name = "经验副本每波结束条件",
    killmonster = [],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 1
    };
getRow(20001)->
    #copymapScheduleSettleCfg {
    id = 20001,
    name = "所有开始倒计时结束条件",
    killmonster = [],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(21000)->
    #copymapScheduleSettleCfg {
    id = 21000,
    name = "20级普通副本",
    killmonster = [{2003,3},{2000,4}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(21001)->
    #copymapScheduleSettleCfg {
    id = 21001,
    name = "20级普通副本",
    killmonster = [{2003,3},{2001,4}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(21002)->
    #copymapScheduleSettleCfg {
    id = 21002,
    name = "20级普通副本",
    killmonster = [{2003,3},{2002,4}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(21003)->
    #copymapScheduleSettleCfg {
    id = 21003,
    name = "20级普通副本",
    killmonster = [{2004,1},{2005,1},{2006,1}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(21004)->
    #copymapScheduleSettleCfg {
    id = 21004,
    name = "20级普通副本",
    killmonster = [{2000,2},{2001,2},{2002,2},{2007,1}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(21010)->
    #copymapScheduleSettleCfg {
    id = 21010,
    name = "30级普通副本",
    killmonster = [{2010,3},{2011,3}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(21011)->
    #copymapScheduleSettleCfg {
    id = 21011,
    name = "30级普通副本",
    killmonster = [{2010,2},{2013,2}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(21012)->
    #copymapScheduleSettleCfg {
    id = 21012,
    name = "30级普通副本",
    killmonster = [{2011,2},{2014,2}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(21013)->
    #copymapScheduleSettleCfg {
    id = 21013,
    name = "30级普通副本",
    killmonster = [{2012,2},{2013,3},{2014,3}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(21014)->
    #copymapScheduleSettleCfg {
    id = 21014,
    name = "30级普通副本",
    killmonster = [{2013,1},{2014,1}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(21015)->
    #copymapScheduleSettleCfg {
    id = 21015,
    name = "30级普通副本",
    killmonster = [{2015,1}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(21020)->
    #copymapScheduleSettleCfg {
    id = 21020,
    name = "40级普通副本",
    killmonster = [{2020,6},{2023,3}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(21021)->
    #copymapScheduleSettleCfg {
    id = 21021,
    name = "40级普通副本",
    killmonster = [{2021,6},{2023,3}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(21022)->
    #copymapScheduleSettleCfg {
    id = 21022,
    name = "40级普通副本",
    killmonster = [{2024,1}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(21023)->
    #copymapScheduleSettleCfg {
    id = 21023,
    name = "40级普通副本",
    killmonster = [{2025,1}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(21030)->
    #copymapScheduleSettleCfg {
    id = 21030,
    name = "50级普通副本",
    killmonster = [{2030,2},{2031,2},{2032,2}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(21031)->
    #copymapScheduleSettleCfg {
    id = 21031,
    name = "50级普通副本",
    killmonster = [{2031,2},{2031,2},{2032,2}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(21032)->
    #copymapScheduleSettleCfg {
    id = 21032,
    name = "50级普通副本",
    killmonster = [{2033,1},{2033,1}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(21033)->
    #copymapScheduleSettleCfg {
    id = 21033,
    name = "50级普通副本",
    killmonster = [{2031,2},{2031,2},{2033,2}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(21034)->
    #copymapScheduleSettleCfg {
    id = 21034,
    name = "50级普通副本",
    killmonster = [{2032,2},{2032,2},{2034,2}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(21035)->
    #copymapScheduleSettleCfg {
    id = 21035,
    name = "50级普通副本",
    killmonster = [{2033,1},{2033,1},{2034,1},{2034,1}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(21036)->
    #copymapScheduleSettleCfg {
    id = 21036,
    name = "50级普通副本",
    killmonster = [{2035,1}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(21040)->
    #copymapScheduleSettleCfg {
    id = 21040,
    name = "60级普通副本",
    killmonster = [{2040,1},{2041,2},{2042,2}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(21041)->
    #copymapScheduleSettleCfg {
    id = 21041,
    name = "60级普通副本",
    killmonster = [{2040,1},{2042,2},{2043,1}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(21042)->
    #copymapScheduleSettleCfg {
    id = 21042,
    name = "60级普通副本",
    killmonster = [{2043,1},{2044,1}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(21043)->
    #copymapScheduleSettleCfg {
    id = 21043,
    name = "60级普通副本",
    killmonster = [{2040,1},{2041,1},{2043,1}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(21044)->
    #copymapScheduleSettleCfg {
    id = 21044,
    name = "60级普通副本",
    killmonster = [{2041,2},{2044,1}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(21045)->
    #copymapScheduleSettleCfg {
    id = 21045,
    name = "60级普通副本",
    killmonster = [{2045,1}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(21046)->
    #copymapScheduleSettleCfg {
    id = 21046,
    name = "X级普通副本",
    killmonster = [{2536,3},{2537,3}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(21047)->
    #copymapScheduleSettleCfg {
    id = 21047,
    name = "X级普通副本",
    killmonster = [{2538,3},{2539,3}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(21048)->
    #copymapScheduleSettleCfg {
    id = 21048,
    name = "X级普通副本",
    killmonster = [{2539,2},{2540,3}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(21049)->
    #copymapScheduleSettleCfg {
    id = 21049,
    name = "X级普通副本",
    killmonster = [{2541,4}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(21050)->
    #copymapScheduleSettleCfg {
    id = 21050,
    name = "X级普通副本",
    killmonster = [{2541,3},{2542,1}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(21051)->
    #copymapScheduleSettleCfg {
    id = 21051,
    name = "X级普通副本",
    killmonster = [{2543,1}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(25000)->
    #copymapScheduleSettleCfg {
    id = 25000,
    name = "20级英雄副本",
    killmonster = [{2503,3},{2500,4}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(25001)->
    #copymapScheduleSettleCfg {
    id = 25001,
    name = "20级英雄副本",
    killmonster = [{2503,3},{2501,4}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(25002)->
    #copymapScheduleSettleCfg {
    id = 25002,
    name = "20级英雄副本",
    killmonster = [{2503,3},{2502,4}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(25003)->
    #copymapScheduleSettleCfg {
    id = 25003,
    name = "20级英雄副本",
    killmonster = [{2504,1},{2505,1},{2506,1}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(25004)->
    #copymapScheduleSettleCfg {
    id = 25004,
    name = "20级英雄副本",
    killmonster = [{2507,1}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(25010)->
    #copymapScheduleSettleCfg {
    id = 25010,
    name = "30级英雄副本",
    killmonster = [{2510,3},{2511,3}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(25011)->
    #copymapScheduleSettleCfg {
    id = 25011,
    name = "30级英雄副本",
    killmonster = [{2510,2},{2513,2}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(25012)->
    #copymapScheduleSettleCfg {
    id = 25012,
    name = "30级英雄副本",
    killmonster = [{2511,2},{2514,2}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(25013)->
    #copymapScheduleSettleCfg {
    id = 25013,
    name = "30级英雄副本",
    killmonster = [{2512,2},{2513,3},{2514,3}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(25014)->
    #copymapScheduleSettleCfg {
    id = 25014,
    name = "30级英雄副本",
    killmonster = [{2513,1},{2514,1}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(25015)->
    #copymapScheduleSettleCfg {
    id = 25015,
    name = "30级英雄副本",
    killmonster = [{2515,1}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(25020)->
    #copymapScheduleSettleCfg {
    id = 25020,
    name = "40级英雄副本",
    killmonster = [{2520,6},{2523,3}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(25021)->
    #copymapScheduleSettleCfg {
    id = 25021,
    name = "40级英雄副本",
    killmonster = [{2521,6},{2523,3}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(25022)->
    #copymapScheduleSettleCfg {
    id = 25022,
    name = "40级英雄副本",
    killmonster = [{2524,1}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(25023)->
    #copymapScheduleSettleCfg {
    id = 25023,
    name = "40级英雄副本",
    killmonster = [{2525,1}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(25030)->
    #copymapScheduleSettleCfg {
    id = 25030,
    name = "50级英雄副本",
    killmonster = [{2530,3},{2531,3},{2532,3}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(25031)->
    #copymapScheduleSettleCfg {
    id = 25031,
    name = "50级英雄副本",
    killmonster = [{2531,3},{2531,3},{2532,3}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(25032)->
    #copymapScheduleSettleCfg {
    id = 25032,
    name = "50级英雄副本",
    killmonster = [{2533,2},{2533,2}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(25033)->
    #copymapScheduleSettleCfg {
    id = 25033,
    name = "50级英雄副本",
    killmonster = [{2531,3},{2531,3},{2533,3}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(25034)->
    #copymapScheduleSettleCfg {
    id = 25034,
    name = "50级英雄副本",
    killmonster = [{2532,3},{2532,3},{2534,2}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(25035)->
    #copymapScheduleSettleCfg {
    id = 25035,
    name = "50级英雄副本",
    killmonster = [{2533,1},{2533,1},{2534,1},{2534,1}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(25036)->
    #copymapScheduleSettleCfg {
    id = 25036,
    name = "50级英雄副本",
    killmonster = [{2535,1}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(25037)->
    #copymapScheduleSettleCfg {
    id = 25037,
    name = "X级英雄副本",
    killmonster = [{2544,3},{2545,3}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(25038)->
    #copymapScheduleSettleCfg {
    id = 25038,
    name = "X级英雄副本",
    killmonster = [{2546,3},{2547,3}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(25039)->
    #copymapScheduleSettleCfg {
    id = 25039,
    name = "X级英雄副本",
    killmonster = [{2547,2},{2548,3}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(25040)->
    #copymapScheduleSettleCfg {
    id = 25040,
    name = "X级英雄副本",
    killmonster = [{2549,4}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(25041)->
    #copymapScheduleSettleCfg {
    id = 25041,
    name = "X级英雄副本",
    killmonster = [{2548,3},{2550,1}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(25042)->
    #copymapScheduleSettleCfg {
    id = 25042,
    name = "X级英雄副本",
    killmonster = [{2551,1}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(30000)->
    #copymapScheduleSettleCfg {
    id = 30000,
    name = "守护女神新手-关卡1",
    killmonster = [{501,4},{502,4}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0,
    defeatmonster = [{690,1}]
    };
getRow(30001)->
    #copymapScheduleSettleCfg {
    id = 30001,
    name = "守护女神新手-关卡2",
    killmonster = [{503,9}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0,
    defeatmonster = [{690,1}]
    };
getRow(30003)->
    #copymapScheduleSettleCfg {
    id = 30003,
    name = "守护女神新手-关卡1-boss",
    killmonster = [{601,1}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0,
    defeatmonster = [{690,1}]
    };
getRow(30004)->
    #copymapScheduleSettleCfg {
    id = 30004,
    name = "守护女神新手-关卡4",
    killmonster = [{501,4},{502,4}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0,
    defeatmonster = [{690,1}]
    };
getRow(30005)->
    #copymapScheduleSettleCfg {
    id = 30005,
    name = "守护女神新手-关卡5",
    killmonster = [{503,9}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0,
    defeatmonster = [{690,1}]
    };
getRow(30007)->
    #copymapScheduleSettleCfg {
    id = 30007,
    name = "守护女神新手-关卡2-boss",
    killmonster = [{604,1}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0,
    defeatmonster = [{690,1}]
    };
getRow(30008)->
    #copymapScheduleSettleCfg {
    id = 30008,
    name = "守护女神新手-关卡7",
    killmonster = [{501,4},{502,4}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0,
    defeatmonster = [{690,1}]
    };
getRow(30009)->
    #copymapScheduleSettleCfg {
    id = 30009,
    name = "守护女神新手-关卡8",
    killmonster = [{503,9}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0,
    defeatmonster = [{690,1}]
    };
getRow(30011)->
    #copymapScheduleSettleCfg {
    id = 30011,
    name = "守护女神新手-关卡3-boss",
    killmonster = [{607,1}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0,
    defeatmonster = [{690,1}]
    };
getRow(30100)->
    #copymapScheduleSettleCfg {
    id = 30100,
    name = "蟹将讨厌你",
    killmonster = [{508,9}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0,
    defeatmonster = [{691,1}]
    };
getRow(30101)->
    #copymapScheduleSettleCfg {
    id = 30101,
    name = "小鱼不爱你",
    killmonster = [{509,9}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0,
    defeatmonster = [{691,1}]
    };
getRow(30103)->
    #copymapScheduleSettleCfg {
    id = 30103,
    name = "拍拍",
    killmonster = [{610,1}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0,
    defeatmonster = [{691,1}]
    };
getRow(30104)->
    #copymapScheduleSettleCfg {
    id = 30104,
    name = "姣姣来啦",
    killmonster = [{510,9}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0,
    defeatmonster = [{691,1}]
    };
getRow(30105)->
    #copymapScheduleSettleCfg {
    id = 30105,
    name = "鳄鱼酱",
    killmonster = [{511,9}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0,
    defeatmonster = [{691,1}]
    };
getRow(30107)->
    #copymapScheduleSettleCfg {
    id = 30107,
    name = "杜莎",
    killmonster = [{613,1}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0,
    defeatmonster = [{691,1}]
    };
getRow(30109)->
    #copymapScheduleSettleCfg {
    id = 30109,
    name = "恋人的复仇",
    killmonster = [{616,1}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0,
    defeatmonster = [{691,1}]
    };
getRow(30200)->
    #copymapScheduleSettleCfg {
    id = 30200,
    name = "阿拉丁.赤",
    killmonster = [{514,9}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0,
    defeatmonster = [{692,1}]
    };
getRow(30201)->
    #copymapScheduleSettleCfg {
    id = 30201,
    name = "魔小酱",
    killmonster = [{515,9}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0,
    defeatmonster = [{692,1}]
    };
getRow(30203)->
    #copymapScheduleSettleCfg {
    id = 30203,
    name = "星辰之力",
    killmonster = [{622,1}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0,
    defeatmonster = [{692,1}]
    };
getRow(30204)->
    #copymapScheduleSettleCfg {
    id = 30204,
    name = "阿拉丁.赤",
    killmonster = [{514,9}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0,
    defeatmonster = [{692,1}]
    };
getRow(30205)->
    #copymapScheduleSettleCfg {
    id = 30205,
    name = "魔小酱",
    killmonster = [{515,9}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0,
    defeatmonster = [{692,1}]
    };
getRow(30207)->
    #copymapScheduleSettleCfg {
    id = 30207,
    name = "爱の光",
    killmonster = [{625,1}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0,
    defeatmonster = [{692,1}]
    };
getRow(30208)->
    #copymapScheduleSettleCfg {
    id = 30208,
    name = "阿拉丁.赤",
    killmonster = [{514,9}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0,
    defeatmonster = [{692,1}]
    };
getRow(30209)->
    #copymapScheduleSettleCfg {
    id = 30209,
    name = "魔小酱",
    killmonster = [{515,9}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0,
    defeatmonster = [{692,1}]
    };
getRow(30211)->
    #copymapScheduleSettleCfg {
    id = 30211,
    name = "魔族公主",
    killmonster = [{628,1}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0,
    defeatmonster = [{692,1}]
    };
getRow(30300)->
    #copymapScheduleSettleCfg {
    id = 30300,
    name = "魂香花",
    killmonster = [{519,9}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0,
    defeatmonster = [{693,1}]
    };
getRow(30301)->
    #copymapScheduleSettleCfg {
    id = 30301,
    name = "绿之精",
    killmonster = [{520,9}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0,
    defeatmonster = [{693,1}]
    };
getRow(30303)->
    #copymapScheduleSettleCfg {
    id = 30303,
    name = "精灵机械师",
    killmonster = [{631,1}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0,
    defeatmonster = [{693,1}]
    };
getRow(30304)->
    #copymapScheduleSettleCfg {
    id = 30304,
    name = "绿之精",
    killmonster = [{520,9}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0,
    defeatmonster = [{693,1}]
    };
getRow(30305)->
    #copymapScheduleSettleCfg {
    id = 30305,
    name = "精灵守卫",
    killmonster = [{521,9}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0,
    defeatmonster = [{693,1}]
    };
getRow(30307)->
    #copymapScheduleSettleCfg {
    id = 30307,
    name = "盖亚",
    killmonster = [{634,1}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0,
    defeatmonster = [{693,1}]
    };
getRow(30309)->
    #copymapScheduleSettleCfg {
    id = 30309,
    name = "精灵原力",
    killmonster = [{637,1}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0,
    defeatmonster = [{693,1}]
    };
getRow(30400)->
    #copymapScheduleSettleCfg {
    id = 30400,
    name = "桀",
    killmonster = [{524,9}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0,
    defeatmonster = [{694,1}]
    };
getRow(30401)->
    #copymapScheduleSettleCfg {
    id = 30401,
    name = "骜",
    killmonster = [{525,9}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0,
    defeatmonster = [{694,1}]
    };
getRow(30403)->
    #copymapScheduleSettleCfg {
    id = 30403,
    name = "熔火核心",
    killmonster = [{640,1}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0,
    defeatmonster = [{694,1}]
    };
getRow(30404)->
    #copymapScheduleSettleCfg {
    id = 30404,
    name = "杀铃",
    killmonster = [{526,9}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0,
    defeatmonster = [{694,1}]
    };
getRow(30405)->
    #copymapScheduleSettleCfg {
    id = 30405,
    name = "月见",
    killmonster = [{527,9}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0,
    defeatmonster = [{694,1}]
    };
getRow(30407)->
    #copymapScheduleSettleCfg {
    id = 30407,
    name = "蜃语",
    killmonster = [{643,1}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0,
    defeatmonster = [{694,1}]
    };
getRow(30409)->
    #copymapScheduleSettleCfg {
    id = 30409,
    name = "影.阿尔赛德",
    killmonster = [{646,1}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0,
    defeatmonster = [{694,1}]
    };
getRow(30501)->
    #copymapScheduleSettleCfg {
    id = 30501,
    name = "女神守卫",
    killmonster = [{649,1},{652,1}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(30503)->
    #copymapScheduleSettleCfg {
    id = 30503,
    name = "祝福女神",
    killmonster = [{655,1},{658,1}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(30600)->
    #copymapScheduleSettleCfg {
    id = 30600,
    name = "冰熊",
    killmonster = [{531,9}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0,
    defeatmonster = [{695,1}]
    };
getRow(30601)->
    #copymapScheduleSettleCfg {
    id = 30601,
    name = "鳄鱼桑",
    killmonster = [{532,9}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0,
    defeatmonster = [{695,1}]
    };
getRow(30603)->
    #copymapScheduleSettleCfg {
    id = 30603,
    name = "巨岩酱",
    killmonster = [{661,1}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0,
    defeatmonster = [{695,1}]
    };
getRow(30604)->
    #copymapScheduleSettleCfg {
    id = 30604,
    name = "土狼桑",
    killmonster = [{533,9}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0,
    defeatmonster = [{695,1}]
    };
getRow(30605)->
    #copymapScheduleSettleCfg {
    id = 30605,
    name = "蛟蛟酱",
    killmonster = [{534,9}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0,
    defeatmonster = [{695,1}]
    };
getRow(30607)->
    #copymapScheduleSettleCfg {
    id = 30607,
    name = "杜莎",
    killmonster = [{664,1}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0,
    defeatmonster = [{695,1}]
    };
getRow(30609)->
    #copymapScheduleSettleCfg {
    id = 30609,
    name = "伊丽莎白",
    killmonster = [{667,1}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0,
    defeatmonster = [{695,1}]
    };
getRow(30700)->
    #copymapScheduleSettleCfg {
    id = 30700,
    name = "魔小酱",
    killmonster = [{539,9}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0,
    defeatmonster = [{696,1}]
    };
getRow(30701)->
    #copymapScheduleSettleCfg {
    id = 30701,
    name = "蛟蛟酱",
    killmonster = [{538,9}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0,
    defeatmonster = [{696,1}]
    };
getRow(30703)->
    #copymapScheduleSettleCfg {
    id = 30703,
    name = "爱の光",
    killmonster = [{670,1}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0,
    defeatmonster = [{696,1}]
    };
getRow(30704)->
    #copymapScheduleSettleCfg {
    id = 30704,
    name = "绿之精",
    killmonster = [{541,9}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0,
    defeatmonster = [{696,1}]
    };
getRow(30705)->
    #copymapScheduleSettleCfg {
    id = 30705,
    name = "杀铃",
    killmonster = [{544,9}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0,
    defeatmonster = [{696,1}]
    };
getRow(30707)->
    #copymapScheduleSettleCfg {
    id = 30707,
    name = "莉莉丝公主",
    killmonster = [{673,1}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0,
    defeatmonster = [{696,1}]
    };
getRow(30709)->
    #copymapScheduleSettleCfg {
    id = 30709,
    name = "盖亚",
    killmonster = [{676,1}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0,
    defeatmonster = [{696,1}]
    };
getRow(30801)->
    #copymapScheduleSettleCfg {
    id = 30801,
    name = "女神守卫",
    killmonster = [{679,1},{682,1}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(30803)->
    #copymapScheduleSettleCfg {
    id = 30803,
    name = "祝福女神",
    killmonster = [{685,1},{688,1}],
    collect = [],
    countdown = 0,
    task = 0,
    play_show1 = 0,
    play_show2 = 0,
    cd_show2 = 0,
    iskillall = 0
    };
getRow(_)->[].

getKeyList()->[
    {108},
    {300},
    {301},
    {302},
    {303},
    {304},
    {305},
    {306},
    {307},
    {308},
    {310},
    {314},
    {315},
    {316},
    {317},
    {318},
    {322},
    {325},
    {326},
    {327},
    {328},
    {329},
    {330},
    {331},
    {332},
    {333},
    {334},
    {335},
    {336},
    {337},
    {338},
    {339},
    {340},
    {341},
    {342},
    {343},
    {348},
    {600},
    {950},
    {951},
    {952},
    {953},
    {954},
    {955},
    {956},
    {957},
    {958},
    {959},
    {970},
    {971},
    {972},
    {973},
    {974},
    {975},
    {976},
    {977},
    {978},
    {979},
    {990},
    {991},
    {992},
    {993},
    {994},
    {995},
    {996},
    {997},
    {998},
    {999},
    {1010},
    {1011},
    {1012},
    {1013},
    {1014},
    {1015},
    {1016},
    {1017},
    {1018},
    {1019},
    {1030},
    {1031},
    {1032},
    {1033},
    {1034},
    {1035},
    {1036},
    {1037},
    {1038},
    {1039},
    {1040},
    {1041},
    {1042},
    {1043},
    {1044},
    {1050},
    {1051},
    {1052},
    {1053},
    {1054},
    {1055},
    {1056},
    {1057},
    {1058},
    {1059},
    {1070},
    {1071},
    {1072},
    {1073},
    {1074},
    {1075},
    {1076},
    {1077},
    {1078},
    {1079},
    {1090},
    {1091},
    {1092},
    {1093},
    {1094},
    {1095},
    {1096},
    {1097},
    {1098},
    {1099},
    {1120},
    {1121},
    {1122},
    {1123},
    {1124},
    {1125},
    {1126},
    {1127},
    {1140},
    {1141},
    {1142},
    {1143},
    {1144},
    {1145},
    {1146},
    {1147},
    {1160},
    {1161},
    {1162},
    {1163},
    {1164},
    {1165},
    {1166},
    {1167},
    {1180},
    {1181},
    {1182},
    {1183},
    {1184},
    {1185},
    {1186},
    {1187},
    {1200},
    {1201},
    {1202},
    {1203},
    {1204},
    {1205},
    {1206},
    {1207},
    {1220},
    {1221},
    {1222},
    {1223},
    {1224},
    {1225},
    {1226},
    {1227},
    {1240},
    {1241},
    {1242},
    {1243},
    {1244},
    {1245},
    {1246},
    {1247},
    {1260},
    {1261},
    {1262},
    {1263},
    {1264},
    {1265},
    {1266},
    {1267},
    {1400},
    {1401},
    {1402},
    {1403},
    {1404},
    {1405},
    {1406},
    {1407},
    {1408},
    {1409},
    {1410},
    {1420},
    {1421},
    {1422},
    {1423},
    {1424},
    {1425},
    {1426},
    {1427},
    {1428},
    {1429},
    {1430},
    {1440},
    {1441},
    {1442},
    {1443},
    {1444},
    {1445},
    {1446},
    {1447},
    {1448},
    {1449},
    {1450},
    {1460},
    {1461},
    {1462},
    {1463},
    {1464},
    {1465},
    {1466},
    {1467},
    {1468},
    {1469},
    {1470},
    {1480},
    {1481},
    {1482},
    {1483},
    {1484},
    {1485},
    {1486},
    {1487},
    {1488},
    {1489},
    {1490},
    {1510},
    {1511},
    {1512},
    {1513},
    {1514},
    {1515},
    {1516},
    {1517},
    {1518},
    {1519},
    {1520},
    {1530},
    {1531},
    {1532},
    {1533},
    {1534},
    {1535},
    {1536},
    {1537},
    {1538},
    {1539},
    {1540},
    {1550},
    {1551},
    {1552},
    {1553},
    {1554},
    {1555},
    {1556},
    {1557},
    {1558},
    {1559},
    {1560},
    {1600},
    {1601},
    {1602},
    {1603},
    {1604},
    {1605},
    {1606},
    {1607},
    {1608},
    {1609},
    {1610},
    {1611},
    {1612},
    {1613},
    {1614},
    {1620},
    {1621},
    {1622},
    {1623},
    {1624},
    {1625},
    {1626},
    {1627},
    {1628},
    {1629},
    {1630},
    {1631},
    {1632},
    {1633},
    {1634},
    {1640},
    {1641},
    {1642},
    {1643},
    {1644},
    {1645},
    {1646},
    {1647},
    {1648},
    {1649},
    {1650},
    {1651},
    {1652},
    {1653},
    {1654},
    {1660},
    {1661},
    {1662},
    {1663},
    {1664},
    {1665},
    {1666},
    {1667},
    {1668},
    {1669},
    {1670},
    {1671},
    {1672},
    {1673},
    {1674},
    {1680},
    {1681},
    {1682},
    {1683},
    {1684},
    {1685},
    {1686},
    {1687},
    {1688},
    {1689},
    {1690},
    {1691},
    {1692},
    {1693},
    {1694},
    {1700},
    {1701},
    {1702},
    {1703},
    {1704},
    {1705},
    {1706},
    {1707},
    {1708},
    {1709},
    {1710},
    {1711},
    {1712},
    {1713},
    {1714},
    {1720},
    {1721},
    {1722},
    {1723},
    {1724},
    {1725},
    {1726},
    {1727},
    {1728},
    {1729},
    {1730},
    {1731},
    {1732},
    {1733},
    {1734},
    {1740},
    {1741},
    {1742},
    {1743},
    {1744},
    {1745},
    {1746},
    {1747},
    {1748},
    {1749},
    {1750},
    {1751},
    {1752},
    {1753},
    {1754},
    {2000},
    {2001},
    {2002},
    {2003},
    {2004},
    {2005},
    {2006},
    {2007},
    {2008},
    {2009},
    {2010},
    {2011},
    {2012},
    {2013},
    {2014},
    {2015},
    {2016},
    {2017},
    {2018},
    {2019},
    {2020},
    {2021},
    {2022},
    {2023},
    {2024},
    {2025},
    {2026},
    {2027},
    {2028},
    {2029},
    {2030},
    {2031},
    {2032},
    {2033},
    {2034},
    {2035},
    {2036},
    {2037},
    {2100},
    {2101},
    {2102},
    {2103},
    {2104},
    {2105},
    {2106},
    {2107},
    {2108},
    {2109},
    {2110},
    {2111},
    {2112},
    {2113},
    {2114},
    {2115},
    {2116},
    {2117},
    {2118},
    {2119},
    {2120},
    {2121},
    {2122},
    {2123},
    {2124},
    {2125},
    {2126},
    {2127},
    {2128},
    {2129},
    {2200},
    {2201},
    {2202},
    {2203},
    {2204},
    {2205},
    {2206},
    {2207},
    {2208},
    {2209},
    {2210},
    {2211},
    {2212},
    {2213},
    {2214},
    {2215},
    {2216},
    {2217},
    {2218},
    {2219},
    {2220},
    {2221},
    {2222},
    {2223},
    {2224},
    {2225},
    {2226},
    {2227},
    {2228},
    {2229},
    {2230},
    {2231},
    {2232},
    {2233},
    {2234},
    {2235},
    {2236},
    {2237},
    {2238},
    {2239},
    {2300},
    {2301},
    {2302},
    {2303},
    {2304},
    {2305},
    {2306},
    {2307},
    {2308},
    {2309},
    {2310},
    {2311},
    {2312},
    {2313},
    {2314},
    {2315},
    {2316},
    {2317},
    {2318},
    {2319},
    {2320},
    {2321},
    {2322},
    {2323},
    {2324},
    {2325},
    {2326},
    {2327},
    {2328},
    {2329},
    {5000},
    {5001},
    {5002},
    {5003},
    {5004},
    {5005},
    {5006},
    {5007},
    {5008},
    {5009},
    {5010},
    {5011},
    {5012},
    {5013},
    {5014},
    {5015},
    {5016},
    {5017},
    {5018},
    {5020},
    {5022},
    {5030},
    {5031},
    {5051},
    {5052},
    {5053},
    {5054},
    {5055},
    {5056},
    {5057},
    {5058},
    {5059},
    {5060},
    {5064},
    {5065},
    {5066},
    {5067},
    {5068},
    {5069},
    {5070},
    {5071},
    {5072},
    {5073},
    {5074},
    {5075},
    {5076},
    {5077},
    {5078},
    {5079},
    {5080},
    {5081},
    {5082},
    {5083},
    {5084},
    {5085},
    {5086},
    {5087},
    {5088},
    {5089},
    {5090},
    {5091},
    {5092},
    {5093},
    {5094},
    {5095},
    {5096},
    {5097},
    {5098},
    {5099},
    {5100},
    {5101},
    {5102},
    {5103},
    {5104},
    {5105},
    {5106},
    {5107},
    {5108},
    {5109},
    {5110},
    {5111},
    {5112},
    {5113},
    {5114},
    {5115},
    {5116},
    {5117},
    {5118},
    {5119},
    {5120},
    {5121},
    {5122},
    {5123},
    {5124},
    {5125},
    {5126},
    {5127},
    {5128},
    {5129},
    {5130},
    {5131},
    {5132},
    {5133},
    {5134},
    {5135},
    {5136},
    {5137},
    {5138},
    {5139},
    {5140},
    {5141},
    {5142},
    {5143},
    {5144},
    {5145},
    {5146},
    {5147},
    {5148},
    {5149},
    {5150},
    {5151},
    {5152},
    {5153},
    {5154},
    {5507},
    {5508},
    {5587},
    {10000},
    {10001},
    {10002},
    {10003},
    {10004},
    {10005},
    {10006},
    {10007},
    {10008},
    {10009},
    {10010},
    {10011},
    {10012},
    {10013},
    {10014},
    {10015},
    {10016},
    {10017},
    {10018},
    {10019},
    {10020},
    {10021},
    {10022},
    {10023},
    {10024},
    {10025},
    {20000},
    {20001},
    {21000},
    {21001},
    {21002},
    {21003},
    {21004},
    {21010},
    {21011},
    {21012},
    {21013},
    {21014},
    {21015},
    {21020},
    {21021},
    {21022},
    {21023},
    {21030},
    {21031},
    {21032},
    {21033},
    {21034},
    {21035},
    {21036},
    {21040},
    {21041},
    {21042},
    {21043},
    {21044},
    {21045},
    {21046},
    {21047},
    {21048},
    {21049},
    {21050},
    {21051},
    {25000},
    {25001},
    {25002},
    {25003},
    {25004},
    {25010},
    {25011},
    {25012},
    {25013},
    {25014},
    {25015},
    {25020},
    {25021},
    {25022},
    {25023},
    {25030},
    {25031},
    {25032},
    {25033},
    {25034},
    {25035},
    {25036},
    {25037},
    {25038},
    {25039},
    {25040},
    {25041},
    {25042},
    {30000},
    {30001},
    {30003},
    {30004},
    {30005},
    {30007},
    {30008},
    {30009},
    {30011},
    {30100},
    {30101},
    {30103},
    {30104},
    {30105},
    {30107},
    {30109},
    {30200},
    {30201},
    {30203},
    {30204},
    {30205},
    {30207},
    {30208},
    {30209},
    {30211},
    {30300},
    {30301},
    {30303},
    {30304},
    {30305},
    {30307},
    {30309},
    {30400},
    {30401},
    {30403},
    {30404},
    {30405},
    {30407},
    {30409},
    {30501},
    {30503},
    {30600},
    {30601},
    {30603},
    {30604},
    {30605},
    {30607},
    {30609},
    {30700},
    {30701},
    {30703},
    {30704},
    {30705},
    {30707},
    {30709},
    {30801},
    {30803}
    ].

get1KeyList()->[
    108,
    300,
    301,
    302,
    303,
    304,
    305,
    306,
    307,
    308,
    310,
    314,
    315,
    316,
    317,
    318,
    322,
    325,
    326,
    327,
    328,
    329,
    330,
    331,
    332,
    333,
    334,
    335,
    336,
    337,
    338,
    339,
    340,
    341,
    342,
    343,
    348,
    600,
    950,
    951,
    952,
    953,
    954,
    955,
    956,
    957,
    958,
    959,
    970,
    971,
    972,
    973,
    974,
    975,
    976,
    977,
    978,
    979,
    990,
    991,
    992,
    993,
    994,
    995,
    996,
    997,
    998,
    999,
    1010,
    1011,
    1012,
    1013,
    1014,
    1015,
    1016,
    1017,
    1018,
    1019,
    1030,
    1031,
    1032,
    1033,
    1034,
    1035,
    1036,
    1037,
    1038,
    1039,
    1040,
    1041,
    1042,
    1043,
    1044,
    1050,
    1051,
    1052,
    1053,
    1054,
    1055,
    1056,
    1057,
    1058,
    1059,
    1070,
    1071,
    1072,
    1073,
    1074,
    1075,
    1076,
    1077,
    1078,
    1079,
    1090,
    1091,
    1092,
    1093,
    1094,
    1095,
    1096,
    1097,
    1098,
    1099,
    1120,
    1121,
    1122,
    1123,
    1124,
    1125,
    1126,
    1127,
    1140,
    1141,
    1142,
    1143,
    1144,
    1145,
    1146,
    1147,
    1160,
    1161,
    1162,
    1163,
    1164,
    1165,
    1166,
    1167,
    1180,
    1181,
    1182,
    1183,
    1184,
    1185,
    1186,
    1187,
    1200,
    1201,
    1202,
    1203,
    1204,
    1205,
    1206,
    1207,
    1220,
    1221,
    1222,
    1223,
    1224,
    1225,
    1226,
    1227,
    1240,
    1241,
    1242,
    1243,
    1244,
    1245,
    1246,
    1247,
    1260,
    1261,
    1262,
    1263,
    1264,
    1265,
    1266,
    1267,
    1400,
    1401,
    1402,
    1403,
    1404,
    1405,
    1406,
    1407,
    1408,
    1409,
    1410,
    1420,
    1421,
    1422,
    1423,
    1424,
    1425,
    1426,
    1427,
    1428,
    1429,
    1430,
    1440,
    1441,
    1442,
    1443,
    1444,
    1445,
    1446,
    1447,
    1448,
    1449,
    1450,
    1460,
    1461,
    1462,
    1463,
    1464,
    1465,
    1466,
    1467,
    1468,
    1469,
    1470,
    1480,
    1481,
    1482,
    1483,
    1484,
    1485,
    1486,
    1487,
    1488,
    1489,
    1490,
    1510,
    1511,
    1512,
    1513,
    1514,
    1515,
    1516,
    1517,
    1518,
    1519,
    1520,
    1530,
    1531,
    1532,
    1533,
    1534,
    1535,
    1536,
    1537,
    1538,
    1539,
    1540,
    1550,
    1551,
    1552,
    1553,
    1554,
    1555,
    1556,
    1557,
    1558,
    1559,
    1560,
    1600,
    1601,
    1602,
    1603,
    1604,
    1605,
    1606,
    1607,
    1608,
    1609,
    1610,
    1611,
    1612,
    1613,
    1614,
    1620,
    1621,
    1622,
    1623,
    1624,
    1625,
    1626,
    1627,
    1628,
    1629,
    1630,
    1631,
    1632,
    1633,
    1634,
    1640,
    1641,
    1642,
    1643,
    1644,
    1645,
    1646,
    1647,
    1648,
    1649,
    1650,
    1651,
    1652,
    1653,
    1654,
    1660,
    1661,
    1662,
    1663,
    1664,
    1665,
    1666,
    1667,
    1668,
    1669,
    1670,
    1671,
    1672,
    1673,
    1674,
    1680,
    1681,
    1682,
    1683,
    1684,
    1685,
    1686,
    1687,
    1688,
    1689,
    1690,
    1691,
    1692,
    1693,
    1694,
    1700,
    1701,
    1702,
    1703,
    1704,
    1705,
    1706,
    1707,
    1708,
    1709,
    1710,
    1711,
    1712,
    1713,
    1714,
    1720,
    1721,
    1722,
    1723,
    1724,
    1725,
    1726,
    1727,
    1728,
    1729,
    1730,
    1731,
    1732,
    1733,
    1734,
    1740,
    1741,
    1742,
    1743,
    1744,
    1745,
    1746,
    1747,
    1748,
    1749,
    1750,
    1751,
    1752,
    1753,
    1754,
    2000,
    2001,
    2002,
    2003,
    2004,
    2005,
    2006,
    2007,
    2008,
    2009,
    2010,
    2011,
    2012,
    2013,
    2014,
    2015,
    2016,
    2017,
    2018,
    2019,
    2020,
    2021,
    2022,
    2023,
    2024,
    2025,
    2026,
    2027,
    2028,
    2029,
    2030,
    2031,
    2032,
    2033,
    2034,
    2035,
    2036,
    2037,
    2100,
    2101,
    2102,
    2103,
    2104,
    2105,
    2106,
    2107,
    2108,
    2109,
    2110,
    2111,
    2112,
    2113,
    2114,
    2115,
    2116,
    2117,
    2118,
    2119,
    2120,
    2121,
    2122,
    2123,
    2124,
    2125,
    2126,
    2127,
    2128,
    2129,
    2200,
    2201,
    2202,
    2203,
    2204,
    2205,
    2206,
    2207,
    2208,
    2209,
    2210,
    2211,
    2212,
    2213,
    2214,
    2215,
    2216,
    2217,
    2218,
    2219,
    2220,
    2221,
    2222,
    2223,
    2224,
    2225,
    2226,
    2227,
    2228,
    2229,
    2230,
    2231,
    2232,
    2233,
    2234,
    2235,
    2236,
    2237,
    2238,
    2239,
    2300,
    2301,
    2302,
    2303,
    2304,
    2305,
    2306,
    2307,
    2308,
    2309,
    2310,
    2311,
    2312,
    2313,
    2314,
    2315,
    2316,
    2317,
    2318,
    2319,
    2320,
    2321,
    2322,
    2323,
    2324,
    2325,
    2326,
    2327,
    2328,
    2329,
    5000,
    5001,
    5002,
    5003,
    5004,
    5005,
    5006,
    5007,
    5008,
    5009,
    5010,
    5011,
    5012,
    5013,
    5014,
    5015,
    5016,
    5017,
    5018,
    5020,
    5022,
    5030,
    5031,
    5051,
    5052,
    5053,
    5054,
    5055,
    5056,
    5057,
    5058,
    5059,
    5060,
    5064,
    5065,
    5066,
    5067,
    5068,
    5069,
    5070,
    5071,
    5072,
    5073,
    5074,
    5075,
    5076,
    5077,
    5078,
    5079,
    5080,
    5081,
    5082,
    5083,
    5084,
    5085,
    5086,
    5087,
    5088,
    5089,
    5090,
    5091,
    5092,
    5093,
    5094,
    5095,
    5096,
    5097,
    5098,
    5099,
    5100,
    5101,
    5102,
    5103,
    5104,
    5105,
    5106,
    5107,
    5108,
    5109,
    5110,
    5111,
    5112,
    5113,
    5114,
    5115,
    5116,
    5117,
    5118,
    5119,
    5120,
    5121,
    5122,
    5123,
    5124,
    5125,
    5126,
    5127,
    5128,
    5129,
    5130,
    5131,
    5132,
    5133,
    5134,
    5135,
    5136,
    5137,
    5138,
    5139,
    5140,
    5141,
    5142,
    5143,
    5144,
    5145,
    5146,
    5147,
    5148,
    5149,
    5150,
    5151,
    5152,
    5153,
    5154,
    5507,
    5508,
    5587,
    10000,
    10001,
    10002,
    10003,
    10004,
    10005,
    10006,
    10007,
    10008,
    10009,
    10010,
    10011,
    10012,
    10013,
    10014,
    10015,
    10016,
    10017,
    10018,
    10019,
    10020,
    10021,
    10022,
    10023,
    10024,
    10025,
    20000,
    20001,
    21000,
    21001,
    21002,
    21003,
    21004,
    21010,
    21011,
    21012,
    21013,
    21014,
    21015,
    21020,
    21021,
    21022,
    21023,
    21030,
    21031,
    21032,
    21033,
    21034,
    21035,
    21036,
    21040,
    21041,
    21042,
    21043,
    21044,
    21045,
    21046,
    21047,
    21048,
    21049,
    21050,
    21051,
    25000,
    25001,
    25002,
    25003,
    25004,
    25010,
    25011,
    25012,
    25013,
    25014,
    25015,
    25020,
    25021,
    25022,
    25023,
    25030,
    25031,
    25032,
    25033,
    25034,
    25035,
    25036,
    25037,
    25038,
    25039,
    25040,
    25041,
    25042,
    30000,
    30001,
    30003,
    30004,
    30005,
    30007,
    30008,
    30009,
    30011,
    30100,
    30101,
    30103,
    30104,
    30105,
    30107,
    30109,
    30200,
    30201,
    30203,
    30204,
    30205,
    30207,
    30208,
    30209,
    30211,
    30300,
    30301,
    30303,
    30304,
    30305,
    30307,
    30309,
    30400,
    30401,
    30403,
    30404,
    30405,
    30407,
    30409,
    30501,
    30503,
    30600,
    30601,
    30603,
    30604,
    30605,
    30607,
    30609,
    30700,
    30701,
    30703,
    30704,
    30705,
    30707,
    30709,
    30801,
    30803
    ].

