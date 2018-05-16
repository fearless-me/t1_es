%% coding: latin-1
%%: 实现
-module(cfg_accessresources_cht).
-compile(export_all).
-include("cfg_accessresources.hrl").
-include("logger.hrl").

getRow(1)->
    #accessresourcesCfg {
    iD = 1,
    name = "金币",
    type = 1,
    type_id = 1,
    description_1 = "[808080]【金币】基础的通用货币[-]",
    description_2 = "[ff6a00]主要途径： 惊天喵盗团 福利[-]",
    relation_UI = [22,4],
    number_display = 1,
    new_rule = 0
    };
getRow(2)->
    #accessresourcesCfg {
    iD = 2,
    name = "绑定钻石",
    type = 1,
    type_id = 6,
    description_1 = "[808080]【绑定钻石】可购买商城道具和游戏功能[-]",
    description_2 = "[ff6a00]主要途径： 竞技场 成就 骑宠竞速 首领入侵 全民答题[-]",
    relation_UI = [22,16],
    number_display = 1,
    new_rule = 0
    };
getRow(3)->
    #accessresourcesCfg {
    iD = 3,
    name = "钻石",
    type = 1,
    type_id = 3,
    description_1 = "[808080]【钻石】可购买更多的商城道具和游戏功能[-]",
    description_2 = "[ff6a00]主要途径： 商城充值[-]",
    relation_UI = [24,0],
    number_display = 1,
    new_rule = 0
    };
getRow(4)->
    #accessresourcesCfg {
    iD = 4,
    name = "蓝色精华",
    type = 1,
    type_id = 7,
    description_1 = "[808080]【蓝色精华】用于资源兑换商店中兑换物品[-]",
    description_2 = "[ff6a00]主要途径： 女神禁闭室 装备分解[-]",
    relation_UI = [22,13],
    number_display = 1,
    new_rule = 0
    };
getRow(5)->
    #accessresourcesCfg {
    iD = 5,
    name = "深红硬币",
    type = 1,
    type_id = 11,
    description_1 = "[808080]【深红硬币】用于在深红熔渊活动商店中兑换物品[-]",
    description_2 = "[ff6a00]主要途径： 深红熔渊[-]",
    relation_UI = [22,21],
    number_display = 1,
    new_rule = 0
    };
getRow(6)->
    #accessresourcesCfg {
    iD = 6,
    name = "兽灵硬币",
    type = 2,
    type_id = 2002,
    description_1 = "[808080]【兽灵硬币】用于碎片商店中兑换商品[-]",
    description_2 = "[ff6a00]主要途径： 骑宠领地 骑宠回购[-]",
    relation_UI = [22,36],
    number_display = 1,
    new_rule = 0
    };
getRow(7)->
    #accessresourcesCfg {
    iD = 7,
    name = "精炼石",
    type = 2,
    type_id = 222,
    description_1 = "[808080]【精炼石】可用于精炼装备[-]",
    description_2 = "[ff6a00]主要途径： 女神禁闭室 兑换商店[-]",
    relation_UI = [22,13],
    number_display = 1,
    new_rule = 0
    };
getRow(8)->
    #accessresourcesCfg {
    iD = 8,
    name = "附魔石",
    type = 2,
    type_id = 240,
    description_1 = "[808080]【附魔石】可用于附魔装备[-]",
    description_2 = "[ff6a00]主要途径： 挑战副本 首领禁地[-]",
    relation_UI = [20,3000],
    number_display = 1,
    new_rule = 0
    };
getRow(9)->
    #accessresourcesCfg {
    iD = 9,
    name = "璀璨晶体",
    type = 2,
    type_id = 2601,
    description_1 = "[808080]【璀璨晶体】可用于兑换时装[-]",
    description_2 = "[ff6a00]主要途径： 约会地下城 情缘任务 骑宠竞速[-]",
    relation_UI = [22,35],
    number_display = 1,
    new_rule = 0
    };
getRow(10)->
    #accessresourcesCfg {
    iD = 10,
    name = "装备碎片",
    type = 2,
    type_id = 7000,
    description_1 = "[808080]【装备碎片】分为勇气碎片、专注碎片等，可合成红色套装[-]",
    description_2 = "[ff6a00]主要途径： 元素保卫战 野外首领 深红熔渊 [-]",
    relation_UI = [22,31],
    number_display = 1,
    new_rule = 0
    };
getRow(11)->
    #accessresourcesCfg {
    iD = 11,
    name = "纹章",
    type = 2,
    type_id = 62,
    description_1 = "[808080]【纹章】可镶嵌在角色身上提高战斗力[-]",
    description_2 = "[ff6a00]主要途径： 家族商店 深红熔渊[-]",
    relation_UI = [15,0],
    number_display = 1,
    new_rule = 0
    };
getRow(12)->
    #accessresourcesCfg {
    iD = 12,
    name = "兽灵精华",
    type = 2,
    type_id = 2160,
    description_1 = "[808080]【兽灵精华】可用于灰色、绿色和蓝色骑宠的升星以及骑宠装备升级[-]",
    description_2 = "[ff6a00]主要途径： 史莱姆秘境 骑宠领地[-]",
    relation_UI = [22,37],
    number_display = 1,
    new_rule = 0
    };
getRow(13)->
    #accessresourcesCfg {
    iD = 13,
    name = "宠物碎片",
    type = 2,
    type_id = 84,
    description_1 = "[808080]【宠物碎片】可用于兑换宠物[-]",
    description_2 = "[ff6a00]主要途径： 扭蛋 英雄副本[-]",
    relation_UI = [53,0],
    number_display = 1,
    new_rule = 0
    };
getRow(14)->
    #accessresourcesCfg {
    iD = 14,
    name = "宠物经验骨头",
    type = 2,
    type_id = 202,
    description_1 = "[808080]【宠物经验骨头】可用于增加宠物经验[-]",
    description_2 = "[ff6a00]主要途径： 史莱姆秘境[-]",
    relation_UI = [22,37],
    number_display = 1,
    new_rule = 0
    };
getRow(16)->
    #accessresourcesCfg {
    iD = 16,
    name = "宠物驯兽手册",
    type = 2,
    type_id = 11000,
    description_1 = "[808080]【宠物驯兽手册】可用于突破宠物升星[-]",
    description_2 = "[ff6a00]主要途径： 家族商店[-]",
    relation_UI = [15,0],
    number_display = 1,
    new_rule = 0
    };
getRow(17)->
    #accessresourcesCfg {
    iD = 17,
    name = "家族资金",
    type = 2,
    type_id = 11,
    description_1 = "[808080]【家族资金】可用于升级家族[-]",
    description_2 = "[ff6a00]主要途径： 家族活动[-]",
    relation_UI = [15,0],
    number_display = 1,
    new_rule = 0
    };
getRow(18)->
    #accessresourcesCfg {
    iD = 18,
    name = "家族贡献",
    type = 2,
    type_id = 13,
    description_1 = "[808080]【家族贡献】可用于升级家族技能和在家族商店中兑换物品[-]",
    description_2 = "[ff6a00]主要途径： 家族活动[-]",
    relation_UI = [15,0],
    number_display = 1,
    new_rule = 0
    };
getRow(19)->
    #accessresourcesCfg {
    iD = 19,
    name = "家族活跃",
    type = 2,
    type_id = 15,
    description_1 = "[808080]【家族资金】可用于升级家族[-]",
    description_2 = "[ff6a00]主要途径： 家族活动[-]",
    relation_UI = [15,0],
    number_display = 1,
    new_rule = 0
    };
getRow(20)->
    #accessresourcesCfg {
    iD = 20,
    name = "婚戒突破材料",
    type = 2,
    type_id = 86,
    description_1 = "[808080]【婚戒突破材料】可用于突破婚戒[-]",
    description_2 = "[ff6a00]主要途径： 情缘任务[-]",
    relation_UI = [22,32],
    number_display = 1,
    new_rule = 0
    };
getRow(21)->
    #accessresourcesCfg {
    iD = 21,
    name = "称号词组",
    type = 2,
    type_id = 6000,
    description_1 = "[808080]【称号词组】可用于获得称号[-]",
    description_2 = "[ff6a00]主要途径： 商城 主线任务[-]",
    relation_UI = [24,0],
    number_display = 1,
    new_rule = 0
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
    {16},
    {17},
    {18},
    {19},
    {20},
    {21}
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
    16,
    17,
    18,
    19,
    20,
    21
    ].

