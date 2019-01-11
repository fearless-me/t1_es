%%: 声明
-ifndef(cfg_vip_card_effect).
-define(cfg_vip_card_effect, 1).

-record(vip_card_effectCfg, {
        %%: 特權卡對應ID
        vip_card_id,

        %%: 顯示ID（用戶端用）
        effect_id,

        %%: 功能ID（伺服器用）
        %%: 服务器提供，约定ID
        function_id,

        %%: 功能描述
        des,

        %%: 參數1
        %%: 次数
        param1,

        %%: 參數2
        %%: function_id = 1 时
        %%: 对应的为mapsetting 的id。
        param2,

        %%: 參數3
        %%: 预留，未使用
        param3,

        %%: 是否將次數拼接進去顯示
        %%: 客户端显示
        is_num_show

 }).

-endif.