%%: 声明
-ifndef(cfg_pet_skills_upgrading).
-define(cfg_pet_skills_upgrading, 1).

-record(pet_skills_upgradingCfg, {
        %%: 技能的ID
        skill_id,

        %%: 技能等级
        %%: 技能等级为1时的限制与技能解锁相关。
        level,

        %%: 达到该等级需要的道具消耗
        item_cost,

        %%: 到达该等级需要的货币消耗
        coin_cost,

        %%: 升到该等级的骑宠星级限制
        star_limit,

        %%: 升到该等级的骑宠转生等级限制
        reborn_limit,

        %%: 升到该等级的角色等级限制
        level_limit,

        %%: 该等级的技能描述。会出现在骑宠技能界面上
        des,

        %%: 技能描述里面的伤害值，显示用
        character_a,

        %%: 技能描述里面的buff值，显示用
        character_b,

        %%: 技能描述里面的时间值，显示用
        character_c,

        %%: 技能给骑宠自身增加的战力，逐行替换
        fightForce

 }).

-endif.