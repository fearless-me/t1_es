%% coding: latin-1
%%: 实现
-module(cfg_mainMenu_chs).
-compile(export_all).
-include("cfg_mainMenu.hrl").
-include("logger.hrl").

getRow(1)->
    #mainMenuCfg {
    id = 1,
    effect = 0,
    name = "角色信息",
    sort = 0,
    icon = 27,
    type = 1,
    parameters = 1,
    panelType = "CharacterPanel",
    cross_Shielding = 0
    };
getRow(2)->
    #mainMenuCfg {
    id = 2,
    effect = 0,
    name = "背包",
    sort = 0,
    icon = 1,
    type = 1,
    parameters = 1,
    panelType = "CharacterPanel",
    cross_Shielding = 0
    };
getRow(3)->
    #mainMenuCfg {
    id = 3,
    effect = 0,
    name = "社交",
    sort = 0,
    icon = 19,
    type = 1,
    parameters = 1,
    panelType = "FriendsPanel",
    cross_Shielding = 0
    };
getRow(4)->
    #mainMenuCfg {
    id = 4,
    effect = 0,
    name = "任务",
    sort = 0,
    icon = 17,
    type = 1,
    parameters = 1,
    panelType = "MissionLogPanel",
    cross_Shielding = 1
    };
getRow(5)->
    #mainMenuCfg {
    id = 5,
    effect = 1,
    name = "骑宠",
    sort = 101,
    icon = 14,
    type = 3,
    parameters = 644,
    panelType = "MAndPPanel",
    cross_Shielding = 1
    };
getRow(6)->
    #mainMenuCfg {
    id = 6,
    effect = 0,
    name = "邮件",
    sort = 0,
    icon = 19,
    type = 1,
    parameters = 1,
    panelType = "MailPanel",
    cross_Shielding = 1
    };
getRow(7)->
    #mainMenuCfg {
    id = 7,
    effect = 0,
    name = "技能",
    sort = 0,
    icon = 27,
    type = 1,
    parameters = 4,
    panelType = "SkillPanel",
    cross_Shielding = 0
    };
getRow(8)->
    #mainMenuCfg {
    id = 8,
    effect = 0,
    name = "仓库",
    sort = 0,
    icon = 27,
    type = 1,
    parameters = 1,
    panelType = "StoragePanel",
    cross_Shielding = 1
    };
getRow(9)->
    #mainMenuCfg {
    id = 9,
    effect = 0,
    name = "精炼",
    sort = 0,
    icon = 27,
    type = 3,
    parameters = 114,
    cross_Shielding = 0
    };
getRow(10)->
    #mainMenuCfg {
    id = 10,
    effect = 0,
    name = "队伍",
    sort = 0,
    icon = 27,
    type = 1,
    parameters = 12,
    panelType = "TeamPanel",
    cross_Shielding = 0
    };
getRow(11)->
    #mainMenuCfg {
    id = 11,
    effect = 2,
    name = "交易行",
    sort = 202,
    icon = 10,
    type = 3,
    parameters = 118,
    panelType = "BussyPanel",
    cross_Shielding = 1
    };
getRow(12)->
    #mainMenuCfg {
    id = 12,
    effect = 0,
    name = "兑换",
    sort = 0,
    icon = 27,
    type = 1,
    parameters = 26,
    panelType = "ResExchangePanel",
    cross_Shielding = 1
    };
getRow(13)->
    #mainMenuCfg {
    id = 13,
    effect = 0,
    name = "纹章",
    sort = 0,
    icon = 27,
    type = 3,
    parameters = 316,
    panelType = "EquipInlaygem",
    cross_Shielding = 0
    };
getRow(14)->
    #mainMenuCfg {
    id = 14,
    effect = 0,
    name = "宠物",
    sort = 0,
    icon = 27,
    type = 4,
    parameters = 2,
    panelType = "PetPanel",
    cross_Shielding = 1
    };
getRow(15)->
    #mainMenuCfg {
    id = 15,
    effect = 1,
    name = "家族",
    sort = 100,
    icon = 25,
    type = 3,
    parameters = 101,
    panelType = "GuildPanel",
    cross_Shielding = 1
    };
getRow(16)->
    #mainMenuCfg {
    id = 16,
    effect = 1,
    name = "设置",
    sort = 108,
    icon = 16,
    type = 1,
    parameters = 1,
    panelType = "GameSettingPanel",
    cross_Shielding = 0
    };
getRow(18)->
    #mainMenuCfg {
    id = 18,
    effect = 0,
    name = "女神",
    sort = 0,
    icon = 27,
    type = 1,
    parameters = 10,
    panelType = "TransformNewPanel",
    cross_Shielding = 1
    };
getRow(19)->
    #mainMenuCfg {
    id = 19,
    effect = 0,
    name = "帮助",
    sort = 0,
    icon = 27,
    type = 1,
    parameters = 1,
    panelType = "HelpPanel",
    cross_Shielding = 1
    };
getRow(20)->
    #mainMenuCfg {
    id = 20,
    effect = 0,
    name = "挑战副本",
    sort = 204,
    icon = 28,
    type = 1,
    parameters = 40,
    panelType = "CopyPanel",
    cross_Shielding = 1
    };
getRow(21)->
    #mainMenuCfg {
    id = 21,
    effect = 0,
    name = "公告",
    sort = 0,
    icon = 16,
    type = 1,
    parameters = 1,
    panelType = "NoticePanel",
    cross_Shielding = 0
    };
getRow(22)->
    #mainMenuCfg {
    id = 22,
    effect = 0,
    name = "玩法",
    sort = 203,
    icon = 28,
    type = 1,
    parameters = 22,
    panelType = "CheckInPanel",
    cross_Shielding = 1
    };
getRow(23)->
    #mainMenuCfg {
    id = 23,
    effect = 2,
    name = "排行榜",
    sort = 205,
    icon = 12,
    type = 1,
    parameters = 40,
    panelType = "RankPanel",
    cross_Shielding = 1
    };
getRow(24)->
    #mainMenuCfg {
    id = 24,
    effect = 2,
    name = "商城",
    sort = 203,
    icon = 15,
    type = 1,
    parameters = 1,
    panelType = "ShopPanel",
    cross_Shielding = 1
    };
getRow(25)->
    #mainMenuCfg {
    id = 25,
    effect = 0,
    name = "社交",
    sort = 0,
    icon = 27,
    type = 1,
    parameters = 1,
    cross_Shielding = 1
    };
getRow(26)->
    #mainMenuCfg {
    id = 26,
    effect = 2,
    name = "福利",
    sort = 101,
    icon = 3,
    type = 1,
    parameters = 10,
    panelType = "WelfarePanel",
    cross_Shielding = 1
    };
getRow(27)->
    #mainMenuCfg {
    id = 27,
    effect = 0,
    name = "自动挂机",
    sort = 0,
    icon = 27,
    type = 3,
    parameters = 3,
    cross_Shielding = 0
    };
getRow(28)->
    #mainMenuCfg {
    id = 28,
    effect = 0,
    name = "队伍周常（废弃）",
    sort = 0,
    icon = 27,
    type = 1,
    parameters = 1000,
    panelType = "PartnerPanel",
    cross_Shielding = 1
    };
getRow(29)->
    #mainMenuCfg {
    id = 29,
    effect = 2,
    name = "成就",
    sort = 204,
    icon = 2,
    type = 3,
    parameters = 90,
    panelType = "AchievementPanel",
    cross_Shielding = 1
    };
getRow(30)->
    #mainMenuCfg {
    id = 30,
    effect = 0,
    name = "充值活动",
    sort = 103,
    icon = 27,
    type = 1,
    parameters = 100,
    panelType = "RechargeActivityPanel",
    cross_Shielding = 1
    };
getRow(32)->
    #mainMenuCfg {
    id = 32,
    effect = 0,
    name = "骑宠装备",
    sort = 0,
    icon = 27,
    type = 1,
    parameters = 52,
    cross_Shielding = 1
    };
getRow(33)->
    #mainMenuCfg {
    id = 33,
    effect = 0,
    name = "神秘商城",
    sort = 0,
    icon = 15,
    type = 3,
    parameters = 265,
    panelType = "SecretShopPanel",
    cross_Shielding = 1
    };
getRow(34)->
    #mainMenuCfg {
    id = 34,
    effect = 0,
    name = "器灵",
    sort = 201,
    icon = 27,
    type = 1,
    parameters = 1000,
    panelType = "WeaponImprovePanel",
    cross_Shielding = 1
    };
getRow(35)->
    #mainMenuCfg {
    id = 35,
    effect = 0,
    name = "我要变强",
    sort = 0,
    icon = 20,
    type = 1,
    parameters = 24,
    panelType = "ImproveForcePanel",
    cross_Shielding = 1
    };
getRow(36)->
    #mainMenuCfg {
    id = 36,
    effect = 1,
    name = "装备兑换（屏蔽）",
    sort = 199,
    icon = 27,
    type = 1,
    parameters = 1000,
    panelType = "FixedEquipExchangePanel",
    cross_Shielding = 1
    };
getRow(37)->
    #mainMenuCfg {
    id = 37,
    effect = 0,
    name = "骑宠远征（废弃）",
    sort = 0,
    icon = 27,
    type = 1,
    parameters = 1000,
    panelType = "MAndPPVEPanel",
    cross_Shielding = 1
    };
getRow(38)->
    #mainMenuCfg {
    id = 38,
    effect = 0,
    name = "升星",
    sort = 0,
    icon = 27,
    type = 3,
    parameters = 26,
    panelType = "StrengthenPanel",
    cross_Shielding = 0
    };
getRow(39)->
    #mainMenuCfg {
    id = 39,
    effect = 0,
    name = "附魔",
    sort = 0,
    icon = 27,
    type = 1,
    parameters = 1000,
    cross_Shielding = 0
    };
getRow(40)->
    #mainMenuCfg {
    id = 40,
    effect = 0,
    name = "占卜(废弃)",
    sort = 0,
    icon = 27,
    type = 1,
    parameters = 1000,
    cross_Shielding = 1
    };
getRow(41)->
    #mainMenuCfg {
    id = 41,
    effect = 0,
    name = "每日必做",
    sort = 0,
    icon = 27,
    type = 1,
    parameters = 30,
    cross_Shielding = 1
    };
getRow(42)->
    #mainMenuCfg {
    id = 42,
    effect = 0,
    name = "星空之翼",
    sort = 203,
    icon = 27,
    type = 1,
    parameters = 1000,
    panelType = "WingPanel",
    cross_Shielding = 1
    };
getRow(43)->
    #mainMenuCfg {
    id = 43,
    effect = 1,
    name = "合成",
    sort = 105,
    icon = 7,
    type = 3,
    parameters = 146,
    panelType = "ResourceMakePanel",
    cross_Shielding = 1
    };
getRow(44)->
    #mainMenuCfg {
    id = 44,
    effect = 0,
    name = "骑宠精灵(废弃)",
    sort = 0,
    icon = 27,
    type = 1,
    parameters = 1000,
    cross_Shielding = 1
    };
getRow(45)->
    #mainMenuCfg {
    id = 45,
    effect = 0,
    name = "符文",
    sort = 206,
    icon = 27,
    type = 1,
    parameters = 130,
    panelType = "RunePanel",
    cross_Shielding = 1
    };
getRow(46)->
    #mainMenuCfg {
    id = 46,
    effect = 0,
    name = "魔塔宝藏(废弃)",
    sort = 0,
    icon = 27,
    type = 1,
    parameters = 1000,
    cross_Shielding = 1
    };
getRow(47)->
    #mainMenuCfg {
    id = 47,
    effect = 1,
    name = "婚姻",
    sort = 103,
    icon = 8,
    type = 3,
    parameters = 134,
    panelType = "NewMarriagePanel",
    cross_Shielding = 1
    };
getRow(48)->
    #mainMenuCfg {
    id = 48,
    effect = 0,
    name = "一统天下(废弃)",
    sort = 0,
    icon = 27,
    type = 1,
    parameters = 1000,
    cross_Shielding = 1
    };
getRow(49)->
    #mainMenuCfg {
    id = 49,
    effect = 0,
    name = "红包",
    sort = 104,
    icon = 24,
    type = 1,
    parameters = 11,
    panelType = "RedEnvelopePanel",
    cross_Shielding = 1
    };
getRow(50)->
    #mainMenuCfg {
    id = 50,
    effect = 0,
    name = "装备合成",
    sort = 0,
    icon = 27,
    type = 3,
    parameters = 146,
    panelType = "ResourceMakePanel",
    cross_Shielding = 1
    };
getRow(51)->
    #mainMenuCfg {
    id = 51,
    effect = 0,
    name = "道具合成",
    sort = 0,
    icon = 27,
    type = 3,
    parameters = 146,
    panelType = "ResourceMakePanel",
    cross_Shielding = 1
    };
getRow(52)->
    #mainMenuCfg {
    id = 52,
    effect = 0,
    name = "时装",
    sort = 0,
    icon = 27,
    type = 3,
    parameters = 19,
    cross_Shielding = 1
    };
getRow(53)->
    #mainMenuCfg {
    id = 53,
    effect = 2,
    name = "扭蛋",
    sort = 201,
    icon = 11,
    type = 3,
    parameters = 71,
    panelType = "TreasurePanel",
    cross_Shielding = 1
    };
getRow(54)->
    #mainMenuCfg {
    id = 54,
    effect = 0,
    name = "旧约会地下城(废弃)",
    sort = 0,
    icon = 27,
    type = 1,
    parameters = 1000,
    panelType = "DateUndergroundCity",
    cross_Shielding = 1
    };
getRow(55)->
    #mainMenuCfg {
    id = 55,
    effect = 0,
    name = "骑宠领地开采",
    sort = 0,
    icon = 27,
    type = 1,
    parameters = 34,
    panelType = "PetTerritoryPanel",
    cross_Shielding = 1
    };
getRow(56)->
    #mainMenuCfg {
    id = 56,
    effect = 0,
    name = "骑宠领地掠夺",
    sort = 0,
    icon = 27,
    type = 1,
    parameters = 1000,
    panelType = "PetTerritoryPanel",
    cross_Shielding = 1
    };
getRow(57)->
    #mainMenuCfg {
    id = 57,
    effect = 30,
    name = "兑换第三页签（屏蔽，勿删）",
    sort = 0,
    icon = 0,
    type = 1,
    parameters = 10,
    panelType = "ResExchangePanel",
    cross_Shielding = 1
    };
getRow(58)->
    #mainMenuCfg {
    id = 58,
    effect = 2,
    name = "七日大奖",
    sort = 102,
    icon = 13,
    type = 1,
    parameters = 15,
    panelType = "SevenDayTagertPanel",
    cross_Shielding = 1
    };
getRow(59)->
    #mainMenuCfg {
    id = 59,
    effect = 0,
    name = "赠礼",
    sort = 0,
    icon = 27,
    type = 1,
    parameters = 1,
    cross_Shielding = 1
    };
getRow(60)->
    #mainMenuCfg {
    id = 60,
    effect = 1,
    name = "家园",
    sort = 106,
    icon = 9,
    type = 3,
    parameters = 150,
    panelType = "HomeInfoPanel",
    cross_Shielding = 1
    };
getRow(61)->
    #mainMenuCfg {
    id = 61,
    effect = 1,
    name = "图鉴",
    sort = 107,
    icon = 21,
    type = 3,
    parameters = 53,
    panelType = "MHBPanel",
    cross_Shielding = 1
    };
getRow(62)->
    #mainMenuCfg {
    id = 62,
    effect = 1,
    name = "衣帽间",
    sort = 102,
    icon = 4,
    type = 3,
    parameters = 67,
    cross_Shielding = 1
    };
getRow(63)->
    #mainMenuCfg {
    id = 63,
    effect = 2,
    name = "登录送礼",
    sort = 105,
    icon = 5,
    type = 3,
    parameters = 95,
    cross_Shielding = 1
    };
getRow(64)->
    #mainMenuCfg {
    id = 64,
    effect = 0,
    name = "玩法",
    sort = 0,
    icon = 28,
    type = 1,
    parameters = 22,
    cross_Shielding = 1
    };
getRow(65)->
    #mainMenuCfg {
    id = 65,
    effect = 1,
    name = "生活技能",
    sort = 108,
    icon = 34,
    type = 3,
    parameters = 150,
    cross_Shielding = 1
    };
getRow(66)->
    #mainMenuCfg {
    id = 66,
    effect = 0,
    name = "钓鱼",
    sort = 0,
    icon = 34,
    type = 3,
    parameters = 150,
    panelType = "LifeSkillPanel",
    cross_Shielding = 1
    };
getRow(67)->
    #mainMenuCfg {
    id = 67,
    effect = 0,
    name = "狩猎",
    sort = 0,
    icon = 34,
    type = 3,
    parameters = 150,
    panelType = "LifeSkillPanel",
    cross_Shielding = 1
    };
getRow(68)->
    #mainMenuCfg {
    id = 68,
    effect = 0,
    name = "挖矿",
    sort = 0,
    icon = 34,
    type = 3,
    parameters = 150,
    panelType = "LifeSkillPanel",
    cross_Shielding = 1
    };
getRow(69)->
    #mainMenuCfg {
    id = 69,
    effect = 0,
    name = "烹饪",
    sort = 0,
    icon = 34,
    type = 3,
    parameters = 150,
    panelType = "LifeSkillPanel",
    cross_Shielding = 1
    };
getRow(70)->
    #mainMenuCfg {
    id = 70,
    effect = 0,
    name = "装修",
    sort = 0,
    icon = 34,
    type = 3,
    parameters = 150,
    panelType = "LifeSkillPanel",
    cross_Shielding = 1
    };
getRow(71)->
    #mainMenuCfg {
    id = 71,
    effect = 2,
    name = "缤纷活动",
    sort = 103,
    icon = 29,
    type = 1,
    parameters = 30,
    panelType = "WelfarePanel",
    cross_Shielding = 1
    };
getRow(72)->
    #mainMenuCfg {
    id = 72,
    effect = 2,
    name = "现金特卖",
    sort = 106,
    icon = 31,
    type = 1,
    parameters = 40,
    panelType = "WelfarePanel",
    cross_Shielding = 1
    };
getRow(73)->
    #mainMenuCfg {
    id = 73,
    effect = 2,
    name = "首充",
    sort = 108,
    icon = 43,
    type = 1,
    parameters = 13,
    panelType = "WelfarePanel",
    cross_Shielding = 1
    };
getRow(74)->
    #mainMenuCfg {
    id = 74,
    effect = 0,
    name = "随身商店",
    sort = 0,
    icon = 27,
    type = 1,
    parameters = 1,
    panelType = "CarryStorePanel",
    cross_Shielding = 1
    };
getRow(75)->
    #mainMenuCfg {
    id = 75,
    effect = 0,
    name = "装备洗炼",
    sort = 0,
    icon = 27,
    type = 1,
    parameters = 1000,
    cross_Shielding = 0
    };
getRow(76)->
    #mainMenuCfg {
    id = 76,
    effect = 0,
    name = "觉醒技能",
    sort = 0,
    icon = 32,
    type = 1,
    parameters = 1000,
    cross_Shielding = 1
    };
getRow(77)->
    #mainMenuCfg {
    id = 77,
    effect = 0,
    name = "转职",
    sort = 0,
    icon = 33,
    type = 1,
    parameters = 1000,
    cross_Shielding = 1
    };
getRow(78)->
    #mainMenuCfg {
    id = 78,
    effect = 0,
    name = "女神禁闭室",
    sort = 0,
    icon = 28,
    type = 1,
    parameters = 1000,
    cross_Shielding = 1
    };
getRow(79)->
    #mainMenuCfg {
    id = 79,
    effect = 0,
    name = "史莱姆秘境",
    sort = 0,
    icon = 28,
    type = 1,
    parameters = 1000,
    cross_Shielding = 1
    };
getRow(80)->
    #mainMenuCfg {
    id = 80,
    effect = 0,
    name = "充值界面",
    sort = 0,
    icon = 15,
    type = 1,
    parameters = 1,
    cross_Shielding = 1
    };
getRow(81)->
    #mainMenuCfg {
    id = 81,
    effect = 2,
    name = "藏宝之谜",
    sort = 206,
    icon = 41,
    type = 1,
    parameters = 1,
    panelType = "WelfarePanel",
    cross_Shielding = 1
    };
getRow(82)->
    #mainMenuCfg {
    id = 82,
    effect = 0,
    name = "骑宠",
    sort = 0,
    icon = 14,
    type = 1,
    parameters = 1000,
    cross_Shielding = 1
    };
getRow(83)->
    #mainMenuCfg {
    id = 83,
    effect = 0,
    name = "家族",
    sort = 0,
    icon = 25,
    type = 1,
    parameters = 1000,
    cross_Shielding = 1
    };
getRow(84)->
    #mainMenuCfg {
    id = 84,
    effect = 0,
    name = "合成",
    sort = 0,
    icon = 7,
    type = 1,
    parameters = 1000,
    cross_Shielding = 1
    };
getRow(85)->
    #mainMenuCfg {
    id = 85,
    effect = 0,
    name = "挑战副本",
    sort = 0,
    icon = 27,
    type = 1,
    parameters = 1000,
    cross_Shielding = 0
    };
getRow(86)->
    #mainMenuCfg {
    id = 86,
    effect = 0,
    name = "纹章",
    sort = 0,
    icon = 27,
    type = 1,
    parameters = 1000,
    cross_Shielding = 0
    };
getRow(87)->
    #mainMenuCfg {
    id = 87,
    effect = 0,
    name = "装备洗炼",
    sort = 0,
    icon = 27,
    type = 1,
    parameters = 1000,
    cross_Shielding = 0
    };
getRow(88)->
    #mainMenuCfg {
    id = 88,
    effect = 0,
    name = "觉醒",
    sort = 0,
    icon = 27,
    type = 1,
    parameters = 100,
    cross_Shielding = 1
    };
getRow(89)->
    #mainMenuCfg {
    id = 89,
    effect = 0,
    name = "被动技能",
    sort = 0,
    icon = 27,
    type = 3,
    parameters = 1002,
    panelType = "SkillPanel",
    cross_Shielding = 0
    };
getRow(90)->
    #mainMenuCfg {
    id = 90,
    effect = 0,
    name = "阿露娜之争",
    sort = 0,
    icon = 39,
    type = 1,
    parameters = 50,
    cross_Shielding = 1
    };
getRow(91)->
    #mainMenuCfg {
    id = 91,
    effect = 0,
    name = "史莱姆秘境",
    sort = 0,
    icon = 28,
    type = 1,
    parameters = 64,
    cross_Shielding = 1
    };
getRow(92)->
    #mainMenuCfg {
    id = 92,
    effect = 0,
    name = "骑宠领地",
    sort = 0,
    icon = 28,
    type = 1,
    parameters = 64,
    cross_Shielding = 1
    };
getRow(93)->
    #mainMenuCfg {
    id = 93,
    effect = 0,
    name = "女神禁闭室",
    sort = 0,
    icon = 28,
    type = 1,
    parameters = 64,
    cross_Shielding = 1
    };
getRow(94)->
    #mainMenuCfg {
    id = 94,
    effect = 0,
    name = "惊天喵盗团",
    sort = 0,
    icon = 28,
    type = 1,
    parameters = 64,
    cross_Shielding = 1
    };
getRow(95)->
    #mainMenuCfg {
    id = 95,
    effect = 0,
    name = "竞技场",
    sort = 0,
    icon = 28,
    type = 1,
    parameters = 64,
    cross_Shielding = 1
    };
getRow(96)->
    #mainMenuCfg {
    id = 96,
    effect = 0,
    name = "挑战副本",
    sort = 0,
    icon = 28,
    type = 1,
    parameters = 64,
    cross_Shielding = 1
    };
getRow(97)->
    #mainMenuCfg {
    id = 97,
    effect = 2,
    name = "限时礼包",
    sort = 107,
    icon = 42,
    type = 1,
    parameters = 1,
    cross_Shielding = 1
    };
getRow(98)->
    #mainMenuCfg {
    id = 98,
    effect = 0,
    name = "衣帽间",
    sort = 0,
    icon = 4,
    type = 1,
    parameters = 1000,
    cross_Shielding = 1
    };
getRow(99)->
    #mainMenuCfg {
    id = 99,
    effect = 2,
    name = "节日活动",
    sort = 109,
    icon = 52,
    type = 1,
    parameters = 1,
    cross_Shielding = 1
    };
getRow(100)->
    #mainMenuCfg {
    id = 100,
    effect = 0,
    name = "日常任务",
    sort = 0,
    icon = 0,
    type = 1,
    parameters = 37,
    cross_Shielding = 1
    };
getRow(101)->
    #mainMenuCfg {
    id = 101,
    effect = 0,
    name = "限时广场舞",
    sort = 0,
    icon = 0,
    type = 1,
    parameters = 30,
    cross_Shielding = 1
    };
getRow(102)->
    #mainMenuCfg {
    id = 102,
    effect = 0,
    name = "经验升降梯",
    sort = 0,
    icon = 28,
    type = 1,
    parameters = 64,
    cross_Shielding = 1
    };
getRow(103)->
    #mainMenuCfg {
    id = 103,
    effect = 0,
    name = "荣誉殿堂",
    sort = 0,
    icon = 3,
    type = 1,
    parameters = 10,
    cross_Shielding = 1
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
    {103}
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
    103
    ].

