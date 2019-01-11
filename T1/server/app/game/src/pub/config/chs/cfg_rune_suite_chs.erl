%% coding: latin-1
%%: 实现
-module(cfg_rune_suite_chs).
-compile(export_all).
-include("cfg_rune_suite.hrl").
-include("logger.hrl").

getRow(1,2)->
    #rune_suiteCfg {
    id = 1,
    num = 2,
    rune_suite_name = "力量圣物",
    property = [{138,606,0},{139,606,0}],
    dec = "物防魔防",
    addpower = 1.3
    };
getRow(1,3)->
    #rune_suiteCfg {
    id = 1,
    num = 3,
    rune_suite_name = "力量圣物",
    property = [{135,6066,0}],
    dec = "生命",
    addpower = 1.3
    };
getRow(1,4)->
    #rune_suiteCfg {
    id = 1,
    num = 4,
    rune_suite_name = "力量圣物",
    property = [{136,606,0},{137,606,0}],
    dec = "物攻魔攻",
    addpower = 1.3
    };
getRow(2,2)->
    #rune_suiteCfg {
    id = 2,
    num = 2,
    rune_suite_name = "坚韧圣物",
    property = [{138,606,0},{139,606,0}],
    dec = "物防魔防",
    addpower = 1.3
    };
getRow(2,3)->
    #rune_suiteCfg {
    id = 2,
    num = 3,
    rune_suite_name = "坚韧圣物",
    property = [{135,6066,0}],
    dec = "生命",
    addpower = 1.3
    };
getRow(2,4)->
    #rune_suiteCfg {
    id = 2,
    num = 4,
    rune_suite_name = "坚韧圣物",
    property = [{135,9095,0}],
    dec = "生命",
    addpower = 1.3
    };
getRow(3,2)->
    #rune_suiteCfg {
    id = 3,
    num = 2,
    rune_suite_name = "士兵圣物",
    property = [{138,606,0},{139,606,0}],
    dec = "物防魔防",
    addpower = 1.3
    };
getRow(3,3)->
    #rune_suiteCfg {
    id = 3,
    num = 3,
    rune_suite_name = "士兵圣物",
    property = [{135,6066,0}],
    dec = "生命",
    addpower = 1.3
    };
getRow(3,4)->
    #rune_suiteCfg {
    id = 3,
    num = 4,
    rune_suite_name = "士兵圣物",
    property = [{140,625,0},{141,625,0}],
    dec = "暴击抗暴",
    addpower = 1.3
    };
getRow(4,2)->
    #rune_suiteCfg {
    id = 4,
    num = 2,
    rune_suite_name = "夜刃圣物",
    property = [{138,606,0},{139,606,0}],
    dec = "物防魔防",
    addpower = 1.3
    };
getRow(4,3)->
    #rune_suiteCfg {
    id = 4,
    num = 3,
    rune_suite_name = "夜刃圣物",
    property = [{135,6066,0}],
    dec = "生命",
    addpower = 1.3
    };
getRow(4,4)->
    #rune_suiteCfg {
    id = 4,
    num = 4,
    rune_suite_name = "夜刃圣物",
    property = [{142,792,0},{143,792,0}],
    dec = "爆伤韧性",
    addpower = 1.3
    };
getRow(5,2)->
    #rune_suiteCfg {
    id = 5,
    num = 2,
    rune_suite_name = "迅捷圣物",
    property = [{138,606,0},{139,606,0}],
    dec = "物防魔防",
    addpower = 1.3
    };
getRow(5,3)->
    #rune_suiteCfg {
    id = 5,
    num = 3,
    rune_suite_name = "迅捷圣物",
    property = [{135,6066,0}],
    dec = "生命",
    addpower = 1.3
    };
getRow(5,4)->
    #rune_suiteCfg {
    id = 5,
    num = 4,
    rune_suite_name = "迅捷圣物",
    property = [{144,797,0},{145,797,0}],
    dec = "命中闪避",
    addpower = 1.3
    };
getRow(6,2)->
    #rune_suiteCfg {
    id = 6,
    num = 2,
    rune_suite_name = "奥秘圣物",
    property = [{138,606,0},{139,606,0}],
    dec = "物防魔防",
    addpower = 1.3
    };
getRow(6,3)->
    #rune_suiteCfg {
    id = 6,
    num = 3,
    rune_suite_name = "奥秘圣物",
    property = [{135,6066,0}],
    dec = "生命",
    addpower = 1.3
    };
getRow(6,4)->
    #rune_suiteCfg {
    id = 6,
    num = 4,
    rune_suite_name = "奥秘圣物",
    property = [{146,984,0},{160,984,0}],
    dec = "破甲坚固",
    addpower = 1.3
    };
getRow(7,2)->
    #rune_suiteCfg {
    id = 7,
    num = 2,
    rune_suite_name = "白狮圣物",
    property = [{138,866,0},{139,866,0}],
    dec = "物防魔防",
    addpower = 1.3
    };
getRow(7,3)->
    #rune_suiteCfg {
    id = 7,
    num = 3,
    rune_suite_name = "白狮圣物",
    property = [{135,8666,0}],
    dec = "生命",
    addpower = 1.3
    };
getRow(7,4)->
    #rune_suiteCfg {
    id = 7,
    num = 4,
    rune_suite_name = "白狮圣物",
    property = [{136,866,0},{137,866,0}],
    dec = "物攻魔攻",
    addpower = 1.3
    };
getRow(8,2)->
    #rune_suiteCfg {
    id = 8,
    num = 2,
    rune_suite_name = "神猴圣物",
    property = [{138,866,0},{139,866,0}],
    dec = "物防魔防",
    addpower = 1.3
    };
getRow(8,3)->
    #rune_suiteCfg {
    id = 8,
    num = 3,
    rune_suite_name = "神猴圣物",
    property = [{135,8666,0}],
    dec = "生命",
    addpower = 1.3
    };
getRow(8,4)->
    #rune_suiteCfg {
    id = 8,
    num = 4,
    rune_suite_name = "神猴圣物",
    property = [{135,12993,0}],
    dec = "生命",
    addpower = 1.3
    };
getRow(9,2)->
    #rune_suiteCfg {
    id = 9,
    num = 2,
    rune_suite_name = "爆破圣物",
    property = [{138,866,0},{139,866,0}],
    dec = "物防魔防",
    addpower = 1.3
    };
getRow(9,3)->
    #rune_suiteCfg {
    id = 9,
    num = 3,
    rune_suite_name = "爆破圣物",
    property = [{135,8666,0}],
    dec = "生命",
    addpower = 1.3
    };
getRow(9,4)->
    #rune_suiteCfg {
    id = 9,
    num = 4,
    rune_suite_name = "爆破圣物",
    property = [{140,893,0},{141,893,0}],
    dec = "暴击抗暴",
    addpower = 1.3
    };
getRow(10,2)->
    #rune_suiteCfg {
    id = 10,
    num = 2,
    rune_suite_name = "冰魄圣物",
    property = [{138,866,0},{139,866,0}],
    dec = "物防魔防",
    addpower = 1.3
    };
getRow(10,3)->
    #rune_suiteCfg {
    id = 10,
    num = 3,
    rune_suite_name = "冰魄圣物",
    property = [{135,8666,0}],
    dec = "生命",
    addpower = 1.3
    };
getRow(10,4)->
    #rune_suiteCfg {
    id = 10,
    num = 4,
    rune_suite_name = "冰魄圣物",
    property = [{142,1131,0},{143,1131,0}],
    dec = "爆伤韧性",
    addpower = 1.3
    };
getRow(11,2)->
    #rune_suiteCfg {
    id = 11,
    num = 2,
    rune_suite_name = "灵蛙圣物",
    property = [{138,866,0},{139,866,0}],
    dec = "物防魔防",
    addpower = 1.3
    };
getRow(11,3)->
    #rune_suiteCfg {
    id = 11,
    num = 3,
    rune_suite_name = "灵蛙圣物",
    property = [{135,8666,0}],
    dec = "生命",
    addpower = 1.3
    };
getRow(11,4)->
    #rune_suiteCfg {
    id = 11,
    num = 4,
    rune_suite_name = "灵蛙圣物",
    property = [{144,1139,0},{145,1139,0}],
    dec = "命中闪避",
    addpower = 1.3
    };
getRow(12,2)->
    #rune_suiteCfg {
    id = 12,
    num = 2,
    rune_suite_name = "灵能圣物",
    property = [{138,866,0},{139,866,0}],
    dec = "物防魔防",
    addpower = 1.3
    };
getRow(12,3)->
    #rune_suiteCfg {
    id = 12,
    num = 3,
    rune_suite_name = "灵能圣物",
    property = [{135,8666,0}],
    dec = "生命",
    addpower = 1.3
    };
getRow(12,4)->
    #rune_suiteCfg {
    id = 12,
    num = 4,
    rune_suite_name = "灵能圣物",
    property = [{146,1406,0},{160,1406,0}],
    dec = "破甲坚固",
    addpower = 1.3
    };
getRow(13,2)->
    #rune_suiteCfg {
    id = 13,
    num = 2,
    rune_suite_name = "力量圣物",
    property = [{138,1516,0},{139,1516,0}],
    dec = "物防魔防",
    addpower = 1.3
    };
getRow(13,3)->
    #rune_suiteCfg {
    id = 13,
    num = 3,
    rune_suite_name = "力量圣物",
    property = [{135,15166,0}],
    dec = "生命",
    addpower = 1.3
    };
getRow(13,4)->
    #rune_suiteCfg {
    id = 13,
    num = 4,
    rune_suite_name = "力量圣物",
    property = [{136,1516,0},{137,1516,0}],
    dec = "物攻魔攻",
    addpower = 1.3
    };
getRow(14,2)->
    #rune_suiteCfg {
    id = 14,
    num = 2,
    rune_suite_name = "坚韧圣物",
    property = [{138,1516,0},{139,1516,0}],
    dec = "物防魔防",
    addpower = 1.3
    };
getRow(14,3)->
    #rune_suiteCfg {
    id = 14,
    num = 3,
    rune_suite_name = "坚韧圣物",
    property = [{135,15166,0}],
    dec = "生命",
    addpower = 1.3
    };
getRow(14,4)->
    #rune_suiteCfg {
    id = 14,
    num = 4,
    rune_suite_name = "坚韧圣物",
    property = [{135,22738,0}],
    dec = "生命",
    addpower = 1.3
    };
getRow(15,2)->
    #rune_suiteCfg {
    id = 15,
    num = 2,
    rune_suite_name = "士兵圣物",
    property = [{138,1516,0},{139,1516,0}],
    dec = "物防魔防",
    addpower = 1.3
    };
getRow(15,3)->
    #rune_suiteCfg {
    id = 15,
    num = 3,
    rune_suite_name = "士兵圣物",
    property = [{135,15166,0}],
    dec = "生命",
    addpower = 1.3
    };
getRow(15,4)->
    #rune_suiteCfg {
    id = 15,
    num = 4,
    rune_suite_name = "士兵圣物",
    property = [{140,1564,0},{141,1564,0}],
    dec = "暴击抗暴",
    addpower = 1.3
    };
getRow(16,2)->
    #rune_suiteCfg {
    id = 16,
    num = 2,
    rune_suite_name = "夜刃圣物",
    property = [{138,1516,0},{139,1516,0}],
    dec = "物防魔防",
    addpower = 1.3
    };
getRow(16,3)->
    #rune_suiteCfg {
    id = 16,
    num = 3,
    rune_suite_name = "夜刃圣物",
    property = [{135,15166,0}],
    dec = "生命",
    addpower = 1.3
    };
getRow(16,4)->
    #rune_suiteCfg {
    id = 16,
    num = 4,
    rune_suite_name = "夜刃圣物",
    property = [{142,1980,0},{143,1980,0}],
    dec = "爆伤韧性",
    addpower = 1.3
    };
getRow(17,2)->
    #rune_suiteCfg {
    id = 17,
    num = 2,
    rune_suite_name = "迅捷圣物",
    property = [{138,1516,0},{139,1516,0}],
    dec = "物防魔防",
    addpower = 1.3
    };
getRow(17,3)->
    #rune_suiteCfg {
    id = 17,
    num = 3,
    rune_suite_name = "迅捷圣物",
    property = [{135,15166,0}],
    dec = "生命",
    addpower = 1.3
    };
getRow(17,4)->
    #rune_suiteCfg {
    id = 17,
    num = 4,
    rune_suite_name = "迅捷圣物",
    property = [{144,1994,0},{145,1994,0}],
    dec = "命中闪避",
    addpower = 1.3
    };
getRow(18,2)->
    #rune_suiteCfg {
    id = 18,
    num = 2,
    rune_suite_name = "奥秘圣物",
    property = [{138,1516,0},{139,1516,0}],
    dec = "物防魔防",
    addpower = 1.3
    };
getRow(18,3)->
    #rune_suiteCfg {
    id = 18,
    num = 3,
    rune_suite_name = "奥秘圣物",
    property = [{135,15166,0}],
    dec = "生命",
    addpower = 1.3
    };
getRow(18,4)->
    #rune_suiteCfg {
    id = 18,
    num = 4,
    rune_suite_name = "奥秘圣物",
    property = [{146,2462,0},{160,2462,0}],
    dec = "破甲坚固",
    addpower = 1.3
    };
getRow(19,2)->
    #rune_suiteCfg {
    id = 19,
    num = 2,
    rune_suite_name = "白狮圣物",
    property = [{138,2166,0},{139,2166,0}],
    dec = "物防魔防",
    addpower = 1.3
    };
getRow(19,3)->
    #rune_suiteCfg {
    id = 19,
    num = 3,
    rune_suite_name = "白狮圣物",
    property = [{135,21666,0}],
    dec = "生命",
    addpower = 1.3
    };
getRow(19,4)->
    #rune_suiteCfg {
    id = 19,
    num = 4,
    rune_suite_name = "白狮圣物",
    property = [{136,2166,0},{137,2166,0}],
    dec = "物攻魔攻",
    addpower = 1.3
    };
getRow(20,2)->
    #rune_suiteCfg {
    id = 20,
    num = 2,
    rune_suite_name = "神猴圣物",
    property = [{138,2166,0},{139,2166,0}],
    dec = "物防魔防",
    addpower = 1.3
    };
getRow(20,3)->
    #rune_suiteCfg {
    id = 20,
    num = 3,
    rune_suite_name = "神猴圣物",
    property = [{135,21666,0}],
    dec = "生命",
    addpower = 1.3
    };
getRow(20,4)->
    #rune_suiteCfg {
    id = 20,
    num = 4,
    rune_suite_name = "神猴圣物",
    property = [{135,32483,0}],
    dec = "生命",
    addpower = 1.3
    };
getRow(21,2)->
    #rune_suiteCfg {
    id = 21,
    num = 2,
    rune_suite_name = "爆破圣物",
    property = [{138,2166,0},{139,2166,0}],
    dec = "物防魔防",
    addpower = 1.3
    };
getRow(21,3)->
    #rune_suiteCfg {
    id = 21,
    num = 3,
    rune_suite_name = "爆破圣物",
    property = [{135,21666,0}],
    dec = "生命",
    addpower = 1.3
    };
getRow(21,4)->
    #rune_suiteCfg {
    id = 21,
    num = 4,
    rune_suite_name = "爆破圣物",
    property = [{140,2234,0},{141,2234,0}],
    dec = "暴击抗暴",
    addpower = 1.3
    };
getRow(22,2)->
    #rune_suiteCfg {
    id = 22,
    num = 2,
    rune_suite_name = "冰魄圣物",
    property = [{138,2166,0},{139,2166,0}],
    dec = "物防魔防",
    addpower = 1.3
    };
getRow(22,3)->
    #rune_suiteCfg {
    id = 22,
    num = 3,
    rune_suite_name = "冰魄圣物",
    property = [{135,21666,0}],
    dec = "生命",
    addpower = 1.3
    };
getRow(22,4)->
    #rune_suiteCfg {
    id = 22,
    num = 4,
    rune_suite_name = "冰魄圣物",
    property = [{142,2828,0},{143,2828,0}],
    dec = "爆伤韧性",
    addpower = 1.3
    };
getRow(23,2)->
    #rune_suiteCfg {
    id = 23,
    num = 2,
    rune_suite_name = "灵蛙圣物",
    property = [{138,2166,0},{139,2166,0}],
    dec = "物防魔防",
    addpower = 1.3
    };
getRow(23,3)->
    #rune_suiteCfg {
    id = 23,
    num = 3,
    rune_suite_name = "灵蛙圣物",
    property = [{135,21666,0}],
    dec = "生命",
    addpower = 1.3
    };
getRow(23,4)->
    #rune_suiteCfg {
    id = 23,
    num = 4,
    rune_suite_name = "灵蛙圣物",
    property = [{144,2848,0},{145,2848,0}],
    dec = "命中闪避",
    addpower = 1.3
    };
getRow(24,2)->
    #rune_suiteCfg {
    id = 24,
    num = 2,
    rune_suite_name = "灵能圣物",
    property = [{138,2166,0},{139,2166,0}],
    dec = "物防魔防",
    addpower = 1.3
    };
getRow(24,3)->
    #rune_suiteCfg {
    id = 24,
    num = 3,
    rune_suite_name = "灵能圣物",
    property = [{135,21666,0}],
    dec = "生命",
    addpower = 1.3
    };
getRow(24,4)->
    #rune_suiteCfg {
    id = 24,
    num = 4,
    rune_suite_name = "灵能圣物",
    property = [{146,3517,0},{160,3517,0}],
    dec = "破甲坚固",
    addpower = 1.3
    };
getRow(25,2)->
    #rune_suiteCfg {
    id = 25,
    num = 2,
    rune_suite_name = "力量圣物",
    property = [{138,3033,0},{139,3033,0}],
    dec = "物防魔防",
    addpower = 1.3
    };
getRow(25,3)->
    #rune_suiteCfg {
    id = 25,
    num = 3,
    rune_suite_name = "力量圣物",
    property = [{135,30333,0}],
    dec = "生命",
    addpower = 1.3
    };
getRow(25,4)->
    #rune_suiteCfg {
    id = 25,
    num = 4,
    rune_suite_name = "力量圣物",
    property = [{136,3033,0},{137,3033,0}],
    dec = "物攻魔攻",
    addpower = 1.3
    };
getRow(26,2)->
    #rune_suiteCfg {
    id = 26,
    num = 2,
    rune_suite_name = "坚韧圣物",
    property = [{138,3033,0},{139,3033,0}],
    dec = "物防魔防",
    addpower = 1.3
    };
getRow(26,3)->
    #rune_suiteCfg {
    id = 26,
    num = 3,
    rune_suite_name = "坚韧圣物",
    property = [{135,30333,0}],
    dec = "生命",
    addpower = 1.3
    };
getRow(26,4)->
    #rune_suiteCfg {
    id = 26,
    num = 4,
    rune_suite_name = "坚韧圣物",
    property = [{135,45477,0}],
    dec = "生命",
    addpower = 1.3
    };
getRow(27,2)->
    #rune_suiteCfg {
    id = 27,
    num = 2,
    rune_suite_name = "士兵圣物",
    property = [{138,3033,0},{139,3033,0}],
    dec = "物防魔防",
    addpower = 1.3
    };
getRow(27,3)->
    #rune_suiteCfg {
    id = 27,
    num = 3,
    rune_suite_name = "士兵圣物",
    property = [{135,30333,0}],
    dec = "生命",
    addpower = 1.3
    };
getRow(27,4)->
    #rune_suiteCfg {
    id = 27,
    num = 4,
    rune_suite_name = "士兵圣物",
    property = [{140,3128,0},{141,3128,0}],
    dec = "暴击抗暴",
    addpower = 1.3
    };
getRow(28,2)->
    #rune_suiteCfg {
    id = 28,
    num = 2,
    rune_suite_name = "夜刃圣物",
    property = [{138,3033,0},{139,3033,0}],
    dec = "物防魔防",
    addpower = 1.3
    };
getRow(28,3)->
    #rune_suiteCfg {
    id = 28,
    num = 3,
    rune_suite_name = "夜刃圣物",
    property = [{135,30333,0}],
    dec = "生命",
    addpower = 1.3
    };
getRow(28,4)->
    #rune_suiteCfg {
    id = 28,
    num = 4,
    rune_suite_name = "夜刃圣物",
    property = [{142,3960,0},{143,3960,0}],
    dec = "爆伤韧性",
    addpower = 1.3
    };
getRow(29,2)->
    #rune_suiteCfg {
    id = 29,
    num = 2,
    rune_suite_name = "迅捷圣物",
    property = [{138,3033,0},{139,3033,0}],
    dec = "物防魔防",
    addpower = 1.3
    };
getRow(29,3)->
    #rune_suiteCfg {
    id = 29,
    num = 3,
    rune_suite_name = "迅捷圣物",
    property = [{135,30333,0}],
    dec = "生命",
    addpower = 1.3
    };
getRow(29,4)->
    #rune_suiteCfg {
    id = 29,
    num = 4,
    rune_suite_name = "迅捷圣物",
    property = [{144,3988,0},{145,3988,0}],
    dec = "命中闪避",
    addpower = 1.3
    };
getRow(30,2)->
    #rune_suiteCfg {
    id = 30,
    num = 2,
    rune_suite_name = "奥秘圣物",
    property = [{138,3033,0},{139,3033,0}],
    dec = "物防魔防",
    addpower = 1.3
    };
getRow(30,3)->
    #rune_suiteCfg {
    id = 30,
    num = 3,
    rune_suite_name = "奥秘圣物",
    property = [{135,30333,0}],
    dec = "生命",
    addpower = 1.3
    };
getRow(30,4)->
    #rune_suiteCfg {
    id = 30,
    num = 4,
    rune_suite_name = "奥秘圣物",
    property = [{146,4924,0},{160,4924,0}],
    dec = "破甲坚固",
    addpower = 1.3
    };
getRow(31,2)->
    #rune_suiteCfg {
    id = 31,
    num = 2,
    rune_suite_name = "白狮圣物",
    property = [{138,4333,0},{139,4333,0}],
    dec = "物防魔防",
    addpower = 1.3
    };
getRow(31,3)->
    #rune_suiteCfg {
    id = 31,
    num = 3,
    rune_suite_name = "白狮圣物",
    property = [{135,43333,0}],
    dec = "生命",
    addpower = 1.3
    };
getRow(31,4)->
    #rune_suiteCfg {
    id = 31,
    num = 4,
    rune_suite_name = "白狮圣物",
    property = [{136,4333,0},{137,4333,0}],
    dec = "物攻魔攻",
    addpower = 1.3
    };
getRow(32,2)->
    #rune_suiteCfg {
    id = 32,
    num = 2,
    rune_suite_name = "神猴圣物",
    property = [{138,4333,0},{139,4333,0}],
    dec = "物防魔防",
    addpower = 1.3
    };
getRow(32,3)->
    #rune_suiteCfg {
    id = 32,
    num = 3,
    rune_suite_name = "神猴圣物",
    property = [{135,43333,0}],
    dec = "生命",
    addpower = 1.3
    };
getRow(32,4)->
    #rune_suiteCfg {
    id = 32,
    num = 4,
    rune_suite_name = "神猴圣物",
    property = [{135,64967,0}],
    dec = "生命",
    addpower = 1.3
    };
getRow(33,2)->
    #rune_suiteCfg {
    id = 33,
    num = 2,
    rune_suite_name = "爆破圣物",
    property = [{138,4333,0},{139,4333,0}],
    dec = "物防魔防",
    addpower = 1.3
    };
getRow(33,3)->
    #rune_suiteCfg {
    id = 33,
    num = 3,
    rune_suite_name = "爆破圣物",
    property = [{135,43333,0}],
    dec = "生命",
    addpower = 1.3
    };
getRow(33,4)->
    #rune_suiteCfg {
    id = 33,
    num = 4,
    rune_suite_name = "爆破圣物",
    property = [{140,4469,0},{141,4469,0}],
    dec = "暴击抗暴",
    addpower = 1.3
    };
getRow(34,2)->
    #rune_suiteCfg {
    id = 34,
    num = 2,
    rune_suite_name = "冰魄圣物",
    property = [{138,4333,0},{139,4333,0}],
    dec = "物防魔防",
    addpower = 1.3
    };
getRow(34,3)->
    #rune_suiteCfg {
    id = 34,
    num = 3,
    rune_suite_name = "冰魄圣物",
    property = [{135,43333,0}],
    dec = "生命",
    addpower = 1.3
    };
getRow(34,4)->
    #rune_suiteCfg {
    id = 34,
    num = 4,
    rune_suite_name = "冰魄圣物",
    property = [{142,5657,0},{143,5657,0}],
    dec = "爆伤韧性",
    addpower = 1.3
    };
getRow(35,2)->
    #rune_suiteCfg {
    id = 35,
    num = 2,
    rune_suite_name = "灵蛙圣物",
    property = [{138,4333,0},{139,4333,0}],
    dec = "物防魔防",
    addpower = 1.3
    };
getRow(35,3)->
    #rune_suiteCfg {
    id = 35,
    num = 3,
    rune_suite_name = "灵蛙圣物",
    property = [{135,43333,0}],
    dec = "生命",
    addpower = 1.3
    };
getRow(35,4)->
    #rune_suiteCfg {
    id = 35,
    num = 4,
    rune_suite_name = "灵蛙圣物",
    property = [{144,5697,0},{145,5697,0}],
    dec = "命中闪避",
    addpower = 1.3
    };
getRow(36,2)->
    #rune_suiteCfg {
    id = 36,
    num = 2,
    rune_suite_name = "灵能圣物",
    property = [{138,4333,0},{139,4333,0}],
    dec = "物防魔防",
    addpower = 1.3
    };
getRow(36,3)->
    #rune_suiteCfg {
    id = 36,
    num = 3,
    rune_suite_name = "灵能圣物",
    property = [{135,43333,0}],
    dec = "生命",
    addpower = 1.3
    };
getRow(36,4)->
    #rune_suiteCfg {
    id = 36,
    num = 4,
    rune_suite_name = "灵能圣物",
    property = [{146,7034,0},{160,7034,0}],
    dec = "破甲坚固",
    addpower = 1.3
    };
getRow(_,_)->[].

getKeyList()->[
    {1,2},
    {1,3},
    {1,4},
    {2,2},
    {2,3},
    {2,4},
    {3,2},
    {3,3},
    {3,4},
    {4,2},
    {4,3},
    {4,4},
    {5,2},
    {5,3},
    {5,4},
    {6,2},
    {6,3},
    {6,4},
    {7,2},
    {7,3},
    {7,4},
    {8,2},
    {8,3},
    {8,4},
    {9,2},
    {9,3},
    {9,4},
    {10,2},
    {10,3},
    {10,4},
    {11,2},
    {11,3},
    {11,4},
    {12,2},
    {12,3},
    {12,4},
    {13,2},
    {13,3},
    {13,4},
    {14,2},
    {14,3},
    {14,4},
    {15,2},
    {15,3},
    {15,4},
    {16,2},
    {16,3},
    {16,4},
    {17,2},
    {17,3},
    {17,4},
    {18,2},
    {18,3},
    {18,4},
    {19,2},
    {19,3},
    {19,4},
    {20,2},
    {20,3},
    {20,4},
    {21,2},
    {21,3},
    {21,4},
    {22,2},
    {22,3},
    {22,4},
    {23,2},
    {23,3},
    {23,4},
    {24,2},
    {24,3},
    {24,4},
    {25,2},
    {25,3},
    {25,4},
    {26,2},
    {26,3},
    {26,4},
    {27,2},
    {27,3},
    {27,4},
    {28,2},
    {28,3},
    {28,4},
    {29,2},
    {29,3},
    {29,4},
    {30,2},
    {30,3},
    {30,4},
    {31,2},
    {31,3},
    {31,4},
    {32,2},
    {32,3},
    {32,4},
    {33,2},
    {33,3},
    {33,4},
    {34,2},
    {34,3},
    {34,4},
    {35,2},
    {35,3},
    {35,4},
    {36,2},
    {36,3},
    {36,4}
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
    36
    ].

get2KeyList(1)->[
    2,
    3,
    4
    ];
get2KeyList(2)->[
    2,
    3,
    4
    ];
get2KeyList(3)->[
    2,
    3,
    4
    ];
get2KeyList(4)->[
    2,
    3,
    4
    ];
get2KeyList(5)->[
    2,
    3,
    4
    ];
get2KeyList(6)->[
    2,
    3,
    4
    ];
get2KeyList(7)->[
    2,
    3,
    4
    ];
get2KeyList(8)->[
    2,
    3,
    4
    ];
get2KeyList(9)->[
    2,
    3,
    4
    ];
get2KeyList(10)->[
    2,
    3,
    4
    ];
get2KeyList(11)->[
    2,
    3,
    4
    ];
get2KeyList(12)->[
    2,
    3,
    4
    ];
get2KeyList(13)->[
    2,
    3,
    4
    ];
get2KeyList(14)->[
    2,
    3,
    4
    ];
get2KeyList(15)->[
    2,
    3,
    4
    ];
get2KeyList(16)->[
    2,
    3,
    4
    ];
get2KeyList(17)->[
    2,
    3,
    4
    ];
get2KeyList(18)->[
    2,
    3,
    4
    ];
get2KeyList(19)->[
    2,
    3,
    4
    ];
get2KeyList(20)->[
    2,
    3,
    4
    ];
get2KeyList(21)->[
    2,
    3,
    4
    ];
get2KeyList(22)->[
    2,
    3,
    4
    ];
get2KeyList(23)->[
    2,
    3,
    4
    ];
get2KeyList(24)->[
    2,
    3,
    4
    ];
get2KeyList(25)->[
    2,
    3,
    4
    ];
get2KeyList(26)->[
    2,
    3,
    4
    ];
get2KeyList(27)->[
    2,
    3,
    4
    ];
get2KeyList(28)->[
    2,
    3,
    4
    ];
get2KeyList(29)->[
    2,
    3,
    4
    ];
get2KeyList(30)->[
    2,
    3,
    4
    ];
get2KeyList(31)->[
    2,
    3,
    4
    ];
get2KeyList(32)->[
    2,
    3,
    4
    ];
get2KeyList(33)->[
    2,
    3,
    4
    ];
get2KeyList(34)->[
    2,
    3,
    4
    ];
get2KeyList(35)->[
    2,
    3,
    4
    ];
get2KeyList(36)->[
    2,
    3,
    4
    ];
get2KeyList(_)->[].

