%%: 声明
-ifndef(cfg_festivalactivity_drop).
-define(cfg_festivalactivity_drop, 1).

-record(festivalactivity_dropCfg, {
        %%: ID
        id,

        %%: 作者:
        %%: festivalactivity_config表节日id
        festivalid,

        %%: 作者:
        %%: mapsetting表id
        mapid,

        %%: 作者:
        %%: 配置drop表id
        dropid

 }).

-endif.