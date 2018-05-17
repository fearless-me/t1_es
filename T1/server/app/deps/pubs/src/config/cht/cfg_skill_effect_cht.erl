%% coding: latin-1
%%: 实现
-module(cfg_skill_effect_cht).
-compile(export_all).
-include("cfg_skill_effect.hrl").


getRow(0)->
    #skill_effectCfg {
    iD = 0,
    effectType = 0,
    effectChance = 0,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 0,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "永不触发"
    };
getRow(1)->
    #skill_effectCfg {
    iD = 1,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 2,
    param2 = 5,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 2,
    param7 = 10,
    param8 = 0,
    param9 = 0,
    skillName = "自身范围圆随机坐标召唤测试"
    };
getRow(2)->
    #skill_effectCfg {
    iD = 2,
    effectType = 19,
    effectChance = 1,
    effectcondition = 1,
    effectTarget = 0,
    param1 = 204,
    param2 = 122,
    param3 = 1,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "神圣盾击击晕目标"
    };
getRow(3)->
    #skill_effectCfg {
    iD = 3,
    effectType = 14,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 2,
    param2 = 0,
    param3 = 6,
    param4 = 10800,
    param5 = 0,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "净化伤害载体"
    };
getRow(4)->
    #skill_effectCfg {
    iD = 4,
    effectType = 14,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 18,
    param2 = 0,
    param3 = 6,
    param4 = 1800,
    param5 = 1,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "净化抓取载体"
    };
getRow(5)->
    #skill_effectCfg {
    iD = 5,
    effectType = 5,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 0.5,
    param2 = 15,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "冲锋"
    };
getRow(6)->
    #skill_effectCfg {
    iD = 6,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 2,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "王者光环主动"
    };
getRow(7)->
    #skill_effectCfg {
    iD = 7,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 3,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "赦免"
    };
getRow(8)->
    #skill_effectCfg {
    iD = 8,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 3,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "圣光守护"
    };
getRow(9)->
    #skill_effectCfg {
    iD = 9,
    effectType = 14,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 3,
    param1 = 3,
    param2 = 2,
    param3 = 6,
    param4 = 6800,
    param5 = 0,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "黎明之锤载体"
    };
getRow(10)->
    #skill_effectCfg {
    iD = 10,
    effectType = 1,
    effectChance = 1,
    effectcondition = 1,
    effectTarget = 2,
    param1 = 15,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "黎明之锤暴击"
    };
getRow(11)->
    #skill_effectCfg {
    iD = 11,
    effectType = 14,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 4,
    param2 = 0,
    param3 = 6,
    param4 = 10800,
    param5 = 1,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "圣光壁垒载体"
    };
getRow(12)->
    #skill_effectCfg {
    iD = 12,
    effectType = 12,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 1,
    param2 = 0.03,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "圣光壁垒载体回血"
    };
getRow(13)->
    #skill_effectCfg {
    iD = 13,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 4,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "港口竞速减速"
    };
getRow(14)->
    #skill_effectCfg {
    iD = 14,
    effectType = 1,
    effectChance = 1,
    effectcondition = 1,
    effectTarget = 0,
    param1 = 6,
    param2 = 22,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "忏悔"
    };
getRow(15)->
    #skill_effectCfg {
    iD = 15,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 5000,
    param2 = 1,
    param3 = 4000,
    param4 = 0,
    param5 = 0,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "召唤女神"
    };
getRow(16)->
    #skill_effectCfg {
    iD = 16,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 6,
    param2 = 22,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "信仰铠甲"
    };
getRow(17)->
    #skill_effectCfg {
    iD = 17,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 2,
    param2 = 5,
    param3 = 0,
    param4 = 2,
    param5 = 2,
    param6 = 2,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "时间间隔触发召唤怪物测试"
    };
getRow(18)->
    #skill_effectCfg {
    iD = 18,
    effectType = 14,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 51,
    param2 = 5,
    param3 = 5,
    param4 = 5000,
    param5 = 0,
    param6 = 2,
    param7 = 10,
    param8 = 0,
    param9 = 0,
    skillName = "自身范围圆随机坐标创建技能载体"
    };
getRow(19)->
    #skill_effectCfg {
    iD = 19,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 40,
    param2 = 109,
    param3 = 203,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "盾牌大师"
    };
getRow(20)->
    #skill_effectCfg {
    iD = 20,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 55,
    param2 = 1,
    param3 = 0,
    param4 = 10,
    param5 = 10,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "召唤55测试"
    };
getRow(21)->
    #skill_effectCfg {
    iD = 21,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 56,
    param2 = 1,
    param3 = 0,
    param4 = 10,
    param5 = 10,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "召唤56测试"
    };
getRow(22)->
    #skill_effectCfg {
    iD = 22,
    effectType = 3,
    effectChance = 1,
    effectcondition = 1,
    effectTarget = 0,
    param1 = 0,
    param2 = 1,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "审判"
    };
getRow(23)->
    #skill_effectCfg {
    iD = 23,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 43,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "惩戒"
    };
getRow(24)->
    #skill_effectCfg {
    iD = 24,
    effectType = 11,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 1,
    param2 = 5,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "圣力精通"
    };
getRow(25)->
    #skill_effectCfg {
    iD = 25,
    effectType = 7,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 0,
    param2 = 0.5,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "净化抓取载体效果"
    };
getRow(26)->
    #skill_effectCfg {
    iD = 26,
    effectType = 1,
    effectChance = 1,
    effectcondition = 1,
    effectTarget = 0,
    param1 = 8,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "致命火焰点燃"
    };
getRow(27)->
    #skill_effectCfg {
    iD = 27,
    effectType = 11,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 2,
    param2 = 5,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "御法暴击回秘法"
    };
getRow(28)->
    #skill_effectCfg {
    iD = 28,
    effectType = 14,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 3,
    param1 = 5,
    param2 = 0,
    param3 = 6,
    param4 = 3800,
    param5 = 0,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "陨石术伤害载体"
    };
getRow(29)->
    #skill_effectCfg {
    iD = 29,
    effectType = 15,
    effectChance = 1,
    effectcondition = 1,
    effectTarget = 0,
    param1 = 5,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "炎爆"
    };
getRow(30)->
    #skill_effectCfg {
    iD = 30,
    effectType = 1,
    effectChance = 1,
    effectcondition = 1,
    effectTarget = 0,
    param1 = 54,
    param2 = 151,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "击退不受控制0.5秒"
    };
getRow(31)->
    #skill_effectCfg {
    iD = 31,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 9,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "法术结界"
    };
getRow(32)->
    #skill_effectCfg {
    iD = 32,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 10,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "熔岩护甲"
    };
getRow(33)->
    #skill_effectCfg {
    iD = 33,
    effectType = 8,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 50004,
    param2 = 1,
    param3 = 0,
    param4 = 1,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "召唤魔宠"
    };
getRow(34)->
    #skill_effectCfg {
    iD = 34,
    effectType = 19,
    effectChance = 1,
    effectcondition = 1,
    effectTarget = 0,
    param1 = 5,
    param2 = 124,
    param3 = 1,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "冰寒减速"
    };
getRow(35)->
    #skill_effectCfg {
    iD = 35,
    effectType = 14,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 6,
    param2 = 0,
    param3 = 6,
    param4 = 6800,
    param5 = 0,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "冰风暴载体"
    };
getRow(36)->
    #skill_effectCfg {
    iD = 36,
    effectType = 1,
    effectChance = 1,
    effectcondition = 1,
    effectTarget = 0,
    param1 = 5,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "冰风暴载体减速"
    };
getRow(37)->
    #skill_effectCfg {
    iD = 37,
    effectType = 1,
    effectChance = 1,
    effectcondition = 1,
    effectTarget = 0,
    param1 = 11,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "变形术"
    };
getRow(38)->
    #skill_effectCfg {
    iD = 38,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 12,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "寒冰护甲"
    };
getRow(39)->
    #skill_effectCfg {
    iD = 39,
    effectType = 19,
    effectChance = 1,
    effectcondition = 1,
    effectTarget = 0,
    param1 = 5,
    param2 = 124,
    param3 = 1,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "寒冰甲触发减速"
    };
getRow(40)->
    #skill_effectCfg {
    iD = 40,
    effectType = 1,
    effectChance = 1,
    effectcondition = 1,
    effectTarget = 0,
    param1 = 14,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "冰环术冻结"
    };
getRow(41)->
    #skill_effectCfg {
    iD = 41,
    effectType = 1,
    effectChance = 1,
    effectcondition = 1,
    effectTarget = 0,
    param1 = 44,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "极寒之风"
    };
getRow(42)->
    #skill_effectCfg {
    iD = 42,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 45,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "魔龙之心"
    };
getRow(43)->
    #skill_effectCfg {
    iD = 43,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 46,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "冰冷血脉"
    };
getRow(44)->
    #skill_effectCfg {
    iD = 44,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 47,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "虚空之盾"
    };
getRow(45)->
    #skill_effectCfg {
    iD = 45,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 48,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "秘学大师"
    };
getRow(46)->
    #skill_effectCfg {
    iD = 46,
    effectType = 14,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 9,
    param2 = 1,
    param3 = 6,
    param4 = 4800,
    param5 = 0,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "秘能之核载体"
    };
getRow(47)->
    #skill_effectCfg {
    iD = 47,
    effectType = 7,
    effectChance = 1,
    effectcondition = 1,
    effectTarget = 0,
    param1 = 0,
    param2 = 1,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "灵魂收割抓人"
    };
getRow(48)->
    #skill_effectCfg {
    iD = 48,
    effectType = 16,
    effectChance = 1,
    effectcondition = 1,
    effectTarget = 2,
    param1 = 13000,
    param2 = 1000,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "灵魂收割减少冷却"
    };
getRow(49)->
    #skill_effectCfg {
    iD = 49,
    effectType = 1,
    effectChance = 1,
    effectcondition = 1,
    effectTarget = 0,
    param1 = 54,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "灵魂收割抓人不受控制"
    };
getRow(50)->
    #skill_effectCfg {
    iD = 50,
    effectType = 12,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 2,
    param1 = 10,
    param2 = 0.05,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "生命收割"
    };
getRow(51)->
    #skill_effectCfg {
    iD = 51,
    effectType = 1,
    effectChance = 1,
    effectcondition = 1,
    effectTarget = 0,
    param1 = 16,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "灵魂湮灭"
    };
getRow(52)->
    #skill_effectCfg {
    iD = 52,
    effectType = 11,
    effectChance = 1,
    effectcondition = 1,
    effectTarget = 1,
    param1 = 4,
    param2 = 12,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "魔女普攻回魔怒"
    };
getRow(53)->
    #skill_effectCfg {
    iD = 53,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 17,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "邪恶光环"
    };
getRow(54)->
    #skill_effectCfg {
    iD = 54,
    effectType = 8,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 50005,
    param2 = 1,
    param3 = 0,
    param4 = 1,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "恶魔仆人"
    };
getRow(55)->
    #skill_effectCfg {
    iD = 55,
    effectType = 14,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 7,
    param2 = 0,
    param3 = 6,
    param4 = 6800,
    param5 = 0,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "亵渎之地载体"
    };
getRow(56)->
    #skill_effectCfg {
    iD = 56,
    effectType = 16,
    effectChance = 1,
    effectcondition = 1,
    effectTarget = 2,
    param1 = 13003,
    param2 = 1000,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "末日决战减少冷却"
    };
getRow(57)->
    #skill_effectCfg {
    iD = 57,
    effectType = 19,
    effectChance = 1,
    effectcondition = 1,
    effectTarget = 0,
    param1 = 19,
    param2 = 122,
    param3 = 1,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "末日决战击晕"
    };
getRow(58)->
    #skill_effectCfg {
    iD = 58,
    effectType = 5,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 0.5,
    param2 = 0,
    param3 = 700,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "末日决战冲锋"
    };
getRow(59)->
    #skill_effectCfg {
    iD = 59,
    effectType = 1,
    effectChance = 1,
    effectcondition = 1,
    effectTarget = 0,
    param1 = 62,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "暗影灵气"
    };
getRow(60)->
    #skill_effectCfg {
    iD = 60,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 20,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "亡者气息"
    };
getRow(61)->
    #skill_effectCfg {
    iD = 61,
    effectType = 8,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 50006,
    param2 = 1,
    param3 = 0,
    param4 = 1,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "远古恶魔"
    };
getRow(62)->
    #skill_effectCfg {
    iD = 62,
    effectType = 8,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 50006,
    param2 = 4,
    param3 = 0,
    param4 = 3,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "生生不息额外召唤"
    };
getRow(63)->
    #skill_effectCfg {
    iD = 63,
    effectType = 8,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 50009,
    param2 = 1,
    param3 = 0,
    param4 = 1,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "地狱坚韧额外召唤"
    };
getRow(64)->
    #skill_effectCfg {
    iD = 64,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 50,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "邪恶仪式"
    };
getRow(65)->
    #skill_effectCfg {
    iD = 65,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 51,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "地狱坚韧"
    };
getRow(66)->
    #skill_effectCfg {
    iD = 66,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 51,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "地狱坚韧"
    };
getRow(67)->
    #skill_effectCfg {
    iD = 67,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 52,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "黑暗正义"
    };
getRow(68)->
    #skill_effectCfg {
    iD = 68,
    effectType = 11,
    effectChance = 1,
    effectcondition = 1,
    effectTarget = 0,
    param1 = 1,
    param2 = -5,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "灵魂燃烧减圣力"
    };
getRow(69)->
    #skill_effectCfg {
    iD = 69,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 2,
    param1 = 53,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "献祭"
    };
getRow(70)->
    #skill_effectCfg {
    iD = 70,
    effectType = 5,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 0.5,
    param2 = 25,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "雷光刺"
    };
getRow(71)->
    #skill_effectCfg {
    iD = 71,
    effectType = 1,
    effectChance = 1,
    effectcondition = 1,
    effectTarget = 0,
    param1 = 57,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "致命投掷"
    };
getRow(72)->
    #skill_effectCfg {
    iD = 72,
    effectType = 1,
    effectChance = 1,
    effectcondition = 1,
    effectTarget = 0,
    param1 = 58,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "缴械"
    };
getRow(73)->
    #skill_effectCfg {
    iD = 73,
    effectType = 5,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = -0.5,
    param2 = 50,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "一闪"
    };
getRow(74)->
    #skill_effectCfg {
    iD = 74,
    effectType = 1,
    effectChance = 1,
    effectcondition = 1,
    effectTarget = 0,
    param1 = 59,
    param2 = 66,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "影袭"
    };
getRow(75)->
    #skill_effectCfg {
    iD = 75,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 60,
    param2 = 152,
    param3 = 153,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "影武"
    };
getRow(76)->
    #skill_effectCfg {
    iD = 76,
    effectType = 2,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 2,
    param2 = 3,
    param3 = 4,
    param4 = 7,
    param5 = 24,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "影武"
    };
getRow(77)->
    #skill_effectCfg {
    iD = 77,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 61,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "影疗"
    };
getRow(78)->
    #skill_effectCfg {
    iD = 78,
    effectType = 2,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 2,
    param2 = 3,
    param3 = 4,
    param4 = 7,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "影疗"
    };
getRow(79)->
    #skill_effectCfg {
    iD = 79,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 21,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "无敌"
    };
getRow(80)->
    #skill_effectCfg {
    iD = 80,
    effectType = 1,
    effectChance = 1,
    effectcondition = 1,
    effectTarget = 0,
    param1 = 22,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "定身3秒"
    };
getRow(81)->
    #skill_effectCfg {
    iD = 81,
    effectType = 19,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 23,
    param2 = 123,
    param3 = 1,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "冻结"
    };
getRow(82)->
    #skill_effectCfg {
    iD = 82,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 24,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "形变"
    };
getRow(83)->
    #skill_effectCfg {
    iD = 83,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 25,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "沉默"
    };
getRow(84)->
    #skill_effectCfg {
    iD = 84,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 26,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "缴械"
    };
getRow(85)->
    #skill_effectCfg {
    iD = 85,
    effectType = 19,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 27,
    param2 = 124,
    param3 = 1,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "减速"
    };
getRow(86)->
    #skill_effectCfg {
    iD = 86,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 28,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "pk保护"
    };
getRow(87)->
    #skill_effectCfg {
    iD = 87,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 29,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "击退"
    };
getRow(88)->
    #skill_effectCfg {
    iD = 88,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 30,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "伤害转血"
    };
getRow(89)->
    #skill_effectCfg {
    iD = 89,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 31,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "修改生命"
    };
getRow(90)->
    #skill_effectCfg {
    iD = 90,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 32,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "修改法力"
    };
getRow(91)->
    #skill_effectCfg {
    iD = 91,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 33,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "虚化"
    };
getRow(92)->
    #skill_effectCfg {
    iD = 92,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 34,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "吸收盾"
    };
getRow(93)->
    #skill_effectCfg {
    iD = 93,
    effectType = 2,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 2,
    param2 = 3,
    param3 = 4,
    param4 = 5,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "移除状态buff"
    };
getRow(94)->
    #skill_effectCfg {
    iD = 94,
    effectType = 3,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 0,
    param2 = 2,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "随机移除buff"
    };
getRow(95)->
    #skill_effectCfg {
    iD = 95,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 50004,
    param2 = 2,
    param3 = 3000,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "召唤怪物"
    };
getRow(97)->
    #skill_effectCfg {
    iD = 97,
    effectType = 6,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 0,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "强拉仇恨"
    };
getRow(98)->
    #skill_effectCfg {
    iD = 98,
    effectType = 8,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 3,
    param2 = 1,
    param3 = 10000,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "召唤怪物"
    };
getRow(99)->
    #skill_effectCfg {
    iD = 99,
    effectType = 10,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 0.1,
    param2 = 0.1,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "伤害转血"
    };
getRow(100)->
    #skill_effectCfg {
    iD = 100,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 100,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "史莱姆秘境boss自身获得无敌buff创建"
    };
getRow(101)->
    #skill_effectCfg {
    iD = 101,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 101,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "史莱姆秘境boss技能眩晕创建"
    };
getRow(103)->
    #skill_effectCfg {
    iD = 103,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 36,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "羁绊被动技能"
    };
getRow(104)->
    #skill_effectCfg {
    iD = 104,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 100,
    param2 = 10,
    param3 = 60000,
    param4 = 0,
    param5 = 0,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "召唤骷髅战士10"
    };
getRow(105)->
    #skill_effectCfg {
    iD = 105,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 101,
    param2 = 10,
    param3 = 60000,
    param4 = 0,
    param5 = 0,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "召唤骷髅弓手10"
    };
getRow(106)->
    #skill_effectCfg {
    iD = 106,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 102,
    param2 = 10,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 2,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "召唤骷髅战士20"
    };
getRow(107)->
    #skill_effectCfg {
    iD = 107,
    effectType = 14,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 19,
    param2 = 0,
    param3 = 6,
    param4 = 10800,
    param5 = 0,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "火池伤害载体"
    };
getRow(108)->
    #skill_effectCfg {
    iD = 108,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 55,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "战士神力觉醒"
    };
getRow(113)->
    #skill_effectCfg {
    iD = 113,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 60,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "法师神力觉醒"
    };
getRow(118)->
    #skill_effectCfg {
    iD = 118,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 65,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "刺客神力觉醒"
    };
getRow(123)->
    #skill_effectCfg {
    iD = 123,
    effectType = 11,
    effectChance = 1,
    effectcondition = 1,
    effectTarget = 0,
    param1 = 2,
    param2 = -5,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "灵魂燃烧减秘法"
    };
getRow(124)->
    #skill_effectCfg {
    iD = 124,
    effectType = 11,
    effectChance = 1,
    effectcondition = 1,
    effectTarget = 0,
    param1 = 3,
    param2 = -5,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "灵魂燃烧减魔怒"
    };
getRow(125)->
    #skill_effectCfg {
    iD = 125,
    effectType = 11,
    effectChance = 1,
    effectcondition = 1,
    effectTarget = 0,
    param1 = 4,
    param2 = -5,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "灵魂燃烧减影力"
    };
getRow(126)->
    #skill_effectCfg {
    iD = 126,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 73,
    param2 = 101,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "乱影击不受控制虚化"
    };
getRow(127)->
    #skill_effectCfg {
    iD = 127,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 75,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "杀戮机器"
    };
getRow(128)->
    #skill_effectCfg {
    iD = 128,
    effectType = 11,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 3,
    param2 = 25,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "乘胜追击"
    };
getRow(129)->
    #skill_effectCfg {
    iD = 129,
    effectType = 11,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 4,
    param2 = 3,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "战斗潜能"
    };
getRow(130)->
    #skill_effectCfg {
    iD = 130,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 76,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "刺客信条"
    };
getRow(131)->
    #skill_effectCfg {
    iD = 131,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 77,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "料敌先机"
    };
getRow(132)->
    #skill_effectCfg {
    iD = 132,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 78,
    param2 = 151,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "麻痹毒药"
    };
getRow(133)->
    #skill_effectCfg {
    iD = 133,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 79,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "致伤毒药"
    };
getRow(134)->
    #skill_effectCfg {
    iD = 134,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 80,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "熔岩护甲触发跑速"
    };
getRow(135)->
    #skill_effectCfg {
    iD = 135,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 81,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "王者光环调用"
    };
getRow(136)->
    #skill_effectCfg {
    iD = 136,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 82,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "王者光环被动属性"
    };
getRow(137)->
    #skill_effectCfg {
    iD = 137,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 83,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "邪恶光环调用"
    };
getRow(138)->
    #skill_effectCfg {
    iD = 138,
    effectType = 1,
    effectChance = 1,
    effectcondition = 1,
    effectTarget = 0,
    param1 = 84,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "邪恶光环被动属性"
    };
getRow(139)->
    #skill_effectCfg {
    iD = 139,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 85,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "希望光环调用"
    };
getRow(140)->
    #skill_effectCfg {
    iD = 140,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 86,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "希望光环被动属性"
    };
getRow(141)->
    #skill_effectCfg {
    iD = 141,
    effectType = 1,
    effectChance = 1,
    effectcondition = 1,
    effectTarget = 0,
    param1 = 87,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "极寒之风伤害加深"
    };
getRow(142)->
    #skill_effectCfg {
    iD = 142,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 111,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "极寒之风提高暴击"
    };
getRow(143)->
    #skill_effectCfg {
    iD = 143,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 89,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "邪恶光环调用"
    };
getRow(144)->
    #skill_effectCfg {
    iD = 144,
    effectType = 1,
    effectChance = 1,
    effectcondition = 1,
    effectTarget = 0,
    param1 = 90,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "邪恶光环被动属性"
    };
getRow(145)->
    #skill_effectCfg {
    iD = 145,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 88,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "审判"
    };
getRow(146)->
    #skill_effectCfg {
    iD = 146,
    effectType = 11,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 4,
    param2 = 3,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "受到攻击回魔怒"
    };
getRow(147)->
    #skill_effectCfg {
    iD = 147,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 92,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "影踪劲"
    };
getRow(148)->
    #skill_effectCfg {
    iD = 148,
    effectType = 1,
    effectChance = 1,
    effectcondition = 1,
    effectTarget = 0,
    param1 = 93,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "影踪劲触发持续伤害"
    };
getRow(149)->
    #skill_effectCfg {
    iD = 149,
    effectType = 19,
    effectChance = 1,
    effectcondition = 1,
    effectTarget = 0,
    param1 = 94,
    param2 = 122,
    param3 = 1,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "M冲锋击晕"
    };
getRow(150)->
    #skill_effectCfg {
    iD = 150,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 103,
    param2 = 10,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 2,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "召唤骷髅弓手20"
    };
getRow(151)->
    #skill_effectCfg {
    iD = 151,
    effectType = 14,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 23,
    param2 = 0,
    param3 = 6,
    param4 = 10800,
    param5 = 0,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "高级火池伤害载体"
    };
getRow(152)->
    #skill_effectCfg {
    iD = 152,
    effectType = 14,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 24,
    param2 = 0,
    param3 = 6,
    param4 = 10800,
    param5 = 0,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "毒池伤害载体"
    };
getRow(153)->
    #skill_effectCfg {
    iD = 153,
    effectType = 1,
    effectChance = 1,
    effectcondition = 1,
    effectTarget = 0,
    param1 = 95,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "持续暗影伤害"
    };
getRow(154)->
    #skill_effectCfg {
    iD = 154,
    effectType = 14,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 25,
    param2 = 0,
    param3 = 6,
    param4 = 10800,
    param5 = 0,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "高级毒池伤害载体"
    };
getRow(155)->
    #skill_effectCfg {
    iD = 155,
    effectType = 1,
    effectChance = 1,
    effectcondition = 1,
    effectTarget = 0,
    param1 = 96,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "持续暗影伤害"
    };
getRow(156)->
    #skill_effectCfg {
    iD = 156,
    effectType = 14,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 26,
    param2 = 0,
    param3 = 6,
    param4 = 10800,
    param5 = 0,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "冰池伤害载体"
    };
getRow(157)->
    #skill_effectCfg {
    iD = 157,
    effectType = 14,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 27,
    param2 = 0,
    param3 = 6,
    param4 = 10800,
    param5 = 0,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "高级冰池伤害载体"
    };
getRow(158)->
    #skill_effectCfg {
    iD = 158,
    effectType = 19,
    effectChance = 1,
    effectcondition = 1,
    effectTarget = 0,
    param1 = 5,
    param2 = 124,
    param3 = 1,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "减速"
    };
getRow(159)->
    #skill_effectCfg {
    iD = 159,
    effectType = 14,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 28,
    param2 = 0,
    param3 = 6,
    param4 = 10800,
    param5 = 0,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "血池"
    };
getRow(160)->
    #skill_effectCfg {
    iD = 160,
    effectType = 14,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 29,
    param2 = 2,
    param3 = 6,
    param4 = 10800,
    param5 = 0,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "旋风伤害载体"
    };
getRow(161)->
    #skill_effectCfg {
    iD = 161,
    effectType = 1,
    effectChance = 1,
    effectcondition = 1,
    effectTarget = 0,
    param1 = 97,
    param2 = 123,
    param3 = 1,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "冰环术冻结"
    };
getRow(162)->
    #skill_effectCfg {
    iD = 162,
    effectType = 14,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 30,
    param2 = 2,
    param3 = 6,
    param4 = 2300,
    param5 = 0,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "追踪炸弹"
    };
getRow(163)->
    #skill_effectCfg {
    iD = 163,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 98,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "吸收盾"
    };
getRow(164)->
    #skill_effectCfg {
    iD = 164,
    effectType = 19,
    effectChance = 1,
    effectcondition = 1,
    effectTarget = 0,
    param1 = 94,
    param2 = 122,
    param3 = 1,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "水爆术击晕"
    };
getRow(165)->
    #skill_effectCfg {
    iD = 165,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 99,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "狂化"
    };
getRow(166)->
    #skill_effectCfg {
    iD = 166,
    effectType = 12,
    effectChance = 1,
    effectcondition = 1,
    effectTarget = 0,
    param1 = -10,
    param2 = -0.05,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "吸血扣目标血"
    };
getRow(167)->
    #skill_effectCfg {
    iD = 167,
    effectType = 12,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 10,
    param2 = 0.001,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "吸血加自身血"
    };
getRow(168)->
    #skill_effectCfg {
    iD = 168,
    effectType = 19,
    effectChance = 1,
    effectcondition = 1,
    effectTarget = 0,
    param1 = 19,
    param2 = 122,
    param3 = 1,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "击晕目标"
    };
getRow(169)->
    #skill_effectCfg {
    iD = 169,
    effectType = 12,
    effectChance = 1,
    effectcondition = 1,
    effectTarget = 0,
    param1 = -10,
    param2 = -0.15,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "直接扣除25%+10生命值"
    };
getRow(170)->
    #skill_effectCfg {
    iD = 170,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 104,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "行云流水"
    };
getRow(171)->
    #skill_effectCfg {
    iD = 171,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 105,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "迅雷之势"
    };
getRow(172)->
    #skill_effectCfg {
    iD = 172,
    effectType = 17,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 105,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "迅雷之势移除buff"
    };
getRow(173)->
    #skill_effectCfg {
    iD = 173,
    effectType = 12,
    effectChance = 1,
    effectcondition = 1,
    effectTarget = 0,
    param1 = -10,
    param2 = -0.025,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "直接扣除2.5%+10生命值"
    };
getRow(174)->
    #skill_effectCfg {
    iD = 174,
    effectType = 12,
    effectChance = 1,
    effectcondition = 1,
    effectTarget = 0,
    param1 = 1,
    param2 = 0.01,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "直接+2.5%+1生命值"
    };
getRow(175)->
    #skill_effectCfg {
    iD = 175,
    effectType = 1,
    effectChance = 1,
    effectcondition = 1,
    effectTarget = 0,
    param1 = 106,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "击退不受控制1秒"
    };
getRow(176)->
    #skill_effectCfg {
    iD = 176,
    effectType = 14,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 31,
    param2 = 2,
    param3 = 6,
    param4 = 10800,
    param5 = 0,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "高级旋风伤害载体"
    };
getRow(177)->
    #skill_effectCfg {
    iD = 177,
    effectType = 14,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 32,
    param2 = 2,
    param3 = 6,
    param4 = 2300,
    param5 = 0,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "高级追踪炸弹"
    };
getRow(178)->
    #skill_effectCfg {
    iD = 178,
    effectType = 12,
    effectChance = 1,
    effectcondition = 1,
    effectTarget = 0,
    param1 = -10,
    param2 = -0.1,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "高级吸血扣目标血"
    };
getRow(179)->
    #skill_effectCfg {
    iD = 179,
    effectType = 12,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 10,
    param2 = 0.01,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "高级吸血加自身血"
    };
getRow(180)->
    #skill_effectCfg {
    iD = 180,
    effectType = 1,
    effectChance = 0.3,
    effectcondition = 1,
    effectTarget = 0,
    param1 = 110,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "怪物近战烧能量"
    };
getRow(181)->
    #skill_effectCfg {
    iD = 181,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 125,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "穷追猛打持续伤害"
    };
getRow(182)->
    #skill_effectCfg {
    iD = 182,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 126,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "被动闪避15%"
    };
getRow(183)->
    #skill_effectCfg {
    iD = 183,
    effectType = 14,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 33,
    param2 = 2,
    param3 = 6,
    param4 = 30800,
    param5 = 0,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "追踪炸弹2000型"
    };
getRow(184)->
    #skill_effectCfg {
    iD = 184,
    effectType = 19,
    effectChance = 0.25,
    effectcondition = 1,
    effectTarget = 0,
    param1 = 14,
    param2 = 123,
    param3 = 1,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "霜冻领域冻结"
    };
getRow(185)->
    #skill_effectCfg {
    iD = 185,
    effectType = 14,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 34,
    param2 = 0,
    param3 = 6,
    param4 = 8300,
    param5 = 0,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "霜冻领域载体"
    };
getRow(186)->
    #skill_effectCfg {
    iD = 186,
    effectType = 8,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 50008,
    param2 = 1,
    param3 = 20000,
    param4 = 1,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "召唤邪神"
    };
getRow(187)->
    #skill_effectCfg {
    iD = 187,
    effectType = 1,
    effectChance = 1,
    effectcondition = 1,
    effectTarget = 0,
    param1 = 128,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "死亡标记"
    };
getRow(188)->
    #skill_effectCfg {
    iD = 188,
    effectType = 1,
    effectChance = 1,
    effectcondition = 1,
    effectTarget = 0,
    param1 = 94,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "高级冲锋击晕"
    };
getRow(189)->
    #skill_effectCfg {
    iD = 189,
    effectType = 19,
    effectChance = 1,
    effectcondition = 1,
    effectTarget = 0,
    param1 = 129,
    param2 = 122,
    param3 = 1,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "普通冲锋击晕"
    };
getRow(190)->
    #skill_effectCfg {
    iD = 190,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 132,
    param2 = 201,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "神迹变身2"
    };
getRow(191)->
    #skill_effectCfg {
    iD = 191,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 133,
    param2 = 201,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "神迹变身3"
    };
getRow(192)->
    #skill_effectCfg {
    iD = 192,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 134,
    param2 = 201,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "神迹变身4"
    };
getRow(193)->
    #skill_effectCfg {
    iD = 193,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 135,
    param2 = 201,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "神迹变身5"
    };
getRow(194)->
    #skill_effectCfg {
    iD = 194,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 136,
    param2 = 201,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "御法者变身2"
    };
getRow(195)->
    #skill_effectCfg {
    iD = 195,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 137,
    param2 = 201,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "御法者变身3"
    };
getRow(196)->
    #skill_effectCfg {
    iD = 196,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 138,
    param2 = 201,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "御法者变身4"
    };
getRow(197)->
    #skill_effectCfg {
    iD = 197,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 139,
    param2 = 201,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "御法者变身5"
    };
getRow(198)->
    #skill_effectCfg {
    iD = 198,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 140,
    param2 = 201,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "死神变身2"
    };
getRow(199)->
    #skill_effectCfg {
    iD = 199,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 141,
    param2 = 201,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "死神变身3"
    };
getRow(200)->
    #skill_effectCfg {
    iD = 200,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 142,
    param2 = 201,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "死神变身4"
    };
getRow(201)->
    #skill_effectCfg {
    iD = 201,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 143,
    param2 = 201,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "死神变身5"
    };
getRow(202)->
    #skill_effectCfg {
    iD = 202,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 144,
    param2 = 201,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "影王变身2"
    };
getRow(203)->
    #skill_effectCfg {
    iD = 203,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 145,
    param2 = 201,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "影王变身3"
    };
getRow(204)->
    #skill_effectCfg {
    iD = 204,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 146,
    param2 = 201,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "影王变身4"
    };
getRow(205)->
    #skill_effectCfg {
    iD = 205,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 147,
    param2 = 201,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "影王变身5"
    };
getRow(206)->
    #skill_effectCfg {
    iD = 206,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 148,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "传奇击中提高攻速10%"
    };
getRow(207)->
    #skill_effectCfg {
    iD = 207,
    effectType = 14,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 35,
    param2 = 0,
    param3 = 6,
    param4 = 5800,
    param5 = 0,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "传奇击中自身火焰载体"
    };
getRow(208)->
    #skill_effectCfg {
    iD = 208,
    effectType = 1,
    effectChance = 1,
    effectcondition = 1,
    effectTarget = 0,
    param1 = 150,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "传奇持续物理伤害"
    };
getRow(209)->
    #skill_effectCfg {
    iD = 209,
    effectType = 1,
    effectChance = 1,
    effectcondition = 1,
    effectTarget = 0,
    param1 = 151,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "非冰寒减速"
    };
getRow(210)->
    #skill_effectCfg {
    iD = 210,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 156,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "传奇击中提高暴击10%"
    };
getRow(211)->
    #skill_effectCfg {
    iD = 211,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 157,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "传奇击中提高攻速15%"
    };
getRow(212)->
    #skill_effectCfg {
    iD = 212,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 158,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "传奇击中提高暴击15%"
    };
getRow(213)->
    #skill_effectCfg {
    iD = 213,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 159,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "被动招架10%"
    };
getRow(214)->
    #skill_effectCfg {
    iD = 214,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 160,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "被动格挡30%"
    };
getRow(215)->
    #skill_effectCfg {
    iD = 215,
    effectType = 1,
    effectChance = 1,
    effectcondition = 1,
    effectTarget = 0,
    param1 = 161,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "血腥爪击"
    };
getRow(216)->
    #skill_effectCfg {
    iD = 216,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 162,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "生命之种"
    };
getRow(217)->
    #skill_effectCfg {
    iD = 217,
    effectType = 1,
    effectChance = 1,
    effectcondition = 1,
    effectTarget = 0,
    param1 = 163,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "蛮力猛击"
    };
getRow(218)->
    #skill_effectCfg {
    iD = 218,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 164,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "洞悉弱点"
    };
getRow(219)->
    #skill_effectCfg {
    iD = 219,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 165,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "迅疾打击"
    };
getRow(220)->
    #skill_effectCfg {
    iD = 220,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 166,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "节能施法"
    };
getRow(221)->
    #skill_effectCfg {
    iD = 221,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 167,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "虚空调和"
    };
getRow(222)->
    #skill_effectCfg {
    iD = 222,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 168,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "自然之力"
    };
getRow(223)->
    #skill_effectCfg {
    iD = 223,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 169,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "原始坚韧"
    };
getRow(224)->
    #skill_effectCfg {
    iD = 224,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 170,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "野蛮防御"
    };
getRow(225)->
    #skill_effectCfg {
    iD = 225,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 171,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "狂乱"
    };
getRow(226)->
    #skill_effectCfg {
    iD = 226,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 172,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "锋利兽爪"
    };
getRow(227)->
    #skill_effectCfg {
    iD = 227,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 173,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "急奔"
    };
getRow(228)->
    #skill_effectCfg {
    iD = 228,
    effectType = 1,
    effectChance = 1,
    effectcondition = 1,
    effectTarget = 0,
    param1 = 5,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "割裂"
    };
getRow(229)->
    #skill_effectCfg {
    iD = 229,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 174,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "狂野怒火"
    };
getRow(230)->
    #skill_effectCfg {
    iD = 230,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 175,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "生存本能"
    };
getRow(231)->
    #skill_effectCfg {
    iD = 231,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 176,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "战争精英"
    };
getRow(232)->
    #skill_effectCfg {
    iD = 232,
    effectType = 1,
    effectChance = 1,
    effectcondition = 1,
    effectTarget = 0,
    param1 = 177,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "毁灭打击"
    };
getRow(233)->
    #skill_effectCfg {
    iD = 233,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 178,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "野性狂怒"
    };
getRow(234)->
    #skill_effectCfg {
    iD = 234,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 179,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "秘能恢复"
    };
getRow(235)->
    #skill_effectCfg {
    iD = 235,
    effectType = 1,
    effectChance = 1,
    effectcondition = 1,
    effectTarget = 0,
    param1 = 181,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "血腥爪击II"
    };
getRow(236)->
    #skill_effectCfg {
    iD = 236,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 182,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "生命之种"
    };
getRow(237)->
    #skill_effectCfg {
    iD = 237,
    effectType = 1,
    effectChance = 1,
    effectcondition = 1,
    effectTarget = 0,
    param1 = 183,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "蛮力猛击"
    };
getRow(238)->
    #skill_effectCfg {
    iD = 238,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 184,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "洞悉弱点"
    };
getRow(239)->
    #skill_effectCfg {
    iD = 239,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 185,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "迅疾打击"
    };
getRow(240)->
    #skill_effectCfg {
    iD = 240,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 186,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "节能施法"
    };
getRow(241)->
    #skill_effectCfg {
    iD = 241,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 187,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "虚空调和"
    };
getRow(242)->
    #skill_effectCfg {
    iD = 242,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 188,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "自然之力"
    };
getRow(243)->
    #skill_effectCfg {
    iD = 243,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 189,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "战争精英"
    };
getRow(244)->
    #skill_effectCfg {
    iD = 244,
    effectType = 1,
    effectChance = 1,
    effectcondition = 1,
    effectTarget = 0,
    param1 = 190,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "毁灭打击"
    };
getRow(245)->
    #skill_effectCfg {
    iD = 245,
    effectType = 1,
    effectChance = 1,
    effectcondition = 1,
    effectTarget = 0,
    param1 = 191,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "血腥爪击I"
    };
getRow(246)->
    #skill_effectCfg {
    iD = 246,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 192,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "生命之种"
    };
getRow(247)->
    #skill_effectCfg {
    iD = 247,
    effectType = 1,
    effectChance = 1,
    effectcondition = 1,
    effectTarget = 0,
    param1 = 193,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "蛮力猛击"
    };
getRow(248)->
    #skill_effectCfg {
    iD = 248,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 194,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "洞悉弱点"
    };
getRow(249)->
    #skill_effectCfg {
    iD = 249,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 195,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "迅疾打击"
    };
getRow(250)->
    #skill_effectCfg {
    iD = 250,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 196,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "节能施法"
    };
getRow(251)->
    #skill_effectCfg {
    iD = 251,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 197,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "虚空调和"
    };
getRow(252)->
    #skill_effectCfg {
    iD = 252,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 198,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "自然之力"
    };
getRow(253)->
    #skill_effectCfg {
    iD = 253,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 199,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "战争精英"
    };
getRow(254)->
    #skill_effectCfg {
    iD = 254,
    effectType = 1,
    effectChance = 1,
    effectcondition = 1,
    effectTarget = 0,
    param1 = 200,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "毁灭打击"
    };
getRow(255)->
    #skill_effectCfg {
    iD = 255,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 202,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "骑士祝福"
    };
getRow(256)->
    #skill_effectCfg {
    iD = 256,
    effectType = 16,
    effectChance = 1,
    effectcondition = 1,
    effectTarget = 1,
    param1 = 6,
    param2 = 1000,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "王者圣令冷却加速"
    };
getRow(257)->
    #skill_effectCfg {
    iD = 257,
    effectType = 16,
    effectChance = 1,
    effectcondition = 1,
    effectTarget = 1,
    param1 = 12,
    param2 = 1000,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "希望圣令冷却加速"
    };
getRow(258)->
    #skill_effectCfg {
    iD = 258,
    effectType = 14,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 37,
    param2 = 0,
    param3 = 6,
    param4 = 10800,
    param5 = 0,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "祝福伤害载体"
    };
getRow(259)->
    #skill_effectCfg {
    iD = 259,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 205,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "能量过载"
    };
getRow(260)->
    #skill_effectCfg {
    iD = 260,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 206,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "天才法师加速施法"
    };
getRow(261)->
    #skill_effectCfg {
    iD = 261,
    effectType = 14,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 3,
    param1 = 38,
    param2 = 2,
    param3 = 6,
    param4 = 6800,
    param5 = 0,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "黎明之锤载体"
    };
getRow(262)->
    #skill_effectCfg {
    iD = 262,
    effectType = 14,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 3,
    param1 = 39,
    param2 = 0,
    param3 = 6,
    param4 = 6800,
    param5 = 0,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "陨石术伤害载体"
    };
getRow(263)->
    #skill_effectCfg {
    iD = 263,
    effectType = 1,
    effectChance = 1,
    effectcondition = 1,
    effectTarget = 0,
    param1 = 223,
    param2 = 66,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "影袭"
    };
getRow(264)->
    #skill_effectCfg {
    iD = 264,
    effectType = 14,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 40,
    param2 = 0,
    param3 = 6,
    param4 = 6800,
    param5 = 0,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "亵渎之地载体"
    };
getRow(265)->
    #skill_effectCfg {
    iD = 265,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 224,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "致命武力"
    };
getRow(266)->
    #skill_effectCfg {
    iD = 266,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 225,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "绝对防御"
    };
getRow(267)->
    #skill_effectCfg {
    iD = 267,
    effectType = 5,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 0.5,
    param2 = 20,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "冲锋"
    };
getRow(268)->
    #skill_effectCfg {
    iD = 268,
    effectType = 18,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 1,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "攻击获得无双值"
    };
getRow(269)->
    #skill_effectCfg {
    iD = 269,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 229,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "降低速度"
    };
getRow(270)->
    #skill_effectCfg {
    iD = 270,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 230,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "点燃"
    };
getRow(271)->
    #skill_effectCfg {
    iD = 271,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 231,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "神器增强自身"
    };
getRow(272)->
    #skill_effectCfg {
    iD = 272,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 232,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "神器技能减疗"
    };
getRow(273)->
    #skill_effectCfg {
    iD = 273,
    effectType = 15,
    effectChance = 1,
    effectcondition = 1,
    effectTarget = 0,
    param1 = 9,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "米诺陶斯击退"
    };
getRow(274)->
    #skill_effectCfg {
    iD = 274,
    effectType = 19,
    effectChance = 1,
    effectcondition = 1,
    effectTarget = 0,
    param1 = 233,
    param2 = 122,
    param3 = 1,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "米诺陶斯眩晕"
    };
getRow(275)->
    #skill_effectCfg {
    iD = 275,
    effectType = 12,
    effectChance = 1,
    effectcondition = 1,
    effectTarget = 0,
    param1 = 0,
    param2 = -0.25,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "米诺陶斯扣除25%血量"
    };
getRow(276)->
    #skill_effectCfg {
    iD = 276,
    effectType = 14,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 41,
    param2 = 0,
    param3 = 6,
    param4 = 5000,
    param5 = 0,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "毒池伤害载体"
    };
getRow(277)->
    #skill_effectCfg {
    iD = 277,
    effectType = 1,
    effectChance = 1,
    effectcondition = 1,
    effectTarget = 0,
    param1 = 242,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "持续暗影伤害"
    };
getRow(278)->
    #skill_effectCfg {
    iD = 278,
    effectType = 14,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 32,
    param2 = 0,
    param3 = 6,
    param4 = 1800,
    param5 = 0,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "导弹伤害载体"
    };
getRow(279)->
    #skill_effectCfg {
    iD = 279,
    effectType = 1,
    effectChance = 1,
    effectcondition = 1,
    effectTarget = 0,
    param1 = 244,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "强化致命投掷"
    };
getRow(280)->
    #skill_effectCfg {
    iD = 280,
    effectType = 19,
    effectChance = 1,
    effectcondition = 1,
    effectTarget = 0,
    param1 = 204,
    param2 = 122,
    param3 = 1,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "击晕目标"
    };
getRow(281)->
    #skill_effectCfg {
    iD = 281,
    effectType = 19,
    effectChance = 1,
    effectcondition = 1,
    effectTarget = 0,
    param1 = 246,
    param2 = 123,
    param3 = 1,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "冰环术冻结2秒"
    };
getRow(282)->
    #skill_effectCfg {
    iD = 282,
    effectType = 1,
    effectChance = 1,
    effectcondition = 1,
    effectTarget = 0,
    param1 = 247,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "非冰寒减速"
    };
getRow(283)->
    #skill_effectCfg {
    iD = 283,
    effectType = 1,
    effectChance = 1,
    effectcondition = 1,
    effectTarget = 3,
    param1 = 248,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "火球灼烧"
    };
getRow(284)->
    #skill_effectCfg {
    iD = 284,
    effectType = 15,
    effectChance = 1,
    effectcondition = 1,
    effectTarget = 0,
    param1 = 2,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "神器技能击退"
    };
getRow(285)->
    #skill_effectCfg {
    iD = 285,
    effectType = 19,
    effectChance = 1,
    effectcondition = 1,
    effectTarget = 0,
    param1 = 252,
    param2 = 123,
    param3 = 1,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "金鱼粘液冰冻"
    };
getRow(286)->
    #skill_effectCfg {
    iD = 286,
    effectType = 19,
    effectChance = 1,
    effectcondition = 1,
    effectTarget = 0,
    param1 = 262,
    param2 = 122,
    param3 = 1,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "击晕目标2秒"
    };
getRow(287)->
    #skill_effectCfg {
    iD = 287,
    effectType = 19,
    effectChance = 1,
    effectcondition = 1,
    effectTarget = 0,
    param1 = 263,
    param2 = 122,
    param3 = 1,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "击晕目标3秒"
    };
getRow(288)->
    #skill_effectCfg {
    iD = 288,
    effectType = 19,
    effectChance = 1,
    effectcondition = 1,
    effectTarget = 0,
    param1 = 263,
    param2 = 122,
    param3 = 1,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "80%概率击晕目标3秒"
    };
getRow(289)->
    #skill_effectCfg {
    iD = 289,
    effectType = 15,
    effectChance = 1,
    effectcondition = 1,
    effectTarget = 0,
    param1 = 5,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "星际战神击退定身2秒"
    };
getRow(290)->
    #skill_effectCfg {
    iD = 290,
    effectType = 1,
    effectChance = 1,
    effectcondition = 1,
    effectTarget = 0,
    param1 = 290,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "星际战神击退不受控制0.5秒"
    };
getRow(291)->
    #skill_effectCfg {
    iD = 291,
    effectType = 19,
    effectChance = 1,
    effectcondition = 1,
    effectTarget = 0,
    param1 = 291,
    param2 = 122,
    param3 = 1,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "熊猫缴械3秒"
    };
getRow(292)->
    #skill_effectCfg {
    iD = 292,
    effectType = 19,
    effectChance = 1,
    effectcondition = 1,
    effectTarget = 0,
    param1 = 292,
    param2 = 123,
    param3 = 1,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "鲸鱼冻结3秒"
    };
getRow(293)->
    #skill_effectCfg {
    iD = 293,
    effectType = 1,
    effectChance = 1,
    effectcondition = 1,
    effectTarget = 0,
    param1 = 293,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "金龙变形术3秒"
    };
getRow(294)->
    #skill_effectCfg {
    iD = 294,
    effectType = 1,
    effectChance = 1,
    effectcondition = 1,
    effectTarget = 0,
    param1 = 294,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "军团团员眩晕1.5秒"
    };
getRow(295)->
    #skill_effectCfg {
    iD = 295,
    effectType = 1,
    effectChance = 1,
    effectcondition = 1,
    effectTarget = 0,
    param1 = 295,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "军团军团长缴械2秒"
    };
getRow(296)->
    #skill_effectCfg {
    iD = 296,
    effectType = 1,
    effectChance = 1,
    effectcondition = 1,
    effectTarget = 0,
    param1 = 296,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "远行兽眩晕1.5秒"
    };
getRow(297)->
    #skill_effectCfg {
    iD = 297,
    effectType = 1,
    effectChance = 1,
    effectcondition = 1,
    effectTarget = 0,
    param1 = 297,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "远行兽眩晕伤害抗性降低30%"
    };
getRow(300)->
    #skill_effectCfg {
    iD = 300,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 300,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "宠物自身生命上限+500"
    };
getRow(301)->
    #skill_effectCfg {
    iD = 301,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 301,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "宠物自身生命上限+3000"
    };
getRow(302)->
    #skill_effectCfg {
    iD = 302,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 302,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "宠物自身生命上限+6000"
    };
getRow(303)->
    #skill_effectCfg {
    iD = 303,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 303,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "宠物自身生命上限+12000"
    };
getRow(304)->
    #skill_effectCfg {
    iD = 304,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 304,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "宠物自身生命上限+24000"
    };
getRow(305)->
    #skill_effectCfg {
    iD = 305,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 305,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "宠物自身物理防御+35"
    };
getRow(306)->
    #skill_effectCfg {
    iD = 306,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 306,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "宠物自身物理防御+210"
    };
getRow(307)->
    #skill_effectCfg {
    iD = 307,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 307,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "宠物自身物理防御+420"
    };
getRow(308)->
    #skill_effectCfg {
    iD = 308,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 308,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "宠物自身物理防御+840"
    };
getRow(309)->
    #skill_effectCfg {
    iD = 309,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 309,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "宠物自身物理防御+1680"
    };
getRow(310)->
    #skill_effectCfg {
    iD = 310,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 310,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "宠物自身魔法防御+35"
    };
getRow(311)->
    #skill_effectCfg {
    iD = 311,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 311,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "宠物自身魔法防御+210"
    };
getRow(312)->
    #skill_effectCfg {
    iD = 312,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 312,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "宠物自身魔法防御+420"
    };
getRow(313)->
    #skill_effectCfg {
    iD = 313,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 313,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "宠物自身魔法防御+840"
    };
getRow(314)->
    #skill_effectCfg {
    iD = 314,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 314,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "宠物自身魔法防御+1680"
    };
getRow(315)->
    #skill_effectCfg {
    iD = 315,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 315,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "宠物自身神圣伤害+25"
    };
getRow(316)->
    #skill_effectCfg {
    iD = 316,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 316,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "宠物自身神圣伤害+150"
    };
getRow(317)->
    #skill_effectCfg {
    iD = 317,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 317,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "宠物自身神圣伤害+300"
    };
getRow(318)->
    #skill_effectCfg {
    iD = 318,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 318,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "宠物自身神圣伤害+600"
    };
getRow(319)->
    #skill_effectCfg {
    iD = 319,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 319,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "宠物自身神圣伤害+1200"
    };
getRow(320)->
    #skill_effectCfg {
    iD = 320,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 320,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "宠物自身物理伤害+25"
    };
getRow(321)->
    #skill_effectCfg {
    iD = 321,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 321,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "宠物自身物理伤害+150"
    };
getRow(322)->
    #skill_effectCfg {
    iD = 322,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 322,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "宠物自身物理伤害+300"
    };
getRow(323)->
    #skill_effectCfg {
    iD = 323,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 323,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "宠物自身物理伤害+600"
    };
getRow(324)->
    #skill_effectCfg {
    iD = 324,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 324,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "宠物自身物理伤害+1200"
    };
getRow(325)->
    #skill_effectCfg {
    iD = 325,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 325,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "宠物自身暗影伤害+25"
    };
getRow(326)->
    #skill_effectCfg {
    iD = 326,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 326,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "宠物自身暗影伤害+150"
    };
getRow(327)->
    #skill_effectCfg {
    iD = 327,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 327,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "宠物自身暗影伤害+300"
    };
getRow(328)->
    #skill_effectCfg {
    iD = 328,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 328,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "宠物自身暗影伤害+600"
    };
getRow(329)->
    #skill_effectCfg {
    iD = 329,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 329,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "宠物自身暗影伤害+1200"
    };
getRow(330)->
    #skill_effectCfg {
    iD = 330,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 330,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "宠物自身元素伤害+25"
    };
getRow(331)->
    #skill_effectCfg {
    iD = 331,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 331,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "宠物自身元素伤害+150"
    };
getRow(332)->
    #skill_effectCfg {
    iD = 332,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 332,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "宠物自身元素伤害+300"
    };
getRow(333)->
    #skill_effectCfg {
    iD = 333,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 333,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "宠物自身元素伤害+600"
    };
getRow(334)->
    #skill_effectCfg {
    iD = 334,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 334,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "宠物自身元素伤害+1200"
    };
getRow(335)->
    #skill_effectCfg {
    iD = 335,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 335,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "主人暴伤减免+0.02"
    };
getRow(336)->
    #skill_effectCfg {
    iD = 336,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 336,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "主人暴伤减免+0.14"
    };
getRow(337)->
    #skill_effectCfg {
    iD = 337,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 337,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "主人暴伤减免+0.36"
    };
getRow(338)->
    #skill_effectCfg {
    iD = 338,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 338,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "主人暴伤减免+0.68"
    };
getRow(339)->
    #skill_effectCfg {
    iD = 339,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 339,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "主人暴伤减免+1.1"
    };
getRow(340)->
    #skill_effectCfg {
    iD = 340,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 340,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "主人冰冻豁免+0.01"
    };
getRow(341)->
    #skill_effectCfg {
    iD = 341,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 341,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "主人冰冻豁免+0.06"
    };
getRow(342)->
    #skill_effectCfg {
    iD = 342,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 342,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "主人冰冻豁免+0.11"
    };
getRow(343)->
    #skill_effectCfg {
    iD = 343,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 343,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "主人冰冻豁免+0.16"
    };
getRow(344)->
    #skill_effectCfg {
    iD = 344,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 344,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "主人冰冻豁免+0.21"
    };
getRow(345)->
    #skill_effectCfg {
    iD = 345,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 345,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "主人减速豁免+0.01"
    };
getRow(346)->
    #skill_effectCfg {
    iD = 346,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 346,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "主人减速豁免+0.06"
    };
getRow(347)->
    #skill_effectCfg {
    iD = 347,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 347,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "主人减速豁免+0.11"
    };
getRow(348)->
    #skill_effectCfg {
    iD = 348,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 348,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "主人减速豁免+0.16"
    };
getRow(349)->
    #skill_effectCfg {
    iD = 349,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 349,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "主人减速豁免+0.21"
    };
getRow(350)->
    #skill_effectCfg {
    iD = 350,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 350,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "主人眩晕豁免+0.01"
    };
getRow(351)->
    #skill_effectCfg {
    iD = 351,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 351,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "主人眩晕豁免+0.06"
    };
getRow(352)->
    #skill_effectCfg {
    iD = 352,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 352,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "主人眩晕豁免+0.11"
    };
getRow(353)->
    #skill_effectCfg {
    iD = 353,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 353,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "主人眩晕豁免+0.16"
    };
getRow(354)->
    #skill_effectCfg {
    iD = 354,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 354,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "主人眩晕豁免+0.21"
    };
getRow(355)->
    #skill_effectCfg {
    iD = 355,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 355,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "主人暴击豁免+0.01"
    };
getRow(356)->
    #skill_effectCfg {
    iD = 356,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 356,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "主人暴击豁免+0.06"
    };
getRow(357)->
    #skill_effectCfg {
    iD = 357,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 357,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "主人暴击豁免+0.11"
    };
getRow(358)->
    #skill_effectCfg {
    iD = 358,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 358,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "主人暴击豁免+0.16"
    };
getRow(359)->
    #skill_effectCfg {
    iD = 359,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 359,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "主人暴击豁免+0.21"
    };
getRow(360)->
    #skill_effectCfg {
    iD = 360,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 360,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "主人控制豁免2秒 （翅膀）"
    };
getRow(400)->
    #skill_effectCfg {
    iD = 400,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 400,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "远行兽增加主人攻击"
    };
getRow(501)->
    #skill_effectCfg {
    iD = 501,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 1200,
    param2 = 10,
    param3 = 0,
    param4 = 10,
    param5 = 10,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "史莱姆秘境 13级1号史莱姆"
    };
getRow(502)->
    #skill_effectCfg {
    iD = 502,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 1201,
    param2 = 10,
    param3 = 0,
    param4 = 10,
    param5 = 10,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "史莱姆秘境 20级1号史莱姆"
    };
getRow(503)->
    #skill_effectCfg {
    iD = 503,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 1202,
    param2 = 10,
    param3 = 0,
    param4 = 10,
    param5 = 0,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "史莱姆秘境 20级2号史莱姆"
    };
getRow(504)->
    #skill_effectCfg {
    iD = 504,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 1203,
    param2 = 10,
    param3 = 0,
    param4 = 10,
    param5 = 10,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "史莱姆秘境 29级1号史莱姆"
    };
getRow(505)->
    #skill_effectCfg {
    iD = 505,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 1204,
    param2 = 10,
    param3 = 0,
    param4 = 10,
    param5 = 0,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "史莱姆秘境 29级2号史莱姆"
    };
getRow(506)->
    #skill_effectCfg {
    iD = 506,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 1205,
    param2 = 10,
    param3 = 0,
    param4 = 0,
    param5 = 10,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "史莱姆秘境 29级3号史莱姆"
    };
getRow(507)->
    #skill_effectCfg {
    iD = 507,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 1206,
    param2 = 10,
    param3 = 0,
    param4 = 10,
    param5 = 10,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "史莱姆秘境 36级1号史莱姆"
    };
getRow(508)->
    #skill_effectCfg {
    iD = 508,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 1207,
    param2 = 10,
    param3 = 0,
    param4 = 10,
    param5 = 0,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "史莱姆秘境 36级2号史莱姆"
    };
getRow(509)->
    #skill_effectCfg {
    iD = 509,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 1208,
    param2 = 10,
    param3 = 0,
    param4 = 0,
    param5 = 10,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "史莱姆秘境 36级3号史莱姆"
    };
getRow(510)->
    #skill_effectCfg {
    iD = 510,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 1209,
    param2 = 10,
    param3 = 0,
    param4 = -10,
    param5 = 10,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "史莱姆秘境 36级4号史莱姆"
    };
getRow(511)->
    #skill_effectCfg {
    iD = 511,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 1210,
    param2 = 10,
    param3 = 0,
    param4 = 10,
    param5 = 10,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "史莱姆秘境 42级1号史莱姆"
    };
getRow(512)->
    #skill_effectCfg {
    iD = 512,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 1211,
    param2 = 10,
    param3 = 0,
    param4 = 10,
    param5 = 0,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "史莱姆秘境 42级2号史莱姆"
    };
getRow(513)->
    #skill_effectCfg {
    iD = 513,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 1212,
    param2 = 10,
    param3 = 0,
    param4 = 0,
    param5 = 10,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "史莱姆秘境 42级3号史莱姆"
    };
getRow(514)->
    #skill_effectCfg {
    iD = 514,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 1213,
    param2 = 10,
    param3 = 0,
    param4 = -10,
    param5 = 10,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "史莱姆秘境 42级4号史莱姆"
    };
getRow(515)->
    #skill_effectCfg {
    iD = 515,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 1214,
    param2 = 10,
    param3 = 0,
    param4 = 10,
    param5 = -10,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "史莱姆秘境 42级5号史莱姆"
    };
getRow(516)->
    #skill_effectCfg {
    iD = 516,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 1215,
    param2 = 10,
    param3 = 0,
    param4 = 10,
    param5 = 10,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "史莱姆秘境 48级1号史莱姆"
    };
getRow(517)->
    #skill_effectCfg {
    iD = 517,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 1216,
    param2 = 10,
    param3 = 0,
    param4 = 10,
    param5 = 0,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "史莱姆秘境 48级2号史莱姆"
    };
getRow(518)->
    #skill_effectCfg {
    iD = 518,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 1217,
    param2 = 10,
    param3 = 0,
    param4 = 0,
    param5 = 10,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "史莱姆秘境 48级3号史莱姆"
    };
getRow(519)->
    #skill_effectCfg {
    iD = 519,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 1218,
    param2 = 10,
    param3 = 0,
    param4 = -10,
    param5 = 10,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "史莱姆秘境 48级4号史莱姆"
    };
getRow(520)->
    #skill_effectCfg {
    iD = 520,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 1219,
    param2 = 10,
    param3 = 0,
    param4 = 10,
    param5 = -10,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "史莱姆秘境 48级5号史莱姆"
    };
getRow(521)->
    #skill_effectCfg {
    iD = 521,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 1220,
    param2 = 10,
    param3 = 0,
    param4 = -10,
    param5 = -10,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "史莱姆秘境 48级6号史莱姆"
    };
getRow(522)->
    #skill_effectCfg {
    iD = 522,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 453,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "史莱姆秘境 1号无敌"
    };
getRow(523)->
    #skill_effectCfg {
    iD = 523,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 454,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "史莱姆秘境 2号无敌"
    };
getRow(524)->
    #skill_effectCfg {
    iD = 524,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 455,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "史莱姆秘境 3号无敌"
    };
getRow(525)->
    #skill_effectCfg {
    iD = 525,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 456,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "史莱姆秘境 4号无敌"
    };
getRow(526)->
    #skill_effectCfg {
    iD = 526,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 457,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "史莱姆秘境 5号无敌"
    };
getRow(527)->
    #skill_effectCfg {
    iD = 527,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 458,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "史莱姆秘境 6号无敌"
    };
getRow(528)->
    #skill_effectCfg {
    iD = 528,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 459,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "小史莱姆 1号无敌"
    };
getRow(529)->
    #skill_effectCfg {
    iD = 529,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 460,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "小史莱姆 2号无敌"
    };
getRow(530)->
    #skill_effectCfg {
    iD = 530,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 461,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "小史莱姆 3号无敌"
    };
getRow(531)->
    #skill_effectCfg {
    iD = 531,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 462,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "小史莱姆 4号无敌"
    };
getRow(532)->
    #skill_effectCfg {
    iD = 532,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 463,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "小史莱姆 5号无敌"
    };
getRow(533)->
    #skill_effectCfg {
    iD = 533,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 464,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "小史莱姆 6号无敌"
    };
getRow(534)->
    #skill_effectCfg {
    iD = 534,
    effectType = 17,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 459,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "破小史莱姆 1号无敌"
    };
getRow(535)->
    #skill_effectCfg {
    iD = 535,
    effectType = 17,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 460,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "破小史莱姆 2号无敌"
    };
getRow(536)->
    #skill_effectCfg {
    iD = 536,
    effectType = 17,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 461,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "破小史莱姆 3号无敌"
    };
getRow(537)->
    #skill_effectCfg {
    iD = 537,
    effectType = 17,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 462,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "破小史莱姆 4号无敌"
    };
getRow(538)->
    #skill_effectCfg {
    iD = 538,
    effectType = 17,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 463,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "破小史莱姆 5号无敌"
    };
getRow(539)->
    #skill_effectCfg {
    iD = 539,
    effectType = 17,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 464,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "破小史莱姆 6号无敌"
    };
getRow(540)->
    #skill_effectCfg {
    iD = 540,
    effectType = 17,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 465,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "移除破小史莱姆 1号无敌"
    };
getRow(541)->
    #skill_effectCfg {
    iD = 541,
    effectType = 17,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 466,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "移除破小史莱姆 2号无敌"
    };
getRow(542)->
    #skill_effectCfg {
    iD = 542,
    effectType = 17,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 467,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "移除破小史莱姆 3号无敌"
    };
getRow(543)->
    #skill_effectCfg {
    iD = 543,
    effectType = 17,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 468,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "移除破小史莱姆 4号无敌"
    };
getRow(544)->
    #skill_effectCfg {
    iD = 544,
    effectType = 17,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 469,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "移除破小史莱姆 5号无敌"
    };
getRow(545)->
    #skill_effectCfg {
    iD = 545,
    effectType = 17,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 470,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "移除破小史莱姆 6号无敌"
    };
getRow(2001)->
    #skill_effectCfg {
    iD = 2001,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 2009,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "冰封之剑破甲机率触发持续掉血效果"
    };
getRow(2002)->
    #skill_effectCfg {
    iD = 2002,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 2010,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "大逃殺掉血效果"
    };
getRow(2003)->
    #skill_effectCfg {
    iD = 2003,
    effectType = 17,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 2010,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "解除持续掉血效果"
    };
getRow(2500)->
    #skill_effectCfg {
    iD = 2500,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 2500,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "血量公告98%"
    };
getRow(2501)->
    #skill_effectCfg {
    iD = 2501,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 2501,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "血量公告96%"
    };
getRow(2502)->
    #skill_effectCfg {
    iD = 2502,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 2502,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "血量公告94%"
    };
getRow(2503)->
    #skill_effectCfg {
    iD = 2503,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 2503,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "血量公告92%"
    };
getRow(2504)->
    #skill_effectCfg {
    iD = 2504,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 2504,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "血量公告90%"
    };
getRow(2505)->
    #skill_effectCfg {
    iD = 2505,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 2505,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "血量公告88%"
    };
getRow(2506)->
    #skill_effectCfg {
    iD = 2506,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 2506,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "血量公告86%"
    };
getRow(2507)->
    #skill_effectCfg {
    iD = 2507,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 2507,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "血量公告84%"
    };
getRow(2508)->
    #skill_effectCfg {
    iD = 2508,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 2508,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "血量公告82%"
    };
getRow(2509)->
    #skill_effectCfg {
    iD = 2509,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 2509,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "血量公告80%"
    };
getRow(2510)->
    #skill_effectCfg {
    iD = 2510,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 2510,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "血量公告78%"
    };
getRow(2511)->
    #skill_effectCfg {
    iD = 2511,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 2511,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "血量公告76%"
    };
getRow(2512)->
    #skill_effectCfg {
    iD = 2512,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 2512,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "血量公告74%"
    };
getRow(2513)->
    #skill_effectCfg {
    iD = 2513,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 2513,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "血量公告72%"
    };
getRow(2514)->
    #skill_effectCfg {
    iD = 2514,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 2514,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "血量公告70%"
    };
getRow(2515)->
    #skill_effectCfg {
    iD = 2515,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 2515,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "血量公告68%"
    };
getRow(2516)->
    #skill_effectCfg {
    iD = 2516,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 2516,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "血量公告66%"
    };
getRow(2517)->
    #skill_effectCfg {
    iD = 2517,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 2517,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "血量公告64%"
    };
getRow(2518)->
    #skill_effectCfg {
    iD = 2518,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 2518,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "血量公告62%"
    };
getRow(2519)->
    #skill_effectCfg {
    iD = 2519,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 2519,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "血量公告60%"
    };
getRow(2520)->
    #skill_effectCfg {
    iD = 2520,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 2520,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "血量公告58%"
    };
getRow(2521)->
    #skill_effectCfg {
    iD = 2521,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 2521,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "血量公告56%"
    };
getRow(2522)->
    #skill_effectCfg {
    iD = 2522,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 2522,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "血量公告54%"
    };
getRow(2523)->
    #skill_effectCfg {
    iD = 2523,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 2523,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "血量公告52%"
    };
getRow(2524)->
    #skill_effectCfg {
    iD = 2524,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 2524,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "血量公告50%"
    };
getRow(2525)->
    #skill_effectCfg {
    iD = 2525,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 2525,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "血量公告48%"
    };
getRow(2526)->
    #skill_effectCfg {
    iD = 2526,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 2526,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "血量公告46%"
    };
getRow(2527)->
    #skill_effectCfg {
    iD = 2527,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 2527,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "血量公告44%"
    };
getRow(2528)->
    #skill_effectCfg {
    iD = 2528,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 2528,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "血量公告42%"
    };
getRow(2529)->
    #skill_effectCfg {
    iD = 2529,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 2529,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "血量公告40%"
    };
getRow(2530)->
    #skill_effectCfg {
    iD = 2530,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 2530,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "血量公告38%"
    };
getRow(2531)->
    #skill_effectCfg {
    iD = 2531,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 2531,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "血量公告36%"
    };
getRow(2532)->
    #skill_effectCfg {
    iD = 2532,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 2532,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "血量公告34%"
    };
getRow(2533)->
    #skill_effectCfg {
    iD = 2533,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 2533,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "血量公告32%"
    };
getRow(2534)->
    #skill_effectCfg {
    iD = 2534,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 2534,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "血量公告30%"
    };
getRow(2535)->
    #skill_effectCfg {
    iD = 2535,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 2535,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "血量公告28%"
    };
getRow(2536)->
    #skill_effectCfg {
    iD = 2536,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 2536,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "血量公告26%"
    };
getRow(2537)->
    #skill_effectCfg {
    iD = 2537,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 2537,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "血量公告24%"
    };
getRow(2538)->
    #skill_effectCfg {
    iD = 2538,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 2538,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "血量公告22%"
    };
getRow(2539)->
    #skill_effectCfg {
    iD = 2539,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 2539,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "血量公告20%"
    };
getRow(2540)->
    #skill_effectCfg {
    iD = 2540,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 2540,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "血量公告18%"
    };
getRow(2541)->
    #skill_effectCfg {
    iD = 2541,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 2541,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "血量公告16%"
    };
getRow(2542)->
    #skill_effectCfg {
    iD = 2542,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 2542,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "血量公告14%"
    };
getRow(2543)->
    #skill_effectCfg {
    iD = 2543,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 2543,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "血量公告12%"
    };
getRow(2544)->
    #skill_effectCfg {
    iD = 2544,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 2544,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "血量公告10%"
    };
getRow(2545)->
    #skill_effectCfg {
    iD = 2545,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 2545,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "血量公告8%"
    };
getRow(2546)->
    #skill_effectCfg {
    iD = 2546,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 2546,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "血量公告6%"
    };
getRow(2547)->
    #skill_effectCfg {
    iD = 2547,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 2547,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "血量公告4%"
    };
getRow(2548)->
    #skill_effectCfg {
    iD = 2548,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 2548,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "血量公告2%"
    };
getRow(3201)->
    #skill_effectCfg {
    iD = 3201,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 3201,
    param2 = 201,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "裁决者变身2"
    };
getRow(3202)->
    #skill_effectCfg {
    iD = 3202,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 3202,
    param2 = 201,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "裁决者变身3"
    };
getRow(3203)->
    #skill_effectCfg {
    iD = 3203,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 3203,
    param2 = 201,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "裁决者变身4"
    };
getRow(3204)->
    #skill_effectCfg {
    iD = 3204,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 3204,
    param2 = 201,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "裁决者变身5"
    };
getRow(3300)->
    #skill_effectCfg {
    iD = 3300,
    effectType = 14,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 42,
    param2 = 0,
    param3 = 6,
    param4 = 8300,
    param5 = 0,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "烈焰领域载体"
    };
getRow(3301)->
    #skill_effectCfg {
    iD = 3301,
    effectType = 1,
    effectChance = 1,
    effectcondition = 1,
    effectTarget = 0,
    param1 = 3301,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "烈焰领域降低伤害"
    };
getRow(3302)->
    #skill_effectCfg {
    iD = 3302,
    effectType = 19,
    effectChance = 1,
    effectcondition = 1,
    effectTarget = 0,
    param1 = 3302,
    param2 = 122,
    param3 = 0.25,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "烈焰领域冻结"
    };
getRow(3505)->
    #skill_effectCfg {
    iD = 3505,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 3505,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "战神之力I"
    };
getRow(3506)->
    #skill_effectCfg {
    iD = 3506,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 3506,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "战神之力II"
    };
getRow(3507)->
    #skill_effectCfg {
    iD = 3507,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 3507,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "战神之力III"
    };
getRow(3508)->
    #skill_effectCfg {
    iD = 3508,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 3508,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "战神之力IV"
    };
getRow(3509)->
    #skill_effectCfg {
    iD = 3509,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 3509,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "战神之力V"
    };
getRow(3510)->
    #skill_effectCfg {
    iD = 3510,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 3510,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "战神之力VI"
    };
getRow(3511)->
    #skill_effectCfg {
    iD = 3511,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 3511,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "战神之力VII"
    };
getRow(3512)->
    #skill_effectCfg {
    iD = 3512,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 3512,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "战神之力VIII"
    };
getRow(3513)->
    #skill_effectCfg {
    iD = 3513,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 3513,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "战神之力IX"
    };
getRow(3514)->
    #skill_effectCfg {
    iD = 3514,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 3514,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "战神之力X"
    };
getRow(3515)->
    #skill_effectCfg {
    iD = 3515,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 3515,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "生命之力I"
    };
getRow(3516)->
    #skill_effectCfg {
    iD = 3516,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 3516,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "生命之力II"
    };
getRow(3517)->
    #skill_effectCfg {
    iD = 3517,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 3517,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "生命之力III"
    };
getRow(3518)->
    #skill_effectCfg {
    iD = 3518,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 3518,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "生命之力IV"
    };
getRow(3519)->
    #skill_effectCfg {
    iD = 3519,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 3519,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "生命之力V"
    };
getRow(3520)->
    #skill_effectCfg {
    iD = 3520,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 3520,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "生命之力VI"
    };
getRow(3521)->
    #skill_effectCfg {
    iD = 3521,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 3521,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "生命之力VII"
    };
getRow(3522)->
    #skill_effectCfg {
    iD = 3522,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 3522,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "生命之力VIII"
    };
getRow(3523)->
    #skill_effectCfg {
    iD = 3523,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 3523,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "生命之力IX"
    };
getRow(3524)->
    #skill_effectCfg {
    iD = 3524,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 3524,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "生命之力X"
    };
getRow(3525)->
    #skill_effectCfg {
    iD = 3525,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 3525,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "坚韧之力I"
    };
getRow(3526)->
    #skill_effectCfg {
    iD = 3526,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 3526,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "坚韧之力II"
    };
getRow(3527)->
    #skill_effectCfg {
    iD = 3527,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 3527,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "坚韧之力III"
    };
getRow(3528)->
    #skill_effectCfg {
    iD = 3528,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 3528,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "坚韧之力IV"
    };
getRow(3529)->
    #skill_effectCfg {
    iD = 3529,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 3529,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "坚韧之力V"
    };
getRow(3530)->
    #skill_effectCfg {
    iD = 3530,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 3530,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "坚韧之力VI"
    };
getRow(3531)->
    #skill_effectCfg {
    iD = 3531,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 3531,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "坚韧之力VII"
    };
getRow(3532)->
    #skill_effectCfg {
    iD = 3532,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 3532,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "坚韧之力VIII"
    };
getRow(3533)->
    #skill_effectCfg {
    iD = 3533,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 3533,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "坚韧之力IX"
    };
getRow(3534)->
    #skill_effectCfg {
    iD = 3534,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 3534,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "坚韧之力X"
    };
getRow(4022)->
    #skill_effectCfg {
    iD = 4022,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 65001,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "无敌领域给予无敌效果"
    };
getRow(5001)->
    #skill_effectCfg {
    iD = 5001,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 4203,
    param2 = 5,
    param3 = 30000,
    param4 = 0,
    param5 = 0,
    param6 = 1,
    param7 = 15,
    param8 = 0,
    param9 = 0,
    skillName = "普通贪念寺院鲜血的霸王墓碑"
    };
getRow(5002)->
    #skill_effectCfg {
    iD = 5002,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 4223,
    param2 = 5,
    param3 = 30000,
    param4 = 0,
    param5 = 0,
    param6 = 1,
    param7 = 15,
    param8 = 0,
    param9 = 0,
    skillName = "困难贪念寺院鲜血的霸王墓碑"
    };
getRow(5003)->
    #skill_effectCfg {
    iD = 5003,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 4243,
    param2 = 5,
    param3 = 30000,
    param4 = 0,
    param5 = 0,
    param6 = 1,
    param7 = 15,
    param8 = 0,
    param9 = 0,
    skillName = "噩梦贪念寺院鲜血的霸王墓碑"
    };
getRow(5004)->
    #skill_effectCfg {
    iD = 5004,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 4803,
    param2 = 5,
    param3 = 30000,
    param4 = 0,
    param5 = 0,
    param6 = 1,
    param7 = 15,
    param8 = 0,
    param9 = 0,
    skillName = "地狱1星贪念寺院鲜血的霸王墓碑"
    };
getRow(5005)->
    #skill_effectCfg {
    iD = 5005,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 4823,
    param2 = 5,
    param3 = 30000,
    param4 = 0,
    param5 = 0,
    param6 = 1,
    param7 = 15,
    param8 = 0,
    param9 = 0,
    skillName = "地狱2星贪念寺院鲜血的霸王墓碑"
    };
getRow(5006)->
    #skill_effectCfg {
    iD = 5006,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 4843,
    param2 = 5,
    param3 = 30000,
    param4 = 0,
    param5 = 0,
    param6 = 1,
    param7 = 15,
    param8 = 0,
    param9 = 0,
    skillName = "地狱3星贪念寺院鲜血的霸王墓碑"
    };
getRow(5007)->
    #skill_effectCfg {
    iD = 5007,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 4863,
    param2 = 5,
    param3 = 30000,
    param4 = 0,
    param5 = 0,
    param6 = 1,
    param7 = 15,
    param8 = 0,
    param9 = 0,
    skillName = "地狱4星贪念寺院鲜血的霸王墓碑"
    };
getRow(5008)->
    #skill_effectCfg {
    iD = 5008,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 4883,
    param2 = 5,
    param3 = 30000,
    param4 = 0,
    param5 = 0,
    param6 = 1,
    param7 = 15,
    param8 = 0,
    param9 = 0,
    skillName = "地狱5星贪念寺院鲜血的霸王墓碑"
    };
getRow(5009)->
    #skill_effectCfg {
    iD = 5009,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 4903,
    param2 = 5,
    param3 = 30000,
    param4 = 0,
    param5 = 0,
    param6 = 1,
    param7 = 15,
    param8 = 0,
    param9 = 0,
    skillName = "地狱6星贪念寺院鲜血的霸王墓碑"
    };
getRow(5010)->
    #skill_effectCfg {
    iD = 5010,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 4923,
    param2 = 5,
    param3 = 30000,
    param4 = 0,
    param5 = 0,
    param6 = 1,
    param7 = 15,
    param8 = 0,
    param9 = 0,
    skillName = "地狱7星贪念寺院鲜血的霸王墓碑"
    };
getRow(5011)->
    #skill_effectCfg {
    iD = 5011,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 4943,
    param2 = 5,
    param3 = 30000,
    param4 = 0,
    param5 = 0,
    param6 = 1,
    param7 = 15,
    param8 = 0,
    param9 = 0,
    skillName = "地狱8星贪念寺院鲜血的霸王墓碑"
    };
getRow(5012)->
    #skill_effectCfg {
    iD = 5012,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 4963,
    param2 = 5,
    param3 = 30000,
    param4 = 0,
    param5 = 0,
    param6 = 1,
    param7 = 15,
    param8 = 0,
    param9 = 0,
    skillName = "地狱9星贪念寺院鲜血的霸王墓碑"
    };
getRow(5013)->
    #skill_effectCfg {
    iD = 5013,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 4983,
    param2 = 5,
    param3 = 30000,
    param4 = 0,
    param5 = 0,
    param6 = 1,
    param7 = 15,
    param8 = 0,
    param9 = 0,
    skillName = "地狱10星贪念寺院鲜血的霸王墓碑"
    };
getRow(5014)->
    #skill_effectCfg {
    iD = 5014,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 4204,
    param2 = 5,
    param3 = 30000,
    param4 = 0,
    param5 = 0,
    param6 = 1,
    param7 = 15,
    param8 = 0,
    param9 = 0,
    skillName = "普通贪念寺院鲜血的霸王墓碑"
    };
getRow(5015)->
    #skill_effectCfg {
    iD = 5015,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 4224,
    param2 = 5,
    param3 = 30000,
    param4 = 0,
    param5 = 0,
    param6 = 1,
    param7 = 15,
    param8 = 0,
    param9 = 0,
    skillName = "困难贪念寺院鲜血的霸王墓碑"
    };
getRow(5016)->
    #skill_effectCfg {
    iD = 5016,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 4244,
    param2 = 5,
    param3 = 30000,
    param4 = 0,
    param5 = 0,
    param6 = 1,
    param7 = 15,
    param8 = 0,
    param9 = 0,
    skillName = "噩梦贪念寺院鲜血的霸王墓碑"
    };
getRow(5017)->
    #skill_effectCfg {
    iD = 5017,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 4804,
    param2 = 5,
    param3 = 30000,
    param4 = 0,
    param5 = 0,
    param6 = 1,
    param7 = 15,
    param8 = 0,
    param9 = 0,
    skillName = "地狱1星贪念寺院鲜血的霸王墓碑"
    };
getRow(5018)->
    #skill_effectCfg {
    iD = 5018,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 4824,
    param2 = 5,
    param3 = 30000,
    param4 = 0,
    param5 = 0,
    param6 = 1,
    param7 = 15,
    param8 = 0,
    param9 = 0,
    skillName = "地狱2星贪念寺院鲜血的霸王墓碑"
    };
getRow(5019)->
    #skill_effectCfg {
    iD = 5019,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 4844,
    param2 = 5,
    param3 = 30000,
    param4 = 0,
    param5 = 0,
    param6 = 1,
    param7 = 15,
    param8 = 0,
    param9 = 0,
    skillName = "地狱3星贪念寺院鲜血的霸王墓碑"
    };
getRow(5020)->
    #skill_effectCfg {
    iD = 5020,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 4864,
    param2 = 5,
    param3 = 30000,
    param4 = 0,
    param5 = 0,
    param6 = 1,
    param7 = 15,
    param8 = 0,
    param9 = 0,
    skillName = "地狱4星贪念寺院鲜血的霸王墓碑"
    };
getRow(5021)->
    #skill_effectCfg {
    iD = 5021,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 4884,
    param2 = 5,
    param3 = 30000,
    param4 = 0,
    param5 = 0,
    param6 = 1,
    param7 = 15,
    param8 = 0,
    param9 = 0,
    skillName = "地狱5星贪念寺院鲜血的霸王墓碑"
    };
getRow(5022)->
    #skill_effectCfg {
    iD = 5022,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 4904,
    param2 = 5,
    param3 = 30000,
    param4 = 0,
    param5 = 0,
    param6 = 1,
    param7 = 15,
    param8 = 0,
    param9 = 0,
    skillName = "地狱6星贪念寺院鲜血的霸王墓碑"
    };
getRow(5023)->
    #skill_effectCfg {
    iD = 5023,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 4924,
    param2 = 5,
    param3 = 30000,
    param4 = 0,
    param5 = 0,
    param6 = 1,
    param7 = 15,
    param8 = 0,
    param9 = 0,
    skillName = "地狱7星贪念寺院鲜血的霸王墓碑"
    };
getRow(5024)->
    #skill_effectCfg {
    iD = 5024,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 4944,
    param2 = 5,
    param3 = 30000,
    param4 = 0,
    param5 = 0,
    param6 = 1,
    param7 = 15,
    param8 = 0,
    param9 = 0,
    skillName = "地狱8星贪念寺院鲜血的霸王墓碑"
    };
getRow(5025)->
    #skill_effectCfg {
    iD = 5025,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 4964,
    param2 = 5,
    param3 = 30000,
    param4 = 0,
    param5 = 0,
    param6 = 1,
    param7 = 15,
    param8 = 0,
    param9 = 0,
    skillName = "地狱9星贪念寺院鲜血的霸王墓碑"
    };
getRow(5026)->
    #skill_effectCfg {
    iD = 5026,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 4984,
    param2 = 5,
    param3 = 30000,
    param4 = 0,
    param5 = 0,
    param6 = 1,
    param7 = 15,
    param8 = 0,
    param9 = 0,
    skillName = "地狱10星贪念寺院鲜血的霸王墓碑"
    };
getRow(5027)->
    #skill_effectCfg {
    iD = 5027,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 4203,
    param2 = 2,
    param3 = 30000,
    param4 = 0,
    param5 = 0,
    param6 = 2,
    param7 = 15,
    param8 = 0,
    param9 = 0,
    skillName = "普通贪念寺院鲜血的霸王墓碑"
    };
getRow(5028)->
    #skill_effectCfg {
    iD = 5028,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 4223,
    param2 = 2,
    param3 = 30000,
    param4 = 0,
    param5 = 0,
    param6 = 2,
    param7 = 15,
    param8 = 0,
    param9 = 0,
    skillName = "困难贪念寺院鲜血的霸王墓碑"
    };
getRow(5029)->
    #skill_effectCfg {
    iD = 5029,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 4243,
    param2 = 2,
    param3 = 30000,
    param4 = 0,
    param5 = 0,
    param6 = 2,
    param7 = 15,
    param8 = 0,
    param9 = 0,
    skillName = "噩梦贪念寺院鲜血的霸王墓碑"
    };
getRow(5030)->
    #skill_effectCfg {
    iD = 5030,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 4803,
    param2 = 2,
    param3 = 30000,
    param4 = 0,
    param5 = 0,
    param6 = 2,
    param7 = 15,
    param8 = 0,
    param9 = 0,
    skillName = "地狱1星贪念寺院鲜血的霸王墓碑"
    };
getRow(5031)->
    #skill_effectCfg {
    iD = 5031,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 4823,
    param2 = 2,
    param3 = 30000,
    param4 = 0,
    param5 = 0,
    param6 = 2,
    param7 = 15,
    param8 = 0,
    param9 = 0,
    skillName = "地狱2星贪念寺院鲜血的霸王墓碑"
    };
getRow(5032)->
    #skill_effectCfg {
    iD = 5032,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 4843,
    param2 = 2,
    param3 = 30000,
    param4 = 0,
    param5 = 0,
    param6 = 2,
    param7 = 15,
    param8 = 0,
    param9 = 0,
    skillName = "地狱3星贪念寺院鲜血的霸王墓碑"
    };
getRow(5033)->
    #skill_effectCfg {
    iD = 5033,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 4863,
    param2 = 2,
    param3 = 30000,
    param4 = 0,
    param5 = 0,
    param6 = 2,
    param7 = 15,
    param8 = 0,
    param9 = 0,
    skillName = "地狱4星贪念寺院鲜血的霸王墓碑"
    };
getRow(5034)->
    #skill_effectCfg {
    iD = 5034,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 4883,
    param2 = 2,
    param3 = 30000,
    param4 = 0,
    param5 = 0,
    param6 = 2,
    param7 = 15,
    param8 = 0,
    param9 = 0,
    skillName = "地狱5星贪念寺院鲜血的霸王墓碑"
    };
getRow(5035)->
    #skill_effectCfg {
    iD = 5035,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 4903,
    param2 = 2,
    param3 = 30000,
    param4 = 0,
    param5 = 0,
    param6 = 2,
    param7 = 15,
    param8 = 0,
    param9 = 0,
    skillName = "地狱6星贪念寺院鲜血的霸王墓碑"
    };
getRow(5036)->
    #skill_effectCfg {
    iD = 5036,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 4923,
    param2 = 2,
    param3 = 30000,
    param4 = 0,
    param5 = 0,
    param6 = 2,
    param7 = 15,
    param8 = 0,
    param9 = 0,
    skillName = "地狱7星贪念寺院鲜血的霸王墓碑"
    };
getRow(5037)->
    #skill_effectCfg {
    iD = 5037,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 4943,
    param2 = 2,
    param3 = 30000,
    param4 = 0,
    param5 = 0,
    param6 = 2,
    param7 = 15,
    param8 = 0,
    param9 = 0,
    skillName = "地狱8星贪念寺院鲜血的霸王墓碑"
    };
getRow(5038)->
    #skill_effectCfg {
    iD = 5038,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 4963,
    param2 = 2,
    param3 = 30000,
    param4 = 0,
    param5 = 0,
    param6 = 2,
    param7 = 15,
    param8 = 0,
    param9 = 0,
    skillName = "地狱9星贪念寺院鲜血的霸王墓碑"
    };
getRow(5039)->
    #skill_effectCfg {
    iD = 5039,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 4983,
    param2 = 2,
    param3 = 30000,
    param4 = 0,
    param5 = 0,
    param6 = 2,
    param7 = 15,
    param8 = 0,
    param9 = 0,
    skillName = "地狱10星贪念寺院鲜血的霸王墓碑"
    };
getRow(5100)->
    #skill_effectCfg {
    iD = 5100,
    effectType = 17,
    effectChance = 0.5,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 5100,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "贪念寺院石骑士"
    };
getRow(5101)->
    #skill_effectCfg {
    iD = 5101,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 5100,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "贪念寺院石骑士"
    };
getRow(5102)->
    #skill_effectCfg {
    iD = 5102,
    effectType = 14,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 4212,
    param2 = 0,
    param3 = 5,
    param4 = 60000,
    param5 = 1,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "贪念寺院石骑士"
    };
getRow(5104)->
    #skill_effectCfg {
    iD = 5104,
    effectType = 1,
    effectChance = 0.3,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 5104,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "80副本boss通用"
    };
getRow(5105)->
    #skill_effectCfg {
    iD = 5105,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 5107,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "贪念寺院石骑士"
    };
getRow(5153)->
    #skill_effectCfg {
    iD = 5153,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 4205,
    param2 = 1,
    param3 = 120000,
    param4 = 10,
    param5 = 0,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "贪念寺院石骑士雕像"
    };
getRow(5154)->
    #skill_effectCfg {
    iD = 5154,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 4205,
    param2 = 1,
    param3 = 120000,
    param4 = -10,
    param5 = 0,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "贪念寺院石骑士雕像"
    };
getRow(5155)->
    #skill_effectCfg {
    iD = 5155,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 4205,
    param2 = 1,
    param3 = 120000,
    param4 = 0,
    param5 = 10,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "贪念寺院石骑士雕像"
    };
getRow(5156)->
    #skill_effectCfg {
    iD = 5156,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 4205,
    param2 = 1,
    param3 = 120000,
    param4 = 0,
    param5 = -10,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "贪念寺院石骑士雕像"
    };
getRow(5157)->
    #skill_effectCfg {
    iD = 5157,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 4205,
    param2 = 1,
    param3 = 120000,
    param4 = 20,
    param5 = 10,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "贪念寺院石骑士雕像"
    };
getRow(5158)->
    #skill_effectCfg {
    iD = 5158,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 4205,
    param2 = 1,
    param3 = 120000,
    param4 = -20,
    param5 = 10,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "贪念寺院石骑士雕像"
    };
getRow(5159)->
    #skill_effectCfg {
    iD = 5159,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 4205,
    param2 = 1,
    param3 = 120000,
    param4 = 20,
    param5 = -10,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "贪念寺院石骑士雕像"
    };
getRow(5160)->
    #skill_effectCfg {
    iD = 5160,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 4205,
    param2 = 1,
    param3 = 120000,
    param4 = -20,
    param5 = -10,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "贪念寺院石骑士雕像"
    };
getRow(5161)->
    #skill_effectCfg {
    iD = 5161,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 4205,
    param2 = 1,
    param3 = 120000,
    param4 = 10,
    param5 = 20,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "贪念寺院石骑士雕像"
    };
getRow(5162)->
    #skill_effectCfg {
    iD = 5162,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 4205,
    param2 = 1,
    param3 = 120000,
    param4 = -10,
    param5 = 20,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "贪念寺院石骑士雕像"
    };
getRow(5163)->
    #skill_effectCfg {
    iD = 5163,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 4205,
    param2 = 1,
    param3 = 120000,
    param4 = 10,
    param5 = -20,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "贪念寺院石骑士雕像"
    };
getRow(5164)->
    #skill_effectCfg {
    iD = 5164,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 4205,
    param2 = 1,
    param3 = 120000,
    param4 = -10,
    param5 = -20,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "贪念寺院石骑士雕像"
    };
getRow(5165)->
    #skill_effectCfg {
    iD = 5165,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 4205,
    param2 = 1,
    param3 = 120000,
    param4 = -30,
    param5 = 0,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "贪念寺院石骑士雕像"
    };
getRow(5166)->
    #skill_effectCfg {
    iD = 5166,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 4205,
    param2 = 1,
    param3 = 120000,
    param4 = 30,
    param5 = 0,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "贪念寺院石骑士雕像"
    };
getRow(5167)->
    #skill_effectCfg {
    iD = 5167,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 4205,
    param2 = 1,
    param3 = 120000,
    param4 = 0,
    param5 = 30,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "贪念寺院石骑士雕像"
    };
getRow(5168)->
    #skill_effectCfg {
    iD = 5168,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 4205,
    param2 = 1,
    param3 = 120000,
    param4 = 0,
    param5 = -30,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "贪念寺院石骑士雕像"
    };
getRow(5201)->
    #skill_effectCfg {
    iD = 5201,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 4206,
    param2 = 1,
    param3 = 120000,
    param4 = 0,
    param5 = 0,
    param6 = 2,
    param7 = 15,
    param8 = 0,
    param9 = 0,
    skillName = "普通贪念寺院灵魂骑士团长"
    };
getRow(5202)->
    #skill_effectCfg {
    iD = 5202,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 4226,
    param2 = 1,
    param3 = 120000,
    param4 = 0,
    param5 = 0,
    param6 = 2,
    param7 = 15,
    param8 = 0,
    param9 = 0,
    skillName = "困难贪念寺院灵魂骑士团长"
    };
getRow(5203)->
    #skill_effectCfg {
    iD = 5203,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 4246,
    param2 = 1,
    param3 = 120000,
    param4 = 0,
    param5 = 0,
    param6 = 2,
    param7 = 15,
    param8 = 0,
    param9 = 0,
    skillName = "噩梦贪念寺院灵魂骑士团长"
    };
getRow(5204)->
    #skill_effectCfg {
    iD = 5204,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 4806,
    param2 = 1,
    param3 = 120000,
    param4 = 0,
    param5 = 0,
    param6 = 2,
    param7 = 15,
    param8 = 0,
    param9 = 0,
    skillName = "地狱1星贪念寺院灵魂骑士团长"
    };
getRow(5205)->
    #skill_effectCfg {
    iD = 5205,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 4826,
    param2 = 1,
    param3 = 120000,
    param4 = 0,
    param5 = 0,
    param6 = 2,
    param7 = 15,
    param8 = 0,
    param9 = 0,
    skillName = "地狱2星贪念寺院灵魂骑士团长"
    };
getRow(5206)->
    #skill_effectCfg {
    iD = 5206,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 4846,
    param2 = 1,
    param3 = 120000,
    param4 = 0,
    param5 = 0,
    param6 = 2,
    param7 = 15,
    param8 = 0,
    param9 = 0,
    skillName = "地狱3星贪念寺院灵魂骑士团长"
    };
getRow(5207)->
    #skill_effectCfg {
    iD = 5207,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 4866,
    param2 = 1,
    param3 = 120000,
    param4 = 0,
    param5 = 0,
    param6 = 2,
    param7 = 15,
    param8 = 0,
    param9 = 0,
    skillName = "地狱4星贪念寺院灵魂骑士团长"
    };
getRow(5208)->
    #skill_effectCfg {
    iD = 5208,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 4886,
    param2 = 1,
    param3 = 120000,
    param4 = 0,
    param5 = 0,
    param6 = 2,
    param7 = 15,
    param8 = 0,
    param9 = 0,
    skillName = "地狱5星贪念寺院灵魂骑士团长"
    };
getRow(5209)->
    #skill_effectCfg {
    iD = 5209,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 4906,
    param2 = 1,
    param3 = 120000,
    param4 = 0,
    param5 = 0,
    param6 = 2,
    param7 = 15,
    param8 = 0,
    param9 = 0,
    skillName = "地狱6星贪念寺院灵魂骑士团长"
    };
getRow(5210)->
    #skill_effectCfg {
    iD = 5210,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 4926,
    param2 = 1,
    param3 = 120000,
    param4 = 0,
    param5 = 0,
    param6 = 2,
    param7 = 15,
    param8 = 0,
    param9 = 0,
    skillName = "地狱7星贪念寺院灵魂骑士团长"
    };
getRow(5211)->
    #skill_effectCfg {
    iD = 5211,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 4946,
    param2 = 1,
    param3 = 120000,
    param4 = 0,
    param5 = 0,
    param6 = 2,
    param7 = 15,
    param8 = 0,
    param9 = 0,
    skillName = "地狱8星贪念寺院灵魂骑士团长"
    };
getRow(5212)->
    #skill_effectCfg {
    iD = 5212,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 4966,
    param2 = 1,
    param3 = 120000,
    param4 = 0,
    param5 = 0,
    param6 = 2,
    param7 = 15,
    param8 = 0,
    param9 = 0,
    skillName = "地狱9星贪念寺院灵魂骑士团长"
    };
getRow(5213)->
    #skill_effectCfg {
    iD = 5213,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 4986,
    param2 = 1,
    param3 = 120000,
    param4 = 0,
    param5 = 0,
    param6 = 2,
    param7 = 15,
    param8 = 0,
    param9 = 0,
    skillName = "地狱10星贪念寺院灵魂骑士团长"
    };
getRow(5214)->
    #skill_effectCfg {
    iD = 5214,
    effectType = 15,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 10,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "贪念寺院灵魂骑士团长"
    };
getRow(5216)->
    #skill_effectCfg {
    iD = 5216,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 4207,
    param2 = 1,
    param3 = 120000,
    param4 = 21,
    param5 = 0,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "普通贪念寺院灵魂骑士团长"
    };
getRow(5217)->
    #skill_effectCfg {
    iD = 5217,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 4208,
    param2 = 1,
    param3 = 120000,
    param4 = -21,
    param5 = 0,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "普通贪念寺院灵魂骑士团长"
    };
getRow(5218)->
    #skill_effectCfg {
    iD = 5218,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 4209,
    param2 = 1,
    param3 = 120000,
    param4 = 0,
    param5 = 21,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "普通贪念寺院灵魂骑士团长"
    };
getRow(5219)->
    #skill_effectCfg {
    iD = 5219,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 4210,
    param2 = 1,
    param3 = 120000,
    param4 = 14,
    param5 = -21,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "普通贪念寺院灵魂骑士团长"
    };
getRow(5220)->
    #skill_effectCfg {
    iD = 5220,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 4211,
    param2 = 1,
    param3 = 120000,
    param4 = -14,
    param5 = -21,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "普通贪念寺院灵魂骑士团长"
    };
getRow(5221)->
    #skill_effectCfg {
    iD = 5221,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 4227,
    param2 = 1,
    param3 = 120000,
    param4 = 21,
    param5 = 0,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "困难贪念寺院灵魂骑士团长"
    };
getRow(5222)->
    #skill_effectCfg {
    iD = 5222,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 4228,
    param2 = 1,
    param3 = 120000,
    param4 = -21,
    param5 = 0,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "困难贪念寺院灵魂骑士团长"
    };
getRow(5223)->
    #skill_effectCfg {
    iD = 5223,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 4229,
    param2 = 1,
    param3 = 120000,
    param4 = 0,
    param5 = 21,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "困难贪念寺院灵魂骑士团长"
    };
getRow(5224)->
    #skill_effectCfg {
    iD = 5224,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 4230,
    param2 = 1,
    param3 = 120000,
    param4 = 14,
    param5 = -21,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "困难贪念寺院灵魂骑士团长"
    };
getRow(5225)->
    #skill_effectCfg {
    iD = 5225,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 4231,
    param2 = 1,
    param3 = 120000,
    param4 = -14,
    param5 = -21,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "困难贪念寺院灵魂骑士团长"
    };
getRow(5226)->
    #skill_effectCfg {
    iD = 5226,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 4247,
    param2 = 1,
    param3 = 120000,
    param4 = 21,
    param5 = 0,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "噩梦贪念寺院灵魂骑士团长"
    };
getRow(5227)->
    #skill_effectCfg {
    iD = 5227,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 4248,
    param2 = 1,
    param3 = 120000,
    param4 = -21,
    param5 = 0,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "噩梦贪念寺院灵魂骑士团长"
    };
getRow(5228)->
    #skill_effectCfg {
    iD = 5228,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 4249,
    param2 = 1,
    param3 = 120000,
    param4 = 0,
    param5 = 21,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "噩梦贪念寺院灵魂骑士团长"
    };
getRow(5229)->
    #skill_effectCfg {
    iD = 5229,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 4250,
    param2 = 1,
    param3 = 120000,
    param4 = 14,
    param5 = -21,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "噩梦贪念寺院灵魂骑士团长"
    };
getRow(5230)->
    #skill_effectCfg {
    iD = 5230,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 4251,
    param2 = 1,
    param3 = 120000,
    param4 = -14,
    param5 = -21,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "噩梦贪念寺院灵魂骑士团长"
    };
getRow(5231)->
    #skill_effectCfg {
    iD = 5231,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 4807,
    param2 = 1,
    param3 = 120000,
    param4 = 21,
    param5 = 0,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "地狱1星贪念寺院灵魂骑士团长"
    };
getRow(5232)->
    #skill_effectCfg {
    iD = 5232,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 4808,
    param2 = 1,
    param3 = 120000,
    param4 = -21,
    param5 = 0,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "地狱1星贪念寺院灵魂骑士团长"
    };
getRow(5233)->
    #skill_effectCfg {
    iD = 5233,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 4809,
    param2 = 1,
    param3 = 120000,
    param4 = 0,
    param5 = 21,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "地狱1星贪念寺院灵魂骑士团长"
    };
getRow(5234)->
    #skill_effectCfg {
    iD = 5234,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 4810,
    param2 = 1,
    param3 = 120000,
    param4 = 14,
    param5 = -21,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "地狱1星贪念寺院灵魂骑士团长"
    };
getRow(5235)->
    #skill_effectCfg {
    iD = 5235,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 4811,
    param2 = 1,
    param3 = 120000,
    param4 = -14,
    param5 = -21,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "地狱1星贪念寺院灵魂骑士团长"
    };
getRow(5236)->
    #skill_effectCfg {
    iD = 5236,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 4827,
    param2 = 1,
    param3 = 120000,
    param4 = 21,
    param5 = 0,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "地狱2星贪念寺院灵魂骑士团长"
    };
getRow(5237)->
    #skill_effectCfg {
    iD = 5237,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 4828,
    param2 = 1,
    param3 = 120000,
    param4 = -21,
    param5 = 0,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "地狱2星贪念寺院灵魂骑士团长"
    };
getRow(5238)->
    #skill_effectCfg {
    iD = 5238,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 4829,
    param2 = 1,
    param3 = 120000,
    param4 = 0,
    param5 = 21,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "地狱2星贪念寺院灵魂骑士团长"
    };
getRow(5239)->
    #skill_effectCfg {
    iD = 5239,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 4830,
    param2 = 1,
    param3 = 120000,
    param4 = 14,
    param5 = -21,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "地狱2星贪念寺院灵魂骑士团长"
    };
getRow(5240)->
    #skill_effectCfg {
    iD = 5240,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 4831,
    param2 = 1,
    param3 = 120000,
    param4 = -14,
    param5 = -21,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "地狱2星贪念寺院灵魂骑士团长"
    };
getRow(5241)->
    #skill_effectCfg {
    iD = 5241,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 4847,
    param2 = 1,
    param3 = 120000,
    param4 = 21,
    param5 = 0,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "地狱3星贪念寺院灵魂骑士团长"
    };
getRow(5242)->
    #skill_effectCfg {
    iD = 5242,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 4848,
    param2 = 1,
    param3 = 120000,
    param4 = -21,
    param5 = 0,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "地狱3星贪念寺院灵魂骑士团长"
    };
getRow(5243)->
    #skill_effectCfg {
    iD = 5243,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 4849,
    param2 = 1,
    param3 = 120000,
    param4 = 0,
    param5 = 21,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "地狱3星贪念寺院灵魂骑士团长"
    };
getRow(5244)->
    #skill_effectCfg {
    iD = 5244,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 4850,
    param2 = 1,
    param3 = 120000,
    param4 = 14,
    param5 = -21,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "地狱3星贪念寺院灵魂骑士团长"
    };
getRow(5245)->
    #skill_effectCfg {
    iD = 5245,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 4851,
    param2 = 1,
    param3 = 120000,
    param4 = -14,
    param5 = -21,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "地狱3星贪念寺院灵魂骑士团长"
    };
getRow(5246)->
    #skill_effectCfg {
    iD = 5246,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 4867,
    param2 = 1,
    param3 = 120000,
    param4 = 21,
    param5 = 0,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "地狱4星贪念寺院灵魂骑士团长"
    };
getRow(5247)->
    #skill_effectCfg {
    iD = 5247,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 4868,
    param2 = 1,
    param3 = 120000,
    param4 = -21,
    param5 = 0,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "地狱4星贪念寺院灵魂骑士团长"
    };
getRow(5248)->
    #skill_effectCfg {
    iD = 5248,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 4869,
    param2 = 1,
    param3 = 120000,
    param4 = 0,
    param5 = 21,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "地狱4星贪念寺院灵魂骑士团长"
    };
getRow(5249)->
    #skill_effectCfg {
    iD = 5249,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 4870,
    param2 = 1,
    param3 = 120000,
    param4 = 14,
    param5 = -21,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "地狱4星贪念寺院灵魂骑士团长"
    };
getRow(5250)->
    #skill_effectCfg {
    iD = 5250,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 4871,
    param2 = 1,
    param3 = 120000,
    param4 = -14,
    param5 = -21,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "地狱4星贪念寺院灵魂骑士团长"
    };
getRow(5251)->
    #skill_effectCfg {
    iD = 5251,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 4887,
    param2 = 1,
    param3 = 120000,
    param4 = 21,
    param5 = 0,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "地狱5星贪念寺院灵魂骑士团长"
    };
getRow(5252)->
    #skill_effectCfg {
    iD = 5252,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 4888,
    param2 = 1,
    param3 = 120000,
    param4 = -21,
    param5 = 0,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "地狱5星贪念寺院灵魂骑士团长"
    };
getRow(5253)->
    #skill_effectCfg {
    iD = 5253,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 4889,
    param2 = 1,
    param3 = 120000,
    param4 = 0,
    param5 = 21,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "地狱5星贪念寺院灵魂骑士团长"
    };
getRow(5254)->
    #skill_effectCfg {
    iD = 5254,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 4890,
    param2 = 1,
    param3 = 120000,
    param4 = 14,
    param5 = -21,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "地狱5星贪念寺院灵魂骑士团长"
    };
getRow(5255)->
    #skill_effectCfg {
    iD = 5255,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 4891,
    param2 = 1,
    param3 = 120000,
    param4 = -14,
    param5 = -21,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "地狱5星贪念寺院灵魂骑士团长"
    };
getRow(5256)->
    #skill_effectCfg {
    iD = 5256,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 4907,
    param2 = 1,
    param3 = 120000,
    param4 = 21,
    param5 = 0,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "地狱6星贪念寺院灵魂骑士团长"
    };
getRow(5257)->
    #skill_effectCfg {
    iD = 5257,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 4908,
    param2 = 1,
    param3 = 120000,
    param4 = -21,
    param5 = 0,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "地狱6星贪念寺院灵魂骑士团长"
    };
getRow(5258)->
    #skill_effectCfg {
    iD = 5258,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 4909,
    param2 = 1,
    param3 = 120000,
    param4 = 0,
    param5 = 21,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "地狱6星贪念寺院灵魂骑士团长"
    };
getRow(5259)->
    #skill_effectCfg {
    iD = 5259,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 4910,
    param2 = 1,
    param3 = 120000,
    param4 = 14,
    param5 = -21,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "地狱6星贪念寺院灵魂骑士团长"
    };
getRow(5260)->
    #skill_effectCfg {
    iD = 5260,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 4911,
    param2 = 1,
    param3 = 120000,
    param4 = -14,
    param5 = -21,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "地狱6星贪念寺院灵魂骑士团长"
    };
getRow(5261)->
    #skill_effectCfg {
    iD = 5261,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 4927,
    param2 = 1,
    param3 = 120000,
    param4 = 21,
    param5 = 0,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "地狱7星贪念寺院灵魂骑士团长"
    };
getRow(5262)->
    #skill_effectCfg {
    iD = 5262,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 4928,
    param2 = 1,
    param3 = 120000,
    param4 = -21,
    param5 = 0,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "地狱7星贪念寺院灵魂骑士团长"
    };
getRow(5263)->
    #skill_effectCfg {
    iD = 5263,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 4929,
    param2 = 1,
    param3 = 120000,
    param4 = 0,
    param5 = 21,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "地狱7星贪念寺院灵魂骑士团长"
    };
getRow(5264)->
    #skill_effectCfg {
    iD = 5264,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 4930,
    param2 = 1,
    param3 = 120000,
    param4 = 14,
    param5 = -21,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "地狱7星贪念寺院灵魂骑士团长"
    };
getRow(5265)->
    #skill_effectCfg {
    iD = 5265,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 4931,
    param2 = 1,
    param3 = 120000,
    param4 = -14,
    param5 = -21,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "地狱7星贪念寺院灵魂骑士团长"
    };
getRow(5266)->
    #skill_effectCfg {
    iD = 5266,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 4947,
    param2 = 1,
    param3 = 120000,
    param4 = 21,
    param5 = 0,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "地狱8星贪念寺院灵魂骑士团长"
    };
getRow(5267)->
    #skill_effectCfg {
    iD = 5267,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 4948,
    param2 = 1,
    param3 = 120000,
    param4 = -21,
    param5 = 0,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "地狱8星贪念寺院灵魂骑士团长"
    };
getRow(5268)->
    #skill_effectCfg {
    iD = 5268,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 4949,
    param2 = 1,
    param3 = 120000,
    param4 = 0,
    param5 = 21,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "地狱8星贪念寺院灵魂骑士团长"
    };
getRow(5269)->
    #skill_effectCfg {
    iD = 5269,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 4950,
    param2 = 1,
    param3 = 120000,
    param4 = 14,
    param5 = -21,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "地狱8星贪念寺院灵魂骑士团长"
    };
getRow(5270)->
    #skill_effectCfg {
    iD = 5270,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 4951,
    param2 = 1,
    param3 = 120000,
    param4 = -14,
    param5 = -21,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "地狱8星贪念寺院灵魂骑士团长"
    };
getRow(5271)->
    #skill_effectCfg {
    iD = 5271,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 4967,
    param2 = 1,
    param3 = 120000,
    param4 = 21,
    param5 = 0,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "地狱9星贪念寺院灵魂骑士团长"
    };
getRow(5272)->
    #skill_effectCfg {
    iD = 5272,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 4968,
    param2 = 1,
    param3 = 120000,
    param4 = -21,
    param5 = 0,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "地狱9星贪念寺院灵魂骑士团长"
    };
getRow(5273)->
    #skill_effectCfg {
    iD = 5273,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 4969,
    param2 = 1,
    param3 = 120000,
    param4 = 0,
    param5 = 21,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "地狱9星贪念寺院灵魂骑士团长"
    };
getRow(5274)->
    #skill_effectCfg {
    iD = 5274,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 4970,
    param2 = 1,
    param3 = 120000,
    param4 = 14,
    param5 = -21,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "地狱9星贪念寺院灵魂骑士团长"
    };
getRow(5275)->
    #skill_effectCfg {
    iD = 5275,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 4971,
    param2 = 1,
    param3 = 120000,
    param4 = -14,
    param5 = -21,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "地狱9星贪念寺院灵魂骑士团长"
    };
getRow(5276)->
    #skill_effectCfg {
    iD = 5276,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 4987,
    param2 = 1,
    param3 = 120000,
    param4 = 21,
    param5 = 0,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "地狱10星贪念寺院灵魂骑士团长"
    };
getRow(5277)->
    #skill_effectCfg {
    iD = 5277,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 4988,
    param2 = 1,
    param3 = 120000,
    param4 = -21,
    param5 = 0,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "地狱10星贪念寺院灵魂骑士团长"
    };
getRow(5278)->
    #skill_effectCfg {
    iD = 5278,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 4989,
    param2 = 1,
    param3 = 120000,
    param4 = 0,
    param5 = 21,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "地狱10星贪念寺院灵魂骑士团长"
    };
getRow(5279)->
    #skill_effectCfg {
    iD = 5279,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 4990,
    param2 = 1,
    param3 = 120000,
    param4 = 14,
    param5 = -21,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "地狱10星贪念寺院灵魂骑士团长"
    };
getRow(5280)->
    #skill_effectCfg {
    iD = 5280,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 4991,
    param2 = 1,
    param3 = 120000,
    param4 = -14,
    param5 = -21,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "地狱10星贪念寺院灵魂骑士团长"
    };
getRow(5300)->
    #skill_effectCfg {
    iD = 5300,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 5300,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "贪念寺院灵魂骑士团长"
    };
getRow(5302)->
    #skill_effectCfg {
    iD = 5302,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 5302,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "贪念寺院灵魂骑士团长"
    };
getRow(5303)->
    #skill_effectCfg {
    iD = 5303,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 5303,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "贪念寺院灵魂骑士团长"
    };
getRow(5304)->
    #skill_effectCfg {
    iD = 5304,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 5304,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "贪念寺院灵魂骑士团长"
    };
getRow(5305)->
    #skill_effectCfg {
    iD = 5305,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 5305,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "贪念寺院灵魂骑士团长"
    };
getRow(5311)->
    #skill_effectCfg {
    iD = 5311,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 5311,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "贪念寺院灵魂骑士"
    };
getRow(5312)->
    #skill_effectCfg {
    iD = 5312,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 5312,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "贪念寺院灵魂骑士"
    };
getRow(5313)->
    #skill_effectCfg {
    iD = 5313,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 5313,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "贪念寺院灵魂骑士"
    };
getRow(5314)->
    #skill_effectCfg {
    iD = 5314,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 5314,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "贪念寺院灵魂骑士"
    };
getRow(5315)->
    #skill_effectCfg {
    iD = 5315,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 5315,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "贪念寺院灵魂骑士"
    };
getRow(6549)->
    #skill_effectCfg {
    iD = 6549,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 2022,
    param2 = 8,
    param3 = 10000,
    param4 = 0,
    param5 = 0,
    param6 = 8,
    param7 = 20,
    param8 = 0,
    param9 = 0,
    skillName = "40级普通副本幽冥召唤幽狱司"
    };
getRow(6550)->
    #skill_effectCfg {
    iD = 6550,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 2522,
    param2 = 8,
    param3 = 10000,
    param4 = 0,
    param5 = 0,
    param6 = 8,
    param7 = 20,
    param8 = 0,
    param9 = 0,
    skillName = "40级英雄副本幽冥召唤幽狱司"
    };
getRow(7011)->
    #skill_effectCfg {
    iD = 7011,
    effectType = 14,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 7011,
    param2 = 0,
    param3 = 6,
    param4 = 13000,
    param5 = 1,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "召唤仁慈女神"
    };
getRow(7012)->
    #skill_effectCfg {
    iD = 7012,
    effectType = 14,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 7012,
    param2 = 0,
    param3 = 6,
    param4 = 13000,
    param5 = 1,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "召唤仁慈女神"
    };
getRow(7013)->
    #skill_effectCfg {
    iD = 7013,
    effectType = 14,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 7013,
    param2 = 0,
    param3 = 6,
    param4 = 13000,
    param5 = 1,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "召唤仁慈女神"
    };
getRow(7014)->
    #skill_effectCfg {
    iD = 7014,
    effectType = 14,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 7014,
    param2 = 0,
    param3 = 6,
    param4 = 13000,
    param5 = 1,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "召唤仁慈女神"
    };
getRow(7015)->
    #skill_effectCfg {
    iD = 7015,
    effectType = 14,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 7015,
    param2 = 0,
    param3 = 6,
    param4 = 13000,
    param5 = 1,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "召唤仁慈女神"
    };
getRow(7021)->
    #skill_effectCfg {
    iD = 7021,
    effectType = 14,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 7021,
    param2 = 0,
    param3 = 6,
    param4 = 15000,
    param5 = 1,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "召唤战争女神"
    };
getRow(7022)->
    #skill_effectCfg {
    iD = 7022,
    effectType = 14,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 7022,
    param2 = 0,
    param3 = 6,
    param4 = 15000,
    param5 = 1,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "召唤战争女神"
    };
getRow(7023)->
    #skill_effectCfg {
    iD = 7023,
    effectType = 14,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 7023,
    param2 = 0,
    param3 = 6,
    param4 = 15000,
    param5 = 1,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "召唤战争女神"
    };
getRow(7024)->
    #skill_effectCfg {
    iD = 7024,
    effectType = 14,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 7024,
    param2 = 0,
    param3 = 6,
    param4 = 15000,
    param5 = 1,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "召唤战争女神"
    };
getRow(7025)->
    #skill_effectCfg {
    iD = 7025,
    effectType = 14,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 7025,
    param2 = 0,
    param3 = 6,
    param4 = 15000,
    param5 = 1,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "召唤战争女神"
    };
getRow(7031)->
    #skill_effectCfg {
    iD = 7031,
    effectType = 14,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 7031,
    param2 = 0,
    param3 = 6,
    param4 = 25000,
    param5 = 1,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "召唤智慧女神"
    };
getRow(7032)->
    #skill_effectCfg {
    iD = 7032,
    effectType = 14,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 7032,
    param2 = 0,
    param3 = 6,
    param4 = 25000,
    param5 = 1,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "召唤智慧女神"
    };
getRow(7033)->
    #skill_effectCfg {
    iD = 7033,
    effectType = 14,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 7033,
    param2 = 0,
    param3 = 6,
    param4 = 25000,
    param5 = 1,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "召唤智慧女神"
    };
getRow(7034)->
    #skill_effectCfg {
    iD = 7034,
    effectType = 14,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 7034,
    param2 = 0,
    param3 = 6,
    param4 = 25000,
    param5 = 1,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "召唤智慧女神"
    };
getRow(7035)->
    #skill_effectCfg {
    iD = 7035,
    effectType = 14,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 7035,
    param2 = 0,
    param3 = 6,
    param4 = 25000,
    param5 = 1,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "召唤智慧女神"
    };
getRow(7041)->
    #skill_effectCfg {
    iD = 7041,
    effectType = 14,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 7041,
    param2 = 0,
    param3 = 6,
    param4 = 25000,
    param5 = 1,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "召唤暗夜女神"
    };
getRow(7042)->
    #skill_effectCfg {
    iD = 7042,
    effectType = 14,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 7042,
    param2 = 0,
    param3 = 6,
    param4 = 25000,
    param5 = 1,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "召唤暗夜女神"
    };
getRow(7043)->
    #skill_effectCfg {
    iD = 7043,
    effectType = 14,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 7043,
    param2 = 0,
    param3 = 6,
    param4 = 25000,
    param5 = 1,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "召唤暗夜女神"
    };
getRow(7044)->
    #skill_effectCfg {
    iD = 7044,
    effectType = 14,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 7044,
    param2 = 0,
    param3 = 6,
    param4 = 25000,
    param5 = 1,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "召唤暗夜女神"
    };
getRow(7045)->
    #skill_effectCfg {
    iD = 7045,
    effectType = 14,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 7045,
    param2 = 0,
    param3 = 6,
    param4 = 25000,
    param5 = 1,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "召唤暗夜女神"
    };
getRow(7111)->
    #skill_effectCfg {
    iD = 7111,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 7111,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "召唤仁慈女神"
    };
getRow(7112)->
    #skill_effectCfg {
    iD = 7112,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 7112,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "召唤仁慈女神"
    };
getRow(7113)->
    #skill_effectCfg {
    iD = 7113,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 7113,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "召唤仁慈女神"
    };
getRow(7114)->
    #skill_effectCfg {
    iD = 7114,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 7114,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "召唤仁慈女神"
    };
getRow(7115)->
    #skill_effectCfg {
    iD = 7115,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 7115,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "召唤仁慈女神"
    };
getRow(7121)->
    #skill_effectCfg {
    iD = 7121,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 7121,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "召唤战争女神"
    };
getRow(7122)->
    #skill_effectCfg {
    iD = 7122,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 7122,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "召唤战争女神"
    };
getRow(7123)->
    #skill_effectCfg {
    iD = 7123,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 7123,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "召唤战争女神"
    };
getRow(7124)->
    #skill_effectCfg {
    iD = 7124,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 7124,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "召唤战争女神"
    };
getRow(7125)->
    #skill_effectCfg {
    iD = 7125,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 7125,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "召唤战争女神"
    };
getRow(7131)->
    #skill_effectCfg {
    iD = 7131,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 7131,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "召唤智慧女神"
    };
getRow(7132)->
    #skill_effectCfg {
    iD = 7132,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 7132,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "召唤智慧女神"
    };
getRow(7133)->
    #skill_effectCfg {
    iD = 7133,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 7133,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "召唤智慧女神"
    };
getRow(7134)->
    #skill_effectCfg {
    iD = 7134,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 7134,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "召唤智慧女神"
    };
getRow(7135)->
    #skill_effectCfg {
    iD = 7135,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 7135,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "召唤智慧女神"
    };
getRow(7141)->
    #skill_effectCfg {
    iD = 7141,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 7141,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "召唤暗夜女神"
    };
getRow(7142)->
    #skill_effectCfg {
    iD = 7142,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 7142,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "召唤暗夜女神"
    };
getRow(7143)->
    #skill_effectCfg {
    iD = 7143,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 7143,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "召唤暗夜女神"
    };
getRow(7144)->
    #skill_effectCfg {
    iD = 7144,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 7144,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "召唤暗夜女神"
    };
getRow(7145)->
    #skill_effectCfg {
    iD = 7145,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 7145,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "召唤暗夜女神"
    };
getRow(7211)->
    #skill_effectCfg {
    iD = 7211,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 5001,
    param2 = 1,
    param3 = 4500,
    param4 = 4,
    param5 = 4,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "仁慈召唤I"
    };
getRow(7212)->
    #skill_effectCfg {
    iD = 7212,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 5002,
    param2 = 1,
    param3 = 4000,
    param4 = 4,
    param5 = -4,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "战争召唤I"
    };
getRow(7213)->
    #skill_effectCfg {
    iD = 7213,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 5003,
    param2 = 1,
    param3 = 4500,
    param4 = -4,
    param5 = 4,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "智慧召唤I"
    };
getRow(7214)->
    #skill_effectCfg {
    iD = 7214,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 5004,
    param2 = 1,
    param3 = 3500,
    param4 = -4,
    param5 = -4,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "暗夜召唤I"
    };
getRow(7311)->
    #skill_effectCfg {
    iD = 7311,
    effectType = 14,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 7311,
    param2 = 0,
    param3 = 6,
    param4 = 1500,
    param5 = 1,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "召唤仁慈女神"
    };
getRow(7312)->
    #skill_effectCfg {
    iD = 7312,
    effectType = 14,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 7312,
    param2 = 0,
    param3 = 6,
    param4 = 1500,
    param5 = 1,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "召唤仁慈女神"
    };
getRow(7313)->
    #skill_effectCfg {
    iD = 7313,
    effectType = 14,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 7313,
    param2 = 0,
    param3 = 6,
    param4 = 1500,
    param5 = 1,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "召唤仁慈女神"
    };
getRow(7314)->
    #skill_effectCfg {
    iD = 7314,
    effectType = 14,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 7314,
    param2 = 0,
    param3 = 6,
    param4 = 1500,
    param5 = 1,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "召唤仁慈女神"
    };
getRow(7315)->
    #skill_effectCfg {
    iD = 7315,
    effectType = 14,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 7315,
    param2 = 0,
    param3 = 6,
    param4 = 1500,
    param5 = 1,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "召唤仁慈女神"
    };
getRow(7321)->
    #skill_effectCfg {
    iD = 7321,
    effectType = 14,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 7321,
    param2 = 0,
    param3 = 6,
    param4 = 1500,
    param5 = 1,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "召唤战争女神"
    };
getRow(7322)->
    #skill_effectCfg {
    iD = 7322,
    effectType = 14,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 7322,
    param2 = 0,
    param3 = 6,
    param4 = 1500,
    param5 = 1,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "召唤战争女神"
    };
getRow(7323)->
    #skill_effectCfg {
    iD = 7323,
    effectType = 14,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 7323,
    param2 = 0,
    param3 = 6,
    param4 = 1500,
    param5 = 1,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "召唤战争女神"
    };
getRow(7324)->
    #skill_effectCfg {
    iD = 7324,
    effectType = 14,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 7324,
    param2 = 0,
    param3 = 6,
    param4 = 1500,
    param5 = 1,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "召唤战争女神"
    };
getRow(7325)->
    #skill_effectCfg {
    iD = 7325,
    effectType = 14,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 7325,
    param2 = 0,
    param3 = 6,
    param4 = 1500,
    param5 = 1,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "召唤战争女神"
    };
getRow(7331)->
    #skill_effectCfg {
    iD = 7331,
    effectType = 14,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 7331,
    param2 = 0,
    param3 = 6,
    param4 = 1500,
    param5 = 1,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "召唤智慧女神"
    };
getRow(7332)->
    #skill_effectCfg {
    iD = 7332,
    effectType = 14,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 7332,
    param2 = 0,
    param3 = 6,
    param4 = 1500,
    param5 = 1,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "召唤智慧女神"
    };
getRow(7333)->
    #skill_effectCfg {
    iD = 7333,
    effectType = 14,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 7333,
    param2 = 0,
    param3 = 6,
    param4 = 1500,
    param5 = 1,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "召唤智慧女神"
    };
getRow(7334)->
    #skill_effectCfg {
    iD = 7334,
    effectType = 14,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 7334,
    param2 = 0,
    param3 = 6,
    param4 = 1500,
    param5 = 1,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "召唤智慧女神"
    };
getRow(7335)->
    #skill_effectCfg {
    iD = 7335,
    effectType = 14,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 7335,
    param2 = 0,
    param3 = 6,
    param4 = 1500,
    param5 = 1,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "召唤智慧女神"
    };
getRow(7341)->
    #skill_effectCfg {
    iD = 7341,
    effectType = 14,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 7341,
    param2 = 0,
    param3 = 6,
    param4 = 1500,
    param5 = 1,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "召唤暗夜女神"
    };
getRow(7342)->
    #skill_effectCfg {
    iD = 7342,
    effectType = 14,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 7342,
    param2 = 0,
    param3 = 6,
    param4 = 1500,
    param5 = 1,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "召唤暗夜女神"
    };
getRow(7343)->
    #skill_effectCfg {
    iD = 7343,
    effectType = 14,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 7343,
    param2 = 0,
    param3 = 6,
    param4 = 1500,
    param5 = 1,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "召唤暗夜女神"
    };
getRow(7344)->
    #skill_effectCfg {
    iD = 7344,
    effectType = 14,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 7344,
    param2 = 0,
    param3 = 6,
    param4 = 1500,
    param5 = 1,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "召唤暗夜女神"
    };
getRow(7345)->
    #skill_effectCfg {
    iD = 7345,
    effectType = 14,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 7345,
    param2 = 0,
    param3 = 6,
    param4 = 1500,
    param5 = 1,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "召唤暗夜女神"
    };
getRow(7411)->
    #skill_effectCfg {
    iD = 7411,
    effectType = 14,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 7411,
    param2 = 0,
    param3 = 6,
    param4 = 1500,
    param5 = 1,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "召唤仁慈女神"
    };
getRow(7421)->
    #skill_effectCfg {
    iD = 7421,
    effectType = 14,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 7421,
    param2 = 0,
    param3 = 6,
    param4 = 5000,
    param5 = 0,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "召唤仁慈女神"
    };
getRow(7431)->
    #skill_effectCfg {
    iD = 7431,
    effectType = 14,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 7431,
    param2 = 0,
    param3 = 6,
    param4 = 8000,
    param5 = 0,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "召唤仁慈女神"
    };
getRow(7441)->
    #skill_effectCfg {
    iD = 7441,
    effectType = 14,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 7441,
    param2 = 0,
    param3 = 6,
    param4 = 10000,
    param5 = 0,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "召唤仁慈女神"
    };
getRow(8002)->
    #skill_effectCfg {
    iD = 8002,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 63013,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "陷阱模式加速"
    };
getRow(8003)->
    #skill_effectCfg {
    iD = 8003,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 630130,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "陷阱模式减速"
    };
getRow(8004)->
    #skill_effectCfg {
    iD = 8004,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 63014,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "骑宠竞速陷阱"
    };
getRow(8005)->
    #skill_effectCfg {
    iD = 8005,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 63015,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "骑宠竞速强化陷阱"
    };
getRow(10001)->
    #skill_effectCfg {
    iD = 10001,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 10001,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "骑士大招免控1"
    };
getRow(10002)->
    #skill_effectCfg {
    iD = 10002,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 10002,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "骑士大招免控2"
    };
getRow(10003)->
    #skill_effectCfg {
    iD = 10003,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 10003,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "怒焰之心"
    };
getRow(10004)->
    #skill_effectCfg {
    iD = 10004,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 10004,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "法师大招免控1"
    };
getRow(10005)->
    #skill_effectCfg {
    iD = 10005,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 10005,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "法师大招免控2"
    };
getRow(10006)->
    #skill_effectCfg {
    iD = 10006,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 10006,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "刺客先发制人"
    };
getRow(10007)->
    #skill_effectCfg {
    iD = 10007,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 10007,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "刺客生存意志"
    };
getRow(10008)->
    #skill_effectCfg {
    iD = 10008,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 10008,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "雷霆意志被动"
    };
getRow(10009)->
    #skill_effectCfg {
    iD = 10009,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 10009,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "魔女亡者气息免控1"
    };
getRow(10010)->
    #skill_effectCfg {
    iD = 10010,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 10010,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "魔女亡者气息免控2"
    };
getRow(10011)->
    #skill_effectCfg {
    iD = 10011,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 10011,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "远古恶魔"
    };
getRow(10012)->
    #skill_effectCfg {
    iD = 10012,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 10012,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "献祭，力量+5%"
    };
getRow(10013)->
    #skill_effectCfg {
    iD = 10013,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 10013,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "亡者意志，体质+5%"
    };
getRow(10014)->
    #skill_effectCfg {
    iD = 10014,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 10014,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "死亡凝视，防御+5%"
    };
getRow(10015)->
    #skill_effectCfg {
    iD = 10015,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 3,
    param1 = 10015,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "点射定身"
    };
getRow(10016)->
    #skill_effectCfg {
    iD = 10016,
    effectType = 15,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 5,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "爆炎手雷击退"
    };
getRow(10017)->
    #skill_effectCfg {
    iD = 10017,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 10017,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "爆炎手雷击退抓取不受控制"
    };
getRow(10018)->
    #skill_effectCfg {
    iD = 10018,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 10018,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "火焰喷射降低伤害抗性"
    };
getRow(10019)->
    #skill_effectCfg {
    iD = 10019,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 10019,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "激光射线降低伤害"
    };
getRow(10020)->
    #skill_effectCfg {
    iD = 10020,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 10020,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "重力炸弹定身"
    };
getRow(10021)->
    #skill_effectCfg {
    iD = 10021,
    effectType = 15,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 5,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "炮击击退"
    };
getRow(10022)->
    #skill_effectCfg {
    iD = 10022,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 10022,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "炮击击退不受控制"
    };
getRow(10023)->
    #skill_effectCfg {
    iD = 10023,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 10023,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "迅捷加速，伤害提高，攻速提高"
    };
getRow(10024)->
    #skill_effectCfg {
    iD = 10024,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 10024,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "迅捷免疫1"
    };
getRow(10025)->
    #skill_effectCfg {
    iD = 10025,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 10025,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "迅捷免疫2"
    };
getRow(10026)->
    #skill_effectCfg {
    iD = 10026,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 10026,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "嗜血光环"
    };
getRow(10027)->
    #skill_effectCfg {
    iD = 10027,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 10027,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "杀戮意志暴击"
    };
getRow(10028)->
    #skill_effectCfg {
    iD = 10028,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 10028,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "杀戮意志调用"
    };
getRow(10029)->
    #skill_effectCfg {
    iD = 10029,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 10029,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "力破"
    };
getRow(10030)->
    #skill_effectCfg {
    iD = 10030,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 10030,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "力破调用"
    };
getRow(10031)->
    #skill_effectCfg {
    iD = 10031,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 10031,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "血腥杀戮"
    };
getRow(10032)->
    #skill_effectCfg {
    iD = 10032,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 10032,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "神佑"
    };
getRow(10033)->
    #skill_effectCfg {
    iD = 10033,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 10033,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "急速"
    };
getRow(12101)->
    #skill_effectCfg {
    iD = 12101,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 12101,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "影踪劲"
    };
getRow(12201)->
    #skill_effectCfg {
    iD = 12201,
    effectType = 1,
    effectChance = 1,
    effectcondition = 1,
    effectTarget = 0,
    param1 = 12201,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "影踪劲触发持续伤害"
    };
getRow(13007)->
    #skill_effectCfg {
    iD = 13007,
    effectType = 8,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 50010,
    param2 = 1,
    param3 = 0,
    param4 = 1,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "远古恶魔"
    };
getRow(13302)->
    #skill_effectCfg {
    iD = 13302,
    effectType = 8,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 50011,
    param2 = 1,
    param3 = 0,
    param4 = 1,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "生生不息额外召唤1"
    };
getRow(13303)->
    #skill_effectCfg {
    iD = 13303,
    effectType = 8,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 50012,
    param2 = 1,
    param3 = 0,
    param4 = 1,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "生生不息额外召唤2"
    };
getRow(13304)->
    #skill_effectCfg {
    iD = 13304,
    effectType = 8,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 50013,
    param2 = 1,
    param3 = 0,
    param4 = 1,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "生生不息额外召唤3"
    };
getRow(13500)->
    #skill_effectCfg {
    iD = 13500,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 13500,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "夫妻技能增加生命（被动）"
    };
getRow(13501)->
    #skill_effectCfg {
    iD = 13501,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 13501,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "夫妻技能增加物攻（被动）"
    };
getRow(13502)->
    #skill_effectCfg {
    iD = 13502,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 13502,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "夫妻技能增加法攻（被动）"
    };
getRow(13503)->
    #skill_effectCfg {
    iD = 13503,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 13503,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "夫妻技能增加物防（被动）"
    };
getRow(13504)->
    #skill_effectCfg {
    iD = 13504,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 13504,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "夫妻技能增加法防（被动）"
    };
getRow(14008)->
    #skill_effectCfg {
    iD = 14008,
    effectType = 14,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 43,
    param2 = 0,
    param3 = 6,
    param4 = 6800,
    param5 = 0,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "冰风暴载体"
    };
getRow(15007)->
    #skill_effectCfg {
    iD = 15007,
    effectType = 17,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 15005,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "消除【鬼魂的诅咒】BUFF效果"
    };
getRow(15010)->
    #skill_effectCfg {
    iD = 15010,
    effectType = 12,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 0,
    param2 = -0.05,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "第三次攻击减最大生命值"
    };
getRow(15020)->
    #skill_effectCfg {
    iD = 15020,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 13400,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "枪械师治疗"
    };
getRow(16000)->
    #skill_effectCfg {
    iD = 16000,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 3,
    param1 = 16000,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "杂技大师-治疗球"
    };
getRow(16001)->
    #skill_effectCfg {
    iD = 16001,
    effectType = 7,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 0,
    param2 = 0.5,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "贾斯丁比象-偶像魅力-拉怪"
    };
getRow(16002)->
    #skill_effectCfg {
    iD = 16002,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 16002,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "贾斯丁比象-偶像魅力-眩晕"
    };
getRow(16003)->
    #skill_effectCfg {
    iD = 16003,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 16003,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "贾斯丁比象-回眸一笑-眩晕"
    };
getRow(16004)->
    #skill_effectCfg {
    iD = 16004,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 16004,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "杀象特-绝不原谅-暴击增强"
    };
getRow(16005)->
    #skill_effectCfg {
    iD = 16005,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 16005,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "杂技大师-强化治疗"
    };
getRow(16007)->
    #skill_effectCfg {
    iD = 16007,
    effectType = 15,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 15,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "机械鸟-击退"
    };
getRow(16008)->
    #skill_effectCfg {
    iD = 16008,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 16008,
    param2 = 16009,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "机械鸟-回血+定身"
    };
getRow(16010)->
    #skill_effectCfg {
    iD = 16010,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 16010,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "暴击等级+500"
    };
getRow(16012)->
    #skill_effectCfg {
    iD = 16012,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 16012,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "西瓜鲨-伤害吸收盾"
    };
getRow(16013)->
    #skill_effectCfg {
    iD = 16013,
    effectType = 6,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 0,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "杀象特-儿子强行拉仇恨"
    };
getRow(16014)->
    #skill_effectCfg {
    iD = 16014,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 16013,
    param2 = 16014,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "钢铁狼-杀戮意志-攻击力提升，触发卸甲"
    };
getRow(16015)->
    #skill_effectCfg {
    iD = 16015,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 16015,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "卸甲双防降低"
    };
getRow(16016)->
    #skill_effectCfg {
    iD = 16016,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 3,
    param1 = 16016,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "雪橇犬-主人加油 持续回血"
    };
getRow(16017)->
    #skill_effectCfg {
    iD = 16017,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 16017,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "雪橇犬-主人别怕-双防提升"
    };
getRow(16018)->
    #skill_effectCfg {
    iD = 16018,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 16018,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "贝斯-镇魂曲-降低双防"
    };
getRow(16019)->
    #skill_effectCfg {
    iD = 16019,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 16019,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "贝斯-迷魂曲-降低闪避"
    };
getRow(16020)->
    #skill_effectCfg {
    iD = 16020,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 16020,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "寒冰踏焰-踏雪寻梅-概率冰冻"
    };
getRow(16021)->
    #skill_effectCfg {
    iD = 16021,
    effectType = 1,
    effectChance = 0.3,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 16020,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "寒冰踏焰-寒冰之息-冰冻"
    };
getRow(16022)->
    #skill_effectCfg {
    iD = 16022,
    effectType = 7,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 1,
    param2 = 0.5,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "天外飞碟-引力场-吸附"
    };
getRow(16023)->
    #skill_effectCfg {
    iD = 16023,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 16023,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "天外飞碟-粒子射线-禁魔"
    };
getRow(16024)->
    #skill_effectCfg {
    iD = 16024,
    effectType = 14,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 20013,
    param2 = 0,
    param3 = 0,
    param4 = 1500,
    param5 = 1,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "天外飞碟-引力场-载体"
    };
getRow(16025)->
    #skill_effectCfg {
    iD = 16025,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 16025,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "机甲乔巴-防御矩阵-强制攻击"
    };
getRow(16026)->
    #skill_effectCfg {
    iD = 16026,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 16026,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "机甲乔巴-防御矩阵-伤害吸收盾"
    };
getRow(16027)->
    #skill_effectCfg {
    iD = 16027,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 16027,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "翼狮-怒火冲天-暴击等级增加"
    };
getRow(16028)->
    #skill_effectCfg {
    iD = 16028,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 16028,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "翼狮-惹我的代价-暴击伤害增加"
    };
getRow(16029)->
    #skill_effectCfg {
    iD = 16029,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 16029,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "鲸梦-海啸-禁魔"
    };
getRow(16030)->
    #skill_effectCfg {
    iD = 16030,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 16030,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "鲸梦-梦魇-眩晕"
    };
getRow(16031)->
    #skill_effectCfg {
    iD = 16031,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 3,
    param1 = 16031,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "鲸梦-海啸-持续回血"
    };
getRow(16034)->
    #skill_effectCfg {
    iD = 16034,
    effectType = 7,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 0,
    param2 = 0.5,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "大钻风-电锯惊魂-吸怪"
    };
getRow(16035)->
    #skill_effectCfg {
    iD = 16035,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 16035,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "机械鸟-战斗技巧-攻防提升"
    };
getRow(16036)->
    #skill_effectCfg {
    iD = 16036,
    effectType = 1,
    effectChance = 0.5,
    effectcondition = 1,
    effectTarget = 0,
    param1 = 16036,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "机车狐-狐媚-双防降低"
    };
getRow(16037)->
    #skill_effectCfg {
    iD = 16037,
    effectType = 1,
    effectChance = 1,
    effectcondition = 2,
    effectTarget = 0,
    param1 = 16037,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "大尾巴狐-反咬一口-双攻降低"
    };
getRow(16038)->
    #skill_effectCfg {
    iD = 16038,
    effectType = 1,
    effectChance = 0.5,
    effectcondition = 1,
    effectTarget = 0,
    param1 = 16038,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "沙滩鸵鸟-迷幻术-昏迷"
    };
getRow(16039)->
    #skill_effectCfg {
    iD = 16039,
    effectType = 1,
    effectChance = 0.3,
    effectcondition = 1,
    effectTarget = 0,
    param1 = 16039,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "飞行萝卜-紧急降落-攻击降低"
    };
getRow(16040)->
    #skill_effectCfg {
    iD = 16040,
    effectType = 1,
    effectChance = 1,
    effectcondition = 1,
    effectTarget = 0,
    param1 = 16040,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "黄晶海马-投掷-攻击降低"
    };
getRow(16041)->
    #skill_effectCfg {
    iD = 16041,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 16041,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "绵羊国王-闪耀皇冠-吸引仇恨"
    };
getRow(16042)->
    #skill_effectCfg {
    iD = 16042,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 3,
    param1 = 16042,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "童话-织梦-持续治疗"
    };
getRow(16043)->
    #skill_effectCfg {
    iD = 16043,
    effectType = 7,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 0,
    param2 = 0.5,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "粉红独角兽-美人计-吸怪"
    };
getRow(16044)->
    #skill_effectCfg {
    iD = 16044,
    effectType = 15,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 10,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "双人机车男-机车撞击-击退"
    };
getRow(16045)->
    #skill_effectCfg {
    iD = 16045,
    effectType = 14,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 3,
    param1 = 20016,
    param2 = 0,
    param3 = 0,
    param4 = 2000,
    param5 = 1,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "双人机车男-炮弹攻击-载体表现"
    };
getRow(16046)->
    #skill_effectCfg {
    iD = 16046,
    effectType = 15,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 10,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "双人机车女-机车撞击-击退"
    };
getRow(16047)->
    #skill_effectCfg {
    iD = 16047,
    effectType = 14,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 3,
    param1 = 20017,
    param2 = 0,
    param3 = 0,
    param4 = 2000,
    param5 = 1,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "双人机车女-车载炮弹-载体表现"
    };
getRow(16048)->
    #skill_effectCfg {
    iD = 16048,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 16048,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "双人机车女-车载炮弹-角色降攻"
    };
getRow(16049)->
    #skill_effectCfg {
    iD = 16049,
    effectType = 1,
    effectChance = 0.5,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 16049,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "飞空艇-气流攻击-眩晕"
    };
getRow(16050)->
    #skill_effectCfg {
    iD = 16050,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 16052,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "花豹-增加主人攻击"
    };
getRow(16053)->
    #skill_effectCfg {
    iD = 16053,
    effectType = 1,
    effectChance = 0.5,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 16053,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "吞云吐雾-晕1人"
    };
getRow(16054)->
    #skill_effectCfg {
    iD = 16054,
    effectType = 1,
    effectChance = 0.5,
    effectcondition = 0,
    effectTarget = 3,
    param1 = 16054,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "气到变形-晕主目标"
    };
getRow(16055)->
    #skill_effectCfg {
    iD = 16055,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 3,
    param1 = 16055,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "双攻降低"
    };
getRow(16056)->
    #skill_effectCfg {
    iD = 16056,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 16056,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "免疫控制"
    };
getRow(16057)->
    #skill_effectCfg {
    iD = 16057,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 16057,
    param2 = 16058,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "降低敌人双攻、移速度"
    };
getRow(16058)->
    #skill_effectCfg {
    iD = 16058,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 16059,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "降低敌人移速度"
    };
getRow(16060)->
    #skill_effectCfg {
    iD = 16060,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 16060,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "沉默"
    };
getRow(16061)->
    #skill_effectCfg {
    iD = 16061,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 16061,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "变狗"
    };
getRow(16062)->
    #skill_effectCfg {
    iD = 16062,
    effectType = 14,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 3,
    param1 = 20023,
    param2 = 0,
    param3 = 0,
    param4 = 2000,
    param5 = 1,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "表现载体"
    };
getRow(16063)->
    #skill_effectCfg {
    iD = 16063,
    effectType = 14,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 3,
    param1 = 20024,
    param2 = 0,
    param3 = 0,
    param4 = 2000,
    param5 = 1,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "表现载体"
    };
getRow(16064)->
    #skill_effectCfg {
    iD = 16064,
    effectType = 1,
    effectChance = 0.5,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 16053,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "晕1人"
    };
getRow(16065)->
    #skill_effectCfg {
    iD = 16065,
    effectType = 15,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 15,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "恶灵退散-击退"
    };
getRow(16066)->
    #skill_effectCfg {
    iD = 16066,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 16066,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "降低敌人移速度"
    };
getRow(16067)->
    #skill_effectCfg {
    iD = 16067,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 16067,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "吸引仇恨"
    };
getRow(16068)->
    #skill_effectCfg {
    iD = 16068,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 16068,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "加主人攻击"
    };
getRow(16069)->
    #skill_effectCfg {
    iD = 16069,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 16070,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "增加主人双防"
    };
getRow(16071)->
    #skill_effectCfg {
    iD = 16071,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 16071,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "加主人攻击"
    };
getRow(16072)->
    #skill_effectCfg {
    iD = 16072,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 16072,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "技能后加攻击"
    };
getRow(16073)->
    #skill_effectCfg {
    iD = 16073,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 16073,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "加主人攻击"
    };
getRow(16074)->
    #skill_effectCfg {
    iD = 16074,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 16074,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "加主人攻击"
    };
getRow(16075)->
    #skill_effectCfg {
    iD = 16075,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 16075,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "加主人攻击"
    };
getRow(19000)->
    #skill_effectCfg {
    iD = 19000,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 0,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "40级野外boss"
    };
getRow(19001)->
    #skill_effectCfg {
    iD = 19001,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 19001,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "40级野外boss"
    };
getRow(19002)->
    #skill_effectCfg {
    iD = 19002,
    effectType = 14,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 1151,
    param2 = 0,
    param3 = 1,
    param4 = 3000,
    param5 = 0,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "40级野外boss"
    };
getRow(19003)->
    #skill_effectCfg {
    iD = 19003,
    effectType = 14,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 1160,
    param2 = 0,
    param3 = 1,
    param4 = 3000,
    param5 = 1,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "40级野外boss"
    };
getRow(19004)->
    #skill_effectCfg {
    iD = 19004,
    effectType = 7,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 0,
    param2 = 0.5,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "40级野外boss"
    };
getRow(19012)->
    #skill_effectCfg {
    iD = 19012,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 0,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "45级野外boss"
    };
getRow(19013)->
    #skill_effectCfg {
    iD = 19013,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 19013,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "45级野外boss"
    };
getRow(19014)->
    #skill_effectCfg {
    iD = 19014,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 19014,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "45级野外boss"
    };
getRow(19015)->
    #skill_effectCfg {
    iD = 19015,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 0,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "45级野外boss"
    };
getRow(19020)->
    #skill_effectCfg {
    iD = 19020,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 0,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "30级野外boss"
    };
getRow(19021)->
    #skill_effectCfg {
    iD = 19021,
    effectType = 15,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 5,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "30级野外boss"
    };
getRow(19022)->
    #skill_effectCfg {
    iD = 19022,
    effectType = 14,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 1162,
    param2 = 0,
    param3 = 1,
    param4 = 6000,
    param5 = 1,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "30级野外boss"
    };
getRow(19023)->
    #skill_effectCfg {
    iD = 19023,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 19023,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "30级野外boss"
    };
getRow(19024)->
    #skill_effectCfg {
    iD = 19024,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 0,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "35级野外boss"
    };
getRow(19025)->
    #skill_effectCfg {
    iD = 19025,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 19025,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "35级野外boss"
    };
getRow(19027)->
    #skill_effectCfg {
    iD = 19027,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 19027,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "35级野外boss"
    };
getRow(19028)->
    #skill_effectCfg {
    iD = 19028,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 19028,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "50级野外boss"
    };
getRow(19029)->
    #skill_effectCfg {
    iD = 19029,
    effectType = 14,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 1163,
    param2 = 0,
    param3 = 1,
    param4 = 2000,
    param5 = 0,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "50级野外boss"
    };
getRow(19030)->
    #skill_effectCfg {
    iD = 19030,
    effectType = 14,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 1164,
    param2 = 0,
    param3 = 1,
    param4 = 20000,
    param5 = 0,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "50级野外boss"
    };
getRow(19032)->
    #skill_effectCfg {
    iD = 19032,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 19032,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "50级野外boss"
    };
getRow(19033)->
    #skill_effectCfg {
    iD = 19033,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 19033,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "50级野外boss"
    };
getRow(19042)->
    #skill_effectCfg {
    iD = 19042,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 19042,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "首领入侵boss"
    };
getRow(19044)->
    #skill_effectCfg {
    iD = 19044,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 19044,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "首领入侵boss"
    };
getRow(19045)->
    #skill_effectCfg {
    iD = 19045,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 19045,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "首领入侵boss"
    };
getRow(19051)->
    #skill_effectCfg {
    iD = 19051,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 19051,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "家族首领"
    };
getRow(19052)->
    #skill_effectCfg {
    iD = 19052,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 19052,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "家族首领"
    };
getRow(19130)->
    #skill_effectCfg {
    iD = 19130,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 19030,
    param2 = 190301,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "50级野外boss"
    };
getRow(19141)->
    #skill_effectCfg {
    iD = 19141,
    effectType = 14,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 1601,
    param2 = 0,
    param3 = 1,
    param4 = 4000,
    param5 = 0,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "首领入侵boss"
    };
getRow(19146)->
    #skill_effectCfg {
    iD = 19146,
    effectType = 14,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 1602,
    param2 = 5,
    param3 = 1,
    param4 = 15000,
    param5 = 0,
    param6 = 5,
    param7 = 20,
    param8 = 0,
    param9 = 0,
    skillName = "首领入侵boss"
    };
getRow(20000)->
    #skill_effectCfg {
    iD = 20000,
    effectType = 14,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 15000,
    param2 = 0,
    param3 = 0,
    param4 = 2500,
    param5 = 0,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "45级野外boss"
    };
getRow(20001)->
    #skill_effectCfg {
    iD = 20001,
    effectType = 14,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 15001,
    param2 = 0,
    param3 = 0,
    param4 = 3500,
    param5 = 0,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "45级野外boss"
    };
getRow(20002)->
    #skill_effectCfg {
    iD = 20002,
    effectType = 14,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 15002,
    param2 = 0,
    param3 = 0,
    param4 = 1500,
    param5 = 0,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "45级野外boss"
    };
getRow(20003)->
    #skill_effectCfg {
    iD = 20003,
    effectType = 14,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 15003,
    param2 = 0,
    param3 = 0,
    param4 = 10000,
    param5 = 0,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "45级野外boss"
    };
getRow(20004)->
    #skill_effectCfg {
    iD = 20004,
    effectType = 14,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 15004,
    param2 = 0,
    param3 = 0,
    param4 = 3500,
    param5 = 0,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "45级野外boss"
    };
getRow(21000)->
    #skill_effectCfg {
    iD = 21000,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 21000,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "剧情拳击胖鱼技能1，减速"
    };
getRow(21001)->
    #skill_effectCfg {
    iD = 21001,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 21001,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "剧情拳击胖鱼技能2，冰冻"
    };
getRow(21002)->
    #skill_effectCfg {
    iD = 21002,
    effectType = 14,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 43,
    param2 = 0,
    param3 = 0,
    param4 = 1500,
    param5 = 0,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "剧情拳击胖鱼技能2，冰冻二段伤害载体"
    };
getRow(21003)->
    #skill_effectCfg {
    iD = 21003,
    effectType = 14,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 44,
    param2 = 0,
    param3 = 0,
    param4 = 2500,
    param5 = 0,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "剧情拳击胖鱼技能2，冰冻三段伤害载体"
    };
getRow(21005)->
    #skill_effectCfg {
    iD = 21005,
    effectType = 14,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 3,
    param1 = 220061,
    param2 = 0,
    param3 = 1,
    param4 = 10000,
    param5 = 0,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "4级剧情本boss"
    };
getRow(21006)->
    #skill_effectCfg {
    iD = 21006,
    effectType = 14,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 3,
    param1 = 220062,
    param2 = 0,
    param3 = 1,
    param4 = 4000,
    param5 = 0,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "4级剧情本boss"
    };
getRow(21008)->
    #skill_effectCfg {
    iD = 21008,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 21002,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "东城郊剧情boss技能眩晕创建"
    };
getRow(30001)->
    #skill_effectCfg {
    iD = 30001,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 30001,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "火器灵灼烧"
    };
getRow(30002)->
    #skill_effectCfg {
    iD = 30002,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 30002,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "火器灵灼烧"
    };
getRow(30003)->
    #skill_effectCfg {
    iD = 30003,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 30003,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "冰器灵冰盾"
    };
getRow(30004)->
    #skill_effectCfg {
    iD = 30004,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 30004,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "冰器灵冰盾"
    };
getRow(30005)->
    #skill_effectCfg {
    iD = 30005,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 30005,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "电器灵闪电风暴"
    };
getRow(30006)->
    #skill_effectCfg {
    iD = 30006,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 30006,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "电器灵闪电风暴"
    };
getRow(30007)->
    #skill_effectCfg {
    iD = 30007,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 30007,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "风器灵风刃"
    };
getRow(30008)->
    #skill_effectCfg {
    iD = 30008,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 30008,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "风器灵风刃"
    };
getRow(30009)->
    #skill_effectCfg {
    iD = 30009,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 30009,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "光器灵光愈"
    };
getRow(30010)->
    #skill_effectCfg {
    iD = 30010,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 30010,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "光器灵光愈"
    };
getRow(30011)->
    #skill_effectCfg {
    iD = 30011,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 30011,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "暗器灵暗灭"
    };
getRow(30012)->
    #skill_effectCfg {
    iD = 30012,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 30012,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "暗器灵暗灭"
    };
getRow(31001)->
    #skill_effectCfg {
    iD = 31001,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 31001,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "火器灵灼烧"
    };
getRow(31002)->
    #skill_effectCfg {
    iD = 31002,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 31002,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "火器灵灼烧"
    };
getRow(31003)->
    #skill_effectCfg {
    iD = 31003,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 31003,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "冰器灵冰盾"
    };
getRow(31004)->
    #skill_effectCfg {
    iD = 31004,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 31004,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "冰器灵冰盾"
    };
getRow(31005)->
    #skill_effectCfg {
    iD = 31005,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 31005,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "电器灵闪电风暴"
    };
getRow(31006)->
    #skill_effectCfg {
    iD = 31006,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 31006,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "电器灵闪电风暴"
    };
getRow(31007)->
    #skill_effectCfg {
    iD = 31007,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 31007,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "风器灵风刃"
    };
getRow(31008)->
    #skill_effectCfg {
    iD = 31008,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 31008,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "风器灵风刃"
    };
getRow(32111)->
    #skill_effectCfg {
    iD = 32111,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 32111,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "药水恢复+10%"
    };
getRow(32112)->
    #skill_effectCfg {
    iD = 32112,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 32112,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "药水恢复+20%"
    };
getRow(32113)->
    #skill_effectCfg {
    iD = 32113,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 32113,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "药水恢复+30%"
    };
getRow(32114)->
    #skill_effectCfg {
    iD = 32114,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 32114,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "药水恢复+30%"
    };
getRow(32115)->
    #skill_effectCfg {
    iD = 32115,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 32115,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "药水恢复+30%"
    };
getRow(32211)->
    #skill_effectCfg {
    iD = 32211,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 32211,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "物理防御和魔法防御+300"
    };
getRow(32212)->
    #skill_effectCfg {
    iD = 32212,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 32212,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "物理防御和魔法防御+400"
    };
getRow(32213)->
    #skill_effectCfg {
    iD = 32213,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 32213,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "物理防御和魔法防御+500"
    };
getRow(32214)->
    #skill_effectCfg {
    iD = 32214,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 32214,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "物理防御和魔法防御+600"
    };
getRow(32215)->
    #skill_effectCfg {
    iD = 32215,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 32215,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "物理防御和魔法防御+700"
    };
getRow(32311)->
    #skill_effectCfg {
    iD = 32311,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 32311,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "受到的所有伤害-5%"
    };
getRow(32312)->
    #skill_effectCfg {
    iD = 32312,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 32312,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "受到的所有伤害-10%"
    };
getRow(32313)->
    #skill_effectCfg {
    iD = 32313,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 32313,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "受到的所有伤害-15%"
    };
getRow(32314)->
    #skill_effectCfg {
    iD = 32314,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 32314,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "受到的所有伤害-20%"
    };
getRow(32315)->
    #skill_effectCfg {
    iD = 32315,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 32315,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "受到的所有伤害-25%"
    };
getRow(32411)->
    #skill_effectCfg {
    iD = 32411,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 32411,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "暴击等级+200"
    };
getRow(32412)->
    #skill_effectCfg {
    iD = 32412,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 32412,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "暴击等级+300"
    };
getRow(32413)->
    #skill_effectCfg {
    iD = 32413,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 32413,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "暴击等级+500"
    };
getRow(32414)->
    #skill_effectCfg {
    iD = 32414,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 32414,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "暴击等级+500"
    };
getRow(32415)->
    #skill_effectCfg {
    iD = 32415,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 32415,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "暴击等级+500"
    };
getRow(32511)->
    #skill_effectCfg {
    iD = 32511,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 32511,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "物理攻击和魔法攻击+50"
    };
getRow(32512)->
    #skill_effectCfg {
    iD = 32512,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 32512,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "物理攻击和魔法攻击+100"
    };
getRow(32513)->
    #skill_effectCfg {
    iD = 32513,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 32513,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "物理攻击和魔法攻击+150"
    };
getRow(32514)->
    #skill_effectCfg {
    iD = 32514,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 32514,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "物理攻击和魔法攻击+200"
    };
getRow(32515)->
    #skill_effectCfg {
    iD = 32515,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 32515,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "物理攻击和魔法攻击+250"
    };
getRow(32611)->
    #skill_effectCfg {
    iD = 32611,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 32611,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "造成的所有伤害+10%"
    };
getRow(32612)->
    #skill_effectCfg {
    iD = 32612,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 32612,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "造成的所有伤害+15%"
    };
getRow(32613)->
    #skill_effectCfg {
    iD = 32613,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 32613,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "造成的所有伤害+20%"
    };
getRow(32614)->
    #skill_effectCfg {
    iD = 32614,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 32614,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "造成的所有伤害+25%"
    };
getRow(32615)->
    #skill_effectCfg {
    iD = 32615,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 32615,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "造成的所有伤害+30%"
    };
getRow(32711)->
    #skill_effectCfg {
    iD = 32711,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 32711,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "破甲等级+200"
    };
getRow(32712)->
    #skill_effectCfg {
    iD = 32712,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 32712,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "破甲等级+300"
    };
getRow(32713)->
    #skill_effectCfg {
    iD = 32713,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 32713,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "破甲等级+500"
    };
getRow(32714)->
    #skill_effectCfg {
    iD = 32714,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 32714,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "破甲等级+500"
    };
getRow(32715)->
    #skill_effectCfg {
    iD = 32715,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 32715,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "破甲等级+500"
    };
getRow(32811)->
    #skill_effectCfg {
    iD = 32811,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 32811,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "命中等级+50"
    };
getRow(32812)->
    #skill_effectCfg {
    iD = 32812,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 32812,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "命中等级+100"
    };
getRow(32813)->
    #skill_effectCfg {
    iD = 32813,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 32813,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "命中等级+150"
    };
getRow(32814)->
    #skill_effectCfg {
    iD = 32814,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 32814,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "命中等级+200"
    };
getRow(32815)->
    #skill_effectCfg {
    iD = 32815,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 32815,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "命中等级+250"
    };
getRow(32911)->
    #skill_effectCfg {
    iD = 32911,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 32911,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "基础技能的冷却时间减少5%"
    };
getRow(32912)->
    #skill_effectCfg {
    iD = 32912,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 32912,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "基础技能的冷却时间减少6%"
    };
getRow(32913)->
    #skill_effectCfg {
    iD = 32913,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 32913,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "基础技能的冷却时间减少7%"
    };
getRow(32914)->
    #skill_effectCfg {
    iD = 32914,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 32914,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "基础技能的冷却时间减少8%"
    };
getRow(32915)->
    #skill_effectCfg {
    iD = 32915,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 32915,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "基础技能的冷却时间减少10%"
    };
getRow(33011)->
    #skill_effectCfg {
    iD = 33011,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 33011,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "闪避+100"
    };
getRow(33012)->
    #skill_effectCfg {
    iD = 33012,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 33012,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "闪避+150"
    };
getRow(33013)->
    #skill_effectCfg {
    iD = 33013,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 33013,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "闪避+200"
    };
getRow(33014)->
    #skill_effectCfg {
    iD = 33014,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 33014,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "闪避+200"
    };
getRow(33015)->
    #skill_effectCfg {
    iD = 33015,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 33015,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "闪避+200"
    };
getRow(33111)->
    #skill_effectCfg {
    iD = 33111,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 33111,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "韧性+150"
    };
getRow(33112)->
    #skill_effectCfg {
    iD = 33112,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 33112,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "韧性+200"
    };
getRow(33113)->
    #skill_effectCfg {
    iD = 33113,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 33113,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "韧性+250"
    };
getRow(33114)->
    #skill_effectCfg {
    iD = 33114,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 33114,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "韧性+300"
    };
getRow(33115)->
    #skill_effectCfg {
    iD = 33115,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 33115,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "韧性+350"
    };
getRow(33211)->
    #skill_effectCfg {
    iD = 33211,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 33211,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "骑宠伤害+5%"
    };
getRow(33212)->
    #skill_effectCfg {
    iD = 33212,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 33212,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "骑宠伤害+10%"
    };
getRow(33213)->
    #skill_effectCfg {
    iD = 33213,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 33213,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "骑宠伤害+15%"
    };
getRow(33214)->
    #skill_effectCfg {
    iD = 33214,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 33214,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "骑宠伤害+20%"
    };
getRow(33215)->
    #skill_effectCfg {
    iD = 33215,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 33215,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "骑宠伤害+25%"
    };
getRow(34000)->
    #skill_effectCfg {
    iD = 34000,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 4001,
    param2 = 1,
    param3 = 0,
    param4 = 10,
    param5 = 10,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "红色水手召唤蓝色水手"
    };
getRow(34001)->
    #skill_effectCfg {
    iD = 34001,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 4000,
    param2 = 1,
    param3 = 0,
    param4 = 10,
    param5 = 10,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "蓝色水手召唤红色水手"
    };
getRow(34003)->
    #skill_effectCfg {
    iD = 34003,
    effectType = 14,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 4007,
    param2 = 0,
    param3 = 0,
    param4 = 10000,
    param5 = 1,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "蓝色水手召唤的法阵载体"
    };
getRow(34004)->
    #skill_effectCfg {
    iD = 34004,
    effectType = 12,
    effectChance = 1,
    effectcondition = 1,
    effectTarget = 0,
    param1 = 0,
    param2 = 0.1,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "载体恢复10%生命"
    };
getRow(34005)->
    #skill_effectCfg {
    iD = 34005,
    effectType = 14,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 4008,
    param2 = 2,
    param3 = 0,
    param4 = 10000,
    param5 = 1,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "闪电锁链载体"
    };
getRow(34006)->
    #skill_effectCfg {
    iD = 34006,
    effectType = 14,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 4009,
    param2 = 0,
    param3 = 0,
    param4 = 10000,
    param5 = 1,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "诅咒区域载体"
    };
getRow(34007)->
    #skill_effectCfg {
    iD = 34007,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 65000,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "诅咒降低属性"
    };
getRow(34008)->
    #skill_effectCfg {
    iD = 34008,
    effectType = 14,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 4010,
    param2 = 2,
    param3 = 0,
    param4 = 10000,
    param5 = 1,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "沉默法阵载体"
    };
getRow(34009)->
    #skill_effectCfg {
    iD = 34009,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 25,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "范围沉默"
    };
getRow(34010)->
    #skill_effectCfg {
    iD = 34010,
    effectType = 14,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 4011,
    param2 = 5,
    param3 = 0,
    param4 = 0,
    param5 = 1,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "生成无敌领域载体"
    };
getRow(34012)->
    #skill_effectCfg {
    iD = 34012,
    effectType = 1,
    effectChance = 0.1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 65002,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "巴鲁西亚普攻附带昏迷效果"
    };
getRow(34013)->
    #skill_effectCfg {
    iD = 34013,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 372,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "真名.愤怒附加攻击提升30%"
    };
getRow(34014)->
    #skill_effectCfg {
    iD = 34014,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 4006,
    param2 = 1,
    param3 = 0,
    param4 = -15,
    param5 = -15,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "巴鲁西亚召唤守护石（真）"
    };
getRow(34015)->
    #skill_effectCfg {
    iD = 34015,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 65004,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "真名.狂暴提速100%"
    };
getRow(34016)->
    #skill_effectCfg {
    iD = 34016,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 4005,
    param2 = 4,
    param3 = 0,
    param4 = 0,
    param5 = -15,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "巴鲁西亚召唤毒气球A点"
    };
getRow(34017)->
    #skill_effectCfg {
    iD = 34017,
    effectType = 14,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 4012,
    param2 = 5,
    param3 = 0,
    param4 = 60000,
    param5 = 1,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "生成毒池"
    };
getRow(34018)->
    #skill_effectCfg {
    iD = 34018,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 4013,
    param2 = 3,
    param3 = 0,
    param4 = -15,
    param5 = 0,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "巴鲁西亚召唤守护石（假）A点"
    };
getRow(34019)->
    #skill_effectCfg {
    iD = 34019,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 4013,
    param2 = 3,
    param3 = 0,
    param4 = 15,
    param5 = -15,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "巴鲁西亚召唤守护石（假）B点"
    };
getRow(34020)->
    #skill_effectCfg {
    iD = 34020,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 4013,
    param2 = 3,
    param3 = 0,
    param4 = 15,
    param5 = 15,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "巴鲁西亚召唤守护石（假）C点"
    };
getRow(34021)->
    #skill_effectCfg {
    iD = 34021,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 4005,
    param2 = 4,
    param3 = 0,
    param4 = 0,
    param5 = 15,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "巴鲁西亚召唤毒气球B点"
    };
getRow(34022)->
    #skill_effectCfg {
    iD = 34022,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 65009,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "生成闪电锁链"
    };
getRow(34023)->
    #skill_effectCfg {
    iD = 34023,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 65011,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "生成沉默法球"
    };
getRow(34024)->
    #skill_effectCfg {
    iD = 34024,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 65007,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "巴鲁西亚无敌状态"
    };
getRow(34025)->
    #skill_effectCfg {
    iD = 34025,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 65013,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "易伤叠加BUFF"
    };
getRow(34026)->
    #skill_effectCfg {
    iD = 34026,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 65014,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "为自己释放防护罩，并增加攻击"
    };
getRow(34027)->
    #skill_effectCfg {
    iD = 34027,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 4019,
    param2 = 3,
    param3 = 0,
    param4 = -15,
    param5 = 0,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "BOSS在75%血量时会召唤野兽领主"
    };
getRow(34028)->
    #skill_effectCfg {
    iD = 34028,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 4020,
    param2 = 3,
    param3 = 0,
    param4 = 15,
    param5 = -15,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "BOSS在50%血量时会召唤野兽死亡呼唤者"
    };
getRow(34029)->
    #skill_effectCfg {
    iD = 34029,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 4021,
    param2 = 3,
    param3 = 0,
    param4 = 15,
    param5 = 15,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "BOSS在25%血量时会分别召唤地狱仆人"
    };
getRow(34030)->
    #skill_effectCfg {
    iD = 34030,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 65015,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "喊话BUFF"
    };
getRow(34031)->
    #skill_effectCfg {
    iD = 34031,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 65016,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "喊话BUFF"
    };
getRow(34032)->
    #skill_effectCfg {
    iD = 34032,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 4028,
    param2 = 1,
    param3 = 0,
    param4 = -15,
    param5 = -15,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "困难-巴鲁西亚召唤守护石（真）"
    };
getRow(34033)->
    #skill_effectCfg {
    iD = 34033,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 65004,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "困难-真名.狂暴提速100%"
    };
getRow(34034)->
    #skill_effectCfg {
    iD = 34034,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 4027,
    param2 = 4,
    param3 = 0,
    param4 = 0,
    param5 = -15,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "困难-巴鲁西亚召唤毒气球A点"
    };
getRow(34035)->
    #skill_effectCfg {
    iD = 34035,
    effectType = 14,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 4033,
    param2 = 5,
    param3 = 0,
    param4 = 60000,
    param5 = 1,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "困难-生成毒池"
    };
getRow(34036)->
    #skill_effectCfg {
    iD = 34036,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 4034,
    param2 = 3,
    param3 = 0,
    param4 = -15,
    param5 = 0,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "困难-巴鲁西亚召唤守护石（假）A点"
    };
getRow(34037)->
    #skill_effectCfg {
    iD = 34037,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 4034,
    param2 = 3,
    param3 = 0,
    param4 = 15,
    param5 = -15,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "困难-巴鲁西亚召唤守护石（假）B点"
    };
getRow(34038)->
    #skill_effectCfg {
    iD = 34038,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 4034,
    param2 = 3,
    param3 = 0,
    param4 = 15,
    param5 = 15,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "困难-巴鲁西亚召唤守护石（假）C点"
    };
getRow(34039)->
    #skill_effectCfg {
    iD = 34039,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 4027,
    param2 = 4,
    param3 = 0,
    param4 = 0,
    param5 = 15,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "困难-巴鲁西亚召唤毒气球B点"
    };
getRow(34040)->
    #skill_effectCfg {
    iD = 34040,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 4041,
    param2 = 1,
    param3 = 0,
    param4 = -15,
    param5 = -15,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "噩梦-巴鲁西亚召唤守护石（真）"
    };
getRow(34041)->
    #skill_effectCfg {
    iD = 34041,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 65004,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "噩梦-真名.狂暴提速100%"
    };
getRow(34042)->
    #skill_effectCfg {
    iD = 34042,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 4040,
    param2 = 4,
    param3 = 0,
    param4 = 0,
    param5 = -15,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "噩梦-巴鲁西亚召唤毒气球A点"
    };
getRow(34043)->
    #skill_effectCfg {
    iD = 34043,
    effectType = 14,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 4046,
    param2 = 5,
    param3 = 0,
    param4 = 60000,
    param5 = 1,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "噩梦-生成毒池"
    };
getRow(34044)->
    #skill_effectCfg {
    iD = 34044,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 4047,
    param2 = 3,
    param3 = 0,
    param4 = -15,
    param5 = 0,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "噩梦-巴鲁西亚召唤守护石（假）A点"
    };
getRow(34045)->
    #skill_effectCfg {
    iD = 34045,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 4047,
    param2 = 3,
    param3 = 0,
    param4 = 15,
    param5 = -15,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "噩梦-巴鲁西亚召唤守护石（假）B点"
    };
getRow(34046)->
    #skill_effectCfg {
    iD = 34046,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 4047,
    param2 = 3,
    param3 = 0,
    param4 = 15,
    param5 = 15,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "噩梦-巴鲁西亚召唤守护石（假）C点"
    };
getRow(34047)->
    #skill_effectCfg {
    iD = 34047,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 4040,
    param2 = 4,
    param3 = 0,
    param4 = 0,
    param5 = 15,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "噩梦-巴鲁西亚召唤毒气球B点"
    };
getRow(34050)->
    #skill_effectCfg {
    iD = 34050,
    effectType = 14,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 1170,
    param2 = 0,
    param3 = 1,
    param4 = 6000,
    param5 = 1,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0
    };
getRow(34051)->
    #skill_effectCfg {
    iD = 34051,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 4017,
    param2 = 3,
    param3 = 0,
    param4 = -15,
    param5 = 0,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "普通-地狱女仆召唤地狱之花A"
    };
getRow(34052)->
    #skill_effectCfg {
    iD = 34052,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 4017,
    param2 = 3,
    param3 = 0,
    param4 = 15,
    param5 = 15,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "普通-地狱女仆召唤地狱之花B"
    };
getRow(34053)->
    #skill_effectCfg {
    iD = 34053,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 65023,
    param2 = 65024,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "阿克里奇无敌-定身状态"
    };
getRow(34054)->
    #skill_effectCfg {
    iD = 34054,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 4103,
    param2 = 3,
    param3 = 0,
    param4 = -15,
    param5 = 0,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "困难-地狱女仆召唤地狱之花A"
    };
getRow(34055)->
    #skill_effectCfg {
    iD = 34055,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 4103,
    param2 = 3,
    param3 = 0,
    param4 = 15,
    param5 = 15,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "困难-地狱女仆召唤地狱之花B"
    };
getRow(34056)->
    #skill_effectCfg {
    iD = 34056,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 4105,
    param2 = 3,
    param3 = 0,
    param4 = -15,
    param5 = 0,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "困难-BOSS在75%血量时会召唤野兽领主"
    };
getRow(34057)->
    #skill_effectCfg {
    iD = 34057,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 4106,
    param2 = 3,
    param3 = 0,
    param4 = 15,
    param5 = -15,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "困难-BOSS在50%血量时会召唤野兽死亡呼唤者"
    };
getRow(34058)->
    #skill_effectCfg {
    iD = 34058,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 4107,
    param2 = 3,
    param3 = 0,
    param4 = 15,
    param5 = 15,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "困难-BOSS在25%血量时会分别召唤地狱仆人"
    };
getRow(34059)->
    #skill_effectCfg {
    iD = 34059,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 4111,
    param2 = 3,
    param3 = 0,
    param4 = -15,
    param5 = 0,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "噩梦-地狱女仆召唤地狱之花A"
    };
getRow(34060)->
    #skill_effectCfg {
    iD = 34060,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 4111,
    param2 = 3,
    param3 = 0,
    param4 = 15,
    param5 = 15,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "噩梦-地狱女仆召唤地狱之花B"
    };
getRow(34061)->
    #skill_effectCfg {
    iD = 34061,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 4113,
    param2 = 3,
    param3 = 0,
    param4 = -15,
    param5 = 0,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "噩梦-BOSS在75%血量时会召唤野兽领主"
    };
getRow(34062)->
    #skill_effectCfg {
    iD = 34062,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 4114,
    param2 = 3,
    param3 = 0,
    param4 = 15,
    param5 = -15,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "噩梦-BOSS在50%血量时会召唤野兽死亡呼唤者"
    };
getRow(34063)->
    #skill_effectCfg {
    iD = 34063,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 4115,
    param2 = 3,
    param3 = 0,
    param4 = 15,
    param5 = 15,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "噩梦-BOSS在25%血量时会分别召唤地狱仆人"
    };
getRow(34064)->
    #skill_effectCfg {
    iD = 34064,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 4023,
    param2 = 1,
    param3 = 0,
    param4 = 10,
    param5 = 10,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "红色水手召唤蓝色水手-困难"
    };
getRow(34065)->
    #skill_effectCfg {
    iD = 34065,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 4022,
    param2 = 1,
    param3 = 0,
    param4 = 10,
    param5 = 10,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "蓝色水手召唤红色水手-困难"
    };
getRow(34066)->
    #skill_effectCfg {
    iD = 34066,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 4036,
    param2 = 1,
    param3 = 0,
    param4 = 10,
    param5 = 10,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "红色水手召唤蓝色水手-噩梦"
    };
getRow(34067)->
    #skill_effectCfg {
    iD = 34067,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 4035,
    param2 = 1,
    param3 = 0,
    param4 = 10,
    param5 = 10,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "蓝色水手召唤红色水手-噩梦"
    };
getRow(34100)->
    #skill_effectCfg {
    iD = 34100,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 4606,
    param2 = 1,
    param3 = 0,
    param4 = -15,
    param5 = -15,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "地狱-巴鲁西亚召唤守护石（真）"
    };
getRow(34101)->
    #skill_effectCfg {
    iD = 34101,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 4607,
    param2 = 3,
    param3 = 0,
    param4 = -15,
    param5 = 0,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "地狱-巴鲁西亚召唤守护石（假）A点"
    };
getRow(34102)->
    #skill_effectCfg {
    iD = 34102,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 4607,
    param2 = 3,
    param3 = 0,
    param4 = 15,
    param5 = -15,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "地狱-巴鲁西亚召唤守护石（假）B点"
    };
getRow(34103)->
    #skill_effectCfg {
    iD = 34103,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 4607,
    param2 = 3,
    param3 = 0,
    param4 = 15,
    param5 = 15,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "地狱-巴鲁西亚召唤守护石（假）C点"
    };
getRow(34104)->
    #skill_effectCfg {
    iD = 34104,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 4616,
    param2 = 1,
    param3 = 0,
    param4 = -15,
    param5 = -15,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "地狱-巴鲁西亚召唤守护石（真）"
    };
getRow(34105)->
    #skill_effectCfg {
    iD = 34105,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 4617,
    param2 = 3,
    param3 = 0,
    param4 = -15,
    param5 = 0,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "地狱-巴鲁西亚召唤守护石（假）A点"
    };
getRow(34106)->
    #skill_effectCfg {
    iD = 34106,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 4617,
    param2 = 3,
    param3 = 0,
    param4 = 15,
    param5 = -15,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "地狱-巴鲁西亚召唤守护石（假）B点"
    };
getRow(34107)->
    #skill_effectCfg {
    iD = 34107,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 4617,
    param2 = 3,
    param3 = 0,
    param4 = 15,
    param5 = 15,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "地狱-巴鲁西亚召唤守护石（假）C点"
    };
getRow(34108)->
    #skill_effectCfg {
    iD = 34108,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 4626,
    param2 = 1,
    param3 = 0,
    param4 = -15,
    param5 = -15,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "地狱-巴鲁西亚召唤守护石（真）"
    };
getRow(34109)->
    #skill_effectCfg {
    iD = 34109,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 4627,
    param2 = 3,
    param3 = 0,
    param4 = -15,
    param5 = 0,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "地狱-巴鲁西亚召唤守护石（假）A点"
    };
getRow(34110)->
    #skill_effectCfg {
    iD = 34110,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 4627,
    param2 = 3,
    param3 = 0,
    param4 = 15,
    param5 = -15,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "地狱-巴鲁西亚召唤守护石（假）B点"
    };
getRow(34111)->
    #skill_effectCfg {
    iD = 34111,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 4627,
    param2 = 3,
    param3 = 0,
    param4 = 15,
    param5 = 15,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "地狱-巴鲁西亚召唤守护石（假）C点"
    };
getRow(34112)->
    #skill_effectCfg {
    iD = 34112,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 4636,
    param2 = 1,
    param3 = 0,
    param4 = -15,
    param5 = -15,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "地狱-巴鲁西亚召唤守护石（真）"
    };
getRow(34113)->
    #skill_effectCfg {
    iD = 34113,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 4637,
    param2 = 3,
    param3 = 0,
    param4 = -15,
    param5 = 0,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "地狱-巴鲁西亚召唤守护石（假）A点"
    };
getRow(34114)->
    #skill_effectCfg {
    iD = 34114,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 4637,
    param2 = 3,
    param3 = 0,
    param4 = 15,
    param5 = -15,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "地狱-巴鲁西亚召唤守护石（假）B点"
    };
getRow(34115)->
    #skill_effectCfg {
    iD = 34115,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 4637,
    param2 = 3,
    param3 = 0,
    param4 = 15,
    param5 = 15,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "地狱-巴鲁西亚召唤守护石（假）C点"
    };
getRow(34116)->
    #skill_effectCfg {
    iD = 34116,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 4646,
    param2 = 1,
    param3 = 0,
    param4 = -15,
    param5 = -15,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "地狱-巴鲁西亚召唤守护石（真）"
    };
getRow(34117)->
    #skill_effectCfg {
    iD = 34117,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 4647,
    param2 = 3,
    param3 = 0,
    param4 = -15,
    param5 = 0,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "地狱-巴鲁西亚召唤守护石（假）A点"
    };
getRow(34118)->
    #skill_effectCfg {
    iD = 34118,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 4647,
    param2 = 3,
    param3 = 0,
    param4 = 15,
    param5 = -15,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "地狱-巴鲁西亚召唤守护石（假）B点"
    };
getRow(34119)->
    #skill_effectCfg {
    iD = 34119,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 4647,
    param2 = 3,
    param3 = 0,
    param4 = 15,
    param5 = 15,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "地狱-巴鲁西亚召唤守护石（假）C点"
    };
getRow(34120)->
    #skill_effectCfg {
    iD = 34120,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 4656,
    param2 = 1,
    param3 = 0,
    param4 = -15,
    param5 = -15,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "地狱-巴鲁西亚召唤守护石（真）"
    };
getRow(34121)->
    #skill_effectCfg {
    iD = 34121,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 4657,
    param2 = 3,
    param3 = 0,
    param4 = -15,
    param5 = 0,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "地狱-巴鲁西亚召唤守护石（假）A点"
    };
getRow(34122)->
    #skill_effectCfg {
    iD = 34122,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 4657,
    param2 = 3,
    param3 = 0,
    param4 = 15,
    param5 = -15,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "地狱-巴鲁西亚召唤守护石（假）B点"
    };
getRow(34123)->
    #skill_effectCfg {
    iD = 34123,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 4657,
    param2 = 3,
    param3 = 0,
    param4 = 15,
    param5 = 15,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "地狱-巴鲁西亚召唤守护石（假）C点"
    };
getRow(34124)->
    #skill_effectCfg {
    iD = 34124,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 4666,
    param2 = 1,
    param3 = 0,
    param4 = -15,
    param5 = -15,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "地狱-巴鲁西亚召唤守护石（真）"
    };
getRow(34125)->
    #skill_effectCfg {
    iD = 34125,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 4667,
    param2 = 3,
    param3 = 0,
    param4 = -15,
    param5 = 0,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "地狱-巴鲁西亚召唤守护石（假）A点"
    };
getRow(34126)->
    #skill_effectCfg {
    iD = 34126,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 4667,
    param2 = 3,
    param3 = 0,
    param4 = 15,
    param5 = -15,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "地狱-巴鲁西亚召唤守护石（假）B点"
    };
getRow(34127)->
    #skill_effectCfg {
    iD = 34127,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 4667,
    param2 = 3,
    param3 = 0,
    param4 = 15,
    param5 = 15,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "地狱-巴鲁西亚召唤守护石（假）C点"
    };
getRow(34128)->
    #skill_effectCfg {
    iD = 34128,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 4676,
    param2 = 1,
    param3 = 0,
    param4 = -15,
    param5 = -15,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "地狱-巴鲁西亚召唤守护石（真）"
    };
getRow(34129)->
    #skill_effectCfg {
    iD = 34129,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 4677,
    param2 = 3,
    param3 = 0,
    param4 = -15,
    param5 = 0,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "地狱-巴鲁西亚召唤守护石（假）A点"
    };
getRow(34130)->
    #skill_effectCfg {
    iD = 34130,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 4677,
    param2 = 3,
    param3 = 0,
    param4 = 15,
    param5 = -15,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "地狱-巴鲁西亚召唤守护石（假）B点"
    };
getRow(34131)->
    #skill_effectCfg {
    iD = 34131,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 4677,
    param2 = 3,
    param3 = 0,
    param4 = 15,
    param5 = 15,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "地狱-巴鲁西亚召唤守护石（假）C点"
    };
getRow(34132)->
    #skill_effectCfg {
    iD = 34132,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 4686,
    param2 = 1,
    param3 = 0,
    param4 = -15,
    param5 = -15,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "地狱-巴鲁西亚召唤守护石（真）"
    };
getRow(34133)->
    #skill_effectCfg {
    iD = 34133,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 4687,
    param2 = 3,
    param3 = 0,
    param4 = -15,
    param5 = 0,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "地狱-巴鲁西亚召唤守护石（假）A点"
    };
getRow(34134)->
    #skill_effectCfg {
    iD = 34134,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 4687,
    param2 = 3,
    param3 = 0,
    param4 = 15,
    param5 = -15,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "地狱-巴鲁西亚召唤守护石（假）B点"
    };
getRow(34135)->
    #skill_effectCfg {
    iD = 34135,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 4687,
    param2 = 3,
    param3 = 0,
    param4 = 15,
    param5 = 15,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "地狱-巴鲁西亚召唤守护石（假）C点"
    };
getRow(34136)->
    #skill_effectCfg {
    iD = 34136,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 4696,
    param2 = 1,
    param3 = 0,
    param4 = -15,
    param5 = -15,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "地狱-巴鲁西亚召唤守护石（真）"
    };
getRow(34137)->
    #skill_effectCfg {
    iD = 34137,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 4697,
    param2 = 3,
    param3 = 0,
    param4 = -15,
    param5 = 0,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "地狱-巴鲁西亚召唤守护石（假）A点"
    };
getRow(34138)->
    #skill_effectCfg {
    iD = 34138,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 4697,
    param2 = 3,
    param3 = 0,
    param4 = 15,
    param5 = -15,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "地狱-巴鲁西亚召唤守护石（假）B点"
    };
getRow(34139)->
    #skill_effectCfg {
    iD = 34139,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 4697,
    param2 = 3,
    param3 = 0,
    param4 = 15,
    param5 = 15,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "地狱-巴鲁西亚召唤守护石（假）C点"
    };
getRow(34150)->
    #skill_effectCfg {
    iD = 34150,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 4605,
    param2 = 4,
    param3 = 0,
    param4 = 0,
    param5 = -15,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "地狱-巴鲁西亚召唤毒气球A点"
    };
getRow(34151)->
    #skill_effectCfg {
    iD = 34151,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 4605,
    param2 = 4,
    param3 = 0,
    param4 = 0,
    param5 = 15,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "地狱-巴鲁西亚召唤毒气球B点"
    };
getRow(34152)->
    #skill_effectCfg {
    iD = 34152,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 4615,
    param2 = 4,
    param3 = 0,
    param4 = 0,
    param5 = -15,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "地狱-巴鲁西亚召唤毒气球A点"
    };
getRow(34153)->
    #skill_effectCfg {
    iD = 34153,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 4615,
    param2 = 4,
    param3 = 0,
    param4 = 0,
    param5 = 15,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "地狱-巴鲁西亚召唤毒气球B点"
    };
getRow(34154)->
    #skill_effectCfg {
    iD = 34154,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 4625,
    param2 = 4,
    param3 = 0,
    param4 = 0,
    param5 = -15,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "地狱-巴鲁西亚召唤毒气球A点"
    };
getRow(34155)->
    #skill_effectCfg {
    iD = 34155,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 4625,
    param2 = 4,
    param3 = 0,
    param4 = 0,
    param5 = 15,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "地狱-巴鲁西亚召唤毒气球B点"
    };
getRow(34156)->
    #skill_effectCfg {
    iD = 34156,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 4635,
    param2 = 4,
    param3 = 0,
    param4 = 0,
    param5 = -15,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "地狱-巴鲁西亚召唤毒气球A点"
    };
getRow(34157)->
    #skill_effectCfg {
    iD = 34157,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 4635,
    param2 = 4,
    param3 = 0,
    param4 = 0,
    param5 = 15,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "地狱-巴鲁西亚召唤毒气球B点"
    };
getRow(34158)->
    #skill_effectCfg {
    iD = 34158,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 4645,
    param2 = 4,
    param3 = 0,
    param4 = 0,
    param5 = -15,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "地狱-巴鲁西亚召唤毒气球A点"
    };
getRow(34159)->
    #skill_effectCfg {
    iD = 34159,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 4645,
    param2 = 4,
    param3 = 0,
    param4 = 0,
    param5 = 15,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "地狱-巴鲁西亚召唤毒气球B点"
    };
getRow(34160)->
    #skill_effectCfg {
    iD = 34160,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 4655,
    param2 = 4,
    param3 = 0,
    param4 = 0,
    param5 = -15,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "地狱-巴鲁西亚召唤毒气球A点"
    };
getRow(34161)->
    #skill_effectCfg {
    iD = 34161,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 4655,
    param2 = 4,
    param3 = 0,
    param4 = 0,
    param5 = 15,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "地狱-巴鲁西亚召唤毒气球B点"
    };
getRow(34162)->
    #skill_effectCfg {
    iD = 34162,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 4665,
    param2 = 4,
    param3 = 0,
    param4 = 0,
    param5 = -15,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "地狱-巴鲁西亚召唤毒气球A点"
    };
getRow(34163)->
    #skill_effectCfg {
    iD = 34163,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 4665,
    param2 = 4,
    param3 = 0,
    param4 = 0,
    param5 = 15,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "地狱-巴鲁西亚召唤毒气球B点"
    };
getRow(34164)->
    #skill_effectCfg {
    iD = 34164,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 4675,
    param2 = 4,
    param3 = 0,
    param4 = 0,
    param5 = -15,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "地狱-巴鲁西亚召唤毒气球A点"
    };
getRow(34165)->
    #skill_effectCfg {
    iD = 34165,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 4675,
    param2 = 4,
    param3 = 0,
    param4 = 0,
    param5 = 15,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "地狱-巴鲁西亚召唤毒气球B点"
    };
getRow(34166)->
    #skill_effectCfg {
    iD = 34166,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 4685,
    param2 = 4,
    param3 = 0,
    param4 = 0,
    param5 = -15,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "地狱-巴鲁西亚召唤毒气球A点"
    };
getRow(34167)->
    #skill_effectCfg {
    iD = 34167,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 4685,
    param2 = 4,
    param3 = 0,
    param4 = 0,
    param5 = 15,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "地狱-巴鲁西亚召唤毒气球B点"
    };
getRow(34168)->
    #skill_effectCfg {
    iD = 34168,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 4695,
    param2 = 4,
    param3 = 0,
    param4 = 0,
    param5 = -15,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "地狱-巴鲁西亚召唤毒气球A点"
    };
getRow(34169)->
    #skill_effectCfg {
    iD = 34169,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 4695,
    param2 = 4,
    param3 = 0,
    param4 = 0,
    param5 = 15,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "地狱-巴鲁西亚召唤毒气球B点"
    };
getRow(34200)->
    #skill_effectCfg {
    iD = 34200,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 4703,
    param2 = 3,
    param3 = 0,
    param4 = -15,
    param5 = 0,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "地狱-地狱女仆召唤地狱之花A"
    };
getRow(34201)->
    #skill_effectCfg {
    iD = 34201,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 4703,
    param2 = 3,
    param3 = 0,
    param4 = 15,
    param5 = 15,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "地狱-地狱女仆召唤地狱之花B"
    };
getRow(34202)->
    #skill_effectCfg {
    iD = 34202,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 4713,
    param2 = 3,
    param3 = 0,
    param4 = -15,
    param5 = 0,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "地狱-地狱女仆召唤地狱之花A"
    };
getRow(34203)->
    #skill_effectCfg {
    iD = 34203,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 4713,
    param2 = 3,
    param3 = 0,
    param4 = 15,
    param5 = 15,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "地狱-地狱女仆召唤地狱之花B"
    };
getRow(34204)->
    #skill_effectCfg {
    iD = 34204,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 4723,
    param2 = 3,
    param3 = 0,
    param4 = -15,
    param5 = 0,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "地狱-地狱女仆召唤地狱之花A"
    };
getRow(34205)->
    #skill_effectCfg {
    iD = 34205,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 4723,
    param2 = 3,
    param3 = 0,
    param4 = 15,
    param5 = 15,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "地狱-地狱女仆召唤地狱之花B"
    };
getRow(34206)->
    #skill_effectCfg {
    iD = 34206,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 4733,
    param2 = 3,
    param3 = 0,
    param4 = -15,
    param5 = 0,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "地狱-地狱女仆召唤地狱之花A"
    };
getRow(34207)->
    #skill_effectCfg {
    iD = 34207,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 4733,
    param2 = 3,
    param3 = 0,
    param4 = 15,
    param5 = 15,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "地狱-地狱女仆召唤地狱之花B"
    };
getRow(34208)->
    #skill_effectCfg {
    iD = 34208,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 4743,
    param2 = 3,
    param3 = 0,
    param4 = -15,
    param5 = 0,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "地狱-地狱女仆召唤地狱之花A"
    };
getRow(34209)->
    #skill_effectCfg {
    iD = 34209,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 4743,
    param2 = 3,
    param3 = 0,
    param4 = 15,
    param5 = 15,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "地狱-地狱女仆召唤地狱之花B"
    };
getRow(34210)->
    #skill_effectCfg {
    iD = 34210,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 4753,
    param2 = 3,
    param3 = 0,
    param4 = -15,
    param5 = 0,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "地狱-地狱女仆召唤地狱之花A"
    };
getRow(34211)->
    #skill_effectCfg {
    iD = 34211,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 4753,
    param2 = 3,
    param3 = 0,
    param4 = 15,
    param5 = 15,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "地狱-地狱女仆召唤地狱之花B"
    };
getRow(34212)->
    #skill_effectCfg {
    iD = 34212,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 4763,
    param2 = 3,
    param3 = 0,
    param4 = -15,
    param5 = 0,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "地狱-地狱女仆召唤地狱之花A"
    };
getRow(34213)->
    #skill_effectCfg {
    iD = 34213,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 4763,
    param2 = 3,
    param3 = 0,
    param4 = 15,
    param5 = 15,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "地狱-地狱女仆召唤地狱之花B"
    };
getRow(34214)->
    #skill_effectCfg {
    iD = 34214,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 4773,
    param2 = 3,
    param3 = 0,
    param4 = -15,
    param5 = 0,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "地狱-地狱女仆召唤地狱之花A"
    };
getRow(34215)->
    #skill_effectCfg {
    iD = 34215,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 4773,
    param2 = 3,
    param3 = 0,
    param4 = 15,
    param5 = 15,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "地狱-地狱女仆召唤地狱之花B"
    };
getRow(34216)->
    #skill_effectCfg {
    iD = 34216,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 4783,
    param2 = 3,
    param3 = 0,
    param4 = -15,
    param5 = 0,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "地狱-地狱女仆召唤地狱之花A"
    };
getRow(34217)->
    #skill_effectCfg {
    iD = 34217,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 4783,
    param2 = 3,
    param3 = 0,
    param4 = 15,
    param5 = 15,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "地狱-地狱女仆召唤地狱之花B"
    };
getRow(34218)->
    #skill_effectCfg {
    iD = 34218,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 4793,
    param2 = 3,
    param3 = 0,
    param4 = -15,
    param5 = 0,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "地狱-地狱女仆召唤地狱之花A"
    };
getRow(34219)->
    #skill_effectCfg {
    iD = 34219,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 4793,
    param2 = 3,
    param3 = 0,
    param4 = 15,
    param5 = 15,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "地狱-地狱女仆召唤地狱之花B"
    };
getRow(34300)->
    #skill_effectCfg {
    iD = 34300,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 4705,
    param2 = 3,
    param3 = 0,
    param4 = -15,
    param5 = 0,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "噩梦-BOSS在75%血量时会召唤野兽领主"
    };
getRow(34301)->
    #skill_effectCfg {
    iD = 34301,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 4706,
    param2 = 3,
    param3 = 0,
    param4 = 15,
    param5 = -15,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "噩梦-BOSS在50%血量时会召唤野兽死亡呼唤者"
    };
getRow(34302)->
    #skill_effectCfg {
    iD = 34302,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 4707,
    param2 = 3,
    param3 = 0,
    param4 = 15,
    param5 = 15,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "噩梦-BOSS在25%血量时会分别召唤地狱仆人"
    };
getRow(34303)->
    #skill_effectCfg {
    iD = 34303,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 4715,
    param2 = 3,
    param3 = 0,
    param4 = -15,
    param5 = 0,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "噩梦-BOSS在75%血量时会召唤野兽领主"
    };
getRow(34304)->
    #skill_effectCfg {
    iD = 34304,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 4716,
    param2 = 3,
    param3 = 0,
    param4 = 15,
    param5 = -15,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "噩梦-BOSS在50%血量时会召唤野兽死亡呼唤者"
    };
getRow(34305)->
    #skill_effectCfg {
    iD = 34305,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 4717,
    param2 = 3,
    param3 = 0,
    param4 = 15,
    param5 = 15,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "噩梦-BOSS在25%血量时会分别召唤地狱仆人"
    };
getRow(34306)->
    #skill_effectCfg {
    iD = 34306,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 4725,
    param2 = 3,
    param3 = 0,
    param4 = -15,
    param5 = 0,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "噩梦-BOSS在75%血量时会召唤野兽领主"
    };
getRow(34307)->
    #skill_effectCfg {
    iD = 34307,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 4726,
    param2 = 3,
    param3 = 0,
    param4 = 15,
    param5 = -15,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "噩梦-BOSS在50%血量时会召唤野兽死亡呼唤者"
    };
getRow(34308)->
    #skill_effectCfg {
    iD = 34308,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 4727,
    param2 = 3,
    param3 = 0,
    param4 = 15,
    param5 = 15,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "噩梦-BOSS在25%血量时会分别召唤地狱仆人"
    };
getRow(34309)->
    #skill_effectCfg {
    iD = 34309,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 4735,
    param2 = 3,
    param3 = 0,
    param4 = -15,
    param5 = 0,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "噩梦-BOSS在75%血量时会召唤野兽领主"
    };
getRow(34310)->
    #skill_effectCfg {
    iD = 34310,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 4736,
    param2 = 3,
    param3 = 0,
    param4 = 15,
    param5 = -15,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "噩梦-BOSS在50%血量时会召唤野兽死亡呼唤者"
    };
getRow(34311)->
    #skill_effectCfg {
    iD = 34311,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 4737,
    param2 = 3,
    param3 = 0,
    param4 = 15,
    param5 = 15,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "噩梦-BOSS在25%血量时会分别召唤地狱仆人"
    };
getRow(34312)->
    #skill_effectCfg {
    iD = 34312,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 4745,
    param2 = 3,
    param3 = 0,
    param4 = -15,
    param5 = 0,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "噩梦-BOSS在75%血量时会召唤野兽领主"
    };
getRow(34313)->
    #skill_effectCfg {
    iD = 34313,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 4746,
    param2 = 3,
    param3 = 0,
    param4 = 15,
    param5 = -15,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "噩梦-BOSS在50%血量时会召唤野兽死亡呼唤者"
    };
getRow(34314)->
    #skill_effectCfg {
    iD = 34314,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 4747,
    param2 = 3,
    param3 = 0,
    param4 = 15,
    param5 = 15,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "噩梦-BOSS在25%血量时会分别召唤地狱仆人"
    };
getRow(34315)->
    #skill_effectCfg {
    iD = 34315,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 4755,
    param2 = 3,
    param3 = 0,
    param4 = -15,
    param5 = 0,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "噩梦-BOSS在75%血量时会召唤野兽领主"
    };
getRow(34316)->
    #skill_effectCfg {
    iD = 34316,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 4756,
    param2 = 3,
    param3 = 0,
    param4 = 15,
    param5 = -15,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "噩梦-BOSS在50%血量时会召唤野兽死亡呼唤者"
    };
getRow(34317)->
    #skill_effectCfg {
    iD = 34317,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 4757,
    param2 = 3,
    param3 = 0,
    param4 = 15,
    param5 = 15,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "噩梦-BOSS在25%血量时会分别召唤地狱仆人"
    };
getRow(34318)->
    #skill_effectCfg {
    iD = 34318,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 4765,
    param2 = 3,
    param3 = 0,
    param4 = -15,
    param5 = 0,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "噩梦-BOSS在75%血量时会召唤野兽领主"
    };
getRow(34319)->
    #skill_effectCfg {
    iD = 34319,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 4766,
    param2 = 3,
    param3 = 0,
    param4 = 15,
    param5 = -15,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "噩梦-BOSS在50%血量时会召唤野兽死亡呼唤者"
    };
getRow(34320)->
    #skill_effectCfg {
    iD = 34320,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 4767,
    param2 = 3,
    param3 = 0,
    param4 = 15,
    param5 = 15,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "噩梦-BOSS在25%血量时会分别召唤地狱仆人"
    };
getRow(34321)->
    #skill_effectCfg {
    iD = 34321,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 4775,
    param2 = 3,
    param3 = 0,
    param4 = -15,
    param5 = 0,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "噩梦-BOSS在75%血量时会召唤野兽领主"
    };
getRow(34322)->
    #skill_effectCfg {
    iD = 34322,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 4776,
    param2 = 3,
    param3 = 0,
    param4 = 15,
    param5 = -15,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "噩梦-BOSS在50%血量时会召唤野兽死亡呼唤者"
    };
getRow(34323)->
    #skill_effectCfg {
    iD = 34323,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 4777,
    param2 = 3,
    param3 = 0,
    param4 = 15,
    param5 = 15,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "噩梦-BOSS在25%血量时会分别召唤地狱仆人"
    };
getRow(34324)->
    #skill_effectCfg {
    iD = 34324,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 4785,
    param2 = 3,
    param3 = 0,
    param4 = -15,
    param5 = 0,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "噩梦-BOSS在75%血量时会召唤野兽领主"
    };
getRow(34325)->
    #skill_effectCfg {
    iD = 34325,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 4786,
    param2 = 3,
    param3 = 0,
    param4 = 15,
    param5 = -15,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "噩梦-BOSS在50%血量时会召唤野兽死亡呼唤者"
    };
getRow(34326)->
    #skill_effectCfg {
    iD = 34326,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 4787,
    param2 = 3,
    param3 = 0,
    param4 = 15,
    param5 = 15,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "噩梦-BOSS在25%血量时会分别召唤地狱仆人"
    };
getRow(34327)->
    #skill_effectCfg {
    iD = 34327,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 4795,
    param2 = 3,
    param3 = 0,
    param4 = -15,
    param5 = 0,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "噩梦-BOSS在75%血量时会召唤野兽领主"
    };
getRow(34328)->
    #skill_effectCfg {
    iD = 34328,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 4796,
    param2 = 3,
    param3 = 0,
    param4 = 15,
    param5 = -15,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "噩梦-BOSS在50%血量时会召唤野兽死亡呼唤者"
    };
getRow(34329)->
    #skill_effectCfg {
    iD = 34329,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 4797,
    param2 = 3,
    param3 = 0,
    param4 = 15,
    param5 = 15,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "噩梦-BOSS在25%血量时会分别召唤地狱仆人"
    };
getRow(34400)->
    #skill_effectCfg {
    iD = 34400,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 4600,
    param2 = 1,
    param3 = 0,
    param4 = 10,
    param5 = 10,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "红色水手召唤蓝色水手-地狱"
    };
getRow(34401)->
    #skill_effectCfg {
    iD = 34401,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 4601,
    param2 = 1,
    param3 = 0,
    param4 = 10,
    param5 = 10,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "蓝色水手召唤红色水手-地狱"
    };
getRow(34402)->
    #skill_effectCfg {
    iD = 34402,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 4610,
    param2 = 1,
    param3 = 0,
    param4 = 10,
    param5 = 10,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "红色水手召唤蓝色水手-地狱"
    };
getRow(34403)->
    #skill_effectCfg {
    iD = 34403,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 4611,
    param2 = 1,
    param3 = 0,
    param4 = 10,
    param5 = 10,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "蓝色水手召唤红色水手-地狱"
    };
getRow(34404)->
    #skill_effectCfg {
    iD = 34404,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 4620,
    param2 = 1,
    param3 = 0,
    param4 = 10,
    param5 = 10,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "红色水手召唤蓝色水手-地狱"
    };
getRow(34405)->
    #skill_effectCfg {
    iD = 34405,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 4621,
    param2 = 1,
    param3 = 0,
    param4 = 10,
    param5 = 10,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "蓝色水手召唤红色水手-地狱"
    };
getRow(34406)->
    #skill_effectCfg {
    iD = 34406,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 4630,
    param2 = 1,
    param3 = 0,
    param4 = 10,
    param5 = 10,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "红色水手召唤蓝色水手-地狱"
    };
getRow(34407)->
    #skill_effectCfg {
    iD = 34407,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 4631,
    param2 = 1,
    param3 = 0,
    param4 = 10,
    param5 = 10,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "蓝色水手召唤红色水手-地狱"
    };
getRow(34408)->
    #skill_effectCfg {
    iD = 34408,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 4640,
    param2 = 1,
    param3 = 0,
    param4 = 10,
    param5 = 10,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "红色水手召唤蓝色水手-地狱"
    };
getRow(34409)->
    #skill_effectCfg {
    iD = 34409,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 4641,
    param2 = 1,
    param3 = 0,
    param4 = 10,
    param5 = 10,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "蓝色水手召唤红色水手-地狱"
    };
getRow(34410)->
    #skill_effectCfg {
    iD = 34410,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 4650,
    param2 = 1,
    param3 = 0,
    param4 = 10,
    param5 = 10,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "红色水手召唤蓝色水手-地狱"
    };
getRow(34411)->
    #skill_effectCfg {
    iD = 34411,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 4651,
    param2 = 1,
    param3 = 0,
    param4 = 10,
    param5 = 10,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "蓝色水手召唤红色水手-地狱"
    };
getRow(34412)->
    #skill_effectCfg {
    iD = 34412,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 4660,
    param2 = 1,
    param3 = 0,
    param4 = 10,
    param5 = 10,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "红色水手召唤蓝色水手-地狱"
    };
getRow(34413)->
    #skill_effectCfg {
    iD = 34413,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 4661,
    param2 = 1,
    param3 = 0,
    param4 = 10,
    param5 = 10,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "蓝色水手召唤红色水手-地狱"
    };
getRow(34414)->
    #skill_effectCfg {
    iD = 34414,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 4670,
    param2 = 1,
    param3 = 0,
    param4 = 10,
    param5 = 10,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "红色水手召唤蓝色水手-地狱"
    };
getRow(34415)->
    #skill_effectCfg {
    iD = 34415,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 4671,
    param2 = 1,
    param3 = 0,
    param4 = 10,
    param5 = 10,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "蓝色水手召唤红色水手-地狱"
    };
getRow(34416)->
    #skill_effectCfg {
    iD = 34416,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 4680,
    param2 = 1,
    param3 = 0,
    param4 = 10,
    param5 = 10,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "红色水手召唤蓝色水手-地狱"
    };
getRow(34417)->
    #skill_effectCfg {
    iD = 34417,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 4681,
    param2 = 1,
    param3 = 0,
    param4 = 10,
    param5 = 10,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "蓝色水手召唤红色水手-地狱"
    };
getRow(34418)->
    #skill_effectCfg {
    iD = 34418,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 4690,
    param2 = 1,
    param3 = 0,
    param4 = 10,
    param5 = 10,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "红色水手召唤蓝色水手-地狱"
    };
getRow(34419)->
    #skill_effectCfg {
    iD = 34419,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 4691,
    param2 = 1,
    param3 = 0,
    param4 = 10,
    param5 = 10,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "蓝色水手召唤红色水手-地狱"
    };
getRow(35000)->
    #skill_effectCfg {
    iD = 35000,
    effectType = 14,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 4500,
    param2 = 0,
    param3 = 2,
    param4 = 3000,
    param5 = 0,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "阿克里奇黑暗奔流载体"
    };
getRow(40001)->
    #skill_effectCfg {
    iD = 40001,
    effectType = 1,
    effectChance = 0,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 40001,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "荼毒BUFF"
    };
getRow(40002)->
    #skill_effectCfg {
    iD = 40002,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 173,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "概率中毒BUFF"
    };
getRow(40003)->
    #skill_effectCfg {
    iD = 40003,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 40003,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "战士加攻"
    };
getRow(40004)->
    #skill_effectCfg {
    iD = 40004,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 40004,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "战士加防"
    };
getRow(40006)->
    #skill_effectCfg {
    iD = 40006,
    effectType = 15,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 3,
    param1 = 1,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "刺客普攻击退"
    };
getRow(40007)->
    #skill_effectCfg {
    iD = 40007,
    effectType = 15,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 2,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "刺客第4式击退"
    };
getRow(40008)->
    #skill_effectCfg {
    iD = 40008,
    effectType = 19,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 3,
    param1 = 40008,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "肩击概率击晕"
    };
getRow(40009)->
    #skill_effectCfg {
    iD = 40009,
    effectType = 19,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 3,
    param1 = 40009,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "敲击概率击晕"
    };
getRow(40010)->
    #skill_effectCfg {
    iD = 40010,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 3,
    param1 = 40010,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "暗斩概率流血"
    };
getRow(40011)->
    #skill_effectCfg {
    iD = 40011,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 3,
    param1 = 40011,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "快步疾走加速"
    };
getRow(40012)->
    #skill_effectCfg {
    iD = 40012,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 3,
    param1 = 40012,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "弱点侦测加暴击"
    };
getRow(40013)->
    #skill_effectCfg {
    iD = 40013,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 3,
    param1 = 40013,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "升龙斩概率击晕"
    };
getRow(40014)->
    #skill_effectCfg {
    iD = 40014,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 3,
    param1 = 40014,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "烈风突刺概率流血"
    };
getRow(40015)->
    #skill_effectCfg {
    iD = 40015,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 40015,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "强力打击暴击伤害增加"
    };
getRow(40016)->
    #skill_effectCfg {
    iD = 40016,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 3,
    param1 = 40016,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "增加法功"
    };
getRow(40017)->
    #skill_effectCfg {
    iD = 40017,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 3,
    param1 = 40017,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "恢复HP（单体）"
    };
getRow(40018)->
    #skill_effectCfg {
    iD = 40018,
    effectType = 19,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 3,
    param1 = 40018,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "概率减速"
    };
getRow(40019)->
    #skill_effectCfg {
    iD = 40019,
    effectType = 15,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 3,
    param1 = 6,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "概率震退"
    };
getRow(40020)->
    #skill_effectCfg {
    iD = 40020,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 3,
    param1 = 40020,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "神光护体（无敌）"
    };
getRow(40021)->
    #skill_effectCfg {
    iD = 40021,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 3,
    param1 = 40021,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "概率冰冻效果"
    };
getRow(40022)->
    #skill_effectCfg {
    iD = 40022,
    effectType = 19,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 3,
    param1 = 40022,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "概率减攻速"
    };
getRow(40023)->
    #skill_effectCfg {
    iD = 40023,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 3,
    param1 = 40023,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "增加法功"
    };
getRow(40024)->
    #skill_effectCfg {
    iD = 40024,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 3,
    param1 = 40024,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "概率灼烧效果"
    };
getRow(40025)->
    #skill_effectCfg {
    iD = 40025,
    effectType = 14,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 3,
    param1 = 45,
    param2 = 0,
    param3 = 0,
    param4 = 2000,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "风刃群攻"
    };
getRow(40026)->
    #skill_effectCfg {
    iD = 40026,
    effectType = 14,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 3,
    param1 = 46,
    param2 = 0,
    param3 = 0,
    param4 = 2000,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "燃焰术群攻"
    };
getRow(40027)->
    #skill_effectCfg {
    iD = 40027,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 3,
    param1 = 40027,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "降法防"
    };
getRow(40028)->
    #skill_effectCfg {
    iD = 40028,
    effectType = 14,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 3,
    param1 = 47,
    param2 = 0,
    param3 = 0,
    param4 = 2000,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "神圣审判群攻"
    };
getRow(40031)->
    #skill_effectCfg {
    iD = 40031,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 40031,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "战士技能撞击-眩晕"
    };
getRow(40032)->
    #skill_effectCfg {
    iD = 40032,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 40032,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "法师技能减速"
    };
getRow(40033)->
    #skill_effectCfg {
    iD = 40033,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 40033,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "法师技能冰冻"
    };
getRow(40034)->
    #skill_effectCfg {
    iD = 40034,
    effectType = 5,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 15,
    param2 = 0,
    param3 = 200,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "法师技能位移"
    };
getRow(40035)->
    #skill_effectCfg {
    iD = 40035,
    effectType = 3,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 1,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "法师技能解除状态"
    };
getRow(40036)->
    #skill_effectCfg {
    iD = 40036,
    effectType = 5,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 2,
    param2 = 40,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "战士普攻3 冲锋"
    };
getRow(40037)->
    #skill_effectCfg {
    iD = 40037,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 40037,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "修士-濒死脱离加抗爆"
    };
getRow(40043)->
    #skill_effectCfg {
    iD = 40043,
    effectType = 15,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 5,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "法师烈风术小击退"
    };
getRow(40044)->
    #skill_effectCfg {
    iD = 40044,
    effectType = 2,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 1,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "治疗中毒"
    };
getRow(40045)->
    #skill_effectCfg {
    iD = 40045,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 40045,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "修士魔法师的祝福增加法攻"
    };
getRow(40046)->
    #skill_effectCfg {
    iD = 40046,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 40046,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "修士魔法师的祝福增加移动速度"
    };
getRow(40048)->
    #skill_effectCfg {
    iD = 40048,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 40048,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "巫师强化睿智加法伤"
    };
getRow(40049)->
    #skill_effectCfg {
    iD = 40049,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 40049,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "概率灼烧效果"
    };
getRow(40050)->
    #skill_effectCfg {
    iD = 40050,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 40050,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "斗士-龙翔斩-眩晕"
    };
getRow(40051)->
    #skill_effectCfg {
    iD = 40051,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 40051,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "守卫-飞天斩-眩晕"
    };
getRow(40052)->
    #skill_effectCfg {
    iD = 40052,
    effectType = 7,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 0,
    param2 = 0.5,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "守卫-嘲讽-聚集目标"
    };
getRow(40053)->
    #skill_effectCfg {
    iD = 40053,
    effectType = 14,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 20000,
    param2 = 0,
    param3 = 0,
    param4 = 2000,
    param5 = 1,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "守卫-嘲讽-召唤载体"
    };
getRow(40054)->
    #skill_effectCfg {
    iD = 40054,
    effectType = 14,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 3,
    param1 = 20001,
    param2 = 0,
    param3 = 0,
    param4 = 4000,
    param5 = 1,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "巫师-冻结之风-载体持续伤害"
    };
getRow(40055)->
    #skill_effectCfg {
    iD = 40055,
    effectType = 14,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 20002,
    param2 = 0,
    param3 = 0,
    param4 = 2000,
    param5 = 0,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "守卫-嘲讽-召唤载体"
    };
getRow(40057)->
    #skill_effectCfg {
    iD = 40057,
    effectType = 14,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 3,
    param1 = 20004,
    param2 = 0,
    param3 = 0,
    param4 = 500,
    param5 = 1,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "僧侣-治疗中毒治疗载体"
    };
getRow(40058)->
    #skill_effectCfg {
    iD = 40058,
    effectType = 14,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 3,
    param1 = 20005,
    param2 = 0,
    param3 = 0,
    param4 = 500,
    param5 = 1,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "僧侣-治疗中毒中毒载体"
    };
getRow(40059)->
    #skill_effectCfg {
    iD = 40059,
    effectType = 3,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 1,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "修士-治疗技能解除状态"
    };
getRow(40060)->
    #skill_effectCfg {
    iD = 40060,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 40060,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "修士-治疗中毒中毒效果"
    };
getRow(40061)->
    #skill_effectCfg {
    iD = 40061,
    effectType = 14,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 3,
    param1 = 20006,
    param2 = 0,
    param3 = 0,
    param4 = 3000,
    param5 = 1,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "修士-神圣审判载体持续伤害"
    };
getRow(40062)->
    #skill_effectCfg {
    iD = 40062,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 40062,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "巫师-烈风术减速"
    };
getRow(40063)->
    #skill_effectCfg {
    iD = 40063,
    effectType = 15,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 20,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "斗士-局击-击退20米"
    };
getRow(40064)->
    #skill_effectCfg {
    iD = 40064,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 40064,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "斗士-战士之心-增强队友物防"
    };
getRow(40065)->
    #skill_effectCfg {
    iD = 40065,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 40065,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "斗士-强化攻击-增强自身物防"
    };
getRow(40066)->
    #skill_effectCfg {
    iD = 40066,
    effectType = 14,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 3,
    param1 = 20008,
    param2 = 0,
    param3 = 0,
    param4 = 7000,
    param5 = 1,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "修士-心之祝福载体持续治疗"
    };
getRow(40067)->
    #skill_effectCfg {
    iD = 40067,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 40067,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "守卫-局击-降低攻击"
    };
getRow(40071)->
    #skill_effectCfg {
    iD = 40071,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 40071,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "流氓-暗斩-加暴击"
    };
getRow(40072)->
    #skill_effectCfg {
    iD = 40072,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 40072,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "流氓-心脏刺激-降低法攻"
    };
getRow(40100)->
    #skill_effectCfg {
    iD = 40100,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 40100,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "战士-战士之心增强队友物攻"
    };
getRow(40101)->
    #skill_effectCfg {
    iD = 40101,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 40101,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "守卫-圣光突刺-中毒"
    };
getRow(40102)->
    #skill_effectCfg {
    iD = 40102,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 40102,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "守卫-祝福战士-增强队友防御"
    };
getRow(40103)->
    #skill_effectCfg {
    iD = 40103,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 40103,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "守卫-嘲讽-降低防御"
    };
getRow(40106)->
    #skill_effectCfg {
    iD = 40106,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 40106,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "流氓-烈风突刺-减速"
    };
getRow(40107)->
    #skill_effectCfg {
    iD = 40107,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 40107,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "刺客-暗斩-流血"
    };
getRow(40108)->
    #skill_effectCfg {
    iD = 40108,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 40108,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "刺客-快速疾走-加速加爆伤"
    };
getRow(40109)->
    #skill_effectCfg {
    iD = 40109,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 40109,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "旅者-刺针射击-定身5秒"
    };
getRow(40111)->
    #skill_effectCfg {
    iD = 40111,
    effectType = 15,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 5,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "旅者-断筋射击-击退"
    };
getRow(40112)->
    #skill_effectCfg {
    iD = 40112,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 40112,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "旅者-断筋射击-减速"
    };
getRow(40113)->
    #skill_effectCfg {
    iD = 40113,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 40113,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "旅者-快速疾走-加速爆伤"
    };
getRow(40114)->
    #skill_effectCfg {
    iD = 40114,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 40114,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "旅者-强化视野-队友加命中闪避"
    };
getRow(40116)->
    #skill_effectCfg {
    iD = 40116,
    effectType = 5,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 0.1,
    param2 = 100,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "流氓-暗斩-冲锋"
    };
getRow(40117)->
    #skill_effectCfg {
    iD = 40117,
    effectType = 5,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 0.1,
    param2 = 100,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "刺客-暗斩-冲锋"
    };
getRow(40118)->
    #skill_effectCfg {
    iD = 40118,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 40118,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "流氓-暗斩-流血"
    };
getRow(40120)->
    #skill_effectCfg {
    iD = 40120,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 40120,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "旅者-疾风-自身加命中闪避"
    };
getRow(40122)->
    #skill_effectCfg {
    iD = 40122,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 40122,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "旅者-尼达的祝福-自身加暴击"
    };
getRow(40123)->
    #skill_effectCfg {
    iD = 40123,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 40123,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "战士-强化攻击-增强自身物攻"
    };
getRow(40124)->
    #skill_effectCfg {
    iD = 40124,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 40124,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "法师烈风术-防止BUG而设定的怪物定身"
    };
getRow(40125)->
    #skill_effectCfg {
    iD = 40125,
    effectType = 14,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 3,
    param1 = 20007,
    param2 = 0,
    param3 = 0,
    param4 = 2000,
    param5 = 1,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "职业通用-虚假怪物硬值"
    };
getRow(40126)->
    #skill_effectCfg {
    iD = 40126,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 40126,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "虚假怪物硬值（冰冻）"
    };
getRow(40127)->
    #skill_effectCfg {
    iD = 40127,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 40127,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "守卫-嘲讽-强制攻击"
    };
getRow(40128)->
    #skill_effectCfg {
    iD = 40128,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 40128,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "物理防御降低"
    };
getRow(40129)->
    #skill_effectCfg {
    iD = 40129,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 40129,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "物理攻击力增加"
    };
getRow(40130)->
    #skill_effectCfg {
    iD = 40130,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 40130,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "物理防御降低"
    };
getRow(40131)->
    #skill_effectCfg {
    iD = 40131,
    effectType = 14,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 3,
    param1 = 20009,
    param2 = 0,
    param3 = 0,
    param4 = 5000,
    param5 = 0,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "旅者-漫天箭雨-载体"
    };
getRow(40132)->
    #skill_effectCfg {
    iD = 40132,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 40132,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "持续恢复"
    };
getRow(40133)->
    #skill_effectCfg {
    iD = 40133,
    effectType = 14,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 3,
    param1 = 20011,
    param2 = 0,
    param3 = 0,
    param4 = 2000,
    param5 = 1,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "法师-普攻-载体"
    };
getRow(40134)->
    #skill_effectCfg {
    iD = 40134,
    effectType = 15,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 10,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "旅者-漫天箭雨-击退"
    };
getRow(40135)->
    #skill_effectCfg {
    iD = 40135,
    effectType = 14,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 3,
    param1 = 20012,
    param2 = 0,
    param3 = 0,
    param4 = 2000,
    param5 = 1,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "修士-普攻-载体"
    };
getRow(40136)->
    #skill_effectCfg {
    iD = 40136,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 40136,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "修士-神圣审判持续伤害"
    };
getRow(40137)->
    #skill_effectCfg {
    iD = 40137,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 40137,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "步兵-十字斩物理攻击力减少"
    };
getRow(40138)->
    #skill_effectCfg {
    iD = 40138,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 40138,
    param2 = 40226,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "步兵-圣光突刺眩晕、持续伤害"
    };
getRow(40139)->
    #skill_effectCfg {
    iD = 40139,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 40139,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "步兵-盾击双攻降低"
    };
getRow(40140)->
    #skill_effectCfg {
    iD = 40140,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 40140,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "步兵-飞天斩眩晕2s"
    };
getRow(40141)->
    #skill_effectCfg {
    iD = 40141,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 40141,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "步兵-盾牌之锋物理防御力减少"
    };
getRow(40142)->
    #skill_effectCfg {
    iD = 40142,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 40142,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "步兵-爆炸毁灭反弹伤害"
    };
getRow(40143)->
    #skill_effectCfg {
    iD = 40143,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 40143,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "步兵-强化生命"
    };
getRow(40144)->
    #skill_effectCfg {
    iD = 40144,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 40144,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "步兵-范围挑衅-嘲讽"
    };
getRow(40145)->
    #skill_effectCfg {
    iD = 40145,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 40145,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "步兵-范围挑衅-增强自身双防"
    };
getRow(40146)->
    #skill_effectCfg {
    iD = 40146,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 40146,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "剑士-剑网恢恢3秒内恢复自身20%生命值"
    };
getRow(40147)->
    #skill_effectCfg {
    iD = 40147,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 40147,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "剑士-灵力增加持续回复自身的HP"
    };
getRow(40148)->
    #skill_effectCfg {
    iD = 40148,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 40148,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "剑士-斗魂增加自身的物理攻击力"
    };
getRow(40149)->
    #skill_effectCfg {
    iD = 40149,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 40149,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "佣兵-佣兵连招4加暴击BUFF,最多叠5层"
    };
getRow(40150)->
    #skill_effectCfg {
    iD = 40150,
    effectType = 10,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 0.2,
    param2 = 0.1,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "佣兵-狂暴打击-回血"
    };
getRow(40151)->
    #skill_effectCfg {
    iD = 40151,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 40151,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "佣兵-局击降低物防"
    };
getRow(40152)->
    #skill_effectCfg {
    iD = 40152,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 40152,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "佣兵-落燕斩增加物理攻击力"
    };
getRow(40153)->
    #skill_effectCfg {
    iD = 40153,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 40153,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "佣兵-地龙斩眩晕2s"
    };
getRow(40154)->
    #skill_effectCfg {
    iD = 40154,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 40154,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "佣兵-祝福战士增强队友的物防+法防"
    };
getRow(40155)->
    #skill_effectCfg {
    iD = 40155,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 40155,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "佣兵-背水一战降低生命"
    };
getRow(40156)->
    #skill_effectCfg {
    iD = 40156,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 40156,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "佣兵-背水一战增强伤害"
    };
getRow(40157)->
    #skill_effectCfg {
    iD = 40157,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 40157,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "佣兵-嘲讽"
    };
getRow(40158)->
    #skill_effectCfg {
    iD = 40158,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 40158,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "佣兵-嘲讽降低敌人双防"
    };
getRow(40159)->
    #skill_effectCfg {
    iD = 40159,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 40159,
    param2 = 0,
    param3 = 0,
    param4 = 500,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "牧师-净化&中毒净化"
    };
getRow(40160)->
    #skill_effectCfg {
    iD = 40160,
    effectType = 14,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 3,
    param1 = 20019,
    param2 = 0,
    param3 = 0,
    param4 = 7000,
    param5 = 1,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "牧师-净化&中毒中毒"
    };
getRow(40161)->
    #skill_effectCfg {
    iD = 40161,
    effectType = 3,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 1,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "牧师-净化&中毒解除状态"
    };
getRow(40162)->
    #skill_effectCfg {
    iD = 40162,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 40162,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "牧师-净化&中毒中毒效果"
    };
getRow(40163)->
    #skill_effectCfg {
    iD = 40163,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 40163,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "步兵-双重圣光突刺-眩晕3s"
    };
getRow(40164)->
    #skill_effectCfg {
    iD = 40164,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 40164,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "剑士-护身剑气减伤10%"
    };
getRow(40165)->
    #skill_effectCfg {
    iD = 40165,
    effectType = 1,
    effectChance = 0.1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 40165,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "牧师-普攻1概率给自己回血"
    };
getRow(40166)->
    #skill_effectCfg {
    iD = 40166,
    effectType = 14,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 3,
    param1 = 20020,
    param2 = 0,
    param3 = 0,
    param4 = 7000,
    param5 = 1,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "修士-心之祝福载体持续治疗"
    };
getRow(40167)->
    #skill_effectCfg {
    iD = 40167,
    effectType = 3,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 1,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "牧师-濒死脱离解除状态"
    };
getRow(40168)->
    #skill_effectCfg {
    iD = 40168,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 40168,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "牧师-神光护体增加魔法防御"
    };
getRow(40169)->
    #skill_effectCfg {
    iD = 40169,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 40169,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "牧师-持续回血"
    };
getRow(40170)->
    #skill_effectCfg {
    iD = 40170,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 40170,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "术士-火焰缠绕灼烧"
    };
getRow(40171)->
    #skill_effectCfg {
    iD = 40171,
    effectType = 1,
    effectChance = 0.5,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 40171,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "术士-暴风雪冰冻3秒"
    };
getRow(40172)->
    #skill_effectCfg {
    iD = 40172,
    effectType = 1,
    effectChance = 0.5,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 40172,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "术士-雷电击晕眩晕2秒"
    };
getRow(40173)->
    #skill_effectCfg {
    iD = 40173,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 40173,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "术士-施毒-持续伤害持续5秒"
    };
getRow(40174)->
    #skill_effectCfg {
    iD = 40174,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 40174,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "术士-施毒-定身持续5秒"
    };
getRow(40175)->
    #skill_effectCfg {
    iD = 40175,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 40175,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "术士-冻结之风冰冻3秒"
    };
getRow(40176)->
    #skill_effectCfg {
    iD = 40176,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 40176,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "术士-强化睿智增加法攻"
    };
getRow(40177)->
    #skill_effectCfg {
    iD = 40177,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 40177,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "术士-魔法师的祝福增加法攻，移动速度"
    };
getRow(40178)->
    #skill_effectCfg {
    iD = 40178,
    effectType = 1,
    effectChance = 0.5,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 40178,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "僧侣-圣光挥舞眩晕2秒"
    };
getRow(40179)->
    #skill_effectCfg {
    iD = 40179,
    effectType = 1,
    effectChance = 0.5,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 40179,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "僧侣-圣光下劈眩晕2秒"
    };
getRow(40180)->
    #skill_effectCfg {
    iD = 40180,
    effectType = 1,
    effectChance = 0.5,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 40180,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "僧侣-圣光上击眩晕2秒"
    };
getRow(40181)->
    #skill_effectCfg {
    iD = 40181,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 40181,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "僧侣-闪耀魔法加暴击10秒"
    };
getRow(40182)->
    #skill_effectCfg {
    iD = 40182,
    effectType = 14,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 3,
    param1 = 20021,
    param2 = 0,
    param3 = 0,
    param4 = 500,
    param5 = 1,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "僧侣-净化中毒净化载体"
    };
getRow(40183)->
    #skill_effectCfg {
    iD = 40183,
    effectType = 14,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 3,
    param1 = 20022,
    param2 = 0,
    param3 = 0,
    param4 = 500,
    param5 = 1,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "僧侣-净化中毒中毒载体"
    };
getRow(40184)->
    #skill_effectCfg {
    iD = 40184,
    effectType = 3,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 1,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "僧侣-净化中毒解除状态"
    };
getRow(40185)->
    #skill_effectCfg {
    iD = 40185,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 40185,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "僧侣-净化中毒中毒效果"
    };
getRow(40186)->
    #skill_effectCfg {
    iD = 40186,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 40186,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "僧侣-生命祝福增加生命30%15秒"
    };
getRow(40187)->
    #skill_effectCfg {
    iD = 40187,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 40187,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "僧侣-强化睿智增加法攻30%8秒"
    };
getRow(40188)->
    #skill_effectCfg {
    iD = 40188,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 40188,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "僧侣-遁入空门自身定身"
    };
getRow(40189)->
    #skill_effectCfg {
    iD = 40189,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 40189,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "僧侣-遁入空门自身霸体"
    };
getRow(40190)->
    #skill_effectCfg {
    iD = 40190,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 40190,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "牧师-持续回血"
    };
getRow(40191)->
    #skill_effectCfg {
    iD = 40191,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 40191,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "弓箭手-普攻3伤害加成BUFF可叠加5层"
    };
getRow(40192)->
    #skill_effectCfg {
    iD = 40192,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 40192,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "弓箭手-尖锐之箭持续流血5秒"
    };
getRow(40193)->
    #skill_effectCfg {
    iD = 40193,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 40193,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "弓箭手-尖锐之箭降低物攻5秒"
    };
getRow(40194)->
    #skill_effectCfg {
    iD = 40194,
    effectType = 15,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 5,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "弓箭手-断筋射击击退5米"
    };
getRow(40195)->
    #skill_effectCfg {
    iD = 40195,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 40195,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "弓箭手-断筋射击减速50%2秒"
    };
getRow(40196)->
    #skill_effectCfg {
    iD = 40196,
    effectType = 1,
    effectChance = 0.5,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 40196,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "弓箭手-突进射击概率沉默3秒"
    };
getRow(40197)->
    #skill_effectCfg {
    iD = 40197,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 40197,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "弓箭手-冰箭射击概率冰冻2秒"
    };
getRow(40198)->
    #skill_effectCfg {
    iD = 40198,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 40198,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "弓箭手-漫天箭雨持续伤害2秒"
    };
getRow(40199)->
    #skill_effectCfg {
    iD = 40199,
    effectType = 15,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 10,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "弓箭手-漫天箭雨击退10米"
    };
getRow(40200)->
    #skill_effectCfg {
    iD = 40200,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 40200,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "弓箭手-漫天箭雨 减速30%2秒"
    };
getRow(40201)->
    #skill_effectCfg {
    iD = 40201,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 40201,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "弓箭手-强化视野加命中，闪避30%,8秒"
    };
getRow(40202)->
    #skill_effectCfg {
    iD = 40202,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 40202,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "弓箭手-快速疾走加速40%，暴伤30%8秒"
    };
getRow(40203)->
    #skill_effectCfg {
    iD = 40203,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 40203,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "盗贼-瞬身斩持续掉血5秒"
    };
getRow(40204)->
    #skill_effectCfg {
    iD = 40204,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 40204,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "盗贼-瞬身斩加暴击25%5秒"
    };
getRow(40205)->
    #skill_effectCfg {
    iD = 40205,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 40205,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "盗贼-致命刺击降低魔攻15%6秒"
    };
getRow(40206)->
    #skill_effectCfg {
    iD = 40206,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 40206,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "盗贼-穿透刺击降低物防20%6秒"
    };
getRow(40207)->
    #skill_effectCfg {
    iD = 40207,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 40207,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "盗贼-烈风突刺减速30%3秒"
    };
getRow(40208)->
    #skill_effectCfg {
    iD = 40208,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 40208,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "盗贼-隐身12秒"
    };
getRow(40209)->
    #skill_effectCfg {
    iD = 40209,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 40209,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "盗贼-自己加爆伤"
    };
getRow(40210)->
    #skill_effectCfg {
    iD = 40210,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 40210,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "盗贼-自己加暴击"
    };
getRow(40211)->
    #skill_effectCfg {
    iD = 40211,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 40211,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "侦察兵-烈风突刺降低物法防10%,减速20%3秒"
    };
getRow(40212)->
    #skill_effectCfg {
    iD = 40212,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 40212,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "侦察兵-瞬身斩持续掉血5秒"
    };
getRow(40213)->
    #skill_effectCfg {
    iD = 40213,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 40213,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "侦察兵-致命刺激降低魔攻15%6秒"
    };
getRow(40214)->
    #skill_effectCfg {
    iD = 40214,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 40214,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "侦察兵-群体暴击队友加暴击10%3秒"
    };
getRow(40215)->
    #skill_effectCfg {
    iD = 40215,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 40215,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "侦察兵-自然恢复持续回血30%6秒"
    };
getRow(40216)->
    #skill_effectCfg {
    iD = 40216,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 40216,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "侦察兵-侧移提升闪避20%10秒"
    };
getRow(40217)->
    #skill_effectCfg {
    iD = 40217,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 40217,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "侦察兵-强化视野加命中，闪避30%,8秒"
    };
getRow(40218)->
    #skill_effectCfg {
    iD = 40218,
    effectType = 3,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 1,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "侦察兵-急退清除所有DEBUFF"
    };
getRow(40219)->
    #skill_effectCfg {
    iD = 40219,
    effectType = 1,
    effectChance = 0.5,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 40219,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "牧师-神圣审判眩晕"
    };
getRow(40220)->
    #skill_effectCfg {
    iD = 40220,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 40220,
    param2 = 41013,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0
    };
getRow(40221)->
    #skill_effectCfg {
    iD = 40221,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 40221,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "罡风剑气-增加暴击"
    };
getRow(40222)->
    #skill_effectCfg {
    iD = 40222,
    effectType = 7,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 0,
    param2 = 0.5,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "佣兵-嘲讽聚怪"
    };
getRow(40223)->
    #skill_effectCfg {
    iD = 40223,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 40223,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "心之祝福-持续回血"
    };
getRow(40225)->
    #skill_effectCfg {
    iD = 40225,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 40225,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "侦察兵-增加双防"
    };
getRow(40227)->
    #skill_effectCfg {
    iD = 40227,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 40227,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "强化攻击-增加攻击"
    };
getRow(40228)->
    #skill_effectCfg {
    iD = 40228,
    effectType = 14,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 3,
    param1 = 20025,
    param2 = 0,
    param3 = 0,
    param4 = 2000,
    param5 = 1,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "牧师-普攻-载体"
    };
getRow(40229)->
    #skill_effectCfg {
    iD = 40229,
    effectType = 14,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 3,
    param1 = 20026,
    param2 = 0,
    param3 = 0,
    param4 = 2000,
    param5 = 1,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "冻结之风载体"
    };
getRow(40230)->
    #skill_effectCfg {
    iD = 40230,
    effectType = 14,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 3,
    param1 = 20027,
    param2 = 0,
    param3 = 0,
    param4 = 4500,
    param5 = 1,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "神圣审判载体"
    };
getRow(40231)->
    #skill_effectCfg {
    iD = 40231,
    effectType = 14,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 3,
    param1 = 20028,
    param2 = 0,
    param3 = 0,
    param4 = 2000,
    param5 = 1,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "火焰缠身-载体"
    };
getRow(40232)->
    #skill_effectCfg {
    iD = 40232,
    effectType = 14,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 3,
    param1 = 20029,
    param2 = 0,
    param3 = 0,
    param4 = 500,
    param5 = 1,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "牧师-治疗中毒治疗载体"
    };
getRow(40233)->
    #skill_effectCfg {
    iD = 40233,
    effectType = 14,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 3,
    param1 = 20030,
    param2 = 0,
    param3 = 0,
    param4 = 500,
    param5 = 1,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "牧师-治疗中毒中毒载体"
    };
getRow(40234)->
    #skill_effectCfg {
    iD = 40234,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 40234,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "牧师-治疗中毒中毒效果"
    };
getRow(41000)->
    #skill_effectCfg {
    iD = 41000,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 41000,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "守卫-强化生命-上限20%持续10分钟"
    };
getRow(41001)->
    #skill_effectCfg {
    iD = 41001,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 41001,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "修士-神光护体·增加魔法防御力上限 10分钟"
    };
getRow(41002)->
    #skill_effectCfg {
    iD = 41002,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 41002,
    param2 = 41003,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "修士-游离-不可攻击，不可被攻击,减速"
    };
getRow(41004)->
    #skill_effectCfg {
    iD = 41004,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 41004,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "巫师-施毒-持续伤害"
    };
getRow(41005)->
    #skill_effectCfg {
    iD = 41005,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 41005,
    param2 = 41006,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "旅者-尖锐之箭-持续流血，降低物理攻击力"
    };
getRow(41006)->
    #skill_effectCfg {
    iD = 41006,
    effectType = 10,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 0.15,
    param2 = 0.1,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "斗士-狂暴打击-回血"
    };
getRow(41007)->
    #skill_effectCfg {
    iD = 41007,
    effectType = 5,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 2,
    param2 = 100,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "刺客-暗斩-触发技冲锋"
    };
getRow(41008)->
    #skill_effectCfg {
    iD = 41008,
    effectType = 15,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 5,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "剑士连招击退"
    };
getRow(41009)->
    #skill_effectCfg {
    iD = 41009,
    effectType = 5,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 2,
    param2 = 100,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "僧侣通用冲锋"
    };
getRow(41010)->
    #skill_effectCfg {
    iD = 41010,
    effectType = 14,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 3,
    param1 = 20031,
    param2 = 0,
    param3 = 0,
    param4 = 2000,
    param5 = 1,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "弓箭手冰箭射击载体"
    };
getRow(41011)->
    #skill_effectCfg {
    iD = 41011,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 41011,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0
    };
getRow(41012)->
    #skill_effectCfg {
    iD = 41012,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 41012,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0
    };
getRow(51000)->
    #skill_effectCfg {
    iD = 51000,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 51000,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "约会怪物减速"
    };
getRow(52001)->
    #skill_effectCfg {
    iD = 52001,
    effectType = 1,
    effectChance = 0.2,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 52001,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "材料副本冰系NPC1级冰冻"
    };
getRow(52002)->
    #skill_effectCfg {
    iD = 52002,
    effectType = 1,
    effectChance = 0.2,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 52002,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "材料副本冰系NPC2级冰冻"
    };
getRow(52003)->
    #skill_effectCfg {
    iD = 52003,
    effectType = 1,
    effectChance = 0.2,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 52003,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "材料副本冰系NPC3级冰冻"
    };
getRow(52004)->
    #skill_effectCfg {
    iD = 52004,
    effectType = 1,
    effectChance = 0.2,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 52004,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "材料副本冰系NPC4级冰冻"
    };
getRow(52011)->
    #skill_effectCfg {
    iD = 52011,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 52011,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "材料副本毒系NPC1级减速"
    };
getRow(52012)->
    #skill_effectCfg {
    iD = 52012,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 52012,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "材料副本毒系NPC2级减速"
    };
getRow(52013)->
    #skill_effectCfg {
    iD = 52013,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 52013,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "材料副本毒系NPC3级减速"
    };
getRow(52014)->
    #skill_effectCfg {
    iD = 52014,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 52014,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "材料副本毒系NPC4级减速"
    };
getRow(52021)->
    #skill_effectCfg {
    iD = 52021,
    effectType = 1,
    effectChance = 0.1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 52021,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "材料副本火系NPC1级眩晕"
    };
getRow(52022)->
    #skill_effectCfg {
    iD = 52022,
    effectType = 1,
    effectChance = 0.1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 52022,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "材料副本火系NPC2级眩晕"
    };
getRow(52023)->
    #skill_effectCfg {
    iD = 52023,
    effectType = 1,
    effectChance = 0.1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 52023,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "材料副本火系NPC3级眩晕"
    };
getRow(52024)->
    #skill_effectCfg {
    iD = 52024,
    effectType = 1,
    effectChance = 0.1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 52024,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "材料副本火系NPC4级眩晕"
    };
getRow(52031)->
    #skill_effectCfg {
    iD = 52031,
    effectType = 14,
    effectChance = 0.15,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 8800,
    param2 = 0,
    param3 = 1,
    param4 = 3000,
    param5 = 0,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "材料副本火系NPC1级减速aoe载体"
    };
getRow(52032)->
    #skill_effectCfg {
    iD = 52032,
    effectType = 14,
    effectChance = 0.15,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 8801,
    param2 = 0,
    param3 = 1,
    param4 = 3000,
    param5 = 0,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "材料副本火系NPC2级减速aoe载体"
    };
getRow(52033)->
    #skill_effectCfg {
    iD = 52033,
    effectType = 14,
    effectChance = 0.15,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 8802,
    param2 = 0,
    param3 = 1,
    param4 = 3000,
    param5 = 0,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "材料副本火系NPC3级减速aoe载体"
    };
getRow(52034)->
    #skill_effectCfg {
    iD = 52034,
    effectType = 14,
    effectChance = 0.15,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 8803,
    param2 = 0,
    param3 = 1,
    param4 = 3000,
    param5 = 0,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "材料副本火系NPC4级减速aoe载体"
    };
getRow(52041)->
    #skill_effectCfg {
    iD = 52041,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 52031,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "材料副本火系NPC1级减速aoe载体"
    };
getRow(52042)->
    #skill_effectCfg {
    iD = 52042,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 52032,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "材料副本火系NPC2级减速aoe载体"
    };
getRow(52043)->
    #skill_effectCfg {
    iD = 52043,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 52033,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "材料副本火系NPC3级减速aoe载体"
    };
getRow(52044)->
    #skill_effectCfg {
    iD = 52044,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 52034,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "材料副本火系NPC4级减速aoe载体"
    };
getRow(53000)->
    #skill_effectCfg {
    iD = 53000,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 61000,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "副本引导战士神力觉醒"
    };
getRow(53001)->
    #skill_effectCfg {
    iD = 53001,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 61001,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "副本引导战士神力觉醒被动全技能"
    };
getRow(53002)->
    #skill_effectCfg {
    iD = 53002,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 61002,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "副本引导法师神力觉醒"
    };
getRow(53003)->
    #skill_effectCfg {
    iD = 53003,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 61003,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "副本引导法师神力觉醒被动全技能"
    };
getRow(53004)->
    #skill_effectCfg {
    iD = 53004,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 61004,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "副本引导刺客神力觉醒"
    };
getRow(53005)->
    #skill_effectCfg {
    iD = 53005,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 61005,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "副本引导刺客神力觉醒被动全技能"
    };
getRow(53301)->
    #skill_effectCfg {
    iD = 53301,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 61301,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "守护之石霸体"
    };
getRow(53302)->
    #skill_effectCfg {
    iD = 53302,
    effectType = 14,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 3,
    param1 = 2143,
    param2 = 0,
    param3 = 0,
    param4 = 2000,
    param5 = 0,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "龙法师技能载体"
    };
getRow(60006)->
    #skill_effectCfg {
    iD = 60006,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 60006,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "控制女神小精灵隐藏"
    };
getRow(60010)->
    #skill_effectCfg {
    iD = 60010,
    effectType = 14,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 10,
    param2 = 0,
    param3 = 1,
    param4 = 5000,
    param5 = 0,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "觉醒技能释放伤害载体-战士"
    };
getRow(60011)->
    #skill_effectCfg {
    iD = 60011,
    effectType = 14,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 11,
    param2 = 0,
    param3 = 1,
    param4 = 2000,
    param5 = 0,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "觉醒技能释放伤害载体-战士"
    };
getRow(60012)->
    #skill_effectCfg {
    iD = 60012,
    effectType = 14,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 12,
    param2 = 0,
    param3 = 1,
    param4 = 3000,
    param5 = 0,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "觉醒技能释放伤害载体-战士"
    };
getRow(60013)->
    #skill_effectCfg {
    iD = 60013,
    effectType = 14,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 12,
    param2 = 0,
    param3 = 1,
    param4 = 3000,
    param5 = 0,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "觉醒技能释放伤害载体-战士"
    };
getRow(60014)->
    #skill_effectCfg {
    iD = 60014,
    effectType = 14,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 13,
    param2 = 0,
    param3 = 1,
    param4 = 4000,
    param5 = 0,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "觉醒技能释放伤害载体-战士"
    };
getRow(60015)->
    #skill_effectCfg {
    iD = 60015,
    effectType = 14,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 14,
    param2 = 0,
    param3 = 1,
    param4 = 4000,
    param5 = 0,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "觉醒技能释放伤害载体-战士"
    };
getRow(60020)->
    #skill_effectCfg {
    iD = 60020,
    effectType = 14,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 20,
    param2 = 0,
    param3 = 1,
    param4 = 2000,
    param5 = 0,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "觉醒技能释放伤害载体-法师"
    };
getRow(60021)->
    #skill_effectCfg {
    iD = 60021,
    effectType = 14,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 21,
    param2 = 0,
    param3 = 1,
    param4 = 2000,
    param5 = 0,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "觉醒技能释放伤害载体-法师"
    };
getRow(60022)->
    #skill_effectCfg {
    iD = 60022,
    effectType = 14,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 22,
    param2 = 0,
    param3 = 1,
    param4 = 3000,
    param5 = 0,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "觉醒技能释放伤害载体-法师"
    };
getRow(60023)->
    #skill_effectCfg {
    iD = 60023,
    effectType = 14,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 23,
    param2 = 0,
    param3 = 1,
    param4 = 3000,
    param5 = 0,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "觉醒技能释放伤害载体-法师"
    };
getRow(60024)->
    #skill_effectCfg {
    iD = 60024,
    effectType = 14,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 24,
    param2 = 0,
    param3 = 1,
    param4 = 4000,
    param5 = 0,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "觉醒技能释放伤害载体-法师"
    };
getRow(60025)->
    #skill_effectCfg {
    iD = 60025,
    effectType = 14,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 25,
    param2 = 0,
    param3 = 1,
    param4 = 5000,
    param5 = 0,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "觉醒技能释放伤害载体-法师"
    };
getRow(60030)->
    #skill_effectCfg {
    iD = 60030,
    effectType = 14,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 30,
    param2 = 0,
    param3 = 1,
    param4 = 2000,
    param5 = 0,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "觉醒技能释放伤害载体-刺客"
    };
getRow(60031)->
    #skill_effectCfg {
    iD = 60031,
    effectType = 14,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 31,
    param2 = 0,
    param3 = 1,
    param4 = 2000,
    param5 = 0,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "觉醒技能释放伤害载体-刺客"
    };
getRow(60032)->
    #skill_effectCfg {
    iD = 60032,
    effectType = 14,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 32,
    param2 = 0,
    param3 = 1,
    param4 = 3000,
    param5 = 0,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "觉醒技能释放伤害载体-刺客"
    };
getRow(60033)->
    #skill_effectCfg {
    iD = 60033,
    effectType = 14,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 33,
    param2 = 0,
    param3 = 1,
    param4 = 3000,
    param5 = 0,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "觉醒技能释放伤害载体-刺客"
    };
getRow(60034)->
    #skill_effectCfg {
    iD = 60034,
    effectType = 14,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 34,
    param2 = 0,
    param3 = 1,
    param4 = 4000,
    param5 = 0,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "觉醒技能释放伤害载体-刺客"
    };
getRow(60035)->
    #skill_effectCfg {
    iD = 60035,
    effectType = 14,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 35,
    param2 = 0,
    param3 = 1,
    param4 = 4000,
    param5 = 0,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "觉醒技能释放伤害载体-刺客"
    };
getRow(60036)->
    #skill_effectCfg {
    iD = 60036,
    effectType = 14,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 36,
    param2 = 0,
    param3 = 1,
    param4 = 5000,
    param5 = 0,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "觉醒技能释放伤害载体-刺客"
    };
getRow(61000)->
    #skill_effectCfg {
    iD = 61000,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 60011,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "虚化"
    };
getRow(65015)->
    #skill_effectCfg {
    iD = 65015,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 65015,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "请将水手兄弟拉出回血法阵！"
    };
getRow(99999)->
    #skill_effectCfg {
    iD = 99999,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 65534,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "测试延迟死亡BUFF"
    };
getRow(190020)->
    #skill_effectCfg {
    iD = 190020,
    effectType = 14,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 1152,
    param2 = 0,
    param3 = 3,
    param4 = 20000,
    param5 = 0,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "40级野外boss"
    };
getRow(190021)->
    #skill_effectCfg {
    iD = 190021,
    effectType = 14,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 1153,
    param2 = 1,
    param3 = 0,
    param4 = 10000,
    param5 = 1,
    param6 = 8,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "40级野外boss"
    };
getRow(190022)->
    #skill_effectCfg {
    iD = 190022,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 190022,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "40级野外boss"
    };
getRow(190030)->
    #skill_effectCfg {
    iD = 190030,
    effectType = 14,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 1154,
    param2 = 0,
    param3 = 1,
    param4 = 4000,
    param5 = 0,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "40级野外boss"
    };
getRow(190031)->
    #skill_effectCfg {
    iD = 190031,
    effectType = 14,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 1155,
    param2 = 0,
    param3 = 1,
    param4 = 6000,
    param5 = 0,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "40级野外boss"
    };
getRow(190032)->
    #skill_effectCfg {
    iD = 190032,
    effectType = 14,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 1156,
    param2 = 0,
    param3 = 1,
    param4 = 8000,
    param5 = 0,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "40级野外boss"
    };
getRow(190033)->
    #skill_effectCfg {
    iD = 190033,
    effectType = 14,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 1157,
    param2 = 0,
    param3 = 1,
    param4 = 2000,
    param5 = 1,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "40级野外boss"
    };
getRow(190034)->
    #skill_effectCfg {
    iD = 190034,
    effectType = 14,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 1158,
    param2 = 0,
    param3 = 1,
    param4 = 2000,
    param5 = 1,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "40级野外boss"
    };
getRow(190035)->
    #skill_effectCfg {
    iD = 190035,
    effectType = 14,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 1159,
    param2 = 0,
    param3 = 1,
    param4 = 2000,
    param5 = 1,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "40级野外boss"
    };
getRow(190036)->
    #skill_effectCfg {
    iD = 190036,
    effectType = 14,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 1161,
    param2 = 0,
    param3 = 1,
    param4 = 1500,
    param5 = 0,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "40级野外boss"
    };
getRow(190261)->
    #skill_effectCfg {
    iD = 190261,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 1150,
    param2 = 1,
    param3 = 30000,
    param4 = 10,
    param5 = 10,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "35级野外boss"
    };
getRow(190262)->
    #skill_effectCfg {
    iD = 190262,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 1150,
    param2 = 1,
    param3 = 30000,
    param4 = -10,
    param5 = 10,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "35级野外boss"
    };
getRow(190263)->
    #skill_effectCfg {
    iD = 190263,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 1150,
    param2 = 1,
    param3 = 30000,
    param4 = 10,
    param5 = -10,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "35级野外boss"
    };
getRow(190264)->
    #skill_effectCfg {
    iD = 190264,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 1150,
    param2 = 1,
    param3 = 30000,
    param4 = -10,
    param5 = -10,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "35级野外boss"
    };
getRow(190265)->
    #skill_effectCfg {
    iD = 190265,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 170550,
    param2 = 1,
    param3 = 30000,
    param4 = 10,
    param5 = 10,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "35级野外boss"
    };
getRow(190266)->
    #skill_effectCfg {
    iD = 190266,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 170550,
    param2 = 1,
    param3 = 30000,
    param4 = -10,
    param5 = 10,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "35级野外boss"
    };
getRow(190267)->
    #skill_effectCfg {
    iD = 190267,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 170550,
    param2 = 1,
    param3 = 30000,
    param4 = 10,
    param5 = -10,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "35级野外boss"
    };
getRow(190268)->
    #skill_effectCfg {
    iD = 190268,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 170550,
    param2 = 1,
    param3 = 30000,
    param4 = -10,
    param5 = -10,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "35级野外boss"
    };
getRow(190290)->
    #skill_effectCfg {
    iD = 190290,
    effectType = 14,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 11630,
    param2 = 0,
    param3 = 1,
    param4 = 2000,
    param5 = 0,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "50级野外boss"
    };
getRow(190310)->
    #skill_effectCfg {
    iD = 190310,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 1165,
    param2 = 1,
    param3 = 12000,
    param4 = 15,
    param5 = 15,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "50级野外boss"
    };
getRow(190311)->
    #skill_effectCfg {
    iD = 190311,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 1165,
    param2 = 1,
    param3 = 12000,
    param4 = -15,
    param5 = 15,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "50级野外boss"
    };
getRow(190312)->
    #skill_effectCfg {
    iD = 190312,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 1165,
    param2 = 1,
    param3 = 12000,
    param4 = 15,
    param5 = -15,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "50级野外boss"
    };
getRow(190313)->
    #skill_effectCfg {
    iD = 190313,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 1165,
    param2 = 1,
    param3 = 12000,
    param4 = -15,
    param5 = -15,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "50级野外boss"
    };
getRow(190314)->
    #skill_effectCfg {
    iD = 190314,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 17101,
    param2 = 1,
    param3 = 12000,
    param4 = 15,
    param5 = 15,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "50级野外boss"
    };
getRow(190315)->
    #skill_effectCfg {
    iD = 190315,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 17101,
    param2 = 1,
    param3 = 12000,
    param4 = -15,
    param5 = 15,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "50级野外boss"
    };
getRow(190316)->
    #skill_effectCfg {
    iD = 190316,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 17101,
    param2 = 1,
    param3 = 12000,
    param4 = 15,
    param5 = -15,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "50级野外boss"
    };
getRow(190317)->
    #skill_effectCfg {
    iD = 190317,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 17101,
    param2 = 1,
    param3 = 12000,
    param4 = -15,
    param5 = -15,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "50级野外boss"
    };
getRow(190340)->
    #skill_effectCfg {
    iD = 190340,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 1166,
    param2 = 1,
    param3 = 30000,
    param4 = 8,
    param5 = 0,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "50级野外boss"
    };
getRow(190341)->
    #skill_effectCfg {
    iD = 190341,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 1166,
    param2 = 1,
    param3 = 30000,
    param4 = 0,
    param5 = 8,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "50级野外boss"
    };
getRow(190342)->
    #skill_effectCfg {
    iD = 190342,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 1167,
    param2 = 1,
    param3 = 30000,
    param4 = 8,
    param5 = 8,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "50级野外boss"
    };
getRow(190343)->
    #skill_effectCfg {
    iD = 190343,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 17102,
    param2 = 1,
    param3 = 30000,
    param4 = 8,
    param5 = 0,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "50级野外boss"
    };
getRow(190344)->
    #skill_effectCfg {
    iD = 190344,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 17102,
    param2 = 1,
    param3 = 30000,
    param4 = 0,
    param5 = 8,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "50级野外boss"
    };
getRow(190345)->
    #skill_effectCfg {
    iD = 190345,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 17103,
    param2 = 1,
    param3 = 30000,
    param4 = 8,
    param5 = 8,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "50级野外boss"
    };
getRow(190410)->
    #skill_effectCfg {
    iD = 190410,
    effectType = 14,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 1510,
    param2 = 5,
    param3 = 1,
    param4 = 2500,
    param5 = 0,
    param6 = 10,
    param7 = 40,
    param8 = 0,
    param9 = 0,
    skillName = "首领入侵boss"
    };
getRow(190411)->
    #skill_effectCfg {
    iD = 190411,
    effectType = 14,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 1511,
    param2 = 5,
    param3 = 1,
    param4 = 5000,
    param5 = 0,
    param6 = 10,
    param7 = 40,
    param8 = 0,
    param9 = 0,
    skillName = "首领入侵boss"
    };
getRow(190412)->
    #skill_effectCfg {
    iD = 190412,
    effectType = 14,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 1512,
    param2 = 5,
    param3 = 1,
    param4 = 8000,
    param5 = 0,
    param6 = 10,
    param7 = 40,
    param8 = 0,
    param9 = 0,
    skillName = "首领入侵boss"
    };
getRow(190413)->
    #skill_effectCfg {
    iD = 190413,
    effectType = 14,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 1513,
    param2 = 5,
    param3 = 1,
    param4 = 10000,
    param5 = 0,
    param6 = 10,
    param7 = 40,
    param8 = 0,
    param9 = 0,
    skillName = "首领入侵boss"
    };
getRow(190414)->
    #skill_effectCfg {
    iD = 190414,
    effectType = 14,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 1514,
    param2 = 5,
    param3 = 1,
    param4 = 13000,
    param5 = 0,
    param6 = 10,
    param7 = 40,
    param8 = 0,
    param9 = 0,
    skillName = "首领入侵boss"
    };
getRow(190415)->
    #skill_effectCfg {
    iD = 190415,
    effectType = 14,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 1515,
    param2 = 5,
    param3 = 1,
    param4 = 16000,
    param5 = 0,
    param6 = 10,
    param7 = 40,
    param8 = 0,
    param9 = 0,
    skillName = "首领入侵boss"
    };
getRow(190520)->
    #skill_effectCfg {
    iD = 190520,
    effectType = 14,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 3620,
    param2 = 2,
    param3 = 1,
    param4 = 20000,
    param5 = 1,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "家族首领"
    };
getRow(190541)->
    #skill_effectCfg {
    iD = 190541,
    effectType = 14,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 3651,
    param2 = 0,
    param3 = 1,
    param4 = 800,
    param5 = 0,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "40级野外boss"
    };
getRow(190542)->
    #skill_effectCfg {
    iD = 190542,
    effectType = 14,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 3652,
    param2 = 0,
    param3 = 1,
    param4 = 1500,
    param5 = 0,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "40级野外boss"
    };
getRow(190543)->
    #skill_effectCfg {
    iD = 190543,
    effectType = 14,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 3653,
    param2 = 0,
    param3 = 1,
    param4 = 2500,
    param5 = 0,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "40级野外boss"
    };
getRow(190544)->
    #skill_effectCfg {
    iD = 190544,
    effectType = 14,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 3654,
    param2 = 0,
    param3 = 1,
    param4 = 1000,
    param5 = 1,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "40级野外boss"
    };
getRow(190545)->
    #skill_effectCfg {
    iD = 190545,
    effectType = 14,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 3655,
    param2 = 0,
    param3 = 1,
    param4 = 1000,
    param5 = 1,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "40级野外boss"
    };
getRow(190546)->
    #skill_effectCfg {
    iD = 190546,
    effectType = 14,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 3656,
    param2 = 0,
    param3 = 1,
    param4 = 1000,
    param5 = 1,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "40级野外boss"
    };
getRow(191460)->
    #skill_effectCfg {
    iD = 191460,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 191460,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "首领入侵boss"
    };
getRow(191461)->
    #skill_effectCfg {
    iD = 191461,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 191461,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "首领入侵boss"
    };
getRow(191470)->
    #skill_effectCfg {
    iD = 191470,
    effectType = 14,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 1603,
    param2 = 0,
    param3 = 1,
    param4 = 5000,
    param5 = 0,
    param6 = 1,
    param7 = 0,
    param8 = 18,
    param9 = 0,
    skillName = "首领入侵boss"
    };
getRow(191471)->
    #skill_effectCfg {
    iD = 191471,
    effectType = 14,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 1603,
    param2 = 0,
    param3 = 1,
    param4 = 5000,
    param5 = 0,
    param6 = 1,
    param7 = 0,
    param8 = 12,
    param9 = 0,
    skillName = "首领入侵boss"
    };
getRow(191472)->
    #skill_effectCfg {
    iD = 191472,
    effectType = 14,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 1603,
    param2 = 0,
    param3 = 1,
    param4 = 5000,
    param5 = 0,
    param6 = 1,
    param7 = 0,
    param8 = 6,
    param9 = 0,
    skillName = "首领入侵boss"
    };
getRow(191473)->
    #skill_effectCfg {
    iD = 191473,
    effectType = 14,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 1603,
    param2 = 0,
    param3 = 1,
    param4 = 5000,
    param5 = 0,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "首领入侵boss"
    };
getRow(191474)->
    #skill_effectCfg {
    iD = 191474,
    effectType = 14,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 1603,
    param2 = 0,
    param3 = 1,
    param4 = 5000,
    param5 = 0,
    param6 = 1,
    param7 = 0,
    param8 = -6,
    param9 = 0,
    skillName = "首领入侵boss"
    };
getRow(191475)->
    #skill_effectCfg {
    iD = 191475,
    effectType = 14,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 1603,
    param2 = 0,
    param3 = 1,
    param4 = 5000,
    param5 = 0,
    param6 = 1,
    param7 = 0,
    param8 = -12,
    param9 = 0,
    skillName = "首领入侵boss"
    };
getRow(191476)->
    #skill_effectCfg {
    iD = 191476,
    effectType = 14,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 1603,
    param2 = 0,
    param3 = 1,
    param4 = 5000,
    param5 = 0,
    param6 = 1,
    param7 = 0,
    param8 = -18,
    param9 = 0,
    skillName = "首领入侵boss"
    };
getRow(191530)->
    #skill_effectCfg {
    iD = 191530,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 3600,
    param2 = 1,
    param3 = 60000,
    param4 = 0,
    param5 = 20,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "家族首领"
    };
getRow(191531)->
    #skill_effectCfg {
    iD = 191531,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 3600,
    param2 = 1,
    param3 = 60000,
    param4 = 14.1,
    param5 = -14.1,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "家族首领"
    };
getRow(191532)->
    #skill_effectCfg {
    iD = 191532,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 3600,
    param2 = 1,
    param3 = 60000,
    param4 = -14.1,
    param5 = -14.1,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "家族首领"
    };
getRow(191533)->
    #skill_effectCfg {
    iD = 191533,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 3601,
    param2 = 1,
    param3 = 60000,
    param4 = 0,
    param5 = 20,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "家族首领"
    };
getRow(191534)->
    #skill_effectCfg {
    iD = 191534,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 3601,
    param2 = 1,
    param3 = 60000,
    param4 = 14.1,
    param5 = -14.1,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "家族首领"
    };
getRow(191535)->
    #skill_effectCfg {
    iD = 191535,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 3601,
    param2 = 1,
    param3 = 60000,
    param4 = -14.1,
    param5 = -14.1,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "家族首领"
    };
getRow(191536)->
    #skill_effectCfg {
    iD = 191536,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 3602,
    param2 = 1,
    param3 = 60000,
    param4 = 0,
    param5 = 20,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "家族首领"
    };
getRow(191537)->
    #skill_effectCfg {
    iD = 191537,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 3602,
    param2 = 1,
    param3 = 60000,
    param4 = 14.1,
    param5 = -14.1,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "家族首领"
    };
getRow(191538)->
    #skill_effectCfg {
    iD = 191538,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 3602,
    param2 = 1,
    param3 = 60000,
    param4 = -14.1,
    param5 = -14.1,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "家族首领"
    };
getRow(191539)->
    #skill_effectCfg {
    iD = 191539,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 3603,
    param2 = 1,
    param3 = 60000,
    param4 = 0,
    param5 = 20,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "家族首领"
    };
getRow(191540)->
    #skill_effectCfg {
    iD = 191540,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 3603,
    param2 = 1,
    param3 = 60000,
    param4 = 14.1,
    param5 = -14.1,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "家族首领"
    };
getRow(191541)->
    #skill_effectCfg {
    iD = 191541,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 3603,
    param2 = 1,
    param3 = 60000,
    param4 = -14.1,
    param5 = -14.1,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "家族首领"
    };
getRow(191542)->
    #skill_effectCfg {
    iD = 191542,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 3604,
    param2 = 1,
    param3 = 60000,
    param4 = 0,
    param5 = 20,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "家族首领"
    };
getRow(191543)->
    #skill_effectCfg {
    iD = 191543,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 3604,
    param2 = 1,
    param3 = 60000,
    param4 = 14.1,
    param5 = -14.1,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "家族首领"
    };
getRow(191544)->
    #skill_effectCfg {
    iD = 191544,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 3604,
    param2 = 1,
    param3 = 60000,
    param4 = -14.1,
    param5 = -14.1,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "家族首领"
    };
getRow(191545)->
    #skill_effectCfg {
    iD = 191545,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 3605,
    param2 = 1,
    param3 = 60000,
    param4 = 0,
    param5 = 20,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "家族首领"
    };
getRow(191546)->
    #skill_effectCfg {
    iD = 191546,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 3605,
    param2 = 1,
    param3 = 60000,
    param4 = 14.1,
    param5 = -14.1,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "家族首领"
    };
getRow(191547)->
    #skill_effectCfg {
    iD = 191547,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 3605,
    param2 = 1,
    param3 = 60000,
    param4 = -14.1,
    param5 = -14.1,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "家族首领"
    };
getRow(191548)->
    #skill_effectCfg {
    iD = 191548,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 3606,
    param2 = 1,
    param3 = 60000,
    param4 = 0,
    param5 = 20,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "家族首领"
    };
getRow(191549)->
    #skill_effectCfg {
    iD = 191549,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 3606,
    param2 = 1,
    param3 = 60000,
    param4 = 14.1,
    param5 = -14.1,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "家族首领"
    };
getRow(191550)->
    #skill_effectCfg {
    iD = 191550,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 3606,
    param2 = 1,
    param3 = 60000,
    param4 = -14.1,
    param5 = -14.1,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "家族首领"
    };
getRow(191551)->
    #skill_effectCfg {
    iD = 191551,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 3607,
    param2 = 1,
    param3 = 60000,
    param4 = 0,
    param5 = 20,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "家族首领"
    };
getRow(191552)->
    #skill_effectCfg {
    iD = 191552,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 3607,
    param2 = 1,
    param3 = 60000,
    param4 = 14.1,
    param5 = -14.1,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "家族首领"
    };
getRow(191553)->
    #skill_effectCfg {
    iD = 191553,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 3607,
    param2 = 1,
    param3 = 60000,
    param4 = -14.1,
    param5 = -14.1,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "家族首领"
    };
getRow(191554)->
    #skill_effectCfg {
    iD = 191554,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 3608,
    param2 = 1,
    param3 = 60000,
    param4 = 0,
    param5 = 20,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "家族首领"
    };
getRow(191555)->
    #skill_effectCfg {
    iD = 191555,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 3608,
    param2 = 1,
    param3 = 60000,
    param4 = 14.1,
    param5 = -14.1,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "家族首领"
    };
getRow(191556)->
    #skill_effectCfg {
    iD = 191556,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 3608,
    param2 = 1,
    param3 = 60000,
    param4 = -14.1,
    param5 = -14.1,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "家族首领"
    };
getRow(191557)->
    #skill_effectCfg {
    iD = 191557,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 3609,
    param2 = 1,
    param3 = 60000,
    param4 = 0,
    param5 = 20,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "家族首领"
    };
getRow(191558)->
    #skill_effectCfg {
    iD = 191558,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 3609,
    param2 = 1,
    param3 = 60000,
    param4 = 14.1,
    param5 = -14.1,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "家族首领"
    };
getRow(191559)->
    #skill_effectCfg {
    iD = 191559,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 3609,
    param2 = 1,
    param3 = 60000,
    param4 = -14.1,
    param5 = -14.1,
    param6 = 1,
    param7 = 0,
    param8 = 0,
    param9 = 0,
    skillName = "家族首领"
    };
getRow(_)->[].

getKeyList()->[
    {0},
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
    {97},
    {98},
    {99},
    {100},
    {101},
    {103},
    {104},
    {105},
    {106},
    {107},
    {108},
    {113},
    {118},
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
    {136},
    {137},
    {138},
    {139},
    {140},
    {141},
    {142},
    {143},
    {144},
    {145},
    {146},
    {147},
    {148},
    {149},
    {150},
    {151},
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
    {165},
    {166},
    {167},
    {168},
    {169},
    {170},
    {171},
    {172},
    {173},
    {174},
    {175},
    {176},
    {177},
    {178},
    {179},
    {180},
    {181},
    {182},
    {183},
    {184},
    {185},
    {186},
    {187},
    {188},
    {189},
    {190},
    {191},
    {192},
    {193},
    {194},
    {195},
    {196},
    {197},
    {198},
    {199},
    {200},
    {201},
    {202},
    {203},
    {204},
    {205},
    {206},
    {207},
    {208},
    {209},
    {210},
    {211},
    {212},
    {213},
    {214},
    {215},
    {216},
    {217},
    {218},
    {219},
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
    {300},
    {301},
    {302},
    {303},
    {304},
    {305},
    {306},
    {307},
    {308},
    {309},
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
    {344},
    {345},
    {346},
    {347},
    {348},
    {349},
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
    {400},
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
    {2001},
    {2002},
    {2003},
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
    {2548},
    {3201},
    {3202},
    {3203},
    {3204},
    {3300},
    {3301},
    {3302},
    {3505},
    {3506},
    {3507},
    {3508},
    {3509},
    {3510},
    {3511},
    {3512},
    {3513},
    {3514},
    {3515},
    {3516},
    {3517},
    {3518},
    {3519},
    {3520},
    {3521},
    {3522},
    {3523},
    {3524},
    {3525},
    {3526},
    {3527},
    {3528},
    {3529},
    {3530},
    {3531},
    {3532},
    {3533},
    {3534},
    {4022},
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
    {5019},
    {5020},
    {5021},
    {5022},
    {5023},
    {5024},
    {5025},
    {5026},
    {5027},
    {5028},
    {5029},
    {5030},
    {5031},
    {5032},
    {5033},
    {5034},
    {5035},
    {5036},
    {5037},
    {5038},
    {5039},
    {5100},
    {5101},
    {5102},
    {5104},
    {5105},
    {5153},
    {5154},
    {5155},
    {5156},
    {5157},
    {5158},
    {5159},
    {5160},
    {5161},
    {5162},
    {5163},
    {5164},
    {5165},
    {5166},
    {5167},
    {5168},
    {5201},
    {5202},
    {5203},
    {5204},
    {5205},
    {5206},
    {5207},
    {5208},
    {5209},
    {5210},
    {5211},
    {5212},
    {5213},
    {5214},
    {5216},
    {5217},
    {5218},
    {5219},
    {5220},
    {5221},
    {5222},
    {5223},
    {5224},
    {5225},
    {5226},
    {5227},
    {5228},
    {5229},
    {5230},
    {5231},
    {5232},
    {5233},
    {5234},
    {5235},
    {5236},
    {5237},
    {5238},
    {5239},
    {5240},
    {5241},
    {5242},
    {5243},
    {5244},
    {5245},
    {5246},
    {5247},
    {5248},
    {5249},
    {5250},
    {5251},
    {5252},
    {5253},
    {5254},
    {5255},
    {5256},
    {5257},
    {5258},
    {5259},
    {5260},
    {5261},
    {5262},
    {5263},
    {5264},
    {5265},
    {5266},
    {5267},
    {5268},
    {5269},
    {5270},
    {5271},
    {5272},
    {5273},
    {5274},
    {5275},
    {5276},
    {5277},
    {5278},
    {5279},
    {5280},
    {5300},
    {5302},
    {5303},
    {5304},
    {5305},
    {5311},
    {5312},
    {5313},
    {5314},
    {5315},
    {6549},
    {6550},
    {7011},
    {7012},
    {7013},
    {7014},
    {7015},
    {7021},
    {7022},
    {7023},
    {7024},
    {7025},
    {7031},
    {7032},
    {7033},
    {7034},
    {7035},
    {7041},
    {7042},
    {7043},
    {7044},
    {7045},
    {7111},
    {7112},
    {7113},
    {7114},
    {7115},
    {7121},
    {7122},
    {7123},
    {7124},
    {7125},
    {7131},
    {7132},
    {7133},
    {7134},
    {7135},
    {7141},
    {7142},
    {7143},
    {7144},
    {7145},
    {7211},
    {7212},
    {7213},
    {7214},
    {7311},
    {7312},
    {7313},
    {7314},
    {7315},
    {7321},
    {7322},
    {7323},
    {7324},
    {7325},
    {7331},
    {7332},
    {7333},
    {7334},
    {7335},
    {7341},
    {7342},
    {7343},
    {7344},
    {7345},
    {7411},
    {7421},
    {7431},
    {7441},
    {8002},
    {8003},
    {8004},
    {8005},
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
    {10026},
    {10027},
    {10028},
    {10029},
    {10030},
    {10031},
    {10032},
    {10033},
    {12101},
    {12201},
    {13007},
    {13302},
    {13303},
    {13304},
    {13500},
    {13501},
    {13502},
    {13503},
    {13504},
    {14008},
    {15007},
    {15010},
    {15020},
    {16000},
    {16001},
    {16002},
    {16003},
    {16004},
    {16005},
    {16007},
    {16008},
    {16010},
    {16012},
    {16013},
    {16014},
    {16015},
    {16016},
    {16017},
    {16018},
    {16019},
    {16020},
    {16021},
    {16022},
    {16023},
    {16024},
    {16025},
    {16026},
    {16027},
    {16028},
    {16029},
    {16030},
    {16031},
    {16034},
    {16035},
    {16036},
    {16037},
    {16038},
    {16039},
    {16040},
    {16041},
    {16042},
    {16043},
    {16044},
    {16045},
    {16046},
    {16047},
    {16048},
    {16049},
    {16050},
    {16053},
    {16054},
    {16055},
    {16056},
    {16057},
    {16058},
    {16060},
    {16061},
    {16062},
    {16063},
    {16064},
    {16065},
    {16066},
    {16067},
    {16068},
    {16069},
    {16071},
    {16072},
    {16073},
    {16074},
    {16075},
    {19000},
    {19001},
    {19002},
    {19003},
    {19004},
    {19012},
    {19013},
    {19014},
    {19015},
    {19020},
    {19021},
    {19022},
    {19023},
    {19024},
    {19025},
    {19027},
    {19028},
    {19029},
    {19030},
    {19032},
    {19033},
    {19042},
    {19044},
    {19045},
    {19051},
    {19052},
    {19130},
    {19141},
    {19146},
    {20000},
    {20001},
    {20002},
    {20003},
    {20004},
    {21000},
    {21001},
    {21002},
    {21003},
    {21005},
    {21006},
    {21008},
    {30001},
    {30002},
    {30003},
    {30004},
    {30005},
    {30006},
    {30007},
    {30008},
    {30009},
    {30010},
    {30011},
    {30012},
    {31001},
    {31002},
    {31003},
    {31004},
    {31005},
    {31006},
    {31007},
    {31008},
    {32111},
    {32112},
    {32113},
    {32114},
    {32115},
    {32211},
    {32212},
    {32213},
    {32214},
    {32215},
    {32311},
    {32312},
    {32313},
    {32314},
    {32315},
    {32411},
    {32412},
    {32413},
    {32414},
    {32415},
    {32511},
    {32512},
    {32513},
    {32514},
    {32515},
    {32611},
    {32612},
    {32613},
    {32614},
    {32615},
    {32711},
    {32712},
    {32713},
    {32714},
    {32715},
    {32811},
    {32812},
    {32813},
    {32814},
    {32815},
    {32911},
    {32912},
    {32913},
    {32914},
    {32915},
    {33011},
    {33012},
    {33013},
    {33014},
    {33015},
    {33111},
    {33112},
    {33113},
    {33114},
    {33115},
    {33211},
    {33212},
    {33213},
    {33214},
    {33215},
    {34000},
    {34001},
    {34003},
    {34004},
    {34005},
    {34006},
    {34007},
    {34008},
    {34009},
    {34010},
    {34012},
    {34013},
    {34014},
    {34015},
    {34016},
    {34017},
    {34018},
    {34019},
    {34020},
    {34021},
    {34022},
    {34023},
    {34024},
    {34025},
    {34026},
    {34027},
    {34028},
    {34029},
    {34030},
    {34031},
    {34032},
    {34033},
    {34034},
    {34035},
    {34036},
    {34037},
    {34038},
    {34039},
    {34040},
    {34041},
    {34042},
    {34043},
    {34044},
    {34045},
    {34046},
    {34047},
    {34050},
    {34051},
    {34052},
    {34053},
    {34054},
    {34055},
    {34056},
    {34057},
    {34058},
    {34059},
    {34060},
    {34061},
    {34062},
    {34063},
    {34064},
    {34065},
    {34066},
    {34067},
    {34100},
    {34101},
    {34102},
    {34103},
    {34104},
    {34105},
    {34106},
    {34107},
    {34108},
    {34109},
    {34110},
    {34111},
    {34112},
    {34113},
    {34114},
    {34115},
    {34116},
    {34117},
    {34118},
    {34119},
    {34120},
    {34121},
    {34122},
    {34123},
    {34124},
    {34125},
    {34126},
    {34127},
    {34128},
    {34129},
    {34130},
    {34131},
    {34132},
    {34133},
    {34134},
    {34135},
    {34136},
    {34137},
    {34138},
    {34139},
    {34150},
    {34151},
    {34152},
    {34153},
    {34154},
    {34155},
    {34156},
    {34157},
    {34158},
    {34159},
    {34160},
    {34161},
    {34162},
    {34163},
    {34164},
    {34165},
    {34166},
    {34167},
    {34168},
    {34169},
    {34200},
    {34201},
    {34202},
    {34203},
    {34204},
    {34205},
    {34206},
    {34207},
    {34208},
    {34209},
    {34210},
    {34211},
    {34212},
    {34213},
    {34214},
    {34215},
    {34216},
    {34217},
    {34218},
    {34219},
    {34300},
    {34301},
    {34302},
    {34303},
    {34304},
    {34305},
    {34306},
    {34307},
    {34308},
    {34309},
    {34310},
    {34311},
    {34312},
    {34313},
    {34314},
    {34315},
    {34316},
    {34317},
    {34318},
    {34319},
    {34320},
    {34321},
    {34322},
    {34323},
    {34324},
    {34325},
    {34326},
    {34327},
    {34328},
    {34329},
    {34400},
    {34401},
    {34402},
    {34403},
    {34404},
    {34405},
    {34406},
    {34407},
    {34408},
    {34409},
    {34410},
    {34411},
    {34412},
    {34413},
    {34414},
    {34415},
    {34416},
    {34417},
    {34418},
    {34419},
    {35000},
    {40001},
    {40002},
    {40003},
    {40004},
    {40006},
    {40007},
    {40008},
    {40009},
    {40010},
    {40011},
    {40012},
    {40013},
    {40014},
    {40015},
    {40016},
    {40017},
    {40018},
    {40019},
    {40020},
    {40021},
    {40022},
    {40023},
    {40024},
    {40025},
    {40026},
    {40027},
    {40028},
    {40031},
    {40032},
    {40033},
    {40034},
    {40035},
    {40036},
    {40037},
    {40043},
    {40044},
    {40045},
    {40046},
    {40048},
    {40049},
    {40050},
    {40051},
    {40052},
    {40053},
    {40054},
    {40055},
    {40057},
    {40058},
    {40059},
    {40060},
    {40061},
    {40062},
    {40063},
    {40064},
    {40065},
    {40066},
    {40067},
    {40071},
    {40072},
    {40100},
    {40101},
    {40102},
    {40103},
    {40106},
    {40107},
    {40108},
    {40109},
    {40111},
    {40112},
    {40113},
    {40114},
    {40116},
    {40117},
    {40118},
    {40120},
    {40122},
    {40123},
    {40124},
    {40125},
    {40126},
    {40127},
    {40128},
    {40129},
    {40130},
    {40131},
    {40132},
    {40133},
    {40134},
    {40135},
    {40136},
    {40137},
    {40138},
    {40139},
    {40140},
    {40141},
    {40142},
    {40143},
    {40144},
    {40145},
    {40146},
    {40147},
    {40148},
    {40149},
    {40150},
    {40151},
    {40152},
    {40153},
    {40154},
    {40155},
    {40156},
    {40157},
    {40158},
    {40159},
    {40160},
    {40161},
    {40162},
    {40163},
    {40164},
    {40165},
    {40166},
    {40167},
    {40168},
    {40169},
    {40170},
    {40171},
    {40172},
    {40173},
    {40174},
    {40175},
    {40176},
    {40177},
    {40178},
    {40179},
    {40180},
    {40181},
    {40182},
    {40183},
    {40184},
    {40185},
    {40186},
    {40187},
    {40188},
    {40189},
    {40190},
    {40191},
    {40192},
    {40193},
    {40194},
    {40195},
    {40196},
    {40197},
    {40198},
    {40199},
    {40200},
    {40201},
    {40202},
    {40203},
    {40204},
    {40205},
    {40206},
    {40207},
    {40208},
    {40209},
    {40210},
    {40211},
    {40212},
    {40213},
    {40214},
    {40215},
    {40216},
    {40217},
    {40218},
    {40219},
    {40220},
    {40221},
    {40222},
    {40223},
    {40225},
    {40227},
    {40228},
    {40229},
    {40230},
    {40231},
    {40232},
    {40233},
    {40234},
    {41000},
    {41001},
    {41002},
    {41004},
    {41005},
    {41006},
    {41007},
    {41008},
    {41009},
    {41010},
    {41011},
    {41012},
    {51000},
    {52001},
    {52002},
    {52003},
    {52004},
    {52011},
    {52012},
    {52013},
    {52014},
    {52021},
    {52022},
    {52023},
    {52024},
    {52031},
    {52032},
    {52033},
    {52034},
    {52041},
    {52042},
    {52043},
    {52044},
    {53000},
    {53001},
    {53002},
    {53003},
    {53004},
    {53005},
    {53301},
    {53302},
    {60006},
    {60010},
    {60011},
    {60012},
    {60013},
    {60014},
    {60015},
    {60020},
    {60021},
    {60022},
    {60023},
    {60024},
    {60025},
    {60030},
    {60031},
    {60032},
    {60033},
    {60034},
    {60035},
    {60036},
    {61000},
    {65015},
    {99999},
    {190020},
    {190021},
    {190022},
    {190030},
    {190031},
    {190032},
    {190033},
    {190034},
    {190035},
    {190036},
    {190261},
    {190262},
    {190263},
    {190264},
    {190265},
    {190266},
    {190267},
    {190268},
    {190290},
    {190310},
    {190311},
    {190312},
    {190313},
    {190314},
    {190315},
    {190316},
    {190317},
    {190340},
    {190341},
    {190342},
    {190343},
    {190344},
    {190345},
    {190410},
    {190411},
    {190412},
    {190413},
    {190414},
    {190415},
    {190520},
    {190541},
    {190542},
    {190543},
    {190544},
    {190545},
    {190546},
    {191460},
    {191461},
    {191470},
    {191471},
    {191472},
    {191473},
    {191474},
    {191475},
    {191476},
    {191530},
    {191531},
    {191532},
    {191533},
    {191534},
    {191535},
    {191536},
    {191537},
    {191538},
    {191539},
    {191540},
    {191541},
    {191542},
    {191543},
    {191544},
    {191545},
    {191546},
    {191547},
    {191548},
    {191549},
    {191550},
    {191551},
    {191552},
    {191553},
    {191554},
    {191555},
    {191556},
    {191557},
    {191558},
    {191559}
    ].

get1KeyList()->[
    0,
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
    97,
    98,
    99,
    100,
    101,
    103,
    104,
    105,
    106,
    107,
    108,
    113,
    118,
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
    136,
    137,
    138,
    139,
    140,
    141,
    142,
    143,
    144,
    145,
    146,
    147,
    148,
    149,
    150,
    151,
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
    165,
    166,
    167,
    168,
    169,
    170,
    171,
    172,
    173,
    174,
    175,
    176,
    177,
    178,
    179,
    180,
    181,
    182,
    183,
    184,
    185,
    186,
    187,
    188,
    189,
    190,
    191,
    192,
    193,
    194,
    195,
    196,
    197,
    198,
    199,
    200,
    201,
    202,
    203,
    204,
    205,
    206,
    207,
    208,
    209,
    210,
    211,
    212,
    213,
    214,
    215,
    216,
    217,
    218,
    219,
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
    300,
    301,
    302,
    303,
    304,
    305,
    306,
    307,
    308,
    309,
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
    344,
    345,
    346,
    347,
    348,
    349,
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
    400,
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
    2001,
    2002,
    2003,
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
    2548,
    3201,
    3202,
    3203,
    3204,
    3300,
    3301,
    3302,
    3505,
    3506,
    3507,
    3508,
    3509,
    3510,
    3511,
    3512,
    3513,
    3514,
    3515,
    3516,
    3517,
    3518,
    3519,
    3520,
    3521,
    3522,
    3523,
    3524,
    3525,
    3526,
    3527,
    3528,
    3529,
    3530,
    3531,
    3532,
    3533,
    3534,
    4022,
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
    5019,
    5020,
    5021,
    5022,
    5023,
    5024,
    5025,
    5026,
    5027,
    5028,
    5029,
    5030,
    5031,
    5032,
    5033,
    5034,
    5035,
    5036,
    5037,
    5038,
    5039,
    5100,
    5101,
    5102,
    5104,
    5105,
    5153,
    5154,
    5155,
    5156,
    5157,
    5158,
    5159,
    5160,
    5161,
    5162,
    5163,
    5164,
    5165,
    5166,
    5167,
    5168,
    5201,
    5202,
    5203,
    5204,
    5205,
    5206,
    5207,
    5208,
    5209,
    5210,
    5211,
    5212,
    5213,
    5214,
    5216,
    5217,
    5218,
    5219,
    5220,
    5221,
    5222,
    5223,
    5224,
    5225,
    5226,
    5227,
    5228,
    5229,
    5230,
    5231,
    5232,
    5233,
    5234,
    5235,
    5236,
    5237,
    5238,
    5239,
    5240,
    5241,
    5242,
    5243,
    5244,
    5245,
    5246,
    5247,
    5248,
    5249,
    5250,
    5251,
    5252,
    5253,
    5254,
    5255,
    5256,
    5257,
    5258,
    5259,
    5260,
    5261,
    5262,
    5263,
    5264,
    5265,
    5266,
    5267,
    5268,
    5269,
    5270,
    5271,
    5272,
    5273,
    5274,
    5275,
    5276,
    5277,
    5278,
    5279,
    5280,
    5300,
    5302,
    5303,
    5304,
    5305,
    5311,
    5312,
    5313,
    5314,
    5315,
    6549,
    6550,
    7011,
    7012,
    7013,
    7014,
    7015,
    7021,
    7022,
    7023,
    7024,
    7025,
    7031,
    7032,
    7033,
    7034,
    7035,
    7041,
    7042,
    7043,
    7044,
    7045,
    7111,
    7112,
    7113,
    7114,
    7115,
    7121,
    7122,
    7123,
    7124,
    7125,
    7131,
    7132,
    7133,
    7134,
    7135,
    7141,
    7142,
    7143,
    7144,
    7145,
    7211,
    7212,
    7213,
    7214,
    7311,
    7312,
    7313,
    7314,
    7315,
    7321,
    7322,
    7323,
    7324,
    7325,
    7331,
    7332,
    7333,
    7334,
    7335,
    7341,
    7342,
    7343,
    7344,
    7345,
    7411,
    7421,
    7431,
    7441,
    8002,
    8003,
    8004,
    8005,
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
    10026,
    10027,
    10028,
    10029,
    10030,
    10031,
    10032,
    10033,
    12101,
    12201,
    13007,
    13302,
    13303,
    13304,
    13500,
    13501,
    13502,
    13503,
    13504,
    14008,
    15007,
    15010,
    15020,
    16000,
    16001,
    16002,
    16003,
    16004,
    16005,
    16007,
    16008,
    16010,
    16012,
    16013,
    16014,
    16015,
    16016,
    16017,
    16018,
    16019,
    16020,
    16021,
    16022,
    16023,
    16024,
    16025,
    16026,
    16027,
    16028,
    16029,
    16030,
    16031,
    16034,
    16035,
    16036,
    16037,
    16038,
    16039,
    16040,
    16041,
    16042,
    16043,
    16044,
    16045,
    16046,
    16047,
    16048,
    16049,
    16050,
    16053,
    16054,
    16055,
    16056,
    16057,
    16058,
    16060,
    16061,
    16062,
    16063,
    16064,
    16065,
    16066,
    16067,
    16068,
    16069,
    16071,
    16072,
    16073,
    16074,
    16075,
    19000,
    19001,
    19002,
    19003,
    19004,
    19012,
    19013,
    19014,
    19015,
    19020,
    19021,
    19022,
    19023,
    19024,
    19025,
    19027,
    19028,
    19029,
    19030,
    19032,
    19033,
    19042,
    19044,
    19045,
    19051,
    19052,
    19130,
    19141,
    19146,
    20000,
    20001,
    20002,
    20003,
    20004,
    21000,
    21001,
    21002,
    21003,
    21005,
    21006,
    21008,
    30001,
    30002,
    30003,
    30004,
    30005,
    30006,
    30007,
    30008,
    30009,
    30010,
    30011,
    30012,
    31001,
    31002,
    31003,
    31004,
    31005,
    31006,
    31007,
    31008,
    32111,
    32112,
    32113,
    32114,
    32115,
    32211,
    32212,
    32213,
    32214,
    32215,
    32311,
    32312,
    32313,
    32314,
    32315,
    32411,
    32412,
    32413,
    32414,
    32415,
    32511,
    32512,
    32513,
    32514,
    32515,
    32611,
    32612,
    32613,
    32614,
    32615,
    32711,
    32712,
    32713,
    32714,
    32715,
    32811,
    32812,
    32813,
    32814,
    32815,
    32911,
    32912,
    32913,
    32914,
    32915,
    33011,
    33012,
    33013,
    33014,
    33015,
    33111,
    33112,
    33113,
    33114,
    33115,
    33211,
    33212,
    33213,
    33214,
    33215,
    34000,
    34001,
    34003,
    34004,
    34005,
    34006,
    34007,
    34008,
    34009,
    34010,
    34012,
    34013,
    34014,
    34015,
    34016,
    34017,
    34018,
    34019,
    34020,
    34021,
    34022,
    34023,
    34024,
    34025,
    34026,
    34027,
    34028,
    34029,
    34030,
    34031,
    34032,
    34033,
    34034,
    34035,
    34036,
    34037,
    34038,
    34039,
    34040,
    34041,
    34042,
    34043,
    34044,
    34045,
    34046,
    34047,
    34050,
    34051,
    34052,
    34053,
    34054,
    34055,
    34056,
    34057,
    34058,
    34059,
    34060,
    34061,
    34062,
    34063,
    34064,
    34065,
    34066,
    34067,
    34100,
    34101,
    34102,
    34103,
    34104,
    34105,
    34106,
    34107,
    34108,
    34109,
    34110,
    34111,
    34112,
    34113,
    34114,
    34115,
    34116,
    34117,
    34118,
    34119,
    34120,
    34121,
    34122,
    34123,
    34124,
    34125,
    34126,
    34127,
    34128,
    34129,
    34130,
    34131,
    34132,
    34133,
    34134,
    34135,
    34136,
    34137,
    34138,
    34139,
    34150,
    34151,
    34152,
    34153,
    34154,
    34155,
    34156,
    34157,
    34158,
    34159,
    34160,
    34161,
    34162,
    34163,
    34164,
    34165,
    34166,
    34167,
    34168,
    34169,
    34200,
    34201,
    34202,
    34203,
    34204,
    34205,
    34206,
    34207,
    34208,
    34209,
    34210,
    34211,
    34212,
    34213,
    34214,
    34215,
    34216,
    34217,
    34218,
    34219,
    34300,
    34301,
    34302,
    34303,
    34304,
    34305,
    34306,
    34307,
    34308,
    34309,
    34310,
    34311,
    34312,
    34313,
    34314,
    34315,
    34316,
    34317,
    34318,
    34319,
    34320,
    34321,
    34322,
    34323,
    34324,
    34325,
    34326,
    34327,
    34328,
    34329,
    34400,
    34401,
    34402,
    34403,
    34404,
    34405,
    34406,
    34407,
    34408,
    34409,
    34410,
    34411,
    34412,
    34413,
    34414,
    34415,
    34416,
    34417,
    34418,
    34419,
    35000,
    40001,
    40002,
    40003,
    40004,
    40006,
    40007,
    40008,
    40009,
    40010,
    40011,
    40012,
    40013,
    40014,
    40015,
    40016,
    40017,
    40018,
    40019,
    40020,
    40021,
    40022,
    40023,
    40024,
    40025,
    40026,
    40027,
    40028,
    40031,
    40032,
    40033,
    40034,
    40035,
    40036,
    40037,
    40043,
    40044,
    40045,
    40046,
    40048,
    40049,
    40050,
    40051,
    40052,
    40053,
    40054,
    40055,
    40057,
    40058,
    40059,
    40060,
    40061,
    40062,
    40063,
    40064,
    40065,
    40066,
    40067,
    40071,
    40072,
    40100,
    40101,
    40102,
    40103,
    40106,
    40107,
    40108,
    40109,
    40111,
    40112,
    40113,
    40114,
    40116,
    40117,
    40118,
    40120,
    40122,
    40123,
    40124,
    40125,
    40126,
    40127,
    40128,
    40129,
    40130,
    40131,
    40132,
    40133,
    40134,
    40135,
    40136,
    40137,
    40138,
    40139,
    40140,
    40141,
    40142,
    40143,
    40144,
    40145,
    40146,
    40147,
    40148,
    40149,
    40150,
    40151,
    40152,
    40153,
    40154,
    40155,
    40156,
    40157,
    40158,
    40159,
    40160,
    40161,
    40162,
    40163,
    40164,
    40165,
    40166,
    40167,
    40168,
    40169,
    40170,
    40171,
    40172,
    40173,
    40174,
    40175,
    40176,
    40177,
    40178,
    40179,
    40180,
    40181,
    40182,
    40183,
    40184,
    40185,
    40186,
    40187,
    40188,
    40189,
    40190,
    40191,
    40192,
    40193,
    40194,
    40195,
    40196,
    40197,
    40198,
    40199,
    40200,
    40201,
    40202,
    40203,
    40204,
    40205,
    40206,
    40207,
    40208,
    40209,
    40210,
    40211,
    40212,
    40213,
    40214,
    40215,
    40216,
    40217,
    40218,
    40219,
    40220,
    40221,
    40222,
    40223,
    40225,
    40227,
    40228,
    40229,
    40230,
    40231,
    40232,
    40233,
    40234,
    41000,
    41001,
    41002,
    41004,
    41005,
    41006,
    41007,
    41008,
    41009,
    41010,
    41011,
    41012,
    51000,
    52001,
    52002,
    52003,
    52004,
    52011,
    52012,
    52013,
    52014,
    52021,
    52022,
    52023,
    52024,
    52031,
    52032,
    52033,
    52034,
    52041,
    52042,
    52043,
    52044,
    53000,
    53001,
    53002,
    53003,
    53004,
    53005,
    53301,
    53302,
    60006,
    60010,
    60011,
    60012,
    60013,
    60014,
    60015,
    60020,
    60021,
    60022,
    60023,
    60024,
    60025,
    60030,
    60031,
    60032,
    60033,
    60034,
    60035,
    60036,
    61000,
    65015,
    99999,
    190020,
    190021,
    190022,
    190030,
    190031,
    190032,
    190033,
    190034,
    190035,
    190036,
    190261,
    190262,
    190263,
    190264,
    190265,
    190266,
    190267,
    190268,
    190290,
    190310,
    190311,
    190312,
    190313,
    190314,
    190315,
    190316,
    190317,
    190340,
    190341,
    190342,
    190343,
    190344,
    190345,
    190410,
    190411,
    190412,
    190413,
    190414,
    190415,
    190520,
    190541,
    190542,
    190543,
    190544,
    190545,
    190546,
    191460,
    191461,
    191470,
    191471,
    191472,
    191473,
    191474,
    191475,
    191476,
    191530,
    191531,
    191532,
    191533,
    191534,
    191535,
    191536,
    191537,
    191538,
    191539,
    191540,
    191541,
    191542,
    191543,
    191544,
    191545,
    191546,
    191547,
    191548,
    191549,
    191550,
    191551,
    191552,
    191553,
    191554,
    191555,
    191556,
    191557,
    191558,
    191559
    ].

