%%: 声明
-ifndef(cfg_passive_skill_group).
-define(cfg_passive_skill_group, 1).

-record(passive_skill_groupCfg, {
        %%: id
        id,

        %%: 作者:
        %%: 升级到当前级的货币消耗，前值类型，后值消耗量
        name,

        %%: 包含
        includeskills

 }).

-endif.