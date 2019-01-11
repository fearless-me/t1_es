%%: 声明
-ifndef(cfg_monster_filekey).
-define(cfg_monster_filekey, 1).

-record(monster_filekeyCfg, {
        %%: 引用monster表
        monster_id,

        %%: 引用monster_file表
        file_id

 }).

-endif.