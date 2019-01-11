%%: 声明
-ifndef(cfg_home_zoo).
-define(cfg_home_zoo, 1).

-record(home_zooCfg, {
        %%: Wangshiyu:
        %%: 配置精灵球的道具id
        zoo_item,

        %%: 每分钟经验
        exp_permin,

        %%: 单只宠物每天最大喂养分钟
        maxmin

 }).

-endif.