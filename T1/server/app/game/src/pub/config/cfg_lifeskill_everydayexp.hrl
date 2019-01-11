%%: 声明
-ifndef(cfg_lifeskill_everydayexp).
-define(cfg_lifeskill_everydayexp, 1).

-record(lifeskill_everydayexpCfg, {
        %%: 生活技能总等级和
        level_sum,

        %%: 每天经验上限
        everydayexp_up

 }).

-endif.