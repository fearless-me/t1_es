%%: 声明
-ifndef(cfg_passive_skill).
-define(cfg_passive_skill, 1).

-record(passive_skillCfg, {
        %%: id
        id,

        %%: 等级
        level,

        %%: 图标
        iconid,

        %%: 名字 
        name,

        %%: 属性类型，加法值，乘法值
        prop,

        %%: Windows 用户:
        %%: 触发技能的ID和概率
        %%: 概率的单位是百分比
        %%: 允许有多个触发技能
        triggerskill_prob,

        %%: 姜泓妃:
        %%: 角色等级限制
        level_limit,

        %%: Windows 用户:
        %%: 升级条件是：别的被动技能a必须达到b等级
        otherid_limit,

        %%: Windows 用户:
        %%: 如果消耗了角色经验，就不能填道具了！！！
        %%: 填了也不生效！！
        cost_exp,

        %%: Windows 用户:
        %%: [a,b]a是itemid b是数量
        cost_item,

        %%: Windows 用户:
        %%: 【[a,b]a是货币使用类型 b是数量
        cost_coin,

        %%: Windows 用户:
        %%: 客户端用的。一共16个槽，这个编号决定排在哪
        sort_mark,

        %%: 描述
        describe,

        %%: 技能描述里面的伤害值，显示用
        character_a,

        %%: 技能描述里面的buff值，显示用
        character_b,

        %%: 技能描述里面的时间值，显示用
        character_c

 }).

-endif.