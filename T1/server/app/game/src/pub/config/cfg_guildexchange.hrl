%%: 声明
-ifndef(cfg_guildexchange).
-define(cfg_guildexchange, 1).

-record(guildexchangeCfg, {
        id,

        %%: 作者:
        %%: 属性等级
        level,

        icon,

        %%: 作者:
        %%: 属性加成{0加法，1乘法，属性类型，属性值}
        property,

        %%: 作者:
        %%: 解锁家族等级
        %%: 大于或等于level
        %%: 新增：（luoch)
        %%: 服务器仅做学习技能时等级判定使用。触发不使用（即退家族也触发技能效果）。
        guildlevel,

        %%: 作者:
        %%: 消耗军贡
        cost,

        %%: user:
        %%: 技能名称
        name,

        %%: user:
        %%: 技能描述
        describe,

        %%: user:
        %%: 技能描述里面的伤害值，显示用
        character_a,

        %%: user:
        %%: 技能描述里面的buff值，显示用
        character_b,

        %%: user:
        %%: 技能描述里面的时间值，显示用
        character_c

 }).

-endif.