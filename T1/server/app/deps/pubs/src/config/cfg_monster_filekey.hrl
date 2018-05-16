%%: 声明
-ifndef(cfg_monster_filekey).
-define(cfg_monster_filekey, 1).

-record(monster_filekeyCfg, {
        monster_id,

        file_id

 }).

-endif.