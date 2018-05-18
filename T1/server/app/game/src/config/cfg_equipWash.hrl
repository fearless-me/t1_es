%%: 声明
-ifndef(cfg_equipWash).
-define(cfg_equipWash, 1).

-record(equipWashCfg, {
        equipLevel,

        equipQuality,

        valueKind,

        valueMin,

        valueMax,

        valueDown,

        valueUp,

        breakUpPara

 }).

-endif.