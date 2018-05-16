%% coding: latin-1
%%: 实现
-module(cfg_monster_file_cht).
-compile(export_all).
-include("cfg_monster_file.hrl").
-include("logger.hrl").

getRow(1105)->
    #monster_fileCfg {
    monster_id = 1105,
    monster_name = "动感拳击手",
    size = 0.4,
    area = 7,
    area_name = "苍空雪域",
    rank = 1,
    unlock_way = [1,0],
    unlock_reward = [2,6,50],
    monster_desc = "炫酷吊炸天的时尚拳击手，拳拳到肉，战力非凡。",
    monster_area = "苍空雪域",
    extra_bonus = [140,58],
    extra_target = 1
    };
getRow(1106)->
    #monster_fileCfg {
    monster_id = 1106,
    monster_name = "绿皮绅士",
    size = 0.4,
    area = 12,
    area_name = "精灵避难所",
    rank = 1,
    unlock_way = [1,0],
    unlock_reward = [2,6,50],
    monster_desc = "鳄鱼家族中的首脑级人物，往往只出现在幕后。",
    monster_area = "精灵避难所",
    extra_bonus = [135,3344],
    extra_target = 1
    };
getRow(1107)->
    #monster_fileCfg {
    monster_id = 1107,
    monster_name = "红皮流氓",
    size = 0.4,
    area = 11,
    area_name = "精灵故土",
    rank = 1,
    unlock_way = [1,0],
    unlock_reward = [2,6,50],
    monster_desc = "热血的人龙流氓，流氓中的王者，破坏力超群。",
    monster_area = "精灵故土",
    extra_bonus = [143,116],
    extra_target = 1
    };
getRow(1108)->
    #monster_fileCfg {
    monster_id = 1108,
    monster_name = "炎角",
    size = 0.4,
    area = 13,
    area_name = "遗迹谷地",
    rank = 1,
    unlock_way = [1,0],
    unlock_reward = [2,6,50],
    monster_desc = "魔王最钟爱的坐骑，拥有绝对的统治力与破坏力。",
    monster_area = "遗迹谷地",
    extra_bonus = [142,155],
    extra_target = 1
    };
getRow(1109)->
    #monster_fileCfg {
    monster_id = 1109,
    monster_name = "冰晶龙",
    size = 0.2,
    area = 4,
    area_name = "苍空之塔",
    rank = 1,
    unlock_way = [1,0],
    unlock_reward = [2,6,50],
    monster_desc = "上古神兽，北方的守护者，绝对力量的化身。",
    monster_area = "苍空之塔",
    extra_bonus = [160,97],
    extra_target = 1
    };
getRow(1110)->
    #monster_fileCfg {
    monster_id = 1110,
    monster_name = "黑暗之魂",
    size = 0.4,
    area = 14,
    area_name = "黑暗森林",
    rank = 1,
    unlock_way = [1,0],
    unlock_reward = [2,6,50],
    monster_desc = "黑暗中的怨气聚集而成的强大负面能量。",
    monster_area = "黑暗森林",
    extra_bonus = [145,233],
    extra_target = 1
    };
getRow(1227)->
    #monster_fileCfg {
    monster_id = 1227,
    monster_name = "蓝史莱姆",
    size = 0.6,
    area = 10,
    area_name = "东城郊-野怪",
    rank = 7,
    unlock_way = [1,0],
    unlock_reward = [2,1,2000],
    monster_desc = "很久未在大陆出现的“原住民”生物。",
    monster_area = "阿克勒东城郊",
    extra_bonus = [143,39],
    extra_target = 5000
    };
getRow(1228)->
    #monster_fileCfg {
    monster_id = 1228,
    monster_name = "黄史莱姆",
    size = 0.6,
    area = 10,
    area_name = "东城郊-野怪",
    rank = 8,
    unlock_way = [1,0],
    unlock_reward = [2,1,2000],
    monster_desc = "很久未在大陆出现的“原住民”生物。",
    monster_area = "阿克勒东城郊",
    extra_bonus = [144,39],
    extra_target = 5000
    };
getRow(17007)->
    #monster_fileCfg {
    monster_id = 17007,
    monster_name = "精英-僵尸怪",
    size = 0.6,
    area = 3,
    area_name = "平原-精英怪",
    rank = 1,
    unlock_way = [1,0],
    unlock_reward = [2,6,50],
    monster_desc = "魔族派往阿克勒平原，侵略农田的魔化稻草人。",
    monster_area = "阿克勒平原",
    extra_bonus = [145,58],
    extra_target = 500
    };
getRow(17008)->
    #monster_fileCfg {
    monster_id = 17008,
    monster_name = "精英-巫毒娃娃",
    size = 0.7,
    area = 3,
    area_name = "平原-精英怪",
    rank = 2,
    unlock_way = [1,0],
    unlock_reward = [2,6,50],
    monster_desc = "被魔化的布偶，自身会飘散毒气。",
    monster_area = "阿克勒平原",
    extra_bonus = [146,58],
    extra_target = 500
    };
getRow(17009)->
    #monster_fileCfg {
    monster_id = 17009,
    monster_name = "精英-香菇战士",
    size = 0.7,
    area = 3,
    area_name = "平原-精英怪",
    rank = 3,
    unlock_way = [1,0],
    unlock_reward = [2,6,50],
    monster_desc = "蓝瘦香菇的近亲，用来煮汤味道鲜美。",
    monster_area = "阿克勒平原",
    extra_bonus = [160,58],
    extra_target = 500
    };
getRow(17010)->
    #monster_fileCfg {
    monster_id = 17010,
    monster_name = "精英-橘鬼花",
    size = 0.6,
    area = 3,
    area_name = "平原-精英怪",
    rank = 4,
    unlock_way = [1,0],
    unlock_reward = [2,6,50],
    monster_desc = "受到魔族魔化气息的感染，变得攻击性很强。",
    monster_area = "阿克勒平原",
    extra_bonus = [135,1003],
    extra_target = 500
    };
getRow(17011)->
    #monster_fileCfg {
    monster_id = 17011,
    monster_name = "精英-鲤鱼精",
    size = 0.7,
    area = 3,
    area_name = "平原-精英怪",
    rank = 5,
    unlock_way = [1,0],
    unlock_reward = [2,6,50],
    monster_desc = "在水中生存了很久的鲤鱼，已经成精了。",
    monster_area = "阿克勒平原",
    extra_bonus = [138,100],
    extra_target = 500
    };
getRow(17012)->
    #monster_fileCfg {
    monster_id = 17012,
    monster_name = "精英-胖头鱼",
    size = 0.7,
    area = 3,
    area_name = "平原-精英怪",
    rank = 6,
    unlock_way = [1,0],
    unlock_reward = [2,6,50],
    monster_desc = "会叫的水陆两栖鱼类，时不时发出rua..rua声。",
    monster_area = "阿克勒平原",
    extra_bonus = [139,100],
    extra_target = 500
    };
getRow(17013)->
    #monster_fileCfg {
    monster_id = 17013,
    monster_name = "精英-小绵羊",
    size = 0.7,
    area = 7,
    area_name = "苍空雪域",
    rank = 2,
    unlock_way = [1,0],
    unlock_reward = [2,6,50],
    monster_desc = "会产奶的小绵羊，不过性情比较暴躁",
    monster_area = "苍空雪域",
    extra_bonus = [141,58],
    extra_target = 500
    };
getRow(17014)->
    #monster_fileCfg {
    monster_id = 17014,
    monster_name = "精英-魔族士兵",
    size = 0.6,
    area = 7,
    area_name = "苍空雪域",
    rank = 3,
    unlock_way = [1,0],
    unlock_reward = [2,6,50],
    monster_desc = "侵占苍空雪域的魔族战士，他们以人数取胜。",
    monster_area = "苍空雪域",
    extra_bonus = [142,78],
    extra_target = 500
    };
getRow(17015)->
    #monster_fileCfg {
    monster_id = 17015,
    monster_name = "精英-豺狼人",
    size = 0.6,
    area = 7,
    area_name = "苍空雪域",
    rank = 4,
    unlock_way = [1,0],
    unlock_reward = [2,6,50],
    monster_desc = "从精灵故土被抓来当苦力的故土原住民。",
    monster_area = "苍空雪域",
    extra_bonus = [143,78],
    extra_target = 500
    };
getRow(17017)->
    #monster_fileCfg {
    monster_id = 17017,
    monster_name = "精英-北极熊",
    size = 0.7,
    area = 7,
    area_name = "苍空雪域",
    rank = 5,
    unlock_way = [1,0],
    unlock_reward = [2,6,50],
    monster_desc = "身材比北极熊要小，但毛皮同样保暖厚实。",
    monster_area = "苍空雪域",
    extra_bonus = [144,78],
    extra_target = 500
    };
getRow(17018)->
    #monster_fileCfg {
    monster_id = 17018,
    monster_name = "精英-魔族看押部队",
    size = 0.6,
    area = 7,
    area_name = "苍空雪域",
    rank = 6,
    unlock_way = [1,0],
    unlock_reward = [2,6,50],
    monster_desc = "专干脏活累活的苦力，有着一身蛮力。",
    monster_area = "苍空雪域",
    extra_bonus = [145,78],
    extra_target = 500
    };
getRow(17019)->
    #monster_fileCfg {
    monster_id = 17019,
    monster_name = "精英-能量雪球",
    size = 0.6,
    area = 7,
    area_name = "苍空雪域",
    rank = 7,
    unlock_way = [1,0],
    unlock_reward = [2,6,50],
    monster_desc = "毛茸茸的小精灵生物，有着强大的能量源。",
    monster_area = "苍空雪域",
    extra_bonus = [146,78],
    extra_target = 500
    };
getRow(17020)->
    #monster_fileCfg {
    monster_id = 17020,
    monster_name = "精英-鼠里鼠器",
    size = 0.6,
    area = 4,
    area_name = "苍空之塔",
    rank = 2,
    unlock_way = [1,0],
    unlock_reward = [2,6,50],
    monster_desc = "每秒300转的尾巴让老鼠飞了起来。",
    monster_area = "苍空之塔",
    extra_bonus = [135,1672],
    extra_target = 500
    };
getRow(17021)->
    #monster_fileCfg {
    monster_id = 17021,
    monster_name = "精英-魔化异虫伏击者",
    size = 0.6,
    area = 4,
    area_name = "苍空之塔",
    rank = 3,
    unlock_way = [1,0],
    unlock_reward = [2,6,50],
    monster_desc = "神秘的魔族伏击者，从袍中不断散发着害虫出来。",
    monster_area = "苍空之塔",
    extra_bonus = [138,167],
    extra_target = 500
    };
getRow(17022)->
    #monster_fileCfg {
    monster_id = 17022,
    monster_name = "精英-巫毒埋伏怪",
    size = 0.6,
    area = 4,
    area_name = "苍空之塔",
    rank = 4,
    unlock_way = [1,0],
    unlock_reward = [2,6,50],
    monster_desc = "被魔化的布偶，自身会飘散毒气。",
    monster_area = "苍空之塔",
    extra_bonus = [139,167],
    extra_target = 500
    };
getRow(17023)->
    #monster_fileCfg {
    monster_id = 17023,
    monster_name = "精英-原始精灵",
    size = 0.6,
    area = 4,
    area_name = "苍空之塔",
    rank = 5,
    unlock_way = [1,0],
    unlock_reward = [2,6,50],
    monster_desc = "充满着能量的神秘元素，请注意不要靠近。",
    monster_area = "苍空之塔",
    extra_bonus = [140,72],
    extra_target = 500
    };
getRow(17024)->
    #monster_fileCfg {
    monster_id = 17024,
    monster_name = "精英-毒气携带怪",
    size = 0.6,
    area = 4,
    area_name = "苍空之塔",
    rank = 6,
    unlock_way = [1,0],
    unlock_reward = [2,6,50],
    monster_desc = "被魔化的邪恶布偶，自身会飘散剧毒。",
    monster_area = "苍空之塔",
    extra_bonus = [141,72],
    extra_target = 500
    };
getRow(17025)->
    #monster_fileCfg {
    monster_id = 17025,
    monster_name = "精英-魔族异能士兵",
    size = 0.6,
    area = 4,
    area_name = "苍空之塔",
    rank = 7,
    unlock_way = [1,0],
    unlock_reward = [2,6,50],
    monster_desc = "神秘的魔族异能者，有着强大的魔力。",
    monster_area = "苍空之塔",
    extra_bonus = [142,97],
    extra_target = 500
    };
getRow(17026)->
    #monster_fileCfg {
    monster_id = 17026,
    monster_name = "精英-棕色豺狼人",
    size = 0.6,
    area = 11,
    area_name = "精灵故土",
    rank = 2,
    unlock_way = [1,0],
    unlock_reward = [2,6,50],
    monster_desc = "空有一身蛮力的故土原住民，膘肥身健。",
    monster_area = "精灵故土",
    extra_bonus = [144,116],
    extra_target = 500
    };
getRow(17027)->
    #monster_fileCfg {
    monster_id = 17027,
    monster_name = "精英-故土原住民",
    size = 0.6,
    area = 11,
    area_name = "精灵故土",
    rank = 3,
    unlock_way = [1,0],
    unlock_reward = [2,6,50],
    monster_desc = "手持大铁锤的黄皮子，精灵故土的原住民。",
    monster_area = "精灵故土",
    extra_bonus = [145,116],
    extra_target = 500
    };
getRow(17028)->
    #monster_fileCfg {
    monster_id = 17028,
    monster_name = "精英-黑暗蜘蛛团魔法师",
    size = 0.6,
    area = 11,
    area_name = "精灵故土",
    rank = 4,
    unlock_way = [1,0],
    unlock_reward = [2,6,50],
    monster_desc = "身穿红袍蒙着面的魔族巫师，就是他们黑化的精灵族人。",
    monster_area = "精灵故土",
    extra_bonus = [146,116],
    extra_target = 500
    };
getRow(17029)->
    #monster_fileCfg {
    monster_id = 17029,
    monster_name = "精英-魔族军需官",
    size = 0.6,
    area = 11,
    area_name = "精灵故土",
    rank = 5,
    unlock_way = [1,0],
    unlock_reward = [2,6,50],
    monster_desc = "掌管魔族军需库的军官，没人能看清他们的真面目。",
    monster_area = "精灵故土",
    extra_bonus = [139,201],
    extra_target = 500
    };
getRow(17030)->
    #monster_fileCfg {
    monster_id = 17030,
    monster_name = "精英-魔族侵略者",
    size = 0.6,
    area = 11,
    area_name = "精灵故土",
    rank = 6,
    unlock_way = [1,0],
    unlock_reward = [2,6,50],
    monster_desc = "侵略精灵故土的魔族军队主力，有着不俗的战斗力。",
    monster_area = "精灵故土",
    extra_bonus = [140,86],
    extra_target = 500
    };
getRow(17031)->
    #monster_fileCfg {
    monster_id = 17031,
    monster_name = "精英-魔化精灵",
    size = 0.6,
    area = 11,
    area_name = "精灵故土",
    rank = 7,
    unlock_way = [1,0],
    unlock_reward = [2,6,50],
    monster_desc = "被魔化的精灵族人，看见活物就疯狂撕咬。",
    monster_area = "精灵故土",
    extra_bonus = [141,86],
    extra_target = 500
    };
getRow(17035)->
    #monster_fileCfg {
    monster_id = 17035,
    monster_name = "精英-魔族巡逻队长",
    size = 0.6,
    area = 13,
    area_name = "遗迹谷地",
    rank = 2,
    unlock_way = [1,0],
    unlock_reward = [2,6,50],
    monster_desc = "魔族巡逻队老大，好吃懒做三高人群。",
    monster_area = "遗迹谷地",
    extra_bonus = [143,155],
    extra_target = 500
    };
getRow(17036)->
    #monster_fileCfg {
    monster_id = 17036,
    monster_name = "精英-魔族巡逻兵",
    size = 0.6,
    area = 13,
    area_name = "遗迹谷地",
    rank = 3,
    unlock_way = [1,0],
    unlock_reward = [2,6,50],
    monster_desc = "魔族巡逻队成员，被施加了不死诅咒的存在。",
    monster_area = "遗迹谷地",
    extra_bonus = [144,155],
    extra_target = 500
    };
getRow(17037)->
    #monster_fileCfg {
    monster_id = 17037,
    monster_name = "精英-魔族游荡祭司",
    size = 0.6,
    area = 13,
    area_name = "遗迹谷地",
    rank = 4,
    unlock_way = [1,0],
    unlock_reward = [2,6,50],
    monster_desc = "走火入魔的魔族祭司，漫无目的游走于遗迹谷地各处。",
    monster_area = "遗迹谷地",
    extra_bonus = [145,155],
    extra_target = 500
    };
getRow(17038)->
    #monster_fileCfg {
    monster_id = 17038,
    monster_name = "精英-魔化精灵",
    size = 0.6,
    area = 13,
    area_name = "遗迹谷地",
    rank = 5,
    unlock_way = [1,0],
    unlock_reward = [2,6,50],
    monster_desc = "被魔化的精灵族人，看见活物就疯狂撕咬。",
    monster_area = "遗迹谷地",
    extra_bonus = [146,155],
    extra_target = 500
    };
getRow(17041)->
    #monster_fileCfg {
    monster_id = 17041,
    monster_name = "精英-魔化曼陀罗花怪",
    size = 0.6,
    area = 13,
    area_name = "遗迹谷地",
    rank = 6,
    unlock_way = [1,0],
    unlock_reward = [2,6,50],
    monster_desc = "被魔化的何首乌精，可不要被他可爱的外表所迷惑。",
    monster_area = "遗迹谷地",
    extra_bonus = [160,155],
    extra_target = 500
    };
getRow(17043)->
    #monster_fileCfg {
    monster_id = 17043,
    monster_name = "精英-大黄蜂",
    size = 0.6,
    area = 12,
    area_name = "精灵避难所",
    rank = 2,
    unlock_way = [1,0],
    unlock_reward = [2,6,50],
    monster_desc = "这么大的蜜蜂，只在精灵避难所的纯净环境中才有。",
    monster_area = "精灵避难所",
    extra_bonus = [138,334],
    extra_target = 500
    };
getRow(17044)->
    #monster_fileCfg {
    monster_id = 17044,
    monster_name = "精英-白月狐",
    size = 1,
    area = 12,
    area_name = "精灵避难所",
    rank = 3,
    unlock_way = [1,0],
    unlock_reward = [2,6,50],
    monster_desc = "乖巧的白色小狐狸，精灵避难所的可爱担当。",
    monster_area = "精灵避难所",
    extra_bonus = [139,334],
    extra_target = 500
    };
getRow(17045)->
    #monster_fileCfg {
    monster_id = 17045,
    monster_name = "精英-曼陀罗花怪",
    size = 0.6,
    area = 12,
    area_name = "精灵避难所",
    rank = 4,
    unlock_way = [1,0],
    unlock_reward = [2,6,50],
    monster_desc = "没有被污染的何首污，名贵的药材，成精就更不得了。",
    monster_area = "精灵避难所",
    extra_bonus = [140,144],
    extra_target = 500
    };
getRow(17046)->
    #monster_fileCfg {
    monster_id = 17046,
    monster_name = "精英-食人花",
    size = 0.6,
    area = 12,
    area_name = "精灵避难所",
    rank = 5,
    unlock_way = [1,0],
    unlock_reward = [2,6,50],
    monster_desc = "喜阴的食人花，可得小心它带毒的大嘴巴。",
    monster_area = "精灵避难所",
    extra_bonus = [141,144],
    extra_target = 500
    };
getRow(17047)->
    #monster_fileCfg {
    monster_id = 17047,
    monster_name = "精英-树精守卫",
    size = 0.6,
    area = 12,
    area_name = "精灵避难所",
    rank = 6,
    unlock_way = [1,0],
    unlock_reward = [2,6,50],
    monster_desc = "守护精灵避难所的树精原住民。",
    monster_area = "精灵避难所",
    extra_bonus = [142,194],
    extra_target = 500
    };
getRow(17048)->
    #monster_fileCfg {
    monster_id = 17048,
    monster_name = "精英-锤尾鳄",
    size = 0.6,
    area = 12,
    area_name = "精灵避难所",
    rank = 7,
    unlock_way = [1,0],
    unlock_reward = [2,6,50],
    monster_desc = "河中凶狠的鳄鱼，靠近一定要小心。",
    monster_area = "精灵避难所",
    extra_bonus = [143,194],
    extra_target = 500
    };
getRow(17049)->
    #monster_fileCfg {
    monster_id = 17049,
    monster_name = "精英-绿野仙精",
    size = 0.6,
    area = 12,
    area_name = "精灵避难所",
    rank = 8,
    unlock_way = [1,0],
    unlock_reward = [2,6,50],
    monster_desc = "美丽的精灵仙子，精灵避难所的原住民。",
    monster_area = "精灵避难所",
    extra_bonus = [144,194],
    extra_target = 500
    };
getRow(17056)->
    #monster_fileCfg {
    monster_id = 17056,
    monster_name = "精英-狂暴棕熊",
    size = 0.6,
    area = 14,
    area_name = "黑暗森林",
    rank = 2,
    unlock_way = [1,0],
    unlock_reward = [2,6,50],
    monster_desc = "不一般的棕熊，随时都像要发怒的样子",
    monster_area = "黑暗森林",
    extra_bonus = [146,233],
    extra_target = 500
    };
getRow(17057)->
    #monster_fileCfg {
    monster_id = 17057,
    monster_name = "精英-变异刺蛇",
    size = 0.3,
    area = 14,
    area_name = "黑暗森林",
    rank = 3,
    unlock_way = [1,0],
    unlock_reward = [2,6,50],
    monster_desc = "看上去就很危险的生物，看见它千万要小心了。",
    monster_area = "黑暗森林",
    extra_bonus = [160,233],
    extra_target = 500
    };
getRow(17058)->
    #monster_fileCfg {
    monster_id = 17058,
    monster_name = "精英-巨蝙蝠",
    size = 0.6,
    area = 14,
    area_name = "黑暗森林",
    rank = 4,
    unlock_way = [1,0],
    unlock_reward = [2,6,50],
    monster_desc = "虽然是蝙蝠系，在夜晚也经常会迷路",
    monster_area = "黑暗森林",
    extra_bonus = [135,4013],
    extra_target = 500
    };
getRow(17059)->
    #monster_fileCfg {
    monster_id = 17059,
    monster_name = "精英-小恶魔",
    size = 0.6,
    area = 14,
    area_name = "黑暗森林",
    rank = 5,
    unlock_way = [1,0],
    unlock_reward = [2,6,50],
    monster_desc = "看上去人畜无害的小恶魔，经常会对人类进行一些恶作剧",
    monster_area = "黑暗森林",
    extra_bonus = [138,401],
    extra_target = 500
    };
getRow(17060)->
    #monster_fileCfg {
    monster_id = 17060,
    monster_name = "精英-黑岩傀儡",
    size = 0.3,
    area = 14,
    area_name = "黑暗森林",
    rank = 6,
    unlock_way = [1,0],
    unlock_reward = [2,6,50],
    monster_desc = "有着坚硬皮肤的生物，对人类并没有敌意",
    monster_area = "黑暗森林",
    extra_bonus = [139,401],
    extra_target = 500
    };
getRow(17061)->
    #monster_fileCfg {
    monster_id = 17061,
    monster_name = "精英-绿魔鬼",
    size = 0.5,
    area = 14,
    area_name = "黑暗森林",
    rank = 7,
    unlock_way = [1,0],
    unlock_reward = [2,6,50],
    monster_desc = "看上去憨头憨脑的，有着不寻常大小的力气",
    monster_area = "黑暗森林",
    extra_bonus = [140,173],
    extra_target = 500
    };
getRow(22053)->
    #monster_fileCfg {
    monster_id = 22053,
    monster_name = "小绵羊",
    size = 0.7,
    area = 7,
    area_name = "苍空雪域",
    rank = 8,
    unlock_way = [1,0],
    unlock_reward = [2,1,5000],
    monster_desc = "会产奶的小绵羊，不过性情比较暴躁",
    monster_area = "苍空雪域",
    extra_bonus = [141,58],
    extra_target = 20000
    };
getRow(30001)->
    #monster_fileCfg {
    monster_id = 30001,
    monster_name = "香辣蟹",
    size = 0.6,
    area = 10,
    area_name = "东城郊-主线任务",
    rank = 1,
    unlock_way = [1,0],
    unlock_reward = [2,1,2000],
    monster_desc = "自带香辣味道的海螃蟹，阿克勒东城郊海边的美味。",
    monster_area = "阿克勒东城郊",
    extra_bonus = [135,669],
    extra_target = 5000
    };
getRow(30002)->
    #monster_fileCfg {
    monster_id = 30002,
    monster_name = "骨头卫兵",
    size = 0.7,
    area = 10,
    area_name = "东城郊-野怪",
    rank = 2,
    unlock_way = [1,0],
    unlock_reward = [2,1,2000],
    monster_desc = "被魔王复活过来的骷髅士兵，长相吓人但战力较弱。",
    monster_area = "阿克勒东城郊",
    extra_bonus = [138,67],
    extra_target = 5000
    };
getRow(30003)->
    #monster_fileCfg {
    monster_id = 30003,
    monster_name = "地精卫兵",
    size = 0.7,
    area = 10,
    area_name = "东城郊-主线任务",
    rank = 3,
    unlock_way = [1,0],
    unlock_reward = [2,1,2000],
    monster_desc = "魔族内部都觉得这货是从火星来的ET外星生物，傻萌呆。",
    monster_area = "阿克勒东城郊",
    extra_bonus = [139,67],
    extra_target = 5000
    };
getRow(30004)->
    #monster_fileCfg {
    monster_id = 30004,
    monster_name = "魔族蛋蛋兵",
    size = 0.7,
    area = 10,
    area_name = "东城郊-野怪",
    rank = 4,
    unlock_way = [1,0],
    unlock_reward = [2,1,2000],
    monster_desc = "论爆炸头，谁都不敢跟满脑TNT炸药的蛋蛋兵相提并论。",
    monster_area = "阿克勒东城郊",
    extra_bonus = [140,29],
    extra_target = 5000
    };
getRow(30005)->
    #monster_fileCfg {
    monster_id = 30005,
    monster_name = "魔族大球",
    size = 0.6,
    area = 10,
    area_name = "东城郊-野怪",
    rank = 5,
    unlock_way = [1,0],
    unlock_reward = [2,1,2000],
    monster_desc = "被毒气瓦斯充满了全身的圆滚滚魔物。",
    monster_area = "阿克勒东城郊",
    extra_bonus = [141,29],
    extra_target = 5000
    };
getRow(30016)->
    #monster_fileCfg {
    monster_id = 30016,
    monster_name = "魔族宝箱怪",
    size = 1,
    area = 10,
    area_name = "东城郊-野怪",
    rank = 6,
    unlock_way = [1,0],
    unlock_reward = [2,1,2000],
    monster_desc = "常年寄居在废弃宝箱之中的海洋魔物。",
    monster_area = "阿克勒东城郊",
    extra_bonus = [142,39],
    extra_target = 5000
    };
getRow(30017)->
    #monster_fileCfg {
    monster_id = 30017,
    monster_name = "僵尸怪",
    size = 0.6,
    area = 3,
    area_name = "平原-野怪",
    rank = 7,
    unlock_way = [1,0],
    unlock_reward = [2,1,3000],
    monster_desc = "魔族派往阿克勒平原，侵略农田的魔化稻草人。",
    monster_area = "阿克勒平原",
    extra_bonus = [145,58],
    extra_target = 15000
    };
getRow(30026)->
    #monster_fileCfg {
    monster_id = 30026,
    monster_name = "巫毒娃娃",
    size = 0.7,
    area = 3,
    area_name = "平原-野怪-装饰怪",
    rank = 8,
    unlock_way = [1,0],
    unlock_reward = [2,1,3000],
    monster_desc = "被魔化的布偶，自身会飘散毒气。",
    monster_area = "阿克勒平原",
    extra_bonus = [146,58],
    extra_target = 15000
    };
getRow(30027)->
    #monster_fileCfg {
    monster_id = 30027,
    monster_name = "香菇战士",
    size = 0.7,
    area = 3,
    area_name = "平原-野怪",
    rank = 9,
    unlock_way = [1,0],
    unlock_reward = [2,1,3000],
    monster_desc = "蓝瘦香菇的近亲，用来煮汤味道鲜美。",
    monster_area = "阿克勒平原",
    extra_bonus = [160,58],
    extra_target = 15000
    };
getRow(30028)->
    #monster_fileCfg {
    monster_id = 30028,
    monster_name = "橘鬼花",
    size = 0.6,
    area = 3,
    area_name = "平原-野怪",
    rank = 10,
    unlock_way = [1,0],
    unlock_reward = [2,1,3000],
    monster_desc = "受到魔族魔化气息的感染，变得攻击性很强。",
    monster_area = "阿克勒平原",
    extra_bonus = [135,1003],
    extra_target = 15000
    };
getRow(30052)->
    #monster_fileCfg {
    monster_id = 30052,
    monster_name = "鲤鱼精",
    size = 0.7,
    area = 3,
    area_name = "平原-野怪",
    rank = 11,
    unlock_way = [1,0],
    unlock_reward = [2,1,3000],
    monster_desc = "在水中生存了很久的鲤鱼，已经成精了。",
    monster_area = "阿克勒平原",
    extra_bonus = [138,100],
    extra_target = 15000
    };
getRow(30053)->
    #monster_fileCfg {
    monster_id = 30053,
    monster_name = "胖头鱼",
    size = 0.7,
    area = 3,
    area_name = "平原-野怪",
    rank = 12,
    unlock_way = [1,0],
    unlock_reward = [2,1,3000],
    monster_desc = "会叫的水陆两栖鱼类，时不时发出rua..rua声。",
    monster_area = "阿克勒平原",
    extra_bonus = [139,100],
    extra_target = 15000
    };
getRow(30055)->
    #monster_fileCfg {
    monster_id = 30055,
    monster_name = "魔族士兵",
    size = 0.6,
    area = 7,
    area_name = "苍空雪域",
    rank = 9,
    unlock_way = [1,0],
    unlock_reward = [2,1,5000],
    monster_desc = "侵占苍空雪域的魔族战士，他们以人数取胜。",
    monster_area = "苍空雪域",
    extra_bonus = [142,78],
    extra_target = 20000
    };
getRow(30056)->
    #monster_fileCfg {
    monster_id = 30056,
    monster_name = "豺狼人",
    size = 0.6,
    area = 7,
    area_name = "苍空雪域",
    rank = 10,
    unlock_way = [1,0],
    unlock_reward = [2,1,5000],
    monster_desc = "从精灵故土被抓来当苦力的故土原住民。",
    monster_area = "苍空雪域",
    extra_bonus = [143,78],
    extra_target = 20000
    };
getRow(30060)->
    #monster_fileCfg {
    monster_id = 30060,
    monster_name = "巫毒埋伏怪",
    size = 0.6,
    area = 4,
    area_name = "苍空之塔",
    rank = 10,
    unlock_way = [1,0],
    unlock_reward = [2,1,6000],
    monster_desc = "被魔化的布偶，自身会飘散毒气。",
    monster_area = "苍空之塔",
    extra_bonus = [139,167],
    extra_target = 40000
    };
getRow(30061)->
    #monster_fileCfg {
    monster_id = 30061,
    monster_name = "原始精灵",
    size = 0.6,
    area = 4,
    area_name = "苍空之塔",
    rank = 11,
    unlock_way = [1,0],
    unlock_reward = [2,1,6000],
    monster_desc = "充满着能量的神秘元素，请注意不要靠近。",
    monster_area = "苍空之塔",
    extra_bonus = [140,72],
    extra_target = 40000
    };
getRow(30062)->
    #monster_fileCfg {
    monster_id = 30062,
    monster_name = "毒气携带怪",
    size = 0.6,
    area = 4,
    area_name = "苍空之塔",
    rank = 12,
    unlock_way = [1,0],
    unlock_reward = [2,1,6000],
    monster_desc = "被魔化的邪恶布偶，自身会飘散剧毒。",
    monster_area = "苍空之塔",
    extra_bonus = [141,72],
    extra_target = 40000
    };
getRow(30065)->
    #monster_fileCfg {
    monster_id = 30065,
    monster_name = "白熊",
    size = 0.7,
    area = 7,
    area_name = "苍空雪域",
    rank = 11,
    unlock_way = [1,0],
    unlock_reward = [2,1,5000],
    monster_desc = "身材比北极熊要小，但毛皮同样保暖厚实。",
    monster_area = "苍空雪域",
    extra_bonus = [144,78],
    extra_target = 20000
    };
getRow(30083)->
    #monster_fileCfg {
    monster_id = 30083,
    monster_name = "魔族看押部队",
    size = 0.6,
    area = 7,
    area_name = "苍空雪域",
    rank = 12,
    unlock_way = [1,0],
    unlock_reward = [2,1,5000],
    monster_desc = "专干脏活累活的苦力，有着一身蛮力。",
    monster_area = "苍空雪域",
    extra_bonus = [145,78],
    extra_target = 20000
    };
getRow(30084)->
    #monster_fileCfg {
    monster_id = 30084,
    monster_name = "能量雪球",
    size = 0.6,
    area = 7,
    area_name = "苍空雪域",
    rank = 13,
    unlock_way = [1,0],
    unlock_reward = [2,1,5000],
    monster_desc = "毛茸茸的小精灵生物，有着强大的能量源。",
    monster_area = "苍空雪域",
    extra_bonus = [146,78],
    extra_target = 20000
    };
getRow(30094)->
    #monster_fileCfg {
    monster_id = 30094,
    monster_name = "鼠里鼠器",
    size = 0.6,
    area = 4,
    area_name = "苍空之塔",
    rank = 8,
    unlock_way = [1,0],
    unlock_reward = [2,1,6000],
    monster_desc = "每秒300转的尾巴让老鼠飞了起来。",
    monster_area = "苍空之塔",
    extra_bonus = [135,1672],
    extra_target = 40000
    };
getRow(30095)->
    #monster_fileCfg {
    monster_id = 30095,
    monster_name = "魔化异虫伏击者",
    size = 0.6,
    area = 4,
    area_name = "苍空之塔",
    rank = 9,
    unlock_way = [1,0],
    unlock_reward = [2,1,6000],
    monster_desc = "神秘的魔族伏击者，从袍中不断散发着害虫出来。",
    monster_area = "苍空之塔",
    extra_bonus = [138,167],
    extra_target = 40000
    };
getRow(30096)->
    #monster_fileCfg {
    monster_id = 30096,
    monster_name = "魔族异能士兵",
    size = 0.6,
    area = 4,
    area_name = "苍空之塔",
    rank = 13,
    unlock_way = [1,0],
    unlock_reward = [2,1,6000],
    monster_desc = "神秘的魔族异能者，有着强大的魔力。",
    monster_area = "苍空之塔",
    extra_bonus = [142,97],
    extra_target = 40000
    };
getRow(30098)->
    #monster_fileCfg {
    monster_id = 30098,
    monster_name = "棕色豺狼人",
    size = 0.6,
    area = 11,
    area_name = "精灵故土",
    rank = 9,
    unlock_way = [1,0],
    unlock_reward = [2,1,8000],
    monster_desc = "手持大铁锤的黄皮子，精灵故土的原住民。",
    monster_area = "精灵故土",
    extra_bonus = [145,116],
    extra_target = 60000
    };
getRow(30103)->
    #monster_fileCfg {
    monster_id = 30103,
    monster_name = "黑暗蜘蛛团魔法师",
    size = 0.6,
    area = 11,
    area_name = "精灵故土",
    rank = 10,
    unlock_way = [1,0],
    unlock_reward = [2,1,8000],
    monster_desc = "身穿红袍蒙着面的魔族巫师，就是他们黑化的精灵族人。",
    monster_area = "精灵故土",
    extra_bonus = [146,116],
    extra_target = 60000
    };
getRow(30107)->
    #monster_fileCfg {
    monster_id = 30107,
    monster_name = "邪风女妖首领",
    size = 0.2,
    area = 11,
    area_name = "精灵故土",
    rank = 11,
    unlock_way = [1,0],
    unlock_reward = [2,1,8000],
    monster_desc = "黄沙统领得意的部下，能够唤风的魔族女妖首领。",
    monster_area = "精灵故土",
    extra_bonus = [160,116],
    extra_target = 500
    };
getRow(30108)->
    #monster_fileCfg {
    monster_id = 30108,
    monster_name = "堕土女妖首领",
    size = 0.2,
    area = 11,
    area_name = "精灵故土",
    rank = 12,
    unlock_way = [1,0],
    unlock_reward = [2,1,8000],
    monster_desc = "黄沙统领得意的部下，能够掌控土的魔族女妖首领。",
    monster_area = "精灵故土",
    extra_bonus = [135,2006],
    extra_target = 500
    };
getRow(30109)->
    #monster_fileCfg {
    monster_id = 30109,
    monster_name = "魔族黄沙统领",
    size = 0.6,
    area = 11,
    area_name = "精灵故土",
    rank = 13,
    unlock_way = [1,0],
    unlock_reward = [2,1,8000],
    monster_desc = "魔族雄踞一方的统领，有着超凡的破坏力。",
    monster_area = "精灵故土",
    extra_bonus = [138,201],
    extra_target = 500
    };
getRow(30129)->
    #monster_fileCfg {
    monster_id = 30129,
    monster_name = "魔族巡逻队长",
    size = 0.6,
    area = 13,
    area_name = "遗迹谷地",
    rank = 7,
    unlock_way = [1,0],
    unlock_reward = [2,1,10000],
    monster_desc = "魔族巡逻队老大，好吃懒做三高人群。",
    monster_area = "遗迹谷地",
    extra_bonus = [143,155],
    extra_target = 100000
    };
getRow(30130)->
    #monster_fileCfg {
    monster_id = 30130,
    monster_name = "魔族巡逻兵",
    size = 0.6,
    area = 13,
    area_name = "遗迹谷地",
    rank = 8,
    unlock_way = [1,0],
    unlock_reward = [2,1,10000],
    monster_desc = "魔族巡逻队成员，被施加了不死诅咒的存在。",
    monster_area = "遗迹谷地",
    extra_bonus = [144,155],
    extra_target = 100000
    };
getRow(30131)->
    #monster_fileCfg {
    monster_id = 30131,
    monster_name = "魔族游荡祭司",
    size = 0.6,
    area = 13,
    area_name = "遗迹谷地",
    rank = 9,
    unlock_way = [1,0],
    unlock_reward = [2,1,10000],
    monster_desc = "走火入魔的魔族祭司，漫无目的游走于遗迹谷地各处。",
    monster_area = "遗迹谷地",
    extra_bonus = [145,155],
    extra_target = 100000
    };
getRow(30132)->
    #monster_fileCfg {
    monster_id = 30132,
    monster_name = "魔化精灵",
    size = 0.6,
    area = 13,
    area_name = "遗迹谷地",
    rank = 10,
    unlock_way = [1,0],
    unlock_reward = [2,1,10000],
    monster_desc = "被魔化的精灵族人，看见活物就疯狂撕咬。",
    monster_area = "遗迹谷地",
    extra_bonus = [146,155],
    extra_target = 100000
    };
getRow(30133)->
    #monster_fileCfg {
    monster_id = 30133,
    monster_name = "魔族军需官",
    size = 0.6,
    area = 11,
    area_name = "精灵故土",
    rank = 14,
    unlock_way = [1,0],
    unlock_reward = [2,1,8000],
    monster_desc = "掌管魔族军需库的军官，没人能看清他们的真面目。",
    monster_area = "精灵故土",
    extra_bonus = [139,201],
    extra_target = 60000
    };
getRow(30134)->
    #monster_fileCfg {
    monster_id = 30134,
    monster_name = "魔族侵略者",
    size = 0.6,
    area = 11,
    area_name = "精灵故土",
    rank = 15,
    unlock_way = [1,0],
    unlock_reward = [2,1,8000],
    monster_desc = "侵略精灵故土的魔族军队主力，有着不俗的战斗力。",
    monster_area = "精灵故土",
    extra_bonus = [140,86],
    extra_target = 60000
    };
getRow(30135)->
    #monster_fileCfg {
    monster_id = 30135,
    monster_name = "魔化精灵",
    size = 0.6,
    area = 11,
    area_name = "精灵故土",
    rank = 16,
    unlock_way = [1,0],
    unlock_reward = [2,1,8000],
    monster_desc = "被魔化的精灵族人，看见活物就疯狂撕咬。",
    monster_area = "精灵故土",
    extra_bonus = [141,86],
    extra_target = 60000
    };
getRow(30136)->
    #monster_fileCfg {
    monster_id = 30136,
    monster_name = "曼陀罗花怪",
    size = 0.6,
    area = 13,
    area_name = "遗迹谷地",
    rank = 11,
    unlock_way = [1,0],
    unlock_reward = [2,1,10000],
    monster_desc = "被魔化的何首乌精，可不要被他可爱的外表所迷惑。",
    monster_area = "遗迹谷地",
    extra_bonus = [160,155],
    extra_target = 100000
    };
getRow(30137)->
    #monster_fileCfg {
    monster_id = 30137,
    monster_name = "嗡嗡蜂",
    size = 0.6,
    area = 12,
    area_name = "精灵避难所",
    rank = 9,
    unlock_way = [1,0],
    unlock_reward = [2,1,10000],
    monster_desc = "这么大的蜜蜂，只在精灵避难所的纯净环境中才有。",
    monster_area = "精灵避难所",
    extra_bonus = [138,334],
    extra_target = 150000
    };
getRow(30138)->
    #monster_fileCfg {
    monster_id = 30138,
    monster_name = "白月狐",
    size = 1,
    area = 12,
    area_name = "精灵避难所",
    rank = 10,
    unlock_way = [1,0],
    unlock_reward = [2,1,10000],
    monster_desc = "乖巧的白色小狐狸，精灵避难所的可爱担当。",
    monster_area = "精灵避难所",
    extra_bonus = [139,334],
    extra_target = 150000
    };
getRow(30139)->
    #monster_fileCfg {
    monster_id = 30139,
    monster_name = "曼陀罗花怪",
    size = 0.6,
    area = 12,
    area_name = "精灵避难所",
    rank = 11,
    unlock_way = [1,0],
    unlock_reward = [2,1,10000],
    monster_desc = "没有被污染的何首污，名贵的药材，成精就更不得了。",
    monster_area = "精灵避难所",
    extra_bonus = [140,144],
    extra_target = 150000
    };
getRow(30140)->
    #monster_fileCfg {
    monster_id = 30140,
    monster_name = "食人花",
    size = 0.6,
    area = 12,
    area_name = "精灵避难所",
    rank = 12,
    unlock_way = [1,0],
    unlock_reward = [2,1,10000],
    monster_desc = "喜阴的食人花，可得小心它带毒的大嘴巴。",
    monster_area = "精灵避难所",
    extra_bonus = [141,144],
    extra_target = 150000
    };
getRow(30141)->
    #monster_fileCfg {
    monster_id = 30141,
    monster_name = "树精守卫",
    size = 0.6,
    area = 12,
    area_name = "精灵避难所",
    rank = 13,
    unlock_way = [1,0],
    unlock_reward = [2,1,10000],
    monster_desc = "守护精灵避难所的树精原住民。",
    monster_area = "精灵避难所",
    extra_bonus = [142,194],
    extra_target = 150000
    };
getRow(30142)->
    #monster_fileCfg {
    monster_id = 30142,
    monster_name = "锤尾鳄",
    size = 0.6,
    area = 12,
    area_name = "精灵避难所",
    rank = 14,
    unlock_way = [1,0],
    unlock_reward = [2,1,10000],
    monster_desc = "河中凶狠的鳄鱼，靠近一定要小心。",
    monster_area = "精灵避难所",
    extra_bonus = [143,194],
    extra_target = 150000
    };
getRow(30143)->
    #monster_fileCfg {
    monster_id = 30143,
    monster_name = "绿野仙精",
    size = 0.6,
    area = 12,
    area_name = "精灵避难所",
    rank = 15,
    unlock_way = [1,0],
    unlock_reward = [2,1,10000],
    monster_desc = "美丽的精灵仙子，精灵避难所的原住民。",
    monster_area = "精灵避难所",
    extra_bonus = [144,194],
    extra_target = 150000
    };
getRow(35011)->
    #monster_fileCfg {
    monster_id = 35011,
    monster_name = "故土原住民",
    size = 0.6,
    area = 11,
    area_name = "精灵故土",
    rank = 8,
    unlock_way = [1,0],
    unlock_reward = [2,1,8000],
    monster_desc = "空有一身蛮力的故土原住民，膘肥身健。",
    monster_area = "精灵故土",
    extra_bonus = [144,116],
    extra_target = 60000
    };
getRow(35046)->
    #monster_fileCfg {
    monster_id = 35046,
    monster_name = "狂暴棕熊",
    size = 0.6,
    area = 14,
    area_name = "黑暗森林",
    rank = 8,
    unlock_way = [1,0],
    unlock_reward = [2,1,10000],
    monster_desc = "不一般的棕熊，随时都像要发怒的样子",
    monster_area = "黑暗森林",
    extra_bonus = [146,233],
    extra_target = 200000
    };
getRow(35047)->
    #monster_fileCfg {
    monster_id = 35047,
    monster_name = "变异刺蛇",
    size = 0.3,
    area = 14,
    area_name = "黑暗森林",
    rank = 9,
    unlock_way = [1,0],
    unlock_reward = [2,1,10000],
    monster_desc = "看上去就很危险的生物，看见它千万要小心了。",
    monster_area = "黑暗森林",
    extra_bonus = [160,233],
    extra_target = 200000
    };
getRow(35048)->
    #monster_fileCfg {
    monster_id = 35048,
    monster_name = "巨蝙蝠",
    size = 0.6,
    area = 14,
    area_name = "黑暗森林",
    rank = 10,
    unlock_way = [1,0],
    unlock_reward = [2,1,10000],
    monster_desc = "虽然是蝙蝠系，在夜晚也经常会迷路",
    monster_area = "黑暗森林",
    extra_bonus = [135,4013],
    extra_target = 200000
    };
getRow(35049)->
    #monster_fileCfg {
    monster_id = 35049,
    monster_name = "小恶魔",
    size = 0.6,
    area = 14,
    area_name = "黑暗森林",
    rank = 11,
    unlock_way = [1,0],
    unlock_reward = [2,1,10000],
    monster_desc = "看上去人畜无害的小恶魔，经常会对人类进行一些恶作剧",
    monster_area = "黑暗森林",
    extra_bonus = [138,401],
    extra_target = 200000
    };
getRow(35050)->
    #monster_fileCfg {
    monster_id = 35050,
    monster_name = "黑岩傀儡",
    size = 0.3,
    area = 14,
    area_name = "黑暗森林",
    rank = 12,
    unlock_way = [1,0],
    unlock_reward = [2,1,10000],
    monster_desc = "有着坚硬皮肤的生物，对人类并没有敌意",
    monster_area = "黑暗森林",
    extra_bonus = [139,401],
    extra_target = 200000
    };
getRow(35051)->
    #monster_fileCfg {
    monster_id = 35051,
    monster_name = "绿魔鬼",
    size = 0.5,
    area = 14,
    area_name = "黑暗森林",
    rank = 13,
    unlock_way = [1,0],
    unlock_reward = [2,1,10000],
    monster_desc = "看上去憨头憨脑的，有着不寻常大小的力气",
    monster_area = "黑暗森林",
    extra_bonus = [140,173],
    extra_target = 200000
    };
getRow(_)->[].

getKeyList()->[
    {1105},
    {1106},
    {1107},
    {1108},
    {1109},
    {1110},
    {1227},
    {1228},
    {17007},
    {17008},
    {17009},
    {17010},
    {17011},
    {17012},
    {17013},
    {17014},
    {17015},
    {17017},
    {17018},
    {17019},
    {17020},
    {17021},
    {17022},
    {17023},
    {17024},
    {17025},
    {17026},
    {17027},
    {17028},
    {17029},
    {17030},
    {17031},
    {17035},
    {17036},
    {17037},
    {17038},
    {17041},
    {17043},
    {17044},
    {17045},
    {17046},
    {17047},
    {17048},
    {17049},
    {17056},
    {17057},
    {17058},
    {17059},
    {17060},
    {17061},
    {22053},
    {30001},
    {30002},
    {30003},
    {30004},
    {30005},
    {30016},
    {30017},
    {30026},
    {30027},
    {30028},
    {30052},
    {30053},
    {30055},
    {30056},
    {30060},
    {30061},
    {30062},
    {30065},
    {30083},
    {30084},
    {30094},
    {30095},
    {30096},
    {30098},
    {30103},
    {30107},
    {30108},
    {30109},
    {30129},
    {30130},
    {30131},
    {30132},
    {30133},
    {30134},
    {30135},
    {30136},
    {30137},
    {30138},
    {30139},
    {30140},
    {30141},
    {30142},
    {30143},
    {35011},
    {35046},
    {35047},
    {35048},
    {35049},
    {35050},
    {35051}
    ].

get1KeyList()->[
    1105,
    1106,
    1107,
    1108,
    1109,
    1110,
    1227,
    1228,
    17007,
    17008,
    17009,
    17010,
    17011,
    17012,
    17013,
    17014,
    17015,
    17017,
    17018,
    17019,
    17020,
    17021,
    17022,
    17023,
    17024,
    17025,
    17026,
    17027,
    17028,
    17029,
    17030,
    17031,
    17035,
    17036,
    17037,
    17038,
    17041,
    17043,
    17044,
    17045,
    17046,
    17047,
    17048,
    17049,
    17056,
    17057,
    17058,
    17059,
    17060,
    17061,
    22053,
    30001,
    30002,
    30003,
    30004,
    30005,
    30016,
    30017,
    30026,
    30027,
    30028,
    30052,
    30053,
    30055,
    30056,
    30060,
    30061,
    30062,
    30065,
    30083,
    30084,
    30094,
    30095,
    30096,
    30098,
    30103,
    30107,
    30108,
    30109,
    30129,
    30130,
    30131,
    30132,
    30133,
    30134,
    30135,
    30136,
    30137,
    30138,
    30139,
    30140,
    30141,
    30142,
    30143,
    35011,
    35046,
    35047,
    35048,
    35049,
    35050,
    35051
    ].

