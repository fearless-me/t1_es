%% coding: latin-1
%%: 实现
-module(cfg_player_skills_upgrading_cht).
-compile(export_all).
-include("cfg_player_skills_upgrading.hrl").


getRow(101000,1)->
    #player_skills_upgradingCfg {
    skillID = 101000,
    level = 1,
    player_level = 1,
    currency = [],
    skillcoin_cost = 0,
    item = [{0,0}],
    describe = "普通攻击80%攻击的",
    id = 1
    };
getRow(101001,1)->
    #player_skills_upgradingCfg {
    skillID = 101001,
    level = 1,
    player_level = 1,
    currency = [],
    skillcoin_cost = 0,
    item = [],
    describe = "普通攻击80%攻击的",
    id = 2
    };
getRow(101002,1)->
    #player_skills_upgradingCfg {
    skillID = 101002,
    level = 1,
    player_level = 1,
    currency = [],
    skillcoin_cost = 0,
    item = [],
    describe = "普通攻击90%攻击的",
    id = 3
    };
getRow(101003,1)->
    #player_skills_upgradingCfg {
    skillID = 101003,
    level = 1,
    player_level = 1,
    currency = [],
    skillcoin_cost = 0,
    item = [],
    describe = "以身化剑，向前旋转冲锋10米，攻击前方直线范围内敌人，造成4次攻击，每次造成50%物理攻击的伤害。",
    id = 4
    };
getRow(101003,2)->
    #player_skills_upgradingCfg {
    skillID = 101003,
    level = 2,
    player_level = 3,
    currency = [{1,4000}],
    skillcoin_cost = 1,
    item = [],
    describe = "以身化剑，向前旋转冲锋10米，攻击前方直线范围内敌人，造成4次攻击，每次造成53%物理攻击的伤害。",
    id = 5
    };
getRow(101003,3)->
    #player_skills_upgradingCfg {
    skillID = 101003,
    level = 3,
    player_level = 4,
    currency = [{1,6000}],
    skillcoin_cost = 1,
    item = [],
    describe = "以身化剑，向前旋转冲锋10米，攻击前方直线范围内敌人，造成4次攻击，每次造成56%物理攻击的伤害。",
    id = 6
    };
getRow(101003,4)->
    #player_skills_upgradingCfg {
    skillID = 101003,
    level = 4,
    player_level = 9,
    currency = [{1,12000}],
    skillcoin_cost = 1,
    item = [],
    describe = "以身化剑，向前旋转冲锋10米，攻击前方直线范围内敌人，造成4次攻击，每次造成59%物理攻击的伤害。",
    id = 7
    };
getRow(101003,5)->
    #player_skills_upgradingCfg {
    skillID = 101003,
    level = 5,
    player_level = 13,
    currency = [{1,15000}],
    skillcoin_cost = 1,
    item = [],
    describe = "以身化剑，向前旋转冲锋10米，攻击前方直线范围内敌人，造成4次攻击，每次造成62%物理攻击的伤害。",
    id = 8
    };
getRow(101003,6)->
    #player_skills_upgradingCfg {
    skillID = 101003,
    level = 6,
    player_level = 17,
    currency = [{1,20000}],
    skillcoin_cost = 1,
    item = [],
    describe = "以身化剑，向前旋转冲锋10米，攻击前方直线范围内敌人，造成4次攻击，每次造成65%物理攻击的伤害。",
    id = 9
    };
getRow(101004,1)->
    #player_skills_upgradingCfg {
    skillID = 101004,
    level = 1,
    player_level = 4,
    currency = [],
    skillcoin_cost = 1,
    item = [],
    describe = "用最大力量砍向前方敌人，对敌人造成总计250%物理攻击的伤害",
    id = 10
    };
getRow(101004,2)->
    #player_skills_upgradingCfg {
    skillID = 101004,
    level = 2,
    player_level = 7,
    currency = [{1,4000}],
    skillcoin_cost = 1,
    item = [],
    describe = "用最大力量砍向前方敌人，对敌人造成总计265%物理攻击的伤害",
    id = 11
    };
getRow(101004,3)->
    #player_skills_upgradingCfg {
    skillID = 101004,
    level = 3,
    player_level = 10,
    currency = [{1,6000}],
    skillcoin_cost = 1,
    item = [],
    describe = "用最大力量砍向前方敌人，对敌人造成总计280%物理攻击的伤害",
    id = 12
    };
getRow(101004,4)->
    #player_skills_upgradingCfg {
    skillID = 101004,
    level = 4,
    player_level = 13,
    currency = [{1,12000}],
    skillcoin_cost = 1,
    item = [],
    describe = "用最大力量砍向前方敌人，对敌人造成总计295%物理攻击的伤害",
    id = 13
    };
getRow(101004,5)->
    #player_skills_upgradingCfg {
    skillID = 101004,
    level = 5,
    player_level = 15,
    currency = [{1,15000}],
    skillcoin_cost = 1,
    item = [],
    describe = "用最大力量砍向前方敌人，对敌人造成总计310%物理攻击的伤害",
    id = 14
    };
getRow(101004,6)->
    #player_skills_upgradingCfg {
    skillID = 101004,
    level = 6,
    player_level = 18,
    currency = [{1,20000}],
    skillcoin_cost = 1,
    item = [],
    describe = "用最大力量砍向前方敌人，对敌人造成总计325%物理攻击的伤害",
    id = 15
    };
getRow(101005,1)->
    #player_skills_upgradingCfg {
    skillID = 101005,
    level = 1,
    player_level = 8,
    currency = [],
    skillcoin_cost = 1,
    item = [],
    describe = "用身体带动重剑进行下沉回旋，卷起范围内的目标，使其总计受到150%物理攻击的伤害",
    id = 16
    };
getRow(101005,2)->
    #player_skills_upgradingCfg {
    skillID = 101005,
    level = 2,
    player_level = 10,
    currency = [{1,4000}],
    skillcoin_cost = 1,
    item = [],
    describe = "用身体带动重剑进行下沉回旋，卷起范围内的目标，使其总计受到159%物理攻击的伤害",
    id = 17
    };
getRow(101005,3)->
    #player_skills_upgradingCfg {
    skillID = 101005,
    level = 3,
    player_level = 12,
    currency = [{1,6000}],
    skillcoin_cost = 1,
    item = [],
    describe = "用身体带动重剑进行下沉回旋，卷起范围内的目标，使其总计受到168%物理攻击的伤害",
    id = 18
    };
getRow(101005,4)->
    #player_skills_upgradingCfg {
    skillID = 101005,
    level = 4,
    player_level = 14,
    currency = [{1,12000}],
    skillcoin_cost = 1,
    item = [],
    describe = "用身体带动重剑进行下沉回旋，卷起范围内的目标，使其总计受到177%物理攻击的伤害",
    id = 19
    };
getRow(101005,5)->
    #player_skills_upgradingCfg {
    skillID = 101005,
    level = 5,
    player_level = 17,
    currency = [{1,15000}],
    skillcoin_cost = 1,
    item = [],
    describe = "用身体带动重剑进行下沉回旋，卷起范围内的目标，使其总计受到186%物理攻击的伤害",
    id = 20
    };
getRow(101005,6)->
    #player_skills_upgradingCfg {
    skillID = 101005,
    level = 6,
    player_level = 19,
    currency = [{1,20000}],
    skillcoin_cost = 1,
    item = [],
    describe = "用身体带动重剑进行下沉回旋，卷起范围内的目标，使其总计受到195%物理攻击的伤害",
    id = 21
    };
getRow(101006,1)->
    #player_skills_upgradingCfg {
    skillID = 101006,
    level = 1,
    player_level = 12,
    currency = [],
    skillcoin_cost = 1,
    item = [],
    describe = "使周围全体队友提升10%攻击，持续10秒",
    id = 22
    };
getRow(101006,2)->
    #player_skills_upgradingCfg {
    skillID = 101006,
    level = 2,
    player_level = 13,
    currency = [{1,4000}],
    skillcoin_cost = 1,
    item = [],
    describe = "使周围全体队友提升11%攻击，持续10秒",
    id = 23
    };
getRow(101006,3)->
    #player_skills_upgradingCfg {
    skillID = 101006,
    level = 3,
    player_level = 14,
    currency = [{1,6000}],
    skillcoin_cost = 1,
    item = [],
    describe = "使周围全体队友提升12%攻击，持续10秒",
    id = 24
    };
getRow(101006,4)->
    #player_skills_upgradingCfg {
    skillID = 101006,
    level = 4,
    player_level = 15,
    currency = [{1,12000}],
    skillcoin_cost = 1,
    item = [],
    describe = "使周围全体队友提升13%攻击，持续10秒",
    id = 25
    };
getRow(101006,5)->
    #player_skills_upgradingCfg {
    skillID = 101006,
    level = 5,
    player_level = 17,
    currency = [{1,15000}],
    skillcoin_cost = 1,
    item = [],
    describe = "使周围全体队友提升14%攻击，持续10秒",
    id = 26
    };
getRow(101006,6)->
    #player_skills_upgradingCfg {
    skillID = 101006,
    level = 6,
    player_level = 19,
    currency = [{1,20000}],
    skillcoin_cost = 1,
    item = [],
    describe = "使周围全体队友提升15%攻击，持续10秒",
    id = 27
    };
getRow(111000,1)->
    #player_skills_upgradingCfg {
    skillID = 111000,
    level = 1,
    player_level = 20,
    currency = [],
    skillcoin_cost = 0,
    item = [],
    describe = "普通攻击90%攻击的",
    id = 28
    };
getRow(111001,1)->
    #player_skills_upgradingCfg {
    skillID = 111001,
    level = 1,
    player_level = 20,
    currency = [],
    skillcoin_cost = 0,
    item = [],
    describe = "普通攻击90%攻击的",
    id = 29
    };
getRow(111002,1)->
    #player_skills_upgradingCfg {
    skillID = 111002,
    level = 1,
    player_level = 20,
    currency = [],
    skillcoin_cost = 0,
    item = [],
    describe = "普通攻击100%攻击的",
    id = 30
    };
getRow(111003,1)->
    #player_skills_upgradingCfg {
    skillID = 111003,
    level = 1,
    player_level = 20,
    currency = [],
    skillcoin_cost = 0,
    item = [],
    describe = "使用剑，快速的斩击，造成2次攻击，每次造成150%物理攻击的伤害",
    id = 31
    };
getRow(111003,2)->
    #player_skills_upgradingCfg {
    skillID = 111003,
    level = 2,
    player_level = 20,
    currency = [{1,10000}],
    skillcoin_cost = 1,
    item = [],
    describe = "使用剑，快速的斩击，造成2次攻击，每次造成158%物理攻击的伤害",
    id = 32
    };
getRow(111003,3)->
    #player_skills_upgradingCfg {
    skillID = 111003,
    level = 3,
    player_level = 20,
    currency = [{1,15000}],
    skillcoin_cost = 1,
    item = [],
    describe = "使用剑，快速的斩击，造成2次攻击，每次造成166%物理攻击的伤害",
    id = 33
    };
getRow(111003,4)->
    #player_skills_upgradingCfg {
    skillID = 111003,
    level = 4,
    player_level = 22,
    currency = [{1,20000}],
    skillcoin_cost = 1,
    item = [],
    describe = "使用剑，快速的斩击，造成2次攻击，每次造成174%物理攻击的伤害",
    id = 34
    };
getRow(111003,5)->
    #player_skills_upgradingCfg {
    skillID = 111003,
    level = 5,
    player_level = 25,
    currency = [{1,25000}],
    skillcoin_cost = 1,
    item = [],
    describe = "使用剑，快速的斩击，造成2次攻击，每次造成182%物理攻击的伤害",
    id = 35
    };
getRow(111003,6)->
    #player_skills_upgradingCfg {
    skillID = 111003,
    level = 6,
    player_level = 28,
    currency = [{1,30000}],
    skillcoin_cost = 1,
    item = [],
    describe = "使用剑，快速的斩击，造成2次攻击，每次造成190%物理攻击的伤害",
    id = 36
    };
getRow(111003,7)->
    #player_skills_upgradingCfg {
    skillID = 111003,
    level = 7,
    player_level = 31,
    currency = [{1,35000}],
    skillcoin_cost = 1,
    item = [],
    describe = "使用剑，快速的斩击，造成2次攻击，每次造成198%物理攻击的伤害",
    id = 37
    };
getRow(111003,8)->
    #player_skills_upgradingCfg {
    skillID = 111003,
    level = 8,
    player_level = 34,
    currency = [{1,40000}],
    skillcoin_cost = 1,
    item = [],
    describe = "使用剑，快速的斩击，造成2次攻击，每次造成206%物理攻击的伤害",
    id = 38
    };
getRow(111003,9)->
    #player_skills_upgradingCfg {
    skillID = 111003,
    level = 9,
    player_level = 37,
    currency = [{1,45000}],
    skillcoin_cost = 1,
    item = [],
    describe = "使用剑，快速的斩击，造成2次攻击，每次造成214%物理攻击的伤害",
    id = 39
    };
getRow(111003,10)->
    #player_skills_upgradingCfg {
    skillID = 111003,
    level = 10,
    player_level = 40,
    currency = [{1,50000}],
    skillcoin_cost = 1,
    item = [],
    describe = "使用剑，快速的斩击，造成2次攻击，每次造成222%物理攻击的伤害",
    id = 40
    };
getRow(111003,11)->
    #player_skills_upgradingCfg {
    skillID = 111003,
    level = 11,
    player_level = 43,
    currency = [{1,55000}],
    skillcoin_cost = 1,
    item = [],
    describe = "使用剑，快速的斩击，造成2次攻击，每次造成230%物理攻击的伤害",
    id = 41
    };
getRow(111003,12)->
    #player_skills_upgradingCfg {
    skillID = 111003,
    level = 12,
    player_level = 46,
    currency = [{1,60000}],
    skillcoin_cost = 1,
    item = [],
    describe = "使用剑，快速的斩击，造成2次攻击，每次造成238%物理攻击的伤害",
    id = 42
    };
getRow(111003,13)->
    #player_skills_upgradingCfg {
    skillID = 111003,
    level = 13,
    player_level = 49,
    currency = [{1,65000}],
    skillcoin_cost = 1,
    item = [],
    describe = "使用剑，快速的斩击，造成2次攻击，每次造成246%物理攻击的伤害",
    id = 43
    };
getRow(111003,14)->
    #player_skills_upgradingCfg {
    skillID = 111003,
    level = 14,
    player_level = 52,
    currency = [{1,70000}],
    skillcoin_cost = 1,
    item = [],
    describe = "使用剑，快速的斩击，造成2次攻击，每次造成254%物理攻击的伤害",
    id = 44
    };
getRow(111003,15)->
    #player_skills_upgradingCfg {
    skillID = 111003,
    level = 15,
    player_level = 55,
    currency = [{1,75000}],
    skillcoin_cost = 1,
    item = [],
    describe = "使用剑，快速的斩击，造成2次攻击，每次造成262%物理攻击的伤害",
    id = 45
    };
getRow(111004,1)->
    #player_skills_upgradingCfg {
    skillID = 111004,
    level = 1,
    player_level = 20,
    currency = [],
    skillcoin_cost = 1,
    item = [],
    describe = "向前快速移动20米，用强力突刺攻击敌人，造成210%物理攻击的伤害，并造成流血",
    id = 46
    };
getRow(111004,2)->
    #player_skills_upgradingCfg {
    skillID = 111004,
    level = 2,
    player_level = 20,
    currency = [{1,10000}],
    skillcoin_cost = 1,
    item = [],
    describe = "向前快速移动20米，用强力突刺攻击敌人，造成222%物理攻击的伤害，并造成流血",
    id = 47
    };
getRow(111004,3)->
    #player_skills_upgradingCfg {
    skillID = 111004,
    level = 3,
    player_level = 20,
    currency = [{1,15000}],
    skillcoin_cost = 1,
    item = [],
    describe = "向前快速移动20米，用强力突刺攻击敌人，造成234%物理攻击的伤害，并造成流血",
    id = 48
    };
getRow(111004,4)->
    #player_skills_upgradingCfg {
    skillID = 111004,
    level = 4,
    player_level = 22,
    currency = [{1,20000}],
    skillcoin_cost = 1,
    item = [],
    describe = "向前快速移动20米，用强力突刺攻击敌人，造成246%物理攻击的伤害，并造成流血",
    id = 49
    };
getRow(111004,5)->
    #player_skills_upgradingCfg {
    skillID = 111004,
    level = 5,
    player_level = 25,
    currency = [{1,25000}],
    skillcoin_cost = 1,
    item = [],
    describe = "向前快速移动20米，用强力突刺攻击敌人，造成258%物理攻击的伤害，并造成流血",
    id = 50
    };
getRow(111004,6)->
    #player_skills_upgradingCfg {
    skillID = 111004,
    level = 6,
    player_level = 28,
    currency = [{1,30000}],
    skillcoin_cost = 1,
    item = [],
    describe = "向前快速移动20米，用强力突刺攻击敌人，造成270%物理攻击的伤害，并造成流血",
    id = 51
    };
getRow(111004,7)->
    #player_skills_upgradingCfg {
    skillID = 111004,
    level = 7,
    player_level = 31,
    currency = [{1,35000}],
    skillcoin_cost = 1,
    item = [],
    describe = "向前快速移动20米，用强力突刺攻击敌人，造成282%物理攻击的伤害，并造成流血",
    id = 52
    };
getRow(111004,8)->
    #player_skills_upgradingCfg {
    skillID = 111004,
    level = 8,
    player_level = 34,
    currency = [{1,40000}],
    skillcoin_cost = 1,
    item = [],
    describe = "向前快速移动20米，用强力突刺攻击敌人，造成294%物理攻击的伤害，并造成流血",
    id = 53
    };
getRow(111004,9)->
    #player_skills_upgradingCfg {
    skillID = 111004,
    level = 9,
    player_level = 37,
    currency = [{1,45000}],
    skillcoin_cost = 1,
    item = [],
    describe = "向前快速移动20米，用强力突刺攻击敌人，造成306%物理攻击的伤害，并造成流血",
    id = 54
    };
getRow(111004,10)->
    #player_skills_upgradingCfg {
    skillID = 111004,
    level = 10,
    player_level = 40,
    currency = [{1,50000}],
    skillcoin_cost = 1,
    item = [],
    describe = "向前快速移动20米，用强力突刺攻击敌人，造成318%物理攻击的伤害，并造成流血",
    id = 55
    };
getRow(111004,11)->
    #player_skills_upgradingCfg {
    skillID = 111004,
    level = 11,
    player_level = 43,
    currency = [{1,55000}],
    skillcoin_cost = 1,
    item = [],
    describe = "向前快速移动20米，用强力突刺攻击敌人，造成330%物理攻击的伤害，并造成流血",
    id = 56
    };
getRow(111004,12)->
    #player_skills_upgradingCfg {
    skillID = 111004,
    level = 12,
    player_level = 46,
    currency = [{1,60000}],
    skillcoin_cost = 1,
    item = [],
    describe = "向前快速移动20米，用强力突刺攻击敌人，造成342%物理攻击的伤害，并造成流血",
    id = 57
    };
getRow(111004,13)->
    #player_skills_upgradingCfg {
    skillID = 111004,
    level = 13,
    player_level = 49,
    currency = [{1,65000}],
    skillcoin_cost = 1,
    item = [],
    describe = "向前快速移动20米，用强力突刺攻击敌人，造成354%物理攻击的伤害，并造成流血",
    id = 58
    };
getRow(111004,14)->
    #player_skills_upgradingCfg {
    skillID = 111004,
    level = 14,
    player_level = 52,
    currency = [{1,70000}],
    skillcoin_cost = 1,
    item = [],
    describe = "向前快速移动20米，用强力突刺攻击敌人，造成366%物理攻击的伤害，并造成流血",
    id = 59
    };
getRow(111004,15)->
    #player_skills_upgradingCfg {
    skillID = 111004,
    level = 15,
    player_level = 55,
    currency = [{1,75000}],
    skillcoin_cost = 1,
    item = [],
    describe = "向前快速移动20米，用强力突刺攻击敌人，造成378%物理攻击的伤害，并造成流血",
    id = 60
    };
getRow(111005,1)->
    #player_skills_upgradingCfg {
    skillID = 111005,
    level = 1,
    player_level = 20,
    currency = [],
    skillcoin_cost = 1,
    item = [],
    describe = "用盾牌往敌人的头部猛力一击，造成250%物理攻击的伤害，并降低敌人4%的攻击,持续3秒。",
    id = 61
    };
getRow(111005,2)->
    #player_skills_upgradingCfg {
    skillID = 111005,
    level = 2,
    player_level = 20,
    currency = [{1,10000}],
    skillcoin_cost = 1,
    item = [],
    describe = "用盾牌往敌人的头部猛力一击，造成262%物理攻击的伤害，并降低敌人4.3%的攻击,持续3秒。",
    id = 62
    };
getRow(111005,3)->
    #player_skills_upgradingCfg {
    skillID = 111005,
    level = 3,
    player_level = 20,
    currency = [{1,15000}],
    skillcoin_cost = 1,
    item = [],
    describe = "用盾牌往敌人的头部猛力一击，造成274%物理攻击的伤害，并降低敌人4.6%的攻击,持续3秒。",
    id = 63
    };
getRow(111005,4)->
    #player_skills_upgradingCfg {
    skillID = 111005,
    level = 4,
    player_level = 22,
    currency = [{1,20000}],
    skillcoin_cost = 1,
    item = [],
    describe = "用盾牌往敌人的头部猛力一击，造成286%物理攻击的伤害，并降低敌人4.9%的攻击,持续3秒。",
    id = 64
    };
getRow(111005,5)->
    #player_skills_upgradingCfg {
    skillID = 111005,
    level = 5,
    player_level = 25,
    currency = [{1,25000}],
    skillcoin_cost = 1,
    item = [],
    describe = "用盾牌往敌人的头部猛力一击，造成298%物理攻击的伤害，并降低敌人5.2%的攻击,持续3秒。",
    id = 65
    };
getRow(111005,6)->
    #player_skills_upgradingCfg {
    skillID = 111005,
    level = 6,
    player_level = 28,
    currency = [{1,30000}],
    skillcoin_cost = 1,
    item = [],
    describe = "用盾牌往敌人的头部猛力一击，造成310%物理攻击的伤害，并降低敌人5.5%的攻击,持续3秒。",
    id = 66
    };
getRow(111005,7)->
    #player_skills_upgradingCfg {
    skillID = 111005,
    level = 7,
    player_level = 31,
    currency = [{1,35000}],
    skillcoin_cost = 1,
    item = [],
    describe = "用盾牌往敌人的头部猛力一击，造成322%物理攻击的伤害，并降低敌人5.8%的攻击,持续3秒。",
    id = 67
    };
getRow(111005,8)->
    #player_skills_upgradingCfg {
    skillID = 111005,
    level = 8,
    player_level = 34,
    currency = [{1,40000}],
    skillcoin_cost = 1,
    item = [],
    describe = "用盾牌往敌人的头部猛力一击，造成334%物理攻击的伤害，并降低敌人6.1%的攻击,持续3秒。",
    id = 68
    };
getRow(111005,9)->
    #player_skills_upgradingCfg {
    skillID = 111005,
    level = 9,
    player_level = 37,
    currency = [{1,45000}],
    skillcoin_cost = 1,
    item = [],
    describe = "用盾牌往敌人的头部猛力一击，造成346%物理攻击的伤害，并降低敌人6.4%的攻击,持续3秒。",
    id = 69
    };
getRow(111005,10)->
    #player_skills_upgradingCfg {
    skillID = 111005,
    level = 10,
    player_level = 40,
    currency = [{1,50000}],
    skillcoin_cost = 1,
    item = [],
    describe = "用盾牌往敌人的头部猛力一击，造成358%物理攻击的伤害，并降低敌人6.7%的攻击,持续3秒。",
    id = 70
    };
getRow(111005,11)->
    #player_skills_upgradingCfg {
    skillID = 111005,
    level = 11,
    player_level = 43,
    currency = [{1,55000}],
    skillcoin_cost = 1,
    item = [],
    describe = "用盾牌往敌人的头部猛力一击，造成370%物理攻击的伤害，并降低敌人7%的攻击,持续3秒。",
    id = 71
    };
getRow(111005,12)->
    #player_skills_upgradingCfg {
    skillID = 111005,
    level = 12,
    player_level = 46,
    currency = [{1,60000}],
    skillcoin_cost = 1,
    item = [],
    describe = "用盾牌往敌人的头部猛力一击，造成382%物理攻击的伤害，并降低敌人7.3%的攻击,持续3秒。",
    id = 72
    };
getRow(111005,13)->
    #player_skills_upgradingCfg {
    skillID = 111005,
    level = 13,
    player_level = 49,
    currency = [{1,65000}],
    skillcoin_cost = 1,
    item = [],
    describe = "用盾牌往敌人的头部猛力一击，造成394%物理攻击的伤害，并降低敌人7.6%的攻击,持续3秒。",
    id = 73
    };
getRow(111005,14)->
    #player_skills_upgradingCfg {
    skillID = 111005,
    level = 14,
    player_level = 52,
    currency = [{1,70000}],
    skillcoin_cost = 1,
    item = [],
    describe = "用盾牌往敌人的头部猛力一击，造成406%物理攻击的伤害，并降低敌人7.9%的攻击,持续3秒。",
    id = 74
    };
getRow(111005,15)->
    #player_skills_upgradingCfg {
    skillID = 111005,
    level = 15,
    player_level = 55,
    currency = [{1,75000}],
    skillcoin_cost = 1,
    item = [],
    describe = "用盾牌往敌人的头部猛力一击，造成418%物理攻击的伤害，并降低敌人8.2%的攻击,持续3秒。",
    id = 75
    };
getRow(111006,1)->
    #player_skills_upgradingCfg {
    skillID = 111006,
    level = 1,
    player_level = 20,
    currency = [],
    skillcoin_cost = 1,
    item = [],
    describe = "使用剑，跳跃到半空中奋力向下砍击，给予攻击目标前方范围内所有敌人250%物理攻击的伤害，并击晕目标2秒。",
    id = 76
    };
getRow(111006,2)->
    #player_skills_upgradingCfg {
    skillID = 111006,
    level = 2,
    player_level = 20,
    currency = [{1,10000}],
    skillcoin_cost = 1,
    item = [],
    describe = "使用剑，跳跃到半空中奋力向下砍击，给予攻击目标前方范围内所有敌人262%物理攻击的伤害，并击晕目标2秒。",
    id = 77
    };
getRow(111006,3)->
    #player_skills_upgradingCfg {
    skillID = 111006,
    level = 3,
    player_level = 20,
    currency = [{1,15000}],
    skillcoin_cost = 1,
    item = [],
    describe = "使用剑，跳跃到半空中奋力向下砍击，给予攻击目标前方范围内所有敌人274%物理攻击的伤害，并击晕目标2秒。",
    id = 78
    };
getRow(111006,4)->
    #player_skills_upgradingCfg {
    skillID = 111006,
    level = 4,
    player_level = 22,
    currency = [{1,20000}],
    skillcoin_cost = 1,
    item = [],
    describe = "使用剑，跳跃到半空中奋力向下砍击，给予攻击目标前方范围内所有敌人286%物理攻击的伤害，并击晕目标2秒。",
    id = 79
    };
getRow(111006,5)->
    #player_skills_upgradingCfg {
    skillID = 111006,
    level = 5,
    player_level = 25,
    currency = [{1,25000}],
    skillcoin_cost = 1,
    item = [],
    describe = "使用剑，跳跃到半空中奋力向下砍击，给予攻击目标前方范围内所有敌人298%物理攻击的伤害，并击晕目标2秒。",
    id = 80
    };
getRow(111006,6)->
    #player_skills_upgradingCfg {
    skillID = 111006,
    level = 6,
    player_level = 28,
    currency = [{1,30000}],
    skillcoin_cost = 1,
    item = [],
    describe = "使用剑，跳跃到半空中奋力向下砍击，给予攻击目标前方范围内所有敌人310%物理攻击的伤害，并击晕目标2秒。",
    id = 81
    };
getRow(111006,7)->
    #player_skills_upgradingCfg {
    skillID = 111006,
    level = 7,
    player_level = 31,
    currency = [{1,35000}],
    skillcoin_cost = 1,
    item = [],
    describe = "使用剑，跳跃到半空中奋力向下砍击，给予攻击目标前方范围内所有敌人322%物理攻击的伤害，并击晕目标2秒。",
    id = 82
    };
getRow(111006,8)->
    #player_skills_upgradingCfg {
    skillID = 111006,
    level = 8,
    player_level = 34,
    currency = [{1,40000}],
    skillcoin_cost = 1,
    item = [],
    describe = "使用剑，跳跃到半空中奋力向下砍击，给予攻击目标前方范围内所有敌人334%物理攻击的伤害，并击晕目标2秒。",
    id = 83
    };
getRow(111006,9)->
    #player_skills_upgradingCfg {
    skillID = 111006,
    level = 9,
    player_level = 37,
    currency = [{1,45000}],
    skillcoin_cost = 1,
    item = [],
    describe = "使用剑，跳跃到半空中奋力向下砍击，给予攻击目标前方范围内所有敌人346%物理攻击的伤害，并击晕目标2秒。",
    id = 84
    };
getRow(111006,10)->
    #player_skills_upgradingCfg {
    skillID = 111006,
    level = 10,
    player_level = 40,
    currency = [{1,50000}],
    skillcoin_cost = 1,
    item = [],
    describe = "使用剑，跳跃到半空中奋力向下砍击，给予攻击目标前方范围内所有敌人358%物理攻击的伤害，并击晕目标2秒。",
    id = 85
    };
getRow(111006,11)->
    #player_skills_upgradingCfg {
    skillID = 111006,
    level = 11,
    player_level = 43,
    currency = [{1,55000}],
    skillcoin_cost = 1,
    item = [],
    describe = "使用剑，跳跃到半空中奋力向下砍击，给予攻击目标前方范围内所有敌人370%物理攻击的伤害，并击晕目标2秒。",
    id = 86
    };
getRow(111006,12)->
    #player_skills_upgradingCfg {
    skillID = 111006,
    level = 12,
    player_level = 46,
    currency = [{1,60000}],
    skillcoin_cost = 1,
    item = [],
    describe = "使用剑，跳跃到半空中奋力向下砍击，给予攻击目标前方范围内所有敌人382%物理攻击的伤害，并击晕目标2秒。",
    id = 87
    };
getRow(111006,13)->
    #player_skills_upgradingCfg {
    skillID = 111006,
    level = 13,
    player_level = 49,
    currency = [{1,65000}],
    skillcoin_cost = 1,
    item = [],
    describe = "使用剑，跳跃到半空中奋力向下砍击，给予攻击目标前方范围内所有敌人394%物理攻击的伤害，并击晕目标2秒。",
    id = 88
    };
getRow(111006,14)->
    #player_skills_upgradingCfg {
    skillID = 111006,
    level = 14,
    player_level = 52,
    currency = [{1,70000}],
    skillcoin_cost = 1,
    item = [],
    describe = "使用剑，跳跃到半空中奋力向下砍击，给予攻击目标前方范围内所有敌人406%物理攻击的伤害，并击晕目标2秒。",
    id = 89
    };
getRow(111006,15)->
    #player_skills_upgradingCfg {
    skillID = 111006,
    level = 15,
    player_level = 55,
    currency = [{1,75000}],
    skillcoin_cost = 1,
    item = [],
    describe = "使用剑，跳跃到半空中奋力向下砍击，给予攻击目标前方范围内所有敌人418%物理攻击的伤害，并击晕目标2秒。",
    id = 90
    };
getRow(111007,1)->
    #player_skills_upgradingCfg {
    skillID = 111007,
    level = 1,
    player_level = 20,
    currency = [],
    skillcoin_cost = 1,
    item = [],
    describe = "使周围全体队友提升20%物理防御，持续10秒。",
    id = 91
    };
getRow(111007,2)->
    #player_skills_upgradingCfg {
    skillID = 111007,
    level = 2,
    player_level = 20,
    currency = [{1,10000}],
    skillcoin_cost = 1,
    item = [],
    describe = "使周围全体队友提升22%物理防御，持续10秒。",
    id = 92
    };
getRow(111007,3)->
    #player_skills_upgradingCfg {
    skillID = 111007,
    level = 3,
    player_level = 20,
    currency = [{1,15000}],
    skillcoin_cost = 1,
    item = [],
    describe = "使周围全体队友提升24%物理防御，持续10秒。",
    id = 93
    };
getRow(111007,4)->
    #player_skills_upgradingCfg {
    skillID = 111007,
    level = 4,
    player_level = 22,
    currency = [{1,20000}],
    skillcoin_cost = 1,
    item = [],
    describe = "使周围全体队友提升26%物理防御，持续10秒。",
    id = 94
    };
getRow(111007,5)->
    #player_skills_upgradingCfg {
    skillID = 111007,
    level = 5,
    player_level = 25,
    currency = [{1,25000}],
    skillcoin_cost = 1,
    item = [],
    describe = "使周围全体队友提升28%物理防御，持续10秒。",
    id = 95
    };
getRow(111007,6)->
    #player_skills_upgradingCfg {
    skillID = 111007,
    level = 6,
    player_level = 28,
    currency = [{1,30000}],
    skillcoin_cost = 1,
    item = [],
    describe = "使周围全体队友提升30%物理防御，持续10秒。",
    id = 96
    };
getRow(111007,7)->
    #player_skills_upgradingCfg {
    skillID = 111007,
    level = 7,
    player_level = 31,
    currency = [{1,35000}],
    skillcoin_cost = 1,
    item = [],
    describe = "使周围全体队友提升32%物理防御，持续10秒。",
    id = 91
    };
getRow(111007,8)->
    #player_skills_upgradingCfg {
    skillID = 111007,
    level = 8,
    player_level = 34,
    currency = [{1,40000}],
    skillcoin_cost = 1,
    item = [],
    describe = "使周围全体队友提升34%物理防御，持续10秒。",
    id = 92
    };
getRow(111007,9)->
    #player_skills_upgradingCfg {
    skillID = 111007,
    level = 9,
    player_level = 37,
    currency = [{1,45000}],
    skillcoin_cost = 1,
    item = [],
    describe = "使周围全体队友提升36%物理防御，持续10秒。",
    id = 93
    };
getRow(111007,10)->
    #player_skills_upgradingCfg {
    skillID = 111007,
    level = 10,
    player_level = 40,
    currency = [{1,50000}],
    skillcoin_cost = 1,
    item = [],
    describe = "使周围全体队友提升38%物理防御，持续10秒。",
    id = 94
    };
getRow(111007,11)->
    #player_skills_upgradingCfg {
    skillID = 111007,
    level = 11,
    player_level = 43,
    currency = [{1,55000}],
    skillcoin_cost = 1,
    item = [],
    describe = "使周围全体队友提升40%物理防御，持续10秒。",
    id = 95
    };
getRow(111008,1)->
    #player_skills_upgradingCfg {
    skillID = 111008,
    level = 1,
    player_level = 20,
    currency = [],
    skillcoin_cost = 1,
    item = [],
    describe = "抓取目标，使目标攻击自己，并降低目标15%物理防御和15%魔法防御，持续8秒",
    id = 106
    };
getRow(111008,2)->
    #player_skills_upgradingCfg {
    skillID = 111008,
    level = 2,
    player_level = 20,
    currency = [{1,10000}],
    skillcoin_cost = 1,
    item = [],
    describe = "抓取目标，使目标攻击自己，并降低目标16%物理防御和16%魔法防御，持续8秒",
    id = 107
    };
getRow(111008,3)->
    #player_skills_upgradingCfg {
    skillID = 111008,
    level = 3,
    player_level = 20,
    currency = [{1,15000}],
    skillcoin_cost = 1,
    item = [],
    describe = "抓取目标，使目标攻击自己，并降低目标17%物理防御和17%魔法防御，持续8秒",
    id = 108
    };
getRow(111008,4)->
    #player_skills_upgradingCfg {
    skillID = 111008,
    level = 4,
    player_level = 22,
    currency = [{1,20000}],
    skillcoin_cost = 1,
    item = [],
    describe = "抓取目标，使目标攻击自己，并降低目标18%物理防御和18%魔法防御，持续8秒",
    id = 109
    };
getRow(111008,5)->
    #player_skills_upgradingCfg {
    skillID = 111008,
    level = 5,
    player_level = 25,
    currency = [{1,25000}],
    skillcoin_cost = 1,
    item = [],
    describe = "抓取目标，使目标攻击自己，并降低目标19%物理防御和19%魔法防御，持续8秒",
    id = 110
    };
getRow(111008,6)->
    #player_skills_upgradingCfg {
    skillID = 111008,
    level = 6,
    player_level = 28,
    currency = [{1,30000}],
    skillcoin_cost = 1,
    item = [],
    describe = "抓取目标，使目标攻击自己，并降低目标20%物理防御和20%魔法防御，持续8秒",
    id = 111
    };
getRow(111008,7)->
    #player_skills_upgradingCfg {
    skillID = 111008,
    level = 7,
    player_level = 31,
    currency = [{1,35000}],
    skillcoin_cost = 1,
    item = [],
    describe = "抓取目标，使目标攻击自己，并降低目标21%物理防御和21%魔法防御，持续8秒",
    id = 112
    };
getRow(111008,8)->
    #player_skills_upgradingCfg {
    skillID = 111008,
    level = 8,
    player_level = 34,
    currency = [{1,40000}],
    skillcoin_cost = 1,
    item = [],
    describe = "抓取目标，使目标攻击自己，并降低目标22%物理防御和22%魔法防御，持续8秒",
    id = 113
    };
getRow(111008,9)->
    #player_skills_upgradingCfg {
    skillID = 111008,
    level = 9,
    player_level = 37,
    currency = [{1,45000}],
    skillcoin_cost = 1,
    item = [],
    describe = "抓取目标，使目标攻击自己，并降低目标23%物理防御和23%魔法防御，持续8秒",
    id = 114
    };
getRow(111008,10)->
    #player_skills_upgradingCfg {
    skillID = 111008,
    level = 10,
    player_level = 40,
    currency = [{1,50000}],
    skillcoin_cost = 1,
    item = [],
    describe = "抓取目标，使目标攻击自己，并降低目标24%物理防御和24%魔法防御，持续8秒",
    id = 115
    };
getRow(111008,11)->
    #player_skills_upgradingCfg {
    skillID = 111008,
    level = 11,
    player_level = 43,
    currency = [{1,55000}],
    skillcoin_cost = 1,
    item = [],
    describe = "抓取目标，使目标攻击自己，并降低目标25%物理防御和25%魔法防御，持续8秒",
    id = 116
    };
getRow(111020,1)->
    #player_skills_upgradingCfg {
    skillID = 111020,
    level = 1,
    player_level = 20,
    currency = [],
    skillcoin_cost = 1,
    item = [],
    describe = "使周围全体队友提升8%生命上限，持续10分钟。",
    id = 121
    };
getRow(111020,2)->
    #player_skills_upgradingCfg {
    skillID = 111020,
    level = 2,
    player_level = 20,
    currency = [{1,10000}],
    skillcoin_cost = 1,
    item = [],
    describe = "使周围全体队友提升8.9%生命上限，持续10分钟。",
    id = 122
    };
getRow(111020,3)->
    #player_skills_upgradingCfg {
    skillID = 111020,
    level = 3,
    player_level = 20,
    currency = [{1,15000}],
    skillcoin_cost = 1,
    item = [],
    describe = "使周围全体队友提升9.8%生命上限，持续10分钟。",
    id = 123
    };
getRow(111020,4)->
    #player_skills_upgradingCfg {
    skillID = 111020,
    level = 4,
    player_level = 22,
    currency = [{1,20000}],
    skillcoin_cost = 1,
    item = [],
    describe = "使周围全体队友提升10.7%生命上限，持续10分钟。",
    id = 124
    };
getRow(111020,5)->
    #player_skills_upgradingCfg {
    skillID = 111020,
    level = 5,
    player_level = 25,
    currency = [{1,25000}],
    skillcoin_cost = 1,
    item = [],
    describe = "使周围全体队友提升11.6%生命上限，持续10分钟。",
    id = 125
    };
getRow(111020,6)->
    #player_skills_upgradingCfg {
    skillID = 111020,
    level = 6,
    player_level = 28,
    currency = [{1,30000}],
    skillcoin_cost = 1,
    item = [],
    describe = "使周围全体队友提升12.5%生命上限，持续10分钟。",
    id = 126
    };
getRow(111020,7)->
    #player_skills_upgradingCfg {
    skillID = 111020,
    level = 7,
    player_level = 31,
    currency = [{1,35000}],
    skillcoin_cost = 1,
    item = [],
    describe = "使周围全体队友提升13.4%生命上限，持续10分钟。",
    id = 121
    };
getRow(111020,8)->
    #player_skills_upgradingCfg {
    skillID = 111020,
    level = 8,
    player_level = 34,
    currency = [{1,40000}],
    skillcoin_cost = 1,
    item = [],
    describe = "使周围全体队友提升14.3%生命上限，持续10分钟。",
    id = 122
    };
getRow(111020,9)->
    #player_skills_upgradingCfg {
    skillID = 111020,
    level = 9,
    player_level = 37,
    currency = [{1,45000}],
    skillcoin_cost = 1,
    item = [],
    describe = "使周围全体队友提升15.2%生命上限，持续10分钟。",
    id = 123
    };
getRow(111020,10)->
    #player_skills_upgradingCfg {
    skillID = 111020,
    level = 10,
    player_level = 40,
    currency = [{1,50000}],
    skillcoin_cost = 1,
    item = [],
    describe = "使周围全体队友提升16.1%生命上限，持续10分钟。",
    id = 124
    };
getRow(111020,11)->
    #player_skills_upgradingCfg {
    skillID = 111020,
    level = 11,
    player_level = 43,
    currency = [{1,55000}],
    skillcoin_cost = 1,
    item = [],
    describe = "使周围全体队友提升17%生命上限，持续10分钟。",
    id = 125
    };
getRow(112000,1)->
    #player_skills_upgradingCfg {
    skillID = 112000,
    level = 1,
    player_level = 20,
    currency = [],
    skillcoin_cost = 0,
    item = [],
    describe = "普通攻击80%攻击的",
    id = 136
    };
getRow(112001,1)->
    #player_skills_upgradingCfg {
    skillID = 112001,
    level = 1,
    player_level = 20,
    currency = [],
    skillcoin_cost = 0,
    item = [],
    describe = "普通攻击80%攻击的",
    id = 137
    };
getRow(112002,1)->
    #player_skills_upgradingCfg {
    skillID = 112002,
    level = 1,
    player_level = 20,
    currency = [],
    skillcoin_cost = 0,
    item = [],
    describe = "普通攻击90%攻击的",
    id = 138
    };
getRow(112003,1)->
    #player_skills_upgradingCfg {
    skillID = 112003,
    level = 1,
    player_level = 20,
    currency = [],
    skillcoin_cost = 0,
    item = [],
    describe = "以身化剑，向前突刺10米，攻击前方敌人，造成4次攻击，每次造成80%物理攻击的伤害。",
    id = 139
    };
getRow(112003,2)->
    #player_skills_upgradingCfg {
    skillID = 112003,
    level = 2,
    player_level = 20,
    currency = [{1,10000}],
    skillcoin_cost = 1,
    item = [],
    describe = "以身化剑，向前突刺10米，攻击前方敌人，造成4次攻击，每次造成84%物理攻击的伤害。",
    id = 140
    };
getRow(112003,3)->
    #player_skills_upgradingCfg {
    skillID = 112003,
    level = 3,
    player_level = 20,
    currency = [{1,15000}],
    skillcoin_cost = 1,
    item = [],
    describe = "以身化剑，向前突刺10米，攻击前方敌人，造成4次攻击，每次造成88%物理攻击的伤害。",
    id = 141
    };
getRow(112003,4)->
    #player_skills_upgradingCfg {
    skillID = 112003,
    level = 4,
    player_level = 22,
    currency = [{1,20000}],
    skillcoin_cost = 1,
    item = [],
    describe = "以身化剑，向前突刺10米，攻击前方敌人，造成4次攻击，每次造成92%物理攻击的伤害。",
    id = 142
    };
getRow(112003,5)->
    #player_skills_upgradingCfg {
    skillID = 112003,
    level = 5,
    player_level = 25,
    currency = [{1,25000}],
    skillcoin_cost = 1,
    item = [],
    describe = "以身化剑，向前突刺10米，攻击前方敌人，造成4次攻击，每次造成96%物理攻击的伤害。",
    id = 143
    };
getRow(112003,6)->
    #player_skills_upgradingCfg {
    skillID = 112003,
    level = 6,
    player_level = 28,
    currency = [{1,30000}],
    skillcoin_cost = 1,
    item = [],
    describe = "以身化剑，向前突刺10米，攻击前方敌人，造成4次攻击，每次造成100%物理攻击的伤害。",
    id = 144
    };
getRow(112003,7)->
    #player_skills_upgradingCfg {
    skillID = 112003,
    level = 7,
    player_level = 31,
    currency = [{1,35000}],
    skillcoin_cost = 1,
    item = [],
    describe = "以身化剑，向前突刺10米，攻击前方敌人，造成4次攻击，每次造成104%物理攻击的伤害。",
    id = 145
    };
getRow(112003,8)->
    #player_skills_upgradingCfg {
    skillID = 112003,
    level = 8,
    player_level = 34,
    currency = [{1,40000}],
    skillcoin_cost = 1,
    item = [],
    describe = "以身化剑，向前突刺10米，攻击前方敌人，造成4次攻击，每次造成108%物理攻击的伤害。",
    id = 146
    };
getRow(112003,9)->
    #player_skills_upgradingCfg {
    skillID = 112003,
    level = 9,
    player_level = 37,
    currency = [{1,45000}],
    skillcoin_cost = 1,
    item = [],
    describe = "以身化剑，向前突刺10米，攻击前方敌人，造成4次攻击，每次造成112%物理攻击的伤害。",
    id = 147
    };
getRow(112003,10)->
    #player_skills_upgradingCfg {
    skillID = 112003,
    level = 10,
    player_level = 40,
    currency = [{1,50000}],
    skillcoin_cost = 1,
    item = [],
    describe = "以身化剑，向前突刺10米，攻击前方敌人，造成4次攻击，每次造成116%物理攻击的伤害。",
    id = 148
    };
getRow(112003,11)->
    #player_skills_upgradingCfg {
    skillID = 112003,
    level = 11,
    player_level = 43,
    currency = [{1,55000}],
    skillcoin_cost = 1,
    item = [],
    describe = "以身化剑，向前突刺10米，攻击前方敌人，造成4次攻击，每次造成120%物理攻击的伤害。",
    id = 149
    };
getRow(112003,12)->
    #player_skills_upgradingCfg {
    skillID = 112003,
    level = 12,
    player_level = 46,
    currency = [{1,60000}],
    skillcoin_cost = 1,
    item = [],
    describe = "以身化剑，向前突刺10米，攻击前方敌人，造成4次攻击，每次造成124%物理攻击的伤害。",
    id = 150
    };
getRow(112003,13)->
    #player_skills_upgradingCfg {
    skillID = 112003,
    level = 13,
    player_level = 49,
    currency = [{1,65000}],
    skillcoin_cost = 1,
    item = [],
    describe = "以身化剑，向前突刺10米，攻击前方敌人，造成4次攻击，每次造成128%物理攻击的伤害。",
    id = 151
    };
getRow(112003,14)->
    #player_skills_upgradingCfg {
    skillID = 112003,
    level = 14,
    player_level = 52,
    currency = [{1,70000}],
    skillcoin_cost = 1,
    item = [],
    describe = "以身化剑，向前突刺10米，攻击前方敌人，造成4次攻击，每次造成132%物理攻击的伤害。",
    id = 152
    };
getRow(112003,15)->
    #player_skills_upgradingCfg {
    skillID = 112003,
    level = 15,
    player_level = 55,
    currency = [{1,75000}],
    skillcoin_cost = 1,
    item = [],
    describe = "以身化剑，向前突刺10米，攻击前方敌人，造成4次攻击，每次造成136%物理攻击的伤害。",
    id = 153
    };
getRow(112004,1)->
    #player_skills_upgradingCfg {
    skillID = 112004,
    level = 1,
    player_level = 20,
    currency = [],
    skillcoin_cost = 1,
    item = [],
    describe = "用最大力量砍向前方敌人，给予敌人270%物理攻击的伤害，并震退目标。",
    id = 154
    };
getRow(112004,2)->
    #player_skills_upgradingCfg {
    skillID = 112004,
    level = 2,
    player_level = 20,
    currency = [{1,10000}],
    skillcoin_cost = 1,
    item = [],
    describe = "用最大力量砍向前方敌人，给予敌人282%物理攻击的伤害，并震退目标。",
    id = 155
    };
getRow(112004,3)->
    #player_skills_upgradingCfg {
    skillID = 112004,
    level = 3,
    player_level = 20,
    currency = [{1,15000}],
    skillcoin_cost = 1,
    item = [],
    describe = "用最大力量砍向前方敌人，给予敌人294%物理攻击的伤害，并震退目标。",
    id = 156
    };
getRow(112004,4)->
    #player_skills_upgradingCfg {
    skillID = 112004,
    level = 4,
    player_level = 22,
    currency = [{1,20000}],
    skillcoin_cost = 1,
    item = [],
    describe = "用最大力量砍向前方敌人，给予敌人306%物理攻击的伤害，并震退目标。",
    id = 157
    };
getRow(112004,5)->
    #player_skills_upgradingCfg {
    skillID = 112004,
    level = 5,
    player_level = 25,
    currency = [{1,25000}],
    skillcoin_cost = 1,
    item = [],
    describe = "用最大力量砍向前方敌人，给予敌人318%物理攻击的伤害，并震退目标。",
    id = 158
    };
getRow(112004,6)->
    #player_skills_upgradingCfg {
    skillID = 112004,
    level = 6,
    player_level = 28,
    currency = [{1,30000}],
    skillcoin_cost = 1,
    item = [],
    describe = "用最大力量砍向前方敌人，给予敌人330%物理攻击的伤害，并震退目标。",
    id = 159
    };
getRow(112004,7)->
    #player_skills_upgradingCfg {
    skillID = 112004,
    level = 7,
    player_level = 31,
    currency = [{1,35000}],
    skillcoin_cost = 1,
    item = [],
    describe = "用最大力量砍向前方敌人，给予敌人342%物理攻击的伤害，并震退目标。",
    id = 160
    };
getRow(112004,8)->
    #player_skills_upgradingCfg {
    skillID = 112004,
    level = 8,
    player_level = 34,
    currency = [{1,40000}],
    skillcoin_cost = 1,
    item = [],
    describe = "用最大力量砍向前方敌人，给予敌人354%物理攻击的伤害，并震退目标。",
    id = 161
    };
getRow(112004,9)->
    #player_skills_upgradingCfg {
    skillID = 112004,
    level = 9,
    player_level = 37,
    currency = [{1,45000}],
    skillcoin_cost = 1,
    item = [],
    describe = "用最大力量砍向前方敌人，给予敌人366%物理攻击的伤害，并震退目标。",
    id = 162
    };
getRow(112004,10)->
    #player_skills_upgradingCfg {
    skillID = 112004,
    level = 10,
    player_level = 40,
    currency = [{1,50000}],
    skillcoin_cost = 1,
    item = [],
    describe = "用最大力量砍向前方敌人，给予敌人378%物理攻击的伤害，并震退目标。",
    id = 163
    };
getRow(112004,11)->
    #player_skills_upgradingCfg {
    skillID = 112004,
    level = 11,
    player_level = 43,
    currency = [{1,55000}],
    skillcoin_cost = 1,
    item = [],
    describe = "用最大力量砍向前方敌人，给予敌人390%物理攻击的伤害，并震退目标。",
    id = 164
    };
getRow(112004,12)->
    #player_skills_upgradingCfg {
    skillID = 112004,
    level = 12,
    player_level = 46,
    currency = [{1,60000}],
    skillcoin_cost = 1,
    item = [],
    describe = "用最大力量砍向前方敌人，给予敌人402%物理攻击的伤害，并震退目标。",
    id = 165
    };
getRow(112004,13)->
    #player_skills_upgradingCfg {
    skillID = 112004,
    level = 13,
    player_level = 49,
    currency = [{1,65000}],
    skillcoin_cost = 1,
    item = [],
    describe = "用最大力量砍向前方敌人，给予敌人414%物理攻击的伤害，并震退目标。",
    id = 166
    };
getRow(112004,14)->
    #player_skills_upgradingCfg {
    skillID = 112004,
    level = 14,
    player_level = 52,
    currency = [{1,70000}],
    skillcoin_cost = 1,
    item = [],
    describe = "用最大力量砍向前方敌人，给予敌人426%物理攻击的伤害，并震退目标。",
    id = 167
    };
getRow(112004,15)->
    #player_skills_upgradingCfg {
    skillID = 112004,
    level = 15,
    player_level = 55,
    currency = [{1,75000}],
    skillcoin_cost = 1,
    item = [],
    describe = "用最大力量砍向前方敌人，给予敌人438%物理攻击的伤害，并震退目标。",
    id = 168
    };
getRow(112005,1)->
    #player_skills_upgradingCfg {
    skillID = 112005,
    level = 1,
    player_level = 20,
    currency = [],
    skillcoin_cost = 1,
    item = [],
    describe = "用身体带动重剑进行回旋天舞，造成9次攻击，每次造成41%物理攻击的伤害。",
    id = 169
    };
getRow(112005,2)->
    #player_skills_upgradingCfg {
    skillID = 112005,
    level = 2,
    player_level = 20,
    currency = [{1,10000}],
    skillcoin_cost = 1,
    item = [],
    describe = "用身体带动重剑进行回旋天舞，造成9次攻击，每次造成43%物理攻击的伤害。",
    id = 170
    };
getRow(112005,3)->
    #player_skills_upgradingCfg {
    skillID = 112005,
    level = 3,
    player_level = 20,
    currency = [{1,15000}],
    skillcoin_cost = 1,
    item = [],
    describe = "用身体带动重剑进行回旋天舞，造成9次攻击，每次造成45%物理攻击的伤害。",
    id = 171
    };
getRow(112005,4)->
    #player_skills_upgradingCfg {
    skillID = 112005,
    level = 4,
    player_level = 22,
    currency = [{1,20000}],
    skillcoin_cost = 1,
    item = [],
    describe = "用身体带动重剑进行回旋天舞，造成9次攻击，每次造成47%物理攻击的伤害。",
    id = 172
    };
getRow(112005,5)->
    #player_skills_upgradingCfg {
    skillID = 112005,
    level = 5,
    player_level = 25,
    currency = [{1,25000}],
    skillcoin_cost = 1,
    item = [],
    describe = "用身体带动重剑进行回旋天舞，造成9次攻击，每次造成49%物理攻击的伤害。",
    id = 173
    };
getRow(112005,6)->
    #player_skills_upgradingCfg {
    skillID = 112005,
    level = 6,
    player_level = 28,
    currency = [{1,30000}],
    skillcoin_cost = 1,
    item = [],
    describe = "用身体带动重剑进行回旋天舞，造成9次攻击，每次造成51%物理攻击的伤害。",
    id = 174
    };
getRow(112005,7)->
    #player_skills_upgradingCfg {
    skillID = 112005,
    level = 7,
    player_level = 31,
    currency = [{1,35000}],
    skillcoin_cost = 1,
    item = [],
    describe = "用身体带动重剑进行回旋天舞，造成9次攻击，每次造成53%物理攻击的伤害。",
    id = 175
    };
getRow(112005,8)->
    #player_skills_upgradingCfg {
    skillID = 112005,
    level = 8,
    player_level = 34,
    currency = [{1,40000}],
    skillcoin_cost = 1,
    item = [],
    describe = "用身体带动重剑进行回旋天舞，造成9次攻击，每次造成55%物理攻击的伤害。",
    id = 176
    };
getRow(112005,9)->
    #player_skills_upgradingCfg {
    skillID = 112005,
    level = 9,
    player_level = 37,
    currency = [{1,45000}],
    skillcoin_cost = 1,
    item = [],
    describe = "用身体带动重剑进行回旋天舞，造成9次攻击，每次造成57%物理攻击的伤害。",
    id = 177
    };
getRow(112005,10)->
    #player_skills_upgradingCfg {
    skillID = 112005,
    level = 10,
    player_level = 40,
    currency = [{1,50000}],
    skillcoin_cost = 1,
    item = [],
    describe = "用身体带动重剑进行回旋天舞，造成9次攻击，每次造成59%物理攻击的伤害。",
    id = 178
    };
getRow(112005,11)->
    #player_skills_upgradingCfg {
    skillID = 112005,
    level = 11,
    player_level = 43,
    currency = [{1,55000}],
    skillcoin_cost = 1,
    item = [],
    describe = "用身体带动重剑进行回旋天舞，造成9次攻击，每次造成61%物理攻击的伤害。",
    id = 179
    };
getRow(112005,12)->
    #player_skills_upgradingCfg {
    skillID = 112005,
    level = 12,
    player_level = 46,
    currency = [{1,60000}],
    skillcoin_cost = 1,
    item = [],
    describe = "用身体带动重剑进行回旋天舞，造成9次攻击，每次造成63%物理攻击的伤害。",
    id = 180
    };
getRow(112005,13)->
    #player_skills_upgradingCfg {
    skillID = 112005,
    level = 13,
    player_level = 49,
    currency = [{1,65000}],
    skillcoin_cost = 1,
    item = [],
    describe = "用身体带动重剑进行回旋天舞，造成9次攻击，每次造成65%物理攻击的伤害。",
    id = 181
    };
getRow(112005,14)->
    #player_skills_upgradingCfg {
    skillID = 112005,
    level = 14,
    player_level = 52,
    currency = [{1,70000}],
    skillcoin_cost = 1,
    item = [],
    describe = "用身体带动重剑进行回旋天舞，造成9次攻击，每次造成67%物理攻击的伤害。",
    id = 182
    };
getRow(112005,15)->
    #player_skills_upgradingCfg {
    skillID = 112005,
    level = 15,
    player_level = 55,
    currency = [{1,75000}],
    skillcoin_cost = 1,
    item = [],
    describe = "用身体带动重剑进行回旋天舞，造成9次攻击，每次造成69%物理攻击的伤害。",
    id = 183
    };
getRow(112006,1)->
    #player_skills_upgradingCfg {
    skillID = 112006,
    level = 1,
    player_level = 20,
    currency = [],
    skillcoin_cost = 1,
    item = [],
    describe = "以局部冲撞目标及周围敌方，对目标造成270%物理攻击的伤害，降低8%物理防御，持续3秒。",
    id = 184
    };
getRow(112006,2)->
    #player_skills_upgradingCfg {
    skillID = 112006,
    level = 2,
    player_level = 20,
    currency = [{1,10000}],
    skillcoin_cost = 1,
    item = [],
    describe = "以局部冲撞目标及周围敌方，对目标造成282%物理攻击的伤害，降低8.5%物理防御，持续3秒。",
    id = 185
    };
getRow(112006,3)->
    #player_skills_upgradingCfg {
    skillID = 112006,
    level = 3,
    player_level = 20,
    currency = [{1,15000}],
    skillcoin_cost = 1,
    item = [],
    describe = "以局部冲撞目标及周围敌方，对目标造成294%物理攻击的伤害，降低9%物理防御，持续3秒。",
    id = 186
    };
getRow(112006,4)->
    #player_skills_upgradingCfg {
    skillID = 112006,
    level = 4,
    player_level = 22,
    currency = [{1,20000}],
    skillcoin_cost = 1,
    item = [],
    describe = "以局部冲撞目标及周围敌方，对目标造成306%物理攻击的伤害，降低9.5%物理防御，持续3秒。",
    id = 187
    };
getRow(112006,5)->
    #player_skills_upgradingCfg {
    skillID = 112006,
    level = 5,
    player_level = 25,
    currency = [{1,25000}],
    skillcoin_cost = 1,
    item = [],
    describe = "以局部冲撞目标及周围敌方，对目标造成318%物理攻击的伤害，降低10%物理防御，持续3秒。",
    id = 188
    };
getRow(112006,6)->
    #player_skills_upgradingCfg {
    skillID = 112006,
    level = 6,
    player_level = 28,
    currency = [{1,30000}],
    skillcoin_cost = 1,
    item = [],
    describe = "以局部冲撞目标及周围敌方，对目标造成330%物理攻击的伤害，降低10.5%物理防御，持续3秒。",
    id = 189
    };
getRow(112006,7)->
    #player_skills_upgradingCfg {
    skillID = 112006,
    level = 7,
    player_level = 31,
    currency = [{1,35000}],
    skillcoin_cost = 1,
    item = [],
    describe = "以局部冲撞目标及周围敌方，对目标造成342%物理攻击的伤害，降低11%物理防御，持续3秒。",
    id = 190
    };
getRow(112006,8)->
    #player_skills_upgradingCfg {
    skillID = 112006,
    level = 8,
    player_level = 34,
    currency = [{1,40000}],
    skillcoin_cost = 1,
    item = [],
    describe = "以局部冲撞目标及周围敌方，对目标造成354%物理攻击的伤害，降低11.5%物理防御，持续3秒。",
    id = 191
    };
getRow(112006,9)->
    #player_skills_upgradingCfg {
    skillID = 112006,
    level = 9,
    player_level = 37,
    currency = [{1,45000}],
    skillcoin_cost = 1,
    item = [],
    describe = "以局部冲撞目标及周围敌方，对目标造成366%物理攻击的伤害，降低12%物理防御，持续3秒。",
    id = 192
    };
getRow(112006,10)->
    #player_skills_upgradingCfg {
    skillID = 112006,
    level = 10,
    player_level = 40,
    currency = [{1,50000}],
    skillcoin_cost = 1,
    item = [],
    describe = "以局部冲撞目标及周围敌方，对目标造成378%物理攻击的伤害，降低12.5%物理防御，持续3秒。",
    id = 193
    };
getRow(112006,11)->
    #player_skills_upgradingCfg {
    skillID = 112006,
    level = 11,
    player_level = 43,
    currency = [{1,55000}],
    skillcoin_cost = 1,
    item = [],
    describe = "以局部冲撞目标及周围敌方，对目标造成390%物理攻击的伤害，降低13%物理防御，持续3秒。",
    id = 194
    };
getRow(112006,12)->
    #player_skills_upgradingCfg {
    skillID = 112006,
    level = 12,
    player_level = 46,
    currency = [{1,60000}],
    skillcoin_cost = 1,
    item = [],
    describe = "以局部冲撞目标及周围敌方，对目标造成402%物理攻击的伤害，降低13.5%物理防御，持续3秒。",
    id = 195
    };
getRow(112006,13)->
    #player_skills_upgradingCfg {
    skillID = 112006,
    level = 13,
    player_level = 49,
    currency = [{1,65000}],
    skillcoin_cost = 1,
    item = [],
    describe = "以局部冲撞目标及周围敌方，对目标造成414%物理攻击的伤害，降低14%物理防御，持续3秒。",
    id = 196
    };
getRow(112006,14)->
    #player_skills_upgradingCfg {
    skillID = 112006,
    level = 14,
    player_level = 52,
    currency = [{1,70000}],
    skillcoin_cost = 1,
    item = [],
    describe = "以局部冲撞目标及周围敌方，对目标造成426%物理攻击的伤害，降低14.5%物理防御，持续3秒。",
    id = 197
    };
getRow(112006,15)->
    #player_skills_upgradingCfg {
    skillID = 112006,
    level = 15,
    player_level = 55,
    currency = [{1,75000}],
    skillcoin_cost = 1,
    item = [],
    describe = "以局部冲撞目标及周围敌方，对目标造成438%物理攻击的伤害，降低15%物理防御，持续3秒。",
    id = 198
    };
getRow(112007,1)->
    #player_skills_upgradingCfg {
    skillID = 112007,
    level = 1,
    player_level = 20,
    currency = [],
    skillcoin_cost = 1,
    item = [],
    describe = "提升自身10%物理攻击，持续10秒",
    id = 214
    };
getRow(112007,2)->
    #player_skills_upgradingCfg {
    skillID = 112007,
    level = 2,
    player_level = 20,
    currency = [{1,10000}],
    skillcoin_cost = 1,
    item = [],
    describe = "提升自身11%物理攻击，持续10秒",
    id = 215
    };
getRow(112007,3)->
    #player_skills_upgradingCfg {
    skillID = 112007,
    level = 3,
    player_level = 20,
    currency = [{1,15000}],
    skillcoin_cost = 1,
    item = [],
    describe = "提升自身12%物理攻击，持续10秒",
    id = 216
    };
getRow(112007,4)->
    #player_skills_upgradingCfg {
    skillID = 112007,
    level = 4,
    player_level = 22,
    currency = [{1,20000}],
    skillcoin_cost = 1,
    item = [],
    describe = "提升自身13%物理攻击，持续10秒",
    id = 217
    };
getRow(112007,5)->
    #player_skills_upgradingCfg {
    skillID = 112007,
    level = 5,
    player_level = 25,
    currency = [{1,25000}],
    skillcoin_cost = 1,
    item = [],
    describe = "提升自身14%物理攻击，持续10秒",
    id = 218
    };
getRow(112007,6)->
    #player_skills_upgradingCfg {
    skillID = 112007,
    level = 6,
    player_level = 28,
    currency = [{1,30000}],
    skillcoin_cost = 1,
    item = [],
    describe = "提升自身15%物理攻击，持续10秒",
    id = 214
    };
getRow(112007,7)->
    #player_skills_upgradingCfg {
    skillID = 112007,
    level = 7,
    player_level = 31,
    currency = [{1,35000}],
    skillcoin_cost = 1,
    item = [],
    describe = "提升自身16%物理攻击，持续10秒",
    id = 215
    };
getRow(112007,8)->
    #player_skills_upgradingCfg {
    skillID = 112007,
    level = 8,
    player_level = 34,
    currency = [{1,40000}],
    skillcoin_cost = 1,
    item = [],
    describe = "提升自身17%物理攻击，持续10秒",
    id = 216
    };
getRow(112007,9)->
    #player_skills_upgradingCfg {
    skillID = 112007,
    level = 9,
    player_level = 37,
    currency = [{1,45000}],
    skillcoin_cost = 1,
    item = [],
    describe = "提升自身18%物理攻击，持续10秒",
    id = 217
    };
getRow(112007,10)->
    #player_skills_upgradingCfg {
    skillID = 112007,
    level = 10,
    player_level = 40,
    currency = [{1,50000}],
    skillcoin_cost = 1,
    item = [],
    describe = "提升自身19%物理攻击，持续10秒",
    id = 218
    };
getRow(112007,11)->
    #player_skills_upgradingCfg {
    skillID = 112007,
    level = 11,
    player_level = 43,
    currency = [{1,55000}],
    skillcoin_cost = 1,
    item = [],
    describe = "提升自身20%物理攻击，持续10秒",
    id = 219
    };
getRow(112008,1)->
    #player_skills_upgradingCfg {
    skillID = 112008,
    level = 1,
    player_level = 20,
    currency = [],
    skillcoin_cost = 1,
    item = [],
    describe = "使周围全体队友提升4%攻击，持续10分钟",
    id = 229
    };
getRow(112008,2)->
    #player_skills_upgradingCfg {
    skillID = 112008,
    level = 2,
    player_level = 20,
    currency = [{1,10000}],
    skillcoin_cost = 1,
    item = [],
    describe = "使周围全体队友提升4.4%攻击，持续10分钟",
    id = 230
    };
getRow(112008,3)->
    #player_skills_upgradingCfg {
    skillID = 112008,
    level = 3,
    player_level = 20,
    currency = [{1,15000}],
    skillcoin_cost = 1,
    item = [],
    describe = "使周围全体队友提升4.8%攻击，持续10分钟",
    id = 231
    };
getRow(112008,4)->
    #player_skills_upgradingCfg {
    skillID = 112008,
    level = 4,
    player_level = 22,
    currency = [{1,20000}],
    skillcoin_cost = 1,
    item = [],
    describe = "使周围全体队友提升5.2%攻击，持续10分钟",
    id = 232
    };
getRow(112008,5)->
    #player_skills_upgradingCfg {
    skillID = 112008,
    level = 5,
    player_level = 25,
    currency = [{1,25000}],
    skillcoin_cost = 1,
    item = [],
    describe = "使周围全体队友提升5.6%攻击，持续10分钟",
    id = 233
    };
getRow(112008,6)->
    #player_skills_upgradingCfg {
    skillID = 112008,
    level = 6,
    player_level = 28,
    currency = [{1,30000}],
    skillcoin_cost = 1,
    item = [],
    describe = "使周围全体队友提升6%攻击，持续10分钟",
    id = 229
    };
getRow(112008,7)->
    #player_skills_upgradingCfg {
    skillID = 112008,
    level = 7,
    player_level = 31,
    currency = [{1,35000}],
    skillcoin_cost = 1,
    item = [],
    describe = "使周围全体队友提升6.4%攻击，持续10分钟",
    id = 230
    };
getRow(112008,8)->
    #player_skills_upgradingCfg {
    skillID = 112008,
    level = 8,
    player_level = 34,
    currency = [{1,40000}],
    skillcoin_cost = 1,
    item = [],
    describe = "使周围全体队友提升6.8%攻击，持续10分钟",
    id = 231
    };
getRow(112008,9)->
    #player_skills_upgradingCfg {
    skillID = 112008,
    level = 9,
    player_level = 37,
    currency = [{1,45000}],
    skillcoin_cost = 1,
    item = [],
    describe = "使周围全体队友提升7.2%攻击，持续10分钟",
    id = 232
    };
getRow(112008,10)->
    #player_skills_upgradingCfg {
    skillID = 112008,
    level = 10,
    player_level = 40,
    currency = [{1,50000}],
    skillcoin_cost = 1,
    item = [],
    describe = "使周围全体队友提升7.6%攻击，持续10分钟",
    id = 233
    };
getRow(112008,11)->
    #player_skills_upgradingCfg {
    skillID = 112008,
    level = 11,
    player_level = 43,
    currency = [{1,55000}],
    skillcoin_cost = 1,
    item = [],
    describe = "使周围全体队友提升8%攻击，持续10分钟",
    id = 234
    };
getRow(112020,1)->
    #player_skills_upgradingCfg {
    skillID = 112020,
    level = 1,
    player_level = 20,
    currency = [],
    skillcoin_cost = 1,
    item = [],
    describe = "一次狂暴的打击，造成135%物理攻击的伤害，并恢复15%伤害量的生命值。",
    id = 199
    };
getRow(112020,2)->
    #player_skills_upgradingCfg {
    skillID = 112020,
    level = 2,
    player_level = 20,
    currency = [{1,10000}],
    skillcoin_cost = 1,
    item = [],
    describe = "一次狂暴的打击，造成141%物理攻击的伤害，并恢复15%伤害量的生命值。",
    id = 200
    };
getRow(112020,3)->
    #player_skills_upgradingCfg {
    skillID = 112020,
    level = 3,
    player_level = 20,
    currency = [{1,15000}],
    skillcoin_cost = 1,
    item = [],
    describe = "一次狂暴的打击，造成147%物理攻击的伤害，并恢复15%伤害量的生命值。",
    id = 201
    };
getRow(112020,4)->
    #player_skills_upgradingCfg {
    skillID = 112020,
    level = 4,
    player_level = 22,
    currency = [{1,20000}],
    skillcoin_cost = 1,
    item = [],
    describe = "一次狂暴的打击，造成153%物理攻击的伤害，并恢复15%伤害量的生命值。",
    id = 202
    };
getRow(112020,5)->
    #player_skills_upgradingCfg {
    skillID = 112020,
    level = 5,
    player_level = 25,
    currency = [{1,25000}],
    skillcoin_cost = 1,
    item = [],
    describe = "一次狂暴的打击，造成159%物理攻击的伤害，并恢复15%伤害量的生命值。",
    id = 203
    };
getRow(112020,6)->
    #player_skills_upgradingCfg {
    skillID = 112020,
    level = 6,
    player_level = 28,
    currency = [{1,30000}],
    skillcoin_cost = 1,
    item = [],
    describe = "一次狂暴的打击，造成165%物理攻击的伤害，并恢复15%伤害量的生命值。",
    id = 204
    };
getRow(112020,7)->
    #player_skills_upgradingCfg {
    skillID = 112020,
    level = 7,
    player_level = 31,
    currency = [{1,35000}],
    skillcoin_cost = 1,
    item = [],
    describe = "一次狂暴的打击，造成171%物理攻击的伤害，并恢复15%伤害量的生命值。",
    id = 205
    };
getRow(112020,8)->
    #player_skills_upgradingCfg {
    skillID = 112020,
    level = 8,
    player_level = 34,
    currency = [{1,40000}],
    skillcoin_cost = 1,
    item = [],
    describe = "一次狂暴的打击，造成177%物理攻击的伤害，并恢复15%伤害量的生命值。",
    id = 206
    };
getRow(112020,9)->
    #player_skills_upgradingCfg {
    skillID = 112020,
    level = 9,
    player_level = 37,
    currency = [{1,45000}],
    skillcoin_cost = 1,
    item = [],
    describe = "一次狂暴的打击，造成183%物理攻击的伤害，并恢复15%伤害量的生命值。",
    id = 207
    };
getRow(112020,10)->
    #player_skills_upgradingCfg {
    skillID = 112020,
    level = 10,
    player_level = 40,
    currency = [{1,50000}],
    skillcoin_cost = 1,
    item = [],
    describe = "一次狂暴的打击，造成189%物理攻击的伤害，并恢复15%伤害量的生命值。",
    id = 208
    };
getRow(112020,11)->
    #player_skills_upgradingCfg {
    skillID = 112020,
    level = 11,
    player_level = 43,
    currency = [{1,55000}],
    skillcoin_cost = 1,
    item = [],
    describe = "一次狂暴的打击，造成195%物理攻击的伤害，并恢复15%伤害量的生命值。",
    id = 209
    };
getRow(112020,12)->
    #player_skills_upgradingCfg {
    skillID = 112020,
    level = 12,
    player_level = 46,
    currency = [{1,60000}],
    skillcoin_cost = 1,
    item = [],
    describe = "一次狂暴的打击，造成201%物理攻击的伤害，并恢复15%伤害量的生命值。",
    id = 210
    };
getRow(112020,13)->
    #player_skills_upgradingCfg {
    skillID = 112020,
    level = 13,
    player_level = 49,
    currency = [{1,65000}],
    skillcoin_cost = 1,
    item = [],
    describe = "一次狂暴的打击，造成207%物理攻击的伤害，并恢复15%伤害量的生命值。",
    id = 211
    };
getRow(112020,14)->
    #player_skills_upgradingCfg {
    skillID = 112020,
    level = 14,
    player_level = 52,
    currency = [{1,70000}],
    skillcoin_cost = 1,
    item = [],
    describe = "一次狂暴的打击，造成213%物理攻击的伤害，并恢复15%伤害量的生命值。",
    id = 212
    };
getRow(112020,15)->
    #player_skills_upgradingCfg {
    skillID = 112020,
    level = 15,
    player_level = 55,
    currency = [{1,75000}],
    skillcoin_cost = 1,
    item = [],
    describe = "一次狂暴的打击，造成219%物理攻击的伤害，并恢复15%伤害量的生命值。",
    id = 213
    };
getRow(121004,1)->
    #player_skills_upgradingCfg {
    skillID = 121004,
    level = 1,
    player_level = 60,
    currency = [],
    skillcoin_cost = 1,
    item = [],
    describe = "对前方扇形敌人造成2次200%物理攻击的伤害。",
    id = 0
    };
getRow(121004,2)->
    #player_skills_upgradingCfg {
    skillID = 121004,
    level = 2,
    player_level = 60,
    currency = [],
    skillcoin_cost = 1,
    item = [],
    describe = "对前方扇形敌人造成2次209%物理攻击的伤害。",
    id = 0
    };
getRow(121004,3)->
    #player_skills_upgradingCfg {
    skillID = 121004,
    level = 3,
    player_level = 60,
    currency = [{1,70000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对前方扇形敌人造成2次218%物理攻击的伤害。",
    id = 0
    };
getRow(121004,4)->
    #player_skills_upgradingCfg {
    skillID = 121004,
    level = 4,
    player_level = 60,
    currency = [{1,90000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对前方扇形敌人造成2次227%物理攻击的伤害。",
    id = 0
    };
getRow(121004,5)->
    #player_skills_upgradingCfg {
    skillID = 121004,
    level = 5,
    player_level = 60,
    currency = [{1,110000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对前方扇形敌人造成2次236%物理攻击的伤害。",
    id = 0
    };
getRow(121004,6)->
    #player_skills_upgradingCfg {
    skillID = 121004,
    level = 6,
    player_level = 60,
    currency = [{1,130000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对前方扇形敌人造成2次245%物理攻击的伤害。",
    id = 0
    };
getRow(121004,7)->
    #player_skills_upgradingCfg {
    skillID = 121004,
    level = 7,
    player_level = 60,
    currency = [{1,150000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对前方扇形敌人造成2次254%物理攻击的伤害。",
    id = 0
    };
getRow(121004,8)->
    #player_skills_upgradingCfg {
    skillID = 121004,
    level = 8,
    player_level = 60,
    currency = [{1,170000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对前方扇形敌人造成2次263%物理攻击的伤害。",
    id = 0
    };
getRow(121004,9)->
    #player_skills_upgradingCfg {
    skillID = 121004,
    level = 9,
    player_level = 62,
    currency = [{1,190000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对前方扇形敌人造成2次272%物理攻击的伤害。",
    id = 0
    };
getRow(121004,10)->
    #player_skills_upgradingCfg {
    skillID = 121004,
    level = 10,
    player_level = 64,
    currency = [{1,210000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对前方扇形敌人造成2次281%物理攻击的伤害。",
    id = 0
    };
getRow(121004,11)->
    #player_skills_upgradingCfg {
    skillID = 121004,
    level = 11,
    player_level = 66,
    currency = [{1,230000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对前方扇形敌人造成2次290%物理攻击的伤害。",
    id = 0
    };
getRow(121004,12)->
    #player_skills_upgradingCfg {
    skillID = 121004,
    level = 12,
    player_level = 68,
    currency = [{1,250000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对前方扇形敌人造成2次299%物理攻击的伤害。",
    id = 0
    };
getRow(121004,13)->
    #player_skills_upgradingCfg {
    skillID = 121004,
    level = 13,
    player_level = 70,
    currency = [{1,270000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对前方扇形敌人造成2次308%物理攻击的伤害。",
    id = 0
    };
getRow(121004,14)->
    #player_skills_upgradingCfg {
    skillID = 121004,
    level = 14,
    player_level = 72,
    currency = [{1,290000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对前方扇形敌人造成2次317%物理攻击的伤害。",
    id = 0
    };
getRow(121004,15)->
    #player_skills_upgradingCfg {
    skillID = 121004,
    level = 15,
    player_level = 74,
    currency = [{1,310000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对前方扇形敌人造成2次326%物理攻击的伤害。",
    id = 0
    };
getRow(121004,16)->
    #player_skills_upgradingCfg {
    skillID = 121004,
    level = 16,
    player_level = 76,
    currency = [{1,330000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对前方扇形敌人造成2次335%物理攻击的伤害。",
    id = 0
    };
getRow(121004,17)->
    #player_skills_upgradingCfg {
    skillID = 121004,
    level = 17,
    player_level = 78,
    currency = [{1,350000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对前方扇形敌人造成2次344%物理攻击的伤害。",
    id = 0
    };
getRow(121004,18)->
    #player_skills_upgradingCfg {
    skillID = 121004,
    level = 18,
    player_level = 80,
    currency = [{1,370000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对前方扇形敌人造成2次353%物理攻击的伤害。",
    id = 0
    };
getRow(121004,19)->
    #player_skills_upgradingCfg {
    skillID = 121004,
    level = 19,
    player_level = 82,
    currency = [{1,390000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对前方扇形敌人造成2次362%物理攻击的伤害。",
    id = 0
    };
getRow(121004,20)->
    #player_skills_upgradingCfg {
    skillID = 121004,
    level = 20,
    player_level = 84,
    currency = [{1,410000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对前方扇形敌人造成2次371%物理攻击的伤害。",
    id = 0
    };
getRow(121004,21)->
    #player_skills_upgradingCfg {
    skillID = 121004,
    level = 21,
    player_level = 86,
    currency = [{1,430000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对前方扇形敌人造成2次380%物理攻击的伤害。",
    id = 0
    };
getRow(121004,22)->
    #player_skills_upgradingCfg {
    skillID = 121004,
    level = 22,
    player_level = 88,
    currency = [{1,450000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对前方扇形敌人造成2次389%物理攻击的伤害。",
    id = 0
    };
getRow(121004,23)->
    #player_skills_upgradingCfg {
    skillID = 121004,
    level = 23,
    player_level = 90,
    currency = [{1,470000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对前方扇形敌人造成2次398%物理攻击的伤害。",
    id = 0
    };
getRow(121004,24)->
    #player_skills_upgradingCfg {
    skillID = 121004,
    level = 24,
    player_level = 92,
    currency = [{1,490000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对前方扇形敌人造成2次407%物理攻击的伤害。",
    id = 0
    };
getRow(121004,25)->
    #player_skills_upgradingCfg {
    skillID = 121004,
    level = 25,
    player_level = 94,
    currency = [{1,510000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对前方扇形敌人造成2次416%物理攻击的伤害。",
    id = 0
    };
getRow(121005,1)->
    #player_skills_upgradingCfg {
    skillID = 121005,
    level = 1,
    player_level = 60,
    currency = [],
    skillcoin_cost = 1,
    item = [],
    describe = "向前快速移动20米，用强力突刺攻击敌人，造成240%物理攻击的伤害，并造成3秒流血和1秒眩晕",
    id = 0
    };
getRow(121005,2)->
    #player_skills_upgradingCfg {
    skillID = 121005,
    level = 2,
    player_level = 60,
    currency = [],
    skillcoin_cost = 1,
    item = [],
    describe = "向前快速移动20米，用强力突刺攻击敌人，造成252%物理攻击的伤害，并造成3秒流血和1秒眩晕",
    id = 0
    };
getRow(121005,3)->
    #player_skills_upgradingCfg {
    skillID = 121005,
    level = 3,
    player_level = 60,
    currency = [{1,70000}],
    skillcoin_cost = 1,
    item = [],
    describe = "向前快速移动20米，用强力突刺攻击敌人，造成264%物理攻击的伤害，并造成3秒流血和1秒眩晕",
    id = 0
    };
getRow(121005,4)->
    #player_skills_upgradingCfg {
    skillID = 121005,
    level = 4,
    player_level = 60,
    currency = [{1,90000}],
    skillcoin_cost = 1,
    item = [],
    describe = "向前快速移动20米，用强力突刺攻击敌人，造成276%物理攻击的伤害，并造成3秒流血和1秒眩晕",
    id = 0
    };
getRow(121005,5)->
    #player_skills_upgradingCfg {
    skillID = 121005,
    level = 5,
    player_level = 60,
    currency = [{1,110000}],
    skillcoin_cost = 1,
    item = [],
    describe = "向前快速移动20米，用强力突刺攻击敌人，造成288%物理攻击的伤害，并造成3秒流血和1秒眩晕",
    id = 0
    };
getRow(121005,6)->
    #player_skills_upgradingCfg {
    skillID = 121005,
    level = 6,
    player_level = 60,
    currency = [{1,130000}],
    skillcoin_cost = 1,
    item = [],
    describe = "向前快速移动20米，用强力突刺攻击敌人，造成300%物理攻击的伤害，并造成3秒流血和1秒眩晕",
    id = 0
    };
getRow(121005,7)->
    #player_skills_upgradingCfg {
    skillID = 121005,
    level = 7,
    player_level = 60,
    currency = [{1,150000}],
    skillcoin_cost = 1,
    item = [],
    describe = "向前快速移动20米，用强力突刺攻击敌人，造成312%物理攻击的伤害，并造成3秒流血和1秒眩晕",
    id = 0
    };
getRow(121005,8)->
    #player_skills_upgradingCfg {
    skillID = 121005,
    level = 8,
    player_level = 60,
    currency = [{1,170000}],
    skillcoin_cost = 1,
    item = [],
    describe = "向前快速移动20米，用强力突刺攻击敌人，造成324%物理攻击的伤害，并造成3秒流血和1秒眩晕",
    id = 0
    };
getRow(121005,9)->
    #player_skills_upgradingCfg {
    skillID = 121005,
    level = 9,
    player_level = 62,
    currency = [{1,190000}],
    skillcoin_cost = 1,
    item = [],
    describe = "向前快速移动20米，用强力突刺攻击敌人，造成336%物理攻击的伤害，并造成3秒流血和1秒眩晕",
    id = 0
    };
getRow(121005,10)->
    #player_skills_upgradingCfg {
    skillID = 121005,
    level = 10,
    player_level = 64,
    currency = [{1,210000}],
    skillcoin_cost = 1,
    item = [],
    describe = "向前快速移动20米，用强力突刺攻击敌人，造成348%物理攻击的伤害，并造成3秒流血和1秒眩晕",
    id = 0
    };
getRow(121005,11)->
    #player_skills_upgradingCfg {
    skillID = 121005,
    level = 11,
    player_level = 66,
    currency = [{1,230000}],
    skillcoin_cost = 1,
    item = [],
    describe = "向前快速移动20米，用强力突刺攻击敌人，造成360%物理攻击的伤害，并造成3秒流血和1秒眩晕",
    id = 0
    };
getRow(121005,12)->
    #player_skills_upgradingCfg {
    skillID = 121005,
    level = 12,
    player_level = 68,
    currency = [{1,250000}],
    skillcoin_cost = 1,
    item = [],
    describe = "向前快速移动20米，用强力突刺攻击敌人，造成372%物理攻击的伤害，并造成3秒流血和1秒眩晕",
    id = 0
    };
getRow(121005,13)->
    #player_skills_upgradingCfg {
    skillID = 121005,
    level = 13,
    player_level = 70,
    currency = [{1,270000}],
    skillcoin_cost = 1,
    item = [],
    describe = "向前快速移动20米，用强力突刺攻击敌人，造成384%物理攻击的伤害，并造成3秒流血和1秒眩晕",
    id = 0
    };
getRow(121005,14)->
    #player_skills_upgradingCfg {
    skillID = 121005,
    level = 14,
    player_level = 72,
    currency = [{1,290000}],
    skillcoin_cost = 1,
    item = [],
    describe = "向前快速移动20米，用强力突刺攻击敌人，造成396%物理攻击的伤害，并造成3秒流血和1秒眩晕",
    id = 0
    };
getRow(121005,15)->
    #player_skills_upgradingCfg {
    skillID = 121005,
    level = 15,
    player_level = 74,
    currency = [{1,310000}],
    skillcoin_cost = 1,
    item = [],
    describe = "向前快速移动20米，用强力突刺攻击敌人，造成408%物理攻击的伤害，并造成3秒流血和1秒眩晕",
    id = 0
    };
getRow(121005,16)->
    #player_skills_upgradingCfg {
    skillID = 121005,
    level = 16,
    player_level = 76,
    currency = [{1,330000}],
    skillcoin_cost = 1,
    item = [],
    describe = "向前快速移动20米，用强力突刺攻击敌人，造成420%物理攻击的伤害，并造成3秒流血和1秒眩晕",
    id = 0
    };
getRow(121005,17)->
    #player_skills_upgradingCfg {
    skillID = 121005,
    level = 17,
    player_level = 78,
    currency = [{1,350000}],
    skillcoin_cost = 1,
    item = [],
    describe = "向前快速移动20米，用强力突刺攻击敌人，造成432%物理攻击的伤害，并造成3秒流血和1秒眩晕",
    id = 0
    };
getRow(121005,18)->
    #player_skills_upgradingCfg {
    skillID = 121005,
    level = 18,
    player_level = 80,
    currency = [{1,370000}],
    skillcoin_cost = 1,
    item = [],
    describe = "向前快速移动20米，用强力突刺攻击敌人，造成444%物理攻击的伤害，并造成3秒流血和1秒眩晕",
    id = 0
    };
getRow(121005,19)->
    #player_skills_upgradingCfg {
    skillID = 121005,
    level = 19,
    player_level = 82,
    currency = [{1,390000}],
    skillcoin_cost = 1,
    item = [],
    describe = "向前快速移动20米，用强力突刺攻击敌人，造成456%物理攻击的伤害，并造成3秒流血和1秒眩晕",
    id = 0
    };
getRow(121005,20)->
    #player_skills_upgradingCfg {
    skillID = 121005,
    level = 20,
    player_level = 84,
    currency = [{1,410000}],
    skillcoin_cost = 1,
    item = [],
    describe = "向前快速移动20米，用强力突刺攻击敌人，造成468%物理攻击的伤害，并造成3秒流血和1秒眩晕",
    id = 0
    };
getRow(121005,21)->
    #player_skills_upgradingCfg {
    skillID = 121005,
    level = 21,
    player_level = 86,
    currency = [{1,430000}],
    skillcoin_cost = 1,
    item = [],
    describe = "向前快速移动20米，用强力突刺攻击敌人，造成480%物理攻击的伤害，并造成3秒流血和1秒眩晕",
    id = 0
    };
getRow(121005,22)->
    #player_skills_upgradingCfg {
    skillID = 121005,
    level = 22,
    player_level = 88,
    currency = [{1,450000}],
    skillcoin_cost = 1,
    item = [],
    describe = "向前快速移动20米，用强力突刺攻击敌人，造成492%物理攻击的伤害，并造成3秒流血和1秒眩晕",
    id = 0
    };
getRow(121005,23)->
    #player_skills_upgradingCfg {
    skillID = 121005,
    level = 23,
    player_level = 90,
    currency = [{1,470000}],
    skillcoin_cost = 1,
    item = [],
    describe = "向前快速移动20米，用强力突刺攻击敌人，造成504%物理攻击的伤害，并造成3秒流血和1秒眩晕",
    id = 0
    };
getRow(121005,24)->
    #player_skills_upgradingCfg {
    skillID = 121005,
    level = 24,
    player_level = 92,
    currency = [{1,490000}],
    skillcoin_cost = 1,
    item = [],
    describe = "向前快速移动20米，用强力突刺攻击敌人，造成516%物理攻击的伤害，并造成3秒流血和1秒眩晕",
    id = 0
    };
getRow(121005,25)->
    #player_skills_upgradingCfg {
    skillID = 121005,
    level = 25,
    player_level = 94,
    currency = [{1,510000}],
    skillcoin_cost = 1,
    item = [],
    describe = "向前快速移动20米，用强力突刺攻击敌人，造成528%物理攻击的伤害，并造成3秒流血和1秒眩晕",
    id = 0
    };
getRow(121006,1)->
    #player_skills_upgradingCfg {
    skillID = 121006,
    level = 1,
    player_level = 60,
    currency = [],
    skillcoin_cost = 1,
    item = [],
    describe = "持盾对前方扇形造成300%物理攻击的伤害，并降低5%双攻，持续3秒",
    id = 0
    };
getRow(121006,2)->
    #player_skills_upgradingCfg {
    skillID = 121006,
    level = 2,
    player_level = 60,
    currency = [{1,50000}],
    skillcoin_cost = 1,
    item = [],
    describe = "持盾对前方扇形造成312%物理攻击的伤害，并降低5.3%双攻，持续3秒",
    id = 0
    };
getRow(121006,3)->
    #player_skills_upgradingCfg {
    skillID = 121006,
    level = 3,
    player_level = 60,
    currency = [{1,70000}],
    skillcoin_cost = 1,
    item = [],
    describe = "持盾对前方扇形造成324%物理攻击的伤害，并降低5.6%双攻，持续3秒",
    id = 0
    };
getRow(121006,4)->
    #player_skills_upgradingCfg {
    skillID = 121006,
    level = 4,
    player_level = 60,
    currency = [{1,90000}],
    skillcoin_cost = 1,
    item = [],
    describe = "持盾对前方扇形造成336%物理攻击的伤害，并降低5.9%双攻，持续3秒",
    id = 0
    };
getRow(121006,5)->
    #player_skills_upgradingCfg {
    skillID = 121006,
    level = 5,
    player_level = 60,
    currency = [{1,110000}],
    skillcoin_cost = 1,
    item = [],
    describe = "持盾对前方扇形造成348%物理攻击的伤害，并降低6.2%双攻，持续3秒",
    id = 0
    };
getRow(121006,6)->
    #player_skills_upgradingCfg {
    skillID = 121006,
    level = 6,
    player_level = 60,
    currency = [{1,130000}],
    skillcoin_cost = 1,
    item = [],
    describe = "持盾对前方扇形造成360%物理攻击的伤害，并降低6.5%双攻，持续3秒",
    id = 0
    };
getRow(121006,7)->
    #player_skills_upgradingCfg {
    skillID = 121006,
    level = 7,
    player_level = 60,
    currency = [{1,150000}],
    skillcoin_cost = 1,
    item = [],
    describe = "持盾对前方扇形造成372%物理攻击的伤害，并降低6.8%双攻，持续3秒",
    id = 0
    };
getRow(121006,8)->
    #player_skills_upgradingCfg {
    skillID = 121006,
    level = 8,
    player_level = 60,
    currency = [{1,170000}],
    skillcoin_cost = 1,
    item = [],
    describe = "持盾对前方扇形造成384%物理攻击的伤害，并降低7.1%双攻，持续3秒",
    id = 0
    };
getRow(121006,9)->
    #player_skills_upgradingCfg {
    skillID = 121006,
    level = 9,
    player_level = 62,
    currency = [{1,190000}],
    skillcoin_cost = 1,
    item = [],
    describe = "持盾对前方扇形造成396%物理攻击的伤害，并降低7.4%双攻，持续3秒",
    id = 0
    };
getRow(121006,10)->
    #player_skills_upgradingCfg {
    skillID = 121006,
    level = 10,
    player_level = 64,
    currency = [{1,210000}],
    skillcoin_cost = 1,
    item = [],
    describe = "持盾对前方扇形造成408%物理攻击的伤害，并降低7.7%双攻，持续3秒",
    id = 0
    };
getRow(121006,11)->
    #player_skills_upgradingCfg {
    skillID = 121006,
    level = 11,
    player_level = 66,
    currency = [{1,230000}],
    skillcoin_cost = 1,
    item = [],
    describe = "持盾对前方扇形造成420%物理攻击的伤害，并降低8%双攻，持续3秒",
    id = 0
    };
getRow(121006,12)->
    #player_skills_upgradingCfg {
    skillID = 121006,
    level = 12,
    player_level = 68,
    currency = [{1,250000}],
    skillcoin_cost = 1,
    item = [],
    describe = "持盾对前方扇形造成432%物理攻击的伤害，并降低8.3%双攻，持续3秒",
    id = 0
    };
getRow(121006,13)->
    #player_skills_upgradingCfg {
    skillID = 121006,
    level = 13,
    player_level = 70,
    currency = [{1,270000}],
    skillcoin_cost = 1,
    item = [],
    describe = "持盾对前方扇形造成444%物理攻击的伤害，并降低8.6%双攻，持续3秒",
    id = 0
    };
getRow(121006,14)->
    #player_skills_upgradingCfg {
    skillID = 121006,
    level = 14,
    player_level = 72,
    currency = [{1,290000}],
    skillcoin_cost = 1,
    item = [],
    describe = "持盾对前方扇形造成456%物理攻击的伤害，并降低8.9%双攻，持续3秒",
    id = 0
    };
getRow(121006,15)->
    #player_skills_upgradingCfg {
    skillID = 121006,
    level = 15,
    player_level = 74,
    currency = [{1,310000}],
    skillcoin_cost = 1,
    item = [],
    describe = "持盾对前方扇形造成468%物理攻击的伤害，并降低9.2%双攻，持续3秒",
    id = 0
    };
getRow(121006,16)->
    #player_skills_upgradingCfg {
    skillID = 121006,
    level = 16,
    player_level = 76,
    currency = [{1,330000}],
    skillcoin_cost = 1,
    item = [],
    describe = "持盾对前方扇形造成480%物理攻击的伤害，并降低9.5%双攻，持续3秒",
    id = 0
    };
getRow(121006,17)->
    #player_skills_upgradingCfg {
    skillID = 121006,
    level = 17,
    player_level = 78,
    currency = [{1,350000}],
    skillcoin_cost = 1,
    item = [],
    describe = "持盾对前方扇形造成492%物理攻击的伤害，并降低9.8%双攻，持续3秒",
    id = 0
    };
getRow(121006,18)->
    #player_skills_upgradingCfg {
    skillID = 121006,
    level = 18,
    player_level = 80,
    currency = [{1,370000}],
    skillcoin_cost = 1,
    item = [],
    describe = "持盾对前方扇形造成504%物理攻击的伤害，并降低10.1%双攻，持续3秒",
    id = 0
    };
getRow(121006,19)->
    #player_skills_upgradingCfg {
    skillID = 121006,
    level = 19,
    player_level = 82,
    currency = [{1,390000}],
    skillcoin_cost = 1,
    item = [],
    describe = "持盾对前方扇形造成516%物理攻击的伤害，并降低10.4%双攻，持续3秒",
    id = 0
    };
getRow(121006,20)->
    #player_skills_upgradingCfg {
    skillID = 121006,
    level = 20,
    player_level = 84,
    currency = [{1,410000}],
    skillcoin_cost = 1,
    item = [],
    describe = "持盾对前方扇形造成528%物理攻击的伤害，并降低10.7%双攻，持续3秒",
    id = 0
    };
getRow(121006,21)->
    #player_skills_upgradingCfg {
    skillID = 121006,
    level = 21,
    player_level = 86,
    currency = [{1,430000}],
    skillcoin_cost = 1,
    item = [],
    describe = "持盾对前方扇形造成540%物理攻击的伤害，并降低11%双攻，持续3秒",
    id = 0
    };
getRow(121006,22)->
    #player_skills_upgradingCfg {
    skillID = 121006,
    level = 22,
    player_level = 88,
    currency = [{1,450000}],
    skillcoin_cost = 1,
    item = [],
    describe = "持盾对前方扇形造成552%物理攻击的伤害，并降低11.3%双攻，持续3秒",
    id = 0
    };
getRow(121006,23)->
    #player_skills_upgradingCfg {
    skillID = 121006,
    level = 23,
    player_level = 90,
    currency = [{1,470000}],
    skillcoin_cost = 1,
    item = [],
    describe = "持盾对前方扇形造成564%物理攻击的伤害，并降低11.6%双攻，持续3秒",
    id = 0
    };
getRow(121006,24)->
    #player_skills_upgradingCfg {
    skillID = 121006,
    level = 24,
    player_level = 92,
    currency = [{1,490000}],
    skillcoin_cost = 1,
    item = [],
    describe = "持盾对前方扇形造成576%物理攻击的伤害，并降低11.9%双攻，持续3秒",
    id = 0
    };
getRow(121006,25)->
    #player_skills_upgradingCfg {
    skillID = 121006,
    level = 25,
    player_level = 94,
    currency = [{1,510000}],
    skillcoin_cost = 1,
    item = [],
    describe = "持盾对前方扇形造成588%物理攻击的伤害，并降低12.2%双攻，持续3秒",
    id = 0
    };
getRow(121007,1)->
    #player_skills_upgradingCfg {
    skillID = 121007,
    level = 1,
    player_level = 60,
    currency = [],
    skillcoin_cost = 1,
    item = [],
    describe = "飞身对前方扇形造成300%物理攻击的伤害，并附带眩晕2秒",
    id = 0
    };
getRow(121007,2)->
    #player_skills_upgradingCfg {
    skillID = 121007,
    level = 2,
    player_level = 60,
    currency = [{1,50000}],
    skillcoin_cost = 1,
    item = [],
    describe = "飞身对前方扇形造成312%物理攻击的伤害，并附带眩晕2秒",
    id = 0
    };
getRow(121007,3)->
    #player_skills_upgradingCfg {
    skillID = 121007,
    level = 3,
    player_level = 60,
    currency = [{1,70000}],
    skillcoin_cost = 1,
    item = [],
    describe = "飞身对前方扇形造成324%物理攻击的伤害，并附带眩晕2秒",
    id = 0
    };
getRow(121007,4)->
    #player_skills_upgradingCfg {
    skillID = 121007,
    level = 4,
    player_level = 60,
    currency = [{1,90000}],
    skillcoin_cost = 1,
    item = [],
    describe = "飞身对前方扇形造成336%物理攻击的伤害，并附带眩晕2秒",
    id = 0
    };
getRow(121007,5)->
    #player_skills_upgradingCfg {
    skillID = 121007,
    level = 5,
    player_level = 60,
    currency = [{1,110000}],
    skillcoin_cost = 1,
    item = [],
    describe = "飞身对前方扇形造成348%物理攻击的伤害，并附带眩晕2秒",
    id = 0
    };
getRow(121007,6)->
    #player_skills_upgradingCfg {
    skillID = 121007,
    level = 6,
    player_level = 60,
    currency = [{1,130000}],
    skillcoin_cost = 1,
    item = [],
    describe = "飞身对前方扇形造成360%物理攻击的伤害，并附带眩晕2秒",
    id = 0
    };
getRow(121007,7)->
    #player_skills_upgradingCfg {
    skillID = 121007,
    level = 7,
    player_level = 60,
    currency = [{1,150000}],
    skillcoin_cost = 1,
    item = [],
    describe = "飞身对前方扇形造成372%物理攻击的伤害，并附带眩晕2秒",
    id = 0
    };
getRow(121007,8)->
    #player_skills_upgradingCfg {
    skillID = 121007,
    level = 8,
    player_level = 60,
    currency = [{1,170000}],
    skillcoin_cost = 1,
    item = [],
    describe = "飞身对前方扇形造成384%物理攻击的伤害，并附带眩晕2秒",
    id = 0
    };
getRow(121007,9)->
    #player_skills_upgradingCfg {
    skillID = 121007,
    level = 9,
    player_level = 62,
    currency = [{1,190000}],
    skillcoin_cost = 1,
    item = [],
    describe = "飞身对前方扇形造成396%物理攻击的伤害，并附带眩晕2秒",
    id = 0
    };
getRow(121007,10)->
    #player_skills_upgradingCfg {
    skillID = 121007,
    level = 10,
    player_level = 64,
    currency = [{1,210000}],
    skillcoin_cost = 1,
    item = [],
    describe = "飞身对前方扇形造成408%物理攻击的伤害，并附带眩晕2秒",
    id = 0
    };
getRow(121007,11)->
    #player_skills_upgradingCfg {
    skillID = 121007,
    level = 11,
    player_level = 66,
    currency = [{1,230000}],
    skillcoin_cost = 1,
    item = [],
    describe = "飞身对前方扇形造成420%物理攻击的伤害，并附带眩晕2秒",
    id = 0
    };
getRow(121007,12)->
    #player_skills_upgradingCfg {
    skillID = 121007,
    level = 12,
    player_level = 68,
    currency = [{1,250000}],
    skillcoin_cost = 1,
    item = [],
    describe = "飞身对前方扇形造成432%物理攻击的伤害，并附带眩晕2秒",
    id = 0
    };
getRow(121007,13)->
    #player_skills_upgradingCfg {
    skillID = 121007,
    level = 13,
    player_level = 70,
    currency = [{1,270000}],
    skillcoin_cost = 1,
    item = [],
    describe = "飞身对前方扇形造成444%物理攻击的伤害，并附带眩晕2秒",
    id = 0
    };
getRow(121007,14)->
    #player_skills_upgradingCfg {
    skillID = 121007,
    level = 14,
    player_level = 72,
    currency = [{1,290000}],
    skillcoin_cost = 1,
    item = [],
    describe = "飞身对前方扇形造成456%物理攻击的伤害，并附带眩晕2秒",
    id = 0
    };
getRow(121007,15)->
    #player_skills_upgradingCfg {
    skillID = 121007,
    level = 15,
    player_level = 74,
    currency = [{1,310000}],
    skillcoin_cost = 1,
    item = [],
    describe = "飞身对前方扇形造成468%物理攻击的伤害，并附带眩晕2秒",
    id = 0
    };
getRow(121007,16)->
    #player_skills_upgradingCfg {
    skillID = 121007,
    level = 16,
    player_level = 76,
    currency = [{1,330000}],
    skillcoin_cost = 1,
    item = [],
    describe = "飞身对前方扇形造成480%物理攻击的伤害，并附带眩晕2秒",
    id = 0
    };
getRow(121007,17)->
    #player_skills_upgradingCfg {
    skillID = 121007,
    level = 17,
    player_level = 78,
    currency = [{1,350000}],
    skillcoin_cost = 1,
    item = [],
    describe = "飞身对前方扇形造成492%物理攻击的伤害，并附带眩晕2秒",
    id = 0
    };
getRow(121007,18)->
    #player_skills_upgradingCfg {
    skillID = 121007,
    level = 18,
    player_level = 80,
    currency = [{1,370000}],
    skillcoin_cost = 1,
    item = [],
    describe = "飞身对前方扇形造成504%物理攻击的伤害，并附带眩晕2秒",
    id = 0
    };
getRow(121007,19)->
    #player_skills_upgradingCfg {
    skillID = 121007,
    level = 19,
    player_level = 82,
    currency = [{1,390000}],
    skillcoin_cost = 1,
    item = [],
    describe = "飞身对前方扇形造成516%物理攻击的伤害，并附带眩晕2秒",
    id = 0
    };
getRow(121007,20)->
    #player_skills_upgradingCfg {
    skillID = 121007,
    level = 20,
    player_level = 84,
    currency = [{1,410000}],
    skillcoin_cost = 1,
    item = [],
    describe = "飞身对前方扇形造成528%物理攻击的伤害，并附带眩晕2秒",
    id = 0
    };
getRow(121007,21)->
    #player_skills_upgradingCfg {
    skillID = 121007,
    level = 21,
    player_level = 86,
    currency = [{1,430000}],
    skillcoin_cost = 1,
    item = [],
    describe = "飞身对前方扇形造成540%物理攻击的伤害，并附带眩晕2秒",
    id = 0
    };
getRow(121007,22)->
    #player_skills_upgradingCfg {
    skillID = 121007,
    level = 22,
    player_level = 88,
    currency = [{1,450000}],
    skillcoin_cost = 1,
    item = [],
    describe = "飞身对前方扇形造成552%物理攻击的伤害，并附带眩晕2秒",
    id = 0
    };
getRow(121007,23)->
    #player_skills_upgradingCfg {
    skillID = 121007,
    level = 23,
    player_level = 90,
    currency = [{1,470000}],
    skillcoin_cost = 1,
    item = [],
    describe = "飞身对前方扇形造成564%物理攻击的伤害，并附带眩晕2秒",
    id = 0
    };
getRow(121007,24)->
    #player_skills_upgradingCfg {
    skillID = 121007,
    level = 24,
    player_level = 92,
    currency = [{1,490000}],
    skillcoin_cost = 1,
    item = [],
    describe = "飞身对前方扇形造成576%物理攻击的伤害，并附带眩晕2秒",
    id = 0
    };
getRow(121007,25)->
    #player_skills_upgradingCfg {
    skillID = 121007,
    level = 25,
    player_level = 94,
    currency = [{1,510000}],
    skillcoin_cost = 1,
    item = [],
    describe = "飞身对前方扇形造成588%物理攻击的伤害，并附带眩晕2秒",
    id = 0
    };
getRow(121008,1)->
    #player_skills_upgradingCfg {
    skillID = 121008,
    level = 1,
    player_level = 60,
    currency = [],
    skillcoin_cost = 1,
    item = [],
    describe = "使用盾牌猛击敌人，造成300%物理攻击的伤害并降低敌人10%物理防御，持续3秒",
    id = 0
    };
getRow(121008,2)->
    #player_skills_upgradingCfg {
    skillID = 121008,
    level = 2,
    player_level = 60,
    currency = [{1,50000}],
    skillcoin_cost = 1,
    item = [],
    describe = "使用盾牌猛击敌人，造成312%物理攻击的伤害并降低敌人10.4%物理防御，持续3秒",
    id = 0
    };
getRow(121008,3)->
    #player_skills_upgradingCfg {
    skillID = 121008,
    level = 3,
    player_level = 60,
    currency = [{1,70000}],
    skillcoin_cost = 1,
    item = [],
    describe = "使用盾牌猛击敌人，造成324%物理攻击的伤害并降低敌人10.8%物理防御，持续3秒",
    id = 0
    };
getRow(121008,4)->
    #player_skills_upgradingCfg {
    skillID = 121008,
    level = 4,
    player_level = 60,
    currency = [{1,90000}],
    skillcoin_cost = 1,
    item = [],
    describe = "使用盾牌猛击敌人，造成336%物理攻击的伤害并降低敌人11.2%物理防御，持续3秒",
    id = 0
    };
getRow(121008,5)->
    #player_skills_upgradingCfg {
    skillID = 121008,
    level = 5,
    player_level = 60,
    currency = [{1,110000}],
    skillcoin_cost = 1,
    item = [],
    describe = "使用盾牌猛击敌人，造成348%物理攻击的伤害并降低敌人11.6%物理防御，持续3秒",
    id = 0
    };
getRow(121008,6)->
    #player_skills_upgradingCfg {
    skillID = 121008,
    level = 6,
    player_level = 60,
    currency = [{1,130000}],
    skillcoin_cost = 1,
    item = [],
    describe = "使用盾牌猛击敌人，造成360%物理攻击的伤害并降低敌人12%物理防御，持续3秒",
    id = 0
    };
getRow(121008,7)->
    #player_skills_upgradingCfg {
    skillID = 121008,
    level = 7,
    player_level = 60,
    currency = [{1,150000}],
    skillcoin_cost = 1,
    item = [],
    describe = "使用盾牌猛击敌人，造成372%物理攻击的伤害并降低敌人12.4%物理防御，持续3秒",
    id = 0
    };
getRow(121008,8)->
    #player_skills_upgradingCfg {
    skillID = 121008,
    level = 8,
    player_level = 60,
    currency = [{1,170000}],
    skillcoin_cost = 1,
    item = [],
    describe = "使用盾牌猛击敌人，造成384%物理攻击的伤害并降低敌人12.8%物理防御，持续3秒",
    id = 0
    };
getRow(121008,9)->
    #player_skills_upgradingCfg {
    skillID = 121008,
    level = 9,
    player_level = 62,
    currency = [{1,190000}],
    skillcoin_cost = 1,
    item = [],
    describe = "使用盾牌猛击敌人，造成396%物理攻击的伤害并降低敌人13.2%物理防御，持续3秒",
    id = 0
    };
getRow(121008,10)->
    #player_skills_upgradingCfg {
    skillID = 121008,
    level = 10,
    player_level = 64,
    currency = [{1,210000}],
    skillcoin_cost = 1,
    item = [],
    describe = "使用盾牌猛击敌人，造成408%物理攻击的伤害并降低敌人13.6%物理防御，持续3秒",
    id = 0
    };
getRow(121008,11)->
    #player_skills_upgradingCfg {
    skillID = 121008,
    level = 11,
    player_level = 66,
    currency = [{1,230000}],
    skillcoin_cost = 1,
    item = [],
    describe = "使用盾牌猛击敌人，造成420%物理攻击的伤害并降低敌人14%物理防御，持续3秒",
    id = 0
    };
getRow(121008,12)->
    #player_skills_upgradingCfg {
    skillID = 121008,
    level = 12,
    player_level = 68,
    currency = [{1,250000}],
    skillcoin_cost = 1,
    item = [],
    describe = "使用盾牌猛击敌人，造成432%物理攻击的伤害并降低敌人14.4%物理防御，持续3秒",
    id = 0
    };
getRow(121008,13)->
    #player_skills_upgradingCfg {
    skillID = 121008,
    level = 13,
    player_level = 70,
    currency = [{1,270000}],
    skillcoin_cost = 1,
    item = [],
    describe = "使用盾牌猛击敌人，造成444%物理攻击的伤害并降低敌人14.8%物理防御，持续3秒",
    id = 0
    };
getRow(121008,14)->
    #player_skills_upgradingCfg {
    skillID = 121008,
    level = 14,
    player_level = 72,
    currency = [{1,290000}],
    skillcoin_cost = 1,
    item = [],
    describe = "使用盾牌猛击敌人，造成456%物理攻击的伤害并降低敌人15.2%物理防御，持续3秒",
    id = 0
    };
getRow(121008,15)->
    #player_skills_upgradingCfg {
    skillID = 121008,
    level = 15,
    player_level = 74,
    currency = [{1,310000}],
    skillcoin_cost = 1,
    item = [],
    describe = "使用盾牌猛击敌人，造成468%物理攻击的伤害并降低敌人15.6%物理防御，持续3秒",
    id = 0
    };
getRow(121008,16)->
    #player_skills_upgradingCfg {
    skillID = 121008,
    level = 16,
    player_level = 76,
    currency = [{1,330000}],
    skillcoin_cost = 1,
    item = [],
    describe = "使用盾牌猛击敌人，造成480%物理攻击的伤害并降低敌人16%物理防御，持续3秒",
    id = 0
    };
getRow(121008,17)->
    #player_skills_upgradingCfg {
    skillID = 121008,
    level = 17,
    player_level = 78,
    currency = [{1,350000}],
    skillcoin_cost = 1,
    item = [],
    describe = "使用盾牌猛击敌人，造成492%物理攻击的伤害并降低敌人16.4%物理防御，持续3秒",
    id = 0
    };
getRow(121008,18)->
    #player_skills_upgradingCfg {
    skillID = 121008,
    level = 18,
    player_level = 80,
    currency = [{1,370000}],
    skillcoin_cost = 1,
    item = [],
    describe = "使用盾牌猛击敌人，造成504%物理攻击的伤害并降低敌人16.8%物理防御，持续3秒",
    id = 0
    };
getRow(121008,19)->
    #player_skills_upgradingCfg {
    skillID = 121008,
    level = 19,
    player_level = 82,
    currency = [{1,390000}],
    skillcoin_cost = 1,
    item = [],
    describe = "使用盾牌猛击敌人，造成516%物理攻击的伤害并降低敌人17.2%物理防御，持续3秒",
    id = 0
    };
getRow(121008,20)->
    #player_skills_upgradingCfg {
    skillID = 121008,
    level = 20,
    player_level = 84,
    currency = [{1,410000}],
    skillcoin_cost = 1,
    item = [],
    describe = "使用盾牌猛击敌人，造成528%物理攻击的伤害并降低敌人17.6%物理防御，持续3秒",
    id = 0
    };
getRow(121008,21)->
    #player_skills_upgradingCfg {
    skillID = 121008,
    level = 21,
    player_level = 86,
    currency = [{1,430000}],
    skillcoin_cost = 1,
    item = [],
    describe = "使用盾牌猛击敌人，造成540%物理攻击的伤害并降低敌人18%物理防御，持续3秒",
    id = 0
    };
getRow(121008,22)->
    #player_skills_upgradingCfg {
    skillID = 121008,
    level = 22,
    player_level = 88,
    currency = [{1,450000}],
    skillcoin_cost = 1,
    item = [],
    describe = "使用盾牌猛击敌人，造成552%物理攻击的伤害并降低敌人18.4%物理防御，持续3秒",
    id = 0
    };
getRow(121008,23)->
    #player_skills_upgradingCfg {
    skillID = 121008,
    level = 23,
    player_level = 90,
    currency = [{1,470000}],
    skillcoin_cost = 1,
    item = [],
    describe = "使用盾牌猛击敌人，造成564%物理攻击的伤害并降低敌人18.8%物理防御，持续3秒",
    id = 0
    };
getRow(121008,24)->
    #player_skills_upgradingCfg {
    skillID = 121008,
    level = 24,
    player_level = 92,
    currency = [{1,490000}],
    skillcoin_cost = 1,
    item = [],
    describe = "使用盾牌猛击敌人，造成576%物理攻击的伤害并降低敌人19.2%物理防御，持续3秒",
    id = 0
    };
getRow(121008,25)->
    #player_skills_upgradingCfg {
    skillID = 121008,
    level = 25,
    player_level = 94,
    currency = [{1,510000}],
    skillcoin_cost = 1,
    item = [],
    describe = "使用盾牌猛击敌人，造成588%物理攻击的伤害并降低敌人19.6%物理防御，持续3秒",
    id = 0
    };
getRow(121009,1)->
    #player_skills_upgradingCfg {
    skillID = 121009,
    level = 1,
    player_level = 60,
    currency = [],
    skillcoin_cost = 1,
    item = [],
    describe = "3秒内，受击持续反弹受到伤害的15%",
    id = 0
    };
getRow(121009,2)->
    #player_skills_upgradingCfg {
    skillID = 121009,
    level = 2,
    player_level = 60,
    currency = [{1,70000}],
    skillcoin_cost = 1,
    item = [],
    describe = "3秒内，受击持续反弹受到伤害的16.5%",
    id = 0
    };
getRow(121009,3)->
    #player_skills_upgradingCfg {
    skillID = 121009,
    level = 3,
    player_level = 60,
    currency = [{1,110000}],
    skillcoin_cost = 1,
    item = [],
    describe = "3秒内，受击持续反弹受到伤害的18%",
    id = 0
    };
getRow(121009,4)->
    #player_skills_upgradingCfg {
    skillID = 121009,
    level = 4,
    player_level = 60,
    currency = [{1,150000}],
    skillcoin_cost = 1,
    item = [],
    describe = "3秒内，受击持续反弹受到伤害的19.5%",
    id = 0
    };
getRow(121009,5)->
    #player_skills_upgradingCfg {
    skillID = 121009,
    level = 5,
    player_level = 62,
    currency = [{1,190000}],
    skillcoin_cost = 1,
    item = [],
    describe = "3秒内，受击持续反弹受到伤害的21%",
    id = 0
    };
getRow(121009,6)->
    #player_skills_upgradingCfg {
    skillID = 121009,
    level = 6,
    player_level = 66,
    currency = [{1,230000}],
    skillcoin_cost = 1,
    item = [],
    describe = "3秒内，受击持续反弹受到伤害的22.5%",
    id = 0
    };
getRow(121009,7)->
    #player_skills_upgradingCfg {
    skillID = 121009,
    level = 7,
    player_level = 70,
    currency = [{1,270000}],
    skillcoin_cost = 1,
    item = [],
    describe = "3秒内，受击持续反弹受到伤害的24%",
    id = 0
    };
getRow(121009,8)->
    #player_skills_upgradingCfg {
    skillID = 121009,
    level = 8,
    player_level = 74,
    currency = [{1,310000}],
    skillcoin_cost = 1,
    item = [],
    describe = "3秒内，受击持续反弹受到伤害的25.5%",
    id = 0
    };
getRow(121009,9)->
    #player_skills_upgradingCfg {
    skillID = 121009,
    level = 9,
    player_level = 78,
    currency = [{1,350000}],
    skillcoin_cost = 1,
    item = [],
    describe = "3秒内，受击持续反弹受到伤害的27%",
    id = 0
    };
getRow(121009,10)->
    #player_skills_upgradingCfg {
    skillID = 121009,
    level = 10,
    player_level = 82,
    currency = [{1,390000}],
    skillcoin_cost = 1,
    item = [],
    describe = "3秒内，受击持续反弹受到伤害的28.5%",
    id = 0
    };
getRow(121009,11)->
    #player_skills_upgradingCfg {
    skillID = 121009,
    level = 11,
    player_level = 86,
    currency = [{1,430000}],
    skillcoin_cost = 1,
    item = [],
    describe = "3秒内，受击持续反弹受到伤害的30%",
    id = 0
    };
getRow(121010,1)->
    #player_skills_upgradingCfg {
    skillID = 121010,
    level = 1,
    player_level = 60,
    currency = [],
    skillcoin_cost = 1,
    item = [],
    describe = "激发全队意志，全体队友生命上限增加10%，持续10分钟",
    id = 0
    };
getRow(121010,2)->
    #player_skills_upgradingCfg {
    skillID = 121010,
    level = 2,
    player_level = 60,
    currency = [{1,70000}],
    skillcoin_cost = 1,
    item = [],
    describe = "激发全队意志，全体队友生命上限增加11%，持续10分钟",
    id = 0
    };
getRow(121010,3)->
    #player_skills_upgradingCfg {
    skillID = 121010,
    level = 3,
    player_level = 60,
    currency = [{1,110000}],
    skillcoin_cost = 1,
    item = [],
    describe = "激发全队意志，全体队友生命上限增加12%，持续10分钟",
    id = 0
    };
getRow(121010,4)->
    #player_skills_upgradingCfg {
    skillID = 121010,
    level = 4,
    player_level = 60,
    currency = [{1,150000}],
    skillcoin_cost = 1,
    item = [],
    describe = "激发全队意志，全体队友生命上限增加13%，持续10分钟",
    id = 0
    };
getRow(121010,5)->
    #player_skills_upgradingCfg {
    skillID = 121010,
    level = 5,
    player_level = 62,
    currency = [{1,190000}],
    skillcoin_cost = 1,
    item = [],
    describe = "激发全队意志，全体队友生命上限增加14%，持续10分钟",
    id = 0
    };
getRow(121010,6)->
    #player_skills_upgradingCfg {
    skillID = 121010,
    level = 6,
    player_level = 66,
    currency = [{1,230000}],
    skillcoin_cost = 1,
    item = [],
    describe = "激发全队意志，全体队友生命上限增加15%，持续10分钟",
    id = 0
    };
getRow(121010,7)->
    #player_skills_upgradingCfg {
    skillID = 121010,
    level = 7,
    player_level = 70,
    currency = [{1,270000}],
    skillcoin_cost = 1,
    item = [],
    describe = "激发全队意志，全体队友生命上限增加16%，持续10分钟",
    id = 0
    };
getRow(121010,8)->
    #player_skills_upgradingCfg {
    skillID = 121010,
    level = 8,
    player_level = 74,
    currency = [{1,310000}],
    skillcoin_cost = 1,
    item = [],
    describe = "激发全队意志，全体队友生命上限增加17%，持续10分钟",
    id = 0
    };
getRow(121010,9)->
    #player_skills_upgradingCfg {
    skillID = 121010,
    level = 9,
    player_level = 78,
    currency = [{1,350000}],
    skillcoin_cost = 1,
    item = [],
    describe = "激发全队意志，全体队友生命上限增加18%，持续10分钟",
    id = 0
    };
getRow(121010,10)->
    #player_skills_upgradingCfg {
    skillID = 121010,
    level = 10,
    player_level = 82,
    currency = [{1,390000}],
    skillcoin_cost = 1,
    item = [],
    describe = "激发全队意志，全体队友生命上限增加19%，持续10分钟",
    id = 0
    };
getRow(121010,11)->
    #player_skills_upgradingCfg {
    skillID = 121010,
    level = 11,
    player_level = 86,
    currency = [{1,430000}],
    skillcoin_cost = 1,
    item = [],
    describe = "激发全队意志，全体队友生命上限增加20%，持续10分钟",
    id = 0
    };
getRow(121011,1)->
    #player_skills_upgradingCfg {
    skillID = 121011,
    level = 1,
    player_level = 60,
    currency = [],
    skillcoin_cost = 1,
    item = [],
    describe = "挑衅使自身周围怪物攻击自己，且增强自身25%双防，持续8秒",
    id = 0
    };
getRow(121011,2)->
    #player_skills_upgradingCfg {
    skillID = 121011,
    level = 2,
    player_level = 60,
    currency = [{1,70000}],
    skillcoin_cost = 1,
    item = [],
    describe = "挑衅使自身周围怪物攻击自己，且增强自身27.5%双防，持续8秒",
    id = 0
    };
getRow(121011,3)->
    #player_skills_upgradingCfg {
    skillID = 121011,
    level = 3,
    player_level = 60,
    currency = [{1,110000}],
    skillcoin_cost = 1,
    item = [],
    describe = "挑衅使自身周围怪物攻击自己，且增强自身30%双防，持续8秒",
    id = 0
    };
getRow(121011,4)->
    #player_skills_upgradingCfg {
    skillID = 121011,
    level = 4,
    player_level = 60,
    currency = [{1,150000}],
    skillcoin_cost = 1,
    item = [],
    describe = "挑衅使自身周围怪物攻击自己，且增强自身32.5%双防，持续8秒",
    id = 0
    };
getRow(121011,5)->
    #player_skills_upgradingCfg {
    skillID = 121011,
    level = 5,
    player_level = 62,
    currency = [{1,190000}],
    skillcoin_cost = 1,
    item = [],
    describe = "挑衅使自身周围怪物攻击自己，且增强自身35%双防，持续8秒",
    id = 0
    };
getRow(121011,6)->
    #player_skills_upgradingCfg {
    skillID = 121011,
    level = 6,
    player_level = 66,
    currency = [{1,230000}],
    skillcoin_cost = 1,
    item = [],
    describe = "挑衅使自身周围怪物攻击自己，且增强自身37.5%双防，持续8秒",
    id = 0
    };
getRow(121011,7)->
    #player_skills_upgradingCfg {
    skillID = 121011,
    level = 7,
    player_level = 70,
    currency = [{1,270000}],
    skillcoin_cost = 1,
    item = [],
    describe = "挑衅使自身周围怪物攻击自己，且增强自身40%双防，持续8秒",
    id = 0
    };
getRow(121011,8)->
    #player_skills_upgradingCfg {
    skillID = 121011,
    level = 8,
    player_level = 74,
    currency = [{1,310000}],
    skillcoin_cost = 1,
    item = [],
    describe = "挑衅使自身周围怪物攻击自己，且增强自身42.5%双防，持续8秒",
    id = 0
    };
getRow(121011,9)->
    #player_skills_upgradingCfg {
    skillID = 121011,
    level = 9,
    player_level = 78,
    currency = [{1,350000}],
    skillcoin_cost = 1,
    item = [],
    describe = "挑衅使自身周围怪物攻击自己，且增强自身45%双防，持续8秒",
    id = 0
    };
getRow(121011,10)->
    #player_skills_upgradingCfg {
    skillID = 121011,
    level = 10,
    player_level = 82,
    currency = [{1,390000}],
    skillcoin_cost = 1,
    item = [],
    describe = "挑衅使自身周围怪物攻击自己，且增强自身47.5%双防，持续8秒",
    id = 0
    };
getRow(121011,11)->
    #player_skills_upgradingCfg {
    skillID = 121011,
    level = 11,
    player_level = 86,
    currency = [{1,430000}],
    skillcoin_cost = 1,
    item = [],
    describe = "挑衅使自身周围怪物攻击自己，且增强自身50%双防，持续8秒",
    id = 0
    };
getRow(122005,1)->
    #player_skills_upgradingCfg {
    skillID = 122005,
    level = 1,
    player_level = 60,
    currency = [],
    skillcoin_cost = 1,
    item = [],
    describe = "释放剑气之风对前方矩形敌人造成400%物理攻击的伤害",
    id = 0
    };
getRow(122005,2)->
    #player_skills_upgradingCfg {
    skillID = 122005,
    level = 2,
    player_level = 60,
    currency = [{1,50000}],
    skillcoin_cost = 1,
    item = [],
    describe = "释放剑气之风对前方矩形敌人造成412%物理攻击的伤害",
    id = 0
    };
getRow(122005,3)->
    #player_skills_upgradingCfg {
    skillID = 122005,
    level = 3,
    player_level = 60,
    currency = [{1,70000}],
    skillcoin_cost = 1,
    item = [],
    describe = "释放剑气之风对前方矩形敌人造成424%物理攻击的伤害",
    id = 0
    };
getRow(122005,4)->
    #player_skills_upgradingCfg {
    skillID = 122005,
    level = 4,
    player_level = 60,
    currency = [{1,90000}],
    skillcoin_cost = 1,
    item = [],
    describe = "释放剑气之风对前方矩形敌人造成436%物理攻击的伤害",
    id = 0
    };
getRow(122005,5)->
    #player_skills_upgradingCfg {
    skillID = 122005,
    level = 5,
    player_level = 60,
    currency = [{1,110000}],
    skillcoin_cost = 1,
    item = [],
    describe = "释放剑气之风对前方矩形敌人造成448%物理攻击的伤害",
    id = 0
    };
getRow(122005,6)->
    #player_skills_upgradingCfg {
    skillID = 122005,
    level = 6,
    player_level = 60,
    currency = [{1,130000}],
    skillcoin_cost = 1,
    item = [],
    describe = "释放剑气之风对前方矩形敌人造成460%物理攻击的伤害",
    id = 0
    };
getRow(122005,7)->
    #player_skills_upgradingCfg {
    skillID = 122005,
    level = 7,
    player_level = 60,
    currency = [{1,150000}],
    skillcoin_cost = 1,
    item = [],
    describe = "释放剑气之风对前方矩形敌人造成472%物理攻击的伤害",
    id = 0
    };
getRow(122005,8)->
    #player_skills_upgradingCfg {
    skillID = 122005,
    level = 8,
    player_level = 60,
    currency = [{1,170000}],
    skillcoin_cost = 1,
    item = [],
    describe = "释放剑气之风对前方矩形敌人造成484%物理攻击的伤害",
    id = 0
    };
getRow(122005,9)->
    #player_skills_upgradingCfg {
    skillID = 122005,
    level = 9,
    player_level = 62,
    currency = [{1,190000}],
    skillcoin_cost = 1,
    item = [],
    describe = "释放剑气之风对前方矩形敌人造成496%物理攻击的伤害",
    id = 0
    };
getRow(122005,10)->
    #player_skills_upgradingCfg {
    skillID = 122005,
    level = 10,
    player_level = 64,
    currency = [{1,210000}],
    skillcoin_cost = 1,
    item = [],
    describe = "释放剑气之风对前方矩形敌人造成508%物理攻击的伤害",
    id = 0
    };
getRow(122005,11)->
    #player_skills_upgradingCfg {
    skillID = 122005,
    level = 11,
    player_level = 66,
    currency = [{1,230000}],
    skillcoin_cost = 1,
    item = [],
    describe = "释放剑气之风对前方矩形敌人造成520%物理攻击的伤害",
    id = 0
    };
getRow(122005,12)->
    #player_skills_upgradingCfg {
    skillID = 122005,
    level = 12,
    player_level = 68,
    currency = [{1,250000}],
    skillcoin_cost = 1,
    item = [],
    describe = "释放剑气之风对前方矩形敌人造成532%物理攻击的伤害",
    id = 0
    };
getRow(122005,13)->
    #player_skills_upgradingCfg {
    skillID = 122005,
    level = 13,
    player_level = 70,
    currency = [{1,270000}],
    skillcoin_cost = 1,
    item = [],
    describe = "释放剑气之风对前方矩形敌人造成544%物理攻击的伤害",
    id = 0
    };
getRow(122005,14)->
    #player_skills_upgradingCfg {
    skillID = 122005,
    level = 14,
    player_level = 72,
    currency = [{1,290000}],
    skillcoin_cost = 1,
    item = [],
    describe = "释放剑气之风对前方矩形敌人造成556%物理攻击的伤害",
    id = 0
    };
getRow(122005,15)->
    #player_skills_upgradingCfg {
    skillID = 122005,
    level = 15,
    player_level = 74,
    currency = [{1,310000}],
    skillcoin_cost = 1,
    item = [],
    describe = "释放剑气之风对前方矩形敌人造成568%物理攻击的伤害",
    id = 0
    };
getRow(122005,16)->
    #player_skills_upgradingCfg {
    skillID = 122005,
    level = 16,
    player_level = 76,
    currency = [{1,330000}],
    skillcoin_cost = 1,
    item = [],
    describe = "释放剑气之风对前方矩形敌人造成580%物理攻击的伤害",
    id = 0
    };
getRow(122005,17)->
    #player_skills_upgradingCfg {
    skillID = 122005,
    level = 17,
    player_level = 78,
    currency = [{1,350000}],
    skillcoin_cost = 1,
    item = [],
    describe = "释放剑气之风对前方矩形敌人造成592%物理攻击的伤害",
    id = 0
    };
getRow(122005,18)->
    #player_skills_upgradingCfg {
    skillID = 122005,
    level = 18,
    player_level = 80,
    currency = [{1,370000}],
    skillcoin_cost = 1,
    item = [],
    describe = "释放剑气之风对前方矩形敌人造成604%物理攻击的伤害",
    id = 0
    };
getRow(122005,19)->
    #player_skills_upgradingCfg {
    skillID = 122005,
    level = 19,
    player_level = 82,
    currency = [{1,390000}],
    skillcoin_cost = 1,
    item = [],
    describe = "释放剑气之风对前方矩形敌人造成616%物理攻击的伤害",
    id = 0
    };
getRow(122005,20)->
    #player_skills_upgradingCfg {
    skillID = 122005,
    level = 20,
    player_level = 84,
    currency = [{1,410000}],
    skillcoin_cost = 1,
    item = [],
    describe = "释放剑气之风对前方矩形敌人造成628%物理攻击的伤害",
    id = 0
    };
getRow(122005,21)->
    #player_skills_upgradingCfg {
    skillID = 122005,
    level = 21,
    player_level = 86,
    currency = [{1,430000}],
    skillcoin_cost = 1,
    item = [],
    describe = "释放剑气之风对前方矩形敌人造成640%物理攻击的伤害",
    id = 0
    };
getRow(122005,22)->
    #player_skills_upgradingCfg {
    skillID = 122005,
    level = 22,
    player_level = 88,
    currency = [{1,450000}],
    skillcoin_cost = 1,
    item = [],
    describe = "释放剑气之风对前方矩形敌人造成652%物理攻击的伤害",
    id = 0
    };
getRow(122005,23)->
    #player_skills_upgradingCfg {
    skillID = 122005,
    level = 23,
    player_level = 90,
    currency = [{1,470000}],
    skillcoin_cost = 1,
    item = [],
    describe = "释放剑气之风对前方矩形敌人造成664%物理攻击的伤害",
    id = 0
    };
getRow(122005,24)->
    #player_skills_upgradingCfg {
    skillID = 122005,
    level = 24,
    player_level = 92,
    currency = [{1,490000}],
    skillcoin_cost = 1,
    item = [],
    describe = "释放剑气之风对前方矩形敌人造成676%物理攻击的伤害",
    id = 0
    };
getRow(122005,25)->
    #player_skills_upgradingCfg {
    skillID = 122005,
    level = 25,
    player_level = 94,
    currency = [{1,510000}],
    skillcoin_cost = 1,
    item = [],
    describe = "释放剑气之风对前方矩形敌人造成688%物理攻击的伤害",
    id = 0
    };
getRow(122006,1)->
    #player_skills_upgradingCfg {
    skillID = 122006,
    level = 1,
    player_level = 60,
    currency = [],
    skillcoin_cost = 1,
    item = [],
    describe = "锋利的剑刃对前方矩形敌人造成400%物理攻击的伤害",
    id = 0
    };
getRow(122006,2)->
    #player_skills_upgradingCfg {
    skillID = 122006,
    level = 2,
    player_level = 60,
    currency = [{1,50000}],
    skillcoin_cost = 1,
    item = [],
    describe = "锋利的剑刃对前方矩形敌人造成412%物理攻击的伤害",
    id = 0
    };
getRow(122006,3)->
    #player_skills_upgradingCfg {
    skillID = 122006,
    level = 3,
    player_level = 60,
    currency = [{1,70000}],
    skillcoin_cost = 1,
    item = [],
    describe = "锋利的剑刃对前方矩形敌人造成424%物理攻击的伤害",
    id = 0
    };
getRow(122006,4)->
    #player_skills_upgradingCfg {
    skillID = 122006,
    level = 4,
    player_level = 60,
    currency = [{1,90000}],
    skillcoin_cost = 1,
    item = [],
    describe = "锋利的剑刃对前方矩形敌人造成436%物理攻击的伤害",
    id = 0
    };
getRow(122006,5)->
    #player_skills_upgradingCfg {
    skillID = 122006,
    level = 5,
    player_level = 60,
    currency = [{1,110000}],
    skillcoin_cost = 1,
    item = [],
    describe = "锋利的剑刃对前方矩形敌人造成448%物理攻击的伤害",
    id = 0
    };
getRow(122006,6)->
    #player_skills_upgradingCfg {
    skillID = 122006,
    level = 6,
    player_level = 60,
    currency = [{1,130000}],
    skillcoin_cost = 1,
    item = [],
    describe = "锋利的剑刃对前方矩形敌人造成460%物理攻击的伤害",
    id = 0
    };
getRow(122006,7)->
    #player_skills_upgradingCfg {
    skillID = 122006,
    level = 7,
    player_level = 60,
    currency = [{1,150000}],
    skillcoin_cost = 1,
    item = [],
    describe = "锋利的剑刃对前方矩形敌人造成472%物理攻击的伤害",
    id = 0
    };
getRow(122006,8)->
    #player_skills_upgradingCfg {
    skillID = 122006,
    level = 8,
    player_level = 60,
    currency = [{1,170000}],
    skillcoin_cost = 1,
    item = [],
    describe = "锋利的剑刃对前方矩形敌人造成484%物理攻击的伤害",
    id = 0
    };
getRow(122006,9)->
    #player_skills_upgradingCfg {
    skillID = 122006,
    level = 9,
    player_level = 62,
    currency = [{1,190000}],
    skillcoin_cost = 1,
    item = [],
    describe = "锋利的剑刃对前方矩形敌人造成496%物理攻击的伤害",
    id = 0
    };
getRow(122006,10)->
    #player_skills_upgradingCfg {
    skillID = 122006,
    level = 10,
    player_level = 64,
    currency = [{1,210000}],
    skillcoin_cost = 1,
    item = [],
    describe = "锋利的剑刃对前方矩形敌人造成508%物理攻击的伤害",
    id = 0
    };
getRow(122006,11)->
    #player_skills_upgradingCfg {
    skillID = 122006,
    level = 11,
    player_level = 66,
    currency = [{1,230000}],
    skillcoin_cost = 1,
    item = [],
    describe = "锋利的剑刃对前方矩形敌人造成520%物理攻击的伤害",
    id = 0
    };
getRow(122006,12)->
    #player_skills_upgradingCfg {
    skillID = 122006,
    level = 12,
    player_level = 68,
    currency = [{1,250000}],
    skillcoin_cost = 1,
    item = [],
    describe = "锋利的剑刃对前方矩形敌人造成532%物理攻击的伤害",
    id = 0
    };
getRow(122006,13)->
    #player_skills_upgradingCfg {
    skillID = 122006,
    level = 13,
    player_level = 70,
    currency = [{1,270000}],
    skillcoin_cost = 1,
    item = [],
    describe = "锋利的剑刃对前方矩形敌人造成544%物理攻击的伤害",
    id = 0
    };
getRow(122006,14)->
    #player_skills_upgradingCfg {
    skillID = 122006,
    level = 14,
    player_level = 72,
    currency = [{1,290000}],
    skillcoin_cost = 1,
    item = [],
    describe = "锋利的剑刃对前方矩形敌人造成556%物理攻击的伤害",
    id = 0
    };
getRow(122006,15)->
    #player_skills_upgradingCfg {
    skillID = 122006,
    level = 15,
    player_level = 74,
    currency = [{1,310000}],
    skillcoin_cost = 1,
    item = [],
    describe = "锋利的剑刃对前方矩形敌人造成568%物理攻击的伤害",
    id = 0
    };
getRow(122006,16)->
    #player_skills_upgradingCfg {
    skillID = 122006,
    level = 16,
    player_level = 76,
    currency = [{1,330000}],
    skillcoin_cost = 1,
    item = [],
    describe = "锋利的剑刃对前方矩形敌人造成580%物理攻击的伤害",
    id = 0
    };
getRow(122006,17)->
    #player_skills_upgradingCfg {
    skillID = 122006,
    level = 17,
    player_level = 78,
    currency = [{1,350000}],
    skillcoin_cost = 1,
    item = [],
    describe = "锋利的剑刃对前方矩形敌人造成592%物理攻击的伤害",
    id = 0
    };
getRow(122006,18)->
    #player_skills_upgradingCfg {
    skillID = 122006,
    level = 18,
    player_level = 80,
    currency = [{1,370000}],
    skillcoin_cost = 1,
    item = [],
    describe = "锋利的剑刃对前方矩形敌人造成604%物理攻击的伤害",
    id = 0
    };
getRow(122006,19)->
    #player_skills_upgradingCfg {
    skillID = 122006,
    level = 19,
    player_level = 82,
    currency = [{1,390000}],
    skillcoin_cost = 1,
    item = [],
    describe = "锋利的剑刃对前方矩形敌人造成616%物理攻击的伤害",
    id = 0
    };
getRow(122006,20)->
    #player_skills_upgradingCfg {
    skillID = 122006,
    level = 20,
    player_level = 84,
    currency = [{1,410000}],
    skillcoin_cost = 1,
    item = [],
    describe = "锋利的剑刃对前方矩形敌人造成628%物理攻击的伤害",
    id = 0
    };
getRow(122006,21)->
    #player_skills_upgradingCfg {
    skillID = 122006,
    level = 21,
    player_level = 86,
    currency = [{1,430000}],
    skillcoin_cost = 1,
    item = [],
    describe = "锋利的剑刃对前方矩形敌人造成640%物理攻击的伤害",
    id = 0
    };
getRow(122006,22)->
    #player_skills_upgradingCfg {
    skillID = 122006,
    level = 22,
    player_level = 88,
    currency = [{1,450000}],
    skillcoin_cost = 1,
    item = [],
    describe = "锋利的剑刃对前方矩形敌人造成652%物理攻击的伤害",
    id = 0
    };
getRow(122006,23)->
    #player_skills_upgradingCfg {
    skillID = 122006,
    level = 23,
    player_level = 90,
    currency = [{1,470000}],
    skillcoin_cost = 1,
    item = [],
    describe = "锋利的剑刃对前方矩形敌人造成664%物理攻击的伤害",
    id = 0
    };
getRow(122006,24)->
    #player_skills_upgradingCfg {
    skillID = 122006,
    level = 24,
    player_level = 92,
    currency = [{1,490000}],
    skillcoin_cost = 1,
    item = [],
    describe = "锋利的剑刃对前方矩形敌人造成676%物理攻击的伤害",
    id = 0
    };
getRow(122006,25)->
    #player_skills_upgradingCfg {
    skillID = 122006,
    level = 25,
    player_level = 94,
    currency = [{1,510000}],
    skillcoin_cost = 1,
    item = [],
    describe = "锋利的剑刃对前方矩形敌人造成688%物理攻击的伤害",
    id = 0
    };
getRow(122007,1)->
    #player_skills_upgradingCfg {
    skillID = 122007,
    level = 1,
    player_level = 60,
    currency = [],
    skillcoin_cost = 1,
    item = [],
    describe = "造成3次117%物理攻击的伤害，同时恢复3%最大生命值",
    id = 0
    };
getRow(122007,2)->
    #player_skills_upgradingCfg {
    skillID = 122007,
    level = 2,
    player_level = 60,
    currency = [{1,50000}],
    skillcoin_cost = 1,
    item = [],
    describe = "造成3次121%物理攻击的伤害，同时恢复3%最大生命值",
    id = 0
    };
getRow(122007,3)->
    #player_skills_upgradingCfg {
    skillID = 122007,
    level = 3,
    player_level = 60,
    currency = [{1,70000}],
    skillcoin_cost = 1,
    item = [],
    describe = "造成3次125%物理攻击的伤害，同时恢复3%最大生命值",
    id = 0
    };
getRow(122007,4)->
    #player_skills_upgradingCfg {
    skillID = 122007,
    level = 4,
    player_level = 60,
    currency = [{1,90000}],
    skillcoin_cost = 1,
    item = [],
    describe = "造成3次129%物理攻击的伤害，同时恢复3%最大生命值",
    id = 0
    };
getRow(122007,5)->
    #player_skills_upgradingCfg {
    skillID = 122007,
    level = 5,
    player_level = 60,
    currency = [{1,110000}],
    skillcoin_cost = 1,
    item = [],
    describe = "造成3次133%物理攻击的伤害，同时恢复3%最大生命值",
    id = 0
    };
getRow(122007,6)->
    #player_skills_upgradingCfg {
    skillID = 122007,
    level = 6,
    player_level = 60,
    currency = [{1,130000}],
    skillcoin_cost = 1,
    item = [],
    describe = "造成3次137%物理攻击的伤害，同时恢复3%最大生命值",
    id = 0
    };
getRow(122007,7)->
    #player_skills_upgradingCfg {
    skillID = 122007,
    level = 7,
    player_level = 60,
    currency = [{1,150000}],
    skillcoin_cost = 1,
    item = [],
    describe = "造成3次141%物理攻击的伤害，同时恢复3%最大生命值",
    id = 0
    };
getRow(122007,8)->
    #player_skills_upgradingCfg {
    skillID = 122007,
    level = 8,
    player_level = 60,
    currency = [{1,170000}],
    skillcoin_cost = 1,
    item = [],
    describe = "造成3次145%物理攻击的伤害，同时恢复3%最大生命值",
    id = 0
    };
getRow(122007,9)->
    #player_skills_upgradingCfg {
    skillID = 122007,
    level = 9,
    player_level = 62,
    currency = [{1,190000}],
    skillcoin_cost = 1,
    item = [],
    describe = "造成3次149%物理攻击的伤害，同时恢复3%最大生命值",
    id = 0
    };
getRow(122007,10)->
    #player_skills_upgradingCfg {
    skillID = 122007,
    level = 10,
    player_level = 64,
    currency = [{1,210000}],
    skillcoin_cost = 1,
    item = [],
    describe = "造成3次153%物理攻击的伤害，同时恢复3%最大生命值",
    id = 0
    };
getRow(122007,11)->
    #player_skills_upgradingCfg {
    skillID = 122007,
    level = 11,
    player_level = 66,
    currency = [{1,230000}],
    skillcoin_cost = 1,
    item = [],
    describe = "造成3次157%物理攻击的伤害，同时恢复3%最大生命值",
    id = 0
    };
getRow(122007,12)->
    #player_skills_upgradingCfg {
    skillID = 122007,
    level = 12,
    player_level = 68,
    currency = [{1,250000}],
    skillcoin_cost = 1,
    item = [],
    describe = "造成3次161%物理攻击的伤害，同时恢复3%最大生命值",
    id = 0
    };
getRow(122007,13)->
    #player_skills_upgradingCfg {
    skillID = 122007,
    level = 13,
    player_level = 70,
    currency = [{1,270000}],
    skillcoin_cost = 1,
    item = [],
    describe = "造成3次165%物理攻击的伤害，同时恢复3%最大生命值",
    id = 0
    };
getRow(122007,14)->
    #player_skills_upgradingCfg {
    skillID = 122007,
    level = 14,
    player_level = 72,
    currency = [{1,290000}],
    skillcoin_cost = 1,
    item = [],
    describe = "造成3次169%物理攻击的伤害，同时恢复3%最大生命值",
    id = 0
    };
getRow(122007,15)->
    #player_skills_upgradingCfg {
    skillID = 122007,
    level = 15,
    player_level = 74,
    currency = [{1,310000}],
    skillcoin_cost = 1,
    item = [],
    describe = "造成3次173%物理攻击的伤害，同时恢复3%最大生命值",
    id = 0
    };
getRow(122007,16)->
    #player_skills_upgradingCfg {
    skillID = 122007,
    level = 16,
    player_level = 76,
    currency = [{1,330000}],
    skillcoin_cost = 1,
    item = [],
    describe = "造成3次177%物理攻击的伤害，同时恢复3%最大生命值",
    id = 0
    };
getRow(122007,17)->
    #player_skills_upgradingCfg {
    skillID = 122007,
    level = 17,
    player_level = 78,
    currency = [{1,350000}],
    skillcoin_cost = 1,
    item = [],
    describe = "造成3次181%物理攻击的伤害，同时恢复3%最大生命值",
    id = 0
    };
getRow(122007,18)->
    #player_skills_upgradingCfg {
    skillID = 122007,
    level = 18,
    player_level = 80,
    currency = [{1,370000}],
    skillcoin_cost = 1,
    item = [],
    describe = "造成3次185%物理攻击的伤害，同时恢复3%最大生命值",
    id = 0
    };
getRow(122007,19)->
    #player_skills_upgradingCfg {
    skillID = 122007,
    level = 19,
    player_level = 82,
    currency = [{1,390000}],
    skillcoin_cost = 1,
    item = [],
    describe = "造成3次189%物理攻击的伤害，同时恢复3%最大生命值",
    id = 0
    };
getRow(122007,20)->
    #player_skills_upgradingCfg {
    skillID = 122007,
    level = 20,
    player_level = 84,
    currency = [{1,410000}],
    skillcoin_cost = 1,
    item = [],
    describe = "造成3次193%物理攻击的伤害，同时恢复3%最大生命值",
    id = 0
    };
getRow(122007,21)->
    #player_skills_upgradingCfg {
    skillID = 122007,
    level = 21,
    player_level = 86,
    currency = [{1,430000}],
    skillcoin_cost = 1,
    item = [],
    describe = "造成3次197%物理攻击的伤害，同时恢复3%最大生命值",
    id = 0
    };
getRow(122007,22)->
    #player_skills_upgradingCfg {
    skillID = 122007,
    level = 22,
    player_level = 88,
    currency = [{1,450000}],
    skillcoin_cost = 1,
    item = [],
    describe = "造成3次201%物理攻击的伤害，同时恢复3%最大生命值",
    id = 0
    };
getRow(122007,23)->
    #player_skills_upgradingCfg {
    skillID = 122007,
    level = 23,
    player_level = 90,
    currency = [{1,470000}],
    skillcoin_cost = 1,
    item = [],
    describe = "造成3次205%物理攻击的伤害，同时恢复3%最大生命值",
    id = 0
    };
getRow(122007,24)->
    #player_skills_upgradingCfg {
    skillID = 122007,
    level = 24,
    player_level = 92,
    currency = [{1,490000}],
    skillcoin_cost = 1,
    item = [],
    describe = "造成3次209%物理攻击的伤害，同时恢复3%最大生命值",
    id = 0
    };
getRow(122007,25)->
    #player_skills_upgradingCfg {
    skillID = 122007,
    level = 25,
    player_level = 94,
    currency = [{1,510000}],
    skillcoin_cost = 1,
    item = [],
    describe = "造成3次213%物理攻击的伤害，同时恢复3%最大生命值",
    id = 0
    };
getRow(122008,1)->
    #player_skills_upgradingCfg {
    skillID = 122008,
    level = 1,
    player_level = 60,
    currency = [],
    skillcoin_cost = 1,
    item = [],
    describe = "舞动短剑高速旋转对周围敌人造成5次54%物理攻击的伤害",
    id = 0
    };
getRow(122008,2)->
    #player_skills_upgradingCfg {
    skillID = 122008,
    level = 2,
    player_level = 60,
    currency = [{1,50000}],
    skillcoin_cost = 1,
    item = [],
    describe = "舞动短剑高速旋转对周围敌人造成5次56%物理攻击的伤害",
    id = 0
    };
getRow(122008,3)->
    #player_skills_upgradingCfg {
    skillID = 122008,
    level = 3,
    player_level = 60,
    currency = [{1,70000}],
    skillcoin_cost = 1,
    item = [],
    describe = "舞动短剑高速旋转对周围敌人造成5次58%物理攻击的伤害",
    id = 0
    };
getRow(122008,4)->
    #player_skills_upgradingCfg {
    skillID = 122008,
    level = 4,
    player_level = 60,
    currency = [{1,90000}],
    skillcoin_cost = 1,
    item = [],
    describe = "舞动短剑高速旋转对周围敌人造成5次61%物理攻击的伤害",
    id = 0
    };
getRow(122008,5)->
    #player_skills_upgradingCfg {
    skillID = 122008,
    level = 5,
    player_level = 60,
    currency = [{1,110000}],
    skillcoin_cost = 1,
    item = [],
    describe = "舞动短剑高速旋转对周围敌人造成5次63%物理攻击的伤害",
    id = 0
    };
getRow(122008,6)->
    #player_skills_upgradingCfg {
    skillID = 122008,
    level = 6,
    player_level = 60,
    currency = [{1,130000}],
    skillcoin_cost = 1,
    item = [],
    describe = "舞动短剑高速旋转对周围敌人造成5次66%物理攻击的伤害",
    id = 0
    };
getRow(122008,7)->
    #player_skills_upgradingCfg {
    skillID = 122008,
    level = 7,
    player_level = 60,
    currency = [{1,150000}],
    skillcoin_cost = 1,
    item = [],
    describe = "舞动短剑高速旋转对周围敌人造成5次68%物理攻击的伤害",
    id = 0
    };
getRow(122008,8)->
    #player_skills_upgradingCfg {
    skillID = 122008,
    level = 8,
    player_level = 60,
    currency = [{1,170000}],
    skillcoin_cost = 1,
    item = [],
    describe = "舞动短剑高速旋转对周围敌人造成5次70%物理攻击的伤害",
    id = 0
    };
getRow(122008,9)->
    #player_skills_upgradingCfg {
    skillID = 122008,
    level = 9,
    player_level = 62,
    currency = [{1,190000}],
    skillcoin_cost = 1,
    item = [],
    describe = "舞动短剑高速旋转对周围敌人造成5次73%物理攻击的伤害",
    id = 0
    };
getRow(122008,10)->
    #player_skills_upgradingCfg {
    skillID = 122008,
    level = 10,
    player_level = 64,
    currency = [{1,210000}],
    skillcoin_cost = 1,
    item = [],
    describe = "舞动短剑高速旋转对周围敌人造成5次75%物理攻击的伤害",
    id = 0
    };
getRow(122008,11)->
    #player_skills_upgradingCfg {
    skillID = 122008,
    level = 11,
    player_level = 66,
    currency = [{1,230000}],
    skillcoin_cost = 1,
    item = [],
    describe = "舞动短剑高速旋转对周围敌人造成5次78%物理攻击的伤害",
    id = 0
    };
getRow(122008,12)->
    #player_skills_upgradingCfg {
    skillID = 122008,
    level = 12,
    player_level = 68,
    currency = [{1,250000}],
    skillcoin_cost = 1,
    item = [],
    describe = "舞动短剑高速旋转对周围敌人造成5次80%物理攻击的伤害",
    id = 0
    };
getRow(122008,13)->
    #player_skills_upgradingCfg {
    skillID = 122008,
    level = 13,
    player_level = 70,
    currency = [{1,270000}],
    skillcoin_cost = 1,
    item = [],
    describe = "舞动短剑高速旋转对周围敌人造成5次82%物理攻击的伤害",
    id = 0
    };
getRow(122008,14)->
    #player_skills_upgradingCfg {
    skillID = 122008,
    level = 14,
    player_level = 72,
    currency = [{1,290000}],
    skillcoin_cost = 1,
    item = [],
    describe = "舞动短剑高速旋转对周围敌人造成5次85%物理攻击的伤害",
    id = 0
    };
getRow(122008,15)->
    #player_skills_upgradingCfg {
    skillID = 122008,
    level = 15,
    player_level = 74,
    currency = [{1,310000}],
    skillcoin_cost = 1,
    item = [],
    describe = "舞动短剑高速旋转对周围敌人造成5次87%物理攻击的伤害",
    id = 0
    };
getRow(122008,16)->
    #player_skills_upgradingCfg {
    skillID = 122008,
    level = 16,
    player_level = 76,
    currency = [{1,330000}],
    skillcoin_cost = 1,
    item = [],
    describe = "舞动短剑高速旋转对周围敌人造成5次90%物理攻击的伤害",
    id = 0
    };
getRow(122008,17)->
    #player_skills_upgradingCfg {
    skillID = 122008,
    level = 17,
    player_level = 78,
    currency = [{1,350000}],
    skillcoin_cost = 1,
    item = [],
    describe = "舞动短剑高速旋转对周围敌人造成5次92%物理攻击的伤害",
    id = 0
    };
getRow(122008,18)->
    #player_skills_upgradingCfg {
    skillID = 122008,
    level = 18,
    player_level = 80,
    currency = [{1,370000}],
    skillcoin_cost = 1,
    item = [],
    describe = "舞动短剑高速旋转对周围敌人造成5次94%物理攻击的伤害",
    id = 0
    };
getRow(122008,19)->
    #player_skills_upgradingCfg {
    skillID = 122008,
    level = 19,
    player_level = 82,
    currency = [{1,390000}],
    skillcoin_cost = 1,
    item = [],
    describe = "舞动短剑高速旋转对周围敌人造成5次97%物理攻击的伤害",
    id = 0
    };
getRow(122008,20)->
    #player_skills_upgradingCfg {
    skillID = 122008,
    level = 20,
    player_level = 84,
    currency = [{1,410000}],
    skillcoin_cost = 1,
    item = [],
    describe = "舞动短剑高速旋转对周围敌人造成5次99%物理攻击的伤害",
    id = 0
    };
getRow(122008,21)->
    #player_skills_upgradingCfg {
    skillID = 122008,
    level = 21,
    player_level = 86,
    currency = [{1,430000}],
    skillcoin_cost = 1,
    item = [],
    describe = "舞动短剑高速旋转对周围敌人造成5次102%物理攻击的伤害",
    id = 0
    };
getRow(122008,22)->
    #player_skills_upgradingCfg {
    skillID = 122008,
    level = 22,
    player_level = 88,
    currency = [{1,450000}],
    skillcoin_cost = 1,
    item = [],
    describe = "舞动短剑高速旋转对周围敌人造成5次104%物理攻击的伤害",
    id = 0
    };
getRow(122008,23)->
    #player_skills_upgradingCfg {
    skillID = 122008,
    level = 23,
    player_level = 90,
    currency = [{1,470000}],
    skillcoin_cost = 1,
    item = [],
    describe = "舞动短剑高速旋转对周围敌人造成5次106%物理攻击的伤害",
    id = 0
    };
getRow(122008,24)->
    #player_skills_upgradingCfg {
    skillID = 122008,
    level = 24,
    player_level = 92,
    currency = [{1,490000}],
    skillcoin_cost = 1,
    item = [],
    describe = "舞动短剑高速旋转对周围敌人造成5次109%物理攻击的伤害",
    id = 0
    };
getRow(122008,25)->
    #player_skills_upgradingCfg {
    skillID = 122008,
    level = 25,
    player_level = 94,
    currency = [{1,510000}],
    skillcoin_cost = 1,
    item = [],
    describe = "舞动短剑高速旋转对周围敌人造成5次111%物理攻击的伤害",
    id = 0
    };
getRow(122009,1)->
    #player_skills_upgradingCfg {
    skillID = 122009,
    level = 1,
    player_level = 60,
    currency = [],
    skillcoin_cost = 1,
    item = [],
    describe = "召唤剑气对周围造成350%物理攻击的伤害，并增加自身10%爆伤等级，持续3秒",
    id = 0
    };
getRow(122009,2)->
    #player_skills_upgradingCfg {
    skillID = 122009,
    level = 2,
    player_level = 60,
    currency = [{1,50000}],
    skillcoin_cost = 1,
    item = [],
    describe = "召唤剑气对周围造成365%物理攻击的伤害，并增加自身10.4%爆伤等级，持续3秒",
    id = 0
    };
getRow(122009,3)->
    #player_skills_upgradingCfg {
    skillID = 122009,
    level = 3,
    player_level = 60,
    currency = [{1,70000}],
    skillcoin_cost = 1,
    item = [],
    describe = "召唤剑气对周围造成380%物理攻击的伤害，并增加自身10.8%爆伤等级，持续3秒",
    id = 0
    };
getRow(122009,4)->
    #player_skills_upgradingCfg {
    skillID = 122009,
    level = 4,
    player_level = 60,
    currency = [{1,90000}],
    skillcoin_cost = 1,
    item = [],
    describe = "召唤剑气对周围造成395%物理攻击的伤害，并增加自身11.2%爆伤等级，持续3秒",
    id = 0
    };
getRow(122009,5)->
    #player_skills_upgradingCfg {
    skillID = 122009,
    level = 5,
    player_level = 60,
    currency = [{1,110000}],
    skillcoin_cost = 1,
    item = [],
    describe = "召唤剑气对周围造成410%物理攻击的伤害，并增加自身11.6%爆伤等级，持续3秒",
    id = 0
    };
getRow(122009,6)->
    #player_skills_upgradingCfg {
    skillID = 122009,
    level = 6,
    player_level = 60,
    currency = [{1,130000}],
    skillcoin_cost = 1,
    item = [],
    describe = "召唤剑气对周围造成425%物理攻击的伤害，并增加自身12%爆伤等级，持续3秒",
    id = 0
    };
getRow(122009,7)->
    #player_skills_upgradingCfg {
    skillID = 122009,
    level = 7,
    player_level = 60,
    currency = [{1,150000}],
    skillcoin_cost = 1,
    item = [],
    describe = "召唤剑气对周围造成440%物理攻击的伤害，并增加自身12.4%爆伤等级，持续3秒",
    id = 0
    };
getRow(122009,8)->
    #player_skills_upgradingCfg {
    skillID = 122009,
    level = 8,
    player_level = 60,
    currency = [{1,170000}],
    skillcoin_cost = 1,
    item = [],
    describe = "召唤剑气对周围造成455%物理攻击的伤害，并增加自身12.8%爆伤等级，持续3秒",
    id = 0
    };
getRow(122009,9)->
    #player_skills_upgradingCfg {
    skillID = 122009,
    level = 9,
    player_level = 62,
    currency = [{1,190000}],
    skillcoin_cost = 1,
    item = [],
    describe = "召唤剑气对周围造成470%物理攻击的伤害，并增加自身13.2%爆伤等级，持续3秒",
    id = 0
    };
getRow(122009,10)->
    #player_skills_upgradingCfg {
    skillID = 122009,
    level = 10,
    player_level = 64,
    currency = [{1,210000}],
    skillcoin_cost = 1,
    item = [],
    describe = "召唤剑气对周围造成485%物理攻击的伤害，并增加自身13.6%爆伤等级，持续3秒",
    id = 0
    };
getRow(122009,11)->
    #player_skills_upgradingCfg {
    skillID = 122009,
    level = 11,
    player_level = 66,
    currency = [{1,230000}],
    skillcoin_cost = 1,
    item = [],
    describe = "召唤剑气对周围造成500%物理攻击的伤害，并增加自身14%爆伤等级，持续3秒",
    id = 0
    };
getRow(122009,12)->
    #player_skills_upgradingCfg {
    skillID = 122009,
    level = 12,
    player_level = 68,
    currency = [{1,250000}],
    skillcoin_cost = 1,
    item = [],
    describe = "召唤剑气对周围造成515%物理攻击的伤害，并增加自身14.4%爆伤等级，持续3秒",
    id = 0
    };
getRow(122009,13)->
    #player_skills_upgradingCfg {
    skillID = 122009,
    level = 13,
    player_level = 70,
    currency = [{1,270000}],
    skillcoin_cost = 1,
    item = [],
    describe = "召唤剑气对周围造成530%物理攻击的伤害，并增加自身14.8%爆伤等级，持续3秒",
    id = 0
    };
getRow(122009,14)->
    #player_skills_upgradingCfg {
    skillID = 122009,
    level = 14,
    player_level = 72,
    currency = [{1,290000}],
    skillcoin_cost = 1,
    item = [],
    describe = "召唤剑气对周围造成545%物理攻击的伤害，并增加自身15.2%爆伤等级，持续3秒",
    id = 0
    };
getRow(122009,15)->
    #player_skills_upgradingCfg {
    skillID = 122009,
    level = 15,
    player_level = 74,
    currency = [{1,310000}],
    skillcoin_cost = 1,
    item = [],
    describe = "召唤剑气对周围造成560%物理攻击的伤害，并增加自身15.6%爆伤等级，持续3秒",
    id = 0
    };
getRow(122009,16)->
    #player_skills_upgradingCfg {
    skillID = 122009,
    level = 16,
    player_level = 76,
    currency = [{1,330000}],
    skillcoin_cost = 1,
    item = [],
    describe = "召唤剑气对周围造成575%物理攻击的伤害，并增加自身16%爆伤等级，持续3秒",
    id = 0
    };
getRow(122009,17)->
    #player_skills_upgradingCfg {
    skillID = 122009,
    level = 17,
    player_level = 78,
    currency = [{1,350000}],
    skillcoin_cost = 1,
    item = [],
    describe = "召唤剑气对周围造成590%物理攻击的伤害，并增加自身16.4%爆伤等级，持续3秒",
    id = 0
    };
getRow(122009,18)->
    #player_skills_upgradingCfg {
    skillID = 122009,
    level = 18,
    player_level = 80,
    currency = [{1,370000}],
    skillcoin_cost = 1,
    item = [],
    describe = "召唤剑气对周围造成605%物理攻击的伤害，并增加自身16.8%爆伤等级，持续3秒",
    id = 0
    };
getRow(122009,19)->
    #player_skills_upgradingCfg {
    skillID = 122009,
    level = 19,
    player_level = 82,
    currency = [{1,390000}],
    skillcoin_cost = 1,
    item = [],
    describe = "召唤剑气对周围造成620%物理攻击的伤害，并增加自身17.2%爆伤等级，持续3秒",
    id = 0
    };
getRow(122009,20)->
    #player_skills_upgradingCfg {
    skillID = 122009,
    level = 20,
    player_level = 84,
    currency = [{1,410000}],
    skillcoin_cost = 1,
    item = [],
    describe = "召唤剑气对周围造成635%物理攻击的伤害，并增加自身17.6%爆伤等级，持续3秒",
    id = 0
    };
getRow(122009,21)->
    #player_skills_upgradingCfg {
    skillID = 122009,
    level = 21,
    player_level = 86,
    currency = [{1,430000}],
    skillcoin_cost = 1,
    item = [],
    describe = "召唤剑气对周围造成650%物理攻击的伤害，并增加自身18%爆伤等级，持续3秒",
    id = 0
    };
getRow(122009,22)->
    #player_skills_upgradingCfg {
    skillID = 122009,
    level = 22,
    player_level = 88,
    currency = [{1,450000}],
    skillcoin_cost = 1,
    item = [],
    describe = "召唤剑气对周围造成665%物理攻击的伤害，并增加自身18.4%爆伤等级，持续3秒",
    id = 0
    };
getRow(122009,23)->
    #player_skills_upgradingCfg {
    skillID = 122009,
    level = 23,
    player_level = 90,
    currency = [{1,470000}],
    skillcoin_cost = 1,
    item = [],
    describe = "召唤剑气对周围造成680%物理攻击的伤害，并增加自身18.8%爆伤等级，持续3秒",
    id = 0
    };
getRow(122009,24)->
    #player_skills_upgradingCfg {
    skillID = 122009,
    level = 24,
    player_level = 92,
    currency = [{1,490000}],
    skillcoin_cost = 1,
    item = [],
    describe = "召唤剑气对周围造成695%物理攻击的伤害，并增加自身19.2%爆伤等级，持续3秒",
    id = 0
    };
getRow(122009,25)->
    #player_skills_upgradingCfg {
    skillID = 122009,
    level = 25,
    player_level = 94,
    currency = [{1,510000}],
    skillcoin_cost = 1,
    item = [],
    describe = "召唤剑气对周围造成710%物理攻击的伤害，并增加自身19.6%爆伤等级，持续3秒",
    id = 0
    };
getRow(122010,1)->
    #player_skills_upgradingCfg {
    skillID = 122010,
    level = 1,
    player_level = 60,
    currency = [],
    skillcoin_cost = 1,
    item = [],
    describe = "召唤护身剑气对保护全体队友，增加15%物理防御，持续10分钟",
    id = 0
    };
getRow(122010,2)->
    #player_skills_upgradingCfg {
    skillID = 122010,
    level = 2,
    player_level = 60,
    currency = [{1,70000}],
    skillcoin_cost = 1,
    item = [],
    describe = "召唤护身剑气对保护全体队友，增加16%物理防御，持续10分钟",
    id = 0
    };
getRow(122010,3)->
    #player_skills_upgradingCfg {
    skillID = 122010,
    level = 3,
    player_level = 60,
    currency = [{1,110000}],
    skillcoin_cost = 1,
    item = [],
    describe = "召唤护身剑气对保护全体队友，增加17%物理防御，持续10分钟",
    id = 0
    };
getRow(122010,4)->
    #player_skills_upgradingCfg {
    skillID = 122010,
    level = 4,
    player_level = 60,
    currency = [{1,150000}],
    skillcoin_cost = 1,
    item = [],
    describe = "召唤护身剑气对保护全体队友，增加18%物理防御，持续10分钟",
    id = 0
    };
getRow(122010,5)->
    #player_skills_upgradingCfg {
    skillID = 122010,
    level = 5,
    player_level = 62,
    currency = [{1,190000}],
    skillcoin_cost = 1,
    item = [],
    describe = "召唤护身剑气对保护全体队友，增加19%物理防御，持续10分钟",
    id = 0
    };
getRow(122010,6)->
    #player_skills_upgradingCfg {
    skillID = 122010,
    level = 6,
    player_level = 66,
    currency = [{1,230000}],
    skillcoin_cost = 1,
    item = [],
    describe = "召唤护身剑气对保护全体队友，增加20%物理防御，持续10分钟",
    id = 0
    };
getRow(122010,7)->
    #player_skills_upgradingCfg {
    skillID = 122010,
    level = 7,
    player_level = 70,
    currency = [{1,270000}],
    skillcoin_cost = 1,
    item = [],
    describe = "召唤护身剑气对保护全体队友，增加21%物理防御，持续10分钟",
    id = 0
    };
getRow(122010,8)->
    #player_skills_upgradingCfg {
    skillID = 122010,
    level = 8,
    player_level = 74,
    currency = [{1,310000}],
    skillcoin_cost = 1,
    item = [],
    describe = "召唤护身剑气对保护全体队友，增加22%物理防御，持续10分钟",
    id = 0
    };
getRow(122010,9)->
    #player_skills_upgradingCfg {
    skillID = 122010,
    level = 9,
    player_level = 78,
    currency = [{1,350000}],
    skillcoin_cost = 1,
    item = [],
    describe = "召唤护身剑气对保护全体队友，增加23%物理防御，持续10分钟",
    id = 0
    };
getRow(122010,10)->
    #player_skills_upgradingCfg {
    skillID = 122010,
    level = 10,
    player_level = 82,
    currency = [{1,390000}],
    skillcoin_cost = 1,
    item = [],
    describe = "召唤护身剑气对保护全体队友，增加24%物理防御，持续10分钟",
    id = 0
    };
getRow(122010,11)->
    #player_skills_upgradingCfg {
    skillID = 122010,
    level = 11,
    player_level = 86,
    currency = [{1,430000}],
    skillcoin_cost = 1,
    item = [],
    describe = "召唤护身剑气对保护全体队友，增加25%物理防御，持续10分钟",
    id = 0
    };
getRow(122011,1)->
    #player_skills_upgradingCfg {
    skillID = 122011,
    level = 1,
    player_level = 60,
    currency = [],
    skillcoin_cost = 1,
    item = [],
    describe = "每秒恢复40%物理攻击的生命值，持续5秒",
    id = 0
    };
getRow(122011,2)->
    #player_skills_upgradingCfg {
    skillID = 122011,
    level = 2,
    player_level = 60,
    currency = [{1,70000}],
    skillcoin_cost = 1,
    item = [],
    describe = "每秒恢复41%物理攻击的生命值，持续5秒",
    id = 0
    };
getRow(122011,3)->
    #player_skills_upgradingCfg {
    skillID = 122011,
    level = 3,
    player_level = 60,
    currency = [{1,110000}],
    skillcoin_cost = 1,
    item = [],
    describe = "每秒恢复42%物理攻击的生命值，持续5秒",
    id = 0
    };
getRow(122011,4)->
    #player_skills_upgradingCfg {
    skillID = 122011,
    level = 4,
    player_level = 60,
    currency = [{1,150000}],
    skillcoin_cost = 1,
    item = [],
    describe = "每秒恢复43%物理攻击的生命值，持续5秒",
    id = 0
    };
getRow(122011,5)->
    #player_skills_upgradingCfg {
    skillID = 122011,
    level = 5,
    player_level = 62,
    currency = [{1,190000}],
    skillcoin_cost = 1,
    item = [],
    describe = "每秒恢复44%物理攻击的生命值，持续5秒",
    id = 0
    };
getRow(122011,6)->
    #player_skills_upgradingCfg {
    skillID = 122011,
    level = 6,
    player_level = 66,
    currency = [{1,230000}],
    skillcoin_cost = 1,
    item = [],
    describe = "每秒恢复45%物理攻击的生命值，持续5秒",
    id = 0
    };
getRow(122011,7)->
    #player_skills_upgradingCfg {
    skillID = 122011,
    level = 7,
    player_level = 70,
    currency = [{1,270000}],
    skillcoin_cost = 1,
    item = [],
    describe = "每秒恢复46%物理攻击的生命值，持续5秒",
    id = 0
    };
getRow(122011,8)->
    #player_skills_upgradingCfg {
    skillID = 122011,
    level = 8,
    player_level = 74,
    currency = [{1,310000}],
    skillcoin_cost = 1,
    item = [],
    describe = "每秒恢复47%物理攻击的生命值，持续5秒",
    id = 0
    };
getRow(122011,9)->
    #player_skills_upgradingCfg {
    skillID = 122011,
    level = 9,
    player_level = 78,
    currency = [{1,350000}],
    skillcoin_cost = 1,
    item = [],
    describe = "每秒恢复48%物理攻击的生命值，持续5秒",
    id = 0
    };
getRow(122011,10)->
    #player_skills_upgradingCfg {
    skillID = 122011,
    level = 10,
    player_level = 82,
    currency = [{1,390000}],
    skillcoin_cost = 1,
    item = [],
    describe = "每秒恢复49%物理攻击的生命值，持续5秒",
    id = 0
    };
getRow(122011,11)->
    #player_skills_upgradingCfg {
    skillID = 122011,
    level = 11,
    player_level = 86,
    currency = [{1,430000}],
    skillcoin_cost = 1,
    item = [],
    describe = "每秒恢复50%物理攻击的生命值，持续5秒",
    id = 0
    };
getRow(122012,1)->
    #player_skills_upgradingCfg {
    skillID = 122012,
    level = 1,
    player_level = 60,
    currency = [],
    skillcoin_cost = 1,
    item = [],
    describe = "激发自身的战意之心，增加自身的15%物理攻击，持续10秒",
    id = 0
    };
getRow(122012,2)->
    #player_skills_upgradingCfg {
    skillID = 122012,
    level = 2,
    player_level = 60,
    currency = [{1,70000}],
    skillcoin_cost = 1,
    item = [],
    describe = "激发自身的战意之心，增加自身的16%物理攻击，持续10秒",
    id = 0
    };
getRow(122012,3)->
    #player_skills_upgradingCfg {
    skillID = 122012,
    level = 3,
    player_level = 60,
    currency = [{1,110000}],
    skillcoin_cost = 1,
    item = [],
    describe = "激发自身的战意之心，增加自身的17%物理攻击，持续10秒",
    id = 0
    };
getRow(122012,4)->
    #player_skills_upgradingCfg {
    skillID = 122012,
    level = 4,
    player_level = 60,
    currency = [{1,150000}],
    skillcoin_cost = 1,
    item = [],
    describe = "激发自身的战意之心，增加自身的18%物理攻击，持续10秒",
    id = 0
    };
getRow(122012,5)->
    #player_skills_upgradingCfg {
    skillID = 122012,
    level = 5,
    player_level = 62,
    currency = [{1,190000}],
    skillcoin_cost = 1,
    item = [],
    describe = "激发自身的战意之心，增加自身的19%物理攻击，持续10秒",
    id = 0
    };
getRow(122012,6)->
    #player_skills_upgradingCfg {
    skillID = 122012,
    level = 6,
    player_level = 66,
    currency = [{1,230000}],
    skillcoin_cost = 1,
    item = [],
    describe = "激发自身的战意之心，增加自身的20%物理攻击，持续10秒",
    id = 0
    };
getRow(122012,7)->
    #player_skills_upgradingCfg {
    skillID = 122012,
    level = 7,
    player_level = 70,
    currency = [{1,270000}],
    skillcoin_cost = 1,
    item = [],
    describe = "激发自身的战意之心，增加自身的21%物理攻击，持续10秒",
    id = 0
    };
getRow(122012,8)->
    #player_skills_upgradingCfg {
    skillID = 122012,
    level = 8,
    player_level = 74,
    currency = [{1,310000}],
    skillcoin_cost = 1,
    item = [],
    describe = "激发自身的战意之心，增加自身的22%物理攻击，持续10秒",
    id = 0
    };
getRow(122012,9)->
    #player_skills_upgradingCfg {
    skillID = 122012,
    level = 9,
    player_level = 78,
    currency = [{1,350000}],
    skillcoin_cost = 1,
    item = [],
    describe = "激发自身的战意之心，增加自身的23%物理攻击，持续10秒",
    id = 0
    };
getRow(122012,10)->
    #player_skills_upgradingCfg {
    skillID = 122012,
    level = 10,
    player_level = 82,
    currency = [{1,390000}],
    skillcoin_cost = 1,
    item = [],
    describe = "激发自身的战意之心，增加自身的24%物理攻击，持续10秒",
    id = 0
    };
getRow(122012,11)->
    #player_skills_upgradingCfg {
    skillID = 122012,
    level = 11,
    player_level = 86,
    currency = [{1,430000}],
    skillcoin_cost = 1,
    item = [],
    describe = "激发自身的战意之心，增加自身的25%物理攻击，持续10秒",
    id = 0
    };
getRow(123004,1)->
    #player_skills_upgradingCfg {
    skillID = 123004,
    level = 1,
    player_level = 60,
    currency = [],
    skillcoin_cost = 1,
    item = [],
    describe = "用身体带动重剑进行回旋天舞，造成9次攻击，每次造成50%物理攻击的伤害",
    id = 0
    };
getRow(123004,2)->
    #player_skills_upgradingCfg {
    skillID = 123004,
    level = 2,
    player_level = 60,
    currency = [{1,50000}],
    skillcoin_cost = 1,
    item = [],
    describe = "用身体带动重剑进行回旋天舞，造成9次攻击，每次造成52%物理攻击的伤害",
    id = 0
    };
getRow(123004,3)->
    #player_skills_upgradingCfg {
    skillID = 123004,
    level = 3,
    player_level = 60,
    currency = [{1,70000}],
    skillcoin_cost = 1,
    item = [],
    describe = "用身体带动重剑进行回旋天舞，造成9次攻击，每次造成54%物理攻击的伤害",
    id = 0
    };
getRow(123004,4)->
    #player_skills_upgradingCfg {
    skillID = 123004,
    level = 4,
    player_level = 60,
    currency = [{1,90000}],
    skillcoin_cost = 1,
    item = [],
    describe = "用身体带动重剑进行回旋天舞，造成9次攻击，每次造成56%物理攻击的伤害",
    id = 0
    };
getRow(123004,5)->
    #player_skills_upgradingCfg {
    skillID = 123004,
    level = 5,
    player_level = 60,
    currency = [{1,110000}],
    skillcoin_cost = 1,
    item = [],
    describe = "用身体带动重剑进行回旋天舞，造成9次攻击，每次造成58%物理攻击的伤害",
    id = 0
    };
getRow(123004,6)->
    #player_skills_upgradingCfg {
    skillID = 123004,
    level = 6,
    player_level = 60,
    currency = [{1,130000}],
    skillcoin_cost = 1,
    item = [],
    describe = "用身体带动重剑进行回旋天舞，造成9次攻击，每次造成60%物理攻击的伤害",
    id = 0
    };
getRow(123004,7)->
    #player_skills_upgradingCfg {
    skillID = 123004,
    level = 7,
    player_level = 60,
    currency = [{1,150000}],
    skillcoin_cost = 1,
    item = [],
    describe = "用身体带动重剑进行回旋天舞，造成9次攻击，每次造成62%物理攻击的伤害",
    id = 0
    };
getRow(123004,8)->
    #player_skills_upgradingCfg {
    skillID = 123004,
    level = 8,
    player_level = 60,
    currency = [{1,170000}],
    skillcoin_cost = 1,
    item = [],
    describe = "用身体带动重剑进行回旋天舞，造成9次攻击，每次造成64%物理攻击的伤害",
    id = 0
    };
getRow(123004,9)->
    #player_skills_upgradingCfg {
    skillID = 123004,
    level = 9,
    player_level = 62,
    currency = [{1,190000}],
    skillcoin_cost = 1,
    item = [],
    describe = "用身体带动重剑进行回旋天舞，造成9次攻击，每次造成66%物理攻击的伤害",
    id = 0
    };
getRow(123004,10)->
    #player_skills_upgradingCfg {
    skillID = 123004,
    level = 10,
    player_level = 64,
    currency = [{1,210000}],
    skillcoin_cost = 1,
    item = [],
    describe = "用身体带动重剑进行回旋天舞，造成9次攻击，每次造成68%物理攻击的伤害",
    id = 0
    };
getRow(123004,11)->
    #player_skills_upgradingCfg {
    skillID = 123004,
    level = 11,
    player_level = 66,
    currency = [{1,230000}],
    skillcoin_cost = 1,
    item = [],
    describe = "用身体带动重剑进行回旋天舞，造成9次攻击，每次造成70%物理攻击的伤害",
    id = 0
    };
getRow(123004,12)->
    #player_skills_upgradingCfg {
    skillID = 123004,
    level = 12,
    player_level = 68,
    currency = [{1,250000}],
    skillcoin_cost = 1,
    item = [],
    describe = "用身体带动重剑进行回旋天舞，造成9次攻击，每次造成72%物理攻击的伤害",
    id = 0
    };
getRow(123004,13)->
    #player_skills_upgradingCfg {
    skillID = 123004,
    level = 13,
    player_level = 70,
    currency = [{1,270000}],
    skillcoin_cost = 1,
    item = [],
    describe = "用身体带动重剑进行回旋天舞，造成9次攻击，每次造成74%物理攻击的伤害",
    id = 0
    };
getRow(123004,14)->
    #player_skills_upgradingCfg {
    skillID = 123004,
    level = 14,
    player_level = 72,
    currency = [{1,290000}],
    skillcoin_cost = 1,
    item = [],
    describe = "用身体带动重剑进行回旋天舞，造成9次攻击，每次造成76%物理攻击的伤害",
    id = 0
    };
getRow(123004,15)->
    #player_skills_upgradingCfg {
    skillID = 123004,
    level = 15,
    player_level = 74,
    currency = [{1,310000}],
    skillcoin_cost = 1,
    item = [],
    describe = "用身体带动重剑进行回旋天舞，造成9次攻击，每次造成78%物理攻击的伤害",
    id = 0
    };
getRow(123004,16)->
    #player_skills_upgradingCfg {
    skillID = 123004,
    level = 16,
    player_level = 76,
    currency = [{1,330000}],
    skillcoin_cost = 1,
    item = [],
    describe = "用身体带动重剑进行回旋天舞，造成9次攻击，每次造成80%物理攻击的伤害",
    id = 0
    };
getRow(123004,17)->
    #player_skills_upgradingCfg {
    skillID = 123004,
    level = 17,
    player_level = 78,
    currency = [{1,350000}],
    skillcoin_cost = 1,
    item = [],
    describe = "用身体带动重剑进行回旋天舞，造成9次攻击，每次造成82%物理攻击的伤害",
    id = 0
    };
getRow(123004,18)->
    #player_skills_upgradingCfg {
    skillID = 123004,
    level = 18,
    player_level = 80,
    currency = [{1,370000}],
    skillcoin_cost = 1,
    item = [],
    describe = "用身体带动重剑进行回旋天舞，造成9次攻击，每次造成84%物理攻击的伤害",
    id = 0
    };
getRow(123004,19)->
    #player_skills_upgradingCfg {
    skillID = 123004,
    level = 19,
    player_level = 82,
    currency = [{1,390000}],
    skillcoin_cost = 1,
    item = [],
    describe = "用身体带动重剑进行回旋天舞，造成9次攻击，每次造成86%物理攻击的伤害",
    id = 0
    };
getRow(123004,20)->
    #player_skills_upgradingCfg {
    skillID = 123004,
    level = 20,
    player_level = 84,
    currency = [{1,410000}],
    skillcoin_cost = 1,
    item = [],
    describe = "用身体带动重剑进行回旋天舞，造成9次攻击，每次造成88%物理攻击的伤害",
    id = 0
    };
getRow(123004,21)->
    #player_skills_upgradingCfg {
    skillID = 123004,
    level = 21,
    player_level = 86,
    currency = [{1,430000}],
    skillcoin_cost = 1,
    item = [],
    describe = "用身体带动重剑进行回旋天舞，造成9次攻击，每次造成90%物理攻击的伤害",
    id = 0
    };
getRow(123004,22)->
    #player_skills_upgradingCfg {
    skillID = 123004,
    level = 22,
    player_level = 88,
    currency = [{1,450000}],
    skillcoin_cost = 1,
    item = [],
    describe = "用身体带动重剑进行回旋天舞，造成9次攻击，每次造成92%物理攻击的伤害",
    id = 0
    };
getRow(123004,23)->
    #player_skills_upgradingCfg {
    skillID = 123004,
    level = 23,
    player_level = 90,
    currency = [{1,470000}],
    skillcoin_cost = 1,
    item = [],
    describe = "用身体带动重剑进行回旋天舞，造成9次攻击，每次造成94%物理攻击的伤害",
    id = 0
    };
getRow(123004,24)->
    #player_skills_upgradingCfg {
    skillID = 123004,
    level = 24,
    player_level = 92,
    currency = [{1,490000}],
    skillcoin_cost = 1,
    item = [],
    describe = "用身体带动重剑进行回旋天舞，造成9次攻击，每次造成96%物理攻击的伤害",
    id = 0
    };
getRow(123004,25)->
    #player_skills_upgradingCfg {
    skillID = 123004,
    level = 25,
    player_level = 94,
    currency = [{1,510000}],
    skillcoin_cost = 1,
    item = [],
    describe = "用身体带动重剑进行回旋天舞，造成9次攻击，每次造成98%物理攻击的伤害",
    id = 0
    };
getRow(123005,1)->
    #player_skills_upgradingCfg {
    skillID = 123005,
    level = 1,
    player_level = 60,
    currency = [],
    skillcoin_cost = 1,
    item = [],
    describe = "一次狂暴的打击，造成2次200%物理攻击的伤害，并恢复伤害值20%的生命值",
    id = 0
    };
getRow(123005,2)->
    #player_skills_upgradingCfg {
    skillID = 123005,
    level = 2,
    player_level = 60,
    currency = [{1,50000}],
    skillcoin_cost = 1,
    item = [],
    describe = "一次狂暴的打击，造成2次207%物理攻击的伤害，并恢复伤害值20%的生命值",
    id = 0
    };
getRow(123005,3)->
    #player_skills_upgradingCfg {
    skillID = 123005,
    level = 3,
    player_level = 60,
    currency = [{1,70000}],
    skillcoin_cost = 1,
    item = [],
    describe = "一次狂暴的打击，造成2次214%物理攻击的伤害，并恢复伤害值20%的生命值",
    id = 0
    };
getRow(123005,4)->
    #player_skills_upgradingCfg {
    skillID = 123005,
    level = 4,
    player_level = 60,
    currency = [{1,90000}],
    skillcoin_cost = 1,
    item = [],
    describe = "一次狂暴的打击，造成2次221%物理攻击的伤害，并恢复伤害值20%的生命值",
    id = 0
    };
getRow(123005,5)->
    #player_skills_upgradingCfg {
    skillID = 123005,
    level = 5,
    player_level = 60,
    currency = [{1,110000}],
    skillcoin_cost = 1,
    item = [],
    describe = "一次狂暴的打击，造成2次228%物理攻击的伤害，并恢复伤害值20%的生命值",
    id = 0
    };
getRow(123005,6)->
    #player_skills_upgradingCfg {
    skillID = 123005,
    level = 6,
    player_level = 60,
    currency = [{1,130000}],
    skillcoin_cost = 1,
    item = [],
    describe = "一次狂暴的打击，造成2次235%物理攻击的伤害，并恢复伤害值20%的生命值",
    id = 0
    };
getRow(123005,7)->
    #player_skills_upgradingCfg {
    skillID = 123005,
    level = 7,
    player_level = 60,
    currency = [{1,150000}],
    skillcoin_cost = 1,
    item = [],
    describe = "一次狂暴的打击，造成2次242%物理攻击的伤害，并恢复伤害值20%的生命值",
    id = 0
    };
getRow(123005,8)->
    #player_skills_upgradingCfg {
    skillID = 123005,
    level = 8,
    player_level = 60,
    currency = [{1,170000}],
    skillcoin_cost = 1,
    item = [],
    describe = "一次狂暴的打击，造成2次249%物理攻击的伤害，并恢复伤害值20%的生命值",
    id = 0
    };
getRow(123005,9)->
    #player_skills_upgradingCfg {
    skillID = 123005,
    level = 9,
    player_level = 62,
    currency = [{1,190000}],
    skillcoin_cost = 1,
    item = [],
    describe = "一次狂暴的打击，造成2次256%物理攻击的伤害，并恢复伤害值20%的生命值",
    id = 0
    };
getRow(123005,10)->
    #player_skills_upgradingCfg {
    skillID = 123005,
    level = 10,
    player_level = 64,
    currency = [{1,210000}],
    skillcoin_cost = 1,
    item = [],
    describe = "一次狂暴的打击，造成2次263%物理攻击的伤害，并恢复伤害值20%的生命值",
    id = 0
    };
getRow(123005,11)->
    #player_skills_upgradingCfg {
    skillID = 123005,
    level = 11,
    player_level = 66,
    currency = [{1,230000}],
    skillcoin_cost = 1,
    item = [],
    describe = "一次狂暴的打击，造成2次270%物理攻击的伤害，并恢复伤害值20%的生命值",
    id = 0
    };
getRow(123005,12)->
    #player_skills_upgradingCfg {
    skillID = 123005,
    level = 12,
    player_level = 68,
    currency = [{1,250000}],
    skillcoin_cost = 1,
    item = [],
    describe = "一次狂暴的打击，造成2次277%物理攻击的伤害，并恢复伤害值20%的生命值",
    id = 0
    };
getRow(123005,13)->
    #player_skills_upgradingCfg {
    skillID = 123005,
    level = 13,
    player_level = 70,
    currency = [{1,270000}],
    skillcoin_cost = 1,
    item = [],
    describe = "一次狂暴的打击，造成2次284%物理攻击的伤害，并恢复伤害值20%的生命值",
    id = 0
    };
getRow(123005,14)->
    #player_skills_upgradingCfg {
    skillID = 123005,
    level = 14,
    player_level = 72,
    currency = [{1,290000}],
    skillcoin_cost = 1,
    item = [],
    describe = "一次狂暴的打击，造成2次291%物理攻击的伤害，并恢复伤害值20%的生命值",
    id = 0
    };
getRow(123005,15)->
    #player_skills_upgradingCfg {
    skillID = 123005,
    level = 15,
    player_level = 74,
    currency = [{1,310000}],
    skillcoin_cost = 1,
    item = [],
    describe = "一次狂暴的打击，造成2次298%物理攻击的伤害，并恢复伤害值20%的生命值",
    id = 0
    };
getRow(123005,16)->
    #player_skills_upgradingCfg {
    skillID = 123005,
    level = 16,
    player_level = 76,
    currency = [{1,330000}],
    skillcoin_cost = 1,
    item = [],
    describe = "一次狂暴的打击，造成2次305%物理攻击的伤害，并恢复伤害值20%的生命值",
    id = 0
    };
getRow(123005,17)->
    #player_skills_upgradingCfg {
    skillID = 123005,
    level = 17,
    player_level = 78,
    currency = [{1,350000}],
    skillcoin_cost = 1,
    item = [],
    describe = "一次狂暴的打击，造成2次312%物理攻击的伤害，并恢复伤害值20%的生命值",
    id = 0
    };
getRow(123005,18)->
    #player_skills_upgradingCfg {
    skillID = 123005,
    level = 18,
    player_level = 80,
    currency = [{1,370000}],
    skillcoin_cost = 1,
    item = [],
    describe = "一次狂暴的打击，造成2次319%物理攻击的伤害，并恢复伤害值20%的生命值",
    id = 0
    };
getRow(123005,19)->
    #player_skills_upgradingCfg {
    skillID = 123005,
    level = 19,
    player_level = 82,
    currency = [{1,390000}],
    skillcoin_cost = 1,
    item = [],
    describe = "一次狂暴的打击，造成2次326%物理攻击的伤害，并恢复伤害值20%的生命值",
    id = 0
    };
getRow(123005,20)->
    #player_skills_upgradingCfg {
    skillID = 123005,
    level = 20,
    player_level = 84,
    currency = [{1,410000}],
    skillcoin_cost = 1,
    item = [],
    describe = "一次狂暴的打击，造成2次333%物理攻击的伤害，并恢复伤害值20%的生命值",
    id = 0
    };
getRow(123005,21)->
    #player_skills_upgradingCfg {
    skillID = 123005,
    level = 21,
    player_level = 86,
    currency = [{1,430000}],
    skillcoin_cost = 1,
    item = [],
    describe = "一次狂暴的打击，造成2次340%物理攻击的伤害，并恢复伤害值20%的生命值",
    id = 0
    };
getRow(123005,22)->
    #player_skills_upgradingCfg {
    skillID = 123005,
    level = 22,
    player_level = 88,
    currency = [{1,450000}],
    skillcoin_cost = 1,
    item = [],
    describe = "一次狂暴的打击，造成2次347%物理攻击的伤害，并恢复伤害值20%的生命值",
    id = 0
    };
getRow(123005,23)->
    #player_skills_upgradingCfg {
    skillID = 123005,
    level = 23,
    player_level = 90,
    currency = [{1,470000}],
    skillcoin_cost = 1,
    item = [],
    describe = "一次狂暴的打击，造成2次354%物理攻击的伤害，并恢复伤害值20%的生命值",
    id = 0
    };
getRow(123005,24)->
    #player_skills_upgradingCfg {
    skillID = 123005,
    level = 24,
    player_level = 92,
    currency = [{1,490000}],
    skillcoin_cost = 1,
    item = [],
    describe = "一次狂暴的打击，造成2次361%物理攻击的伤害，并恢复伤害值20%的生命值",
    id = 0
    };
getRow(123005,25)->
    #player_skills_upgradingCfg {
    skillID = 123005,
    level = 25,
    player_level = 94,
    currency = [{1,510000}],
    skillcoin_cost = 1,
    item = [],
    describe = "一次狂暴的打击，造成2次368%物理攻击的伤害，并恢复伤害值20%的生命值",
    id = 0
    };
getRow(123006,1)->
    #player_skills_upgradingCfg {
    skillID = 123006,
    level = 1,
    player_level = 60,
    currency = [],
    skillcoin_cost = 1,
    item = [],
    describe = "以局部冲撞目标及周围敌方，造成350%物理攻击的伤害，并降低敌方10%的物理防御",
    id = 0
    };
getRow(123006,2)->
    #player_skills_upgradingCfg {
    skillID = 123006,
    level = 2,
    player_level = 60,
    currency = [{1,50000}],
    skillcoin_cost = 1,
    item = [],
    describe = "以局部冲撞目标及周围敌方，造成362%物理攻击的伤害，并降低敌方10.4%的物理防御",
    id = 0
    };
getRow(123006,3)->
    #player_skills_upgradingCfg {
    skillID = 123006,
    level = 3,
    player_level = 60,
    currency = [{1,70000}],
    skillcoin_cost = 1,
    item = [],
    describe = "以局部冲撞目标及周围敌方，造成374%物理攻击的伤害，并降低敌方10.8%的物理防御",
    id = 0
    };
getRow(123006,4)->
    #player_skills_upgradingCfg {
    skillID = 123006,
    level = 4,
    player_level = 60,
    currency = [{1,90000}],
    skillcoin_cost = 1,
    item = [],
    describe = "以局部冲撞目标及周围敌方，造成386%物理攻击的伤害，并降低敌方11.2%的物理防御",
    id = 0
    };
getRow(123006,5)->
    #player_skills_upgradingCfg {
    skillID = 123006,
    level = 5,
    player_level = 60,
    currency = [{1,110000}],
    skillcoin_cost = 1,
    item = [],
    describe = "以局部冲撞目标及周围敌方，造成398%物理攻击的伤害，并降低敌方11.6%的物理防御",
    id = 0
    };
getRow(123006,6)->
    #player_skills_upgradingCfg {
    skillID = 123006,
    level = 6,
    player_level = 60,
    currency = [{1,130000}],
    skillcoin_cost = 1,
    item = [],
    describe = "以局部冲撞目标及周围敌方，造成410%物理攻击的伤害，并降低敌方12%的物理防御",
    id = 0
    };
getRow(123006,7)->
    #player_skills_upgradingCfg {
    skillID = 123006,
    level = 7,
    player_level = 60,
    currency = [{1,150000}],
    skillcoin_cost = 1,
    item = [],
    describe = "以局部冲撞目标及周围敌方，造成422%物理攻击的伤害，并降低敌方12.4%的物理防御",
    id = 0
    };
getRow(123006,8)->
    #player_skills_upgradingCfg {
    skillID = 123006,
    level = 8,
    player_level = 60,
    currency = [{1,170000}],
    skillcoin_cost = 1,
    item = [],
    describe = "以局部冲撞目标及周围敌方，造成434%物理攻击的伤害，并降低敌方12.8%的物理防御",
    id = 0
    };
getRow(123006,9)->
    #player_skills_upgradingCfg {
    skillID = 123006,
    level = 9,
    player_level = 62,
    currency = [{1,190000}],
    skillcoin_cost = 1,
    item = [],
    describe = "以局部冲撞目标及周围敌方，造成446%物理攻击的伤害，并降低敌方13.2%的物理防御",
    id = 0
    };
getRow(123006,10)->
    #player_skills_upgradingCfg {
    skillID = 123006,
    level = 10,
    player_level = 64,
    currency = [{1,210000}],
    skillcoin_cost = 1,
    item = [],
    describe = "以局部冲撞目标及周围敌方，造成458%物理攻击的伤害，并降低敌方13.6%的物理防御",
    id = 0
    };
getRow(123006,11)->
    #player_skills_upgradingCfg {
    skillID = 123006,
    level = 11,
    player_level = 66,
    currency = [{1,230000}],
    skillcoin_cost = 1,
    item = [],
    describe = "以局部冲撞目标及周围敌方，造成470%物理攻击的伤害，并降低敌方14%的物理防御",
    id = 0
    };
getRow(123006,12)->
    #player_skills_upgradingCfg {
    skillID = 123006,
    level = 12,
    player_level = 68,
    currency = [{1,250000}],
    skillcoin_cost = 1,
    item = [],
    describe = "以局部冲撞目标及周围敌方，造成482%物理攻击的伤害，并降低敌方14.4%的物理防御",
    id = 0
    };
getRow(123006,13)->
    #player_skills_upgradingCfg {
    skillID = 123006,
    level = 13,
    player_level = 70,
    currency = [{1,270000}],
    skillcoin_cost = 1,
    item = [],
    describe = "以局部冲撞目标及周围敌方，造成494%物理攻击的伤害，并降低敌方14.8%的物理防御",
    id = 0
    };
getRow(123006,14)->
    #player_skills_upgradingCfg {
    skillID = 123006,
    level = 14,
    player_level = 72,
    currency = [{1,290000}],
    skillcoin_cost = 1,
    item = [],
    describe = "以局部冲撞目标及周围敌方，造成506%物理攻击的伤害，并降低敌方15.2%的物理防御",
    id = 0
    };
getRow(123006,15)->
    #player_skills_upgradingCfg {
    skillID = 123006,
    level = 15,
    player_level = 74,
    currency = [{1,310000}],
    skillcoin_cost = 1,
    item = [],
    describe = "以局部冲撞目标及周围敌方，造成518%物理攻击的伤害，并降低敌方15.6%的物理防御",
    id = 0
    };
getRow(123006,16)->
    #player_skills_upgradingCfg {
    skillID = 123006,
    level = 16,
    player_level = 76,
    currency = [{1,330000}],
    skillcoin_cost = 1,
    item = [],
    describe = "以局部冲撞目标及周围敌方，造成530%物理攻击的伤害，并降低敌方16%的物理防御",
    id = 0
    };
getRow(123006,17)->
    #player_skills_upgradingCfg {
    skillID = 123006,
    level = 17,
    player_level = 78,
    currency = [{1,350000}],
    skillcoin_cost = 1,
    item = [],
    describe = "以局部冲撞目标及周围敌方，造成542%物理攻击的伤害，并降低敌方16.4%的物理防御",
    id = 0
    };
getRow(123006,18)->
    #player_skills_upgradingCfg {
    skillID = 123006,
    level = 18,
    player_level = 80,
    currency = [{1,370000}],
    skillcoin_cost = 1,
    item = [],
    describe = "以局部冲撞目标及周围敌方，造成554%物理攻击的伤害，并降低敌方16.8%的物理防御",
    id = 0
    };
getRow(123006,19)->
    #player_skills_upgradingCfg {
    skillID = 123006,
    level = 19,
    player_level = 82,
    currency = [{1,390000}],
    skillcoin_cost = 1,
    item = [],
    describe = "以局部冲撞目标及周围敌方，造成566%物理攻击的伤害，并降低敌方17.2%的物理防御",
    id = 0
    };
getRow(123006,20)->
    #player_skills_upgradingCfg {
    skillID = 123006,
    level = 20,
    player_level = 84,
    currency = [{1,410000}],
    skillcoin_cost = 1,
    item = [],
    describe = "以局部冲撞目标及周围敌方，造成578%物理攻击的伤害，并降低敌方17.6%的物理防御",
    id = 0
    };
getRow(123006,21)->
    #player_skills_upgradingCfg {
    skillID = 123006,
    level = 21,
    player_level = 86,
    currency = [{1,430000}],
    skillcoin_cost = 1,
    item = [],
    describe = "以局部冲撞目标及周围敌方，造成590%物理攻击的伤害，并降低敌方18%的物理防御",
    id = 0
    };
getRow(123006,22)->
    #player_skills_upgradingCfg {
    skillID = 123006,
    level = 22,
    player_level = 88,
    currency = [{1,450000}],
    skillcoin_cost = 1,
    item = [],
    describe = "以局部冲撞目标及周围敌方，造成602%物理攻击的伤害，并降低敌方18.4%的物理防御",
    id = 0
    };
getRow(123006,23)->
    #player_skills_upgradingCfg {
    skillID = 123006,
    level = 23,
    player_level = 90,
    currency = [{1,470000}],
    skillcoin_cost = 1,
    item = [],
    describe = "以局部冲撞目标及周围敌方，造成614%物理攻击的伤害，并降低敌方18.8%的物理防御",
    id = 0
    };
getRow(123006,24)->
    #player_skills_upgradingCfg {
    skillID = 123006,
    level = 24,
    player_level = 92,
    currency = [{1,490000}],
    skillcoin_cost = 1,
    item = [],
    describe = "以局部冲撞目标及周围敌方，造成626%物理攻击的伤害，并降低敌方19.2%的物理防御",
    id = 0
    };
getRow(123006,25)->
    #player_skills_upgradingCfg {
    skillID = 123006,
    level = 25,
    player_level = 94,
    currency = [{1,510000}],
    skillcoin_cost = 1,
    item = [],
    describe = "以局部冲撞目标及周围敌方，造成638%物理攻击的伤害，并降低敌方19.6%的物理防御",
    id = 0
    };
getRow(123007,1)->
    #player_skills_upgradingCfg {
    skillID = 123007,
    level = 1,
    player_level = 60,
    currency = [],
    skillcoin_cost = 1,
    item = [],
    describe = "落地发起一次强力的范围攻击，造成400%物理攻击的伤害，同时增加自身4%物理攻击",
    id = 0
    };
getRow(123007,2)->
    #player_skills_upgradingCfg {
    skillID = 123007,
    level = 2,
    player_level = 60,
    currency = [{1,50000}],
    skillcoin_cost = 1,
    item = [],
    describe = "落地发起一次强力的范围攻击，造成415%物理攻击的伤害，同时增加自身4.2%物理攻击",
    id = 0
    };
getRow(123007,3)->
    #player_skills_upgradingCfg {
    skillID = 123007,
    level = 3,
    player_level = 60,
    currency = [{1,70000}],
    skillcoin_cost = 1,
    item = [],
    describe = "落地发起一次强力的范围攻击，造成430%物理攻击的伤害，同时增加自身4.4%物理攻击",
    id = 0
    };
getRow(123007,4)->
    #player_skills_upgradingCfg {
    skillID = 123007,
    level = 4,
    player_level = 60,
    currency = [{1,90000}],
    skillcoin_cost = 1,
    item = [],
    describe = "落地发起一次强力的范围攻击，造成445%物理攻击的伤害，同时增加自身4.6%物理攻击",
    id = 0
    };
getRow(123007,5)->
    #player_skills_upgradingCfg {
    skillID = 123007,
    level = 5,
    player_level = 60,
    currency = [{1,110000}],
    skillcoin_cost = 1,
    item = [],
    describe = "落地发起一次强力的范围攻击，造成460%物理攻击的伤害，同时增加自身4.8%物理攻击",
    id = 0
    };
getRow(123007,6)->
    #player_skills_upgradingCfg {
    skillID = 123007,
    level = 6,
    player_level = 60,
    currency = [{1,130000}],
    skillcoin_cost = 1,
    item = [],
    describe = "落地发起一次强力的范围攻击，造成475%物理攻击的伤害，同时增加自身5%物理攻击",
    id = 0
    };
getRow(123007,7)->
    #player_skills_upgradingCfg {
    skillID = 123007,
    level = 7,
    player_level = 60,
    currency = [{1,150000}],
    skillcoin_cost = 1,
    item = [],
    describe = "落地发起一次强力的范围攻击，造成490%物理攻击的伤害，同时增加自身5.2%物理攻击",
    id = 0
    };
getRow(123007,8)->
    #player_skills_upgradingCfg {
    skillID = 123007,
    level = 8,
    player_level = 60,
    currency = [{1,170000}],
    skillcoin_cost = 1,
    item = [],
    describe = "落地发起一次强力的范围攻击，造成505%物理攻击的伤害，同时增加自身5.4%物理攻击",
    id = 0
    };
getRow(123007,9)->
    #player_skills_upgradingCfg {
    skillID = 123007,
    level = 9,
    player_level = 62,
    currency = [{1,190000}],
    skillcoin_cost = 1,
    item = [],
    describe = "落地发起一次强力的范围攻击，造成520%物理攻击的伤害，同时增加自身5.6%物理攻击",
    id = 0
    };
getRow(123007,10)->
    #player_skills_upgradingCfg {
    skillID = 123007,
    level = 10,
    player_level = 64,
    currency = [{1,210000}],
    skillcoin_cost = 1,
    item = [],
    describe = "落地发起一次强力的范围攻击，造成535%物理攻击的伤害，同时增加自身5.8%物理攻击",
    id = 0
    };
getRow(123007,11)->
    #player_skills_upgradingCfg {
    skillID = 123007,
    level = 11,
    player_level = 66,
    currency = [{1,230000}],
    skillcoin_cost = 1,
    item = [],
    describe = "落地发起一次强力的范围攻击，造成550%物理攻击的伤害，同时增加自身6%物理攻击",
    id = 0
    };
getRow(123007,12)->
    #player_skills_upgradingCfg {
    skillID = 123007,
    level = 12,
    player_level = 68,
    currency = [{1,250000}],
    skillcoin_cost = 1,
    item = [],
    describe = "落地发起一次强力的范围攻击，造成565%物理攻击的伤害，同时增加自身6.2%物理攻击",
    id = 0
    };
getRow(123007,13)->
    #player_skills_upgradingCfg {
    skillID = 123007,
    level = 13,
    player_level = 70,
    currency = [{1,270000}],
    skillcoin_cost = 1,
    item = [],
    describe = "落地发起一次强力的范围攻击，造成580%物理攻击的伤害，同时增加自身6.4%物理攻击",
    id = 0
    };
getRow(123007,14)->
    #player_skills_upgradingCfg {
    skillID = 123007,
    level = 14,
    player_level = 72,
    currency = [{1,290000}],
    skillcoin_cost = 1,
    item = [],
    describe = "落地发起一次强力的范围攻击，造成595%物理攻击的伤害，同时增加自身6.6%物理攻击",
    id = 0
    };
getRow(123007,15)->
    #player_skills_upgradingCfg {
    skillID = 123007,
    level = 15,
    player_level = 74,
    currency = [{1,310000}],
    skillcoin_cost = 1,
    item = [],
    describe = "落地发起一次强力的范围攻击，造成610%物理攻击的伤害，同时增加自身6.8%物理攻击",
    id = 0
    };
getRow(123007,16)->
    #player_skills_upgradingCfg {
    skillID = 123007,
    level = 16,
    player_level = 76,
    currency = [{1,330000}],
    skillcoin_cost = 1,
    item = [],
    describe = "落地发起一次强力的范围攻击，造成625%物理攻击的伤害，同时增加自身7%物理攻击",
    id = 0
    };
getRow(123007,17)->
    #player_skills_upgradingCfg {
    skillID = 123007,
    level = 17,
    player_level = 78,
    currency = [{1,350000}],
    skillcoin_cost = 1,
    item = [],
    describe = "落地发起一次强力的范围攻击，造成640%物理攻击的伤害，同时增加自身7.2%物理攻击",
    id = 0
    };
getRow(123007,18)->
    #player_skills_upgradingCfg {
    skillID = 123007,
    level = 18,
    player_level = 80,
    currency = [{1,370000}],
    skillcoin_cost = 1,
    item = [],
    describe = "落地发起一次强力的范围攻击，造成655%物理攻击的伤害，同时增加自身7.4%物理攻击",
    id = 0
    };
getRow(123007,19)->
    #player_skills_upgradingCfg {
    skillID = 123007,
    level = 19,
    player_level = 82,
    currency = [{1,390000}],
    skillcoin_cost = 1,
    item = [],
    describe = "落地发起一次强力的范围攻击，造成670%物理攻击的伤害，同时增加自身7.6%物理攻击",
    id = 0
    };
getRow(123007,20)->
    #player_skills_upgradingCfg {
    skillID = 123007,
    level = 20,
    player_level = 84,
    currency = [{1,410000}],
    skillcoin_cost = 1,
    item = [],
    describe = "落地发起一次强力的范围攻击，造成685%物理攻击的伤害，同时增加自身7.8%物理攻击",
    id = 0
    };
getRow(123007,21)->
    #player_skills_upgradingCfg {
    skillID = 123007,
    level = 21,
    player_level = 86,
    currency = [{1,430000}],
    skillcoin_cost = 1,
    item = [],
    describe = "落地发起一次强力的范围攻击，造成700%物理攻击的伤害，同时增加自身8%物理攻击",
    id = 0
    };
getRow(123007,22)->
    #player_skills_upgradingCfg {
    skillID = 123007,
    level = 22,
    player_level = 88,
    currency = [{1,450000}],
    skillcoin_cost = 1,
    item = [],
    describe = "落地发起一次强力的范围攻击，造成715%物理攻击的伤害，同时增加自身8.2%物理攻击",
    id = 0
    };
getRow(123007,23)->
    #player_skills_upgradingCfg {
    skillID = 123007,
    level = 23,
    player_level = 90,
    currency = [{1,470000}],
    skillcoin_cost = 1,
    item = [],
    describe = "落地发起一次强力的范围攻击，造成730%物理攻击的伤害，同时增加自身8.4%物理攻击",
    id = 0
    };
getRow(123007,24)->
    #player_skills_upgradingCfg {
    skillID = 123007,
    level = 24,
    player_level = 92,
    currency = [{1,490000}],
    skillcoin_cost = 1,
    item = [],
    describe = "落地发起一次强力的范围攻击，造成745%物理攻击的伤害，同时增加自身8.6%物理攻击",
    id = 0
    };
getRow(123007,25)->
    #player_skills_upgradingCfg {
    skillID = 123007,
    level = 25,
    player_level = 94,
    currency = [{1,510000}],
    skillcoin_cost = 1,
    item = [],
    describe = "落地发起一次强力的范围攻击，造成760%物理攻击的伤害，同时增加自身8.8%物理攻击",
    id = 0
    };
getRow(123008,1)->
    #player_skills_upgradingCfg {
    skillID = 123008,
    level = 1,
    player_level = 60,
    currency = [],
    skillcoin_cost = 1,
    item = [],
    describe = "对前方范围敌人造成350%物理攻击的伤害，同时造成2秒的眩晕效果",
    id = 0
    };
getRow(123008,2)->
    #player_skills_upgradingCfg {
    skillID = 123008,
    level = 2,
    player_level = 60,
    currency = [{1,50000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对前方范围敌人造成362%物理攻击的伤害，同时造成2秒的眩晕效果",
    id = 0
    };
getRow(123008,3)->
    #player_skills_upgradingCfg {
    skillID = 123008,
    level = 3,
    player_level = 60,
    currency = [{1,70000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对前方范围敌人造成374%物理攻击的伤害，同时造成2秒的眩晕效果",
    id = 0
    };
getRow(123008,4)->
    #player_skills_upgradingCfg {
    skillID = 123008,
    level = 4,
    player_level = 60,
    currency = [{1,90000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对前方范围敌人造成386%物理攻击的伤害，同时造成2秒的眩晕效果",
    id = 0
    };
getRow(123008,5)->
    #player_skills_upgradingCfg {
    skillID = 123008,
    level = 5,
    player_level = 60,
    currency = [{1,110000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对前方范围敌人造成398%物理攻击的伤害，同时造成2秒的眩晕效果",
    id = 0
    };
getRow(123008,6)->
    #player_skills_upgradingCfg {
    skillID = 123008,
    level = 6,
    player_level = 60,
    currency = [{1,130000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对前方范围敌人造成410%物理攻击的伤害，同时造成2秒的眩晕效果",
    id = 0
    };
getRow(123008,7)->
    #player_skills_upgradingCfg {
    skillID = 123008,
    level = 7,
    player_level = 60,
    currency = [{1,150000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对前方范围敌人造成422%物理攻击的伤害，同时造成2秒的眩晕效果",
    id = 0
    };
getRow(123008,8)->
    #player_skills_upgradingCfg {
    skillID = 123008,
    level = 8,
    player_level = 60,
    currency = [{1,170000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对前方范围敌人造成434%物理攻击的伤害，同时造成2秒的眩晕效果",
    id = 0
    };
getRow(123008,9)->
    #player_skills_upgradingCfg {
    skillID = 123008,
    level = 9,
    player_level = 62,
    currency = [{1,190000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对前方范围敌人造成446%物理攻击的伤害，同时造成2秒的眩晕效果",
    id = 0
    };
getRow(123008,10)->
    #player_skills_upgradingCfg {
    skillID = 123008,
    level = 10,
    player_level = 64,
    currency = [{1,210000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对前方范围敌人造成458%物理攻击的伤害，同时造成2秒的眩晕效果",
    id = 0
    };
getRow(123008,11)->
    #player_skills_upgradingCfg {
    skillID = 123008,
    level = 11,
    player_level = 66,
    currency = [{1,230000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对前方范围敌人造成470%物理攻击的伤害，同时造成2秒的眩晕效果",
    id = 0
    };
getRow(123008,12)->
    #player_skills_upgradingCfg {
    skillID = 123008,
    level = 12,
    player_level = 68,
    currency = [{1,250000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对前方范围敌人造成482%物理攻击的伤害，同时造成2秒的眩晕效果",
    id = 0
    };
getRow(123008,13)->
    #player_skills_upgradingCfg {
    skillID = 123008,
    level = 13,
    player_level = 70,
    currency = [{1,270000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对前方范围敌人造成494%物理攻击的伤害，同时造成2秒的眩晕效果",
    id = 0
    };
getRow(123008,14)->
    #player_skills_upgradingCfg {
    skillID = 123008,
    level = 14,
    player_level = 72,
    currency = [{1,290000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对前方范围敌人造成506%物理攻击的伤害，同时造成2秒的眩晕效果",
    id = 0
    };
getRow(123008,15)->
    #player_skills_upgradingCfg {
    skillID = 123008,
    level = 15,
    player_level = 74,
    currency = [{1,310000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对前方范围敌人造成518%物理攻击的伤害，同时造成2秒的眩晕效果",
    id = 0
    };
getRow(123008,16)->
    #player_skills_upgradingCfg {
    skillID = 123008,
    level = 16,
    player_level = 76,
    currency = [{1,330000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对前方范围敌人造成530%物理攻击的伤害，同时造成2秒的眩晕效果",
    id = 0
    };
getRow(123008,17)->
    #player_skills_upgradingCfg {
    skillID = 123008,
    level = 17,
    player_level = 78,
    currency = [{1,350000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对前方范围敌人造成542%物理攻击的伤害，同时造成2秒的眩晕效果",
    id = 0
    };
getRow(123008,18)->
    #player_skills_upgradingCfg {
    skillID = 123008,
    level = 18,
    player_level = 80,
    currency = [{1,370000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对前方范围敌人造成554%物理攻击的伤害，同时造成2秒的眩晕效果",
    id = 0
    };
getRow(123008,19)->
    #player_skills_upgradingCfg {
    skillID = 123008,
    level = 19,
    player_level = 82,
    currency = [{1,390000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对前方范围敌人造成566%物理攻击的伤害，同时造成2秒的眩晕效果",
    id = 0
    };
getRow(123008,20)->
    #player_skills_upgradingCfg {
    skillID = 123008,
    level = 20,
    player_level = 84,
    currency = [{1,410000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对前方范围敌人造成578%物理攻击的伤害，同时造成2秒的眩晕效果",
    id = 0
    };
getRow(123008,21)->
    #player_skills_upgradingCfg {
    skillID = 123008,
    level = 21,
    player_level = 86,
    currency = [{1,430000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对前方范围敌人造成590%物理攻击的伤害，同时造成2秒的眩晕效果",
    id = 0
    };
getRow(123008,22)->
    #player_skills_upgradingCfg {
    skillID = 123008,
    level = 22,
    player_level = 88,
    currency = [{1,450000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对前方范围敌人造成602%物理攻击的伤害，同时造成2秒的眩晕效果",
    id = 0
    };
getRow(123008,23)->
    #player_skills_upgradingCfg {
    skillID = 123008,
    level = 23,
    player_level = 90,
    currency = [{1,470000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对前方范围敌人造成614%物理攻击的伤害，同时造成2秒的眩晕效果",
    id = 0
    };
getRow(123008,24)->
    #player_skills_upgradingCfg {
    skillID = 123008,
    level = 24,
    player_level = 92,
    currency = [{1,490000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对前方范围敌人造成626%物理攻击的伤害，同时造成2秒的眩晕效果",
    id = 0
    };
getRow(123008,25)->
    #player_skills_upgradingCfg {
    skillID = 123008,
    level = 25,
    player_level = 94,
    currency = [{1,510000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对前方范围敌人造成638%物理攻击的伤害，同时造成2秒的眩晕效果",
    id = 0
    };
getRow(123009,1)->
    #player_skills_upgradingCfg {
    skillID = 123009,
    level = 1,
    player_level = 60,
    currency = [],
    skillcoin_cost = 1,
    item = [],
    describe = "自身提升15%物攻，持续10秒",
    id = 0
    };
getRow(123009,2)->
    #player_skills_upgradingCfg {
    skillID = 123009,
    level = 2,
    player_level = 60,
    currency = [{1,70000}],
    skillcoin_cost = 1,
    item = [],
    describe = "自身提升16%物攻，持续10秒",
    id = 0
    };
getRow(123009,3)->
    #player_skills_upgradingCfg {
    skillID = 123009,
    level = 3,
    player_level = 60,
    currency = [{1,110000}],
    skillcoin_cost = 1,
    item = [],
    describe = "自身提升17%物攻，持续10秒",
    id = 0
    };
getRow(123009,4)->
    #player_skills_upgradingCfg {
    skillID = 123009,
    level = 4,
    player_level = 60,
    currency = [{1,150000}],
    skillcoin_cost = 1,
    item = [],
    describe = "自身提升18%物攻，持续10秒",
    id = 0
    };
getRow(123009,5)->
    #player_skills_upgradingCfg {
    skillID = 123009,
    level = 5,
    player_level = 62,
    currency = [{1,190000}],
    skillcoin_cost = 1,
    item = [],
    describe = "自身提升19%物攻，持续10秒",
    id = 0
    };
getRow(123009,6)->
    #player_skills_upgradingCfg {
    skillID = 123009,
    level = 6,
    player_level = 66,
    currency = [{1,230000}],
    skillcoin_cost = 1,
    item = [],
    describe = "自身提升20%物攻，持续10秒",
    id = 0
    };
getRow(123009,7)->
    #player_skills_upgradingCfg {
    skillID = 123009,
    level = 7,
    player_level = 70,
    currency = [{1,270000}],
    skillcoin_cost = 1,
    item = [],
    describe = "自身提升21%物攻，持续10秒",
    id = 0
    };
getRow(123009,8)->
    #player_skills_upgradingCfg {
    skillID = 123009,
    level = 8,
    player_level = 74,
    currency = [{1,310000}],
    skillcoin_cost = 1,
    item = [],
    describe = "自身提升22%物攻，持续10秒",
    id = 0
    };
getRow(123009,9)->
    #player_skills_upgradingCfg {
    skillID = 123009,
    level = 9,
    player_level = 78,
    currency = [{1,350000}],
    skillcoin_cost = 1,
    item = [],
    describe = "自身提升23%物攻，持续10秒",
    id = 0
    };
getRow(123009,10)->
    #player_skills_upgradingCfg {
    skillID = 123009,
    level = 10,
    player_level = 82,
    currency = [{1,390000}],
    skillcoin_cost = 1,
    item = [],
    describe = "自身提升24%物攻，持续10秒",
    id = 0
    };
getRow(123009,11)->
    #player_skills_upgradingCfg {
    skillID = 123009,
    level = 11,
    player_level = 86,
    currency = [{1,430000}],
    skillcoin_cost = 1,
    item = [],
    describe = "自身提升25%物攻，持续10秒",
    id = 0
    };
getRow(123010,1)->
    #player_skills_upgradingCfg {
    skillID = 123010,
    level = 1,
    player_level = 60,
    currency = [],
    skillcoin_cost = 1,
    item = [],
    describe = "背水一战，降低自身25%的生命，增加25%的物理攻击，持续10秒",
    id = 0
    };
getRow(123010,2)->
    #player_skills_upgradingCfg {
    skillID = 123010,
    level = 2,
    player_level = 60,
    currency = [{1,70000}],
    skillcoin_cost = 1,
    item = [],
    describe = "背水一战，降低自身25%的生命，增加26%的物理攻击，持续10秒",
    id = 0
    };
getRow(123010,3)->
    #player_skills_upgradingCfg {
    skillID = 123010,
    level = 3,
    player_level = 60,
    currency = [{1,110000}],
    skillcoin_cost = 1,
    item = [],
    describe = "背水一战，降低自身25%的生命，增加27%的物理攻击，持续10秒",
    id = 0
    };
getRow(123010,4)->
    #player_skills_upgradingCfg {
    skillID = 123010,
    level = 4,
    player_level = 60,
    currency = [{1,150000}],
    skillcoin_cost = 1,
    item = [],
    describe = "背水一战，降低自身25%的生命，增加28%的物理攻击，持续10秒",
    id = 0
    };
getRow(123010,5)->
    #player_skills_upgradingCfg {
    skillID = 123010,
    level = 5,
    player_level = 62,
    currency = [{1,190000}],
    skillcoin_cost = 1,
    item = [],
    describe = "背水一战，降低自身25%的生命，增加29%的物理攻击，持续10秒",
    id = 0
    };
getRow(123010,6)->
    #player_skills_upgradingCfg {
    skillID = 123010,
    level = 6,
    player_level = 66,
    currency = [{1,230000}],
    skillcoin_cost = 1,
    item = [],
    describe = "背水一战，降低自身25%的生命，增加30%的物理攻击，持续10秒",
    id = 0
    };
getRow(123010,7)->
    #player_skills_upgradingCfg {
    skillID = 123010,
    level = 7,
    player_level = 70,
    currency = [{1,270000}],
    skillcoin_cost = 1,
    item = [],
    describe = "背水一战，降低自身25%的生命，增加31%的物理攻击，持续10秒",
    id = 0
    };
getRow(123010,8)->
    #player_skills_upgradingCfg {
    skillID = 123010,
    level = 8,
    player_level = 74,
    currency = [{1,310000}],
    skillcoin_cost = 1,
    item = [],
    describe = "背水一战，降低自身25%的生命，增加32%的物理攻击，持续10秒",
    id = 0
    };
getRow(123010,9)->
    #player_skills_upgradingCfg {
    skillID = 123010,
    level = 9,
    player_level = 78,
    currency = [{1,350000}],
    skillcoin_cost = 1,
    item = [],
    describe = "背水一战，降低自身25%的生命，增加33%的物理攻击，持续10秒",
    id = 0
    };
getRow(123010,10)->
    #player_skills_upgradingCfg {
    skillID = 123010,
    level = 10,
    player_level = 82,
    currency = [{1,390000}],
    skillcoin_cost = 1,
    item = [],
    describe = "背水一战，降低自身25%的生命，增加34%的物理攻击，持续10秒",
    id = 0
    };
getRow(123010,11)->
    #player_skills_upgradingCfg {
    skillID = 123010,
    level = 11,
    player_level = 86,
    currency = [{1,430000}],
    skillcoin_cost = 1,
    item = [],
    describe = "背水一战，降低自身25%的生命，增加35%的物理攻击，持续10秒",
    id = 0
    };
getRow(123011,1)->
    #player_skills_upgradingCfg {
    skillID = 123011,
    level = 1,
    player_level = 60,
    currency = [],
    skillcoin_cost = 1,
    item = [],
    describe = "祝福队友，增强范围内队友的6%物攻，持续600秒",
    id = 0
    };
getRow(123011,2)->
    #player_skills_upgradingCfg {
    skillID = 123011,
    level = 2,
    player_level = 60,
    currency = [{1,70000}],
    skillcoin_cost = 1,
    item = [],
    describe = "祝福队友，增强范围内队友的6.6%物攻，持续600秒",
    id = 0
    };
getRow(123011,3)->
    #player_skills_upgradingCfg {
    skillID = 123011,
    level = 3,
    player_level = 60,
    currency = [{1,110000}],
    skillcoin_cost = 1,
    item = [],
    describe = "祝福队友，增强范围内队友的7.2%物攻，持续600秒",
    id = 0
    };
getRow(123011,4)->
    #player_skills_upgradingCfg {
    skillID = 123011,
    level = 4,
    player_level = 60,
    currency = [{1,150000}],
    skillcoin_cost = 1,
    item = [],
    describe = "祝福队友，增强范围内队友的7.8%物攻，持续600秒",
    id = 0
    };
getRow(123011,5)->
    #player_skills_upgradingCfg {
    skillID = 123011,
    level = 5,
    player_level = 62,
    currency = [{1,190000}],
    skillcoin_cost = 1,
    item = [],
    describe = "祝福队友，增强范围内队友的8.4%物攻，持续600秒",
    id = 0
    };
getRow(123011,6)->
    #player_skills_upgradingCfg {
    skillID = 123011,
    level = 6,
    player_level = 66,
    currency = [{1,230000}],
    skillcoin_cost = 1,
    item = [],
    describe = "祝福队友，增强范围内队友的9%物攻，持续600秒",
    id = 0
    };
getRow(123011,7)->
    #player_skills_upgradingCfg {
    skillID = 123011,
    level = 7,
    player_level = 70,
    currency = [{1,270000}],
    skillcoin_cost = 1,
    item = [],
    describe = "祝福队友，增强范围内队友的9.6%物攻，持续600秒",
    id = 0
    };
getRow(123011,8)->
    #player_skills_upgradingCfg {
    skillID = 123011,
    level = 8,
    player_level = 74,
    currency = [{1,310000}],
    skillcoin_cost = 1,
    item = [],
    describe = "祝福队友，增强范围内队友的10.2%物攻，持续600秒",
    id = 0
    };
getRow(123011,9)->
    #player_skills_upgradingCfg {
    skillID = 123011,
    level = 9,
    player_level = 78,
    currency = [{1,350000}],
    skillcoin_cost = 1,
    item = [],
    describe = "祝福队友，增强范围内队友的10.8%物攻，持续600秒",
    id = 0
    };
getRow(123011,10)->
    #player_skills_upgradingCfg {
    skillID = 123011,
    level = 10,
    player_level = 82,
    currency = [{1,390000}],
    skillcoin_cost = 1,
    item = [],
    describe = "祝福队友，增强范围内队友的11.4%物攻，持续600秒",
    id = 0
    };
getRow(123011,11)->
    #player_skills_upgradingCfg {
    skillID = 123011,
    level = 11,
    player_level = 86,
    currency = [{1,430000}],
    skillcoin_cost = 1,
    item = [],
    describe = "祝福队友，增强范围内队友的12%物攻，持续600秒",
    id = 0
    };
getRow(201000,1)->
    #player_skills_upgradingCfg {
    skillID = 201000,
    level = 1,
    player_level = 1,
    currency = [],
    skillcoin_cost = 0,
    item = [],
    describe = "普通攻击70%攻击的",
    id = 244
    };
getRow(201002,1)->
    #player_skills_upgradingCfg {
    skillID = 201002,
    level = 1,
    player_level = 1,
    currency = [],
    skillcoin_cost = 0,
    item = [],
    describe = "普通攻击80%攻击的",
    id = 245
    };
getRow(201003,1)->
    #player_skills_upgradingCfg {
    skillID = 201003,
    level = 1,
    player_level = 1,
    currency = [],
    skillcoin_cost = 0,
    item = [],
    describe = "用凝缩的风之力，对敌人造成200%魔法攻击的伤害，并将其击退",
    id = 247
    };
getRow(201003,2)->
    #player_skills_upgradingCfg {
    skillID = 201003,
    level = 2,
    player_level = 3,
    currency = [{1,4000}],
    skillcoin_cost = 1,
    item = [],
    describe = "用凝缩的风之力，对敌人造成212%魔法攻击的伤害，并将其击退",
    id = 248
    };
getRow(201003,3)->
    #player_skills_upgradingCfg {
    skillID = 201003,
    level = 3,
    player_level = 4,
    currency = [{1,6000}],
    skillcoin_cost = 1,
    item = [],
    describe = "用凝缩的风之力，对敌人造成224%魔法攻击的伤害，并将其击退",
    id = 249
    };
getRow(201003,4)->
    #player_skills_upgradingCfg {
    skillID = 201003,
    level = 4,
    player_level = 9,
    currency = [{1,12000}],
    skillcoin_cost = 1,
    item = [],
    describe = "用凝缩的风之力，对敌人造成236%魔法攻击的伤害，并将其击退",
    id = 250
    };
getRow(201003,5)->
    #player_skills_upgradingCfg {
    skillID = 201003,
    level = 5,
    player_level = 13,
    currency = [{1,15000}],
    skillcoin_cost = 1,
    item = [],
    describe = "用凝缩的风之力，对敌人造成248%魔法攻击的伤害，并将其击退",
    id = 251
    };
getRow(201003,6)->
    #player_skills_upgradingCfg {
    skillID = 201003,
    level = 6,
    player_level = 17,
    currency = [{1,20000}],
    skillcoin_cost = 1,
    item = [],
    describe = "用凝缩的风之力，对敌人造成260%魔法攻击的伤害，并将其击退",
    id = 252
    };
getRow(201004,1)->
    #player_skills_upgradingCfg {
    skillID = 201004,
    level = 1,
    player_level = 4,
    currency = [],
    skillcoin_cost = 1,
    item = [],
    describe = "向前方打出一个大火球，火球向前运动30米，接触到的目标都会受到250%魔法攻击的伤害。",
    id = 253
    };
getRow(201004,2)->
    #player_skills_upgradingCfg {
    skillID = 201004,
    level = 2,
    player_level = 7,
    currency = [{1,4000}],
    skillcoin_cost = 1,
    item = [],
    describe = "向前方打出一个大火球，火球向前运动30米，接触到的目标都会受到265%魔法攻击的伤害。",
    id = 254
    };
getRow(201004,3)->
    #player_skills_upgradingCfg {
    skillID = 201004,
    level = 3,
    player_level = 10,
    currency = [{1,6000}],
    skillcoin_cost = 1,
    item = [],
    describe = "向前方打出一个大火球，火球向前运动30米，接触到的目标都会受到280%魔法攻击的伤害。",
    id = 255
    };
getRow(201004,4)->
    #player_skills_upgradingCfg {
    skillID = 201004,
    level = 4,
    player_level = 13,
    currency = [{1,12000}],
    skillcoin_cost = 1,
    item = [],
    describe = "向前方打出一个大火球，火球向前运动30米，接触到的目标都会受到295%魔法攻击的伤害。",
    id = 256
    };
getRow(201004,5)->
    #player_skills_upgradingCfg {
    skillID = 201004,
    level = 5,
    player_level = 15,
    currency = [{1,15000}],
    skillcoin_cost = 1,
    item = [],
    describe = "向前方打出一个大火球，火球向前运动30米，接触到的目标都会受到310%魔法攻击的伤害。",
    id = 257
    };
getRow(201004,6)->
    #player_skills_upgradingCfg {
    skillID = 201004,
    level = 6,
    player_level = 18,
    currency = [{1,20000}],
    skillcoin_cost = 1,
    item = [],
    describe = "向前方打出一个大火球，火球向前运动30米，接触到的目标都会受到325%魔法攻击的伤害。",
    id = 258
    };
getRow(201005,1)->
    #player_skills_upgradingCfg {
    skillID = 201005,
    level = 1,
    player_level = 8,
    currency = [],
    skillcoin_cost = 1,
    item = [],
    describe = "向前方扇形范围撒出一片冰箭，给与敌人总计300%魔法攻击的伤害，并降低敌人的移动速度。",
    id = 259
    };
getRow(201005,2)->
    #player_skills_upgradingCfg {
    skillID = 201005,
    level = 2,
    player_level = 10,
    currency = [{1,4000}],
    skillcoin_cost = 1,
    item = [],
    describe = "向前方扇形范围撒出一片冰箭，给与敌人总计318%魔法攻击的伤害，并降低敌人的移动速度。",
    id = 260
    };
getRow(201005,3)->
    #player_skills_upgradingCfg {
    skillID = 201005,
    level = 3,
    player_level = 12,
    currency = [{1,6000}],
    skillcoin_cost = 1,
    item = [],
    describe = "向前方扇形范围撒出一片冰箭，给与敌人总计336%魔法攻击的伤害，并降低敌人的移动速度。",
    id = 261
    };
getRow(201005,4)->
    #player_skills_upgradingCfg {
    skillID = 201005,
    level = 4,
    player_level = 14,
    currency = [{1,12000}],
    skillcoin_cost = 1,
    item = [],
    describe = "向前方扇形范围撒出一片冰箭，给与敌人总计354%魔法攻击的伤害，并降低敌人的移动速度。",
    id = 262
    };
getRow(201005,5)->
    #player_skills_upgradingCfg {
    skillID = 201005,
    level = 5,
    player_level = 17,
    currency = [{1,15000}],
    skillcoin_cost = 1,
    item = [],
    describe = "向前方扇形范围撒出一片冰箭，给与敌人总计372%魔法攻击的伤害，并降低敌人的移动速度。",
    id = 263
    };
getRow(201005,6)->
    #player_skills_upgradingCfg {
    skillID = 201005,
    level = 6,
    player_level = 19,
    currency = [{1,20000}],
    skillcoin_cost = 1,
    item = [],
    describe = "向前方扇形范围撒出一片冰箭，给与敌人总计390%魔法攻击的伤害，并降低敌人的移动速度。",
    id = 264
    };
getRow(201006,1)->
    #player_skills_upgradingCfg {
    skillID = 201006,
    level = 1,
    player_level = 12,
    currency = [],
    skillcoin_cost = 1,
    item = [],
    describe = "为自己恢复225%魔法攻击的生命值。",
    id = 265
    };
getRow(201006,2)->
    #player_skills_upgradingCfg {
    skillID = 201006,
    level = 2,
    player_level = 13,
    currency = [{1,4000}],
    skillcoin_cost = 1,
    item = [],
    describe = "为自己恢复245%魔法攻击的生命值。",
    id = 266
    };
getRow(201006,3)->
    #player_skills_upgradingCfg {
    skillID = 201006,
    level = 3,
    player_level = 14,
    currency = [{1,6000}],
    skillcoin_cost = 1,
    item = [],
    describe = "为自己恢复265%魔法攻击的生命值。",
    id = 267
    };
getRow(201006,4)->
    #player_skills_upgradingCfg {
    skillID = 201006,
    level = 4,
    player_level = 15,
    currency = [{1,12000}],
    skillcoin_cost = 1,
    item = [],
    describe = "为自己恢复285%魔法攻击的生命值。",
    id = 268
    };
getRow(201006,5)->
    #player_skills_upgradingCfg {
    skillID = 201006,
    level = 5,
    player_level = 17,
    currency = [{1,15000}],
    skillcoin_cost = 1,
    item = [],
    describe = "为自己恢复305%魔法攻击的生命值。",
    id = 269
    };
getRow(201006,6)->
    #player_skills_upgradingCfg {
    skillID = 201006,
    level = 6,
    player_level = 19,
    currency = [{1,20000}],
    skillcoin_cost = 1,
    item = [],
    describe = "为自己恢复325%魔法攻击的生命值。",
    id = 270
    };
getRow(201007,1)->
    #player_skills_upgradingCfg {
    skillID = 201007,
    level = 1,
    player_level = 1,
    currency = [],
    skillcoin_cost = 0,
    item = [],
    describe = "普通攻击90%攻击的",
    id = 246
    };
getRow(211000,1)->
    #player_skills_upgradingCfg {
    skillID = 211000,
    level = 1,
    player_level = 20,
    currency = [],
    skillcoin_cost = 0,
    item = [],
    describe = "普通攻击70%攻击的",
    id = 271
    };
getRow(211001,1)->
    #player_skills_upgradingCfg {
    skillID = 211001,
    level = 1,
    player_level = 20,
    currency = [],
    skillcoin_cost = 0,
    item = [],
    describe = "普通攻击80%攻击的",
    id = 272
    };
getRow(211002,1)->
    #player_skills_upgradingCfg {
    skillID = 211002,
    level = 1,
    player_level = 20,
    currency = [],
    skillcoin_cost = 0,
    item = [],
    describe = "普通攻击100%攻击的",
    id = 273
    };
getRow(211003,1)->
    #player_skills_upgradingCfg {
    skillID = 211003,
    level = 1,
    player_level = 20,
    currency = [],
    skillcoin_cost = 0,
    item = [],
    describe = "用神圣的力量对自身自身周围敌人造成2次攻击，每次造成200%魔法攻击的伤害。",
    id = 274
    };
getRow(211003,2)->
    #player_skills_upgradingCfg {
    skillID = 211003,
    level = 2,
    player_level = 20,
    currency = [{1,10000}],
    skillcoin_cost = 1,
    item = [],
    describe = "用神圣的力量对自身自身周围敌人造成2次攻击，每次造成210%魔法攻击的伤害。",
    id = 275
    };
getRow(211003,3)->
    #player_skills_upgradingCfg {
    skillID = 211003,
    level = 3,
    player_level = 20,
    currency = [{1,15000}],
    skillcoin_cost = 1,
    item = [],
    describe = "用神圣的力量对自身自身周围敌人造成2次攻击，每次造成220%魔法攻击的伤害。",
    id = 276
    };
getRow(211003,4)->
    #player_skills_upgradingCfg {
    skillID = 211003,
    level = 4,
    player_level = 22,
    currency = [{1,20000}],
    skillcoin_cost = 1,
    item = [],
    describe = "用神圣的力量对自身自身周围敌人造成2次攻击，每次造成230%魔法攻击的伤害。",
    id = 277
    };
getRow(211003,5)->
    #player_skills_upgradingCfg {
    skillID = 211003,
    level = 5,
    player_level = 25,
    currency = [{1,25000}],
    skillcoin_cost = 1,
    item = [],
    describe = "用神圣的力量对自身自身周围敌人造成2次攻击，每次造成240%魔法攻击的伤害。",
    id = 278
    };
getRow(211003,6)->
    #player_skills_upgradingCfg {
    skillID = 211003,
    level = 6,
    player_level = 28,
    currency = [{1,30000}],
    skillcoin_cost = 1,
    item = [],
    describe = "用神圣的力量对自身自身周围敌人造成2次攻击，每次造成250%魔法攻击的伤害。",
    id = 279
    };
getRow(211003,7)->
    #player_skills_upgradingCfg {
    skillID = 211003,
    level = 7,
    player_level = 31,
    currency = [{1,35000}],
    skillcoin_cost = 1,
    item = [],
    describe = "用神圣的力量对自身自身周围敌人造成2次攻击，每次造成260%魔法攻击的伤害。",
    id = 280
    };
getRow(211003,8)->
    #player_skills_upgradingCfg {
    skillID = 211003,
    level = 8,
    player_level = 34,
    currency = [{1,40000}],
    skillcoin_cost = 1,
    item = [],
    describe = "用神圣的力量对自身自身周围敌人造成2次攻击，每次造成270%魔法攻击的伤害。",
    id = 281
    };
getRow(211003,9)->
    #player_skills_upgradingCfg {
    skillID = 211003,
    level = 9,
    player_level = 37,
    currency = [{1,45000}],
    skillcoin_cost = 1,
    item = [],
    describe = "用神圣的力量对自身自身周围敌人造成2次攻击，每次造成280%魔法攻击的伤害。",
    id = 282
    };
getRow(211003,10)->
    #player_skills_upgradingCfg {
    skillID = 211003,
    level = 10,
    player_level = 40,
    currency = [{1,50000}],
    skillcoin_cost = 1,
    item = [],
    describe = "用神圣的力量对自身自身周围敌人造成2次攻击，每次造成290%魔法攻击的伤害。",
    id = 283
    };
getRow(211003,11)->
    #player_skills_upgradingCfg {
    skillID = 211003,
    level = 11,
    player_level = 43,
    currency = [{1,55000}],
    skillcoin_cost = 1,
    item = [],
    describe = "用神圣的力量对自身自身周围敌人造成2次攻击，每次造成300%魔法攻击的伤害。",
    id = 284
    };
getRow(211003,12)->
    #player_skills_upgradingCfg {
    skillID = 211003,
    level = 12,
    player_level = 46,
    currency = [{1,60000}],
    skillcoin_cost = 1,
    item = [],
    describe = "用神圣的力量对自身自身周围敌人造成2次攻击，每次造成310%魔法攻击的伤害。",
    id = 285
    };
getRow(211003,13)->
    #player_skills_upgradingCfg {
    skillID = 211003,
    level = 13,
    player_level = 49,
    currency = [{1,65000}],
    skillcoin_cost = 1,
    item = [],
    describe = "用神圣的力量对自身自身周围敌人造成2次攻击，每次造成320%魔法攻击的伤害。",
    id = 286
    };
getRow(211003,14)->
    #player_skills_upgradingCfg {
    skillID = 211003,
    level = 14,
    player_level = 52,
    currency = [{1,70000}],
    skillcoin_cost = 1,
    item = [],
    describe = "用神圣的力量对自身自身周围敌人造成2次攻击，每次造成330%魔法攻击的伤害。",
    id = 287
    };
getRow(211003,15)->
    #player_skills_upgradingCfg {
    skillID = 211003,
    level = 15,
    player_level = 55,
    currency = [{1,75000}],
    skillcoin_cost = 1,
    item = [],
    describe = "用神圣的力量对自身自身周围敌人造成2次攻击，每次造成340%魔法攻击的伤害。",
    id = 288
    };
getRow(211004,1)->
    #player_skills_upgradingCfg {
    skillID = 211004,
    level = 1,
    player_level = 20,
    currency = [],
    skillcoin_cost = 1,
    item = [],
    describe = "对周围全体队友恢复施法者225%魔法攻击的生命值。",
    id = 289
    };
getRow(211004,2)->
    #player_skills_upgradingCfg {
    skillID = 211004,
    level = 2,
    player_level = 20,
    currency = [{1,10000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对周围全体队友恢复施法者230%魔法攻击的生命值。",
    id = 290
    };
getRow(211004,3)->
    #player_skills_upgradingCfg {
    skillID = 211004,
    level = 3,
    player_level = 20,
    currency = [{1,15000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对周围全体队友恢复施法者235%魔法攻击的生命值。",
    id = 291
    };
getRow(211004,4)->
    #player_skills_upgradingCfg {
    skillID = 211004,
    level = 4,
    player_level = 22,
    currency = [{1,20000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对周围全体队友恢复施法者240%魔法攻击的生命值。",
    id = 292
    };
getRow(211004,5)->
    #player_skills_upgradingCfg {
    skillID = 211004,
    level = 5,
    player_level = 25,
    currency = [{1,25000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对周围全体队友恢复施法者245%魔法攻击的生命值。",
    id = 293
    };
getRow(211004,6)->
    #player_skills_upgradingCfg {
    skillID = 211004,
    level = 6,
    player_level = 28,
    currency = [{1,30000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对周围全体队友恢复施法者250%魔法攻击的生命值。",
    id = 294
    };
getRow(211004,7)->
    #player_skills_upgradingCfg {
    skillID = 211004,
    level = 7,
    player_level = 31,
    currency = [{1,35000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对周围全体队友恢复施法者255%魔法攻击的生命值。",
    id = 295
    };
getRow(211004,8)->
    #player_skills_upgradingCfg {
    skillID = 211004,
    level = 8,
    player_level = 34,
    currency = [{1,40000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对周围全体队友恢复施法者260%魔法攻击的生命值。",
    id = 296
    };
getRow(211004,9)->
    #player_skills_upgradingCfg {
    skillID = 211004,
    level = 9,
    player_level = 37,
    currency = [{1,45000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对周围全体队友恢复施法者265%魔法攻击的生命值。",
    id = 297
    };
getRow(211004,10)->
    #player_skills_upgradingCfg {
    skillID = 211004,
    level = 10,
    player_level = 40,
    currency = [{1,50000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对周围全体队友恢复施法者270%魔法攻击的生命值。",
    id = 298
    };
getRow(211004,11)->
    #player_skills_upgradingCfg {
    skillID = 211004,
    level = 11,
    player_level = 43,
    currency = [{1,55000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对周围全体队友恢复施法者275%魔法攻击的生命值。",
    id = 299
    };
getRow(211004,12)->
    #player_skills_upgradingCfg {
    skillID = 211004,
    level = 12,
    player_level = 46,
    currency = [{1,60000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对周围全体队友恢复施法者280%魔法攻击的生命值。",
    id = 300
    };
getRow(211004,13)->
    #player_skills_upgradingCfg {
    skillID = 211004,
    level = 13,
    player_level = 49,
    currency = [{1,65000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对周围全体队友恢复施法者285%魔法攻击的生命值。",
    id = 301
    };
getRow(211004,14)->
    #player_skills_upgradingCfg {
    skillID = 211004,
    level = 14,
    player_level = 52,
    currency = [{1,70000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对周围全体队友恢复施法者290%魔法攻击的生命值。",
    id = 302
    };
getRow(211004,15)->
    #player_skills_upgradingCfg {
    skillID = 211004,
    level = 15,
    player_level = 55,
    currency = [{1,75000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对周围全体队友恢复施法者295%魔法攻击的生命值。",
    id = 303
    };
getRow(211005,1)->
    #player_skills_upgradingCfg {
    skillID = 211005,
    level = 1,
    player_level = 20,
    currency = [],
    skillcoin_cost = 1,
    item = [],
    describe = "降下神圣的审判，给予敌人及其10米范围内目标造成245%魔法攻击的伤害，并造成持续性魔法伤害。",
    id = 304
    };
getRow(211005,2)->
    #player_skills_upgradingCfg {
    skillID = 211005,
    level = 2,
    player_level = 20,
    currency = [{1,10000}],
    skillcoin_cost = 1,
    item = [],
    describe = "降下神圣的审判，给予敌人及其10米范围内目标造成257%魔法攻击的伤害，并造成持续性魔法伤害。",
    id = 305
    };
getRow(211005,3)->
    #player_skills_upgradingCfg {
    skillID = 211005,
    level = 3,
    player_level = 20,
    currency = [{1,15000}],
    skillcoin_cost = 1,
    item = [],
    describe = "降下神圣的审判，给予敌人及其10米范围内目标造成270%魔法攻击的伤害，并造成持续性魔法伤害。",
    id = 306
    };
getRow(211005,4)->
    #player_skills_upgradingCfg {
    skillID = 211005,
    level = 4,
    player_level = 22,
    currency = [{1,20000}],
    skillcoin_cost = 1,
    item = [],
    describe = "降下神圣的审判，给予敌人及其10米范围内目标造成282%魔法攻击的伤害，并造成持续性魔法伤害。",
    id = 307
    };
getRow(211005,5)->
    #player_skills_upgradingCfg {
    skillID = 211005,
    level = 5,
    player_level = 25,
    currency = [{1,25000}],
    skillcoin_cost = 1,
    item = [],
    describe = "降下神圣的审判，给予敌人及其10米范围内目标造成295%魔法攻击的伤害，并造成持续性魔法伤害。",
    id = 308
    };
getRow(211005,6)->
    #player_skills_upgradingCfg {
    skillID = 211005,
    level = 6,
    player_level = 28,
    currency = [{1,30000}],
    skillcoin_cost = 1,
    item = [],
    describe = "降下神圣的审判，给予敌人及其10米范围内目标造成308%魔法攻击的伤害，并造成持续性魔法伤害。",
    id = 309
    };
getRow(211005,7)->
    #player_skills_upgradingCfg {
    skillID = 211005,
    level = 7,
    player_level = 31,
    currency = [{1,35000}],
    skillcoin_cost = 1,
    item = [],
    describe = "降下神圣的审判，给予敌人及其10米范围内目标造成320%魔法攻击的伤害，并造成持续性魔法伤害。",
    id = 310
    };
getRow(211005,8)->
    #player_skills_upgradingCfg {
    skillID = 211005,
    level = 8,
    player_level = 34,
    currency = [{1,40000}],
    skillcoin_cost = 1,
    item = [],
    describe = "降下神圣的审判，给予敌人及其10米范围内目标造成333%魔法攻击的伤害，并造成持续性魔法伤害。",
    id = 311
    };
getRow(211005,9)->
    #player_skills_upgradingCfg {
    skillID = 211005,
    level = 9,
    player_level = 37,
    currency = [{1,45000}],
    skillcoin_cost = 1,
    item = [],
    describe = "降下神圣的审判，给予敌人及其10米范围内目标造成345%魔法攻击的伤害，并造成持续性魔法伤害。",
    id = 312
    };
getRow(211005,10)->
    #player_skills_upgradingCfg {
    skillID = 211005,
    level = 10,
    player_level = 40,
    currency = [{1,50000}],
    skillcoin_cost = 1,
    item = [],
    describe = "降下神圣的审判，给予敌人及其10米范围内目标造成358%魔法攻击的伤害，并造成持续性魔法伤害。",
    id = 313
    };
getRow(211005,11)->
    #player_skills_upgradingCfg {
    skillID = 211005,
    level = 11,
    player_level = 43,
    currency = [{1,55000}],
    skillcoin_cost = 1,
    item = [],
    describe = "降下神圣的审判，给予敌人及其10米范围内目标造成371%魔法攻击的伤害，并造成持续性魔法伤害。",
    id = 314
    };
getRow(211005,12)->
    #player_skills_upgradingCfg {
    skillID = 211005,
    level = 12,
    player_level = 46,
    currency = [{1,60000}],
    skillcoin_cost = 1,
    item = [],
    describe = "降下神圣的审判，给予敌人及其10米范围内目标造成383%魔法攻击的伤害，并造成持续性魔法伤害。",
    id = 315
    };
getRow(211005,13)->
    #player_skills_upgradingCfg {
    skillID = 211005,
    level = 13,
    player_level = 49,
    currency = [{1,65000}],
    skillcoin_cost = 1,
    item = [],
    describe = "降下神圣的审判，给予敌人及其10米范围内目标造成396%魔法攻击的伤害，并造成持续性魔法伤害。",
    id = 316
    };
getRow(211005,14)->
    #player_skills_upgradingCfg {
    skillID = 211005,
    level = 14,
    player_level = 52,
    currency = [{1,70000}],
    skillcoin_cost = 1,
    item = [],
    describe = "降下神圣的审判，给予敌人及其10米范围内目标造成408%魔法攻击的伤害，并造成持续性魔法伤害。",
    id = 317
    };
getRow(211005,15)->
    #player_skills_upgradingCfg {
    skillID = 211005,
    level = 15,
    player_level = 55,
    currency = [{1,75000}],
    skillcoin_cost = 1,
    item = [],
    describe = "降下神圣的审判，给予敌人及其10米范围内目标造成421%魔法攻击的伤害，并造成持续性魔法伤害。",
    id = 318
    };
getRow(211007,1)->
    #player_skills_upgradingCfg {
    skillID = 211007,
    level = 1,
    player_level = 20,
    currency = [],
    skillcoin_cost = 1,
    item = [],
    describe = "为周围全体队友持续恢复5次，每次恢复45%魔法攻击的生命值。",
    id = 319
    };
getRow(211007,2)->
    #player_skills_upgradingCfg {
    skillID = 211007,
    level = 2,
    player_level = 20,
    currency = [{1,10000}],
    skillcoin_cost = 1,
    item = [],
    describe = "为周围全体队友持续恢复5次，每次恢复46%魔法攻击的生命值。",
    id = 320
    };
getRow(211007,3)->
    #player_skills_upgradingCfg {
    skillID = 211007,
    level = 3,
    player_level = 20,
    currency = [{1,15000}],
    skillcoin_cost = 1,
    item = [],
    describe = "为周围全体队友持续恢复5次，每次恢复47%魔法攻击的生命值。",
    id = 321
    };
getRow(211007,4)->
    #player_skills_upgradingCfg {
    skillID = 211007,
    level = 4,
    player_level = 22,
    currency = [{1,20000}],
    skillcoin_cost = 1,
    item = [],
    describe = "为周围全体队友持续恢复5次，每次恢复48%魔法攻击的生命值。",
    id = 322
    };
getRow(211007,5)->
    #player_skills_upgradingCfg {
    skillID = 211007,
    level = 5,
    player_level = 25,
    currency = [{1,25000}],
    skillcoin_cost = 1,
    item = [],
    describe = "为周围全体队友持续恢复5次，每次恢复49%魔法攻击的生命值。",
    id = 323
    };
getRow(211007,6)->
    #player_skills_upgradingCfg {
    skillID = 211007,
    level = 6,
    player_level = 28,
    currency = [{1,30000}],
    skillcoin_cost = 1,
    item = [],
    describe = "为周围全体队友持续恢复5次，每次恢复50%魔法攻击的生命值。",
    id = 324
    };
getRow(211007,7)->
    #player_skills_upgradingCfg {
    skillID = 211007,
    level = 7,
    player_level = 31,
    currency = [{1,35000}],
    skillcoin_cost = 1,
    item = [],
    describe = "为周围全体队友持续恢复5次，每次恢复51%魔法攻击的生命值。",
    id = 325
    };
getRow(211007,8)->
    #player_skills_upgradingCfg {
    skillID = 211007,
    level = 8,
    player_level = 34,
    currency = [{1,40000}],
    skillcoin_cost = 1,
    item = [],
    describe = "为周围全体队友持续恢复5次，每次恢复52%魔法攻击的生命值。",
    id = 326
    };
getRow(211007,9)->
    #player_skills_upgradingCfg {
    skillID = 211007,
    level = 9,
    player_level = 37,
    currency = [{1,45000}],
    skillcoin_cost = 1,
    item = [],
    describe = "为周围全体队友持续恢复5次，每次恢复53%魔法攻击的生命值。",
    id = 327
    };
getRow(211007,10)->
    #player_skills_upgradingCfg {
    skillID = 211007,
    level = 10,
    player_level = 40,
    currency = [{1,50000}],
    skillcoin_cost = 1,
    item = [],
    describe = "为周围全体队友持续恢复5次，每次恢复54%魔法攻击的生命值。",
    id = 328
    };
getRow(211007,11)->
    #player_skills_upgradingCfg {
    skillID = 211007,
    level = 11,
    player_level = 43,
    currency = [{1,55000}],
    skillcoin_cost = 1,
    item = [],
    describe = "为周围全体队友持续恢复5次，每次恢复55%魔法攻击的生命值。",
    id = 329
    };
getRow(211007,12)->
    #player_skills_upgradingCfg {
    skillID = 211007,
    level = 12,
    player_level = 46,
    currency = [{1,60000}],
    skillcoin_cost = 1,
    item = [],
    describe = "为周围全体队友持续恢复5次，每次恢复56%魔法攻击的生命值。",
    id = 330
    };
getRow(211007,13)->
    #player_skills_upgradingCfg {
    skillID = 211007,
    level = 13,
    player_level = 49,
    currency = [{1,65000}],
    skillcoin_cost = 1,
    item = [],
    describe = "为周围全体队友持续恢复5次，每次恢复57%魔法攻击的生命值。",
    id = 331
    };
getRow(211007,14)->
    #player_skills_upgradingCfg {
    skillID = 211007,
    level = 14,
    player_level = 52,
    currency = [{1,70000}],
    skillcoin_cost = 1,
    item = [],
    describe = "为周围全体队友持续恢复5次，每次恢复58%魔法攻击的生命值。",
    id = 332
    };
getRow(211007,15)->
    #player_skills_upgradingCfg {
    skillID = 211007,
    level = 15,
    player_level = 55,
    currency = [{1,75000}],
    skillcoin_cost = 1,
    item = [],
    describe = "为周围全体队友持续恢复5次，每次恢复59%魔法攻击的生命值。",
    id = 333
    };
getRow(211008,1)->
    #player_skills_upgradingCfg {
    skillID = 211008,
    level = 1,
    player_level = 20,
    currency = [],
    skillcoin_cost = 1,
    item = [],
    describe = "解除所有debuff并瞬移到30米外，提升自身30%抗暴等级，持续5秒。",
    id = 334
    };
getRow(211008,2)->
    #player_skills_upgradingCfg {
    skillID = 211008,
    level = 2,
    player_level = 20,
    currency = [{1,10000}],
    skillcoin_cost = 1,
    item = [],
    describe = "解除所有debuff并瞬移到30米外，提升自身32%抗暴等级，持续5秒。",
    id = 335
    };
getRow(211008,3)->
    #player_skills_upgradingCfg {
    skillID = 211008,
    level = 3,
    player_level = 20,
    currency = [{1,15000}],
    skillcoin_cost = 1,
    item = [],
    describe = "解除所有debuff并瞬移到30米外，提升自身34%抗暴等级，持续5秒。",
    id = 336
    };
getRow(211008,4)->
    #player_skills_upgradingCfg {
    skillID = 211008,
    level = 4,
    player_level = 22,
    currency = [{1,20000}],
    skillcoin_cost = 1,
    item = [],
    describe = "解除所有debuff并瞬移到30米外，提升自身36%抗暴等级，持续5秒。",
    id = 337
    };
getRow(211008,5)->
    #player_skills_upgradingCfg {
    skillID = 211008,
    level = 5,
    player_level = 25,
    currency = [{1,25000}],
    skillcoin_cost = 1,
    item = [],
    describe = "解除所有debuff并瞬移到30米外，提升自身38%抗暴等级，持续5秒。",
    id = 338
    };
getRow(211008,6)->
    #player_skills_upgradingCfg {
    skillID = 211008,
    level = 6,
    player_level = 28,
    currency = [{1,30000}],
    skillcoin_cost = 1,
    item = [],
    describe = "解除所有debuff并瞬移到30米外，提升自身40%抗暴等级，持续5秒。",
    id = 334
    };
getRow(211008,7)->
    #player_skills_upgradingCfg {
    skillID = 211008,
    level = 7,
    player_level = 31,
    currency = [{1,35000}],
    skillcoin_cost = 1,
    item = [],
    describe = "解除所有debuff并瞬移到30米外，提升自身42%抗暴等级，持续5秒。",
    id = 335
    };
getRow(211008,8)->
    #player_skills_upgradingCfg {
    skillID = 211008,
    level = 8,
    player_level = 34,
    currency = [{1,40000}],
    skillcoin_cost = 1,
    item = [],
    describe = "解除所有debuff并瞬移到30米外，提升自身44%抗暴等级，持续5秒。",
    id = 336
    };
getRow(211008,9)->
    #player_skills_upgradingCfg {
    skillID = 211008,
    level = 9,
    player_level = 37,
    currency = [{1,45000}],
    skillcoin_cost = 1,
    item = [],
    describe = "解除所有debuff并瞬移到30米外，提升自身46%抗暴等级，持续5秒。",
    id = 337
    };
getRow(211008,10)->
    #player_skills_upgradingCfg {
    skillID = 211008,
    level = 10,
    player_level = 40,
    currency = [{1,50000}],
    skillcoin_cost = 1,
    item = [],
    describe = "解除所有debuff并瞬移到30米外，提升自身48%抗暴等级，持续5秒。",
    id = 338
    };
getRow(211008,11)->
    #player_skills_upgradingCfg {
    skillID = 211008,
    level = 11,
    player_level = 43,
    currency = [{1,55000}],
    skillcoin_cost = 1,
    item = [],
    describe = "解除所有debuff并瞬移到30米外，提升自身50%抗暴等级，持续5秒。",
    id = 339
    };
getRow(211009,1)->
    #player_skills_upgradingCfg {
    skillID = 211009,
    level = 1,
    player_level = 20,
    currency = [],
    skillcoin_cost = 1,
    item = [],
    describe = "增强自身与周围队友的10%魔法防御，持续10分钟",
    id = 364
    };
getRow(211009,2)->
    #player_skills_upgradingCfg {
    skillID = 211009,
    level = 2,
    player_level = 20,
    currency = [{1,10000}],
    skillcoin_cost = 1,
    item = [],
    describe = "增强自身与周围队友的11%魔法防御，持续10分钟",
    id = 365
    };
getRow(211009,3)->
    #player_skills_upgradingCfg {
    skillID = 211009,
    level = 3,
    player_level = 20,
    currency = [{1,15000}],
    skillcoin_cost = 1,
    item = [],
    describe = "增强自身与周围队友的12%魔法防御，持续10分钟",
    id = 366
    };
getRow(211009,4)->
    #player_skills_upgradingCfg {
    skillID = 211009,
    level = 4,
    player_level = 22,
    currency = [{1,20000}],
    skillcoin_cost = 1,
    item = [],
    describe = "增强自身与周围队友的13%魔法防御，持续10分钟",
    id = 367
    };
getRow(211009,5)->
    #player_skills_upgradingCfg {
    skillID = 211009,
    level = 5,
    player_level = 25,
    currency = [{1,25000}],
    skillcoin_cost = 1,
    item = [],
    describe = "增强自身与周围队友的14%魔法防御，持续10分钟",
    id = 368
    };
getRow(211009,6)->
    #player_skills_upgradingCfg {
    skillID = 211009,
    level = 6,
    player_level = 28,
    currency = [{1,30000}],
    skillcoin_cost = 1,
    item = [],
    describe = "增强自身与周围队友的15%魔法防御，持续10分钟",
    id = 364
    };
getRow(211009,7)->
    #player_skills_upgradingCfg {
    skillID = 211009,
    level = 7,
    player_level = 31,
    currency = [{1,35000}],
    skillcoin_cost = 1,
    item = [],
    describe = "增强自身与周围队友的16%魔法防御，持续10分钟",
    id = 365
    };
getRow(211009,8)->
    #player_skills_upgradingCfg {
    skillID = 211009,
    level = 8,
    player_level = 34,
    currency = [{1,40000}],
    skillcoin_cost = 1,
    item = [],
    describe = "增强自身与周围队友的17%魔法防御，持续10分钟",
    id = 366
    };
getRow(211009,9)->
    #player_skills_upgradingCfg {
    skillID = 211009,
    level = 9,
    player_level = 37,
    currency = [{1,45000}],
    skillcoin_cost = 1,
    item = [],
    describe = "增强自身与周围队友的18%魔法防御，持续10分钟",
    id = 367
    };
getRow(211009,10)->
    #player_skills_upgradingCfg {
    skillID = 211009,
    level = 10,
    player_level = 40,
    currency = [{1,50000}],
    skillcoin_cost = 1,
    item = [],
    describe = "增强自身与周围队友的19%魔法防御，持续10分钟",
    id = 368
    };
getRow(211009,11)->
    #player_skills_upgradingCfg {
    skillID = 211009,
    level = 11,
    player_level = 43,
    currency = [{1,55000}],
    skillcoin_cost = 1,
    item = [],
    describe = "增强自身与周围队友的20%魔法防御，持续10分钟",
    id = 369
    };
getRow(211013,1)->
    #player_skills_upgradingCfg {
    skillID = 211013,
    level = 1,
    player_level = 20,
    currency = [],
    skillcoin_cost = 1,
    item = [],
    describe = "自身进入不可被攻击状态，攻击力降至虚无，速度速度降低50%，持续5秒",
    id = 379
    };
getRow(211013,2)->
    #player_skills_upgradingCfg {
    skillID = 211013,
    level = 2,
    player_level = 20,
    currency = [{1,10000}],
    skillcoin_cost = 1,
    item = [],
    describe = "自身进入不可被攻击状态，攻击力降至虚无，速度速度降低45%，持续5秒",
    id = 380
    };
getRow(211013,3)->
    #player_skills_upgradingCfg {
    skillID = 211013,
    level = 3,
    player_level = 20,
    currency = [{1,15000}],
    skillcoin_cost = 1,
    item = [],
    describe = "自身进入不可被攻击状态，攻击力降至虚无，速度速度降低40%，持续5秒",
    id = 381
    };
getRow(211013,4)->
    #player_skills_upgradingCfg {
    skillID = 211013,
    level = 4,
    player_level = 22,
    currency = [{1,20000}],
    skillcoin_cost = 1,
    item = [],
    describe = "自身进入不可被攻击状态，攻击力降至虚无，速度速度降低35%，持续5秒",
    id = 382
    };
getRow(211013,5)->
    #player_skills_upgradingCfg {
    skillID = 211013,
    level = 5,
    player_level = 25,
    currency = [{1,25000}],
    skillcoin_cost = 1,
    item = [],
    describe = "自身进入不可被攻击状态，攻击力降至虚无，速度速度降低30%，持续5秒",
    id = 383
    };
getRow(211013,6)->
    #player_skills_upgradingCfg {
    skillID = 211013,
    level = 6,
    player_level = 28,
    currency = [{1,30000}],
    skillcoin_cost = 1,
    item = [],
    describe = "自身进入不可被攻击状态，攻击力降至虚无，速度速度降低25%，持续5秒",
    id = 379
    };
getRow(211013,7)->
    #player_skills_upgradingCfg {
    skillID = 211013,
    level = 7,
    player_level = 31,
    currency = [{1,35000}],
    skillcoin_cost = 1,
    item = [],
    describe = "自身进入不可被攻击状态，攻击力降至虚无，速度速度降低20%，持续5秒",
    id = 380
    };
getRow(211013,8)->
    #player_skills_upgradingCfg {
    skillID = 211013,
    level = 8,
    player_level = 34,
    currency = [{1,40000}],
    skillcoin_cost = 1,
    item = [],
    describe = "自身进入不可被攻击状态，攻击力降至虚无，速度速度降低15%，持续5秒",
    id = 381
    };
getRow(211013,9)->
    #player_skills_upgradingCfg {
    skillID = 211013,
    level = 9,
    player_level = 37,
    currency = [{1,45000}],
    skillcoin_cost = 1,
    item = [],
    describe = "自身进入不可被攻击状态，攻击力降至虚无，速度速度降低10%，持续5秒",
    id = 382
    };
getRow(211013,10)->
    #player_skills_upgradingCfg {
    skillID = 211013,
    level = 10,
    player_level = 40,
    currency = [{1,50000}],
    skillcoin_cost = 1,
    item = [],
    describe = "自身进入不可被攻击状态，攻击力降至虚无，速度速度降低5%，持续5秒",
    id = 383
    };
getRow(211013,11)->
    #player_skills_upgradingCfg {
    skillID = 211013,
    level = 11,
    player_level = 43,
    currency = [{1,55000}],
    skillcoin_cost = 1,
    item = [],
    describe = "自身进入不可攻击与不可被攻击状态，持续5秒",
    id = 384
    };
getRow(211020,1)->
    #player_skills_upgradingCfg {
    skillID = 211020,
    level = 1,
    player_level = 20,
    currency = [],
    skillcoin_cost = 1,
    item = [],
    describe = "打出一道黄色旋风，席卷前方直线目标，对目标造成300%魔法攻击的伤害，并击退目标",
    id = 349
    };
getRow(211020,2)->
    #player_skills_upgradingCfg {
    skillID = 211020,
    level = 2,
    player_level = 20,
    currency = [{1,10000}],
    skillcoin_cost = 1,
    item = [],
    describe = "打出一道黄色旋风，席卷前方直线目标，对目标造成315%魔法攻击的伤害，并击退目标",
    id = 350
    };
getRow(211020,3)->
    #player_skills_upgradingCfg {
    skillID = 211020,
    level = 3,
    player_level = 20,
    currency = [{1,15000}],
    skillcoin_cost = 1,
    item = [],
    describe = "打出一道黄色旋风，席卷前方直线目标，对目标造成330%魔法攻击的伤害，并击退目标",
    id = 351
    };
getRow(211020,4)->
    #player_skills_upgradingCfg {
    skillID = 211020,
    level = 4,
    player_level = 22,
    currency = [{1,20000}],
    skillcoin_cost = 1,
    item = [],
    describe = "打出一道黄色旋风，席卷前方直线目标，对目标造成345%魔法攻击的伤害，并击退目标",
    id = 352
    };
getRow(211020,5)->
    #player_skills_upgradingCfg {
    skillID = 211020,
    level = 5,
    player_level = 25,
    currency = [{1,25000}],
    skillcoin_cost = 1,
    item = [],
    describe = "打出一道黄色旋风，席卷前方直线目标，对目标造成360%魔法攻击的伤害，并击退目标",
    id = 353
    };
getRow(211020,6)->
    #player_skills_upgradingCfg {
    skillID = 211020,
    level = 6,
    player_level = 28,
    currency = [{1,30000}],
    skillcoin_cost = 1,
    item = [],
    describe = "打出一道黄色旋风，席卷前方直线目标，对目标造成375%魔法攻击的伤害，并击退目标",
    id = 354
    };
getRow(211020,7)->
    #player_skills_upgradingCfg {
    skillID = 211020,
    level = 7,
    player_level = 31,
    currency = [{1,35000}],
    skillcoin_cost = 1,
    item = [],
    describe = "打出一道黄色旋风，席卷前方直线目标，对目标造成390%魔法攻击的伤害，并击退目标",
    id = 355
    };
getRow(211020,8)->
    #player_skills_upgradingCfg {
    skillID = 211020,
    level = 8,
    player_level = 34,
    currency = [{1,40000}],
    skillcoin_cost = 1,
    item = [],
    describe = "打出一道黄色旋风，席卷前方直线目标，对目标造成405%魔法攻击的伤害，并击退目标",
    id = 356
    };
getRow(211020,9)->
    #player_skills_upgradingCfg {
    skillID = 211020,
    level = 9,
    player_level = 37,
    currency = [{1,45000}],
    skillcoin_cost = 1,
    item = [],
    describe = "打出一道黄色旋风，席卷前方直线目标，对目标造成420%魔法攻击的伤害，并击退目标",
    id = 357
    };
getRow(211020,10)->
    #player_skills_upgradingCfg {
    skillID = 211020,
    level = 10,
    player_level = 40,
    currency = [{1,50000}],
    skillcoin_cost = 1,
    item = [],
    describe = "打出一道黄色旋风，席卷前方直线目标，对目标造成435%魔法攻击的伤害，并击退目标",
    id = 358
    };
getRow(211020,11)->
    #player_skills_upgradingCfg {
    skillID = 211020,
    level = 11,
    player_level = 43,
    currency = [{1,55000}],
    skillcoin_cost = 1,
    item = [],
    describe = "打出一道黄色旋风，席卷前方直线目标，对目标造成450%魔法攻击的伤害，并击退目标",
    id = 359
    };
getRow(211020,12)->
    #player_skills_upgradingCfg {
    skillID = 211020,
    level = 12,
    player_level = 46,
    currency = [{1,60000}],
    skillcoin_cost = 1,
    item = [],
    describe = "打出一道黄色旋风，席卷前方直线目标，对目标造成465%魔法攻击的伤害，并击退目标",
    id = 360
    };
getRow(211020,13)->
    #player_skills_upgradingCfg {
    skillID = 211020,
    level = 13,
    player_level = 49,
    currency = [{1,65000}],
    skillcoin_cost = 1,
    item = [],
    describe = "打出一道黄色旋风，席卷前方直线目标，对目标造成480%魔法攻击的伤害，并击退目标",
    id = 361
    };
getRow(211020,14)->
    #player_skills_upgradingCfg {
    skillID = 211020,
    level = 14,
    player_level = 52,
    currency = [{1,70000}],
    skillcoin_cost = 1,
    item = [],
    describe = "打出一道黄色旋风，席卷前方直线目标，对目标造成495%魔法攻击的伤害，并击退目标",
    id = 362
    };
getRow(211020,15)->
    #player_skills_upgradingCfg {
    skillID = 211020,
    level = 15,
    player_level = 55,
    currency = [{1,75000}],
    skillcoin_cost = 1,
    item = [],
    describe = "打出一道黄色旋风，席卷前方直线目标，对目标造成510%魔法攻击的伤害，并击退目标",
    id = 363
    };
getRow(212000,1)->
    #player_skills_upgradingCfg {
    skillID = 212000,
    level = 1,
    player_level = 20,
    currency = [],
    skillcoin_cost = 0,
    item = [],
    describe = "普通攻击70%攻击的",
    id = 394
    };
getRow(212001,1)->
    #player_skills_upgradingCfg {
    skillID = 212001,
    level = 1,
    player_level = 20,
    currency = [],
    skillcoin_cost = 0,
    item = [],
    describe = "普通攻击90%攻击的",
    id = 395
    };
getRow(212002,1)->
    #player_skills_upgradingCfg {
    skillID = 212002,
    level = 1,
    player_level = 20,
    currency = [],
    skillcoin_cost = 0,
    item = [],
    describe = "普通攻击100%攻击的",
    id = 396
    };
getRow(212003,1)->
    #player_skills_upgradingCfg {
    skillID = 212003,
    level = 1,
    player_level = 20,
    currency = [],
    skillcoin_cost = 0,
    item = [],
    describe = "用浓缩的风之力，对敌人造成两次攻击，每次125%魔法攻击的伤害，并造成减速。",
    id = 397
    };
getRow(212003,2)->
    #player_skills_upgradingCfg {
    skillID = 212003,
    level = 2,
    player_level = 20,
    currency = [{1,10000}],
    skillcoin_cost = 1,
    item = [],
    describe = "用浓缩的风之力，对敌人造成两次攻击，每次131%魔法攻击的伤害，并造成减速。",
    id = 398
    };
getRow(212003,3)->
    #player_skills_upgradingCfg {
    skillID = 212003,
    level = 3,
    player_level = 20,
    currency = [{1,15000}],
    skillcoin_cost = 1,
    item = [],
    describe = "用浓缩的风之力，对敌人造成两次攻击，每次137%魔法攻击的伤害，并造成减速。",
    id = 399
    };
getRow(212003,4)->
    #player_skills_upgradingCfg {
    skillID = 212003,
    level = 4,
    player_level = 22,
    currency = [{1,20000}],
    skillcoin_cost = 1,
    item = [],
    describe = "用浓缩的风之力，对敌人造成两次攻击，每次143%魔法攻击的伤害，并造成减速。",
    id = 400
    };
getRow(212003,5)->
    #player_skills_upgradingCfg {
    skillID = 212003,
    level = 5,
    player_level = 25,
    currency = [{1,25000}],
    skillcoin_cost = 1,
    item = [],
    describe = "用浓缩的风之力，对敌人造成两次攻击，每次149%魔法攻击的伤害，并造成减速。",
    id = 401
    };
getRow(212003,6)->
    #player_skills_upgradingCfg {
    skillID = 212003,
    level = 6,
    player_level = 28,
    currency = [{1,30000}],
    skillcoin_cost = 1,
    item = [],
    describe = "用浓缩的风之力，对敌人造成两次攻击，每次155%魔法攻击的伤害，并造成减速。",
    id = 402
    };
getRow(212003,7)->
    #player_skills_upgradingCfg {
    skillID = 212003,
    level = 7,
    player_level = 31,
    currency = [{1,35000}],
    skillcoin_cost = 1,
    item = [],
    describe = "用浓缩的风之力，对敌人造成两次攻击，每次161%魔法攻击的伤害，并造成减速。",
    id = 403
    };
getRow(212003,8)->
    #player_skills_upgradingCfg {
    skillID = 212003,
    level = 8,
    player_level = 34,
    currency = [{1,40000}],
    skillcoin_cost = 1,
    item = [],
    describe = "用浓缩的风之力，对敌人造成两次攻击，每次167%魔法攻击的伤害，并造成减速。",
    id = 404
    };
getRow(212003,9)->
    #player_skills_upgradingCfg {
    skillID = 212003,
    level = 9,
    player_level = 37,
    currency = [{1,45000}],
    skillcoin_cost = 1,
    item = [],
    describe = "用浓缩的风之力，对敌人造成两次攻击，每次173%魔法攻击的伤害，并造成减速。",
    id = 405
    };
getRow(212003,10)->
    #player_skills_upgradingCfg {
    skillID = 212003,
    level = 10,
    player_level = 40,
    currency = [{1,50000}],
    skillcoin_cost = 1,
    item = [],
    describe = "用浓缩的风之力，对敌人造成两次攻击，每次179%魔法攻击的伤害，并造成减速。",
    id = 406
    };
getRow(212003,11)->
    #player_skills_upgradingCfg {
    skillID = 212003,
    level = 11,
    player_level = 43,
    currency = [{1,55000}],
    skillcoin_cost = 1,
    item = [],
    describe = "用浓缩的风之力，对敌人造成两次攻击，每次185%魔法攻击的伤害，并造成减速。",
    id = 407
    };
getRow(212003,12)->
    #player_skills_upgradingCfg {
    skillID = 212003,
    level = 12,
    player_level = 46,
    currency = [{1,60000}],
    skillcoin_cost = 1,
    item = [],
    describe = "用浓缩的风之力，对敌人造成两次攻击，每次191%魔法攻击的伤害，并造成减速。",
    id = 408
    };
getRow(212003,13)->
    #player_skills_upgradingCfg {
    skillID = 212003,
    level = 13,
    player_level = 49,
    currency = [{1,65000}],
    skillcoin_cost = 1,
    item = [],
    describe = "用浓缩的风之力，对敌人造成两次攻击，每次197%魔法攻击的伤害，并造成减速。",
    id = 409
    };
getRow(212003,14)->
    #player_skills_upgradingCfg {
    skillID = 212003,
    level = 14,
    player_level = 52,
    currency = [{1,70000}],
    skillcoin_cost = 1,
    item = [],
    describe = "用浓缩的风之力，对敌人造成两次攻击，每次203%魔法攻击的伤害，并造成减速。",
    id = 410
    };
getRow(212003,15)->
    #player_skills_upgradingCfg {
    skillID = 212003,
    level = 15,
    player_level = 55,
    currency = [{1,75000}],
    skillcoin_cost = 1,
    item = [],
    describe = "用浓缩的风之力，对敌人造成两次攻击，每次209%魔法攻击的伤害，并造成减速。",
    id = 411
    };
getRow(212004,1)->
    #player_skills_upgradingCfg {
    skillID = 212004,
    level = 1,
    player_level = 20,
    currency = [],
    skillcoin_cost = 1,
    item = [],
    describe = "用强大的火焰让敌人受到210%魔法攻击的伤害，并造成持续燃烧伤害。",
    id = 412
    };
getRow(212004,2)->
    #player_skills_upgradingCfg {
    skillID = 212004,
    level = 2,
    player_level = 20,
    currency = [{1,10000}],
    skillcoin_cost = 1,
    item = [],
    describe = "用强大的火焰让敌人受到220%魔法攻击的伤害，并造成持续燃烧伤害。",
    id = 413
    };
getRow(212004,3)->
    #player_skills_upgradingCfg {
    skillID = 212004,
    level = 3,
    player_level = 20,
    currency = [{1,15000}],
    skillcoin_cost = 1,
    item = [],
    describe = "用强大的火焰让敌人受到231%魔法攻击的伤害，并造成持续燃烧伤害。",
    id = 414
    };
getRow(212004,4)->
    #player_skills_upgradingCfg {
    skillID = 212004,
    level = 4,
    player_level = 22,
    currency = [{1,20000}],
    skillcoin_cost = 1,
    item = [],
    describe = "用强大的火焰让敌人受到242%魔法攻击的伤害，并造成持续燃烧伤害。",
    id = 415
    };
getRow(212004,5)->
    #player_skills_upgradingCfg {
    skillID = 212004,
    level = 5,
    player_level = 25,
    currency = [{1,25000}],
    skillcoin_cost = 1,
    item = [],
    describe = "用强大的火焰让敌人受到253%魔法攻击的伤害，并造成持续燃烧伤害。",
    id = 416
    };
getRow(212004,6)->
    #player_skills_upgradingCfg {
    skillID = 212004,
    level = 6,
    player_level = 28,
    currency = [{1,30000}],
    skillcoin_cost = 1,
    item = [],
    describe = "用强大的火焰让敌人受到264%魔法攻击的伤害，并造成持续燃烧伤害。",
    id = 417
    };
getRow(212004,7)->
    #player_skills_upgradingCfg {
    skillID = 212004,
    level = 7,
    player_level = 31,
    currency = [{1,35000}],
    skillcoin_cost = 1,
    item = [],
    describe = "用强大的火焰让敌人受到275%魔法攻击的伤害，并造成持续燃烧伤害。",
    id = 418
    };
getRow(212004,8)->
    #player_skills_upgradingCfg {
    skillID = 212004,
    level = 8,
    player_level = 34,
    currency = [{1,40000}],
    skillcoin_cost = 1,
    item = [],
    describe = "用强大的火焰让敌人受到286%魔法攻击的伤害，并造成持续燃烧伤害。",
    id = 419
    };
getRow(212004,9)->
    #player_skills_upgradingCfg {
    skillID = 212004,
    level = 9,
    player_level = 37,
    currency = [{1,45000}],
    skillcoin_cost = 1,
    item = [],
    describe = "用强大的火焰让敌人受到297%魔法攻击的伤害，并造成持续燃烧伤害。",
    id = 420
    };
getRow(212004,10)->
    #player_skills_upgradingCfg {
    skillID = 212004,
    level = 10,
    player_level = 40,
    currency = [{1,50000}],
    skillcoin_cost = 1,
    item = [],
    describe = "用强大的火焰让敌人受到308%魔法攻击的伤害，并造成持续燃烧伤害。",
    id = 421
    };
getRow(212004,11)->
    #player_skills_upgradingCfg {
    skillID = 212004,
    level = 11,
    player_level = 43,
    currency = [{1,55000}],
    skillcoin_cost = 1,
    item = [],
    describe = "用强大的火焰让敌人受到319%魔法攻击的伤害，并造成持续燃烧伤害。",
    id = 422
    };
getRow(212004,12)->
    #player_skills_upgradingCfg {
    skillID = 212004,
    level = 12,
    player_level = 46,
    currency = [{1,60000}],
    skillcoin_cost = 1,
    item = [],
    describe = "用强大的火焰让敌人受到330%魔法攻击的伤害，并造成持续燃烧伤害。",
    id = 423
    };
getRow(212004,13)->
    #player_skills_upgradingCfg {
    skillID = 212004,
    level = 13,
    player_level = 49,
    currency = [{1,65000}],
    skillcoin_cost = 1,
    item = [],
    describe = "用强大的火焰让敌人受到341%魔法攻击的伤害，并造成持续燃烧伤害。",
    id = 424
    };
getRow(212004,14)->
    #player_skills_upgradingCfg {
    skillID = 212004,
    level = 14,
    player_level = 52,
    currency = [{1,70000}],
    skillcoin_cost = 1,
    item = [],
    describe = "用强大的火焰让敌人受到352%魔法攻击的伤害，并造成持续燃烧伤害。",
    id = 425
    };
getRow(212004,15)->
    #player_skills_upgradingCfg {
    skillID = 212004,
    level = 15,
    player_level = 55,
    currency = [{1,75000}],
    skillcoin_cost = 1,
    item = [],
    describe = "用强大的火焰让敌人受到363%魔法攻击的伤害，并造成持续燃烧伤害。",
    id = 426
    };
getRow(212005,1)->
    #player_skills_upgradingCfg {
    skillID = 212005,
    level = 1,
    player_level = 20,
    currency = [],
    skillcoin_cost = 1,
    item = [],
    describe = "使用寒冰之力，给予敌人总计250%魔法攻击的伤害，并使敌人冻结2秒。",
    id = 427
    };
getRow(212005,2)->
    #player_skills_upgradingCfg {
    skillID = 212005,
    level = 2,
    player_level = 20,
    currency = [{1,10000}],
    skillcoin_cost = 1,
    item = [],
    describe = "使用寒冰之力，给予敌人总计262%魔法攻击的伤害，并使敌人冻结2秒。",
    id = 428
    };
getRow(212005,3)->
    #player_skills_upgradingCfg {
    skillID = 212005,
    level = 3,
    player_level = 20,
    currency = [{1,15000}],
    skillcoin_cost = 1,
    item = [],
    describe = "使用寒冰之力，给予敌人总计274%魔法攻击的伤害，并使敌人冻结2秒。",
    id = 429
    };
getRow(212005,4)->
    #player_skills_upgradingCfg {
    skillID = 212005,
    level = 4,
    player_level = 22,
    currency = [{1,20000}],
    skillcoin_cost = 1,
    item = [],
    describe = "使用寒冰之力，给予敌人总计286%魔法攻击的伤害，并使敌人冻结2秒。",
    id = 430
    };
getRow(212005,5)->
    #player_skills_upgradingCfg {
    skillID = 212005,
    level = 5,
    player_level = 25,
    currency = [{1,25000}],
    skillcoin_cost = 1,
    item = [],
    describe = "使用寒冰之力，给予敌人总计298%魔法攻击的伤害，并使敌人冻结2秒。",
    id = 431
    };
getRow(212005,6)->
    #player_skills_upgradingCfg {
    skillID = 212005,
    level = 6,
    player_level = 28,
    currency = [{1,30000}],
    skillcoin_cost = 1,
    item = [],
    describe = "使用寒冰之力，给予敌人总计310%魔法攻击的伤害，并使敌人冻结2秒。",
    id = 432
    };
getRow(212005,7)->
    #player_skills_upgradingCfg {
    skillID = 212005,
    level = 7,
    player_level = 31,
    currency = [{1,35000}],
    skillcoin_cost = 1,
    item = [],
    describe = "使用寒冰之力，给予敌人总计322%魔法攻击的伤害，并使敌人冻结2秒。",
    id = 433
    };
getRow(212005,8)->
    #player_skills_upgradingCfg {
    skillID = 212005,
    level = 8,
    player_level = 34,
    currency = [{1,40000}],
    skillcoin_cost = 1,
    item = [],
    describe = "使用寒冰之力，给予敌人总计334%魔法攻击的伤害，并使敌人冻结2秒。",
    id = 434
    };
getRow(212005,9)->
    #player_skills_upgradingCfg {
    skillID = 212005,
    level = 9,
    player_level = 37,
    currency = [{1,45000}],
    skillcoin_cost = 1,
    item = [],
    describe = "使用寒冰之力，给予敌人总计346%魔法攻击的伤害，并使敌人冻结2秒。",
    id = 435
    };
getRow(212005,10)->
    #player_skills_upgradingCfg {
    skillID = 212005,
    level = 10,
    player_level = 40,
    currency = [{1,50000}],
    skillcoin_cost = 1,
    item = [],
    describe = "使用寒冰之力，给予敌人总计358%魔法攻击的伤害，并使敌人冻结2秒。",
    id = 436
    };
getRow(212005,11)->
    #player_skills_upgradingCfg {
    skillID = 212005,
    level = 11,
    player_level = 43,
    currency = [{1,55000}],
    skillcoin_cost = 1,
    item = [],
    describe = "使用寒冰之力，给予敌人总计370%魔法攻击的伤害，并使敌人冻结2秒。",
    id = 437
    };
getRow(212005,12)->
    #player_skills_upgradingCfg {
    skillID = 212005,
    level = 12,
    player_level = 46,
    currency = [{1,60000}],
    skillcoin_cost = 1,
    item = [],
    describe = "使用寒冰之力，给予敌人总计382%魔法攻击的伤害，并使敌人冻结2秒。",
    id = 438
    };
getRow(212005,13)->
    #player_skills_upgradingCfg {
    skillID = 212005,
    level = 13,
    player_level = 49,
    currency = [{1,65000}],
    skillcoin_cost = 1,
    item = [],
    describe = "使用寒冰之力，给予敌人总计394%魔法攻击的伤害，并使敌人冻结2秒。",
    id = 439
    };
getRow(212005,14)->
    #player_skills_upgradingCfg {
    skillID = 212005,
    level = 14,
    player_level = 52,
    currency = [{1,70000}],
    skillcoin_cost = 1,
    item = [],
    describe = "使用寒冰之力，给予敌人总计406%魔法攻击的伤害，并使敌人冻结2秒。",
    id = 440
    };
getRow(212005,15)->
    #player_skills_upgradingCfg {
    skillID = 212005,
    level = 15,
    player_level = 55,
    currency = [{1,75000}],
    skillcoin_cost = 1,
    item = [],
    describe = "使用寒冰之力，给予敌人总计418%魔法攻击的伤害，并使敌人冻结2秒。",
    id = 441
    };
getRow(212006,1)->
    #player_skills_upgradingCfg {
    skillID = 212006,
    level = 1,
    player_level = 20,
    currency = [],
    skillcoin_cost = 1,
    item = [],
    describe = "使用冰箭攻击敌人，造成总计350%魔法攻击的伤害，并降低敌人的速度。",
    id = 442
    };
getRow(212006,2)->
    #player_skills_upgradingCfg {
    skillID = 212006,
    level = 2,
    player_level = 20,
    currency = [{1,10000}],
    skillcoin_cost = 1,
    item = [],
    describe = "使用冰箭攻击敌人，造成总计370%魔法攻击的伤害，并降低敌人的速度。",
    id = 443
    };
getRow(212006,3)->
    #player_skills_upgradingCfg {
    skillID = 212006,
    level = 3,
    player_level = 20,
    currency = [{1,15000}],
    skillcoin_cost = 1,
    item = [],
    describe = "使用冰箭攻击敌人，造成总计390%魔法攻击的伤害，并降低敌人的速度。",
    id = 444
    };
getRow(212006,4)->
    #player_skills_upgradingCfg {
    skillID = 212006,
    level = 4,
    player_level = 22,
    currency = [{1,20000}],
    skillcoin_cost = 1,
    item = [],
    describe = "使用冰箭攻击敌人，造成总计410%魔法攻击的伤害，并降低敌人的速度。",
    id = 445
    };
getRow(212006,5)->
    #player_skills_upgradingCfg {
    skillID = 212006,
    level = 5,
    player_level = 25,
    currency = [{1,25000}],
    skillcoin_cost = 1,
    item = [],
    describe = "使用冰箭攻击敌人，造成总计430%魔法攻击的伤害，并降低敌人的速度。",
    id = 446
    };
getRow(212006,6)->
    #player_skills_upgradingCfg {
    skillID = 212006,
    level = 6,
    player_level = 28,
    currency = [{1,30000}],
    skillcoin_cost = 1,
    item = [],
    describe = "使用冰箭攻击敌人，造成总计450%魔法攻击的伤害，并降低敌人的速度。",
    id = 447
    };
getRow(212006,7)->
    #player_skills_upgradingCfg {
    skillID = 212006,
    level = 7,
    player_level = 31,
    currency = [{1,35000}],
    skillcoin_cost = 1,
    item = [],
    describe = "使用冰箭攻击敌人，造成总计470%魔法攻击的伤害，并降低敌人的速度。",
    id = 448
    };
getRow(212006,8)->
    #player_skills_upgradingCfg {
    skillID = 212006,
    level = 8,
    player_level = 34,
    currency = [{1,40000}],
    skillcoin_cost = 1,
    item = [],
    describe = "使用冰箭攻击敌人，造成总计490%魔法攻击的伤害，并降低敌人的速度。",
    id = 449
    };
getRow(212006,9)->
    #player_skills_upgradingCfg {
    skillID = 212006,
    level = 9,
    player_level = 37,
    currency = [{1,45000}],
    skillcoin_cost = 1,
    item = [],
    describe = "使用冰箭攻击敌人，造成总计510%魔法攻击的伤害，并降低敌人的速度。",
    id = 450
    };
getRow(212006,10)->
    #player_skills_upgradingCfg {
    skillID = 212006,
    level = 10,
    player_level = 40,
    currency = [{1,50000}],
    skillcoin_cost = 1,
    item = [],
    describe = "使用冰箭攻击敌人，造成总计530%魔法攻击的伤害，并降低敌人的速度。",
    id = 451
    };
getRow(212006,11)->
    #player_skills_upgradingCfg {
    skillID = 212006,
    level = 11,
    player_level = 43,
    currency = [{1,55000}],
    skillcoin_cost = 1,
    item = [],
    describe = "使用冰箭攻击敌人，造成总计550%魔法攻击的伤害，并降低敌人的速度。",
    id = 452
    };
getRow(212006,12)->
    #player_skills_upgradingCfg {
    skillID = 212006,
    level = 12,
    player_level = 46,
    currency = [{1,60000}],
    skillcoin_cost = 1,
    item = [],
    describe = "使用冰箭攻击敌人，造成总计570%魔法攻击的伤害，并降低敌人的速度。",
    id = 453
    };
getRow(212006,13)->
    #player_skills_upgradingCfg {
    skillID = 212006,
    level = 13,
    player_level = 49,
    currency = [{1,65000}],
    skillcoin_cost = 1,
    item = [],
    describe = "使用冰箭攻击敌人，造成总计590%魔法攻击的伤害，并降低敌人的速度。",
    id = 454
    };
getRow(212006,14)->
    #player_skills_upgradingCfg {
    skillID = 212006,
    level = 14,
    player_level = 52,
    currency = [{1,70000}],
    skillcoin_cost = 1,
    item = [],
    describe = "使用冰箭攻击敌人，造成总计610%魔法攻击的伤害，并降低敌人的速度。",
    id = 455
    };
getRow(212006,15)->
    #player_skills_upgradingCfg {
    skillID = 212006,
    level = 15,
    player_level = 55,
    currency = [{1,75000}],
    skillcoin_cost = 1,
    item = [],
    describe = "使用冰箭攻击敌人，造成总计630%魔法攻击的伤害，并降低敌人的速度。",
    id = 456
    };
getRow(212007,1)->
    #player_skills_upgradingCfg {
    skillID = 212007,
    level = 1,
    player_level = 20,
    currency = [],
    skillcoin_cost = 1,
    item = [],
    describe = "使周围全体队友提升4%魔法攻击，持续10分钟",
    id = 457
    };
getRow(212007,2)->
    #player_skills_upgradingCfg {
    skillID = 212007,
    level = 2,
    player_level = 20,
    currency = [{1,10000}],
    skillcoin_cost = 1,
    item = [],
    describe = "使周围全体队友提升4.4%魔法攻击，持续10分钟",
    id = 458
    };
getRow(212007,3)->
    #player_skills_upgradingCfg {
    skillID = 212007,
    level = 3,
    player_level = 20,
    currency = [{1,15000}],
    skillcoin_cost = 1,
    item = [],
    describe = "使周围全体队友提升4.8%魔法攻击，持续10分钟",
    id = 459
    };
getRow(212007,4)->
    #player_skills_upgradingCfg {
    skillID = 212007,
    level = 4,
    player_level = 22,
    currency = [{1,20000}],
    skillcoin_cost = 1,
    item = [],
    describe = "使周围全体队友提升5.2%魔法攻击，持续10分钟",
    id = 460
    };
getRow(212007,5)->
    #player_skills_upgradingCfg {
    skillID = 212007,
    level = 5,
    player_level = 25,
    currency = [{1,25000}],
    skillcoin_cost = 1,
    item = [],
    describe = "使周围全体队友提升5.6%魔法攻击，持续10分钟",
    id = 461
    };
getRow(212007,6)->
    #player_skills_upgradingCfg {
    skillID = 212007,
    level = 6,
    player_level = 28,
    currency = [{1,30000}],
    skillcoin_cost = 1,
    item = [],
    describe = "使周围全体队友提升6%魔法攻击，持续10分钟",
    id = 457
    };
getRow(212007,7)->
    #player_skills_upgradingCfg {
    skillID = 212007,
    level = 7,
    player_level = 31,
    currency = [{1,35000}],
    skillcoin_cost = 1,
    item = [],
    describe = "使周围全体队友提升6.4%魔法攻击，持续10分钟",
    id = 458
    };
getRow(212007,8)->
    #player_skills_upgradingCfg {
    skillID = 212007,
    level = 8,
    player_level = 34,
    currency = [{1,40000}],
    skillcoin_cost = 1,
    item = [],
    describe = "使周围全体队友提升6.8%魔法攻击，持续10分钟",
    id = 459
    };
getRow(212007,9)->
    #player_skills_upgradingCfg {
    skillID = 212007,
    level = 9,
    player_level = 37,
    currency = [{1,45000}],
    skillcoin_cost = 1,
    item = [],
    describe = "使周围全体队友提升7.2%魔法攻击，持续10分钟",
    id = 460
    };
getRow(212007,10)->
    #player_skills_upgradingCfg {
    skillID = 212007,
    level = 10,
    player_level = 40,
    currency = [{1,50000}],
    skillcoin_cost = 1,
    item = [],
    describe = "使周围全体队友提升7.6%魔法攻击，持续10分钟",
    id = 461
    };
getRow(212007,11)->
    #player_skills_upgradingCfg {
    skillID = 212007,
    level = 11,
    player_level = 43,
    currency = [{1,55000}],
    skillcoin_cost = 1,
    item = [],
    describe = "使周围全体队友提升8%魔法攻击，持续10分钟",
    id = 462
    };
getRow(212008,1)->
    #player_skills_upgradingCfg {
    skillID = 212008,
    level = 1,
    player_level = 20,
    currency = [],
    skillcoin_cost = 1,
    item = [],
    describe = "来自魔法师的祝福，提升自身10%魔法攻击，提升自身15%移动速度，持续10秒。",
    id = 472
    };
getRow(212008,2)->
    #player_skills_upgradingCfg {
    skillID = 212008,
    level = 2,
    player_level = 20,
    currency = [{1,10000}],
    skillcoin_cost = 1,
    item = [],
    describe = "来自魔法师的祝福，提升自身11%魔法攻击，提升自身15%移动速度，持续10秒。",
    id = 473
    };
getRow(212008,3)->
    #player_skills_upgradingCfg {
    skillID = 212008,
    level = 3,
    player_level = 20,
    currency = [{1,15000}],
    skillcoin_cost = 1,
    item = [],
    describe = "来自魔法师的祝福，提升自身12%魔法攻击，提升自身15%移动速度，持续10秒。",
    id = 474
    };
getRow(212008,4)->
    #player_skills_upgradingCfg {
    skillID = 212008,
    level = 4,
    player_level = 22,
    currency = [{1,20000}],
    skillcoin_cost = 1,
    item = [],
    describe = "来自魔法师的祝福，提升自身13%魔法攻击，提升自身15%移动速度，持续10秒。",
    id = 475
    };
getRow(212008,5)->
    #player_skills_upgradingCfg {
    skillID = 212008,
    level = 5,
    player_level = 25,
    currency = [{1,25000}],
    skillcoin_cost = 1,
    item = [],
    describe = "来自魔法师的祝福，提升自身14%魔法攻击，提升自身15%移动速度，持续10秒。",
    id = 476
    };
getRow(212008,6)->
    #player_skills_upgradingCfg {
    skillID = 212008,
    level = 6,
    player_level = 28,
    currency = [{1,30000}],
    skillcoin_cost = 1,
    item = [],
    describe = "来自魔法师的祝福，提升自身15%魔法攻击，提升自身15%移动速度，持续10秒。",
    id = 472
    };
getRow(212008,7)->
    #player_skills_upgradingCfg {
    skillID = 212008,
    level = 7,
    player_level = 31,
    currency = [{1,35000}],
    skillcoin_cost = 1,
    item = [],
    describe = "来自魔法师的祝福，提升自身16%魔法攻击，提升自身15%移动速度，持续10秒。",
    id = 473
    };
getRow(212008,8)->
    #player_skills_upgradingCfg {
    skillID = 212008,
    level = 8,
    player_level = 34,
    currency = [{1,40000}],
    skillcoin_cost = 1,
    item = [],
    describe = "来自魔法师的祝福，提升自身17%魔法攻击，提升自身15%移动速度，持续10秒。",
    id = 474
    };
getRow(212008,9)->
    #player_skills_upgradingCfg {
    skillID = 212008,
    level = 9,
    player_level = 37,
    currency = [{1,45000}],
    skillcoin_cost = 1,
    item = [],
    describe = "来自魔法师的祝福，提升自身18%魔法攻击，提升自身15%移动速度，持续10秒。",
    id = 475
    };
getRow(212008,10)->
    #player_skills_upgradingCfg {
    skillID = 212008,
    level = 10,
    player_level = 40,
    currency = [{1,50000}],
    skillcoin_cost = 1,
    item = [],
    describe = "来自魔法师的祝福，提升自身19%魔法攻击，提升自身15%移动速度，持续10秒。",
    id = 476
    };
getRow(212008,11)->
    #player_skills_upgradingCfg {
    skillID = 212008,
    level = 11,
    player_level = 43,
    currency = [{1,55000}],
    skillcoin_cost = 1,
    item = [],
    describe = "来自魔法师的祝福，提升自身20%魔法攻击，提升自身15%移动速度，持续10秒。",
    id = 477
    };
getRow(212009,1)->
    #player_skills_upgradingCfg {
    skillID = 212009,
    level = 1,
    player_level = 20,
    currency = [],
    skillcoin_cost = 1,
    item = [],
    describe = "对敌方单体释放剧毒，持续6秒，每秒造成75%魔法攻击的伤害。",
    id = 487
    };
getRow(212009,2)->
    #player_skills_upgradingCfg {
    skillID = 212009,
    level = 2,
    player_level = 20,
    currency = [{1,10000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对敌方单体释放剧毒，持续6秒，每秒造成79%魔法攻击的伤害。",
    id = 488
    };
getRow(212009,3)->
    #player_skills_upgradingCfg {
    skillID = 212009,
    level = 3,
    player_level = 20,
    currency = [{1,15000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对敌方单体释放剧毒，持续6秒，每秒造成83%魔法攻击的伤害。",
    id = 489
    };
getRow(212009,4)->
    #player_skills_upgradingCfg {
    skillID = 212009,
    level = 4,
    player_level = 22,
    currency = [{1,20000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对敌方单体释放剧毒，持续6秒，每秒造成87%魔法攻击的伤害。",
    id = 490
    };
getRow(212009,5)->
    #player_skills_upgradingCfg {
    skillID = 212009,
    level = 5,
    player_level = 25,
    currency = [{1,25000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对敌方单体释放剧毒，持续6秒，每秒造成91%魔法攻击的伤害。",
    id = 491
    };
getRow(212009,6)->
    #player_skills_upgradingCfg {
    skillID = 212009,
    level = 6,
    player_level = 28,
    currency = [{1,30000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对敌方单体释放剧毒，持续6秒，每秒造成95%魔法攻击的伤害。",
    id = 492
    };
getRow(212009,7)->
    #player_skills_upgradingCfg {
    skillID = 212009,
    level = 7,
    player_level = 31,
    currency = [{1,35000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对敌方单体释放剧毒，持续6秒，每秒造成99%魔法攻击的伤害。",
    id = 493
    };
getRow(212009,8)->
    #player_skills_upgradingCfg {
    skillID = 212009,
    level = 8,
    player_level = 34,
    currency = [{1,40000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对敌方单体释放剧毒，持续6秒，每秒造成103%魔法攻击的伤害。",
    id = 494
    };
getRow(212009,9)->
    #player_skills_upgradingCfg {
    skillID = 212009,
    level = 9,
    player_level = 37,
    currency = [{1,45000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对敌方单体释放剧毒，持续6秒，每秒造成107%魔法攻击的伤害。",
    id = 495
    };
getRow(212009,10)->
    #player_skills_upgradingCfg {
    skillID = 212009,
    level = 10,
    player_level = 40,
    currency = [{1,50000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对敌方单体释放剧毒，持续6秒，每秒造成111%魔法攻击的伤害。",
    id = 496
    };
getRow(212009,11)->
    #player_skills_upgradingCfg {
    skillID = 212009,
    level = 11,
    player_level = 43,
    currency = [{1,55000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对敌方单体释放剧毒，持续6秒，每秒造成115%魔法攻击的伤害。",
    id = 497
    };
getRow(212009,12)->
    #player_skills_upgradingCfg {
    skillID = 212009,
    level = 12,
    player_level = 46,
    currency = [{1,60000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对敌方单体释放剧毒，持续6秒，每秒造成119%魔法攻击的伤害。",
    id = 498
    };
getRow(212009,13)->
    #player_skills_upgradingCfg {
    skillID = 212009,
    level = 13,
    player_level = 49,
    currency = [{1,65000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对敌方单体释放剧毒，持续6秒，每秒造成123%魔法攻击的伤害。",
    id = 499
    };
getRow(212009,14)->
    #player_skills_upgradingCfg {
    skillID = 212009,
    level = 14,
    player_level = 52,
    currency = [{1,70000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对敌方单体释放剧毒，持续6秒，每秒造成127%魔法攻击的伤害。",
    id = 500
    };
getRow(212009,15)->
    #player_skills_upgradingCfg {
    skillID = 212009,
    level = 15,
    player_level = 55,
    currency = [{1,75000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对敌方单体释放剧毒，持续6秒，每秒造成131%魔法攻击的伤害。",
    id = 501
    };
getRow(221003,1)->
    #player_skills_upgradingCfg {
    skillID = 221003,
    level = 1,
    player_level = 60,
    currency = [],
    skillcoin_cost = 1,
    item = [],
    describe = "用神圣的力量对自身周围目标进行4次攻击，每次造成113%魔法攻击的伤害。",
    id = 0
    };
getRow(221003,2)->
    #player_skills_upgradingCfg {
    skillID = 221003,
    level = 2,
    player_level = 60,
    currency = [{1,50000}],
    skillcoin_cost = 1,
    item = [],
    describe = "用神圣的力量对自身周围目标进行4次攻击，每次造成120%魔法攻击的伤害。",
    id = 0
    };
getRow(221003,3)->
    #player_skills_upgradingCfg {
    skillID = 221003,
    level = 3,
    player_level = 60,
    currency = [{1,70000}],
    skillcoin_cost = 1,
    item = [],
    describe = "用神圣的力量对自身周围目标进行4次攻击，每次造成127%魔法攻击的伤害。",
    id = 0
    };
getRow(221003,4)->
    #player_skills_upgradingCfg {
    skillID = 221003,
    level = 4,
    player_level = 60,
    currency = [{1,90000}],
    skillcoin_cost = 1,
    item = [],
    describe = "用神圣的力量对自身周围目标进行4次攻击，每次造成134%魔法攻击的伤害。",
    id = 0
    };
getRow(221003,5)->
    #player_skills_upgradingCfg {
    skillID = 221003,
    level = 5,
    player_level = 60,
    currency = [{1,110000}],
    skillcoin_cost = 1,
    item = [],
    describe = "用神圣的力量对自身周围目标进行4次攻击，每次造成141%魔法攻击的伤害。",
    id = 0
    };
getRow(221003,6)->
    #player_skills_upgradingCfg {
    skillID = 221003,
    level = 6,
    player_level = 60,
    currency = [{1,130000}],
    skillcoin_cost = 1,
    item = [],
    describe = "用神圣的力量对自身周围目标进行4次攻击，每次造成148%魔法攻击的伤害。",
    id = 0
    };
getRow(221003,7)->
    #player_skills_upgradingCfg {
    skillID = 221003,
    level = 7,
    player_level = 60,
    currency = [{1,150000}],
    skillcoin_cost = 1,
    item = [],
    describe = "用神圣的力量对自身周围目标进行4次攻击，每次造成155%魔法攻击的伤害。",
    id = 0
    };
getRow(221003,8)->
    #player_skills_upgradingCfg {
    skillID = 221003,
    level = 8,
    player_level = 60,
    currency = [{1,170000}],
    skillcoin_cost = 1,
    item = [],
    describe = "用神圣的力量对自身周围目标进行4次攻击，每次造成162%魔法攻击的伤害。",
    id = 0
    };
getRow(221003,9)->
    #player_skills_upgradingCfg {
    skillID = 221003,
    level = 9,
    player_level = 62,
    currency = [{1,190000}],
    skillcoin_cost = 1,
    item = [],
    describe = "用神圣的力量对自身周围目标进行4次攻击，每次造成169%魔法攻击的伤害。",
    id = 0
    };
getRow(221003,10)->
    #player_skills_upgradingCfg {
    skillID = 221003,
    level = 10,
    player_level = 64,
    currency = [{1,210000}],
    skillcoin_cost = 1,
    item = [],
    describe = "用神圣的力量对自身周围目标进行4次攻击，每次造成176%魔法攻击的伤害。",
    id = 0
    };
getRow(221003,11)->
    #player_skills_upgradingCfg {
    skillID = 221003,
    level = 11,
    player_level = 66,
    currency = [{1,230000}],
    skillcoin_cost = 1,
    item = [],
    describe = "用神圣的力量对自身周围目标进行4次攻击，每次造成183%魔法攻击的伤害。",
    id = 0
    };
getRow(221003,12)->
    #player_skills_upgradingCfg {
    skillID = 221003,
    level = 12,
    player_level = 68,
    currency = [{1,250000}],
    skillcoin_cost = 1,
    item = [],
    describe = "用神圣的力量对自身周围目标进行4次攻击，每次造成190%魔法攻击的伤害。",
    id = 0
    };
getRow(221003,13)->
    #player_skills_upgradingCfg {
    skillID = 221003,
    level = 13,
    player_level = 70,
    currency = [{1,270000}],
    skillcoin_cost = 1,
    item = [],
    describe = "用神圣的力量对自身周围目标进行4次攻击，每次造成197%魔法攻击的伤害。",
    id = 0
    };
getRow(221003,14)->
    #player_skills_upgradingCfg {
    skillID = 221003,
    level = 14,
    player_level = 72,
    currency = [{1,290000}],
    skillcoin_cost = 1,
    item = [],
    describe = "用神圣的力量对自身周围目标进行4次攻击，每次造成204%魔法攻击的伤害。",
    id = 0
    };
getRow(221003,15)->
    #player_skills_upgradingCfg {
    skillID = 221003,
    level = 15,
    player_level = 74,
    currency = [{1,310000}],
    skillcoin_cost = 1,
    item = [],
    describe = "用神圣的力量对自身周围目标进行4次攻击，每次造成211%魔法攻击的伤害。",
    id = 0
    };
getRow(221003,16)->
    #player_skills_upgradingCfg {
    skillID = 221003,
    level = 16,
    player_level = 76,
    currency = [{1,330000}],
    skillcoin_cost = 1,
    item = [],
    describe = "用神圣的力量对自身周围目标进行4次攻击，每次造成218%魔法攻击的伤害。",
    id = 0
    };
getRow(221003,17)->
    #player_skills_upgradingCfg {
    skillID = 221003,
    level = 17,
    player_level = 78,
    currency = [{1,350000}],
    skillcoin_cost = 1,
    item = [],
    describe = "用神圣的力量对自身周围目标进行4次攻击，每次造成225%魔法攻击的伤害。",
    id = 0
    };
getRow(221003,18)->
    #player_skills_upgradingCfg {
    skillID = 221003,
    level = 18,
    player_level = 80,
    currency = [{1,370000}],
    skillcoin_cost = 1,
    item = [],
    describe = "用神圣的力量对自身周围目标进行4次攻击，每次造成232%魔法攻击的伤害。",
    id = 0
    };
getRow(221003,19)->
    #player_skills_upgradingCfg {
    skillID = 221003,
    level = 19,
    player_level = 82,
    currency = [{1,390000}],
    skillcoin_cost = 1,
    item = [],
    describe = "用神圣的力量对自身周围目标进行4次攻击，每次造成239%魔法攻击的伤害。",
    id = 0
    };
getRow(221003,20)->
    #player_skills_upgradingCfg {
    skillID = 221003,
    level = 20,
    player_level = 84,
    currency = [{1,410000}],
    skillcoin_cost = 1,
    item = [],
    describe = "用神圣的力量对自身周围目标进行4次攻击，每次造成246%魔法攻击的伤害。",
    id = 0
    };
getRow(221003,21)->
    #player_skills_upgradingCfg {
    skillID = 221003,
    level = 21,
    player_level = 86,
    currency = [{1,430000}],
    skillcoin_cost = 1,
    item = [],
    describe = "用神圣的力量对自身周围目标进行4次攻击，每次造成253%魔法攻击的伤害。",
    id = 0
    };
getRow(221003,22)->
    #player_skills_upgradingCfg {
    skillID = 221003,
    level = 22,
    player_level = 88,
    currency = [{1,450000}],
    skillcoin_cost = 1,
    item = [],
    describe = "用神圣的力量对自身周围目标进行4次攻击，每次造成260%魔法攻击的伤害。",
    id = 0
    };
getRow(221003,23)->
    #player_skills_upgradingCfg {
    skillID = 221003,
    level = 23,
    player_level = 90,
    currency = [{1,470000}],
    skillcoin_cost = 1,
    item = [],
    describe = "用神圣的力量对自身周围目标进行4次攻击，每次造成267%魔法攻击的伤害。",
    id = 0
    };
getRow(221003,24)->
    #player_skills_upgradingCfg {
    skillID = 221003,
    level = 24,
    player_level = 92,
    currency = [{1,490000}],
    skillcoin_cost = 1,
    item = [],
    describe = "用神圣的力量对自身周围目标进行4次攻击，每次造成274%魔法攻击的伤害。",
    id = 0
    };
getRow(221003,25)->
    #player_skills_upgradingCfg {
    skillID = 221003,
    level = 25,
    player_level = 94,
    currency = [{1,510000}],
    skillcoin_cost = 1,
    item = [],
    describe = "用神圣的力量对自身周围目标进行4次攻击，每次造成281%魔法攻击的伤害。",
    id = 0
    };
getRow(221004,1)->
    #player_skills_upgradingCfg {
    skillID = 221004,
    level = 1,
    player_level = 60,
    currency = [],
    skillcoin_cost = 1,
    item = [],
    describe = "降下神圣的审判，给予敌人及其周围目标造成4次100%魔法攻击的伤害，并使主目标有概率被击晕",
    id = 0
    };
getRow(221004,2)->
    #player_skills_upgradingCfg {
    skillID = 221004,
    level = 2,
    player_level = 60,
    currency = [{1,50000}],
    skillcoin_cost = 1,
    item = [],
    describe = "降下神圣的审判，给予敌人及其周围目标造成4次104%魔法攻击的伤害，并使主目标有概率被击晕",
    id = 0
    };
getRow(221004,3)->
    #player_skills_upgradingCfg {
    skillID = 221004,
    level = 3,
    player_level = 60,
    currency = [{1,70000}],
    skillcoin_cost = 1,
    item = [],
    describe = "降下神圣的审判，给予敌人及其周围目标造成4次108%魔法攻击的伤害，并使主目标有概率被击晕",
    id = 0
    };
getRow(221004,4)->
    #player_skills_upgradingCfg {
    skillID = 221004,
    level = 4,
    player_level = 60,
    currency = [{1,90000}],
    skillcoin_cost = 1,
    item = [],
    describe = "降下神圣的审判，给予敌人及其周围目标造成4次112%魔法攻击的伤害，并使主目标有概率被击晕",
    id = 0
    };
getRow(221004,5)->
    #player_skills_upgradingCfg {
    skillID = 221004,
    level = 5,
    player_level = 60,
    currency = [{1,110000}],
    skillcoin_cost = 1,
    item = [],
    describe = "降下神圣的审判，给予敌人及其周围目标造成4次116%魔法攻击的伤害，并使主目标有概率被击晕",
    id = 0
    };
getRow(221004,6)->
    #player_skills_upgradingCfg {
    skillID = 221004,
    level = 6,
    player_level = 60,
    currency = [{1,130000}],
    skillcoin_cost = 1,
    item = [],
    describe = "降下神圣的审判，给予敌人及其周围目标造成4次120%魔法攻击的伤害，并使主目标有概率被击晕",
    id = 0
    };
getRow(221004,7)->
    #player_skills_upgradingCfg {
    skillID = 221004,
    level = 7,
    player_level = 60,
    currency = [{1,150000}],
    skillcoin_cost = 1,
    item = [],
    describe = "降下神圣的审判，给予敌人及其周围目标造成4次124%魔法攻击的伤害，并使主目标有概率被击晕",
    id = 0
    };
getRow(221004,8)->
    #player_skills_upgradingCfg {
    skillID = 221004,
    level = 8,
    player_level = 60,
    currency = [{1,170000}],
    skillcoin_cost = 1,
    item = [],
    describe = "降下神圣的审判，给予敌人及其周围目标造成4次128%魔法攻击的伤害，并使主目标有概率被击晕",
    id = 0
    };
getRow(221004,9)->
    #player_skills_upgradingCfg {
    skillID = 221004,
    level = 9,
    player_level = 62,
    currency = [{1,190000}],
    skillcoin_cost = 1,
    item = [],
    describe = "降下神圣的审判，给予敌人及其周围目标造成4次132%魔法攻击的伤害，并使主目标有概率被击晕",
    id = 0
    };
getRow(221004,10)->
    #player_skills_upgradingCfg {
    skillID = 221004,
    level = 10,
    player_level = 64,
    currency = [{1,210000}],
    skillcoin_cost = 1,
    item = [],
    describe = "降下神圣的审判，给予敌人及其周围目标造成4次136%魔法攻击的伤害，并使主目标有概率被击晕",
    id = 0
    };
getRow(221004,11)->
    #player_skills_upgradingCfg {
    skillID = 221004,
    level = 11,
    player_level = 66,
    currency = [{1,230000}],
    skillcoin_cost = 1,
    item = [],
    describe = "降下神圣的审判，给予敌人及其周围目标造成4次140%魔法攻击的伤害，并使主目标有概率被击晕",
    id = 0
    };
getRow(221004,12)->
    #player_skills_upgradingCfg {
    skillID = 221004,
    level = 12,
    player_level = 68,
    currency = [{1,250000}],
    skillcoin_cost = 1,
    item = [],
    describe = "降下神圣的审判，给予敌人及其周围目标造成4次144%魔法攻击的伤害，并使主目标有概率被击晕",
    id = 0
    };
getRow(221004,13)->
    #player_skills_upgradingCfg {
    skillID = 221004,
    level = 13,
    player_level = 70,
    currency = [{1,270000}],
    skillcoin_cost = 1,
    item = [],
    describe = "降下神圣的审判，给予敌人及其周围目标造成4次148%魔法攻击的伤害，并使主目标有概率被击晕",
    id = 0
    };
getRow(221004,14)->
    #player_skills_upgradingCfg {
    skillID = 221004,
    level = 14,
    player_level = 72,
    currency = [{1,290000}],
    skillcoin_cost = 1,
    item = [],
    describe = "降下神圣的审判，给予敌人及其周围目标造成4次152%魔法攻击的伤害，并使主目标有概率被击晕",
    id = 0
    };
getRow(221004,15)->
    #player_skills_upgradingCfg {
    skillID = 221004,
    level = 15,
    player_level = 74,
    currency = [{1,310000}],
    skillcoin_cost = 1,
    item = [],
    describe = "降下神圣的审判，给予敌人及其周围目标造成4次156%魔法攻击的伤害，并使主目标有概率被击晕",
    id = 0
    };
getRow(221004,16)->
    #player_skills_upgradingCfg {
    skillID = 221004,
    level = 16,
    player_level = 76,
    currency = [{1,330000}],
    skillcoin_cost = 1,
    item = [],
    describe = "降下神圣的审判，给予敌人及其周围目标造成4次160%魔法攻击的伤害，并使主目标有概率被击晕",
    id = 0
    };
getRow(221004,17)->
    #player_skills_upgradingCfg {
    skillID = 221004,
    level = 17,
    player_level = 78,
    currency = [{1,350000}],
    skillcoin_cost = 1,
    item = [],
    describe = "降下神圣的审判，给予敌人及其周围目标造成4次164%魔法攻击的伤害，并使主目标有概率被击晕",
    id = 0
    };
getRow(221004,18)->
    #player_skills_upgradingCfg {
    skillID = 221004,
    level = 18,
    player_level = 80,
    currency = [{1,370000}],
    skillcoin_cost = 1,
    item = [],
    describe = "降下神圣的审判，给予敌人及其周围目标造成4次168%魔法攻击的伤害，并使主目标有概率被击晕",
    id = 0
    };
getRow(221004,19)->
    #player_skills_upgradingCfg {
    skillID = 221004,
    level = 19,
    player_level = 82,
    currency = [{1,390000}],
    skillcoin_cost = 1,
    item = [],
    describe = "降下神圣的审判，给予敌人及其周围目标造成4次172%魔法攻击的伤害，并使主目标有概率被击晕",
    id = 0
    };
getRow(221004,20)->
    #player_skills_upgradingCfg {
    skillID = 221004,
    level = 20,
    player_level = 84,
    currency = [{1,410000}],
    skillcoin_cost = 1,
    item = [],
    describe = "降下神圣的审判，给予敌人及其周围目标造成4次176%魔法攻击的伤害，并使主目标有概率被击晕",
    id = 0
    };
getRow(221004,21)->
    #player_skills_upgradingCfg {
    skillID = 221004,
    level = 21,
    player_level = 86,
    currency = [{1,430000}],
    skillcoin_cost = 1,
    item = [],
    describe = "降下神圣的审判，给予敌人及其周围目标造成4次180%魔法攻击的伤害，并使主目标有概率被击晕",
    id = 0
    };
getRow(221004,22)->
    #player_skills_upgradingCfg {
    skillID = 221004,
    level = 22,
    player_level = 88,
    currency = [{1,450000}],
    skillcoin_cost = 1,
    item = [],
    describe = "降下神圣的审判，给予敌人及其周围目标造成4次184%魔法攻击的伤害，并使主目标有概率被击晕",
    id = 0
    };
getRow(221004,23)->
    #player_skills_upgradingCfg {
    skillID = 221004,
    level = 23,
    player_level = 90,
    currency = [{1,470000}],
    skillcoin_cost = 1,
    item = [],
    describe = "降下神圣的审判，给予敌人及其周围目标造成4次188%魔法攻击的伤害，并使主目标有概率被击晕",
    id = 0
    };
getRow(221004,24)->
    #player_skills_upgradingCfg {
    skillID = 221004,
    level = 24,
    player_level = 92,
    currency = [{1,490000}],
    skillcoin_cost = 1,
    item = [],
    describe = "降下神圣的审判，给予敌人及其周围目标造成4次192%魔法攻击的伤害，并使主目标有概率被击晕",
    id = 0
    };
getRow(221004,25)->
    #player_skills_upgradingCfg {
    skillID = 221004,
    level = 25,
    player_level = 94,
    currency = [{1,510000}],
    skillcoin_cost = 1,
    item = [],
    describe = "降下神圣的审判，给予敌人及其周围目标造成4次196%魔法攻击的伤害，并使主目标有概率被击晕",
    id = 0
    };
getRow(221005,1)->
    #player_skills_upgradingCfg {
    skillID = 221005,
    level = 1,
    player_level = 60,
    currency = [],
    skillcoin_cost = 1,
    item = [],
    describe = "清除周围友方的负面效果，并对周围敌人造成每秒113%魔法攻击的伤害，持续3秒",
    id = 0
    };
getRow(221005,2)->
    #player_skills_upgradingCfg {
    skillID = 221005,
    level = 2,
    player_level = 60,
    currency = [{1,50000}],
    skillcoin_cost = 1,
    item = [],
    describe = "清除周围友方的负面效果，并对周围敌人造成每秒118%魔法攻击的伤害，持续3秒",
    id = 0
    };
getRow(221005,3)->
    #player_skills_upgradingCfg {
    skillID = 221005,
    level = 3,
    player_level = 60,
    currency = [{1,70000}],
    skillcoin_cost = 1,
    item = [],
    describe = "清除周围友方的负面效果，并对周围敌人造成每秒123%魔法攻击的伤害，持续3秒",
    id = 0
    };
getRow(221005,4)->
    #player_skills_upgradingCfg {
    skillID = 221005,
    level = 4,
    player_level = 60,
    currency = [{1,90000}],
    skillcoin_cost = 1,
    item = [],
    describe = "清除周围友方的负面效果，并对周围敌人造成每秒128%魔法攻击的伤害，持续3秒",
    id = 0
    };
getRow(221005,5)->
    #player_skills_upgradingCfg {
    skillID = 221005,
    level = 5,
    player_level = 60,
    currency = [{1,110000}],
    skillcoin_cost = 1,
    item = [],
    describe = "清除周围友方的负面效果，并对周围敌人造成每秒133%魔法攻击的伤害，持续3秒",
    id = 0
    };
getRow(221005,6)->
    #player_skills_upgradingCfg {
    skillID = 221005,
    level = 6,
    player_level = 60,
    currency = [{1,130000}],
    skillcoin_cost = 1,
    item = [],
    describe = "清除周围友方的负面效果，并对周围敌人造成每秒138%魔法攻击的伤害，持续3秒",
    id = 0
    };
getRow(221005,7)->
    #player_skills_upgradingCfg {
    skillID = 221005,
    level = 7,
    player_level = 60,
    currency = [{1,150000}],
    skillcoin_cost = 1,
    item = [],
    describe = "清除周围友方的负面效果，并对周围敌人造成每秒143%魔法攻击的伤害，持续3秒",
    id = 0
    };
getRow(221005,8)->
    #player_skills_upgradingCfg {
    skillID = 221005,
    level = 8,
    player_level = 60,
    currency = [{1,170000}],
    skillcoin_cost = 1,
    item = [],
    describe = "清除周围友方的负面效果，并对周围敌人造成每秒148%魔法攻击的伤害，持续3秒",
    id = 0
    };
getRow(221005,9)->
    #player_skills_upgradingCfg {
    skillID = 221005,
    level = 9,
    player_level = 62,
    currency = [{1,190000}],
    skillcoin_cost = 1,
    item = [],
    describe = "清除周围友方的负面效果，并对周围敌人造成每秒153%魔法攻击的伤害，持续3秒",
    id = 0
    };
getRow(221005,10)->
    #player_skills_upgradingCfg {
    skillID = 221005,
    level = 10,
    player_level = 64,
    currency = [{1,210000}],
    skillcoin_cost = 1,
    item = [],
    describe = "清除周围友方的负面效果，并对周围敌人造成每秒158%魔法攻击的伤害，持续3秒",
    id = 0
    };
getRow(221005,11)->
    #player_skills_upgradingCfg {
    skillID = 221005,
    level = 11,
    player_level = 66,
    currency = [{1,230000}],
    skillcoin_cost = 1,
    item = [],
    describe = "清除周围友方的负面效果，并对周围敌人造成每秒163%魔法攻击的伤害，持续3秒",
    id = 0
    };
getRow(221005,12)->
    #player_skills_upgradingCfg {
    skillID = 221005,
    level = 12,
    player_level = 68,
    currency = [{1,250000}],
    skillcoin_cost = 1,
    item = [],
    describe = "清除周围友方的负面效果，并对周围敌人造成每秒168%魔法攻击的伤害，持续3秒",
    id = 0
    };
getRow(221005,13)->
    #player_skills_upgradingCfg {
    skillID = 221005,
    level = 13,
    player_level = 70,
    currency = [{1,270000}],
    skillcoin_cost = 1,
    item = [],
    describe = "清除周围友方的负面效果，并对周围敌人造成每秒173%魔法攻击的伤害，持续3秒",
    id = 0
    };
getRow(221005,14)->
    #player_skills_upgradingCfg {
    skillID = 221005,
    level = 14,
    player_level = 72,
    currency = [{1,290000}],
    skillcoin_cost = 1,
    item = [],
    describe = "清除周围友方的负面效果，并对周围敌人造成每秒178%魔法攻击的伤害，持续3秒",
    id = 0
    };
getRow(221005,15)->
    #player_skills_upgradingCfg {
    skillID = 221005,
    level = 15,
    player_level = 74,
    currency = [{1,310000}],
    skillcoin_cost = 1,
    item = [],
    describe = "清除周围友方的负面效果，并对周围敌人造成每秒183%魔法攻击的伤害，持续3秒",
    id = 0
    };
getRow(221005,16)->
    #player_skills_upgradingCfg {
    skillID = 221005,
    level = 16,
    player_level = 76,
    currency = [{1,330000}],
    skillcoin_cost = 1,
    item = [],
    describe = "清除周围友方的负面效果，并对周围敌人造成每秒188%魔法攻击的伤害，持续3秒",
    id = 0
    };
getRow(221005,17)->
    #player_skills_upgradingCfg {
    skillID = 221005,
    level = 17,
    player_level = 78,
    currency = [{1,350000}],
    skillcoin_cost = 1,
    item = [],
    describe = "清除周围友方的负面效果，并对周围敌人造成每秒193%魔法攻击的伤害，持续3秒",
    id = 0
    };
getRow(221005,18)->
    #player_skills_upgradingCfg {
    skillID = 221005,
    level = 18,
    player_level = 80,
    currency = [{1,370000}],
    skillcoin_cost = 1,
    item = [],
    describe = "清除周围友方的负面效果，并对周围敌人造成每秒198%魔法攻击的伤害，持续3秒",
    id = 0
    };
getRow(221005,19)->
    #player_skills_upgradingCfg {
    skillID = 221005,
    level = 19,
    player_level = 82,
    currency = [{1,390000}],
    skillcoin_cost = 1,
    item = [],
    describe = "清除周围友方的负面效果，并对周围敌人造成每秒203%魔法攻击的伤害，持续3秒",
    id = 0
    };
getRow(221005,20)->
    #player_skills_upgradingCfg {
    skillID = 221005,
    level = 20,
    player_level = 84,
    currency = [{1,410000}],
    skillcoin_cost = 1,
    item = [],
    describe = "清除周围友方的负面效果，并对周围敌人造成每秒208%魔法攻击的伤害，持续3秒",
    id = 0
    };
getRow(221005,21)->
    #player_skills_upgradingCfg {
    skillID = 221005,
    level = 21,
    player_level = 86,
    currency = [{1,430000}],
    skillcoin_cost = 1,
    item = [],
    describe = "清除周围友方的负面效果，并对周围敌人造成每秒213%魔法攻击的伤害，持续3秒",
    id = 0
    };
getRow(221005,22)->
    #player_skills_upgradingCfg {
    skillID = 221005,
    level = 22,
    player_level = 88,
    currency = [{1,450000}],
    skillcoin_cost = 1,
    item = [],
    describe = "清除周围友方的负面效果，并对周围敌人造成每秒218%魔法攻击的伤害，持续3秒",
    id = 0
    };
getRow(221005,23)->
    #player_skills_upgradingCfg {
    skillID = 221005,
    level = 23,
    player_level = 90,
    currency = [{1,470000}],
    skillcoin_cost = 1,
    item = [],
    describe = "清除周围友方的负面效果，并对周围敌人造成每秒223%魔法攻击的伤害，持续3秒",
    id = 0
    };
getRow(221005,24)->
    #player_skills_upgradingCfg {
    skillID = 221005,
    level = 24,
    player_level = 92,
    currency = [{1,490000}],
    skillcoin_cost = 1,
    item = [],
    describe = "清除周围友方的负面效果，并对周围敌人造成每秒228%魔法攻击的伤害，持续3秒",
    id = 0
    };
getRow(221005,25)->
    #player_skills_upgradingCfg {
    skillID = 221005,
    level = 25,
    player_level = 94,
    currency = [{1,510000}],
    skillcoin_cost = 1,
    item = [],
    describe = "清除周围友方的负面效果，并对周围敌人造成每秒233%魔法攻击的伤害，持续3秒",
    id = 0
    };
getRow(221006,1)->
    #player_skills_upgradingCfg {
    skillID = 221006,
    level = 1,
    player_level = 60,
    currency = [],
    skillcoin_cost = 1,
    item = [],
    describe = "快速的咏唱咒文，恢复自身及周围队友255%魔法攻击的生命值",
    id = 0
    };
getRow(221006,2)->
    #player_skills_upgradingCfg {
    skillID = 221006,
    level = 2,
    player_level = 60,
    currency = [{1,50000}],
    skillcoin_cost = 1,
    item = [],
    describe = "快速的咏唱咒文，恢复自身及周围队友260%魔法攻击的生命值",
    id = 0
    };
getRow(221006,3)->
    #player_skills_upgradingCfg {
    skillID = 221006,
    level = 3,
    player_level = 60,
    currency = [{1,70000}],
    skillcoin_cost = 1,
    item = [],
    describe = "快速的咏唱咒文，恢复自身及周围队友265%魔法攻击的生命值",
    id = 0
    };
getRow(221006,4)->
    #player_skills_upgradingCfg {
    skillID = 221006,
    level = 4,
    player_level = 60,
    currency = [{1,90000}],
    skillcoin_cost = 1,
    item = [],
    describe = "快速的咏唱咒文，恢复自身及周围队友270%魔法攻击的生命值",
    id = 0
    };
getRow(221006,5)->
    #player_skills_upgradingCfg {
    skillID = 221006,
    level = 5,
    player_level = 60,
    currency = [{1,110000}],
    skillcoin_cost = 1,
    item = [],
    describe = "快速的咏唱咒文，恢复自身及周围队友275%魔法攻击的生命值",
    id = 0
    };
getRow(221006,6)->
    #player_skills_upgradingCfg {
    skillID = 221006,
    level = 6,
    player_level = 60,
    currency = [{1,130000}],
    skillcoin_cost = 1,
    item = [],
    describe = "快速的咏唱咒文，恢复自身及周围队友280%魔法攻击的生命值",
    id = 0
    };
getRow(221006,7)->
    #player_skills_upgradingCfg {
    skillID = 221006,
    level = 7,
    player_level = 60,
    currency = [{1,150000}],
    skillcoin_cost = 1,
    item = [],
    describe = "快速的咏唱咒文，恢复自身及周围队友285%魔法攻击的生命值",
    id = 0
    };
getRow(221006,8)->
    #player_skills_upgradingCfg {
    skillID = 221006,
    level = 8,
    player_level = 60,
    currency = [{1,170000}],
    skillcoin_cost = 1,
    item = [],
    describe = "快速的咏唱咒文，恢复自身及周围队友290%魔法攻击的生命值",
    id = 0
    };
getRow(221006,9)->
    #player_skills_upgradingCfg {
    skillID = 221006,
    level = 9,
    player_level = 62,
    currency = [{1,190000}],
    skillcoin_cost = 1,
    item = [],
    describe = "快速的咏唱咒文，恢复自身及周围队友295%魔法攻击的生命值",
    id = 0
    };
getRow(221006,10)->
    #player_skills_upgradingCfg {
    skillID = 221006,
    level = 10,
    player_level = 64,
    currency = [{1,210000}],
    skillcoin_cost = 1,
    item = [],
    describe = "快速的咏唱咒文，恢复自身及周围队友300%魔法攻击的生命值",
    id = 0
    };
getRow(221006,11)->
    #player_skills_upgradingCfg {
    skillID = 221006,
    level = 11,
    player_level = 66,
    currency = [{1,230000}],
    skillcoin_cost = 1,
    item = [],
    describe = "快速的咏唱咒文，恢复自身及周围队友305%魔法攻击的生命值",
    id = 0
    };
getRow(221006,12)->
    #player_skills_upgradingCfg {
    skillID = 221006,
    level = 12,
    player_level = 68,
    currency = [{1,250000}],
    skillcoin_cost = 1,
    item = [],
    describe = "快速的咏唱咒文，恢复自身及周围队友310%魔法攻击的生命值",
    id = 0
    };
getRow(221006,13)->
    #player_skills_upgradingCfg {
    skillID = 221006,
    level = 13,
    player_level = 70,
    currency = [{1,270000}],
    skillcoin_cost = 1,
    item = [],
    describe = "快速的咏唱咒文，恢复自身及周围队友315%魔法攻击的生命值",
    id = 0
    };
getRow(221006,14)->
    #player_skills_upgradingCfg {
    skillID = 221006,
    level = 14,
    player_level = 72,
    currency = [{1,290000}],
    skillcoin_cost = 1,
    item = [],
    describe = "快速的咏唱咒文，恢复自身及周围队友320%魔法攻击的生命值",
    id = 0
    };
getRow(221006,15)->
    #player_skills_upgradingCfg {
    skillID = 221006,
    level = 15,
    player_level = 74,
    currency = [{1,310000}],
    skillcoin_cost = 1,
    item = [],
    describe = "快速的咏唱咒文，恢复自身及周围队友325%魔法攻击的生命值",
    id = 0
    };
getRow(221006,16)->
    #player_skills_upgradingCfg {
    skillID = 221006,
    level = 16,
    player_level = 76,
    currency = [{1,330000}],
    skillcoin_cost = 1,
    item = [],
    describe = "快速的咏唱咒文，恢复自身及周围队友330%魔法攻击的生命值",
    id = 0
    };
getRow(221006,17)->
    #player_skills_upgradingCfg {
    skillID = 221006,
    level = 17,
    player_level = 78,
    currency = [{1,350000}],
    skillcoin_cost = 1,
    item = [],
    describe = "快速的咏唱咒文，恢复自身及周围队友335%魔法攻击的生命值",
    id = 0
    };
getRow(221006,18)->
    #player_skills_upgradingCfg {
    skillID = 221006,
    level = 18,
    player_level = 80,
    currency = [{1,370000}],
    skillcoin_cost = 1,
    item = [],
    describe = "快速的咏唱咒文，恢复自身及周围队友340%魔法攻击的生命值",
    id = 0
    };
getRow(221006,19)->
    #player_skills_upgradingCfg {
    skillID = 221006,
    level = 19,
    player_level = 82,
    currency = [{1,390000}],
    skillcoin_cost = 1,
    item = [],
    describe = "快速的咏唱咒文，恢复自身及周围队友345%魔法攻击的生命值",
    id = 0
    };
getRow(221006,20)->
    #player_skills_upgradingCfg {
    skillID = 221006,
    level = 20,
    player_level = 84,
    currency = [{1,410000}],
    skillcoin_cost = 1,
    item = [],
    describe = "快速的咏唱咒文，恢复自身及周围队友350%魔法攻击的生命值",
    id = 0
    };
getRow(221006,21)->
    #player_skills_upgradingCfg {
    skillID = 221006,
    level = 21,
    player_level = 86,
    currency = [{1,430000}],
    skillcoin_cost = 1,
    item = [],
    describe = "快速的咏唱咒文，恢复自身及周围队友355%魔法攻击的生命值",
    id = 0
    };
getRow(221006,22)->
    #player_skills_upgradingCfg {
    skillID = 221006,
    level = 22,
    player_level = 88,
    currency = [{1,450000}],
    skillcoin_cost = 1,
    item = [],
    describe = "快速的咏唱咒文，恢复自身及周围队友360%魔法攻击的生命值",
    id = 0
    };
getRow(221006,23)->
    #player_skills_upgradingCfg {
    skillID = 221006,
    level = 23,
    player_level = 90,
    currency = [{1,470000}],
    skillcoin_cost = 1,
    item = [],
    describe = "快速的咏唱咒文，恢复自身及周围队友365%魔法攻击的生命值",
    id = 0
    };
getRow(221006,24)->
    #player_skills_upgradingCfg {
    skillID = 221006,
    level = 24,
    player_level = 92,
    currency = [{1,490000}],
    skillcoin_cost = 1,
    item = [],
    describe = "快速的咏唱咒文，恢复自身及周围队友370%魔法攻击的生命值",
    id = 0
    };
getRow(221006,25)->
    #player_skills_upgradingCfg {
    skillID = 221006,
    level = 25,
    player_level = 94,
    currency = [{1,510000}],
    skillcoin_cost = 1,
    item = [],
    describe = "快速的咏唱咒文，恢复自身及周围队友375%魔法攻击的生命值",
    id = 0
    };
getRow(221007,1)->
    #player_skills_upgradingCfg {
    skillID = 221007,
    level = 1,
    player_level = 60,
    currency = [],
    skillcoin_cost = 1,
    item = [],
    describe = "持续回血4次，每次恢复64%魔法攻击的生命值",
    id = 0
    };
getRow(221007,2)->
    #player_skills_upgradingCfg {
    skillID = 221007,
    level = 2,
    player_level = 60,
    currency = [{1,50000}],
    skillcoin_cost = 1,
    item = [],
    describe = "持续回血4次，每次恢复65%魔法攻击的生命值",
    id = 0
    };
getRow(221007,3)->
    #player_skills_upgradingCfg {
    skillID = 221007,
    level = 3,
    player_level = 60,
    currency = [{1,70000}],
    skillcoin_cost = 1,
    item = [],
    describe = "持续回血4次，每次恢复66%魔法攻击的生命值",
    id = 0
    };
getRow(221007,4)->
    #player_skills_upgradingCfg {
    skillID = 221007,
    level = 4,
    player_level = 60,
    currency = [{1,90000}],
    skillcoin_cost = 1,
    item = [],
    describe = "持续回血4次，每次恢复67%魔法攻击的生命值",
    id = 0
    };
getRow(221007,5)->
    #player_skills_upgradingCfg {
    skillID = 221007,
    level = 5,
    player_level = 60,
    currency = [{1,110000}],
    skillcoin_cost = 1,
    item = [],
    describe = "持续回血4次，每次恢复69%魔法攻击的生命值",
    id = 0
    };
getRow(221007,6)->
    #player_skills_upgradingCfg {
    skillID = 221007,
    level = 6,
    player_level = 60,
    currency = [{1,130000}],
    skillcoin_cost = 1,
    item = [],
    describe = "持续回血4次，每次恢复70%魔法攻击的生命值",
    id = 0
    };
getRow(221007,7)->
    #player_skills_upgradingCfg {
    skillID = 221007,
    level = 7,
    player_level = 60,
    currency = [{1,150000}],
    skillcoin_cost = 1,
    item = [],
    describe = "持续回血4次，每次恢复71%魔法攻击的生命值",
    id = 0
    };
getRow(221007,8)->
    #player_skills_upgradingCfg {
    skillID = 221007,
    level = 8,
    player_level = 60,
    currency = [{1,170000}],
    skillcoin_cost = 1,
    item = [],
    describe = "持续回血4次，每次恢复72%魔法攻击的生命值",
    id = 0
    };
getRow(221007,9)->
    #player_skills_upgradingCfg {
    skillID = 221007,
    level = 9,
    player_level = 62,
    currency = [{1,190000}],
    skillcoin_cost = 1,
    item = [],
    describe = "持续回血4次，每次恢复74%魔法攻击的生命值",
    id = 0
    };
getRow(221007,10)->
    #player_skills_upgradingCfg {
    skillID = 221007,
    level = 10,
    player_level = 64,
    currency = [{1,210000}],
    skillcoin_cost = 1,
    item = [],
    describe = "持续回血4次，每次恢复75%魔法攻击的生命值",
    id = 0
    };
getRow(221007,11)->
    #player_skills_upgradingCfg {
    skillID = 221007,
    level = 11,
    player_level = 66,
    currency = [{1,230000}],
    skillcoin_cost = 1,
    item = [],
    describe = "持续回血4次，每次恢复76%魔法攻击的生命值",
    id = 0
    };
getRow(221007,12)->
    #player_skills_upgradingCfg {
    skillID = 221007,
    level = 12,
    player_level = 68,
    currency = [{1,250000}],
    skillcoin_cost = 1,
    item = [],
    describe = "持续回血4次，每次恢复77%魔法攻击的生命值",
    id = 0
    };
getRow(221007,13)->
    #player_skills_upgradingCfg {
    skillID = 221007,
    level = 13,
    player_level = 70,
    currency = [{1,270000}],
    skillcoin_cost = 1,
    item = [],
    describe = "持续回血4次，每次恢复79%魔法攻击的生命值",
    id = 0
    };
getRow(221007,14)->
    #player_skills_upgradingCfg {
    skillID = 221007,
    level = 14,
    player_level = 72,
    currency = [{1,290000}],
    skillcoin_cost = 1,
    item = [],
    describe = "持续回血4次，每次恢复80%魔法攻击的生命值",
    id = 0
    };
getRow(221007,15)->
    #player_skills_upgradingCfg {
    skillID = 221007,
    level = 15,
    player_level = 74,
    currency = [{1,310000}],
    skillcoin_cost = 1,
    item = [],
    describe = "持续回血4次，每次恢复81%魔法攻击的生命值",
    id = 0
    };
getRow(221007,16)->
    #player_skills_upgradingCfg {
    skillID = 221007,
    level = 16,
    player_level = 76,
    currency = [{1,330000}],
    skillcoin_cost = 1,
    item = [],
    describe = "持续回血4次，每次恢复82%魔法攻击的生命值",
    id = 0
    };
getRow(221007,17)->
    #player_skills_upgradingCfg {
    skillID = 221007,
    level = 17,
    player_level = 78,
    currency = [{1,350000}],
    skillcoin_cost = 1,
    item = [],
    describe = "持续回血4次，每次恢复84%魔法攻击的生命值",
    id = 0
    };
getRow(221007,18)->
    #player_skills_upgradingCfg {
    skillID = 221007,
    level = 18,
    player_level = 80,
    currency = [{1,370000}],
    skillcoin_cost = 1,
    item = [],
    describe = "持续回血4次，每次恢复85%魔法攻击的生命值",
    id = 0
    };
getRow(221007,19)->
    #player_skills_upgradingCfg {
    skillID = 221007,
    level = 19,
    player_level = 82,
    currency = [{1,390000}],
    skillcoin_cost = 1,
    item = [],
    describe = "持续回血4次，每次恢复86%魔法攻击的生命值",
    id = 0
    };
getRow(221007,20)->
    #player_skills_upgradingCfg {
    skillID = 221007,
    level = 20,
    player_level = 84,
    currency = [{1,410000}],
    skillcoin_cost = 1,
    item = [],
    describe = "持续回血4次，每次恢复87%魔法攻击的生命值",
    id = 0
    };
getRow(221007,21)->
    #player_skills_upgradingCfg {
    skillID = 221007,
    level = 21,
    player_level = 86,
    currency = [{1,430000}],
    skillcoin_cost = 1,
    item = [],
    describe = "持续回血4次，每次恢复89%魔法攻击的生命值",
    id = 0
    };
getRow(221007,22)->
    #player_skills_upgradingCfg {
    skillID = 221007,
    level = 22,
    player_level = 88,
    currency = [{1,450000}],
    skillcoin_cost = 1,
    item = [],
    describe = "持续回血4次，每次恢复90%魔法攻击的生命值",
    id = 0
    };
getRow(221007,23)->
    #player_skills_upgradingCfg {
    skillID = 221007,
    level = 23,
    player_level = 90,
    currency = [{1,470000}],
    skillcoin_cost = 1,
    item = [],
    describe = "持续回血4次，每次恢复91%魔法攻击的生命值",
    id = 0
    };
getRow(221007,24)->
    #player_skills_upgradingCfg {
    skillID = 221007,
    level = 24,
    player_level = 92,
    currency = [{1,490000}],
    skillcoin_cost = 1,
    item = [],
    describe = "持续回血4次，每次恢复92%魔法攻击的生命值",
    id = 0
    };
getRow(221007,25)->
    #player_skills_upgradingCfg {
    skillID = 221007,
    level = 25,
    player_level = 94,
    currency = [{1,510000}],
    skillcoin_cost = 1,
    item = [],
    describe = "持续回血4次，每次恢复94%魔法攻击的生命值",
    id = 0
    };
getRow(221008,1)->
    #player_skills_upgradingCfg {
    skillID = 221008,
    level = 1,
    player_level = 60,
    currency = [],
    skillcoin_cost = 1,
    item = [],
    describe = "解除所有自身所有负面状态并瞬移到30米外，自身抗暴等级增加30%，持续5秒",
    id = 0
    };
getRow(221008,2)->
    #player_skills_upgradingCfg {
    skillID = 221008,
    level = 2,
    player_level = 60,
    currency = [{1,70000}],
    skillcoin_cost = 1,
    item = [],
    describe = "解除所有自身所有负面状态并瞬移到30米外，自身抗暴等级增加32%，持续5秒",
    id = 0
    };
getRow(221008,3)->
    #player_skills_upgradingCfg {
    skillID = 221008,
    level = 3,
    player_level = 60,
    currency = [{1,110000}],
    skillcoin_cost = 1,
    item = [],
    describe = "解除所有自身所有负面状态并瞬移到30米外，自身抗暴等级增加34%，持续5秒",
    id = 0
    };
getRow(221008,4)->
    #player_skills_upgradingCfg {
    skillID = 221008,
    level = 4,
    player_level = 60,
    currency = [{1,150000}],
    skillcoin_cost = 1,
    item = [],
    describe = "解除所有自身所有负面状态并瞬移到30米外，自身抗暴等级增加36%，持续5秒",
    id = 0
    };
getRow(221008,5)->
    #player_skills_upgradingCfg {
    skillID = 221008,
    level = 5,
    player_level = 62,
    currency = [{1,190000}],
    skillcoin_cost = 1,
    item = [],
    describe = "解除所有自身所有负面状态并瞬移到30米外，自身抗暴等级增加38%，持续5秒",
    id = 0
    };
getRow(221008,6)->
    #player_skills_upgradingCfg {
    skillID = 221008,
    level = 6,
    player_level = 66,
    currency = [{1,230000}],
    skillcoin_cost = 1,
    item = [],
    describe = "解除所有自身所有负面状态并瞬移到30米外，自身抗暴等级增加40%，持续5秒",
    id = 0
    };
getRow(221008,7)->
    #player_skills_upgradingCfg {
    skillID = 221008,
    level = 7,
    player_level = 70,
    currency = [{1,270000}],
    skillcoin_cost = 1,
    item = [],
    describe = "解除所有自身所有负面状态并瞬移到30米外，自身抗暴等级增加42%，持续5秒",
    id = 0
    };
getRow(221008,8)->
    #player_skills_upgradingCfg {
    skillID = 221008,
    level = 8,
    player_level = 74,
    currency = [{1,310000}],
    skillcoin_cost = 1,
    item = [],
    describe = "解除所有自身所有负面状态并瞬移到30米外，自身抗暴等级增加44%，持续5秒",
    id = 0
    };
getRow(221008,9)->
    #player_skills_upgradingCfg {
    skillID = 221008,
    level = 9,
    player_level = 78,
    currency = [{1,350000}],
    skillcoin_cost = 1,
    item = [],
    describe = "解除所有自身所有负面状态并瞬移到30米外，自身抗暴等级增加46%，持续5秒",
    id = 0
    };
getRow(221008,10)->
    #player_skills_upgradingCfg {
    skillID = 221008,
    level = 10,
    player_level = 82,
    currency = [{1,390000}],
    skillcoin_cost = 1,
    item = [],
    describe = "解除所有自身所有负面状态并瞬移到30米外，自身抗暴等级增加48%，持续5秒",
    id = 0
    };
getRow(221008,11)->
    #player_skills_upgradingCfg {
    skillID = 221008,
    level = 11,
    player_level = 86,
    currency = [{1,430000}],
    skillcoin_cost = 1,
    item = [],
    describe = "解除所有自身所有负面状态并瞬移到30米外，自身抗暴等级增加50%，持续5秒",
    id = 0
    };
getRow(221009,1)->
    #player_skills_upgradingCfg {
    skillID = 221009,
    level = 1,
    player_level = 60,
    currency = [],
    skillcoin_cost = 1,
    item = [],
    describe = "增强队友的15%魔法防御力，持续10分钟",
    id = 0
    };
getRow(221009,2)->
    #player_skills_upgradingCfg {
    skillID = 221009,
    level = 2,
    player_level = 60,
    currency = [{1,70000}],
    skillcoin_cost = 1,
    item = [],
    describe = "增强队友的16%魔法防御力，持续10分钟",
    id = 0
    };
getRow(221009,3)->
    #player_skills_upgradingCfg {
    skillID = 221009,
    level = 3,
    player_level = 60,
    currency = [{1,110000}],
    skillcoin_cost = 1,
    item = [],
    describe = "增强队友的17%魔法防御力，持续10分钟",
    id = 0
    };
getRow(221009,4)->
    #player_skills_upgradingCfg {
    skillID = 221009,
    level = 4,
    player_level = 60,
    currency = [{1,150000}],
    skillcoin_cost = 1,
    item = [],
    describe = "增强队友的18%魔法防御力，持续10分钟",
    id = 0
    };
getRow(221009,5)->
    #player_skills_upgradingCfg {
    skillID = 221009,
    level = 5,
    player_level = 62,
    currency = [{1,190000}],
    skillcoin_cost = 1,
    item = [],
    describe = "增强队友的19%魔法防御力，持续10分钟",
    id = 0
    };
getRow(221009,6)->
    #player_skills_upgradingCfg {
    skillID = 221009,
    level = 6,
    player_level = 66,
    currency = [{1,230000}],
    skillcoin_cost = 1,
    item = [],
    describe = "增强队友的20%魔法防御力，持续10分钟",
    id = 0
    };
getRow(221009,7)->
    #player_skills_upgradingCfg {
    skillID = 221009,
    level = 7,
    player_level = 70,
    currency = [{1,270000}],
    skillcoin_cost = 1,
    item = [],
    describe = "增强队友的21%魔法防御力，持续10分钟",
    id = 0
    };
getRow(221009,8)->
    #player_skills_upgradingCfg {
    skillID = 221009,
    level = 8,
    player_level = 74,
    currency = [{1,310000}],
    skillcoin_cost = 1,
    item = [],
    describe = "增强队友的22%魔法防御力，持续10分钟",
    id = 0
    };
getRow(221009,9)->
    #player_skills_upgradingCfg {
    skillID = 221009,
    level = 9,
    player_level = 78,
    currency = [{1,350000}],
    skillcoin_cost = 1,
    item = [],
    describe = "增强队友的23%魔法防御力，持续10分钟",
    id = 0
    };
getRow(221009,10)->
    #player_skills_upgradingCfg {
    skillID = 221009,
    level = 10,
    player_level = 82,
    currency = [{1,390000}],
    skillcoin_cost = 1,
    item = [],
    describe = "增强队友的24%魔法防御力，持续10分钟",
    id = 0
    };
getRow(221009,11)->
    #player_skills_upgradingCfg {
    skillID = 221009,
    level = 11,
    player_level = 86,
    currency = [{1,430000}],
    skillcoin_cost = 1,
    item = [],
    describe = "增强队友的25%魔法防御力，持续10分钟",
    id = 0
    };
getRow(221010,1)->
    #player_skills_upgradingCfg {
    skillID = 221010,
    level = 1,
    player_level = 60,
    currency = [],
    skillcoin_cost = 1,
    item = [],
    describe = "自身进入不可被攻击状态，攻击力降至虚无，速度降低30%，持续5秒",
    id = 0
    };
getRow(221010,2)->
    #player_skills_upgradingCfg {
    skillID = 221010,
    level = 2,
    player_level = 60,
    currency = [{1,70000}],
    skillcoin_cost = 1,
    item = [],
    describe = "自身进入不可被攻击状态，攻击力降至虚无，速度降低25%，持续5秒",
    id = 0
    };
getRow(221010,3)->
    #player_skills_upgradingCfg {
    skillID = 221010,
    level = 3,
    player_level = 60,
    currency = [{1,110000}],
    skillcoin_cost = 1,
    item = [],
    describe = "自身进入不可被攻击状态，攻击力降至虚无，速度降低20%，持续5秒",
    id = 0
    };
getRow(221010,4)->
    #player_skills_upgradingCfg {
    skillID = 221010,
    level = 4,
    player_level = 60,
    currency = [{1,150000}],
    skillcoin_cost = 1,
    item = [],
    describe = "自身进入不可被攻击状态，攻击力降至虚无，速度降低15%，持续5秒",
    id = 0
    };
getRow(221010,5)->
    #player_skills_upgradingCfg {
    skillID = 221010,
    level = 5,
    player_level = 62,
    currency = [{1,190000}],
    skillcoin_cost = 1,
    item = [],
    describe = "自身进入不可被攻击状态，攻击力降至虚无，速度降低10%，持续5秒",
    id = 0
    };
getRow(221010,6)->
    #player_skills_upgradingCfg {
    skillID = 221010,
    level = 6,
    player_level = 66,
    currency = [{1,230000}],
    skillcoin_cost = 1,
    item = [],
    describe = "自身进入不可被攻击状态，攻击力降至虚无，速度降低5%，持续5秒",
    id = 0
    };
getRow(221010,7)->
    #player_skills_upgradingCfg {
    skillID = 221010,
    level = 7,
    player_level = 70,
    currency = [{1,270000}],
    skillcoin_cost = 1,
    item = [],
    describe = "自身进入不可被攻击状态，攻击力降至虚无，速度不变，持续5秒",
    id = 0
    };
getRow(221010,8)->
    #player_skills_upgradingCfg {
    skillID = 221010,
    level = 8,
    player_level = 74,
    currency = [{1,310000}],
    skillcoin_cost = 1,
    item = [],
    describe = "自身进入不可被攻击状态，攻击力降至虚无，速度增加5%，持续5秒",
    id = 0
    };
getRow(221010,9)->
    #player_skills_upgradingCfg {
    skillID = 221010,
    level = 9,
    player_level = 78,
    currency = [{1,350000}],
    skillcoin_cost = 1,
    item = [],
    describe = "自身进入不可被攻击状态，攻击力降至虚无，速度增加10%，持续5秒",
    id = 0
    };
getRow(221010,10)->
    #player_skills_upgradingCfg {
    skillID = 221010,
    level = 10,
    player_level = 82,
    currency = [{1,390000}],
    skillcoin_cost = 1,
    item = [],
    describe = "自身进入不可被攻击状态，攻击力降至虚无，速度增加15%，持续5秒",
    id = 0
    };
getRow(221010,11)->
    #player_skills_upgradingCfg {
    skillID = 221010,
    level = 11,
    player_level = 86,
    currency = [{1,430000}],
    skillcoin_cost = 1,
    item = [],
    describe = "自身进入不可被攻击状态，攻击力降至虚无，速度增加20%，持续5秒",
    id = 0
    };
getRow(221104,1)->
    #player_skills_upgradingCfg {
    skillID = 221104,
    level = 1,
    player_level = 60,
    currency = [],
    skillcoin_cost = 1,
    item = [],
    describe = "打出一道黄色旋风，席卷前方直线目标，对目标造成400%魔法攻击的伤害，并击退目标",
    id = 0
    };
getRow(221104,2)->
    #player_skills_upgradingCfg {
    skillID = 221104,
    level = 2,
    player_level = 60,
    currency = [{1,50000}],
    skillcoin_cost = 1,
    item = [],
    describe = "打出一道黄色旋风，席卷前方直线目标，对目标造成415%魔法攻击的伤害，并击退目标",
    id = 0
    };
getRow(221104,3)->
    #player_skills_upgradingCfg {
    skillID = 221104,
    level = 3,
    player_level = 60,
    currency = [{1,70000}],
    skillcoin_cost = 1,
    item = [],
    describe = "打出一道黄色旋风，席卷前方直线目标，对目标造成430%魔法攻击的伤害，并击退目标",
    id = 0
    };
getRow(221104,4)->
    #player_skills_upgradingCfg {
    skillID = 221104,
    level = 4,
    player_level = 60,
    currency = [{1,90000}],
    skillcoin_cost = 1,
    item = [],
    describe = "打出一道黄色旋风，席卷前方直线目标，对目标造成445%魔法攻击的伤害，并击退目标",
    id = 0
    };
getRow(221104,5)->
    #player_skills_upgradingCfg {
    skillID = 221104,
    level = 5,
    player_level = 60,
    currency = [{1,110000}],
    skillcoin_cost = 1,
    item = [],
    describe = "打出一道黄色旋风，席卷前方直线目标，对目标造成460%魔法攻击的伤害，并击退目标",
    id = 0
    };
getRow(221104,6)->
    #player_skills_upgradingCfg {
    skillID = 221104,
    level = 6,
    player_level = 60,
    currency = [{1,130000}],
    skillcoin_cost = 1,
    item = [],
    describe = "打出一道黄色旋风，席卷前方直线目标，对目标造成475%魔法攻击的伤害，并击退目标",
    id = 0
    };
getRow(221104,7)->
    #player_skills_upgradingCfg {
    skillID = 221104,
    level = 7,
    player_level = 60,
    currency = [{1,150000}],
    skillcoin_cost = 1,
    item = [],
    describe = "打出一道黄色旋风，席卷前方直线目标，对目标造成490%魔法攻击的伤害，并击退目标",
    id = 0
    };
getRow(221104,8)->
    #player_skills_upgradingCfg {
    skillID = 221104,
    level = 8,
    player_level = 60,
    currency = [{1,170000}],
    skillcoin_cost = 1,
    item = [],
    describe = "打出一道黄色旋风，席卷前方直线目标，对目标造成505%魔法攻击的伤害，并击退目标",
    id = 0
    };
getRow(221104,9)->
    #player_skills_upgradingCfg {
    skillID = 221104,
    level = 9,
    player_level = 62,
    currency = [{1,190000}],
    skillcoin_cost = 1,
    item = [],
    describe = "打出一道黄色旋风，席卷前方直线目标，对目标造成520%魔法攻击的伤害，并击退目标",
    id = 0
    };
getRow(221104,10)->
    #player_skills_upgradingCfg {
    skillID = 221104,
    level = 10,
    player_level = 64,
    currency = [{1,210000}],
    skillcoin_cost = 1,
    item = [],
    describe = "打出一道黄色旋风，席卷前方直线目标，对目标造成535%魔法攻击的伤害，并击退目标",
    id = 0
    };
getRow(221104,11)->
    #player_skills_upgradingCfg {
    skillID = 221104,
    level = 11,
    player_level = 66,
    currency = [{1,230000}],
    skillcoin_cost = 1,
    item = [],
    describe = "打出一道黄色旋风，席卷前方直线目标，对目标造成550%魔法攻击的伤害，并击退目标",
    id = 0
    };
getRow(221104,12)->
    #player_skills_upgradingCfg {
    skillID = 221104,
    level = 12,
    player_level = 68,
    currency = [{1,250000}],
    skillcoin_cost = 1,
    item = [],
    describe = "打出一道黄色旋风，席卷前方直线目标，对目标造成565%魔法攻击的伤害，并击退目标",
    id = 0
    };
getRow(221104,13)->
    #player_skills_upgradingCfg {
    skillID = 221104,
    level = 13,
    player_level = 70,
    currency = [{1,270000}],
    skillcoin_cost = 1,
    item = [],
    describe = "打出一道黄色旋风，席卷前方直线目标，对目标造成580%魔法攻击的伤害，并击退目标",
    id = 0
    };
getRow(221104,14)->
    #player_skills_upgradingCfg {
    skillID = 221104,
    level = 14,
    player_level = 72,
    currency = [{1,290000}],
    skillcoin_cost = 1,
    item = [],
    describe = "打出一道黄色旋风，席卷前方直线目标，对目标造成595%魔法攻击的伤害，并击退目标",
    id = 0
    };
getRow(221104,15)->
    #player_skills_upgradingCfg {
    skillID = 221104,
    level = 15,
    player_level = 74,
    currency = [{1,310000}],
    skillcoin_cost = 1,
    item = [],
    describe = "打出一道黄色旋风，席卷前方直线目标，对目标造成610%魔法攻击的伤害，并击退目标",
    id = 0
    };
getRow(221104,16)->
    #player_skills_upgradingCfg {
    skillID = 221104,
    level = 16,
    player_level = 76,
    currency = [{1,330000}],
    skillcoin_cost = 1,
    item = [],
    describe = "打出一道黄色旋风，席卷前方直线目标，对目标造成625%魔法攻击的伤害，并击退目标",
    id = 0
    };
getRow(221104,17)->
    #player_skills_upgradingCfg {
    skillID = 221104,
    level = 17,
    player_level = 78,
    currency = [{1,350000}],
    skillcoin_cost = 1,
    item = [],
    describe = "打出一道黄色旋风，席卷前方直线目标，对目标造成640%魔法攻击的伤害，并击退目标",
    id = 0
    };
getRow(221104,18)->
    #player_skills_upgradingCfg {
    skillID = 221104,
    level = 18,
    player_level = 80,
    currency = [{1,370000}],
    skillcoin_cost = 1,
    item = [],
    describe = "打出一道黄色旋风，席卷前方直线目标，对目标造成655%魔法攻击的伤害，并击退目标",
    id = 0
    };
getRow(221104,19)->
    #player_skills_upgradingCfg {
    skillID = 221104,
    level = 19,
    player_level = 82,
    currency = [{1,390000}],
    skillcoin_cost = 1,
    item = [],
    describe = "打出一道黄色旋风，席卷前方直线目标，对目标造成670%魔法攻击的伤害，并击退目标",
    id = 0
    };
getRow(221104,20)->
    #player_skills_upgradingCfg {
    skillID = 221104,
    level = 20,
    player_level = 84,
    currency = [{1,410000}],
    skillcoin_cost = 1,
    item = [],
    describe = "打出一道黄色旋风，席卷前方直线目标，对目标造成685%魔法攻击的伤害，并击退目标",
    id = 0
    };
getRow(221104,21)->
    #player_skills_upgradingCfg {
    skillID = 221104,
    level = 21,
    player_level = 86,
    currency = [{1,430000}],
    skillcoin_cost = 1,
    item = [],
    describe = "打出一道黄色旋风，席卷前方直线目标，对目标造成700%魔法攻击的伤害，并击退目标",
    id = 0
    };
getRow(221104,22)->
    #player_skills_upgradingCfg {
    skillID = 221104,
    level = 22,
    player_level = 88,
    currency = [{1,450000}],
    skillcoin_cost = 1,
    item = [],
    describe = "打出一道黄色旋风，席卷前方直线目标，对目标造成715%魔法攻击的伤害，并击退目标",
    id = 0
    };
getRow(221104,23)->
    #player_skills_upgradingCfg {
    skillID = 221104,
    level = 23,
    player_level = 90,
    currency = [{1,470000}],
    skillcoin_cost = 1,
    item = [],
    describe = "打出一道黄色旋风，席卷前方直线目标，对目标造成730%魔法攻击的伤害，并击退目标",
    id = 0
    };
getRow(221104,24)->
    #player_skills_upgradingCfg {
    skillID = 221104,
    level = 24,
    player_level = 92,
    currency = [{1,490000}],
    skillcoin_cost = 1,
    item = [],
    describe = "打出一道黄色旋风，席卷前方直线目标，对目标造成745%魔法攻击的伤害，并击退目标",
    id = 0
    };
getRow(221104,25)->
    #player_skills_upgradingCfg {
    skillID = 221104,
    level = 25,
    player_level = 94,
    currency = [{1,510000}],
    skillcoin_cost = 1,
    item = [],
    describe = "打出一道黄色旋风，席卷前方直线目标，对目标造成760%魔法攻击的伤害，并击退目标",
    id = 0
    };
getRow(222002,1)->
    #player_skills_upgradingCfg {
    skillID = 222002,
    level = 1,
    player_level = 60,
    currency = [],
    skillcoin_cost = 1,
    item = [],
    describe = "对目标及其周围造成80%魔法攻击的伤害，并附带同等伤害的灼烧效果，持续4秒",
    id = 0
    };
getRow(222002,2)->
    #player_skills_upgradingCfg {
    skillID = 222002,
    level = 2,
    player_level = 60,
    currency = [{1,50000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对目标及其周围造成83%魔法攻击的伤害，并附带同等伤害的灼烧效果，持续4秒",
    id = 0
    };
getRow(222002,3)->
    #player_skills_upgradingCfg {
    skillID = 222002,
    level = 3,
    player_level = 60,
    currency = [{1,70000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对目标及其周围造成86%魔法攻击的伤害，并附带同等伤害的灼烧效果，持续4秒",
    id = 0
    };
getRow(222002,4)->
    #player_skills_upgradingCfg {
    skillID = 222002,
    level = 4,
    player_level = 60,
    currency = [{1,90000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对目标及其周围造成89%魔法攻击的伤害，并附带同等伤害的灼烧效果，持续4秒",
    id = 0
    };
getRow(222002,5)->
    #player_skills_upgradingCfg {
    skillID = 222002,
    level = 5,
    player_level = 60,
    currency = [{1,110000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对目标及其周围造成92%魔法攻击的伤害，并附带同等伤害的灼烧效果，持续4秒",
    id = 0
    };
getRow(222002,6)->
    #player_skills_upgradingCfg {
    skillID = 222002,
    level = 6,
    player_level = 60,
    currency = [{1,130000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对目标及其周围造成95%魔法攻击的伤害，并附带同等伤害的灼烧效果，持续4秒",
    id = 0
    };
getRow(222002,7)->
    #player_skills_upgradingCfg {
    skillID = 222002,
    level = 7,
    player_level = 60,
    currency = [{1,150000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对目标及其周围造成98%魔法攻击的伤害，并附带同等伤害的灼烧效果，持续4秒",
    id = 0
    };
getRow(222002,8)->
    #player_skills_upgradingCfg {
    skillID = 222002,
    level = 8,
    player_level = 60,
    currency = [{1,170000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对目标及其周围造成101%魔法攻击的伤害，并附带同等伤害的灼烧效果，持续4秒",
    id = 0
    };
getRow(222002,9)->
    #player_skills_upgradingCfg {
    skillID = 222002,
    level = 9,
    player_level = 62,
    currency = [{1,190000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对目标及其周围造成104%魔法攻击的伤害，并附带同等伤害的灼烧效果，持续4秒",
    id = 0
    };
getRow(222002,10)->
    #player_skills_upgradingCfg {
    skillID = 222002,
    level = 10,
    player_level = 64,
    currency = [{1,210000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对目标及其周围造成107%魔法攻击的伤害，并附带同等伤害的灼烧效果，持续4秒",
    id = 0
    };
getRow(222002,11)->
    #player_skills_upgradingCfg {
    skillID = 222002,
    level = 11,
    player_level = 66,
    currency = [{1,230000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对目标及其周围造成110%魔法攻击的伤害，并附带同等伤害的灼烧效果，持续4秒",
    id = 0
    };
getRow(222002,12)->
    #player_skills_upgradingCfg {
    skillID = 222002,
    level = 12,
    player_level = 68,
    currency = [{1,250000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对目标及其周围造成113%魔法攻击的伤害，并附带同等伤害的灼烧效果，持续4秒",
    id = 0
    };
getRow(222002,13)->
    #player_skills_upgradingCfg {
    skillID = 222002,
    level = 13,
    player_level = 70,
    currency = [{1,270000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对目标及其周围造成116%魔法攻击的伤害，并附带同等伤害的灼烧效果，持续4秒",
    id = 0
    };
getRow(222002,14)->
    #player_skills_upgradingCfg {
    skillID = 222002,
    level = 14,
    player_level = 72,
    currency = [{1,290000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对目标及其周围造成119%魔法攻击的伤害，并附带同等伤害的灼烧效果，持续4秒",
    id = 0
    };
getRow(222002,15)->
    #player_skills_upgradingCfg {
    skillID = 222002,
    level = 15,
    player_level = 74,
    currency = [{1,310000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对目标及其周围造成122%魔法攻击的伤害，并附带同等伤害的灼烧效果，持续4秒",
    id = 0
    };
getRow(222002,16)->
    #player_skills_upgradingCfg {
    skillID = 222002,
    level = 16,
    player_level = 76,
    currency = [{1,330000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对目标及其周围造成125%魔法攻击的伤害，并附带同等伤害的灼烧效果，持续4秒",
    id = 0
    };
getRow(222002,17)->
    #player_skills_upgradingCfg {
    skillID = 222002,
    level = 17,
    player_level = 78,
    currency = [{1,350000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对目标及其周围造成128%魔法攻击的伤害，并附带同等伤害的灼烧效果，持续4秒",
    id = 0
    };
getRow(222002,18)->
    #player_skills_upgradingCfg {
    skillID = 222002,
    level = 18,
    player_level = 80,
    currency = [{1,370000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对目标及其周围造成131%魔法攻击的伤害，并附带同等伤害的灼烧效果，持续4秒",
    id = 0
    };
getRow(222002,19)->
    #player_skills_upgradingCfg {
    skillID = 222002,
    level = 19,
    player_level = 82,
    currency = [{1,390000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对目标及其周围造成134%魔法攻击的伤害，并附带同等伤害的灼烧效果，持续4秒",
    id = 0
    };
getRow(222002,20)->
    #player_skills_upgradingCfg {
    skillID = 222002,
    level = 20,
    player_level = 84,
    currency = [{1,410000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对目标及其周围造成137%魔法攻击的伤害，并附带同等伤害的灼烧效果，持续4秒",
    id = 0
    };
getRow(222002,21)->
    #player_skills_upgradingCfg {
    skillID = 222002,
    level = 21,
    player_level = 86,
    currency = [{1,430000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对目标及其周围造成140%魔法攻击的伤害，并附带同等伤害的灼烧效果，持续4秒",
    id = 0
    };
getRow(222002,22)->
    #player_skills_upgradingCfg {
    skillID = 222002,
    level = 22,
    player_level = 88,
    currency = [{1,450000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对目标及其周围造成143%魔法攻击的伤害，并附带同等伤害的灼烧效果，持续4秒",
    id = 0
    };
getRow(222002,23)->
    #player_skills_upgradingCfg {
    skillID = 222002,
    level = 23,
    player_level = 90,
    currency = [{1,470000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对目标及其周围造成146%魔法攻击的伤害，并附带同等伤害的灼烧效果，持续4秒",
    id = 0
    };
getRow(222002,24)->
    #player_skills_upgradingCfg {
    skillID = 222002,
    level = 24,
    player_level = 92,
    currency = [{1,490000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对目标及其周围造成149%魔法攻击的伤害，并附带同等伤害的灼烧效果，持续4秒",
    id = 0
    };
getRow(222002,25)->
    #player_skills_upgradingCfg {
    skillID = 222002,
    level = 25,
    player_level = 94,
    currency = [{1,510000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对目标及其周围造成152%魔法攻击的伤害，并附带同等伤害的灼烧效果，持续4秒",
    id = 0
    };
getRow(222003,1)->
    #player_skills_upgradingCfg {
    skillID = 222003,
    level = 1,
    player_level = 60,
    currency = [],
    skillcoin_cost = 1,
    item = [],
    describe = "自身周围持续降下暴风雪造成3次117%魔法攻击的伤害，有概率造成冰冻效果，持续2秒",
    id = 0
    };
getRow(222003,2)->
    #player_skills_upgradingCfg {
    skillID = 222003,
    level = 2,
    player_level = 60,
    currency = [{1,50000}],
    skillcoin_cost = 1,
    item = [],
    describe = "自身周围持续降下暴风雪造成3次121%魔法攻击的伤害，有概率造成冰冻效果，持续2秒",
    id = 0
    };
getRow(222003,3)->
    #player_skills_upgradingCfg {
    skillID = 222003,
    level = 3,
    player_level = 60,
    currency = [{1,70000}],
    skillcoin_cost = 1,
    item = [],
    describe = "自身周围持续降下暴风雪造成3次125%魔法攻击的伤害，有概率造成冰冻效果，持续2秒",
    id = 0
    };
getRow(222003,4)->
    #player_skills_upgradingCfg {
    skillID = 222003,
    level = 4,
    player_level = 60,
    currency = [{1,90000}],
    skillcoin_cost = 1,
    item = [],
    describe = "自身周围持续降下暴风雪造成3次129%魔法攻击的伤害，有概率造成冰冻效果，持续2秒",
    id = 0
    };
getRow(222003,5)->
    #player_skills_upgradingCfg {
    skillID = 222003,
    level = 5,
    player_level = 60,
    currency = [{1,110000}],
    skillcoin_cost = 1,
    item = [],
    describe = "自身周围持续降下暴风雪造成3次133%魔法攻击的伤害，有概率造成冰冻效果，持续2秒",
    id = 0
    };
getRow(222003,6)->
    #player_skills_upgradingCfg {
    skillID = 222003,
    level = 6,
    player_level = 60,
    currency = [{1,130000}],
    skillcoin_cost = 1,
    item = [],
    describe = "自身周围持续降下暴风雪造成3次137%魔法攻击的伤害，有概率造成冰冻效果，持续2秒",
    id = 0
    };
getRow(222003,7)->
    #player_skills_upgradingCfg {
    skillID = 222003,
    level = 7,
    player_level = 60,
    currency = [{1,150000}],
    skillcoin_cost = 1,
    item = [],
    describe = "自身周围持续降下暴风雪造成3次141%魔法攻击的伤害，有概率造成冰冻效果，持续2秒",
    id = 0
    };
getRow(222003,8)->
    #player_skills_upgradingCfg {
    skillID = 222003,
    level = 8,
    player_level = 60,
    currency = [{1,170000}],
    skillcoin_cost = 1,
    item = [],
    describe = "自身周围持续降下暴风雪造成3次145%魔法攻击的伤害，有概率造成冰冻效果，持续2秒",
    id = 0
    };
getRow(222003,9)->
    #player_skills_upgradingCfg {
    skillID = 222003,
    level = 9,
    player_level = 62,
    currency = [{1,190000}],
    skillcoin_cost = 1,
    item = [],
    describe = "自身周围持续降下暴风雪造成3次149%魔法攻击的伤害，有概率造成冰冻效果，持续2秒",
    id = 0
    };
getRow(222003,10)->
    #player_skills_upgradingCfg {
    skillID = 222003,
    level = 10,
    player_level = 64,
    currency = [{1,210000}],
    skillcoin_cost = 1,
    item = [],
    describe = "自身周围持续降下暴风雪造成3次153%魔法攻击的伤害，有概率造成冰冻效果，持续2秒",
    id = 0
    };
getRow(222003,11)->
    #player_skills_upgradingCfg {
    skillID = 222003,
    level = 11,
    player_level = 66,
    currency = [{1,230000}],
    skillcoin_cost = 1,
    item = [],
    describe = "自身周围持续降下暴风雪造成3次157%魔法攻击的伤害，有概率造成冰冻效果，持续2秒",
    id = 0
    };
getRow(222003,12)->
    #player_skills_upgradingCfg {
    skillID = 222003,
    level = 12,
    player_level = 68,
    currency = [{1,250000}],
    skillcoin_cost = 1,
    item = [],
    describe = "自身周围持续降下暴风雪造成3次161%魔法攻击的伤害，有概率造成冰冻效果，持续2秒",
    id = 0
    };
getRow(222003,13)->
    #player_skills_upgradingCfg {
    skillID = 222003,
    level = 13,
    player_level = 70,
    currency = [{1,270000}],
    skillcoin_cost = 1,
    item = [],
    describe = "自身周围持续降下暴风雪造成3次165%魔法攻击的伤害，有概率造成冰冻效果，持续2秒",
    id = 0
    };
getRow(222003,14)->
    #player_skills_upgradingCfg {
    skillID = 222003,
    level = 14,
    player_level = 72,
    currency = [{1,290000}],
    skillcoin_cost = 1,
    item = [],
    describe = "自身周围持续降下暴风雪造成3次169%魔法攻击的伤害，有概率造成冰冻效果，持续2秒",
    id = 0
    };
getRow(222003,15)->
    #player_skills_upgradingCfg {
    skillID = 222003,
    level = 15,
    player_level = 74,
    currency = [{1,310000}],
    skillcoin_cost = 1,
    item = [],
    describe = "自身周围持续降下暴风雪造成3次173%魔法攻击的伤害，有概率造成冰冻效果，持续2秒",
    id = 0
    };
getRow(222003,16)->
    #player_skills_upgradingCfg {
    skillID = 222003,
    level = 16,
    player_level = 76,
    currency = [{1,330000}],
    skillcoin_cost = 1,
    item = [],
    describe = "自身周围持续降下暴风雪造成3次177%魔法攻击的伤害，有概率造成冰冻效果，持续2秒",
    id = 0
    };
getRow(222003,17)->
    #player_skills_upgradingCfg {
    skillID = 222003,
    level = 17,
    player_level = 78,
    currency = [{1,350000}],
    skillcoin_cost = 1,
    item = [],
    describe = "自身周围持续降下暴风雪造成3次181%魔法攻击的伤害，有概率造成冰冻效果，持续2秒",
    id = 0
    };
getRow(222003,18)->
    #player_skills_upgradingCfg {
    skillID = 222003,
    level = 18,
    player_level = 80,
    currency = [{1,370000}],
    skillcoin_cost = 1,
    item = [],
    describe = "自身周围持续降下暴风雪造成3次185%魔法攻击的伤害，有概率造成冰冻效果，持续2秒",
    id = 0
    };
getRow(222003,19)->
    #player_skills_upgradingCfg {
    skillID = 222003,
    level = 19,
    player_level = 82,
    currency = [{1,390000}],
    skillcoin_cost = 1,
    item = [],
    describe = "自身周围持续降下暴风雪造成3次189%魔法攻击的伤害，有概率造成冰冻效果，持续2秒",
    id = 0
    };
getRow(222003,20)->
    #player_skills_upgradingCfg {
    skillID = 222003,
    level = 20,
    player_level = 84,
    currency = [{1,410000}],
    skillcoin_cost = 1,
    item = [],
    describe = "自身周围持续降下暴风雪造成3次193%魔法攻击的伤害，有概率造成冰冻效果，持续2秒",
    id = 0
    };
getRow(222003,21)->
    #player_skills_upgradingCfg {
    skillID = 222003,
    level = 21,
    player_level = 86,
    currency = [{1,430000}],
    skillcoin_cost = 1,
    item = [],
    describe = "自身周围持续降下暴风雪造成3次197%魔法攻击的伤害，有概率造成冰冻效果，持续2秒",
    id = 0
    };
getRow(222003,22)->
    #player_skills_upgradingCfg {
    skillID = 222003,
    level = 22,
    player_level = 88,
    currency = [{1,450000}],
    skillcoin_cost = 1,
    item = [],
    describe = "自身周围持续降下暴风雪造成3次201%魔法攻击的伤害，有概率造成冰冻效果，持续2秒",
    id = 0
    };
getRow(222003,23)->
    #player_skills_upgradingCfg {
    skillID = 222003,
    level = 23,
    player_level = 90,
    currency = [{1,470000}],
    skillcoin_cost = 1,
    item = [],
    describe = "自身周围持续降下暴风雪造成3次205%魔法攻击的伤害，有概率造成冰冻效果，持续2秒",
    id = 0
    };
getRow(222003,24)->
    #player_skills_upgradingCfg {
    skillID = 222003,
    level = 24,
    player_level = 92,
    currency = [{1,490000}],
    skillcoin_cost = 1,
    item = [],
    describe = "自身周围持续降下暴风雪造成3次209%魔法攻击的伤害，有概率造成冰冻效果，持续2秒",
    id = 0
    };
getRow(222003,25)->
    #player_skills_upgradingCfg {
    skillID = 222003,
    level = 25,
    player_level = 94,
    currency = [{1,510000}],
    skillcoin_cost = 1,
    item = [],
    describe = "自身周围持续降下暴风雪造成3次213%魔法攻击的伤害，有概率造成冰冻效果，持续2秒",
    id = 0
    };
getRow(222004,1)->
    #player_skills_upgradingCfg {
    skillID = 222004,
    level = 1,
    player_level = 60,
    currency = [],
    skillcoin_cost = 1,
    item = [],
    describe = "对前方矩形区域造成350%魔法攻击的雷电伤害，并有概率造成击晕效果，持续1秒",
    id = 0
    };
getRow(222004,2)->
    #player_skills_upgradingCfg {
    skillID = 222004,
    level = 2,
    player_level = 60,
    currency = [{1,50000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对前方矩形区域造成362%魔法攻击的雷电伤害，并有概率造成击晕效果，持续1秒",
    id = 0
    };
getRow(222004,3)->
    #player_skills_upgradingCfg {
    skillID = 222004,
    level = 3,
    player_level = 60,
    currency = [{1,70000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对前方矩形区域造成374%魔法攻击的雷电伤害，并有概率造成击晕效果，持续1秒",
    id = 0
    };
getRow(222004,4)->
    #player_skills_upgradingCfg {
    skillID = 222004,
    level = 4,
    player_level = 60,
    currency = [{1,90000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对前方矩形区域造成386%魔法攻击的雷电伤害，并有概率造成击晕效果，持续1秒",
    id = 0
    };
getRow(222004,5)->
    #player_skills_upgradingCfg {
    skillID = 222004,
    level = 5,
    player_level = 60,
    currency = [{1,110000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对前方矩形区域造成398%魔法攻击的雷电伤害，并有概率造成击晕效果，持续1秒",
    id = 0
    };
getRow(222004,6)->
    #player_skills_upgradingCfg {
    skillID = 222004,
    level = 6,
    player_level = 60,
    currency = [{1,130000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对前方矩形区域造成410%魔法攻击的雷电伤害，并有概率造成击晕效果，持续1秒",
    id = 0
    };
getRow(222004,7)->
    #player_skills_upgradingCfg {
    skillID = 222004,
    level = 7,
    player_level = 60,
    currency = [{1,150000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对前方矩形区域造成422%魔法攻击的雷电伤害，并有概率造成击晕效果，持续1秒",
    id = 0
    };
getRow(222004,8)->
    #player_skills_upgradingCfg {
    skillID = 222004,
    level = 8,
    player_level = 60,
    currency = [{1,170000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对前方矩形区域造成434%魔法攻击的雷电伤害，并有概率造成击晕效果，持续1秒",
    id = 0
    };
getRow(222004,9)->
    #player_skills_upgradingCfg {
    skillID = 222004,
    level = 9,
    player_level = 62,
    currency = [{1,190000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对前方矩形区域造成446%魔法攻击的雷电伤害，并有概率造成击晕效果，持续1秒",
    id = 0
    };
getRow(222004,10)->
    #player_skills_upgradingCfg {
    skillID = 222004,
    level = 10,
    player_level = 64,
    currency = [{1,210000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对前方矩形区域造成458%魔法攻击的雷电伤害，并有概率造成击晕效果，持续1秒",
    id = 0
    };
getRow(222004,11)->
    #player_skills_upgradingCfg {
    skillID = 222004,
    level = 11,
    player_level = 66,
    currency = [{1,230000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对前方矩形区域造成470%魔法攻击的雷电伤害，并有概率造成击晕效果，持续1秒",
    id = 0
    };
getRow(222004,12)->
    #player_skills_upgradingCfg {
    skillID = 222004,
    level = 12,
    player_level = 68,
    currency = [{1,250000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对前方矩形区域造成482%魔法攻击的雷电伤害，并有概率造成击晕效果，持续1秒",
    id = 0
    };
getRow(222004,13)->
    #player_skills_upgradingCfg {
    skillID = 222004,
    level = 13,
    player_level = 70,
    currency = [{1,270000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对前方矩形区域造成494%魔法攻击的雷电伤害，并有概率造成击晕效果，持续1秒",
    id = 0
    };
getRow(222004,14)->
    #player_skills_upgradingCfg {
    skillID = 222004,
    level = 14,
    player_level = 72,
    currency = [{1,290000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对前方矩形区域造成506%魔法攻击的雷电伤害，并有概率造成击晕效果，持续1秒",
    id = 0
    };
getRow(222004,15)->
    #player_skills_upgradingCfg {
    skillID = 222004,
    level = 15,
    player_level = 74,
    currency = [{1,310000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对前方矩形区域造成518%魔法攻击的雷电伤害，并有概率造成击晕效果，持续1秒",
    id = 0
    };
getRow(222004,16)->
    #player_skills_upgradingCfg {
    skillID = 222004,
    level = 16,
    player_level = 76,
    currency = [{1,330000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对前方矩形区域造成530%魔法攻击的雷电伤害，并有概率造成击晕效果，持续1秒",
    id = 0
    };
getRow(222004,17)->
    #player_skills_upgradingCfg {
    skillID = 222004,
    level = 17,
    player_level = 78,
    currency = [{1,350000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对前方矩形区域造成542%魔法攻击的雷电伤害，并有概率造成击晕效果，持续1秒",
    id = 0
    };
getRow(222004,18)->
    #player_skills_upgradingCfg {
    skillID = 222004,
    level = 18,
    player_level = 80,
    currency = [{1,370000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对前方矩形区域造成554%魔法攻击的雷电伤害，并有概率造成击晕效果，持续1秒",
    id = 0
    };
getRow(222004,19)->
    #player_skills_upgradingCfg {
    skillID = 222004,
    level = 19,
    player_level = 82,
    currency = [{1,390000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对前方矩形区域造成566%魔法攻击的雷电伤害，并有概率造成击晕效果，持续1秒",
    id = 0
    };
getRow(222004,20)->
    #player_skills_upgradingCfg {
    skillID = 222004,
    level = 20,
    player_level = 84,
    currency = [{1,410000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对前方矩形区域造成578%魔法攻击的雷电伤害，并有概率造成击晕效果，持续1秒",
    id = 0
    };
getRow(222004,21)->
    #player_skills_upgradingCfg {
    skillID = 222004,
    level = 21,
    player_level = 86,
    currency = [{1,430000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对前方矩形区域造成590%魔法攻击的雷电伤害，并有概率造成击晕效果，持续1秒",
    id = 0
    };
getRow(222004,22)->
    #player_skills_upgradingCfg {
    skillID = 222004,
    level = 22,
    player_level = 88,
    currency = [{1,450000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对前方矩形区域造成602%魔法攻击的雷电伤害，并有概率造成击晕效果，持续1秒",
    id = 0
    };
getRow(222004,23)->
    #player_skills_upgradingCfg {
    skillID = 222004,
    level = 23,
    player_level = 90,
    currency = [{1,470000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对前方矩形区域造成614%魔法攻击的雷电伤害，并有概率造成击晕效果，持续1秒",
    id = 0
    };
getRow(222004,24)->
    #player_skills_upgradingCfg {
    skillID = 222004,
    level = 24,
    player_level = 92,
    currency = [{1,490000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对前方矩形区域造成626%魔法攻击的雷电伤害，并有概率造成击晕效果，持续1秒",
    id = 0
    };
getRow(222004,25)->
    #player_skills_upgradingCfg {
    skillID = 222004,
    level = 25,
    player_level = 94,
    currency = [{1,510000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对前方矩形区域造成638%魔法攻击的雷电伤害，并有概率造成击晕效果，持续1秒",
    id = 0
    };
getRow(222005,1)->
    #player_skills_upgradingCfg {
    skillID = 222005,
    level = 1,
    player_level = 60,
    currency = [],
    skillcoin_cost = 1,
    item = [],
    describe = "对敌方单体释放剧毒，持续6秒，每秒造成105%魔法攻击的伤害。",
    id = 0
    };
getRow(222005,2)->
    #player_skills_upgradingCfg {
    skillID = 222005,
    level = 2,
    player_level = 60,
    currency = [{1,50000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对敌方单体释放剧毒，持续6秒，每秒造成109%魔法攻击的伤害。",
    id = 0
    };
getRow(222005,3)->
    #player_skills_upgradingCfg {
    skillID = 222005,
    level = 3,
    player_level = 60,
    currency = [{1,70000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对敌方单体释放剧毒，持续6秒，每秒造成113%魔法攻击的伤害。",
    id = 0
    };
getRow(222005,4)->
    #player_skills_upgradingCfg {
    skillID = 222005,
    level = 4,
    player_level = 60,
    currency = [{1,90000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对敌方单体释放剧毒，持续6秒，每秒造成117%魔法攻击的伤害。",
    id = 0
    };
getRow(222005,5)->
    #player_skills_upgradingCfg {
    skillID = 222005,
    level = 5,
    player_level = 60,
    currency = [{1,110000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对敌方单体释放剧毒，持续6秒，每秒造成121%魔法攻击的伤害。",
    id = 0
    };
getRow(222005,6)->
    #player_skills_upgradingCfg {
    skillID = 222005,
    level = 6,
    player_level = 60,
    currency = [{1,130000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对敌方单体释放剧毒，持续6秒，每秒造成125%魔法攻击的伤害。",
    id = 0
    };
getRow(222005,7)->
    #player_skills_upgradingCfg {
    skillID = 222005,
    level = 7,
    player_level = 60,
    currency = [{1,150000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对敌方单体释放剧毒，持续6秒，每秒造成129%魔法攻击的伤害。",
    id = 0
    };
getRow(222005,8)->
    #player_skills_upgradingCfg {
    skillID = 222005,
    level = 8,
    player_level = 60,
    currency = [{1,170000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对敌方单体释放剧毒，持续6秒，每秒造成133%魔法攻击的伤害。",
    id = 0
    };
getRow(222005,9)->
    #player_skills_upgradingCfg {
    skillID = 222005,
    level = 9,
    player_level = 62,
    currency = [{1,190000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对敌方单体释放剧毒，持续6秒，每秒造成137%魔法攻击的伤害。",
    id = 0
    };
getRow(222005,10)->
    #player_skills_upgradingCfg {
    skillID = 222005,
    level = 10,
    player_level = 64,
    currency = [{1,210000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对敌方单体释放剧毒，持续6秒，每秒造成141%魔法攻击的伤害。",
    id = 0
    };
getRow(222005,11)->
    #player_skills_upgradingCfg {
    skillID = 222005,
    level = 11,
    player_level = 66,
    currency = [{1,230000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对敌方单体释放剧毒，持续6秒，每秒造成145%魔法攻击的伤害。",
    id = 0
    };
getRow(222005,12)->
    #player_skills_upgradingCfg {
    skillID = 222005,
    level = 12,
    player_level = 68,
    currency = [{1,250000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对敌方单体释放剧毒，持续6秒，每秒造成149%魔法攻击的伤害。",
    id = 0
    };
getRow(222005,13)->
    #player_skills_upgradingCfg {
    skillID = 222005,
    level = 13,
    player_level = 70,
    currency = [{1,270000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对敌方单体释放剧毒，持续6秒，每秒造成153%魔法攻击的伤害。",
    id = 0
    };
getRow(222005,14)->
    #player_skills_upgradingCfg {
    skillID = 222005,
    level = 14,
    player_level = 72,
    currency = [{1,290000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对敌方单体释放剧毒，持续6秒，每秒造成157%魔法攻击的伤害。",
    id = 0
    };
getRow(222005,15)->
    #player_skills_upgradingCfg {
    skillID = 222005,
    level = 15,
    player_level = 74,
    currency = [{1,310000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对敌方单体释放剧毒，持续6秒，每秒造成161%魔法攻击的伤害。",
    id = 0
    };
getRow(222005,16)->
    #player_skills_upgradingCfg {
    skillID = 222005,
    level = 16,
    player_level = 76,
    currency = [{1,330000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对敌方单体释放剧毒，持续6秒，每秒造成165%魔法攻击的伤害。",
    id = 0
    };
getRow(222005,17)->
    #player_skills_upgradingCfg {
    skillID = 222005,
    level = 17,
    player_level = 78,
    currency = [{1,350000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对敌方单体释放剧毒，持续6秒，每秒造成169%魔法攻击的伤害。",
    id = 0
    };
getRow(222005,18)->
    #player_skills_upgradingCfg {
    skillID = 222005,
    level = 18,
    player_level = 80,
    currency = [{1,370000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对敌方单体释放剧毒，持续6秒，每秒造成173%魔法攻击的伤害。",
    id = 0
    };
getRow(222005,19)->
    #player_skills_upgradingCfg {
    skillID = 222005,
    level = 19,
    player_level = 82,
    currency = [{1,390000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对敌方单体释放剧毒，持续6秒，每秒造成177%魔法攻击的伤害。",
    id = 0
    };
getRow(222005,20)->
    #player_skills_upgradingCfg {
    skillID = 222005,
    level = 20,
    player_level = 84,
    currency = [{1,410000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对敌方单体释放剧毒，持续6秒，每秒造成181%魔法攻击的伤害。",
    id = 0
    };
getRow(222005,21)->
    #player_skills_upgradingCfg {
    skillID = 222005,
    level = 21,
    player_level = 86,
    currency = [{1,430000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对敌方单体释放剧毒，持续6秒，每秒造成185%魔法攻击的伤害。",
    id = 0
    };
getRow(222005,22)->
    #player_skills_upgradingCfg {
    skillID = 222005,
    level = 22,
    player_level = 88,
    currency = [{1,450000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对敌方单体释放剧毒，持续6秒，每秒造成189%魔法攻击的伤害。",
    id = 0
    };
getRow(222005,23)->
    #player_skills_upgradingCfg {
    skillID = 222005,
    level = 23,
    player_level = 90,
    currency = [{1,470000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对敌方单体释放剧毒，持续6秒，每秒造成193%魔法攻击的伤害。",
    id = 0
    };
getRow(222005,24)->
    #player_skills_upgradingCfg {
    skillID = 222005,
    level = 24,
    player_level = 92,
    currency = [{1,490000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对敌方单体释放剧毒，持续6秒，每秒造成197%魔法攻击的伤害。",
    id = 0
    };
getRow(222005,25)->
    #player_skills_upgradingCfg {
    skillID = 222005,
    level = 25,
    player_level = 94,
    currency = [{1,510000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对敌方单体释放剧毒，持续6秒，每秒造成201%魔法攻击的伤害。",
    id = 0
    };
getRow(222006,1)->
    #player_skills_upgradingCfg {
    skillID = 222006,
    level = 1,
    player_level = 60,
    currency = [],
    skillcoin_cost = 1,
    item = [],
    describe = "对敌方及其周围目标造成3次133%魔法攻击的伤害，并造成冻结效果，持续2秒",
    id = 0
    };
getRow(222006,2)->
    #player_skills_upgradingCfg {
    skillID = 222006,
    level = 2,
    player_level = 60,
    currency = [{1,50000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对敌方及其周围目标造成3次138%魔法攻击的伤害，并造成冻结效果，持续2秒",
    id = 0
    };
getRow(222006,3)->
    #player_skills_upgradingCfg {
    skillID = 222006,
    level = 3,
    player_level = 60,
    currency = [{1,70000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对敌方及其周围目标造成3次143%魔法攻击的伤害，并造成冻结效果，持续2秒",
    id = 0
    };
getRow(222006,4)->
    #player_skills_upgradingCfg {
    skillID = 222006,
    level = 4,
    player_level = 60,
    currency = [{1,90000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对敌方及其周围目标造成3次148%魔法攻击的伤害，并造成冻结效果，持续2秒",
    id = 0
    };
getRow(222006,5)->
    #player_skills_upgradingCfg {
    skillID = 222006,
    level = 5,
    player_level = 60,
    currency = [{1,110000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对敌方及其周围目标造成3次153%魔法攻击的伤害，并造成冻结效果，持续2秒",
    id = 0
    };
getRow(222006,6)->
    #player_skills_upgradingCfg {
    skillID = 222006,
    level = 6,
    player_level = 60,
    currency = [{1,130000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对敌方及其周围目标造成3次158%魔法攻击的伤害，并造成冻结效果，持续2秒",
    id = 0
    };
getRow(222006,7)->
    #player_skills_upgradingCfg {
    skillID = 222006,
    level = 7,
    player_level = 60,
    currency = [{1,150000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对敌方及其周围目标造成3次163%魔法攻击的伤害，并造成冻结效果，持续2秒",
    id = 0
    };
getRow(222006,8)->
    #player_skills_upgradingCfg {
    skillID = 222006,
    level = 8,
    player_level = 60,
    currency = [{1,170000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对敌方及其周围目标造成3次168%魔法攻击的伤害，并造成冻结效果，持续2秒",
    id = 0
    };
getRow(222006,9)->
    #player_skills_upgradingCfg {
    skillID = 222006,
    level = 9,
    player_level = 62,
    currency = [{1,190000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对敌方及其周围目标造成3次173%魔法攻击的伤害，并造成冻结效果，持续2秒",
    id = 0
    };
getRow(222006,10)->
    #player_skills_upgradingCfg {
    skillID = 222006,
    level = 10,
    player_level = 64,
    currency = [{1,210000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对敌方及其周围目标造成3次178%魔法攻击的伤害，并造成冻结效果，持续2秒",
    id = 0
    };
getRow(222006,11)->
    #player_skills_upgradingCfg {
    skillID = 222006,
    level = 11,
    player_level = 66,
    currency = [{1,230000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对敌方及其周围目标造成3次183%魔法攻击的伤害，并造成冻结效果，持续2秒",
    id = 0
    };
getRow(222006,12)->
    #player_skills_upgradingCfg {
    skillID = 222006,
    level = 12,
    player_level = 68,
    currency = [{1,250000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对敌方及其周围目标造成3次188%魔法攻击的伤害，并造成冻结效果，持续2秒",
    id = 0
    };
getRow(222006,13)->
    #player_skills_upgradingCfg {
    skillID = 222006,
    level = 13,
    player_level = 70,
    currency = [{1,270000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对敌方及其周围目标造成3次193%魔法攻击的伤害，并造成冻结效果，持续2秒",
    id = 0
    };
getRow(222006,14)->
    #player_skills_upgradingCfg {
    skillID = 222006,
    level = 14,
    player_level = 72,
    currency = [{1,290000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对敌方及其周围目标造成3次198%魔法攻击的伤害，并造成冻结效果，持续2秒",
    id = 0
    };
getRow(222006,15)->
    #player_skills_upgradingCfg {
    skillID = 222006,
    level = 15,
    player_level = 74,
    currency = [{1,310000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对敌方及其周围目标造成3次203%魔法攻击的伤害，并造成冻结效果，持续2秒",
    id = 0
    };
getRow(222006,16)->
    #player_skills_upgradingCfg {
    skillID = 222006,
    level = 16,
    player_level = 76,
    currency = [{1,330000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对敌方及其周围目标造成3次208%魔法攻击的伤害，并造成冻结效果，持续2秒",
    id = 0
    };
getRow(222006,17)->
    #player_skills_upgradingCfg {
    skillID = 222006,
    level = 17,
    player_level = 78,
    currency = [{1,350000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对敌方及其周围目标造成3次213%魔法攻击的伤害，并造成冻结效果，持续2秒",
    id = 0
    };
getRow(222006,18)->
    #player_skills_upgradingCfg {
    skillID = 222006,
    level = 18,
    player_level = 80,
    currency = [{1,370000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对敌方及其周围目标造成3次218%魔法攻击的伤害，并造成冻结效果，持续2秒",
    id = 0
    };
getRow(222006,19)->
    #player_skills_upgradingCfg {
    skillID = 222006,
    level = 19,
    player_level = 82,
    currency = [{1,390000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对敌方及其周围目标造成3次223%魔法攻击的伤害，并造成冻结效果，持续2秒",
    id = 0
    };
getRow(222006,20)->
    #player_skills_upgradingCfg {
    skillID = 222006,
    level = 20,
    player_level = 84,
    currency = [{1,410000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对敌方及其周围目标造成3次228%魔法攻击的伤害，并造成冻结效果，持续2秒",
    id = 0
    };
getRow(222006,21)->
    #player_skills_upgradingCfg {
    skillID = 222006,
    level = 21,
    player_level = 86,
    currency = [{1,430000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对敌方及其周围目标造成3次233%魔法攻击的伤害，并造成冻结效果，持续2秒",
    id = 0
    };
getRow(222006,22)->
    #player_skills_upgradingCfg {
    skillID = 222006,
    level = 22,
    player_level = 88,
    currency = [{1,450000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对敌方及其周围目标造成3次238%魔法攻击的伤害，并造成冻结效果，持续2秒",
    id = 0
    };
getRow(222006,23)->
    #player_skills_upgradingCfg {
    skillID = 222006,
    level = 23,
    player_level = 90,
    currency = [{1,470000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对敌方及其周围目标造成3次243%魔法攻击的伤害，并造成冻结效果，持续2秒",
    id = 0
    };
getRow(222006,24)->
    #player_skills_upgradingCfg {
    skillID = 222006,
    level = 24,
    player_level = 92,
    currency = [{1,490000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对敌方及其周围目标造成3次248%魔法攻击的伤害，并造成冻结效果，持续2秒",
    id = 0
    };
getRow(222006,25)->
    #player_skills_upgradingCfg {
    skillID = 222006,
    level = 25,
    player_level = 94,
    currency = [{1,510000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对敌方及其周围目标造成3次253%魔法攻击的伤害，并造成冻结效果，持续2秒",
    id = 0
    };
getRow(222007,1)->
    #player_skills_upgradingCfg {
    skillID = 222007,
    level = 1,
    player_level = 60,
    currency = [],
    skillcoin_cost = 1,
    item = [],
    describe = "自身进入不可被攻击状态，攻击降低99%，速度降低50%，每秒恢复20%魔法攻击的生命值，持续5秒",
    id = 0
    };
getRow(222007,2)->
    #player_skills_upgradingCfg {
    skillID = 222007,
    level = 2,
    player_level = 60,
    currency = [{1,70000}],
    skillcoin_cost = 1,
    item = [],
    describe = "自身进入不可被攻击状态，攻击降低99%，速度降低50%，每秒恢复21%魔法攻击的生命值，持续5秒",
    id = 0
    };
getRow(222007,3)->
    #player_skills_upgradingCfg {
    skillID = 222007,
    level = 3,
    player_level = 60,
    currency = [{1,110000}],
    skillcoin_cost = 1,
    item = [],
    describe = "自身进入不可被攻击状态，攻击降低99%，速度降低50%，每秒恢复22%魔法攻击的生命值，持续5秒",
    id = 0
    };
getRow(222007,4)->
    #player_skills_upgradingCfg {
    skillID = 222007,
    level = 4,
    player_level = 60,
    currency = [{1,150000}],
    skillcoin_cost = 1,
    item = [],
    describe = "自身进入不可被攻击状态，攻击降低99%，速度降低50%，每秒恢复23%魔法攻击的生命值，持续5秒",
    id = 0
    };
getRow(222007,5)->
    #player_skills_upgradingCfg {
    skillID = 222007,
    level = 5,
    player_level = 62,
    currency = [{1,190000}],
    skillcoin_cost = 1,
    item = [],
    describe = "自身进入不可被攻击状态，攻击降低99%，速度降低50%，每秒恢复24%魔法攻击的生命值，持续5秒",
    id = 0
    };
getRow(222007,6)->
    #player_skills_upgradingCfg {
    skillID = 222007,
    level = 6,
    player_level = 66,
    currency = [{1,230000}],
    skillcoin_cost = 1,
    item = [],
    describe = "自身进入不可被攻击状态，攻击降低99%，速度降低50%，每秒恢复25%魔法攻击的生命值，持续5秒",
    id = 0
    };
getRow(222007,7)->
    #player_skills_upgradingCfg {
    skillID = 222007,
    level = 7,
    player_level = 70,
    currency = [{1,270000}],
    skillcoin_cost = 1,
    item = [],
    describe = "自身进入不可被攻击状态，攻击降低99%，速度降低50%，每秒恢复26%魔法攻击的生命值，持续5秒",
    id = 0
    };
getRow(222007,8)->
    #player_skills_upgradingCfg {
    skillID = 222007,
    level = 8,
    player_level = 74,
    currency = [{1,310000}],
    skillcoin_cost = 1,
    item = [],
    describe = "自身进入不可被攻击状态，攻击降低99%，速度降低50%，每秒恢复27%魔法攻击的生命值，持续5秒",
    id = 0
    };
getRow(222007,9)->
    #player_skills_upgradingCfg {
    skillID = 222007,
    level = 9,
    player_level = 78,
    currency = [{1,350000}],
    skillcoin_cost = 1,
    item = [],
    describe = "自身进入不可被攻击状态，攻击降低99%，速度降低50%，每秒恢复28%魔法攻击的生命值，持续5秒",
    id = 0
    };
getRow(222007,10)->
    #player_skills_upgradingCfg {
    skillID = 222007,
    level = 10,
    player_level = 82,
    currency = [{1,390000}],
    skillcoin_cost = 1,
    item = [],
    describe = "自身进入不可被攻击状态，攻击降低99%，速度降低50%，每秒恢复29%魔法攻击的生命值，持续5秒",
    id = 0
    };
getRow(222007,11)->
    #player_skills_upgradingCfg {
    skillID = 222007,
    level = 11,
    player_level = 86,
    currency = [{1,430000}],
    skillcoin_cost = 1,
    item = [],
    describe = "自身进入不可被攻击状态，攻击降低99%，速度降低50%，每秒恢复30%魔法攻击的生命值，持续5秒",
    id = 0
    };
getRow(222008,1)->
    #player_skills_upgradingCfg {
    skillID = 222008,
    level = 1,
    player_level = 60,
    currency = [],
    skillcoin_cost = 1,
    item = [],
    describe = "增强周围队友魔法攻击力6%，持续时间10分钟",
    id = 0
    };
getRow(222008,2)->
    #player_skills_upgradingCfg {
    skillID = 222008,
    level = 2,
    player_level = 60,
    currency = [{1,70000}],
    skillcoin_cost = 1,
    item = [],
    describe = "增强周围队友魔法攻击力6.6%，持续时间10分钟",
    id = 0
    };
getRow(222008,3)->
    #player_skills_upgradingCfg {
    skillID = 222008,
    level = 3,
    player_level = 60,
    currency = [{1,110000}],
    skillcoin_cost = 1,
    item = [],
    describe = "增强周围队友魔法攻击力7.2%，持续时间10分钟",
    id = 0
    };
getRow(222008,4)->
    #player_skills_upgradingCfg {
    skillID = 222008,
    level = 4,
    player_level = 60,
    currency = [{1,150000}],
    skillcoin_cost = 1,
    item = [],
    describe = "增强周围队友魔法攻击力7.8%，持续时间10分钟",
    id = 0
    };
getRow(222008,5)->
    #player_skills_upgradingCfg {
    skillID = 222008,
    level = 5,
    player_level = 62,
    currency = [{1,190000}],
    skillcoin_cost = 1,
    item = [],
    describe = "增强周围队友魔法攻击力8.4%，持续时间10分钟",
    id = 0
    };
getRow(222008,6)->
    #player_skills_upgradingCfg {
    skillID = 222008,
    level = 6,
    player_level = 66,
    currency = [{1,230000}],
    skillcoin_cost = 1,
    item = [],
    describe = "增强周围队友魔法攻击力9%，持续时间10分钟",
    id = 0
    };
getRow(222008,7)->
    #player_skills_upgradingCfg {
    skillID = 222008,
    level = 7,
    player_level = 70,
    currency = [{1,270000}],
    skillcoin_cost = 1,
    item = [],
    describe = "增强周围队友魔法攻击力9.6%，持续时间10分钟",
    id = 0
    };
getRow(222008,8)->
    #player_skills_upgradingCfg {
    skillID = 222008,
    level = 8,
    player_level = 74,
    currency = [{1,310000}],
    skillcoin_cost = 1,
    item = [],
    describe = "增强周围队友魔法攻击力10.2%，持续时间10分钟",
    id = 0
    };
getRow(222008,9)->
    #player_skills_upgradingCfg {
    skillID = 222008,
    level = 9,
    player_level = 78,
    currency = [{1,350000}],
    skillcoin_cost = 1,
    item = [],
    describe = "增强周围队友魔法攻击力10.8%，持续时间10分钟",
    id = 0
    };
getRow(222008,10)->
    #player_skills_upgradingCfg {
    skillID = 222008,
    level = 10,
    player_level = 82,
    currency = [{1,390000}],
    skillcoin_cost = 1,
    item = [],
    describe = "增强周围队友魔法攻击力11.4%，持续时间10分钟",
    id = 0
    };
getRow(222008,11)->
    #player_skills_upgradingCfg {
    skillID = 222008,
    level = 11,
    player_level = 86,
    currency = [{1,430000}],
    skillcoin_cost = 1,
    item = [],
    describe = "增强周围队友魔法攻击力12%，持续时间10分钟",
    id = 0
    };
getRow(222009,1)->
    #player_skills_upgradingCfg {
    skillID = 222009,
    level = 1,
    player_level = 60,
    currency = [],
    skillcoin_cost = 1,
    item = [],
    describe = "自身增强魔法攻击力15%，增强移动速度15%，持续时间10秒",
    id = 0
    };
getRow(222009,2)->
    #player_skills_upgradingCfg {
    skillID = 222009,
    level = 2,
    player_level = 60,
    currency = [{1,70000}],
    skillcoin_cost = 1,
    item = [],
    describe = "自身增强魔法攻击力16%，增强移动速度15%，持续时间10秒",
    id = 0
    };
getRow(222009,3)->
    #player_skills_upgradingCfg {
    skillID = 222009,
    level = 3,
    player_level = 60,
    currency = [{1,110000}],
    skillcoin_cost = 1,
    item = [],
    describe = "自身增强魔法攻击力17%，增强移动速度15%，持续时间10秒",
    id = 0
    };
getRow(222009,4)->
    #player_skills_upgradingCfg {
    skillID = 222009,
    level = 4,
    player_level = 60,
    currency = [{1,150000}],
    skillcoin_cost = 1,
    item = [],
    describe = "自身增强魔法攻击力18%，增强移动速度15%，持续时间10秒",
    id = 0
    };
getRow(222009,5)->
    #player_skills_upgradingCfg {
    skillID = 222009,
    level = 5,
    player_level = 62,
    currency = [{1,190000}],
    skillcoin_cost = 1,
    item = [],
    describe = "自身增强魔法攻击力19%，增强移动速度15%，持续时间10秒",
    id = 0
    };
getRow(222009,6)->
    #player_skills_upgradingCfg {
    skillID = 222009,
    level = 6,
    player_level = 66,
    currency = [{1,230000}],
    skillcoin_cost = 1,
    item = [],
    describe = "自身增强魔法攻击力20%，增强移动速度15%，持续时间10秒",
    id = 0
    };
getRow(222009,7)->
    #player_skills_upgradingCfg {
    skillID = 222009,
    level = 7,
    player_level = 70,
    currency = [{1,270000}],
    skillcoin_cost = 1,
    item = [],
    describe = "自身增强魔法攻击力21%，增强移动速度15%，持续时间10秒",
    id = 0
    };
getRow(222009,8)->
    #player_skills_upgradingCfg {
    skillID = 222009,
    level = 8,
    player_level = 74,
    currency = [{1,310000}],
    skillcoin_cost = 1,
    item = [],
    describe = "自身增强魔法攻击力22%，增强移动速度15%，持续时间10秒",
    id = 0
    };
getRow(222009,9)->
    #player_skills_upgradingCfg {
    skillID = 222009,
    level = 9,
    player_level = 78,
    currency = [{1,350000}],
    skillcoin_cost = 1,
    item = [],
    describe = "自身增强魔法攻击力23%，增强移动速度15%，持续时间10秒",
    id = 0
    };
getRow(222009,10)->
    #player_skills_upgradingCfg {
    skillID = 222009,
    level = 10,
    player_level = 82,
    currency = [{1,390000}],
    skillcoin_cost = 1,
    item = [],
    describe = "自身增强魔法攻击力24%，增强移动速度15%，持续时间10秒",
    id = 0
    };
getRow(222009,11)->
    #player_skills_upgradingCfg {
    skillID = 222009,
    level = 11,
    player_level = 86,
    currency = [{1,430000}],
    skillcoin_cost = 1,
    item = [],
    describe = "自身增强魔法攻击力25%，增强移动速度15%，持续时间10秒",
    id = 0
    };
getRow(223003,1)->
    #player_skills_upgradingCfg {
    skillID = 223003,
    level = 1,
    player_level = 60,
    currency = [],
    skillcoin_cost = 1,
    item = [],
    describe = "挥舞圣光对前方矩形范围造成3次117%魔法攻击的伤害，有概率造成击晕效果",
    id = 0
    };
getRow(223003,2)->
    #player_skills_upgradingCfg {
    skillID = 223003,
    level = 2,
    player_level = 60,
    currency = [{1,50000}],
    skillcoin_cost = 1,
    item = [],
    describe = "挥舞圣光对前方矩形范围造成3次123%魔法攻击的伤害，有概率造成击晕效果",
    id = 0
    };
getRow(223003,3)->
    #player_skills_upgradingCfg {
    skillID = 223003,
    level = 3,
    player_level = 60,
    currency = [{1,70000}],
    skillcoin_cost = 1,
    item = [],
    describe = "挥舞圣光对前方矩形范围造成3次130%魔法攻击的伤害，有概率造成击晕效果",
    id = 0
    };
getRow(223003,4)->
    #player_skills_upgradingCfg {
    skillID = 223003,
    level = 4,
    player_level = 60,
    currency = [{1,90000}],
    skillcoin_cost = 1,
    item = [],
    describe = "挥舞圣光对前方矩形范围造成3次137%魔法攻击的伤害，有概率造成击晕效果",
    id = 0
    };
getRow(223003,5)->
    #player_skills_upgradingCfg {
    skillID = 223003,
    level = 5,
    player_level = 60,
    currency = [{1,110000}],
    skillcoin_cost = 1,
    item = [],
    describe = "挥舞圣光对前方矩形范围造成3次143%魔法攻击的伤害，有概率造成击晕效果",
    id = 0
    };
getRow(223003,6)->
    #player_skills_upgradingCfg {
    skillID = 223003,
    level = 6,
    player_level = 60,
    currency = [{1,130000}],
    skillcoin_cost = 1,
    item = [],
    describe = "挥舞圣光对前方矩形范围造成3次150%魔法攻击的伤害，有概率造成击晕效果",
    id = 0
    };
getRow(223003,7)->
    #player_skills_upgradingCfg {
    skillID = 223003,
    level = 7,
    player_level = 60,
    currency = [{1,150000}],
    skillcoin_cost = 1,
    item = [],
    describe = "挥舞圣光对前方矩形范围造成3次157%魔法攻击的伤害，有概率造成击晕效果",
    id = 0
    };
getRow(223003,8)->
    #player_skills_upgradingCfg {
    skillID = 223003,
    level = 8,
    player_level = 60,
    currency = [{1,170000}],
    skillcoin_cost = 1,
    item = [],
    describe = "挥舞圣光对前方矩形范围造成3次163%魔法攻击的伤害，有概率造成击晕效果",
    id = 0
    };
getRow(223003,9)->
    #player_skills_upgradingCfg {
    skillID = 223003,
    level = 9,
    player_level = 62,
    currency = [{1,190000}],
    skillcoin_cost = 1,
    item = [],
    describe = "挥舞圣光对前方矩形范围造成3次170%魔法攻击的伤害，有概率造成击晕效果",
    id = 0
    };
getRow(223003,10)->
    #player_skills_upgradingCfg {
    skillID = 223003,
    level = 10,
    player_level = 64,
    currency = [{1,210000}],
    skillcoin_cost = 1,
    item = [],
    describe = "挥舞圣光对前方矩形范围造成3次177%魔法攻击的伤害，有概率造成击晕效果",
    id = 0
    };
getRow(223003,11)->
    #player_skills_upgradingCfg {
    skillID = 223003,
    level = 11,
    player_level = 66,
    currency = [{1,230000}],
    skillcoin_cost = 1,
    item = [],
    describe = "挥舞圣光对前方矩形范围造成3次183%魔法攻击的伤害，有概率造成击晕效果",
    id = 0
    };
getRow(223003,12)->
    #player_skills_upgradingCfg {
    skillID = 223003,
    level = 12,
    player_level = 68,
    currency = [{1,250000}],
    skillcoin_cost = 1,
    item = [],
    describe = "挥舞圣光对前方矩形范围造成3次190%魔法攻击的伤害，有概率造成击晕效果",
    id = 0
    };
getRow(223003,13)->
    #player_skills_upgradingCfg {
    skillID = 223003,
    level = 13,
    player_level = 70,
    currency = [{1,270000}],
    skillcoin_cost = 1,
    item = [],
    describe = "挥舞圣光对前方矩形范围造成3次197%魔法攻击的伤害，有概率造成击晕效果",
    id = 0
    };
getRow(223003,14)->
    #player_skills_upgradingCfg {
    skillID = 223003,
    level = 14,
    player_level = 72,
    currency = [{1,290000}],
    skillcoin_cost = 1,
    item = [],
    describe = "挥舞圣光对前方矩形范围造成3次203%魔法攻击的伤害，有概率造成击晕效果",
    id = 0
    };
getRow(223003,15)->
    #player_skills_upgradingCfg {
    skillID = 223003,
    level = 15,
    player_level = 74,
    currency = [{1,310000}],
    skillcoin_cost = 1,
    item = [],
    describe = "挥舞圣光对前方矩形范围造成3次210%魔法攻击的伤害，有概率造成击晕效果",
    id = 0
    };
getRow(223003,16)->
    #player_skills_upgradingCfg {
    skillID = 223003,
    level = 16,
    player_level = 76,
    currency = [{1,330000}],
    skillcoin_cost = 1,
    item = [],
    describe = "挥舞圣光对前方矩形范围造成3次217%魔法攻击的伤害，有概率造成击晕效果",
    id = 0
    };
getRow(223003,17)->
    #player_skills_upgradingCfg {
    skillID = 223003,
    level = 17,
    player_level = 78,
    currency = [{1,350000}],
    skillcoin_cost = 1,
    item = [],
    describe = "挥舞圣光对前方矩形范围造成3次223%魔法攻击的伤害，有概率造成击晕效果",
    id = 0
    };
getRow(223003,18)->
    #player_skills_upgradingCfg {
    skillID = 223003,
    level = 18,
    player_level = 80,
    currency = [{1,370000}],
    skillcoin_cost = 1,
    item = [],
    describe = "挥舞圣光对前方矩形范围造成3次230%魔法攻击的伤害，有概率造成击晕效果",
    id = 0
    };
getRow(223003,19)->
    #player_skills_upgradingCfg {
    skillID = 223003,
    level = 19,
    player_level = 82,
    currency = [{1,390000}],
    skillcoin_cost = 1,
    item = [],
    describe = "挥舞圣光对前方矩形范围造成3次237%魔法攻击的伤害，有概率造成击晕效果",
    id = 0
    };
getRow(223003,20)->
    #player_skills_upgradingCfg {
    skillID = 223003,
    level = 20,
    player_level = 84,
    currency = [{1,410000}],
    skillcoin_cost = 1,
    item = [],
    describe = "挥舞圣光对前方矩形范围造成3次243%魔法攻击的伤害，有概率造成击晕效果",
    id = 0
    };
getRow(223003,21)->
    #player_skills_upgradingCfg {
    skillID = 223003,
    level = 21,
    player_level = 86,
    currency = [{1,430000}],
    skillcoin_cost = 1,
    item = [],
    describe = "挥舞圣光对前方矩形范围造成3次250%魔法攻击的伤害，有概率造成击晕效果",
    id = 0
    };
getRow(223003,22)->
    #player_skills_upgradingCfg {
    skillID = 223003,
    level = 22,
    player_level = 88,
    currency = [{1,450000}],
    skillcoin_cost = 1,
    item = [],
    describe = "挥舞圣光对前方矩形范围造成3次257%魔法攻击的伤害，有概率造成击晕效果",
    id = 0
    };
getRow(223003,23)->
    #player_skills_upgradingCfg {
    skillID = 223003,
    level = 23,
    player_level = 90,
    currency = [{1,470000}],
    skillcoin_cost = 1,
    item = [],
    describe = "挥舞圣光对前方矩形范围造成3次263%魔法攻击的伤害，有概率造成击晕效果",
    id = 0
    };
getRow(223003,24)->
    #player_skills_upgradingCfg {
    skillID = 223003,
    level = 24,
    player_level = 92,
    currency = [{1,490000}],
    skillcoin_cost = 1,
    item = [],
    describe = "挥舞圣光对前方矩形范围造成3次270%魔法攻击的伤害，有概率造成击晕效果",
    id = 0
    };
getRow(223003,25)->
    #player_skills_upgradingCfg {
    skillID = 223003,
    level = 25,
    player_level = 94,
    currency = [{1,510000}],
    skillcoin_cost = 1,
    item = [],
    describe = "挥舞圣光对前方矩形范围造成3次277%魔法攻击的伤害，有概率造成击晕效果",
    id = 0
    };
getRow(223004,1)->
    #player_skills_upgradingCfg {
    skillID = 223004,
    level = 1,
    player_level = 60,
    currency = [],
    skillcoin_cost = 1,
    item = [],
    describe = "使用圣光劈向地面造成前方矩形范围350%魔法攻击的伤害",
    id = 0
    };
getRow(223004,2)->
    #player_skills_upgradingCfg {
    skillID = 223004,
    level = 2,
    player_level = 60,
    currency = [{1,50000}],
    skillcoin_cost = 1,
    item = [],
    describe = "使用圣光劈向地面造成前方矩形范围368%魔法攻击的伤害",
    id = 0
    };
getRow(223004,3)->
    #player_skills_upgradingCfg {
    skillID = 223004,
    level = 3,
    player_level = 60,
    currency = [{1,70000}],
    skillcoin_cost = 1,
    item = [],
    describe = "使用圣光劈向地面造成前方矩形范围386%魔法攻击的伤害",
    id = 0
    };
getRow(223004,4)->
    #player_skills_upgradingCfg {
    skillID = 223004,
    level = 4,
    player_level = 60,
    currency = [{1,90000}],
    skillcoin_cost = 1,
    item = [],
    describe = "使用圣光劈向地面造成前方矩形范围404%魔法攻击的伤害",
    id = 0
    };
getRow(223004,5)->
    #player_skills_upgradingCfg {
    skillID = 223004,
    level = 5,
    player_level = 60,
    currency = [{1,110000}],
    skillcoin_cost = 1,
    item = [],
    describe = "使用圣光劈向地面造成前方矩形范围422%魔法攻击的伤害",
    id = 0
    };
getRow(223004,6)->
    #player_skills_upgradingCfg {
    skillID = 223004,
    level = 6,
    player_level = 60,
    currency = [{1,130000}],
    skillcoin_cost = 1,
    item = [],
    describe = "使用圣光劈向地面造成前方矩形范围440%魔法攻击的伤害",
    id = 0
    };
getRow(223004,7)->
    #player_skills_upgradingCfg {
    skillID = 223004,
    level = 7,
    player_level = 60,
    currency = [{1,150000}],
    skillcoin_cost = 1,
    item = [],
    describe = "使用圣光劈向地面造成前方矩形范围458%魔法攻击的伤害",
    id = 0
    };
getRow(223004,8)->
    #player_skills_upgradingCfg {
    skillID = 223004,
    level = 8,
    player_level = 60,
    currency = [{1,170000}],
    skillcoin_cost = 1,
    item = [],
    describe = "使用圣光劈向地面造成前方矩形范围476%魔法攻击的伤害",
    id = 0
    };
getRow(223004,9)->
    #player_skills_upgradingCfg {
    skillID = 223004,
    level = 9,
    player_level = 62,
    currency = [{1,190000}],
    skillcoin_cost = 1,
    item = [],
    describe = "使用圣光劈向地面造成前方矩形范围494%魔法攻击的伤害",
    id = 0
    };
getRow(223004,10)->
    #player_skills_upgradingCfg {
    skillID = 223004,
    level = 10,
    player_level = 64,
    currency = [{1,210000}],
    skillcoin_cost = 1,
    item = [],
    describe = "使用圣光劈向地面造成前方矩形范围512%魔法攻击的伤害",
    id = 0
    };
getRow(223004,11)->
    #player_skills_upgradingCfg {
    skillID = 223004,
    level = 11,
    player_level = 66,
    currency = [{1,230000}],
    skillcoin_cost = 1,
    item = [],
    describe = "使用圣光劈向地面造成前方矩形范围530%魔法攻击的伤害",
    id = 0
    };
getRow(223004,12)->
    #player_skills_upgradingCfg {
    skillID = 223004,
    level = 12,
    player_level = 68,
    currency = [{1,250000}],
    skillcoin_cost = 1,
    item = [],
    describe = "使用圣光劈向地面造成前方矩形范围548%魔法攻击的伤害",
    id = 0
    };
getRow(223004,13)->
    #player_skills_upgradingCfg {
    skillID = 223004,
    level = 13,
    player_level = 70,
    currency = [{1,270000}],
    skillcoin_cost = 1,
    item = [],
    describe = "使用圣光劈向地面造成前方矩形范围566%魔法攻击的伤害",
    id = 0
    };
getRow(223004,14)->
    #player_skills_upgradingCfg {
    skillID = 223004,
    level = 14,
    player_level = 72,
    currency = [{1,290000}],
    skillcoin_cost = 1,
    item = [],
    describe = "使用圣光劈向地面造成前方矩形范围584%魔法攻击的伤害",
    id = 0
    };
getRow(223004,15)->
    #player_skills_upgradingCfg {
    skillID = 223004,
    level = 15,
    player_level = 74,
    currency = [{1,310000}],
    skillcoin_cost = 1,
    item = [],
    describe = "使用圣光劈向地面造成前方矩形范围602%魔法攻击的伤害",
    id = 0
    };
getRow(223004,16)->
    #player_skills_upgradingCfg {
    skillID = 223004,
    level = 16,
    player_level = 76,
    currency = [{1,330000}],
    skillcoin_cost = 1,
    item = [],
    describe = "使用圣光劈向地面造成前方矩形范围620%魔法攻击的伤害",
    id = 0
    };
getRow(223004,17)->
    #player_skills_upgradingCfg {
    skillID = 223004,
    level = 17,
    player_level = 78,
    currency = [{1,350000}],
    skillcoin_cost = 1,
    item = [],
    describe = "使用圣光劈向地面造成前方矩形范围638%魔法攻击的伤害",
    id = 0
    };
getRow(223004,18)->
    #player_skills_upgradingCfg {
    skillID = 223004,
    level = 18,
    player_level = 80,
    currency = [{1,370000}],
    skillcoin_cost = 1,
    item = [],
    describe = "使用圣光劈向地面造成前方矩形范围656%魔法攻击的伤害",
    id = 0
    };
getRow(223004,19)->
    #player_skills_upgradingCfg {
    skillID = 223004,
    level = 19,
    player_level = 82,
    currency = [{1,390000}],
    skillcoin_cost = 1,
    item = [],
    describe = "使用圣光劈向地面造成前方矩形范围674%魔法攻击的伤害",
    id = 0
    };
getRow(223004,20)->
    #player_skills_upgradingCfg {
    skillID = 223004,
    level = 20,
    player_level = 84,
    currency = [{1,410000}],
    skillcoin_cost = 1,
    item = [],
    describe = "使用圣光劈向地面造成前方矩形范围692%魔法攻击的伤害",
    id = 0
    };
getRow(223004,21)->
    #player_skills_upgradingCfg {
    skillID = 223004,
    level = 21,
    player_level = 86,
    currency = [{1,430000}],
    skillcoin_cost = 1,
    item = [],
    describe = "使用圣光劈向地面造成前方矩形范围710%魔法攻击的伤害",
    id = 0
    };
getRow(223004,22)->
    #player_skills_upgradingCfg {
    skillID = 223004,
    level = 22,
    player_level = 88,
    currency = [{1,450000}],
    skillcoin_cost = 1,
    item = [],
    describe = "使用圣光劈向地面造成前方矩形范围728%魔法攻击的伤害",
    id = 0
    };
getRow(223004,23)->
    #player_skills_upgradingCfg {
    skillID = 223004,
    level = 23,
    player_level = 90,
    currency = [{1,470000}],
    skillcoin_cost = 1,
    item = [],
    describe = "使用圣光劈向地面造成前方矩形范围746%魔法攻击的伤害",
    id = 0
    };
getRow(223004,24)->
    #player_skills_upgradingCfg {
    skillID = 223004,
    level = 24,
    player_level = 92,
    currency = [{1,490000}],
    skillcoin_cost = 1,
    item = [],
    describe = "使用圣光劈向地面造成前方矩形范围764%魔法攻击的伤害",
    id = 0
    };
getRow(223004,25)->
    #player_skills_upgradingCfg {
    skillID = 223004,
    level = 25,
    player_level = 94,
    currency = [{1,510000}],
    skillcoin_cost = 1,
    item = [],
    describe = "使用圣光劈向地面造成前方矩形范围782%魔法攻击的伤害",
    id = 0
    };
getRow(223005,1)->
    #player_skills_upgradingCfg {
    skillID = 223005,
    level = 1,
    player_level = 60,
    currency = [],
    skillcoin_cost = 1,
    item = [],
    describe = "对前方扇形区域范围造成350%魔法攻击的伤害",
    id = 0
    };
getRow(223005,2)->
    #player_skills_upgradingCfg {
    skillID = 223005,
    level = 2,
    player_level = 60,
    currency = [{1,50000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对前方扇形区域范围造成368%魔法攻击的伤害",
    id = 0
    };
getRow(223005,3)->
    #player_skills_upgradingCfg {
    skillID = 223005,
    level = 3,
    player_level = 60,
    currency = [{1,70000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对前方扇形区域范围造成386%魔法攻击的伤害",
    id = 0
    };
getRow(223005,4)->
    #player_skills_upgradingCfg {
    skillID = 223005,
    level = 4,
    player_level = 60,
    currency = [{1,90000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对前方扇形区域范围造成404%魔法攻击的伤害",
    id = 0
    };
getRow(223005,5)->
    #player_skills_upgradingCfg {
    skillID = 223005,
    level = 5,
    player_level = 60,
    currency = [{1,110000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对前方扇形区域范围造成422%魔法攻击的伤害",
    id = 0
    };
getRow(223005,6)->
    #player_skills_upgradingCfg {
    skillID = 223005,
    level = 6,
    player_level = 60,
    currency = [{1,130000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对前方扇形区域范围造成440%魔法攻击的伤害",
    id = 0
    };
getRow(223005,7)->
    #player_skills_upgradingCfg {
    skillID = 223005,
    level = 7,
    player_level = 60,
    currency = [{1,150000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对前方扇形区域范围造成458%魔法攻击的伤害",
    id = 0
    };
getRow(223005,8)->
    #player_skills_upgradingCfg {
    skillID = 223005,
    level = 8,
    player_level = 60,
    currency = [{1,170000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对前方扇形区域范围造成476%魔法攻击的伤害",
    id = 0
    };
getRow(223005,9)->
    #player_skills_upgradingCfg {
    skillID = 223005,
    level = 9,
    player_level = 62,
    currency = [{1,190000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对前方扇形区域范围造成494%魔法攻击的伤害",
    id = 0
    };
getRow(223005,10)->
    #player_skills_upgradingCfg {
    skillID = 223005,
    level = 10,
    player_level = 64,
    currency = [{1,210000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对前方扇形区域范围造成512%魔法攻击的伤害",
    id = 0
    };
getRow(223005,11)->
    #player_skills_upgradingCfg {
    skillID = 223005,
    level = 11,
    player_level = 66,
    currency = [{1,230000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对前方扇形区域范围造成530%魔法攻击的伤害",
    id = 0
    };
getRow(223005,12)->
    #player_skills_upgradingCfg {
    skillID = 223005,
    level = 12,
    player_level = 68,
    currency = [{1,250000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对前方扇形区域范围造成548%魔法攻击的伤害",
    id = 0
    };
getRow(223005,13)->
    #player_skills_upgradingCfg {
    skillID = 223005,
    level = 13,
    player_level = 70,
    currency = [{1,270000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对前方扇形区域范围造成566%魔法攻击的伤害",
    id = 0
    };
getRow(223005,14)->
    #player_skills_upgradingCfg {
    skillID = 223005,
    level = 14,
    player_level = 72,
    currency = [{1,290000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对前方扇形区域范围造成584%魔法攻击的伤害",
    id = 0
    };
getRow(223005,15)->
    #player_skills_upgradingCfg {
    skillID = 223005,
    level = 15,
    player_level = 74,
    currency = [{1,310000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对前方扇形区域范围造成602%魔法攻击的伤害",
    id = 0
    };
getRow(223005,16)->
    #player_skills_upgradingCfg {
    skillID = 223005,
    level = 16,
    player_level = 76,
    currency = [{1,330000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对前方扇形区域范围造成620%魔法攻击的伤害",
    id = 0
    };
getRow(223005,17)->
    #player_skills_upgradingCfg {
    skillID = 223005,
    level = 17,
    player_level = 78,
    currency = [{1,350000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对前方扇形区域范围造成638%魔法攻击的伤害",
    id = 0
    };
getRow(223005,18)->
    #player_skills_upgradingCfg {
    skillID = 223005,
    level = 18,
    player_level = 80,
    currency = [{1,370000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对前方扇形区域范围造成656%魔法攻击的伤害",
    id = 0
    };
getRow(223005,19)->
    #player_skills_upgradingCfg {
    skillID = 223005,
    level = 19,
    player_level = 82,
    currency = [{1,390000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对前方扇形区域范围造成674%魔法攻击的伤害",
    id = 0
    };
getRow(223005,20)->
    #player_skills_upgradingCfg {
    skillID = 223005,
    level = 20,
    player_level = 84,
    currency = [{1,410000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对前方扇形区域范围造成692%魔法攻击的伤害",
    id = 0
    };
getRow(223005,21)->
    #player_skills_upgradingCfg {
    skillID = 223005,
    level = 21,
    player_level = 86,
    currency = [{1,430000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对前方扇形区域范围造成710%魔法攻击的伤害",
    id = 0
    };
getRow(223005,22)->
    #player_skills_upgradingCfg {
    skillID = 223005,
    level = 22,
    player_level = 88,
    currency = [{1,450000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对前方扇形区域范围造成728%魔法攻击的伤害",
    id = 0
    };
getRow(223005,23)->
    #player_skills_upgradingCfg {
    skillID = 223005,
    level = 23,
    player_level = 90,
    currency = [{1,470000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对前方扇形区域范围造成746%魔法攻击的伤害",
    id = 0
    };
getRow(223005,24)->
    #player_skills_upgradingCfg {
    skillID = 223005,
    level = 24,
    player_level = 92,
    currency = [{1,490000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对前方扇形区域范围造成764%魔法攻击的伤害",
    id = 0
    };
getRow(223005,25)->
    #player_skills_upgradingCfg {
    skillID = 223005,
    level = 25,
    player_level = 94,
    currency = [{1,510000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对前方扇形区域范围造成782%魔法攻击的伤害",
    id = 0
    };
getRow(223006,1)->
    #player_skills_upgradingCfg {
    skillID = 223006,
    level = 1,
    player_level = 60,
    currency = [],
    skillcoin_cost = 1,
    item = [],
    describe = "激发体内的魔法之力，对敌人造成250%魔法攻击的单体伤害，增加自身30%暴击等级，持续10秒",
    id = 0
    };
getRow(223006,2)->
    #player_skills_upgradingCfg {
    skillID = 223006,
    level = 2,
    player_level = 60,
    currency = [{1,50000}],
    skillcoin_cost = 1,
    item = [],
    describe = "激发体内的魔法之力，对敌人造成268%魔法攻击的单体伤害，增加自身31.2%暴击等级，持续10秒",
    id = 0
    };
getRow(223006,3)->
    #player_skills_upgradingCfg {
    skillID = 223006,
    level = 3,
    player_level = 60,
    currency = [{1,70000}],
    skillcoin_cost = 1,
    item = [],
    describe = "激发体内的魔法之力，对敌人造成286%魔法攻击的单体伤害，增加自身32.4%暴击等级，持续10秒",
    id = 0
    };
getRow(223006,4)->
    #player_skills_upgradingCfg {
    skillID = 223006,
    level = 4,
    player_level = 60,
    currency = [{1,90000}],
    skillcoin_cost = 1,
    item = [],
    describe = "激发体内的魔法之力，对敌人造成304%魔法攻击的单体伤害，增加自身33.6%暴击等级，持续10秒",
    id = 0
    };
getRow(223006,5)->
    #player_skills_upgradingCfg {
    skillID = 223006,
    level = 5,
    player_level = 60,
    currency = [{1,110000}],
    skillcoin_cost = 1,
    item = [],
    describe = "激发体内的魔法之力，对敌人造成322%魔法攻击的单体伤害，增加自身34.8%暴击等级，持续10秒",
    id = 0
    };
getRow(223006,6)->
    #player_skills_upgradingCfg {
    skillID = 223006,
    level = 6,
    player_level = 60,
    currency = [{1,130000}],
    skillcoin_cost = 1,
    item = [],
    describe = "激发体内的魔法之力，对敌人造成340%魔法攻击的单体伤害，增加自身36%暴击等级，持续10秒",
    id = 0
    };
getRow(223006,7)->
    #player_skills_upgradingCfg {
    skillID = 223006,
    level = 7,
    player_level = 60,
    currency = [{1,150000}],
    skillcoin_cost = 1,
    item = [],
    describe = "激发体内的魔法之力，对敌人造成358%魔法攻击的单体伤害，增加自身37.2%暴击等级，持续10秒",
    id = 0
    };
getRow(223006,8)->
    #player_skills_upgradingCfg {
    skillID = 223006,
    level = 8,
    player_level = 60,
    currency = [{1,170000}],
    skillcoin_cost = 1,
    item = [],
    describe = "激发体内的魔法之力，对敌人造成376%魔法攻击的单体伤害，增加自身38.4%暴击等级，持续10秒",
    id = 0
    };
getRow(223006,9)->
    #player_skills_upgradingCfg {
    skillID = 223006,
    level = 9,
    player_level = 62,
    currency = [{1,190000}],
    skillcoin_cost = 1,
    item = [],
    describe = "激发体内的魔法之力，对敌人造成394%魔法攻击的单体伤害，增加自身39.6%暴击等级，持续10秒",
    id = 0
    };
getRow(223006,10)->
    #player_skills_upgradingCfg {
    skillID = 223006,
    level = 10,
    player_level = 64,
    currency = [{1,210000}],
    skillcoin_cost = 1,
    item = [],
    describe = "激发体内的魔法之力，对敌人造成412%魔法攻击的单体伤害，增加自身40.8%暴击等级，持续10秒",
    id = 0
    };
getRow(223006,11)->
    #player_skills_upgradingCfg {
    skillID = 223006,
    level = 11,
    player_level = 66,
    currency = [{1,230000}],
    skillcoin_cost = 1,
    item = [],
    describe = "激发体内的魔法之力，对敌人造成430%魔法攻击的单体伤害，增加自身42%暴击等级，持续10秒",
    id = 0
    };
getRow(223006,12)->
    #player_skills_upgradingCfg {
    skillID = 223006,
    level = 12,
    player_level = 68,
    currency = [{1,250000}],
    skillcoin_cost = 1,
    item = [],
    describe = "激发体内的魔法之力，对敌人造成448%魔法攻击的单体伤害，增加自身43.2%暴击等级，持续10秒",
    id = 0
    };
getRow(223006,13)->
    #player_skills_upgradingCfg {
    skillID = 223006,
    level = 13,
    player_level = 70,
    currency = [{1,270000}],
    skillcoin_cost = 1,
    item = [],
    describe = "激发体内的魔法之力，对敌人造成466%魔法攻击的单体伤害，增加自身44.4%暴击等级，持续10秒",
    id = 0
    };
getRow(223006,14)->
    #player_skills_upgradingCfg {
    skillID = 223006,
    level = 14,
    player_level = 72,
    currency = [{1,290000}],
    skillcoin_cost = 1,
    item = [],
    describe = "激发体内的魔法之力，对敌人造成484%魔法攻击的单体伤害，增加自身45.6%暴击等级，持续10秒",
    id = 0
    };
getRow(223006,15)->
    #player_skills_upgradingCfg {
    skillID = 223006,
    level = 15,
    player_level = 74,
    currency = [{1,310000}],
    skillcoin_cost = 1,
    item = [],
    describe = "激发体内的魔法之力，对敌人造成502%魔法攻击的单体伤害，增加自身46.8%暴击等级，持续10秒",
    id = 0
    };
getRow(223006,16)->
    #player_skills_upgradingCfg {
    skillID = 223006,
    level = 16,
    player_level = 76,
    currency = [{1,330000}],
    skillcoin_cost = 1,
    item = [],
    describe = "激发体内的魔法之力，对敌人造成520%魔法攻击的单体伤害，增加自身48%暴击等级，持续10秒",
    id = 0
    };
getRow(223006,17)->
    #player_skills_upgradingCfg {
    skillID = 223006,
    level = 17,
    player_level = 78,
    currency = [{1,350000}],
    skillcoin_cost = 1,
    item = [],
    describe = "激发体内的魔法之力，对敌人造成538%魔法攻击的单体伤害，增加自身49.2%暴击等级，持续10秒",
    id = 0
    };
getRow(223006,18)->
    #player_skills_upgradingCfg {
    skillID = 223006,
    level = 18,
    player_level = 80,
    currency = [{1,370000}],
    skillcoin_cost = 1,
    item = [],
    describe = "激发体内的魔法之力，对敌人造成556%魔法攻击的单体伤害，增加自身50.4%暴击等级，持续10秒",
    id = 0
    };
getRow(223006,19)->
    #player_skills_upgradingCfg {
    skillID = 223006,
    level = 19,
    player_level = 82,
    currency = [{1,390000}],
    skillcoin_cost = 1,
    item = [],
    describe = "激发体内的魔法之力，对敌人造成574%魔法攻击的单体伤害，增加自身51.6%暴击等级，持续10秒",
    id = 0
    };
getRow(223006,20)->
    #player_skills_upgradingCfg {
    skillID = 223006,
    level = 20,
    player_level = 84,
    currency = [{1,410000}],
    skillcoin_cost = 1,
    item = [],
    describe = "激发体内的魔法之力，对敌人造成592%魔法攻击的单体伤害，增加自身52.8%暴击等级，持续10秒",
    id = 0
    };
getRow(223006,21)->
    #player_skills_upgradingCfg {
    skillID = 223006,
    level = 21,
    player_level = 86,
    currency = [{1,430000}],
    skillcoin_cost = 1,
    item = [],
    describe = "激发体内的魔法之力，对敌人造成610%魔法攻击的单体伤害，增加自身54%暴击等级，持续10秒",
    id = 0
    };
getRow(223006,22)->
    #player_skills_upgradingCfg {
    skillID = 223006,
    level = 22,
    player_level = 88,
    currency = [{1,450000}],
    skillcoin_cost = 1,
    item = [],
    describe = "激发体内的魔法之力，对敌人造成628%魔法攻击的单体伤害，增加自身55.2%暴击等级，持续10秒",
    id = 0
    };
getRow(223006,23)->
    #player_skills_upgradingCfg {
    skillID = 223006,
    level = 23,
    player_level = 90,
    currency = [{1,470000}],
    skillcoin_cost = 1,
    item = [],
    describe = "激发体内的魔法之力，对敌人造成646%魔法攻击的单体伤害，增加自身56.4%暴击等级，持续10秒",
    id = 0
    };
getRow(223006,24)->
    #player_skills_upgradingCfg {
    skillID = 223006,
    level = 24,
    player_level = 92,
    currency = [{1,490000}],
    skillcoin_cost = 1,
    item = [],
    describe = "激发体内的魔法之力，对敌人造成664%魔法攻击的单体伤害，增加自身57.6%暴击等级，持续10秒",
    id = 0
    };
getRow(223006,25)->
    #player_skills_upgradingCfg {
    skillID = 223006,
    level = 25,
    player_level = 94,
    currency = [{1,510000}],
    skillcoin_cost = 1,
    item = [],
    describe = "激发体内的魔法之力，对敌人造成682%魔法攻击的单体伤害，增加自身58.8%暴击等级，持续10秒",
    id = 0
    };
getRow(223007,1)->
    #player_skills_upgradingCfg {
    skillID = 223007,
    level = 1,
    player_level = 60,
    currency = [],
    skillcoin_cost = 1,
    item = [],
    describe = "清除周围友方的负面效果，并使敌人中毒，每秒造成113%魔法攻击的伤害，持续3秒",
    id = 0
    };
getRow(223007,2)->
    #player_skills_upgradingCfg {
    skillID = 223007,
    level = 2,
    player_level = 60,
    currency = [{1,50000}],
    skillcoin_cost = 1,
    item = [],
    describe = "清除周围友方的负面效果，并使敌人中毒，每秒造成119%魔法攻击的伤害，持续3秒",
    id = 0
    };
getRow(223007,3)->
    #player_skills_upgradingCfg {
    skillID = 223007,
    level = 3,
    player_level = 60,
    currency = [{1,70000}],
    skillcoin_cost = 1,
    item = [],
    describe = "清除周围友方的负面效果，并使敌人中毒，每秒造成125%魔法攻击的伤害，持续3秒",
    id = 0
    };
getRow(223007,4)->
    #player_skills_upgradingCfg {
    skillID = 223007,
    level = 4,
    player_level = 60,
    currency = [{1,90000}],
    skillcoin_cost = 1,
    item = [],
    describe = "清除周围友方的负面效果，并使敌人中毒，每秒造成131%魔法攻击的伤害，持续3秒",
    id = 0
    };
getRow(223007,5)->
    #player_skills_upgradingCfg {
    skillID = 223007,
    level = 5,
    player_level = 60,
    currency = [{1,110000}],
    skillcoin_cost = 1,
    item = [],
    describe = "清除周围友方的负面效果，并使敌人中毒，每秒造成137%魔法攻击的伤害，持续3秒",
    id = 0
    };
getRow(223007,6)->
    #player_skills_upgradingCfg {
    skillID = 223007,
    level = 6,
    player_level = 60,
    currency = [{1,130000}],
    skillcoin_cost = 1,
    item = [],
    describe = "清除周围友方的负面效果，并使敌人中毒，每秒造成143%魔法攻击的伤害，持续3秒",
    id = 0
    };
getRow(223007,7)->
    #player_skills_upgradingCfg {
    skillID = 223007,
    level = 7,
    player_level = 60,
    currency = [{1,150000}],
    skillcoin_cost = 1,
    item = [],
    describe = "清除周围友方的负面效果，并使敌人中毒，每秒造成149%魔法攻击的伤害，持续3秒",
    id = 0
    };
getRow(223007,8)->
    #player_skills_upgradingCfg {
    skillID = 223007,
    level = 8,
    player_level = 60,
    currency = [{1,170000}],
    skillcoin_cost = 1,
    item = [],
    describe = "清除周围友方的负面效果，并使敌人中毒，每秒造成155%魔法攻击的伤害，持续3秒",
    id = 0
    };
getRow(223007,9)->
    #player_skills_upgradingCfg {
    skillID = 223007,
    level = 9,
    player_level = 62,
    currency = [{1,190000}],
    skillcoin_cost = 1,
    item = [],
    describe = "清除周围友方的负面效果，并使敌人中毒，每秒造成161%魔法攻击的伤害，持续3秒",
    id = 0
    };
getRow(223007,10)->
    #player_skills_upgradingCfg {
    skillID = 223007,
    level = 10,
    player_level = 64,
    currency = [{1,210000}],
    skillcoin_cost = 1,
    item = [],
    describe = "清除周围友方的负面效果，并使敌人中毒，每秒造成167%魔法攻击的伤害，持续3秒",
    id = 0
    };
getRow(223007,11)->
    #player_skills_upgradingCfg {
    skillID = 223007,
    level = 11,
    player_level = 66,
    currency = [{1,230000}],
    skillcoin_cost = 1,
    item = [],
    describe = "清除周围友方的负面效果，并使敌人中毒，每秒造成173%魔法攻击的伤害，持续3秒",
    id = 0
    };
getRow(223007,12)->
    #player_skills_upgradingCfg {
    skillID = 223007,
    level = 12,
    player_level = 68,
    currency = [{1,250000}],
    skillcoin_cost = 1,
    item = [],
    describe = "清除周围友方的负面效果，并使敌人中毒，每秒造成179%魔法攻击的伤害，持续3秒",
    id = 0
    };
getRow(223007,13)->
    #player_skills_upgradingCfg {
    skillID = 223007,
    level = 13,
    player_level = 70,
    currency = [{1,270000}],
    skillcoin_cost = 1,
    item = [],
    describe = "清除周围友方的负面效果，并使敌人中毒，每秒造成185%魔法攻击的伤害，持续3秒",
    id = 0
    };
getRow(223007,14)->
    #player_skills_upgradingCfg {
    skillID = 223007,
    level = 14,
    player_level = 72,
    currency = [{1,290000}],
    skillcoin_cost = 1,
    item = [],
    describe = "清除周围友方的负面效果，并使敌人中毒，每秒造成191%魔法攻击的伤害，持续3秒",
    id = 0
    };
getRow(223007,15)->
    #player_skills_upgradingCfg {
    skillID = 223007,
    level = 15,
    player_level = 74,
    currency = [{1,310000}],
    skillcoin_cost = 1,
    item = [],
    describe = "清除周围友方的负面效果，并使敌人中毒，每秒造成197%魔法攻击的伤害，持续3秒",
    id = 0
    };
getRow(223007,16)->
    #player_skills_upgradingCfg {
    skillID = 223007,
    level = 16,
    player_level = 76,
    currency = [{1,330000}],
    skillcoin_cost = 1,
    item = [],
    describe = "清除周围友方的负面效果，并使敌人中毒，每秒造成203%魔法攻击的伤害，持续3秒",
    id = 0
    };
getRow(223007,17)->
    #player_skills_upgradingCfg {
    skillID = 223007,
    level = 17,
    player_level = 78,
    currency = [{1,350000}],
    skillcoin_cost = 1,
    item = [],
    describe = "清除周围友方的负面效果，并使敌人中毒，每秒造成209%魔法攻击的伤害，持续3秒",
    id = 0
    };
getRow(223007,18)->
    #player_skills_upgradingCfg {
    skillID = 223007,
    level = 18,
    player_level = 80,
    currency = [{1,370000}],
    skillcoin_cost = 1,
    item = [],
    describe = "清除周围友方的负面效果，并使敌人中毒，每秒造成215%魔法攻击的伤害，持续3秒",
    id = 0
    };
getRow(223007,19)->
    #player_skills_upgradingCfg {
    skillID = 223007,
    level = 19,
    player_level = 82,
    currency = [{1,390000}],
    skillcoin_cost = 1,
    item = [],
    describe = "清除周围友方的负面效果，并使敌人中毒，每秒造成221%魔法攻击的伤害，持续3秒",
    id = 0
    };
getRow(223007,20)->
    #player_skills_upgradingCfg {
    skillID = 223007,
    level = 20,
    player_level = 84,
    currency = [{1,410000}],
    skillcoin_cost = 1,
    item = [],
    describe = "清除周围友方的负面效果，并使敌人中毒，每秒造成227%魔法攻击的伤害，持续3秒",
    id = 0
    };
getRow(223007,21)->
    #player_skills_upgradingCfg {
    skillID = 223007,
    level = 21,
    player_level = 86,
    currency = [{1,430000}],
    skillcoin_cost = 1,
    item = [],
    describe = "清除周围友方的负面效果，并使敌人中毒，每秒造成233%魔法攻击的伤害，持续3秒",
    id = 0
    };
getRow(223007,22)->
    #player_skills_upgradingCfg {
    skillID = 223007,
    level = 22,
    player_level = 88,
    currency = [{1,450000}],
    skillcoin_cost = 1,
    item = [],
    describe = "清除周围友方的负面效果，并使敌人中毒，每秒造成239%魔法攻击的伤害，持续3秒",
    id = 0
    };
getRow(223007,23)->
    #player_skills_upgradingCfg {
    skillID = 223007,
    level = 23,
    player_level = 90,
    currency = [{1,470000}],
    skillcoin_cost = 1,
    item = [],
    describe = "清除周围友方的负面效果，并使敌人中毒，每秒造成245%魔法攻击的伤害，持续3秒",
    id = 0
    };
getRow(223007,24)->
    #player_skills_upgradingCfg {
    skillID = 223007,
    level = 24,
    player_level = 92,
    currency = [{1,490000}],
    skillcoin_cost = 1,
    item = [],
    describe = "清除周围友方的负面效果，并使敌人中毒，每秒造成251%魔法攻击的伤害，持续3秒",
    id = 0
    };
getRow(223007,25)->
    #player_skills_upgradingCfg {
    skillID = 223007,
    level = 25,
    player_level = 94,
    currency = [{1,510000}],
    skillcoin_cost = 1,
    item = [],
    describe = "清除周围友方的负面效果，并使敌人中毒，每秒造成257%魔法攻击的伤害，持续3秒",
    id = 0
    };
getRow(223008,1)->
    #player_skills_upgradingCfg {
    skillID = 223008,
    level = 1,
    player_level = 60,
    currency = [],
    skillcoin_cost = 1,
    item = [],
    describe = "提高自身周围范围队友的生命值上限15%，持续10秒",
    id = 0
    };
getRow(223008,2)->
    #player_skills_upgradingCfg {
    skillID = 223008,
    level = 2,
    player_level = 60,
    currency = [{1,70000}],
    skillcoin_cost = 1,
    item = [],
    describe = "提高自身周围范围队友的生命值上限16%，持续10秒",
    id = 0
    };
getRow(223008,3)->
    #player_skills_upgradingCfg {
    skillID = 223008,
    level = 3,
    player_level = 60,
    currency = [{1,110000}],
    skillcoin_cost = 1,
    item = [],
    describe = "提高自身周围范围队友的生命值上限17%，持续10秒",
    id = 0
    };
getRow(223008,4)->
    #player_skills_upgradingCfg {
    skillID = 223008,
    level = 4,
    player_level = 60,
    currency = [{1,150000}],
    skillcoin_cost = 1,
    item = [],
    describe = "提高自身周围范围队友的生命值上限18%，持续10秒",
    id = 0
    };
getRow(223008,5)->
    #player_skills_upgradingCfg {
    skillID = 223008,
    level = 5,
    player_level = 62,
    currency = [{1,190000}],
    skillcoin_cost = 1,
    item = [],
    describe = "提高自身周围范围队友的生命值上限19%，持续10秒",
    id = 0
    };
getRow(223008,6)->
    #player_skills_upgradingCfg {
    skillID = 223008,
    level = 6,
    player_level = 66,
    currency = [{1,230000}],
    skillcoin_cost = 1,
    item = [],
    describe = "提高自身周围范围队友的生命值上限20%，持续10秒",
    id = 0
    };
getRow(223008,7)->
    #player_skills_upgradingCfg {
    skillID = 223008,
    level = 7,
    player_level = 70,
    currency = [{1,270000}],
    skillcoin_cost = 1,
    item = [],
    describe = "提高自身周围范围队友的生命值上限21%，持续10秒",
    id = 0
    };
getRow(223008,8)->
    #player_skills_upgradingCfg {
    skillID = 223008,
    level = 8,
    player_level = 74,
    currency = [{1,310000}],
    skillcoin_cost = 1,
    item = [],
    describe = "提高自身周围范围队友的生命值上限22%，持续10秒",
    id = 0
    };
getRow(223008,9)->
    #player_skills_upgradingCfg {
    skillID = 223008,
    level = 9,
    player_level = 78,
    currency = [{1,350000}],
    skillcoin_cost = 1,
    item = [],
    describe = "提高自身周围范围队友的生命值上限23%，持续10秒",
    id = 0
    };
getRow(223008,10)->
    #player_skills_upgradingCfg {
    skillID = 223008,
    level = 10,
    player_level = 82,
    currency = [{1,390000}],
    skillcoin_cost = 1,
    item = [],
    describe = "提高自身周围范围队友的生命值上限24%，持续10秒",
    id = 0
    };
getRow(223008,11)->
    #player_skills_upgradingCfg {
    skillID = 223008,
    level = 11,
    player_level = 86,
    currency = [{1,430000}],
    skillcoin_cost = 1,
    item = [],
    describe = "提高自身周围范围队友的生命值上限25%，持续10秒",
    id = 0
    };
getRow(223009,1)->
    #player_skills_upgradingCfg {
    skillID = 223009,
    level = 1,
    player_level = 60,
    currency = [],
    skillcoin_cost = 1,
    item = [],
    describe = "提高自身周围范围队友魔法攻击力6%，持续10分钟",
    id = 0
    };
getRow(223009,2)->
    #player_skills_upgradingCfg {
    skillID = 223009,
    level = 2,
    player_level = 60,
    currency = [{1,70000}],
    skillcoin_cost = 1,
    item = [],
    describe = "提高自身周围范围队友魔法攻击力6.6%，持续10分钟",
    id = 0
    };
getRow(223009,3)->
    #player_skills_upgradingCfg {
    skillID = 223009,
    level = 3,
    player_level = 60,
    currency = [{1,110000}],
    skillcoin_cost = 1,
    item = [],
    describe = "提高自身周围范围队友魔法攻击力7.2%，持续10分钟",
    id = 0
    };
getRow(223009,4)->
    #player_skills_upgradingCfg {
    skillID = 223009,
    level = 4,
    player_level = 60,
    currency = [{1,150000}],
    skillcoin_cost = 1,
    item = [],
    describe = "提高自身周围范围队友魔法攻击力7.8%，持续10分钟",
    id = 0
    };
getRow(223009,5)->
    #player_skills_upgradingCfg {
    skillID = 223009,
    level = 5,
    player_level = 62,
    currency = [{1,190000}],
    skillcoin_cost = 1,
    item = [],
    describe = "提高自身周围范围队友魔法攻击力8.4%，持续10分钟",
    id = 0
    };
getRow(223009,6)->
    #player_skills_upgradingCfg {
    skillID = 223009,
    level = 6,
    player_level = 66,
    currency = [{1,230000}],
    skillcoin_cost = 1,
    item = [],
    describe = "提高自身周围范围队友魔法攻击力9%，持续10分钟",
    id = 0
    };
getRow(223009,7)->
    #player_skills_upgradingCfg {
    skillID = 223009,
    level = 7,
    player_level = 70,
    currency = [{1,270000}],
    skillcoin_cost = 1,
    item = [],
    describe = "提高自身周围范围队友魔法攻击力9.6%，持续10分钟",
    id = 0
    };
getRow(223009,8)->
    #player_skills_upgradingCfg {
    skillID = 223009,
    level = 8,
    player_level = 74,
    currency = [{1,310000}],
    skillcoin_cost = 1,
    item = [],
    describe = "提高自身周围范围队友魔法攻击力10.2%，持续10分钟",
    id = 0
    };
getRow(223009,9)->
    #player_skills_upgradingCfg {
    skillID = 223009,
    level = 9,
    player_level = 78,
    currency = [{1,350000}],
    skillcoin_cost = 1,
    item = [],
    describe = "提高自身周围范围队友魔法攻击力10.8%，持续10分钟",
    id = 0
    };
getRow(223009,10)->
    #player_skills_upgradingCfg {
    skillID = 223009,
    level = 10,
    player_level = 82,
    currency = [{1,390000}],
    skillcoin_cost = 1,
    item = [],
    describe = "提高自身周围范围队友魔法攻击力11.4%，持续10分钟",
    id = 0
    };
getRow(223009,11)->
    #player_skills_upgradingCfg {
    skillID = 223009,
    level = 11,
    player_level = 86,
    currency = [{1,430000}],
    skillcoin_cost = 1,
    item = [],
    describe = "提高自身周围范围队友魔法攻击力12%，持续10分钟",
    id = 0
    };
getRow(223010,1)->
    #player_skills_upgradingCfg {
    skillID = 223010,
    level = 1,
    player_level = 60,
    currency = [],
    skillcoin_cost = 1,
    item = [],
    describe = "自身不可移动，不被攻击，每秒恢复40%魔法攻击的生命值，持续5秒",
    id = 0
    };
getRow(223010,2)->
    #player_skills_upgradingCfg {
    skillID = 223010,
    level = 2,
    player_level = 60,
    currency = [{1,70000}],
    skillcoin_cost = 1,
    item = [],
    describe = "自身不可移动，不被攻击，每秒恢复41%魔法攻击的生命值，持续5秒",
    id = 0
    };
getRow(223010,3)->
    #player_skills_upgradingCfg {
    skillID = 223010,
    level = 3,
    player_level = 60,
    currency = [{1,110000}],
    skillcoin_cost = 1,
    item = [],
    describe = "自身不可移动，不被攻击，每秒恢复42%魔法攻击的生命值，持续5秒",
    id = 0
    };
getRow(223010,4)->
    #player_skills_upgradingCfg {
    skillID = 223010,
    level = 4,
    player_level = 60,
    currency = [{1,150000}],
    skillcoin_cost = 1,
    item = [],
    describe = "自身不可移动，不被攻击，每秒恢复43%魔法攻击的生命值，持续5秒",
    id = 0
    };
getRow(223010,5)->
    #player_skills_upgradingCfg {
    skillID = 223010,
    level = 5,
    player_level = 62,
    currency = [{1,190000}],
    skillcoin_cost = 1,
    item = [],
    describe = "自身不可移动，不被攻击，每秒恢复44%魔法攻击的生命值，持续5秒",
    id = 0
    };
getRow(223010,6)->
    #player_skills_upgradingCfg {
    skillID = 223010,
    level = 6,
    player_level = 66,
    currency = [{1,230000}],
    skillcoin_cost = 1,
    item = [],
    describe = "自身不可移动，不被攻击，每秒恢复45%魔法攻击的生命值，持续5秒",
    id = 0
    };
getRow(223010,7)->
    #player_skills_upgradingCfg {
    skillID = 223010,
    level = 7,
    player_level = 70,
    currency = [{1,270000}],
    skillcoin_cost = 1,
    item = [],
    describe = "自身不可移动，不被攻击，每秒恢复46%魔法攻击的生命值，持续5秒",
    id = 0
    };
getRow(223010,8)->
    #player_skills_upgradingCfg {
    skillID = 223010,
    level = 8,
    player_level = 74,
    currency = [{1,310000}],
    skillcoin_cost = 1,
    item = [],
    describe = "自身不可移动，不被攻击，每秒恢复47%魔法攻击的生命值，持续5秒",
    id = 0
    };
getRow(223010,9)->
    #player_skills_upgradingCfg {
    skillID = 223010,
    level = 9,
    player_level = 78,
    currency = [{1,350000}],
    skillcoin_cost = 1,
    item = [],
    describe = "自身不可移动，不被攻击，每秒恢复48%魔法攻击的生命值，持续5秒",
    id = 0
    };
getRow(223010,10)->
    #player_skills_upgradingCfg {
    skillID = 223010,
    level = 10,
    player_level = 82,
    currency = [{1,390000}],
    skillcoin_cost = 1,
    item = [],
    describe = "自身不可移动，不被攻击，每秒恢复49%魔法攻击的生命值，持续5秒",
    id = 0
    };
getRow(223010,11)->
    #player_skills_upgradingCfg {
    skillID = 223010,
    level = 11,
    player_level = 86,
    currency = [{1,430000}],
    skillcoin_cost = 1,
    item = [],
    describe = "自身不可移动，不被攻击，每秒恢复50%魔法攻击的生命值，持续5秒",
    id = 0
    };
getRow(301000,1)->
    #player_skills_upgradingCfg {
    skillID = 301000,
    level = 1,
    player_level = 1,
    currency = [],
    skillcoin_cost = 0,
    item = [],
    describe = "游侠普攻1",
    id = 502
    };
getRow(301001,1)->
    #player_skills_upgradingCfg {
    skillID = 301001,
    level = 1,
    player_level = 1,
    currency = [],
    skillcoin_cost = 0,
    item = [],
    describe = "游侠普攻2",
    id = 503
    };
getRow(301002,1)->
    #player_skills_upgradingCfg {
    skillID = 301002,
    level = 1,
    player_level = 1,
    currency = [],
    skillcoin_cost = 0,
    item = [],
    describe = "游侠普攻3",
    id = 504
    };
getRow(301003,1)->
    #player_skills_upgradingCfg {
    skillID = 301003,
    level = 1,
    player_level = 8,
    currency = [],
    skillcoin_cost = 0,
    item = [],
    describe = "魔力爆发，对周围敌人造成5次攻击，每次造成60%物理攻击的伤害",
    id = 505
    };
getRow(301003,2)->
    #player_skills_upgradingCfg {
    skillID = 301003,
    level = 2,
    player_level = 10,
    currency = [{1,4000}],
    skillcoin_cost = 1,
    item = [],
    describe = "魔力爆发，对周围敌人造成5次攻击，每次造成64%物理攻击的伤害",
    id = 506
    };
getRow(301003,3)->
    #player_skills_upgradingCfg {
    skillID = 301003,
    level = 3,
    player_level = 12,
    currency = [{1,6000}],
    skillcoin_cost = 1,
    item = [],
    describe = "魔力爆发，对周围敌人造成5次攻击，每次造成68%物理攻击的伤害",
    id = 507
    };
getRow(301003,4)->
    #player_skills_upgradingCfg {
    skillID = 301003,
    level = 4,
    player_level = 14,
    currency = [{1,12000}],
    skillcoin_cost = 1,
    item = [],
    describe = "魔力爆发，对周围敌人造成5次攻击，每次造成72%物理攻击的伤害",
    id = 508
    };
getRow(301003,5)->
    #player_skills_upgradingCfg {
    skillID = 301003,
    level = 5,
    player_level = 17,
    currency = [{1,15000}],
    skillcoin_cost = 1,
    item = [],
    describe = "魔力爆发，对周围敌人造成5次攻击，每次造成76%物理攻击的伤害",
    id = 509
    };
getRow(301003,6)->
    #player_skills_upgradingCfg {
    skillID = 301003,
    level = 6,
    player_level = 19,
    currency = [{1,20000}],
    skillcoin_cost = 1,
    item = [],
    describe = "魔力爆发，对周围敌人造成5次攻击，每次造成80%物理攻击的伤害",
    id = 510
    };
getRow(301004,1)->
    #player_skills_upgradingCfg {
    skillID = 301004,
    level = 1,
    player_level = 4,
    currency = [],
    skillcoin_cost = 1,
    item = [],
    describe = "用可以刺穿心脏的力量，给予敌人总计250%物理攻击的伤害。",
    id = 511
    };
getRow(301004,2)->
    #player_skills_upgradingCfg {
    skillID = 301004,
    level = 2,
    player_level = 7,
    currency = [{1,4000}],
    skillcoin_cost = 1,
    item = [],
    describe = "用可以刺穿心脏的力量，给予敌人总计265%物理攻击的伤害。",
    id = 512
    };
getRow(301004,3)->
    #player_skills_upgradingCfg {
    skillID = 301004,
    level = 3,
    player_level = 10,
    currency = [{1,6000}],
    skillcoin_cost = 1,
    item = [],
    describe = "用可以刺穿心脏的力量，给予敌人总计280%物理攻击的伤害。",
    id = 513
    };
getRow(301004,4)->
    #player_skills_upgradingCfg {
    skillID = 301004,
    level = 4,
    player_level = 13,
    currency = [{1,12000}],
    skillcoin_cost = 1,
    item = [],
    describe = "用可以刺穿心脏的力量，给予敌人总计295%物理攻击的伤害。",
    id = 514
    };
getRow(301004,5)->
    #player_skills_upgradingCfg {
    skillID = 301004,
    level = 5,
    player_level = 15,
    currency = [{1,15000}],
    skillcoin_cost = 1,
    item = [],
    describe = "用可以刺穿心脏的力量，给予敌人总计310%物理攻击的伤害。",
    id = 515
    };
getRow(301004,6)->
    #player_skills_upgradingCfg {
    skillID = 301004,
    level = 6,
    player_level = 18,
    currency = [{1,20000}],
    skillcoin_cost = 1,
    item = [],
    describe = "用可以刺穿心脏的力量，给予敌人总计325%物理攻击的伤害。",
    id = 516
    };
getRow(301005,1)->
    #player_skills_upgradingCfg {
    skillID = 301005,
    level = 1,
    player_level = 1,
    currency = [],
    skillcoin_cost = 1,
    item = [],
    describe = "使用匕首，快速接近阻挡的敌人，造成176%物理攻击的伤害，并造成流血伤害。",
    id = 517
    };
getRow(301005,2)->
    #player_skills_upgradingCfg {
    skillID = 301005,
    level = 2,
    player_level = 3,
    currency = [{1,4000}],
    skillcoin_cost = 1,
    item = [],
    describe = "使用匕首，快速接近阻挡的敌人，造成186%物理攻击的伤害，并造成流血伤害。",
    id = 518
    };
getRow(301005,3)->
    #player_skills_upgradingCfg {
    skillID = 301005,
    level = 3,
    player_level = 4,
    currency = [{1,6000}],
    skillcoin_cost = 1,
    item = [],
    describe = "使用匕首，快速接近阻挡的敌人，造成196%物理攻击的伤害，并造成流血伤害。",
    id = 519
    };
getRow(301005,4)->
    #player_skills_upgradingCfg {
    skillID = 301005,
    level = 4,
    player_level = 9,
    currency = [{1,12000}],
    skillcoin_cost = 1,
    item = [],
    describe = "使用匕首，快速接近阻挡的敌人，造成206%物理攻击的伤害，并造成流血伤害。",
    id = 520
    };
getRow(301005,5)->
    #player_skills_upgradingCfg {
    skillID = 301005,
    level = 5,
    player_level = 13,
    currency = [{1,15000}],
    skillcoin_cost = 1,
    item = [],
    describe = "使用匕首，快速接近阻挡的敌人，造成216%物理攻击的伤害，并造成流血伤害。",
    id = 521
    };
getRow(301005,6)->
    #player_skills_upgradingCfg {
    skillID = 301005,
    level = 6,
    player_level = 17,
    currency = [{1,20000}],
    skillcoin_cost = 1,
    item = [],
    describe = "使用匕首，快速接近阻挡的敌人，造成226%物理攻击的伤害，并造成流血伤害。",
    id = 522
    };
getRow(301006,1)->
    #player_skills_upgradingCfg {
    skillID = 301006,
    level = 1,
    player_level = 12,
    currency = [],
    skillcoin_cost = 1,
    item = [],
    describe = "提升自身15%移动速度，20%爆伤等级，持续10秒。",
    id = 523
    };
getRow(301006,2)->
    #player_skills_upgradingCfg {
    skillID = 301006,
    level = 2,
    player_level = 13,
    currency = [{1,4000}],
    skillcoin_cost = 1,
    item = [],
    describe = "提升自身16%移动速度，22%爆伤等级，持续10秒。",
    id = 524
    };
getRow(301006,3)->
    #player_skills_upgradingCfg {
    skillID = 301006,
    level = 3,
    player_level = 14,
    currency = [{1,6000}],
    skillcoin_cost = 1,
    item = [],
    describe = "提升自身17%移动速度，24%爆伤等级，持续10秒。",
    id = 525
    };
getRow(301006,4)->
    #player_skills_upgradingCfg {
    skillID = 301006,
    level = 4,
    player_level = 15,
    currency = [{1,12000}],
    skillcoin_cost = 1,
    item = [],
    describe = "提升自身18%移动速度，26%爆伤等级，持续10秒。",
    id = 526
    };
getRow(301006,5)->
    #player_skills_upgradingCfg {
    skillID = 301006,
    level = 5,
    player_level = 17,
    currency = [{1,15000}],
    skillcoin_cost = 1,
    item = [],
    describe = "提升自身19%移动速度，28%爆伤等级，持续10秒。",
    id = 527
    };
getRow(301006,6)->
    #player_skills_upgradingCfg {
    skillID = 301006,
    level = 6,
    player_level = 19,
    currency = [{1,20000}],
    skillcoin_cost = 1,
    item = [],
    describe = "提升自身20%移动速度，30%爆伤等级，持续10秒。",
    id = 528
    };
getRow(311000,1)->
    #player_skills_upgradingCfg {
    skillID = 311000,
    level = 1,
    player_level = 20,
    currency = [],
    skillcoin_cost = 0,
    item = [],
    describe = "旅者普攻1",
    id = 529
    };
getRow(311001,1)->
    #player_skills_upgradingCfg {
    skillID = 311001,
    level = 1,
    player_level = 20,
    currency = [],
    skillcoin_cost = 0,
    item = [],
    describe = "旅者普攻2",
    id = 530
    };
getRow(311002,1)->
    #player_skills_upgradingCfg {
    skillID = 311002,
    level = 1,
    player_level = 20,
    currency = [],
    skillcoin_cost = 0,
    item = [],
    describe = "旅者普攻3",
    id = 531
    };
getRow(311003,1)->
    #player_skills_upgradingCfg {
    skillID = 311003,
    level = 1,
    player_level = 20,
    currency = [],
    skillcoin_cost = 0,
    item = [],
    describe = "使用弓箭，以贯穿一切的力量，对前方敌人造成300%物理攻击的伤害，增加自身4%物理攻击，持续3秒。",
    id = 532
    };
getRow(311003,2)->
    #player_skills_upgradingCfg {
    skillID = 311003,
    level = 2,
    player_level = 20,
    currency = [{1,10000}],
    skillcoin_cost = 1,
    item = [],
    describe = "使用弓箭，以贯穿一切的力量，对前方敌人造成318%物理攻击的伤害，增加自身4.3%物理攻击，持续3秒。",
    id = 533
    };
getRow(311003,3)->
    #player_skills_upgradingCfg {
    skillID = 311003,
    level = 3,
    player_level = 20,
    currency = [{1,15000}],
    skillcoin_cost = 1,
    item = [],
    describe = "使用弓箭，以贯穿一切的力量，对前方敌人造成336%物理攻击的伤害，增加自身4.6%物理攻击，持续3秒。",
    id = 534
    };
getRow(311003,4)->
    #player_skills_upgradingCfg {
    skillID = 311003,
    level = 4,
    player_level = 22,
    currency = [{1,20000}],
    skillcoin_cost = 1,
    item = [],
    describe = "使用弓箭，以贯穿一切的力量，对前方敌人造成354%物理攻击的伤害，增加自身4.9%物理攻击，持续3秒。",
    id = 535
    };
getRow(311003,5)->
    #player_skills_upgradingCfg {
    skillID = 311003,
    level = 5,
    player_level = 25,
    currency = [{1,25000}],
    skillcoin_cost = 1,
    item = [],
    describe = "使用弓箭，以贯穿一切的力量，对前方敌人造成372%物理攻击的伤害，增加自身5.2%物理攻击，持续3秒。",
    id = 536
    };
getRow(311003,6)->
    #player_skills_upgradingCfg {
    skillID = 311003,
    level = 6,
    player_level = 28,
    currency = [{1,30000}],
    skillcoin_cost = 1,
    item = [],
    describe = "使用弓箭，以贯穿一切的力量，对前方敌人造成390%物理攻击的伤害，增加自身5.5%物理攻击，持续3秒。",
    id = 537
    };
getRow(311003,7)->
    #player_skills_upgradingCfg {
    skillID = 311003,
    level = 7,
    player_level = 31,
    currency = [{1,35000}],
    skillcoin_cost = 1,
    item = [],
    describe = "使用弓箭，以贯穿一切的力量，对前方敌人造成408%物理攻击的伤害，增加自身5.8%物理攻击，持续3秒。",
    id = 538
    };
getRow(311003,8)->
    #player_skills_upgradingCfg {
    skillID = 311003,
    level = 8,
    player_level = 34,
    currency = [{1,40000}],
    skillcoin_cost = 1,
    item = [],
    describe = "使用弓箭，以贯穿一切的力量，对前方敌人造成426%物理攻击的伤害，增加自身6.1%物理攻击，持续3秒。",
    id = 539
    };
getRow(311003,9)->
    #player_skills_upgradingCfg {
    skillID = 311003,
    level = 9,
    player_level = 37,
    currency = [{1,45000}],
    skillcoin_cost = 1,
    item = [],
    describe = "使用弓箭，以贯穿一切的力量，对前方敌人造成444%物理攻击的伤害，增加自身6.4%物理攻击，持续3秒。",
    id = 540
    };
getRow(311003,10)->
    #player_skills_upgradingCfg {
    skillID = 311003,
    level = 10,
    player_level = 40,
    currency = [{1,50000}],
    skillcoin_cost = 1,
    item = [],
    describe = "使用弓箭，以贯穿一切的力量，对前方敌人造成462%物理攻击的伤害，增加自身6.7%物理攻击，持续3秒。",
    id = 541
    };
getRow(311003,11)->
    #player_skills_upgradingCfg {
    skillID = 311003,
    level = 11,
    player_level = 43,
    currency = [{1,55000}],
    skillcoin_cost = 1,
    item = [],
    describe = "使用弓箭，以贯穿一切的力量，对前方敌人造成480%物理攻击的伤害，增加自身7%物理攻击，持续3秒。",
    id = 542
    };
getRow(311003,12)->
    #player_skills_upgradingCfg {
    skillID = 311003,
    level = 12,
    player_level = 46,
    currency = [{1,60000}],
    skillcoin_cost = 1,
    item = [],
    describe = "使用弓箭，以贯穿一切的力量，对前方敌人造成498%物理攻击的伤害，增加自身7.3%物理攻击，持续3秒。",
    id = 543
    };
getRow(311003,13)->
    #player_skills_upgradingCfg {
    skillID = 311003,
    level = 13,
    player_level = 49,
    currency = [{1,65000}],
    skillcoin_cost = 1,
    item = [],
    describe = "使用弓箭，以贯穿一切的力量，对前方敌人造成516%物理攻击的伤害，增加自身7.6%物理攻击，持续3秒。",
    id = 544
    };
getRow(311003,14)->
    #player_skills_upgradingCfg {
    skillID = 311003,
    level = 14,
    player_level = 52,
    currency = [{1,70000}],
    skillcoin_cost = 1,
    item = [],
    describe = "使用弓箭，以贯穿一切的力量，对前方敌人造成534%物理攻击的伤害，增加自身7.9%物理攻击，持续3秒。",
    id = 545
    };
getRow(311003,15)->
    #player_skills_upgradingCfg {
    skillID = 311003,
    level = 15,
    player_level = 55,
    currency = [{1,75000}],
    skillcoin_cost = 1,
    item = [],
    describe = "使用弓箭，以贯穿一切的力量，对前方敌人造成552%物理攻击的伤害，增加自身8.2%物理攻击，持续3秒。",
    id = 546
    };
getRow(311004,1)->
    #player_skills_upgradingCfg {
    skillID = 311004,
    level = 1,
    player_level = 20,
    currency = [],
    skillcoin_cost = 1,
    item = [],
    describe = "使用弓箭，以箭射穿接近的敌人，给予敌人350%物理攻击的伤害，并使得敌人定身，持续3秒",
    id = 547
    };
getRow(311004,2)->
    #player_skills_upgradingCfg {
    skillID = 311004,
    level = 2,
    player_level = 20,
    currency = [{1,10000}],
    skillcoin_cost = 1,
    item = [],
    describe = "使用弓箭，以箭射穿接近的敌人，给予敌人365%物理攻击的伤害，并使得敌人定身，持续3秒",
    id = 548
    };
getRow(311004,3)->
    #player_skills_upgradingCfg {
    skillID = 311004,
    level = 3,
    player_level = 20,
    currency = [{1,15000}],
    skillcoin_cost = 1,
    item = [],
    describe = "使用弓箭，以箭射穿接近的敌人，给予敌人380%物理攻击的伤害，并使得敌人定身，持续3秒",
    id = 549
    };
getRow(311004,4)->
    #player_skills_upgradingCfg {
    skillID = 311004,
    level = 4,
    player_level = 22,
    currency = [{1,20000}],
    skillcoin_cost = 1,
    item = [],
    describe = "使用弓箭，以箭射穿接近的敌人，给予敌人395%物理攻击的伤害，并使得敌人定身，持续3秒",
    id = 550
    };
getRow(311004,5)->
    #player_skills_upgradingCfg {
    skillID = 311004,
    level = 5,
    player_level = 25,
    currency = [{1,25000}],
    skillcoin_cost = 1,
    item = [],
    describe = "使用弓箭，以箭射穿接近的敌人，给予敌人410%物理攻击的伤害，并使得敌人定身，持续3秒",
    id = 551
    };
getRow(311004,6)->
    #player_skills_upgradingCfg {
    skillID = 311004,
    level = 6,
    player_level = 28,
    currency = [{1,30000}],
    skillcoin_cost = 1,
    item = [],
    describe = "使用弓箭，以箭射穿接近的敌人，给予敌人425%物理攻击的伤害，并使得敌人定身，持续3秒",
    id = 552
    };
getRow(311004,7)->
    #player_skills_upgradingCfg {
    skillID = 311004,
    level = 7,
    player_level = 31,
    currency = [{1,35000}],
    skillcoin_cost = 1,
    item = [],
    describe = "使用弓箭，以箭射穿接近的敌人，给予敌人440%物理攻击的伤害，并使得敌人定身，持续3秒",
    id = 553
    };
getRow(311004,8)->
    #player_skills_upgradingCfg {
    skillID = 311004,
    level = 8,
    player_level = 34,
    currency = [{1,40000}],
    skillcoin_cost = 1,
    item = [],
    describe = "使用弓箭，以箭射穿接近的敌人，给予敌人455%物理攻击的伤害，并使得敌人定身，持续3秒",
    id = 554
    };
getRow(311004,9)->
    #player_skills_upgradingCfg {
    skillID = 311004,
    level = 9,
    player_level = 37,
    currency = [{1,45000}],
    skillcoin_cost = 1,
    item = [],
    describe = "使用弓箭，以箭射穿接近的敌人，给予敌人470%物理攻击的伤害，并使得敌人定身，持续3秒",
    id = 555
    };
getRow(311004,10)->
    #player_skills_upgradingCfg {
    skillID = 311004,
    level = 10,
    player_level = 40,
    currency = [{1,50000}],
    skillcoin_cost = 1,
    item = [],
    describe = "使用弓箭，以箭射穿接近的敌人，给予敌人485%物理攻击的伤害，并使得敌人定身，持续3秒",
    id = 556
    };
getRow(311004,11)->
    #player_skills_upgradingCfg {
    skillID = 311004,
    level = 11,
    player_level = 43,
    currency = [{1,55000}],
    skillcoin_cost = 1,
    item = [],
    describe = "使用弓箭，以箭射穿接近的敌人，给予敌人500%物理攻击的伤害，并使得敌人定身，持续3秒",
    id = 557
    };
getRow(311004,12)->
    #player_skills_upgradingCfg {
    skillID = 311004,
    level = 12,
    player_level = 46,
    currency = [{1,60000}],
    skillcoin_cost = 1,
    item = [],
    describe = "使用弓箭，以箭射穿接近的敌人，给予敌人515%物理攻击的伤害，并使得敌人定身，持续3秒",
    id = 558
    };
getRow(311004,13)->
    #player_skills_upgradingCfg {
    skillID = 311004,
    level = 13,
    player_level = 49,
    currency = [{1,65000}],
    skillcoin_cost = 1,
    item = [],
    describe = "使用弓箭，以箭射穿接近的敌人，给予敌人530%物理攻击的伤害，并使得敌人定身，持续3秒",
    id = 559
    };
getRow(311004,14)->
    #player_skills_upgradingCfg {
    skillID = 311004,
    level = 14,
    player_level = 52,
    currency = [{1,70000}],
    skillcoin_cost = 1,
    item = [],
    describe = "使用弓箭，以箭射穿接近的敌人，给予敌人545%物理攻击的伤害，并使得敌人定身，持续3秒",
    id = 560
    };
getRow(311004,15)->
    #player_skills_upgradingCfg {
    skillID = 311004,
    level = 15,
    player_level = 55,
    currency = [{1,75000}],
    skillcoin_cost = 1,
    item = [],
    describe = "使用弓箭，以箭射穿接近的敌人，给予敌人560%物理攻击的伤害，并使得敌人定身，持续3秒",
    id = 561
    };
getRow(311005,1)->
    #player_skills_upgradingCfg {
    skillID = 311005,
    level = 1,
    player_level = 20,
    currency = [],
    skillcoin_cost = 1,
    item = [],
    describe = "用弓箭射击敌人的腿，使其往后退，造成总计250%物理攻击的伤害，并减速",
    id = 562
    };
getRow(311005,2)->
    #player_skills_upgradingCfg {
    skillID = 311005,
    level = 2,
    player_level = 20,
    currency = [{1,10000}],
    skillcoin_cost = 1,
    item = [],
    describe = "用弓箭射击敌人的腿，使其往后退，造成总计265%物理攻击的伤害，并减速",
    id = 563
    };
getRow(311005,3)->
    #player_skills_upgradingCfg {
    skillID = 311005,
    level = 3,
    player_level = 20,
    currency = [{1,15000}],
    skillcoin_cost = 1,
    item = [],
    describe = "用弓箭射击敌人的腿，使其往后退，造成总计280%物理攻击的伤害，并减速",
    id = 564
    };
getRow(311005,4)->
    #player_skills_upgradingCfg {
    skillID = 311005,
    level = 4,
    player_level = 22,
    currency = [{1,20000}],
    skillcoin_cost = 1,
    item = [],
    describe = "用弓箭射击敌人的腿，使其往后退，造成总计295%物理攻击的伤害，并减速",
    id = 565
    };
getRow(311005,5)->
    #player_skills_upgradingCfg {
    skillID = 311005,
    level = 5,
    player_level = 25,
    currency = [{1,25000}],
    skillcoin_cost = 1,
    item = [],
    describe = "用弓箭射击敌人的腿，使其往后退，造成总计310%物理攻击的伤害，并减速",
    id = 566
    };
getRow(311005,6)->
    #player_skills_upgradingCfg {
    skillID = 311005,
    level = 6,
    player_level = 28,
    currency = [{1,30000}],
    skillcoin_cost = 1,
    item = [],
    describe = "用弓箭射击敌人的腿，使其往后退，造成总计325%物理攻击的伤害，并减速",
    id = 567
    };
getRow(311005,7)->
    #player_skills_upgradingCfg {
    skillID = 311005,
    level = 7,
    player_level = 31,
    currency = [{1,35000}],
    skillcoin_cost = 1,
    item = [],
    describe = "用弓箭射击敌人的腿，使其往后退，造成总计340%物理攻击的伤害，并减速",
    id = 568
    };
getRow(311005,8)->
    #player_skills_upgradingCfg {
    skillID = 311005,
    level = 8,
    player_level = 34,
    currency = [{1,40000}],
    skillcoin_cost = 1,
    item = [],
    describe = "用弓箭射击敌人的腿，使其往后退，造成总计355%物理攻击的伤害，并减速",
    id = 569
    };
getRow(311005,9)->
    #player_skills_upgradingCfg {
    skillID = 311005,
    level = 9,
    player_level = 37,
    currency = [{1,45000}],
    skillcoin_cost = 1,
    item = [],
    describe = "用弓箭射击敌人的腿，使其往后退，造成总计370%物理攻击的伤害，并减速",
    id = 570
    };
getRow(311005,10)->
    #player_skills_upgradingCfg {
    skillID = 311005,
    level = 10,
    player_level = 40,
    currency = [{1,50000}],
    skillcoin_cost = 1,
    item = [],
    describe = "用弓箭射击敌人的腿，使其往后退，造成总计385%物理攻击的伤害，并减速",
    id = 571
    };
getRow(311005,11)->
    #player_skills_upgradingCfg {
    skillID = 311005,
    level = 11,
    player_level = 43,
    currency = [{1,55000}],
    skillcoin_cost = 1,
    item = [],
    describe = "用弓箭射击敌人的腿，使其往后退，造成总计400%物理攻击的伤害，并减速",
    id = 572
    };
getRow(311005,12)->
    #player_skills_upgradingCfg {
    skillID = 311005,
    level = 12,
    player_level = 46,
    currency = [{1,60000}],
    skillcoin_cost = 1,
    item = [],
    describe = "用弓箭射击敌人的腿，使其往后退，造成总计415%物理攻击的伤害，并减速",
    id = 573
    };
getRow(311005,13)->
    #player_skills_upgradingCfg {
    skillID = 311005,
    level = 13,
    player_level = 49,
    currency = [{1,65000}],
    skillcoin_cost = 1,
    item = [],
    describe = "用弓箭射击敌人的腿，使其往后退，造成总计430%物理攻击的伤害，并减速",
    id = 574
    };
getRow(311005,14)->
    #player_skills_upgradingCfg {
    skillID = 311005,
    level = 14,
    player_level = 52,
    currency = [{1,70000}],
    skillcoin_cost = 1,
    item = [],
    describe = "用弓箭射击敌人的腿，使其往后退，造成总计445%物理攻击的伤害，并减速",
    id = 575
    };
getRow(311005,15)->
    #player_skills_upgradingCfg {
    skillID = 311005,
    level = 15,
    player_level = 55,
    currency = [{1,75000}],
    skillcoin_cost = 1,
    item = [],
    describe = "用弓箭射击敌人的腿，使其往后退，造成总计460%物理攻击的伤害，并减速",
    id = 576
    };
getRow(311006,1)->
    #player_skills_upgradingCfg {
    skillID = 311006,
    level = 1,
    player_level = 20,
    currency = [],
    skillcoin_cost = 1,
    item = [],
    describe = "在自身周围释放箭雨，造成6次攻击，每次攻击造成58%物理攻击的强力伤害，并击退和减速敌人。",
    id = 577
    };
getRow(311006,2)->
    #player_skills_upgradingCfg {
    skillID = 311006,
    level = 2,
    player_level = 20,
    currency = [{1,10000}],
    skillcoin_cost = 1,
    item = [],
    describe = "在自身周围释放箭雨，造成6次攻击，每次攻击造成61%物理攻击的强力伤害，并击退和减速敌人。",
    id = 578
    };
getRow(311006,3)->
    #player_skills_upgradingCfg {
    skillID = 311006,
    level = 3,
    player_level = 20,
    currency = [{1,15000}],
    skillcoin_cost = 1,
    item = [],
    describe = "在自身周围释放箭雨，造成6次攻击，每次攻击造成64%物理攻击的强力伤害，并击退和减速敌人。",
    id = 579
    };
getRow(311006,4)->
    #player_skills_upgradingCfg {
    skillID = 311006,
    level = 4,
    player_level = 22,
    currency = [{1,20000}],
    skillcoin_cost = 1,
    item = [],
    describe = "在自身周围释放箭雨，造成6次攻击，每次攻击造成68%物理攻击的强力伤害，并击退和减速敌人。",
    id = 580
    };
getRow(311006,5)->
    #player_skills_upgradingCfg {
    skillID = 311006,
    level = 5,
    player_level = 25,
    currency = [{1,25000}],
    skillcoin_cost = 1,
    item = [],
    describe = "在自身周围释放箭雨，造成6次攻击，每次攻击造成71%物理攻击的强力伤害，并击退和减速敌人。",
    id = 581
    };
getRow(311006,6)->
    #player_skills_upgradingCfg {
    skillID = 311006,
    level = 6,
    player_level = 28,
    currency = [{1,30000}],
    skillcoin_cost = 1,
    item = [],
    describe = "在自身周围释放箭雨，造成6次攻击，每次攻击造成74%物理攻击的强力伤害，并击退和减速敌人。",
    id = 582
    };
getRow(311006,7)->
    #player_skills_upgradingCfg {
    skillID = 311006,
    level = 7,
    player_level = 31,
    currency = [{1,35000}],
    skillcoin_cost = 1,
    item = [],
    describe = "在自身周围释放箭雨，造成6次攻击，每次攻击造成78%物理攻击的强力伤害，并击退和减速敌人。",
    id = 583
    };
getRow(311006,8)->
    #player_skills_upgradingCfg {
    skillID = 311006,
    level = 8,
    player_level = 34,
    currency = [{1,40000}],
    skillcoin_cost = 1,
    item = [],
    describe = "在自身周围释放箭雨，造成6次攻击，每次攻击造成81%物理攻击的强力伤害，并击退和减速敌人。",
    id = 584
    };
getRow(311006,9)->
    #player_skills_upgradingCfg {
    skillID = 311006,
    level = 9,
    player_level = 37,
    currency = [{1,45000}],
    skillcoin_cost = 1,
    item = [],
    describe = "在自身周围释放箭雨，造成6次攻击，每次攻击造成84%物理攻击的强力伤害，并击退和减速敌人。",
    id = 585
    };
getRow(311006,10)->
    #player_skills_upgradingCfg {
    skillID = 311006,
    level = 10,
    player_level = 40,
    currency = [{1,50000}],
    skillcoin_cost = 1,
    item = [],
    describe = "在自身周围释放箭雨，造成6次攻击，每次攻击造成88%物理攻击的强力伤害，并击退和减速敌人。",
    id = 586
    };
getRow(311006,11)->
    #player_skills_upgradingCfg {
    skillID = 311006,
    level = 11,
    player_level = 43,
    currency = [{1,55000}],
    skillcoin_cost = 1,
    item = [],
    describe = "在自身周围释放箭雨，造成6次攻击，每次攻击造成91%物理攻击的强力伤害，并击退和减速敌人。",
    id = 587
    };
getRow(311006,12)->
    #player_skills_upgradingCfg {
    skillID = 311006,
    level = 12,
    player_level = 46,
    currency = [{1,60000}],
    skillcoin_cost = 1,
    item = [],
    describe = "在自身周围释放箭雨，造成6次攻击，每次攻击造成94%物理攻击的强力伤害，并击退和减速敌人。",
    id = 588
    };
getRow(311006,13)->
    #player_skills_upgradingCfg {
    skillID = 311006,
    level = 13,
    player_level = 49,
    currency = [{1,65000}],
    skillcoin_cost = 1,
    item = [],
    describe = "在自身周围释放箭雨，造成6次攻击，每次攻击造成98%物理攻击的强力伤害，并击退和减速敌人。",
    id = 589
    };
getRow(311006,14)->
    #player_skills_upgradingCfg {
    skillID = 311006,
    level = 14,
    player_level = 52,
    currency = [{1,70000}],
    skillcoin_cost = 1,
    item = [],
    describe = "在自身周围释放箭雨，造成6次攻击，每次攻击造成101%物理攻击的强力伤害，并击退和减速敌人。",
    id = 590
    };
getRow(311006,15)->
    #player_skills_upgradingCfg {
    skillID = 311006,
    level = 15,
    player_level = 55,
    currency = [{1,75000}],
    skillcoin_cost = 1,
    item = [],
    describe = "在自身周围释放箭雨，造成6次攻击，每次攻击造成104%物理攻击的强力伤害，并击退和减速敌人。",
    id = 591
    };
getRow(311007,1)->
    #player_skills_upgradingCfg {
    skillID = 311007,
    level = 1,
    player_level = 20,
    currency = [],
    skillcoin_cost = 1,
    item = [],
    describe = "提升队友10%移动速度，30%爆伤等级，持续10秒",
    id = 592
    };
getRow(311007,2)->
    #player_skills_upgradingCfg {
    skillID = 311007,
    level = 2,
    player_level = 20,
    currency = [{1,10000}],
    skillcoin_cost = 1,
    item = [],
    describe = "提升队友11%移动速度，32%爆伤等级，持续10秒",
    id = 593
    };
getRow(311007,3)->
    #player_skills_upgradingCfg {
    skillID = 311007,
    level = 3,
    player_level = 20,
    currency = [{1,15000}],
    skillcoin_cost = 1,
    item = [],
    describe = "提升队友12%移动速度，34%爆伤等级，持续10秒",
    id = 594
    };
getRow(311007,4)->
    #player_skills_upgradingCfg {
    skillID = 311007,
    level = 4,
    player_level = 22,
    currency = [{1,20000}],
    skillcoin_cost = 1,
    item = [],
    describe = "提升队友13%移动速度，36%爆伤等级，持续10秒",
    id = 595
    };
getRow(311007,5)->
    #player_skills_upgradingCfg {
    skillID = 311007,
    level = 5,
    player_level = 25,
    currency = [{1,25000}],
    skillcoin_cost = 1,
    item = [],
    describe = "提升队友14%移动速度，38%爆伤等级，持续10秒",
    id = 596
    };
getRow(311007,6)->
    #player_skills_upgradingCfg {
    skillID = 311007,
    level = 6,
    player_level = 28,
    currency = [{1,30000}],
    skillcoin_cost = 1,
    item = [],
    describe = "提升队友15%移动速度，40%爆伤等级，持续10秒",
    id = 592
    };
getRow(311007,7)->
    #player_skills_upgradingCfg {
    skillID = 311007,
    level = 7,
    player_level = 31,
    currency = [{1,35000}],
    skillcoin_cost = 1,
    item = [],
    describe = "提升队友16%移动速度，42%爆伤等级，持续10秒",
    id = 593
    };
getRow(311007,8)->
    #player_skills_upgradingCfg {
    skillID = 311007,
    level = 8,
    player_level = 34,
    currency = [{1,40000}],
    skillcoin_cost = 1,
    item = [],
    describe = "提升队友17%移动速度，44%爆伤等级，持续10秒",
    id = 594
    };
getRow(311007,9)->
    #player_skills_upgradingCfg {
    skillID = 311007,
    level = 9,
    player_level = 37,
    currency = [{1,45000}],
    skillcoin_cost = 1,
    item = [],
    describe = "提升队友18%移动速度，46%爆伤等级，持续10秒",
    id = 595
    };
getRow(311007,10)->
    #player_skills_upgradingCfg {
    skillID = 311007,
    level = 10,
    player_level = 40,
    currency = [{1,50000}],
    skillcoin_cost = 1,
    item = [],
    describe = "提升队友19%移动速度，48%爆伤等级，持续10秒",
    id = 596
    };
getRow(311007,11)->
    #player_skills_upgradingCfg {
    skillID = 311007,
    level = 11,
    player_level = 43,
    currency = [{1,55000}],
    skillcoin_cost = 1,
    item = [],
    describe = "提升队友20%移动速度，50%爆伤等级，持续10秒",
    id = 597
    };
getRow(311008,1)->
    #player_skills_upgradingCfg {
    skillID = 311008,
    level = 1,
    player_level = 20,
    currency = [],
    skillcoin_cost = 1,
    item = [],
    describe = "使周围全体队友提升10%物理防御力，持续10分钟",
    id = 607
    };
getRow(311008,2)->
    #player_skills_upgradingCfg {
    skillID = 311008,
    level = 2,
    player_level = 20,
    currency = [{1,10000}],
    skillcoin_cost = 1,
    item = [],
    describe = "使周围全体队友提升11%物理防御力，持续10分钟",
    id = 608
    };
getRow(311008,3)->
    #player_skills_upgradingCfg {
    skillID = 311008,
    level = 3,
    player_level = 20,
    currency = [{1,15000}],
    skillcoin_cost = 1,
    item = [],
    describe = "使周围全体队友提升12%物理防御力，持续10分钟",
    id = 609
    };
getRow(311008,4)->
    #player_skills_upgradingCfg {
    skillID = 311008,
    level = 4,
    player_level = 22,
    currency = [{1,20000}],
    skillcoin_cost = 1,
    item = [],
    describe = "使周围全体队友提升13%物理防御力，持续10分钟",
    id = 610
    };
getRow(311008,5)->
    #player_skills_upgradingCfg {
    skillID = 311008,
    level = 5,
    player_level = 25,
    currency = [{1,25000}],
    skillcoin_cost = 1,
    item = [],
    describe = "使周围全体队友提升14%物理防御力，持续10分钟",
    id = 611
    };
getRow(311008,6)->
    #player_skills_upgradingCfg {
    skillID = 311008,
    level = 6,
    player_level = 28,
    currency = [{1,30000}],
    skillcoin_cost = 1,
    item = [],
    describe = "使周围全体队友提升15%物理防御力，持续10分钟",
    id = 607
    };
getRow(311008,7)->
    #player_skills_upgradingCfg {
    skillID = 311008,
    level = 7,
    player_level = 31,
    currency = [{1,35000}],
    skillcoin_cost = 1,
    item = [],
    describe = "使周围全体队友提升16%物理防御力，持续10分钟",
    id = 608
    };
getRow(311008,8)->
    #player_skills_upgradingCfg {
    skillID = 311008,
    level = 8,
    player_level = 34,
    currency = [{1,40000}],
    skillcoin_cost = 1,
    item = [],
    describe = "使周围全体队友提升17%物理防御力，持续10分钟",
    id = 609
    };
getRow(311008,9)->
    #player_skills_upgradingCfg {
    skillID = 311008,
    level = 9,
    player_level = 37,
    currency = [{1,45000}],
    skillcoin_cost = 1,
    item = [],
    describe = "使周围全体队友提升18%物理防御力，持续10分钟",
    id = 610
    };
getRow(311008,10)->
    #player_skills_upgradingCfg {
    skillID = 311008,
    level = 10,
    player_level = 40,
    currency = [{1,50000}],
    skillcoin_cost = 1,
    item = [],
    describe = "使周围全体队友提升19%物理防御力，持续10分钟",
    id = 611
    };
getRow(311008,11)->
    #player_skills_upgradingCfg {
    skillID = 311008,
    level = 11,
    player_level = 43,
    currency = [{1,55000}],
    skillcoin_cost = 1,
    item = [],
    describe = "使周围全体队友提升20%物理防御力，持续10分钟",
    id = 612
    };
getRow(311009,1)->
    #player_skills_upgradingCfg {
    skillID = 311009,
    level = 1,
    player_level = 20,
    currency = [],
    skillcoin_cost = 1,
    item = [],
    describe = "使用弓箭，以箭射穿接近的单个敌人，给予敌人252%物理攻击的伤害，并降低4%物理攻击，持续3秒。",
    id = 622
    };
getRow(311009,2)->
    #player_skills_upgradingCfg {
    skillID = 311009,
    level = 2,
    player_level = 20,
    currency = [{1,10000}],
    skillcoin_cost = 1,
    item = [],
    describe = "使用弓箭，以箭射穿接近的单个敌人，给予敌人261%物理攻击的伤害，并降低4.3%物理攻击，持续3秒。",
    id = 623
    };
getRow(311009,3)->
    #player_skills_upgradingCfg {
    skillID = 311009,
    level = 3,
    player_level = 20,
    currency = [{1,15000}],
    skillcoin_cost = 1,
    item = [],
    describe = "使用弓箭，以箭射穿接近的单个敌人，给予敌人270%物理攻击的伤害，并降低4.6%物理攻击，持续3秒。",
    id = 624
    };
getRow(311009,4)->
    #player_skills_upgradingCfg {
    skillID = 311009,
    level = 4,
    player_level = 22,
    currency = [{1,20000}],
    skillcoin_cost = 1,
    item = [],
    describe = "使用弓箭，以箭射穿接近的单个敌人，给予敌人279%物理攻击的伤害，并降低4.9%物理攻击，持续3秒。",
    id = 625
    };
getRow(311009,5)->
    #player_skills_upgradingCfg {
    skillID = 311009,
    level = 5,
    player_level = 25,
    currency = [{1,25000}],
    skillcoin_cost = 1,
    item = [],
    describe = "使用弓箭，以箭射穿接近的单个敌人，给予敌人288%物理攻击的伤害，并降低5.2%物理攻击，持续3秒。",
    id = 626
    };
getRow(311009,6)->
    #player_skills_upgradingCfg {
    skillID = 311009,
    level = 6,
    player_level = 28,
    currency = [{1,30000}],
    skillcoin_cost = 1,
    item = [],
    describe = "使用弓箭，以箭射穿接近的单个敌人，给予敌人297%物理攻击的伤害，并降低5.5%物理攻击，持续3秒。",
    id = 627
    };
getRow(311009,7)->
    #player_skills_upgradingCfg {
    skillID = 311009,
    level = 7,
    player_level = 31,
    currency = [{1,35000}],
    skillcoin_cost = 1,
    item = [],
    describe = "使用弓箭，以箭射穿接近的单个敌人，给予敌人306%物理攻击的伤害，并降低5.8%物理攻击，持续3秒。",
    id = 628
    };
getRow(311009,8)->
    #player_skills_upgradingCfg {
    skillID = 311009,
    level = 8,
    player_level = 34,
    currency = [{1,40000}],
    skillcoin_cost = 1,
    item = [],
    describe = "使用弓箭，以箭射穿接近的单个敌人，给予敌人315%物理攻击的伤害，并降低6.1%物理攻击，持续3秒。",
    id = 629
    };
getRow(311009,9)->
    #player_skills_upgradingCfg {
    skillID = 311009,
    level = 9,
    player_level = 37,
    currency = [{1,45000}],
    skillcoin_cost = 1,
    item = [],
    describe = "使用弓箭，以箭射穿接近的单个敌人，给予敌人324%物理攻击的伤害，并降低6.4%物理攻击，持续3秒。",
    id = 630
    };
getRow(311009,10)->
    #player_skills_upgradingCfg {
    skillID = 311009,
    level = 10,
    player_level = 40,
    currency = [{1,50000}],
    skillcoin_cost = 1,
    item = [],
    describe = "使用弓箭，以箭射穿接近的单个敌人，给予敌人333%物理攻击的伤害，并降低6.7%物理攻击，持续3秒。",
    id = 631
    };
getRow(311009,11)->
    #player_skills_upgradingCfg {
    skillID = 311009,
    level = 11,
    player_level = 43,
    currency = [{1,55000}],
    skillcoin_cost = 1,
    item = [],
    describe = "使用弓箭，以箭射穿接近的单个敌人，给予敌人342%物理攻击的伤害，并降低7%物理攻击，持续3秒。",
    id = 632
    };
getRow(311009,12)->
    #player_skills_upgradingCfg {
    skillID = 311009,
    level = 12,
    player_level = 46,
    currency = [{1,60000}],
    skillcoin_cost = 1,
    item = [],
    describe = "使用弓箭，以箭射穿接近的单个敌人，给予敌人351%物理攻击的伤害，并降低7.3%物理攻击，持续3秒。",
    id = 633
    };
getRow(311009,13)->
    #player_skills_upgradingCfg {
    skillID = 311009,
    level = 13,
    player_level = 49,
    currency = [{1,65000}],
    skillcoin_cost = 1,
    item = [],
    describe = "使用弓箭，以箭射穿接近的单个敌人，给予敌人360%物理攻击的伤害，并降低7.6%物理攻击，持续3秒。",
    id = 634
    };
getRow(311009,14)->
    #player_skills_upgradingCfg {
    skillID = 311009,
    level = 14,
    player_level = 52,
    currency = [{1,70000}],
    skillcoin_cost = 1,
    item = [],
    describe = "使用弓箭，以箭射穿接近的单个敌人，给予敌人369%物理攻击的伤害，并降低7.9%物理攻击，持续3秒。",
    id = 635
    };
getRow(311009,15)->
    #player_skills_upgradingCfg {
    skillID = 311009,
    level = 15,
    player_level = 55,
    currency = [{1,75000}],
    skillcoin_cost = 1,
    item = [],
    describe = "使用弓箭，以箭射穿接近的单个敌人，给予敌人378%物理攻击的伤害，并降低8.2%物理攻击，持续3秒。",
    id = 636
    };
getRow(312000,1)->
    #player_skills_upgradingCfg {
    skillID = 312000,
    level = 1,
    player_level = 20,
    currency = [],
    skillcoin_cost = 0,
    item = [],
    describe = "流氓普攻1",
    id = 637
    };
getRow(312001,1)->
    #player_skills_upgradingCfg {
    skillID = 312001,
    level = 1,
    player_level = 20,
    currency = [],
    skillcoin_cost = 0,
    item = [],
    describe = "流氓普攻2",
    id = 638
    };
getRow(312002,1)->
    #player_skills_upgradingCfg {
    skillID = 312002,
    level = 1,
    player_level = 20,
    currency = [],
    skillcoin_cost = 0,
    item = [],
    describe = "流氓普攻3",
    id = 639
    };
getRow(312003,1)->
    #player_skills_upgradingCfg {
    skillID = 312003,
    level = 1,
    player_level = 20,
    currency = [],
    skillcoin_cost = 0,
    item = [],
    describe = "使用匕首，快速接近阻挡的敌人，造成162%物理攻击的伤害，并造成流血伤害，增加自身5%暴击等级，持续3秒。",
    id = 640
    };
getRow(312003,2)->
    #player_skills_upgradingCfg {
    skillID = 312003,
    level = 2,
    player_level = 20,
    currency = [{1,10000}],
    skillcoin_cost = 1,
    item = [],
    describe = "使用匕首，快速接近阻挡的敌人，造成169%物理攻击的伤害，并造成流血伤害，增加自身5.5%暴击等级，持续3秒。",
    id = 641
    };
getRow(312003,3)->
    #player_skills_upgradingCfg {
    skillID = 312003,
    level = 3,
    player_level = 20,
    currency = [{1,15000}],
    skillcoin_cost = 1,
    item = [],
    describe = "使用匕首，快速接近阻挡的敌人，造成177%物理攻击的伤害，并造成流血伤害，增加自身6%暴击等级，持续3秒。",
    id = 642
    };
getRow(312003,4)->
    #player_skills_upgradingCfg {
    skillID = 312003,
    level = 4,
    player_level = 22,
    currency = [{1,20000}],
    skillcoin_cost = 1,
    item = [],
    describe = "使用匕首，快速接近阻挡的敌人，造成185%物理攻击的伤害，并造成流血伤害，增加自身6.5%暴击等级，持续3秒。",
    id = 643
    };
getRow(312003,5)->
    #player_skills_upgradingCfg {
    skillID = 312003,
    level = 5,
    player_level = 25,
    currency = [{1,25000}],
    skillcoin_cost = 1,
    item = [],
    describe = "使用匕首，快速接近阻挡的敌人，造成193%物理攻击的伤害，并造成流血伤害，增加自身7%暴击等级，持续3秒。",
    id = 644
    };
getRow(312003,6)->
    #player_skills_upgradingCfg {
    skillID = 312003,
    level = 6,
    player_level = 28,
    currency = [{1,30000}],
    skillcoin_cost = 1,
    item = [],
    describe = "使用匕首，快速接近阻挡的敌人，造成201%物理攻击的伤害，并造成流血伤害，增加自身7.5%暴击等级，持续3秒。",
    id = 645
    };
getRow(312003,7)->
    #player_skills_upgradingCfg {
    skillID = 312003,
    level = 7,
    player_level = 31,
    currency = [{1,35000}],
    skillcoin_cost = 1,
    item = [],
    describe = "使用匕首，快速接近阻挡的敌人，造成208%物理攻击的伤害，并造成流血伤害，增加自身8%暴击等级，持续3秒。",
    id = 646
    };
getRow(312003,8)->
    #player_skills_upgradingCfg {
    skillID = 312003,
    level = 8,
    player_level = 34,
    currency = [{1,40000}],
    skillcoin_cost = 1,
    item = [],
    describe = "使用匕首，快速接近阻挡的敌人，造成216%物理攻击的伤害，并造成流血伤害，增加自身8.5%暴击等级，持续3秒。",
    id = 647
    };
getRow(312003,9)->
    #player_skills_upgradingCfg {
    skillID = 312003,
    level = 9,
    player_level = 37,
    currency = [{1,45000}],
    skillcoin_cost = 1,
    item = [],
    describe = "使用匕首，快速接近阻挡的敌人，造成224%物理攻击的伤害，并造成流血伤害，增加自身9%暴击等级，持续3秒。",
    id = 648
    };
getRow(312003,10)->
    #player_skills_upgradingCfg {
    skillID = 312003,
    level = 10,
    player_level = 40,
    currency = [{1,50000}],
    skillcoin_cost = 1,
    item = [],
    describe = "使用匕首，快速接近阻挡的敌人，造成232%物理攻击的伤害，并造成流血伤害，增加自身9.5%暴击等级，持续3秒。",
    id = 649
    };
getRow(312003,11)->
    #player_skills_upgradingCfg {
    skillID = 312003,
    level = 11,
    player_level = 43,
    currency = [{1,55000}],
    skillcoin_cost = 1,
    item = [],
    describe = "使用匕首，快速接近阻挡的敌人，造成240%物理攻击的伤害，并造成流血伤害，增加自身10%暴击等级，持续3秒。",
    id = 650
    };
getRow(312003,12)->
    #player_skills_upgradingCfg {
    skillID = 312003,
    level = 12,
    player_level = 46,
    currency = [{1,60000}],
    skillcoin_cost = 1,
    item = [],
    describe = "使用匕首，快速接近阻挡的敌人，造成247%物理攻击的伤害，并造成流血伤害，增加自身10.5%暴击等级，持续3秒。",
    id = 651
    };
getRow(312003,13)->
    #player_skills_upgradingCfg {
    skillID = 312003,
    level = 13,
    player_level = 49,
    currency = [{1,65000}],
    skillcoin_cost = 1,
    item = [],
    describe = "使用匕首，快速接近阻挡的敌人，造成255%物理攻击的伤害，并造成流血伤害，增加自身11%暴击等级，持续3秒。",
    id = 652
    };
getRow(312003,14)->
    #player_skills_upgradingCfg {
    skillID = 312003,
    level = 14,
    player_level = 52,
    currency = [{1,70000}],
    skillcoin_cost = 1,
    item = [],
    describe = "使用匕首，快速接近阻挡的敌人，造成263%物理攻击的伤害，并造成流血伤害，增加自身11.5%暴击等级，持续3秒。",
    id = 653
    };
getRow(312003,15)->
    #player_skills_upgradingCfg {
    skillID = 312003,
    level = 15,
    player_level = 55,
    currency = [{1,75000}],
    skillcoin_cost = 1,
    item = [],
    describe = "使用匕首，快速接近阻挡的敌人，造成271%物理攻击的伤害，并造成流血伤害，增加自身12%暴击等级，持续3秒。",
    id = 654
    };
getRow(312004,1)->
    #player_skills_upgradingCfg {
    skillID = 312004,
    level = 1,
    player_level = 20,
    currency = [],
    skillcoin_cost = 1,
    item = [],
    describe = "用可以刺穿心脏的力量，让敌人总计受到250%物理攻击的伤害，降低目标4%魔法攻击力，持续3秒。",
    id = 655
    };
getRow(312004,2)->
    #player_skills_upgradingCfg {
    skillID = 312004,
    level = 2,
    player_level = 20,
    currency = [{1,10000}],
    skillcoin_cost = 1,
    item = [],
    describe = "用可以刺穿心脏的力量，让敌人总计受到262%物理攻击的伤害，降低目标4.3%魔法攻击力，持续3秒。",
    id = 656
    };
getRow(312004,3)->
    #player_skills_upgradingCfg {
    skillID = 312004,
    level = 3,
    player_level = 20,
    currency = [{1,15000}],
    skillcoin_cost = 1,
    item = [],
    describe = "用可以刺穿心脏的力量，让敌人总计受到274%物理攻击的伤害，降低目标4.6%魔法攻击力，持续3秒。",
    id = 657
    };
getRow(312004,4)->
    #player_skills_upgradingCfg {
    skillID = 312004,
    level = 4,
    player_level = 22,
    currency = [{1,20000}],
    skillcoin_cost = 1,
    item = [],
    describe = "用可以刺穿心脏的力量，让敌人总计受到286%物理攻击的伤害，降低目标4.9%魔法攻击力，持续3秒。",
    id = 658
    };
getRow(312004,5)->
    #player_skills_upgradingCfg {
    skillID = 312004,
    level = 5,
    player_level = 25,
    currency = [{1,25000}],
    skillcoin_cost = 1,
    item = [],
    describe = "用可以刺穿心脏的力量，让敌人总计受到298%物理攻击的伤害，降低目标5.2%魔法攻击力，持续3秒。",
    id = 659
    };
getRow(312004,6)->
    #player_skills_upgradingCfg {
    skillID = 312004,
    level = 6,
    player_level = 28,
    currency = [{1,30000}],
    skillcoin_cost = 1,
    item = [],
    describe = "用可以刺穿心脏的力量，让敌人总计受到310%物理攻击的伤害，降低目标5.5%魔法攻击力，持续3秒。",
    id = 660
    };
getRow(312004,7)->
    #player_skills_upgradingCfg {
    skillID = 312004,
    level = 7,
    player_level = 31,
    currency = [{1,35000}],
    skillcoin_cost = 1,
    item = [],
    describe = "用可以刺穿心脏的力量，让敌人总计受到322%物理攻击的伤害，降低目标5.8%魔法攻击力，持续3秒。",
    id = 661
    };
getRow(312004,8)->
    #player_skills_upgradingCfg {
    skillID = 312004,
    level = 8,
    player_level = 34,
    currency = [{1,40000}],
    skillcoin_cost = 1,
    item = [],
    describe = "用可以刺穿心脏的力量，让敌人总计受到334%物理攻击的伤害，降低目标6.1%魔法攻击力，持续3秒。",
    id = 662
    };
getRow(312004,9)->
    #player_skills_upgradingCfg {
    skillID = 312004,
    level = 9,
    player_level = 37,
    currency = [{1,45000}],
    skillcoin_cost = 1,
    item = [],
    describe = "用可以刺穿心脏的力量，让敌人总计受到346%物理攻击的伤害，降低目标6.4%魔法攻击力，持续3秒。",
    id = 663
    };
getRow(312004,10)->
    #player_skills_upgradingCfg {
    skillID = 312004,
    level = 10,
    player_level = 40,
    currency = [{1,50000}],
    skillcoin_cost = 1,
    item = [],
    describe = "用可以刺穿心脏的力量，让敌人总计受到358%物理攻击的伤害，降低目标6.7%魔法攻击力，持续3秒。",
    id = 664
    };
getRow(312004,11)->
    #player_skills_upgradingCfg {
    skillID = 312004,
    level = 11,
    player_level = 43,
    currency = [{1,55000}],
    skillcoin_cost = 1,
    item = [],
    describe = "用可以刺穿心脏的力量，让敌人总计受到370%物理攻击的伤害，降低目标7%魔法攻击力，持续3秒。",
    id = 665
    };
getRow(312004,12)->
    #player_skills_upgradingCfg {
    skillID = 312004,
    level = 12,
    player_level = 46,
    currency = [{1,60000}],
    skillcoin_cost = 1,
    item = [],
    describe = "用可以刺穿心脏的力量，让敌人总计受到382%物理攻击的伤害，降低目标7.3%魔法攻击力，持续3秒。",
    id = 666
    };
getRow(312004,13)->
    #player_skills_upgradingCfg {
    skillID = 312004,
    level = 13,
    player_level = 49,
    currency = [{1,65000}],
    skillcoin_cost = 1,
    item = [],
    describe = "用可以刺穿心脏的力量，让敌人总计受到394%物理攻击的伤害，降低目标7.6%魔法攻击力，持续3秒。",
    id = 667
    };
getRow(312004,14)->
    #player_skills_upgradingCfg {
    skillID = 312004,
    level = 14,
    player_level = 52,
    currency = [{1,70000}],
    skillcoin_cost = 1,
    item = [],
    describe = "用可以刺穿心脏的力量，让敌人总计受到406%物理攻击的伤害，降低目标7.9%魔法攻击力，持续3秒。",
    id = 668
    };
getRow(312004,15)->
    #player_skills_upgradingCfg {
    skillID = 312004,
    level = 15,
    player_level = 55,
    currency = [{1,75000}],
    skillcoin_cost = 1,
    item = [],
    describe = "用可以刺穿心脏的力量，让敌人总计受到418%物理攻击的伤害，降低目标8.2%魔法攻击力，持续3秒。",
    id = 669
    };
getRow(312005,1)->
    #player_skills_upgradingCfg {
    skillID = 312005,
    level = 1,
    player_level = 20,
    currency = [],
    skillcoin_cost = 1,
    item = [],
    describe = "使用匕首，以强力突刺攻击敌人，进行2次攻击，每次造成125%物理攻击的伤害，降低敌人8%物理防御，持续4秒。",
    id = 670
    };
getRow(312005,2)->
    #player_skills_upgradingCfg {
    skillID = 312005,
    level = 2,
    player_level = 20,
    currency = [{1,10000}],
    skillcoin_cost = 1,
    item = [],
    describe = "使用匕首，以强力突刺攻击敌人，进行2次攻击，每次造成131%物理攻击的伤害，降低敌人8.6%物理防御，持续4秒。",
    id = 671
    };
getRow(312005,3)->
    #player_skills_upgradingCfg {
    skillID = 312005,
    level = 3,
    player_level = 20,
    currency = [{1,15000}],
    skillcoin_cost = 1,
    item = [],
    describe = "使用匕首，以强力突刺攻击敌人，进行2次攻击，每次造成137%物理攻击的伤害，降低敌人9.2%物理防御，持续4秒。",
    id = 672
    };
getRow(312005,4)->
    #player_skills_upgradingCfg {
    skillID = 312005,
    level = 4,
    player_level = 22,
    currency = [{1,20000}],
    skillcoin_cost = 1,
    item = [],
    describe = "使用匕首，以强力突刺攻击敌人，进行2次攻击，每次造成143%物理攻击的伤害，降低敌人9.8%物理防御，持续4秒。",
    id = 673
    };
getRow(312005,5)->
    #player_skills_upgradingCfg {
    skillID = 312005,
    level = 5,
    player_level = 25,
    currency = [{1,25000}],
    skillcoin_cost = 1,
    item = [],
    describe = "使用匕首，以强力突刺攻击敌人，进行2次攻击，每次造成149%物理攻击的伤害，降低敌人10.4%物理防御，持续4秒。",
    id = 674
    };
getRow(312005,6)->
    #player_skills_upgradingCfg {
    skillID = 312005,
    level = 6,
    player_level = 28,
    currency = [{1,30000}],
    skillcoin_cost = 1,
    item = [],
    describe = "使用匕首，以强力突刺攻击敌人，进行2次攻击，每次造成155%物理攻击的伤害，降低敌人11%物理防御，持续4秒。",
    id = 675
    };
getRow(312005,7)->
    #player_skills_upgradingCfg {
    skillID = 312005,
    level = 7,
    player_level = 31,
    currency = [{1,35000}],
    skillcoin_cost = 1,
    item = [],
    describe = "使用匕首，以强力突刺攻击敌人，进行2次攻击，每次造成161%物理攻击的伤害，降低敌人11.6%物理防御，持续4秒。",
    id = 676
    };
getRow(312005,8)->
    #player_skills_upgradingCfg {
    skillID = 312005,
    level = 8,
    player_level = 34,
    currency = [{1,40000}],
    skillcoin_cost = 1,
    item = [],
    describe = "使用匕首，以强力突刺攻击敌人，进行2次攻击，每次造成167%物理攻击的伤害，降低敌人12.2%物理防御，持续4秒。",
    id = 677
    };
getRow(312005,9)->
    #player_skills_upgradingCfg {
    skillID = 312005,
    level = 9,
    player_level = 37,
    currency = [{1,45000}],
    skillcoin_cost = 1,
    item = [],
    describe = "使用匕首，以强力突刺攻击敌人，进行2次攻击，每次造成173%物理攻击的伤害，降低敌人12.8%物理防御，持续4秒。",
    id = 678
    };
getRow(312005,10)->
    #player_skills_upgradingCfg {
    skillID = 312005,
    level = 10,
    player_level = 40,
    currency = [{1,50000}],
    skillcoin_cost = 1,
    item = [],
    describe = "使用匕首，以强力突刺攻击敌人，进行2次攻击，每次造成179%物理攻击的伤害，降低敌人13.4%物理防御，持续4秒。",
    id = 679
    };
getRow(312005,11)->
    #player_skills_upgradingCfg {
    skillID = 312005,
    level = 11,
    player_level = 43,
    currency = [{1,55000}],
    skillcoin_cost = 1,
    item = [],
    describe = "使用匕首，以强力突刺攻击敌人，进行2次攻击，每次造成185%物理攻击的伤害，降低敌人14%物理防御，持续4秒。",
    id = 680
    };
getRow(312005,12)->
    #player_skills_upgradingCfg {
    skillID = 312005,
    level = 12,
    player_level = 46,
    currency = [{1,60000}],
    skillcoin_cost = 1,
    item = [],
    describe = "使用匕首，以强力突刺攻击敌人，进行2次攻击，每次造成191%物理攻击的伤害，降低敌人14.6%物理防御，持续4秒。",
    id = 681
    };
getRow(312005,13)->
    #player_skills_upgradingCfg {
    skillID = 312005,
    level = 13,
    player_level = 49,
    currency = [{1,65000}],
    skillcoin_cost = 1,
    item = [],
    describe = "使用匕首，以强力突刺攻击敌人，进行2次攻击，每次造成197%物理攻击的伤害，降低敌人15.2%物理防御，持续4秒。",
    id = 682
    };
getRow(312005,14)->
    #player_skills_upgradingCfg {
    skillID = 312005,
    level = 14,
    player_level = 52,
    currency = [{1,70000}],
    skillcoin_cost = 1,
    item = [],
    describe = "使用匕首，以强力突刺攻击敌人，进行2次攻击，每次造成203%物理攻击的伤害，降低敌人15.8%物理防御，持续4秒。",
    id = 683
    };
getRow(312005,15)->
    #player_skills_upgradingCfg {
    skillID = 312005,
    level = 15,
    player_level = 55,
    currency = [{1,75000}],
    skillcoin_cost = 1,
    item = [],
    describe = "使用匕首，以强力突刺攻击敌人，进行2次攻击，每次造成209%物理攻击的伤害，降低敌人16.4%物理防御，持续4秒。",
    id = 684
    };
getRow(312006,1)->
    #player_skills_upgradingCfg {
    skillID = 312006,
    level = 1,
    player_level = 20,
    currency = [],
    skillcoin_cost = 1,
    item = [],
    describe = "使用匕首，用能将风刺穿的力量对15米范围内所有敌人进行5次攻击，每次造成70%物理攻击的伤害，并造成减速。",
    id = 685
    };
getRow(312006,2)->
    #player_skills_upgradingCfg {
    skillID = 312006,
    level = 2,
    player_level = 20,
    currency = [{1,10000}],
    skillcoin_cost = 1,
    item = [],
    describe = "使用匕首，用能将风刺穿的力量对15米范围内所有敌人进行5次攻击，每次造成74%物理攻击的伤害，并造成减速。",
    id = 686
    };
getRow(312006,3)->
    #player_skills_upgradingCfg {
    skillID = 312006,
    level = 3,
    player_level = 20,
    currency = [{1,15000}],
    skillcoin_cost = 1,
    item = [],
    describe = "使用匕首，用能将风刺穿的力量对15米范围内所有敌人进行5次攻击，每次造成78%物理攻击的伤害，并造成减速。",
    id = 687
    };
getRow(312006,4)->
    #player_skills_upgradingCfg {
    skillID = 312006,
    level = 4,
    player_level = 22,
    currency = [{1,20000}],
    skillcoin_cost = 1,
    item = [],
    describe = "使用匕首，用能将风刺穿的力量对15米范围内所有敌人进行5次攻击，每次造成82%物理攻击的伤害，并造成减速。",
    id = 688
    };
getRow(312006,5)->
    #player_skills_upgradingCfg {
    skillID = 312006,
    level = 5,
    player_level = 25,
    currency = [{1,25000}],
    skillcoin_cost = 1,
    item = [],
    describe = "使用匕首，用能将风刺穿的力量对15米范围内所有敌人进行5次攻击，每次造成86%物理攻击的伤害，并造成减速。",
    id = 689
    };
getRow(312006,6)->
    #player_skills_upgradingCfg {
    skillID = 312006,
    level = 6,
    player_level = 28,
    currency = [{1,30000}],
    skillcoin_cost = 1,
    item = [],
    describe = "使用匕首，用能将风刺穿的力量对15米范围内所有敌人进行5次攻击，每次造成90%物理攻击的伤害，并造成减速。",
    id = 690
    };
getRow(312006,7)->
    #player_skills_upgradingCfg {
    skillID = 312006,
    level = 7,
    player_level = 31,
    currency = [{1,35000}],
    skillcoin_cost = 1,
    item = [],
    describe = "使用匕首，用能将风刺穿的力量对15米范围内所有敌人进行5次攻击，每次造成94%物理攻击的伤害，并造成减速。",
    id = 691
    };
getRow(312006,8)->
    #player_skills_upgradingCfg {
    skillID = 312006,
    level = 8,
    player_level = 34,
    currency = [{1,40000}],
    skillcoin_cost = 1,
    item = [],
    describe = "使用匕首，用能将风刺穿的力量对15米范围内所有敌人进行5次攻击，每次造成98%物理攻击的伤害，并造成减速。",
    id = 692
    };
getRow(312006,9)->
    #player_skills_upgradingCfg {
    skillID = 312006,
    level = 9,
    player_level = 37,
    currency = [{1,45000}],
    skillcoin_cost = 1,
    item = [],
    describe = "使用匕首，用能将风刺穿的力量对15米范围内所有敌人进行5次攻击，每次造成102%物理攻击的伤害，并造成减速。",
    id = 693
    };
getRow(312006,10)->
    #player_skills_upgradingCfg {
    skillID = 312006,
    level = 10,
    player_level = 40,
    currency = [{1,50000}],
    skillcoin_cost = 1,
    item = [],
    describe = "使用匕首，用能将风刺穿的力量对15米范围内所有敌人进行5次攻击，每次造成106%物理攻击的伤害，并造成减速。",
    id = 694
    };
getRow(312006,11)->
    #player_skills_upgradingCfg {
    skillID = 312006,
    level = 11,
    player_level = 43,
    currency = [{1,55000}],
    skillcoin_cost = 1,
    item = [],
    describe = "使用匕首，用能将风刺穿的力量对15米范围内所有敌人进行5次攻击，每次造成110%物理攻击的伤害，并造成减速。",
    id = 695
    };
getRow(312006,12)->
    #player_skills_upgradingCfg {
    skillID = 312006,
    level = 12,
    player_level = 46,
    currency = [{1,60000}],
    skillcoin_cost = 1,
    item = [],
    describe = "使用匕首，用能将风刺穿的力量对15米范围内所有敌人进行5次攻击，每次造成114%物理攻击的伤害，并造成减速。",
    id = 696
    };
getRow(312006,13)->
    #player_skills_upgradingCfg {
    skillID = 312006,
    level = 13,
    player_level = 49,
    currency = [{1,65000}],
    skillcoin_cost = 1,
    item = [],
    describe = "使用匕首，用能将风刺穿的力量对15米范围内所有敌人进行5次攻击，每次造成118%物理攻击的伤害，并造成减速。",
    id = 697
    };
getRow(312006,14)->
    #player_skills_upgradingCfg {
    skillID = 312006,
    level = 14,
    player_level = 52,
    currency = [{1,70000}],
    skillcoin_cost = 1,
    item = [],
    describe = "使用匕首，用能将风刺穿的力量对15米范围内所有敌人进行5次攻击，每次造成122%物理攻击的伤害，并造成减速。",
    id = 698
    };
getRow(312006,15)->
    #player_skills_upgradingCfg {
    skillID = 312006,
    level = 15,
    player_level = 55,
    currency = [{1,75000}],
    skillcoin_cost = 1,
    item = [],
    describe = "使用匕首，用能将风刺穿的力量对15米范围内所有敌人进行5次攻击，每次造成126%物理攻击的伤害，并造成减速。",
    id = 699
    };
getRow(312007,1)->
    #player_skills_upgradingCfg {
    skillID = 312007,
    level = 1,
    player_level = 20,
    currency = [],
    skillcoin_cost = 1,
    item = [],
    describe = "提升自身20%的闪避等级，20%命中等级，持续10秒",
    id = 700
    };
getRow(312007,2)->
    #player_skills_upgradingCfg {
    skillID = 312007,
    level = 2,
    player_level = 20,
    currency = [{1,10000}],
    skillcoin_cost = 1,
    item = [],
    describe = "提升自身22%的闪避等级，22%命中等级，持续10秒",
    id = 701
    };
getRow(312007,3)->
    #player_skills_upgradingCfg {
    skillID = 312007,
    level = 3,
    player_level = 20,
    currency = [{1,15000}],
    skillcoin_cost = 1,
    item = [],
    describe = "提升自身24%的闪避等级，24%命中等级，持续10秒",
    id = 702
    };
getRow(312007,4)->
    #player_skills_upgradingCfg {
    skillID = 312007,
    level = 4,
    player_level = 22,
    currency = [{1,20000}],
    skillcoin_cost = 1,
    item = [],
    describe = "提升自身26%的闪避等级，26%命中等级，持续10秒",
    id = 703
    };
getRow(312007,5)->
    #player_skills_upgradingCfg {
    skillID = 312007,
    level = 5,
    player_level = 25,
    currency = [{1,25000}],
    skillcoin_cost = 1,
    item = [],
    describe = "提升自身28%的闪避等级，28%命中等级，持续10秒",
    id = 704
    };
getRow(312007,6)->
    #player_skills_upgradingCfg {
    skillID = 312007,
    level = 6,
    player_level = 28,
    currency = [{1,30000}],
    skillcoin_cost = 1,
    item = [],
    describe = "提升自身30%的闪避等级，30%命中等级，持续10秒",
    id = 700
    };
getRow(312007,7)->
    #player_skills_upgradingCfg {
    skillID = 312007,
    level = 7,
    player_level = 31,
    currency = [{1,35000}],
    skillcoin_cost = 1,
    item = [],
    describe = "提升自身32%的闪避等级，32%命中等级，持续10秒",
    id = 701
    };
getRow(312007,8)->
    #player_skills_upgradingCfg {
    skillID = 312007,
    level = 8,
    player_level = 34,
    currency = [{1,40000}],
    skillcoin_cost = 1,
    item = [],
    describe = "提升自身34%的闪避等级，34%命中等级，持续10秒",
    id = 702
    };
getRow(312007,9)->
    #player_skills_upgradingCfg {
    skillID = 312007,
    level = 9,
    player_level = 37,
    currency = [{1,45000}],
    skillcoin_cost = 1,
    item = [],
    describe = "提升自身36%的闪避等级，36%命中等级，持续10秒",
    id = 703
    };
getRow(312007,10)->
    #player_skills_upgradingCfg {
    skillID = 312007,
    level = 10,
    player_level = 40,
    currency = [{1,50000}],
    skillcoin_cost = 1,
    item = [],
    describe = "提升自身38%的闪避等级，38%命中等级，持续10秒",
    id = 704
    };
getRow(312007,11)->
    #player_skills_upgradingCfg {
    skillID = 312007,
    level = 11,
    player_level = 43,
    currency = [{1,55000}],
    skillcoin_cost = 1,
    item = [],
    describe = "提升自身40%的闪避等级，40%命中等级，持续10秒",
    id = 705
    };
getRow(312008,1)->
    #player_skills_upgradingCfg {
    skillID = 312008,
    level = 1,
    player_level = 20,
    currency = [],
    skillcoin_cost = 1,
    item = [],
    describe = "提升自身20%暴击等级，持续10秒。",
    id = 715
    };
getRow(312008,2)->
    #player_skills_upgradingCfg {
    skillID = 312008,
    level = 2,
    player_level = 20,
    currency = [{1,10000}],
    skillcoin_cost = 1,
    item = [],
    describe = "提升自身23%暴击等级，持续10秒。",
    id = 716
    };
getRow(312008,3)->
    #player_skills_upgradingCfg {
    skillID = 312008,
    level = 3,
    player_level = 20,
    currency = [{1,15000}],
    skillcoin_cost = 1,
    item = [],
    describe = "提升自身26%暴击等级，持续10秒。",
    id = 717
    };
getRow(312008,4)->
    #player_skills_upgradingCfg {
    skillID = 312008,
    level = 4,
    player_level = 22,
    currency = [{1,20000}],
    skillcoin_cost = 1,
    item = [],
    describe = "提升自身29%暴击等级，持续10秒。",
    id = 718
    };
getRow(312008,5)->
    #player_skills_upgradingCfg {
    skillID = 312008,
    level = 5,
    player_level = 25,
    currency = [{1,25000}],
    skillcoin_cost = 1,
    item = [],
    describe = "提升自身32%暴击等级，持续10秒。",
    id = 719
    };
getRow(312008,6)->
    #player_skills_upgradingCfg {
    skillID = 312008,
    level = 6,
    player_level = 28,
    currency = [{1,30000}],
    skillcoin_cost = 1,
    item = [],
    describe = "提升自身35%暴击等级，持续10秒。",
    id = 715
    };
getRow(312008,7)->
    #player_skills_upgradingCfg {
    skillID = 312008,
    level = 7,
    player_level = 31,
    currency = [{1,35000}],
    skillcoin_cost = 1,
    item = [],
    describe = "提升自身38%暴击等级，持续10秒。",
    id = 716
    };
getRow(312008,8)->
    #player_skills_upgradingCfg {
    skillID = 312008,
    level = 8,
    player_level = 34,
    currency = [{1,40000}],
    skillcoin_cost = 1,
    item = [],
    describe = "提升自身41%暴击等级，持续10秒。",
    id = 717
    };
getRow(312008,9)->
    #player_skills_upgradingCfg {
    skillID = 312008,
    level = 9,
    player_level = 37,
    currency = [{1,45000}],
    skillcoin_cost = 1,
    item = [],
    describe = "提升自身44%暴击等级，持续10秒。",
    id = 718
    };
getRow(312008,10)->
    #player_skills_upgradingCfg {
    skillID = 312008,
    level = 10,
    player_level = 40,
    currency = [{1,50000}],
    skillcoin_cost = 1,
    item = [],
    describe = "提升自身47%暴击等级，持续10秒。",
    id = 719
    };
getRow(312008,11)->
    #player_skills_upgradingCfg {
    skillID = 312008,
    level = 11,
    player_level = 43,
    currency = [{1,55000}],
    skillcoin_cost = 1,
    item = [],
    describe = "提升自身50%暴击等级，持续10秒。",
    id = 720
    };
getRow(312021,1)->
    #player_skills_upgradingCfg {
    skillID = 312021,
    level = 1,
    player_level = 20,
    currency = [],
    skillcoin_cost = 1,
    item = [],
    describe = "化实为虚，分裂出3个分身向单个目标进行攻击，每次造成140%物理攻击的伤害。",
    id = 730
    };
getRow(312021,2)->
    #player_skills_upgradingCfg {
    skillID = 312021,
    level = 2,
    player_level = 20,
    currency = [{1,10000}],
    skillcoin_cost = 1,
    item = [],
    describe = "化实为虚，分裂出3个分身向单个目标进行攻击，每次造成145%物理攻击的伤害。",
    id = 731
    };
getRow(312021,3)->
    #player_skills_upgradingCfg {
    skillID = 312021,
    level = 3,
    player_level = 20,
    currency = [{1,15000}],
    skillcoin_cost = 1,
    item = [],
    describe = "化实为虚，分裂出3个分身向单个目标进行攻击，每次造成150%物理攻击的伤害。",
    id = 732
    };
getRow(312021,4)->
    #player_skills_upgradingCfg {
    skillID = 312021,
    level = 4,
    player_level = 22,
    currency = [{1,20000}],
    skillcoin_cost = 1,
    item = [],
    describe = "化实为虚，分裂出3个分身向单个目标进行攻击，每次造成155%物理攻击的伤害。",
    id = 733
    };
getRow(312021,5)->
    #player_skills_upgradingCfg {
    skillID = 312021,
    level = 5,
    player_level = 25,
    currency = [{1,25000}],
    skillcoin_cost = 1,
    item = [],
    describe = "化实为虚，分裂出3个分身向单个目标进行攻击，每次造成160%物理攻击的伤害。",
    id = 734
    };
getRow(312021,6)->
    #player_skills_upgradingCfg {
    skillID = 312021,
    level = 6,
    player_level = 28,
    currency = [{1,30000}],
    skillcoin_cost = 1,
    item = [],
    describe = "化实为虚，分裂出3个分身向单个目标进行攻击，每次造成165%物理攻击的伤害。",
    id = 735
    };
getRow(312021,7)->
    #player_skills_upgradingCfg {
    skillID = 312021,
    level = 7,
    player_level = 31,
    currency = [{1,35000}],
    skillcoin_cost = 1,
    item = [],
    describe = "化实为虚，分裂出3个分身向单个目标进行攻击，每次造成170%物理攻击的伤害。",
    id = 736
    };
getRow(312021,8)->
    #player_skills_upgradingCfg {
    skillID = 312021,
    level = 8,
    player_level = 34,
    currency = [{1,40000}],
    skillcoin_cost = 1,
    item = [],
    describe = "化实为虚，分裂出3个分身向单个目标进行攻击，每次造成175%物理攻击的伤害。",
    id = 737
    };
getRow(312021,9)->
    #player_skills_upgradingCfg {
    skillID = 312021,
    level = 9,
    player_level = 37,
    currency = [{1,45000}],
    skillcoin_cost = 1,
    item = [],
    describe = "化实为虚，分裂出3个分身向单个目标进行攻击，每次造成180%物理攻击的伤害。",
    id = 738
    };
getRow(312021,10)->
    #player_skills_upgradingCfg {
    skillID = 312021,
    level = 10,
    player_level = 40,
    currency = [{1,50000}],
    skillcoin_cost = 1,
    item = [],
    describe = "化实为虚，分裂出3个分身向单个目标进行攻击，每次造成185%物理攻击的伤害。",
    id = 739
    };
getRow(312021,11)->
    #player_skills_upgradingCfg {
    skillID = 312021,
    level = 11,
    player_level = 43,
    currency = [{1,55000}],
    skillcoin_cost = 1,
    item = [],
    describe = "化实为虚，分裂出3个分身向单个目标进行攻击，每次造成190%物理攻击的伤害。",
    id = 740
    };
getRow(312021,12)->
    #player_skills_upgradingCfg {
    skillID = 312021,
    level = 12,
    player_level = 46,
    currency = [{1,60000}],
    skillcoin_cost = 1,
    item = [],
    describe = "化实为虚，分裂出3个分身向单个目标进行攻击，每次造成195%物理攻击的伤害。",
    id = 741
    };
getRow(312021,13)->
    #player_skills_upgradingCfg {
    skillID = 312021,
    level = 13,
    player_level = 49,
    currency = [{1,65000}],
    skillcoin_cost = 1,
    item = [],
    describe = "化实为虚，分裂出3个分身向单个目标进行攻击，每次造成200%物理攻击的伤害。",
    id = 742
    };
getRow(312021,14)->
    #player_skills_upgradingCfg {
    skillID = 312021,
    level = 14,
    player_level = 52,
    currency = [{1,70000}],
    skillcoin_cost = 1,
    item = [],
    describe = "化实为虚，分裂出3个分身向单个目标进行攻击，每次造成205%物理攻击的伤害。",
    id = 743
    };
getRow(312021,15)->
    #player_skills_upgradingCfg {
    skillID = 312021,
    level = 15,
    player_level = 55,
    currency = [{1,75000}],
    skillcoin_cost = 1,
    item = [],
    describe = "化实为虚，分裂出3个分身向单个目标进行攻击，每次造成210%物理攻击的伤害。",
    id = 744
    };
getRow(321003,1)->
    #player_skills_upgradingCfg {
    skillID = 321003,
    level = 1,
    player_level = 60,
    currency = [],
    skillcoin_cost = 1,
    item = [],
    describe = "射出一只造成267%物理攻击的箭矢，该箭矢必定暴击",
    id = 0
    };
getRow(321003,2)->
    #player_skills_upgradingCfg {
    skillID = 321003,
    level = 2,
    player_level = 60,
    currency = [{1,50000}],
    skillcoin_cost = 1,
    item = [],
    describe = "射出一只造成280%物理攻击的箭矢，该箭矢必定暴击",
    id = 0
    };
getRow(321003,3)->
    #player_skills_upgradingCfg {
    skillID = 321003,
    level = 3,
    player_level = 60,
    currency = [{1,70000}],
    skillcoin_cost = 1,
    item = [],
    describe = "射出一只造成293%物理攻击的箭矢，该箭矢必定暴击",
    id = 0
    };
getRow(321003,4)->
    #player_skills_upgradingCfg {
    skillID = 321003,
    level = 4,
    player_level = 60,
    currency = [{1,90000}],
    skillcoin_cost = 1,
    item = [],
    describe = "射出一只造成307%物理攻击的箭矢，该箭矢必定暴击",
    id = 0
    };
getRow(321003,5)->
    #player_skills_upgradingCfg {
    skillID = 321003,
    level = 5,
    player_level = 60,
    currency = [{1,110000}],
    skillcoin_cost = 1,
    item = [],
    describe = "射出一只造成320%物理攻击的箭矢，该箭矢必定暴击",
    id = 0
    };
getRow(321003,6)->
    #player_skills_upgradingCfg {
    skillID = 321003,
    level = 6,
    player_level = 60,
    currency = [{1,130000}],
    skillcoin_cost = 1,
    item = [],
    describe = "射出一只造成333%物理攻击的箭矢，该箭矢必定暴击",
    id = 0
    };
getRow(321003,7)->
    #player_skills_upgradingCfg {
    skillID = 321003,
    level = 7,
    player_level = 60,
    currency = [{1,150000}],
    skillcoin_cost = 1,
    item = [],
    describe = "射出一只造成347%物理攻击的箭矢，该箭矢必定暴击",
    id = 0
    };
getRow(321003,8)->
    #player_skills_upgradingCfg {
    skillID = 321003,
    level = 8,
    player_level = 60,
    currency = [{1,170000}],
    skillcoin_cost = 1,
    item = [],
    describe = "射出一只造成360%物理攻击的箭矢，该箭矢必定暴击",
    id = 0
    };
getRow(321003,9)->
    #player_skills_upgradingCfg {
    skillID = 321003,
    level = 9,
    player_level = 62,
    currency = [{1,190000}],
    skillcoin_cost = 1,
    item = [],
    describe = "射出一只造成373%物理攻击的箭矢，该箭矢必定暴击",
    id = 0
    };
getRow(321003,10)->
    #player_skills_upgradingCfg {
    skillID = 321003,
    level = 10,
    player_level = 64,
    currency = [{1,210000}],
    skillcoin_cost = 1,
    item = [],
    describe = "射出一只造成387%物理攻击的箭矢，该箭矢必定暴击",
    id = 0
    };
getRow(321003,11)->
    #player_skills_upgradingCfg {
    skillID = 321003,
    level = 11,
    player_level = 66,
    currency = [{1,230000}],
    skillcoin_cost = 1,
    item = [],
    describe = "射出一只造成400%物理攻击的箭矢，该箭矢必定暴击",
    id = 0
    };
getRow(321003,12)->
    #player_skills_upgradingCfg {
    skillID = 321003,
    level = 12,
    player_level = 68,
    currency = [{1,250000}],
    skillcoin_cost = 1,
    item = [],
    describe = "射出一只造成413%物理攻击的箭矢，该箭矢必定暴击",
    id = 0
    };
getRow(321003,13)->
    #player_skills_upgradingCfg {
    skillID = 321003,
    level = 13,
    player_level = 70,
    currency = [{1,270000}],
    skillcoin_cost = 1,
    item = [],
    describe = "射出一只造成427%物理攻击的箭矢，该箭矢必定暴击",
    id = 0
    };
getRow(321003,14)->
    #player_skills_upgradingCfg {
    skillID = 321003,
    level = 14,
    player_level = 72,
    currency = [{1,290000}],
    skillcoin_cost = 1,
    item = [],
    describe = "射出一只造成440%物理攻击的箭矢，该箭矢必定暴击",
    id = 0
    };
getRow(321003,15)->
    #player_skills_upgradingCfg {
    skillID = 321003,
    level = 15,
    player_level = 74,
    currency = [{1,310000}],
    skillcoin_cost = 1,
    item = [],
    describe = "射出一只造成453%物理攻击的箭矢，该箭矢必定暴击",
    id = 0
    };
getRow(321003,16)->
    #player_skills_upgradingCfg {
    skillID = 321003,
    level = 16,
    player_level = 76,
    currency = [{1,330000}],
    skillcoin_cost = 1,
    item = [],
    describe = "射出一只造成467%物理攻击的箭矢，该箭矢必定暴击",
    id = 0
    };
getRow(321003,17)->
    #player_skills_upgradingCfg {
    skillID = 321003,
    level = 17,
    player_level = 78,
    currency = [{1,350000}],
    skillcoin_cost = 1,
    item = [],
    describe = "射出一只造成480%物理攻击的箭矢，该箭矢必定暴击",
    id = 0
    };
getRow(321003,18)->
    #player_skills_upgradingCfg {
    skillID = 321003,
    level = 18,
    player_level = 80,
    currency = [{1,370000}],
    skillcoin_cost = 1,
    item = [],
    describe = "射出一只造成493%物理攻击的箭矢，该箭矢必定暴击",
    id = 0
    };
getRow(321003,19)->
    #player_skills_upgradingCfg {
    skillID = 321003,
    level = 19,
    player_level = 82,
    currency = [{1,390000}],
    skillcoin_cost = 1,
    item = [],
    describe = "射出一只造成507%物理攻击的箭矢，该箭矢必定暴击",
    id = 0
    };
getRow(321003,20)->
    #player_skills_upgradingCfg {
    skillID = 321003,
    level = 20,
    player_level = 84,
    currency = [{1,410000}],
    skillcoin_cost = 1,
    item = [],
    describe = "射出一只造成520%物理攻击的箭矢，该箭矢必定暴击",
    id = 0
    };
getRow(321003,21)->
    #player_skills_upgradingCfg {
    skillID = 321003,
    level = 21,
    player_level = 86,
    currency = [{1,430000}],
    skillcoin_cost = 1,
    item = [],
    describe = "射出一只造成533%物理攻击的箭矢，该箭矢必定暴击",
    id = 0
    };
getRow(321003,22)->
    #player_skills_upgradingCfg {
    skillID = 321003,
    level = 22,
    player_level = 88,
    currency = [{1,450000}],
    skillcoin_cost = 1,
    item = [],
    describe = "射出一只造成547%物理攻击的箭矢，该箭矢必定暴击",
    id = 0
    };
getRow(321003,23)->
    #player_skills_upgradingCfg {
    skillID = 321003,
    level = 23,
    player_level = 90,
    currency = [{1,470000}],
    skillcoin_cost = 1,
    item = [],
    describe = "射出一只造成560%物理攻击的箭矢，该箭矢必定暴击",
    id = 0
    };
getRow(321003,24)->
    #player_skills_upgradingCfg {
    skillID = 321003,
    level = 24,
    player_level = 92,
    currency = [{1,490000}],
    skillcoin_cost = 1,
    item = [],
    describe = "射出一只造成573%物理攻击的箭矢，该箭矢必定暴击",
    id = 0
    };
getRow(321003,25)->
    #player_skills_upgradingCfg {
    skillID = 321003,
    level = 25,
    player_level = 94,
    currency = [{1,510000}],
    skillcoin_cost = 1,
    item = [],
    describe = "射出一只造成587%物理攻击的箭矢，该箭矢必定暴击",
    id = 0
    };
getRow(321004,1)->
    #player_skills_upgradingCfg {
    skillID = 321004,
    level = 1,
    player_level = 60,
    currency = [],
    skillcoin_cost = 1,
    item = [],
    describe = "对敌方单体造成343%物理攻击的箭矢，并造成流血，降低物理攻击力5%，持续时间3秒",
    id = 0
    };
getRow(321004,2)->
    #player_skills_upgradingCfg {
    skillID = 321004,
    level = 2,
    player_level = 60,
    currency = [{1,50000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对敌方单体造成355%物理攻击的箭矢，并造成流血，降低物理攻击力5.3%，持续时间3秒",
    id = 0
    };
getRow(321004,3)->
    #player_skills_upgradingCfg {
    skillID = 321004,
    level = 3,
    player_level = 60,
    currency = [{1,70000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对敌方单体造成368%物理攻击的箭矢，并造成流血，降低物理攻击力5.6%，持续时间3秒",
    id = 0
    };
getRow(321004,4)->
    #player_skills_upgradingCfg {
    skillID = 321004,
    level = 4,
    player_level = 60,
    currency = [{1,90000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对敌方单体造成381%物理攻击的箭矢，并造成流血，降低物理攻击力5.9%，持续时间3秒",
    id = 0
    };
getRow(321004,5)->
    #player_skills_upgradingCfg {
    skillID = 321004,
    level = 5,
    player_level = 60,
    currency = [{1,110000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对敌方单体造成394%物理攻击的箭矢，并造成流血，降低物理攻击力6.2%，持续时间3秒",
    id = 0
    };
getRow(321004,6)->
    #player_skills_upgradingCfg {
    skillID = 321004,
    level = 6,
    player_level = 60,
    currency = [{1,130000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对敌方单体造成407%物理攻击的箭矢，并造成流血，降低物理攻击力6.5%，持续时间3秒",
    id = 0
    };
getRow(321004,7)->
    #player_skills_upgradingCfg {
    skillID = 321004,
    level = 7,
    player_level = 60,
    currency = [{1,150000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对敌方单体造成420%物理攻击的箭矢，并造成流血，降低物理攻击力6.8%，持续时间3秒",
    id = 0
    };
getRow(321004,8)->
    #player_skills_upgradingCfg {
    skillID = 321004,
    level = 8,
    player_level = 60,
    currency = [{1,170000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对敌方单体造成433%物理攻击的箭矢，并造成流血，降低物理攻击力7.1%，持续时间3秒",
    id = 0
    };
getRow(321004,9)->
    #player_skills_upgradingCfg {
    skillID = 321004,
    level = 9,
    player_level = 62,
    currency = [{1,190000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对敌方单体造成446%物理攻击的箭矢，并造成流血，降低物理攻击力7.4%，持续时间3秒",
    id = 0
    };
getRow(321004,10)->
    #player_skills_upgradingCfg {
    skillID = 321004,
    level = 10,
    player_level = 64,
    currency = [{1,210000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对敌方单体造成459%物理攻击的箭矢，并造成流血，降低物理攻击力7.7%，持续时间3秒",
    id = 0
    };
getRow(321004,11)->
    #player_skills_upgradingCfg {
    skillID = 321004,
    level = 11,
    player_level = 66,
    currency = [{1,230000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对敌方单体造成472%物理攻击的箭矢，并造成流血，降低物理攻击力8%，持续时间3秒",
    id = 0
    };
getRow(321004,12)->
    #player_skills_upgradingCfg {
    skillID = 321004,
    level = 12,
    player_level = 68,
    currency = [{1,250000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对敌方单体造成485%物理攻击的箭矢，并造成流血，降低物理攻击力8.3%，持续时间3秒",
    id = 0
    };
getRow(321004,13)->
    #player_skills_upgradingCfg {
    skillID = 321004,
    level = 13,
    player_level = 70,
    currency = [{1,270000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对敌方单体造成498%物理攻击的箭矢，并造成流血，降低物理攻击力8.6%，持续时间3秒",
    id = 0
    };
getRow(321004,14)->
    #player_skills_upgradingCfg {
    skillID = 321004,
    level = 14,
    player_level = 72,
    currency = [{1,290000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对敌方单体造成511%物理攻击的箭矢，并造成流血，降低物理攻击力8.9%，持续时间3秒",
    id = 0
    };
getRow(321004,15)->
    #player_skills_upgradingCfg {
    skillID = 321004,
    level = 15,
    player_level = 74,
    currency = [{1,310000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对敌方单体造成524%物理攻击的箭矢，并造成流血，降低物理攻击力9.2%，持续时间3秒",
    id = 0
    };
getRow(321004,16)->
    #player_skills_upgradingCfg {
    skillID = 321004,
    level = 16,
    player_level = 76,
    currency = [{1,330000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对敌方单体造成537%物理攻击的箭矢，并造成流血，降低物理攻击力9.5%，持续时间3秒",
    id = 0
    };
getRow(321004,17)->
    #player_skills_upgradingCfg {
    skillID = 321004,
    level = 17,
    player_level = 78,
    currency = [{1,350000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对敌方单体造成550%物理攻击的箭矢，并造成流血，降低物理攻击力9.8%，持续时间3秒",
    id = 0
    };
getRow(321004,18)->
    #player_skills_upgradingCfg {
    skillID = 321004,
    level = 18,
    player_level = 80,
    currency = [{1,370000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对敌方单体造成563%物理攻击的箭矢，并造成流血，降低物理攻击力10.1%，持续时间3秒",
    id = 0
    };
getRow(321004,19)->
    #player_skills_upgradingCfg {
    skillID = 321004,
    level = 19,
    player_level = 82,
    currency = [{1,390000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对敌方单体造成576%物理攻击的箭矢，并造成流血，降低物理攻击力10.4%，持续时间3秒",
    id = 0
    };
getRow(321004,20)->
    #player_skills_upgradingCfg {
    skillID = 321004,
    level = 20,
    player_level = 84,
    currency = [{1,410000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对敌方单体造成589%物理攻击的箭矢，并造成流血，降低物理攻击力10.7%，持续时间3秒",
    id = 0
    };
getRow(321004,21)->
    #player_skills_upgradingCfg {
    skillID = 321004,
    level = 21,
    player_level = 86,
    currency = [{1,430000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对敌方单体造成602%物理攻击的箭矢，并造成流血，降低物理攻击力11%，持续时间3秒",
    id = 0
    };
getRow(321004,22)->
    #player_skills_upgradingCfg {
    skillID = 321004,
    level = 22,
    player_level = 88,
    currency = [{1,450000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对敌方单体造成614%物理攻击的箭矢，并造成流血，降低物理攻击力11.3%，持续时间3秒",
    id = 0
    };
getRow(321004,23)->
    #player_skills_upgradingCfg {
    skillID = 321004,
    level = 23,
    player_level = 90,
    currency = [{1,470000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对敌方单体造成627%物理攻击的箭矢，并造成流血，降低物理攻击力11.6%，持续时间3秒",
    id = 0
    };
getRow(321004,24)->
    #player_skills_upgradingCfg {
    skillID = 321004,
    level = 24,
    player_level = 92,
    currency = [{1,490000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对敌方单体造成640%物理攻击的箭矢，并造成流血，降低物理攻击力11.9%，持续时间3秒",
    id = 0
    };
getRow(321004,25)->
    #player_skills_upgradingCfg {
    skillID = 321004,
    level = 25,
    player_level = 94,
    currency = [{1,510000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对敌方单体造成653%物理攻击的箭矢，并造成流血，降低物理攻击力12.2%，持续时间3秒",
    id = 0
    };
getRow(321005,1)->
    #player_skills_upgradingCfg {
    skillID = 321005,
    level = 1,
    player_level = 60,
    currency = [],
    skillcoin_cost = 1,
    item = [],
    describe = "对前方范围造成300%物理攻击的伤害并击退，同时附加30%减速效果，持续5秒",
    id = 0
    };
getRow(321005,2)->
    #player_skills_upgradingCfg {
    skillID = 321005,
    level = 2,
    player_level = 60,
    currency = [{1,50000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对前方范围造成315%物理攻击的伤害并击退，同时附加30%减速效果，持续5秒",
    id = 0
    };
getRow(321005,3)->
    #player_skills_upgradingCfg {
    skillID = 321005,
    level = 3,
    player_level = 60,
    currency = [{1,70000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对前方范围造成330%物理攻击的伤害并击退，同时附加30%减速效果，持续5秒",
    id = 0
    };
getRow(321005,4)->
    #player_skills_upgradingCfg {
    skillID = 321005,
    level = 4,
    player_level = 60,
    currency = [{1,90000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对前方范围造成345%物理攻击的伤害并击退，同时附加30%减速效果，持续5秒",
    id = 0
    };
getRow(321005,5)->
    #player_skills_upgradingCfg {
    skillID = 321005,
    level = 5,
    player_level = 60,
    currency = [{1,110000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对前方范围造成360%物理攻击的伤害并击退，同时附加30%减速效果，持续5秒",
    id = 0
    };
getRow(321005,6)->
    #player_skills_upgradingCfg {
    skillID = 321005,
    level = 6,
    player_level = 60,
    currency = [{1,130000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对前方范围造成375%物理攻击的伤害并击退，同时附加30%减速效果，持续5秒",
    id = 0
    };
getRow(321005,7)->
    #player_skills_upgradingCfg {
    skillID = 321005,
    level = 7,
    player_level = 60,
    currency = [{1,150000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对前方范围造成390%物理攻击的伤害并击退，同时附加30%减速效果，持续5秒",
    id = 0
    };
getRow(321005,8)->
    #player_skills_upgradingCfg {
    skillID = 321005,
    level = 8,
    player_level = 60,
    currency = [{1,170000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对前方范围造成405%物理攻击的伤害并击退，同时附加30%减速效果，持续5秒",
    id = 0
    };
getRow(321005,9)->
    #player_skills_upgradingCfg {
    skillID = 321005,
    level = 9,
    player_level = 62,
    currency = [{1,190000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对前方范围造成420%物理攻击的伤害并击退，同时附加30%减速效果，持续5秒",
    id = 0
    };
getRow(321005,10)->
    #player_skills_upgradingCfg {
    skillID = 321005,
    level = 10,
    player_level = 64,
    currency = [{1,210000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对前方范围造成435%物理攻击的伤害并击退，同时附加30%减速效果，持续5秒",
    id = 0
    };
getRow(321005,11)->
    #player_skills_upgradingCfg {
    skillID = 321005,
    level = 11,
    player_level = 66,
    currency = [{1,230000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对前方范围造成450%物理攻击的伤害并击退，同时附加30%减速效果，持续5秒",
    id = 0
    };
getRow(321005,12)->
    #player_skills_upgradingCfg {
    skillID = 321005,
    level = 12,
    player_level = 68,
    currency = [{1,250000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对前方范围造成465%物理攻击的伤害并击退，同时附加30%减速效果，持续5秒",
    id = 0
    };
getRow(321005,13)->
    #player_skills_upgradingCfg {
    skillID = 321005,
    level = 13,
    player_level = 70,
    currency = [{1,270000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对前方范围造成480%物理攻击的伤害并击退，同时附加30%减速效果，持续5秒",
    id = 0
    };
getRow(321005,14)->
    #player_skills_upgradingCfg {
    skillID = 321005,
    level = 14,
    player_level = 72,
    currency = [{1,290000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对前方范围造成495%物理攻击的伤害并击退，同时附加30%减速效果，持续5秒",
    id = 0
    };
getRow(321005,15)->
    #player_skills_upgradingCfg {
    skillID = 321005,
    level = 15,
    player_level = 74,
    currency = [{1,310000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对前方范围造成510%物理攻击的伤害并击退，同时附加30%减速效果，持续5秒",
    id = 0
    };
getRow(321005,16)->
    #player_skills_upgradingCfg {
    skillID = 321005,
    level = 16,
    player_level = 76,
    currency = [{1,330000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对前方范围造成525%物理攻击的伤害并击退，同时附加30%减速效果，持续5秒",
    id = 0
    };
getRow(321005,17)->
    #player_skills_upgradingCfg {
    skillID = 321005,
    level = 17,
    player_level = 78,
    currency = [{1,350000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对前方范围造成540%物理攻击的伤害并击退，同时附加30%减速效果，持续5秒",
    id = 0
    };
getRow(321005,18)->
    #player_skills_upgradingCfg {
    skillID = 321005,
    level = 18,
    player_level = 80,
    currency = [{1,370000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对前方范围造成555%物理攻击的伤害并击退，同时附加30%减速效果，持续5秒",
    id = 0
    };
getRow(321005,19)->
    #player_skills_upgradingCfg {
    skillID = 321005,
    level = 19,
    player_level = 82,
    currency = [{1,390000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对前方范围造成570%物理攻击的伤害并击退，同时附加30%减速效果，持续5秒",
    id = 0
    };
getRow(321005,20)->
    #player_skills_upgradingCfg {
    skillID = 321005,
    level = 20,
    player_level = 84,
    currency = [{1,410000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对前方范围造成585%物理攻击的伤害并击退，同时附加30%减速效果，持续5秒",
    id = 0
    };
getRow(321005,21)->
    #player_skills_upgradingCfg {
    skillID = 321005,
    level = 21,
    player_level = 86,
    currency = [{1,430000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对前方范围造成600%物理攻击的伤害并击退，同时附加30%减速效果，持续5秒",
    id = 0
    };
getRow(321005,22)->
    #player_skills_upgradingCfg {
    skillID = 321005,
    level = 22,
    player_level = 88,
    currency = [{1,450000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对前方范围造成615%物理攻击的伤害并击退，同时附加30%减速效果，持续5秒",
    id = 0
    };
getRow(321005,23)->
    #player_skills_upgradingCfg {
    skillID = 321005,
    level = 23,
    player_level = 90,
    currency = [{1,470000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对前方范围造成630%物理攻击的伤害并击退，同时附加30%减速效果，持续5秒",
    id = 0
    };
getRow(321005,24)->
    #player_skills_upgradingCfg {
    skillID = 321005,
    level = 24,
    player_level = 92,
    currency = [{1,490000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对前方范围造成645%物理攻击的伤害并击退，同时附加30%减速效果，持续5秒",
    id = 0
    };
getRow(321005,25)->
    #player_skills_upgradingCfg {
    skillID = 321005,
    level = 25,
    player_level = 94,
    currency = [{1,510000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对前方范围造成660%物理攻击的伤害并击退，同时附加30%减速效果，持续5秒",
    id = 0
    };
getRow(321006,1)->
    #player_skills_upgradingCfg {
    skillID = 321006,
    level = 1,
    player_level = 60,
    currency = [],
    skillcoin_cost = 1,
    item = [],
    describe = "对前方范围造成300%物理攻击的伤害，概率附加沉默效果，持续3秒",
    id = 0
    };
getRow(321006,2)->
    #player_skills_upgradingCfg {
    skillID = 321006,
    level = 2,
    player_level = 60,
    currency = [{1,50000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对前方范围造成315%物理攻击的伤害，概率附加沉默效果，持续3秒",
    id = 0
    };
getRow(321006,3)->
    #player_skills_upgradingCfg {
    skillID = 321006,
    level = 3,
    player_level = 60,
    currency = [{1,70000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对前方范围造成330%物理攻击的伤害，概率附加沉默效果，持续3秒",
    id = 0
    };
getRow(321006,4)->
    #player_skills_upgradingCfg {
    skillID = 321006,
    level = 4,
    player_level = 60,
    currency = [{1,90000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对前方范围造成345%物理攻击的伤害，概率附加沉默效果，持续3秒",
    id = 0
    };
getRow(321006,5)->
    #player_skills_upgradingCfg {
    skillID = 321006,
    level = 5,
    player_level = 60,
    currency = [{1,110000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对前方范围造成360%物理攻击的伤害，概率附加沉默效果，持续3秒",
    id = 0
    };
getRow(321006,6)->
    #player_skills_upgradingCfg {
    skillID = 321006,
    level = 6,
    player_level = 60,
    currency = [{1,130000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对前方范围造成375%物理攻击的伤害，概率附加沉默效果，持续3秒",
    id = 0
    };
getRow(321006,7)->
    #player_skills_upgradingCfg {
    skillID = 321006,
    level = 7,
    player_level = 60,
    currency = [{1,150000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对前方范围造成390%物理攻击的伤害，概率附加沉默效果，持续3秒",
    id = 0
    };
getRow(321006,8)->
    #player_skills_upgradingCfg {
    skillID = 321006,
    level = 8,
    player_level = 60,
    currency = [{1,170000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对前方范围造成405%物理攻击的伤害，概率附加沉默效果，持续3秒",
    id = 0
    };
getRow(321006,9)->
    #player_skills_upgradingCfg {
    skillID = 321006,
    level = 9,
    player_level = 62,
    currency = [{1,190000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对前方范围造成420%物理攻击的伤害，概率附加沉默效果，持续3秒",
    id = 0
    };
getRow(321006,10)->
    #player_skills_upgradingCfg {
    skillID = 321006,
    level = 10,
    player_level = 64,
    currency = [{1,210000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对前方范围造成435%物理攻击的伤害，概率附加沉默效果，持续3秒",
    id = 0
    };
getRow(321006,11)->
    #player_skills_upgradingCfg {
    skillID = 321006,
    level = 11,
    player_level = 66,
    currency = [{1,230000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对前方范围造成450%物理攻击的伤害，概率附加沉默效果，持续3秒",
    id = 0
    };
getRow(321006,12)->
    #player_skills_upgradingCfg {
    skillID = 321006,
    level = 12,
    player_level = 68,
    currency = [{1,250000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对前方范围造成465%物理攻击的伤害，概率附加沉默效果，持续3秒",
    id = 0
    };
getRow(321006,13)->
    #player_skills_upgradingCfg {
    skillID = 321006,
    level = 13,
    player_level = 70,
    currency = [{1,270000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对前方范围造成480%物理攻击的伤害，概率附加沉默效果，持续3秒",
    id = 0
    };
getRow(321006,14)->
    #player_skills_upgradingCfg {
    skillID = 321006,
    level = 14,
    player_level = 72,
    currency = [{1,290000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对前方范围造成495%物理攻击的伤害，概率附加沉默效果，持续3秒",
    id = 0
    };
getRow(321006,15)->
    #player_skills_upgradingCfg {
    skillID = 321006,
    level = 15,
    player_level = 74,
    currency = [{1,310000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对前方范围造成510%物理攻击的伤害，概率附加沉默效果，持续3秒",
    id = 0
    };
getRow(321006,16)->
    #player_skills_upgradingCfg {
    skillID = 321006,
    level = 16,
    player_level = 76,
    currency = [{1,330000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对前方范围造成525%物理攻击的伤害，概率附加沉默效果，持续3秒",
    id = 0
    };
getRow(321006,17)->
    #player_skills_upgradingCfg {
    skillID = 321006,
    level = 17,
    player_level = 78,
    currency = [{1,350000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对前方范围造成540%物理攻击的伤害，概率附加沉默效果，持续3秒",
    id = 0
    };
getRow(321006,18)->
    #player_skills_upgradingCfg {
    skillID = 321006,
    level = 18,
    player_level = 80,
    currency = [{1,370000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对前方范围造成555%物理攻击的伤害，概率附加沉默效果，持续3秒",
    id = 0
    };
getRow(321006,19)->
    #player_skills_upgradingCfg {
    skillID = 321006,
    level = 19,
    player_level = 82,
    currency = [{1,390000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对前方范围造成570%物理攻击的伤害，概率附加沉默效果，持续3秒",
    id = 0
    };
getRow(321006,20)->
    #player_skills_upgradingCfg {
    skillID = 321006,
    level = 20,
    player_level = 84,
    currency = [{1,410000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对前方范围造成585%物理攻击的伤害，概率附加沉默效果，持续3秒",
    id = 0
    };
getRow(321006,21)->
    #player_skills_upgradingCfg {
    skillID = 321006,
    level = 21,
    player_level = 86,
    currency = [{1,430000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对前方范围造成600%物理攻击的伤害，概率附加沉默效果，持续3秒",
    id = 0
    };
getRow(321006,22)->
    #player_skills_upgradingCfg {
    skillID = 321006,
    level = 22,
    player_level = 88,
    currency = [{1,450000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对前方范围造成615%物理攻击的伤害，概率附加沉默效果，持续3秒",
    id = 0
    };
getRow(321006,23)->
    #player_skills_upgradingCfg {
    skillID = 321006,
    level = 23,
    player_level = 90,
    currency = [{1,470000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对前方范围造成630%物理攻击的伤害，概率附加沉默效果，持续3秒",
    id = 0
    };
getRow(321006,24)->
    #player_skills_upgradingCfg {
    skillID = 321006,
    level = 24,
    player_level = 92,
    currency = [{1,490000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对前方范围造成645%物理攻击的伤害，概率附加沉默效果，持续3秒",
    id = 0
    };
getRow(321006,25)->
    #player_skills_upgradingCfg {
    skillID = 321006,
    level = 25,
    player_level = 94,
    currency = [{1,510000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对前方范围造成660%物理攻击的伤害，概率附加沉默效果，持续3秒",
    id = 0
    };
getRow(321007,1)->
    #player_skills_upgradingCfg {
    skillID = 321007,
    level = 1,
    player_level = 60,
    currency = [],
    skillcoin_cost = 1,
    item = [],
    describe = "对敌人周围进行冰箭射击造成300%物理攻击的伤害，概率附加冰冻效果，持续2秒",
    id = 0
    };
getRow(321007,2)->
    #player_skills_upgradingCfg {
    skillID = 321007,
    level = 2,
    player_level = 60,
    currency = [{1,50000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对敌人周围进行冰箭射击造成315%物理攻击的伤害，概率附加冰冻效果，持续2秒",
    id = 0
    };
getRow(321007,3)->
    #player_skills_upgradingCfg {
    skillID = 321007,
    level = 3,
    player_level = 60,
    currency = [{1,70000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对敌人周围进行冰箭射击造成330%物理攻击的伤害，概率附加冰冻效果，持续2秒",
    id = 0
    };
getRow(321007,4)->
    #player_skills_upgradingCfg {
    skillID = 321007,
    level = 4,
    player_level = 60,
    currency = [{1,90000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对敌人周围进行冰箭射击造成345%物理攻击的伤害，概率附加冰冻效果，持续2秒",
    id = 0
    };
getRow(321007,5)->
    #player_skills_upgradingCfg {
    skillID = 321007,
    level = 5,
    player_level = 60,
    currency = [{1,110000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对敌人周围进行冰箭射击造成360%物理攻击的伤害，概率附加冰冻效果，持续2秒",
    id = 0
    };
getRow(321007,6)->
    #player_skills_upgradingCfg {
    skillID = 321007,
    level = 6,
    player_level = 60,
    currency = [{1,130000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对敌人周围进行冰箭射击造成375%物理攻击的伤害，概率附加冰冻效果，持续2秒",
    id = 0
    };
getRow(321007,7)->
    #player_skills_upgradingCfg {
    skillID = 321007,
    level = 7,
    player_level = 60,
    currency = [{1,150000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对敌人周围进行冰箭射击造成390%物理攻击的伤害，概率附加冰冻效果，持续2秒",
    id = 0
    };
getRow(321007,8)->
    #player_skills_upgradingCfg {
    skillID = 321007,
    level = 8,
    player_level = 60,
    currency = [{1,170000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对敌人周围进行冰箭射击造成405%物理攻击的伤害，概率附加冰冻效果，持续2秒",
    id = 0
    };
getRow(321007,9)->
    #player_skills_upgradingCfg {
    skillID = 321007,
    level = 9,
    player_level = 62,
    currency = [{1,190000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对敌人周围进行冰箭射击造成420%物理攻击的伤害，概率附加冰冻效果，持续2秒",
    id = 0
    };
getRow(321007,10)->
    #player_skills_upgradingCfg {
    skillID = 321007,
    level = 10,
    player_level = 64,
    currency = [{1,210000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对敌人周围进行冰箭射击造成435%物理攻击的伤害，概率附加冰冻效果，持续2秒",
    id = 0
    };
getRow(321007,11)->
    #player_skills_upgradingCfg {
    skillID = 321007,
    level = 11,
    player_level = 66,
    currency = [{1,230000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对敌人周围进行冰箭射击造成450%物理攻击的伤害，概率附加冰冻效果，持续2秒",
    id = 0
    };
getRow(321007,12)->
    #player_skills_upgradingCfg {
    skillID = 321007,
    level = 12,
    player_level = 68,
    currency = [{1,250000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对敌人周围进行冰箭射击造成465%物理攻击的伤害，概率附加冰冻效果，持续2秒",
    id = 0
    };
getRow(321007,13)->
    #player_skills_upgradingCfg {
    skillID = 321007,
    level = 13,
    player_level = 70,
    currency = [{1,270000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对敌人周围进行冰箭射击造成480%物理攻击的伤害，概率附加冰冻效果，持续2秒",
    id = 0
    };
getRow(321007,14)->
    #player_skills_upgradingCfg {
    skillID = 321007,
    level = 14,
    player_level = 72,
    currency = [{1,290000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对敌人周围进行冰箭射击造成495%物理攻击的伤害，概率附加冰冻效果，持续2秒",
    id = 0
    };
getRow(321007,15)->
    #player_skills_upgradingCfg {
    skillID = 321007,
    level = 15,
    player_level = 74,
    currency = [{1,310000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对敌人周围进行冰箭射击造成510%物理攻击的伤害，概率附加冰冻效果，持续2秒",
    id = 0
    };
getRow(321007,16)->
    #player_skills_upgradingCfg {
    skillID = 321007,
    level = 16,
    player_level = 76,
    currency = [{1,330000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对敌人周围进行冰箭射击造成525%物理攻击的伤害，概率附加冰冻效果，持续2秒",
    id = 0
    };
getRow(321007,17)->
    #player_skills_upgradingCfg {
    skillID = 321007,
    level = 17,
    player_level = 78,
    currency = [{1,350000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对敌人周围进行冰箭射击造成540%物理攻击的伤害，概率附加冰冻效果，持续2秒",
    id = 0
    };
getRow(321007,18)->
    #player_skills_upgradingCfg {
    skillID = 321007,
    level = 18,
    player_level = 80,
    currency = [{1,370000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对敌人周围进行冰箭射击造成555%物理攻击的伤害，概率附加冰冻效果，持续2秒",
    id = 0
    };
getRow(321007,19)->
    #player_skills_upgradingCfg {
    skillID = 321007,
    level = 19,
    player_level = 82,
    currency = [{1,390000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对敌人周围进行冰箭射击造成570%物理攻击的伤害，概率附加冰冻效果，持续2秒",
    id = 0
    };
getRow(321007,20)->
    #player_skills_upgradingCfg {
    skillID = 321007,
    level = 20,
    player_level = 84,
    currency = [{1,410000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对敌人周围进行冰箭射击造成585%物理攻击的伤害，概率附加冰冻效果，持续2秒",
    id = 0
    };
getRow(321007,21)->
    #player_skills_upgradingCfg {
    skillID = 321007,
    level = 21,
    player_level = 86,
    currency = [{1,430000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对敌人周围进行冰箭射击造成600%物理攻击的伤害，概率附加冰冻效果，持续2秒",
    id = 0
    };
getRow(321007,22)->
    #player_skills_upgradingCfg {
    skillID = 321007,
    level = 22,
    player_level = 88,
    currency = [{1,450000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对敌人周围进行冰箭射击造成615%物理攻击的伤害，概率附加冰冻效果，持续2秒",
    id = 0
    };
getRow(321007,23)->
    #player_skills_upgradingCfg {
    skillID = 321007,
    level = 23,
    player_level = 90,
    currency = [{1,470000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对敌人周围进行冰箭射击造成630%物理攻击的伤害，概率附加冰冻效果，持续2秒",
    id = 0
    };
getRow(321007,24)->
    #player_skills_upgradingCfg {
    skillID = 321007,
    level = 24,
    player_level = 92,
    currency = [{1,490000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对敌人周围进行冰箭射击造成645%物理攻击的伤害，概率附加冰冻效果，持续2秒",
    id = 0
    };
getRow(321007,25)->
    #player_skills_upgradingCfg {
    skillID = 321007,
    level = 25,
    player_level = 94,
    currency = [{1,510000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对敌人周围进行冰箭射击造成660%物理攻击的伤害，概率附加冰冻效果，持续2秒",
    id = 0
    };
getRow(321008,1)->
    #player_skills_upgradingCfg {
    skillID = 321008,
    level = 1,
    player_level = 60,
    currency = [],
    skillcoin_cost = 1,
    item = [],
    describe = "对周围范围的敌人造成6次75%物理攻击的伤害，击退敌人同时产生30%减速效果，持续5秒",
    id = 0
    };
getRow(321008,2)->
    #player_skills_upgradingCfg {
    skillID = 321008,
    level = 2,
    player_level = 60,
    currency = [{1,50000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对周围范围的敌人造成6次79%物理攻击的伤害，击退敌人同时产生30%减速效果，持续5秒",
    id = 0
    };
getRow(321008,3)->
    #player_skills_upgradingCfg {
    skillID = 321008,
    level = 3,
    player_level = 60,
    currency = [{1,70000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对周围范围的敌人造成6次83%物理攻击的伤害，击退敌人同时产生30%减速效果，持续5秒",
    id = 0
    };
getRow(321008,4)->
    #player_skills_upgradingCfg {
    skillID = 321008,
    level = 4,
    player_level = 60,
    currency = [{1,90000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对周围范围的敌人造成6次87%物理攻击的伤害，击退敌人同时产生30%减速效果，持续5秒",
    id = 0
    };
getRow(321008,5)->
    #player_skills_upgradingCfg {
    skillID = 321008,
    level = 5,
    player_level = 60,
    currency = [{1,110000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对周围范围的敌人造成6次91%物理攻击的伤害，击退敌人同时产生30%减速效果，持续5秒",
    id = 0
    };
getRow(321008,6)->
    #player_skills_upgradingCfg {
    skillID = 321008,
    level = 6,
    player_level = 60,
    currency = [{1,130000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对周围范围的敌人造成6次95%物理攻击的伤害，击退敌人同时产生30%减速效果，持续5秒",
    id = 0
    };
getRow(321008,7)->
    #player_skills_upgradingCfg {
    skillID = 321008,
    level = 7,
    player_level = 60,
    currency = [{1,150000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对周围范围的敌人造成6次99%物理攻击的伤害，击退敌人同时产生30%减速效果，持续5秒",
    id = 0
    };
getRow(321008,8)->
    #player_skills_upgradingCfg {
    skillID = 321008,
    level = 8,
    player_level = 60,
    currency = [{1,170000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对周围范围的敌人造成6次103%物理攻击的伤害，击退敌人同时产生30%减速效果，持续5秒",
    id = 0
    };
getRow(321008,9)->
    #player_skills_upgradingCfg {
    skillID = 321008,
    level = 9,
    player_level = 62,
    currency = [{1,190000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对周围范围的敌人造成6次107%物理攻击的伤害，击退敌人同时产生30%减速效果，持续5秒",
    id = 0
    };
getRow(321008,10)->
    #player_skills_upgradingCfg {
    skillID = 321008,
    level = 10,
    player_level = 64,
    currency = [{1,210000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对周围范围的敌人造成6次111%物理攻击的伤害，击退敌人同时产生30%减速效果，持续5秒",
    id = 0
    };
getRow(321008,11)->
    #player_skills_upgradingCfg {
    skillID = 321008,
    level = 11,
    player_level = 66,
    currency = [{1,230000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对周围范围的敌人造成6次115%物理攻击的伤害，击退敌人同时产生30%减速效果，持续5秒",
    id = 0
    };
getRow(321008,12)->
    #player_skills_upgradingCfg {
    skillID = 321008,
    level = 12,
    player_level = 68,
    currency = [{1,250000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对周围范围的敌人造成6次119%物理攻击的伤害，击退敌人同时产生30%减速效果，持续5秒",
    id = 0
    };
getRow(321008,13)->
    #player_skills_upgradingCfg {
    skillID = 321008,
    level = 13,
    player_level = 70,
    currency = [{1,270000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对周围范围的敌人造成6次123%物理攻击的伤害，击退敌人同时产生30%减速效果，持续5秒",
    id = 0
    };
getRow(321008,14)->
    #player_skills_upgradingCfg {
    skillID = 321008,
    level = 14,
    player_level = 72,
    currency = [{1,290000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对周围范围的敌人造成6次127%物理攻击的伤害，击退敌人同时产生30%减速效果，持续5秒",
    id = 0
    };
getRow(321008,15)->
    #player_skills_upgradingCfg {
    skillID = 321008,
    level = 15,
    player_level = 74,
    currency = [{1,310000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对周围范围的敌人造成6次131%物理攻击的伤害，击退敌人同时产生30%减速效果，持续5秒",
    id = 0
    };
getRow(321008,16)->
    #player_skills_upgradingCfg {
    skillID = 321008,
    level = 16,
    player_level = 76,
    currency = [{1,330000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对周围范围的敌人造成6次135%物理攻击的伤害，击退敌人同时产生30%减速效果，持续5秒",
    id = 0
    };
getRow(321008,17)->
    #player_skills_upgradingCfg {
    skillID = 321008,
    level = 17,
    player_level = 78,
    currency = [{1,350000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对周围范围的敌人造成6次139%物理攻击的伤害，击退敌人同时产生30%减速效果，持续5秒",
    id = 0
    };
getRow(321008,18)->
    #player_skills_upgradingCfg {
    skillID = 321008,
    level = 18,
    player_level = 80,
    currency = [{1,370000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对周围范围的敌人造成6次143%物理攻击的伤害，击退敌人同时产生30%减速效果，持续5秒",
    id = 0
    };
getRow(321008,19)->
    #player_skills_upgradingCfg {
    skillID = 321008,
    level = 19,
    player_level = 82,
    currency = [{1,390000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对周围范围的敌人造成6次147%物理攻击的伤害，击退敌人同时产生30%减速效果，持续5秒",
    id = 0
    };
getRow(321008,20)->
    #player_skills_upgradingCfg {
    skillID = 321008,
    level = 20,
    player_level = 84,
    currency = [{1,410000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对周围范围的敌人造成6次151%物理攻击的伤害，击退敌人同时产生30%减速效果，持续5秒",
    id = 0
    };
getRow(321008,21)->
    #player_skills_upgradingCfg {
    skillID = 321008,
    level = 21,
    player_level = 86,
    currency = [{1,430000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对周围范围的敌人造成6次155%物理攻击的伤害，击退敌人同时产生30%减速效果，持续5秒",
    id = 0
    };
getRow(321008,22)->
    #player_skills_upgradingCfg {
    skillID = 321008,
    level = 22,
    player_level = 88,
    currency = [{1,450000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对周围范围的敌人造成6次159%物理攻击的伤害，击退敌人同时产生30%减速效果，持续5秒",
    id = 0
    };
getRow(321008,23)->
    #player_skills_upgradingCfg {
    skillID = 321008,
    level = 23,
    player_level = 90,
    currency = [{1,470000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对周围范围的敌人造成6次163%物理攻击的伤害，击退敌人同时产生30%减速效果，持续5秒",
    id = 0
    };
getRow(321008,24)->
    #player_skills_upgradingCfg {
    skillID = 321008,
    level = 24,
    player_level = 92,
    currency = [{1,490000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对周围范围的敌人造成6次167%物理攻击的伤害，击退敌人同时产生30%减速效果，持续5秒",
    id = 0
    };
getRow(321008,25)->
    #player_skills_upgradingCfg {
    skillID = 321008,
    level = 25,
    player_level = 94,
    currency = [{1,510000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对周围范围的敌人造成6次171%物理攻击的伤害，击退敌人同时产生30%减速效果，持续5秒",
    id = 0
    };
getRow(321009,1)->
    #player_skills_upgradingCfg {
    skillID = 321009,
    level = 1,
    player_level = 60,
    currency = [],
    skillcoin_cost = 1,
    item = [],
    describe = "对周围范围队友加命中等级15%，同时增加闪避等级15%，持续时间10分钟",
    id = 0
    };
getRow(321009,2)->
    #player_skills_upgradingCfg {
    skillID = 321009,
    level = 2,
    player_level = 60,
    currency = [{1,70000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对周围范围队友加命中等级16%，同时增加闪避等级16%，持续时间10分钟",
    id = 0
    };
getRow(321009,3)->
    #player_skills_upgradingCfg {
    skillID = 321009,
    level = 3,
    player_level = 60,
    currency = [{1,110000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对周围范围队友加命中等级17%，同时增加闪避等级17%，持续时间10分钟",
    id = 0
    };
getRow(321009,4)->
    #player_skills_upgradingCfg {
    skillID = 321009,
    level = 4,
    player_level = 60,
    currency = [{1,150000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对周围范围队友加命中等级18%，同时增加闪避等级18%，持续时间10分钟",
    id = 0
    };
getRow(321009,5)->
    #player_skills_upgradingCfg {
    skillID = 321009,
    level = 5,
    player_level = 62,
    currency = [{1,190000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对周围范围队友加命中等级19%，同时增加闪避等级19%，持续时间10分钟",
    id = 0
    };
getRow(321009,6)->
    #player_skills_upgradingCfg {
    skillID = 321009,
    level = 6,
    player_level = 66,
    currency = [{1,230000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对周围范围队友加命中等级20%，同时增加闪避等级20%，持续时间10分钟",
    id = 0
    };
getRow(321009,7)->
    #player_skills_upgradingCfg {
    skillID = 321009,
    level = 7,
    player_level = 70,
    currency = [{1,270000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对周围范围队友加命中等级21%，同时增加闪避等级21%，持续时间10分钟",
    id = 0
    };
getRow(321009,8)->
    #player_skills_upgradingCfg {
    skillID = 321009,
    level = 8,
    player_level = 74,
    currency = [{1,310000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对周围范围队友加命中等级22%，同时增加闪避等级22%，持续时间10分钟",
    id = 0
    };
getRow(321009,9)->
    #player_skills_upgradingCfg {
    skillID = 321009,
    level = 9,
    player_level = 78,
    currency = [{1,350000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对周围范围队友加命中等级23%，同时增加闪避等级23%，持续时间10分钟",
    id = 0
    };
getRow(321009,10)->
    #player_skills_upgradingCfg {
    skillID = 321009,
    level = 10,
    player_level = 82,
    currency = [{1,390000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对周围范围队友加命中等级24%，同时增加闪避等级24%，持续时间10分钟",
    id = 0
    };
getRow(321009,11)->
    #player_skills_upgradingCfg {
    skillID = 321009,
    level = 11,
    player_level = 86,
    currency = [{1,430000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对周围范围队友加命中等级25%，同时增加闪避等级25%，持续时间10分钟",
    id = 0
    };
getRow(321010,1)->
    #player_skills_upgradingCfg {
    skillID = 321010,
    level = 1,
    player_level = 60,
    currency = [],
    skillcoin_cost = 1,
    item = [],
    describe = "对周围范围队友加移动速度15%，持续时间5秒",
    id = 0
    };
getRow(321010,2)->
    #player_skills_upgradingCfg {
    skillID = 321010,
    level = 2,
    player_level = 60,
    currency = [{1,70000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对周围范围队友加移动速度16.5%，持续时间5秒",
    id = 0
    };
getRow(321010,3)->
    #player_skills_upgradingCfg {
    skillID = 321010,
    level = 3,
    player_level = 60,
    currency = [{1,110000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对周围范围队友加移动速度18%，持续时间5秒",
    id = 0
    };
getRow(321010,4)->
    #player_skills_upgradingCfg {
    skillID = 321010,
    level = 4,
    player_level = 60,
    currency = [{1,150000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对周围范围队友加移动速度19.5%，持续时间5秒",
    id = 0
    };
getRow(321010,5)->
    #player_skills_upgradingCfg {
    skillID = 321010,
    level = 5,
    player_level = 62,
    currency = [{1,190000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对周围范围队友加移动速度21%，持续时间5秒",
    id = 0
    };
getRow(321010,6)->
    #player_skills_upgradingCfg {
    skillID = 321010,
    level = 6,
    player_level = 66,
    currency = [{1,230000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对周围范围队友加移动速度22.5%，持续时间5秒",
    id = 0
    };
getRow(321010,7)->
    #player_skills_upgradingCfg {
    skillID = 321010,
    level = 7,
    player_level = 70,
    currency = [{1,270000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对周围范围队友加移动速度24%，持续时间5秒",
    id = 0
    };
getRow(321010,8)->
    #player_skills_upgradingCfg {
    skillID = 321010,
    level = 8,
    player_level = 74,
    currency = [{1,310000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对周围范围队友加移动速度25.5%，持续时间5秒",
    id = 0
    };
getRow(321010,9)->
    #player_skills_upgradingCfg {
    skillID = 321010,
    level = 9,
    player_level = 78,
    currency = [{1,350000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对周围范围队友加移动速度27%，持续时间5秒",
    id = 0
    };
getRow(321010,10)->
    #player_skills_upgradingCfg {
    skillID = 321010,
    level = 10,
    player_level = 82,
    currency = [{1,390000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对周围范围队友加移动速度28.5%，持续时间5秒",
    id = 0
    };
getRow(321010,11)->
    #player_skills_upgradingCfg {
    skillID = 321010,
    level = 11,
    player_level = 86,
    currency = [{1,430000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对周围范围队友加移动速度30%，持续时间5秒",
    id = 0
    };
getRow(322004,1)->
    #player_skills_upgradingCfg {
    skillID = 322004,
    level = 1,
    player_level = 60,
    currency = [],
    skillcoin_cost = 1,
    item = [],
    describe = "瞬间突袭造成前方矩形范围内敌人231%物理攻击的伤害，并造成流血，同时增加自身加暴击等级10%，持续时间3秒",
    id = 0
    };
getRow(322004,2)->
    #player_skills_upgradingCfg {
    skillID = 322004,
    level = 2,
    player_level = 60,
    currency = [{1,50000}],
    skillcoin_cost = 1,
    item = [],
    describe = "瞬间突袭造成前方矩形范围内敌人241%物理攻击的伤害，并造成流血，同时增加自身加暴击等级10.2%，持续时间3秒",
    id = 0
    };
getRow(322004,3)->
    #player_skills_upgradingCfg {
    skillID = 322004,
    level = 3,
    player_level = 60,
    currency = [{1,70000}],
    skillcoin_cost = 1,
    item = [],
    describe = "瞬间突袭造成前方矩形范围内敌人252%物理攻击的伤害，并造成流血，同时增加自身加暴击等级10.4%，持续时间3秒",
    id = 0
    };
getRow(322004,4)->
    #player_skills_upgradingCfg {
    skillID = 322004,
    level = 4,
    player_level = 60,
    currency = [{1,90000}],
    skillcoin_cost = 1,
    item = [],
    describe = "瞬间突袭造成前方矩形范围内敌人263%物理攻击的伤害，并造成流血，同时增加自身加暴击等级10.6%，持续时间3秒",
    id = 0
    };
getRow(322004,5)->
    #player_skills_upgradingCfg {
    skillID = 322004,
    level = 5,
    player_level = 60,
    currency = [{1,110000}],
    skillcoin_cost = 1,
    item = [],
    describe = "瞬间突袭造成前方矩形范围内敌人274%物理攻击的伤害，并造成流血，同时增加自身加暴击等级10.8%，持续时间3秒",
    id = 0
    };
getRow(322004,6)->
    #player_skills_upgradingCfg {
    skillID = 322004,
    level = 6,
    player_level = 60,
    currency = [{1,130000}],
    skillcoin_cost = 1,
    item = [],
    describe = "瞬间突袭造成前方矩形范围内敌人285%物理攻击的伤害，并造成流血，同时增加自身加暴击等级11%，持续时间3秒",
    id = 0
    };
getRow(322004,7)->
    #player_skills_upgradingCfg {
    skillID = 322004,
    level = 7,
    player_level = 60,
    currency = [{1,150000}],
    skillcoin_cost = 1,
    item = [],
    describe = "瞬间突袭造成前方矩形范围内敌人296%物理攻击的伤害，并造成流血，同时增加自身加暴击等级11.2%，持续时间3秒",
    id = 0
    };
getRow(322004,8)->
    #player_skills_upgradingCfg {
    skillID = 322004,
    level = 8,
    player_level = 60,
    currency = [{1,170000}],
    skillcoin_cost = 1,
    item = [],
    describe = "瞬间突袭造成前方矩形范围内敌人307%物理攻击的伤害，并造成流血，同时增加自身加暴击等级11.4%，持续时间3秒",
    id = 0
    };
getRow(322004,9)->
    #player_skills_upgradingCfg {
    skillID = 322004,
    level = 9,
    player_level = 62,
    currency = [{1,190000}],
    skillcoin_cost = 1,
    item = [],
    describe = "瞬间突袭造成前方矩形范围内敌人318%物理攻击的伤害，并造成流血，同时增加自身加暴击等级11.6%，持续时间3秒",
    id = 0
    };
getRow(322004,10)->
    #player_skills_upgradingCfg {
    skillID = 322004,
    level = 10,
    player_level = 64,
    currency = [{1,210000}],
    skillcoin_cost = 1,
    item = [],
    describe = "瞬间突袭造成前方矩形范围内敌人329%物理攻击的伤害，并造成流血，同时增加自身加暴击等级11.8%，持续时间3秒",
    id = 0
    };
getRow(322004,11)->
    #player_skills_upgradingCfg {
    skillID = 322004,
    level = 11,
    player_level = 66,
    currency = [{1,230000}],
    skillcoin_cost = 1,
    item = [],
    describe = "瞬间突袭造成前方矩形范围内敌人340%物理攻击的伤害，并造成流血，同时增加自身加暴击等级12%，持续时间3秒",
    id = 0
    };
getRow(322004,12)->
    #player_skills_upgradingCfg {
    skillID = 322004,
    level = 12,
    player_level = 68,
    currency = [{1,250000}],
    skillcoin_cost = 1,
    item = [],
    describe = "瞬间突袭造成前方矩形范围内敌人351%物理攻击的伤害，并造成流血，同时增加自身加暴击等级12.2%，持续时间3秒",
    id = 0
    };
getRow(322004,13)->
    #player_skills_upgradingCfg {
    skillID = 322004,
    level = 13,
    player_level = 70,
    currency = [{1,270000}],
    skillcoin_cost = 1,
    item = [],
    describe = "瞬间突袭造成前方矩形范围内敌人362%物理攻击的伤害，并造成流血，同时增加自身加暴击等级12.4%，持续时间3秒",
    id = 0
    };
getRow(322004,14)->
    #player_skills_upgradingCfg {
    skillID = 322004,
    level = 14,
    player_level = 72,
    currency = [{1,290000}],
    skillcoin_cost = 1,
    item = [],
    describe = "瞬间突袭造成前方矩形范围内敌人373%物理攻击的伤害，并造成流血，同时增加自身加暴击等级12.6%，持续时间3秒",
    id = 0
    };
getRow(322004,15)->
    #player_skills_upgradingCfg {
    skillID = 322004,
    level = 15,
    player_level = 74,
    currency = [{1,310000}],
    skillcoin_cost = 1,
    item = [],
    describe = "瞬间突袭造成前方矩形范围内敌人384%物理攻击的伤害，并造成流血，同时增加自身加暴击等级12.8%，持续时间3秒",
    id = 0
    };
getRow(322004,16)->
    #player_skills_upgradingCfg {
    skillID = 322004,
    level = 16,
    player_level = 76,
    currency = [{1,330000}],
    skillcoin_cost = 1,
    item = [],
    describe = "瞬间突袭造成前方矩形范围内敌人395%物理攻击的伤害，并造成流血，同时增加自身加暴击等级13%，持续时间3秒",
    id = 0
    };
getRow(322004,17)->
    #player_skills_upgradingCfg {
    skillID = 322004,
    level = 17,
    player_level = 78,
    currency = [{1,350000}],
    skillcoin_cost = 1,
    item = [],
    describe = "瞬间突袭造成前方矩形范围内敌人406%物理攻击的伤害，并造成流血，同时增加自身加暴击等级13.2%，持续时间3秒",
    id = 0
    };
getRow(322004,18)->
    #player_skills_upgradingCfg {
    skillID = 322004,
    level = 18,
    player_level = 80,
    currency = [{1,370000}],
    skillcoin_cost = 1,
    item = [],
    describe = "瞬间突袭造成前方矩形范围内敌人417%物理攻击的伤害，并造成流血，同时增加自身加暴击等级13.4%，持续时间3秒",
    id = 0
    };
getRow(322004,19)->
    #player_skills_upgradingCfg {
    skillID = 322004,
    level = 19,
    player_level = 82,
    currency = [{1,390000}],
    skillcoin_cost = 1,
    item = [],
    describe = "瞬间突袭造成前方矩形范围内敌人428%物理攻击的伤害，并造成流血，同时增加自身加暴击等级13.6%，持续时间3秒",
    id = 0
    };
getRow(322004,20)->
    #player_skills_upgradingCfg {
    skillID = 322004,
    level = 20,
    player_level = 84,
    currency = [{1,410000}],
    skillcoin_cost = 1,
    item = [],
    describe = "瞬间突袭造成前方矩形范围内敌人439%物理攻击的伤害，并造成流血，同时增加自身加暴击等级13.8%，持续时间3秒",
    id = 0
    };
getRow(322004,21)->
    #player_skills_upgradingCfg {
    skillID = 322004,
    level = 21,
    player_level = 86,
    currency = [{1,430000}],
    skillcoin_cost = 1,
    item = [],
    describe = "瞬间突袭造成前方矩形范围内敌人450%物理攻击的伤害，并造成流血，同时增加自身加暴击等级14%，持续时间3秒",
    id = 0
    };
getRow(322004,22)->
    #player_skills_upgradingCfg {
    skillID = 322004,
    level = 22,
    player_level = 88,
    currency = [{1,450000}],
    skillcoin_cost = 1,
    item = [],
    describe = "瞬间突袭造成前方矩形范围内敌人461%物理攻击的伤害，并造成流血，同时增加自身加暴击等级14.2%，持续时间3秒",
    id = 0
    };
getRow(322004,23)->
    #player_skills_upgradingCfg {
    skillID = 322004,
    level = 23,
    player_level = 90,
    currency = [{1,470000}],
    skillcoin_cost = 1,
    item = [],
    describe = "瞬间突袭造成前方矩形范围内敌人472%物理攻击的伤害，并造成流血，同时增加自身加暴击等级14.4%，持续时间3秒",
    id = 0
    };
getRow(322004,24)->
    #player_skills_upgradingCfg {
    skillID = 322004,
    level = 24,
    player_level = 92,
    currency = [{1,490000}],
    skillcoin_cost = 1,
    item = [],
    describe = "瞬间突袭造成前方矩形范围内敌人483%物理攻击的伤害，并造成流血，同时增加自身加暴击等级14.6%，持续时间3秒",
    id = 0
    };
getRow(322004,25)->
    #player_skills_upgradingCfg {
    skillID = 322004,
    level = 25,
    player_level = 94,
    currency = [{1,510000}],
    skillcoin_cost = 1,
    item = [],
    describe = "瞬间突袭造成前方矩形范围内敌人494%物理攻击的伤害，并造成流血，同时增加自身加暴击等级14.8%，持续时间3秒",
    id = 0
    };
getRow(322005,1)->
    #player_skills_upgradingCfg {
    skillID = 322005,
    level = 1,
    player_level = 60,
    currency = [],
    skillcoin_cost = 1,
    item = [],
    describe = "对前方范围敌人造成300%物理攻击的伤害，同时降低魔法攻击力5%，持续时间3秒",
    id = 0
    };
getRow(322005,2)->
    #player_skills_upgradingCfg {
    skillID = 322005,
    level = 2,
    player_level = 60,
    currency = [{1,50000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对前方范围敌人造成315%物理攻击的伤害，同时降低魔法攻击力5.3%，持续时间3秒",
    id = 0
    };
getRow(322005,3)->
    #player_skills_upgradingCfg {
    skillID = 322005,
    level = 3,
    player_level = 60,
    currency = [{1,70000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对前方范围敌人造成330%物理攻击的伤害，同时降低魔法攻击力5.6%，持续时间3秒",
    id = 0
    };
getRow(322005,4)->
    #player_skills_upgradingCfg {
    skillID = 322005,
    level = 4,
    player_level = 60,
    currency = [{1,90000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对前方范围敌人造成345%物理攻击的伤害，同时降低魔法攻击力5.9%，持续时间3秒",
    id = 0
    };
getRow(322005,5)->
    #player_skills_upgradingCfg {
    skillID = 322005,
    level = 5,
    player_level = 60,
    currency = [{1,110000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对前方范围敌人造成360%物理攻击的伤害，同时降低魔法攻击力6.2%，持续时间3秒",
    id = 0
    };
getRow(322005,6)->
    #player_skills_upgradingCfg {
    skillID = 322005,
    level = 6,
    player_level = 60,
    currency = [{1,130000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对前方范围敌人造成375%物理攻击的伤害，同时降低魔法攻击力6.5%，持续时间3秒",
    id = 0
    };
getRow(322005,7)->
    #player_skills_upgradingCfg {
    skillID = 322005,
    level = 7,
    player_level = 60,
    currency = [{1,150000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对前方范围敌人造成390%物理攻击的伤害，同时降低魔法攻击力6.8%，持续时间3秒",
    id = 0
    };
getRow(322005,8)->
    #player_skills_upgradingCfg {
    skillID = 322005,
    level = 8,
    player_level = 60,
    currency = [{1,170000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对前方范围敌人造成405%物理攻击的伤害，同时降低魔法攻击力7.1%，持续时间3秒",
    id = 0
    };
getRow(322005,9)->
    #player_skills_upgradingCfg {
    skillID = 322005,
    level = 9,
    player_level = 62,
    currency = [{1,190000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对前方范围敌人造成420%物理攻击的伤害，同时降低魔法攻击力7.4%，持续时间3秒",
    id = 0
    };
getRow(322005,10)->
    #player_skills_upgradingCfg {
    skillID = 322005,
    level = 10,
    player_level = 64,
    currency = [{1,210000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对前方范围敌人造成435%物理攻击的伤害，同时降低魔法攻击力7.7%，持续时间3秒",
    id = 0
    };
getRow(322005,11)->
    #player_skills_upgradingCfg {
    skillID = 322005,
    level = 11,
    player_level = 66,
    currency = [{1,230000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对前方范围敌人造成450%物理攻击的伤害，同时降低魔法攻击力8%，持续时间3秒",
    id = 0
    };
getRow(322005,12)->
    #player_skills_upgradingCfg {
    skillID = 322005,
    level = 12,
    player_level = 68,
    currency = [{1,250000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对前方范围敌人造成465%物理攻击的伤害，同时降低魔法攻击力8.3%，持续时间3秒",
    id = 0
    };
getRow(322005,13)->
    #player_skills_upgradingCfg {
    skillID = 322005,
    level = 13,
    player_level = 70,
    currency = [{1,270000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对前方范围敌人造成480%物理攻击的伤害，同时降低魔法攻击力8.6%，持续时间3秒",
    id = 0
    };
getRow(322005,14)->
    #player_skills_upgradingCfg {
    skillID = 322005,
    level = 14,
    player_level = 72,
    currency = [{1,290000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对前方范围敌人造成495%物理攻击的伤害，同时降低魔法攻击力8.9%，持续时间3秒",
    id = 0
    };
getRow(322005,15)->
    #player_skills_upgradingCfg {
    skillID = 322005,
    level = 15,
    player_level = 74,
    currency = [{1,310000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对前方范围敌人造成510%物理攻击的伤害，同时降低魔法攻击力9.2%，持续时间3秒",
    id = 0
    };
getRow(322005,16)->
    #player_skills_upgradingCfg {
    skillID = 322005,
    level = 16,
    player_level = 76,
    currency = [{1,330000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对前方范围敌人造成525%物理攻击的伤害，同时降低魔法攻击力9.5%，持续时间3秒",
    id = 0
    };
getRow(322005,17)->
    #player_skills_upgradingCfg {
    skillID = 322005,
    level = 17,
    player_level = 78,
    currency = [{1,350000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对前方范围敌人造成540%物理攻击的伤害，同时降低魔法攻击力9.8%，持续时间3秒",
    id = 0
    };
getRow(322005,18)->
    #player_skills_upgradingCfg {
    skillID = 322005,
    level = 18,
    player_level = 80,
    currency = [{1,370000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对前方范围敌人造成555%物理攻击的伤害，同时降低魔法攻击力10.1%，持续时间3秒",
    id = 0
    };
getRow(322005,19)->
    #player_skills_upgradingCfg {
    skillID = 322005,
    level = 19,
    player_level = 82,
    currency = [{1,390000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对前方范围敌人造成570%物理攻击的伤害，同时降低魔法攻击力10.4%，持续时间3秒",
    id = 0
    };
getRow(322005,20)->
    #player_skills_upgradingCfg {
    skillID = 322005,
    level = 20,
    player_level = 84,
    currency = [{1,410000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对前方范围敌人造成585%物理攻击的伤害，同时降低魔法攻击力10.7%，持续时间3秒",
    id = 0
    };
getRow(322005,21)->
    #player_skills_upgradingCfg {
    skillID = 322005,
    level = 21,
    player_level = 86,
    currency = [{1,430000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对前方范围敌人造成600%物理攻击的伤害，同时降低魔法攻击力11%，持续时间3秒",
    id = 0
    };
getRow(322005,22)->
    #player_skills_upgradingCfg {
    skillID = 322005,
    level = 22,
    player_level = 88,
    currency = [{1,450000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对前方范围敌人造成615%物理攻击的伤害，同时降低魔法攻击力11.3%，持续时间3秒",
    id = 0
    };
getRow(322005,23)->
    #player_skills_upgradingCfg {
    skillID = 322005,
    level = 23,
    player_level = 90,
    currency = [{1,470000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对前方范围敌人造成630%物理攻击的伤害，同时降低魔法攻击力11.6%，持续时间3秒",
    id = 0
    };
getRow(322005,24)->
    #player_skills_upgradingCfg {
    skillID = 322005,
    level = 24,
    player_level = 92,
    currency = [{1,490000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对前方范围敌人造成645%物理攻击的伤害，同时降低魔法攻击力11.9%，持续时间3秒",
    id = 0
    };
getRow(322005,25)->
    #player_skills_upgradingCfg {
    skillID = 322005,
    level = 25,
    player_level = 94,
    currency = [{1,510000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对前方范围敌人造成660%物理攻击的伤害，同时降低魔法攻击力12.2%，持续时间3秒",
    id = 0
    };
getRow(322006,1)->
    #player_skills_upgradingCfg {
    skillID = 322006,
    level = 1,
    player_level = 60,
    currency = [],
    skillcoin_cost = 1,
    item = [],
    describe = "对前方矩形范围敌人造成2次150%物理攻击的伤害，同时降低目标10%物理防御，持续3秒",
    id = 0
    };
getRow(322006,2)->
    #player_skills_upgradingCfg {
    skillID = 322006,
    level = 2,
    player_level = 60,
    currency = [{1,50000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对前方矩形范围敌人造成2次158%物理攻击的伤害，同时降低目标10.4%物理防御，持续3秒",
    id = 0
    };
getRow(322006,3)->
    #player_skills_upgradingCfg {
    skillID = 322006,
    level = 3,
    player_level = 60,
    currency = [{1,70000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对前方矩形范围敌人造成2次166%物理攻击的伤害，同时降低目标10.8%物理防御，持续3秒",
    id = 0
    };
getRow(322006,4)->
    #player_skills_upgradingCfg {
    skillID = 322006,
    level = 4,
    player_level = 60,
    currency = [{1,90000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对前方矩形范围敌人造成2次174%物理攻击的伤害，同时降低目标11.2%物理防御，持续3秒",
    id = 0
    };
getRow(322006,5)->
    #player_skills_upgradingCfg {
    skillID = 322006,
    level = 5,
    player_level = 60,
    currency = [{1,110000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对前方矩形范围敌人造成2次182%物理攻击的伤害，同时降低目标11.6%物理防御，持续3秒",
    id = 0
    };
getRow(322006,6)->
    #player_skills_upgradingCfg {
    skillID = 322006,
    level = 6,
    player_level = 60,
    currency = [{1,130000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对前方矩形范围敌人造成2次190%物理攻击的伤害，同时降低目标12%物理防御，持续3秒",
    id = 0
    };
getRow(322006,7)->
    #player_skills_upgradingCfg {
    skillID = 322006,
    level = 7,
    player_level = 60,
    currency = [{1,150000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对前方矩形范围敌人造成2次198%物理攻击的伤害，同时降低目标12.4%物理防御，持续3秒",
    id = 0
    };
getRow(322006,8)->
    #player_skills_upgradingCfg {
    skillID = 322006,
    level = 8,
    player_level = 60,
    currency = [{1,170000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对前方矩形范围敌人造成2次206%物理攻击的伤害，同时降低目标12.8%物理防御，持续3秒",
    id = 0
    };
getRow(322006,9)->
    #player_skills_upgradingCfg {
    skillID = 322006,
    level = 9,
    player_level = 62,
    currency = [{1,190000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对前方矩形范围敌人造成2次214%物理攻击的伤害，同时降低目标13.2%物理防御，持续3秒",
    id = 0
    };
getRow(322006,10)->
    #player_skills_upgradingCfg {
    skillID = 322006,
    level = 10,
    player_level = 64,
    currency = [{1,210000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对前方矩形范围敌人造成2次222%物理攻击的伤害，同时降低目标13.6%物理防御，持续3秒",
    id = 0
    };
getRow(322006,11)->
    #player_skills_upgradingCfg {
    skillID = 322006,
    level = 11,
    player_level = 66,
    currency = [{1,230000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对前方矩形范围敌人造成2次230%物理攻击的伤害，同时降低目标14%物理防御，持续3秒",
    id = 0
    };
getRow(322006,12)->
    #player_skills_upgradingCfg {
    skillID = 322006,
    level = 12,
    player_level = 68,
    currency = [{1,250000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对前方矩形范围敌人造成2次238%物理攻击的伤害，同时降低目标14.4%物理防御，持续3秒",
    id = 0
    };
getRow(322006,13)->
    #player_skills_upgradingCfg {
    skillID = 322006,
    level = 13,
    player_level = 70,
    currency = [{1,270000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对前方矩形范围敌人造成2次246%物理攻击的伤害，同时降低目标14.8%物理防御，持续3秒",
    id = 0
    };
getRow(322006,14)->
    #player_skills_upgradingCfg {
    skillID = 322006,
    level = 14,
    player_level = 72,
    currency = [{1,290000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对前方矩形范围敌人造成2次254%物理攻击的伤害，同时降低目标15.2%物理防御，持续3秒",
    id = 0
    };
getRow(322006,15)->
    #player_skills_upgradingCfg {
    skillID = 322006,
    level = 15,
    player_level = 74,
    currency = [{1,310000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对前方矩形范围敌人造成2次262%物理攻击的伤害，同时降低目标15.6%物理防御，持续3秒",
    id = 0
    };
getRow(322006,16)->
    #player_skills_upgradingCfg {
    skillID = 322006,
    level = 16,
    player_level = 76,
    currency = [{1,330000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对前方矩形范围敌人造成2次270%物理攻击的伤害，同时降低目标16%物理防御，持续3秒",
    id = 0
    };
getRow(322006,17)->
    #player_skills_upgradingCfg {
    skillID = 322006,
    level = 17,
    player_level = 78,
    currency = [{1,350000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对前方矩形范围敌人造成2次278%物理攻击的伤害，同时降低目标16.4%物理防御，持续3秒",
    id = 0
    };
getRow(322006,18)->
    #player_skills_upgradingCfg {
    skillID = 322006,
    level = 18,
    player_level = 80,
    currency = [{1,370000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对前方矩形范围敌人造成2次286%物理攻击的伤害，同时降低目标16.8%物理防御，持续3秒",
    id = 0
    };
getRow(322006,19)->
    #player_skills_upgradingCfg {
    skillID = 322006,
    level = 19,
    player_level = 82,
    currency = [{1,390000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对前方矩形范围敌人造成2次294%物理攻击的伤害，同时降低目标17.2%物理防御，持续3秒",
    id = 0
    };
getRow(322006,20)->
    #player_skills_upgradingCfg {
    skillID = 322006,
    level = 20,
    player_level = 84,
    currency = [{1,410000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对前方矩形范围敌人造成2次302%物理攻击的伤害，同时降低目标17.6%物理防御，持续3秒",
    id = 0
    };
getRow(322006,21)->
    #player_skills_upgradingCfg {
    skillID = 322006,
    level = 21,
    player_level = 86,
    currency = [{1,430000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对前方矩形范围敌人造成2次310%物理攻击的伤害，同时降低目标18%物理防御，持续3秒",
    id = 0
    };
getRow(322006,22)->
    #player_skills_upgradingCfg {
    skillID = 322006,
    level = 22,
    player_level = 88,
    currency = [{1,450000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对前方矩形范围敌人造成2次318%物理攻击的伤害，同时降低目标18.4%物理防御，持续3秒",
    id = 0
    };
getRow(322006,23)->
    #player_skills_upgradingCfg {
    skillID = 322006,
    level = 23,
    player_level = 90,
    currency = [{1,470000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对前方矩形范围敌人造成2次326%物理攻击的伤害，同时降低目标18.8%物理防御，持续3秒",
    id = 0
    };
getRow(322006,24)->
    #player_skills_upgradingCfg {
    skillID = 322006,
    level = 24,
    player_level = 92,
    currency = [{1,490000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对前方矩形范围敌人造成2次334%物理攻击的伤害，同时降低目标19.2%物理防御，持续3秒",
    id = 0
    };
getRow(322006,25)->
    #player_skills_upgradingCfg {
    skillID = 322006,
    level = 25,
    player_level = 94,
    currency = [{1,510000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对前方矩形范围敌人造成2次342%物理攻击的伤害，同时降低目标19.6%物理防御，持续3秒",
    id = 0
    };
getRow(322007,1)->
    #player_skills_upgradingCfg {
    skillID = 322007,
    level = 1,
    player_level = 60,
    currency = [],
    skillcoin_cost = 1,
    item = [],
    describe = "对自身周围范围敌人造成5次80%物理攻击的伤害，同时减速30%，持续5秒",
    id = 0
    };
getRow(322007,2)->
    #player_skills_upgradingCfg {
    skillID = 322007,
    level = 2,
    player_level = 60,
    currency = [{1,50000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对自身周围范围敌人造成5次84%物理攻击的伤害，同时减速30%，持续5秒",
    id = 0
    };
getRow(322007,3)->
    #player_skills_upgradingCfg {
    skillID = 322007,
    level = 3,
    player_level = 60,
    currency = [{1,70000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对自身周围范围敌人造成5次88%物理攻击的伤害，同时减速30%，持续5秒",
    id = 0
    };
getRow(322007,4)->
    #player_skills_upgradingCfg {
    skillID = 322007,
    level = 4,
    player_level = 60,
    currency = [{1,90000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对自身周围范围敌人造成5次92%物理攻击的伤害，同时减速30%，持续5秒",
    id = 0
    };
getRow(322007,5)->
    #player_skills_upgradingCfg {
    skillID = 322007,
    level = 5,
    player_level = 60,
    currency = [{1,110000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对自身周围范围敌人造成5次96%物理攻击的伤害，同时减速30%，持续5秒",
    id = 0
    };
getRow(322007,6)->
    #player_skills_upgradingCfg {
    skillID = 322007,
    level = 6,
    player_level = 60,
    currency = [{1,130000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对自身周围范围敌人造成5次100%物理攻击的伤害，同时减速30%，持续5秒",
    id = 0
    };
getRow(322007,7)->
    #player_skills_upgradingCfg {
    skillID = 322007,
    level = 7,
    player_level = 60,
    currency = [{1,150000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对自身周围范围敌人造成5次104%物理攻击的伤害，同时减速30%，持续5秒",
    id = 0
    };
getRow(322007,8)->
    #player_skills_upgradingCfg {
    skillID = 322007,
    level = 8,
    player_level = 60,
    currency = [{1,170000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对自身周围范围敌人造成5次108%物理攻击的伤害，同时减速30%，持续5秒",
    id = 0
    };
getRow(322007,9)->
    #player_skills_upgradingCfg {
    skillID = 322007,
    level = 9,
    player_level = 62,
    currency = [{1,190000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对自身周围范围敌人造成5次112%物理攻击的伤害，同时减速30%，持续5秒",
    id = 0
    };
getRow(322007,10)->
    #player_skills_upgradingCfg {
    skillID = 322007,
    level = 10,
    player_level = 64,
    currency = [{1,210000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对自身周围范围敌人造成5次116%物理攻击的伤害，同时减速30%，持续5秒",
    id = 0
    };
getRow(322007,11)->
    #player_skills_upgradingCfg {
    skillID = 322007,
    level = 11,
    player_level = 66,
    currency = [{1,230000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对自身周围范围敌人造成5次120%物理攻击的伤害，同时减速30%，持续5秒",
    id = 0
    };
getRow(322007,12)->
    #player_skills_upgradingCfg {
    skillID = 322007,
    level = 12,
    player_level = 68,
    currency = [{1,250000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对自身周围范围敌人造成5次124%物理攻击的伤害，同时减速30%，持续5秒",
    id = 0
    };
getRow(322007,13)->
    #player_skills_upgradingCfg {
    skillID = 322007,
    level = 13,
    player_level = 70,
    currency = [{1,270000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对自身周围范围敌人造成5次128%物理攻击的伤害，同时减速30%，持续5秒",
    id = 0
    };
getRow(322007,14)->
    #player_skills_upgradingCfg {
    skillID = 322007,
    level = 14,
    player_level = 72,
    currency = [{1,290000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对自身周围范围敌人造成5次132%物理攻击的伤害，同时减速30%，持续5秒",
    id = 0
    };
getRow(322007,15)->
    #player_skills_upgradingCfg {
    skillID = 322007,
    level = 15,
    player_level = 74,
    currency = [{1,310000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对自身周围范围敌人造成5次136%物理攻击的伤害，同时减速30%，持续5秒",
    id = 0
    };
getRow(322007,16)->
    #player_skills_upgradingCfg {
    skillID = 322007,
    level = 16,
    player_level = 76,
    currency = [{1,330000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对自身周围范围敌人造成5次140%物理攻击的伤害，同时减速30%，持续5秒",
    id = 0
    };
getRow(322007,17)->
    #player_skills_upgradingCfg {
    skillID = 322007,
    level = 17,
    player_level = 78,
    currency = [{1,350000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对自身周围范围敌人造成5次144%物理攻击的伤害，同时减速30%，持续5秒",
    id = 0
    };
getRow(322007,18)->
    #player_skills_upgradingCfg {
    skillID = 322007,
    level = 18,
    player_level = 80,
    currency = [{1,370000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对自身周围范围敌人造成5次148%物理攻击的伤害，同时减速30%，持续5秒",
    id = 0
    };
getRow(322007,19)->
    #player_skills_upgradingCfg {
    skillID = 322007,
    level = 19,
    player_level = 82,
    currency = [{1,390000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对自身周围范围敌人造成5次152%物理攻击的伤害，同时减速30%，持续5秒",
    id = 0
    };
getRow(322007,20)->
    #player_skills_upgradingCfg {
    skillID = 322007,
    level = 20,
    player_level = 84,
    currency = [{1,410000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对自身周围范围敌人造成5次156%物理攻击的伤害，同时减速30%，持续5秒",
    id = 0
    };
getRow(322007,21)->
    #player_skills_upgradingCfg {
    skillID = 322007,
    level = 21,
    player_level = 86,
    currency = [{1,430000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对自身周围范围敌人造成5次160%物理攻击的伤害，同时减速30%，持续5秒",
    id = 0
    };
getRow(322007,22)->
    #player_skills_upgradingCfg {
    skillID = 322007,
    level = 22,
    player_level = 88,
    currency = [{1,450000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对自身周围范围敌人造成5次164%物理攻击的伤害，同时减速30%，持续5秒",
    id = 0
    };
getRow(322007,23)->
    #player_skills_upgradingCfg {
    skillID = 322007,
    level = 23,
    player_level = 90,
    currency = [{1,470000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对自身周围范围敌人造成5次168%物理攻击的伤害，同时减速30%，持续5秒",
    id = 0
    };
getRow(322007,24)->
    #player_skills_upgradingCfg {
    skillID = 322007,
    level = 24,
    player_level = 92,
    currency = [{1,490000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对自身周围范围敌人造成5次172%物理攻击的伤害，同时减速30%，持续5秒",
    id = 0
    };
getRow(322007,25)->
    #player_skills_upgradingCfg {
    skillID = 322007,
    level = 25,
    player_level = 94,
    currency = [{1,510000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对自身周围范围敌人造成5次176%物理攻击的伤害，同时减速30%，持续5秒",
    id = 0
    };
getRow(322008,1)->
    #player_skills_upgradingCfg {
    skillID = 322008,
    level = 1,
    player_level = 60,
    currency = [],
    skillcoin_cost = 1,
    item = [],
    describe = "对一个目标造成6次突刺，每次突刺造成105%物理攻击的伤害",
    id = 0
    };
getRow(322008,2)->
    #player_skills_upgradingCfg {
    skillID = 322008,
    level = 2,
    player_level = 60,
    currency = [{1,50000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对一个目标造成6次突刺，每次突刺造成108%物理攻击的伤害",
    id = 0
    };
getRow(322008,3)->
    #player_skills_upgradingCfg {
    skillID = 322008,
    level = 3,
    player_level = 60,
    currency = [{1,70000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对一个目标造成6次突刺，每次突刺造成111%物理攻击的伤害",
    id = 0
    };
getRow(322008,4)->
    #player_skills_upgradingCfg {
    skillID = 322008,
    level = 4,
    player_level = 60,
    currency = [{1,90000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对一个目标造成6次突刺，每次突刺造成114%物理攻击的伤害",
    id = 0
    };
getRow(322008,5)->
    #player_skills_upgradingCfg {
    skillID = 322008,
    level = 5,
    player_level = 60,
    currency = [{1,110000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对一个目标造成6次突刺，每次突刺造成117%物理攻击的伤害",
    id = 0
    };
getRow(322008,6)->
    #player_skills_upgradingCfg {
    skillID = 322008,
    level = 6,
    player_level = 60,
    currency = [{1,130000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对一个目标造成6次突刺，每次突刺造成120%物理攻击的伤害",
    id = 0
    };
getRow(322008,7)->
    #player_skills_upgradingCfg {
    skillID = 322008,
    level = 7,
    player_level = 60,
    currency = [{1,150000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对一个目标造成6次突刺，每次突刺造成123%物理攻击的伤害",
    id = 0
    };
getRow(322008,8)->
    #player_skills_upgradingCfg {
    skillID = 322008,
    level = 8,
    player_level = 60,
    currency = [{1,170000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对一个目标造成6次突刺，每次突刺造成126%物理攻击的伤害",
    id = 0
    };
getRow(322008,9)->
    #player_skills_upgradingCfg {
    skillID = 322008,
    level = 9,
    player_level = 62,
    currency = [{1,190000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对一个目标造成6次突刺，每次突刺造成129%物理攻击的伤害",
    id = 0
    };
getRow(322008,10)->
    #player_skills_upgradingCfg {
    skillID = 322008,
    level = 10,
    player_level = 64,
    currency = [{1,210000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对一个目标造成6次突刺，每次突刺造成132%物理攻击的伤害",
    id = 0
    };
getRow(322008,11)->
    #player_skills_upgradingCfg {
    skillID = 322008,
    level = 11,
    player_level = 66,
    currency = [{1,230000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对一个目标造成6次突刺，每次突刺造成135%物理攻击的伤害",
    id = 0
    };
getRow(322008,12)->
    #player_skills_upgradingCfg {
    skillID = 322008,
    level = 12,
    player_level = 68,
    currency = [{1,250000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对一个目标造成6次突刺，每次突刺造成138%物理攻击的伤害",
    id = 0
    };
getRow(322008,13)->
    #player_skills_upgradingCfg {
    skillID = 322008,
    level = 13,
    player_level = 70,
    currency = [{1,270000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对一个目标造成6次突刺，每次突刺造成141%物理攻击的伤害",
    id = 0
    };
getRow(322008,14)->
    #player_skills_upgradingCfg {
    skillID = 322008,
    level = 14,
    player_level = 72,
    currency = [{1,290000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对一个目标造成6次突刺，每次突刺造成144%物理攻击的伤害",
    id = 0
    };
getRow(322008,15)->
    #player_skills_upgradingCfg {
    skillID = 322008,
    level = 15,
    player_level = 74,
    currency = [{1,310000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对一个目标造成6次突刺，每次突刺造成147%物理攻击的伤害",
    id = 0
    };
getRow(322008,16)->
    #player_skills_upgradingCfg {
    skillID = 322008,
    level = 16,
    player_level = 76,
    currency = [{1,330000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对一个目标造成6次突刺，每次突刺造成150%物理攻击的伤害",
    id = 0
    };
getRow(322008,17)->
    #player_skills_upgradingCfg {
    skillID = 322008,
    level = 17,
    player_level = 78,
    currency = [{1,350000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对一个目标造成6次突刺，每次突刺造成153%物理攻击的伤害",
    id = 0
    };
getRow(322008,18)->
    #player_skills_upgradingCfg {
    skillID = 322008,
    level = 18,
    player_level = 80,
    currency = [{1,370000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对一个目标造成6次突刺，每次突刺造成156%物理攻击的伤害",
    id = 0
    };
getRow(322008,19)->
    #player_skills_upgradingCfg {
    skillID = 322008,
    level = 19,
    player_level = 82,
    currency = [{1,390000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对一个目标造成6次突刺，每次突刺造成159%物理攻击的伤害",
    id = 0
    };
getRow(322008,20)->
    #player_skills_upgradingCfg {
    skillID = 322008,
    level = 20,
    player_level = 84,
    currency = [{1,410000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对一个目标造成6次突刺，每次突刺造成162%物理攻击的伤害",
    id = 0
    };
getRow(322008,21)->
    #player_skills_upgradingCfg {
    skillID = 322008,
    level = 21,
    player_level = 86,
    currency = [{1,430000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对一个目标造成6次突刺，每次突刺造成165%物理攻击的伤害",
    id = 0
    };
getRow(322008,22)->
    #player_skills_upgradingCfg {
    skillID = 322008,
    level = 22,
    player_level = 88,
    currency = [{1,450000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对一个目标造成6次突刺，每次突刺造成168%物理攻击的伤害",
    id = 0
    };
getRow(322008,23)->
    #player_skills_upgradingCfg {
    skillID = 322008,
    level = 23,
    player_level = 90,
    currency = [{1,470000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对一个目标造成6次突刺，每次突刺造成171%物理攻击的伤害",
    id = 0
    };
getRow(322008,24)->
    #player_skills_upgradingCfg {
    skillID = 322008,
    level = 24,
    player_level = 92,
    currency = [{1,490000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对一个目标造成6次突刺，每次突刺造成174%物理攻击的伤害",
    id = 0
    };
getRow(322008,25)->
    #player_skills_upgradingCfg {
    skillID = 322008,
    level = 25,
    player_level = 94,
    currency = [{1,510000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对一个目标造成6次突刺，每次突刺造成177%物理攻击的伤害",
    id = 0
    };
getRow(322009,1)->
    #player_skills_upgradingCfg {
    skillID = 322009,
    level = 1,
    player_level = 60,
    currency = [],
    skillcoin_cost = 1,
    item = [],
    describe = "隐身，不被攻击，在时间内，主动发起攻击则结束该状态，持续5秒",
    id = 0
    };
getRow(322009,2)->
    #player_skills_upgradingCfg {
    skillID = 322009,
    level = 2,
    player_level = 60,
    currency = [{1,70000}],
    skillcoin_cost = 1,
    item = [],
    describe = "隐身，不被攻击，在时间内，主动发起攻击则结束该状态，持续6秒",
    id = 0
    };
getRow(322009,3)->
    #player_skills_upgradingCfg {
    skillID = 322009,
    level = 3,
    player_level = 60,
    currency = [{1,110000}],
    skillcoin_cost = 1,
    item = [],
    describe = "隐身，不被攻击，在时间内，主动发起攻击则结束该状态，持续7秒",
    id = 0
    };
getRow(322009,4)->
    #player_skills_upgradingCfg {
    skillID = 322009,
    level = 4,
    player_level = 60,
    currency = [{1,150000}],
    skillcoin_cost = 1,
    item = [],
    describe = "隐身，不被攻击，在时间内，主动发起攻击则结束该状态，持续8秒",
    id = 0
    };
getRow(322009,5)->
    #player_skills_upgradingCfg {
    skillID = 322009,
    level = 5,
    player_level = 62,
    currency = [{1,190000}],
    skillcoin_cost = 1,
    item = [],
    describe = "隐身，不被攻击，在时间内，主动发起攻击则结束该状态，持续9秒",
    id = 0
    };
getRow(322009,6)->
    #player_skills_upgradingCfg {
    skillID = 322009,
    level = 6,
    player_level = 66,
    currency = [{1,230000}],
    skillcoin_cost = 1,
    item = [],
    describe = "隐身，不被攻击，在时间内，主动发起攻击则结束该状态，持续10秒",
    id = 0
    };
getRow(322009,7)->
    #player_skills_upgradingCfg {
    skillID = 322009,
    level = 7,
    player_level = 70,
    currency = [{1,270000}],
    skillcoin_cost = 1,
    item = [],
    describe = "隐身，不被攻击，在时间内，主动发起攻击则结束该状态，持续11秒",
    id = 0
    };
getRow(322009,8)->
    #player_skills_upgradingCfg {
    skillID = 322009,
    level = 8,
    player_level = 74,
    currency = [{1,310000}],
    skillcoin_cost = 1,
    item = [],
    describe = "隐身，不被攻击，在时间内，主动发起攻击则结束该状态，持续12秒",
    id = 0
    };
getRow(322009,9)->
    #player_skills_upgradingCfg {
    skillID = 322009,
    level = 9,
    player_level = 78,
    currency = [{1,350000}],
    skillcoin_cost = 1,
    item = [],
    describe = "隐身，不被攻击，在时间内，主动发起攻击则结束该状态，持续13秒",
    id = 0
    };
getRow(322009,10)->
    #player_skills_upgradingCfg {
    skillID = 322009,
    level = 10,
    player_level = 82,
    currency = [{1,390000}],
    skillcoin_cost = 1,
    item = [],
    describe = "隐身，不被攻击，在时间内，主动发起攻击则结束该状态，持续14秒",
    id = 0
    };
getRow(322009,11)->
    #player_skills_upgradingCfg {
    skillID = 322009,
    level = 11,
    player_level = 86,
    currency = [{1,430000}],
    skillcoin_cost = 1,
    item = [],
    describe = "隐身，不被攻击，在时间内，主动发起攻击则结束该状态，持续15秒",
    id = 0
    };
getRow(322010,1)->
    #player_skills_upgradingCfg {
    skillID = 322010,
    level = 1,
    player_level = 60,
    currency = [],
    skillcoin_cost = 1,
    item = [],
    describe = "增加自身及周围队友的暴伤等级15%，持续10分钟",
    id = 0
    };
getRow(322010,2)->
    #player_skills_upgradingCfg {
    skillID = 322010,
    level = 2,
    player_level = 60,
    currency = [{1,70000}],
    skillcoin_cost = 1,
    item = [],
    describe = "增加自身及周围队友的暴伤等级16%，持续10分钟",
    id = 0
    };
getRow(322010,3)->
    #player_skills_upgradingCfg {
    skillID = 322010,
    level = 3,
    player_level = 60,
    currency = [{1,110000}],
    skillcoin_cost = 1,
    item = [],
    describe = "增加自身及周围队友的暴伤等级17%，持续10分钟",
    id = 0
    };
getRow(322010,4)->
    #player_skills_upgradingCfg {
    skillID = 322010,
    level = 4,
    player_level = 60,
    currency = [{1,150000}],
    skillcoin_cost = 1,
    item = [],
    describe = "增加自身及周围队友的暴伤等级18%，持续10分钟",
    id = 0
    };
getRow(322010,5)->
    #player_skills_upgradingCfg {
    skillID = 322010,
    level = 5,
    player_level = 62,
    currency = [{1,190000}],
    skillcoin_cost = 1,
    item = [],
    describe = "增加自身及周围队友的暴伤等级19%，持续10分钟",
    id = 0
    };
getRow(322010,6)->
    #player_skills_upgradingCfg {
    skillID = 322010,
    level = 6,
    player_level = 66,
    currency = [{1,230000}],
    skillcoin_cost = 1,
    item = [],
    describe = "增加自身及周围队友的暴伤等级20%，持续10分钟",
    id = 0
    };
getRow(322010,7)->
    #player_skills_upgradingCfg {
    skillID = 322010,
    level = 7,
    player_level = 70,
    currency = [{1,270000}],
    skillcoin_cost = 1,
    item = [],
    describe = "增加自身及周围队友的暴伤等级21%，持续10分钟",
    id = 0
    };
getRow(322010,8)->
    #player_skills_upgradingCfg {
    skillID = 322010,
    level = 8,
    player_level = 74,
    currency = [{1,310000}],
    skillcoin_cost = 1,
    item = [],
    describe = "增加自身及周围队友的暴伤等级22%，持续10分钟",
    id = 0
    };
getRow(322010,9)->
    #player_skills_upgradingCfg {
    skillID = 322010,
    level = 9,
    player_level = 78,
    currency = [{1,350000}],
    skillcoin_cost = 1,
    item = [],
    describe = "增加自身及周围队友的暴伤等级23%，持续10分钟",
    id = 0
    };
getRow(322010,10)->
    #player_skills_upgradingCfg {
    skillID = 322010,
    level = 10,
    player_level = 82,
    currency = [{1,390000}],
    skillcoin_cost = 1,
    item = [],
    describe = "增加自身及周围队友的暴伤等级24%，持续10分钟",
    id = 0
    };
getRow(322010,11)->
    #player_skills_upgradingCfg {
    skillID = 322010,
    level = 11,
    player_level = 86,
    currency = [{1,430000}],
    skillcoin_cost = 1,
    item = [],
    describe = "增加自身及周围队友的暴伤等级25%，持续10分钟",
    id = 0
    };
getRow(322011,1)->
    #player_skills_upgradingCfg {
    skillID = 322011,
    level = 1,
    player_level = 60,
    currency = [],
    skillcoin_cost = 1,
    item = [],
    describe = "增加自身的暴击等级30%，持续10秒",
    id = 0
    };
getRow(322011,2)->
    #player_skills_upgradingCfg {
    skillID = 322011,
    level = 2,
    player_level = 60,
    currency = [{1,70000}],
    skillcoin_cost = 1,
    item = [],
    describe = "增加自身的暴击等级33%，持续10秒",
    id = 0
    };
getRow(322011,3)->
    #player_skills_upgradingCfg {
    skillID = 322011,
    level = 3,
    player_level = 60,
    currency = [{1,110000}],
    skillcoin_cost = 1,
    item = [],
    describe = "增加自身的暴击等级36%，持续10秒",
    id = 0
    };
getRow(322011,4)->
    #player_skills_upgradingCfg {
    skillID = 322011,
    level = 4,
    player_level = 60,
    currency = [{1,150000}],
    skillcoin_cost = 1,
    item = [],
    describe = "增加自身的暴击等级39%，持续10秒",
    id = 0
    };
getRow(322011,5)->
    #player_skills_upgradingCfg {
    skillID = 322011,
    level = 5,
    player_level = 62,
    currency = [{1,190000}],
    skillcoin_cost = 1,
    item = [],
    describe = "增加自身的暴击等级42%，持续10秒",
    id = 0
    };
getRow(322011,6)->
    #player_skills_upgradingCfg {
    skillID = 322011,
    level = 6,
    player_level = 66,
    currency = [{1,230000}],
    skillcoin_cost = 1,
    item = [],
    describe = "增加自身的暴击等级45%，持续10秒",
    id = 0
    };
getRow(322011,7)->
    #player_skills_upgradingCfg {
    skillID = 322011,
    level = 7,
    player_level = 70,
    currency = [{1,270000}],
    skillcoin_cost = 1,
    item = [],
    describe = "增加自身的暴击等级48%，持续10秒",
    id = 0
    };
getRow(322011,8)->
    #player_skills_upgradingCfg {
    skillID = 322011,
    level = 8,
    player_level = 74,
    currency = [{1,310000}],
    skillcoin_cost = 1,
    item = [],
    describe = "增加自身的暴击等级51%，持续10秒",
    id = 0
    };
getRow(322011,9)->
    #player_skills_upgradingCfg {
    skillID = 322011,
    level = 9,
    player_level = 78,
    currency = [{1,350000}],
    skillcoin_cost = 1,
    item = [],
    describe = "增加自身的暴击等级54%，持续10秒",
    id = 0
    };
getRow(322011,10)->
    #player_skills_upgradingCfg {
    skillID = 322011,
    level = 10,
    player_level = 82,
    currency = [{1,390000}],
    skillcoin_cost = 1,
    item = [],
    describe = "增加自身的暴击等级57%，持续10秒",
    id = 0
    };
getRow(322011,11)->
    #player_skills_upgradingCfg {
    skillID = 322011,
    level = 11,
    player_level = 86,
    currency = [{1,430000}],
    skillcoin_cost = 1,
    item = [],
    describe = "增加自身的暴击等级60%，持续10秒",
    id = 0
    };
getRow(323004,1)->
    #player_skills_upgradingCfg {
    skillID = 323004,
    level = 1,
    player_level = 60,
    currency = [],
    skillcoin_cost = 1,
    item = [],
    describe = "对自身周围的敌人造成5次80%物理攻击的伤害并减速、同时降低受击敌人的双防10%,持续3秒",
    id = 0
    };
getRow(323004,2)->
    #player_skills_upgradingCfg {
    skillID = 323004,
    level = 2,
    player_level = 60,
    currency = [{1,50000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对自身周围的敌人造成5次84%物理攻击的伤害并减速、同时降低受击敌人的双防10.4%,持续3秒",
    id = 0
    };
getRow(323004,3)->
    #player_skills_upgradingCfg {
    skillID = 323004,
    level = 3,
    player_level = 60,
    currency = [{1,70000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对自身周围的敌人造成5次88%物理攻击的伤害并减速、同时降低受击敌人的双防10.8%,持续3秒",
    id = 0
    };
getRow(323004,4)->
    #player_skills_upgradingCfg {
    skillID = 323004,
    level = 4,
    player_level = 60,
    currency = [{1,90000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对自身周围的敌人造成5次92%物理攻击的伤害并减速、同时降低受击敌人的双防11.2%,持续3秒",
    id = 0
    };
getRow(323004,5)->
    #player_skills_upgradingCfg {
    skillID = 323004,
    level = 5,
    player_level = 60,
    currency = [{1,110000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对自身周围的敌人造成5次96%物理攻击的伤害并减速、同时降低受击敌人的双防11.6%,持续3秒",
    id = 0
    };
getRow(323004,6)->
    #player_skills_upgradingCfg {
    skillID = 323004,
    level = 6,
    player_level = 60,
    currency = [{1,130000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对自身周围的敌人造成5次100%物理攻击的伤害并减速、同时降低受击敌人的双防12%,持续3秒",
    id = 0
    };
getRow(323004,7)->
    #player_skills_upgradingCfg {
    skillID = 323004,
    level = 7,
    player_level = 60,
    currency = [{1,150000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对自身周围的敌人造成5次104%物理攻击的伤害并减速、同时降低受击敌人的双防12.4%,持续3秒",
    id = 0
    };
getRow(323004,8)->
    #player_skills_upgradingCfg {
    skillID = 323004,
    level = 8,
    player_level = 60,
    currency = [{1,170000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对自身周围的敌人造成5次108%物理攻击的伤害并减速、同时降低受击敌人的双防12.8%,持续3秒",
    id = 0
    };
getRow(323004,9)->
    #player_skills_upgradingCfg {
    skillID = 323004,
    level = 9,
    player_level = 62,
    currency = [{1,190000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对自身周围的敌人造成5次112%物理攻击的伤害并减速、同时降低受击敌人的双防13.2%,持续3秒",
    id = 0
    };
getRow(323004,10)->
    #player_skills_upgradingCfg {
    skillID = 323004,
    level = 10,
    player_level = 64,
    currency = [{1,210000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对自身周围的敌人造成5次116%物理攻击的伤害并减速、同时降低受击敌人的双防13.6%,持续3秒",
    id = 0
    };
getRow(323004,11)->
    #player_skills_upgradingCfg {
    skillID = 323004,
    level = 11,
    player_level = 66,
    currency = [{1,230000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对自身周围的敌人造成5次120%物理攻击的伤害并减速、同时降低受击敌人的双防14%,持续3秒",
    id = 0
    };
getRow(323004,12)->
    #player_skills_upgradingCfg {
    skillID = 323004,
    level = 12,
    player_level = 68,
    currency = [{1,250000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对自身周围的敌人造成5次124%物理攻击的伤害并减速、同时降低受击敌人的双防14.4%,持续3秒",
    id = 0
    };
getRow(323004,13)->
    #player_skills_upgradingCfg {
    skillID = 323004,
    level = 13,
    player_level = 70,
    currency = [{1,270000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对自身周围的敌人造成5次128%物理攻击的伤害并减速、同时降低受击敌人的双防14.8%,持续3秒",
    id = 0
    };
getRow(323004,14)->
    #player_skills_upgradingCfg {
    skillID = 323004,
    level = 14,
    player_level = 72,
    currency = [{1,290000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对自身周围的敌人造成5次132%物理攻击的伤害并减速、同时降低受击敌人的双防15.2%,持续3秒",
    id = 0
    };
getRow(323004,15)->
    #player_skills_upgradingCfg {
    skillID = 323004,
    level = 15,
    player_level = 74,
    currency = [{1,310000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对自身周围的敌人造成5次136%物理攻击的伤害并减速、同时降低受击敌人的双防15.6%,持续3秒",
    id = 0
    };
getRow(323004,16)->
    #player_skills_upgradingCfg {
    skillID = 323004,
    level = 16,
    player_level = 76,
    currency = [{1,330000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对自身周围的敌人造成5次140%物理攻击的伤害并减速、同时降低受击敌人的双防16%,持续3秒",
    id = 0
    };
getRow(323004,17)->
    #player_skills_upgradingCfg {
    skillID = 323004,
    level = 17,
    player_level = 78,
    currency = [{1,350000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对自身周围的敌人造成5次144%物理攻击的伤害并减速、同时降低受击敌人的双防16.4%,持续3秒",
    id = 0
    };
getRow(323004,18)->
    #player_skills_upgradingCfg {
    skillID = 323004,
    level = 18,
    player_level = 80,
    currency = [{1,370000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对自身周围的敌人造成5次148%物理攻击的伤害并减速、同时降低受击敌人的双防16.8%,持续3秒",
    id = 0
    };
getRow(323004,19)->
    #player_skills_upgradingCfg {
    skillID = 323004,
    level = 19,
    player_level = 82,
    currency = [{1,390000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对自身周围的敌人造成5次152%物理攻击的伤害并减速、同时降低受击敌人的双防17.2%,持续3秒",
    id = 0
    };
getRow(323004,20)->
    #player_skills_upgradingCfg {
    skillID = 323004,
    level = 20,
    player_level = 84,
    currency = [{1,410000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对自身周围的敌人造成5次156%物理攻击的伤害并减速、同时降低受击敌人的双防17.6%,持续3秒",
    id = 0
    };
getRow(323004,21)->
    #player_skills_upgradingCfg {
    skillID = 323004,
    level = 21,
    player_level = 86,
    currency = [{1,430000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对自身周围的敌人造成5次160%物理攻击的伤害并减速、同时降低受击敌人的双防18%,持续3秒",
    id = 0
    };
getRow(323004,22)->
    #player_skills_upgradingCfg {
    skillID = 323004,
    level = 22,
    player_level = 88,
    currency = [{1,450000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对自身周围的敌人造成5次164%物理攻击的伤害并减速、同时降低受击敌人的双防18.4%,持续3秒",
    id = 0
    };
getRow(323004,23)->
    #player_skills_upgradingCfg {
    skillID = 323004,
    level = 23,
    player_level = 90,
    currency = [{1,470000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对自身周围的敌人造成5次168%物理攻击的伤害并减速、同时降低受击敌人的双防18.8%,持续3秒",
    id = 0
    };
getRow(323004,24)->
    #player_skills_upgradingCfg {
    skillID = 323004,
    level = 24,
    player_level = 92,
    currency = [{1,490000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对自身周围的敌人造成5次172%物理攻击的伤害并减速、同时降低受击敌人的双防19.2%,持续3秒",
    id = 0
    };
getRow(323004,25)->
    #player_skills_upgradingCfg {
    skillID = 323004,
    level = 25,
    player_level = 94,
    currency = [{1,510000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对自身周围的敌人造成5次176%物理攻击的伤害并减速、同时降低受击敌人的双防19.6%,持续3秒",
    id = 0
    };
getRow(323005,1)->
    #player_skills_upgradingCfg {
    skillID = 323005,
    level = 1,
    player_level = 60,
    currency = [],
    skillcoin_cost = 1,
    item = [],
    describe = "瞬间突袭造成前方矩形范围内敌人231%物理攻击的伤害，并造成流血，持续时间3秒",
    id = 0
    };
getRow(323005,2)->
    #player_skills_upgradingCfg {
    skillID = 323005,
    level = 2,
    player_level = 60,
    currency = [{1,50000}],
    skillcoin_cost = 1,
    item = [],
    describe = "瞬间突袭造成前方矩形范围内敌人243%物理攻击的伤害，并造成流血，持续时间3秒",
    id = 0
    };
getRow(323005,3)->
    #player_skills_upgradingCfg {
    skillID = 323005,
    level = 3,
    player_level = 60,
    currency = [{1,70000}],
    skillcoin_cost = 1,
    item = [],
    describe = "瞬间突袭造成前方矩形范围内敌人256%物理攻击的伤害，并造成流血，持续时间3秒",
    id = 0
    };
getRow(323005,4)->
    #player_skills_upgradingCfg {
    skillID = 323005,
    level = 4,
    player_level = 60,
    currency = [{1,90000}],
    skillcoin_cost = 1,
    item = [],
    describe = "瞬间突袭造成前方矩形范围内敌人269%物理攻击的伤害，并造成流血，持续时间3秒",
    id = 0
    };
getRow(323005,5)->
    #player_skills_upgradingCfg {
    skillID = 323005,
    level = 5,
    player_level = 60,
    currency = [{1,110000}],
    skillcoin_cost = 1,
    item = [],
    describe = "瞬间突袭造成前方矩形范围内敌人282%物理攻击的伤害，并造成流血，持续时间3秒",
    id = 0
    };
getRow(323005,6)->
    #player_skills_upgradingCfg {
    skillID = 323005,
    level = 6,
    player_level = 60,
    currency = [{1,130000}],
    skillcoin_cost = 1,
    item = [],
    describe = "瞬间突袭造成前方矩形范围内敌人295%物理攻击的伤害，并造成流血，持续时间3秒",
    id = 0
    };
getRow(323005,7)->
    #player_skills_upgradingCfg {
    skillID = 323005,
    level = 7,
    player_level = 60,
    currency = [{1,150000}],
    skillcoin_cost = 1,
    item = [],
    describe = "瞬间突袭造成前方矩形范围内敌人308%物理攻击的伤害，并造成流血，持续时间3秒",
    id = 0
    };
getRow(323005,8)->
    #player_skills_upgradingCfg {
    skillID = 323005,
    level = 8,
    player_level = 60,
    currency = [{1,170000}],
    skillcoin_cost = 1,
    item = [],
    describe = "瞬间突袭造成前方矩形范围内敌人321%物理攻击的伤害，并造成流血，持续时间3秒",
    id = 0
    };
getRow(323005,9)->
    #player_skills_upgradingCfg {
    skillID = 323005,
    level = 9,
    player_level = 62,
    currency = [{1,190000}],
    skillcoin_cost = 1,
    item = [],
    describe = "瞬间突袭造成前方矩形范围内敌人334%物理攻击的伤害，并造成流血，持续时间3秒",
    id = 0
    };
getRow(323005,10)->
    #player_skills_upgradingCfg {
    skillID = 323005,
    level = 10,
    player_level = 64,
    currency = [{1,210000}],
    skillcoin_cost = 1,
    item = [],
    describe = "瞬间突袭造成前方矩形范围内敌人347%物理攻击的伤害，并造成流血，持续时间3秒",
    id = 0
    };
getRow(323005,11)->
    #player_skills_upgradingCfg {
    skillID = 323005,
    level = 11,
    player_level = 66,
    currency = [{1,230000}],
    skillcoin_cost = 1,
    item = [],
    describe = "瞬间突袭造成前方矩形范围内敌人360%物理攻击的伤害，并造成流血，持续时间3秒",
    id = 0
    };
getRow(323005,12)->
    #player_skills_upgradingCfg {
    skillID = 323005,
    level = 12,
    player_level = 68,
    currency = [{1,250000}],
    skillcoin_cost = 1,
    item = [],
    describe = "瞬间突袭造成前方矩形范围内敌人373%物理攻击的伤害，并造成流血，持续时间3秒",
    id = 0
    };
getRow(323005,13)->
    #player_skills_upgradingCfg {
    skillID = 323005,
    level = 13,
    player_level = 70,
    currency = [{1,270000}],
    skillcoin_cost = 1,
    item = [],
    describe = "瞬间突袭造成前方矩形范围内敌人386%物理攻击的伤害，并造成流血，持续时间3秒",
    id = 0
    };
getRow(323005,14)->
    #player_skills_upgradingCfg {
    skillID = 323005,
    level = 14,
    player_level = 72,
    currency = [{1,290000}],
    skillcoin_cost = 1,
    item = [],
    describe = "瞬间突袭造成前方矩形范围内敌人399%物理攻击的伤害，并造成流血，持续时间3秒",
    id = 0
    };
getRow(323005,15)->
    #player_skills_upgradingCfg {
    skillID = 323005,
    level = 15,
    player_level = 74,
    currency = [{1,310000}],
    skillcoin_cost = 1,
    item = [],
    describe = "瞬间突袭造成前方矩形范围内敌人412%物理攻击的伤害，并造成流血，持续时间3秒",
    id = 0
    };
getRow(323005,16)->
    #player_skills_upgradingCfg {
    skillID = 323005,
    level = 16,
    player_level = 76,
    currency = [{1,330000}],
    skillcoin_cost = 1,
    item = [],
    describe = "瞬间突袭造成前方矩形范围内敌人425%物理攻击的伤害，并造成流血，持续时间3秒",
    id = 0
    };
getRow(323005,17)->
    #player_skills_upgradingCfg {
    skillID = 323005,
    level = 17,
    player_level = 78,
    currency = [{1,350000}],
    skillcoin_cost = 1,
    item = [],
    describe = "瞬间突袭造成前方矩形范围内敌人438%物理攻击的伤害，并造成流血，持续时间3秒",
    id = 0
    };
getRow(323005,18)->
    #player_skills_upgradingCfg {
    skillID = 323005,
    level = 18,
    player_level = 80,
    currency = [{1,370000}],
    skillcoin_cost = 1,
    item = [],
    describe = "瞬间突袭造成前方矩形范围内敌人451%物理攻击的伤害，并造成流血，持续时间3秒",
    id = 0
    };
getRow(323005,19)->
    #player_skills_upgradingCfg {
    skillID = 323005,
    level = 19,
    player_level = 82,
    currency = [{1,390000}],
    skillcoin_cost = 1,
    item = [],
    describe = "瞬间突袭造成前方矩形范围内敌人464%物理攻击的伤害，并造成流血，持续时间3秒",
    id = 0
    };
getRow(323005,20)->
    #player_skills_upgradingCfg {
    skillID = 323005,
    level = 20,
    player_level = 84,
    currency = [{1,410000}],
    skillcoin_cost = 1,
    item = [],
    describe = "瞬间突袭造成前方矩形范围内敌人477%物理攻击的伤害，并造成流血，持续时间3秒",
    id = 0
    };
getRow(323005,21)->
    #player_skills_upgradingCfg {
    skillID = 323005,
    level = 21,
    player_level = 86,
    currency = [{1,430000}],
    skillcoin_cost = 1,
    item = [],
    describe = "瞬间突袭造成前方矩形范围内敌人490%物理攻击的伤害，并造成流血，持续时间3秒",
    id = 0
    };
getRow(323005,22)->
    #player_skills_upgradingCfg {
    skillID = 323005,
    level = 22,
    player_level = 88,
    currency = [{1,450000}],
    skillcoin_cost = 1,
    item = [],
    describe = "瞬间突袭造成前方矩形范围内敌人502%物理攻击的伤害，并造成流血，持续时间3秒",
    id = 0
    };
getRow(323005,23)->
    #player_skills_upgradingCfg {
    skillID = 323005,
    level = 23,
    player_level = 90,
    currency = [{1,470000}],
    skillcoin_cost = 1,
    item = [],
    describe = "瞬间突袭造成前方矩形范围内敌人515%物理攻击的伤害，并造成流血，持续时间3秒",
    id = 0
    };
getRow(323005,24)->
    #player_skills_upgradingCfg {
    skillID = 323005,
    level = 24,
    player_level = 92,
    currency = [{1,490000}],
    skillcoin_cost = 1,
    item = [],
    describe = "瞬间突袭造成前方矩形范围内敌人528%物理攻击的伤害，并造成流血，持续时间3秒",
    id = 0
    };
getRow(323005,25)->
    #player_skills_upgradingCfg {
    skillID = 323005,
    level = 25,
    player_level = 94,
    currency = [{1,510000}],
    skillcoin_cost = 1,
    item = [],
    describe = "瞬间突袭造成前方矩形范围内敌人541%物理攻击的伤害，并造成流血，持续时间3秒",
    id = 0
    };
getRow(323006,1)->
    #player_skills_upgradingCfg {
    skillID = 323006,
    level = 1,
    player_level = 60,
    currency = [],
    skillcoin_cost = 1,
    item = [],
    describe = "对前方范围敌人造成300%物理攻击的伤害，同时降低魔法攻击力5%，持续时间3秒",
    id = 0
    };
getRow(323006,2)->
    #player_skills_upgradingCfg {
    skillID = 323006,
    level = 2,
    player_level = 60,
    currency = [{1,50000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对前方范围敌人造成318%物理攻击的伤害，同时降低魔法攻击力5.3%，持续时间3秒",
    id = 0
    };
getRow(323006,3)->
    #player_skills_upgradingCfg {
    skillID = 323006,
    level = 3,
    player_level = 60,
    currency = [{1,70000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对前方范围敌人造成336%物理攻击的伤害，同时降低魔法攻击力5.6%，持续时间3秒",
    id = 0
    };
getRow(323006,4)->
    #player_skills_upgradingCfg {
    skillID = 323006,
    level = 4,
    player_level = 60,
    currency = [{1,90000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对前方范围敌人造成354%物理攻击的伤害，同时降低魔法攻击力5.9%，持续时间3秒",
    id = 0
    };
getRow(323006,5)->
    #player_skills_upgradingCfg {
    skillID = 323006,
    level = 5,
    player_level = 60,
    currency = [{1,110000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对前方范围敌人造成372%物理攻击的伤害，同时降低魔法攻击力6.2%，持续时间3秒",
    id = 0
    };
getRow(323006,6)->
    #player_skills_upgradingCfg {
    skillID = 323006,
    level = 6,
    player_level = 60,
    currency = [{1,130000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对前方范围敌人造成390%物理攻击的伤害，同时降低魔法攻击力6.5%，持续时间3秒",
    id = 0
    };
getRow(323006,7)->
    #player_skills_upgradingCfg {
    skillID = 323006,
    level = 7,
    player_level = 60,
    currency = [{1,150000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对前方范围敌人造成408%物理攻击的伤害，同时降低魔法攻击力6.8%，持续时间3秒",
    id = 0
    };
getRow(323006,8)->
    #player_skills_upgradingCfg {
    skillID = 323006,
    level = 8,
    player_level = 60,
    currency = [{1,170000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对前方范围敌人造成426%物理攻击的伤害，同时降低魔法攻击力7.1%，持续时间3秒",
    id = 0
    };
getRow(323006,9)->
    #player_skills_upgradingCfg {
    skillID = 323006,
    level = 9,
    player_level = 62,
    currency = [{1,190000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对前方范围敌人造成444%物理攻击的伤害，同时降低魔法攻击力7.4%，持续时间3秒",
    id = 0
    };
getRow(323006,10)->
    #player_skills_upgradingCfg {
    skillID = 323006,
    level = 10,
    player_level = 64,
    currency = [{1,210000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对前方范围敌人造成462%物理攻击的伤害，同时降低魔法攻击力7.7%，持续时间3秒",
    id = 0
    };
getRow(323006,11)->
    #player_skills_upgradingCfg {
    skillID = 323006,
    level = 11,
    player_level = 66,
    currency = [{1,230000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对前方范围敌人造成480%物理攻击的伤害，同时降低魔法攻击力8%，持续时间3秒",
    id = 0
    };
getRow(323006,12)->
    #player_skills_upgradingCfg {
    skillID = 323006,
    level = 12,
    player_level = 68,
    currency = [{1,250000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对前方范围敌人造成498%物理攻击的伤害，同时降低魔法攻击力8.3%，持续时间3秒",
    id = 0
    };
getRow(323006,13)->
    #player_skills_upgradingCfg {
    skillID = 323006,
    level = 13,
    player_level = 70,
    currency = [{1,270000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对前方范围敌人造成516%物理攻击的伤害，同时降低魔法攻击力8.6%，持续时间3秒",
    id = 0
    };
getRow(323006,14)->
    #player_skills_upgradingCfg {
    skillID = 323006,
    level = 14,
    player_level = 72,
    currency = [{1,290000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对前方范围敌人造成534%物理攻击的伤害，同时降低魔法攻击力8.9%，持续时间3秒",
    id = 0
    };
getRow(323006,15)->
    #player_skills_upgradingCfg {
    skillID = 323006,
    level = 15,
    player_level = 74,
    currency = [{1,310000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对前方范围敌人造成552%物理攻击的伤害，同时降低魔法攻击力9.2%，持续时间3秒",
    id = 0
    };
getRow(323006,16)->
    #player_skills_upgradingCfg {
    skillID = 323006,
    level = 16,
    player_level = 76,
    currency = [{1,330000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对前方范围敌人造成570%物理攻击的伤害，同时降低魔法攻击力9.5%，持续时间3秒",
    id = 0
    };
getRow(323006,17)->
    #player_skills_upgradingCfg {
    skillID = 323006,
    level = 17,
    player_level = 78,
    currency = [{1,350000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对前方范围敌人造成588%物理攻击的伤害，同时降低魔法攻击力9.8%，持续时间3秒",
    id = 0
    };
getRow(323006,18)->
    #player_skills_upgradingCfg {
    skillID = 323006,
    level = 18,
    player_level = 80,
    currency = [{1,370000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对前方范围敌人造成606%物理攻击的伤害，同时降低魔法攻击力10.1%，持续时间3秒",
    id = 0
    };
getRow(323006,19)->
    #player_skills_upgradingCfg {
    skillID = 323006,
    level = 19,
    player_level = 82,
    currency = [{1,390000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对前方范围敌人造成624%物理攻击的伤害，同时降低魔法攻击力10.4%，持续时间3秒",
    id = 0
    };
getRow(323006,20)->
    #player_skills_upgradingCfg {
    skillID = 323006,
    level = 20,
    player_level = 84,
    currency = [{1,410000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对前方范围敌人造成642%物理攻击的伤害，同时降低魔法攻击力10.7%，持续时间3秒",
    id = 0
    };
getRow(323006,21)->
    #player_skills_upgradingCfg {
    skillID = 323006,
    level = 21,
    player_level = 86,
    currency = [{1,430000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对前方范围敌人造成660%物理攻击的伤害，同时降低魔法攻击力11%，持续时间3秒",
    id = 0
    };
getRow(323006,22)->
    #player_skills_upgradingCfg {
    skillID = 323006,
    level = 22,
    player_level = 88,
    currency = [{1,450000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对前方范围敌人造成678%物理攻击的伤害，同时降低魔法攻击力11.3%，持续时间3秒",
    id = 0
    };
getRow(323006,23)->
    #player_skills_upgradingCfg {
    skillID = 323006,
    level = 23,
    player_level = 90,
    currency = [{1,470000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对前方范围敌人造成696%物理攻击的伤害，同时降低魔法攻击力11.6%，持续时间3秒",
    id = 0
    };
getRow(323006,24)->
    #player_skills_upgradingCfg {
    skillID = 323006,
    level = 24,
    player_level = 92,
    currency = [{1,490000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对前方范围敌人造成714%物理攻击的伤害，同时降低魔法攻击力11.9%，持续时间3秒",
    id = 0
    };
getRow(323006,25)->
    #player_skills_upgradingCfg {
    skillID = 323006,
    level = 25,
    player_level = 94,
    currency = [{1,510000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对前方范围敌人造成732%物理攻击的伤害，同时降低魔法攻击力12.2%，持续时间3秒",
    id = 0
    };
getRow(323007,1)->
    #player_skills_upgradingCfg {
    skillID = 323007,
    level = 1,
    player_level = 60,
    currency = [],
    skillcoin_cost = 1,
    item = [],
    describe = "对前方敌人造成2次200%物理攻击的伤害的同时给周围队友加暴击等级10%，持续时间3秒",
    id = 0
    };
getRow(323007,2)->
    #player_skills_upgradingCfg {
    skillID = 323007,
    level = 2,
    player_level = 60,
    currency = [{1,50000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对前方敌人造成2次213%物理攻击的伤害的同时给周围队友加暴击等级10.2%，持续时间3秒",
    id = 0
    };
getRow(323007,3)->
    #player_skills_upgradingCfg {
    skillID = 323007,
    level = 3,
    player_level = 60,
    currency = [{1,70000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对前方敌人造成2次226%物理攻击的伤害的同时给周围队友加暴击等级10.4%，持续时间3秒",
    id = 0
    };
getRow(323007,4)->
    #player_skills_upgradingCfg {
    skillID = 323007,
    level = 4,
    player_level = 60,
    currency = [{1,90000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对前方敌人造成2次239%物理攻击的伤害的同时给周围队友加暴击等级10.6%，持续时间3秒",
    id = 0
    };
getRow(323007,5)->
    #player_skills_upgradingCfg {
    skillID = 323007,
    level = 5,
    player_level = 60,
    currency = [{1,110000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对前方敌人造成2次252%物理攻击的伤害的同时给周围队友加暴击等级10.8%，持续时间3秒",
    id = 0
    };
getRow(323007,6)->
    #player_skills_upgradingCfg {
    skillID = 323007,
    level = 6,
    player_level = 60,
    currency = [{1,130000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对前方敌人造成2次265%物理攻击的伤害的同时给周围队友加暴击等级11%，持续时间3秒",
    id = 0
    };
getRow(323007,7)->
    #player_skills_upgradingCfg {
    skillID = 323007,
    level = 7,
    player_level = 60,
    currency = [{1,150000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对前方敌人造成2次278%物理攻击的伤害的同时给周围队友加暴击等级11.2%，持续时间3秒",
    id = 0
    };
getRow(323007,8)->
    #player_skills_upgradingCfg {
    skillID = 323007,
    level = 8,
    player_level = 60,
    currency = [{1,170000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对前方敌人造成2次291%物理攻击的伤害的同时给周围队友加暴击等级11.4%，持续时间3秒",
    id = 0
    };
getRow(323007,9)->
    #player_skills_upgradingCfg {
    skillID = 323007,
    level = 9,
    player_level = 62,
    currency = [{1,190000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对前方敌人造成2次304%物理攻击的伤害的同时给周围队友加暴击等级11.6%，持续时间3秒",
    id = 0
    };
getRow(323007,10)->
    #player_skills_upgradingCfg {
    skillID = 323007,
    level = 10,
    player_level = 64,
    currency = [{1,210000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对前方敌人造成2次317%物理攻击的伤害的同时给周围队友加暴击等级11.8%，持续时间3秒",
    id = 0
    };
getRow(323007,11)->
    #player_skills_upgradingCfg {
    skillID = 323007,
    level = 11,
    player_level = 66,
    currency = [{1,230000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对前方敌人造成2次330%物理攻击的伤害的同时给周围队友加暴击等级12%，持续时间3秒",
    id = 0
    };
getRow(323007,12)->
    #player_skills_upgradingCfg {
    skillID = 323007,
    level = 12,
    player_level = 68,
    currency = [{1,250000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对前方敌人造成2次343%物理攻击的伤害的同时给周围队友加暴击等级12.2%，持续时间3秒",
    id = 0
    };
getRow(323007,13)->
    #player_skills_upgradingCfg {
    skillID = 323007,
    level = 13,
    player_level = 70,
    currency = [{1,270000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对前方敌人造成2次356%物理攻击的伤害的同时给周围队友加暴击等级12.4%，持续时间3秒",
    id = 0
    };
getRow(323007,14)->
    #player_skills_upgradingCfg {
    skillID = 323007,
    level = 14,
    player_level = 72,
    currency = [{1,290000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对前方敌人造成2次369%物理攻击的伤害的同时给周围队友加暴击等级12.6%，持续时间3秒",
    id = 0
    };
getRow(323007,15)->
    #player_skills_upgradingCfg {
    skillID = 323007,
    level = 15,
    player_level = 74,
    currency = [{1,310000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对前方敌人造成2次382%物理攻击的伤害的同时给周围队友加暴击等级12.8%，持续时间3秒",
    id = 0
    };
getRow(323007,16)->
    #player_skills_upgradingCfg {
    skillID = 323007,
    level = 16,
    player_level = 76,
    currency = [{1,330000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对前方敌人造成2次395%物理攻击的伤害的同时给周围队友加暴击等级13%，持续时间3秒",
    id = 0
    };
getRow(323007,17)->
    #player_skills_upgradingCfg {
    skillID = 323007,
    level = 17,
    player_level = 78,
    currency = [{1,350000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对前方敌人造成2次408%物理攻击的伤害的同时给周围队友加暴击等级13.2%，持续时间3秒",
    id = 0
    };
getRow(323007,18)->
    #player_skills_upgradingCfg {
    skillID = 323007,
    level = 18,
    player_level = 80,
    currency = [{1,370000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对前方敌人造成2次421%物理攻击的伤害的同时给周围队友加暴击等级13.4%，持续时间3秒",
    id = 0
    };
getRow(323007,19)->
    #player_skills_upgradingCfg {
    skillID = 323007,
    level = 19,
    player_level = 82,
    currency = [{1,390000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对前方敌人造成2次434%物理攻击的伤害的同时给周围队友加暴击等级13.6%，持续时间3秒",
    id = 0
    };
getRow(323007,20)->
    #player_skills_upgradingCfg {
    skillID = 323007,
    level = 20,
    player_level = 84,
    currency = [{1,410000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对前方敌人造成2次447%物理攻击的伤害的同时给周围队友加暴击等级13.8%，持续时间3秒",
    id = 0
    };
getRow(323007,21)->
    #player_skills_upgradingCfg {
    skillID = 323007,
    level = 21,
    player_level = 86,
    currency = [{1,430000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对前方敌人造成2次460%物理攻击的伤害的同时给周围队友加暴击等级14%，持续时间3秒",
    id = 0
    };
getRow(323007,22)->
    #player_skills_upgradingCfg {
    skillID = 323007,
    level = 22,
    player_level = 88,
    currency = [{1,450000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对前方敌人造成2次473%物理攻击的伤害的同时给周围队友加暴击等级14.2%，持续时间3秒",
    id = 0
    };
getRow(323007,23)->
    #player_skills_upgradingCfg {
    skillID = 323007,
    level = 23,
    player_level = 90,
    currency = [{1,470000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对前方敌人造成2次486%物理攻击的伤害的同时给周围队友加暴击等级14.4%，持续时间3秒",
    id = 0
    };
getRow(323007,24)->
    #player_skills_upgradingCfg {
    skillID = 323007,
    level = 24,
    player_level = 92,
    currency = [{1,490000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对前方敌人造成2次499%物理攻击的伤害的同时给周围队友加暴击等级14.6%，持续时间3秒",
    id = 0
    };
getRow(323007,25)->
    #player_skills_upgradingCfg {
    skillID = 323007,
    level = 25,
    player_level = 94,
    currency = [{1,510000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对前方敌人造成2次512%物理攻击的伤害的同时给周围队友加暴击等级14.8%，持续时间3秒",
    id = 0
    };
getRow(323008,1)->
    #player_skills_upgradingCfg {
    skillID = 323008,
    level = 1,
    player_level = 60,
    currency = [],
    skillcoin_cost = 1,
    item = [],
    describe = "自身每秒恢复40%物理攻击的生命值，持续时间5秒",
    id = 0
    };
getRow(323008,2)->
    #player_skills_upgradingCfg {
    skillID = 323008,
    level = 2,
    player_level = 60,
    currency = [{1,50000}],
    skillcoin_cost = 1,
    item = [],
    describe = "自身每秒恢复41%物理攻击的生命值，持续时间5秒",
    id = 0
    };
getRow(323008,3)->
    #player_skills_upgradingCfg {
    skillID = 323008,
    level = 3,
    player_level = 60,
    currency = [{1,70000}],
    skillcoin_cost = 1,
    item = [],
    describe = "自身每秒恢复42%物理攻击的生命值，持续时间5秒",
    id = 0
    };
getRow(323008,4)->
    #player_skills_upgradingCfg {
    skillID = 323008,
    level = 4,
    player_level = 60,
    currency = [{1,90000}],
    skillcoin_cost = 1,
    item = [],
    describe = "自身每秒恢复43%物理攻击的生命值，持续时间5秒",
    id = 0
    };
getRow(323008,5)->
    #player_skills_upgradingCfg {
    skillID = 323008,
    level = 5,
    player_level = 60,
    currency = [{1,110000}],
    skillcoin_cost = 1,
    item = [],
    describe = "自身每秒恢复44%物理攻击的生命值，持续时间5秒",
    id = 0
    };
getRow(323008,6)->
    #player_skills_upgradingCfg {
    skillID = 323008,
    level = 6,
    player_level = 60,
    currency = [{1,130000}],
    skillcoin_cost = 1,
    item = [],
    describe = "自身每秒恢复45%物理攻击的生命值，持续时间5秒",
    id = 0
    };
getRow(323008,7)->
    #player_skills_upgradingCfg {
    skillID = 323008,
    level = 7,
    player_level = 60,
    currency = [{1,150000}],
    skillcoin_cost = 1,
    item = [],
    describe = "自身每秒恢复46%物理攻击的生命值，持续时间5秒",
    id = 0
    };
getRow(323008,8)->
    #player_skills_upgradingCfg {
    skillID = 323008,
    level = 8,
    player_level = 60,
    currency = [{1,170000}],
    skillcoin_cost = 1,
    item = [],
    describe = "自身每秒恢复47%物理攻击的生命值，持续时间5秒",
    id = 0
    };
getRow(323008,9)->
    #player_skills_upgradingCfg {
    skillID = 323008,
    level = 9,
    player_level = 62,
    currency = [{1,190000}],
    skillcoin_cost = 1,
    item = [],
    describe = "自身每秒恢复48%物理攻击的生命值，持续时间5秒",
    id = 0
    };
getRow(323008,10)->
    #player_skills_upgradingCfg {
    skillID = 323008,
    level = 10,
    player_level = 64,
    currency = [{1,210000}],
    skillcoin_cost = 1,
    item = [],
    describe = "自身每秒恢复49%物理攻击的生命值，持续时间5秒",
    id = 0
    };
getRow(323008,11)->
    #player_skills_upgradingCfg {
    skillID = 323008,
    level = 11,
    player_level = 66,
    currency = [{1,230000}],
    skillcoin_cost = 1,
    item = [],
    describe = "自身每秒恢复50%物理攻击的生命值，持续时间5秒",
    id = 0
    };
getRow(323008,12)->
    #player_skills_upgradingCfg {
    skillID = 323008,
    level = 12,
    player_level = 68,
    currency = [{1,250000}],
    skillcoin_cost = 1,
    item = [],
    describe = "自身每秒恢复51%物理攻击的生命值，持续时间5秒",
    id = 0
    };
getRow(323008,13)->
    #player_skills_upgradingCfg {
    skillID = 323008,
    level = 13,
    player_level = 70,
    currency = [{1,270000}],
    skillcoin_cost = 1,
    item = [],
    describe = "自身每秒恢复52%物理攻击的生命值，持续时间5秒",
    id = 0
    };
getRow(323008,14)->
    #player_skills_upgradingCfg {
    skillID = 323008,
    level = 14,
    player_level = 72,
    currency = [{1,290000}],
    skillcoin_cost = 1,
    item = [],
    describe = "自身每秒恢复53%物理攻击的生命值，持续时间5秒",
    id = 0
    };
getRow(323008,15)->
    #player_skills_upgradingCfg {
    skillID = 323008,
    level = 15,
    player_level = 74,
    currency = [{1,310000}],
    skillcoin_cost = 1,
    item = [],
    describe = "自身每秒恢复54%物理攻击的生命值，持续时间5秒",
    id = 0
    };
getRow(323008,16)->
    #player_skills_upgradingCfg {
    skillID = 323008,
    level = 16,
    player_level = 76,
    currency = [{1,330000}],
    skillcoin_cost = 1,
    item = [],
    describe = "自身每秒恢复55%物理攻击的生命值，持续时间5秒",
    id = 0
    };
getRow(323008,17)->
    #player_skills_upgradingCfg {
    skillID = 323008,
    level = 17,
    player_level = 78,
    currency = [{1,350000}],
    skillcoin_cost = 1,
    item = [],
    describe = "自身每秒恢复56%物理攻击的生命值，持续时间5秒",
    id = 0
    };
getRow(323008,18)->
    #player_skills_upgradingCfg {
    skillID = 323008,
    level = 18,
    player_level = 80,
    currency = [{1,370000}],
    skillcoin_cost = 1,
    item = [],
    describe = "自身每秒恢复57%物理攻击的生命值，持续时间5秒",
    id = 0
    };
getRow(323008,19)->
    #player_skills_upgradingCfg {
    skillID = 323008,
    level = 19,
    player_level = 82,
    currency = [{1,390000}],
    skillcoin_cost = 1,
    item = [],
    describe = "自身每秒恢复58%物理攻击的生命值，持续时间5秒",
    id = 0
    };
getRow(323008,20)->
    #player_skills_upgradingCfg {
    skillID = 323008,
    level = 20,
    player_level = 84,
    currency = [{1,410000}],
    skillcoin_cost = 1,
    item = [],
    describe = "自身每秒恢复59%物理攻击的生命值，持续时间5秒",
    id = 0
    };
getRow(323008,21)->
    #player_skills_upgradingCfg {
    skillID = 323008,
    level = 21,
    player_level = 86,
    currency = [{1,430000}],
    skillcoin_cost = 1,
    item = [],
    describe = "自身每秒恢复60%物理攻击的生命值，持续时间5秒",
    id = 0
    };
getRow(323008,22)->
    #player_skills_upgradingCfg {
    skillID = 323008,
    level = 22,
    player_level = 88,
    currency = [{1,450000}],
    skillcoin_cost = 1,
    item = [],
    describe = "自身每秒恢复61%物理攻击的生命值，持续时间5秒",
    id = 0
    };
getRow(323008,23)->
    #player_skills_upgradingCfg {
    skillID = 323008,
    level = 23,
    player_level = 90,
    currency = [{1,470000}],
    skillcoin_cost = 1,
    item = [],
    describe = "自身每秒恢复62%物理攻击的生命值，持续时间5秒",
    id = 0
    };
getRow(323008,24)->
    #player_skills_upgradingCfg {
    skillID = 323008,
    level = 24,
    player_level = 92,
    currency = [{1,490000}],
    skillcoin_cost = 1,
    item = [],
    describe = "自身每秒恢复63%物理攻击的生命值，持续时间5秒",
    id = 0
    };
getRow(323008,25)->
    #player_skills_upgradingCfg {
    skillID = 323008,
    level = 25,
    player_level = 94,
    currency = [{1,510000}],
    skillcoin_cost = 1,
    item = [],
    describe = "自身每秒恢复64%物理攻击的生命值，持续时间5秒",
    id = 0
    };
getRow(323009,1)->
    #player_skills_upgradingCfg {
    skillID = 323009,
    level = 1,
    player_level = 60,
    currency = [],
    skillcoin_cost = 1,
    item = [],
    describe = "提升全体队友的抗暴等级40%，持续时间5秒",
    id = 0
    };
getRow(323009,2)->
    #player_skills_upgradingCfg {
    skillID = 323009,
    level = 2,
    player_level = 60,
    currency = [{1,70000}],
    skillcoin_cost = 1,
    item = [],
    describe = "提升全体队友的抗暴等级42%，持续时间5秒",
    id = 0
    };
getRow(323009,3)->
    #player_skills_upgradingCfg {
    skillID = 323009,
    level = 3,
    player_level = 60,
    currency = [{1,110000}],
    skillcoin_cost = 1,
    item = [],
    describe = "提升全体队友的抗暴等级44%，持续时间5秒",
    id = 0
    };
getRow(323009,4)->
    #player_skills_upgradingCfg {
    skillID = 323009,
    level = 4,
    player_level = 60,
    currency = [{1,150000}],
    skillcoin_cost = 1,
    item = [],
    describe = "提升全体队友的抗暴等级46%，持续时间5秒",
    id = 0
    };
getRow(323009,5)->
    #player_skills_upgradingCfg {
    skillID = 323009,
    level = 5,
    player_level = 62,
    currency = [{1,190000}],
    skillcoin_cost = 1,
    item = [],
    describe = "提升全体队友的抗暴等级48%，持续时间5秒",
    id = 0
    };
getRow(323009,6)->
    #player_skills_upgradingCfg {
    skillID = 323009,
    level = 6,
    player_level = 66,
    currency = [{1,230000}],
    skillcoin_cost = 1,
    item = [],
    describe = "提升全体队友的抗暴等级50%，持续时间5秒",
    id = 0
    };
getRow(323009,7)->
    #player_skills_upgradingCfg {
    skillID = 323009,
    level = 7,
    player_level = 70,
    currency = [{1,270000}],
    skillcoin_cost = 1,
    item = [],
    describe = "提升全体队友的抗暴等级52%，持续时间5秒",
    id = 0
    };
getRow(323009,8)->
    #player_skills_upgradingCfg {
    skillID = 323009,
    level = 8,
    player_level = 74,
    currency = [{1,310000}],
    skillcoin_cost = 1,
    item = [],
    describe = "提升全体队友的抗暴等级54%，持续时间5秒",
    id = 0
    };
getRow(323009,9)->
    #player_skills_upgradingCfg {
    skillID = 323009,
    level = 9,
    player_level = 78,
    currency = [{1,350000}],
    skillcoin_cost = 1,
    item = [],
    describe = "提升全体队友的抗暴等级56%，持续时间5秒",
    id = 0
    };
getRow(323009,10)->
    #player_skills_upgradingCfg {
    skillID = 323009,
    level = 10,
    player_level = 82,
    currency = [{1,390000}],
    skillcoin_cost = 1,
    item = [],
    describe = "提升全体队友的抗暴等级58%，持续时间5秒",
    id = 0
    };
getRow(323009,11)->
    #player_skills_upgradingCfg {
    skillID = 323009,
    level = 11,
    player_level = 86,
    currency = [{1,430000}],
    skillcoin_cost = 1,
    item = [],
    describe = "提升全体队友的抗暴等级60%，持续时间5秒",
    id = 0
    };
getRow(323010,1)->
    #player_skills_upgradingCfg {
    skillID = 323010,
    level = 1,
    player_level = 60,
    currency = [],
    skillcoin_cost = 1,
    item = [],
    describe = "增加范围内队友的物防15%，持续10秒",
    id = 0
    };
getRow(323010,2)->
    #player_skills_upgradingCfg {
    skillID = 323010,
    level = 2,
    player_level = 60,
    currency = [{1,70000}],
    skillcoin_cost = 1,
    item = [],
    describe = "增加范围内队友的物防16%，持续10秒",
    id = 0
    };
getRow(323010,3)->
    #player_skills_upgradingCfg {
    skillID = 323010,
    level = 3,
    player_level = 60,
    currency = [{1,110000}],
    skillcoin_cost = 1,
    item = [],
    describe = "增加范围内队友的物防17%，持续10秒",
    id = 0
    };
getRow(323010,4)->
    #player_skills_upgradingCfg {
    skillID = 323010,
    level = 4,
    player_level = 60,
    currency = [{1,150000}],
    skillcoin_cost = 1,
    item = [],
    describe = "增加范围内队友的物防18%，持续10秒",
    id = 0
    };
getRow(323010,5)->
    #player_skills_upgradingCfg {
    skillID = 323010,
    level = 5,
    player_level = 62,
    currency = [{1,190000}],
    skillcoin_cost = 1,
    item = [],
    describe = "增加范围内队友的物防19%，持续10秒",
    id = 0
    };
getRow(323010,6)->
    #player_skills_upgradingCfg {
    skillID = 323010,
    level = 6,
    player_level = 66,
    currency = [{1,230000}],
    skillcoin_cost = 1,
    item = [],
    describe = "增加范围内队友的物防20%，持续10秒",
    id = 0
    };
getRow(323010,7)->
    #player_skills_upgradingCfg {
    skillID = 323010,
    level = 7,
    player_level = 70,
    currency = [{1,270000}],
    skillcoin_cost = 1,
    item = [],
    describe = "增加范围内队友的物防21%，持续10秒",
    id = 0
    };
getRow(323010,8)->
    #player_skills_upgradingCfg {
    skillID = 323010,
    level = 8,
    player_level = 74,
    currency = [{1,310000}],
    skillcoin_cost = 1,
    item = [],
    describe = "增加范围内队友的物防22%，持续10秒",
    id = 0
    };
getRow(323010,9)->
    #player_skills_upgradingCfg {
    skillID = 323010,
    level = 9,
    player_level = 78,
    currency = [{1,350000}],
    skillcoin_cost = 1,
    item = [],
    describe = "增加范围内队友的物防23%，持续10秒",
    id = 0
    };
getRow(323010,10)->
    #player_skills_upgradingCfg {
    skillID = 323010,
    level = 10,
    player_level = 82,
    currency = [{1,390000}],
    skillcoin_cost = 1,
    item = [],
    describe = "增加范围内队友的物防24%，持续10秒",
    id = 0
    };
getRow(323010,11)->
    #player_skills_upgradingCfg {
    skillID = 323010,
    level = 11,
    player_level = 86,
    currency = [{1,430000}],
    skillcoin_cost = 1,
    item = [],
    describe = "增加范围内队友的物防25%，持续10秒",
    id = 0
    };
getRow(323011,1)->
    #player_skills_upgradingCfg {
    skillID = 323011,
    level = 1,
    player_level = 60,
    currency = [],
    skillcoin_cost = 1,
    item = [],
    describe = "清除身上所有负面状态，瞬间前进30米，增加双防20%，持续5秒",
    id = 0
    };
getRow(323011,2)->
    #player_skills_upgradingCfg {
    skillID = 323011,
    level = 2,
    player_level = 60,
    currency = [{1,70000}],
    skillcoin_cost = 1,
    item = [],
    describe = "清除身上所有负面状态，瞬间前进30米，增加双防22%，持续5秒",
    id = 0
    };
getRow(323011,3)->
    #player_skills_upgradingCfg {
    skillID = 323011,
    level = 3,
    player_level = 60,
    currency = [{1,110000}],
    skillcoin_cost = 1,
    item = [],
    describe = "清除身上所有负面状态，瞬间前进30米，增加双防24%，持续5秒",
    id = 0
    };
getRow(323011,4)->
    #player_skills_upgradingCfg {
    skillID = 323011,
    level = 4,
    player_level = 60,
    currency = [{1,150000}],
    skillcoin_cost = 1,
    item = [],
    describe = "清除身上所有负面状态，瞬间前进30米，增加双防26%，持续5秒",
    id = 0
    };
getRow(323011,5)->
    #player_skills_upgradingCfg {
    skillID = 323011,
    level = 5,
    player_level = 62,
    currency = [{1,190000}],
    skillcoin_cost = 1,
    item = [],
    describe = "清除身上所有负面状态，瞬间前进30米，增加双防28%，持续5秒",
    id = 0
    };
getRow(323011,6)->
    #player_skills_upgradingCfg {
    skillID = 323011,
    level = 6,
    player_level = 66,
    currency = [{1,230000}],
    skillcoin_cost = 1,
    item = [],
    describe = "清除身上所有负面状态，瞬间前进30米，增加双防30%，持续5秒",
    id = 0
    };
getRow(323011,7)->
    #player_skills_upgradingCfg {
    skillID = 323011,
    level = 7,
    player_level = 70,
    currency = [{1,270000}],
    skillcoin_cost = 1,
    item = [],
    describe = "清除身上所有负面状态，瞬间前进30米，增加双防32%，持续5秒",
    id = 0
    };
getRow(323011,8)->
    #player_skills_upgradingCfg {
    skillID = 323011,
    level = 8,
    player_level = 74,
    currency = [{1,310000}],
    skillcoin_cost = 1,
    item = [],
    describe = "清除身上所有负面状态，瞬间前进30米，增加双防34%，持续5秒",
    id = 0
    };
getRow(323011,9)->
    #player_skills_upgradingCfg {
    skillID = 323011,
    level = 9,
    player_level = 78,
    currency = [{1,350000}],
    skillcoin_cost = 1,
    item = [],
    describe = "清除身上所有负面状态，瞬间前进30米，增加双防36%，持续5秒",
    id = 0
    };
getRow(323011,10)->
    #player_skills_upgradingCfg {
    skillID = 323011,
    level = 10,
    player_level = 82,
    currency = [{1,390000}],
    skillcoin_cost = 1,
    item = [],
    describe = "清除身上所有负面状态，瞬间前进30米，增加双防38%，持续5秒",
    id = 0
    };
getRow(323011,11)->
    #player_skills_upgradingCfg {
    skillID = 323011,
    level = 11,
    player_level = 86,
    currency = [{1,430000}],
    skillcoin_cost = 1,
    item = [],
    describe = "清除身上所有负面状态，瞬间前进30米，增加双防40%，持续5秒",
    id = 0
    };
getRow(_,_)->[].

getKeyList()->[
    {101000,1},
    {101001,1},
    {101002,1},
    {101003,1},
    {101003,2},
    {101003,3},
    {101003,4},
    {101003,5},
    {101003,6},
    {101004,1},
    {101004,2},
    {101004,3},
    {101004,4},
    {101004,5},
    {101004,6},
    {101005,1},
    {101005,2},
    {101005,3},
    {101005,4},
    {101005,5},
    {101005,6},
    {101006,1},
    {101006,2},
    {101006,3},
    {101006,4},
    {101006,5},
    {101006,6},
    {111000,1},
    {111001,1},
    {111002,1},
    {111003,1},
    {111003,2},
    {111003,3},
    {111003,4},
    {111003,5},
    {111003,6},
    {111003,7},
    {111003,8},
    {111003,9},
    {111003,10},
    {111003,11},
    {111003,12},
    {111003,13},
    {111003,14},
    {111003,15},
    {111004,1},
    {111004,2},
    {111004,3},
    {111004,4},
    {111004,5},
    {111004,6},
    {111004,7},
    {111004,8},
    {111004,9},
    {111004,10},
    {111004,11},
    {111004,12},
    {111004,13},
    {111004,14},
    {111004,15},
    {111005,1},
    {111005,2},
    {111005,3},
    {111005,4},
    {111005,5},
    {111005,6},
    {111005,7},
    {111005,8},
    {111005,9},
    {111005,10},
    {111005,11},
    {111005,12},
    {111005,13},
    {111005,14},
    {111005,15},
    {111006,1},
    {111006,2},
    {111006,3},
    {111006,4},
    {111006,5},
    {111006,6},
    {111006,7},
    {111006,8},
    {111006,9},
    {111006,10},
    {111006,11},
    {111006,12},
    {111006,13},
    {111006,14},
    {111006,15},
    {111007,1},
    {111007,2},
    {111007,3},
    {111007,4},
    {111007,5},
    {111007,6},
    {111007,7},
    {111007,8},
    {111007,9},
    {111007,10},
    {111007,11},
    {111008,1},
    {111008,2},
    {111008,3},
    {111008,4},
    {111008,5},
    {111008,6},
    {111008,7},
    {111008,8},
    {111008,9},
    {111008,10},
    {111008,11},
    {111020,1},
    {111020,2},
    {111020,3},
    {111020,4},
    {111020,5},
    {111020,6},
    {111020,7},
    {111020,8},
    {111020,9},
    {111020,10},
    {111020,11},
    {112000,1},
    {112001,1},
    {112002,1},
    {112003,1},
    {112003,2},
    {112003,3},
    {112003,4},
    {112003,5},
    {112003,6},
    {112003,7},
    {112003,8},
    {112003,9},
    {112003,10},
    {112003,11},
    {112003,12},
    {112003,13},
    {112003,14},
    {112003,15},
    {112004,1},
    {112004,2},
    {112004,3},
    {112004,4},
    {112004,5},
    {112004,6},
    {112004,7},
    {112004,8},
    {112004,9},
    {112004,10},
    {112004,11},
    {112004,12},
    {112004,13},
    {112004,14},
    {112004,15},
    {112005,1},
    {112005,2},
    {112005,3},
    {112005,4},
    {112005,5},
    {112005,6},
    {112005,7},
    {112005,8},
    {112005,9},
    {112005,10},
    {112005,11},
    {112005,12},
    {112005,13},
    {112005,14},
    {112005,15},
    {112006,1},
    {112006,2},
    {112006,3},
    {112006,4},
    {112006,5},
    {112006,6},
    {112006,7},
    {112006,8},
    {112006,9},
    {112006,10},
    {112006,11},
    {112006,12},
    {112006,13},
    {112006,14},
    {112006,15},
    {112007,1},
    {112007,2},
    {112007,3},
    {112007,4},
    {112007,5},
    {112007,6},
    {112007,7},
    {112007,8},
    {112007,9},
    {112007,10},
    {112007,11},
    {112008,1},
    {112008,2},
    {112008,3},
    {112008,4},
    {112008,5},
    {112008,6},
    {112008,7},
    {112008,8},
    {112008,9},
    {112008,10},
    {112008,11},
    {112020,1},
    {112020,2},
    {112020,3},
    {112020,4},
    {112020,5},
    {112020,6},
    {112020,7},
    {112020,8},
    {112020,9},
    {112020,10},
    {112020,11},
    {112020,12},
    {112020,13},
    {112020,14},
    {112020,15},
    {121004,1},
    {121004,2},
    {121004,3},
    {121004,4},
    {121004,5},
    {121004,6},
    {121004,7},
    {121004,8},
    {121004,9},
    {121004,10},
    {121004,11},
    {121004,12},
    {121004,13},
    {121004,14},
    {121004,15},
    {121004,16},
    {121004,17},
    {121004,18},
    {121004,19},
    {121004,20},
    {121004,21},
    {121004,22},
    {121004,23},
    {121004,24},
    {121004,25},
    {121005,1},
    {121005,2},
    {121005,3},
    {121005,4},
    {121005,5},
    {121005,6},
    {121005,7},
    {121005,8},
    {121005,9},
    {121005,10},
    {121005,11},
    {121005,12},
    {121005,13},
    {121005,14},
    {121005,15},
    {121005,16},
    {121005,17},
    {121005,18},
    {121005,19},
    {121005,20},
    {121005,21},
    {121005,22},
    {121005,23},
    {121005,24},
    {121005,25},
    {121006,1},
    {121006,2},
    {121006,3},
    {121006,4},
    {121006,5},
    {121006,6},
    {121006,7},
    {121006,8},
    {121006,9},
    {121006,10},
    {121006,11},
    {121006,12},
    {121006,13},
    {121006,14},
    {121006,15},
    {121006,16},
    {121006,17},
    {121006,18},
    {121006,19},
    {121006,20},
    {121006,21},
    {121006,22},
    {121006,23},
    {121006,24},
    {121006,25},
    {121007,1},
    {121007,2},
    {121007,3},
    {121007,4},
    {121007,5},
    {121007,6},
    {121007,7},
    {121007,8},
    {121007,9},
    {121007,10},
    {121007,11},
    {121007,12},
    {121007,13},
    {121007,14},
    {121007,15},
    {121007,16},
    {121007,17},
    {121007,18},
    {121007,19},
    {121007,20},
    {121007,21},
    {121007,22},
    {121007,23},
    {121007,24},
    {121007,25},
    {121008,1},
    {121008,2},
    {121008,3},
    {121008,4},
    {121008,5},
    {121008,6},
    {121008,7},
    {121008,8},
    {121008,9},
    {121008,10},
    {121008,11},
    {121008,12},
    {121008,13},
    {121008,14},
    {121008,15},
    {121008,16},
    {121008,17},
    {121008,18},
    {121008,19},
    {121008,20},
    {121008,21},
    {121008,22},
    {121008,23},
    {121008,24},
    {121008,25},
    {121009,1},
    {121009,2},
    {121009,3},
    {121009,4},
    {121009,5},
    {121009,6},
    {121009,7},
    {121009,8},
    {121009,9},
    {121009,10},
    {121009,11},
    {121010,1},
    {121010,2},
    {121010,3},
    {121010,4},
    {121010,5},
    {121010,6},
    {121010,7},
    {121010,8},
    {121010,9},
    {121010,10},
    {121010,11},
    {121011,1},
    {121011,2},
    {121011,3},
    {121011,4},
    {121011,5},
    {121011,6},
    {121011,7},
    {121011,8},
    {121011,9},
    {121011,10},
    {121011,11},
    {122005,1},
    {122005,2},
    {122005,3},
    {122005,4},
    {122005,5},
    {122005,6},
    {122005,7},
    {122005,8},
    {122005,9},
    {122005,10},
    {122005,11},
    {122005,12},
    {122005,13},
    {122005,14},
    {122005,15},
    {122005,16},
    {122005,17},
    {122005,18},
    {122005,19},
    {122005,20},
    {122005,21},
    {122005,22},
    {122005,23},
    {122005,24},
    {122005,25},
    {122006,1},
    {122006,2},
    {122006,3},
    {122006,4},
    {122006,5},
    {122006,6},
    {122006,7},
    {122006,8},
    {122006,9},
    {122006,10},
    {122006,11},
    {122006,12},
    {122006,13},
    {122006,14},
    {122006,15},
    {122006,16},
    {122006,17},
    {122006,18},
    {122006,19},
    {122006,20},
    {122006,21},
    {122006,22},
    {122006,23},
    {122006,24},
    {122006,25},
    {122007,1},
    {122007,2},
    {122007,3},
    {122007,4},
    {122007,5},
    {122007,6},
    {122007,7},
    {122007,8},
    {122007,9},
    {122007,10},
    {122007,11},
    {122007,12},
    {122007,13},
    {122007,14},
    {122007,15},
    {122007,16},
    {122007,17},
    {122007,18},
    {122007,19},
    {122007,20},
    {122007,21},
    {122007,22},
    {122007,23},
    {122007,24},
    {122007,25},
    {122008,1},
    {122008,2},
    {122008,3},
    {122008,4},
    {122008,5},
    {122008,6},
    {122008,7},
    {122008,8},
    {122008,9},
    {122008,10},
    {122008,11},
    {122008,12},
    {122008,13},
    {122008,14},
    {122008,15},
    {122008,16},
    {122008,17},
    {122008,18},
    {122008,19},
    {122008,20},
    {122008,21},
    {122008,22},
    {122008,23},
    {122008,24},
    {122008,25},
    {122009,1},
    {122009,2},
    {122009,3},
    {122009,4},
    {122009,5},
    {122009,6},
    {122009,7},
    {122009,8},
    {122009,9},
    {122009,10},
    {122009,11},
    {122009,12},
    {122009,13},
    {122009,14},
    {122009,15},
    {122009,16},
    {122009,17},
    {122009,18},
    {122009,19},
    {122009,20},
    {122009,21},
    {122009,22},
    {122009,23},
    {122009,24},
    {122009,25},
    {122010,1},
    {122010,2},
    {122010,3},
    {122010,4},
    {122010,5},
    {122010,6},
    {122010,7},
    {122010,8},
    {122010,9},
    {122010,10},
    {122010,11},
    {122011,1},
    {122011,2},
    {122011,3},
    {122011,4},
    {122011,5},
    {122011,6},
    {122011,7},
    {122011,8},
    {122011,9},
    {122011,10},
    {122011,11},
    {122012,1},
    {122012,2},
    {122012,3},
    {122012,4},
    {122012,5},
    {122012,6},
    {122012,7},
    {122012,8},
    {122012,9},
    {122012,10},
    {122012,11},
    {123004,1},
    {123004,2},
    {123004,3},
    {123004,4},
    {123004,5},
    {123004,6},
    {123004,7},
    {123004,8},
    {123004,9},
    {123004,10},
    {123004,11},
    {123004,12},
    {123004,13},
    {123004,14},
    {123004,15},
    {123004,16},
    {123004,17},
    {123004,18},
    {123004,19},
    {123004,20},
    {123004,21},
    {123004,22},
    {123004,23},
    {123004,24},
    {123004,25},
    {123005,1},
    {123005,2},
    {123005,3},
    {123005,4},
    {123005,5},
    {123005,6},
    {123005,7},
    {123005,8},
    {123005,9},
    {123005,10},
    {123005,11},
    {123005,12},
    {123005,13},
    {123005,14},
    {123005,15},
    {123005,16},
    {123005,17},
    {123005,18},
    {123005,19},
    {123005,20},
    {123005,21},
    {123005,22},
    {123005,23},
    {123005,24},
    {123005,25},
    {123006,1},
    {123006,2},
    {123006,3},
    {123006,4},
    {123006,5},
    {123006,6},
    {123006,7},
    {123006,8},
    {123006,9},
    {123006,10},
    {123006,11},
    {123006,12},
    {123006,13},
    {123006,14},
    {123006,15},
    {123006,16},
    {123006,17},
    {123006,18},
    {123006,19},
    {123006,20},
    {123006,21},
    {123006,22},
    {123006,23},
    {123006,24},
    {123006,25},
    {123007,1},
    {123007,2},
    {123007,3},
    {123007,4},
    {123007,5},
    {123007,6},
    {123007,7},
    {123007,8},
    {123007,9},
    {123007,10},
    {123007,11},
    {123007,12},
    {123007,13},
    {123007,14},
    {123007,15},
    {123007,16},
    {123007,17},
    {123007,18},
    {123007,19},
    {123007,20},
    {123007,21},
    {123007,22},
    {123007,23},
    {123007,24},
    {123007,25},
    {123008,1},
    {123008,2},
    {123008,3},
    {123008,4},
    {123008,5},
    {123008,6},
    {123008,7},
    {123008,8},
    {123008,9},
    {123008,10},
    {123008,11},
    {123008,12},
    {123008,13},
    {123008,14},
    {123008,15},
    {123008,16},
    {123008,17},
    {123008,18},
    {123008,19},
    {123008,20},
    {123008,21},
    {123008,22},
    {123008,23},
    {123008,24},
    {123008,25},
    {123009,1},
    {123009,2},
    {123009,3},
    {123009,4},
    {123009,5},
    {123009,6},
    {123009,7},
    {123009,8},
    {123009,9},
    {123009,10},
    {123009,11},
    {123010,1},
    {123010,2},
    {123010,3},
    {123010,4},
    {123010,5},
    {123010,6},
    {123010,7},
    {123010,8},
    {123010,9},
    {123010,10},
    {123010,11},
    {123011,1},
    {123011,2},
    {123011,3},
    {123011,4},
    {123011,5},
    {123011,6},
    {123011,7},
    {123011,8},
    {123011,9},
    {123011,10},
    {123011,11},
    {201000,1},
    {201002,1},
    {201003,1},
    {201003,2},
    {201003,3},
    {201003,4},
    {201003,5},
    {201003,6},
    {201004,1},
    {201004,2},
    {201004,3},
    {201004,4},
    {201004,5},
    {201004,6},
    {201005,1},
    {201005,2},
    {201005,3},
    {201005,4},
    {201005,5},
    {201005,6},
    {201006,1},
    {201006,2},
    {201006,3},
    {201006,4},
    {201006,5},
    {201006,6},
    {201007,1},
    {211000,1},
    {211001,1},
    {211002,1},
    {211003,1},
    {211003,2},
    {211003,3},
    {211003,4},
    {211003,5},
    {211003,6},
    {211003,7},
    {211003,8},
    {211003,9},
    {211003,10},
    {211003,11},
    {211003,12},
    {211003,13},
    {211003,14},
    {211003,15},
    {211004,1},
    {211004,2},
    {211004,3},
    {211004,4},
    {211004,5},
    {211004,6},
    {211004,7},
    {211004,8},
    {211004,9},
    {211004,10},
    {211004,11},
    {211004,12},
    {211004,13},
    {211004,14},
    {211004,15},
    {211005,1},
    {211005,2},
    {211005,3},
    {211005,4},
    {211005,5},
    {211005,6},
    {211005,7},
    {211005,8},
    {211005,9},
    {211005,10},
    {211005,11},
    {211005,12},
    {211005,13},
    {211005,14},
    {211005,15},
    {211007,1},
    {211007,2},
    {211007,3},
    {211007,4},
    {211007,5},
    {211007,6},
    {211007,7},
    {211007,8},
    {211007,9},
    {211007,10},
    {211007,11},
    {211007,12},
    {211007,13},
    {211007,14},
    {211007,15},
    {211008,1},
    {211008,2},
    {211008,3},
    {211008,4},
    {211008,5},
    {211008,6},
    {211008,7},
    {211008,8},
    {211008,9},
    {211008,10},
    {211008,11},
    {211009,1},
    {211009,2},
    {211009,3},
    {211009,4},
    {211009,5},
    {211009,6},
    {211009,7},
    {211009,8},
    {211009,9},
    {211009,10},
    {211009,11},
    {211013,1},
    {211013,2},
    {211013,3},
    {211013,4},
    {211013,5},
    {211013,6},
    {211013,7},
    {211013,8},
    {211013,9},
    {211013,10},
    {211013,11},
    {211020,1},
    {211020,2},
    {211020,3},
    {211020,4},
    {211020,5},
    {211020,6},
    {211020,7},
    {211020,8},
    {211020,9},
    {211020,10},
    {211020,11},
    {211020,12},
    {211020,13},
    {211020,14},
    {211020,15},
    {212000,1},
    {212001,1},
    {212002,1},
    {212003,1},
    {212003,2},
    {212003,3},
    {212003,4},
    {212003,5},
    {212003,6},
    {212003,7},
    {212003,8},
    {212003,9},
    {212003,10},
    {212003,11},
    {212003,12},
    {212003,13},
    {212003,14},
    {212003,15},
    {212004,1},
    {212004,2},
    {212004,3},
    {212004,4},
    {212004,5},
    {212004,6},
    {212004,7},
    {212004,8},
    {212004,9},
    {212004,10},
    {212004,11},
    {212004,12},
    {212004,13},
    {212004,14},
    {212004,15},
    {212005,1},
    {212005,2},
    {212005,3},
    {212005,4},
    {212005,5},
    {212005,6},
    {212005,7},
    {212005,8},
    {212005,9},
    {212005,10},
    {212005,11},
    {212005,12},
    {212005,13},
    {212005,14},
    {212005,15},
    {212006,1},
    {212006,2},
    {212006,3},
    {212006,4},
    {212006,5},
    {212006,6},
    {212006,7},
    {212006,8},
    {212006,9},
    {212006,10},
    {212006,11},
    {212006,12},
    {212006,13},
    {212006,14},
    {212006,15},
    {212007,1},
    {212007,2},
    {212007,3},
    {212007,4},
    {212007,5},
    {212007,6},
    {212007,7},
    {212007,8},
    {212007,9},
    {212007,10},
    {212007,11},
    {212008,1},
    {212008,2},
    {212008,3},
    {212008,4},
    {212008,5},
    {212008,6},
    {212008,7},
    {212008,8},
    {212008,9},
    {212008,10},
    {212008,11},
    {212009,1},
    {212009,2},
    {212009,3},
    {212009,4},
    {212009,5},
    {212009,6},
    {212009,7},
    {212009,8},
    {212009,9},
    {212009,10},
    {212009,11},
    {212009,12},
    {212009,13},
    {212009,14},
    {212009,15},
    {221003,1},
    {221003,2},
    {221003,3},
    {221003,4},
    {221003,5},
    {221003,6},
    {221003,7},
    {221003,8},
    {221003,9},
    {221003,10},
    {221003,11},
    {221003,12},
    {221003,13},
    {221003,14},
    {221003,15},
    {221003,16},
    {221003,17},
    {221003,18},
    {221003,19},
    {221003,20},
    {221003,21},
    {221003,22},
    {221003,23},
    {221003,24},
    {221003,25},
    {221004,1},
    {221004,2},
    {221004,3},
    {221004,4},
    {221004,5},
    {221004,6},
    {221004,7},
    {221004,8},
    {221004,9},
    {221004,10},
    {221004,11},
    {221004,12},
    {221004,13},
    {221004,14},
    {221004,15},
    {221004,16},
    {221004,17},
    {221004,18},
    {221004,19},
    {221004,20},
    {221004,21},
    {221004,22},
    {221004,23},
    {221004,24},
    {221004,25},
    {221005,1},
    {221005,2},
    {221005,3},
    {221005,4},
    {221005,5},
    {221005,6},
    {221005,7},
    {221005,8},
    {221005,9},
    {221005,10},
    {221005,11},
    {221005,12},
    {221005,13},
    {221005,14},
    {221005,15},
    {221005,16},
    {221005,17},
    {221005,18},
    {221005,19},
    {221005,20},
    {221005,21},
    {221005,22},
    {221005,23},
    {221005,24},
    {221005,25},
    {221006,1},
    {221006,2},
    {221006,3},
    {221006,4},
    {221006,5},
    {221006,6},
    {221006,7},
    {221006,8},
    {221006,9},
    {221006,10},
    {221006,11},
    {221006,12},
    {221006,13},
    {221006,14},
    {221006,15},
    {221006,16},
    {221006,17},
    {221006,18},
    {221006,19},
    {221006,20},
    {221006,21},
    {221006,22},
    {221006,23},
    {221006,24},
    {221006,25},
    {221007,1},
    {221007,2},
    {221007,3},
    {221007,4},
    {221007,5},
    {221007,6},
    {221007,7},
    {221007,8},
    {221007,9},
    {221007,10},
    {221007,11},
    {221007,12},
    {221007,13},
    {221007,14},
    {221007,15},
    {221007,16},
    {221007,17},
    {221007,18},
    {221007,19},
    {221007,20},
    {221007,21},
    {221007,22},
    {221007,23},
    {221007,24},
    {221007,25},
    {221008,1},
    {221008,2},
    {221008,3},
    {221008,4},
    {221008,5},
    {221008,6},
    {221008,7},
    {221008,8},
    {221008,9},
    {221008,10},
    {221008,11},
    {221009,1},
    {221009,2},
    {221009,3},
    {221009,4},
    {221009,5},
    {221009,6},
    {221009,7},
    {221009,8},
    {221009,9},
    {221009,10},
    {221009,11},
    {221010,1},
    {221010,2},
    {221010,3},
    {221010,4},
    {221010,5},
    {221010,6},
    {221010,7},
    {221010,8},
    {221010,9},
    {221010,10},
    {221010,11},
    {221104,1},
    {221104,2},
    {221104,3},
    {221104,4},
    {221104,5},
    {221104,6},
    {221104,7},
    {221104,8},
    {221104,9},
    {221104,10},
    {221104,11},
    {221104,12},
    {221104,13},
    {221104,14},
    {221104,15},
    {221104,16},
    {221104,17},
    {221104,18},
    {221104,19},
    {221104,20},
    {221104,21},
    {221104,22},
    {221104,23},
    {221104,24},
    {221104,25},
    {222002,1},
    {222002,2},
    {222002,3},
    {222002,4},
    {222002,5},
    {222002,6},
    {222002,7},
    {222002,8},
    {222002,9},
    {222002,10},
    {222002,11},
    {222002,12},
    {222002,13},
    {222002,14},
    {222002,15},
    {222002,16},
    {222002,17},
    {222002,18},
    {222002,19},
    {222002,20},
    {222002,21},
    {222002,22},
    {222002,23},
    {222002,24},
    {222002,25},
    {222003,1},
    {222003,2},
    {222003,3},
    {222003,4},
    {222003,5},
    {222003,6},
    {222003,7},
    {222003,8},
    {222003,9},
    {222003,10},
    {222003,11},
    {222003,12},
    {222003,13},
    {222003,14},
    {222003,15},
    {222003,16},
    {222003,17},
    {222003,18},
    {222003,19},
    {222003,20},
    {222003,21},
    {222003,22},
    {222003,23},
    {222003,24},
    {222003,25},
    {222004,1},
    {222004,2},
    {222004,3},
    {222004,4},
    {222004,5},
    {222004,6},
    {222004,7},
    {222004,8},
    {222004,9},
    {222004,10},
    {222004,11},
    {222004,12},
    {222004,13},
    {222004,14},
    {222004,15},
    {222004,16},
    {222004,17},
    {222004,18},
    {222004,19},
    {222004,20},
    {222004,21},
    {222004,22},
    {222004,23},
    {222004,24},
    {222004,25},
    {222005,1},
    {222005,2},
    {222005,3},
    {222005,4},
    {222005,5},
    {222005,6},
    {222005,7},
    {222005,8},
    {222005,9},
    {222005,10},
    {222005,11},
    {222005,12},
    {222005,13},
    {222005,14},
    {222005,15},
    {222005,16},
    {222005,17},
    {222005,18},
    {222005,19},
    {222005,20},
    {222005,21},
    {222005,22},
    {222005,23},
    {222005,24},
    {222005,25},
    {222006,1},
    {222006,2},
    {222006,3},
    {222006,4},
    {222006,5},
    {222006,6},
    {222006,7},
    {222006,8},
    {222006,9},
    {222006,10},
    {222006,11},
    {222006,12},
    {222006,13},
    {222006,14},
    {222006,15},
    {222006,16},
    {222006,17},
    {222006,18},
    {222006,19},
    {222006,20},
    {222006,21},
    {222006,22},
    {222006,23},
    {222006,24},
    {222006,25},
    {222007,1},
    {222007,2},
    {222007,3},
    {222007,4},
    {222007,5},
    {222007,6},
    {222007,7},
    {222007,8},
    {222007,9},
    {222007,10},
    {222007,11},
    {222008,1},
    {222008,2},
    {222008,3},
    {222008,4},
    {222008,5},
    {222008,6},
    {222008,7},
    {222008,8},
    {222008,9},
    {222008,10},
    {222008,11},
    {222009,1},
    {222009,2},
    {222009,3},
    {222009,4},
    {222009,5},
    {222009,6},
    {222009,7},
    {222009,8},
    {222009,9},
    {222009,10},
    {222009,11},
    {223003,1},
    {223003,2},
    {223003,3},
    {223003,4},
    {223003,5},
    {223003,6},
    {223003,7},
    {223003,8},
    {223003,9},
    {223003,10},
    {223003,11},
    {223003,12},
    {223003,13},
    {223003,14},
    {223003,15},
    {223003,16},
    {223003,17},
    {223003,18},
    {223003,19},
    {223003,20},
    {223003,21},
    {223003,22},
    {223003,23},
    {223003,24},
    {223003,25},
    {223004,1},
    {223004,2},
    {223004,3},
    {223004,4},
    {223004,5},
    {223004,6},
    {223004,7},
    {223004,8},
    {223004,9},
    {223004,10},
    {223004,11},
    {223004,12},
    {223004,13},
    {223004,14},
    {223004,15},
    {223004,16},
    {223004,17},
    {223004,18},
    {223004,19},
    {223004,20},
    {223004,21},
    {223004,22},
    {223004,23},
    {223004,24},
    {223004,25},
    {223005,1},
    {223005,2},
    {223005,3},
    {223005,4},
    {223005,5},
    {223005,6},
    {223005,7},
    {223005,8},
    {223005,9},
    {223005,10},
    {223005,11},
    {223005,12},
    {223005,13},
    {223005,14},
    {223005,15},
    {223005,16},
    {223005,17},
    {223005,18},
    {223005,19},
    {223005,20},
    {223005,21},
    {223005,22},
    {223005,23},
    {223005,24},
    {223005,25},
    {223006,1},
    {223006,2},
    {223006,3},
    {223006,4},
    {223006,5},
    {223006,6},
    {223006,7},
    {223006,8},
    {223006,9},
    {223006,10},
    {223006,11},
    {223006,12},
    {223006,13},
    {223006,14},
    {223006,15},
    {223006,16},
    {223006,17},
    {223006,18},
    {223006,19},
    {223006,20},
    {223006,21},
    {223006,22},
    {223006,23},
    {223006,24},
    {223006,25},
    {223007,1},
    {223007,2},
    {223007,3},
    {223007,4},
    {223007,5},
    {223007,6},
    {223007,7},
    {223007,8},
    {223007,9},
    {223007,10},
    {223007,11},
    {223007,12},
    {223007,13},
    {223007,14},
    {223007,15},
    {223007,16},
    {223007,17},
    {223007,18},
    {223007,19},
    {223007,20},
    {223007,21},
    {223007,22},
    {223007,23},
    {223007,24},
    {223007,25},
    {223008,1},
    {223008,2},
    {223008,3},
    {223008,4},
    {223008,5},
    {223008,6},
    {223008,7},
    {223008,8},
    {223008,9},
    {223008,10},
    {223008,11},
    {223009,1},
    {223009,2},
    {223009,3},
    {223009,4},
    {223009,5},
    {223009,6},
    {223009,7},
    {223009,8},
    {223009,9},
    {223009,10},
    {223009,11},
    {223010,1},
    {223010,2},
    {223010,3},
    {223010,4},
    {223010,5},
    {223010,6},
    {223010,7},
    {223010,8},
    {223010,9},
    {223010,10},
    {223010,11},
    {301000,1},
    {301001,1},
    {301002,1},
    {301003,1},
    {301003,2},
    {301003,3},
    {301003,4},
    {301003,5},
    {301003,6},
    {301004,1},
    {301004,2},
    {301004,3},
    {301004,4},
    {301004,5},
    {301004,6},
    {301005,1},
    {301005,2},
    {301005,3},
    {301005,4},
    {301005,5},
    {301005,6},
    {301006,1},
    {301006,2},
    {301006,3},
    {301006,4},
    {301006,5},
    {301006,6},
    {311000,1},
    {311001,1},
    {311002,1},
    {311003,1},
    {311003,2},
    {311003,3},
    {311003,4},
    {311003,5},
    {311003,6},
    {311003,7},
    {311003,8},
    {311003,9},
    {311003,10},
    {311003,11},
    {311003,12},
    {311003,13},
    {311003,14},
    {311003,15},
    {311004,1},
    {311004,2},
    {311004,3},
    {311004,4},
    {311004,5},
    {311004,6},
    {311004,7},
    {311004,8},
    {311004,9},
    {311004,10},
    {311004,11},
    {311004,12},
    {311004,13},
    {311004,14},
    {311004,15},
    {311005,1},
    {311005,2},
    {311005,3},
    {311005,4},
    {311005,5},
    {311005,6},
    {311005,7},
    {311005,8},
    {311005,9},
    {311005,10},
    {311005,11},
    {311005,12},
    {311005,13},
    {311005,14},
    {311005,15},
    {311006,1},
    {311006,2},
    {311006,3},
    {311006,4},
    {311006,5},
    {311006,6},
    {311006,7},
    {311006,8},
    {311006,9},
    {311006,10},
    {311006,11},
    {311006,12},
    {311006,13},
    {311006,14},
    {311006,15},
    {311007,1},
    {311007,2},
    {311007,3},
    {311007,4},
    {311007,5},
    {311007,6},
    {311007,7},
    {311007,8},
    {311007,9},
    {311007,10},
    {311007,11},
    {311008,1},
    {311008,2},
    {311008,3},
    {311008,4},
    {311008,5},
    {311008,6},
    {311008,7},
    {311008,8},
    {311008,9},
    {311008,10},
    {311008,11},
    {311009,1},
    {311009,2},
    {311009,3},
    {311009,4},
    {311009,5},
    {311009,6},
    {311009,7},
    {311009,8},
    {311009,9},
    {311009,10},
    {311009,11},
    {311009,12},
    {311009,13},
    {311009,14},
    {311009,15},
    {312000,1},
    {312001,1},
    {312002,1},
    {312003,1},
    {312003,2},
    {312003,3},
    {312003,4},
    {312003,5},
    {312003,6},
    {312003,7},
    {312003,8},
    {312003,9},
    {312003,10},
    {312003,11},
    {312003,12},
    {312003,13},
    {312003,14},
    {312003,15},
    {312004,1},
    {312004,2},
    {312004,3},
    {312004,4},
    {312004,5},
    {312004,6},
    {312004,7},
    {312004,8},
    {312004,9},
    {312004,10},
    {312004,11},
    {312004,12},
    {312004,13},
    {312004,14},
    {312004,15},
    {312005,1},
    {312005,2},
    {312005,3},
    {312005,4},
    {312005,5},
    {312005,6},
    {312005,7},
    {312005,8},
    {312005,9},
    {312005,10},
    {312005,11},
    {312005,12},
    {312005,13},
    {312005,14},
    {312005,15},
    {312006,1},
    {312006,2},
    {312006,3},
    {312006,4},
    {312006,5},
    {312006,6},
    {312006,7},
    {312006,8},
    {312006,9},
    {312006,10},
    {312006,11},
    {312006,12},
    {312006,13},
    {312006,14},
    {312006,15},
    {312007,1},
    {312007,2},
    {312007,3},
    {312007,4},
    {312007,5},
    {312007,6},
    {312007,7},
    {312007,8},
    {312007,9},
    {312007,10},
    {312007,11},
    {312008,1},
    {312008,2},
    {312008,3},
    {312008,4},
    {312008,5},
    {312008,6},
    {312008,7},
    {312008,8},
    {312008,9},
    {312008,10},
    {312008,11},
    {312021,1},
    {312021,2},
    {312021,3},
    {312021,4},
    {312021,5},
    {312021,6},
    {312021,7},
    {312021,8},
    {312021,9},
    {312021,10},
    {312021,11},
    {312021,12},
    {312021,13},
    {312021,14},
    {312021,15},
    {321003,1},
    {321003,2},
    {321003,3},
    {321003,4},
    {321003,5},
    {321003,6},
    {321003,7},
    {321003,8},
    {321003,9},
    {321003,10},
    {321003,11},
    {321003,12},
    {321003,13},
    {321003,14},
    {321003,15},
    {321003,16},
    {321003,17},
    {321003,18},
    {321003,19},
    {321003,20},
    {321003,21},
    {321003,22},
    {321003,23},
    {321003,24},
    {321003,25},
    {321004,1},
    {321004,2},
    {321004,3},
    {321004,4},
    {321004,5},
    {321004,6},
    {321004,7},
    {321004,8},
    {321004,9},
    {321004,10},
    {321004,11},
    {321004,12},
    {321004,13},
    {321004,14},
    {321004,15},
    {321004,16},
    {321004,17},
    {321004,18},
    {321004,19},
    {321004,20},
    {321004,21},
    {321004,22},
    {321004,23},
    {321004,24},
    {321004,25},
    {321005,1},
    {321005,2},
    {321005,3},
    {321005,4},
    {321005,5},
    {321005,6},
    {321005,7},
    {321005,8},
    {321005,9},
    {321005,10},
    {321005,11},
    {321005,12},
    {321005,13},
    {321005,14},
    {321005,15},
    {321005,16},
    {321005,17},
    {321005,18},
    {321005,19},
    {321005,20},
    {321005,21},
    {321005,22},
    {321005,23},
    {321005,24},
    {321005,25},
    {321006,1},
    {321006,2},
    {321006,3},
    {321006,4},
    {321006,5},
    {321006,6},
    {321006,7},
    {321006,8},
    {321006,9},
    {321006,10},
    {321006,11},
    {321006,12},
    {321006,13},
    {321006,14},
    {321006,15},
    {321006,16},
    {321006,17},
    {321006,18},
    {321006,19},
    {321006,20},
    {321006,21},
    {321006,22},
    {321006,23},
    {321006,24},
    {321006,25},
    {321007,1},
    {321007,2},
    {321007,3},
    {321007,4},
    {321007,5},
    {321007,6},
    {321007,7},
    {321007,8},
    {321007,9},
    {321007,10},
    {321007,11},
    {321007,12},
    {321007,13},
    {321007,14},
    {321007,15},
    {321007,16},
    {321007,17},
    {321007,18},
    {321007,19},
    {321007,20},
    {321007,21},
    {321007,22},
    {321007,23},
    {321007,24},
    {321007,25},
    {321008,1},
    {321008,2},
    {321008,3},
    {321008,4},
    {321008,5},
    {321008,6},
    {321008,7},
    {321008,8},
    {321008,9},
    {321008,10},
    {321008,11},
    {321008,12},
    {321008,13},
    {321008,14},
    {321008,15},
    {321008,16},
    {321008,17},
    {321008,18},
    {321008,19},
    {321008,20},
    {321008,21},
    {321008,22},
    {321008,23},
    {321008,24},
    {321008,25},
    {321009,1},
    {321009,2},
    {321009,3},
    {321009,4},
    {321009,5},
    {321009,6},
    {321009,7},
    {321009,8},
    {321009,9},
    {321009,10},
    {321009,11},
    {321010,1},
    {321010,2},
    {321010,3},
    {321010,4},
    {321010,5},
    {321010,6},
    {321010,7},
    {321010,8},
    {321010,9},
    {321010,10},
    {321010,11},
    {322004,1},
    {322004,2},
    {322004,3},
    {322004,4},
    {322004,5},
    {322004,6},
    {322004,7},
    {322004,8},
    {322004,9},
    {322004,10},
    {322004,11},
    {322004,12},
    {322004,13},
    {322004,14},
    {322004,15},
    {322004,16},
    {322004,17},
    {322004,18},
    {322004,19},
    {322004,20},
    {322004,21},
    {322004,22},
    {322004,23},
    {322004,24},
    {322004,25},
    {322005,1},
    {322005,2},
    {322005,3},
    {322005,4},
    {322005,5},
    {322005,6},
    {322005,7},
    {322005,8},
    {322005,9},
    {322005,10},
    {322005,11},
    {322005,12},
    {322005,13},
    {322005,14},
    {322005,15},
    {322005,16},
    {322005,17},
    {322005,18},
    {322005,19},
    {322005,20},
    {322005,21},
    {322005,22},
    {322005,23},
    {322005,24},
    {322005,25},
    {322006,1},
    {322006,2},
    {322006,3},
    {322006,4},
    {322006,5},
    {322006,6},
    {322006,7},
    {322006,8},
    {322006,9},
    {322006,10},
    {322006,11},
    {322006,12},
    {322006,13},
    {322006,14},
    {322006,15},
    {322006,16},
    {322006,17},
    {322006,18},
    {322006,19},
    {322006,20},
    {322006,21},
    {322006,22},
    {322006,23},
    {322006,24},
    {322006,25},
    {322007,1},
    {322007,2},
    {322007,3},
    {322007,4},
    {322007,5},
    {322007,6},
    {322007,7},
    {322007,8},
    {322007,9},
    {322007,10},
    {322007,11},
    {322007,12},
    {322007,13},
    {322007,14},
    {322007,15},
    {322007,16},
    {322007,17},
    {322007,18},
    {322007,19},
    {322007,20},
    {322007,21},
    {322007,22},
    {322007,23},
    {322007,24},
    {322007,25},
    {322008,1},
    {322008,2},
    {322008,3},
    {322008,4},
    {322008,5},
    {322008,6},
    {322008,7},
    {322008,8},
    {322008,9},
    {322008,10},
    {322008,11},
    {322008,12},
    {322008,13},
    {322008,14},
    {322008,15},
    {322008,16},
    {322008,17},
    {322008,18},
    {322008,19},
    {322008,20},
    {322008,21},
    {322008,22},
    {322008,23},
    {322008,24},
    {322008,25},
    {322009,1},
    {322009,2},
    {322009,3},
    {322009,4},
    {322009,5},
    {322009,6},
    {322009,7},
    {322009,8},
    {322009,9},
    {322009,10},
    {322009,11},
    {322010,1},
    {322010,2},
    {322010,3},
    {322010,4},
    {322010,5},
    {322010,6},
    {322010,7},
    {322010,8},
    {322010,9},
    {322010,10},
    {322010,11},
    {322011,1},
    {322011,2},
    {322011,3},
    {322011,4},
    {322011,5},
    {322011,6},
    {322011,7},
    {322011,8},
    {322011,9},
    {322011,10},
    {322011,11},
    {323004,1},
    {323004,2},
    {323004,3},
    {323004,4},
    {323004,5},
    {323004,6},
    {323004,7},
    {323004,8},
    {323004,9},
    {323004,10},
    {323004,11},
    {323004,12},
    {323004,13},
    {323004,14},
    {323004,15},
    {323004,16},
    {323004,17},
    {323004,18},
    {323004,19},
    {323004,20},
    {323004,21},
    {323004,22},
    {323004,23},
    {323004,24},
    {323004,25},
    {323005,1},
    {323005,2},
    {323005,3},
    {323005,4},
    {323005,5},
    {323005,6},
    {323005,7},
    {323005,8},
    {323005,9},
    {323005,10},
    {323005,11},
    {323005,12},
    {323005,13},
    {323005,14},
    {323005,15},
    {323005,16},
    {323005,17},
    {323005,18},
    {323005,19},
    {323005,20},
    {323005,21},
    {323005,22},
    {323005,23},
    {323005,24},
    {323005,25},
    {323006,1},
    {323006,2},
    {323006,3},
    {323006,4},
    {323006,5},
    {323006,6},
    {323006,7},
    {323006,8},
    {323006,9},
    {323006,10},
    {323006,11},
    {323006,12},
    {323006,13},
    {323006,14},
    {323006,15},
    {323006,16},
    {323006,17},
    {323006,18},
    {323006,19},
    {323006,20},
    {323006,21},
    {323006,22},
    {323006,23},
    {323006,24},
    {323006,25},
    {323007,1},
    {323007,2},
    {323007,3},
    {323007,4},
    {323007,5},
    {323007,6},
    {323007,7},
    {323007,8},
    {323007,9},
    {323007,10},
    {323007,11},
    {323007,12},
    {323007,13},
    {323007,14},
    {323007,15},
    {323007,16},
    {323007,17},
    {323007,18},
    {323007,19},
    {323007,20},
    {323007,21},
    {323007,22},
    {323007,23},
    {323007,24},
    {323007,25},
    {323008,1},
    {323008,2},
    {323008,3},
    {323008,4},
    {323008,5},
    {323008,6},
    {323008,7},
    {323008,8},
    {323008,9},
    {323008,10},
    {323008,11},
    {323008,12},
    {323008,13},
    {323008,14},
    {323008,15},
    {323008,16},
    {323008,17},
    {323008,18},
    {323008,19},
    {323008,20},
    {323008,21},
    {323008,22},
    {323008,23},
    {323008,24},
    {323008,25},
    {323009,1},
    {323009,2},
    {323009,3},
    {323009,4},
    {323009,5},
    {323009,6},
    {323009,7},
    {323009,8},
    {323009,9},
    {323009,10},
    {323009,11},
    {323010,1},
    {323010,2},
    {323010,3},
    {323010,4},
    {323010,5},
    {323010,6},
    {323010,7},
    {323010,8},
    {323010,9},
    {323010,10},
    {323010,11},
    {323011,1},
    {323011,2},
    {323011,3},
    {323011,4},
    {323011,5},
    {323011,6},
    {323011,7},
    {323011,8},
    {323011,9},
    {323011,10},
    {323011,11}
    ].

get1KeyList()->[
    101000,
    101001,
    101002,
    101003,
    101004,
    101005,
    101006,
    111000,
    111001,
    111002,
    111003,
    111004,
    111005,
    111006,
    111007,
    111008,
    111020,
    112000,
    112001,
    112002,
    112003,
    112004,
    112005,
    112006,
    112007,
    112008,
    112020,
    121004,
    121005,
    121006,
    121007,
    121008,
    121009,
    121010,
    121011,
    122005,
    122006,
    122007,
    122008,
    122009,
    122010,
    122011,
    122012,
    123004,
    123005,
    123006,
    123007,
    123008,
    123009,
    123010,
    123011,
    201000,
    201002,
    201003,
    201004,
    201005,
    201006,
    201007,
    211000,
    211001,
    211002,
    211003,
    211004,
    211005,
    211007,
    211008,
    211009,
    211013,
    211020,
    212000,
    212001,
    212002,
    212003,
    212004,
    212005,
    212006,
    212007,
    212008,
    212009,
    221003,
    221004,
    221005,
    221006,
    221007,
    221008,
    221009,
    221010,
    221104,
    222002,
    222003,
    222004,
    222005,
    222006,
    222007,
    222008,
    222009,
    223003,
    223004,
    223005,
    223006,
    223007,
    223008,
    223009,
    223010,
    301000,
    301001,
    301002,
    301003,
    301004,
    301005,
    301006,
    311000,
    311001,
    311002,
    311003,
    311004,
    311005,
    311006,
    311007,
    311008,
    311009,
    312000,
    312001,
    312002,
    312003,
    312004,
    312005,
    312006,
    312007,
    312008,
    312021,
    321003,
    321004,
    321005,
    321006,
    321007,
    321008,
    321009,
    321010,
    322004,
    322005,
    322006,
    322007,
    322008,
    322009,
    322010,
    322011,
    323004,
    323005,
    323006,
    323007,
    323008,
    323009,
    323010,
    323011
    ].

get2KeyList(101000)->[
    1
    ];
get2KeyList(101001)->[
    1
    ];
get2KeyList(101002)->[
    1
    ];
get2KeyList(101003)->[
    1,
    2,
    3,
    4,
    5,
    6
    ];
get2KeyList(101004)->[
    1,
    2,
    3,
    4,
    5,
    6
    ];
get2KeyList(101005)->[
    1,
    2,
    3,
    4,
    5,
    6
    ];
get2KeyList(101006)->[
    1,
    2,
    3,
    4,
    5,
    6
    ];
get2KeyList(111000)->[
    1
    ];
get2KeyList(111001)->[
    1
    ];
get2KeyList(111002)->[
    1
    ];
get2KeyList(111003)->[
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
    15
    ];
get2KeyList(111004)->[
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
    15
    ];
get2KeyList(111005)->[
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
    15
    ];
get2KeyList(111006)->[
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
    15
    ];
get2KeyList(111007)->[
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
get2KeyList(111008)->[
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
get2KeyList(111020)->[
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
get2KeyList(112000)->[
    1
    ];
get2KeyList(112001)->[
    1
    ];
get2KeyList(112002)->[
    1
    ];
get2KeyList(112003)->[
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
    15
    ];
get2KeyList(112004)->[
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
    15
    ];
get2KeyList(112005)->[
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
    15
    ];
get2KeyList(112006)->[
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
    15
    ];
get2KeyList(112007)->[
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
get2KeyList(112008)->[
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
get2KeyList(112020)->[
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
    15
    ];
get2KeyList(121004)->[
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
    25
    ];
get2KeyList(121005)->[
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
    25
    ];
get2KeyList(121006)->[
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
    25
    ];
get2KeyList(121007)->[
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
    25
    ];
get2KeyList(121008)->[
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
    25
    ];
get2KeyList(121009)->[
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
get2KeyList(121010)->[
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
get2KeyList(121011)->[
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
get2KeyList(122005)->[
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
    25
    ];
get2KeyList(122006)->[
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
    25
    ];
get2KeyList(122007)->[
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
    25
    ];
get2KeyList(122008)->[
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
    25
    ];
get2KeyList(122009)->[
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
    25
    ];
get2KeyList(122010)->[
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
get2KeyList(122011)->[
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
get2KeyList(122012)->[
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
get2KeyList(123004)->[
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
    25
    ];
get2KeyList(123005)->[
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
    25
    ];
get2KeyList(123006)->[
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
    25
    ];
get2KeyList(123007)->[
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
    25
    ];
get2KeyList(123008)->[
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
    25
    ];
get2KeyList(123009)->[
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
get2KeyList(123010)->[
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
get2KeyList(123011)->[
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
get2KeyList(201000)->[
    1
    ];
get2KeyList(201002)->[
    1
    ];
get2KeyList(201003)->[
    1,
    2,
    3,
    4,
    5,
    6
    ];
get2KeyList(201004)->[
    1,
    2,
    3,
    4,
    5,
    6
    ];
get2KeyList(201005)->[
    1,
    2,
    3,
    4,
    5,
    6
    ];
get2KeyList(201006)->[
    1,
    2,
    3,
    4,
    5,
    6
    ];
get2KeyList(201007)->[
    1
    ];
get2KeyList(211000)->[
    1
    ];
get2KeyList(211001)->[
    1
    ];
get2KeyList(211002)->[
    1
    ];
get2KeyList(211003)->[
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
    15
    ];
get2KeyList(211004)->[
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
    15
    ];
get2KeyList(211005)->[
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
    15
    ];
get2KeyList(211007)->[
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
    15
    ];
get2KeyList(211008)->[
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
get2KeyList(211009)->[
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
get2KeyList(211013)->[
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
get2KeyList(211020)->[
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
    15
    ];
get2KeyList(212000)->[
    1
    ];
get2KeyList(212001)->[
    1
    ];
get2KeyList(212002)->[
    1
    ];
get2KeyList(212003)->[
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
    15
    ];
get2KeyList(212004)->[
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
    15
    ];
get2KeyList(212005)->[
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
    15
    ];
get2KeyList(212006)->[
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
    15
    ];
get2KeyList(212007)->[
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
get2KeyList(212008)->[
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
get2KeyList(212009)->[
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
    15
    ];
get2KeyList(221003)->[
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
    25
    ];
get2KeyList(221004)->[
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
    25
    ];
get2KeyList(221005)->[
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
    25
    ];
get2KeyList(221006)->[
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
    25
    ];
get2KeyList(221007)->[
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
    25
    ];
get2KeyList(221008)->[
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
get2KeyList(221009)->[
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
get2KeyList(221010)->[
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
get2KeyList(221104)->[
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
    25
    ];
get2KeyList(222002)->[
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
    25
    ];
get2KeyList(222003)->[
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
    25
    ];
get2KeyList(222004)->[
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
    25
    ];
get2KeyList(222005)->[
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
    25
    ];
get2KeyList(222006)->[
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
    25
    ];
get2KeyList(222007)->[
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
get2KeyList(222008)->[
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
get2KeyList(222009)->[
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
get2KeyList(223003)->[
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
    25
    ];
get2KeyList(223004)->[
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
    25
    ];
get2KeyList(223005)->[
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
    25
    ];
get2KeyList(223006)->[
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
    25
    ];
get2KeyList(223007)->[
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
    25
    ];
get2KeyList(223008)->[
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
get2KeyList(223009)->[
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
get2KeyList(223010)->[
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
get2KeyList(301000)->[
    1
    ];
get2KeyList(301001)->[
    1
    ];
get2KeyList(301002)->[
    1
    ];
get2KeyList(301003)->[
    1,
    2,
    3,
    4,
    5,
    6
    ];
get2KeyList(301004)->[
    1,
    2,
    3,
    4,
    5,
    6
    ];
get2KeyList(301005)->[
    1,
    2,
    3,
    4,
    5,
    6
    ];
get2KeyList(301006)->[
    1,
    2,
    3,
    4,
    5,
    6
    ];
get2KeyList(311000)->[
    1
    ];
get2KeyList(311001)->[
    1
    ];
get2KeyList(311002)->[
    1
    ];
get2KeyList(311003)->[
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
    15
    ];
get2KeyList(311004)->[
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
    15
    ];
get2KeyList(311005)->[
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
    15
    ];
get2KeyList(311006)->[
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
    15
    ];
get2KeyList(311007)->[
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
get2KeyList(311008)->[
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
get2KeyList(311009)->[
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
    15
    ];
get2KeyList(312000)->[
    1
    ];
get2KeyList(312001)->[
    1
    ];
get2KeyList(312002)->[
    1
    ];
get2KeyList(312003)->[
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
    15
    ];
get2KeyList(312004)->[
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
    15
    ];
get2KeyList(312005)->[
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
    15
    ];
get2KeyList(312006)->[
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
    15
    ];
get2KeyList(312007)->[
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
get2KeyList(312008)->[
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
get2KeyList(312021)->[
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
    15
    ];
get2KeyList(321003)->[
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
    25
    ];
get2KeyList(321004)->[
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
    25
    ];
get2KeyList(321005)->[
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
    25
    ];
get2KeyList(321006)->[
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
    25
    ];
get2KeyList(321007)->[
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
    25
    ];
get2KeyList(321008)->[
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
    25
    ];
get2KeyList(321009)->[
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
get2KeyList(321010)->[
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
get2KeyList(322004)->[
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
    25
    ];
get2KeyList(322005)->[
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
    25
    ];
get2KeyList(322006)->[
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
    25
    ];
get2KeyList(322007)->[
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
    25
    ];
get2KeyList(322008)->[
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
    25
    ];
get2KeyList(322009)->[
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
get2KeyList(322010)->[
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
get2KeyList(322011)->[
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
get2KeyList(323004)->[
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
    25
    ];
get2KeyList(323005)->[
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
    25
    ];
get2KeyList(323006)->[
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
    25
    ];
get2KeyList(323007)->[
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
    25
    ];
get2KeyList(323008)->[
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
    25
    ];
get2KeyList(323009)->[
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
get2KeyList(323010)->[
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
get2KeyList(323011)->[
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

