%% coding: latin-1
%%: 实现
-module(cfg_pet_skills_upgrading_cht).
-compile(export_all).
-include("cfg_pet_skills_upgrading.hrl").
-include("logger.hrl").

getRow(1601,1)->
    #pet_skills_upgradingCfg {
    skill_id = 1601,
    level = 1,
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "一次普通的攻击，造成140%攻击的伤害",
    fightForce = 0
    };
getRow(1602,1)->
    #pet_skills_upgradingCfg {
    skill_id = 1602,
    level = 1,
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "一次普通的攻击，造成116%攻击的伤害",
    fightForce = 0
    };
getRow(1603,1)->
    #pet_skills_upgradingCfg {
    skill_id = 1603,
    level = 1,
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "一次普通的攻击，造成116%攻击的伤害",
    fightForce = 0
    };
getRow(1636,1)->
    #pet_skills_upgradingCfg {
    skill_id = 1636,
    level = 1,
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "一次普通的攻击，造成100%攻击的伤害",
    fightForce = 0
    };
getRow(40000,1)->
    #pet_skills_upgradingCfg {
    skill_id = 40000,
    level = 1,
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "杂技大师向前方抛出一个弹弹球，对击中的目标造成230%攻击的伤害",
    fightForce = 0
    };
getRow(40000,2)->
    #pet_skills_upgradingCfg {
    skill_id = 40000,
    level = 2,
    item_cost = [13001,1],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "杂技大师向前方抛出一个弹弹球，对击中的目标造成302%攻击的伤害",
    fightForce = 500
    };
getRow(40000,3)->
    #pet_skills_upgradingCfg {
    skill_id = 40000,
    level = 3,
    item_cost = [13001,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 20,
    des = "杂技大师向前方抛出一个弹弹球，对击中的目标造成374%攻击的伤害",
    fightForce = 1250
    };
getRow(40000,4)->
    #pet_skills_upgradingCfg {
    skill_id = 40000,
    level = 4,
    item_cost = [13001,3],
    star_limit = 0,
    reborn_limit = 1,
    level_limit = 30,
    des = "杂技大师向前方抛出一个弹弹球，对击中的目标造成446%攻击的伤害",
    fightForce = 2250
    };
getRow(40000,5)->
    #pet_skills_upgradingCfg {
    skill_id = 40000,
    level = 5,
    item_cost = [13001,4],
    star_limit = 0,
    reborn_limit = 2,
    level_limit = 40,
    des = "杂技大师向前方抛出一个弹弹球，对击中的目标造成518%攻击的伤害",
    fightForce = 3500
    };
getRow(40000,6)->
    #pet_skills_upgradingCfg {
    skill_id = 40000,
    level = 6,
    item_cost = [13001,5],
    star_limit = 0,
    reborn_limit = 3,
    level_limit = 50,
    des = "杂技大师向前方抛出一个弹弹球，对击中的目标造成590%攻击的伤害",
    fightForce = 5000
    };
getRow(40001,1)->
    #pet_skills_upgradingCfg {
    skill_id = 40001,
    level = 1,
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "杂技大师给主人恢复347%法术攻击的生命值",
    fightForce = 0
    };
getRow(40001,2)->
    #pet_skills_upgradingCfg {
    skill_id = 40001,
    level = 2,
    item_cost = [13001,1],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "杂技大师给主人恢复447%法术攻击的生命值",
    fightForce = 500
    };
getRow(40001,3)->
    #pet_skills_upgradingCfg {
    skill_id = 40001,
    level = 3,
    item_cost = [13001,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 20,
    des = "杂技大师给主人恢复547%法术攻击的生命值",
    fightForce = 1250
    };
getRow(40001,4)->
    #pet_skills_upgradingCfg {
    skill_id = 40001,
    level = 4,
    item_cost = [13001,3],
    star_limit = 0,
    reborn_limit = 1,
    level_limit = 30,
    des = "杂技大师给主人恢复647%法术攻击的生命值",
    fightForce = 2250
    };
getRow(40001,5)->
    #pet_skills_upgradingCfg {
    skill_id = 40001,
    level = 5,
    item_cost = [13001,4],
    star_limit = 0,
    reborn_limit = 2,
    level_limit = 40,
    des = "杂技大师给主人恢复747%法术攻击的生命值",
    fightForce = 3500
    };
getRow(40001,6)->
    #pet_skills_upgradingCfg {
    skill_id = 40001,
    level = 6,
    item_cost = [13001,5],
    star_limit = 0,
    reborn_limit = 3,
    level_limit = 50,
    des = "杂技大师给主人恢复847%法术攻击的生命值",
    fightForce = 5000
    };
getRow(40002,1)->
    #pet_skills_upgradingCfg {
    skill_id = 40002,
    level = 1,
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "杂技大师给自己和主人每秒恢复自身法术攻击144%的生命值，持续3秒",
    fightForce = 0
    };
getRow(40002,2)->
    #pet_skills_upgradingCfg {
    skill_id = 40002,
    level = 2,
    item_cost = [13001,1],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "杂技大师给自己和主人每秒恢复自身法术攻击187%的生命值，持续3秒",
    fightForce = 500
    };
getRow(40002,3)->
    #pet_skills_upgradingCfg {
    skill_id = 40002,
    level = 3,
    item_cost = [13001,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 20,
    des = "杂技大师给自己和主人每秒恢复自身法术攻击230%的生命值，持续3秒",
    fightForce = 1250
    };
getRow(40002,4)->
    #pet_skills_upgradingCfg {
    skill_id = 40002,
    level = 4,
    item_cost = [13001,3],
    star_limit = 0,
    reborn_limit = 1,
    level_limit = 30,
    des = "杂技大师给自己和主人每秒恢复自身法术攻击273%的生命值，持续3秒",
    fightForce = 2250
    };
getRow(40002,5)->
    #pet_skills_upgradingCfg {
    skill_id = 40002,
    level = 5,
    item_cost = [13001,4],
    star_limit = 0,
    reborn_limit = 2,
    level_limit = 40,
    des = "杂技大师给自己和主人每秒恢复自身法术攻击316%的生命值，持续3秒",
    fightForce = 3500
    };
getRow(40002,6)->
    #pet_skills_upgradingCfg {
    skill_id = 40002,
    level = 6,
    item_cost = [13001,5],
    star_limit = 0,
    reborn_limit = 3,
    level_limit = 50,
    des = "杂技大师给自己和主人每秒恢复自身法术攻击359%的生命值，持续3秒",
    fightForce = 5000
    };
getRow(40010,1)->
    #pet_skills_upgradingCfg {
    skill_id = 40010,
    level = 1,
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "贾斯汀比象甩了下它迷人的长鼻，对前方15米的目标造成192%攻击的伤害",
    fightForce = 0
    };
getRow(40010,2)->
    #pet_skills_upgradingCfg {
    skill_id = 40010,
    level = 2,
    item_cost = [13002,1],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "贾斯汀比象甩了下它迷人的长鼻，对前方15米的目标造成252%攻击的伤害",
    fightForce = 1000
    };
getRow(40010,3)->
    #pet_skills_upgradingCfg {
    skill_id = 40010,
    level = 3,
    item_cost = [13002,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 20,
    des = "贾斯汀比象甩了下它迷人的长鼻，对前方15米的目标造成312%攻击的伤害",
    fightForce = 2500
    };
getRow(40010,4)->
    #pet_skills_upgradingCfg {
    skill_id = 40010,
    level = 4,
    item_cost = [13002,3],
    star_limit = 0,
    reborn_limit = 1,
    level_limit = 30,
    des = "贾斯汀比象甩了下它迷人的长鼻，对前方15米的目标造成372%攻击的伤害",
    fightForce = 4500
    };
getRow(40010,5)->
    #pet_skills_upgradingCfg {
    skill_id = 40010,
    level = 5,
    item_cost = [13002,4],
    star_limit = 0,
    reborn_limit = 2,
    level_limit = 40,
    des = "贾斯汀比象甩了下它迷人的长鼻，对前方15米的目标造成432%攻击的伤害",
    fightForce = 7000
    };
getRow(40010,6)->
    #pet_skills_upgradingCfg {
    skill_id = 40010,
    level = 6,
    item_cost = [13002,5],
    star_limit = 0,
    reborn_limit = 3,
    level_limit = 50,
    des = "贾斯汀比象甩了下它迷人的长鼻，对前方15米的目标造成492%攻击的伤害",
    fightForce = 10000
    };
getRow(40011,1)->
    #pet_skills_upgradingCfg {
    skill_id = 40011,
    level = 1,
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "贾斯汀抛出礼帽，将前方30米目标吸引到自己身边，造成146%攻击的伤害且迷晕1秒",
    fightForce = 0
    };
getRow(40011,2)->
    #pet_skills_upgradingCfg {
    skill_id = 40011,
    level = 2,
    item_cost = [13002,1],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "贾斯汀抛出礼帽，将前方30米目标吸引到自己身边，造成191%攻击的伤害且迷晕1秒",
    fightForce = 1000
    };
getRow(40011,3)->
    #pet_skills_upgradingCfg {
    skill_id = 40011,
    level = 3,
    item_cost = [13002,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 20,
    des = "贾斯汀抛出礼帽，将前方30米目标吸引到自己身边，造成236%攻击的伤害且迷晕1秒",
    fightForce = 2500
    };
getRow(40011,4)->
    #pet_skills_upgradingCfg {
    skill_id = 40011,
    level = 4,
    item_cost = [13002,3],
    star_limit = 0,
    reborn_limit = 1,
    level_limit = 30,
    des = "贾斯汀抛出礼帽，将前方30米目标吸引到自己身边，造成281%攻击的伤害且迷晕1秒",
    fightForce = 4500
    };
getRow(40011,5)->
    #pet_skills_upgradingCfg {
    skill_id = 40011,
    level = 5,
    item_cost = [13002,4],
    star_limit = 0,
    reborn_limit = 2,
    level_limit = 40,
    des = "贾斯汀抛出礼帽，将前方30米目标吸引到自己身边，造成326%攻击的伤害且迷晕1秒",
    fightForce = 7000
    };
getRow(40011,6)->
    #pet_skills_upgradingCfg {
    skill_id = 40011,
    level = 6,
    item_cost = [13002,5],
    star_limit = 0,
    reborn_limit = 3,
    level_limit = 50,
    des = "贾斯汀抛出礼帽，将前方30米目标吸引到自己身边，造成371%攻击的伤害且迷晕1秒",
    fightForce = 10000
    };
getRow(40012,1)->
    #pet_skills_upgradingCfg {
    skill_id = 40012,
    level = 1,
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "贾斯汀展现自己的超人气偶像魅力，回眸一笑，对前方15米的目标造成161攻击的伤害，且迷晕1秒",
    fightForce = 0
    };
getRow(40012,2)->
    #pet_skills_upgradingCfg {
    skill_id = 40012,
    level = 2,
    item_cost = [13002,1],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "贾斯汀展现自己的超人气偶像魅力，回眸一笑，对前方15米的目标造成211攻击的伤害，且迷晕1秒",
    fightForce = 1000
    };
getRow(40012,3)->
    #pet_skills_upgradingCfg {
    skill_id = 40012,
    level = 3,
    item_cost = [13002,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 20,
    des = "贾斯汀展现自己的超人气偶像魅力，回眸一笑，对前方15米的目标造成261攻击的伤害，且迷晕1秒",
    fightForce = 2500
    };
getRow(40012,4)->
    #pet_skills_upgradingCfg {
    skill_id = 40012,
    level = 4,
    item_cost = [13002,3],
    star_limit = 0,
    reborn_limit = 1,
    level_limit = 30,
    des = "贾斯汀展现自己的超人气偶像魅力，回眸一笑，对前方15米的目标造成311攻击的伤害，且迷晕1秒",
    fightForce = 4500
    };
getRow(40012,5)->
    #pet_skills_upgradingCfg {
    skill_id = 40012,
    level = 5,
    item_cost = [13002,4],
    star_limit = 0,
    reborn_limit = 2,
    level_limit = 40,
    des = "贾斯汀展现自己的超人气偶像魅力，回眸一笑，对前方15米的目标造成361攻击的伤害，且迷晕1秒",
    fightForce = 7000
    };
getRow(40012,6)->
    #pet_skills_upgradingCfg {
    skill_id = 40012,
    level = 6,
    item_cost = [13002,5],
    star_limit = 0,
    reborn_limit = 3,
    level_limit = 50,
    des = "贾斯汀展现自己的超人气偶像魅力，回眸一笑，对前方15米的目标造成411攻击的伤害，且迷晕1秒",
    fightForce = 10000
    };
getRow(40020,1)->
    #pet_skills_upgradingCfg {
    skill_id = 40020,
    level = 1,
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "杀象特面对敌人的流言蜚语异常愤怒，对前方扇形范围的敌人 造成173%攻击的伤害",
    fightForce = 0
    };
getRow(40020,2)->
    #pet_skills_upgradingCfg {
    skill_id = 40020,
    level = 2,
    item_cost = [13001,1],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "杀象特面对敌人的流言蜚语异常愤怒，对前方扇形范围的敌人 造成227%攻击的伤害",
    fightForce = 500
    };
getRow(40020,3)->
    #pet_skills_upgradingCfg {
    skill_id = 40020,
    level = 3,
    item_cost = [13001,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 20,
    des = "杀象特面对敌人的流言蜚语异常愤怒，对前方扇形范围的敌人 造成281%攻击的伤害",
    fightForce = 1250
    };
getRow(40020,4)->
    #pet_skills_upgradingCfg {
    skill_id = 40020,
    level = 4,
    item_cost = [13001,3],
    star_limit = 0,
    reborn_limit = 1,
    level_limit = 30,
    des = "杀象特面对敌人的流言蜚语异常愤怒，对前方扇形范围的敌人 造成335%攻击的伤害",
    fightForce = 2250
    };
getRow(40020,5)->
    #pet_skills_upgradingCfg {
    skill_id = 40020,
    level = 5,
    item_cost = [13001,4],
    star_limit = 0,
    reborn_limit = 2,
    level_limit = 40,
    des = "杀象特面对敌人的流言蜚语异常愤怒，对前方扇形范围的敌人 造成389%攻击的伤害",
    fightForce = 3500
    };
getRow(40020,6)->
    #pet_skills_upgradingCfg {
    skill_id = 40020,
    level = 6,
    item_cost = [13001,5],
    star_limit = 0,
    reborn_limit = 3,
    level_limit = 50,
    des = "杀象特面对敌人的流言蜚语异常愤怒，对前方扇形范围的敌人 造成443%攻击的伤害",
    fightForce = 5000
    };
getRow(40022,1)->
    #pet_skills_upgradingCfg {
    skill_id = 40022,
    level = 1,
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "杀象特藏着一个秘密，而每次被敌人攻击，这个秘密都会使他愤怒。对前方扇形范围的敌人造成318%攻击的伤害。怪物将受到2次伤害。",
    fightForce = 0
    };
getRow(40022,2)->
    #pet_skills_upgradingCfg {
    skill_id = 40022,
    level = 2,
    item_cost = [13001,1],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "杀象特藏着一个秘密，而每次被敌人攻击，这个秘密都会使他愤怒。对前方扇形范围的敌人造成411%攻击的伤害。怪物将受到2次伤害。",
    fightForce = 500
    };
getRow(40022,3)->
    #pet_skills_upgradingCfg {
    skill_id = 40022,
    level = 3,
    item_cost = [13001,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 20,
    des = "杀象特藏着一个秘密，而每次被敌人攻击，这个秘密都会使他愤怒。对前方扇形范围的敌人造成504%攻击的伤害。怪物将受到2次伤害。",
    fightForce = 1250
    };
getRow(40022,4)->
    #pet_skills_upgradingCfg {
    skill_id = 40022,
    level = 4,
    item_cost = [13001,3],
    star_limit = 0,
    reborn_limit = 1,
    level_limit = 30,
    des = "杀象特藏着一个秘密，而每次被敌人攻击，这个秘密都会使他愤怒。对前方扇形范围的敌人造成597%攻击的伤害。怪物将受到2次伤害。",
    fightForce = 2250
    };
getRow(40022,5)->
    #pet_skills_upgradingCfg {
    skill_id = 40022,
    level = 5,
    item_cost = [13001,4],
    star_limit = 0,
    reborn_limit = 2,
    level_limit = 40,
    des = "杀象特藏着一个秘密，而每次被敌人攻击，这个秘密都会使他愤怒。对前方扇形范围的敌人造成690%攻击的伤害。怪物将受到2次伤害。",
    fightForce = 3500
    };
getRow(40022,6)->
    #pet_skills_upgradingCfg {
    skill_id = 40022,
    level = 6,
    item_cost = [13001,5],
    star_limit = 0,
    reborn_limit = 3,
    level_limit = 50,
    des = "杀象特藏着一个秘密，而每次被敌人攻击，这个秘密都会使他愤怒。对前方扇形范围的敌人造成783%攻击的伤害。怪物将受到2次伤害。",
    fightForce = 5000
    };
getRow(40024,1)->
    #pet_skills_upgradingCfg {
    skill_id = 40024,
    level = 1,
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "（被动）杀像特自带绿色光环，使用【恼羞成怒】技能后增加自身10%暴击率",
    fightForce = 0
    };
getRow(40030,1)->
    #pet_skills_upgradingCfg {
    skill_id = 40030,
    level = 1,
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "机械鸟对前方少数目标进行攻击，总共造成332%攻击的伤害",
    fightForce = 0
    };
getRow(40030,2)->
    #pet_skills_upgradingCfg {
    skill_id = 40030,
    level = 2,
    item_cost = [13001,1],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "机械鸟对前方少数目标进行攻击，总共造成429%攻击的伤害",
    fightForce = 500
    };
getRow(40030,3)->
    #pet_skills_upgradingCfg {
    skill_id = 40030,
    level = 3,
    item_cost = [13001,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 20,
    des = "机械鸟对前方少数目标进行攻击，总共造成526%攻击的伤害",
    fightForce = 1250
    };
getRow(40030,4)->
    #pet_skills_upgradingCfg {
    skill_id = 40030,
    level = 4,
    item_cost = [13001,3],
    star_limit = 0,
    reborn_limit = 1,
    level_limit = 30,
    des = "机械鸟对前方少数目标进行攻击，总共造成623%攻击的伤害",
    fightForce = 2250
    };
getRow(40030,5)->
    #pet_skills_upgradingCfg {
    skill_id = 40030,
    level = 5,
    item_cost = [13001,4],
    star_limit = 0,
    reborn_limit = 2,
    level_limit = 40,
    des = "机械鸟对前方少数目标进行攻击，总共造成720%攻击的伤害",
    fightForce = 3500
    };
getRow(40030,6)->
    #pet_skills_upgradingCfg {
    skill_id = 40030,
    level = 6,
    item_cost = [13001,5],
    star_limit = 0,
    reborn_limit = 3,
    level_limit = 50,
    des = "机械鸟对前方少数目标进行攻击，总共造成817%攻击的伤害",
    fightForce = 5000
    };
getRow(40031,1)->
    #pet_skills_upgradingCfg {
    skill_id = 40031,
    level = 1,
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "机械鸟与生俱来的灵敏结合机械的坚韧，使其物理防御提升30%",
    fightForce = 0
    };
getRow(40031,2)->
    #pet_skills_upgradingCfg {
    skill_id = 40031,
    level = 2,
    item_cost = [13001,1],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "机械鸟与生俱来的灵敏结合机械的坚韧，使其物理防御提升36%",
    fightForce = 500
    };
getRow(40031,3)->
    #pet_skills_upgradingCfg {
    skill_id = 40031,
    level = 3,
    item_cost = [13001,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 20,
    des = "机械鸟与生俱来的灵敏结合机械的坚韧，使其物理防御提升42%",
    fightForce = 1250
    };
getRow(40031,4)->
    #pet_skills_upgradingCfg {
    skill_id = 40031,
    level = 4,
    item_cost = [13001,3],
    star_limit = 0,
    reborn_limit = 1,
    level_limit = 30,
    des = "机械鸟与生俱来的灵敏结合机械的坚韧，使其物理防御提升48%",
    fightForce = 2250
    };
getRow(40031,5)->
    #pet_skills_upgradingCfg {
    skill_id = 40031,
    level = 5,
    item_cost = [13001,4],
    star_limit = 0,
    reborn_limit = 2,
    level_limit = 40,
    des = "机械鸟与生俱来的灵敏结合机械的坚韧，使其物理防御提升54%",
    fightForce = 3500
    };
getRow(40031,6)->
    #pet_skills_upgradingCfg {
    skill_id = 40031,
    level = 6,
    item_cost = [13001,5],
    star_limit = 0,
    reborn_limit = 3,
    level_limit = 50,
    des = "机械鸟与生俱来的灵敏结合机械的坚韧，使其物理防御提升60%",
    fightForce = 5000
    };
getRow(40035,1)->
    #pet_skills_upgradingCfg {
    skill_id = 40035,
    level = 1,
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "机械鸟朝上方起飞小段后朝下俯冲，造成290%攻击的范围伤害",
    fightForce = 0
    };
getRow(40035,2)->
    #pet_skills_upgradingCfg {
    skill_id = 40035,
    level = 2,
    item_cost = [13001,1],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "机械鸟朝上方起飞小段后朝下俯冲，造成376%攻击的范围伤害",
    fightForce = 500
    };
getRow(40035,3)->
    #pet_skills_upgradingCfg {
    skill_id = 40035,
    level = 3,
    item_cost = [13001,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 20,
    des = "机械鸟朝上方起飞小段后朝下俯冲，造成462%攻击的范围伤害",
    fightForce = 1250
    };
getRow(40035,4)->
    #pet_skills_upgradingCfg {
    skill_id = 40035,
    level = 4,
    item_cost = [13001,3],
    star_limit = 0,
    reborn_limit = 1,
    level_limit = 30,
    des = "机械鸟朝上方起飞小段后朝下俯冲，造成548%攻击的范围伤害",
    fightForce = 2250
    };
getRow(40035,5)->
    #pet_skills_upgradingCfg {
    skill_id = 40035,
    level = 5,
    item_cost = [13001,4],
    star_limit = 0,
    reborn_limit = 2,
    level_limit = 40,
    des = "机械鸟朝上方起飞小段后朝下俯冲，造成634%攻击的范围伤害",
    fightForce = 3500
    };
getRow(40035,6)->
    #pet_skills_upgradingCfg {
    skill_id = 40035,
    level = 6,
    item_cost = [13001,5],
    star_limit = 0,
    reborn_limit = 3,
    level_limit = 50,
    des = "机械鸟朝上方起飞小段后朝下俯冲，造成720%攻击的范围伤害",
    fightForce = 5000
    };
getRow(40040,1)->
    #pet_skills_upgradingCfg {
    skill_id = 40040,
    level = 1,
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "上帝就该老老实实待在天堂，西瓜鲨对前方单体目标造成455%攻击的伤害",
    fightForce = 0
    };
getRow(40040,2)->
    #pet_skills_upgradingCfg {
    skill_id = 40040,
    level = 2,
    item_cost = [13002,1],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "上帝就该老老实实待在天堂，西瓜鲨对前方单体目标造成642%攻击的伤害",
    fightForce = 1000
    };
getRow(40040,3)->
    #pet_skills_upgradingCfg {
    skill_id = 40040,
    level = 3,
    item_cost = [13002,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 20,
    des = "上帝就该老老实实待在天堂，西瓜鲨对前方单体目标造成829%攻击的伤害",
    fightForce = 2500
    };
getRow(40040,4)->
    #pet_skills_upgradingCfg {
    skill_id = 40040,
    level = 4,
    item_cost = [13002,3],
    star_limit = 0,
    reborn_limit = 1,
    level_limit = 30,
    des = "上帝就该老老实实待在天堂，西瓜鲨对前方单体目标造成1016%攻击的伤害",
    fightForce = 4500
    };
getRow(40040,5)->
    #pet_skills_upgradingCfg {
    skill_id = 40040,
    level = 5,
    item_cost = [13002,4],
    star_limit = 0,
    reborn_limit = 2,
    level_limit = 40,
    des = "上帝就该老老实实待在天堂，西瓜鲨对前方单体目标造成1203%攻击的伤害",
    fightForce = 7000
    };
getRow(40040,6)->
    #pet_skills_upgradingCfg {
    skill_id = 40040,
    level = 6,
    item_cost = [13002,5],
    star_limit = 0,
    reborn_limit = 3,
    level_limit = 50,
    des = "上帝就该老老实实待在天堂，西瓜鲨对前方单体目标造成1390%攻击的伤害",
    fightForce = 10000
    };
getRow(40041,1)->
    #pet_skills_upgradingCfg {
    skill_id = 40041,
    level = 1,
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "“来瞧一瞧看一看，全场五折啦！”西瓜鲨将周围30米敌人的眼光吸引过来，并造成631%攻击的伤害",
    fightForce = 0
    };
getRow(40041,2)->
    #pet_skills_upgradingCfg {
    skill_id = 40041,
    level = 2,
    item_cost = [13002,1],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "“来瞧一瞧看一看，全场五折啦！”西瓜鲨将周围30米敌人的眼光吸引过来，并造成884%攻击的伤害",
    fightForce = 1000
    };
getRow(40041,3)->
    #pet_skills_upgradingCfg {
    skill_id = 40041,
    level = 3,
    item_cost = [13002,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 20,
    des = "“来瞧一瞧看一看，全场五折啦！”西瓜鲨将周围30米敌人的眼光吸引过来，并造成1137%攻击的伤害",
    fightForce = 2500
    };
getRow(40041,4)->
    #pet_skills_upgradingCfg {
    skill_id = 40041,
    level = 4,
    item_cost = [13002,3],
    star_limit = 0,
    reborn_limit = 1,
    level_limit = 30,
    des = "“来瞧一瞧看一看，全场五折啦！”西瓜鲨将周围30米敌人的眼光吸引过来，并造成1390%攻击的伤害",
    fightForce = 4500
    };
getRow(40041,5)->
    #pet_skills_upgradingCfg {
    skill_id = 40041,
    level = 5,
    item_cost = [13002,4],
    star_limit = 0,
    reborn_limit = 2,
    level_limit = 40,
    des = "“来瞧一瞧看一看，全场五折啦！”西瓜鲨将周围30米敌人的眼光吸引过来，并造成1643%攻击的伤害",
    fightForce = 7000
    };
getRow(40041,6)->
    #pet_skills_upgradingCfg {
    skill_id = 40041,
    level = 6,
    item_cost = [13002,5],
    star_limit = 0,
    reborn_limit = 3,
    level_limit = 50,
    des = "“来瞧一瞧看一看，全场五折啦！”西瓜鲨将周围30米敌人的眼光吸引过来，并造成1896%攻击的伤害",
    fightForce = 10000
    };
getRow(40044,1)->
    #pet_skills_upgradingCfg {
    skill_id = 40044,
    level = 1,
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "西瓜鲨获得了不错的收益，哈哈大笑为主人增加20%的双防，持续5秒",
    fightForce = 0
    };
getRow(40044,2)->
    #pet_skills_upgradingCfg {
    skill_id = 40044,
    level = 2,
    item_cost = [13002,1],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "西瓜鲨获得了不错的收益，哈哈大笑为主人增加24%的双防，持续5秒",
    fightForce = 1000
    };
getRow(40044,3)->
    #pet_skills_upgradingCfg {
    skill_id = 40044,
    level = 3,
    item_cost = [13002,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 20,
    des = "西瓜鲨获得了不错的收益，哈哈大笑为主人增加28%的双防，持续5秒",
    fightForce = 2500
    };
getRow(40044,4)->
    #pet_skills_upgradingCfg {
    skill_id = 40044,
    level = 4,
    item_cost = [13002,3],
    star_limit = 0,
    reborn_limit = 1,
    level_limit = 30,
    des = "西瓜鲨获得了不错的收益，哈哈大笑为主人增加32%的双防，持续5秒",
    fightForce = 4500
    };
getRow(40044,5)->
    #pet_skills_upgradingCfg {
    skill_id = 40044,
    level = 5,
    item_cost = [13002,4],
    star_limit = 0,
    reborn_limit = 2,
    level_limit = 40,
    des = "西瓜鲨获得了不错的收益，哈哈大笑为主人增加36%的双防，持续5秒",
    fightForce = 7000
    };
getRow(40044,6)->
    #pet_skills_upgradingCfg {
    skill_id = 40044,
    level = 6,
    item_cost = [13002,5],
    star_limit = 0,
    reborn_limit = 3,
    level_limit = 50,
    des = "西瓜鲨获得了不错的收益，哈哈大笑为主人增加40%的双防，持续5秒",
    fightForce = 10000
    };
getRow(40050,1)->
    #pet_skills_upgradingCfg {
    skill_id = 40050,
    level = 1,
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "钢铁狼用锋利的铁爪对前方敌人进行2次爪击，每次造成造成158%攻击的伤害",
    fightForce = 0
    };
getRow(40050,2)->
    #pet_skills_upgradingCfg {
    skill_id = 40050,
    level = 2,
    item_cost = [13001,1],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "钢铁狼用锋利的铁爪对前方敌人进行2次爪击，每次造成造成203%攻击的伤害",
    fightForce = 500
    };
getRow(40050,3)->
    #pet_skills_upgradingCfg {
    skill_id = 40050,
    level = 3,
    item_cost = [13001,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 20,
    des = "钢铁狼用锋利的铁爪对前方敌人进行2次爪击，每次造成造成248%攻击的伤害",
    fightForce = 1250
    };
getRow(40050,4)->
    #pet_skills_upgradingCfg {
    skill_id = 40050,
    level = 4,
    item_cost = [13001,3],
    star_limit = 0,
    reborn_limit = 1,
    level_limit = 30,
    des = "钢铁狼用锋利的铁爪对前方敌人进行2次爪击，每次造成造成293%攻击的伤害",
    fightForce = 2250
    };
getRow(40050,5)->
    #pet_skills_upgradingCfg {
    skill_id = 40050,
    level = 5,
    item_cost = [13001,4],
    star_limit = 0,
    reborn_limit = 2,
    level_limit = 40,
    des = "钢铁狼用锋利的铁爪对前方敌人进行2次爪击，每次造成造成338%攻击的伤害",
    fightForce = 3500
    };
getRow(40050,6)->
    #pet_skills_upgradingCfg {
    skill_id = 40050,
    level = 6,
    item_cost = [13001,5],
    star_limit = 0,
    reborn_limit = 3,
    level_limit = 50,
    des = "钢铁狼用锋利的铁爪对前方敌人进行2次爪击，每次造成造成383%攻击的伤害",
    fightForce = 5000
    };
getRow(40053,1)->
    #pet_skills_upgradingCfg {
    skill_id = 40053,
    level = 1,
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "钢铁狼朝前方矩形区域进行撞击，造成734%攻击的伤害",
    fightForce = 0
    };
getRow(40053,2)->
    #pet_skills_upgradingCfg {
    skill_id = 40053,
    level = 2,
    item_cost = [13001,1],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "钢铁狼朝前方矩形区域进行撞击，造成950%攻击的伤害",
    fightForce = 500
    };
getRow(40053,3)->
    #pet_skills_upgradingCfg {
    skill_id = 40053,
    level = 3,
    item_cost = [13001,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 20,
    des = "钢铁狼朝前方矩形区域进行撞击，造成1166%攻击的伤害",
    fightForce = 1250
    };
getRow(40053,4)->
    #pet_skills_upgradingCfg {
    skill_id = 40053,
    level = 4,
    item_cost = [13001,3],
    star_limit = 0,
    reborn_limit = 1,
    level_limit = 30,
    des = "钢铁狼朝前方矩形区域进行撞击，造成1382%攻击的伤害",
    fightForce = 2250
    };
getRow(40053,5)->
    #pet_skills_upgradingCfg {
    skill_id = 40053,
    level = 5,
    item_cost = [13001,4],
    star_limit = 0,
    reborn_limit = 2,
    level_limit = 40,
    des = "钢铁狼朝前方矩形区域进行撞击，造成1598%攻击的伤害",
    fightForce = 3500
    };
getRow(40053,6)->
    #pet_skills_upgradingCfg {
    skill_id = 40053,
    level = 6,
    item_cost = [13001,5],
    star_limit = 0,
    reborn_limit = 3,
    level_limit = 50,
    des = "钢铁狼朝前方矩形区域进行撞击，造成1814%攻击的伤害",
    fightForce = 5000
    };
getRow(40054,1)->
    #pet_skills_upgradingCfg {
    skill_id = 40054,
    level = 1,
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "（被动）钢铁狼天生拥有10%暴击率",
    fightForce = 0
    };
getRow(40060,1)->
    #pet_skills_upgradingCfg {
    skill_id = 40060,
    level = 1,
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "对前方单个敌人进行两次攻击，每次造成156%攻击的伤害",
    fightForce = 0
    };
getRow(40060,2)->
    #pet_skills_upgradingCfg {
    skill_id = 40060,
    level = 2,
    item_cost = [13001,1],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "对前方单个敌人进行两次攻击，每次造成203%攻击的伤害",
    fightForce = 500
    };
getRow(40060,3)->
    #pet_skills_upgradingCfg {
    skill_id = 40060,
    level = 3,
    item_cost = [13001,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 20,
    des = "对前方单个敌人进行两次攻击，每次造成250%攻击的伤害",
    fightForce = 1250
    };
getRow(40060,4)->
    #pet_skills_upgradingCfg {
    skill_id = 40060,
    level = 4,
    item_cost = [13001,3],
    star_limit = 0,
    reborn_limit = 1,
    level_limit = 30,
    des = "对前方单个敌人进行两次攻击，每次造成297%攻击的伤害",
    fightForce = 2250
    };
getRow(40060,5)->
    #pet_skills_upgradingCfg {
    skill_id = 40060,
    level = 5,
    item_cost = [13001,4],
    star_limit = 0,
    reborn_limit = 2,
    level_limit = 40,
    des = "对前方单个敌人进行两次攻击，每次造成344%攻击的伤害",
    fightForce = 3500
    };
getRow(40060,6)->
    #pet_skills_upgradingCfg {
    skill_id = 40060,
    level = 6,
    item_cost = [13001,5],
    star_limit = 0,
    reborn_limit = 3,
    level_limit = 50,
    des = "对前方单个敌人进行两次攻击，每次造成391%攻击的伤害",
    fightForce = 5000
    };
getRow(40061,1)->
    #pet_skills_upgradingCfg {
    skill_id = 40061,
    level = 1,
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "主人每秒恢复自身法术攻击146%的生命值，持续3秒",
    fightForce = 0
    };
getRow(40061,2)->
    #pet_skills_upgradingCfg {
    skill_id = 40061,
    level = 2,
    item_cost = [13001,1],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "主人每秒恢复自身法术攻击190%的生命值，持续3秒",
    fightForce = 500
    };
getRow(40061,3)->
    #pet_skills_upgradingCfg {
    skill_id = 40061,
    level = 3,
    item_cost = [13001,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 20,
    des = "主人每秒恢复自身法术攻击234%的生命值，持续3秒",
    fightForce = 1250
    };
getRow(40061,4)->
    #pet_skills_upgradingCfg {
    skill_id = 40061,
    level = 4,
    item_cost = [13001,3],
    star_limit = 0,
    reborn_limit = 1,
    level_limit = 30,
    des = "主人每秒恢复自身法术攻击278%的生命值，持续3秒",
    fightForce = 2250
    };
getRow(40061,5)->
    #pet_skills_upgradingCfg {
    skill_id = 40061,
    level = 5,
    item_cost = [13001,4],
    star_limit = 0,
    reborn_limit = 2,
    level_limit = 40,
    des = "主人每秒恢复自身法术攻击322%的生命值，持续3秒",
    fightForce = 3500
    };
getRow(40061,6)->
    #pet_skills_upgradingCfg {
    skill_id = 40061,
    level = 6,
    item_cost = [13001,5],
    star_limit = 0,
    reborn_limit = 3,
    level_limit = 50,
    des = "主人每秒恢复自身法术攻击366%的生命值，持续3秒",
    fightForce = 5000
    };
getRow(40063,1)->
    #pet_skills_upgradingCfg {
    skill_id = 40063,
    level = 1,
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "主人物理防御和魔防提升20%，持续5秒",
    fightForce = 0
    };
getRow(40063,2)->
    #pet_skills_upgradingCfg {
    skill_id = 40063,
    level = 2,
    item_cost = [13001,1],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "主人物理防御和魔防提升24%，持续5秒",
    fightForce = 500
    };
getRow(40063,3)->
    #pet_skills_upgradingCfg {
    skill_id = 40063,
    level = 3,
    item_cost = [13001,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 20,
    des = "主人物理防御和魔防提升28%，持续5秒",
    fightForce = 1250
    };
getRow(40063,4)->
    #pet_skills_upgradingCfg {
    skill_id = 40063,
    level = 4,
    item_cost = [13001,3],
    star_limit = 0,
    reborn_limit = 1,
    level_limit = 30,
    des = "主人物理防御和魔防提升32%，持续5秒",
    fightForce = 2250
    };
getRow(40063,5)->
    #pet_skills_upgradingCfg {
    skill_id = 40063,
    level = 5,
    item_cost = [13001,4],
    star_limit = 0,
    reborn_limit = 2,
    level_limit = 40,
    des = "主人物理防御和魔防提升36%，持续5秒",
    fightForce = 3500
    };
getRow(40063,6)->
    #pet_skills_upgradingCfg {
    skill_id = 40063,
    level = 6,
    item_cost = [13001,5],
    star_limit = 0,
    reborn_limit = 3,
    level_limit = 50,
    des = "主人物理防御和魔防提升40%，持续5秒",
    fightForce = 5000
    };
getRow(40070,1)->
    #pet_skills_upgradingCfg {
    skill_id = 40070,
    level = 1,
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "对前方单个敌人采用低音符攻击，总共造成224%攻击的伤害",
    fightForce = 0
    };
getRow(40070,2)->
    #pet_skills_upgradingCfg {
    skill_id = 40070,
    level = 2,
    item_cost = [13001,1],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "对前方单个敌人采用低音符攻击，总共造成294%攻击的伤害",
    fightForce = 500
    };
getRow(40070,3)->
    #pet_skills_upgradingCfg {
    skill_id = 40070,
    level = 3,
    item_cost = [13001,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 20,
    des = "对前方单个敌人采用低音符攻击，总共造成364%攻击的伤害",
    fightForce = 1250
    };
getRow(40070,4)->
    #pet_skills_upgradingCfg {
    skill_id = 40070,
    level = 4,
    item_cost = [13001,3],
    star_limit = 0,
    reborn_limit = 1,
    level_limit = 30,
    des = "对前方单个敌人采用低音符攻击，总共造成434%攻击的伤害",
    fightForce = 2250
    };
getRow(40070,5)->
    #pet_skills_upgradingCfg {
    skill_id = 40070,
    level = 5,
    item_cost = [13001,4],
    star_limit = 0,
    reborn_limit = 2,
    level_limit = 40,
    des = "对前方单个敌人采用低音符攻击，总共造成504%攻击的伤害",
    fightForce = 3500
    };
getRow(40070,6)->
    #pet_skills_upgradingCfg {
    skill_id = 40070,
    level = 6,
    item_cost = [13001,5],
    star_limit = 0,
    reborn_limit = 3,
    level_limit = 50,
    des = "对前方单个敌人采用低音符攻击，总共造成574%攻击的伤害",
    fightForce = 5000
    };
getRow(40071,1)->
    #pet_skills_upgradingCfg {
    skill_id = 40071,
    level = 1,
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "弹奏镇魂曲，对周围28米敌人进行镇压攻击，总共造成476%攻击的伤害并降低对方物理防御、魔法防御10%，持续5秒",
    fightForce = 0
    };
getRow(40071,2)->
    #pet_skills_upgradingCfg {
    skill_id = 40071,
    level = 2,
    item_cost = [13001,1],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "弹奏镇魂曲，对周围28米敌人进行镇压攻击，总共造成619%攻击的伤害并降低对方物理防御、魔法防御12%，持续5秒",
    fightForce = 500
    };
getRow(40071,3)->
    #pet_skills_upgradingCfg {
    skill_id = 40071,
    level = 3,
    item_cost = [13001,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 20,
    des = "弹奏镇魂曲，对周围28米敌人进行镇压攻击，总共造成762%攻击的伤害并降低对方物理防御、魔法防御14%，持续5秒",
    fightForce = 1250
    };
getRow(40071,4)->
    #pet_skills_upgradingCfg {
    skill_id = 40071,
    level = 4,
    item_cost = [13001,3],
    star_limit = 0,
    reborn_limit = 1,
    level_limit = 30,
    des = "弹奏镇魂曲，对周围28米敌人进行镇压攻击，总共造成905%攻击的伤害并降低对方物理防御、魔法防御16%，持续5秒",
    fightForce = 2250
    };
getRow(40071,5)->
    #pet_skills_upgradingCfg {
    skill_id = 40071,
    level = 5,
    item_cost = [13001,4],
    star_limit = 0,
    reborn_limit = 2,
    level_limit = 40,
    des = "弹奏镇魂曲，对周围28米敌人进行镇压攻击，总共造成1048%攻击的伤害并降低对方物理防御、魔法防御18%，持续5秒",
    fightForce = 3500
    };
getRow(40071,6)->
    #pet_skills_upgradingCfg {
    skill_id = 40071,
    level = 6,
    item_cost = [13001,5],
    star_limit = 0,
    reborn_limit = 3,
    level_limit = 50,
    des = "弹奏镇魂曲，对周围28米敌人进行镇压攻击，总共造成1191%攻击的伤害并降低对方物理防御、魔法防御20%，持续5秒",
    fightForce = 5000
    };
getRow(40072,1)->
    #pet_skills_upgradingCfg {
    skill_id = 40072,
    level = 1,
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "弹奏迷魂曲，对周围30米敌人进行4次迷惑攻击，每次造成122%攻击的伤害并降低对方20%的闪避等级，持续5秒",
    fightForce = 0
    };
getRow(40072,2)->
    #pet_skills_upgradingCfg {
    skill_id = 40072,
    level = 2,
    item_cost = [13001,1],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "弹奏迷魂曲，对周围30米敌人进行4次迷惑攻击，每次造成158%攻击的伤害并降低对方24%的闪避等级，持续5秒",
    fightForce = 500
    };
getRow(40072,3)->
    #pet_skills_upgradingCfg {
    skill_id = 40072,
    level = 3,
    item_cost = [13001,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 20,
    des = "弹奏迷魂曲，对周围30米敌人进行4次迷惑攻击，每次造成194%攻击的伤害并降低对方28%的闪避等级，持续5秒",
    fightForce = 1250
    };
getRow(40072,4)->
    #pet_skills_upgradingCfg {
    skill_id = 40072,
    level = 4,
    item_cost = [13001,3],
    star_limit = 0,
    reborn_limit = 1,
    level_limit = 30,
    des = "弹奏迷魂曲，对周围30米敌人进行4次迷惑攻击，每次造成230%攻击的伤害并降低对方32%的闪避等级，持续5秒",
    fightForce = 2250
    };
getRow(40072,5)->
    #pet_skills_upgradingCfg {
    skill_id = 40072,
    level = 5,
    item_cost = [13001,4],
    star_limit = 0,
    reborn_limit = 2,
    level_limit = 40,
    des = "弹奏迷魂曲，对周围30米敌人进行4次迷惑攻击，每次造成266%攻击的伤害并降低对方36%的闪避等级，持续5秒",
    fightForce = 3500
    };
getRow(40072,6)->
    #pet_skills_upgradingCfg {
    skill_id = 40072,
    level = 6,
    item_cost = [13001,5],
    star_limit = 0,
    reborn_limit = 3,
    level_limit = 50,
    des = "弹奏迷魂曲，对周围30米敌人进行4次迷惑攻击，每次造成302%攻击的伤害并降低对方40%的闪避等级，持续5秒",
    fightForce = 5000
    };
getRow(40090,1)->
    #pet_skills_upgradingCfg {
    skill_id = 40090,
    level = 1,
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "对前方多个敌人发射粒子弹道，总共造成197%攻击的伤害",
    fightForce = 0
    };
getRow(40090,2)->
    #pet_skills_upgradingCfg {
    skill_id = 40090,
    level = 2,
    item_cost = [13002,1],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "对前方多个敌人发射粒子弹道，总共造成277%攻击的伤害",
    fightForce = 1000
    };
getRow(40090,3)->
    #pet_skills_upgradingCfg {
    skill_id = 40090,
    level = 3,
    item_cost = [13002,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 20,
    des = "对前方多个敌人发射粒子弹道，总共造成357%攻击的伤害",
    fightForce = 2500
    };
getRow(40090,4)->
    #pet_skills_upgradingCfg {
    skill_id = 40090,
    level = 4,
    item_cost = [13002,3],
    star_limit = 0,
    reborn_limit = 1,
    level_limit = 30,
    des = "对前方多个敌人发射粒子弹道，总共造成437%攻击的伤害",
    fightForce = 4500
    };
getRow(40090,5)->
    #pet_skills_upgradingCfg {
    skill_id = 40090,
    level = 5,
    item_cost = [13002,4],
    star_limit = 0,
    reborn_limit = 2,
    level_limit = 40,
    des = "对前方多个敌人发射粒子弹道，总共造成517%攻击的伤害",
    fightForce = 7000
    };
getRow(40090,6)->
    #pet_skills_upgradingCfg {
    skill_id = 40090,
    level = 6,
    item_cost = [13002,5],
    star_limit = 0,
    reborn_limit = 3,
    level_limit = 50,
    des = "对前方多个敌人发射粒子弹道，总共造成597%攻击的伤害",
    fightForce = 10000
    };
getRow(40091,1)->
    #pet_skills_upgradingCfg {
    skill_id = 40091,
    level = 1,
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "对敌人周围造成224%攻击的伤害",
    fightForce = 0
    };
getRow(40091,2)->
    #pet_skills_upgradingCfg {
    skill_id = 40091,
    level = 2,
    item_cost = [13002,1],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "对敌人周围造成315%攻击的伤害",
    fightForce = 1000
    };
getRow(40091,3)->
    #pet_skills_upgradingCfg {
    skill_id = 40091,
    level = 3,
    item_cost = [13002,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 20,
    des = "对敌人周围造成406%攻击的伤害",
    fightForce = 2500
    };
getRow(40091,4)->
    #pet_skills_upgradingCfg {
    skill_id = 40091,
    level = 4,
    item_cost = [13002,3],
    star_limit = 0,
    reborn_limit = 1,
    level_limit = 30,
    des = "对敌人周围造成497%攻击的伤害",
    fightForce = 4500
    };
getRow(40091,5)->
    #pet_skills_upgradingCfg {
    skill_id = 40091,
    level = 5,
    item_cost = [13002,4],
    star_limit = 0,
    reborn_limit = 2,
    level_limit = 40,
    des = "对敌人周围造成588%攻击的伤害",
    fightForce = 7000
    };
getRow(40091,6)->
    #pet_skills_upgradingCfg {
    skill_id = 40091,
    level = 6,
    item_cost = [13002,5],
    star_limit = 0,
    reborn_limit = 3,
    level_limit = 50,
    des = "对敌人周围造成679%攻击的伤害",
    fightForce = 10000
    };
getRow(40092,1)->
    #pet_skills_upgradingCfg {
    skill_id = 40092,
    level = 1,
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "向前方发射粒子射线，前方30米矩形范围内敌人受到306%攻击的伤害，并造成对方禁魔，持续3秒",
    fightForce = 0
    };
getRow(40092,2)->
    #pet_skills_upgradingCfg {
    skill_id = 40092,
    level = 2,
    item_cost = [13002,1],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "向前方发射粒子射线，前方30米矩形范围内敌人受到429%攻击的伤害，并造成对方禁魔，持续3秒",
    fightForce = 1000
    };
getRow(40092,3)->
    #pet_skills_upgradingCfg {
    skill_id = 40092,
    level = 3,
    item_cost = [13002,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 20,
    des = "向前方发射粒子射线，前方30米矩形范围内敌人受到552%攻击的伤害，并造成对方禁魔，持续3秒",
    fightForce = 2500
    };
getRow(40092,4)->
    #pet_skills_upgradingCfg {
    skill_id = 40092,
    level = 4,
    item_cost = [13002,3],
    star_limit = 0,
    reborn_limit = 1,
    level_limit = 30,
    des = "向前方发射粒子射线，前方30米矩形范围内敌人受到675%攻击的伤害，并造成对方禁魔，持续3秒",
    fightForce = 4500
    };
getRow(40092,5)->
    #pet_skills_upgradingCfg {
    skill_id = 40092,
    level = 5,
    item_cost = [13002,4],
    star_limit = 0,
    reborn_limit = 2,
    level_limit = 40,
    des = "向前方发射粒子射线，前方30米矩形范围内敌人受到798%攻击的伤害，并造成对方禁魔，持续3秒",
    fightForce = 7000
    };
getRow(40092,6)->
    #pet_skills_upgradingCfg {
    skill_id = 40092,
    level = 6,
    item_cost = [13002,5],
    star_limit = 0,
    reborn_limit = 3,
    level_limit = 50,
    des = "向前方发射粒子射线，前方30米矩形范围内敌人受到921%攻击的伤害，并造成对方禁魔，持续3秒",
    fightForce = 10000
    };
getRow(40100,1)->
    #pet_skills_upgradingCfg {
    skill_id = 40100,
    level = 1,
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "对前方直线多个敌人进行攻击，总共造成320%攻击的伤害",
    fightForce = 0
    };
getRow(40100,2)->
    #pet_skills_upgradingCfg {
    skill_id = 40100,
    level = 2,
    item_cost = [13002,1],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "对前方直线多个敌人进行攻击，总共造成450%攻击的伤害",
    fightForce = 1000
    };
getRow(40100,3)->
    #pet_skills_upgradingCfg {
    skill_id = 40100,
    level = 3,
    item_cost = [13002,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 20,
    des = "对前方直线多个敌人进行攻击，总共造成580%攻击的伤害",
    fightForce = 2500
    };
getRow(40100,4)->
    #pet_skills_upgradingCfg {
    skill_id = 40100,
    level = 4,
    item_cost = [13002,3],
    star_limit = 0,
    reborn_limit = 1,
    level_limit = 30,
    des = "对前方直线多个敌人进行攻击，总共造成710%攻击的伤害",
    fightForce = 4500
    };
getRow(40100,5)->
    #pet_skills_upgradingCfg {
    skill_id = 40100,
    level = 5,
    item_cost = [13002,4],
    star_limit = 0,
    reborn_limit = 2,
    level_limit = 40,
    des = "对前方直线多个敌人进行攻击，总共造成840%攻击的伤害",
    fightForce = 7000
    };
getRow(40100,6)->
    #pet_skills_upgradingCfg {
    skill_id = 40100,
    level = 6,
    item_cost = [13002,5],
    star_limit = 0,
    reborn_limit = 3,
    level_limit = 50,
    des = "对前方直线多个敌人进行攻击，总共造成970%攻击的伤害",
    fightForce = 10000
    };
getRow(40101,1)->
    #pet_skills_upgradingCfg {
    skill_id = 40101,
    level = 1,
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "给自己创建一个伤害吸收盾，吸收自身物攻240%的伤害，持续5秒，并让周围怪物强制攻击自己",
    fightForce = 0
    };
getRow(40101,2)->
    #pet_skills_upgradingCfg {
    skill_id = 40101,
    level = 2,
    item_cost = [13002,1],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "给自己创建一个伤害吸收盾，吸收自身物攻336%的伤害，持续5秒，并让周围怪物强制攻击自己",
    fightForce = 1000
    };
getRow(40101,3)->
    #pet_skills_upgradingCfg {
    skill_id = 40101,
    level = 3,
    item_cost = [13002,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 20,
    des = "给自己创建一个伤害吸收盾，吸收自身物攻432%的伤害，持续5秒，并让周围怪物强制攻击自己",
    fightForce = 2500
    };
getRow(40101,4)->
    #pet_skills_upgradingCfg {
    skill_id = 40101,
    level = 4,
    item_cost = [13002,3],
    star_limit = 0,
    reborn_limit = 1,
    level_limit = 30,
    des = "给自己创建一个伤害吸收盾，吸收自身物攻528%的伤害，持续5秒，并让周围怪物强制攻击自己",
    fightForce = 4500
    };
getRow(40101,5)->
    #pet_skills_upgradingCfg {
    skill_id = 40101,
    level = 5,
    item_cost = [13002,4],
    star_limit = 0,
    reborn_limit = 2,
    level_limit = 40,
    des = "给自己创建一个伤害吸收盾，吸收自身物攻624%的伤害，持续5秒，并让周围怪物强制攻击自己",
    fightForce = 7000
    };
getRow(40101,6)->
    #pet_skills_upgradingCfg {
    skill_id = 40101,
    level = 6,
    item_cost = [13002,5],
    star_limit = 0,
    reborn_limit = 3,
    level_limit = 50,
    des = "给自己创建一个伤害吸收盾，吸收自身物攻720%的伤害，持续5秒，并让周围怪物强制攻击自己",
    fightForce = 10000
    };
getRow(40102,1)->
    #pet_skills_upgradingCfg {
    skill_id = 40102,
    level = 1,
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "对自身前方扇形范围进行大面积进行5次扫射，每次造成101%攻击的伤害",
    fightForce = 0
    };
getRow(40102,2)->
    #pet_skills_upgradingCfg {
    skill_id = 40102,
    level = 2,
    item_cost = [13002,1],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "对自身前方扇形范围进行大面积进行5次扫射，每次造成142%攻击的伤害",
    fightForce = 1000
    };
getRow(40102,3)->
    #pet_skills_upgradingCfg {
    skill_id = 40102,
    level = 3,
    item_cost = [13002,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 20,
    des = "对自身前方扇形范围进行大面积进行5次扫射，每次造成183%攻击的伤害",
    fightForce = 2500
    };
getRow(40102,4)->
    #pet_skills_upgradingCfg {
    skill_id = 40102,
    level = 4,
    item_cost = [13002,3],
    star_limit = 0,
    reborn_limit = 1,
    level_limit = 30,
    des = "对自身前方扇形范围进行大面积进行5次扫射，每次造成224%攻击的伤害",
    fightForce = 4500
    };
getRow(40102,5)->
    #pet_skills_upgradingCfg {
    skill_id = 40102,
    level = 5,
    item_cost = [13002,4],
    star_limit = 0,
    reborn_limit = 2,
    level_limit = 40,
    des = "对自身前方扇形范围进行大面积进行5次扫射，每次造成265%攻击的伤害",
    fightForce = 7000
    };
getRow(40102,6)->
    #pet_skills_upgradingCfg {
    skill_id = 40102,
    level = 6,
    item_cost = [13002,5],
    star_limit = 0,
    reborn_limit = 3,
    level_limit = 50,
    des = "对自身前方扇形范围进行大面积进行5次扫射，每次造成306%攻击的伤害",
    fightForce = 10000
    };
getRow(40110,1)->
    #pet_skills_upgradingCfg {
    skill_id = 40110,
    level = 1,
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "“女人，是你在玩火”前方直线上出现3个火柱，触碰到敌人受到272%攻击的伤害。",
    fightForce = 0
    };
getRow(40110,2)->
    #pet_skills_upgradingCfg {
    skill_id = 40110,
    level = 2,
    item_cost = [13002,1],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "“女人，是你在玩火”前方直线上出现3个火柱，触碰到敌人受到383%攻击的伤害。",
    fightForce = 1000
    };
getRow(40110,3)->
    #pet_skills_upgradingCfg {
    skill_id = 40110,
    level = 3,
    item_cost = [13002,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 20,
    des = "“女人，是你在玩火”前方直线上出现3个火柱，触碰到敌人受到494%攻击的伤害。",
    fightForce = 2500
    };
getRow(40110,4)->
    #pet_skills_upgradingCfg {
    skill_id = 40110,
    level = 4,
    item_cost = [13002,3],
    star_limit = 0,
    reborn_limit = 1,
    level_limit = 30,
    des = "“女人，是你在玩火”前方直线上出现3个火柱，触碰到敌人受到605%攻击的伤害。",
    fightForce = 4500
    };
getRow(40110,5)->
    #pet_skills_upgradingCfg {
    skill_id = 40110,
    level = 5,
    item_cost = [13002,4],
    star_limit = 0,
    reborn_limit = 2,
    level_limit = 40,
    des = "“女人，是你在玩火”前方直线上出现3个火柱，触碰到敌人受到716%攻击的伤害。",
    fightForce = 7000
    };
getRow(40110,6)->
    #pet_skills_upgradingCfg {
    skill_id = 40110,
    level = 6,
    item_cost = [13002,5],
    star_limit = 0,
    reborn_limit = 3,
    level_limit = 50,
    des = "“女人，是你在玩火”前方直线上出现3个火柱，触碰到敌人受到827%攻击的伤害。",
    fightForce = 10000
    };
getRow(40111,1)->
    #pet_skills_upgradingCfg {
    skill_id = 40111,
    level = 1,
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "对自身前方释放大量火焰，造成443%攻击的伤害",
    fightForce = 0
    };
getRow(40111,2)->
    #pet_skills_upgradingCfg {
    skill_id = 40111,
    level = 2,
    item_cost = [13002,1],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "对自身前方释放大量火焰，造成622%攻击的伤害",
    fightForce = 1000
    };
getRow(40111,3)->
    #pet_skills_upgradingCfg {
    skill_id = 40111,
    level = 3,
    item_cost = [13002,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 20,
    des = "对自身前方释放大量火焰，造成801%攻击的伤害",
    fightForce = 2500
    };
getRow(40111,4)->
    #pet_skills_upgradingCfg {
    skill_id = 40111,
    level = 4,
    item_cost = [13002,3],
    star_limit = 0,
    reborn_limit = 1,
    level_limit = 30,
    des = "对自身前方释放大量火焰，造成980%攻击的伤害",
    fightForce = 4500
    };
getRow(40111,5)->
    #pet_skills_upgradingCfg {
    skill_id = 40111,
    level = 5,
    item_cost = [13002,4],
    star_limit = 0,
    reborn_limit = 2,
    level_limit = 40,
    des = "对自身前方释放大量火焰，造成1159%攻击的伤害",
    fightForce = 7000
    };
getRow(40111,6)->
    #pet_skills_upgradingCfg {
    skill_id = 40111,
    level = 6,
    item_cost = [13002,5],
    star_limit = 0,
    reborn_limit = 3,
    level_limit = 50,
    des = "对自身前方释放大量火焰，造成1338%攻击的伤害",
    fightForce = 10000
    };
getRow(40114,1)->
    #pet_skills_upgradingCfg {
    skill_id = 40114,
    level = 1,
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "翼狮发出振奋人心的怒吼，增加主人攻击5%，持续5秒",
    fightForce = 0
    };
getRow(40114,2)->
    #pet_skills_upgradingCfg {
    skill_id = 40114,
    level = 2,
    item_cost = [13002,1],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "翼狮发出振奋人心的怒吼，增加主人攻击6%，持续5秒",
    fightForce = 1000
    };
getRow(40114,3)->
    #pet_skills_upgradingCfg {
    skill_id = 40114,
    level = 3,
    item_cost = [13002,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 20,
    des = "翼狮发出振奋人心的怒吼，增加主人攻击7%，持续5秒",
    fightForce = 2500
    };
getRow(40114,4)->
    #pet_skills_upgradingCfg {
    skill_id = 40114,
    level = 4,
    item_cost = [13002,3],
    star_limit = 0,
    reborn_limit = 1,
    level_limit = 30,
    des = "翼狮发出振奋人心的怒吼，增加主人攻击8%，持续5秒",
    fightForce = 4500
    };
getRow(40114,5)->
    #pet_skills_upgradingCfg {
    skill_id = 40114,
    level = 5,
    item_cost = [13002,4],
    star_limit = 0,
    reborn_limit = 2,
    level_limit = 40,
    des = "翼狮发出振奋人心的怒吼，增加主人攻击9%，持续5秒",
    fightForce = 7000
    };
getRow(40114,6)->
    #pet_skills_upgradingCfg {
    skill_id = 40114,
    level = 6,
    item_cost = [13002,5],
    star_limit = 0,
    reborn_limit = 3,
    level_limit = 50,
    des = "翼狮发出振奋人心的怒吼，增加主人攻击10%，持续5秒",
    fightForce = 10000
    };
getRow(40120,1)->
    #pet_skills_upgradingCfg {
    skill_id = 40120,
    level = 1,
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "对前方扇形敌人造成225%攻击的伤害",
    fightForce = 0
    };
getRow(40120,2)->
    #pet_skills_upgradingCfg {
    skill_id = 40120,
    level = 2,
    item_cost = [13002,1],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "对前方扇形敌人造成315%攻击的伤害",
    fightForce = 1000
    };
getRow(40120,3)->
    #pet_skills_upgradingCfg {
    skill_id = 40120,
    level = 3,
    item_cost = [13002,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 20,
    des = "对前方扇形敌人造成405%攻击的伤害",
    fightForce = 2500
    };
getRow(40120,4)->
    #pet_skills_upgradingCfg {
    skill_id = 40120,
    level = 4,
    item_cost = [13002,3],
    star_limit = 0,
    reborn_limit = 1,
    level_limit = 30,
    des = "对前方扇形敌人造成495%攻击的伤害",
    fightForce = 4500
    };
getRow(40120,5)->
    #pet_skills_upgradingCfg {
    skill_id = 40120,
    level = 5,
    item_cost = [13002,4],
    star_limit = 0,
    reborn_limit = 2,
    level_limit = 40,
    des = "对前方扇形敌人造成585%攻击的伤害",
    fightForce = 7000
    };
getRow(40120,6)->
    #pet_skills_upgradingCfg {
    skill_id = 40120,
    level = 6,
    item_cost = [13002,5],
    star_limit = 0,
    reborn_limit = 3,
    level_limit = 50,
    des = "对前方扇形敌人造成675%攻击的伤害",
    fightForce = 10000
    };
getRow(40121,1)->
    #pet_skills_upgradingCfg {
    skill_id = 40121,
    level = 1,
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "自身周围的敌人卷入海啸中造成331%攻击的伤害，并造成对方禁魔，持续5秒。",
    fightForce = 0
    };
getRow(40121,2)->
    #pet_skills_upgradingCfg {
    skill_id = 40121,
    level = 2,
    item_cost = [13002,1],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "自身周围的敌人卷入海啸中造成463%攻击的伤害，并造成对方禁魔，持续5秒。",
    fightForce = 1000
    };
getRow(40121,3)->
    #pet_skills_upgradingCfg {
    skill_id = 40121,
    level = 3,
    item_cost = [13002,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 20,
    des = "自身周围的敌人卷入海啸中造成595%攻击的伤害，并造成对方禁魔，持续5秒。",
    fightForce = 2500
    };
getRow(40121,4)->
    #pet_skills_upgradingCfg {
    skill_id = 40121,
    level = 4,
    item_cost = [13002,3],
    star_limit = 0,
    reborn_limit = 1,
    level_limit = 30,
    des = "自身周围的敌人卷入海啸中造成727%攻击的伤害，并造成对方禁魔，持续5秒。",
    fightForce = 4500
    };
getRow(40121,5)->
    #pet_skills_upgradingCfg {
    skill_id = 40121,
    level = 5,
    item_cost = [13002,4],
    star_limit = 0,
    reborn_limit = 2,
    level_limit = 40,
    des = "自身周围的敌人卷入海啸中造成859%攻击的伤害，并造成对方禁魔，持续5秒。",
    fightForce = 7000
    };
getRow(40121,6)->
    #pet_skills_upgradingCfg {
    skill_id = 40121,
    level = 6,
    item_cost = [13002,5],
    star_limit = 0,
    reborn_limit = 3,
    level_limit = 50,
    des = "自身周围的敌人卷入海啸中造成991%攻击的伤害，并造成对方禁魔，持续5秒。",
    fightForce = 10000
    };
getRow(40124,1)->
    #pet_skills_upgradingCfg {
    skill_id = 40124,
    level = 1,
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "（被动）鲸梦天生额外拥有30%的闪避率",
    fightForce = 0
    };
getRow(40124,2)->
    #pet_skills_upgradingCfg {
    skill_id = 40124,
    level = 2,
    item_cost = [13002,1],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "（被动）鲸梦天生额外拥有30%的闪避率",
    fightForce = 1000
    };
getRow(40124,3)->
    #pet_skills_upgradingCfg {
    skill_id = 40124,
    level = 3,
    item_cost = [13002,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 20,
    des = "（被动）鲸梦天生额外拥有30%的闪避率",
    fightForce = 2500
    };
getRow(40124,4)->
    #pet_skills_upgradingCfg {
    skill_id = 40124,
    level = 4,
    item_cost = [13002,3],
    star_limit = 0,
    reborn_limit = 1,
    level_limit = 30,
    des = "（被动）鲸梦天生额外拥有30%的闪避率",
    fightForce = 4500
    };
getRow(40130,1)->
    #pet_skills_upgradingCfg {
    skill_id = 40130,
    level = 1,
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "对前方矩形敌方发射火球，总共造成336%攻击的伤害",
    fightForce = 0
    };
getRow(40130,2)->
    #pet_skills_upgradingCfg {
    skill_id = 40130,
    level = 2,
    item_cost = [13002,1],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "对前方矩形敌方发射火球，总共造成466%攻击的伤害",
    fightForce = 1000
    };
getRow(40130,3)->
    #pet_skills_upgradingCfg {
    skill_id = 40130,
    level = 3,
    item_cost = [13002,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 20,
    des = "对前方矩形敌方发射火球，总共造成596%攻击的伤害",
    fightForce = 2500
    };
getRow(40130,4)->
    #pet_skills_upgradingCfg {
    skill_id = 40130,
    level = 4,
    item_cost = [13002,3],
    star_limit = 0,
    reborn_limit = 1,
    level_limit = 30,
    des = "对前方矩形敌方发射火球，总共造成726%攻击的伤害",
    fightForce = 4500
    };
getRow(40130,5)->
    #pet_skills_upgradingCfg {
    skill_id = 40130,
    level = 5,
    item_cost = [13002,4],
    star_limit = 0,
    reborn_limit = 2,
    level_limit = 40,
    des = "对前方矩形敌方发射火球，总共造成856%攻击的伤害",
    fightForce = 7000
    };
getRow(40130,6)->
    #pet_skills_upgradingCfg {
    skill_id = 40130,
    level = 6,
    item_cost = [13002,5],
    star_limit = 0,
    reborn_limit = 3,
    level_limit = 50,
    des = "对前方矩形敌方发射火球，总共造成986%攻击的伤害",
    fightForce = 10000
    };
getRow(40131,1)->
    #pet_skills_upgradingCfg {
    skill_id = 40131,
    level = 1,
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "远古图腾发动信仰之力，造成5次攻击，每次造成95%攻击的伤害。技能额外附带30%命中率。",
    fightForce = 0
    };
getRow(40131,2)->
    #pet_skills_upgradingCfg {
    skill_id = 40131,
    level = 2,
    item_cost = [13002,1],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "远古图腾发动信仰之力，造成5次攻击，每次造成133%攻击的伤害。技能额外附带30%命中率。",
    fightForce = 1000
    };
getRow(40131,3)->
    #pet_skills_upgradingCfg {
    skill_id = 40131,
    level = 3,
    item_cost = [13002,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 20,
    des = "远古图腾发动信仰之力，造成5次攻击，每次造成171%攻击的伤害。技能额外附带30%命中率。",
    fightForce = 2500
    };
getRow(40131,4)->
    #pet_skills_upgradingCfg {
    skill_id = 40131,
    level = 4,
    item_cost = [13002,3],
    star_limit = 0,
    reborn_limit = 1,
    level_limit = 30,
    des = "远古图腾发动信仰之力，造成5次攻击，每次造成209%攻击的伤害。技能额外附带30%命中率。",
    fightForce = 4500
    };
getRow(40131,5)->
    #pet_skills_upgradingCfg {
    skill_id = 40131,
    level = 5,
    item_cost = [13002,4],
    star_limit = 0,
    reborn_limit = 2,
    level_limit = 40,
    des = "远古图腾发动信仰之力，造成5次攻击，每次造成247%攻击的伤害。技能额外附带30%命中率。",
    fightForce = 7000
    };
getRow(40131,6)->
    #pet_skills_upgradingCfg {
    skill_id = 40131,
    level = 6,
    item_cost = [13002,5],
    star_limit = 0,
    reborn_limit = 3,
    level_limit = 50,
    des = "远古图腾发动信仰之力，造成5次攻击，每次造成285%攻击的伤害。技能额外附带30%命中率。",
    fightForce = 10000
    };
getRow(40132,1)->
    #pet_skills_upgradingCfg {
    skill_id = 40132,
    level = 1,
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "群攻火焰，造成5次攻击，每次造成114%攻击的伤害。技能额外附带30%暴击率。",
    fightForce = 0
    };
getRow(40132,2)->
    #pet_skills_upgradingCfg {
    skill_id = 40132,
    level = 2,
    item_cost = [13002,1],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "群攻火焰，造成5次攻击，每次造成160%攻击的伤害。技能额外附带30%暴击率。",
    fightForce = 1000
    };
getRow(40132,3)->
    #pet_skills_upgradingCfg {
    skill_id = 40132,
    level = 3,
    item_cost = [13002,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 20,
    des = "群攻火焰，造成5次攻击，每次造成206%攻击的伤害。技能额外附带30%暴击率。",
    fightForce = 2500
    };
getRow(40132,4)->
    #pet_skills_upgradingCfg {
    skill_id = 40132,
    level = 4,
    item_cost = [13002,3],
    star_limit = 0,
    reborn_limit = 1,
    level_limit = 30,
    des = "群攻火焰，造成5次攻击，每次造成252%攻击的伤害。技能额外附带30%暴击率。",
    fightForce = 4500
    };
getRow(40132,5)->
    #pet_skills_upgradingCfg {
    skill_id = 40132,
    level = 5,
    item_cost = [13002,4],
    star_limit = 0,
    reborn_limit = 2,
    level_limit = 40,
    des = "群攻火焰，造成5次攻击，每次造成298%攻击的伤害。技能额外附带30%暴击率。",
    fightForce = 7000
    };
getRow(40132,6)->
    #pet_skills_upgradingCfg {
    skill_id = 40132,
    level = 6,
    item_cost = [13002,5],
    star_limit = 0,
    reborn_limit = 3,
    level_limit = 50,
    des = "群攻火焰，造成5次攻击，每次造成344%攻击的伤害。技能额外附带30%暴击率。",
    fightForce = 10000
    };
getRow(40140,1)->
    #pet_skills_upgradingCfg {
    skill_id = 40140,
    level = 1,
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "使用盾牌击打前方扇形范围内敌人，造成288%攻击的伤害",
    fightForce = 0
    };
getRow(40140,2)->
    #pet_skills_upgradingCfg {
    skill_id = 40140,
    level = 2,
    item_cost = [13002,1],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "使用盾牌击打前方扇形范围内敌人，造成405%攻击的伤害",
    fightForce = 1000
    };
getRow(40140,3)->
    #pet_skills_upgradingCfg {
    skill_id = 40140,
    level = 3,
    item_cost = [13002,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 20,
    des = "使用盾牌击打前方扇形范围内敌人，造成522%攻击的伤害",
    fightForce = 2500
    };
getRow(40140,4)->
    #pet_skills_upgradingCfg {
    skill_id = 40140,
    level = 4,
    item_cost = [13002,3],
    star_limit = 0,
    reborn_limit = 1,
    level_limit = 30,
    des = "使用盾牌击打前方扇形范围内敌人，造成639%攻击的伤害",
    fightForce = 4500
    };
getRow(40140,5)->
    #pet_skills_upgradingCfg {
    skill_id = 40140,
    level = 5,
    item_cost = [13002,4],
    star_limit = 0,
    reborn_limit = 2,
    level_limit = 40,
    des = "使用盾牌击打前方扇形范围内敌人，造成756%攻击的伤害",
    fightForce = 7000
    };
getRow(40140,6)->
    #pet_skills_upgradingCfg {
    skill_id = 40140,
    level = 6,
    item_cost = [13002,5],
    star_limit = 0,
    reborn_limit = 3,
    level_limit = 50,
    des = "使用盾牌击打前方扇形范围内敌人，造成873%攻击的伤害",
    fightForce = 10000
    };
getRow(40141,1)->
    #pet_skills_upgradingCfg {
    skill_id = 40141,
    level = 1,
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "将前方直线范围内敌方拉近，并进行3攻击，每次造成126%攻击的伤害",
    fightForce = 0
    };
getRow(40141,2)->
    #pet_skills_upgradingCfg {
    skill_id = 40141,
    level = 2,
    item_cost = [13002,1],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "将前方直线范围内敌方拉近，并进行3攻击，每次造成176%攻击的伤害",
    fightForce = 1000
    };
getRow(40141,3)->
    #pet_skills_upgradingCfg {
    skill_id = 40141,
    level = 3,
    item_cost = [13002,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 20,
    des = "将前方直线范围内敌方拉近，并进行3攻击，每次造成226%攻击的伤害",
    fightForce = 2500
    };
getRow(40141,4)->
    #pet_skills_upgradingCfg {
    skill_id = 40141,
    level = 4,
    item_cost = [13002,3],
    star_limit = 0,
    reborn_limit = 1,
    level_limit = 30,
    des = "将前方直线范围内敌方拉近，并进行3攻击，每次造成276%攻击的伤害",
    fightForce = 4500
    };
getRow(40141,5)->
    #pet_skills_upgradingCfg {
    skill_id = 40141,
    level = 5,
    item_cost = [13002,4],
    star_limit = 0,
    reborn_limit = 2,
    level_limit = 40,
    des = "将前方直线范围内敌方拉近，并进行3攻击，每次造成326%攻击的伤害",
    fightForce = 7000
    };
getRow(40141,6)->
    #pet_skills_upgradingCfg {
    skill_id = 40141,
    level = 6,
    item_cost = [13002,5],
    star_limit = 0,
    reborn_limit = 3,
    level_limit = 50,
    des = "将前方直线范围内敌方拉近，并进行3攻击，每次造成376%攻击的伤害",
    fightForce = 10000
    };
getRow(40142,1)->
    #pet_skills_upgradingCfg {
    skill_id = 40142,
    level = 1,
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "（被动）使用技能【电锯惊魂】后增加自身10%的攻击",
    fightForce = 0
    };
getRow(40150,1)->
    #pet_skills_upgradingCfg {
    skill_id = 40150,
    level = 1,
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "锁定目标，对其进行定向射击。造成363%攻击的伤害",
    fightForce = 0
    };
getRow(40150,2)->
    #pet_skills_upgradingCfg {
    skill_id = 40150,
    level = 2,
    item_cost = [13002,1],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "锁定目标，对其进行定向射击。造成503%攻击的伤害",
    fightForce = 1000
    };
getRow(40150,3)->
    #pet_skills_upgradingCfg {
    skill_id = 40150,
    level = 3,
    item_cost = [13002,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 20,
    des = "锁定目标，对其进行定向射击。造成643%攻击的伤害",
    fightForce = 2500
    };
getRow(40150,4)->
    #pet_skills_upgradingCfg {
    skill_id = 40150,
    level = 4,
    item_cost = [13002,3],
    star_limit = 0,
    reborn_limit = 1,
    level_limit = 30,
    des = "锁定目标，对其进行定向射击。造成783%攻击的伤害",
    fightForce = 4500
    };
getRow(40150,5)->
    #pet_skills_upgradingCfg {
    skill_id = 40150,
    level = 5,
    item_cost = [13002,4],
    star_limit = 0,
    reborn_limit = 2,
    level_limit = 40,
    des = "锁定目标，对其进行定向射击。造成923%攻击的伤害",
    fightForce = 7000
    };
getRow(40150,6)->
    #pet_skills_upgradingCfg {
    skill_id = 40150,
    level = 6,
    item_cost = [13002,5],
    star_limit = 0,
    reborn_limit = 3,
    level_limit = 50,
    des = "锁定目标，对其进行定向射击。造成1063%攻击的伤害",
    fightForce = 10000
    };
getRow(40151,1)->
    #pet_skills_upgradingCfg {
    skill_id = 40151,
    level = 1,
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "扫射前方目标，并在目标脚下生成机枪。机枪将对自身周围造成3次攻击，每次151%攻击的伤害",
    fightForce = 0
    };
getRow(40151,2)->
    #pet_skills_upgradingCfg {
    skill_id = 40151,
    level = 2,
    item_cost = [13002,1],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "扫射前方目标，并在目标脚下生成机枪。机枪将对自身周围造成3次攻击，每次212%攻击的伤害",
    fightForce = 1000
    };
getRow(40151,3)->
    #pet_skills_upgradingCfg {
    skill_id = 40151,
    level = 3,
    item_cost = [13002,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 20,
    des = "扫射前方目标，并在目标脚下生成机枪。机枪将对自身周围造成3次攻击，每次273%攻击的伤害",
    fightForce = 2500
    };
getRow(40151,4)->
    #pet_skills_upgradingCfg {
    skill_id = 40151,
    level = 4,
    item_cost = [13002,3],
    star_limit = 0,
    reborn_limit = 1,
    level_limit = 30,
    des = "扫射前方目标，并在目标脚下生成机枪。机枪将对自身周围造成3次攻击，每次334%攻击的伤害",
    fightForce = 4500
    };
getRow(40151,5)->
    #pet_skills_upgradingCfg {
    skill_id = 40151,
    level = 5,
    item_cost = [13002,4],
    star_limit = 0,
    reborn_limit = 2,
    level_limit = 40,
    des = "扫射前方目标，并在目标脚下生成机枪。机枪将对自身周围造成3次攻击，每次395%攻击的伤害",
    fightForce = 7000
    };
getRow(40151,6)->
    #pet_skills_upgradingCfg {
    skill_id = 40151,
    level = 6,
    item_cost = [13002,5],
    star_limit = 0,
    reborn_limit = 3,
    level_limit = 50,
    des = "扫射前方目标，并在目标脚下生成机枪。机枪将对自身周围造成3次攻击，每次456%攻击的伤害",
    fightForce = 10000
    };
getRow(40155,1)->
    #pet_skills_upgradingCfg {
    skill_id = 40155,
    level = 1,
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "（被动）大黄蜂天生额外拥有15%破甲率",
    fightForce = 0
    };
getRow(40160,1)->
    #pet_skills_upgradingCfg {
    skill_id = 40160,
    level = 1,
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "攻击前方单体目标，总共造成499%攻击的伤害",
    fightForce = 0
    };
getRow(40160,2)->
    #pet_skills_upgradingCfg {
    skill_id = 40160,
    level = 2,
    item_cost = [13000,1],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 20,
    des = "攻击前方单体目标，总共造成595%攻击的伤害",
    fightForce = 250
    };
getRow(40160,3)->
    #pet_skills_upgradingCfg {
    skill_id = 40160,
    level = 3,
    item_cost = [13000,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 30,
    des = "攻击前方单体目标，总共造成691%攻击的伤害",
    fightForce = 600
    };
getRow(40160,4)->
    #pet_skills_upgradingCfg {
    skill_id = 40160,
    level = 4,
    item_cost = [13000,3],
    star_limit = 0,
    reborn_limit = 1,
    level_limit = 40,
    des = "攻击前方单体目标，总共造成787%攻击的伤害",
    fightForce = 1100
    };
getRow(40160,5)->
    #pet_skills_upgradingCfg {
    skill_id = 40160,
    level = 5,
    item_cost = [13000,4],
    star_limit = 0,
    reborn_limit = 2,
    level_limit = 50,
    des = "攻击前方单体目标，总共造成883%攻击的伤害",
    fightForce = 1700
    };
getRow(40160,6)->
    #pet_skills_upgradingCfg {
    skill_id = 40160,
    level = 6,
    item_cost = [13000,5],
    star_limit = 0,
    reborn_limit = 3,
    level_limit = 60,
    des = "攻击前方单体目标，总共造成979%攻击的伤害",
    fightForce = 2500
    };
getRow(40161,1)->
    #pet_skills_upgradingCfg {
    skill_id = 40161,
    level = 1,
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "对自身半径7米范围内敌方，总共造成832%攻击的伤害",
    fightForce = 0
    };
getRow(40161,2)->
    #pet_skills_upgradingCfg {
    skill_id = 40161,
    level = 2,
    item_cost = [13000,1],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 20,
    des = "对自身半径7米范围内敌方，总共造成1002%攻击的伤害",
    fightForce = 250
    };
getRow(40161,3)->
    #pet_skills_upgradingCfg {
    skill_id = 40161,
    level = 3,
    item_cost = [13000,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 30,
    des = "对自身半径7米范围内敌方，总共造成1172%攻击的伤害",
    fightForce = 600
    };
getRow(40161,4)->
    #pet_skills_upgradingCfg {
    skill_id = 40161,
    level = 4,
    item_cost = [13000,3],
    star_limit = 0,
    reborn_limit = 1,
    level_limit = 40,
    des = "对自身半径7米范围内敌方，总共造成1342%攻击的伤害",
    fightForce = 1100
    };
getRow(40161,5)->
    #pet_skills_upgradingCfg {
    skill_id = 40161,
    level = 5,
    item_cost = [13000,4],
    star_limit = 0,
    reborn_limit = 2,
    level_limit = 50,
    des = "对自身半径7米范围内敌方，总共造成1512%攻击的伤害",
    fightForce = 1700
    };
getRow(40161,6)->
    #pet_skills_upgradingCfg {
    skill_id = 40161,
    level = 6,
    item_cost = [13000,5],
    star_limit = 0,
    reborn_limit = 3,
    level_limit = 60,
    des = "对自身半径7米范围内敌方，总共造成1682%攻击的伤害",
    fightForce = 2500
    };
getRow(40170,1)->
    #pet_skills_upgradingCfg {
    skill_id = 40170,
    level = 1,
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "攻击前方扇形范围内敌人造成357%攻击的伤害",
    fightForce = 0
    };
getRow(40170,2)->
    #pet_skills_upgradingCfg {
    skill_id = 40170,
    level = 2,
    item_cost = [13000,1],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 20,
    des = "攻击前方扇形范围内敌人造成427%攻击的伤害",
    fightForce = 250
    };
getRow(40170,3)->
    #pet_skills_upgradingCfg {
    skill_id = 40170,
    level = 3,
    item_cost = [13000,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 30,
    des = "攻击前方扇形范围内敌人造成497%攻击的伤害",
    fightForce = 600
    };
getRow(40170,4)->
    #pet_skills_upgradingCfg {
    skill_id = 40170,
    level = 4,
    item_cost = [13000,3],
    star_limit = 0,
    reborn_limit = 1,
    level_limit = 40,
    des = "攻击前方扇形范围内敌人造成567%攻击的伤害",
    fightForce = 1100
    };
getRow(40170,5)->
    #pet_skills_upgradingCfg {
    skill_id = 40170,
    level = 5,
    item_cost = [13000,4],
    star_limit = 0,
    reborn_limit = 2,
    level_limit = 50,
    des = "攻击前方扇形范围内敌人造成637%攻击的伤害",
    fightForce = 1700
    };
getRow(40170,6)->
    #pet_skills_upgradingCfg {
    skill_id = 40170,
    level = 6,
    item_cost = [13000,5],
    star_limit = 0,
    reborn_limit = 3,
    level_limit = 60,
    des = "攻击前方扇形范围内敌人造成707%攻击的伤害",
    fightForce = 2500
    };
getRow(40171,1)->
    #pet_skills_upgradingCfg {
    skill_id = 40171,
    level = 1,
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "前方矩形范围内敌人受到480%攻击的伤害",
    fightForce = 0
    };
getRow(40171,2)->
    #pet_skills_upgradingCfg {
    skill_id = 40171,
    level = 2,
    item_cost = [13000,1],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 20,
    des = "前方矩形范围内敌人受到580%攻击的伤害",
    fightForce = 250
    };
getRow(40171,3)->
    #pet_skills_upgradingCfg {
    skill_id = 40171,
    level = 3,
    item_cost = [13000,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 30,
    des = "前方矩形范围内敌人受到680%攻击的伤害",
    fightForce = 600
    };
getRow(40171,4)->
    #pet_skills_upgradingCfg {
    skill_id = 40171,
    level = 4,
    item_cost = [13000,3],
    star_limit = 0,
    reborn_limit = 1,
    level_limit = 40,
    des = "前方矩形范围内敌人受到780%攻击的伤害",
    fightForce = 1100
    };
getRow(40171,5)->
    #pet_skills_upgradingCfg {
    skill_id = 40171,
    level = 5,
    item_cost = [13000,4],
    star_limit = 0,
    reborn_limit = 2,
    level_limit = 50,
    des = "前方矩形范围内敌人受到880%攻击的伤害",
    fightForce = 1700
    };
getRow(40171,6)->
    #pet_skills_upgradingCfg {
    skill_id = 40171,
    level = 6,
    item_cost = [13000,5],
    star_limit = 0,
    reborn_limit = 3,
    level_limit = 60,
    des = "前方矩形范围内敌人受到980%攻击的伤害",
    fightForce = 2500
    };
getRow(40180,1)->
    #pet_skills_upgradingCfg {
    skill_id = 40180,
    level = 1,
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "扑向前方敌人，总共造成377%攻击的伤害",
    fightForce = 0
    };
getRow(40180,2)->
    #pet_skills_upgradingCfg {
    skill_id = 40180,
    level = 2,
    item_cost = [13000,1],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 20,
    des = "扑向前方敌人，总共造成456%攻击的伤害",
    fightForce = 250
    };
getRow(40180,3)->
    #pet_skills_upgradingCfg {
    skill_id = 40180,
    level = 3,
    item_cost = [13000,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 30,
    des = "扑向前方敌人，总共造成535%攻击的伤害",
    fightForce = 600
    };
getRow(40180,4)->
    #pet_skills_upgradingCfg {
    skill_id = 40180,
    level = 4,
    item_cost = [13000,3],
    star_limit = 0,
    reborn_limit = 1,
    level_limit = 40,
    des = "扑向前方敌人，总共造成614%攻击的伤害",
    fightForce = 1100
    };
getRow(40180,5)->
    #pet_skills_upgradingCfg {
    skill_id = 40180,
    level = 5,
    item_cost = [13000,4],
    star_limit = 0,
    reborn_limit = 2,
    level_limit = 50,
    des = "扑向前方敌人，总共造成693%攻击的伤害",
    fightForce = 1700
    };
getRow(40180,6)->
    #pet_skills_upgradingCfg {
    skill_id = 40180,
    level = 6,
    item_cost = [13000,5],
    star_limit = 0,
    reborn_limit = 3,
    level_limit = 60,
    des = "扑向前方敌人，总共造成772%攻击的伤害",
    fightForce = 2500
    };
getRow(40181,1)->
    #pet_skills_upgradingCfg {
    skill_id = 40181,
    level = 1,
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "攻击正前方扇形区域敌人2次，每次造成817%攻击的伤害，50%概率降低20%防御力",
    fightForce = 0
    };
getRow(40181,2)->
    #pet_skills_upgradingCfg {
    skill_id = 40181,
    level = 2,
    item_cost = [13000,1],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 20,
    des = "攻击正前方扇形区域敌人2次，每次造成984%攻击的伤害，50%概率降低24%防御力",
    fightForce = 250
    };
getRow(40181,3)->
    #pet_skills_upgradingCfg {
    skill_id = 40181,
    level = 3,
    item_cost = [13000,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 30,
    des = "攻击正前方扇形区域敌人2次，每次造成1151%攻击的伤害，50%概率降低28%防御力",
    fightForce = 600
    };
getRow(40181,4)->
    #pet_skills_upgradingCfg {
    skill_id = 40181,
    level = 4,
    item_cost = [13000,3],
    star_limit = 0,
    reborn_limit = 1,
    level_limit = 40,
    des = "攻击正前方扇形区域敌人2次，每次造成1318%攻击的伤害，50%概率降低32%防御力",
    fightForce = 1100
    };
getRow(40181,5)->
    #pet_skills_upgradingCfg {
    skill_id = 40181,
    level = 5,
    item_cost = [13000,4],
    star_limit = 0,
    reborn_limit = 2,
    level_limit = 50,
    des = "攻击正前方扇形区域敌人2次，每次造成1485%攻击的伤害，50%概率降低36%防御力",
    fightForce = 1700
    };
getRow(40181,6)->
    #pet_skills_upgradingCfg {
    skill_id = 40181,
    level = 6,
    item_cost = [13000,5],
    star_limit = 0,
    reborn_limit = 3,
    level_limit = 60,
    des = "攻击正前方扇形区域敌人2次，每次造成1652%攻击的伤害，50%概率降低40%防御力",
    fightForce = 2500
    };
getRow(40190,1)->
    #pet_skills_upgradingCfg {
    skill_id = 40190,
    level = 1,
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "扑向前方敌人，总共造成377%攻击的伤害",
    fightForce = 0
    };
getRow(40190,2)->
    #pet_skills_upgradingCfg {
    skill_id = 40190,
    level = 2,
    item_cost = [13000,1],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 20,
    des = "扑向前方敌人，总共造成456%攻击的伤害",
    fightForce = 250
    };
getRow(40190,3)->
    #pet_skills_upgradingCfg {
    skill_id = 40190,
    level = 3,
    item_cost = [13000,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 30,
    des = "扑向前方敌人，总共造成535%攻击的伤害",
    fightForce = 600
    };
getRow(40190,4)->
    #pet_skills_upgradingCfg {
    skill_id = 40190,
    level = 4,
    item_cost = [13000,3],
    star_limit = 0,
    reborn_limit = 1,
    level_limit = 40,
    des = "扑向前方敌人，总共造成614%攻击的伤害",
    fightForce = 1100
    };
getRow(40190,5)->
    #pet_skills_upgradingCfg {
    skill_id = 40190,
    level = 5,
    item_cost = [13000,4],
    star_limit = 0,
    reborn_limit = 2,
    level_limit = 50,
    des = "扑向前方敌人，总共造成693%攻击的伤害",
    fightForce = 1700
    };
getRow(40190,6)->
    #pet_skills_upgradingCfg {
    skill_id = 40190,
    level = 6,
    item_cost = [13000,5],
    star_limit = 0,
    reborn_limit = 3,
    level_limit = 60,
    des = "扑向前方敌人，总共造成772%攻击的伤害",
    fightForce = 2500
    };
getRow(40191,1)->
    #pet_skills_upgradingCfg {
    skill_id = 40191,
    level = 1,
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "前方扇形15米180度敌人，总共造成471%攻击的伤害，暴击则降低5%攻击力",
    fightForce = 0
    };
getRow(40191,2)->
    #pet_skills_upgradingCfg {
    skill_id = 40191,
    level = 2,
    item_cost = [13000,1],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 20,
    des = "前方扇形15米180度敌人，总共造成569%攻击的伤害，暴击则降低6%攻击力",
    fightForce = 250
    };
getRow(40191,3)->
    #pet_skills_upgradingCfg {
    skill_id = 40191,
    level = 3,
    item_cost = [13000,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 30,
    des = "前方扇形15米180度敌人，总共造成667%攻击的伤害，暴击则降低7%攻击力",
    fightForce = 600
    };
getRow(40191,4)->
    #pet_skills_upgradingCfg {
    skill_id = 40191,
    level = 4,
    item_cost = [13000,3],
    star_limit = 0,
    reborn_limit = 1,
    level_limit = 40,
    des = "前方扇形15米180度敌人，总共造成765%攻击的伤害，暴击则降低8%攻击力",
    fightForce = 1100
    };
getRow(40191,5)->
    #pet_skills_upgradingCfg {
    skill_id = 40191,
    level = 5,
    item_cost = [13000,4],
    star_limit = 0,
    reborn_limit = 2,
    level_limit = 50,
    des = "前方扇形15米180度敌人，总共造成863%攻击的伤害，暴击则降低9%攻击力",
    fightForce = 1700
    };
getRow(40191,6)->
    #pet_skills_upgradingCfg {
    skill_id = 40191,
    level = 6,
    item_cost = [13000,5],
    star_limit = 0,
    reborn_limit = 3,
    level_limit = 60,
    des = "前方扇形15米180度敌人，总共造成961%攻击的伤害，暴击则降低10%攻击力",
    fightForce = 2500
    };
getRow(40200,1)->
    #pet_skills_upgradingCfg {
    skill_id = 40200,
    level = 1,
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "攻击前方单体目标，总共造成448%攻击的伤害",
    fightForce = 0
    };
getRow(40200,2)->
    #pet_skills_upgradingCfg {
    skill_id = 40200,
    level = 2,
    item_cost = [13000,1],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 20,
    des = "攻击前方单体目标，总共造成532%攻击的伤害",
    fightForce = 250
    };
getRow(40200,3)->
    #pet_skills_upgradingCfg {
    skill_id = 40200,
    level = 3,
    item_cost = [13000,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 30,
    des = "攻击前方单体目标，总共造成616%攻击的伤害",
    fightForce = 600
    };
getRow(40200,4)->
    #pet_skills_upgradingCfg {
    skill_id = 40200,
    level = 4,
    item_cost = [13000,3],
    star_limit = 0,
    reborn_limit = 1,
    level_limit = 40,
    des = "攻击前方单体目标，总共造成700%攻击的伤害",
    fightForce = 1100
    };
getRow(40200,5)->
    #pet_skills_upgradingCfg {
    skill_id = 40200,
    level = 5,
    item_cost = [13000,4],
    star_limit = 0,
    reborn_limit = 2,
    level_limit = 50,
    des = "攻击前方单体目标，总共造成784%攻击的伤害",
    fightForce = 1700
    };
getRow(40200,6)->
    #pet_skills_upgradingCfg {
    skill_id = 40200,
    level = 6,
    item_cost = [13000,5],
    star_limit = 0,
    reborn_limit = 3,
    level_limit = 60,
    des = "攻击前方单体目标，总共造成868%攻击的伤害",
    fightForce = 2500
    };
getRow(40201,1)->
    #pet_skills_upgradingCfg {
    skill_id = 40201,
    level = 1,
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "周围10米敌方有概率陷入昏迷2秒，造成490%点伤害",
    fightForce = 0
    };
getRow(40201,2)->
    #pet_skills_upgradingCfg {
    skill_id = 40201,
    level = 2,
    item_cost = [13000,1],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 20,
    des = "周围10米敌方有概率陷入昏迷2秒，造成586%点伤害",
    fightForce = 250
    };
getRow(40201,3)->
    #pet_skills_upgradingCfg {
    skill_id = 40201,
    level = 3,
    item_cost = [13000,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 30,
    des = "周围10米敌方有概率陷入昏迷2秒，造成682%点伤害",
    fightForce = 600
    };
getRow(40201,4)->
    #pet_skills_upgradingCfg {
    skill_id = 40201,
    level = 4,
    item_cost = [13000,3],
    star_limit = 0,
    reborn_limit = 1,
    level_limit = 40,
    des = "周围10米敌方有概率陷入昏迷2秒，造成778%点伤害",
    fightForce = 1100
    };
getRow(40201,5)->
    #pet_skills_upgradingCfg {
    skill_id = 40201,
    level = 5,
    item_cost = [13000,4],
    star_limit = 0,
    reborn_limit = 2,
    level_limit = 50,
    des = "周围10米敌方有概率陷入昏迷2秒，造成874%点伤害",
    fightForce = 1700
    };
getRow(40201,6)->
    #pet_skills_upgradingCfg {
    skill_id = 40201,
    level = 6,
    item_cost = [13000,5],
    star_limit = 0,
    reborn_limit = 3,
    level_limit = 60,
    des = "周围10米敌方有概率陷入昏迷2秒，造成970%点伤害",
    fightForce = 2500
    };
getRow(40210,1)->
    #pet_skills_upgradingCfg {
    skill_id = 40210,
    level = 1,
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "攻击前方单体目标，总共造成448%攻击的伤害",
    fightForce = 0
    };
getRow(40210,2)->
    #pet_skills_upgradingCfg {
    skill_id = 40210,
    level = 2,
    item_cost = [13000,1],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 20,
    des = "攻击前方单体目标，总共造成532%攻击的伤害",
    fightForce = 250
    };
getRow(40210,3)->
    #pet_skills_upgradingCfg {
    skill_id = 40210,
    level = 3,
    item_cost = [13000,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 30,
    des = "攻击前方单体目标，总共造成616%攻击的伤害",
    fightForce = 600
    };
getRow(40210,4)->
    #pet_skills_upgradingCfg {
    skill_id = 40210,
    level = 4,
    item_cost = [13000,3],
    star_limit = 0,
    reborn_limit = 1,
    level_limit = 40,
    des = "攻击前方单体目标，总共造成700%攻击的伤害",
    fightForce = 1100
    };
getRow(40210,5)->
    #pet_skills_upgradingCfg {
    skill_id = 40210,
    level = 5,
    item_cost = [13000,4],
    star_limit = 0,
    reborn_limit = 2,
    level_limit = 50,
    des = "攻击前方单体目标，总共造成784%攻击的伤害",
    fightForce = 1700
    };
getRow(40210,6)->
    #pet_skills_upgradingCfg {
    skill_id = 40210,
    level = 6,
    item_cost = [13000,5],
    star_limit = 0,
    reborn_limit = 3,
    level_limit = 60,
    des = "攻击前方单体目标，总共造成868%攻击的伤害",
    fightForce = 2500
    };
getRow(40211,1)->
    #pet_skills_upgradingCfg {
    skill_id = 40211,
    level = 1,
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "攻击前方扇形范围内敌方，总共造成816%攻击的伤害，对玩家会造成双倍伤害",
    fightForce = 0
    };
getRow(40211,2)->
    #pet_skills_upgradingCfg {
    skill_id = 40211,
    level = 2,
    item_cost = [13000,1],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 20,
    des = "攻击前方扇形范围内敌方，总共造成976%攻击的伤害，对玩家会造成双倍伤害",
    fightForce = 250
    };
getRow(40211,3)->
    #pet_skills_upgradingCfg {
    skill_id = 40211,
    level = 3,
    item_cost = [13000,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 30,
    des = "攻击前方扇形范围内敌方，总共造成1136%攻击的伤害，对玩家会造成双倍伤害",
    fightForce = 600
    };
getRow(40211,4)->
    #pet_skills_upgradingCfg {
    skill_id = 40211,
    level = 4,
    item_cost = [13000,3],
    star_limit = 0,
    reborn_limit = 1,
    level_limit = 40,
    des = "攻击前方扇形范围内敌方，总共造成1296%攻击的伤害，对玩家会造成双倍伤害",
    fightForce = 1100
    };
getRow(40211,5)->
    #pet_skills_upgradingCfg {
    skill_id = 40211,
    level = 5,
    item_cost = [13000,4],
    star_limit = 0,
    reborn_limit = 2,
    level_limit = 50,
    des = "攻击前方扇形范围内敌方，总共造成1456%攻击的伤害，对玩家会造成双倍伤害",
    fightForce = 1700
    };
getRow(40211,6)->
    #pet_skills_upgradingCfg {
    skill_id = 40211,
    level = 6,
    item_cost = [13000,5],
    star_limit = 0,
    reborn_limit = 3,
    level_limit = 60,
    des = "攻击前方扇形范围内敌方，总共造成1616%攻击的伤害，对玩家会造成双倍伤害",
    fightForce = 2500
    };
getRow(40220,1)->
    #pet_skills_upgradingCfg {
    skill_id = 40220,
    level = 1,
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "对前方120度敌人造成2次攻击，每次造成202%攻击的伤害",
    fightForce = 0
    };
getRow(40220,2)->
    #pet_skills_upgradingCfg {
    skill_id = 40220,
    level = 2,
    item_cost = [13000,1],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 20,
    des = "对前方120度敌人造成2次攻击，每次造成241%攻击的伤害",
    fightForce = 250
    };
getRow(40220,3)->
    #pet_skills_upgradingCfg {
    skill_id = 40220,
    level = 3,
    item_cost = [13000,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 30,
    des = "对前方120度敌人造成2次攻击，每次造成280%攻击的伤害",
    fightForce = 600
    };
getRow(40220,4)->
    #pet_skills_upgradingCfg {
    skill_id = 40220,
    level = 4,
    item_cost = [13000,3],
    star_limit = 0,
    reborn_limit = 1,
    level_limit = 40,
    des = "对前方120度敌人造成2次攻击，每次造成319%攻击的伤害",
    fightForce = 1100
    };
getRow(40220,5)->
    #pet_skills_upgradingCfg {
    skill_id = 40220,
    level = 5,
    item_cost = [13000,4],
    star_limit = 0,
    reborn_limit = 2,
    level_limit = 50,
    des = "对前方120度敌人造成2次攻击，每次造成358%攻击的伤害",
    fightForce = 1700
    };
getRow(40220,6)->
    #pet_skills_upgradingCfg {
    skill_id = 40220,
    level = 6,
    item_cost = [13000,5],
    star_limit = 0,
    reborn_limit = 3,
    level_limit = 60,
    des = "对前方120度敌人造成2次攻击，每次造成397%攻击的伤害",
    fightForce = 2500
    };
getRow(40221,1)->
    #pet_skills_upgradingCfg {
    skill_id = 40221,
    level = 1,
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "周围敌人攻击力降低10%",
    fightForce = 0
    };
getRow(40221,2)->
    #pet_skills_upgradingCfg {
    skill_id = 40221,
    level = 2,
    item_cost = [13000,1],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 20,
    des = "周围敌人攻击力降低11%",
    fightForce = 250
    };
getRow(40221,3)->
    #pet_skills_upgradingCfg {
    skill_id = 40221,
    level = 3,
    item_cost = [13000,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 30,
    des = "周围敌人攻击力降低12%",
    fightForce = 600
    };
getRow(40221,4)->
    #pet_skills_upgradingCfg {
    skill_id = 40221,
    level = 4,
    item_cost = [13000,3],
    star_limit = 0,
    reborn_limit = 1,
    level_limit = 40,
    des = "周围敌人攻击力降低13%",
    fightForce = 1100
    };
getRow(40221,5)->
    #pet_skills_upgradingCfg {
    skill_id = 40221,
    level = 5,
    item_cost = [13000,4],
    star_limit = 0,
    reborn_limit = 2,
    level_limit = 50,
    des = "周围敌人攻击力降低14%",
    fightForce = 1700
    };
getRow(40221,6)->
    #pet_skills_upgradingCfg {
    skill_id = 40221,
    level = 6,
    item_cost = [13000,5],
    star_limit = 0,
    reborn_limit = 3,
    level_limit = 60,
    des = "周围敌人攻击力降低15%",
    fightForce = 2500
    };
getRow(40230,1)->
    #pet_skills_upgradingCfg {
    skill_id = 40230,
    level = 1,
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "攻击前方7米单体目标，总共造成236%攻击的伤害",
    fightForce = 0
    };
getRow(40230,2)->
    #pet_skills_upgradingCfg {
    skill_id = 40230,
    level = 2,
    item_cost = [13000,1],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "攻击前方7米单体目标，总共造成285%攻击的伤害",
    fightForce = 250
    };
getRow(40230,3)->
    #pet_skills_upgradingCfg {
    skill_id = 40230,
    level = 3,
    item_cost = [13000,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 20,
    des = "攻击前方7米单体目标，总共造成334%攻击的伤害",
    fightForce = 600
    };
getRow(40230,4)->
    #pet_skills_upgradingCfg {
    skill_id = 40230,
    level = 4,
    item_cost = [13000,3],
    star_limit = 0,
    reborn_limit = 1,
    level_limit = 30,
    des = "攻击前方7米单体目标，总共造成383%攻击的伤害",
    fightForce = 1100
    };
getRow(40230,5)->
    #pet_skills_upgradingCfg {
    skill_id = 40230,
    level = 5,
    item_cost = [13000,4],
    star_limit = 0,
    reborn_limit = 2,
    level_limit = 40,
    des = "攻击前方7米单体目标，总共造成432%攻击的伤害",
    fightForce = 1700
    };
getRow(40230,6)->
    #pet_skills_upgradingCfg {
    skill_id = 40230,
    level = 6,
    item_cost = [13000,5],
    star_limit = 0,
    reborn_limit = 3,
    level_limit = 50,
    des = "攻击前方7米单体目标，总共造成481%攻击的伤害",
    fightForce = 2500
    };
getRow(40231,1)->
    #pet_skills_upgradingCfg {
    skill_id = 40231,
    level = 1,
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "攻击前方矩形范围内敌方，总共造成471%攻击的伤害，对周围敌人降低物攻5%，持续时间5秒",
    fightForce = 0
    };
getRow(40231,2)->
    #pet_skills_upgradingCfg {
    skill_id = 40231,
    level = 2,
    item_cost = [13000,1],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "攻击前方矩形范围内敌方，总共造成569%攻击的伤害，对周围敌人降低物攻6%，持续时间5秒",
    fightForce = 250
    };
getRow(40231,3)->
    #pet_skills_upgradingCfg {
    skill_id = 40231,
    level = 3,
    item_cost = [13000,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 20,
    des = "攻击前方矩形范围内敌方，总共造成667%攻击的伤害，对周围敌人降低物攻7%，持续时间5秒",
    fightForce = 600
    };
getRow(40231,4)->
    #pet_skills_upgradingCfg {
    skill_id = 40231,
    level = 4,
    item_cost = [13000,3],
    star_limit = 0,
    reborn_limit = 1,
    level_limit = 30,
    des = "攻击前方矩形范围内敌方，总共造成765%攻击的伤害，对周围敌人降低物攻8%，持续时间5秒",
    fightForce = 1100
    };
getRow(40231,5)->
    #pet_skills_upgradingCfg {
    skill_id = 40231,
    level = 5,
    item_cost = [13000,4],
    star_limit = 0,
    reborn_limit = 2,
    level_limit = 40,
    des = "攻击前方矩形范围内敌方，总共造成863%攻击的伤害，对周围敌人降低物攻9%，持续时间5秒",
    fightForce = 1700
    };
getRow(40231,6)->
    #pet_skills_upgradingCfg {
    skill_id = 40231,
    level = 6,
    item_cost = [13000,5],
    star_limit = 0,
    reborn_limit = 3,
    level_limit = 50,
    des = "攻击前方矩形范围内敌方，总共造成961%攻击的伤害，对周围敌人降低物攻10%，持续时间5秒",
    fightForce = 2500
    };
getRow(40240,1)->
    #pet_skills_upgradingCfg {
    skill_id = 40240,
    level = 1,
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "前方矩形15米范围内，发射一个泡泡，总共造成240%攻击的伤害",
    fightForce = 0
    };
getRow(40240,2)->
    #pet_skills_upgradingCfg {
    skill_id = 40240,
    level = 2,
    item_cost = [13000,1],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "前方矩形15米范围内，发射一个泡泡，总共造成290%攻击的伤害",
    fightForce = 250
    };
getRow(40240,3)->
    #pet_skills_upgradingCfg {
    skill_id = 40240,
    level = 3,
    item_cost = [13000,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 20,
    des = "前方矩形15米范围内，发射一个泡泡，总共造成340%攻击的伤害",
    fightForce = 600
    };
getRow(40240,4)->
    #pet_skills_upgradingCfg {
    skill_id = 40240,
    level = 4,
    item_cost = [13000,3],
    star_limit = 0,
    reborn_limit = 1,
    level_limit = 30,
    des = "前方矩形15米范围内，发射一个泡泡，总共造成390%攻击的伤害",
    fightForce = 1100
    };
getRow(40240,5)->
    #pet_skills_upgradingCfg {
    skill_id = 40240,
    level = 5,
    item_cost = [13000,4],
    star_limit = 0,
    reborn_limit = 2,
    level_limit = 40,
    des = "前方矩形15米范围内，发射一个泡泡，总共造成440%攻击的伤害",
    fightForce = 1700
    };
getRow(40240,6)->
    #pet_skills_upgradingCfg {
    skill_id = 40240,
    level = 6,
    item_cost = [13000,5],
    star_limit = 0,
    reborn_limit = 3,
    level_limit = 50,
    des = "前方矩形15米范围内，发射一个泡泡，总共造成490%攻击的伤害",
    fightForce = 2500
    };
getRow(40241,1)->
    #pet_skills_upgradingCfg {
    skill_id = 40241,
    level = 1,
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "攻击前方矩形范围内敌方，造成480%攻击的伤害",
    fightForce = 0
    };
getRow(40241,2)->
    #pet_skills_upgradingCfg {
    skill_id = 40241,
    level = 2,
    item_cost = [13000,1],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "攻击前方矩形范围内敌方，造成580%攻击的伤害",
    fightForce = 250
    };
getRow(40241,3)->
    #pet_skills_upgradingCfg {
    skill_id = 40241,
    level = 3,
    item_cost = [13000,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 20,
    des = "攻击前方矩形范围内敌方，造成680%攻击的伤害",
    fightForce = 600
    };
getRow(40241,4)->
    #pet_skills_upgradingCfg {
    skill_id = 40241,
    level = 4,
    item_cost = [13000,3],
    star_limit = 0,
    reborn_limit = 1,
    level_limit = 30,
    des = "攻击前方矩形范围内敌方，造成780%攻击的伤害",
    fightForce = 1100
    };
getRow(40241,5)->
    #pet_skills_upgradingCfg {
    skill_id = 40241,
    level = 5,
    item_cost = [13000,4],
    star_limit = 0,
    reborn_limit = 2,
    level_limit = 40,
    des = "攻击前方矩形范围内敌方，造成880%攻击的伤害",
    fightForce = 1700
    };
getRow(40241,6)->
    #pet_skills_upgradingCfg {
    skill_id = 40241,
    level = 6,
    item_cost = [13000,5],
    star_limit = 0,
    reborn_limit = 3,
    level_limit = 50,
    des = "攻击前方矩形范围内敌方，造成980%攻击的伤害",
    fightForce = 2500
    };
getRow(40250,1)->
    #pet_skills_upgradingCfg {
    skill_id = 40250,
    level = 1,
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "对前方单个敌人造成2次伤害，每次造成250%攻击的伤害",
    fightForce = 0
    };
getRow(40250,2)->
    #pet_skills_upgradingCfg {
    skill_id = 40250,
    level = 2,
    item_cost = [13000,1],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "对前方单个敌人造成2次伤害，每次造成298%攻击的伤害",
    fightForce = 250
    };
getRow(40250,3)->
    #pet_skills_upgradingCfg {
    skill_id = 40250,
    level = 3,
    item_cost = [13000,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 20,
    des = "对前方单个敌人造成2次伤害，每次造成346%攻击的伤害",
    fightForce = 600
    };
getRow(40250,4)->
    #pet_skills_upgradingCfg {
    skill_id = 40250,
    level = 4,
    item_cost = [13000,3],
    star_limit = 0,
    reborn_limit = 1,
    level_limit = 30,
    des = "对前方单个敌人造成2次伤害，每次造成394%攻击的伤害",
    fightForce = 1100
    };
getRow(40250,5)->
    #pet_skills_upgradingCfg {
    skill_id = 40250,
    level = 5,
    item_cost = [13000,4],
    star_limit = 0,
    reborn_limit = 2,
    level_limit = 40,
    des = "对前方单个敌人造成2次伤害，每次造成442%攻击的伤害",
    fightForce = 1700
    };
getRow(40250,6)->
    #pet_skills_upgradingCfg {
    skill_id = 40250,
    level = 6,
    item_cost = [13000,5],
    star_limit = 0,
    reborn_limit = 3,
    level_limit = 50,
    des = "对前方单个敌人造成2次伤害，每次造成490%攻击的伤害",
    fightForce = 2500
    };
getRow(40251,1)->
    #pet_skills_upgradingCfg {
    skill_id = 40251,
    level = 1,
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "以自身为中心攻击10米范围内敌方，总共造成168%攻击的伤害",
    fightForce = 0
    };
getRow(40251,2)->
    #pet_skills_upgradingCfg {
    skill_id = 40251,
    level = 2,
    item_cost = [13000,1],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "以自身为中心攻击10米范围内敌方，总共造成202%攻击的伤害",
    fightForce = 250
    };
getRow(40251,3)->
    #pet_skills_upgradingCfg {
    skill_id = 40251,
    level = 3,
    item_cost = [13000,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 20,
    des = "以自身为中心攻击10米范围内敌方，总共造成236%攻击的伤害",
    fightForce = 600
    };
getRow(40251,4)->
    #pet_skills_upgradingCfg {
    skill_id = 40251,
    level = 4,
    item_cost = [13000,3],
    star_limit = 0,
    reborn_limit = 1,
    level_limit = 30,
    des = "以自身为中心攻击10米范围内敌方，总共造成270%攻击的伤害",
    fightForce = 1100
    };
getRow(40251,5)->
    #pet_skills_upgradingCfg {
    skill_id = 40251,
    level = 5,
    item_cost = [13000,4],
    star_limit = 0,
    reborn_limit = 2,
    level_limit = 40,
    des = "以自身为中心攻击10米范围内敌方，总共造成304%攻击的伤害",
    fightForce = 1700
    };
getRow(40251,6)->
    #pet_skills_upgradingCfg {
    skill_id = 40251,
    level = 6,
    item_cost = [13000,5],
    star_limit = 0,
    reborn_limit = 3,
    level_limit = 50,
    des = "以自身为中心攻击10米范围内敌方，总共造成338%攻击的伤害",
    fightForce = 2500
    };
getRow(40260,1)->
    #pet_skills_upgradingCfg {
    skill_id = 40260,
    level = 1,
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "吃了咖啡豆后，国王先生兴奋地撒欢，攻击前方扇形180度15米敌方3次，每次造成183%攻击的伤害",
    fightForce = 0
    };
getRow(40260,2)->
    #pet_skills_upgradingCfg {
    skill_id = 40260,
    level = 2,
    item_cost = [13000,1],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "吃了咖啡豆后，国王先生兴奋地撒欢，攻击前方扇形180度15米敌方3次，每次造成220%攻击的伤害",
    fightForce = 250
    };
getRow(40260,3)->
    #pet_skills_upgradingCfg {
    skill_id = 40260,
    level = 3,
    item_cost = [13000,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 20,
    des = "吃了咖啡豆后，国王先生兴奋地撒欢，攻击前方扇形180度15米敌方3次，每次造成257%攻击的伤害",
    fightForce = 600
    };
getRow(40260,4)->
    #pet_skills_upgradingCfg {
    skill_id = 40260,
    level = 4,
    item_cost = [13000,3],
    star_limit = 0,
    reborn_limit = 1,
    level_limit = 30,
    des = "吃了咖啡豆后，国王先生兴奋地撒欢，攻击前方扇形180度15米敌方3次，每次造成294%攻击的伤害",
    fightForce = 1100
    };
getRow(40260,5)->
    #pet_skills_upgradingCfg {
    skill_id = 40260,
    level = 5,
    item_cost = [13000,4],
    star_limit = 0,
    reborn_limit = 2,
    level_limit = 40,
    des = "吃了咖啡豆后，国王先生兴奋地撒欢，攻击前方扇形180度15米敌方3次，每次造成331%攻击的伤害",
    fightForce = 1700
    };
getRow(40260,6)->
    #pet_skills_upgradingCfg {
    skill_id = 40260,
    level = 6,
    item_cost = [13000,5],
    star_limit = 0,
    reborn_limit = 3,
    level_limit = 50,
    des = "吃了咖啡豆后，国王先生兴奋地撒欢，攻击前方扇形180度15米敌方3次，每次造成368%攻击的伤害",
    fightForce = 2500
    };
getRow(40261,1)->
    #pet_skills_upgradingCfg {
    skill_id = 40261,
    level = 1,
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "吸引周围怪物的仇恨,自身防御力增加20%",
    fightForce = 0
    };
getRow(40261,2)->
    #pet_skills_upgradingCfg {
    skill_id = 40261,
    level = 2,
    item_cost = [13000,1],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "吸引周围怪物的仇恨,自身防御力增加24%",
    fightForce = 250
    };
getRow(40261,3)->
    #pet_skills_upgradingCfg {
    skill_id = 40261,
    level = 3,
    item_cost = [13000,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 20,
    des = "吸引周围怪物的仇恨,自身防御力增加28%",
    fightForce = 600
    };
getRow(40261,4)->
    #pet_skills_upgradingCfg {
    skill_id = 40261,
    level = 4,
    item_cost = [13000,3],
    star_limit = 0,
    reborn_limit = 1,
    level_limit = 30,
    des = "吸引周围怪物的仇恨,自身防御力增加32%",
    fightForce = 1100
    };
getRow(40261,5)->
    #pet_skills_upgradingCfg {
    skill_id = 40261,
    level = 5,
    item_cost = [13000,4],
    star_limit = 0,
    reborn_limit = 2,
    level_limit = 40,
    des = "吸引周围怪物的仇恨,自身防御力增加36%",
    fightForce = 1700
    };
getRow(40261,6)->
    #pet_skills_upgradingCfg {
    skill_id = 40261,
    level = 6,
    item_cost = [13000,5],
    star_limit = 0,
    reborn_limit = 3,
    level_limit = 50,
    des = "吸引周围怪物的仇恨,自身防御力增加40%",
    fightForce = 2500
    };
getRow(40270,1)->
    #pet_skills_upgradingCfg {
    skill_id = 40270,
    level = 1,
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "对前方单体造成2次打击，每次造成256%攻击的伤害",
    fightForce = 0
    };
getRow(40270,2)->
    #pet_skills_upgradingCfg {
    skill_id = 40270,
    level = 2,
    item_cost = [13000,1],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "对前方单体造成2次打击，每次造成304%攻击的伤害",
    fightForce = 250
    };
getRow(40270,3)->
    #pet_skills_upgradingCfg {
    skill_id = 40270,
    level = 3,
    item_cost = [13000,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 20,
    des = "对前方单体造成2次打击，每次造成352%攻击的伤害",
    fightForce = 600
    };
getRow(40270,4)->
    #pet_skills_upgradingCfg {
    skill_id = 40270,
    level = 4,
    item_cost = [13000,3],
    star_limit = 0,
    reborn_limit = 1,
    level_limit = 30,
    des = "对前方单体造成2次打击，每次造成400%攻击的伤害",
    fightForce = 1100
    };
getRow(40270,5)->
    #pet_skills_upgradingCfg {
    skill_id = 40270,
    level = 5,
    item_cost = [13000,4],
    star_limit = 0,
    reborn_limit = 2,
    level_limit = 40,
    des = "对前方单体造成2次打击，每次造成448%攻击的伤害",
    fightForce = 1700
    };
getRow(40270,6)->
    #pet_skills_upgradingCfg {
    skill_id = 40270,
    level = 6,
    item_cost = [13000,5],
    star_limit = 0,
    reborn_limit = 3,
    level_limit = 50,
    des = "对前方单体造成2次打击，每次造成496%攻击的伤害",
    fightForce = 2500
    };
getRow(40271,1)->
    #pet_skills_upgradingCfg {
    skill_id = 40271,
    level = 1,
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "为主人每秒恢复202%攻击的生命值，持续3秒",
    fightForce = 0
    };
getRow(40271,2)->
    #pet_skills_upgradingCfg {
    skill_id = 40271,
    level = 2,
    item_cost = [13000,1],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "为主人每秒恢复242%攻击的生命值，持续3秒",
    fightForce = 250
    };
getRow(40271,3)->
    #pet_skills_upgradingCfg {
    skill_id = 40271,
    level = 3,
    item_cost = [13000,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 20,
    des = "为主人每秒恢复282%攻击的生命值，持续3秒",
    fightForce = 600
    };
getRow(40271,4)->
    #pet_skills_upgradingCfg {
    skill_id = 40271,
    level = 4,
    item_cost = [13000,3],
    star_limit = 0,
    reborn_limit = 1,
    level_limit = 30,
    des = "为主人每秒恢复322%攻击的生命值，持续3秒",
    fightForce = 1100
    };
getRow(40271,5)->
    #pet_skills_upgradingCfg {
    skill_id = 40271,
    level = 5,
    item_cost = [13000,4],
    star_limit = 0,
    reborn_limit = 2,
    level_limit = 40,
    des = "为主人每秒恢复362%攻击的生命值，持续3秒",
    fightForce = 1700
    };
getRow(40271,6)->
    #pet_skills_upgradingCfg {
    skill_id = 40271,
    level = 6,
    item_cost = [13000,5],
    star_limit = 0,
    reborn_limit = 3,
    level_limit = 50,
    des = "为主人每秒恢复402%攻击的生命值，持续3秒",
    fightForce = 2500
    };
getRow(40280,1)->
    #pet_skills_upgradingCfg {
    skill_id = 40280,
    level = 1,
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "攻击前方扇形目标，总共造成363%攻击的伤害",
    fightForce = 0
    };
getRow(40280,2)->
    #pet_skills_upgradingCfg {
    skill_id = 40280,
    level = 2,
    item_cost = [13000,1],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "攻击前方扇形目标，总共造成433%攻击的伤害",
    fightForce = 250
    };
getRow(40280,3)->
    #pet_skills_upgradingCfg {
    skill_id = 40280,
    level = 3,
    item_cost = [13000,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 20,
    des = "攻击前方扇形目标，总共造成503%攻击的伤害",
    fightForce = 600
    };
getRow(40280,4)->
    #pet_skills_upgradingCfg {
    skill_id = 40280,
    level = 4,
    item_cost = [13000,3],
    star_limit = 0,
    reborn_limit = 1,
    level_limit = 30,
    des = "攻击前方扇形目标，总共造成573%攻击的伤害",
    fightForce = 1100
    };
getRow(40280,5)->
    #pet_skills_upgradingCfg {
    skill_id = 40280,
    level = 5,
    item_cost = [13000,4],
    star_limit = 0,
    reborn_limit = 2,
    level_limit = 40,
    des = "攻击前方扇形目标，总共造成643%攻击的伤害",
    fightForce = 1700
    };
getRow(40280,6)->
    #pet_skills_upgradingCfg {
    skill_id = 40280,
    level = 6,
    item_cost = [13000,5],
    star_limit = 0,
    reborn_limit = 3,
    level_limit = 50,
    des = "攻击前方扇形目标，总共造成713%攻击的伤害",
    fightForce = 2500
    };
getRow(40281,1)->
    #pet_skills_upgradingCfg {
    skill_id = 40281,
    level = 1,
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "对四周散发爱心泡泡，总共造成588%攻击的伤害",
    fightForce = 0
    };
getRow(40281,2)->
    #pet_skills_upgradingCfg {
    skill_id = 40281,
    level = 2,
    item_cost = [13000,1],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "对四周散发爱心泡泡，总共造成707%攻击的伤害",
    fightForce = 250
    };
getRow(40281,3)->
    #pet_skills_upgradingCfg {
    skill_id = 40281,
    level = 3,
    item_cost = [13000,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 20,
    des = "对四周散发爱心泡泡，总共造成826%攻击的伤害",
    fightForce = 600
    };
getRow(40281,4)->
    #pet_skills_upgradingCfg {
    skill_id = 40281,
    level = 4,
    item_cost = [13000,3],
    star_limit = 0,
    reborn_limit = 1,
    level_limit = 30,
    des = "对四周散发爱心泡泡，总共造成945%攻击的伤害",
    fightForce = 1100
    };
getRow(40281,5)->
    #pet_skills_upgradingCfg {
    skill_id = 40281,
    level = 5,
    item_cost = [13000,4],
    star_limit = 0,
    reborn_limit = 2,
    level_limit = 40,
    des = "对四周散发爱心泡泡，总共造成1064%攻击的伤害",
    fightForce = 1700
    };
getRow(40281,6)->
    #pet_skills_upgradingCfg {
    skill_id = 40281,
    level = 6,
    item_cost = [13000,5],
    star_limit = 0,
    reborn_limit = 3,
    level_limit = 50,
    des = "对四周散发爱心泡泡，总共造成1183%攻击的伤害",
    fightForce = 2500
    };
getRow(40290,1)->
    #pet_skills_upgradingCfg {
    skill_id = 40290,
    level = 1,
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "攻击前方矩形目标，总共造成549%攻击的伤害，并击飞",
    fightForce = 0
    };
getRow(40290,2)->
    #pet_skills_upgradingCfg {
    skill_id = 40290,
    level = 2,
    item_cost = [13000,1],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "攻击前方矩形目标，总共造成659%攻击的伤害，并击飞",
    fightForce = 250
    };
getRow(40290,3)->
    #pet_skills_upgradingCfg {
    skill_id = 40290,
    level = 3,
    item_cost = [13000,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 20,
    des = "攻击前方矩形目标，总共造成769%攻击的伤害，并击飞",
    fightForce = 600
    };
getRow(40290,4)->
    #pet_skills_upgradingCfg {
    skill_id = 40290,
    level = 4,
    item_cost = [13000,3],
    star_limit = 0,
    reborn_limit = 1,
    level_limit = 30,
    des = "攻击前方矩形目标，总共造成879%攻击的伤害，并击飞",
    fightForce = 1100
    };
getRow(40290,5)->
    #pet_skills_upgradingCfg {
    skill_id = 40290,
    level = 5,
    item_cost = [13000,4],
    star_limit = 0,
    reborn_limit = 2,
    level_limit = 40,
    des = "攻击前方矩形目标，总共造成989%攻击的伤害，并击飞",
    fightForce = 1700
    };
getRow(40290,6)->
    #pet_skills_upgradingCfg {
    skill_id = 40290,
    level = 6,
    item_cost = [13000,5],
    star_limit = 0,
    reborn_limit = 3,
    level_limit = 50,
    des = "攻击前方矩形目标，总共造成1099%攻击的伤害，并击飞",
    fightForce = 2500
    };
getRow(40291,1)->
    #pet_skills_upgradingCfg {
    skill_id = 40291,
    level = 1,
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "攻击30米范围内的敌人及其周围，总共造成588%攻击的伤害",
    fightForce = 0
    };
getRow(40291,2)->
    #pet_skills_upgradingCfg {
    skill_id = 40291,
    level = 2,
    item_cost = [13000,1],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "攻击30米范围内的敌人及其周围，总共造成707%攻击的伤害",
    fightForce = 250
    };
getRow(40291,3)->
    #pet_skills_upgradingCfg {
    skill_id = 40291,
    level = 3,
    item_cost = [13000,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 20,
    des = "攻击30米范围内的敌人及其周围，总共造成826%攻击的伤害",
    fightForce = 600
    };
getRow(40291,4)->
    #pet_skills_upgradingCfg {
    skill_id = 40291,
    level = 4,
    item_cost = [13000,3],
    star_limit = 0,
    reborn_limit = 1,
    level_limit = 30,
    des = "攻击30米范围内的敌人及其周围，总共造成945%攻击的伤害",
    fightForce = 1100
    };
getRow(40291,5)->
    #pet_skills_upgradingCfg {
    skill_id = 40291,
    level = 5,
    item_cost = [13000,4],
    star_limit = 0,
    reborn_limit = 2,
    level_limit = 40,
    des = "攻击30米范围内的敌人及其周围，总共造成1064%攻击的伤害",
    fightForce = 1700
    };
getRow(40291,6)->
    #pet_skills_upgradingCfg {
    skill_id = 40291,
    level = 6,
    item_cost = [13000,5],
    star_limit = 0,
    reborn_limit = 3,
    level_limit = 50,
    des = "攻击30米范围内的敌人及其周围，总共造成1183%攻击的伤害",
    fightForce = 2500
    };
getRow(40300,1)->
    #pet_skills_upgradingCfg {
    skill_id = 40300,
    level = 1,
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "攻击前方矩形目标，总共造成549%攻击的伤害，并击飞",
    fightForce = 0
    };
getRow(40300,2)->
    #pet_skills_upgradingCfg {
    skill_id = 40300,
    level = 2,
    item_cost = [13000,1],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "攻击前方矩形目标，总共造成659%攻击的伤害，并击飞",
    fightForce = 250
    };
getRow(40300,3)->
    #pet_skills_upgradingCfg {
    skill_id = 40300,
    level = 3,
    item_cost = [13000,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 20,
    des = "攻击前方矩形目标，总共造成769%攻击的伤害，并击飞",
    fightForce = 600
    };
getRow(40300,4)->
    #pet_skills_upgradingCfg {
    skill_id = 40300,
    level = 4,
    item_cost = [13000,3],
    star_limit = 0,
    reborn_limit = 1,
    level_limit = 30,
    des = "攻击前方矩形目标，总共造成879%攻击的伤害，并击飞",
    fightForce = 1100
    };
getRow(40300,5)->
    #pet_skills_upgradingCfg {
    skill_id = 40300,
    level = 5,
    item_cost = [13000,4],
    star_limit = 0,
    reborn_limit = 2,
    level_limit = 40,
    des = "攻击前方矩形目标，总共造成989%攻击的伤害，并击飞",
    fightForce = 1700
    };
getRow(40300,6)->
    #pet_skills_upgradingCfg {
    skill_id = 40300,
    level = 6,
    item_cost = [13000,5],
    star_limit = 0,
    reborn_limit = 3,
    level_limit = 50,
    des = "攻击前方矩形目标，总共造成1099%攻击的伤害，并击飞",
    fightForce = 2500
    };
getRow(40301,1)->
    #pet_skills_upgradingCfg {
    skill_id = 40301,
    level = 1,
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "攻击30米范围内的敌人及其周围五米，总共造成588%攻击的伤害",
    fightForce = 0
    };
getRow(40301,2)->
    #pet_skills_upgradingCfg {
    skill_id = 40301,
    level = 2,
    item_cost = [13000,1],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "攻击30米范围内的敌人及其周围五米，总共造成707%攻击的伤害",
    fightForce = 250
    };
getRow(40301,3)->
    #pet_skills_upgradingCfg {
    skill_id = 40301,
    level = 3,
    item_cost = [13000,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 20,
    des = "攻击30米范围内的敌人及其周围五米，总共造成826%攻击的伤害",
    fightForce = 600
    };
getRow(40301,4)->
    #pet_skills_upgradingCfg {
    skill_id = 40301,
    level = 4,
    item_cost = [13000,3],
    star_limit = 0,
    reborn_limit = 1,
    level_limit = 30,
    des = "攻击30米范围内的敌人及其周围五米，总共造成945%攻击的伤害",
    fightForce = 1100
    };
getRow(40301,5)->
    #pet_skills_upgradingCfg {
    skill_id = 40301,
    level = 5,
    item_cost = [13000,4],
    star_limit = 0,
    reborn_limit = 2,
    level_limit = 40,
    des = "攻击30米范围内的敌人及其周围五米，总共造成1064%攻击的伤害",
    fightForce = 1700
    };
getRow(40301,6)->
    #pet_skills_upgradingCfg {
    skill_id = 40301,
    level = 6,
    item_cost = [13000,5],
    star_limit = 0,
    reborn_limit = 3,
    level_limit = 50,
    des = "攻击30米范围内的敌人及其周围五米，总共造成1183%攻击的伤害",
    fightForce = 2500
    };
getRow(40310,1)->
    #pet_skills_upgradingCfg {
    skill_id = 40310,
    level = 1,
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "飞空艇用力向前撞击15米，总共造成213%攻击的伤害",
    fightForce = 0
    };
getRow(40310,2)->
    #pet_skills_upgradingCfg {
    skill_id = 40310,
    level = 2,
    item_cost = [13001,1],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "飞空艇用力向前撞击15米，总共造成253%攻击的伤害",
    fightForce = 500
    };
getRow(40310,3)->
    #pet_skills_upgradingCfg {
    skill_id = 40310,
    level = 3,
    item_cost = [13001,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 20,
    des = "飞空艇用力向前撞击15米，总共造成293%攻击的伤害",
    fightForce = 1250
    };
getRow(40310,4)->
    #pet_skills_upgradingCfg {
    skill_id = 40310,
    level = 4,
    item_cost = [13001,3],
    star_limit = 0,
    reborn_limit = 1,
    level_limit = 30,
    des = "飞空艇用力向前撞击15米，总共造成333%攻击的伤害",
    fightForce = 2250
    };
getRow(40310,5)->
    #pet_skills_upgradingCfg {
    skill_id = 40310,
    level = 5,
    item_cost = [13001,4],
    star_limit = 0,
    reborn_limit = 2,
    level_limit = 40,
    des = "飞空艇用力向前撞击15米，总共造成373%攻击的伤害",
    fightForce = 3500
    };
getRow(40310,6)->
    #pet_skills_upgradingCfg {
    skill_id = 40310,
    level = 6,
    item_cost = [13001,5],
    star_limit = 0,
    reborn_limit = 3,
    level_limit = 50,
    des = "飞空艇用力向前撞击15米，总共造成413%攻击的伤害",
    fightForce = 5000
    };
getRow(40311,1)->
    #pet_skills_upgradingCfg {
    skill_id = 40311,
    level = 1,
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "飞空艇带动部分气流，对前方扇形敌人造成151%攻击的伤害，且有概率造成眩晕2秒",
    fightForce = 0
    };
getRow(40311,2)->
    #pet_skills_upgradingCfg {
    skill_id = 40311,
    level = 2,
    item_cost = [13001,1],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "飞空艇带动部分气流，对前方扇形敌人造成180%攻击的伤害，且有概率造成眩晕2秒",
    fightForce = 500
    };
getRow(40311,3)->
    #pet_skills_upgradingCfg {
    skill_id = 40311,
    level = 3,
    item_cost = [13001,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 20,
    des = "飞空艇带动部分气流，对前方扇形敌人造成209%攻击的伤害，且有概率造成眩晕2秒",
    fightForce = 1250
    };
getRow(40311,4)->
    #pet_skills_upgradingCfg {
    skill_id = 40311,
    level = 4,
    item_cost = [13001,3],
    star_limit = 0,
    reborn_limit = 1,
    level_limit = 30,
    des = "飞空艇带动部分气流，对前方扇形敌人造成238%攻击的伤害，且有概率造成眩晕2秒",
    fightForce = 2250
    };
getRow(40311,5)->
    #pet_skills_upgradingCfg {
    skill_id = 40311,
    level = 5,
    item_cost = [13001,4],
    star_limit = 0,
    reborn_limit = 2,
    level_limit = 40,
    des = "飞空艇带动部分气流，对前方扇形敌人造成267%攻击的伤害，且有概率造成眩晕2秒",
    fightForce = 3500
    };
getRow(40311,6)->
    #pet_skills_upgradingCfg {
    skill_id = 40311,
    level = 6,
    item_cost = [13001,5],
    star_limit = 0,
    reborn_limit = 3,
    level_limit = 50,
    des = "飞空艇带动部分气流，对前方扇形敌人造成296%攻击的伤害，且有概率造成眩晕2秒",
    fightForce = 5000
    };
getRow(40320,1)->
    #pet_skills_upgradingCfg {
    skill_id = 40320,
    level = 1,
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "攻击前方单体敌人，造成173%攻击的伤害",
    fightForce = 0
    };
getRow(40320,2)->
    #pet_skills_upgradingCfg {
    skill_id = 40320,
    level = 2,
    item_cost = [13001,1],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "攻击前方单体敌人，造成223%攻击的伤害",
    fightForce = 500
    };
getRow(40320,3)->
    #pet_skills_upgradingCfg {
    skill_id = 40320,
    level = 3,
    item_cost = [13001,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 20,
    des = "攻击前方单体敌人，造成273%攻击的伤害",
    fightForce = 1250
    };
getRow(40320,4)->
    #pet_skills_upgradingCfg {
    skill_id = 40320,
    level = 4,
    item_cost = [13001,3],
    star_limit = 0,
    reborn_limit = 1,
    level_limit = 30,
    des = "攻击前方单体敌人，造成323%攻击的伤害",
    fightForce = 2250
    };
getRow(40320,5)->
    #pet_skills_upgradingCfg {
    skill_id = 40320,
    level = 5,
    item_cost = [13001,4],
    star_limit = 0,
    reborn_limit = 2,
    level_limit = 40,
    des = "攻击前方单体敌人，造成373%攻击的伤害",
    fightForce = 3500
    };
getRow(40320,6)->
    #pet_skills_upgradingCfg {
    skill_id = 40320,
    level = 6,
    item_cost = [13001,5],
    star_limit = 0,
    reborn_limit = 3,
    level_limit = 50,
    des = "攻击前方单体敌人，造成423%攻击的伤害",
    fightForce = 5000
    };
getRow(40321,1)->
    #pet_skills_upgradingCfg {
    skill_id = 40321,
    level = 1,
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "攻击前方单体敌人，造成600%攻击的伤害并击退",
    fightForce = 0
    };
getRow(40321,2)->
    #pet_skills_upgradingCfg {
    skill_id = 40321,
    level = 2,
    item_cost = [13001,1],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "攻击前方单体敌人，造成780%攻击的伤害并击退",
    fightForce = 500
    };
getRow(40321,3)->
    #pet_skills_upgradingCfg {
    skill_id = 40321,
    level = 3,
    item_cost = [13001,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 20,
    des = "攻击前方单体敌人，造成960%攻击的伤害并击退",
    fightForce = 1250
    };
getRow(40321,4)->
    #pet_skills_upgradingCfg {
    skill_id = 40321,
    level = 4,
    item_cost = [13001,3],
    star_limit = 0,
    reborn_limit = 1,
    level_limit = 30,
    des = "攻击前方单体敌人，造成1140%攻击的伤害并击退",
    fightForce = 2250
    };
getRow(40321,5)->
    #pet_skills_upgradingCfg {
    skill_id = 40321,
    level = 5,
    item_cost = [13001,4],
    star_limit = 0,
    reborn_limit = 2,
    level_limit = 40,
    des = "攻击前方单体敌人，造成1320%攻击的伤害并击退",
    fightForce = 3500
    };
getRow(40321,6)->
    #pet_skills_upgradingCfg {
    skill_id = 40321,
    level = 6,
    item_cost = [13001,5],
    star_limit = 0,
    reborn_limit = 3,
    level_limit = 50,
    des = "攻击前方单体敌人，造成1500%攻击的伤害并击退",
    fightForce = 5000
    };
getRow(40322,1)->
    #pet_skills_upgradingCfg {
    skill_id = 40322,
    level = 1,
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "对前方扇形范围内敌人进行3次攻击，每次造成96%攻击的伤害，受击目标有概率被眩晕2秒",
    fightForce = 0
    };
getRow(40322,2)->
    #pet_skills_upgradingCfg {
    skill_id = 40322,
    level = 2,
    item_cost = [13001,1],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "对前方扇形范围内敌人进行3次攻击，每次造成124%攻击的伤害，受击目标有概率被眩晕2秒",
    fightForce = 500
    };
getRow(40322,3)->
    #pet_skills_upgradingCfg {
    skill_id = 40322,
    level = 3,
    item_cost = [13001,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 20,
    des = "对前方扇形范围内敌人进行3次攻击，每次造成152%攻击的伤害，受击目标有概率被眩晕2秒",
    fightForce = 1250
    };
getRow(40322,4)->
    #pet_skills_upgradingCfg {
    skill_id = 40322,
    level = 4,
    item_cost = [13001,3],
    star_limit = 0,
    reborn_limit = 1,
    level_limit = 30,
    des = "对前方扇形范围内敌人进行3次攻击，每次造成180%攻击的伤害，受击目标有概率被眩晕2秒",
    fightForce = 2250
    };
getRow(40322,5)->
    #pet_skills_upgradingCfg {
    skill_id = 40322,
    level = 5,
    item_cost = [13001,4],
    star_limit = 0,
    reborn_limit = 2,
    level_limit = 40,
    des = "对前方扇形范围内敌人进行3次攻击，每次造成208%攻击的伤害，受击目标有概率被眩晕2秒",
    fightForce = 3500
    };
getRow(40322,6)->
    #pet_skills_upgradingCfg {
    skill_id = 40322,
    level = 6,
    item_cost = [13001,5],
    star_limit = 0,
    reborn_limit = 3,
    level_limit = 50,
    des = "对前方扇形范围内敌人进行3次攻击，每次造成236%攻击的伤害，受击目标有概率被眩晕2秒",
    fightForce = 5000
    };
getRow(40330,1)->
    #pet_skills_upgradingCfg {
    skill_id = 40330,
    level = 1,
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "猛抓前方单体敌人，造成96%攻击的伤害",
    fightForce = 0
    };
getRow(40330,2)->
    #pet_skills_upgradingCfg {
    skill_id = 40330,
    level = 2,
    item_cost = [13000,1],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 20,
    des = "猛抓前方单体敌人，造成118%攻击的伤害",
    fightForce = 250
    };
getRow(40330,3)->
    #pet_skills_upgradingCfg {
    skill_id = 40330,
    level = 3,
    item_cost = [13000,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 30,
    des = "猛抓前方单体敌人，造成140%攻击的伤害",
    fightForce = 600
    };
getRow(40330,4)->
    #pet_skills_upgradingCfg {
    skill_id = 40330,
    level = 4,
    item_cost = [13000,3],
    star_limit = 0,
    reborn_limit = 1,
    level_limit = 40,
    des = "猛抓前方单体敌人，造成162%攻击的伤害",
    fightForce = 1100
    };
getRow(40330,5)->
    #pet_skills_upgradingCfg {
    skill_id = 40330,
    level = 5,
    item_cost = [13000,4],
    star_limit = 0,
    reborn_limit = 2,
    level_limit = 50,
    des = "猛抓前方单体敌人，造成184%攻击的伤害",
    fightForce = 1700
    };
getRow(40330,6)->
    #pet_skills_upgradingCfg {
    skill_id = 40330,
    level = 6,
    item_cost = [13000,5],
    star_limit = 0,
    reborn_limit = 3,
    level_limit = 60,
    des = "猛抓前方单体敌人，造成206%攻击的伤害",
    fightForce = 2500
    };
getRow(40331,1)->
    #pet_skills_upgradingCfg {
    skill_id = 40331,
    level = 1,
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "驯兽花豹发出振奋人心的嘶鸣，提升主人3%的攻击",
    fightForce = 0
    };
getRow(40331,2)->
    #pet_skills_upgradingCfg {
    skill_id = 40331,
    level = 2,
    item_cost = [13000,1],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 20,
    des = "驯兽花豹发出振奋人心的嘶鸣，提升主人3.6%的攻击",
    fightForce = 250
    };
getRow(40331,3)->
    #pet_skills_upgradingCfg {
    skill_id = 40331,
    level = 3,
    item_cost = [13000,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 30,
    des = "驯兽花豹发出振奋人心的嘶鸣，提升主人4.2%的攻击",
    fightForce = 600
    };
getRow(40331,4)->
    #pet_skills_upgradingCfg {
    skill_id = 40331,
    level = 4,
    item_cost = [13000,3],
    star_limit = 0,
    reborn_limit = 1,
    level_limit = 40,
    des = "驯兽花豹发出振奋人心的嘶鸣，提升主人4.8%的攻击",
    fightForce = 1100
    };
getRow(40331,5)->
    #pet_skills_upgradingCfg {
    skill_id = 40331,
    level = 5,
    item_cost = [13000,4],
    star_limit = 0,
    reborn_limit = 2,
    level_limit = 50,
    des = "驯兽花豹发出振奋人心的嘶鸣，提升主人5.4%的攻击",
    fightForce = 1700
    };
getRow(40331,6)->
    #pet_skills_upgradingCfg {
    skill_id = 40331,
    level = 6,
    item_cost = [13000,5],
    star_limit = 0,
    reborn_limit = 3,
    level_limit = 60,
    des = "驯兽花豹发出振奋人心的嘶鸣，提升主人6%的攻击",
    fightForce = 2500
    };
getRow(40340,1)->
    #pet_skills_upgradingCfg {
    skill_id = 40340,
    level = 1,
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "首领土狼用头部撞击敌人，造成211%攻击的伤害",
    fightForce = 0
    };
getRow(40340,2)->
    #pet_skills_upgradingCfg {
    skill_id = 40340,
    level = 2,
    item_cost = [13000,1],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "首领土狼用头部撞击敌人，造成259%攻击的伤害",
    fightForce = 250
    };
getRow(40340,3)->
    #pet_skills_upgradingCfg {
    skill_id = 40340,
    level = 3,
    item_cost = [13000,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 20,
    des = "首领土狼用头部撞击敌人，造成307%攻击的伤害",
    fightForce = 600
    };
getRow(40340,4)->
    #pet_skills_upgradingCfg {
    skill_id = 40340,
    level = 4,
    item_cost = [13000,3],
    star_limit = 0,
    reborn_limit = 1,
    level_limit = 30,
    des = "首领土狼用头部撞击敌人，造成355%攻击的伤害",
    fightForce = 1100
    };
getRow(40340,5)->
    #pet_skills_upgradingCfg {
    skill_id = 40340,
    level = 5,
    item_cost = [13000,4],
    star_limit = 0,
    reborn_limit = 2,
    level_limit = 40,
    des = "首领土狼用头部撞击敌人，造成403%攻击的伤害",
    fightForce = 1700
    };
getRow(40340,6)->
    #pet_skills_upgradingCfg {
    skill_id = 40340,
    level = 6,
    item_cost = [13000,5],
    star_limit = 0,
    reborn_limit = 3,
    level_limit = 50,
    des = "首领土狼用头部撞击敌人，造成451%攻击的伤害",
    fightForce = 2500
    };
getRow(40341,1)->
    #pet_skills_upgradingCfg {
    skill_id = 40341,
    level = 1,
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "朝前方扇形区域连续发起3次爪机，每次造成96%攻击的伤害",
    fightForce = 0
    };
getRow(40341,2)->
    #pet_skills_upgradingCfg {
    skill_id = 40341,
    level = 2,
    item_cost = [13000,1],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "朝前方扇形区域连续发起3次爪机，每次造成116%攻击的伤害",
    fightForce = 250
    };
getRow(40341,3)->
    #pet_skills_upgradingCfg {
    skill_id = 40341,
    level = 3,
    item_cost = [13000,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 20,
    des = "朝前方扇形区域连续发起3次爪机，每次造成136%攻击的伤害",
    fightForce = 600
    };
getRow(40341,4)->
    #pet_skills_upgradingCfg {
    skill_id = 40341,
    level = 4,
    item_cost = [13000,3],
    star_limit = 0,
    reborn_limit = 1,
    level_limit = 30,
    des = "朝前方扇形区域连续发起3次爪机，每次造成156%攻击的伤害",
    fightForce = 1100
    };
getRow(40341,5)->
    #pet_skills_upgradingCfg {
    skill_id = 40341,
    level = 5,
    item_cost = [13000,4],
    star_limit = 0,
    reborn_limit = 2,
    level_limit = 40,
    des = "朝前方扇形区域连续发起3次爪机，每次造成176%攻击的伤害",
    fightForce = 1700
    };
getRow(40341,6)->
    #pet_skills_upgradingCfg {
    skill_id = 40341,
    level = 6,
    item_cost = [13000,5],
    star_limit = 0,
    reborn_limit = 3,
    level_limit = 50,
    des = "朝前方扇形区域连续发起3次爪机，每次造成196%攻击的伤害",
    fightForce = 2500
    };
getRow(40350,1)->
    #pet_skills_upgradingCfg {
    skill_id = 40350,
    level = 1,
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "冲到敌人面前 攻击地方单体，造成70%攻击的伤害，受击目标有概率击晕1秒",
    fightForce = 0
    };
getRow(40350,2)->
    #pet_skills_upgradingCfg {
    skill_id = 40350,
    level = 2,
    item_cost = [13001,1],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "冲到敌人面前 攻击地方单体，造成90%攻击的伤害，受击目标有概率击晕1秒",
    fightForce = 500
    };
getRow(40350,3)->
    #pet_skills_upgradingCfg {
    skill_id = 40350,
    level = 3,
    item_cost = [13001,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 20,
    des = "冲到敌人面前 攻击地方单体，造成110%攻击的伤害，受击目标有概率击晕1秒",
    fightForce = 1250
    };
getRow(40350,4)->
    #pet_skills_upgradingCfg {
    skill_id = 40350,
    level = 4,
    item_cost = [13001,3],
    star_limit = 0,
    reborn_limit = 1,
    level_limit = 30,
    des = "冲到敌人面前 攻击地方单体，造成130%攻击的伤害，受击目标有概率击晕1秒",
    fightForce = 2250
    };
getRow(40350,5)->
    #pet_skills_upgradingCfg {
    skill_id = 40350,
    level = 5,
    item_cost = [13001,4],
    star_limit = 0,
    reborn_limit = 2,
    level_limit = 40,
    des = "冲到敌人面前 攻击地方单体，造成150%攻击的伤害，受击目标有概率击晕1秒",
    fightForce = 3500
    };
getRow(40350,6)->
    #pet_skills_upgradingCfg {
    skill_id = 40350,
    level = 6,
    item_cost = [13001,5],
    star_limit = 0,
    reborn_limit = 3,
    level_limit = 50,
    des = "冲到敌人面前 攻击地方单体，造成170%攻击的伤害，受击目标有概率击晕1秒",
    fightForce = 5000
    };
getRow(40351,1)->
    #pet_skills_upgradingCfg {
    skill_id = 40351,
    level = 1,
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "变成一个锤子的形状 砸向地面造成前方扇形区域187%攻击的伤害，受击目标有概率击晕2秒",
    fightForce = 0
    };
getRow(40351,2)->
    #pet_skills_upgradingCfg {
    skill_id = 40351,
    level = 2,
    item_cost = [13001,1],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "变成一个锤子的形状 砸向地面造成前方扇形区域245%攻击的伤害，受击目标有概率击晕2秒",
    fightForce = 500
    };
getRow(40351,3)->
    #pet_skills_upgradingCfg {
    skill_id = 40351,
    level = 3,
    item_cost = [13001,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 20,
    des = "变成一个锤子的形状 砸向地面造成前方扇形区域303%攻击的伤害，受击目标有概率击晕2秒",
    fightForce = 1250
    };
getRow(40351,4)->
    #pet_skills_upgradingCfg {
    skill_id = 40351,
    level = 4,
    item_cost = [13001,3],
    star_limit = 0,
    reborn_limit = 1,
    level_limit = 30,
    des = "变成一个锤子的形状 砸向地面造成前方扇形区域361%攻击的伤害，受击目标有概率击晕2秒",
    fightForce = 2250
    };
getRow(40351,5)->
    #pet_skills_upgradingCfg {
    skill_id = 40351,
    level = 5,
    item_cost = [13001,4],
    star_limit = 0,
    reborn_limit = 2,
    level_limit = 40,
    des = "变成一个锤子的形状 砸向地面造成前方扇形区域419%攻击的伤害，受击目标有概率击晕2秒",
    fightForce = 3500
    };
getRow(40351,6)->
    #pet_skills_upgradingCfg {
    skill_id = 40351,
    level = 6,
    item_cost = [13001,5],
    star_limit = 0,
    reborn_limit = 3,
    level_limit = 50,
    des = "变成一个锤子的形状 砸向地面造成前方扇形区域477%攻击的伤害，受击目标有概率击晕2秒",
    fightForce = 5000
    };
getRow(40352,1)->
    #pet_skills_upgradingCfg {
    skill_id = 40352,
    level = 1,
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "对敌人及其周围目标进行降雨打击，攻击5次，每次造成37%攻击的伤害",
    fightForce = 0
    };
getRow(40352,2)->
    #pet_skills_upgradingCfg {
    skill_id = 40352,
    level = 2,
    item_cost = [13001,1],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "对敌人及其周围目标进行降雨打击，攻击5次，每次造成48%攻击的伤害",
    fightForce = 500
    };
getRow(40352,3)->
    #pet_skills_upgradingCfg {
    skill_id = 40352,
    level = 3,
    item_cost = [13001,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 20,
    des = "对敌人及其周围目标进行降雨打击，攻击5次，每次造成59%攻击的伤害",
    fightForce = 1250
    };
getRow(40352,4)->
    #pet_skills_upgradingCfg {
    skill_id = 40352,
    level = 4,
    item_cost = [13001,3],
    star_limit = 0,
    reborn_limit = 1,
    level_limit = 30,
    des = "对敌人及其周围目标进行降雨打击，攻击5次，每次造成70%攻击的伤害",
    fightForce = 2250
    };
getRow(40352,5)->
    #pet_skills_upgradingCfg {
    skill_id = 40352,
    level = 5,
    item_cost = [13001,4],
    star_limit = 0,
    reborn_limit = 2,
    level_limit = 40,
    des = "对敌人及其周围目标进行降雨打击，攻击5次，每次造成81%攻击的伤害",
    fightForce = 3500
    };
getRow(40352,6)->
    #pet_skills_upgradingCfg {
    skill_id = 40352,
    level = 6,
    item_cost = [13001,5],
    star_limit = 0,
    reborn_limit = 3,
    level_limit = 50,
    des = "对敌人及其周围目标进行降雨打击，攻击5次，每次造成92%攻击的伤害",
    fightForce = 5000
    };
getRow(40360,1)->
    #pet_skills_upgradingCfg {
    skill_id = 40360,
    level = 1,
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "攻击前方扇形敌人，造成216%攻击的伤害，并降低主目标3%攻击",
    fightForce = 0
    };
getRow(40360,2)->
    #pet_skills_upgradingCfg {
    skill_id = 40360,
    level = 2,
    item_cost = [13001,1],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "攻击前方扇形敌人，造成283%攻击的伤害，并降低主目标3.6%攻击",
    fightForce = 500
    };
getRow(40360,3)->
    #pet_skills_upgradingCfg {
    skill_id = 40360,
    level = 3,
    item_cost = [13001,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 20,
    des = "攻击前方扇形敌人，造成350%攻击的伤害，并降低主目标4.2%攻击",
    fightForce = 1250
    };
getRow(40360,4)->
    #pet_skills_upgradingCfg {
    skill_id = 40360,
    level = 4,
    item_cost = [13001,3],
    star_limit = 0,
    reborn_limit = 1,
    level_limit = 30,
    des = "攻击前方扇形敌人，造成417%攻击的伤害，并降低主目标4.8%攻击",
    fightForce = 2250
    };
getRow(40360,5)->
    #pet_skills_upgradingCfg {
    skill_id = 40360,
    level = 5,
    item_cost = [13001,4],
    star_limit = 0,
    reborn_limit = 2,
    level_limit = 40,
    des = "攻击前方扇形敌人，造成484%攻击的伤害，并降低主目标5.4%攻击",
    fightForce = 3500
    };
getRow(40360,6)->
    #pet_skills_upgradingCfg {
    skill_id = 40360,
    level = 6,
    item_cost = [13001,5],
    star_limit = 0,
    reborn_limit = 3,
    level_limit = 50,
    des = "攻击前方扇形敌人，造成551%攻击的伤害，并降低主目标6%攻击",
    fightForce = 5000
    };
getRow(40361,1)->
    #pet_skills_upgradingCfg {
    skill_id = 40361,
    level = 1,
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "主人免疫控制效果，持续3秒",
    fightForce = 0
    };
getRow(40361,2)->
    #pet_skills_upgradingCfg {
    skill_id = 40361,
    level = 2,
    item_cost = [13001,1],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "主人免疫控制效果，持续4秒",
    fightForce = 500
    };
getRow(40361,3)->
    #pet_skills_upgradingCfg {
    skill_id = 40361,
    level = 3,
    item_cost = [13001,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 20,
    des = "主人免疫控制效果，持续5秒",
    fightForce = 1250
    };
getRow(40361,4)->
    #pet_skills_upgradingCfg {
    skill_id = 40361,
    level = 4,
    item_cost = [13001,3],
    star_limit = 0,
    reborn_limit = 1,
    level_limit = 30,
    des = "主人免疫控制效果，持续6秒",
    fightForce = 2250
    };
getRow(40361,5)->
    #pet_skills_upgradingCfg {
    skill_id = 40361,
    level = 5,
    item_cost = [13001,4],
    star_limit = 0,
    reborn_limit = 2,
    level_limit = 40,
    des = "主人免疫控制效果，持续7秒",
    fightForce = 3500
    };
getRow(40361,6)->
    #pet_skills_upgradingCfg {
    skill_id = 40361,
    level = 6,
    item_cost = [13001,5],
    star_limit = 0,
    reborn_limit = 3,
    level_limit = 50,
    des = "主人免疫控制效果，持续8秒",
    fightForce = 5000
    };
getRow(40362,1)->
    #pet_skills_upgradingCfg {
    skill_id = 40362,
    level = 1,
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "攻击敌人及其周围目标，造成270%攻击的伤害，移动速度降低20%，防御降低20%",
    fightForce = 0
    };
getRow(40362,2)->
    #pet_skills_upgradingCfg {
    skill_id = 40362,
    level = 2,
    item_cost = [13001,1],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "攻击敌人及其周围目标，造成354%攻击的伤害，移动速度降低24%，防御降低24%",
    fightForce = 500
    };
getRow(40362,3)->
    #pet_skills_upgradingCfg {
    skill_id = 40362,
    level = 3,
    item_cost = [13001,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 20,
    des = "攻击敌人及其周围目标，造成438%攻击的伤害，移动速度降低28%，防御降低28%",
    fightForce = 1250
    };
getRow(40362,4)->
    #pet_skills_upgradingCfg {
    skill_id = 40362,
    level = 4,
    item_cost = [13001,3],
    star_limit = 0,
    reborn_limit = 1,
    level_limit = 30,
    des = "攻击敌人及其周围目标，造成522%攻击的伤害，移动速度降低32%，防御降低32%",
    fightForce = 2250
    };
getRow(40362,5)->
    #pet_skills_upgradingCfg {
    skill_id = 40362,
    level = 5,
    item_cost = [13001,4],
    star_limit = 0,
    reborn_limit = 2,
    level_limit = 40,
    des = "攻击敌人及其周围目标，造成606%攻击的伤害，移动速度降低36%，防御降低36%",
    fightForce = 3500
    };
getRow(40362,6)->
    #pet_skills_upgradingCfg {
    skill_id = 40362,
    level = 6,
    item_cost = [13001,5],
    star_limit = 0,
    reborn_limit = 3,
    level_limit = 50,
    des = "攻击敌人及其周围目标，造成690%攻击的伤害，移动速度降低40%，防御降低40%",
    fightForce = 5000
    };
getRow(40370,1)->
    #pet_skills_upgradingCfg {
    skill_id = 40370,
    level = 1,
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "攻击前方单体敌人，造成106%攻击的伤害",
    fightForce = 0
    };
getRow(40370,2)->
    #pet_skills_upgradingCfg {
    skill_id = 40370,
    level = 2,
    item_cost = [13001,1],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "攻击前方单体敌人，造成136%攻击的伤害",
    fightForce = 500
    };
getRow(40370,3)->
    #pet_skills_upgradingCfg {
    skill_id = 40370,
    level = 3,
    item_cost = [13001,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 20,
    des = "攻击前方单体敌人，造成166%攻击的伤害",
    fightForce = 1250
    };
getRow(40370,4)->
    #pet_skills_upgradingCfg {
    skill_id = 40370,
    level = 4,
    item_cost = [13001,3],
    star_limit = 0,
    reborn_limit = 1,
    level_limit = 30,
    des = "攻击前方单体敌人，造成196%攻击的伤害",
    fightForce = 2250
    };
getRow(40370,5)->
    #pet_skills_upgradingCfg {
    skill_id = 40370,
    level = 5,
    item_cost = [13001,4],
    star_limit = 0,
    reborn_limit = 2,
    level_limit = 40,
    des = "攻击前方单体敌人，造成226%攻击的伤害",
    fightForce = 3500
    };
getRow(40370,6)->
    #pet_skills_upgradingCfg {
    skill_id = 40370,
    level = 6,
    item_cost = [13001,5],
    star_limit = 0,
    reborn_limit = 3,
    level_limit = 50,
    des = "攻击前方单体敌人，造成256%攻击的伤害",
    fightForce = 5000
    };
getRow(40371,1)->
    #pet_skills_upgradingCfg {
    skill_id = 40371,
    level = 1,
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "秃鹫煽动翅膀吹起飓风对前方矩形范围敌人造成240%攻击的伤害并减速",
    fightForce = 0
    };
getRow(40371,2)->
    #pet_skills_upgradingCfg {
    skill_id = 40371,
    level = 2,
    item_cost = [13001,1],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "秃鹫煽动翅膀吹起飓风对前方矩形范围敌人造成310%攻击的伤害并减速",
    fightForce = 500
    };
getRow(40371,3)->
    #pet_skills_upgradingCfg {
    skill_id = 40371,
    level = 3,
    item_cost = [13001,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 20,
    des = "秃鹫煽动翅膀吹起飓风对前方矩形范围敌人造成380%攻击的伤害并减速",
    fightForce = 1250
    };
getRow(40371,4)->
    #pet_skills_upgradingCfg {
    skill_id = 40371,
    level = 4,
    item_cost = [13001,3],
    star_limit = 0,
    reborn_limit = 1,
    level_limit = 30,
    des = "秃鹫煽动翅膀吹起飓风对前方矩形范围敌人造成450%攻击的伤害并减速",
    fightForce = 2250
    };
getRow(40371,5)->
    #pet_skills_upgradingCfg {
    skill_id = 40371,
    level = 5,
    item_cost = [13001,4],
    star_limit = 0,
    reborn_limit = 2,
    level_limit = 40,
    des = "秃鹫煽动翅膀吹起飓风对前方矩形范围敌人造成520%攻击的伤害并减速",
    fightForce = 3500
    };
getRow(40371,6)->
    #pet_skills_upgradingCfg {
    skill_id = 40371,
    level = 6,
    item_cost = [13001,5],
    star_limit = 0,
    reborn_limit = 3,
    level_limit = 50,
    des = "秃鹫煽动翅膀吹起飓风对前方矩形范围敌人造成590%攻击的伤害并减速",
    fightForce = 5000
    };
getRow(40372,1)->
    #pet_skills_upgradingCfg {
    skill_id = 40372,
    level = 1,
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "秃鹫朝上方起飞小段后朝下俯冲，造成118%攻击的范围伤害，并沉默3秒",
    fightForce = 0
    };
getRow(40372,2)->
    #pet_skills_upgradingCfg {
    skill_id = 40372,
    level = 2,
    item_cost = [13001,1],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "秃鹫朝上方起飞小段后朝下俯冲，造成153%攻击的范围伤害，并沉默3秒",
    fightForce = 500
    };
getRow(40372,3)->
    #pet_skills_upgradingCfg {
    skill_id = 40372,
    level = 3,
    item_cost = [13001,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 20,
    des = "秃鹫朝上方起飞小段后朝下俯冲，造成188%攻击的范围伤害，并沉默3秒",
    fightForce = 1250
    };
getRow(40372,4)->
    #pet_skills_upgradingCfg {
    skill_id = 40372,
    level = 4,
    item_cost = [13001,3],
    star_limit = 0,
    reborn_limit = 1,
    level_limit = 30,
    des = "秃鹫朝上方起飞小段后朝下俯冲，造成223%攻击的范围伤害，并沉默3秒",
    fightForce = 2250
    };
getRow(40372,5)->
    #pet_skills_upgradingCfg {
    skill_id = 40372,
    level = 5,
    item_cost = [13001,4],
    star_limit = 0,
    reborn_limit = 2,
    level_limit = 40,
    des = "秃鹫朝上方起飞小段后朝下俯冲，造成258%攻击的范围伤害，并沉默3秒",
    fightForce = 3500
    };
getRow(40372,6)->
    #pet_skills_upgradingCfg {
    skill_id = 40372,
    level = 6,
    item_cost = [13001,5],
    star_limit = 0,
    reborn_limit = 3,
    level_limit = 50,
    des = "秃鹫朝上方起飞小段后朝下俯冲，造成293%攻击的范围伤害，并沉默3秒",
    fightForce = 5000
    };
getRow(40380,1)->
    #pet_skills_upgradingCfg {
    skill_id = 40380,
    level = 1,
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "攻击前方单体敌人，造成90%攻击的伤害",
    fightForce = 0
    };
getRow(40380,2)->
    #pet_skills_upgradingCfg {
    skill_id = 40380,
    level = 2,
    item_cost = [13002,1],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "攻击前方单体敌人，造成126%攻击的伤害",
    fightForce = 1000
    };
getRow(40380,3)->
    #pet_skills_upgradingCfg {
    skill_id = 40380,
    level = 3,
    item_cost = [13002,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 20,
    des = "攻击前方单体敌人，造成162%攻击的伤害",
    fightForce = 2500
    };
getRow(40380,4)->
    #pet_skills_upgradingCfg {
    skill_id = 40380,
    level = 4,
    item_cost = [13002,3],
    star_limit = 0,
    reborn_limit = 1,
    level_limit = 30,
    des = "攻击前方单体敌人，造成198%攻击的伤害",
    fightForce = 4500
    };
getRow(40380,5)->
    #pet_skills_upgradingCfg {
    skill_id = 40380,
    level = 5,
    item_cost = [13002,4],
    star_limit = 0,
    reborn_limit = 2,
    level_limit = 40,
    des = "攻击前方单体敌人，造成234%攻击的伤害",
    fightForce = 7000
    };
getRow(40380,6)->
    #pet_skills_upgradingCfg {
    skill_id = 40380,
    level = 6,
    item_cost = [13002,5],
    star_limit = 0,
    reborn_limit = 3,
    level_limit = 50,
    des = "攻击前方单体敌人，造成270%攻击的伤害",
    fightForce = 10000
    };
getRow(40381,1)->
    #pet_skills_upgradingCfg {
    skill_id = 40381,
    level = 1,
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "大幅度增加主人攻击力5%，持续5秒",
    fightForce = 0
    };
getRow(40381,2)->
    #pet_skills_upgradingCfg {
    skill_id = 40381,
    level = 2,
    item_cost = [13002,1],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "大幅度增加主人攻击力6%，持续5秒",
    fightForce = 1000
    };
getRow(40381,3)->
    #pet_skills_upgradingCfg {
    skill_id = 40381,
    level = 3,
    item_cost = [13002,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 20,
    des = "大幅度增加主人攻击力7%，持续5秒",
    fightForce = 2500
    };
getRow(40381,4)->
    #pet_skills_upgradingCfg {
    skill_id = 40381,
    level = 4,
    item_cost = [13002,3],
    star_limit = 0,
    reborn_limit = 1,
    level_limit = 30,
    des = "大幅度增加主人攻击力8%，持续5秒",
    fightForce = 4500
    };
getRow(40381,5)->
    #pet_skills_upgradingCfg {
    skill_id = 40381,
    level = 5,
    item_cost = [13002,4],
    star_limit = 0,
    reborn_limit = 2,
    level_limit = 40,
    des = "大幅度增加主人攻击力9%，持续5秒",
    fightForce = 7000
    };
getRow(40381,6)->
    #pet_skills_upgradingCfg {
    skill_id = 40381,
    level = 6,
    item_cost = [13002,5],
    star_limit = 0,
    reborn_limit = 3,
    level_limit = 50,
    des = "大幅度增加主人攻击力10%，持续5秒",
    fightForce = 10000
    };
getRow(40382,1)->
    #pet_skills_upgradingCfg {
    skill_id = 40382,
    level = 1,
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "攻击前方10米范围内敌方5次，每次造成86%攻击的伤害",
    fightForce = 0
    };
getRow(40382,2)->
    #pet_skills_upgradingCfg {
    skill_id = 40382,
    level = 2,
    item_cost = [13002,1],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "攻击前方10米范围内敌方5次，每次造成120%攻击的伤害",
    fightForce = 1000
    };
getRow(40382,3)->
    #pet_skills_upgradingCfg {
    skill_id = 40382,
    level = 3,
    item_cost = [13002,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 20,
    des = "攻击前方10米范围内敌方5次，每次造成154%攻击的伤害",
    fightForce = 2500
    };
getRow(40382,4)->
    #pet_skills_upgradingCfg {
    skill_id = 40382,
    level = 4,
    item_cost = [13002,3],
    star_limit = 0,
    reborn_limit = 1,
    level_limit = 30,
    des = "攻击前方10米范围内敌方5次，每次造成188%攻击的伤害",
    fightForce = 4500
    };
getRow(40382,5)->
    #pet_skills_upgradingCfg {
    skill_id = 40382,
    level = 5,
    item_cost = [13002,4],
    star_limit = 0,
    reborn_limit = 2,
    level_limit = 40,
    des = "攻击前方10米范围内敌方5次，每次造成222%攻击的伤害",
    fightForce = 7000
    };
getRow(40382,6)->
    #pet_skills_upgradingCfg {
    skill_id = 40382,
    level = 6,
    item_cost = [13002,5],
    star_limit = 0,
    reborn_limit = 3,
    level_limit = 50,
    des = "攻击前方10米范围内敌方5次，每次造成256%攻击的伤害",
    fightForce = 10000
    };
getRow(40390,1)->
    #pet_skills_upgradingCfg {
    skill_id = 40390,
    level = 1,
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "攻击前方单体敌人，造成160%攻击的伤害",
    fightForce = 0
    };
getRow(40390,2)->
    #pet_skills_upgradingCfg {
    skill_id = 40390,
    level = 2,
    item_cost = [13001,1],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "攻击前方单体敌人，造成210%攻击的伤害",
    fightForce = 500
    };
getRow(40390,3)->
    #pet_skills_upgradingCfg {
    skill_id = 40390,
    level = 3,
    item_cost = [13001,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 20,
    des = "攻击前方单体敌人，造成260%攻击的伤害",
    fightForce = 1250
    };
getRow(40390,4)->
    #pet_skills_upgradingCfg {
    skill_id = 40390,
    level = 4,
    item_cost = [13001,3],
    star_limit = 0,
    reborn_limit = 1,
    level_limit = 30,
    des = "攻击前方单体敌人，造成310%攻击的伤害",
    fightForce = 2250
    };
getRow(40390,5)->
    #pet_skills_upgradingCfg {
    skill_id = 40390,
    level = 5,
    item_cost = [13001,4],
    star_limit = 0,
    reborn_limit = 2,
    level_limit = 40,
    des = "攻击前方单体敌人，造成360%攻击的伤害",
    fightForce = 3500
    };
getRow(40390,6)->
    #pet_skills_upgradingCfg {
    skill_id = 40390,
    level = 6,
    item_cost = [13001,5],
    star_limit = 0,
    reborn_limit = 3,
    level_limit = 50,
    des = "攻击前方单体敌人，造成410%攻击的伤害",
    fightForce = 5000
    };
getRow(40391,1)->
    #pet_skills_upgradingCfg {
    skill_id = 40391,
    level = 1,
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "对前方敌人及其周围造成300%攻击的范围伤害，并造成群体减速效果",
    fightForce = 0
    };
getRow(40391,2)->
    #pet_skills_upgradingCfg {
    skill_id = 40391,
    level = 2,
    item_cost = [13001,1],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "对前方敌人及其周围造成390%攻击的范围伤害，并造成群体减速效果",
    fightForce = 500
    };
getRow(40391,3)->
    #pet_skills_upgradingCfg {
    skill_id = 40391,
    level = 3,
    item_cost = [13001,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 20,
    des = "对前方敌人及其周围造成480%攻击的范围伤害，并造成群体减速效果",
    fightForce = 1250
    };
getRow(40391,4)->
    #pet_skills_upgradingCfg {
    skill_id = 40391,
    level = 4,
    item_cost = [13001,3],
    star_limit = 0,
    reborn_limit = 1,
    level_limit = 30,
    des = "对前方敌人及其周围造成570%攻击的范围伤害，并造成群体减速效果",
    fightForce = 2250
    };
getRow(40391,5)->
    #pet_skills_upgradingCfg {
    skill_id = 40391,
    level = 5,
    item_cost = [13001,4],
    star_limit = 0,
    reborn_limit = 2,
    level_limit = 40,
    des = "对前方敌人及其周围造成660%攻击的范围伤害，并造成群体减速效果",
    fightForce = 3500
    };
getRow(40391,6)->
    #pet_skills_upgradingCfg {
    skill_id = 40391,
    level = 6,
    item_cost = [13001,5],
    star_limit = 0,
    reborn_limit = 3,
    level_limit = 50,
    des = "对前方敌人及其周围造成750%攻击的范围伤害，并造成群体减速效果",
    fightForce = 5000
    };
getRow(40392,1)->
    #pet_skills_upgradingCfg {
    skill_id = 40392,
    level = 1,
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "从天而降砸下对周围造成720%攻击的范围伤害，并强制吸引仇恨",
    fightForce = 0
    };
getRow(40392,2)->
    #pet_skills_upgradingCfg {
    skill_id = 40392,
    level = 2,
    item_cost = [13001,1],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "从天而降砸下对周围造成930%攻击的范围伤害，并强制吸引仇恨",
    fightForce = 500
    };
getRow(40392,3)->
    #pet_skills_upgradingCfg {
    skill_id = 40392,
    level = 3,
    item_cost = [13001,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 20,
    des = "从天而降砸下对周围造成1140%攻击的范围伤害，并强制吸引仇恨",
    fightForce = 1250
    };
getRow(40392,4)->
    #pet_skills_upgradingCfg {
    skill_id = 40392,
    level = 4,
    item_cost = [13001,3],
    star_limit = 0,
    reborn_limit = 1,
    level_limit = 30,
    des = "从天而降砸下对周围造成1350%攻击的范围伤害，并强制吸引仇恨",
    fightForce = 2250
    };
getRow(40392,5)->
    #pet_skills_upgradingCfg {
    skill_id = 40392,
    level = 5,
    item_cost = [13001,4],
    star_limit = 0,
    reborn_limit = 2,
    level_limit = 40,
    des = "从天而降砸下对周围造成1560%攻击的范围伤害，并强制吸引仇恨",
    fightForce = 3500
    };
getRow(40392,6)->
    #pet_skills_upgradingCfg {
    skill_id = 40392,
    level = 6,
    item_cost = [13001,5],
    star_limit = 0,
    reborn_limit = 3,
    level_limit = 50,
    des = "从天而降砸下对周围造成1770%攻击的范围伤害，并强制吸引仇恨",
    fightForce = 5000
    };
getRow(40400,1)->
    #pet_skills_upgradingCfg {
    skill_id = 40400,
    level = 1,
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "攻击前方扇形敌人，造成141%攻击的伤害",
    fightForce = 0
    };
getRow(40400,2)->
    #pet_skills_upgradingCfg {
    skill_id = 40400,
    level = 2,
    item_cost = [13001,1],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "攻击前方扇形敌人，造成185%攻击的伤害",
    fightForce = 500
    };
getRow(40400,3)->
    #pet_skills_upgradingCfg {
    skill_id = 40400,
    level = 3,
    item_cost = [13001,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 20,
    des = "攻击前方扇形敌人，造成229%攻击的伤害",
    fightForce = 1250
    };
getRow(40400,4)->
    #pet_skills_upgradingCfg {
    skill_id = 40400,
    level = 4,
    item_cost = [13001,3],
    star_limit = 0,
    reborn_limit = 1,
    level_limit = 30,
    des = "攻击前方扇形敌人，造成273%攻击的伤害",
    fightForce = 2250
    };
getRow(40400,5)->
    #pet_skills_upgradingCfg {
    skill_id = 40400,
    level = 5,
    item_cost = [13001,4],
    star_limit = 0,
    reborn_limit = 2,
    level_limit = 40,
    des = "攻击前方扇形敌人，造成317%攻击的伤害",
    fightForce = 3500
    };
getRow(40400,6)->
    #pet_skills_upgradingCfg {
    skill_id = 40400,
    level = 6,
    item_cost = [13001,5],
    star_limit = 0,
    reborn_limit = 3,
    level_limit = 50,
    des = "攻击前方扇形敌人，造成361%攻击的伤害",
    fightForce = 5000
    };
getRow(40401,1)->
    #pet_skills_upgradingCfg {
    skill_id = 40401,
    level = 1,
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "大幅度增加主人攻击力4%，持续5秒",
    fightForce = 0
    };
getRow(40401,2)->
    #pet_skills_upgradingCfg {
    skill_id = 40401,
    level = 2,
    item_cost = [13001,1],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "大幅度增加主人攻击力4.8%，持续5秒",
    fightForce = 500
    };
getRow(40401,3)->
    #pet_skills_upgradingCfg {
    skill_id = 40401,
    level = 3,
    item_cost = [13001,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 20,
    des = "大幅度增加主人攻击力5.6%，持续5秒",
    fightForce = 1250
    };
getRow(40401,4)->
    #pet_skills_upgradingCfg {
    skill_id = 40401,
    level = 4,
    item_cost = [13001,3],
    star_limit = 0,
    reborn_limit = 1,
    level_limit = 30,
    des = "大幅度增加主人攻击力6.4%，持续5秒",
    fightForce = 2250
    };
getRow(40401,5)->
    #pet_skills_upgradingCfg {
    skill_id = 40401,
    level = 5,
    item_cost = [13001,4],
    star_limit = 0,
    reborn_limit = 2,
    level_limit = 40,
    des = "大幅度增加主人攻击力7.2%，持续5秒",
    fightForce = 3500
    };
getRow(40401,6)->
    #pet_skills_upgradingCfg {
    skill_id = 40401,
    level = 6,
    item_cost = [13001,5],
    star_limit = 0,
    reborn_limit = 3,
    level_limit = 50,
    des = "大幅度增加主人攻击力8%，持续5秒",
    fightForce = 5000
    };
getRow(40402,1)->
    #pet_skills_upgradingCfg {
    skill_id = 40402,
    level = 1,
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "攻击前方直线15米范围内敌人，造成207%攻击的伤害",
    fightForce = 0
    };
getRow(40402,2)->
    #pet_skills_upgradingCfg {
    skill_id = 40402,
    level = 2,
    item_cost = [13001,1],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "攻击前方直线15米范围内敌人，造成269%攻击的伤害",
    fightForce = 500
    };
getRow(40402,3)->
    #pet_skills_upgradingCfg {
    skill_id = 40402,
    level = 3,
    item_cost = [13001,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 20,
    des = "攻击前方直线15米范围内敌人，造成331%攻击的伤害",
    fightForce = 1250
    };
getRow(40402,4)->
    #pet_skills_upgradingCfg {
    skill_id = 40402,
    level = 4,
    item_cost = [13001,3],
    star_limit = 0,
    reborn_limit = 1,
    level_limit = 30,
    des = "攻击前方直线15米范围内敌人，造成393%攻击的伤害",
    fightForce = 2250
    };
getRow(40402,5)->
    #pet_skills_upgradingCfg {
    skill_id = 40402,
    level = 5,
    item_cost = [13001,4],
    star_limit = 0,
    reborn_limit = 2,
    level_limit = 40,
    des = "攻击前方直线15米范围内敌人，造成455%攻击的伤害",
    fightForce = 3500
    };
getRow(40402,6)->
    #pet_skills_upgradingCfg {
    skill_id = 40402,
    level = 6,
    item_cost = [13001,5],
    star_limit = 0,
    reborn_limit = 3,
    level_limit = 50,
    des = "攻击前方直线15米范围内敌人，造成517%攻击的伤害",
    fightForce = 5000
    };
getRow(40410,1)->
    #pet_skills_upgradingCfg {
    skill_id = 40410,
    level = 1,
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "攻击前方扇形敌人，造成141%攻击的伤害",
    fightForce = 0
    };
getRow(40410,2)->
    #pet_skills_upgradingCfg {
    skill_id = 40410,
    level = 2,
    item_cost = [13001,1],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "攻击前方扇形敌人，造成185%攻击的伤害",
    fightForce = 500
    };
getRow(40410,3)->
    #pet_skills_upgradingCfg {
    skill_id = 40410,
    level = 3,
    item_cost = [13001,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 20,
    des = "攻击前方扇形敌人，造成229%攻击的伤害",
    fightForce = 1250
    };
getRow(40410,4)->
    #pet_skills_upgradingCfg {
    skill_id = 40410,
    level = 4,
    item_cost = [13001,3],
    star_limit = 0,
    reborn_limit = 1,
    level_limit = 30,
    des = "攻击前方扇形敌人，造成273%攻击的伤害",
    fightForce = 2250
    };
getRow(40410,5)->
    #pet_skills_upgradingCfg {
    skill_id = 40410,
    level = 5,
    item_cost = [13001,4],
    star_limit = 0,
    reborn_limit = 2,
    level_limit = 40,
    des = "攻击前方扇形敌人，造成317%攻击的伤害",
    fightForce = 3500
    };
getRow(40410,6)->
    #pet_skills_upgradingCfg {
    skill_id = 40410,
    level = 6,
    item_cost = [13001,5],
    star_limit = 0,
    reborn_limit = 3,
    level_limit = 50,
    des = "攻击前方扇形敌人，造成361%攻击的伤害",
    fightForce = 5000
    };
getRow(40411,1)->
    #pet_skills_upgradingCfg {
    skill_id = 40411,
    level = 1,
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "大幅度增加主人攻击力4%，持续5秒",
    fightForce = 0
    };
getRow(40411,2)->
    #pet_skills_upgradingCfg {
    skill_id = 40411,
    level = 2,
    item_cost = [13001,1],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "大幅度增加主人攻击力4.8%，持续5秒",
    fightForce = 500
    };
getRow(40411,3)->
    #pet_skills_upgradingCfg {
    skill_id = 40411,
    level = 3,
    item_cost = [13001,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 20,
    des = "大幅度增加主人攻击力5.6%，持续5秒",
    fightForce = 1250
    };
getRow(40411,4)->
    #pet_skills_upgradingCfg {
    skill_id = 40411,
    level = 4,
    item_cost = [13001,3],
    star_limit = 0,
    reborn_limit = 1,
    level_limit = 30,
    des = "大幅度增加主人攻击力6.4%，持续5秒",
    fightForce = 2250
    };
getRow(40411,5)->
    #pet_skills_upgradingCfg {
    skill_id = 40411,
    level = 5,
    item_cost = [13001,4],
    star_limit = 0,
    reborn_limit = 2,
    level_limit = 40,
    des = "大幅度增加主人攻击力7.2%，持续5秒",
    fightForce = 3500
    };
getRow(40411,6)->
    #pet_skills_upgradingCfg {
    skill_id = 40411,
    level = 6,
    item_cost = [13001,5],
    star_limit = 0,
    reborn_limit = 3,
    level_limit = 50,
    des = "大幅度增加主人攻击力8%，持续5秒",
    fightForce = 5000
    };
getRow(40412,1)->
    #pet_skills_upgradingCfg {
    skill_id = 40412,
    level = 1,
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "攻击前方直线15米范围内敌人，造成207%攻击的伤害",
    fightForce = 0
    };
getRow(40412,2)->
    #pet_skills_upgradingCfg {
    skill_id = 40412,
    level = 2,
    item_cost = [13001,1],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "攻击前方直线15米范围内敌人，造成269%攻击的伤害",
    fightForce = 500
    };
getRow(40412,3)->
    #pet_skills_upgradingCfg {
    skill_id = 40412,
    level = 3,
    item_cost = [13001,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 20,
    des = "攻击前方直线15米范围内敌人，造成331%攻击的伤害",
    fightForce = 1250
    };
getRow(40412,4)->
    #pet_skills_upgradingCfg {
    skill_id = 40412,
    level = 4,
    item_cost = [13001,3],
    star_limit = 0,
    reborn_limit = 1,
    level_limit = 30,
    des = "攻击前方直线15米范围内敌人，造成393%攻击的伤害",
    fightForce = 2250
    };
getRow(40412,5)->
    #pet_skills_upgradingCfg {
    skill_id = 40412,
    level = 5,
    item_cost = [13001,4],
    star_limit = 0,
    reborn_limit = 2,
    level_limit = 40,
    des = "攻击前方直线15米范围内敌人，造成455%攻击的伤害",
    fightForce = 3500
    };
getRow(40412,6)->
    #pet_skills_upgradingCfg {
    skill_id = 40412,
    level = 6,
    item_cost = [13001,5],
    star_limit = 0,
    reborn_limit = 3,
    level_limit = 50,
    des = "攻击前方直线15米范围内敌人，造成517%攻击的伤害",
    fightForce = 5000
    };
getRow(40420,1)->
    #pet_skills_upgradingCfg {
    skill_id = 40420,
    level = 1,
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "攻击前方扇形敌人，造成141%攻击的伤害",
    fightForce = 0
    };
getRow(40420,2)->
    #pet_skills_upgradingCfg {
    skill_id = 40420,
    level = 2,
    item_cost = [13002,1],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "攻击前方扇形敌人，造成201%攻击的伤害",
    fightForce = 1000
    };
getRow(40420,3)->
    #pet_skills_upgradingCfg {
    skill_id = 40420,
    level = 3,
    item_cost = [13002,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 20,
    des = "攻击前方扇形敌人，造成261%攻击的伤害",
    fightForce = 2500
    };
getRow(40420,4)->
    #pet_skills_upgradingCfg {
    skill_id = 40420,
    level = 4,
    item_cost = [13002,3],
    star_limit = 0,
    reborn_limit = 1,
    level_limit = 30,
    des = "攻击前方扇形敌人，造成321%攻击的伤害",
    fightForce = 4500
    };
getRow(40420,5)->
    #pet_skills_upgradingCfg {
    skill_id = 40420,
    level = 5,
    item_cost = [13002,4],
    star_limit = 0,
    reborn_limit = 2,
    level_limit = 40,
    des = "攻击前方扇形敌人，造成381%攻击的伤害",
    fightForce = 7000
    };
getRow(40420,6)->
    #pet_skills_upgradingCfg {
    skill_id = 40420,
    level = 6,
    item_cost = [13002,5],
    star_limit = 0,
    reborn_limit = 3,
    level_limit = 50,
    des = "攻击前方扇形敌人，造成441%攻击的伤害",
    fightForce = 10000
    };
getRow(40421,1)->
    #pet_skills_upgradingCfg {
    skill_id = 40421,
    level = 1,
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "大幅度增加主人攻击力5%，持续5秒",
    fightForce = 0
    };
getRow(40421,2)->
    #pet_skills_upgradingCfg {
    skill_id = 40421,
    level = 2,
    item_cost = [13002,1],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "大幅度增加主人攻击力6%，持续5秒",
    fightForce = 1000
    };
getRow(40421,3)->
    #pet_skills_upgradingCfg {
    skill_id = 40421,
    level = 3,
    item_cost = [13002,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 20,
    des = "大幅度增加主人攻击力7%，持续5秒",
    fightForce = 2500
    };
getRow(40421,4)->
    #pet_skills_upgradingCfg {
    skill_id = 40421,
    level = 4,
    item_cost = [13002,3],
    star_limit = 0,
    reborn_limit = 1,
    level_limit = 30,
    des = "大幅度增加主人攻击力8%，持续5秒",
    fightForce = 4500
    };
getRow(40421,5)->
    #pet_skills_upgradingCfg {
    skill_id = 40421,
    level = 5,
    item_cost = [13002,4],
    star_limit = 0,
    reborn_limit = 2,
    level_limit = 40,
    des = "大幅度增加主人攻击力9%，持续5秒",
    fightForce = 7000
    };
getRow(40421,6)->
    #pet_skills_upgradingCfg {
    skill_id = 40421,
    level = 6,
    item_cost = [13002,5],
    star_limit = 0,
    reborn_limit = 3,
    level_limit = 50,
    des = "大幅度增加主人攻击力10%，持续5秒",
    fightForce = 10000
    };
getRow(40422,1)->
    #pet_skills_upgradingCfg {
    skill_id = 40422,
    level = 1,
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "攻击前方直线15米范围内敌人，造成207%攻击的伤害",
    fightForce = 0
    };
getRow(40422,2)->
    #pet_skills_upgradingCfg {
    skill_id = 40422,
    level = 2,
    item_cost = [13002,1],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "攻击前方直线15米范围内敌人，造成290%攻击的伤害",
    fightForce = 1000
    };
getRow(40422,3)->
    #pet_skills_upgradingCfg {
    skill_id = 40422,
    level = 3,
    item_cost = [13002,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 20,
    des = "攻击前方直线15米范围内敌人，造成373%攻击的伤害",
    fightForce = 2500
    };
getRow(40422,4)->
    #pet_skills_upgradingCfg {
    skill_id = 40422,
    level = 4,
    item_cost = [13002,3],
    star_limit = 0,
    reborn_limit = 1,
    level_limit = 30,
    des = "攻击前方直线15米范围内敌人，造成456%攻击的伤害",
    fightForce = 4500
    };
getRow(40422,5)->
    #pet_skills_upgradingCfg {
    skill_id = 40422,
    level = 5,
    item_cost = [13002,4],
    star_limit = 0,
    reborn_limit = 2,
    level_limit = 40,
    des = "攻击前方直线15米范围内敌人，造成539%攻击的伤害",
    fightForce = 7000
    };
getRow(40422,6)->
    #pet_skills_upgradingCfg {
    skill_id = 40422,
    level = 6,
    item_cost = [13002,5],
    star_limit = 0,
    reborn_limit = 3,
    level_limit = 50,
    des = "攻击前方直线15米范围内敌人，造成622%攻击的伤害",
    fightForce = 10000
    };
getRow(_,_)->[].

getKeyList()->[
    {1601,1},
    {1602,1},
    {1603,1},
    {1636,1},
    {40000,1},
    {40000,2},
    {40000,3},
    {40000,4},
    {40000,5},
    {40000,6},
    {40001,1},
    {40001,2},
    {40001,3},
    {40001,4},
    {40001,5},
    {40001,6},
    {40002,1},
    {40002,2},
    {40002,3},
    {40002,4},
    {40002,5},
    {40002,6},
    {40010,1},
    {40010,2},
    {40010,3},
    {40010,4},
    {40010,5},
    {40010,6},
    {40011,1},
    {40011,2},
    {40011,3},
    {40011,4},
    {40011,5},
    {40011,6},
    {40012,1},
    {40012,2},
    {40012,3},
    {40012,4},
    {40012,5},
    {40012,6},
    {40020,1},
    {40020,2},
    {40020,3},
    {40020,4},
    {40020,5},
    {40020,6},
    {40022,1},
    {40022,2},
    {40022,3},
    {40022,4},
    {40022,5},
    {40022,6},
    {40024,1},
    {40030,1},
    {40030,2},
    {40030,3},
    {40030,4},
    {40030,5},
    {40030,6},
    {40031,1},
    {40031,2},
    {40031,3},
    {40031,4},
    {40031,5},
    {40031,6},
    {40035,1},
    {40035,2},
    {40035,3},
    {40035,4},
    {40035,5},
    {40035,6},
    {40040,1},
    {40040,2},
    {40040,3},
    {40040,4},
    {40040,5},
    {40040,6},
    {40041,1},
    {40041,2},
    {40041,3},
    {40041,4},
    {40041,5},
    {40041,6},
    {40044,1},
    {40044,2},
    {40044,3},
    {40044,4},
    {40044,5},
    {40044,6},
    {40050,1},
    {40050,2},
    {40050,3},
    {40050,4},
    {40050,5},
    {40050,6},
    {40053,1},
    {40053,2},
    {40053,3},
    {40053,4},
    {40053,5},
    {40053,6},
    {40054,1},
    {40060,1},
    {40060,2},
    {40060,3},
    {40060,4},
    {40060,5},
    {40060,6},
    {40061,1},
    {40061,2},
    {40061,3},
    {40061,4},
    {40061,5},
    {40061,6},
    {40063,1},
    {40063,2},
    {40063,3},
    {40063,4},
    {40063,5},
    {40063,6},
    {40070,1},
    {40070,2},
    {40070,3},
    {40070,4},
    {40070,5},
    {40070,6},
    {40071,1},
    {40071,2},
    {40071,3},
    {40071,4},
    {40071,5},
    {40071,6},
    {40072,1},
    {40072,2},
    {40072,3},
    {40072,4},
    {40072,5},
    {40072,6},
    {40090,1},
    {40090,2},
    {40090,3},
    {40090,4},
    {40090,5},
    {40090,6},
    {40091,1},
    {40091,2},
    {40091,3},
    {40091,4},
    {40091,5},
    {40091,6},
    {40092,1},
    {40092,2},
    {40092,3},
    {40092,4},
    {40092,5},
    {40092,6},
    {40100,1},
    {40100,2},
    {40100,3},
    {40100,4},
    {40100,5},
    {40100,6},
    {40101,1},
    {40101,2},
    {40101,3},
    {40101,4},
    {40101,5},
    {40101,6},
    {40102,1},
    {40102,2},
    {40102,3},
    {40102,4},
    {40102,5},
    {40102,6},
    {40110,1},
    {40110,2},
    {40110,3},
    {40110,4},
    {40110,5},
    {40110,6},
    {40111,1},
    {40111,2},
    {40111,3},
    {40111,4},
    {40111,5},
    {40111,6},
    {40114,1},
    {40114,2},
    {40114,3},
    {40114,4},
    {40114,5},
    {40114,6},
    {40120,1},
    {40120,2},
    {40120,3},
    {40120,4},
    {40120,5},
    {40120,6},
    {40121,1},
    {40121,2},
    {40121,3},
    {40121,4},
    {40121,5},
    {40121,6},
    {40124,1},
    {40124,2},
    {40124,3},
    {40124,4},
    {40130,1},
    {40130,2},
    {40130,3},
    {40130,4},
    {40130,5},
    {40130,6},
    {40131,1},
    {40131,2},
    {40131,3},
    {40131,4},
    {40131,5},
    {40131,6},
    {40132,1},
    {40132,2},
    {40132,3},
    {40132,4},
    {40132,5},
    {40132,6},
    {40140,1},
    {40140,2},
    {40140,3},
    {40140,4},
    {40140,5},
    {40140,6},
    {40141,1},
    {40141,2},
    {40141,3},
    {40141,4},
    {40141,5},
    {40141,6},
    {40142,1},
    {40150,1},
    {40150,2},
    {40150,3},
    {40150,4},
    {40150,5},
    {40150,6},
    {40151,1},
    {40151,2},
    {40151,3},
    {40151,4},
    {40151,5},
    {40151,6},
    {40155,1},
    {40160,1},
    {40160,2},
    {40160,3},
    {40160,4},
    {40160,5},
    {40160,6},
    {40161,1},
    {40161,2},
    {40161,3},
    {40161,4},
    {40161,5},
    {40161,6},
    {40170,1},
    {40170,2},
    {40170,3},
    {40170,4},
    {40170,5},
    {40170,6},
    {40171,1},
    {40171,2},
    {40171,3},
    {40171,4},
    {40171,5},
    {40171,6},
    {40180,1},
    {40180,2},
    {40180,3},
    {40180,4},
    {40180,5},
    {40180,6},
    {40181,1},
    {40181,2},
    {40181,3},
    {40181,4},
    {40181,5},
    {40181,6},
    {40190,1},
    {40190,2},
    {40190,3},
    {40190,4},
    {40190,5},
    {40190,6},
    {40191,1},
    {40191,2},
    {40191,3},
    {40191,4},
    {40191,5},
    {40191,6},
    {40200,1},
    {40200,2},
    {40200,3},
    {40200,4},
    {40200,5},
    {40200,6},
    {40201,1},
    {40201,2},
    {40201,3},
    {40201,4},
    {40201,5},
    {40201,6},
    {40210,1},
    {40210,2},
    {40210,3},
    {40210,4},
    {40210,5},
    {40210,6},
    {40211,1},
    {40211,2},
    {40211,3},
    {40211,4},
    {40211,5},
    {40211,6},
    {40220,1},
    {40220,2},
    {40220,3},
    {40220,4},
    {40220,5},
    {40220,6},
    {40221,1},
    {40221,2},
    {40221,3},
    {40221,4},
    {40221,5},
    {40221,6},
    {40230,1},
    {40230,2},
    {40230,3},
    {40230,4},
    {40230,5},
    {40230,6},
    {40231,1},
    {40231,2},
    {40231,3},
    {40231,4},
    {40231,5},
    {40231,6},
    {40240,1},
    {40240,2},
    {40240,3},
    {40240,4},
    {40240,5},
    {40240,6},
    {40241,1},
    {40241,2},
    {40241,3},
    {40241,4},
    {40241,5},
    {40241,6},
    {40250,1},
    {40250,2},
    {40250,3},
    {40250,4},
    {40250,5},
    {40250,6},
    {40251,1},
    {40251,2},
    {40251,3},
    {40251,4},
    {40251,5},
    {40251,6},
    {40260,1},
    {40260,2},
    {40260,3},
    {40260,4},
    {40260,5},
    {40260,6},
    {40261,1},
    {40261,2},
    {40261,3},
    {40261,4},
    {40261,5},
    {40261,6},
    {40270,1},
    {40270,2},
    {40270,3},
    {40270,4},
    {40270,5},
    {40270,6},
    {40271,1},
    {40271,2},
    {40271,3},
    {40271,4},
    {40271,5},
    {40271,6},
    {40280,1},
    {40280,2},
    {40280,3},
    {40280,4},
    {40280,5},
    {40280,6},
    {40281,1},
    {40281,2},
    {40281,3},
    {40281,4},
    {40281,5},
    {40281,6},
    {40290,1},
    {40290,2},
    {40290,3},
    {40290,4},
    {40290,5},
    {40290,6},
    {40291,1},
    {40291,2},
    {40291,3},
    {40291,4},
    {40291,5},
    {40291,6},
    {40300,1},
    {40300,2},
    {40300,3},
    {40300,4},
    {40300,5},
    {40300,6},
    {40301,1},
    {40301,2},
    {40301,3},
    {40301,4},
    {40301,5},
    {40301,6},
    {40310,1},
    {40310,2},
    {40310,3},
    {40310,4},
    {40310,5},
    {40310,6},
    {40311,1},
    {40311,2},
    {40311,3},
    {40311,4},
    {40311,5},
    {40311,6},
    {40320,1},
    {40320,2},
    {40320,3},
    {40320,4},
    {40320,5},
    {40320,6},
    {40321,1},
    {40321,2},
    {40321,3},
    {40321,4},
    {40321,5},
    {40321,6},
    {40322,1},
    {40322,2},
    {40322,3},
    {40322,4},
    {40322,5},
    {40322,6},
    {40330,1},
    {40330,2},
    {40330,3},
    {40330,4},
    {40330,5},
    {40330,6},
    {40331,1},
    {40331,2},
    {40331,3},
    {40331,4},
    {40331,5},
    {40331,6},
    {40340,1},
    {40340,2},
    {40340,3},
    {40340,4},
    {40340,5},
    {40340,6},
    {40341,1},
    {40341,2},
    {40341,3},
    {40341,4},
    {40341,5},
    {40341,6},
    {40350,1},
    {40350,2},
    {40350,3},
    {40350,4},
    {40350,5},
    {40350,6},
    {40351,1},
    {40351,2},
    {40351,3},
    {40351,4},
    {40351,5},
    {40351,6},
    {40352,1},
    {40352,2},
    {40352,3},
    {40352,4},
    {40352,5},
    {40352,6},
    {40360,1},
    {40360,2},
    {40360,3},
    {40360,4},
    {40360,5},
    {40360,6},
    {40361,1},
    {40361,2},
    {40361,3},
    {40361,4},
    {40361,5},
    {40361,6},
    {40362,1},
    {40362,2},
    {40362,3},
    {40362,4},
    {40362,5},
    {40362,6},
    {40370,1},
    {40370,2},
    {40370,3},
    {40370,4},
    {40370,5},
    {40370,6},
    {40371,1},
    {40371,2},
    {40371,3},
    {40371,4},
    {40371,5},
    {40371,6},
    {40372,1},
    {40372,2},
    {40372,3},
    {40372,4},
    {40372,5},
    {40372,6},
    {40380,1},
    {40380,2},
    {40380,3},
    {40380,4},
    {40380,5},
    {40380,6},
    {40381,1},
    {40381,2},
    {40381,3},
    {40381,4},
    {40381,5},
    {40381,6},
    {40382,1},
    {40382,2},
    {40382,3},
    {40382,4},
    {40382,5},
    {40382,6},
    {40390,1},
    {40390,2},
    {40390,3},
    {40390,4},
    {40390,5},
    {40390,6},
    {40391,1},
    {40391,2},
    {40391,3},
    {40391,4},
    {40391,5},
    {40391,6},
    {40392,1},
    {40392,2},
    {40392,3},
    {40392,4},
    {40392,5},
    {40392,6},
    {40400,1},
    {40400,2},
    {40400,3},
    {40400,4},
    {40400,5},
    {40400,6},
    {40401,1},
    {40401,2},
    {40401,3},
    {40401,4},
    {40401,5},
    {40401,6},
    {40402,1},
    {40402,2},
    {40402,3},
    {40402,4},
    {40402,5},
    {40402,6},
    {40410,1},
    {40410,2},
    {40410,3},
    {40410,4},
    {40410,5},
    {40410,6},
    {40411,1},
    {40411,2},
    {40411,3},
    {40411,4},
    {40411,5},
    {40411,6},
    {40412,1},
    {40412,2},
    {40412,3},
    {40412,4},
    {40412,5},
    {40412,6},
    {40420,1},
    {40420,2},
    {40420,3},
    {40420,4},
    {40420,5},
    {40420,6},
    {40421,1},
    {40421,2},
    {40421,3},
    {40421,4},
    {40421,5},
    {40421,6},
    {40422,1},
    {40422,2},
    {40422,3},
    {40422,4},
    {40422,5},
    {40422,6}
    ].

get1KeyList()->[
    1601,
    1602,
    1603,
    1636,
    40000,
    40001,
    40002,
    40010,
    40011,
    40012,
    40020,
    40022,
    40024,
    40030,
    40031,
    40035,
    40040,
    40041,
    40044,
    40050,
    40053,
    40054,
    40060,
    40061,
    40063,
    40070,
    40071,
    40072,
    40090,
    40091,
    40092,
    40100,
    40101,
    40102,
    40110,
    40111,
    40114,
    40120,
    40121,
    40124,
    40130,
    40131,
    40132,
    40140,
    40141,
    40142,
    40150,
    40151,
    40155,
    40160,
    40161,
    40170,
    40171,
    40180,
    40181,
    40190,
    40191,
    40200,
    40201,
    40210,
    40211,
    40220,
    40221,
    40230,
    40231,
    40240,
    40241,
    40250,
    40251,
    40260,
    40261,
    40270,
    40271,
    40280,
    40281,
    40290,
    40291,
    40300,
    40301,
    40310,
    40311,
    40320,
    40321,
    40322,
    40330,
    40331,
    40340,
    40341,
    40350,
    40351,
    40352,
    40360,
    40361,
    40362,
    40370,
    40371,
    40372,
    40380,
    40381,
    40382,
    40390,
    40391,
    40392,
    40400,
    40401,
    40402,
    40410,
    40411,
    40412,
    40420,
    40421,
    40422
    ].

get2KeyList(1601)->[
    1
    ];
get2KeyList(1602)->[
    1
    ];
get2KeyList(1603)->[
    1
    ];
get2KeyList(1636)->[
    1
    ];
get2KeyList(40000)->[
    1,
    2,
    3,
    4,
    5,
    6
    ];
get2KeyList(40001)->[
    1,
    2,
    3,
    4,
    5,
    6
    ];
get2KeyList(40002)->[
    1,
    2,
    3,
    4,
    5,
    6
    ];
get2KeyList(40010)->[
    1,
    2,
    3,
    4,
    5,
    6
    ];
get2KeyList(40011)->[
    1,
    2,
    3,
    4,
    5,
    6
    ];
get2KeyList(40012)->[
    1,
    2,
    3,
    4,
    5,
    6
    ];
get2KeyList(40020)->[
    1,
    2,
    3,
    4,
    5,
    6
    ];
get2KeyList(40022)->[
    1,
    2,
    3,
    4,
    5,
    6
    ];
get2KeyList(40024)->[
    1
    ];
get2KeyList(40030)->[
    1,
    2,
    3,
    4,
    5,
    6
    ];
get2KeyList(40031)->[
    1,
    2,
    3,
    4,
    5,
    6
    ];
get2KeyList(40035)->[
    1,
    2,
    3,
    4,
    5,
    6
    ];
get2KeyList(40040)->[
    1,
    2,
    3,
    4,
    5,
    6
    ];
get2KeyList(40041)->[
    1,
    2,
    3,
    4,
    5,
    6
    ];
get2KeyList(40044)->[
    1,
    2,
    3,
    4,
    5,
    6
    ];
get2KeyList(40050)->[
    1,
    2,
    3,
    4,
    5,
    6
    ];
get2KeyList(40053)->[
    1,
    2,
    3,
    4,
    5,
    6
    ];
get2KeyList(40054)->[
    1
    ];
get2KeyList(40060)->[
    1,
    2,
    3,
    4,
    5,
    6
    ];
get2KeyList(40061)->[
    1,
    2,
    3,
    4,
    5,
    6
    ];
get2KeyList(40063)->[
    1,
    2,
    3,
    4,
    5,
    6
    ];
get2KeyList(40070)->[
    1,
    2,
    3,
    4,
    5,
    6
    ];
get2KeyList(40071)->[
    1,
    2,
    3,
    4,
    5,
    6
    ];
get2KeyList(40072)->[
    1,
    2,
    3,
    4,
    5,
    6
    ];
get2KeyList(40090)->[
    1,
    2,
    3,
    4,
    5,
    6
    ];
get2KeyList(40091)->[
    1,
    2,
    3,
    4,
    5,
    6
    ];
get2KeyList(40092)->[
    1,
    2,
    3,
    4,
    5,
    6
    ];
get2KeyList(40100)->[
    1,
    2,
    3,
    4,
    5,
    6
    ];
get2KeyList(40101)->[
    1,
    2,
    3,
    4,
    5,
    6
    ];
get2KeyList(40102)->[
    1,
    2,
    3,
    4,
    5,
    6
    ];
get2KeyList(40110)->[
    1,
    2,
    3,
    4,
    5,
    6
    ];
get2KeyList(40111)->[
    1,
    2,
    3,
    4,
    5,
    6
    ];
get2KeyList(40114)->[
    1,
    2,
    3,
    4,
    5,
    6
    ];
get2KeyList(40120)->[
    1,
    2,
    3,
    4,
    5,
    6
    ];
get2KeyList(40121)->[
    1,
    2,
    3,
    4,
    5,
    6
    ];
get2KeyList(40124)->[
    1,
    2,
    3,
    4
    ];
get2KeyList(40130)->[
    1,
    2,
    3,
    4,
    5,
    6
    ];
get2KeyList(40131)->[
    1,
    2,
    3,
    4,
    5,
    6
    ];
get2KeyList(40132)->[
    1,
    2,
    3,
    4,
    5,
    6
    ];
get2KeyList(40140)->[
    1,
    2,
    3,
    4,
    5,
    6
    ];
get2KeyList(40141)->[
    1,
    2,
    3,
    4,
    5,
    6
    ];
get2KeyList(40142)->[
    1
    ];
get2KeyList(40150)->[
    1,
    2,
    3,
    4,
    5,
    6
    ];
get2KeyList(40151)->[
    1,
    2,
    3,
    4,
    5,
    6
    ];
get2KeyList(40155)->[
    1
    ];
get2KeyList(40160)->[
    1,
    2,
    3,
    4,
    5,
    6
    ];
get2KeyList(40161)->[
    1,
    2,
    3,
    4,
    5,
    6
    ];
get2KeyList(40170)->[
    1,
    2,
    3,
    4,
    5,
    6
    ];
get2KeyList(40171)->[
    1,
    2,
    3,
    4,
    5,
    6
    ];
get2KeyList(40180)->[
    1,
    2,
    3,
    4,
    5,
    6
    ];
get2KeyList(40181)->[
    1,
    2,
    3,
    4,
    5,
    6
    ];
get2KeyList(40190)->[
    1,
    2,
    3,
    4,
    5,
    6
    ];
get2KeyList(40191)->[
    1,
    2,
    3,
    4,
    5,
    6
    ];
get2KeyList(40200)->[
    1,
    2,
    3,
    4,
    5,
    6
    ];
get2KeyList(40201)->[
    1,
    2,
    3,
    4,
    5,
    6
    ];
get2KeyList(40210)->[
    1,
    2,
    3,
    4,
    5,
    6
    ];
get2KeyList(40211)->[
    1,
    2,
    3,
    4,
    5,
    6
    ];
get2KeyList(40220)->[
    1,
    2,
    3,
    4,
    5,
    6
    ];
get2KeyList(40221)->[
    1,
    2,
    3,
    4,
    5,
    6
    ];
get2KeyList(40230)->[
    1,
    2,
    3,
    4,
    5,
    6
    ];
get2KeyList(40231)->[
    1,
    2,
    3,
    4,
    5,
    6
    ];
get2KeyList(40240)->[
    1,
    2,
    3,
    4,
    5,
    6
    ];
get2KeyList(40241)->[
    1,
    2,
    3,
    4,
    5,
    6
    ];
get2KeyList(40250)->[
    1,
    2,
    3,
    4,
    5,
    6
    ];
get2KeyList(40251)->[
    1,
    2,
    3,
    4,
    5,
    6
    ];
get2KeyList(40260)->[
    1,
    2,
    3,
    4,
    5,
    6
    ];
get2KeyList(40261)->[
    1,
    2,
    3,
    4,
    5,
    6
    ];
get2KeyList(40270)->[
    1,
    2,
    3,
    4,
    5,
    6
    ];
get2KeyList(40271)->[
    1,
    2,
    3,
    4,
    5,
    6
    ];
get2KeyList(40280)->[
    1,
    2,
    3,
    4,
    5,
    6
    ];
get2KeyList(40281)->[
    1,
    2,
    3,
    4,
    5,
    6
    ];
get2KeyList(40290)->[
    1,
    2,
    3,
    4,
    5,
    6
    ];
get2KeyList(40291)->[
    1,
    2,
    3,
    4,
    5,
    6
    ];
get2KeyList(40300)->[
    1,
    2,
    3,
    4,
    5,
    6
    ];
get2KeyList(40301)->[
    1,
    2,
    3,
    4,
    5,
    6
    ];
get2KeyList(40310)->[
    1,
    2,
    3,
    4,
    5,
    6
    ];
get2KeyList(40311)->[
    1,
    2,
    3,
    4,
    5,
    6
    ];
get2KeyList(40320)->[
    1,
    2,
    3,
    4,
    5,
    6
    ];
get2KeyList(40321)->[
    1,
    2,
    3,
    4,
    5,
    6
    ];
get2KeyList(40322)->[
    1,
    2,
    3,
    4,
    5,
    6
    ];
get2KeyList(40330)->[
    1,
    2,
    3,
    4,
    5,
    6
    ];
get2KeyList(40331)->[
    1,
    2,
    3,
    4,
    5,
    6
    ];
get2KeyList(40340)->[
    1,
    2,
    3,
    4,
    5,
    6
    ];
get2KeyList(40341)->[
    1,
    2,
    3,
    4,
    5,
    6
    ];
get2KeyList(40350)->[
    1,
    2,
    3,
    4,
    5,
    6
    ];
get2KeyList(40351)->[
    1,
    2,
    3,
    4,
    5,
    6
    ];
get2KeyList(40352)->[
    1,
    2,
    3,
    4,
    5,
    6
    ];
get2KeyList(40360)->[
    1,
    2,
    3,
    4,
    5,
    6
    ];
get2KeyList(40361)->[
    1,
    2,
    3,
    4,
    5,
    6
    ];
get2KeyList(40362)->[
    1,
    2,
    3,
    4,
    5,
    6
    ];
get2KeyList(40370)->[
    1,
    2,
    3,
    4,
    5,
    6
    ];
get2KeyList(40371)->[
    1,
    2,
    3,
    4,
    5,
    6
    ];
get2KeyList(40372)->[
    1,
    2,
    3,
    4,
    5,
    6
    ];
get2KeyList(40380)->[
    1,
    2,
    3,
    4,
    5,
    6
    ];
get2KeyList(40381)->[
    1,
    2,
    3,
    4,
    5,
    6
    ];
get2KeyList(40382)->[
    1,
    2,
    3,
    4,
    5,
    6
    ];
get2KeyList(40390)->[
    1,
    2,
    3,
    4,
    5,
    6
    ];
get2KeyList(40391)->[
    1,
    2,
    3,
    4,
    5,
    6
    ];
get2KeyList(40392)->[
    1,
    2,
    3,
    4,
    5,
    6
    ];
get2KeyList(40400)->[
    1,
    2,
    3,
    4,
    5,
    6
    ];
get2KeyList(40401)->[
    1,
    2,
    3,
    4,
    5,
    6
    ];
get2KeyList(40402)->[
    1,
    2,
    3,
    4,
    5,
    6
    ];
get2KeyList(40410)->[
    1,
    2,
    3,
    4,
    5,
    6
    ];
get2KeyList(40411)->[
    1,
    2,
    3,
    4,
    5,
    6
    ];
get2KeyList(40412)->[
    1,
    2,
    3,
    4,
    5,
    6
    ];
get2KeyList(40420)->[
    1,
    2,
    3,
    4,
    5,
    6
    ];
get2KeyList(40421)->[
    1,
    2,
    3,
    4,
    5,
    6
    ];
get2KeyList(40422)->[
    1,
    2,
    3,
    4,
    5,
    6
    ];
get2KeyList(_)->[].

