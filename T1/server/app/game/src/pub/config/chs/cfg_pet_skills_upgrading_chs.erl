%% coding: latin-1
%%: 实现
-module(cfg_pet_skills_upgrading_chs).
-compile(export_all).
-include("cfg_pet_skills_upgrading.hrl").
-include("logger.hrl").

getRow(1701,1)->
    #pet_skills_upgradingCfg {
    skill_id = 1701,
    level = 1,
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "一次普通的攻击，造成{a}%攻击的伤害",
    character_a = "400",
    character_b = "",
    character_c = "",
    fightForce = 0
    };
getRow(1701,2)->
    #pet_skills_upgradingCfg {
    skill_id = 1701,
    level = 2,
    item_cost = [13000,1],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 40,
    des = "一次普通的攻击，造成{a}%攻击的伤害",
    character_a = "460",
    character_b = "",
    character_c = "",
    fightForce = 300
    };
getRow(1701,3)->
    #pet_skills_upgradingCfg {
    skill_id = 1701,
    level = 3,
    item_cost = [13000,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 60,
    des = "一次普通的攻击，造成{a}%攻击的伤害",
    character_a = "520",
    character_b = "",
    character_c = "",
    fightForce = 900
    };
getRow(1701,4)->
    #pet_skills_upgradingCfg {
    skill_id = 1701,
    level = 4,
    item_cost = [13000,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 80,
    des = "一次普通的攻击，造成{a}%攻击的伤害",
    character_a = "580",
    character_b = "",
    character_c = "",
    fightForce = 1500
    };
getRow(1701,5)->
    #pet_skills_upgradingCfg {
    skill_id = 1701,
    level = 5,
    item_cost = [13000,3],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 100,
    des = "一次普通的攻击，造成{a}%攻击的伤害",
    character_a = "640",
    character_b = "",
    character_c = "",
    fightForce = 2400
    };
getRow(1701,6)->
    #pet_skills_upgradingCfg {
    skill_id = 1701,
    level = 6,
    item_cost = [13000,3],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 120,
    des = "一次普通的攻击，造成{a}%攻击的伤害",
    character_a = "700",
    character_b = "",
    character_c = "",
    fightForce = 3300
    };
getRow(1701,7)->
    #pet_skills_upgradingCfg {
    skill_id = 1701,
    level = 7,
    item_cost = [13000,4],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 140,
    des = "一次普通的攻击，造成{a}%攻击的伤害",
    character_a = "760",
    character_b = "",
    character_c = "",
    fightForce = 4500
    };
getRow(1701,8)->
    #pet_skills_upgradingCfg {
    skill_id = 1701,
    level = 8,
    item_cost = [13000,4],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 160,
    des = "一次普通的攻击，造成{a}%攻击的伤害",
    character_a = "820",
    character_b = "",
    character_c = "",
    fightForce = 5700
    };
getRow(1701,9)->
    #pet_skills_upgradingCfg {
    skill_id = 1701,
    level = 9,
    item_cost = [13000,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 180,
    des = "一次普通的攻击，造成{a}%攻击的伤害",
    character_a = "880",
    character_b = "",
    character_c = "",
    fightForce = 7200
    };
getRow(1701,10)->
    #pet_skills_upgradingCfg {
    skill_id = 1701,
    level = 10,
    item_cost = [13000,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 200,
    des = "一次普通的攻击，造成{a}%攻击的伤害",
    character_a = "940",
    character_b = "",
    character_c = "",
    fightForce = 8700
    };
getRow(1701,11)->
    #pet_skills_upgradingCfg {
    skill_id = 1701,
    level = 11,
    item_cost = [13000,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 200,
    des = "一次普通的攻击，造成{a}%攻击的伤害",
    character_a = "1000",
    character_b = "",
    character_c = "",
    fightForce = 10200
    };
getRow(1702,1)->
    #pet_skills_upgradingCfg {
    skill_id = 1702,
    level = 1,
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "一次普通的攻击，造成{a}%攻击的伤害",
    character_a = "400",
    character_b = "",
    character_c = "",
    fightForce = 0
    };
getRow(1702,2)->
    #pet_skills_upgradingCfg {
    skill_id = 1702,
    level = 2,
    item_cost = [13000,1],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 40,
    des = "一次普通的攻击，造成{a}%攻击的伤害",
    character_a = "460",
    character_b = "",
    character_c = "",
    fightForce = 300
    };
getRow(1702,3)->
    #pet_skills_upgradingCfg {
    skill_id = 1702,
    level = 3,
    item_cost = [13000,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 60,
    des = "一次普通的攻击，造成{a}%攻击的伤害",
    character_a = "520",
    character_b = "",
    character_c = "",
    fightForce = 900
    };
getRow(1702,4)->
    #pet_skills_upgradingCfg {
    skill_id = 1702,
    level = 4,
    item_cost = [13000,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 80,
    des = "一次普通的攻击，造成{a}%攻击的伤害",
    character_a = "580",
    character_b = "",
    character_c = "",
    fightForce = 1500
    };
getRow(1702,5)->
    #pet_skills_upgradingCfg {
    skill_id = 1702,
    level = 5,
    item_cost = [13000,3],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 100,
    des = "一次普通的攻击，造成{a}%攻击的伤害",
    character_a = "640",
    character_b = "",
    character_c = "",
    fightForce = 2400
    };
getRow(1702,6)->
    #pet_skills_upgradingCfg {
    skill_id = 1702,
    level = 6,
    item_cost = [13000,3],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 120,
    des = "一次普通的攻击，造成{a}%攻击的伤害",
    character_a = "700",
    character_b = "",
    character_c = "",
    fightForce = 3300
    };
getRow(1702,7)->
    #pet_skills_upgradingCfg {
    skill_id = 1702,
    level = 7,
    item_cost = [13000,4],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 140,
    des = "一次普通的攻击，造成{a}%攻击的伤害",
    character_a = "760",
    character_b = "",
    character_c = "",
    fightForce = 4500
    };
getRow(1702,8)->
    #pet_skills_upgradingCfg {
    skill_id = 1702,
    level = 8,
    item_cost = [13000,4],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 160,
    des = "一次普通的攻击，造成{a}%攻击的伤害",
    character_a = "820",
    character_b = "",
    character_c = "",
    fightForce = 5700
    };
getRow(1702,9)->
    #pet_skills_upgradingCfg {
    skill_id = 1702,
    level = 9,
    item_cost = [13000,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 180,
    des = "一次普通的攻击，造成{a}%攻击的伤害",
    character_a = "880",
    character_b = "",
    character_c = "",
    fightForce = 7200
    };
getRow(1702,10)->
    #pet_skills_upgradingCfg {
    skill_id = 1702,
    level = 10,
    item_cost = [13000,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 200,
    des = "一次普通的攻击，造成{a}%攻击的伤害",
    character_a = "940",
    character_b = "",
    character_c = "",
    fightForce = 8700
    };
getRow(1702,11)->
    #pet_skills_upgradingCfg {
    skill_id = 1702,
    level = 11,
    item_cost = [13000,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 200,
    des = "一次普通的攻击，造成{a}%攻击的伤害",
    character_a = "1000",
    character_b = "",
    character_c = "",
    fightForce = 10200
    };
getRow(1703,1)->
    #pet_skills_upgradingCfg {
    skill_id = 1703,
    level = 1,
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "一次普通的攻击，造成{a}%攻击的伤害",
    character_a = "400",
    character_b = "",
    character_c = "",
    fightForce = 0
    };
getRow(1703,2)->
    #pet_skills_upgradingCfg {
    skill_id = 1703,
    level = 2,
    item_cost = [13000,1],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 40,
    des = "一次普通的攻击，造成{a}%攻击的伤害",
    character_a = "460",
    character_b = "",
    character_c = "",
    fightForce = 300
    };
getRow(1703,3)->
    #pet_skills_upgradingCfg {
    skill_id = 1703,
    level = 3,
    item_cost = [13000,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 60,
    des = "一次普通的攻击，造成{a}%攻击的伤害",
    character_a = "520",
    character_b = "",
    character_c = "",
    fightForce = 900
    };
getRow(1703,4)->
    #pet_skills_upgradingCfg {
    skill_id = 1703,
    level = 4,
    item_cost = [13000,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 80,
    des = "一次普通的攻击，造成{a}%攻击的伤害",
    character_a = "580",
    character_b = "",
    character_c = "",
    fightForce = 1500
    };
getRow(1703,5)->
    #pet_skills_upgradingCfg {
    skill_id = 1703,
    level = 5,
    item_cost = [13000,3],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 100,
    des = "一次普通的攻击，造成{a}%攻击的伤害",
    character_a = "640",
    character_b = "",
    character_c = "",
    fightForce = 2400
    };
getRow(1703,6)->
    #pet_skills_upgradingCfg {
    skill_id = 1703,
    level = 6,
    item_cost = [13000,3],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 120,
    des = "一次普通的攻击，造成{a}%攻击的伤害",
    character_a = "700",
    character_b = "",
    character_c = "",
    fightForce = 3300
    };
getRow(1703,7)->
    #pet_skills_upgradingCfg {
    skill_id = 1703,
    level = 7,
    item_cost = [13000,4],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 140,
    des = "一次普通的攻击，造成{a}%攻击的伤害",
    character_a = "760",
    character_b = "",
    character_c = "",
    fightForce = 4500
    };
getRow(1703,8)->
    #pet_skills_upgradingCfg {
    skill_id = 1703,
    level = 8,
    item_cost = [13000,4],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 160,
    des = "一次普通的攻击，造成{a}%攻击的伤害",
    character_a = "820",
    character_b = "",
    character_c = "",
    fightForce = 5700
    };
getRow(1703,9)->
    #pet_skills_upgradingCfg {
    skill_id = 1703,
    level = 9,
    item_cost = [13000,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 180,
    des = "一次普通的攻击，造成{a}%攻击的伤害",
    character_a = "880",
    character_b = "",
    character_c = "",
    fightForce = 7200
    };
getRow(1703,10)->
    #pet_skills_upgradingCfg {
    skill_id = 1703,
    level = 10,
    item_cost = [13000,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 200,
    des = "一次普通的攻击，造成{a}%攻击的伤害",
    character_a = "940",
    character_b = "",
    character_c = "",
    fightForce = 8700
    };
getRow(1703,11)->
    #pet_skills_upgradingCfg {
    skill_id = 1703,
    level = 11,
    item_cost = [13000,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 200,
    des = "一次普通的攻击，造成{a}%攻击的伤害",
    character_a = "1000",
    character_b = "",
    character_c = "",
    fightForce = 10200
    };
getRow(1704,1)->
    #pet_skills_upgradingCfg {
    skill_id = 1704,
    level = 1,
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "一次普通的攻击，造成{a}%攻击的伤害",
    character_a = "400",
    character_b = "",
    character_c = "",
    fightForce = 0
    };
getRow(1704,2)->
    #pet_skills_upgradingCfg {
    skill_id = 1704,
    level = 2,
    item_cost = [13000,1],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 40,
    des = "一次普通的攻击，造成{a}%攻击的伤害",
    character_a = "460",
    character_b = "",
    character_c = "",
    fightForce = 300
    };
getRow(1704,3)->
    #pet_skills_upgradingCfg {
    skill_id = 1704,
    level = 3,
    item_cost = [13000,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 60,
    des = "一次普通的攻击，造成{a}%攻击的伤害",
    character_a = "520",
    character_b = "",
    character_c = "",
    fightForce = 900
    };
getRow(1704,4)->
    #pet_skills_upgradingCfg {
    skill_id = 1704,
    level = 4,
    item_cost = [13000,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 80,
    des = "一次普通的攻击，造成{a}%攻击的伤害",
    character_a = "580",
    character_b = "",
    character_c = "",
    fightForce = 1500
    };
getRow(1704,5)->
    #pet_skills_upgradingCfg {
    skill_id = 1704,
    level = 5,
    item_cost = [13000,3],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 100,
    des = "一次普通的攻击，造成{a}%攻击的伤害",
    character_a = "640",
    character_b = "",
    character_c = "",
    fightForce = 2400
    };
getRow(1704,6)->
    #pet_skills_upgradingCfg {
    skill_id = 1704,
    level = 6,
    item_cost = [13000,3],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 120,
    des = "一次普通的攻击，造成{a}%攻击的伤害",
    character_a = "700",
    character_b = "",
    character_c = "",
    fightForce = 3300
    };
getRow(1704,7)->
    #pet_skills_upgradingCfg {
    skill_id = 1704,
    level = 7,
    item_cost = [13000,4],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 140,
    des = "一次普通的攻击，造成{a}%攻击的伤害",
    character_a = "760",
    character_b = "",
    character_c = "",
    fightForce = 4500
    };
getRow(1704,8)->
    #pet_skills_upgradingCfg {
    skill_id = 1704,
    level = 8,
    item_cost = [13000,4],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 160,
    des = "一次普通的攻击，造成{a}%攻击的伤害",
    character_a = "820",
    character_b = "",
    character_c = "",
    fightForce = 5700
    };
getRow(1704,9)->
    #pet_skills_upgradingCfg {
    skill_id = 1704,
    level = 9,
    item_cost = [13000,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 180,
    des = "一次普通的攻击，造成{a}%攻击的伤害",
    character_a = "880",
    character_b = "",
    character_c = "",
    fightForce = 7200
    };
getRow(1704,10)->
    #pet_skills_upgradingCfg {
    skill_id = 1704,
    level = 10,
    item_cost = [13000,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 200,
    des = "一次普通的攻击，造成{a}%攻击的伤害",
    character_a = "940",
    character_b = "",
    character_c = "",
    fightForce = 8700
    };
getRow(1704,11)->
    #pet_skills_upgradingCfg {
    skill_id = 1704,
    level = 11,
    item_cost = [13000,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 200,
    des = "一次普通的攻击，造成{a}%攻击的伤害",
    character_a = "1000",
    character_b = "",
    character_c = "",
    fightForce = 10200
    };
getRow(1736,1)->
    #pet_skills_upgradingCfg {
    skill_id = 1736,
    level = 1,
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "一次普通的攻击，造成{a}%攻击的伤害",
    character_a = "400",
    character_b = "",
    character_c = "",
    fightForce = 0
    };
getRow(1736,2)->
    #pet_skills_upgradingCfg {
    skill_id = 1736,
    level = 2,
    item_cost = [13000,1],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 40,
    des = "一次普通的攻击，造成{a}%攻击的伤害",
    character_a = "460",
    character_b = "",
    character_c = "",
    fightForce = 300
    };
getRow(1736,3)->
    #pet_skills_upgradingCfg {
    skill_id = 1736,
    level = 3,
    item_cost = [13000,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 60,
    des = "一次普通的攻击，造成{a}%攻击的伤害",
    character_a = "520",
    character_b = "",
    character_c = "",
    fightForce = 900
    };
getRow(1736,4)->
    #pet_skills_upgradingCfg {
    skill_id = 1736,
    level = 4,
    item_cost = [13000,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 80,
    des = "一次普通的攻击，造成{a}%攻击的伤害",
    character_a = "580",
    character_b = "",
    character_c = "",
    fightForce = 1500
    };
getRow(1736,5)->
    #pet_skills_upgradingCfg {
    skill_id = 1736,
    level = 5,
    item_cost = [13000,3],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 100,
    des = "一次普通的攻击，造成{a}%攻击的伤害",
    character_a = "640",
    character_b = "",
    character_c = "",
    fightForce = 2400
    };
getRow(1736,6)->
    #pet_skills_upgradingCfg {
    skill_id = 1736,
    level = 6,
    item_cost = [13000,3],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 120,
    des = "一次普通的攻击，造成{a}%攻击的伤害",
    character_a = "700",
    character_b = "",
    character_c = "",
    fightForce = 3300
    };
getRow(1736,7)->
    #pet_skills_upgradingCfg {
    skill_id = 1736,
    level = 7,
    item_cost = [13000,4],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 140,
    des = "一次普通的攻击，造成{a}%攻击的伤害",
    character_a = "760",
    character_b = "",
    character_c = "",
    fightForce = 4500
    };
getRow(1736,8)->
    #pet_skills_upgradingCfg {
    skill_id = 1736,
    level = 8,
    item_cost = [13000,4],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 160,
    des = "一次普通的攻击，造成{a}%攻击的伤害",
    character_a = "820",
    character_b = "",
    character_c = "",
    fightForce = 5700
    };
getRow(1736,9)->
    #pet_skills_upgradingCfg {
    skill_id = 1736,
    level = 9,
    item_cost = [13000,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 180,
    des = "一次普通的攻击，造成{a}%攻击的伤害",
    character_a = "880",
    character_b = "",
    character_c = "",
    fightForce = 7200
    };
getRow(1736,10)->
    #pet_skills_upgradingCfg {
    skill_id = 1736,
    level = 10,
    item_cost = [13000,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 200,
    des = "一次普通的攻击，造成{a}%攻击的伤害",
    character_a = "940",
    character_b = "",
    character_c = "",
    fightForce = 8700
    };
getRow(1736,11)->
    #pet_skills_upgradingCfg {
    skill_id = 1736,
    level = 11,
    item_cost = [13000,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 200,
    des = "一次普通的攻击，造成{a}%攻击的伤害",
    character_a = "1000",
    character_b = "",
    character_c = "",
    fightForce = 10200
    };
getRow(40000,1)->
    #pet_skills_upgradingCfg {
    skill_id = 40000,
    level = 1,
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "杂技大师向前方抛出一个弹弹球，对击中的目标造成{a}%攻击的伤害",
    character_a = "768",
    character_b = "",
    character_c = "",
    fightForce = 0
    };
getRow(40000,2)->
    #pet_skills_upgradingCfg {
    skill_id = 40000,
    level = 2,
    item_cost = [13002,1],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 40,
    des = "杂技大师向前方抛出一个弹弹球，对击中的目标造成{a}%攻击的伤害",
    character_a = "924",
    character_b = "",
    character_c = "",
    fightForce = 1800
    };
getRow(40000,3)->
    #pet_skills_upgradingCfg {
    skill_id = 40000,
    level = 3,
    item_cost = [13002,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 60,
    des = "杂技大师向前方抛出一个弹弹球，对击中的目标造成{a}%攻击的伤害",
    character_a = "1080",
    character_b = "",
    character_c = "",
    fightForce = 5400
    };
getRow(40000,4)->
    #pet_skills_upgradingCfg {
    skill_id = 40000,
    level = 4,
    item_cost = [13002,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 80,
    des = "杂技大师向前方抛出一个弹弹球，对击中的目标造成{a}%攻击的伤害",
    character_a = "1236",
    character_b = "",
    character_c = "",
    fightForce = 9000
    };
getRow(40000,5)->
    #pet_skills_upgradingCfg {
    skill_id = 40000,
    level = 5,
    item_cost = [13002,3],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 100,
    des = "杂技大师向前方抛出一个弹弹球，对击中的目标造成{a}%攻击的伤害",
    character_a = "1392",
    character_b = "",
    character_c = "",
    fightForce = 14400
    };
getRow(40000,6)->
    #pet_skills_upgradingCfg {
    skill_id = 40000,
    level = 6,
    item_cost = [13002,3],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 120,
    des = "杂技大师向前方抛出一个弹弹球，对击中的目标造成{a}%攻击的伤害",
    character_a = "1548",
    character_b = "",
    character_c = "",
    fightForce = 19800
    };
getRow(40000,7)->
    #pet_skills_upgradingCfg {
    skill_id = 40000,
    level = 7,
    item_cost = [13002,4],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 140,
    des = "杂技大师向前方抛出一个弹弹球，对击中的目标造成{a}%攻击的伤害",
    character_a = "1704",
    character_b = "",
    character_c = "",
    fightForce = 27000
    };
getRow(40000,8)->
    #pet_skills_upgradingCfg {
    skill_id = 40000,
    level = 8,
    item_cost = [13002,4],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 160,
    des = "杂技大师向前方抛出一个弹弹球，对击中的目标造成{a}%攻击的伤害",
    character_a = "1860",
    character_b = "",
    character_c = "",
    fightForce = 34200
    };
getRow(40000,9)->
    #pet_skills_upgradingCfg {
    skill_id = 40000,
    level = 9,
    item_cost = [13002,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 180,
    des = "杂技大师向前方抛出一个弹弹球，对击中的目标造成{a}%攻击的伤害",
    character_a = "2016",
    character_b = "",
    character_c = "",
    fightForce = 43200
    };
getRow(40000,10)->
    #pet_skills_upgradingCfg {
    skill_id = 40000,
    level = 10,
    item_cost = [13002,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 200,
    des = "杂技大师向前方抛出一个弹弹球，对击中的目标造成{a}%攻击的伤害",
    character_a = "2172",
    character_b = "",
    character_c = "",
    fightForce = 52200
    };
getRow(40000,11)->
    #pet_skills_upgradingCfg {
    skill_id = 40000,
    level = 11,
    item_cost = [13002,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 200,
    des = "杂技大师向前方抛出一个弹弹球，对击中的目标造成{a}%攻击的伤害",
    character_a = "2328",
    character_b = "",
    character_c = "",
    fightForce = 61200
    };
getRow(40001,1)->
    #pet_skills_upgradingCfg {
    skill_id = 40001,
    level = 1,
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "杂技大师给主人恢复{a}%法术攻击的生命值",
    character_a = "320",
    character_b = "",
    character_c = "",
    fightForce = 0
    };
getRow(40001,2)->
    #pet_skills_upgradingCfg {
    skill_id = 40001,
    level = 2,
    item_cost = [13002,1],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 40,
    des = "杂技大师给主人恢复{a}%法术攻击的生命值",
    character_a = "384",
    character_b = "",
    character_c = "",
    fightForce = 1800
    };
getRow(40001,3)->
    #pet_skills_upgradingCfg {
    skill_id = 40001,
    level = 3,
    item_cost = [13002,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 60,
    des = "杂技大师给主人恢复{a}%法术攻击的生命值",
    character_a = "448",
    character_b = "",
    character_c = "",
    fightForce = 5400
    };
getRow(40001,4)->
    #pet_skills_upgradingCfg {
    skill_id = 40001,
    level = 4,
    item_cost = [13002,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 80,
    des = "杂技大师给主人恢复{a}%法术攻击的生命值",
    character_a = "512",
    character_b = "",
    character_c = "",
    fightForce = 9000
    };
getRow(40001,5)->
    #pet_skills_upgradingCfg {
    skill_id = 40001,
    level = 5,
    item_cost = [13002,3],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 100,
    des = "杂技大师给主人恢复{a}%法术攻击的生命值",
    character_a = "576",
    character_b = "",
    character_c = "",
    fightForce = 14400
    };
getRow(40001,6)->
    #pet_skills_upgradingCfg {
    skill_id = 40001,
    level = 6,
    item_cost = [13002,3],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 120,
    des = "杂技大师给主人恢复{a}%法术攻击的生命值",
    character_a = "640",
    character_b = "",
    character_c = "",
    fightForce = 19800
    };
getRow(40001,7)->
    #pet_skills_upgradingCfg {
    skill_id = 40001,
    level = 7,
    item_cost = [13002,4],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 140,
    des = "杂技大师给主人恢复{a}%法术攻击的生命值",
    character_a = "704",
    character_b = "",
    character_c = "",
    fightForce = 27000
    };
getRow(40001,8)->
    #pet_skills_upgradingCfg {
    skill_id = 40001,
    level = 8,
    item_cost = [13002,4],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 160,
    des = "杂技大师给主人恢复{a}%法术攻击的生命值",
    character_a = "768",
    character_b = "",
    character_c = "",
    fightForce = 34200
    };
getRow(40001,9)->
    #pet_skills_upgradingCfg {
    skill_id = 40001,
    level = 9,
    item_cost = [13002,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 180,
    des = "杂技大师给主人恢复{a}%法术攻击的生命值",
    character_a = "832",
    character_b = "",
    character_c = "",
    fightForce = 43200
    };
getRow(40001,10)->
    #pet_skills_upgradingCfg {
    skill_id = 40001,
    level = 10,
    item_cost = [13002,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 200,
    des = "杂技大师给主人恢复{a}%法术攻击的生命值",
    character_a = "896",
    character_b = "",
    character_c = "",
    fightForce = 52200
    };
getRow(40001,11)->
    #pet_skills_upgradingCfg {
    skill_id = 40001,
    level = 11,
    item_cost = [13002,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 200,
    des = "杂技大师给主人恢复{a}%法术攻击的生命值",
    character_a = "960",
    character_b = "",
    character_c = "",
    fightForce = 61200
    };
getRow(40002,1)->
    #pet_skills_upgradingCfg {
    skill_id = 40002,
    level = 1,
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "杂技大师给自己和主人每秒恢复自身法术攻击{a}%的生命值，持续{c}秒",
    character_a = "96",
    character_b = "",
    character_c = "3",
    fightForce = 0
    };
getRow(40002,2)->
    #pet_skills_upgradingCfg {
    skill_id = 40002,
    level = 2,
    item_cost = [13002,1],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 40,
    des = "杂技大师给自己和主人每秒恢复自身法术攻击{a}%的生命值，持续{c}秒",
    character_a = "115",
    character_b = "",
    character_c = "3",
    fightForce = 1800
    };
getRow(40002,3)->
    #pet_skills_upgradingCfg {
    skill_id = 40002,
    level = 3,
    item_cost = [13002,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 60,
    des = "杂技大师给自己和主人每秒恢复自身法术攻击{a}%的生命值，持续{c}秒",
    character_a = "134",
    character_b = "",
    character_c = "3",
    fightForce = 5400
    };
getRow(40002,4)->
    #pet_skills_upgradingCfg {
    skill_id = 40002,
    level = 4,
    item_cost = [13002,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 80,
    des = "杂技大师给自己和主人每秒恢复自身法术攻击{a}%的生命值，持续{c}秒",
    character_a = "153",
    character_b = "",
    character_c = "3",
    fightForce = 9000
    };
getRow(40002,5)->
    #pet_skills_upgradingCfg {
    skill_id = 40002,
    level = 5,
    item_cost = [13002,3],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 100,
    des = "杂技大师给自己和主人每秒恢复自身法术攻击{a}%的生命值，持续{c}秒",
    character_a = "172",
    character_b = "",
    character_c = "3",
    fightForce = 14400
    };
getRow(40002,6)->
    #pet_skills_upgradingCfg {
    skill_id = 40002,
    level = 6,
    item_cost = [13002,3],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 120,
    des = "杂技大师给自己和主人每秒恢复自身法术攻击{a}%的生命值，持续{c}秒",
    character_a = "191",
    character_b = "",
    character_c = "3",
    fightForce = 19800
    };
getRow(40002,7)->
    #pet_skills_upgradingCfg {
    skill_id = 40002,
    level = 7,
    item_cost = [13002,4],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 140,
    des = "杂技大师给自己和主人每秒恢复自身法术攻击{a}%的生命值，持续{c}秒",
    character_a = "210",
    character_b = "",
    character_c = "3",
    fightForce = 27000
    };
getRow(40002,8)->
    #pet_skills_upgradingCfg {
    skill_id = 40002,
    level = 8,
    item_cost = [13002,4],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 160,
    des = "杂技大师给自己和主人每秒恢复自身法术攻击{a}%的生命值，持续{c}秒",
    character_a = "229",
    character_b = "",
    character_c = "3",
    fightForce = 34200
    };
getRow(40002,9)->
    #pet_skills_upgradingCfg {
    skill_id = 40002,
    level = 9,
    item_cost = [13002,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 180,
    des = "杂技大师给自己和主人每秒恢复自身法术攻击{a}%的生命值，持续{c}秒",
    character_a = "248",
    character_b = "",
    character_c = "3",
    fightForce = 43200
    };
getRow(40002,10)->
    #pet_skills_upgradingCfg {
    skill_id = 40002,
    level = 10,
    item_cost = [13002,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 200,
    des = "杂技大师给自己和主人每秒恢复自身法术攻击{a}%的生命值，持续{c}秒",
    character_a = "267",
    character_b = "",
    character_c = "3",
    fightForce = 52200
    };
getRow(40002,11)->
    #pet_skills_upgradingCfg {
    skill_id = 40002,
    level = 11,
    item_cost = [13002,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 200,
    des = "杂技大师给自己和主人每秒恢复自身法术攻击{a}%的生命值，持续{c}秒",
    character_a = "286",
    character_b = "",
    character_c = "3",
    fightForce = 61200
    };
getRow(40010,1)->
    #pet_skills_upgradingCfg {
    skill_id = 40010,
    level = 1,
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "贾斯汀比象甩了下它迷人的长鼻，对前方15米的目标造成{a}%攻击的伤害",
    character_a = "640",
    character_b = "",
    character_c = "",
    fightForce = 0
    };
getRow(40010,2)->
    #pet_skills_upgradingCfg {
    skill_id = 40010,
    level = 2,
    item_cost = [13002,1],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 40,
    des = "贾斯汀比象甩了下它迷人的长鼻，对前方15米的目标造成{a}%攻击的伤害",
    character_a = "770",
    character_b = "",
    character_c = "",
    fightForce = 1800
    };
getRow(40010,3)->
    #pet_skills_upgradingCfg {
    skill_id = 40010,
    level = 3,
    item_cost = [13002,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 60,
    des = "贾斯汀比象甩了下它迷人的长鼻，对前方15米的目标造成{a}%攻击的伤害",
    character_a = "900",
    character_b = "",
    character_c = "",
    fightForce = 5400
    };
getRow(40010,4)->
    #pet_skills_upgradingCfg {
    skill_id = 40010,
    level = 4,
    item_cost = [13002,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 80,
    des = "贾斯汀比象甩了下它迷人的长鼻，对前方15米的目标造成{a}%攻击的伤害",
    character_a = "1030",
    character_b = "",
    character_c = "",
    fightForce = 9000
    };
getRow(40010,5)->
    #pet_skills_upgradingCfg {
    skill_id = 40010,
    level = 5,
    item_cost = [13002,3],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 100,
    des = "贾斯汀比象甩了下它迷人的长鼻，对前方15米的目标造成{a}%攻击的伤害",
    character_a = "1160",
    character_b = "",
    character_c = "",
    fightForce = 14400
    };
getRow(40010,6)->
    #pet_skills_upgradingCfg {
    skill_id = 40010,
    level = 6,
    item_cost = [13002,3],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 120,
    des = "贾斯汀比象甩了下它迷人的长鼻，对前方15米的目标造成{a}%攻击的伤害",
    character_a = "1290",
    character_b = "",
    character_c = "",
    fightForce = 19800
    };
getRow(40010,7)->
    #pet_skills_upgradingCfg {
    skill_id = 40010,
    level = 7,
    item_cost = [13002,4],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 140,
    des = "贾斯汀比象甩了下它迷人的长鼻，对前方15米的目标造成{a}%攻击的伤害",
    character_a = "1420",
    character_b = "",
    character_c = "",
    fightForce = 27000
    };
getRow(40010,8)->
    #pet_skills_upgradingCfg {
    skill_id = 40010,
    level = 8,
    item_cost = [13002,4],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 160,
    des = "贾斯汀比象甩了下它迷人的长鼻，对前方15米的目标造成{a}%攻击的伤害",
    character_a = "1550",
    character_b = "",
    character_c = "",
    fightForce = 34200
    };
getRow(40010,9)->
    #pet_skills_upgradingCfg {
    skill_id = 40010,
    level = 9,
    item_cost = [13002,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 180,
    des = "贾斯汀比象甩了下它迷人的长鼻，对前方15米的目标造成{a}%攻击的伤害",
    character_a = "1680",
    character_b = "",
    character_c = "",
    fightForce = 43200
    };
getRow(40010,10)->
    #pet_skills_upgradingCfg {
    skill_id = 40010,
    level = 10,
    item_cost = [13002,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 200,
    des = "贾斯汀比象甩了下它迷人的长鼻，对前方15米的目标造成{a}%攻击的伤害",
    character_a = "1810",
    character_b = "",
    character_c = "",
    fightForce = 52200
    };
getRow(40010,11)->
    #pet_skills_upgradingCfg {
    skill_id = 40010,
    level = 11,
    item_cost = [13002,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 200,
    des = "贾斯汀比象甩了下它迷人的长鼻，对前方15米的目标造成{a}%攻击的伤害",
    character_a = "1940",
    character_b = "",
    character_c = "",
    fightForce = 61200
    };
getRow(40011,1)->
    #pet_skills_upgradingCfg {
    skill_id = 40011,
    level = 1,
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "贾斯汀抛出礼帽，将前方30米目标吸引到自己身边，造成{a}%攻击的伤害且迷晕{c}秒",
    character_a = "448",
    character_b = "",
    character_c = "1",
    fightForce = 0
    };
getRow(40011,2)->
    #pet_skills_upgradingCfg {
    skill_id = 40011,
    level = 2,
    item_cost = [13002,1],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 40,
    des = "贾斯汀抛出礼帽，将前方30米目标吸引到自己身边，造成{a}%攻击的伤害且迷晕{c}秒",
    character_a = "538",
    character_b = "",
    character_c = "1",
    fightForce = 1800
    };
getRow(40011,3)->
    #pet_skills_upgradingCfg {
    skill_id = 40011,
    level = 3,
    item_cost = [13002,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 60,
    des = "贾斯汀抛出礼帽，将前方30米目标吸引到自己身边，造成{a}%攻击的伤害且迷晕{c}秒",
    character_a = "628",
    character_b = "",
    character_c = "1",
    fightForce = 5400
    };
getRow(40011,4)->
    #pet_skills_upgradingCfg {
    skill_id = 40011,
    level = 4,
    item_cost = [13002,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 80,
    des = "贾斯汀抛出礼帽，将前方30米目标吸引到自己身边，造成{a}%攻击的伤害且迷晕{c}秒",
    character_a = "718",
    character_b = "",
    character_c = "1",
    fightForce = 9000
    };
getRow(40011,5)->
    #pet_skills_upgradingCfg {
    skill_id = 40011,
    level = 5,
    item_cost = [13002,3],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 100,
    des = "贾斯汀抛出礼帽，将前方30米目标吸引到自己身边，造成{a}%攻击的伤害且迷晕{c}秒",
    character_a = "808",
    character_b = "",
    character_c = "1",
    fightForce = 14400
    };
getRow(40011,6)->
    #pet_skills_upgradingCfg {
    skill_id = 40011,
    level = 6,
    item_cost = [13002,3],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 120,
    des = "贾斯汀抛出礼帽，将前方30米目标吸引到自己身边，造成{a}%攻击的伤害且迷晕{c}秒",
    character_a = "898",
    character_b = "",
    character_c = "1",
    fightForce = 19800
    };
getRow(40011,7)->
    #pet_skills_upgradingCfg {
    skill_id = 40011,
    level = 7,
    item_cost = [13002,4],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 140,
    des = "贾斯汀抛出礼帽，将前方30米目标吸引到自己身边，造成{a}%攻击的伤害且迷晕{c}秒",
    character_a = "988",
    character_b = "",
    character_c = "1",
    fightForce = 27000
    };
getRow(40011,8)->
    #pet_skills_upgradingCfg {
    skill_id = 40011,
    level = 8,
    item_cost = [13002,4],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 160,
    des = "贾斯汀抛出礼帽，将前方30米目标吸引到自己身边，造成{a}%攻击的伤害且迷晕{c}秒",
    character_a = "1078",
    character_b = "",
    character_c = "1",
    fightForce = 34200
    };
getRow(40011,9)->
    #pet_skills_upgradingCfg {
    skill_id = 40011,
    level = 9,
    item_cost = [13002,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 180,
    des = "贾斯汀抛出礼帽，将前方30米目标吸引到自己身边，造成{a}%攻击的伤害且迷晕{c}秒",
    character_a = "1168",
    character_b = "",
    character_c = "1",
    fightForce = 43200
    };
getRow(40011,10)->
    #pet_skills_upgradingCfg {
    skill_id = 40011,
    level = 10,
    item_cost = [13002,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 200,
    des = "贾斯汀抛出礼帽，将前方30米目标吸引到自己身边，造成{a}%攻击的伤害且迷晕{c}秒",
    character_a = "1258",
    character_b = "",
    character_c = "1",
    fightForce = 52200
    };
getRow(40011,11)->
    #pet_skills_upgradingCfg {
    skill_id = 40011,
    level = 11,
    item_cost = [13002,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 200,
    des = "贾斯汀抛出礼帽，将前方30米目标吸引到自己身边，造成{a}%攻击的伤害且迷晕{c}秒",
    character_a = "1348",
    character_b = "",
    character_c = "1",
    fightForce = 61200
    };
getRow(40012,1)->
    #pet_skills_upgradingCfg {
    skill_id = 40012,
    level = 1,
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "贾斯汀展现自己的超人气偶像魅力，回眸一笑，对前方15米的目标造成{a}%攻击的伤害，且迷晕{c}秒",
    character_a = "538",
    character_b = "",
    character_c = "1",
    fightForce = 0
    };
getRow(40012,2)->
    #pet_skills_upgradingCfg {
    skill_id = 40012,
    level = 2,
    item_cost = [13002,1],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 40,
    des = "贾斯汀展现自己的超人气偶像魅力，回眸一笑，对前方15米的目标造成{a}%攻击的伤害，且迷晕{c}秒",
    character_a = "644",
    character_b = "",
    character_c = "1",
    fightForce = 1800
    };
getRow(40012,3)->
    #pet_skills_upgradingCfg {
    skill_id = 40012,
    level = 3,
    item_cost = [13002,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 60,
    des = "贾斯汀展现自己的超人气偶像魅力，回眸一笑，对前方15米的目标造成{a}%攻击的伤害，且迷晕{c}秒",
    character_a = "750",
    character_b = "",
    character_c = "1",
    fightForce = 5400
    };
getRow(40012,4)->
    #pet_skills_upgradingCfg {
    skill_id = 40012,
    level = 4,
    item_cost = [13002,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 80,
    des = "贾斯汀展现自己的超人气偶像魅力，回眸一笑，对前方15米的目标造成{a}%攻击的伤害，且迷晕{c}秒",
    character_a = "856",
    character_b = "",
    character_c = "1",
    fightForce = 9000
    };
getRow(40012,5)->
    #pet_skills_upgradingCfg {
    skill_id = 40012,
    level = 5,
    item_cost = [13002,3],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 100,
    des = "贾斯汀展现自己的超人气偶像魅力，回眸一笑，对前方15米的目标造成{a}%攻击的伤害，且迷晕{c}秒",
    character_a = "962",
    character_b = "",
    character_c = "1",
    fightForce = 14400
    };
getRow(40012,6)->
    #pet_skills_upgradingCfg {
    skill_id = 40012,
    level = 6,
    item_cost = [13002,3],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 120,
    des = "贾斯汀展现自己的超人气偶像魅力，回眸一笑，对前方15米的目标造成{a}%攻击的伤害，且迷晕{c}秒",
    character_a = "1068",
    character_b = "",
    character_c = "1",
    fightForce = 19800
    };
getRow(40012,7)->
    #pet_skills_upgradingCfg {
    skill_id = 40012,
    level = 7,
    item_cost = [13002,4],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 140,
    des = "贾斯汀展现自己的超人气偶像魅力，回眸一笑，对前方15米的目标造成{a}%攻击的伤害，且迷晕{c}秒",
    character_a = "1174",
    character_b = "",
    character_c = "1",
    fightForce = 27000
    };
getRow(40012,8)->
    #pet_skills_upgradingCfg {
    skill_id = 40012,
    level = 8,
    item_cost = [13002,4],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 160,
    des = "贾斯汀展现自己的超人气偶像魅力，回眸一笑，对前方15米的目标造成{a}%攻击的伤害，且迷晕{c}秒",
    character_a = "1280",
    character_b = "",
    character_c = "1",
    fightForce = 34200
    };
getRow(40012,9)->
    #pet_skills_upgradingCfg {
    skill_id = 40012,
    level = 9,
    item_cost = [13002,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 180,
    des = "贾斯汀展现自己的超人气偶像魅力，回眸一笑，对前方15米的目标造成{a}%攻击的伤害，且迷晕{c}秒",
    character_a = "1386",
    character_b = "",
    character_c = "1",
    fightForce = 43200
    };
getRow(40012,10)->
    #pet_skills_upgradingCfg {
    skill_id = 40012,
    level = 10,
    item_cost = [13002,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 200,
    des = "贾斯汀展现自己的超人气偶像魅力，回眸一笑，对前方15米的目标造成{a}%攻击的伤害，且迷晕{c}秒",
    character_a = "1492",
    character_b = "",
    character_c = "1",
    fightForce = 52200
    };
getRow(40012,11)->
    #pet_skills_upgradingCfg {
    skill_id = 40012,
    level = 11,
    item_cost = [13002,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 200,
    des = "贾斯汀展现自己的超人气偶像魅力，回眸一笑，对前方15米的目标造成{a}%攻击的伤害，且迷晕{c}秒",
    character_a = "1598",
    character_b = "",
    character_c = "1",
    fightForce = 61200
    };
getRow(40020,1)->
    #pet_skills_upgradingCfg {
    skill_id = 40020,
    level = 1,
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "杀象特面对敌人的流言蜚语异常愤怒，对前方扇形范围的敌人 造成{a}%攻击的伤害",
    character_a = "640",
    character_b = "",
    character_c = "",
    fightForce = 0
    };
getRow(40020,2)->
    #pet_skills_upgradingCfg {
    skill_id = 40020,
    level = 2,
    item_cost = [13001,1],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 40,
    des = "杀象特面对敌人的流言蜚语异常愤怒，对前方扇形范围的敌人 造成{a}%攻击的伤害",
    character_a = "750",
    character_b = "",
    character_c = "",
    fightForce = 900
    };
getRow(40020,3)->
    #pet_skills_upgradingCfg {
    skill_id = 40020,
    level = 3,
    item_cost = [13001,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 60,
    des = "杀象特面对敌人的流言蜚语异常愤怒，对前方扇形范围的敌人 造成{a}%攻击的伤害",
    character_a = "860",
    character_b = "",
    character_c = "",
    fightForce = 2700
    };
getRow(40020,4)->
    #pet_skills_upgradingCfg {
    skill_id = 40020,
    level = 4,
    item_cost = [13001,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 80,
    des = "杀象特面对敌人的流言蜚语异常愤怒，对前方扇形范围的敌人 造成{a}%攻击的伤害",
    character_a = "970",
    character_b = "",
    character_c = "",
    fightForce = 4500
    };
getRow(40020,5)->
    #pet_skills_upgradingCfg {
    skill_id = 40020,
    level = 5,
    item_cost = [13001,3],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 100,
    des = "杀象特面对敌人的流言蜚语异常愤怒，对前方扇形范围的敌人 造成{a}%攻击的伤害",
    character_a = "1080",
    character_b = "",
    character_c = "",
    fightForce = 7200
    };
getRow(40020,6)->
    #pet_skills_upgradingCfg {
    skill_id = 40020,
    level = 6,
    item_cost = [13001,3],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 120,
    des = "杀象特面对敌人的流言蜚语异常愤怒，对前方扇形范围的敌人 造成{a}%攻击的伤害",
    character_a = "1190",
    character_b = "",
    character_c = "",
    fightForce = 9900
    };
getRow(40020,7)->
    #pet_skills_upgradingCfg {
    skill_id = 40020,
    level = 7,
    item_cost = [13001,4],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 140,
    des = "杀象特面对敌人的流言蜚语异常愤怒，对前方扇形范围的敌人 造成{a}%攻击的伤害",
    character_a = "1300",
    character_b = "",
    character_c = "",
    fightForce = 13500
    };
getRow(40020,8)->
    #pet_skills_upgradingCfg {
    skill_id = 40020,
    level = 8,
    item_cost = [13001,4],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 160,
    des = "杀象特面对敌人的流言蜚语异常愤怒，对前方扇形范围的敌人 造成{a}%攻击的伤害",
    character_a = "1410",
    character_b = "",
    character_c = "",
    fightForce = 17100
    };
getRow(40020,9)->
    #pet_skills_upgradingCfg {
    skill_id = 40020,
    level = 9,
    item_cost = [13001,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 180,
    des = "杀象特面对敌人的流言蜚语异常愤怒，对前方扇形范围的敌人 造成{a}%攻击的伤害",
    character_a = "1520",
    character_b = "",
    character_c = "",
    fightForce = 21600
    };
getRow(40020,10)->
    #pet_skills_upgradingCfg {
    skill_id = 40020,
    level = 10,
    item_cost = [13001,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 200,
    des = "杀象特面对敌人的流言蜚语异常愤怒，对前方扇形范围的敌人 造成{a}%攻击的伤害",
    character_a = "1630",
    character_b = "",
    character_c = "",
    fightForce = 26100
    };
getRow(40020,11)->
    #pet_skills_upgradingCfg {
    skill_id = 40020,
    level = 11,
    item_cost = [13001,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 200,
    des = "杀象特面对敌人的流言蜚语异常愤怒，对前方扇形范围的敌人 造成{a}%攻击的伤害",
    character_a = "1740",
    character_b = "",
    character_c = "",
    fightForce = 30600
    };
getRow(40022,1)->
    #pet_skills_upgradingCfg {
    skill_id = 40022,
    level = 1,
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "杀象特藏着一个秘密，而每次被敌人攻击，这个秘密都会使他愤怒。对前方扇形范围的敌人造成{a}%攻击的伤害。怪物将受到2次伤害。",
    character_a = "392",
    character_b = "",
    character_c = "",
    fightForce = 0
    };
getRow(40022,2)->
    #pet_skills_upgradingCfg {
    skill_id = 40022,
    level = 2,
    item_cost = [13001,1],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 40,
    des = "杀象特藏着一个秘密，而每次被敌人攻击，这个秘密都会使他愤怒。对前方扇形范围的敌人造成{a}%攻击的伤害。怪物将受到2次伤害。",
    character_a = "461",
    character_b = "",
    character_c = "",
    fightForce = 900
    };
getRow(40022,3)->
    #pet_skills_upgradingCfg {
    skill_id = 40022,
    level = 3,
    item_cost = [13001,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 60,
    des = "杀象特藏着一个秘密，而每次被敌人攻击，这个秘密都会使他愤怒。对前方扇形范围的敌人造成{a}%攻击的伤害。怪物将受到2次伤害。",
    character_a = "530",
    character_b = "",
    character_c = "",
    fightForce = 2700
    };
getRow(40022,4)->
    #pet_skills_upgradingCfg {
    skill_id = 40022,
    level = 4,
    item_cost = [13001,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 80,
    des = "杀象特藏着一个秘密，而每次被敌人攻击，这个秘密都会使他愤怒。对前方扇形范围的敌人造成{a}%攻击的伤害。怪物将受到2次伤害。",
    character_a = "599",
    character_b = "",
    character_c = "",
    fightForce = 4500
    };
getRow(40022,5)->
    #pet_skills_upgradingCfg {
    skill_id = 40022,
    level = 5,
    item_cost = [13001,3],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 100,
    des = "杀象特藏着一个秘密，而每次被敌人攻击，这个秘密都会使他愤怒。对前方扇形范围的敌人造成{a}%攻击的伤害。怪物将受到2次伤害。",
    character_a = "668",
    character_b = "",
    character_c = "",
    fightForce = 7200
    };
getRow(40022,6)->
    #pet_skills_upgradingCfg {
    skill_id = 40022,
    level = 6,
    item_cost = [13001,3],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 120,
    des = "杀象特藏着一个秘密，而每次被敌人攻击，这个秘密都会使他愤怒。对前方扇形范围的敌人造成{a}%攻击的伤害。怪物将受到2次伤害。",
    character_a = "737",
    character_b = "",
    character_c = "",
    fightForce = 9900
    };
getRow(40022,7)->
    #pet_skills_upgradingCfg {
    skill_id = 40022,
    level = 7,
    item_cost = [13001,4],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 140,
    des = "杀象特藏着一个秘密，而每次被敌人攻击，这个秘密都会使他愤怒。对前方扇形范围的敌人造成{a}%攻击的伤害。怪物将受到2次伤害。",
    character_a = "806",
    character_b = "",
    character_c = "",
    fightForce = 13500
    };
getRow(40022,8)->
    #pet_skills_upgradingCfg {
    skill_id = 40022,
    level = 8,
    item_cost = [13001,4],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 160,
    des = "杀象特藏着一个秘密，而每次被敌人攻击，这个秘密都会使他愤怒。对前方扇形范围的敌人造成{a}%攻击的伤害。怪物将受到2次伤害。",
    character_a = "875",
    character_b = "",
    character_c = "",
    fightForce = 17100
    };
getRow(40022,9)->
    #pet_skills_upgradingCfg {
    skill_id = 40022,
    level = 9,
    item_cost = [13001,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 180,
    des = "杀象特藏着一个秘密，而每次被敌人攻击，这个秘密都会使他愤怒。对前方扇形范围的敌人造成{a}%攻击的伤害。怪物将受到2次伤害。",
    character_a = "944",
    character_b = "",
    character_c = "",
    fightForce = 21600
    };
getRow(40022,10)->
    #pet_skills_upgradingCfg {
    skill_id = 40022,
    level = 10,
    item_cost = [13001,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 200,
    des = "杀象特藏着一个秘密，而每次被敌人攻击，这个秘密都会使他愤怒。对前方扇形范围的敌人造成{a}%攻击的伤害。怪物将受到2次伤害。",
    character_a = "1013",
    character_b = "",
    character_c = "",
    fightForce = 26100
    };
getRow(40022,11)->
    #pet_skills_upgradingCfg {
    skill_id = 40022,
    level = 11,
    item_cost = [13001,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 200,
    des = "杀象特藏着一个秘密，而每次被敌人攻击，这个秘密都会使他愤怒。对前方扇形范围的敌人造成{a}%攻击的伤害。怪物将受到2次伤害。",
    character_a = "1082",
    character_b = "",
    character_c = "",
    fightForce = 30600
    };
getRow(40024,1)->
    #pet_skills_upgradingCfg {
    skill_id = 40024,
    level = 1,
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "杀象特带上绿色光环，光环作用下将反弹15%其所受伤害，持续{c}秒",
    character_a = "960",
    character_b = "",
    character_c = "3",
    fightForce = 0
    };
getRow(40024,2)->
    #pet_skills_upgradingCfg {
    skill_id = 40024,
    level = 2,
    item_cost = [13001,1],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 40,
    des = "杀象特带上绿色光环，光环作用下将反弹15%其所受伤害，持续{c}秒",
    character_a = "1130",
    character_b = "",
    character_c = "3.7",
    fightForce = 900
    };
getRow(40024,3)->
    #pet_skills_upgradingCfg {
    skill_id = 40024,
    level = 3,
    item_cost = [13001,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 60,
    des = "杀象特带上绿色光环，光环作用下将反弹15%其所受伤害，持续{c}秒",
    character_a = "1300",
    character_b = "",
    character_c = "4.4",
    fightForce = 2700
    };
getRow(40024,4)->
    #pet_skills_upgradingCfg {
    skill_id = 40024,
    level = 4,
    item_cost = [13001,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 80,
    des = "杀象特带上绿色光环，光环作用下将反弹15%其所受伤害，持续{c}秒",
    character_a = "1470",
    character_b = "",
    character_c = "5.1",
    fightForce = 4500
    };
getRow(40024,5)->
    #pet_skills_upgradingCfg {
    skill_id = 40024,
    level = 5,
    item_cost = [13001,3],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 100,
    des = "杀象特带上绿色光环，光环作用下将反弹15%其所受伤害，持续{c}秒",
    character_a = "1640",
    character_b = "",
    character_c = "5.8",
    fightForce = 7200
    };
getRow(40024,6)->
    #pet_skills_upgradingCfg {
    skill_id = 40024,
    level = 6,
    item_cost = [13001,3],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 120,
    des = "杀象特带上绿色光环，光环作用下将反弹15%其所受伤害，持续{c}秒",
    character_a = "1810",
    character_b = "",
    character_c = "6.5",
    fightForce = 9900
    };
getRow(40024,7)->
    #pet_skills_upgradingCfg {
    skill_id = 40024,
    level = 7,
    item_cost = [13001,4],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 140,
    des = "杀象特带上绿色光环，光环作用下将反弹15%其所受伤害，持续{c}秒",
    character_a = "1980",
    character_b = "",
    character_c = "7.2",
    fightForce = 13500
    };
getRow(40024,8)->
    #pet_skills_upgradingCfg {
    skill_id = 40024,
    level = 8,
    item_cost = [13001,4],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 160,
    des = "杀象特带上绿色光环，光环作用下将反弹15%其所受伤害，持续{c}秒",
    character_a = "2150",
    character_b = "",
    character_c = "7.9",
    fightForce = 17100
    };
getRow(40024,9)->
    #pet_skills_upgradingCfg {
    skill_id = 40024,
    level = 9,
    item_cost = [13001,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 180,
    des = "杀象特带上绿色光环，光环作用下将反弹15%其所受伤害，持续{c}秒",
    character_a = "2320",
    character_b = "",
    character_c = "8.6",
    fightForce = 21600
    };
getRow(40024,10)->
    #pet_skills_upgradingCfg {
    skill_id = 40024,
    level = 10,
    item_cost = [13001,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 200,
    des = "杀象特带上绿色光环，光环作用下将反弹15%其所受伤害，持续{c}秒",
    character_a = "2490",
    character_b = "",
    character_c = "9.3",
    fightForce = 26100
    };
getRow(40024,11)->
    #pet_skills_upgradingCfg {
    skill_id = 40024,
    level = 11,
    item_cost = [13001,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 200,
    des = "杀象特带上绿色光环，光环作用下将反弹15%其所受伤害，持续{c}秒",
    character_a = "2660",
    character_b = "",
    character_c = "10",
    fightForce = 30600
    };
getRow(40030,1)->
    #pet_skills_upgradingCfg {
    skill_id = 40030,
    level = 1,
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "机械鸟对前方少数目标进行攻击，总共造成{a}%攻击的伤害",
    character_a = "608",
    character_b = "",
    character_c = "",
    fightForce = 0
    };
getRow(40030,2)->
    #pet_skills_upgradingCfg {
    skill_id = 40030,
    level = 2,
    item_cost = [13002,1],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 40,
    des = "机械鸟对前方少数目标进行攻击，总共造成{a}%攻击的伤害",
    character_a = "732",
    character_b = "",
    character_c = "",
    fightForce = 1800
    };
getRow(40030,3)->
    #pet_skills_upgradingCfg {
    skill_id = 40030,
    level = 3,
    item_cost = [13002,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 60,
    des = "机械鸟对前方少数目标进行攻击，总共造成{a}%攻击的伤害",
    character_a = "856",
    character_b = "",
    character_c = "",
    fightForce = 5400
    };
getRow(40030,4)->
    #pet_skills_upgradingCfg {
    skill_id = 40030,
    level = 4,
    item_cost = [13002,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 80,
    des = "机械鸟对前方少数目标进行攻击，总共造成{a}%攻击的伤害",
    character_a = "980",
    character_b = "",
    character_c = "",
    fightForce = 9000
    };
getRow(40030,5)->
    #pet_skills_upgradingCfg {
    skill_id = 40030,
    level = 5,
    item_cost = [13002,3],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 100,
    des = "机械鸟对前方少数目标进行攻击，总共造成{a}%攻击的伤害",
    character_a = "1104",
    character_b = "",
    character_c = "",
    fightForce = 14400
    };
getRow(40030,6)->
    #pet_skills_upgradingCfg {
    skill_id = 40030,
    level = 6,
    item_cost = [13002,3],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 120,
    des = "机械鸟对前方少数目标进行攻击，总共造成{a}%攻击的伤害",
    character_a = "1228",
    character_b = "",
    character_c = "",
    fightForce = 19800
    };
getRow(40030,7)->
    #pet_skills_upgradingCfg {
    skill_id = 40030,
    level = 7,
    item_cost = [13002,4],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 140,
    des = "机械鸟对前方少数目标进行攻击，总共造成{a}%攻击的伤害",
    character_a = "1352",
    character_b = "",
    character_c = "",
    fightForce = 27000
    };
getRow(40030,8)->
    #pet_skills_upgradingCfg {
    skill_id = 40030,
    level = 8,
    item_cost = [13002,4],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 160,
    des = "机械鸟对前方少数目标进行攻击，总共造成{a}%攻击的伤害",
    character_a = "1476",
    character_b = "",
    character_c = "",
    fightForce = 34200
    };
getRow(40030,9)->
    #pet_skills_upgradingCfg {
    skill_id = 40030,
    level = 9,
    item_cost = [13002,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 180,
    des = "机械鸟对前方少数目标进行攻击，总共造成{a}%攻击的伤害",
    character_a = "1600",
    character_b = "",
    character_c = "",
    fightForce = 43200
    };
getRow(40030,10)->
    #pet_skills_upgradingCfg {
    skill_id = 40030,
    level = 10,
    item_cost = [13002,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 200,
    des = "机械鸟对前方少数目标进行攻击，总共造成{a}%攻击的伤害",
    character_a = "1724",
    character_b = "",
    character_c = "",
    fightForce = 52200
    };
getRow(40030,11)->
    #pet_skills_upgradingCfg {
    skill_id = 40030,
    level = 11,
    item_cost = [13002,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 200,
    des = "机械鸟对前方少数目标进行攻击，总共造成{a}%攻击的伤害",
    character_a = "1848",
    character_b = "",
    character_c = "",
    fightForce = 61200
    };
getRow(40031,1)->
    #pet_skills_upgradingCfg {
    skill_id = 40031,
    level = 1,
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "机械鸟与生俱来的灵敏结合机械的坚韧，使其物理防御提升{b}%",
    character_a = "760",
    character_b = "40",
    character_c = "5",
    fightForce = 0
    };
getRow(40031,2)->
    #pet_skills_upgradingCfg {
    skill_id = 40031,
    level = 2,
    item_cost = [13002,1],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 40,
    des = "机械鸟与生俱来的灵敏结合机械的坚韧，使其物理防御提升{b}%",
    character_a = "912",
    character_b = "44",
    character_c = "5",
    fightForce = 1800
    };
getRow(40031,3)->
    #pet_skills_upgradingCfg {
    skill_id = 40031,
    level = 3,
    item_cost = [13002,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 60,
    des = "机械鸟与生俱来的灵敏结合机械的坚韧，使其物理防御提升{b}%",
    character_a = "1064",
    character_b = "48",
    character_c = "5",
    fightForce = 5400
    };
getRow(40031,4)->
    #pet_skills_upgradingCfg {
    skill_id = 40031,
    level = 4,
    item_cost = [13002,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 80,
    des = "机械鸟与生俱来的灵敏结合机械的坚韧，使其物理防御提升{b}%",
    character_a = "1216",
    character_b = "52",
    character_c = "5",
    fightForce = 9000
    };
getRow(40031,5)->
    #pet_skills_upgradingCfg {
    skill_id = 40031,
    level = 5,
    item_cost = [13002,3],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 100,
    des = "机械鸟与生俱来的灵敏结合机械的坚韧，使其物理防御提升{b}%",
    character_a = "1368",
    character_b = "56",
    character_c = "5",
    fightForce = 14400
    };
getRow(40031,6)->
    #pet_skills_upgradingCfg {
    skill_id = 40031,
    level = 6,
    item_cost = [13002,3],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 120,
    des = "机械鸟与生俱来的灵敏结合机械的坚韧，使其物理防御提升{b}%",
    character_a = "1520",
    character_b = "60",
    character_c = "5",
    fightForce = 19800
    };
getRow(40031,7)->
    #pet_skills_upgradingCfg {
    skill_id = 40031,
    level = 7,
    item_cost = [13002,4],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 140,
    des = "机械鸟与生俱来的灵敏结合机械的坚韧，使其物理防御提升{b}%",
    character_a = "1672",
    character_b = "64",
    character_c = "5",
    fightForce = 27000
    };
getRow(40031,8)->
    #pet_skills_upgradingCfg {
    skill_id = 40031,
    level = 8,
    item_cost = [13002,4],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 160,
    des = "机械鸟与生俱来的灵敏结合机械的坚韧，使其物理防御提升{b}%",
    character_a = "1824",
    character_b = "68",
    character_c = "5",
    fightForce = 34200
    };
getRow(40031,9)->
    #pet_skills_upgradingCfg {
    skill_id = 40031,
    level = 9,
    item_cost = [13002,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 180,
    des = "机械鸟与生俱来的灵敏结合机械的坚韧，使其物理防御提升{b}%",
    character_a = "1976",
    character_b = "72",
    character_c = "5",
    fightForce = 43200
    };
getRow(40031,10)->
    #pet_skills_upgradingCfg {
    skill_id = 40031,
    level = 10,
    item_cost = [13002,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 200,
    des = "机械鸟与生俱来的灵敏结合机械的坚韧，使其物理防御提升{b}%",
    character_a = "2128",
    character_b = "76",
    character_c = "5",
    fightForce = 52200
    };
getRow(40031,11)->
    #pet_skills_upgradingCfg {
    skill_id = 40031,
    level = 11,
    item_cost = [13002,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 200,
    des = "机械鸟与生俱来的灵敏结合机械的坚韧，使其物理防御提升{b}%",
    character_a = "2280",
    character_b = "80",
    character_c = "5",
    fightForce = 61200
    };
getRow(40035,1)->
    #pet_skills_upgradingCfg {
    skill_id = 40035,
    level = 1,
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "机械鸟朝上方起飞小段后朝下俯冲，造成{a}%攻击的范围伤害",
    character_a = "365",
    character_b = "",
    character_c = "",
    fightForce = 0
    };
getRow(40035,2)->
    #pet_skills_upgradingCfg {
    skill_id = 40035,
    level = 2,
    item_cost = [13002,1],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 40,
    des = "机械鸟朝上方起飞小段后朝下俯冲，造成{a}%攻击的范围伤害",
    character_a = "437",
    character_b = "",
    character_c = "",
    fightForce = 1800
    };
getRow(40035,3)->
    #pet_skills_upgradingCfg {
    skill_id = 40035,
    level = 3,
    item_cost = [13002,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 60,
    des = "机械鸟朝上方起飞小段后朝下俯冲，造成{a}%攻击的范围伤害",
    character_a = "509",
    character_b = "",
    character_c = "",
    fightForce = 5400
    };
getRow(40035,4)->
    #pet_skills_upgradingCfg {
    skill_id = 40035,
    level = 4,
    item_cost = [13002,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 80,
    des = "机械鸟朝上方起飞小段后朝下俯冲，造成{a}%攻击的范围伤害",
    character_a = "581",
    character_b = "",
    character_c = "",
    fightForce = 9000
    };
getRow(40035,5)->
    #pet_skills_upgradingCfg {
    skill_id = 40035,
    level = 5,
    item_cost = [13002,3],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 100,
    des = "机械鸟朝上方起飞小段后朝下俯冲，造成{a}%攻击的范围伤害",
    character_a = "653",
    character_b = "",
    character_c = "",
    fightForce = 14400
    };
getRow(40035,6)->
    #pet_skills_upgradingCfg {
    skill_id = 40035,
    level = 6,
    item_cost = [13002,3],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 120,
    des = "机械鸟朝上方起飞小段后朝下俯冲，造成{a}%攻击的范围伤害",
    character_a = "725",
    character_b = "",
    character_c = "",
    fightForce = 19800
    };
getRow(40035,7)->
    #pet_skills_upgradingCfg {
    skill_id = 40035,
    level = 7,
    item_cost = [13002,4],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 140,
    des = "机械鸟朝上方起飞小段后朝下俯冲，造成{a}%攻击的范围伤害",
    character_a = "797",
    character_b = "",
    character_c = "",
    fightForce = 27000
    };
getRow(40035,8)->
    #pet_skills_upgradingCfg {
    skill_id = 40035,
    level = 8,
    item_cost = [13002,4],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 160,
    des = "机械鸟朝上方起飞小段后朝下俯冲，造成{a}%攻击的范围伤害",
    character_a = "869",
    character_b = "",
    character_c = "",
    fightForce = 34200
    };
getRow(40035,9)->
    #pet_skills_upgradingCfg {
    skill_id = 40035,
    level = 9,
    item_cost = [13002,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 180,
    des = "机械鸟朝上方起飞小段后朝下俯冲，造成{a}%攻击的范围伤害",
    character_a = "941",
    character_b = "",
    character_c = "",
    fightForce = 43200
    };
getRow(40035,10)->
    #pet_skills_upgradingCfg {
    skill_id = 40035,
    level = 10,
    item_cost = [13002,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 200,
    des = "机械鸟朝上方起飞小段后朝下俯冲，造成{a}%攻击的范围伤害",
    character_a = "1013",
    character_b = "",
    character_c = "",
    fightForce = 52200
    };
getRow(40035,11)->
    #pet_skills_upgradingCfg {
    skill_id = 40035,
    level = 11,
    item_cost = [13002,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 200,
    des = "机械鸟朝上方起飞小段后朝下俯冲，造成{a}%攻击的范围伤害",
    character_a = "1085",
    character_b = "",
    character_c = "",
    fightForce = 61200
    };
getRow(40040,1)->
    #pet_skills_upgradingCfg {
    skill_id = 40040,
    level = 1,
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "上帝就该老老实实待在天堂，西瓜鲨对前方单体目标造成{a}%攻击的伤害",
    character_a = "733",
    character_b = "",
    character_c = "",
    fightForce = 0
    };
getRow(40040,2)->
    #pet_skills_upgradingCfg {
    skill_id = 40040,
    level = 2,
    item_cost = [13002,1],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 40,
    des = "上帝就该老老实实待在天堂，西瓜鲨对前方单体目标造成{a}%攻击的伤害",
    character_a = "882",
    character_b = "",
    character_c = "",
    fightForce = 1800
    };
getRow(40040,3)->
    #pet_skills_upgradingCfg {
    skill_id = 40040,
    level = 3,
    item_cost = [13002,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 60,
    des = "上帝就该老老实实待在天堂，西瓜鲨对前方单体目标造成{a}%攻击的伤害",
    character_a = "1031",
    character_b = "",
    character_c = "",
    fightForce = 5400
    };
getRow(40040,4)->
    #pet_skills_upgradingCfg {
    skill_id = 40040,
    level = 4,
    item_cost = [13002,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 80,
    des = "上帝就该老老实实待在天堂，西瓜鲨对前方单体目标造成{a}%攻击的伤害",
    character_a = "1180",
    character_b = "",
    character_c = "",
    fightForce = 9000
    };
getRow(40040,5)->
    #pet_skills_upgradingCfg {
    skill_id = 40040,
    level = 5,
    item_cost = [13002,3],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 100,
    des = "上帝就该老老实实待在天堂，西瓜鲨对前方单体目标造成{a}%攻击的伤害",
    character_a = "1329",
    character_b = "",
    character_c = "",
    fightForce = 14400
    };
getRow(40040,6)->
    #pet_skills_upgradingCfg {
    skill_id = 40040,
    level = 6,
    item_cost = [13002,3],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 120,
    des = "上帝就该老老实实待在天堂，西瓜鲨对前方单体目标造成{a}%攻击的伤害",
    character_a = "1478",
    character_b = "",
    character_c = "",
    fightForce = 19800
    };
getRow(40040,7)->
    #pet_skills_upgradingCfg {
    skill_id = 40040,
    level = 7,
    item_cost = [13002,4],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 140,
    des = "上帝就该老老实实待在天堂，西瓜鲨对前方单体目标造成{a}%攻击的伤害",
    character_a = "1627",
    character_b = "",
    character_c = "",
    fightForce = 27000
    };
getRow(40040,8)->
    #pet_skills_upgradingCfg {
    skill_id = 40040,
    level = 8,
    item_cost = [13002,4],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 160,
    des = "上帝就该老老实实待在天堂，西瓜鲨对前方单体目标造成{a}%攻击的伤害",
    character_a = "1776",
    character_b = "",
    character_c = "",
    fightForce = 34200
    };
getRow(40040,9)->
    #pet_skills_upgradingCfg {
    skill_id = 40040,
    level = 9,
    item_cost = [13002,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 180,
    des = "上帝就该老老实实待在天堂，西瓜鲨对前方单体目标造成{a}%攻击的伤害",
    character_a = "1925",
    character_b = "",
    character_c = "",
    fightForce = 43200
    };
getRow(40040,10)->
    #pet_skills_upgradingCfg {
    skill_id = 40040,
    level = 10,
    item_cost = [13002,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 200,
    des = "上帝就该老老实实待在天堂，西瓜鲨对前方单体目标造成{a}%攻击的伤害",
    character_a = "2074",
    character_b = "",
    character_c = "",
    fightForce = 52200
    };
getRow(40040,11)->
    #pet_skills_upgradingCfg {
    skill_id = 40040,
    level = 11,
    item_cost = [13002,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 200,
    des = "上帝就该老老实实待在天堂，西瓜鲨对前方单体目标造成{a}%攻击的伤害",
    character_a = "2223",
    character_b = "",
    character_c = "",
    fightForce = 61200
    };
getRow(40041,1)->
    #pet_skills_upgradingCfg {
    skill_id = 40041,
    level = 1,
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "“来瞧一瞧看一看，全场五折啦！”西瓜鲨将周围30米敌人的眼光吸引过来，并造成{a}%攻击的伤害",
    character_a = "764",
    character_b = "",
    character_c = "",
    fightForce = 0
    };
getRow(40041,2)->
    #pet_skills_upgradingCfg {
    skill_id = 40041,
    level = 2,
    item_cost = [13002,1],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 40,
    des = "“来瞧一瞧看一看，全场五折啦！”西瓜鲨将周围30米敌人的眼光吸引过来，并造成{a}%攻击的伤害",
    character_a = "917",
    character_b = "",
    character_c = "",
    fightForce = 1800
    };
getRow(40041,3)->
    #pet_skills_upgradingCfg {
    skill_id = 40041,
    level = 3,
    item_cost = [13002,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 60,
    des = "“来瞧一瞧看一看，全场五折啦！”西瓜鲨将周围30米敌人的眼光吸引过来，并造成{a}%攻击的伤害",
    character_a = "1070",
    character_b = "",
    character_c = "",
    fightForce = 5400
    };
getRow(40041,4)->
    #pet_skills_upgradingCfg {
    skill_id = 40041,
    level = 4,
    item_cost = [13002,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 80,
    des = "“来瞧一瞧看一看，全场五折啦！”西瓜鲨将周围30米敌人的眼光吸引过来，并造成{a}%攻击的伤害",
    character_a = "1223",
    character_b = "",
    character_c = "",
    fightForce = 9000
    };
getRow(40041,5)->
    #pet_skills_upgradingCfg {
    skill_id = 40041,
    level = 5,
    item_cost = [13002,3],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 100,
    des = "“来瞧一瞧看一看，全场五折啦！”西瓜鲨将周围30米敌人的眼光吸引过来，并造成{a}%攻击的伤害",
    character_a = "1376",
    character_b = "",
    character_c = "",
    fightForce = 14400
    };
getRow(40041,6)->
    #pet_skills_upgradingCfg {
    skill_id = 40041,
    level = 6,
    item_cost = [13002,3],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 120,
    des = "“来瞧一瞧看一看，全场五折啦！”西瓜鲨将周围30米敌人的眼光吸引过来，并造成{a}%攻击的伤害",
    character_a = "1529",
    character_b = "",
    character_c = "",
    fightForce = 19800
    };
getRow(40041,7)->
    #pet_skills_upgradingCfg {
    skill_id = 40041,
    level = 7,
    item_cost = [13002,4],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 140,
    des = "“来瞧一瞧看一看，全场五折啦！”西瓜鲨将周围30米敌人的眼光吸引过来，并造成{a}%攻击的伤害",
    character_a = "1682",
    character_b = "",
    character_c = "",
    fightForce = 27000
    };
getRow(40041,8)->
    #pet_skills_upgradingCfg {
    skill_id = 40041,
    level = 8,
    item_cost = [13002,4],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 160,
    des = "“来瞧一瞧看一看，全场五折啦！”西瓜鲨将周围30米敌人的眼光吸引过来，并造成{a}%攻击的伤害",
    character_a = "1835",
    character_b = "",
    character_c = "",
    fightForce = 34200
    };
getRow(40041,9)->
    #pet_skills_upgradingCfg {
    skill_id = 40041,
    level = 9,
    item_cost = [13002,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 180,
    des = "“来瞧一瞧看一看，全场五折啦！”西瓜鲨将周围30米敌人的眼光吸引过来，并造成{a}%攻击的伤害",
    character_a = "1988",
    character_b = "",
    character_c = "",
    fightForce = 43200
    };
getRow(40041,10)->
    #pet_skills_upgradingCfg {
    skill_id = 40041,
    level = 10,
    item_cost = [13002,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 200,
    des = "“来瞧一瞧看一看，全场五折啦！”西瓜鲨将周围30米敌人的眼光吸引过来，并造成{a}%攻击的伤害",
    character_a = "2141",
    character_b = "",
    character_c = "",
    fightForce = 52200
    };
getRow(40041,11)->
    #pet_skills_upgradingCfg {
    skill_id = 40041,
    level = 11,
    item_cost = [13002,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 200,
    des = "“来瞧一瞧看一看，全场五折啦！”西瓜鲨将周围30米敌人的眼光吸引过来，并造成{a}%攻击的伤害",
    character_a = "2294",
    character_b = "",
    character_c = "",
    fightForce = 61200
    };
getRow(40044,1)->
    #pet_skills_upgradingCfg {
    skill_id = 40044,
    level = 1,
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "西瓜鲨获得了不错的收益，哈哈大笑为主人增加{b}%的双防，持续{c}秒",
    character_a = "1100",
    character_b = "30",
    character_c = "5",
    fightForce = 0
    };
getRow(40044,2)->
    #pet_skills_upgradingCfg {
    skill_id = 40044,
    level = 2,
    item_cost = [13002,1],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 40,
    des = "西瓜鲨获得了不错的收益，哈哈大笑为主人增加{b}%的双防，持续{c}秒",
    character_a = "1318",
    character_b = "33",
    character_c = "5",
    fightForce = 1800
    };
getRow(40044,3)->
    #pet_skills_upgradingCfg {
    skill_id = 40044,
    level = 3,
    item_cost = [13002,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 60,
    des = "西瓜鲨获得了不错的收益，哈哈大笑为主人增加{b}%的双防，持续{c}秒",
    character_a = "1536",
    character_b = "36",
    character_c = "5",
    fightForce = 5400
    };
getRow(40044,4)->
    #pet_skills_upgradingCfg {
    skill_id = 40044,
    level = 4,
    item_cost = [13002,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 80,
    des = "西瓜鲨获得了不错的收益，哈哈大笑为主人增加{b}%的双防，持续{c}秒",
    character_a = "1754",
    character_b = "39",
    character_c = "5",
    fightForce = 9000
    };
getRow(40044,5)->
    #pet_skills_upgradingCfg {
    skill_id = 40044,
    level = 5,
    item_cost = [13002,3],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 100,
    des = "西瓜鲨获得了不错的收益，哈哈大笑为主人增加{b}%的双防，持续{c}秒",
    character_a = "1972",
    character_b = "42",
    character_c = "5",
    fightForce = 14400
    };
getRow(40044,6)->
    #pet_skills_upgradingCfg {
    skill_id = 40044,
    level = 6,
    item_cost = [13002,3],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 120,
    des = "西瓜鲨获得了不错的收益，哈哈大笑为主人增加{b}%的双防，持续{c}秒",
    character_a = "2190",
    character_b = "45",
    character_c = "5",
    fightForce = 19800
    };
getRow(40044,7)->
    #pet_skills_upgradingCfg {
    skill_id = 40044,
    level = 7,
    item_cost = [13002,4],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 140,
    des = "西瓜鲨获得了不错的收益，哈哈大笑为主人增加{b}%的双防，持续{c}秒",
    character_a = "2408",
    character_b = "48",
    character_c = "5",
    fightForce = 27000
    };
getRow(40044,8)->
    #pet_skills_upgradingCfg {
    skill_id = 40044,
    level = 8,
    item_cost = [13002,4],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 160,
    des = "西瓜鲨获得了不错的收益，哈哈大笑为主人增加{b}%的双防，持续{c}秒",
    character_a = "2626",
    character_b = "51",
    character_c = "5",
    fightForce = 34200
    };
getRow(40044,9)->
    #pet_skills_upgradingCfg {
    skill_id = 40044,
    level = 9,
    item_cost = [13002,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 180,
    des = "西瓜鲨获得了不错的收益，哈哈大笑为主人增加{b}%的双防，持续{c}秒",
    character_a = "2844",
    character_b = "54",
    character_c = "5",
    fightForce = 43200
    };
getRow(40044,10)->
    #pet_skills_upgradingCfg {
    skill_id = 40044,
    level = 10,
    item_cost = [13002,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 200,
    des = "西瓜鲨获得了不错的收益，哈哈大笑为主人增加{b}%的双防，持续{c}秒",
    character_a = "3062",
    character_b = "57",
    character_c = "5",
    fightForce = 52200
    };
getRow(40044,11)->
    #pet_skills_upgradingCfg {
    skill_id = 40044,
    level = 11,
    item_cost = [13002,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 200,
    des = "西瓜鲨获得了不错的收益，哈哈大笑为主人增加{b}%的双防，持续{c}秒",
    character_a = "3280",
    character_b = "60",
    character_c = "5",
    fightForce = 61200
    };
getRow(40050,1)->
    #pet_skills_upgradingCfg {
    skill_id = 40050,
    level = 1,
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "钢铁狼用锋利的铁爪对前方敌人进行2次爪击，每次造成造成{a}%攻击的伤害",
    character_a = "307",
    character_b = "",
    character_c = "",
    fightForce = 0
    };
getRow(40050,2)->
    #pet_skills_upgradingCfg {
    skill_id = 40050,
    level = 2,
    item_cost = [13002,1],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 40,
    des = "钢铁狼用锋利的铁爪对前方敌人进行2次爪击，每次造成造成{a}%攻击的伤害",
    character_a = "369",
    character_b = "",
    character_c = "",
    fightForce = 1800
    };
getRow(40050,3)->
    #pet_skills_upgradingCfg {
    skill_id = 40050,
    level = 3,
    item_cost = [13002,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 60,
    des = "钢铁狼用锋利的铁爪对前方敌人进行2次爪击，每次造成造成{a}%攻击的伤害",
    character_a = "431",
    character_b = "",
    character_c = "",
    fightForce = 5400
    };
getRow(40050,4)->
    #pet_skills_upgradingCfg {
    skill_id = 40050,
    level = 4,
    item_cost = [13002,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 80,
    des = "钢铁狼用锋利的铁爪对前方敌人进行2次爪击，每次造成造成{a}%攻击的伤害",
    character_a = "493",
    character_b = "",
    character_c = "",
    fightForce = 9000
    };
getRow(40050,5)->
    #pet_skills_upgradingCfg {
    skill_id = 40050,
    level = 5,
    item_cost = [13002,3],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 100,
    des = "钢铁狼用锋利的铁爪对前方敌人进行2次爪击，每次造成造成{a}%攻击的伤害",
    character_a = "555",
    character_b = "",
    character_c = "",
    fightForce = 14400
    };
getRow(40050,6)->
    #pet_skills_upgradingCfg {
    skill_id = 40050,
    level = 6,
    item_cost = [13002,3],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 120,
    des = "钢铁狼用锋利的铁爪对前方敌人进行2次爪击，每次造成造成{a}%攻击的伤害",
    character_a = "617",
    character_b = "",
    character_c = "",
    fightForce = 19800
    };
getRow(40050,7)->
    #pet_skills_upgradingCfg {
    skill_id = 40050,
    level = 7,
    item_cost = [13002,4],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 140,
    des = "钢铁狼用锋利的铁爪对前方敌人进行2次爪击，每次造成造成{a}%攻击的伤害",
    character_a = "679",
    character_b = "",
    character_c = "",
    fightForce = 27000
    };
getRow(40050,8)->
    #pet_skills_upgradingCfg {
    skill_id = 40050,
    level = 8,
    item_cost = [13002,4],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 160,
    des = "钢铁狼用锋利的铁爪对前方敌人进行2次爪击，每次造成造成{a}%攻击的伤害",
    character_a = "741",
    character_b = "",
    character_c = "",
    fightForce = 34200
    };
getRow(40050,9)->
    #pet_skills_upgradingCfg {
    skill_id = 40050,
    level = 9,
    item_cost = [13002,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 180,
    des = "钢铁狼用锋利的铁爪对前方敌人进行2次爪击，每次造成造成{a}%攻击的伤害",
    character_a = "803",
    character_b = "",
    character_c = "",
    fightForce = 43200
    };
getRow(40050,10)->
    #pet_skills_upgradingCfg {
    skill_id = 40050,
    level = 10,
    item_cost = [13002,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 200,
    des = "钢铁狼用锋利的铁爪对前方敌人进行2次爪击，每次造成造成{a}%攻击的伤害",
    character_a = "865",
    character_b = "",
    character_c = "",
    fightForce = 52200
    };
getRow(40050,11)->
    #pet_skills_upgradingCfg {
    skill_id = 40050,
    level = 11,
    item_cost = [13002,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 200,
    des = "钢铁狼用锋利的铁爪对前方敌人进行2次爪击，每次造成造成{a}%攻击的伤害",
    character_a = "927",
    character_b = "",
    character_c = "",
    fightForce = 61200
    };
getRow(40053,1)->
    #pet_skills_upgradingCfg {
    skill_id = 40053,
    level = 1,
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "钢铁狼朝前方矩形区域进行撞击，该技能必然暴击。造成{a}%攻击的伤害，且有20%几率造成对方主目标 抗爆等级降低{b}%",
    character_a = "576",
    character_b = "15",
    character_c = "5",
    fightForce = 0
    };
getRow(40053,2)->
    #pet_skills_upgradingCfg {
    skill_id = 40053,
    level = 2,
    item_cost = [13002,1],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 40,
    des = "钢铁狼朝前方矩形区域进行撞击，该技能必然暴击。造成{a}%攻击的伤害，且有20%几率造成对方主目标 抗爆等级降低{b}%",
    character_a = "690",
    character_b = "16.5",
    character_c = "5",
    fightForce = 1800
    };
getRow(40053,3)->
    #pet_skills_upgradingCfg {
    skill_id = 40053,
    level = 3,
    item_cost = [13002,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 60,
    des = "钢铁狼朝前方矩形区域进行撞击，该技能必然暴击。造成{a}%攻击的伤害，且有20%几率造成对方主目标 抗爆等级降低{b}%",
    character_a = "804",
    character_b = "18",
    character_c = "5",
    fightForce = 5400
    };
getRow(40053,4)->
    #pet_skills_upgradingCfg {
    skill_id = 40053,
    level = 4,
    item_cost = [13002,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 80,
    des = "钢铁狼朝前方矩形区域进行撞击，该技能必然暴击。造成{a}%攻击的伤害，且有20%几率造成对方主目标 抗爆等级降低{b}%",
    character_a = "918",
    character_b = "19.5",
    character_c = "5",
    fightForce = 9000
    };
getRow(40053,5)->
    #pet_skills_upgradingCfg {
    skill_id = 40053,
    level = 5,
    item_cost = [13002,3],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 100,
    des = "钢铁狼朝前方矩形区域进行撞击，该技能必然暴击。造成{a}%攻击的伤害，且有20%几率造成对方主目标 抗爆等级降低{b}%",
    character_a = "1032",
    character_b = "21",
    character_c = "5",
    fightForce = 14400
    };
getRow(40053,6)->
    #pet_skills_upgradingCfg {
    skill_id = 40053,
    level = 6,
    item_cost = [13002,3],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 120,
    des = "钢铁狼朝前方矩形区域进行撞击，该技能必然暴击。造成{a}%攻击的伤害，且有20%几率造成对方主目标 抗爆等级降低{b}%",
    character_a = "1146",
    character_b = "22.5",
    character_c = "5",
    fightForce = 19800
    };
getRow(40053,7)->
    #pet_skills_upgradingCfg {
    skill_id = 40053,
    level = 7,
    item_cost = [13002,4],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 140,
    des = "钢铁狼朝前方矩形区域进行撞击，该技能必然暴击。造成{a}%攻击的伤害，且有20%几率造成对方主目标 抗爆等级降低{b}%",
    character_a = "1260",
    character_b = "24",
    character_c = "5",
    fightForce = 27000
    };
getRow(40053,8)->
    #pet_skills_upgradingCfg {
    skill_id = 40053,
    level = 8,
    item_cost = [13002,4],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 160,
    des = "钢铁狼朝前方矩形区域进行撞击，该技能必然暴击。造成{a}%攻击的伤害，且有20%几率造成对方主目标 抗爆等级降低{b}%",
    character_a = "1374",
    character_b = "25.5",
    character_c = "5",
    fightForce = 34200
    };
getRow(40053,9)->
    #pet_skills_upgradingCfg {
    skill_id = 40053,
    level = 9,
    item_cost = [13002,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 180,
    des = "钢铁狼朝前方矩形区域进行撞击，该技能必然暴击。造成{a}%攻击的伤害，且有20%几率造成对方主目标 抗爆等级降低{b}%",
    character_a = "1488",
    character_b = "27",
    character_c = "5",
    fightForce = 43200
    };
getRow(40053,10)->
    #pet_skills_upgradingCfg {
    skill_id = 40053,
    level = 10,
    item_cost = [13002,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 200,
    des = "钢铁狼朝前方矩形区域进行撞击，该技能必然暴击。造成{a}%攻击的伤害，且有20%几率造成对方主目标 抗爆等级降低{b}%",
    character_a = "1602",
    character_b = "28.5",
    character_c = "5",
    fightForce = 52200
    };
getRow(40053,11)->
    #pet_skills_upgradingCfg {
    skill_id = 40053,
    level = 11,
    item_cost = [13002,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 200,
    des = "钢铁狼朝前方矩形区域进行撞击，该技能必然暴击。造成{a}%攻击的伤害，且有20%几率造成对方主目标 抗爆等级降低{b}%",
    character_a = "1716",
    character_b = "30",
    character_c = "5",
    fightForce = 61200
    };
getRow(40054,1)->
    #pet_skills_upgradingCfg {
    skill_id = 40054,
    level = 1,
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "钢铁狼向前方进行撞击，造成{a}%攻击的伤害，该技能必然破甲。且有20%几率降低对方主目标坚固等级{b}%",
    character_a = "576",
    character_b = "20",
    character_c = "5",
    fightForce = 0
    };
getRow(40054,2)->
    #pet_skills_upgradingCfg {
    skill_id = 40054,
    level = 2,
    item_cost = [13002,1],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 40,
    des = "钢铁狼向前方进行撞击，造成{a}%攻击的伤害，该技能必然破甲。且有20%几率降低对方主目标坚固等级{b}%",
    character_a = "690",
    character_b = "22",
    character_c = "5",
    fightForce = 1800
    };
getRow(40054,3)->
    #pet_skills_upgradingCfg {
    skill_id = 40054,
    level = 3,
    item_cost = [13002,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 60,
    des = "钢铁狼向前方进行撞击，造成{a}%攻击的伤害，该技能必然破甲。且有20%几率降低对方主目标坚固等级{b}%",
    character_a = "804",
    character_b = "24",
    character_c = "5",
    fightForce = 5400
    };
getRow(40054,4)->
    #pet_skills_upgradingCfg {
    skill_id = 40054,
    level = 4,
    item_cost = [13002,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 80,
    des = "钢铁狼向前方进行撞击，造成{a}%攻击的伤害，该技能必然破甲。且有20%几率降低对方主目标坚固等级{b}%",
    character_a = "918",
    character_b = "26",
    character_c = "5",
    fightForce = 9000
    };
getRow(40054,5)->
    #pet_skills_upgradingCfg {
    skill_id = 40054,
    level = 5,
    item_cost = [13002,3],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 100,
    des = "钢铁狼向前方进行撞击，造成{a}%攻击的伤害，该技能必然破甲。且有20%几率降低对方主目标坚固等级{b}%",
    character_a = "1032",
    character_b = "28",
    character_c = "5",
    fightForce = 14400
    };
getRow(40054,6)->
    #pet_skills_upgradingCfg {
    skill_id = 40054,
    level = 6,
    item_cost = [13002,3],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 120,
    des = "钢铁狼向前方进行撞击，造成{a}%攻击的伤害，该技能必然破甲。且有20%几率降低对方主目标坚固等级{b}%",
    character_a = "1146",
    character_b = "30",
    character_c = "5",
    fightForce = 19800
    };
getRow(40054,7)->
    #pet_skills_upgradingCfg {
    skill_id = 40054,
    level = 7,
    item_cost = [13002,4],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 140,
    des = "钢铁狼向前方进行撞击，造成{a}%攻击的伤害，该技能必然破甲。且有20%几率降低对方主目标坚固等级{b}%",
    character_a = "1260",
    character_b = "32",
    character_c = "5",
    fightForce = 27000
    };
getRow(40054,8)->
    #pet_skills_upgradingCfg {
    skill_id = 40054,
    level = 8,
    item_cost = [13002,4],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 160,
    des = "钢铁狼向前方进行撞击，造成{a}%攻击的伤害，该技能必然破甲。且有20%几率降低对方主目标坚固等级{b}%",
    character_a = "1374",
    character_b = "34",
    character_c = "5",
    fightForce = 34200
    };
getRow(40054,9)->
    #pet_skills_upgradingCfg {
    skill_id = 40054,
    level = 9,
    item_cost = [13002,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 180,
    des = "钢铁狼向前方进行撞击，造成{a}%攻击的伤害，该技能必然破甲。且有20%几率降低对方主目标坚固等级{b}%",
    character_a = "1488",
    character_b = "36",
    character_c = "5",
    fightForce = 43200
    };
getRow(40054,10)->
    #pet_skills_upgradingCfg {
    skill_id = 40054,
    level = 10,
    item_cost = [13002,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 200,
    des = "钢铁狼向前方进行撞击，造成{a}%攻击的伤害，该技能必然破甲。且有20%几率降低对方主目标坚固等级{b}%",
    character_a = "1602",
    character_b = "38",
    character_c = "5",
    fightForce = 52200
    };
getRow(40054,11)->
    #pet_skills_upgradingCfg {
    skill_id = 40054,
    level = 11,
    item_cost = [13002,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 200,
    des = "钢铁狼向前方进行撞击，造成{a}%攻击的伤害，该技能必然破甲。且有20%几率降低对方主目标坚固等级{b}%",
    character_a = "1716",
    character_b = "40",
    character_c = "5",
    fightForce = 61200
    };
getRow(40060,1)->
    #pet_skills_upgradingCfg {
    skill_id = 40060,
    level = 1,
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "对前方单个敌人进行两次攻击，每次造成{a}%攻击的伤害",
    character_a = "367",
    character_b = "",
    character_c = "",
    fightForce = 0
    };
getRow(40060,2)->
    #pet_skills_upgradingCfg {
    skill_id = 40060,
    level = 2,
    item_cost = [13002,1],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 40,
    des = "对前方单个敌人进行两次攻击，每次造成{a}%攻击的伤害",
    character_a = "441",
    character_b = "",
    character_c = "",
    fightForce = 1800
    };
getRow(40060,3)->
    #pet_skills_upgradingCfg {
    skill_id = 40060,
    level = 3,
    item_cost = [13002,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 60,
    des = "对前方单个敌人进行两次攻击，每次造成{a}%攻击的伤害",
    character_a = "515",
    character_b = "",
    character_c = "",
    fightForce = 5400
    };
getRow(40060,4)->
    #pet_skills_upgradingCfg {
    skill_id = 40060,
    level = 4,
    item_cost = [13002,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 80,
    des = "对前方单个敌人进行两次攻击，每次造成{a}%攻击的伤害",
    character_a = "589",
    character_b = "",
    character_c = "",
    fightForce = 9000
    };
getRow(40060,5)->
    #pet_skills_upgradingCfg {
    skill_id = 40060,
    level = 5,
    item_cost = [13002,3],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 100,
    des = "对前方单个敌人进行两次攻击，每次造成{a}%攻击的伤害",
    character_a = "663",
    character_b = "",
    character_c = "",
    fightForce = 14400
    };
getRow(40060,6)->
    #pet_skills_upgradingCfg {
    skill_id = 40060,
    level = 6,
    item_cost = [13002,3],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 120,
    des = "对前方单个敌人进行两次攻击，每次造成{a}%攻击的伤害",
    character_a = "737",
    character_b = "",
    character_c = "",
    fightForce = 19800
    };
getRow(40060,7)->
    #pet_skills_upgradingCfg {
    skill_id = 40060,
    level = 7,
    item_cost = [13002,4],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 140,
    des = "对前方单个敌人进行两次攻击，每次造成{a}%攻击的伤害",
    character_a = "811",
    character_b = "",
    character_c = "",
    fightForce = 27000
    };
getRow(40060,8)->
    #pet_skills_upgradingCfg {
    skill_id = 40060,
    level = 8,
    item_cost = [13002,4],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 160,
    des = "对前方单个敌人进行两次攻击，每次造成{a}%攻击的伤害",
    character_a = "885",
    character_b = "",
    character_c = "",
    fightForce = 34200
    };
getRow(40060,9)->
    #pet_skills_upgradingCfg {
    skill_id = 40060,
    level = 9,
    item_cost = [13002,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 180,
    des = "对前方单个敌人进行两次攻击，每次造成{a}%攻击的伤害",
    character_a = "959",
    character_b = "",
    character_c = "",
    fightForce = 43200
    };
getRow(40060,10)->
    #pet_skills_upgradingCfg {
    skill_id = 40060,
    level = 10,
    item_cost = [13002,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 200,
    des = "对前方单个敌人进行两次攻击，每次造成{a}%攻击的伤害",
    character_a = "1033",
    character_b = "",
    character_c = "",
    fightForce = 52200
    };
getRow(40060,11)->
    #pet_skills_upgradingCfg {
    skill_id = 40060,
    level = 11,
    item_cost = [13002,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 200,
    des = "对前方单个敌人进行两次攻击，每次造成{a}%攻击的伤害",
    character_a = "1107",
    character_b = "",
    character_c = "",
    fightForce = 61200
    };
getRow(40061,1)->
    #pet_skills_upgradingCfg {
    skill_id = 40061,
    level = 1,
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "主人每秒恢复自身法术攻击{a}%的生命值，持续{c}秒",
    character_a = "102",
    character_b = "",
    character_c = "3",
    fightForce = 0
    };
getRow(40061,2)->
    #pet_skills_upgradingCfg {
    skill_id = 40061,
    level = 2,
    item_cost = [13002,1],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 40,
    des = "主人每秒恢复自身法术攻击{a}%的生命值，持续{c}秒",
    character_a = "122",
    character_b = "",
    character_c = "3",
    fightForce = 1800
    };
getRow(40061,3)->
    #pet_skills_upgradingCfg {
    skill_id = 40061,
    level = 3,
    item_cost = [13002,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 60,
    des = "主人每秒恢复自身法术攻击{a}%的生命值，持续{c}秒",
    character_a = "142",
    character_b = "",
    character_c = "3",
    fightForce = 5400
    };
getRow(40061,4)->
    #pet_skills_upgradingCfg {
    skill_id = 40061,
    level = 4,
    item_cost = [13002,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 80,
    des = "主人每秒恢复自身法术攻击{a}%的生命值，持续{c}秒",
    character_a = "162",
    character_b = "",
    character_c = "3",
    fightForce = 9000
    };
getRow(40061,5)->
    #pet_skills_upgradingCfg {
    skill_id = 40061,
    level = 5,
    item_cost = [13002,3],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 100,
    des = "主人每秒恢复自身法术攻击{a}%的生命值，持续{c}秒",
    character_a = "182",
    character_b = "",
    character_c = "3",
    fightForce = 14400
    };
getRow(40061,6)->
    #pet_skills_upgradingCfg {
    skill_id = 40061,
    level = 6,
    item_cost = [13002,3],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 120,
    des = "主人每秒恢复自身法术攻击{a}%的生命值，持续{c}秒",
    character_a = "202",
    character_b = "",
    character_c = "3",
    fightForce = 19800
    };
getRow(40061,7)->
    #pet_skills_upgradingCfg {
    skill_id = 40061,
    level = 7,
    item_cost = [13002,4],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 140,
    des = "主人每秒恢复自身法术攻击{a}%的生命值，持续{c}秒",
    character_a = "222",
    character_b = "",
    character_c = "3",
    fightForce = 27000
    };
getRow(40061,8)->
    #pet_skills_upgradingCfg {
    skill_id = 40061,
    level = 8,
    item_cost = [13002,4],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 160,
    des = "主人每秒恢复自身法术攻击{a}%的生命值，持续{c}秒",
    character_a = "242",
    character_b = "",
    character_c = "3",
    fightForce = 34200
    };
getRow(40061,9)->
    #pet_skills_upgradingCfg {
    skill_id = 40061,
    level = 9,
    item_cost = [13002,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 180,
    des = "主人每秒恢复自身法术攻击{a}%的生命值，持续{c}秒",
    character_a = "262",
    character_b = "",
    character_c = "3",
    fightForce = 43200
    };
getRow(40061,10)->
    #pet_skills_upgradingCfg {
    skill_id = 40061,
    level = 10,
    item_cost = [13002,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 200,
    des = "主人每秒恢复自身法术攻击{a}%的生命值，持续{c}秒",
    character_a = "282",
    character_b = "",
    character_c = "3",
    fightForce = 52200
    };
getRow(40061,11)->
    #pet_skills_upgradingCfg {
    skill_id = 40061,
    level = 11,
    item_cost = [13002,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 200,
    des = "主人每秒恢复自身法术攻击{a}%的生命值，持续{c}秒",
    character_a = "302",
    character_b = "",
    character_c = "3",
    fightForce = 61200
    };
getRow(40063,1)->
    #pet_skills_upgradingCfg {
    skill_id = 40063,
    level = 1,
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "主人物理防御和魔防提升{b}%，持续{c}秒",
    character_a = "917",
    character_b = "30",
    character_c = "5",
    fightForce = 0
    };
getRow(40063,2)->
    #pet_skills_upgradingCfg {
    skill_id = 40063,
    level = 2,
    item_cost = [13002,1],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 40,
    des = "主人物理防御和魔防提升{b}%，持续{c}秒",
    character_a = "1098",
    character_b = "33",
    character_c = "5",
    fightForce = 1800
    };
getRow(40063,3)->
    #pet_skills_upgradingCfg {
    skill_id = 40063,
    level = 3,
    item_cost = [13002,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 60,
    des = "主人物理防御和魔防提升{b}%，持续{c}秒",
    character_a = "1279",
    character_b = "36",
    character_c = "5",
    fightForce = 5400
    };
getRow(40063,4)->
    #pet_skills_upgradingCfg {
    skill_id = 40063,
    level = 4,
    item_cost = [13002,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 80,
    des = "主人物理防御和魔防提升{b}%，持续{c}秒",
    character_a = "1460",
    character_b = "39",
    character_c = "5",
    fightForce = 9000
    };
getRow(40063,5)->
    #pet_skills_upgradingCfg {
    skill_id = 40063,
    level = 5,
    item_cost = [13002,3],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 100,
    des = "主人物理防御和魔防提升{b}%，持续{c}秒",
    character_a = "1641",
    character_b = "42",
    character_c = "5",
    fightForce = 14400
    };
getRow(40063,6)->
    #pet_skills_upgradingCfg {
    skill_id = 40063,
    level = 6,
    item_cost = [13002,3],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 120,
    des = "主人物理防御和魔防提升{b}%，持续{c}秒",
    character_a = "1822",
    character_b = "45",
    character_c = "5",
    fightForce = 19800
    };
getRow(40063,7)->
    #pet_skills_upgradingCfg {
    skill_id = 40063,
    level = 7,
    item_cost = [13002,4],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 140,
    des = "主人物理防御和魔防提升{b}%，持续{c}秒",
    character_a = "2003",
    character_b = "48",
    character_c = "5",
    fightForce = 27000
    };
getRow(40063,8)->
    #pet_skills_upgradingCfg {
    skill_id = 40063,
    level = 8,
    item_cost = [13002,4],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 160,
    des = "主人物理防御和魔防提升{b}%，持续{c}秒",
    character_a = "2184",
    character_b = "51",
    character_c = "5",
    fightForce = 34200
    };
getRow(40063,9)->
    #pet_skills_upgradingCfg {
    skill_id = 40063,
    level = 9,
    item_cost = [13002,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 180,
    des = "主人物理防御和魔防提升{b}%，持续{c}秒",
    character_a = "2365",
    character_b = "54",
    character_c = "5",
    fightForce = 43200
    };
getRow(40063,10)->
    #pet_skills_upgradingCfg {
    skill_id = 40063,
    level = 10,
    item_cost = [13002,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 200,
    des = "主人物理防御和魔防提升{b}%，持续{c}秒",
    character_a = "2546",
    character_b = "57",
    character_c = "5",
    fightForce = 52200
    };
getRow(40063,11)->
    #pet_skills_upgradingCfg {
    skill_id = 40063,
    level = 11,
    item_cost = [13002,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 200,
    des = "主人物理防御和魔防提升{b}%，持续{c}秒",
    character_a = "2727",
    character_b = "60",
    character_c = "5",
    fightForce = 61200
    };
getRow(40070,1)->
    #pet_skills_upgradingCfg {
    skill_id = 40070,
    level = 1,
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "对前方单个敌人采用低音符攻击，总共造成{a}%攻击的伤害",
    character_a = "741",
    character_b = "",
    character_c = "",
    fightForce = 0
    };
getRow(40070,2)->
    #pet_skills_upgradingCfg {
    skill_id = 40070,
    level = 2,
    item_cost = [13002,1],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 40,
    des = "对前方单个敌人采用低音符攻击，总共造成{a}%攻击的伤害",
    character_a = "891",
    character_b = "",
    character_c = "",
    fightForce = 1800
    };
getRow(40070,3)->
    #pet_skills_upgradingCfg {
    skill_id = 40070,
    level = 3,
    item_cost = [13002,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 60,
    des = "对前方单个敌人采用低音符攻击，总共造成{a}%攻击的伤害",
    character_a = "1041",
    character_b = "",
    character_c = "",
    fightForce = 5400
    };
getRow(40070,4)->
    #pet_skills_upgradingCfg {
    skill_id = 40070,
    level = 4,
    item_cost = [13002,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 80,
    des = "对前方单个敌人采用低音符攻击，总共造成{a}%攻击的伤害",
    character_a = "1191",
    character_b = "",
    character_c = "",
    fightForce = 9000
    };
getRow(40070,5)->
    #pet_skills_upgradingCfg {
    skill_id = 40070,
    level = 5,
    item_cost = [13002,3],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 100,
    des = "对前方单个敌人采用低音符攻击，总共造成{a}%攻击的伤害",
    character_a = "1341",
    character_b = "",
    character_c = "",
    fightForce = 14400
    };
getRow(40070,6)->
    #pet_skills_upgradingCfg {
    skill_id = 40070,
    level = 6,
    item_cost = [13002,3],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 120,
    des = "对前方单个敌人采用低音符攻击，总共造成{a}%攻击的伤害",
    character_a = "1491",
    character_b = "",
    character_c = "",
    fightForce = 19800
    };
getRow(40070,7)->
    #pet_skills_upgradingCfg {
    skill_id = 40070,
    level = 7,
    item_cost = [13002,4],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 140,
    des = "对前方单个敌人采用低音符攻击，总共造成{a}%攻击的伤害",
    character_a = "1641",
    character_b = "",
    character_c = "",
    fightForce = 27000
    };
getRow(40070,8)->
    #pet_skills_upgradingCfg {
    skill_id = 40070,
    level = 8,
    item_cost = [13002,4],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 160,
    des = "对前方单个敌人采用低音符攻击，总共造成{a}%攻击的伤害",
    character_a = "1791",
    character_b = "",
    character_c = "",
    fightForce = 34200
    };
getRow(40070,9)->
    #pet_skills_upgradingCfg {
    skill_id = 40070,
    level = 9,
    item_cost = [13002,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 180,
    des = "对前方单个敌人采用低音符攻击，总共造成{a}%攻击的伤害",
    character_a = "1941",
    character_b = "",
    character_c = "",
    fightForce = 43200
    };
getRow(40070,10)->
    #pet_skills_upgradingCfg {
    skill_id = 40070,
    level = 10,
    item_cost = [13002,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 200,
    des = "对前方单个敌人采用低音符攻击，总共造成{a}%攻击的伤害",
    character_a = "2091",
    character_b = "",
    character_c = "",
    fightForce = 52200
    };
getRow(40070,11)->
    #pet_skills_upgradingCfg {
    skill_id = 40070,
    level = 11,
    item_cost = [13002,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 200,
    des = "对前方单个敌人采用低音符攻击，总共造成{a}%攻击的伤害",
    character_a = "2241",
    character_b = "",
    character_c = "",
    fightForce = 61200
    };
getRow(40071,1)->
    #pet_skills_upgradingCfg {
    skill_id = 40071,
    level = 1,
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "弹奏镇魂曲，对周围28米敌人进行镇压攻击，总共造成{a}%攻击的伤害并降低对方物理防御、魔法防御{b}%，持续{c}秒",
    character_a = "540",
    character_b = "10",
    character_c = "5",
    fightForce = 0
    };
getRow(40071,2)->
    #pet_skills_upgradingCfg {
    skill_id = 40071,
    level = 2,
    item_cost = [13002,1],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 40,
    des = "弹奏镇魂曲，对周围28米敌人进行镇压攻击，总共造成{a}%攻击的伤害并降低对方物理防御、魔法防御{b}%，持续{c}秒",
    character_a = "648",
    character_b = "11",
    character_c = "5",
    fightForce = 1800
    };
getRow(40071,3)->
    #pet_skills_upgradingCfg {
    skill_id = 40071,
    level = 3,
    item_cost = [13002,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 60,
    des = "弹奏镇魂曲，对周围28米敌人进行镇压攻击，总共造成{a}%攻击的伤害并降低对方物理防御、魔法防御{b}%，持续{c}秒",
    character_a = "756",
    character_b = "12",
    character_c = "5",
    fightForce = 5400
    };
getRow(40071,4)->
    #pet_skills_upgradingCfg {
    skill_id = 40071,
    level = 4,
    item_cost = [13002,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 80,
    des = "弹奏镇魂曲，对周围28米敌人进行镇压攻击，总共造成{a}%攻击的伤害并降低对方物理防御、魔法防御{b}%，持续{c}秒",
    character_a = "864",
    character_b = "13",
    character_c = "5",
    fightForce = 9000
    };
getRow(40071,5)->
    #pet_skills_upgradingCfg {
    skill_id = 40071,
    level = 5,
    item_cost = [13002,3],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 100,
    des = "弹奏镇魂曲，对周围28米敌人进行镇压攻击，总共造成{a}%攻击的伤害并降低对方物理防御、魔法防御{b}%，持续{c}秒",
    character_a = "972",
    character_b = "14",
    character_c = "5",
    fightForce = 14400
    };
getRow(40071,6)->
    #pet_skills_upgradingCfg {
    skill_id = 40071,
    level = 6,
    item_cost = [13002,3],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 120,
    des = "弹奏镇魂曲，对周围28米敌人进行镇压攻击，总共造成{a}%攻击的伤害并降低对方物理防御、魔法防御{b}%，持续{c}秒",
    character_a = "1080",
    character_b = "15",
    character_c = "5",
    fightForce = 19800
    };
getRow(40071,7)->
    #pet_skills_upgradingCfg {
    skill_id = 40071,
    level = 7,
    item_cost = [13002,4],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 140,
    des = "弹奏镇魂曲，对周围28米敌人进行镇压攻击，总共造成{a}%攻击的伤害并降低对方物理防御、魔法防御{b}%，持续{c}秒",
    character_a = "1188",
    character_b = "16",
    character_c = "5",
    fightForce = 27000
    };
getRow(40071,8)->
    #pet_skills_upgradingCfg {
    skill_id = 40071,
    level = 8,
    item_cost = [13002,4],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 160,
    des = "弹奏镇魂曲，对周围28米敌人进行镇压攻击，总共造成{a}%攻击的伤害并降低对方物理防御、魔法防御{b}%，持续{c}秒",
    character_a = "1296",
    character_b = "17",
    character_c = "5",
    fightForce = 34200
    };
getRow(40071,9)->
    #pet_skills_upgradingCfg {
    skill_id = 40071,
    level = 9,
    item_cost = [13002,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 180,
    des = "弹奏镇魂曲，对周围28米敌人进行镇压攻击，总共造成{a}%攻击的伤害并降低对方物理防御、魔法防御{b}%，持续{c}秒",
    character_a = "1404",
    character_b = "18",
    character_c = "5",
    fightForce = 43200
    };
getRow(40071,10)->
    #pet_skills_upgradingCfg {
    skill_id = 40071,
    level = 10,
    item_cost = [13002,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 200,
    des = "弹奏镇魂曲，对周围28米敌人进行镇压攻击，总共造成{a}%攻击的伤害并降低对方物理防御、魔法防御{b}%，持续{c}秒",
    character_a = "1512",
    character_b = "19",
    character_c = "5",
    fightForce = 52200
    };
getRow(40071,11)->
    #pet_skills_upgradingCfg {
    skill_id = 40071,
    level = 11,
    item_cost = [13002,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 200,
    des = "弹奏镇魂曲，对周围28米敌人进行镇压攻击，总共造成{a}%攻击的伤害并降低对方物理防御、魔法防御{b}%，持续{c}秒",
    character_a = "1620",
    character_b = "20",
    character_c = "5",
    fightForce = 61200
    };
getRow(40072,1)->
    #pet_skills_upgradingCfg {
    skill_id = 40072,
    level = 1,
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "弹奏迷魂曲，对周围30米敌人进行4次迷惑攻击，每次造成{a}%攻击的伤害并降低对方{b}%的闪避等级，持续{c}秒",
    character_a = "162",
    character_b = "20",
    character_c = "5",
    fightForce = 0
    };
getRow(40072,2)->
    #pet_skills_upgradingCfg {
    skill_id = 40072,
    level = 2,
    item_cost = [13002,1],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 40,
    des = "弹奏迷魂曲，对周围30米敌人进行4次迷惑攻击，每次造成{a}%攻击的伤害并降低对方{b}%的闪避等级，持续{c}秒",
    character_a = "194",
    character_b = "22",
    character_c = "5",
    fightForce = 1800
    };
getRow(40072,3)->
    #pet_skills_upgradingCfg {
    skill_id = 40072,
    level = 3,
    item_cost = [13002,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 60,
    des = "弹奏迷魂曲，对周围30米敌人进行4次迷惑攻击，每次造成{a}%攻击的伤害并降低对方{b}%的闪避等级，持续{c}秒",
    character_a = "226",
    character_b = "24",
    character_c = "5",
    fightForce = 5400
    };
getRow(40072,4)->
    #pet_skills_upgradingCfg {
    skill_id = 40072,
    level = 4,
    item_cost = [13002,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 80,
    des = "弹奏迷魂曲，对周围30米敌人进行4次迷惑攻击，每次造成{a}%攻击的伤害并降低对方{b}%的闪避等级，持续{c}秒",
    character_a = "258",
    character_b = "26",
    character_c = "5",
    fightForce = 9000
    };
getRow(40072,5)->
    #pet_skills_upgradingCfg {
    skill_id = 40072,
    level = 5,
    item_cost = [13002,3],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 100,
    des = "弹奏迷魂曲，对周围30米敌人进行4次迷惑攻击，每次造成{a}%攻击的伤害并降低对方{b}%的闪避等级，持续{c}秒",
    character_a = "290",
    character_b = "28",
    character_c = "5",
    fightForce = 14400
    };
getRow(40072,6)->
    #pet_skills_upgradingCfg {
    skill_id = 40072,
    level = 6,
    item_cost = [13002,3],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 120,
    des = "弹奏迷魂曲，对周围30米敌人进行4次迷惑攻击，每次造成{a}%攻击的伤害并降低对方{b}%的闪避等级，持续{c}秒",
    character_a = "322",
    character_b = "30",
    character_c = "5",
    fightForce = 19800
    };
getRow(40072,7)->
    #pet_skills_upgradingCfg {
    skill_id = 40072,
    level = 7,
    item_cost = [13002,4],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 140,
    des = "弹奏迷魂曲，对周围30米敌人进行4次迷惑攻击，每次造成{a}%攻击的伤害并降低对方{b}%的闪避等级，持续{c}秒",
    character_a = "354",
    character_b = "32",
    character_c = "5",
    fightForce = 27000
    };
getRow(40072,8)->
    #pet_skills_upgradingCfg {
    skill_id = 40072,
    level = 8,
    item_cost = [13002,4],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 160,
    des = "弹奏迷魂曲，对周围30米敌人进行4次迷惑攻击，每次造成{a}%攻击的伤害并降低对方{b}%的闪避等级，持续{c}秒",
    character_a = "386",
    character_b = "34",
    character_c = "5",
    fightForce = 34200
    };
getRow(40072,9)->
    #pet_skills_upgradingCfg {
    skill_id = 40072,
    level = 9,
    item_cost = [13002,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 180,
    des = "弹奏迷魂曲，对周围30米敌人进行4次迷惑攻击，每次造成{a}%攻击的伤害并降低对方{b}%的闪避等级，持续{c}秒",
    character_a = "418",
    character_b = "36",
    character_c = "5",
    fightForce = 43200
    };
getRow(40072,10)->
    #pet_skills_upgradingCfg {
    skill_id = 40072,
    level = 10,
    item_cost = [13002,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 200,
    des = "弹奏迷魂曲，对周围30米敌人进行4次迷惑攻击，每次造成{a}%攻击的伤害并降低对方{b}%的闪避等级，持续{c}秒",
    character_a = "450",
    character_b = "38",
    character_c = "5",
    fightForce = 52200
    };
getRow(40072,11)->
    #pet_skills_upgradingCfg {
    skill_id = 40072,
    level = 11,
    item_cost = [13002,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 200,
    des = "弹奏迷魂曲，对周围30米敌人进行4次迷惑攻击，每次造成{a}%攻击的伤害并降低对方{b}%的闪避等级，持续{c}秒",
    character_a = "482",
    character_b = "40",
    character_c = "5",
    fightForce = 61200
    };
getRow(40080,1)->
    #pet_skills_upgradingCfg {
    skill_id = 40080,
    level = 1,
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "攻击前方单体目标，造成{a}%攻击的伤害",
    character_a = "749",
    character_b = "",
    character_c = "",
    fightForce = 0
    };
getRow(40080,2)->
    #pet_skills_upgradingCfg {
    skill_id = 40080,
    level = 2,
    item_cost = [13002,1],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 40,
    des = "攻击前方单体目标，造成{a}%攻击的伤害",
    character_a = "901",
    character_b = "",
    character_c = "",
    fightForce = 1800
    };
getRow(40080,3)->
    #pet_skills_upgradingCfg {
    skill_id = 40080,
    level = 3,
    item_cost = [13002,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 60,
    des = "攻击前方单体目标，造成{a}%攻击的伤害",
    character_a = "1053",
    character_b = "",
    character_c = "",
    fightForce = 5400
    };
getRow(40080,4)->
    #pet_skills_upgradingCfg {
    skill_id = 40080,
    level = 4,
    item_cost = [13002,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 80,
    des = "攻击前方单体目标，造成{a}%攻击的伤害",
    character_a = "1205",
    character_b = "",
    character_c = "",
    fightForce = 9000
    };
getRow(40080,5)->
    #pet_skills_upgradingCfg {
    skill_id = 40080,
    level = 5,
    item_cost = [13002,3],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 100,
    des = "攻击前方单体目标，造成{a}%攻击的伤害",
    character_a = "1357",
    character_b = "",
    character_c = "",
    fightForce = 14400
    };
getRow(40080,6)->
    #pet_skills_upgradingCfg {
    skill_id = 40080,
    level = 6,
    item_cost = [13002,3],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 120,
    des = "攻击前方单体目标，造成{a}%攻击的伤害",
    character_a = "1509",
    character_b = "",
    character_c = "",
    fightForce = 19800
    };
getRow(40080,7)->
    #pet_skills_upgradingCfg {
    skill_id = 40080,
    level = 7,
    item_cost = [13002,4],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 140,
    des = "攻击前方单体目标，造成{a}%攻击的伤害",
    character_a = "1661",
    character_b = "",
    character_c = "",
    fightForce = 27000
    };
getRow(40080,8)->
    #pet_skills_upgradingCfg {
    skill_id = 40080,
    level = 8,
    item_cost = [13002,4],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 160,
    des = "攻击前方单体目标，造成{a}%攻击的伤害",
    character_a = "1813",
    character_b = "",
    character_c = "",
    fightForce = 34200
    };
getRow(40080,9)->
    #pet_skills_upgradingCfg {
    skill_id = 40080,
    level = 9,
    item_cost = [13002,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 180,
    des = "攻击前方单体目标，造成{a}%攻击的伤害",
    character_a = "1965",
    character_b = "",
    character_c = "",
    fightForce = 43200
    };
getRow(40080,10)->
    #pet_skills_upgradingCfg {
    skill_id = 40080,
    level = 10,
    item_cost = [13002,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 200,
    des = "攻击前方单体目标，造成{a}%攻击的伤害",
    character_a = "2117",
    character_b = "",
    character_c = "",
    fightForce = 52200
    };
getRow(40080,11)->
    #pet_skills_upgradingCfg {
    skill_id = 40080,
    level = 11,
    item_cost = [13002,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 200,
    des = "攻击前方单体目标，造成{a}%攻击的伤害",
    character_a = "2269",
    character_b = "",
    character_c = "",
    fightForce = 61200
    };
getRow(40081,1)->
    #pet_skills_upgradingCfg {
    skill_id = 40081,
    level = 1,
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "立刻为主人恢复{a}%攻击的生命值，有50%几率为主人增加寒冰护盾，提升主人{b}%防御，持续{c}秒",
    character_a = "312",
    character_b = "20",
    character_c = "5",
    fightForce = 0
    };
getRow(40081,2)->
    #pet_skills_upgradingCfg {
    skill_id = 40081,
    level = 2,
    item_cost = [13002,1],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 40,
    des = "立刻为主人恢复{a}%攻击的生命值，有50%几率为主人增加寒冰护盾，提升主人{b}%防御，持续{c}秒",
    character_a = "374",
    character_b = "24",
    character_c = "5",
    fightForce = 1800
    };
getRow(40081,3)->
    #pet_skills_upgradingCfg {
    skill_id = 40081,
    level = 3,
    item_cost = [13002,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 60,
    des = "立刻为主人恢复{a}%攻击的生命值，有50%几率为主人增加寒冰护盾，提升主人{b}%防御，持续{c}秒",
    character_a = "436",
    character_b = "28",
    character_c = "5",
    fightForce = 5400
    };
getRow(40081,4)->
    #pet_skills_upgradingCfg {
    skill_id = 40081,
    level = 4,
    item_cost = [13002,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 80,
    des = "立刻为主人恢复{a}%攻击的生命值，有50%几率为主人增加寒冰护盾，提升主人{b}%防御，持续{c}秒",
    character_a = "498",
    character_b = "32",
    character_c = "5",
    fightForce = 9000
    };
getRow(40081,5)->
    #pet_skills_upgradingCfg {
    skill_id = 40081,
    level = 5,
    item_cost = [13002,3],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 100,
    des = "立刻为主人恢复{a}%攻击的生命值，有50%几率为主人增加寒冰护盾，提升主人{b}%防御，持续{c}秒",
    character_a = "560",
    character_b = "36",
    character_c = "5",
    fightForce = 14400
    };
getRow(40081,6)->
    #pet_skills_upgradingCfg {
    skill_id = 40081,
    level = 6,
    item_cost = [13002,3],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 120,
    des = "立刻为主人恢复{a}%攻击的生命值，有50%几率为主人增加寒冰护盾，提升主人{b}%防御，持续{c}秒",
    character_a = "622",
    character_b = "40",
    character_c = "5",
    fightForce = 19800
    };
getRow(40081,7)->
    #pet_skills_upgradingCfg {
    skill_id = 40081,
    level = 7,
    item_cost = [13002,4],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 140,
    des = "立刻为主人恢复{a}%攻击的生命值，有50%几率为主人增加寒冰护盾，提升主人{b}%防御，持续{c}秒",
    character_a = "684",
    character_b = "44",
    character_c = "5",
    fightForce = 27000
    };
getRow(40081,8)->
    #pet_skills_upgradingCfg {
    skill_id = 40081,
    level = 8,
    item_cost = [13002,4],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 160,
    des = "立刻为主人恢复{a}%攻击的生命值，有50%几率为主人增加寒冰护盾，提升主人{b}%防御，持续{c}秒",
    character_a = "746",
    character_b = "48",
    character_c = "5",
    fightForce = 34200
    };
getRow(40081,9)->
    #pet_skills_upgradingCfg {
    skill_id = 40081,
    level = 9,
    item_cost = [13002,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 180,
    des = "立刻为主人恢复{a}%攻击的生命值，有50%几率为主人增加寒冰护盾，提升主人{b}%防御，持续{c}秒",
    character_a = "808",
    character_b = "52",
    character_c = "5",
    fightForce = 43200
    };
getRow(40081,10)->
    #pet_skills_upgradingCfg {
    skill_id = 40081,
    level = 10,
    item_cost = [13002,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 200,
    des = "立刻为主人恢复{a}%攻击的生命值，有50%几率为主人增加寒冰护盾，提升主人{b}%防御，持续{c}秒",
    character_a = "870",
    character_b = "56",
    character_c = "5",
    fightForce = 52200
    };
getRow(40081,11)->
    #pet_skills_upgradingCfg {
    skill_id = 40081,
    level = 11,
    item_cost = [13002,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 200,
    des = "立刻为主人恢复{a}%攻击的生命值，有50%几率为主人增加寒冰护盾，提升主人{b}%防御，持续{c}秒",
    character_a = "932",
    character_b = "60",
    character_c = "5",
    fightForce = 61200
    };
getRow(40082,1)->
    #pet_skills_upgradingCfg {
    skill_id = 40082,
    level = 1,
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "自身30米范围内，飘洒大面积雪花，冰冻范围内所有目标，持续{c}秒，并受到6次{a}%攻击的持续伤害",
    character_a = "92",
    character_b = "",
    character_c = "2",
    fightForce = 0
    };
getRow(40082,2)->
    #pet_skills_upgradingCfg {
    skill_id = 40082,
    level = 2,
    item_cost = [13002,1],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 40,
    des = "自身30米范围内，飘洒大面积雪花，冰冻范围内所有目标，持续{c}秒，并受到6次{a}%攻击的持续伤害",
    character_a = "110",
    character_b = "",
    character_c = "2",
    fightForce = 1800
    };
getRow(40082,3)->
    #pet_skills_upgradingCfg {
    skill_id = 40082,
    level = 3,
    item_cost = [13002,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 60,
    des = "自身30米范围内，飘洒大面积雪花，冰冻范围内所有目标，持续{c}秒，并受到6次{a}%攻击的持续伤害",
    character_a = "128",
    character_b = "",
    character_c = "2",
    fightForce = 5400
    };
getRow(40082,4)->
    #pet_skills_upgradingCfg {
    skill_id = 40082,
    level = 4,
    item_cost = [13002,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 80,
    des = "自身30米范围内，飘洒大面积雪花，冰冻范围内所有目标，持续{c}秒，并受到6次{a}%攻击的持续伤害",
    character_a = "146",
    character_b = "",
    character_c = "2",
    fightForce = 9000
    };
getRow(40082,5)->
    #pet_skills_upgradingCfg {
    skill_id = 40082,
    level = 5,
    item_cost = [13002,3],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 100,
    des = "自身30米范围内，飘洒大面积雪花，冰冻范围内所有目标，持续{c}秒，并受到6次{a}%攻击的持续伤害",
    character_a = "164",
    character_b = "",
    character_c = "2",
    fightForce = 14400
    };
getRow(40082,6)->
    #pet_skills_upgradingCfg {
    skill_id = 40082,
    level = 6,
    item_cost = [13002,3],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 120,
    des = "自身30米范围内，飘洒大面积雪花，冰冻范围内所有目标，持续{c}秒，并受到6次{a}%攻击的持续伤害",
    character_a = "182",
    character_b = "",
    character_c = "2",
    fightForce = 19800
    };
getRow(40082,7)->
    #pet_skills_upgradingCfg {
    skill_id = 40082,
    level = 7,
    item_cost = [13002,4],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 140,
    des = "自身30米范围内，飘洒大面积雪花，冰冻范围内所有目标，持续{c}秒，并受到6次{a}%攻击的持续伤害",
    character_a = "200",
    character_b = "",
    character_c = "2",
    fightForce = 27000
    };
getRow(40082,8)->
    #pet_skills_upgradingCfg {
    skill_id = 40082,
    level = 8,
    item_cost = [13002,4],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 160,
    des = "自身30米范围内，飘洒大面积雪花，冰冻范围内所有目标，持续{c}秒，并受到6次{a}%攻击的持续伤害",
    character_a = "218",
    character_b = "",
    character_c = "2",
    fightForce = 34200
    };
getRow(40082,9)->
    #pet_skills_upgradingCfg {
    skill_id = 40082,
    level = 9,
    item_cost = [13002,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 180,
    des = "自身30米范围内，飘洒大面积雪花，冰冻范围内所有目标，持续{c}秒，并受到6次{a}%攻击的持续伤害",
    character_a = "236",
    character_b = "",
    character_c = "2",
    fightForce = 43200
    };
getRow(40082,10)->
    #pet_skills_upgradingCfg {
    skill_id = 40082,
    level = 10,
    item_cost = [13002,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 200,
    des = "自身30米范围内，飘洒大面积雪花，冰冻范围内所有目标，持续{c}秒，并受到6次{a}%攻击的持续伤害",
    character_a = "254",
    character_b = "",
    character_c = "2",
    fightForce = 52200
    };
getRow(40082,11)->
    #pet_skills_upgradingCfg {
    skill_id = 40082,
    level = 11,
    item_cost = [13002,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 200,
    des = "自身30米范围内，飘洒大面积雪花，冰冻范围内所有目标，持续{c}秒，并受到6次{a}%攻击的持续伤害",
    character_a = "272",
    character_b = "",
    character_c = "2",
    fightForce = 61200
    };
getRow(40090,1)->
    #pet_skills_upgradingCfg {
    skill_id = 40090,
    level = 1,
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "对前方多个敌人发射粒子弹道，总共造成{a}%攻击的伤害",
    character_a = "640",
    character_b = "",
    character_c = "",
    fightForce = 0
    };
getRow(40090,2)->
    #pet_skills_upgradingCfg {
    skill_id = 40090,
    level = 2,
    item_cost = [13002,1],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 40,
    des = "对前方多个敌人发射粒子弹道，总共造成{a}%攻击的伤害",
    character_a = "770",
    character_b = "",
    character_c = "",
    fightForce = 1800
    };
getRow(40090,3)->
    #pet_skills_upgradingCfg {
    skill_id = 40090,
    level = 3,
    item_cost = [13002,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 60,
    des = "对前方多个敌人发射粒子弹道，总共造成{a}%攻击的伤害",
    character_a = "900",
    character_b = "",
    character_c = "",
    fightForce = 5400
    };
getRow(40090,4)->
    #pet_skills_upgradingCfg {
    skill_id = 40090,
    level = 4,
    item_cost = [13002,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 80,
    des = "对前方多个敌人发射粒子弹道，总共造成{a}%攻击的伤害",
    character_a = "1030",
    character_b = "",
    character_c = "",
    fightForce = 9000
    };
getRow(40090,5)->
    #pet_skills_upgradingCfg {
    skill_id = 40090,
    level = 5,
    item_cost = [13002,3],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 100,
    des = "对前方多个敌人发射粒子弹道，总共造成{a}%攻击的伤害",
    character_a = "1160",
    character_b = "",
    character_c = "",
    fightForce = 14400
    };
getRow(40090,6)->
    #pet_skills_upgradingCfg {
    skill_id = 40090,
    level = 6,
    item_cost = [13002,3],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 120,
    des = "对前方多个敌人发射粒子弹道，总共造成{a}%攻击的伤害",
    character_a = "1290",
    character_b = "",
    character_c = "",
    fightForce = 19800
    };
getRow(40090,7)->
    #pet_skills_upgradingCfg {
    skill_id = 40090,
    level = 7,
    item_cost = [13002,4],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 140,
    des = "对前方多个敌人发射粒子弹道，总共造成{a}%攻击的伤害",
    character_a = "1420",
    character_b = "",
    character_c = "",
    fightForce = 27000
    };
getRow(40090,8)->
    #pet_skills_upgradingCfg {
    skill_id = 40090,
    level = 8,
    item_cost = [13002,4],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 160,
    des = "对前方多个敌人发射粒子弹道，总共造成{a}%攻击的伤害",
    character_a = "1550",
    character_b = "",
    character_c = "",
    fightForce = 34200
    };
getRow(40090,9)->
    #pet_skills_upgradingCfg {
    skill_id = 40090,
    level = 9,
    item_cost = [13002,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 180,
    des = "对前方多个敌人发射粒子弹道，总共造成{a}%攻击的伤害",
    character_a = "1680",
    character_b = "",
    character_c = "",
    fightForce = 43200
    };
getRow(40090,10)->
    #pet_skills_upgradingCfg {
    skill_id = 40090,
    level = 10,
    item_cost = [13002,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 200,
    des = "对前方多个敌人发射粒子弹道，总共造成{a}%攻击的伤害",
    character_a = "1810",
    character_b = "",
    character_c = "",
    fightForce = 52200
    };
getRow(40090,11)->
    #pet_skills_upgradingCfg {
    skill_id = 40090,
    level = 11,
    item_cost = [13002,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 200,
    des = "对前方多个敌人发射粒子弹道，总共造成{a}%攻击的伤害",
    character_a = "1940",
    character_b = "",
    character_c = "",
    fightForce = 61200
    };
getRow(40091,1)->
    #pet_skills_upgradingCfg {
    skill_id = 40091,
    level = 1,
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "对敌人周围造成{a}%攻击的伤害",
    character_a = "560",
    character_b = "",
    character_c = "",
    fightForce = 0
    };
getRow(40091,2)->
    #pet_skills_upgradingCfg {
    skill_id = 40091,
    level = 2,
    item_cost = [13002,1],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 40,
    des = "对敌人周围造成{a}%攻击的伤害",
    character_a = "672",
    character_b = "",
    character_c = "",
    fightForce = 1800
    };
getRow(40091,3)->
    #pet_skills_upgradingCfg {
    skill_id = 40091,
    level = 3,
    item_cost = [13002,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 60,
    des = "对敌人周围造成{a}%攻击的伤害",
    character_a = "784",
    character_b = "",
    character_c = "",
    fightForce = 5400
    };
getRow(40091,4)->
    #pet_skills_upgradingCfg {
    skill_id = 40091,
    level = 4,
    item_cost = [13002,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 80,
    des = "对敌人周围造成{a}%攻击的伤害",
    character_a = "896",
    character_b = "",
    character_c = "",
    fightForce = 9000
    };
getRow(40091,5)->
    #pet_skills_upgradingCfg {
    skill_id = 40091,
    level = 5,
    item_cost = [13002,3],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 100,
    des = "对敌人周围造成{a}%攻击的伤害",
    character_a = "1008",
    character_b = "",
    character_c = "",
    fightForce = 14400
    };
getRow(40091,6)->
    #pet_skills_upgradingCfg {
    skill_id = 40091,
    level = 6,
    item_cost = [13002,3],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 120,
    des = "对敌人周围造成{a}%攻击的伤害",
    character_a = "1120",
    character_b = "",
    character_c = "",
    fightForce = 19800
    };
getRow(40091,7)->
    #pet_skills_upgradingCfg {
    skill_id = 40091,
    level = 7,
    item_cost = [13002,4],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 140,
    des = "对敌人周围造成{a}%攻击的伤害",
    character_a = "1232",
    character_b = "",
    character_c = "",
    fightForce = 27000
    };
getRow(40091,8)->
    #pet_skills_upgradingCfg {
    skill_id = 40091,
    level = 8,
    item_cost = [13002,4],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 160,
    des = "对敌人周围造成{a}%攻击的伤害",
    character_a = "1344",
    character_b = "",
    character_c = "",
    fightForce = 34200
    };
getRow(40091,9)->
    #pet_skills_upgradingCfg {
    skill_id = 40091,
    level = 9,
    item_cost = [13002,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 180,
    des = "对敌人周围造成{a}%攻击的伤害",
    character_a = "1456",
    character_b = "",
    character_c = "",
    fightForce = 43200
    };
getRow(40091,10)->
    #pet_skills_upgradingCfg {
    skill_id = 40091,
    level = 10,
    item_cost = [13002,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 200,
    des = "对敌人周围造成{a}%攻击的伤害",
    character_a = "1568",
    character_b = "",
    character_c = "",
    fightForce = 52200
    };
getRow(40091,11)->
    #pet_skills_upgradingCfg {
    skill_id = 40091,
    level = 11,
    item_cost = [13002,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 200,
    des = "对敌人周围造成{a}%攻击的伤害",
    character_a = "1680",
    character_b = "",
    character_c = "",
    fightForce = 61200
    };
getRow(40092,1)->
    #pet_skills_upgradingCfg {
    skill_id = 40092,
    level = 1,
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "向前方发射粒子射线，前方30米矩形范围内敌人受到{a}%攻击的伤害，并造成对方禁魔，持续{c}秒",
    character_a = "470",
    character_b = "",
    character_c = "3",
    fightForce = 0
    };
getRow(40092,2)->
    #pet_skills_upgradingCfg {
    skill_id = 40092,
    level = 2,
    item_cost = [13002,1],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 40,
    des = "向前方发射粒子射线，前方30米矩形范围内敌人受到{a}%攻击的伤害，并造成对方禁魔，持续{c}秒",
    character_a = "563",
    character_b = "",
    character_c = "3",
    fightForce = 1800
    };
getRow(40092,3)->
    #pet_skills_upgradingCfg {
    skill_id = 40092,
    level = 3,
    item_cost = [13002,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 60,
    des = "向前方发射粒子射线，前方30米矩形范围内敌人受到{a}%攻击的伤害，并造成对方禁魔，持续{c}秒",
    character_a = "656",
    character_b = "",
    character_c = "3",
    fightForce = 5400
    };
getRow(40092,4)->
    #pet_skills_upgradingCfg {
    skill_id = 40092,
    level = 4,
    item_cost = [13002,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 80,
    des = "向前方发射粒子射线，前方30米矩形范围内敌人受到{a}%攻击的伤害，并造成对方禁魔，持续{c}秒",
    character_a = "749",
    character_b = "",
    character_c = "3",
    fightForce = 9000
    };
getRow(40092,5)->
    #pet_skills_upgradingCfg {
    skill_id = 40092,
    level = 5,
    item_cost = [13002,3],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 100,
    des = "向前方发射粒子射线，前方30米矩形范围内敌人受到{a}%攻击的伤害，并造成对方禁魔，持续{c}秒",
    character_a = "842",
    character_b = "",
    character_c = "3",
    fightForce = 14400
    };
getRow(40092,6)->
    #pet_skills_upgradingCfg {
    skill_id = 40092,
    level = 6,
    item_cost = [13002,3],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 120,
    des = "向前方发射粒子射线，前方30米矩形范围内敌人受到{a}%攻击的伤害，并造成对方禁魔，持续{c}秒",
    character_a = "935",
    character_b = "",
    character_c = "3",
    fightForce = 19800
    };
getRow(40092,7)->
    #pet_skills_upgradingCfg {
    skill_id = 40092,
    level = 7,
    item_cost = [13002,4],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 140,
    des = "向前方发射粒子射线，前方30米矩形范围内敌人受到{a}%攻击的伤害，并造成对方禁魔，持续{c}秒",
    character_a = "1028",
    character_b = "",
    character_c = "3",
    fightForce = 27000
    };
getRow(40092,8)->
    #pet_skills_upgradingCfg {
    skill_id = 40092,
    level = 8,
    item_cost = [13002,4],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 160,
    des = "向前方发射粒子射线，前方30米矩形范围内敌人受到{a}%攻击的伤害，并造成对方禁魔，持续{c}秒",
    character_a = "1121",
    character_b = "",
    character_c = "3",
    fightForce = 34200
    };
getRow(40092,9)->
    #pet_skills_upgradingCfg {
    skill_id = 40092,
    level = 9,
    item_cost = [13002,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 180,
    des = "向前方发射粒子射线，前方30米矩形范围内敌人受到{a}%攻击的伤害，并造成对方禁魔，持续{c}秒",
    character_a = "1214",
    character_b = "",
    character_c = "3",
    fightForce = 43200
    };
getRow(40092,10)->
    #pet_skills_upgradingCfg {
    skill_id = 40092,
    level = 10,
    item_cost = [13002,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 200,
    des = "向前方发射粒子射线，前方30米矩形范围内敌人受到{a}%攻击的伤害，并造成对方禁魔，持续{c}秒",
    character_a = "1307",
    character_b = "",
    character_c = "3",
    fightForce = 52200
    };
getRow(40092,11)->
    #pet_skills_upgradingCfg {
    skill_id = 40092,
    level = 11,
    item_cost = [13002,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 200,
    des = "向前方发射粒子射线，前方30米矩形范围内敌人受到{a}%攻击的伤害，并造成对方禁魔，持续{c}秒",
    character_a = "1400",
    character_b = "",
    character_c = "3",
    fightForce = 61200
    };
getRow(40100,1)->
    #pet_skills_upgradingCfg {
    skill_id = 40100,
    level = 1,
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "对前方直线多个敌人进行攻击，总共造成{a}%攻击的伤害",
    character_a = "640",
    character_b = "",
    character_c = "",
    fightForce = 0
    };
getRow(40100,2)->
    #pet_skills_upgradingCfg {
    skill_id = 40100,
    level = 2,
    item_cost = [13002,1],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 40,
    des = "对前方直线多个敌人进行攻击，总共造成{a}%攻击的伤害",
    character_a = "770",
    character_b = "",
    character_c = "",
    fightForce = 1800
    };
getRow(40100,3)->
    #pet_skills_upgradingCfg {
    skill_id = 40100,
    level = 3,
    item_cost = [13002,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 60,
    des = "对前方直线多个敌人进行攻击，总共造成{a}%攻击的伤害",
    character_a = "900",
    character_b = "",
    character_c = "",
    fightForce = 5400
    };
getRow(40100,4)->
    #pet_skills_upgradingCfg {
    skill_id = 40100,
    level = 4,
    item_cost = [13002,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 80,
    des = "对前方直线多个敌人进行攻击，总共造成{a}%攻击的伤害",
    character_a = "1030",
    character_b = "",
    character_c = "",
    fightForce = 9000
    };
getRow(40100,5)->
    #pet_skills_upgradingCfg {
    skill_id = 40100,
    level = 5,
    item_cost = [13002,3],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 100,
    des = "对前方直线多个敌人进行攻击，总共造成{a}%攻击的伤害",
    character_a = "1160",
    character_b = "",
    character_c = "",
    fightForce = 14400
    };
getRow(40100,6)->
    #pet_skills_upgradingCfg {
    skill_id = 40100,
    level = 6,
    item_cost = [13002,3],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 120,
    des = "对前方直线多个敌人进行攻击，总共造成{a}%攻击的伤害",
    character_a = "1290",
    character_b = "",
    character_c = "",
    fightForce = 19800
    };
getRow(40100,7)->
    #pet_skills_upgradingCfg {
    skill_id = 40100,
    level = 7,
    item_cost = [13002,4],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 140,
    des = "对前方直线多个敌人进行攻击，总共造成{a}%攻击的伤害",
    character_a = "1420",
    character_b = "",
    character_c = "",
    fightForce = 27000
    };
getRow(40100,8)->
    #pet_skills_upgradingCfg {
    skill_id = 40100,
    level = 8,
    item_cost = [13002,4],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 160,
    des = "对前方直线多个敌人进行攻击，总共造成{a}%攻击的伤害",
    character_a = "1550",
    character_b = "",
    character_c = "",
    fightForce = 34200
    };
getRow(40100,9)->
    #pet_skills_upgradingCfg {
    skill_id = 40100,
    level = 9,
    item_cost = [13002,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 180,
    des = "对前方直线多个敌人进行攻击，总共造成{a}%攻击的伤害",
    character_a = "1680",
    character_b = "",
    character_c = "",
    fightForce = 43200
    };
getRow(40100,10)->
    #pet_skills_upgradingCfg {
    skill_id = 40100,
    level = 10,
    item_cost = [13002,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 200,
    des = "对前方直线多个敌人进行攻击，总共造成{a}%攻击的伤害",
    character_a = "1810",
    character_b = "",
    character_c = "",
    fightForce = 52200
    };
getRow(40100,11)->
    #pet_skills_upgradingCfg {
    skill_id = 40100,
    level = 11,
    item_cost = [13002,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 200,
    des = "对前方直线多个敌人进行攻击，总共造成{a}%攻击的伤害",
    character_a = "1940",
    character_b = "",
    character_c = "",
    fightForce = 61200
    };
getRow(40101,1)->
    #pet_skills_upgradingCfg {
    skill_id = 40101,
    level = 1,
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "给自己创建一个伤害吸收盾，吸收自身物攻{a}%的伤害，持续{c}秒，并让周围怪物强制攻击自己",
    character_a = "480",
    character_b = "",
    character_c = "5",
    fightForce = 0
    };
getRow(40101,2)->
    #pet_skills_upgradingCfg {
    skill_id = 40101,
    level = 2,
    item_cost = [13002,1],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 40,
    des = "给自己创建一个伤害吸收盾，吸收自身物攻{a}%的伤害，持续{c}秒，并让周围怪物强制攻击自己",
    character_a = "576",
    character_b = "",
    character_c = "5",
    fightForce = 1800
    };
getRow(40101,3)->
    #pet_skills_upgradingCfg {
    skill_id = 40101,
    level = 3,
    item_cost = [13002,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 60,
    des = "给自己创建一个伤害吸收盾，吸收自身物攻{a}%的伤害，持续{c}秒，并让周围怪物强制攻击自己",
    character_a = "672",
    character_b = "",
    character_c = "5",
    fightForce = 5400
    };
getRow(40101,4)->
    #pet_skills_upgradingCfg {
    skill_id = 40101,
    level = 4,
    item_cost = [13002,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 80,
    des = "给自己创建一个伤害吸收盾，吸收自身物攻{a}%的伤害，持续{c}秒，并让周围怪物强制攻击自己",
    character_a = "768",
    character_b = "",
    character_c = "5",
    fightForce = 9000
    };
getRow(40101,5)->
    #pet_skills_upgradingCfg {
    skill_id = 40101,
    level = 5,
    item_cost = [13002,3],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 100,
    des = "给自己创建一个伤害吸收盾，吸收自身物攻{a}%的伤害，持续{c}秒，并让周围怪物强制攻击自己",
    character_a = "864",
    character_b = "",
    character_c = "5",
    fightForce = 14400
    };
getRow(40101,6)->
    #pet_skills_upgradingCfg {
    skill_id = 40101,
    level = 6,
    item_cost = [13002,3],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 120,
    des = "给自己创建一个伤害吸收盾，吸收自身物攻{a}%的伤害，持续{c}秒，并让周围怪物强制攻击自己",
    character_a = "960",
    character_b = "",
    character_c = "5",
    fightForce = 19800
    };
getRow(40101,7)->
    #pet_skills_upgradingCfg {
    skill_id = 40101,
    level = 7,
    item_cost = [13002,4],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 140,
    des = "给自己创建一个伤害吸收盾，吸收自身物攻{a}%的伤害，持续{c}秒，并让周围怪物强制攻击自己",
    character_a = "1056",
    character_b = "",
    character_c = "5",
    fightForce = 27000
    };
getRow(40101,8)->
    #pet_skills_upgradingCfg {
    skill_id = 40101,
    level = 8,
    item_cost = [13002,4],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 160,
    des = "给自己创建一个伤害吸收盾，吸收自身物攻{a}%的伤害，持续{c}秒，并让周围怪物强制攻击自己",
    character_a = "1152",
    character_b = "",
    character_c = "5",
    fightForce = 34200
    };
getRow(40101,9)->
    #pet_skills_upgradingCfg {
    skill_id = 40101,
    level = 9,
    item_cost = [13002,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 180,
    des = "给自己创建一个伤害吸收盾，吸收自身物攻{a}%的伤害，持续{c}秒，并让周围怪物强制攻击自己",
    character_a = "1248",
    character_b = "",
    character_c = "5",
    fightForce = 43200
    };
getRow(40101,10)->
    #pet_skills_upgradingCfg {
    skill_id = 40101,
    level = 10,
    item_cost = [13002,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 200,
    des = "给自己创建一个伤害吸收盾，吸收自身物攻{a}%的伤害，持续{c}秒，并让周围怪物强制攻击自己",
    character_a = "1344",
    character_b = "",
    character_c = "5",
    fightForce = 52200
    };
getRow(40101,11)->
    #pet_skills_upgradingCfg {
    skill_id = 40101,
    level = 11,
    item_cost = [13002,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 200,
    des = "给自己创建一个伤害吸收盾，吸收自身物攻{a}%的伤害，持续{c}秒，并让周围怪物强制攻击自己",
    character_a = "1440",
    character_b = "",
    character_c = "5",
    fightForce = 61200
    };
getRow(40102,1)->
    #pet_skills_upgradingCfg {
    skill_id = 40102,
    level = 1,
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "对自身前方扇形范围进行大面积进行5次扫射，每次造成{a}%攻击的伤害",
    character_a = "134",
    character_b = "",
    character_c = "",
    fightForce = 0
    };
getRow(40102,2)->
    #pet_skills_upgradingCfg {
    skill_id = 40102,
    level = 2,
    item_cost = [13002,1],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 40,
    des = "对自身前方扇形范围进行大面积进行5次扫射，每次造成{a}%攻击的伤害",
    character_a = "161",
    character_b = "",
    character_c = "",
    fightForce = 1800
    };
getRow(40102,3)->
    #pet_skills_upgradingCfg {
    skill_id = 40102,
    level = 3,
    item_cost = [13002,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 60,
    des = "对自身前方扇形范围进行大面积进行5次扫射，每次造成{a}%攻击的伤害",
    character_a = "188",
    character_b = "",
    character_c = "",
    fightForce = 5400
    };
getRow(40102,4)->
    #pet_skills_upgradingCfg {
    skill_id = 40102,
    level = 4,
    item_cost = [13002,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 80,
    des = "对自身前方扇形范围进行大面积进行5次扫射，每次造成{a}%攻击的伤害",
    character_a = "215",
    character_b = "",
    character_c = "",
    fightForce = 9000
    };
getRow(40102,5)->
    #pet_skills_upgradingCfg {
    skill_id = 40102,
    level = 5,
    item_cost = [13002,3],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 100,
    des = "对自身前方扇形范围进行大面积进行5次扫射，每次造成{a}%攻击的伤害",
    character_a = "242",
    character_b = "",
    character_c = "",
    fightForce = 14400
    };
getRow(40102,6)->
    #pet_skills_upgradingCfg {
    skill_id = 40102,
    level = 6,
    item_cost = [13002,3],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 120,
    des = "对自身前方扇形范围进行大面积进行5次扫射，每次造成{a}%攻击的伤害",
    character_a = "269",
    character_b = "",
    character_c = "",
    fightForce = 19800
    };
getRow(40102,7)->
    #pet_skills_upgradingCfg {
    skill_id = 40102,
    level = 7,
    item_cost = [13002,4],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 140,
    des = "对自身前方扇形范围进行大面积进行5次扫射，每次造成{a}%攻击的伤害",
    character_a = "296",
    character_b = "",
    character_c = "",
    fightForce = 27000
    };
getRow(40102,8)->
    #pet_skills_upgradingCfg {
    skill_id = 40102,
    level = 8,
    item_cost = [13002,4],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 160,
    des = "对自身前方扇形范围进行大面积进行5次扫射，每次造成{a}%攻击的伤害",
    character_a = "323",
    character_b = "",
    character_c = "",
    fightForce = 34200
    };
getRow(40102,9)->
    #pet_skills_upgradingCfg {
    skill_id = 40102,
    level = 9,
    item_cost = [13002,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 180,
    des = "对自身前方扇形范围进行大面积进行5次扫射，每次造成{a}%攻击的伤害",
    character_a = "350",
    character_b = "",
    character_c = "",
    fightForce = 43200
    };
getRow(40102,10)->
    #pet_skills_upgradingCfg {
    skill_id = 40102,
    level = 10,
    item_cost = [13002,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 200,
    des = "对自身前方扇形范围进行大面积进行5次扫射，每次造成{a}%攻击的伤害",
    character_a = "377",
    character_b = "",
    character_c = "",
    fightForce = 52200
    };
getRow(40102,11)->
    #pet_skills_upgradingCfg {
    skill_id = 40102,
    level = 11,
    item_cost = [13002,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 200,
    des = "对自身前方扇形范围进行大面积进行5次扫射，每次造成{a}%攻击的伤害",
    character_a = "404",
    character_b = "",
    character_c = "",
    fightForce = 61200
    };
getRow(40110,1)->
    #pet_skills_upgradingCfg {
    skill_id = 40110,
    level = 1,
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "“女人，是你在玩火”前方直线上出现3个火柱，触碰到敌人受到{a}%攻击的伤害。",
    character_a = "563",
    character_b = "",
    character_c = "",
    fightForce = 0
    };
getRow(40110,2)->
    #pet_skills_upgradingCfg {
    skill_id = 40110,
    level = 2,
    item_cost = [13002,1],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 40,
    des = "“女人，是你在玩火”前方直线上出现3个火柱，触碰到敌人受到{a}%攻击的伤害。",
    character_a = "677",
    character_b = "",
    character_c = "",
    fightForce = 1800
    };
getRow(40110,3)->
    #pet_skills_upgradingCfg {
    skill_id = 40110,
    level = 3,
    item_cost = [13002,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 60,
    des = "“女人，是你在玩火”前方直线上出现3个火柱，触碰到敌人受到{a}%攻击的伤害。",
    character_a = "791",
    character_b = "",
    character_c = "",
    fightForce = 5400
    };
getRow(40110,4)->
    #pet_skills_upgradingCfg {
    skill_id = 40110,
    level = 4,
    item_cost = [13002,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 80,
    des = "“女人，是你在玩火”前方直线上出现3个火柱，触碰到敌人受到{a}%攻击的伤害。",
    character_a = "905",
    character_b = "",
    character_c = "",
    fightForce = 9000
    };
getRow(40110,5)->
    #pet_skills_upgradingCfg {
    skill_id = 40110,
    level = 5,
    item_cost = [13002,3],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 100,
    des = "“女人，是你在玩火”前方直线上出现3个火柱，触碰到敌人受到{a}%攻击的伤害。",
    character_a = "1019",
    character_b = "",
    character_c = "",
    fightForce = 14400
    };
getRow(40110,6)->
    #pet_skills_upgradingCfg {
    skill_id = 40110,
    level = 6,
    item_cost = [13002,3],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 120,
    des = "“女人，是你在玩火”前方直线上出现3个火柱，触碰到敌人受到{a}%攻击的伤害。",
    character_a = "1133",
    character_b = "",
    character_c = "",
    fightForce = 19800
    };
getRow(40110,7)->
    #pet_skills_upgradingCfg {
    skill_id = 40110,
    level = 7,
    item_cost = [13002,4],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 140,
    des = "“女人，是你在玩火”前方直线上出现3个火柱，触碰到敌人受到{a}%攻击的伤害。",
    character_a = "1247",
    character_b = "",
    character_c = "",
    fightForce = 27000
    };
getRow(40110,8)->
    #pet_skills_upgradingCfg {
    skill_id = 40110,
    level = 8,
    item_cost = [13002,4],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 160,
    des = "“女人，是你在玩火”前方直线上出现3个火柱，触碰到敌人受到{a}%攻击的伤害。",
    character_a = "1361",
    character_b = "",
    character_c = "",
    fightForce = 34200
    };
getRow(40110,9)->
    #pet_skills_upgradingCfg {
    skill_id = 40110,
    level = 9,
    item_cost = [13002,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 180,
    des = "“女人，是你在玩火”前方直线上出现3个火柱，触碰到敌人受到{a}%攻击的伤害。",
    character_a = "1475",
    character_b = "",
    character_c = "",
    fightForce = 43200
    };
getRow(40110,10)->
    #pet_skills_upgradingCfg {
    skill_id = 40110,
    level = 10,
    item_cost = [13002,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 200,
    des = "“女人，是你在玩火”前方直线上出现3个火柱，触碰到敌人受到{a}%攻击的伤害。",
    character_a = "1589",
    character_b = "",
    character_c = "",
    fightForce = 52200
    };
getRow(40110,11)->
    #pet_skills_upgradingCfg {
    skill_id = 40110,
    level = 11,
    item_cost = [13002,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 200,
    des = "“女人，是你在玩火”前方直线上出现3个火柱，触碰到敌人受到{a}%攻击的伤害。",
    character_a = "1703",
    character_b = "",
    character_c = "",
    fightForce = 61200
    };
getRow(40111,1)->
    #pet_skills_upgradingCfg {
    skill_id = 40111,
    level = 1,
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "对自身前方释放大量火焰，造成{a}%攻击的伤害",
    character_a = "493",
    character_b = "",
    character_c = "",
    fightForce = 0
    };
getRow(40111,2)->
    #pet_skills_upgradingCfg {
    skill_id = 40111,
    level = 2,
    item_cost = [13002,1],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 40,
    des = "对自身前方释放大量火焰，造成{a}%攻击的伤害",
    character_a = "592",
    character_b = "",
    character_c = "",
    fightForce = 1800
    };
getRow(40111,3)->
    #pet_skills_upgradingCfg {
    skill_id = 40111,
    level = 3,
    item_cost = [13002,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 60,
    des = "对自身前方释放大量火焰，造成{a}%攻击的伤害",
    character_a = "691",
    character_b = "",
    character_c = "",
    fightForce = 5400
    };
getRow(40111,4)->
    #pet_skills_upgradingCfg {
    skill_id = 40111,
    level = 4,
    item_cost = [13002,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 80,
    des = "对自身前方释放大量火焰，造成{a}%攻击的伤害",
    character_a = "790",
    character_b = "",
    character_c = "",
    fightForce = 9000
    };
getRow(40111,5)->
    #pet_skills_upgradingCfg {
    skill_id = 40111,
    level = 5,
    item_cost = [13002,3],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 100,
    des = "对自身前方释放大量火焰，造成{a}%攻击的伤害",
    character_a = "889",
    character_b = "",
    character_c = "",
    fightForce = 14400
    };
getRow(40111,6)->
    #pet_skills_upgradingCfg {
    skill_id = 40111,
    level = 6,
    item_cost = [13002,3],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 120,
    des = "对自身前方释放大量火焰，造成{a}%攻击的伤害",
    character_a = "988",
    character_b = "",
    character_c = "",
    fightForce = 19800
    };
getRow(40111,7)->
    #pet_skills_upgradingCfg {
    skill_id = 40111,
    level = 7,
    item_cost = [13002,4],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 140,
    des = "对自身前方释放大量火焰，造成{a}%攻击的伤害",
    character_a = "1087",
    character_b = "",
    character_c = "",
    fightForce = 27000
    };
getRow(40111,8)->
    #pet_skills_upgradingCfg {
    skill_id = 40111,
    level = 8,
    item_cost = [13002,4],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 160,
    des = "对自身前方释放大量火焰，造成{a}%攻击的伤害",
    character_a = "1186",
    character_b = "",
    character_c = "",
    fightForce = 34200
    };
getRow(40111,9)->
    #pet_skills_upgradingCfg {
    skill_id = 40111,
    level = 9,
    item_cost = [13002,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 180,
    des = "对自身前方释放大量火焰，造成{a}%攻击的伤害",
    character_a = "1285",
    character_b = "",
    character_c = "",
    fightForce = 43200
    };
getRow(40111,10)->
    #pet_skills_upgradingCfg {
    skill_id = 40111,
    level = 10,
    item_cost = [13002,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 200,
    des = "对自身前方释放大量火焰，造成{a}%攻击的伤害",
    character_a = "1384",
    character_b = "",
    character_c = "",
    fightForce = 52200
    };
getRow(40111,11)->
    #pet_skills_upgradingCfg {
    skill_id = 40111,
    level = 11,
    item_cost = [13002,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 200,
    des = "对自身前方释放大量火焰，造成{a}%攻击的伤害",
    character_a = "1483",
    character_b = "",
    character_c = "",
    fightForce = 61200
    };
getRow(40114,1)->
    #pet_skills_upgradingCfg {
    skill_id = 40114,
    level = 1,
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "翼狮发出振奋人心的怒吼，增加主人攻击{b}%，持续{c}秒",
    character_a = "845",
    character_b = "5",
    character_c = "5",
    fightForce = 0
    };
getRow(40114,2)->
    #pet_skills_upgradingCfg {
    skill_id = 40114,
    level = 2,
    item_cost = [13002,1],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 40,
    des = "翼狮发出振奋人心的怒吼，增加主人攻击{b}%，持续{c}秒",
    character_a = "1012",
    character_b = "5.5",
    character_c = "5",
    fightForce = 1800
    };
getRow(40114,3)->
    #pet_skills_upgradingCfg {
    skill_id = 40114,
    level = 3,
    item_cost = [13002,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 60,
    des = "翼狮发出振奋人心的怒吼，增加主人攻击{b}%，持续{c}秒",
    character_a = "1179",
    character_b = "6",
    character_c = "5",
    fightForce = 5400
    };
getRow(40114,4)->
    #pet_skills_upgradingCfg {
    skill_id = 40114,
    level = 4,
    item_cost = [13002,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 80,
    des = "翼狮发出振奋人心的怒吼，增加主人攻击{b}%，持续{c}秒",
    character_a = "1346",
    character_b = "6.5",
    character_c = "5",
    fightForce = 9000
    };
getRow(40114,5)->
    #pet_skills_upgradingCfg {
    skill_id = 40114,
    level = 5,
    item_cost = [13002,3],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 100,
    des = "翼狮发出振奋人心的怒吼，增加主人攻击{b}%，持续{c}秒",
    character_a = "1513",
    character_b = "7",
    character_c = "5",
    fightForce = 14400
    };
getRow(40114,6)->
    #pet_skills_upgradingCfg {
    skill_id = 40114,
    level = 6,
    item_cost = [13002,3],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 120,
    des = "翼狮发出振奋人心的怒吼，增加主人攻击{b}%，持续{c}秒",
    character_a = "1680",
    character_b = "7.5",
    character_c = "5",
    fightForce = 19800
    };
getRow(40114,7)->
    #pet_skills_upgradingCfg {
    skill_id = 40114,
    level = 7,
    item_cost = [13002,4],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 140,
    des = "翼狮发出振奋人心的怒吼，增加主人攻击{b}%，持续{c}秒",
    character_a = "1847",
    character_b = "8",
    character_c = "5",
    fightForce = 27000
    };
getRow(40114,8)->
    #pet_skills_upgradingCfg {
    skill_id = 40114,
    level = 8,
    item_cost = [13002,4],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 160,
    des = "翼狮发出振奋人心的怒吼，增加主人攻击{b}%，持续{c}秒",
    character_a = "2014",
    character_b = "8.5",
    character_c = "5",
    fightForce = 34200
    };
getRow(40114,9)->
    #pet_skills_upgradingCfg {
    skill_id = 40114,
    level = 9,
    item_cost = [13002,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 180,
    des = "翼狮发出振奋人心的怒吼，增加主人攻击{b}%，持续{c}秒",
    character_a = "2181",
    character_b = "9",
    character_c = "5",
    fightForce = 43200
    };
getRow(40114,10)->
    #pet_skills_upgradingCfg {
    skill_id = 40114,
    level = 10,
    item_cost = [13002,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 200,
    des = "翼狮发出振奋人心的怒吼，增加主人攻击{b}%，持续{c}秒",
    character_a = "2348",
    character_b = "9.5",
    character_c = "5",
    fightForce = 52200
    };
getRow(40114,11)->
    #pet_skills_upgradingCfg {
    skill_id = 40114,
    level = 11,
    item_cost = [13002,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 200,
    des = "翼狮发出振奋人心的怒吼，增加主人攻击{b}%，持续{c}秒",
    character_a = "2515",
    character_b = "10",
    character_c = "5",
    fightForce = 61200
    };
getRow(40120,1)->
    #pet_skills_upgradingCfg {
    skill_id = 40120,
    level = 1,
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "对前方扇形敌人造成{a}%攻击的伤害",
    character_a = "640",
    character_b = "",
    character_c = "",
    fightForce = 0
    };
getRow(40120,2)->
    #pet_skills_upgradingCfg {
    skill_id = 40120,
    level = 2,
    item_cost = [13002,1],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 40,
    des = "对前方扇形敌人造成{a}%攻击的伤害",
    character_a = "770",
    character_b = "",
    character_c = "",
    fightForce = 1800
    };
getRow(40120,3)->
    #pet_skills_upgradingCfg {
    skill_id = 40120,
    level = 3,
    item_cost = [13002,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 60,
    des = "对前方扇形敌人造成{a}%攻击的伤害",
    character_a = "900",
    character_b = "",
    character_c = "",
    fightForce = 5400
    };
getRow(40120,4)->
    #pet_skills_upgradingCfg {
    skill_id = 40120,
    level = 4,
    item_cost = [13002,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 80,
    des = "对前方扇形敌人造成{a}%攻击的伤害",
    character_a = "1030",
    character_b = "",
    character_c = "",
    fightForce = 9000
    };
getRow(40120,5)->
    #pet_skills_upgradingCfg {
    skill_id = 40120,
    level = 5,
    item_cost = [13002,3],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 100,
    des = "对前方扇形敌人造成{a}%攻击的伤害",
    character_a = "1160",
    character_b = "",
    character_c = "",
    fightForce = 14400
    };
getRow(40120,6)->
    #pet_skills_upgradingCfg {
    skill_id = 40120,
    level = 6,
    item_cost = [13002,3],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 120,
    des = "对前方扇形敌人造成{a}%攻击的伤害",
    character_a = "1290",
    character_b = "",
    character_c = "",
    fightForce = 19800
    };
getRow(40120,7)->
    #pet_skills_upgradingCfg {
    skill_id = 40120,
    level = 7,
    item_cost = [13002,4],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 140,
    des = "对前方扇形敌人造成{a}%攻击的伤害",
    character_a = "1420",
    character_b = "",
    character_c = "",
    fightForce = 27000
    };
getRow(40120,8)->
    #pet_skills_upgradingCfg {
    skill_id = 40120,
    level = 8,
    item_cost = [13002,4],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 160,
    des = "对前方扇形敌人造成{a}%攻击的伤害",
    character_a = "1550",
    character_b = "",
    character_c = "",
    fightForce = 34200
    };
getRow(40120,9)->
    #pet_skills_upgradingCfg {
    skill_id = 40120,
    level = 9,
    item_cost = [13002,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 180,
    des = "对前方扇形敌人造成{a}%攻击的伤害",
    character_a = "1680",
    character_b = "",
    character_c = "",
    fightForce = 43200
    };
getRow(40120,10)->
    #pet_skills_upgradingCfg {
    skill_id = 40120,
    level = 10,
    item_cost = [13002,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 200,
    des = "对前方扇形敌人造成{a}%攻击的伤害",
    character_a = "1810",
    character_b = "",
    character_c = "",
    fightForce = 52200
    };
getRow(40120,11)->
    #pet_skills_upgradingCfg {
    skill_id = 40120,
    level = 11,
    item_cost = [13002,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 200,
    des = "对前方扇形敌人造成{a}%攻击的伤害",
    character_a = "1940",
    character_b = "",
    character_c = "",
    fightForce = 61200
    };
getRow(40121,1)->
    #pet_skills_upgradingCfg {
    skill_id = 40121,
    level = 1,
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "自身周围的敌人卷入海啸中造成{a}%攻击的伤害，并造成对方禁魔，持续{c}秒。",
    character_a = "280",
    character_b = "",
    character_c = "5",
    fightForce = 0
    };
getRow(40121,2)->
    #pet_skills_upgradingCfg {
    skill_id = 40121,
    level = 2,
    item_cost = [13002,1],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 40,
    des = "自身周围的敌人卷入海啸中造成{a}%攻击的伤害，并造成对方禁魔，持续{c}秒。",
    character_a = "336",
    character_b = "",
    character_c = "5",
    fightForce = 1800
    };
getRow(40121,3)->
    #pet_skills_upgradingCfg {
    skill_id = 40121,
    level = 3,
    item_cost = [13002,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 60,
    des = "自身周围的敌人卷入海啸中造成{a}%攻击的伤害，并造成对方禁魔，持续{c}秒。",
    character_a = "392",
    character_b = "",
    character_c = "5",
    fightForce = 5400
    };
getRow(40121,4)->
    #pet_skills_upgradingCfg {
    skill_id = 40121,
    level = 4,
    item_cost = [13002,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 80,
    des = "自身周围的敌人卷入海啸中造成{a}%攻击的伤害，并造成对方禁魔，持续{c}秒。",
    character_a = "448",
    character_b = "",
    character_c = "5",
    fightForce = 9000
    };
getRow(40121,5)->
    #pet_skills_upgradingCfg {
    skill_id = 40121,
    level = 5,
    item_cost = [13002,3],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 100,
    des = "自身周围的敌人卷入海啸中造成{a}%攻击的伤害，并造成对方禁魔，持续{c}秒。",
    character_a = "504",
    character_b = "",
    character_c = "5",
    fightForce = 14400
    };
getRow(40121,6)->
    #pet_skills_upgradingCfg {
    skill_id = 40121,
    level = 6,
    item_cost = [13002,3],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 120,
    des = "自身周围的敌人卷入海啸中造成{a}%攻击的伤害，并造成对方禁魔，持续{c}秒。",
    character_a = "560",
    character_b = "",
    character_c = "5",
    fightForce = 19800
    };
getRow(40121,7)->
    #pet_skills_upgradingCfg {
    skill_id = 40121,
    level = 7,
    item_cost = [13002,4],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 140,
    des = "自身周围的敌人卷入海啸中造成{a}%攻击的伤害，并造成对方禁魔，持续{c}秒。",
    character_a = "616",
    character_b = "",
    character_c = "5",
    fightForce = 27000
    };
getRow(40121,8)->
    #pet_skills_upgradingCfg {
    skill_id = 40121,
    level = 8,
    item_cost = [13002,4],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 160,
    des = "自身周围的敌人卷入海啸中造成{a}%攻击的伤害，并造成对方禁魔，持续{c}秒。",
    character_a = "672",
    character_b = "",
    character_c = "5",
    fightForce = 34200
    };
getRow(40121,9)->
    #pet_skills_upgradingCfg {
    skill_id = 40121,
    level = 9,
    item_cost = [13002,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 180,
    des = "自身周围的敌人卷入海啸中造成{a}%攻击的伤害，并造成对方禁魔，持续{c}秒。",
    character_a = "728",
    character_b = "",
    character_c = "5",
    fightForce = 43200
    };
getRow(40121,10)->
    #pet_skills_upgradingCfg {
    skill_id = 40121,
    level = 10,
    item_cost = [13002,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 200,
    des = "自身周围的敌人卷入海啸中造成{a}%攻击的伤害，并造成对方禁魔，持续{c}秒。",
    character_a = "784",
    character_b = "",
    character_c = "5",
    fightForce = 52200
    };
getRow(40121,11)->
    #pet_skills_upgradingCfg {
    skill_id = 40121,
    level = 11,
    item_cost = [13002,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 200,
    des = "自身周围的敌人卷入海啸中造成{a}%攻击的伤害，并造成对方禁魔，持续{c}秒。",
    character_a = "840",
    character_b = "",
    character_c = "5",
    fightForce = 61200
    };
getRow(40124,1)->
    #pet_skills_upgradingCfg {
    skill_id = 40124,
    level = 1,
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "为自身和主人持续回血{c}秒，每秒恢复自身攻击力的{a}%",
    character_a = "77",
    character_b = "",
    character_c = "5",
    fightForce = 0
    };
getRow(40124,2)->
    #pet_skills_upgradingCfg {
    skill_id = 40124,
    level = 2,
    item_cost = [13002,1],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 40,
    des = "为自身和主人持续回血{c}秒，每秒恢复自身攻击力的{a}%",
    character_a = "92",
    character_b = "",
    character_c = "5",
    fightForce = 1800
    };
getRow(40124,3)->
    #pet_skills_upgradingCfg {
    skill_id = 40124,
    level = 3,
    item_cost = [13002,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 60,
    des = "为自身和主人持续回血{c}秒，每秒恢复自身攻击力的{a}%",
    character_a = "107",
    character_b = "",
    character_c = "5",
    fightForce = 5400
    };
getRow(40124,4)->
    #pet_skills_upgradingCfg {
    skill_id = 40124,
    level = 4,
    item_cost = [13002,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 80,
    des = "为自身和主人持续回血{c}秒，每秒恢复自身攻击力的{a}%",
    character_a = "122",
    character_b = "",
    character_c = "5",
    fightForce = 9000
    };
getRow(40124,5)->
    #pet_skills_upgradingCfg {
    skill_id = 40124,
    level = 5,
    item_cost = [13002,3],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 100,
    des = "为自身和主人持续回血{c}秒，每秒恢复自身攻击力的{a}%",
    character_a = "137",
    character_b = "",
    character_c = "5",
    fightForce = 14400
    };
getRow(40124,6)->
    #pet_skills_upgradingCfg {
    skill_id = 40124,
    level = 6,
    item_cost = [13002,3],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 120,
    des = "为自身和主人持续回血{c}秒，每秒恢复自身攻击力的{a}%",
    character_a = "152",
    character_b = "",
    character_c = "5",
    fightForce = 19800
    };
getRow(40124,7)->
    #pet_skills_upgradingCfg {
    skill_id = 40124,
    level = 7,
    item_cost = [13002,4],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 140,
    des = "为自身和主人持续回血{c}秒，每秒恢复自身攻击力的{a}%",
    character_a = "167",
    character_b = "",
    character_c = "5",
    fightForce = 27000
    };
getRow(40124,8)->
    #pet_skills_upgradingCfg {
    skill_id = 40124,
    level = 8,
    item_cost = [13002,4],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 160,
    des = "为自身和主人持续回血{c}秒，每秒恢复自身攻击力的{a}%",
    character_a = "182",
    character_b = "",
    character_c = "5",
    fightForce = 34200
    };
getRow(40124,9)->
    #pet_skills_upgradingCfg {
    skill_id = 40124,
    level = 9,
    item_cost = [13002,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 180,
    des = "为自身和主人持续回血{c}秒，每秒恢复自身攻击力的{a}%",
    character_a = "197",
    character_b = "",
    character_c = "5",
    fightForce = 43200
    };
getRow(40124,10)->
    #pet_skills_upgradingCfg {
    skill_id = 40124,
    level = 10,
    item_cost = [13002,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 200,
    des = "为自身和主人持续回血{c}秒，每秒恢复自身攻击力的{a}%",
    character_a = "212",
    character_b = "",
    character_c = "5",
    fightForce = 52200
    };
getRow(40124,11)->
    #pet_skills_upgradingCfg {
    skill_id = 40124,
    level = 11,
    item_cost = [13002,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 200,
    des = "为自身和主人持续回血{c}秒，每秒恢复自身攻击力的{a}%",
    character_a = "227",
    character_b = "",
    character_c = "5",
    fightForce = 61200
    };
getRow(40130,1)->
    #pet_skills_upgradingCfg {
    skill_id = 40130,
    level = 1,
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "对前方矩形敌方发射火球，总共造成{a}%攻击的伤害",
    character_a = "640",
    character_b = "",
    character_c = "",
    fightForce = 0
    };
getRow(40130,2)->
    #pet_skills_upgradingCfg {
    skill_id = 40130,
    level = 2,
    item_cost = [13002,1],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 40,
    des = "对前方矩形敌方发射火球，总共造成{a}%攻击的伤害",
    character_a = "770",
    character_b = "",
    character_c = "",
    fightForce = 1800
    };
getRow(40130,3)->
    #pet_skills_upgradingCfg {
    skill_id = 40130,
    level = 3,
    item_cost = [13002,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 60,
    des = "对前方矩形敌方发射火球，总共造成{a}%攻击的伤害",
    character_a = "900",
    character_b = "",
    character_c = "",
    fightForce = 5400
    };
getRow(40130,4)->
    #pet_skills_upgradingCfg {
    skill_id = 40130,
    level = 4,
    item_cost = [13002,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 80,
    des = "对前方矩形敌方发射火球，总共造成{a}%攻击的伤害",
    character_a = "1030",
    character_b = "",
    character_c = "",
    fightForce = 9000
    };
getRow(40130,5)->
    #pet_skills_upgradingCfg {
    skill_id = 40130,
    level = 5,
    item_cost = [13002,3],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 100,
    des = "对前方矩形敌方发射火球，总共造成{a}%攻击的伤害",
    character_a = "1160",
    character_b = "",
    character_c = "",
    fightForce = 14400
    };
getRow(40130,6)->
    #pet_skills_upgradingCfg {
    skill_id = 40130,
    level = 6,
    item_cost = [13002,3],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 120,
    des = "对前方矩形敌方发射火球，总共造成{a}%攻击的伤害",
    character_a = "1290",
    character_b = "",
    character_c = "",
    fightForce = 19800
    };
getRow(40130,7)->
    #pet_skills_upgradingCfg {
    skill_id = 40130,
    level = 7,
    item_cost = [13002,4],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 140,
    des = "对前方矩形敌方发射火球，总共造成{a}%攻击的伤害",
    character_a = "1420",
    character_b = "",
    character_c = "",
    fightForce = 27000
    };
getRow(40130,8)->
    #pet_skills_upgradingCfg {
    skill_id = 40130,
    level = 8,
    item_cost = [13002,4],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 160,
    des = "对前方矩形敌方发射火球，总共造成{a}%攻击的伤害",
    character_a = "1550",
    character_b = "",
    character_c = "",
    fightForce = 34200
    };
getRow(40130,9)->
    #pet_skills_upgradingCfg {
    skill_id = 40130,
    level = 9,
    item_cost = [13002,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 180,
    des = "对前方矩形敌方发射火球，总共造成{a}%攻击的伤害",
    character_a = "1680",
    character_b = "",
    character_c = "",
    fightForce = 43200
    };
getRow(40130,10)->
    #pet_skills_upgradingCfg {
    skill_id = 40130,
    level = 10,
    item_cost = [13002,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 200,
    des = "对前方矩形敌方发射火球，总共造成{a}%攻击的伤害",
    character_a = "1810",
    character_b = "",
    character_c = "",
    fightForce = 52200
    };
getRow(40130,11)->
    #pet_skills_upgradingCfg {
    skill_id = 40130,
    level = 11,
    item_cost = [13002,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 200,
    des = "对前方矩形敌方发射火球，总共造成{a}%攻击的伤害",
    character_a = "1940",
    character_b = "",
    character_c = "",
    fightForce = 61200
    };
getRow(40131,1)->
    #pet_skills_upgradingCfg {
    skill_id = 40131,
    level = 1,
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "远古图腾发动信仰之力，造成5次攻击，每次造成{a}%攻击的伤害。技能额外附带30%命中率。",
    character_a = "112",
    character_b = "",
    character_c = "",
    fightForce = 0
    };
getRow(40131,2)->
    #pet_skills_upgradingCfg {
    skill_id = 40131,
    level = 2,
    item_cost = [13002,1],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 40,
    des = "远古图腾发动信仰之力，造成5次攻击，每次造成{a}%攻击的伤害。技能额外附带30%命中率。",
    character_a = "134",
    character_b = "",
    character_c = "",
    fightForce = 1800
    };
getRow(40131,3)->
    #pet_skills_upgradingCfg {
    skill_id = 40131,
    level = 3,
    item_cost = [13002,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 60,
    des = "远古图腾发动信仰之力，造成5次攻击，每次造成{a}%攻击的伤害。技能额外附带30%命中率。",
    character_a = "156",
    character_b = "",
    character_c = "",
    fightForce = 5400
    };
getRow(40131,4)->
    #pet_skills_upgradingCfg {
    skill_id = 40131,
    level = 4,
    item_cost = [13002,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 80,
    des = "远古图腾发动信仰之力，造成5次攻击，每次造成{a}%攻击的伤害。技能额外附带30%命中率。",
    character_a = "178",
    character_b = "",
    character_c = "",
    fightForce = 9000
    };
getRow(40131,5)->
    #pet_skills_upgradingCfg {
    skill_id = 40131,
    level = 5,
    item_cost = [13002,3],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 100,
    des = "远古图腾发动信仰之力，造成5次攻击，每次造成{a}%攻击的伤害。技能额外附带30%命中率。",
    character_a = "200",
    character_b = "",
    character_c = "",
    fightForce = 14400
    };
getRow(40131,6)->
    #pet_skills_upgradingCfg {
    skill_id = 40131,
    level = 6,
    item_cost = [13002,3],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 120,
    des = "远古图腾发动信仰之力，造成5次攻击，每次造成{a}%攻击的伤害。技能额外附带30%命中率。",
    character_a = "222",
    character_b = "",
    character_c = "",
    fightForce = 19800
    };
getRow(40131,7)->
    #pet_skills_upgradingCfg {
    skill_id = 40131,
    level = 7,
    item_cost = [13002,4],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 140,
    des = "远古图腾发动信仰之力，造成5次攻击，每次造成{a}%攻击的伤害。技能额外附带30%命中率。",
    character_a = "244",
    character_b = "",
    character_c = "",
    fightForce = 27000
    };
getRow(40131,8)->
    #pet_skills_upgradingCfg {
    skill_id = 40131,
    level = 8,
    item_cost = [13002,4],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 160,
    des = "远古图腾发动信仰之力，造成5次攻击，每次造成{a}%攻击的伤害。技能额外附带30%命中率。",
    character_a = "266",
    character_b = "",
    character_c = "",
    fightForce = 34200
    };
getRow(40131,9)->
    #pet_skills_upgradingCfg {
    skill_id = 40131,
    level = 9,
    item_cost = [13002,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 180,
    des = "远古图腾发动信仰之力，造成5次攻击，每次造成{a}%攻击的伤害。技能额外附带30%命中率。",
    character_a = "288",
    character_b = "",
    character_c = "",
    fightForce = 43200
    };
getRow(40131,10)->
    #pet_skills_upgradingCfg {
    skill_id = 40131,
    level = 10,
    item_cost = [13002,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 200,
    des = "远古图腾发动信仰之力，造成5次攻击，每次造成{a}%攻击的伤害。技能额外附带30%命中率。",
    character_a = "310",
    character_b = "",
    character_c = "",
    fightForce = 52200
    };
getRow(40131,11)->
    #pet_skills_upgradingCfg {
    skill_id = 40131,
    level = 11,
    item_cost = [13002,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 200,
    des = "远古图腾发动信仰之力，造成5次攻击，每次造成{a}%攻击的伤害。技能额外附带30%命中率。",
    character_a = "332",
    character_b = "",
    character_c = "",
    fightForce = 61200
    };
getRow(40132,1)->
    #pet_skills_upgradingCfg {
    skill_id = 40132,
    level = 1,
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "群攻火焰，造成5次攻击，每次造成{a}%攻击的伤害。技能额外附带30%暴击率。",
    character_a = "134",
    character_b = "",
    character_c = "",
    fightForce = 0
    };
getRow(40132,2)->
    #pet_skills_upgradingCfg {
    skill_id = 40132,
    level = 2,
    item_cost = [13002,1],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 40,
    des = "群攻火焰，造成5次攻击，每次造成{a}%攻击的伤害。技能额外附带30%暴击率。",
    character_a = "161",
    character_b = "",
    character_c = "",
    fightForce = 1800
    };
getRow(40132,3)->
    #pet_skills_upgradingCfg {
    skill_id = 40132,
    level = 3,
    item_cost = [13002,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 60,
    des = "群攻火焰，造成5次攻击，每次造成{a}%攻击的伤害。技能额外附带30%暴击率。",
    character_a = "188",
    character_b = "",
    character_c = "",
    fightForce = 5400
    };
getRow(40132,4)->
    #pet_skills_upgradingCfg {
    skill_id = 40132,
    level = 4,
    item_cost = [13002,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 80,
    des = "群攻火焰，造成5次攻击，每次造成{a}%攻击的伤害。技能额外附带30%暴击率。",
    character_a = "215",
    character_b = "",
    character_c = "",
    fightForce = 9000
    };
getRow(40132,5)->
    #pet_skills_upgradingCfg {
    skill_id = 40132,
    level = 5,
    item_cost = [13002,3],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 100,
    des = "群攻火焰，造成5次攻击，每次造成{a}%攻击的伤害。技能额外附带30%暴击率。",
    character_a = "242",
    character_b = "",
    character_c = "",
    fightForce = 14400
    };
getRow(40132,6)->
    #pet_skills_upgradingCfg {
    skill_id = 40132,
    level = 6,
    item_cost = [13002,3],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 120,
    des = "群攻火焰，造成5次攻击，每次造成{a}%攻击的伤害。技能额外附带30%暴击率。",
    character_a = "269",
    character_b = "",
    character_c = "",
    fightForce = 19800
    };
getRow(40132,7)->
    #pet_skills_upgradingCfg {
    skill_id = 40132,
    level = 7,
    item_cost = [13002,4],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 140,
    des = "群攻火焰，造成5次攻击，每次造成{a}%攻击的伤害。技能额外附带30%暴击率。",
    character_a = "296",
    character_b = "",
    character_c = "",
    fightForce = 27000
    };
getRow(40132,8)->
    #pet_skills_upgradingCfg {
    skill_id = 40132,
    level = 8,
    item_cost = [13002,4],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 160,
    des = "群攻火焰，造成5次攻击，每次造成{a}%攻击的伤害。技能额外附带30%暴击率。",
    character_a = "323",
    character_b = "",
    character_c = "",
    fightForce = 34200
    };
getRow(40132,9)->
    #pet_skills_upgradingCfg {
    skill_id = 40132,
    level = 9,
    item_cost = [13002,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 180,
    des = "群攻火焰，造成5次攻击，每次造成{a}%攻击的伤害。技能额外附带30%暴击率。",
    character_a = "350",
    character_b = "",
    character_c = "",
    fightForce = 43200
    };
getRow(40132,10)->
    #pet_skills_upgradingCfg {
    skill_id = 40132,
    level = 10,
    item_cost = [13002,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 200,
    des = "群攻火焰，造成5次攻击，每次造成{a}%攻击的伤害。技能额外附带30%暴击率。",
    character_a = "377",
    character_b = "",
    character_c = "",
    fightForce = 52200
    };
getRow(40132,11)->
    #pet_skills_upgradingCfg {
    skill_id = 40132,
    level = 11,
    item_cost = [13002,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 200,
    des = "群攻火焰，造成5次攻击，每次造成{a}%攻击的伤害。技能额外附带30%暴击率。",
    character_a = "404",
    character_b = "",
    character_c = "",
    fightForce = 61200
    };
getRow(40140,1)->
    #pet_skills_upgradingCfg {
    skill_id = 40140,
    level = 1,
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "使用盾牌击打前方扇形范围内敌人，造成{a}%攻击的伤害",
    character_a = "621",
    character_b = "",
    character_c = "",
    fightForce = 0
    };
getRow(40140,2)->
    #pet_skills_upgradingCfg {
    skill_id = 40140,
    level = 2,
    item_cost = [13002,1],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 40,
    des = "使用盾牌击打前方扇形范围内敌人，造成{a}%攻击的伤害",
    character_a = "747",
    character_b = "",
    character_c = "",
    fightForce = 1800
    };
getRow(40140,3)->
    #pet_skills_upgradingCfg {
    skill_id = 40140,
    level = 3,
    item_cost = [13002,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 60,
    des = "使用盾牌击打前方扇形范围内敌人，造成{a}%攻击的伤害",
    character_a = "873",
    character_b = "",
    character_c = "",
    fightForce = 5400
    };
getRow(40140,4)->
    #pet_skills_upgradingCfg {
    skill_id = 40140,
    level = 4,
    item_cost = [13002,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 80,
    des = "使用盾牌击打前方扇形范围内敌人，造成{a}%攻击的伤害",
    character_a = "999",
    character_b = "",
    character_c = "",
    fightForce = 9000
    };
getRow(40140,5)->
    #pet_skills_upgradingCfg {
    skill_id = 40140,
    level = 5,
    item_cost = [13002,3],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 100,
    des = "使用盾牌击打前方扇形范围内敌人，造成{a}%攻击的伤害",
    character_a = "1125",
    character_b = "",
    character_c = "",
    fightForce = 14400
    };
getRow(40140,6)->
    #pet_skills_upgradingCfg {
    skill_id = 40140,
    level = 6,
    item_cost = [13002,3],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 120,
    des = "使用盾牌击打前方扇形范围内敌人，造成{a}%攻击的伤害",
    character_a = "1251",
    character_b = "",
    character_c = "",
    fightForce = 19800
    };
getRow(40140,7)->
    #pet_skills_upgradingCfg {
    skill_id = 40140,
    level = 7,
    item_cost = [13002,4],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 140,
    des = "使用盾牌击打前方扇形范围内敌人，造成{a}%攻击的伤害",
    character_a = "1377",
    character_b = "",
    character_c = "",
    fightForce = 27000
    };
getRow(40140,8)->
    #pet_skills_upgradingCfg {
    skill_id = 40140,
    level = 8,
    item_cost = [13002,4],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 160,
    des = "使用盾牌击打前方扇形范围内敌人，造成{a}%攻击的伤害",
    character_a = "1503",
    character_b = "",
    character_c = "",
    fightForce = 34200
    };
getRow(40140,9)->
    #pet_skills_upgradingCfg {
    skill_id = 40140,
    level = 9,
    item_cost = [13002,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 180,
    des = "使用盾牌击打前方扇形范围内敌人，造成{a}%攻击的伤害",
    character_a = "1629",
    character_b = "",
    character_c = "",
    fightForce = 43200
    };
getRow(40140,10)->
    #pet_skills_upgradingCfg {
    skill_id = 40140,
    level = 10,
    item_cost = [13002,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 200,
    des = "使用盾牌击打前方扇形范围内敌人，造成{a}%攻击的伤害",
    character_a = "1755",
    character_b = "",
    character_c = "",
    fightForce = 52200
    };
getRow(40140,11)->
    #pet_skills_upgradingCfg {
    skill_id = 40140,
    level = 11,
    item_cost = [13002,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 200,
    des = "使用盾牌击打前方扇形范围内敌人，造成{a}%攻击的伤害",
    character_a = "1881",
    character_b = "",
    character_c = "",
    fightForce = 61200
    };
getRow(40141,1)->
    #pet_skills_upgradingCfg {
    skill_id = 40141,
    level = 1,
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "将前方直线范围内敌方拉近，并进行3攻击，每次造成{a}%攻击的伤害",
    character_a = "181",
    character_b = "",
    character_c = "",
    fightForce = 0
    };
getRow(40141,2)->
    #pet_skills_upgradingCfg {
    skill_id = 40141,
    level = 2,
    item_cost = [13002,1],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 40,
    des = "将前方直线范围内敌方拉近，并进行3攻击，每次造成{a}%攻击的伤害",
    character_a = "217",
    character_b = "",
    character_c = "",
    fightForce = 1800
    };
getRow(40141,3)->
    #pet_skills_upgradingCfg {
    skill_id = 40141,
    level = 3,
    item_cost = [13002,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 60,
    des = "将前方直线范围内敌方拉近，并进行3攻击，每次造成{a}%攻击的伤害",
    character_a = "253",
    character_b = "",
    character_c = "",
    fightForce = 5400
    };
getRow(40141,4)->
    #pet_skills_upgradingCfg {
    skill_id = 40141,
    level = 4,
    item_cost = [13002,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 80,
    des = "将前方直线范围内敌方拉近，并进行3攻击，每次造成{a}%攻击的伤害",
    character_a = "289",
    character_b = "",
    character_c = "",
    fightForce = 9000
    };
getRow(40141,5)->
    #pet_skills_upgradingCfg {
    skill_id = 40141,
    level = 5,
    item_cost = [13002,3],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 100,
    des = "将前方直线范围内敌方拉近，并进行3攻击，每次造成{a}%攻击的伤害",
    character_a = "325",
    character_b = "",
    character_c = "",
    fightForce = 14400
    };
getRow(40141,6)->
    #pet_skills_upgradingCfg {
    skill_id = 40141,
    level = 6,
    item_cost = [13002,3],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 120,
    des = "将前方直线范围内敌方拉近，并进行3攻击，每次造成{a}%攻击的伤害",
    character_a = "361",
    character_b = "",
    character_c = "",
    fightForce = 19800
    };
getRow(40141,7)->
    #pet_skills_upgradingCfg {
    skill_id = 40141,
    level = 7,
    item_cost = [13002,4],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 140,
    des = "将前方直线范围内敌方拉近，并进行3攻击，每次造成{a}%攻击的伤害",
    character_a = "397",
    character_b = "",
    character_c = "",
    fightForce = 27000
    };
getRow(40141,8)->
    #pet_skills_upgradingCfg {
    skill_id = 40141,
    level = 8,
    item_cost = [13002,4],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 160,
    des = "将前方直线范围内敌方拉近，并进行3攻击，每次造成{a}%攻击的伤害",
    character_a = "433",
    character_b = "",
    character_c = "",
    fightForce = 34200
    };
getRow(40141,9)->
    #pet_skills_upgradingCfg {
    skill_id = 40141,
    level = 9,
    item_cost = [13002,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 180,
    des = "将前方直线范围内敌方拉近，并进行3攻击，每次造成{a}%攻击的伤害",
    character_a = "469",
    character_b = "",
    character_c = "",
    fightForce = 43200
    };
getRow(40141,10)->
    #pet_skills_upgradingCfg {
    skill_id = 40141,
    level = 10,
    item_cost = [13002,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 200,
    des = "将前方直线范围内敌方拉近，并进行3攻击，每次造成{a}%攻击的伤害",
    character_a = "505",
    character_b = "",
    character_c = "",
    fightForce = 52200
    };
getRow(40141,11)->
    #pet_skills_upgradingCfg {
    skill_id = 40141,
    level = 11,
    item_cost = [13002,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 200,
    des = "将前方直线范围内敌方拉近，并进行3攻击，每次造成{a}%攻击的伤害",
    character_a = "541",
    character_b = "",
    character_c = "",
    fightForce = 61200
    };
getRow(40142,1)->
    #pet_skills_upgradingCfg {
    skill_id = 40142,
    level = 1,
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "攻击前方直线范围内敌人，造成{a}%攻击的伤害，若造成暴击，则缩减技能【恃强凌弱】{b}%的冷却时间",
    character_a = "217",
    character_b = "10",
    character_c = "5",
    fightForce = 0
    };
getRow(40142,2)->
    #pet_skills_upgradingCfg {
    skill_id = 40142,
    level = 2,
    item_cost = [13002,1],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 40,
    des = "攻击前方直线范围内敌人，造成{a}%攻击的伤害，若造成暴击，则缩减技能【恃强凌弱】{b}%的冷却时间",
    character_a = "260",
    character_b = "11",
    character_c = "5",
    fightForce = 1800
    };
getRow(40142,3)->
    #pet_skills_upgradingCfg {
    skill_id = 40142,
    level = 3,
    item_cost = [13002,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 60,
    des = "攻击前方直线范围内敌人，造成{a}%攻击的伤害，若造成暴击，则缩减技能【恃强凌弱】{b}%的冷却时间",
    character_a = "303",
    character_b = "12",
    character_c = "5",
    fightForce = 5400
    };
getRow(40142,4)->
    #pet_skills_upgradingCfg {
    skill_id = 40142,
    level = 4,
    item_cost = [13002,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 80,
    des = "攻击前方直线范围内敌人，造成{a}%攻击的伤害，若造成暴击，则缩减技能【恃强凌弱】{b}%的冷却时间",
    character_a = "346",
    character_b = "13",
    character_c = "5",
    fightForce = 9000
    };
getRow(40142,5)->
    #pet_skills_upgradingCfg {
    skill_id = 40142,
    level = 5,
    item_cost = [13002,3],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 100,
    des = "攻击前方直线范围内敌人，造成{a}%攻击的伤害，若造成暴击，则缩减技能【恃强凌弱】{b}%的冷却时间",
    character_a = "389",
    character_b = "14",
    character_c = "5",
    fightForce = 14400
    };
getRow(40142,6)->
    #pet_skills_upgradingCfg {
    skill_id = 40142,
    level = 6,
    item_cost = [13002,3],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 120,
    des = "攻击前方直线范围内敌人，造成{a}%攻击的伤害，若造成暴击，则缩减技能【恃强凌弱】{b}%的冷却时间",
    character_a = "432",
    character_b = "15",
    character_c = "5",
    fightForce = 19800
    };
getRow(40142,7)->
    #pet_skills_upgradingCfg {
    skill_id = 40142,
    level = 7,
    item_cost = [13002,4],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 140,
    des = "攻击前方直线范围内敌人，造成{a}%攻击的伤害，若造成暴击，则缩减技能【恃强凌弱】{b}%的冷却时间",
    character_a = "475",
    character_b = "16",
    character_c = "5",
    fightForce = 27000
    };
getRow(40142,8)->
    #pet_skills_upgradingCfg {
    skill_id = 40142,
    level = 8,
    item_cost = [13002,4],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 160,
    des = "攻击前方直线范围内敌人，造成{a}%攻击的伤害，若造成暴击，则缩减技能【恃强凌弱】{b}%的冷却时间",
    character_a = "518",
    character_b = "17",
    character_c = "5",
    fightForce = 34200
    };
getRow(40142,9)->
    #pet_skills_upgradingCfg {
    skill_id = 40142,
    level = 9,
    item_cost = [13002,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 180,
    des = "攻击前方直线范围内敌人，造成{a}%攻击的伤害，若造成暴击，则缩减技能【恃强凌弱】{b}%的冷却时间",
    character_a = "561",
    character_b = "18",
    character_c = "5",
    fightForce = 43200
    };
getRow(40142,10)->
    #pet_skills_upgradingCfg {
    skill_id = 40142,
    level = 10,
    item_cost = [13002,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 200,
    des = "攻击前方直线范围内敌人，造成{a}%攻击的伤害，若造成暴击，则缩减技能【恃强凌弱】{b}%的冷却时间",
    character_a = "604",
    character_b = "19",
    character_c = "5",
    fightForce = 52200
    };
getRow(40142,11)->
    #pet_skills_upgradingCfg {
    skill_id = 40142,
    level = 11,
    item_cost = [13002,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 200,
    des = "攻击前方直线范围内敌人，造成{a}%攻击的伤害，若造成暴击，则缩减技能【恃强凌弱】{b}%的冷却时间",
    character_a = "647",
    character_b = "20",
    character_c = "5",
    fightForce = 61200
    };
getRow(40150,1)->
    #pet_skills_upgradingCfg {
    skill_id = 40150,
    level = 1,
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "锁定目标，对其进行定向射击。造成{a}%攻击的伤害",
    character_a = "707",
    character_b = "",
    character_c = "",
    fightForce = 0
    };
getRow(40150,2)->
    #pet_skills_upgradingCfg {
    skill_id = 40150,
    level = 2,
    item_cost = [13001,1],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 40,
    des = "锁定目标，对其进行定向射击。造成{a}%攻击的伤害",
    character_a = "851",
    character_b = "",
    character_c = "",
    fightForce = 900
    };
getRow(40150,3)->
    #pet_skills_upgradingCfg {
    skill_id = 40150,
    level = 3,
    item_cost = [13001,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 60,
    des = "锁定目标，对其进行定向射击。造成{a}%攻击的伤害",
    character_a = "995",
    character_b = "",
    character_c = "",
    fightForce = 2700
    };
getRow(40150,4)->
    #pet_skills_upgradingCfg {
    skill_id = 40150,
    level = 4,
    item_cost = [13001,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 80,
    des = "锁定目标，对其进行定向射击。造成{a}%攻击的伤害",
    character_a = "1139",
    character_b = "",
    character_c = "",
    fightForce = 4500
    };
getRow(40150,5)->
    #pet_skills_upgradingCfg {
    skill_id = 40150,
    level = 5,
    item_cost = [13001,3],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 100,
    des = "锁定目标，对其进行定向射击。造成{a}%攻击的伤害",
    character_a = "1283",
    character_b = "",
    character_c = "",
    fightForce = 7200
    };
getRow(40150,6)->
    #pet_skills_upgradingCfg {
    skill_id = 40150,
    level = 6,
    item_cost = [13001,3],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 120,
    des = "锁定目标，对其进行定向射击。造成{a}%攻击的伤害",
    character_a = "1427",
    character_b = "",
    character_c = "",
    fightForce = 9900
    };
getRow(40150,7)->
    #pet_skills_upgradingCfg {
    skill_id = 40150,
    level = 7,
    item_cost = [13001,4],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 140,
    des = "锁定目标，对其进行定向射击。造成{a}%攻击的伤害",
    character_a = "1571",
    character_b = "",
    character_c = "",
    fightForce = 13500
    };
getRow(40150,8)->
    #pet_skills_upgradingCfg {
    skill_id = 40150,
    level = 8,
    item_cost = [13001,4],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 160,
    des = "锁定目标，对其进行定向射击。造成{a}%攻击的伤害",
    character_a = "1715",
    character_b = "",
    character_c = "",
    fightForce = 17100
    };
getRow(40150,9)->
    #pet_skills_upgradingCfg {
    skill_id = 40150,
    level = 9,
    item_cost = [13001,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 180,
    des = "锁定目标，对其进行定向射击。造成{a}%攻击的伤害",
    character_a = "1859",
    character_b = "",
    character_c = "",
    fightForce = 21600
    };
getRow(40150,10)->
    #pet_skills_upgradingCfg {
    skill_id = 40150,
    level = 10,
    item_cost = [13001,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 180,
    des = "锁定目标，对其进行定向射击。造成{a}%攻击的伤害",
    character_a = "2003",
    character_b = "",
    character_c = "",
    fightForce = 26100
    };
getRow(40150,11)->
    #pet_skills_upgradingCfg {
    skill_id = 40150,
    level = 11,
    item_cost = [13001,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 180,
    des = "锁定目标，对其进行定向射击。造成{a}%攻击的伤害",
    character_a = "2147",
    character_b = "",
    character_c = "",
    fightForce = 30600
    };
getRow(40151,1)->
    #pet_skills_upgradingCfg {
    skill_id = 40151,
    level = 1,
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "扫射前方目标，并在目标脚下生成机枪。机枪将对自身周围造成3次攻击，每次{a}%攻击的伤害",
    character_a = "172",
    character_b = "",
    character_c = "",
    fightForce = 0
    };
getRow(40151,2)->
    #pet_skills_upgradingCfg {
    skill_id = 40151,
    level = 2,
    item_cost = [13001,1],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 40,
    des = "扫射前方目标，并在目标脚下生成机枪。机枪将对自身周围造成3次攻击，每次{a}%攻击的伤害",
    character_a = "206",
    character_b = "",
    character_c = "",
    fightForce = 900
    };
getRow(40151,3)->
    #pet_skills_upgradingCfg {
    skill_id = 40151,
    level = 3,
    item_cost = [13001,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 60,
    des = "扫射前方目标，并在目标脚下生成机枪。机枪将对自身周围造成3次攻击，每次{a}%攻击的伤害",
    character_a = "240",
    character_b = "",
    character_c = "",
    fightForce = 2700
    };
getRow(40151,4)->
    #pet_skills_upgradingCfg {
    skill_id = 40151,
    level = 4,
    item_cost = [13001,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 80,
    des = "扫射前方目标，并在目标脚下生成机枪。机枪将对自身周围造成3次攻击，每次{a}%攻击的伤害",
    character_a = "274",
    character_b = "",
    character_c = "",
    fightForce = 4500
    };
getRow(40151,5)->
    #pet_skills_upgradingCfg {
    skill_id = 40151,
    level = 5,
    item_cost = [13001,3],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 100,
    des = "扫射前方目标，并在目标脚下生成机枪。机枪将对自身周围造成3次攻击，每次{a}%攻击的伤害",
    character_a = "308",
    character_b = "",
    character_c = "",
    fightForce = 7200
    };
getRow(40151,6)->
    #pet_skills_upgradingCfg {
    skill_id = 40151,
    level = 6,
    item_cost = [13001,3],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 120,
    des = "扫射前方目标，并在目标脚下生成机枪。机枪将对自身周围造成3次攻击，每次{a}%攻击的伤害",
    character_a = "342",
    character_b = "",
    character_c = "",
    fightForce = 9900
    };
getRow(40151,7)->
    #pet_skills_upgradingCfg {
    skill_id = 40151,
    level = 7,
    item_cost = [13001,4],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 140,
    des = "扫射前方目标，并在目标脚下生成机枪。机枪将对自身周围造成3次攻击，每次{a}%攻击的伤害",
    character_a = "376",
    character_b = "",
    character_c = "",
    fightForce = 13500
    };
getRow(40151,8)->
    #pet_skills_upgradingCfg {
    skill_id = 40151,
    level = 8,
    item_cost = [13001,4],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 160,
    des = "扫射前方目标，并在目标脚下生成机枪。机枪将对自身周围造成3次攻击，每次{a}%攻击的伤害",
    character_a = "410",
    character_b = "",
    character_c = "",
    fightForce = 17100
    };
getRow(40151,9)->
    #pet_skills_upgradingCfg {
    skill_id = 40151,
    level = 9,
    item_cost = [13001,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 180,
    des = "扫射前方目标，并在目标脚下生成机枪。机枪将对自身周围造成3次攻击，每次{a}%攻击的伤害",
    character_a = "444",
    character_b = "",
    character_c = "",
    fightForce = 21600
    };
getRow(40151,10)->
    #pet_skills_upgradingCfg {
    skill_id = 40151,
    level = 10,
    item_cost = [13001,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 200,
    des = "扫射前方目标，并在目标脚下生成机枪。机枪将对自身周围造成3次攻击，每次{a}%攻击的伤害",
    character_a = "478",
    character_b = "",
    character_c = "",
    fightForce = 26100
    };
getRow(40151,11)->
    #pet_skills_upgradingCfg {
    skill_id = 40151,
    level = 11,
    item_cost = [13001,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 200,
    des = "扫射前方目标，并在目标脚下生成机枪。机枪将对自身周围造成3次攻击，每次{a}%攻击的伤害",
    character_a = "512",
    character_b = "",
    character_c = "",
    fightForce = 30600
    };
getRow(40155,1)->
    #pet_skills_upgradingCfg {
    skill_id = 40155,
    level = 1,
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "【注：该技能仅对玩家生效】对前方玩家造成3次攻击，每次{a}%攻击的伤害，有50%几率提升自身{b}%的伤害加成，持续{c}秒",
    character_a = "206",
    character_b = "30",
    character_c = "5",
    fightForce = 0
    };
getRow(40155,2)->
    #pet_skills_upgradingCfg {
    skill_id = 40155,
    level = 2,
    item_cost = [13001,1],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 40,
    des = "【注：该技能仅对玩家生效】对前方玩家造成3次攻击，每次{a}%攻击的伤害，有50%几率提升自身{b}%的伤害加成，持续{c}秒",
    character_a = "247",
    character_b = "32",
    character_c = "5",
    fightForce = 900
    };
getRow(40155,3)->
    #pet_skills_upgradingCfg {
    skill_id = 40155,
    level = 3,
    item_cost = [13001,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 60,
    des = "【注：该技能仅对玩家生效】对前方玩家造成3次攻击，每次{a}%攻击的伤害，有50%几率提升自身{b}%的伤害加成，持续{c}秒",
    character_a = "288",
    character_b = "34",
    character_c = "5",
    fightForce = 2700
    };
getRow(40155,4)->
    #pet_skills_upgradingCfg {
    skill_id = 40155,
    level = 4,
    item_cost = [13001,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 80,
    des = "【注：该技能仅对玩家生效】对前方玩家造成3次攻击，每次{a}%攻击的伤害，有50%几率提升自身{b}%的伤害加成，持续{c}秒",
    character_a = "329",
    character_b = "36",
    character_c = "5",
    fightForce = 4500
    };
getRow(40155,5)->
    #pet_skills_upgradingCfg {
    skill_id = 40155,
    level = 5,
    item_cost = [13001,3],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 100,
    des = "【注：该技能仅对玩家生效】对前方玩家造成3次攻击，每次{a}%攻击的伤害，有50%几率提升自身{b}%的伤害加成，持续{c}秒",
    character_a = "370",
    character_b = "38",
    character_c = "5",
    fightForce = 7200
    };
getRow(40155,6)->
    #pet_skills_upgradingCfg {
    skill_id = 40155,
    level = 6,
    item_cost = [13001,3],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 120,
    des = "【注：该技能仅对玩家生效】对前方玩家造成3次攻击，每次{a}%攻击的伤害，有50%几率提升自身{b}%的伤害加成，持续{c}秒",
    character_a = "411",
    character_b = "40",
    character_c = "5",
    fightForce = 9900
    };
getRow(40155,7)->
    #pet_skills_upgradingCfg {
    skill_id = 40155,
    level = 7,
    item_cost = [13001,4],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 140,
    des = "【注：该技能仅对玩家生效】对前方玩家造成3次攻击，每次{a}%攻击的伤害，有50%几率提升自身{b}%的伤害加成，持续{c}秒",
    character_a = "452",
    character_b = "42",
    character_c = "5",
    fightForce = 13500
    };
getRow(40155,8)->
    #pet_skills_upgradingCfg {
    skill_id = 40155,
    level = 8,
    item_cost = [13001,4],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 160,
    des = "【注：该技能仅对玩家生效】对前方玩家造成3次攻击，每次{a}%攻击的伤害，有50%几率提升自身{b}%的伤害加成，持续{c}秒",
    character_a = "493",
    character_b = "44",
    character_c = "5",
    fightForce = 17100
    };
getRow(40155,9)->
    #pet_skills_upgradingCfg {
    skill_id = 40155,
    level = 9,
    item_cost = [13001,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 180,
    des = "【注：该技能仅对玩家生效】对前方玩家造成3次攻击，每次{a}%攻击的伤害，有50%几率提升自身{b}%的伤害加成，持续{c}秒",
    character_a = "534",
    character_b = "46",
    character_c = "5",
    fightForce = 21600
    };
getRow(40155,10)->
    #pet_skills_upgradingCfg {
    skill_id = 40155,
    level = 10,
    item_cost = [13001,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 200,
    des = "【注：该技能仅对玩家生效】对前方玩家造成3次攻击，每次{a}%攻击的伤害，有50%几率提升自身{b}%的伤害加成，持续{c}秒",
    character_a = "575",
    character_b = "48",
    character_c = "5",
    fightForce = 26100
    };
getRow(40155,11)->
    #pet_skills_upgradingCfg {
    skill_id = 40155,
    level = 11,
    item_cost = [13001,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 200,
    des = "【注：该技能仅对玩家生效】对前方玩家造成3次攻击，每次{a}%攻击的伤害，有50%几率提升自身{b}%的伤害加成，持续{c}秒",
    character_a = "616",
    character_b = "50",
    character_c = "5",
    fightForce = 30600
    };
getRow(40160,1)->
    #pet_skills_upgradingCfg {
    skill_id = 40160,
    level = 1,
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "攻击前方单体目标，总共造成{a}%攻击的伤害",
    character_a = "737",
    character_b = "",
    character_c = "",
    fightForce = 0
    };
getRow(40160,2)->
    #pet_skills_upgradingCfg {
    skill_id = 40160,
    level = 2,
    item_cost = [13001,1],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 40,
    des = "攻击前方单体目标，总共造成{a}%攻击的伤害",
    character_a = "864",
    character_b = "",
    character_c = "",
    fightForce = 900
    };
getRow(40160,3)->
    #pet_skills_upgradingCfg {
    skill_id = 40160,
    level = 3,
    item_cost = [13001,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 60,
    des = "攻击前方单体目标，总共造成{a}%攻击的伤害",
    character_a = "991",
    character_b = "",
    character_c = "",
    fightForce = 2700
    };
getRow(40160,4)->
    #pet_skills_upgradingCfg {
    skill_id = 40160,
    level = 4,
    item_cost = [13001,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 80,
    des = "攻击前方单体目标，总共造成{a}%攻击的伤害",
    character_a = "1118",
    character_b = "",
    character_c = "",
    fightForce = 4500
    };
getRow(40160,5)->
    #pet_skills_upgradingCfg {
    skill_id = 40160,
    level = 5,
    item_cost = [13001,3],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 100,
    des = "攻击前方单体目标，总共造成{a}%攻击的伤害",
    character_a = "1245",
    character_b = "",
    character_c = "",
    fightForce = 7200
    };
getRow(40160,6)->
    #pet_skills_upgradingCfg {
    skill_id = 40160,
    level = 6,
    item_cost = [13001,3],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 120,
    des = "攻击前方单体目标，总共造成{a}%攻击的伤害",
    character_a = "1372",
    character_b = "",
    character_c = "",
    fightForce = 9900
    };
getRow(40160,7)->
    #pet_skills_upgradingCfg {
    skill_id = 40160,
    level = 7,
    item_cost = [13001,4],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 140,
    des = "攻击前方单体目标，总共造成{a}%攻击的伤害",
    character_a = "1499",
    character_b = "",
    character_c = "",
    fightForce = 13500
    };
getRow(40160,8)->
    #pet_skills_upgradingCfg {
    skill_id = 40160,
    level = 8,
    item_cost = [13001,4],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 160,
    des = "攻击前方单体目标，总共造成{a}%攻击的伤害",
    character_a = "1626",
    character_b = "",
    character_c = "",
    fightForce = 17100
    };
getRow(40160,9)->
    #pet_skills_upgradingCfg {
    skill_id = 40160,
    level = 9,
    item_cost = [13001,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 180,
    des = "攻击前方单体目标，总共造成{a}%攻击的伤害",
    character_a = "1753",
    character_b = "",
    character_c = "",
    fightForce = 21600
    };
getRow(40160,10)->
    #pet_skills_upgradingCfg {
    skill_id = 40160,
    level = 10,
    item_cost = [13001,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 200,
    des = "攻击前方单体目标，总共造成{a}%攻击的伤害",
    character_a = "1880",
    character_b = "",
    character_c = "",
    fightForce = 26100
    };
getRow(40160,11)->
    #pet_skills_upgradingCfg {
    skill_id = 40160,
    level = 11,
    item_cost = [13001,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 200,
    des = "攻击前方单体目标，总共造成{a}%攻击的伤害",
    character_a = "2007",
    character_b = "",
    character_c = "",
    fightForce = 30600
    };
getRow(40161,1)->
    #pet_skills_upgradingCfg {
    skill_id = 40161,
    level = 1,
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "对自身半径7米范围内敌方，总共造成{a}%攻击的伤害",
    character_a = "922",
    character_b = "",
    character_c = "",
    fightForce = 0
    };
getRow(40161,2)->
    #pet_skills_upgradingCfg {
    skill_id = 40161,
    level = 2,
    item_cost = [13001,1],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 40,
    des = "对自身半径7米范围内敌方，总共造成{a}%攻击的伤害",
    character_a = "1085",
    character_b = "",
    character_c = "",
    fightForce = 900
    };
getRow(40161,3)->
    #pet_skills_upgradingCfg {
    skill_id = 40161,
    level = 3,
    item_cost = [13001,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 60,
    des = "对自身半径7米范围内敌方，总共造成{a}%攻击的伤害",
    character_a = "1248",
    character_b = "",
    character_c = "",
    fightForce = 2700
    };
getRow(40161,4)->
    #pet_skills_upgradingCfg {
    skill_id = 40161,
    level = 4,
    item_cost = [13001,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 80,
    des = "对自身半径7米范围内敌方，总共造成{a}%攻击的伤害",
    character_a = "1411",
    character_b = "",
    character_c = "",
    fightForce = 4500
    };
getRow(40161,5)->
    #pet_skills_upgradingCfg {
    skill_id = 40161,
    level = 5,
    item_cost = [13001,3],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 100,
    des = "对自身半径7米范围内敌方，总共造成{a}%攻击的伤害",
    character_a = "1574",
    character_b = "",
    character_c = "",
    fightForce = 7200
    };
getRow(40161,6)->
    #pet_skills_upgradingCfg {
    skill_id = 40161,
    level = 6,
    item_cost = [13001,3],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 120,
    des = "对自身半径7米范围内敌方，总共造成{a}%攻击的伤害",
    character_a = "1737",
    character_b = "",
    character_c = "",
    fightForce = 9900
    };
getRow(40161,7)->
    #pet_skills_upgradingCfg {
    skill_id = 40161,
    level = 7,
    item_cost = [13001,4],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 140,
    des = "对自身半径7米范围内敌方，总共造成{a}%攻击的伤害",
    character_a = "1900",
    character_b = "",
    character_c = "",
    fightForce = 13500
    };
getRow(40161,8)->
    #pet_skills_upgradingCfg {
    skill_id = 40161,
    level = 8,
    item_cost = [13001,4],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 160,
    des = "对自身半径7米范围内敌方，总共造成{a}%攻击的伤害",
    character_a = "2063",
    character_b = "",
    character_c = "",
    fightForce = 17100
    };
getRow(40161,9)->
    #pet_skills_upgradingCfg {
    skill_id = 40161,
    level = 9,
    item_cost = [13001,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 180,
    des = "对自身半径7米范围内敌方，总共造成{a}%攻击的伤害",
    character_a = "2226",
    character_b = "",
    character_c = "",
    fightForce = 21600
    };
getRow(40161,10)->
    #pet_skills_upgradingCfg {
    skill_id = 40161,
    level = 10,
    item_cost = [13001,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 200,
    des = "对自身半径7米范围内敌方，总共造成{a}%攻击的伤害",
    character_a = "2389",
    character_b = "",
    character_c = "",
    fightForce = 26100
    };
getRow(40161,11)->
    #pet_skills_upgradingCfg {
    skill_id = 40161,
    level = 11,
    item_cost = [13001,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 200,
    des = "对自身半径7米范围内敌方，总共造成{a}%攻击的伤害",
    character_a = "2552",
    character_b = "",
    character_c = "",
    fightForce = 30600
    };
getRow(40162,1)->
    #pet_skills_upgradingCfg {
    skill_id = 40162,
    level = 1,
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "自身提升{b}%的魔法防御，持续{c}秒",
    character_a = "922",
    character_b = "40",
    character_c = "5",
    fightForce = 0
    };
getRow(40162,2)->
    #pet_skills_upgradingCfg {
    skill_id = 40162,
    level = 2,
    item_cost = [13001,1],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 40,
    des = "自身提升{b}%的魔法防御，持续{c}秒",
    character_a = "1085",
    character_b = "44",
    character_c = "5",
    fightForce = 900
    };
getRow(40162,3)->
    #pet_skills_upgradingCfg {
    skill_id = 40162,
    level = 3,
    item_cost = [13001,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 60,
    des = "自身提升{b}%的魔法防御，持续{c}秒",
    character_a = "1248",
    character_b = "48",
    character_c = "5",
    fightForce = 2700
    };
getRow(40162,4)->
    #pet_skills_upgradingCfg {
    skill_id = 40162,
    level = 4,
    item_cost = [13001,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 80,
    des = "自身提升{b}%的魔法防御，持续{c}秒",
    character_a = "1411",
    character_b = "52",
    character_c = "5",
    fightForce = 4500
    };
getRow(40162,5)->
    #pet_skills_upgradingCfg {
    skill_id = 40162,
    level = 5,
    item_cost = [13001,3],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 100,
    des = "自身提升{b}%的魔法防御，持续{c}秒",
    character_a = "1574",
    character_b = "56",
    character_c = "5",
    fightForce = 7200
    };
getRow(40162,6)->
    #pet_skills_upgradingCfg {
    skill_id = 40162,
    level = 6,
    item_cost = [13001,3],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 120,
    des = "自身提升{b}%的魔法防御，持续{c}秒",
    character_a = "1737",
    character_b = "60",
    character_c = "5",
    fightForce = 9900
    };
getRow(40162,7)->
    #pet_skills_upgradingCfg {
    skill_id = 40162,
    level = 7,
    item_cost = [13001,4],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 140,
    des = "自身提升{b}%的魔法防御，持续{c}秒",
    character_a = "1900",
    character_b = "64",
    character_c = "5",
    fightForce = 13500
    };
getRow(40162,8)->
    #pet_skills_upgradingCfg {
    skill_id = 40162,
    level = 8,
    item_cost = [13001,4],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 160,
    des = "自身提升{b}%的魔法防御，持续{c}秒",
    character_a = "2063",
    character_b = "68",
    character_c = "5",
    fightForce = 17100
    };
getRow(40162,9)->
    #pet_skills_upgradingCfg {
    skill_id = 40162,
    level = 9,
    item_cost = [13001,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 180,
    des = "自身提升{b}%的魔法防御，持续{c}秒",
    character_a = "2226",
    character_b = "72",
    character_c = "5",
    fightForce = 21600
    };
getRow(40162,10)->
    #pet_skills_upgradingCfg {
    skill_id = 40162,
    level = 10,
    item_cost = [13001,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 200,
    des = "自身提升{b}%的魔法防御，持续{c}秒",
    character_a = "2389",
    character_b = "76",
    character_c = "5",
    fightForce = 26100
    };
getRow(40162,11)->
    #pet_skills_upgradingCfg {
    skill_id = 40162,
    level = 11,
    item_cost = [13001,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 200,
    des = "自身提升{b}%的魔法防御，持续{c}秒",
    character_a = "2552",
    character_b = "80",
    character_c = "5",
    fightForce = 30600
    };
getRow(40170,1)->
    #pet_skills_upgradingCfg {
    skill_id = 40170,
    level = 1,
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "攻击前方扇形范围内敌人造成{a}%攻击的伤害",
    character_a = "640",
    character_b = "",
    character_c = "",
    fightForce = 0
    };
getRow(40170,2)->
    #pet_skills_upgradingCfg {
    skill_id = 40170,
    level = 2,
    item_cost = [13001,1],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 40,
    des = "攻击前方扇形范围内敌人造成{a}%攻击的伤害",
    character_a = "750",
    character_b = "",
    character_c = "",
    fightForce = 900
    };
getRow(40170,3)->
    #pet_skills_upgradingCfg {
    skill_id = 40170,
    level = 3,
    item_cost = [13001,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 60,
    des = "攻击前方扇形范围内敌人造成{a}%攻击的伤害",
    character_a = "860",
    character_b = "",
    character_c = "",
    fightForce = 2700
    };
getRow(40170,4)->
    #pet_skills_upgradingCfg {
    skill_id = 40170,
    level = 4,
    item_cost = [13001,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 80,
    des = "攻击前方扇形范围内敌人造成{a}%攻击的伤害",
    character_a = "970",
    character_b = "",
    character_c = "",
    fightForce = 4500
    };
getRow(40170,5)->
    #pet_skills_upgradingCfg {
    skill_id = 40170,
    level = 5,
    item_cost = [13001,3],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 100,
    des = "攻击前方扇形范围内敌人造成{a}%攻击的伤害",
    character_a = "1080",
    character_b = "",
    character_c = "",
    fightForce = 7200
    };
getRow(40170,6)->
    #pet_skills_upgradingCfg {
    skill_id = 40170,
    level = 6,
    item_cost = [13001,3],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 120,
    des = "攻击前方扇形范围内敌人造成{a}%攻击的伤害",
    character_a = "1190",
    character_b = "",
    character_c = "",
    fightForce = 9900
    };
getRow(40170,7)->
    #pet_skills_upgradingCfg {
    skill_id = 40170,
    level = 7,
    item_cost = [13001,4],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 140,
    des = "攻击前方扇形范围内敌人造成{a}%攻击的伤害",
    character_a = "1300",
    character_b = "",
    character_c = "",
    fightForce = 13500
    };
getRow(40170,8)->
    #pet_skills_upgradingCfg {
    skill_id = 40170,
    level = 8,
    item_cost = [13001,4],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 160,
    des = "攻击前方扇形范围内敌人造成{a}%攻击的伤害",
    character_a = "1410",
    character_b = "",
    character_c = "",
    fightForce = 17100
    };
getRow(40170,9)->
    #pet_skills_upgradingCfg {
    skill_id = 40170,
    level = 9,
    item_cost = [13001,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 180,
    des = "攻击前方扇形范围内敌人造成{a}%攻击的伤害",
    character_a = "1520",
    character_b = "",
    character_c = "",
    fightForce = 21600
    };
getRow(40170,10)->
    #pet_skills_upgradingCfg {
    skill_id = 40170,
    level = 10,
    item_cost = [13001,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 200,
    des = "攻击前方扇形范围内敌人造成{a}%攻击的伤害",
    character_a = "1630",
    character_b = "",
    character_c = "",
    fightForce = 26100
    };
getRow(40170,11)->
    #pet_skills_upgradingCfg {
    skill_id = 40170,
    level = 11,
    item_cost = [13001,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 200,
    des = "攻击前方扇形范围内敌人造成{a}%攻击的伤害",
    character_a = "1740",
    character_b = "",
    character_c = "",
    fightForce = 30600
    };
getRow(40171,1)->
    #pet_skills_upgradingCfg {
    skill_id = 40171,
    level = 1,
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "前方矩形范围内敌人受到{a}%攻击的伤害",
    character_a = "768",
    character_b = "",
    character_c = "2",
    fightForce = 0
    };
getRow(40171,2)->
    #pet_skills_upgradingCfg {
    skill_id = 40171,
    level = 2,
    item_cost = [13001,1],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 40,
    des = "前方矩形范围内敌人受到{a}%攻击的伤害",
    character_a = "904",
    character_b = "",
    character_c = "2",
    fightForce = 900
    };
getRow(40171,3)->
    #pet_skills_upgradingCfg {
    skill_id = 40171,
    level = 3,
    item_cost = [13001,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 60,
    des = "前方矩形范围内敌人受到{a}%攻击的伤害",
    character_a = "1040",
    character_b = "",
    character_c = "2",
    fightForce = 2700
    };
getRow(40171,4)->
    #pet_skills_upgradingCfg {
    skill_id = 40171,
    level = 4,
    item_cost = [13001,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 80,
    des = "前方矩形范围内敌人受到{a}%攻击的伤害",
    character_a = "1176",
    character_b = "",
    character_c = "2",
    fightForce = 4500
    };
getRow(40171,5)->
    #pet_skills_upgradingCfg {
    skill_id = 40171,
    level = 5,
    item_cost = [13001,3],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 100,
    des = "前方矩形范围内敌人受到{a}%攻击的伤害",
    character_a = "1312",
    character_b = "",
    character_c = "2",
    fightForce = 7200
    };
getRow(40171,6)->
    #pet_skills_upgradingCfg {
    skill_id = 40171,
    level = 6,
    item_cost = [13001,3],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 120,
    des = "前方矩形范围内敌人受到{a}%攻击的伤害",
    character_a = "1448",
    character_b = "",
    character_c = "2",
    fightForce = 9900
    };
getRow(40171,7)->
    #pet_skills_upgradingCfg {
    skill_id = 40171,
    level = 7,
    item_cost = [13001,4],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 140,
    des = "前方矩形范围内敌人受到{a}%攻击的伤害",
    character_a = "1584",
    character_b = "",
    character_c = "2",
    fightForce = 13500
    };
getRow(40171,8)->
    #pet_skills_upgradingCfg {
    skill_id = 40171,
    level = 8,
    item_cost = [13001,4],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 160,
    des = "前方矩形范围内敌人受到{a}%攻击的伤害",
    character_a = "1720",
    character_b = "",
    character_c = "2",
    fightForce = 17100
    };
getRow(40171,9)->
    #pet_skills_upgradingCfg {
    skill_id = 40171,
    level = 9,
    item_cost = [13001,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 180,
    des = "前方矩形范围内敌人受到{a}%攻击的伤害",
    character_a = "1856",
    character_b = "",
    character_c = "2",
    fightForce = 21600
    };
getRow(40171,10)->
    #pet_skills_upgradingCfg {
    skill_id = 40171,
    level = 10,
    item_cost = [13001,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 200,
    des = "前方矩形范围内敌人受到{a}%攻击的伤害",
    character_a = "1992",
    character_b = "",
    character_c = "2",
    fightForce = 26100
    };
getRow(40171,11)->
    #pet_skills_upgradingCfg {
    skill_id = 40171,
    level = 11,
    item_cost = [13001,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 200,
    des = "前方矩形范围内敌人受到{a}%攻击的伤害",
    character_a = "2128",
    character_b = "",
    character_c = "2",
    fightForce = 30600
    };
getRow(40172,1)->
    #pet_skills_upgradingCfg {
    skill_id = 40172,
    level = 1,
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "100%眩晕敌方单体目标{c}秒",
    character_a = "",
    character_b = "",
    character_c = "2",
    fightForce = 0
    };
getRow(40172,2)->
    #pet_skills_upgradingCfg {
    skill_id = 40172,
    level = 2,
    item_cost = [13001,1],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 40,
    des = "100%眩晕敌方单体目标{c}秒",
    character_a = "",
    character_b = "",
    character_c = "2.3",
    fightForce = 900
    };
getRow(40172,3)->
    #pet_skills_upgradingCfg {
    skill_id = 40172,
    level = 3,
    item_cost = [13001,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 60,
    des = "100%眩晕敌方单体目标{c}秒",
    character_a = "",
    character_b = "",
    character_c = "2.6",
    fightForce = 2700
    };
getRow(40172,4)->
    #pet_skills_upgradingCfg {
    skill_id = 40172,
    level = 4,
    item_cost = [13001,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 80,
    des = "100%眩晕敌方单体目标{c}秒",
    character_a = "",
    character_b = "",
    character_c = "2.9",
    fightForce = 4500
    };
getRow(40172,5)->
    #pet_skills_upgradingCfg {
    skill_id = 40172,
    level = 5,
    item_cost = [13001,3],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 100,
    des = "100%眩晕敌方单体目标{c}秒",
    character_a = "",
    character_b = "",
    character_c = "3.2",
    fightForce = 7200
    };
getRow(40172,6)->
    #pet_skills_upgradingCfg {
    skill_id = 40172,
    level = 6,
    item_cost = [13001,3],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 120,
    des = "100%眩晕敌方单体目标{c}秒",
    character_a = "",
    character_b = "",
    character_c = "3.5",
    fightForce = 9900
    };
getRow(40172,7)->
    #pet_skills_upgradingCfg {
    skill_id = 40172,
    level = 7,
    item_cost = [13001,4],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 140,
    des = "100%眩晕敌方单体目标{c}秒",
    character_a = "",
    character_b = "",
    character_c = "3.8",
    fightForce = 13500
    };
getRow(40172,8)->
    #pet_skills_upgradingCfg {
    skill_id = 40172,
    level = 8,
    item_cost = [13001,4],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 160,
    des = "100%眩晕敌方单体目标{c}秒",
    character_a = "",
    character_b = "",
    character_c = "4.1",
    fightForce = 17100
    };
getRow(40172,9)->
    #pet_skills_upgradingCfg {
    skill_id = 40172,
    level = 9,
    item_cost = [13001,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 180,
    des = "100%眩晕敌方单体目标{c}秒",
    character_a = "",
    character_b = "",
    character_c = "4.4",
    fightForce = 21600
    };
getRow(40172,10)->
    #pet_skills_upgradingCfg {
    skill_id = 40172,
    level = 10,
    item_cost = [13001,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 200,
    des = "100%眩晕敌方单体目标{c}秒",
    character_a = "",
    character_b = "",
    character_c = "4.7",
    fightForce = 26100
    };
getRow(40172,11)->
    #pet_skills_upgradingCfg {
    skill_id = 40172,
    level = 11,
    item_cost = [13001,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 200,
    des = "100%眩晕敌方单体目标{c}秒",
    character_a = "",
    character_b = "",
    character_c = "5",
    fightForce = 30600
    };
getRow(40180,1)->
    #pet_skills_upgradingCfg {
    skill_id = 40180,
    level = 1,
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "扑向前方敌人，总共造成{a}%攻击的伤害",
    character_a = "640",
    character_b = "",
    character_c = "",
    fightForce = 0
    };
getRow(40180,2)->
    #pet_skills_upgradingCfg {
    skill_id = 40180,
    level = 2,
    item_cost = [13000,1],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 40,
    des = "扑向前方敌人，总共造成{a}%攻击的伤害",
    character_a = "740",
    character_b = "",
    character_c = "",
    fightForce = 300
    };
getRow(40180,3)->
    #pet_skills_upgradingCfg {
    skill_id = 40180,
    level = 3,
    item_cost = [13000,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 60,
    des = "扑向前方敌人，总共造成{a}%攻击的伤害",
    character_a = "840",
    character_b = "",
    character_c = "",
    fightForce = 900
    };
getRow(40180,4)->
    #pet_skills_upgradingCfg {
    skill_id = 40180,
    level = 4,
    item_cost = [13000,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 80,
    des = "扑向前方敌人，总共造成{a}%攻击的伤害",
    character_a = "940",
    character_b = "",
    character_c = "",
    fightForce = 1500
    };
getRow(40180,5)->
    #pet_skills_upgradingCfg {
    skill_id = 40180,
    level = 5,
    item_cost = [13000,3],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 100,
    des = "扑向前方敌人，总共造成{a}%攻击的伤害",
    character_a = "1040",
    character_b = "",
    character_c = "",
    fightForce = 2400
    };
getRow(40180,6)->
    #pet_skills_upgradingCfg {
    skill_id = 40180,
    level = 6,
    item_cost = [13000,3],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 120,
    des = "扑向前方敌人，总共造成{a}%攻击的伤害",
    character_a = "1140",
    character_b = "",
    character_c = "",
    fightForce = 3300
    };
getRow(40180,7)->
    #pet_skills_upgradingCfg {
    skill_id = 40180,
    level = 7,
    item_cost = [13000,4],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 140,
    des = "扑向前方敌人，总共造成{a}%攻击的伤害",
    character_a = "1240",
    character_b = "",
    character_c = "",
    fightForce = 4500
    };
getRow(40180,8)->
    #pet_skills_upgradingCfg {
    skill_id = 40180,
    level = 8,
    item_cost = [13000,4],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 160,
    des = "扑向前方敌人，总共造成{a}%攻击的伤害",
    character_a = "1340",
    character_b = "",
    character_c = "",
    fightForce = 5700
    };
getRow(40180,9)->
    #pet_skills_upgradingCfg {
    skill_id = 40180,
    level = 9,
    item_cost = [13000,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 180,
    des = "扑向前方敌人，总共造成{a}%攻击的伤害",
    character_a = "1440",
    character_b = "",
    character_c = "",
    fightForce = 7200
    };
getRow(40180,10)->
    #pet_skills_upgradingCfg {
    skill_id = 40180,
    level = 10,
    item_cost = [13000,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 200,
    des = "扑向前方敌人，总共造成{a}%攻击的伤害",
    character_a = "1540",
    character_b = "",
    character_c = "",
    fightForce = 8700
    };
getRow(40180,11)->
    #pet_skills_upgradingCfg {
    skill_id = 40180,
    level = 11,
    item_cost = [13000,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 200,
    des = "扑向前方敌人，总共造成{a}%攻击的伤害",
    character_a = "1640",
    character_b = "",
    character_c = "",
    fightForce = 10200
    };
getRow(40181,1)->
    #pet_skills_upgradingCfg {
    skill_id = 40181,
    level = 1,
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "攻击正前方扇形区域敌人2次，每次造成{a}%攻击的伤害，50%概率降低{b}%防御力",
    character_a = "948",
    character_b = "10",
    character_c = "5",
    fightForce = 0
    };
getRow(40181,2)->
    #pet_skills_upgradingCfg {
    skill_id = 40181,
    level = 2,
    item_cost = [13000,1],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 40,
    des = "攻击正前方扇形区域敌人2次，每次造成{a}%攻击的伤害，50%概率降低{b}%防御力",
    character_a = "1086",
    character_b = "11",
    character_c = "5",
    fightForce = 300
    };
getRow(40181,3)->
    #pet_skills_upgradingCfg {
    skill_id = 40181,
    level = 3,
    item_cost = [13000,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 60,
    des = "攻击正前方扇形区域敌人2次，每次造成{a}%攻击的伤害，50%概率降低{b}%防御力",
    character_a = "1224",
    character_b = "12",
    character_c = "5",
    fightForce = 900
    };
getRow(40181,4)->
    #pet_skills_upgradingCfg {
    skill_id = 40181,
    level = 4,
    item_cost = [13000,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 80,
    des = "攻击正前方扇形区域敌人2次，每次造成{a}%攻击的伤害，50%概率降低{b}%防御力",
    character_a = "1362",
    character_b = "13",
    character_c = "5",
    fightForce = 1500
    };
getRow(40181,5)->
    #pet_skills_upgradingCfg {
    skill_id = 40181,
    level = 5,
    item_cost = [13000,3],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 100,
    des = "攻击正前方扇形区域敌人2次，每次造成{a}%攻击的伤害，50%概率降低{b}%防御力",
    character_a = "1500",
    character_b = "14",
    character_c = "5",
    fightForce = 2400
    };
getRow(40181,6)->
    #pet_skills_upgradingCfg {
    skill_id = 40181,
    level = 6,
    item_cost = [13000,3],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 120,
    des = "攻击正前方扇形区域敌人2次，每次造成{a}%攻击的伤害，50%概率降低{b}%防御力",
    character_a = "1638",
    character_b = "15",
    character_c = "5",
    fightForce = 3300
    };
getRow(40181,7)->
    #pet_skills_upgradingCfg {
    skill_id = 40181,
    level = 7,
    item_cost = [13000,4],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 140,
    des = "攻击正前方扇形区域敌人2次，每次造成{a}%攻击的伤害，50%概率降低{b}%防御力",
    character_a = "1776",
    character_b = "16",
    character_c = "5",
    fightForce = 4500
    };
getRow(40181,8)->
    #pet_skills_upgradingCfg {
    skill_id = 40181,
    level = 8,
    item_cost = [13000,4],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 160,
    des = "攻击正前方扇形区域敌人2次，每次造成{a}%攻击的伤害，50%概率降低{b}%防御力",
    character_a = "1914",
    character_b = "17",
    character_c = "5",
    fightForce = 5700
    };
getRow(40181,9)->
    #pet_skills_upgradingCfg {
    skill_id = 40181,
    level = 9,
    item_cost = [13000,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 180,
    des = "攻击正前方扇形区域敌人2次，每次造成{a}%攻击的伤害，50%概率降低{b}%防御力",
    character_a = "2052",
    character_b = "18",
    character_c = "5",
    fightForce = 7200
    };
getRow(40181,10)->
    #pet_skills_upgradingCfg {
    skill_id = 40181,
    level = 10,
    item_cost = [13000,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 200,
    des = "攻击正前方扇形区域敌人2次，每次造成{a}%攻击的伤害，50%概率降低{b}%防御力",
    character_a = "2190",
    character_b = "19",
    character_c = "5",
    fightForce = 8700
    };
getRow(40181,11)->
    #pet_skills_upgradingCfg {
    skill_id = 40181,
    level = 11,
    item_cost = [13000,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 200,
    des = "攻击正前方扇形区域敌人2次，每次造成{a}%攻击的伤害，50%概率降低{b}%防御力",
    character_a = "2328",
    character_b = "20",
    character_c = "5",
    fightForce = 10200
    };
getRow(40190,1)->
    #pet_skills_upgradingCfg {
    skill_id = 40190,
    level = 1,
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "扑向前方敌人，总共造成{a}%攻击的伤害",
    character_a = "628",
    character_b = "",
    character_c = "",
    fightForce = 0
    };
getRow(40190,2)->
    #pet_skills_upgradingCfg {
    skill_id = 40190,
    level = 2,
    item_cost = [13000,1],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 40,
    des = "扑向前方敌人，总共造成{a}%攻击的伤害",
    character_a = "726",
    character_b = "",
    character_c = "",
    fightForce = 300
    };
getRow(40190,3)->
    #pet_skills_upgradingCfg {
    skill_id = 40190,
    level = 3,
    item_cost = [13000,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 60,
    des = "扑向前方敌人，总共造成{a}%攻击的伤害",
    character_a = "824",
    character_b = "",
    character_c = "",
    fightForce = 900
    };
getRow(40190,4)->
    #pet_skills_upgradingCfg {
    skill_id = 40190,
    level = 4,
    item_cost = [13000,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 80,
    des = "扑向前方敌人，总共造成{a}%攻击的伤害",
    character_a = "922",
    character_b = "",
    character_c = "",
    fightForce = 1500
    };
getRow(40190,5)->
    #pet_skills_upgradingCfg {
    skill_id = 40190,
    level = 5,
    item_cost = [13000,3],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 100,
    des = "扑向前方敌人，总共造成{a}%攻击的伤害",
    character_a = "1020",
    character_b = "",
    character_c = "",
    fightForce = 2400
    };
getRow(40190,6)->
    #pet_skills_upgradingCfg {
    skill_id = 40190,
    level = 6,
    item_cost = [13000,3],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 120,
    des = "扑向前方敌人，总共造成{a}%攻击的伤害",
    character_a = "1118",
    character_b = "",
    character_c = "",
    fightForce = 3300
    };
getRow(40190,7)->
    #pet_skills_upgradingCfg {
    skill_id = 40190,
    level = 7,
    item_cost = [13000,4],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 140,
    des = "扑向前方敌人，总共造成{a}%攻击的伤害",
    character_a = "1216",
    character_b = "",
    character_c = "",
    fightForce = 4500
    };
getRow(40190,8)->
    #pet_skills_upgradingCfg {
    skill_id = 40190,
    level = 8,
    item_cost = [13000,4],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 160,
    des = "扑向前方敌人，总共造成{a}%攻击的伤害",
    character_a = "1314",
    character_b = "",
    character_c = "",
    fightForce = 5700
    };
getRow(40190,9)->
    #pet_skills_upgradingCfg {
    skill_id = 40190,
    level = 9,
    item_cost = [13000,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 180,
    des = "扑向前方敌人，总共造成{a}%攻击的伤害",
    character_a = "1412",
    character_b = "",
    character_c = "",
    fightForce = 7200
    };
getRow(40190,10)->
    #pet_skills_upgradingCfg {
    skill_id = 40190,
    level = 10,
    item_cost = [13000,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 200,
    des = "扑向前方敌人，总共造成{a}%攻击的伤害",
    character_a = "1510",
    character_b = "",
    character_c = "",
    fightForce = 8700
    };
getRow(40190,11)->
    #pet_skills_upgradingCfg {
    skill_id = 40190,
    level = 11,
    item_cost = [13000,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 200,
    des = "扑向前方敌人，总共造成{a}%攻击的伤害",
    character_a = "1608",
    character_b = "",
    character_c = "",
    fightForce = 10200
    };
getRow(40191,1)->
    #pet_skills_upgradingCfg {
    skill_id = 40191,
    level = 1,
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "对前方扇形敌人，总共造成{a}%攻击的伤害，如果暴击则降低敌人{b}%攻击力",
    character_a = "942",
    character_b = "5",
    character_c = "5",
    fightForce = 0
    };
getRow(40191,2)->
    #pet_skills_upgradingCfg {
    skill_id = 40191,
    level = 2,
    item_cost = [13000,1],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 40,
    des = "对前方扇形敌人，总共造成{a}%攻击的伤害，如果暴击则降低敌人{b}%攻击力",
    character_a = "1079",
    character_b = "5.5",
    character_c = "5",
    fightForce = 300
    };
getRow(40191,3)->
    #pet_skills_upgradingCfg {
    skill_id = 40191,
    level = 3,
    item_cost = [13000,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 60,
    des = "对前方扇形敌人，总共造成{a}%攻击的伤害，如果暴击则降低敌人{b}%攻击力",
    character_a = "1216",
    character_b = "6",
    character_c = "5",
    fightForce = 900
    };
getRow(40191,4)->
    #pet_skills_upgradingCfg {
    skill_id = 40191,
    level = 4,
    item_cost = [13000,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 80,
    des = "对前方扇形敌人，总共造成{a}%攻击的伤害，如果暴击则降低敌人{b}%攻击力",
    character_a = "1353",
    character_b = "6.5",
    character_c = "5",
    fightForce = 1500
    };
getRow(40191,5)->
    #pet_skills_upgradingCfg {
    skill_id = 40191,
    level = 5,
    item_cost = [13000,3],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 100,
    des = "对前方扇形敌人，总共造成{a}%攻击的伤害，如果暴击则降低敌人{b}%攻击力",
    character_a = "1490",
    character_b = "7",
    character_c = "5",
    fightForce = 2400
    };
getRow(40191,6)->
    #pet_skills_upgradingCfg {
    skill_id = 40191,
    level = 6,
    item_cost = [13000,3],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 120,
    des = "对前方扇形敌人，总共造成{a}%攻击的伤害，如果暴击则降低敌人{b}%攻击力",
    character_a = "1627",
    character_b = "7.5",
    character_c = "5",
    fightForce = 3300
    };
getRow(40191,7)->
    #pet_skills_upgradingCfg {
    skill_id = 40191,
    level = 7,
    item_cost = [13000,4],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 140,
    des = "对前方扇形敌人，总共造成{a}%攻击的伤害，如果暴击则降低敌人{b}%攻击力",
    character_a = "1764",
    character_b = "8",
    character_c = "5",
    fightForce = 4500
    };
getRow(40191,8)->
    #pet_skills_upgradingCfg {
    skill_id = 40191,
    level = 8,
    item_cost = [13000,4],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 160,
    des = "对前方扇形敌人，总共造成{a}%攻击的伤害，如果暴击则降低敌人{b}%攻击力",
    character_a = "1901",
    character_b = "8.5",
    character_c = "5",
    fightForce = 5700
    };
getRow(40191,9)->
    #pet_skills_upgradingCfg {
    skill_id = 40191,
    level = 9,
    item_cost = [13000,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 180,
    des = "对前方扇形敌人，总共造成{a}%攻击的伤害，如果暴击则降低敌人{b}%攻击力",
    character_a = "2038",
    character_b = "9",
    character_c = "5",
    fightForce = 7200
    };
getRow(40191,10)->
    #pet_skills_upgradingCfg {
    skill_id = 40191,
    level = 10,
    item_cost = [13000,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 200,
    des = "对前方扇形敌人，总共造成{a}%攻击的伤害，如果暴击则降低敌人{b}%攻击力",
    character_a = "2175",
    character_b = "9.5",
    character_c = "5",
    fightForce = 8700
    };
getRow(40191,11)->
    #pet_skills_upgradingCfg {
    skill_id = 40191,
    level = 11,
    item_cost = [13000,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 200,
    des = "对前方扇形敌人，总共造成{a}%攻击的伤害，如果暴击则降低敌人{b}%攻击力",
    character_a = "2312",
    character_b = "10",
    character_c = "5",
    fightForce = 10200
    };
getRow(40200,1)->
    #pet_skills_upgradingCfg {
    skill_id = 40200,
    level = 1,
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "攻击前方单体目标，总共造成{a}%攻击的伤害",
    character_a = "768",
    character_b = "",
    character_c = "",
    fightForce = 0
    };
getRow(40200,2)->
    #pet_skills_upgradingCfg {
    skill_id = 40200,
    level = 2,
    item_cost = [13000,1],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 40,
    des = "攻击前方单体目标，总共造成{a}%攻击的伤害",
    character_a = "888",
    character_b = "",
    character_c = "",
    fightForce = 300
    };
getRow(40200,3)->
    #pet_skills_upgradingCfg {
    skill_id = 40200,
    level = 3,
    item_cost = [13000,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 60,
    des = "攻击前方单体目标，总共造成{a}%攻击的伤害",
    character_a = "1008",
    character_b = "",
    character_c = "",
    fightForce = 900
    };
getRow(40200,4)->
    #pet_skills_upgradingCfg {
    skill_id = 40200,
    level = 4,
    item_cost = [13000,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 80,
    des = "攻击前方单体目标，总共造成{a}%攻击的伤害",
    character_a = "1128",
    character_b = "",
    character_c = "",
    fightForce = 1500
    };
getRow(40200,5)->
    #pet_skills_upgradingCfg {
    skill_id = 40200,
    level = 5,
    item_cost = [13000,3],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 100,
    des = "攻击前方单体目标，总共造成{a}%攻击的伤害",
    character_a = "1248",
    character_b = "",
    character_c = "",
    fightForce = 2400
    };
getRow(40200,6)->
    #pet_skills_upgradingCfg {
    skill_id = 40200,
    level = 6,
    item_cost = [13000,3],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 120,
    des = "攻击前方单体目标，总共造成{a}%攻击的伤害",
    character_a = "1368",
    character_b = "",
    character_c = "",
    fightForce = 3300
    };
getRow(40200,7)->
    #pet_skills_upgradingCfg {
    skill_id = 40200,
    level = 7,
    item_cost = [13000,4],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 140,
    des = "攻击前方单体目标，总共造成{a}%攻击的伤害",
    character_a = "1488",
    character_b = "",
    character_c = "",
    fightForce = 4500
    };
getRow(40200,8)->
    #pet_skills_upgradingCfg {
    skill_id = 40200,
    level = 8,
    item_cost = [13000,4],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 160,
    des = "攻击前方单体目标，总共造成{a}%攻击的伤害",
    character_a = "1608",
    character_b = "",
    character_c = "",
    fightForce = 5700
    };
getRow(40200,9)->
    #pet_skills_upgradingCfg {
    skill_id = 40200,
    level = 9,
    item_cost = [13000,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 180,
    des = "攻击前方单体目标，总共造成{a}%攻击的伤害",
    character_a = "1728",
    character_b = "",
    character_c = "",
    fightForce = 7200
    };
getRow(40200,10)->
    #pet_skills_upgradingCfg {
    skill_id = 40200,
    level = 10,
    item_cost = [13000,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 200,
    des = "攻击前方单体目标，总共造成{a}%攻击的伤害",
    character_a = "1848",
    character_b = "",
    character_c = "",
    fightForce = 8700
    };
getRow(40200,11)->
    #pet_skills_upgradingCfg {
    skill_id = 40200,
    level = 11,
    item_cost = [13000,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 200,
    des = "攻击前方单体目标，总共造成{a}%攻击的伤害",
    character_a = "1968",
    character_b = "",
    character_c = "",
    fightForce = 10200
    };
getRow(40201,1)->
    #pet_skills_upgradingCfg {
    skill_id = 40201,
    level = 1,
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "周围10米敌方有概率陷入昏迷{c}秒，造成{a}%点伤害",
    character_a = "576",
    character_b = "",
    character_c = "2",
    fightForce = 0
    };
getRow(40201,2)->
    #pet_skills_upgradingCfg {
    skill_id = 40201,
    level = 2,
    item_cost = [13000,1],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 40,
    des = "周围10米敌方有概率陷入昏迷{c}秒，造成{a}%点伤害",
    character_a = "660",
    character_b = "",
    character_c = "2",
    fightForce = 300
    };
getRow(40201,3)->
    #pet_skills_upgradingCfg {
    skill_id = 40201,
    level = 3,
    item_cost = [13000,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 60,
    des = "周围10米敌方有概率陷入昏迷{c}秒，造成{a}%点伤害",
    character_a = "744",
    character_b = "",
    character_c = "2",
    fightForce = 900
    };
getRow(40201,4)->
    #pet_skills_upgradingCfg {
    skill_id = 40201,
    level = 4,
    item_cost = [13000,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 80,
    des = "周围10米敌方有概率陷入昏迷{c}秒，造成{a}%点伤害",
    character_a = "828",
    character_b = "",
    character_c = "2",
    fightForce = 1500
    };
getRow(40201,5)->
    #pet_skills_upgradingCfg {
    skill_id = 40201,
    level = 5,
    item_cost = [13000,3],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 100,
    des = "周围10米敌方有概率陷入昏迷{c}秒，造成{a}%点伤害",
    character_a = "912",
    character_b = "",
    character_c = "2",
    fightForce = 2400
    };
getRow(40201,6)->
    #pet_skills_upgradingCfg {
    skill_id = 40201,
    level = 6,
    item_cost = [13000,3],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 120,
    des = "周围10米敌方有概率陷入昏迷{c}秒，造成{a}%点伤害",
    character_a = "996",
    character_b = "",
    character_c = "2",
    fightForce = 3300
    };
getRow(40201,7)->
    #pet_skills_upgradingCfg {
    skill_id = 40201,
    level = 7,
    item_cost = [13000,4],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 140,
    des = "周围10米敌方有概率陷入昏迷{c}秒，造成{a}%点伤害",
    character_a = "1080",
    character_b = "",
    character_c = "2",
    fightForce = 4500
    };
getRow(40201,8)->
    #pet_skills_upgradingCfg {
    skill_id = 40201,
    level = 8,
    item_cost = [13000,4],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 160,
    des = "周围10米敌方有概率陷入昏迷{c}秒，造成{a}%点伤害",
    character_a = "1164",
    character_b = "",
    character_c = "2",
    fightForce = 5700
    };
getRow(40201,9)->
    #pet_skills_upgradingCfg {
    skill_id = 40201,
    level = 9,
    item_cost = [13000,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 180,
    des = "周围10米敌方有概率陷入昏迷{c}秒，造成{a}%点伤害",
    character_a = "1248",
    character_b = "",
    character_c = "2",
    fightForce = 7200
    };
getRow(40201,10)->
    #pet_skills_upgradingCfg {
    skill_id = 40201,
    level = 10,
    item_cost = [13000,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 200,
    des = "周围10米敌方有概率陷入昏迷{c}秒，造成{a}%点伤害",
    character_a = "1332",
    character_b = "",
    character_c = "2",
    fightForce = 8700
    };
getRow(40201,11)->
    #pet_skills_upgradingCfg {
    skill_id = 40201,
    level = 11,
    item_cost = [13000,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 200,
    des = "周围10米敌方有概率陷入昏迷{c}秒，造成{a}%点伤害",
    character_a = "1416",
    character_b = "",
    character_c = "2",
    fightForce = 10200
    };
getRow(40210,1)->
    #pet_skills_upgradingCfg {
    skill_id = 40210,
    level = 1,
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "攻击前方单体目标，总共造成{a}%攻击的伤害",
    character_a = "768",
    character_b = "",
    character_c = "",
    fightForce = 0
    };
getRow(40210,2)->
    #pet_skills_upgradingCfg {
    skill_id = 40210,
    level = 2,
    item_cost = [13000,1],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 40,
    des = "攻击前方单体目标，总共造成{a}%攻击的伤害",
    character_a = "888",
    character_b = "",
    character_c = "",
    fightForce = 300
    };
getRow(40210,3)->
    #pet_skills_upgradingCfg {
    skill_id = 40210,
    level = 3,
    item_cost = [13000,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 60,
    des = "攻击前方单体目标，总共造成{a}%攻击的伤害",
    character_a = "1008",
    character_b = "",
    character_c = "",
    fightForce = 900
    };
getRow(40210,4)->
    #pet_skills_upgradingCfg {
    skill_id = 40210,
    level = 4,
    item_cost = [13000,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 80,
    des = "攻击前方单体目标，总共造成{a}%攻击的伤害",
    character_a = "1128",
    character_b = "",
    character_c = "",
    fightForce = 1500
    };
getRow(40210,5)->
    #pet_skills_upgradingCfg {
    skill_id = 40210,
    level = 5,
    item_cost = [13000,3],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 100,
    des = "攻击前方单体目标，总共造成{a}%攻击的伤害",
    character_a = "1248",
    character_b = "",
    character_c = "",
    fightForce = 2400
    };
getRow(40210,6)->
    #pet_skills_upgradingCfg {
    skill_id = 40210,
    level = 6,
    item_cost = [13000,3],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 120,
    des = "攻击前方单体目标，总共造成{a}%攻击的伤害",
    character_a = "1368",
    character_b = "",
    character_c = "",
    fightForce = 3300
    };
getRow(40210,7)->
    #pet_skills_upgradingCfg {
    skill_id = 40210,
    level = 7,
    item_cost = [13000,4],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 140,
    des = "攻击前方单体目标，总共造成{a}%攻击的伤害",
    character_a = "1488",
    character_b = "",
    character_c = "",
    fightForce = 4500
    };
getRow(40210,8)->
    #pet_skills_upgradingCfg {
    skill_id = 40210,
    level = 8,
    item_cost = [13000,4],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 160,
    des = "攻击前方单体目标，总共造成{a}%攻击的伤害",
    character_a = "1608",
    character_b = "",
    character_c = "",
    fightForce = 5700
    };
getRow(40210,9)->
    #pet_skills_upgradingCfg {
    skill_id = 40210,
    level = 9,
    item_cost = [13000,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 180,
    des = "攻击前方单体目标，总共造成{a}%攻击的伤害",
    character_a = "1728",
    character_b = "",
    character_c = "",
    fightForce = 7200
    };
getRow(40210,10)->
    #pet_skills_upgradingCfg {
    skill_id = 40210,
    level = 10,
    item_cost = [13000,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 200,
    des = "攻击前方单体目标，总共造成{a}%攻击的伤害",
    character_a = "1848",
    character_b = "",
    character_c = "",
    fightForce = 8700
    };
getRow(40210,11)->
    #pet_skills_upgradingCfg {
    skill_id = 40210,
    level = 11,
    item_cost = [13000,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 200,
    des = "攻击前方单体目标，总共造成{a}%攻击的伤害",
    character_a = "1968",
    character_b = "",
    character_c = "",
    fightForce = 10200
    };
getRow(40211,1)->
    #pet_skills_upgradingCfg {
    skill_id = 40211,
    level = 1,
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "攻击前方扇形范围内敌方，总共造成{a}%攻击的伤害，对玩家会造成双倍伤害",
    character_a = "960",
    character_b = "",
    character_c = "",
    fightForce = 0
    };
getRow(40211,2)->
    #pet_skills_upgradingCfg {
    skill_id = 40211,
    level = 2,
    item_cost = [13000,1],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 40,
    des = "攻击前方扇形范围内敌方，总共造成{a}%攻击的伤害，对玩家会造成双倍伤害",
    character_a = "1100",
    character_b = "",
    character_c = "",
    fightForce = 300
    };
getRow(40211,3)->
    #pet_skills_upgradingCfg {
    skill_id = 40211,
    level = 3,
    item_cost = [13000,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 60,
    des = "攻击前方扇形范围内敌方，总共造成{a}%攻击的伤害，对玩家会造成双倍伤害",
    character_a = "1240",
    character_b = "",
    character_c = "",
    fightForce = 900
    };
getRow(40211,4)->
    #pet_skills_upgradingCfg {
    skill_id = 40211,
    level = 4,
    item_cost = [13000,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 80,
    des = "攻击前方扇形范围内敌方，总共造成{a}%攻击的伤害，对玩家会造成双倍伤害",
    character_a = "1380",
    character_b = "",
    character_c = "",
    fightForce = 1500
    };
getRow(40211,5)->
    #pet_skills_upgradingCfg {
    skill_id = 40211,
    level = 5,
    item_cost = [13000,3],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 100,
    des = "攻击前方扇形范围内敌方，总共造成{a}%攻击的伤害，对玩家会造成双倍伤害",
    character_a = "1520",
    character_b = "",
    character_c = "",
    fightForce = 2400
    };
getRow(40211,6)->
    #pet_skills_upgradingCfg {
    skill_id = 40211,
    level = 6,
    item_cost = [13000,3],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 120,
    des = "攻击前方扇形范围内敌方，总共造成{a}%攻击的伤害，对玩家会造成双倍伤害",
    character_a = "1660",
    character_b = "",
    character_c = "",
    fightForce = 3300
    };
getRow(40211,7)->
    #pet_skills_upgradingCfg {
    skill_id = 40211,
    level = 7,
    item_cost = [13000,4],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 140,
    des = "攻击前方扇形范围内敌方，总共造成{a}%攻击的伤害，对玩家会造成双倍伤害",
    character_a = "1800",
    character_b = "",
    character_c = "",
    fightForce = 4500
    };
getRow(40211,8)->
    #pet_skills_upgradingCfg {
    skill_id = 40211,
    level = 8,
    item_cost = [13000,4],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 160,
    des = "攻击前方扇形范围内敌方，总共造成{a}%攻击的伤害，对玩家会造成双倍伤害",
    character_a = "1940",
    character_b = "",
    character_c = "",
    fightForce = 5700
    };
getRow(40211,9)->
    #pet_skills_upgradingCfg {
    skill_id = 40211,
    level = 9,
    item_cost = [13000,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 180,
    des = "攻击前方扇形范围内敌方，总共造成{a}%攻击的伤害，对玩家会造成双倍伤害",
    character_a = "2080",
    character_b = "",
    character_c = "",
    fightForce = 7200
    };
getRow(40211,10)->
    #pet_skills_upgradingCfg {
    skill_id = 40211,
    level = 10,
    item_cost = [13000,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 200,
    des = "攻击前方扇形范围内敌方，总共造成{a}%攻击的伤害，对玩家会造成双倍伤害",
    character_a = "2220",
    character_b = "",
    character_c = "",
    fightForce = 8700
    };
getRow(40211,11)->
    #pet_skills_upgradingCfg {
    skill_id = 40211,
    level = 11,
    item_cost = [13000,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 200,
    des = "攻击前方扇形范围内敌方，总共造成{a}%攻击的伤害，对玩家会造成双倍伤害",
    character_a = "2360",
    character_b = "",
    character_c = "",
    fightForce = 10200
    };
getRow(40220,1)->
    #pet_skills_upgradingCfg {
    skill_id = 40220,
    level = 1,
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "对前方敌人造成2次攻击，每次造成{a}%攻击的伤害",
    character_a = "310",
    character_b = "",
    character_c = "",
    fightForce = 0
    };
getRow(40220,2)->
    #pet_skills_upgradingCfg {
    skill_id = 40220,
    level = 2,
    item_cost = [13000,1],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 40,
    des = "对前方敌人造成2次攻击，每次造成{a}%攻击的伤害",
    character_a = "358",
    character_b = "",
    character_c = "",
    fightForce = 300
    };
getRow(40220,3)->
    #pet_skills_upgradingCfg {
    skill_id = 40220,
    level = 3,
    item_cost = [13000,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 60,
    des = "对前方敌人造成2次攻击，每次造成{a}%攻击的伤害",
    character_a = "406",
    character_b = "",
    character_c = "",
    fightForce = 900
    };
getRow(40220,4)->
    #pet_skills_upgradingCfg {
    skill_id = 40220,
    level = 4,
    item_cost = [13000,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 80,
    des = "对前方敌人造成2次攻击，每次造成{a}%攻击的伤害",
    character_a = "454",
    character_b = "",
    character_c = "",
    fightForce = 1500
    };
getRow(40220,5)->
    #pet_skills_upgradingCfg {
    skill_id = 40220,
    level = 5,
    item_cost = [13000,3],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 100,
    des = "对前方敌人造成2次攻击，每次造成{a}%攻击的伤害",
    character_a = "502",
    character_b = "",
    character_c = "",
    fightForce = 2400
    };
getRow(40220,6)->
    #pet_skills_upgradingCfg {
    skill_id = 40220,
    level = 6,
    item_cost = [13000,3],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 120,
    des = "对前方敌人造成2次攻击，每次造成{a}%攻击的伤害",
    character_a = "550",
    character_b = "",
    character_c = "",
    fightForce = 3300
    };
getRow(40220,7)->
    #pet_skills_upgradingCfg {
    skill_id = 40220,
    level = 7,
    item_cost = [13000,4],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 140,
    des = "对前方敌人造成2次攻击，每次造成{a}%攻击的伤害",
    character_a = "598",
    character_b = "",
    character_c = "",
    fightForce = 4500
    };
getRow(40220,8)->
    #pet_skills_upgradingCfg {
    skill_id = 40220,
    level = 8,
    item_cost = [13000,4],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 160,
    des = "对前方敌人造成2次攻击，每次造成{a}%攻击的伤害",
    character_a = "646",
    character_b = "",
    character_c = "",
    fightForce = 5700
    };
getRow(40220,9)->
    #pet_skills_upgradingCfg {
    skill_id = 40220,
    level = 9,
    item_cost = [13000,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 180,
    des = "对前方敌人造成2次攻击，每次造成{a}%攻击的伤害",
    character_a = "694",
    character_b = "",
    character_c = "",
    fightForce = 7200
    };
getRow(40220,10)->
    #pet_skills_upgradingCfg {
    skill_id = 40220,
    level = 10,
    item_cost = [13000,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 200,
    des = "对前方敌人造成2次攻击，每次造成{a}%攻击的伤害",
    character_a = "742",
    character_b = "",
    character_c = "",
    fightForce = 8700
    };
getRow(40220,11)->
    #pet_skills_upgradingCfg {
    skill_id = 40220,
    level = 11,
    item_cost = [13000,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 200,
    des = "对前方敌人造成2次攻击，每次造成{a}%攻击的伤害",
    character_a = "790",
    character_b = "",
    character_c = "",
    fightForce = 10200
    };
getRow(40221,1)->
    #pet_skills_upgradingCfg {
    skill_id = 40221,
    level = 1,
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "周围敌人攻击力降低{b}%",
    character_a = "930",
    character_b = "10",
    character_c = "5",
    fightForce = 0
    };
getRow(40221,2)->
    #pet_skills_upgradingCfg {
    skill_id = 40221,
    level = 2,
    item_cost = [13000,1],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 40,
    des = "周围敌人攻击力降低{b}%",
    character_a = "1066",
    character_b = "10.5",
    character_c = "5",
    fightForce = 300
    };
getRow(40221,3)->
    #pet_skills_upgradingCfg {
    skill_id = 40221,
    level = 3,
    item_cost = [13000,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 60,
    des = "周围敌人攻击力降低{b}%",
    character_a = "1202",
    character_b = "11",
    character_c = "5",
    fightForce = 900
    };
getRow(40221,4)->
    #pet_skills_upgradingCfg {
    skill_id = 40221,
    level = 4,
    item_cost = [13000,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 80,
    des = "周围敌人攻击力降低{b}%",
    character_a = "1338",
    character_b = "11.5",
    character_c = "5",
    fightForce = 1500
    };
getRow(40221,5)->
    #pet_skills_upgradingCfg {
    skill_id = 40221,
    level = 5,
    item_cost = [13000,3],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 100,
    des = "周围敌人攻击力降低{b}%",
    character_a = "1474",
    character_b = "12",
    character_c = "5",
    fightForce = 2400
    };
getRow(40221,6)->
    #pet_skills_upgradingCfg {
    skill_id = 40221,
    level = 6,
    item_cost = [13000,3],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 120,
    des = "周围敌人攻击力降低{b}%",
    character_a = "1610",
    character_b = "12.5",
    character_c = "5",
    fightForce = 3300
    };
getRow(40221,7)->
    #pet_skills_upgradingCfg {
    skill_id = 40221,
    level = 7,
    item_cost = [13000,4],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 140,
    des = "周围敌人攻击力降低{b}%",
    character_a = "1746",
    character_b = "13",
    character_c = "5",
    fightForce = 4500
    };
getRow(40221,8)->
    #pet_skills_upgradingCfg {
    skill_id = 40221,
    level = 8,
    item_cost = [13000,4],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 160,
    des = "周围敌人攻击力降低{b}%",
    character_a = "1882",
    character_b = "13.5",
    character_c = "5",
    fightForce = 5700
    };
getRow(40221,9)->
    #pet_skills_upgradingCfg {
    skill_id = 40221,
    level = 9,
    item_cost = [13000,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 180,
    des = "周围敌人攻击力降低{b}%",
    character_a = "2018",
    character_b = "14",
    character_c = "5",
    fightForce = 7200
    };
getRow(40221,10)->
    #pet_skills_upgradingCfg {
    skill_id = 40221,
    level = 10,
    item_cost = [13000,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 200,
    des = "周围敌人攻击力降低{b}%",
    character_a = "2154",
    character_b = "14.5",
    character_c = "5",
    fightForce = 8700
    };
getRow(40221,11)->
    #pet_skills_upgradingCfg {
    skill_id = 40221,
    level = 11,
    item_cost = [13000,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 200,
    des = "周围敌人攻击力降低{b}%",
    character_a = "2290",
    character_b = "15",
    character_c = "5",
    fightForce = 10200
    };
getRow(40230,1)->
    #pet_skills_upgradingCfg {
    skill_id = 40230,
    level = 1,
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "攻击前方7米单体目标，总共造成{a}%攻击的伤害",
    character_a = "628",
    character_b = "",
    character_c = "",
    fightForce = 0
    };
getRow(40230,2)->
    #pet_skills_upgradingCfg {
    skill_id = 40230,
    level = 2,
    item_cost = [13000,1],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 40,
    des = "攻击前方7米单体目标，总共造成{a}%攻击的伤害",
    character_a = "726",
    character_b = "",
    character_c = "",
    fightForce = 300
    };
getRow(40230,3)->
    #pet_skills_upgradingCfg {
    skill_id = 40230,
    level = 3,
    item_cost = [13000,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 60,
    des = "攻击前方7米单体目标，总共造成{a}%攻击的伤害",
    character_a = "824",
    character_b = "",
    character_c = "",
    fightForce = 900
    };
getRow(40230,4)->
    #pet_skills_upgradingCfg {
    skill_id = 40230,
    level = 4,
    item_cost = [13000,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 80,
    des = "攻击前方7米单体目标，总共造成{a}%攻击的伤害",
    character_a = "922",
    character_b = "",
    character_c = "",
    fightForce = 1500
    };
getRow(40230,5)->
    #pet_skills_upgradingCfg {
    skill_id = 40230,
    level = 5,
    item_cost = [13000,3],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 100,
    des = "攻击前方7米单体目标，总共造成{a}%攻击的伤害",
    character_a = "1020",
    character_b = "",
    character_c = "",
    fightForce = 2400
    };
getRow(40230,6)->
    #pet_skills_upgradingCfg {
    skill_id = 40230,
    level = 6,
    item_cost = [13000,3],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 120,
    des = "攻击前方7米单体目标，总共造成{a}%攻击的伤害",
    character_a = "1118",
    character_b = "",
    character_c = "",
    fightForce = 3300
    };
getRow(40230,7)->
    #pet_skills_upgradingCfg {
    skill_id = 40230,
    level = 7,
    item_cost = [13000,4],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 140,
    des = "攻击前方7米单体目标，总共造成{a}%攻击的伤害",
    character_a = "1216",
    character_b = "",
    character_c = "",
    fightForce = 4500
    };
getRow(40230,8)->
    #pet_skills_upgradingCfg {
    skill_id = 40230,
    level = 8,
    item_cost = [13000,4],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 160,
    des = "攻击前方7米单体目标，总共造成{a}%攻击的伤害",
    character_a = "1314",
    character_b = "",
    character_c = "",
    fightForce = 5700
    };
getRow(40230,9)->
    #pet_skills_upgradingCfg {
    skill_id = 40230,
    level = 9,
    item_cost = [13000,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 180,
    des = "攻击前方7米单体目标，总共造成{a}%攻击的伤害",
    character_a = "1412",
    character_b = "",
    character_c = "",
    fightForce = 7200
    };
getRow(40230,10)->
    #pet_skills_upgradingCfg {
    skill_id = 40230,
    level = 10,
    item_cost = [13000,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 200,
    des = "攻击前方7米单体目标，总共造成{a}%攻击的伤害",
    character_a = "1510",
    character_b = "",
    character_c = "",
    fightForce = 8700
    };
getRow(40230,11)->
    #pet_skills_upgradingCfg {
    skill_id = 40230,
    level = 11,
    item_cost = [13000,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 200,
    des = "攻击前方7米单体目标，总共造成{a}%攻击的伤害",
    character_a = "1608",
    character_b = "",
    character_c = "",
    fightForce = 10200
    };
getRow(40231,1)->
    #pet_skills_upgradingCfg {
    skill_id = 40231,
    level = 1,
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "攻击前方矩形范围内敌方，总共造成{a}%攻击的伤害，对周围敌人降低物攻{b}%，持续时间{c}秒",
    character_a = "942",
    character_b = "5",
    character_c = "5",
    fightForce = 0
    };
getRow(40231,2)->
    #pet_skills_upgradingCfg {
    skill_id = 40231,
    level = 2,
    item_cost = [13000,1],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 40,
    des = "攻击前方矩形范围内敌方，总共造成{a}%攻击的伤害，对周围敌人降低物攻{b}%，持续时间{c}秒",
    character_a = "1079",
    character_b = "5.5",
    character_c = "5",
    fightForce = 300
    };
getRow(40231,3)->
    #pet_skills_upgradingCfg {
    skill_id = 40231,
    level = 3,
    item_cost = [13000,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 60,
    des = "攻击前方矩形范围内敌方，总共造成{a}%攻击的伤害，对周围敌人降低物攻{b}%，持续时间{c}秒",
    character_a = "1216",
    character_b = "6",
    character_c = "5",
    fightForce = 900
    };
getRow(40231,4)->
    #pet_skills_upgradingCfg {
    skill_id = 40231,
    level = 4,
    item_cost = [13000,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 80,
    des = "攻击前方矩形范围内敌方，总共造成{a}%攻击的伤害，对周围敌人降低物攻{b}%，持续时间{c}秒",
    character_a = "1353",
    character_b = "6.5",
    character_c = "5",
    fightForce = 1500
    };
getRow(40231,5)->
    #pet_skills_upgradingCfg {
    skill_id = 40231,
    level = 5,
    item_cost = [13000,3],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 100,
    des = "攻击前方矩形范围内敌方，总共造成{a}%攻击的伤害，对周围敌人降低物攻{b}%，持续时间{c}秒",
    character_a = "1490",
    character_b = "7",
    character_c = "5",
    fightForce = 2400
    };
getRow(40231,6)->
    #pet_skills_upgradingCfg {
    skill_id = 40231,
    level = 6,
    item_cost = [13000,3],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 120,
    des = "攻击前方矩形范围内敌方，总共造成{a}%攻击的伤害，对周围敌人降低物攻{b}%，持续时间{c}秒",
    character_a = "1627",
    character_b = "7.5",
    character_c = "5",
    fightForce = 3300
    };
getRow(40231,7)->
    #pet_skills_upgradingCfg {
    skill_id = 40231,
    level = 7,
    item_cost = [13000,4],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 140,
    des = "攻击前方矩形范围内敌方，总共造成{a}%攻击的伤害，对周围敌人降低物攻{b}%，持续时间{c}秒",
    character_a = "1764",
    character_b = "8",
    character_c = "5",
    fightForce = 4500
    };
getRow(40231,8)->
    #pet_skills_upgradingCfg {
    skill_id = 40231,
    level = 8,
    item_cost = [13000,4],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 160,
    des = "攻击前方矩形范围内敌方，总共造成{a}%攻击的伤害，对周围敌人降低物攻{b}%，持续时间{c}秒",
    character_a = "1901",
    character_b = "8.5",
    character_c = "5",
    fightForce = 5700
    };
getRow(40231,9)->
    #pet_skills_upgradingCfg {
    skill_id = 40231,
    level = 9,
    item_cost = [13000,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 180,
    des = "攻击前方矩形范围内敌方，总共造成{a}%攻击的伤害，对周围敌人降低物攻{b}%，持续时间{c}秒",
    character_a = "2038",
    character_b = "9",
    character_c = "5",
    fightForce = 7200
    };
getRow(40231,10)->
    #pet_skills_upgradingCfg {
    skill_id = 40231,
    level = 10,
    item_cost = [13000,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 200,
    des = "攻击前方矩形范围内敌方，总共造成{a}%攻击的伤害，对周围敌人降低物攻{b}%，持续时间{c}秒",
    character_a = "2175",
    character_b = "9.5",
    character_c = "5",
    fightForce = 8700
    };
getRow(40231,11)->
    #pet_skills_upgradingCfg {
    skill_id = 40231,
    level = 11,
    item_cost = [13000,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 200,
    des = "攻击前方矩形范围内敌方，总共造成{a}%攻击的伤害，对周围敌人降低物攻{b}%，持续时间{c}秒",
    character_a = "2312",
    character_b = "10",
    character_c = "5",
    fightForce = 10200
    };
getRow(40240,1)->
    #pet_skills_upgradingCfg {
    skill_id = 40240,
    level = 1,
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "前方矩形15米范围内，发射一个泡泡，总共造成{a}%攻击的伤害",
    character_a = "640",
    character_b = "",
    character_c = "",
    fightForce = 0
    };
getRow(40240,2)->
    #pet_skills_upgradingCfg {
    skill_id = 40240,
    level = 2,
    item_cost = [13000,1],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 40,
    des = "前方矩形15米范围内，发射一个泡泡，总共造成{a}%攻击的伤害",
    character_a = "740",
    character_b = "",
    character_c = "",
    fightForce = 300
    };
getRow(40240,3)->
    #pet_skills_upgradingCfg {
    skill_id = 40240,
    level = 3,
    item_cost = [13000,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 60,
    des = "前方矩形15米范围内，发射一个泡泡，总共造成{a}%攻击的伤害",
    character_a = "840",
    character_b = "",
    character_c = "",
    fightForce = 900
    };
getRow(40240,4)->
    #pet_skills_upgradingCfg {
    skill_id = 40240,
    level = 4,
    item_cost = [13000,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 80,
    des = "前方矩形15米范围内，发射一个泡泡，总共造成{a}%攻击的伤害",
    character_a = "940",
    character_b = "",
    character_c = "",
    fightForce = 1500
    };
getRow(40240,5)->
    #pet_skills_upgradingCfg {
    skill_id = 40240,
    level = 5,
    item_cost = [13000,3],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 100,
    des = "前方矩形15米范围内，发射一个泡泡，总共造成{a}%攻击的伤害",
    character_a = "1040",
    character_b = "",
    character_c = "",
    fightForce = 2400
    };
getRow(40240,6)->
    #pet_skills_upgradingCfg {
    skill_id = 40240,
    level = 6,
    item_cost = [13000,3],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 120,
    des = "前方矩形15米范围内，发射一个泡泡，总共造成{a}%攻击的伤害",
    character_a = "1140",
    character_b = "",
    character_c = "",
    fightForce = 3300
    };
getRow(40240,7)->
    #pet_skills_upgradingCfg {
    skill_id = 40240,
    level = 7,
    item_cost = [13000,4],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 140,
    des = "前方矩形15米范围内，发射一个泡泡，总共造成{a}%攻击的伤害",
    character_a = "1240",
    character_b = "",
    character_c = "",
    fightForce = 4500
    };
getRow(40240,8)->
    #pet_skills_upgradingCfg {
    skill_id = 40240,
    level = 8,
    item_cost = [13000,4],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 160,
    des = "前方矩形15米范围内，发射一个泡泡，总共造成{a}%攻击的伤害",
    character_a = "1340",
    character_b = "",
    character_c = "",
    fightForce = 5700
    };
getRow(40240,9)->
    #pet_skills_upgradingCfg {
    skill_id = 40240,
    level = 9,
    item_cost = [13000,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 180,
    des = "前方矩形15米范围内，发射一个泡泡，总共造成{a}%攻击的伤害",
    character_a = "1440",
    character_b = "",
    character_c = "",
    fightForce = 7200
    };
getRow(40240,10)->
    #pet_skills_upgradingCfg {
    skill_id = 40240,
    level = 10,
    item_cost = [13000,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 200,
    des = "前方矩形15米范围内，发射一个泡泡，总共造成{a}%攻击的伤害",
    character_a = "1540",
    character_b = "",
    character_c = "",
    fightForce = 8700
    };
getRow(40240,11)->
    #pet_skills_upgradingCfg {
    skill_id = 40240,
    level = 11,
    item_cost = [13000,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 200,
    des = "前方矩形15米范围内，发射一个泡泡，总共造成{a}%攻击的伤害",
    character_a = "1640",
    character_b = "",
    character_c = "",
    fightForce = 10200
    };
getRow(40241,1)->
    #pet_skills_upgradingCfg {
    skill_id = 40241,
    level = 1,
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "攻击前方矩形范围内敌方，造成{a}%攻击的伤害",
    character_a = "960",
    character_b = "",
    character_c = "",
    fightForce = 0
    };
getRow(40241,2)->
    #pet_skills_upgradingCfg {
    skill_id = 40241,
    level = 2,
    item_cost = [13000,1],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 40,
    des = "攻击前方矩形范围内敌方，造成{a}%攻击的伤害",
    character_a = "1100",
    character_b = "",
    character_c = "",
    fightForce = 300
    };
getRow(40241,3)->
    #pet_skills_upgradingCfg {
    skill_id = 40241,
    level = 3,
    item_cost = [13000,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 60,
    des = "攻击前方矩形范围内敌方，造成{a}%攻击的伤害",
    character_a = "1240",
    character_b = "",
    character_c = "",
    fightForce = 900
    };
getRow(40241,4)->
    #pet_skills_upgradingCfg {
    skill_id = 40241,
    level = 4,
    item_cost = [13000,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 80,
    des = "攻击前方矩形范围内敌方，造成{a}%攻击的伤害",
    character_a = "1380",
    character_b = "",
    character_c = "",
    fightForce = 1500
    };
getRow(40241,5)->
    #pet_skills_upgradingCfg {
    skill_id = 40241,
    level = 5,
    item_cost = [13000,3],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 100,
    des = "攻击前方矩形范围内敌方，造成{a}%攻击的伤害",
    character_a = "1520",
    character_b = "",
    character_c = "",
    fightForce = 2400
    };
getRow(40241,6)->
    #pet_skills_upgradingCfg {
    skill_id = 40241,
    level = 6,
    item_cost = [13000,3],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 120,
    des = "攻击前方矩形范围内敌方，造成{a}%攻击的伤害",
    character_a = "1660",
    character_b = "",
    character_c = "",
    fightForce = 3300
    };
getRow(40241,7)->
    #pet_skills_upgradingCfg {
    skill_id = 40241,
    level = 7,
    item_cost = [13000,4],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 140,
    des = "攻击前方矩形范围内敌方，造成{a}%攻击的伤害",
    character_a = "1800",
    character_b = "",
    character_c = "",
    fightForce = 4500
    };
getRow(40241,8)->
    #pet_skills_upgradingCfg {
    skill_id = 40241,
    level = 8,
    item_cost = [13000,4],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 160,
    des = "攻击前方矩形范围内敌方，造成{a}%攻击的伤害",
    character_a = "1940",
    character_b = "",
    character_c = "",
    fightForce = 5700
    };
getRow(40241,9)->
    #pet_skills_upgradingCfg {
    skill_id = 40241,
    level = 9,
    item_cost = [13000,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 180,
    des = "攻击前方矩形范围内敌方，造成{a}%攻击的伤害",
    character_a = "2080",
    character_b = "",
    character_c = "",
    fightForce = 7200
    };
getRow(40241,10)->
    #pet_skills_upgradingCfg {
    skill_id = 40241,
    level = 10,
    item_cost = [13000,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 200,
    des = "攻击前方矩形范围内敌方，造成{a}%攻击的伤害",
    character_a = "2220",
    character_b = "",
    character_c = "",
    fightForce = 8700
    };
getRow(40241,11)->
    #pet_skills_upgradingCfg {
    skill_id = 40241,
    level = 11,
    item_cost = [13000,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 200,
    des = "攻击前方矩形范围内敌方，造成{a}%攻击的伤害",
    character_a = "2360",
    character_b = "",
    character_c = "",
    fightForce = 10200
    };
getRow(40250,1)->
    #pet_skills_upgradingCfg {
    skill_id = 40250,
    level = 1,
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "对前方单个敌人造成2次伤害，每次造成{a}%攻击的伤害",
    character_a = "384",
    character_b = "",
    character_c = "",
    fightForce = 0
    };
getRow(40250,2)->
    #pet_skills_upgradingCfg {
    skill_id = 40250,
    level = 2,
    item_cost = [13000,1],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 40,
    des = "对前方单个敌人造成2次伤害，每次造成{a}%攻击的伤害",
    character_a = "444",
    character_b = "",
    character_c = "",
    fightForce = 300
    };
getRow(40250,3)->
    #pet_skills_upgradingCfg {
    skill_id = 40250,
    level = 3,
    item_cost = [13000,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 60,
    des = "对前方单个敌人造成2次伤害，每次造成{a}%攻击的伤害",
    character_a = "504",
    character_b = "",
    character_c = "",
    fightForce = 900
    };
getRow(40250,4)->
    #pet_skills_upgradingCfg {
    skill_id = 40250,
    level = 4,
    item_cost = [13000,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 80,
    des = "对前方单个敌人造成2次伤害，每次造成{a}%攻击的伤害",
    character_a = "564",
    character_b = "",
    character_c = "",
    fightForce = 1500
    };
getRow(40250,5)->
    #pet_skills_upgradingCfg {
    skill_id = 40250,
    level = 5,
    item_cost = [13000,3],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 100,
    des = "对前方单个敌人造成2次伤害，每次造成{a}%攻击的伤害",
    character_a = "624",
    character_b = "",
    character_c = "",
    fightForce = 2400
    };
getRow(40250,6)->
    #pet_skills_upgradingCfg {
    skill_id = 40250,
    level = 6,
    item_cost = [13000,3],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 120,
    des = "对前方单个敌人造成2次伤害，每次造成{a}%攻击的伤害",
    character_a = "684",
    character_b = "",
    character_c = "",
    fightForce = 3300
    };
getRow(40250,7)->
    #pet_skills_upgradingCfg {
    skill_id = 40250,
    level = 7,
    item_cost = [13000,4],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 140,
    des = "对前方单个敌人造成2次伤害，每次造成{a}%攻击的伤害",
    character_a = "744",
    character_b = "",
    character_c = "",
    fightForce = 4500
    };
getRow(40250,8)->
    #pet_skills_upgradingCfg {
    skill_id = 40250,
    level = 8,
    item_cost = [13000,4],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 160,
    des = "对前方单个敌人造成2次伤害，每次造成{a}%攻击的伤害",
    character_a = "804",
    character_b = "",
    character_c = "",
    fightForce = 5700
    };
getRow(40250,9)->
    #pet_skills_upgradingCfg {
    skill_id = 40250,
    level = 9,
    item_cost = [13000,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 180,
    des = "对前方单个敌人造成2次伤害，每次造成{a}%攻击的伤害",
    character_a = "864",
    character_b = "",
    character_c = "",
    fightForce = 7200
    };
getRow(40250,10)->
    #pet_skills_upgradingCfg {
    skill_id = 40250,
    level = 10,
    item_cost = [13000,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 200,
    des = "对前方单个敌人造成2次伤害，每次造成{a}%攻击的伤害",
    character_a = "924",
    character_b = "",
    character_c = "",
    fightForce = 8700
    };
getRow(40250,11)->
    #pet_skills_upgradingCfg {
    skill_id = 40250,
    level = 11,
    item_cost = [13000,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 200,
    des = "对前方单个敌人造成2次伤害，每次造成{a}%攻击的伤害",
    character_a = "984",
    character_b = "",
    character_c = "",
    fightForce = 10200
    };
getRow(40251,1)->
    #pet_skills_upgradingCfg {
    skill_id = 40251,
    level = 1,
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "以自身为中心攻击10米范围内敌方，总共造成{a}%攻击的伤害",
    character_a = "192",
    character_b = "",
    character_c = "",
    fightForce = 0
    };
getRow(40251,2)->
    #pet_skills_upgradingCfg {
    skill_id = 40251,
    level = 2,
    item_cost = [13000,1],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 40,
    des = "以自身为中心攻击10米范围内敌方，总共造成{a}%攻击的伤害",
    character_a = "220",
    character_b = "",
    character_c = "",
    fightForce = 300
    };
getRow(40251,3)->
    #pet_skills_upgradingCfg {
    skill_id = 40251,
    level = 3,
    item_cost = [13000,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 60,
    des = "以自身为中心攻击10米范围内敌方，总共造成{a}%攻击的伤害",
    character_a = "248",
    character_b = "",
    character_c = "",
    fightForce = 900
    };
getRow(40251,4)->
    #pet_skills_upgradingCfg {
    skill_id = 40251,
    level = 4,
    item_cost = [13000,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 80,
    des = "以自身为中心攻击10米范围内敌方，总共造成{a}%攻击的伤害",
    character_a = "276",
    character_b = "",
    character_c = "",
    fightForce = 1500
    };
getRow(40251,5)->
    #pet_skills_upgradingCfg {
    skill_id = 40251,
    level = 5,
    item_cost = [13000,3],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 100,
    des = "以自身为中心攻击10米范围内敌方，总共造成{a}%攻击的伤害",
    character_a = "304",
    character_b = "",
    character_c = "",
    fightForce = 2400
    };
getRow(40251,6)->
    #pet_skills_upgradingCfg {
    skill_id = 40251,
    level = 6,
    item_cost = [13000,3],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 120,
    des = "以自身为中心攻击10米范围内敌方，总共造成{a}%攻击的伤害",
    character_a = "332",
    character_b = "",
    character_c = "",
    fightForce = 3300
    };
getRow(40251,7)->
    #pet_skills_upgradingCfg {
    skill_id = 40251,
    level = 7,
    item_cost = [13000,4],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 140,
    des = "以自身为中心攻击10米范围内敌方，总共造成{a}%攻击的伤害",
    character_a = "360",
    character_b = "",
    character_c = "",
    fightForce = 4500
    };
getRow(40251,8)->
    #pet_skills_upgradingCfg {
    skill_id = 40251,
    level = 8,
    item_cost = [13000,4],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 160,
    des = "以自身为中心攻击10米范围内敌方，总共造成{a}%攻击的伤害",
    character_a = "388",
    character_b = "",
    character_c = "",
    fightForce = 5700
    };
getRow(40251,9)->
    #pet_skills_upgradingCfg {
    skill_id = 40251,
    level = 9,
    item_cost = [13000,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 180,
    des = "以自身为中心攻击10米范围内敌方，总共造成{a}%攻击的伤害",
    character_a = "416",
    character_b = "",
    character_c = "",
    fightForce = 7200
    };
getRow(40251,10)->
    #pet_skills_upgradingCfg {
    skill_id = 40251,
    level = 10,
    item_cost = [13000,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 200,
    des = "以自身为中心攻击10米范围内敌方，总共造成{a}%攻击的伤害",
    character_a = "444",
    character_b = "",
    character_c = "",
    fightForce = 8700
    };
getRow(40251,11)->
    #pet_skills_upgradingCfg {
    skill_id = 40251,
    level = 11,
    item_cost = [13000,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 200,
    des = "以自身为中心攻击10米范围内敌方，总共造成{a}%攻击的伤害",
    character_a = "472",
    character_b = "",
    character_c = "",
    fightForce = 10200
    };
getRow(40260,1)->
    #pet_skills_upgradingCfg {
    skill_id = 40260,
    level = 1,
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "吃了咖啡豆后，国王先生兴奋地撒欢，攻击前方敌人3次，每次造成{a}%攻击的伤害",
    character_a = "629",
    character_b = "",
    character_c = "",
    fightForce = 0
    };
getRow(40260,2)->
    #pet_skills_upgradingCfg {
    skill_id = 40260,
    level = 2,
    item_cost = [13001,1],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 40,
    des = "吃了咖啡豆后，国王先生兴奋地撒欢，攻击前方敌人3次，每次造成{a}%攻击的伤害",
    character_a = "737",
    character_b = "",
    character_c = "",
    fightForce = 900
    };
getRow(40260,3)->
    #pet_skills_upgradingCfg {
    skill_id = 40260,
    level = 3,
    item_cost = [13001,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 60,
    des = "吃了咖啡豆后，国王先生兴奋地撒欢，攻击前方敌人3次，每次造成{a}%攻击的伤害",
    character_a = "845",
    character_b = "",
    character_c = "",
    fightForce = 2700
    };
getRow(40260,4)->
    #pet_skills_upgradingCfg {
    skill_id = 40260,
    level = 4,
    item_cost = [13001,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 80,
    des = "吃了咖啡豆后，国王先生兴奋地撒欢，攻击前方敌人3次，每次造成{a}%攻击的伤害",
    character_a = "953",
    character_b = "",
    character_c = "",
    fightForce = 4500
    };
getRow(40260,5)->
    #pet_skills_upgradingCfg {
    skill_id = 40260,
    level = 5,
    item_cost = [13001,3],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 100,
    des = "吃了咖啡豆后，国王先生兴奋地撒欢，攻击前方敌人3次，每次造成{a}%攻击的伤害",
    character_a = "1061",
    character_b = "",
    character_c = "",
    fightForce = 7200
    };
getRow(40260,6)->
    #pet_skills_upgradingCfg {
    skill_id = 40260,
    level = 6,
    item_cost = [13001,3],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 120,
    des = "吃了咖啡豆后，国王先生兴奋地撒欢，攻击前方敌人3次，每次造成{a}%攻击的伤害",
    character_a = "1169",
    character_b = "",
    character_c = "",
    fightForce = 9900
    };
getRow(40260,7)->
    #pet_skills_upgradingCfg {
    skill_id = 40260,
    level = 7,
    item_cost = [13001,4],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 140,
    des = "吃了咖啡豆后，国王先生兴奋地撒欢，攻击前方敌人3次，每次造成{a}%攻击的伤害",
    character_a = "1277",
    character_b = "",
    character_c = "",
    fightForce = 13500
    };
getRow(40260,8)->
    #pet_skills_upgradingCfg {
    skill_id = 40260,
    level = 8,
    item_cost = [13001,4],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 160,
    des = "吃了咖啡豆后，国王先生兴奋地撒欢，攻击前方敌人3次，每次造成{a}%攻击的伤害",
    character_a = "1385",
    character_b = "",
    character_c = "",
    fightForce = 17100
    };
getRow(40260,9)->
    #pet_skills_upgradingCfg {
    skill_id = 40260,
    level = 9,
    item_cost = [13001,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 180,
    des = "吃了咖啡豆后，国王先生兴奋地撒欢，攻击前方敌人3次，每次造成{a}%攻击的伤害",
    character_a = "1493",
    character_b = "",
    character_c = "",
    fightForce = 21600
    };
getRow(40260,10)->
    #pet_skills_upgradingCfg {
    skill_id = 40260,
    level = 10,
    item_cost = [13001,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 200,
    des = "吃了咖啡豆后，国王先生兴奋地撒欢，攻击前方敌人3次，每次造成{a}%攻击的伤害",
    character_a = "1601",
    character_b = "",
    character_c = "",
    fightForce = 26100
    };
getRow(40260,11)->
    #pet_skills_upgradingCfg {
    skill_id = 40260,
    level = 11,
    item_cost = [13001,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 200,
    des = "吃了咖啡豆后，国王先生兴奋地撒欢，攻击前方敌人3次，每次造成{a}%攻击的伤害",
    character_a = "1709",
    character_b = "",
    character_c = "",
    fightForce = 30600
    };
getRow(40261,1)->
    #pet_skills_upgradingCfg {
    skill_id = 40261,
    level = 1,
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "对周围怪物造成一次{a}%攻击的伤害，主目标强制攻击自己，持续5秒",
    character_a = "632",
    character_b = "",
    character_c = "",
    fightForce = 0
    };
getRow(40261,2)->
    #pet_skills_upgradingCfg {
    skill_id = 40261,
    level = 2,
    item_cost = [13001,1],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 40,
    des = "对周围怪物造成一次{a}%攻击的伤害，主目标强制攻击自己，持续5秒",
    character_a = "744",
    character_b = "",
    character_c = "",
    fightForce = 900
    };
getRow(40261,3)->
    #pet_skills_upgradingCfg {
    skill_id = 40261,
    level = 3,
    item_cost = [13001,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 60,
    des = "对周围怪物造成一次{a}%攻击的伤害，主目标强制攻击自己，持续5秒",
    character_a = "856",
    character_b = "",
    character_c = "",
    fightForce = 2700
    };
getRow(40261,4)->
    #pet_skills_upgradingCfg {
    skill_id = 40261,
    level = 4,
    item_cost = [13001,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 80,
    des = "对周围怪物造成一次{a}%攻击的伤害，主目标强制攻击自己，持续5秒",
    character_a = "968",
    character_b = "",
    character_c = "",
    fightForce = 4500
    };
getRow(40261,5)->
    #pet_skills_upgradingCfg {
    skill_id = 40261,
    level = 5,
    item_cost = [13001,3],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 100,
    des = "对周围怪物造成一次{a}%攻击的伤害，主目标强制攻击自己，持续5秒",
    character_a = "1080",
    character_b = "",
    character_c = "",
    fightForce = 7200
    };
getRow(40261,6)->
    #pet_skills_upgradingCfg {
    skill_id = 40261,
    level = 6,
    item_cost = [13001,3],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 120,
    des = "对周围怪物造成一次{a}%攻击的伤害，主目标强制攻击自己，持续5秒",
    character_a = "1192",
    character_b = "",
    character_c = "",
    fightForce = 9900
    };
getRow(40261,7)->
    #pet_skills_upgradingCfg {
    skill_id = 40261,
    level = 7,
    item_cost = [13001,4],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 140,
    des = "对周围怪物造成一次{a}%攻击的伤害，主目标强制攻击自己，持续5秒",
    character_a = "1304",
    character_b = "",
    character_c = "",
    fightForce = 13500
    };
getRow(40261,8)->
    #pet_skills_upgradingCfg {
    skill_id = 40261,
    level = 8,
    item_cost = [13001,4],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 160,
    des = "对周围怪物造成一次{a}%攻击的伤害，主目标强制攻击自己，持续5秒",
    character_a = "1416",
    character_b = "",
    character_c = "",
    fightForce = 17100
    };
getRow(40261,9)->
    #pet_skills_upgradingCfg {
    skill_id = 40261,
    level = 9,
    item_cost = [13001,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 180,
    des = "对周围怪物造成一次{a}%攻击的伤害，主目标强制攻击自己，持续5秒",
    character_a = "1528",
    character_b = "",
    character_c = "",
    fightForce = 21600
    };
getRow(40261,10)->
    #pet_skills_upgradingCfg {
    skill_id = 40261,
    level = 10,
    item_cost = [13001,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 200,
    des = "对周围怪物造成一次{a}%攻击的伤害，主目标强制攻击自己，持续5秒",
    character_a = "1640",
    character_b = "",
    character_c = "",
    fightForce = 26100
    };
getRow(40261,11)->
    #pet_skills_upgradingCfg {
    skill_id = 40261,
    level = 11,
    item_cost = [13001,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 200,
    des = "对周围怪物造成一次{a}%攻击的伤害，主目标强制攻击自己，持续5秒",
    character_a = "1752",
    character_b = "",
    character_c = "",
    fightForce = 30600
    };
getRow(40262,1)->
    #pet_skills_upgradingCfg {
    skill_id = 40262,
    level = 1,
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "自身物理防御力提升{b}%，持续{c}秒",
    character_a = "902",
    character_b = "40",
    character_c = "5",
    fightForce = 0
    };
getRow(40262,2)->
    #pet_skills_upgradingCfg {
    skill_id = 40262,
    level = 2,
    item_cost = [13001,1],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 40,
    des = "自身物理防御力提升{b}%，持续{c}秒",
    character_a = "1062",
    character_b = "44",
    character_c = "5",
    fightForce = 900
    };
getRow(40262,3)->
    #pet_skills_upgradingCfg {
    skill_id = 40262,
    level = 3,
    item_cost = [13001,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 60,
    des = "自身物理防御力提升{b}%，持续{c}秒",
    character_a = "1222",
    character_b = "48",
    character_c = "5",
    fightForce = 2700
    };
getRow(40262,4)->
    #pet_skills_upgradingCfg {
    skill_id = 40262,
    level = 4,
    item_cost = [13001,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 80,
    des = "自身物理防御力提升{b}%，持续{c}秒",
    character_a = "1382",
    character_b = "52",
    character_c = "5",
    fightForce = 4500
    };
getRow(40262,5)->
    #pet_skills_upgradingCfg {
    skill_id = 40262,
    level = 5,
    item_cost = [13001,3],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 100,
    des = "自身物理防御力提升{b}%，持续{c}秒",
    character_a = "1542",
    character_b = "56",
    character_c = "5",
    fightForce = 7200
    };
getRow(40262,6)->
    #pet_skills_upgradingCfg {
    skill_id = 40262,
    level = 6,
    item_cost = [13001,3],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 120,
    des = "自身物理防御力提升{b}%，持续{c}秒",
    character_a = "1702",
    character_b = "60",
    character_c = "5",
    fightForce = 9900
    };
getRow(40262,7)->
    #pet_skills_upgradingCfg {
    skill_id = 40262,
    level = 7,
    item_cost = [13001,4],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 140,
    des = "自身物理防御力提升{b}%，持续{c}秒",
    character_a = "1862",
    character_b = "64",
    character_c = "5",
    fightForce = 13500
    };
getRow(40262,8)->
    #pet_skills_upgradingCfg {
    skill_id = 40262,
    level = 8,
    item_cost = [13001,4],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 160,
    des = "自身物理防御力提升{b}%，持续{c}秒",
    character_a = "2022",
    character_b = "68",
    character_c = "5",
    fightForce = 17100
    };
getRow(40262,9)->
    #pet_skills_upgradingCfg {
    skill_id = 40262,
    level = 9,
    item_cost = [13001,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 180,
    des = "自身物理防御力提升{b}%，持续{c}秒",
    character_a = "2182",
    character_b = "72",
    character_c = "5",
    fightForce = 21600
    };
getRow(40262,10)->
    #pet_skills_upgradingCfg {
    skill_id = 40262,
    level = 10,
    item_cost = [13001,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 200,
    des = "自身物理防御力提升{b}%，持续{c}秒",
    character_a = "2342",
    character_b = "76",
    character_c = "5",
    fightForce = 26100
    };
getRow(40262,11)->
    #pet_skills_upgradingCfg {
    skill_id = 40262,
    level = 11,
    item_cost = [13001,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 200,
    des = "自身物理防御力提升{b}%，持续{c}秒",
    character_a = "2502",
    character_b = "80",
    character_c = "5",
    fightForce = 30600
    };
getRow(40270,1)->
    #pet_skills_upgradingCfg {
    skill_id = 40270,
    level = 1,
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "对前方单体造成2次打击，每次造成{a}%攻击的伤害",
    character_a = "320",
    character_b = "",
    character_c = "",
    fightForce = 0
    };
getRow(40270,2)->
    #pet_skills_upgradingCfg {
    skill_id = 40270,
    level = 2,
    item_cost = [13001,1],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 40,
    des = "对前方单体造成2次打击，每次造成{a}%攻击的伤害",
    character_a = "375",
    character_b = "",
    character_c = "",
    fightForce = 900
    };
getRow(40270,3)->
    #pet_skills_upgradingCfg {
    skill_id = 40270,
    level = 3,
    item_cost = [13001,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 60,
    des = "对前方单体造成2次打击，每次造成{a}%攻击的伤害",
    character_a = "430",
    character_b = "",
    character_c = "",
    fightForce = 2700
    };
getRow(40270,4)->
    #pet_skills_upgradingCfg {
    skill_id = 40270,
    level = 4,
    item_cost = [13001,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 80,
    des = "对前方单体造成2次打击，每次造成{a}%攻击的伤害",
    character_a = "485",
    character_b = "",
    character_c = "",
    fightForce = 4500
    };
getRow(40270,5)->
    #pet_skills_upgradingCfg {
    skill_id = 40270,
    level = 5,
    item_cost = [13001,3],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 100,
    des = "对前方单体造成2次打击，每次造成{a}%攻击的伤害",
    character_a = "540",
    character_b = "",
    character_c = "",
    fightForce = 7200
    };
getRow(40270,6)->
    #pet_skills_upgradingCfg {
    skill_id = 40270,
    level = 6,
    item_cost = [13001,3],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 120,
    des = "对前方单体造成2次打击，每次造成{a}%攻击的伤害",
    character_a = "595",
    character_b = "",
    character_c = "",
    fightForce = 9900
    };
getRow(40270,7)->
    #pet_skills_upgradingCfg {
    skill_id = 40270,
    level = 7,
    item_cost = [13001,4],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 140,
    des = "对前方单体造成2次打击，每次造成{a}%攻击的伤害",
    character_a = "650",
    character_b = "",
    character_c = "",
    fightForce = 13500
    };
getRow(40270,8)->
    #pet_skills_upgradingCfg {
    skill_id = 40270,
    level = 8,
    item_cost = [13001,4],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 160,
    des = "对前方单体造成2次打击，每次造成{a}%攻击的伤害",
    character_a = "705",
    character_b = "",
    character_c = "",
    fightForce = 17100
    };
getRow(40270,9)->
    #pet_skills_upgradingCfg {
    skill_id = 40270,
    level = 9,
    item_cost = [13001,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 180,
    des = "对前方单体造成2次打击，每次造成{a}%攻击的伤害",
    character_a = "760",
    character_b = "",
    character_c = "",
    fightForce = 21600
    };
getRow(40270,10)->
    #pet_skills_upgradingCfg {
    skill_id = 40270,
    level = 10,
    item_cost = [13001,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 200,
    des = "对前方单体造成2次打击，每次造成{a}%攻击的伤害",
    character_a = "815",
    character_b = "",
    character_c = "",
    fightForce = 26100
    };
getRow(40270,11)->
    #pet_skills_upgradingCfg {
    skill_id = 40270,
    level = 11,
    item_cost = [13001,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 200,
    des = "对前方单体造成2次打击，每次造成{a}%攻击的伤害",
    character_a = "870",
    character_b = "",
    character_c = "",
    fightForce = 30600
    };
getRow(40271,1)->
    #pet_skills_upgradingCfg {
    skill_id = 40271,
    level = 1,
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "为主人每秒恢复{a}%攻击的生命值，持续{c}秒",
    character_a = "107",
    character_b = "",
    character_c = "3",
    fightForce = 0
    };
getRow(40271,2)->
    #pet_skills_upgradingCfg {
    skill_id = 40271,
    level = 2,
    item_cost = [13001,1],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 40,
    des = "为主人每秒恢复{a}%攻击的生命值，持续{c}秒",
    character_a = "126",
    character_b = "",
    character_c = "3",
    fightForce = 900
    };
getRow(40271,3)->
    #pet_skills_upgradingCfg {
    skill_id = 40271,
    level = 3,
    item_cost = [13001,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 60,
    des = "为主人每秒恢复{a}%攻击的生命值，持续{c}秒",
    character_a = "145",
    character_b = "",
    character_c = "3",
    fightForce = 2700
    };
getRow(40271,4)->
    #pet_skills_upgradingCfg {
    skill_id = 40271,
    level = 4,
    item_cost = [13001,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 80,
    des = "为主人每秒恢复{a}%攻击的生命值，持续{c}秒",
    character_a = "164",
    character_b = "",
    character_c = "3",
    fightForce = 4500
    };
getRow(40271,5)->
    #pet_skills_upgradingCfg {
    skill_id = 40271,
    level = 5,
    item_cost = [13001,3],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 100,
    des = "为主人每秒恢复{a}%攻击的生命值，持续{c}秒",
    character_a = "183",
    character_b = "",
    character_c = "3",
    fightForce = 7200
    };
getRow(40271,6)->
    #pet_skills_upgradingCfg {
    skill_id = 40271,
    level = 6,
    item_cost = [13001,3],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 120,
    des = "为主人每秒恢复{a}%攻击的生命值，持续{c}秒",
    character_a = "202",
    character_b = "",
    character_c = "3",
    fightForce = 9900
    };
getRow(40271,7)->
    #pet_skills_upgradingCfg {
    skill_id = 40271,
    level = 7,
    item_cost = [13001,4],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 140,
    des = "为主人每秒恢复{a}%攻击的生命值，持续{c}秒",
    character_a = "221",
    character_b = "",
    character_c = "3",
    fightForce = 13500
    };
getRow(40271,8)->
    #pet_skills_upgradingCfg {
    skill_id = 40271,
    level = 8,
    item_cost = [13001,4],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 160,
    des = "为主人每秒恢复{a}%攻击的生命值，持续{c}秒",
    character_a = "240",
    character_b = "",
    character_c = "3",
    fightForce = 17100
    };
getRow(40271,9)->
    #pet_skills_upgradingCfg {
    skill_id = 40271,
    level = 9,
    item_cost = [13001,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 180,
    des = "为主人每秒恢复{a}%攻击的生命值，持续{c}秒",
    character_a = "259",
    character_b = "",
    character_c = "3",
    fightForce = 21600
    };
getRow(40271,10)->
    #pet_skills_upgradingCfg {
    skill_id = 40271,
    level = 10,
    item_cost = [13001,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 200,
    des = "为主人每秒恢复{a}%攻击的生命值，持续{c}秒",
    character_a = "278",
    character_b = "",
    character_c = "3",
    fightForce = 26100
    };
getRow(40271,11)->
    #pet_skills_upgradingCfg {
    skill_id = 40271,
    level = 11,
    item_cost = [13001,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 200,
    des = "为主人每秒恢复{a}%攻击的生命值，持续{c}秒",
    character_a = "297",
    character_b = "",
    character_c = "3",
    fightForce = 30600
    };
getRow(40272,1)->
    #pet_skills_upgradingCfg {
    skill_id = 40272,
    level = 1,
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "对周围敌人造成4次{a}%攻击的伤害",
    character_a = "168",
    character_b = "",
    character_c = "",
    fightForce = 0
    };
getRow(40272,2)->
    #pet_skills_upgradingCfg {
    skill_id = 40272,
    level = 2,
    item_cost = [13001,1],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 40,
    des = "对周围敌人造成4次{a}%攻击的伤害",
    character_a = "198",
    character_b = "",
    character_c = "",
    fightForce = 900
    };
getRow(40272,3)->
    #pet_skills_upgradingCfg {
    skill_id = 40272,
    level = 3,
    item_cost = [13001,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 60,
    des = "对周围敌人造成4次{a}%攻击的伤害",
    character_a = "228",
    character_b = "",
    character_c = "",
    fightForce = 2700
    };
getRow(40272,4)->
    #pet_skills_upgradingCfg {
    skill_id = 40272,
    level = 4,
    item_cost = [13001,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 80,
    des = "对周围敌人造成4次{a}%攻击的伤害",
    character_a = "258",
    character_b = "",
    character_c = "",
    fightForce = 4500
    };
getRow(40272,5)->
    #pet_skills_upgradingCfg {
    skill_id = 40272,
    level = 5,
    item_cost = [13001,3],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 100,
    des = "对周围敌人造成4次{a}%攻击的伤害",
    character_a = "288",
    character_b = "",
    character_c = "",
    fightForce = 7200
    };
getRow(40272,6)->
    #pet_skills_upgradingCfg {
    skill_id = 40272,
    level = 6,
    item_cost = [13001,3],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 120,
    des = "对周围敌人造成4次{a}%攻击的伤害",
    character_a = "318",
    character_b = "",
    character_c = "",
    fightForce = 9900
    };
getRow(40272,7)->
    #pet_skills_upgradingCfg {
    skill_id = 40272,
    level = 7,
    item_cost = [13001,4],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 140,
    des = "对周围敌人造成4次{a}%攻击的伤害",
    character_a = "348",
    character_b = "",
    character_c = "",
    fightForce = 13500
    };
getRow(40272,8)->
    #pet_skills_upgradingCfg {
    skill_id = 40272,
    level = 8,
    item_cost = [13001,4],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 160,
    des = "对周围敌人造成4次{a}%攻击的伤害",
    character_a = "378",
    character_b = "",
    character_c = "",
    fightForce = 17100
    };
getRow(40272,9)->
    #pet_skills_upgradingCfg {
    skill_id = 40272,
    level = 9,
    item_cost = [13001,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 180,
    des = "对周围敌人造成4次{a}%攻击的伤害",
    character_a = "408",
    character_b = "",
    character_c = "",
    fightForce = 21600
    };
getRow(40272,10)->
    #pet_skills_upgradingCfg {
    skill_id = 40272,
    level = 10,
    item_cost = [13001,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 200,
    des = "对周围敌人造成4次{a}%攻击的伤害",
    character_a = "438",
    character_b = "",
    character_c = "",
    fightForce = 26100
    };
getRow(40272,11)->
    #pet_skills_upgradingCfg {
    skill_id = 40272,
    level = 11,
    item_cost = [13001,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 200,
    des = "对周围敌人造成4次{a}%攻击的伤害",
    character_a = "468",
    character_b = "",
    character_c = "",
    fightForce = 30600
    };
getRow(40280,1)->
    #pet_skills_upgradingCfg {
    skill_id = 40280,
    level = 1,
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "攻击前方扇形目标，总共造成{a}%攻击的伤害",
    character_a = "640",
    character_b = "",
    character_c = "",
    fightForce = 0
    };
getRow(40280,2)->
    #pet_skills_upgradingCfg {
    skill_id = 40280,
    level = 2,
    item_cost = [13001,1],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 40,
    des = "攻击前方扇形目标，总共造成{a}%攻击的伤害",
    character_a = "750",
    character_b = "",
    character_c = "",
    fightForce = 900
    };
getRow(40280,3)->
    #pet_skills_upgradingCfg {
    skill_id = 40280,
    level = 3,
    item_cost = [13001,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 60,
    des = "攻击前方扇形目标，总共造成{a}%攻击的伤害",
    character_a = "860",
    character_b = "",
    character_c = "",
    fightForce = 2700
    };
getRow(40280,4)->
    #pet_skills_upgradingCfg {
    skill_id = 40280,
    level = 4,
    item_cost = [13001,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 80,
    des = "攻击前方扇形目标，总共造成{a}%攻击的伤害",
    character_a = "970",
    character_b = "",
    character_c = "",
    fightForce = 4500
    };
getRow(40280,5)->
    #pet_skills_upgradingCfg {
    skill_id = 40280,
    level = 5,
    item_cost = [13001,3],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 100,
    des = "攻击前方扇形目标，总共造成{a}%攻击的伤害",
    character_a = "1080",
    character_b = "",
    character_c = "",
    fightForce = 7200
    };
getRow(40280,6)->
    #pet_skills_upgradingCfg {
    skill_id = 40280,
    level = 6,
    item_cost = [13001,3],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 120,
    des = "攻击前方扇形目标，总共造成{a}%攻击的伤害",
    character_a = "1190",
    character_b = "",
    character_c = "",
    fightForce = 9900
    };
getRow(40280,7)->
    #pet_skills_upgradingCfg {
    skill_id = 40280,
    level = 7,
    item_cost = [13001,4],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 140,
    des = "攻击前方扇形目标，总共造成{a}%攻击的伤害",
    character_a = "1300",
    character_b = "",
    character_c = "",
    fightForce = 13500
    };
getRow(40280,8)->
    #pet_skills_upgradingCfg {
    skill_id = 40280,
    level = 8,
    item_cost = [13001,4],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 160,
    des = "攻击前方扇形目标，总共造成{a}%攻击的伤害",
    character_a = "1410",
    character_b = "",
    character_c = "",
    fightForce = 17100
    };
getRow(40280,9)->
    #pet_skills_upgradingCfg {
    skill_id = 40280,
    level = 9,
    item_cost = [13001,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 180,
    des = "攻击前方扇形目标，总共造成{a}%攻击的伤害",
    character_a = "1520",
    character_b = "",
    character_c = "",
    fightForce = 21600
    };
getRow(40280,10)->
    #pet_skills_upgradingCfg {
    skill_id = 40280,
    level = 10,
    item_cost = [13001,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 200,
    des = "攻击前方扇形目标，总共造成{a}%攻击的伤害",
    character_a = "1630",
    character_b = "",
    character_c = "",
    fightForce = 26100
    };
getRow(40280,11)->
    #pet_skills_upgradingCfg {
    skill_id = 40280,
    level = 11,
    item_cost = [13001,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 200,
    des = "攻击前方扇形目标，总共造成{a}%攻击的伤害",
    character_a = "1740",
    character_b = "",
    character_c = "",
    fightForce = 30600
    };
getRow(40281,1)->
    #pet_skills_upgradingCfg {
    skill_id = 40281,
    level = 1,
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "对四周散发爱心泡泡，总共造成{a}%攻击的伤害",
    character_a = "672",
    character_b = "",
    character_c = "",
    fightForce = 0
    };
getRow(40281,2)->
    #pet_skills_upgradingCfg {
    skill_id = 40281,
    level = 2,
    item_cost = [13001,1],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 40,
    des = "对四周散发爱心泡泡，总共造成{a}%攻击的伤害",
    character_a = "791",
    character_b = "",
    character_c = "",
    fightForce = 900
    };
getRow(40281,3)->
    #pet_skills_upgradingCfg {
    skill_id = 40281,
    level = 3,
    item_cost = [13001,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 60,
    des = "对四周散发爱心泡泡，总共造成{a}%攻击的伤害",
    character_a = "910",
    character_b = "",
    character_c = "",
    fightForce = 2700
    };
getRow(40281,4)->
    #pet_skills_upgradingCfg {
    skill_id = 40281,
    level = 4,
    item_cost = [13001,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 80,
    des = "对四周散发爱心泡泡，总共造成{a}%攻击的伤害",
    character_a = "1029",
    character_b = "",
    character_c = "",
    fightForce = 4500
    };
getRow(40281,5)->
    #pet_skills_upgradingCfg {
    skill_id = 40281,
    level = 5,
    item_cost = [13001,3],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 100,
    des = "对四周散发爱心泡泡，总共造成{a}%攻击的伤害",
    character_a = "1148",
    character_b = "",
    character_c = "",
    fightForce = 7200
    };
getRow(40281,6)->
    #pet_skills_upgradingCfg {
    skill_id = 40281,
    level = 6,
    item_cost = [13001,3],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 120,
    des = "对四周散发爱心泡泡，总共造成{a}%攻击的伤害",
    character_a = "1267",
    character_b = "",
    character_c = "",
    fightForce = 9900
    };
getRow(40281,7)->
    #pet_skills_upgradingCfg {
    skill_id = 40281,
    level = 7,
    item_cost = [13001,4],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 140,
    des = "对四周散发爱心泡泡，总共造成{a}%攻击的伤害",
    character_a = "1386",
    character_b = "",
    character_c = "",
    fightForce = 13500
    };
getRow(40281,8)->
    #pet_skills_upgradingCfg {
    skill_id = 40281,
    level = 8,
    item_cost = [13001,4],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 160,
    des = "对四周散发爱心泡泡，总共造成{a}%攻击的伤害",
    character_a = "1505",
    character_b = "",
    character_c = "",
    fightForce = 17100
    };
getRow(40281,9)->
    #pet_skills_upgradingCfg {
    skill_id = 40281,
    level = 9,
    item_cost = [13001,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 180,
    des = "对四周散发爱心泡泡，总共造成{a}%攻击的伤害",
    character_a = "1624",
    character_b = "",
    character_c = "",
    fightForce = 21600
    };
getRow(40281,10)->
    #pet_skills_upgradingCfg {
    skill_id = 40281,
    level = 10,
    item_cost = [13001,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 200,
    des = "对四周散发爱心泡泡，总共造成{a}%攻击的伤害",
    character_a = "1743",
    character_b = "",
    character_c = "",
    fightForce = 26100
    };
getRow(40281,11)->
    #pet_skills_upgradingCfg {
    skill_id = 40281,
    level = 11,
    item_cost = [13001,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 200,
    des = "对四周散发爱心泡泡，总共造成{a}%攻击的伤害",
    character_a = "1862",
    character_b = "",
    character_c = "",
    fightForce = 30600
    };
getRow(40282,1)->
    #pet_skills_upgradingCfg {
    skill_id = 40282,
    level = 1,
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "对四周散发彩虹波浪，造成{a}%攻击的伤害，且强制拉20米范围内的怪到自身附近",
    character_a = "672",
    character_b = "",
    character_c = "",
    fightForce = 0
    };
getRow(40282,2)->
    #pet_skills_upgradingCfg {
    skill_id = 40282,
    level = 2,
    item_cost = [13001,1],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 40,
    des = "对四周散发彩虹波浪，造成{a}%攻击的伤害，且强制拉20米范围内的怪到自身附近",
    character_a = "791",
    character_b = "",
    character_c = "",
    fightForce = 900
    };
getRow(40282,3)->
    #pet_skills_upgradingCfg {
    skill_id = 40282,
    level = 3,
    item_cost = [13001,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 60,
    des = "对四周散发彩虹波浪，造成{a}%攻击的伤害，且强制拉20米范围内的怪到自身附近",
    character_a = "910",
    character_b = "",
    character_c = "",
    fightForce = 2700
    };
getRow(40282,4)->
    #pet_skills_upgradingCfg {
    skill_id = 40282,
    level = 4,
    item_cost = [13001,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 80,
    des = "对四周散发彩虹波浪，造成{a}%攻击的伤害，且强制拉20米范围内的怪到自身附近",
    character_a = "1029",
    character_b = "",
    character_c = "",
    fightForce = 4500
    };
getRow(40282,5)->
    #pet_skills_upgradingCfg {
    skill_id = 40282,
    level = 5,
    item_cost = [13001,3],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 100,
    des = "对四周散发彩虹波浪，造成{a}%攻击的伤害，且强制拉20米范围内的怪到自身附近",
    character_a = "1148",
    character_b = "",
    character_c = "",
    fightForce = 7200
    };
getRow(40282,6)->
    #pet_skills_upgradingCfg {
    skill_id = 40282,
    level = 6,
    item_cost = [13001,3],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 120,
    des = "对四周散发彩虹波浪，造成{a}%攻击的伤害，且强制拉20米范围内的怪到自身附近",
    character_a = "1267",
    character_b = "",
    character_c = "",
    fightForce = 9900
    };
getRow(40282,7)->
    #pet_skills_upgradingCfg {
    skill_id = 40282,
    level = 7,
    item_cost = [13001,4],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 140,
    des = "对四周散发彩虹波浪，造成{a}%攻击的伤害，且强制拉20米范围内的怪到自身附近",
    character_a = "1386",
    character_b = "",
    character_c = "",
    fightForce = 13500
    };
getRow(40282,8)->
    #pet_skills_upgradingCfg {
    skill_id = 40282,
    level = 8,
    item_cost = [13001,4],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 160,
    des = "对四周散发彩虹波浪，造成{a}%攻击的伤害，且强制拉20米范围内的怪到自身附近",
    character_a = "1505",
    character_b = "",
    character_c = "",
    fightForce = 17100
    };
getRow(40282,9)->
    #pet_skills_upgradingCfg {
    skill_id = 40282,
    level = 9,
    item_cost = [13001,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 180,
    des = "对四周散发彩虹波浪，造成{a}%攻击的伤害，且强制拉20米范围内的怪到自身附近",
    character_a = "1624",
    character_b = "",
    character_c = "",
    fightForce = 21600
    };
getRow(40282,10)->
    #pet_skills_upgradingCfg {
    skill_id = 40282,
    level = 10,
    item_cost = [13001,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 200,
    des = "对四周散发彩虹波浪，造成{a}%攻击的伤害，且强制拉20米范围内的怪到自身附近",
    character_a = "1743",
    character_b = "",
    character_c = "",
    fightForce = 26100
    };
getRow(40282,11)->
    #pet_skills_upgradingCfg {
    skill_id = 40282,
    level = 11,
    item_cost = [13001,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 200,
    des = "对四周散发彩虹波浪，造成{a}%攻击的伤害，且强制拉20米范围内的怪到自身附近",
    character_a = "1862",
    character_b = "",
    character_c = "",
    fightForce = 30600
    };
getRow(40290,1)->
    #pet_skills_upgradingCfg {
    skill_id = 40290,
    level = 1,
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "攻击前方单体目标，总共造成{a}%攻击的伤害，并击飞",
    character_a = "618",
    character_b = "",
    character_c = "",
    fightForce = 0
    };
getRow(40290,2)->
    #pet_skills_upgradingCfg {
    skill_id = 40290,
    level = 2,
    item_cost = [13001,1],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 40,
    des = "攻击前方单体目标，总共造成{a}%攻击的伤害，并击飞",
    character_a = "724",
    character_b = "",
    character_c = "",
    fightForce = 900
    };
getRow(40290,3)->
    #pet_skills_upgradingCfg {
    skill_id = 40290,
    level = 3,
    item_cost = [13001,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 60,
    des = "攻击前方单体目标，总共造成{a}%攻击的伤害，并击飞",
    character_a = "830",
    character_b = "",
    character_c = "",
    fightForce = 2700
    };
getRow(40290,4)->
    #pet_skills_upgradingCfg {
    skill_id = 40290,
    level = 4,
    item_cost = [13001,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 80,
    des = "攻击前方单体目标，总共造成{a}%攻击的伤害，并击飞",
    character_a = "936",
    character_b = "",
    character_c = "",
    fightForce = 4500
    };
getRow(40290,5)->
    #pet_skills_upgradingCfg {
    skill_id = 40290,
    level = 5,
    item_cost = [13001,3],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 100,
    des = "攻击前方单体目标，总共造成{a}%攻击的伤害，并击飞",
    character_a = "1042",
    character_b = "",
    character_c = "",
    fightForce = 7200
    };
getRow(40290,6)->
    #pet_skills_upgradingCfg {
    skill_id = 40290,
    level = 6,
    item_cost = [13001,3],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 120,
    des = "攻击前方单体目标，总共造成{a}%攻击的伤害，并击飞",
    character_a = "1148",
    character_b = "",
    character_c = "",
    fightForce = 9900
    };
getRow(40290,7)->
    #pet_skills_upgradingCfg {
    skill_id = 40290,
    level = 7,
    item_cost = [13001,4],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 140,
    des = "攻击前方单体目标，总共造成{a}%攻击的伤害，并击飞",
    character_a = "1254",
    character_b = "",
    character_c = "",
    fightForce = 13500
    };
getRow(40290,8)->
    #pet_skills_upgradingCfg {
    skill_id = 40290,
    level = 8,
    item_cost = [13001,4],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 160,
    des = "攻击前方单体目标，总共造成{a}%攻击的伤害，并击飞",
    character_a = "1360",
    character_b = "",
    character_c = "",
    fightForce = 17100
    };
getRow(40290,9)->
    #pet_skills_upgradingCfg {
    skill_id = 40290,
    level = 9,
    item_cost = [13001,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 180,
    des = "攻击前方单体目标，总共造成{a}%攻击的伤害，并击飞",
    character_a = "1466",
    character_b = "",
    character_c = "",
    fightForce = 21600
    };
getRow(40290,10)->
    #pet_skills_upgradingCfg {
    skill_id = 40290,
    level = 10,
    item_cost = [13001,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 200,
    des = "攻击前方单体目标，总共造成{a}%攻击的伤害，并击飞",
    character_a = "1572",
    character_b = "",
    character_c = "",
    fightForce = 26100
    };
getRow(40290,11)->
    #pet_skills_upgradingCfg {
    skill_id = 40290,
    level = 11,
    item_cost = [13001,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 200,
    des = "攻击前方单体目标，总共造成{a}%攻击的伤害，并击飞",
    character_a = "1678",
    character_b = "",
    character_c = "",
    fightForce = 30600
    };
getRow(40291,1)->
    #pet_skills_upgradingCfg {
    skill_id = 40291,
    level = 1,
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "攻击前方单体目标，总共造成{a}%攻击的伤害，并降低目标{b}%的物理攻击，持续{c}秒",
    character_a = "649",
    character_b = "5",
    character_c = "5",
    fightForce = 0
    };
getRow(40291,2)->
    #pet_skills_upgradingCfg {
    skill_id = 40291,
    level = 2,
    item_cost = [13001,1],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 40,
    des = "攻击前方单体目标，总共造成{a}%攻击的伤害，并降低目标{b}%的物理攻击，持续{c}秒",
    character_a = "764",
    character_b = "5.5",
    character_c = "5",
    fightForce = 900
    };
getRow(40291,3)->
    #pet_skills_upgradingCfg {
    skill_id = 40291,
    level = 3,
    item_cost = [13001,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 60,
    des = "攻击前方单体目标，总共造成{a}%攻击的伤害，并降低目标{b}%的物理攻击，持续{c}秒",
    character_a = "879",
    character_b = "6",
    character_c = "5",
    fightForce = 2700
    };
getRow(40291,4)->
    #pet_skills_upgradingCfg {
    skill_id = 40291,
    level = 4,
    item_cost = [13001,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 80,
    des = "攻击前方单体目标，总共造成{a}%攻击的伤害，并降低目标{b}%的物理攻击，持续{c}秒",
    character_a = "994",
    character_b = "6.5",
    character_c = "5",
    fightForce = 4500
    };
getRow(40291,5)->
    #pet_skills_upgradingCfg {
    skill_id = 40291,
    level = 5,
    item_cost = [13001,3],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 100,
    des = "攻击前方单体目标，总共造成{a}%攻击的伤害，并降低目标{b}%的物理攻击，持续{c}秒",
    character_a = "1109",
    character_b = "7",
    character_c = "5",
    fightForce = 7200
    };
getRow(40291,6)->
    #pet_skills_upgradingCfg {
    skill_id = 40291,
    level = 6,
    item_cost = [13001,3],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 120,
    des = "攻击前方单体目标，总共造成{a}%攻击的伤害，并降低目标{b}%的物理攻击，持续{c}秒",
    character_a = "1224",
    character_b = "7.5",
    character_c = "5",
    fightForce = 9900
    };
getRow(40291,7)->
    #pet_skills_upgradingCfg {
    skill_id = 40291,
    level = 7,
    item_cost = [13001,4],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 140,
    des = "攻击前方单体目标，总共造成{a}%攻击的伤害，并降低目标{b}%的物理攻击，持续{c}秒",
    character_a = "1339",
    character_b = "8",
    character_c = "5",
    fightForce = 13500
    };
getRow(40291,8)->
    #pet_skills_upgradingCfg {
    skill_id = 40291,
    level = 8,
    item_cost = [13001,4],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 160,
    des = "攻击前方单体目标，总共造成{a}%攻击的伤害，并降低目标{b}%的物理攻击，持续{c}秒",
    character_a = "1454",
    character_b = "8.5",
    character_c = "5",
    fightForce = 17100
    };
getRow(40291,9)->
    #pet_skills_upgradingCfg {
    skill_id = 40291,
    level = 9,
    item_cost = [13001,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 180,
    des = "攻击前方单体目标，总共造成{a}%攻击的伤害，并降低目标{b}%的物理攻击，持续{c}秒",
    character_a = "1569",
    character_b = "9",
    character_c = "5",
    fightForce = 21600
    };
getRow(40291,10)->
    #pet_skills_upgradingCfg {
    skill_id = 40291,
    level = 10,
    item_cost = [13001,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 200,
    des = "攻击前方单体目标，总共造成{a}%攻击的伤害，并降低目标{b}%的物理攻击，持续{c}秒",
    character_a = "1684",
    character_b = "9.5",
    character_c = "5",
    fightForce = 26100
    };
getRow(40291,11)->
    #pet_skills_upgradingCfg {
    skill_id = 40291,
    level = 11,
    item_cost = [13001,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 200,
    des = "攻击前方单体目标，总共造成{a}%攻击的伤害，并降低目标{b}%的物理攻击，持续{c}秒",
    character_a = "1799",
    character_b = "10",
    character_c = "5",
    fightForce = 30600
    };
getRow(40294,1)->
    #pet_skills_upgradingCfg {
    skill_id = 40294,
    level = 1,
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "攻击前方单体目标，总共造成{a}%攻击的伤害，并降低目标{b}%的防御，持续{c}秒",
    character_a = "649",
    character_b = "10",
    character_c = "5",
    fightForce = 0
    };
getRow(40294,2)->
    #pet_skills_upgradingCfg {
    skill_id = 40294,
    level = 2,
    item_cost = [13001,1],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 40,
    des = "攻击前方单体目标，总共造成{a}%攻击的伤害，并降低目标{b}%的防御，持续{c}秒",
    character_a = "764",
    character_b = "11",
    character_c = "5",
    fightForce = 900
    };
getRow(40294,3)->
    #pet_skills_upgradingCfg {
    skill_id = 40294,
    level = 3,
    item_cost = [13001,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 60,
    des = "攻击前方单体目标，总共造成{a}%攻击的伤害，并降低目标{b}%的防御，持续{c}秒",
    character_a = "879",
    character_b = "12",
    character_c = "5",
    fightForce = 2700
    };
getRow(40294,4)->
    #pet_skills_upgradingCfg {
    skill_id = 40294,
    level = 4,
    item_cost = [13001,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 80,
    des = "攻击前方单体目标，总共造成{a}%攻击的伤害，并降低目标{b}%的防御，持续{c}秒",
    character_a = "994",
    character_b = "13",
    character_c = "5",
    fightForce = 4500
    };
getRow(40294,5)->
    #pet_skills_upgradingCfg {
    skill_id = 40294,
    level = 5,
    item_cost = [13001,3],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 100,
    des = "攻击前方单体目标，总共造成{a}%攻击的伤害，并降低目标{b}%的防御，持续{c}秒",
    character_a = "1109",
    character_b = "14",
    character_c = "5",
    fightForce = 7200
    };
getRow(40294,6)->
    #pet_skills_upgradingCfg {
    skill_id = 40294,
    level = 6,
    item_cost = [13001,3],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 120,
    des = "攻击前方单体目标，总共造成{a}%攻击的伤害，并降低目标{b}%的防御，持续{c}秒",
    character_a = "1224",
    character_b = "15",
    character_c = "5",
    fightForce = 9900
    };
getRow(40294,7)->
    #pet_skills_upgradingCfg {
    skill_id = 40294,
    level = 7,
    item_cost = [13001,4],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 140,
    des = "攻击前方单体目标，总共造成{a}%攻击的伤害，并降低目标{b}%的防御，持续{c}秒",
    character_a = "1339",
    character_b = "16",
    character_c = "5",
    fightForce = 13500
    };
getRow(40294,8)->
    #pet_skills_upgradingCfg {
    skill_id = 40294,
    level = 8,
    item_cost = [13001,4],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 160,
    des = "攻击前方单体目标，总共造成{a}%攻击的伤害，并降低目标{b}%的防御，持续{c}秒",
    character_a = "1454",
    character_b = "17",
    character_c = "5",
    fightForce = 17100
    };
getRow(40294,9)->
    #pet_skills_upgradingCfg {
    skill_id = 40294,
    level = 9,
    item_cost = [13001,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 180,
    des = "攻击前方单体目标，总共造成{a}%攻击的伤害，并降低目标{b}%的防御，持续{c}秒",
    character_a = "1569",
    character_b = "18",
    character_c = "5",
    fightForce = 21600
    };
getRow(40294,10)->
    #pet_skills_upgradingCfg {
    skill_id = 40294,
    level = 10,
    item_cost = [13001,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 200,
    des = "攻击前方单体目标，总共造成{a}%攻击的伤害，并降低目标{b}%的防御，持续{c}秒",
    character_a = "1684",
    character_b = "19",
    character_c = "5",
    fightForce = 26100
    };
getRow(40294,11)->
    #pet_skills_upgradingCfg {
    skill_id = 40294,
    level = 11,
    item_cost = [13001,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 200,
    des = "攻击前方单体目标，总共造成{a}%攻击的伤害，并降低目标{b}%的防御，持续{c}秒",
    character_a = "1799",
    character_b = "20",
    character_c = "5",
    fightForce = 30600
    };
getRow(40300,1)->
    #pet_skills_upgradingCfg {
    skill_id = 40300,
    level = 1,
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "攻击前方单体目标，总共造成{a}%攻击的伤害，并击飞",
    character_a = "618",
    character_b = "",
    character_c = "",
    fightForce = 0
    };
getRow(40300,2)->
    #pet_skills_upgradingCfg {
    skill_id = 40300,
    level = 2,
    item_cost = [13001,1],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 40,
    des = "攻击前方单体目标，总共造成{a}%攻击的伤害，并击飞",
    character_a = "724",
    character_b = "",
    character_c = "",
    fightForce = 900
    };
getRow(40300,3)->
    #pet_skills_upgradingCfg {
    skill_id = 40300,
    level = 3,
    item_cost = [13001,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 60,
    des = "攻击前方单体目标，总共造成{a}%攻击的伤害，并击飞",
    character_a = "830",
    character_b = "",
    character_c = "",
    fightForce = 2700
    };
getRow(40300,4)->
    #pet_skills_upgradingCfg {
    skill_id = 40300,
    level = 4,
    item_cost = [13001,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 80,
    des = "攻击前方单体目标，总共造成{a}%攻击的伤害，并击飞",
    character_a = "936",
    character_b = "",
    character_c = "",
    fightForce = 4500
    };
getRow(40300,5)->
    #pet_skills_upgradingCfg {
    skill_id = 40300,
    level = 5,
    item_cost = [13001,3],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 100,
    des = "攻击前方单体目标，总共造成{a}%攻击的伤害，并击飞",
    character_a = "1042",
    character_b = "",
    character_c = "",
    fightForce = 7200
    };
getRow(40300,6)->
    #pet_skills_upgradingCfg {
    skill_id = 40300,
    level = 6,
    item_cost = [13001,3],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 120,
    des = "攻击前方单体目标，总共造成{a}%攻击的伤害，并击飞",
    character_a = "1148",
    character_b = "",
    character_c = "",
    fightForce = 9900
    };
getRow(40300,7)->
    #pet_skills_upgradingCfg {
    skill_id = 40300,
    level = 7,
    item_cost = [13001,4],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 140,
    des = "攻击前方单体目标，总共造成{a}%攻击的伤害，并击飞",
    character_a = "1254",
    character_b = "",
    character_c = "",
    fightForce = 13500
    };
getRow(40300,8)->
    #pet_skills_upgradingCfg {
    skill_id = 40300,
    level = 8,
    item_cost = [13001,4],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 160,
    des = "攻击前方单体目标，总共造成{a}%攻击的伤害，并击飞",
    character_a = "1360",
    character_b = "",
    character_c = "",
    fightForce = 17100
    };
getRow(40300,9)->
    #pet_skills_upgradingCfg {
    skill_id = 40300,
    level = 9,
    item_cost = [13001,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 180,
    des = "攻击前方单体目标，总共造成{a}%攻击的伤害，并击飞",
    character_a = "1466",
    character_b = "",
    character_c = "",
    fightForce = 21600
    };
getRow(40300,10)->
    #pet_skills_upgradingCfg {
    skill_id = 40300,
    level = 10,
    item_cost = [13001,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 200,
    des = "攻击前方单体目标，总共造成{a}%攻击的伤害，并击飞",
    character_a = "1572",
    character_b = "",
    character_c = "",
    fightForce = 26100
    };
getRow(40300,11)->
    #pet_skills_upgradingCfg {
    skill_id = 40300,
    level = 11,
    item_cost = [13001,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 200,
    des = "攻击前方单体目标，总共造成{a}%攻击的伤害，并击飞",
    character_a = "1678",
    character_b = "",
    character_c = "",
    fightForce = 30600
    };
getRow(40301,1)->
    #pet_skills_upgradingCfg {
    skill_id = 40301,
    level = 1,
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "攻击前方单体目标，总共造成{a}%攻击的伤害，并降低目标{b}%的魔法攻击，持续{c}秒",
    character_a = "649",
    character_b = "5",
    character_c = "5",
    fightForce = 0
    };
getRow(40301,2)->
    #pet_skills_upgradingCfg {
    skill_id = 40301,
    level = 2,
    item_cost = [13001,1],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 40,
    des = "攻击前方单体目标，总共造成{a}%攻击的伤害，并降低目标{b}%的魔法攻击，持续{c}秒",
    character_a = "764",
    character_b = "5.5",
    character_c = "5",
    fightForce = 900
    };
getRow(40301,3)->
    #pet_skills_upgradingCfg {
    skill_id = 40301,
    level = 3,
    item_cost = [13001,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 60,
    des = "攻击前方单体目标，总共造成{a}%攻击的伤害，并降低目标{b}%的魔法攻击，持续{c}秒",
    character_a = "879",
    character_b = "6",
    character_c = "5",
    fightForce = 2700
    };
getRow(40301,4)->
    #pet_skills_upgradingCfg {
    skill_id = 40301,
    level = 4,
    item_cost = [13001,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 80,
    des = "攻击前方单体目标，总共造成{a}%攻击的伤害，并降低目标{b}%的魔法攻击，持续{c}秒",
    character_a = "994",
    character_b = "6.5",
    character_c = "5",
    fightForce = 4500
    };
getRow(40301,5)->
    #pet_skills_upgradingCfg {
    skill_id = 40301,
    level = 5,
    item_cost = [13001,3],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 100,
    des = "攻击前方单体目标，总共造成{a}%攻击的伤害，并降低目标{b}%的魔法攻击，持续{c}秒",
    character_a = "1109",
    character_b = "7",
    character_c = "5",
    fightForce = 7200
    };
getRow(40301,6)->
    #pet_skills_upgradingCfg {
    skill_id = 40301,
    level = 6,
    item_cost = [13001,3],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 120,
    des = "攻击前方单体目标，总共造成{a}%攻击的伤害，并降低目标{b}%的魔法攻击，持续{c}秒",
    character_a = "1224",
    character_b = "7.5",
    character_c = "5",
    fightForce = 9900
    };
getRow(40301,7)->
    #pet_skills_upgradingCfg {
    skill_id = 40301,
    level = 7,
    item_cost = [13001,4],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 140,
    des = "攻击前方单体目标，总共造成{a}%攻击的伤害，并降低目标{b}%的魔法攻击，持续{c}秒",
    character_a = "1339",
    character_b = "8",
    character_c = "5",
    fightForce = 13500
    };
getRow(40301,8)->
    #pet_skills_upgradingCfg {
    skill_id = 40301,
    level = 8,
    item_cost = [13001,4],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 160,
    des = "攻击前方单体目标，总共造成{a}%攻击的伤害，并降低目标{b}%的魔法攻击，持续{c}秒",
    character_a = "1454",
    character_b = "8.5",
    character_c = "5",
    fightForce = 17100
    };
getRow(40301,9)->
    #pet_skills_upgradingCfg {
    skill_id = 40301,
    level = 9,
    item_cost = [13001,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 180,
    des = "攻击前方单体目标，总共造成{a}%攻击的伤害，并降低目标{b}%的魔法攻击，持续{c}秒",
    character_a = "1569",
    character_b = "9",
    character_c = "5",
    fightForce = 21600
    };
getRow(40301,10)->
    #pet_skills_upgradingCfg {
    skill_id = 40301,
    level = 10,
    item_cost = [13001,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 200,
    des = "攻击前方单体目标，总共造成{a}%攻击的伤害，并降低目标{b}%的魔法攻击，持续{c}秒",
    character_a = "1684",
    character_b = "9.5",
    character_c = "5",
    fightForce = 26100
    };
getRow(40301,11)->
    #pet_skills_upgradingCfg {
    skill_id = 40301,
    level = 11,
    item_cost = [13001,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 200,
    des = "攻击前方单体目标，总共造成{a}%攻击的伤害，并降低目标{b}%的魔法攻击，持续{c}秒",
    character_a = "1799",
    character_b = "10",
    character_c = "5",
    fightForce = 30600
    };
getRow(40302,1)->
    #pet_skills_upgradingCfg {
    skill_id = 40302,
    level = 1,
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "攻击前方单体目标，总共造成{a}%攻击的伤害，并降低目标{b}%的防御，持续{c}秒",
    character_a = "649",
    character_b = "10",
    character_c = "5",
    fightForce = 0
    };
getRow(40302,2)->
    #pet_skills_upgradingCfg {
    skill_id = 40302,
    level = 2,
    item_cost = [13001,1],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 40,
    des = "攻击前方单体目标，总共造成{a}%攻击的伤害，并降低目标{b}%的防御，持续{c}秒",
    character_a = "764",
    character_b = "11",
    character_c = "5",
    fightForce = 900
    };
getRow(40302,3)->
    #pet_skills_upgradingCfg {
    skill_id = 40302,
    level = 3,
    item_cost = [13001,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 60,
    des = "攻击前方单体目标，总共造成{a}%攻击的伤害，并降低目标{b}%的防御，持续{c}秒",
    character_a = "879",
    character_b = "12",
    character_c = "5",
    fightForce = 2700
    };
getRow(40302,4)->
    #pet_skills_upgradingCfg {
    skill_id = 40302,
    level = 4,
    item_cost = [13001,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 80,
    des = "攻击前方单体目标，总共造成{a}%攻击的伤害，并降低目标{b}%的防御，持续{c}秒",
    character_a = "994",
    character_b = "13",
    character_c = "5",
    fightForce = 4500
    };
getRow(40302,5)->
    #pet_skills_upgradingCfg {
    skill_id = 40302,
    level = 5,
    item_cost = [13001,3],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 100,
    des = "攻击前方单体目标，总共造成{a}%攻击的伤害，并降低目标{b}%的防御，持续{c}秒",
    character_a = "1109",
    character_b = "14",
    character_c = "5",
    fightForce = 7200
    };
getRow(40302,6)->
    #pet_skills_upgradingCfg {
    skill_id = 40302,
    level = 6,
    item_cost = [13001,3],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 120,
    des = "攻击前方单体目标，总共造成{a}%攻击的伤害，并降低目标{b}%的防御，持续{c}秒",
    character_a = "1224",
    character_b = "15",
    character_c = "5",
    fightForce = 9900
    };
getRow(40302,7)->
    #pet_skills_upgradingCfg {
    skill_id = 40302,
    level = 7,
    item_cost = [13001,4],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 140,
    des = "攻击前方单体目标，总共造成{a}%攻击的伤害，并降低目标{b}%的防御，持续{c}秒",
    character_a = "1339",
    character_b = "16",
    character_c = "5",
    fightForce = 13500
    };
getRow(40302,8)->
    #pet_skills_upgradingCfg {
    skill_id = 40302,
    level = 8,
    item_cost = [13001,4],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 160,
    des = "攻击前方单体目标，总共造成{a}%攻击的伤害，并降低目标{b}%的防御，持续{c}秒",
    character_a = "1454",
    character_b = "17",
    character_c = "5",
    fightForce = 17100
    };
getRow(40302,9)->
    #pet_skills_upgradingCfg {
    skill_id = 40302,
    level = 9,
    item_cost = [13001,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 180,
    des = "攻击前方单体目标，总共造成{a}%攻击的伤害，并降低目标{b}%的防御，持续{c}秒",
    character_a = "1569",
    character_b = "18",
    character_c = "5",
    fightForce = 21600
    };
getRow(40302,10)->
    #pet_skills_upgradingCfg {
    skill_id = 40302,
    level = 10,
    item_cost = [13001,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 200,
    des = "攻击前方单体目标，总共造成{a}%攻击的伤害，并降低目标{b}%的防御，持续{c}秒",
    character_a = "1684",
    character_b = "19",
    character_c = "5",
    fightForce = 26100
    };
getRow(40302,11)->
    #pet_skills_upgradingCfg {
    skill_id = 40302,
    level = 11,
    item_cost = [13001,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 200,
    des = "攻击前方单体目标，总共造成{a}%攻击的伤害，并降低目标{b}%的防御，持续{c}秒",
    character_a = "1799",
    character_b = "20",
    character_c = "5",
    fightForce = 30600
    };
getRow(40310,1)->
    #pet_skills_upgradingCfg {
    skill_id = 40310,
    level = 1,
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "飞空艇用力向前撞击15米，总共造成{a}%攻击的伤害",
    character_a = "640",
    character_b = "",
    character_c = "",
    fightForce = 0
    };
getRow(40310,2)->
    #pet_skills_upgradingCfg {
    skill_id = 40310,
    level = 2,
    item_cost = [13001,1],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 40,
    des = "飞空艇用力向前撞击15米，总共造成{a}%攻击的伤害",
    character_a = "750",
    character_b = "",
    character_c = "",
    fightForce = 900
    };
getRow(40310,3)->
    #pet_skills_upgradingCfg {
    skill_id = 40310,
    level = 3,
    item_cost = [13001,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 60,
    des = "飞空艇用力向前撞击15米，总共造成{a}%攻击的伤害",
    character_a = "860",
    character_b = "",
    character_c = "",
    fightForce = 2700
    };
getRow(40310,4)->
    #pet_skills_upgradingCfg {
    skill_id = 40310,
    level = 4,
    item_cost = [13001,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 80,
    des = "飞空艇用力向前撞击15米，总共造成{a}%攻击的伤害",
    character_a = "970",
    character_b = "",
    character_c = "",
    fightForce = 4500
    };
getRow(40310,5)->
    #pet_skills_upgradingCfg {
    skill_id = 40310,
    level = 5,
    item_cost = [13001,3],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 100,
    des = "飞空艇用力向前撞击15米，总共造成{a}%攻击的伤害",
    character_a = "1080",
    character_b = "",
    character_c = "",
    fightForce = 7200
    };
getRow(40310,6)->
    #pet_skills_upgradingCfg {
    skill_id = 40310,
    level = 6,
    item_cost = [13001,3],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 120,
    des = "飞空艇用力向前撞击15米，总共造成{a}%攻击的伤害",
    character_a = "1190",
    character_b = "",
    character_c = "",
    fightForce = 9900
    };
getRow(40310,7)->
    #pet_skills_upgradingCfg {
    skill_id = 40310,
    level = 7,
    item_cost = [13001,4],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 140,
    des = "飞空艇用力向前撞击15米，总共造成{a}%攻击的伤害",
    character_a = "1300",
    character_b = "",
    character_c = "",
    fightForce = 13500
    };
getRow(40310,8)->
    #pet_skills_upgradingCfg {
    skill_id = 40310,
    level = 8,
    item_cost = [13001,4],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 160,
    des = "飞空艇用力向前撞击15米，总共造成{a}%攻击的伤害",
    character_a = "1410",
    character_b = "",
    character_c = "",
    fightForce = 17100
    };
getRow(40310,9)->
    #pet_skills_upgradingCfg {
    skill_id = 40310,
    level = 9,
    item_cost = [13001,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 180,
    des = "飞空艇用力向前撞击15米，总共造成{a}%攻击的伤害",
    character_a = "1520",
    character_b = "",
    character_c = "",
    fightForce = 21600
    };
getRow(40310,10)->
    #pet_skills_upgradingCfg {
    skill_id = 40310,
    level = 10,
    item_cost = [13001,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 200,
    des = "飞空艇用力向前撞击15米，总共造成{a}%攻击的伤害",
    character_a = "1630",
    character_b = "",
    character_c = "",
    fightForce = 26100
    };
getRow(40310,11)->
    #pet_skills_upgradingCfg {
    skill_id = 40310,
    level = 11,
    item_cost = [13001,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 200,
    des = "飞空艇用力向前撞击15米，总共造成{a}%攻击的伤害",
    character_a = "1740",
    character_b = "",
    character_c = "",
    fightForce = 30600
    };
getRow(40311,1)->
    #pet_skills_upgradingCfg {
    skill_id = 40311,
    level = 1,
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "飞空艇带动部分气流，对前方扇形敌人造成{a}%攻击的伤害，且有概率造成眩晕{c}秒",
    character_a = "403",
    character_b = "",
    character_c = "2",
    fightForce = 0
    };
getRow(40311,2)->
    #pet_skills_upgradingCfg {
    skill_id = 40311,
    level = 2,
    item_cost = [13001,1],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 40,
    des = "飞空艇带动部分气流，对前方扇形敌人造成{a}%攻击的伤害，且有概率造成眩晕{c}秒",
    character_a = "474",
    character_b = "",
    character_c = "2",
    fightForce = 900
    };
getRow(40311,3)->
    #pet_skills_upgradingCfg {
    skill_id = 40311,
    level = 3,
    item_cost = [13001,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 60,
    des = "飞空艇带动部分气流，对前方扇形敌人造成{a}%攻击的伤害，且有概率造成眩晕{c}秒",
    character_a = "545",
    character_b = "",
    character_c = "2",
    fightForce = 2700
    };
getRow(40311,4)->
    #pet_skills_upgradingCfg {
    skill_id = 40311,
    level = 4,
    item_cost = [13001,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 80,
    des = "飞空艇带动部分气流，对前方扇形敌人造成{a}%攻击的伤害，且有概率造成眩晕{c}秒",
    character_a = "616",
    character_b = "",
    character_c = "2",
    fightForce = 4500
    };
getRow(40311,5)->
    #pet_skills_upgradingCfg {
    skill_id = 40311,
    level = 5,
    item_cost = [13001,3],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 100,
    des = "飞空艇带动部分气流，对前方扇形敌人造成{a}%攻击的伤害，且有概率造成眩晕{c}秒",
    character_a = "687",
    character_b = "",
    character_c = "2",
    fightForce = 7200
    };
getRow(40311,6)->
    #pet_skills_upgradingCfg {
    skill_id = 40311,
    level = 6,
    item_cost = [13001,3],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 120,
    des = "飞空艇带动部分气流，对前方扇形敌人造成{a}%攻击的伤害，且有概率造成眩晕{c}秒",
    character_a = "758",
    character_b = "",
    character_c = "2",
    fightForce = 9900
    };
getRow(40311,7)->
    #pet_skills_upgradingCfg {
    skill_id = 40311,
    level = 7,
    item_cost = [13001,4],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 140,
    des = "飞空艇带动部分气流，对前方扇形敌人造成{a}%攻击的伤害，且有概率造成眩晕{c}秒",
    character_a = "829",
    character_b = "",
    character_c = "2",
    fightForce = 13500
    };
getRow(40311,8)->
    #pet_skills_upgradingCfg {
    skill_id = 40311,
    level = 8,
    item_cost = [13001,4],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 160,
    des = "飞空艇带动部分气流，对前方扇形敌人造成{a}%攻击的伤害，且有概率造成眩晕{c}秒",
    character_a = "900",
    character_b = "",
    character_c = "2",
    fightForce = 17100
    };
getRow(40311,9)->
    #pet_skills_upgradingCfg {
    skill_id = 40311,
    level = 9,
    item_cost = [13001,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 180,
    des = "飞空艇带动部分气流，对前方扇形敌人造成{a}%攻击的伤害，且有概率造成眩晕{c}秒",
    character_a = "971",
    character_b = "",
    character_c = "2",
    fightForce = 21600
    };
getRow(40311,10)->
    #pet_skills_upgradingCfg {
    skill_id = 40311,
    level = 10,
    item_cost = [13001,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 200,
    des = "飞空艇带动部分气流，对前方扇形敌人造成{a}%攻击的伤害，且有概率造成眩晕{c}秒",
    character_a = "1042",
    character_b = "",
    character_c = "2",
    fightForce = 26100
    };
getRow(40311,11)->
    #pet_skills_upgradingCfg {
    skill_id = 40311,
    level = 11,
    item_cost = [13001,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 200,
    des = "飞空艇带动部分气流，对前方扇形敌人造成{a}%攻击的伤害，且有概率造成眩晕{c}秒",
    character_a = "1113",
    character_b = "",
    character_c = "2",
    fightForce = 30600
    };
getRow(40320,1)->
    #pet_skills_upgradingCfg {
    skill_id = 40320,
    level = 1,
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "攻击前方单体敌人，造成{a}%攻击的伤害",
    character_a = "320",
    character_b = "",
    character_c = "",
    fightForce = 0
    };
getRow(40320,2)->
    #pet_skills_upgradingCfg {
    skill_id = 40320,
    level = 2,
    item_cost = [13001,1],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 40,
    des = "攻击前方单体敌人，造成{a}%攻击的伤害",
    character_a = "375",
    character_b = "",
    character_c = "",
    fightForce = 900
    };
getRow(40320,3)->
    #pet_skills_upgradingCfg {
    skill_id = 40320,
    level = 3,
    item_cost = [13001,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 60,
    des = "攻击前方单体敌人，造成{a}%攻击的伤害",
    character_a = "430",
    character_b = "",
    character_c = "",
    fightForce = 2700
    };
getRow(40320,4)->
    #pet_skills_upgradingCfg {
    skill_id = 40320,
    level = 4,
    item_cost = [13001,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 80,
    des = "攻击前方单体敌人，造成{a}%攻击的伤害",
    character_a = "485",
    character_b = "",
    character_c = "",
    fightForce = 4500
    };
getRow(40320,5)->
    #pet_skills_upgradingCfg {
    skill_id = 40320,
    level = 5,
    item_cost = [13001,3],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 100,
    des = "攻击前方单体敌人，造成{a}%攻击的伤害",
    character_a = "540",
    character_b = "",
    character_c = "",
    fightForce = 7200
    };
getRow(40320,6)->
    #pet_skills_upgradingCfg {
    skill_id = 40320,
    level = 6,
    item_cost = [13001,3],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 120,
    des = "攻击前方单体敌人，造成{a}%攻击的伤害",
    character_a = "595",
    character_b = "",
    character_c = "",
    fightForce = 9900
    };
getRow(40320,7)->
    #pet_skills_upgradingCfg {
    skill_id = 40320,
    level = 7,
    item_cost = [13001,4],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 140,
    des = "攻击前方单体敌人，造成{a}%攻击的伤害",
    character_a = "650",
    character_b = "",
    character_c = "",
    fightForce = 13500
    };
getRow(40320,8)->
    #pet_skills_upgradingCfg {
    skill_id = 40320,
    level = 8,
    item_cost = [13001,4],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 160,
    des = "攻击前方单体敌人，造成{a}%攻击的伤害",
    character_a = "705",
    character_b = "",
    character_c = "",
    fightForce = 17100
    };
getRow(40320,9)->
    #pet_skills_upgradingCfg {
    skill_id = 40320,
    level = 9,
    item_cost = [13001,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 180,
    des = "攻击前方单体敌人，造成{a}%攻击的伤害",
    character_a = "760",
    character_b = "",
    character_c = "",
    fightForce = 21600
    };
getRow(40320,10)->
    #pet_skills_upgradingCfg {
    skill_id = 40320,
    level = 10,
    item_cost = [13001,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 200,
    des = "攻击前方单体敌人，造成{a}%攻击的伤害",
    character_a = "815",
    character_b = "",
    character_c = "",
    fightForce = 26100
    };
getRow(40320,11)->
    #pet_skills_upgradingCfg {
    skill_id = 40320,
    level = 11,
    item_cost = [13001,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 200,
    des = "攻击前方单体敌人，造成{a}%攻击的伤害",
    character_a = "870",
    character_b = "",
    character_c = "",
    fightForce = 30600
    };
getRow(40321,1)->
    #pet_skills_upgradingCfg {
    skill_id = 40321,
    level = 1,
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "攻击前方单体敌人，造成{a}%攻击的伤害并击退",
    character_a = "800",
    character_b = "",
    character_c = "",
    fightForce = 0
    };
getRow(40321,2)->
    #pet_skills_upgradingCfg {
    skill_id = 40321,
    level = 2,
    item_cost = [13001,1],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 40,
    des = "攻击前方单体敌人，造成{a}%攻击的伤害并击退",
    character_a = "940",
    character_b = "",
    character_c = "",
    fightForce = 900
    };
getRow(40321,3)->
    #pet_skills_upgradingCfg {
    skill_id = 40321,
    level = 3,
    item_cost = [13001,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 60,
    des = "攻击前方单体敌人，造成{a}%攻击的伤害并击退",
    character_a = "1080",
    character_b = "",
    character_c = "",
    fightForce = 2700
    };
getRow(40321,4)->
    #pet_skills_upgradingCfg {
    skill_id = 40321,
    level = 4,
    item_cost = [13001,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 80,
    des = "攻击前方单体敌人，造成{a}%攻击的伤害并击退",
    character_a = "1220",
    character_b = "",
    character_c = "",
    fightForce = 4500
    };
getRow(40321,5)->
    #pet_skills_upgradingCfg {
    skill_id = 40321,
    level = 5,
    item_cost = [13001,3],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 100,
    des = "攻击前方单体敌人，造成{a}%攻击的伤害并击退",
    character_a = "1360",
    character_b = "",
    character_c = "",
    fightForce = 7200
    };
getRow(40321,6)->
    #pet_skills_upgradingCfg {
    skill_id = 40321,
    level = 6,
    item_cost = [13001,3],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 120,
    des = "攻击前方单体敌人，造成{a}%攻击的伤害并击退",
    character_a = "1500",
    character_b = "",
    character_c = "",
    fightForce = 9900
    };
getRow(40321,7)->
    #pet_skills_upgradingCfg {
    skill_id = 40321,
    level = 7,
    item_cost = [13001,4],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 140,
    des = "攻击前方单体敌人，造成{a}%攻击的伤害并击退",
    character_a = "1640",
    character_b = "",
    character_c = "",
    fightForce = 13500
    };
getRow(40321,8)->
    #pet_skills_upgradingCfg {
    skill_id = 40321,
    level = 8,
    item_cost = [13001,4],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 160,
    des = "攻击前方单体敌人，造成{a}%攻击的伤害并击退",
    character_a = "1780",
    character_b = "",
    character_c = "",
    fightForce = 17100
    };
getRow(40321,9)->
    #pet_skills_upgradingCfg {
    skill_id = 40321,
    level = 9,
    item_cost = [13001,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 180,
    des = "攻击前方单体敌人，造成{a}%攻击的伤害并击退",
    character_a = "1920",
    character_b = "",
    character_c = "",
    fightForce = 21600
    };
getRow(40321,10)->
    #pet_skills_upgradingCfg {
    skill_id = 40321,
    level = 10,
    item_cost = [13001,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 200,
    des = "攻击前方单体敌人，造成{a}%攻击的伤害并击退",
    character_a = "2060",
    character_b = "",
    character_c = "",
    fightForce = 26100
    };
getRow(40321,11)->
    #pet_skills_upgradingCfg {
    skill_id = 40321,
    level = 11,
    item_cost = [13001,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 200,
    des = "攻击前方单体敌人，造成{a}%攻击的伤害并击退",
    character_a = "2200",
    character_b = "",
    character_c = "",
    fightForce = 30600
    };
getRow(40322,1)->
    #pet_skills_upgradingCfg {
    skill_id = 40322,
    level = 1,
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "对前方扇形范围内敌人进行3次攻击，每次造成{a}%攻击的伤害，受击目标有概率被眩晕{c}秒",
    character_a = "192",
    character_b = "",
    character_c = "2",
    fightForce = 0
    };
getRow(40322,2)->
    #pet_skills_upgradingCfg {
    skill_id = 40322,
    level = 2,
    item_cost = [13001,1],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 40,
    des = "对前方扇形范围内敌人进行3次攻击，每次造成{a}%攻击的伤害，受击目标有概率被眩晕{c}秒",
    character_a = "226",
    character_b = "",
    character_c = "2",
    fightForce = 900
    };
getRow(40322,3)->
    #pet_skills_upgradingCfg {
    skill_id = 40322,
    level = 3,
    item_cost = [13001,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 60,
    des = "对前方扇形范围内敌人进行3次攻击，每次造成{a}%攻击的伤害，受击目标有概率被眩晕{c}秒",
    character_a = "260",
    character_b = "",
    character_c = "2",
    fightForce = 2700
    };
getRow(40322,4)->
    #pet_skills_upgradingCfg {
    skill_id = 40322,
    level = 4,
    item_cost = [13001,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 80,
    des = "对前方扇形范围内敌人进行3次攻击，每次造成{a}%攻击的伤害，受击目标有概率被眩晕{c}秒",
    character_a = "294",
    character_b = "",
    character_c = "2",
    fightForce = 4500
    };
getRow(40322,5)->
    #pet_skills_upgradingCfg {
    skill_id = 40322,
    level = 5,
    item_cost = [13001,3],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 100,
    des = "对前方扇形范围内敌人进行3次攻击，每次造成{a}%攻击的伤害，受击目标有概率被眩晕{c}秒",
    character_a = "328",
    character_b = "",
    character_c = "2",
    fightForce = 7200
    };
getRow(40322,6)->
    #pet_skills_upgradingCfg {
    skill_id = 40322,
    level = 6,
    item_cost = [13001,3],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 120,
    des = "对前方扇形范围内敌人进行3次攻击，每次造成{a}%攻击的伤害，受击目标有概率被眩晕{c}秒",
    character_a = "362",
    character_b = "",
    character_c = "2",
    fightForce = 9900
    };
getRow(40322,7)->
    #pet_skills_upgradingCfg {
    skill_id = 40322,
    level = 7,
    item_cost = [13001,4],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 140,
    des = "对前方扇形范围内敌人进行3次攻击，每次造成{a}%攻击的伤害，受击目标有概率被眩晕{c}秒",
    character_a = "396",
    character_b = "",
    character_c = "2",
    fightForce = 13500
    };
getRow(40322,8)->
    #pet_skills_upgradingCfg {
    skill_id = 40322,
    level = 8,
    item_cost = [13001,4],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 160,
    des = "对前方扇形范围内敌人进行3次攻击，每次造成{a}%攻击的伤害，受击目标有概率被眩晕{c}秒",
    character_a = "430",
    character_b = "",
    character_c = "2",
    fightForce = 17100
    };
getRow(40322,9)->
    #pet_skills_upgradingCfg {
    skill_id = 40322,
    level = 9,
    item_cost = [13001,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 180,
    des = "对前方扇形范围内敌人进行3次攻击，每次造成{a}%攻击的伤害，受击目标有概率被眩晕{c}秒",
    character_a = "464",
    character_b = "",
    character_c = "2",
    fightForce = 21600
    };
getRow(40322,10)->
    #pet_skills_upgradingCfg {
    skill_id = 40322,
    level = 10,
    item_cost = [13001,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 200,
    des = "对前方扇形范围内敌人进行3次攻击，每次造成{a}%攻击的伤害，受击目标有概率被眩晕{c}秒",
    character_a = "498",
    character_b = "",
    character_c = "2",
    fightForce = 26100
    };
getRow(40322,11)->
    #pet_skills_upgradingCfg {
    skill_id = 40322,
    level = 11,
    item_cost = [13001,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 200,
    des = "对前方扇形范围内敌人进行3次攻击，每次造成{a}%攻击的伤害，受击目标有概率被眩晕{c}秒",
    character_a = "532",
    character_b = "",
    character_c = "2",
    fightForce = 30600
    };
getRow(40330,1)->
    #pet_skills_upgradingCfg {
    skill_id = 40330,
    level = 1,
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "猛抓前方单体敌人，造成{a}%攻击的伤害",
    character_a = "349",
    character_b = "",
    character_c = "",
    fightForce = 0
    };
getRow(40330,2)->
    #pet_skills_upgradingCfg {
    skill_id = 40330,
    level = 2,
    item_cost = [13000,1],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 40,
    des = "猛抓前方单体敌人，造成{a}%攻击的伤害",
    character_a = "404",
    character_b = "",
    character_c = "",
    fightForce = 900
    };
getRow(40330,3)->
    #pet_skills_upgradingCfg {
    skill_id = 40330,
    level = 3,
    item_cost = [13000,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 60,
    des = "猛抓前方单体敌人，造成{a}%攻击的伤害",
    character_a = "459",
    character_b = "",
    character_c = "",
    fightForce = 2700
    };
getRow(40330,4)->
    #pet_skills_upgradingCfg {
    skill_id = 40330,
    level = 4,
    item_cost = [13000,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 80,
    des = "猛抓前方单体敌人，造成{a}%攻击的伤害",
    character_a = "514",
    character_b = "",
    character_c = "",
    fightForce = 4500
    };
getRow(40330,5)->
    #pet_skills_upgradingCfg {
    skill_id = 40330,
    level = 5,
    item_cost = [13000,3],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 100,
    des = "猛抓前方单体敌人，造成{a}%攻击的伤害",
    character_a = "569",
    character_b = "",
    character_c = "",
    fightForce = 7200
    };
getRow(40330,6)->
    #pet_skills_upgradingCfg {
    skill_id = 40330,
    level = 6,
    item_cost = [13000,3],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 120,
    des = "猛抓前方单体敌人，造成{a}%攻击的伤害",
    character_a = "624",
    character_b = "",
    character_c = "",
    fightForce = 9900
    };
getRow(40330,7)->
    #pet_skills_upgradingCfg {
    skill_id = 40330,
    level = 7,
    item_cost = [13000,4],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 140,
    des = "猛抓前方单体敌人，造成{a}%攻击的伤害",
    character_a = "679",
    character_b = "",
    character_c = "",
    fightForce = 13500
    };
getRow(40330,8)->
    #pet_skills_upgradingCfg {
    skill_id = 40330,
    level = 8,
    item_cost = [13000,4],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 160,
    des = "猛抓前方单体敌人，造成{a}%攻击的伤害",
    character_a = "734",
    character_b = "",
    character_c = "",
    fightForce = 17100
    };
getRow(40330,9)->
    #pet_skills_upgradingCfg {
    skill_id = 40330,
    level = 9,
    item_cost = [13000,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 180,
    des = "猛抓前方单体敌人，造成{a}%攻击的伤害",
    character_a = "789",
    character_b = "",
    character_c = "",
    fightForce = 21600
    };
getRow(40330,10)->
    #pet_skills_upgradingCfg {
    skill_id = 40330,
    level = 10,
    item_cost = [13000,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 200,
    des = "猛抓前方单体敌人，造成{a}%攻击的伤害",
    character_a = "844",
    character_b = "",
    character_c = "",
    fightForce = 26100
    };
getRow(40330,11)->
    #pet_skills_upgradingCfg {
    skill_id = 40330,
    level = 11,
    item_cost = [13000,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 200,
    des = "猛抓前方单体敌人，造成{a}%攻击的伤害",
    character_a = "899",
    character_b = "",
    character_c = "",
    fightForce = 30600
    };
getRow(40331,1)->
    #pet_skills_upgradingCfg {
    skill_id = 40331,
    level = 1,
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "驯兽花豹发出振奋人心的嘶鸣，提升主人{b}%的攻击",
    character_a = "874",
    character_b = "3",
    character_c = "5",
    fightForce = 0
    };
getRow(40331,2)->
    #pet_skills_upgradingCfg {
    skill_id = 40331,
    level = 2,
    item_cost = [13000,1],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 40,
    des = "驯兽花豹发出振奋人心的嘶鸣，提升主人{b}%的攻击",
    character_a = "1001",
    character_b = "3.3",
    character_c = "5",
    fightForce = 300
    };
getRow(40331,3)->
    #pet_skills_upgradingCfg {
    skill_id = 40331,
    level = 3,
    item_cost = [13000,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 60,
    des = "驯兽花豹发出振奋人心的嘶鸣，提升主人{b}%的攻击",
    character_a = "1128",
    character_b = "3.6",
    character_c = "5",
    fightForce = 900
    };
getRow(40331,4)->
    #pet_skills_upgradingCfg {
    skill_id = 40331,
    level = 4,
    item_cost = [13000,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 80,
    des = "驯兽花豹发出振奋人心的嘶鸣，提升主人{b}%的攻击",
    character_a = "1255",
    character_b = "3.9",
    character_c = "5",
    fightForce = 1500
    };
getRow(40331,5)->
    #pet_skills_upgradingCfg {
    skill_id = 40331,
    level = 5,
    item_cost = [13000,3],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 100,
    des = "驯兽花豹发出振奋人心的嘶鸣，提升主人{b}%的攻击",
    character_a = "1382",
    character_b = "4.2",
    character_c = "5",
    fightForce = 2400
    };
getRow(40331,6)->
    #pet_skills_upgradingCfg {
    skill_id = 40331,
    level = 6,
    item_cost = [13000,3],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 120,
    des = "驯兽花豹发出振奋人心的嘶鸣，提升主人{b}%的攻击",
    character_a = "1509",
    character_b = "4.5",
    character_c = "5",
    fightForce = 3300
    };
getRow(40331,7)->
    #pet_skills_upgradingCfg {
    skill_id = 40331,
    level = 7,
    item_cost = [13000,4],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 140,
    des = "驯兽花豹发出振奋人心的嘶鸣，提升主人{b}%的攻击",
    character_a = "1636",
    character_b = "4.8",
    character_c = "5",
    fightForce = 4500
    };
getRow(40331,8)->
    #pet_skills_upgradingCfg {
    skill_id = 40331,
    level = 8,
    item_cost = [13000,4],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 160,
    des = "驯兽花豹发出振奋人心的嘶鸣，提升主人{b}%的攻击",
    character_a = "1763",
    character_b = "5.1",
    character_c = "5",
    fightForce = 5700
    };
getRow(40331,9)->
    #pet_skills_upgradingCfg {
    skill_id = 40331,
    level = 9,
    item_cost = [13000,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 180,
    des = "驯兽花豹发出振奋人心的嘶鸣，提升主人{b}%的攻击",
    character_a = "1890",
    character_b = "5.4",
    character_c = "5",
    fightForce = 7200
    };
getRow(40331,10)->
    #pet_skills_upgradingCfg {
    skill_id = 40331,
    level = 10,
    item_cost = [13000,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 200,
    des = "驯兽花豹发出振奋人心的嘶鸣，提升主人{b}%的攻击",
    character_a = "2017",
    character_b = "5.7",
    character_c = "5",
    fightForce = 8700
    };
getRow(40331,11)->
    #pet_skills_upgradingCfg {
    skill_id = 40331,
    level = 11,
    item_cost = [13000,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 200,
    des = "驯兽花豹发出振奋人心的嘶鸣，提升主人{b}%的攻击",
    character_a = "2144",
    character_b = "6",
    character_c = "5",
    fightForce = 10200
    };
getRow(40340,1)->
    #pet_skills_upgradingCfg {
    skill_id = 40340,
    level = 1,
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "首领土狼用头部撞击敌人，造成{a}%攻击的伤害",
    character_a = "768",
    character_b = "",
    character_c = "",
    fightForce = 0
    };
getRow(40340,2)->
    #pet_skills_upgradingCfg {
    skill_id = 40340,
    level = 2,
    item_cost = [13000,1],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 40,
    des = "首领土狼用头部撞击敌人，造成{a}%攻击的伤害",
    character_a = "888",
    character_b = "",
    character_c = "",
    fightForce = 300
    };
getRow(40340,3)->
    #pet_skills_upgradingCfg {
    skill_id = 40340,
    level = 3,
    item_cost = [13000,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 60,
    des = "首领土狼用头部撞击敌人，造成{a}%攻击的伤害",
    character_a = "1008",
    character_b = "",
    character_c = "",
    fightForce = 900
    };
getRow(40340,4)->
    #pet_skills_upgradingCfg {
    skill_id = 40340,
    level = 4,
    item_cost = [13000,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 80,
    des = "首领土狼用头部撞击敌人，造成{a}%攻击的伤害",
    character_a = "1128",
    character_b = "",
    character_c = "",
    fightForce = 1500
    };
getRow(40340,5)->
    #pet_skills_upgradingCfg {
    skill_id = 40340,
    level = 5,
    item_cost = [13000,3],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 100,
    des = "首领土狼用头部撞击敌人，造成{a}%攻击的伤害",
    character_a = "1248",
    character_b = "",
    character_c = "",
    fightForce = 2400
    };
getRow(40340,6)->
    #pet_skills_upgradingCfg {
    skill_id = 40340,
    level = 6,
    item_cost = [13000,3],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 120,
    des = "首领土狼用头部撞击敌人，造成{a}%攻击的伤害",
    character_a = "1368",
    character_b = "",
    character_c = "",
    fightForce = 3300
    };
getRow(40340,7)->
    #pet_skills_upgradingCfg {
    skill_id = 40340,
    level = 7,
    item_cost = [13000,4],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 140,
    des = "首领土狼用头部撞击敌人，造成{a}%攻击的伤害",
    character_a = "1488",
    character_b = "",
    character_c = "",
    fightForce = 4500
    };
getRow(40340,8)->
    #pet_skills_upgradingCfg {
    skill_id = 40340,
    level = 8,
    item_cost = [13000,4],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 160,
    des = "首领土狼用头部撞击敌人，造成{a}%攻击的伤害",
    character_a = "1608",
    character_b = "",
    character_c = "",
    fightForce = 5700
    };
getRow(40340,9)->
    #pet_skills_upgradingCfg {
    skill_id = 40340,
    level = 9,
    item_cost = [13000,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 180,
    des = "首领土狼用头部撞击敌人，造成{a}%攻击的伤害",
    character_a = "1728",
    character_b = "",
    character_c = "",
    fightForce = 7200
    };
getRow(40340,10)->
    #pet_skills_upgradingCfg {
    skill_id = 40340,
    level = 10,
    item_cost = [13000,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 200,
    des = "首领土狼用头部撞击敌人，造成{a}%攻击的伤害",
    character_a = "1848",
    character_b = "",
    character_c = "",
    fightForce = 8700
    };
getRow(40340,11)->
    #pet_skills_upgradingCfg {
    skill_id = 40340,
    level = 11,
    item_cost = [13000,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 200,
    des = "首领土狼用头部撞击敌人，造成{a}%攻击的伤害",
    character_a = "1968",
    character_b = "",
    character_c = "",
    fightForce = 10200
    };
getRow(40341,1)->
    #pet_skills_upgradingCfg {
    skill_id = 40341,
    level = 1,
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "朝前方扇形区域连续发起3次爪击，每次造成{a}%攻击的伤害",
    character_a = "320",
    character_b = "",
    character_c = "",
    fightForce = 0
    };
getRow(40341,2)->
    #pet_skills_upgradingCfg {
    skill_id = 40341,
    level = 2,
    item_cost = [13000,1],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 40,
    des = "朝前方扇形区域连续发起3次爪击，每次造成{a}%攻击的伤害",
    character_a = "367",
    character_b = "",
    character_c = "",
    fightForce = 300
    };
getRow(40341,3)->
    #pet_skills_upgradingCfg {
    skill_id = 40341,
    level = 3,
    item_cost = [13000,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 60,
    des = "朝前方扇形区域连续发起3次爪击，每次造成{a}%攻击的伤害",
    character_a = "414",
    character_b = "",
    character_c = "",
    fightForce = 900
    };
getRow(40341,4)->
    #pet_skills_upgradingCfg {
    skill_id = 40341,
    level = 4,
    item_cost = [13000,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 80,
    des = "朝前方扇形区域连续发起3次爪击，每次造成{a}%攻击的伤害",
    character_a = "461",
    character_b = "",
    character_c = "",
    fightForce = 1500
    };
getRow(40341,5)->
    #pet_skills_upgradingCfg {
    skill_id = 40341,
    level = 5,
    item_cost = [13000,3],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 100,
    des = "朝前方扇形区域连续发起3次爪击，每次造成{a}%攻击的伤害",
    character_a = "508",
    character_b = "",
    character_c = "",
    fightForce = 2400
    };
getRow(40341,6)->
    #pet_skills_upgradingCfg {
    skill_id = 40341,
    level = 6,
    item_cost = [13000,3],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 120,
    des = "朝前方扇形区域连续发起3次爪击，每次造成{a}%攻击的伤害",
    character_a = "555",
    character_b = "",
    character_c = "",
    fightForce = 3300
    };
getRow(40341,7)->
    #pet_skills_upgradingCfg {
    skill_id = 40341,
    level = 7,
    item_cost = [13000,4],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 140,
    des = "朝前方扇形区域连续发起3次爪击，每次造成{a}%攻击的伤害",
    character_a = "602",
    character_b = "",
    character_c = "",
    fightForce = 4500
    };
getRow(40341,8)->
    #pet_skills_upgradingCfg {
    skill_id = 40341,
    level = 8,
    item_cost = [13000,4],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 160,
    des = "朝前方扇形区域连续发起3次爪击，每次造成{a}%攻击的伤害",
    character_a = "649",
    character_b = "",
    character_c = "",
    fightForce = 5700
    };
getRow(40341,9)->
    #pet_skills_upgradingCfg {
    skill_id = 40341,
    level = 9,
    item_cost = [13000,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 180,
    des = "朝前方扇形区域连续发起3次爪击，每次造成{a}%攻击的伤害",
    character_a = "696",
    character_b = "",
    character_c = "",
    fightForce = 7200
    };
getRow(40341,10)->
    #pet_skills_upgradingCfg {
    skill_id = 40341,
    level = 10,
    item_cost = [13000,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 200,
    des = "朝前方扇形区域连续发起3次爪击，每次造成{a}%攻击的伤害",
    character_a = "743",
    character_b = "",
    character_c = "",
    fightForce = 8700
    };
getRow(40341,11)->
    #pet_skills_upgradingCfg {
    skill_id = 40341,
    level = 11,
    item_cost = [13000,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 200,
    des = "朝前方扇形区域连续发起3次爪击，每次造成{a}%攻击的伤害",
    character_a = "790",
    character_b = "",
    character_c = "",
    fightForce = 10200
    };
getRow(40350,1)->
    #pet_skills_upgradingCfg {
    skill_id = 40350,
    level = 1,
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "冲到敌人面前 攻击地方单体，造成{a}%攻击的伤害，受击目标有概率击晕{c}秒",
    character_a = "256",
    character_b = "",
    character_c = "1",
    fightForce = 0
    };
getRow(40350,2)->
    #pet_skills_upgradingCfg {
    skill_id = 40350,
    level = 2,
    item_cost = [13001,1],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 40,
    des = "冲到敌人面前 攻击地方单体，造成{a}%攻击的伤害，受击目标有概率击晕{c}秒",
    character_a = "300",
    character_b = "",
    character_c = "1",
    fightForce = 900
    };
getRow(40350,3)->
    #pet_skills_upgradingCfg {
    skill_id = 40350,
    level = 3,
    item_cost = [13001,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 60,
    des = "冲到敌人面前 攻击地方单体，造成{a}%攻击的伤害，受击目标有概率击晕{c}秒",
    character_a = "344",
    character_b = "",
    character_c = "1",
    fightForce = 2700
    };
getRow(40350,4)->
    #pet_skills_upgradingCfg {
    skill_id = 40350,
    level = 4,
    item_cost = [13001,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 80,
    des = "冲到敌人面前 攻击地方单体，造成{a}%攻击的伤害，受击目标有概率击晕{c}秒",
    character_a = "388",
    character_b = "",
    character_c = "1",
    fightForce = 4500
    };
getRow(40350,5)->
    #pet_skills_upgradingCfg {
    skill_id = 40350,
    level = 5,
    item_cost = [13001,3],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 100,
    des = "冲到敌人面前 攻击地方单体，造成{a}%攻击的伤害，受击目标有概率击晕{c}秒",
    character_a = "432",
    character_b = "",
    character_c = "1",
    fightForce = 7200
    };
getRow(40350,6)->
    #pet_skills_upgradingCfg {
    skill_id = 40350,
    level = 6,
    item_cost = [13001,3],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 120,
    des = "冲到敌人面前 攻击地方单体，造成{a}%攻击的伤害，受击目标有概率击晕{c}秒",
    character_a = "476",
    character_b = "",
    character_c = "1",
    fightForce = 9900
    };
getRow(40350,7)->
    #pet_skills_upgradingCfg {
    skill_id = 40350,
    level = 7,
    item_cost = [13001,4],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 140,
    des = "冲到敌人面前 攻击地方单体，造成{a}%攻击的伤害，受击目标有概率击晕{c}秒",
    character_a = "520",
    character_b = "",
    character_c = "1",
    fightForce = 13500
    };
getRow(40350,8)->
    #pet_skills_upgradingCfg {
    skill_id = 40350,
    level = 8,
    item_cost = [13001,4],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 160,
    des = "冲到敌人面前 攻击地方单体，造成{a}%攻击的伤害，受击目标有概率击晕{c}秒",
    character_a = "564",
    character_b = "",
    character_c = "1",
    fightForce = 17100
    };
getRow(40350,9)->
    #pet_skills_upgradingCfg {
    skill_id = 40350,
    level = 9,
    item_cost = [13001,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 180,
    des = "冲到敌人面前 攻击地方单体，造成{a}%攻击的伤害，受击目标有概率击晕{c}秒",
    character_a = "608",
    character_b = "",
    character_c = "1",
    fightForce = 21600
    };
getRow(40350,10)->
    #pet_skills_upgradingCfg {
    skill_id = 40350,
    level = 10,
    item_cost = [13001,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 200,
    des = "冲到敌人面前 攻击地方单体，造成{a}%攻击的伤害，受击目标有概率击晕{c}秒",
    character_a = "652",
    character_b = "",
    character_c = "1",
    fightForce = 26100
    };
getRow(40350,11)->
    #pet_skills_upgradingCfg {
    skill_id = 40350,
    level = 11,
    item_cost = [13001,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 200,
    des = "冲到敌人面前 攻击地方单体，造成{a}%攻击的伤害，受击目标有概率击晕{c}秒",
    character_a = "696",
    character_b = "",
    character_c = "1",
    fightForce = 30600
    };
getRow(40351,1)->
    #pet_skills_upgradingCfg {
    skill_id = 40351,
    level = 1,
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "变成一个锤子的形状 砸向地面造成前方扇形区域{a}%攻击的伤害，受击目标有概率击晕{c}秒",
    character_a = "576",
    character_b = "",
    character_c = "2",
    fightForce = 0
    };
getRow(40351,2)->
    #pet_skills_upgradingCfg {
    skill_id = 40351,
    level = 2,
    item_cost = [13001,1],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 40,
    des = "变成一个锤子的形状 砸向地面造成前方扇形区域{a}%攻击的伤害，受击目标有概率击晕{c}秒",
    character_a = "677",
    character_b = "",
    character_c = "2",
    fightForce = 900
    };
getRow(40351,3)->
    #pet_skills_upgradingCfg {
    skill_id = 40351,
    level = 3,
    item_cost = [13001,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 60,
    des = "变成一个锤子的形状 砸向地面造成前方扇形区域{a}%攻击的伤害，受击目标有概率击晕{c}秒",
    character_a = "778",
    character_b = "",
    character_c = "2",
    fightForce = 2700
    };
getRow(40351,4)->
    #pet_skills_upgradingCfg {
    skill_id = 40351,
    level = 4,
    item_cost = [13001,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 80,
    des = "变成一个锤子的形状 砸向地面造成前方扇形区域{a}%攻击的伤害，受击目标有概率击晕{c}秒",
    character_a = "879",
    character_b = "",
    character_c = "2",
    fightForce = 4500
    };
getRow(40351,5)->
    #pet_skills_upgradingCfg {
    skill_id = 40351,
    level = 5,
    item_cost = [13001,3],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 100,
    des = "变成一个锤子的形状 砸向地面造成前方扇形区域{a}%攻击的伤害，受击目标有概率击晕{c}秒",
    character_a = "980",
    character_b = "",
    character_c = "2",
    fightForce = 7200
    };
getRow(40351,6)->
    #pet_skills_upgradingCfg {
    skill_id = 40351,
    level = 6,
    item_cost = [13001,3],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 120,
    des = "变成一个锤子的形状 砸向地面造成前方扇形区域{a}%攻击的伤害，受击目标有概率击晕{c}秒",
    character_a = "1081",
    character_b = "",
    character_c = "2",
    fightForce = 9900
    };
getRow(40351,7)->
    #pet_skills_upgradingCfg {
    skill_id = 40351,
    level = 7,
    item_cost = [13001,4],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 140,
    des = "变成一个锤子的形状 砸向地面造成前方扇形区域{a}%攻击的伤害，受击目标有概率击晕{c}秒",
    character_a = "1182",
    character_b = "",
    character_c = "2",
    fightForce = 13500
    };
getRow(40351,8)->
    #pet_skills_upgradingCfg {
    skill_id = 40351,
    level = 8,
    item_cost = [13001,4],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 160,
    des = "变成一个锤子的形状 砸向地面造成前方扇形区域{a}%攻击的伤害，受击目标有概率击晕{c}秒",
    character_a = "1283",
    character_b = "",
    character_c = "2",
    fightForce = 17100
    };
getRow(40351,9)->
    #pet_skills_upgradingCfg {
    skill_id = 40351,
    level = 9,
    item_cost = [13001,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 180,
    des = "变成一个锤子的形状 砸向地面造成前方扇形区域{a}%攻击的伤害，受击目标有概率击晕{c}秒",
    character_a = "1384",
    character_b = "",
    character_c = "2",
    fightForce = 21600
    };
getRow(40351,10)->
    #pet_skills_upgradingCfg {
    skill_id = 40351,
    level = 10,
    item_cost = [13001,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 200,
    des = "变成一个锤子的形状 砸向地面造成前方扇形区域{a}%攻击的伤害，受击目标有概率击晕{c}秒",
    character_a = "1485",
    character_b = "",
    character_c = "2",
    fightForce = 26100
    };
getRow(40351,11)->
    #pet_skills_upgradingCfg {
    skill_id = 40351,
    level = 11,
    item_cost = [13001,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 200,
    des = "变成一个锤子的形状 砸向地面造成前方扇形区域{a}%攻击的伤害，受击目标有概率击晕{c}秒",
    character_a = "1586",
    character_b = "",
    character_c = "2",
    fightForce = 30600
    };
getRow(40352,1)->
    #pet_skills_upgradingCfg {
    skill_id = 40352,
    level = 1,
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "对敌人及其周围目标进行降雨打击，攻击5次，每次造成{a}%攻击的伤害",
    character_a = "192",
    character_b = "",
    character_c = "",
    fightForce = 0
    };
getRow(40352,2)->
    #pet_skills_upgradingCfg {
    skill_id = 40352,
    level = 2,
    item_cost = [13001,1],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 40,
    des = "对敌人及其周围目标进行降雨打击，攻击5次，每次造成{a}%攻击的伤害",
    character_a = "226",
    character_b = "",
    character_c = "",
    fightForce = 900
    };
getRow(40352,3)->
    #pet_skills_upgradingCfg {
    skill_id = 40352,
    level = 3,
    item_cost = [13001,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 60,
    des = "对敌人及其周围目标进行降雨打击，攻击5次，每次造成{a}%攻击的伤害",
    character_a = "260",
    character_b = "",
    character_c = "",
    fightForce = 2700
    };
getRow(40352,4)->
    #pet_skills_upgradingCfg {
    skill_id = 40352,
    level = 4,
    item_cost = [13001,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 80,
    des = "对敌人及其周围目标进行降雨打击，攻击5次，每次造成{a}%攻击的伤害",
    character_a = "294",
    character_b = "",
    character_c = "",
    fightForce = 4500
    };
getRow(40352,5)->
    #pet_skills_upgradingCfg {
    skill_id = 40352,
    level = 5,
    item_cost = [13001,3],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 100,
    des = "对敌人及其周围目标进行降雨打击，攻击5次，每次造成{a}%攻击的伤害",
    character_a = "328",
    character_b = "",
    character_c = "",
    fightForce = 7200
    };
getRow(40352,6)->
    #pet_skills_upgradingCfg {
    skill_id = 40352,
    level = 6,
    item_cost = [13001,3],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 120,
    des = "对敌人及其周围目标进行降雨打击，攻击5次，每次造成{a}%攻击的伤害",
    character_a = "362",
    character_b = "",
    character_c = "",
    fightForce = 9900
    };
getRow(40352,7)->
    #pet_skills_upgradingCfg {
    skill_id = 40352,
    level = 7,
    item_cost = [13001,4],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 140,
    des = "对敌人及其周围目标进行降雨打击，攻击5次，每次造成{a}%攻击的伤害",
    character_a = "396",
    character_b = "",
    character_c = "",
    fightForce = 13500
    };
getRow(40352,8)->
    #pet_skills_upgradingCfg {
    skill_id = 40352,
    level = 8,
    item_cost = [13001,4],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 160,
    des = "对敌人及其周围目标进行降雨打击，攻击5次，每次造成{a}%攻击的伤害",
    character_a = "430",
    character_b = "",
    character_c = "",
    fightForce = 17100
    };
getRow(40352,9)->
    #pet_skills_upgradingCfg {
    skill_id = 40352,
    level = 9,
    item_cost = [13001,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 180,
    des = "对敌人及其周围目标进行降雨打击，攻击5次，每次造成{a}%攻击的伤害",
    character_a = "464",
    character_b = "",
    character_c = "",
    fightForce = 21600
    };
getRow(40352,10)->
    #pet_skills_upgradingCfg {
    skill_id = 40352,
    level = 10,
    item_cost = [13001,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 200,
    des = "对敌人及其周围目标进行降雨打击，攻击5次，每次造成{a}%攻击的伤害",
    character_a = "498",
    character_b = "",
    character_c = "",
    fightForce = 26100
    };
getRow(40352,11)->
    #pet_skills_upgradingCfg {
    skill_id = 40352,
    level = 11,
    item_cost = [13001,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 200,
    des = "对敌人及其周围目标进行降雨打击，攻击5次，每次造成{a}%攻击的伤害",
    character_a = "532",
    character_b = "",
    character_c = "",
    fightForce = 30600
    };
getRow(40360,1)->
    #pet_skills_upgradingCfg {
    skill_id = 40360,
    level = 1,
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "攻击前方扇形敌人，造成{a}%攻击的伤害，并降低主目标{b}%攻击",
    character_a = "726",
    character_b = "3",
    character_c = "5",
    fightForce = 0
    };
getRow(40360,2)->
    #pet_skills_upgradingCfg {
    skill_id = 40360,
    level = 2,
    item_cost = [13001,1],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 40,
    des = "攻击前方扇形敌人，造成{a}%攻击的伤害，并降低主目标{b}%攻击",
    character_a = "851",
    character_b = "3.3",
    character_c = "5",
    fightForce = 900
    };
getRow(40360,3)->
    #pet_skills_upgradingCfg {
    skill_id = 40360,
    level = 3,
    item_cost = [13001,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 60,
    des = "攻击前方扇形敌人，造成{a}%攻击的伤害，并降低主目标{b}%攻击",
    character_a = "976",
    character_b = "3.6",
    character_c = "5",
    fightForce = 2700
    };
getRow(40360,4)->
    #pet_skills_upgradingCfg {
    skill_id = 40360,
    level = 4,
    item_cost = [13001,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 80,
    des = "攻击前方扇形敌人，造成{a}%攻击的伤害，并降低主目标{b}%攻击",
    character_a = "1101",
    character_b = "3.9",
    character_c = "5",
    fightForce = 4500
    };
getRow(40360,5)->
    #pet_skills_upgradingCfg {
    skill_id = 40360,
    level = 5,
    item_cost = [13001,3],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 100,
    des = "攻击前方扇形敌人，造成{a}%攻击的伤害，并降低主目标{b}%攻击",
    character_a = "1226",
    character_b = "4.2",
    character_c = "5",
    fightForce = 7200
    };
getRow(40360,6)->
    #pet_skills_upgradingCfg {
    skill_id = 40360,
    level = 6,
    item_cost = [13001,3],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 120,
    des = "攻击前方扇形敌人，造成{a}%攻击的伤害，并降低主目标{b}%攻击",
    character_a = "1351",
    character_b = "4.5",
    character_c = "5",
    fightForce = 9900
    };
getRow(40360,7)->
    #pet_skills_upgradingCfg {
    skill_id = 40360,
    level = 7,
    item_cost = [13001,4],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 140,
    des = "攻击前方扇形敌人，造成{a}%攻击的伤害，并降低主目标{b}%攻击",
    character_a = "1476",
    character_b = "4.8",
    character_c = "5",
    fightForce = 13500
    };
getRow(40360,8)->
    #pet_skills_upgradingCfg {
    skill_id = 40360,
    level = 8,
    item_cost = [13001,4],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 160,
    des = "攻击前方扇形敌人，造成{a}%攻击的伤害，并降低主目标{b}%攻击",
    character_a = "1601",
    character_b = "5.1",
    character_c = "5",
    fightForce = 17100
    };
getRow(40360,9)->
    #pet_skills_upgradingCfg {
    skill_id = 40360,
    level = 9,
    item_cost = [13001,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 180,
    des = "攻击前方扇形敌人，造成{a}%攻击的伤害，并降低主目标{b}%攻击",
    character_a = "1726",
    character_b = "5.4",
    character_c = "5",
    fightForce = 21600
    };
getRow(40360,10)->
    #pet_skills_upgradingCfg {
    skill_id = 40360,
    level = 10,
    item_cost = [13001,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 200,
    des = "攻击前方扇形敌人，造成{a}%攻击的伤害，并降低主目标{b}%攻击",
    character_a = "1851",
    character_b = "5.7",
    character_c = "5",
    fightForce = 26100
    };
getRow(40360,11)->
    #pet_skills_upgradingCfg {
    skill_id = 40360,
    level = 11,
    item_cost = [13001,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 200,
    des = "攻击前方扇形敌人，造成{a}%攻击的伤害，并降低主目标{b}%攻击",
    character_a = "1976",
    character_b = "6",
    character_c = "5",
    fightForce = 30600
    };
getRow(40361,1)->
    #pet_skills_upgradingCfg {
    skill_id = 40361,
    level = 1,
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "主人免疫控制效果，持续{c}秒",
    character_a = "756",
    character_b = "",
    character_c = "3",
    fightForce = 0
    };
getRow(40361,2)->
    #pet_skills_upgradingCfg {
    skill_id = 40361,
    level = 2,
    item_cost = [13001,1],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 40,
    des = "主人免疫控制效果，持续{c}秒",
    character_a = "888",
    character_b = "",
    character_c = "4",
    fightForce = 900
    };
getRow(40361,3)->
    #pet_skills_upgradingCfg {
    skill_id = 40361,
    level = 3,
    item_cost = [13001,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 60,
    des = "主人免疫控制效果，持续{c}秒",
    character_a = "1020",
    character_b = "",
    character_c = "5",
    fightForce = 2700
    };
getRow(40361,4)->
    #pet_skills_upgradingCfg {
    skill_id = 40361,
    level = 4,
    item_cost = [13001,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 80,
    des = "主人免疫控制效果，持续{c}秒",
    character_a = "1152",
    character_b = "",
    character_c = "6",
    fightForce = 4500
    };
getRow(40361,5)->
    #pet_skills_upgradingCfg {
    skill_id = 40361,
    level = 5,
    item_cost = [13001,3],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 100,
    des = "主人免疫控制效果，持续{c}秒",
    character_a = "1284",
    character_b = "",
    character_c = "7",
    fightForce = 7200
    };
getRow(40361,6)->
    #pet_skills_upgradingCfg {
    skill_id = 40361,
    level = 6,
    item_cost = [13001,3],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 120,
    des = "主人免疫控制效果，持续{c}秒",
    character_a = "1416",
    character_b = "",
    character_c = "8",
    fightForce = 9900
    };
getRow(40361,7)->
    #pet_skills_upgradingCfg {
    skill_id = 40361,
    level = 7,
    item_cost = [13001,4],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 140,
    des = "主人免疫控制效果，持续{c}秒",
    character_a = "1548",
    character_b = "",
    character_c = "9",
    fightForce = 13500
    };
getRow(40361,8)->
    #pet_skills_upgradingCfg {
    skill_id = 40361,
    level = 8,
    item_cost = [13001,4],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 160,
    des = "主人免疫控制效果，持续{c}秒",
    character_a = "1680",
    character_b = "",
    character_c = "10",
    fightForce = 17100
    };
getRow(40361,9)->
    #pet_skills_upgradingCfg {
    skill_id = 40361,
    level = 9,
    item_cost = [13001,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 180,
    des = "主人免疫控制效果，持续{c}秒",
    character_a = "1812",
    character_b = "",
    character_c = "11",
    fightForce = 21600
    };
getRow(40361,10)->
    #pet_skills_upgradingCfg {
    skill_id = 40361,
    level = 10,
    item_cost = [13001,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 200,
    des = "主人免疫控制效果，持续{c}秒",
    character_a = "1944",
    character_b = "",
    character_c = "12",
    fightForce = 26100
    };
getRow(40361,11)->
    #pet_skills_upgradingCfg {
    skill_id = 40361,
    level = 11,
    item_cost = [13001,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 200,
    des = "主人免疫控制效果，持续{c}秒",
    character_a = "2076",
    character_b = "",
    character_c = "13",
    fightForce = 30600
    };
getRow(40362,1)->
    #pet_skills_upgradingCfg {
    skill_id = 40362,
    level = 1,
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "攻击敌人及其周围目标，造成{a}%攻击的伤害，移动速度降低{b}%，防御降低{b}%",
    character_a = "907",
    character_b = "10",
    character_c = "5",
    fightForce = 0
    };
getRow(40362,2)->
    #pet_skills_upgradingCfg {
    skill_id = 40362,
    level = 2,
    item_cost = [13001,1],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 40,
    des = "攻击敌人及其周围目标，造成{a}%攻击的伤害，移动速度降低{b}%，防御降低{b}%",
    character_a = "1068",
    character_b = "11",
    character_c = "5",
    fightForce = 900
    };
getRow(40362,3)->
    #pet_skills_upgradingCfg {
    skill_id = 40362,
    level = 3,
    item_cost = [13001,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 60,
    des = "攻击敌人及其周围目标，造成{a}%攻击的伤害，移动速度降低{b}%，防御降低{b}%",
    character_a = "1229",
    character_b = "12",
    character_c = "5",
    fightForce = 2700
    };
getRow(40362,4)->
    #pet_skills_upgradingCfg {
    skill_id = 40362,
    level = 4,
    item_cost = [13001,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 80,
    des = "攻击敌人及其周围目标，造成{a}%攻击的伤害，移动速度降低{b}%，防御降低{b}%",
    character_a = "1390",
    character_b = "13",
    character_c = "5",
    fightForce = 4500
    };
getRow(40362,5)->
    #pet_skills_upgradingCfg {
    skill_id = 40362,
    level = 5,
    item_cost = [13001,3],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 100,
    des = "攻击敌人及其周围目标，造成{a}%攻击的伤害，移动速度降低{b}%，防御降低{b}%",
    character_a = "1551",
    character_b = "14",
    character_c = "5",
    fightForce = 7200
    };
getRow(40362,6)->
    #pet_skills_upgradingCfg {
    skill_id = 40362,
    level = 6,
    item_cost = [13001,3],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 120,
    des = "攻击敌人及其周围目标，造成{a}%攻击的伤害，移动速度降低{b}%，防御降低{b}%",
    character_a = "1712",
    character_b = "15",
    character_c = "5",
    fightForce = 9900
    };
getRow(40362,7)->
    #pet_skills_upgradingCfg {
    skill_id = 40362,
    level = 7,
    item_cost = [13001,4],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 140,
    des = "攻击敌人及其周围目标，造成{a}%攻击的伤害，移动速度降低{b}%，防御降低{b}%",
    character_a = "1873",
    character_b = "16",
    character_c = "5",
    fightForce = 13500
    };
getRow(40362,8)->
    #pet_skills_upgradingCfg {
    skill_id = 40362,
    level = 8,
    item_cost = [13001,4],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 160,
    des = "攻击敌人及其周围目标，造成{a}%攻击的伤害，移动速度降低{b}%，防御降低{b}%",
    character_a = "2034",
    character_b = "17",
    character_c = "5",
    fightForce = 17100
    };
getRow(40362,9)->
    #pet_skills_upgradingCfg {
    skill_id = 40362,
    level = 9,
    item_cost = [13001,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 180,
    des = "攻击敌人及其周围目标，造成{a}%攻击的伤害，移动速度降低{b}%，防御降低{b}%",
    character_a = "2195",
    character_b = "18",
    character_c = "5",
    fightForce = 21600
    };
getRow(40362,10)->
    #pet_skills_upgradingCfg {
    skill_id = 40362,
    level = 10,
    item_cost = [13001,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 200,
    des = "攻击敌人及其周围目标，造成{a}%攻击的伤害，移动速度降低{b}%，防御降低{b}%",
    character_a = "2356",
    character_b = "19",
    character_c = "5",
    fightForce = 26100
    };
getRow(40362,11)->
    #pet_skills_upgradingCfg {
    skill_id = 40362,
    level = 11,
    item_cost = [13001,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 200,
    des = "攻击敌人及其周围目标，造成{a}%攻击的伤害，移动速度降低{b}%，防御降低{b}%",
    character_a = "2517",
    character_b = "20",
    character_c = "5",
    fightForce = 30600
    };
getRow(40370,1)->
    #pet_skills_upgradingCfg {
    skill_id = 40370,
    level = 1,
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "攻击前方单体敌人，造成{a}%攻击的伤害",
    character_a = "384",
    character_b = "",
    character_c = "",
    fightForce = 0
    };
getRow(40370,2)->
    #pet_skills_upgradingCfg {
    skill_id = 40370,
    level = 2,
    item_cost = [13001,1],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 40,
    des = "攻击前方单体敌人，造成{a}%攻击的伤害",
    character_a = "450",
    character_b = "",
    character_c = "",
    fightForce = 900
    };
getRow(40370,3)->
    #pet_skills_upgradingCfg {
    skill_id = 40370,
    level = 3,
    item_cost = [13001,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 60,
    des = "攻击前方单体敌人，造成{a}%攻击的伤害",
    character_a = "516",
    character_b = "",
    character_c = "",
    fightForce = 2700
    };
getRow(40370,4)->
    #pet_skills_upgradingCfg {
    skill_id = 40370,
    level = 4,
    item_cost = [13001,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 80,
    des = "攻击前方单体敌人，造成{a}%攻击的伤害",
    character_a = "582",
    character_b = "",
    character_c = "",
    fightForce = 4500
    };
getRow(40370,5)->
    #pet_skills_upgradingCfg {
    skill_id = 40370,
    level = 5,
    item_cost = [13001,3],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 100,
    des = "攻击前方单体敌人，造成{a}%攻击的伤害",
    character_a = "648",
    character_b = "",
    character_c = "",
    fightForce = 7200
    };
getRow(40370,6)->
    #pet_skills_upgradingCfg {
    skill_id = 40370,
    level = 6,
    item_cost = [13001,3],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 120,
    des = "攻击前方单体敌人，造成{a}%攻击的伤害",
    character_a = "714",
    character_b = "",
    character_c = "",
    fightForce = 9900
    };
getRow(40370,7)->
    #pet_skills_upgradingCfg {
    skill_id = 40370,
    level = 7,
    item_cost = [13001,4],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 140,
    des = "攻击前方单体敌人，造成{a}%攻击的伤害",
    character_a = "780",
    character_b = "",
    character_c = "",
    fightForce = 13500
    };
getRow(40370,8)->
    #pet_skills_upgradingCfg {
    skill_id = 40370,
    level = 8,
    item_cost = [13001,4],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 160,
    des = "攻击前方单体敌人，造成{a}%攻击的伤害",
    character_a = "846",
    character_b = "",
    character_c = "",
    fightForce = 17100
    };
getRow(40370,9)->
    #pet_skills_upgradingCfg {
    skill_id = 40370,
    level = 9,
    item_cost = [13001,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 180,
    des = "攻击前方单体敌人，造成{a}%攻击的伤害",
    character_a = "912",
    character_b = "",
    character_c = "",
    fightForce = 21600
    };
getRow(40370,10)->
    #pet_skills_upgradingCfg {
    skill_id = 40370,
    level = 10,
    item_cost = [13001,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 200,
    des = "攻击前方单体敌人，造成{a}%攻击的伤害",
    character_a = "978",
    character_b = "",
    character_c = "",
    fightForce = 26100
    };
getRow(40370,11)->
    #pet_skills_upgradingCfg {
    skill_id = 40370,
    level = 11,
    item_cost = [13001,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 200,
    des = "攻击前方单体敌人，造成{a}%攻击的伤害",
    character_a = "1044",
    character_b = "",
    character_c = "",
    fightForce = 30600
    };
getRow(40371,1)->
    #pet_skills_upgradingCfg {
    skill_id = 40371,
    level = 1,
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "秃鹫煽动翅膀吹起飓风对前方矩形范围敌人造成{a}%攻击的伤害并减速",
    character_a = "800",
    character_b = "",
    character_c = "",
    fightForce = 0
    };
getRow(40371,2)->
    #pet_skills_upgradingCfg {
    skill_id = 40371,
    level = 2,
    item_cost = [13001,1],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 40,
    des = "秃鹫煽动翅膀吹起飓风对前方矩形范围敌人造成{a}%攻击的伤害并减速",
    character_a = "940",
    character_b = "",
    character_c = "",
    fightForce = 900
    };
getRow(40371,3)->
    #pet_skills_upgradingCfg {
    skill_id = 40371,
    level = 3,
    item_cost = [13001,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 60,
    des = "秃鹫煽动翅膀吹起飓风对前方矩形范围敌人造成{a}%攻击的伤害并减速",
    character_a = "1080",
    character_b = "",
    character_c = "",
    fightForce = 2700
    };
getRow(40371,4)->
    #pet_skills_upgradingCfg {
    skill_id = 40371,
    level = 4,
    item_cost = [13001,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 80,
    des = "秃鹫煽动翅膀吹起飓风对前方矩形范围敌人造成{a}%攻击的伤害并减速",
    character_a = "1220",
    character_b = "",
    character_c = "",
    fightForce = 4500
    };
getRow(40371,5)->
    #pet_skills_upgradingCfg {
    skill_id = 40371,
    level = 5,
    item_cost = [13001,3],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 100,
    des = "秃鹫煽动翅膀吹起飓风对前方矩形范围敌人造成{a}%攻击的伤害并减速",
    character_a = "1360",
    character_b = "",
    character_c = "",
    fightForce = 7200
    };
getRow(40371,6)->
    #pet_skills_upgradingCfg {
    skill_id = 40371,
    level = 6,
    item_cost = [13001,3],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 120,
    des = "秃鹫煽动翅膀吹起飓风对前方矩形范围敌人造成{a}%攻击的伤害并减速",
    character_a = "1500",
    character_b = "",
    character_c = "",
    fightForce = 9900
    };
getRow(40371,7)->
    #pet_skills_upgradingCfg {
    skill_id = 40371,
    level = 7,
    item_cost = [13001,4],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 140,
    des = "秃鹫煽动翅膀吹起飓风对前方矩形范围敌人造成{a}%攻击的伤害并减速",
    character_a = "1640",
    character_b = "",
    character_c = "",
    fightForce = 13500
    };
getRow(40371,8)->
    #pet_skills_upgradingCfg {
    skill_id = 40371,
    level = 8,
    item_cost = [13001,4],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 160,
    des = "秃鹫煽动翅膀吹起飓风对前方矩形范围敌人造成{a}%攻击的伤害并减速",
    character_a = "1780",
    character_b = "",
    character_c = "",
    fightForce = 17100
    };
getRow(40371,9)->
    #pet_skills_upgradingCfg {
    skill_id = 40371,
    level = 9,
    item_cost = [13001,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 180,
    des = "秃鹫煽动翅膀吹起飓风对前方矩形范围敌人造成{a}%攻击的伤害并减速",
    character_a = "1920",
    character_b = "",
    character_c = "",
    fightForce = 21600
    };
getRow(40371,10)->
    #pet_skills_upgradingCfg {
    skill_id = 40371,
    level = 10,
    item_cost = [13001,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 200,
    des = "秃鹫煽动翅膀吹起飓风对前方矩形范围敌人造成{a}%攻击的伤害并减速",
    character_a = "2060",
    character_b = "",
    character_c = "",
    fightForce = 26100
    };
getRow(40371,11)->
    #pet_skills_upgradingCfg {
    skill_id = 40371,
    level = 11,
    item_cost = [13001,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 200,
    des = "秃鹫煽动翅膀吹起飓风对前方矩形范围敌人造成{a}%攻击的伤害并减速",
    character_a = "2200",
    character_b = "",
    character_c = "",
    fightForce = 30600
    };
getRow(40372,1)->
    #pet_skills_upgradingCfg {
    skill_id = 40372,
    level = 1,
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "秃鹫朝上方起飞小段后朝下俯冲，造成{a}%攻击的范围伤害，并沉默{c}秒",
    character_a = "224",
    character_b = "",
    character_c = "3",
    fightForce = 0
    };
getRow(40372,2)->
    #pet_skills_upgradingCfg {
    skill_id = 40372,
    level = 2,
    item_cost = [13001,1],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 40,
    des = "秃鹫朝上方起飞小段后朝下俯冲，造成{a}%攻击的范围伤害，并沉默{c}秒",
    character_a = "264",
    character_b = "",
    character_c = "3",
    fightForce = 900
    };
getRow(40372,3)->
    #pet_skills_upgradingCfg {
    skill_id = 40372,
    level = 3,
    item_cost = [13001,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 60,
    des = "秃鹫朝上方起飞小段后朝下俯冲，造成{a}%攻击的范围伤害，并沉默{c}秒",
    character_a = "304",
    character_b = "",
    character_c = "3",
    fightForce = 2700
    };
getRow(40372,4)->
    #pet_skills_upgradingCfg {
    skill_id = 40372,
    level = 4,
    item_cost = [13001,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 80,
    des = "秃鹫朝上方起飞小段后朝下俯冲，造成{a}%攻击的范围伤害，并沉默{c}秒",
    character_a = "344",
    character_b = "",
    character_c = "3",
    fightForce = 4500
    };
getRow(40372,5)->
    #pet_skills_upgradingCfg {
    skill_id = 40372,
    level = 5,
    item_cost = [13001,3],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 100,
    des = "秃鹫朝上方起飞小段后朝下俯冲，造成{a}%攻击的范围伤害，并沉默{c}秒",
    character_a = "384",
    character_b = "",
    character_c = "3",
    fightForce = 7200
    };
getRow(40372,6)->
    #pet_skills_upgradingCfg {
    skill_id = 40372,
    level = 6,
    item_cost = [13001,3],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 120,
    des = "秃鹫朝上方起飞小段后朝下俯冲，造成{a}%攻击的范围伤害，并沉默{c}秒",
    character_a = "424",
    character_b = "",
    character_c = "3",
    fightForce = 9900
    };
getRow(40372,7)->
    #pet_skills_upgradingCfg {
    skill_id = 40372,
    level = 7,
    item_cost = [13001,4],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 140,
    des = "秃鹫朝上方起飞小段后朝下俯冲，造成{a}%攻击的范围伤害，并沉默{c}秒",
    character_a = "464",
    character_b = "",
    character_c = "3",
    fightForce = 13500
    };
getRow(40372,8)->
    #pet_skills_upgradingCfg {
    skill_id = 40372,
    level = 8,
    item_cost = [13001,4],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 160,
    des = "秃鹫朝上方起飞小段后朝下俯冲，造成{a}%攻击的范围伤害，并沉默{c}秒",
    character_a = "504",
    character_b = "",
    character_c = "3",
    fightForce = 17100
    };
getRow(40372,9)->
    #pet_skills_upgradingCfg {
    skill_id = 40372,
    level = 9,
    item_cost = [13001,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 180,
    des = "秃鹫朝上方起飞小段后朝下俯冲，造成{a}%攻击的范围伤害，并沉默{c}秒",
    character_a = "544",
    character_b = "",
    character_c = "3",
    fightForce = 21600
    };
getRow(40372,10)->
    #pet_skills_upgradingCfg {
    skill_id = 40372,
    level = 10,
    item_cost = [13001,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 200,
    des = "秃鹫朝上方起飞小段后朝下俯冲，造成{a}%攻击的范围伤害，并沉默{c}秒",
    character_a = "584",
    character_b = "",
    character_c = "3",
    fightForce = 26100
    };
getRow(40372,11)->
    #pet_skills_upgradingCfg {
    skill_id = 40372,
    level = 11,
    item_cost = [13001,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 200,
    des = "秃鹫朝上方起飞小段后朝下俯冲，造成{a}%攻击的范围伤害，并沉默{c}秒",
    character_a = "624",
    character_b = "",
    character_c = "3",
    fightForce = 30600
    };
getRow(40380,1)->
    #pet_skills_upgradingCfg {
    skill_id = 40380,
    level = 1,
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "攻击前方单体敌人，造成{a}%攻击的伤害",
    character_a = "326",
    character_b = "",
    character_c = "",
    fightForce = 0
    };
getRow(40380,2)->
    #pet_skills_upgradingCfg {
    skill_id = 40380,
    level = 2,
    item_cost = [13002,1],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 40,
    des = "攻击前方单体敌人，造成{a}%攻击的伤害",
    character_a = "392",
    character_b = "",
    character_c = "",
    fightForce = 1800
    };
getRow(40380,3)->
    #pet_skills_upgradingCfg {
    skill_id = 40380,
    level = 3,
    item_cost = [13002,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 60,
    des = "攻击前方单体敌人，造成{a}%攻击的伤害",
    character_a = "458",
    character_b = "",
    character_c = "",
    fightForce = 5400
    };
getRow(40380,4)->
    #pet_skills_upgradingCfg {
    skill_id = 40380,
    level = 4,
    item_cost = [13002,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 80,
    des = "攻击前方单体敌人，造成{a}%攻击的伤害",
    character_a = "524",
    character_b = "",
    character_c = "",
    fightForce = 9000
    };
getRow(40380,5)->
    #pet_skills_upgradingCfg {
    skill_id = 40380,
    level = 5,
    item_cost = [13002,3],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 100,
    des = "攻击前方单体敌人，造成{a}%攻击的伤害",
    character_a = "590",
    character_b = "",
    character_c = "",
    fightForce = 14400
    };
getRow(40380,6)->
    #pet_skills_upgradingCfg {
    skill_id = 40380,
    level = 6,
    item_cost = [13002,3],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 120,
    des = "攻击前方单体敌人，造成{a}%攻击的伤害",
    character_a = "656",
    character_b = "",
    character_c = "",
    fightForce = 19800
    };
getRow(40380,7)->
    #pet_skills_upgradingCfg {
    skill_id = 40380,
    level = 7,
    item_cost = [13002,4],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 140,
    des = "攻击前方单体敌人，造成{a}%攻击的伤害",
    character_a = "722",
    character_b = "",
    character_c = "",
    fightForce = 27000
    };
getRow(40380,8)->
    #pet_skills_upgradingCfg {
    skill_id = 40380,
    level = 8,
    item_cost = [13002,4],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 160,
    des = "攻击前方单体敌人，造成{a}%攻击的伤害",
    character_a = "788",
    character_b = "",
    character_c = "",
    fightForce = 34200
    };
getRow(40380,9)->
    #pet_skills_upgradingCfg {
    skill_id = 40380,
    level = 9,
    item_cost = [13002,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 180,
    des = "攻击前方单体敌人，造成{a}%攻击的伤害",
    character_a = "854",
    character_b = "",
    character_c = "",
    fightForce = 43200
    };
getRow(40380,10)->
    #pet_skills_upgradingCfg {
    skill_id = 40380,
    level = 10,
    item_cost = [13002,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 200,
    des = "攻击前方单体敌人，造成{a}%攻击的伤害",
    character_a = "920",
    character_b = "",
    character_c = "",
    fightForce = 52200
    };
getRow(40380,11)->
    #pet_skills_upgradingCfg {
    skill_id = 40380,
    level = 11,
    item_cost = [13002,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 200,
    des = "攻击前方单体敌人，造成{a}%攻击的伤害",
    character_a = "986",
    character_b = "",
    character_c = "",
    fightForce = 61200
    };
getRow(40381,1)->
    #pet_skills_upgradingCfg {
    skill_id = 40381,
    level = 1,
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "大幅度增加主人攻击力{b}%，持续{c}秒",
    character_a = "680",
    character_b = "5",
    character_c = "5",
    fightForce = 0
    };
getRow(40381,2)->
    #pet_skills_upgradingCfg {
    skill_id = 40381,
    level = 2,
    item_cost = [13002,1],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 40,
    des = "大幅度增加主人攻击力{b}%，持续{c}秒",
    character_a = "816",
    character_b = "5.5",
    character_c = "5",
    fightForce = 1800
    };
getRow(40381,3)->
    #pet_skills_upgradingCfg {
    skill_id = 40381,
    level = 3,
    item_cost = [13002,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 60,
    des = "大幅度增加主人攻击力{b}%，持续{c}秒",
    character_a = "952",
    character_b = "6",
    character_c = "5",
    fightForce = 5400
    };
getRow(40381,4)->
    #pet_skills_upgradingCfg {
    skill_id = 40381,
    level = 4,
    item_cost = [13002,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 80,
    des = "大幅度增加主人攻击力{b}%，持续{c}秒",
    character_a = "1088",
    character_b = "6.5",
    character_c = "5",
    fightForce = 9000
    };
getRow(40381,5)->
    #pet_skills_upgradingCfg {
    skill_id = 40381,
    level = 5,
    item_cost = [13002,3],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 100,
    des = "大幅度增加主人攻击力{b}%，持续{c}秒",
    character_a = "1224",
    character_b = "7",
    character_c = "5",
    fightForce = 14400
    };
getRow(40381,6)->
    #pet_skills_upgradingCfg {
    skill_id = 40381,
    level = 6,
    item_cost = [13002,3],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 120,
    des = "大幅度增加主人攻击力{b}%，持续{c}秒",
    character_a = "1360",
    character_b = "7.5",
    character_c = "5",
    fightForce = 19800
    };
getRow(40381,7)->
    #pet_skills_upgradingCfg {
    skill_id = 40381,
    level = 7,
    item_cost = [13002,4],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 140,
    des = "大幅度增加主人攻击力{b}%，持续{c}秒",
    character_a = "1496",
    character_b = "8",
    character_c = "5",
    fightForce = 27000
    };
getRow(40381,8)->
    #pet_skills_upgradingCfg {
    skill_id = 40381,
    level = 8,
    item_cost = [13002,4],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 160,
    des = "大幅度增加主人攻击力{b}%，持续{c}秒",
    character_a = "1632",
    character_b = "8.5",
    character_c = "5",
    fightForce = 34200
    };
getRow(40381,9)->
    #pet_skills_upgradingCfg {
    skill_id = 40381,
    level = 9,
    item_cost = [13002,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 180,
    des = "大幅度增加主人攻击力{b}%，持续{c}秒",
    character_a = "1768",
    character_b = "9",
    character_c = "5",
    fightForce = 43200
    };
getRow(40381,10)->
    #pet_skills_upgradingCfg {
    skill_id = 40381,
    level = 10,
    item_cost = [13002,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 200,
    des = "大幅度增加主人攻击力{b}%，持续{c}秒",
    character_a = "1904",
    character_b = "9.5",
    character_c = "5",
    fightForce = 52200
    };
getRow(40381,11)->
    #pet_skills_upgradingCfg {
    skill_id = 40381,
    level = 11,
    item_cost = [13002,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 200,
    des = "大幅度增加主人攻击力{b}%，持续{c}秒",
    character_a = "2040",
    character_b = "10",
    character_c = "5",
    fightForce = 61200
    };
getRow(40382,1)->
    #pet_skills_upgradingCfg {
    skill_id = 40382,
    level = 1,
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "攻击前方10米范围内敌方5次，每次造成{a}%攻击的伤害",
    character_a = "163",
    character_b = "",
    character_c = "",
    fightForce = 0
    };
getRow(40382,2)->
    #pet_skills_upgradingCfg {
    skill_id = 40382,
    level = 2,
    item_cost = [13002,1],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 40,
    des = "攻击前方10米范围内敌方5次，每次造成{a}%攻击的伤害",
    character_a = "195",
    character_b = "",
    character_c = "",
    fightForce = 1800
    };
getRow(40382,3)->
    #pet_skills_upgradingCfg {
    skill_id = 40382,
    level = 3,
    item_cost = [13002,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 60,
    des = "攻击前方10米范围内敌方5次，每次造成{a}%攻击的伤害",
    character_a = "227",
    character_b = "",
    character_c = "",
    fightForce = 5400
    };
getRow(40382,4)->
    #pet_skills_upgradingCfg {
    skill_id = 40382,
    level = 4,
    item_cost = [13002,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 80,
    des = "攻击前方10米范围内敌方5次，每次造成{a}%攻击的伤害",
    character_a = "259",
    character_b = "",
    character_c = "",
    fightForce = 9000
    };
getRow(40382,5)->
    #pet_skills_upgradingCfg {
    skill_id = 40382,
    level = 5,
    item_cost = [13002,3],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 100,
    des = "攻击前方10米范围内敌方5次，每次造成{a}%攻击的伤害",
    character_a = "291",
    character_b = "",
    character_c = "",
    fightForce = 14400
    };
getRow(40382,6)->
    #pet_skills_upgradingCfg {
    skill_id = 40382,
    level = 6,
    item_cost = [13002,3],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 120,
    des = "攻击前方10米范围内敌方5次，每次造成{a}%攻击的伤害",
    character_a = "323",
    character_b = "",
    character_c = "",
    fightForce = 19800
    };
getRow(40382,7)->
    #pet_skills_upgradingCfg {
    skill_id = 40382,
    level = 7,
    item_cost = [13002,4],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 140,
    des = "攻击前方10米范围内敌方5次，每次造成{a}%攻击的伤害",
    character_a = "355",
    character_b = "",
    character_c = "",
    fightForce = 27000
    };
getRow(40382,8)->
    #pet_skills_upgradingCfg {
    skill_id = 40382,
    level = 8,
    item_cost = [13002,4],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 160,
    des = "攻击前方10米范围内敌方5次，每次造成{a}%攻击的伤害",
    character_a = "387",
    character_b = "",
    character_c = "",
    fightForce = 34200
    };
getRow(40382,9)->
    #pet_skills_upgradingCfg {
    skill_id = 40382,
    level = 9,
    item_cost = [13002,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 180,
    des = "攻击前方10米范围内敌方5次，每次造成{a}%攻击的伤害",
    character_a = "419",
    character_b = "",
    character_c = "",
    fightForce = 43200
    };
getRow(40382,10)->
    #pet_skills_upgradingCfg {
    skill_id = 40382,
    level = 10,
    item_cost = [13002,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 200,
    des = "攻击前方10米范围内敌方5次，每次造成{a}%攻击的伤害",
    character_a = "451",
    character_b = "",
    character_c = "",
    fightForce = 52200
    };
getRow(40382,11)->
    #pet_skills_upgradingCfg {
    skill_id = 40382,
    level = 11,
    item_cost = [13002,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 200,
    des = "攻击前方10米范围内敌方5次，每次造成{a}%攻击的伤害",
    character_a = "483",
    character_b = "",
    character_c = "",
    fightForce = 61200
    };
getRow(40390,1)->
    #pet_skills_upgradingCfg {
    skill_id = 40390,
    level = 1,
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "攻击前方单体敌人，造成{a}%攻击的伤害",
    character_a = "320",
    character_b = "",
    character_c = "",
    fightForce = 0
    };
getRow(40390,2)->
    #pet_skills_upgradingCfg {
    skill_id = 40390,
    level = 2,
    item_cost = [13001,1],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 40,
    des = "攻击前方单体敌人，造成{a}%攻击的伤害",
    character_a = "375",
    character_b = "",
    character_c = "",
    fightForce = 900
    };
getRow(40390,3)->
    #pet_skills_upgradingCfg {
    skill_id = 40390,
    level = 3,
    item_cost = [13001,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 60,
    des = "攻击前方单体敌人，造成{a}%攻击的伤害",
    character_a = "430",
    character_b = "",
    character_c = "",
    fightForce = 2700
    };
getRow(40390,4)->
    #pet_skills_upgradingCfg {
    skill_id = 40390,
    level = 4,
    item_cost = [13001,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 80,
    des = "攻击前方单体敌人，造成{a}%攻击的伤害",
    character_a = "485",
    character_b = "",
    character_c = "",
    fightForce = 4500
    };
getRow(40390,5)->
    #pet_skills_upgradingCfg {
    skill_id = 40390,
    level = 5,
    item_cost = [13001,3],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 100,
    des = "攻击前方单体敌人，造成{a}%攻击的伤害",
    character_a = "540",
    character_b = "",
    character_c = "",
    fightForce = 7200
    };
getRow(40390,6)->
    #pet_skills_upgradingCfg {
    skill_id = 40390,
    level = 6,
    item_cost = [13001,3],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 120,
    des = "攻击前方单体敌人，造成{a}%攻击的伤害",
    character_a = "595",
    character_b = "",
    character_c = "",
    fightForce = 9900
    };
getRow(40390,7)->
    #pet_skills_upgradingCfg {
    skill_id = 40390,
    level = 7,
    item_cost = [13001,4],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 140,
    des = "攻击前方单体敌人，造成{a}%攻击的伤害",
    character_a = "650",
    character_b = "",
    character_c = "",
    fightForce = 13500
    };
getRow(40390,8)->
    #pet_skills_upgradingCfg {
    skill_id = 40390,
    level = 8,
    item_cost = [13001,4],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 160,
    des = "攻击前方单体敌人，造成{a}%攻击的伤害",
    character_a = "705",
    character_b = "",
    character_c = "",
    fightForce = 17100
    };
getRow(40390,9)->
    #pet_skills_upgradingCfg {
    skill_id = 40390,
    level = 9,
    item_cost = [13001,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 180,
    des = "攻击前方单体敌人，造成{a}%攻击的伤害",
    character_a = "760",
    character_b = "",
    character_c = "",
    fightForce = 21600
    };
getRow(40390,10)->
    #pet_skills_upgradingCfg {
    skill_id = 40390,
    level = 10,
    item_cost = [13001,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 200,
    des = "攻击前方单体敌人，造成{a}%攻击的伤害",
    character_a = "815",
    character_b = "",
    character_c = "",
    fightForce = 26100
    };
getRow(40390,11)->
    #pet_skills_upgradingCfg {
    skill_id = 40390,
    level = 11,
    item_cost = [13001,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 200,
    des = "攻击前方单体敌人，造成{a}%攻击的伤害",
    character_a = "870",
    character_b = "",
    character_c = "",
    fightForce = 30600
    };
getRow(40391,1)->
    #pet_skills_upgradingCfg {
    skill_id = 40391,
    level = 1,
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "对前方敌人及其周围造成{a}%攻击的范围伤害，并造成群体减速效果",
    character_a = "400",
    character_b = "",
    character_c = "",
    fightForce = 0
    };
getRow(40391,2)->
    #pet_skills_upgradingCfg {
    skill_id = 40391,
    level = 2,
    item_cost = [13001,1],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 40,
    des = "对前方敌人及其周围造成{a}%攻击的范围伤害，并造成群体减速效果",
    character_a = "470",
    character_b = "",
    character_c = "",
    fightForce = 900
    };
getRow(40391,3)->
    #pet_skills_upgradingCfg {
    skill_id = 40391,
    level = 3,
    item_cost = [13001,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 60,
    des = "对前方敌人及其周围造成{a}%攻击的范围伤害，并造成群体减速效果",
    character_a = "540",
    character_b = "",
    character_c = "",
    fightForce = 2700
    };
getRow(40391,4)->
    #pet_skills_upgradingCfg {
    skill_id = 40391,
    level = 4,
    item_cost = [13001,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 80,
    des = "对前方敌人及其周围造成{a}%攻击的范围伤害，并造成群体减速效果",
    character_a = "610",
    character_b = "",
    character_c = "",
    fightForce = 4500
    };
getRow(40391,5)->
    #pet_skills_upgradingCfg {
    skill_id = 40391,
    level = 5,
    item_cost = [13001,3],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 100,
    des = "对前方敌人及其周围造成{a}%攻击的范围伤害，并造成群体减速效果",
    character_a = "680",
    character_b = "",
    character_c = "",
    fightForce = 7200
    };
getRow(40391,6)->
    #pet_skills_upgradingCfg {
    skill_id = 40391,
    level = 6,
    item_cost = [13001,3],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 120,
    des = "对前方敌人及其周围造成{a}%攻击的范围伤害，并造成群体减速效果",
    character_a = "750",
    character_b = "",
    character_c = "",
    fightForce = 9900
    };
getRow(40391,7)->
    #pet_skills_upgradingCfg {
    skill_id = 40391,
    level = 7,
    item_cost = [13001,4],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 140,
    des = "对前方敌人及其周围造成{a}%攻击的范围伤害，并造成群体减速效果",
    character_a = "820",
    character_b = "",
    character_c = "",
    fightForce = 13500
    };
getRow(40391,8)->
    #pet_skills_upgradingCfg {
    skill_id = 40391,
    level = 8,
    item_cost = [13001,4],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 160,
    des = "对前方敌人及其周围造成{a}%攻击的范围伤害，并造成群体减速效果",
    character_a = "890",
    character_b = "",
    character_c = "",
    fightForce = 17100
    };
getRow(40391,9)->
    #pet_skills_upgradingCfg {
    skill_id = 40391,
    level = 9,
    item_cost = [13001,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 180,
    des = "对前方敌人及其周围造成{a}%攻击的范围伤害，并造成群体减速效果",
    character_a = "960",
    character_b = "",
    character_c = "",
    fightForce = 21600
    };
getRow(40391,10)->
    #pet_skills_upgradingCfg {
    skill_id = 40391,
    level = 10,
    item_cost = [13001,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 200,
    des = "对前方敌人及其周围造成{a}%攻击的范围伤害，并造成群体减速效果",
    character_a = "1030",
    character_b = "",
    character_c = "",
    fightForce = 26100
    };
getRow(40391,11)->
    #pet_skills_upgradingCfg {
    skill_id = 40391,
    level = 11,
    item_cost = [13001,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 200,
    des = "对前方敌人及其周围造成{a}%攻击的范围伤害，并造成群体减速效果",
    character_a = "1100",
    character_b = "",
    character_c = "",
    fightForce = 30600
    };
getRow(40392,1)->
    #pet_skills_upgradingCfg {
    skill_id = 40392,
    level = 1,
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "从天而降砸下对周围造成{a}%攻击的范围伤害，并强制吸引仇恨",
    character_a = "960",
    character_b = "",
    character_c = "",
    fightForce = 0
    };
getRow(40392,2)->
    #pet_skills_upgradingCfg {
    skill_id = 40392,
    level = 2,
    item_cost = [13001,1],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 40,
    des = "从天而降砸下对周围造成{a}%攻击的范围伤害，并强制吸引仇恨",
    character_a = "1130",
    character_b = "",
    character_c = "",
    fightForce = 900
    };
getRow(40392,3)->
    #pet_skills_upgradingCfg {
    skill_id = 40392,
    level = 3,
    item_cost = [13001,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 60,
    des = "从天而降砸下对周围造成{a}%攻击的范围伤害，并强制吸引仇恨",
    character_a = "1300",
    character_b = "",
    character_c = "",
    fightForce = 2700
    };
getRow(40392,4)->
    #pet_skills_upgradingCfg {
    skill_id = 40392,
    level = 4,
    item_cost = [13001,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 80,
    des = "从天而降砸下对周围造成{a}%攻击的范围伤害，并强制吸引仇恨",
    character_a = "1470",
    character_b = "",
    character_c = "",
    fightForce = 4500
    };
getRow(40392,5)->
    #pet_skills_upgradingCfg {
    skill_id = 40392,
    level = 5,
    item_cost = [13001,3],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 100,
    des = "从天而降砸下对周围造成{a}%攻击的范围伤害，并强制吸引仇恨",
    character_a = "1640",
    character_b = "",
    character_c = "",
    fightForce = 7200
    };
getRow(40392,6)->
    #pet_skills_upgradingCfg {
    skill_id = 40392,
    level = 6,
    item_cost = [13001,3],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 120,
    des = "从天而降砸下对周围造成{a}%攻击的范围伤害，并强制吸引仇恨",
    character_a = "1810",
    character_b = "",
    character_c = "",
    fightForce = 9900
    };
getRow(40392,7)->
    #pet_skills_upgradingCfg {
    skill_id = 40392,
    level = 7,
    item_cost = [13001,4],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 140,
    des = "从天而降砸下对周围造成{a}%攻击的范围伤害，并强制吸引仇恨",
    character_a = "1980",
    character_b = "",
    character_c = "",
    fightForce = 13500
    };
getRow(40392,8)->
    #pet_skills_upgradingCfg {
    skill_id = 40392,
    level = 8,
    item_cost = [13001,4],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 160,
    des = "从天而降砸下对周围造成{a}%攻击的范围伤害，并强制吸引仇恨",
    character_a = "2150",
    character_b = "",
    character_c = "",
    fightForce = 17100
    };
getRow(40392,9)->
    #pet_skills_upgradingCfg {
    skill_id = 40392,
    level = 9,
    item_cost = [13001,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 180,
    des = "从天而降砸下对周围造成{a}%攻击的范围伤害，并强制吸引仇恨",
    character_a = "2320",
    character_b = "",
    character_c = "",
    fightForce = 21600
    };
getRow(40392,10)->
    #pet_skills_upgradingCfg {
    skill_id = 40392,
    level = 10,
    item_cost = [13001,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 200,
    des = "从天而降砸下对周围造成{a}%攻击的范围伤害，并强制吸引仇恨",
    character_a = "2490",
    character_b = "",
    character_c = "",
    fightForce = 26100
    };
getRow(40392,11)->
    #pet_skills_upgradingCfg {
    skill_id = 40392,
    level = 11,
    item_cost = [13001,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 200,
    des = "从天而降砸下对周围造成{a}%攻击的范围伤害，并强制吸引仇恨",
    character_a = "2660",
    character_b = "",
    character_c = "",
    fightForce = 30600
    };
getRow(40400,1)->
    #pet_skills_upgradingCfg {
    skill_id = 40400,
    level = 1,
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "攻击前方扇形敌人，造成{a}%攻击的伤害",
    character_a = "563",
    character_b = "",
    character_c = "",
    fightForce = 0
    };
getRow(40400,2)->
    #pet_skills_upgradingCfg {
    skill_id = 40400,
    level = 2,
    item_cost = [13001,1],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 40,
    des = "攻击前方扇形敌人，造成{a}%攻击的伤害",
    character_a = "660",
    character_b = "",
    character_c = "",
    fightForce = 900
    };
getRow(40400,3)->
    #pet_skills_upgradingCfg {
    skill_id = 40400,
    level = 3,
    item_cost = [13001,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 60,
    des = "攻击前方扇形敌人，造成{a}%攻击的伤害",
    character_a = "757",
    character_b = "",
    character_c = "",
    fightForce = 2700
    };
getRow(40400,4)->
    #pet_skills_upgradingCfg {
    skill_id = 40400,
    level = 4,
    item_cost = [13001,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 80,
    des = "攻击前方扇形敌人，造成{a}%攻击的伤害",
    character_a = "854",
    character_b = "",
    character_c = "",
    fightForce = 4500
    };
getRow(40400,5)->
    #pet_skills_upgradingCfg {
    skill_id = 40400,
    level = 5,
    item_cost = [13001,3],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 100,
    des = "攻击前方扇形敌人，造成{a}%攻击的伤害",
    character_a = "951",
    character_b = "",
    character_c = "",
    fightForce = 7200
    };
getRow(40400,6)->
    #pet_skills_upgradingCfg {
    skill_id = 40400,
    level = 6,
    item_cost = [13001,3],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 120,
    des = "攻击前方扇形敌人，造成{a}%攻击的伤害",
    character_a = "1048",
    character_b = "",
    character_c = "",
    fightForce = 9900
    };
getRow(40400,7)->
    #pet_skills_upgradingCfg {
    skill_id = 40400,
    level = 7,
    item_cost = [13001,4],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 140,
    des = "攻击前方扇形敌人，造成{a}%攻击的伤害",
    character_a = "1145",
    character_b = "",
    character_c = "",
    fightForce = 13500
    };
getRow(40400,8)->
    #pet_skills_upgradingCfg {
    skill_id = 40400,
    level = 8,
    item_cost = [13001,4],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 160,
    des = "攻击前方扇形敌人，造成{a}%攻击的伤害",
    character_a = "1242",
    character_b = "",
    character_c = "",
    fightForce = 17100
    };
getRow(40400,9)->
    #pet_skills_upgradingCfg {
    skill_id = 40400,
    level = 9,
    item_cost = [13001,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 180,
    des = "攻击前方扇形敌人，造成{a}%攻击的伤害",
    character_a = "1339",
    character_b = "",
    character_c = "",
    fightForce = 21600
    };
getRow(40400,10)->
    #pet_skills_upgradingCfg {
    skill_id = 40400,
    level = 10,
    item_cost = [13001,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 200,
    des = "攻击前方扇形敌人，造成{a}%攻击的伤害",
    character_a = "1436",
    character_b = "",
    character_c = "",
    fightForce = 26100
    };
getRow(40400,11)->
    #pet_skills_upgradingCfg {
    skill_id = 40400,
    level = 11,
    item_cost = [13001,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 200,
    des = "攻击前方扇形敌人，造成{a}%攻击的伤害",
    character_a = "1533",
    character_b = "",
    character_c = "",
    fightForce = 30600
    };
getRow(40401,1)->
    #pet_skills_upgradingCfg {
    skill_id = 40401,
    level = 1,
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "大幅度增加主人攻击力{b}%，持续{c}秒",
    character_a = "704",
    character_b = "4",
    character_c = "5",
    fightForce = 0
    };
getRow(40401,2)->
    #pet_skills_upgradingCfg {
    skill_id = 40401,
    level = 2,
    item_cost = [13001,1],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 40,
    des = "大幅度增加主人攻击力{b}%，持续{c}秒",
    character_a = "827",
    character_b = "4.4",
    character_c = "5",
    fightForce = 900
    };
getRow(40401,3)->
    #pet_skills_upgradingCfg {
    skill_id = 40401,
    level = 3,
    item_cost = [13001,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 60,
    des = "大幅度增加主人攻击力{b}%，持续{c}秒",
    character_a = "950",
    character_b = "4.8",
    character_c = "5",
    fightForce = 2700
    };
getRow(40401,4)->
    #pet_skills_upgradingCfg {
    skill_id = 40401,
    level = 4,
    item_cost = [13001,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 80,
    des = "大幅度增加主人攻击力{b}%，持续{c}秒",
    character_a = "1073",
    character_b = "5.2",
    character_c = "5",
    fightForce = 4500
    };
getRow(40401,5)->
    #pet_skills_upgradingCfg {
    skill_id = 40401,
    level = 5,
    item_cost = [13001,3],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 100,
    des = "大幅度增加主人攻击力{b}%，持续{c}秒",
    character_a = "1196",
    character_b = "5.6",
    character_c = "5",
    fightForce = 7200
    };
getRow(40401,6)->
    #pet_skills_upgradingCfg {
    skill_id = 40401,
    level = 6,
    item_cost = [13001,3],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 120,
    des = "大幅度增加主人攻击力{b}%，持续{c}秒",
    character_a = "1319",
    character_b = "6",
    character_c = "5",
    fightForce = 9900
    };
getRow(40401,7)->
    #pet_skills_upgradingCfg {
    skill_id = 40401,
    level = 7,
    item_cost = [13001,4],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 140,
    des = "大幅度增加主人攻击力{b}%，持续{c}秒",
    character_a = "1442",
    character_b = "6.4",
    character_c = "5",
    fightForce = 13500
    };
getRow(40401,8)->
    #pet_skills_upgradingCfg {
    skill_id = 40401,
    level = 8,
    item_cost = [13001,4],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 160,
    des = "大幅度增加主人攻击力{b}%，持续{c}秒",
    character_a = "1565",
    character_b = "6.8",
    character_c = "5",
    fightForce = 17100
    };
getRow(40401,9)->
    #pet_skills_upgradingCfg {
    skill_id = 40401,
    level = 9,
    item_cost = [13001,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 180,
    des = "大幅度增加主人攻击力{b}%，持续{c}秒",
    character_a = "1688",
    character_b = "7.2",
    character_c = "5",
    fightForce = 21600
    };
getRow(40401,10)->
    #pet_skills_upgradingCfg {
    skill_id = 40401,
    level = 10,
    item_cost = [13001,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 200,
    des = "大幅度增加主人攻击力{b}%，持续{c}秒",
    character_a = "1811",
    character_b = "7.6",
    character_c = "5",
    fightForce = 26100
    };
getRow(40401,11)->
    #pet_skills_upgradingCfg {
    skill_id = 40401,
    level = 11,
    item_cost = [13001,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 200,
    des = "大幅度增加主人攻击力{b}%，持续{c}秒",
    character_a = "1934",
    character_b = "8",
    character_c = "5",
    fightForce = 30600
    };
getRow(40402,1)->
    #pet_skills_upgradingCfg {
    skill_id = 40402,
    level = 1,
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "攻击前方直线15米范围内敌人，造成{a}%攻击的伤害",
    character_a = "591",
    character_b = "",
    character_c = "",
    fightForce = 0
    };
getRow(40402,2)->
    #pet_skills_upgradingCfg {
    skill_id = 40402,
    level = 2,
    item_cost = [13001,1],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 40,
    des = "攻击前方直线15米范围内敌人，造成{a}%攻击的伤害",
    character_a = "696",
    character_b = "",
    character_c = "",
    fightForce = 900
    };
getRow(40402,3)->
    #pet_skills_upgradingCfg {
    skill_id = 40402,
    level = 3,
    item_cost = [13001,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 60,
    des = "攻击前方直线15米范围内敌人，造成{a}%攻击的伤害",
    character_a = "801",
    character_b = "",
    character_c = "",
    fightForce = 2700
    };
getRow(40402,4)->
    #pet_skills_upgradingCfg {
    skill_id = 40402,
    level = 4,
    item_cost = [13001,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 80,
    des = "攻击前方直线15米范围内敌人，造成{a}%攻击的伤害",
    character_a = "906",
    character_b = "",
    character_c = "",
    fightForce = 4500
    };
getRow(40402,5)->
    #pet_skills_upgradingCfg {
    skill_id = 40402,
    level = 5,
    item_cost = [13001,3],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 100,
    des = "攻击前方直线15米范围内敌人，造成{a}%攻击的伤害",
    character_a = "1011",
    character_b = "",
    character_c = "",
    fightForce = 7200
    };
getRow(40402,6)->
    #pet_skills_upgradingCfg {
    skill_id = 40402,
    level = 6,
    item_cost = [13001,3],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 120,
    des = "攻击前方直线15米范围内敌人，造成{a}%攻击的伤害",
    character_a = "1116",
    character_b = "",
    character_c = "",
    fightForce = 9900
    };
getRow(40402,7)->
    #pet_skills_upgradingCfg {
    skill_id = 40402,
    level = 7,
    item_cost = [13001,4],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 140,
    des = "攻击前方直线15米范围内敌人，造成{a}%攻击的伤害",
    character_a = "1221",
    character_b = "",
    character_c = "",
    fightForce = 13500
    };
getRow(40402,8)->
    #pet_skills_upgradingCfg {
    skill_id = 40402,
    level = 8,
    item_cost = [13001,4],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 160,
    des = "攻击前方直线15米范围内敌人，造成{a}%攻击的伤害",
    character_a = "1326",
    character_b = "",
    character_c = "",
    fightForce = 17100
    };
getRow(40402,9)->
    #pet_skills_upgradingCfg {
    skill_id = 40402,
    level = 9,
    item_cost = [13001,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 180,
    des = "攻击前方直线15米范围内敌人，造成{a}%攻击的伤害",
    character_a = "1431",
    character_b = "",
    character_c = "",
    fightForce = 21600
    };
getRow(40402,10)->
    #pet_skills_upgradingCfg {
    skill_id = 40402,
    level = 10,
    item_cost = [13001,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 200,
    des = "攻击前方直线15米范围内敌人，造成{a}%攻击的伤害",
    character_a = "1536",
    character_b = "",
    character_c = "",
    fightForce = 26100
    };
getRow(40402,11)->
    #pet_skills_upgradingCfg {
    skill_id = 40402,
    level = 11,
    item_cost = [13001,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 200,
    des = "攻击前方直线15米范围内敌人，造成{a}%攻击的伤害",
    character_a = "1641",
    character_b = "",
    character_c = "",
    fightForce = 30600
    };
getRow(40410,1)->
    #pet_skills_upgradingCfg {
    skill_id = 40410,
    level = 1,
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "攻击前方扇形敌人，造成{a}%攻击的伤害",
    character_a = "563",
    character_b = "",
    character_c = "",
    fightForce = 0
    };
getRow(40410,2)->
    #pet_skills_upgradingCfg {
    skill_id = 40410,
    level = 2,
    item_cost = [13001,1],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 40,
    des = "攻击前方扇形敌人，造成{a}%攻击的伤害",
    character_a = "660",
    character_b = "",
    character_c = "",
    fightForce = 900
    };
getRow(40410,3)->
    #pet_skills_upgradingCfg {
    skill_id = 40410,
    level = 3,
    item_cost = [13001,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 60,
    des = "攻击前方扇形敌人，造成{a}%攻击的伤害",
    character_a = "757",
    character_b = "",
    character_c = "",
    fightForce = 2700
    };
getRow(40410,4)->
    #pet_skills_upgradingCfg {
    skill_id = 40410,
    level = 4,
    item_cost = [13001,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 80,
    des = "攻击前方扇形敌人，造成{a}%攻击的伤害",
    character_a = "854",
    character_b = "",
    character_c = "",
    fightForce = 4500
    };
getRow(40410,5)->
    #pet_skills_upgradingCfg {
    skill_id = 40410,
    level = 5,
    item_cost = [13001,3],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 100,
    des = "攻击前方扇形敌人，造成{a}%攻击的伤害",
    character_a = "951",
    character_b = "",
    character_c = "",
    fightForce = 7200
    };
getRow(40410,6)->
    #pet_skills_upgradingCfg {
    skill_id = 40410,
    level = 6,
    item_cost = [13001,3],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 120,
    des = "攻击前方扇形敌人，造成{a}%攻击的伤害",
    character_a = "1048",
    character_b = "",
    character_c = "",
    fightForce = 9900
    };
getRow(40410,7)->
    #pet_skills_upgradingCfg {
    skill_id = 40410,
    level = 7,
    item_cost = [13001,4],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 140,
    des = "攻击前方扇形敌人，造成{a}%攻击的伤害",
    character_a = "1145",
    character_b = "",
    character_c = "",
    fightForce = 13500
    };
getRow(40410,8)->
    #pet_skills_upgradingCfg {
    skill_id = 40410,
    level = 8,
    item_cost = [13001,4],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 160,
    des = "攻击前方扇形敌人，造成{a}%攻击的伤害",
    character_a = "1242",
    character_b = "",
    character_c = "",
    fightForce = 17100
    };
getRow(40410,9)->
    #pet_skills_upgradingCfg {
    skill_id = 40410,
    level = 9,
    item_cost = [13001,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 180,
    des = "攻击前方扇形敌人，造成{a}%攻击的伤害",
    character_a = "1339",
    character_b = "",
    character_c = "",
    fightForce = 21600
    };
getRow(40410,10)->
    #pet_skills_upgradingCfg {
    skill_id = 40410,
    level = 10,
    item_cost = [13001,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 200,
    des = "攻击前方扇形敌人，造成{a}%攻击的伤害",
    character_a = "1436",
    character_b = "",
    character_c = "",
    fightForce = 26100
    };
getRow(40410,11)->
    #pet_skills_upgradingCfg {
    skill_id = 40410,
    level = 11,
    item_cost = [13001,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 200,
    des = "攻击前方扇形敌人，造成{a}%攻击的伤害",
    character_a = "1533",
    character_b = "",
    character_c = "",
    fightForce = 30600
    };
getRow(40411,1)->
    #pet_skills_upgradingCfg {
    skill_id = 40411,
    level = 1,
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "大幅度增加主人攻击力{b}%，持续{c}秒",
    character_a = "704",
    character_b = "4",
    character_c = "5",
    fightForce = 0
    };
getRow(40411,2)->
    #pet_skills_upgradingCfg {
    skill_id = 40411,
    level = 2,
    item_cost = [13001,1],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 40,
    des = "大幅度增加主人攻击力{b}%，持续{c}秒",
    character_a = "827",
    character_b = "4.4",
    character_c = "5",
    fightForce = 900
    };
getRow(40411,3)->
    #pet_skills_upgradingCfg {
    skill_id = 40411,
    level = 3,
    item_cost = [13001,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 60,
    des = "大幅度增加主人攻击力{b}%，持续{c}秒",
    character_a = "950",
    character_b = "4.8",
    character_c = "5",
    fightForce = 2700
    };
getRow(40411,4)->
    #pet_skills_upgradingCfg {
    skill_id = 40411,
    level = 4,
    item_cost = [13001,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 80,
    des = "大幅度增加主人攻击力{b}%，持续{c}秒",
    character_a = "1073",
    character_b = "5.2",
    character_c = "5",
    fightForce = 4500
    };
getRow(40411,5)->
    #pet_skills_upgradingCfg {
    skill_id = 40411,
    level = 5,
    item_cost = [13001,3],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 100,
    des = "大幅度增加主人攻击力{b}%，持续{c}秒",
    character_a = "1196",
    character_b = "5.6",
    character_c = "5",
    fightForce = 7200
    };
getRow(40411,6)->
    #pet_skills_upgradingCfg {
    skill_id = 40411,
    level = 6,
    item_cost = [13001,3],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 120,
    des = "大幅度增加主人攻击力{b}%，持续{c}秒",
    character_a = "1319",
    character_b = "6",
    character_c = "5",
    fightForce = 9900
    };
getRow(40411,7)->
    #pet_skills_upgradingCfg {
    skill_id = 40411,
    level = 7,
    item_cost = [13001,4],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 140,
    des = "大幅度增加主人攻击力{b}%，持续{c}秒",
    character_a = "1442",
    character_b = "6.4",
    character_c = "5",
    fightForce = 13500
    };
getRow(40411,8)->
    #pet_skills_upgradingCfg {
    skill_id = 40411,
    level = 8,
    item_cost = [13001,4],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 160,
    des = "大幅度增加主人攻击力{b}%，持续{c}秒",
    character_a = "1565",
    character_b = "6.8",
    character_c = "5",
    fightForce = 17100
    };
getRow(40411,9)->
    #pet_skills_upgradingCfg {
    skill_id = 40411,
    level = 9,
    item_cost = [13001,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 180,
    des = "大幅度增加主人攻击力{b}%，持续{c}秒",
    character_a = "1688",
    character_b = "7.2",
    character_c = "5",
    fightForce = 21600
    };
getRow(40411,10)->
    #pet_skills_upgradingCfg {
    skill_id = 40411,
    level = 10,
    item_cost = [13001,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 200,
    des = "大幅度增加主人攻击力{b}%，持续{c}秒",
    character_a = "1811",
    character_b = "7.6",
    character_c = "5",
    fightForce = 26100
    };
getRow(40411,11)->
    #pet_skills_upgradingCfg {
    skill_id = 40411,
    level = 11,
    item_cost = [13001,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 200,
    des = "大幅度增加主人攻击力{b}%，持续{c}秒",
    character_a = "1934",
    character_b = "8",
    character_c = "5",
    fightForce = 30600
    };
getRow(40412,1)->
    #pet_skills_upgradingCfg {
    skill_id = 40412,
    level = 1,
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "攻击前方直线15米范围内敌人，造成{a}%攻击的伤害",
    character_a = "591",
    character_b = "",
    character_c = "",
    fightForce = 0
    };
getRow(40412,2)->
    #pet_skills_upgradingCfg {
    skill_id = 40412,
    level = 2,
    item_cost = [13001,1],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 40,
    des = "攻击前方直线15米范围内敌人，造成{a}%攻击的伤害",
    character_a = "696",
    character_b = "",
    character_c = "",
    fightForce = 900
    };
getRow(40412,3)->
    #pet_skills_upgradingCfg {
    skill_id = 40412,
    level = 3,
    item_cost = [13001,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 60,
    des = "攻击前方直线15米范围内敌人，造成{a}%攻击的伤害",
    character_a = "801",
    character_b = "",
    character_c = "",
    fightForce = 2700
    };
getRow(40412,4)->
    #pet_skills_upgradingCfg {
    skill_id = 40412,
    level = 4,
    item_cost = [13001,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 80,
    des = "攻击前方直线15米范围内敌人，造成{a}%攻击的伤害",
    character_a = "906",
    character_b = "",
    character_c = "",
    fightForce = 4500
    };
getRow(40412,5)->
    #pet_skills_upgradingCfg {
    skill_id = 40412,
    level = 5,
    item_cost = [13001,3],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 100,
    des = "攻击前方直线15米范围内敌人，造成{a}%攻击的伤害",
    character_a = "1011",
    character_b = "",
    character_c = "",
    fightForce = 7200
    };
getRow(40412,6)->
    #pet_skills_upgradingCfg {
    skill_id = 40412,
    level = 6,
    item_cost = [13001,3],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 120,
    des = "攻击前方直线15米范围内敌人，造成{a}%攻击的伤害",
    character_a = "1116",
    character_b = "",
    character_c = "",
    fightForce = 9900
    };
getRow(40412,7)->
    #pet_skills_upgradingCfg {
    skill_id = 40412,
    level = 7,
    item_cost = [13001,4],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 140,
    des = "攻击前方直线15米范围内敌人，造成{a}%攻击的伤害",
    character_a = "1221",
    character_b = "",
    character_c = "",
    fightForce = 13500
    };
getRow(40412,8)->
    #pet_skills_upgradingCfg {
    skill_id = 40412,
    level = 8,
    item_cost = [13001,4],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 160,
    des = "攻击前方直线15米范围内敌人，造成{a}%攻击的伤害",
    character_a = "1326",
    character_b = "",
    character_c = "",
    fightForce = 17100
    };
getRow(40412,9)->
    #pet_skills_upgradingCfg {
    skill_id = 40412,
    level = 9,
    item_cost = [13001,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 180,
    des = "攻击前方直线15米范围内敌人，造成{a}%攻击的伤害",
    character_a = "1431",
    character_b = "",
    character_c = "",
    fightForce = 21600
    };
getRow(40412,10)->
    #pet_skills_upgradingCfg {
    skill_id = 40412,
    level = 10,
    item_cost = [13001,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 200,
    des = "攻击前方直线15米范围内敌人，造成{a}%攻击的伤害",
    character_a = "1536",
    character_b = "",
    character_c = "",
    fightForce = 26100
    };
getRow(40412,11)->
    #pet_skills_upgradingCfg {
    skill_id = 40412,
    level = 11,
    item_cost = [13001,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 200,
    des = "攻击前方直线15米范围内敌人，造成{a}%攻击的伤害",
    character_a = "1641",
    character_b = "",
    character_c = "",
    fightForce = 30600
    };
getRow(40420,1)->
    #pet_skills_upgradingCfg {
    skill_id = 40420,
    level = 1,
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "攻击前方扇形敌人，造成{a}%攻击的伤害",
    character_a = "544",
    character_b = "",
    character_c = "",
    fightForce = 0
    };
getRow(40420,2)->
    #pet_skills_upgradingCfg {
    skill_id = 40420,
    level = 2,
    item_cost = [13002,1],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 40,
    des = "攻击前方扇形敌人，造成{a}%攻击的伤害",
    character_a = "655",
    character_b = "",
    character_c = "",
    fightForce = 1800
    };
getRow(40420,3)->
    #pet_skills_upgradingCfg {
    skill_id = 40420,
    level = 3,
    item_cost = [13002,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 60,
    des = "攻击前方扇形敌人，造成{a}%攻击的伤害",
    character_a = "766",
    character_b = "",
    character_c = "",
    fightForce = 5400
    };
getRow(40420,4)->
    #pet_skills_upgradingCfg {
    skill_id = 40420,
    level = 4,
    item_cost = [13002,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 80,
    des = "攻击前方扇形敌人，造成{a}%攻击的伤害",
    character_a = "877",
    character_b = "",
    character_c = "",
    fightForce = 9000
    };
getRow(40420,5)->
    #pet_skills_upgradingCfg {
    skill_id = 40420,
    level = 5,
    item_cost = [13002,3],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 100,
    des = "攻击前方扇形敌人，造成{a}%攻击的伤害",
    character_a = "988",
    character_b = "",
    character_c = "",
    fightForce = 14400
    };
getRow(40420,6)->
    #pet_skills_upgradingCfg {
    skill_id = 40420,
    level = 6,
    item_cost = [13002,3],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 120,
    des = "攻击前方扇形敌人，造成{a}%攻击的伤害",
    character_a = "1099",
    character_b = "",
    character_c = "",
    fightForce = 19800
    };
getRow(40420,7)->
    #pet_skills_upgradingCfg {
    skill_id = 40420,
    level = 7,
    item_cost = [13002,4],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 140,
    des = "攻击前方扇形敌人，造成{a}%攻击的伤害",
    character_a = "1210",
    character_b = "",
    character_c = "",
    fightForce = 27000
    };
getRow(40420,8)->
    #pet_skills_upgradingCfg {
    skill_id = 40420,
    level = 8,
    item_cost = [13002,4],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 160,
    des = "攻击前方扇形敌人，造成{a}%攻击的伤害",
    character_a = "1321",
    character_b = "",
    character_c = "",
    fightForce = 34200
    };
getRow(40420,9)->
    #pet_skills_upgradingCfg {
    skill_id = 40420,
    level = 9,
    item_cost = [13002,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 180,
    des = "攻击前方扇形敌人，造成{a}%攻击的伤害",
    character_a = "1432",
    character_b = "",
    character_c = "",
    fightForce = 43200
    };
getRow(40420,10)->
    #pet_skills_upgradingCfg {
    skill_id = 40420,
    level = 10,
    item_cost = [13002,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 200,
    des = "攻击前方扇形敌人，造成{a}%攻击的伤害",
    character_a = "1543",
    character_b = "",
    character_c = "",
    fightForce = 52200
    };
getRow(40420,11)->
    #pet_skills_upgradingCfg {
    skill_id = 40420,
    level = 11,
    item_cost = [13002,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 200,
    des = "攻击前方扇形敌人，造成{a}%攻击的伤害",
    character_a = "1654",
    character_b = "",
    character_c = "",
    fightForce = 61200
    };
getRow(40421,1)->
    #pet_skills_upgradingCfg {
    skill_id = 40421,
    level = 1,
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "大幅度增加主人攻击力{b}%，持续{c}秒",
    character_a = "680",
    character_b = "5",
    character_c = "5",
    fightForce = 0
    };
getRow(40421,2)->
    #pet_skills_upgradingCfg {
    skill_id = 40421,
    level = 2,
    item_cost = [13002,1],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 40,
    des = "大幅度增加主人攻击力{b}%，持续{c}秒",
    character_a = "816",
    character_b = "5.5",
    character_c = "5",
    fightForce = 1800
    };
getRow(40421,3)->
    #pet_skills_upgradingCfg {
    skill_id = 40421,
    level = 3,
    item_cost = [13002,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 60,
    des = "大幅度增加主人攻击力{b}%，持续{c}秒",
    character_a = "952",
    character_b = "6",
    character_c = "5",
    fightForce = 5400
    };
getRow(40421,4)->
    #pet_skills_upgradingCfg {
    skill_id = 40421,
    level = 4,
    item_cost = [13002,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 80,
    des = "大幅度增加主人攻击力{b}%，持续{c}秒",
    character_a = "1088",
    character_b = "6.5",
    character_c = "5",
    fightForce = 9000
    };
getRow(40421,5)->
    #pet_skills_upgradingCfg {
    skill_id = 40421,
    level = 5,
    item_cost = [13002,3],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 100,
    des = "大幅度增加主人攻击力{b}%，持续{c}秒",
    character_a = "1224",
    character_b = "7",
    character_c = "5",
    fightForce = 14400
    };
getRow(40421,6)->
    #pet_skills_upgradingCfg {
    skill_id = 40421,
    level = 6,
    item_cost = [13002,3],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 120,
    des = "大幅度增加主人攻击力{b}%，持续{c}秒",
    character_a = "1360",
    character_b = "7.5",
    character_c = "5",
    fightForce = 19800
    };
getRow(40421,7)->
    #pet_skills_upgradingCfg {
    skill_id = 40421,
    level = 7,
    item_cost = [13002,4],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 140,
    des = "大幅度增加主人攻击力{b}%，持续{c}秒",
    character_a = "1496",
    character_b = "8",
    character_c = "5",
    fightForce = 27000
    };
getRow(40421,8)->
    #pet_skills_upgradingCfg {
    skill_id = 40421,
    level = 8,
    item_cost = [13002,4],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 160,
    des = "大幅度增加主人攻击力{b}%，持续{c}秒",
    character_a = "1632",
    character_b = "8.5",
    character_c = "5",
    fightForce = 34200
    };
getRow(40421,9)->
    #pet_skills_upgradingCfg {
    skill_id = 40421,
    level = 9,
    item_cost = [13002,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 180,
    des = "大幅度增加主人攻击力{b}%，持续{c}秒",
    character_a = "1768",
    character_b = "9",
    character_c = "5",
    fightForce = 43200
    };
getRow(40421,10)->
    #pet_skills_upgradingCfg {
    skill_id = 40421,
    level = 10,
    item_cost = [13002,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 200,
    des = "大幅度增加主人攻击力{b}%，持续{c}秒",
    character_a = "1904",
    character_b = "9.5",
    character_c = "5",
    fightForce = 52200
    };
getRow(40421,11)->
    #pet_skills_upgradingCfg {
    skill_id = 40421,
    level = 11,
    item_cost = [13002,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 200,
    des = "大幅度增加主人攻击力{b}%，持续{c}秒",
    character_a = "2040",
    character_b = "10",
    character_c = "5",
    fightForce = 61200
    };
getRow(40422,1)->
    #pet_skills_upgradingCfg {
    skill_id = 40422,
    level = 1,
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "攻击前方直线15米范围内敌人，造成{a}%攻击的伤害",
    character_a = "571",
    character_b = "",
    character_c = "",
    fightForce = 0
    };
getRow(40422,2)->
    #pet_skills_upgradingCfg {
    skill_id = 40422,
    level = 2,
    item_cost = [13002,1],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 40,
    des = "攻击前方直线15米范围内敌人，造成{a}%攻击的伤害",
    character_a = "684",
    character_b = "",
    character_c = "",
    fightForce = 1800
    };
getRow(40422,3)->
    #pet_skills_upgradingCfg {
    skill_id = 40422,
    level = 3,
    item_cost = [13002,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 60,
    des = "攻击前方直线15米范围内敌人，造成{a}%攻击的伤害",
    character_a = "797",
    character_b = "",
    character_c = "",
    fightForce = 5400
    };
getRow(40422,4)->
    #pet_skills_upgradingCfg {
    skill_id = 40422,
    level = 4,
    item_cost = [13002,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 80,
    des = "攻击前方直线15米范围内敌人，造成{a}%攻击的伤害",
    character_a = "910",
    character_b = "",
    character_c = "",
    fightForce = 9000
    };
getRow(40422,5)->
    #pet_skills_upgradingCfg {
    skill_id = 40422,
    level = 5,
    item_cost = [13002,3],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 100,
    des = "攻击前方直线15米范围内敌人，造成{a}%攻击的伤害",
    character_a = "1023",
    character_b = "",
    character_c = "",
    fightForce = 14400
    };
getRow(40422,6)->
    #pet_skills_upgradingCfg {
    skill_id = 40422,
    level = 6,
    item_cost = [13002,3],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 120,
    des = "攻击前方直线15米范围内敌人，造成{a}%攻击的伤害",
    character_a = "1136",
    character_b = "",
    character_c = "",
    fightForce = 19800
    };
getRow(40422,7)->
    #pet_skills_upgradingCfg {
    skill_id = 40422,
    level = 7,
    item_cost = [13002,4],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 140,
    des = "攻击前方直线15米范围内敌人，造成{a}%攻击的伤害",
    character_a = "1249",
    character_b = "",
    character_c = "",
    fightForce = 27000
    };
getRow(40422,8)->
    #pet_skills_upgradingCfg {
    skill_id = 40422,
    level = 8,
    item_cost = [13002,4],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 160,
    des = "攻击前方直线15米范围内敌人，造成{a}%攻击的伤害",
    character_a = "1362",
    character_b = "",
    character_c = "",
    fightForce = 34200
    };
getRow(40422,9)->
    #pet_skills_upgradingCfg {
    skill_id = 40422,
    level = 9,
    item_cost = [13002,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 180,
    des = "攻击前方直线15米范围内敌人，造成{a}%攻击的伤害",
    character_a = "1475",
    character_b = "",
    character_c = "",
    fightForce = 43200
    };
getRow(40422,10)->
    #pet_skills_upgradingCfg {
    skill_id = 40422,
    level = 10,
    item_cost = [13002,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 200,
    des = "攻击前方直线15米范围内敌人，造成{a}%攻击的伤害",
    character_a = "1588",
    character_b = "",
    character_c = "",
    fightForce = 52200
    };
getRow(40422,11)->
    #pet_skills_upgradingCfg {
    skill_id = 40422,
    level = 11,
    item_cost = [13002,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 200,
    des = "攻击前方直线15米范围内敌人，造成{a}%攻击的伤害",
    character_a = "1701",
    character_b = "",
    character_c = "",
    fightForce = 61200
    };
getRow(40430,1)->
    #pet_skills_upgradingCfg {
    skill_id = 40430,
    level = 1,
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "向前扑击敌方单体，造成{a}%攻击的伤害。若暴击，则随机驱散对方一个可移除的增益效果",
    character_a = "768",
    character_b = "",
    character_c = "",
    fightForce = 0
    };
getRow(40430,2)->
    #pet_skills_upgradingCfg {
    skill_id = 40430,
    level = 2,
    item_cost = [13002,1],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 40,
    des = "向前扑击敌方单体，造成{a}%攻击的伤害。若暴击，则随机驱散对方一个可移除的增益效果",
    character_a = "960",
    character_b = "",
    character_c = "",
    fightForce = 1800
    };
getRow(40430,3)->
    #pet_skills_upgradingCfg {
    skill_id = 40430,
    level = 3,
    item_cost = [13002,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 60,
    des = "向前扑击敌方单体，造成{a}%攻击的伤害。若暴击，则随机驱散对方一个可移除的增益效果",
    character_a = "1152",
    character_b = "",
    character_c = "",
    fightForce = 5400
    };
getRow(40430,4)->
    #pet_skills_upgradingCfg {
    skill_id = 40430,
    level = 4,
    item_cost = [13002,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 80,
    des = "向前扑击敌方单体，造成{a}%攻击的伤害。若暴击，则随机驱散对方一个可移除的增益效果",
    character_a = "1344",
    character_b = "",
    character_c = "",
    fightForce = 9000
    };
getRow(40430,5)->
    #pet_skills_upgradingCfg {
    skill_id = 40430,
    level = 5,
    item_cost = [13002,3],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 100,
    des = "向前扑击敌方单体，造成{a}%攻击的伤害。若暴击，则随机驱散对方一个可移除的增益效果",
    character_a = "1536",
    character_b = "",
    character_c = "",
    fightForce = 14400
    };
getRow(40430,6)->
    #pet_skills_upgradingCfg {
    skill_id = 40430,
    level = 6,
    item_cost = [13002,3],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 120,
    des = "向前扑击敌方单体，造成{a}%攻击的伤害。若暴击，则随机驱散对方一个可移除的增益效果",
    character_a = "1728",
    character_b = "",
    character_c = "",
    fightForce = 19800
    };
getRow(40430,7)->
    #pet_skills_upgradingCfg {
    skill_id = 40430,
    level = 7,
    item_cost = [13002,4],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 140,
    des = "向前扑击敌方单体，造成{a}%攻击的伤害。若暴击，则随机驱散对方一个可移除的增益效果",
    character_a = "1920",
    character_b = "",
    character_c = "",
    fightForce = 27000
    };
getRow(40430,8)->
    #pet_skills_upgradingCfg {
    skill_id = 40430,
    level = 8,
    item_cost = [13002,4],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 160,
    des = "向前扑击敌方单体，造成{a}%攻击的伤害。若暴击，则随机驱散对方一个可移除的增益效果",
    character_a = "2112",
    character_b = "",
    character_c = "",
    fightForce = 34200
    };
getRow(40430,9)->
    #pet_skills_upgradingCfg {
    skill_id = 40430,
    level = 9,
    item_cost = [13002,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 180,
    des = "向前扑击敌方单体，造成{a}%攻击的伤害。若暴击，则随机驱散对方一个可移除的增益效果",
    character_a = "2304",
    character_b = "",
    character_c = "",
    fightForce = 43200
    };
getRow(40430,10)->
    #pet_skills_upgradingCfg {
    skill_id = 40430,
    level = 10,
    item_cost = [13002,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 200,
    des = "向前扑击敌方单体，造成{a}%攻击的伤害。若暴击，则随机驱散对方一个可移除的增益效果",
    character_a = "2496",
    character_b = "",
    character_c = "",
    fightForce = 52200
    };
getRow(40430,11)->
    #pet_skills_upgradingCfg {
    skill_id = 40430,
    level = 11,
    item_cost = [13002,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 200,
    des = "向前扑击敌方单体，造成{a}%攻击的伤害。若暴击，则随机驱散对方一个可移除的增益效果",
    character_a = "2688",
    character_b = "",
    character_c = "",
    fightForce = 61200
    };
getRow(40431,1)->
    #pet_skills_upgradingCfg {
    skill_id = 40431,
    level = 1,
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "攻击前方15米扇形范围内敌人，造成2次{a}%攻击的伤害。若暴击，则附带灼烧效果，持续{c}秒",
    character_a = "280",
    character_b = "",
    character_c = "3",
    fightForce = 0
    };
getRow(40431,2)->
    #pet_skills_upgradingCfg {
    skill_id = 40431,
    level = 2,
    item_cost = [13002,1],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 40,
    des = "攻击前方15米扇形范围内敌人，造成2次{a}%攻击的伤害。若暴击，则附带灼烧效果，持续{c}秒",
    character_a = "350",
    character_b = "",
    character_c = "3",
    fightForce = 1800
    };
getRow(40431,3)->
    #pet_skills_upgradingCfg {
    skill_id = 40431,
    level = 3,
    item_cost = [13002,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 60,
    des = "攻击前方15米扇形范围内敌人，造成2次{a}%攻击的伤害。若暴击，则附带灼烧效果，持续{c}秒",
    character_a = "420",
    character_b = "",
    character_c = "3",
    fightForce = 5400
    };
getRow(40431,4)->
    #pet_skills_upgradingCfg {
    skill_id = 40431,
    level = 4,
    item_cost = [13002,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 80,
    des = "攻击前方15米扇形范围内敌人，造成2次{a}%攻击的伤害。若暴击，则附带灼烧效果，持续{c}秒",
    character_a = "490",
    character_b = "",
    character_c = "3",
    fightForce = 9000
    };
getRow(40431,5)->
    #pet_skills_upgradingCfg {
    skill_id = 40431,
    level = 5,
    item_cost = [13002,3],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 100,
    des = "攻击前方15米扇形范围内敌人，造成2次{a}%攻击的伤害。若暴击，则附带灼烧效果，持续{c}秒",
    character_a = "560",
    character_b = "",
    character_c = "3",
    fightForce = 14400
    };
getRow(40431,6)->
    #pet_skills_upgradingCfg {
    skill_id = 40431,
    level = 6,
    item_cost = [13002,3],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 120,
    des = "攻击前方15米扇形范围内敌人，造成2次{a}%攻击的伤害。若暴击，则附带灼烧效果，持续{c}秒",
    character_a = "630",
    character_b = "",
    character_c = "3",
    fightForce = 19800
    };
getRow(40431,7)->
    #pet_skills_upgradingCfg {
    skill_id = 40431,
    level = 7,
    item_cost = [13002,4],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 140,
    des = "攻击前方15米扇形范围内敌人，造成2次{a}%攻击的伤害。若暴击，则附带灼烧效果，持续{c}秒",
    character_a = "700",
    character_b = "",
    character_c = "3",
    fightForce = 27000
    };
getRow(40431,8)->
    #pet_skills_upgradingCfg {
    skill_id = 40431,
    level = 8,
    item_cost = [13002,4],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 160,
    des = "攻击前方15米扇形范围内敌人，造成2次{a}%攻击的伤害。若暴击，则附带灼烧效果，持续{c}秒",
    character_a = "770",
    character_b = "",
    character_c = "3",
    fightForce = 34200
    };
getRow(40431,9)->
    #pet_skills_upgradingCfg {
    skill_id = 40431,
    level = 9,
    item_cost = [13002,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 180,
    des = "攻击前方15米扇形范围内敌人，造成2次{a}%攻击的伤害。若暴击，则附带灼烧效果，持续{c}秒",
    character_a = "840",
    character_b = "",
    character_c = "3",
    fightForce = 43200
    };
getRow(40431,10)->
    #pet_skills_upgradingCfg {
    skill_id = 40431,
    level = 10,
    item_cost = [13002,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 200,
    des = "攻击前方15米扇形范围内敌人，造成2次{a}%攻击的伤害。若暴击，则附带灼烧效果，持续{c}秒",
    character_a = "910",
    character_b = "",
    character_c = "3",
    fightForce = 52200
    };
getRow(40431,11)->
    #pet_skills_upgradingCfg {
    skill_id = 40431,
    level = 11,
    item_cost = [13002,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 200,
    des = "攻击前方15米扇形范围内敌人，造成2次{a}%攻击的伤害。若暴击，则附带灼烧效果，持续{c}秒",
    character_a = "980",
    character_b = "",
    character_c = "3",
    fightForce = 61200
    };
getRow(40432,1)->
    #pet_skills_upgradingCfg {
    skill_id = 40432,
    level = 1,
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "对目标及目标周围5米敌方造成{a}%攻击的伤害。若暴击，则附带眩晕效果，持续{c}秒",
    character_a = "403",
    character_b = "",
    character_c = "2",
    fightForce = 0
    };
getRow(40432,2)->
    #pet_skills_upgradingCfg {
    skill_id = 40432,
    level = 2,
    item_cost = [13002,1],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 40,
    des = "对目标及目标周围5米敌方造成{a}%攻击的伤害。若暴击，则附带眩晕效果，持续{c}秒",
    character_a = "504",
    character_b = "",
    character_c = "2",
    fightForce = 1800
    };
getRow(40432,3)->
    #pet_skills_upgradingCfg {
    skill_id = 40432,
    level = 3,
    item_cost = [13002,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 60,
    des = "对目标及目标周围5米敌方造成{a}%攻击的伤害。若暴击，则附带眩晕效果，持续{c}秒",
    character_a = "605",
    character_b = "",
    character_c = "2",
    fightForce = 5400
    };
getRow(40432,4)->
    #pet_skills_upgradingCfg {
    skill_id = 40432,
    level = 4,
    item_cost = [13002,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 80,
    des = "对目标及目标周围5米敌方造成{a}%攻击的伤害。若暴击，则附带眩晕效果，持续{c}秒",
    character_a = "706",
    character_b = "",
    character_c = "2",
    fightForce = 9000
    };
getRow(40432,5)->
    #pet_skills_upgradingCfg {
    skill_id = 40432,
    level = 5,
    item_cost = [13002,3],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 100,
    des = "对目标及目标周围5米敌方造成{a}%攻击的伤害。若暴击，则附带眩晕效果，持续{c}秒",
    character_a = "807",
    character_b = "",
    character_c = "2",
    fightForce = 14400
    };
getRow(40432,6)->
    #pet_skills_upgradingCfg {
    skill_id = 40432,
    level = 6,
    item_cost = [13002,3],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 120,
    des = "对目标及目标周围5米敌方造成{a}%攻击的伤害。若暴击，则附带眩晕效果，持续{c}秒",
    character_a = "908",
    character_b = "",
    character_c = "2",
    fightForce = 19800
    };
getRow(40432,7)->
    #pet_skills_upgradingCfg {
    skill_id = 40432,
    level = 7,
    item_cost = [13002,4],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 140,
    des = "对目标及目标周围5米敌方造成{a}%攻击的伤害。若暴击，则附带眩晕效果，持续{c}秒",
    character_a = "1009",
    character_b = "",
    character_c = "2",
    fightForce = 27000
    };
getRow(40432,8)->
    #pet_skills_upgradingCfg {
    skill_id = 40432,
    level = 8,
    item_cost = [13002,4],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 160,
    des = "对目标及目标周围5米敌方造成{a}%攻击的伤害。若暴击，则附带眩晕效果，持续{c}秒",
    character_a = "1110",
    character_b = "",
    character_c = "2",
    fightForce = 34200
    };
getRow(40432,9)->
    #pet_skills_upgradingCfg {
    skill_id = 40432,
    level = 9,
    item_cost = [13002,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 180,
    des = "对目标及目标周围5米敌方造成{a}%攻击的伤害。若暴击，则附带眩晕效果，持续{c}秒",
    character_a = "1211",
    character_b = "",
    character_c = "2",
    fightForce = 43200
    };
getRow(40432,10)->
    #pet_skills_upgradingCfg {
    skill_id = 40432,
    level = 10,
    item_cost = [13002,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 200,
    des = "对目标及目标周围5米敌方造成{a}%攻击的伤害。若暴击，则附带眩晕效果，持续{c}秒",
    character_a = "1312",
    character_b = "",
    character_c = "2",
    fightForce = 52200
    };
getRow(40432,11)->
    #pet_skills_upgradingCfg {
    skill_id = 40432,
    level = 11,
    item_cost = [13002,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 200,
    des = "对目标及目标周围5米敌方造成{a}%攻击的伤害。若暴击，则附带眩晕效果，持续{c}秒",
    character_a = "1413",
    character_b = "",
    character_c = "2",
    fightForce = 61200
    };
getRow(40440,1)->
    #pet_skills_upgradingCfg {
    skill_id = 40440,
    level = 1,
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "直升机向前俯冲，攻击前方20米范围内目标，造成{a}%攻击的伤害",
    character_a = "620",
    character_b = "",
    character_c = "",
    fightForce = 0
    };
getRow(40440,2)->
    #pet_skills_upgradingCfg {
    skill_id = 40440,
    level = 2,
    item_cost = [13002,1],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 40,
    des = "直升机向前俯冲，攻击前方20米范围内目标，造成{a}%攻击的伤害",
    character_a = "775",
    character_b = "",
    character_c = "",
    fightForce = 1800
    };
getRow(40440,3)->
    #pet_skills_upgradingCfg {
    skill_id = 40440,
    level = 3,
    item_cost = [13002,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 60,
    des = "直升机向前俯冲，攻击前方20米范围内目标，造成{a}%攻击的伤害",
    character_a = "930",
    character_b = "",
    character_c = "",
    fightForce = 5400
    };
getRow(40440,4)->
    #pet_skills_upgradingCfg {
    skill_id = 40440,
    level = 4,
    item_cost = [13002,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 80,
    des = "直升机向前俯冲，攻击前方20米范围内目标，造成{a}%攻击的伤害",
    character_a = "1085",
    character_b = "",
    character_c = "",
    fightForce = 9000
    };
getRow(40440,5)->
    #pet_skills_upgradingCfg {
    skill_id = 40440,
    level = 5,
    item_cost = [13002,3],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 100,
    des = "直升机向前俯冲，攻击前方20米范围内目标，造成{a}%攻击的伤害",
    character_a = "1240",
    character_b = "",
    character_c = "",
    fightForce = 14400
    };
getRow(40440,6)->
    #pet_skills_upgradingCfg {
    skill_id = 40440,
    level = 6,
    item_cost = [13002,3],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 120,
    des = "直升机向前俯冲，攻击前方20米范围内目标，造成{a}%攻击的伤害",
    character_a = "1395",
    character_b = "",
    character_c = "",
    fightForce = 19800
    };
getRow(40440,7)->
    #pet_skills_upgradingCfg {
    skill_id = 40440,
    level = 7,
    item_cost = [13002,4],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 140,
    des = "直升机向前俯冲，攻击前方20米范围内目标，造成{a}%攻击的伤害",
    character_a = "1550",
    character_b = "",
    character_c = "",
    fightForce = 27000
    };
getRow(40440,8)->
    #pet_skills_upgradingCfg {
    skill_id = 40440,
    level = 8,
    item_cost = [13002,4],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 160,
    des = "直升机向前俯冲，攻击前方20米范围内目标，造成{a}%攻击的伤害",
    character_a = "1705",
    character_b = "",
    character_c = "",
    fightForce = 34200
    };
getRow(40440,9)->
    #pet_skills_upgradingCfg {
    skill_id = 40440,
    level = 9,
    item_cost = [13002,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 180,
    des = "直升机向前俯冲，攻击前方20米范围内目标，造成{a}%攻击的伤害",
    character_a = "1860",
    character_b = "",
    character_c = "",
    fightForce = 43200
    };
getRow(40440,10)->
    #pet_skills_upgradingCfg {
    skill_id = 40440,
    level = 10,
    item_cost = [13002,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 200,
    des = "直升机向前俯冲，攻击前方20米范围内目标，造成{a}%攻击的伤害",
    character_a = "2015",
    character_b = "",
    character_c = "",
    fightForce = 52200
    };
getRow(40440,11)->
    #pet_skills_upgradingCfg {
    skill_id = 40440,
    level = 11,
    item_cost = [13002,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 200,
    des = "直升机向前俯冲，攻击前方20米范围内目标，造成{a}%攻击的伤害",
    character_a = "2170",
    character_b = "",
    character_c = "",
    fightForce = 61200
    };
getRow(40441,1)->
    #pet_skills_upgradingCfg {
    skill_id = 40441,
    level = 1,
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "喷射激光，攻击前方20米范围目标2次，造成{a}%攻击的伤害，有一定几率降低目标的{b}%命中等级，持续{c}秒",
    character_a = "271",
    character_b = "30",
    character_c = "5",
    fightForce = 0
    };
getRow(40441,2)->
    #pet_skills_upgradingCfg {
    skill_id = 40441,
    level = 2,
    item_cost = [13002,1],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 40,
    des = "喷射激光，攻击前方20米范围目标2次，造成{a}%攻击的伤害，有一定几率降低目标的{b}%命中等级，持续{c}秒",
    character_a = "339",
    character_b = "30.4",
    character_c = "5",
    fightForce = 1800
    };
getRow(40441,3)->
    #pet_skills_upgradingCfg {
    skill_id = 40441,
    level = 3,
    item_cost = [13002,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 60,
    des = "喷射激光，攻击前方20米范围目标2次，造成{a}%攻击的伤害，有一定几率降低目标的{b}%命中等级，持续{c}秒",
    character_a = "407",
    character_b = "30.8",
    character_c = "5",
    fightForce = 5400
    };
getRow(40441,4)->
    #pet_skills_upgradingCfg {
    skill_id = 40441,
    level = 4,
    item_cost = [13002,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 80,
    des = "喷射激光，攻击前方20米范围目标2次，造成{a}%攻击的伤害，有一定几率降低目标的{b}%命中等级，持续{c}秒",
    character_a = "475",
    character_b = "31.2",
    character_c = "5",
    fightForce = 9000
    };
getRow(40441,5)->
    #pet_skills_upgradingCfg {
    skill_id = 40441,
    level = 5,
    item_cost = [13002,3],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 100,
    des = "喷射激光，攻击前方20米范围目标2次，造成{a}%攻击的伤害，有一定几率降低目标的{b}%命中等级，持续{c}秒",
    character_a = "543",
    character_b = "31.6",
    character_c = "5",
    fightForce = 14400
    };
getRow(40441,6)->
    #pet_skills_upgradingCfg {
    skill_id = 40441,
    level = 6,
    item_cost = [13002,3],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 120,
    des = "喷射激光，攻击前方20米范围目标2次，造成{a}%攻击的伤害，有一定几率降低目标的{b}%命中等级，持续{c}秒",
    character_a = "611",
    character_b = "32",
    character_c = "5",
    fightForce = 19800
    };
getRow(40441,7)->
    #pet_skills_upgradingCfg {
    skill_id = 40441,
    level = 7,
    item_cost = [13002,4],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 140,
    des = "喷射激光，攻击前方20米范围目标2次，造成{a}%攻击的伤害，有一定几率降低目标的{b}%命中等级，持续{c}秒",
    character_a = "679",
    character_b = "32.4",
    character_c = "5",
    fightForce = 27000
    };
getRow(40441,8)->
    #pet_skills_upgradingCfg {
    skill_id = 40441,
    level = 8,
    item_cost = [13002,4],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 160,
    des = "喷射激光，攻击前方20米范围目标2次，造成{a}%攻击的伤害，有一定几率降低目标的{b}%命中等级，持续{c}秒",
    character_a = "747",
    character_b = "32.8",
    character_c = "5",
    fightForce = 34200
    };
getRow(40441,9)->
    #pet_skills_upgradingCfg {
    skill_id = 40441,
    level = 9,
    item_cost = [13002,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 180,
    des = "喷射激光，攻击前方20米范围目标2次，造成{a}%攻击的伤害，有一定几率降低目标的{b}%命中等级，持续{c}秒",
    character_a = "815",
    character_b = "33.2",
    character_c = "5",
    fightForce = 43200
    };
getRow(40441,10)->
    #pet_skills_upgradingCfg {
    skill_id = 40441,
    level = 10,
    item_cost = [13002,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 200,
    des = "喷射激光，攻击前方20米范围目标2次，造成{a}%攻击的伤害，有一定几率降低目标的{b}%命中等级，持续{c}秒",
    character_a = "883",
    character_b = "33.6",
    character_c = "5",
    fightForce = 52200
    };
getRow(40441,11)->
    #pet_skills_upgradingCfg {
    skill_id = 40441,
    level = 11,
    item_cost = [13002,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 200,
    des = "喷射激光，攻击前方20米范围目标2次，造成{a}%攻击的伤害，有一定几率降低目标的{b}%命中等级，持续{c}秒",
    character_a = "951",
    character_b = "34",
    character_c = "5",
    fightForce = 61200
    };
getRow(40442,1)->
    #pet_skills_upgradingCfg {
    skill_id = 40442,
    level = 1,
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "直升机进行盘旋轰炸，对周围15米范围内目标进行轰击3次，造成{a}%攻击的伤害，有一定几率造成眩晕效果，持续{c}秒",
    character_a = "130",
    character_b = "",
    character_c = "2",
    fightForce = 0
    };
getRow(40442,2)->
    #pet_skills_upgradingCfg {
    skill_id = 40442,
    level = 2,
    item_cost = [13002,1],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 40,
    des = "直升机进行盘旋轰炸，对周围15米范围内目标进行轰击3次，造成{a}%攻击的伤害，有一定几率造成眩晕效果，持续{c}秒",
    character_a = "163",
    character_b = "",
    character_c = "2",
    fightForce = 1800
    };
getRow(40442,3)->
    #pet_skills_upgradingCfg {
    skill_id = 40442,
    level = 3,
    item_cost = [13002,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 60,
    des = "直升机进行盘旋轰炸，对周围15米范围内目标进行轰击3次，造成{a}%攻击的伤害，有一定几率造成眩晕效果，持续{c}秒",
    character_a = "196",
    character_b = "",
    character_c = "2",
    fightForce = 5400
    };
getRow(40442,4)->
    #pet_skills_upgradingCfg {
    skill_id = 40442,
    level = 4,
    item_cost = [13002,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 80,
    des = "直升机进行盘旋轰炸，对周围15米范围内目标进行轰击3次，造成{a}%攻击的伤害，有一定几率造成眩晕效果，持续{c}秒",
    character_a = "229",
    character_b = "",
    character_c = "2",
    fightForce = 9000
    };
getRow(40442,5)->
    #pet_skills_upgradingCfg {
    skill_id = 40442,
    level = 5,
    item_cost = [13002,3],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 100,
    des = "直升机进行盘旋轰炸，对周围15米范围内目标进行轰击3次，造成{a}%攻击的伤害，有一定几率造成眩晕效果，持续{c}秒",
    character_a = "262",
    character_b = "",
    character_c = "2",
    fightForce = 14400
    };
getRow(40442,6)->
    #pet_skills_upgradingCfg {
    skill_id = 40442,
    level = 6,
    item_cost = [13002,3],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 120,
    des = "直升机进行盘旋轰炸，对周围15米范围内目标进行轰击3次，造成{a}%攻击的伤害，有一定几率造成眩晕效果，持续{c}秒",
    character_a = "295",
    character_b = "",
    character_c = "2",
    fightForce = 19800
    };
getRow(40442,7)->
    #pet_skills_upgradingCfg {
    skill_id = 40442,
    level = 7,
    item_cost = [13002,4],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 140,
    des = "直升机进行盘旋轰炸，对周围15米范围内目标进行轰击3次，造成{a}%攻击的伤害，有一定几率造成眩晕效果，持续{c}秒",
    character_a = "328",
    character_b = "",
    character_c = "2",
    fightForce = 27000
    };
getRow(40442,8)->
    #pet_skills_upgradingCfg {
    skill_id = 40442,
    level = 8,
    item_cost = [13002,4],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 160,
    des = "直升机进行盘旋轰炸，对周围15米范围内目标进行轰击3次，造成{a}%攻击的伤害，有一定几率造成眩晕效果，持续{c}秒",
    character_a = "361",
    character_b = "",
    character_c = "2",
    fightForce = 34200
    };
getRow(40442,9)->
    #pet_skills_upgradingCfg {
    skill_id = 40442,
    level = 9,
    item_cost = [13002,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 180,
    des = "直升机进行盘旋轰炸，对周围15米范围内目标进行轰击3次，造成{a}%攻击的伤害，有一定几率造成眩晕效果，持续{c}秒",
    character_a = "394",
    character_b = "",
    character_c = "2",
    fightForce = 43200
    };
getRow(40442,10)->
    #pet_skills_upgradingCfg {
    skill_id = 40442,
    level = 10,
    item_cost = [13002,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 200,
    des = "直升机进行盘旋轰炸，对周围15米范围内目标进行轰击3次，造成{a}%攻击的伤害，有一定几率造成眩晕效果，持续{c}秒",
    character_a = "427",
    character_b = "",
    character_c = "2",
    fightForce = 52200
    };
getRow(40442,11)->
    #pet_skills_upgradingCfg {
    skill_id = 40442,
    level = 11,
    item_cost = [13002,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 200,
    des = "直升机进行盘旋轰炸，对周围15米范围内目标进行轰击3次，造成{a}%攻击的伤害，有一定几率造成眩晕效果，持续{c}秒",
    character_a = "460",
    character_b = "",
    character_c = "2",
    fightForce = 61200
    };
getRow(40450,1)->
    #pet_skills_upgradingCfg {
    skill_id = 40450,
    level = 1,
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "攻击前方扇形敌人，造成{a}%攻击的伤害",
    character_a = "768",
    character_b = "",
    character_c = "",
    fightForce = 0
    };
getRow(40450,2)->
    #pet_skills_upgradingCfg {
    skill_id = 40450,
    level = 2,
    item_cost = [13002,1],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 40,
    des = "攻击前方扇形敌人，造成{a}%攻击的伤害",
    character_a = "924",
    character_b = "",
    character_c = "",
    fightForce = 1800
    };
getRow(40450,3)->
    #pet_skills_upgradingCfg {
    skill_id = 40450,
    level = 3,
    item_cost = [13002,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 60,
    des = "攻击前方扇形敌人，造成{a}%攻击的伤害",
    character_a = "1080",
    character_b = "",
    character_c = "",
    fightForce = 5400
    };
getRow(40450,4)->
    #pet_skills_upgradingCfg {
    skill_id = 40450,
    level = 4,
    item_cost = [13002,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 80,
    des = "攻击前方扇形敌人，造成{a}%攻击的伤害",
    character_a = "1236",
    character_b = "",
    character_c = "",
    fightForce = 9000
    };
getRow(40450,5)->
    #pet_skills_upgradingCfg {
    skill_id = 40450,
    level = 5,
    item_cost = [13002,3],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 100,
    des = "攻击前方扇形敌人，造成{a}%攻击的伤害",
    character_a = "1392",
    character_b = "",
    character_c = "",
    fightForce = 14400
    };
getRow(40450,6)->
    #pet_skills_upgradingCfg {
    skill_id = 40450,
    level = 6,
    item_cost = [13002,3],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 120,
    des = "攻击前方扇形敌人，造成{a}%攻击的伤害",
    character_a = "1548",
    character_b = "",
    character_c = "",
    fightForce = 19800
    };
getRow(40450,7)->
    #pet_skills_upgradingCfg {
    skill_id = 40450,
    level = 7,
    item_cost = [13002,4],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 140,
    des = "攻击前方扇形敌人，造成{a}%攻击的伤害",
    character_a = "1704",
    character_b = "",
    character_c = "",
    fightForce = 27000
    };
getRow(40450,8)->
    #pet_skills_upgradingCfg {
    skill_id = 40450,
    level = 8,
    item_cost = [13002,4],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 160,
    des = "攻击前方扇形敌人，造成{a}%攻击的伤害",
    character_a = "1860",
    character_b = "",
    character_c = "",
    fightForce = 34200
    };
getRow(40450,9)->
    #pet_skills_upgradingCfg {
    skill_id = 40450,
    level = 9,
    item_cost = [13002,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 180,
    des = "攻击前方扇形敌人，造成{a}%攻击的伤害",
    character_a = "2016",
    character_b = "",
    character_c = "",
    fightForce = 43200
    };
getRow(40450,10)->
    #pet_skills_upgradingCfg {
    skill_id = 40450,
    level = 10,
    item_cost = [13002,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 200,
    des = "攻击前方扇形敌人，造成{a}%攻击的伤害",
    character_a = "2172",
    character_b = "",
    character_c = "",
    fightForce = 52200
    };
getRow(40450,11)->
    #pet_skills_upgradingCfg {
    skill_id = 40450,
    level = 11,
    item_cost = [13002,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 200,
    des = "攻击前方扇形敌人，造成{a}%攻击的伤害",
    character_a = "2328",
    character_b = "",
    character_c = "",
    fightForce = 61200
    };
getRow(40451,1)->
    #pet_skills_upgradingCfg {
    skill_id = 40451,
    level = 1,
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "蓄力攻击前方10米范围敌人，造成{a}%攻击的伤害，并昏迷{c}秒",
    character_a = "336",
    character_b = "",
    character_c = "2",
    fightForce = 0
    };
getRow(40451,2)->
    #pet_skills_upgradingCfg {
    skill_id = 40451,
    level = 2,
    item_cost = [13002,1],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 40,
    des = "蓄力攻击前方10米范围敌人，造成{a}%攻击的伤害，并昏迷{c}秒",
    character_a = "403",
    character_b = "",
    character_c = "2",
    fightForce = 1800
    };
getRow(40451,3)->
    #pet_skills_upgradingCfg {
    skill_id = 40451,
    level = 3,
    item_cost = [13002,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 60,
    des = "蓄力攻击前方10米范围敌人，造成{a}%攻击的伤害，并昏迷{c}秒",
    character_a = "470",
    character_b = "",
    character_c = "2",
    fightForce = 5400
    };
getRow(40451,4)->
    #pet_skills_upgradingCfg {
    skill_id = 40451,
    level = 4,
    item_cost = [13002,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 80,
    des = "蓄力攻击前方10米范围敌人，造成{a}%攻击的伤害，并昏迷{c}秒",
    character_a = "537",
    character_b = "",
    character_c = "2",
    fightForce = 9000
    };
getRow(40451,5)->
    #pet_skills_upgradingCfg {
    skill_id = 40451,
    level = 5,
    item_cost = [13002,3],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 100,
    des = "蓄力攻击前方10米范围敌人，造成{a}%攻击的伤害，并昏迷{c}秒",
    character_a = "604",
    character_b = "",
    character_c = "2",
    fightForce = 14400
    };
getRow(40451,6)->
    #pet_skills_upgradingCfg {
    skill_id = 40451,
    level = 6,
    item_cost = [13002,3],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 120,
    des = "蓄力攻击前方10米范围敌人，造成{a}%攻击的伤害，并昏迷{c}秒",
    character_a = "671",
    character_b = "",
    character_c = "2",
    fightForce = 19800
    };
getRow(40451,7)->
    #pet_skills_upgradingCfg {
    skill_id = 40451,
    level = 7,
    item_cost = [13002,4],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 140,
    des = "蓄力攻击前方10米范围敌人，造成{a}%攻击的伤害，并昏迷{c}秒",
    character_a = "738",
    character_b = "",
    character_c = "2",
    fightForce = 27000
    };
getRow(40451,8)->
    #pet_skills_upgradingCfg {
    skill_id = 40451,
    level = 8,
    item_cost = [13002,4],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 160,
    des = "蓄力攻击前方10米范围敌人，造成{a}%攻击的伤害，并昏迷{c}秒",
    character_a = "805",
    character_b = "",
    character_c = "2",
    fightForce = 34200
    };
getRow(40451,9)->
    #pet_skills_upgradingCfg {
    skill_id = 40451,
    level = 9,
    item_cost = [13002,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 180,
    des = "蓄力攻击前方10米范围敌人，造成{a}%攻击的伤害，并昏迷{c}秒",
    character_a = "872",
    character_b = "",
    character_c = "2",
    fightForce = 43200
    };
getRow(40451,10)->
    #pet_skills_upgradingCfg {
    skill_id = 40451,
    level = 10,
    item_cost = [13002,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 200,
    des = "蓄力攻击前方10米范围敌人，造成{a}%攻击的伤害，并昏迷{c}秒",
    character_a = "939",
    character_b = "",
    character_c = "2",
    fightForce = 52200
    };
getRow(40451,11)->
    #pet_skills_upgradingCfg {
    skill_id = 40451,
    level = 11,
    item_cost = [13002,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 200,
    des = "蓄力攻击前方10米范围敌人，造成{a}%攻击的伤害，并昏迷{c}秒",
    character_a = "1006",
    character_b = "",
    character_c = "2",
    fightForce = 61200
    };
getRow(40452,1)->
    #pet_skills_upgradingCfg {
    skill_id = 40452,
    level = 1,
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "立刻为主人恢复{a}%攻击的生命值",
    character_a = "307",
    character_b = "",
    character_c = "",
    fightForce = 0
    };
getRow(40452,2)->
    #pet_skills_upgradingCfg {
    skill_id = 40452,
    level = 2,
    item_cost = [13002,1],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 40,
    des = "立刻为主人恢复{a}%攻击的生命值",
    character_a = "342",
    character_b = "",
    character_c = "",
    fightForce = 1800
    };
getRow(40452,3)->
    #pet_skills_upgradingCfg {
    skill_id = 40452,
    level = 3,
    item_cost = [13002,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 60,
    des = "立刻为主人恢复{a}%攻击的生命值",
    character_a = "377",
    character_b = "",
    character_c = "",
    fightForce = 5400
    };
getRow(40452,4)->
    #pet_skills_upgradingCfg {
    skill_id = 40452,
    level = 4,
    item_cost = [13002,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 80,
    des = "立刻为主人恢复{a}%攻击的生命值",
    character_a = "412",
    character_b = "",
    character_c = "",
    fightForce = 9000
    };
getRow(40452,5)->
    #pet_skills_upgradingCfg {
    skill_id = 40452,
    level = 5,
    item_cost = [13002,3],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 100,
    des = "立刻为主人恢复{a}%攻击的生命值",
    character_a = "447",
    character_b = "",
    character_c = "",
    fightForce = 14400
    };
getRow(40452,6)->
    #pet_skills_upgradingCfg {
    skill_id = 40452,
    level = 6,
    item_cost = [13002,3],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 120,
    des = "立刻为主人恢复{a}%攻击的生命值",
    character_a = "482",
    character_b = "",
    character_c = "",
    fightForce = 19800
    };
getRow(40452,7)->
    #pet_skills_upgradingCfg {
    skill_id = 40452,
    level = 7,
    item_cost = [13002,4],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 140,
    des = "立刻为主人恢复{a}%攻击的生命值",
    character_a = "517",
    character_b = "",
    character_c = "",
    fightForce = 27000
    };
getRow(40452,8)->
    #pet_skills_upgradingCfg {
    skill_id = 40452,
    level = 8,
    item_cost = [13002,4],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 160,
    des = "立刻为主人恢复{a}%攻击的生命值",
    character_a = "552",
    character_b = "",
    character_c = "",
    fightForce = 34200
    };
getRow(40452,9)->
    #pet_skills_upgradingCfg {
    skill_id = 40452,
    level = 9,
    item_cost = [13002,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 180,
    des = "立刻为主人恢复{a}%攻击的生命值",
    character_a = "587",
    character_b = "",
    character_c = "",
    fightForce = 43200
    };
getRow(40452,10)->
    #pet_skills_upgradingCfg {
    skill_id = 40452,
    level = 10,
    item_cost = [13002,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 200,
    des = "立刻为主人恢复{a}%攻击的生命值",
    character_a = "622",
    character_b = "",
    character_c = "",
    fightForce = 52200
    };
getRow(40452,11)->
    #pet_skills_upgradingCfg {
    skill_id = 40452,
    level = 11,
    item_cost = [13002,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 200,
    des = "立刻为主人恢复{a}%攻击的生命值",
    character_a = "657",
    character_b = "",
    character_c = "",
    fightForce = 61200
    };
getRow(40480,1)->
    #pet_skills_upgradingCfg {
    skill_id = 40480,
    level = 1,
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "攻击前方敌人，造成{a}%攻击的伤害",
    character_a = "426",
    character_b = "",
    character_c = "",
    fightForce = 0
    };
getRow(40480,2)->
    #pet_skills_upgradingCfg {
    skill_id = 40480,
    level = 2,
    item_cost = [13002,1],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 40,
    des = "攻击前方敌人，造成{a}%攻击的伤害",
    character_a = "512",
    character_b = "",
    character_c = "",
    fightForce = 1800
    };
getRow(40480,3)->
    #pet_skills_upgradingCfg {
    skill_id = 40480,
    level = 3,
    item_cost = [13002,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 60,
    des = "攻击前方敌人，造成{a}%攻击的伤害",
    character_a = "598",
    character_b = "",
    character_c = "",
    fightForce = 5400
    };
getRow(40480,4)->
    #pet_skills_upgradingCfg {
    skill_id = 40480,
    level = 4,
    item_cost = [13002,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 80,
    des = "攻击前方敌人，造成{a}%攻击的伤害",
    character_a = "684",
    character_b = "",
    character_c = "",
    fightForce = 9000
    };
getRow(40480,5)->
    #pet_skills_upgradingCfg {
    skill_id = 40480,
    level = 5,
    item_cost = [13002,3],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 100,
    des = "攻击前方敌人，造成{a}%攻击的伤害",
    character_a = "770",
    character_b = "",
    character_c = "",
    fightForce = 14400
    };
getRow(40480,6)->
    #pet_skills_upgradingCfg {
    skill_id = 40480,
    level = 6,
    item_cost = [13002,3],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 120,
    des = "攻击前方敌人，造成{a}%攻击的伤害",
    character_a = "856",
    character_b = "",
    character_c = "",
    fightForce = 19800
    };
getRow(40480,7)->
    #pet_skills_upgradingCfg {
    skill_id = 40480,
    level = 7,
    item_cost = [13002,4],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 140,
    des = "攻击前方敌人，造成{a}%攻击的伤害",
    character_a = "942",
    character_b = "",
    character_c = "",
    fightForce = 27000
    };
getRow(40480,8)->
    #pet_skills_upgradingCfg {
    skill_id = 40480,
    level = 8,
    item_cost = [13002,4],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 160,
    des = "攻击前方敌人，造成{a}%攻击的伤害",
    character_a = "1028",
    character_b = "",
    character_c = "",
    fightForce = 34200
    };
getRow(40480,9)->
    #pet_skills_upgradingCfg {
    skill_id = 40480,
    level = 9,
    item_cost = [13002,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 180,
    des = "攻击前方敌人，造成{a}%攻击的伤害",
    character_a = "1114",
    character_b = "",
    character_c = "",
    fightForce = 43200
    };
getRow(40480,10)->
    #pet_skills_upgradingCfg {
    skill_id = 40480,
    level = 10,
    item_cost = [13002,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 200,
    des = "攻击前方敌人，造成{a}%攻击的伤害",
    character_a = "1200",
    character_b = "",
    character_c = "",
    fightForce = 52200
    };
getRow(40480,11)->
    #pet_skills_upgradingCfg {
    skill_id = 40480,
    level = 11,
    item_cost = [13002,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 200,
    des = "攻击前方敌人，造成{a}%攻击的伤害",
    character_a = "1286",
    character_b = "",
    character_c = "",
    fightForce = 61200
    };
getRow(40481,1)->
    #pet_skills_upgradingCfg {
    skill_id = 40481,
    level = 1,
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "主人每秒恢复{a}%骑宠攻击的生命值，持续{c}秒",
    character_a = "61",
    character_b = "",
    character_c = "5",
    fightForce = 0
    };
getRow(40481,2)->
    #pet_skills_upgradingCfg {
    skill_id = 40481,
    level = 2,
    item_cost = [13002,1],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 40,
    des = "主人每秒恢复{a}%骑宠攻击的生命值，持续{c}秒",
    character_a = "73",
    character_b = "",
    character_c = "5",
    fightForce = 1800
    };
getRow(40481,3)->
    #pet_skills_upgradingCfg {
    skill_id = 40481,
    level = 3,
    item_cost = [13002,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 60,
    des = "主人每秒恢复{a}%骑宠攻击的生命值，持续{c}秒",
    character_a = "85",
    character_b = "",
    character_c = "5",
    fightForce = 5400
    };
getRow(40481,4)->
    #pet_skills_upgradingCfg {
    skill_id = 40481,
    level = 4,
    item_cost = [13002,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 80,
    des = "主人每秒恢复{a}%骑宠攻击的生命值，持续{c}秒",
    character_a = "97",
    character_b = "",
    character_c = "5",
    fightForce = 9000
    };
getRow(40481,5)->
    #pet_skills_upgradingCfg {
    skill_id = 40481,
    level = 5,
    item_cost = [13002,3],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 100,
    des = "主人每秒恢复{a}%骑宠攻击的生命值，持续{c}秒",
    character_a = "109",
    character_b = "",
    character_c = "5",
    fightForce = 14400
    };
getRow(40481,6)->
    #pet_skills_upgradingCfg {
    skill_id = 40481,
    level = 6,
    item_cost = [13002,3],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 120,
    des = "主人每秒恢复{a}%骑宠攻击的生命值，持续{c}秒",
    character_a = "121",
    character_b = "",
    character_c = "5",
    fightForce = 19800
    };
getRow(40481,7)->
    #pet_skills_upgradingCfg {
    skill_id = 40481,
    level = 7,
    item_cost = [13002,4],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 140,
    des = "主人每秒恢复{a}%骑宠攻击的生命值，持续{c}秒",
    character_a = "133",
    character_b = "",
    character_c = "5",
    fightForce = 27000
    };
getRow(40481,8)->
    #pet_skills_upgradingCfg {
    skill_id = 40481,
    level = 8,
    item_cost = [13002,4],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 160,
    des = "主人每秒恢复{a}%骑宠攻击的生命值，持续{c}秒",
    character_a = "145",
    character_b = "",
    character_c = "5",
    fightForce = 34200
    };
getRow(40481,9)->
    #pet_skills_upgradingCfg {
    skill_id = 40481,
    level = 9,
    item_cost = [13002,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 180,
    des = "主人每秒恢复{a}%骑宠攻击的生命值，持续{c}秒",
    character_a = "157",
    character_b = "",
    character_c = "5",
    fightForce = 43200
    };
getRow(40481,10)->
    #pet_skills_upgradingCfg {
    skill_id = 40481,
    level = 10,
    item_cost = [13002,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 200,
    des = "主人每秒恢复{a}%骑宠攻击的生命值，持续{c}秒",
    character_a = "169",
    character_b = "",
    character_c = "5",
    fightForce = 52200
    };
getRow(40481,11)->
    #pet_skills_upgradingCfg {
    skill_id = 40481,
    level = 11,
    item_cost = [13002,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 200,
    des = "主人每秒恢复{a}%骑宠攻击的生命值，持续{c}秒",
    character_a = "181",
    character_b = "",
    character_c = "5",
    fightForce = 61200
    };
getRow(40482,1)->
    #pet_skills_upgradingCfg {
    skill_id = 40482,
    level = 1,
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "立刻为主人恢复{a}%骑宠攻击的生命值，有50%几率为主人增加爱心护盾，提升主人{b}%防御，持续{c}秒",
    character_a = "365",
    character_b = "40",
    character_c = "5",
    fightForce = 0
    };
getRow(40482,2)->
    #pet_skills_upgradingCfg {
    skill_id = 40482,
    level = 2,
    item_cost = [13002,1],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 40,
    des = "立刻为主人恢复{a}%骑宠攻击的生命值，有50%几率为主人增加爱心护盾，提升主人{b}%防御，持续{c}秒",
    character_a = "437",
    character_b = "44",
    character_c = "5",
    fightForce = 1800
    };
getRow(40482,3)->
    #pet_skills_upgradingCfg {
    skill_id = 40482,
    level = 3,
    item_cost = [13002,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 60,
    des = "立刻为主人恢复{a}%骑宠攻击的生命值，有50%几率为主人增加爱心护盾，提升主人{b}%防御，持续{c}秒",
    character_a = "509",
    character_b = "48",
    character_c = "5",
    fightForce = 5400
    };
getRow(40482,4)->
    #pet_skills_upgradingCfg {
    skill_id = 40482,
    level = 4,
    item_cost = [13002,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 80,
    des = "立刻为主人恢复{a}%骑宠攻击的生命值，有50%几率为主人增加爱心护盾，提升主人{b}%防御，持续{c}秒",
    character_a = "581",
    character_b = "52",
    character_c = "5",
    fightForce = 9000
    };
getRow(40482,5)->
    #pet_skills_upgradingCfg {
    skill_id = 40482,
    level = 5,
    item_cost = [13002,3],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 100,
    des = "立刻为主人恢复{a}%骑宠攻击的生命值，有50%几率为主人增加爱心护盾，提升主人{b}%防御，持续{c}秒",
    character_a = "653",
    character_b = "56",
    character_c = "5",
    fightForce = 14400
    };
getRow(40482,6)->
    #pet_skills_upgradingCfg {
    skill_id = 40482,
    level = 6,
    item_cost = [13002,3],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 120,
    des = "立刻为主人恢复{a}%骑宠攻击的生命值，有50%几率为主人增加爱心护盾，提升主人{b}%防御，持续{c}秒",
    character_a = "725",
    character_b = "60",
    character_c = "5",
    fightForce = 19800
    };
getRow(40482,7)->
    #pet_skills_upgradingCfg {
    skill_id = 40482,
    level = 7,
    item_cost = [13002,4],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 140,
    des = "立刻为主人恢复{a}%骑宠攻击的生命值，有50%几率为主人增加爱心护盾，提升主人{b}%防御，持续{c}秒",
    character_a = "797",
    character_b = "64",
    character_c = "5",
    fightForce = 27000
    };
getRow(40482,8)->
    #pet_skills_upgradingCfg {
    skill_id = 40482,
    level = 8,
    item_cost = [13002,4],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 160,
    des = "立刻为主人恢复{a}%骑宠攻击的生命值，有50%几率为主人增加爱心护盾，提升主人{b}%防御，持续{c}秒",
    character_a = "869",
    character_b = "68",
    character_c = "5",
    fightForce = 34200
    };
getRow(40482,9)->
    #pet_skills_upgradingCfg {
    skill_id = 40482,
    level = 9,
    item_cost = [13002,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 180,
    des = "立刻为主人恢复{a}%骑宠攻击的生命值，有50%几率为主人增加爱心护盾，提升主人{b}%防御，持续{c}秒",
    character_a = "941",
    character_b = "72",
    character_c = "5",
    fightForce = 43200
    };
getRow(40482,10)->
    #pet_skills_upgradingCfg {
    skill_id = 40482,
    level = 10,
    item_cost = [13002,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 200,
    des = "立刻为主人恢复{a}%骑宠攻击的生命值，有50%几率为主人增加爱心护盾，提升主人{b}%防御，持续{c}秒",
    character_a = "1013",
    character_b = "76",
    character_c = "5",
    fightForce = 52200
    };
getRow(40482,11)->
    #pet_skills_upgradingCfg {
    skill_id = 40482,
    level = 11,
    item_cost = [13002,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 200,
    des = "立刻为主人恢复{a}%骑宠攻击的生命值，有50%几率为主人增加爱心护盾，提升主人{b}%防御，持续{c}秒",
    character_a = "1085",
    character_b = "80",
    character_c = "5",
    fightForce = 61200
    };
getRow(40500,1)->
    #pet_skills_upgradingCfg {
    skill_id = 40500,
    level = 1,
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "攻击前方敌人，共造成{a}%攻击的伤害",
    character_a = "691",
    character_b = "",
    character_c = "",
    fightForce = 0
    };
getRow(40500,2)->
    #pet_skills_upgradingCfg {
    skill_id = 40500,
    level = 2,
    item_cost = [13002,1],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 40,
    des = "攻击前方敌人，共造成{a}%攻击的伤害",
    character_a = "831",
    character_b = "",
    character_c = "",
    fightForce = 1800
    };
getRow(40500,3)->
    #pet_skills_upgradingCfg {
    skill_id = 40500,
    level = 3,
    item_cost = [13002,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 60,
    des = "攻击前方敌人，共造成{a}%攻击的伤害",
    character_a = "971",
    character_b = "",
    character_c = "",
    fightForce = 5400
    };
getRow(40500,4)->
    #pet_skills_upgradingCfg {
    skill_id = 40500,
    level = 4,
    item_cost = [13002,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 80,
    des = "攻击前方敌人，共造成{a}%攻击的伤害",
    character_a = "1111",
    character_b = "",
    character_c = "",
    fightForce = 9000
    };
getRow(40500,5)->
    #pet_skills_upgradingCfg {
    skill_id = 40500,
    level = 5,
    item_cost = [13002,3],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 100,
    des = "攻击前方敌人，共造成{a}%攻击的伤害",
    character_a = "1251",
    character_b = "",
    character_c = "",
    fightForce = 14400
    };
getRow(40500,6)->
    #pet_skills_upgradingCfg {
    skill_id = 40500,
    level = 6,
    item_cost = [13002,3],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 120,
    des = "攻击前方敌人，共造成{a}%攻击的伤害",
    character_a = "1391",
    character_b = "",
    character_c = "",
    fightForce = 19800
    };
getRow(40500,7)->
    #pet_skills_upgradingCfg {
    skill_id = 40500,
    level = 7,
    item_cost = [13002,4],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 140,
    des = "攻击前方敌人，共造成{a}%攻击的伤害",
    character_a = "1531",
    character_b = "",
    character_c = "",
    fightForce = 27000
    };
getRow(40500,8)->
    #pet_skills_upgradingCfg {
    skill_id = 40500,
    level = 8,
    item_cost = [13002,4],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 160,
    des = "攻击前方敌人，共造成{a}%攻击的伤害",
    character_a = "1671",
    character_b = "",
    character_c = "",
    fightForce = 34200
    };
getRow(40500,9)->
    #pet_skills_upgradingCfg {
    skill_id = 40500,
    level = 9,
    item_cost = [13002,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 180,
    des = "攻击前方敌人，共造成{a}%攻击的伤害",
    character_a = "1811",
    character_b = "",
    character_c = "",
    fightForce = 43200
    };
getRow(40500,10)->
    #pet_skills_upgradingCfg {
    skill_id = 40500,
    level = 10,
    item_cost = [13002,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 200,
    des = "攻击前方敌人，共造成{a}%攻击的伤害",
    character_a = "1951",
    character_b = "",
    character_c = "",
    fightForce = 52200
    };
getRow(40500,11)->
    #pet_skills_upgradingCfg {
    skill_id = 40500,
    level = 11,
    item_cost = [13002,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 200,
    des = "攻击前方敌人，共造成{a}%攻击的伤害",
    character_a = "2091",
    character_b = "",
    character_c = "",
    fightForce = 61200
    };
getRow(40501,1)->
    #pet_skills_upgradingCfg {
    skill_id = 40501,
    level = 1,
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "主人的物理防御和魔法防御提升{b}%，持续{c}秒",
    character_a = "720",
    character_b = "40",
    character_c = "5",
    fightForce = 0
    };
getRow(40501,2)->
    #pet_skills_upgradingCfg {
    skill_id = 40501,
    level = 2,
    item_cost = [13002,1],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 40,
    des = "主人的物理防御和魔法防御提升{b}%，持续{c}秒",
    character_a = "864",
    character_b = "44",
    character_c = "5",
    fightForce = 1800
    };
getRow(40501,3)->
    #pet_skills_upgradingCfg {
    skill_id = 40501,
    level = 3,
    item_cost = [13002,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 60,
    des = "主人的物理防御和魔法防御提升{b}%，持续{c}秒",
    character_a = "1008",
    character_b = "48",
    character_c = "5",
    fightForce = 5400
    };
getRow(40501,4)->
    #pet_skills_upgradingCfg {
    skill_id = 40501,
    level = 4,
    item_cost = [13002,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 80,
    des = "主人的物理防御和魔法防御提升{b}%，持续{c}秒",
    character_a = "1152",
    character_b = "52",
    character_c = "5",
    fightForce = 9000
    };
getRow(40501,5)->
    #pet_skills_upgradingCfg {
    skill_id = 40501,
    level = 5,
    item_cost = [13002,3],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 100,
    des = "主人的物理防御和魔法防御提升{b}%，持续{c}秒",
    character_a = "1296",
    character_b = "56",
    character_c = "5",
    fightForce = 14400
    };
getRow(40501,6)->
    #pet_skills_upgradingCfg {
    skill_id = 40501,
    level = 6,
    item_cost = [13002,3],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 120,
    des = "主人的物理防御和魔法防御提升{b}%，持续{c}秒",
    character_a = "1440",
    character_b = "60",
    character_c = "5",
    fightForce = 19800
    };
getRow(40501,7)->
    #pet_skills_upgradingCfg {
    skill_id = 40501,
    level = 7,
    item_cost = [13002,4],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 140,
    des = "主人的物理防御和魔法防御提升{b}%，持续{c}秒",
    character_a = "1584",
    character_b = "64",
    character_c = "5",
    fightForce = 27000
    };
getRow(40501,8)->
    #pet_skills_upgradingCfg {
    skill_id = 40501,
    level = 8,
    item_cost = [13002,4],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 160,
    des = "主人的物理防御和魔法防御提升{b}%，持续{c}秒",
    character_a = "1728",
    character_b = "68",
    character_c = "5",
    fightForce = 34200
    };
getRow(40501,9)->
    #pet_skills_upgradingCfg {
    skill_id = 40501,
    level = 9,
    item_cost = [13002,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 180,
    des = "主人的物理防御和魔法防御提升{b}%，持续{c}秒",
    character_a = "1872",
    character_b = "72",
    character_c = "5",
    fightForce = 43200
    };
getRow(40501,10)->
    #pet_skills_upgradingCfg {
    skill_id = 40501,
    level = 10,
    item_cost = [13002,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 200,
    des = "主人的物理防御和魔法防御提升{b}%，持续{c}秒",
    character_a = "2016",
    character_b = "76",
    character_c = "5",
    fightForce = 52200
    };
getRow(40501,11)->
    #pet_skills_upgradingCfg {
    skill_id = 40501,
    level = 11,
    item_cost = [13002,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 200,
    des = "主人的物理防御和魔法防御提升{b}%，持续{c}秒",
    character_a = "2160",
    character_b = "80",
    character_c = "5",
    fightForce = 61200
    };
getRow(40502,1)->
    #pet_skills_upgradingCfg {
    skill_id = 40502,
    level = 1,
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "立刻为主人恢复{a}%攻击的生命值",
    character_a = "346",
    character_b = "",
    character_c = "",
    fightForce = 0
    };
getRow(40502,2)->
    #pet_skills_upgradingCfg {
    skill_id = 40502,
    level = 2,
    item_cost = [13002,1],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 40,
    des = "立刻为主人恢复{a}%攻击的生命值",
    character_a = "414",
    character_b = "",
    character_c = "",
    fightForce = 1800
    };
getRow(40502,3)->
    #pet_skills_upgradingCfg {
    skill_id = 40502,
    level = 3,
    item_cost = [13002,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 60,
    des = "立刻为主人恢复{a}%攻击的生命值",
    character_a = "482",
    character_b = "",
    character_c = "",
    fightForce = 5400
    };
getRow(40502,4)->
    #pet_skills_upgradingCfg {
    skill_id = 40502,
    level = 4,
    item_cost = [13002,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 80,
    des = "立刻为主人恢复{a}%攻击的生命值",
    character_a = "550",
    character_b = "",
    character_c = "",
    fightForce = 9000
    };
getRow(40502,5)->
    #pet_skills_upgradingCfg {
    skill_id = 40502,
    level = 5,
    item_cost = [13002,3],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 100,
    des = "立刻为主人恢复{a}%攻击的生命值",
    character_a = "618",
    character_b = "",
    character_c = "",
    fightForce = 14400
    };
getRow(40502,6)->
    #pet_skills_upgradingCfg {
    skill_id = 40502,
    level = 6,
    item_cost = [13002,3],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 120,
    des = "立刻为主人恢复{a}%攻击的生命值",
    character_a = "686",
    character_b = "",
    character_c = "",
    fightForce = 19800
    };
getRow(40502,7)->
    #pet_skills_upgradingCfg {
    skill_id = 40502,
    level = 7,
    item_cost = [13002,4],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 140,
    des = "立刻为主人恢复{a}%攻击的生命值",
    character_a = "754",
    character_b = "",
    character_c = "",
    fightForce = 27000
    };
getRow(40502,8)->
    #pet_skills_upgradingCfg {
    skill_id = 40502,
    level = 8,
    item_cost = [13002,4],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 160,
    des = "立刻为主人恢复{a}%攻击的生命值",
    character_a = "822",
    character_b = "",
    character_c = "",
    fightForce = 34200
    };
getRow(40502,9)->
    #pet_skills_upgradingCfg {
    skill_id = 40502,
    level = 9,
    item_cost = [13002,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 180,
    des = "立刻为主人恢复{a}%攻击的生命值",
    character_a = "890",
    character_b = "",
    character_c = "",
    fightForce = 43200
    };
getRow(40502,10)->
    #pet_skills_upgradingCfg {
    skill_id = 40502,
    level = 10,
    item_cost = [13002,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 200,
    des = "立刻为主人恢复{a}%攻击的生命值",
    character_a = "958",
    character_b = "",
    character_c = "",
    fightForce = 52200
    };
getRow(40502,11)->
    #pet_skills_upgradingCfg {
    skill_id = 40502,
    level = 11,
    item_cost = [13002,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 200,
    des = "立刻为主人恢复{a}%攻击的生命值",
    character_a = "1026",
    character_b = "",
    character_c = "",
    fightForce = 61200
    };
getRow(40510,1)->
    #pet_skills_upgradingCfg {
    skill_id = 40510,
    level = 1,
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "攻击前方敌人，共造成{a}%攻击的伤害",
    character_a = "691",
    character_b = "",
    character_c = "",
    fightForce = 0
    };
getRow(40510,2)->
    #pet_skills_upgradingCfg {
    skill_id = 40510,
    level = 2,
    item_cost = [13001,1],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 40,
    des = "攻击前方敌人，共造成{a}%攻击的伤害",
    character_a = "810",
    character_b = "",
    character_c = "",
    fightForce = 900
    };
getRow(40510,3)->
    #pet_skills_upgradingCfg {
    skill_id = 40510,
    level = 3,
    item_cost = [13001,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 60,
    des = "攻击前方敌人，共造成{a}%攻击的伤害",
    character_a = "929",
    character_b = "",
    character_c = "",
    fightForce = 2700
    };
getRow(40510,4)->
    #pet_skills_upgradingCfg {
    skill_id = 40510,
    level = 4,
    item_cost = [13001,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 80,
    des = "攻击前方敌人，共造成{a}%攻击的伤害",
    character_a = "1048",
    character_b = "",
    character_c = "",
    fightForce = 4500
    };
getRow(40510,5)->
    #pet_skills_upgradingCfg {
    skill_id = 40510,
    level = 5,
    item_cost = [13001,3],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 100,
    des = "攻击前方敌人，共造成{a}%攻击的伤害",
    character_a = "1167",
    character_b = "",
    character_c = "",
    fightForce = 7200
    };
getRow(40510,6)->
    #pet_skills_upgradingCfg {
    skill_id = 40510,
    level = 6,
    item_cost = [13001,3],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 120,
    des = "攻击前方敌人，共造成{a}%攻击的伤害",
    character_a = "1286",
    character_b = "",
    character_c = "",
    fightForce = 9900
    };
getRow(40510,7)->
    #pet_skills_upgradingCfg {
    skill_id = 40510,
    level = 7,
    item_cost = [13001,4],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 140,
    des = "攻击前方敌人，共造成{a}%攻击的伤害",
    character_a = "1405",
    character_b = "",
    character_c = "",
    fightForce = 13500
    };
getRow(40510,8)->
    #pet_skills_upgradingCfg {
    skill_id = 40510,
    level = 8,
    item_cost = [13001,4],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 160,
    des = "攻击前方敌人，共造成{a}%攻击的伤害",
    character_a = "1524",
    character_b = "",
    character_c = "",
    fightForce = 17100
    };
getRow(40510,9)->
    #pet_skills_upgradingCfg {
    skill_id = 40510,
    level = 9,
    item_cost = [13001,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 180,
    des = "攻击前方敌人，共造成{a}%攻击的伤害",
    character_a = "1643",
    character_b = "",
    character_c = "",
    fightForce = 21600
    };
getRow(40510,10)->
    #pet_skills_upgradingCfg {
    skill_id = 40510,
    level = 10,
    item_cost = [13001,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 200,
    des = "攻击前方敌人，共造成{a}%攻击的伤害",
    character_a = "1762",
    character_b = "",
    character_c = "",
    fightForce = 26100
    };
getRow(40510,11)->
    #pet_skills_upgradingCfg {
    skill_id = 40510,
    level = 11,
    item_cost = [13001,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 200,
    des = "攻击前方敌人，共造成{a}%攻击的伤害",
    character_a = "1881",
    character_b = "",
    character_c = "",
    fightForce = 30600
    };
getRow(40511,1)->
    #pet_skills_upgradingCfg {
    skill_id = 40511,
    level = 1,
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "主人的物理防御和魔法防御提升{b}%，持续{c}秒",
    character_a = "720",
    character_b = "40",
    character_c = "5",
    fightForce = 0
    };
getRow(40511,2)->
    #pet_skills_upgradingCfg {
    skill_id = 40511,
    level = 2,
    item_cost = [13001,1],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 40,
    des = "主人的物理防御和魔法防御提升{b}%，持续{c}秒",
    character_a = "846",
    character_b = "44",
    character_c = "5",
    fightForce = 900
    };
getRow(40511,3)->
    #pet_skills_upgradingCfg {
    skill_id = 40511,
    level = 3,
    item_cost = [13001,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 60,
    des = "主人的物理防御和魔法防御提升{b}%，持续{c}秒",
    character_a = "972",
    character_b = "48",
    character_c = "5",
    fightForce = 2700
    };
getRow(40511,4)->
    #pet_skills_upgradingCfg {
    skill_id = 40511,
    level = 4,
    item_cost = [13001,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 80,
    des = "主人的物理防御和魔法防御提升{b}%，持续{c}秒",
    character_a = "1098",
    character_b = "52",
    character_c = "5",
    fightForce = 4500
    };
getRow(40511,5)->
    #pet_skills_upgradingCfg {
    skill_id = 40511,
    level = 5,
    item_cost = [13001,3],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 100,
    des = "主人的物理防御和魔法防御提升{b}%，持续{c}秒",
    character_a = "1224",
    character_b = "56",
    character_c = "5",
    fightForce = 7200
    };
getRow(40511,6)->
    #pet_skills_upgradingCfg {
    skill_id = 40511,
    level = 6,
    item_cost = [13001,3],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 120,
    des = "主人的物理防御和魔法防御提升{b}%，持续{c}秒",
    character_a = "1350",
    character_b = "60",
    character_c = "5",
    fightForce = 9900
    };
getRow(40511,7)->
    #pet_skills_upgradingCfg {
    skill_id = 40511,
    level = 7,
    item_cost = [13001,4],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 140,
    des = "主人的物理防御和魔法防御提升{b}%，持续{c}秒",
    character_a = "1476",
    character_b = "64",
    character_c = "5",
    fightForce = 13500
    };
getRow(40511,8)->
    #pet_skills_upgradingCfg {
    skill_id = 40511,
    level = 8,
    item_cost = [13001,4],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 160,
    des = "主人的物理防御和魔法防御提升{b}%，持续{c}秒",
    character_a = "1602",
    character_b = "68",
    character_c = "5",
    fightForce = 17100
    };
getRow(40511,9)->
    #pet_skills_upgradingCfg {
    skill_id = 40511,
    level = 9,
    item_cost = [13001,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 180,
    des = "主人的物理防御和魔法防御提升{b}%，持续{c}秒",
    character_a = "1728",
    character_b = "72",
    character_c = "5",
    fightForce = 21600
    };
getRow(40511,10)->
    #pet_skills_upgradingCfg {
    skill_id = 40511,
    level = 10,
    item_cost = [13001,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 200,
    des = "主人的物理防御和魔法防御提升{b}%，持续{c}秒",
    character_a = "1854",
    character_b = "76",
    character_c = "5",
    fightForce = 26100
    };
getRow(40511,11)->
    #pet_skills_upgradingCfg {
    skill_id = 40511,
    level = 11,
    item_cost = [13001,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 200,
    des = "主人的物理防御和魔法防御提升{b}%，持续{c}秒",
    character_a = "1980",
    character_b = "80",
    character_c = "5",
    fightForce = 30600
    };
getRow(40512,1)->
    #pet_skills_upgradingCfg {
    skill_id = 40512,
    level = 1,
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "立刻为主人恢复{a}%攻击的生命值",
    character_a = "346",
    character_b = "",
    character_c = "",
    fightForce = 0
    };
getRow(40512,2)->
    #pet_skills_upgradingCfg {
    skill_id = 40512,
    level = 2,
    item_cost = [13001,1],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 40,
    des = "立刻为主人恢复{a}%攻击的生命值",
    character_a = "407",
    character_b = "",
    character_c = "",
    fightForce = 900
    };
getRow(40512,3)->
    #pet_skills_upgradingCfg {
    skill_id = 40512,
    level = 3,
    item_cost = [13001,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 60,
    des = "立刻为主人恢复{a}%攻击的生命值",
    character_a = "468",
    character_b = "",
    character_c = "",
    fightForce = 2700
    };
getRow(40512,4)->
    #pet_skills_upgradingCfg {
    skill_id = 40512,
    level = 4,
    item_cost = [13001,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 80,
    des = "立刻为主人恢复{a}%攻击的生命值",
    character_a = "529",
    character_b = "",
    character_c = "",
    fightForce = 4500
    };
getRow(40512,5)->
    #pet_skills_upgradingCfg {
    skill_id = 40512,
    level = 5,
    item_cost = [13001,3],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 100,
    des = "立刻为主人恢复{a}%攻击的生命值",
    character_a = "590",
    character_b = "",
    character_c = "",
    fightForce = 7200
    };
getRow(40512,6)->
    #pet_skills_upgradingCfg {
    skill_id = 40512,
    level = 6,
    item_cost = [13001,3],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 120,
    des = "立刻为主人恢复{a}%攻击的生命值",
    character_a = "651",
    character_b = "",
    character_c = "",
    fightForce = 9900
    };
getRow(40512,7)->
    #pet_skills_upgradingCfg {
    skill_id = 40512,
    level = 7,
    item_cost = [13001,4],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 140,
    des = "立刻为主人恢复{a}%攻击的生命值",
    character_a = "712",
    character_b = "",
    character_c = "",
    fightForce = 13500
    };
getRow(40512,8)->
    #pet_skills_upgradingCfg {
    skill_id = 40512,
    level = 8,
    item_cost = [13001,4],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 160,
    des = "立刻为主人恢复{a}%攻击的生命值",
    character_a = "773",
    character_b = "",
    character_c = "",
    fightForce = 17100
    };
getRow(40512,9)->
    #pet_skills_upgradingCfg {
    skill_id = 40512,
    level = 9,
    item_cost = [13001,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 180,
    des = "立刻为主人恢复{a}%攻击的生命值",
    character_a = "834",
    character_b = "",
    character_c = "",
    fightForce = 21600
    };
getRow(40512,10)->
    #pet_skills_upgradingCfg {
    skill_id = 40512,
    level = 10,
    item_cost = [13001,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 200,
    des = "立刻为主人恢复{a}%攻击的生命值",
    character_a = "895",
    character_b = "",
    character_c = "",
    fightForce = 26100
    };
getRow(40512,11)->
    #pet_skills_upgradingCfg {
    skill_id = 40512,
    level = 11,
    item_cost = [13001,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 200,
    des = "立刻为主人恢复{a}%攻击的生命值",
    character_a = "956",
    character_b = "",
    character_c = "",
    fightForce = 30600
    };
getRow(40520,1)->
    #pet_skills_upgradingCfg {
    skill_id = 40520,
    level = 1,
    item_cost = [],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "立刻为主人和自身恢复{a}%攻击力的生命值",
    character_a = "184",
    character_b = "",
    character_c = "",
    fightForce = 0
    };
getRow(40520,2)->
    #pet_skills_upgradingCfg {
    skill_id = 40520,
    level = 2,
    item_cost = [13002,1],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 40,
    des = "立刻为主人和自身恢复{a}%攻击力的生命值",
    character_a = "221",
    character_b = "",
    character_c = "",
    fightForce = 1800
    };
getRow(40520,3)->
    #pet_skills_upgradingCfg {
    skill_id = 40520,
    level = 3,
    item_cost = [13002,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 60,
    des = "立刻为主人和自身恢复{a}%攻击力的生命值",
    character_a = "258",
    character_b = "",
    character_c = "",
    fightForce = 5400
    };
getRow(40520,4)->
    #pet_skills_upgradingCfg {
    skill_id = 40520,
    level = 4,
    item_cost = [13002,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 80,
    des = "立刻为主人和自身恢复{a}%攻击力的生命值",
    character_a = "295",
    character_b = "",
    character_c = "",
    fightForce = 9000
    };
getRow(40520,5)->
    #pet_skills_upgradingCfg {
    skill_id = 40520,
    level = 5,
    item_cost = [13002,3],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 100,
    des = "立刻为主人和自身恢复{a}%攻击力的生命值",
    character_a = "332",
    character_b = "",
    character_c = "",
    fightForce = 14400
    };
getRow(40520,6)->
    #pet_skills_upgradingCfg {
    skill_id = 40520,
    level = 6,
    item_cost = [13002,3],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 120,
    des = "立刻为主人和自身恢复{a}%攻击力的生命值",
    character_a = "369",
    character_b = "",
    character_c = "",
    fightForce = 19800
    };
getRow(40520,7)->
    #pet_skills_upgradingCfg {
    skill_id = 40520,
    level = 7,
    item_cost = [13002,4],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 140,
    des = "立刻为主人和自身恢复{a}%攻击力的生命值",
    character_a = "406",
    character_b = "",
    character_c = "",
    fightForce = 27000
    };
getRow(40520,8)->
    #pet_skills_upgradingCfg {
    skill_id = 40520,
    level = 8,
    item_cost = [13002,4],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 160,
    des = "立刻为主人和自身恢复{a}%攻击力的生命值",
    character_a = "443",
    character_b = "",
    character_c = "",
    fightForce = 34200
    };
getRow(40520,9)->
    #pet_skills_upgradingCfg {
    skill_id = 40520,
    level = 9,
    item_cost = [13002,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 180,
    des = "立刻为主人和自身恢复{a}%攻击力的生命值",
    character_a = "480",
    character_b = "",
    character_c = "",
    fightForce = 43200
    };
getRow(40520,10)->
    #pet_skills_upgradingCfg {
    skill_id = 40520,
    level = 10,
    item_cost = [13002,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 200,
    des = "立刻为主人和自身恢复{a}%攻击力的生命值",
    character_a = "517",
    character_b = "",
    character_c = "",
    fightForce = 52200
    };
getRow(40520,11)->
    #pet_skills_upgradingCfg {
    skill_id = 40520,
    level = 11,
    item_cost = [13002,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 200,
    des = "立刻为主人和自身恢复{a}%攻击力的生命值",
    character_a = "554",
    character_b = "",
    character_c = "",
    fightForce = 61200
    };
getRow(40521,1)->
    #pet_skills_upgradingCfg {
    skill_id = 40521,
    level = 1,
    item_cost = [],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "立刻为主人和自身增加{b}%的攻击力，持续{c}秒",
    character_a = "576",
    character_b = "5",
    character_c = "5",
    fightForce = 0
    };
getRow(40521,2)->
    #pet_skills_upgradingCfg {
    skill_id = 40521,
    level = 2,
    item_cost = [13002,1],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 40,
    des = "立刻为主人和自身增加{b}%的攻击力，持续{c}秒",
    character_a = "691",
    character_b = "5",
    character_c = "6",
    fightForce = 1800
    };
getRow(40521,3)->
    #pet_skills_upgradingCfg {
    skill_id = 40521,
    level = 3,
    item_cost = [13002,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 60,
    des = "立刻为主人和自身增加{b}%的攻击力，持续{c}秒",
    character_a = "806",
    character_b = "5",
    character_c = "7",
    fightForce = 5400
    };
getRow(40521,4)->
    #pet_skills_upgradingCfg {
    skill_id = 40521,
    level = 4,
    item_cost = [13002,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 80,
    des = "立刻为主人和自身增加{b}%的攻击力，持续{c}秒",
    character_a = "921",
    character_b = "5",
    character_c = "8",
    fightForce = 9000
    };
getRow(40521,5)->
    #pet_skills_upgradingCfg {
    skill_id = 40521,
    level = 5,
    item_cost = [13002,3],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 100,
    des = "立刻为主人和自身增加{b}%的攻击力，持续{c}秒",
    character_a = "1036",
    character_b = "5",
    character_c = "9",
    fightForce = 14400
    };
getRow(40521,6)->
    #pet_skills_upgradingCfg {
    skill_id = 40521,
    level = 6,
    item_cost = [13002,3],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 120,
    des = "立刻为主人和自身增加{b}%的攻击力，持续{c}秒",
    character_a = "1151",
    character_b = "5",
    character_c = "10",
    fightForce = 19800
    };
getRow(40521,7)->
    #pet_skills_upgradingCfg {
    skill_id = 40521,
    level = 7,
    item_cost = [13002,4],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 140,
    des = "立刻为主人和自身增加{b}%的攻击力，持续{c}秒",
    character_a = "1266",
    character_b = "5",
    character_c = "11",
    fightForce = 27000
    };
getRow(40521,8)->
    #pet_skills_upgradingCfg {
    skill_id = 40521,
    level = 8,
    item_cost = [13002,4],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 160,
    des = "立刻为主人和自身增加{b}%的攻击力，持续{c}秒",
    character_a = "1381",
    character_b = "5",
    character_c = "12",
    fightForce = 34200
    };
getRow(40521,9)->
    #pet_skills_upgradingCfg {
    skill_id = 40521,
    level = 9,
    item_cost = [13002,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 180,
    des = "立刻为主人和自身增加{b}%的攻击力，持续{c}秒",
    character_a = "1496",
    character_b = "5",
    character_c = "13",
    fightForce = 43200
    };
getRow(40521,10)->
    #pet_skills_upgradingCfg {
    skill_id = 40521,
    level = 10,
    item_cost = [13002,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 200,
    des = "立刻为主人和自身增加{b}%的攻击力，持续{c}秒",
    character_a = "1611",
    character_b = "5",
    character_c = "14",
    fightForce = 52200
    };
getRow(40521,11)->
    #pet_skills_upgradingCfg {
    skill_id = 40521,
    level = 11,
    item_cost = [13002,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 200,
    des = "立刻为主人和自身增加{b}%的攻击力，持续{c}秒",
    character_a = "1726",
    character_b = "5",
    character_c = "15",
    fightForce = 61200
    };
getRow(40522,1)->
    #pet_skills_upgradingCfg {
    skill_id = 40522,
    level = 1,
    item_cost = [],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "每秒为主人和自身增加{a}%的生命值，持续{c}秒",
    character_a = "55",
    character_b = "",
    character_c = "5",
    fightForce = 0
    };
getRow(40522,2)->
    #pet_skills_upgradingCfg {
    skill_id = 40522,
    level = 2,
    item_cost = [13002,1],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 40,
    des = "每秒为主人和自身增加{a}%的生命值，持续{c}秒",
    character_a = "55",
    character_b = "",
    character_c = "6",
    fightForce = 1800
    };
getRow(40522,3)->
    #pet_skills_upgradingCfg {
    skill_id = 40522,
    level = 3,
    item_cost = [13002,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 60,
    des = "每秒为主人和自身增加{a}%的生命值，持续{c}秒",
    character_a = "55",
    character_b = "",
    character_c = "7",
    fightForce = 5400
    };
getRow(40522,4)->
    #pet_skills_upgradingCfg {
    skill_id = 40522,
    level = 4,
    item_cost = [13002,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 80,
    des = "每秒为主人和自身增加{a}%的生命值，持续{c}秒",
    character_a = "55",
    character_b = "",
    character_c = "8",
    fightForce = 9000
    };
getRow(40522,5)->
    #pet_skills_upgradingCfg {
    skill_id = 40522,
    level = 5,
    item_cost = [13002,3],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 100,
    des = "每秒为主人和自身增加{a}%的生命值，持续{c}秒",
    character_a = "55",
    character_b = "",
    character_c = "9",
    fightForce = 14400
    };
getRow(40522,6)->
    #pet_skills_upgradingCfg {
    skill_id = 40522,
    level = 6,
    item_cost = [13002,3],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 120,
    des = "每秒为主人和自身增加{a}%的生命值，持续{c}秒",
    character_a = "55",
    character_b = "",
    character_c = "10",
    fightForce = 19800
    };
getRow(40522,7)->
    #pet_skills_upgradingCfg {
    skill_id = 40522,
    level = 7,
    item_cost = [13002,4],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 140,
    des = "每秒为主人和自身增加{a}%的生命值，持续{c}秒",
    character_a = "55",
    character_b = "",
    character_c = "11",
    fightForce = 27000
    };
getRow(40522,8)->
    #pet_skills_upgradingCfg {
    skill_id = 40522,
    level = 8,
    item_cost = [13002,4],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 160,
    des = "每秒为主人和自身增加{a}%的生命值，持续{c}秒",
    character_a = "55",
    character_b = "",
    character_c = "12",
    fightForce = 34200
    };
getRow(40522,9)->
    #pet_skills_upgradingCfg {
    skill_id = 40522,
    level = 9,
    item_cost = [13002,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 180,
    des = "每秒为主人和自身增加{a}%的生命值，持续{c}秒",
    character_a = "55",
    character_b = "",
    character_c = "13",
    fightForce = 43200
    };
getRow(40522,10)->
    #pet_skills_upgradingCfg {
    skill_id = 40522,
    level = 10,
    item_cost = [13002,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 200,
    des = "每秒为主人和自身增加{a}%的生命值，持续{c}秒",
    character_a = "55",
    character_b = "",
    character_c = "14",
    fightForce = 52200
    };
getRow(40522,11)->
    #pet_skills_upgradingCfg {
    skill_id = 40522,
    level = 11,
    item_cost = [13002,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 200,
    des = "每秒为主人和自身增加{a}%的生命值，持续{c}秒",
    character_a = "55",
    character_b = "",
    character_c = "15",
    fightForce = 61200
    };
getRow(40530,1)->
    #pet_skills_upgradingCfg {
    skill_id = 40530,
    level = 1,
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "攻击前方单体目标，造成{a}%攻击的伤害",
    character_a = "768",
    character_b = "",
    character_c = "",
    fightForce = 0
    };
getRow(40530,2)->
    #pet_skills_upgradingCfg {
    skill_id = 40530,
    level = 2,
    item_cost = [13002,1],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 40,
    des = "攻击前方单体目标，造成{a}%攻击的伤害",
    character_a = "924",
    character_b = "",
    character_c = "",
    fightForce = 1800
    };
getRow(40530,3)->
    #pet_skills_upgradingCfg {
    skill_id = 40530,
    level = 3,
    item_cost = [13002,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 60,
    des = "攻击前方单体目标，造成{a}%攻击的伤害",
    character_a = "1080",
    character_b = "",
    character_c = "",
    fightForce = 5400
    };
getRow(40530,4)->
    #pet_skills_upgradingCfg {
    skill_id = 40530,
    level = 4,
    item_cost = [13002,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 80,
    des = "攻击前方单体目标，造成{a}%攻击的伤害",
    character_a = "1236",
    character_b = "",
    character_c = "",
    fightForce = 9000
    };
getRow(40530,5)->
    #pet_skills_upgradingCfg {
    skill_id = 40530,
    level = 5,
    item_cost = [13002,3],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 100,
    des = "攻击前方单体目标，造成{a}%攻击的伤害",
    character_a = "1392",
    character_b = "",
    character_c = "",
    fightForce = 14400
    };
getRow(40530,6)->
    #pet_skills_upgradingCfg {
    skill_id = 40530,
    level = 6,
    item_cost = [13002,3],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 120,
    des = "攻击前方单体目标，造成{a}%攻击的伤害",
    character_a = "1548",
    character_b = "",
    character_c = "",
    fightForce = 19800
    };
getRow(40530,7)->
    #pet_skills_upgradingCfg {
    skill_id = 40530,
    level = 7,
    item_cost = [13002,4],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 140,
    des = "攻击前方单体目标，造成{a}%攻击的伤害",
    character_a = "1704",
    character_b = "",
    character_c = "",
    fightForce = 27000
    };
getRow(40530,8)->
    #pet_skills_upgradingCfg {
    skill_id = 40530,
    level = 8,
    item_cost = [13002,4],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 160,
    des = "攻击前方单体目标，造成{a}%攻击的伤害",
    character_a = "1860",
    character_b = "",
    character_c = "",
    fightForce = 34200
    };
getRow(40530,9)->
    #pet_skills_upgradingCfg {
    skill_id = 40530,
    level = 9,
    item_cost = [13002,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 180,
    des = "攻击前方单体目标，造成{a}%攻击的伤害",
    character_a = "2016",
    character_b = "",
    character_c = "",
    fightForce = 43200
    };
getRow(40530,10)->
    #pet_skills_upgradingCfg {
    skill_id = 40530,
    level = 10,
    item_cost = [13002,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 200,
    des = "攻击前方单体目标，造成{a}%攻击的伤害",
    character_a = "2172",
    character_b = "",
    character_c = "",
    fightForce = 52200
    };
getRow(40530,11)->
    #pet_skills_upgradingCfg {
    skill_id = 40530,
    level = 11,
    item_cost = [13002,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 200,
    des = "攻击前方单体目标，造成{a}%攻击的伤害",
    character_a = "2328",
    character_b = "",
    character_c = "",
    fightForce = 61200
    };
getRow(40531,1)->
    #pet_skills_upgradingCfg {
    skill_id = 40531,
    level = 1,
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "对周围敌人造成{a}%攻击的伤害，且有概率造成眩晕{c}秒",
    character_a = "336",
    character_b = "",
    character_c = "2",
    fightForce = 0
    };
getRow(40531,2)->
    #pet_skills_upgradingCfg {
    skill_id = 40531,
    level = 2,
    item_cost = [13002,1],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 40,
    des = "对周围敌人造成{a}%攻击的伤害，且有概率造成眩晕{c}秒",
    character_a = "403",
    character_b = "",
    character_c = "2",
    fightForce = 1800
    };
getRow(40531,3)->
    #pet_skills_upgradingCfg {
    skill_id = 40531,
    level = 3,
    item_cost = [13002,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 60,
    des = "对周围敌人造成{a}%攻击的伤害，且有概率造成眩晕{c}秒",
    character_a = "470",
    character_b = "",
    character_c = "2",
    fightForce = 5400
    };
getRow(40531,4)->
    #pet_skills_upgradingCfg {
    skill_id = 40531,
    level = 4,
    item_cost = [13002,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 80,
    des = "对周围敌人造成{a}%攻击的伤害，且有概率造成眩晕{c}秒",
    character_a = "537",
    character_b = "",
    character_c = "2",
    fightForce = 9000
    };
getRow(40531,5)->
    #pet_skills_upgradingCfg {
    skill_id = 40531,
    level = 5,
    item_cost = [13002,3],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 100,
    des = "对周围敌人造成{a}%攻击的伤害，且有概率造成眩晕{c}秒",
    character_a = "604",
    character_b = "",
    character_c = "2",
    fightForce = 14400
    };
getRow(40531,6)->
    #pet_skills_upgradingCfg {
    skill_id = 40531,
    level = 6,
    item_cost = [13002,3],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 120,
    des = "对周围敌人造成{a}%攻击的伤害，且有概率造成眩晕{c}秒",
    character_a = "671",
    character_b = "",
    character_c = "2",
    fightForce = 19800
    };
getRow(40531,7)->
    #pet_skills_upgradingCfg {
    skill_id = 40531,
    level = 7,
    item_cost = [13002,4],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 140,
    des = "对周围敌人造成{a}%攻击的伤害，且有概率造成眩晕{c}秒",
    character_a = "738",
    character_b = "",
    character_c = "2",
    fightForce = 27000
    };
getRow(40531,8)->
    #pet_skills_upgradingCfg {
    skill_id = 40531,
    level = 8,
    item_cost = [13002,4],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 160,
    des = "对周围敌人造成{a}%攻击的伤害，且有概率造成眩晕{c}秒",
    character_a = "805",
    character_b = "",
    character_c = "2",
    fightForce = 34200
    };
getRow(40531,9)->
    #pet_skills_upgradingCfg {
    skill_id = 40531,
    level = 9,
    item_cost = [13002,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 180,
    des = "对周围敌人造成{a}%攻击的伤害，且有概率造成眩晕{c}秒",
    character_a = "872",
    character_b = "",
    character_c = "2",
    fightForce = 43200
    };
getRow(40531,10)->
    #pet_skills_upgradingCfg {
    skill_id = 40531,
    level = 10,
    item_cost = [13002,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 200,
    des = "对周围敌人造成{a}%攻击的伤害，且有概率造成眩晕{c}秒",
    character_a = "939",
    character_b = "",
    character_c = "2",
    fightForce = 52200
    };
getRow(40531,11)->
    #pet_skills_upgradingCfg {
    skill_id = 40531,
    level = 11,
    item_cost = [13002,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 200,
    des = "对周围敌人造成{a}%攻击的伤害，且有概率造成眩晕{c}秒",
    character_a = "1006",
    character_b = "",
    character_c = "2",
    fightForce = 61200
    };
getRow(40532,1)->
    #pet_skills_upgradingCfg {
    skill_id = 40532,
    level = 1,
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "给自己和主人每秒恢复自身魔法攻击{a}%的生命值，持续{c}秒",
    character_a = "77",
    character_b = "",
    character_c = "5",
    fightForce = 0
    };
getRow(40532,2)->
    #pet_skills_upgradingCfg {
    skill_id = 40532,
    level = 2,
    item_cost = [13002,1],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 40,
    des = "给自己和主人每秒恢复自身魔法攻击{a}%的生命值，持续{c}秒",
    character_a = "92",
    character_b = "",
    character_c = "5",
    fightForce = 1800
    };
getRow(40532,3)->
    #pet_skills_upgradingCfg {
    skill_id = 40532,
    level = 3,
    item_cost = [13002,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 60,
    des = "给自己和主人每秒恢复自身魔法攻击{a}%的生命值，持续{c}秒",
    character_a = "107",
    character_b = "",
    character_c = "5",
    fightForce = 5400
    };
getRow(40532,4)->
    #pet_skills_upgradingCfg {
    skill_id = 40532,
    level = 4,
    item_cost = [13002,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 80,
    des = "给自己和主人每秒恢复自身魔法攻击{a}%的生命值，持续{c}秒",
    character_a = "122",
    character_b = "",
    character_c = "5",
    fightForce = 9000
    };
getRow(40532,5)->
    #pet_skills_upgradingCfg {
    skill_id = 40532,
    level = 5,
    item_cost = [13002,3],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 100,
    des = "给自己和主人每秒恢复自身魔法攻击{a}%的生命值，持续{c}秒",
    character_a = "137",
    character_b = "",
    character_c = "5",
    fightForce = 14400
    };
getRow(40532,6)->
    #pet_skills_upgradingCfg {
    skill_id = 40532,
    level = 6,
    item_cost = [13002,3],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 120,
    des = "给自己和主人每秒恢复自身魔法攻击{a}%的生命值，持续{c}秒",
    character_a = "152",
    character_b = "",
    character_c = "5",
    fightForce = 19800
    };
getRow(40532,7)->
    #pet_skills_upgradingCfg {
    skill_id = 40532,
    level = 7,
    item_cost = [13002,4],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 140,
    des = "给自己和主人每秒恢复自身魔法攻击{a}%的生命值，持续{c}秒",
    character_a = "167",
    character_b = "",
    character_c = "5",
    fightForce = 27000
    };
getRow(40532,8)->
    #pet_skills_upgradingCfg {
    skill_id = 40532,
    level = 8,
    item_cost = [13002,4],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 160,
    des = "给自己和主人每秒恢复自身魔法攻击{a}%的生命值，持续{c}秒",
    character_a = "182",
    character_b = "",
    character_c = "5",
    fightForce = 34200
    };
getRow(40532,9)->
    #pet_skills_upgradingCfg {
    skill_id = 40532,
    level = 9,
    item_cost = [13002,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 180,
    des = "给自己和主人每秒恢复自身魔法攻击{a}%的生命值，持续{c}秒",
    character_a = "197",
    character_b = "",
    character_c = "5",
    fightForce = 43200
    };
getRow(40532,10)->
    #pet_skills_upgradingCfg {
    skill_id = 40532,
    level = 10,
    item_cost = [13002,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 200,
    des = "给自己和主人每秒恢复自身魔法攻击{a}%的生命值，持续{c}秒",
    character_a = "212",
    character_b = "",
    character_c = "5",
    fightForce = 52200
    };
getRow(40532,11)->
    #pet_skills_upgradingCfg {
    skill_id = 40532,
    level = 11,
    item_cost = [13002,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 200,
    des = "给自己和主人每秒恢复自身魔法攻击{a}%的生命值，持续{c}秒",
    character_a = "227",
    character_b = "",
    character_c = "5",
    fightForce = 61200
    };
getRow(40540,1)->
    #pet_skills_upgradingCfg {
    skill_id = 40540,
    level = 1,
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "喷火攻击前方敌人，造成3次{a}%攻击的伤害",
    character_a = "149",
    character_b = "",
    character_c = "",
    fightForce = 0
    };
getRow(40540,2)->
    #pet_skills_upgradingCfg {
    skill_id = 40540,
    level = 2,
    item_cost = [13002,1],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 40,
    des = "喷火攻击前方敌人，造成3次{a}%攻击的伤害",
    character_a = "179",
    character_b = "",
    character_c = "",
    fightForce = 1800
    };
getRow(40540,3)->
    #pet_skills_upgradingCfg {
    skill_id = 40540,
    level = 3,
    item_cost = [13002,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 60,
    des = "喷火攻击前方敌人，造成3次{a}%攻击的伤害",
    character_a = "209",
    character_b = "",
    character_c = "",
    fightForce = 5400
    };
getRow(40540,4)->
    #pet_skills_upgradingCfg {
    skill_id = 40540,
    level = 4,
    item_cost = [13002,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 80,
    des = "喷火攻击前方敌人，造成3次{a}%攻击的伤害",
    character_a = "239",
    character_b = "",
    character_c = "",
    fightForce = 9000
    };
getRow(40540,5)->
    #pet_skills_upgradingCfg {
    skill_id = 40540,
    level = 5,
    item_cost = [13002,3],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 100,
    des = "喷火攻击前方敌人，造成3次{a}%攻击的伤害",
    character_a = "269",
    character_b = "",
    character_c = "",
    fightForce = 14400
    };
getRow(40540,6)->
    #pet_skills_upgradingCfg {
    skill_id = 40540,
    level = 6,
    item_cost = [13002,3],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 120,
    des = "喷火攻击前方敌人，造成3次{a}%攻击的伤害",
    character_a = "299",
    character_b = "",
    character_c = "",
    fightForce = 19800
    };
getRow(40540,7)->
    #pet_skills_upgradingCfg {
    skill_id = 40540,
    level = 7,
    item_cost = [13002,4],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 140,
    des = "喷火攻击前方敌人，造成3次{a}%攻击的伤害",
    character_a = "329",
    character_b = "",
    character_c = "",
    fightForce = 27000
    };
getRow(40540,8)->
    #pet_skills_upgradingCfg {
    skill_id = 40540,
    level = 8,
    item_cost = [13002,4],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 160,
    des = "喷火攻击前方敌人，造成3次{a}%攻击的伤害",
    character_a = "359",
    character_b = "",
    character_c = "",
    fightForce = 34200
    };
getRow(40540,9)->
    #pet_skills_upgradingCfg {
    skill_id = 40540,
    level = 9,
    item_cost = [13002,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 180,
    des = "喷火攻击前方敌人，造成3次{a}%攻击的伤害",
    character_a = "389",
    character_b = "",
    character_c = "",
    fightForce = 43200
    };
getRow(40540,10)->
    #pet_skills_upgradingCfg {
    skill_id = 40540,
    level = 10,
    item_cost = [13002,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 200,
    des = "喷火攻击前方敌人，造成3次{a}%攻击的伤害",
    character_a = "419",
    character_b = "",
    character_c = "",
    fightForce = 52200
    };
getRow(40540,11)->
    #pet_skills_upgradingCfg {
    skill_id = 40540,
    level = 11,
    item_cost = [13002,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 200,
    des = "喷火攻击前方敌人，造成3次{a}%攻击的伤害",
    character_a = "449",
    character_b = "",
    character_c = "",
    fightForce = 61200
    };
getRow(40541,1)->
    #pet_skills_upgradingCfg {
    skill_id = 40541,
    level = 1,
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "在周围敌人造成火焰灼烧，每秒造成{a}%攻击的伤害，持续3秒，并在脚下召唤火焰陷阱，陷阱延时触发，造成{c}秒眩晕",
    character_a = "336",
    character_b = "",
    character_c = "2",
    fightForce = 0
    };
getRow(40541,2)->
    #pet_skills_upgradingCfg {
    skill_id = 40541,
    level = 2,
    item_cost = [13002,1],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 40,
    des = "在周围敌人造成火焰灼烧，每秒造成{a}%攻击的伤害，持续3秒，并在脚下召唤火焰陷阱，陷阱延时触发，造成{c}秒眩晕",
    character_a = "403",
    character_b = "",
    character_c = "2",
    fightForce = 1800
    };
getRow(40541,3)->
    #pet_skills_upgradingCfg {
    skill_id = 40541,
    level = 3,
    item_cost = [13002,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 60,
    des = "在周围敌人造成火焰灼烧，每秒造成{a}%攻击的伤害，持续3秒，并在脚下召唤火焰陷阱，陷阱延时触发，造成{c}秒眩晕",
    character_a = "470",
    character_b = "",
    character_c = "2",
    fightForce = 5400
    };
getRow(40541,4)->
    #pet_skills_upgradingCfg {
    skill_id = 40541,
    level = 4,
    item_cost = [13002,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 80,
    des = "在周围敌人造成火焰灼烧，每秒造成{a}%攻击的伤害，持续3秒，并在脚下召唤火焰陷阱，陷阱延时触发，造成{c}秒眩晕",
    character_a = "537",
    character_b = "",
    character_c = "2",
    fightForce = 9000
    };
getRow(40541,5)->
    #pet_skills_upgradingCfg {
    skill_id = 40541,
    level = 5,
    item_cost = [13002,3],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 100,
    des = "在周围敌人造成火焰灼烧，每秒造成{a}%攻击的伤害，持续3秒，并在脚下召唤火焰陷阱，陷阱延时触发，造成{c}秒眩晕",
    character_a = "604",
    character_b = "",
    character_c = "2",
    fightForce = 14400
    };
getRow(40541,6)->
    #pet_skills_upgradingCfg {
    skill_id = 40541,
    level = 6,
    item_cost = [13002,3],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 120,
    des = "在周围敌人造成火焰灼烧，每秒造成{a}%攻击的伤害，持续3秒，并在脚下召唤火焰陷阱，陷阱延时触发，造成{c}秒眩晕",
    character_a = "671",
    character_b = "",
    character_c = "2",
    fightForce = 19800
    };
getRow(40541,7)->
    #pet_skills_upgradingCfg {
    skill_id = 40541,
    level = 7,
    item_cost = [13002,4],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 140,
    des = "在周围敌人造成火焰灼烧，每秒造成{a}%攻击的伤害，持续3秒，并在脚下召唤火焰陷阱，陷阱延时触发，造成{c}秒眩晕",
    character_a = "738",
    character_b = "",
    character_c = "2",
    fightForce = 27000
    };
getRow(40541,8)->
    #pet_skills_upgradingCfg {
    skill_id = 40541,
    level = 8,
    item_cost = [13002,4],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 160,
    des = "在周围敌人造成火焰灼烧，每秒造成{a}%攻击的伤害，持续3秒，并在脚下召唤火焰陷阱，陷阱延时触发，造成{c}秒眩晕",
    character_a = "805",
    character_b = "",
    character_c = "2",
    fightForce = 34200
    };
getRow(40541,9)->
    #pet_skills_upgradingCfg {
    skill_id = 40541,
    level = 9,
    item_cost = [13002,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 180,
    des = "在周围敌人造成火焰灼烧，每秒造成{a}%攻击的伤害，持续3秒，并在脚下召唤火焰陷阱，陷阱延时触发，造成{c}秒眩晕",
    character_a = "872",
    character_b = "",
    character_c = "2",
    fightForce = 43200
    };
getRow(40541,10)->
    #pet_skills_upgradingCfg {
    skill_id = 40541,
    level = 10,
    item_cost = [13002,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 200,
    des = "在周围敌人造成火焰灼烧，每秒造成{a}%攻击的伤害，持续3秒，并在脚下召唤火焰陷阱，陷阱延时触发，造成{c}秒眩晕",
    character_a = "939",
    character_b = "",
    character_c = "2",
    fightForce = 52200
    };
getRow(40541,11)->
    #pet_skills_upgradingCfg {
    skill_id = 40541,
    level = 11,
    item_cost = [13002,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 200,
    des = "在周围敌人造成火焰灼烧，每秒造成{a}%攻击的伤害，持续3秒，并在脚下召唤火焰陷阱，陷阱延时触发，造成{c}秒眩晕",
    character_a = "1006",
    character_b = "",
    character_c = "2",
    fightForce = 61200
    };
getRow(40542,1)->
    #pet_skills_upgradingCfg {
    skill_id = 40542,
    level = 1,
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 0,
    des = "给自己和主人每秒恢复{a}%骑宠攻击的生命值，持续{c}秒",
    character_a = "77",
    character_b = "",
    character_c = "5",
    fightForce = 0
    };
getRow(40542,2)->
    #pet_skills_upgradingCfg {
    skill_id = 40542,
    level = 2,
    item_cost = [13002,1],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 40,
    des = "给自己和主人每秒恢复{a}%骑宠攻击的生命值，持续{c}秒",
    character_a = "92",
    character_b = "",
    character_c = "5",
    fightForce = 1800
    };
getRow(40542,3)->
    #pet_skills_upgradingCfg {
    skill_id = 40542,
    level = 3,
    item_cost = [13002,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 60,
    des = "给自己和主人每秒恢复{a}%骑宠攻击的生命值，持续{c}秒",
    character_a = "107",
    character_b = "",
    character_c = "5",
    fightForce = 5400
    };
getRow(40542,4)->
    #pet_skills_upgradingCfg {
    skill_id = 40542,
    level = 4,
    item_cost = [13002,2],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 80,
    des = "给自己和主人每秒恢复{a}%骑宠攻击的生命值，持续{c}秒",
    character_a = "122",
    character_b = "",
    character_c = "5",
    fightForce = 9000
    };
getRow(40542,5)->
    #pet_skills_upgradingCfg {
    skill_id = 40542,
    level = 5,
    item_cost = [13002,3],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 100,
    des = "给自己和主人每秒恢复{a}%骑宠攻击的生命值，持续{c}秒",
    character_a = "137",
    character_b = "",
    character_c = "5",
    fightForce = 14400
    };
getRow(40542,6)->
    #pet_skills_upgradingCfg {
    skill_id = 40542,
    level = 6,
    item_cost = [13002,3],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 120,
    des = "给自己和主人每秒恢复{a}%骑宠攻击的生命值，持续{c}秒",
    character_a = "152",
    character_b = "",
    character_c = "5",
    fightForce = 19800
    };
getRow(40542,7)->
    #pet_skills_upgradingCfg {
    skill_id = 40542,
    level = 7,
    item_cost = [13002,4],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 140,
    des = "给自己和主人每秒恢复{a}%骑宠攻击的生命值，持续{c}秒",
    character_a = "167",
    character_b = "",
    character_c = "5",
    fightForce = 27000
    };
getRow(40542,8)->
    #pet_skills_upgradingCfg {
    skill_id = 40542,
    level = 8,
    item_cost = [13002,4],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 160,
    des = "给自己和主人每秒恢复{a}%骑宠攻击的生命值，持续{c}秒",
    character_a = "182",
    character_b = "",
    character_c = "5",
    fightForce = 34200
    };
getRow(40542,9)->
    #pet_skills_upgradingCfg {
    skill_id = 40542,
    level = 9,
    item_cost = [13002,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 180,
    des = "给自己和主人每秒恢复{a}%骑宠攻击的生命值，持续{c}秒",
    character_a = "197",
    character_b = "",
    character_c = "5",
    fightForce = 43200
    };
getRow(40542,10)->
    #pet_skills_upgradingCfg {
    skill_id = 40542,
    level = 10,
    item_cost = [13002,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 200,
    des = "给自己和主人每秒恢复{a}%骑宠攻击的生命值，持续{c}秒",
    character_a = "212",
    character_b = "",
    character_c = "5",
    fightForce = 52200
    };
getRow(40542,11)->
    #pet_skills_upgradingCfg {
    skill_id = 40542,
    level = 11,
    item_cost = [13002,5],
    star_limit = 0,
    reborn_limit = 0,
    level_limit = 200,
    des = "给自己和主人每秒恢复{a}%骑宠攻击的生命值，持续{c}秒",
    character_a = "227",
    character_b = "",
    character_c = "5",
    fightForce = 61200
    };
getRow(_,_)->[].

getKeyList()->[
    {1701,1},
    {1701,2},
    {1701,3},
    {1701,4},
    {1701,5},
    {1701,6},
    {1701,7},
    {1701,8},
    {1701,9},
    {1701,10},
    {1701,11},
    {1702,1},
    {1702,2},
    {1702,3},
    {1702,4},
    {1702,5},
    {1702,6},
    {1702,7},
    {1702,8},
    {1702,9},
    {1702,10},
    {1702,11},
    {1703,1},
    {1703,2},
    {1703,3},
    {1703,4},
    {1703,5},
    {1703,6},
    {1703,7},
    {1703,8},
    {1703,9},
    {1703,10},
    {1703,11},
    {1704,1},
    {1704,2},
    {1704,3},
    {1704,4},
    {1704,5},
    {1704,6},
    {1704,7},
    {1704,8},
    {1704,9},
    {1704,10},
    {1704,11},
    {1736,1},
    {1736,2},
    {1736,3},
    {1736,4},
    {1736,5},
    {1736,6},
    {1736,7},
    {1736,8},
    {1736,9},
    {1736,10},
    {1736,11},
    {40000,1},
    {40000,2},
    {40000,3},
    {40000,4},
    {40000,5},
    {40000,6},
    {40000,7},
    {40000,8},
    {40000,9},
    {40000,10},
    {40000,11},
    {40001,1},
    {40001,2},
    {40001,3},
    {40001,4},
    {40001,5},
    {40001,6},
    {40001,7},
    {40001,8},
    {40001,9},
    {40001,10},
    {40001,11},
    {40002,1},
    {40002,2},
    {40002,3},
    {40002,4},
    {40002,5},
    {40002,6},
    {40002,7},
    {40002,8},
    {40002,9},
    {40002,10},
    {40002,11},
    {40010,1},
    {40010,2},
    {40010,3},
    {40010,4},
    {40010,5},
    {40010,6},
    {40010,7},
    {40010,8},
    {40010,9},
    {40010,10},
    {40010,11},
    {40011,1},
    {40011,2},
    {40011,3},
    {40011,4},
    {40011,5},
    {40011,6},
    {40011,7},
    {40011,8},
    {40011,9},
    {40011,10},
    {40011,11},
    {40012,1},
    {40012,2},
    {40012,3},
    {40012,4},
    {40012,5},
    {40012,6},
    {40012,7},
    {40012,8},
    {40012,9},
    {40012,10},
    {40012,11},
    {40020,1},
    {40020,2},
    {40020,3},
    {40020,4},
    {40020,5},
    {40020,6},
    {40020,7},
    {40020,8},
    {40020,9},
    {40020,10},
    {40020,11},
    {40022,1},
    {40022,2},
    {40022,3},
    {40022,4},
    {40022,5},
    {40022,6},
    {40022,7},
    {40022,8},
    {40022,9},
    {40022,10},
    {40022,11},
    {40024,1},
    {40024,2},
    {40024,3},
    {40024,4},
    {40024,5},
    {40024,6},
    {40024,7},
    {40024,8},
    {40024,9},
    {40024,10},
    {40024,11},
    {40030,1},
    {40030,2},
    {40030,3},
    {40030,4},
    {40030,5},
    {40030,6},
    {40030,7},
    {40030,8},
    {40030,9},
    {40030,10},
    {40030,11},
    {40031,1},
    {40031,2},
    {40031,3},
    {40031,4},
    {40031,5},
    {40031,6},
    {40031,7},
    {40031,8},
    {40031,9},
    {40031,10},
    {40031,11},
    {40035,1},
    {40035,2},
    {40035,3},
    {40035,4},
    {40035,5},
    {40035,6},
    {40035,7},
    {40035,8},
    {40035,9},
    {40035,10},
    {40035,11},
    {40040,1},
    {40040,2},
    {40040,3},
    {40040,4},
    {40040,5},
    {40040,6},
    {40040,7},
    {40040,8},
    {40040,9},
    {40040,10},
    {40040,11},
    {40041,1},
    {40041,2},
    {40041,3},
    {40041,4},
    {40041,5},
    {40041,6},
    {40041,7},
    {40041,8},
    {40041,9},
    {40041,10},
    {40041,11},
    {40044,1},
    {40044,2},
    {40044,3},
    {40044,4},
    {40044,5},
    {40044,6},
    {40044,7},
    {40044,8},
    {40044,9},
    {40044,10},
    {40044,11},
    {40050,1},
    {40050,2},
    {40050,3},
    {40050,4},
    {40050,5},
    {40050,6},
    {40050,7},
    {40050,8},
    {40050,9},
    {40050,10},
    {40050,11},
    {40053,1},
    {40053,2},
    {40053,3},
    {40053,4},
    {40053,5},
    {40053,6},
    {40053,7},
    {40053,8},
    {40053,9},
    {40053,10},
    {40053,11},
    {40054,1},
    {40054,2},
    {40054,3},
    {40054,4},
    {40054,5},
    {40054,6},
    {40054,7},
    {40054,8},
    {40054,9},
    {40054,10},
    {40054,11},
    {40060,1},
    {40060,2},
    {40060,3},
    {40060,4},
    {40060,5},
    {40060,6},
    {40060,7},
    {40060,8},
    {40060,9},
    {40060,10},
    {40060,11},
    {40061,1},
    {40061,2},
    {40061,3},
    {40061,4},
    {40061,5},
    {40061,6},
    {40061,7},
    {40061,8},
    {40061,9},
    {40061,10},
    {40061,11},
    {40063,1},
    {40063,2},
    {40063,3},
    {40063,4},
    {40063,5},
    {40063,6},
    {40063,7},
    {40063,8},
    {40063,9},
    {40063,10},
    {40063,11},
    {40070,1},
    {40070,2},
    {40070,3},
    {40070,4},
    {40070,5},
    {40070,6},
    {40070,7},
    {40070,8},
    {40070,9},
    {40070,10},
    {40070,11},
    {40071,1},
    {40071,2},
    {40071,3},
    {40071,4},
    {40071,5},
    {40071,6},
    {40071,7},
    {40071,8},
    {40071,9},
    {40071,10},
    {40071,11},
    {40072,1},
    {40072,2},
    {40072,3},
    {40072,4},
    {40072,5},
    {40072,6},
    {40072,7},
    {40072,8},
    {40072,9},
    {40072,10},
    {40072,11},
    {40080,1},
    {40080,2},
    {40080,3},
    {40080,4},
    {40080,5},
    {40080,6},
    {40080,7},
    {40080,8},
    {40080,9},
    {40080,10},
    {40080,11},
    {40081,1},
    {40081,2},
    {40081,3},
    {40081,4},
    {40081,5},
    {40081,6},
    {40081,7},
    {40081,8},
    {40081,9},
    {40081,10},
    {40081,11},
    {40082,1},
    {40082,2},
    {40082,3},
    {40082,4},
    {40082,5},
    {40082,6},
    {40082,7},
    {40082,8},
    {40082,9},
    {40082,10},
    {40082,11},
    {40090,1},
    {40090,2},
    {40090,3},
    {40090,4},
    {40090,5},
    {40090,6},
    {40090,7},
    {40090,8},
    {40090,9},
    {40090,10},
    {40090,11},
    {40091,1},
    {40091,2},
    {40091,3},
    {40091,4},
    {40091,5},
    {40091,6},
    {40091,7},
    {40091,8},
    {40091,9},
    {40091,10},
    {40091,11},
    {40092,1},
    {40092,2},
    {40092,3},
    {40092,4},
    {40092,5},
    {40092,6},
    {40092,7},
    {40092,8},
    {40092,9},
    {40092,10},
    {40092,11},
    {40100,1},
    {40100,2},
    {40100,3},
    {40100,4},
    {40100,5},
    {40100,6},
    {40100,7},
    {40100,8},
    {40100,9},
    {40100,10},
    {40100,11},
    {40101,1},
    {40101,2},
    {40101,3},
    {40101,4},
    {40101,5},
    {40101,6},
    {40101,7},
    {40101,8},
    {40101,9},
    {40101,10},
    {40101,11},
    {40102,1},
    {40102,2},
    {40102,3},
    {40102,4},
    {40102,5},
    {40102,6},
    {40102,7},
    {40102,8},
    {40102,9},
    {40102,10},
    {40102,11},
    {40110,1},
    {40110,2},
    {40110,3},
    {40110,4},
    {40110,5},
    {40110,6},
    {40110,7},
    {40110,8},
    {40110,9},
    {40110,10},
    {40110,11},
    {40111,1},
    {40111,2},
    {40111,3},
    {40111,4},
    {40111,5},
    {40111,6},
    {40111,7},
    {40111,8},
    {40111,9},
    {40111,10},
    {40111,11},
    {40114,1},
    {40114,2},
    {40114,3},
    {40114,4},
    {40114,5},
    {40114,6},
    {40114,7},
    {40114,8},
    {40114,9},
    {40114,10},
    {40114,11},
    {40120,1},
    {40120,2},
    {40120,3},
    {40120,4},
    {40120,5},
    {40120,6},
    {40120,7},
    {40120,8},
    {40120,9},
    {40120,10},
    {40120,11},
    {40121,1},
    {40121,2},
    {40121,3},
    {40121,4},
    {40121,5},
    {40121,6},
    {40121,7},
    {40121,8},
    {40121,9},
    {40121,10},
    {40121,11},
    {40124,1},
    {40124,2},
    {40124,3},
    {40124,4},
    {40124,5},
    {40124,6},
    {40124,7},
    {40124,8},
    {40124,9},
    {40124,10},
    {40124,11},
    {40130,1},
    {40130,2},
    {40130,3},
    {40130,4},
    {40130,5},
    {40130,6},
    {40130,7},
    {40130,8},
    {40130,9},
    {40130,10},
    {40130,11},
    {40131,1},
    {40131,2},
    {40131,3},
    {40131,4},
    {40131,5},
    {40131,6},
    {40131,7},
    {40131,8},
    {40131,9},
    {40131,10},
    {40131,11},
    {40132,1},
    {40132,2},
    {40132,3},
    {40132,4},
    {40132,5},
    {40132,6},
    {40132,7},
    {40132,8},
    {40132,9},
    {40132,10},
    {40132,11},
    {40140,1},
    {40140,2},
    {40140,3},
    {40140,4},
    {40140,5},
    {40140,6},
    {40140,7},
    {40140,8},
    {40140,9},
    {40140,10},
    {40140,11},
    {40141,1},
    {40141,2},
    {40141,3},
    {40141,4},
    {40141,5},
    {40141,6},
    {40141,7},
    {40141,8},
    {40141,9},
    {40141,10},
    {40141,11},
    {40142,1},
    {40142,2},
    {40142,3},
    {40142,4},
    {40142,5},
    {40142,6},
    {40142,7},
    {40142,8},
    {40142,9},
    {40142,10},
    {40142,11},
    {40150,1},
    {40150,2},
    {40150,3},
    {40150,4},
    {40150,5},
    {40150,6},
    {40150,7},
    {40150,8},
    {40150,9},
    {40150,10},
    {40150,11},
    {40151,1},
    {40151,2},
    {40151,3},
    {40151,4},
    {40151,5},
    {40151,6},
    {40151,7},
    {40151,8},
    {40151,9},
    {40151,10},
    {40151,11},
    {40155,1},
    {40155,2},
    {40155,3},
    {40155,4},
    {40155,5},
    {40155,6},
    {40155,7},
    {40155,8},
    {40155,9},
    {40155,10},
    {40155,11},
    {40160,1},
    {40160,2},
    {40160,3},
    {40160,4},
    {40160,5},
    {40160,6},
    {40160,7},
    {40160,8},
    {40160,9},
    {40160,10},
    {40160,11},
    {40161,1},
    {40161,2},
    {40161,3},
    {40161,4},
    {40161,5},
    {40161,6},
    {40161,7},
    {40161,8},
    {40161,9},
    {40161,10},
    {40161,11},
    {40162,1},
    {40162,2},
    {40162,3},
    {40162,4},
    {40162,5},
    {40162,6},
    {40162,7},
    {40162,8},
    {40162,9},
    {40162,10},
    {40162,11},
    {40170,1},
    {40170,2},
    {40170,3},
    {40170,4},
    {40170,5},
    {40170,6},
    {40170,7},
    {40170,8},
    {40170,9},
    {40170,10},
    {40170,11},
    {40171,1},
    {40171,2},
    {40171,3},
    {40171,4},
    {40171,5},
    {40171,6},
    {40171,7},
    {40171,8},
    {40171,9},
    {40171,10},
    {40171,11},
    {40172,1},
    {40172,2},
    {40172,3},
    {40172,4},
    {40172,5},
    {40172,6},
    {40172,7},
    {40172,8},
    {40172,9},
    {40172,10},
    {40172,11},
    {40180,1},
    {40180,2},
    {40180,3},
    {40180,4},
    {40180,5},
    {40180,6},
    {40180,7},
    {40180,8},
    {40180,9},
    {40180,10},
    {40180,11},
    {40181,1},
    {40181,2},
    {40181,3},
    {40181,4},
    {40181,5},
    {40181,6},
    {40181,7},
    {40181,8},
    {40181,9},
    {40181,10},
    {40181,11},
    {40190,1},
    {40190,2},
    {40190,3},
    {40190,4},
    {40190,5},
    {40190,6},
    {40190,7},
    {40190,8},
    {40190,9},
    {40190,10},
    {40190,11},
    {40191,1},
    {40191,2},
    {40191,3},
    {40191,4},
    {40191,5},
    {40191,6},
    {40191,7},
    {40191,8},
    {40191,9},
    {40191,10},
    {40191,11},
    {40200,1},
    {40200,2},
    {40200,3},
    {40200,4},
    {40200,5},
    {40200,6},
    {40200,7},
    {40200,8},
    {40200,9},
    {40200,10},
    {40200,11},
    {40201,1},
    {40201,2},
    {40201,3},
    {40201,4},
    {40201,5},
    {40201,6},
    {40201,7},
    {40201,8},
    {40201,9},
    {40201,10},
    {40201,11},
    {40210,1},
    {40210,2},
    {40210,3},
    {40210,4},
    {40210,5},
    {40210,6},
    {40210,7},
    {40210,8},
    {40210,9},
    {40210,10},
    {40210,11},
    {40211,1},
    {40211,2},
    {40211,3},
    {40211,4},
    {40211,5},
    {40211,6},
    {40211,7},
    {40211,8},
    {40211,9},
    {40211,10},
    {40211,11},
    {40220,1},
    {40220,2},
    {40220,3},
    {40220,4},
    {40220,5},
    {40220,6},
    {40220,7},
    {40220,8},
    {40220,9},
    {40220,10},
    {40220,11},
    {40221,1},
    {40221,2},
    {40221,3},
    {40221,4},
    {40221,5},
    {40221,6},
    {40221,7},
    {40221,8},
    {40221,9},
    {40221,10},
    {40221,11},
    {40230,1},
    {40230,2},
    {40230,3},
    {40230,4},
    {40230,5},
    {40230,6},
    {40230,7},
    {40230,8},
    {40230,9},
    {40230,10},
    {40230,11},
    {40231,1},
    {40231,2},
    {40231,3},
    {40231,4},
    {40231,5},
    {40231,6},
    {40231,7},
    {40231,8},
    {40231,9},
    {40231,10},
    {40231,11},
    {40240,1},
    {40240,2},
    {40240,3},
    {40240,4},
    {40240,5},
    {40240,6},
    {40240,7},
    {40240,8},
    {40240,9},
    {40240,10},
    {40240,11},
    {40241,1},
    {40241,2},
    {40241,3},
    {40241,4},
    {40241,5},
    {40241,6},
    {40241,7},
    {40241,8},
    {40241,9},
    {40241,10},
    {40241,11},
    {40250,1},
    {40250,2},
    {40250,3},
    {40250,4},
    {40250,5},
    {40250,6},
    {40250,7},
    {40250,8},
    {40250,9},
    {40250,10},
    {40250,11},
    {40251,1},
    {40251,2},
    {40251,3},
    {40251,4},
    {40251,5},
    {40251,6},
    {40251,7},
    {40251,8},
    {40251,9},
    {40251,10},
    {40251,11},
    {40260,1},
    {40260,2},
    {40260,3},
    {40260,4},
    {40260,5},
    {40260,6},
    {40260,7},
    {40260,8},
    {40260,9},
    {40260,10},
    {40260,11},
    {40261,1},
    {40261,2},
    {40261,3},
    {40261,4},
    {40261,5},
    {40261,6},
    {40261,7},
    {40261,8},
    {40261,9},
    {40261,10},
    {40261,11},
    {40262,1},
    {40262,2},
    {40262,3},
    {40262,4},
    {40262,5},
    {40262,6},
    {40262,7},
    {40262,8},
    {40262,9},
    {40262,10},
    {40262,11},
    {40270,1},
    {40270,2},
    {40270,3},
    {40270,4},
    {40270,5},
    {40270,6},
    {40270,7},
    {40270,8},
    {40270,9},
    {40270,10},
    {40270,11},
    {40271,1},
    {40271,2},
    {40271,3},
    {40271,4},
    {40271,5},
    {40271,6},
    {40271,7},
    {40271,8},
    {40271,9},
    {40271,10},
    {40271,11},
    {40272,1},
    {40272,2},
    {40272,3},
    {40272,4},
    {40272,5},
    {40272,6},
    {40272,7},
    {40272,8},
    {40272,9},
    {40272,10},
    {40272,11},
    {40280,1},
    {40280,2},
    {40280,3},
    {40280,4},
    {40280,5},
    {40280,6},
    {40280,7},
    {40280,8},
    {40280,9},
    {40280,10},
    {40280,11},
    {40281,1},
    {40281,2},
    {40281,3},
    {40281,4},
    {40281,5},
    {40281,6},
    {40281,7},
    {40281,8},
    {40281,9},
    {40281,10},
    {40281,11},
    {40282,1},
    {40282,2},
    {40282,3},
    {40282,4},
    {40282,5},
    {40282,6},
    {40282,7},
    {40282,8},
    {40282,9},
    {40282,10},
    {40282,11},
    {40290,1},
    {40290,2},
    {40290,3},
    {40290,4},
    {40290,5},
    {40290,6},
    {40290,7},
    {40290,8},
    {40290,9},
    {40290,10},
    {40290,11},
    {40291,1},
    {40291,2},
    {40291,3},
    {40291,4},
    {40291,5},
    {40291,6},
    {40291,7},
    {40291,8},
    {40291,9},
    {40291,10},
    {40291,11},
    {40294,1},
    {40294,2},
    {40294,3},
    {40294,4},
    {40294,5},
    {40294,6},
    {40294,7},
    {40294,8},
    {40294,9},
    {40294,10},
    {40294,11},
    {40300,1},
    {40300,2},
    {40300,3},
    {40300,4},
    {40300,5},
    {40300,6},
    {40300,7},
    {40300,8},
    {40300,9},
    {40300,10},
    {40300,11},
    {40301,1},
    {40301,2},
    {40301,3},
    {40301,4},
    {40301,5},
    {40301,6},
    {40301,7},
    {40301,8},
    {40301,9},
    {40301,10},
    {40301,11},
    {40302,1},
    {40302,2},
    {40302,3},
    {40302,4},
    {40302,5},
    {40302,6},
    {40302,7},
    {40302,8},
    {40302,9},
    {40302,10},
    {40302,11},
    {40310,1},
    {40310,2},
    {40310,3},
    {40310,4},
    {40310,5},
    {40310,6},
    {40310,7},
    {40310,8},
    {40310,9},
    {40310,10},
    {40310,11},
    {40311,1},
    {40311,2},
    {40311,3},
    {40311,4},
    {40311,5},
    {40311,6},
    {40311,7},
    {40311,8},
    {40311,9},
    {40311,10},
    {40311,11},
    {40320,1},
    {40320,2},
    {40320,3},
    {40320,4},
    {40320,5},
    {40320,6},
    {40320,7},
    {40320,8},
    {40320,9},
    {40320,10},
    {40320,11},
    {40321,1},
    {40321,2},
    {40321,3},
    {40321,4},
    {40321,5},
    {40321,6},
    {40321,7},
    {40321,8},
    {40321,9},
    {40321,10},
    {40321,11},
    {40322,1},
    {40322,2},
    {40322,3},
    {40322,4},
    {40322,5},
    {40322,6},
    {40322,7},
    {40322,8},
    {40322,9},
    {40322,10},
    {40322,11},
    {40330,1},
    {40330,2},
    {40330,3},
    {40330,4},
    {40330,5},
    {40330,6},
    {40330,7},
    {40330,8},
    {40330,9},
    {40330,10},
    {40330,11},
    {40331,1},
    {40331,2},
    {40331,3},
    {40331,4},
    {40331,5},
    {40331,6},
    {40331,7},
    {40331,8},
    {40331,9},
    {40331,10},
    {40331,11},
    {40340,1},
    {40340,2},
    {40340,3},
    {40340,4},
    {40340,5},
    {40340,6},
    {40340,7},
    {40340,8},
    {40340,9},
    {40340,10},
    {40340,11},
    {40341,1},
    {40341,2},
    {40341,3},
    {40341,4},
    {40341,5},
    {40341,6},
    {40341,7},
    {40341,8},
    {40341,9},
    {40341,10},
    {40341,11},
    {40350,1},
    {40350,2},
    {40350,3},
    {40350,4},
    {40350,5},
    {40350,6},
    {40350,7},
    {40350,8},
    {40350,9},
    {40350,10},
    {40350,11},
    {40351,1},
    {40351,2},
    {40351,3},
    {40351,4},
    {40351,5},
    {40351,6},
    {40351,7},
    {40351,8},
    {40351,9},
    {40351,10},
    {40351,11},
    {40352,1},
    {40352,2},
    {40352,3},
    {40352,4},
    {40352,5},
    {40352,6},
    {40352,7},
    {40352,8},
    {40352,9},
    {40352,10},
    {40352,11},
    {40360,1},
    {40360,2},
    {40360,3},
    {40360,4},
    {40360,5},
    {40360,6},
    {40360,7},
    {40360,8},
    {40360,9},
    {40360,10},
    {40360,11},
    {40361,1},
    {40361,2},
    {40361,3},
    {40361,4},
    {40361,5},
    {40361,6},
    {40361,7},
    {40361,8},
    {40361,9},
    {40361,10},
    {40361,11},
    {40362,1},
    {40362,2},
    {40362,3},
    {40362,4},
    {40362,5},
    {40362,6},
    {40362,7},
    {40362,8},
    {40362,9},
    {40362,10},
    {40362,11},
    {40370,1},
    {40370,2},
    {40370,3},
    {40370,4},
    {40370,5},
    {40370,6},
    {40370,7},
    {40370,8},
    {40370,9},
    {40370,10},
    {40370,11},
    {40371,1},
    {40371,2},
    {40371,3},
    {40371,4},
    {40371,5},
    {40371,6},
    {40371,7},
    {40371,8},
    {40371,9},
    {40371,10},
    {40371,11},
    {40372,1},
    {40372,2},
    {40372,3},
    {40372,4},
    {40372,5},
    {40372,6},
    {40372,7},
    {40372,8},
    {40372,9},
    {40372,10},
    {40372,11},
    {40380,1},
    {40380,2},
    {40380,3},
    {40380,4},
    {40380,5},
    {40380,6},
    {40380,7},
    {40380,8},
    {40380,9},
    {40380,10},
    {40380,11},
    {40381,1},
    {40381,2},
    {40381,3},
    {40381,4},
    {40381,5},
    {40381,6},
    {40381,7},
    {40381,8},
    {40381,9},
    {40381,10},
    {40381,11},
    {40382,1},
    {40382,2},
    {40382,3},
    {40382,4},
    {40382,5},
    {40382,6},
    {40382,7},
    {40382,8},
    {40382,9},
    {40382,10},
    {40382,11},
    {40390,1},
    {40390,2},
    {40390,3},
    {40390,4},
    {40390,5},
    {40390,6},
    {40390,7},
    {40390,8},
    {40390,9},
    {40390,10},
    {40390,11},
    {40391,1},
    {40391,2},
    {40391,3},
    {40391,4},
    {40391,5},
    {40391,6},
    {40391,7},
    {40391,8},
    {40391,9},
    {40391,10},
    {40391,11},
    {40392,1},
    {40392,2},
    {40392,3},
    {40392,4},
    {40392,5},
    {40392,6},
    {40392,7},
    {40392,8},
    {40392,9},
    {40392,10},
    {40392,11},
    {40400,1},
    {40400,2},
    {40400,3},
    {40400,4},
    {40400,5},
    {40400,6},
    {40400,7},
    {40400,8},
    {40400,9},
    {40400,10},
    {40400,11},
    {40401,1},
    {40401,2},
    {40401,3},
    {40401,4},
    {40401,5},
    {40401,6},
    {40401,7},
    {40401,8},
    {40401,9},
    {40401,10},
    {40401,11},
    {40402,1},
    {40402,2},
    {40402,3},
    {40402,4},
    {40402,5},
    {40402,6},
    {40402,7},
    {40402,8},
    {40402,9},
    {40402,10},
    {40402,11},
    {40410,1},
    {40410,2},
    {40410,3},
    {40410,4},
    {40410,5},
    {40410,6},
    {40410,7},
    {40410,8},
    {40410,9},
    {40410,10},
    {40410,11},
    {40411,1},
    {40411,2},
    {40411,3},
    {40411,4},
    {40411,5},
    {40411,6},
    {40411,7},
    {40411,8},
    {40411,9},
    {40411,10},
    {40411,11},
    {40412,1},
    {40412,2},
    {40412,3},
    {40412,4},
    {40412,5},
    {40412,6},
    {40412,7},
    {40412,8},
    {40412,9},
    {40412,10},
    {40412,11},
    {40420,1},
    {40420,2},
    {40420,3},
    {40420,4},
    {40420,5},
    {40420,6},
    {40420,7},
    {40420,8},
    {40420,9},
    {40420,10},
    {40420,11},
    {40421,1},
    {40421,2},
    {40421,3},
    {40421,4},
    {40421,5},
    {40421,6},
    {40421,7},
    {40421,8},
    {40421,9},
    {40421,10},
    {40421,11},
    {40422,1},
    {40422,2},
    {40422,3},
    {40422,4},
    {40422,5},
    {40422,6},
    {40422,7},
    {40422,8},
    {40422,9},
    {40422,10},
    {40422,11},
    {40430,1},
    {40430,2},
    {40430,3},
    {40430,4},
    {40430,5},
    {40430,6},
    {40430,7},
    {40430,8},
    {40430,9},
    {40430,10},
    {40430,11},
    {40431,1},
    {40431,2},
    {40431,3},
    {40431,4},
    {40431,5},
    {40431,6},
    {40431,7},
    {40431,8},
    {40431,9},
    {40431,10},
    {40431,11},
    {40432,1},
    {40432,2},
    {40432,3},
    {40432,4},
    {40432,5},
    {40432,6},
    {40432,7},
    {40432,8},
    {40432,9},
    {40432,10},
    {40432,11},
    {40440,1},
    {40440,2},
    {40440,3},
    {40440,4},
    {40440,5},
    {40440,6},
    {40440,7},
    {40440,8},
    {40440,9},
    {40440,10},
    {40440,11},
    {40441,1},
    {40441,2},
    {40441,3},
    {40441,4},
    {40441,5},
    {40441,6},
    {40441,7},
    {40441,8},
    {40441,9},
    {40441,10},
    {40441,11},
    {40442,1},
    {40442,2},
    {40442,3},
    {40442,4},
    {40442,5},
    {40442,6},
    {40442,7},
    {40442,8},
    {40442,9},
    {40442,10},
    {40442,11},
    {40450,1},
    {40450,2},
    {40450,3},
    {40450,4},
    {40450,5},
    {40450,6},
    {40450,7},
    {40450,8},
    {40450,9},
    {40450,10},
    {40450,11},
    {40451,1},
    {40451,2},
    {40451,3},
    {40451,4},
    {40451,5},
    {40451,6},
    {40451,7},
    {40451,8},
    {40451,9},
    {40451,10},
    {40451,11},
    {40452,1},
    {40452,2},
    {40452,3},
    {40452,4},
    {40452,5},
    {40452,6},
    {40452,7},
    {40452,8},
    {40452,9},
    {40452,10},
    {40452,11},
    {40480,1},
    {40480,2},
    {40480,3},
    {40480,4},
    {40480,5},
    {40480,6},
    {40480,7},
    {40480,8},
    {40480,9},
    {40480,10},
    {40480,11},
    {40481,1},
    {40481,2},
    {40481,3},
    {40481,4},
    {40481,5},
    {40481,6},
    {40481,7},
    {40481,8},
    {40481,9},
    {40481,10},
    {40481,11},
    {40482,1},
    {40482,2},
    {40482,3},
    {40482,4},
    {40482,5},
    {40482,6},
    {40482,7},
    {40482,8},
    {40482,9},
    {40482,10},
    {40482,11},
    {40500,1},
    {40500,2},
    {40500,3},
    {40500,4},
    {40500,5},
    {40500,6},
    {40500,7},
    {40500,8},
    {40500,9},
    {40500,10},
    {40500,11},
    {40501,1},
    {40501,2},
    {40501,3},
    {40501,4},
    {40501,5},
    {40501,6},
    {40501,7},
    {40501,8},
    {40501,9},
    {40501,10},
    {40501,11},
    {40502,1},
    {40502,2},
    {40502,3},
    {40502,4},
    {40502,5},
    {40502,6},
    {40502,7},
    {40502,8},
    {40502,9},
    {40502,10},
    {40502,11},
    {40510,1},
    {40510,2},
    {40510,3},
    {40510,4},
    {40510,5},
    {40510,6},
    {40510,7},
    {40510,8},
    {40510,9},
    {40510,10},
    {40510,11},
    {40511,1},
    {40511,2},
    {40511,3},
    {40511,4},
    {40511,5},
    {40511,6},
    {40511,7},
    {40511,8},
    {40511,9},
    {40511,10},
    {40511,11},
    {40512,1},
    {40512,2},
    {40512,3},
    {40512,4},
    {40512,5},
    {40512,6},
    {40512,7},
    {40512,8},
    {40512,9},
    {40512,10},
    {40512,11},
    {40520,1},
    {40520,2},
    {40520,3},
    {40520,4},
    {40520,5},
    {40520,6},
    {40520,7},
    {40520,8},
    {40520,9},
    {40520,10},
    {40520,11},
    {40521,1},
    {40521,2},
    {40521,3},
    {40521,4},
    {40521,5},
    {40521,6},
    {40521,7},
    {40521,8},
    {40521,9},
    {40521,10},
    {40521,11},
    {40522,1},
    {40522,2},
    {40522,3},
    {40522,4},
    {40522,5},
    {40522,6},
    {40522,7},
    {40522,8},
    {40522,9},
    {40522,10},
    {40522,11},
    {40530,1},
    {40530,2},
    {40530,3},
    {40530,4},
    {40530,5},
    {40530,6},
    {40530,7},
    {40530,8},
    {40530,9},
    {40530,10},
    {40530,11},
    {40531,1},
    {40531,2},
    {40531,3},
    {40531,4},
    {40531,5},
    {40531,6},
    {40531,7},
    {40531,8},
    {40531,9},
    {40531,10},
    {40531,11},
    {40532,1},
    {40532,2},
    {40532,3},
    {40532,4},
    {40532,5},
    {40532,6},
    {40532,7},
    {40532,8},
    {40532,9},
    {40532,10},
    {40532,11},
    {40540,1},
    {40540,2},
    {40540,3},
    {40540,4},
    {40540,5},
    {40540,6},
    {40540,7},
    {40540,8},
    {40540,9},
    {40540,10},
    {40540,11},
    {40541,1},
    {40541,2},
    {40541,3},
    {40541,4},
    {40541,5},
    {40541,6},
    {40541,7},
    {40541,8},
    {40541,9},
    {40541,10},
    {40541,11},
    {40542,1},
    {40542,2},
    {40542,3},
    {40542,4},
    {40542,5},
    {40542,6},
    {40542,7},
    {40542,8},
    {40542,9},
    {40542,10},
    {40542,11}
    ].

get1KeyList()->[
    1701,
    1702,
    1703,
    1704,
    1736,
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
    40080,
    40081,
    40082,
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
    40162,
    40170,
    40171,
    40172,
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
    40262,
    40270,
    40271,
    40272,
    40280,
    40281,
    40282,
    40290,
    40291,
    40294,
    40300,
    40301,
    40302,
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
    40422,
    40430,
    40431,
    40432,
    40440,
    40441,
    40442,
    40450,
    40451,
    40452,
    40480,
    40481,
    40482,
    40500,
    40501,
    40502,
    40510,
    40511,
    40512,
    40520,
    40521,
    40522,
    40530,
    40531,
    40532,
    40540,
    40541,
    40542
    ].

get2KeyList(1701)->[
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
    11
    ];
get2KeyList(1702)->[
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
    11
    ];
get2KeyList(1703)->[
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
    11
    ];
get2KeyList(1704)->[
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
    11
    ];
get2KeyList(1736)->[
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
    11
    ];
get2KeyList(40000)->[
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
    11
    ];
get2KeyList(40001)->[
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
    11
    ];
get2KeyList(40002)->[
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
    11
    ];
get2KeyList(40010)->[
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
    11
    ];
get2KeyList(40011)->[
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
    11
    ];
get2KeyList(40012)->[
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
    11
    ];
get2KeyList(40020)->[
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
    11
    ];
get2KeyList(40022)->[
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
    11
    ];
get2KeyList(40024)->[
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
    11
    ];
get2KeyList(40030)->[
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
    11
    ];
get2KeyList(40031)->[
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
    11
    ];
get2KeyList(40035)->[
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
    11
    ];
get2KeyList(40040)->[
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
    11
    ];
get2KeyList(40041)->[
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
    11
    ];
get2KeyList(40044)->[
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
    11
    ];
get2KeyList(40050)->[
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
    11
    ];
get2KeyList(40053)->[
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
    11
    ];
get2KeyList(40054)->[
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
    11
    ];
get2KeyList(40060)->[
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
    11
    ];
get2KeyList(40061)->[
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
    11
    ];
get2KeyList(40063)->[
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
    11
    ];
get2KeyList(40070)->[
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
    11
    ];
get2KeyList(40071)->[
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
    11
    ];
get2KeyList(40072)->[
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
    11
    ];
get2KeyList(40080)->[
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
    11
    ];
get2KeyList(40081)->[
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
    11
    ];
get2KeyList(40082)->[
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
    11
    ];
get2KeyList(40090)->[
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
    11
    ];
get2KeyList(40091)->[
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
    11
    ];
get2KeyList(40092)->[
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
    11
    ];
get2KeyList(40100)->[
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
    11
    ];
get2KeyList(40101)->[
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
    11
    ];
get2KeyList(40102)->[
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
    11
    ];
get2KeyList(40110)->[
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
    11
    ];
get2KeyList(40111)->[
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
    11
    ];
get2KeyList(40114)->[
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
    11
    ];
get2KeyList(40120)->[
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
    11
    ];
get2KeyList(40121)->[
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
    11
    ];
get2KeyList(40124)->[
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
    11
    ];
get2KeyList(40130)->[
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
    11
    ];
get2KeyList(40131)->[
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
    11
    ];
get2KeyList(40132)->[
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
    11
    ];
get2KeyList(40140)->[
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
    11
    ];
get2KeyList(40141)->[
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
    11
    ];
get2KeyList(40142)->[
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
    11
    ];
get2KeyList(40150)->[
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
    11
    ];
get2KeyList(40151)->[
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
    11
    ];
get2KeyList(40155)->[
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
    11
    ];
get2KeyList(40160)->[
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
    11
    ];
get2KeyList(40161)->[
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
    11
    ];
get2KeyList(40162)->[
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
    11
    ];
get2KeyList(40170)->[
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
    11
    ];
get2KeyList(40171)->[
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
    11
    ];
get2KeyList(40172)->[
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
    11
    ];
get2KeyList(40180)->[
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
    11
    ];
get2KeyList(40181)->[
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
    11
    ];
get2KeyList(40190)->[
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
    11
    ];
get2KeyList(40191)->[
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
    11
    ];
get2KeyList(40200)->[
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
    11
    ];
get2KeyList(40201)->[
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
    11
    ];
get2KeyList(40210)->[
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
    11
    ];
get2KeyList(40211)->[
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
    11
    ];
get2KeyList(40220)->[
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
    11
    ];
get2KeyList(40221)->[
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
    11
    ];
get2KeyList(40230)->[
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
    11
    ];
get2KeyList(40231)->[
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
    11
    ];
get2KeyList(40240)->[
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
    11
    ];
get2KeyList(40241)->[
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
    11
    ];
get2KeyList(40250)->[
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
    11
    ];
get2KeyList(40251)->[
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
    11
    ];
get2KeyList(40260)->[
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
    11
    ];
get2KeyList(40261)->[
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
    11
    ];
get2KeyList(40262)->[
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
    11
    ];
get2KeyList(40270)->[
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
    11
    ];
get2KeyList(40271)->[
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
    11
    ];
get2KeyList(40272)->[
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
    11
    ];
get2KeyList(40280)->[
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
    11
    ];
get2KeyList(40281)->[
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
    11
    ];
get2KeyList(40282)->[
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
    11
    ];
get2KeyList(40290)->[
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
    11
    ];
get2KeyList(40291)->[
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
    11
    ];
get2KeyList(40294)->[
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
    11
    ];
get2KeyList(40300)->[
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
    11
    ];
get2KeyList(40301)->[
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
    11
    ];
get2KeyList(40302)->[
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
    11
    ];
get2KeyList(40310)->[
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
    11
    ];
get2KeyList(40311)->[
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
    11
    ];
get2KeyList(40320)->[
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
    11
    ];
get2KeyList(40321)->[
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
    11
    ];
get2KeyList(40322)->[
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
    11
    ];
get2KeyList(40330)->[
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
    11
    ];
get2KeyList(40331)->[
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
    11
    ];
get2KeyList(40340)->[
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
    11
    ];
get2KeyList(40341)->[
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
    11
    ];
get2KeyList(40350)->[
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
    11
    ];
get2KeyList(40351)->[
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
    11
    ];
get2KeyList(40352)->[
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
    11
    ];
get2KeyList(40360)->[
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
    11
    ];
get2KeyList(40361)->[
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
    11
    ];
get2KeyList(40362)->[
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
    11
    ];
get2KeyList(40370)->[
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
    11
    ];
get2KeyList(40371)->[
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
    11
    ];
get2KeyList(40372)->[
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
    11
    ];
get2KeyList(40380)->[
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
    11
    ];
get2KeyList(40381)->[
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
    11
    ];
get2KeyList(40382)->[
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
    11
    ];
get2KeyList(40390)->[
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
    11
    ];
get2KeyList(40391)->[
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
    11
    ];
get2KeyList(40392)->[
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
    11
    ];
get2KeyList(40400)->[
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
    11
    ];
get2KeyList(40401)->[
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
    11
    ];
get2KeyList(40402)->[
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
    11
    ];
get2KeyList(40410)->[
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
    11
    ];
get2KeyList(40411)->[
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
    11
    ];
get2KeyList(40412)->[
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
    11
    ];
get2KeyList(40420)->[
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
    11
    ];
get2KeyList(40421)->[
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
    11
    ];
get2KeyList(40422)->[
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
    11
    ];
get2KeyList(40430)->[
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
    11
    ];
get2KeyList(40431)->[
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
    11
    ];
get2KeyList(40432)->[
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
    11
    ];
get2KeyList(40440)->[
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
    11
    ];
get2KeyList(40441)->[
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
    11
    ];
get2KeyList(40442)->[
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
    11
    ];
get2KeyList(40450)->[
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
    11
    ];
get2KeyList(40451)->[
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
    11
    ];
get2KeyList(40452)->[
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
    11
    ];
get2KeyList(40480)->[
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
    11
    ];
get2KeyList(40481)->[
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
    11
    ];
get2KeyList(40482)->[
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
    11
    ];
get2KeyList(40500)->[
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
    11
    ];
get2KeyList(40501)->[
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
    11
    ];
get2KeyList(40502)->[
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
    11
    ];
get2KeyList(40510)->[
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
    11
    ];
get2KeyList(40511)->[
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
    11
    ];
get2KeyList(40512)->[
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
    11
    ];
get2KeyList(40520)->[
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
    11
    ];
get2KeyList(40521)->[
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
    11
    ];
get2KeyList(40522)->[
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
    11
    ];
get2KeyList(40530)->[
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
    11
    ];
get2KeyList(40531)->[
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
    11
    ];
get2KeyList(40532)->[
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
    11
    ];
get2KeyList(40540)->[
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
    11
    ];
get2KeyList(40541)->[
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
    11
    ];
get2KeyList(40542)->[
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
    11
    ];
get2KeyList(_)->[].

