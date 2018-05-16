%%: 声明
-ifndef(cfg_gembox_info).
-define(cfg_gembox_info, 1).

-record(gembox_infoCfg, {
        type,

        id,

        %%: 纹章孔开启的等级限制（装备的穿戴等级）
        level,

        color

 }).

-endif.