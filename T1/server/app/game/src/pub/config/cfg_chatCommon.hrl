%%: 声明
-ifndef(cfg_chatCommon).
-define(cfg_chatCommon, 1).

-record(chatCommonCfg, {
        %%: ID
        id,

        %%: 句子
        sentence

 }).

-endif.