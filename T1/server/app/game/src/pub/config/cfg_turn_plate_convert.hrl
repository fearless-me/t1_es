%%: 声明
-ifndef(cfg_turn_plate_convert).
-define(cfg_turn_plate_convert, 1).

-record(turn_plate_convertCfg, {
        convertType,

        quality,

        isConvert,

        convertRewardType,

        typeValue

 }).

-endif.