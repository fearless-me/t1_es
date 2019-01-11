%%: 声明
-ifndef(cfg_rune_function).
-define(cfg_rune_function, 1).

-record(rune_functionCfg, {
        equipLevel,

        quality,

        fusecostnor,

        fusecost,

        transcost,

        meltcost,

        rune_probnor,

        rune_prob

 }).

-endif.