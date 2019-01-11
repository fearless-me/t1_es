%%: 声明
-ifndef(cfg_rune_skillenha).
-define(cfg_rune_skillenha, 1).

-record(rune_skillenhaCfg, {
        %%: 增强技能组id
        skillenha_group_id,

        %%: 圣物能随到的技能组
        %%: [{组号，技能id},{}]
        %%: 每两组一个整体，一组存攻击型技能，一组存buff型技能
        skillID,

        equipLevel,

        quality,

        %%: 附加等级最小值
        addLv_min,

        %%: 附加等级最大值
        addLv_max

 }).

-endif.