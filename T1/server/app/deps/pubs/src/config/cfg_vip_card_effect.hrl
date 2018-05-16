%%: 声明
-ifndef(cfg_vip_card_effect).
-define(cfg_vip_card_effect, 1).

-record(vip_card_effectCfg, {
        vip_card_id,

        effect_id,

        function_id,

        des,

        param1,

        param2,

        param3,

        is_num_show

 }).

-endif.