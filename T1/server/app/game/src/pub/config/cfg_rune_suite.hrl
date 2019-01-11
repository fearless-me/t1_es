%%: 声明
-ifndef(cfg_rune_suite).
-define(cfg_rune_suite, 1).

-record(rune_suiteCfg, {
        %%: 套装属性组id，同id为1组
        id,

        %%: 几件套
        num,

        rune_suite_name,

        %%: 符文套装属性：
        %%: {[属性id，属性值，加法或乘法]}
        property,

        %%: 描述策划看
        dec,

        %%: Administrator:
        %%: 假战斗力系数
        addpower

 }).

-endif.