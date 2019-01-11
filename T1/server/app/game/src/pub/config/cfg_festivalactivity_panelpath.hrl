%%: 声明
-ifndef(cfg_festivalactivity_panelpath).
-define(cfg_festivalactivity_panelpath, 1).

-record(festivalactivity_panelpathCfg, {
        %%: 节日活动id
        id,

        %%: 资源路径
        path,

        %%: 资源名称
        name

 }).

-endif.