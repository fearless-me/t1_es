%%: 声明
-ifndef(cfg_offstringingame).
-define(cfg_offstringingame, 1).

-record(offstringingameCfg, {
        id,

        %%: 注：当屏蔽字中包含关系时，会只屏蔽id小的屏蔽字，所以长度长的屏蔽字放在前面（小id）
        offstring

 }).

-endif.