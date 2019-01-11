%%: 声明
-ifndef(cfg_gembox_info).
-define(cfg_gembox_info, 1).

-record(gembox_infoCfg, {
        %%: 装备部位
        type,

        %%: 孔id
        id,

        %%: 纹章孔开启的等级限制（装备的穿戴等级）
        level,

        %%: 颜色
        color

 }).

-endif.