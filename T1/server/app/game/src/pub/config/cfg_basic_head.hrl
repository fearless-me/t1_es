%%: 声明
-ifndef(cfg_basic_head).
-define(cfg_basic_head, 1).

-record(basic_headCfg, {
        %%: ID
        id,

        %%: [AB路径,…]
        %%: AB
        %%: A种族 1-人族 2精灵 3魔族
        %%: B性别 0-女性 1男性
        %%: 路径：login_1
        icon,

        %%: 用在创角换头时的图标
        icon_for_creat,

        %%: [AB路径,...]
        %%: AB
        %%: A种族 1-人族 2精灵 3魔族
        %%: B性别 0-女性 1男性
        model

 }).

-endif.