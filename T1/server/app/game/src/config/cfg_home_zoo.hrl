%%: 声明
-ifndef(cfg_home_zoo).
-define(cfg_home_zoo, 1).

-record(home_zooCfg, {
        %%: Wangshiyu:
        %%: 配置精灵球的道具id
        zoo_item,

        exp_permin,

        maxmin

 }).

-endif.